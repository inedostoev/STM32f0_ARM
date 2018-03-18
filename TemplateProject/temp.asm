
temp.elf:     file format elf32-littlearm

Sections:
Idx Name          Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector   000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text         00000750  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata       00000008  08000810  08000810  00010810  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array   00000008  08000818  08000818  00010818  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array   00000004  08000820  08000820  00010820  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data         00000434  20000000  08000824  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss          00000020  20000434  08000c58  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000454  08000c58  00020454  2**0  ALLOC
  8 .ARM.attributes 00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .comment      0000002b  00000000  00000000  0002045c  2**0  CONTENTS, READONLY
 10 .debug_info   000028de  00000000  00000000  00020487  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_abbrev 00000b0b  00000000  00000000  00022d65  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges 000001b0  00000000  00000000  00023870  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges 00000118  00000000  00000000  00023a20  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line   00000a20  00000000  00000000  00023b38  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str    00000ded  00000000  00000000  00024558  2**0  CONTENTS, READONLY, DEBUGGING
 16 .debug_frame  00000400  00000000  00000000  00025348  2**2  CONTENTS, READONLY, DEBUGGING
 17 .debug_loc    00000482  00000000  00000000  00025748  2**0  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

080000c0 <deregister_tm_clones>:
 80000c0:	4b05      	ldr	r3, [pc, #20]	; (80000d8 <deregister_tm_clones+0x18>)
 80000c2:	4806      	ldr	r0, [pc, #24]	; (80000dc <deregister_tm_clones+0x1c>)
 80000c4:	3303      	adds	r3, #3
 80000c6:	b510      	push	{r4, lr}
 80000c8:	1a1b      	subs	r3, r3, r0
 80000ca:	2b06      	cmp	r3, #6
 80000cc:	d903      	bls.n	80000d6 <deregister_tm_clones+0x16>
 80000ce:	4b04      	ldr	r3, [pc, #16]	; (80000e0 <deregister_tm_clones+0x20>)
 80000d0:	2b00      	cmp	r3, #0
 80000d2:	d000      	beq.n	80000d6 <deregister_tm_clones+0x16>
 80000d4:	4798      	blx	r3
 80000d6:	bd10      	pop	{r4, pc}
 80000d8:	20000434 	.word	0x20000434
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000

080000e4 <register_tm_clones>:
 80000e4:	4806      	ldr	r0, [pc, #24]	; (8000100 <register_tm_clones+0x1c>)
 80000e6:	4907      	ldr	r1, [pc, #28]	; (8000104 <register_tm_clones+0x20>)
 80000e8:	b510      	push	{r4, lr}
 80000ea:	1a09      	subs	r1, r1, r0
 80000ec:	1089      	asrs	r1, r1, #2
 80000ee:	0fcb      	lsrs	r3, r1, #31
 80000f0:	1859      	adds	r1, r3, r1
 80000f2:	1049      	asrs	r1, r1, #1
 80000f4:	d003      	beq.n	80000fe <register_tm_clones+0x1a>
 80000f6:	4b04      	ldr	r3, [pc, #16]	; (8000108 <register_tm_clones+0x24>)
 80000f8:	2b00      	cmp	r3, #0
 80000fa:	d000      	beq.n	80000fe <register_tm_clones+0x1a>
 80000fc:	4798      	blx	r3
 80000fe:	bd10      	pop	{r4, pc}
 8000100:	20000434 	.word	0x20000434
 8000104:	20000434 	.word	0x20000434
 8000108:	00000000 	.word	0x00000000

0800010c <__do_global_dtors_aux>:
 800010c:	b510      	push	{r4, lr}
 800010e:	4c07      	ldr	r4, [pc, #28]	; (800012c <__do_global_dtors_aux+0x20>)
 8000110:	7823      	ldrb	r3, [r4, #0]
 8000112:	2b00      	cmp	r3, #0
 8000114:	d109      	bne.n	800012a <__do_global_dtors_aux+0x1e>
 8000116:	f7ff ffd3 	bl	80000c0 <deregister_tm_clones>
 800011a:	4b05      	ldr	r3, [pc, #20]	; (8000130 <__do_global_dtors_aux+0x24>)
 800011c:	2b00      	cmp	r3, #0
 800011e:	d002      	beq.n	8000126 <__do_global_dtors_aux+0x1a>
 8000120:	4804      	ldr	r0, [pc, #16]	; (8000134 <__do_global_dtors_aux+0x28>)
 8000122:	e000      	b.n	8000126 <__do_global_dtors_aux+0x1a>
 8000124:	bf00      	nop
 8000126:	2301      	movs	r3, #1
 8000128:	7023      	strb	r3, [r4, #0]
 800012a:	bd10      	pop	{r4, pc}
 800012c:	20000434 	.word	0x20000434
 8000130:	00000000 	.word	0x00000000
 8000134:	080007f8 	.word	0x080007f8

08000138 <frame_dummy>:
 8000138:	4b09      	ldr	r3, [pc, #36]	; (8000160 <frame_dummy+0x28>)
 800013a:	b510      	push	{r4, lr}
 800013c:	2b00      	cmp	r3, #0
 800013e:	d003      	beq.n	8000148 <frame_dummy+0x10>
 8000140:	4908      	ldr	r1, [pc, #32]	; (8000164 <frame_dummy+0x2c>)
 8000142:	4809      	ldr	r0, [pc, #36]	; (8000168 <frame_dummy+0x30>)
 8000144:	e000      	b.n	8000148 <frame_dummy+0x10>
 8000146:	bf00      	nop
 8000148:	4808      	ldr	r0, [pc, #32]	; (800016c <frame_dummy+0x34>)
 800014a:	6803      	ldr	r3, [r0, #0]
 800014c:	2b00      	cmp	r3, #0
 800014e:	d102      	bne.n	8000156 <frame_dummy+0x1e>
 8000150:	f7ff ffc8 	bl	80000e4 <register_tm_clones>
 8000154:	bd10      	pop	{r4, pc}
 8000156:	4b06      	ldr	r3, [pc, #24]	; (8000170 <frame_dummy+0x38>)
 8000158:	2b00      	cmp	r3, #0
 800015a:	d0f9      	beq.n	8000150 <frame_dummy+0x18>
 800015c:	4798      	blx	r3
 800015e:	e7f7      	b.n	8000150 <frame_dummy+0x18>
 8000160:	00000000 	.word	0x00000000
 8000164:	20000438 	.word	0x20000438
 8000168:	080007f8 	.word	0x080007f8
 800016c:	20000434 	.word	0x20000434
 8000170:	00000000 	.word	0x00000000

08000174 <atexit>:
 8000174:	b510      	push	{r4, lr}
 8000176:	0001      	movs	r1, r0
 8000178:	2300      	movs	r3, #0
 800017a:	2200      	movs	r2, #0
 800017c:	2000      	movs	r0, #0
 800017e:	f000 f83f 	bl	8000200 <__register_exitproc>
 8000182:	bd10      	pop	{r4, pc}

08000184 <__libc_fini_array>:
 8000184:	b570      	push	{r4, r5, r6, lr}
 8000186:	4b09      	ldr	r3, [pc, #36]	; (80001ac <__libc_fini_array+0x28>)
 8000188:	4c09      	ldr	r4, [pc, #36]	; (80001b0 <__libc_fini_array+0x2c>)
 800018a:	1ae4      	subs	r4, r4, r3
 800018c:	10a4      	asrs	r4, r4, #2
 800018e:	d009      	beq.n	80001a4 <__libc_fini_array+0x20>
 8000190:	4a08      	ldr	r2, [pc, #32]	; (80001b4 <__libc_fini_array+0x30>)
 8000192:	18a5      	adds	r5, r4, r2
 8000194:	00ad      	lsls	r5, r5, #2
 8000196:	18ed      	adds	r5, r5, r3
 8000198:	682b      	ldr	r3, [r5, #0]
 800019a:	3c01      	subs	r4, #1
 800019c:	4798      	blx	r3
 800019e:	3d04      	subs	r5, #4
 80001a0:	2c00      	cmp	r4, #0
 80001a2:	d1f9      	bne.n	8000198 <__libc_fini_array+0x14>
 80001a4:	f000 fb2e 	bl	8000804 <_fini>
 80001a8:	bd70      	pop	{r4, r5, r6, pc}
 80001aa:	46c0      	nop			; (mov r8, r8)
 80001ac:	08000820 	.word	0x08000820
 80001b0:	08000824 	.word	0x08000824
 80001b4:	3fffffff 	.word	0x3fffffff

080001b8 <__libc_init_array>:
 80001b8:	b570      	push	{r4, r5, r6, lr}
 80001ba:	4e0d      	ldr	r6, [pc, #52]	; (80001f0 <__libc_init_array+0x38>)
 80001bc:	4d0d      	ldr	r5, [pc, #52]	; (80001f4 <__libc_init_array+0x3c>)
 80001be:	2400      	movs	r4, #0
 80001c0:	1bad      	subs	r5, r5, r6
 80001c2:	10ad      	asrs	r5, r5, #2
 80001c4:	d005      	beq.n	80001d2 <__libc_init_array+0x1a>
 80001c6:	00a3      	lsls	r3, r4, #2
 80001c8:	58f3      	ldr	r3, [r6, r3]
 80001ca:	3401      	adds	r4, #1
 80001cc:	4798      	blx	r3
 80001ce:	42a5      	cmp	r5, r4
 80001d0:	d1f9      	bne.n	80001c6 <__libc_init_array+0xe>
 80001d2:	f000 fb11 	bl	80007f8 <_init>
 80001d6:	4e08      	ldr	r6, [pc, #32]	; (80001f8 <__libc_init_array+0x40>)
 80001d8:	4d08      	ldr	r5, [pc, #32]	; (80001fc <__libc_init_array+0x44>)
 80001da:	2400      	movs	r4, #0
 80001dc:	1bad      	subs	r5, r5, r6
 80001de:	10ad      	asrs	r5, r5, #2
 80001e0:	d005      	beq.n	80001ee <__libc_init_array+0x36>
 80001e2:	00a3      	lsls	r3, r4, #2
 80001e4:	58f3      	ldr	r3, [r6, r3]
 80001e6:	3401      	adds	r4, #1
 80001e8:	4798      	blx	r3
 80001ea:	42a5      	cmp	r5, r4
 80001ec:	d1f9      	bne.n	80001e2 <__libc_init_array+0x2a>
 80001ee:	bd70      	pop	{r4, r5, r6, pc}
 80001f0:	08000818 	.word	0x08000818
 80001f4:	08000818 	.word	0x08000818
 80001f8:	08000818 	.word	0x08000818
 80001fc:	08000820 	.word	0x08000820

08000200 <__register_exitproc>:
 8000200:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000202:	4644      	mov	r4, r8
 8000204:	465f      	mov	r7, fp
 8000206:	4656      	mov	r6, sl
 8000208:	464d      	mov	r5, r9
 800020a:	469b      	mov	fp, r3
 800020c:	4b2f      	ldr	r3, [pc, #188]	; (80002cc <__register_exitproc+0xcc>)
 800020e:	b4f0      	push	{r4, r5, r6, r7}
 8000210:	681c      	ldr	r4, [r3, #0]
 8000212:	23a4      	movs	r3, #164	; 0xa4
 8000214:	005b      	lsls	r3, r3, #1
 8000216:	0005      	movs	r5, r0
 8000218:	58e0      	ldr	r0, [r4, r3]
 800021a:	000e      	movs	r6, r1
 800021c:	4690      	mov	r8, r2
 800021e:	2800      	cmp	r0, #0
 8000220:	d04b      	beq.n	80002ba <__register_exitproc+0xba>
 8000222:	6843      	ldr	r3, [r0, #4]
 8000224:	2b1f      	cmp	r3, #31
 8000226:	dc0d      	bgt.n	8000244 <__register_exitproc+0x44>
 8000228:	1c5c      	adds	r4, r3, #1
 800022a:	2d00      	cmp	r5, #0
 800022c:	d121      	bne.n	8000272 <__register_exitproc+0x72>
 800022e:	3302      	adds	r3, #2
 8000230:	009b      	lsls	r3, r3, #2
 8000232:	6044      	str	r4, [r0, #4]
 8000234:	501e      	str	r6, [r3, r0]
 8000236:	2000      	movs	r0, #0
 8000238:	bc3c      	pop	{r2, r3, r4, r5}
 800023a:	4690      	mov	r8, r2
 800023c:	4699      	mov	r9, r3
 800023e:	46a2      	mov	sl, r4
 8000240:	46ab      	mov	fp, r5
 8000242:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000244:	4b22      	ldr	r3, [pc, #136]	; (80002d0 <__register_exitproc+0xd0>)
 8000246:	2b00      	cmp	r3, #0
 8000248:	d03c      	beq.n	80002c4 <__register_exitproc+0xc4>
 800024a:	20c8      	movs	r0, #200	; 0xc8
 800024c:	0040      	lsls	r0, r0, #1
 800024e:	e000      	b.n	8000252 <__register_exitproc+0x52>
 8000250:	bf00      	nop
 8000252:	2800      	cmp	r0, #0
 8000254:	d036      	beq.n	80002c4 <__register_exitproc+0xc4>
 8000256:	22a4      	movs	r2, #164	; 0xa4
 8000258:	2300      	movs	r3, #0
 800025a:	0052      	lsls	r2, r2, #1
 800025c:	58a1      	ldr	r1, [r4, r2]
 800025e:	6043      	str	r3, [r0, #4]
 8000260:	6001      	str	r1, [r0, #0]
 8000262:	50a0      	str	r0, [r4, r2]
 8000264:	3240      	adds	r2, #64	; 0x40
 8000266:	5083      	str	r3, [r0, r2]
 8000268:	3204      	adds	r2, #4
 800026a:	5083      	str	r3, [r0, r2]
 800026c:	2401      	movs	r4, #1
 800026e:	2d00      	cmp	r5, #0
 8000270:	d0dd      	beq.n	800022e <__register_exitproc+0x2e>
 8000272:	009a      	lsls	r2, r3, #2
 8000274:	4691      	mov	r9, r2
 8000276:	4481      	add	r9, r0
 8000278:	4642      	mov	r2, r8
 800027a:	2188      	movs	r1, #136	; 0x88
 800027c:	464f      	mov	r7, r9
 800027e:	507a      	str	r2, [r7, r1]
 8000280:	22c4      	movs	r2, #196	; 0xc4
 8000282:	0052      	lsls	r2, r2, #1
 8000284:	4690      	mov	r8, r2
 8000286:	4480      	add	r8, r0
 8000288:	4642      	mov	r2, r8
 800028a:	3987      	subs	r1, #135	; 0x87
 800028c:	4099      	lsls	r1, r3
 800028e:	6812      	ldr	r2, [r2, #0]
 8000290:	468a      	mov	sl, r1
 8000292:	430a      	orrs	r2, r1
 8000294:	4694      	mov	ip, r2
 8000296:	4642      	mov	r2, r8
 8000298:	4661      	mov	r1, ip
 800029a:	6011      	str	r1, [r2, #0]
 800029c:	2284      	movs	r2, #132	; 0x84
 800029e:	4649      	mov	r1, r9
 80002a0:	465f      	mov	r7, fp
 80002a2:	0052      	lsls	r2, r2, #1
 80002a4:	508f      	str	r7, [r1, r2]
 80002a6:	2d02      	cmp	r5, #2
 80002a8:	d1c1      	bne.n	800022e <__register_exitproc+0x2e>
 80002aa:	0002      	movs	r2, r0
 80002ac:	4655      	mov	r5, sl
 80002ae:	328d      	adds	r2, #141	; 0x8d
 80002b0:	32ff      	adds	r2, #255	; 0xff
 80002b2:	6811      	ldr	r1, [r2, #0]
 80002b4:	430d      	orrs	r5, r1
 80002b6:	6015      	str	r5, [r2, #0]
 80002b8:	e7b9      	b.n	800022e <__register_exitproc+0x2e>
 80002ba:	0020      	movs	r0, r4
 80002bc:	304d      	adds	r0, #77	; 0x4d
 80002be:	30ff      	adds	r0, #255	; 0xff
 80002c0:	50e0      	str	r0, [r4, r3]
 80002c2:	e7ae      	b.n	8000222 <__register_exitproc+0x22>
 80002c4:	2001      	movs	r0, #1
 80002c6:	4240      	negs	r0, r0
 80002c8:	e7b6      	b.n	8000238 <__register_exitproc+0x38>
 80002ca:	46c0      	nop			; (mov r8, r8)
 80002cc:	08000810 	.word	0x08000810
 80002d0:	00000000 	.word	0x00000000

080002d4 <Reset_Handler>:
 80002d4:	480d      	ldr	r0, [pc, #52]	; (800030c <LoopForever+0x2>)
 80002d6:	4685      	mov	sp, r0
 80002d8:	480d      	ldr	r0, [pc, #52]	; (8000310 <LoopForever+0x6>)
 80002da:	490e      	ldr	r1, [pc, #56]	; (8000314 <LoopForever+0xa>)
 80002dc:	4a0e      	ldr	r2, [pc, #56]	; (8000318 <LoopForever+0xe>)
 80002de:	2300      	movs	r3, #0
 80002e0:	e002      	b.n	80002e8 <LoopCopyDataInit>

080002e2 <CopyDataInit>:
 80002e2:	58d4      	ldr	r4, [r2, r3]
 80002e4:	50c4      	str	r4, [r0, r3]
 80002e6:	3304      	adds	r3, #4

080002e8 <LoopCopyDataInit>:
 80002e8:	18c4      	adds	r4, r0, r3
 80002ea:	428c      	cmp	r4, r1
 80002ec:	d3f9      	bcc.n	80002e2 <CopyDataInit>
 80002ee:	4a0b      	ldr	r2, [pc, #44]	; (800031c <LoopForever+0x12>)
 80002f0:	4c0b      	ldr	r4, [pc, #44]	; (8000320 <LoopForever+0x16>)
 80002f2:	2300      	movs	r3, #0
 80002f4:	e001      	b.n	80002fa <LoopFillZerobss>

080002f6 <FillZerobss>:
 80002f6:	6013      	str	r3, [r2, #0]
 80002f8:	3204      	adds	r2, #4

080002fa <LoopFillZerobss>:
 80002fa:	42a2      	cmp	r2, r4
 80002fc:	d3fb      	bcc.n	80002f6 <FillZerobss>
 80002fe:	f000 fa2b 	bl	8000758 <SystemInit>
 8000302:	f7ff ff59 	bl	80001b8 <__libc_init_array>
 8000306:	f000 f9a1 	bl	800064c <main>

0800030a <LoopForever>:
 800030a:	e7fe      	b.n	800030a <LoopForever>
 800030c:	20002000 	.word	0x20002000
 8000310:	20000000 	.word	0x20000000
 8000314:	20000434 	.word	0x20000434
 8000318:	08000824 	.word	0x08000824
 800031c:	20000434 	.word	0x20000434
 8000320:	20000454 	.word	0x20000454

08000324 <ADC1_COMP_IRQHandler>:
 8000324:	e7fe      	b.n	8000324 <ADC1_COMP_IRQHandler>
	...

08000328 <NVIC_SetPriority>:
 8000328:	b5b0      	push	{r4, r5, r7, lr}
 800032a:	b082      	sub	sp, #8
 800032c:	af00      	add	r7, sp, #0
 800032e:	0002      	movs	r2, r0
 8000330:	6039      	str	r1, [r7, #0]
 8000332:	1dfb      	adds	r3, r7, #7
 8000334:	701a      	strb	r2, [r3, #0]
 8000336:	1dfb      	adds	r3, r7, #7
 8000338:	781b      	ldrb	r3, [r3, #0]
 800033a:	2b7f      	cmp	r3, #127	; 0x7f
 800033c:	d932      	bls.n	80003a4 <NVIC_SetPriority+0x7c>
 800033e:	4c2f      	ldr	r4, [pc, #188]	; (80003fc <NVIC_SetPriority+0xd4>)
 8000340:	1dfb      	adds	r3, r7, #7
 8000342:	781b      	ldrb	r3, [r3, #0]
 8000344:	001a      	movs	r2, r3
 8000346:	230f      	movs	r3, #15
 8000348:	4013      	ands	r3, r2
 800034a:	3b08      	subs	r3, #8
 800034c:	0899      	lsrs	r1, r3, #2
 800034e:	4a2b      	ldr	r2, [pc, #172]	; (80003fc <NVIC_SetPriority+0xd4>)
 8000350:	1dfb      	adds	r3, r7, #7
 8000352:	781b      	ldrb	r3, [r3, #0]
 8000354:	0018      	movs	r0, r3
 8000356:	230f      	movs	r3, #15
 8000358:	4003      	ands	r3, r0
 800035a:	3b08      	subs	r3, #8
 800035c:	089b      	lsrs	r3, r3, #2
 800035e:	3306      	adds	r3, #6
 8000360:	009b      	lsls	r3, r3, #2
 8000362:	18d3      	adds	r3, r2, r3
 8000364:	3304      	adds	r3, #4
 8000366:	681b      	ldr	r3, [r3, #0]
 8000368:	1dfa      	adds	r2, r7, #7
 800036a:	7812      	ldrb	r2, [r2, #0]
 800036c:	0010      	movs	r0, r2
 800036e:	2203      	movs	r2, #3
 8000370:	4002      	ands	r2, r0
 8000372:	00d2      	lsls	r2, r2, #3
 8000374:	20ff      	movs	r0, #255	; 0xff
 8000376:	4090      	lsls	r0, r2
 8000378:	0002      	movs	r2, r0
 800037a:	43d2      	mvns	r2, r2
 800037c:	401a      	ands	r2, r3
 800037e:	683b      	ldr	r3, [r7, #0]
 8000380:	019b      	lsls	r3, r3, #6
 8000382:	20ff      	movs	r0, #255	; 0xff
 8000384:	4018      	ands	r0, r3
 8000386:	1dfb      	adds	r3, r7, #7
 8000388:	781b      	ldrb	r3, [r3, #0]
 800038a:	001d      	movs	r5, r3
 800038c:	2303      	movs	r3, #3
 800038e:	402b      	ands	r3, r5
 8000390:	00db      	lsls	r3, r3, #3
 8000392:	4098      	lsls	r0, r3
 8000394:	0003      	movs	r3, r0
 8000396:	431a      	orrs	r2, r3
 8000398:	1d8b      	adds	r3, r1, #6
 800039a:	009b      	lsls	r3, r3, #2
 800039c:	18e3      	adds	r3, r4, r3
 800039e:	3304      	adds	r3, #4
 80003a0:	601a      	str	r2, [r3, #0]
 80003a2:	e027      	b.n	80003f4 <NVIC_SetPriority+0xcc>
 80003a4:	4c16      	ldr	r4, [pc, #88]	; (8000400 <NVIC_SetPriority+0xd8>)
 80003a6:	1dfb      	adds	r3, r7, #7
 80003a8:	781b      	ldrb	r3, [r3, #0]
 80003aa:	b25b      	sxtb	r3, r3
 80003ac:	089b      	lsrs	r3, r3, #2
 80003ae:	4914      	ldr	r1, [pc, #80]	; (8000400 <NVIC_SetPriority+0xd8>)
 80003b0:	1dfa      	adds	r2, r7, #7
 80003b2:	7812      	ldrb	r2, [r2, #0]
 80003b4:	b252      	sxtb	r2, r2
 80003b6:	0892      	lsrs	r2, r2, #2
 80003b8:	32c0      	adds	r2, #192	; 0xc0
 80003ba:	0092      	lsls	r2, r2, #2
 80003bc:	5852      	ldr	r2, [r2, r1]
 80003be:	1df9      	adds	r1, r7, #7
 80003c0:	7809      	ldrb	r1, [r1, #0]
 80003c2:	0008      	movs	r0, r1
 80003c4:	2103      	movs	r1, #3
 80003c6:	4001      	ands	r1, r0
 80003c8:	00c9      	lsls	r1, r1, #3
 80003ca:	20ff      	movs	r0, #255	; 0xff
 80003cc:	4088      	lsls	r0, r1
 80003ce:	0001      	movs	r1, r0
 80003d0:	43c9      	mvns	r1, r1
 80003d2:	4011      	ands	r1, r2
 80003d4:	683a      	ldr	r2, [r7, #0]
 80003d6:	0192      	lsls	r2, r2, #6
 80003d8:	20ff      	movs	r0, #255	; 0xff
 80003da:	4010      	ands	r0, r2
 80003dc:	1dfa      	adds	r2, r7, #7
 80003de:	7812      	ldrb	r2, [r2, #0]
 80003e0:	0015      	movs	r5, r2
 80003e2:	2203      	movs	r2, #3
 80003e4:	402a      	ands	r2, r5
 80003e6:	00d2      	lsls	r2, r2, #3
 80003e8:	4090      	lsls	r0, r2
 80003ea:	0002      	movs	r2, r0
 80003ec:	430a      	orrs	r2, r1
 80003ee:	33c0      	adds	r3, #192	; 0xc0
 80003f0:	009b      	lsls	r3, r3, #2
 80003f2:	511a      	str	r2, [r3, r4]
 80003f4:	46c0      	nop			; (mov r8, r8)
 80003f6:	46bd      	mov	sp, r7
 80003f8:	b002      	add	sp, #8
 80003fa:	bdb0      	pop	{r4, r5, r7, pc}
 80003fc:	e000ed00 	.word	0xe000ed00
 8000400:	e000e100 	.word	0xe000e100

08000404 <SysTick_Config>:
 8000404:	b580      	push	{r7, lr}
 8000406:	b082      	sub	sp, #8
 8000408:	af00      	add	r7, sp, #0
 800040a:	6078      	str	r0, [r7, #4]
 800040c:	687b      	ldr	r3, [r7, #4]
 800040e:	3b01      	subs	r3, #1
 8000410:	4a0c      	ldr	r2, [pc, #48]	; (8000444 <SysTick_Config+0x40>)
 8000412:	4293      	cmp	r3, r2
 8000414:	d901      	bls.n	800041a <SysTick_Config+0x16>
 8000416:	2301      	movs	r3, #1
 8000418:	e010      	b.n	800043c <SysTick_Config+0x38>
 800041a:	4b0b      	ldr	r3, [pc, #44]	; (8000448 <SysTick_Config+0x44>)
 800041c:	687a      	ldr	r2, [r7, #4]
 800041e:	3a01      	subs	r2, #1
 8000420:	605a      	str	r2, [r3, #4]
 8000422:	2301      	movs	r3, #1
 8000424:	425b      	negs	r3, r3
 8000426:	2103      	movs	r1, #3
 8000428:	0018      	movs	r0, r3
 800042a:	f7ff ff7d 	bl	8000328 <NVIC_SetPriority>
 800042e:	4b06      	ldr	r3, [pc, #24]	; (8000448 <SysTick_Config+0x44>)
 8000430:	2200      	movs	r2, #0
 8000432:	609a      	str	r2, [r3, #8]
 8000434:	4b04      	ldr	r3, [pc, #16]	; (8000448 <SysTick_Config+0x44>)
 8000436:	2207      	movs	r2, #7
 8000438:	601a      	str	r2, [r3, #0]
 800043a:	2300      	movs	r3, #0
 800043c:	0018      	movs	r0, r3
 800043e:	46bd      	mov	sp, r7
 8000440:	b002      	add	sp, #8
 8000442:	bd80      	pop	{r7, pc}
 8000444:	00ffffff 	.word	0x00ffffff
 8000448:	e000e010 	.word	0xe000e010

0800044c <LL_AHB1_GRP1_EnableClock>:
 800044c:	b580      	push	{r7, lr}
 800044e:	b084      	sub	sp, #16
 8000450:	af00      	add	r7, sp, #0
 8000452:	6078      	str	r0, [r7, #4]
 8000454:	4b07      	ldr	r3, [pc, #28]	; (8000474 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000456:	4a07      	ldr	r2, [pc, #28]	; (8000474 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000458:	6951      	ldr	r1, [r2, #20]
 800045a:	687a      	ldr	r2, [r7, #4]
 800045c:	430a      	orrs	r2, r1
 800045e:	615a      	str	r2, [r3, #20]
 8000460:	4b04      	ldr	r3, [pc, #16]	; (8000474 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000462:	695b      	ldr	r3, [r3, #20]
 8000464:	687a      	ldr	r2, [r7, #4]
 8000466:	4013      	ands	r3, r2
 8000468:	60fb      	str	r3, [r7, #12]
 800046a:	68fb      	ldr	r3, [r7, #12]
 800046c:	46c0      	nop			; (mov r8, r8)
 800046e:	46bd      	mov	sp, r7
 8000470:	b004      	add	sp, #16
 8000472:	bd80      	pop	{r7, pc}
 8000474:	40021000 	.word	0x40021000

08000478 <LL_GPIO_SetPinMode>:
 8000478:	b580      	push	{r7, lr}
 800047a:	b084      	sub	sp, #16
 800047c:	af00      	add	r7, sp, #0
 800047e:	60f8      	str	r0, [r7, #12]
 8000480:	60b9      	str	r1, [r7, #8]
 8000482:	607a      	str	r2, [r7, #4]
 8000484:	68fb      	ldr	r3, [r7, #12]
 8000486:	6819      	ldr	r1, [r3, #0]
 8000488:	68bb      	ldr	r3, [r7, #8]
 800048a:	68ba      	ldr	r2, [r7, #8]
 800048c:	435a      	muls	r2, r3
 800048e:	0013      	movs	r3, r2
 8000490:	005b      	lsls	r3, r3, #1
 8000492:	189b      	adds	r3, r3, r2
 8000494:	43db      	mvns	r3, r3
 8000496:	400b      	ands	r3, r1
 8000498:	001a      	movs	r2, r3
 800049a:	68bb      	ldr	r3, [r7, #8]
 800049c:	68b9      	ldr	r1, [r7, #8]
 800049e:	434b      	muls	r3, r1
 80004a0:	6879      	ldr	r1, [r7, #4]
 80004a2:	434b      	muls	r3, r1
 80004a4:	431a      	orrs	r2, r3
 80004a6:	68fb      	ldr	r3, [r7, #12]
 80004a8:	601a      	str	r2, [r3, #0]
 80004aa:	46c0      	nop			; (mov r8, r8)
 80004ac:	46bd      	mov	sp, r7
 80004ae:	b004      	add	sp, #16
 80004b0:	bd80      	pop	{r7, pc}
 80004b2:	46c0      	nop			; (mov r8, r8)

080004b4 <LL_GPIO_TogglePin>:
 80004b4:	b580      	push	{r7, lr}
 80004b6:	b082      	sub	sp, #8
 80004b8:	af00      	add	r7, sp, #0
 80004ba:	6078      	str	r0, [r7, #4]
 80004bc:	6039      	str	r1, [r7, #0]
 80004be:	687b      	ldr	r3, [r7, #4]
 80004c0:	695a      	ldr	r2, [r3, #20]
 80004c2:	683b      	ldr	r3, [r7, #0]
 80004c4:	405a      	eors	r2, r3
 80004c6:	687b      	ldr	r3, [r7, #4]
 80004c8:	615a      	str	r2, [r3, #20]
 80004ca:	46c0      	nop			; (mov r8, r8)
 80004cc:	46bd      	mov	sp, r7
 80004ce:	b002      	add	sp, #8
 80004d0:	bd80      	pop	{r7, pc}
 80004d2:	46c0      	nop			; (mov r8, r8)

080004d4 <LL_RCC_HSI_Enable>:
 80004d4:	b580      	push	{r7, lr}
 80004d6:	af00      	add	r7, sp, #0
 80004d8:	4b04      	ldr	r3, [pc, #16]	; (80004ec <LL_RCC_HSI_Enable+0x18>)
 80004da:	4a04      	ldr	r2, [pc, #16]	; (80004ec <LL_RCC_HSI_Enable+0x18>)
 80004dc:	6812      	ldr	r2, [r2, #0]
 80004de:	2101      	movs	r1, #1
 80004e0:	430a      	orrs	r2, r1
 80004e2:	601a      	str	r2, [r3, #0]
 80004e4:	46c0      	nop			; (mov r8, r8)
 80004e6:	46bd      	mov	sp, r7
 80004e8:	bd80      	pop	{r7, pc}
 80004ea:	46c0      	nop			; (mov r8, r8)
 80004ec:	40021000 	.word	0x40021000

080004f0 <LL_RCC_HSI_IsReady>:
 80004f0:	b580      	push	{r7, lr}
 80004f2:	af00      	add	r7, sp, #0
 80004f4:	4b04      	ldr	r3, [pc, #16]	; (8000508 <LL_RCC_HSI_IsReady+0x18>)
 80004f6:	681b      	ldr	r3, [r3, #0]
 80004f8:	2202      	movs	r2, #2
 80004fa:	4013      	ands	r3, r2
 80004fc:	1e5a      	subs	r2, r3, #1
 80004fe:	4193      	sbcs	r3, r2
 8000500:	b2db      	uxtb	r3, r3
 8000502:	0018      	movs	r0, r3
 8000504:	46bd      	mov	sp, r7
 8000506:	bd80      	pop	{r7, pc}
 8000508:	40021000 	.word	0x40021000

0800050c <LL_RCC_SetSysClkSource>:
 800050c:	b580      	push	{r7, lr}
 800050e:	b082      	sub	sp, #8
 8000510:	af00      	add	r7, sp, #0
 8000512:	6078      	str	r0, [r7, #4]
 8000514:	4b06      	ldr	r3, [pc, #24]	; (8000530 <LL_RCC_SetSysClkSource+0x24>)
 8000516:	4a06      	ldr	r2, [pc, #24]	; (8000530 <LL_RCC_SetSysClkSource+0x24>)
 8000518:	6852      	ldr	r2, [r2, #4]
 800051a:	2103      	movs	r1, #3
 800051c:	438a      	bics	r2, r1
 800051e:	0011      	movs	r1, r2
 8000520:	687a      	ldr	r2, [r7, #4]
 8000522:	430a      	orrs	r2, r1
 8000524:	605a      	str	r2, [r3, #4]
 8000526:	46c0      	nop			; (mov r8, r8)
 8000528:	46bd      	mov	sp, r7
 800052a:	b002      	add	sp, #8
 800052c:	bd80      	pop	{r7, pc}
 800052e:	46c0      	nop			; (mov r8, r8)
 8000530:	40021000 	.word	0x40021000

08000534 <LL_RCC_GetSysClkSource>:
 8000534:	b580      	push	{r7, lr}
 8000536:	af00      	add	r7, sp, #0
 8000538:	4b03      	ldr	r3, [pc, #12]	; (8000548 <LL_RCC_GetSysClkSource+0x14>)
 800053a:	685b      	ldr	r3, [r3, #4]
 800053c:	220c      	movs	r2, #12
 800053e:	4013      	ands	r3, r2
 8000540:	0018      	movs	r0, r3
 8000542:	46bd      	mov	sp, r7
 8000544:	bd80      	pop	{r7, pc}
 8000546:	46c0      	nop			; (mov r8, r8)
 8000548:	40021000 	.word	0x40021000

0800054c <LL_RCC_SetAHBPrescaler>:
 800054c:	b580      	push	{r7, lr}
 800054e:	b082      	sub	sp, #8
 8000550:	af00      	add	r7, sp, #0
 8000552:	6078      	str	r0, [r7, #4]
 8000554:	4b06      	ldr	r3, [pc, #24]	; (8000570 <LL_RCC_SetAHBPrescaler+0x24>)
 8000556:	4a06      	ldr	r2, [pc, #24]	; (8000570 <LL_RCC_SetAHBPrescaler+0x24>)
 8000558:	6852      	ldr	r2, [r2, #4]
 800055a:	21f0      	movs	r1, #240	; 0xf0
 800055c:	438a      	bics	r2, r1
 800055e:	0011      	movs	r1, r2
 8000560:	687a      	ldr	r2, [r7, #4]
 8000562:	430a      	orrs	r2, r1
 8000564:	605a      	str	r2, [r3, #4]
 8000566:	46c0      	nop			; (mov r8, r8)
 8000568:	46bd      	mov	sp, r7
 800056a:	b002      	add	sp, #8
 800056c:	bd80      	pop	{r7, pc}
 800056e:	46c0      	nop			; (mov r8, r8)
 8000570:	40021000 	.word	0x40021000

08000574 <LL_RCC_SetAPB1Prescaler>:
 8000574:	b580      	push	{r7, lr}
 8000576:	b082      	sub	sp, #8
 8000578:	af00      	add	r7, sp, #0
 800057a:	6078      	str	r0, [r7, #4]
 800057c:	4b05      	ldr	r3, [pc, #20]	; (8000594 <LL_RCC_SetAPB1Prescaler+0x20>)
 800057e:	4a05      	ldr	r2, [pc, #20]	; (8000594 <LL_RCC_SetAPB1Prescaler+0x20>)
 8000580:	6852      	ldr	r2, [r2, #4]
 8000582:	4905      	ldr	r1, [pc, #20]	; (8000598 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000584:	4011      	ands	r1, r2
 8000586:	687a      	ldr	r2, [r7, #4]
 8000588:	430a      	orrs	r2, r1
 800058a:	605a      	str	r2, [r3, #4]
 800058c:	46c0      	nop			; (mov r8, r8)
 800058e:	46bd      	mov	sp, r7
 8000590:	b002      	add	sp, #8
 8000592:	bd80      	pop	{r7, pc}
 8000594:	40021000 	.word	0x40021000
 8000598:	fffff8ff 	.word	0xfffff8ff

0800059c <LL_RCC_PLL_Enable>:
 800059c:	b580      	push	{r7, lr}
 800059e:	af00      	add	r7, sp, #0
 80005a0:	4b04      	ldr	r3, [pc, #16]	; (80005b4 <LL_RCC_PLL_Enable+0x18>)
 80005a2:	4a04      	ldr	r2, [pc, #16]	; (80005b4 <LL_RCC_PLL_Enable+0x18>)
 80005a4:	6812      	ldr	r2, [r2, #0]
 80005a6:	2180      	movs	r1, #128	; 0x80
 80005a8:	0449      	lsls	r1, r1, #17
 80005aa:	430a      	orrs	r2, r1
 80005ac:	601a      	str	r2, [r3, #0]
 80005ae:	46c0      	nop			; (mov r8, r8)
 80005b0:	46bd      	mov	sp, r7
 80005b2:	bd80      	pop	{r7, pc}
 80005b4:	40021000 	.word	0x40021000

080005b8 <LL_RCC_PLL_IsReady>:
 80005b8:	b580      	push	{r7, lr}
 80005ba:	af00      	add	r7, sp, #0
 80005bc:	4b05      	ldr	r3, [pc, #20]	; (80005d4 <LL_RCC_PLL_IsReady+0x1c>)
 80005be:	681a      	ldr	r2, [r3, #0]
 80005c0:	2380      	movs	r3, #128	; 0x80
 80005c2:	049b      	lsls	r3, r3, #18
 80005c4:	4013      	ands	r3, r2
 80005c6:	1e5a      	subs	r2, r3, #1
 80005c8:	4193      	sbcs	r3, r2
 80005ca:	b2db      	uxtb	r3, r3
 80005cc:	0018      	movs	r0, r3
 80005ce:	46bd      	mov	sp, r7
 80005d0:	bd80      	pop	{r7, pc}
 80005d2:	46c0      	nop			; (mov r8, r8)
 80005d4:	40021000 	.word	0x40021000

080005d8 <LL_RCC_PLL_ConfigDomain_SYS>:
 80005d8:	b580      	push	{r7, lr}
 80005da:	b082      	sub	sp, #8
 80005dc:	af00      	add	r7, sp, #0
 80005de:	6078      	str	r0, [r7, #4]
 80005e0:	6039      	str	r1, [r7, #0]
 80005e2:	4b0e      	ldr	r3, [pc, #56]	; (800061c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80005e4:	4a0d      	ldr	r2, [pc, #52]	; (800061c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80005e6:	6852      	ldr	r2, [r2, #4]
 80005e8:	490d      	ldr	r1, [pc, #52]	; (8000620 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 80005ea:	4011      	ands	r1, r2
 80005ec:	6878      	ldr	r0, [r7, #4]
 80005ee:	2280      	movs	r2, #128	; 0x80
 80005f0:	0252      	lsls	r2, r2, #9
 80005f2:	4010      	ands	r0, r2
 80005f4:	683a      	ldr	r2, [r7, #0]
 80005f6:	4302      	orrs	r2, r0
 80005f8:	430a      	orrs	r2, r1
 80005fa:	605a      	str	r2, [r3, #4]
 80005fc:	4b07      	ldr	r3, [pc, #28]	; (800061c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80005fe:	4a07      	ldr	r2, [pc, #28]	; (800061c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000600:	6ad2      	ldr	r2, [r2, #44]	; 0x2c
 8000602:	210f      	movs	r1, #15
 8000604:	438a      	bics	r2, r1
 8000606:	0011      	movs	r1, r2
 8000608:	687a      	ldr	r2, [r7, #4]
 800060a:	200f      	movs	r0, #15
 800060c:	4002      	ands	r2, r0
 800060e:	430a      	orrs	r2, r1
 8000610:	62da      	str	r2, [r3, #44]	; 0x2c
 8000612:	46c0      	nop			; (mov r8, r8)
 8000614:	46bd      	mov	sp, r7
 8000616:	b002      	add	sp, #8
 8000618:	bd80      	pop	{r7, pc}
 800061a:	46c0      	nop			; (mov r8, r8)
 800061c:	40021000 	.word	0x40021000
 8000620:	ffc2ffff 	.word	0xffc2ffff

08000624 <LL_FLASH_SetLatency>:
 8000624:	b580      	push	{r7, lr}
 8000626:	b082      	sub	sp, #8
 8000628:	af00      	add	r7, sp, #0
 800062a:	6078      	str	r0, [r7, #4]
 800062c:	4b06      	ldr	r3, [pc, #24]	; (8000648 <LL_FLASH_SetLatency+0x24>)
 800062e:	4a06      	ldr	r2, [pc, #24]	; (8000648 <LL_FLASH_SetLatency+0x24>)
 8000630:	6812      	ldr	r2, [r2, #0]
 8000632:	2101      	movs	r1, #1
 8000634:	438a      	bics	r2, r1
 8000636:	0011      	movs	r1, r2
 8000638:	687a      	ldr	r2, [r7, #4]
 800063a:	430a      	orrs	r2, r1
 800063c:	601a      	str	r2, [r3, #0]
 800063e:	46c0      	nop			; (mov r8, r8)
 8000640:	46bd      	mov	sp, r7
 8000642:	b002      	add	sp, #8
 8000644:	bd80      	pop	{r7, pc}
 8000646:	46c0      	nop			; (mov r8, r8)
 8000648:	40022000 	.word	0x40022000

0800064c <main>:
 800064c:	b580      	push	{r7, lr}
 800064e:	af00      	add	r7, sp, #0
 8000650:	f000 f816 	bl	8000680 <SystemClock_Config>
 8000654:	2380      	movs	r3, #128	; 0x80
 8000656:	031b      	lsls	r3, r3, #12
 8000658:	0018      	movs	r0, r3
 800065a:	f7ff fef7 	bl	800044c <LL_AHB1_GRP1_EnableClock>
 800065e:	2380      	movs	r3, #128	; 0x80
 8000660:	009b      	lsls	r3, r3, #2
 8000662:	4806      	ldr	r0, [pc, #24]	; (800067c <main+0x30>)
 8000664:	2201      	movs	r2, #1
 8000666:	0019      	movs	r1, r3
 8000668:	f7ff ff06 	bl	8000478 <LL_GPIO_SetPinMode>
 800066c:	2380      	movs	r3, #128	; 0x80
 800066e:	005b      	lsls	r3, r3, #1
 8000670:	4802      	ldr	r0, [pc, #8]	; (800067c <main+0x30>)
 8000672:	2201      	movs	r2, #1
 8000674:	0019      	movs	r1, r3
 8000676:	f7ff feff 	bl	8000478 <LL_GPIO_SetPinMode>
 800067a:	e7fe      	b.n	800067a <main+0x2e>
 800067c:	48000800 	.word	0x48000800

08000680 <SystemClock_Config>:
 8000680:	b580      	push	{r7, lr}
 8000682:	af00      	add	r7, sp, #0
 8000684:	2001      	movs	r0, #1
 8000686:	f7ff ffcd 	bl	8000624 <LL_FLASH_SetLatency>
 800068a:	f7ff ff23 	bl	80004d4 <LL_RCC_HSI_Enable>
 800068e:	46c0      	nop			; (mov r8, r8)
 8000690:	f7ff ff2e 	bl	80004f0 <LL_RCC_HSI_IsReady>
 8000694:	0003      	movs	r3, r0
 8000696:	2b01      	cmp	r3, #1
 8000698:	d1fa      	bne.n	8000690 <SystemClock_Config+0x10>
 800069a:	23a0      	movs	r3, #160	; 0xa0
 800069c:	039b      	lsls	r3, r3, #14
 800069e:	0019      	movs	r1, r3
 80006a0:	2000      	movs	r0, #0
 80006a2:	f7ff ff99 	bl	80005d8 <LL_RCC_PLL_ConfigDomain_SYS>
 80006a6:	f7ff ff79 	bl	800059c <LL_RCC_PLL_Enable>
 80006aa:	46c0      	nop			; (mov r8, r8)
 80006ac:	f7ff ff84 	bl	80005b8 <LL_RCC_PLL_IsReady>
 80006b0:	0003      	movs	r3, r0
 80006b2:	2b01      	cmp	r3, #1
 80006b4:	d1fa      	bne.n	80006ac <SystemClock_Config+0x2c>
 80006b6:	2000      	movs	r0, #0
 80006b8:	f7ff ff48 	bl	800054c <LL_RCC_SetAHBPrescaler>
 80006bc:	2002      	movs	r0, #2
 80006be:	f7ff ff25 	bl	800050c <LL_RCC_SetSysClkSource>
 80006c2:	46c0      	nop			; (mov r8, r8)
 80006c4:	f7ff ff36 	bl	8000534 <LL_RCC_GetSysClkSource>
 80006c8:	0003      	movs	r3, r0
 80006ca:	2b08      	cmp	r3, #8
 80006cc:	d1fa      	bne.n	80006c4 <SystemClock_Config+0x44>
 80006ce:	2000      	movs	r0, #0
 80006d0:	f7ff ff50 	bl	8000574 <LL_RCC_SetAPB1Prescaler>
 80006d4:	4b04      	ldr	r3, [pc, #16]	; (80006e8 <SystemClock_Config+0x68>)
 80006d6:	0018      	movs	r0, r3
 80006d8:	f7ff fe94 	bl	8000404 <SysTick_Config>
 80006dc:	4b03      	ldr	r3, [pc, #12]	; (80006ec <SystemClock_Config+0x6c>)
 80006de:	4a04      	ldr	r2, [pc, #16]	; (80006f0 <SystemClock_Config+0x70>)
 80006e0:	601a      	str	r2, [r3, #0]
 80006e2:	46c0      	nop			; (mov r8, r8)
 80006e4:	46bd      	mov	sp, r7
 80006e6:	bd80      	pop	{r7, pc}
 80006e8:	0000bb80 	.word	0x0000bb80
 80006ec:	20000430 	.word	0x20000430
 80006f0:	0a037a00 	.word	0x0a037a00

080006f4 <NMI_Handler>:
 80006f4:	b580      	push	{r7, lr}
 80006f6:	af00      	add	r7, sp, #0
 80006f8:	46c0      	nop			; (mov r8, r8)
 80006fa:	46bd      	mov	sp, r7
 80006fc:	bd80      	pop	{r7, pc}
 80006fe:	46c0      	nop			; (mov r8, r8)

08000700 <HardFault_Handler>:
 8000700:	b580      	push	{r7, lr}
 8000702:	af00      	add	r7, sp, #0
 8000704:	e7fe      	b.n	8000704 <HardFault_Handler+0x4>
 8000706:	46c0      	nop			; (mov r8, r8)

08000708 <SVC_Handler>:
 8000708:	b580      	push	{r7, lr}
 800070a:	af00      	add	r7, sp, #0
 800070c:	46c0      	nop			; (mov r8, r8)
 800070e:	46bd      	mov	sp, r7
 8000710:	bd80      	pop	{r7, pc}
 8000712:	46c0      	nop			; (mov r8, r8)

08000714 <PendSV_Handler>:
 8000714:	b580      	push	{r7, lr}
 8000716:	af00      	add	r7, sp, #0
 8000718:	46c0      	nop			; (mov r8, r8)
 800071a:	46bd      	mov	sp, r7
 800071c:	bd80      	pop	{r7, pc}
 800071e:	46c0      	nop			; (mov r8, r8)

08000720 <SysTick_Handler>:
 8000720:	b580      	push	{r7, lr}
 8000722:	af00      	add	r7, sp, #0
 8000724:	4b0a      	ldr	r3, [pc, #40]	; (8000750 <SysTick_Handler+0x30>)
 8000726:	681b      	ldr	r3, [r3, #0]
 8000728:	1c5a      	adds	r2, r3, #1
 800072a:	4b09      	ldr	r3, [pc, #36]	; (8000750 <SysTick_Handler+0x30>)
 800072c:	601a      	str	r2, [r3, #0]
 800072e:	4b08      	ldr	r3, [pc, #32]	; (8000750 <SysTick_Handler+0x30>)
 8000730:	681b      	ldr	r3, [r3, #0]
 8000732:	2bfa      	cmp	r3, #250	; 0xfa
 8000734:	d109      	bne.n	800074a <SysTick_Handler+0x2a>
 8000736:	2380      	movs	r3, #128	; 0x80
 8000738:	005b      	lsls	r3, r3, #1
 800073a:	4a06      	ldr	r2, [pc, #24]	; (8000754 <SysTick_Handler+0x34>)
 800073c:	0019      	movs	r1, r3
 800073e:	0010      	movs	r0, r2
 8000740:	f7ff feb8 	bl	80004b4 <LL_GPIO_TogglePin>
 8000744:	4b02      	ldr	r3, [pc, #8]	; (8000750 <SysTick_Handler+0x30>)
 8000746:	2200      	movs	r2, #0
 8000748:	601a      	str	r2, [r3, #0]
 800074a:	46c0      	nop			; (mov r8, r8)
 800074c:	46bd      	mov	sp, r7
 800074e:	bd80      	pop	{r7, pc}
 8000750:	20000450 	.word	0x20000450
 8000754:	48000800 	.word	0x48000800

08000758 <SystemInit>:
 8000758:	b580      	push	{r7, lr}
 800075a:	af00      	add	r7, sp, #0
 800075c:	4b1a      	ldr	r3, [pc, #104]	; (80007c8 <SystemInit+0x70>)
 800075e:	4a1a      	ldr	r2, [pc, #104]	; (80007c8 <SystemInit+0x70>)
 8000760:	6812      	ldr	r2, [r2, #0]
 8000762:	2101      	movs	r1, #1
 8000764:	430a      	orrs	r2, r1
 8000766:	601a      	str	r2, [r3, #0]
 8000768:	4b17      	ldr	r3, [pc, #92]	; (80007c8 <SystemInit+0x70>)
 800076a:	4a17      	ldr	r2, [pc, #92]	; (80007c8 <SystemInit+0x70>)
 800076c:	6852      	ldr	r2, [r2, #4]
 800076e:	4917      	ldr	r1, [pc, #92]	; (80007cc <SystemInit+0x74>)
 8000770:	400a      	ands	r2, r1
 8000772:	605a      	str	r2, [r3, #4]
 8000774:	4b14      	ldr	r3, [pc, #80]	; (80007c8 <SystemInit+0x70>)
 8000776:	4a14      	ldr	r2, [pc, #80]	; (80007c8 <SystemInit+0x70>)
 8000778:	6812      	ldr	r2, [r2, #0]
 800077a:	4915      	ldr	r1, [pc, #84]	; (80007d0 <SystemInit+0x78>)
 800077c:	400a      	ands	r2, r1
 800077e:	601a      	str	r2, [r3, #0]
 8000780:	4b11      	ldr	r3, [pc, #68]	; (80007c8 <SystemInit+0x70>)
 8000782:	4a11      	ldr	r2, [pc, #68]	; (80007c8 <SystemInit+0x70>)
 8000784:	6812      	ldr	r2, [r2, #0]
 8000786:	4913      	ldr	r1, [pc, #76]	; (80007d4 <SystemInit+0x7c>)
 8000788:	400a      	ands	r2, r1
 800078a:	601a      	str	r2, [r3, #0]
 800078c:	4b0e      	ldr	r3, [pc, #56]	; (80007c8 <SystemInit+0x70>)
 800078e:	4a0e      	ldr	r2, [pc, #56]	; (80007c8 <SystemInit+0x70>)
 8000790:	6852      	ldr	r2, [r2, #4]
 8000792:	4911      	ldr	r1, [pc, #68]	; (80007d8 <SystemInit+0x80>)
 8000794:	400a      	ands	r2, r1
 8000796:	605a      	str	r2, [r3, #4]
 8000798:	4b0b      	ldr	r3, [pc, #44]	; (80007c8 <SystemInit+0x70>)
 800079a:	4a0b      	ldr	r2, [pc, #44]	; (80007c8 <SystemInit+0x70>)
 800079c:	6ad2      	ldr	r2, [r2, #44]	; 0x2c
 800079e:	210f      	movs	r1, #15
 80007a0:	438a      	bics	r2, r1
 80007a2:	62da      	str	r2, [r3, #44]	; 0x2c
 80007a4:	4b08      	ldr	r3, [pc, #32]	; (80007c8 <SystemInit+0x70>)
 80007a6:	4a08      	ldr	r2, [pc, #32]	; (80007c8 <SystemInit+0x70>)
 80007a8:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80007aa:	490c      	ldr	r1, [pc, #48]	; (80007dc <SystemInit+0x84>)
 80007ac:	400a      	ands	r2, r1
 80007ae:	631a      	str	r2, [r3, #48]	; 0x30
 80007b0:	4b05      	ldr	r3, [pc, #20]	; (80007c8 <SystemInit+0x70>)
 80007b2:	4a05      	ldr	r2, [pc, #20]	; (80007c8 <SystemInit+0x70>)
 80007b4:	6b52      	ldr	r2, [r2, #52]	; 0x34
 80007b6:	2101      	movs	r1, #1
 80007b8:	438a      	bics	r2, r1
 80007ba:	635a      	str	r2, [r3, #52]	; 0x34
 80007bc:	4b02      	ldr	r3, [pc, #8]	; (80007c8 <SystemInit+0x70>)
 80007be:	2200      	movs	r2, #0
 80007c0:	609a      	str	r2, [r3, #8]
 80007c2:	46c0      	nop			; (mov r8, r8)
 80007c4:	46bd      	mov	sp, r7
 80007c6:	bd80      	pop	{r7, pc}
 80007c8:	40021000 	.word	0x40021000
 80007cc:	f8ffb80c 	.word	0xf8ffb80c
 80007d0:	fef6ffff 	.word	0xfef6ffff
 80007d4:	fffbffff 	.word	0xfffbffff
 80007d8:	ffc0ffff 	.word	0xffc0ffff
 80007dc:	fffffeac 	.word	0xfffffeac

080007e0 <register_fini>:
 80007e0:	4b03      	ldr	r3, [pc, #12]	; (80007f0 <register_fini+0x10>)
 80007e2:	b510      	push	{r4, lr}
 80007e4:	2b00      	cmp	r3, #0
 80007e6:	d002      	beq.n	80007ee <register_fini+0xe>
 80007e8:	4802      	ldr	r0, [pc, #8]	; (80007f4 <register_fini+0x14>)
 80007ea:	f7ff fcc3 	bl	8000174 <atexit>
 80007ee:	bd10      	pop	{r4, pc}
 80007f0:	00000000 	.word	0x00000000
 80007f4:	08000185 	.word	0x08000185

080007f8 <_init>:
 80007f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80007fa:	46c0      	nop			; (mov r8, r8)
 80007fc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80007fe:	bc08      	pop	{r3}
 8000800:	469e      	mov	lr, r3
 8000802:	4770      	bx	lr

08000804 <_fini>:
 8000804:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000806:	46c0      	nop			; (mov r8, r8)
 8000808:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800080a:	bc08      	pop	{r3}
 800080c:	469e      	mov	lr, r3
 800080e:	4770      	bx	lr
