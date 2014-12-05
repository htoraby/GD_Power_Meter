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
# 13 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 13 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	dw 0xFFFC & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFBF & 0xFFFF & 0xFFFF & 0xDFFF & 0xFDFF & 0xF9FF ;#
DABS 1,544,48	;_ADE7758Data
DABS 1,446,50	;_ADE7758Data
	FNCALL	_main,_Initialize
	FNCALL	_main,_SPI_Init
	FNCALL	_main,_AD7758_init
	FNCALL	_main,_get_address
	FNCALL	_main,_OS_Init
	FNCALL	_main,__OS_Task_Create
	FNCALL	_main,__OS_JumpToTask
	FNCALL	_main,_thread_abnormal
	FNCALL	_main,_thread_slip
	FNCALL	_main,_thread_Sample
	FNCALL	_thread_slip,__OS_EnterWaitMode
	FNCALL	_thread_slip,__OS_CheckEvent
	FNCALL	_thread_slip,_slip_main
	FNCALL	_slip_main,_processing_slipcmd
	FNCALL	_slip_main,_sendACK
	FNCALL	_slip_main,_run_cmd
	FNCALL	_slip_main,_sendNACK
	FNCALL	_run_cmd,_sendTemper
	FNCALL	_run_cmd,_sendPHASE
	FNCALL	_run_cmd,_sendDEV
	FNCALL	_run_cmd,_sendVER
	FNCALL	_sendVER,_calculateCRC8
	FNCALL	_sendVER,_rs485_send_data
	FNCALL	_sendTemper,_calculateCRC8
	FNCALL	_sendTemper,_rs485_send_data
	FNCALL	_sendPHASE,_calculateCRC8
	FNCALL	_sendPHASE,_rs485_send_data
	FNCALL	_sendDEV,_calculateCRC8
	FNCALL	_sendDEV,_rs485_send_data
	FNCALL	_sendNACK,_rs485_send_data
	FNCALL	_sendACK,_rs485_send_data
	FNCALL	_rs485_send_data,_sample_check
	FNCALL	_thread_abnormal,__OS_EnterWaitMode
	FNCALL	_thread_abnormal,__OS_CheckEvent
	FNCALL	_thread_abnormal,_AD7758_check_init
	FNCALL	_thread_abnormal,_AD7758_init
	FNCALL	_sample_check,_Sample_ADE7758
	FNCALL	_thread_Sample,__OS_EnterWaitMode
	FNCALL	_thread_Sample,__OS_CheckEvent
	FNCALL	_thread_Sample,_Sample_ADE7758
	FNCALL	_OS_Init,__OS_ReturnSave
	FNCALL	_OS_Init,__OS_EnterWaitMode
	FNCALL	_OS_Init,__OS_EnterWaitModeTO
	FNCALL	_OS_Init,__OS_CheckEvent
	FNCALL	_OS_Init,__OS_JumpToTask
	FNCALL	_AD7758_check_init,_AD7758_CS
	FNCALL	_AD7758_check_init,_AD7758_GetData
	FNCALL	_Sample_ADE7758,_AD7758_CS
	FNCALL	_Sample_ADE7758,_AD7758_GetData
	FNCALL	_Sample_ADE7758,___bmul
	FNCALL	_Sample_ADE7758,_AD7758_SendData
	FNCALL	_AD7758_init,_AD7758_CS
	FNCALL	_AD7758_init,_AD7758_SendData
	FNCALL	_AD7758_init,_Delay
	FNCALL	__OS_EnterWaitModeTO,__OS_ClrReadySetClrCanContinue
	FNCALL	_processing_slipcmd,_calculateCRC8
	FNCALL	__OS_EnterWaitMode,__OS_ClrReadySetClrCanContinue
	FNCALL	_Initialize,_vmemset
	FNCALL	_AD7758_SendData,_spiSendByte
	FNCALL	_AD7758_GetData,_spiSendByte
	FNCALL	_AD7758_CS,_Delay
	FNROOT	_main
	FNCALL	_isr,___lwmod
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_fun_array
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	313

;initializer for _fun_array
	retlw	(fp__thread_Sample-fpbase)&0ffh
	retlw	(fp__thread_slip-fpbase)&0ffh
	retlw	(fp__thread_abnormal-fpbase)&0ffh
	global	_gucPowerVer
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
	global    __stringtab
__stringtab:
	retlw	0
psect	strings
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	10
_gucPowerVer:
	retlw	033h
	retlw	02Eh
	retlw	030h
	retlw	033h
	global	_gucPowerVer
	global	_ReadData
	global	_SendData
	global	_FreqPhase
	global	__OS_CurTask
	global	__OS_Flags
	global	__OS_Temp
	global	_gucDevAddr
	global	_gs50msCnt
	global	__OS_TempH
	global	_AbnorProcFlag
	global	_Sample_flag
	global	__OS_Tasks
	global	_ADE7758Data
	global	_gstSLIPSend
	global	_gstSLIPRecv
	global	_FSR0H
_FSR0H	set	5
	global	_FSR0L
_FSR0L	set	4
	global	_INDF0
_INDF0	set	0
	global	_PCLATH
_PCLATH	set	10
	global	_PORTA
_PORTA	set	12
	global	_TMR0
_TMR0	set	21
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
	global	_STKPTR
_STKPTR	set	4077
	file	"PowerSupply.as"
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

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_gs50msCnt:
       ds      2

__OS_TempH:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_ReadData:
       ds      3

_SendData:
       ds      3

_FreqPhase:
       ds      2

__OS_CurTask:
       ds      1

__OS_Flags:
       ds      1

__OS_Temp:
       ds      1

_gucDevAddr:
       ds      1

__OS_Tasks:
       ds      12

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	313
_fun_array:
       ds      3

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_gstSLIPSend:
       ds      43

_gstSLIPRecv:
       ds      22

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	low(018h)
	movwf	btemp
	movlw	high(018h)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	low(041h)
	movwf	btemp
	movlw	high(041h)
	movwf	btemp+1
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0,__pdataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?__OS_EnterWaitMode
?__OS_EnterWaitMode:	; 0 bytes @ 0x0
	global	?__OS_CheckEvent
?__OS_CheckEvent:	; 0 bytes @ 0x0
	global	?_slip_main
?_slip_main:	; 0 bytes @ 0x0
	global	?_OS_Init
?_OS_Init:	; 0 bytes @ 0x0
	global	?__OS_JumpToTask
?__OS_JumpToTask:	; 0 bytes @ 0x0
	global	?__OS_ClrReadySetClrCanContinue
?__OS_ClrReadySetClrCanContinue:	; 0 bytes @ 0x0
	global	?_AD7758_init
?_AD7758_init:	; 0 bytes @ 0x0
	global	?_Sample_ADE7758
?_Sample_ADE7758:	; 0 bytes @ 0x0
	global	?_Initialize
?_Initialize:	; 0 bytes @ 0x0
	global	?_SPI_Init
?_SPI_Init:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_thread_Sample
?_thread_Sample:	; 0 bytes @ 0x0
	global	?_sample_check
?_sample_check:	; 0 bytes @ 0x0
	global	?_thread_slip
?_thread_slip:	; 0 bytes @ 0x0
	global	?_thread_abnormal
?_thread_abnormal:	; 0 bytes @ 0x0
	global	?_rs485_send_data
?_rs485_send_data:	; 0 bytes @ 0x0
	global	?_sendACK
?_sendACK:	; 0 bytes @ 0x0
	global	?_sendNACK
?_sendNACK:	; 0 bytes @ 0x0
	global	?_sendDEV
?_sendDEV:	; 0 bytes @ 0x0
	global	?_sendTemper
?_sendTemper:	; 0 bytes @ 0x0
	global	?_sendVER
?_sendVER:	; 0 bytes @ 0x0
	global	?_run_cmd
?_run_cmd:	; 0 bytes @ 0x0
	global	?__OS_ReturnSave
?__OS_ReturnSave:	; 0 bytes @ 0x0
	global	?__OS_EnterWaitModeTO
?__OS_EnterWaitModeTO:	; 0 bytes @ 0x0
	global	?_spiSendByte
?_spiSendByte:	; 1 bytes @ 0x0
	global	?_get_address
?_get_address:	; 1 bytes @ 0x0
	global	?_AD7758_check_init
?_AD7758_check_init:	; 1 bytes @ 0x0
	global	?_processing_slipcmd
?_processing_slipcmd:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
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
	ds	2
	global	isr@data
isr@data:	; 1 bytes @ 0x7
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	??_spiSendByte
??_spiSendByte:	; 0 bytes @ 0x0
	global	??__OS_EnterWaitMode
??__OS_EnterWaitMode:	; 0 bytes @ 0x0
	global	??__OS_CheckEvent
??__OS_CheckEvent:	; 0 bytes @ 0x0
	global	??_get_address
??_get_address:	; 0 bytes @ 0x0
	global	?__OS_Task_Create
?__OS_Task_Create:	; 0 bytes @ 0x0
	global	??__OS_JumpToTask
??__OS_JumpToTask:	; 0 bytes @ 0x0
	global	??__OS_ClrReadySetClrCanContinue
??__OS_ClrReadySetClrCanContinue:	; 0 bytes @ 0x0
	global	?_vmemset
?_vmemset:	; 0 bytes @ 0x0
	global	??_SPI_Init
??_SPI_Init:	; 0 bytes @ 0x0
	global	??__OS_ReturnSave
??__OS_ReturnSave:	; 0 bytes @ 0x0
	global	??__OS_EnterWaitModeTO
??__OS_EnterWaitModeTO:	; 0 bytes @ 0x0
	global	?_calculateCRC8
?_calculateCRC8:	; 1 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	spiSendByte@spi_data
spiSendByte@spi_data:	; 1 bytes @ 0x0
	global	calculateCRC8@dataLen
calculateCRC8@dataLen:	; 1 bytes @ 0x0
	global	__OS_CheckEvent@bEvent
__OS_CheckEvent@bEvent:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	vmemset@p1
vmemset@p1:	; 2 bytes @ 0x0
	global	__OS_Task_Create@TaskAddr
__OS_Task_Create@TaskAddr:	; 2 bytes @ 0x0
	global	Delay@delay_count_max
Delay@delay_count_max:	; 4 bytes @ 0x0
	ds	1
	global	??_OS_Init
??_OS_Init:	; 0 bytes @ 0x1
	global	??_calculateCRC8
??_calculateCRC8:	; 0 bytes @ 0x1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	calculateCRC8@inData
calculateCRC8@inData:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	global	spiSendByte@cc
spiSendByte@cc:	; 4 bytes @ 0x1
	ds	1
	global	??__OS_Task_Create
??__OS_Task_Create:	; 0 bytes @ 0x2
	global	calculateCRC8@j
calculateCRC8@j:	; 1 bytes @ 0x2
	global	__OS_Task_Create@priority
__OS_Task_Create@priority:	; 1 bytes @ 0x2
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	global	vmemset@c
vmemset@c:	; 2 bytes @ 0x2
	ds	1
	global	calculateCRC8@i
calculateCRC8@i:	; 1 bytes @ 0x3
	global	__OS_Task_Create@Task
__OS_Task_Create@Task:	; 1 bytes @ 0x3
	ds	1
	global	??_Delay
??_Delay:	; 0 bytes @ 0x4
	global	calculateCRC8@crc
calculateCRC8@crc:	; 1 bytes @ 0x4
	global	vmemset@n
vmemset@n:	; 2 bytes @ 0x4
	global	Delay@delay_count
Delay@delay_count:	; 4 bytes @ 0x4
	ds	1
	global	??_processing_slipcmd
??_processing_slipcmd:	; 0 bytes @ 0x5
	global	spiSendByte@spi_tmp
spiSendByte@spi_tmp:	; 1 bytes @ 0x5
	ds	1
	global	?_AD7758_GetData
?_AD7758_GetData:	; 0 bytes @ 0x6
	global	?_AD7758_SendData
?_AD7758_SendData:	; 0 bytes @ 0x6
	global	??_vmemset
??_vmemset:	; 0 bytes @ 0x6
	global	AD7758_GetData@num
AD7758_GetData@num:	; 1 bytes @ 0x6
	global	AD7758_SendData@num
AD7758_SendData@num:	; 1 bytes @ 0x6
	ds	1
	global	AD7758_GetData@chip
AD7758_GetData@chip:	; 1 bytes @ 0x7
	global	AD7758_SendData@chip
AD7758_SendData@chip:	; 1 bytes @ 0x7
	global	processing_slipcmd@ret
processing_slipcmd@ret:	; 1 bytes @ 0x7
	global	vmemset@p
vmemset@p:	; 2 bytes @ 0x7
	ds	1
	global	?_AD7758_CS
?_AD7758_CS:	; 0 bytes @ 0x8
	global	??_AD7758_GetData
??_AD7758_GetData:	; 0 bytes @ 0x8
	global	??_AD7758_SendData
??_AD7758_SendData:	; 0 bytes @ 0x8
	global	AD7758_CS@enable
AD7758_CS@enable:	; 1 bytes @ 0x8
	global	AD7758_GetData@addr
AD7758_GetData@addr:	; 1 bytes @ 0x8
	global	AD7758_SendData@addr
AD7758_SendData@addr:	; 1 bytes @ 0x8
	global	processing_slipcmd@pend
processing_slipcmd@pend:	; 1 bytes @ 0x8
	ds	1
	global	??_AD7758_CS
??_AD7758_CS:	; 0 bytes @ 0x9
	global	??_Initialize
??_Initialize:	; 0 bytes @ 0x9
	global	AD7758_CS@chip
AD7758_CS@chip:	; 1 bytes @ 0x9
	global	AD7758_GetData@i
AD7758_GetData@i:	; 1 bytes @ 0x9
	global	AD7758_SendData@i
AD7758_SendData@i:	; 1 bytes @ 0x9
	global	processing_slipcmd@j
processing_slipcmd@j:	; 1 bytes @ 0x9
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
	global	processing_slipcmd@i
processing_slipcmd@i:	; 1 bytes @ 0xA
	ds	1
	global	AD7758_check_init@chip
AD7758_check_init@chip:	; 1 bytes @ 0xB
	ds	1
	global	??_thread_abnormal
??_thread_abnormal:	; 0 bytes @ 0xC
	ds	18
	global	Sample_ADE7758@sum
Sample_ADE7758@sum:	; 2 bytes @ 0x1E
	ds	2
	global	Sample_ADE7758@chip
Sample_ADE7758@chip:	; 1 bytes @ 0x20
	ds	1
	global	??_thread_Sample
??_thread_Sample:	; 0 bytes @ 0x21
	global	??_sample_check
??_sample_check:	; 0 bytes @ 0x21
	global	??_rs485_send_data
??_rs485_send_data:	; 0 bytes @ 0x21
	global	rs485_send_data@cc
rs485_send_data@cc:	; 4 bytes @ 0x21
	ds	4
	global	??_sendACK
??_sendACK:	; 0 bytes @ 0x25
	global	??_sendNACK
??_sendNACK:	; 0 bytes @ 0x25
	global	??_sendDEV
??_sendDEV:	; 0 bytes @ 0x25
	global	?_sendPHASE
?_sendPHASE:	; 0 bytes @ 0x25
	global	??_sendTemper
??_sendTemper:	; 0 bytes @ 0x25
	global	??_sendVER
??_sendVER:	; 0 bytes @ 0x25
	global	sendACK@idx
sendACK@idx:	; 1 bytes @ 0x25
	global	sendNACK@idx
sendNACK@idx:	; 1 bytes @ 0x25
	global	sendPHASE@phase
sendPHASE@phase:	; 2 bytes @ 0x25
	ds	1
	global	sendDEV@idx
sendDEV@idx:	; 1 bytes @ 0x26
	global	sendTemper@idx
sendTemper@idx:	; 1 bytes @ 0x26
	global	sendVER@idx
sendVER@idx:	; 1 bytes @ 0x26
	ds	1
	global	??_sendPHASE
??_sendPHASE:	; 0 bytes @ 0x27
	ds	4
	global	sendPHASE@pchip1_phase
sendPHASE@pchip1_phase:	; 2 bytes @ 0x2B
	ds	2
	global	sendPHASE@pchip2_phase
sendPHASE@pchip2_phase:	; 2 bytes @ 0x2D
	ds	2
	global	sendPHASE@idx
sendPHASE@idx:	; 1 bytes @ 0x2F
	ds	1
	global	??_run_cmd
??_run_cmd:	; 0 bytes @ 0x30
	global	run_cmd@wregaddr
run_cmd@wregaddr:	; 2 bytes @ 0x30
	ds	2
	global	??_slip_main
??_slip_main:	; 0 bytes @ 0x32
	global	slip_main@ret
slip_main@ret:	; 1 bytes @ 0x32
	ds	1
	global	??_thread_slip
??_thread_slip:	; 0 bytes @ 0x33
	global	??_main
??_main:	; 0 bytes @ 0x33
	global	main@i
main@i:	; 1 bytes @ 0x33
	ds	1
