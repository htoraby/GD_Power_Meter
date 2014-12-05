#include "config.h"
#include "ADE7758.h"
#include "util.h"
#include "rs485.h"
#include "pt.h"


__CONFIG ( FOSC_INTOSC & CLKOUTEN_OFF & WDTE_ON & PLLEN_ON & MCLRE_OFF & PLLEN_ON & WRT_OFF & FCMEN_OFF & STVREN_OFF & BOREN_OFF) ;

extern volatile uchar rs485_trans_num;
extern uchar address;
extern uchar cmd_bytes_count;
extern volatile uchar rs485_cmd_count;
extern volatile uchar rs485_rsp_count;
extern volatile bit rs485_cmd_finish;
extern volatile bit rs485_rsp_finish;
extern volatile bit rs485_cmd_flag;
extern uchar cmdrspbuffer[RS485BUF_SIZE];
extern uchar cmd_bytes[RS485CMD_SIZE];

static struct pt ptslip;
static struct pt ptsample;
static volatile bit Sample_flag;
static uchar Tcount;
static uint Tconut_plus;

extern uchar ReadData[3];
extern uchar SendData[3];
extern ADE7758_D ADE7758Data[2];

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
	TMR0 = 	70;		/*50ms*/

/*WDT*/
	WDTCONbits.WDTPS = 0B01010;	// 1S
		
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
	GIE=0;

	if(TMR0IF)
	{
		TMR0 = 82;			//59 -> 50ms  82 is to adjust 400ms sample AD7758
		TMR0IF = 0;
		Sample_flag = 1;						
	}

	if ( OERR || FERR )			//receive over
	{
		CREN = 0 ;
		CREN = 1;	
	}

	if( RCIF )
	{
		uchar data = RCREG;

		RCIF = 0;

		if (rs485_cmd_finish == 0)
		{

			if (((data == 0xc0) && (rs485_cmd_flag == 0)) || \
				((data == 0xc0) && (rs485_cmd_flag == 1) && (rs485_cmd_count < 4)))
			{
				rs485_cmd_flag = 1;
				rs485_cmd_count = 0;
				cmdrspbuffer[rs485_cmd_count++] = data;
			}
			else if ((data == 0xc0) && (rs485_cmd_flag == 1) && (rs485_cmd_count >= 4))
			{
				rs485_cmd_finish = 1;
				rs485_cmd_flag = 0;
				cmdrspbuffer[rs485_cmd_count++] = data;
			}
			else if ((data != 0xc0) && (rs485_cmd_flag == 1))
			{
				cmdrspbuffer[rs485_cmd_count++] = data;
			}
		}

	}	

	if(TXIF)
	{
		TXIF = 0;
		if( rs485_rsp_count < rs485_trans_num )
		{
			TXREG = cmdrspbuffer[rs485_rsp_count];		//sent data;
			rs485_rsp_count ++;	
		}
		else
		{
			TXIE = 0;
			rs485_rsp_finish = 1;
		}
	}	

	GIE=1;
}

/* Two flags that the two protothread functions use. */

static int thread_Sample(struct pt *pt)
{
	PT_BEGIN(pt);

	PT_WAIT_UNTIL(pt, Sample_flag == 1);
	Sample_flag = 0;
	
	if ( Tcount++ >= TIMER_400MS )
	{
		Tcount = 0;
		if( Tconut_plus++ >= 450 )  // 400ms*450 = 3 min
		{
			Tconut_plus = 0;
			if ( AD7758_check_init(0x01) == 0 )
			{
				AD7758_init(1);
			}
			if ( AD7758_check_init(0x02) == 0 )
			{
				AD7758_init(2);
			}
		}
		Sample_ADE7758( 0x01 );
		CLRWDT();					
		Sample_ADE7758( 0x02 );	
		CLRWDT();				
	}
	PT_END(pt);
}

void sample_check(void)
{
	if(Sample_flag == 1)
	{
		Sample_flag = 0;
		
		if ( Tcount++ >= TIMER_400MS )
		{
			Tcount = 0;
			if( Tconut_plus++ >= 450 )	// 400ms*450 = 3 min
			{
				Tconut_plus = 0;
				if ( AD7758_check_init(0x01) == 0 )
				{
					AD7758_init(1);
				}
				if ( AD7758_check_init(0x02) == 0 )
				{
					AD7758_init(2);
				}
			}
			Sample_ADE7758( 0x01 );
			CLRWDT();					
			Sample_ADE7758( 0x02 ); 
			CLRWDT();				
		}
	}

}

static int thread_slip(struct pt *pt)
{
	PT_BEGIN(pt);

	PT_WAIT_UNTIL(pt, rs485_cmd_finish == 1);

	slip_main();

	PT_END(pt);
}


int main(void)
{
	Initialize();
	SPI_Init();
	AD7758_init(1);
	AD7758_init(2);
	RS485_EN = 0;
	CLRWDT();
	address = get_address();

	PT_INIT(&ptslip);
	PT_INIT(&ptsample);

	while(1)
	{
		CLRWDT();
		RS485_EN = 0;

		thread_Sample(&ptsample);
		thread_slip(&ptslip);
	}
}
	
