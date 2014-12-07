#ifndef _UTIL_H
#define _UTIL_H
#include "config.h"
void Delay(ulong delay_count_max);
uchar get_address(void);
uchar spiSendByte(unsigned char spi_data);
uint ADC10_GetValue( uchar chan );
ulong calculate_frequency( ulong f_v );
signed long labs(signed long val);
uchar calculateCRC8( uchar *inData, uchar dataLen );
void sleep(void);
#endif
