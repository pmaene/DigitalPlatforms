;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  6 2010) (UNIX)
; This file was generated Wed Dec  5 17:53:13 2012
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _terminate
	.globl _montgomery
	.globl _read_r
	.globl _write_montgomery
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _b
	.globl _a
	.globl _m
	.globl _shared_m
	.globl _shared_b
	.globl _shared_a
	.globl _r
	.globl _i
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_i::
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_r	=	0x0200
_shared_a	=	0x4000
_shared_b	=	0x4080
_shared_m	=	0x4100
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
	.org 0x0000
_m::
	.ds 128
	.org 0x0080
_a::
	.ds 128
	.org 0x0100
_b::
	.ds 128
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	main.c:13: volatile __xdata __at (0x0000) unsigned char m[SIZE] = {0x5D,0xEF,0x94,0x7C,0x83,0xBF,0x40,0x4D,0xAB,0xD7,0xDF,0xB2,0x4D,0x2B,0x07,0x59,0x1A,0x48,0xAE,0x45,0x17,0x2E,0x6A,0x65,0x01,0x54,0xF5,0xB7,0xDC,0x5D,0x8F,0x4C,0x33,0x84,0x70,0xBB,0x0B,0xA4,0xAC,0x87,0x82,0x1D,0x0D,0x50,0x2D,0x45,0xF9,0xF0,0x11,0x5B,0xC8,0xF9,0x18,0xFB,0xD3,0x6F,0xC3,0x74,0x02,0xAB,0x32,0x46,0x6B,0x52,0x9B,0x71,0xD9,0x21,0x73,0x3A,0xCC,0x6D,0xDB,0x10,0x89,0xCB,0x3B,0x47,0x13,0x0E,0x65,0x86,0x9E,0x7F,0x3E,0x43,0x92,0xFC,0xB6,0x6A,0x6B,0x37,0x90,0xEB,0x4F,0xE9,0xEB,0x9C,0x2F,0x6B,0x26,0xEF,0xB4,0xBB,0xFC,0x3D,0x33,0xFB,0x97,0x67,0x93,0x26,0x96,0x38,0xE5,0xF0,0x3A,0xC6,0xA3,0x95,0xA5,0x98,0xF4,0xB8,0x0B,0x88,0xE1,0xD4};
	mov	dptr,#_m
	mov	a,#0x5D
	movx	@dptr,a
	mov	dptr,#(_m + 0x0001)
	mov	a,#0xEF
	movx	@dptr,a
	mov	dptr,#(_m + 0x0002)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_m + 0x0003)
	mov	a,#0x7C
	movx	@dptr,a
	mov	dptr,#(_m + 0x0004)
	mov	a,#0x83
	movx	@dptr,a
	mov	dptr,#(_m + 0x0005)
	mov	a,#0xBF
	movx	@dptr,a
	mov	dptr,#(_m + 0x0006)
	mov	a,#0x40
	movx	@dptr,a
	mov	dptr,#(_m + 0x0007)
	mov	a,#0x4D
	movx	@dptr,a
	mov	dptr,#(_m + 0x0008)
	mov	a,#0xAB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0009)
	mov	a,#0xD7
	movx	@dptr,a
	mov	dptr,#(_m + 0x000a)
	mov	a,#0xDF
	movx	@dptr,a
	mov	dptr,#(_m + 0x000b)
	mov	a,#0xB2
	movx	@dptr,a
	mov	dptr,#(_m + 0x000c)
	mov	a,#0x4D
	movx	@dptr,a
	mov	dptr,#(_m + 0x000d)
	mov	a,#0x2B
	movx	@dptr,a
	mov	dptr,#(_m + 0x000e)
	mov	a,#0x07
	movx	@dptr,a
	mov	dptr,#(_m + 0x000f)
	mov	a,#0x59
	movx	@dptr,a
	mov	dptr,#(_m + 0x0010)
	mov	a,#0x1A
	movx	@dptr,a
	mov	dptr,#(_m + 0x0011)
	mov	a,#0x48
	movx	@dptr,a
	mov	dptr,#(_m + 0x0012)
	mov	a,#0xAE
	movx	@dptr,a
	mov	dptr,#(_m + 0x0013)
	mov	a,#0x45
	movx	@dptr,a
	mov	dptr,#(_m + 0x0014)
	mov	a,#0x17
	movx	@dptr,a
	mov	dptr,#(_m + 0x0015)
	mov	a,#0x2E
	movx	@dptr,a
	mov	dptr,#(_m + 0x0016)
	mov	a,#0x6A
	movx	@dptr,a
	mov	dptr,#(_m + 0x0017)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_m + 0x0018)
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#(_m + 0x0019)
	mov	a,#0x54
	movx	@dptr,a
	mov	dptr,#(_m + 0x001a)
	mov	a,#0xF5
	movx	@dptr,a
	mov	dptr,#(_m + 0x001b)
	mov	a,#0xB7
	movx	@dptr,a
	mov	dptr,#(_m + 0x001c)
	mov	a,#0xDC
	movx	@dptr,a
	mov	dptr,#(_m + 0x001d)
	mov	a,#0x5D
	movx	@dptr,a
	mov	dptr,#(_m + 0x001e)
	mov	a,#0x8F
	movx	@dptr,a
	mov	dptr,#(_m + 0x001f)
	mov	a,#0x4C
	movx	@dptr,a
	mov	dptr,#(_m + 0x0020)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_m + 0x0021)
	mov	a,#0x84
	movx	@dptr,a
	mov	dptr,#(_m + 0x0022)
	mov	a,#0x70
	movx	@dptr,a
	mov	dptr,#(_m + 0x0023)
	mov	a,#0xBB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0024)
	mov	a,#0x0B
	movx	@dptr,a
	mov	dptr,#(_m + 0x0025)
	mov	a,#0xA4
	movx	@dptr,a
	mov	dptr,#(_m + 0x0026)
	mov	a,#0xAC
	movx	@dptr,a
	mov	dptr,#(_m + 0x0027)
	mov	a,#0x87
	movx	@dptr,a
	mov	dptr,#(_m + 0x0028)
	mov	a,#0x82
	movx	@dptr,a
	mov	dptr,#(_m + 0x0029)
	mov	a,#0x1D
	movx	@dptr,a
	mov	dptr,#(_m + 0x002a)
	mov	a,#0x0D
	movx	@dptr,a
	mov	dptr,#(_m + 0x002b)
	mov	a,#0x50
	movx	@dptr,a
	mov	dptr,#(_m + 0x002c)
	mov	a,#0x2D
	movx	@dptr,a
	mov	dptr,#(_m + 0x002d)
	mov	a,#0x45
	movx	@dptr,a
	mov	dptr,#(_m + 0x002e)
	mov	a,#0xF9
	movx	@dptr,a
	mov	dptr,#(_m + 0x002f)
	mov	a,#0xF0
	movx	@dptr,a
	mov	dptr,#(_m + 0x0030)
	mov	a,#0x11
	movx	@dptr,a
	mov	dptr,#(_m + 0x0031)
	mov	a,#0x5B
	movx	@dptr,a
	mov	dptr,#(_m + 0x0032)
	mov	a,#0xC8
	movx	@dptr,a
	mov	dptr,#(_m + 0x0033)
	mov	a,#0xF9
	movx	@dptr,a
	mov	dptr,#(_m + 0x0034)
	mov	a,#0x18
	movx	@dptr,a
	mov	dptr,#(_m + 0x0035)
	mov	a,#0xFB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0036)
	mov	a,#0xD3
	movx	@dptr,a
	mov	dptr,#(_m + 0x0037)
	mov	a,#0x6F
	movx	@dptr,a
	mov	dptr,#(_m + 0x0038)
	mov	a,#0xC3
	movx	@dptr,a
	mov	dptr,#(_m + 0x0039)
	mov	a,#0x74
	movx	@dptr,a
	mov	dptr,#(_m + 0x003a)
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#(_m + 0x003b)
	mov	a,#0xAB
	movx	@dptr,a
	mov	dptr,#(_m + 0x003c)
	mov	a,#0x32
	movx	@dptr,a
	mov	dptr,#(_m + 0x003d)
	mov	a,#0x46
	movx	@dptr,a
	mov	dptr,#(_m + 0x003e)
	mov	a,#0x6B
	movx	@dptr,a
	mov	dptr,#(_m + 0x003f)
	mov	a,#0x52
	movx	@dptr,a
	mov	dptr,#(_m + 0x0040)
	mov	a,#0x9B
	movx	@dptr,a
	mov	dptr,#(_m + 0x0041)
	mov	a,#0x71
	movx	@dptr,a
	mov	dptr,#(_m + 0x0042)
	mov	a,#0xD9
	movx	@dptr,a
	mov	dptr,#(_m + 0x0043)
	mov	a,#0x21
	movx	@dptr,a
	mov	dptr,#(_m + 0x0044)
	mov	a,#0x73
	movx	@dptr,a
	mov	dptr,#(_m + 0x0045)
	mov	a,#0x3A
	movx	@dptr,a
	mov	dptr,#(_m + 0x0046)
	mov	a,#0xCC
	movx	@dptr,a
	mov	dptr,#(_m + 0x0047)
	mov	a,#0x6D
	movx	@dptr,a
	mov	dptr,#(_m + 0x0048)
	mov	a,#0xDB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0049)
	mov	a,#0x10
	movx	@dptr,a
	mov	dptr,#(_m + 0x004a)
	mov	a,#0x89
	movx	@dptr,a
	mov	dptr,#(_m + 0x004b)
	mov	a,#0xCB
	movx	@dptr,a
	mov	dptr,#(_m + 0x004c)
	mov	a,#0x3B
	movx	@dptr,a
	mov	dptr,#(_m + 0x004d)
	mov	a,#0x47
	movx	@dptr,a
	mov	dptr,#(_m + 0x004e)
	mov	a,#0x13
	movx	@dptr,a
	mov	dptr,#(_m + 0x004f)
	mov	a,#0x0E
	movx	@dptr,a
	mov	dptr,#(_m + 0x0050)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_m + 0x0051)
	mov	a,#0x86
	movx	@dptr,a
	mov	dptr,#(_m + 0x0052)
	mov	a,#0x9E
	movx	@dptr,a
	mov	dptr,#(_m + 0x0053)
	mov	a,#0x7F
	movx	@dptr,a
	mov	dptr,#(_m + 0x0054)
	mov	a,#0x3E
	movx	@dptr,a
	mov	dptr,#(_m + 0x0055)
	mov	a,#0x43
	movx	@dptr,a
	mov	dptr,#(_m + 0x0056)
	mov	a,#0x92
	movx	@dptr,a
	mov	dptr,#(_m + 0x0057)
	mov	a,#0xFC
	movx	@dptr,a
	mov	dptr,#(_m + 0x0058)
	mov	a,#0xB6
	movx	@dptr,a
	mov	dptr,#(_m + 0x0059)
	mov	a,#0x6A
	movx	@dptr,a
	mov	dptr,#(_m + 0x005a)
	mov	a,#0x6B
	movx	@dptr,a
	mov	dptr,#(_m + 0x005b)
	mov	a,#0x37
	movx	@dptr,a
	mov	dptr,#(_m + 0x005c)
	mov	a,#0x90
	movx	@dptr,a
	mov	dptr,#(_m + 0x005d)
	mov	a,#0xEB
	movx	@dptr,a
	mov	dptr,#(_m + 0x005e)
	mov	a,#0x4F
	movx	@dptr,a
	mov	dptr,#(_m + 0x005f)
	mov	a,#0xE9
	movx	@dptr,a
	mov	dptr,#(_m + 0x0060)
	mov	a,#0xEB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0061)
	mov	a,#0x9C
	movx	@dptr,a
	mov	dptr,#(_m + 0x0062)
	mov	a,#0x2F
	movx	@dptr,a
	mov	dptr,#(_m + 0x0063)
	mov	a,#0x6B
	movx	@dptr,a
	mov	dptr,#(_m + 0x0064)
	mov	a,#0x26
	movx	@dptr,a
	mov	dptr,#(_m + 0x0065)
	mov	a,#0xEF
	movx	@dptr,a
	mov	dptr,#(_m + 0x0066)
	mov	a,#0xB4
	movx	@dptr,a
	mov	dptr,#(_m + 0x0067)
	mov	a,#0xBB
	movx	@dptr,a
	mov	dptr,#(_m + 0x0068)
	mov	a,#0xFC
	movx	@dptr,a
	mov	dptr,#(_m + 0x0069)
	mov	a,#0x3D
	movx	@dptr,a
	mov	dptr,#(_m + 0x006a)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_m + 0x006b)
	mov	a,#0xFB
	movx	@dptr,a
	mov	dptr,#(_m + 0x006c)
	mov	a,#0x97
	movx	@dptr,a
	mov	dptr,#(_m + 0x006d)
	mov	a,#0x67
	movx	@dptr,a
	mov	dptr,#(_m + 0x006e)
	mov	a,#0x93
	movx	@dptr,a
	mov	dptr,#(_m + 0x006f)
	mov	a,#0x26
	movx	@dptr,a
	mov	dptr,#(_m + 0x0070)
	mov	a,#0x96
	movx	@dptr,a
	mov	dptr,#(_m + 0x0071)
	mov	a,#0x38
	movx	@dptr,a
	mov	dptr,#(_m + 0x0072)
	mov	a,#0xE5
	movx	@dptr,a
	mov	dptr,#(_m + 0x0073)
	mov	a,#0xF0
	movx	@dptr,a
	mov	dptr,#(_m + 0x0074)
	mov	a,#0x3A
	movx	@dptr,a
	mov	dptr,#(_m + 0x0075)
	mov	a,#0xC6
	movx	@dptr,a
	mov	dptr,#(_m + 0x0076)
	mov	a,#0xA3
	movx	@dptr,a
	mov	dptr,#(_m + 0x0077)
	mov	a,#0x95
	movx	@dptr,a
	mov	dptr,#(_m + 0x0078)
	mov	a,#0xA5
	movx	@dptr,a
	mov	dptr,#(_m + 0x0079)
	mov	a,#0x98
	movx	@dptr,a
	mov	dptr,#(_m + 0x007a)
	mov	a,#0xF4
	movx	@dptr,a
	mov	dptr,#(_m + 0x007b)
	mov	a,#0xB8
	movx	@dptr,a
	mov	dptr,#(_m + 0x007c)
	mov	a,#0x0B
	movx	@dptr,a
	mov	dptr,#(_m + 0x007d)
	mov	a,#0x88
	movx	@dptr,a
	mov	dptr,#(_m + 0x007e)
	mov	a,#0xE1
	movx	@dptr,a
	mov	dptr,#(_m + 0x007f)
	mov	a,#0xD4
	movx	@dptr,a
