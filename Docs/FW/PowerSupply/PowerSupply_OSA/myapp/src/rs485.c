#include "rs485.h"
#include "ADE7758.h"

#include "OSA.h"

uchar gucDevAddr = 0;

SLIP_RECV gstSLIPRecv;
SLIP_SENT gstSLIPSend;
const uchar gucPowerVer[4] = {'3','.','0','3'};

extern ADE7758_D ADE7758Data[2];
extern void sample_check(void);

void rs485_send_data(void)
{
	gstSLIPSend.ucSendingState = SLIP_PROCESS;
	gstSLIPSend.ucSentCnt = 0;

	RS485_EN = 1;
	TXEN=1;
	TXIE = 1;
#if 0
	//waitout with 1S
	//OS_Cond_Wait_TO(gstSLIPSend.ucSendingState == SLIP_DONE,50);
	OS_Cond_Wait(gstSLIPSend.ucSendingState == SLIP_DONE);
	gstSLIPSend.ucSendingState = SLIP_IDLE;
#else
	ulong cc = 0;
	while((gstSLIPSend.ucSendingState == SLIP_PROCESS) && (cc++ < 0x0fffffff)) {sample_check();}
	cc = 0;
	while((!TRMT)&&(cc++ < 0x0fffffff) ) {sample_check();}
#endif

	TXIE = 0;
	TXEN=0;
	RS485_EN = 0;
}

static void sendACK(void)
{
	uchar idx = 0;
	
	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static void sendNACK(void)
{
	uchar idx = 0;
	
	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x80;
	gstSLIPSend.ucData[idx++] = 0x89;
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static void sendDEV(void)
{
	uchar idx = 0;

	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 'S';
	gstSLIPSend.ucData[idx++] = 'S';
	gstSLIPSend.ucData[idx++] = 'P';
	gstSLIPSend.ucData[idx++] = 'O';
	gstSLIPSend.ucData[idx++] = 'W';
	gstSLIPSend.ucData[idx++] = 'E';
	gstSLIPSend.ucData[idx++] = 'R';
	gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static void sendPHASE(uint phase)
{
	ADE7758_t *pchip1_phase;
	ADE7758_t *pchip2_phase;

	switch(phase) 
	{
		case PHASE1_ADDR:
			pchip1_phase = &ADE7758Data[0].PhaseA;
			pchip2_phase = &ADE7758Data[1].PhaseA;
			break;
			
		case PHASE2_ADDR:
			pchip1_phase = &ADE7758Data[0].PhaseB;
			pchip2_phase = &ADE7758Data[1].PhaseB;
			break;
			
		case PHASE3_ADDR:
			pchip1_phase = &ADE7758Data[0].PhaseC;
			pchip2_phase = &ADE7758Data[1].PhaseC;
			break;
			
		default:
			return;
	}

	uchar idx = 0;	
	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>24);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>16);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>8);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy);
	gstSLIPSend.ucData[idx++] = pchip1_phase->Frequency[0];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[0];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[1];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[2];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Frequency[1];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Current[0];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Current[1];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Current[2];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Active_Power[0];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Active_Power[1];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Apparent_Power[0];
	gstSLIPSend.ucData[idx++] = pchip1_phase->Apparent_Power[1];
	gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>24);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>16);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>8);
	gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy);
	gstSLIPSend.ucData[idx++] = pchip2_phase->Frequency[0];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[0];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[1];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[2];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Frequency[1];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Current[0];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Current[1];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Current[2];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Active_Power[0];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Active_Power[1];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Apparent_Power[0];
	gstSLIPSend.ucData[idx++] = pchip2_phase->Apparent_Power[1];
	gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static void sendTemper(void)
{
	uchar idx = 0;	

	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = ADE7758Data[0].Temper;
	gstSLIPSend.ucData[idx++] = ADE7758Data[1].Temper;
	gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static void sendVER(void)
{
	uchar idx = 0;
	
	gstSLIPSend.ucData[idx++] = 0xC0;
	gstSLIPSend.ucData[idx++] = gucDevAddr;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = 0x00;
	gstSLIPSend.ucData[idx++] = gucPowerVer[0];
	gstSLIPSend.ucData[idx++] = gucPowerVer[1];
	gstSLIPSend.ucData[idx++] = gucPowerVer[2];
	gstSLIPSend.ucData[idx++] = gucPowerVer[3];
	gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	gstSLIPSend.ucData[idx++] = 0xC0;
	
	gstSLIPSend.ucSendTolCnt = idx;
	rs485_send_data();
}

static uchar processing_slipcmd(void)
{
	uchar i, j;
	uchar pend = 0;
	uchar ret;

	// Reject the pended character 0xDB first. Here sacrifice performance to save data space 
	// Actually most of the code is seldom used, so it should be much more efficient than it looks.
	for (i = 1; i < gstSLIPRecv.ucRecdCnt - 1; i++) 
	{
		if (gstSLIPRecv.ucData[i] == SLIP_ESC_END && pend == 1) 
		{
			gstSLIPRecv.ucData[i] = SLIP_END;
		}
		else if (gstSLIPRecv.ucData[i] == SLIP_ESC_ESC && pend == 1) 
		{
			gstSLIPRecv.ucData[i]  = SLIP_ESC;
		}
		else if (gstSLIPRecv.ucData[i] == SLIP_ESC) 
		{
			for (j = i; j < gstSLIPRecv.ucRecdCnt - 1; j++) 
			{
				gstSLIPRecv.ucData[j] = gstSLIPRecv.ucData[j+1];
			}
			i--; //rollback one byte
			gstSLIPRecv.ucRecdCnt--;
			pend = 1;
			continue;
		}
		pend = 0;
	}

	ret = ERROR_OK;
	if (gstSLIPRecv.ucData[1] != gucDevAddr) 
	{
		ret = ERROR_WRONGADDR;
	}
	else if ((gstSLIPRecv.ucData[0] != SLIP_END) 
		|| (gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt-1] != SLIP_END)) 
	{
		ret = ERROR_INVALID_PACKET;
	}
	else if ( gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt - 2] != calculateCRC8(gstSLIPRecv.ucData+2, gstSLIPRecv.ucRecdCnt-4))
	{
		ret = ERROR_INVALID_PACKET;
	}

	return ret;
}

static void run_cmd(void)
{
	uint  wregaddr = 0;

	switch (gstSLIPRecv.ucData[2])
	{
		case SLIP_READ:
			wregaddr = (uint)((gstSLIPRecv.ucData[3] << 8) | gstSLIPRecv.ucData[4]);
			if ( wregaddr == TEMPER_ADDR )
			{
				sendTemper();
			}			
			break;

		case SLIP_BLOCKREAD:
			if ( 8 == gstSLIPRecv.ucData[5] )
			{
				wregaddr = (uint)((gstSLIPRecv.ucData[3] << 8) | gstSLIPRecv.ucData[4]);
				sendPHASE(wregaddr);
			}
			break;
			
		case SLIP_DEV:
			sendDEV();					
			break;
			
		case SLIP_VER:
			sendVER();
			break;
			
		case SLIP_WRITE:	
		case SLIP_BLOCKWRITE:
		default:
			break;
	}
}


void slip_main(void)
{
	uchar ret = 0;

	ret = processing_slipcmd();
	//gstSLIPSend.ucSendTolCnt = 0;
	if( ret == ERROR_OK)
	{
		sendACK();
		run_cmd();
	}
	else if (ret == ERROR_INVALID_PACKET)
	{
		sendNACK();
	}
}
