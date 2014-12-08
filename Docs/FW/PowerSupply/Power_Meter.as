opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F1827
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 9 "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 9 "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	dw 0xFFFC & 0xFFFF & 0xFFE7 & 0xFFFF & 0xFFBF & 0xFFFF & 0xFFFF & 0xDFFF & 0xFDFF & 0xF9FF ;#
DABS 1,544,48	;_ADE7758Data
DABS 1,446,50	;_ADE7758Data
	FNCALL	_main,_Initialize
	FNCALL	_main,_SPI_Init
	FNCALL	_main,_AD7758_init
	FNCALL	_main,_modbus_init
	FNCALL	_main,_modbus_main
	FNCALL	_main,_Sample_ADE7758
	FNCALL	_main,_AD7758_check_init
	FNCALL	_modbus_main,_ModbusCalcCRC
	FNCALL	_modbus_main,_sendHAHA
	FNCALL	_AD7758_check_init,_AD7758_CS
	FNCALL	_AD7758_check_init,_AD7758_GetData
	FNCALL	_Sample_ADE7758,_AD7758_CS
	FNCALL	_Sample_ADE7758,_AD7758_GetData
	FNCALL	_Sample_ADE7758,___bmul
	FNCALL	_Sample_ADE7758,_AD7758_SendData
	FNCALL	_AD7758_init,_AD7758_CS
	FNCALL	_AD7758_init,_AD7758_SendData
	FNCALL	_AD7758_init,_Delay
	FNCALL	_sendHAHA,___lldiv
	FNCALL	_sendHAHA,___lmul
	FNCALL	_sendHAHA,_ModbusCalcCRC
	FNCALL	_sendHAHA,_rs485_send_data
	FNCALL	_AD7758_SendData,_spiSendByte
	FNCALL	_AD7758_GetData,_spiSendByte
	FNCALL	_AD7758_CS,_Delay
	FNROOT	_main
	FNCALL	_isr,___lwmod
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_ReadData
	global	_SendData
	global	_CRC
	global	_FreqPhase
	global	_address
	global	modbus@rx_timeout
	global	_ADE7758Data
	global	_gs50msCnt
	global	_rx_data_counter
	global	_rx_timeout
	global	_tx_data_index
	global	_tx_data_num
	global	_AbnorProcFlag
	global	_Sample_flag
	global	_rx_data_flag
	global	_tx_timeout_flag
	global	_rx_data
	global	_tx_data
	global	_PORTA
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
_PORTA	set	12
	global	_T1CONbits
_T1CONbits	set	24
	global	_TMR0
_TMR0	set	21
	global	_TMR1H
_TMR1H	set	23
	global	_TMR1L
_TMR1L	set	22
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA7
_RA7	set	103
	global	_RB0
_RB0	set	104
	global	_RB3
_RB3	set	107
	global	_RCIF
_RCIF	set	141
	global	_SSP1IF
_SSP1IF	set	139
	global	_TMR0IE
_TMR0IE	set	93
	global	_TMR0IF
_TMR0IF	set	90
	global	_TMR1GE
_TMR1GE	set	207
	global	_TMR1IF
_TMR1IF	set	136
	global	_TMR1ON
_TMR1ON	set	192
	global	_TXIF
_TXIF	set	140
	global	_ADCON1
_ADCON1	set	158
	global	_OPTION_REG
_OPTION_REG	set	149
	global	_OSCCON
_OSCCON	set	153
	global	_WDTCONbits
_WDTCONbits	set	151
	global	_HFIOFR
_HFIOFR	set	1236
	global	_RCIE
_RCIE	set	1165
	global	_TMR1IE
_TMR1IE	set	1160
	global	_TRISA0
_TRISA0	set	1120
	global	_TRISA1
_TRISA1	set	1121
	global	_TRISA2
_TRISA2	set	1122
	global	_TRISA3
_TRISA3	set	1123
	global	_TRISA4
_TRISA4	set	1124
	global	_TRISA6
_TRISA6	set	1126
	global	_TRISA7
_TRISA7	set	1127
	global	_TRISB0
_TRISB0	set	1128
	global	_TRISB1
_TRISB1	set	1129
	global	_TRISB2
_TRISB2	set	1130
	global	_TRISB3
_TRISB3	set	1131
	global	_TRISB4
_TRISB4	set	1132
	global	_TRISB5
_TRISB5	set	1133
	global	_TRISB6
_TRISB6	set	1134
	global	_TRISB7
_TRISB7	set	1135
	global	_TXIE
_TXIE	set	1164
	global	_RXDTSEL
_RXDTSEL	set	2287
	global	_SDO1SEL
_SDO1SEL	set	2286
	global	_TXCKSEL
_TXCKSEL	set	2288
	global	_ANSELA
_ANSELA	set	396
	global	_ANSELB
_ANSELB	set	397
	global	_RCREG
_RCREG	set	409
	global	_SPBRGH
_SPBRGH	set	412
	global	_SPBRGL
_SPBRGL	set	411
	global	_TXREG
_TXREG	set	410
	global	_BRG16
_BRG16	set	3323
	global	_BRGH
_BRGH	set	3314
	global	_CREN
_CREN	set	3308
	global	_FERR
_FERR	set	3306
	global	_OERR
_OERR	set	3305
	global	_RX9
_RX9	set	3310
	global	_SCKP
_SCKP	set	3324
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TRMT
_TRMT	set	3313
	global	_TX9
_TX9	set	3318
	global	_TXEN
_TXEN	set	3317
	global	_SSP1ADD
_SSP1ADD	set	530
	global	_SSP1CON1bits
_SSP1CON1bits	set	533
	global	_SSP2CON1bits
_SSP2CON1bits	set	541
	global	_SSP2STATbits
_SSP2STATbits	set	540
	global	_SSPBUF
_SSPBUF	set	529
	global	_WPUB
_WPUB	set	525
	file	"Power_Meter.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

_ADE7758Data  equ     8462	;BIGRAM
psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_AbnorProcFlag:
       ds      1

_Sample_flag:
       ds      1

_rx_data_flag:
       ds      1

_tx_timeout_flag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_gs50msCnt:
       ds      2

_rx_data_counter:
       ds      1

_rx_timeout:
       ds      1

_tx_data_index:
       ds      1

_tx_data_num:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_ReadData:
       ds      3

_SendData:
       ds      3

_CRC:
       ds      2

_FreqPhase:
       ds      2

_address:
       ds      1

modbus@rx_timeout:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_tx_data:
       ds      64

psect	bssBANK2,class=BANK2,space=1
global __pbssBANK2
__pbssBANK2:
_rx_data:
       ds      64

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	btemp/btemp+1 has the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	movlw	1
	subwf	btemp,f
	movlw	0
	subwfb btemp+1,f
	movf btemp+1,w
	iorwf btemp,w
	skipz
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to BIGRAM
psect cinit,class=CODE,delta=2
	global __pbssBIGRAM
	movlw	low(__pbssBIGRAM)
	movwf	fsr0l
	movlw	high(__pbssBIGRAM)
	movwf	fsr0h
	movlw	low(062h)
	movwf	btemp
	movlw	high(062h)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	global __pbitbssCOMMON
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	low(0Ch)
	movwf	btemp
	movlw	high(0Ch)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	low(040h)
	movwf	btemp
	movlw	high(040h)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2
	global __pbssBANK2
	movlw	low(__pbssBANK2)
	movwf	fsr0l
	movlw	high(__pbssBANK2)
	movwf	fsr0h
	movlw	low(040h)
	movwf	btemp
	movlw	high(040h)
	movwf	btemp+1
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_modbus_init
?_modbus_init:	; 0 bytes @ 0x0
	global	?_modbus_main
?_modbus_main:	; 0 bytes @ 0x0
	global	?_AD7758_init
?_AD7758_init:	; 0 bytes @ 0x0
	global	?_Sample_ADE7758
?_Sample_ADE7758:	; 0 bytes @ 0x0
	global	?_SPI_Init
?_SPI_Init:	; 0 bytes @ 0x0
	global	?_Initialize
?_Initialize:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_rs485_send_data
?_rs485_send_data:	; 0 bytes @ 0x0
	global	?_sendHAHA
?_sendHAHA:	; 0 bytes @ 0x0
	global	?_spiSendByte
?_spiSendByte:	; 1 bytes @ 0x0
	global	?_AD7758_check_init
?_AD7758_check_init:	; 1 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	??_isr
??_isr:	; 0 bytes @ 0x5
	global	isr@data
isr@data:	; 1 bytes @ 0x5
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	??_spiSendByte
??_spiSendByte:	; 0 bytes @ 0x0
	global	??_modbus_init
??_modbus_init:	; 0 bytes @ 0x0
	global	??_SPI_Init
??_SPI_Init:	; 0 bytes @ 0x0
	global	??_Initialize
??_Initialize:	; 0 bytes @ 0x0
	global	??_rs485_send_data
??_rs485_send_data:	; 0 bytes @ 0x0
	global	?_ModbusCalcCRC
?_ModbusCalcCRC:	; 0 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	spiSendByte@spi_data
spiSendByte@spi_data:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	ModbusCalcCRC@Frame
ModbusCalcCRC@Frame:	; 2 bytes @ 0x0
	global	Delay@delay_count_max
Delay@delay_count_max:	; 4 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	global	spiSendByte@cc
spiSendByte@cc:	; 4 bytes @ 0x1
	ds	1
	global	ModbusCalcCRC@LenFrame
ModbusCalcCRC@LenFrame:	; 1 bytes @ 0x2
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	ds	1
	global	??_ModbusCalcCRC
??_ModbusCalcCRC:	; 0 bytes @ 0x3
	global	ModbusCalcCRC@bitVal
ModbusCalcCRC@bitVal:	; 1 bytes @ 0x3
	ds	1
	global	??_Delay
??_Delay:	; 0 bytes @ 0x4
	global	ModbusCalcCRC@CntByte
ModbusCalcCRC@CntByte:	; 1 bytes @ 0x4
	global	Delay@delay_count
Delay@delay_count:	; 4 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	ModbusCalcCRC@j
ModbusCalcCRC@j:	; 1 bytes @ 0x5
	global	spiSendByte@spi_tmp
spiSendByte@spi_tmp:	; 1 bytes @ 0x5
	ds	1
	global	?_AD7758_GetData
?_AD7758_GetData:	; 0 bytes @ 0x6
	global	?_AD7758_SendData
?_AD7758_SendData:	; 0 bytes @ 0x6
	global	AD7758_GetData@num
AD7758_GetData@num:	; 1 bytes @ 0x6
	global	AD7758_SendData@num
AD7758_SendData@num:	; 1 bytes @ 0x6
	ds	1
	global	AD7758_GetData@chip
AD7758_GetData@chip:	; 1 bytes @ 0x7
	global	AD7758_SendData@chip
AD7758_SendData@chip:	; 1 bytes @ 0x7
	ds	1
	global	?_AD7758_CS
?_AD7758_CS:	; 0 bytes @ 0x8
	global	??_AD7758_GetData
??_AD7758_GetData:	; 0 bytes @ 0x8
	global	??_AD7758_SendData
??_AD7758_SendData:	; 0 bytes @ 0x8
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	global	AD7758_CS@enable
AD7758_CS@enable:	; 1 bytes @ 0x8
	global	AD7758_GetData@addr
AD7758_GetData@addr:	; 1 bytes @ 0x8
	global	AD7758_SendData@addr
AD7758_SendData@addr:	; 1 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	ds	1
	global	??_AD7758_CS
??_AD7758_CS:	; 0 bytes @ 0x9
	global	AD7758_CS@chip
AD7758_CS@chip:	; 1 bytes @ 0x9
	global	AD7758_GetData@i
AD7758_GetData@i:	; 1 bytes @ 0x9
	global	AD7758_SendData@i
AD7758_SendData@i:	; 1 bytes @ 0x9
	ds	1
	global	??_AD7758_init
??_AD7758_init:	; 0 bytes @ 0xA
	global	??_Sample_ADE7758
??_Sample_ADE7758:	; 0 bytes @ 0xA
	global	??_AD7758_check_init
??_AD7758_check_init:	; 0 bytes @ 0xA
	global	AD7758_init@chip
AD7758_init@chip:	; 1 bytes @ 0xA
	global	AD7758_check_init@ret
AD7758_check_init@ret:	; 1 bytes @ 0xA
	ds	1
	global	AD7758_check_init@chip
AD7758_check_init@chip:	; 1 bytes @ 0xB
	ds	1
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	ds	1
	global	??_sendHAHA
??_sendHAHA:	; 0 bytes @ 0xD
	ds	4
	global	sendHAHA@cal_temp3
sendHAHA@cal_temp3:	; 4 bytes @ 0x11
	ds	4
	global	sendHAHA@idx
sendHAHA@idx:	; 2 bytes @ 0x15
	ds	2
	global	sendHAHA@cal_temp1
sendHAHA@cal_temp1:	; 4 bytes @ 0x17
	ds	4
	global	sendHAHA@cal_temp2
sendHAHA@cal_temp2:	; 4 bytes @ 0x1B
	ds	3
	global	Sample_ADE7758@sum
Sample_ADE7758@sum:	; 2 bytes @ 0x1E
	ds	1
	global	sendHAHA@cal_temp
sendHAHA@cal_temp:	; 4 bytes @ 0x1F
	ds	1
	global	Sample_ADE7758@chip
