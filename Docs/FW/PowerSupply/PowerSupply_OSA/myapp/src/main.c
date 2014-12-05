#include "config.h"
#include "ADE7758.h"
#include "util.h"
#include "rs485.h"
//#include "pt.h"

/*
* add os header files
*/
#include "OSA.h"


__CONFIG ( FOSC_INTOSC & CLKOUTEN_OFF & WDTE_ON & PLLEN_ON & MCLRE_OFF & PLLEN_ON & WRT_OFF & FCMEN_OFF & STVREN_OFF & BOREN_OFF) ;

static volatile bit Sample_flag;
static volatile bit AbnorProcFlag = 0;
static unsigned short gs50msCnt = 0;
extern uchar gucDevAddr;
//uint os_tick=0;

extern uchar ReadData[3];
extern uchar SendData[3];

extern SLIP_RECV gstSLIPRecv;
extern SLIP_SENT gstSLIPSend;

extern ADE7758_D ADE7758Data[2];

static void vmemset(void * p1, int c, int n)
{
	char *p;

	p = p1;
	while(n--)
		*p++ = c;
	//return p1;
}

static void Initialize (void)
{
	
	GIE=0; //Disable Interruption
	OSCCON = 0x68;	//Oscillator Control Registers	01101000 4MHz
	while(!HFIOFR)
	{; } //Wait untill internal OSC stable

	ANSELA = 0x10;	//RA7-0   0->digital 1->analog
	PORTA  = 0;

	TRISA7 = 0;		//RA7 -> output 	0->output 1->input
	TRISA6 = 0;
	TRISA4 = 1;		//RA4-0 -> input 
	TRISA3 = 1;
	TRISA2 = 1;
	TRISA1 = 1;	
	TRISA0 = 1;	

	ANSELB = 0x00;	//RB7-0   0->digital 1->analog	
	TRISB0 = 0;			//0->output 1->input
	TRISB1 = 1;	
	TRISB2 = 1;	
	TRISB3 = 0;	
	TRISB4 = 0;	
	TRISB5 = 0;	
	TRISB6 = 0;	
	TRISB7 = 1;
	WPUB = 0B11111111;	//pull-up of port B

	/*ADC init*/
	ADCON1=0xC0;            // right adjusted, Fosc/4, Vref- to VSS, Vref+ to VDD
	
	/*PORT AFCON*/
	RXDTSEL = 1; /*1 = RX/DT function is on RB2*/
	TXCKSEL = 1; /*1 = TX/CK function is on RB5*/
	SDO1SEL = 1; /*1 = SDO1 function is on RA6*/

	/*UART init*/
	/*TX*/
	SYNC = 0;
	BRGH = 1;
	BRG16 = 1;
	SPBRGH = 0X00;
	SPBRGL = 0X33;			//19200	= FOSC/4(n+1)  n= 51  38400 n=25 //SPBRGL = 0X19;
					
	SYNC = 0;
	SPEN = 1;
	TX9 = 0;					//ASYNC 8BIT-MODE	
	SCKP = 0;				//0 = Transmit non-inverted data to the TX/CK pin	
	TXEN = 1;				//ENABLE TX
	RCIE = 1;
	RX9 = 0;
	CREN = 1;		
	/*TIMER0*/
	OPTION_REG &= 0B01000111; // 1:256
	TMR0IE = 1;
	TMR0IF = 0;
	TMR0 = 	61;		/*50ms: (2^8 - TMR0) * 256(Pref) * 1us = 50,000us */

#ifdef _OS_TIEMR
	/***************************************************************************/
	/* Timer 1 used by OS*/
	//Configure Timer 1
	T1CONbits.TMR1CS = 0;		//Timer 1 source is Fosc/4
	T1CONbits.T1CKPS0 = 1;		//Prescaler bit for Timer 1 1:8 prescale
	T1CONbits.T1CKPS1 = 1;		//Prescaler bit for Timer 1 1:8 prescale==>1MHz
	TMR1GE = 0;					//Timer1 counts regardless of Timer1 gate function
	TMR1H=0x4E;
	TMR1L=0x20;					//1/1M*20000=20ms
	TMR1ON=1;    				//Start Timer 1
	TMR1IF=0; 					//Clear Interruption flag
	TMR1IE=1; 					//Enable Timer 1 Interrupt
	/****************************************************************************/
	TXIE = 0;
#endif

	/*WDT*/
	WDTCONbits.WDTPS = 0B01010;	// 1S

	gstSLIPRecv.ucRecingState = SLIP_IDLE;
	gstSLIPSend.ucSendingState = SLIP_IDLE;
	vmemset((void*)ADE7758Data, 0, sizeof(ADE7758Data));
		
	PEIE = 1;
	GIE = 1;
}

static void SPI_Init(void)
{
	/*SPI*/
	SSP1CON1bits.SSPEN=0; 
	//CKP=0; //空闲状态时，时钟为低电�?//SSP1CON1bits.SSPM=0B0000; //SPI主模式，时钟 = FOSC/16 Expecting 250KHz
	SSP1CON1bits.SSPM0 = 0;		// ssp master mode clock = Fosc /(4*(SSPxADD+1))  500K
	SSP1CON1bits.SSPM1 = 1;
	SSP1CON1bits.SSPM2 = 0;
	SSP1CON1bits.SSPM3 = 1;
	SSP1ADD = 3;

	SSP2STATbits.SMP=1; 			// 1 = 在数据输出时间的末端采样输入数据
       								//0 = 在数据输出时间的中间采样输入数据
	SSP2STATbits.CKE=1; // 在SCK 的下降沿数据稳定
	SSP2CON1bits.CKP = 0;
	SSP1CON1bits.SSPEN=1; //使能同步串口
	
	cs1_off();
	cs2_off();	
}

