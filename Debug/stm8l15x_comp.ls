   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 111 void COMP_DeInit(void)
  43                     ; 112 {
  45                     	switch	.text
  46  0000               _COMP_DeInit:
  50                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  52  0000 725f5440      	clr	21568
  53                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  55  0004 725f5441      	clr	21569
  56                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  58  0008 35c05442      	mov	21570,#192
  59                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  61  000c 725f5443      	clr	21571
  62                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  64  0010 725f5444      	clr	21572
  65                     ; 127 }
  68  0014 81            	ret
 244                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 244                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 244                     ; 155 {
 245                     	switch	.text
 246  0015               _COMP_Init:
 248  0015 89            	pushw	x
 249       00000000      OFST:	set	0
 252                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 254                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 256                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 258                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 260  0016 c65442        	ld	a,21570
 261  0019 a4c7          	and	a,#199
 262  001b c75442        	ld	21570,a
 263                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 265  001e 9e            	ld	a,xh
 266  001f ca5442        	or	a,21570
 267  0022 c75442        	ld	21570,a
 268                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 270  0025 c65442        	ld	a,21570
 271  0028 a43f          	and	a,#63
 272  002a c75442        	ld	21570,a
 273                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 275  002d 9f            	ld	a,xl
 276  002e ca5442        	or	a,21570
 277  0031 c75442        	ld	21570,a
 278                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 280  0034 72155441      	bres	21569,#2
 281                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 283  0038 c65441        	ld	a,21569
 284  003b 1a05          	or	a,(OFST+5,sp)
 285  003d c75441        	ld	21569,a
 286                     ; 175 }
 289  0040 85            	popw	x
 290  0041 81            	ret
 346                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 346                     ; 184 {
 347                     	switch	.text
 348  0042               _COMP_VrefintToCOMP1Connect:
 352                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 354                     ; 188   if (NewState != DISABLE)
 356  0042 4d            	tnz	a
 357  0043 2706          	jreq	L341
 358                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 360  0045 72145442      	bset	21570,#2
 362  0049 2004          	jra	L541
 363  004b               L341:
 364                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 366  004b 72155442      	bres	21570,#2
 367  004f               L541:
 368                     ; 198 }
 371  004f 81            	ret
 466                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 466                     ; 213 {
 467                     	switch	.text
 468  0050               _COMP_EdgeConfig:
 470  0050 89            	pushw	x
 471       00000000      OFST:	set	0
 474                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 476                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 478                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 480  0051 9e            	ld	a,xh
 481  0052 a101          	cp	a,#1
 482  0054 2611          	jrne	L312
 483                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 485  0056 c65440        	ld	a,21568
 486  0059 a4fc          	and	a,#252
 487  005b c75440        	ld	21568,a
 488                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 490  005e 9f            	ld	a,xl
 491  005f ca5440        	or	a,21568
 492  0062 c75440        	ld	21568,a
 494  0065 2010          	jra	L512
 495  0067               L312:
 496                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 498  0067 c65441        	ld	a,21569
 499  006a a4fc          	and	a,#252
 500  006c c75441        	ld	21569,a
 501                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 503  006f c65441        	ld	a,21569
 504  0072 1a02          	or	a,(OFST+2,sp)
 505  0074 c75441        	ld	21569,a
 506  0077               L512:
 507                     ; 236 }
 510  0077 85            	popw	x
 511  0078 81            	ret
 579                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 579                     ; 252 {
 580                     	switch	.text
 581  0079               _COMP_GetOutputLevel:
 583  0079 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 589                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 591  007a a101          	cp	a,#1
 592  007c 2611          	jrne	L152
 593                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 595  007e c65440        	ld	a,21568
 596  0081 a508          	bcp	a,#8
 597  0083 2706          	jreq	L352
 598                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 600  0085 a601          	ld	a,#1
 601  0087 6b01          	ld	(OFST+0,sp),a
 604  0089 2013          	jra	L752
 605  008b               L352:
 606                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 608  008b 0f01          	clr	(OFST+0,sp)
 610  008d 200f          	jra	L752
 611  008f               L152:
 612                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 614  008f c65441        	ld	a,21569
 615  0092 a508          	bcp	a,#8
 616  0094 2706          	jreq	L162
 617                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 619  0096 a601          	ld	a,#1
 620  0098 6b01          	ld	(OFST+0,sp),a
 623  009a 2002          	jra	L752
 624  009c               L162:
 625                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 627  009c 0f01          	clr	(OFST+0,sp)
 629  009e               L752:
 630                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 632  009e 7b01          	ld	a,(OFST+0,sp)
 635  00a0 5b01          	addw	sp,#1
 636  00a2 81            	ret
 671                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 671                     ; 325 {
 672                     	switch	.text
 673  00a3               _COMP_WindowCmd:
 677                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 679                     ; 329   if (NewState != DISABLE)
 681  00a3 4d            	tnz	a
 682  00a4 2706          	jreq	L303
 683                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 685  00a6 72125442      	bset	21570,#1
 687  00aa 2004          	jra	L503
 688  00ac               L303:
 689                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 691  00ac 72135442      	bres	21570,#1
 692  00b0               L503:
 693                     ; 339 }
 696  00b0 81            	ret
 732                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 732                     ; 363 {
 733                     	switch	.text
 734  00b1               _COMP_VrefintOutputCmd:
 738                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 740                     ; 367   if (NewState != DISABLE)
 742  00b1 4d            	tnz	a
 743  00b2 2706          	jreq	L523
 744                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 746  00b4 72105442      	bset	21570,#0
 748  00b8 2004          	jra	L723
 749  00ba               L523:
 750                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 752  00ba 72115442      	bres	21570,#0
 753  00be               L723:
 754                     ; 377 }
 757  00be 81            	ret
 793                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 793                     ; 402 {
 794                     	switch	.text
 795  00bf               _COMP_SchmittTriggerCmd:
 799                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 801                     ; 406   if (NewState != DISABLE)
 803  00bf 4d            	tnz	a
 804  00c0 2706          	jreq	L743
 805                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 807  00c2 72145440      	bset	21568,#2
 809  00c6 2004          	jra	L153
 810  00c8               L743:
 811                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 813  00c8 72155440      	bres	21568,#2
 814  00cc               L153:
 815                     ; 416 }
 818  00cc 81            	ret
 938                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 938                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 938                     ; 437                         FunctionalState NewState)
 938                     ; 438 {
 939                     	switch	.text
 940  00cd               _COMP_TriggerConfig:
 942  00cd 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 948                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 950                     ; 443   switch (COMP_TriggerGroup)
 952  00ce 9e            	ld	a,xh
 954                     ; 490     default:
 954                     ; 491       break;
 955  00cf 4a            	dec	a
 956  00d0 270b          	jreq	L353
 957  00d2 4a            	dec	a
 958  00d3 2721          	jreq	L553
 959  00d5 4a            	dec	a
 960  00d6 273d          	jreq	L753
 961  00d8 4a            	dec	a
 962  00d9 2753          	jreq	L163
 963  00db 206e          	jra	L344
 964  00dd               L353:
 965                     ; 445     case COMP_TriggerGroup_InvertingInput:
 965                     ; 446 
 965                     ; 447       if (NewState != DISABLE)
 967  00dd 0d05          	tnz	(OFST+5,sp)
 968  00df 270b          	jreq	L544
 969                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 971  00e1 7b02          	ld	a,(OFST+2,sp)
 972  00e3 43            	cpl	a
 973  00e4 c45443        	and	a,21571
 974  00e7 c75443        	ld	21571,a
 976  00ea 205f          	jra	L344
 977  00ec               L544:
 978                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 980  00ec c65443        	ld	a,21571
 981  00ef 1a02          	or	a,(OFST+2,sp)
 982  00f1 c75443        	ld	21571,a
 983  00f4 2055          	jra	L344
 984  00f6               L553:
 985                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 985                     ; 458       if (NewState != DISABLE)
 987  00f6 0d05          	tnz	(OFST+5,sp)
 988  00f8 270e          	jreq	L154
 989                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 991  00fa 7b02          	ld	a,(OFST+2,sp)
 992  00fc 48            	sll	a
 993  00fd 48            	sll	a
 994  00fe 48            	sll	a
 995  00ff 43            	cpl	a
 996  0100 c45443        	and	a,21571
 997  0103 c75443        	ld	21571,a
 999  0106 2043          	jra	L344
1000  0108               L154:
1001                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1003  0108 7b02          	ld	a,(OFST+2,sp)
1004  010a 48            	sll	a
1005  010b 48            	sll	a
1006  010c 48            	sll	a
1007  010d ca5443        	or	a,21571
1008  0110 c75443        	ld	21571,a
1009  0113 2036          	jra	L344
1010  0115               L753:
1011                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1011                     ; 469       if (NewState != DISABLE)
1013  0115 0d05          	tnz	(OFST+5,sp)
1014  0117 270b          	jreq	L554
1015                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1017  0119 7b02          	ld	a,(OFST+2,sp)
1018  011b 43            	cpl	a
1019  011c c45444        	and	a,21572
1020  011f c75444        	ld	21572,a
1022  0122 2027          	jra	L344
1023  0124               L554:
1024                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1026  0124 c65444        	ld	a,21572
1027  0127 1a02          	or	a,(OFST+2,sp)
1028  0129 c75444        	ld	21572,a
1029  012c 201d          	jra	L344
1030  012e               L163:
1031                     ; 479     case COMP_TriggerGroup_DACOutput:
1031                     ; 480       if (NewState != DISABLE)
1033  012e 0d05          	tnz	(OFST+5,sp)
1034  0130 270e          	jreq	L164
1035                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1037  0132 7b02          	ld	a,(OFST+2,sp)
1038  0134 48            	sll	a
1039  0135 48            	sll	a
1040  0136 48            	sll	a
1041  0137 43            	cpl	a
1042  0138 c45444        	and	a,21572
1043  013b c75444        	ld	21572,a
1045  013e 200b          	jra	L344
1046  0140               L164:
1047                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1049  0140 7b02          	ld	a,(OFST+2,sp)
1050  0142 48            	sll	a
1051  0143 48            	sll	a
1052  0144 48            	sll	a
1053  0145 ca5444        	or	a,21572
1054  0148 c75444        	ld	21572,a
1055  014b               L363:
1056                     ; 490     default:
1056                     ; 491       break;
1058  014b               L344:
1059                     ; 493 }
1062  014b 85            	popw	x
1063  014c 81            	ret
1108                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1108                     ; 522 {
1109                     	switch	.text
1110  014d               _COMP_ITConfig:
1112  014d 89            	pushw	x
1113       00000000      OFST:	set	0
1116                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1118                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1120                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1122  014e 9e            	ld	a,xh
1123  014f a101          	cp	a,#1
1124  0151 2610          	jrne	L705
1125                     ; 530     if (NewState != DISABLE)
1127  0153 9f            	ld	a,xl
1128  0154 4d            	tnz	a
1129  0155 2706          	jreq	L115
1130                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1132  0157 721a5440      	bset	21568,#5
1134  015b 2014          	jra	L515
1135  015d               L115:
1136                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1138  015d 721b5440      	bres	21568,#5
1139  0161 200e          	jra	L515
1140  0163               L705:
1141                     ; 543     if (NewState != DISABLE)
1143  0163 0d02          	tnz	(OFST+2,sp)
1144  0165 2706          	jreq	L715
1145                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1147  0167 721a5441      	bset	21569,#5
1149  016b 2004          	jra	L515
1150  016d               L715:
1151                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1153  016d 721b5441      	bres	21569,#5
1154  0171               L515:
1155                     ; 554 }
1158  0171 85            	popw	x
1159  0172 81            	ret
1225                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1225                     ; 565 {
1226                     	switch	.text
1227  0173               _COMP_GetFlagStatus:
1229  0173 88            	push	a
1230       00000001      OFST:	set	1
1233                     ; 566   FlagStatus bitstatus = RESET;
1235                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1237                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1239  0174 a101          	cp	a,#1
1240  0176 2611          	jrne	L555
1241                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1243  0178 c65440        	ld	a,21568
1244  017b a510          	bcp	a,#16
1245  017d 2706          	jreq	L755
1246                     ; 577       bitstatus = SET;
1248  017f a601          	ld	a,#1
1249  0181 6b01          	ld	(OFST+0,sp),a
1252  0183 2013          	jra	L365
1253  0185               L755:
1254                     ; 582       bitstatus = RESET;
1256  0185 0f01          	clr	(OFST+0,sp)
1258  0187 200f          	jra	L365
1259  0189               L555:
1260                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1262  0189 c65441        	ld	a,21569
1263  018c a510          	bcp	a,#16
1264  018e 2706          	jreq	L565
1265                     ; 590       bitstatus = SET;
1267  0190 a601          	ld	a,#1
1268  0192 6b01          	ld	(OFST+0,sp),a
1271  0194 2002          	jra	L365
1272  0196               L565:
1273                     ; 595       bitstatus = RESET;
1275  0196 0f01          	clr	(OFST+0,sp)
1277  0198               L365:
1278                     ; 600   return (FlagStatus)(bitstatus);
1280  0198 7b01          	ld	a,(OFST+0,sp)
1283  019a 5b01          	addw	sp,#1
1284  019c 81            	ret
1319                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1319                     ; 612 {
1320                     	switch	.text
1321  019d               _COMP_ClearFlag:
1325                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1327                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1329  019d a101          	cp	a,#1
1330  019f 2606          	jrne	L706
1331                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1333  01a1 72195440      	bres	21568,#4
1335  01a5 2004          	jra	L116
1336  01a7               L706:
1337                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1339  01a7 72195441      	bres	21569,#4
1340  01ab               L116:
1341                     ; 626 }
1344  01ab 81            	ret
1408                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1408                     ; 637 {
1409                     	switch	.text
1410  01ac               _COMP_GetITStatus:
1412  01ac 89            	pushw	x
1413       00000002      OFST:	set	2
1416                     ; 638   ITStatus bitstatus = RESET;
1418                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1422                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1424                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1426  01ad a101          	cp	a,#1
1427  01af 2620          	jrne	L546
1428                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1430  01b1 c65440        	ld	a,21568
1431  01b4 a410          	and	a,#16
1432  01b6 6b01          	ld	(OFST-1,sp),a
1434                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1436  01b8 c65440        	ld	a,21568
1437  01bb a420          	and	a,#32
1438  01bd 6b02          	ld	(OFST+0,sp),a
1440                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1442  01bf 0d01          	tnz	(OFST-1,sp)
1443  01c1 270a          	jreq	L746
1445  01c3 0d02          	tnz	(OFST+0,sp)
1446  01c5 2706          	jreq	L746
1447                     ; 655       bitstatus = SET;
1449  01c7 a601          	ld	a,#1
1450  01c9 6b02          	ld	(OFST+0,sp),a
1453  01cb 2022          	jra	L356
1454  01cd               L746:
1455                     ; 660       bitstatus = RESET;
1457  01cd 0f02          	clr	(OFST+0,sp)
1459  01cf 201e          	jra	L356
1460  01d1               L546:
1461                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1463  01d1 c65441        	ld	a,21569
1464  01d4 a410          	and	a,#16
1465  01d6 6b01          	ld	(OFST-1,sp),a
1467                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1469  01d8 c65441        	ld	a,21569
1470  01db a420          	and	a,#32
1471  01dd 6b02          	ld	(OFST+0,sp),a
1473                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1475  01df 0d01          	tnz	(OFST-1,sp)
1476  01e1 270a          	jreq	L556
1478  01e3 0d02          	tnz	(OFST+0,sp)
1479  01e5 2706          	jreq	L556
1480                     ; 674       bitstatus = SET;
1482  01e7 a601          	ld	a,#1
1483  01e9 6b02          	ld	(OFST+0,sp),a
1486  01eb 2002          	jra	L356
1487  01ed               L556:
1488                     ; 679       bitstatus = RESET;
1490  01ed 0f02          	clr	(OFST+0,sp)
1492  01ef               L356:
1493                     ; 684   return (ITStatus) bitstatus;
1495  01ef 7b02          	ld	a,(OFST+0,sp)
1498  01f1 85            	popw	x
1499  01f2 81            	ret
1535                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1535                     ; 696 {
1536                     	switch	.text
1537  01f3               _COMP_ClearITPendingBit:
1541                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1543                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1545  01f3 a101          	cp	a,#1
1546  01f5 2606          	jrne	L776
1547                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1549  01f7 72195440      	bres	21568,#4
1551  01fb 2004          	jra	L107
1552  01fd               L776:
1553                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1555  01fd 72195441      	bres	21569,#4
1556  0201               L107:
1557                     ; 710 }
1560  0201 81            	ret
1573                     	xdef	_COMP_ClearITPendingBit
1574                     	xdef	_COMP_GetITStatus
1575                     	xdef	_COMP_ClearFlag
1576                     	xdef	_COMP_GetFlagStatus
1577                     	xdef	_COMP_ITConfig
1578                     	xdef	_COMP_TriggerConfig
1579                     	xdef	_COMP_SchmittTriggerCmd
1580                     	xdef	_COMP_VrefintOutputCmd
1581                     	xdef	_COMP_WindowCmd
1582                     	xdef	_COMP_GetOutputLevel
1583                     	xdef	_COMP_EdgeConfig
1584                     	xdef	_COMP_VrefintToCOMP1Connect
1585                     	xdef	_COMP_Init
1586                     	xdef	_COMP_DeInit
1605                     	end
