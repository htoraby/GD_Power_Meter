#include <htc.h>
#include "modbus.h"
#include "ADE7758.h"



void modbus_init(void)
{
	rx_timeout = 11;
	rx_data_counter = 0;
	rx_data_flag = 0;

	tx_data_num = 0;
	tx_data_index = 0;
	tx_timeout_flag = 0;
	address = ADDR;
}

static void rs485_send_data(void)
{
	RS485_EN = 1;
	TXEN=1;
	TXIE = 1;
}


static void ModbusCalcCRC(unsigned char* Frame,unsigned char LenFrame)
{
	unsigned char CntByte;
	unsigned char j;
	unsigned char bitVal;
	CRC = 0xFFFF;
	for(CntByte=0;CntByte<LenFrame;CntByte++)
	{
		CRC ^= Frame[CntByte];
		for(j=0;j<8;j++)
		{
			bitVal = CRC & 0x0001;
			CRC = CRC >> 1;
			if(bitVal == 1)
			CRC ^= MODBUS_GENERATOR;
		}
	}
}

static void sendHAHA(void)
{
	int idx = 0;
	volatile unsigned long cal_temp,cal_temp1,cal_temp2,cal_temp3;
	
	tx_data[idx++] = ADDR;
	tx_data[idx++] = READ_CODE;
	tx_data[idx++] = 36;	//byte number.

/*********************PHASE A***********************************************************************/
/*Voltage*/
	cal_temp1 = ADE7758Data[0].PhaseA.Voltage[0];
	cal_temp2 = ADE7758Data[0].PhaseA.Voltage[1];
	cal_temp3 = ADE7758Data[0].PhaseA.Voltage[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/V_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);

/*Current*/

	cal_temp1 = ADE7758Data[0].PhaseA.Current[0];
	cal_temp2 = ADE7758Data[0].PhaseA.Current[1];
	cal_temp3 = ADE7758Data[0].PhaseA.Current[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/C_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);
/*Active Power*/
	cal_temp1 = ADE7758Data[0].PhaseA.Active_Power[0];
	cal_temp2 = ADE7758Data[0].PhaseA.Active_Power[1];
	cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	cal_temp = cal_temp*A_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);	
/*********************************PHASE B***********************************************************/

/*Voltage*/
	cal_temp1 = ADE7758Data[0].PhaseB.Voltage[0];
	cal_temp2 = ADE7758Data[0].PhaseB.Voltage[1];
	cal_temp3 = ADE7758Data[0].PhaseB.Voltage[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/V_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);

/*Current*/

	cal_temp1 = ADE7758Data[0].PhaseB.Current[0];
	cal_temp2 = ADE7758Data[0].PhaseB.Current[1];
	cal_temp3 = ADE7758Data[0].PhaseB.Current[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/C_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);
/*Active Power*/
	cal_temp1 = ADE7758Data[0].PhaseB.Active_Power[0];
	cal_temp2 = ADE7758Data[0].PhaseB.Active_Power[1];
	cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	cal_temp = cal_temp*A_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);	
/*********************************PHASE C***********************************************************/


/*Voltage*/
	cal_temp1 = ADE7758Data[0].PhaseC.Voltage[0];
	cal_temp2 = ADE7758Data[0].PhaseC.Voltage[1];
	cal_temp3 = ADE7758Data[0].PhaseC.Voltage[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/V_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);

/*Current*/

	cal_temp1 = ADE7758Data[0].PhaseC.Current[0];
	cal_temp2 = ADE7758Data[0].PhaseC.Current[1];
	cal_temp3 = ADE7758Data[0].PhaseC.Current[2];
	cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	cal_temp = cal_temp/C_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);
/*Active Power*/
	cal_temp1 = ADE7758Data[0].PhaseC.Active_Power[0];
	cal_temp2 = ADE7758Data[0].PhaseC.Active_Power[1];
	cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	cal_temp = cal_temp*A_FACTOR;
	tx_data[idx++] = (unsigned char)(cal_temp>>24);
	tx_data[idx++] = (unsigned char)(cal_temp>>16);
	tx_data[idx++] = (unsigned char)(cal_temp>>8);
	tx_data[idx++] = (unsigned char)(cal_temp);	

	ModbusCalcCRC(tx_data,idx);
	tx_data[idx++] = (unsigned char)(CRC);	
	tx_data[idx++] = (unsigned char)(CRC>>8);
	
	tx_data_num = idx;
	rs485_send_data();
}



void modbus_main(void)
{
	unsigned int CRC_Temp = 0;
	unsigned int REG_Temp = 0;
	if(RB0 == 0)
		RB0 = 1;	
	else 
		RB0=0;

	if(rx_data[0] == address)
		{
			ModbusCalcCRC(rx_data,rx_data_counter-2);
			CRC_Temp = (rx_data[rx_data_counter-1]<<8)|rx_data[rx_data_counter-2];
			if(CRC == CRC_Temp)
				{
					REG_Temp = (rx_data[2]<<8)|rx_data[3];
					switch(REG_Temp)
					{
						case 0x0384: {sendHAHA(); break;}
						default:	break;
					}
				}
		}
	
	rx_data_flag = 0;
	rx_data_counter = 0;

}
