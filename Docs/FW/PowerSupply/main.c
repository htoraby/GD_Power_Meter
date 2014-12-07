

#include <htc.h>
#include "modbus.h"
#include "ADE7758.h"
#include "util.h"
#include "config.h"

__CONFIG ( FOSC_INTOSC & CLKOUTEN_OFF & WDTE_OFF & PLLEN_ON & MCLRE_OFF & PLLEN_ON & WRT_OFF & FCMEN_OFF & STVREN_OFF & BOREN_OFF) ;

#define CLRWDT() asm("clrwdt")


static volatile bit Sample_flag;
static volatile bit AbnorProcFlag = 0;
static unsigned short gs50msCnt = 0;


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
	SPBRGL = 0X67;			//19200	= FOSC/4(n+1)  n= 51  38400 n=25 //SPBRGL = 0X19; 9600 n= 103;
					
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

//#ifdef _OS_TIEMR
	/***************************************************************************/
	/* Timer 1 used by OS*/
	//Configure Timer 1
	T1CONbits.TMR1CS = 0;		//Timer 1 source is Fosc/4
	T1CONbits.T1CKPS0 = 1;		//Prescaler bit for Timer 1 1:8 prescale
	T1CONbits.T1CKPS1 = 1;		//Prescaler bit for Timer 1 1:8 prescale==>512k
	TMR1GE = 0;					//Timer1 counts regardless of Timer1 gate function
	TMR1H=0xff;
	TMR1L=0xc1;					//��65535-62) == 0.5ms
	TMR1ON=1;    				//Start Timer 1
	TMR1IF=0; 					//Clear Interruption flag
	TMR1IE=1; 					//Enable Timer 1 Interrupt
	/****************************************************************************/
	TXIE = 0;
//#endif

	/*WDT*/
	WDTCONbits.WDTPS = 0B01010;	// 1S

		
	PEIE = 1;
	GIE = 1;
}



void interrupt isr(void)
{
	//GIE=0;

//#ifdef _OS_TIEMR
	if(TMR1IF==1) 		// Timer 1 Interruption
	{
		//os_tick++;
		TMR1IF=0;   		//Clear Flag
		TMR1H=0xff;
		TMR1L=0xc1;		// 	0.5ms
/*rx timeout!*/
		if(rx_timeout < 6)	//3ms
			{

				rx_timeout ++;
			}
		else if(rx_timeout == 6)	//3ms
			{
				
				rx_timeout = 11;
				rx_data_flag = 1;
			}
		else
			{

			}	
/*tx timeout!*/
		if(tx_timeout_flag == 1)
			{
				if(TRMT == 1)
				{
					tx_timeout_flag = 0;
					TXEN=0;
					RS485_EN = 0;
					tx_data_index = 0;
					tx_data_num = 0;
				}
			}
	}

	if(TMR0IF)
	{
		TMR0 = 61;//82;			//59 -> 50ms  82 is to adjust 400ms sample AD7758
		TMR0IF = 0;
		gs50msCnt++;
		if (gs50msCnt%TIMER_1S == 0) 
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


	if(RCIF)
		{
			RCIF = 0;
			unsigned char data = RCREG;
		//	RB0 = 1;
			if(rx_data_flag == 0)	//NOT FINISHED.
				{
				//	RB0=1;
					rx_timeout = 0;
					rx_data[rx_data_counter] = data;
					rx_data_counter++;
			
				if(rx_data_counter == 64)
					{
						rx_data_flag = 1;
						rx_timeout = 11;	//clse timeout
					}
				}
		}
	if(TXIF) 
	{
		TXIF = 0;
		if(tx_data_index < tx_data_num)
		{
			TXREG = tx_data[tx_data_index];
			tx_data_index ++;	
		}
		else
		{
			TXIE = 0;
			tx_timeout_flag = 1;
				
		}
		

	}

}




void main(void)
{

	Initialize();
	SPI_Init();
	AD7758_init(1);
	RS485_EN = 0;
	modbus_init();
	CLRWDT();
//	RB0 = 0;
	while(1)
	{

		if(rx_data_flag == 1)
		{
			 modbus_main();	
		}
		CLRWDT();
		if(Sample_flag == 1)
		{
			Sample_flag = 0;
			Sample_ADE7758( 0x01 );
		}
		CLRWDT();
		if(AbnorProcFlag == 1)
		{
			AbnorProcFlag = 0;
			if (AD7758_check_init(0x01) == 0 )
			{
				AD7758_init(1);
			}
		}
	}

}



