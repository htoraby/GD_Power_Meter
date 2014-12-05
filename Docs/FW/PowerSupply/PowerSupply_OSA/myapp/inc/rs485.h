#ifndef _RS485_H
#define _RS485_H
#include "config.h"
#include "util.h"

#define ERROR_OK				0
#define ERROR_INVALID_PACKET	1
#define ERROR_WRONGADDR			2
#define ERROR_CMDFAIL			3

#define SLIP_READ				0x10
#define SLIP_WRITE				0x11
#define SLIP_BLOCKREAD			0x20
#define SLIP_BLOCKWRITE			0x21
#define SLIP_DEV				0x30
#define SLIP_VER				0x40

#define RS485BUF_SIZE 			40
#define RS485CMD_SIZE 			20

#define SLIP_END				0xC0
#define SLIP_ESC				0xDB
#define SLIP_ESC_END			0xDC
#define SLIP_ESC_ESC			0xDD


typedef enum {
	SLIP_IDLE = 0,
	SLIP_PROCESS,
	SLIP_DONE,
}SLIP_STATE;

typedef struct {
	uchar ucRecdCnt;
	uchar ucRecingState;
	uchar ucData[RS485CMD_SIZE];
}SLIP_RECV;

typedef struct {
	uchar ucSentCnt;
	uchar ucSendTolCnt;
	uchar ucSendingState;
	uchar ucData[RS485BUF_SIZE];
}SLIP_SENT;

void rs485_send_data(void);
void slip_main(void);
#endif
