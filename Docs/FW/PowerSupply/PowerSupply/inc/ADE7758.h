#ifndef _AD7758_H
#define _AD7758_H
#include "config.h"
#include "util.h"

#define AWATTHR		0x01
#define BWATTHR		0x02
#define CWATTHR		0x03

#define AVARHR		0x04
#define BVARHR		0x05
#define CVARHR		0x06

#define AVAHR		0x07
#define BVAHR		0x08
#define CVAHR		0x09

#define AIRMS		0x0A
#define BIRMS		0x0B
#define CIRMS		0x0C

#define AVRMS		0x0D
#define BVRMS		0x0E
#define CVRMS		0x0F

#define FREQ		0x10
#define TEMP		0x11
#define WFORM		0x12
#define OPMODE		0x13
#define MMODE		0x14
#define WAVMODE		0x15
#define COMPMODE	0x16
#define LCYCMODE	0x17
#define MASK		0x18
#define STATUS		0x19
#define RSTATUS		0x1A
#define ZXTOUT		0x1b
#define LINECYC		0x1c
#define SAGCYC		0x1d
#define SAGLVL		0x1e
#define VPINTLVL	0x1f
#define IPINTLVL	0x20
#define VPEAK		0x21
#define IPEAK		0x22
#define GAIN		0x23
#define AVRMSGAIN	0x24
#define BVRMSGAIN	0x25
#define CVRMSGAIN	0x26
#define AIGAIN		0x27
#define BIGAIN		0x28
#define CIGAIN		0x29
#define AWG			0x2a
#define BWG			0x2b
#define CWG			0x2c
#define AVARG		0x2d
#define BVARG		0x2e
#define CVARG		0x2f
#define AVAG		0x30
#define	BVAG		0X31
#define CVAG		0x32
#define AVRMSOS		0x33
#define BVRMSOS		0X34
#define CVRMSOS		0X35
#define AIRMSOS		0X36
#define BIRMSOS		0X37
#define CIRMSOS		0X38
#define AWATTOS		0X39
#define BWATTOS		0X3A
#define CWATTOS		0X3B
#define AVAROS		0X3C
#define BVAROS		0X3D
#define CVAROS		0X3E
#define APHCAL		0X3F
#define BPHCAL		0X40
#define CPHCAL		0X41
#define WDIV		0X42
#define VARDIV		0X43
#define VADIV		0X44
#define APCFNUM		0X45
#define APCFDEN		0X46
#define VARCFNUM	0X47
#define VARCFDEN	0X48

#define CHKSUM		0X7E
#define VERSION		0x7f

#define WATTHR_THRESHOLD 50
#define VAHR_THRESHOLD 50

#define OPMODE_VALUE	0x40
#define COMPMODE_VALUE	0x00
#define LCYCMODE_VALUE	0x40


#define PHASE_A 1
#define PHASE_B 2
#define PHASE_C 3

#define BUFFSIZE 2

void AD7758_GetData(uchar addr, uchar num,uchar chip);
void AD7758_SendData(uchar addr, uchar num,uchar chip);
void AD7758_init(uchar chip);
void Sample_ADE7758(uchar chip);
uchar AD7758_check_init(uchar chip);

#endif

