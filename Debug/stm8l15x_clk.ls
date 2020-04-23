   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     .const:	section	.text
  16  0000               _SYSDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004 10            	dc.b	16
  50                     ; 120 void CLK_DeInit(void)
  50                     ; 121 {
  52                     	switch	.text
  53  0000               _CLK_DeInit:
  57                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  59  0000 351150c2      	mov	20674,#17
  60                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  62  0004 725f50c6      	clr	20678
  63                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  65  0008 725f50c1      	clr	20673
  66                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  68  000c 725f50cb      	clr	20683
  69                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0010 350150c8      	mov	20680,#1
  72                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  0014 725f50c9      	clr	20681
  75                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0018 350350c0      	mov	20672,#3
  78                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  001c 725f50c3      	clr	20675
  81                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0020 358050c4      	mov	20676,#128
  84                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  86  0024 725f50d0      	clr	20688
  87                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  89  0028 725f50ca      	clr	20682
  90                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  002c 725f50c5      	clr	20677
  93                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  95  0030 725f50cd      	clr	20685
  96                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  98  0034 725f50cc      	clr	20684
  99                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 101  0038 725f50ce      	clr	20686
 102                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 104  003c 35b950cf      	mov	20687,#185
 105                     ; 138 }
 108  0040 81            	ret
 163                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 163                     ; 161 {
 164                     	switch	.text
 165  0041               _CLK_HSICmd:
 169                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 171                     ; 165   if (NewState != DISABLE)
 173  0041 4d            	tnz	a
 174  0042 2706          	jreq	L74
 175                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 177  0044 721050c2      	bset	20674,#0
 179  0048 2004          	jra	L15
 180  004a               L74:
 181                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 183  004a 721150c2      	bres	20674,#0
 184  004e               L15:
 185                     ; 175 }
 188  004e 81            	ret
 224                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 224                     ; 189 {
 225                     	switch	.text
 226  004f               _CLK_AdjustHSICalibrationValue:
 230                     ; 191   CLK->HSIUNLCKR = 0xAC;
 232  004f 35ac50ce      	mov	20686,#172
 233                     ; 192   CLK->HSIUNLCKR = 0x35;
 235  0053 353550ce      	mov	20686,#53
 236                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 238  0057 c750cd        	ld	20685,a
 239                     ; 196 }
 242  005a 81            	ret
 277                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 277                     ; 213 {
 278                     	switch	.text
 279  005b               _CLK_LSICmd:
 283                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 218   if (NewState != DISABLE)
 287  005b 4d            	tnz	a
 288  005c 2706          	jreq	L701
 289                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 291  005e 721450c2      	bset	20674,#2
 293  0062 2004          	jra	L111
 294  0064               L701:
 295                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 297  0064 721550c2      	bres	20674,#2
 298  0068               L111:
 299                     ; 228 }
 302  0068 81            	ret
 364                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 250 {
 365                     	switch	.text
 366  0069               _CLK_HSEConfig:
 370                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0069 721150c6      	bres	20678,#0
 375                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  006d 721950c6      	bres	20678,#4
 378                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0071 ca50c6        	or	a,20678
 381  0074 c750c6        	ld	20678,a
 382                     ; 263 }
 385  0077 81            	ret
 447                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 447                     ; 281 {
 448                     	switch	.text
 449  0078               _CLK_LSEConfig:
 453                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 455                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 457  0078 721550c6      	bres	20678,#2
 458                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 460  007c 721b50c6      	bres	20678,#5
 461                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 463  0080 ca50c6        	or	a,20678
 464  0083 c750c6        	ld	20678,a
 465                     ; 295 }
 468  0086 81            	ret
 492                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 492                     ; 307 {
 493                     	switch	.text
 494  0087               _CLK_ClockSecuritySystemEnable:
 498                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 500  0087 721050ca      	bset	20682,#0
 501                     ; 310 }
 504  008b 81            	ret
 540                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 540                     ; 318 {
 541                     	switch	.text
 542  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 546                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 548                     ; 322   if (NewState != DISABLE)
 550  008c 4d            	tnz	a
 551  008d 2706          	jreq	L122
 552                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 554  008f 721850ca      	bset	20682,#4
 556  0093 2004          	jra	L322
 557  0095               L122:
 558                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 560  0095 721950ca      	bres	20682,#4
 561  0099               L322:
 562                     ; 332 }
 565  0099 81            	ret
 706                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 706                     ; 357 {
 707                     	switch	.text
 708  009a               _CLK_CCOConfig:
 710  009a 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 716                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 718                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 720  009b 9f            	ld	a,xl
 721  009c 1a01          	or	a,(OFST+1,sp)
 722  009e c750c5        	ld	20677,a
 723                     ; 364 }
 726  00a1 85            	popw	x
 727  00a2 81            	ret
 801                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 801                     ; 417 {
 802                     	switch	.text
 803  00a3               _CLK_SYSCLKSourceConfig:
 807                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 809                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 811  00a3 c750c8        	ld	20680,a
 812                     ; 423 }
 815  00a6 81            	ret
 840                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 840                     ; 436 {
 841                     	switch	.text
 842  00a7               _CLK_GetSYSCLKSource:
 846                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 848  00a7 c650c7        	ld	a,20679
 851  00aa 81            	ret
 923                     ; 478 uint32_t CLK_GetClockFreq(void)
 923                     ; 479 {
 924                     	switch	.text
 925  00ab               _CLK_GetClockFreq:
 927  00ab 5209          	subw	sp,#9
 928       00000009      OFST:	set	9
 931                     ; 480   uint32_t clockfrequency = 0;
 933                     ; 481   uint32_t sourcefrequency = 0;
 935  00ad ae0000        	ldw	x,#0
 936  00b0 1f07          	ldw	(OFST-2,sp),x
 937  00b2 ae0000        	ldw	x,#0
 938  00b5 1f05          	ldw	(OFST-4,sp),x
 940                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 942                     ; 483   uint8_t tmp = 0, presc = 0;
 946                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 948  00b7 c650c7        	ld	a,20679
 949  00ba 6b09          	ld	(OFST+0,sp),a
 951                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 953  00bc 7b09          	ld	a,(OFST+0,sp)
 954  00be a101          	cp	a,#1
 955  00c0 260c          	jrne	L704
 956                     ; 490     sourcefrequency = HSI_VALUE;
 958  00c2 ae2400        	ldw	x,#9216
 959  00c5 1f07          	ldw	(OFST-2,sp),x
 960  00c7 ae00f4        	ldw	x,#244
 961  00ca 1f05          	ldw	(OFST-4,sp),x
 964  00cc 2022          	jra	L114
 965  00ce               L704:
 966                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 968  00ce 7b09          	ld	a,(OFST+0,sp)
 969  00d0 a102          	cp	a,#2
 970  00d2 260c          	jrne	L314
 971                     ; 494     sourcefrequency = LSI_VALUE;
 973  00d4 ae9470        	ldw	x,#38000
 974  00d7 1f07          	ldw	(OFST-2,sp),x
 975  00d9 ae0000        	ldw	x,#0
 976  00dc 1f05          	ldw	(OFST-4,sp),x
 979  00de 2010          	jra	L114
 980  00e0               L314:
 981                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 983  00e0 7b09          	ld	a,(OFST+0,sp)
 984  00e2 a104          	cp	a,#4
 985  00e4 260a          	jrne	L714
 986                     ; 498     sourcefrequency = HSE_VALUE;
 988  00e6 ae2400        	ldw	x,#9216
 989  00e9 1f07          	ldw	(OFST-2,sp),x
 990  00eb ae00f4        	ldw	x,#244
 991  00ee 1f05          	ldw	(OFST-4,sp),x
 994  00f0               L714:
 995                     ; 502     clockfrequency = LSE_VALUE;
 997  00f0               L114:
 998                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
1000  00f0 c650c0        	ld	a,20672
1001  00f3 a407          	and	a,#7
1002  00f5 6b09          	ld	(OFST+0,sp),a
1004                     ; 507   presc = SYSDivFactor[tmp];
1006  00f7 7b09          	ld	a,(OFST+0,sp)
1007  00f9 5f            	clrw	x
1008  00fa 97            	ld	xl,a
1009  00fb d60000        	ld	a,(_SYSDivFactor,x)
1010  00fe 6b09          	ld	(OFST+0,sp),a
1012                     ; 510   clockfrequency = sourcefrequency / presc;
1014  0100 7b09          	ld	a,(OFST+0,sp)
1015  0102 b703          	ld	c_lreg+3,a
1016  0104 3f02          	clr	c_lreg+2
1017  0106 3f01          	clr	c_lreg+1
1018  0108 3f00          	clr	c_lreg
1019  010a 96            	ldw	x,sp
1020  010b 1c0001        	addw	x,#OFST-8
1021  010e cd0000        	call	c_rtol
1024  0111 96            	ldw	x,sp
1025  0112 1c0005        	addw	x,#OFST-4
1026  0115 cd0000        	call	c_ltor
1028  0118 96            	ldw	x,sp
1029  0119 1c0001        	addw	x,#OFST-8
1030  011c cd0000        	call	c_ludv
1032  011f 96            	ldw	x,sp
1033  0120 1c0005        	addw	x,#OFST-4
1034  0123 cd0000        	call	c_rtol
1037                     ; 512   return((uint32_t)clockfrequency);
1039  0126 96            	ldw	x,sp
1040  0127 1c0005        	addw	x,#OFST-4
1041  012a cd0000        	call	c_ltor
1045  012d 5b09          	addw	sp,#9
1046  012f 81            	ret
1144                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1144                     ; 529 {
1145                     	switch	.text
1146  0130               _CLK_SYSCLKDivConfig:
1150                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1152                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1154  0130 c750c0        	ld	20672,a
1155                     ; 534 }
1158  0133 81            	ret
1194                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1194                     ; 542 {
1195                     	switch	.text
1196  0134               _CLK_SYSCLKSourceSwitchCmd:
1200                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1202                     ; 546   if (NewState != DISABLE)
1204  0134 4d            	tnz	a
1205  0135 2706          	jreq	L305
1206                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1208  0137 721250c9      	bset	20681,#1
1210  013b 2004          	jra	L505
1211  013d               L305:
1212                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1214  013d 721350c9      	bres	20681,#1
1215  0141               L505:
1216                     ; 556 }
1219  0141 81            	ret
1365                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1365                     ; 617 {
1366                     	switch	.text
1367  0142               _CLK_RTCClockConfig:
1369  0142 89            	pushw	x
1370       00000000      OFST:	set	0
1373                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1375                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1377                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1379  0143 9f            	ld	a,xl
1380  0144 1a01          	or	a,(OFST+1,sp)
1381  0146 c750c1        	ld	20673,a
1382                     ; 624 }
1385  0149 85            	popw	x
1386  014a 81            	ret
1452                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1452                     ; 636 {
1453                     	switch	.text
1454  014b               _CLK_BEEPClockConfig:
1458                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1460                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1462  014b c750cb        	ld	20683,a
1463                     ; 643 }
1466  014e 81            	ret
1691                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1691                     ; 678 {
1692                     	switch	.text
1693  014f               _CLK_PeripheralClockConfig:
1695  014f 89            	pushw	x
1696  0150 88            	push	a
1697       00000001      OFST:	set	1
1700                     ; 679   uint8_t reg = 0;
1702                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1704                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1706                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1708  0151 9e            	ld	a,xh
1709  0152 a4f0          	and	a,#240
1710  0154 6b01          	ld	(OFST+0,sp),a
1712                     ; 688   if ( reg == 0x00)
1714  0156 0d01          	tnz	(OFST+0,sp)
1715  0158 2635          	jrne	L527
1716                     ; 690     if (NewState != DISABLE)
1718  015a 0d03          	tnz	(OFST+2,sp)
1719  015c 2719          	jreq	L727
1720                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1722  015e 7b02          	ld	a,(OFST+1,sp)
1723  0160 a40f          	and	a,#15
1724  0162 5f            	clrw	x
1725  0163 97            	ld	xl,a
1726  0164 a601          	ld	a,#1
1727  0166 5d            	tnzw	x
1728  0167 2704          	jreq	L64
1729  0169               L05:
1730  0169 48            	sll	a
1731  016a 5a            	decw	x
1732  016b 26fc          	jrne	L05
1733  016d               L64:
1734  016d ca50c3        	or	a,20675
1735  0170 c750c3        	ld	20675,a
1737  0173 acf901f9      	jpf	L337
1738  0177               L727:
1739                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1741  0177 7b02          	ld	a,(OFST+1,sp)
1742  0179 a40f          	and	a,#15
1743  017b 5f            	clrw	x
1744  017c 97            	ld	xl,a
1745  017d a601          	ld	a,#1
1746  017f 5d            	tnzw	x
1747  0180 2704          	jreq	L25
1748  0182               L45:
1749  0182 48            	sll	a
1750  0183 5a            	decw	x
1751  0184 26fc          	jrne	L45
1752  0186               L25:
1753  0186 43            	cpl	a
1754  0187 c450c3        	and	a,20675
1755  018a c750c3        	ld	20675,a
1756  018d 206a          	jra	L337
1757  018f               L527:
1758                     ; 701   else if (reg == 0x10)
1760  018f 7b01          	ld	a,(OFST+0,sp)
1761  0191 a110          	cp	a,#16
1762  0193 2633          	jrne	L537
1763                     ; 703     if (NewState != DISABLE)
1765  0195 0d03          	tnz	(OFST+2,sp)
1766  0197 2717          	jreq	L737
1767                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1769  0199 7b02          	ld	a,(OFST+1,sp)
1770  019b a40f          	and	a,#15
1771  019d 5f            	clrw	x
1772  019e 97            	ld	xl,a
1773  019f a601          	ld	a,#1
1774  01a1 5d            	tnzw	x
1775  01a2 2704          	jreq	L65
1776  01a4               L06:
1777  01a4 48            	sll	a
1778  01a5 5a            	decw	x
1779  01a6 26fc          	jrne	L06
1780  01a8               L65:
1781  01a8 ca50c4        	or	a,20676
1782  01ab c750c4        	ld	20676,a
1784  01ae 2049          	jra	L337
1785  01b0               L737:
1786                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1788  01b0 7b02          	ld	a,(OFST+1,sp)
1789  01b2 a40f          	and	a,#15
1790  01b4 5f            	clrw	x
1791  01b5 97            	ld	xl,a
1792  01b6 a601          	ld	a,#1
1793  01b8 5d            	tnzw	x
1794  01b9 2704          	jreq	L26
1795  01bb               L46:
1796  01bb 48            	sll	a
1797  01bc 5a            	decw	x
1798  01bd 26fc          	jrne	L46
1799  01bf               L26:
1800  01bf 43            	cpl	a
1801  01c0 c450c4        	and	a,20676
1802  01c3 c750c4        	ld	20676,a
1803  01c6 2031          	jra	L337
1804  01c8               L537:
1805                     ; 716     if (NewState != DISABLE)
1807  01c8 0d03          	tnz	(OFST+2,sp)
1808  01ca 2717          	jreq	L547
1809                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1811  01cc 7b02          	ld	a,(OFST+1,sp)
1812  01ce a40f          	and	a,#15
1813  01d0 5f            	clrw	x
1814  01d1 97            	ld	xl,a
1815  01d2 a601          	ld	a,#1
1816  01d4 5d            	tnzw	x
1817  01d5 2704          	jreq	L66
1818  01d7               L07:
1819  01d7 48            	sll	a
1820  01d8 5a            	decw	x
1821  01d9 26fc          	jrne	L07
1822  01db               L66:
1823  01db ca50d0        	or	a,20688
1824  01de c750d0        	ld	20688,a
1826  01e1 2016          	jra	L337
1827  01e3               L547:
1828                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1830  01e3 7b02          	ld	a,(OFST+1,sp)
1831  01e5 a40f          	and	a,#15
1832  01e7 5f            	clrw	x
1833  01e8 97            	ld	xl,a
1834  01e9 a601          	ld	a,#1
1835  01eb 5d            	tnzw	x
1836  01ec 2704          	jreq	L27
1837  01ee               L47:
1838  01ee 48            	sll	a
1839  01ef 5a            	decw	x
1840  01f0 26fc          	jrne	L47
1841  01f2               L27:
1842  01f2 43            	cpl	a
1843  01f3 c450d0        	and	a,20688
1844  01f6 c750d0        	ld	20688,a
1845  01f9               L337:
1846                     ; 727 }
1849  01f9 5b03          	addw	sp,#3
1850  01fb 81            	ret
1874                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1874                     ; 766 {
1875                     	switch	.text
1876  01fc               _CLK_LSEClockSecuritySystemEnable:
1880                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1882  01fc 72105190      	bset	20880,#0
1883                     ; 769 }
1886  0200 81            	ret
1910                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1910                     ; 778 {
1911                     	switch	.text
1912  0201               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1916                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1918  0201 72125190      	bset	20880,#1
1919                     ; 781 }
1922  0205 81            	ret
1997                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1997                     ; 808 {
1998                     	switch	.text
1999  0206               _CLK_HaltConfig:
2001  0206 89            	pushw	x
2002       00000000      OFST:	set	0
2005                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
2007                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
2009                     ; 813   if (NewState != DISABLE)
2011  0207 9f            	ld	a,xl
2012  0208 4d            	tnz	a
2013  0209 2709          	jreq	L5201
2014                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2016  020b 9e            	ld	a,xh
2017  020c ca50c2        	or	a,20674
2018  020f c750c2        	ld	20674,a
2020  0212 2009          	jra	L7201
2021  0214               L5201:
2022                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2024  0214 7b01          	ld	a,(OFST+1,sp)
2025  0216 43            	cpl	a
2026  0217 c450c2        	and	a,20674
2027  021a c750c2        	ld	20674,a
2028  021d               L7201:
2029                     ; 821 }
2032  021d 85            	popw	x
2033  021e 81            	ret
2069                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2069                     ; 832 {
2070                     	switch	.text
2071  021f               _CLK_MainRegulatorCmd:
2075                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2077                     ; 836   if (NewState != DISABLE)
2079  021f 4d            	tnz	a
2080  0220 2706          	jreq	L7401
2081                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2083  0222 721350cf      	bres	20687,#1
2085  0226 2004          	jra	L1501
2086  0228               L7401:
2087                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2089  0228 721250cf      	bset	20687,#1
2090  022c               L1501:
2091                     ; 846 }
2094  022c 81            	ret
2166                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2166                     ; 876 {
2167                     	switch	.text
2168  022d               _CLK_ITConfig:
2170  022d 89            	pushw	x
2171       00000000      OFST:	set	0
2174                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2176                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2178                     ; 882   if (NewState != DISABLE)
2180  022e 9f            	ld	a,xl
2181  022f 4d            	tnz	a
2182  0230 271d          	jreq	L7011
2183                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2185  0232 9e            	ld	a,xh
2186  0233 a11c          	cp	a,#28
2187  0235 2606          	jrne	L1111
2188                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2190  0237 721450c9      	bset	20681,#2
2192  023b 202e          	jra	L1211
2193  023d               L1111:
2194                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2196  023d 7b01          	ld	a,(OFST+1,sp)
2197  023f a12c          	cp	a,#44
2198  0241 2606          	jrne	L5111
2199                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2201  0243 72145190      	bset	20880,#2
2203  0247 2022          	jra	L1211
2204  0249               L5111:
2205                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2207  0249 721450ca      	bset	20682,#2
2208  024d 201c          	jra	L1211
2209  024f               L7011:
2210                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2212  024f 7b01          	ld	a,(OFST+1,sp)
2213  0251 a11c          	cp	a,#28
2214  0253 2606          	jrne	L3211
2215                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2217  0255 721550c9      	bres	20681,#2
2219  0259 2010          	jra	L1211
2220  025b               L3211:
2221                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2223  025b 7b01          	ld	a,(OFST+1,sp)
2224  025d a12c          	cp	a,#44
2225  025f 2606          	jrne	L7211
2226                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2228  0261 72155190      	bres	20880,#2
2230  0265 2004          	jra	L1211
2231  0267               L7211:
2232                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2234  0267 721550ca      	bres	20682,#2
2235  026b               L1211:
2236                     ; 918 }
2239  026b 85            	popw	x
2240  026c 81            	ret
2463                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2463                     ; 946 {
2464                     	switch	.text
2465  026d               _CLK_GetFlagStatus:
2467  026d 88            	push	a
2468  026e 89            	pushw	x
2469       00000002      OFST:	set	2
2472                     ; 947   uint8_t reg = 0;
2474                     ; 948   uint8_t pos = 0;
2476                     ; 949   FlagStatus bitstatus = RESET;
2478                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2480                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2482  026f a4f0          	and	a,#240
2483  0271 6b02          	ld	(OFST+0,sp),a
2485                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2487  0273 7b03          	ld	a,(OFST+1,sp)
2488  0275 a40f          	and	a,#15
2489  0277 6b01          	ld	(OFST-1,sp),a
2491                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2493  0279 0d02          	tnz	(OFST+0,sp)
2494  027b 2607          	jrne	L7421
2495                     ; 962     reg = CLK->CRTCR;
2497  027d c650c1        	ld	a,20673
2498  0280 6b02          	ld	(OFST+0,sp),a
2501  0282 2060          	jra	L1521
2502  0284               L7421:
2503                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2505  0284 7b02          	ld	a,(OFST+0,sp)
2506  0286 a110          	cp	a,#16
2507  0288 2607          	jrne	L3521
2508                     ; 966     reg = CLK->ICKCR;
2510  028a c650c2        	ld	a,20674
2511  028d 6b02          	ld	(OFST+0,sp),a
2514  028f 2053          	jra	L1521
2515  0291               L3521:
2516                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2518  0291 7b02          	ld	a,(OFST+0,sp)
2519  0293 a120          	cp	a,#32
2520  0295 2607          	jrne	L7521
2521                     ; 970     reg = CLK->CCOR;
2523  0297 c650c5        	ld	a,20677
2524  029a 6b02          	ld	(OFST+0,sp),a
2527  029c 2046          	jra	L1521
2528  029e               L7521:
2529                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2531  029e 7b02          	ld	a,(OFST+0,sp)
2532  02a0 a130          	cp	a,#48
2533  02a2 2607          	jrne	L3621
2534                     ; 974     reg = CLK->ECKCR;
2536  02a4 c650c6        	ld	a,20678
2537  02a7 6b02          	ld	(OFST+0,sp),a
2540  02a9 2039          	jra	L1521
2541  02ab               L3621:
2542                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2544  02ab 7b02          	ld	a,(OFST+0,sp)
2545  02ad a140          	cp	a,#64
2546  02af 2607          	jrne	L7621
2547                     ; 978     reg = CLK->SWCR;
2549  02b1 c650c9        	ld	a,20681
2550  02b4 6b02          	ld	(OFST+0,sp),a
2553  02b6 202c          	jra	L1521
2554  02b8               L7621:
2555                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2557  02b8 7b02          	ld	a,(OFST+0,sp)
2558  02ba a150          	cp	a,#80
2559  02bc 2607          	jrne	L3721
2560                     ; 982     reg = CLK->CSSR;
2562  02be c650ca        	ld	a,20682
2563  02c1 6b02          	ld	(OFST+0,sp),a
2566  02c3 201f          	jra	L1521
2567  02c5               L3721:
2568                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2570  02c5 7b02          	ld	a,(OFST+0,sp)
2571  02c7 a170          	cp	a,#112
2572  02c9 2607          	jrne	L7721
2573                     ; 986     reg = CLK->REGCSR;
2575  02cb c650cf        	ld	a,20687
2576  02ce 6b02          	ld	(OFST+0,sp),a
2579  02d0 2012          	jra	L1521
2580  02d2               L7721:
2581                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2583  02d2 7b02          	ld	a,(OFST+0,sp)
2584  02d4 a180          	cp	a,#128
2585  02d6 2607          	jrne	L3031
2586                     ; 990     reg = CSSLSE->CSR;
2588  02d8 c65190        	ld	a,20880
2589  02db 6b02          	ld	(OFST+0,sp),a
2592  02dd 2005          	jra	L1521
2593  02df               L3031:
2594                     ; 994     reg = CLK->CBEEPR;
2596  02df c650cb        	ld	a,20683
2597  02e2 6b02          	ld	(OFST+0,sp),a
2599  02e4               L1521:
2600                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2602  02e4 7b01          	ld	a,(OFST-1,sp)
2603  02e6 5f            	clrw	x
2604  02e7 97            	ld	xl,a
2605  02e8 a601          	ld	a,#1
2606  02ea 5d            	tnzw	x
2607  02eb 2704          	jreq	L211
2608  02ed               L411:
2609  02ed 48            	sll	a
2610  02ee 5a            	decw	x
2611  02ef 26fc          	jrne	L411
2612  02f1               L211:
2613  02f1 1402          	and	a,(OFST+0,sp)
2614  02f3 2706          	jreq	L7031
2615                     ; 1000     bitstatus = SET;
2617  02f5 a601          	ld	a,#1
2618  02f7 6b02          	ld	(OFST+0,sp),a
2621  02f9 2002          	jra	L1131
2622  02fb               L7031:
2623                     ; 1004     bitstatus = RESET;
2625  02fb 0f02          	clr	(OFST+0,sp)
2627  02fd               L1131:
2628                     ; 1008   return((FlagStatus)bitstatus);
2630  02fd 7b02          	ld	a,(OFST+0,sp)
2633  02ff 5b03          	addw	sp,#3
2634  0301 81            	ret
2657                     ; 1016 void CLK_ClearFlag(void)
2657                     ; 1017 {
2658                     	switch	.text
2659  0302               _CLK_ClearFlag:
2663                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2665  0302 72175190      	bres	20880,#3
2666                     ; 1021 }
2669  0306 81            	ret
2715                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2715                     ; 1033 {
2716                     	switch	.text
2717  0307               _CLK_GetITStatus:
2719  0307 88            	push	a
2720  0308 88            	push	a
2721       00000001      OFST:	set	1
2724                     ; 1035   ITStatus bitstatus = RESET;
2726                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2728                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2730  0309 a11c          	cp	a,#28
2731  030b 2611          	jrne	L5431
2732                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2734  030d c450c9        	and	a,20681
2735  0310 a10c          	cp	a,#12
2736  0312 2606          	jrne	L7431
2737                     ; 1045       bitstatus = SET;
2739  0314 a601          	ld	a,#1
2740  0316 6b01          	ld	(OFST+0,sp),a
2743  0318 202e          	jra	L3531
2744  031a               L7431:
2745                     ; 1049       bitstatus = RESET;
2747  031a 0f01          	clr	(OFST+0,sp)
2749  031c 202a          	jra	L3531
2750  031e               L5431:
2751                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2753  031e 7b02          	ld	a,(OFST+1,sp)
2754  0320 a12c          	cp	a,#44
2755  0322 2613          	jrne	L5531
2756                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2758  0324 c65190        	ld	a,20880
2759  0327 1402          	and	a,(OFST+1,sp)
2760  0329 a10c          	cp	a,#12
2761  032b 2606          	jrne	L7531
2762                     ; 1057       bitstatus = SET;
2764  032d a601          	ld	a,#1
2765  032f 6b01          	ld	(OFST+0,sp),a
2768  0331 2015          	jra	L3531
2769  0333               L7531:
2770                     ; 1061       bitstatus = RESET;
2772  0333 0f01          	clr	(OFST+0,sp)
2774  0335 2011          	jra	L3531
2775  0337               L5531:
2776                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2778  0337 c650ca        	ld	a,20682
2779  033a 1402          	and	a,(OFST+1,sp)
2780  033c a10c          	cp	a,#12
2781  033e 2606          	jrne	L5631
2782                     ; 1069       bitstatus = SET;
2784  0340 a601          	ld	a,#1
2785  0342 6b01          	ld	(OFST+0,sp),a
2788  0344 2002          	jra	L3531
2789  0346               L5631:
2790                     ; 1073       bitstatus = RESET;
2792  0346 0f01          	clr	(OFST+0,sp)
2794  0348               L3531:
2795                     ; 1078   return bitstatus;
2797  0348 7b01          	ld	a,(OFST+0,sp)
2800  034a 85            	popw	x
2801  034b 81            	ret
2837                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2837                     ; 1090 {
2838                     	switch	.text
2839  034c               _CLK_ClearITPendingBit:
2843                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2845                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2847  034c a4f0          	and	a,#240
2848  034e a120          	cp	a,#32
2849  0350 2606          	jrne	L7041
2850                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2852  0352 72175190      	bres	20880,#3
2854  0356 2004          	jra	L1141
2855  0358               L7041:
2856                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2858  0358 721750c9      	bres	20681,#3
2859  035c               L1141:
2860                     ; 1105 }
2863  035c 81            	ret
2888                     	xdef	_SYSDivFactor
2889                     	xdef	_CLK_ClearITPendingBit
2890                     	xdef	_CLK_GetITStatus
2891                     	xdef	_CLK_ClearFlag
2892                     	xdef	_CLK_GetFlagStatus
2893                     	xdef	_CLK_ITConfig
2894                     	xdef	_CLK_MainRegulatorCmd
2895                     	xdef	_CLK_HaltConfig
2896                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2897                     	xdef	_CLK_LSEClockSecuritySystemEnable
2898                     	xdef	_CLK_PeripheralClockConfig
2899                     	xdef	_CLK_BEEPClockConfig
2900                     	xdef	_CLK_RTCClockConfig
2901                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2902                     	xdef	_CLK_SYSCLKDivConfig
2903                     	xdef	_CLK_GetClockFreq
2904                     	xdef	_CLK_GetSYSCLKSource
2905                     	xdef	_CLK_SYSCLKSourceConfig
2906                     	xdef	_CLK_CCOConfig
2907                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2908                     	xdef	_CLK_ClockSecuritySystemEnable
2909                     	xdef	_CLK_LSEConfig
2910                     	xdef	_CLK_HSEConfig
2911                     	xdef	_CLK_LSICmd
2912                     	xdef	_CLK_AdjustHSICalibrationValue
2913                     	xdef	_CLK_HSICmd
2914                     	xdef	_CLK_DeInit
2915                     	xref.b	c_lreg
2916                     	xref.b	c_x
2935                     	xref	c_ludv
2936                     	xref	c_rtol
2937                     	xref	c_ltor
2938                     	end
