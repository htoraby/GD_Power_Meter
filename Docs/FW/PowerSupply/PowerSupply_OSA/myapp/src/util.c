#include "util.h"

void Delay( ulong delay_count_max )
{
	ulong delay_count; 
	for( delay_count = 0 ; delay_count < delay_count_max ; delay_count ++ )
	{
		;	
	}

}

uchar get_address(void)
{
	return 0x0f;
	/*
	uchar board_address ,bit0,bit1,bit2,bit3;
	bit0 = 0x01 & RA3;
	bit1 = 0x01 & RA2;
	bit2 = 0x01 & RA1;
	bit3 = 0x01 & RA0;
	board_address = 0x0f & ( (bit3<<3) | (bit2<<2) | (bit1<<1) | (bit0<<0) );
	return board_address;
	*/
}

uchar spiSendByte(unsigned char spi_data) 
{
	unsigned char spi_tmp= 0x00;
	ulong cc = 0;
    SSPBUF=spi_data;
	while((!SSP1IF)&&(cc < 0x0fffffff))
	{
		cc++;
	}	    
    spi_tmp = SSPBUF;
    SSP1IF = 0;
    return spi_tmp;        
}

uint ADC10_GetValue( uchar chan )
{
	uint result;
	
	ADCON0 = (chan<<2);
	ADON = 1;
	while(ADGO)
	{;}
	result = (ADRESH&0x03);
	result = (result<<8) + ADRESL;

	return result;	
}

ulong calculate_frequency( ulong f_f )
{
	ulong tmp;
	f_f = f_f & 0x000003ff;
	if( f_f > 0)
	{
		tmp = Fosc / 256 / f_f;
		return tmp;
	}
	else
	{
		return 0;	
	}	
}

signed long labs(signed long val)
{
  if(val<0) 
            return(-val);
  return(val);
}

uchar calculateCRC8( uchar *inData, uchar dataLen )
{
    uchar i,j,crc=0;

	for(j=0;j<dataLen;j++)
	{
		crc ^= *inData++;
  		for ( i = 0; i < 8; i++ ) 
    	{
        	if (( crc & 0x80 ) != 0 )
        	{
            	crc <<= 1;
            	crc ^= 0x07;
        	}
        	else
        	{
            	crc <<= 1;
        	}
    	}
   	}
	return crc;
}		

void sleep(void)
{
	#asm
		SLEEP
		NOP
	#endasm
}
	