;;Data sizes: Strings 0, constant 4, data 3, bss 92, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      12
;; BANK0           80     52      79
;; BANK1           80      0      65
;; BANK2           80      0       0
;; BANK3           30      0       0
;; BANK4            0      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; _OS_Task_Create@Task	PTR struct . size(1) Largest target is 12
;;		 -> _OS_Tasks(BANK0[12]), 
;;
;; calculateCRC8@inData	PTR unsigned char  size(1) Largest target is 43
;;		 -> gstSLIPSend(BANK1[43]), gstSLIPRecv(BANK1[22]), 
;;
;; sendPHASE@pchip2_phase	PTR struct . size(2) Largest target is 98
;;		 -> ADE7758Data(BIGRAM[98]), 
;;
;; sendPHASE@pchip1_phase	PTR struct . size(2) Largest target is 98
;;		 -> ADE7758Data(BIGRAM[98]), 
;;
;; _OS_CurTask	 PTR struct . size(1) Largest target is 12
;;		 -> NULL(NULL[0]), _OS_Tasks(BANK0[12]), 
;;
;; fun_array	PTR FTN()void [3] size(1) Largest target is 0
;;		 -> thread_abnormal(), thread_slip(), thread_Sample(), 
;;
;; vmemset@p1	PTR void  size(2) Largest target is 98
;;		 -> ADE7758Data(BIGRAM[98]), 
;;
;; vmemset@p	PTR unsigned char  size(2) Largest target is 98
;;		 -> ADE7758Data(BIGRAM[98]), 
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
;;   _thread_slip->_slip_main
;;   _slip_main->_run_cmd
;;   _run_cmd->_sendPHASE
;;   _sendVER->_rs485_send_data
;;   _sendTemper->_rs485_send_data
;;   _sendPHASE->_rs485_send_data
;;   _sendDEV->_rs485_send_data
;;   _sendNACK->_rs485_send_data
;;   _sendACK->_rs485_send_data
;;   _thread_abnormal->_AD7758_check_init
;;   _sample_check->_Sample_ADE7758
;;   _thread_Sample->_Sample_ADE7758
;;   _OS_Init->__OS_CheckEvent
;;   _AD7758_check_init->_AD7758_CS
;;   _AD7758_check_init->_AD7758_GetData
;;   _Sample_ADE7758->_AD7758_CS
;;   _Sample_ADE7758->_AD7758_GetData
;;   _Sample_ADE7758->_AD7758_SendData
;;   _AD7758_init->_AD7758_CS
;;   _AD7758_init->_AD7758_SendData
;;   _processing_slipcmd->_calculateCRC8
;;   _Initialize->_vmemset
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
;; (0) _main                                                 1     1      0   24331
;;                                             51 BANK0      1     1      0
;;                         _Initialize
;;                           _SPI_Init
;;                        _AD7758_init
;;                        _get_address
;;                            _OS_Init
;;                    __OS_Task_Create
;;                     __OS_JumpToTask
;;                    _thread_abnormal
;;                        _thread_slip
;;                      _thread_Sample
;; ---------------------------------------------------------------------------------
;; (1) _thread_slip                                          0     0      0   20000
;;                  __OS_EnterWaitMode
;;                     __OS_CheckEvent
;;                          _slip_main
;; ---------------------------------------------------------------------------------
;; (2) _slip_main                                            1     1      0   19978
;;                                             50 BANK0      1     1      0
;;                 _processing_slipcmd
;;                            _sendACK
;;                            _run_cmd
;;                           _sendNACK
;; ---------------------------------------------------------------------------------
;; (3) _run_cmd                                              2     2      0   13910
;;                                             48 BANK0      2     2      0
;;                         _sendTemper
;;                          _sendPHASE
;;                            _sendDEV
;;                            _sendVER
;; ---------------------------------------------------------------------------------
;; (4) _sendVER                                              2     2      0    3104
;;                                             37 BANK0      2     2      0
;;                      _calculateCRC8
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (4) _sendTemper                                           2     2      0    3104
;;                                             37 BANK0      2     2      0
;;                      _calculateCRC8
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (4) _sendPHASE                                           11     9      2    4482
;;                                             37 BANK0     11     9      2
;;                      _calculateCRC8
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (4) _sendDEV                                              2     2      0    3173
;;                                             37 BANK0      2     2      0
;;                      _calculateCRC8
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (3) _sendNACK                                             1     1      0    2780
;;                                             37 BANK0      1     1      0
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (3) _sendACK                                              1     1      0    2780
;;                                             37 BANK0      1     1      0
;;                    _rs485_send_data
;; ---------------------------------------------------------------------------------
;; (4) _rs485_send_data                                      4     4      0    2642
;;                                             33 BANK0      4     4      0
;;                       _sample_check
;; ---------------------------------------------------------------------------------
;; (1) _thread_abnormal                                      0     0      0     857
;;                  __OS_EnterWaitMode
;;                     __OS_CheckEvent
;;                  _AD7758_check_init
;;                        _AD7758_init
;; ---------------------------------------------------------------------------------
;; (5) _sample_check                                         0     0      0    2596
;;                     _Sample_ADE7758
;; ---------------------------------------------------------------------------------
;; (1) _thread_Sample                                        0     0      0    2618
;;                  __OS_EnterWaitMode
;;                     __OS_CheckEvent
;;                     _Sample_ADE7758
;; ---------------------------------------------------------------------------------
;; (1) _OS_Init                                              0     0      0      22
;;                     __OS_ReturnSave
;;                  __OS_EnterWaitMode
;;                __OS_EnterWaitModeTO
;;                     __OS_CheckEvent
;;                     __OS_JumpToTask
;; ---------------------------------------------------------------------------------
;; (2) _AD7758_check_init                                    2     2      0     385
;;                                             10 BANK0      2     2      0
;;                          _AD7758_CS
;;                     _AD7758_GetData
;; ---------------------------------------------------------------------------------
;; (2) _Sample_ADE7758                                      23    23      0    2596
;;                                             10 BANK0     23    23      0
;;                          _AD7758_CS
;;                     _AD7758_GetData
;;                             ___bmul
;;                    _AD7758_SendData
;; ---------------------------------------------------------------------------------
;; (2) _AD7758_init                                          1     1      0     450
;;                                             10 BANK0      1     1      0
;;                          _AD7758_CS
;;                    _AD7758_SendData
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (2) __OS_EnterWaitModeTO                                  0     0      0       0
;;      __OS_ClrReadySetClrCanContinue
;; ---------------------------------------------------------------------------------
;; (3) _processing_slipcmd                                   6     6      0     462
;;                                              5 BANK0      6     6      0
;;                      _calculateCRC8
;; ---------------------------------------------------------------------------------
;; (2) __OS_EnterWaitMode                                    0     0      0       0
;;      __OS_ClrReadySetClrCanContinue
;; ---------------------------------------------------------------------------------
;; (1) _Initialize                                           0     0      0      90
;;                            _vmemset
;; ---------------------------------------------------------------------------------
;; (3) _AD7758_SendData                                      4     2      2     160
;;                                              6 BANK0      4     2      2
;;                        _spiSendByte
;; ---------------------------------------------------------------------------------
;; (3) _AD7758_GetData                                       4     2      2     160
;;                                              6 BANK0      4     2      2
;;                        _spiSendByte
;; ---------------------------------------------------------------------------------
;; (3) _AD7758_CS                                            2     1      1     112
;;                                              8 BANK0      2     1      1
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (3) ___bmul                                               3     2      1      68
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (3) __OS_ClrReadySetClrCanContinue                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) __OS_ReturnSave                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _calculateCRC8                                        5     4      1     164
;;                                              0 BANK0      5     4      1
;; ---------------------------------------------------------------------------------
;; (1) __OS_JumpToTask                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) __OS_Task_Create                                      4     2      2     136
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _get_address                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) __OS_CheckEvent                                       1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SPI_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _vmemset                                              9     3      6      90
;;                                              0 BANK0      9     3      6
;; ---------------------------------------------------------------------------------
;; (4) _spiSendByte                                          6     6      0      70
;;                                              0 BANK0      6     6      0
;; ---------------------------------------------------------------------------------
;; (4) _Delay                                                8     4      4      46
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (10) _isr                                                 3     3      0     248
;;                                              5 COMMON     3     3      0
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (11) ___lwmod                                             5     1      4     159
;;                                              0 COMMON     5     1      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 11
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Initialize
;;     _vmemset
;;   _SPI_Init
;;   _AD7758_init
;;     _AD7758_CS
;;       _Delay
;;     _AD7758_SendData
;;       _spiSendByte
;;     _Delay
;;   _get_address
;;   _OS_Init
;;     __OS_ReturnSave
;;     __OS_EnterWaitMode
;;       __OS_ClrReadySetClrCanContinue
;;     __OS_EnterWaitModeTO
;;       __OS_ClrReadySetClrCanContinue
;;     __OS_CheckEvent
;;     __OS_JumpToTask
;;   __OS_Task_Create
;;   __OS_JumpToTask
;;   _thread_abnormal
;;     __OS_EnterWaitMode
;;       __OS_ClrReadySetClrCanContinue
;;     __OS_CheckEvent
;;     _AD7758_check_init
;;       _AD7758_CS
;;         _Delay
;;       _AD7758_GetData
;;         _spiSendByte
;;     _AD7758_init
;;       _AD7758_CS
;;         _Delay
;;       _AD7758_SendData
;;         _spiSendByte
;;       _Delay
;;   _thread_slip
;;     __OS_EnterWaitMode
;;       __OS_ClrReadySetClrCanContinue
;;     __OS_CheckEvent
;;     _slip_main
;;       _processing_slipcmd
;;         _calculateCRC8
;;       _sendACK
;;         _rs485_send_data
;;           _sample_check
;;             _Sample_ADE7758
;;               _AD7758_CS
;;                 _Delay
;;               _AD7758_GetData
;;                 _spiSendByte
;;               ___bmul
;;               _AD7758_SendData
;;                 _spiSendByte
;;       _run_cmd
;;         _sendTemper
;;           _calculateCRC8
;;           _rs485_send_data
;;             _sample_check
;;               _Sample_ADE7758
;;                 _AD7758_CS
;;                   _Delay
;;                 _AD7758_GetData
;;                   _spiSendByte
;;                 ___bmul
;;                 _AD7758_SendData
;;                   _spiSendByte
;;         _sendPHASE
;;           _calculateCRC8
;;           _rs485_send_data
;;             _sample_check
;;               _Sample_ADE7758
;;                 _AD7758_CS
;;                   _Delay
;;                 _AD7758_GetData
;;                   _spiSendByte
;;                 ___bmul
;;                 _AD7758_SendData
;;                   _spiSendByte
;;         _sendDEV
;;           _calculateCRC8
;;           _rs485_send_data
;;             _sample_check
;;               _Sample_ADE7758
;;                 _AD7758_CS
;;                   _Delay
;;                 _AD7758_GetData
;;                   _spiSendByte
;;                 ___bmul
;;                 _AD7758_SendData
;;                   _spiSendByte
;;         _sendVER
;;           _calculateCRC8
;;           _rs485_send_data
;;             _sample_check
;;               _Sample_ADE7758
;;                 _AD7758_CS
;;                   _Delay
;;                 _AD7758_GetData
;;                   _spiSendByte
;;                 ___bmul
;;                 _AD7758_SendData
;;                   _spiSendByte
;;       _sendNACK
;;         _rs485_send_data
;;           _sample_check
;;             _Sample_ADE7758
;;               _AD7758_CS
;;                 _Delay
;;               _AD7758_GetData
;;                 _spiSendByte
;;               ___bmul
;;               _AD7758_SendData
;;                 _spiSendByte
;;   _thread_Sample
;;     __OS_EnterWaitMode
;;       __OS_ClrReadySetClrCanContinue
;;     __OS_CheckEvent
;;     _Sample_ADE7758
;;       _AD7758_CS
;;         _Delay
;;       _AD7758_GetData
;;         _spiSendByte
;;       ___bmul
;;       _AD7758_SendData
;;         _spiSendByte
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
;;COMMON               E      8       C       2       85.7%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       D       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      9C       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     34      4F       6       98.8%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0      41       8       81.3%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0       0      10        0.0%
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
;;DATA                 0      0      A9      15        0.0%
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
;;		line 321 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   51[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  3022[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:   11
;; This function calls:
;;		_Initialize
;;		_SPI_Init
;;		_AD7758_init
;;		_get_address
;;		_OS_Init
;;		__OS_Task_Create
;;		__OS_JumpToTask
;;		_thread_abnormal
;;		_thread_slip
;;		_thread_Sample
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	321
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-status,0+pclath+cstack]
	line	323
	
l12516:	
;main.c: 322: uchar i;
;main.c: 323: Initialize();
	fcall	_Initialize
	line	324
	
l12518:	
;main.c: 324: SPI_Init();
	fcall	_SPI_Init
	line	325
	
l12520:	
;main.c: 325: AD7758_init(1);
	movlw	(01h)
	fcall	_AD7758_init
	line	327
	
l12522:	
;main.c: 327: AD7758_init(2);
	movlw	(02h)
	fcall	_AD7758_init
	line	329
	
l12524:	
;main.c: 329: RA7 = 0;
	bcf	(103/8),(103)&7
	line	330
	
l12526:	
# 330 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	maintext
	line	331
	
l12528:	
;main.c: 331: gucDevAddr = get_address();
	fcall	_get_address
	movlb 0	; select bank0
	movwf	(_gucDevAddr)
	line	332
	
l12530:	
;main.c: 332: OS_Init();
	fcall	_OS_Init
	line	333
	
l12532:	
;main.c: 333: for(i = 0; i < 3; i++)
	clrf	(main@i)
	line	335
	
l12538:	
;main.c: 334: {
;main.c: 335: { _OS_Task_Create(i, (OST_CODE_POINTER)0x0103 + (i << 1)); };
	movf	(main@i),w
	movwf	(?__OS_Task_Create)
	clrf	(?__OS_Task_Create+1)
	lslf	(?__OS_Task_Create),f
	rlf	(?__OS_Task_Create+1),f
	movlw	low(0103h)
	addwf	(?__OS_Task_Create),f
	movlw	high(0103h)
	addwfc	(?__OS_Task_Create+1),f
	movf	(main@i),w
	fcall	__OS_Task_Create
	line	333
	
l12540:	
	incf	(main@i),f
	
l12542:	
	movlw	(03h)
	subwf	(main@i),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l12538
u1760:
	line	337
;main.c: 336: }
;main.c: 337: do { GIE = 1; } while (0);
	
l3025:	
	bsf	(95/8),(95)&7
	
l3026:	
	line	338
# 338 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	maintext
	line	339
	
l12544:	
	movlb 0	; select bank0
	clrf	(__OS_Temp)
	
l12546:	
	movlw	(__OS_Tasks+08h)&0ffh
	subwf	(__OS_CurTask),w	;volatile
	skipc
	goto	u1771
	goto	u1770
u1771:
	goto	l12550
u1770:
	
l12548:	
	movlw	(__OS_Tasks)&0ffh
	movwf	(__OS_CurTask)	;volatile
	goto	l12552
	
l12550:	
	movlw	(04h)
	addwf	(__OS_CurTask),f	;volatile
	
l12552:	
	movf	(__OS_CurTask),w	;volatile
	movwf	(4)	;volatile
	
l12554:	
	clrf	(5)	;volatile
	
l12556:	
	btfss	(0),6
	goto	u1781
	goto	u1780
u1781:
	goto	l12544
u1780:
	
l12558:	
	btfss	(0),7
	goto	u1791
	goto	u1790
u1791:
	goto	l3030
u1790:
	goto	l12544
	
l3030:	
	btfss	(0),4
	goto	u1801
	goto	u1800
u1801:
	goto	l12564
u1800:
	
l12560:	
	btfsc	(0),5
	goto	u1811
	goto	u1810
u1811:
	goto	l12564
u1810:
	goto	l12544
	
l12564:	
	fcall	__OS_JumpToTask
	
l12566:	
# 339 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
   movlb   0    ;#
psect	maintext
	goto	l12544
	line	342
	
l12574:	
;main.c: 341: {
;main.c: 342: fun_array[i]();
	movf	(main@i),w
	addlw	_fun_array&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	fcall	fptable
	line	340
	
l12576:	
	movlb 0	; select bank0
	incf	(main@i),f
	
l12578:	
	movlw	(03h)
	subwf	(main@i),w
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l12574
u1820:
	line	344
	
l3038:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_thread_slip
	global	_thread_Sample
	global	_thread_abnormal
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

;; *************** function _thread_abnormal *****************
;; Defined at:
;;		line 294 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		__OS_EnterWaitMode
;;		__OS_CheckEvent
;;		_AD7758_check_init
;;		_AD7758_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text766
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	294
	global	__size_of_thread_abnormal
	__size_of_thread_abnormal	equ	__end_of_thread_abnormal-_thread_abnormal
	
_thread_abnormal:	
	opt	stack 10
; Regs used in _thread_abnormal: [wreg+fsr1l-status,0+pclath+cstack]
	line	295
;main.c: 295: do
	
l3016:	
	line	297
	
l12048:	
;main.c: 296: {
;main.c: 297: { _OS_EnterWaitMode(); _OS_CheckEvent((AbnorProcFlag == 1) != 0); };
	fcall	__OS_EnterWaitMode
	movlw	0
	btfsc	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	movlw	1
	fcall	__OS_CheckEvent
	line	298
	
l12050:	
;main.c: 298: AbnorProcFlag = 0;
	bcf	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	line	299
	
l12052:	
;main.c: 299: if (AD7758_check_init(0x01) == 0 )
	movlw	(01h)
	fcall	_AD7758_check_init
	iorlw	0
	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l3017
u1660:
	line	301
	
l12054:	
;main.c: 300: {
;main.c: 301: AD7758_init(1);
	movlw	(01h)
	fcall	_AD7758_init
	line	302
	
l3017:	
	line	304
;main.c: 302: }
;main.c: 304: if (AD7758_check_init(0x02) == 0 )
	movlw	(02h)
	fcall	_AD7758_check_init
	iorlw	0
	skipz
	goto	u1671
	goto	u1670
u1671:
	goto	l3016
u1670:
	line	306
	
l12056:	
;main.c: 305: {
;main.c: 306: AD7758_init(2);
	movlw	(02h)
	fcall	_AD7758_init
	goto	l3016
	return
	opt stack 0
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:
	line	310
GLOBAL	__end_of_thread_abnormal
	__end_of_thread_abnormal:
;; =============== function _thread_abnormal ends ============

	signat	_thread_abnormal,88

;; *************** function _thread_Sample *****************
;; Defined at:
;;		line 248 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		__OS_EnterWaitMode
;;		__OS_CheckEvent
;;		_Sample_ADE7758
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text767
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	248
	global	__size_of_thread_Sample
	__size_of_thread_Sample	equ	__end_of_thread_Sample-_thread_Sample
	
_thread_Sample:	
	opt	stack 10
; Regs used in _thread_Sample: [wreg+fsr1l-status,0+pclath+cstack]
	line	249
;main.c: 249: do
	
l3002:	
	line	252
	
l12026:	
;main.c: 250: {
;main.c: 252: { _OS_EnterWaitMode(); _OS_CheckEvent((Sample_flag == 1) != 0); };
	fcall	__OS_EnterWaitMode
	movlw	0
	btfsc	(_Sample_flag/8),(_Sample_flag)&7
	movlw	1
	fcall	__OS_CheckEvent
	line	253
	
l12028:	
;main.c: 253: Sample_flag = 0;
	bcf	(_Sample_flag/8),(_Sample_flag)&7
	line	254
	
l12030:	
;main.c: 254: Sample_ADE7758( 0x01 );
	movlw	(01h)
	fcall	_Sample_ADE7758
	line	255
	
l12032:	
# 255 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	text767
	line	257
	
l12034:	
;main.c: 257: Sample_ADE7758( 0x02 );
	movlw	(02h)
	fcall	_Sample_ADE7758
	line	258
	
l12036:	
# 258 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	text767
	line	262
;main.c: 262: }while(1);
	goto	l3002
	return
	opt stack 0
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:
	line	263
GLOBAL	__end_of_thread_Sample
	__end_of_thread_Sample:
;; =============== function _thread_Sample ends ============

	signat	_thread_Sample,88

;; *************** function _thread_slip *****************
;; Defined at:
;;		line 280 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/1
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   10
;; This function calls:
;;		__OS_EnterWaitMode
;;		__OS_CheckEvent
;;		_slip_main
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text768
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	280
	global	__size_of_thread_slip
	__size_of_thread_slip	equ	__end_of_thread_slip-_thread_slip
	
_thread_slip:	
	opt	stack 5
; Regs used in _thread_slip: [wreg-status,0+pclath+cstack]
	line	281
;main.c: 281: do
	
l3011:	
	line	284
	
l12508:	
;main.c: 282: {
;main.c: 284: { _OS_EnterWaitMode(); _OS_CheckEvent((gstSLIPRecv.ucRecingState == SLIP_DONE) != 0); };
	fcall	__OS_EnterWaitMode
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+01h,w
	xorlw	02h&0ffh
	movlw	0
	skipnz
	movlw	1
	fcall	__OS_CheckEvent
	line	285
	
l12510:	
;main.c: 285: slip_main();
	fcall	_slip_main
	line	286
	
l12512:	
;main.c: 286: gstSLIPRecv.ucRecingState = SLIP_IDLE;
	movlb 1	; select bank1
	clrf	0+(_gstSLIPRecv)^080h+01h
	line	287
	
l12514:	
;main.c: 287: gstSLIPRecv.ucRecdCnt = 0;
	clrf	(_gstSLIPRecv)^080h
	line	290
;main.c: 290: }while(1);
	goto	l3011
	return
	opt stack 0
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:
	line	291
GLOBAL	__end_of_thread_slip
	__end_of_thread_slip:
;; =============== function _thread_slip ends ============

	signat	_thread_slip,88
	global	_slip_main

;; *************** function _slip_main *****************
;; Defined at:
;;		line 291 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ret             1   50[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1E/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_processing_slipcmd
;;		_sendACK
;;		_run_cmd
;;		_sendNACK
;; This function is called by:
;;		_thread_slip
;; This function uses a non-reentrant model
;;
psect	text769
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	global	__size_of_slip_main
	__size_of_slip_main	equ	__end_of_slip_main-_slip_main
	
_slip_main:	
	opt	stack 5
; Regs used in _slip_main: [wreg-status,0+pclath+cstack]
	line	292
	
l12494:	
	line	294
	
l12496:	
;rs485.c: 294: ret = processing_slipcmd();
	fcall	_processing_slipcmd
	movwf	(slip_main@ret)
	line	296
	
l12498:	
;rs485.c: 296: if( ret == 0)
	movf	(slip_main@ret),f
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l12504
u1740:
	line	298
	
l12500:	
;rs485.c: 297: {
;rs485.c: 298: sendACK();
	fcall	_sendACK
	line	299
	
l12502:	
;rs485.c: 299: run_cmd();
	fcall	_run_cmd
	line	300
;rs485.c: 300: }
	goto	l4561
	line	301
	
l12504:	
;rs485.c: 301: else if (ret == 1)
	decf	(slip_main@ret),w
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l4561
u1750:
	line	303
	
l12506:	
;rs485.c: 302: {
;rs485.c: 303: sendNACK();
	fcall	_sendNACK
	line	305
	
l4561:	
	return
	opt stack 0
GLOBAL	__end_of_slip_main
	__end_of_slip_main:
;; =============== function _slip_main ends ============

	signat	_slip_main,88
	global	_run_cmd
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function _run_cmd *****************
;; Defined at:
;;		line 253 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  wregaddr        2   48[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1E/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_sendTemper
;;		_sendPHASE
;;		_sendDEV
;;		_sendVER
;; This function is called by:
;;		_slip_main
;; This function uses a non-reentrant model
;;
psect	text770
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	253
	global	__size_of_run_cmd
	__size_of_run_cmd	equ	__end_of_run_cmd-_run_cmd
	
_run_cmd:	
	opt	stack 5
; Regs used in _run_cmd: [wreg-status,0+pclath+cstack]
	line	254
	
l12474:	
	line	256
;rs485.c: 256: switch (gstSLIPRecv.ucData[2])
	goto	l12492
	line	259
	
l12476:	
;rs485.c: 259: wregaddr = (uint)((gstSLIPRecv.ucData[3] << 8) | gstSLIPRecv.ucData[4]);
	movf	0+(_gstSLIPRecv)^080h+05h,w
	movlb 0	; select bank0
	movwf	(run_cmd@wregaddr+1)
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+06h,w
	movlb 0	; select bank0
	movwf	(run_cmd@wregaddr)
	line	260
;rs485.c: 260: if ( wregaddr == 0xE000 )
		movf	(run_cmd@wregaddr+1),w
	xorlw	224
	iorwf	(run_cmd@wregaddr),w

	skipz
	goto	u1721
	goto	u1720
u1721:
	goto	l4555
u1720:
	line	262
	
l12478:	
;rs485.c: 261: {
;rs485.c: 262: sendTemper();
	fcall	_sendTemper
	goto	l4555
	line	267
	
l12480:	
;rs485.c: 267: if ( 8 == gstSLIPRecv.ucData[5] )
	movf	0+(_gstSLIPRecv)^080h+07h,w
	xorlw	08h&0ffh
	skipz
	goto	u1731
	goto	u1730
u1731:
	goto	l4555
u1730:
	line	269
	
l12482:	
;rs485.c: 268: {
;rs485.c: 269: wregaddr = (uint)((gstSLIPRecv.ucData[3] << 8) | gstSLIPRecv.ucData[4]);
	movf	0+(_gstSLIPRecv)^080h+05h,w
	movlb 0	; select bank0
	movwf	(run_cmd@wregaddr+1)
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+06h,w
	movlb 0	; select bank0
	movwf	(run_cmd@wregaddr)
	line	270
	
l12484:	
;rs485.c: 270: sendPHASE(wregaddr);
	movf	(run_cmd@wregaddr+1),w
	movwf	(?_sendPHASE+1)
	movf	(run_cmd@wregaddr),w
	movwf	(?_sendPHASE)
	fcall	_sendPHASE
	goto	l4555
	line	275
	
l12486:	
;rs485.c: 275: sendDEV();
	fcall	_sendDEV
	line	276
;rs485.c: 276: break;
	goto	l4555
	line	279
	
l12488:	
;rs485.c: 279: sendVER();
	fcall	_sendVER
	line	280
;rs485.c: 280: break;
	goto	l4555
	line	256
	
l12492:	
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+04h,w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 16 to 64
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte          107     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	16^0	; case 16
	skipnz
	goto	l12476
	xorlw	17^16	; case 17
	skipnz
	goto	l4555
	xorlw	32^17	; case 32
	skipnz
	goto	l12480
	xorlw	33^32	; case 33
	skipnz
	goto	l4555
	xorlw	48^33	; case 48
	skipnz
	goto	l12486
	xorlw	64^48	; case 64
	skipnz
	goto	l12488
	goto	l4555
	opt asmopt_on

	line	287
	
l4555:	
	return
	opt stack 0
GLOBAL	__end_of_run_cmd
	__end_of_run_cmd:
;; =============== function _run_cmd ends ============

	signat	_run_cmd,88
	global	_sendVER
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

;; *************** function _sendVER *****************
;; Defined at:
;;		line 183 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idx             1   38[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1E/1
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       1       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_calculateCRC8
;;		_rs485_send_data
;; This function is called by:
;;		_run_cmd
;; This function uses a non-reentrant model
;;
psect	text771
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	183
	global	__size_of_sendVER
	__size_of_sendVER	equ	__end_of_sendVER-_sendVER
	
_sendVER:	
	opt	stack 5
; Regs used in _sendVER: [wreg+fsr1l-status,0+pclath+cstack]
	line	184
	
l12424:	
;rs485.c: 184: uchar idx = 0;
	movlb 0	; select bank0
	clrf	(sendVER@idx)
	line	186
	
l12426:	
;rs485.c: 186: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12428:	
	movlb 0	; select bank0
	incf	(sendVER@idx),f
	line	187
	
l12430:	
;rs485.c: 187: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12432:	
	incf	(sendVER@idx),f
	line	188
	
l12434:	
;rs485.c: 188: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12436:	
	incf	(sendVER@idx),f
	line	189
	
l12438:	
;rs485.c: 189: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12440:	
	incf	(sendVER@idx),f
	line	190
	
l12442:	
;rs485.c: 190: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12444:	
	incf	(sendVER@idx),f
	line	191
	
l12446:	
;rs485.c: 191: gstSLIPSend.ucData[idx++] = gucPowerVer[0];
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	low(_gucPowerVer|8000h)
	movlp	high __stringtab
	callw
	pagesel	$
	movwf	indf1
	
l12448:	
	incf	(sendVER@idx),f
	line	192
	
l12450:	
;rs485.c: 192: gstSLIPSend.ucData[idx++] = gucPowerVer[1];
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	low(_gucPowerVer|8000h+01h)
	movlp	high __stringtab
	callw
	pagesel	$
	movwf	indf1
	
l12452:	
	incf	(sendVER@idx),f
	line	193
	
l12454:	
;rs485.c: 193: gstSLIPSend.ucData[idx++] = gucPowerVer[2];
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	low(_gucPowerVer|8000h+02h)
	movlp	high __stringtab
	callw
	pagesel	$
	movwf	indf1
	
l12456:	
	incf	(sendVER@idx),f
	line	194
	
l12458:	
;rs485.c: 194: gstSLIPSend.ucData[idx++] = gucPowerVer[3];
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	low(_gucPowerVer|8000h+03h)
	movlp	high __stringtab
	callw
	pagesel	$
	movwf	indf1
	
l12460:	
	incf	(sendVER@idx),f
	line	195
	
l12462:	
;rs485.c: 195: gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	movf	(sendVER@idx),w
	addlw	0FEh
	movwf	(?_calculateCRC8)
	movlw	(_gstSLIPSend+05h)&0ffh
	fcall	_calculateCRC8
	movwf	(??_sendVER+0)+0
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_sendVER+0)+0,w
	movwf	indf1
	
l12464:	
	incf	(sendVER@idx),f
	line	196
	
l12466:	
;rs485.c: 196: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendVER@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12468:	
	incf	(sendVER@idx),f
	line	198
	
l12470:	
;rs485.c: 198: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendVER@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	199
	
l12472:	
;rs485.c: 199: rs485_send_data();
	fcall	_rs485_send_data
	line	200
	
l4519:	
	return
	opt stack 0
GLOBAL	__end_of_sendVER
	__end_of_sendVER:
;; =============== function _sendVER ends ============

	signat	_sendVER,88
	global	_sendTemper
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

;; *************** function _sendTemper *****************
;; Defined at:
;;		line 163 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idx             1   38[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       1       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_calculateCRC8
;;		_rs485_send_data
;; This function is called by:
;;		_run_cmd
;; This function uses a non-reentrant model
;;
psect	text772
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	163
	global	__size_of_sendTemper
	__size_of_sendTemper	equ	__end_of_sendTemper-_sendTemper
	
_sendTemper:	
	opt	stack 5
; Regs used in _sendTemper: [wreg-status,0+pclath+cstack]
	line	164
	
l12374:	
;rs485.c: 164: uchar idx = 0;
	clrf	(sendTemper@idx)
	line	166
	
l12376:	
;rs485.c: 166: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12378:	
	movlb 0	; select bank0
	incf	(sendTemper@idx),f
	line	167
	
l12380:	
;rs485.c: 167: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12382:	
	incf	(sendTemper@idx),f
	line	168
	
l12384:	
;rs485.c: 168: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12386:	
	incf	(sendTemper@idx),f
	line	169
	
l12388:	
;rs485.c: 169: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12390:	
	incf	(sendTemper@idx),f
	line	170
	
l12392:	
;rs485.c: 170: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12394:	
	incf	(sendTemper@idx),f
	line	171
	
l12396:	
;rs485.c: 171: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12398:	
	incf	(sendTemper@idx),f
	line	172
	
l12400:	
;rs485.c: 172: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12402:	
	incf	(sendTemper@idx),f
	line	173
	
l12404:	
;rs485.c: 173: gstSLIPSend.ucData[idx++] = ADE7758Data[0].Temper;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	030h
	addlw	low 8462
	movwf	fsr0l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr0l)+1
	movf	indf0,w
	movwf	indf1
	
l12406:	
	incf	(sendTemper@idx),f
	line	174
	
l12408:	
;rs485.c: 174: gstSLIPSend.ucData[idx++] = ADE7758Data[1].Temper;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	061h
	addlw	low 8462
	movwf	fsr0l
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	(fsr0l)+1
	movf	indf0,w
	movwf	indf1
	
l12410:	
	incf	(sendTemper@idx),f
	line	175
	
l12412:	
;rs485.c: 175: gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	movf	(sendTemper@idx),w
	addlw	0FEh
	movwf	(?_calculateCRC8)
	movlw	(_gstSLIPSend+05h)&0ffh
	fcall	_calculateCRC8
	movwf	(??_sendTemper+0)+0
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_sendTemper+0)+0,w
	movwf	indf1
	
l12414:	
	incf	(sendTemper@idx),f
	line	176
	
l12416:	
;rs485.c: 176: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendTemper@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12418:	
	incf	(sendTemper@idx),f
	line	178
	
l12420:	
;rs485.c: 178: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendTemper@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	179
	
l12422:	
;rs485.c: 179: rs485_send_data();
	fcall	_rs485_send_data
	line	180
	
l4516:	
	return
	opt stack 0
GLOBAL	__end_of_sendTemper
	__end_of_sendTemper:
;; =============== function _sendTemper ends ============

	signat	_sendTemper,88
	global	_sendPHASE
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

;; *************** function _sendPHASE *****************
;; Defined at:
;;		line 92 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;  phase           2   37[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  pchip2_phase    2   45[BANK0 ] PTR struct .
;;		 -> ADE7758Data(98), 
;;  pchip1_phase    2   43[BANK0 ] PTR struct .
;;		 -> ADE7758Data(98), 
;;  idx             1   47[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       2       0       0       0       0
;;      Locals:         0       5       0       0       0       0
;;      Temps:          0       4       0       0       0       0
;;      Totals:         0      11       0       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_calculateCRC8
;;		_rs485_send_data
;; This function is called by:
;;		_run_cmd
;; This function uses a non-reentrant model
;;
psect	text773
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	92
	global	__size_of_sendPHASE
	__size_of_sendPHASE	equ	__end_of_sendPHASE-_sendPHASE
	
_sendPHASE:	
	opt	stack 5
; Regs used in _sendPHASE: [wreg-status,0+pclath+cstack]
	line	96
	
l12196:	
;rs485.c: 93: ADE7758_t *pchip1_phase;
;rs485.c: 94: ADE7758_t *pchip2_phase;
;rs485.c: 96: switch(phase)
	goto	l12206
	line	99
	
l12198:	
;rs485.c: 99: pchip1_phase = &ADE7758Data[0].PhaseA;
	movlw	low(8462)
	movwf	(sendPHASE@pchip1_phase)
	movlw	high(8462)
	movwf	((sendPHASE@pchip1_phase))+1
	line	100
;rs485.c: 100: pchip2_phase = &ADE7758Data[1].PhaseA;
	movlw	031h
	addlw	low 8462
	movwf	(sendPHASE@pchip2_phase)
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	((sendPHASE@pchip2_phase))+1
	line	101
;rs485.c: 101: break;
	goto	l12208
	line	104
	
l12200:	
;rs485.c: 104: pchip1_phase = &ADE7758Data[0].PhaseB;
	movlw	010h
	addlw	low 8462
	movwf	(sendPHASE@pchip1_phase)
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	((sendPHASE@pchip1_phase))+1
	line	105
;rs485.c: 105: pchip2_phase = &ADE7758Data[1].PhaseB;
	movlw	031h
	addlw	low 8462
	movwf	(sendPHASE@pchip2_phase)
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	((sendPHASE@pchip2_phase))+1
	movlw	010h
	addwf	(sendPHASE@pchip2_phase),f
	skipnc
	incf	(sendPHASE@pchip2_phase+1),f
	line	106
;rs485.c: 106: break;
	goto	l12208
	line	109
	
l12202:	
;rs485.c: 109: pchip1_phase = &ADE7758Data[0].PhaseC;
	movlw	020h
	addlw	low 8462
	movwf	(sendPHASE@pchip1_phase)
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	((sendPHASE@pchip1_phase))+1
	line	110
;rs485.c: 110: pchip2_phase = &ADE7758Data[1].PhaseC;
	movlw	031h
	addlw	low 8462
	movwf	(sendPHASE@pchip2_phase)
	movlw	high 8462
	skipnc
	movlw	high (8462)+1
	movwf	((sendPHASE@pchip2_phase))+1
	movlw	020h
	addwf	(sendPHASE@pchip2_phase),f
	skipnc
	incf	(sendPHASE@pchip2_phase+1),f
	line	111
;rs485.c: 111: break;
	goto	l12208
	line	96
	
l12206:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 224 to 224
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (sendPHASE@phase+1),w
	opt asmopt_off
	xorlw	224^0	; case 224
	skipnz
	goto	l12600
	goto	l4513
	opt asmopt_on
	
l12600:	
; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           15     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (sendPHASE@phase),w
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l12198
	xorlw	2^1	; case 2
	skipnz
	goto	l12200
	xorlw	3^2	; case 3
	skipnz
	goto	l12202
	goto	l4513
	opt asmopt_on

	line	117
	
l12208:	
;rs485.c: 117: uchar idx = 0;
	clrf	(sendPHASE@idx)
	line	118
	
l12210:	
;rs485.c: 118: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12212:	
	movlb 0	; select bank0
	incf	(sendPHASE@idx),f
	line	119
	
l12214:	
;rs485.c: 119: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12216:	
	incf	(sendPHASE@idx),f
	line	120
	
l12218:	
;rs485.c: 120: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12220:	
	incf	(sendPHASE@idx),f
	line	121
	
l12222:	
;rs485.c: 121: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12224:	
	incf	(sendPHASE@idx),f
	line	122
	
l12226:	
;rs485.c: 122: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12228:	
	incf	(sendPHASE@idx),f
	line	123
	
l12230:	
;rs485.c: 123: gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>24);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+0
	clrf	(??_sendPHASE+0)+1
	clrf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12232:	
	incf	(sendPHASE@idx),f
	line	124
	
l12234:	
;rs485.c: 124: gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>16);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+2,w
	movwf	(??_sendPHASE+0)+0
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+1
	clrf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12236:	
	incf	(sendPHASE@idx),f
	line	125
	
l12238:	
;rs485.c: 125: gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy>>8);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+1,w
	movwf	(??_sendPHASE+0)+0
	movf	(??_sendPHASE+0)+2,w
	movwf	(??_sendPHASE+0)+1
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12240:	
	incf	(sendPHASE@idx),f
	line	126
	
l12242:	
;rs485.c: 126: gstSLIPSend.ucData[idx++] = (uchar)(pchip1_phase->Energy);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12244:	
	incf	(sendPHASE@idx),f
	line	127
	
l12246:	
;rs485.c: 127: gstSLIPSend.ucData[idx++] = pchip1_phase->Frequency[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	movwf	fsr0l
	movf	(sendPHASE@pchip1_phase+1),w
	movwf	fsr0h

	movf	indf0,w
	movwf	indf1
	
l12248:	
	incf	(sendPHASE@idx),f
	line	128
	
l12250:	
;rs485.c: 128: gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(02h)
	movwf	fsr0l
	movlw	high(02h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12252:	
	incf	(sendPHASE@idx),f
	line	129
	
l12254:	
;rs485.c: 129: gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(03h)
	movwf	fsr0l
	movlw	high(03h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12256:	
	incf	(sendPHASE@idx),f
	line	130
	
l12258:	
;rs485.c: 130: gstSLIPSend.ucData[idx++] = pchip1_phase->Voltage[2];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(04h)
	movwf	fsr0l
	movlw	high(04h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12260:	
	incf	(sendPHASE@idx),f
	line	131
	
l12262:	
;rs485.c: 131: gstSLIPSend.ucData[idx++] = pchip1_phase->Frequency[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(01h)
	movwf	fsr0l
	movlw	high(01h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12264:	
	incf	(sendPHASE@idx),f
	line	132
	
l12266:	
;rs485.c: 132: gstSLIPSend.ucData[idx++] = pchip1_phase->Current[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(05h)
	movwf	fsr0l
	movlw	high(05h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12268:	
	incf	(sendPHASE@idx),f
	line	133
	
l12270:	
;rs485.c: 133: gstSLIPSend.ucData[idx++] = pchip1_phase->Current[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(06h)
	movwf	fsr0l
	movlw	high(06h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12272:	
	incf	(sendPHASE@idx),f
	line	134
	
l12274:	
;rs485.c: 134: gstSLIPSend.ucData[idx++] = pchip1_phase->Current[2];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(07h)
	movwf	fsr0l
	movlw	high(07h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12276:	
	incf	(sendPHASE@idx),f
	line	135
	
l12278:	
;rs485.c: 135: gstSLIPSend.ucData[idx++] = pchip1_phase->Active_Power[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(08h)
	movwf	fsr0l
	movlw	high(08h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12280:	
	incf	(sendPHASE@idx),f
	line	136
	
l12282:	
;rs485.c: 136: gstSLIPSend.ucData[idx++] = pchip1_phase->Active_Power[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(09h)
	movwf	fsr0l
	movlw	high(09h)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12284:	
	incf	(sendPHASE@idx),f
	line	137
	
l12286:	
;rs485.c: 137: gstSLIPSend.ucData[idx++] = pchip1_phase->Apparent_Power[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Ah)
	movwf	fsr0l
	movlw	high(0Ah)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12288:	
	incf	(sendPHASE@idx),f
	line	138
	
l12290:	
;rs485.c: 138: gstSLIPSend.ucData[idx++] = pchip1_phase->Apparent_Power[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip1_phase),w
	addlw	low(0Bh)
	movwf	fsr0l
	movlw	high(0Bh)
	addwfc	(sendPHASE@pchip1_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12292:	
	incf	(sendPHASE@idx),f
	line	139
	
l12294:	
;rs485.c: 139: gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>24);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+0
	clrf	(??_sendPHASE+0)+1
	clrf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12296:	
	incf	(sendPHASE@idx),f
	line	140
	
l12298:	
;rs485.c: 140: gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>16);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+2,w
	movwf	(??_sendPHASE+0)+0
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+1
	clrf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12300:	
	incf	(sendPHASE@idx),f
	line	141
	
l12302:	
;rs485.c: 141: gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy>>8);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	moviw	[0]fsr0
	movwf	((??_sendPHASE+0)+0+0)
	moviw	[1]fsr0
	movwf	((??_sendPHASE+0)+0+1)
	moviw	[2]fsr0
	movwf	((??_sendPHASE+0)+0+2)
	moviw	[3]fsr0
	movwf	((??_sendPHASE+0)+0+3)
	movf	(??_sendPHASE+0)+1,w
	movwf	(??_sendPHASE+0)+0
	movf	(??_sendPHASE+0)+2,w
	movwf	(??_sendPHASE+0)+1
	movf	(??_sendPHASE+0)+3,w
	movwf	(??_sendPHASE+0)+2
	clrf	(??_sendPHASE+0)+3
	movf	0+(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12304:	
	incf	(sendPHASE@idx),f
	line	142
	
l12306:	
;rs485.c: 142: gstSLIPSend.ucData[idx++] = (uchar)(pchip2_phase->Energy);
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Ch)
	movwf	fsr0l
	movlw	high(0Ch)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12308:	
	incf	(sendPHASE@idx),f
	line	143
	
l12310:	
;rs485.c: 143: gstSLIPSend.ucData[idx++] = pchip2_phase->Frequency[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	movwf	fsr0l
	movf	(sendPHASE@pchip2_phase+1),w
	movwf	fsr0h

	movf	indf0,w
	movwf	indf1
	
l12312:	
	incf	(sendPHASE@idx),f
	line	144
	
l12314:	
;rs485.c: 144: gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(02h)
	movwf	fsr0l
	movlw	high(02h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12316:	
	incf	(sendPHASE@idx),f
	line	145
	
l12318:	
;rs485.c: 145: gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(03h)
	movwf	fsr0l
	movlw	high(03h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12320:	
	incf	(sendPHASE@idx),f
	line	146
	
l12322:	
;rs485.c: 146: gstSLIPSend.ucData[idx++] = pchip2_phase->Voltage[2];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(04h)
	movwf	fsr0l
	movlw	high(04h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12324:	
	incf	(sendPHASE@idx),f
	line	147
	
l12326:	
;rs485.c: 147: gstSLIPSend.ucData[idx++] = pchip2_phase->Frequency[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(01h)
	movwf	fsr0l
	movlw	high(01h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12328:	
	incf	(sendPHASE@idx),f
	line	148
	
l12330:	
;rs485.c: 148: gstSLIPSend.ucData[idx++] = pchip2_phase->Current[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(05h)
	movwf	fsr0l
	movlw	high(05h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12332:	
	incf	(sendPHASE@idx),f
	line	149
	
l12334:	
;rs485.c: 149: gstSLIPSend.ucData[idx++] = pchip2_phase->Current[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(06h)
	movwf	fsr0l
	movlw	high(06h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12336:	
	incf	(sendPHASE@idx),f
	line	150
	
l12338:	
;rs485.c: 150: gstSLIPSend.ucData[idx++] = pchip2_phase->Current[2];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(07h)
	movwf	fsr0l
	movlw	high(07h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12340:	
	incf	(sendPHASE@idx),f
	line	151
	
l12342:	
;rs485.c: 151: gstSLIPSend.ucData[idx++] = pchip2_phase->Active_Power[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(08h)
	movwf	fsr0l
	movlw	high(08h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12344:	
	incf	(sendPHASE@idx),f
	line	152
	
l12346:	
;rs485.c: 152: gstSLIPSend.ucData[idx++] = pchip2_phase->Active_Power[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(09h)
	movwf	fsr0l
	movlw	high(09h)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12348:	
	incf	(sendPHASE@idx),f
	line	153
	
l12350:	
;rs485.c: 153: gstSLIPSend.ucData[idx++] = pchip2_phase->Apparent_Power[0];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Ah)
	movwf	fsr0l
	movlw	high(0Ah)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12352:	
	incf	(sendPHASE@idx),f
	line	154
	
l12354:	
;rs485.c: 154: gstSLIPSend.ucData[idx++] = pchip2_phase->Apparent_Power[1];
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(sendPHASE@pchip2_phase),w
	addlw	low(0Bh)
	movwf	fsr0l
	movlw	high(0Bh)
	addwfc	(sendPHASE@pchip2_phase+1),w
	movwf	1+fsr0l
	movf	indf0,w
	movwf	indf1
	
l12356:	
	incf	(sendPHASE@idx),f
	line	155
	
l12358:	
;rs485.c: 155: gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	movf	(sendPHASE@idx),w
	addlw	0FEh
	movwf	(?_calculateCRC8)
	movlw	(_gstSLIPSend+05h)&0ffh
	fcall	_calculateCRC8
	movwf	(??_sendPHASE+0)+0
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_sendPHASE+0)+0,w
	movwf	indf1
	
l12360:	
	incf	(sendPHASE@idx),f
	line	156
	
l12362:	
;rs485.c: 156: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendPHASE@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12364:	
	incf	(sendPHASE@idx),f
	line	158
	
l12366:	
;rs485.c: 158: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendPHASE@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	159
	
l12368:	
;rs485.c: 159: rs485_send_data();
	fcall	_rs485_send_data
	line	160
	
l4513:	
	return
	opt stack 0
GLOBAL	__end_of_sendPHASE
	__end_of_sendPHASE:
;; =============== function _sendPHASE ends ============

	signat	_sendPHASE,4216
	global	_sendDEV
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

;; *************** function _sendDEV *****************
;; Defined at:
;;		line 69 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idx             1   38[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1E/1
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       1       0       0       0       0
;;      Totals:         0       2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_calculateCRC8
;;		_rs485_send_data
;; This function is called by:
;;		_run_cmd
;; This function uses a non-reentrant model
;;
psect	text774
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	69
	global	__size_of_sendDEV
	__size_of_sendDEV	equ	__end_of_sendDEV-_sendDEV
	
_sendDEV:	
	opt	stack 5
; Regs used in _sendDEV: [wreg+fsr1l-status,0+pclath+cstack]
	line	70
	
l12134:	
;rs485.c: 70: uchar idx = 0;
	movlb 0	; select bank0
	clrf	(sendDEV@idx)
	line	72
	
l12136:	
;rs485.c: 72: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12138:	
	movlb 0	; select bank0
	incf	(sendDEV@idx),f
	line	73
	
l12140:	
;rs485.c: 73: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12142:	
	incf	(sendDEV@idx),f
	line	74
	
l12144:	
;rs485.c: 74: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12146:	
	incf	(sendDEV@idx),f
	line	75
	
l12148:	
;rs485.c: 75: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12150:	
	incf	(sendDEV@idx),f
	line	76
	
l12152:	
;rs485.c: 76: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12154:	
	incf	(sendDEV@idx),f
	line	77
	
l12156:	
;rs485.c: 77: gstSLIPSend.ucData[idx++] = 'S';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(053h)
	movwf	indf1
	
l12158:	
	incf	(sendDEV@idx),f
	line	78
	
l12160:	
;rs485.c: 78: gstSLIPSend.ucData[idx++] = 'S';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(053h)
	movwf	indf1
	
l12162:	
	incf	(sendDEV@idx),f
	line	79
	
l12164:	
;rs485.c: 79: gstSLIPSend.ucData[idx++] = 'P';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(050h)
	movwf	indf1
	
l12166:	
	incf	(sendDEV@idx),f
	line	80
	
l12168:	
;rs485.c: 80: gstSLIPSend.ucData[idx++] = 'O';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(04Fh)
	movwf	indf1
	
l12170:	
	incf	(sendDEV@idx),f
	line	81
	
l12172:	
;rs485.c: 81: gstSLIPSend.ucData[idx++] = 'W';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(057h)
	movwf	indf1
	
l12174:	
	incf	(sendDEV@idx),f
	line	82
	
l12176:	
;rs485.c: 82: gstSLIPSend.ucData[idx++] = 'E';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(045h)
	movwf	indf1
	
l12178:	
	incf	(sendDEV@idx),f
	line	83
	
l12180:	
;rs485.c: 83: gstSLIPSend.ucData[idx++] = 'R';
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(052h)
	movwf	indf1
	
l12182:	
	incf	(sendDEV@idx),f
	line	84
	
l12184:	
;rs485.c: 84: gstSLIPSend.ucData[idx++] = calculateCRC8(&gstSLIPSend.ucData[2], idx-2);
	movf	(sendDEV@idx),w
	addlw	0FEh
	movwf	(?_calculateCRC8)
	movlw	(_gstSLIPSend+05h)&0ffh
	fcall	_calculateCRC8
	movwf	(??_sendDEV+0)+0
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_sendDEV+0)+0,w
	movwf	indf1
	
l12186:	
	incf	(sendDEV@idx),f
	line	85
	
l12188:	
;rs485.c: 85: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendDEV@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12190:	
	incf	(sendDEV@idx),f
	line	87
	
l12192:	
;rs485.c: 87: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendDEV@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	88
	
l12194:	
;rs485.c: 88: rs485_send_data();
	fcall	_rs485_send_data
	line	89
	
l4504:	
	return
	opt stack 0
GLOBAL	__end_of_sendDEV
	__end_of_sendDEV:
;; =============== function _sendDEV ends ============

	signat	_sendDEV,88
	global	_sendNACK
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

;; *************** function _sendNACK *****************
;; Defined at:
;;		line 55 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idx             1   37[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_rs485_send_data
;; This function is called by:
;;		_slip_main
;; This function uses a non-reentrant model
;;
psect	text775
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	55
	global	__size_of_sendNACK
	__size_of_sendNACK	equ	__end_of_sendNACK-_sendNACK
	
_sendNACK:	
	opt	stack 6
; Regs used in _sendNACK: [wreg+fsr1l-status,0+pclath+cstack]
	line	56
	
l12108:	
;rs485.c: 56: uchar idx = 0;
	clrf	(sendNACK@idx)
	line	58
	
l12110:	
;rs485.c: 58: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12112:	
	movlb 0	; select bank0
	incf	(sendNACK@idx),f
	line	59
	
l12114:	
;rs485.c: 59: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendNACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12116:	
	incf	(sendNACK@idx),f
	line	60
	
l12118:	
;rs485.c: 60: gstSLIPSend.ucData[idx++] = 0x80;
	movf	(sendNACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(080h)
	movwf	indf1
	
l12120:	
	incf	(sendNACK@idx),f
	line	61
	
l12122:	
;rs485.c: 61: gstSLIPSend.ucData[idx++] = 0x89;
	movf	(sendNACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(089h)
	movwf	indf1
	
l12124:	
	incf	(sendNACK@idx),f
	line	62
	
l12126:	
;rs485.c: 62: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendNACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12128:	
	incf	(sendNACK@idx),f
	line	64
	
l12130:	
;rs485.c: 64: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendNACK@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	65
	
l12132:	
;rs485.c: 65: rs485_send_data();
	fcall	_rs485_send_data
	line	66
	
l4501:	
	return
	opt stack 0
GLOBAL	__end_of_sendNACK
	__end_of_sendNACK:
;; =============== function _sendNACK ends ============

	signat	_sendNACK,88
	global	_sendACK
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

;; *************** function _sendACK *****************
;; Defined at:
;;		line 41 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idx             1   37[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_rs485_send_data
;; This function is called by:
;;		_slip_main
;; This function uses a non-reentrant model
;;
psect	text776
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	41
	global	__size_of_sendACK
	__size_of_sendACK	equ	__end_of_sendACK-_sendACK
	
_sendACK:	
	opt	stack 6
; Regs used in _sendACK: [wreg+fsr1l-status,0+pclath+cstack]
	line	42
	
l12082:	
;rs485.c: 42: uchar idx = 0;
	clrf	(sendACK@idx)
	line	44
	
l12084:	
;rs485.c: 44: gstSLIPSend.ucData[idx++] = 0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+03h
	
l12086:	
	movlb 0	; select bank0
	incf	(sendACK@idx),f
	line	45
	
l12088:	
;rs485.c: 45: gstSLIPSend.ucData[idx++] = gucDevAddr;
	movf	(sendACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_gucDevAddr),w
	movwf	indf1
	
l12090:	
	incf	(sendACK@idx),f
	line	46
	
l12092:	
;rs485.c: 46: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12094:	
	incf	(sendACK@idx),f
	line	47
	
l12096:	
;rs485.c: 47: gstSLIPSend.ucData[idx++] = 0x00;
	movf	(sendACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l12098:	
	incf	(sendACK@idx),f
	line	48
	
l12100:	
;rs485.c: 48: gstSLIPSend.ucData[idx++] = 0xC0;
	movf	(sendACK@idx),w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	
l12102:	
	incf	(sendACK@idx),f
	line	50
	
l12104:	
;rs485.c: 50: gstSLIPSend.ucSendTolCnt = idx;
	movf	(sendACK@idx),w
	movlb 1	; select bank1
	movwf	0+(_gstSLIPSend)^080h+01h
	line	51
	
l12106:	
;rs485.c: 51: rs485_send_data();
	fcall	_rs485_send_data
	line	52
	
l4498:	
	return
	opt stack 0
GLOBAL	__end_of_sendACK
	__end_of_sendACK:
;; =============== function _sendACK ends ============

	signat	_sendACK,88
	global	_rs485_send_data
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

;; *************** function _rs485_send_data *****************
;; Defined at:
;;		line 16 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cc              4   33[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/1
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_sample_check
;; This function is called by:
;;		_sendACK
;;		_sendNACK
;;		_sendDEV
;;		_sendPHASE
;;		_sendTemper
;;		_sendVER
;; This function uses a non-reentrant model
;;
psect	text777
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	16
	global	__size_of_rs485_send_data
	__size_of_rs485_send_data	equ	__end_of_rs485_send_data-_rs485_send_data
	
_rs485_send_data:	
	opt	stack 6
; Regs used in _rs485_send_data: [wreg+fsr1l-status,0+pclath+cstack]
	line	17
	
l12058:	
;rs485.c: 17: gstSLIPSend.ucSendingState = SLIP_PROCESS;
	clrf	0+(_gstSLIPSend)^080h+02h
	incf	0+(_gstSLIPSend)^080h+02h,f
	line	18
	
l12060:	
;rs485.c: 18: gstSLIPSend.ucSentCnt = 0;
	clrf	(_gstSLIPSend)^080h
	line	20
	
l12062:	
;rs485.c: 20: RA7 = 1;
	movlb 0	; select bank0
	bsf	(103/8),(103)&7
	line	21
	
l12064:	
;rs485.c: 21: TXEN=1;
	movlb 3	; select bank3
	bsf	(3317/8)^0180h,(3317)&7
	line	22
	
l12066:	
;rs485.c: 22: TXIE = 1;
	movlb 1	; select bank1
	bsf	(1164/8)^080h,(1164)&7
	line	29
	
l12068:	
;rs485.c: 29: ulong cc = 0;
	movlb 0	; select bank0
	clrf	(rs485_send_data@cc)
	clrf	(rs485_send_data@cc+1)
	clrf	(rs485_send_data@cc+2)
	clrf	(rs485_send_data@cc+3)
	line	30
;rs485.c: 30: while((gstSLIPSend.ucSendingState == SLIP_PROCESS) && (cc++ < 0x0fffffff)) {sample_check();}
	goto	l12072
	
l12070:	
	fcall	_sample_check
	
l12072:	
	movlb 1	; select bank1
	decf	0+(_gstSLIPSend)^080h+02h,w
	skipz
	goto	u1681
	goto	u1680
u1681:
	goto	l4489
u1680:
	
l12074:	
	movlb 0	; select bank0
	incf	(rs485_send_data@cc),f
	skipnz
	incf	(rs485_send_data@cc+1),f
	skipnz
	incf	(rs485_send_data@cc+2),f
	skipnz
	incf	(rs485_send_data@cc+3),f
	movlw	010h
	subwf	((rs485_send_data@cc+3)),w
	skipz
	goto	u1695
	movlw	0
	subwf	((rs485_send_data@cc+2)),w
	skipz
	goto	u1695
	movlw	0
	subwf	((rs485_send_data@cc+1)),w
	skipz
	goto	u1695
	movlw	0
	subwf	((rs485_send_data@cc)),w
u1695:
	skipc
	goto	u1691
	goto	u1690
u1691:
	goto	l12070
u1690:
	
l4489:	
	line	31
;rs485.c: 31: cc = 0;
	movlb 0	; select bank0
	clrf	(rs485_send_data@cc)
	clrf	(rs485_send_data@cc+1)
	clrf	(rs485_send_data@cc+2)
	clrf	(rs485_send_data@cc+3)
	line	32
;rs485.c: 32: while((!TRMT)&&(cc++ < 0x0fffffff) ) {sample_check();}
	goto	l12078
	
l12076:	
	fcall	_sample_check
	
l12078:	
	movlb 3	; select bank3
	btfsc	(3313/8)^0180h,(3313)&7
	goto	u1701
	goto	u1700
u1701:
	goto	l4494
u1700:
	
l12080:	
	movlb 0	; select bank0
	incf	(rs485_send_data@cc),f
	skipnz
	incf	(rs485_send_data@cc+1),f
	skipnz
	incf	(rs485_send_data@cc+2),f
	skipnz
	incf	(rs485_send_data@cc+3),f
	movlw	010h
	subwf	((rs485_send_data@cc+3)),w
	skipz
	goto	u1715
	movlw	0
	subwf	((rs485_send_data@cc+2)),w
	skipz
	goto	u1715
	movlw	0
	subwf	((rs485_send_data@cc+1)),w
	skipz
	goto	u1715
	movlw	0
	subwf	((rs485_send_data@cc)),w
u1715:
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l12076
u1710:
	
l4494:	
	line	35
;rs485.c: 35: TXIE = 0;
	movlb 1	; select bank1
	bcf	(1164/8)^080h,(1164)&7
	line	36
;rs485.c: 36: TXEN=0;
	movlb 3	; select bank3
	bcf	(3317/8)^0180h,(3317)&7
	line	37
;rs485.c: 37: RA7 = 0;
	movlb 0	; select bank0
	bcf	(103/8),(103)&7
	line	38
	
l4495:	
	return
	opt stack 0
GLOBAL	__end_of_rs485_send_data
	__end_of_rs485_send_data:
;; =============== function _rs485_send_data ends ============

	signat	_rs485_send_data,88
	global	_sample_check
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function _sample_check *****************
;; Defined at:
;;		line 266 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1E/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Sample_ADE7758
;; This function is called by:
;;		_rs485_send_data
;; This function uses a non-reentrant model
;;
psect	text778
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	266
	global	__size_of_sample_check
	__size_of_sample_check	equ	__end_of_sample_check-_sample_check
	
_sample_check:	
	opt	stack 6
; Regs used in _sample_check: [wreg+fsr1l-status,0+pclath+cstack]
	line	267
	
l12038:	
;main.c: 267: if (Sample_flag == 1)
	btfss	(_Sample_flag/8),(_Sample_flag)&7
	goto	u1651
	goto	u1650
u1651:
	goto	l3008
u1650:
	line	269
	
l12040:	
;main.c: 268: {
;main.c: 269: Sample_flag = 0;
	bcf	(_Sample_flag/8),(_Sample_flag)&7
	line	270
	
l12042:	
;main.c: 270: Sample_ADE7758( 0x01 );
	movlw	(01h)
	fcall	_Sample_ADE7758
	line	271
	
l12044:	
# 271 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	text778
	line	273
;main.c: 273: Sample_ADE7758( 0x02 );
	movlw	(02h)
	fcall	_Sample_ADE7758
	line	274
	
l12046:	
# 274 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
clrwdt ;#
psect	text778
	line	277
	
l3008:	
	return
	opt stack 0
GLOBAL	__end_of_sample_check
	__end_of_sample_check:
;; =============== function _sample_check ends ============

	signat	_sample_check,88
	global	_OS_Init
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _OS_Init *****************
;; Defined at:
;;		line 68 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\kernel\system\osa_system.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		__OS_ReturnSave
;;		__OS_EnterWaitMode
;;		__OS_EnterWaitModeTO
;;		__OS_CheckEvent
;;		__OS_JumpToTask
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text779
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\kernel\system\osa_system.c"
	line	68
	global	__size_of_OS_Init
	__size_of_OS_Init	equ	__end_of_OS_Init-_OS_Init
	
_OS_Init:	
	opt	stack 11
; Regs used in _OS_Init: [wreg+status,2+status,0+pclath+cstack]
	line	72
	
l12012:	
;osa_system.c: 72: *(near OST_UINT*)&_OS_Flags = 0;
	clrf	(__OS_Flags)
	line	75
	
l12014:	
;osa_system.c: 75: if (PCLATH & 0x80) { _OS_ReturnSave(); _OS_EnterWaitMode(); _OS_EnterWaitModeTO(); _OS_CheckEvent(0); _OS_JumpToTask(); };
	btfss	(10),(7)&7
	goto	u1641
	goto	u1640
u1641:
	goto	l12018
u1640:
	
l12016:	
	fcall	__OS_ReturnSave
	fcall	__OS_EnterWaitMode
	fcall	__OS_EnterWaitModeTO
	movlw	(0)
	fcall	__OS_CheckEvent
	fcall	__OS_JumpToTask
	line	323
	
l12018:	
;osa_system.c: 323: _OS_CurTask = (OST_TASK_POINTER) _OS_Tasks + (3-1);
	movlw	(__OS_Tasks+08h)&0ffh
	movlb 0	; select bank0
	movwf	(__OS_CurTask)	;volatile
	line	326
	
l12020:	
;osa_system.c: 326: _OS_Tasks[0].State.bEnable = 0;
	bcf	(__OS_Tasks),6
	line	329
	
l12022:	
;osa_system.c: 329: _OS_Tasks[1].State.bEnable = 0;
	bcf	0+(__OS_Tasks)+04h,6
	line	333
	
l12024:	
;osa_system.c: 333: _OS_Tasks[2].State.bEnable = 0;
	bcf	0+(__OS_Tasks)+08h,6
	line	394
	
l7519:	
	return
	opt stack 0
GLOBAL	__end_of_OS_Init
	__end_of_OS_Init:
;; =============== function _OS_Init ends ============

	signat	_OS_Init,88
	global	_AD7758_check_init
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

;; *************** function _AD7758_check_init *****************
;; Defined at:
;;		line 268 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
;;		_thread_abnormal
;; This function uses a non-reentrant model
;;
psect	text780
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	268
	global	__size_of_AD7758_check_init
	__size_of_AD7758_check_init	equ	__end_of_AD7758_check_init-_AD7758_check_init
	
_AD7758_check_init:	
	opt	stack 10
; Regs used in _AD7758_check_init: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_check_init@chip stored from wreg
	movlb 0	; select bank0
	movwf	(AD7758_check_init@chip)
	line	269
	
l11990:	
;ADE7758.c: 269: uchar ret = 1;
	clrf	(AD7758_check_init@ret)
	incf	(AD7758_check_init@ret),f
	line	272
	
l11992:	
;ADE7758.c: 272: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(AD7758_check_init@chip),w
	fcall	_AD7758_CS
	line	275
	
l11994:	
;ADE7758.c: 275: AD7758_GetData(0x16,1,chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(AD7758_check_init@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(016h)
	fcall	_AD7758_GetData
	line	276
	
l11996:	
;ADE7758.c: 276: if ( 0x00 == ReadData[0])
	movf	(_ReadData),f
	skipz
	goto	u1621
	goto	u1620
u1621:
	goto	l12002
u1620:
	line	278
	
l11998:	
;ADE7758.c: 277: {
;ADE7758.c: 278: AD7758_GetData(0x17,1,chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(AD7758_check_init@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(017h)
	fcall	_AD7758_GetData
	line	279
	
l12000:	
;ADE7758.c: 279: if ( 0x40 != ReadData[0])
	movf	(_ReadData),w
	xorlw	040h&0ffh
	skipnz
	goto	u1631
	goto	u1630
u1631:
	goto	l12006
u1630:
	line	281
	
l12002:	
;ADE7758.c: 280: {
;ADE7758.c: 281: ret = 0;
	clrf	(AD7758_check_init@ret)
	line	290
	
l12006:	
;ADE7758.c: 287: }
;ADE7758.c: 290: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(AD7758_check_init@chip),w
	fcall	_AD7758_CS
	line	293
	
l12008:	
;ADE7758.c: 293: return ret;
	movf	(AD7758_check_init@ret),w
	line	294
	
l1485:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_check_init
	__end_of_AD7758_check_init:
;; =============== function _AD7758_check_init ends ============

	signat	_AD7758_check_init,4217
	global	_Sample_ADE7758
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function _Sample_ADE7758 *****************
;; Defined at:
;;		line 128 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
;;		_thread_Sample
;;		_sample_check
;; This function uses a non-reentrant model
;;
psect	text781
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	128
	global	__size_of_Sample_ADE7758
	__size_of_Sample_ADE7758	equ	__end_of_Sample_ADE7758-_Sample_ADE7758
	
_Sample_ADE7758:	
	opt	stack 10
; Regs used in _Sample_ADE7758: [wreg+fsr1l-status,0+pclath+cstack]
;Sample_ADE7758@chip stored from wreg
	line	132
	movlb 0	; select bank0
	movwf	(Sample_ADE7758@chip)
	
l11910:	
;ADE7758.c: 129: uint sum;
;ADE7758.c: 132: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(Sample_ADE7758@chip),w
	fcall	_AD7758_CS
	line	135
	
l11912:	
;ADE7758.c: 135: AD7758_GetData(0x10, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(010h)
	fcall	_AD7758_GetData
	line	136
	
l11914:	
;ADE7758.c: 136: if( FreqPhase[chip-1] == 1 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	decf	indf1,w
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l11924
u1530:
	line	138
	
l11916:	
;ADE7758.c: 137: {
;ADE7758.c: 138: ADE7758Data[chip-1].PhaseA.Frequency[0]=ReadData[0];
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
	line	139
;ADE7758.c: 139: ADE7758Data[chip-1].PhaseA.Frequency[1]=ReadData[1];
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
	line	140
	
l11918:	
;ADE7758.c: 140: FreqPhase[chip-1] = 2;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(02h)
	movwf	indf1
	line	141
	
l11920:	
;ADE7758.c: 141: SendData[0] = 0x01;
	clrf	(_SendData)
	incf	(_SendData),f
	line	142
	
l11922:	
;ADE7758.c: 142: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	143
;ADE7758.c: 143: }
	goto	l11944
	line	144
	
l11924:	
;ADE7758.c: 144: else if( FreqPhase[chip-1] == 2 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	02h&0ffh
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l11934
u1540:
	line	146
	
l11926:	
;ADE7758.c: 145: {
;ADE7758.c: 146: ADE7758Data[chip-1].PhaseB.Frequency[0]=ReadData[0];
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
	line	147
;ADE7758.c: 147: ADE7758Data[chip-1].PhaseB.Frequency[1]=ReadData[1];
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
	line	148
	
l11928:	
;ADE7758.c: 148: FreqPhase[chip-1] = 3;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(03h)
	movwf	indf1
	line	149
	
l11930:	
;ADE7758.c: 149: SendData[0] = 0x02;
	movlw	(02h)
	movwf	(_SendData)
	line	150
	
l11932:	
;ADE7758.c: 150: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	151
;ADE7758.c: 151: }
	goto	l11944
	line	152
	
l11934:	
;ADE7758.c: 152: else if( FreqPhase[chip-1] == 3 )
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	03h&0ffh
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l11944
u1550:
	line	154
	
l11936:	
;ADE7758.c: 153: {
;ADE7758.c: 154: ADE7758Data[chip-1].PhaseC.Frequency[0]=ReadData[0];
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
	line	155
;ADE7758.c: 155: ADE7758Data[chip-1].PhaseC.Frequency[1]=ReadData[1];
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
	line	156
	
l11938:	
;ADE7758.c: 156: FreqPhase[chip-1] = 1;
	movf	(Sample_ADE7758@chip),w
	addlw	_FreqPhase+-1&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	incf	indf1,f
	line	157
	
l11940:	
;ADE7758.c: 157: SendData[0] = 0x00;
	clrf	(_SendData)
	line	158
	
l11942:	
;ADE7758.c: 158: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	162
	
l11944:	
;ADE7758.c: 159: }
;ADE7758.c: 162: AD7758_GetData(0x01, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(01h)
	fcall	_AD7758_GetData
	line	163
	
l11946:	
;ADE7758.c: 163: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1561
	goto	u1560
u1561:
	goto	l11950
u1560:
	line	165
	
l11948:	
;ADE7758.c: 164: {
;ADE7758.c: 165: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	166
;ADE7758.c: 166: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	170
	
l11950:	
;ADE7758.c: 167: }
;ADE7758.c: 169: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Active_Power[0]) << 8) +
;ADE7758.c: 170: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Active_Power[1])) >> 1);
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
	line	172
	
l11952:	
;ADE7758.c: 172: ADE7758Data[chip-1].PhaseA.Active_Power[0] = (uchar)(sum>>8);
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
	line	173
	
l11954:	
;ADE7758.c: 173: ADE7758Data[chip-1].PhaseA.Active_Power[1] = (uchar)sum;
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
	line	174
	
l11956:	
;ADE7758.c: 174: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l1474
u1570:
	line	176
	
l11958:	
;ADE7758.c: 175: {
;ADE7758.c: 176: ADE7758Data[chip-1].PhaseA.Energy += sum;
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

	line	177
	
l1474:	
	line	179
;ADE7758.c: 177: }
;ADE7758.c: 179: AD7758_GetData(0x02, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(02h)
	fcall	_AD7758_GetData
	line	180
	
l11960:	
;ADE7758.c: 180: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1581
	goto	u1580
u1581:
	goto	l11964
u1580:
	line	182
	
l11962:	
;ADE7758.c: 181: {
;ADE7758.c: 182: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	183
;ADE7758.c: 183: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	186
	
l11964:	
;ADE7758.c: 184: }
;ADE7758.c: 185: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Active_Power[0]) << 8) +
;ADE7758.c: 186: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Active_Power[1])) >> 1);
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
	line	188
	
l11966:	
;ADE7758.c: 188: ADE7758Data[chip-1].PhaseB.Active_Power[0] = (uchar)(sum>>8);
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
	line	189
	
l11968:	
;ADE7758.c: 189: ADE7758Data[chip-1].PhaseB.Active_Power[1] = (uchar)sum;
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
	line	190
	
l11970:	
;ADE7758.c: 190: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l1476
u1590:
	line	192
	
l11972:	
;ADE7758.c: 191: {
;ADE7758.c: 192: ADE7758Data[chip-1].PhaseB.Energy += sum;
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

	line	193
	
l1476:	
	line	195
;ADE7758.c: 193: }
;ADE7758.c: 195: AD7758_GetData(0x03, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(03h)
	fcall	_AD7758_GetData
	line	196
	
l11974:	
;ADE7758.c: 196: if ( ReadData[0]&0x80 )
	btfss	(_ReadData),(7)&7
	goto	u1601
	goto	u1600
u1601:
	goto	l11978
u1600:
	line	198
	
l11976:	
;ADE7758.c: 197: {
;ADE7758.c: 198: ReadData[0] = ~ReadData[0];
	movlw	(0FFh)
	xorwf	(_ReadData),f
	line	199
;ADE7758.c: 199: ReadData[1] = ~ReadData[1];
	movlw	(0FFh)
	xorwf	0+(_ReadData)+01h,f
	line	202
	
l11978:	
;ADE7758.c: 200: }
;ADE7758.c: 201: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Active_Power[0]) << 8) +
;ADE7758.c: 202: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Active_Power[1])) >> 1);
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
	line	204
	
l11980:	
;ADE7758.c: 204: ADE7758Data[chip-1].PhaseC.Active_Power[0] = (uchar)(sum>>8);
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
	line	205
	
l11982:	
;ADE7758.c: 205: ADE7758Data[chip-1].PhaseC.Active_Power[1] = (uchar)sum;
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
	line	206
	
l11984:	
;ADE7758.c: 206: if (sum > 50 )
	movlw	high(033h)
	subwf	(Sample_ADE7758@sum+1),w
	movlw	low(033h)
	skipnz
	subwf	(Sample_ADE7758@sum),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l1478
u1610:
	line	208
	
l11986:	
;ADE7758.c: 207: {
;ADE7758.c: 208: ADE7758Data[chip-1].PhaseC.Energy += sum;
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

	line	209
	
l1478:	
	line	211
;ADE7758.c: 209: }
;ADE7758.c: 211: AD7758_GetData(0x0D, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Dh)
	fcall	_AD7758_GetData
	line	212
;ADE7758.c: 212: ADE7758Data[chip-1].PhaseA.Voltage[0]=ReadData[0];
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
	line	213
;ADE7758.c: 213: ADE7758Data[chip-1].PhaseA.Voltage[1]=ReadData[1];
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
	line	214
;ADE7758.c: 214: ADE7758Data[chip-1].PhaseA.Voltage[2]=ReadData[2];
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
	line	216
;ADE7758.c: 216: AD7758_GetData(0x0E, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Eh)
	fcall	_AD7758_GetData
	line	217
;ADE7758.c: 217: ADE7758Data[chip-1].PhaseB.Voltage[0]=ReadData[0];
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
	line	218
;ADE7758.c: 218: ADE7758Data[chip-1].PhaseB.Voltage[1]=ReadData[1];
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
	line	219
;ADE7758.c: 219: ADE7758Data[chip-1].PhaseB.Voltage[2]=ReadData[2];
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
	line	221
;ADE7758.c: 221: AD7758_GetData(0x0F, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Fh)
	fcall	_AD7758_GetData
	line	222
;ADE7758.c: 222: ADE7758Data[chip-1].PhaseC.Voltage[0]=ReadData[0];
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
	line	223
;ADE7758.c: 223: ADE7758Data[chip-1].PhaseC.Voltage[1]=ReadData[1];
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
	line	224
;ADE7758.c: 224: ADE7758Data[chip-1].PhaseC.Voltage[2]=ReadData[2];
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
	line	226
;ADE7758.c: 226: AD7758_GetData(0x0A, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Ah)
	fcall	_AD7758_GetData
	line	227
;ADE7758.c: 227: ADE7758Data[chip-1].PhaseA.Current[0]=ReadData[0];
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
	line	228
;ADE7758.c: 228: ADE7758Data[chip-1].PhaseA.Current[1]=ReadData[1];
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
	line	229
;ADE7758.c: 229: ADE7758Data[chip-1].PhaseA.Current[2]=ReadData[2];
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
	line	231
;ADE7758.c: 231: AD7758_GetData(0x0B, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Bh)
	fcall	_AD7758_GetData
	line	232
;ADE7758.c: 232: ADE7758Data[chip-1].PhaseB.Current[0]=ReadData[0];
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
	line	233
;ADE7758.c: 233: ADE7758Data[chip-1].PhaseB.Current[1]=ReadData[1];
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
	line	234
;ADE7758.c: 234: ADE7758Data[chip-1].PhaseB.Current[2]=ReadData[2];
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
	line	236
;ADE7758.c: 236: AD7758_GetData(0x0C, 3, chip);
	movlw	(03h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(0Ch)
	fcall	_AD7758_GetData
	line	237
;ADE7758.c: 237: ADE7758Data[chip-1].PhaseC.Current[0]=ReadData[0];
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
	line	238
;ADE7758.c: 238: ADE7758Data[chip-1].PhaseC.Current[1]=ReadData[1];
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
	line	239
;ADE7758.c: 239: ADE7758Data[chip-1].PhaseC.Current[2]=ReadData[2];
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
	line	241
;ADE7758.c: 241: AD7758_GetData(0x07, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(07h)
	fcall	_AD7758_GetData
	line	243
;ADE7758.c: 242: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseA.Apparent_Power[0]) << 8) +
;ADE7758.c: 243: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseA.Apparent_Power[1])) >> 1);
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
	line	244
;ADE7758.c: 244: ADE7758Data[chip-1].PhaseA.Apparent_Power[0] = (uchar)(sum>>8);
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
	line	245
;ADE7758.c: 245: ADE7758Data[chip-1].PhaseA.Apparent_Power[1] = (uchar)sum;
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
	line	247
;ADE7758.c: 247: AD7758_GetData(0x08, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(08h)
	fcall	_AD7758_GetData
	line	249
;ADE7758.c: 248: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseB.Apparent_Power[0]) << 8) +
;ADE7758.c: 249: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseB.Apparent_Power[1])) >> 1);
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
	line	250
;ADE7758.c: 250: ADE7758Data[chip-1].PhaseB.Apparent_Power[0] = (uchar)(sum>>8);
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
	line	251
;ADE7758.c: 251: ADE7758Data[chip-1].PhaseB.Apparent_Power[1] = (uchar)sum;
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
	line	253
;ADE7758.c: 253: AD7758_GetData(0x09, 2, chip);
	movlw	(02h)
	movwf	(?_AD7758_GetData)
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(09h)
	fcall	_AD7758_GetData
	line	255
;ADE7758.c: 254: sum = (uint)(((((ulong)ReadData[0] + ADE7758Data[chip-1].PhaseC.Apparent_Power[0]) << 8) +
;ADE7758.c: 255: ((ulong)ReadData[1] + ADE7758Data[chip-1].PhaseC.Apparent_Power[1])) >> 1);
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
	line	256
;ADE7758.c: 256: ADE7758Data[chip-1].PhaseC.Apparent_Power[0] = (uchar)(sum>>8);
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
	line	257
;ADE7758.c: 257: ADE7758Data[chip-1].PhaseC.Apparent_Power[1] = (uchar)sum;
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
	line	259
;ADE7758.c: 259: AD7758_GetData(0x11, 1, chip);
	clrf	(?_AD7758_GetData)
	incf	(?_AD7758_GetData),f
	movf	(Sample_ADE7758@chip),w
	movwf	0+(?_AD7758_GetData)+01h
	movlw	(011h)
	fcall	_AD7758_GetData
	line	260
;ADE7758.c: 260: ADE7758Data[chip-1].Temper = (schar)ReadData[0];
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
	line	263
	
l11988:	
;ADE7758.c: 263: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(Sample_ADE7758@chip),w
	fcall	_AD7758_CS
	line	265
	
l1479:	
	return
	opt stack 0
GLOBAL	__end_of_Sample_ADE7758
	__end_of_Sample_ADE7758:
;; =============== function _Sample_ADE7758 ends ============

	signat	_Sample_ADE7758,4216
	global	_AD7758_init
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

;; *************** function _AD7758_init *****************
;; Defined at:
;;		line 101 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
;;		_thread_abnormal
;;		_main
;; This function uses a non-reentrant model
;;
psect	text782
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	101
	global	__size_of_AD7758_init
	__size_of_AD7758_init	equ	__end_of_AD7758_init-_AD7758_init
	
_AD7758_init:	
	opt	stack 10
; Regs used in _AD7758_init: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_init@chip stored from wreg
	line	103
	movwf	(AD7758_init@chip)
	
l11886:	
;ADE7758.c: 103: AD7758_CS(chip, 1);
	clrf	(?_AD7758_CS)
	incf	(?_AD7758_CS),f
	movf	(AD7758_init@chip),w
	fcall	_AD7758_CS
	line	106
	
l11888:	
;ADE7758.c: 106: SendData[0] = 0x40;
	movlw	(040h)
	movwf	(_SendData)
	line	107
	
l11890:	
;ADE7758.c: 107: AD7758_SendData(0x13,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(013h)
	fcall	_AD7758_SendData
	line	108
	
l11892:	
;ADE7758.c: 108: Delay(0x20);
	movlw	020h
	movwf	(?_Delay)
	clrf	(?_Delay+1)
	clrf	(?_Delay+2)
	clrf	(?_Delay+3)

	fcall	_Delay
	line	110
	
l11894:	
;ADE7758.c: 110: SendData[0] = 0x00;
	clrf	(_SendData)
	line	111
	
l11896:	
;ADE7758.c: 111: AD7758_SendData(0x16,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(016h)
	fcall	_AD7758_SendData
	line	113
	
l11898:	
;ADE7758.c: 113: SendData[0] = 0x40;
	movlw	(040h)
	movwf	(_SendData)
	line	114
	
l11900:	
;ADE7758.c: 114: AD7758_SendData(0x17,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(017h)
	fcall	_AD7758_SendData
	line	116
	
l11902:	
;ADE7758.c: 116: SendData[0] = 0x00;
	clrf	(_SendData)
	line	117
;ADE7758.c: 117: AD7758_SendData(0x14,1,chip);
	clrf	(?_AD7758_SendData)
	incf	(?_AD7758_SendData),f
	movf	(AD7758_init@chip),w
	movwf	0+(?_AD7758_SendData)+01h
	movlw	(014h)
	fcall	_AD7758_SendData
	line	118
	
l11904:	
;ADE7758.c: 118: FreqPhase[0] = 1;
	clrf	(_FreqPhase)
	incf	(_FreqPhase),f
	line	119
	
l11906:	
;ADE7758.c: 119: FreqPhase[1] = 1;
	clrf	0+(_FreqPhase)+01h
	incf	0+(_FreqPhase)+01h,f
	line	122
	
l11908:	
;ADE7758.c: 122: AD7758_CS(chip, 0);
	clrf	(?_AD7758_CS)
	movf	(AD7758_init@chip),w
	fcall	_AD7758_CS
	line	125
	
l1465:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_init
	__end_of_AD7758_init:
;; =============== function _AD7758_init ends ============

	signat	_AD7758_init,4216
	global	__OS_EnterWaitModeTO
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

;; *************** function __OS_EnterWaitModeTO *****************
;; Defined at:
;;		line 129 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/1F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		__OS_ClrReadySetClrCanContinue
;; This function is called by:
;;		_OS_Init
;; This function uses a non-reentrant model
;;
psect	text783
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	129
	global	__size_of__OS_EnterWaitModeTO
	__size_of__OS_EnterWaitModeTO	equ	__end_of__OS_EnterWaitModeTO-__OS_EnterWaitModeTO
	
__OS_EnterWaitModeTO:	
	opt	stack 11
; Regs used in __OS_EnterWaitModeTO: [wreg+status,2+status,0+pclath+cstack]
	line	130
	
l11880:	
;osa_pic16e_htpicc_pro.c: 130: _OS_Temp = 0xFF;
	movlw	(0FFh)
	movlb 0	; select bank0
	movwf	(__OS_Temp)
	line	131
	
l11882:	
;osa_pic16e_htpicc_pro.c: 131: _OS_ClrReadySetClrCanContinue();
	fcall	__OS_ClrReadySetClrCanContinue
	line	132
	
l11884:	
;osa_pic16e_htpicc_pro.c: 132: _nop();
	nop
	line	133
	
l7494:	
	return
	opt stack 0
GLOBAL	__end_of__OS_EnterWaitModeTO
	__end_of__OS_EnterWaitModeTO:
;; =============== function __OS_EnterWaitModeTO ends ============

	signat	__OS_EnterWaitModeTO,88
	global	_processing_slipcmd
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

;; *************** function _processing_slipcmd *****************
;; Defined at:
;;		line 203 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   10[BANK0 ] unsigned char 
;;  j               1    9[BANK0 ] unsigned char 
;;  pend            1    8[BANK0 ] unsigned char 
;;  ret             1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       2       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_calculateCRC8
;; This function is called by:
;;		_slip_main
;; This function uses a non-reentrant model
;;
psect	text784
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\rs485.c"
	line	203
	global	__size_of_processing_slipcmd
	__size_of_processing_slipcmd	equ	__end_of_processing_slipcmd-_processing_slipcmd
	
_processing_slipcmd:	
	opt	stack 10
; Regs used in _processing_slipcmd: [wreg-status,0+pclath+cstack]
	line	205
	
l11826:	
;rs485.c: 204: uchar i, j;
;rs485.c: 205: uchar pend = 0;
	movlb 0	; select bank0
	clrf	(processing_slipcmd@pend)
	line	210
	
l11828:	
;rs485.c: 206: uchar ret;
;rs485.c: 210: for (i = 1; i < gstSLIPRecv.ucRecdCnt - 1; i++)
	clrf	(processing_slipcmd@i)
	incf	(processing_slipcmd@i),f
	goto	l11860
	line	212
	
l11830:	
;rs485.c: 211: {
;rs485.c: 212: if (gstSLIPRecv.ucData[i] == 0xDC && pend == 1)
	movlb 0	; select bank0
	movf	(processing_slipcmd@i),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0DCh&0ffh
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l11836
u1420:
	
l11832:	
	decf	(processing_slipcmd@pend),w
	skipz
	goto	u1431
	goto	u1430
u1431:
	goto	l11836
u1430:
	line	214
	
l11834:	
;rs485.c: 213: {
;rs485.c: 214: gstSLIPRecv.ucData[i] = 0xC0;
	movf	(processing_slipcmd@i),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0C0h)
	movwf	indf1
	line	215
;rs485.c: 215: }
	goto	l11856
	line	216
	
l11836:	
;rs485.c: 216: else if (gstSLIPRecv.ucData[i] == 0xDD && pend == 1)
	movf	(processing_slipcmd@i),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0DDh&0ffh
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l11842
u1440:
	
l11838:	
	decf	(processing_slipcmd@pend),w
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l11842
u1450:
	line	218
	
l11840:	
;rs485.c: 217: {
;rs485.c: 218: gstSLIPRecv.ucData[i] = 0xDB;
	movf	(processing_slipcmd@i),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0DBh)
	movwf	indf1
	line	219
;rs485.c: 219: }
	goto	l11856
	line	220
	
l11842:	
;rs485.c: 220: else if (gstSLIPRecv.ucData[i] == 0xDB)
	movf	(processing_slipcmd@i),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0DBh&0ffh
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l11856
u1460:
	line	222
	
l11844:	
;rs485.c: 221: {
;rs485.c: 222: for (j = i; j < gstSLIPRecv.ucRecdCnt - 1; j++)
	movf	(processing_slipcmd@i),w
	movwf	(processing_slipcmd@j)
	goto	l11850
	line	224
	
l11846:	
;rs485.c: 223: {
;rs485.c: 224: gstSLIPRecv.ucData[j] = gstSLIPRecv.ucData[j+1];
	movlb 0	; select bank0
	movf	(processing_slipcmd@j),w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(processing_slipcmd@j),w
	addlw	_gstSLIPRecv+03h&0ffh
	movwf	fsr0l
	clrf fsr0h	
	
	movf	indf0,w
	movwf	indf1
	line	222
	
l11848:	
	incf	(processing_slipcmd@j),f
	
l11850:	
	movlb 1	; select bank1
	movf	(_gstSLIPRecv)^080h,w
	addlw	low(-1)
	movlb 0	; select bank0
	movwf	(??_processing_slipcmd+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_processing_slipcmd+0)+0)+1
	movf	1+(??_processing_slipcmd+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1475
	movf	0+(??_processing_slipcmd+0)+0,w
	subwf	(processing_slipcmd@j),w
u1475:

	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l11846
u1470:
	line	226
	
l11852:	
;rs485.c: 225: }
;rs485.c: 226: i--;
	movlb 0	; select bank0
	decf	(processing_slipcmd@i),f
	line	227
;rs485.c: 227: gstSLIPRecv.ucRecdCnt--;
	movlb 1	; select bank1
	decf	(_gstSLIPRecv)^080h,f
	line	228
	
l11854:	
;rs485.c: 228: pend = 1;
	movlb 0	; select bank0
	clrf	(processing_slipcmd@pend)
	incf	(processing_slipcmd@pend),f
	line	229
;rs485.c: 229: continue;
	goto	l11858
	line	231
	
l11856:	
;rs485.c: 230: }
;rs485.c: 231: pend = 0;
	clrf	(processing_slipcmd@pend)
	line	210
	
l11858:	
	incf	(processing_slipcmd@i),f
	
l11860:	
	movlb 1	; select bank1
	movf	(_gstSLIPRecv)^080h,w
	addlw	low(-1)
	movlb 0	; select bank0
	movwf	(??_processing_slipcmd+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_processing_slipcmd+0)+0)+1
	movf	1+(??_processing_slipcmd+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1485
	movf	0+(??_processing_slipcmd+0)+0,w
	subwf	(processing_slipcmd@i),w
u1485:

	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l11830
u1480:
	line	234
	
l11862:	
;rs485.c: 232: }
;rs485.c: 234: ret = 0;
	movlb 0	; select bank0
	clrf	(processing_slipcmd@ret)
	line	235
	
l11864:	
;rs485.c: 235: if (gstSLIPRecv.ucData[1] != gucDevAddr)
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+03h,w
	movlb 0	; select bank0
	xorwf	(_gucDevAddr),w
	skipnz
	goto	u1491
	goto	u1490
u1491:
	goto	l11868
u1490:
	line	237
	
l11866:	
;rs485.c: 236: {
;rs485.c: 237: ret = 2;
	movlw	(02h)
	movwf	(processing_slipcmd@ret)
	line	238
;rs485.c: 238: }
	goto	l11876
	line	240
	
l11868:	
;rs485.c: 239: else if ((gstSLIPRecv.ucData[0] != 0xC0)
;rs485.c: 240: || (gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt-1] != 0xC0))
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+02h,w
	xorlw	0C0h&0ffh
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l4538
u1500:
	
l11870:	
	movf	(_gstSLIPRecv)^080h,w
	addlw	_gstSLIPRecv+01h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0C0h&0ffh
	skipnz
	goto	u1511
	goto	u1510
u1511:
	goto	l11872
u1510:
	
l4538:	
	line	242
;rs485.c: 241: {
;rs485.c: 242: ret = 1;
	movlb 0	; select bank0
	clrf	(processing_slipcmd@ret)
	incf	(processing_slipcmd@ret),f
	line	243
;rs485.c: 243: }
	goto	l11876
	line	244
	
l11872:	
;rs485.c: 244: else if ( gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt - 2] != calculateCRC8(gstSLIPRecv.ucData+2, gstSLIPRecv.ucRecdCnt-4))
	movf	(_gstSLIPRecv)^080h,w
	addlw	_gstSLIPRecv&0ffh
	movwf	fsr0l
	clrf fsr0h	
	
	movf	(_gstSLIPRecv)^080h,w
	addlw	0FCh
	movlb 0	; select bank0
	movwf	(?_calculateCRC8)
	movlw	(_gstSLIPRecv+04h)&0ffh
	fcall	_calculateCRC8
	xorwf	indf0,w
	skipnz
	goto	u1521
	goto	u1520
u1521:
	goto	l11876
u1520:
	goto	l4538
	line	249
	
l11876:	
;rs485.c: 247: }
;rs485.c: 249: return ret;
	movf	(processing_slipcmd@ret),w
	line	250
	
l4541:	
	return
	opt stack 0
GLOBAL	__end_of_processing_slipcmd
	__end_of_processing_slipcmd:
;; =============== function _processing_slipcmd ends ============

	signat	_processing_slipcmd,89
	global	__OS_EnterWaitMode
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

;; *************** function __OS_EnterWaitMode *****************
;; Defined at:
;;		line 104 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		__OS_ClrReadySetClrCanContinue
;; This function is called by:
;;		_thread_Sample
;;		_thread_slip
;;		_thread_abnormal
;;		_OS_Init
;; This function uses a non-reentrant model
;;
psect	text785
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	104
	global	__size_of__OS_EnterWaitMode
	__size_of__OS_EnterWaitMode	equ	__end_of__OS_EnterWaitMode-__OS_EnterWaitMode
	
__OS_EnterWaitMode:	
	opt	stack 11
; Regs used in __OS_EnterWaitMode: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11820:	
;osa_pic16e_htpicc_pro.c: 105: _OS_Temp = 0;
	movlb 0	; select bank0
	clrf	(__OS_Temp)
	line	106
	
l11822:	
;osa_pic16e_htpicc_pro.c: 106: _OS_ClrReadySetClrCanContinue();
	fcall	__OS_ClrReadySetClrCanContinue
	line	107
	
l11824:	
;osa_pic16e_htpicc_pro.c: 107: _nop();
	nop
	line	108
	
l7491:	
	return
	opt stack 0
GLOBAL	__end_of__OS_EnterWaitMode
	__end_of__OS_EnterWaitMode:
;; =============== function __OS_EnterWaitMode ends ============

	signat	__OS_EnterWaitMode,88
	global	_Initialize
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:

;; *************** function _Initialize *****************
;; Defined at:
;;		line 40 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_vmemset
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text786
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	40
	global	__size_of_Initialize
	__size_of_Initialize	equ	__end_of_Initialize-_Initialize
	
_Initialize:	
	opt	stack 12
; Regs used in _Initialize: [wreg+fsr1l-status,0+pclath+cstack]
	line	42
	
l11728:	
;main.c: 42: GIE=0;
	bcf	(95/8),(95)&7
	line	43
	
l11730:	
;main.c: 43: OSCCON = 0x68;
	movlw	(068h)
	movlb 1	; select bank1
	movwf	(153)^080h	;volatile
	line	45
;main.c: 45: {; }
	
l2966:	
	line	44
	btfss	(1236/8)^080h,(1236)&7
	goto	u1411
	goto	u1410
u1411:
	goto	l2966
u1410:
	line	47
	
l11732:	
;main.c: 47: ANSELA = 0x10;
	movlw	(010h)
	movlb 3	; select bank3
	movwf	(396)^0180h	;volatile
	line	48
	
l11734:	
;main.c: 48: PORTA = 0;
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	50
	
l11736:	
;main.c: 50: TRISA7 = 0;
	movlb 1	; select bank1
	bcf	(1127/8)^080h,(1127)&7
	line	51
	
l11738:	
;main.c: 51: TRISA6 = 0;
	bcf	(1126/8)^080h,(1126)&7
	line	52
	
l11740:	
;main.c: 52: TRISA4 = 1;
	bsf	(1124/8)^080h,(1124)&7
	line	53
	
l11742:	
;main.c: 53: TRISA3 = 1;
	bsf	(1123/8)^080h,(1123)&7
	line	54
	
l11744:	
;main.c: 54: TRISA2 = 1;
	bsf	(1122/8)^080h,(1122)&7
	line	55
	
l11746:	
;main.c: 55: TRISA1 = 1;
	bsf	(1121/8)^080h,(1121)&7
	line	56
	
l11748:	
;main.c: 56: TRISA0 = 1;
	bsf	(1120/8)^080h,(1120)&7
	line	58
	
l11750:	
;main.c: 58: ANSELB = 0x00;
	movlb 3	; select bank3
	clrf	(397)^0180h	;volatile
	line	59
	
l11752:	
;main.c: 59: TRISB0 = 0;
	movlb 1	; select bank1
	bcf	(1128/8)^080h,(1128)&7
	line	60
	
l11754:	
;main.c: 60: TRISB1 = 1;
	bsf	(1129/8)^080h,(1129)&7
	line	61
	
l11756:	
;main.c: 61: TRISB2 = 1;
	bsf	(1130/8)^080h,(1130)&7
	line	62
	
l11758:	
;main.c: 62: TRISB3 = 0;
	bcf	(1131/8)^080h,(1131)&7
	line	63
	
l11760:	
;main.c: 63: TRISB4 = 0;
	bcf	(1132/8)^080h,(1132)&7
	line	64
	
l11762:	
;main.c: 64: TRISB5 = 0;
	bcf	(1133/8)^080h,(1133)&7
	line	65
	
l11764:	
;main.c: 65: TRISB6 = 0;
	bcf	(1134/8)^080h,(1134)&7
	line	66
	
l11766:	
;main.c: 66: TRISB7 = 1;
	bsf	(1135/8)^080h,(1135)&7
	line	67
;main.c: 67: WPUB = 0B11111111;
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(525)^0200h	;volatile
	line	70
;main.c: 70: ADCON1=0xC0;
	movlw	(0C0h)
	movlb 1	; select bank1
	movwf	(158)^080h	;volatile
	line	73
	
l11768:	
;main.c: 73: RXDTSEL = 1;
	movlb 2	; select bank2
	bsf	(2287/8)^0100h,(2287)&7
	line	74
	
l11770:	
;main.c: 74: TXCKSEL = 1;
	bsf	(2288/8)^0100h,(2288)&7
	line	75
	
l11772:	
;main.c: 75: SDO1SEL = 1;
	bsf	(2286/8)^0100h,(2286)&7
	line	79
	
l11774:	
;main.c: 79: SYNC = 0;
	movlb 3	; select bank3
	bcf	(3316/8)^0180h,(3316)&7
	line	80
	
l11776:	
;main.c: 80: BRGH = 1;
	bsf	(3314/8)^0180h,(3314)&7
	line	81
	
l11778:	
;main.c: 81: BRG16 = 1;
	bsf	(3323/8)^0180h,(3323)&7
	line	82
	
l11780:	
;main.c: 82: SPBRGH = 0X00;
	clrf	(412)^0180h	;volatile
	line	83
	
l11782:	
;main.c: 83: SPBRGL = 0X33;
	movlw	(033h)
	movwf	(411)^0180h	;volatile
	line	85
	
l11784:	
;main.c: 85: SYNC = 0;
	bcf	(3316/8)^0180h,(3316)&7
	line	86
	
l11786:	
;main.c: 86: SPEN = 1;
	bsf	(3311/8)^0180h,(3311)&7
	line	87
	
l11788:	
;main.c: 87: TX9 = 0;
	bcf	(3318/8)^0180h,(3318)&7
	line	88
	
l11790:	
;main.c: 88: SCKP = 0;
	bcf	(3324/8)^0180h,(3324)&7
	line	89
	
l11792:	
;main.c: 89: TXEN = 1;
	bsf	(3317/8)^0180h,(3317)&7
	line	90
	
l11794:	
;main.c: 90: RCIE = 1;
	movlb 1	; select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	91
	
l11796:	
;main.c: 91: RX9 = 0;
	movlb 3	; select bank3
	bcf	(3310/8)^0180h,(3310)&7
	line	92
	
l11798:	
;main.c: 92: CREN = 1;
	bsf	(3308/8)^0180h,(3308)&7
	line	94
	
l11800:	
;main.c: 94: OPTION_REG &= 0B01000111;
	movlw	(047h)
	movlb 1	; select bank1
	andwf	(149)^080h,f	;volatile
	line	95
	
l11802:	
;main.c: 95: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	96
	
l11804:	
;main.c: 96: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	97
	
l11806:	
;main.c: 97: TMR0 = 61;
	movlw	(03Dh)
	movlb 0	; select bank0
	movwf	(21)	;volatile
	line	117
	
l11808:	
;main.c: 117: WDTCONbits.WDTPS = 0B01010;
	movlb 1	; select bank1
	movf	(151)^080h,w	;volatile
	andlw	not (((1<<5)-1)<<1)
	iorlw	(0Ah & ((1<<5)-1))<<1
	movwf	(151)^080h	;volatile
	line	119
	
l11810:	
;main.c: 119: gstSLIPRecv.ucRecingState = SLIP_IDLE;
	clrf	0+(_gstSLIPRecv)^080h+01h
	line	120
	
l11812:	
;main.c: 120: gstSLIPSend.ucSendingState = SLIP_IDLE;
	clrf	0+(_gstSLIPSend)^080h+02h
	line	121
	
l11814:	
;main.c: 121: vmemset((void*)ADE7758Data, 0, sizeof(ADE7758Data));
	movlw	low(8462)
	movlb 0	; select bank0
	movwf	(?_vmemset)
	movlw	high(8462)
	movwf	((?_vmemset))+1
	clrf	0+(?_vmemset)+02h
	clrf	1+(?_vmemset)+02h
	movlw	062h
	movwf	0+(?_vmemset)+04h
	clrf	1+(?_vmemset)+04h
	fcall	_vmemset
	line	123
	
l11816:	
;main.c: 123: PEIE = 1;
	bsf	(94/8),(94)&7
	line	124
	
l11818:	
;main.c: 124: GIE = 1;
	bsf	(95/8),(95)&7
	line	125
	
l2969:	
	return
	opt stack 0
GLOBAL	__end_of_Initialize
	__end_of_Initialize:
;; =============== function _Initialize ends ============

	signat	_Initialize,88
	global	_AD7758_SendData
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

;; *************** function _AD7758_SendData *****************
;; Defined at:
;;		line 70 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
psect	text787
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	70
	global	__size_of_AD7758_SendData
	__size_of_AD7758_SendData	equ	__end_of_AD7758_SendData-_AD7758_SendData
	
_AD7758_SendData:	
	opt	stack 10
; Regs used in _AD7758_SendData: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_SendData@addr stored from wreg
	line	87
	movwf	(AD7758_SendData@addr)
	
l11718:	
;ADE7758.c: 71: uchar i;
;ADE7758.c: 87: spiSendByte(addr|0x80);
	movf	(AD7758_SendData@addr),w
	iorlw	080h
	fcall	_spiSendByte
	line	88
	
l11720:	
;ADE7758.c: 88: for(i=0;i<num;i++)
	clrf	(AD7758_SendData@i)
	goto	l11726
	line	90
	
l11722:	
;ADE7758.c: 89: {
;ADE7758.c: 90: spiSendByte (SendData[i]);
	movf	(AD7758_SendData@i),w
	addlw	_SendData&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	fcall	_spiSendByte
	line	88
	
l11724:	
	incf	(AD7758_SendData@i),f
	
l11726:	
	movf	(AD7758_SendData@num),w
	subwf	(AD7758_SendData@i),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l11722
u1400:
	line	98
	
l1462:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_SendData
	__end_of_AD7758_SendData:
;; =============== function _AD7758_SendData ends ============

	signat	_AD7758_SendData,12408
	global	_AD7758_GetData
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

;; *************** function _AD7758_GetData *****************
;; Defined at:
;;		line 39 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
psect	text788
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	39
	global	__size_of_AD7758_GetData
	__size_of_AD7758_GetData	equ	__end_of_AD7758_GetData-_AD7758_GetData
	
_AD7758_GetData:	
	opt	stack 10
; Regs used in _AD7758_GetData: [wreg+fsr1l-status,0+pclath+cstack]
;AD7758_GetData@addr stored from wreg
	line	56
	movwf	(AD7758_GetData@addr)
	
l11708:	
;ADE7758.c: 40: uchar i;
;ADE7758.c: 56: spiSendByte(addr);
	movf	(AD7758_GetData@addr),w
	fcall	_spiSendByte
	line	57
	
l11710:	
;ADE7758.c: 57: for(i=0;i<num;i++)
	clrf	(AD7758_GetData@i)
	goto	l11716
	line	59
	
l11712:	
;ADE7758.c: 58: {
;ADE7758.c: 59: ReadData[i] = spiSendByte (0x00);
	movf	(AD7758_GetData@i),w
	addlw	_ReadData&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0)
	fcall	_spiSendByte
	movwf	indf1
	line	57
	
l11714:	
	incf	(AD7758_GetData@i),f
	
l11716:	
	movf	(AD7758_GetData@num),w
	subwf	(AD7758_GetData@i),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l11712
u1390:
	line	67
	
l1456:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_GetData
	__end_of_AD7758_GetData:
;; =============== function _AD7758_GetData ends ============

	signat	_AD7758_GetData,12408
	global	_AD7758_CS
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:

;; *************** function _AD7758_CS *****************
;; Defined at:
;;		line 14 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
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
psect	text789
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\ADE7758.c"
	line	14
	global	__size_of_AD7758_CS
	__size_of_AD7758_CS	equ	__end_of_AD7758_CS-_AD7758_CS
	
_AD7758_CS:	
	opt	stack 10
; Regs used in _AD7758_CS: [wreg+status,2+status,0+pclath+cstack]
;AD7758_CS@chip stored from wreg
	movwf	(AD7758_CS@chip)
	line	15
	
l11696:	
;ADE7758.c: 15: if (enable)
	movf	(AD7758_CS@enable),w
	skipz
	goto	u1360
	goto	l1445
u1360:
	line	17
	
l11698:	
;ADE7758.c: 16: {
;ADE7758.c: 17: if ( 1 == chip )
	decf	(AD7758_CS@chip),w
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l11702
u1370:
	line	19
	
l11700:	
;ADE7758.c: 18: {
;ADE7758.c: 19: RB3=0;
	bcf	(107/8),(107)&7
	line	20
;ADE7758.c: 20: RB0=1;
	bsf	(104/8),(104)&7
	line	21
;ADE7758.c: 21: }
	goto	l11706
	line	22
	
l11702:	
;ADE7758.c: 22: else if ( 2 == chip )
	movf	(AD7758_CS@chip),w
	xorlw	02h&0ffh
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l11706
u1380:
	line	24
	
l11704:	
;ADE7758.c: 23: {
;ADE7758.c: 24: RB0=0;
	bcf	(104/8),(104)&7
	line	25
;ADE7758.c: 25: RB3=1;
	bsf	(107/8),(107)&7
	goto	l11706
	line	28
	
l1445:	
	line	30
;ADE7758.c: 28: else
;ADE7758.c: 29: {
;ADE7758.c: 30: RB3=1;
	bsf	(107/8),(107)&7
	line	31
;ADE7758.c: 31: RB0=1;
	bsf	(104/8),(104)&7
	line	34
	
l11706:	
;ADE7758.c: 32: }
;ADE7758.c: 34: Delay(0x01);
	clrf	(?_Delay)
	incf	(?_Delay),f
	clrf	(?_Delay+1)
	clrf	(?_Delay+2)
	clrf	(?_Delay+3)
	fcall	_Delay
	line	35
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of_AD7758_CS
	__end_of_AD7758_CS:
;; =============== function _AD7758_CS ends ============

	signat	_AD7758_CS,8312
	global	___bmul
psect	text790,local,class=CODE,delta=2
global __ptext790
__ptext790:

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
psect	text790
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 11
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l11644:	
	clrf	(___bmul@product)
	line	7
	
l11646:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1281
	goto	u1280
u1281:
	goto	l11650
u1280:
	line	8
	
l11648:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l11650:	
	lslf	(___bmul@multiplicand),f
	line	10
	
l11652:	
	lsrf	(___bmul@multiplier),f
	line	11
	
l11654:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l11646
u1290:
	line	12
	
l11656:	
	movf	(___bmul@product),w
	line	13
	
l8847:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	__OS_ClrReadySetClrCanContinue
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:

;; *************** function __OS_ClrReadySetClrCanContinue *****************
;; Defined at:
;;		line 156 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
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
;;		__OS_EnterWaitMode
;;		__OS_EnterWaitModeTO
;; This function uses a non-reentrant model
;;
psect	text791
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	156
	global	__size_of__OS_ClrReadySetClrCanContinue
	__size_of__OS_ClrReadySetClrCanContinue	equ	__end_of__OS_ClrReadySetClrCanContinue-__OS_ClrReadySetClrCanContinue
	
__OS_ClrReadySetClrCanContinue:	
	opt	stack 11
; Regs used in __OS_ClrReadySetClrCanContinue: [wreg+status,2+status,0]
	line	157
	
l11614:	
;osa_pic16e_htpicc_pro.c: 157: STKPTR--;;
	movlb 31	; select bank31
	decf	(4077)^0F80h,f	;volatile
	line	159
	
l11616:	
;osa_pic16e_htpicc_pro.c: 159: _OS_Flags.bEventError = 0;
	movlb 0	; select bank0
	bcf	(__OS_Flags),0	;volatile
	line	162
	
l11618:	
;osa_pic16e_htpicc_pro.c: 162: {FSR0L = (OS_FSR_TYPE)_OS_CurTask; FSR0H = 0; asm(" dw 0x3100 +""1 + 1");};
	movf	(__OS_CurTask),w	;volatile
	movwf	(4)	;volatile
	
l11620:	
	clrf	(5)	;volatile
	
l11622:	
# 162 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
 dw 0x3100 +1 + 1 ;#
psect	text791
	line	163
	
l11624:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   movlb   0x1F         ;#
psect	text791
	
l11626:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x086F       ;#
psect	text791
	
l11628:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x001B       ;#
psect	text791
	
l11630:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x086E       ;#
psect	text791
	
l11632:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x001B       ;#
psect	text791
	
l11634:	
# 163 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   movlb   0x00         ;#
psect	text791
	line	165
	
l11636:	
;osa_pic16e_htpicc_pro.c: 165: ((near OST_TASK_STATE*)(&INDF0))->bReady = 0;
	movlb 0	; select bank0
	bcf	(0),3
	line	169
	
l11638:	
;osa_pic16e_htpicc_pro.c: 169: if (!((near OST_TASK_STATE*)(&INDF0))->bDelay) ((near OST_TASK_STATE*)(&INDF0))->bCanContinue = 0;
	btfsc	(0),4
	goto	u1261
	goto	u1260
u1261:
	goto	l7497
u1260:
	
l11640:	
	bcf	(0),5
	
l7497:	
	line	170
;osa_pic16e_htpicc_pro.c: 170: if (_OS_Temp & 0x01) ((near OST_TASK_STATE*)(&INDF0))->bCanContinue = 1;
	btfss	(__OS_Temp),(0)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l7499
u1270:
	
l11642:	
	bsf	(0),5
	line	173
	
l7499:	
	return
	opt stack 0
GLOBAL	__end_of__OS_ClrReadySetClrCanContinue
	__end_of__OS_ClrReadySetClrCanContinue:
;; =============== function __OS_ClrReadySetClrCanContinue ends ============

	signat	__OS_ClrReadySetClrCanContinue,88
	global	__OS_ReturnSave
psect	text792,local,class=CODE,delta=2
global __ptext792
__ptext792:

;; *************** function __OS_ReturnSave *****************
;; Defined at:
;;		line 76 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/1F
;;		Unchanged: FFE00/0
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
;;		_OS_Init
;; This function uses a non-reentrant model
;;
psect	text792
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	76
	global	__size_of__OS_ReturnSave
	__size_of__OS_ReturnSave	equ	__end_of__OS_ReturnSave-__OS_ReturnSave
	
__OS_ReturnSave:	
	opt	stack 12
; Regs used in __OS_ReturnSave: [wreg+status,2+status,0]
	line	78
	
l11592:	
;osa_pic16e_htpicc_pro.c: 78: {FSR0L = (OS_FSR_TYPE)_OS_CurTask; FSR0H = 0; asm(" dw 0x3100 +""1 + 1");};
	movf	(__OS_CurTask),w	;volatile
	movwf	(4)	;volatile
	
l11594:	
	clrf	(5)	;volatile
	
l11596:	
# 78 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
 dw 0x3100 +1 + 1 ;#
psect	text792
	line	79
	
l11598:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   movlb   0x1F         ;#
psect	text792
	
l11600:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x086F       ;#
psect	text792
	
l11602:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x001B       ;#
psect	text792
	
l11604:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x086E       ;#
psect	text792
	
l11606:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x001B       ;#
psect	text792
	
l11608:	
# 79 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   movlb   0x00         ;#
psect	text792
	line	80
	
l11610:	
;osa_pic16e_htpicc_pro.c: 80: ((near OST_TASK_STATE*)(&INDF0))->bReady = 1;
	movlb 0	; select bank0
	bsf	(0),3
	line	81
	
l11612:	
;osa_pic16e_htpicc_pro.c: 81: STKPTR--;;
	movlb 31	; select bank31
	decf	(4077)^0F80h,f	;volatile
	line	82
	
l7488:	
	return
	opt stack 0
GLOBAL	__end_of__OS_ReturnSave
	__end_of__OS_ReturnSave:
;; =============== function __OS_ReturnSave ends ============

	signat	__OS_ReturnSave,88
	global	_calculateCRC8
psect	text793,local,class=CODE,delta=2
global __ptext793
__ptext793:

;; *************** function _calculateCRC8 *****************
;; Defined at:
;;		line 78 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
;; Parameters:    Size  Location     Type
;;  inData          1    wreg     PTR unsigned char 
;;		 -> gstSLIPSend(43), gstSLIPRecv(22), 
;;  dataLen         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  inData          1    1[BANK0 ] PTR unsigned char 
;;		 -> gstSLIPSend(43), gstSLIPRecv(22), 
;;  crc             1    4[BANK0 ] unsigned char 
;;  i               1    3[BANK0 ] unsigned char 
;;  j               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       1       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendDEV
;;		_sendPHASE
;;		_sendTemper
;;		_sendVER
;;		_processing_slipcmd
;; This function uses a non-reentrant model
;;
psect	text793
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
	line	78
	global	__size_of_calculateCRC8
	__size_of_calculateCRC8	equ	__end_of_calculateCRC8-_calculateCRC8
	
_calculateCRC8:	
	opt	stack 9
; Regs used in _calculateCRC8: [wreg+fsr1l-status,0]
;calculateCRC8@inData stored from wreg
	movwf	(calculateCRC8@inData)
	line	79
	
l11564:	
;util.c: 79: uchar i,j,crc=0;
	clrf	(calculateCRC8@crc)
	line	81
;util.c: 81: for(j=0;j<dataLen;j++)
	clrf	(calculateCRC8@j)
	goto	l11586
	line	83
	
l11566:	
;util.c: 82: {
;util.c: 83: crc ^= *inData++;
	movf	(calculateCRC8@inData),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorwf	(calculateCRC8@crc),f
	
l11568:	
	incf	(calculateCRC8@inData),f
	line	84
	
l11570:	
;util.c: 84: for ( i = 0; i < 8; i++ )
	clrf	(calculateCRC8@i)
	line	85
	
l6028:	
	line	86
;util.c: 85: {
;util.c: 86: if (( crc & 0x80 ) != 0 )
	btfss	(calculateCRC8@crc),(7)&7
	goto	u1231
	goto	u1230
u1231:
	goto	l6030
u1230:
	line	88
	
l11576:	
;util.c: 87: {
;util.c: 88: crc <<= 1;
	lslf	(calculateCRC8@crc),f
	line	89
	
l11578:	
;util.c: 89: crc ^= 0x07;
	movlw	(07h)
	xorwf	(calculateCRC8@crc),f
	line	90
;util.c: 90: }
	goto	l11580
	line	91
	
l6030:	
	line	93
;util.c: 91: else
;util.c: 92: {
;util.c: 93: crc <<= 1;
	lslf	(calculateCRC8@crc),f
	line	84
	
l11580:	
	incf	(calculateCRC8@i),f
	
l11582:	
	movlw	(08h)
	subwf	(calculateCRC8@i),w
	skipc
	goto	u1241
	goto	u1240
u1241:
	goto	l6028
u1240:
	line	81
	
l11584:	
	incf	(calculateCRC8@j),f
	
l11586:	
	movf	(calculateCRC8@dataLen),w
	subwf	(calculateCRC8@j),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l11566
u1250:
	line	97
	
l11588:	
;util.c: 94: }
;util.c: 95: }
;util.c: 96: }
;util.c: 97: return crc;
	movf	(calculateCRC8@crc),w
	line	98
	
l6033:	
	return
	opt stack 0
GLOBAL	__end_of_calculateCRC8
	__end_of_calculateCRC8:
;; =============== function _calculateCRC8 ends ============

	signat	_calculateCRC8,8313
	global	__OS_JumpToTask
psect	text794,local,class=CODE,delta=2
global __ptext794
__ptext794:

;; *************** function __OS_JumpToTask *****************
;; Defined at:
;;		line 51 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
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
;;		_OS_Init
;; This function uses a non-reentrant model
;;
psect	text794
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	51
	global	__size_of__OS_JumpToTask
	__size_of__OS_JumpToTask	equ	__end_of__OS_JumpToTask-__OS_JumpToTask
	
__OS_JumpToTask:	
	opt	stack 13
; Regs used in __OS_JumpToTask: [wreg+status,2]
	line	53
	
l11550:	
;osa_pic16e_htpicc_pro.c: 53: {FSR0L = (OS_FSR_TYPE)_OS_CurTask; FSR0H = 0; asm(" dw 0x3100 +""1 + 1");};
	movlb 0	; select bank0
	movf	(__OS_CurTask),w	;volatile
	movwf	(4)	;volatile
	
l11552:	
	clrf	(5)	;volatile
	
l11554:	
# 53 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
 dw 0x3100 +1 + 1 ;#
psect	text794
	line	54
	
l11556:	
# 54 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x0013       ;#
psect	text794
	
l11558:	
# 54 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x008A       ;#
psect	text794
	
l11560:	
# 54 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x0013       ;#
psect	text794
	
l11562:	
# 54 "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
   dw      0x0082       ;#
psect	text794
	line	55
	
l7485:	
	return
	opt stack 0
GLOBAL	__end_of__OS_JumpToTask
	__end_of__OS_JumpToTask:
;; =============== function __OS_JumpToTask ends ============

	signat	__OS_JumpToTask,88
	global	__OS_Task_Create
psect	text795,local,class=CODE,delta=2
global __ptext795
__ptext795:

;; *************** function __OS_Task_Create *****************
;; Defined at:
;;		line 76 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\kernel\system\osa_tasks.c"
;; Parameters:    Size  Location     Type
;;  priority        1    wreg     unsigned char 
;;  TaskAddr        2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  priority        1    2[BANK0 ] unsigned char 
;;  Task            1    3[BANK0 ] PTR struct .
;;		 -> _OS_Tasks(12), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text795
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\kernel\system\osa_tasks.c"
	line	76
	global	__size_of__OS_Task_Create
	__size_of__OS_Task_Create	equ	__end_of__OS_Task_Create-__OS_Task_Create
	
__OS_Task_Create:	
	opt	stack 13
; Regs used in __OS_Task_Create: [wreg+fsr1l-status,0]
;__OS_Task_Create@priority stored from wreg
	line	79
	movwf	(__OS_Task_Create@priority)
	
l11528:	
;osa_tasks.c: 77: OST_TASK_POINTER Task;
;osa_tasks.c: 79: _OS_Flags.bError = 0;
	bcf	(__OS_Flags),1	;volatile
	line	88
	
l11530:	
;osa_tasks.c: 88: Task = (OST_TASK_POINTER)_OS_Tasks;
	movlw	(__OS_Tasks)&0ffh
	movwf	(__OS_Task_Create@Task)
	line	89
	
l11532:	
;osa_tasks.c: 89: _OS_Temp = 0;
	clrf	(__OS_Temp)
	line	93
	
l11534:	
;osa_tasks.c: 93: if (!Task->State.bEnable)
	movf	(__OS_Task_Create@Task),w
	movwf	fsr1l
	clrf fsr1h	
	
	btfsc	indf1,6
	goto	u1211
	goto	u1210
u1211:
	goto	l11548
u1210:
	line	95
	
l11536:	
;osa_tasks.c: 94: {
;osa_tasks.c: 95: ((OST_TASK_STATE*)&priority)->bEnable = 1;
	bsf	(__OS_Task_Create@priority),6
	line	96
;osa_tasks.c: 96: ((OST_TASK_STATE*)&priority)->bReady = 1;
	bsf	(__OS_Task_Create@priority),3
	line	98
	
l11538:	
;osa_tasks.c: 98: Task->pTaskPointer = TaskAddr;
	movf	(__OS_Task_Create@Task),w
	addlw	01h
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(__OS_Task_Create@TaskAddr),w
	movwi	[0]fsr1
	movf	(__OS_Task_Create@TaskAddr+1),w
	movwi	[1]fsr1
	line	101
	
l11540:	
;osa_tasks.c: 101: Task->Timer = 0;
	movf	(__OS_Task_Create@Task),w
	addlw	03h
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	line	108
	
l11542:	
;osa_tasks.c: 108: *(( char*)&Task->State) = priority;
	movf	(__OS_Task_Create@Task),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(__OS_Task_Create@priority),w
	movwf	indf1
	line	126
	
l11544:	
;osa_tasks.c: 126: _OS_Flags.bError = 0;
	bcf	(__OS_Flags),1	;volatile
	goto	l7524
	line	132
	
l11548:	
;osa_tasks.c: 130: }
;osa_tasks.c: 132: Task ++;
	movlw	(04h)
	addwf	(__OS_Task_Create@Task),f
	line	134
;osa_tasks.c: 134: } while (++_OS_Temp < 3);
	movlw	(03h)
	incf	(__OS_Temp),f
	subwf	((__OS_Temp)),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l11534
u1220:
	
l7525:	
	line	137
;osa_tasks.c: 137: _OS_Flags.bError = 1;
	bsf	(__OS_Flags),1	;volatile
	line	140
;osa_tasks.c: 139: return ;
	
l7524:	
	return
	opt stack 0
GLOBAL	__end_of__OS_Task_Create
	__end_of__OS_Task_Create:
;; =============== function __OS_Task_Create ends ============

	signat	__OS_Task_Create,8312
	global	_get_address
psect	text796,local,class=CODE,delta=2
global __ptext796
__ptext796:

;; *************** function _get_address *****************
;; Defined at:
;;		line 14 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
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
psect	text796
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
	line	14
	global	__size_of_get_address
	__size_of_get_address	equ	__end_of_get_address-_get_address
	
_get_address:	
	opt	stack 13
; Regs used in _get_address: [wreg]
	line	15
	
l11524:	
;util.c: 15: return 0x0f;
	movlw	(0Fh)
	line	25
	
l6000:	
	return
	opt stack 0
GLOBAL	__end_of_get_address
	__end_of_get_address:
;; =============== function _get_address ends ============

	signat	_get_address,89
	global	__OS_CheckEvent
psect	text797,local,class=CODE,delta=2
global __ptext797
__ptext797:

;; *************** function __OS_CheckEvent *****************
;; Defined at:
;;		line 380 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
;; Parameters:    Size  Location     Type
;;  bEvent          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bEvent          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_thread_Sample
;;		_thread_slip
;;		_thread_abnormal
;;		_OS_Init
;; This function uses a non-reentrant model
;;
psect	text797
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\port\pic16\osa_pic16e_htpicc_pro.c"
	line	380
	global	__size_of__OS_CheckEvent
	__size_of__OS_CheckEvent	equ	__end_of__OS_CheckEvent-__OS_CheckEvent
	
__OS_CheckEvent:	
	opt	stack 12
; Regs used in __OS_CheckEvent: [wreg+status,2+status,0]
;__OS_CheckEvent@bEvent stored from wreg
	line	385
	movlb 0	; select bank0
	movwf	(__OS_CheckEvent@bEvent)
	
l11508:	
;osa_pic16e_htpicc_pro.c: 385: _OS_Flags.bTimeout = 0;
	bcf	(__OS_Flags),5	;volatile
	line	386
	
l11510:	
;osa_pic16e_htpicc_pro.c: 386: FSR0L = (OS_FSR_TYPE)_OS_CurTask; FSR0H = 0;;
	movf	(__OS_CurTask),w	;volatile
	movwf	(4)	;volatile
	
l11512:	
	clrf	(5)	;volatile
	line	388
	
l11514:	
;osa_pic16e_htpicc_pro.c: 388: if (bEvent)
	movf	(__OS_CheckEvent@bEvent),w
	skipz
	goto	u1180
	goto	l7505
u1180:
	line	392
	
l11516:	
;osa_pic16e_htpicc_pro.c: 389: {
;osa_pic16e_htpicc_pro.c: 392: ((near OST_TASK_STATE*)(&INDF0))->bDelay = 0;
	bcf	(0),4
	line	395
;osa_pic16e_htpicc_pro.c: 395: return;
	goto	l7506
	line	397
	
l7505:	
	line	401
;osa_pic16e_htpicc_pro.c: 397: }
;osa_pic16e_htpicc_pro.c: 401: if ((!((near OST_TASK_STATE*)(&INDF0))->bDelay) && ((near OST_TASK_STATE*)(&INDF0))->bCanContinue)
	btfsc	(0),4
	goto	u1191
	goto	u1190
u1191:
	goto	l11522
u1190:
	
l11518:	
	btfss	(0),5
	goto	u1201
	goto	u1200
u1201:
	goto	l11522
u1200:
	line	403
	
l11520:	
;osa_pic16e_htpicc_pro.c: 402: {
;osa_pic16e_htpicc_pro.c: 403: _OS_Flags.bTimeout = 1;
	bsf	(__OS_Flags),5	;volatile
	line	404
;osa_pic16e_htpicc_pro.c: 404: return;
	goto	l7506
	line	409
	
l11522:	
;osa_pic16e_htpicc_pro.c: 405: }
;osa_pic16e_htpicc_pro.c: 409: STKPTR--;;
	movlb 31	; select bank31
	decf	(4077)^0F80h,f	;volatile
	line	462
	
l7506:	
	return
	opt stack 0
GLOBAL	__end_of__OS_CheckEvent
	__end_of__OS_CheckEvent:
;; =============== function __OS_CheckEvent ends ============

	signat	__OS_CheckEvent,4216
	global	_SPI_Init
psect	text798,local,class=CODE,delta=2
global __ptext798
__ptext798:

;; *************** function _SPI_Init *****************
;; Defined at:
;;		line 128 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
psect	text798
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	128
	global	__size_of_SPI_Init
	__size_of_SPI_Init	equ	__end_of_SPI_Init-_SPI_Init
	
_SPI_Init:	
	opt	stack 13
; Regs used in _SPI_Init: [wreg]
	line	130
	
l11410:	
;main.c: 130: SSP1CON1bits.SSPEN=0;
	movlb 4	; select bank4
	bcf	(533)^0200h,5	;volatile
	line	132
;main.c: 132: SSP1CON1bits.SSPM0 = 0;
	bcf	(533)^0200h,0	;volatile
	line	133
;main.c: 133: SSP1CON1bits.SSPM1 = 1;
	bsf	(533)^0200h,1	;volatile
	line	134
;main.c: 134: SSP1CON1bits.SSPM2 = 0;
	bcf	(533)^0200h,2	;volatile
	line	135
;main.c: 135: SSP1CON1bits.SSPM3 = 1;
	bsf	(533)^0200h,3	;volatile
	line	136
	
l11412:	
;main.c: 136: SSP1ADD = 3;
	movlw	(03h)
	movwf	(530)^0200h	;volatile
	line	138
	
l11414:	
;main.c: 138: SSP2STATbits.SMP=1;
	bsf	(540)^0200h,7	;volatile
	line	140
	
l11416:	
;main.c: 140: SSP2STATbits.CKE=1;
	bsf	(540)^0200h,6	;volatile
	line	141
	
l11418:	
;main.c: 141: SSP2CON1bits.CKP = 0;
	bcf	(541)^0200h,4	;volatile
	line	142
	
l11420:	
;main.c: 142: SSP1CON1bits.SSPEN=1;
	bsf	(533)^0200h,5	;volatile
	line	144
	
l11422:	
;main.c: 144: RB3=1;
	movlb 0	; select bank0
	bsf	(107/8),(107)&7
	line	145
	
l11424:	
;main.c: 145: RB0=1;
	bsf	(104/8),(104)&7
	line	146
	
l2972:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Init
	__end_of_SPI_Init:
;; =============== function _SPI_Init ends ============

	signat	_SPI_Init,88
	global	_vmemset
psect	text799,local,class=CODE,delta=2
global __ptext799
__ptext799:

;; *************** function _vmemset *****************
;; Defined at:
;;		line 30 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;  p1              2    0[BANK0 ] PTR void 
;;		 -> ADE7758Data(98), 
;;  c               2    2[BANK0 ] int 
;;  n               2    4[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  p               2    7[BANK0 ] PTR unsigned char 
;;		 -> ADE7758Data(98), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       6       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       1       0       0       0       0
;;      Totals:         0       9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Initialize
;; This function uses a non-reentrant model
;;
psect	text799
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	30
	global	__size_of_vmemset
	__size_of_vmemset	equ	__end_of_vmemset-_vmemset
	
_vmemset:	
	opt	stack 12
; Regs used in _vmemset: [wreg+fsr1l-status,0]
	line	33
	
l11402:	
;main.c: 31: char *p;
;main.c: 33: p = p1;
	movf	(vmemset@p1+1),w
	movwf	(vmemset@p+1)
	movf	(vmemset@p1),w
	movwf	(vmemset@p)
	line	34
;main.c: 34: while(n--)
	goto	l11408
	line	35
	
l11404:	
;main.c: 35: *p++ = c;
	movf	(vmemset@c),w
	movwf	(??_vmemset+0)+0
	movf	(vmemset@p),w
	movwf	fsr1l
	movf	(vmemset@p+1),w
	movwf	fsr1h
	movf	(??_vmemset+0)+0,w
	movwf	indf1
	
l11406:	
	incf	(vmemset@p),f
	skipnz
	incf	(vmemset@p+1),f
	line	34
	
l11408:	
	movlw	-1
	addwf	(vmemset@n),f
	skipc
	decf	(vmemset@n+1),f
	incf	((vmemset@n)),w
	skipnz
	incf	((vmemset@n+1)),w

	skipz
	goto	u941
	goto	u940
u941:
	goto	l11404
u940:
	line	37
	
l2963:	
	return
	opt stack 0
GLOBAL	__end_of_vmemset
	__end_of_vmemset:
;; =============== function _vmemset ends ============

	signat	_vmemset,12408
	global	_spiSendByte
psect	text800,local,class=CODE,delta=2
global __ptext800
__ptext800:

;; *************** function _spiSendByte *****************
;; Defined at:
;;		line 28 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
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
psect	text800
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
	line	28
	global	__size_of_spiSendByte
	__size_of_spiSendByte	equ	__end_of_spiSendByte-_spiSendByte
	
_spiSendByte:	
	opt	stack 10
; Regs used in _spiSendByte: [wreg+status,2+status,0]
;spiSendByte@spi_data stored from wreg
	movwf	(spiSendByte@spi_data)
	line	29
	
l11384:	
	line	30
	
l11386:	
;util.c: 30: ulong cc = 0;
	clrf	(spiSendByte@cc)
	clrf	(spiSendByte@cc+1)
	clrf	(spiSendByte@cc+2)
	clrf	(spiSendByte@cc+3)
	line	31
	
l11388:	
;util.c: 31: SSPBUF=spi_data;
	movf	(spiSendByte@spi_data),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	32
;util.c: 32: while((!SSP1IF)&&(cc < 0x0fffffff))
	goto	l11392
	line	34
	
l11390:	
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
	
l11392:	
	movlb 0	; select bank0
	btfsc	(139/8),(139)&7
	goto	u921
	goto	u920
u921:
	goto	l11396
u920:
	
l11394:	
	movlw	0Fh
	subwf	(spiSendByte@cc+3),w
	skipz
	goto	u935
	movlw	0FFh
	subwf	(spiSendByte@cc+2),w
	skipz
	goto	u935
	movlw	0FFh
	subwf	(spiSendByte@cc+1),w
	skipz
	goto	u935
	movlw	0FFh
	subwf	(spiSendByte@cc),w
u935:
	skipc
	goto	u931
	goto	u930
u931:
	goto	l11390
u930:
	line	36
	
l11396:	
;util.c: 35: }
;util.c: 36: spi_tmp = SSPBUF;
	movlb 4	; select bank4
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(spiSendByte@spi_tmp)
	line	37
	
l11398:	
;util.c: 37: SSP1IF = 0;
	bcf	(139/8),(139)&7
	line	38
;util.c: 38: return spi_tmp;
	movf	(spiSendByte@spi_tmp),w
	line	39
	
l6008:	
	return
	opt stack 0
GLOBAL	__end_of_spiSendByte
	__end_of_spiSendByte:
;; =============== function _spiSendByte ends ============

	signat	_spiSendByte,4217
	global	_Delay
psect	text801,local,class=CODE,delta=2
global __ptext801
__ptext801:

;; *************** function _Delay *****************
;; Defined at:
;;		line 4 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
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
psect	text801
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\util.c"
	line	4
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 10
; Regs used in _Delay: [wreg+status,2+status,0]
	line	6
	
l11378:	
;util.c: 5: ulong delay_count;
;util.c: 6: for( delay_count = 0 ; delay_count < delay_count_max ; delay_count ++ )
	clrf	(Delay@delay_count)
	clrf	(Delay@delay_count+1)
	clrf	(Delay@delay_count+2)
	clrf	(Delay@delay_count+3)
	goto	l11382
	
l11380:	
;util.c: 7: {
;util.c: 8: ;
	incf	(Delay@delay_count),f
	skipnz
	incf	(Delay@delay_count+1),f
	skipnz
	incf	(Delay@delay_count+2),f
	skipnz
	incf	(Delay@delay_count+3),f
	
l11382:	
	movf	(Delay@delay_count_max+3),w
	subwf	(Delay@delay_count+3),w
	skipz
	goto	u915
	movf	(Delay@delay_count_max+2),w
	subwf	(Delay@delay_count+2),w
	skipz
	goto	u915
	movf	(Delay@delay_count_max+1),w
	subwf	(Delay@delay_count+1),w
	skipz
	goto	u915
	movf	(Delay@delay_count_max),w
	subwf	(Delay@delay_count),w
u915:
	skipc
	goto	u911
	goto	u910
u911:
	goto	l11380
u910:
	line	11
	
l5997:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_isr
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _isr *****************
;; Defined at:
;;		line 149 in file "E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  data            1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1E/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"E:\svn\PDU_FW\PowerSupply\PowerSupply_OSA\myapp\src\main.c"
	line	149
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 5
; Regs used in _isr: [wreg+fsr1l-status,0+pclath+cstack]
psect	intentry
	pagesel	$
	line	164
	
i1l11426:	
;main.c: 151: ;
;main.c: 164: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u95_21
	goto	u95_20
u95_21:
	goto	i1l11446
u95_20:
	line	166
	
i1l11428:	
;main.c: 165: {
;main.c: 166: TMR0 = 61;
	movlw	(03Dh)
	movlb 0	; select bank0
	movwf	(21)	;volatile
	line	167
	
i1l11430:	
;main.c: 167: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	168
	
i1l11432:	
;main.c: 168: gs50msCnt++;
	incf	(_gs50msCnt),f
	skipnz
	incf	(_gs50msCnt+1),f
	line	169
	
i1l11434:	
;main.c: 169: if (gs50msCnt%8 == 0)
	movf	(_gs50msCnt),w
	andlw	07h
	btfss	status,2
	goto	u96_21
	goto	u96_20
u96_21:
	goto	i1l11438
u96_20:
	line	171
	
i1l11436:	
;main.c: 170: {
;main.c: 171: Sample_flag = 1;
	bsf	(_Sample_flag/8),(_Sample_flag)&7
	line	173
	
i1l11438:	
;main.c: 172: }
;main.c: 173: if (gs50msCnt%3600 == 0)
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
	goto	u97_21
	goto	u97_20
u97_21:
	goto	i1l11442
u97_20:
	line	175
	
i1l11440:	
;main.c: 174: {
;main.c: 175: AbnorProcFlag = 1;
	bsf	(_AbnorProcFlag/8),(_AbnorProcFlag)&7
	line	178
	
i1l11442:	
;main.c: 176: }
;main.c: 178: if (gs50msCnt >= 3600)
	movlw	high(0E10h)
	subwf	(_gs50msCnt+1),w
	movlw	low(0E10h)
	skipnz
	subwf	(_gs50msCnt),w
	skipc
	goto	u98_21
	goto	u98_20
u98_21:
	goto	i1l11446
u98_20:
	line	180
	
i1l11444:	
;main.c: 179: {
;main.c: 180: gs50msCnt = 0;
	clrf	(_gs50msCnt)
	clrf	(_gs50msCnt+1)
	line	184
	
i1l11446:	
;main.c: 181: }
;main.c: 182: }
;main.c: 184: if ( OERR || FERR )
	movlb 3	; select bank3
	btfsc	(3305/8)^0180h,(3305)&7
	goto	u99_21
	goto	u99_20
u99_21:
	goto	i1l2981
u99_20:
	
i1l11448:	
	btfss	(3306/8)^0180h,(3306)&7
	goto	u100_21
	goto	u100_20
u100_21:
	goto	i1l2979
u100_20:
	
i1l2981:	
	line	186
;main.c: 185: {
;main.c: 186: CREN = 0 ;
	bcf	(3308/8)^0180h,(3308)&7
	line	187
;main.c: 187: CREN = 1;
	bsf	(3308/8)^0180h,(3308)&7
	line	188
	
i1l2979:	
	line	190
;main.c: 188: }
;main.c: 190: if( RCIF )
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l11480
u101_20:
	line	192
	
i1l11450:	
;main.c: 191: {
;main.c: 192: RCIF = 0;
	bcf	(141/8),(141)&7
	line	193
	
i1l11452:	
;main.c: 193: uchar data = RCREG;
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	movwf	(isr@data)
	line	195
;main.c: 195: if (gstSLIPRecv.ucRecingState != SLIP_DONE)
	movlb 1	; select bank1
	movf	0+(_gstSLIPRecv)^080h+01h,w
	xorlw	02h&0ffh
	skipnz
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l11480
u102_20:
	line	198
	
i1l11454:	
;main.c: 196: {
;main.c: 197: if (((data == 0xC0) && (gstSLIPRecv.ucRecingState == SLIP_IDLE)) ||
;main.c: 198: ((data == 0xC0) && (gstSLIPRecv.ucRecingState == SLIP_PROCESS) && (gstSLIPRecv.ucRecdCnt < 4)))
	movf	(isr@data),w
	xorlw	0C0h&0ffh
	skipz
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l11458
u103_20:
	
i1l11456:	
	movf	0+(_gstSLIPRecv)^080h+01h,w
	skipz
	goto	u104_20
	goto	i1l2986
u104_20:
	
i1l11458:	
	movf	(isr@data),w
	xorlw	0C0h&0ffh
	skipz
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l11466
u105_20:
	
i1l11460:	
	decf	0+(_gstSLIPRecv)^080h+01h,w
	skipz
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l11466
u106_20:
	
i1l11462:	
	movlw	(04h)
	subwf	(_gstSLIPRecv)^080h,w
	skipnc
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l11466
u107_20:
	
i1l2986:	
	line	200
;main.c: 199: {
;main.c: 200: gstSLIPRecv.ucRecingState = SLIP_PROCESS;
	clrf	0+(_gstSLIPRecv)^080h+01h
	incf	0+(_gstSLIPRecv)^080h+01h,f
	line	201
	
i1l11464:	
;main.c: 201: gstSLIPRecv.ucRecdCnt = 0;
	clrf	(_gstSLIPRecv)^080h
	line	202
;main.c: 202: }
	goto	i1l11474
	line	203
	
i1l11466:	
;main.c: 203: else if ((data == 0xC0) && (gstSLIPRecv.ucRecingState == SLIP_PROCESS) && (gstSLIPRecv.ucRecdCnt >= 4))
	movf	(isr@data),w
	xorlw	0C0h&0ffh
	skipz
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l11474
u108_20:
	
i1l11468:	
	decf	0+(_gstSLIPRecv)^080h+01h,w
	skipz
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l11474
u109_20:
	
i1l11470:	
	movlw	(04h)
	subwf	(_gstSLIPRecv)^080h,w
	skipc
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l11474
u110_20:
	line	205
	
i1l11472:	
;main.c: 204: {
;main.c: 205: gstSLIPRecv.ucRecingState = SLIP_DONE;
	movlw	(02h)
	movwf	0+(_gstSLIPRecv)^080h+01h
	line	207
	
i1l11474:	
;main.c: 206: }
;main.c: 207: gstSLIPRecv.ucData[gstSLIPRecv.ucRecdCnt] = data;
	movf	(_gstSLIPRecv)^080h,w
	addlw	_gstSLIPRecv+02h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(isr@data),w
	movwf	indf1
	line	209
	
i1l11476:	
;main.c: 209: if (gstSLIPRecv.ucRecdCnt < 20 -1) gstSLIPRecv.ucRecdCnt++;
	movlw	(013h)
	subwf	(_gstSLIPRecv)^080h,w
	skipnc
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l11480
u111_20:
	
i1l11478:	
	incf	(_gstSLIPRecv)^080h,f
	line	213
	
i1l11480:	
;main.c: 210: }
;main.c: 211: }
;main.c: 213: if(TXIF)
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l2999
u112_20:
	line	215
	
i1l11482:	
;main.c: 214: {
;main.c: 215: TXIF = 0;
	bcf	(140/8),(140)&7
	line	216
	
i1l11484:	
;main.c: 216: if (gstSLIPSend.ucSentCnt < gstSLIPSend.ucSendTolCnt)
	movlb 1	; select bank1
	movf	0+(_gstSLIPSend)^080h+01h,w
	subwf	(_gstSLIPSend)^080h,w
	skipnc
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l2993
u113_20:
	line	220
	
i1l11486:	
;main.c: 217: {
;main.c: 218: if (gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] == 0xC0
;main.c: 219: && gstSLIPSend.ucSentCnt != 0
;main.c: 220: && gstSLIPSend.ucSentCnt != gstSLIPSend.ucSendTolCnt - 1)
	movf	(_gstSLIPSend)^080h,w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0C0h&0ffh
	skipz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l11496
u114_20:
	
i1l11488:	
	movf	(_gstSLIPSend)^080h,w
	skipz
	goto	u115_20
	goto	i1l11496
u115_20:
	
i1l11490:	
	movf	0+(_gstSLIPSend)^080h+01h,w
	addlw	low(-1)
	movwf	(??_isr+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_isr+0)+0)+1
	movf	(_gstSLIPSend)^080h,w
	xorwf	0+(??_isr+0)+0,w
	iorwf	1+(??_isr+0)+0,w
	skipnz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l11496
u116_20:
	line	222
	
i1l11492:	
;main.c: 221: {
;main.c: 222: TXREG = 0xDB;
	movlw	(0DBh)
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	223
	
i1l11494:	
;main.c: 223: gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] = 0xDC;
	movlb 1	; select bank1
	movf	(_gstSLIPSend)^080h,w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0DCh)
	movwf	indf1
	line	224
;main.c: 224: }
	goto	i1l2999
	line	225
	
i1l11496:	
;main.c: 225: else if(gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] == 0xDB)
	movf	(_gstSLIPSend)^080h,w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0DBh&0ffh
	skipz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l11502
u117_20:
	line	227
	
i1l11498:	
;main.c: 226: {
;main.c: 227: TXREG = 0xDB;
	movlw	(0DBh)
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	228
	
i1l11500:	
;main.c: 228: gstSLIPSend.ucData[gstSLIPSend.ucSentCnt] = 0xDD;
	movlb 1	; select bank1
	movf	(_gstSLIPSend)^080h,w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0DDh)
	movwf	indf1
	line	229
;main.c: 229: }
	goto	i1l2999
	line	232
	
i1l11502:	
;main.c: 230: else
;main.c: 231: {
;main.c: 232: TXREG = gstSLIPSend.ucData[gstSLIPSend.ucSentCnt++];
	movf	(_gstSLIPSend)^080h,w
	addlw	_gstSLIPSend+03h&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	
i1l11504:	
	movlb 1	; select bank1
	incf	(_gstSLIPSend)^080h,f
	goto	i1l2999
	line	235
	
i1l2993:	
	line	237
;main.c: 235: else
;main.c: 236: {
;main.c: 237: TXIE = 0;
	bcf	(1164/8)^080h,(1164)&7
	line	238
	
i1l11506:	
;main.c: 238: gstSLIPSend.ucSendingState = SLIP_DONE;
	movlw	(02h)
	movwf	0+(_gstSLIPSend)^080h+02h
	line	244
	
i1l2999:	
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	___lwmod
psect	text803,local,class=CODE,delta=2
global __ptext803
__ptext803:

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
psect	text803
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11676:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l11692
u132_20:
	line	9
	
i1l11678:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	i1l11682
	line	11
	
i1l11680:	
	lslf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
i1l11682:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l11680
u133_20:
	line	15
	
i1l11684:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u134_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u134_25:
	skipc
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l11688
u134_20:
	line	16
	
i1l11686:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	subwfb	(___lwmod@dividend+1),f
	line	17
	
i1l11688:	
	lsrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
i1l11690:	
	decfsz	(___lwmod@counter),f
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l11684
u135_20:
	line	20
	
i1l11692:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
i1l8873:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	fptotal
fptotal equ 6
	file ""
	line	#
psect	functab,class=CODE,delta=2,reloc=256
global __pfunctab
__pfunctab:
	global	fptable
fptable:
	movlp high(fptable)
	addwf pc
	global	fpbase
fpbase:
	goto fpbase	; Call via a null pointer and you will get stuck here.
	file ""
	line	#
fp__thread_slip:
	ljmp	_thread_slip
	file ""
	line	#
fp__thread_Sample:
	ljmp	_thread_Sample
	file ""
	line	#
fp__thread_abnormal:
	ljmp	_thread_abnormal
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
global __pbssBIGRAM
__pbssBIGRAM	equ	8462
	end
