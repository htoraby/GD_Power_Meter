#include "ADE7758.h"
#include "rs485.h"
#include <stdio.h>
extern volatile uchar rs485_trans_num;
extern uchar cmdrspbuffer[RS485BUF_SIZE];

uchar ReadData[3];
uchar SendData[3];
ADE7758_D ADE7758Data[2];
uchar FreqPhase[2]; 

uint Active_Buff_PhaseA[2][BUFFSIZE];
uint Active_Buff_PhaseB[2][BUFFSIZE];
uint Active_Buff_PhaseC[2][BUFFSIZE];
uint Apparent_Buff_PhaseA[2][BUFFSIZE];
uint Apparent_Buff_PhaseB[2][BUFFSIZE];
uint Apparent_Buff_PhaseC[2][BUFFSIZE];
uchar BuffIndex[2]={0};


void AD7758_GetData(uchar addr, uchar num,uchar chip)
{
	uchar i;

	if ( 1 == chip )
	{
		cs1_on();
		cs2_off();
	}
	else if ( 2 == chip )
	{
		cs2_on();
		cs1_off();
	}
	Delay(0x01);	

	spiSendByte(addr);
	for(i=0;i<num;i++)
	{
	  	ReadData[i] = spiSendByte (0x00);
	}

	cs1_off();
	cs2_off();
	Delay(0x01);
}

void AD7758_SendData(uchar addr, uchar num,uchar chip)
{
	uchar i;

	if ( 1 == chip )
	{
		cs1_on();
		cs2_off();
	}
	else if ( 2 == chip )
	{
		cs2_on();
		cs1_off();
	}
	Delay(0x01);	

	spiSendByte(addr|0x80);
	for(i=0;i<num;i++)
	{
		spiSendByte (SendData[i]);
	}

	cs1_off();
	cs2_off();
	Delay(0x01);
}

void AD7758_init(uchar chip)
{

	SendData[0] = OPMODE_VALUE;						//0x40 Sw reset, normal mode
	AD7758_SendData(OPMODE,1,chip);			//OPMODE
  	Delay(0x20);			//at least 18us
		
	SendData[0] = COMPMODE_VALUE;						// COMPMODE
	AD7758_SendData(COMPMODE,1,chip);		// 0x00 V*I	 default

	SendData[0] = LCYCMODE_VALUE;						// 	LCYCMODE
	AD7758_SendData(LCYCMODE,1,chip);		// 0x40 Freq, reset after read WATT/AVR/VA
	
	SendData[0] = 0x00;						//init Frequency Phase A 
	AD7758_SendData(MMODE,1,chip);
	FreqPhase[0] = PHASE_A;
	FreqPhase[1] = PHASE_A;		
}