;	main.c:14: volatile __xdata __at (0x0080) unsigned char a[SIZE]   = {0xA3,0x10,0x6B,0x83,0x7C,0x40,0xBF,0xB2,0x54,0x28,0x20,0x4D,0xB2,0xD4,0xF8,0xA6,0xE5,0xB7,0x51,0xBA,0xE8,0xD1,0x95,0x9A,0xFE,0xAB,0x0A,0x48,0x23,0xA2,0x70,0xB3,0xCC,0x7B,0x8F,0x44,0xF4,0x5B,0x53,0x78,0x7D,0xE2,0xF2,0xAF,0xD2,0xBA,0x06,0x0F,0xEE,0xA4,0x37,0x06,0xE7,0x04,0x2C,0x90,0x3C,0x8B,0xFD,0x54,0xCD,0xB9,0x94,0xAD,0x64,0x8E,0x26,0xDE,0x8C,0xC5,0x33,0x92,0x24,0xEF,0x76,0x34,0xC4,0xB8,0xEC,0xF1,0x9A,0x79,0x61,0x80,0xC1,0xBC,0x6D,0x03,0x49,0x95,0x94,0xC8,0x6F,0x14,0xB0,0x16,0x14,0x63,0xD0,0x94,0xD9,0x10,0x4B,0x44,0x03,0xC2,0xCC,0x04,0x68,0x98,0x6C,0xD9,0x69,0xC7,0x1A,0x0F,0xC5,0x39,0x5C,0x6A,0x5A,0x67,0x0B,0x47,0xF4,0x77,0x1E,0x2B};
	mov	dptr,#_a
	mov	a,#0xA3
	movx	@dptr,a
	mov	dptr,#(_a + 0x0001)
	mov	a,#0x10
	movx	@dptr,a
	mov	dptr,#(_a + 0x0002)
	mov	a,#0x6B
	movx	@dptr,a
	mov	dptr,#(_a + 0x0003)
	mov	a,#0x83
	movx	@dptr,a
	mov	dptr,#(_a + 0x0004)
	mov	a,#0x7C
	movx	@dptr,a
	mov	dptr,#(_a + 0x0005)
	mov	a,#0x40
	movx	@dptr,a
	mov	dptr,#(_a + 0x0006)
	mov	a,#0xBF
	movx	@dptr,a
	mov	dptr,#(_a + 0x0007)
	mov	a,#0xB2
	movx	@dptr,a
	mov	dptr,#(_a + 0x0008)
	mov	a,#0x54
	movx	@dptr,a
	mov	dptr,#(_a + 0x0009)
	mov	a,#0x28
	movx	@dptr,a
	mov	dptr,#(_a + 0x000a)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_a + 0x000b)
	mov	a,#0x4D
	movx	@dptr,a
	mov	dptr,#(_a + 0x000c)
	mov	a,#0xB2
	movx	@dptr,a
	mov	dptr,#(_a + 0x000d)
	mov	a,#0xD4
	movx	@dptr,a
	mov	dptr,#(_a + 0x000e)
	mov	a,#0xF8
	movx	@dptr,a
	mov	dptr,#(_a + 0x000f)
	mov	a,#0xA6
	movx	@dptr,a
	mov	dptr,#(_a + 0x0010)
	mov	a,#0xE5
	movx	@dptr,a
	mov	dptr,#(_a + 0x0011)
	mov	a,#0xB7
	movx	@dptr,a
	mov	dptr,#(_a + 0x0012)
	mov	a,#0x51
	movx	@dptr,a
	mov	dptr,#(_a + 0x0013)
	mov	a,#0xBA
	movx	@dptr,a
	mov	dptr,#(_a + 0x0014)
	mov	a,#0xE8
	movx	@dptr,a
	mov	dptr,#(_a + 0x0015)
	mov	a,#0xD1
	movx	@dptr,a
	mov	dptr,#(_a + 0x0016)
	mov	a,#0x95
	movx	@dptr,a
	mov	dptr,#(_a + 0x0017)
	mov	a,#0x9A
	movx	@dptr,a
	mov	dptr,#(_a + 0x0018)
	mov	a,#0xFE
	movx	@dptr,a
	mov	dptr,#(_a + 0x0019)
	mov	a,#0xAB
	movx	@dptr,a
	mov	dptr,#(_a + 0x001a)
	mov	a,#0x0A
	movx	@dptr,a
	mov	dptr,#(_a + 0x001b)
	mov	a,#0x48
	movx	@dptr,a
	mov	dptr,#(_a + 0x001c)
	mov	a,#0x23
	movx	@dptr,a
	mov	dptr,#(_a + 0x001d)
	mov	a,#0xA2
	movx	@dptr,a
	mov	dptr,#(_a + 0x001e)
	mov	a,#0x70
	movx	@dptr,a
	mov	dptr,#(_a + 0x001f)
	mov	a,#0xB3
	movx	@dptr,a
	mov	dptr,#(_a + 0x0020)
	mov	a,#0xCC
	movx	@dptr,a
	mov	dptr,#(_a + 0x0021)
	mov	a,#0x7B
	movx	@dptr,a
	mov	dptr,#(_a + 0x0022)
	mov	a,#0x8F
	movx	@dptr,a
	mov	dptr,#(_a + 0x0023)
	mov	a,#0x44
	movx	@dptr,a
	mov	dptr,#(_a + 0x0024)
	mov	a,#0xF4
	movx	@dptr,a
	mov	dptr,#(_a + 0x0025)
	mov	a,#0x5B
	movx	@dptr,a
	mov	dptr,#(_a + 0x0026)
	mov	a,#0x53
	movx	@dptr,a
	mov	dptr,#(_a + 0x0027)
	mov	a,#0x78
	movx	@dptr,a
	mov	dptr,#(_a + 0x0028)
	mov	a,#0x7D
	movx	@dptr,a
	mov	dptr,#(_a + 0x0029)
	mov	a,#0xE2
	movx	@dptr,a
	mov	dptr,#(_a + 0x002a)
	mov	a,#0xF2
	movx	@dptr,a
	mov	dptr,#(_a + 0x002b)
	mov	a,#0xAF
	movx	@dptr,a
	mov	dptr,#(_a + 0x002c)
	mov	a,#0xD2
	movx	@dptr,a
	mov	dptr,#(_a + 0x002d)
	mov	a,#0xBA
	movx	@dptr,a
	mov	dptr,#(_a + 0x002e)
	mov	a,#0x06
	movx	@dptr,a
	mov	dptr,#(_a + 0x002f)
	mov	a,#0x0F
	movx	@dptr,a
	mov	dptr,#(_a + 0x0030)
	mov	a,#0xEE
	movx	@dptr,a
	mov	dptr,#(_a + 0x0031)
	mov	a,#0xA4
	movx	@dptr,a
	mov	dptr,#(_a + 0x0032)
	mov	a,#0x37
	movx	@dptr,a
	mov	dptr,#(_a + 0x0033)
	mov	a,#0x06
	movx	@dptr,a
	mov	dptr,#(_a + 0x0034)
	mov	a,#0xE7
	movx	@dptr,a
	mov	dptr,#(_a + 0x0035)
	mov	a,#0x04
	movx	@dptr,a
	mov	dptr,#(_a + 0x0036)
	mov	a,#0x2C
	movx	@dptr,a
	mov	dptr,#(_a + 0x0037)
	mov	a,#0x90
	movx	@dptr,a
	mov	dptr,#(_a + 0x0038)
	mov	a,#0x3C
	movx	@dptr,a
	mov	dptr,#(_a + 0x0039)
	mov	a,#0x8B
	movx	@dptr,a
	mov	dptr,#(_a + 0x003a)
	mov	a,#0xFD
	movx	@dptr,a
	mov	dptr,#(_a + 0x003b)
	mov	a,#0x54
	movx	@dptr,a
	mov	dptr,#(_a + 0x003c)
	mov	a,#0xCD
	movx	@dptr,a
	mov	dptr,#(_a + 0x003d)
	mov	a,#0xB9
	movx	@dptr,a
	mov	dptr,#(_a + 0x003e)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_a + 0x003f)
	mov	a,#0xAD
	movx	@dptr,a
	mov	dptr,#(_a + 0x0040)
	mov	a,#0x64
	movx	@dptr,a
	mov	dptr,#(_a + 0x0041)
	mov	a,#0x8E
	movx	@dptr,a
	mov	dptr,#(_a + 0x0042)
	mov	a,#0x26
	movx	@dptr,a
	mov	dptr,#(_a + 0x0043)
	mov	a,#0xDE
	movx	@dptr,a
	mov	dptr,#(_a + 0x0044)
	mov	a,#0x8C
	movx	@dptr,a
	mov	dptr,#(_a + 0x0045)
	mov	a,#0xC5
	movx	@dptr,a
	mov	dptr,#(_a + 0x0046)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_a + 0x0047)
	mov	a,#0x92
	movx	@dptr,a
	mov	dptr,#(_a + 0x0048)
	mov	a,#0x24
	movx	@dptr,a
	mov	dptr,#(_a + 0x0049)
	mov	a,#0xEF
	movx	@dptr,a
	mov	dptr,#(_a + 0x004a)
	mov	a,#0x76
	movx	@dptr,a
	mov	dptr,#(_a + 0x004b)
	mov	a,#0x34
	movx	@dptr,a
	mov	dptr,#(_a + 0x004c)
	mov	a,#0xC4
	movx	@dptr,a
	mov	dptr,#(_a + 0x004d)
	mov	a,#0xB8
	movx	@dptr,a
	mov	dptr,#(_a + 0x004e)
	mov	a,#0xEC
	movx	@dptr,a
	mov	dptr,#(_a + 0x004f)
	mov	a,#0xF1
	movx	@dptr,a
	mov	dptr,#(_a + 0x0050)
	mov	a,#0x9A
	movx	@dptr,a
	mov	dptr,#(_a + 0x0051)
	mov	a,#0x79
	movx	@dptr,a
	mov	dptr,#(_a + 0x0052)
	mov	a,#0x61
	movx	@dptr,a
	mov	dptr,#(_a + 0x0053)
	mov	a,#0x80
	movx	@dptr,a
	mov	dptr,#(_a + 0x0054)
	mov	a,#0xC1
	movx	@dptr,a
	mov	dptr,#(_a + 0x0055)
	mov	a,#0xBC
	movx	@dptr,a
	mov	dptr,#(_a + 0x0056)
	mov	a,#0x6D
	movx	@dptr,a
	mov	dptr,#(_a + 0x0057)
	mov	a,#0x03
	movx	@dptr,a
	mov	dptr,#(_a + 0x0058)
	mov	a,#0x49
	movx	@dptr,a
	mov	dptr,#(_a + 0x0059)
	mov	a,#0x95
	movx	@dptr,a
	mov	dptr,#(_a + 0x005a)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_a + 0x005b)
	mov	a,#0xC8
	movx	@dptr,a
	mov	dptr,#(_a + 0x005c)
	mov	a,#0x6F
	movx	@dptr,a
	mov	dptr,#(_a + 0x005d)
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#(_a + 0x005e)
	mov	a,#0xB0
	movx	@dptr,a
	mov	dptr,#(_a + 0x005f)
	mov	a,#0x16
	movx	@dptr,a
	mov	dptr,#(_a + 0x0060)
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#(_a + 0x0061)
	mov	a,#0x63
	movx	@dptr,a
	mov	dptr,#(_a + 0x0062)
	mov	a,#0xD0
	movx	@dptr,a
	mov	dptr,#(_a + 0x0063)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_a + 0x0064)
	mov	a,#0xD9
	movx	@dptr,a
	mov	dptr,#(_a + 0x0065)
	mov	a,#0x10
	movx	@dptr,a
	mov	dptr,#(_a + 0x0066)
	mov	a,#0x4B
	movx	@dptr,a
	mov	dptr,#(_a + 0x0067)
	mov	a,#0x44
	movx	@dptr,a
	mov	dptr,#(_a + 0x0068)
	mov	a,#0x03
	movx	@dptr,a
	mov	dptr,#(_a + 0x0069)
	mov	a,#0xC2
	movx	@dptr,a
	mov	dptr,#(_a + 0x006a)
	mov	a,#0xCC
	movx	@dptr,a
	mov	dptr,#(_a + 0x006b)
	mov	a,#0x04
	movx	@dptr,a
	mov	dptr,#(_a + 0x006c)
	mov	a,#0x68
	movx	@dptr,a
	mov	dptr,#(_a + 0x006d)
	mov	a,#0x98
	movx	@dptr,a
	mov	dptr,#(_a + 0x006e)
	mov	a,#0x6C
	movx	@dptr,a
	mov	dptr,#(_a + 0x006f)
	mov	a,#0xD9
	movx	@dptr,a
	mov	dptr,#(_a + 0x0070)
	mov	a,#0x69
	movx	@dptr,a
	mov	dptr,#(_a + 0x0071)
	mov	a,#0xC7
	movx	@dptr,a
	mov	dptr,#(_a + 0x0072)
	mov	a,#0x1A
	movx	@dptr,a
	mov	dptr,#(_a + 0x0073)
	mov	a,#0x0F
	movx	@dptr,a
	mov	dptr,#(_a + 0x0074)
	mov	a,#0xC5
	movx	@dptr,a
	mov	dptr,#(_a + 0x0075)
	mov	a,#0x39
	movx	@dptr,a
	mov	dptr,#(_a + 0x0076)
	mov	a,#0x5C
	movx	@dptr,a
	mov	dptr,#(_a + 0x0077)
	mov	a,#0x6A
	movx	@dptr,a
	mov	dptr,#(_a + 0x0078)
	mov	a,#0x5A
	movx	@dptr,a
	mov	dptr,#(_a + 0x0079)
	mov	a,#0x67
	movx	@dptr,a
	mov	dptr,#(_a + 0x007a)
	mov	a,#0x0B
	movx	@dptr,a
	mov	dptr,#(_a + 0x007b)
	mov	a,#0x47
	movx	@dptr,a
	mov	dptr,#(_a + 0x007c)
	mov	a,#0xF4
	movx	@dptr,a
	mov	dptr,#(_a + 0x007d)
	mov	a,#0x77
	movx	@dptr,a
	mov	dptr,#(_a + 0x007e)
	mov	a,#0x1E
	movx	@dptr,a
	mov	dptr,#(_a + 0x007f)
	mov	a,#0x2B
	movx	@dptr,a
