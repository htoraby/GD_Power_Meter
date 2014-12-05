#ifndef _RS485_H
#define _RS485_H
#include "config.h"
#include "util.h"

#define ERROR_OK				0
#define ERROR_INVALID_PACKET	1
#define ERROR_WRONGADDR			2
#define ERROR_CMDFAIL			3

#define SLIP_READ		0x10
#define SLIP_WRITE		0x11
#define SLIP_BLOCKREAD	0x20
#define SLIP_BLOCKWRITE	0x21
#define SLIP_DEV		0x30

#define RS485BUF_SIZE 			50
#define RS485CMD_SIZE 			30

void rs485_send_data(void);
void slip_main(void);
#endif
