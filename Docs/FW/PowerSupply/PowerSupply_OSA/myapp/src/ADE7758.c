#include "ADE7758.h"
#include "rs485.h"
#include <stdio.h>

uchar ReadData[3];
uchar SendData[3];
uchar FreqPhase[2]; 
ADE7758_D ADE7758Data[2];

#define TOL_CS

#ifdef TOL_CS
void AD7758_CS(uchar chip, uchar enable)
{
	if (enable)
	{
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
	}
	else 
	{
		cs1_off();
		cs2_off();
	}
	
	Delay(0x01);
}
#endif

void AD7758_GetData(uchar addr, uchar num,uchar chip)
{
	uchar i;

#ifndef TOL_CS
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
#endif

	spiSendByte(addr);
	for(i=0;i<num;i++)
	{
	  	ReadData[i] = spiSendByte (0x00);
	}

#ifndef TOL_CS
	cs1_off();
	cs2_off();
	Delay(0x01);
#endif
}

void AD7758_SendData(uchar addr, uchar num,uchar chip)
{
	uchar i;

#ifndef TOL_CS
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
#endif

	spiSendByte(addr|0x80);
	for(i=0;i<num;i++)
	{
		spiSendByte (SendData[i]);
	}

#ifndef TOL_CS
	cs1_off();
	cs2_off();
	Delay(0x01);
#endif
}

void AD7758_init(uchar chip)
{
#ifdef TOL_CS
	AD7758_CS(chip, CS_ENABLE);
#endif

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
	
#ifdef TOL_CS
	AD7758_CS(chip, CS_DISABLE);
#endif

}

void Sample_ADE7758(uchar chip)
{
	uint sum;

#ifdef TOL_CS
	AD7758_CS(chip, CS_ENABLE);
#endif

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

	//signed value
	AD7758_GetData(AWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		ReadData[0] = ~ReadData[0];
		ReadData[1] = ~ReadData[1];
	}
	//calculate the mean value of the last two time sample data
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Active_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Active_Power[1])) >> 1);
	
	ADE7758Data[chip-1].PhaseA.Active_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseA.Active_Power[1] = (uchar)sum;
	if (sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseA.Energy += sum;
	}		

	AD7758_GetData(BWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		ReadData[0] = ~ReadData[0];
		ReadData[1] = ~ReadData[1];
	}
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Active_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Active_Power[1])) >> 1);
	
	ADE7758Data[chip-1].PhaseB.Active_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseB.Active_Power[1] = (uchar)sum;
	if (sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseB.Energy += sum;
	}	

	AD7758_GetData(CWATTHR, 2, chip);
	if ( ReadData[0]&0x80 )
	{
		ReadData[0] = ~ReadData[0];
		ReadData[1] = ~ReadData[1];
	}
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Active_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Active_Power[1])) >> 1);
	
	ADE7758Data[chip-1].PhaseC.Active_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseC.Active_Power[1] = (uchar)sum;
	if (sum > WATTHR_THRESHOLD )  
	{
		ADE7758Data[chip-1].PhaseC.Energy += sum;
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

	AD7758_GetData(AVAHR, 2, chip);
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Apparent_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Apparent_Power[1])) >> 1);
	ADE7758Data[chip-1].PhaseA.Apparent_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseA.Apparent_Power[1] = (uchar)sum;
	
	AD7758_GetData(BVAHR, 2, chip);
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Apparent_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Apparent_Power[1])) >> 1);
	ADE7758Data[chip-1].PhaseB.Apparent_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseB.Apparent_Power[1] = (uchar)sum;
	
	AD7758_GetData(CVAHR, 2, chip);
	sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Apparent_Power[0]) << 8) + 
		((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Apparent_Power[1])) >> 1);
	ADE7758Data[chip-1].PhaseC.Apparent_Power[0] = (uchar)(sum>>8);
	ADE7758Data[chip-1].PhaseC.Apparent_Power[1] = (uchar)sum;
	
	AD7758_GetData(TEMP, 1, chip);
	ADE7758Data[chip-1].Temper = (schar)ReadData[0];

#ifdef TOL_CS
	AD7758_CS(chip, CS_DISABLE);
#endif
}

uchar AD7758_check_init(uchar chip)
{
	uchar ret = 1;

#ifdef TOL_CS
	AD7758_CS(chip, CS_ENABLE);
#endif

	AD7758_GetData(COMPMODE,1,chip);
	if ( COMPMODE_VALUE == ReadData[0])
	{
		AD7758_GetData(LCYCMODE,1,chip);
		if ( LCYCMODE_VALUE != ReadData[0])
		{
			ret = 0;
		}
	}
	else 
	{
		ret = 0;
	} 
	
#ifdef TOL_CS
	AD7758_CS(chip, CS_DISABLE);
#endif

	return ret;
}
