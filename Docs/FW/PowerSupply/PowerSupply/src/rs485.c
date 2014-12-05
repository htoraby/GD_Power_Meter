#include "rs485.h"
#include "ADE7758.h"

volatile uchar rs485_trans_num = 0;
uchar address = 0;
uchar cmd_bytes_count = 0;
volatile uchar rs485_cmd_count = 0;
volatile uchar rs485_rsp_count = 0;
volatile bit rs485_cmd_finish = 0;
volatile bit rs485_rsp_finish = 0;
volatile bit rs485_cmd_flag = 0;
uchar cmdrspbuffer[RS485BUF_SIZE];
uchar cmd_bytes[RS485CMD_SIZE];

extern ADE7758_D ADE7758Data[2];
extern void sample_check(void);
void rs485_send_data(void)
{
	ulong cc = 0;

	rs485_rsp_finish = 0;
	rs485_rsp_count = 0;

	RS485_EN = 1;
	TXEN=1;
	TXIE = 1;

	cc = 0;
	while((!rs485_rsp_finish) && (cc++ < 0x0fffffff)) {sample_check();}

	cc = 0;
	while((!TRMT)&&(cc++ < 0x0fffffff) ) {sample_check();}

	TXIE = 0;
	TXEN=0;
	RS485_EN = 0;
}

static uchar fillrspbuffer( uchar* rspdata,uchar rspdatasize, uchar* packetdata )
{
	uchar i;
	uchar crc;
	uchar idx = 2;

	packetdata[0] = 0xC0;
	packetdata[1] = address;
	for(i=0;i<rspdatasize;i++)
	{
		if( rspdata[i] == 0xC0 )
		{
			packetdata[idx++] = 0xDB;
			packetdata[idx++] = 0xDC;	
		}
		else if( rspdata[i] == 0xDB )
		{
			packetdata[idx++] = 0xDB;
			packetdata[idx++] = 0xDD;			
		}
		else
		{
			packetdata[idx++] = rspdata[i];
		}		
	}
	
	crc = calculateCRC8(rspdata, rspdatasize);
	if( crc == 0xC0 )
	{
		packetdata[idx++] = 0xDB;
		packetdata[idx++] = 0xDC;	
	}
	else if( rspdata[i] == 0xDB )
	{
		packetdata[idx++] = 0xDB;
		packetdata[idx++] = 0xDD;			
	}
	else
	{
		packetdata[idx++] = crc;
	}

	packetdata[idx++] = 0xC0;
	
	return idx;	
}

static void sendACK(void)
{
	cmdrspbuffer[0] = 0xC0;
	cmdrspbuffer[1] = address;
	cmdrspbuffer[2] = 0x00;
	cmdrspbuffer[3] = 0x00;
	cmdrspbuffer[4] = 0xC0;
	rs485_trans_num = 5;
	rs485_send_data();
}

static void sendNACK(void)
{
	cmdrspbuffer[0] = 0xC0;
	cmdrspbuffer[1] = address;
	cmdrspbuffer[2] = 0x80;
	cmdrspbuffer[3] = 0x89;
	cmdrspbuffer[4] = 0xC0;
	rs485_trans_num = 5;
	rs485_send_data();
}

static void sendDEV(void)
{
	uchar rspbuff[RS485BUF_SIZE];
	uchar idx = 0;

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 'S';
	rspbuff[idx++] = 'S';
	rspbuff[idx++] = 'P';
	rspbuff[idx++] = 'O';
	rspbuff[idx++] = 'W';
	rspbuff[idx++] = 'E';
	rspbuff[idx++] = 'R';

	rs485_trans_num = fillrspbuffer(rspbuff,idx,cmdrspbuffer);
	rs485_send_data();
}