void Sample_ADE7758(uchar chip)
{
	ulong sum;

	AD7758_GetData(FREQ, 2, chip);
	if( FreqPhase[chip-1] == PHASE_A )
	{
		ADE7758Data[chip-1].PhaseA.Frequency[0]=ReadData[0];
		ADE7758Data[chip-1].PhaseA.Frequency[1]=ReadData[1];
		FreqPhase[chip-1] = PHASE_B;
		SendData[0] = 0x01;						//init Frequency Phase B 
		AD7758_SendData(MMODE,1,chip);
	}
	else if( FreqPhase[chip-1] == PHASE_B )
	{
		ADE7758Data[chip-1].PhaseB.Frequency[0]=ReadData[0];
		ADE7758Data[chip-1].PhaseB.Frequency[1]=ReadData[1];
		FreqPhase[chip-1] = PHASE_C;
		SendData[0] = 0x02;						//init Frequency Phase C 
		AD7758_SendData(MMODE,1,chip);
	}
	else if( FreqPhase[chip-1] == PHASE_C )
	{
		ADE7758Data[chip-1].PhaseC.Frequency[0]=ReadData[0];
		ADE7758Data[chip-1].PhaseC.Frequency[1]=ReadData[1];
		FreqPhase[chip-1] = PHASE_A;
		SendData[0] = 0x00;						//init Frequency Phase A 
		AD7758_SendData(MMODE,1,chip);
	}

	AD7758_GetData(AVRMS, 3, chip);
	ADE7758Data[chip-1].PhaseA.Voltage[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseA.Voltage[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseA.Voltage[2]=ReadData[2];
	
	AD7758_GetData(BVRMS, 3, chip);
	ADE7758Data[chip-1].PhaseB.Voltage[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseB.Voltage[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseB.Voltage[2]=ReadData[2];
	
	AD7758_GetData(CVRMS, 3, chip);
	ADE7758Data[chip-1].PhaseC.Voltage[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseC.Voltage[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseC.Voltage[2]=ReadData[2];
		
	AD7758_GetData(AIRMS, 3, chip);
	ADE7758Data[chip-1].PhaseA.Current[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseA.Current[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseA.Current[2]=ReadData[2];

	AD7758_GetData(BIRMS, 3, chip);
	ADE7758Data[chip-1].PhaseB.Current[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseB.Current[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseB.Current[2]=ReadData[2];
	
	AD7758_GetData(CIRMS, 3, chip);
	ADE7758Data[chip-1].PhaseC.Current[0]=ReadData[0];
	ADE7758Data[chip-1].PhaseC.Current[1]=ReadData[1];
	ADE7758Data[chip-1].PhaseC.Current[2]=ReadData[2];

	AD7758_GetData(AWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		Active_Buff_PhaseA[chip-1][BuffIndex[chip-1]] = 0xFFFF - (ReadData[0]<<8 | ReadData[1]);	
	}
	else
	{
		Active_Buff_PhaseA[chip-1][BuffIndex[chip-1]] = ReadData[0]<<8 | ReadData[1];	
	}

	sum = (Active_Buff_PhaseA[chip-1][0] + Active_Buff_PhaseA[chip-1][1])>>1;
	ADE7758Data[chip-1].PhaseA.Active_Power[0]=(uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseA.Active_Power[1]=(uchar)sum;
	if ( (uint)sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseA.Energy += (uint)sum;
	}		

	AD7758_GetData(BWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		Active_Buff_PhaseB[chip-1][BuffIndex[chip-1]] = 0xFFFF - (ReadData[0]<<8 | ReadData[1]);	
	}
	else
	{
		Active_Buff_PhaseB[chip-1][BuffIndex[chip-1]] = (uint)ReadData[0]<<8 | ReadData[1];	
	}
	sum = (Active_Buff_PhaseB[chip-1][0] + Active_Buff_PhaseB[chip-1][1])>>1;
	ADE7758Data[chip-1].PhaseB.Active_Power[0]=(uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseB.Active_Power[1]=(uchar)sum;
	if ( (uint)sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseB.Energy += (uint)sum;
	}		

	AD7758_GetData(CWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		Active_Buff_PhaseC[chip-1][BuffIndex[chip-1]] = 0xFFFF - ((uint)ReadData[0]<<8 | ReadData[1]);	
	}
	else
	{
		Active_Buff_PhaseC[chip-1][BuffIndex[chip-1]] = (uint)ReadData[0]<<8 | ReadData[1];	
	}
	sum = (Active_Buff_PhaseC[chip-1][0] + Active_Buff_PhaseC[chip-1][1])>>1;
	ADE7758Data[chip-1].PhaseC.Active_Power[0]=(uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseC.Active_Power[1]=(uchar)sum;
	if ( (uint)sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseC.Energy += (uint)sum;
	}

	AD7758_GetData(AVAHR, 2, chip);
	Apparent_Buff_PhaseA[chip-1][BuffIndex[chip-1]] = ((uint)(ReadData[0])<<8) | ReadData[1];
	sum = (Apparent_Buff_PhaseA[chip-1][0] + Apparent_Buff_PhaseA[chip-1][1])/2;
	ADE7758Data[chip-1].PhaseA.Apparent_Power[0]=(uchar)((sum & 0x000ff00)>>8);
	ADE7758Data[chip-1].PhaseA.Apparent_Power[1]=(uchar)(sum & 0x000000ff);
	
	AD7758_GetData(BVAHR, 2, chip);
	Apparent_Buff_PhaseB[chip-1][BuffIndex[chip-1]] = ReadData[0]<<8 | ReadData[1];
	sum = (Apparent_Buff_PhaseB[chip-1][0] + Apparent_Buff_PhaseB[chip-1][1])>>1;
	ADE7758Data[chip-1].PhaseB.Apparent_Power[0]=(uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseB.Apparent_Power[1]=(uchar)sum;
	
	AD7758_GetData(CVAHR, 2, chip);
	Apparent_Buff_PhaseC[chip-1][BuffIndex[chip-1]] = ReadData[0]<<8 | ReadData[1];
	sum = (Apparent_Buff_PhaseC[chip-1][0] + Apparent_Buff_PhaseC[chip-1][1])>>1;
	ADE7758Data[chip-1].PhaseC.Apparent_Power[0]=(uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseC.Apparent_Power[1]=(uchar)sum;

	AD7758_GetData(TEMP, 1, chip);
	ADE7758Data[chip-1].Temper = (schar)ReadData[0];

	BuffIndex[chip-1]++;
	if( BuffIndex[chip-1] >= BUFFSIZE)
	{
		BuffIndex[chip-1] = 0;
	}

}

uchar AD7758_check_init(uchar chip)
{
	AD7758_GetData(COMPMODE,1,chip);
	if ( COMPMODE_VALUE != ReadData[0])
	{
		return 0;
	}

	AD7758_GetData(LCYCMODE,1,chip);
	if ( LCYCMODE_VALUE != ReadData[0])
	{
		return 0;
	}
	
	return 1;
}
