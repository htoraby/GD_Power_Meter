#ifndef _MODBUS_H
#define _MODBUS_H

#define RS485_EN RA7
#define ADDR 0XC9
#define READ_CODE 0X03

#define MODBUS_GENERATOR 0xA001

#define V_FACTOR 359
#define C_FACTOR 1765
#define A_FACTOR 78

volatile unsigned int CRC;


extern void modbus_init(void);
extern void modbus_main(void);

static volatile unsigned char rx_timeout;
volatile unsigned char rx_data[64];
volatile unsigned char rx_data_counter;
volatile bit rx_data_flag;

volatile unsigned char tx_data[64];
volatile unsigned char tx_data_num;
volatile unsigned char tx_data_index;
volatile bit tx_timeout_flag;
volatile unsigned char address;







#endif