static void sendPHASE1(void)
{
	uchar rspbuff[RS485BUF_SIZE];
	uchar idx = 0;	

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseA.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseA.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseA.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseA.Energy);
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Frequency[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Voltage[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Voltage[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Voltage[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Frequency[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Current[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Current[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Current[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseA.Apparent_Power[1];
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseA.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseA.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseA.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseA.Energy);
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Frequency[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Voltage[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Voltage[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Voltage[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Frequency[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Current[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Current[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Current[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseA.Apparent_Power[1];
	
	rs485_trans_num = fillrspbuffer(rspbuff,idx,cmdrspbuffer);
	rs485_send_data();
}

static void sendPHASE2(void)
{
	uchar rspbuff[RS485BUF_SIZE];
	uchar idx = 0;

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseB.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseB.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseB.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseB.Energy);
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Frequency[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Voltage[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Voltage[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Voltage[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Frequency[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Current[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Current[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Current[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseB.Apparent_Power[1];
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseB.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseB.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseB.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseB.Energy);
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Frequency[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Voltage[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Voltage[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Voltage[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Frequency[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Current[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Current[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Current[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseB.Apparent_Power[1];

	rs485_trans_num = fillrspbuffer(rspbuff,idx,cmdrspbuffer);
	rs485_send_data();
}
static void sendPHASE3(void)
{
	uchar rspbuff[RS485BUF_SIZE];
	uchar idx = 0;

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseC.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseC.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseC.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[0].PhaseC.Energy);
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Frequency[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Voltage[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Voltage[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Voltage[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Frequency[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Current[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Current[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Current[2];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[0].PhaseC.Apparent_Power[1];
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseC.Energy>>24);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseC.Energy>>16);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseC.Energy>>8);
	rspbuff[idx++] = (uchar)(ADE7758Data[1].PhaseC.Energy);
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Frequency[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Voltage[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Voltage[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Voltage[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Frequency[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Current[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Current[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Current[2];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Active_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Active_Power[1];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Apparent_Power[0];
	rspbuff[idx++] = ADE7758Data[1].PhaseC.Apparent_Power[1];

	rs485_trans_num = fillrspbuffer(rspbuff,idx,cmdrspbuffer);
	rs485_send_data();
}

static void sendTemper(void)
{
	uchar rspbuff[RS485BUF_SIZE];
	uchar idx = 0;

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;

	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = 0x00;
	rspbuff[idx++] = ADE7758Data[0].Temper;
	rspbuff[idx++] = ADE7758Data[1].Temper;


	rs485_trans_num = fillrspbuffer(rspbuff,idx,cmdrspbuffer);
	rs485_send_data();
}


static void rs485bufferclear(uchar *bbufer, uchar len)
{
	uchar buffer_idx = 0;

	for(buffer_idx = 0; buffer_idx < len; buffer_idx ++ )
	{
		 bbufer[buffer_idx] = 0x00;
	}	
}


static uchar processing_slipcmd(void)
{
	uchar ret = 0;
	uchar cmdindex = 0;
	uchar cmdtrueindex = 0;
	uchar cmdtruedata[RS485BUF_SIZE];
	uchar cmdtruedatanum = 0;
	uchar crcvalue = 0;

	for( cmdindex = 0 ; cmdindex < rs485_cmd_count ; cmdindex ++ )					//get the true value
	{
		if ((cmdindex > 1) && (cmdindex < (rs485_cmd_count-1)))
		{
			if( ( cmdrspbuffer[cmdindex] == 0XDB ) && ( cmdrspbuffer[cmdindex+1] == 0XDC ) )		//0Xc0
			{
				cmdtruedata[cmdtrueindex++] = 0xc0;
				cmdindex ++;
			}
			else if( ( cmdrspbuffer[cmdindex] == 0xDB ) && ( cmdrspbuffer[cmdindex+1] == 0xDD ) )		//0XDB
			{
				cmdtruedata[cmdtrueindex++] = 0xDB;
				cmdindex ++;
			}
			else																																				//
			{
				cmdtruedata[cmdtrueindex++] = cmdrspbuffer[cmdindex];
			}
		}
		else
		{
			cmdtruedata[cmdtrueindex++] = cmdrspbuffer[cmdindex];
		}
	}

	if(cmdtruedata[1] != address)
	{
		ret = ERROR_WRONGADDR;
	}
	else if ((cmdtruedata[0] != 0xc0) && (cmdtruedata[cmdtrueindex-1] != 0xc0))
	{
		ret = ERROR_INVALID_PACKET;
	}
	else
	{
		cmdtruedatanum = cmdtrueindex;
		cmd_bytes_count  = 0;
		crcvalue = cmdtruedata[cmdtruedatanum-2];

		for(cmdindex = 2 ; cmdindex < cmdtruedatanum-2 ; cmdindex++)
		{
			cmd_bytes[cmd_bytes_count++] = cmdtruedata[cmdindex];
		}

		if ( crcvalue == calculateCRC8(cmd_bytes, cmd_bytes_count))
		{
			ret = ERROR_OK;
		}
		else
		{
			ret = ERROR_INVALID_PACKET;
		}
	}

	return ret;
}

static void run_cmd(void)
{
	uint  wregaddr = 0;

	switch (cmd_bytes[0])
	{
		case SLIP_READ:
			wregaddr = (uint)((cmd_bytes[1] << 8) | cmd_bytes[2]);
			if ( wregaddr == TEMPER_ADDR )
			{
				sendTemper();
			}			
			break;
		case SLIP_WRITE:			
			break;
		case SLIP_BLOCKREAD:
			if ( 8 == cmd_bytes[3] )
			{
				wregaddr = (uint)((cmd_bytes[1] << 8) | cmd_bytes[2]);
				if ( wregaddr == PHASE1_ADDR )
				{
					sendPHASE1();
				}
				else if ( wregaddr == PHASE2_ADDR )
				{
					sendPHASE2();
				}
				else if ( wregaddr == PHASE3_ADDR )
				{
					sendPHASE3();
				}
			}
			break;
		case SLIP_BLOCKWRITE:
			break;
		case SLIP_DEV:
			sendDEV();					
			break;
		default:
			break;
	}

}

void slip_main(void)
{
	uchar ret = 0;

	ret = processing_slipcmd();
	if( ret == ERROR_OK)
	{
		sendACK();
		run_cmd();
	}
	else if (ret == ERROR_INVALID_PACKET)
	{
		sendNACK();
	}
	rs485_cmd_finish = 0;
	rs485_cmd_count = 0;
	rs485bufferclear(cmdrspbuffer, RS485BUF_SIZE);
	rs485bufferclear(cmd_bytes, RS485CMD_SIZE);
}