void interrupt isr(void)
{
	//GIE=0;
	OS_EnterInt();

#ifdef _OS_TIEMR
	if(TMR1IF==1) 		// Timer 1 Interruption
	{
		//os_tick++;
		TMR1IF=0;   		//Clear Flag
		TMR1H=0xB1;
		TMR1L=0xE0;		// 1M*20000=20ms
		OS_Timer();
	}
#endif

	if(TMR0IF)
	{
		TMR0 = 61;//82;			//59 -> 50ms  82 is to adjust 400ms sample AD7758
		TMR0IF = 0;
		gs50msCnt++;
		if (gs50msCnt%TIMER_400MS == 0) 
		{
			Sample_flag = 1;
		}
		if (gs50msCnt%TIMER_3MIN == 0) 
		{
			AbnorProcFlag = 1;
		}
		// avoid to overflow, meanwhile, 36000 is the co-multiples of TIMER_400MS&TIMER_3MIN
		if (gs50msCnt >= 3600) 
		{
			gs50msCnt = 0;
		}
	}

	if ( OERR || FERR )			//receive over
	{
		CREN = 0 ;
		CREN = 1;	
	}

	if( RCIF )
	{
		RCIF = 0;
		uchar data = RCREG;
	
		if (gstSLIPRecv.ucRecingState != SLIP_DONE)
		{
			if (((data == SLIP_END) && (gstSLIPRecv.ucRecingState == SLIP_IDLE)) ||
				((data == SLIP_END) && (gstSLIPRecv.ucRecingState == SLIP_PROCESS) && (gstSLIPRecv.ucRecdCnt < 4)))
			{
				gstSLIPRecv.ucRecingState = SLIP_PROCESS;
				gstSLIPRecv.ucRecdCnt = 0;
			}
			else if ((data == SLIP_END) && (gstSLIPRecv.ucRecingState == SLIP_PROCESS) && (gstSLIPRecv.ucRecdCnt >= 4))
			{
				gstSLIPRecv.ucRecingState = SLIP_DONE;
			}
			gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt] = data;
			//avoid overflow
			if (gstSLIPRecv.ucRecdCnt < RS485CMD_SIZE -1) gstSLIPRecv.ucRecdCnt++;
		}
	}	

	if(TXIF) 
	{
		TXIF = 0;
		if (gstSLIPSend.ucSentCnt < gstSLIPSend.ucSendTolCnt) 
		{
			if (gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] == SLIP_END
				&& gstSLIPSend.ucSentCnt != 0
				&& gstSLIPSend.ucSentCnt != gstSLIPSend.ucSendTolCnt - 1) 
			{
				TXREG = SLIP_ESC;
				gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] = SLIP_ESC_END;
			}
			else if(gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] == SLIP_ESC) 
			{
				TXREG = SLIP_ESC;
				gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] = SLIP_ESC_ESC;
			}
			else 
			{
				TXREG = gstSLIPSend.ucData[gstSLIPSend.ucSentCnt++];
			}
		}
		else 
		{
			TXIE = 0;
			gstSLIPSend.ucSendingState = SLIP_DONE;
		}
	}

	//GIE=1;
	OS_LeaveInt();
}

/* Two flags that the two protothread functions use. */
static void thread_Sample(void)
{
	do 
	{
		OS_Cond_Wait(Sample_flag == 1);
		Sample_flag = 0;
		Sample_ADE7758( 0x01 );
		CLRWDT();					
		Sample_ADE7758( 0x02 );	
		CLRWDT();
		//OS_Delay(10);
	}while(1);
}

void sample_check(void)
{
	if (Sample_flag == 1) 
	{
		Sample_flag = 0;
		Sample_ADE7758( 0x01 );
		CLRWDT();					
		Sample_ADE7758( 0x02 );	
		CLRWDT();
	}
}

static void thread_slip(void)
{
	do 
	{
		//PT_WAIT_UNTIL(pt, rs485_cmd_finish == 1);
		OS_Cond_Wait(gstSLIPRecv.ucRecingState == SLIP_DONE);
		slip_main();
		gstSLIPRecv.ucRecingState = SLIP_IDLE;
		gstSLIPRecv.ucRecdCnt = 0;
		//OS_Delay(10);
		
	}while(1);
}

static void thread_abnormal(void)
{
	do 
	{
		OS_Cond_Wait(AbnorProcFlag == 1);
		AbnorProcFlag = 0;
		if (AD7758_check_init(0x01) == 0 )
		{
			AD7758_init(1);
		}
		if (AD7758_check_init(0x02) == 0 )
		{
			AD7758_init(2);
		}
	}while(1);
}

typedef void (*fun)(void);
fun fun_array[OS_TASKS] =
{
	thread_Sample,
	thread_slip,
	thread_abnormal
};

int main(void)
{
	uchar i;
	Initialize();
	SPI_Init();
	AD7758_init(1);
	AD7758_init(2);
	RS485_EN = 0;
	CLRWDT();
	gucDevAddr = get_address();
	OS_Init();
	for(i = 0; i < OS_TASKS; i++)
	{
		OS_Task_Create(i, OS_FUN_TABLE_BASE + (i << 1));
	}
    OS_EI();
	CLRWDT();
    OS_Run();
	for(i = 0; i < OS_TASKS; i++)
	{
		fun_array[i]();
	}
}

