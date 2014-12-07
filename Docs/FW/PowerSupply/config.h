#ifndef _CONFIG_H
#define _CONFIG_H
#include <htc.h>

typedef  unsigned char uchar;
typedef  signed char schar;
typedef  unsigned long ulong;
typedef  unsigned int uint;
typedef  unsigned short ushort;

#define CLRWDT() asm("clrwdt")

#define Fosc  3579540
#define CS1 RB3
#define CS2 RB0
#define RS485_EN RA7
#define  cs1_on()	CS1=0 	/*lift 7758's chip select*/
#define  cs1_off()	CS1=1	/*drop chip select*/
#define  cs2_on()	CS2=0 	/*lift 7758's chip select*/
#define  cs2_off()	CS2=1	/*drop chip select*/

#define TEMPER_ADDR 0xE000
#define PHASE1_ADDR 0xE001
#define PHASE2_ADDR 0xE002
#define PHASE3_ADDR 0xE003

#define TIMER_1S	20
#define TIMER_400MS	8
#define TIMER_3MIN	3600

typedef struct {
	uchar Frequency[2];
	uchar Voltage[3];
	uchar Current[3];	
	uchar Active_Power[2];
	uchar Apparent_Power[2];
	ulong Energy;
} ADE7758_t;

typedef struct {
	ADE7758_t PhaseA;
	ADE7758_t PhaseB;
	ADE7758_t PhaseC;
	schar	Temper;	
} ADE7758_D;

#endif
