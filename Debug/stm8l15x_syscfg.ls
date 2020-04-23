   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 119 void SYSCFG_RIDeInit(void)
  43                     ; 120 {
  45                     	switch	.text
  46  0000               _SYSCFG_RIDeInit:
  50                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  52  0000 725f5431      	clr	21553
  53                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  55  0004 725f5432      	clr	21554
  56                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  58  0008 725f5439      	clr	21561
  59                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  61  000c 725f543a      	clr	21562
  62                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  64  0010 725f543b      	clr	21563
  65                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  67  0014 725f5457      	clr	21591
  68                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  70  0018 725f543d      	clr	21565
  71                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  73  001c 725f543e      	clr	21566
  74                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  76  0020 725f543f      	clr	21567
  77                     ; 130 }
  80  0024 81            	ret
 339                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 339                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 339                     ; 144 {
 340                     	switch	.text
 341  0025               _SYSCFG_RITIMInputCaptureConfig:
 343  0025 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 349                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 351                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 353  0026 9e            	ld	a,xh
 354  0027 a102          	cp	a,#2
 355  0029 2606          	jrne	L531
 356                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 358  002b 9f            	ld	a,xl
 359  002c c75431        	ld	21553,a
 361  002f 2005          	jra	L731
 362  0031               L531:
 363                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 365  0031 7b02          	ld	a,(OFST+2,sp)
 366  0033 c75432        	ld	21554,a
 367  0036               L731:
 368                     ; 161 }
 371  0036 85            	popw	x
 372  0037 81            	ret
 554                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 185                                  FunctionalState NewState)
 554                     ; 186 {
 555                     	switch	.text
 556  0038               _SYSCFG_RIAnalogSwitchConfig:
 558  0038 89            	pushw	x
 559  0039 89            	pushw	x
 560       00000002      OFST:	set	2
 563                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 565                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 567                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 571  003a 9e            	ld	a,xh
 572  003b a4f0          	and	a,#240
 573  003d 6b01          	ld	(OFST-1,sp),a
 575                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 577  003f 7b03          	ld	a,(OFST+1,sp)
 578  0041 a40f          	and	a,#15
 579  0043 6b02          	ld	(OFST+0,sp),a
 581                     ; 199   if (NewState != DISABLE)
 583  0045 0d04          	tnz	(OFST+2,sp)
 584  0047 2730          	jreq	L142
 585                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 587  0049 7b01          	ld	a,(OFST-1,sp)
 588  004b a110          	cp	a,#16
 589  004d 2615          	jrne	L342
 590                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 592  004f 7b02          	ld	a,(OFST+0,sp)
 593  0051 5f            	clrw	x
 594  0052 97            	ld	xl,a
 595  0053 a601          	ld	a,#1
 596  0055 5d            	tnzw	x
 597  0056 2704          	jreq	L21
 598  0058               L41:
 599  0058 48            	sll	a
 600  0059 5a            	decw	x
 601  005a 26fc          	jrne	L41
 602  005c               L21:
 603  005c ca543d        	or	a,21565
 604  005f c7543d        	ld	21565,a
 606  0062 2045          	jra	L742
 607  0064               L342:
 608                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 610  0064 7b02          	ld	a,(OFST+0,sp)
 611  0066 5f            	clrw	x
 612  0067 97            	ld	xl,a
 613  0068 a601          	ld	a,#1
 614  006a 5d            	tnzw	x
 615  006b 2704          	jreq	L61
 616  006d               L02:
 617  006d 48            	sll	a
 618  006e 5a            	decw	x
 619  006f 26fc          	jrne	L02
 620  0071               L61:
 621  0071 ca543e        	or	a,21566
 622  0074 c7543e        	ld	21566,a
 623  0077 2030          	jra	L742
 624  0079               L142:
 625                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 627  0079 7b01          	ld	a,(OFST-1,sp)
 628  007b a110          	cp	a,#16
 629  007d 2616          	jrne	L152
 630                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 632  007f 7b02          	ld	a,(OFST+0,sp)
 633  0081 5f            	clrw	x
 634  0082 97            	ld	xl,a
 635  0083 a601          	ld	a,#1
 636  0085 5d            	tnzw	x
 637  0086 2704          	jreq	L22
 638  0088               L42:
 639  0088 48            	sll	a
 640  0089 5a            	decw	x
 641  008a 26fc          	jrne	L42
 642  008c               L22:
 643  008c 43            	cpl	a
 644  008d c4543d        	and	a,21565
 645  0090 c7543d        	ld	21565,a
 647  0093 2014          	jra	L742
 648  0095               L152:
 649                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 651  0095 7b02          	ld	a,(OFST+0,sp)
 652  0097 5f            	clrw	x
 653  0098 97            	ld	xl,a
 654  0099 a601          	ld	a,#1
 655  009b 5d            	tnzw	x
 656  009c 2704          	jreq	L62
 657  009e               L03:
 658  009e 48            	sll	a
 659  009f 5a            	decw	x
 660  00a0 26fc          	jrne	L03
 661  00a2               L62:
 662  00a2 43            	cpl	a
 663  00a3 c4543e        	and	a,21566
 664  00a6 c7543e        	ld	21566,a
 665  00a9               L742:
 666                     ; 225 }
 669  00a9 5b04          	addw	sp,#4
 670  00ab 81            	ret
 936                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 936                     ; 235                              FunctionalState NewState)
 936                     ; 236 {
 937                     	switch	.text
 938  00ac               _SYSCFG_RIIOSwitchConfig:
 940  00ac 89            	pushw	x
 941  00ad 89            	pushw	x
 942       00000002      OFST:	set	2
 945                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 947                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 949                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 951                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 953  00ae 9e            	ld	a,xh
 954  00af a40f          	and	a,#15
 955  00b1 6b02          	ld	(OFST+0,sp),a
 957                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 959  00b3 7b03          	ld	a,(OFST+1,sp)
 960  00b5 a4f0          	and	a,#240
 961  00b7 6b01          	ld	(OFST-1,sp),a
 963                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 965  00b9 7b01          	ld	a,(OFST-1,sp)
 966  00bb a110          	cp	a,#16
 967  00bd 2633          	jrne	L304
 968                     ; 252     if (NewState != DISABLE)
 970  00bf 0d04          	tnz	(OFST+2,sp)
 971  00c1 2717          	jreq	L504
 972                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 974  00c3 7b02          	ld	a,(OFST+0,sp)
 975  00c5 5f            	clrw	x
 976  00c6 97            	ld	xl,a
 977  00c7 a601          	ld	a,#1
 978  00c9 5d            	tnzw	x
 979  00ca 2704          	jreq	L43
 980  00cc               L63:
 981  00cc 48            	sll	a
 982  00cd 5a            	decw	x
 983  00ce 26fc          	jrne	L63
 984  00d0               L43:
 985  00d0 ca5439        	or	a,21561
 986  00d3 c75439        	ld	21561,a
 988  00d6 ac890189      	jpf	L114
 989  00da               L504:
 990                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 992  00da 7b02          	ld	a,(OFST+0,sp)
 993  00dc 5f            	clrw	x
 994  00dd 97            	ld	xl,a
 995  00de a601          	ld	a,#1
 996  00e0 5d            	tnzw	x
 997  00e1 2704          	jreq	L04
 998  00e3               L24:
 999  00e3 48            	sll	a
1000  00e4 5a            	decw	x
1001  00e5 26fc          	jrne	L24
1002  00e7               L04:
1003  00e7 43            	cpl	a
1004  00e8 c45439        	and	a,21561
1005  00eb c75439        	ld	21561,a
1006  00ee ac890189      	jpf	L114
1007  00f2               L304:
1008                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1010  00f2 7b01          	ld	a,(OFST-1,sp)
1011  00f4 a120          	cp	a,#32
1012  00f6 262f          	jrne	L314
1013                     ; 267     if (NewState != DISABLE)
1015  00f8 0d04          	tnz	(OFST+2,sp)
1016  00fa 2715          	jreq	L514
1017                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1019  00fc 7b02          	ld	a,(OFST+0,sp)
1020  00fe 5f            	clrw	x
1021  00ff 97            	ld	xl,a
1022  0100 a601          	ld	a,#1
1023  0102 5d            	tnzw	x
1024  0103 2704          	jreq	L44
1025  0105               L64:
1026  0105 48            	sll	a
1027  0106 5a            	decw	x
1028  0107 26fc          	jrne	L64
1029  0109               L44:
1030  0109 ca543a        	or	a,21562
1031  010c c7543a        	ld	21562,a
1033  010f 2078          	jra	L114
1034  0111               L514:
1035                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1037  0111 7b02          	ld	a,(OFST+0,sp)
1038  0113 5f            	clrw	x
1039  0114 97            	ld	xl,a
1040  0115 a601          	ld	a,#1
1041  0117 5d            	tnzw	x
1042  0118 2704          	jreq	L05
1043  011a               L25:
1044  011a 48            	sll	a
1045  011b 5a            	decw	x
1046  011c 26fc          	jrne	L25
1047  011e               L05:
1048  011e 43            	cpl	a
1049  011f c4543a        	and	a,21562
1050  0122 c7543a        	ld	21562,a
1051  0125 2062          	jra	L114
1052  0127               L314:
1053                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1055  0127 7b01          	ld	a,(OFST-1,sp)
1056  0129 a130          	cp	a,#48
1057  012b 262f          	jrne	L324
1058                     ; 282     if (NewState != DISABLE)
1060  012d 0d04          	tnz	(OFST+2,sp)
1061  012f 2715          	jreq	L524
1062                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1064  0131 7b02          	ld	a,(OFST+0,sp)
1065  0133 5f            	clrw	x
1066  0134 97            	ld	xl,a
1067  0135 a601          	ld	a,#1
1068  0137 5d            	tnzw	x
1069  0138 2704          	jreq	L45
1070  013a               L65:
1071  013a 48            	sll	a
1072  013b 5a            	decw	x
1073  013c 26fc          	jrne	L65
1074  013e               L45:
1075  013e ca543b        	or	a,21563
1076  0141 c7543b        	ld	21563,a
1078  0144 2043          	jra	L114
1079  0146               L524:
1080                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1082  0146 7b02          	ld	a,(OFST+0,sp)
1083  0148 5f            	clrw	x
1084  0149 97            	ld	xl,a
1085  014a a601          	ld	a,#1
1086  014c 5d            	tnzw	x
1087  014d 2704          	jreq	L06
1088  014f               L26:
1089  014f 48            	sll	a
1090  0150 5a            	decw	x
1091  0151 26fc          	jrne	L26
1092  0153               L06:
1093  0153 43            	cpl	a
1094  0154 c4543b        	and	a,21563
1095  0157 c7543b        	ld	21563,a
1096  015a 202d          	jra	L114
1097  015c               L324:
1098                     ; 297     if (NewState != DISABLE)
1100  015c 0d04          	tnz	(OFST+2,sp)
1101  015e 2715          	jreq	L334
1102                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1104  0160 7b02          	ld	a,(OFST+0,sp)
1105  0162 5f            	clrw	x
1106  0163 97            	ld	xl,a
1107  0164 a601          	ld	a,#1
1108  0166 5d            	tnzw	x
1109  0167 2704          	jreq	L46
1110  0169               L66:
1111  0169 48            	sll	a
1112  016a 5a            	decw	x
1113  016b 26fc          	jrne	L66
1114  016d               L46:
1115  016d ca5457        	or	a,21591
1116  0170 c75457        	ld	21591,a
1118  0173 2014          	jra	L114
1119  0175               L334:
1120                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1122  0175 7b02          	ld	a,(OFST+0,sp)
1123  0177 5f            	clrw	x
1124  0178 97            	ld	xl,a
1125  0179 a601          	ld	a,#1
1126  017b 5d            	tnzw	x
1127  017c 2704          	jreq	L07
1128  017e               L27:
1129  017e 48            	sll	a
1130  017f 5a            	decw	x
1131  0180 26fc          	jrne	L27
1132  0182               L07:
1133  0182 43            	cpl	a
1134  0183 c45457        	and	a,21591
1135  0186 c75457        	ld	21591,a
1136  0189               L114:
1137                     ; 308 }
1140  0189 5b04          	addw	sp,#4
1141  018b 81            	ret
1221                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1221                     ; 321 {
1222                     	switch	.text
1223  018c               _SYSCFG_RIResistorConfig:
1225  018c 89            	pushw	x
1226       00000000      OFST:	set	0
1229                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1231                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1233                     ; 326   if (NewState != DISABLE)
1235  018d 9f            	ld	a,xl
1236  018e 4d            	tnz	a
1237  018f 2709          	jreq	L574
1238                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1240  0191 9e            	ld	a,xh
1241  0192 ca543f        	or	a,21567
1242  0195 c7543f        	ld	21567,a
1244  0198 2009          	jra	L774
1245  019a               L574:
1246                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1248  019a 7b01          	ld	a,(OFST+1,sp)
1249  019c 43            	cpl	a
1250  019d c4543f        	and	a,21567
1251  01a0 c7543f        	ld	21567,a
1252  01a3               L774:
1253                     ; 336 }
1256  01a3 85            	popw	x
1257  01a4 81            	ret
1280                     ; 368 void SYSCFG_REMAPDeInit(void)
1280                     ; 369 {
1281                     	switch	.text
1282  01a5               _SYSCFG_REMAPDeInit:
1286                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1288  01a5 350c509e      	mov	20638,#12
1289                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1291  01a9 725f509f      	clr	20639
1292                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1294  01ad 725f509d      	clr	20637
1295                     ; 378 }
1298  01b1 81            	ret
1516                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1516                     ; 412 {
1517                     	switch	.text
1518  01b2               _SYSCFG_REMAPPinConfig:
1520  01b2 89            	pushw	x
1521  01b3 88            	push	a
1522       00000001      OFST:	set	1
1525                     ; 413   uint8_t regindex = 0;
1527                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1529                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1531                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1533  01b4 9e            	ld	a,xh
1534  01b5 6b01          	ld	(OFST+0,sp),a
1536                     ; 422   if (regindex == 0x01)
1538  01b7 7b01          	ld	a,(OFST+0,sp)
1539  01b9 a101          	cp	a,#1
1540  01bb 261e          	jrne	L316
1541                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1543  01bd 9f            	ld	a,xl
1544  01be 97            	ld	xl,a
1545  01bf a610          	ld	a,#16
1546  01c1 42            	mul	x,a
1547  01c2 9f            	ld	a,xl
1548  01c3 aa0f          	or	a,#15
1549  01c5 c4509e        	and	a,20638
1550  01c8 c7509e        	ld	20638,a
1551                     ; 425     if (NewState != DISABLE)
1553  01cb 0d06          	tnz	(OFST+5,sp)
1554  01cd 2742          	jreq	L716
1555                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1557  01cf 7b03          	ld	a,(OFST+2,sp)
1558  01d1 a4f0          	and	a,#240
1559  01d3 ca509e        	or	a,20638
1560  01d6 c7509e        	ld	20638,a
1561  01d9 2036          	jra	L716
1562  01db               L316:
1563                     ; 431   else if (regindex == 0x02)
1565  01db 7b01          	ld	a,(OFST+0,sp)
1566  01dd a102          	cp	a,#2
1567  01df 2619          	jrne	L126
1568                     ; 433     if (NewState != DISABLE)
1570  01e1 0d06          	tnz	(OFST+5,sp)
1571  01e3 270a          	jreq	L326
1572                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1574  01e5 c6509f        	ld	a,20639
1575  01e8 1a03          	or	a,(OFST+2,sp)
1576  01ea c7509f        	ld	20639,a
1578  01ed 2022          	jra	L716
1579  01ef               L326:
1580                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1582  01ef 7b03          	ld	a,(OFST+2,sp)
1583  01f1 43            	cpl	a
1584  01f2 c4509f        	and	a,20639
1585  01f5 c7509f        	ld	20639,a
1586  01f8 2017          	jra	L716
1587  01fa               L126:
1588                     ; 445     if (NewState != DISABLE)
1590  01fa 0d06          	tnz	(OFST+5,sp)
1591  01fc 270a          	jreq	L136
1592                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1594  01fe c6509d        	ld	a,20637
1595  0201 1a03          	or	a,(OFST+2,sp)
1596  0203 c7509d        	ld	20637,a
1598  0206 2009          	jra	L716
1599  0208               L136:
1600                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1602  0208 7b03          	ld	a,(OFST+2,sp)
1603  020a 43            	cpl	a
1604  020b c4509d        	and	a,20637
1605  020e c7509d        	ld	20637,a
1606  0211               L716:
1607                     ; 454 }
1610  0211 5b03          	addw	sp,#3
1611  0213 81            	ret
1717                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1717                     ; 471 {
1718                     	switch	.text
1719  0214               _SYSCFG_REMAPDMAChannelConfig:
1721  0214 88            	push	a
1722       00000000      OFST:	set	0
1725                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1727                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1729  0215 a5f0          	bcp	a,#240
1730  0217 270a          	jreq	L776
1731                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1733  0219 c6509e        	ld	a,20638
1734  021c a4f3          	and	a,#243
1735  021e c7509e        	ld	20638,a
1737  0221 2008          	jra	L107
1738  0223               L776:
1739                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1741  0223 c6509e        	ld	a,20638
1742  0226 a4fc          	and	a,#252
1743  0228 c7509e        	ld	20638,a
1744  022b               L107:
1745                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1747  022b 7b01          	ld	a,(OFST+1,sp)
1748  022d a40f          	and	a,#15
1749  022f ca509e        	or	a,20638
1750  0232 c7509e        	ld	20638,a
1751                     ; 489 }
1754  0235 84            	pop	a
1755  0236 81            	ret
1768                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1769                     	xdef	_SYSCFG_REMAPPinConfig
1770                     	xdef	_SYSCFG_REMAPDeInit
1771                     	xdef	_SYSCFG_RIResistorConfig
1772                     	xdef	_SYSCFG_RIIOSwitchConfig
1773                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1774                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1775                     	xdef	_SYSCFG_RIDeInit
1794                     	end