;	main.c:15: volatile __xdata __at (0x0100) unsigned char b[SIZE]   = {0xA3,0x10,0x6B,0x83,0x7C,0x40,0xBF,0xB2,0x54,0x28,0x20,0x4D,0xB2,0xD4,0xF8,0xA6,0xE5,0xB7,0x51,0xBA,0xE8,0xD1,0x95,0x9A,0xFE,0xAB,0x0A,0x48,0x23,0xA2,0x70,0xB3,0xCC,0x7B,0x8F,0x44,0xF4,0x5B,0x53,0x78,0x7D,0xE2,0xF2,0xAF,0xD2,0xBA,0x06,0x0F,0xEE,0xA4,0x37,0x06,0xE7,0x04,0x2C,0x90,0x3C,0x8B,0xFD,0x54,0xCD,0xB9,0x94,0xAD,0x64,0x8E,0x26,0xDE,0x8C,0xC5,0x33,0x92,0x24,0xEF,0x76,0x34,0xC4,0xB8,0xEC,0xF1,0x9A,0x79,0x61,0x80,0xC1,0xBC,0x6D,0x03,0x49,0x95,0x94,0xC8,0x6F,0x14,0xB0,0x16,0x14,0x63,0xD0,0x94,0xD9,0x10,0x4B,0x44,0x03,0xC2,0xCC,0x04,0x68,0x98,0x6C,0xD9,0x69,0xC7,0x1A,0x0F,0xC5,0x39,0x5C,0x6A,0x5A,0x67,0x0B,0x47,0xF4,0x77,0x1E,0x2B};
	mov	dptr,#_b
	mov	a,#0xA3
	movx	@dptr,a
	mov	dptr,#(_b + 0x0001)
	mov	a,#0x10
	movx	@dptr,a
	mov	dptr,#(_b + 0x0002)
	mov	a,#0x6B
	movx	@dptr,a
	mov	dptr,#(_b + 0x0003)
	mov	a,#0x83
	movx	@dptr,a
	mov	dptr,#(_b + 0x0004)
	mov	a,#0x7C
	movx	@dptr,a
	mov	dptr,#(_b + 0x0005)
	mov	a,#0x40
	movx	@dptr,a
	mov	dptr,#(_b + 0x0006)
	mov	a,#0xBF
	movx	@dptr,a
	mov	dptr,#(_b + 0x0007)
	mov	a,#0xB2
	movx	@dptr,a
	mov	dptr,#(_b + 0x0008)
	mov	a,#0x54
	movx	@dptr,a
	mov	dptr,#(_b + 0x0009)
	mov	a,#0x28
	movx	@dptr,a
	mov	dptr,#(_b + 0x000a)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_b + 0x000b)
	mov	a,#0x4D
	movx	@dptr,a
	mov	dptr,#(_b + 0x000c)
	mov	a,#0xB2
	movx	@dptr,a
	mov	dptr,#(_b + 0x000d)
	mov	a,#0xD4
	movx	@dptr,a
	mov	dptr,#(_b + 0x000e)
	mov	a,#0xF8
	movx	@dptr,a
	mov	dptr,#(_b + 0x000f)
	mov	a,#0xA6
	movx	@dptr,a
	mov	dptr,#(_b + 0x0010)
	mov	a,#0xE5
	movx	@dptr,a
	mov	dptr,#(_b + 0x0011)
	mov	a,#0xB7
	movx	@dptr,a
	mov	dptr,#(_b + 0x0012)
	mov	a,#0x51
	movx	@dptr,a
	mov	dptr,#(_b + 0x0013)
	mov	a,#0xBA
	movx	@dptr,a
	mov	dptr,#(_b + 0x0014)
	mov	a,#0xE8
	movx	@dptr,a
	mov	dptr,#(_b + 0x0015)
	mov	a,#0xD1
	movx	@dptr,a
	mov	dptr,#(_b + 0x0016)
	mov	a,#0x95
	movx	@dptr,a
	mov	dptr,#(_b + 0x0017)
	mov	a,#0x9A
	movx	@dptr,a
	mov	dptr,#(_b + 0x0018)
	mov	a,#0xFE
	movx	@dptr,a
	mov	dptr,#(_b + 0x0019)
	mov	a,#0xAB
	movx	@dptr,a
	mov	dptr,#(_b + 0x001a)
	mov	a,#0x0A
	movx	@dptr,a
	mov	dptr,#(_b + 0x001b)
	mov	a,#0x48
	movx	@dptr,a
	mov	dptr,#(_b + 0x001c)
	mov	a,#0x23
	movx	@dptr,a
	mov	dptr,#(_b + 0x001d)
	mov	a,#0xA2
	movx	@dptr,a
	mov	dptr,#(_b + 0x001e)
	mov	a,#0x70
	movx	@dptr,a
	mov	dptr,#(_b + 0x001f)
	mov	a,#0xB3
	movx	@dptr,a
	mov	dptr,#(_b + 0x0020)
	mov	a,#0xCC
	movx	@dptr,a
	mov	dptr,#(_b + 0x0021)
	mov	a,#0x7B
	movx	@dptr,a
	mov	dptr,#(_b + 0x0022)
	mov	a,#0x8F
	movx	@dptr,a
	mov	dptr,#(_b + 0x0023)
	mov	a,#0x44
	movx	@dptr,a
	mov	dptr,#(_b + 0x0024)
	mov	a,#0xF4
	movx	@dptr,a
	mov	dptr,#(_b + 0x0025)
	mov	a,#0x5B
	movx	@dptr,a
	mov	dptr,#(_b + 0x0026)
	mov	a,#0x53
	movx	@dptr,a
	mov	dptr,#(_b + 0x0027)
	mov	a,#0x78
	movx	@dptr,a
	mov	dptr,#(_b + 0x0028)
	mov	a,#0x7D
	movx	@dptr,a
	mov	dptr,#(_b + 0x0029)
	mov	a,#0xE2
	movx	@dptr,a
	mov	dptr,#(_b + 0x002a)
	mov	a,#0xF2
	movx	@dptr,a
	mov	dptr,#(_b + 0x002b)
	mov	a,#0xAF
	movx	@dptr,a
	mov	dptr,#(_b + 0x002c)
	mov	a,#0xD2
	movx	@dptr,a
	mov	dptr,#(_b + 0x002d)
	mov	a,#0xBA
	movx	@dptr,a
	mov	dptr,#(_b + 0x002e)
	mov	a,#0x06
	movx	@dptr,a
	mov	dptr,#(_b + 0x002f)
	mov	a,#0x0F
	movx	@dptr,a
	mov	dptr,#(_b + 0x0030)
	mov	a,#0xEE
	movx	@dptr,a
	mov	dptr,#(_b + 0x0031)
	mov	a,#0xA4
	movx	@dptr,a
	mov	dptr,#(_b + 0x0032)
	mov	a,#0x37
	movx	@dptr,a
	mov	dptr,#(_b + 0x0033)
	mov	a,#0x06
	movx	@dptr,a
	mov	dptr,#(_b + 0x0034)
	mov	a,#0xE7
	movx	@dptr,a
	mov	dptr,#(_b + 0x0035)
	mov	a,#0x04
	movx	@dptr,a
	mov	dptr,#(_b + 0x0036)
	mov	a,#0x2C
	movx	@dptr,a
	mov	dptr,#(_b + 0x0037)
	mov	a,#0x90
	movx	@dptr,a
	mov	dptr,#(_b + 0x0038)
	mov	a,#0x3C
	movx	@dptr,a
	mov	dptr,#(_b + 0x0039)
	mov	a,#0x8B
	movx	@dptr,a
	mov	dptr,#(_b + 0x003a)
	mov	a,#0xFD
	movx	@dptr,a
	mov	dptr,#(_b + 0x003b)
	mov	a,#0x54
	movx	@dptr,a
	mov	dptr,#(_b + 0x003c)
	mov	a,#0xCD
	movx	@dptr,a
	mov	dptr,#(_b + 0x003d)
	mov	a,#0xB9
	movx	@dptr,a
	mov	dptr,#(_b + 0x003e)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_b + 0x003f)
	mov	a,#0xAD
	movx	@dptr,a
	mov	dptr,#(_b + 0x0040)
	mov	a,#0x64
	movx	@dptr,a
	mov	dptr,#(_b + 0x0041)
	mov	a,#0x8E
	movx	@dptr,a
	mov	dptr,#(_b + 0x0042)
	mov	a,#0x26
	movx	@dptr,a
	mov	dptr,#(_b + 0x0043)
	mov	a,#0xDE
	movx	@dptr,a
	mov	dptr,#(_b + 0x0044)
	mov	a,#0x8C
	movx	@dptr,a
	mov	dptr,#(_b + 0x0045)
	mov	a,#0xC5
	movx	@dptr,a
	mov	dptr,#(_b + 0x0046)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_b + 0x0047)
	mov	a,#0x92
	movx	@dptr,a
	mov	dptr,#(_b + 0x0048)
	mov	a,#0x24
	movx	@dptr,a
	mov	dptr,#(_b + 0x0049)
	mov	a,#0xEF
	movx	@dptr,a
	mov	dptr,#(_b + 0x004a)
	mov	a,#0x76
	movx	@dptr,a
	mov	dptr,#(_b + 0x004b)
	mov	a,#0x34
	movx	@dptr,a
	mov	dptr,#(_b + 0x004c)
	mov	a,#0xC4
	movx	@dptr,a
	mov	dptr,#(_b + 0x004d)
	mov	a,#0xB8
	movx	@dptr,a
	mov	dptr,#(_b + 0x004e)
	mov	a,#0xEC
	movx	@dptr,a
	mov	dptr,#(_b + 0x004f)
	mov	a,#0xF1
	movx	@dptr,a
	mov	dptr,#(_b + 0x0050)
	mov	a,#0x9A
	movx	@dptr,a
	mov	dptr,#(_b + 0x0051)
	mov	a,#0x79
	movx	@dptr,a
	mov	dptr,#(_b + 0x0052)
	mov	a,#0x61
	movx	@dptr,a
	mov	dptr,#(_b + 0x0053)
	mov	a,#0x80
	movx	@dptr,a
	mov	dptr,#(_b + 0x0054)
	mov	a,#0xC1
	movx	@dptr,a
	mov	dptr,#(_b + 0x0055)
	mov	a,#0xBC
	movx	@dptr,a
	mov	dptr,#(_b + 0x0056)
	mov	a,#0x6D
	movx	@dptr,a
	mov	dptr,#(_b + 0x0057)
	mov	a,#0x03
	movx	@dptr,a
	mov	dptr,#(_b + 0x0058)
	mov	a,#0x49
	movx	@dptr,a
	mov	dptr,#(_b + 0x0059)
	mov	a,#0x95
	movx	@dptr,a
	mov	dptr,#(_b + 0x005a)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_b + 0x005b)
	mov	a,#0xC8
	movx	@dptr,a
	mov	dptr,#(_b + 0x005c)
	mov	a,#0x6F
	movx	@dptr,a
	mov	dptr,#(_b + 0x005d)
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#(_b + 0x005e)
	mov	a,#0xB0
	movx	@dptr,a
	mov	dptr,#(_b + 0x005f)
	mov	a,#0x16
	movx	@dptr,a
	mov	dptr,#(_b + 0x0060)
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#(_b + 0x0061)
	mov	a,#0x63
	movx	@dptr,a
	mov	dptr,#(_b + 0x0062)
	mov	a,#0xD0
	movx	@dptr,a
	mov	dptr,#(_b + 0x0063)
	mov	a,#0x94
	movx	@dptr,a
	mov	dptr,#(_b + 0x0064)
	mov	a,#0xD9
	movx	@dptr,a
	mov	dptr,#(_b + 0x0065)
	mov	a,#0x10
	movx	@dptr,a
	mov	dptr,#(_b + 0x0066)
	mov	a,#0x4B
	movx	@dptr,a
	mov	dptr,#(_b + 0x0067)
	mov	a,#0x44
	movx	@dptr,a
	mov	dptr,#(_b + 0x0068)
	mov	a,#0x03
	movx	@dptr,a
	mov	dptr,#(_b + 0x0069)
	mov	a,#0xC2
	movx	@dptr,a
	mov	dptr,#(_b + 0x006a)
	mov	a,#0xCC
	movx	@dptr,a
	mov	dptr,#(_b + 0x006b)
	mov	a,#0x04
	movx	@dptr,a
	mov	dptr,#(_b + 0x006c)
	mov	a,#0x68
	movx	@dptr,a
	mov	dptr,#(_b + 0x006d)
	mov	a,#0x98
	movx	@dptr,a
	mov	dptr,#(_b + 0x006e)
	mov	a,#0x6C
	movx	@dptr,a
	mov	dptr,#(_b + 0x006f)
	mov	a,#0xD9
	movx	@dptr,a
	mov	dptr,#(_b + 0x0070)
	mov	a,#0x69
	movx	@dptr,a
	mov	dptr,#(_b + 0x0071)
	mov	a,#0xC7
	movx	@dptr,a
	mov	dptr,#(_b + 0x0072)
	mov	a,#0x1A
	movx	@dptr,a
	mov	dptr,#(_b + 0x0073)
	mov	a,#0x0F
	movx	@dptr,a
	mov	dptr,#(_b + 0x0074)
	mov	a,#0xC5
	movx	@dptr,a
	mov	dptr,#(_b + 0x0075)
	mov	a,#0x39
	movx	@dptr,a
	mov	dptr,#(_b + 0x0076)
	mov	a,#0x5C
	movx	@dptr,a
	mov	dptr,#(_b + 0x0077)
	mov	a,#0x6A
	movx	@dptr,a
	mov	dptr,#(_b + 0x0078)
	mov	a,#0x5A
	movx	@dptr,a
	mov	dptr,#(_b + 0x0079)
	mov	a,#0x67
	movx	@dptr,a
	mov	dptr,#(_b + 0x007a)
	mov	a,#0x0B
	movx	@dptr,a
	mov	dptr,#(_b + 0x007b)
	mov	a,#0x47
	movx	@dptr,a
	mov	dptr,#(_b + 0x007c)
	mov	a,#0xF4
	movx	@dptr,a
	mov	dptr,#(_b + 0x007d)
	mov	a,#0x77
	movx	@dptr,a
	mov	dptr,#(_b + 0x007e)
	mov	a,#0x1E
	movx	@dptr,a
	mov	dptr,#(_b + 0x007f)
	mov	a,#0x2B
	movx	@dptr,a
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'write_montgomery'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:25: void write_montgomery() {
;	-----------------------------------------
;	 function write_montgomery
;	-----------------------------------------
_write_montgomery:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	main.c:26: P1 = 0;
;	main.c:28: for (i = 0; i < SIZE; i++) {
	clr	a
	mov	_P1,a
	mov	_i,a
	mov	(_i + 1),a
00104$:
	clr	c
	mov	a,_i
	subb	a,#0x80
	mov	a,(_i + 1)
	subb	a,#0x00
	jnc	00107$
;	main.c:29: shared_a[i] = a[SIZE-1-i];
	mov	r2,_i
	mov	a,#(_shared_a >> 8)
	add	a,(_i + 1)
	mov	r3,a
	mov	r4,_i
	mov	a,#0x7F
	clr	c
	subb	a,r4
	add	a,#_a
	mov	dpl,a
	clr	a
	addc	a,#(_a >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	main.c:28: for (i = 0; i < SIZE; i++) {
	inc	_i
	clr	a
	cjne	a,_i,00104$
	inc	(_i + 1)
	sjmp	00104$
00107$:
;	main.c:32: for (i = 0; i < SIZE; i++) {
	clr	a
	mov	_i,a
	mov	(_i + 1),a
00108$:
	clr	c
	mov	a,_i
	subb	a,#0x80
	mov	a,(_i + 1)
	subb	a,#0x00
	jnc	00111$
;	main.c:33: shared_b[i] = b[SIZE-1-i];
	mov	a,_i
	add	a,#_shared_b
	mov	r2,a
	mov	a,(_i + 1)
	addc	a,#(_shared_b >> 8)
	mov	r3,a
	mov	r4,_i
	mov	a,#0x7F
	clr	c
	subb	a,r4
	add	a,#_b
	mov	dpl,a
	clr	a
	addc	a,#(_b >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	main.c:32: for (i = 0; i < SIZE; i++) {
	inc	_i
	clr	a
	cjne	a,_i,00108$
	inc	(_i + 1)
	sjmp	00108$
00111$:
;	main.c:36: for (i = 0; i < SIZE; i++) {
	clr	a
	mov	_i,a
	mov	(_i + 1),a
00112$:
	clr	c
	mov	a,_i
	subb	a,#0x80
	mov	a,(_i + 1)
	subb	a,#0x00
	jnc	00115$
;	main.c:37: shared_m[i] = m[SIZE-1-i];
	mov	r2,_i
	mov	a,#(_shared_m >> 8)
	add	a,(_i + 1)
	mov	r3,a
	mov	r4,_i
	mov	a,#0x7F
	clr	c
	subb	a,r4
	add	a,#_m
	mov	dpl,a
	clr	a
	addc	a,#(_m >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	main.c:36: for (i = 0; i < SIZE; i++) {
	inc	_i
	clr	a
	cjne	a,_i,00112$
	inc	(_i + 1)
	sjmp	00112$
00115$:
;	main.c:40: P0 = ins_write_data;
	mov	_P0,#0x01
;	main.c:41: P0 = ins_idle;
	mov	_P0,#0x00
;	main.c:43: while (P1 == 0) {}
00101$:
	mov	a,_P1
	jz	00101$
;	main.c:44: P0 = ins_ack;
	mov	_P0,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'read_r'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:47: void read_r() {
;	-----------------------------------------
;	 function read_r
;	-----------------------------------------
_read_r:
;	main.c:48: P0 = ins_read_r;
	mov	_P0,#0x03
;	main.c:49: while (P1 == 0) {}
00101$:
	mov	a,_P1
	jz	00101$
;	main.c:50: P0 = ins_ack;
	mov	_P0,#0x04
;	main.c:52: P0 = ins_idle;
	mov	_P0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'montgomery'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:55: void montgomery() {
;	-----------------------------------------
;	 function montgomery
;	-----------------------------------------
_montgomery:
;	main.c:56: P0 = ins_montgomery;
	mov	_P0,#0x02
;	main.c:57: P0 = ins_idle;
	mov	_P0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'terminate'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:60: void terminate() {
;	-----------------------------------------
;	 function terminate
;	-----------------------------------------
_terminate:
;	main.c:61: P3 = 0x55;
	mov	_P3,#0x55
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:64: int main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:65: write_montgomery();
	lcall	_write_montgomery
;	main.c:66: montgomery();
	lcall	_montgomery
;	main.c:67: read_r();
	lcall	_read_r
;	main.c:69: P1 = 0;
;	main.c:71: for (i = 0; i < SIZE; i++) {
	clr	a
	mov	_P1,a
	mov	_i,a
	mov	(_i + 1),a
00104$:
	clr	c
	mov	a,_i
	subb	a,#0x80
	mov	a,(_i + 1)
	subb	a,#0x00
	jnc	00107$
;	main.c:72: shared_a[i] = r[i];
	mov	r2,_i
	mov	a,#(_shared_a >> 8)
	add	a,(_i + 1)
	mov	r3,a
	mov	dpl,_i
	mov	a,#(_r >> 8)
	add	a,(_i + 1)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	main.c:71: for (i = 0; i < SIZE; i++) {
	inc	_i
	clr	a
	cjne	a,_i,00104$
	inc	(_i + 1)
	sjmp	00104$
00107$:
;	main.c:75: P0 = ins_write_data;
	mov	_P0,#0x01
;	main.c:76: P0 = ins_idle;
	mov	_P0,#0x00
;	main.c:78: while (P1 == 0) {}
00101$:
	mov	a,_P1
	jz	00101$
;	main.c:79: P0 = ins_ack;
	mov	_P0,#0x04
;	main.c:81: terminate();
	lcall	_terminate
;	main.c:82: return 0;
	mov	dptr,#0x0000
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
