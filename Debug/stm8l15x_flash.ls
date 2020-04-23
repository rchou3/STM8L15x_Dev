   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  78                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  78                     ; 175 {
  80                     	switch	.text
  81  0000               _FLASH_SetProgrammingTime:
  85                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  87                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  89  0000 72115050      	bres	20560,#0
  90                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  92  0004 ca5050        	or	a,20560
  93  0007 c75050        	ld	20560,a
  94                     ; 181 }
  97  000a 81            	ret
 122                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 122                     ; 189 {
 123                     	switch	.text
 124  000b               _FLASH_GetProgrammingTime:
 128                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 130  000b c65050        	ld	a,20560
 131  000e a401          	and	a,#1
 134  0010 81            	ret
 190                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 190                     ; 204 {
 191                     	switch	.text
 192  0011               _FLASH_PowerWaitModeConfig:
 196                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 198                     ; 209   if(FLASH_Power != FLASH_Power_On)
 200  0011 a101          	cp	a,#1
 201  0013 2706          	jreq	L57
 202                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 204  0015 72145050      	bset	20560,#2
 206  0019 2004          	jra	L77
 207  001b               L57:
 208                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 210  001b 72155050      	bres	20560,#2
 211  001f               L77:
 212                     ; 218 }
 215  001f 81            	ret
 238                     ; 259 void FLASH_DeInit(void)
 238                     ; 260 {
 239                     	switch	.text
 240  0020               _FLASH_DeInit:
 244                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 246  0020 725f5050      	clr	20560
 247                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 249  0024 725f5051      	clr	20561
 250                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 252  0028 35405054      	mov	20564,#64
 253                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 255  002c c65054        	ld	a,20564
 256                     ; 265 }
 259  002f 81            	ret
 315                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 315                     ; 276 {
 316                     	switch	.text
 317  0030               _FLASH_Unlock:
 319  0030 88            	push	a
 320       00000000      OFST:	set	0
 323                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 325                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 327  0031 a1fd          	cp	a,#253
 328  0033 2608          	jrne	L731
 329                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 331  0035 35565052      	mov	20562,#86
 332                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 334  0039 35ae5052      	mov	20562,#174
 335  003d               L731:
 336                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 338  003d 7b01          	ld	a,(OFST+1,sp)
 339  003f a1f7          	cp	a,#247
 340  0041 2608          	jrne	L141
 341                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 343  0043 35ae5053      	mov	20563,#174
 344                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 346  0047 35565053      	mov	20563,#86
 347  004b               L141:
 348                     ; 293 }
 351  004b 84            	pop	a
 352  004c 81            	ret
 387                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 387                     ; 304 {
 388                     	switch	.text
 389  004d               _FLASH_Lock:
 393                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 395                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 397  004d c45054        	and	a,20564
 398  0050 c75054        	ld	20564,a
 399                     ; 310 }
 402  0053 81            	ret
 445                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 445                     ; 319 {
 446                     	switch	.text
 447  0054               _FLASH_ProgramByte:
 449       00000000      OFST:	set	0
 452                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 454                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 456  0054 7b07          	ld	a,(OFST+7,sp)
 457  0056 88            	push	a
 458  0057 7b05          	ld	a,(OFST+5,sp)
 459  0059 b700          	ld	c_x,a
 460  005b 1e06          	ldw	x,(OFST+6,sp)
 461  005d 84            	pop	a
 462  005e bf01          	ldw	c_x+1,x
 463  0060 92bd0000      	ldf	[c_x.e],a
 464                     ; 324 }
 467  0064 81            	ret
 501                     ; 331 void FLASH_EraseByte(uint32_t Address)
 501                     ; 332 {
 502                     	switch	.text
 503  0065               _FLASH_EraseByte:
 505       00000000      OFST:	set	0
 508                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 510                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 512  0065 7b04          	ld	a,(OFST+4,sp)
 513  0067 b700          	ld	c_x,a
 514  0069 1e05          	ldw	x,(OFST+5,sp)
 515  006b bf01          	ldw	c_x+1,x
 516  006d 4f            	clr	a
 517  006e 92bd0000      	ldf	[c_x.e],a
 518                     ; 337 }
 521  0072 81            	ret
 564                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 564                     ; 346 {
 565                     	switch	.text
 566  0073               _FLASH_ProgramWord:
 568       00000000      OFST:	set	0
 571                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 573                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 575  0073 721c5051      	bset	20561,#6
 576                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 578  0077 7b07          	ld	a,(OFST+7,sp)
 579  0079 88            	push	a
 580  007a 7b05          	ld	a,(OFST+5,sp)
 581  007c b700          	ld	c_x,a
 582  007e 1e06          	ldw	x,(OFST+6,sp)
 583  0080 84            	pop	a
 584  0081 bf01          	ldw	c_x+1,x
 585  0083 92bd0000      	ldf	[c_x.e],a
 586                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 588  0087 7b08          	ld	a,(OFST+8,sp)
 589  0089 88            	push	a
 590  008a 7b05          	ld	a,(OFST+5,sp)
 591  008c b700          	ld	c_x,a
 592  008e 1e06          	ldw	x,(OFST+6,sp)
 593  0090 84            	pop	a
 594  0091 90ae0001      	ldw	y,#1
 595  0095 bf01          	ldw	c_x+1,x
 596  0097 93            	ldw	x,y
 597  0098 92a70000      	ldf	([c_x.e],x),a
 598                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 600  009c 7b09          	ld	a,(OFST+9,sp)
 601  009e 88            	push	a
 602  009f 7b05          	ld	a,(OFST+5,sp)
 603  00a1 b700          	ld	c_x,a
 604  00a3 1e06          	ldw	x,(OFST+6,sp)
 605  00a5 84            	pop	a
 606  00a6 90ae0002      	ldw	y,#2
 607  00aa bf01          	ldw	c_x+1,x
 608  00ac 93            	ldw	x,y
 609  00ad 92a70000      	ldf	([c_x.e],x),a
 610                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 612  00b1 7b0a          	ld	a,(OFST+10,sp)
 613  00b3 88            	push	a
 614  00b4 7b05          	ld	a,(OFST+5,sp)
 615  00b6 b700          	ld	c_x,a
 616  00b8 1e06          	ldw	x,(OFST+6,sp)
 617  00ba 84            	pop	a
 618  00bb 90ae0003      	ldw	y,#3
 619  00bf bf01          	ldw	c_x+1,x
 620  00c1 93            	ldw	x,y
 621  00c2 92a70000      	ldf	([c_x.e],x),a
 622                     ; 360 }
 625  00c6 81            	ret
 659                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 659                     ; 368 {
 660                     	switch	.text
 661  00c7               _FLASH_ReadByte:
 663       00000000      OFST:	set	0
 666                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 668  00c7 7b04          	ld	a,(OFST+4,sp)
 669  00c9 b700          	ld	c_x,a
 670  00cb 1e05          	ldw	x,(OFST+5,sp)
 671  00cd bf01          	ldw	c_x+1,x
 672  00cf 92bc0000      	ldf	a,[c_x.e]
 675  00d3 81            	ret
 720                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 720                     ; 418 {
 721                     	switch	.text
 722  00d4               _FLASH_ProgramOptionByte:
 724  00d4 89            	pushw	x
 725       00000000      OFST:	set	0
 728                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 730                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 732  00d5 721e5051      	bset	20561,#7
 733                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 735  00d9 3f00          	clr	c_x
 736  00db 7b05          	ld	a,(OFST+5,sp)
 737  00dd bf01          	ldw	c_x+1,x
 738  00df 92bd0000      	ldf	[c_x.e],a
 739                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 741  00e3 a6fd          	ld	a,#253
 742  00e5 cd0272        	call	_FLASH_WaitForLastOperation
 744                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 746  00e8 721f5051      	bres	20561,#7
 747                     ; 432 }
 750  00ec 85            	popw	x
 751  00ed 81            	ret
 787                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 787                     ; 440 {
 788                     	switch	.text
 789  00ee               _FLASH_EraseOptionByte:
 793                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 795                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 797  00ee 721e5051      	bset	20561,#7
 798                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 800  00f2 3f00          	clr	c_x
 801  00f4 bf01          	ldw	c_x+1,x
 802  00f6 4f            	clr	a
 803  00f7 92bd0000      	ldf	[c_x.e],a
 804                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 806  00fb a6fd          	ld	a,#253
 807  00fd cd0272        	call	_FLASH_WaitForLastOperation
 809                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 811  0100 721f5051      	bres	20561,#7
 812                     ; 454 }
 815  0104 81            	ret
 872                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 872                     ; 463 {
 873                     	switch	.text
 874  0105               _FLASH_GetReadOutProtectionStatus:
 876  0105 88            	push	a
 877       00000001      OFST:	set	1
 880                     ; 464   FunctionalState state = DISABLE;
 882                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 884  0106 c64800        	ld	a,18432
 885  0109 a1aa          	cp	a,#170
 886  010b 2606          	jrne	L743
 887                     ; 469     state =  ENABLE;
 889  010d a601          	ld	a,#1
 890  010f 6b01          	ld	(OFST+0,sp),a
 893  0111 2002          	jra	L153
 894  0113               L743:
 895                     ; 474     state =  DISABLE;
 897  0113 0f01          	clr	(OFST+0,sp)
 899  0115               L153:
 900                     ; 477   return state;
 902  0115 7b01          	ld	a,(OFST+0,sp)
 905  0117 5b01          	addw	sp,#1
 906  0119 81            	ret
 940                     ; 485 uint16_t FLASH_GetBootSize(void)
 940                     ; 486 {
 941                     	switch	.text
 942  011a               _FLASH_GetBootSize:
 944  011a 89            	pushw	x
 945       00000002      OFST:	set	2
 948                     ; 487   uint16_t temp = 0;
 950                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 952  011b c64802        	ld	a,18434
 953  011e 5f            	clrw	x
 954  011f 97            	ld	xl,a
 955  0120 4f            	clr	a
 956  0121 02            	rlwa	x,a
 957  0122 44            	srl	a
 958  0123 56            	rrcw	x
 959  0124 1f01          	ldw	(OFST-1,sp),x
 961                     ; 493   if(OPT->UBC > 0x7F)
 963  0126 c64802        	ld	a,18434
 964  0129 a180          	cp	a,#128
 965  012b 2505          	jrult	L173
 966                     ; 495     temp = 8192;
 968  012d ae2000        	ldw	x,#8192
 969  0130 1f01          	ldw	(OFST-1,sp),x
 971  0132               L173:
 972                     ; 499   return(temp);
 974  0132 1e01          	ldw	x,(OFST-1,sp)
 977  0134 5b02          	addw	sp,#2
 978  0136 81            	ret
1012                     ; 508 uint16_t FLASH_GetCodeSize(void)
1012                     ; 509 {
1013                     	switch	.text
1014  0137               _FLASH_GetCodeSize:
1016  0137 89            	pushw	x
1017       00000002      OFST:	set	2
1020                     ; 510   uint16_t temp = 0;
1022                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
1024  0138 c64807        	ld	a,18439
1025  013b 5f            	clrw	x
1026  013c 97            	ld	xl,a
1027  013d 4f            	clr	a
1028  013e 02            	rlwa	x,a
1029  013f 44            	srl	a
1030  0140 56            	rrcw	x
1031  0141 1f01          	ldw	(OFST-1,sp),x
1033                     ; 516   if(OPT->PCODESIZE > 0x7F)
1035  0143 c64807        	ld	a,18439
1036  0146 a180          	cp	a,#128
1037  0148 2505          	jrult	L114
1038                     ; 518     temp = 8192;
1040  014a ae2000        	ldw	x,#8192
1041  014d 1f01          	ldw	(OFST-1,sp),x
1043  014f               L114:
1044                     ; 522   return(temp);
1046  014f 1e01          	ldw	x,(OFST-1,sp)
1049  0151 5b02          	addw	sp,#2
1050  0153 81            	ret
1085                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1085                     ; 548 {
1086                     	switch	.text
1087  0154               _FLASH_ITConfig:
1091                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1093                     ; 552   if(NewState != DISABLE)
1095  0154 4d            	tnz	a
1096  0155 2706          	jreq	L134
1097                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1099  0157 72125050      	bset	20560,#1
1101  015b 2004          	jra	L334
1102  015d               L134:
1103                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1105  015d 72135050      	bres	20560,#1
1106  0161               L334:
1107                     ; 562 }
1110  0161 81            	ret
1219                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1219                     ; 577 {
1220                     	switch	.text
1221  0162               _FLASH_GetFlagStatus:
1223  0162 88            	push	a
1224       00000001      OFST:	set	1
1227                     ; 578   FlagStatus status = RESET;
1229                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1231                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1233  0163 c45054        	and	a,20564
1234  0166 2706          	jreq	L505
1235                     ; 584     status = SET; /* Flash_FLAG is set*/
1237  0168 a601          	ld	a,#1
1238  016a 6b01          	ld	(OFST+0,sp),a
1241  016c 2002          	jra	L705
1242  016e               L505:
1243                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1245  016e 0f01          	clr	(OFST+0,sp)
1247  0170               L705:
1248                     ; 592   return status;
1250  0170 7b01          	ld	a,(OFST+0,sp)
1253  0172 5b01          	addw	sp,#1
1254  0174 81            	ret
1290                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1290                     ; 720 {
1291                     	switch	.text
1292  0175               _FLASH_PowerRunModeConfig:
1296                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1298                     ; 724   if(FLASH_Power != FLASH_Power_On)
1300  0175 a101          	cp	a,#1
1301  0177 2706          	jreq	L725
1302                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1304  0179 72165050      	bset	20560,#3
1306  017d 2004          	jra	L135
1307  017f               L725:
1308                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1310  017f 72175050      	bres	20560,#3
1311  0183               L135:
1312                     ; 732 }
1315  0183 81            	ret
1379                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1379                     ; 746 {
1380                     	switch	.text
1381  0184               _FLASH_GetPowerStatus:
1385                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1387  0184 c65050        	ld	a,20560
1388  0187 a40c          	and	a,#12
1391  0189 81            	ret
1495                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1495                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1495                     ; 767 {
1496                     	switch	.text
1497  018a               _FLASH_ProgramBlock:
1499  018a 89            	pushw	x
1500  018b 5206          	subw	sp,#6
1501       00000006      OFST:	set	6
1504                     ; 768   uint16_t Count = 0;
1506                     ; 769   uint32_t startaddress = 0;
1508                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1510                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1512                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1514  018d 7b0b          	ld	a,(OFST+5,sp)
1515  018f a1fd          	cp	a,#253
1516  0191 260c          	jrne	L136
1517                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1519                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1521  0193 ae8000        	ldw	x,#32768
1522  0196 1f03          	ldw	(OFST-3,sp),x
1523  0198 ae0000        	ldw	x,#0
1524  019b 1f01          	ldw	(OFST-5,sp),x
1527  019d 200a          	jra	L336
1528  019f               L136:
1529                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1531                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1533  019f ae1000        	ldw	x,#4096
1534  01a2 1f03          	ldw	(OFST-3,sp),x
1535  01a4 ae0000        	ldw	x,#0
1536  01a7 1f01          	ldw	(OFST-5,sp),x
1538  01a9               L336:
1539                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1541  01a9 1e07          	ldw	x,(OFST+1,sp)
1542  01ab a680          	ld	a,#128
1543  01ad cd0000        	call	c_cmulx
1545  01b0 96            	ldw	x,sp
1546  01b1 1c0001        	addw	x,#OFST-5
1547  01b4 cd0000        	call	c_lgadd
1550                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1552  01b7 0d0c          	tnz	(OFST+6,sp)
1553  01b9 2606          	jrne	L536
1554                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1556  01bb 72105051      	bset	20561,#0
1558  01bf 2004          	jra	L736
1559  01c1               L536:
1560                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1562  01c1 72185051      	bset	20561,#4
1563  01c5               L736:
1564                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1566  01c5 5f            	clrw	x
1567  01c6 1f05          	ldw	(OFST-1,sp),x
1569  01c8               L146:
1570                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1572  01c8 1e0d          	ldw	x,(OFST+7,sp)
1573  01ca 72fb05        	addw	x,(OFST-1,sp)
1574  01cd f6            	ld	a,(x)
1575  01ce 88            	push	a
1576  01cf 7b03          	ld	a,(OFST-3,sp)
1577  01d1 b700          	ld	c_x,a
1578  01d3 1e04          	ldw	x,(OFST-2,sp)
1579  01d5 84            	pop	a
1580  01d6 1605          	ldw	y,(OFST-1,sp)
1581  01d8 bf01          	ldw	c_x+1,x
1582  01da 93            	ldw	x,y
1583  01db 92a70000      	ldf	([c_x.e],x),a
1584                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1586  01df 1e05          	ldw	x,(OFST-1,sp)
1587  01e1 1c0001        	addw	x,#1
1588  01e4 1f05          	ldw	(OFST-1,sp),x
1592  01e6 1e05          	ldw	x,(OFST-1,sp)
1593  01e8 a30080        	cpw	x,#128
1594  01eb 25db          	jrult	L146
1595                     ; 805 }
1598  01ed 5b08          	addw	sp,#8
1599  01ef 81            	ret
1662                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1662                     ; 818 {
1663                     	switch	.text
1664  01f0               _FLASH_EraseBlock:
1666  01f0 89            	pushw	x
1667  01f1 5207          	subw	sp,#7
1668       00000007      OFST:	set	7
1671                     ; 819   uint32_t startaddress = 0;
1673                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1675                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1677  01f3 7b0c          	ld	a,(OFST+5,sp)
1678  01f5 a1fd          	cp	a,#253
1679  01f7 260c          	jrne	L107
1680                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1682                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1684  01f9 ae8000        	ldw	x,#32768
1685  01fc 1f03          	ldw	(OFST-4,sp),x
1686  01fe ae0000        	ldw	x,#0
1687  0201 1f01          	ldw	(OFST-6,sp),x
1690  0203 200a          	jra	L307
1691  0205               L107:
1692                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1694                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1696  0205 ae1000        	ldw	x,#4096
1697  0208 1f03          	ldw	(OFST-4,sp),x
1698  020a ae0000        	ldw	x,#0
1699  020d 1f01          	ldw	(OFST-6,sp),x
1701  020f               L307:
1702                     ; 847   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1704  020f 1e08          	ldw	x,(OFST+1,sp)
1705  0211 a680          	ld	a,#128
1706  0213 cd0000        	call	c_cmulx
1708  0216 96            	ldw	x,sp
1709  0217 1c0001        	addw	x,#OFST-6
1710  021a cd0000        	call	c_ladd
1712  021d 450100        	mov	c_x,c_lreg+1
1713  0220 be02          	ldw	x,c_lreg+2
1714  0222 b600          	ld	a,c_x
1715  0224 6b05          	ld	(OFST-2,sp),a
1716  0226 1f06          	ldw	(OFST-1,sp),x
1718                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1720  0228 721a5051      	bset	20561,#5
1721                     ; 858   *pwFlash = (uint8_t)0;
1723  022c 7b05          	ld	a,(OFST-2,sp)
1724  022e b700          	ld	c_x,a
1725  0230 1e06          	ldw	x,(OFST-1,sp)
1726  0232 bf01          	ldw	c_x+1,x
1727  0234 4f            	clr	a
1728  0235 92bd0000      	ldf	[c_x.e],a
1729                     ; 859   *(pwFlash + 1) = (uint8_t)0;
1731  0239 7b05          	ld	a,(OFST-2,sp)
1732  023b b700          	ld	c_x,a
1733  023d 1e06          	ldw	x,(OFST-1,sp)
1734  023f 90ae0001      	ldw	y,#1
1735  0243 bf01          	ldw	c_x+1,x
1736  0245 93            	ldw	x,y
1737  0246 4f            	clr	a
1738  0247 92a70000      	ldf	([c_x.e],x),a
1739                     ; 860   *(pwFlash + 2) = (uint8_t)0;
1741  024b 7b05          	ld	a,(OFST-2,sp)
1742  024d b700          	ld	c_x,a
1743  024f 1e06          	ldw	x,(OFST-1,sp)
1744  0251 90ae0002      	ldw	y,#2
1745  0255 bf01          	ldw	c_x+1,x
1746  0257 93            	ldw	x,y
1747  0258 4f            	clr	a
1748  0259 92a70000      	ldf	([c_x.e],x),a
1749                     ; 861   *(pwFlash + 3) = (uint8_t)0;
1751  025d 7b05          	ld	a,(OFST-2,sp)
1752  025f b700          	ld	c_x,a
1753  0261 1e06          	ldw	x,(OFST-1,sp)
1754  0263 90ae0003      	ldw	y,#3
1755  0267 bf01          	ldw	c_x+1,x
1756  0269 93            	ldw	x,y
1757  026a 4f            	clr	a
1758  026b 92a70000      	ldf	([c_x.e],x),a
1759                     ; 863 }
1762  026f 5b09          	addw	sp,#9
1763  0271 81            	ret
1848                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1848                     ; 876 {
1849                     	switch	.text
1850  0272               _FLASH_WaitForLastOperation:
1852  0272 5203          	subw	sp,#3
1853       00000003      OFST:	set	3
1856                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1858  0274 aeffff        	ldw	x,#65535
1859  0277 1f01          	ldw	(OFST-2,sp),x
1861                     ; 878   uint8_t flagstatus = 0x00;
1863  0279 0f03          	clr	(OFST+0,sp)
1865                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1867  027b a1fd          	cp	a,#253
1868  027d 2628          	jrne	L367
1870  027f 200e          	jra	L157
1871  0281               L747:
1872                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1872                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1874  0281 c65054        	ld	a,20564
1875  0284 a405          	and	a,#5
1876  0286 6b03          	ld	(OFST+0,sp),a
1878                     ; 887       timeout--;
1880  0288 1e01          	ldw	x,(OFST-2,sp)
1881  028a 1d0001        	subw	x,#1
1882  028d 1f01          	ldw	(OFST-2,sp),x
1884  028f               L157:
1885                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1887  028f 0d03          	tnz	(OFST+0,sp)
1888  0291 261c          	jrne	L757
1890  0293 1e01          	ldw	x,(OFST-2,sp)
1891  0295 26ea          	jrne	L747
1892  0297 2016          	jra	L757
1893  0299               L167:
1894                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1894                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1896  0299 c65054        	ld	a,20564
1897  029c a441          	and	a,#65
1898  029e 6b03          	ld	(OFST+0,sp),a
1900                     ; 896       timeout--;
1902  02a0 1e01          	ldw	x,(OFST-2,sp)
1903  02a2 1d0001        	subw	x,#1
1904  02a5 1f01          	ldw	(OFST-2,sp),x
1906  02a7               L367:
1907                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1909  02a7 0d03          	tnz	(OFST+0,sp)
1910  02a9 2604          	jrne	L757
1912  02ab 1e01          	ldw	x,(OFST-2,sp)
1913  02ad 26ea          	jrne	L167
1914  02af               L757:
1915                     ; 900   if(timeout == 0x00)
1917  02af 1e01          	ldw	x,(OFST-2,sp)
1918  02b1 2604          	jrne	L177
1919                     ; 902     flagstatus = FLASH_Status_TimeOut;
1921  02b3 a602          	ld	a,#2
1922  02b5 6b03          	ld	(OFST+0,sp),a
1924  02b7               L177:
1925                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1927  02b7 7b03          	ld	a,(OFST+0,sp)
1930  02b9 5b03          	addw	sp,#3
1931  02bb 81            	ret
1944                     	xdef	_FLASH_WaitForLastOperation
1945                     	xdef	_FLASH_EraseBlock
1946                     	xdef	_FLASH_ProgramBlock
1947                     	xdef	_FLASH_GetPowerStatus
1948                     	xdef	_FLASH_PowerRunModeConfig
1949                     	xdef	_FLASH_GetFlagStatus
1950                     	xdef	_FLASH_ITConfig
1951                     	xdef	_FLASH_EraseOptionByte
1952                     	xdef	_FLASH_ProgramOptionByte
1953                     	xdef	_FLASH_GetReadOutProtectionStatus
1954                     	xdef	_FLASH_GetCodeSize
1955                     	xdef	_FLASH_GetBootSize
1956                     	xdef	_FLASH_ReadByte
1957                     	xdef	_FLASH_ProgramWord
1958                     	xdef	_FLASH_EraseByte
1959                     	xdef	_FLASH_ProgramByte
1960                     	xdef	_FLASH_Lock
1961                     	xdef	_FLASH_Unlock
1962                     	xdef	_FLASH_DeInit
1963                     	xdef	_FLASH_PowerWaitModeConfig
1964                     	xdef	_FLASH_SetProgrammingTime
1965                     	xdef	_FLASH_GetProgrammingTime
1966                     	xref.b	c_lreg
1967                     	xref.b	c_x
1986                     	xref	c_ladd
1987                     	xref	c_lgadd
1988                     	xref	c_cmulx
1989                     	end