Sample_ADE7758@chip:	; 1 bytes @ 0x20
	ds	3
	global	??_modbus_main
??_modbus_main:	; 0 bytes @ 0x23
	global	modbus_main@CRC_Temp
modbus_main@CRC_Temp:	; 2 bytes @ 0x23
	ds	2
	global	modbus_main@REG_Temp
modbus_main@REG_Temp:	; 2 bytes @ 0x25
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x27
;;Data sizes: Strings 0, constant 0, data 0, bss 146, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      13
;; BANK0           80     39      51
;; BANK1           80      0      64
;; BANK2           80      0      64
;; BANK3           30      0       0
;; BANK4            0      0       0

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ModbusCalcCRC@Frame	PTR unsigned char  size(2) Largest target is 64
;;		 -> tx_data(BANK1[64]), rx_data(BANK2[64]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->___lwmod
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_modbus_main
;;   _modbus_main->_sendHAHA
;;   _AD7758_check_init->_AD7758_CS
;;   _AD7758_check_init->_AD7758_GetData
;;   _Sample_ADE7758->_AD7758_CS
;;   _Sample_ADE7758->_AD7758_GetData
;;   _Sample_ADE7758->_AD7758_SendData
;;   _AD7758_init->_AD7758_CS
;;   _AD7758_init->_AD7758_SendData
;;   _sendHAHA->___lldiv
;;   _AD7758_SendData->_spiSendByte
;;   _AD7758_GetData->_spiSendByte
;;   _AD7758_CS->_Delay
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK4
;;
;;   None.
;;
;; Critical Paths under _isr in BANK4
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    9452
;;                         _Initialize
;;                           _SPI_Init
;;                        _AD7758_init
;;                        _modbus_init
;;                        _modbus_main
;;                     _Sample_ADE7758
;;                  _AD7758_check_init
;; ---------------------------------------------------------------------------------
;; (1) _modbus_main                                          4     4      0    4540
;;                                             35 BANK0      4     4      0
;;                      _ModbusCalcCRC
;;                           _sendHAHA
;; ---------------------------------------------------------------------------------
;; (1) _AD7758_check_init                                    2     2      0     560
;;                                             10 BANK0      2     2      0
;;                          _AD7758_CS
;;                     _AD7758_GetData
;; ---------------------------------------------------------------------------------
;; (1) _Sample_ADE7758                                      23    23      0    3702
;;                                             10 BANK0     23    23      0
;;                          _AD7758_CS
;;                     _AD7758_GetData
;;                             ___bmul
;;                    _AD7758_SendData
;; ---------------------------------------------------------------------------------
;; (1) _AD7758_init                                          1     1      0     650
;;                                             10 BANK0      1     1      0
;;                          _AD7758_CS
;;                    _AD7758_SendData
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (2) _sendHAHA                                            22    22      0    4306
;;                                             13 BANK0     22    22      0
;;                            ___lldiv
;;                             ___lmul
;;                      _ModbusCalcCRC
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (2) _AD7758_SendData                                      4     2      2     235
;;                                              6 BANK0      4     2      2
;;                        _spiSendByte
;; ---------------------------------------------------------------------------------
;; (2) _AD7758_GetData                                       4     2      2     235
;;                                              6 BANK0      4     2      2
;;                        _spiSendByte
;; ---------------------------------------------------------------------------------
;; (2) _AD7758_CS                                            2     1      1     161
;;                                              8 BANK0      2     1      1
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (3) ___lldiv                                             13     5      8     241
;;                                              0 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (3) ___lmul                                              12     4      8     136
;;                                              0 BANK0     12     4      8
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1     108
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (3) _ModbusCalcCRC                                        6     3      3     160
;;                                              0 BANK0      6     3      3
;; ---------------------------------------------------------------------------------
;; (3) _rs485_send_data                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _modbus_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Initialize                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SPI_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _spiSendByte                                          6     6      0     105
;;                                              0 BANK0      6     6      0
;; ---------------------------------------------------------------------------------
;; (3) _Delay                                                8     4      4      68
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr                                                  1     1      0     182
;;                                              5 COMMON     1     1      0
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (5) ___lwmod                                              5     1      4     159
;;                                              0 COMMON     5     1      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Initialize
;;   _SPI_Init
;;   _AD7758_init
;;     _AD7758_CS
;;       _Delay
;;     _AD7758_SendData
;;       _spiSendByte
;;     _Delay
;;   _modbus_init
;;   _modbus_main
;;     _ModbusCalcCRC
;;     _sendHAHA
;;       ___lldiv
;;       ___lmul
;;       _ModbusCalcCRC
;;       _rs485_send_data
;;   _Sample_ADE7758
;;     _AD7758_CS
;;       _Delay
;;     _AD7758_GetData
;;       _spiSendByte
;;     ___bmul
;;     _AD7758_SendData
;;       _spiSendByte
;;   _AD7758_check_init
;;     _AD7758_CS
;;       _Delay
;;     _AD7758_GetData
;;       _spiSendByte
;;
;; _isr (ROOT)
;;   ___lwmod
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM             170      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       1       1        7.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      6       D       2       92.9%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       7       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      C0       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     27      33       6       63.8%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0      40       8       80.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0      40      10       80.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITBANK3            50      0       0      11        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BANK3               1E      0       0      12        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITBANK4            30      0       0      13        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BANK4                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;DATA                 0      0      C7      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 242 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Initialize
;;		_SPI_Init
;;		_AD7758_init
;;		_modbus_init
;;		_modbus_main
;;		_Sample_ADE7758
;;		_AD7758_check_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	line	242
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 11
; Regs used in _main: [wreg-status,0+pclath+cstack]
	line	244
	
l11078:	
;main.c: 244: Initialize();
	fcall	_Initialize
	line	245
;main.c: 245: SPI_Init();
	fcall	_SPI_Init
	line	246
	
l11080:	
;main.c: 246: AD7758_init(1);
	movlw	(01h)
	fcall	_AD7758_init
	line	247
	
l11082:	
;main.c: 247: RA7 = 0;
	bcf	(103/8),(103)&7
	line	248
	
l11084:	
;main.c: 248: modbus_init();
	fcall	_modbus_init
	line	249
	
l11086:	
# 249 "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
clrwdt ;#
psect	maintext
	line	254
	
l11088:	
;main.c: 252: {
;main.c: 254: if(rx_data_flag == 1)
	btfss	(_rx_data_flag/8),(_rx_data_flag)&7
	goto	u1491
	goto	u1490
u1491:
	goto	l11092
u1490:
	line	256
	
l11090:	
;main.c: 255: {
;main.c: 256: modbus_main();
	fcall	_modbus_main
	line	258
	
l11092:	
# 258 "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
clrwdt ;#
psect	maintext
	line	259
	
l11094:	
;main.c: 259: if(Sample_flag == 1)
	btfss	(_Sample_flag/8),(_Sample_flag)&7
	goto	u1501
	goto	u1500
u1501:
	goto	l11100
u1500:
	line	261
	
l11096:	
;main.c: 260: {
;main.c: 261: Sample_flag = 0;
	bcf	(_Sample_flag/8),(_Sample_flag)&7
	line	262
	
l11098:	
;main.c: 262: Sample_ADE7758( 0x01 );
	movlw	(01h)
	fcall	_Sample_ADE7758
	line	264
	
l11100:	
# 264 "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
clrwdt ;#
psect	maintext
	line	265
	
l11102:	
;main.c: 265: if(AbnorProcFlag == 1)
	btfss	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	goto	u1511
	goto	u1510
u1511:
	goto	l11088
u1510:
	line	267
	
l11104:	
;main.c: 266: {
;main.c: 267: AbnorProcFlag = 0;
	bcf	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	line	268
	
l11106:	
;main.c: 268: if (AD7758_check_init(0x01) == 0 )
	movlw	(01h)
	fcall	_AD7758_check_init
	iorlw	0
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l11088
u1520:
	line	270
	
l11108:	
;main.c: 269: {
;main.c: 270: AD7758_init(1);
	movlw	(01h)
	fcall	_AD7758_init
	goto	l11088
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	275
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_modbus_main
psect	text521,local,class=CODE,delta=2
global __ptext521
__ptext521:

;; *************** function _modbus_main *****************
;; Defined at:
;;		line 166 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  REG_Temp        2   37[BANK0 ] unsigned int 
;;  CRC_Temp        2   35[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1E/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ModbusCalcCRC
;;		_sendHAHA
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text521
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
	line	166
	global	__size_of_modbus_main
	__size_of_modbus_main	equ	__end_of_modbus_main-_modbus_main
	
_modbus_main:	
	opt	stack 11
; Regs used in _modbus_main: [wreg-status,0+pclath+cstack]
	line	167
	
l11050:	
	line	168
;modbus.c: 168: unsigned int REG_Temp = 0;
	movlb 0	; select bank0
	clrf	(modbus_main@REG_Temp)
	clrf	(modbus_main@REG_Temp+1)
	line	169
	
l11052:	
;modbus.c: 169: if(RB0 == 0)
	btfsc	(104/8),(104)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l4466
u1460:
	line	170
	
l11054:	
;modbus.c: 170: RB0 = 1;
	bsf	(104/8),(104)&7
	goto	l11056
	line	171
	
l4466:	
	line	172
;modbus.c: 171: else
;modbus.c: 172: RB0=0;
	bcf	(104/8),(104)&7
	line	174
	
l11056:	
;modbus.c: 174: if(rx_data[0] == address)
	movlb 2	; select bank2
	movf	(_rx_data)^0100h,w	;volatile
	movlb 0	; select bank0
	xorwf	(_address),w	;volatile
	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l4468
u1470:
	line	176
	
l11058:	
;modbus.c: 175: {
;modbus.c: 176: ModbusCalcCRC(rx_data,rx_data_counter-2);
	movlw	(_rx_data&0ffh)
	movwf	(?_ModbusCalcCRC)
	movlw	0x2/2
	movwf	(?_ModbusCalcCRC+1)
	movf	(_rx_data_counter),w	;volatile
	addlw	0FEh
	movwf	0+(?_ModbusCalcCRC)+02h
	fcall	_ModbusCalcCRC
	line	177
	
l11060:	
;modbus.c: 177: CRC_Temp = (rx_data[rx_data_counter-1]<<8)|rx_data[rx_data_counter-2];
	movf	(_rx_data_counter),w
	addlw	_rx_data+-2&0ffh
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	(_rx_data_counter),w
	addlw	_rx_data+-1&0ffh
	movwf	fsr0l
	movlw 1	; select bank2/3
	movwf fsr0h	
	
	movf	indf0,w
	movwf	(modbus_main@CRC_Temp+1)
	movf	indf1,w
	movwf	(modbus_main@CRC_Temp)
	line	178
	
l11062:	
;modbus.c: 178: if(CRC == CRC_Temp)
	movf	(modbus_main@CRC_Temp+1),w
	xorwf	(_CRC+1),w	;volatile
	skipz
	goto	u1485
	movf	(modbus_main@CRC_Temp),w
	xorwf	(_CRC),w	;volatile
u1485:

	skipz
	goto	u1481
	goto	u1480
u1481:
	goto	l4468
u1480:
	line	180
	
l11064:	
;modbus.c: 179: {
;modbus.c: 180: REG_Temp = (rx_data[2]<<8)|rx_data[3];
	movlb 2	; select bank2
	movf	0+(_rx_data)^0100h+02h,w	;volatile
	movlb 0	; select bank0
	movwf	(modbus_main@REG_Temp+1)
	movlb 2	; select bank2
	movf	0+(_rx_data)^0100h+03h,w	;volatile
	movlb 0	; select bank0
	movwf	(modbus_main@REG_Temp)
	line	181
;modbus.c: 181: switch(REG_Temp)
	goto	l11070
	line	183
	
l11066:	
	fcall	_sendHAHA
	goto	l4468
	line	181
	
l11070:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 3 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (modbus_main@REG_Temp+1),w
	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l11130
	goto	l4468
	opt asmopt_on
	
l11130:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 132 to 132
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (modbus_main@REG_Temp),w
	opt asmopt_off
	xorlw	132^0	; case 132
	skipnz
	goto	l11066
	goto	l4468
	opt asmopt_on

	line	187
	
l4468:	
	line	189
;modbus.c: 186: }
;modbus.c: 187: }
;modbus.c: 189: rx_data_flag = 0;
	bcf	(_rx_data_flag/8),(_rx_data_flag)&7
	line	190
	
l11072:	
;modbus.c: 190: rx_data_counter = 0;
	clrf	(_rx_data_counter)	;volatile
	line	192
	
l4474:	
	return
	opt stack 0
GLOBAL	__end_of_modbus_main
	__end_of_modbus_main:
;; =============== function _modbus_main ends ============

	signat	_modbus_main,88
	global	_AD7758_check_init
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:

;; *************** function _AD7758_check_init *****************
;; Defined at:
;;		line 288 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  chip            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chip            1   11[BANK0 ] unsigned char 
;;  ret             1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD7758_CS
;;		_AD7758_GetData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text522
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	288
	global	__size_of_AD7758_check_init
	__size_of_AD7758_check_init	equ	__end_of_AD7758_check_init-_AD7758_check_init
	
_AD7758_check_init:	
	opt	stack 11
; Regs used in _AD7758_check_init: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_check_init@chip stored from wreg
	movlb 0	; select bank0
	movwf	(AD7758_check_init@chip)
	line	289
	
l11028:	
;ADE7758.c: 289: uchar ret = 1;
	clrf	(AD7758_check_init@ret)
	incf	(AD7758_check_init@ret),f
	line	292
	
l11030:	
;ADE7758.c: 292: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(AD7758_check_init@chip),w
	fcall	_AD7758_CS
	line	295
	
l11032:	
;ADE7758.c: 295: AD7758_GetData(0x16,1,chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(AD7758_check_init@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(016h)
	fcall	_AD7758_GetData
	line	296
	
l11034:	
;ADE7758.c: 296: if ( 0x00 == ReadData[0])
	movf	(_ReadData),f
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l11040
u1440:
	line	298
	
l11036:	
;ADE7758.c: 297: {
;ADE7758.c: 298: AD7758_GetData(0x17,1,chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(AD7758_check_init@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(017h)
	fcall	_AD7758_GetData
	line	299
	
l11038:	
;ADE7758.c: 299: if ( 0x40 != ReadData[0])
	movf	(_ReadData),w
	xorlw	040h&0ffh
	skipnz
	goto	u1451
	goto	u1450
u1451:
	goto	l11044
u1450:
	line	301
	
l11040:	
;ADE7758.c: 300: {
;ADE7758.c: 301: ret = 0;
	clrf	(AD7758_check_init@ret)
	line	310
	
l11044:	
;ADE7758.c: 307: }
;ADE7758.c: 310: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(AD7758_check_init@chip),w
	fcall	_AD7758_CS
	line	313
	
l11046:	
;ADE7758.c: 313: return ret;
	movf	(AD7758_check_init@ret),w
	line	314
	
l1485:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_check_init
	__end_of_AD7758_check_init:
;; =============== function _AD7758_check_init ends ============

	signat	_AD7758_check_init,4217
	global	_Sample_ADE7758
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _Sample_ADE7758 *****************
;; Defined at:
;;		line 148 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  chip            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chip            1   32[BANK0 ] unsigned char 
;;  sum             2   30[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       3       0       0       0       0
;;      Temps:          0      20       0       0       0       0
;;      Totals:         0      23       0       0       0       0
;;Total ram usage:       23 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD7758_CS
;;		_AD7758_GetData
;;		___bmul
;;		_AD7758_SendData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text523
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	148
	global	__size_of_Sample_ADE7758
	__size_of_Sample_ADE7758	equ	__end_of_Sample_ADE7758-_Sample_ADE7758
	
_Sample_ADE7758:	
	opt	stack 11
; Regs used in _Sample_ADE7758: [wreg+fsr1l-status,0+pclath+cstack]
;Sample_ADE7758@chip stored from wreg
	line	152
	movlb 0	; select bank0
	movwf	(Sample_ADE7758@chip)
	
l10948:	
;ADE7758.c: 149: uint sum;
;ADE7758.c: 152: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(Sample_ADE7758@chip),w
	fcall	_AD7758_CS
	line	155
	
l10950:	
;ADE7758.c: 155: AD7758_GetData(0x10, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(010h)
	fcall	_AD7758_GetData
	line	156
	
l10952:	
;ADE7758.c: 156: if( FreqPhase[chip-1] == 1 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	decf	indf1,w
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l10962
u1350:
	line	158
	
l10954:	
;ADE7758.c: 157: {
;ADE7758.c: 158: ADE7758Data[chip-1].PhaseA.Frequency[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+1)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	159
;ADE7758.c: 159: ADE7758Data[chip-1].PhaseA.Frequency[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(01h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(01h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	160
	
l10956:	
;ADE7758.c: 160: FreqPhase[chip-1] = 2;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(02h)
	movwf	indf1
	line	161
	
l10958:	
;ADE7758.c: 161: SendData[0] = 0x01;
	clrf	(_SendData)
	incf	(_SendData),f
	line	162
	
l10960:	
;ADE7758.c: 162: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	163
;ADE7758.c: 163: }
	goto	l10982
	line	164
	
l10962:	
;ADE7758.c: 164: else if( FreqPhase[chip-1] == 2 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	02h&0ffh
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l10972
u1360:
	line	166
	
l10964:	
;ADE7758.c: 165: {
;ADE7758.c: 166: ADE7758Data[chip-1].PhaseB.Frequency[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(010h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(010h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	167
;ADE7758.c: 167: ADE7758Data[chip-1].PhaseB.Frequency[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(011h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(011h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	168
	
l10966:	
;ADE7758.c: 168: FreqPhase[chip-1] = 3;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(03h)
	movwf	indf1
	line	169
	
l10968:	
;ADE7758.c: 169: SendData[0] = 0x02;
	movlw	(02h)
	movwf	(_SendData)
	line	170
	
l10970:	
;ADE7758.c: 170: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	171
;ADE7758.c: 171: }
	goto	l10982
	line	172
	
l10972:	
;ADE7758.c: 172: else if( FreqPhase[chip-1] == 3 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	03h&0ffh
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l10982
u1370:
	line	174
	
l10974:	
;ADE7758.c: 173: {
;ADE7758.c: 174: ADE7758Data[chip-1].PhaseC.Frequency[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(020h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(020h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	175
;ADE7758.c: 175: ADE7758Data[chip-1].PhaseC.Frequency[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(021h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(021h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	176
	
l10976:	
;ADE7758.c: 176: FreqPhase[chip-1] = 1;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	incf	indf1,f
	line	177
	
l10978:	
;ADE7758.c: 177: SendData[0] = 0x00;
	clrf	(_SendData)
	line	178
	
l10980:	
;ADE7758.c: 178: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	182
	
l10982:	
;ADE7758.c: 179: }
;ADE7758.c: 182: AD7758_GetData(0x01, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(01h)
	fcall	_AD7758_GetData
	line	183
	
l10984:	
;ADE7758.c: 183: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1381
	goto	u1380
u1381:
	goto	l10988
u1380:
	line	185
	
l10986:	
;ADE7758.c: 184: {
;ADE7758.c: 185: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	186
;ADE7758.c: 186: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	190
	
l10988:	
;ADE7758.c: 187: }
;ADE7758.c: 189: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Active_Power[0]) << 8) +
;ADE7758.c: 190: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Active_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(08h)
	movwf	fsr1l
	movlw	high(08h)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(09h)
	movwf	fsr1l
	movlw	high(09h)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	192
	
l10990:	
;ADE7758.c: 192: ADE7758Data[chip-1].PhaseA.Active_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(08h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(08h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	193
	
l10992:	
;ADE7758.c: 193: ADE7758Data[chip-1].PhaseA.Active_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(09h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(09h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	194
	
l10994:	
;ADE7758.c: 194: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l1474
u1390:
	line	196
	
l10996:	
;ADE7758.c: 195: {
;ADE7758.c: 196: ADE7758Data[chip-1].PhaseA.Energy += sum;
	movf	(Sample_ADE7758@sum),w
	movwf	((??_Sample_ADE7758+0)+0)
	movf	(Sample_ADE7758@sum+1),w
	movwf	((??_Sample_ADE7758+0)+0+1)
	clrf	((??_Sample_ADE7758+0)+0+2)
	clrf	((??_Sample_ADE7758+0)+0+3)
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+4)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+4)+0
	movf	0+(??_Sample_ADE7758+4)+0,w
	addlw	low(0Ch)
	movwf	fsr1l
	movlw	high(0Ch)
	addwfc	1+(??_Sample_ADE7758+4)+0,w
	movwf	1+fsr1l
	movf	0+(??_Sample_ADE7758+0)+0,w
	addwf	indf1,f
	addfsr	fsr1,1
	movf	1+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	2+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	3+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f

	line	197
	
l1474:	
	line	199
;ADE7758.c: 197: }
;ADE7758.c: 199: AD7758_GetData(0x02, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(02h)
	fcall	_AD7758_GetData
	line	200
	
l10998:	
;ADE7758.c: 200: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1401
	goto	u1400
u1401:
	goto	l11002
u1400:
	line	202
	
l11000:	
;ADE7758.c: 201: {
;ADE7758.c: 202: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	203
;ADE7758.c: 203: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	206
	
l11002:	
;ADE7758.c: 204: }
;ADE7758.c: 205: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Active_Power[0]) << 8) +
;ADE7758.c: 206: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Active_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(018h)
	movwf	fsr1l
	movlw	high(018h)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(019h)
	movwf	fsr1l
	movlw	high(019h)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	208
	
l11004:	
;ADE7758.c: 208: ADE7758Data[chip-1].PhaseB.Active_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(018h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(018h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	209
	
l11006:	
;ADE7758.c: 209: ADE7758Data[chip-1].PhaseB.Active_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(019h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(019h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	210
	
l11008:	
;ADE7758.c: 210: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l1476
u1410:
	line	212
	
l11010:	
;ADE7758.c: 211: {
;ADE7758.c: 212: ADE7758Data[chip-1].PhaseB.Energy += sum;
	movf	(Sample_ADE7758@sum),w
	movwf	((??_Sample_ADE7758+0)+0)
	movf	(Sample_ADE7758@sum+1),w
	movwf	((??_Sample_ADE7758+0)+0+1)
	clrf	((??_Sample_ADE7758+0)+0+2)
	clrf	((??_Sample_ADE7758+0)+0+3)
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+4)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+4)+0
	movf	0+(??_Sample_ADE7758+4)+0,w
	addlw	low(01Ch)
	movwf	fsr1l
	movlw	high(01Ch)
	addwfc	1+(??_Sample_ADE7758+4)+0,w
	movwf	1+fsr1l
	movf	0+(??_Sample_ADE7758+0)+0,w
	addwf	indf1,f
	addfsr	fsr1,1
	movf	1+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	2+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	3+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f

	line	213
	
l1476:	
	line	215
;ADE7758.c: 213: }
;ADE7758.c: 215: AD7758_GetData(0x03, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(03h)
	fcall	_AD7758_GetData
	line	216
	
l11012:	
;ADE7758.c: 216: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1421
	goto	u1420
u1421:
	goto	l11016
u1420:
	line	218
	
l11014:	
;ADE7758.c: 217: {
;ADE7758.c: 218: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	219
;ADE7758.c: 219: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	222
	
l11016:	
;ADE7758.c: 220: }
;ADE7758.c: 221: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Active_Power[0]) << 8) +
;ADE7758.c: 222: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Active_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(028h)
	movwf	fsr1l
	movlw	high(028h)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(029h)
	movwf	fsr1l
	movlw	high(029h)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	224
	
l11018:	
;ADE7758.c: 224: ADE7758Data[chip-1].PhaseC.Active_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(028h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(028h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	225
	
l11020:	
;ADE7758.c: 225: ADE7758Data[chip-1].PhaseC.Active_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(029h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(029h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	226
	
l11022:	
;ADE7758.c: 226: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l1478
u1430:
	line	228
	
l11024:	
;ADE7758.c: 227: {
;ADE7758.c: 228: ADE7758Data[chip-1].PhaseC.Energy += sum;
	movf	(Sample_ADE7758@sum),w
	movwf	((??_Sample_ADE7758+0)+0)
	movf	(Sample_ADE7758@sum+1),w
	movwf	((??_Sample_ADE7758+0)+0+1)
	clrf	((??_Sample_ADE7758+0)+0+2)
	clrf	((??_Sample_ADE7758+0)+0+3)
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+4)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+4)+0
	movf	0+(??_Sample_ADE7758+4)+0,w
	addlw	low(02Ch)
	movwf	fsr1l
	movlw	high(02Ch)
	addwfc	1+(??_Sample_ADE7758+4)+0,w
	movwf	1+fsr1l
	movf	0+(??_Sample_ADE7758+0)+0,w
	addwf	indf1,f
	addfsr	fsr1,1
	movf	1+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	2+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f
	addfsr	fsr1,1
	movf	3+(??_Sample_ADE7758+0)+0,w
	addwfc	indf1,f

	line	229
	
l1478:	
	line	231
;ADE7758.c: 229: }
;ADE7758.c: 231: AD7758_GetData(0x0D, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Dh)
	fcall	_AD7758_GetData
	line	232
;ADE7758.c: 232: ADE7758Data[chip-1].PhaseA.Voltage[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(02h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(02h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	233
;ADE7758.c: 233: ADE7758Data[chip-1].PhaseA.Voltage[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(03h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(03h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	234
;ADE7758.c: 234: ADE7758Data[chip-1].PhaseA.Voltage[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(04h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(04h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	236
;ADE7758.c: 236: AD7758_GetData(0x0E, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Eh)
	fcall	_AD7758_GetData
	line	237
;ADE7758.c: 237: ADE7758Data[chip-1].PhaseB.Voltage[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(012h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(012h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	238
;ADE7758.c: 238: ADE7758Data[chip-1].PhaseB.Voltage[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(013h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(013h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	239
;ADE7758.c: 239: ADE7758Data[chip-1].PhaseB.Voltage[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(014h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(014h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	241
;ADE7758.c: 241: AD7758_GetData(0x0F, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Fh)
	fcall	_AD7758_GetData
	line	242
;ADE7758.c: 242: ADE7758Data[chip-1].PhaseC.Voltage[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(022h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(022h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	243
;ADE7758.c: 243: ADE7758Data[chip-1].PhaseC.Voltage[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(023h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(023h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	244
;ADE7758.c: 244: ADE7758Data[chip-1].PhaseC.Voltage[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(024h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(024h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	246
;ADE7758.c: 246: AD7758_GetData(0x0A, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Ah)
	fcall	_AD7758_GetData
	line	247
;ADE7758.c: 247: ADE7758Data[chip-1].PhaseA.Current[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(05h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(05h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	248
;ADE7758.c: 248: ADE7758Data[chip-1].PhaseA.Current[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(06h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(06h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	249
;ADE7758.c: 249: ADE7758Data[chip-1].PhaseA.Current[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(07h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(07h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	251
;ADE7758.c: 251: AD7758_GetData(0x0B, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Bh)
	fcall	_AD7758_GetData
	line	252
;ADE7758.c: 252: ADE7758Data[chip-1].PhaseB.Current[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(015h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(015h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	253
;ADE7758.c: 253: ADE7758Data[chip-1].PhaseB.Current[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(016h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(016h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	254
;ADE7758.c: 254: ADE7758Data[chip-1].PhaseB.Current[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(017h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(017h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	256
;ADE7758.c: 256: AD7758_GetData(0x0C, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Ch)
	fcall	_AD7758_GetData
	line	257
;ADE7758.c: 257: ADE7758Data[chip-1].PhaseC.Current[0]=ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(025h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(025h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	258
;ADE7758.c: 258: ADE7758Data[chip-1].PhaseC.Current[1]=ReadData[1];
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(026h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(026h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	259
;ADE7758.c: 259: ADE7758Data[chip-1].PhaseC.Current[2]=ReadData[2];
	movf	0+(_ReadData)+02h,w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(027h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(027h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	261
;ADE7758.c: 261: AD7758_GetData(0x07, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(07h)
	fcall	_AD7758_GetData
	line	263
;ADE7758.c: 262: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Apparent_Power[0]) << 8) +
;ADE7758.c: 263: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Apparent_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(0Ah)
	movwf	fsr1l
	movlw	high(0Ah)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(0Bh)
	movwf	fsr1l
	movlw	high(0Bh)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	264
;ADE7758.c: 264: ADE7758Data[chip-1].PhaseA.Apparent_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(0Ah)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(0Ah)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	265
;ADE7758.c: 265: ADE7758Data[chip-1].PhaseA.Apparent_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(0Bh)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(0Bh)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	267
;ADE7758.c: 267: AD7758_GetData(0x08, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(08h)
	fcall	_AD7758_GetData
	line	269
;ADE7758.c: 268: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Apparent_Power[0]) << 8) +
;ADE7758.c: 269: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Apparent_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(01Ah)
	movwf	fsr1l
	movlw	high(01Ah)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(01Bh)
	movwf	fsr1l
	movlw	high(01Bh)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	270
;ADE7758.c: 270: ADE7758Data[chip-1].PhaseB.Apparent_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(01Ah)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(01Ah)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	271
;ADE7758.c: 271: ADE7758Data[chip-1].PhaseB.Apparent_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(01Bh)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(01Bh)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	273
;ADE7758.c: 273: AD7758_GetData(0x09, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(09h)
	fcall	_AD7758_GetData
	line	275
;ADE7758.c: 274: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Apparent_Power[0]) << 8) +
;ADE7758.c: 275: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Apparent_Power[1])) >> 1);
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+0)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+0)+0
	movf	0+(??_Sample_ADE7758+0)+0,w
	addlw	low(02Ah)
	movwf	fsr1l
	movlw	high(02Ah)
	addwfc	1+(??_Sample_ADE7758+0)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+2)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+2)+0+1
	clrf	(??_Sample_ADE7758+2)+0+2
	clrf	(??_Sample_ADE7758+2)+0+3
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+6)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+6)+0+1
	clrf	(??_Sample_ADE7758+6)+0+2
	clrf	(??_Sample_ADE7758+6)+0+3
	movf	0+(??_Sample_ADE7758+6)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+6)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	movf	(??_Sample_ADE7758+2)+2,w
	movwf	(??_Sample_ADE7758+2)+3
	movf	(??_Sample_ADE7758+2)+1,w
	movwf	(??_Sample_ADE7758+2)+2
	movf	(??_Sample_ADE7758+2)+0,w
	movwf	(??_Sample_ADE7758+2)+1
	clrf	(??_Sample_ADE7758+2)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+10)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+10)+0
	movf	0+(??_Sample_ADE7758+10)+0,w
	addlw	low(02Bh)
	movwf	fsr1l
	movlw	high(02Bh)
	addwfc	1+(??_Sample_ADE7758+10)+0,w
	movwf	1+fsr1l
	movf	indf1,w
	movwf	(??_Sample_ADE7758+12)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+12)+0+1
	clrf	(??_Sample_ADE7758+12)+0+2
	clrf	(??_Sample_ADE7758+12)+0+3
	movf	0+(_ReadData)+01h,w
	movwf	(??_Sample_ADE7758+16)+0
	movlw	(0x0/2)
	movwf	(??_Sample_ADE7758+16)+0+1
	clrf	(??_Sample_ADE7758+16)+0+2
	clrf	(??_Sample_ADE7758+16)+0+3
	movf	0+(??_Sample_ADE7758+16)+0,w
	addwf	(??_Sample_ADE7758+12)+0,f
	movf	1+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+1,f
	movf	2+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+2,f
	movf	3+(??_Sample_ADE7758+16)+0,w
	addwfc	(??_Sample_ADE7758+12)+3,f
	movf	0+(??_Sample_ADE7758+12)+0,w
	addwf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+1,f
	movf	2+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+2,f
	movf	3+(??_Sample_ADE7758+12)+0,w
	addwfc	(??_Sample_ADE7758+2)+3,f
	lsrf	(??_Sample_ADE7758+2)+3,f
	rrf	(??_Sample_ADE7758+2)+2,f
	rrf	(??_Sample_ADE7758+2)+1,f
	rrf	(??_Sample_ADE7758+2)+0,f
	movf	1+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum+1)
	movf	0+(??_Sample_ADE7758+2)+0,w
	movwf	(Sample_ADE7758@sum)
	line	276
;ADE7758.c: 276: ADE7758Data[chip-1].PhaseC.Apparent_Power[0] = (uchar)(sum>>8);
	movf	(Sample_ADE7758@sum+1),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(02Ah)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(02Ah)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	277
;ADE7758.c: 277: ADE7758Data[chip-1].PhaseC.Apparent_Power[1] = (uchar)sum;
	movf	(Sample_ADE7758@sum),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(02Bh)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(02Bh)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	279
;ADE7758.c: 279: AD7758_GetData(0x11, 1, chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(011h)
	fcall	_AD7758_GetData
	line	280
;ADE7758.c: 280: ADE7758Data[chip-1].Temper = (schar)ReadData[0];
	movf	(_ReadData),w
	movwf	(??_Sample_ADE7758+0)+0
	movlw	(031h)
	movwf	(?___bmul)
	movf	(Sample_ADE7758@chip),w
	fcall	___bmul
	addlw	low(8462+0FFCFh)
	movwf	(??_Sample_ADE7758+1)+0
	movlw	high(8462+0FFCFh)
	skipnc
	incf	wreg,f
	movwf	1+(??_Sample_ADE7758+1)+0
	movf	0+(??_Sample_ADE7758+1)+0,w
	addlw	low(030h)
	movwf	(??_Sample_ADE7758+3)+0
	movlw	high(030h)
	addwfc	1+(??_Sample_ADE7758+1)+0,w
	movwf	1+(??_Sample_ADE7758+3)+0
	movf	0+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1l
	movf	1+(??_Sample_ADE7758+3)+0,w
	movwf	fsr1h
	movf	(??_Sample_ADE7758+0)+0,w
	movwf	indf1
	line	283
	
l11026:	
;ADE7758.c: 283: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(Sample_ADE7758@chip),w
	fcall	_AD7758_CS
	line	285
	
l1479:	
	return
	opt stack 0
GLOBAL	__end_of_Sample_ADE7758
	__end_of_Sample_ADE7758:
;; =============== function _Sample_ADE7758 ends ============

	signat	_Sample_ADE7758,4216
	global	_AD7758_init
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _AD7758_init *****************
;; Defined at:
;;		line 121 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  chip            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chip            1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD7758_CS
;;		_AD7758_SendData
;;		_Delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	121
	global	__size_of_AD7758_init
	__size_of_AD7758_init	equ	__end_of_AD7758_init-_AD7758_init
	
_AD7758_init:	
	opt	stack 11
; Regs used in _AD7758_init: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_init@chip stored from wreg
	line	123
	movwf	(AD7758_init@chip)
	
l10924:	
;ADE7758.c: 123: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(AD7758_init@chip),w
	fcall	_AD7758_CS
	line	126
	
l10926:	
;ADE7758.c: 126: SendData[0] = 0x40;
	movlw	(040h)
	movwf	(_SendData)
	line	127
	
l10928:	
;ADE7758.c: 127: AD7758_SendData(0x13,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(013h)
	fcall	_AD7758_SendData
	line	128
	
l10930:	
;ADE7758.c: 128: Delay(0x20);
	movlw	020h
	movwf	(?_Delay)
	clrf	(?_Delay+1)
	clrf	(?_Delay+2)
	clrf	(?_Delay+3)

	fcall	_Delay
	line	130
	
l10932:	
;ADE7758.c: 130: SendData[0] = 0x00;
	clrf	(_SendData)
	line	131
	
l10934:	
;ADE7758.c: 131: AD7758_SendData(0x16,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(016h)
	fcall	_AD7758_SendData
	line	133
	
l10936:	
;ADE7758.c: 133: SendData[0] = 0x40;
	movlw	(040h)
	movwf	(_SendData)
	line	134
	
l10938:	
;ADE7758.c: 134: AD7758_SendData(0x17,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(017h)
	fcall	_AD7758_SendData
	line	136
	
l10940:	
;ADE7758.c: 136: SendData[0] = 0x00;
	clrf	(_SendData)
	line	137
;ADE7758.c: 137: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	138
	
l10942:	
;ADE7758.c: 138: FreqPhase[0] = 1;
	clrf	(_FreqPhase)
	incf	(_FreqPhase),f
	line	139
	
l10944:	
;ADE7758.c: 139: FreqPhase[1] = 1;
	clrf	0+(_FreqPhase)+01h
	incf	0+(_FreqPhase)+01h,f
	line	142
	
l10946:	
;ADE7758.c: 142: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(AD7758_init@chip),w
	fcall	_AD7758_CS
	line	145
	
l1465:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_init
	__end_of_AD7758_init:
;; =============== function _AD7758_init ends ============

	signat	_AD7758_init,4216
	global	_sendHAHA
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _sendHAHA *****************
;; Defined at:
;;		line 47 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cal_temp        4   31[BANK0 ] volatile unsigned long 
;;  cal_temp2       4   27[BANK0 ] volatile unsigned long 
;;  cal_temp1       4   23[BANK0 ] volatile unsigned long 
;;  cal_temp3       4   17[BANK0 ] volatile unsigned long 
;;  idx             2   21[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1F/1
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0      18       0       0       0       0
;;      Temps:          0       4       0       0       0       0
;;      Totals:         0      22       0       0       0       0
;;Total ram usage:       22 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lldiv
;;		___lmul
;;		_ModbusCalcCRC
;;		_rs485_send_data
;; This function is called by:
;;		_modbus_main
;; This function uses a non-reentrant model
;;
psect	text525
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
	line	47
	global	__size_of_sendHAHA
	__size_of_sendHAHA	equ	__end_of_sendHAHA-_sendHAHA
	
_sendHAHA:	
	opt	stack 11
; Regs used in _sendHAHA: [wreg+fsr1l-status,0+pclath+cstack]
	line	48
	
l10638:	
;modbus.c: 48: int idx = 0;
	movlb 0	; select bank0
	clrf	(sendHAHA@idx)
	clrf	(sendHAHA@idx+1)
	line	51
	
l10640:	
;modbus.c: 49: volatile unsigned long cal_temp,cal_temp1,cal_temp2,cal_temp3;
;modbus.c: 51: tx_data[idx++] = 0XC9;
	movlw	(0C9h)
	movlb 1	; select bank1
	movwf	(_tx_data)^080h	;volatile
	
l10642:	
	movlb 0	; select bank0
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	52
	
l10644:	
;modbus.c: 52: tx_data[idx++] = 0X03;
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(03h)
	movwf	indf1
	
l10646:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	53
	
l10648:	
;modbus.c: 53: tx_data[idx++] = 36;
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(024h)
	movwf	indf1
	
l10650:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	57
	
l10652:	
;modbus.c: 57: cal_temp1 = ADE7758Data[0].PhaseA.Voltage[0];
	movlw	02h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	58
	
l10654:	
;modbus.c: 58: cal_temp2 = ADE7758Data[0].PhaseA.Voltage[1];
	movlw	03h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	59
	
l10656:	
;modbus.c: 59: cal_temp3 = ADE7758Data[0].PhaseA.Voltage[2];
	movlw	04h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	60
	
l10658:	
;modbus.c: 60: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10660:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10662:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	61
	
l10664:	
;modbus.c: 61: cal_temp = cal_temp/359;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	01h
	movwf	(?___lldiv+1)
	movlw	067h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	62
	
l10666:	
;modbus.c: 62: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10668:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	63
	
l10670:	
;modbus.c: 63: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10672:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	64
	
l10674:	
;modbus.c: 64: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10676:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	65
	
l10678:	
;modbus.c: 65: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10680:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	69
	
l10682:	
;modbus.c: 69: cal_temp1 = ADE7758Data[0].PhaseA.Current[0];
	movlw	05h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	70
	
l10684:	
;modbus.c: 70: cal_temp2 = ADE7758Data[0].PhaseA.Current[1];
	movlw	06h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	71
	
l10686:	
;modbus.c: 71: cal_temp3 = ADE7758Data[0].PhaseA.Current[2];
	movlw	07h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	72
	
l10688:	
;modbus.c: 72: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10690:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10692:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	73
	
l10694:	
;modbus.c: 73: cal_temp = cal_temp/1732;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	06h
	movwf	(?___lldiv+1)
	movlw	0C4h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	74
	
l10696:	
;modbus.c: 74: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10698:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	75
	
l10700:	
;modbus.c: 75: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10702:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	76
	
l10704:	
;modbus.c: 76: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10706:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	77
	
l10708:	
;modbus.c: 77: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10710:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	79
	
l10712:	
;modbus.c: 79: cal_temp1 = ADE7758Data[0].PhaseA.Active_Power[0];
	movlw	08h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	80
	
l10714:	
;modbus.c: 80: cal_temp2 = ADE7758Data[0].PhaseA.Active_Power[1];
	movlw	09h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	81
	
l10716:	
;modbus.c: 81: cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	movf	(sendHAHA@cal_temp1+2),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+1)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	
l10718:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	82
	
l10720:	
;modbus.c: 82: cal_temp = cal_temp*80;
	movlw	050h
	movwf	(?___lmul)
	clrf	(?___lmul+1)
	clrf	(?___lmul+2)
	clrf	(?___lmul+3)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lmul)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lmul)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	83
	
l10722:	
;modbus.c: 83: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10724:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	84
	
l10726:	
;modbus.c: 84: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10728:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	85
	
l10730:	
;modbus.c: 85: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10732:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	86
	
l10734:	
;modbus.c: 86: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10736:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	90
	
l10738:	
;modbus.c: 90: cal_temp1 = ADE7758Data[0].PhaseB.Voltage[0];
	movlw	012h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	91
	
l10740:	
;modbus.c: 91: cal_temp2 = ADE7758Data[0].PhaseB.Voltage[1];
	movlw	013h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	92
	
l10742:	
;modbus.c: 92: cal_temp3 = ADE7758Data[0].PhaseB.Voltage[2];
	movlw	014h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	93
	
l10744:	
;modbus.c: 93: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10746:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10748:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	94
	
l10750:	
;modbus.c: 94: cal_temp = cal_temp/359;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	01h
	movwf	(?___lldiv+1)
	movlw	067h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	95
	
l10752:	
;modbus.c: 95: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10754:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	96
	
l10756:	
;modbus.c: 96: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10758:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	97
	
l10760:	
;modbus.c: 97: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10762:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	98
	
l10764:	
;modbus.c: 98: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10766:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	102
	
l10768:	
;modbus.c: 102: cal_temp1 = ADE7758Data[0].PhaseB.Current[0];
	movlw	015h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	103
	
l10770:	
;modbus.c: 103: cal_temp2 = ADE7758Data[0].PhaseB.Current[1];
	movlw	016h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	104
	
l10772:	
;modbus.c: 104: cal_temp3 = ADE7758Data[0].PhaseB.Current[2];
	movlw	017h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	105
	
l10774:	
;modbus.c: 105: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10776:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10778:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	106
	
l10780:	
;modbus.c: 106: cal_temp = cal_temp/1732;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	06h
	movwf	(?___lldiv+1)
	movlw	0C4h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	107
	
l10782:	
;modbus.c: 107: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10784:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	108
	
l10786:	
;modbus.c: 108: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10788:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	109
	
l10790:	
;modbus.c: 109: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10792:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	110
	
l10794:	
;modbus.c: 110: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10796:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	112
	
l10798:	
;modbus.c: 112: cal_temp1 = ADE7758Data[0].PhaseB.Active_Power[0];
	movlw	018h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	113
	
l10800:	
;modbus.c: 113: cal_temp2 = ADE7758Data[0].PhaseB.Active_Power[1];
	movlw	019h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	114
	
l10802:	
;modbus.c: 114: cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	movf	(sendHAHA@cal_temp1+2),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+1)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	
l10804:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	115
	
l10806:	
;modbus.c: 115: cal_temp = cal_temp*80;
	movlw	050h
	movwf	(?___lmul)
	clrf	(?___lmul+1)
	clrf	(?___lmul+2)
	clrf	(?___lmul+3)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lmul)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lmul)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	116
	
l10808:	
;modbus.c: 116: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10810:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	117
	
l10812:	
;modbus.c: 117: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10814:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	118
	
l10816:	
;modbus.c: 118: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10818:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	119
	
l10820:	
;modbus.c: 119: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10822:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	124
	
l10824:	
;modbus.c: 124: cal_temp1 = ADE7758Data[0].PhaseC.Voltage[0];
	movlw	022h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	125
	
l10826:	
;modbus.c: 125: cal_temp2 = ADE7758Data[0].PhaseC.Voltage[1];
	movlw	023h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	126
	
l10828:	
;modbus.c: 126: cal_temp3 = ADE7758Data[0].PhaseC.Voltage[2];
	movlw	024h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	127
	
l10830:	
;modbus.c: 127: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10832:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10834:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	128
	
l10836:	
;modbus.c: 128: cal_temp = cal_temp/359;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	01h
	movwf	(?___lldiv+1)
	movlw	067h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	129
	
l10838:	
;modbus.c: 129: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10840:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	130
	
l10842:	
;modbus.c: 130: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10844:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	131
	
l10846:	
;modbus.c: 131: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10848:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	132
	
l10850:	
;modbus.c: 132: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10852:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	136
	
l10854:	
;modbus.c: 136: cal_temp1 = ADE7758Data[0].PhaseC.Current[0];
	movlw	025h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	137
	
l10856:	
;modbus.c: 137: cal_temp2 = ADE7758Data[0].PhaseC.Current[1];
	movlw	026h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	138
	
l10858:	
;modbus.c: 138: cal_temp3 = ADE7758Data[0].PhaseC.Current[2];
	movlw	027h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp3)	;volatile
	clrf	(sendHAHA@cal_temp3+1)	;volatile
	clrf	(sendHAHA@cal_temp3+2)	;volatile
	clrf	(sendHAHA@cal_temp3+3)	;volatile

	line	139
	
l10860:	
;modbus.c: 139: cal_temp = (unsigned long)((cal_temp1<<16)|(cal_temp2<<8)|(cal_temp3));
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	clrf	(sendHAHA@cal_temp+1)	;volatile
	
l10862:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	movwf	(??_sendHAHA+0)+0
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	movwf	((??_sendHAHA+0)+0+1)
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	movwf	((??_sendHAHA+0)+0+2)
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	movwf	((??_sendHAHA+0)+0+3)
	movf	(??_sendHAHA+0)+2,w
	movwf	(??_sendHAHA+0)+3
	movf	(??_sendHAHA+0)+1,w
	movwf	(??_sendHAHA+0)+2
	movf	(??_sendHAHA+0)+0,w
	movwf	(??_sendHAHA+0)+1
	clrf	(??_sendHAHA+0)+0
	movf	0+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	1+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	2+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	3+(??_sendHAHA+0)+0,w
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	
l10864:	
	movf	(sendHAHA@cal_temp3),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp3+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp3+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp3+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	140
	
l10866:	
;modbus.c: 140: cal_temp = cal_temp/1732;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	06h
	movwf	(?___lldiv+1)
	movlw	0C4h
	movwf	(?___lldiv)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lldiv)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lldiv)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	141
	
l10868:	
;modbus.c: 141: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10870:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	142
	
l10872:	
;modbus.c: 142: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10874:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	143
	
l10876:	
;modbus.c: 143: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10878:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	144
	
l10880:	
;modbus.c: 144: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10882:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	146
	
l10884:	
;modbus.c: 146: cal_temp1 = ADE7758Data[0].PhaseC.Active_Power[0];
	movlw	028h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp1)	;volatile
	clrf	(sendHAHA@cal_temp1+1)	;volatile
	clrf	(sendHAHA@cal_temp1+2)	;volatile
	clrf	(sendHAHA@cal_temp1+3)	;volatile

	line	147
	
l10886:	
;modbus.c: 147: cal_temp2 = ADE7758Data[0].PhaseC.Active_Power[1];
	movlw	029h
	addlw	low 8462
	movwf	fsr1l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr1l)+1
	movf	indf1,w
	movwf	(sendHAHA@cal_temp2)	;volatile
	clrf	(sendHAHA@cal_temp2+1)	;volatile
	clrf	(sendHAHA@cal_temp2+2)	;volatile
	clrf	(sendHAHA@cal_temp2+3)	;volatile

	line	148
	
l10888:	
;modbus.c: 148: cal_temp = (unsigned long)((cal_temp1<<8)|(cal_temp2));
	movf	(sendHAHA@cal_temp1+2),w	;volatile
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(sendHAHA@cal_temp1+1),w	;volatile
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(sendHAHA@cal_temp1),w	;volatile
	movwf	(sendHAHA@cal_temp+1)	;volatile
	clrf	(sendHAHA@cal_temp)	;volatile
	
l10890:	
	movf	(sendHAHA@cal_temp2),w	;volatile
	iorwf	(sendHAHA@cal_temp),f	;volatile
	movf	(sendHAHA@cal_temp2+1),w	;volatile
	iorwf	(sendHAHA@cal_temp+1),f	;volatile
	movf	(sendHAHA@cal_temp2+2),w	;volatile
	iorwf	(sendHAHA@cal_temp+2),f	;volatile
	movf	(sendHAHA@cal_temp2+3),w	;volatile
	iorwf	(sendHAHA@cal_temp+3),f	;volatile
	line	149
	
l10892:	
;modbus.c: 149: cal_temp = cal_temp*80;
	movlw	050h
	movwf	(?___lmul)
	clrf	(?___lmul+1)
	clrf	(?___lmul+2)
	clrf	(?___lmul+3)

	movf	(sendHAHA@cal_temp+3),w	;volatile
	movwf	3+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+2),w	;volatile
	movwf	2+(?___lmul)+04h
	movf	(sendHAHA@cal_temp+1),w	;volatile
	movwf	1+(?___lmul)+04h
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+3)	;volatile
	movf	(2+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+2)	;volatile
	movf	(1+(?___lmul)),w
	movwf	(sendHAHA@cal_temp+1)	;volatile
	movf	(0+(?___lmul)),w
	movwf	(sendHAHA@cal_temp)	;volatile

	line	150
	
l10894:	
;modbus.c: 150: tx_data[idx++] = (unsigned char)(cal_temp>>24);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+3),w	;volatile
	movwf	indf1
	
l10896:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	151
	
l10898:	
;modbus.c: 151: tx_data[idx++] = (unsigned char)(cal_temp>>16);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+2),w	;volatile
	movwf	indf1
	
l10900:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	152
	
l10902:	
;modbus.c: 152: tx_data[idx++] = (unsigned char)(cal_temp>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(((sendHAHA@cal_temp))+1),w	;volatile
	movwf	indf1
	
l10904:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	153
	
l10906:	
;modbus.c: 153: tx_data[idx++] = (unsigned char)(cal_temp);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendHAHA@cal_temp),w	;volatile
	movwf	indf1
	
l10908:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	155
	
l10910:	
;modbus.c: 155: ModbusCalcCRC(tx_data,idx);
	movlw	(_tx_data&0ffh)
	movwf	(?_ModbusCalcCRC)
	movlw	0x1/2
	movwf	(?_ModbusCalcCRC+1)
	movf	(sendHAHA@idx),w
	movwf	0+(?_ModbusCalcCRC)+02h
	fcall	_ModbusCalcCRC
	line	156
	
l10912:	
;modbus.c: 156: tx_data[idx++] = (unsigned char)(CRC);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_CRC),w	;volatile
	movwf	indf1
	
l10914:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	157
	
l10916:	
;modbus.c: 157: tx_data[idx++] = (unsigned char)(CRC>>8);
	movf	(sendHAHA@idx),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_CRC+1),w	;volatile
	movwf	indf1
	
l10918:	
	incf	(sendHAHA@idx),f
	skipnz
	incf	(sendHAHA@idx+1),f
	line	159
	
l10920:	
;modbus.c: 159: tx_data_num = idx;
	movf	(sendHAHA@idx),w
	movwf	(_tx_data_num)	;volatile
	line	160
	
l10922:	
;modbus.c: 160: rs485_send_data();
	fcall	_rs485_send_data
	line	161
	
l4463:	
	return
	opt stack 0
GLOBAL	__end_of_sendHAHA
	__end_of_sendHAHA:
;; =============== function _sendHAHA ends ============

	signat	_sendHAHA,88
	global	_AD7758_SendData
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _AD7758_SendData *****************
;; Defined at:
;;		line 90 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  num             1    6[BANK0 ] unsigned char 
;;  chip            1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    8[BANK0 ] unsigned char 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       2       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_spiSendByte
;; This function is called by:
;;		_AD7758_init
;;		_Sample_ADE7758
;; This function uses a non-reentrant model
;;
psect	text526
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	90
	global	__size_of_AD7758_SendData
	__size_of_AD7758_SendData	equ	__end_of_AD7758_SendData-_AD7758_SendData
	
_AD7758_SendData:	
	opt	stack 11
; Regs used in _AD7758_SendData: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_SendData@addr stored from wreg
	line	107
	movwf	(AD7758_SendData@addr)
	
l10628:	
;ADE7758.c: 91: uchar i;
;ADE7758.c: 107: spiSendByte(addr|0x80);
	movf	(AD7758_SendData@addr),w
	iorlw	080h
	fcall	_spiSendByte
	line	108
	
l10630:	
;ADE7758.c: 108: for(i=0;i<num;i++)
	clrf	(AD7758_SendData@i)
	goto	l10636
	line	110
	
l10632:	
;ADE7758.c: 109: {
;ADE7758.c: 110: spiSendByte (SendData[i]);
	movf	(AD7758_SendData@i),w
	addlw	_SendData&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	fcall	_spiSendByte
	line	108
	
l10634:	
	incf	(AD7758_SendData@i),f
	
l10636:	
	movf	(AD7758_SendData@num),w
	subwf	(AD7758_SendData@i),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l10632
u1340:
	line	118
	
l1462:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_SendData
	__end_of_AD7758_SendData:
;; =============== function _AD7758_SendData ends ============

	signat	_AD7758_SendData,12408
	global	_AD7758_GetData
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:

;; *************** function _AD7758_GetData *****************
;; Defined at:
;;		line 59 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  num             1    6[BANK0 ] unsigned char 
;;  chip            1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    8[BANK0 ] unsigned char 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       2       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_spiSendByte
;; This function is called by:
;;		_Sample_ADE7758
;;		_AD7758_check_init
;; This function uses a non-reentrant model
;;
psect	text527
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	59
	global	__size_of_AD7758_GetData
	__size_of_AD7758_GetData	equ	__end_of_AD7758_GetData-_AD7758_GetData
	
_AD7758_GetData:	
	opt	stack 11
; Regs used in _AD7758_GetData: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_GetData@addr stored from wreg
	line	76
	movwf	(AD7758_GetData@addr)
	
l10618:	
;ADE7758.c: 60: uchar i;
;ADE7758.c: 76: spiSendByte(addr);
	movf	(AD7758_GetData@addr),w
	fcall	_spiSendByte
	line	77
	
l10620:	
;ADE7758.c: 77: for(i=0;i<num;i++)
	clrf	(AD7758_GetData@i)
	goto	l10626
	line	79
	
l10622:	
;ADE7758.c: 78: {
;ADE7758.c: 79: ReadData[i] = spiSendByte (0x00);
	movf	(AD7758_GetData@i),w
	addlw	_ReadData&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0)
	fcall	_spiSendByte
	movwf	indf1
	line	77
	
l10624:	
	incf	(AD7758_GetData@i),f
	
l10626:	
	movf	(AD7758_GetData@num),w
	subwf	(AD7758_GetData@i),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l10622
u1330:
	line	87
	
l1456:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_GetData
	__end_of_AD7758_GetData:
;; =============== function _AD7758_GetData ends ============

	signat	_AD7758_GetData,12408
	global	_AD7758_CS
psect	text528,local,class=CODE,delta=2
global __ptext528
__ptext528:

;; *************** function _AD7758_CS *****************
;; Defined at:
;;		line 34 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
;; Parameters:    Size  Location     Type
;;  chip            1    wreg     unsigned char 
;;  enable          1    8[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chip            1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       1       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay
;; This function is called by:
;;		_AD7758_init
;;		_Sample_ADE7758
;;		_AD7758_check_init
;; This function uses a non-reentrant model
;;
psect	text528
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\ADE7758.c"
	line	34
	global	__size_of_AD7758_CS
	__size_of_AD7758_CS	equ	__end_of_AD7758_CS-_AD7758_CS
	
_AD7758_CS:	
	opt	stack 11
; Regs used in _AD7758_CS: [wreg+status,2+status,0+pclath+cstack]
;AD7758_CS@chip stored from wreg
	movwf	(AD7758_CS@chip)
	line	35
	
l10606:	
;ADE7758.c: 35: if (enable)
	movf	(AD7758_CS@enable),w
	skipz
	goto	u1300
	goto	l1445
u1300:
	line	37
	
l10608:	
;ADE7758.c: 36: {
;ADE7758.c: 37: if ( 1 == chip )
	decf	(AD7758_CS@chip),w
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l10612
u1310:
	line	39
	
l10610:	
;ADE7758.c: 38: {
;ADE7758.c: 39: RB3=0;
	bcf	(107/8),(107)&7
	line	40
;ADE7758.c: 40: RB0=1;
	bsf	(104/8),(104)&7
	line	41
;ADE7758.c: 41: }
	goto	l10616
	line	42
	
l10612:	
;ADE7758.c: 42: else if ( 2 == chip )
	movf	(AD7758_CS@chip),w
	xorlw	02h&0ffh
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l10616
u1320:
	line	44
	
l10614:	
;ADE7758.c: 43: {
;ADE7758.c: 44: RB0=0;
	bcf	(104/8),(104)&7
	line	45
;ADE7758.c: 45: RB3=1;
	bsf	(107/8),(107)&7
	goto	l10616
	line	48
	
l1445:	
	line	50
;ADE7758.c: 48: else
;ADE7758.c: 49: {
;ADE7758.c: 50: RB3=1;
	bsf	(107/8),(107)&7
	line	51
;ADE7758.c: 51: RB0=1;
	bsf	(104/8),(104)&7
	line	54
	
l10616:	
;ADE7758.c: 52: }
;ADE7758.c: 54: Delay(0x01);
	clrf	(?_Delay)
	incf	(?_Delay),f
	clrf	(?_Delay+1)
	clrf	(?_Delay+2)
	clrf	(?_Delay+3)
	fcall	_Delay
	line	55
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_CS
	__end_of_AD7758_CS:
;; =============== function _AD7758_CS ends ============

	signat	_AD7758_CS,8312
	global	___lldiv
psect	text529,local,class=CODE,delta=2
global __ptext529
__ptext529:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] unsigned long 
;;  dividend        4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    8[BANK0 ] unsigned long 
;;  counter         1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       8       0       0       0       0
;;      Locals:         0       5       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0      13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendHAHA
;; This function uses a non-reentrant model
;;
psect	text529
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 11
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l10580:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	10
	
l10582:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u1261
	goto	u1260
u1261:
	goto	l10602
u1260:
	line	11
	
l10584:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	12
	goto	l10588
	line	13
	
l10586:	
	lslf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	14
	incf	(___lldiv@counter),f
	line	12
	
l10588:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l10586
u1270:
	line	17
	
l10590:	
	lslf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	18
	
l10592:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u1285
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u1285
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u1285
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u1285:
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l10598
u1280:
	line	19
	
l10594:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	subwfb	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	subwfb	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	subwfb	(___lldiv@dividend+3),f
	line	20
	
l10596:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	22
	
l10598:	
	lsrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	23
	
l10600:	
	decfsz	(___lldiv@counter),f
	goto	u1291
	goto	u1290
u1291:
	goto	l10590
u1290:
	line	25
	
l10602:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	26
	
l7453:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___lmul
psect	text530,local,class=CODE,delta=2
global __ptext530
__ptext530:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       8       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0      12       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendHAHA
;; This function uses a non-reentrant model
;;
psect	text530
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 11
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l10568:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l7349:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u1241
	goto	u1240
u1241:
	goto	l10572
u1240:
	line	8
	
l10570:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	addwfc	(___lmul@product+1),f
	movf	(___lmul@multiplicand+2),w
	addwfc	(___lmul@product+2),f
	movf	(___lmul@multiplicand+3),w
	addwfc	(___lmul@product+3),f
	line	9
	
l10572:	
	lslf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l10574:	
	lsrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l7349
u1250:
	line	12
	
l10576:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l7352:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___bmul
psect	text531,local,class=CODE,delta=2
global __ptext531
__ptext531:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    2[BANK0 ] unsigned char 
;;  product         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       1       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sample_ADE7758
;; This function uses a non-reentrant model
;;
psect	text531
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 12
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l10552:	
	clrf	(___bmul@product)
	line	7
	
l10554:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l10558
u1220:
	line	8
	
l10556:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l10558:	
	lslf	(___bmul@multiplicand),f
	line	10
	
l10560:	
	lsrf	(___bmul@multiplier),f
	line	11
	
l10562:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l10554
u1230:
	line	12
	
l10564:	
	movf	(___bmul@product),w
	line	13
	
l7271:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_ModbusCalcCRC
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function _ModbusCalcCRC *****************
;; Defined at:
;;		line 28 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
;; Parameters:    Size  Location     Type
;;  Frame           2    0[BANK0 ] PTR unsigned char 
;;		 -> tx_data(64), rx_data(64), 
;;  LenFrame        1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  j               1    5[BANK0 ] unsigned char 
;;  CntByte         1    4[BANK0 ] unsigned char 
;;  bitVal          1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       3       0       0       0       0
;;      Locals:         0       3       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendHAHA
;;		_modbus_main
;; This function uses a non-reentrant model
;;
psect	text532
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
	line	28
	global	__size_of_ModbusCalcCRC
	__size_of_ModbusCalcCRC	equ	__end_of_ModbusCalcCRC-_ModbusCalcCRC
	
_ModbusCalcCRC:	
	opt	stack 11
; Regs used in _ModbusCalcCRC: [wreg+fsr1l-status,0]
	line	32
	
l9626:	
;modbus.c: 29: unsigned char CntByte;
;modbus.c: 30: unsigned char j;
;modbus.c: 31: unsigned char bitVal;
;modbus.c: 32: CRC = 0xFFFF;
	movlw	low(0FFFFh)
	movwf	(_CRC)	;volatile
	movlw	high(0FFFFh)
	movwf	((_CRC))+1	;volatile
	line	33
	
l9628:	
;modbus.c: 33: for(CntByte=0;CntByte<LenFrame;CntByte++)
	clrf	(ModbusCalcCRC@CntByte)
	goto	l9652
	line	35
	
l9630:	
;modbus.c: 34: {
;modbus.c: 35: CRC ^= Frame[CntByte];
	movf	(ModbusCalcCRC@CntByte),w
	addwf	(ModbusCalcCRC@Frame),w
	movwf	fsr1l
	movf	(ModbusCalcCRC@Frame+1),w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	movf	indf1,w
	xorwf	(_CRC),f	;volatile
	line	36
	
l9632:	
;modbus.c: 36: for(j=0;j<8;j++)
	clrf	(ModbusCalcCRC@j)
	line	38
	
l9638:	
;modbus.c: 37: {
;modbus.c: 38: bitVal = CRC & 0x0001;
	movf	(_CRC),w	;volatile
	movwf	(ModbusCalcCRC@bitVal)
	
l9640:	
	movlw	(01h)
	andwf	(ModbusCalcCRC@bitVal),f
	line	39
;modbus.c: 39: CRC = CRC >> 1;
	lsrf	(_CRC+1),f
	rrf	(_CRC),f	;volatile
	line	40
	
l9642:	
;modbus.c: 40: if(bitVal == 1)
	decf	(ModbusCalcCRC@bitVal),w
	skipz
	goto	u781
	goto	u780
u781:
	goto	l9646
u780:
	line	41
	
l9644:	
;modbus.c: 41: CRC ^= 0xA001;
	movlw	low(0A001h)
	xorwf	(_CRC),f	;volatile
	movlw	high(0A001h)
	xorwf	(_CRC+1),f	;volatile
	line	36
	
l9646:	
	incf	(ModbusCalcCRC@j),f
	
l9648:	
	movlw	(08h)
	subwf	(ModbusCalcCRC@j),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l9638
u790:
	line	33
	
l9650:	
	incf	(ModbusCalcCRC@CntByte),f
	
l9652:	
	movf	(ModbusCalcCRC@LenFrame),w
	subwf	(ModbusCalcCRC@CntByte),w
	skipc
	goto	u801
	goto	u800
u801:
	goto	l9630
u800:
	line	44
	
l4460:	
	return
	opt stack 0
GLOBAL	__end_of_ModbusCalcCRC
	__end_of_ModbusCalcCRC:
;; =============== function _ModbusCalcCRC ends ============

	signat	_ModbusCalcCRC,8312
	global	_rs485_send_data
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

;; *************** function _rs485_send_data *****************
;; Defined at:
;;		line 20 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/1
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendHAHA
;; This function uses a non-reentrant model
;;
psect	text533
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
	line	20
	global	__size_of_rs485_send_data
	__size_of_rs485_send_data	equ	__end_of_rs485_send_data-_rs485_send_data
	
_rs485_send_data:	
	opt	stack 11
; Regs used in _rs485_send_data: []
	line	21
	
l10550:	
;modbus.c: 21: RA7 = 1;
	bsf	(103/8),(103)&7
	line	22
;modbus.c: 22: TXEN=1;
	movlb 3	; select bank3
	bsf	(3317/8)^0180h,(3317)&7
	line	23
;modbus.c: 23: TXIE = 1;
	movlb 1	; select bank1
	bsf	(1164/8)^080h,(1164)&7
	line	24
	
l4451:	
	return
	opt stack 0
GLOBAL	__end_of_rs485_send_data
	__end_of_rs485_send_data:
;; =============== function _rs485_send_data ends ============

	signat	_rs485_send_data,88
	global	_modbus_init
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

;; *************** function _modbus_init *****************
;; Defined at:
;;		line 8 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text534
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\modbus.c"
	line	8
	global	__size_of_modbus_init
	__size_of_modbus_init	equ	__end_of_modbus_init-_modbus_init
	
_modbus_init:	
	opt	stack 13
; Regs used in _modbus_init: [wreg+status,2]
	line	9
	
l10536:	
;modbus.c: 9: rx_timeout = 11;
	movlw	(0Bh)
	movwf	(modbus@rx_timeout)	;volatile
	line	10
	
l10538:	
;modbus.c: 10: rx_data_counter = 0;
	clrf	(_rx_data_counter)	;volatile
	line	11
	
l10540:	
;modbus.c: 11: rx_data_flag = 0;
	bcf	(_rx_data_flag/8),(_rx_data_flag)&7
	line	13
	
l10542:	
;modbus.c: 13: tx_data_num = 0;
	clrf	(_tx_data_num)	;volatile
	line	14
	
l10544:	
;modbus.c: 14: tx_data_index = 0;
	clrf	(_tx_data_index)	;volatile
	line	15
	
l10546:	
;modbus.c: 15: tx_timeout_flag = 0;
	bcf	(_tx_timeout_flag/8),(_tx_timeout_flag)&7
	line	16
	
l10548:	
;modbus.c: 16: address = 0XC9;
	movlw	(0C9h)
	movwf	(_address)	;volatile
	line	17
	
l4448:	
	return
	opt stack 0
GLOBAL	__end_of_modbus_init
	__end_of_modbus_init:
;; =============== function _modbus_init ends ============

	signat	_modbus_init,88
	global	_Initialize
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

;; *************** function _Initialize *****************
;; Defined at:
;;		line 45 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/1
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text535
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	line	45
	global	__size_of_Initialize
	__size_of_Initialize	equ	__end_of_Initialize-_Initialize
	
_Initialize:	
	opt	stack 13
; Regs used in _Initialize: [wreg+status,2+status,0]
	line	47
	
l10430:	
;main.c: 47: GIE=0;
	bcf	(95/8),(95)&7
	line	48
	
l10432:	
;main.c: 48: OSCCON = 0x68;
	movlw	(068h)
	movlb 1	; select bank1
	movwf	(153)^080h	;volatile
	line	50
;main.c: 50: {; }
	
l2957:	
	line	49
	btfss	(1236/8)^080h,(1236)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l2957
u1210:
	line	52
	
l10434:	
;main.c: 52: ANSELA = 0x10;
	movlw	(010h)
	movlb 3	; select bank3
	movwf	(396)^0180h	;volatile
	line	53
	
l10436:	
;main.c: 53: PORTA = 0;
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	55
	
l10438:	
;main.c: 55: TRISA7 = 0;
	movlb 1	; select bank1
	bcf	(1127/8)^080h,(1127)&7
	line	56
	
l10440:	
;main.c: 56: TRISA6 = 0;
	bcf	(1126/8)^080h,(1126)&7
	line	57
	
l10442:	
;main.c: 57: TRISA4 = 1;
	bsf	(1124/8)^080h,(1124)&7
	line	58
	
l10444:	
;main.c: 58: TRISA3 = 1;
	bsf	(1123/8)^080h,(1123)&7
	line	59
	
l10446:	
;main.c: 59: TRISA2 = 1;
	bsf	(1122/8)^080h,(1122)&7
	line	60
	
l10448:	
;main.c: 60: TRISA1 = 1;
	bsf	(1121/8)^080h,(1121)&7
	line	61
	
l10450:	
;main.c: 61: TRISA0 = 1;
	bsf	(1120/8)^080h,(1120)&7
	line	63
	
l10452:	
;main.c: 63: ANSELB = 0x00;
	movlb 3	; select bank3
	clrf	(397)^0180h	;volatile
	line	64
	
l10454:	
;main.c: 64: TRISB0 = 0;
	movlb 1	; select bank1
	bcf	(1128/8)^080h,(1128)&7
	line	65
	
l10456:	
;main.c: 65: TRISB1 = 1;
	bsf	(1129/8)^080h,(1129)&7
	line	66
	
l10458:	
;main.c: 66: TRISB2 = 1;
	bsf	(1130/8)^080h,(1130)&7
	line	67
	
l10460:	
;main.c: 67: TRISB3 = 0;
	bcf	(1131/8)^080h,(1131)&7
	line	68
	
l10462:	
;main.c: 68: TRISB4 = 0;
	bcf	(1132/8)^080h,(1132)&7
	line	69
	
l10464:	
;main.c: 69: TRISB5 = 0;
	bcf	(1133/8)^080h,(1133)&7
	line	70
	
l10466:	
;main.c: 70: TRISB6 = 0;
	bcf	(1134/8)^080h,(1134)&7
	line	71
	
l10468:	
;main.c: 71: TRISB7 = 1;
	bsf	(1135/8)^080h,(1135)&7
	line	72
;main.c: 72: WPUB = 0B11111111;
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(525)^0200h	;volatile
	line	75
;main.c: 75: ADCON1=0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	(158)^080h	;volatile
	line	78
	
l10470:	
;main.c: 78: RXDTSEL = 1;
	movlb 2	; select bank2
	bsf	(2287/8)^0100h,(2287)&7
	line	79
	
l10472:	
;main.c: 79: TXCKSEL = 1;
	bsf	(2288/8)^0100h,(2288)&7
	line	80
	
l10474:	
;main.c: 80: SDO1SEL = 1;
	bsf	(2286/8)^0100h,(2286)&7
	line	84
	
l10476:	
;main.c: 84: SYNC = 0;
	movlb 3	; select bank3
	bcf	(3316/8)^0180h,(3316)&7
	line	85
	
l10478:	
;main.c: 85: BRGH = 1;
	bsf	(3314/8)^0180h,(3314)&7
	line	86
	
l10480:	
;main.c: 86: BRG16 = 1;
	bsf	(3323/8)^0180h,(3323)&7
	line	87
	
l10482:	
;main.c: 87: SPBRGH = 0X00;
	clrf	(412)^0180h	;volatile
	line	88
	
l10484:	
;main.c: 88: SPBRGL = 0X67;
	movlw	(067h)
	movwf	(411)^0180h	;volatile
	line	90
	
l10486:	
;main.c: 90: SYNC = 0;
	bcf	(3316/8)^0180h,(3316)&7
	line	91
	
l10488:	
;main.c: 91: SPEN = 1;
	bsf	(3311/8)^0180h,(3311)&7
	line	92
	
l10490:	
;main.c: 92: TX9 = 0;
	bcf	(3318/8)^0180h,(3318)&7
	line	93
	
l10492:	
;main.c: 93: SCKP = 0;
	bcf	(3324/8)^0180h,(3324)&7
	line	94
	
l10494:	
;main.c: 94: TXEN = 1;
	bsf	(3317/8)^0180h,(3317)&7
	line	95
	
l10496:	
;main.c: 95: RCIE = 1;
	movlb 1	; select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	96
	
l10498:	
;main.c: 96: RX9 = 0;
	movlb 3	; select bank3
	bcf	(3310/8)^0180h,(3310)&7
	line	97
	
l10500:	
;main.c: 97: CREN = 1;
	bsf	(3308/8)^0180h,(3308)&7
	line	99
	
l10502:	
;main.c: 99: OPTION_REG &= 0B01000111;
	movlw	(047h)
	movlb 1	; select bank1
	andwf	(149)^080h,f	;volatile
	line	100
	
l10504:	
;main.c: 100: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	101
	
l10506:	
;main.c: 101: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	102
	
l10508:	
;main.c: 102: TMR0 = 61;
	movlw	(03Dh)
	movlb 0	; select bank0
	movwf	(21)	;volatile
	line	108
	
l10510:	
;main.c: 108: T1CONbits.TMR1CS = 0;
	movlw	((0 & ((1<<2)-1))<<6)|not (((1<<2)-1)<<6)
	andwf	(24),f	;volatile
	line	109
	
l10512:	
;main.c: 109: T1CONbits.T1CKPS0 = 1;
	bsf	(24),4	;volatile
	line	110
	
l10514:	
;main.c: 110: T1CONbits.T1CKPS1 = 1;
	bsf	(24),5	;volatile
	line	111
	
l10516:	
;main.c: 111: TMR1GE = 0;
	bcf	(207/8),(207)&7
	line	112
	
l10518:	
;main.c: 112: TMR1H=0xff;
	movlw	(0FFh)
	movwf	(23)	;volatile
	line	113
	
l10520:	
;main.c: 113: TMR1L=0xc1;
	movlw	(0C1h)
	movwf	(22)	;volatile
	line	114
	
l10522:	
;main.c: 114: TMR1ON=1;
	bsf	(192/8),(192)&7
	line	115
	
l10524:	
;main.c: 115: TMR1IF=0;
	bcf	(136/8),(136)&7
	line	116
	
l10526:	
;main.c: 116: TMR1IE=1;
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	118
	
l10528:	
;main.c: 118: TXIE = 0;
	bcf	(1164/8)^080h,(1164)&7
	line	122
	
l10530:	
;main.c: 122: WDTCONbits.WDTPS = 0B01010;
	movf	(151)^080h,w	;volatile
	andlw	not (((1<<5)-1)<<1)
	iorlw	(0Ah & ((1<<5)-1))<<1
	movwf	(151)^080h	;volatile
	line	125
	
l10532:	
;main.c: 125: PEIE = 1;
	bsf	(94/8),(94)&7
	line	126
	
l10534:	
;main.c: 126: GIE = 1;
	bsf	(95/8),(95)&7
	line	127
	
l2960:	
	return
	opt stack 0
GLOBAL	__end_of_Initialize
	__end_of_Initialize:
;; =============== function _Initialize ends ============

	signat	_Initialize,88
	global	_SPI_Init
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

;; *************** function _SPI_Init *****************
;; Defined at:
;;		line 20 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/1
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text536
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	line	20
	global	__size_of_SPI_Init
	__size_of_SPI_Init	equ	__end_of_SPI_Init-_SPI_Init
	
_SPI_Init:	
	opt	stack 13
; Regs used in _SPI_Init: [wreg]
	line	22
	
l10414:	
;main.c: 22: SSP1CON1bits.SSPEN=0;
	movlb 4	; select bank4
	bcf	(533)^0200h,5	;volatile
	line	24
;main.c: 24: SSP1CON1bits.SSPM0 = 0;
	bcf	(533)^0200h,0	;volatile
	line	25
;main.c: 25: SSP1CON1bits.SSPM1 = 1;
	bsf	(533)^0200h,1	;volatile
	line	26
;main.c: 26: SSP1CON1bits.SSPM2 = 0;
	bcf	(533)^0200h,2	;volatile
	line	27
;main.c: 27: SSP1CON1bits.SSPM3 = 1;
	bsf	(533)^0200h,3	;volatile
	line	28
	
l10416:	
;main.c: 28: SSP1ADD = 3;
	movlw	(03h)
	movwf	(530)^0200h	;volatile
	line	30
	
l10418:	
;main.c: 30: SSP2STATbits.SMP=1;
	bsf	(540)^0200h,7	;volatile
	line	32
	
l10420:	
;main.c: 32: SSP2STATbits.CKE=1;
	bsf	(540)^0200h,6	;volatile
	line	33
	
l10422:	
;main.c: 33: SSP2CON1bits.CKP = 0;
	bcf	(541)^0200h,4	;volatile
	line	34
	
l10424:	
;main.c: 34: SSP1CON1bits.SSPEN=1;
	bsf	(533)^0200h,5	;volatile
	line	36
	
l10426:	
;main.c: 36: RB3=1;
	movlb 0	; select bank0
	bsf	(107/8),(107)&7
	line	37
	
l10428:	
;main.c: 37: RB0=1;
	bsf	(104/8),(104)&7
	line	38
	
l2954:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Init
	__end_of_SPI_Init:
;; =============== function _SPI_Init ends ============

	signat	_SPI_Init,88
	global	_spiSendByte
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:

;; *************** function _spiSendByte *****************
;; Defined at:
;;		line 28 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\util.c"
;; Parameters:    Size  Location     Type
;;  spi_data        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  spi_data        1    0[BANK0 ] unsigned char 
;;  cc              4    1[BANK0 ] unsigned long 
;;  spi_tmp         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       6       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD7758_GetData
;;		_AD7758_SendData
;; This function uses a non-reentrant model
;;
psect	text537
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\util.c"
	line	28
	global	__size_of_spiSendByte
	__size_of_spiSendByte	equ	__end_of_spiSendByte-_spiSendByte
	
_spiSendByte:	
	opt	stack 11
; Regs used in _spiSendByte: [wreg+status,2+status,0]
;spiSendByte@spi_data stored from wreg
	movwf	(spiSendByte@spi_data)
	line	29
	
l10396:	
	line	30
	
l10398:	
;util.c: 30: ulong cc = 0;
	clrf	(spiSendByte@cc)
	clrf	(spiSendByte@cc+1)
	clrf	(spiSendByte@cc+2)
	clrf	(spiSendByte@cc+3)
	line	31
	
l10400:	
;util.c: 31: SSPBUF=spi_data;
	movf	(spiSendByte@spi_data),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	32
;util.c: 32: while((!SSP1IF)&&(cc < 0x0fffffff))
	goto	l10404
	line	34
	
l10402:	
;util.c: 33: {
;util.c: 34: cc++;
	incf	(spiSendByte@cc),f
	skipnz
	incf	(spiSendByte@cc+1),f
	skipnz
	incf	(spiSendByte@cc+2),f
	skipnz
	incf	(spiSendByte@cc+3),f
	line	32
	
l10404:	
	movlb 0	; select bank0
	btfsc	(139/8),(139)&7
	goto	u1191
	goto	u1190
u1191:
	goto	l10408
u1190:
	
l10406:	
	movlw	0Fh
	subwf	(spiSendByte@cc+3),w
	skipz
	goto	u1205
	movlw	0FFh
	subwf	(spiSendByte@cc+2),w
	skipz
	goto	u1205
	movlw	0FFh
	subwf	(spiSendByte@cc+1),w
	skipz
	goto	u1205
	movlw	0FFh
	subwf	(spiSendByte@cc),w
u1205:
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l10402
u1200:
	line	36
	
l10408:	
;util.c: 35: }
;util.c: 36: spi_tmp = SSPBUF;
	movlb 4	; select bank4
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(spiSendByte@spi_tmp)
	line	37
	
l10410:	
;util.c: 37: SSP1IF = 0;
	bcf	(139/8),(139)&7
	line	38
;util.c: 38: return spi_tmp;
	movf	(spiSendByte@spi_tmp),w
	line	39
	
l5921:	
	return
	opt stack 0
GLOBAL	__end_of_spiSendByte
	__end_of_spiSendByte:
;; =============== function _spiSendByte ends ============

	signat	_spiSendByte,4217
	global	_Delay
psect	text538,local,class=CODE,delta=2
global __ptext538
__ptext538:

;; *************** function _Delay *****************
;; Defined at:
;;		line 4 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\util.c"
;; Parameters:    Size  Location     Type
;;  delay_count_    4    0[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  delay_count     4    4[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       4       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD7758_CS
;;		_AD7758_init
;; This function uses a non-reentrant model
;;
psect	text538
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\util.c"
	line	4
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 11
; Regs used in _Delay: [wreg+status,2+status,0]
	line	6
	
l10390:	
;util.c: 5: ulong delay_count;
;util.c: 6: for( delay_count = 0 ; delay_count < delay_count_max ; delay_count ++ )
	clrf	(Delay@delay_count)
	clrf	(Delay@delay_count+1)
	clrf	(Delay@delay_count+2)
	clrf	(Delay@delay_count+3)
	goto	l10394
	
l10392:	
;util.c: 7: {
;util.c: 8: ;
	incf	(Delay@delay_count),f
	skipnz
	incf	(Delay@delay_count+1),f
	skipnz
	incf	(Delay@delay_count+2),f
	skipnz
	incf	(Delay@delay_count+3),f
	
l10394:	
	movf	(Delay@delay_count_max+3),w
	subwf	(Delay@delay_count+3),w
	skipz
	goto	u1185
	movf	(Delay@delay_count_max+2),w
	subwf	(Delay@delay_count+2),w
	skipz
	goto	u1185
	movf	(Delay@delay_count_max+1),w
	subwf	(Delay@delay_count+1),w
	skipz
	goto	u1185
	movf	(Delay@delay_count_max),w
	subwf	(Delay@delay_count),w
u1185:
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l10392
u1180:
	line	11
	
l5910:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_isr
psect	intentry

;; *************** function _isr *****************
;; Defined at:
;;		line 132 in file "C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  data            1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1C/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"C:\Users\jeqi\Documents\GD_Power_Meter\Docs\FW\PowerSupply\main.c"
	line	132
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 11
; Regs used in _isr: [wreg+fsr1l-status,0+pclath+cstack]
psect	intentry
	pagesel	$
	line	136
	
i1l9538:	
;main.c: 136: if(TMR1IF==1)
	movlb 0	; select bank0
	btfss	(136/8),(136)&7
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l9558
u62_20:
	line	139
	
i1l9540:	
;main.c: 137: {
;main.c: 139: TMR1IF=0;
	bcf	(136/8),(136)&7
	line	140
	
i1l9542:	
;main.c: 140: TMR1H=0xff;
	movlw	(0FFh)
	movwf	(23)	;volatile
	line	141
;main.c: 141: TMR1L=0xc1;
	movlw	(0C1h)
	movwf	(22)	;volatile
	line	143
;main.c: 143: if(rx_timeout < 6)
	movlw	(06h)
	subwf	(_rx_timeout),w	;volatile
	skipnc
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l9546
u63_20:
	line	146
	
i1l9544:	
;main.c: 144: {
;main.c: 146: rx_timeout ++;
	incf	(_rx_timeout),f	;volatile
	line	147
;main.c: 147: }
	goto	i1l2965
	line	148
	
i1l9546:	
;main.c: 148: else if(rx_timeout == 6)
	movf	(_rx_timeout),w	;volatile
	xorlw	06h&0ffh
	skipz
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l2965
u64_20:
	line	151
	
i1l9548:	
;main.c: 149: {
;main.c: 151: rx_timeout = 11;
	movlw	(0Bh)
	movwf	(_rx_timeout)	;volatile
	line	152
	
i1l9550:	
;main.c: 152: rx_data_flag = 1;
	bsf	(_rx_data_flag/8),(_rx_data_flag)&7
	line	157
;main.c: 153: }
	
i1l2965:	
	line	159
;main.c: 157: }
;main.c: 159: if(tx_timeout_flag == 1)
	btfss	(_tx_timeout_flag/8),(_tx_timeout_flag)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l9558
u65_20:
	line	161
	
i1l9552:	
;main.c: 160: {
;main.c: 161: if(TRMT == 1)
	movlb 3	; select bank3
	btfss	(3313/8)^0180h,(3313)&7
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l9558
u66_20:
	line	163
	
i1l9554:	
;main.c: 162: {
;main.c: 163: tx_timeout_flag = 0;
	bcf	(_tx_timeout_flag/8),(_tx_timeout_flag)&7
	line	164
;main.c: 164: TXEN=0;
	bcf	(3317/8)^0180h,(3317)&7
	line	165
;main.c: 165: RA7 = 0;
	movlb 0	; select bank0
	bcf	(103/8),(103)&7
	line	166
	
i1l9556:	
;main.c: 166: tx_data_index = 0;
	clrf	(_tx_data_index)	;volatile
	line	167
;main.c: 167: tx_data_num = 0;
	clrf	(_tx_data_num)	;volatile
	line	172
	
i1l9558:	
;main.c: 168: }
;main.c: 169: }
;main.c: 170: }
;main.c: 172: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l9578
u67_20:
	line	174
	
i1l9560:	
;main.c: 173: {
;main.c: 174: TMR0 = 61;
	movlw	(03Dh)
	movlb 0	; select bank0
	movwf	(21)	;volatile
	line	175
	
i1l9562:	
;main.c: 175: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	176
	
i1l9564:	
;main.c: 176: gs50msCnt++;
	incf	(_gs50msCnt),f
	skipnz
	incf	(_gs50msCnt+1),f
	line	177
	
i1l9566:	
;main.c: 177: if (gs50msCnt%20 == 0)
	movlw	014h
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(_gs50msCnt+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_gs50msCnt),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l9570
u68_20:
	line	179
	
i1l9568:	
;main.c: 178: {
;main.c: 179: Sample_flag = 1;
	bsf	(_Sample_flag/8),(_Sample_flag)&7
	line	181
	
i1l9570:	
;main.c: 180: }
;main.c: 181: if (gs50msCnt%3600 == 0)
	movlw	low(0E10h)
	movwf	(?___lwmod)
	movlw	high(0E10h)
	movwf	((?___lwmod))+1
	movf	(_gs50msCnt+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_gs50msCnt),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l9574
u69_20:
	line	183
	
i1l9572:	
;main.c: 182: {
;main.c: 183: AbnorProcFlag = 1;
	bsf	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	line	186
	
i1l9574:	
;main.c: 184: }
;main.c: 186: if (gs50msCnt >= 3600)
	movlw	high(0E10h)
	subwf	(_gs50msCnt+1),w
	movlw	low(0E10h)
	skipnz
	subwf	(_gs50msCnt),w
	skipc
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l9578
u70_20:
	line	188
	
i1l9576:	
;main.c: 187: {
;main.c: 188: gs50msCnt = 0;
	clrf	(_gs50msCnt)
	clrf	(_gs50msCnt+1)
	line	192
	
i1l9578:	
;main.c: 189: }
;main.c: 190: }
;main.c: 192: if ( OERR || FERR )
	movlb 3	; select bank3
	btfsc	(3305/8)^0180h,(3305)&7
	goto	u71_21
	goto	u71_20
u71_21:
	goto	i1l2976
u71_20:
	
i1l9580:	
	btfss	(3306/8)^0180h,(3306)&7
	goto	u72_21
	goto	u72_20
u72_21:
	goto	i1l2974
u72_20:
	
i1l2976:	
	line	194
;main.c: 193: {
;main.c: 194: CREN = 0 ;
	bcf	(3308/8)^0180h,(3308)&7
	line	195
;main.c: 195: CREN = 1;
	bsf	(3308/8)^0180h,(3308)&7
	line	196
	
i1l2974:	
	line	199
;main.c: 196: }
;main.c: 199: if(RCIF)
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u73_21
	goto	u73_20
u73_21:
	goto	i1l9600
u73_20:
	line	201
	
i1l9582:	
;main.c: 200: {
;main.c: 201: RCIF = 0;
	bcf	(141/8),(141)&7
	line	202
	
i1l9584:	
;main.c: 202: unsigned char data = RCREG;
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	movwf	(isr@data)
	line	204
	
i1l9586:	
;main.c: 204: if(rx_data_flag == 0)
	btfsc	(_rx_data_flag/8),(_rx_data_flag)&7
	goto	u74_21
	goto	u74_20
u74_21:
	goto	i1l9600
u74_20:
	line	207
	
i1l9588:	
;main.c: 205: {
;main.c: 207: rx_timeout = 0;
	clrf	(_rx_timeout)	;volatile
	line	208
	
i1l9590:	
;main.c: 208: rx_data[rx_data_counter] = data;
	movf	(_rx_data_counter),w
	addlw	_rx_data&0ffh
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	(isr@data),w
	movwf	indf1
	line	209
	
i1l9592:	
;main.c: 209: rx_data_counter++;
	incf	(_rx_data_counter),f	;volatile
	line	211
	
i1l9594:	
;main.c: 211: if(rx_data_counter == 64)
	movf	(_rx_data_counter),w	;volatile
	xorlw	040h&0ffh
	skipz
	goto	u75_21
	goto	u75_20
u75_21:
	goto	i1l9600
u75_20:
	line	213
	
i1l9596:	
;main.c: 212: {
;main.c: 213: rx_data_flag = 1;
	bsf	(_rx_data_flag/8),(_rx_data_flag)&7
	line	214
	
i1l9598:	
;main.c: 214: rx_timeout = 11;
	movlw	(0Bh)
	movwf	(_rx_timeout)	;volatile
	line	218
	
i1l9600:	
;main.c: 215: }
;main.c: 216: }
;main.c: 217: }
;main.c: 218: if(TXIF)
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u76_21
	goto	u76_20
u76_21:
	goto	i1l2983
u76_20:
	line	220
	
i1l9602:	
;main.c: 219: {
;main.c: 220: TXIF = 0;
	bcf	(140/8),(140)&7
	line	221
	
i1l9604:	
;main.c: 221: if(tx_data_index < tx_data_num)
	movf	(_tx_data_num),w	;volatile
	subwf	(_tx_data_index),w	;volatile
	skipnc
	goto	u77_21
	goto	u77_20
u77_21:
	goto	i1l2981
u77_20:
	line	223
	
i1l9606:	
;main.c: 222: {
;main.c: 223: TXREG = tx_data[tx_data_index];
	movf	(_tx_data_index),w
	addlw	_tx_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	224
	
i1l9608:	
;main.c: 224: tx_data_index ++;
	incf	(_tx_data_index),f	;volatile
	line	225
;main.c: 225: }
	goto	i1l2983
	line	226
	
i1l2981:	
	line	228
;main.c: 226: else
;main.c: 227: {
;main.c: 228: TXIE = 0;
	movlb 1	; select bank1
	bcf	(1164/8)^080h,(1164)&7
	line	229
;main.c: 229: tx_timeout_flag = 1;
	bsf	(_tx_timeout_flag/8),(_tx_timeout_flag)&7
	line	236
	
i1l2983:	
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	___lwmod
psect	text540,local,class=CODE,delta=2
global __ptext540
__ptext540:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         4       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text540
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 11
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l9686:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u85_21
	goto	u85_20
u85_21:
	goto	i1l9702
u85_20:
	line	9
	
i1l9688:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	i1l9692
	line	11
	
i1l9690:	
	lslf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
i1l9692:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u86_21
	goto	u86_20
u86_21:
	goto	i1l9690
u86_20:
	line	15
	
i1l9694:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u87_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u87_25:
	skipc
	goto	u87_21
	goto	u87_20
u87_21:
	goto	i1l9698
u87_20:
	line	16
	
i1l9696:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	subwfb	(___lwmod@dividend+1),f
	line	17
	
i1l9698:	
	lsrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
i1l9700:	
	decfsz	(___lwmod@counter),f
	goto	u88_21
	goto	u88_20
u88_21:
	goto	i1l9694
u88_20:
	line	20
	
i1l9702:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
i1l7297:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
psect	text541,local,class=CODE,delta=2
global __ptext541
__ptext541:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
global __pbssBIGRAM
__pbssBIGRAM	equ	8462
	end
