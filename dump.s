
main.elf:     file format elf32-littlearm


Disassembly of section .text:

000000c0 <deregister_tm_clones>:
      c0:	4803      	ldr	r0, [pc, #12]	@ (d0 <deregister_tm_clones+0x10>)
      c2:	4b04      	ldr	r3, [pc, #16]	@ (d4 <deregister_tm_clones+0x14>)
      c4:	4283      	cmp	r3, r0
      c6:	d002      	beq.n	ce <deregister_tm_clones+0xe>
      c8:	4b03      	ldr	r3, [pc, #12]	@ (d8 <deregister_tm_clones+0x18>)
      ca:	b103      	cbz	r3, ce <deregister_tm_clones+0xe>
      cc:	4718      	bx	r3
      ce:	4770      	bx	lr
      d0:	00007f78 	.word	0x00007f78
      d4:	00007f78 	.word	0x00007f78
      d8:	00000000 	.word	0x00000000

000000dc <register_tm_clones>:
      dc:	4805      	ldr	r0, [pc, #20]	@ (f4 <register_tm_clones+0x18>)
      de:	4b06      	ldr	r3, [pc, #24]	@ (f8 <register_tm_clones+0x1c>)
      e0:	1a1b      	subs	r3, r3, r0
      e2:	0fd9      	lsrs	r1, r3, #31
      e4:	eb01 01a3 	add.w	r1, r1, r3, asr #2
      e8:	1049      	asrs	r1, r1, #1
      ea:	d002      	beq.n	f2 <register_tm_clones+0x16>
      ec:	4b03      	ldr	r3, [pc, #12]	@ (fc <register_tm_clones+0x20>)
      ee:	b103      	cbz	r3, f2 <register_tm_clones+0x16>
      f0:	4718      	bx	r3
      f2:	4770      	bx	lr
      f4:	00007f78 	.word	0x00007f78
      f8:	00007f78 	.word	0x00007f78
      fc:	00000000 	.word	0x00000000

00000100 <__do_global_dtors_aux>:
     100:	b510      	push	{r4, lr}
     102:	4c06      	ldr	r4, [pc, #24]	@ (11c <__do_global_dtors_aux+0x1c>)
     104:	7823      	ldrb	r3, [r4, #0]
     106:	b943      	cbnz	r3, 11a <__do_global_dtors_aux+0x1a>
     108:	f7ff ffda 	bl	c0 <deregister_tm_clones>
     10c:	4b04      	ldr	r3, [pc, #16]	@ (120 <__do_global_dtors_aux+0x20>)
     10e:	b113      	cbz	r3, 116 <__do_global_dtors_aux+0x16>
     110:	4804      	ldr	r0, [pc, #16]	@ (124 <__do_global_dtors_aux+0x24>)
     112:	f3af 8000 	nop.w
     116:	2301      	movs	r3, #1
     118:	7023      	strb	r3, [r4, #0]
     11a:	bd10      	pop	{r4, pc}
     11c:	00007f78 	.word	0x00007f78
     120:	00000000 	.word	0x00000000
     124:	000077f0 	.word	0x000077f0

00000128 <frame_dummy>:
     128:	b508      	push	{r3, lr}
     12a:	4b04      	ldr	r3, [pc, #16]	@ (13c <frame_dummy+0x14>)
     12c:	b11b      	cbz	r3, 136 <frame_dummy+0xe>
     12e:	4904      	ldr	r1, [pc, #16]	@ (140 <frame_dummy+0x18>)
     130:	4804      	ldr	r0, [pc, #16]	@ (144 <frame_dummy+0x1c>)
     132:	f3af 8000 	nop.w
     136:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
     13a:	e7cf      	b.n	dc <register_tm_clones>
     13c:	00000000 	.word	0x00000000
     140:	00007f7c 	.word	0x00007f7c
     144:	000077f0 	.word	0x000077f0

00000148 <_stack_init>:
     148:	f5a3 3a80 	sub.w	sl, r3, #65536	@ 0x10000
     14c:	4770      	bx	lr
     14e:	bf00      	nop

00000150 <_mainCRTStartup>:
     150:	4b15      	ldr	r3, [pc, #84]	@ (1a8 <_mainCRTStartup+0x58>)
     152:	2b00      	cmp	r3, #0
     154:	bf08      	it	eq
     156:	4b11      	ldreq	r3, [pc, #68]	@ (19c <_mainCRTStartup+0x4c>)
     158:	469d      	mov	sp, r3
     15a:	f7ff fff5 	bl	148 <_stack_init>
     15e:	2100      	movs	r1, #0
     160:	468b      	mov	fp, r1
     162:	460f      	mov	r7, r1
     164:	4811      	ldr	r0, [pc, #68]	@ (1ac <_mainCRTStartup+0x5c>)
     166:	4a12      	ldr	r2, [pc, #72]	@ (1b0 <_mainCRTStartup+0x60>)
     168:	1a12      	subs	r2, r2, r0
     16a:	f000 fb3b 	bl	7e4 <memset>
     16e:	4b0c      	ldr	r3, [pc, #48]	@ (1a0 <_mainCRTStartup+0x50>)
     170:	2b00      	cmp	r3, #0
     172:	d000      	beq.n	176 <_mainCRTStartup+0x26>
     174:	4798      	blx	r3
     176:	4b0b      	ldr	r3, [pc, #44]	@ (1a4 <_mainCRTStartup+0x54>)
     178:	2b00      	cmp	r3, #0
     17a:	d000      	beq.n	17e <_mainCRTStartup+0x2e>
     17c:	4798      	blx	r3
     17e:	2000      	movs	r0, #0
     180:	2100      	movs	r1, #0
     182:	0004      	movs	r4, r0
     184:	000d      	movs	r5, r1
     186:	480b      	ldr	r0, [pc, #44]	@ (1b4 <_mainCRTStartup+0x64>)
     188:	f000 fbea 	bl	960 <atexit>
     18c:	f000 fbb2 	bl	8f4 <__libc_init_array>
     190:	0020      	movs	r0, r4
     192:	0029      	movs	r1, r5
     194:	f000 f810 	bl	1b8 <main>
     198:	f000 fbd4 	bl	944 <exit>
     19c:	00080000 	.word	0x00080000
	...
     1a8:	20400000 	.word	0x20400000
     1ac:	00007f78 	.word	0x00007f78
     1b0:	000082b0 	.word	0x000082b0
     1b4:	000009b5 	.word	0x000009b5

000001b8 <main>:
     1b8:	b580      	push	{r7, lr}
     1ba:	b084      	sub	sp, #16
     1bc:	af00      	add	r7, sp, #0
     1be:	2305      	movs	r3, #5
     1c0:	60fb      	str	r3, [r7, #12]
     1c2:	2303      	movs	r3, #3
     1c4:	60bb      	str	r3, [r7, #8]
     1c6:	68fb      	ldr	r3, [r7, #12]
     1c8:	68ba      	ldr	r2, [r7, #8]
     1ca:	fb02 f303 	mul.w	r3, r2, r3
     1ce:	3302      	adds	r3, #2
     1d0:	607b      	str	r3, [r7, #4]
     1d2:	6879      	ldr	r1, [r7, #4]
     1d4:	4803      	ldr	r0, [pc, #12]	@ (1e4 <main+0x2c>)
     1d6:	f000 fbd9 	bl	98c <printf>
     1da:	2300      	movs	r3, #0
     1dc:	4618      	mov	r0, r3
     1de:	3710      	adds	r7, #16
     1e0:	46bd      	mov	sp, r7
     1e2:	bd80      	pop	{r7, pc}
     1e4:	000073a0 	.word	0x000073a0
     1e8:	e7fe      	b.n	1e8 <main+0x30>
     1ea:	e7fe      	b.n	1ea <main+0x32>
     1ec:	e7fe      	b.n	1ec <main+0x34>
     1ee:	e7fe      	b.n	1ee <main+0x36>
     1f0:	e7fe      	b.n	1f0 <main+0x38>
     1f2:	e7fe      	b.n	1f2 <main+0x3a>
     1f4:	e7fe      	b.n	1f4 <main+0x3c>
     1f6:	e7fe      	b.n	1f6 <main+0x3e>
     1f8:	e7fe      	b.n	1f8 <main+0x40>

000001fa <ADCSPI_Handler>:
     1fa:	e7fe      	b.n	1fa <ADCSPI_Handler>

000001fc <Reset_Handler>:
     1fc:	4907      	ldr	r1, [pc, #28]	@ (21c <system_startup+0xa>)
     1fe:	4a08      	ldr	r2, [pc, #32]	@ (220 <system_startup+0xe>)
     200:	4b08      	ldr	r3, [pc, #32]	@ (224 <system_startup+0x12>)
     202:	2b00      	cmp	r3, #0
     204:	d005      	beq.n	212 <system_startup>
     206:	f04f 0400 	mov.w	r4, #0

0000020a <zero>:
     20a:	f801 4b01 	strb.w	r4, [r1], #1
     20e:	3b01      	subs	r3, #1
     210:	d1fb      	bne.n	20a <zero>

00000212 <system_startup>:
     212:	4805      	ldr	r0, [pc, #20]	@ (228 <system_startup+0x16>)
     214:	4780      	blx	r0
     216:	4805      	ldr	r0, [pc, #20]	@ (22c <system_startup+0x1a>)
     218:	4700      	bx	r0
     21a:	0000      	.short	0x0000
     21c:	00007f78 	.word	0x00007f78
     220:	000082b0 	.word	0x000082b0
     224:	00000338 	.word	0x00000338
     228:	000002c1 	.word	0x000002c1
     22c:	00000151 	.word	0x00000151

00000230 <__NVIC_EnableIRQ>:
     230:	b480      	push	{r7}
     232:	b083      	sub	sp, #12
     234:	af00      	add	r7, sp, #0
     236:	4603      	mov	r3, r0
     238:	71fb      	strb	r3, [r7, #7]
     23a:	f997 3007 	ldrsb.w	r3, [r7, #7]
     23e:	2b00      	cmp	r3, #0
     240:	db0b      	blt.n	25a <__NVIC_EnableIRQ+0x2a>
     242:	79fb      	ldrb	r3, [r7, #7]
     244:	f003 021f 	and.w	r2, r3, #31
     248:	4907      	ldr	r1, [pc, #28]	@ (268 <__NVIC_EnableIRQ+0x38>)
     24a:	f997 3007 	ldrsb.w	r3, [r7, #7]
     24e:	095b      	lsrs	r3, r3, #5
     250:	2001      	movs	r0, #1
     252:	fa00 f202 	lsl.w	r2, r0, r2
     256:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
     25a:	bf00      	nop
     25c:	370c      	adds	r7, #12
     25e:	46bd      	mov	sp, r7
     260:	f85d 7b04 	ldr.w	r7, [sp], #4
     264:	4770      	bx	lr
     266:	bf00      	nop
     268:	e000e100 	.word	0xe000e100

0000026c <__NVIC_SetPriority>:
     26c:	b480      	push	{r7}
     26e:	b083      	sub	sp, #12
     270:	af00      	add	r7, sp, #0
     272:	4603      	mov	r3, r0
     274:	6039      	str	r1, [r7, #0]
     276:	71fb      	strb	r3, [r7, #7]
     278:	f997 3007 	ldrsb.w	r3, [r7, #7]
     27c:	2b00      	cmp	r3, #0
     27e:	db0a      	blt.n	296 <__NVIC_SetPriority+0x2a>
     280:	683b      	ldr	r3, [r7, #0]
     282:	b2da      	uxtb	r2, r3
     284:	490c      	ldr	r1, [pc, #48]	@ (2b8 <__NVIC_SetPriority+0x4c>)
     286:	f997 3007 	ldrsb.w	r3, [r7, #7]
     28a:	0152      	lsls	r2, r2, #5
     28c:	b2d2      	uxtb	r2, r2
     28e:	440b      	add	r3, r1
     290:	f883 2300 	strb.w	r2, [r3, #768]	@ 0x300
     294:	e00a      	b.n	2ac <__NVIC_SetPriority+0x40>
     296:	683b      	ldr	r3, [r7, #0]
     298:	b2da      	uxtb	r2, r3
     29a:	4908      	ldr	r1, [pc, #32]	@ (2bc <__NVIC_SetPriority+0x50>)
     29c:	79fb      	ldrb	r3, [r7, #7]
     29e:	f003 030f 	and.w	r3, r3, #15
     2a2:	3b04      	subs	r3, #4
     2a4:	0152      	lsls	r2, r2, #5
     2a6:	b2d2      	uxtb	r2, r2
     2a8:	440b      	add	r3, r1
     2aa:	761a      	strb	r2, [r3, #24]
     2ac:	bf00      	nop
     2ae:	370c      	adds	r7, #12
     2b0:	46bd      	mov	sp, r7
     2b2:	f85d 7b04 	ldr.w	r7, [sp], #4
     2b6:	4770      	bx	lr
     2b8:	e000e100 	.word	0xe000e100
     2bc:	e000ed00 	.word	0xe000ed00

000002c0 <SystemInit>:
     2c0:	b580      	push	{r7, lr}
     2c2:	af00      	add	r7, sp, #0
     2c4:	4b1e      	ldr	r3, [pc, #120]	@ (340 <bss_size+0x8>)
     2c6:	f8d3 3088 	ldr.w	r3, [r3, #136]	@ 0x88
     2ca:	4a1d      	ldr	r2, [pc, #116]	@ (340 <bss_size+0x8>)
     2cc:	f443 0370 	orr.w	r3, r3, #15728640	@ 0xf00000
     2d0:	f8c2 3088 	str.w	r3, [r2, #136]	@ 0x88
     2d4:	4b1b      	ldr	r3, [pc, #108]	@ (344 <bss_size+0xc>)
     2d6:	699b      	ldr	r3, [r3, #24]
     2d8:	4a1a      	ldr	r2, [pc, #104]	@ (344 <bss_size+0xc>)
     2da:	f043 0301 	orr.w	r3, r3, #1
     2de:	6193      	str	r3, [r2, #24]
     2e0:	4b18      	ldr	r3, [pc, #96]	@ (344 <bss_size+0xc>)
     2e2:	699b      	ldr	r3, [r3, #24]
     2e4:	4a17      	ldr	r2, [pc, #92]	@ (344 <bss_size+0xc>)
     2e6:	f043 0302 	orr.w	r3, r3, #2
     2ea:	6193      	str	r3, [r2, #24]
     2ec:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
     2f0:	f240 228b 	movw	r2, #651	@ 0x28b
     2f4:	611a      	str	r2, [r3, #16]
     2f6:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
     2fa:	689b      	ldr	r3, [r3, #8]
     2fc:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
     300:	f043 0302 	orr.w	r3, r3, #2
     304:	6093      	str	r3, [r2, #8]
     306:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
     30a:	689b      	ldr	r3, [r3, #8]
     30c:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
     310:	f043 0301 	orr.w	r3, r3, #1
     314:	6093      	str	r3, [r2, #8]
     316:	4b0c      	ldr	r3, [pc, #48]	@ (348 <bss_size+0x10>)
     318:	f06f 427f 	mvn.w	r2, #4278190080	@ 0xff000000
     31c:	605a      	str	r2, [r3, #4]
     31e:	2107      	movs	r1, #7
     320:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     324:	f7ff ffa2 	bl	26c <__NVIC_SetPriority>
     328:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     32c:	f7ff ff80 	bl	230 <__NVIC_EnableIRQ>
     330:	4b05      	ldr	r3, [pc, #20]	@ (348 <bss_size+0x10>)
     332:	2200      	movs	r2, #0
     334:	609a      	str	r2, [r3, #8]
     336:	4b04      	ldr	r3, [pc, #16]	@ (348 <bss_size+0x10>)
     338:	2207      	movs	r2, #7
     33a:	601a      	str	r2, [r3, #0]
     33c:	bf00      	nop
     33e:	bd80      	pop	{r7, pc}
     340:	e000ed00 	.word	0xe000ed00
     344:	40010000 	.word	0x40010000
     348:	e000e010 	.word	0xe000e010

0000034c <SysTick_Handler>:
     34c:	b480      	push	{r7}
     34e:	af00      	add	r7, sp, #0
     350:	4b06      	ldr	r3, [pc, #24]	@ (36c <SysTick_Handler+0x20>)
     352:	e9d3 2300 	ldrd	r2, r3, [r3]
     356:	1c50      	adds	r0, r2, #1
     358:	f143 0100 	adc.w	r1, r3, #0
     35c:	4b03      	ldr	r3, [pc, #12]	@ (36c <SysTick_Handler+0x20>)
     35e:	e9c3 0100 	strd	r0, r1, [r3]
     362:	bf00      	nop
     364:	46bd      	mov	sp, r7
     366:	f85d 7b04 	ldr.w	r7, [sp], #4
     36a:	4770      	bx	lr
     36c:	00007f98 	.word	0x00007f98

00000370 <hal_get_time>:
     370:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
     374:	b084      	sub	sp, #16
     376:	af00      	add	r7, sp, #0
     378:	4b17      	ldr	r3, [pc, #92]	@ (3d8 <hal_get_time+0x68>)
     37a:	e9d3 2300 	ldrd	r2, r3, [r3]
     37e:	e9c7 2302 	strd	r2, r3, [r7, #8]
     382:	e9d7 2302 	ldrd	r2, r3, [r7, #8]
     386:	1c50      	adds	r0, r2, #1
     388:	f143 0100 	adc.w	r1, r3, #0
     38c:	f04f 0200 	mov.w	r2, #0
     390:	f04f 0300 	mov.w	r3, #0
     394:	060b      	lsls	r3, r1, #24
     396:	ea43 2310 	orr.w	r3, r3, r0, lsr #8
     39a:	0602      	lsls	r2, r0, #24
     39c:	4e0f      	ldr	r6, [pc, #60]	@ (3dc <hal_get_time+0x6c>)
     39e:	68b6      	ldr	r6, [r6, #8]
     3a0:	f04f 0c00 	mov.w	ip, #0
     3a4:	4634      	mov	r4, r6
     3a6:	4665      	mov	r5, ip
     3a8:	ebb2 0804 	subs.w	r8, r2, r4
     3ac:	eb63 0905 	sbc.w	r9, r3, r5
     3b0:	e9c7 8900 	strd	r8, r9, [r7]
     3b4:	4b08      	ldr	r3, [pc, #32]	@ (3d8 <hal_get_time+0x68>)
     3b6:	e9d3 2300 	ldrd	r2, r3, [r3]
     3ba:	e9d7 ab02 	ldrd	sl, fp, [r7, #8]
     3be:	459b      	cmp	fp, r3
     3c0:	bf08      	it	eq
     3c2:	4592      	cmpeq	sl, r2
     3c4:	d1d8      	bne.n	378 <hal_get_time+0x8>
     3c6:	e9d7 2300 	ldrd	r2, r3, [r7]
     3ca:	4610      	mov	r0, r2
     3cc:	4619      	mov	r1, r3
     3ce:	3710      	adds	r7, #16
     3d0:	46bd      	mov	sp, r7
     3d2:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
     3d6:	4770      	bx	lr
     3d8:	00007f98 	.word	0x00007f98
     3dc:	e000e010 	.word	0xe000e010

000003e0 <hal_setup>:
     3e0:	b480      	push	{r7}
     3e2:	b083      	sub	sp, #12
     3e4:	af00      	add	r7, sp, #0
     3e6:	4603      	mov	r3, r0
     3e8:	71fb      	strb	r3, [r7, #7]
     3ea:	bf00      	nop
     3ec:	370c      	adds	r7, #12
     3ee:	46bd      	mov	sp, r7
     3f0:	f85d 7b04 	ldr.w	r7, [sp], #4
     3f4:	4770      	bx	lr

000003f6 <uart_putc>:
     3f6:	b480      	push	{r7}
     3f8:	b083      	sub	sp, #12
     3fa:	af00      	add	r7, sp, #0
     3fc:	6078      	str	r0, [r7, #4]
     3fe:	bf00      	nop
     400:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
     404:	685b      	ldr	r3, [r3, #4]
     406:	f003 0301 	and.w	r3, r3, #1
     40a:	2b00      	cmp	r3, #0
     40c:	d1f8      	bne.n	400 <STACK_SIZE>
     40e:	687b      	ldr	r3, [r7, #4]
     410:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
     414:	b2db      	uxtb	r3, r3
     416:	6013      	str	r3, [r2, #0]
     418:	bf00      	nop
     41a:	370c      	adds	r7, #12
     41c:	46bd      	mov	sp, r7
     41e:	f85d 7b04 	ldr.w	r7, [sp], #4
     422:	4770      	bx	lr

00000424 <hal_send_str>:
     424:	b580      	push	{r7, lr}
     426:	b084      	sub	sp, #16
     428:	af00      	add	r7, sp, #0
     42a:	6078      	str	r0, [r7, #4]
     42c:	687b      	ldr	r3, [r7, #4]
     42e:	60fb      	str	r3, [r7, #12]
     430:	e007      	b.n	442 <hal_send_str+0x1e>
     432:	68fb      	ldr	r3, [r7, #12]
     434:	781b      	ldrb	r3, [r3, #0]
     436:	4618      	mov	r0, r3
     438:	f7ff ffdd 	bl	3f6 <uart_putc>
     43c:	68fb      	ldr	r3, [r7, #12]
     43e:	3301      	adds	r3, #1
     440:	60fb      	str	r3, [r7, #12]
     442:	68fb      	ldr	r3, [r7, #12]
     444:	781b      	ldrb	r3, [r3, #0]
     446:	2b00      	cmp	r3, #0
     448:	d1f3      	bne.n	432 <hal_send_str+0xe>
     44a:	200a      	movs	r0, #10
     44c:	f7ff ffd3 	bl	3f6 <uart_putc>
     450:	bf00      	nop
     452:	3710      	adds	r7, #16
     454:	46bd      	mov	sp, r7
     456:	bd80      	pop	{r7, pc}

00000458 <semihosting_syscall>:
     458:	b480      	push	{r7}
     45a:	b083      	sub	sp, #12
     45c:	af00      	add	r7, sp, #0
     45e:	6078      	str	r0, [r7, #4]
     460:	6039      	str	r1, [r7, #0]
     462:	683a      	ldr	r2, [r7, #0]
     464:	687b      	ldr	r3, [r7, #4]
     466:	4618      	mov	r0, r3
     468:	4611      	mov	r1, r2
     46a:	beab      	bkpt	0x00ab
     46c:	4603      	mov	r3, r0
     46e:	607b      	str	r3, [r7, #4]
     470:	687b      	ldr	r3, [r7, #4]
     472:	4618      	mov	r0, r3
     474:	370c      	adds	r7, #12
     476:	46bd      	mov	sp, r7
     478:	f85d 7b04 	ldr.w	r7, [sp], #4
     47c:	4770      	bx	lr

0000047e <semihosting_exit>:
     47e:	b580      	push	{r7, lr}
     480:	af00      	add	r7, sp, #0
     482:	2318      	movs	r3, #24
     484:	4a03      	ldr	r2, [pc, #12]	@ (494 <semihosting_exit+0x16>)
     486:	4611      	mov	r1, r2
     488:	4618      	mov	r0, r3
     48a:	f7ff ffe5 	bl	458 <semihosting_syscall>
     48e:	bf00      	nop
     490:	bd80      	pop	{r7, pc}
     492:	bf00      	nop
     494:	00020026 	.word	0x00020026

00000498 <NMI_Handler>:
     498:	b580      	push	{r7, lr}
     49a:	af00      	add	r7, sp, #0
     49c:	4805      	ldr	r0, [pc, #20]	@ (4b4 <NMI_Handler+0x1c>)
     49e:	f7ff ffc1 	bl	424 <hal_send_str>
     4a2:	2318      	movs	r3, #24
     4a4:	4a04      	ldr	r2, [pc, #16]	@ (4b8 <NMI_Handler+0x20>)
     4a6:	4611      	mov	r1, r2
     4a8:	4618      	mov	r0, r3
     4aa:	f7ff ffd5 	bl	458 <semihosting_syscall>
     4ae:	bf00      	nop
     4b0:	bd80      	pop	{r7, pc}
     4b2:	bf00      	nop
     4b4:	000073b8 	.word	0x000073b8
     4b8:	00020026 	.word	0x00020026

000004bc <HardFault_Handler>:
     4bc:	b580      	push	{r7, lr}
     4be:	af00      	add	r7, sp, #0
     4c0:	4805      	ldr	r0, [pc, #20]	@ (4d8 <HardFault_Handler+0x1c>)
     4c2:	f7ff ffaf 	bl	424 <hal_send_str>
     4c6:	2318      	movs	r3, #24
     4c8:	4a04      	ldr	r2, [pc, #16]	@ (4dc <HardFault_Handler+0x20>)
     4ca:	4611      	mov	r1, r2
     4cc:	4618      	mov	r0, r3
     4ce:	f7ff ffc3 	bl	458 <semihosting_syscall>
     4d2:	bf00      	nop
     4d4:	bd80      	pop	{r7, pc}
     4d6:	bf00      	nop
     4d8:	000073c4 	.word	0x000073c4
     4dc:	00020026 	.word	0x00020026

000004e0 <MemManage_Handler>:
     4e0:	b580      	push	{r7, lr}
     4e2:	af00      	add	r7, sp, #0
     4e4:	4805      	ldr	r0, [pc, #20]	@ (4fc <MemManage_Handler+0x1c>)
     4e6:	f7ff ff9d 	bl	424 <hal_send_str>
     4ea:	2318      	movs	r3, #24
     4ec:	4a04      	ldr	r2, [pc, #16]	@ (500 <MemManage_Handler+0x20>)
     4ee:	4611      	mov	r1, r2
     4f0:	4618      	mov	r0, r3
     4f2:	f7ff ffb1 	bl	458 <semihosting_syscall>
     4f6:	bf00      	nop
     4f8:	bd80      	pop	{r7, pc}
     4fa:	bf00      	nop
     4fc:	000073d8 	.word	0x000073d8
     500:	00020026 	.word	0x00020026

00000504 <BusFault_Handler>:
     504:	b580      	push	{r7, lr}
     506:	af00      	add	r7, sp, #0
     508:	4805      	ldr	r0, [pc, #20]	@ (520 <BusFault_Handler+0x1c>)
     50a:	f7ff ff8b 	bl	424 <hal_send_str>
     50e:	2318      	movs	r3, #24
     510:	4a04      	ldr	r2, [pc, #16]	@ (524 <BusFault_Handler+0x20>)
     512:	4611      	mov	r1, r2
     514:	4618      	mov	r0, r3
     516:	f7ff ff9f 	bl	458 <semihosting_syscall>
     51a:	bf00      	nop
     51c:	bd80      	pop	{r7, pc}
     51e:	bf00      	nop
     520:	000073ec 	.word	0x000073ec
     524:	00020026 	.word	0x00020026

00000528 <UsageFault_Handler>:
     528:	b580      	push	{r7, lr}
     52a:	af00      	add	r7, sp, #0
     52c:	4805      	ldr	r0, [pc, #20]	@ (544 <UsageFault_Handler+0x1c>)
     52e:	f7ff ff79 	bl	424 <hal_send_str>
     532:	2318      	movs	r3, #24
     534:	4a04      	ldr	r2, [pc, #16]	@ (548 <UsageFault_Handler+0x20>)
     536:	4611      	mov	r1, r2
     538:	4618      	mov	r0, r3
     53a:	f7ff ff8d 	bl	458 <semihosting_syscall>
     53e:	bf00      	nop
     540:	bd80      	pop	{r7, pc}
     542:	bf00      	nop
     544:	00007400 	.word	0x00007400
     548:	00020026 	.word	0x00020026

0000054c <SVC_Handler>:
     54c:	b580      	push	{r7, lr}
     54e:	af00      	add	r7, sp, #0
     550:	4805      	ldr	r0, [pc, #20]	@ (568 <SVC_Handler+0x1c>)
     552:	f7ff ff67 	bl	424 <hal_send_str>
     556:	2318      	movs	r3, #24
     558:	4a04      	ldr	r2, [pc, #16]	@ (56c <SVC_Handler+0x20>)
     55a:	4611      	mov	r1, r2
     55c:	4618      	mov	r0, r3
     55e:	f7ff ff7b 	bl	458 <semihosting_syscall>
     562:	bf00      	nop
     564:	bd80      	pop	{r7, pc}
     566:	bf00      	nop
     568:	00007414 	.word	0x00007414
     56c:	00020026 	.word	0x00020026

00000570 <DebugMon_Handler>:
     570:	b580      	push	{r7, lr}
     572:	af00      	add	r7, sp, #0
     574:	4805      	ldr	r0, [pc, #20]	@ (58c <DebugMon_Handler+0x1c>)
     576:	f7ff ff55 	bl	424 <hal_send_str>
     57a:	2318      	movs	r3, #24
     57c:	4a04      	ldr	r2, [pc, #16]	@ (590 <DebugMon_Handler+0x20>)
     57e:	4611      	mov	r1, r2
     580:	4618      	mov	r0, r3
     582:	f7ff ff69 	bl	458 <semihosting_syscall>
     586:	bf00      	nop
     588:	bd80      	pop	{r7, pc}
     58a:	bf00      	nop
     58c:	00007420 	.word	0x00007420
     590:	00020026 	.word	0x00020026

00000594 <PendSV_Handler>:
     594:	b580      	push	{r7, lr}
     596:	af00      	add	r7, sp, #0
     598:	4805      	ldr	r0, [pc, #20]	@ (5b0 <PendSV_Handler+0x1c>)
     59a:	f7ff ff43 	bl	424 <hal_send_str>
     59e:	2318      	movs	r3, #24
     5a0:	4a04      	ldr	r2, [pc, #16]	@ (5b4 <PendSV_Handler+0x20>)
     5a2:	4611      	mov	r1, r2
     5a4:	4618      	mov	r0, r3
     5a6:	f7ff ff57 	bl	458 <semihosting_syscall>
     5aa:	bf00      	nop
     5ac:	bd80      	pop	{r7, pc}
     5ae:	bf00      	nop
     5b0:	00007434 	.word	0x00007434
     5b4:	00020026 	.word	0x00020026

000005b8 <Default_Handler>:
     5b8:	b580      	push	{r7, lr}
     5ba:	af00      	add	r7, sp, #0
     5bc:	2318      	movs	r3, #24
     5be:	4a03      	ldr	r2, [pc, #12]	@ (5cc <Default_Handler+0x14>)
     5c0:	4611      	mov	r1, r2
     5c2:	4618      	mov	r0, r3
     5c4:	f7ff ff48 	bl	458 <semihosting_syscall>
     5c8:	bf00      	nop
     5ca:	bd80      	pop	{r7, pc}
     5cc:	00020026 	.word	0x00020026

000005d0 <__wrap__sbrk>:
     5d0:	b480      	push	{r7}
     5d2:	b085      	sub	sp, #20
     5d4:	af00      	add	r7, sp, #0
     5d6:	6078      	str	r0, [r7, #4]
     5d8:	4b07      	ldr	r3, [pc, #28]	@ (5f8 <__wrap__sbrk+0x28>)
     5da:	681b      	ldr	r3, [r3, #0]
     5dc:	60fb      	str	r3, [r7, #12]
     5de:	4b06      	ldr	r3, [pc, #24]	@ (5f8 <__wrap__sbrk+0x28>)
     5e0:	681a      	ldr	r2, [r3, #0]
     5e2:	687b      	ldr	r3, [r7, #4]
     5e4:	4413      	add	r3, r2
     5e6:	4a04      	ldr	r2, [pc, #16]	@ (5f8 <__wrap__sbrk+0x28>)
     5e8:	6013      	str	r3, [r2, #0]
     5ea:	68fb      	ldr	r3, [r7, #12]
     5ec:	4618      	mov	r0, r3
     5ee:	3714      	adds	r7, #20
     5f0:	46bd      	mov	sp, r7
     5f2:	f85d 7b04 	ldr.w	r7, [sp], #4
     5f6:	4770      	bx	lr
     5f8:	000078b4 	.word	0x000078b4

000005fc <hal_get_stack_size>:
     5fc:	b490      	push	{r4, r7}
     5fe:	af00      	add	r7, sp, #0
     600:	466b      	mov	r3, sp
     602:	461c      	mov	r4, r3
     604:	4b03      	ldr	r3, [pc, #12]	@ (614 <hal_get_stack_size+0x18>)
     606:	681b      	ldr	r3, [r3, #0]
     608:	1ae3      	subs	r3, r4, r3
     60a:	4618      	mov	r0, r3
     60c:	46bd      	mov	sp, r7
     60e:	bc90      	pop	{r4, r7}
     610:	4770      	bx	lr
     612:	bf00      	nop
     614:	000078b4 	.word	0x000078b4

00000618 <hal_spraystack>:
     618:	b480      	push	{r7}
     61a:	b083      	sub	sp, #12
     61c:	af00      	add	r7, sp, #0
     61e:	4b0a      	ldr	r3, [pc, #40]	@ (648 <hal_spraystack+0x30>)
     620:	681b      	ldr	r3, [r3, #0]
     622:	607b      	str	r3, [r7, #4]
     624:	4909      	ldr	r1, [pc, #36]	@ (64c <hal_spraystack+0x34>)
     626:	4b0a      	ldr	r3, [pc, #40]	@ (650 <hal_spraystack+0x38>)
     628:	681a      	ldr	r2, [r3, #0]
     62a:	687b      	ldr	r3, [r7, #4]
     62c:	466a      	mov	r2, sp
     62e:	f843 1b04 	str.w	r1, [r3], #4
     632:	4293      	cmp	r3, r2
     634:	dbfb      	blt.n	62e <hal_spraystack+0x16>
     636:	4906      	ldr	r1, [pc, #24]	@ (650 <hal_spraystack+0x38>)
     638:	600a      	str	r2, [r1, #0]
     63a:	607b      	str	r3, [r7, #4]
     63c:	bf00      	nop
     63e:	370c      	adds	r7, #12
     640:	46bd      	mov	sp, r7
     642:	f85d 7b04 	ldr.w	r7, [sp], #4
     646:	4770      	bx	lr
     648:	000078b4 	.word	0x000078b4
     64c:	deadbeef 	.word	0xdeadbeef
     650:	00007fa0 	.word	0x00007fa0

00000654 <hal_checkstack>:
     654:	b480      	push	{r7}
     656:	b083      	sub	sp, #12
     658:	af00      	add	r7, sp, #0
     65a:	2300      	movs	r3, #0
     65c:	607b      	str	r3, [r7, #4]
     65e:	4b0c      	ldr	r3, [pc, #48]	@ (690 <hal_checkstack+0x3c>)
     660:	681a      	ldr	r2, [r3, #0]
     662:	4b0c      	ldr	r3, [pc, #48]	@ (694 <hal_checkstack+0x40>)
     664:	6819      	ldr	r1, [r3, #0]
     666:	480c      	ldr	r0, [pc, #48]	@ (698 <hal_checkstack+0x44>)
     668:	687b      	ldr	r3, [r7, #4]
     66a:	eba2 0301 	sub.w	r3, r2, r1
     66e:	f851 cb04 	ldr.w	ip, [r1], #4
     672:	4584      	cmp	ip, r0
     674:	bf0c      	ite	eq
     676:	3b04      	subeq	r3, #4
     678:	e001      	bne.n	67e <hal_checkstack+0x2a>
     67a:	4291      	cmp	r1, r2
     67c:	dbf7      	blt.n	66e <hal_checkstack+0x1a>
     67e:	607b      	str	r3, [r7, #4]
     680:	687b      	ldr	r3, [r7, #4]
     682:	4618      	mov	r0, r3
     684:	370c      	adds	r7, #12
     686:	46bd      	mov	sp, r7
     688:	f85d 7b04 	ldr.w	r7, [sp], #4
     68c:	4770      	bx	lr
     68e:	bf00      	nop
     690:	00007fa0 	.word	0x00007fa0
     694:	000078b4 	.word	0x000078b4
     698:	deadbeef 	.word	0xdeadbeef

0000069c <__wrap__open>:
     69c:	b480      	push	{r7}
     69e:	b085      	sub	sp, #20
     6a0:	af00      	add	r7, sp, #0
     6a2:	60f8      	str	r0, [r7, #12]
     6a4:	60b9      	str	r1, [r7, #8]
     6a6:	607a      	str	r2, [r7, #4]
     6a8:	4b05      	ldr	r3, [pc, #20]	@ (6c0 <__wrap__open+0x24>)
     6aa:	2258      	movs	r2, #88	@ 0x58
     6ac:	601a      	str	r2, [r3, #0]
     6ae:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     6b2:	4618      	mov	r0, r3
     6b4:	3714      	adds	r7, #20
     6b6:	46bd      	mov	sp, r7
     6b8:	f85d 7b04 	ldr.w	r7, [sp], #4
     6bc:	4770      	bx	lr
     6be:	bf00      	nop
     6c0:	00007fa4 	.word	0x00007fa4

000006c4 <__wrap__close>:
     6c4:	b480      	push	{r7}
     6c6:	b083      	sub	sp, #12
     6c8:	af00      	add	r7, sp, #0
     6ca:	6078      	str	r0, [r7, #4]
     6cc:	4b05      	ldr	r3, [pc, #20]	@ (6e4 <__wrap__close+0x20>)
     6ce:	2258      	movs	r2, #88	@ 0x58
     6d0:	601a      	str	r2, [r3, #0]
     6d2:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     6d6:	4618      	mov	r0, r3
     6d8:	370c      	adds	r7, #12
     6da:	46bd      	mov	sp, r7
     6dc:	f85d 7b04 	ldr.w	r7, [sp], #4
     6e0:	4770      	bx	lr
     6e2:	bf00      	nop
     6e4:	00007fa4 	.word	0x00007fa4

000006e8 <__wrap__fstat>:
     6e8:	b480      	push	{r7}
     6ea:	b083      	sub	sp, #12
     6ec:	af00      	add	r7, sp, #0
     6ee:	6078      	str	r0, [r7, #4]
     6f0:	6039      	str	r1, [r7, #0]
     6f2:	4b05      	ldr	r3, [pc, #20]	@ (708 <__wrap__fstat+0x20>)
     6f4:	2258      	movs	r2, #88	@ 0x58
     6f6:	601a      	str	r2, [r3, #0]
     6f8:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     6fc:	4618      	mov	r0, r3
     6fe:	370c      	adds	r7, #12
     700:	46bd      	mov	sp, r7
     702:	f85d 7b04 	ldr.w	r7, [sp], #4
     706:	4770      	bx	lr
     708:	00007fa4 	.word	0x00007fa4

0000070c <__wrap__getpid>:
     70c:	b480      	push	{r7}
     70e:	af00      	add	r7, sp, #0
     710:	4b04      	ldr	r3, [pc, #16]	@ (724 <__wrap__getpid+0x18>)
     712:	2258      	movs	r2, #88	@ 0x58
     714:	601a      	str	r2, [r3, #0]
     716:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     71a:	4618      	mov	r0, r3
     71c:	46bd      	mov	sp, r7
     71e:	f85d 7b04 	ldr.w	r7, [sp], #4
     722:	4770      	bx	lr
     724:	00007fa4 	.word	0x00007fa4

00000728 <__wrap__isatty>:
     728:	b480      	push	{r7}
     72a:	b083      	sub	sp, #12
     72c:	af00      	add	r7, sp, #0
     72e:	6078      	str	r0, [r7, #4]
     730:	4b04      	ldr	r3, [pc, #16]	@ (744 <__wrap__isatty+0x1c>)
     732:	2258      	movs	r2, #88	@ 0x58
     734:	601a      	str	r2, [r3, #0]
     736:	2300      	movs	r3, #0
     738:	4618      	mov	r0, r3
     73a:	370c      	adds	r7, #12
     73c:	46bd      	mov	sp, r7
     73e:	f85d 7b04 	ldr.w	r7, [sp], #4
     742:	4770      	bx	lr
     744:	00007fa4 	.word	0x00007fa4

00000748 <__wrap__kill>:
     748:	b480      	push	{r7}
     74a:	b083      	sub	sp, #12
     74c:	af00      	add	r7, sp, #0
     74e:	6078      	str	r0, [r7, #4]
     750:	6039      	str	r1, [r7, #0]
     752:	4b05      	ldr	r3, [pc, #20]	@ (768 <__wrap__kill+0x20>)
     754:	2258      	movs	r2, #88	@ 0x58
     756:	601a      	str	r2, [r3, #0]
     758:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     75c:	4618      	mov	r0, r3
     75e:	370c      	adds	r7, #12
     760:	46bd      	mov	sp, r7
     762:	f85d 7b04 	ldr.w	r7, [sp], #4
     766:	4770      	bx	lr
     768:	00007fa4 	.word	0x00007fa4

0000076c <__wrap__lseek>:
     76c:	b480      	push	{r7}
     76e:	b085      	sub	sp, #20
     770:	af00      	add	r7, sp, #0
     772:	60f8      	str	r0, [r7, #12]
     774:	60b9      	str	r1, [r7, #8]
     776:	607a      	str	r2, [r7, #4]
     778:	4b05      	ldr	r3, [pc, #20]	@ (790 <__wrap__lseek+0x24>)
     77a:	2258      	movs	r2, #88	@ 0x58
     77c:	601a      	str	r2, [r3, #0]
     77e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     782:	4618      	mov	r0, r3
     784:	3714      	adds	r7, #20
     786:	46bd      	mov	sp, r7
     788:	f85d 7b04 	ldr.w	r7, [sp], #4
     78c:	4770      	bx	lr
     78e:	bf00      	nop
     790:	00007fa4 	.word	0x00007fa4

00000794 <__wrap__read>:
     794:	b480      	push	{r7}
     796:	b085      	sub	sp, #20
     798:	af00      	add	r7, sp, #0
     79a:	60f8      	str	r0, [r7, #12]
     79c:	60b9      	str	r1, [r7, #8]
     79e:	607a      	str	r2, [r7, #4]
     7a0:	4b05      	ldr	r3, [pc, #20]	@ (7b8 <__wrap__read+0x24>)
     7a2:	2258      	movs	r2, #88	@ 0x58
     7a4:	601a      	str	r2, [r3, #0]
     7a6:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     7aa:	4618      	mov	r0, r3
     7ac:	3714      	adds	r7, #20
     7ae:	46bd      	mov	sp, r7
     7b0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b4:	4770      	bx	lr
     7b6:	bf00      	nop
     7b8:	00007fa4 	.word	0x00007fa4

000007bc <__wrap__write>:
     7bc:	b480      	push	{r7}
     7be:	b085      	sub	sp, #20
     7c0:	af00      	add	r7, sp, #0
     7c2:	60f8      	str	r0, [r7, #12]
     7c4:	60b9      	str	r1, [r7, #8]
     7c6:	607a      	str	r2, [r7, #4]
     7c8:	4b05      	ldr	r3, [pc, #20]	@ (7e0 <__wrap__write+0x24>)
     7ca:	2258      	movs	r2, #88	@ 0x58
     7cc:	601a      	str	r2, [r3, #0]
     7ce:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
     7d2:	4618      	mov	r0, r3
     7d4:	3714      	adds	r7, #20
     7d6:	46bd      	mov	sp, r7
     7d8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7dc:	4770      	bx	lr
     7de:	bf00      	nop
     7e0:	00007fa4 	.word	0x00007fa4

000007e4 <memset>:
     7e4:	0783      	lsls	r3, r0, #30
     7e6:	b530      	push	{r4, r5, lr}
     7e8:	d047      	beq.n	87a <memset+0x96>
     7ea:	1e54      	subs	r4, r2, #1
     7ec:	2a00      	cmp	r2, #0
     7ee:	d03e      	beq.n	86e <memset+0x8a>
     7f0:	b2ca      	uxtb	r2, r1
     7f2:	4603      	mov	r3, r0
     7f4:	e001      	b.n	7fa <memset+0x16>
     7f6:	3c01      	subs	r4, #1
     7f8:	d339      	bcc.n	86e <memset+0x8a>
     7fa:	f803 2b01 	strb.w	r2, [r3], #1
     7fe:	079d      	lsls	r5, r3, #30
     800:	d1f9      	bne.n	7f6 <memset+0x12>
     802:	2c03      	cmp	r4, #3
     804:	d92c      	bls.n	860 <memset+0x7c>
     806:	b2cd      	uxtb	r5, r1
     808:	eb05 2505 	add.w	r5, r5, r5, lsl #8
     80c:	2c0f      	cmp	r4, #15
     80e:	eb05 4505 	add.w	r5, r5, r5, lsl #16
     812:	d935      	bls.n	880 <memset+0x9c>
     814:	f1a4 0210 	sub.w	r2, r4, #16
     818:	f022 0c0f 	bic.w	ip, r2, #15
     81c:	f103 0e10 	add.w	lr, r3, #16
     820:	44e6      	add	lr, ip
     822:	ea4f 1c12 	mov.w	ip, r2, lsr #4
     826:	461a      	mov	r2, r3
     828:	e9c2 5500 	strd	r5, r5, [r2]
     82c:	e9c2 5502 	strd	r5, r5, [r2, #8]
     830:	3210      	adds	r2, #16
     832:	4572      	cmp	r2, lr
     834:	d1f8      	bne.n	828 <memset+0x44>
     836:	f10c 0201 	add.w	r2, ip, #1
     83a:	f014 0f0c 	tst.w	r4, #12
     83e:	eb03 1202 	add.w	r2, r3, r2, lsl #4
     842:	f004 0c0f 	and.w	ip, r4, #15
     846:	d013      	beq.n	870 <memset+0x8c>
     848:	f1ac 0304 	sub.w	r3, ip, #4
     84c:	f023 0303 	bic.w	r3, r3, #3
     850:	3304      	adds	r3, #4
     852:	4413      	add	r3, r2
     854:	f842 5b04 	str.w	r5, [r2], #4
     858:	4293      	cmp	r3, r2
     85a:	d1fb      	bne.n	854 <memset+0x70>
     85c:	f00c 0403 	and.w	r4, ip, #3
     860:	b12c      	cbz	r4, 86e <memset+0x8a>
     862:	b2c9      	uxtb	r1, r1
     864:	441c      	add	r4, r3
     866:	f803 1b01 	strb.w	r1, [r3], #1
     86a:	42a3      	cmp	r3, r4
     86c:	d1fb      	bne.n	866 <memset+0x82>
     86e:	bd30      	pop	{r4, r5, pc}
     870:	4664      	mov	r4, ip
     872:	4613      	mov	r3, r2
     874:	2c00      	cmp	r4, #0
     876:	d1f4      	bne.n	862 <memset+0x7e>
     878:	e7f9      	b.n	86e <memset+0x8a>
     87a:	4603      	mov	r3, r0
     87c:	4614      	mov	r4, r2
     87e:	e7c0      	b.n	802 <memset+0x1e>
     880:	461a      	mov	r2, r3
     882:	46a4      	mov	ip, r4
     884:	e7e0      	b.n	848 <memset+0x64>
     886:	bf00      	nop

00000888 <_reclaim_reent>:
     888:	4b19      	ldr	r3, [pc, #100]	@ (8f0 <_reclaim_reent+0x68>)
     88a:	681b      	ldr	r3, [r3, #0]
     88c:	4283      	cmp	r3, r0
     88e:	d02e      	beq.n	8ee <_reclaim_reent+0x66>
     890:	6c41      	ldr	r1, [r0, #68]	@ 0x44
     892:	b570      	push	{r4, r5, r6, lr}
     894:	4605      	mov	r5, r0
     896:	b181      	cbz	r1, 8ba <_reclaim_reent+0x32>
     898:	2600      	movs	r6, #0
     89a:	598c      	ldr	r4, [r1, r6]
     89c:	b13c      	cbz	r4, 8ae <_reclaim_reent+0x26>
     89e:	4621      	mov	r1, r4
     8a0:	6824      	ldr	r4, [r4, #0]
     8a2:	4628      	mov	r0, r5
     8a4:	f002 fcb2 	bl	320c <_free_r>
     8a8:	2c00      	cmp	r4, #0
     8aa:	d1f8      	bne.n	89e <_reclaim_reent+0x16>
     8ac:	6c69      	ldr	r1, [r5, #68]	@ 0x44
     8ae:	3604      	adds	r6, #4
     8b0:	2e80      	cmp	r6, #128	@ 0x80
     8b2:	d1f2      	bne.n	89a <_reclaim_reent+0x12>
     8b4:	4628      	mov	r0, r5
     8b6:	f002 fca9 	bl	320c <_free_r>
     8ba:	6ba9      	ldr	r1, [r5, #56]	@ 0x38
     8bc:	b111      	cbz	r1, 8c4 <_reclaim_reent+0x3c>
     8be:	4628      	mov	r0, r5
     8c0:	f002 fca4 	bl	320c <_free_r>
     8c4:	6c2c      	ldr	r4, [r5, #64]	@ 0x40
     8c6:	b134      	cbz	r4, 8d6 <_reclaim_reent+0x4e>
     8c8:	4621      	mov	r1, r4
     8ca:	6824      	ldr	r4, [r4, #0]
     8cc:	4628      	mov	r0, r5
     8ce:	f002 fc9d 	bl	320c <_free_r>
     8d2:	2c00      	cmp	r4, #0
     8d4:	d1f8      	bne.n	8c8 <_reclaim_reent+0x40>
     8d6:	6ce9      	ldr	r1, [r5, #76]	@ 0x4c
     8d8:	b111      	cbz	r1, 8e0 <_reclaim_reent+0x58>
     8da:	4628      	mov	r0, r5
     8dc:	f002 fc96 	bl	320c <_free_r>
     8e0:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
     8e2:	b11b      	cbz	r3, 8ec <_reclaim_reent+0x64>
     8e4:	4628      	mov	r0, r5
     8e6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
     8ea:	4718      	bx	r3
     8ec:	bd70      	pop	{r4, r5, r6, pc}
     8ee:	4770      	bx	lr
     8f0:	000078b8 	.word	0x000078b8

000008f4 <__libc_init_array>:
     8f4:	b570      	push	{r4, r5, r6, lr}
     8f6:	4b0f      	ldr	r3, [pc, #60]	@ (934 <__libc_init_array+0x40>)
     8f8:	4d0f      	ldr	r5, [pc, #60]	@ (938 <__libc_init_array+0x44>)
     8fa:	42ab      	cmp	r3, r5
     8fc:	eba3 0605 	sub.w	r6, r3, r5
     900:	d007      	beq.n	912 <__libc_init_array+0x1e>
     902:	10b6      	asrs	r6, r6, #2
     904:	2400      	movs	r4, #0
     906:	f855 3b04 	ldr.w	r3, [r5], #4
     90a:	3401      	adds	r4, #1
     90c:	4798      	blx	r3
     90e:	42a6      	cmp	r6, r4
     910:	d8f9      	bhi.n	906 <__libc_init_array+0x12>
     912:	f006 fd27 	bl	7364 <_init>
     916:	4d09      	ldr	r5, [pc, #36]	@ (93c <__libc_init_array+0x48>)
     918:	4b09      	ldr	r3, [pc, #36]	@ (940 <__libc_init_array+0x4c>)
     91a:	1b5e      	subs	r6, r3, r5
     91c:	42ab      	cmp	r3, r5
     91e:	ea4f 06a6 	mov.w	r6, r6, asr #2
     922:	d006      	beq.n	932 <__libc_init_array+0x3e>
     924:	2400      	movs	r4, #0
     926:	f855 3b04 	ldr.w	r3, [r5], #4
     92a:	3401      	adds	r4, #1
     92c:	4798      	blx	r3
     92e:	42a6      	cmp	r6, r4
     930:	d8f9      	bhi.n	926 <__libc_init_array+0x32>
     932:	bd70      	pop	{r4, r5, r6, pc}
     934:	00007f68 	.word	0x00007f68
     938:	00007f68 	.word	0x00007f68
     93c:	00007f68 	.word	0x00007f68
     940:	00007f70 	.word	0x00007f70

00000944 <exit>:
     944:	b508      	push	{r3, lr}
     946:	2100      	movs	r1, #0
     948:	4604      	mov	r4, r0
     94a:	f002 fd5b 	bl	3404 <__call_exitprocs>
     94e:	4b03      	ldr	r3, [pc, #12]	@ (95c <exit+0x18>)
     950:	681b      	ldr	r3, [r3, #0]
     952:	b103      	cbz	r3, 956 <exit+0x12>
     954:	4798      	blx	r3
     956:	4620      	mov	r0, r4
     958:	f006 fd02 	bl	7360 <_exit>
     95c:	00008274 	.word	0x00008274

00000960 <atexit>:
     960:	2300      	movs	r3, #0
     962:	4601      	mov	r1, r0
     964:	461a      	mov	r2, r3
     966:	4618      	mov	r0, r3
     968:	f002 be56 	b.w	3618 <__register_exitproc>

0000096c <_printf_r>:
     96c:	b40e      	push	{r1, r2, r3}
     96e:	b500      	push	{lr}
     970:	b082      	sub	sp, #8
     972:	ab03      	add	r3, sp, #12
     974:	6881      	ldr	r1, [r0, #8]
     976:	f853 2b04 	ldr.w	r2, [r3], #4
     97a:	9301      	str	r3, [sp, #4]
     97c:	f000 f830 	bl	9e0 <_vfprintf_r>
     980:	b002      	add	sp, #8
     982:	f85d eb04 	ldr.w	lr, [sp], #4
     986:	b003      	add	sp, #12
     988:	4770      	bx	lr
     98a:	bf00      	nop

0000098c <printf>:
     98c:	b40f      	push	{r0, r1, r2, r3}
     98e:	b500      	push	{lr}
     990:	4907      	ldr	r1, [pc, #28]	@ (9b0 <printf+0x24>)
     992:	b083      	sub	sp, #12
     994:	ab04      	add	r3, sp, #16
     996:	6808      	ldr	r0, [r1, #0]
     998:	f853 2b04 	ldr.w	r2, [r3], #4
     99c:	6881      	ldr	r1, [r0, #8]
     99e:	9301      	str	r3, [sp, #4]
     9a0:	f000 f81e 	bl	9e0 <_vfprintf_r>
     9a4:	b003      	add	sp, #12
     9a6:	f85d eb04 	ldr.w	lr, [sp], #4
     9aa:	b004      	add	sp, #16
     9ac:	4770      	bx	lr
     9ae:	bf00      	nop
     9b0:	000078b8 	.word	0x000078b8

000009b4 <__libc_fini_array>:
     9b4:	b538      	push	{r3, r4, r5, lr}
     9b6:	4d07      	ldr	r5, [pc, #28]	@ (9d4 <__libc_fini_array+0x20>)
     9b8:	4c07      	ldr	r4, [pc, #28]	@ (9d8 <__libc_fini_array+0x24>)
     9ba:	1b2c      	subs	r4, r5, r4
     9bc:	10a4      	asrs	r4, r4, #2
     9be:	d005      	beq.n	9cc <__libc_fini_array+0x18>
     9c0:	3c01      	subs	r4, #1
     9c2:	f855 3d04 	ldr.w	r3, [r5, #-4]!
     9c6:	4798      	blx	r3
     9c8:	2c00      	cmp	r4, #0
     9ca:	d1f9      	bne.n	9c0 <__libc_fini_array+0xc>
     9cc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     9d0:	f006 bcce 	b.w	7370 <_fini>
     9d4:	00007f78 	.word	0x00007f78
     9d8:	00007f70 	.word	0x00007f70
     9dc:	00000000 	.word	0x00000000

000009e0 <_vfprintf_r>:
     9e0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     9e4:	b0bf      	sub	sp, #252	@ 0xfc
     9e6:	461c      	mov	r4, r3
     9e8:	9104      	str	r1, [sp, #16]
     9ea:	4691      	mov	r9, r2
     9ec:	9309      	str	r3, [sp, #36]	@ 0x24
     9ee:	4605      	mov	r5, r0
     9f0:	9008      	str	r0, [sp, #32]
     9f2:	f003 fda7 	bl	4544 <_localeconv_r>
     9f6:	6803      	ldr	r3, [r0, #0]
     9f8:	9310      	str	r3, [sp, #64]	@ 0x40
     9fa:	4618      	mov	r0, r3
     9fc:	f002 ff80 	bl	3900 <strlen>
     a00:	900f      	str	r0, [sp, #60]	@ 0x3c
     a02:	b11d      	cbz	r5, a0c <_vfprintf_r+0x2c>
     a04:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
     a06:	2b00      	cmp	r3, #0
     a08:	f001 8020 	beq.w	1a4c <_vfprintf_r+0x106c>
     a0c:	9904      	ldr	r1, [sp, #16]
     a0e:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
     a12:	6e4b      	ldr	r3, [r1, #100]	@ 0x64
     a14:	0490      	lsls	r0, r2, #18
     a16:	d405      	bmi.n	a24 <_vfprintf_r+0x44>
     a18:	f442 5200 	orr.w	r2, r2, #8192	@ 0x2000
     a1c:	f423 5300 	bic.w	r3, r3, #8192	@ 0x2000
     a20:	818a      	strh	r2, [r1, #12]
     a22:	664b      	str	r3, [r1, #100]	@ 0x64
     a24:	049f      	lsls	r7, r3, #18
     a26:	f101 813e 	bmi.w	1ca6 <_vfprintf_r+0x12c6>
     a2a:	9a04      	ldr	r2, [sp, #16]
     a2c:	f9b2 300c 	ldrsh.w	r3, [r2, #12]
     a30:	071e      	lsls	r6, r3, #28
     a32:	f140 80dd 	bpl.w	bf0 <_vfprintf_r+0x210>
     a36:	6912      	ldr	r2, [r2, #16]
     a38:	2a00      	cmp	r2, #0
     a3a:	f000 80d9 	beq.w	bf0 <_vfprintf_r+0x210>
     a3e:	f003 031a 	and.w	r3, r3, #26
     a42:	2b0a      	cmp	r3, #10
     a44:	f000 80e3 	beq.w	c0e <_vfprintf_r+0x22e>
     a48:	ed9f 7b81 	vldr	d7, [pc, #516]	@ c50 <_vfprintf_r+0x270>
     a4c:	2300      	movs	r3, #0
     a4e:	e9cd 3322 	strd	r3, r3, [sp, #136]	@ 0x88
     a52:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
     a56:	ed8d 7b0c 	vstr	d7, [sp, #48]	@ 0x30
     a5a:	aa2e      	add	r2, sp, #184	@ 0xb8
     a5c:	930e      	str	r3, [sp, #56]	@ 0x38
     a5e:	9221      	str	r2, [sp, #132]	@ 0x84
     a60:	4692      	mov	sl, r2
     a62:	9306      	str	r3, [sp, #24]
     a64:	46cb      	mov	fp, r9
     a66:	f89b 3000 	ldrb.w	r3, [fp]
     a6a:	2b00      	cmp	r3, #0
     a6c:	f000 8164 	beq.w	d38 <_vfprintf_r+0x358>
     a70:	465c      	mov	r4, fp
     a72:	e004      	b.n	a7e <_vfprintf_r+0x9e>
     a74:	f814 3f01 	ldrb.w	r3, [r4, #1]!
     a78:	2b00      	cmp	r3, #0
     a7a:	f000 8141 	beq.w	d00 <_vfprintf_r+0x320>
     a7e:	2b25      	cmp	r3, #37	@ 0x25
     a80:	d1f8      	bne.n	a74 <_vfprintf_r+0x94>
     a82:	ebb4 050b 	subs.w	r5, r4, fp
     a86:	f040 813e 	bne.w	d06 <_vfprintf_r+0x326>
     a8a:	7823      	ldrb	r3, [r4, #0]
     a8c:	2b00      	cmp	r3, #0
     a8e:	f000 8153 	beq.w	d38 <_vfprintf_r+0x358>
     a92:	f04f 0300 	mov.w	r3, #0
     a96:	f88d 3067 	strb.w	r3, [sp, #103]	@ 0x67
     a9a:	2700      	movs	r7, #0
     a9c:	7863      	ldrb	r3, [r4, #1]
     a9e:	9705      	str	r7, [sp, #20]
     aa0:	f104 0b01 	add.w	fp, r4, #1
     aa4:	f04f 39ff 	mov.w	r9, #4294967295	@ 0xffffffff
     aa8:	f10b 0b01 	add.w	fp, fp, #1
     aac:	4698      	mov	r8, r3
     aae:	f1a8 0320 	sub.w	r3, r8, #32
     ab2:	2b58      	cmp	r3, #88	@ 0x58
     ab4:	f200 814d 	bhi.w	d52 <_vfprintf_r+0x372>
     ab8:	e8df f013 	tbh	[pc, r3, lsl #1]
     abc:	014b0283 	.word	0x014b0283
     ac0:	027e014b 	.word	0x027e014b
     ac4:	014b014b 	.word	0x014b014b
     ac8:	014b014b 	.word	0x014b014b
     acc:	014b014b 	.word	0x014b014b
     ad0:	02780246 	.word	0x02780246
     ad4:	0251014b 	.word	0x0251014b
     ad8:	014b0256 	.word	0x014b0256
     adc:	00590273 	.word	0x00590273
     ae0:	00590059 	.word	0x00590059
     ae4:	00590059 	.word	0x00590059
     ae8:	00590059 	.word	0x00590059
     aec:	00590059 	.word	0x00590059
     af0:	014b014b 	.word	0x014b014b
     af4:	014b014b 	.word	0x014b014b
     af8:	014b014b 	.word	0x014b014b
     afc:	014b014b 	.word	0x014b014b
     b00:	014b014b 	.word	0x014b014b
     b04:	01c60068 	.word	0x01c60068
     b08:	01c6014b 	.word	0x01c6014b
     b0c:	014b014b 	.word	0x014b014b
     b10:	014b014b 	.word	0x014b014b
     b14:	014b02ae 	.word	0x014b02ae
     b18:	00b8014b 	.word	0x00b8014b
     b1c:	014b014b 	.word	0x014b014b
     b20:	014b014b 	.word	0x014b014b
     b24:	00ce014b 	.word	0x00ce014b
     b28:	014b014b 	.word	0x014b014b
     b2c:	014b0652 	.word	0x014b0652
     b30:	014b014b 	.word	0x014b014b
     b34:	014b014b 	.word	0x014b014b
     b38:	014b014b 	.word	0x014b014b
     b3c:	014b014b 	.word	0x014b014b
     b40:	02a0014b 	.word	0x02a0014b
     b44:	01c6006a 	.word	0x01c6006a
     b48:	01c601c6 	.word	0x01c601c6
     b4c:	006a029b 	.word	0x006a029b
     b50:	014b014b 	.word	0x014b014b
     b54:	014b028e 	.word	0x014b028e
     b58:	00ba02ea 	.word	0x00ba02ea
     b5c:	02d402d9 	.word	0x02d402d9
     b60:	02b3014b 	.word	0x02b3014b
     b64:	00d0014b 	.word	0x00d0014b
     b68:	014b014b 	.word	0x014b014b
     b6c:	0672      	.short	0x0672
     b6e:	f1a8 0330 	sub.w	r3, r8, #48	@ 0x30
     b72:	2200      	movs	r2, #0
     b74:	f81b 8b01 	ldrb.w	r8, [fp], #1
     b78:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     b7c:	eb03 0242 	add.w	r2, r3, r2, lsl #1
     b80:	f1a8 0330 	sub.w	r3, r8, #48	@ 0x30
     b84:	2b09      	cmp	r3, #9
     b86:	d9f5      	bls.n	b74 <_vfprintf_r+0x194>
     b88:	9205      	str	r2, [sp, #20]
     b8a:	e790      	b.n	aae <_vfprintf_r+0xce>
     b8c:	f047 0710 	orr.w	r7, r7, #16
     b90:	06bd      	lsls	r5, r7, #26
     b92:	f140 81b2 	bpl.w	efa <_vfprintf_r+0x51a>
     b96:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     b98:	3307      	adds	r3, #7
     b9a:	f023 0307 	bic.w	r3, r3, #7
     b9e:	461a      	mov	r2, r3
     ba0:	6859      	ldr	r1, [r3, #4]
     ba2:	f852 3b08 	ldr.w	r3, [r2], #8
     ba6:	9209      	str	r2, [sp, #36]	@ 0x24
     ba8:	460a      	mov	r2, r1
     baa:	2900      	cmp	r1, #0
     bac:	f2c0 81b7 	blt.w	f1e <_vfprintf_r+0x53e>
     bb0:	f1b9 0f00 	cmp.w	r9, #0
     bb4:	f89d 4067 	ldrb.w	r4, [sp, #103]	@ 0x67
     bb8:	f2c0 81b8 	blt.w	f2c <_vfprintf_r+0x54c>
     bbc:	f027 0180 	bic.w	r1, r7, #128	@ 0x80
     bc0:	9102      	str	r1, [sp, #8]
     bc2:	ea53 0102 	orrs.w	r1, r3, r2
     bc6:	f040 81b0 	bne.w	f2a <_vfprintf_r+0x54a>
     bca:	2101      	movs	r1, #1
     bcc:	f1b9 0f00 	cmp.w	r9, #0
     bd0:	f040 8353 	bne.w	127a <_vfprintf_r+0x89a>
     bd4:	2900      	cmp	r1, #0
     bd6:	f040 84f1 	bne.w	15bc <_vfprintf_r+0xbdc>
     bda:	f017 0301 	ands.w	r3, r7, #1
     bde:	9307      	str	r3, [sp, #28]
     be0:	f000 8531 	beq.w	1646 <_vfprintf_r+0xc66>
     be4:	2330      	movs	r3, #48	@ 0x30
     be6:	f88d 30b7 	strb.w	r3, [sp, #183]	@ 0xb7
     bea:	f10d 05b7 	add.w	r5, sp, #183	@ 0xb7
     bee:	e073      	b.n	cd8 <_vfprintf_r+0x2f8>
     bf0:	9d04      	ldr	r5, [sp, #16]
     bf2:	9808      	ldr	r0, [sp, #32]
     bf4:	4629      	mov	r1, r5
     bf6:	f002 fa4b 	bl	3090 <__swsetup_r>
     bfa:	2800      	cmp	r0, #0
     bfc:	f041 8053 	bne.w	1ca6 <_vfprintf_r+0x12c6>
     c00:	f9b5 300c 	ldrsh.w	r3, [r5, #12]
     c04:	f003 031a 	and.w	r3, r3, #26
     c08:	2b0a      	cmp	r3, #10
     c0a:	f47f af1d 	bne.w	a48 <_vfprintf_r+0x68>
     c0e:	9b04      	ldr	r3, [sp, #16]
     c10:	f9b3 300e 	ldrsh.w	r3, [r3, #14]
     c14:	2b00      	cmp	r3, #0
     c16:	f6ff af17 	blt.w	a48 <_vfprintf_r+0x68>
     c1a:	9904      	ldr	r1, [sp, #16]
     c1c:	9808      	ldr	r0, [sp, #32]
     c1e:	4623      	mov	r3, r4
     c20:	464a      	mov	r2, r9
     c22:	b03f      	add	sp, #252	@ 0xfc
     c24:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     c28:	f001 b8fa 	b.w	1e20 <__sbprintf>
     c2c:	f047 0710 	orr.w	r7, r7, #16
     c30:	f017 0220 	ands.w	r2, r7, #32
     c34:	f000 8152 	beq.w	edc <_vfprintf_r+0x4fc>
     c38:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     c3a:	3307      	adds	r3, #7
     c3c:	f023 0307 	bic.w	r3, r3, #7
     c40:	4619      	mov	r1, r3
     c42:	685a      	ldr	r2, [r3, #4]
     c44:	f851 3b08 	ldr.w	r3, [r1], #8
     c48:	9109      	str	r1, [sp, #36]	@ 0x24
     c4a:	2100      	movs	r1, #0
     c4c:	e014      	b.n	c78 <_vfprintf_r+0x298>
     c4e:	bf00      	nop
	...
     c58:	f047 0710 	orr.w	r7, r7, #16
     c5c:	f017 0220 	ands.w	r2, r7, #32
     c60:	f000 8132 	beq.w	ec8 <_vfprintf_r+0x4e8>
     c64:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     c66:	3307      	adds	r3, #7
     c68:	f023 0307 	bic.w	r3, r3, #7
     c6c:	4619      	mov	r1, r3
     c6e:	685a      	ldr	r2, [r3, #4]
     c70:	f851 3b08 	ldr.w	r3, [r1], #8
     c74:	9109      	str	r1, [sp, #36]	@ 0x24
     c76:	2101      	movs	r1, #1
     c78:	2400      	movs	r4, #0
     c7a:	f1b9 0f00 	cmp.w	r9, #0
     c7e:	f88d 4067 	strb.w	r4, [sp, #103]	@ 0x67
     c82:	db06      	blt.n	c92 <_vfprintf_r+0x2b2>
     c84:	f027 0080 	bic.w	r0, r7, #128	@ 0x80
     c88:	9002      	str	r0, [sp, #8]
     c8a:	ea53 0002 	orrs.w	r0, r3, r2
     c8e:	d09d      	beq.n	bcc <_vfprintf_r+0x1ec>
     c90:	9f02      	ldr	r7, [sp, #8]
     c92:	2901      	cmp	r1, #1
     c94:	f000 814a 	beq.w	f2c <_vfprintf_r+0x54c>
     c98:	2902      	cmp	r1, #2
     c9a:	f000 82f8 	beq.w	128e <_vfprintf_r+0x8ae>
     c9e:	ad2e      	add	r5, sp, #184	@ 0xb8
     ca0:	f003 0107 	and.w	r1, r3, #7
     ca4:	08db      	lsrs	r3, r3, #3
     ca6:	ea43 7342 	orr.w	r3, r3, r2, lsl #29
     caa:	08d2      	lsrs	r2, r2, #3
     cac:	3130      	adds	r1, #48	@ 0x30
     cae:	ea53 0602 	orrs.w	r6, r3, r2
     cb2:	4628      	mov	r0, r5
     cb4:	f805 1d01 	strb.w	r1, [r5, #-1]!
     cb8:	d1f2      	bne.n	ca0 <_vfprintf_r+0x2c0>
     cba:	07fb      	lsls	r3, r7, #31
     cbc:	f140 82f5 	bpl.w	12aa <_vfprintf_r+0x8ca>
     cc0:	2930      	cmp	r1, #48	@ 0x30
     cc2:	f000 82f2 	beq.w	12aa <_vfprintf_r+0x8ca>
     cc6:	2330      	movs	r3, #48	@ 0x30
     cc8:	3802      	subs	r0, #2
     cca:	f805 3c01 	strb.w	r3, [r5, #-1]
     cce:	ab2e      	add	r3, sp, #184	@ 0xb8
     cd0:	1a1b      	subs	r3, r3, r0
     cd2:	9702      	str	r7, [sp, #8]
     cd4:	9307      	str	r3, [sp, #28]
     cd6:	4605      	mov	r5, r0
     cd8:	9b07      	ldr	r3, [sp, #28]
     cda:	454b      	cmp	r3, r9
     cdc:	bfb8      	it	lt
     cde:	464b      	movlt	r3, r9
     ce0:	9303      	str	r3, [sp, #12]
     ce2:	2300      	movs	r3, #0
     ce4:	930b      	str	r3, [sp, #44]	@ 0x2c
     ce6:	b114      	cbz	r4, cee <_vfprintf_r+0x30e>
     ce8:	9b03      	ldr	r3, [sp, #12]
     cea:	3301      	adds	r3, #1
     cec:	9303      	str	r3, [sp, #12]
     cee:	9b02      	ldr	r3, [sp, #8]
     cf0:	f013 0302 	ands.w	r3, r3, #2
     cf4:	d03f      	beq.n	d76 <_vfprintf_r+0x396>
     cf6:	9b03      	ldr	r3, [sp, #12]
     cf8:	3302      	adds	r3, #2
     cfa:	9303      	str	r3, [sp, #12]
     cfc:	2302      	movs	r3, #2
     cfe:	e03a      	b.n	d76 <_vfprintf_r+0x396>
     d00:	ebb4 050b 	subs.w	r5, r4, fp
     d04:	d018      	beq.n	d38 <_vfprintf_r+0x358>
     d06:	9b23      	ldr	r3, [sp, #140]	@ 0x8c
     d08:	442b      	add	r3, r5
     d0a:	9323      	str	r3, [sp, #140]	@ 0x8c
     d0c:	9b22      	ldr	r3, [sp, #136]	@ 0x88
     d0e:	3301      	adds	r3, #1
     d10:	2b07      	cmp	r3, #7
     d12:	e9ca b500 	strd	fp, r5, [sl]
     d16:	9322      	str	r3, [sp, #136]	@ 0x88
     d18:	dc05      	bgt.n	d26 <_vfprintf_r+0x346>
     d1a:	f10a 0a08 	add.w	sl, sl, #8
     d1e:	9b06      	ldr	r3, [sp, #24]
     d20:	442b      	add	r3, r5
     d22:	9306      	str	r3, [sp, #24]
     d24:	e6b1      	b.n	a8a <_vfprintf_r+0xaa>
     d26:	9904      	ldr	r1, [sp, #16]
     d28:	9808      	ldr	r0, [sp, #32]
     d2a:	aa21      	add	r2, sp, #132	@ 0x84
     d2c:	f002 fe54 	bl	39d8 <__sprint_r>
     d30:	b930      	cbnz	r0, d40 <_vfprintf_r+0x360>
     d32:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
     d36:	e7f2      	b.n	d1e <_vfprintf_r+0x33e>
     d38:	9b23      	ldr	r3, [sp, #140]	@ 0x8c
     d3a:	2b00      	cmp	r3, #0
     d3c:	f040 8704 	bne.w	1b48 <_vfprintf_r+0x1168>
     d40:	9b04      	ldr	r3, [sp, #16]
     d42:	899b      	ldrh	r3, [r3, #12]
     d44:	065b      	lsls	r3, r3, #25
     d46:	f100 87ae 	bmi.w	1ca6 <_vfprintf_r+0x12c6>
     d4a:	9806      	ldr	r0, [sp, #24]
     d4c:	b03f      	add	sp, #252	@ 0xfc
     d4e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     d52:	f1b8 0f00 	cmp.w	r8, #0
     d56:	d0ef      	beq.n	d38 <_vfprintf_r+0x358>
     d58:	2300      	movs	r3, #0
     d5a:	f88d 3067 	strb.w	r3, [sp, #103]	@ 0x67
     d5e:	2301      	movs	r3, #1
     d60:	f88d 8090 	strb.w	r8, [sp, #144]	@ 0x90
     d64:	9303      	str	r3, [sp, #12]
     d66:	9307      	str	r3, [sp, #28]
     d68:	ad24      	add	r5, sp, #144	@ 0x90
     d6a:	f04f 0900 	mov.w	r9, #0
     d6e:	9702      	str	r7, [sp, #8]
     d70:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
     d74:	464b      	mov	r3, r9
     d76:	9a02      	ldr	r2, [sp, #8]
     d78:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
     d7a:	f012 0284 	ands.w	r2, r2, #132	@ 0x84
     d7e:	920a      	str	r2, [sp, #40]	@ 0x28
     d80:	d105      	bne.n	d8e <_vfprintf_r+0x3ae>
     d82:	9a05      	ldr	r2, [sp, #20]
     d84:	9903      	ldr	r1, [sp, #12]
     d86:	1a56      	subs	r6, r2, r1
     d88:	2e00      	cmp	r6, #0
     d8a:	f300 82fe 	bgt.w	138a <_vfprintf_r+0x9aa>
     d8e:	f89d 2067 	ldrb.w	r2, [sp, #103]	@ 0x67
     d92:	b18a      	cbz	r2, db8 <_vfprintf_r+0x3d8>
     d94:	9a22      	ldr	r2, [sp, #136]	@ 0x88
     d96:	f10d 0167 	add.w	r1, sp, #103	@ 0x67
     d9a:	3201      	adds	r2, #1
     d9c:	3401      	adds	r4, #1
     d9e:	f8ca 1000 	str.w	r1, [sl]
     da2:	2a07      	cmp	r2, #7
     da4:	f04f 0101 	mov.w	r1, #1
     da8:	9423      	str	r4, [sp, #140]	@ 0x8c
     daa:	9222      	str	r2, [sp, #136]	@ 0x88
     dac:	f8ca 1004 	str.w	r1, [sl, #4]
     db0:	f300 8326 	bgt.w	1400 <_vfprintf_r+0xa20>
     db4:	f10a 0a08 	add.w	sl, sl, #8
     db8:	b183      	cbz	r3, ddc <_vfprintf_r+0x3fc>
     dba:	9a22      	ldr	r2, [sp, #136]	@ 0x88
     dbc:	a91a      	add	r1, sp, #104	@ 0x68
     dbe:	3201      	adds	r2, #1
     dc0:	3402      	adds	r4, #2
     dc2:	f8ca 1000 	str.w	r1, [sl]
     dc6:	2a07      	cmp	r2, #7
     dc8:	f04f 0102 	mov.w	r1, #2
     dcc:	9423      	str	r4, [sp, #140]	@ 0x8c
     dce:	9222      	str	r2, [sp, #136]	@ 0x88
     dd0:	f8ca 1004 	str.w	r1, [sl, #4]
     dd4:	f300 8322 	bgt.w	141c <_vfprintf_r+0xa3c>
     dd8:	f10a 0a08 	add.w	sl, sl, #8
     ddc:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
     dde:	2b80      	cmp	r3, #128	@ 0x80
     de0:	f000 81ca 	beq.w	1178 <_vfprintf_r+0x798>
     de4:	9b07      	ldr	r3, [sp, #28]
     de6:	eba9 0603 	sub.w	r6, r9, r3
     dea:	2e00      	cmp	r6, #0
     dec:	f300 8206 	bgt.w	11fc <_vfprintf_r+0x81c>
     df0:	9b02      	ldr	r3, [sp, #8]
     df2:	05de      	lsls	r6, r3, #23
     df4:	f100 8159 	bmi.w	10aa <_vfprintf_r+0x6ca>
     df8:	9b07      	ldr	r3, [sp, #28]
     dfa:	f8ca 3004 	str.w	r3, [sl, #4]
     dfe:	441c      	add	r4, r3
     e00:	9b22      	ldr	r3, [sp, #136]	@ 0x88
     e02:	f8ca 5000 	str.w	r5, [sl]
     e06:	3301      	adds	r3, #1
     e08:	2b07      	cmp	r3, #7
     e0a:	9423      	str	r4, [sp, #140]	@ 0x8c
     e0c:	9322      	str	r3, [sp, #136]	@ 0x88
     e0e:	f300 8265 	bgt.w	12dc <_vfprintf_r+0x8fc>
     e12:	f10a 0a08 	add.w	sl, sl, #8
     e16:	9b02      	ldr	r3, [sp, #8]
     e18:	075a      	lsls	r2, r3, #29
     e1a:	d505      	bpl.n	e28 <_vfprintf_r+0x448>
     e1c:	9b05      	ldr	r3, [sp, #20]
     e1e:	9a03      	ldr	r2, [sp, #12]
     e20:	1a9d      	subs	r5, r3, r2
     e22:	2d00      	cmp	r5, #0
     e24:	f300 8306 	bgt.w	1434 <_vfprintf_r+0xa54>
     e28:	e9dd 2305 	ldrd	r2, r3, [sp, #20]
     e2c:	9903      	ldr	r1, [sp, #12]
     e2e:	428a      	cmp	r2, r1
     e30:	bfac      	ite	ge
     e32:	189b      	addge	r3, r3, r2
     e34:	185b      	addlt	r3, r3, r1
     e36:	9306      	str	r3, [sp, #24]
     e38:	2c00      	cmp	r4, #0
     e3a:	f040 823b 	bne.w	12b4 <_vfprintf_r+0x8d4>
     e3e:	2300      	movs	r3, #0
     e40:	9322      	str	r3, [sp, #136]	@ 0x88
     e42:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
     e46:	e60e      	b.n	a66 <_vfprintf_r+0x86>
     e48:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     e4a:	3307      	adds	r3, #7
     e4c:	f023 0307 	bic.w	r3, r3, #7
     e50:	ecb3 7b02 	vldmia	r3!, {d7}
     e54:	ec55 4b17 	vmov	r4, r5, d7
     e58:	9309      	str	r3, [sp, #36]	@ 0x24
     e5a:	f025 4300 	bic.w	r3, r5, #2147483648	@ 0x80000000
     e5e:	9315      	str	r3, [sp, #84]	@ 0x54
     e60:	ed8d 7a14 	vstr	s14, [sp, #80]	@ 0x50
     e64:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
     e68:	4bbd      	ldr	r3, [pc, #756]	@ (1160 <_vfprintf_r+0x780>)
     e6a:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
     e6e:	ed8d 7b0c 	vstr	d7, [sp, #48]	@ 0x30
     e72:	f006 fa37 	bl	72e4 <__aeabi_dcmpun>
     e76:	2800      	cmp	r0, #0
     e78:	f040 83f0 	bne.w	165c <_vfprintf_r+0xc7c>
     e7c:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
     e80:	4bb7      	ldr	r3, [pc, #732]	@ (1160 <_vfprintf_r+0x780>)
     e82:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
     e86:	f006 fa0f 	bl	72a8 <__aeabi_dcmple>
     e8a:	2800      	cmp	r0, #0
     e8c:	f040 83e6 	bne.w	165c <_vfprintf_r+0xc7c>
     e90:	2200      	movs	r2, #0
     e92:	2300      	movs	r3, #0
     e94:	4620      	mov	r0, r4
     e96:	4629      	mov	r1, r5
     e98:	f006 f9fc 	bl	7294 <__aeabi_dcmplt>
     e9c:	2800      	cmp	r0, #0
     e9e:	f040 863d 	bne.w	1b1c <_vfprintf_r+0x113c>
     ea2:	f89d 4067 	ldrb.w	r4, [sp, #103]	@ 0x67
     ea6:	4daf      	ldr	r5, [pc, #700]	@ (1164 <_vfprintf_r+0x784>)
     ea8:	f027 0380 	bic.w	r3, r7, #128	@ 0x80
     eac:	9302      	str	r3, [sp, #8]
     eae:	4bae      	ldr	r3, [pc, #696]	@ (1168 <_vfprintf_r+0x788>)
     eb0:	f1b8 0f47 	cmp.w	r8, #71	@ 0x47
     eb4:	bfd8      	it	le
     eb6:	461d      	movle	r5, r3
     eb8:	f04f 0900 	mov.w	r9, #0
     ebc:	2303      	movs	r3, #3
     ebe:	9303      	str	r3, [sp, #12]
     ec0:	9307      	str	r3, [sp, #28]
     ec2:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
     ec6:	e70e      	b.n	ce6 <_vfprintf_r+0x306>
     ec8:	9909      	ldr	r1, [sp, #36]	@ 0x24
     eca:	f851 3b04 	ldr.w	r3, [r1], #4
     ece:	9109      	str	r1, [sp, #36]	@ 0x24
     ed0:	f017 0110 	ands.w	r1, r7, #16
     ed4:	f000 83ba 	beq.w	164c <_vfprintf_r+0xc6c>
     ed8:	2101      	movs	r1, #1
     eda:	e6cd      	b.n	c78 <_vfprintf_r+0x298>
     edc:	9909      	ldr	r1, [sp, #36]	@ 0x24
     ede:	f851 3b04 	ldr.w	r3, [r1], #4
     ee2:	9109      	str	r1, [sp, #36]	@ 0x24
     ee4:	f017 0110 	ands.w	r1, r7, #16
     ee8:	f47f aeaf 	bne.w	c4a <_vfprintf_r+0x26a>
     eec:	f017 0240 	ands.w	r2, r7, #64	@ 0x40
     ef0:	f43f aeab 	beq.w	c4a <_vfprintf_r+0x26a>
     ef4:	460a      	mov	r2, r1
     ef6:	b29b      	uxth	r3, r3
     ef8:	e6a7      	b.n	c4a <_vfprintf_r+0x26a>
     efa:	9a09      	ldr	r2, [sp, #36]	@ 0x24
     efc:	06fc      	lsls	r4, r7, #27
     efe:	f852 3b04 	ldr.w	r3, [r2], #4
     f02:	9209      	str	r2, [sp, #36]	@ 0x24
     f04:	d406      	bmi.n	f14 <_vfprintf_r+0x534>
     f06:	0678      	lsls	r0, r7, #25
     f08:	d504      	bpl.n	f14 <_vfprintf_r+0x534>
     f0a:	f343 32c0 	sbfx	r2, r3, #15, #1
     f0e:	4611      	mov	r1, r2
     f10:	b21b      	sxth	r3, r3
     f12:	e64a      	b.n	baa <_vfprintf_r+0x1ca>
     f14:	17da      	asrs	r2, r3, #31
     f16:	4611      	mov	r1, r2
     f18:	2900      	cmp	r1, #0
     f1a:	f6bf ae49 	bge.w	bb0 <_vfprintf_r+0x1d0>
     f1e:	425b      	negs	r3, r3
     f20:	eb62 0242 	sbc.w	r2, r2, r2, lsl #1
     f24:	242d      	movs	r4, #45	@ 0x2d
     f26:	2101      	movs	r1, #1
     f28:	e6a7      	b.n	c7a <_vfprintf_r+0x29a>
     f2a:	9f02      	ldr	r7, [sp, #8]
     f2c:	2b0a      	cmp	r3, #10
     f2e:	f172 0100 	sbcs.w	r1, r2, #0
     f32:	f080 8501 	bcs.w	1938 <_vfprintf_r+0xf58>
     f36:	3330      	adds	r3, #48	@ 0x30
     f38:	f88d 30b7 	strb.w	r3, [sp, #183]	@ 0xb7
     f3c:	2301      	movs	r3, #1
     f3e:	9702      	str	r7, [sp, #8]
     f40:	9307      	str	r3, [sp, #28]
     f42:	f10d 05b7 	add.w	r5, sp, #183	@ 0xb7
     f46:	e6c7      	b.n	cd8 <_vfprintf_r+0x2f8>
     f48:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     f4a:	f853 2b04 	ldr.w	r2, [r3], #4
     f4e:	9205      	str	r2, [sp, #20]
     f50:	2a00      	cmp	r2, #0
     f52:	f280 8373 	bge.w	163c <_vfprintf_r+0xc5c>
     f56:	9a05      	ldr	r2, [sp, #20]
     f58:	9309      	str	r3, [sp, #36]	@ 0x24
     f5a:	4252      	negs	r2, r2
     f5c:	9205      	str	r2, [sp, #20]
     f5e:	f89b 3000 	ldrb.w	r3, [fp]
     f62:	f047 0704 	orr.w	r7, r7, #4
     f66:	e59f      	b.n	aa8 <_vfprintf_r+0xc8>
     f68:	465a      	mov	r2, fp
     f6a:	f812 8b01 	ldrb.w	r8, [r2], #1
     f6e:	f1b8 0f2a 	cmp.w	r8, #42	@ 0x2a
     f72:	f000 8722 	beq.w	1dba <_vfprintf_r+0x13da>
     f76:	f1a8 0330 	sub.w	r3, r8, #48	@ 0x30
     f7a:	2b09      	cmp	r3, #9
     f7c:	bf98      	it	ls
     f7e:	f04f 0900 	movls.w	r9, #0
     f82:	f200 86a1 	bhi.w	1cc8 <_vfprintf_r+0x12e8>
     f86:	f812 8b01 	ldrb.w	r8, [r2], #1
     f8a:	eb09 0989 	add.w	r9, r9, r9, lsl #2
     f8e:	eb03 0949 	add.w	r9, r3, r9, lsl #1
     f92:	f1a8 0330 	sub.w	r3, r8, #48	@ 0x30
     f96:	2b09      	cmp	r3, #9
     f98:	d9f5      	bls.n	f86 <_vfprintf_r+0x5a6>
     f9a:	ea49 79e9 	orr.w	r9, r9, r9, asr #31
     f9e:	4693      	mov	fp, r2
     fa0:	e585      	b.n	aae <_vfprintf_r+0xce>
     fa2:	f89b 3000 	ldrb.w	r3, [fp]
     fa6:	f047 0780 	orr.w	r7, r7, #128	@ 0x80
     faa:	e57d      	b.n	aa8 <_vfprintf_r+0xc8>
     fac:	232b      	movs	r3, #43	@ 0x2b
     fae:	f88d 3067 	strb.w	r3, [sp, #103]	@ 0x67
     fb2:	f89b 3000 	ldrb.w	r3, [fp]
     fb6:	e577      	b.n	aa8 <_vfprintf_r+0xc8>
     fb8:	f89b 3000 	ldrb.w	r3, [fp]
     fbc:	f047 0701 	orr.w	r7, r7, #1
     fc0:	e572      	b.n	aa8 <_vfprintf_r+0xc8>
     fc2:	f89d 2067 	ldrb.w	r2, [sp, #103]	@ 0x67
     fc6:	f89b 3000 	ldrb.w	r3, [fp]
     fca:	2a00      	cmp	r2, #0
     fcc:	f47f ad6c 	bne.w	aa8 <_vfprintf_r+0xc8>
     fd0:	2220      	movs	r2, #32
     fd2:	f88d 2067 	strb.w	r2, [sp, #103]	@ 0x67
     fd6:	e567      	b.n	aa8 <_vfprintf_r+0xc8>
     fd8:	f89b 3000 	ldrb.w	r3, [fp]
     fdc:	2b6c      	cmp	r3, #108	@ 0x6c
     fde:	bf03      	ittte	eq
     fe0:	f89b 3001 	ldrbeq.w	r3, [fp, #1]
     fe4:	f047 0720 	orreq.w	r7, r7, #32
     fe8:	f10b 0b01 	addeq.w	fp, fp, #1
     fec:	f047 0710 	orrne.w	r7, r7, #16
     ff0:	e55a      	b.n	aa8 <_vfprintf_r+0xc8>
     ff2:	f89b 3000 	ldrb.w	r3, [fp]
     ff6:	f047 0740 	orr.w	r7, r7, #64	@ 0x40
     ffa:	e555      	b.n	aa8 <_vfprintf_r+0xc8>
     ffc:	9b09      	ldr	r3, [sp, #36]	@ 0x24
     ffe:	2200      	movs	r2, #0
    1000:	f88d 2067 	strb.w	r2, [sp, #103]	@ 0x67
    1004:	f853 2b04 	ldr.w	r2, [r3], #4
    1008:	9309      	str	r3, [sp, #36]	@ 0x24
    100a:	2301      	movs	r3, #1
    100c:	f88d 2090 	strb.w	r2, [sp, #144]	@ 0x90
    1010:	9303      	str	r3, [sp, #12]
    1012:	9307      	str	r3, [sp, #28]
    1014:	ad24      	add	r5, sp, #144	@ 0x90
    1016:	e6a8      	b.n	d6a <_vfprintf_r+0x38a>
    1018:	f89b 3000 	ldrb.w	r3, [fp]
    101c:	f047 0708 	orr.w	r7, r7, #8
    1020:	e542      	b.n	aa8 <_vfprintf_r+0xc8>
    1022:	9c09      	ldr	r4, [sp, #36]	@ 0x24
    1024:	f854 5b04 	ldr.w	r5, [r4], #4
    1028:	2600      	movs	r6, #0
    102a:	f88d 6067 	strb.w	r6, [sp, #103]	@ 0x67
    102e:	2d00      	cmp	r5, #0
    1030:	f000 83c5 	beq.w	17be <_vfprintf_r+0xdde>
    1034:	f1b9 0f00 	cmp.w	r9, #0
    1038:	f2c0 851a 	blt.w	1a70 <_vfprintf_r+0x1090>
    103c:	464a      	mov	r2, r9
    103e:	4631      	mov	r1, r6
    1040:	4628      	mov	r0, r5
    1042:	f000 ff25 	bl	1e90 <memchr>
    1046:	2800      	cmp	r0, #0
    1048:	f000 8632 	beq.w	1cb0 <_vfprintf_r+0x12d0>
    104c:	1b43      	subs	r3, r0, r5
    104e:	9307      	str	r3, [sp, #28]
    1050:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1054:	9409      	str	r4, [sp, #36]	@ 0x24
    1056:	46b1      	mov	r9, r6
    1058:	f89d 4067 	ldrb.w	r4, [sp, #103]	@ 0x67
    105c:	9702      	str	r7, [sp, #8]
    105e:	9303      	str	r3, [sp, #12]
    1060:	960b      	str	r6, [sp, #44]	@ 0x2c
    1062:	e640      	b.n	ce6 <_vfprintf_r+0x306>
    1064:	f89b 3000 	ldrb.w	r3, [fp]
    1068:	f047 0720 	orr.w	r7, r7, #32
    106c:	e51c      	b.n	aa8 <_vfprintf_r+0xc8>
    106e:	9a09      	ldr	r2, [sp, #36]	@ 0x24
    1070:	f852 3b04 	ldr.w	r3, [r2], #4
    1074:	9209      	str	r2, [sp, #36]	@ 0x24
    1076:	f647 0230 	movw	r2, #30768	@ 0x7830
    107a:	f8ad 2068 	strh.w	r2, [sp, #104]	@ 0x68
    107e:	4a3b      	ldr	r2, [pc, #236]	@ (116c <_vfprintf_r+0x78c>)
    1080:	9211      	str	r2, [sp, #68]	@ 0x44
    1082:	f047 0702 	orr.w	r7, r7, #2
    1086:	2200      	movs	r2, #0
    1088:	2102      	movs	r1, #2
    108a:	f04f 0878 	mov.w	r8, #120	@ 0x78
    108e:	e5f3      	b.n	c78 <_vfprintf_r+0x298>
    1090:	06bd      	lsls	r5, r7, #26
    1092:	f140 835c 	bpl.w	174e <_vfprintf_r+0xd6e>
    1096:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    1098:	9a06      	ldr	r2, [sp, #24]
    109a:	681b      	ldr	r3, [r3, #0]
    109c:	601a      	str	r2, [r3, #0]
    109e:	17d2      	asrs	r2, r2, #31
    10a0:	605a      	str	r2, [r3, #4]
    10a2:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    10a4:	3304      	adds	r3, #4
    10a6:	9309      	str	r3, [sp, #36]	@ 0x24
    10a8:	e4dd      	b.n	a66 <_vfprintf_r+0x86>
    10aa:	f1b8 0f65 	cmp.w	r8, #101	@ 0x65
    10ae:	f340 8121 	ble.w	12f4 <_vfprintf_r+0x914>
    10b2:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
    10b6:	2200      	movs	r2, #0
    10b8:	2300      	movs	r3, #0
    10ba:	f006 f8e1 	bl	7280 <__aeabi_dcmpeq>
    10be:	2800      	cmp	r0, #0
    10c0:	f000 81f5 	beq.w	14ae <_vfprintf_r+0xace>
    10c4:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    10c6:	4a2a      	ldr	r2, [pc, #168]	@ (1170 <_vfprintf_r+0x790>)
    10c8:	f8ca 2000 	str.w	r2, [sl]
    10cc:	3301      	adds	r3, #1
    10ce:	3401      	adds	r4, #1
    10d0:	2201      	movs	r2, #1
    10d2:	2b07      	cmp	r3, #7
    10d4:	9423      	str	r4, [sp, #140]	@ 0x8c
    10d6:	9322      	str	r3, [sp, #136]	@ 0x88
    10d8:	f8ca 2004 	str.w	r2, [sl, #4]
    10dc:	f300 84a9 	bgt.w	1a32 <_vfprintf_r+0x1052>
    10e0:	f10a 0a08 	add.w	sl, sl, #8
    10e4:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    10e6:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    10e8:	4293      	cmp	r3, r2
    10ea:	f280 82a2 	bge.w	1632 <_vfprintf_r+0xc52>
    10ee:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    10f0:	9a10      	ldr	r2, [sp, #64]	@ 0x40
    10f2:	441c      	add	r4, r3
    10f4:	e9ca 2300 	strd	r2, r3, [sl]
    10f8:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    10fa:	9423      	str	r4, [sp, #140]	@ 0x8c
    10fc:	3301      	adds	r3, #1
    10fe:	2b07      	cmp	r3, #7
    1100:	9322      	str	r3, [sp, #136]	@ 0x88
    1102:	f300 8350 	bgt.w	17a6 <_vfprintf_r+0xdc6>
    1106:	f10a 0a08 	add.w	sl, sl, #8
    110a:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    110c:	1e5d      	subs	r5, r3, #1
    110e:	2d00      	cmp	r5, #0
    1110:	f77f ae81 	ble.w	e16 <_vfprintf_r+0x436>
    1114:	2d10      	cmp	r5, #16
    1116:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1118:	4f16      	ldr	r7, [pc, #88]	@ (1174 <_vfprintf_r+0x794>)
    111a:	f340 80d4 	ble.w	12c6 <_vfprintf_r+0x8e6>
    111e:	f8dd 8020 	ldr.w	r8, [sp, #32]
    1122:	f8dd 9010 	ldr.w	r9, [sp, #16]
    1126:	2610      	movs	r6, #16
    1128:	e005      	b.n	1136 <_vfprintf_r+0x756>
    112a:	f10a 0a08 	add.w	sl, sl, #8
    112e:	3d10      	subs	r5, #16
    1130:	2d10      	cmp	r5, #16
    1132:	f340 80c8 	ble.w	12c6 <_vfprintf_r+0x8e6>
    1136:	3301      	adds	r3, #1
    1138:	3410      	adds	r4, #16
    113a:	2b07      	cmp	r3, #7
    113c:	e9ca 7600 	strd	r7, r6, [sl]
    1140:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1144:	ddf1      	ble.n	112a <_vfprintf_r+0x74a>
    1146:	aa21      	add	r2, sp, #132	@ 0x84
    1148:	4649      	mov	r1, r9
    114a:	4640      	mov	r0, r8
    114c:	f002 fc44 	bl	39d8 <__sprint_r>
    1150:	2800      	cmp	r0, #0
    1152:	f47f adf5 	bne.w	d40 <_vfprintf_r+0x360>
    1156:	e9dd 3422 	ldrd	r3, r4, [sp, #136]	@ 0x88
    115a:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    115e:	e7e6      	b.n	112e <_vfprintf_r+0x74e>
    1160:	7fefffff 	.word	0x7fefffff
    1164:	0000744c 	.word	0x0000744c
    1168:	00007448 	.word	0x00007448
    116c:	0000746c 	.word	0x0000746c
    1170:	00007488 	.word	0x00007488
    1174:	0000756c 	.word	0x0000756c
    1178:	9b05      	ldr	r3, [sp, #20]
    117a:	9a03      	ldr	r2, [sp, #12]
    117c:	1a9e      	subs	r6, r3, r2
    117e:	2e00      	cmp	r6, #0
    1180:	f77f ae30 	ble.w	de4 <_vfprintf_r+0x404>
    1184:	2e10      	cmp	r6, #16
    1186:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1188:	4faf      	ldr	r7, [pc, #700]	@ (1448 <_vfprintf_r+0xa68>)
    118a:	dd24      	ble.n	11d6 <_vfprintf_r+0x7f6>
    118c:	4652      	mov	r2, sl
    118e:	4621      	mov	r1, r4
    1190:	46aa      	mov	sl, r5
    1192:	9c08      	ldr	r4, [sp, #32]
    1194:	9d04      	ldr	r5, [sp, #16]
    1196:	e004      	b.n	11a2 <_vfprintf_r+0x7c2>
    1198:	3e10      	subs	r6, #16
    119a:	2e10      	cmp	r6, #16
    119c:	f102 0208 	add.w	r2, r2, #8
    11a0:	dd16      	ble.n	11d0 <_vfprintf_r+0x7f0>
    11a2:	3301      	adds	r3, #1
    11a4:	3110      	adds	r1, #16
    11a6:	2010      	movs	r0, #16
    11a8:	2b07      	cmp	r3, #7
    11aa:	e9cd 3122 	strd	r3, r1, [sp, #136]	@ 0x88
    11ae:	6017      	str	r7, [r2, #0]
    11b0:	6050      	str	r0, [r2, #4]
    11b2:	ddf1      	ble.n	1198 <_vfprintf_r+0x7b8>
    11b4:	aa21      	add	r2, sp, #132	@ 0x84
    11b6:	4629      	mov	r1, r5
    11b8:	4620      	mov	r0, r4
    11ba:	f002 fc0d 	bl	39d8 <__sprint_r>
    11be:	2800      	cmp	r0, #0
    11c0:	f47f adbe 	bne.w	d40 <_vfprintf_r+0x360>
    11c4:	3e10      	subs	r6, #16
    11c6:	2e10      	cmp	r6, #16
    11c8:	e9dd 3122 	ldrd	r3, r1, [sp, #136]	@ 0x88
    11cc:	aa2e      	add	r2, sp, #184	@ 0xb8
    11ce:	dce8      	bgt.n	11a2 <_vfprintf_r+0x7c2>
    11d0:	4655      	mov	r5, sl
    11d2:	460c      	mov	r4, r1
    11d4:	4692      	mov	sl, r2
    11d6:	3301      	adds	r3, #1
    11d8:	4434      	add	r4, r6
    11da:	2b07      	cmp	r3, #7
    11dc:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    11e0:	f8ca 7000 	str.w	r7, [sl]
    11e4:	f8ca 6004 	str.w	r6, [sl, #4]
    11e8:	f300 8435 	bgt.w	1a56 <_vfprintf_r+0x1076>
    11ec:	9b07      	ldr	r3, [sp, #28]
    11ee:	eba9 0603 	sub.w	r6, r9, r3
    11f2:	2e00      	cmp	r6, #0
    11f4:	f10a 0a08 	add.w	sl, sl, #8
    11f8:	f77f adfa 	ble.w	df0 <_vfprintf_r+0x410>
    11fc:	2e10      	cmp	r6, #16
    11fe:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1200:	4f91      	ldr	r7, [pc, #580]	@ (1448 <_vfprintf_r+0xa68>)
    1202:	dd2c      	ble.n	125e <_vfprintf_r+0x87e>
    1204:	4652      	mov	r2, sl
    1206:	4621      	mov	r1, r4
    1208:	46b2      	mov	sl, r6
    120a:	9c08      	ldr	r4, [sp, #32]
    120c:	462e      	mov	r6, r5
    120e:	f04f 0910 	mov.w	r9, #16
    1212:	9d04      	ldr	r5, [sp, #16]
    1214:	e006      	b.n	1224 <_vfprintf_r+0x844>
    1216:	f1aa 0a10 	sub.w	sl, sl, #16
    121a:	f1ba 0f10 	cmp.w	sl, #16
    121e:	f102 0208 	add.w	r2, r2, #8
    1222:	dd18      	ble.n	1256 <_vfprintf_r+0x876>
    1224:	3301      	adds	r3, #1
    1226:	4888      	ldr	r0, [pc, #544]	@ (1448 <_vfprintf_r+0xa68>)
    1228:	3110      	adds	r1, #16
    122a:	2b07      	cmp	r3, #7
    122c:	e9c2 0900 	strd	r0, r9, [r2]
    1230:	e9cd 3122 	strd	r3, r1, [sp, #136]	@ 0x88
    1234:	ddef      	ble.n	1216 <_vfprintf_r+0x836>
    1236:	aa21      	add	r2, sp, #132	@ 0x84
    1238:	4629      	mov	r1, r5
    123a:	4620      	mov	r0, r4
    123c:	f002 fbcc 	bl	39d8 <__sprint_r>
    1240:	2800      	cmp	r0, #0
    1242:	f47f ad7d 	bne.w	d40 <_vfprintf_r+0x360>
    1246:	f1aa 0a10 	sub.w	sl, sl, #16
    124a:	f1ba 0f10 	cmp.w	sl, #16
    124e:	e9dd 3122 	ldrd	r3, r1, [sp, #136]	@ 0x88
    1252:	aa2e      	add	r2, sp, #184	@ 0xb8
    1254:	dce6      	bgt.n	1224 <_vfprintf_r+0x844>
    1256:	4635      	mov	r5, r6
    1258:	460c      	mov	r4, r1
    125a:	4656      	mov	r6, sl
    125c:	4692      	mov	sl, r2
    125e:	3301      	adds	r3, #1
    1260:	4434      	add	r4, r6
    1262:	2b07      	cmp	r3, #7
    1264:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1268:	f8ca 7000 	str.w	r7, [sl]
    126c:	f8ca 6004 	str.w	r6, [sl, #4]
    1270:	f300 81d2 	bgt.w	1618 <_vfprintf_r+0xc38>
    1274:	f10a 0a08 	add.w	sl, sl, #8
    1278:	e5ba      	b.n	df0 <_vfprintf_r+0x410>
    127a:	2901      	cmp	r1, #1
    127c:	9f02      	ldr	r7, [sp, #8]
    127e:	f04f 0300 	mov.w	r3, #0
    1282:	f43f ae58 	beq.w	f36 <_vfprintf_r+0x556>
    1286:	2902      	cmp	r1, #2
    1288:	461a      	mov	r2, r3
    128a:	f47f ad08 	bne.w	c9e <_vfprintf_r+0x2be>
    128e:	9811      	ldr	r0, [sp, #68]	@ 0x44
    1290:	ad2e      	add	r5, sp, #184	@ 0xb8
    1292:	f003 010f 	and.w	r1, r3, #15
    1296:	091b      	lsrs	r3, r3, #4
    1298:	5c41      	ldrb	r1, [r0, r1]
    129a:	f805 1d01 	strb.w	r1, [r5, #-1]!
    129e:	ea43 7302 	orr.w	r3, r3, r2, lsl #28
    12a2:	0912      	lsrs	r2, r2, #4
    12a4:	ea53 0102 	orrs.w	r1, r3, r2
    12a8:	d1f3      	bne.n	1292 <_vfprintf_r+0x8b2>
    12aa:	ab2e      	add	r3, sp, #184	@ 0xb8
    12ac:	1b5b      	subs	r3, r3, r5
    12ae:	9702      	str	r7, [sp, #8]
    12b0:	9307      	str	r3, [sp, #28]
    12b2:	e511      	b.n	cd8 <_vfprintf_r+0x2f8>
    12b4:	9904      	ldr	r1, [sp, #16]
    12b6:	9808      	ldr	r0, [sp, #32]
    12b8:	aa21      	add	r2, sp, #132	@ 0x84
    12ba:	f002 fb8d 	bl	39d8 <__sprint_r>
    12be:	2800      	cmp	r0, #0
    12c0:	f43f adbd 	beq.w	e3e <_vfprintf_r+0x45e>
    12c4:	e53c      	b.n	d40 <_vfprintf_r+0x360>
    12c6:	3301      	adds	r3, #1
    12c8:	442c      	add	r4, r5
    12ca:	2b07      	cmp	r3, #7
    12cc:	f8ca 7000 	str.w	r7, [sl]
    12d0:	f8ca 5004 	str.w	r5, [sl, #4]
    12d4:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    12d8:	f77f ad9b 	ble.w	e12 <_vfprintf_r+0x432>
    12dc:	9904      	ldr	r1, [sp, #16]
    12de:	9808      	ldr	r0, [sp, #32]
    12e0:	aa21      	add	r2, sp, #132	@ 0x84
    12e2:	f002 fb79 	bl	39d8 <__sprint_r>
    12e6:	2800      	cmp	r0, #0
    12e8:	f47f ad2a 	bne.w	d40 <_vfprintf_r+0x360>
    12ec:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    12ee:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    12f2:	e590      	b.n	e16 <_vfprintf_r+0x436>
    12f4:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    12f6:	9e22      	ldr	r6, [sp, #136]	@ 0x88
    12f8:	2b01      	cmp	r3, #1
    12fa:	f104 0401 	add.w	r4, r4, #1
    12fe:	f106 0601 	add.w	r6, r6, #1
    1302:	f10a 0808 	add.w	r8, sl, #8
    1306:	f340 813e 	ble.w	1586 <_vfprintf_r+0xba6>
    130a:	2301      	movs	r3, #1
    130c:	2e07      	cmp	r6, #7
    130e:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    1312:	f8ca 5000 	str.w	r5, [sl]
    1316:	f8ca 3004 	str.w	r3, [sl, #4]
    131a:	f300 82f3 	bgt.w	1904 <_vfprintf_r+0xf24>
    131e:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    1320:	9a10      	ldr	r2, [sp, #64]	@ 0x40
    1322:	3601      	adds	r6, #1
    1324:	441c      	add	r4, r3
    1326:	2e07      	cmp	r6, #7
    1328:	e9c8 2300 	strd	r2, r3, [r8]
    132c:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    1330:	f300 82f5 	bgt.w	191e <_vfprintf_r+0xf3e>
    1334:	f108 0808 	add.w	r8, r8, #8
    1338:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    133a:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
    133e:	f103 39ff 	add.w	r9, r3, #4294967295	@ 0xffffffff
    1342:	2200      	movs	r2, #0
    1344:	2300      	movs	r3, #0
    1346:	f005 ff9b 	bl	7280 <__aeabi_dcmpeq>
    134a:	2800      	cmp	r0, #0
    134c:	f040 813b 	bne.w	15c6 <_vfprintf_r+0xbe6>
    1350:	3601      	adds	r6, #1
    1352:	3501      	adds	r5, #1
    1354:	444c      	add	r4, r9
    1356:	2e07      	cmp	r6, #7
    1358:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    135c:	f8c8 5000 	str.w	r5, [r8]
    1360:	f8c8 9004 	str.w	r9, [r8, #4]
    1364:	f300 811d 	bgt.w	15a2 <_vfprintf_r+0xbc2>
    1368:	f108 0808 	add.w	r8, r8, #8
    136c:	9b12      	ldr	r3, [sp, #72]	@ 0x48
    136e:	f8c8 3004 	str.w	r3, [r8, #4]
    1372:	3601      	adds	r6, #1
    1374:	441c      	add	r4, r3
    1376:	2e07      	cmp	r6, #7
    1378:	ab1d      	add	r3, sp, #116	@ 0x74
    137a:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    137e:	f8c8 3000 	str.w	r3, [r8]
    1382:	dcab      	bgt.n	12dc <_vfprintf_r+0x8fc>
    1384:	f108 0a08 	add.w	sl, r8, #8
    1388:	e545      	b.n	e16 <_vfprintf_r+0x436>
    138a:	2e10      	cmp	r6, #16
    138c:	9a22      	ldr	r2, [sp, #136]	@ 0x88
    138e:	4f2f      	ldr	r7, [pc, #188]	@ (144c <_vfprintf_r+0xa6c>)
    1390:	dd28      	ble.n	13e4 <_vfprintf_r+0xa04>
    1392:	4651      	mov	r1, sl
    1394:	4620      	mov	r0, r4
    1396:	46ca      	mov	sl, r9
    1398:	9c08      	ldr	r4, [sp, #32]
    139a:	9313      	str	r3, [sp, #76]	@ 0x4c
    139c:	46a9      	mov	r9, r5
    139e:	9d04      	ldr	r5, [sp, #16]
    13a0:	e004      	b.n	13ac <_vfprintf_r+0x9cc>
    13a2:	3e10      	subs	r6, #16
    13a4:	2e10      	cmp	r6, #16
    13a6:	f101 0108 	add.w	r1, r1, #8
    13aa:	dd16      	ble.n	13da <_vfprintf_r+0x9fa>
    13ac:	3201      	adds	r2, #1
    13ae:	3010      	adds	r0, #16
    13b0:	2310      	movs	r3, #16
    13b2:	2a07      	cmp	r2, #7
    13b4:	e9cd 2022 	strd	r2, r0, [sp, #136]	@ 0x88
    13b8:	600f      	str	r7, [r1, #0]
    13ba:	604b      	str	r3, [r1, #4]
    13bc:	ddf1      	ble.n	13a2 <_vfprintf_r+0x9c2>
    13be:	aa21      	add	r2, sp, #132	@ 0x84
    13c0:	4629      	mov	r1, r5
    13c2:	4620      	mov	r0, r4
    13c4:	f002 fb08 	bl	39d8 <__sprint_r>
    13c8:	2800      	cmp	r0, #0
    13ca:	f47f acb9 	bne.w	d40 <_vfprintf_r+0x360>
    13ce:	3e10      	subs	r6, #16
    13d0:	2e10      	cmp	r6, #16
    13d2:	e9dd 2022 	ldrd	r2, r0, [sp, #136]	@ 0x88
    13d6:	a92e      	add	r1, sp, #184	@ 0xb8
    13d8:	dce8      	bgt.n	13ac <_vfprintf_r+0x9cc>
    13da:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
    13dc:	464d      	mov	r5, r9
    13de:	4604      	mov	r4, r0
    13e0:	46d1      	mov	r9, sl
    13e2:	468a      	mov	sl, r1
    13e4:	3201      	adds	r2, #1
    13e6:	4434      	add	r4, r6
    13e8:	2a07      	cmp	r2, #7
    13ea:	e9cd 2422 	strd	r2, r4, [sp, #136]	@ 0x88
    13ee:	f8ca 7000 	str.w	r7, [sl]
    13f2:	f8ca 6004 	str.w	r6, [sl, #4]
    13f6:	f300 82d9 	bgt.w	19ac <_vfprintf_r+0xfcc>
    13fa:	f10a 0a08 	add.w	sl, sl, #8
    13fe:	e4c6      	b.n	d8e <_vfprintf_r+0x3ae>
    1400:	9904      	ldr	r1, [sp, #16]
    1402:	9808      	ldr	r0, [sp, #32]
    1404:	9313      	str	r3, [sp, #76]	@ 0x4c
    1406:	aa21      	add	r2, sp, #132	@ 0x84
    1408:	f002 fae6 	bl	39d8 <__sprint_r>
    140c:	2800      	cmp	r0, #0
    140e:	f47f ac97 	bne.w	d40 <_vfprintf_r+0x360>
    1412:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1414:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
    1416:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    141a:	e4cd      	b.n	db8 <_vfprintf_r+0x3d8>
    141c:	9904      	ldr	r1, [sp, #16]
    141e:	9808      	ldr	r0, [sp, #32]
    1420:	aa21      	add	r2, sp, #132	@ 0x84
    1422:	f002 fad9 	bl	39d8 <__sprint_r>
    1426:	2800      	cmp	r0, #0
    1428:	f47f ac8a 	bne.w	d40 <_vfprintf_r+0x360>
    142c:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    142e:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1432:	e4d3      	b.n	ddc <_vfprintf_r+0x3fc>
    1434:	2d10      	cmp	r5, #16
    1436:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1438:	4f04      	ldr	r7, [pc, #16]	@ (144c <_vfprintf_r+0xa6c>)
    143a:	dd25      	ble.n	1488 <_vfprintf_r+0xaa8>
    143c:	f8dd 8020 	ldr.w	r8, [sp, #32]
    1440:	f8dd 9010 	ldr.w	r9, [sp, #16]
    1444:	2610      	movs	r6, #16
    1446:	e008      	b.n	145a <_vfprintf_r+0xa7a>
    1448:	0000756c 	.word	0x0000756c
    144c:	0000755c 	.word	0x0000755c
    1450:	3d10      	subs	r5, #16
    1452:	2d10      	cmp	r5, #16
    1454:	f10a 0a08 	add.w	sl, sl, #8
    1458:	dd16      	ble.n	1488 <_vfprintf_r+0xaa8>
    145a:	3301      	adds	r3, #1
    145c:	3410      	adds	r4, #16
    145e:	2b07      	cmp	r3, #7
    1460:	e9ca 7600 	strd	r7, r6, [sl]
    1464:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1468:	ddf2      	ble.n	1450 <_vfprintf_r+0xa70>
    146a:	aa21      	add	r2, sp, #132	@ 0x84
    146c:	4649      	mov	r1, r9
    146e:	4640      	mov	r0, r8
    1470:	f002 fab2 	bl	39d8 <__sprint_r>
    1474:	2800      	cmp	r0, #0
    1476:	f47f ac63 	bne.w	d40 <_vfprintf_r+0x360>
    147a:	3d10      	subs	r5, #16
    147c:	2d10      	cmp	r5, #16
    147e:	e9dd 3422 	ldrd	r3, r4, [sp, #136]	@ 0x88
    1482:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1486:	dce8      	bgt.n	145a <_vfprintf_r+0xa7a>
    1488:	3301      	adds	r3, #1
    148a:	442c      	add	r4, r5
    148c:	2b07      	cmp	r3, #7
    148e:	e9ca 7500 	strd	r7, r5, [sl]
    1492:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1496:	f77f acc7 	ble.w	e28 <_vfprintf_r+0x448>
    149a:	9904      	ldr	r1, [sp, #16]
    149c:	9808      	ldr	r0, [sp, #32]
    149e:	aa21      	add	r2, sp, #132	@ 0x84
    14a0:	f002 fa9a 	bl	39d8 <__sprint_r>
    14a4:	2800      	cmp	r0, #0
    14a6:	f47f ac4b 	bne.w	d40 <_vfprintf_r+0x360>
    14aa:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    14ac:	e4bc      	b.n	e28 <_vfprintf_r+0x448>
    14ae:	991b      	ldr	r1, [sp, #108]	@ 0x6c
    14b0:	2900      	cmp	r1, #0
    14b2:	f340 828a 	ble.w	19ca <_vfprintf_r+0xfea>
    14b6:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
    14b8:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    14ba:	429f      	cmp	r7, r3
    14bc:	bfa8      	it	ge
    14be:	461f      	movge	r7, r3
    14c0:	2f00      	cmp	r7, #0
    14c2:	dd0b      	ble.n	14dc <_vfprintf_r+0xafc>
    14c4:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    14c6:	3301      	adds	r3, #1
    14c8:	443c      	add	r4, r7
    14ca:	2b07      	cmp	r3, #7
    14cc:	e9ca 5700 	strd	r5, r7, [sl]
    14d0:	9423      	str	r4, [sp, #140]	@ 0x8c
    14d2:	9322      	str	r3, [sp, #136]	@ 0x88
    14d4:	f300 83c9 	bgt.w	1c6a <_vfprintf_r+0x128a>
    14d8:	f10a 0a08 	add.w	sl, sl, #8
    14dc:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
    14de:	2f00      	cmp	r7, #0
    14e0:	bfa8      	it	ge
    14e2:	1bf6      	subge	r6, r6, r7
    14e4:	2e00      	cmp	r6, #0
    14e6:	f300 8174 	bgt.w	17d2 <_vfprintf_r+0xdf2>
    14ea:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    14ec:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    14ee:	4293      	cmp	r3, r2
    14f0:	f2c0 819e 	blt.w	1830 <_vfprintf_r+0xe50>
    14f4:	9a02      	ldr	r2, [sp, #8]
    14f6:	07d0      	lsls	r0, r2, #31
    14f8:	f100 819a 	bmi.w	1830 <_vfprintf_r+0xe50>
    14fc:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    14fe:	990b      	ldr	r1, [sp, #44]	@ 0x2c
    1500:	1ad3      	subs	r3, r2, r3
    1502:	1a56      	subs	r6, r2, r1
    1504:	429e      	cmp	r6, r3
    1506:	bfa8      	it	ge
    1508:	461e      	movge	r6, r3
    150a:	2e00      	cmp	r6, #0
    150c:	dd0e      	ble.n	152c <_vfprintf_r+0xb4c>
    150e:	9a22      	ldr	r2, [sp, #136]	@ 0x88
    1510:	f8ca 6004 	str.w	r6, [sl, #4]
    1514:	3201      	adds	r2, #1
    1516:	440d      	add	r5, r1
    1518:	4434      	add	r4, r6
    151a:	2a07      	cmp	r2, #7
    151c:	f8ca 5000 	str.w	r5, [sl]
    1520:	9423      	str	r4, [sp, #140]	@ 0x8c
    1522:	9222      	str	r2, [sp, #136]	@ 0x88
    1524:	f300 83ad 	bgt.w	1c82 <_vfprintf_r+0x12a2>
    1528:	f10a 0a08 	add.w	sl, sl, #8
    152c:	2e00      	cmp	r6, #0
    152e:	bfac      	ite	ge
    1530:	1b9d      	subge	r5, r3, r6
    1532:	461d      	movlt	r5, r3
    1534:	2d00      	cmp	r5, #0
    1536:	f77f ac6e 	ble.w	e16 <_vfprintf_r+0x436>
    153a:	2d10      	cmp	r5, #16
    153c:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    153e:	4fb8      	ldr	r7, [pc, #736]	@ (1820 <_vfprintf_r+0xe40>)
    1540:	f77f aec1 	ble.w	12c6 <_vfprintf_r+0x8e6>
    1544:	f8dd 8020 	ldr.w	r8, [sp, #32]
    1548:	f8dd 9010 	ldr.w	r9, [sp, #16]
    154c:	2610      	movs	r6, #16
    154e:	e005      	b.n	155c <_vfprintf_r+0xb7c>
    1550:	f10a 0a08 	add.w	sl, sl, #8
    1554:	3d10      	subs	r5, #16
    1556:	2d10      	cmp	r5, #16
    1558:	f77f aeb5 	ble.w	12c6 <_vfprintf_r+0x8e6>
    155c:	3301      	adds	r3, #1
    155e:	3410      	adds	r4, #16
    1560:	2b07      	cmp	r3, #7
    1562:	e9ca 7600 	strd	r7, r6, [sl]
    1566:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    156a:	ddf1      	ble.n	1550 <_vfprintf_r+0xb70>
    156c:	aa21      	add	r2, sp, #132	@ 0x84
    156e:	4649      	mov	r1, r9
    1570:	4640      	mov	r0, r8
    1572:	f002 fa31 	bl	39d8 <__sprint_r>
    1576:	2800      	cmp	r0, #0
    1578:	f47f abe2 	bne.w	d40 <_vfprintf_r+0x360>
    157c:	e9dd 3422 	ldrd	r3, r4, [sp, #136]	@ 0x88
    1580:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1584:	e7e6      	b.n	1554 <_vfprintf_r+0xb74>
    1586:	9b02      	ldr	r3, [sp, #8]
    1588:	07d9      	lsls	r1, r3, #31
    158a:	f53f aebe 	bmi.w	130a <_vfprintf_r+0x92a>
    158e:	2301      	movs	r3, #1
    1590:	2e07      	cmp	r6, #7
    1592:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    1596:	f8ca 5000 	str.w	r5, [sl]
    159a:	f8ca 3004 	str.w	r3, [sl, #4]
    159e:	f77f aee5 	ble.w	136c <_vfprintf_r+0x98c>
    15a2:	9904      	ldr	r1, [sp, #16]
    15a4:	9808      	ldr	r0, [sp, #32]
    15a6:	aa21      	add	r2, sp, #132	@ 0x84
    15a8:	f002 fa16 	bl	39d8 <__sprint_r>
    15ac:	2800      	cmp	r0, #0
    15ae:	f47f abc7 	bne.w	d40 <_vfprintf_r+0x360>
    15b2:	e9dd 6422 	ldrd	r6, r4, [sp, #136]	@ 0x88
    15b6:	f10d 08b8 	add.w	r8, sp, #184	@ 0xb8
    15ba:	e6d7      	b.n	136c <_vfprintf_r+0x98c>
    15bc:	f8cd 901c 	str.w	r9, [sp, #28]
    15c0:	ad2e      	add	r5, sp, #184	@ 0xb8
    15c2:	f7ff bb89 	b.w	cd8 <_vfprintf_r+0x2f8>
    15c6:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    15c8:	2b01      	cmp	r3, #1
    15ca:	f77f aecf 	ble.w	136c <_vfprintf_r+0x98c>
    15ce:	2b11      	cmp	r3, #17
    15d0:	4f93      	ldr	r7, [pc, #588]	@ (1820 <_vfprintf_r+0xe40>)
    15d2:	f340 8289 	ble.w	1ae8 <_vfprintf_r+0x1108>
    15d6:	f8dd a020 	ldr.w	sl, [sp, #32]
    15da:	2510      	movs	r5, #16
    15dc:	e007      	b.n	15ee <_vfprintf_r+0xc0e>
    15de:	f108 0808 	add.w	r8, r8, #8
    15e2:	f1a9 0910 	sub.w	r9, r9, #16
    15e6:	f1b9 0f10 	cmp.w	r9, #16
    15ea:	f340 827d 	ble.w	1ae8 <_vfprintf_r+0x1108>
    15ee:	3601      	adds	r6, #1
    15f0:	3410      	adds	r4, #16
    15f2:	2e07      	cmp	r6, #7
    15f4:	e9c8 7500 	strd	r7, r5, [r8]
    15f8:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    15fc:	ddef      	ble.n	15de <_vfprintf_r+0xbfe>
    15fe:	9904      	ldr	r1, [sp, #16]
    1600:	aa21      	add	r2, sp, #132	@ 0x84
    1602:	4650      	mov	r0, sl
    1604:	f002 f9e8 	bl	39d8 <__sprint_r>
    1608:	2800      	cmp	r0, #0
    160a:	f47f ab99 	bne.w	d40 <_vfprintf_r+0x360>
    160e:	e9dd 6422 	ldrd	r6, r4, [sp, #136]	@ 0x88
    1612:	f10d 08b8 	add.w	r8, sp, #184	@ 0xb8
    1616:	e7e4      	b.n	15e2 <_vfprintf_r+0xc02>
    1618:	9904      	ldr	r1, [sp, #16]
    161a:	9808      	ldr	r0, [sp, #32]
    161c:	aa21      	add	r2, sp, #132	@ 0x84
    161e:	f002 f9db 	bl	39d8 <__sprint_r>
    1622:	2800      	cmp	r0, #0
    1624:	f47f ab8c 	bne.w	d40 <_vfprintf_r+0x360>
    1628:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    162a:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    162e:	f7ff bbdf 	b.w	df0 <_vfprintf_r+0x410>
    1632:	9b02      	ldr	r3, [sp, #8]
    1634:	07dd      	lsls	r5, r3, #31
    1636:	f57f abee 	bpl.w	e16 <_vfprintf_r+0x436>
    163a:	e558      	b.n	10ee <_vfprintf_r+0x70e>
    163c:	9309      	str	r3, [sp, #36]	@ 0x24
    163e:	f89b 3000 	ldrb.w	r3, [fp]
    1642:	f7ff ba31 	b.w	aa8 <_vfprintf_r+0xc8>
    1646:	ad2e      	add	r5, sp, #184	@ 0xb8
    1648:	f7ff bb46 	b.w	cd8 <_vfprintf_r+0x2f8>
    164c:	f017 0240 	ands.w	r2, r7, #64	@ 0x40
    1650:	bf1c      	itt	ne
    1652:	460a      	movne	r2, r1
    1654:	b29b      	uxthne	r3, r3
    1656:	2101      	movs	r1, #1
    1658:	f7ff bb0e 	b.w	c78 <_vfprintf_r+0x298>
    165c:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
    1660:	4602      	mov	r2, r0
    1662:	460b      	mov	r3, r1
    1664:	f005 fe3e 	bl	72e4 <__aeabi_dcmpun>
    1668:	2800      	cmp	r0, #0
    166a:	f040 836e 	bne.w	1d4a <_vfprintf_r+0x136a>
    166e:	f1b9 3fff 	cmp.w	r9, #4294967295	@ 0xffffffff
    1672:	f028 0620 	bic.w	r6, r8, #32
    1676:	f000 8313 	beq.w	1ca0 <_vfprintf_r+0x12c0>
    167a:	2e47      	cmp	r6, #71	@ 0x47
    167c:	d104      	bne.n	1688 <_vfprintf_r+0xca8>
    167e:	f1b9 0f00 	cmp.w	r9, #0
    1682:	bf08      	it	eq
    1684:	f04f 0901 	moveq.w	r9, #1
    1688:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
    168c:	f447 7280 	orr.w	r2, r7, #256	@ 0x100
    1690:	2900      	cmp	r1, #0
    1692:	9202      	str	r2, [sp, #8]
    1694:	f2c0 82c6 	blt.w	1c24 <_vfprintf_r+0x1244>
    1698:	ed9d 7b0c 	vldr	d7, [sp, #48]	@ 0x30
    169c:	ed8d 7b16 	vstr	d7, [sp, #88]	@ 0x58
    16a0:	2300      	movs	r3, #0
    16a2:	930a      	str	r3, [sp, #40]	@ 0x28
    16a4:	f1b8 0f65 	cmp.w	r8, #101	@ 0x65
    16a8:	f000 8299 	beq.w	1bde <_vfprintf_r+0x11fe>
    16ac:	f300 82d5 	bgt.w	1c5a <_vfprintf_r+0x127a>
    16b0:	f1b8 0f45 	cmp.w	r8, #69	@ 0x45
    16b4:	f000 8293 	beq.w	1bde <_vfprintf_r+0x11fe>
    16b8:	ab1f      	add	r3, sp, #124	@ 0x7c
    16ba:	9301      	str	r3, [sp, #4]
    16bc:	ab1c      	add	r3, sp, #112	@ 0x70
    16be:	9300      	str	r3, [sp, #0]
    16c0:	2102      	movs	r1, #2
    16c2:	ed9d 0b16 	vldr	d0, [sp, #88]	@ 0x58
    16c6:	9808      	ldr	r0, [sp, #32]
    16c8:	ab1b      	add	r3, sp, #108	@ 0x6c
    16ca:	464a      	mov	r2, r9
    16cc:	f000 fd9e 	bl	220c <_dtoa_r>
    16d0:	07f9      	lsls	r1, r7, #31
    16d2:	4605      	mov	r5, r0
    16d4:	f140 80c0 	bpl.w	1858 <_vfprintf_r+0xe78>
    16d8:	eb00 0409 	add.w	r4, r0, r9
    16dc:	e9dd 0116 	ldrd	r0, r1, [sp, #88]	@ 0x58
    16e0:	2200      	movs	r2, #0
    16e2:	2300      	movs	r3, #0
    16e4:	f005 fdcc 	bl	7280 <__aeabi_dcmpeq>
    16e8:	2800      	cmp	r0, #0
    16ea:	f040 8229 	bne.w	1b40 <_vfprintf_r+0x1160>
    16ee:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
    16f0:	42a3      	cmp	r3, r4
    16f2:	d206      	bcs.n	1702 <_vfprintf_r+0xd22>
    16f4:	2130      	movs	r1, #48	@ 0x30
    16f6:	1c5a      	adds	r2, r3, #1
    16f8:	921f      	str	r2, [sp, #124]	@ 0x7c
    16fa:	7019      	strb	r1, [r3, #0]
    16fc:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
    16fe:	429c      	cmp	r4, r3
    1700:	d8f9      	bhi.n	16f6 <_vfprintf_r+0xd16>
    1702:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
    1704:	920b      	str	r2, [sp, #44]	@ 0x2c
    1706:	1b5b      	subs	r3, r3, r5
    1708:	2e47      	cmp	r6, #71	@ 0x47
    170a:	930e      	str	r3, [sp, #56]	@ 0x38
    170c:	f000 80a9 	beq.w	1862 <_vfprintf_r+0xe82>
    1710:	f1b8 0f66 	cmp.w	r8, #102	@ 0x66
    1714:	f040 80bc 	bne.w	1890 <_vfprintf_r+0xeb0>
    1718:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
    171a:	f007 0301 	and.w	r3, r7, #1
    171e:	2a00      	cmp	r2, #0
    1720:	ea43 0309 	orr.w	r3, r3, r9
    1724:	f340 8357 	ble.w	1dd6 <_vfprintf_r+0x13f6>
    1728:	2b00      	cmp	r3, #0
    172a:	f040 8334 	bne.w	1d96 <_vfprintf_r+0x13b6>
    172e:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    1730:	9303      	str	r3, [sp, #12]
    1732:	9307      	str	r3, [sp, #28]
    1734:	f04f 0866 	mov.w	r8, #102	@ 0x66
    1738:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
    173a:	2b00      	cmp	r3, #0
    173c:	f000 826c 	beq.w	1c18 <_vfprintf_r+0x1238>
    1740:	232d      	movs	r3, #45	@ 0x2d
    1742:	f88d 3067 	strb.w	r3, [sp, #103]	@ 0x67
    1746:	f04f 0900 	mov.w	r9, #0
    174a:	f7ff bacd 	b.w	ce8 <_vfprintf_r+0x308>
    174e:	06fc      	lsls	r4, r7, #27
    1750:	d47d      	bmi.n	184e <_vfprintf_r+0xe6e>
    1752:	0678      	lsls	r0, r7, #25
    1754:	d57b      	bpl.n	184e <_vfprintf_r+0xe6e>
    1756:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    1758:	9a06      	ldr	r2, [sp, #24]
    175a:	681b      	ldr	r3, [r3, #0]
    175c:	801a      	strh	r2, [r3, #0]
    175e:	e4a0      	b.n	10a2 <_vfprintf_r+0x6c2>
    1760:	4b30      	ldr	r3, [pc, #192]	@ (1824 <_vfprintf_r+0xe44>)
    1762:	9311      	str	r3, [sp, #68]	@ 0x44
    1764:	f017 0220 	ands.w	r2, r7, #32
    1768:	f000 80be 	beq.w	18e8 <_vfprintf_r+0xf08>
    176c:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    176e:	3307      	adds	r3, #7
    1770:	f023 0307 	bic.w	r3, r3, #7
    1774:	4619      	mov	r1, r3
    1776:	685a      	ldr	r2, [r3, #4]
    1778:	f851 3b08 	ldr.w	r3, [r1], #8
    177c:	9109      	str	r1, [sp, #36]	@ 0x24
    177e:	07f9      	lsls	r1, r7, #31
    1780:	f140 80af 	bpl.w	18e2 <_vfprintf_r+0xf02>
    1784:	ea53 0102 	orrs.w	r1, r3, r2
    1788:	f000 80ab 	beq.w	18e2 <_vfprintf_r+0xf02>
    178c:	2130      	movs	r1, #48	@ 0x30
    178e:	f88d 1068 	strb.w	r1, [sp, #104]	@ 0x68
    1792:	f88d 8069 	strb.w	r8, [sp, #105]	@ 0x69
    1796:	f047 0702 	orr.w	r7, r7, #2
    179a:	2102      	movs	r1, #2
    179c:	f7ff ba6c 	b.w	c78 <_vfprintf_r+0x298>
    17a0:	4b21      	ldr	r3, [pc, #132]	@ (1828 <_vfprintf_r+0xe48>)
    17a2:	9311      	str	r3, [sp, #68]	@ 0x44
    17a4:	e7de      	b.n	1764 <_vfprintf_r+0xd84>
    17a6:	9904      	ldr	r1, [sp, #16]
    17a8:	9808      	ldr	r0, [sp, #32]
    17aa:	aa21      	add	r2, sp, #132	@ 0x84
    17ac:	f002 f914 	bl	39d8 <__sprint_r>
    17b0:	2800      	cmp	r0, #0
    17b2:	f47f aac5 	bne.w	d40 <_vfprintf_r+0x360>
    17b6:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    17b8:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    17bc:	e4a5      	b.n	110a <_vfprintf_r+0x72a>
    17be:	464b      	mov	r3, r9
    17c0:	2b06      	cmp	r3, #6
    17c2:	bf28      	it	cs
    17c4:	2306      	movcs	r3, #6
    17c6:	4d19      	ldr	r5, [pc, #100]	@ (182c <_vfprintf_r+0xe4c>)
    17c8:	9307      	str	r3, [sp, #28]
    17ca:	9409      	str	r4, [sp, #36]	@ 0x24
    17cc:	9303      	str	r3, [sp, #12]
    17ce:	f7ff bacc 	b.w	d6a <_vfprintf_r+0x38a>
    17d2:	2e10      	cmp	r6, #16
    17d4:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    17d6:	4f12      	ldr	r7, [pc, #72]	@ (1820 <_vfprintf_r+0xe40>)
    17d8:	f340 8193 	ble.w	1b02 <_vfprintf_r+0x1122>
    17dc:	4622      	mov	r2, r4
    17de:	f8dd 9020 	ldr.w	r9, [sp, #32]
    17e2:	9c04      	ldr	r4, [sp, #16]
    17e4:	f04f 0810 	mov.w	r8, #16
    17e8:	e005      	b.n	17f6 <_vfprintf_r+0xe16>
    17ea:	f10a 0a08 	add.w	sl, sl, #8
    17ee:	3e10      	subs	r6, #16
    17f0:	2e10      	cmp	r6, #16
    17f2:	f340 8185 	ble.w	1b00 <_vfprintf_r+0x1120>
    17f6:	3301      	adds	r3, #1
    17f8:	3210      	adds	r2, #16
    17fa:	2b07      	cmp	r3, #7
    17fc:	e9ca 7800 	strd	r7, r8, [sl]
    1800:	e9cd 3222 	strd	r3, r2, [sp, #136]	@ 0x88
    1804:	ddf1      	ble.n	17ea <_vfprintf_r+0xe0a>
    1806:	aa21      	add	r2, sp, #132	@ 0x84
    1808:	4621      	mov	r1, r4
    180a:	4648      	mov	r0, r9
    180c:	f002 f8e4 	bl	39d8 <__sprint_r>
    1810:	2800      	cmp	r0, #0
    1812:	f47f aa95 	bne.w	d40 <_vfprintf_r+0x360>
    1816:	e9dd 3222 	ldrd	r3, r2, [sp, #136]	@ 0x88
    181a:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    181e:	e7e6      	b.n	17ee <_vfprintf_r+0xe0e>
    1820:	0000756c 	.word	0x0000756c
    1824:	00007458 	.word	0x00007458
    1828:	0000746c 	.word	0x0000746c
    182c:	00007480 	.word	0x00007480
    1830:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
    1832:	9910      	ldr	r1, [sp, #64]	@ 0x40
    1834:	4414      	add	r4, r2
    1836:	e9ca 1200 	strd	r1, r2, [sl]
    183a:	9a22      	ldr	r2, [sp, #136]	@ 0x88
    183c:	9423      	str	r4, [sp, #140]	@ 0x8c
    183e:	3201      	adds	r2, #1
    1840:	2a07      	cmp	r2, #7
    1842:	9222      	str	r2, [sp, #136]	@ 0x88
    1844:	f300 81fc 	bgt.w	1c40 <_vfprintf_r+0x1260>
    1848:	f10a 0a08 	add.w	sl, sl, #8
    184c:	e656      	b.n	14fc <_vfprintf_r+0xb1c>
    184e:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    1850:	9a06      	ldr	r2, [sp, #24]
    1852:	681b      	ldr	r3, [r3, #0]
    1854:	601a      	str	r2, [r3, #0]
    1856:	e424      	b.n	10a2 <_vfprintf_r+0x6c2>
    1858:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
    185a:	1a1b      	subs	r3, r3, r0
    185c:	930e      	str	r3, [sp, #56]	@ 0x38
    185e:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    1860:	930b      	str	r3, [sp, #44]	@ 0x2c
    1862:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    1864:	1cda      	adds	r2, r3, #3
    1866:	db11      	blt.n	188c <_vfprintf_r+0xeac>
    1868:	4599      	cmp	r9, r3
    186a:	db0f      	blt.n	188c <_vfprintf_r+0xeac>
    186c:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    186e:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
    1870:	4293      	cmp	r3, r2
    1872:	f300 824f 	bgt.w	1d14 <_vfprintf_r+0x1334>
    1876:	07fe      	lsls	r6, r7, #31
    1878:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    187a:	f100 8277 	bmi.w	1d6c <_vfprintf_r+0x138c>
    187e:	ea23 72e3 	bic.w	r2, r3, r3, asr #31
    1882:	9203      	str	r2, [sp, #12]
    1884:	9307      	str	r3, [sp, #28]
    1886:	f04f 0867 	mov.w	r8, #103	@ 0x67
    188a:	e755      	b.n	1738 <_vfprintf_r+0xd58>
    188c:	f1a8 0802 	sub.w	r8, r8, #2
    1890:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    1892:	f88d 8074 	strb.w	r8, [sp, #116]	@ 0x74
    1896:	1e59      	subs	r1, r3, #1
    1898:	2900      	cmp	r1, #0
    189a:	911b      	str	r1, [sp, #108]	@ 0x6c
    189c:	bfb6      	itet	lt
    189e:	f1c3 0101 	rsblt	r1, r3, #1
    18a2:	232b      	movge	r3, #43	@ 0x2b
    18a4:	232d      	movlt	r3, #45	@ 0x2d
    18a6:	2909      	cmp	r1, #9
    18a8:	f88d 3075 	strb.w	r3, [sp, #117]	@ 0x75
    18ac:	f300 8153 	bgt.w	1b56 <_vfprintf_r+0x1176>
    18b0:	2330      	movs	r3, #48	@ 0x30
    18b2:	3130      	adds	r1, #48	@ 0x30
    18b4:	f88d 3076 	strb.w	r3, [sp, #118]	@ 0x76
    18b8:	2304      	movs	r3, #4
    18ba:	f88d 1077 	strb.w	r1, [sp, #119]	@ 0x77
    18be:	9312      	str	r3, [sp, #72]	@ 0x48
    18c0:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    18c2:	9b12      	ldr	r3, [sp, #72]	@ 0x48
    18c4:	2a01      	cmp	r2, #1
    18c6:	4413      	add	r3, r2
    18c8:	9307      	str	r3, [sp, #28]
    18ca:	f340 821a 	ble.w	1d02 <_vfprintf_r+0x1322>
    18ce:	9b07      	ldr	r3, [sp, #28]
    18d0:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
    18d2:	4413      	add	r3, r2
    18d4:	9307      	str	r3, [sp, #28]
    18d6:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    18da:	9303      	str	r3, [sp, #12]
    18dc:	2300      	movs	r3, #0
    18de:	930b      	str	r3, [sp, #44]	@ 0x2c
    18e0:	e72a      	b.n	1738 <_vfprintf_r+0xd58>
    18e2:	2102      	movs	r1, #2
    18e4:	f7ff b9c8 	b.w	c78 <_vfprintf_r+0x298>
    18e8:	9909      	ldr	r1, [sp, #36]	@ 0x24
    18ea:	f851 3b04 	ldr.w	r3, [r1], #4
    18ee:	9109      	str	r1, [sp, #36]	@ 0x24
    18f0:	f017 0110 	ands.w	r1, r7, #16
    18f4:	f47f af43 	bne.w	177e <_vfprintf_r+0xd9e>
    18f8:	f017 0240 	ands.w	r2, r7, #64	@ 0x40
    18fc:	bf1c      	itt	ne
    18fe:	b29b      	uxthne	r3, r3
    1900:	460a      	movne	r2, r1
    1902:	e73c      	b.n	177e <_vfprintf_r+0xd9e>
    1904:	9904      	ldr	r1, [sp, #16]
    1906:	9808      	ldr	r0, [sp, #32]
    1908:	aa21      	add	r2, sp, #132	@ 0x84
    190a:	f002 f865 	bl	39d8 <__sprint_r>
    190e:	2800      	cmp	r0, #0
    1910:	f47f aa16 	bne.w	d40 <_vfprintf_r+0x360>
    1914:	e9dd 6422 	ldrd	r6, r4, [sp, #136]	@ 0x88
    1918:	f10d 08b8 	add.w	r8, sp, #184	@ 0xb8
    191c:	e4ff      	b.n	131e <_vfprintf_r+0x93e>
    191e:	9904      	ldr	r1, [sp, #16]
    1920:	9808      	ldr	r0, [sp, #32]
    1922:	aa21      	add	r2, sp, #132	@ 0x84
    1924:	f002 f858 	bl	39d8 <__sprint_r>
    1928:	2800      	cmp	r0, #0
    192a:	f47f aa09 	bne.w	d40 <_vfprintf_r+0x360>
    192e:	e9dd 6422 	ldrd	r6, r4, [sp, #136]	@ 0x88
    1932:	f10d 08b8 	add.w	r8, sp, #184	@ 0xb8
    1936:	e4ff      	b.n	1338 <_vfprintf_r+0x958>
    1938:	e9cd 8702 	strd	r8, r7, [sp, #8]
    193c:	4ebd      	ldr	r6, [pc, #756]	@ (1c34 <_vfprintf_r+0x1254>)
    193e:	ad2e      	add	r5, sp, #184	@ 0xb8
    1940:	f04f 0e05 	mov.w	lr, #5
    1944:	1899      	adds	r1, r3, r2
    1946:	f141 0100 	adc.w	r1, r1, #0
    194a:	fba6 0701 	umull	r0, r7, r6, r1
    194e:	f027 0003 	bic.w	r0, r7, #3
    1952:	eb00 0097 	add.w	r0, r0, r7, lsr #2
    1956:	1a09      	subs	r1, r1, r0
    1958:	1a58      	subs	r0, r3, r1
    195a:	4698      	mov	r8, r3
    195c:	4694      	mov	ip, r2
    195e:	f162 0300 	sbc.w	r3, r2, #0
    1962:	f04f 32cc 	mov.w	r2, #3435973836	@ 0xcccccccc
    1966:	fb02 f200 	mul.w	r2, r2, r0
    196a:	fb06 2203 	mla	r2, r6, r3, r2
    196e:	fba0 3006 	umull	r3, r0, r0, r6
    1972:	f003 0701 	and.w	r7, r3, #1
    1976:	4402      	add	r2, r0
    1978:	fba7 070e 	umull	r0, r7, r7, lr
    197c:	1840      	adds	r0, r0, r1
    197e:	f1b8 0f0a 	cmp.w	r8, #10
    1982:	ea4f 0353 	mov.w	r3, r3, lsr #1
    1986:	f100 0030 	add.w	r0, r0, #48	@ 0x30
    198a:	f17c 0c00 	sbcs.w	ip, ip, #0
    198e:	ea43 73c2 	orr.w	r3, r3, r2, lsl #31
    1992:	f805 0d01 	strb.w	r0, [r5, #-1]!
    1996:	ea4f 0252 	mov.w	r2, r2, lsr #1
    199a:	d2d3      	bcs.n	1944 <_vfprintf_r+0xf64>
    199c:	e9dd 8702 	ldrd	r8, r7, [sp, #8]
    19a0:	ab2e      	add	r3, sp, #184	@ 0xb8
    19a2:	1b5b      	subs	r3, r3, r5
    19a4:	9702      	str	r7, [sp, #8]
    19a6:	9307      	str	r3, [sp, #28]
    19a8:	f7ff b996 	b.w	cd8 <_vfprintf_r+0x2f8>
    19ac:	9904      	ldr	r1, [sp, #16]
    19ae:	9808      	ldr	r0, [sp, #32]
    19b0:	9313      	str	r3, [sp, #76]	@ 0x4c
    19b2:	aa21      	add	r2, sp, #132	@ 0x84
    19b4:	f002 f810 	bl	39d8 <__sprint_r>
    19b8:	2800      	cmp	r0, #0
    19ba:	f47f a9c1 	bne.w	d40 <_vfprintf_r+0x360>
    19be:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    19c0:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
    19c2:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    19c6:	f7ff b9e2 	b.w	d8e <_vfprintf_r+0x3ae>
    19ca:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    19cc:	4a9a      	ldr	r2, [pc, #616]	@ (1c38 <_vfprintf_r+0x1258>)
    19ce:	f8ca 2000 	str.w	r2, [sl]
    19d2:	3301      	adds	r3, #1
    19d4:	3401      	adds	r4, #1
    19d6:	2201      	movs	r2, #1
    19d8:	2b07      	cmp	r3, #7
    19da:	9423      	str	r4, [sp, #140]	@ 0x8c
    19dc:	9322      	str	r3, [sp, #136]	@ 0x88
    19de:	f8ca 2004 	str.w	r2, [sl, #4]
    19e2:	f300 80a0 	bgt.w	1b26 <_vfprintf_r+0x1146>
    19e6:	f10a 0a08 	add.w	sl, sl, #8
    19ea:	2900      	cmp	r1, #0
    19ec:	d146      	bne.n	1a7c <_vfprintf_r+0x109c>
    19ee:	9b02      	ldr	r3, [sp, #8]
    19f0:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    19f2:	f003 0301 	and.w	r3, r3, #1
    19f6:	4313      	orrs	r3, r2
    19f8:	f43f aa0d 	beq.w	e16 <_vfprintf_r+0x436>
    19fc:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    19fe:	9910      	ldr	r1, [sp, #64]	@ 0x40
    1a00:	191a      	adds	r2, r3, r4
    1a02:	e9ca 1300 	strd	r1, r3, [sl]
    1a06:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1a08:	9223      	str	r2, [sp, #140]	@ 0x8c
    1a0a:	3301      	adds	r3, #1
    1a0c:	2b07      	cmp	r3, #7
    1a0e:	9322      	str	r3, [sp, #136]	@ 0x88
    1a10:	f300 80cb 	bgt.w	1baa <_vfprintf_r+0x11ca>
    1a14:	f10a 0a08 	add.w	sl, sl, #8
    1a18:	990e      	ldr	r1, [sp, #56]	@ 0x38
    1a1a:	f8ca 5000 	str.w	r5, [sl]
    1a1e:	3301      	adds	r3, #1
    1a20:	188c      	adds	r4, r1, r2
    1a22:	2b07      	cmp	r3, #7
    1a24:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1a28:	f8ca 1004 	str.w	r1, [sl, #4]
    1a2c:	f77f a9f1 	ble.w	e12 <_vfprintf_r+0x432>
    1a30:	e454      	b.n	12dc <_vfprintf_r+0x8fc>
    1a32:	9904      	ldr	r1, [sp, #16]
    1a34:	9808      	ldr	r0, [sp, #32]
    1a36:	aa21      	add	r2, sp, #132	@ 0x84
    1a38:	f001 ffce 	bl	39d8 <__sprint_r>
    1a3c:	2800      	cmp	r0, #0
    1a3e:	f47f a97f 	bne.w	d40 <_vfprintf_r+0x360>
    1a42:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1a44:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1a48:	f7ff bb4c 	b.w	10e4 <_vfprintf_r+0x704>
    1a4c:	9808      	ldr	r0, [sp, #32]
    1a4e:	f001 ff03 	bl	3858 <__sinit>
    1a52:	f7fe bfdb 	b.w	a0c <_vfprintf_r+0x2c>
    1a56:	9904      	ldr	r1, [sp, #16]
    1a58:	9808      	ldr	r0, [sp, #32]
    1a5a:	aa21      	add	r2, sp, #132	@ 0x84
    1a5c:	f001 ffbc 	bl	39d8 <__sprint_r>
    1a60:	2800      	cmp	r0, #0
    1a62:	f47f a96d 	bne.w	d40 <_vfprintf_r+0x360>
    1a66:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1a68:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1a6c:	f7ff b9ba 	b.w	de4 <_vfprintf_r+0x404>
    1a70:	4628      	mov	r0, r5
    1a72:	f001 ff45 	bl	3900 <strlen>
    1a76:	4603      	mov	r3, r0
    1a78:	f7ff bae9 	b.w	104e <_vfprintf_r+0x66e>
    1a7c:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    1a7e:	9810      	ldr	r0, [sp, #64]	@ 0x40
    1a80:	191a      	adds	r2, r3, r4
    1a82:	e9ca 0300 	strd	r0, r3, [sl]
    1a86:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    1a88:	9223      	str	r2, [sp, #140]	@ 0x8c
    1a8a:	3301      	adds	r3, #1
    1a8c:	2b07      	cmp	r3, #7
    1a8e:	9322      	str	r3, [sp, #136]	@ 0x88
    1a90:	f300 808b 	bgt.w	1baa <_vfprintf_r+0x11ca>
    1a94:	f10a 0a08 	add.w	sl, sl, #8
    1a98:	2900      	cmp	r1, #0
    1a9a:	dabd      	bge.n	1a18 <_vfprintf_r+0x1038>
    1a9c:	424e      	negs	r6, r1
    1a9e:	3110      	adds	r1, #16
    1aa0:	4f66      	ldr	r7, [pc, #408]	@ (1c3c <_vfprintf_r+0x125c>)
    1aa2:	f280 8116 	bge.w	1cd2 <_vfprintf_r+0x12f2>
    1aa6:	f8dd 8020 	ldr.w	r8, [sp, #32]
    1aaa:	f8dd 9010 	ldr.w	r9, [sp, #16]
    1aae:	2410      	movs	r4, #16
    1ab0:	e005      	b.n	1abe <_vfprintf_r+0x10de>
    1ab2:	f10a 0a08 	add.w	sl, sl, #8
    1ab6:	3e10      	subs	r6, #16
    1ab8:	2e10      	cmp	r6, #16
    1aba:	f340 810a 	ble.w	1cd2 <_vfprintf_r+0x12f2>
    1abe:	3301      	adds	r3, #1
    1ac0:	3210      	adds	r2, #16
    1ac2:	2b07      	cmp	r3, #7
    1ac4:	e9ca 7400 	strd	r7, r4, [sl]
    1ac8:	e9cd 3222 	strd	r3, r2, [sp, #136]	@ 0x88
    1acc:	ddf1      	ble.n	1ab2 <_vfprintf_r+0x10d2>
    1ace:	aa21      	add	r2, sp, #132	@ 0x84
    1ad0:	4649      	mov	r1, r9
    1ad2:	4640      	mov	r0, r8
    1ad4:	f001 ff80 	bl	39d8 <__sprint_r>
    1ad8:	2800      	cmp	r0, #0
    1ada:	f47f a931 	bne.w	d40 <_vfprintf_r+0x360>
    1ade:	e9dd 3222 	ldrd	r3, r2, [sp, #136]	@ 0x88
    1ae2:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1ae6:	e7e6      	b.n	1ab6 <_vfprintf_r+0x10d6>
    1ae8:	3601      	adds	r6, #1
    1aea:	444c      	add	r4, r9
    1aec:	2e07      	cmp	r6, #7
    1aee:	e9cd 6422 	strd	r6, r4, [sp, #136]	@ 0x88
    1af2:	f8c8 7000 	str.w	r7, [r8]
    1af6:	f8c8 9004 	str.w	r9, [r8, #4]
    1afa:	f77f ac35 	ble.w	1368 <_vfprintf_r+0x988>
    1afe:	e550      	b.n	15a2 <_vfprintf_r+0xbc2>
    1b00:	4614      	mov	r4, r2
    1b02:	3301      	adds	r3, #1
    1b04:	4434      	add	r4, r6
    1b06:	2b07      	cmp	r3, #7
    1b08:	e9cd 3422 	strd	r3, r4, [sp, #136]	@ 0x88
    1b0c:	f8ca 7000 	str.w	r7, [sl]
    1b10:	f8ca 6004 	str.w	r6, [sl, #4]
    1b14:	dc57      	bgt.n	1bc6 <_vfprintf_r+0x11e6>
    1b16:	f10a 0a08 	add.w	sl, sl, #8
    1b1a:	e4e6      	b.n	14ea <_vfprintf_r+0xb0a>
    1b1c:	242d      	movs	r4, #45	@ 0x2d
    1b1e:	f88d 4067 	strb.w	r4, [sp, #103]	@ 0x67
    1b22:	f7ff b9c0 	b.w	ea6 <_vfprintf_r+0x4c6>
    1b26:	9904      	ldr	r1, [sp, #16]
    1b28:	9808      	ldr	r0, [sp, #32]
    1b2a:	aa21      	add	r2, sp, #132	@ 0x84
    1b2c:	f001 ff54 	bl	39d8 <__sprint_r>
    1b30:	2800      	cmp	r0, #0
    1b32:	f47f a905 	bne.w	d40 <_vfprintf_r+0x360>
    1b36:	991b      	ldr	r1, [sp, #108]	@ 0x6c
    1b38:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1b3a:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1b3e:	e754      	b.n	19ea <_vfprintf_r+0x100a>
    1b40:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
    1b42:	920b      	str	r2, [sp, #44]	@ 0x2c
    1b44:	4623      	mov	r3, r4
    1b46:	e5de      	b.n	1706 <_vfprintf_r+0xd26>
    1b48:	9904      	ldr	r1, [sp, #16]
    1b4a:	9808      	ldr	r0, [sp, #32]
    1b4c:	aa21      	add	r2, sp, #132	@ 0x84
    1b4e:	f001 ff43 	bl	39d8 <__sprint_r>
    1b52:	f7ff b8f5 	b.w	d40 <_vfprintf_r+0x360>
    1b56:	f10d 0483 	add.w	r4, sp, #131	@ 0x83
    1b5a:	4e36      	ldr	r6, [pc, #216]	@ (1c34 <_vfprintf_r+0x1254>)
    1b5c:	4623      	mov	r3, r4
    1b5e:	4618      	mov	r0, r3
    1b60:	fba6 2301 	umull	r2, r3, r6, r1
    1b64:	08db      	lsrs	r3, r3, #3
    1b66:	eb03 0283 	add.w	r2, r3, r3, lsl #2
    1b6a:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
    1b6e:	3230      	adds	r2, #48	@ 0x30
    1b70:	f800 2c01 	strb.w	r2, [r0, #-1]
    1b74:	460a      	mov	r2, r1
    1b76:	2a63      	cmp	r2, #99	@ 0x63
    1b78:	4619      	mov	r1, r3
    1b7a:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
    1b7e:	dcee      	bgt.n	1b5e <_vfprintf_r+0x117e>
    1b80:	3130      	adds	r1, #48	@ 0x30
    1b82:	f803 1c01 	strb.w	r1, [r3, #-1]
    1b86:	1e83      	subs	r3, r0, #2
    1b88:	42a3      	cmp	r3, r4
    1b8a:	f080 8121 	bcs.w	1dd0 <_vfprintf_r+0x13f0>
    1b8e:	f10d 0275 	add.w	r2, sp, #117	@ 0x75
    1b92:	f813 1b01 	ldrb.w	r1, [r3], #1
    1b96:	f802 1f01 	strb.w	r1, [r2, #1]!
    1b9a:	42a3      	cmp	r3, r4
    1b9c:	d1f9      	bne.n	1b92 <_vfprintf_r+0x11b2>
    1b9e:	ab3e      	add	r3, sp, #248	@ 0xf8
    1ba0:	1a18      	subs	r0, r3, r0
    1ba2:	f1a0 0371 	sub.w	r3, r0, #113	@ 0x71
    1ba6:	9312      	str	r3, [sp, #72]	@ 0x48
    1ba8:	e68a      	b.n	18c0 <_vfprintf_r+0xee0>
    1baa:	9904      	ldr	r1, [sp, #16]
    1bac:	9808      	ldr	r0, [sp, #32]
    1bae:	aa21      	add	r2, sp, #132	@ 0x84
    1bb0:	f001 ff12 	bl	39d8 <__sprint_r>
    1bb4:	2800      	cmp	r0, #0
    1bb6:	f47f a8c3 	bne.w	d40 <_vfprintf_r+0x360>
    1bba:	e9dd 3222 	ldrd	r3, r2, [sp, #136]	@ 0x88
    1bbe:	991b      	ldr	r1, [sp, #108]	@ 0x6c
    1bc0:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1bc4:	e768      	b.n	1a98 <_vfprintf_r+0x10b8>
    1bc6:	9904      	ldr	r1, [sp, #16]
    1bc8:	9808      	ldr	r0, [sp, #32]
    1bca:	aa21      	add	r2, sp, #132	@ 0x84
    1bcc:	f001 ff04 	bl	39d8 <__sprint_r>
    1bd0:	2800      	cmp	r0, #0
    1bd2:	f47f a8b5 	bne.w	d40 <_vfprintf_r+0x360>
    1bd6:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1bd8:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1bdc:	e485      	b.n	14ea <_vfprintf_r+0xb0a>
    1bde:	f109 0301 	add.w	r3, r9, #1
    1be2:	9303      	str	r3, [sp, #12]
    1be4:	2102      	movs	r1, #2
    1be6:	9c03      	ldr	r4, [sp, #12]
    1be8:	9808      	ldr	r0, [sp, #32]
    1bea:	ab1f      	add	r3, sp, #124	@ 0x7c
    1bec:	9301      	str	r3, [sp, #4]
    1bee:	ab1c      	add	r3, sp, #112	@ 0x70
    1bf0:	9300      	str	r3, [sp, #0]
    1bf2:	4622      	mov	r2, r4
    1bf4:	ed9d 0b16 	vldr	d0, [sp, #88]	@ 0x58
    1bf8:	ab1b      	add	r3, sp, #108	@ 0x6c
    1bfa:	f000 fb07 	bl	220c <_dtoa_r>
    1bfe:	f1b8 0f66 	cmp.w	r8, #102	@ 0x66
    1c02:	4605      	mov	r5, r0
    1c04:	4404      	add	r4, r0
    1c06:	f47f ad69 	bne.w	16dc <_vfprintf_r+0xcfc>
    1c0a:	782b      	ldrb	r3, [r5, #0]
    1c0c:	2b30      	cmp	r3, #48	@ 0x30
    1c0e:	f000 808e 	beq.w	1d2e <_vfprintf_r+0x134e>
    1c12:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    1c14:	441c      	add	r4, r3
    1c16:	e561      	b.n	16dc <_vfprintf_r+0xcfc>
    1c18:	f8dd 9028 	ldr.w	r9, [sp, #40]	@ 0x28
    1c1c:	f89d 4067 	ldrb.w	r4, [sp, #103]	@ 0x67
    1c20:	f7ff b861 	b.w	ce6 <_vfprintf_r+0x306>
    1c24:	f101 4300 	add.w	r3, r1, #2147483648	@ 0x80000000
    1c28:	9317      	str	r3, [sp, #92]	@ 0x5c
    1c2a:	232d      	movs	r3, #45	@ 0x2d
    1c2c:	9016      	str	r0, [sp, #88]	@ 0x58
    1c2e:	930a      	str	r3, [sp, #40]	@ 0x28
    1c30:	e538      	b.n	16a4 <_vfprintf_r+0xcc4>
    1c32:	bf00      	nop
    1c34:	cccccccd 	.word	0xcccccccd
    1c38:	00007488 	.word	0x00007488
    1c3c:	0000756c 	.word	0x0000756c
    1c40:	9904      	ldr	r1, [sp, #16]
    1c42:	9808      	ldr	r0, [sp, #32]
    1c44:	aa21      	add	r2, sp, #132	@ 0x84
    1c46:	f001 fec7 	bl	39d8 <__sprint_r>
    1c4a:	2800      	cmp	r0, #0
    1c4c:	f47f a878 	bne.w	d40 <_vfprintf_r+0x360>
    1c50:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    1c52:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1c54:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1c58:	e450      	b.n	14fc <_vfprintf_r+0xb1c>
    1c5a:	f1b8 0f66 	cmp.w	r8, #102	@ 0x66
    1c5e:	f47f ad2b 	bne.w	16b8 <_vfprintf_r+0xcd8>
    1c62:	f8cd 900c 	str.w	r9, [sp, #12]
    1c66:	2103      	movs	r1, #3
    1c68:	e7bd      	b.n	1be6 <_vfprintf_r+0x1206>
    1c6a:	9904      	ldr	r1, [sp, #16]
    1c6c:	9808      	ldr	r0, [sp, #32]
    1c6e:	aa21      	add	r2, sp, #132	@ 0x84
    1c70:	f001 feb2 	bl	39d8 <__sprint_r>
    1c74:	2800      	cmp	r0, #0
    1c76:	f47f a863 	bne.w	d40 <_vfprintf_r+0x360>
    1c7a:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1c7c:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1c80:	e42c      	b.n	14dc <_vfprintf_r+0xafc>
    1c82:	9904      	ldr	r1, [sp, #16]
    1c84:	9808      	ldr	r0, [sp, #32]
    1c86:	aa21      	add	r2, sp, #132	@ 0x84
    1c88:	f001 fea6 	bl	39d8 <__sprint_r>
    1c8c:	2800      	cmp	r0, #0
    1c8e:	f47f a857 	bne.w	d40 <_vfprintf_r+0x360>
    1c92:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    1c94:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    1c96:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
    1c98:	1ad3      	subs	r3, r2, r3
    1c9a:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1c9e:	e445      	b.n	152c <_vfprintf_r+0xb4c>
    1ca0:	f04f 0906 	mov.w	r9, #6
    1ca4:	e4f0      	b.n	1688 <_vfprintf_r+0xca8>
    1ca6:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    1caa:	9306      	str	r3, [sp, #24]
    1cac:	f7ff b84d 	b.w	d4a <_vfprintf_r+0x36a>
    1cb0:	9409      	str	r4, [sp, #36]	@ 0x24
    1cb2:	f8cd 900c 	str.w	r9, [sp, #12]
    1cb6:	f8cd 901c 	str.w	r9, [sp, #28]
    1cba:	f89d 4067 	ldrb.w	r4, [sp, #103]	@ 0x67
    1cbe:	9702      	str	r7, [sp, #8]
    1cc0:	4681      	mov	r9, r0
    1cc2:	900b      	str	r0, [sp, #44]	@ 0x2c
    1cc4:	f7ff b80f 	b.w	ce6 <_vfprintf_r+0x306>
    1cc8:	4693      	mov	fp, r2
    1cca:	f04f 0900 	mov.w	r9, #0
    1cce:	f7fe beee 	b.w	aae <_vfprintf_r+0xce>
    1cd2:	3301      	adds	r3, #1
    1cd4:	4432      	add	r2, r6
    1cd6:	2b07      	cmp	r3, #7
    1cd8:	e9cd 3222 	strd	r3, r2, [sp, #136]	@ 0x88
    1cdc:	f8ca 7000 	str.w	r7, [sl]
    1ce0:	f8ca 6004 	str.w	r6, [sl, #4]
    1ce4:	f77f ae96 	ble.w	1a14 <_vfprintf_r+0x1034>
    1ce8:	9904      	ldr	r1, [sp, #16]
    1cea:	9808      	ldr	r0, [sp, #32]
    1cec:	aa21      	add	r2, sp, #132	@ 0x84
    1cee:	f001 fe73 	bl	39d8 <__sprint_r>
    1cf2:	2800      	cmp	r0, #0
    1cf4:	f47f a824 	bne.w	d40 <_vfprintf_r+0x360>
    1cf8:	e9dd 3222 	ldrd	r3, r2, [sp, #136]	@ 0x88
    1cfc:	f10d 0ab8 	add.w	sl, sp, #184	@ 0xb8
    1d00:	e68a      	b.n	1a18 <_vfprintf_r+0x1038>
    1d02:	f017 0201 	ands.w	r2, r7, #1
    1d06:	920b      	str	r2, [sp, #44]	@ 0x2c
    1d08:	f47f ade1 	bne.w	18ce <_vfprintf_r+0xeee>
    1d0c:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1d10:	9303      	str	r3, [sp, #12]
    1d12:	e511      	b.n	1738 <_vfprintf_r+0xd58>
    1d14:	e9dd 320e 	ldrd	r3, r2, [sp, #56]	@ 0x38
    1d18:	4413      	add	r3, r2
    1d1a:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
    1d1c:	9307      	str	r3, [sp, #28]
    1d1e:	2a00      	cmp	r2, #0
    1d20:	dd2d      	ble.n	1d7e <_vfprintf_r+0x139e>
    1d22:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1d26:	9303      	str	r3, [sp, #12]
    1d28:	f04f 0867 	mov.w	r8, #103	@ 0x67
    1d2c:	e504      	b.n	1738 <_vfprintf_r+0xd58>
    1d2e:	e9dd 0116 	ldrd	r0, r1, [sp, #88]	@ 0x58
    1d32:	2200      	movs	r2, #0
    1d34:	2300      	movs	r3, #0
    1d36:	f005 faa3 	bl	7280 <__aeabi_dcmpeq>
    1d3a:	2800      	cmp	r0, #0
    1d3c:	d037      	beq.n	1dae <_vfprintf_r+0x13ce>
    1d3e:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    1d40:	930b      	str	r3, [sp, #44]	@ 0x2c
    1d42:	441c      	add	r4, r3
    1d44:	1b63      	subs	r3, r4, r5
    1d46:	930e      	str	r3, [sp, #56]	@ 0x38
    1d48:	e4e6      	b.n	1718 <_vfprintf_r+0xd38>
    1d4a:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
    1d4c:	4d2b      	ldr	r5, [pc, #172]	@ (1dfc <_vfprintf_r+0x141c>)
    1d4e:	2b00      	cmp	r3, #0
    1d50:	bfb8      	it	lt
    1d52:	242d      	movlt	r4, #45	@ 0x2d
    1d54:	f027 0380 	bic.w	r3, r7, #128	@ 0x80
    1d58:	9302      	str	r3, [sp, #8]
    1d5a:	bfa8      	it	ge
    1d5c:	f89d 4067 	ldrbge.w	r4, [sp, #103]	@ 0x67
    1d60:	4b27      	ldr	r3, [pc, #156]	@ (1e00 <_vfprintf_r+0x1420>)
    1d62:	bfb8      	it	lt
    1d64:	f88d 4067 	strblt.w	r4, [sp, #103]	@ 0x67
    1d68:	f7ff b8a2 	b.w	eb0 <_vfprintf_r+0x4d0>
    1d6c:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
    1d6e:	4413      	add	r3, r2
    1d70:	9307      	str	r3, [sp, #28]
    1d72:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1d76:	9303      	str	r3, [sp, #12]
    1d78:	f04f 0867 	mov.w	r8, #103	@ 0x67
    1d7c:	e4dc      	b.n	1738 <_vfprintf_r+0xd58>
    1d7e:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    1d80:	9a07      	ldr	r2, [sp, #28]
    1d82:	f1c3 0301 	rsb	r3, r3, #1
    1d86:	441a      	add	r2, r3
    1d88:	ea22 73e2 	bic.w	r3, r2, r2, asr #31
    1d8c:	9207      	str	r2, [sp, #28]
    1d8e:	9303      	str	r3, [sp, #12]
    1d90:	f04f 0867 	mov.w	r8, #103	@ 0x67
    1d94:	e4d0      	b.n	1738 <_vfprintf_r+0xd58>
    1d96:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    1d98:	eb09 0803 	add.w	r8, r9, r3
    1d9c:	eb08 0302 	add.w	r3, r8, r2
    1da0:	9307      	str	r3, [sp, #28]
    1da2:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1da6:	9303      	str	r3, [sp, #12]
    1da8:	f04f 0866 	mov.w	r8, #102	@ 0x66
    1dac:	e4c4      	b.n	1738 <_vfprintf_r+0xd58>
    1dae:	9b03      	ldr	r3, [sp, #12]
    1db0:	f1c3 0301 	rsb	r3, r3, #1
    1db4:	931b      	str	r3, [sp, #108]	@ 0x6c
    1db6:	441c      	add	r4, r3
    1db8:	e490      	b.n	16dc <_vfprintf_r+0xcfc>
    1dba:	9909      	ldr	r1, [sp, #36]	@ 0x24
    1dbc:	f89b 3001 	ldrb.w	r3, [fp, #1]
    1dc0:	f851 9b04 	ldr.w	r9, [r1], #4
    1dc4:	9109      	str	r1, [sp, #36]	@ 0x24
    1dc6:	4693      	mov	fp, r2
    1dc8:	ea49 79e9 	orr.w	r9, r9, r9, asr #31
    1dcc:	f7fe be6c 	b.w	aa8 <_vfprintf_r+0xc8>
    1dd0:	2302      	movs	r3, #2
    1dd2:	9312      	str	r3, [sp, #72]	@ 0x48
    1dd4:	e574      	b.n	18c0 <_vfprintf_r+0xee0>
    1dd6:	b92b      	cbnz	r3, 1de4 <_vfprintf_r+0x1404>
    1dd8:	2301      	movs	r3, #1
    1dda:	9303      	str	r3, [sp, #12]
    1ddc:	f04f 0866 	mov.w	r8, #102	@ 0x66
    1de0:	9307      	str	r3, [sp, #28]
    1de2:	e4a9      	b.n	1738 <_vfprintf_r+0xd58>
    1de4:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
    1de6:	f103 0801 	add.w	r8, r3, #1
    1dea:	eb08 0309 	add.w	r3, r8, r9
    1dee:	9307      	str	r3, [sp, #28]
    1df0:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    1df4:	9303      	str	r3, [sp, #12]
    1df6:	f04f 0866 	mov.w	r8, #102	@ 0x66
    1dfa:	e49d      	b.n	1738 <_vfprintf_r+0xd58>
    1dfc:	00007454 	.word	0x00007454
    1e00:	00007450 	.word	0x00007450

00001e04 <vfprintf>:
    1e04:	b410      	push	{r4}
    1e06:	4c05      	ldr	r4, [pc, #20]	@ (1e1c <vfprintf+0x18>)
    1e08:	4684      	mov	ip, r0
    1e0a:	4613      	mov	r3, r2
    1e0c:	6820      	ldr	r0, [r4, #0]
    1e0e:	f85d 4b04 	ldr.w	r4, [sp], #4
    1e12:	460a      	mov	r2, r1
    1e14:	4661      	mov	r1, ip
    1e16:	f7fe bde3 	b.w	9e0 <_vfprintf_r>
    1e1a:	bf00      	nop
    1e1c:	000078b8 	.word	0x000078b8

00001e20 <__sbprintf>:
    1e20:	b570      	push	{r4, r5, r6, lr}
    1e22:	460c      	mov	r4, r1
    1e24:	8989      	ldrh	r1, [r1, #12]
    1e26:	f5ad 6d8d 	sub.w	sp, sp, #1128	@ 0x468
    1e2a:	f021 0102 	bic.w	r1, r1, #2
    1e2e:	f8ad 100c 	strh.w	r1, [sp, #12]
    1e32:	a91a      	add	r1, sp, #104	@ 0x68
    1e34:	9100      	str	r1, [sp, #0]
    1e36:	9104      	str	r1, [sp, #16]
    1e38:	f44f 6180 	mov.w	r1, #1024	@ 0x400
    1e3c:	9102      	str	r1, [sp, #8]
    1e3e:	9105      	str	r1, [sp, #20]
    1e40:	6e61      	ldr	r1, [r4, #100]	@ 0x64
    1e42:	9119      	str	r1, [sp, #100]	@ 0x64
    1e44:	89e1      	ldrh	r1, [r4, #14]
    1e46:	f8ad 100e 	strh.w	r1, [sp, #14]
    1e4a:	69e1      	ldr	r1, [r4, #28]
    1e4c:	9107      	str	r1, [sp, #28]
    1e4e:	6a61      	ldr	r1, [r4, #36]	@ 0x24
    1e50:	9109      	str	r1, [sp, #36]	@ 0x24
    1e52:	2100      	movs	r1, #0
    1e54:	9106      	str	r1, [sp, #24]
    1e56:	4669      	mov	r1, sp
    1e58:	4606      	mov	r6, r0
    1e5a:	f7fe fdc1 	bl	9e0 <_vfprintf_r>
    1e5e:	1e05      	subs	r5, r0, #0
    1e60:	db07      	blt.n	1e72 <__sbprintf+0x52>
    1e62:	4669      	mov	r1, sp
    1e64:	4630      	mov	r0, r6
    1e66:	f000 f8ff 	bl	2068 <_fflush_r>
    1e6a:	2800      	cmp	r0, #0
    1e6c:	bf18      	it	ne
    1e6e:	f04f 35ff 	movne.w	r5, #4294967295	@ 0xffffffff
    1e72:	f8bd 300c 	ldrh.w	r3, [sp, #12]
    1e76:	065b      	lsls	r3, r3, #25
    1e78:	d503      	bpl.n	1e82 <__sbprintf+0x62>
    1e7a:	89a3      	ldrh	r3, [r4, #12]
    1e7c:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    1e80:	81a3      	strh	r3, [r4, #12]
    1e82:	4628      	mov	r0, r5
    1e84:	f50d 6d8d 	add.w	sp, sp, #1128	@ 0x468
    1e88:	bd70      	pop	{r4, r5, r6, pc}
    1e8a:	bf00      	nop
    1e8c:	0000      	movs	r0, r0
	...

00001e90 <memchr>:
    1e90:	f001 01ff 	and.w	r1, r1, #255	@ 0xff
    1e94:	2a10      	cmp	r2, #16
    1e96:	db2b      	blt.n	1ef0 <memchr+0x60>
    1e98:	f010 0f07 	tst.w	r0, #7
    1e9c:	d008      	beq.n	1eb0 <memchr+0x20>
    1e9e:	f810 3b01 	ldrb.w	r3, [r0], #1
    1ea2:	3a01      	subs	r2, #1
    1ea4:	428b      	cmp	r3, r1
    1ea6:	d02d      	beq.n	1f04 <memchr+0x74>
    1ea8:	f010 0f07 	tst.w	r0, #7
    1eac:	b342      	cbz	r2, 1f00 <memchr+0x70>
    1eae:	d1f6      	bne.n	1e9e <memchr+0xe>
    1eb0:	b4f0      	push	{r4, r5, r6, r7}
    1eb2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
    1eb6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
    1eba:	f022 0407 	bic.w	r4, r2, #7
    1ebe:	f07f 0700 	mvns.w	r7, #0
    1ec2:	2300      	movs	r3, #0
    1ec4:	e8f0 5602 	ldrd	r5, r6, [r0], #8
    1ec8:	3c08      	subs	r4, #8
    1eca:	ea85 0501 	eor.w	r5, r5, r1
    1ece:	ea86 0601 	eor.w	r6, r6, r1
    1ed2:	fa85 f547 	uadd8	r5, r5, r7
    1ed6:	faa3 f587 	sel	r5, r3, r7
    1eda:	fa86 f647 	uadd8	r6, r6, r7
    1ede:	faa5 f687 	sel	r6, r5, r7
    1ee2:	b98e      	cbnz	r6, 1f08 <memchr+0x78>
    1ee4:	d1ee      	bne.n	1ec4 <memchr+0x34>
    1ee6:	bcf0      	pop	{r4, r5, r6, r7}
    1ee8:	f001 01ff 	and.w	r1, r1, #255	@ 0xff
    1eec:	f002 0207 	and.w	r2, r2, #7
    1ef0:	b132      	cbz	r2, 1f00 <memchr+0x70>
    1ef2:	f810 3b01 	ldrb.w	r3, [r0], #1
    1ef6:	3a01      	subs	r2, #1
    1ef8:	ea83 0301 	eor.w	r3, r3, r1
    1efc:	b113      	cbz	r3, 1f04 <memchr+0x74>
    1efe:	d1f8      	bne.n	1ef2 <memchr+0x62>
    1f00:	2000      	movs	r0, #0
    1f02:	4770      	bx	lr
    1f04:	3801      	subs	r0, #1
    1f06:	4770      	bx	lr
    1f08:	2d00      	cmp	r5, #0
    1f0a:	bf06      	itte	eq
    1f0c:	4635      	moveq	r5, r6
    1f0e:	3803      	subeq	r0, #3
    1f10:	3807      	subne	r0, #7
    1f12:	f015 0f01 	tst.w	r5, #1
    1f16:	d107      	bne.n	1f28 <memchr+0x98>
    1f18:	3001      	adds	r0, #1
    1f1a:	f415 7f80 	tst.w	r5, #256	@ 0x100
    1f1e:	bf02      	ittt	eq
    1f20:	3001      	addeq	r0, #1
    1f22:	f415 3fc0 	tsteq.w	r5, #98304	@ 0x18000
    1f26:	3001      	addeq	r0, #1
    1f28:	bcf0      	pop	{r4, r5, r6, r7}
    1f2a:	3801      	subs	r0, #1
    1f2c:	4770      	bx	lr
    1f2e:	bf00      	nop

00001f30 <__sflush_r>:
    1f30:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    1f34:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1f38:	0716      	lsls	r6, r2, #28
    1f3a:	460c      	mov	r4, r1
    1f3c:	4680      	mov	r8, r0
    1f3e:	d44e      	bmi.n	1fde <__sflush_r+0xae>
    1f40:	6849      	ldr	r1, [r1, #4]
    1f42:	f442 6300 	orr.w	r3, r2, #2048	@ 0x800
    1f46:	2900      	cmp	r1, #0
    1f48:	81a3      	strh	r3, [r4, #12]
    1f4a:	dd63      	ble.n	2014 <__sflush_r+0xe4>
    1f4c:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    1f4e:	2d00      	cmp	r5, #0
    1f50:	d042      	beq.n	1fd8 <__sflush_r+0xa8>
    1f52:	2100      	movs	r1, #0
    1f54:	f412 5280 	ands.w	r2, r2, #4096	@ 0x1000
    1f58:	f8d8 6000 	ldr.w	r6, [r8]
    1f5c:	f8c8 1000 	str.w	r1, [r8]
    1f60:	69e1      	ldr	r1, [r4, #28]
    1f62:	d164      	bne.n	202e <__sflush_r+0xfe>
    1f64:	2301      	movs	r3, #1
    1f66:	4640      	mov	r0, r8
    1f68:	47a8      	blx	r5
    1f6a:	1c45      	adds	r5, r0, #1
    1f6c:	4602      	mov	r2, r0
    1f6e:	d06e      	beq.n	204e <__sflush_r+0x11e>
    1f70:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    1f74:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    1f76:	69e1      	ldr	r1, [r4, #28]
    1f78:	0758      	lsls	r0, r3, #29
    1f7a:	d505      	bpl.n	1f88 <__sflush_r+0x58>
    1f7c:	6863      	ldr	r3, [r4, #4]
    1f7e:	1ad2      	subs	r2, r2, r3
    1f80:	6b23      	ldr	r3, [r4, #48]	@ 0x30
    1f82:	b10b      	cbz	r3, 1f88 <__sflush_r+0x58>
    1f84:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
    1f86:	1ad2      	subs	r2, r2, r3
    1f88:	2300      	movs	r3, #0
    1f8a:	4640      	mov	r0, r8
    1f8c:	47a8      	blx	r5
    1f8e:	1c43      	adds	r3, r0, #1
    1f90:	d14f      	bne.n	2032 <__sflush_r+0x102>
    1f92:	f8d8 1000 	ldr.w	r1, [r8]
    1f96:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    1f9a:	291d      	cmp	r1, #29
    1f9c:	d840      	bhi.n	2020 <__sflush_r+0xf0>
    1f9e:	4a31      	ldr	r2, [pc, #196]	@ (2064 <__sflush_r+0x134>)
    1fa0:	40ca      	lsrs	r2, r1
    1fa2:	07d7      	lsls	r7, r2, #31
    1fa4:	d53c      	bpl.n	2020 <__sflush_r+0xf0>
    1fa6:	6922      	ldr	r2, [r4, #16]
    1fa8:	6022      	str	r2, [r4, #0]
    1faa:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    1fae:	81a2      	strh	r2, [r4, #12]
    1fb0:	04dd      	lsls	r5, r3, #19
    1fb2:	f04f 0200 	mov.w	r2, #0
    1fb6:	6062      	str	r2, [r4, #4]
    1fb8:	d501      	bpl.n	1fbe <__sflush_r+0x8e>
    1fba:	2900      	cmp	r1, #0
    1fbc:	d045      	beq.n	204a <__sflush_r+0x11a>
    1fbe:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    1fc0:	f8c8 6000 	str.w	r6, [r8]
    1fc4:	b141      	cbz	r1, 1fd8 <__sflush_r+0xa8>
    1fc6:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    1fca:	4299      	cmp	r1, r3
    1fcc:	d002      	beq.n	1fd4 <__sflush_r+0xa4>
    1fce:	4640      	mov	r0, r8
    1fd0:	f001 f91c 	bl	320c <_free_r>
    1fd4:	2300      	movs	r3, #0
    1fd6:	6323      	str	r3, [r4, #48]	@ 0x30
    1fd8:	2000      	movs	r0, #0
    1fda:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1fde:	690e      	ldr	r6, [r1, #16]
    1fe0:	2e00      	cmp	r6, #0
    1fe2:	d0f9      	beq.n	1fd8 <__sflush_r+0xa8>
    1fe4:	680d      	ldr	r5, [r1, #0]
    1fe6:	600e      	str	r6, [r1, #0]
    1fe8:	0792      	lsls	r2, r2, #30
    1fea:	bf0c      	ite	eq
    1fec:	694b      	ldreq	r3, [r1, #20]
    1fee:	2300      	movne	r3, #0
    1ff0:	1bad      	subs	r5, r5, r6
    1ff2:	608b      	str	r3, [r1, #8]
    1ff4:	e00b      	b.n	200e <__sflush_r+0xde>
    1ff6:	462b      	mov	r3, r5
    1ff8:	4632      	mov	r2, r6
    1ffa:	69e1      	ldr	r1, [r4, #28]
    1ffc:	6a67      	ldr	r7, [r4, #36]	@ 0x24
    1ffe:	4640      	mov	r0, r8
    2000:	47b8      	blx	r7
    2002:	f1b0 0c00 	subs.w	ip, r0, #0
    2006:	eba5 050c 	sub.w	r5, r5, ip
    200a:	4466      	add	r6, ip
    200c:	dd06      	ble.n	201c <__sflush_r+0xec>
    200e:	2d00      	cmp	r5, #0
    2010:	dcf1      	bgt.n	1ff6 <__sflush_r+0xc6>
    2012:	e7e1      	b.n	1fd8 <__sflush_r+0xa8>
    2014:	6be1      	ldr	r1, [r4, #60]	@ 0x3c
    2016:	2900      	cmp	r1, #0
    2018:	dc98      	bgt.n	1f4c <__sflush_r+0x1c>
    201a:	e7dd      	b.n	1fd8 <__sflush_r+0xa8>
    201c:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2020:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    2024:	81a3      	strh	r3, [r4, #12]
    2026:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    202a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    202e:	6d22      	ldr	r2, [r4, #80]	@ 0x50
    2030:	e7a2      	b.n	1f78 <__sflush_r+0x48>
    2032:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2036:	6922      	ldr	r2, [r4, #16]
    2038:	6022      	str	r2, [r4, #0]
    203a:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    203e:	81a2      	strh	r2, [r4, #12]
    2040:	04db      	lsls	r3, r3, #19
    2042:	f04f 0200 	mov.w	r2, #0
    2046:	6062      	str	r2, [r4, #4]
    2048:	d5b9      	bpl.n	1fbe <__sflush_r+0x8e>
    204a:	6520      	str	r0, [r4, #80]	@ 0x50
    204c:	e7b7      	b.n	1fbe <__sflush_r+0x8e>
    204e:	f8d8 3000 	ldr.w	r3, [r8]
    2052:	2b00      	cmp	r3, #0
    2054:	d08c      	beq.n	1f70 <__sflush_r+0x40>
    2056:	2b1d      	cmp	r3, #29
    2058:	d001      	beq.n	205e <__sflush_r+0x12e>
    205a:	2b16      	cmp	r3, #22
    205c:	d1de      	bne.n	201c <__sflush_r+0xec>
    205e:	f8c8 6000 	str.w	r6, [r8]
    2062:	e7b9      	b.n	1fd8 <__sflush_r+0xa8>
    2064:	20400001 	.word	0x20400001

00002068 <_fflush_r>:
    2068:	b510      	push	{r4, lr}
    206a:	4604      	mov	r4, r0
    206c:	b082      	sub	sp, #8
    206e:	b108      	cbz	r0, 2074 <_fflush_r+0xc>
    2070:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    2072:	b153      	cbz	r3, 208a <_fflush_r+0x22>
    2074:	f9b1 000c 	ldrsh.w	r0, [r1, #12]
    2078:	b908      	cbnz	r0, 207e <_fflush_r+0x16>
    207a:	b002      	add	sp, #8
    207c:	bd10      	pop	{r4, pc}
    207e:	4620      	mov	r0, r4
    2080:	b002      	add	sp, #8
    2082:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    2086:	f7ff bf53 	b.w	1f30 <__sflush_r>
    208a:	9101      	str	r1, [sp, #4]
    208c:	f001 fbe4 	bl	3858 <__sinit>
    2090:	9901      	ldr	r1, [sp, #4]
    2092:	e7ef      	b.n	2074 <_fflush_r+0xc>

00002094 <fflush>:
    2094:	b1a0      	cbz	r0, 20c0 <fflush+0x2c>
    2096:	b538      	push	{r3, r4, r5, lr}
    2098:	4b0c      	ldr	r3, [pc, #48]	@ (20cc <fflush+0x38>)
    209a:	681d      	ldr	r5, [r3, #0]
    209c:	4604      	mov	r4, r0
    209e:	b10d      	cbz	r5, 20a4 <fflush+0x10>
    20a0:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
    20a2:	b14b      	cbz	r3, 20b8 <fflush+0x24>
    20a4:	f9b4 000c 	ldrsh.w	r0, [r4, #12]
    20a8:	b900      	cbnz	r0, 20ac <fflush+0x18>
    20aa:	bd38      	pop	{r3, r4, r5, pc}
    20ac:	4621      	mov	r1, r4
    20ae:	4628      	mov	r0, r5
    20b0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    20b4:	f7ff bf3c 	b.w	1f30 <__sflush_r>
    20b8:	4628      	mov	r0, r5
    20ba:	f001 fbcd 	bl	3858 <__sinit>
    20be:	e7f1      	b.n	20a4 <fflush+0x10>
    20c0:	4a03      	ldr	r2, [pc, #12]	@ (20d0 <fflush+0x3c>)
    20c2:	4904      	ldr	r1, [pc, #16]	@ (20d4 <fflush+0x40>)
    20c4:	4804      	ldr	r0, [pc, #16]	@ (20d8 <fflush+0x44>)
    20c6:	f002 ba19 	b.w	44fc <_fwalk_sglue>
    20ca:	bf00      	nop
    20cc:	000078b8 	.word	0x000078b8
    20d0:	000079e0 	.word	0x000079e0
    20d4:	00002069 	.word	0x00002069
    20d8:	000078c0 	.word	0x000078c0
    20dc:	00000000 	.word	0x00000000

000020e0 <quorem>:
    20e0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    20e4:	6903      	ldr	r3, [r0, #16]
    20e6:	690c      	ldr	r4, [r1, #16]
    20e8:	42a3      	cmp	r3, r4
    20ea:	b083      	sub	sp, #12
    20ec:	f2c0 808a 	blt.w	2204 <quorem+0x124>
    20f0:	3c01      	subs	r4, #1
    20f2:	f101 0514 	add.w	r5, r1, #20
    20f6:	f100 0814 	add.w	r8, r0, #20
    20fa:	f855 3024 	ldr.w	r3, [r5, r4, lsl #2]
    20fe:	f858 2024 	ldr.w	r2, [r8, r4, lsl #2]
    2102:	3301      	adds	r3, #1
    2104:	429a      	cmp	r2, r3
    2106:	468e      	mov	lr, r1
    2108:	4681      	mov	r9, r0
    210a:	ea4f 0184 	mov.w	r1, r4, lsl #2
    210e:	eb05 0784 	add.w	r7, r5, r4, lsl #2
    2112:	eb08 0a84 	add.w	sl, r8, r4, lsl #2
    2116:	fbb2 f6f3 	udiv	r6, r2, r3
    211a:	d33a      	bcc.n	2192 <quorem+0xb2>
    211c:	e9cd 1500 	strd	r1, r5, [sp]
    2120:	2200      	movs	r2, #0
    2122:	46ac      	mov	ip, r5
    2124:	4640      	mov	r0, r8
    2126:	4613      	mov	r3, r2
    2128:	f85c 1b04 	ldr.w	r1, [ip], #4
    212c:	6805      	ldr	r5, [r0, #0]
    212e:	fa1f fb81 	uxth.w	fp, r1
    2132:	fb06 220b 	mla	r2, r6, fp, r2
    2136:	0c09      	lsrs	r1, r1, #16
    2138:	ea4f 4b12 	mov.w	fp, r2, lsr #16
    213c:	fb06 bb01 	mla	fp, r6, r1, fp
    2140:	b292      	uxth	r2, r2
    2142:	b2a9      	uxth	r1, r5
    2144:	1a89      	subs	r1, r1, r2
    2146:	4419      	add	r1, r3
    2148:	fa1f f38b 	uxth.w	r3, fp
    214c:	ebc3 4321 	rsb	r3, r3, r1, asr #16
    2150:	eb03 4315 	add.w	r3, r3, r5, lsr #16
    2154:	b289      	uxth	r1, r1
    2156:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
    215a:	4567      	cmp	r7, ip
    215c:	f840 1b04 	str.w	r1, [r0], #4
    2160:	ea4f 421b 	mov.w	r2, fp, lsr #16
    2164:	ea4f 4323 	mov.w	r3, r3, asr #16
    2168:	d2de      	bcs.n	2128 <quorem+0x48>
    216a:	e9dd 1500 	ldrd	r1, r5, [sp]
    216e:	f858 3001 	ldr.w	r3, [r8, r1]
    2172:	b973      	cbnz	r3, 2192 <quorem+0xb2>
    2174:	f1aa 0a04 	sub.w	sl, sl, #4
    2178:	45d0      	cmp	r8, sl
    217a:	d304      	bcc.n	2186 <quorem+0xa6>
    217c:	e007      	b.n	218e <quorem+0xae>
    217e:	45d0      	cmp	r8, sl
    2180:	f104 34ff 	add.w	r4, r4, #4294967295	@ 0xffffffff
    2184:	d203      	bcs.n	218e <quorem+0xae>
    2186:	f85a 3904 	ldr.w	r3, [sl], #-4
    218a:	2b00      	cmp	r3, #0
    218c:	d0f7      	beq.n	217e <quorem+0x9e>
    218e:	f8c9 4010 	str.w	r4, [r9, #16]
    2192:	4671      	mov	r1, lr
    2194:	4648      	mov	r0, r9
    2196:	f001 ff37 	bl	4008 <__mcmp>
    219a:	2800      	cmp	r0, #0
    219c:	db2e      	blt.n	21fc <quorem+0x11c>
    219e:	4641      	mov	r1, r8
    21a0:	2200      	movs	r2, #0
    21a2:	f855 0b04 	ldr.w	r0, [r5], #4
    21a6:	f8d1 c000 	ldr.w	ip, [r1]
    21aa:	fa1f fe80 	uxth.w	lr, r0
    21ae:	fa1f f38c 	uxth.w	r3, ip
    21b2:	eba3 030e 	sub.w	r3, r3, lr
    21b6:	4413      	add	r3, r2
    21b8:	0c02      	lsrs	r2, r0, #16
    21ba:	ebc2 4223 	rsb	r2, r2, r3, asr #16
    21be:	eb02 421c 	add.w	r2, r2, ip, lsr #16
    21c2:	b29b      	uxth	r3, r3
    21c4:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    21c8:	42af      	cmp	r7, r5
    21ca:	f841 3b04 	str.w	r3, [r1], #4
    21ce:	ea4f 4222 	mov.w	r2, r2, asr #16
    21d2:	d2e6      	bcs.n	21a2 <quorem+0xc2>
    21d4:	f858 2024 	ldr.w	r2, [r8, r4, lsl #2]
    21d8:	eb08 0384 	add.w	r3, r8, r4, lsl #2
    21dc:	b96a      	cbnz	r2, 21fa <quorem+0x11a>
    21de:	3b04      	subs	r3, #4
    21e0:	4543      	cmp	r3, r8
    21e2:	d804      	bhi.n	21ee <quorem+0x10e>
    21e4:	e007      	b.n	21f6 <quorem+0x116>
    21e6:	4598      	cmp	r8, r3
    21e8:	f104 34ff 	add.w	r4, r4, #4294967295	@ 0xffffffff
    21ec:	d203      	bcs.n	21f6 <quorem+0x116>
    21ee:	f853 2904 	ldr.w	r2, [r3], #-4
    21f2:	2a00      	cmp	r2, #0
    21f4:	d0f7      	beq.n	21e6 <quorem+0x106>
    21f6:	f8c9 4010 	str.w	r4, [r9, #16]
    21fa:	3601      	adds	r6, #1
    21fc:	4630      	mov	r0, r6
    21fe:	b003      	add	sp, #12
    2200:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2204:	2000      	movs	r0, #0
    2206:	b003      	add	sp, #12
    2208:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000220c <_dtoa_r>:
    220c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2210:	b09d      	sub	sp, #116	@ 0x74
    2212:	e9cd 320a 	strd	r3, r2, [sp, #40]	@ 0x28
    2216:	9102      	str	r1, [sp, #8]
    2218:	6b81      	ldr	r1, [r0, #56]	@ 0x38
    221a:	9d26      	ldr	r5, [sp, #152]	@ 0x98
    221c:	9004      	str	r0, [sp, #16]
    221e:	ed8d 0b06 	vstr	d0, [sp, #24]
    2222:	ec57 6b10 	vmov	r6, r7, d0
    2226:	b149      	cbz	r1, 223c <_dtoa_r+0x30>
    2228:	6bc2      	ldr	r2, [r0, #60]	@ 0x3c
    222a:	604a      	str	r2, [r1, #4]
    222c:	2301      	movs	r3, #1
    222e:	4093      	lsls	r3, r2
    2230:	4604      	mov	r4, r0
    2232:	608b      	str	r3, [r1, #8]
    2234:	f001 fc2c 	bl	3a90 <_Bfree>
    2238:	2300      	movs	r3, #0
    223a:	63a3      	str	r3, [r4, #56]	@ 0x38
    223c:	f1b7 0900 	subs.w	r9, r7, #0
    2240:	bfb4      	ite	lt
    2242:	2301      	movlt	r3, #1
    2244:	2300      	movge	r3, #0
    2246:	602b      	str	r3, [r5, #0]
    2248:	4b77      	ldr	r3, [pc, #476]	@ (2428 <_dtoa_r+0x21c>)
    224a:	bfbc      	itt	lt
    224c:	f029 4900 	biclt.w	r9, r9, #2147483648	@ 0x80000000
    2250:	f8cd 901c 	strlt.w	r9, [sp, #28]
    2254:	ea33 0309 	bics.w	r3, r3, r9
    2258:	f000 80aa 	beq.w	23b0 <_dtoa_r+0x1a4>
    225c:	ed9d 7b06 	vldr	d7, [sp, #24]
    2260:	2200      	movs	r2, #0
    2262:	ec51 0b17 	vmov	r0, r1, d7
    2266:	2300      	movs	r3, #0
    2268:	ed8d 7b00 	vstr	d7, [sp]
    226c:	f005 f808 	bl	7280 <__aeabi_dcmpeq>
    2270:	4680      	mov	r8, r0
    2272:	b168      	cbz	r0, 2290 <_dtoa_r+0x84>
    2274:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
    2276:	2301      	movs	r3, #1
    2278:	6013      	str	r3, [r2, #0]
    227a:	9b27      	ldr	r3, [sp, #156]	@ 0x9c
    227c:	b113      	cbz	r3, 2284 <_dtoa_r+0x78>
    227e:	9a27      	ldr	r2, [sp, #156]	@ 0x9c
    2280:	4b6a      	ldr	r3, [pc, #424]	@ (242c <_dtoa_r+0x220>)
    2282:	6013      	str	r3, [r2, #0]
    2284:	4b6a      	ldr	r3, [pc, #424]	@ (2430 <_dtoa_r+0x224>)
    2286:	9305      	str	r3, [sp, #20]
    2288:	9805      	ldr	r0, [sp, #20]
    228a:	b01d      	add	sp, #116	@ 0x74
    228c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2290:	ed9d 0b00 	vldr	d0, [sp]
    2294:	9804      	ldr	r0, [sp, #16]
    2296:	aa1a      	add	r2, sp, #104	@ 0x68
    2298:	a91b      	add	r1, sp, #108	@ 0x6c
    229a:	f002 f823 	bl	42e4 <__d2b>
    229e:	ea5f 5519 	movs.w	r5, r9, lsr #20
    22a2:	4682      	mov	sl, r0
    22a4:	f040 809a 	bne.w	23dc <_dtoa_r+0x1d0>
    22a8:	e9dd 851a 	ldrd	r8, r5, [sp, #104]	@ 0x68
    22ac:	4445      	add	r5, r8
    22ae:	f205 4332 	addw	r3, r5, #1074	@ 0x432
    22b2:	2b20      	cmp	r3, #32
    22b4:	f340 838c 	ble.w	29d0 <_dtoa_r+0x7c4>
    22b8:	f1c3 0340 	rsb	r3, r3, #64	@ 0x40
    22bc:	fa09 f903 	lsl.w	r9, r9, r3
    22c0:	f205 4312 	addw	r3, r5, #1042	@ 0x412
    22c4:	fa26 f303 	lsr.w	r3, r6, r3
    22c8:	ea49 0003 	orr.w	r0, r9, r3
    22cc:	f004 fcf6 	bl	6cbc <__aeabi_ui2d>
    22d0:	2301      	movs	r3, #1
    22d2:	3d01      	subs	r5, #1
    22d4:	f1a1 71f8 	sub.w	r1, r1, #32505856	@ 0x1f00000
    22d8:	9312      	str	r3, [sp, #72]	@ 0x48
    22da:	4b56      	ldr	r3, [pc, #344]	@ (2434 <_dtoa_r+0x228>)
    22dc:	2200      	movs	r2, #0
    22de:	f004 fbaf 	bl	6a40 <__aeabi_dsub>
    22e2:	a34b      	add	r3, pc, #300	@ (adr r3, 2410 <_dtoa_r+0x204>)
    22e4:	e9d3 2300 	ldrd	r2, r3, [r3]
    22e8:	f004 fd62 	bl	6db0 <__aeabi_dmul>
    22ec:	a34a      	add	r3, pc, #296	@ (adr r3, 2418 <_dtoa_r+0x20c>)
    22ee:	e9d3 2300 	ldrd	r2, r3, [r3]
    22f2:	f004 fba7 	bl	6a44 <__adddf3>
    22f6:	4606      	mov	r6, r0
    22f8:	4628      	mov	r0, r5
    22fa:	460f      	mov	r7, r1
    22fc:	f004 fcee 	bl	6cdc <__aeabi_i2d>
    2300:	a347      	add	r3, pc, #284	@ (adr r3, 2420 <_dtoa_r+0x214>)
    2302:	e9d3 2300 	ldrd	r2, r3, [r3]
    2306:	f004 fd53 	bl	6db0 <__aeabi_dmul>
    230a:	4602      	mov	r2, r0
    230c:	460b      	mov	r3, r1
    230e:	4630      	mov	r0, r6
    2310:	4639      	mov	r1, r7
    2312:	f004 fb97 	bl	6a44 <__adddf3>
    2316:	4606      	mov	r6, r0
    2318:	460f      	mov	r7, r1
    231a:	f004 fff9 	bl	7310 <__aeabi_d2iz>
    231e:	2200      	movs	r2, #0
    2320:	4604      	mov	r4, r0
    2322:	9009      	str	r0, [sp, #36]	@ 0x24
    2324:	2300      	movs	r3, #0
    2326:	4630      	mov	r0, r6
    2328:	4639      	mov	r1, r7
    232a:	f004 ffb3 	bl	7294 <__aeabi_dcmplt>
    232e:	2800      	cmp	r0, #0
    2330:	f040 8324 	bne.w	297c <_dtoa_r+0x770>
    2334:	9c09      	ldr	r4, [sp, #36]	@ 0x24
    2336:	eba8 0805 	sub.w	r8, r8, r5
    233a:	f108 33ff 	add.w	r3, r8, #4294967295	@ 0xffffffff
    233e:	2c16      	cmp	r4, #22
    2340:	9308      	str	r3, [sp, #32]
    2342:	f200 818c 	bhi.w	265e <_dtoa_r+0x452>
    2346:	4b3c      	ldr	r3, [pc, #240]	@ (2438 <_dtoa_r+0x22c>)
    2348:	eb03 03c4 	add.w	r3, r3, r4, lsl #3
    234c:	e9d3 2300 	ldrd	r2, r3, [r3]
    2350:	e9dd 0100 	ldrd	r0, r1, [sp]
    2354:	f004 ff9e 	bl	7294 <__aeabi_dcmplt>
    2358:	2800      	cmp	r0, #0
    235a:	d073      	beq.n	2444 <_dtoa_r+0x238>
    235c:	1e63      	subs	r3, r4, #1
    235e:	9309      	str	r3, [sp, #36]	@ 0x24
    2360:	2300      	movs	r3, #0
    2362:	9311      	str	r3, [sp, #68]	@ 0x44
    2364:	9b08      	ldr	r3, [sp, #32]
    2366:	2b00      	cmp	r3, #0
    2368:	f2c0 817f 	blt.w	266a <_dtoa_r+0x45e>
    236c:	2300      	movs	r3, #0
    236e:	930c      	str	r3, [sp, #48]	@ 0x30
    2370:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    2372:	2b00      	cmp	r3, #0
    2374:	da6c      	bge.n	2450 <_dtoa_r+0x244>
    2376:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    2378:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
    237a:	930d      	str	r3, [sp, #52]	@ 0x34
    237c:	1ad2      	subs	r2, r2, r3
    237e:	920c      	str	r2, [sp, #48]	@ 0x30
    2380:	425a      	negs	r2, r3
    2382:	2300      	movs	r3, #0
    2384:	9309      	str	r3, [sp, #36]	@ 0x24
    2386:	9b02      	ldr	r3, [sp, #8]
    2388:	9210      	str	r2, [sp, #64]	@ 0x40
    238a:	2b09      	cmp	r3, #9
    238c:	d86a      	bhi.n	2464 <_dtoa_r+0x258>
    238e:	2b05      	cmp	r3, #5
    2390:	f340 8323 	ble.w	29da <_dtoa_r+0x7ce>
    2394:	3b04      	subs	r3, #4
    2396:	9302      	str	r3, [sp, #8]
    2398:	2500      	movs	r5, #0
    239a:	9b02      	ldr	r3, [sp, #8]
    239c:	3b02      	subs	r3, #2
    239e:	2b03      	cmp	r3, #3
    23a0:	f200 8638 	bhi.w	3014 <_dtoa_r+0xe08>
    23a4:	e8df f013 	tbh	[pc, r3, lsl #1]
    23a8:	046d0470 	.word	0x046d0470
    23ac:	04490465 	.word	0x04490465
    23b0:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
    23b2:	f3c9 0913 	ubfx	r9, r9, #0, #20
    23b6:	f242 730f 	movw	r3, #9999	@ 0x270f
    23ba:	ea59 0906 	orrs.w	r9, r9, r6
    23be:	6013      	str	r3, [r2, #0]
    23c0:	d11c      	bne.n	23fc <_dtoa_r+0x1f0>
    23c2:	9b27      	ldr	r3, [sp, #156]	@ 0x9c
    23c4:	2b00      	cmp	r3, #0
    23c6:	f000 8645 	beq.w	3054 <_dtoa_r+0xe48>
    23ca:	4b1c      	ldr	r3, [pc, #112]	@ (243c <_dtoa_r+0x230>)
    23cc:	9305      	str	r3, [sp, #20]
    23ce:	3308      	adds	r3, #8
    23d0:	9a27      	ldr	r2, [sp, #156]	@ 0x9c
    23d2:	9805      	ldr	r0, [sp, #20]
    23d4:	6013      	str	r3, [r2, #0]
    23d6:	b01d      	add	sp, #116	@ 0x74
    23d8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    23dc:	e9dd 1200 	ldrd	r1, r2, [sp]
    23e0:	f3c2 0313 	ubfx	r3, r2, #0, #20
    23e4:	4608      	mov	r0, r1
    23e6:	f043 517f 	orr.w	r1, r3, #1069547520	@ 0x3fc00000
    23ea:	f8cd 8048 	str.w	r8, [sp, #72]	@ 0x48
    23ee:	f2a5 35ff 	subw	r5, r5, #1023	@ 0x3ff
    23f2:	f8dd 8068 	ldr.w	r8, [sp, #104]	@ 0x68
    23f6:	f441 1140 	orr.w	r1, r1, #3145728	@ 0x300000
    23fa:	e76e      	b.n	22da <_dtoa_r+0xce>
    23fc:	9b27      	ldr	r3, [sp, #156]	@ 0x9c
    23fe:	2b00      	cmp	r3, #0
    2400:	f040 83f6 	bne.w	2bf0 <_dtoa_r+0x9e4>
    2404:	4b0e      	ldr	r3, [pc, #56]	@ (2440 <_dtoa_r+0x234>)
    2406:	9305      	str	r3, [sp, #20]
    2408:	e73e      	b.n	2288 <_dtoa_r+0x7c>
    240a:	bf00      	nop
    240c:	f3af 8000 	nop.w
    2410:	636f4361 	.word	0x636f4361
    2414:	3fd287a7 	.word	0x3fd287a7
    2418:	8b60c8b3 	.word	0x8b60c8b3
    241c:	3fc68a28 	.word	0x3fc68a28
    2420:	509f79fb 	.word	0x509f79fb
    2424:	3fd34413 	.word	0x3fd34413
    2428:	7ff00000 	.word	0x7ff00000
    242c:	00007489 	.word	0x00007489
    2430:	00007488 	.word	0x00007488
    2434:	3ff80000 	.word	0x3ff80000
    2438:	00007590 	.word	0x00007590
    243c:	0000748c 	.word	0x0000748c
    2440:	00007498 	.word	0x00007498
    2444:	f1b8 0f00 	cmp.w	r8, #0
    2448:	f340 84a3 	ble.w	2d92 <_dtoa_r+0xb86>
    244c:	9011      	str	r0, [sp, #68]	@ 0x44
    244e:	900c      	str	r0, [sp, #48]	@ 0x30
    2450:	e9dd 3208 	ldrd	r3, r2, [sp, #32]
    2454:	4413      	add	r3, r2
    2456:	9308      	str	r3, [sp, #32]
    2458:	2300      	movs	r3, #0
    245a:	9310      	str	r3, [sp, #64]	@ 0x40
    245c:	9b02      	ldr	r3, [sp, #8]
    245e:	920d      	str	r2, [sp, #52]	@ 0x34
    2460:	2b09      	cmp	r3, #9
    2462:	d994      	bls.n	238e <_dtoa_r+0x182>
    2464:	2300      	movs	r3, #0
    2466:	2501      	movs	r5, #1
    2468:	9302      	str	r3, [sp, #8]
    246a:	950e      	str	r5, [sp, #56]	@ 0x38
    246c:	f04f 3bff 	mov.w	fp, #4294967295	@ 0xffffffff
    2470:	930b      	str	r3, [sp, #44]	@ 0x2c
    2472:	9b04      	ldr	r3, [sp, #16]
    2474:	f8cd b04c 	str.w	fp, [sp, #76]	@ 0x4c
    2478:	2100      	movs	r1, #0
    247a:	63d9      	str	r1, [r3, #60]	@ 0x3c
    247c:	9804      	ldr	r0, [sp, #16]
    247e:	f001 fae1 	bl	3a44 <_Balloc>
    2482:	9005      	str	r0, [sp, #20]
    2484:	2800      	cmp	r0, #0
    2486:	f000 85ce 	beq.w	3026 <_dtoa_r+0xe1a>
    248a:	e9dd 3204 	ldrd	r3, r2, [sp, #16]
    248e:	f1bb 0f0e 	cmp.w	fp, #14
    2492:	639a      	str	r2, [r3, #56]	@ 0x38
    2494:	f200 8118 	bhi.w	26c8 <_dtoa_r+0x4bc>
    2498:	2d00      	cmp	r5, #0
    249a:	f000 8115 	beq.w	26c8 <_dtoa_r+0x4bc>
    249e:	990d      	ldr	r1, [sp, #52]	@ 0x34
    24a0:	2900      	cmp	r1, #0
    24a2:	f340 8446 	ble.w	2d32 <_dtoa_r+0xb26>
    24a6:	4bb3      	ldr	r3, [pc, #716]	@ (2774 <_dtoa_r+0x568>)
    24a8:	f001 020f 	and.w	r2, r1, #15
    24ac:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    24b0:	05c8      	lsls	r0, r1, #23
    24b2:	e9d3 8900 	ldrd	r8, r9, [r3]
    24b6:	ea4f 1521 	mov.w	r5, r1, asr #4
    24ba:	f140 8408 	bpl.w	2cce <_dtoa_r+0xac2>
    24be:	4bae      	ldr	r3, [pc, #696]	@ (2778 <_dtoa_r+0x56c>)
    24c0:	e9dd 0100 	ldrd	r0, r1, [sp]
    24c4:	e9d3 2308 	ldrd	r2, r3, [r3, #32]
    24c8:	f004 fd9c 	bl	7004 <__aeabi_ddiv>
    24cc:	e9cd 0114 	strd	r0, r1, [sp, #80]	@ 0x50
    24d0:	f005 050f 	and.w	r5, r5, #15
    24d4:	2703      	movs	r7, #3
    24d6:	b17d      	cbz	r5, 24f8 <_dtoa_r+0x2ec>
    24d8:	4ea7      	ldr	r6, [pc, #668]	@ (2778 <_dtoa_r+0x56c>)
    24da:	07e9      	lsls	r1, r5, #31
    24dc:	d508      	bpl.n	24f0 <_dtoa_r+0x2e4>
    24de:	4640      	mov	r0, r8
    24e0:	4649      	mov	r1, r9
    24e2:	e9d6 2300 	ldrd	r2, r3, [r6]
    24e6:	f004 fc63 	bl	6db0 <__aeabi_dmul>
    24ea:	3701      	adds	r7, #1
    24ec:	4680      	mov	r8, r0
    24ee:	4689      	mov	r9, r1
    24f0:	106d      	asrs	r5, r5, #1
    24f2:	f106 0608 	add.w	r6, r6, #8
    24f6:	d1f0      	bne.n	24da <_dtoa_r+0x2ce>
    24f8:	4642      	mov	r2, r8
    24fa:	464b      	mov	r3, r9
    24fc:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
    2500:	f004 fd80 	bl	7004 <__aeabi_ddiv>
    2504:	4680      	mov	r8, r0
    2506:	4689      	mov	r9, r1
    2508:	9b11      	ldr	r3, [sp, #68]	@ 0x44
    250a:	b143      	cbz	r3, 251e <_dtoa_r+0x312>
    250c:	4b9b      	ldr	r3, [pc, #620]	@ (277c <_dtoa_r+0x570>)
    250e:	2200      	movs	r2, #0
    2510:	4640      	mov	r0, r8
    2512:	4649      	mov	r1, r9
    2514:	f004 febe 	bl	7294 <__aeabi_dcmplt>
    2518:	2800      	cmp	r0, #0
    251a:	f040 850b 	bne.w	2f34 <_dtoa_r+0xd28>
    251e:	4638      	mov	r0, r7
    2520:	f004 fbdc 	bl	6cdc <__aeabi_i2d>
    2524:	4642      	mov	r2, r8
    2526:	464b      	mov	r3, r9
    2528:	f004 fc42 	bl	6db0 <__aeabi_dmul>
    252c:	4b94      	ldr	r3, [pc, #592]	@ (2780 <_dtoa_r+0x574>)
    252e:	2200      	movs	r2, #0
    2530:	f004 fa88 	bl	6a44 <__adddf3>
    2534:	f1a1 7350 	sub.w	r3, r1, #54525952	@ 0x3400000
    2538:	e9cd 0114 	strd	r0, r1, [sp, #80]	@ 0x50
    253c:	9315      	str	r3, [sp, #84]	@ 0x54
    253e:	f1bb 0f00 	cmp.w	fp, #0
    2542:	f000 80a8 	beq.w	2696 <_dtoa_r+0x48a>
    2546:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
    2548:	e9cd b318 	strd	fp, r3, [sp, #96]	@ 0x60
    254c:	4649      	mov	r1, r9
    254e:	4640      	mov	r0, r8
    2550:	f004 fede 	bl	7310 <__aeabi_d2iz>
    2554:	9a18      	ldr	r2, [sp, #96]	@ 0x60
    2556:	4b87      	ldr	r3, [pc, #540]	@ (2774 <_dtoa_r+0x568>)
    2558:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    255c:	ed13 7b02 	vldr	d7, [r3, #-8]
    2560:	4605      	mov	r5, r0
    2562:	ed8d 7b16 	vstr	d7, [sp, #88]	@ 0x58
    2566:	f004 fbb9 	bl	6cdc <__aeabi_i2d>
    256a:	460b      	mov	r3, r1
    256c:	4602      	mov	r2, r0
    256e:	4649      	mov	r1, r9
    2570:	4640      	mov	r0, r8
    2572:	f004 fa65 	bl	6a40 <__aeabi_dsub>
    2576:	9f05      	ldr	r7, [sp, #20]
    2578:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    257a:	3530      	adds	r5, #48	@ 0x30
    257c:	1c7e      	adds	r6, r7, #1
    257e:	b2ec      	uxtb	r4, r5
    2580:	4680      	mov	r8, r0
    2582:	4689      	mov	r9, r1
    2584:	4635      	mov	r5, r6
    2586:	2b00      	cmp	r3, #0
    2588:	f000 846c 	beq.w	2e64 <_dtoa_r+0xc58>
    258c:	e9dd 2316 	ldrd	r2, r3, [sp, #88]	@ 0x58
    2590:	497c      	ldr	r1, [pc, #496]	@ (2784 <_dtoa_r+0x578>)
    2592:	2000      	movs	r0, #0
    2594:	f004 fd36 	bl	7004 <__aeabi_ddiv>
    2598:	e9dd 2314 	ldrd	r2, r3, [sp, #80]	@ 0x50
    259c:	f004 fa50 	bl	6a40 <__aeabi_dsub>
    25a0:	703c      	strb	r4, [r7, #0]
    25a2:	4642      	mov	r2, r8
    25a4:	464b      	mov	r3, r9
    25a6:	4604      	mov	r4, r0
    25a8:	460d      	mov	r5, r1
    25aa:	f004 fe91 	bl	72d0 <__aeabi_dcmpgt>
    25ae:	2800      	cmp	r0, #0
    25b0:	f040 84b8 	bne.w	2f24 <_dtoa_r+0xd18>
    25b4:	f8cd a050 	str.w	sl, [sp, #80]	@ 0x50
    25b8:	f8cd b058 	str.w	fp, [sp, #88]	@ 0x58
    25bc:	2700      	movs	r7, #0
    25be:	46ab      	mov	fp, r5
    25c0:	46a2      	mov	sl, r4
    25c2:	9d18      	ldr	r5, [sp, #96]	@ 0x60
    25c4:	e02a      	b.n	261c <_dtoa_r+0x410>
    25c6:	3701      	adds	r7, #1
    25c8:	42af      	cmp	r7, r5
    25ca:	f280 84fd 	bge.w	2fc8 <_dtoa_r+0xdbc>
    25ce:	4b6e      	ldr	r3, [pc, #440]	@ (2788 <_dtoa_r+0x57c>)
    25d0:	4650      	mov	r0, sl
    25d2:	4659      	mov	r1, fp
    25d4:	2200      	movs	r2, #0
    25d6:	f004 fbeb 	bl	6db0 <__aeabi_dmul>
    25da:	4b6b      	ldr	r3, [pc, #428]	@ (2788 <_dtoa_r+0x57c>)
    25dc:	2200      	movs	r2, #0
    25de:	4682      	mov	sl, r0
    25e0:	468b      	mov	fp, r1
    25e2:	4640      	mov	r0, r8
    25e4:	4649      	mov	r1, r9
    25e6:	f004 fbe3 	bl	6db0 <__aeabi_dmul>
    25ea:	4689      	mov	r9, r1
    25ec:	4680      	mov	r8, r0
    25ee:	f004 fe8f 	bl	7310 <__aeabi_d2iz>
    25f2:	4604      	mov	r4, r0
    25f4:	f004 fb72 	bl	6cdc <__aeabi_i2d>
    25f8:	4602      	mov	r2, r0
    25fa:	460b      	mov	r3, r1
    25fc:	4640      	mov	r0, r8
    25fe:	4649      	mov	r1, r9
    2600:	f004 fa1e 	bl	6a40 <__aeabi_dsub>
    2604:	3430      	adds	r4, #48	@ 0x30
    2606:	f806 4b01 	strb.w	r4, [r6], #1
    260a:	4652      	mov	r2, sl
    260c:	465b      	mov	r3, fp
    260e:	4680      	mov	r8, r0
    2610:	4689      	mov	r9, r1
    2612:	f004 fe3f 	bl	7294 <__aeabi_dcmplt>
    2616:	2800      	cmp	r0, #0
    2618:	f040 84d3 	bne.w	2fc2 <_dtoa_r+0xdb6>
    261c:	4642      	mov	r2, r8
    261e:	464b      	mov	r3, r9
    2620:	4956      	ldr	r1, [pc, #344]	@ (277c <_dtoa_r+0x570>)
    2622:	2000      	movs	r0, #0
    2624:	f004 fa0c 	bl	6a40 <__aeabi_dsub>
    2628:	4652      	mov	r2, sl
    262a:	465b      	mov	r3, fp
    262c:	f004 fe32 	bl	7294 <__aeabi_dcmplt>
    2630:	2800      	cmp	r0, #0
    2632:	d0c8      	beq.n	25c6 <_dtoa_r+0x3ba>
    2634:	9b19      	ldr	r3, [sp, #100]	@ 0x64
    2636:	f8dd a050 	ldr.w	sl, [sp, #80]	@ 0x50
    263a:	9a05      	ldr	r2, [sp, #20]
    263c:	4637      	mov	r7, r6
    263e:	f103 0801 	add.w	r8, r3, #1
    2642:	e002      	b.n	264a <_dtoa_r+0x43e>
    2644:	4297      	cmp	r7, r2
    2646:	f000 849b 	beq.w	2f80 <_dtoa_r+0xd74>
    264a:	463e      	mov	r6, r7
    264c:	f817 3d01 	ldrb.w	r3, [r7, #-1]!
    2650:	2b39      	cmp	r3, #57	@ 0x39
    2652:	d0f7      	beq.n	2644 <_dtoa_r+0x438>
    2654:	3301      	adds	r3, #1
    2656:	b2db      	uxtb	r3, r3
    2658:	703b      	strb	r3, [r7, #0]
    265a:	4645      	mov	r5, r8
    265c:	e17d      	b.n	295a <_dtoa_r+0x74e>
    265e:	2301      	movs	r3, #1
    2660:	9311      	str	r3, [sp, #68]	@ 0x44
    2662:	9b08      	ldr	r3, [sp, #32]
    2664:	2b00      	cmp	r3, #0
    2666:	f6bf ae81 	bge.w	236c <_dtoa_r+0x160>
    266a:	f1c8 0301 	rsb	r3, r8, #1
    266e:	930c      	str	r3, [sp, #48]	@ 0x30
    2670:	2300      	movs	r3, #0
    2672:	9308      	str	r3, [sp, #32]
    2674:	e67c      	b.n	2370 <_dtoa_r+0x164>
    2676:	4638      	mov	r0, r7
    2678:	f004 fb30 	bl	6cdc <__aeabi_i2d>
    267c:	4642      	mov	r2, r8
    267e:	464b      	mov	r3, r9
    2680:	f004 fb96 	bl	6db0 <__aeabi_dmul>
    2684:	4b3e      	ldr	r3, [pc, #248]	@ (2780 <_dtoa_r+0x574>)
    2686:	2200      	movs	r2, #0
    2688:	f004 f9dc 	bl	6a44 <__adddf3>
    268c:	f1a1 7350 	sub.w	r3, r1, #54525952	@ 0x3400000
    2690:	e9cd 0114 	strd	r0, r1, [sp, #80]	@ 0x50
    2694:	9315      	str	r3, [sp, #84]	@ 0x54
    2696:	4b3d      	ldr	r3, [pc, #244]	@ (278c <_dtoa_r+0x580>)
    2698:	2200      	movs	r2, #0
    269a:	4640      	mov	r0, r8
    269c:	4649      	mov	r1, r9
    269e:	f004 f9cf 	bl	6a40 <__aeabi_dsub>
    26a2:	e9dd 4514 	ldrd	r4, r5, [sp, #80]	@ 0x50
    26a6:	4622      	mov	r2, r4
    26a8:	462b      	mov	r3, r5
    26aa:	4606      	mov	r6, r0
    26ac:	460f      	mov	r7, r1
    26ae:	f004 fe0f 	bl	72d0 <__aeabi_dcmpgt>
    26b2:	2800      	cmp	r0, #0
    26b4:	f040 8473 	bne.w	2f9e <_dtoa_r+0xd92>
    26b8:	4630      	mov	r0, r6
    26ba:	4639      	mov	r1, r7
    26bc:	4622      	mov	r2, r4
    26be:	f105 4300 	add.w	r3, r5, #2147483648	@ 0x80000000
    26c2:	f004 fde7 	bl	7294 <__aeabi_dcmplt>
    26c6:	bb28      	cbnz	r0, 2714 <_dtoa_r+0x508>
    26c8:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    26ca:	2b00      	cmp	r3, #0
    26cc:	f2c0 8090 	blt.w	27f0 <_dtoa_r+0x5e4>
    26d0:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
    26d2:	2a0e      	cmp	r2, #14
    26d4:	f300 808c 	bgt.w	27f0 <_dtoa_r+0x5e4>
    26d8:	4b26      	ldr	r3, [pc, #152]	@ (2774 <_dtoa_r+0x568>)
    26da:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
    26dc:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    26e0:	ed93 7b00 	vldr	d7, [r3]
    26e4:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    26e6:	2b00      	cmp	r3, #0
    26e8:	ed8d 7b02 	vstr	d7, [sp, #8]
    26ec:	da19      	bge.n	2722 <_dtoa_r+0x516>
    26ee:	f1bb 0f00 	cmp.w	fp, #0
    26f2:	dc16      	bgt.n	2722 <_dtoa_r+0x516>
    26f4:	d10e      	bne.n	2714 <_dtoa_r+0x508>
    26f6:	4b25      	ldr	r3, [pc, #148]	@ (278c <_dtoa_r+0x580>)
    26f8:	2200      	movs	r2, #0
    26fa:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
    26fe:	f004 fb57 	bl	6db0 <__aeabi_dmul>
    2702:	4602      	mov	r2, r0
    2704:	460b      	mov	r3, r1
    2706:	e9dd 0100 	ldrd	r0, r1, [sp]
    270a:	f004 fdcd 	bl	72a8 <__aeabi_dcmple>
    270e:	2800      	cmp	r0, #0
    2710:	f000 8445 	beq.w	2f9e <_dtoa_r+0xd92>
    2714:	2300      	movs	r3, #0
    2716:	9e05      	ldr	r6, [sp, #20]
    2718:	9300      	str	r3, [sp, #0]
    271a:	461f      	mov	r7, r3
    271c:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    271e:	43dd      	mvns	r5, r3
    2720:	e22d      	b.n	2b7e <_dtoa_r+0x972>
    2722:	9b05      	ldr	r3, [sp, #20]
    2724:	1c5d      	adds	r5, r3, #1
    2726:	e9dd 7802 	ldrd	r7, r8, [sp, #8]
    272a:	e9dd 0100 	ldrd	r0, r1, [sp]
    272e:	463a      	mov	r2, r7
    2730:	4643      	mov	r3, r8
    2732:	f004 fc67 	bl	7004 <__aeabi_ddiv>
    2736:	f004 fdeb 	bl	7310 <__aeabi_d2iz>
    273a:	4606      	mov	r6, r0
    273c:	f004 face 	bl	6cdc <__aeabi_i2d>
    2740:	463a      	mov	r2, r7
    2742:	4643      	mov	r3, r8
    2744:	f004 fb34 	bl	6db0 <__aeabi_dmul>
    2748:	4602      	mov	r2, r0
    274a:	460b      	mov	r3, r1
    274c:	e9dd 0100 	ldrd	r0, r1, [sp]
    2750:	f004 f976 	bl	6a40 <__aeabi_dsub>
    2754:	9a05      	ldr	r2, [sp, #20]
    2756:	f106 0330 	add.w	r3, r6, #48	@ 0x30
    275a:	f1bb 0f01 	cmp.w	fp, #1
    275e:	462f      	mov	r7, r5
    2760:	7013      	strb	r3, [r2, #0]
    2762:	f000 8321 	beq.w	2da8 <_dtoa_r+0xb9c>
    2766:	2501      	movs	r5, #1
    2768:	f8cd a000 	str.w	sl, [sp]
    276c:	46a8      	mov	r8, r5
    276e:	e9dd 9a02 	ldrd	r9, sl, [sp, #8]
    2772:	e02b      	b.n	27cc <_dtoa_r+0x5c0>
    2774:	00007590 	.word	0x00007590
    2778:	00007680 	.word	0x00007680
    277c:	3ff00000 	.word	0x3ff00000
    2780:	401c0000 	.word	0x401c0000
    2784:	3fe00000 	.word	0x3fe00000
    2788:	40240000 	.word	0x40240000
    278c:	40140000 	.word	0x40140000
    2790:	464a      	mov	r2, r9
    2792:	4653      	mov	r3, sl
    2794:	4620      	mov	r0, r4
    2796:	4629      	mov	r1, r5
    2798:	f004 fc34 	bl	7004 <__aeabi_ddiv>
    279c:	f004 fdb8 	bl	7310 <__aeabi_d2iz>
    27a0:	4606      	mov	r6, r0
    27a2:	f004 fa9b 	bl	6cdc <__aeabi_i2d>
    27a6:	464a      	mov	r2, r9
    27a8:	4653      	mov	r3, sl
    27aa:	f004 fb01 	bl	6db0 <__aeabi_dmul>
    27ae:	f108 0801 	add.w	r8, r8, #1
    27b2:	460b      	mov	r3, r1
    27b4:	4602      	mov	r2, r0
    27b6:	4629      	mov	r1, r5
    27b8:	4620      	mov	r0, r4
    27ba:	f004 f941 	bl	6a40 <__aeabi_dsub>
    27be:	f106 0330 	add.w	r3, r6, #48	@ 0x30
    27c2:	45d8      	cmp	r8, fp
    27c4:	f807 3b01 	strb.w	r3, [r7], #1
    27c8:	f000 82ec 	beq.w	2da4 <_dtoa_r+0xb98>
    27cc:	4b84      	ldr	r3, [pc, #528]	@ (29e0 <_dtoa_r+0x7d4>)
    27ce:	2200      	movs	r2, #0
    27d0:	f004 faee 	bl	6db0 <__aeabi_dmul>
    27d4:	2200      	movs	r2, #0
    27d6:	2300      	movs	r3, #0
    27d8:	4604      	mov	r4, r0
    27da:	460d      	mov	r5, r1
    27dc:	f004 fd50 	bl	7280 <__aeabi_dcmpeq>
    27e0:	2800      	cmp	r0, #0
    27e2:	d0d5      	beq.n	2790 <_dtoa_r+0x584>
    27e4:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    27e6:	f8dd a000 	ldr.w	sl, [sp]
    27ea:	3501      	adds	r5, #1
    27ec:	463e      	mov	r6, r7
    27ee:	e0b4      	b.n	295a <_dtoa_r+0x74e>
    27f0:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
    27f2:	2a00      	cmp	r2, #0
    27f4:	f040 80d8 	bne.w	29a8 <_dtoa_r+0x79c>
    27f8:	2300      	movs	r3, #0
    27fa:	9e10      	ldr	r6, [sp, #64]	@ 0x40
    27fc:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
    27fe:	930e      	str	r3, [sp, #56]	@ 0x38
    2800:	461f      	mov	r7, r3
    2802:	b165      	cbz	r5, 281e <_dtoa_r+0x612>
    2804:	9a08      	ldr	r2, [sp, #32]
    2806:	2a00      	cmp	r2, #0
    2808:	dd09      	ble.n	281e <_dtoa_r+0x612>
    280a:	990c      	ldr	r1, [sp, #48]	@ 0x30
    280c:	42aa      	cmp	r2, r5
    280e:	4613      	mov	r3, r2
    2810:	bfa8      	it	ge
    2812:	462b      	movge	r3, r5
    2814:	1ac9      	subs	r1, r1, r3
    2816:	1aed      	subs	r5, r5, r3
    2818:	1ad3      	subs	r3, r2, r3
    281a:	910c      	str	r1, [sp, #48]	@ 0x30
    281c:	9308      	str	r3, [sp, #32]
    281e:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    2820:	b153      	cbz	r3, 2838 <_dtoa_r+0x62c>
    2822:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    2824:	b113      	cbz	r3, 282c <_dtoa_r+0x620>
    2826:	2e00      	cmp	r6, #0
    2828:	f040 82f7 	bne.w	2e1a <_dtoa_r+0xc0e>
    282c:	4651      	mov	r1, sl
    282e:	9a10      	ldr	r2, [sp, #64]	@ 0x40
    2830:	9804      	ldr	r0, [sp, #16]
    2832:	f001 fb17 	bl	3e64 <__pow5mult>
    2836:	4682      	mov	sl, r0
    2838:	9804      	ldr	r0, [sp, #16]
    283a:	2101      	movs	r1, #1
    283c:	f001 fa2e 	bl	3c9c <__i2b>
    2840:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    2842:	9000      	str	r0, [sp, #0]
    2844:	2b00      	cmp	r3, #0
    2846:	f040 81be 	bne.w	2bc6 <_dtoa_r+0x9ba>
    284a:	9b02      	ldr	r3, [sp, #8]
    284c:	2b01      	cmp	r3, #1
    284e:	f340 81d4 	ble.w	2bfa <_dtoa_r+0x9ee>
    2852:	2001      	movs	r0, #1
    2854:	9a08      	ldr	r2, [sp, #32]
    2856:	4410      	add	r0, r2
    2858:	f010 001f 	ands.w	r0, r0, #31
    285c:	f000 809b 	beq.w	2996 <_dtoa_r+0x78a>
    2860:	f1c0 0320 	rsb	r3, r0, #32
    2864:	2b04      	cmp	r3, #4
    2866:	f340 81e3 	ble.w	2c30 <_dtoa_r+0xa24>
    286a:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    286c:	f1c0 001c 	rsb	r0, r0, #28
    2870:	4403      	add	r3, r0
    2872:	4402      	add	r2, r0
    2874:	930c      	str	r3, [sp, #48]	@ 0x30
    2876:	4405      	add	r5, r0
    2878:	9208      	str	r2, [sp, #32]
    287a:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    287c:	2b00      	cmp	r3, #0
    287e:	dd05      	ble.n	288c <_dtoa_r+0x680>
    2880:	4651      	mov	r1, sl
    2882:	9804      	ldr	r0, [sp, #16]
    2884:	461a      	mov	r2, r3
    2886:	f001 fb47 	bl	3f18 <__lshift>
    288a:	4682      	mov	sl, r0
    288c:	9b08      	ldr	r3, [sp, #32]
    288e:	2b00      	cmp	r3, #0
    2890:	dd05      	ble.n	289e <_dtoa_r+0x692>
    2892:	9900      	ldr	r1, [sp, #0]
    2894:	9804      	ldr	r0, [sp, #16]
    2896:	461a      	mov	r2, r3
    2898:	f001 fb3e 	bl	3f18 <__lshift>
    289c:	9000      	str	r0, [sp, #0]
    289e:	9b11      	ldr	r3, [sp, #68]	@ 0x44
    28a0:	2b00      	cmp	r3, #0
    28a2:	f040 8175 	bne.w	2b90 <_dtoa_r+0x984>
    28a6:	f1bb 0f00 	cmp.w	fp, #0
    28aa:	f340 814c 	ble.w	2b46 <_dtoa_r+0x93a>
    28ae:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    28b0:	2b00      	cmp	r3, #0
    28b2:	f040 80a4 	bne.w	29fe <_dtoa_r+0x7f2>
    28b6:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    28b8:	3501      	adds	r5, #1
    28ba:	f8dd 8014 	ldr.w	r8, [sp, #20]
    28be:	9c00      	ldr	r4, [sp, #0]
    28c0:	f8dd 9010 	ldr.w	r9, [sp, #16]
    28c4:	2601      	movs	r6, #1
    28c6:	e007      	b.n	28d8 <_dtoa_r+0x6cc>
    28c8:	4651      	mov	r1, sl
    28ca:	2300      	movs	r3, #0
    28cc:	220a      	movs	r2, #10
    28ce:	4648      	mov	r0, r9
    28d0:	f001 f8e8 	bl	3aa4 <__multadd>
    28d4:	3601      	adds	r6, #1
    28d6:	4682      	mov	sl, r0
    28d8:	4621      	mov	r1, r4
    28da:	4650      	mov	r0, sl
    28dc:	f7ff fc00 	bl	20e0 <quorem>
    28e0:	45b3      	cmp	fp, r6
    28e2:	f100 0030 	add.w	r0, r0, #48	@ 0x30
    28e6:	f808 0b01 	strb.w	r0, [r8], #1
    28ea:	dced      	bgt.n	28c8 <_dtoa_r+0x6bc>
    28ec:	f1bb 0f00 	cmp.w	fp, #0
    28f0:	9b05      	ldr	r3, [sp, #20]
    28f2:	bfcc      	ite	gt
    28f4:	465e      	movgt	r6, fp
    28f6:	2601      	movle	r6, #1
    28f8:	4681      	mov	r9, r0
    28fa:	eb03 0b06 	add.w	fp, r3, r6
    28fe:	2400      	movs	r4, #0
    2900:	4651      	mov	r1, sl
    2902:	2201      	movs	r2, #1
    2904:	9804      	ldr	r0, [sp, #16]
    2906:	f001 fb07 	bl	3f18 <__lshift>
    290a:	9900      	ldr	r1, [sp, #0]
    290c:	4682      	mov	sl, r0
    290e:	f001 fb7b 	bl	4008 <__mcmp>
    2912:	2800      	cmp	r0, #0
    2914:	f340 81ee 	ble.w	2cf4 <_dtoa_r+0xae8>
    2918:	9a05      	ldr	r2, [sp, #20]
    291a:	e002      	b.n	2922 <_dtoa_r+0x716>
    291c:	4593      	cmp	fp, r2
    291e:	f000 8203 	beq.w	2d28 <_dtoa_r+0xb1c>
    2922:	465e      	mov	r6, fp
    2924:	f10b 3bff 	add.w	fp, fp, #4294967295	@ 0xffffffff
    2928:	f816 3c01 	ldrb.w	r3, [r6, #-1]
    292c:	2b39      	cmp	r3, #57	@ 0x39
    292e:	d0f5      	beq.n	291c <_dtoa_r+0x710>
    2930:	3301      	adds	r3, #1
    2932:	f88b 3000 	strb.w	r3, [fp]
    2936:	f8dd 8010 	ldr.w	r8, [sp, #16]
    293a:	9900      	ldr	r1, [sp, #0]
    293c:	4640      	mov	r0, r8
    293e:	f001 f8a7 	bl	3a90 <_Bfree>
    2942:	b157      	cbz	r7, 295a <_dtoa_r+0x74e>
    2944:	b12c      	cbz	r4, 2952 <_dtoa_r+0x746>
    2946:	42bc      	cmp	r4, r7
    2948:	d003      	beq.n	2952 <_dtoa_r+0x746>
    294a:	4621      	mov	r1, r4
    294c:	4640      	mov	r0, r8
    294e:	f001 f89f 	bl	3a90 <_Bfree>
    2952:	9804      	ldr	r0, [sp, #16]
    2954:	4639      	mov	r1, r7
    2956:	f001 f89b 	bl	3a90 <_Bfree>
    295a:	9804      	ldr	r0, [sp, #16]
    295c:	4651      	mov	r1, sl
    295e:	f001 f897 	bl	3a90 <_Bfree>
    2962:	2300      	movs	r3, #0
    2964:	7033      	strb	r3, [r6, #0]
    2966:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
    2968:	601d      	str	r5, [r3, #0]
    296a:	9b27      	ldr	r3, [sp, #156]	@ 0x9c
    296c:	2b00      	cmp	r3, #0
    296e:	f43f ac8b 	beq.w	2288 <_dtoa_r+0x7c>
    2972:	9805      	ldr	r0, [sp, #20]
    2974:	601e      	str	r6, [r3, #0]
    2976:	b01d      	add	sp, #116	@ 0x74
    2978:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    297c:	4620      	mov	r0, r4
    297e:	f004 f9ad 	bl	6cdc <__aeabi_i2d>
    2982:	4632      	mov	r2, r6
    2984:	463b      	mov	r3, r7
    2986:	f004 fc7b 	bl	7280 <__aeabi_dcmpeq>
    298a:	2800      	cmp	r0, #0
    298c:	f47f acd2 	bne.w	2334 <_dtoa_r+0x128>
    2990:	1e63      	subs	r3, r4, #1
    2992:	9309      	str	r3, [sp, #36]	@ 0x24
    2994:	e4ce      	b.n	2334 <_dtoa_r+0x128>
    2996:	231c      	movs	r3, #28
    2998:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
    299a:	441a      	add	r2, r3
    299c:	920c      	str	r2, [sp, #48]	@ 0x30
    299e:	9a08      	ldr	r2, [sp, #32]
    29a0:	441a      	add	r2, r3
    29a2:	441d      	add	r5, r3
    29a4:	9208      	str	r2, [sp, #32]
    29a6:	e768      	b.n	287a <_dtoa_r+0x66e>
    29a8:	9a02      	ldr	r2, [sp, #8]
    29aa:	2a01      	cmp	r2, #1
    29ac:	f340 81ad 	ble.w	2d0a <_dtoa_r+0xafe>
    29b0:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    29b2:	f10b 36ff 	add.w	r6, fp, #4294967295	@ 0xffffffff
    29b6:	42b3      	cmp	r3, r6
    29b8:	f2c0 8169 	blt.w	2c8e <_dtoa_r+0xa82>
    29bc:	f1bb 0f00 	cmp.w	fp, #0
    29c0:	eba3 0606 	sub.w	r6, r3, r6
    29c4:	f280 82ef 	bge.w	2fa6 <_dtoa_r+0xd9a>
    29c8:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    29ca:	eba3 050b 	sub.w	r5, r3, fp
    29ce:	e16c      	b.n	2caa <_dtoa_r+0xa9e>
    29d0:	f1c3 0320 	rsb	r3, r3, #32
    29d4:	fa06 f003 	lsl.w	r0, r6, r3
    29d8:	e478      	b.n	22cc <_dtoa_r+0xc0>
    29da:	2501      	movs	r5, #1
    29dc:	e4dd      	b.n	239a <_dtoa_r+0x18e>
    29de:	bf00      	nop
    29e0:	40240000 	.word	0x40240000
    29e4:	4639      	mov	r1, r7
    29e6:	2300      	movs	r3, #0
    29e8:	9804      	ldr	r0, [sp, #16]
    29ea:	220a      	movs	r2, #10
    29ec:	f001 f85a 	bl	3aa4 <__multadd>
    29f0:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
    29f2:	2b00      	cmp	r3, #0
    29f4:	4607      	mov	r7, r0
    29f6:	f340 82ff 	ble.w	2ff8 <_dtoa_r+0xdec>
    29fa:	960d      	str	r6, [sp, #52]	@ 0x34
    29fc:	469b      	mov	fp, r3
    29fe:	2d00      	cmp	r5, #0
    2a00:	dd05      	ble.n	2a0e <_dtoa_r+0x802>
    2a02:	4639      	mov	r1, r7
    2a04:	9804      	ldr	r0, [sp, #16]
    2a06:	462a      	mov	r2, r5
    2a08:	f001 fa86 	bl	3f18 <__lshift>
    2a0c:	4607      	mov	r7, r0
    2a0e:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    2a10:	2b00      	cmp	r3, #0
    2a12:	f040 81e6 	bne.w	2de2 <_dtoa_r+0xbd6>
    2a16:	46b8      	mov	r8, r7
    2a18:	9e05      	ldr	r6, [sp, #20]
    2a1a:	1e73      	subs	r3, r6, #1
    2a1c:	eb03 040b 	add.w	r4, r3, fp
    2a20:	9b06      	ldr	r3, [sp, #24]
    2a22:	f003 0301 	and.w	r3, r3, #1
    2a26:	e9cd 430b 	strd	r4, r3, [sp, #44]	@ 0x2c
    2a2a:	9c04      	ldr	r4, [sp, #16]
    2a2c:	9900      	ldr	r1, [sp, #0]
    2a2e:	4650      	mov	r0, sl
    2a30:	f7ff fb56 	bl	20e0 <quorem>
    2a34:	4639      	mov	r1, r7
    2a36:	4683      	mov	fp, r0
    2a38:	4650      	mov	r0, sl
    2a3a:	f001 fae5 	bl	4008 <__mcmp>
    2a3e:	9900      	ldr	r1, [sp, #0]
    2a40:	4605      	mov	r5, r0
    2a42:	4642      	mov	r2, r8
    2a44:	4620      	mov	r0, r4
    2a46:	f001 fb01 	bl	404c <__mdiff>
    2a4a:	68c3      	ldr	r3, [r0, #12]
    2a4c:	f10b 0930 	add.w	r9, fp, #48	@ 0x30
    2a50:	4601      	mov	r1, r0
    2a52:	bbab      	cbnz	r3, 2ac0 <_dtoa_r+0x8b4>
    2a54:	9009      	str	r0, [sp, #36]	@ 0x24
    2a56:	4650      	mov	r0, sl
    2a58:	f001 fad6 	bl	4008 <__mcmp>
    2a5c:	9909      	ldr	r1, [sp, #36]	@ 0x24
    2a5e:	9008      	str	r0, [sp, #32]
    2a60:	4620      	mov	r0, r4
    2a62:	f001 f815 	bl	3a90 <_Bfree>
    2a66:	9a08      	ldr	r2, [sp, #32]
    2a68:	2a00      	cmp	r2, #0
    2a6a:	d154      	bne.n	2b16 <_dtoa_r+0x90a>
    2a6c:	9b02      	ldr	r3, [sp, #8]
    2a6e:	b91b      	cbnz	r3, 2a78 <_dtoa_r+0x86c>
    2a70:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    2a72:	2b00      	cmp	r3, #0
    2a74:	f000 82ae 	beq.w	2fd4 <_dtoa_r+0xdc8>
    2a78:	2d00      	cmp	r5, #0
    2a7a:	db3f      	blt.n	2afc <_dtoa_r+0x8f0>
    2a7c:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    2a7e:	46b3      	mov	fp, r6
    2a80:	429e      	cmp	r6, r3
    2a82:	f80b 9b01 	strb.w	r9, [fp], #1
    2a86:	f000 81c3 	beq.w	2e10 <_dtoa_r+0xc04>
    2a8a:	4651      	mov	r1, sl
    2a8c:	2300      	movs	r3, #0
    2a8e:	220a      	movs	r2, #10
    2a90:	4620      	mov	r0, r4
    2a92:	f001 f807 	bl	3aa4 <__multadd>
    2a96:	4547      	cmp	r7, r8
    2a98:	4682      	mov	sl, r0
    2a9a:	4639      	mov	r1, r7
    2a9c:	f04f 0300 	mov.w	r3, #0
    2aa0:	f04f 020a 	mov.w	r2, #10
    2aa4:	4620      	mov	r0, r4
    2aa6:	d030      	beq.n	2b0a <_dtoa_r+0x8fe>
    2aa8:	f000 fffc 	bl	3aa4 <__multadd>
    2aac:	4641      	mov	r1, r8
    2aae:	4607      	mov	r7, r0
    2ab0:	2300      	movs	r3, #0
    2ab2:	220a      	movs	r2, #10
    2ab4:	4620      	mov	r0, r4
    2ab6:	f000 fff5 	bl	3aa4 <__multadd>
    2aba:	465e      	mov	r6, fp
    2abc:	4680      	mov	r8, r0
    2abe:	e7b5      	b.n	2a2c <_dtoa_r+0x820>
    2ac0:	9804      	ldr	r0, [sp, #16]
    2ac2:	f000 ffe5 	bl	3a90 <_Bfree>
    2ac6:	2d00      	cmp	r5, #0
    2ac8:	db06      	blt.n	2ad8 <_dtoa_r+0x8cc>
    2aca:	9b06      	ldr	r3, [sp, #24]
    2acc:	f003 0201 	and.w	r2, r3, #1
    2ad0:	9b02      	ldr	r3, [sp, #8]
    2ad2:	431d      	orrs	r5, r3
    2ad4:	432a      	orrs	r2, r5
    2ad6:	d129      	bne.n	2b2c <_dtoa_r+0x920>
    2ad8:	4651      	mov	r1, sl
    2ada:	2201      	movs	r2, #1
    2adc:	9804      	ldr	r0, [sp, #16]
    2ade:	f001 fa1b 	bl	3f18 <__lshift>
    2ae2:	9900      	ldr	r1, [sp, #0]
    2ae4:	4682      	mov	sl, r0
    2ae6:	f001 fa8f 	bl	4008 <__mcmp>
    2aea:	2800      	cmp	r0, #0
    2aec:	f340 80f6 	ble.w	2cdc <_dtoa_r+0xad0>
    2af0:	f1b9 0f39 	cmp.w	r9, #57	@ 0x39
    2af4:	f000 8249 	beq.w	2f8a <_dtoa_r+0xd7e>
    2af8:	f10b 0931 	add.w	r9, fp, #49	@ 0x31
    2afc:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2afe:	f806 9b01 	strb.w	r9, [r6], #1
    2b02:	463c      	mov	r4, r7
    2b04:	3501      	adds	r5, #1
    2b06:	4647      	mov	r7, r8
    2b08:	e715      	b.n	2936 <_dtoa_r+0x72a>
    2b0a:	f000 ffcb 	bl	3aa4 <__multadd>
    2b0e:	465e      	mov	r6, fp
    2b10:	4607      	mov	r7, r0
    2b12:	4680      	mov	r8, r0
    2b14:	e78a      	b.n	2a2c <_dtoa_r+0x820>
    2b16:	2d00      	cmp	r5, #0
    2b18:	f2c0 8293 	blt.w	3042 <_dtoa_r+0xe36>
    2b1c:	9b02      	ldr	r3, [sp, #8]
    2b1e:	431d      	orrs	r5, r3
    2b20:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    2b22:	431d      	orrs	r5, r3
    2b24:	f000 828d 	beq.w	3042 <_dtoa_r+0xe36>
    2b28:	2a00      	cmp	r2, #0
    2b2a:	dda7      	ble.n	2a7c <_dtoa_r+0x870>
    2b2c:	f1b9 0f39 	cmp.w	r9, #57	@ 0x39
    2b30:	f000 822b 	beq.w	2f8a <_dtoa_r+0xd7e>
    2b34:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2b36:	f109 0301 	add.w	r3, r9, #1
    2b3a:	463c      	mov	r4, r7
    2b3c:	f806 3b01 	strb.w	r3, [r6], #1
    2b40:	3501      	adds	r5, #1
    2b42:	4647      	mov	r7, r8
    2b44:	e6f7      	b.n	2936 <_dtoa_r+0x72a>
    2b46:	9b02      	ldr	r3, [sp, #8]
    2b48:	2b02      	cmp	r3, #2
    2b4a:	f77f aeb0 	ble.w	28ae <_dtoa_r+0x6a2>
    2b4e:	f1bb 0f00 	cmp.w	fp, #0
    2b52:	f040 8125 	bne.w	2da0 <_dtoa_r+0xb94>
    2b56:	9900      	ldr	r1, [sp, #0]
    2b58:	9804      	ldr	r0, [sp, #16]
    2b5a:	465b      	mov	r3, fp
    2b5c:	2205      	movs	r2, #5
    2b5e:	f000 ffa1 	bl	3aa4 <__multadd>
    2b62:	4601      	mov	r1, r0
    2b64:	9000      	str	r0, [sp, #0]
    2b66:	4650      	mov	r0, sl
    2b68:	f001 fa4e 	bl	4008 <__mcmp>
    2b6c:	2800      	cmp	r0, #0
    2b6e:	f340 8117 	ble.w	2da0 <_dtoa_r+0xb94>
    2b72:	9e05      	ldr	r6, [sp, #20]
    2b74:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2b76:	2331      	movs	r3, #49	@ 0x31
    2b78:	f806 3b01 	strb.w	r3, [r6], #1
    2b7c:	3501      	adds	r5, #1
    2b7e:	9900      	ldr	r1, [sp, #0]
    2b80:	9804      	ldr	r0, [sp, #16]
    2b82:	f000 ff85 	bl	3a90 <_Bfree>
    2b86:	3501      	adds	r5, #1
    2b88:	2f00      	cmp	r7, #0
    2b8a:	f47f aee2 	bne.w	2952 <_dtoa_r+0x746>
    2b8e:	e6e4      	b.n	295a <_dtoa_r+0x74e>
    2b90:	9900      	ldr	r1, [sp, #0]
    2b92:	4650      	mov	r0, sl
    2b94:	f001 fa38 	bl	4008 <__mcmp>
    2b98:	2800      	cmp	r0, #0
    2b9a:	f6bf ae84 	bge.w	28a6 <_dtoa_r+0x69a>
    2b9e:	4651      	mov	r1, sl
    2ba0:	2300      	movs	r3, #0
    2ba2:	9804      	ldr	r0, [sp, #16]
    2ba4:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
    2ba6:	220a      	movs	r2, #10
    2ba8:	f000 ff7c 	bl	3aa4 <__multadd>
    2bac:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
    2bae:	1e66      	subs	r6, r4, #1
    2bb0:	4682      	mov	sl, r0
    2bb2:	2b00      	cmp	r3, #0
    2bb4:	f47f af16 	bne.w	29e4 <_dtoa_r+0x7d8>
    2bb8:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
    2bba:	2b00      	cmp	r3, #0
    2bbc:	f340 8211 	ble.w	2fe2 <_dtoa_r+0xdd6>
    2bc0:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2bc2:	469b      	mov	fp, r3
    2bc4:	e679      	b.n	28ba <_dtoa_r+0x6ae>
    2bc6:	4601      	mov	r1, r0
    2bc8:	461a      	mov	r2, r3
    2bca:	9804      	ldr	r0, [sp, #16]
    2bcc:	f001 f94a 	bl	3e64 <__pow5mult>
    2bd0:	9b02      	ldr	r3, [sp, #8]
    2bd2:	9000      	str	r0, [sp, #0]
    2bd4:	2b01      	cmp	r3, #1
    2bd6:	dd6e      	ble.n	2cb6 <_dtoa_r+0xaaa>
    2bd8:	2300      	movs	r3, #0
    2bda:	9309      	str	r3, [sp, #36]	@ 0x24
    2bdc:	9a00      	ldr	r2, [sp, #0]
    2bde:	6913      	ldr	r3, [r2, #16]
    2be0:	eb02 0383 	add.w	r3, r2, r3, lsl #2
    2be4:	6918      	ldr	r0, [r3, #16]
    2be6:	f001 f807 	bl	3bf8 <__hi0bits>
    2bea:	f1c0 0020 	rsb	r0, r0, #32
    2bee:	e631      	b.n	2854 <_dtoa_r+0x648>
    2bf0:	4b98      	ldr	r3, [pc, #608]	@ (2e54 <_dtoa_r+0xc48>)
    2bf2:	9305      	str	r3, [sp, #20]
    2bf4:	3303      	adds	r3, #3
    2bf6:	f7ff bbeb 	b.w	23d0 <_dtoa_r+0x1c4>
    2bfa:	9b06      	ldr	r3, [sp, #24]
    2bfc:	2b00      	cmp	r3, #0
    2bfe:	f47f ae28 	bne.w	2852 <_dtoa_r+0x646>
    2c02:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
    2c06:	f3c2 0313 	ubfx	r3, r2, #0, #20
    2c0a:	2b00      	cmp	r3, #0
    2c0c:	f47f ae21 	bne.w	2852 <_dtoa_r+0x646>
    2c10:	4b91      	ldr	r3, [pc, #580]	@ (2e58 <_dtoa_r+0xc4c>)
    2c12:	4013      	ands	r3, r2
    2c14:	b133      	cbz	r3, 2c24 <_dtoa_r+0xa18>
    2c16:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    2c18:	3301      	adds	r3, #1
    2c1a:	930c      	str	r3, [sp, #48]	@ 0x30
    2c1c:	9b08      	ldr	r3, [sp, #32]
    2c1e:	3301      	adds	r3, #1
    2c20:	9308      	str	r3, [sp, #32]
    2c22:	2301      	movs	r3, #1
    2c24:	9a09      	ldr	r2, [sp, #36]	@ 0x24
    2c26:	9309      	str	r3, [sp, #36]	@ 0x24
    2c28:	2a00      	cmp	r2, #0
    2c2a:	f43f ae12 	beq.w	2852 <_dtoa_r+0x646>
    2c2e:	e7d5      	b.n	2bdc <_dtoa_r+0x9d0>
    2c30:	f43f ae23 	beq.w	287a <_dtoa_r+0x66e>
    2c34:	f1c0 033c 	rsb	r3, r0, #60	@ 0x3c
    2c38:	e6ae      	b.n	2998 <_dtoa_r+0x78c>
    2c3a:	2301      	movs	r3, #1
    2c3c:	930e      	str	r3, [sp, #56]	@ 0x38
    2c3e:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
    2c40:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
    2c42:	4413      	add	r3, r2
    2c44:	f103 0b01 	add.w	fp, r3, #1
    2c48:	465e      	mov	r6, fp
    2c4a:	2e01      	cmp	r6, #1
    2c4c:	9313      	str	r3, [sp, #76]	@ 0x4c
    2c4e:	bfb8      	it	lt
    2c50:	2601      	movlt	r6, #1
    2c52:	2e17      	cmp	r6, #23
    2c54:	f340 81f9 	ble.w	304a <_dtoa_r+0xe3e>
    2c58:	2201      	movs	r2, #1
    2c5a:	2304      	movs	r3, #4
    2c5c:	005b      	lsls	r3, r3, #1
    2c5e:	f103 0014 	add.w	r0, r3, #20
    2c62:	42b0      	cmp	r0, r6
    2c64:	4611      	mov	r1, r2
    2c66:	f102 0201 	add.w	r2, r2, #1
    2c6a:	d9f7      	bls.n	2c5c <_dtoa_r+0xa50>
    2c6c:	9b04      	ldr	r3, [sp, #16]
    2c6e:	63d9      	str	r1, [r3, #60]	@ 0x3c
    2c70:	e404      	b.n	247c <_dtoa_r+0x270>
    2c72:	2301      	movs	r3, #1
    2c74:	930e      	str	r3, [sp, #56]	@ 0x38
    2c76:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
    2c78:	2e00      	cmp	r6, #0
    2c7a:	dd36      	ble.n	2cea <_dtoa_r+0xade>
    2c7c:	9613      	str	r6, [sp, #76]	@ 0x4c
    2c7e:	46b3      	mov	fp, r6
    2c80:	e7e7      	b.n	2c52 <_dtoa_r+0xa46>
    2c82:	2300      	movs	r3, #0
    2c84:	930e      	str	r3, [sp, #56]	@ 0x38
    2c86:	e7da      	b.n	2c3e <_dtoa_r+0xa32>
    2c88:	2300      	movs	r3, #0
    2c8a:	930e      	str	r3, [sp, #56]	@ 0x38
    2c8c:	e7f3      	b.n	2c76 <_dtoa_r+0xa6a>
    2c8e:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    2c90:	9a09      	ldr	r2, [sp, #36]	@ 0x24
    2c92:	9610      	str	r6, [sp, #64]	@ 0x40
    2c94:	1af3      	subs	r3, r6, r3
    2c96:	441a      	add	r2, r3
    2c98:	9b08      	ldr	r3, [sp, #32]
    2c9a:	9209      	str	r2, [sp, #36]	@ 0x24
    2c9c:	445b      	add	r3, fp
    2c9e:	9308      	str	r3, [sp, #32]
    2ca0:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    2ca2:	461d      	mov	r5, r3
    2ca4:	445b      	add	r3, fp
    2ca6:	930c      	str	r3, [sp, #48]	@ 0x30
    2ca8:	2600      	movs	r6, #0
    2caa:	9804      	ldr	r0, [sp, #16]
    2cac:	2101      	movs	r1, #1
    2cae:	f000 fff5 	bl	3c9c <__i2b>
    2cb2:	4607      	mov	r7, r0
    2cb4:	e5a5      	b.n	2802 <_dtoa_r+0x5f6>
    2cb6:	9b06      	ldr	r3, [sp, #24]
    2cb8:	2b00      	cmp	r3, #0
    2cba:	d18d      	bne.n	2bd8 <_dtoa_r+0x9cc>
    2cbc:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
    2cc0:	f3c1 0313 	ubfx	r3, r1, #0, #20
    2cc4:	460a      	mov	r2, r1
    2cc6:	2b00      	cmp	r3, #0
    2cc8:	d0a2      	beq.n	2c10 <_dtoa_r+0xa04>
    2cca:	9009      	str	r0, [sp, #36]	@ 0x24
    2ccc:	e786      	b.n	2bdc <_dtoa_r+0x9d0>
    2cce:	ed9d 7b00 	vldr	d7, [sp]
    2cd2:	2702      	movs	r7, #2
    2cd4:	ed8d 7b14 	vstr	d7, [sp, #80]	@ 0x50
    2cd8:	f7ff bbfd 	b.w	24d6 <_dtoa_r+0x2ca>
    2cdc:	f47f af0e 	bne.w	2afc <_dtoa_r+0x8f0>
    2ce0:	f019 0f01 	tst.w	r9, #1
    2ce4:	f47f af04 	bne.w	2af0 <_dtoa_r+0x8e4>
    2ce8:	e708      	b.n	2afc <_dtoa_r+0x8f0>
    2cea:	2301      	movs	r3, #1
    2cec:	930b      	str	r3, [sp, #44]	@ 0x2c
    2cee:	469b      	mov	fp, r3
    2cf0:	f7ff bbbf 	b.w	2472 <_dtoa_r+0x266>
    2cf4:	d103      	bne.n	2cfe <_dtoa_r+0xaf2>
    2cf6:	f019 0f01 	tst.w	r9, #1
    2cfa:	f47f ae0d 	bne.w	2918 <_dtoa_r+0x70c>
    2cfe:	465e      	mov	r6, fp
    2d00:	f81b 3d01 	ldrb.w	r3, [fp, #-1]!
    2d04:	2b30      	cmp	r3, #48	@ 0x30
    2d06:	d0fa      	beq.n	2cfe <_dtoa_r+0xaf2>
    2d08:	e615      	b.n	2936 <_dtoa_r+0x72a>
    2d0a:	9a12      	ldr	r2, [sp, #72]	@ 0x48
    2d0c:	2a00      	cmp	r2, #0
    2d0e:	f000 809c 	beq.w	2e4a <_dtoa_r+0xc3e>
    2d12:	f203 4333 	addw	r3, r3, #1075	@ 0x433
    2d16:	9a08      	ldr	r2, [sp, #32]
    2d18:	9e10      	ldr	r6, [sp, #64]	@ 0x40
    2d1a:	441a      	add	r2, r3
    2d1c:	9208      	str	r2, [sp, #32]
    2d1e:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
    2d20:	4615      	mov	r5, r2
    2d22:	441a      	add	r2, r3
    2d24:	920c      	str	r2, [sp, #48]	@ 0x30
    2d26:	e7c0      	b.n	2caa <_dtoa_r+0xa9e>
    2d28:	9a05      	ldr	r2, [sp, #20]
    2d2a:	2331      	movs	r3, #49	@ 0x31
    2d2c:	3501      	adds	r5, #1
    2d2e:	7013      	strb	r3, [r2, #0]
    2d30:	e601      	b.n	2936 <_dtoa_r+0x72a>
    2d32:	f000 80fa 	beq.w	2f2a <_dtoa_r+0xd1e>
    2d36:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
    2d38:	4b48      	ldr	r3, [pc, #288]	@ (2e5c <_dtoa_r+0xc50>)
    2d3a:	4255      	negs	r5, r2
    2d3c:	f005 020f 	and.w	r2, r5, #15
    2d40:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    2d44:	e9d3 2300 	ldrd	r2, r3, [r3]
    2d48:	e9dd 0100 	ldrd	r0, r1, [sp]
    2d4c:	f004 f830 	bl	6db0 <__aeabi_dmul>
    2d50:	112d      	asrs	r5, r5, #4
    2d52:	e9cd 0114 	strd	r0, r1, [sp, #80]	@ 0x50
    2d56:	f000 8158 	beq.w	300a <_dtoa_r+0xdfe>
    2d5a:	4e41      	ldr	r6, [pc, #260]	@ (2e60 <_dtoa_r+0xc54>)
    2d5c:	2300      	movs	r3, #0
    2d5e:	2702      	movs	r7, #2
    2d60:	4680      	mov	r8, r0
    2d62:	4689      	mov	r9, r1
    2d64:	07ea      	lsls	r2, r5, #31
    2d66:	d509      	bpl.n	2d7c <_dtoa_r+0xb70>
    2d68:	e9d6 2300 	ldrd	r2, r3, [r6]
    2d6c:	4640      	mov	r0, r8
    2d6e:	4649      	mov	r1, r9
    2d70:	f004 f81e 	bl	6db0 <__aeabi_dmul>
    2d74:	3701      	adds	r7, #1
    2d76:	4680      	mov	r8, r0
    2d78:	4689      	mov	r9, r1
    2d7a:	2301      	movs	r3, #1
    2d7c:	106d      	asrs	r5, r5, #1
    2d7e:	f106 0608 	add.w	r6, r6, #8
    2d82:	d1ef      	bne.n	2d64 <_dtoa_r+0xb58>
    2d84:	2b00      	cmp	r3, #0
    2d86:	f47f abbf 	bne.w	2508 <_dtoa_r+0x2fc>
    2d8a:	e9dd 8914 	ldrd	r8, r9, [sp, #80]	@ 0x50
    2d8e:	f7ff bbbb 	b.w	2508 <_dtoa_r+0x2fc>
    2d92:	f1c8 0301 	rsb	r3, r8, #1
    2d96:	9008      	str	r0, [sp, #32]
    2d98:	930c      	str	r3, [sp, #48]	@ 0x30
    2d9a:	9011      	str	r0, [sp, #68]	@ 0x44
    2d9c:	f7ff bb58 	b.w	2450 <_dtoa_r+0x244>
    2da0:	9e05      	ldr	r6, [sp, #20]
    2da2:	e4bb      	b.n	271c <_dtoa_r+0x510>
    2da4:	f8dd a000 	ldr.w	sl, [sp]
    2da8:	4602      	mov	r2, r0
    2daa:	460b      	mov	r3, r1
    2dac:	f003 fe4a 	bl	6a44 <__adddf3>
    2db0:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2db2:	e9cd 0100 	strd	r0, r1, [sp]
    2db6:	3501      	adds	r5, #1
    2db8:	4602      	mov	r2, r0
    2dba:	460b      	mov	r3, r1
    2dbc:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
    2dc0:	46a8      	mov	r8, r5
    2dc2:	f004 fa67 	bl	7294 <__aeabi_dcmplt>
    2dc6:	b940      	cbnz	r0, 2dda <_dtoa_r+0xbce>
    2dc8:	e9dd 2300 	ldrd	r2, r3, [sp]
    2dcc:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
    2dd0:	f004 fa56 	bl	7280 <__aeabi_dcmpeq>
    2dd4:	b118      	cbz	r0, 2dde <_dtoa_r+0xbd2>
    2dd6:	07f3      	lsls	r3, r6, #31
    2dd8:	d501      	bpl.n	2dde <_dtoa_r+0xbd2>
    2dda:	9a05      	ldr	r2, [sp, #20]
    2ddc:	e435      	b.n	264a <_dtoa_r+0x43e>
    2dde:	463e      	mov	r6, r7
    2de0:	e5bb      	b.n	295a <_dtoa_r+0x74e>
    2de2:	6879      	ldr	r1, [r7, #4]
    2de4:	9804      	ldr	r0, [sp, #16]
    2de6:	f000 fe2d 	bl	3a44 <_Balloc>
    2dea:	4605      	mov	r5, r0
    2dec:	2800      	cmp	r0, #0
    2dee:	f000 8121 	beq.w	3034 <_dtoa_r+0xe28>
    2df2:	693b      	ldr	r3, [r7, #16]
    2df4:	3302      	adds	r3, #2
    2df6:	009a      	lsls	r2, r3, #2
    2df8:	f107 010c 	add.w	r1, r7, #12
    2dfc:	300c      	adds	r0, #12
    2dfe:	f000 fb63 	bl	34c8 <memcpy>
    2e02:	9804      	ldr	r0, [sp, #16]
    2e04:	4629      	mov	r1, r5
    2e06:	2201      	movs	r2, #1
    2e08:	f001 f886 	bl	3f18 <__lshift>
    2e0c:	4680      	mov	r8, r0
    2e0e:	e603      	b.n	2a18 <_dtoa_r+0x80c>
    2e10:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2e12:	463c      	mov	r4, r7
    2e14:	3501      	adds	r5, #1
    2e16:	4647      	mov	r7, r8
    2e18:	e572      	b.n	2900 <_dtoa_r+0x6f4>
    2e1a:	9c04      	ldr	r4, [sp, #16]
    2e1c:	4639      	mov	r1, r7
    2e1e:	4632      	mov	r2, r6
    2e20:	4620      	mov	r0, r4
    2e22:	f001 f81f 	bl	3e64 <__pow5mult>
    2e26:	4652      	mov	r2, sl
    2e28:	4601      	mov	r1, r0
    2e2a:	4607      	mov	r7, r0
    2e2c:	4620      	mov	r0, r4
    2e2e:	f000 ff63 	bl	3cf8 <__multiply>
    2e32:	4651      	mov	r1, sl
    2e34:	4680      	mov	r8, r0
    2e36:	4620      	mov	r0, r4
    2e38:	f000 fe2a 	bl	3a90 <_Bfree>
    2e3c:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    2e3e:	1b9b      	subs	r3, r3, r6
    2e40:	46c2      	mov	sl, r8
    2e42:	9310      	str	r3, [sp, #64]	@ 0x40
    2e44:	f43f acf8 	beq.w	2838 <_dtoa_r+0x62c>
    2e48:	e4f0      	b.n	282c <_dtoa_r+0x620>
    2e4a:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
    2e4c:	f1c3 0336 	rsb	r3, r3, #54	@ 0x36
    2e50:	e761      	b.n	2d16 <_dtoa_r+0xb0a>
    2e52:	bf00      	nop
    2e54:	00007498 	.word	0x00007498
    2e58:	7ff00000 	.word	0x7ff00000
    2e5c:	00007590 	.word	0x00007590
    2e60:	00007680 	.word	0x00007680
    2e64:	e9dd 2316 	ldrd	r2, r3, [sp, #88]	@ 0x58
    2e68:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
    2e6c:	f003 ffa0 	bl	6db0 <__aeabi_dmul>
    2e70:	9b05      	ldr	r3, [sp, #20]
    2e72:	701c      	strb	r4, [r3, #0]
    2e74:	9b18      	ldr	r3, [sp, #96]	@ 0x60
    2e76:	2b01      	cmp	r3, #1
    2e78:	e9cd 010e 	strd	r0, r1, [sp, #56]	@ 0x38
    2e7c:	f000 80c3 	beq.w	3006 <_dtoa_r+0xdfa>
    2e80:	9f18      	ldr	r7, [sp, #96]	@ 0x60
    2e82:	9b05      	ldr	r3, [sp, #20]
    2e84:	9612      	str	r6, [sp, #72]	@ 0x48
    2e86:	441f      	add	r7, r3
    2e88:	4b7a      	ldr	r3, [pc, #488]	@ (3074 <_dtoa_r+0xe68>)
    2e8a:	2200      	movs	r2, #0
    2e8c:	4640      	mov	r0, r8
    2e8e:	4649      	mov	r1, r9
    2e90:	f003 ff8e 	bl	6db0 <__aeabi_dmul>
    2e94:	460d      	mov	r5, r1
    2e96:	4604      	mov	r4, r0
    2e98:	f004 fa3a 	bl	7310 <__aeabi_d2iz>
    2e9c:	4681      	mov	r9, r0
    2e9e:	f003 ff1d 	bl	6cdc <__aeabi_i2d>
    2ea2:	f109 0930 	add.w	r9, r9, #48	@ 0x30
    2ea6:	4602      	mov	r2, r0
    2ea8:	460b      	mov	r3, r1
    2eaa:	4620      	mov	r0, r4
    2eac:	4629      	mov	r1, r5
    2eae:	f003 fdc7 	bl	6a40 <__aeabi_dsub>
    2eb2:	f806 9b01 	strb.w	r9, [r6], #1
    2eb6:	42be      	cmp	r6, r7
    2eb8:	4680      	mov	r8, r0
    2eba:	4689      	mov	r9, r1
    2ebc:	d1e4      	bne.n	2e88 <_dtoa_r+0xc7c>
    2ebe:	9d12      	ldr	r5, [sp, #72]	@ 0x48
    2ec0:	4b6d      	ldr	r3, [pc, #436]	@ (3078 <_dtoa_r+0xe6c>)
    2ec2:	2200      	movs	r2, #0
    2ec4:	e9dd 010e 	ldrd	r0, r1, [sp, #56]	@ 0x38
    2ec8:	f003 fdbc 	bl	6a44 <__adddf3>
    2ecc:	4602      	mov	r2, r0
    2ece:	460b      	mov	r3, r1
    2ed0:	4640      	mov	r0, r8
    2ed2:	4649      	mov	r1, r9
    2ed4:	f004 f9fc 	bl	72d0 <__aeabi_dcmpgt>
    2ed8:	2800      	cmp	r0, #0
    2eda:	d16c      	bne.n	2fb6 <_dtoa_r+0xdaa>
    2edc:	e9dd 230e 	ldrd	r2, r3, [sp, #56]	@ 0x38
    2ee0:	4965      	ldr	r1, [pc, #404]	@ (3078 <_dtoa_r+0xe6c>)
    2ee2:	2000      	movs	r0, #0
    2ee4:	f003 fdac 	bl	6a40 <__aeabi_dsub>
    2ee8:	4602      	mov	r2, r0
    2eea:	460b      	mov	r3, r1
    2eec:	4640      	mov	r0, r8
    2eee:	4649      	mov	r1, r9
    2ef0:	f004 f9d0 	bl	7294 <__aeabi_dcmplt>
    2ef4:	b980      	cbnz	r0, 2f18 <_dtoa_r+0xd0c>
    2ef6:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
    2ef8:	2b00      	cmp	r3, #0
    2efa:	f6ff ac7d 	blt.w	27f8 <_dtoa_r+0x5ec>
    2efe:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
    2f00:	2b0e      	cmp	r3, #14
    2f02:	f73f ac79 	bgt.w	27f8 <_dtoa_r+0x5ec>
    2f06:	4b5d      	ldr	r3, [pc, #372]	@ (307c <_dtoa_r+0xe70>)
    2f08:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
    2f0a:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    2f0e:	ed93 7b00 	vldr	d7, [r3]
    2f12:	ed8d 7b02 	vstr	d7, [sp, #8]
    2f16:	e406      	b.n	2726 <_dtoa_r+0x51a>
    2f18:	463e      	mov	r6, r7
    2f1a:	3f01      	subs	r7, #1
    2f1c:	f816 3c01 	ldrb.w	r3, [r6, #-1]
    2f20:	2b30      	cmp	r3, #48	@ 0x30
    2f22:	d0f9      	beq.n	2f18 <_dtoa_r+0xd0c>
    2f24:	9d19      	ldr	r5, [sp, #100]	@ 0x64
    2f26:	3501      	adds	r5, #1
    2f28:	e517      	b.n	295a <_dtoa_r+0x74e>
    2f2a:	e9dd 8900 	ldrd	r8, r9, [sp]
    2f2e:	2702      	movs	r7, #2
    2f30:	f7ff baea 	b.w	2508 <_dtoa_r+0x2fc>
    2f34:	f1bb 0f00 	cmp.w	fp, #0
    2f38:	f43f ab9d 	beq.w	2676 <_dtoa_r+0x46a>
    2f3c:	9c13      	ldr	r4, [sp, #76]	@ 0x4c
    2f3e:	2c00      	cmp	r4, #0
    2f40:	f77f abc2 	ble.w	26c8 <_dtoa_r+0x4bc>
    2f44:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
    2f46:	3b01      	subs	r3, #1
    2f48:	2200      	movs	r2, #0
    2f4a:	4640      	mov	r0, r8
    2f4c:	4649      	mov	r1, r9
    2f4e:	9319      	str	r3, [sp, #100]	@ 0x64
    2f50:	4b48      	ldr	r3, [pc, #288]	@ (3074 <_dtoa_r+0xe68>)
    2f52:	f003 ff2d 	bl	6db0 <__aeabi_dmul>
    2f56:	4680      	mov	r8, r0
    2f58:	4689      	mov	r9, r1
    2f5a:	1c78      	adds	r0, r7, #1
    2f5c:	f003 febe 	bl	6cdc <__aeabi_i2d>
    2f60:	4642      	mov	r2, r8
    2f62:	464b      	mov	r3, r9
    2f64:	f003 ff24 	bl	6db0 <__aeabi_dmul>
    2f68:	4b45      	ldr	r3, [pc, #276]	@ (3080 <_dtoa_r+0xe74>)
    2f6a:	2200      	movs	r2, #0
    2f6c:	f003 fd6a 	bl	6a44 <__adddf3>
    2f70:	f1a1 7350 	sub.w	r3, r1, #54525952	@ 0x3400000
    2f74:	e9cd 0114 	strd	r0, r1, [sp, #80]	@ 0x50
    2f78:	9418      	str	r4, [sp, #96]	@ 0x60
    2f7a:	9315      	str	r3, [sp, #84]	@ 0x54
    2f7c:	f7ff bae6 	b.w	254c <_dtoa_r+0x340>
    2f80:	f108 0801 	add.w	r8, r8, #1
    2f84:	2331      	movs	r3, #49	@ 0x31
    2f86:	f7ff bb67 	b.w	2658 <_dtoa_r+0x44c>
    2f8a:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2f8c:	9a05      	ldr	r2, [sp, #20]
    2f8e:	46b3      	mov	fp, r6
    2f90:	2339      	movs	r3, #57	@ 0x39
    2f92:	463c      	mov	r4, r7
    2f94:	f80b 3b01 	strb.w	r3, [fp], #1
    2f98:	3501      	adds	r5, #1
    2f9a:	4647      	mov	r7, r8
    2f9c:	e4c1      	b.n	2922 <_dtoa_r+0x716>
    2f9e:	2300      	movs	r3, #0
    2fa0:	9300      	str	r3, [sp, #0]
    2fa2:	461f      	mov	r7, r3
    2fa4:	e5e5      	b.n	2b72 <_dtoa_r+0x966>
    2fa6:	9b08      	ldr	r3, [sp, #32]
    2fa8:	445b      	add	r3, fp
    2faa:	9308      	str	r3, [sp, #32]
    2fac:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
    2fae:	461d      	mov	r5, r3
    2fb0:	445b      	add	r3, fp
    2fb2:	930c      	str	r3, [sp, #48]	@ 0x30
    2fb4:	e679      	b.n	2caa <_dtoa_r+0xa9e>
    2fb6:	9b19      	ldr	r3, [sp, #100]	@ 0x64
    2fb8:	9a05      	ldr	r2, [sp, #20]
    2fba:	f103 0801 	add.w	r8, r3, #1
    2fbe:	f7ff bb44 	b.w	264a <_dtoa_r+0x43e>
    2fc2:	f8dd a050 	ldr.w	sl, [sp, #80]	@ 0x50
    2fc6:	e7ad      	b.n	2f24 <_dtoa_r+0xd18>
    2fc8:	f8dd a050 	ldr.w	sl, [sp, #80]	@ 0x50
    2fcc:	f8dd b058 	ldr.w	fp, [sp, #88]	@ 0x58
    2fd0:	f7ff bb7a 	b.w	26c8 <_dtoa_r+0x4bc>
    2fd4:	f1b9 0f39 	cmp.w	r9, #57	@ 0x39
    2fd8:	d0d7      	beq.n	2f8a <_dtoa_r+0xd7e>
    2fda:	2d00      	cmp	r5, #0
    2fdc:	f73f ad8c 	bgt.w	2af8 <_dtoa_r+0x8ec>
    2fe0:	e58c      	b.n	2afc <_dtoa_r+0x8f0>
    2fe2:	9b02      	ldr	r3, [sp, #8]
    2fe4:	2b02      	cmp	r3, #2
    2fe6:	dc03      	bgt.n	2ff0 <_dtoa_r+0xde4>
    2fe8:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
    2fea:	f8dd b04c 	ldr.w	fp, [sp, #76]	@ 0x4c
    2fee:	e464      	b.n	28ba <_dtoa_r+0x6ae>
    2ff0:	f8dd b04c 	ldr.w	fp, [sp, #76]	@ 0x4c
    2ff4:	960d      	str	r6, [sp, #52]	@ 0x34
    2ff6:	e5aa      	b.n	2b4e <_dtoa_r+0x942>
    2ff8:	9b02      	ldr	r3, [sp, #8]
    2ffa:	2b02      	cmp	r3, #2
    2ffc:	dcf8      	bgt.n	2ff0 <_dtoa_r+0xde4>
    2ffe:	f8dd b04c 	ldr.w	fp, [sp, #76]	@ 0x4c
    3002:	960d      	str	r6, [sp, #52]	@ 0x34
    3004:	e4fb      	b.n	29fe <_dtoa_r+0x7f2>
    3006:	4637      	mov	r7, r6
    3008:	e75a      	b.n	2ec0 <_dtoa_r+0xcb4>
    300a:	e9dd 8914 	ldrd	r8, r9, [sp, #80]	@ 0x50
    300e:	2702      	movs	r7, #2
    3010:	f7ff ba7a 	b.w	2508 <_dtoa_r+0x2fc>
    3014:	9b04      	ldr	r3, [sp, #16]
    3016:	2500      	movs	r5, #0
    3018:	63dd      	str	r5, [r3, #60]	@ 0x3c
    301a:	4629      	mov	r1, r5
    301c:	4618      	mov	r0, r3
    301e:	f000 fd11 	bl	3a44 <_Balloc>
    3022:	9005      	str	r0, [sp, #20]
    3024:	b9d0      	cbnz	r0, 305c <_dtoa_r+0xe50>
    3026:	4b17      	ldr	r3, [pc, #92]	@ (3084 <_dtoa_r+0xe78>)
    3028:	4817      	ldr	r0, [pc, #92]	@ (3088 <_dtoa_r+0xe7c>)
    302a:	2200      	movs	r2, #0
    302c:	f240 11af 	movw	r1, #431	@ 0x1af
    3030:	f000 fce2 	bl	39f8 <__assert_func>
    3034:	4b13      	ldr	r3, [pc, #76]	@ (3084 <_dtoa_r+0xe78>)
    3036:	4814      	ldr	r0, [pc, #80]	@ (3088 <_dtoa_r+0xe7c>)
    3038:	462a      	mov	r2, r5
    303a:	f240 21ef 	movw	r1, #751	@ 0x2ef
    303e:	f000 fcdb 	bl	39f8 <__assert_func>
    3042:	2a00      	cmp	r2, #0
    3044:	f73f ad48 	bgt.w	2ad8 <_dtoa_r+0x8cc>
    3048:	e558      	b.n	2afc <_dtoa_r+0x8f0>
    304a:	9b04      	ldr	r3, [sp, #16]
    304c:	2100      	movs	r1, #0
    304e:	63d9      	str	r1, [r3, #60]	@ 0x3c
    3050:	f7ff ba14 	b.w	247c <_dtoa_r+0x270>
    3054:	4b0d      	ldr	r3, [pc, #52]	@ (308c <_dtoa_r+0xe80>)
    3056:	9305      	str	r3, [sp, #20]
    3058:	f7ff b916 	b.w	2288 <_dtoa_r+0x7c>
    305c:	e9dd 3204 	ldrd	r3, r2, [sp, #16]
    3060:	639a      	str	r2, [r3, #56]	@ 0x38
    3062:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    3066:	2201      	movs	r2, #1
    3068:	950b      	str	r5, [sp, #44]	@ 0x2c
    306a:	9313      	str	r3, [sp, #76]	@ 0x4c
    306c:	920e      	str	r2, [sp, #56]	@ 0x38
    306e:	469b      	mov	fp, r3
    3070:	f7ff bb2a 	b.w	26c8 <_dtoa_r+0x4bc>
    3074:	40240000 	.word	0x40240000
    3078:	3fe00000 	.word	0x3fe00000
    307c:	00007590 	.word	0x00007590
    3080:	401c0000 	.word	0x401c0000
    3084:	0000749c 	.word	0x0000749c
    3088:	000074b0 	.word	0x000074b0
    308c:	0000748c 	.word	0x0000748c

00003090 <__swsetup_r>:
    3090:	b538      	push	{r3, r4, r5, lr}
    3092:	4b2f      	ldr	r3, [pc, #188]	@ (3150 <__swsetup_r+0xc0>)
    3094:	681b      	ldr	r3, [r3, #0]
    3096:	4605      	mov	r5, r0
    3098:	460c      	mov	r4, r1
    309a:	b113      	cbz	r3, 30a2 <__swsetup_r+0x12>
    309c:	6b5a      	ldr	r2, [r3, #52]	@ 0x34
    309e:	2a00      	cmp	r2, #0
    30a0:	d04b      	beq.n	313a <__swsetup_r+0xaa>
    30a2:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    30a6:	0718      	lsls	r0, r3, #28
    30a8:	d51c      	bpl.n	30e4 <__swsetup_r+0x54>
    30aa:	6922      	ldr	r2, [r4, #16]
    30ac:	b322      	cbz	r2, 30f8 <__swsetup_r+0x68>
    30ae:	f013 0101 	ands.w	r1, r3, #1
    30b2:	d007      	beq.n	30c4 <__swsetup_r+0x34>
    30b4:	6961      	ldr	r1, [r4, #20]
    30b6:	2000      	movs	r0, #0
    30b8:	4249      	negs	r1, r1
    30ba:	60a0      	str	r0, [r4, #8]
    30bc:	61a1      	str	r1, [r4, #24]
    30be:	b13a      	cbz	r2, 30d0 <__swsetup_r+0x40>
    30c0:	2000      	movs	r0, #0
    30c2:	bd38      	pop	{r3, r4, r5, pc}
    30c4:	0798      	lsls	r0, r3, #30
    30c6:	bf58      	it	pl
    30c8:	6961      	ldrpl	r1, [r4, #20]
    30ca:	60a1      	str	r1, [r4, #8]
    30cc:	2a00      	cmp	r2, #0
    30ce:	d1f7      	bne.n	30c0 <__swsetup_r+0x30>
    30d0:	0619      	lsls	r1, r3, #24
    30d2:	bf58      	it	pl
    30d4:	4610      	movpl	r0, r2
    30d6:	d5f4      	bpl.n	30c2 <__swsetup_r+0x32>
    30d8:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    30dc:	81a3      	strh	r3, [r4, #12]
    30de:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    30e2:	bd38      	pop	{r3, r4, r5, pc}
    30e4:	06d9      	lsls	r1, r3, #27
    30e6:	d52c      	bpl.n	3142 <__swsetup_r+0xb2>
    30e8:	075a      	lsls	r2, r3, #29
    30ea:	d412      	bmi.n	3112 <__swsetup_r+0x82>
    30ec:	6922      	ldr	r2, [r4, #16]
    30ee:	f043 0308 	orr.w	r3, r3, #8
    30f2:	81a3      	strh	r3, [r4, #12]
    30f4:	2a00      	cmp	r2, #0
    30f6:	d1da      	bne.n	30ae <__swsetup_r+0x1e>
    30f8:	f403 7120 	and.w	r1, r3, #640	@ 0x280
    30fc:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    3100:	d0d5      	beq.n	30ae <__swsetup_r+0x1e>
    3102:	4621      	mov	r1, r4
    3104:	4628      	mov	r0, r5
    3106:	f001 fa25 	bl	4554 <__smakebuf_r>
    310a:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    310e:	6922      	ldr	r2, [r4, #16]
    3110:	e7cd      	b.n	30ae <__swsetup_r+0x1e>
    3112:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    3114:	b151      	cbz	r1, 312c <__swsetup_r+0x9c>
    3116:	f104 0240 	add.w	r2, r4, #64	@ 0x40
    311a:	4291      	cmp	r1, r2
    311c:	d004      	beq.n	3128 <__swsetup_r+0x98>
    311e:	4628      	mov	r0, r5
    3120:	f000 f874 	bl	320c <_free_r>
    3124:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    3128:	2200      	movs	r2, #0
    312a:	6322      	str	r2, [r4, #48]	@ 0x30
    312c:	6922      	ldr	r2, [r4, #16]
    312e:	2100      	movs	r1, #0
    3130:	e9c4 2100 	strd	r2, r1, [r4]
    3134:	f023 0324 	bic.w	r3, r3, #36	@ 0x24
    3138:	e7d9      	b.n	30ee <__swsetup_r+0x5e>
    313a:	4618      	mov	r0, r3
    313c:	f000 fb8c 	bl	3858 <__sinit>
    3140:	e7af      	b.n	30a2 <__swsetup_r+0x12>
    3142:	2209      	movs	r2, #9
    3144:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    3148:	602a      	str	r2, [r5, #0]
    314a:	81a3      	strh	r3, [r4, #12]
    314c:	e7c7      	b.n	30de <__swsetup_r+0x4e>
    314e:	bf00      	nop
    3150:	000078b8 	.word	0x000078b8

00003154 <_malloc_trim_r>:
    3154:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    3158:	4606      	mov	r6, r0
    315a:	2008      	movs	r0, #8
    315c:	4689      	mov	r9, r1
    315e:	f000 fa4d 	bl	35fc <sysconf>
    3162:	f8df 80a4 	ldr.w	r8, [pc, #164]	@ 3208 <_malloc_trim_r+0xb4>
    3166:	4605      	mov	r5, r0
    3168:	4630      	mov	r0, r6
    316a:	f000 fa87 	bl	367c <__malloc_lock>
    316e:	f8d8 3008 	ldr.w	r3, [r8, #8]
    3172:	685f      	ldr	r7, [r3, #4]
    3174:	f027 0703 	bic.w	r7, r7, #3
    3178:	f1a7 0411 	sub.w	r4, r7, #17
    317c:	eba4 0409 	sub.w	r4, r4, r9
    3180:	442c      	add	r4, r5
    3182:	fbb4 f4f5 	udiv	r4, r4, r5
    3186:	3c01      	subs	r4, #1
    3188:	fb05 f404 	mul.w	r4, r5, r4
    318c:	42a5      	cmp	r5, r4
    318e:	dc08      	bgt.n	31a2 <_malloc_trim_r+0x4e>
    3190:	2100      	movs	r1, #0
    3192:	4630      	mov	r0, r6
    3194:	f000 fb88 	bl	38a8 <_sbrk_r>
    3198:	f8d8 3008 	ldr.w	r3, [r8, #8]
    319c:	443b      	add	r3, r7
    319e:	4298      	cmp	r0, r3
    31a0:	d005      	beq.n	31ae <_malloc_trim_r+0x5a>
    31a2:	4630      	mov	r0, r6
    31a4:	f000 fa6c 	bl	3680 <__malloc_unlock>
    31a8:	2000      	movs	r0, #0
    31aa:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    31ae:	4261      	negs	r1, r4
    31b0:	4630      	mov	r0, r6
    31b2:	f000 fb79 	bl	38a8 <_sbrk_r>
    31b6:	3001      	adds	r0, #1
    31b8:	d00f      	beq.n	31da <_malloc_trim_r+0x86>
    31ba:	4a11      	ldr	r2, [pc, #68]	@ (3200 <_malloc_trim_r+0xac>)
    31bc:	f8d8 3008 	ldr.w	r3, [r8, #8]
    31c0:	1b3f      	subs	r7, r7, r4
    31c2:	f047 0701 	orr.w	r7, r7, #1
    31c6:	605f      	str	r7, [r3, #4]
    31c8:	6813      	ldr	r3, [r2, #0]
    31ca:	4630      	mov	r0, r6
    31cc:	1b1b      	subs	r3, r3, r4
    31ce:	6013      	str	r3, [r2, #0]
    31d0:	f000 fa56 	bl	3680 <__malloc_unlock>
    31d4:	2001      	movs	r0, #1
    31d6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    31da:	2100      	movs	r1, #0
    31dc:	4630      	mov	r0, r6
    31de:	f000 fb63 	bl	38a8 <_sbrk_r>
    31e2:	f8d8 2008 	ldr.w	r2, [r8, #8]
    31e6:	1a83      	subs	r3, r0, r2
    31e8:	2b0f      	cmp	r3, #15
    31ea:	ddda      	ble.n	31a2 <_malloc_trim_r+0x4e>
    31ec:	f043 0301 	orr.w	r3, r3, #1
    31f0:	6053      	str	r3, [r2, #4]
    31f2:	4b04      	ldr	r3, [pc, #16]	@ (3204 <_malloc_trim_r+0xb0>)
    31f4:	4902      	ldr	r1, [pc, #8]	@ (3200 <_malloc_trim_r+0xac>)
    31f6:	681b      	ldr	r3, [r3, #0]
    31f8:	1ac0      	subs	r0, r0, r3
    31fa:	6008      	str	r0, [r1, #0]
    31fc:	e7d1      	b.n	31a2 <_malloc_trim_r+0x4e>
    31fe:	bf00      	nop
    3200:	00008280 	.word	0x00008280
    3204:	00007f60 	.word	0x00007f60
    3208:	00007b58 	.word	0x00007b58

0000320c <_free_r>:
    320c:	2900      	cmp	r1, #0
    320e:	d07c      	beq.n	330a <_free_r+0xfe>
    3210:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3214:	460c      	mov	r4, r1
    3216:	4680      	mov	r8, r0
    3218:	f000 fa30 	bl	367c <__malloc_lock>
    321c:	f854 3c04 	ldr.w	r3, [r4, #-4]
    3220:	4f75      	ldr	r7, [pc, #468]	@ (33f8 <_free_r+0x1ec>)
    3222:	f1a4 0508 	sub.w	r5, r4, #8
    3226:	f023 0101 	bic.w	r1, r3, #1
    322a:	1868      	adds	r0, r5, r1
    322c:	68be      	ldr	r6, [r7, #8]
    322e:	6842      	ldr	r2, [r0, #4]
    3230:	4286      	cmp	r6, r0
    3232:	f022 0203 	bic.w	r2, r2, #3
    3236:	f000 8083 	beq.w	3340 <_free_r+0x134>
    323a:	07de      	lsls	r6, r3, #31
    323c:	6042      	str	r2, [r0, #4]
    323e:	eb00 0c02 	add.w	ip, r0, r2
    3242:	d433      	bmi.n	32ac <_free_r+0xa0>
    3244:	f854 4c08 	ldr.w	r4, [r4, #-8]
    3248:	f8dc 3004 	ldr.w	r3, [ip, #4]
    324c:	1b2d      	subs	r5, r5, r4
    324e:	4421      	add	r1, r4
    3250:	68ac      	ldr	r4, [r5, #8]
    3252:	f107 0c08 	add.w	ip, r7, #8
    3256:	4564      	cmp	r4, ip
    3258:	f003 0301 	and.w	r3, r3, #1
    325c:	d064      	beq.n	3328 <_free_r+0x11c>
    325e:	f8d5 e00c 	ldr.w	lr, [r5, #12]
    3262:	f8c4 e00c 	str.w	lr, [r4, #12]
    3266:	f8ce 4008 	str.w	r4, [lr, #8]
    326a:	2b00      	cmp	r3, #0
    326c:	f000 8081 	beq.w	3372 <_free_r+0x166>
    3270:	f041 0301 	orr.w	r3, r1, #1
    3274:	606b      	str	r3, [r5, #4]
    3276:	6001      	str	r1, [r0, #0]
    3278:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    327c:	d222      	bcs.n	32c4 <_free_r+0xb8>
    327e:	6878      	ldr	r0, [r7, #4]
    3280:	08cb      	lsrs	r3, r1, #3
    3282:	2201      	movs	r2, #1
    3284:	0949      	lsrs	r1, r1, #5
    3286:	3301      	adds	r3, #1
    3288:	408a      	lsls	r2, r1
    328a:	4302      	orrs	r2, r0
    328c:	f857 1033 	ldr.w	r1, [r7, r3, lsl #3]
    3290:	607a      	str	r2, [r7, #4]
    3292:	eb07 02c3 	add.w	r2, r7, r3, lsl #3
    3296:	3a08      	subs	r2, #8
    3298:	e9c5 1202 	strd	r1, r2, [r5, #8]
    329c:	f847 5033 	str.w	r5, [r7, r3, lsl #3]
    32a0:	60cd      	str	r5, [r1, #12]
    32a2:	4640      	mov	r0, r8
    32a4:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    32a8:	f000 b9ea 	b.w	3680 <__malloc_unlock>
    32ac:	f8dc 3004 	ldr.w	r3, [ip, #4]
    32b0:	07db      	lsls	r3, r3, #31
    32b2:	d52b      	bpl.n	330c <_free_r+0x100>
    32b4:	f041 0301 	orr.w	r3, r1, #1
    32b8:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    32bc:	f844 3c04 	str.w	r3, [r4, #-4]
    32c0:	6001      	str	r1, [r0, #0]
    32c2:	d3dc      	bcc.n	327e <_free_r+0x72>
    32c4:	f5b1 6f20 	cmp.w	r1, #2560	@ 0xa00
    32c8:	ea4f 2351 	mov.w	r3, r1, lsr #9
    32cc:	d253      	bcs.n	3376 <_free_r+0x16a>
    32ce:	098b      	lsrs	r3, r1, #6
    32d0:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    32d4:	f103 0238 	add.w	r2, r3, #56	@ 0x38
    32d8:	00c3      	lsls	r3, r0, #3
    32da:	18f8      	adds	r0, r7, r3
    32dc:	58fb      	ldr	r3, [r7, r3]
    32de:	3808      	subs	r0, #8
    32e0:	4298      	cmp	r0, r3
    32e2:	d103      	bne.n	32ec <_free_r+0xe0>
    32e4:	e061      	b.n	33aa <_free_r+0x19e>
    32e6:	689b      	ldr	r3, [r3, #8]
    32e8:	4298      	cmp	r0, r3
    32ea:	d004      	beq.n	32f6 <_free_r+0xea>
    32ec:	685a      	ldr	r2, [r3, #4]
    32ee:	f022 0203 	bic.w	r2, r2, #3
    32f2:	428a      	cmp	r2, r1
    32f4:	d8f7      	bhi.n	32e6 <_free_r+0xda>
    32f6:	68d8      	ldr	r0, [r3, #12]
    32f8:	e9c5 3002 	strd	r3, r0, [r5, #8]
    32fc:	6085      	str	r5, [r0, #8]
    32fe:	60dd      	str	r5, [r3, #12]
    3300:	4640      	mov	r0, r8
    3302:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3306:	f000 b9bb 	b.w	3680 <__malloc_unlock>
    330a:	4770      	bx	lr
    330c:	4411      	add	r1, r2
    330e:	f107 0c08 	add.w	ip, r7, #8
    3312:	6883      	ldr	r3, [r0, #8]
    3314:	4563      	cmp	r3, ip
    3316:	d03f      	beq.n	3398 <_free_r+0x18c>
    3318:	68c2      	ldr	r2, [r0, #12]
    331a:	60da      	str	r2, [r3, #12]
    331c:	6093      	str	r3, [r2, #8]
    331e:	f041 0301 	orr.w	r3, r1, #1
    3322:	606b      	str	r3, [r5, #4]
    3324:	5069      	str	r1, [r5, r1]
    3326:	e7a7      	b.n	3278 <_free_r+0x6c>
    3328:	2b00      	cmp	r3, #0
    332a:	d15f      	bne.n	33ec <_free_r+0x1e0>
    332c:	440a      	add	r2, r1
    332e:	e9d0 1302 	ldrd	r1, r3, [r0, #8]
    3332:	60cb      	str	r3, [r1, #12]
    3334:	6099      	str	r1, [r3, #8]
    3336:	f042 0301 	orr.w	r3, r2, #1
    333a:	606b      	str	r3, [r5, #4]
    333c:	50aa      	str	r2, [r5, r2]
    333e:	e7b0      	b.n	32a2 <_free_r+0x96>
    3340:	07db      	lsls	r3, r3, #31
    3342:	440a      	add	r2, r1
    3344:	d407      	bmi.n	3356 <_free_r+0x14a>
    3346:	f854 3c08 	ldr.w	r3, [r4, #-8]
    334a:	1aed      	subs	r5, r5, r3
    334c:	441a      	add	r2, r3
    334e:	e9d5 1302 	ldrd	r1, r3, [r5, #8]
    3352:	60cb      	str	r3, [r1, #12]
    3354:	6099      	str	r1, [r3, #8]
    3356:	f042 0301 	orr.w	r3, r2, #1
    335a:	606b      	str	r3, [r5, #4]
    335c:	4b27      	ldr	r3, [pc, #156]	@ (33fc <_free_r+0x1f0>)
    335e:	60bd      	str	r5, [r7, #8]
    3360:	681b      	ldr	r3, [r3, #0]
    3362:	4293      	cmp	r3, r2
    3364:	d89d      	bhi.n	32a2 <_free_r+0x96>
    3366:	4b26      	ldr	r3, [pc, #152]	@ (3400 <_free_r+0x1f4>)
    3368:	4640      	mov	r0, r8
    336a:	6819      	ldr	r1, [r3, #0]
    336c:	f7ff fef2 	bl	3154 <_malloc_trim_r>
    3370:	e797      	b.n	32a2 <_free_r+0x96>
    3372:	4411      	add	r1, r2
    3374:	e7cd      	b.n	3312 <_free_r+0x106>
    3376:	2b14      	cmp	r3, #20
    3378:	d908      	bls.n	338c <_free_r+0x180>
    337a:	2b54      	cmp	r3, #84	@ 0x54
    337c:	d81d      	bhi.n	33ba <_free_r+0x1ae>
    337e:	0b0b      	lsrs	r3, r1, #12
    3380:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    3384:	f103 026e 	add.w	r2, r3, #110	@ 0x6e
    3388:	00c3      	lsls	r3, r0, #3
    338a:	e7a6      	b.n	32da <_free_r+0xce>
    338c:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    3390:	f103 025b 	add.w	r2, r3, #91	@ 0x5b
    3394:	00c3      	lsls	r3, r0, #3
    3396:	e7a0      	b.n	32da <_free_r+0xce>
    3398:	f041 0301 	orr.w	r3, r1, #1
    339c:	e9c7 5504 	strd	r5, r5, [r7, #16]
    33a0:	e9c5 cc02 	strd	ip, ip, [r5, #8]
    33a4:	606b      	str	r3, [r5, #4]
    33a6:	5069      	str	r1, [r5, r1]
    33a8:	e77b      	b.n	32a2 <_free_r+0x96>
    33aa:	6879      	ldr	r1, [r7, #4]
    33ac:	1092      	asrs	r2, r2, #2
    33ae:	2401      	movs	r4, #1
    33b0:	fa04 f202 	lsl.w	r2, r4, r2
    33b4:	430a      	orrs	r2, r1
    33b6:	607a      	str	r2, [r7, #4]
    33b8:	e79e      	b.n	32f8 <_free_r+0xec>
    33ba:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    33be:	d806      	bhi.n	33ce <_free_r+0x1c2>
    33c0:	0bcb      	lsrs	r3, r1, #15
    33c2:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    33c6:	f103 0277 	add.w	r2, r3, #119	@ 0x77
    33ca:	00c3      	lsls	r3, r0, #3
    33cc:	e785      	b.n	32da <_free_r+0xce>
    33ce:	f240 5254 	movw	r2, #1364	@ 0x554
    33d2:	4293      	cmp	r3, r2
    33d4:	d806      	bhi.n	33e4 <_free_r+0x1d8>
    33d6:	0c8b      	lsrs	r3, r1, #18
    33d8:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    33dc:	f103 027c 	add.w	r2, r3, #124	@ 0x7c
    33e0:	00c3      	lsls	r3, r0, #3
    33e2:	e77a      	b.n	32da <_free_r+0xce>
    33e4:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    33e8:	227e      	movs	r2, #126	@ 0x7e
    33ea:	e776      	b.n	32da <_free_r+0xce>
    33ec:	f041 0301 	orr.w	r3, r1, #1
    33f0:	606b      	str	r3, [r5, #4]
    33f2:	6001      	str	r1, [r0, #0]
    33f4:	e755      	b.n	32a2 <_free_r+0x96>
    33f6:	bf00      	nop
    33f8:	00007b58 	.word	0x00007b58
    33fc:	00007f64 	.word	0x00007f64
    3400:	0000827c 	.word	0x0000827c

00003404 <__call_exitprocs>:
    3404:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3408:	4f29      	ldr	r7, [pc, #164]	@ (34b0 <__call_exitprocs+0xac>)
    340a:	b083      	sub	sp, #12
    340c:	683e      	ldr	r6, [r7, #0]
    340e:	9001      	str	r0, [sp, #4]
    3410:	b35e      	cbz	r6, 346a <__call_exitprocs+0x66>
    3412:	468b      	mov	fp, r1
    3414:	f04f 0900 	mov.w	r9, #0
    3418:	f04f 0801 	mov.w	r8, #1
    341c:	6874      	ldr	r4, [r6, #4]
    341e:	1e65      	subs	r5, r4, #1
    3420:	d423      	bmi.n	346a <__call_exitprocs+0x66>
    3422:	3401      	adds	r4, #1
    3424:	eb06 0484 	add.w	r4, r6, r4, lsl #2
    3428:	f1bb 0f00 	cmp.w	fp, #0
    342c:	d120      	bne.n	3470 <__call_exitprocs+0x6c>
    342e:	6873      	ldr	r3, [r6, #4]
    3430:	6822      	ldr	r2, [r4, #0]
    3432:	3b01      	subs	r3, #1
    3434:	42ab      	cmp	r3, r5
    3436:	bf0c      	ite	eq
    3438:	6075      	streq	r5, [r6, #4]
    343a:	f8c4 9000 	strne.w	r9, [r4]
    343e:	b17a      	cbz	r2, 3460 <__call_exitprocs+0x5c>
    3440:	f8d6 1188 	ldr.w	r1, [r6, #392]	@ 0x188
    3444:	f8d6 a004 	ldr.w	sl, [r6, #4]
    3448:	fa08 fc05 	lsl.w	ip, r8, r5
    344c:	ea1c 0f01 	tst.w	ip, r1
    3450:	d11a      	bne.n	3488 <__call_exitprocs+0x84>
    3452:	4790      	blx	r2
    3454:	6871      	ldr	r1, [r6, #4]
    3456:	683a      	ldr	r2, [r7, #0]
    3458:	4551      	cmp	r1, sl
    345a:	d122      	bne.n	34a2 <__call_exitprocs+0x9e>
    345c:	42b2      	cmp	r2, r6
    345e:	d120      	bne.n	34a2 <__call_exitprocs+0x9e>
    3460:	3d01      	subs	r5, #1
    3462:	1c6b      	adds	r3, r5, #1
    3464:	f1a4 0404 	sub.w	r4, r4, #4
    3468:	d1de      	bne.n	3428 <__call_exitprocs+0x24>
    346a:	b003      	add	sp, #12
    346c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3470:	f8d4 3100 	ldr.w	r3, [r4, #256]	@ 0x100
    3474:	455b      	cmp	r3, fp
    3476:	d0da      	beq.n	342e <__call_exitprocs+0x2a>
    3478:	3d01      	subs	r5, #1
    347a:	1c6a      	adds	r2, r5, #1
    347c:	f1a4 0404 	sub.w	r4, r4, #4
    3480:	d1f6      	bne.n	3470 <__call_exitprocs+0x6c>
    3482:	b003      	add	sp, #12
    3484:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3488:	f8d6 318c 	ldr.w	r3, [r6, #396]	@ 0x18c
    348c:	f8d4 1080 	ldr.w	r1, [r4, #128]	@ 0x80
    3490:	ea1c 0f03 	tst.w	ip, r3
    3494:	d109      	bne.n	34aa <__call_exitprocs+0xa6>
    3496:	9801      	ldr	r0, [sp, #4]
    3498:	4790      	blx	r2
    349a:	6871      	ldr	r1, [r6, #4]
    349c:	683a      	ldr	r2, [r7, #0]
    349e:	4551      	cmp	r1, sl
    34a0:	d0dc      	beq.n	345c <__call_exitprocs+0x58>
    34a2:	2a00      	cmp	r2, #0
    34a4:	d0e1      	beq.n	346a <__call_exitprocs+0x66>
    34a6:	4616      	mov	r6, r2
    34a8:	e7b8      	b.n	341c <__call_exitprocs+0x18>
    34aa:	4608      	mov	r0, r1
    34ac:	4790      	blx	r2
    34ae:	e7d1      	b.n	3454 <__call_exitprocs+0x50>
    34b0:	00007fa8 	.word	0x00007fa8

000034b4 <register_fini>:
    34b4:	4b02      	ldr	r3, [pc, #8]	@ (34c0 <register_fini+0xc>)
    34b6:	b113      	cbz	r3, 34be <register_fini+0xa>
    34b8:	4802      	ldr	r0, [pc, #8]	@ (34c4 <register_fini+0x10>)
    34ba:	f7fd ba51 	b.w	960 <atexit>
    34be:	4770      	bx	lr
    34c0:	00000000 	.word	0x00000000
    34c4:	000009b5 	.word	0x000009b5

000034c8 <memcpy>:
    34c8:	4684      	mov	ip, r0
    34ca:	ea41 0300 	orr.w	r3, r1, r0
    34ce:	f013 0303 	ands.w	r3, r3, #3
    34d2:	d16d      	bne.n	35b0 <memcpy+0xe8>
    34d4:	3a40      	subs	r2, #64	@ 0x40
    34d6:	d341      	bcc.n	355c <memcpy+0x94>
    34d8:	f851 3b04 	ldr.w	r3, [r1], #4
    34dc:	f840 3b04 	str.w	r3, [r0], #4
    34e0:	f851 3b04 	ldr.w	r3, [r1], #4
    34e4:	f840 3b04 	str.w	r3, [r0], #4
    34e8:	f851 3b04 	ldr.w	r3, [r1], #4
    34ec:	f840 3b04 	str.w	r3, [r0], #4
    34f0:	f851 3b04 	ldr.w	r3, [r1], #4
    34f4:	f840 3b04 	str.w	r3, [r0], #4
    34f8:	f851 3b04 	ldr.w	r3, [r1], #4
    34fc:	f840 3b04 	str.w	r3, [r0], #4
    3500:	f851 3b04 	ldr.w	r3, [r1], #4
    3504:	f840 3b04 	str.w	r3, [r0], #4
    3508:	f851 3b04 	ldr.w	r3, [r1], #4
    350c:	f840 3b04 	str.w	r3, [r0], #4
    3510:	f851 3b04 	ldr.w	r3, [r1], #4
    3514:	f840 3b04 	str.w	r3, [r0], #4
    3518:	f851 3b04 	ldr.w	r3, [r1], #4
    351c:	f840 3b04 	str.w	r3, [r0], #4
    3520:	f851 3b04 	ldr.w	r3, [r1], #4
    3524:	f840 3b04 	str.w	r3, [r0], #4
    3528:	f851 3b04 	ldr.w	r3, [r1], #4
    352c:	f840 3b04 	str.w	r3, [r0], #4
    3530:	f851 3b04 	ldr.w	r3, [r1], #4
    3534:	f840 3b04 	str.w	r3, [r0], #4
    3538:	f851 3b04 	ldr.w	r3, [r1], #4
    353c:	f840 3b04 	str.w	r3, [r0], #4
    3540:	f851 3b04 	ldr.w	r3, [r1], #4
    3544:	f840 3b04 	str.w	r3, [r0], #4
    3548:	f851 3b04 	ldr.w	r3, [r1], #4
    354c:	f840 3b04 	str.w	r3, [r0], #4
    3550:	f851 3b04 	ldr.w	r3, [r1], #4
    3554:	f840 3b04 	str.w	r3, [r0], #4
    3558:	3a40      	subs	r2, #64	@ 0x40
    355a:	d2bd      	bcs.n	34d8 <memcpy+0x10>
    355c:	3230      	adds	r2, #48	@ 0x30
    355e:	d311      	bcc.n	3584 <memcpy+0xbc>
    3560:	f851 3b04 	ldr.w	r3, [r1], #4
    3564:	f840 3b04 	str.w	r3, [r0], #4
    3568:	f851 3b04 	ldr.w	r3, [r1], #4
    356c:	f840 3b04 	str.w	r3, [r0], #4
    3570:	f851 3b04 	ldr.w	r3, [r1], #4
    3574:	f840 3b04 	str.w	r3, [r0], #4
    3578:	f851 3b04 	ldr.w	r3, [r1], #4
    357c:	f840 3b04 	str.w	r3, [r0], #4
    3580:	3a10      	subs	r2, #16
    3582:	d2ed      	bcs.n	3560 <memcpy+0x98>
    3584:	320c      	adds	r2, #12
    3586:	d305      	bcc.n	3594 <memcpy+0xcc>
    3588:	f851 3b04 	ldr.w	r3, [r1], #4
    358c:	f840 3b04 	str.w	r3, [r0], #4
    3590:	3a04      	subs	r2, #4
    3592:	d2f9      	bcs.n	3588 <memcpy+0xc0>
    3594:	3204      	adds	r2, #4
    3596:	d008      	beq.n	35aa <memcpy+0xe2>
    3598:	07d2      	lsls	r2, r2, #31
    359a:	bf1c      	itt	ne
    359c:	f811 3b01 	ldrbne.w	r3, [r1], #1
    35a0:	f800 3b01 	strbne.w	r3, [r0], #1
    35a4:	d301      	bcc.n	35aa <memcpy+0xe2>
    35a6:	880b      	ldrh	r3, [r1, #0]
    35a8:	8003      	strh	r3, [r0, #0]
    35aa:	4660      	mov	r0, ip
    35ac:	4770      	bx	lr
    35ae:	bf00      	nop
    35b0:	2a08      	cmp	r2, #8
    35b2:	d313      	bcc.n	35dc <memcpy+0x114>
    35b4:	078b      	lsls	r3, r1, #30
    35b6:	d08d      	beq.n	34d4 <memcpy+0xc>
    35b8:	f010 0303 	ands.w	r3, r0, #3
    35bc:	d08a      	beq.n	34d4 <memcpy+0xc>
    35be:	f1c3 0304 	rsb	r3, r3, #4
    35c2:	1ad2      	subs	r2, r2, r3
    35c4:	07db      	lsls	r3, r3, #31
    35c6:	bf1c      	itt	ne
    35c8:	f811 3b01 	ldrbne.w	r3, [r1], #1
    35cc:	f800 3b01 	strbne.w	r3, [r0], #1
    35d0:	d380      	bcc.n	34d4 <memcpy+0xc>
    35d2:	f831 3b02 	ldrh.w	r3, [r1], #2
    35d6:	f820 3b02 	strh.w	r3, [r0], #2
    35da:	e77b      	b.n	34d4 <memcpy+0xc>
    35dc:	3a04      	subs	r2, #4
    35de:	d3d9      	bcc.n	3594 <memcpy+0xcc>
    35e0:	3a01      	subs	r2, #1
    35e2:	f811 3b01 	ldrb.w	r3, [r1], #1
    35e6:	f800 3b01 	strb.w	r3, [r0], #1
    35ea:	d2f9      	bcs.n	35e0 <memcpy+0x118>
    35ec:	780b      	ldrb	r3, [r1, #0]
    35ee:	7003      	strb	r3, [r0, #0]
    35f0:	784b      	ldrb	r3, [r1, #1]
    35f2:	7043      	strb	r3, [r0, #1]
    35f4:	788b      	ldrb	r3, [r1, #2]
    35f6:	7083      	strb	r3, [r0, #2]
    35f8:	4660      	mov	r0, ip
    35fa:	4770      	bx	lr

000035fc <sysconf>:
    35fc:	2808      	cmp	r0, #8
    35fe:	d102      	bne.n	3606 <sysconf+0xa>
    3600:	f44f 5080 	mov.w	r0, #4096	@ 0x1000
    3604:	4770      	bx	lr
    3606:	b508      	push	{r3, lr}
    3608:	f001 fa1a 	bl	4a40 <__errno>
    360c:	2316      	movs	r3, #22
    360e:	6003      	str	r3, [r0, #0]
    3610:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3614:	bd08      	pop	{r3, pc}
    3616:	bf00      	nop

00003618 <__register_exitproc>:
    3618:	b470      	push	{r4, r5, r6}
    361a:	4d16      	ldr	r5, [pc, #88]	@ (3674 <__register_exitproc+0x5c>)
    361c:	682c      	ldr	r4, [r5, #0]
    361e:	b31c      	cbz	r4, 3668 <__register_exitproc+0x50>
    3620:	6865      	ldr	r5, [r4, #4]
    3622:	2d1f      	cmp	r5, #31
    3624:	dc23      	bgt.n	366e <__register_exitproc+0x56>
    3626:	b938      	cbnz	r0, 3638 <__register_exitproc+0x20>
    3628:	1cab      	adds	r3, r5, #2
    362a:	3501      	adds	r5, #1
    362c:	6065      	str	r5, [r4, #4]
    362e:	f844 1023 	str.w	r1, [r4, r3, lsl #2]
    3632:	2000      	movs	r0, #0
    3634:	bc70      	pop	{r4, r5, r6}
    3636:	4770      	bx	lr
    3638:	eb04 0c85 	add.w	ip, r4, r5, lsl #2
    363c:	2802      	cmp	r0, #2
    363e:	f8cc 2088 	str.w	r2, [ip, #136]	@ 0x88
    3642:	f8d4 6188 	ldr.w	r6, [r4, #392]	@ 0x188
    3646:	f04f 0201 	mov.w	r2, #1
    364a:	fa02 f205 	lsl.w	r2, r2, r5
    364e:	ea46 0602 	orr.w	r6, r6, r2
    3652:	f8c4 6188 	str.w	r6, [r4, #392]	@ 0x188
    3656:	f8cc 3108 	str.w	r3, [ip, #264]	@ 0x108
    365a:	d1e5      	bne.n	3628 <__register_exitproc+0x10>
    365c:	f8d4 318c 	ldr.w	r3, [r4, #396]	@ 0x18c
    3660:	4313      	orrs	r3, r2
    3662:	f8c4 318c 	str.w	r3, [r4, #396]	@ 0x18c
    3666:	e7df      	b.n	3628 <__register_exitproc+0x10>
    3668:	4c03      	ldr	r4, [pc, #12]	@ (3678 <__register_exitproc+0x60>)
    366a:	602c      	str	r4, [r5, #0]
    366c:	e7d8      	b.n	3620 <__register_exitproc+0x8>
    366e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3672:	e7df      	b.n	3634 <__register_exitproc+0x1c>
    3674:	00007fa8 	.word	0x00007fa8
    3678:	00007fac 	.word	0x00007fac

0000367c <__malloc_lock>:
    367c:	4770      	bx	lr
    367e:	bf00      	nop

00003680 <__malloc_unlock>:
    3680:	4770      	bx	lr
    3682:	bf00      	nop

00003684 <__fp_lock>:
    3684:	2000      	movs	r0, #0
    3686:	4770      	bx	lr

00003688 <stdio_exit_handler>:
    3688:	4a02      	ldr	r2, [pc, #8]	@ (3694 <stdio_exit_handler+0xc>)
    368a:	4903      	ldr	r1, [pc, #12]	@ (3698 <stdio_exit_handler+0x10>)
    368c:	4803      	ldr	r0, [pc, #12]	@ (369c <stdio_exit_handler+0x14>)
    368e:	f000 bf35 	b.w	44fc <_fwalk_sglue>
    3692:	bf00      	nop
    3694:	000079e0 	.word	0x000079e0
    3698:	00005061 	.word	0x00005061
    369c:	000078c0 	.word	0x000078c0

000036a0 <cleanup_stdio>:
    36a0:	4b0c      	ldr	r3, [pc, #48]	@ (36d4 <cleanup_stdio+0x34>)
    36a2:	6841      	ldr	r1, [r0, #4]
    36a4:	4299      	cmp	r1, r3
    36a6:	b510      	push	{r4, lr}
    36a8:	4604      	mov	r4, r0
    36aa:	d001      	beq.n	36b0 <cleanup_stdio+0x10>
    36ac:	f001 fcd8 	bl	5060 <_fclose_r>
    36b0:	68a1      	ldr	r1, [r4, #8]
    36b2:	4b09      	ldr	r3, [pc, #36]	@ (36d8 <cleanup_stdio+0x38>)
    36b4:	4299      	cmp	r1, r3
    36b6:	d002      	beq.n	36be <cleanup_stdio+0x1e>
    36b8:	4620      	mov	r0, r4
    36ba:	f001 fcd1 	bl	5060 <_fclose_r>
    36be:	68e1      	ldr	r1, [r4, #12]
    36c0:	4b06      	ldr	r3, [pc, #24]	@ (36dc <cleanup_stdio+0x3c>)
    36c2:	4299      	cmp	r1, r3
    36c4:	d004      	beq.n	36d0 <cleanup_stdio+0x30>
    36c6:	4620      	mov	r0, r4
    36c8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    36cc:	f001 bcc8 	b.w	5060 <_fclose_r>
    36d0:	bd10      	pop	{r4, pc}
    36d2:	bf00      	nop
    36d4:	0000813c 	.word	0x0000813c
    36d8:	000081a4 	.word	0x000081a4
    36dc:	0000820c 	.word	0x0000820c

000036e0 <__fp_unlock>:
    36e0:	2000      	movs	r0, #0
    36e2:	4770      	bx	lr

000036e4 <global_stdio_init.part.0>:
    36e4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    36e8:	4c2a      	ldr	r4, [pc, #168]	@ (3794 <global_stdio_init.part.0+0xb0>)
    36ea:	492b      	ldr	r1, [pc, #172]	@ (3798 <global_stdio_init.part.0+0xb4>)
    36ec:	f8df 90bc 	ldr.w	r9, [pc, #188]	@ 37ac <global_stdio_init.part.0+0xc8>
    36f0:	f8df 80bc 	ldr.w	r8, [pc, #188]	@ 37b0 <global_stdio_init.part.0+0xcc>
    36f4:	4f29      	ldr	r7, [pc, #164]	@ (379c <global_stdio_init.part.0+0xb8>)
    36f6:	f8c4 1138 	str.w	r1, [r4, #312]	@ 0x138
    36fa:	2500      	movs	r5, #0
    36fc:	2304      	movs	r3, #4
    36fe:	2208      	movs	r2, #8
    3700:	4629      	mov	r1, r5
    3702:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    3706:	4e26      	ldr	r6, [pc, #152]	@ (37a0 <global_stdio_init.part.0+0xbc>)
    3708:	60e3      	str	r3, [r4, #12]
    370a:	e9c4 5500 	strd	r5, r5, [r4]
    370e:	e9c4 5504 	strd	r5, r5, [r4, #16]
    3712:	60a5      	str	r5, [r4, #8]
    3714:	6665      	str	r5, [r4, #100]	@ 0x64
    3716:	61a5      	str	r5, [r4, #24]
    3718:	f7fd f864 	bl	7e4 <memset>
    371c:	4b21      	ldr	r3, [pc, #132]	@ (37a4 <global_stdio_init.part.0+0xc0>)
    371e:	6763      	str	r3, [r4, #116]	@ 0x74
    3720:	2208      	movs	r2, #8
    3722:	4629      	mov	r1, r5
    3724:	f104 00c4 	add.w	r0, r4, #196	@ 0xc4
    3728:	e9c4 4907 	strd	r4, r9, [r4, #28]
    372c:	e9c4 8709 	strd	r8, r7, [r4, #36]	@ 0x24
    3730:	e9c4 551a 	strd	r5, r5, [r4, #104]	@ 0x68
    3734:	e9c4 551e 	strd	r5, r5, [r4, #120]	@ 0x78
    3738:	6725      	str	r5, [r4, #112]	@ 0x70
    373a:	f8c4 50cc 	str.w	r5, [r4, #204]	@ 0xcc
    373e:	f8c4 5080 	str.w	r5, [r4, #128]	@ 0x80
    3742:	62e6      	str	r6, [r4, #44]	@ 0x2c
    3744:	f7fd f84e 	bl	7e4 <memset>
    3748:	4b17      	ldr	r3, [pc, #92]	@ (37a8 <global_stdio_init.part.0+0xc4>)
    374a:	f8c4 30dc 	str.w	r3, [r4, #220]	@ 0xdc
    374e:	4629      	mov	r1, r5
    3750:	f104 0368 	add.w	r3, r4, #104	@ 0x68
    3754:	2208      	movs	r2, #8
    3756:	f504 7096 	add.w	r0, r4, #300	@ 0x12c
    375a:	f8c4 3084 	str.w	r3, [r4, #132]	@ 0x84
    375e:	e9c4 9822 	strd	r9, r8, [r4, #136]	@ 0x88
    3762:	e9c4 7624 	strd	r7, r6, [r4, #144]	@ 0x90
    3766:	e9c4 5534 	strd	r5, r5, [r4, #208]	@ 0xd0
    376a:	e9c4 5538 	strd	r5, r5, [r4, #224]	@ 0xe0
    376e:	f8c4 50d8 	str.w	r5, [r4, #216]	@ 0xd8
    3772:	f8c4 5134 	str.w	r5, [r4, #308]	@ 0x134
    3776:	f8c4 50e8 	str.w	r5, [r4, #232]	@ 0xe8
    377a:	f7fd f833 	bl	7e4 <memset>
    377e:	f104 03d0 	add.w	r3, r4, #208	@ 0xd0
    3782:	e9c4 983c 	strd	r9, r8, [r4, #240]	@ 0xf0
    3786:	e9c4 763e 	strd	r7, r6, [r4, #248]	@ 0xf8
    378a:	f8c4 30ec 	str.w	r3, [r4, #236]	@ 0xec
    378e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    3792:	bf00      	nop
    3794:	0000813c 	.word	0x0000813c
    3798:	00003689 	.word	0x00003689
    379c:	00005189 	.word	0x00005189
    37a0:	000051ad 	.word	0x000051ad
    37a4:	00010009 	.word	0x00010009
    37a8:	00020012 	.word	0x00020012
    37ac:	00005121 	.word	0x00005121
    37b0:	00005149 	.word	0x00005149

000037b4 <__sfp>:
    37b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    37b6:	4b25      	ldr	r3, [pc, #148]	@ (384c <__sfp+0x98>)
    37b8:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    37bc:	4606      	mov	r6, r0
    37be:	2b00      	cmp	r3, #0
    37c0:	d03c      	beq.n	383c <__sfp+0x88>
    37c2:	4f23      	ldr	r7, [pc, #140]	@ (3850 <__sfp+0x9c>)
    37c4:	e9d7 3401 	ldrd	r3, r4, [r7, #4]
    37c8:	3b01      	subs	r3, #1
    37ca:	d504      	bpl.n	37d6 <__sfp+0x22>
    37cc:	e01d      	b.n	380a <__sfp+0x56>
    37ce:	1c5a      	adds	r2, r3, #1
    37d0:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    37d4:	d019      	beq.n	380a <__sfp+0x56>
    37d6:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
    37da:	3b01      	subs	r3, #1
    37dc:	2d00      	cmp	r5, #0
    37de:	d1f6      	bne.n	37ce <__sfp+0x1a>
    37e0:	4b1c      	ldr	r3, [pc, #112]	@ (3854 <__sfp+0xa0>)
    37e2:	60e3      	str	r3, [r4, #12]
    37e4:	e9c4 5501 	strd	r5, r5, [r4, #4]
    37e8:	e9c4 5504 	strd	r5, r5, [r4, #16]
    37ec:	6665      	str	r5, [r4, #100]	@ 0x64
    37ee:	6025      	str	r5, [r4, #0]
    37f0:	61a5      	str	r5, [r4, #24]
    37f2:	2208      	movs	r2, #8
    37f4:	4629      	mov	r1, r5
    37f6:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    37fa:	f7fc fff3 	bl	7e4 <memset>
    37fe:	e9c4 550c 	strd	r5, r5, [r4, #48]	@ 0x30
    3802:	e9c4 5511 	strd	r5, r5, [r4, #68]	@ 0x44
    3806:	4620      	mov	r0, r4
    3808:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    380a:	683d      	ldr	r5, [r7, #0]
    380c:	b10d      	cbz	r5, 3812 <__sfp+0x5e>
    380e:	462f      	mov	r7, r5
    3810:	e7d8      	b.n	37c4 <__sfp+0x10>
    3812:	f44f 71d6 	mov.w	r1, #428	@ 0x1ac
    3816:	4630      	mov	r0, r6
    3818:	f001 f978 	bl	4b0c <_malloc_r>
    381c:	4604      	mov	r4, r0
    381e:	b180      	cbz	r0, 3842 <__sfp+0x8e>
    3820:	2304      	movs	r3, #4
    3822:	e9c0 5300 	strd	r5, r3, [r0]
    3826:	300c      	adds	r0, #12
    3828:	4629      	mov	r1, r5
    382a:	60a0      	str	r0, [r4, #8]
    382c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
    3830:	4625      	mov	r5, r4
    3832:	f7fc ffd7 	bl	7e4 <memset>
    3836:	603c      	str	r4, [r7, #0]
    3838:	462f      	mov	r7, r5
    383a:	e7c3      	b.n	37c4 <__sfp+0x10>
    383c:	f7ff ff52 	bl	36e4 <global_stdio_init.part.0>
    3840:	e7bf      	b.n	37c2 <__sfp+0xe>
    3842:	230c      	movs	r3, #12
    3844:	6038      	str	r0, [r7, #0]
    3846:	6033      	str	r3, [r6, #0]
    3848:	e7dd      	b.n	3806 <__sfp+0x52>
    384a:	bf00      	nop
    384c:	0000813c 	.word	0x0000813c
    3850:	000079e0 	.word	0x000079e0
    3854:	ffff0001 	.word	0xffff0001

00003858 <__sinit>:
    3858:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    385a:	b103      	cbz	r3, 385e <__sinit+0x6>
    385c:	4770      	bx	lr
    385e:	4b04      	ldr	r3, [pc, #16]	@ (3870 <__sinit+0x18>)
    3860:	4a04      	ldr	r2, [pc, #16]	@ (3874 <__sinit+0x1c>)
    3862:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    3866:	6342      	str	r2, [r0, #52]	@ 0x34
    3868:	2b00      	cmp	r3, #0
    386a:	d1f7      	bne.n	385c <__sinit+0x4>
    386c:	e73a      	b.n	36e4 <global_stdio_init.part.0>
    386e:	bf00      	nop
    3870:	0000813c 	.word	0x0000813c
    3874:	000036a1 	.word	0x000036a1

00003878 <__sfp_lock_acquire>:
    3878:	4770      	bx	lr
    387a:	bf00      	nop

0000387c <__sfp_lock_release>:
    387c:	4770      	bx	lr
    387e:	bf00      	nop

00003880 <__fp_lock_all>:
    3880:	4a02      	ldr	r2, [pc, #8]	@ (388c <__fp_lock_all+0xc>)
    3882:	4903      	ldr	r1, [pc, #12]	@ (3890 <__fp_lock_all+0x10>)
    3884:	2000      	movs	r0, #0
    3886:	f000 be39 	b.w	44fc <_fwalk_sglue>
    388a:	bf00      	nop
    388c:	000079e0 	.word	0x000079e0
    3890:	00003685 	.word	0x00003685

00003894 <__fp_unlock_all>:
    3894:	4a02      	ldr	r2, [pc, #8]	@ (38a0 <__fp_unlock_all+0xc>)
    3896:	4903      	ldr	r1, [pc, #12]	@ (38a4 <__fp_unlock_all+0x10>)
    3898:	2000      	movs	r0, #0
    389a:	f000 be2f 	b.w	44fc <_fwalk_sglue>
    389e:	bf00      	nop
    38a0:	000079e0 	.word	0x000079e0
    38a4:	000036e1 	.word	0x000036e1

000038a8 <_sbrk_r>:
    38a8:	b538      	push	{r3, r4, r5, lr}
    38aa:	4d07      	ldr	r5, [pc, #28]	@ (38c8 <_sbrk_r+0x20>)
    38ac:	2200      	movs	r2, #0
    38ae:	4604      	mov	r4, r0
    38b0:	4608      	mov	r0, r1
    38b2:	602a      	str	r2, [r5, #0]
    38b4:	f7fc fe8c 	bl	5d0 <__wrap__sbrk>
    38b8:	1c43      	adds	r3, r0, #1
    38ba:	d000      	beq.n	38be <_sbrk_r+0x16>
    38bc:	bd38      	pop	{r3, r4, r5, pc}
    38be:	682b      	ldr	r3, [r5, #0]
    38c0:	2b00      	cmp	r3, #0
    38c2:	d0fb      	beq.n	38bc <_sbrk_r+0x14>
    38c4:	6023      	str	r3, [r4, #0]
    38c6:	bd38      	pop	{r3, r4, r5, pc}
    38c8:	00007fa4 	.word	0x00007fa4
	...

00003900 <strlen>:
    3900:	b430      	push	{r4, r5}
    3902:	f890 f000 	pld	[r0]
    3906:	f020 0107 	bic.w	r1, r0, #7
    390a:	f06f 0c00 	mvn.w	ip, #0
    390e:	f010 0407 	ands.w	r4, r0, #7
    3912:	f891 f020 	pld	[r1, #32]
    3916:	f040 8048 	bne.w	39aa <strlen+0xaa>
    391a:	f04f 0400 	mov.w	r4, #0
    391e:	f06f 0007 	mvn.w	r0, #7
    3922:	e9d1 2300 	ldrd	r2, r3, [r1]
    3926:	f891 f040 	pld	[r1, #64]	@ 0x40
    392a:	f100 0008 	add.w	r0, r0, #8
    392e:	fa82 f24c 	uadd8	r2, r2, ip
    3932:	faa4 f28c 	sel	r2, r4, ip
    3936:	fa83 f34c 	uadd8	r3, r3, ip
    393a:	faa2 f38c 	sel	r3, r2, ip
    393e:	bb4b      	cbnz	r3, 3994 <strlen+0x94>
    3940:	e9d1 2302 	ldrd	r2, r3, [r1, #8]
    3944:	fa82 f24c 	uadd8	r2, r2, ip
    3948:	f100 0008 	add.w	r0, r0, #8
    394c:	faa4 f28c 	sel	r2, r4, ip
    3950:	fa83 f34c 	uadd8	r3, r3, ip
    3954:	faa2 f38c 	sel	r3, r2, ip
    3958:	b9e3      	cbnz	r3, 3994 <strlen+0x94>
    395a:	e9d1 2304 	ldrd	r2, r3, [r1, #16]
    395e:	fa82 f24c 	uadd8	r2, r2, ip
    3962:	f100 0008 	add.w	r0, r0, #8
    3966:	faa4 f28c 	sel	r2, r4, ip
    396a:	fa83 f34c 	uadd8	r3, r3, ip
    396e:	faa2 f38c 	sel	r3, r2, ip
    3972:	b97b      	cbnz	r3, 3994 <strlen+0x94>
    3974:	e9d1 2306 	ldrd	r2, r3, [r1, #24]
    3978:	f101 0120 	add.w	r1, r1, #32
    397c:	fa82 f24c 	uadd8	r2, r2, ip
    3980:	f100 0008 	add.w	r0, r0, #8
    3984:	faa4 f28c 	sel	r2, r4, ip
    3988:	fa83 f34c 	uadd8	r3, r3, ip
    398c:	faa2 f38c 	sel	r3, r2, ip
    3990:	2b00      	cmp	r3, #0
    3992:	d0c6      	beq.n	3922 <strlen+0x22>
    3994:	2a00      	cmp	r2, #0
    3996:	bf04      	itt	eq
    3998:	3004      	addeq	r0, #4
    399a:	461a      	moveq	r2, r3
    399c:	ba12      	rev	r2, r2
    399e:	fab2 f282 	clz	r2, r2
    39a2:	eb00 00d2 	add.w	r0, r0, r2, lsr #3
    39a6:	bc30      	pop	{r4, r5}
    39a8:	4770      	bx	lr
    39aa:	e9d1 2300 	ldrd	r2, r3, [r1]
    39ae:	f004 0503 	and.w	r5, r4, #3
    39b2:	f1c4 0000 	rsb	r0, r4, #0
    39b6:	ea4f 05c5 	mov.w	r5, r5, lsl #3
    39ba:	f014 0f04 	tst.w	r4, #4
    39be:	f891 f040 	pld	[r1, #64]	@ 0x40
    39c2:	fa0c f505 	lsl.w	r5, ip, r5
    39c6:	ea62 0205 	orn	r2, r2, r5
    39ca:	bf1c      	itt	ne
    39cc:	ea63 0305 	ornne	r3, r3, r5
    39d0:	4662      	movne	r2, ip
    39d2:	f04f 0400 	mov.w	r4, #0
    39d6:	e7aa      	b.n	392e <strlen+0x2e>

000039d8 <__sprint_r>:
    39d8:	6893      	ldr	r3, [r2, #8]
    39da:	b510      	push	{r4, lr}
    39dc:	4614      	mov	r4, r2
    39de:	b91b      	cbnz	r3, 39e8 <__sprint_r+0x10>
    39e0:	4618      	mov	r0, r3
    39e2:	2300      	movs	r3, #0
    39e4:	6063      	str	r3, [r4, #4]
    39e6:	bd10      	pop	{r4, pc}
    39e8:	f001 fc22 	bl	5230 <__sfvwrite_r>
    39ec:	2300      	movs	r3, #0
    39ee:	60a3      	str	r3, [r4, #8]
    39f0:	2300      	movs	r3, #0
    39f2:	6063      	str	r3, [r4, #4]
    39f4:	bd10      	pop	{r4, pc}
    39f6:	bf00      	nop

000039f8 <__assert_func>:
    39f8:	b500      	push	{lr}
    39fa:	4c0b      	ldr	r4, [pc, #44]	@ (3a28 <__assert_func+0x30>)
    39fc:	6825      	ldr	r5, [r4, #0]
    39fe:	4614      	mov	r4, r2
    3a00:	68ee      	ldr	r6, [r5, #12]
    3a02:	461a      	mov	r2, r3
    3a04:	b085      	sub	sp, #20
    3a06:	4603      	mov	r3, r0
    3a08:	460d      	mov	r5, r1
    3a0a:	b14c      	cbz	r4, 3a20 <__assert_func+0x28>
    3a0c:	4907      	ldr	r1, [pc, #28]	@ (3a2c <__assert_func+0x34>)
    3a0e:	9500      	str	r5, [sp, #0]
    3a10:	e9cd 1401 	strd	r1, r4, [sp, #4]
    3a14:	4630      	mov	r0, r6
    3a16:	4906      	ldr	r1, [pc, #24]	@ (3a30 <__assert_func+0x38>)
    3a18:	f001 f864 	bl	4ae4 <fiprintf>
    3a1c:	f001 f816 	bl	4a4c <abort>
    3a20:	4904      	ldr	r1, [pc, #16]	@ (3a34 <__assert_func+0x3c>)
    3a22:	460c      	mov	r4, r1
    3a24:	e7f3      	b.n	3a0e <__assert_func+0x16>
    3a26:	bf00      	nop
    3a28:	000078b8 	.word	0x000078b8
    3a2c:	000074dc 	.word	0x000074dc
    3a30:	000074ec 	.word	0x000074ec
    3a34:	000074e8 	.word	0x000074e8

00003a38 <__assert>:
    3a38:	b508      	push	{r3, lr}
    3a3a:	4613      	mov	r3, r2
    3a3c:	2200      	movs	r2, #0
    3a3e:	f7ff ffdb 	bl	39f8 <__assert_func>
    3a42:	bf00      	nop

00003a44 <_Balloc>:
    3a44:	6c43      	ldr	r3, [r0, #68]	@ 0x44
    3a46:	b570      	push	{r4, r5, r6, lr}
    3a48:	4605      	mov	r5, r0
    3a4a:	460c      	mov	r4, r1
    3a4c:	b14b      	cbz	r3, 3a62 <_Balloc+0x1e>
    3a4e:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    3a52:	b180      	cbz	r0, 3a76 <_Balloc+0x32>
    3a54:	6802      	ldr	r2, [r0, #0]
    3a56:	f843 2024 	str.w	r2, [r3, r4, lsl #2]
    3a5a:	2300      	movs	r3, #0
    3a5c:	e9c0 3303 	strd	r3, r3, [r0, #12]
    3a60:	bd70      	pop	{r4, r5, r6, pc}
    3a62:	2221      	movs	r2, #33	@ 0x21
    3a64:	2104      	movs	r1, #4
    3a66:	f000 fff9 	bl	4a5c <_calloc_r>
    3a6a:	4603      	mov	r3, r0
    3a6c:	6468      	str	r0, [r5, #68]	@ 0x44
    3a6e:	2800      	cmp	r0, #0
    3a70:	d1ed      	bne.n	3a4e <_Balloc+0xa>
    3a72:	2000      	movs	r0, #0
    3a74:	bd70      	pop	{r4, r5, r6, pc}
    3a76:	2101      	movs	r1, #1
    3a78:	fa01 f604 	lsl.w	r6, r1, r4
    3a7c:	1d72      	adds	r2, r6, #5
    3a7e:	0092      	lsls	r2, r2, #2
    3a80:	4628      	mov	r0, r5
    3a82:	f000 ffeb 	bl	4a5c <_calloc_r>
    3a86:	2800      	cmp	r0, #0
    3a88:	d0f3      	beq.n	3a72 <_Balloc+0x2e>
    3a8a:	e9c0 4601 	strd	r4, r6, [r0, #4]
    3a8e:	e7e4      	b.n	3a5a <_Balloc+0x16>

00003a90 <_Bfree>:
    3a90:	b131      	cbz	r1, 3aa0 <_Bfree+0x10>
    3a92:	6c43      	ldr	r3, [r0, #68]	@ 0x44
    3a94:	684a      	ldr	r2, [r1, #4]
    3a96:	f853 0022 	ldr.w	r0, [r3, r2, lsl #2]
    3a9a:	6008      	str	r0, [r1, #0]
    3a9c:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
    3aa0:	4770      	bx	lr
    3aa2:	bf00      	nop

00003aa4 <__multadd>:
    3aa4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3aa8:	690d      	ldr	r5, [r1, #16]
    3aaa:	4607      	mov	r7, r0
    3aac:	460e      	mov	r6, r1
    3aae:	461c      	mov	r4, r3
    3ab0:	f101 0e14 	add.w	lr, r1, #20
    3ab4:	2000      	movs	r0, #0
    3ab6:	f8de 1000 	ldr.w	r1, [lr]
    3aba:	b28b      	uxth	r3, r1
    3abc:	fb02 4303 	mla	r3, r2, r3, r4
    3ac0:	ea4f 4c13 	mov.w	ip, r3, lsr #16
    3ac4:	0c09      	lsrs	r1, r1, #16
    3ac6:	fb02 cc01 	mla	ip, r2, r1, ip
    3aca:	3001      	adds	r0, #1
    3acc:	b29b      	uxth	r3, r3
    3ace:	eb03 430c 	add.w	r3, r3, ip, lsl #16
    3ad2:	4285      	cmp	r5, r0
    3ad4:	f84e 3b04 	str.w	r3, [lr], #4
    3ad8:	ea4f 441c 	mov.w	r4, ip, lsr #16
    3adc:	dceb      	bgt.n	3ab6 <__multadd+0x12>
    3ade:	b13c      	cbz	r4, 3af0 <__multadd+0x4c>
    3ae0:	68b3      	ldr	r3, [r6, #8]
    3ae2:	42ab      	cmp	r3, r5
    3ae4:	dd07      	ble.n	3af6 <__multadd+0x52>
    3ae6:	eb06 0385 	add.w	r3, r6, r5, lsl #2
    3aea:	3501      	adds	r5, #1
    3aec:	615c      	str	r4, [r3, #20]
    3aee:	6135      	str	r5, [r6, #16]
    3af0:	4630      	mov	r0, r6
    3af2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    3af6:	6871      	ldr	r1, [r6, #4]
    3af8:	4638      	mov	r0, r7
    3afa:	3101      	adds	r1, #1
    3afc:	f7ff ffa2 	bl	3a44 <_Balloc>
    3b00:	4680      	mov	r8, r0
    3b02:	b1a8      	cbz	r0, 3b30 <__multadd+0x8c>
    3b04:	6932      	ldr	r2, [r6, #16]
    3b06:	3202      	adds	r2, #2
    3b08:	f106 010c 	add.w	r1, r6, #12
    3b0c:	0092      	lsls	r2, r2, #2
    3b0e:	300c      	adds	r0, #12
    3b10:	f7ff fcda 	bl	34c8 <memcpy>
    3b14:	6c7b      	ldr	r3, [r7, #68]	@ 0x44
    3b16:	6872      	ldr	r2, [r6, #4]
    3b18:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
    3b1c:	6031      	str	r1, [r6, #0]
    3b1e:	f843 6022 	str.w	r6, [r3, r2, lsl #2]
    3b22:	4646      	mov	r6, r8
    3b24:	eb06 0385 	add.w	r3, r6, r5, lsl #2
    3b28:	3501      	adds	r5, #1
    3b2a:	615c      	str	r4, [r3, #20]
    3b2c:	6135      	str	r5, [r6, #16]
    3b2e:	e7df      	b.n	3af0 <__multadd+0x4c>
    3b30:	4b02      	ldr	r3, [pc, #8]	@ (3b3c <__multadd+0x98>)
    3b32:	4803      	ldr	r0, [pc, #12]	@ (3b40 <__multadd+0x9c>)
    3b34:	4642      	mov	r2, r8
    3b36:	21ba      	movs	r1, #186	@ 0xba
    3b38:	f7ff ff5e 	bl	39f8 <__assert_func>
    3b3c:	0000749c 	.word	0x0000749c
    3b40:	0000751c 	.word	0x0000751c

00003b44 <__s2b>:
    3b44:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    3b48:	4617      	mov	r7, r2
    3b4a:	4a28      	ldr	r2, [pc, #160]	@ (3bec <__s2b+0xa8>)
    3b4c:	461e      	mov	r6, r3
    3b4e:	3308      	adds	r3, #8
    3b50:	460c      	mov	r4, r1
    3b52:	2e09      	cmp	r6, #9
    3b54:	fb82 1203 	smull	r1, r2, r2, r3
    3b58:	ea4f 73e3 	mov.w	r3, r3, asr #31
    3b5c:	4605      	mov	r5, r0
    3b5e:	ebc3 0362 	rsb	r3, r3, r2, asr #1
    3b62:	dd3a      	ble.n	3bda <__s2b+0x96>
    3b64:	f04f 0c01 	mov.w	ip, #1
    3b68:	2100      	movs	r1, #0
    3b6a:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    3b6e:	4563      	cmp	r3, ip
    3b70:	f101 0101 	add.w	r1, r1, #1
    3b74:	dcf9      	bgt.n	3b6a <__s2b+0x26>
    3b76:	4628      	mov	r0, r5
    3b78:	f7ff ff64 	bl	3a44 <_Balloc>
    3b7c:	4601      	mov	r1, r0
    3b7e:	b370      	cbz	r0, 3bde <__s2b+0x9a>
    3b80:	9b08      	ldr	r3, [sp, #32]
    3b82:	6143      	str	r3, [r0, #20]
    3b84:	2f09      	cmp	r7, #9
    3b86:	f04f 0301 	mov.w	r3, #1
    3b8a:	6103      	str	r3, [r0, #16]
    3b8c:	dc12      	bgt.n	3bb4 <__s2b+0x70>
    3b8e:	340a      	adds	r4, #10
    3b90:	2709      	movs	r7, #9
    3b92:	42be      	cmp	r6, r7
    3b94:	dd0b      	ble.n	3bae <__s2b+0x6a>
    3b96:	1bf6      	subs	r6, r6, r7
    3b98:	4426      	add	r6, r4
    3b9a:	f814 3b01 	ldrb.w	r3, [r4], #1
    3b9e:	220a      	movs	r2, #10
    3ba0:	3b30      	subs	r3, #48	@ 0x30
    3ba2:	4628      	mov	r0, r5
    3ba4:	f7ff ff7e 	bl	3aa4 <__multadd>
    3ba8:	42b4      	cmp	r4, r6
    3baa:	4601      	mov	r1, r0
    3bac:	d1f5      	bne.n	3b9a <__s2b+0x56>
    3bae:	4608      	mov	r0, r1
    3bb0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    3bb4:	f104 0809 	add.w	r8, r4, #9
    3bb8:	eb04 0907 	add.w	r9, r4, r7
    3bbc:	4644      	mov	r4, r8
    3bbe:	f814 3b01 	ldrb.w	r3, [r4], #1
    3bc2:	220a      	movs	r2, #10
    3bc4:	3b30      	subs	r3, #48	@ 0x30
    3bc6:	4628      	mov	r0, r5
    3bc8:	f7ff ff6c 	bl	3aa4 <__multadd>
    3bcc:	454c      	cmp	r4, r9
    3bce:	4601      	mov	r1, r0
    3bd0:	d1f5      	bne.n	3bbe <__s2b+0x7a>
    3bd2:	f1a7 0408 	sub.w	r4, r7, #8
    3bd6:	4444      	add	r4, r8
    3bd8:	e7db      	b.n	3b92 <__s2b+0x4e>
    3bda:	2100      	movs	r1, #0
    3bdc:	e7cb      	b.n	3b76 <__s2b+0x32>
    3bde:	460a      	mov	r2, r1
    3be0:	4b03      	ldr	r3, [pc, #12]	@ (3bf0 <__s2b+0xac>)
    3be2:	4804      	ldr	r0, [pc, #16]	@ (3bf4 <__s2b+0xb0>)
    3be4:	21d3      	movs	r1, #211	@ 0xd3
    3be6:	f7ff ff07 	bl	39f8 <__assert_func>
    3bea:	bf00      	nop
    3bec:	38e38e39 	.word	0x38e38e39
    3bf0:	0000749c 	.word	0x0000749c
    3bf4:	0000751c 	.word	0x0000751c

00003bf8 <__hi0bits>:
    3bf8:	f5b0 3f80 	cmp.w	r0, #65536	@ 0x10000
    3bfc:	4603      	mov	r3, r0
    3bfe:	bf36      	itet	cc
    3c00:	0403      	lslcc	r3, r0, #16
    3c02:	2000      	movcs	r0, #0
    3c04:	2010      	movcc	r0, #16
    3c06:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
    3c0a:	bf3c      	itt	cc
    3c0c:	021b      	lslcc	r3, r3, #8
    3c0e:	3008      	addcc	r0, #8
    3c10:	f1b3 5f80 	cmp.w	r3, #268435456	@ 0x10000000
    3c14:	bf3c      	itt	cc
    3c16:	011b      	lslcc	r3, r3, #4
    3c18:	3004      	addcc	r0, #4
    3c1a:	f1b3 4f80 	cmp.w	r3, #1073741824	@ 0x40000000
    3c1e:	d303      	bcc.n	3c28 <__hi0bits+0x30>
    3c20:	2b00      	cmp	r3, #0
    3c22:	db06      	blt.n	3c32 <__hi0bits+0x3a>
    3c24:	3001      	adds	r0, #1
    3c26:	4770      	bx	lr
    3c28:	009b      	lsls	r3, r3, #2
    3c2a:	d403      	bmi.n	3c34 <__hi0bits+0x3c>
    3c2c:	005b      	lsls	r3, r3, #1
    3c2e:	d403      	bmi.n	3c38 <__hi0bits+0x40>
    3c30:	2020      	movs	r0, #32
    3c32:	4770      	bx	lr
    3c34:	3002      	adds	r0, #2
    3c36:	4770      	bx	lr
    3c38:	3003      	adds	r0, #3
    3c3a:	4770      	bx	lr

00003c3c <__lo0bits>:
    3c3c:	6803      	ldr	r3, [r0, #0]
    3c3e:	f013 0207 	ands.w	r2, r3, #7
    3c42:	4601      	mov	r1, r0
    3c44:	d007      	beq.n	3c56 <__lo0bits+0x1a>
    3c46:	07da      	lsls	r2, r3, #31
    3c48:	d41f      	bmi.n	3c8a <__lo0bits+0x4e>
    3c4a:	0798      	lsls	r0, r3, #30
    3c4c:	d521      	bpl.n	3c92 <__lo0bits+0x56>
    3c4e:	085b      	lsrs	r3, r3, #1
    3c50:	600b      	str	r3, [r1, #0]
    3c52:	2001      	movs	r0, #1
    3c54:	4770      	bx	lr
    3c56:	b298      	uxth	r0, r3
    3c58:	b1a0      	cbz	r0, 3c84 <__lo0bits+0x48>
    3c5a:	4610      	mov	r0, r2
    3c5c:	b2da      	uxtb	r2, r3
    3c5e:	b90a      	cbnz	r2, 3c64 <__lo0bits+0x28>
    3c60:	3008      	adds	r0, #8
    3c62:	0a1b      	lsrs	r3, r3, #8
    3c64:	071a      	lsls	r2, r3, #28
    3c66:	bf04      	itt	eq
    3c68:	091b      	lsreq	r3, r3, #4
    3c6a:	3004      	addeq	r0, #4
    3c6c:	079a      	lsls	r2, r3, #30
    3c6e:	bf04      	itt	eq
    3c70:	089b      	lsreq	r3, r3, #2
    3c72:	3002      	addeq	r0, #2
    3c74:	07da      	lsls	r2, r3, #31
    3c76:	d403      	bmi.n	3c80 <__lo0bits+0x44>
    3c78:	085b      	lsrs	r3, r3, #1
    3c7a:	f100 0001 	add.w	r0, r0, #1
    3c7e:	d006      	beq.n	3c8e <__lo0bits+0x52>
    3c80:	600b      	str	r3, [r1, #0]
    3c82:	4770      	bx	lr
    3c84:	0c1b      	lsrs	r3, r3, #16
    3c86:	2010      	movs	r0, #16
    3c88:	e7e8      	b.n	3c5c <__lo0bits+0x20>
    3c8a:	2000      	movs	r0, #0
    3c8c:	4770      	bx	lr
    3c8e:	2020      	movs	r0, #32
    3c90:	4770      	bx	lr
    3c92:	089b      	lsrs	r3, r3, #2
    3c94:	600b      	str	r3, [r1, #0]
    3c96:	2002      	movs	r0, #2
    3c98:	4770      	bx	lr
    3c9a:	bf00      	nop

00003c9c <__i2b>:
    3c9c:	b538      	push	{r3, r4, r5, lr}
    3c9e:	6c43      	ldr	r3, [r0, #68]	@ 0x44
    3ca0:	4604      	mov	r4, r0
    3ca2:	460d      	mov	r5, r1
    3ca4:	b14b      	cbz	r3, 3cba <__i2b+0x1e>
    3ca6:	6858      	ldr	r0, [r3, #4]
    3ca8:	b1b0      	cbz	r0, 3cd8 <__i2b+0x3c>
    3caa:	6802      	ldr	r2, [r0, #0]
    3cac:	605a      	str	r2, [r3, #4]
    3cae:	2200      	movs	r2, #0
    3cb0:	2301      	movs	r3, #1
    3cb2:	e9c0 2303 	strd	r2, r3, [r0, #12]
    3cb6:	6145      	str	r5, [r0, #20]
    3cb8:	bd38      	pop	{r3, r4, r5, pc}
    3cba:	2221      	movs	r2, #33	@ 0x21
    3cbc:	2104      	movs	r1, #4
    3cbe:	f000 fecd 	bl	4a5c <_calloc_r>
    3cc2:	4603      	mov	r3, r0
    3cc4:	6460      	str	r0, [r4, #68]	@ 0x44
    3cc6:	2800      	cmp	r0, #0
    3cc8:	d1ed      	bne.n	3ca6 <__i2b+0xa>
    3cca:	4b09      	ldr	r3, [pc, #36]	@ (3cf0 <__i2b+0x54>)
    3ccc:	4809      	ldr	r0, [pc, #36]	@ (3cf4 <__i2b+0x58>)
    3cce:	2200      	movs	r2, #0
    3cd0:	f240 1145 	movw	r1, #325	@ 0x145
    3cd4:	f7ff fe90 	bl	39f8 <__assert_func>
    3cd8:	221c      	movs	r2, #28
    3cda:	2101      	movs	r1, #1
    3cdc:	4620      	mov	r0, r4
    3cde:	f000 febd 	bl	4a5c <_calloc_r>
    3ce2:	2800      	cmp	r0, #0
    3ce4:	d0f1      	beq.n	3cca <__i2b+0x2e>
    3ce6:	2201      	movs	r2, #1
    3ce8:	2302      	movs	r3, #2
    3cea:	e9c0 2301 	strd	r2, r3, [r0, #4]
    3cee:	e7de      	b.n	3cae <__i2b+0x12>
    3cf0:	0000749c 	.word	0x0000749c
    3cf4:	0000751c 	.word	0x0000751c

00003cf8 <__multiply>:
    3cf8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3cfc:	f8d1 8010 	ldr.w	r8, [r1, #16]
    3d00:	6915      	ldr	r5, [r2, #16]
    3d02:	45a8      	cmp	r8, r5
    3d04:	b085      	sub	sp, #20
    3d06:	460e      	mov	r6, r1
    3d08:	4692      	mov	sl, r2
    3d0a:	db05      	blt.n	3d18 <__multiply+0x20>
    3d0c:	462a      	mov	r2, r5
    3d0e:	4653      	mov	r3, sl
    3d10:	4645      	mov	r5, r8
    3d12:	468a      	mov	sl, r1
    3d14:	4690      	mov	r8, r2
    3d16:	461e      	mov	r6, r3
    3d18:	f8da 3008 	ldr.w	r3, [sl, #8]
    3d1c:	f8da 1004 	ldr.w	r1, [sl, #4]
    3d20:	eb05 0408 	add.w	r4, r5, r8
    3d24:	42a3      	cmp	r3, r4
    3d26:	bfb8      	it	lt
    3d28:	3101      	addlt	r1, #1
    3d2a:	f7ff fe8b 	bl	3a44 <_Balloc>
    3d2e:	4684      	mov	ip, r0
    3d30:	2800      	cmp	r0, #0
    3d32:	f000 808b 	beq.w	3e4c <__multiply+0x154>
    3d36:	f100 0714 	add.w	r7, r0, #20
    3d3a:	eb07 0e84 	add.w	lr, r7, r4, lsl #2
    3d3e:	4577      	cmp	r7, lr
    3d40:	d205      	bcs.n	3d4e <__multiply+0x56>
    3d42:	463b      	mov	r3, r7
    3d44:	2200      	movs	r2, #0
    3d46:	f843 2b04 	str.w	r2, [r3], #4
    3d4a:	459e      	cmp	lr, r3
    3d4c:	d8fb      	bhi.n	3d46 <__multiply+0x4e>
    3d4e:	3614      	adds	r6, #20
    3d50:	eb06 0888 	add.w	r8, r6, r8, lsl #2
    3d54:	f10a 0914 	add.w	r9, sl, #20
    3d58:	4546      	cmp	r6, r8
    3d5a:	eb09 0585 	add.w	r5, r9, r5, lsl #2
    3d5e:	d266      	bcs.n	3e2e <__multiply+0x136>
    3d60:	eba5 030a 	sub.w	r3, r5, sl
    3d64:	3b15      	subs	r3, #21
    3d66:	f023 0303 	bic.w	r3, r3, #3
    3d6a:	f10a 0a15 	add.w	sl, sl, #21
    3d6e:	3304      	adds	r3, #4
    3d70:	4555      	cmp	r5, sl
    3d72:	bf2c      	ite	cs
    3d74:	469b      	movcs	fp, r3
    3d76:	f04f 0b04 	movcc.w	fp, #4
    3d7a:	f8cd e008 	str.w	lr, [sp, #8]
    3d7e:	9403      	str	r4, [sp, #12]
    3d80:	46ae      	mov	lr, r5
    3d82:	46e2      	mov	sl, ip
    3d84:	e005      	b.n	3d92 <__multiply+0x9a>
    3d86:	0c09      	lsrs	r1, r1, #16
    3d88:	d12a      	bne.n	3de0 <__multiply+0xe8>
    3d8a:	45b0      	cmp	r8, r6
    3d8c:	f107 0704 	add.w	r7, r7, #4
    3d90:	d94a      	bls.n	3e28 <__multiply+0x130>
    3d92:	f856 1b04 	ldr.w	r1, [r6], #4
    3d96:	b28d      	uxth	r5, r1
    3d98:	2d00      	cmp	r5, #0
    3d9a:	d0f4      	beq.n	3d86 <__multiply+0x8e>
    3d9c:	46cc      	mov	ip, r9
    3d9e:	463c      	mov	r4, r7
    3da0:	2300      	movs	r3, #0
    3da2:	9601      	str	r6, [sp, #4]
    3da4:	f85c 0b04 	ldr.w	r0, [ip], #4
    3da8:	6821      	ldr	r1, [r4, #0]
    3daa:	b286      	uxth	r6, r0
    3dac:	b28a      	uxth	r2, r1
    3dae:	0c00      	lsrs	r0, r0, #16
    3db0:	fb05 2206 	mla	r2, r5, r6, r2
    3db4:	0c09      	lsrs	r1, r1, #16
    3db6:	441a      	add	r2, r3
    3db8:	fb05 1100 	mla	r1, r5, r0, r1
    3dbc:	eb01 4112 	add.w	r1, r1, r2, lsr #16
    3dc0:	b292      	uxth	r2, r2
    3dc2:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
    3dc6:	45e6      	cmp	lr, ip
    3dc8:	f844 2b04 	str.w	r2, [r4], #4
    3dcc:	ea4f 4311 	mov.w	r3, r1, lsr #16
    3dd0:	d8e8      	bhi.n	3da4 <__multiply+0xac>
    3dd2:	9e01      	ldr	r6, [sp, #4]
    3dd4:	f847 300b 	str.w	r3, [r7, fp]
    3dd8:	f856 1c04 	ldr.w	r1, [r6, #-4]
    3ddc:	0c09      	lsrs	r1, r1, #16
    3dde:	d0d4      	beq.n	3d8a <__multiply+0x92>
    3de0:	683b      	ldr	r3, [r7, #0]
    3de2:	2200      	movs	r2, #0
    3de4:	4648      	mov	r0, r9
    3de6:	461d      	mov	r5, r3
    3de8:	463c      	mov	r4, r7
    3dea:	4694      	mov	ip, r2
    3dec:	8802      	ldrh	r2, [r0, #0]
    3dee:	fb01 c202 	mla	r2, r1, r2, ip
    3df2:	eb02 4215 	add.w	r2, r2, r5, lsr #16
    3df6:	b29b      	uxth	r3, r3
    3df8:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    3dfc:	f844 3b04 	str.w	r3, [r4], #4
    3e00:	f850 3b04 	ldr.w	r3, [r0], #4
    3e04:	6825      	ldr	r5, [r4, #0]
    3e06:	ea4f 4c13 	mov.w	ip, r3, lsr #16
    3e0a:	b2ab      	uxth	r3, r5
    3e0c:	fb01 330c 	mla	r3, r1, ip, r3
    3e10:	eb03 4312 	add.w	r3, r3, r2, lsr #16
    3e14:	4570      	cmp	r0, lr
    3e16:	ea4f 4c13 	mov.w	ip, r3, lsr #16
    3e1a:	d3e7      	bcc.n	3dec <__multiply+0xf4>
    3e1c:	45b0      	cmp	r8, r6
    3e1e:	f847 300b 	str.w	r3, [r7, fp]
    3e22:	f107 0704 	add.w	r7, r7, #4
    3e26:	d8b4      	bhi.n	3d92 <__multiply+0x9a>
    3e28:	e9dd e402 	ldrd	lr, r4, [sp, #8]
    3e2c:	46d4      	mov	ip, sl
    3e2e:	2c00      	cmp	r4, #0
    3e30:	dc02      	bgt.n	3e38 <__multiply+0x140>
    3e32:	e005      	b.n	3e40 <__multiply+0x148>
    3e34:	3c01      	subs	r4, #1
    3e36:	d003      	beq.n	3e40 <__multiply+0x148>
    3e38:	f85e 3d04 	ldr.w	r3, [lr, #-4]!
    3e3c:	2b00      	cmp	r3, #0
    3e3e:	d0f9      	beq.n	3e34 <__multiply+0x13c>
    3e40:	4660      	mov	r0, ip
    3e42:	f8cc 4010 	str.w	r4, [ip, #16]
    3e46:	b005      	add	sp, #20
    3e48:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3e4c:	4b03      	ldr	r3, [pc, #12]	@ (3e5c <__multiply+0x164>)
    3e4e:	4804      	ldr	r0, [pc, #16]	@ (3e60 <__multiply+0x168>)
    3e50:	4662      	mov	r2, ip
    3e52:	f44f 71b1 	mov.w	r1, #354	@ 0x162
    3e56:	f7ff fdcf 	bl	39f8 <__assert_func>
    3e5a:	bf00      	nop
    3e5c:	0000749c 	.word	0x0000749c
    3e60:	0000751c 	.word	0x0000751c

00003e64 <__pow5mult>:
    3e64:	f012 0303 	ands.w	r3, r2, #3
    3e68:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3e6c:	4614      	mov	r4, r2
    3e6e:	4607      	mov	r7, r0
    3e70:	d12c      	bne.n	3ecc <__pow5mult+0x68>
    3e72:	460d      	mov	r5, r1
    3e74:	10a4      	asrs	r4, r4, #2
    3e76:	d01c      	beq.n	3eb2 <__pow5mult+0x4e>
    3e78:	6c3e      	ldr	r6, [r7, #64]	@ 0x40
    3e7a:	b386      	cbz	r6, 3ede <__pow5mult+0x7a>
    3e7c:	07e3      	lsls	r3, r4, #31
    3e7e:	f04f 0800 	mov.w	r8, #0
    3e82:	d406      	bmi.n	3e92 <__pow5mult+0x2e>
    3e84:	1064      	asrs	r4, r4, #1
    3e86:	d014      	beq.n	3eb2 <__pow5mult+0x4e>
    3e88:	6830      	ldr	r0, [r6, #0]
    3e8a:	b1a8      	cbz	r0, 3eb8 <__pow5mult+0x54>
    3e8c:	4606      	mov	r6, r0
    3e8e:	07e3      	lsls	r3, r4, #31
    3e90:	d5f8      	bpl.n	3e84 <__pow5mult+0x20>
    3e92:	4632      	mov	r2, r6
    3e94:	4629      	mov	r1, r5
    3e96:	4638      	mov	r0, r7
    3e98:	f7ff ff2e 	bl	3cf8 <__multiply>
    3e9c:	b135      	cbz	r5, 3eac <__pow5mult+0x48>
    3e9e:	6c7b      	ldr	r3, [r7, #68]	@ 0x44
    3ea0:	6869      	ldr	r1, [r5, #4]
    3ea2:	f853 2021 	ldr.w	r2, [r3, r1, lsl #2]
    3ea6:	602a      	str	r2, [r5, #0]
    3ea8:	f843 5021 	str.w	r5, [r3, r1, lsl #2]
    3eac:	1064      	asrs	r4, r4, #1
    3eae:	4605      	mov	r5, r0
    3eb0:	d1ea      	bne.n	3e88 <__pow5mult+0x24>
    3eb2:	4628      	mov	r0, r5
    3eb4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    3eb8:	4632      	mov	r2, r6
    3eba:	4631      	mov	r1, r6
    3ebc:	4638      	mov	r0, r7
    3ebe:	f7ff ff1b 	bl	3cf8 <__multiply>
    3ec2:	6030      	str	r0, [r6, #0]
    3ec4:	f8c0 8000 	str.w	r8, [r0]
    3ec8:	4606      	mov	r6, r0
    3eca:	e7e0      	b.n	3e8e <__pow5mult+0x2a>
    3ecc:	3b01      	subs	r3, #1
    3ece:	4a0f      	ldr	r2, [pc, #60]	@ (3f0c <__pow5mult+0xa8>)
    3ed0:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
    3ed4:	2300      	movs	r3, #0
    3ed6:	f7ff fde5 	bl	3aa4 <__multadd>
    3eda:	4605      	mov	r5, r0
    3edc:	e7ca      	b.n	3e74 <__pow5mult+0x10>
    3ede:	2101      	movs	r1, #1
    3ee0:	4638      	mov	r0, r7
    3ee2:	f7ff fdaf 	bl	3a44 <_Balloc>
    3ee6:	4606      	mov	r6, r0
    3ee8:	b140      	cbz	r0, 3efc <__pow5mult+0x98>
    3eea:	2301      	movs	r3, #1
    3eec:	f240 2271 	movw	r2, #625	@ 0x271
    3ef0:	e9c0 3204 	strd	r3, r2, [r0, #16]
    3ef4:	2300      	movs	r3, #0
    3ef6:	6438      	str	r0, [r7, #64]	@ 0x40
    3ef8:	6003      	str	r3, [r0, #0]
    3efa:	e7bf      	b.n	3e7c <__pow5mult+0x18>
    3efc:	4b04      	ldr	r3, [pc, #16]	@ (3f10 <__pow5mult+0xac>)
    3efe:	4805      	ldr	r0, [pc, #20]	@ (3f14 <__pow5mult+0xb0>)
    3f00:	4632      	mov	r2, r6
    3f02:	f240 1145 	movw	r1, #325	@ 0x145
    3f06:	f7ff fd77 	bl	39f8 <__assert_func>
    3f0a:	bf00      	nop
    3f0c:	00007580 	.word	0x00007580
    3f10:	0000749c 	.word	0x0000749c
    3f14:	0000751c 	.word	0x0000751c

00003f18 <__lshift>:
    3f18:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    3f1c:	460c      	mov	r4, r1
    3f1e:	4690      	mov	r8, r2
    3f20:	6927      	ldr	r7, [r4, #16]
    3f22:	68a3      	ldr	r3, [r4, #8]
    3f24:	6849      	ldr	r1, [r1, #4]
    3f26:	eb07 1762 	add.w	r7, r7, r2, asr #5
    3f2a:	1c7d      	adds	r5, r7, #1
    3f2c:	429d      	cmp	r5, r3
    3f2e:	4606      	mov	r6, r0
    3f30:	ea4f 1962 	mov.w	r9, r2, asr #5
    3f34:	dd04      	ble.n	3f40 <__lshift+0x28>
    3f36:	005b      	lsls	r3, r3, #1
    3f38:	429d      	cmp	r5, r3
    3f3a:	f101 0101 	add.w	r1, r1, #1
    3f3e:	dcfa      	bgt.n	3f36 <__lshift+0x1e>
    3f40:	4630      	mov	r0, r6
    3f42:	f7ff fd7f 	bl	3a44 <_Balloc>
    3f46:	4684      	mov	ip, r0
    3f48:	2800      	cmp	r0, #0
    3f4a:	d051      	beq.n	3ff0 <__lshift+0xd8>
    3f4c:	f1b9 0f00 	cmp.w	r9, #0
    3f50:	f100 0014 	add.w	r0, r0, #20
    3f54:	dd0e      	ble.n	3f74 <__lshift+0x5c>
    3f56:	f109 0205 	add.w	r2, r9, #5
    3f5a:	ea4f 0e82 	mov.w	lr, r2, lsl #2
    3f5e:	4603      	mov	r3, r0
    3f60:	eb0c 0282 	add.w	r2, ip, r2, lsl #2
    3f64:	2100      	movs	r1, #0
    3f66:	f843 1b04 	str.w	r1, [r3], #4
    3f6a:	4293      	cmp	r3, r2
    3f6c:	d1fb      	bne.n	3f66 <__lshift+0x4e>
    3f6e:	f1ae 0314 	sub.w	r3, lr, #20
    3f72:	4418      	add	r0, r3
    3f74:	6921      	ldr	r1, [r4, #16]
    3f76:	f104 0314 	add.w	r3, r4, #20
    3f7a:	f018 081f 	ands.w	r8, r8, #31
    3f7e:	eb03 0181 	add.w	r1, r3, r1, lsl #2
    3f82:	d02d      	beq.n	3fe0 <__lshift+0xc8>
    3f84:	f1c8 0920 	rsb	r9, r8, #32
    3f88:	4686      	mov	lr, r0
    3f8a:	f04f 0a00 	mov.w	sl, #0
    3f8e:	681a      	ldr	r2, [r3, #0]
    3f90:	fa02 f208 	lsl.w	r2, r2, r8
    3f94:	ea42 020a 	orr.w	r2, r2, sl
    3f98:	f84e 2b04 	str.w	r2, [lr], #4
    3f9c:	f853 2b04 	ldr.w	r2, [r3], #4
    3fa0:	4299      	cmp	r1, r3
    3fa2:	fa22 fa09 	lsr.w	sl, r2, r9
    3fa6:	d8f2      	bhi.n	3f8e <__lshift+0x76>
    3fa8:	1b0b      	subs	r3, r1, r4
    3faa:	3b15      	subs	r3, #21
    3fac:	f023 0303 	bic.w	r3, r3, #3
    3fb0:	3304      	adds	r3, #4
    3fb2:	f104 0215 	add.w	r2, r4, #21
    3fb6:	4291      	cmp	r1, r2
    3fb8:	bf38      	it	cc
    3fba:	2304      	movcc	r3, #4
    3fbc:	f840 a003 	str.w	sl, [r0, r3]
    3fc0:	f1ba 0f00 	cmp.w	sl, #0
    3fc4:	d100      	bne.n	3fc8 <__lshift+0xb0>
    3fc6:	463d      	mov	r5, r7
    3fc8:	6c73      	ldr	r3, [r6, #68]	@ 0x44
    3fca:	6862      	ldr	r2, [r4, #4]
    3fcc:	f8cc 5010 	str.w	r5, [ip, #16]
    3fd0:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
    3fd4:	6021      	str	r1, [r4, #0]
    3fd6:	4660      	mov	r0, ip
    3fd8:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
    3fdc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3fe0:	3804      	subs	r0, #4
    3fe2:	f853 2b04 	ldr.w	r2, [r3], #4
    3fe6:	f840 2f04 	str.w	r2, [r0, #4]!
    3fea:	4299      	cmp	r1, r3
    3fec:	d8f9      	bhi.n	3fe2 <__lshift+0xca>
    3fee:	e7ea      	b.n	3fc6 <__lshift+0xae>
    3ff0:	4b03      	ldr	r3, [pc, #12]	@ (4000 <__lshift+0xe8>)
    3ff2:	4804      	ldr	r0, [pc, #16]	@ (4004 <__lshift+0xec>)
    3ff4:	4662      	mov	r2, ip
    3ff6:	f44f 71ef 	mov.w	r1, #478	@ 0x1de
    3ffa:	f7ff fcfd 	bl	39f8 <__assert_func>
    3ffe:	bf00      	nop
    4000:	0000749c 	.word	0x0000749c
    4004:	0000751c 	.word	0x0000751c

00004008 <__mcmp>:
    4008:	690b      	ldr	r3, [r1, #16]
    400a:	4684      	mov	ip, r0
    400c:	6900      	ldr	r0, [r0, #16]
    400e:	1ac0      	subs	r0, r0, r3
    4010:	d116      	bne.n	4040 <__mcmp+0x38>
    4012:	f10c 0c14 	add.w	ip, ip, #20
    4016:	3114      	adds	r1, #20
    4018:	eb0c 0283 	add.w	r2, ip, r3, lsl #2
    401c:	b410      	push	{r4}
    401e:	eb01 0383 	add.w	r3, r1, r3, lsl #2
    4022:	e001      	b.n	4028 <__mcmp+0x20>
    4024:	4594      	cmp	ip, r2
    4026:	d208      	bcs.n	403a <__mcmp+0x32>
    4028:	f852 4d04 	ldr.w	r4, [r2, #-4]!
    402c:	f853 1d04 	ldr.w	r1, [r3, #-4]!
    4030:	428c      	cmp	r4, r1
    4032:	d0f7      	beq.n	4024 <__mcmp+0x1c>
    4034:	d205      	bcs.n	4042 <__mcmp+0x3a>
    4036:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    403a:	f85d 4b04 	ldr.w	r4, [sp], #4
    403e:	4770      	bx	lr
    4040:	4770      	bx	lr
    4042:	2001      	movs	r0, #1
    4044:	f85d 4b04 	ldr.w	r4, [sp], #4
    4048:	4770      	bx	lr
    404a:	bf00      	nop

0000404c <__mdiff>:
    404c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4050:	4615      	mov	r5, r2
    4052:	690a      	ldr	r2, [r1, #16]
    4054:	692b      	ldr	r3, [r5, #16]
    4056:	1ad2      	subs	r2, r2, r3
    4058:	2a00      	cmp	r2, #0
    405a:	b083      	sub	sp, #12
    405c:	4688      	mov	r8, r1
    405e:	f040 8087 	bne.w	4170 <__mdiff+0x124>
    4062:	f101 0614 	add.w	r6, r1, #20
    4066:	f105 0114 	add.w	r1, r5, #20
    406a:	eb01 0183 	add.w	r1, r1, r3, lsl #2
    406e:	eb06 0383 	add.w	r3, r6, r3, lsl #2
    4072:	e001      	b.n	4078 <__mdiff+0x2c>
    4074:	429e      	cmp	r6, r3
    4076:	d27e      	bcs.n	4176 <__mdiff+0x12a>
    4078:	f853 4d04 	ldr.w	r4, [r3, #-4]!
    407c:	f851 2d04 	ldr.w	r2, [r1, #-4]!
    4080:	4294      	cmp	r4, r2
    4082:	d0f7      	beq.n	4074 <__mdiff+0x28>
    4084:	d375      	bcc.n	4172 <__mdiff+0x126>
    4086:	462b      	mov	r3, r5
    4088:	2400      	movs	r4, #0
    408a:	4645      	mov	r5, r8
    408c:	4698      	mov	r8, r3
    408e:	6869      	ldr	r1, [r5, #4]
    4090:	f7ff fcd8 	bl	3a44 <_Balloc>
    4094:	4681      	mov	r9, r0
    4096:	2800      	cmp	r0, #0
    4098:	f000 8089 	beq.w	41ae <__mdiff+0x162>
    409c:	692e      	ldr	r6, [r5, #16]
    409e:	60c4      	str	r4, [r0, #12]
    40a0:	f8d8 0010 	ldr.w	r0, [r8, #16]
    40a4:	f105 0b14 	add.w	fp, r5, #20
    40a8:	f108 0e14 	add.w	lr, r8, #20
    40ac:	f109 0a14 	add.w	sl, r9, #20
    40b0:	f105 0210 	add.w	r2, r5, #16
    40b4:	eb0e 0080 	add.w	r0, lr, r0, lsl #2
    40b8:	eb0b 0186 	add.w	r1, fp, r6, lsl #2
    40bc:	4657      	mov	r7, sl
    40be:	f04f 0c00 	mov.w	ip, #0
    40c2:	f8cd b004 	str.w	fp, [sp, #4]
    40c6:	f85e 4b04 	ldr.w	r4, [lr], #4
    40ca:	f852 5f04 	ldr.w	r5, [r2, #4]!
    40ce:	fa1f fb84 	uxth.w	fp, r4
    40d2:	b2ab      	uxth	r3, r5
    40d4:	eba3 030b 	sub.w	r3, r3, fp
    40d8:	0c24      	lsrs	r4, r4, #16
    40da:	4463      	add	r3, ip
    40dc:	ebc4 4415 	rsb	r4, r4, r5, lsr #16
    40e0:	eb04 4423 	add.w	r4, r4, r3, asr #16
    40e4:	b29b      	uxth	r3, r3
    40e6:	ea43 4304 	orr.w	r3, r3, r4, lsl #16
    40ea:	4570      	cmp	r0, lr
    40ec:	f847 3b04 	str.w	r3, [r7], #4
    40f0:	ea4f 4c24 	mov.w	ip, r4, asr #16
    40f4:	d8e7      	bhi.n	40c6 <__mdiff+0x7a>
    40f6:	eba0 0208 	sub.w	r2, r0, r8
    40fa:	f108 0815 	add.w	r8, r8, #21
    40fe:	4540      	cmp	r0, r8
    4100:	f1a2 0215 	sub.w	r2, r2, #21
    4104:	bf34      	ite	cc
    4106:	2000      	movcc	r0, #0
    4108:	2001      	movcs	r0, #1
    410a:	0892      	lsrs	r2, r2, #2
    410c:	2800      	cmp	r0, #0
    410e:	f8dd b004 	ldr.w	fp, [sp, #4]
    4112:	f102 0401 	add.w	r4, r2, #1
    4116:	ea4f 0484 	mov.w	r4, r4, lsl #2
    411a:	bf08      	it	eq
    411c:	2404      	moveq	r4, #4
    411e:	eb0b 0504 	add.w	r5, fp, r4
    4122:	42a9      	cmp	r1, r5
    4124:	4454      	add	r4, sl
    4126:	d933      	bls.n	4190 <__mdiff+0x144>
    4128:	4627      	mov	r7, r4
    412a:	4628      	mov	r0, r5
    412c:	f850 3b04 	ldr.w	r3, [r0], #4
    4130:	fa1c fe83 	uxtah	lr, ip, r3
    4134:	0c1a      	lsrs	r2, r3, #16
    4136:	4463      	add	r3, ip
    4138:	eb02 422e 	add.w	r2, r2, lr, asr #16
    413c:	b29b      	uxth	r3, r3
    413e:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    4142:	4281      	cmp	r1, r0
    4144:	f847 3b04 	str.w	r3, [r7], #4
    4148:	ea4f 4c22 	mov.w	ip, r2, asr #16
    414c:	d8ee      	bhi.n	412c <__mdiff+0xe0>
    414e:	3901      	subs	r1, #1
    4150:	1b49      	subs	r1, r1, r5
    4152:	f021 0103 	bic.w	r1, r1, #3
    4156:	440c      	add	r4, r1
    4158:	b923      	cbnz	r3, 4164 <__mdiff+0x118>
    415a:	f854 3d04 	ldr.w	r3, [r4, #-4]!
    415e:	3e01      	subs	r6, #1
    4160:	2b00      	cmp	r3, #0
    4162:	d0fa      	beq.n	415a <__mdiff+0x10e>
    4164:	4648      	mov	r0, r9
    4166:	f8c9 6010 	str.w	r6, [r9, #16]
    416a:	b003      	add	sp, #12
    416c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4170:	da89      	bge.n	4086 <__mdiff+0x3a>
    4172:	2401      	movs	r4, #1
    4174:	e78b      	b.n	408e <__mdiff+0x42>
    4176:	2100      	movs	r1, #0
    4178:	f7ff fc64 	bl	3a44 <_Balloc>
    417c:	4681      	mov	r9, r0
    417e:	b178      	cbz	r0, 41a0 <__mdiff+0x154>
    4180:	2201      	movs	r2, #1
    4182:	2300      	movs	r3, #0
    4184:	e9c0 2304 	strd	r2, r3, [r0, #16]
    4188:	4648      	mov	r0, r9
    418a:	b003      	add	sp, #12
    418c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4190:	2800      	cmp	r0, #0
    4192:	ea4f 0282 	mov.w	r2, r2, lsl #2
    4196:	bf08      	it	eq
    4198:	2200      	moveq	r2, #0
    419a:	eb0a 0402 	add.w	r4, sl, r2
    419e:	e7db      	b.n	4158 <__mdiff+0x10c>
    41a0:	4b06      	ldr	r3, [pc, #24]	@ (41bc <__mdiff+0x170>)
    41a2:	4807      	ldr	r0, [pc, #28]	@ (41c0 <__mdiff+0x174>)
    41a4:	464a      	mov	r2, r9
    41a6:	f240 2137 	movw	r1, #567	@ 0x237
    41aa:	f7ff fc25 	bl	39f8 <__assert_func>
    41ae:	4b03      	ldr	r3, [pc, #12]	@ (41bc <__mdiff+0x170>)
    41b0:	4803      	ldr	r0, [pc, #12]	@ (41c0 <__mdiff+0x174>)
    41b2:	464a      	mov	r2, r9
    41b4:	f240 2145 	movw	r1, #581	@ 0x245
    41b8:	f7ff fc1e 	bl	39f8 <__assert_func>
    41bc:	0000749c 	.word	0x0000749c
    41c0:	0000751c 	.word	0x0000751c

000041c4 <__ulp>:
    41c4:	b082      	sub	sp, #8
    41c6:	ed8d 0b00 	vstr	d0, [sp]
    41ca:	4b16      	ldr	r3, [pc, #88]	@ (4224 <__ulp+0x60>)
    41cc:	9a01      	ldr	r2, [sp, #4]
    41ce:	4013      	ands	r3, r2
    41d0:	f1a3 7350 	sub.w	r3, r3, #54525952	@ 0x3400000
    41d4:	2b00      	cmp	r3, #0
    41d6:	dd06      	ble.n	41e6 <__ulp+0x22>
    41d8:	2200      	movs	r2, #0
    41da:	4619      	mov	r1, r3
    41dc:	4610      	mov	r0, r2
    41de:	ec41 0b10 	vmov	d0, r0, r1
    41e2:	b002      	add	sp, #8
    41e4:	4770      	bx	lr
    41e6:	425b      	negs	r3, r3
    41e8:	f1b3 7fa0 	cmp.w	r3, #20971520	@ 0x1400000
    41ec:	ea4f 5223 	mov.w	r2, r3, asr #20
    41f0:	da09      	bge.n	4206 <__ulp+0x42>
    41f2:	f44f 2300 	mov.w	r3, #524288	@ 0x80000
    41f6:	4113      	asrs	r3, r2
    41f8:	2200      	movs	r2, #0
    41fa:	4619      	mov	r1, r3
    41fc:	4610      	mov	r0, r2
    41fe:	ec41 0b10 	vmov	d0, r0, r1
    4202:	b002      	add	sp, #8
    4204:	4770      	bx	lr
    4206:	f1a2 0314 	sub.w	r3, r2, #20
    420a:	2b1e      	cmp	r3, #30
    420c:	bfda      	itte	le
    420e:	f04f 4200 	movle.w	r2, #2147483648	@ 0x80000000
    4212:	40da      	lsrle	r2, r3
    4214:	2201      	movgt	r2, #1
    4216:	2300      	movs	r3, #0
    4218:	4619      	mov	r1, r3
    421a:	4610      	mov	r0, r2
    421c:	ec41 0b10 	vmov	d0, r0, r1
    4220:	b002      	add	sp, #8
    4222:	4770      	bx	lr
    4224:	7ff00000 	.word	0x7ff00000

00004228 <__b2d>:
    4228:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    422a:	6904      	ldr	r4, [r0, #16]
    422c:	f100 0614 	add.w	r6, r0, #20
    4230:	eb06 0484 	add.w	r4, r6, r4, lsl #2
    4234:	1f27      	subs	r7, r4, #4
    4236:	f854 5c04 	ldr.w	r5, [r4, #-4]
    423a:	4628      	mov	r0, r5
    423c:	f7ff fcdc 	bl	3bf8 <__hi0bits>
    4240:	f1c0 0320 	rsb	r3, r0, #32
    4244:	280a      	cmp	r0, #10
    4246:	600b      	str	r3, [r1, #0]
    4248:	dd33      	ble.n	42b2 <__b2d+0x8a>
    424a:	42be      	cmp	r6, r7
    424c:	f1a0 010b 	sub.w	r1, r0, #11
    4250:	d219      	bcs.n	4286 <__b2d+0x5e>
    4252:	f854 0c08 	ldr.w	r0, [r4, #-8]
    4256:	b321      	cbz	r1, 42a2 <__b2d+0x7a>
    4258:	f1c1 0720 	rsb	r7, r1, #32
    425c:	408d      	lsls	r5, r1
    425e:	fa20 f207 	lsr.w	r2, r0, r7
    4262:	4315      	orrs	r5, r2
    4264:	4088      	lsls	r0, r1
    4266:	f1a4 0108 	sub.w	r1, r4, #8
    426a:	f045 537f 	orr.w	r3, r5, #1069547520	@ 0x3fc00000
    426e:	428e      	cmp	r6, r1
    4270:	f443 1340 	orr.w	r3, r3, #3145728	@ 0x300000
    4274:	d219      	bcs.n	42aa <__b2d+0x82>
    4276:	f854 1c0c 	ldr.w	r1, [r4, #-12]
    427a:	40f9      	lsrs	r1, r7
    427c:	4308      	orrs	r0, r1
    427e:	4602      	mov	r2, r0
    4280:	ec43 2b10 	vmov	d0, r2, r3
    4284:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    4286:	280b      	cmp	r0, #11
    4288:	d00a      	beq.n	42a0 <__b2d+0x78>
    428a:	fa05 f101 	lsl.w	r1, r5, r1
    428e:	f041 537f 	orr.w	r3, r1, #1069547520	@ 0x3fc00000
    4292:	2000      	movs	r0, #0
    4294:	f443 1340 	orr.w	r3, r3, #3145728	@ 0x300000
    4298:	4602      	mov	r2, r0
    429a:	ec43 2b10 	vmov	d0, r2, r3
    429e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    42a0:	2000      	movs	r0, #0
    42a2:	f045 537f 	orr.w	r3, r5, #1069547520	@ 0x3fc00000
    42a6:	f443 1340 	orr.w	r3, r3, #3145728	@ 0x300000
    42aa:	4602      	mov	r2, r0
    42ac:	ec43 2b10 	vmov	d0, r2, r3
    42b0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    42b2:	f1c0 0c0b 	rsb	ip, r0, #11
    42b6:	fa25 f10c 	lsr.w	r1, r5, ip
    42ba:	42be      	cmp	r6, r7
    42bc:	f041 537f 	orr.w	r3, r1, #1069547520	@ 0x3fc00000
    42c0:	bf38      	it	cc
    42c2:	f854 1c08 	ldrcc.w	r1, [r4, #-8]
    42c6:	f100 0015 	add.w	r0, r0, #21
    42ca:	bf34      	ite	cc
    42cc:	fa21 f10c 	lsrcc.w	r1, r1, ip
    42d0:	2100      	movcs	r1, #0
    42d2:	fa05 f000 	lsl.w	r0, r5, r0
    42d6:	4308      	orrs	r0, r1
    42d8:	f443 1340 	orr.w	r3, r3, #3145728	@ 0x300000
    42dc:	4602      	mov	r2, r0
    42de:	ec43 2b10 	vmov	d0, r2, r3
    42e2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

000042e4 <__d2b>:
    42e4:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    42e8:	460e      	mov	r6, r1
    42ea:	b083      	sub	sp, #12
    42ec:	2101      	movs	r1, #1
    42ee:	ec59 8b10 	vmov	r8, r9, d0
    42f2:	4615      	mov	r5, r2
    42f4:	f7ff fba6 	bl	3a44 <_Balloc>
    42f8:	4604      	mov	r4, r0
    42fa:	2800      	cmp	r0, #0
    42fc:	d046      	beq.n	438c <__d2b+0xa8>
    42fe:	f3c9 570a 	ubfx	r7, r9, #20, #11
    4302:	f3c9 0313 	ubfx	r3, r9, #0, #20
    4306:	b10f      	cbz	r7, 430c <__d2b+0x28>
    4308:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
    430c:	9301      	str	r3, [sp, #4]
    430e:	f1b8 0300 	subs.w	r3, r8, #0
    4312:	d113      	bne.n	433c <__d2b+0x58>
    4314:	a801      	add	r0, sp, #4
    4316:	f7ff fc91 	bl	3c3c <__lo0bits>
    431a:	9b01      	ldr	r3, [sp, #4]
    431c:	6163      	str	r3, [r4, #20]
    431e:	2201      	movs	r2, #1
    4320:	3020      	adds	r0, #32
    4322:	6122      	str	r2, [r4, #16]
    4324:	b30f      	cbz	r7, 436a <__d2b+0x86>
    4326:	f2a7 4733 	subw	r7, r7, #1075	@ 0x433
    432a:	4407      	add	r7, r0
    432c:	f1c0 0035 	rsb	r0, r0, #53	@ 0x35
    4330:	6037      	str	r7, [r6, #0]
    4332:	6028      	str	r0, [r5, #0]
    4334:	4620      	mov	r0, r4
    4336:	b003      	add	sp, #12
    4338:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    433c:	4668      	mov	r0, sp
    433e:	9300      	str	r3, [sp, #0]
    4340:	f7ff fc7c 	bl	3c3c <__lo0bits>
    4344:	9b01      	ldr	r3, [sp, #4]
    4346:	b1f8      	cbz	r0, 4388 <__d2b+0xa4>
    4348:	9900      	ldr	r1, [sp, #0]
    434a:	f1c0 0220 	rsb	r2, r0, #32
    434e:	fa03 f202 	lsl.w	r2, r3, r2
    4352:	40c3      	lsrs	r3, r0
    4354:	430a      	orrs	r2, r1
    4356:	9301      	str	r3, [sp, #4]
    4358:	2b00      	cmp	r3, #0
    435a:	6162      	str	r2, [r4, #20]
    435c:	bf0c      	ite	eq
    435e:	2201      	moveq	r2, #1
    4360:	2202      	movne	r2, #2
    4362:	61a3      	str	r3, [r4, #24]
    4364:	6122      	str	r2, [r4, #16]
    4366:	2f00      	cmp	r7, #0
    4368:	d1dd      	bne.n	4326 <__d2b+0x42>
    436a:	eb04 0382 	add.w	r3, r4, r2, lsl #2
    436e:	f2a0 4032 	subw	r0, r0, #1074	@ 0x432
    4372:	6030      	str	r0, [r6, #0]
    4374:	6918      	ldr	r0, [r3, #16]
    4376:	f7ff fc3f 	bl	3bf8 <__hi0bits>
    437a:	ebc0 1042 	rsb	r0, r0, r2, lsl #5
    437e:	6028      	str	r0, [r5, #0]
    4380:	4620      	mov	r0, r4
    4382:	b003      	add	sp, #12
    4384:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    4388:	9a00      	ldr	r2, [sp, #0]
    438a:	e7e5      	b.n	4358 <__d2b+0x74>
    438c:	4b03      	ldr	r3, [pc, #12]	@ (439c <__d2b+0xb8>)
    438e:	4804      	ldr	r0, [pc, #16]	@ (43a0 <__d2b+0xbc>)
    4390:	4622      	mov	r2, r4
    4392:	f240 310f 	movw	r1, #783	@ 0x30f
    4396:	f7ff fb2f 	bl	39f8 <__assert_func>
    439a:	bf00      	nop
    439c:	0000749c 	.word	0x0000749c
    43a0:	0000751c 	.word	0x0000751c

000043a4 <__ratio>:
    43a4:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    43a8:	b083      	sub	sp, #12
    43aa:	4688      	mov	r8, r1
    43ac:	4669      	mov	r1, sp
    43ae:	4681      	mov	r9, r0
    43b0:	f7ff ff3a 	bl	4228 <__b2d>
    43b4:	a901      	add	r1, sp, #4
    43b6:	4640      	mov	r0, r8
    43b8:	ec55 4b10 	vmov	r4, r5, d0
    43bc:	f7ff ff34 	bl	4228 <__b2d>
    43c0:	f8d8 3010 	ldr.w	r3, [r8, #16]
    43c4:	f8d9 2010 	ldr.w	r2, [r9, #16]
    43c8:	1ad2      	subs	r2, r2, r3
    43ca:	e9dd 3100 	ldrd	r3, r1, [sp]
    43ce:	1a5b      	subs	r3, r3, r1
    43d0:	eb03 1342 	add.w	r3, r3, r2, lsl #5
    43d4:	2b00      	cmp	r3, #0
    43d6:	ec59 8b10 	vmov	r8, r9, d0
    43da:	dd0d      	ble.n	43f8 <__ratio+0x54>
    43dc:	eb05 5703 	add.w	r7, r5, r3, lsl #20
    43e0:	463d      	mov	r5, r7
    43e2:	4642      	mov	r2, r8
    43e4:	464b      	mov	r3, r9
    43e6:	4620      	mov	r0, r4
    43e8:	4629      	mov	r1, r5
    43ea:	f002 fe0b 	bl	7004 <__aeabi_ddiv>
    43ee:	ec41 0b10 	vmov	d0, r0, r1
    43f2:	b003      	add	sp, #12
    43f4:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    43f8:	ebc3 3303 	rsb	r3, r3, r3, lsl #12
    43fc:	eb09 5103 	add.w	r1, r9, r3, lsl #20
    4400:	4689      	mov	r9, r1
    4402:	e7ee      	b.n	43e2 <__ratio+0x3e>

00004404 <_mprec_log10>:
    4404:	2817      	cmp	r0, #23
    4406:	b570      	push	{r4, r5, r6, lr}
    4408:	4606      	mov	r6, r0
    440a:	dd0c      	ble.n	4426 <_mprec_log10+0x22>
    440c:	490a      	ldr	r1, [pc, #40]	@ (4438 <_mprec_log10+0x34>)
    440e:	4d0b      	ldr	r5, [pc, #44]	@ (443c <_mprec_log10+0x38>)
    4410:	2000      	movs	r0, #0
    4412:	2400      	movs	r4, #0
    4414:	4622      	mov	r2, r4
    4416:	462b      	mov	r3, r5
    4418:	f002 fcca 	bl	6db0 <__aeabi_dmul>
    441c:	3e01      	subs	r6, #1
    441e:	d1f9      	bne.n	4414 <_mprec_log10+0x10>
    4420:	ec41 0b10 	vmov	d0, r0, r1
    4424:	bd70      	pop	{r4, r5, r6, pc}
    4426:	4b06      	ldr	r3, [pc, #24]	@ (4440 <_mprec_log10+0x3c>)
    4428:	eb03 03c0 	add.w	r3, r3, r0, lsl #3
    442c:	e9d3 0104 	ldrd	r0, r1, [r3, #16]
    4430:	ec41 0b10 	vmov	d0, r0, r1
    4434:	bd70      	pop	{r4, r5, r6, pc}
    4436:	bf00      	nop
    4438:	3ff00000 	.word	0x3ff00000
    443c:	40240000 	.word	0x40240000
    4440:	00007580 	.word	0x00007580

00004444 <__copybits>:
    4444:	3901      	subs	r1, #1
    4446:	1149      	asrs	r1, r1, #5
    4448:	f101 0c01 	add.w	ip, r1, #1
    444c:	6911      	ldr	r1, [r2, #16]
    444e:	f102 0314 	add.w	r3, r2, #20
    4452:	eb03 0181 	add.w	r1, r3, r1, lsl #2
    4456:	428b      	cmp	r3, r1
    4458:	eb00 0c8c 	add.w	ip, r0, ip, lsl #2
    445c:	d216      	bcs.n	448c <__copybits+0x48>
    445e:	b510      	push	{r4, lr}
    4460:	f1a0 0e04 	sub.w	lr, r0, #4
    4464:	f853 4b04 	ldr.w	r4, [r3], #4
    4468:	f84e 4f04 	str.w	r4, [lr, #4]!
    446c:	4299      	cmp	r1, r3
    446e:	d8f9      	bhi.n	4464 <__copybits+0x20>
    4470:	1a8b      	subs	r3, r1, r2
    4472:	3b15      	subs	r3, #21
    4474:	f023 0303 	bic.w	r3, r3, #3
    4478:	3304      	adds	r3, #4
    447a:	4418      	add	r0, r3
    447c:	4584      	cmp	ip, r0
    447e:	d904      	bls.n	448a <__copybits+0x46>
    4480:	2300      	movs	r3, #0
    4482:	f840 3b04 	str.w	r3, [r0], #4
    4486:	4584      	cmp	ip, r0
    4488:	d8fb      	bhi.n	4482 <__copybits+0x3e>
    448a:	bd10      	pop	{r4, pc}
    448c:	4584      	cmp	ip, r0
    448e:	d905      	bls.n	449c <__copybits+0x58>
    4490:	2300      	movs	r3, #0
    4492:	f840 3b04 	str.w	r3, [r0], #4
    4496:	4584      	cmp	ip, r0
    4498:	d8fb      	bhi.n	4492 <__copybits+0x4e>
    449a:	4770      	bx	lr
    449c:	4770      	bx	lr
    449e:	bf00      	nop

000044a0 <__any_on>:
    44a0:	6903      	ldr	r3, [r0, #16]
    44a2:	114a      	asrs	r2, r1, #5
    44a4:	4293      	cmp	r3, r2
    44a6:	f100 0014 	add.w	r0, r0, #20
    44aa:	da09      	bge.n	44c0 <__any_on+0x20>
    44ac:	eb00 0383 	add.w	r3, r0, r3, lsl #2
    44b0:	e002      	b.n	44b8 <__any_on+0x18>
    44b2:	f853 2d04 	ldr.w	r2, [r3, #-4]!
    44b6:	b9aa      	cbnz	r2, 44e4 <__any_on+0x44>
    44b8:	4283      	cmp	r3, r0
    44ba:	d8fa      	bhi.n	44b2 <__any_on+0x12>
    44bc:	2000      	movs	r0, #0
    44be:	4770      	bx	lr
    44c0:	eb00 0382 	add.w	r3, r0, r2, lsl #2
    44c4:	ddf8      	ble.n	44b8 <__any_on+0x18>
    44c6:	f011 011f 	ands.w	r1, r1, #31
    44ca:	d0f5      	beq.n	44b8 <__any_on+0x18>
    44cc:	b410      	push	{r4}
    44ce:	f850 4022 	ldr.w	r4, [r0, r2, lsl #2]
    44d2:	fa24 f201 	lsr.w	r2, r4, r1
    44d6:	408a      	lsls	r2, r1
    44d8:	4294      	cmp	r4, r2
    44da:	d009      	beq.n	44f0 <__any_on+0x50>
    44dc:	2001      	movs	r0, #1
    44de:	f85d 4b04 	ldr.w	r4, [sp], #4
    44e2:	4770      	bx	lr
    44e4:	2001      	movs	r0, #1
    44e6:	4770      	bx	lr
    44e8:	f853 2d04 	ldr.w	r2, [r3, #-4]!
    44ec:	2a00      	cmp	r2, #0
    44ee:	d1f5      	bne.n	44dc <__any_on+0x3c>
    44f0:	4283      	cmp	r3, r0
    44f2:	d8f9      	bhi.n	44e8 <__any_on+0x48>
    44f4:	2000      	movs	r0, #0
    44f6:	f85d 4b04 	ldr.w	r4, [sp], #4
    44fa:	4770      	bx	lr

000044fc <_fwalk_sglue>:
    44fc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    4500:	4607      	mov	r7, r0
    4502:	4688      	mov	r8, r1
    4504:	4616      	mov	r6, r2
    4506:	f04f 0900 	mov.w	r9, #0
    450a:	e9d6 5401 	ldrd	r5, r4, [r6, #4]
    450e:	3d01      	subs	r5, #1
    4510:	d410      	bmi.n	4534 <_fwalk_sglue+0x38>
    4512:	89a3      	ldrh	r3, [r4, #12]
    4514:	2b01      	cmp	r3, #1
    4516:	d908      	bls.n	452a <_fwalk_sglue+0x2e>
    4518:	f9b4 300e 	ldrsh.w	r3, [r4, #14]
    451c:	3301      	adds	r3, #1
    451e:	4621      	mov	r1, r4
    4520:	4638      	mov	r0, r7
    4522:	d002      	beq.n	452a <_fwalk_sglue+0x2e>
    4524:	47c0      	blx	r8
    4526:	ea49 0900 	orr.w	r9, r9, r0
    452a:	3d01      	subs	r5, #1
    452c:	1c6b      	adds	r3, r5, #1
    452e:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    4532:	d1ee      	bne.n	4512 <_fwalk_sglue+0x16>
    4534:	6836      	ldr	r6, [r6, #0]
    4536:	2e00      	cmp	r6, #0
    4538:	d1e7      	bne.n	450a <_fwalk_sglue+0xe>
    453a:	4648      	mov	r0, r9
    453c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

00004540 <__localeconv_l>:
    4540:	30f0      	adds	r0, #240	@ 0xf0
    4542:	4770      	bx	lr

00004544 <_localeconv_r>:
    4544:	4800      	ldr	r0, [pc, #0]	@ (4548 <_localeconv_r+0x4>)
    4546:	4770      	bx	lr
    4548:	00007adc 	.word	0x00007adc

0000454c <localeconv>:
    454c:	4800      	ldr	r0, [pc, #0]	@ (4550 <localeconv+0x4>)
    454e:	4770      	bx	lr
    4550:	00007adc 	.word	0x00007adc

00004554 <__smakebuf_r>:
    4554:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4558:	f9b1 300c 	ldrsh.w	r3, [r1, #12]
    455c:	460c      	mov	r4, r1
    455e:	0799      	lsls	r1, r3, #30
    4560:	b096      	sub	sp, #88	@ 0x58
    4562:	d508      	bpl.n	4576 <__smakebuf_r+0x22>
    4564:	f104 0343 	add.w	r3, r4, #67	@ 0x43
    4568:	2201      	movs	r2, #1
    456a:	e9c4 3204 	strd	r3, r2, [r4, #16]
    456e:	6023      	str	r3, [r4, #0]
    4570:	b016      	add	sp, #88	@ 0x58
    4572:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    4576:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    457a:	2900      	cmp	r1, #0
    457c:	4606      	mov	r6, r0
    457e:	db26      	blt.n	45ce <__smakebuf_r+0x7a>
    4580:	466a      	mov	r2, sp
    4582:	f000 fe2d 	bl	51e0 <_fstat_r>
    4586:	2800      	cmp	r0, #0
    4588:	db1f      	blt.n	45ca <__smakebuf_r+0x76>
    458a:	9d01      	ldr	r5, [sp, #4]
    458c:	f405 4570 	and.w	r5, r5, #61440	@ 0xf000
    4590:	f5a5 5500 	sub.w	r5, r5, #8192	@ 0x2000
    4594:	fab5 f585 	clz	r5, r5
    4598:	f44f 6880 	mov.w	r8, #1024	@ 0x400
    459c:	096d      	lsrs	r5, r5, #5
    459e:	f44f 6700 	mov.w	r7, #2048	@ 0x800
    45a2:	4641      	mov	r1, r8
    45a4:	4630      	mov	r0, r6
    45a6:	f000 fab1 	bl	4b0c <_malloc_r>
    45aa:	b1e8      	cbz	r0, 45e8 <__smakebuf_r+0x94>
    45ac:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    45b0:	f8c4 8014 	str.w	r8, [r4, #20]
    45b4:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
    45b8:	6020      	str	r0, [r4, #0]
    45ba:	6120      	str	r0, [r4, #16]
    45bc:	81a3      	strh	r3, [r4, #12]
    45be:	bb3d      	cbnz	r5, 4610 <__smakebuf_r+0xbc>
    45c0:	433b      	orrs	r3, r7
    45c2:	81a3      	strh	r3, [r4, #12]
    45c4:	b016      	add	sp, #88	@ 0x58
    45c6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    45ca:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    45ce:	f013 0580 	ands.w	r5, r3, #128	@ 0x80
    45d2:	d019      	beq.n	4608 <__smakebuf_r+0xb4>
    45d4:	f04f 0840 	mov.w	r8, #64	@ 0x40
    45d8:	2500      	movs	r5, #0
    45da:	4641      	mov	r1, r8
    45dc:	4630      	mov	r0, r6
    45de:	462f      	mov	r7, r5
    45e0:	f000 fa94 	bl	4b0c <_malloc_r>
    45e4:	2800      	cmp	r0, #0
    45e6:	d1e1      	bne.n	45ac <__smakebuf_r+0x58>
    45e8:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    45ec:	059a      	lsls	r2, r3, #22
    45ee:	d4bf      	bmi.n	4570 <__smakebuf_r+0x1c>
    45f0:	f023 0303 	bic.w	r3, r3, #3
    45f4:	f104 0243 	add.w	r2, r4, #67	@ 0x43
    45f8:	f043 0302 	orr.w	r3, r3, #2
    45fc:	2101      	movs	r1, #1
    45fe:	e9c4 2104 	strd	r2, r1, [r4, #16]
    4602:	81a3      	strh	r3, [r4, #12]
    4604:	6022      	str	r2, [r4, #0]
    4606:	e7b3      	b.n	4570 <__smakebuf_r+0x1c>
    4608:	f44f 6880 	mov.w	r8, #1024	@ 0x400
    460c:	462f      	mov	r7, r5
    460e:	e7c8      	b.n	45a2 <__smakebuf_r+0x4e>
    4610:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    4614:	4630      	mov	r0, r6
    4616:	f000 fdf9 	bl	520c <_isatty_r>
    461a:	b910      	cbnz	r0, 4622 <__smakebuf_r+0xce>
    461c:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4620:	e7ce      	b.n	45c0 <__smakebuf_r+0x6c>
    4622:	89a3      	ldrh	r3, [r4, #12]
    4624:	f023 0303 	bic.w	r3, r3, #3
    4628:	f043 0301 	orr.w	r3, r3, #1
    462c:	b21b      	sxth	r3, r3
    462e:	e7c7      	b.n	45c0 <__smakebuf_r+0x6c>

00004630 <__swhatbuf_r>:
    4630:	b570      	push	{r4, r5, r6, lr}
    4632:	460c      	mov	r4, r1
    4634:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4638:	2900      	cmp	r1, #0
    463a:	b096      	sub	sp, #88	@ 0x58
    463c:	4615      	mov	r5, r2
    463e:	461e      	mov	r6, r3
    4640:	db14      	blt.n	466c <__swhatbuf_r+0x3c>
    4642:	466a      	mov	r2, sp
    4644:	f000 fdcc 	bl	51e0 <_fstat_r>
    4648:	2800      	cmp	r0, #0
    464a:	db0f      	blt.n	466c <__swhatbuf_r+0x3c>
    464c:	9901      	ldr	r1, [sp, #4]
    464e:	f401 4170 	and.w	r1, r1, #61440	@ 0xf000
    4652:	f5a1 5100 	sub.w	r1, r1, #8192	@ 0x2000
    4656:	fab1 f181 	clz	r1, r1
    465a:	f44f 6380 	mov.w	r3, #1024	@ 0x400
    465e:	0949      	lsrs	r1, r1, #5
    4660:	f44f 6000 	mov.w	r0, #2048	@ 0x800
    4664:	6031      	str	r1, [r6, #0]
    4666:	602b      	str	r3, [r5, #0]
    4668:	b016      	add	sp, #88	@ 0x58
    466a:	bd70      	pop	{r4, r5, r6, pc}
    466c:	89a1      	ldrh	r1, [r4, #12]
    466e:	f011 0180 	ands.w	r1, r1, #128	@ 0x80
    4672:	d006      	beq.n	4682 <__swhatbuf_r+0x52>
    4674:	2100      	movs	r1, #0
    4676:	2340      	movs	r3, #64	@ 0x40
    4678:	4608      	mov	r0, r1
    467a:	6031      	str	r1, [r6, #0]
    467c:	602b      	str	r3, [r5, #0]
    467e:	b016      	add	sp, #88	@ 0x58
    4680:	bd70      	pop	{r4, r5, r6, pc}
    4682:	f44f 6380 	mov.w	r3, #1024	@ 0x400
    4686:	4608      	mov	r0, r1
    4688:	6031      	str	r1, [r6, #0]
    468a:	602b      	str	r3, [r5, #0]
    468c:	b016      	add	sp, #88	@ 0x58
    468e:	bd70      	pop	{r4, r5, r6, pc}

00004690 <_setlocale_r>:
    4690:	b142      	cbz	r2, 46a4 <_setlocale_r+0x14>
    4692:	b510      	push	{r4, lr}
    4694:	490b      	ldr	r1, [pc, #44]	@ (46c4 <_setlocale_r+0x34>)
    4696:	4610      	mov	r0, r2
    4698:	4614      	mov	r4, r2
    469a:	f000 f841 	bl	4720 <strcmp>
    469e:	b918      	cbnz	r0, 46a8 <_setlocale_r+0x18>
    46a0:	4809      	ldr	r0, [pc, #36]	@ (46c8 <_setlocale_r+0x38>)
    46a2:	bd10      	pop	{r4, pc}
    46a4:	4808      	ldr	r0, [pc, #32]	@ (46c8 <_setlocale_r+0x38>)
    46a6:	4770      	bx	lr
    46a8:	4907      	ldr	r1, [pc, #28]	@ (46c8 <_setlocale_r+0x38>)
    46aa:	4620      	mov	r0, r4
    46ac:	f000 f838 	bl	4720 <strcmp>
    46b0:	2800      	cmp	r0, #0
    46b2:	d0f5      	beq.n	46a0 <_setlocale_r+0x10>
    46b4:	4905      	ldr	r1, [pc, #20]	@ (46cc <_setlocale_r+0x3c>)
    46b6:	4620      	mov	r0, r4
    46b8:	f000 f832 	bl	4720 <strcmp>
    46bc:	2800      	cmp	r0, #0
    46be:	d0ef      	beq.n	46a0 <_setlocale_r+0x10>
    46c0:	2000      	movs	r0, #0
    46c2:	bd10      	pop	{r4, pc}
    46c4:	00007550 	.word	0x00007550
    46c8:	0000754c 	.word	0x0000754c
    46cc:	000074e8 	.word	0x000074e8

000046d0 <__locale_mb_cur_max>:
    46d0:	4b01      	ldr	r3, [pc, #4]	@ (46d8 <__locale_mb_cur_max+0x8>)
    46d2:	f893 0128 	ldrb.w	r0, [r3, #296]	@ 0x128
    46d6:	4770      	bx	lr
    46d8:	000079ec 	.word	0x000079ec

000046dc <setlocale>:
    46dc:	b141      	cbz	r1, 46f0 <setlocale+0x14>
    46de:	b510      	push	{r4, lr}
    46e0:	460c      	mov	r4, r1
    46e2:	4620      	mov	r0, r4
    46e4:	490a      	ldr	r1, [pc, #40]	@ (4710 <setlocale+0x34>)
    46e6:	f000 f81b 	bl	4720 <strcmp>
    46ea:	b918      	cbnz	r0, 46f4 <setlocale+0x18>
    46ec:	4809      	ldr	r0, [pc, #36]	@ (4714 <setlocale+0x38>)
    46ee:	bd10      	pop	{r4, pc}
    46f0:	4808      	ldr	r0, [pc, #32]	@ (4714 <setlocale+0x38>)
    46f2:	4770      	bx	lr
    46f4:	4907      	ldr	r1, [pc, #28]	@ (4714 <setlocale+0x38>)
    46f6:	4620      	mov	r0, r4
    46f8:	f000 f812 	bl	4720 <strcmp>
    46fc:	2800      	cmp	r0, #0
    46fe:	d0f5      	beq.n	46ec <setlocale+0x10>
    4700:	4905      	ldr	r1, [pc, #20]	@ (4718 <setlocale+0x3c>)
    4702:	4620      	mov	r0, r4
    4704:	f000 f80c 	bl	4720 <strcmp>
    4708:	2800      	cmp	r0, #0
    470a:	d0ef      	beq.n	46ec <setlocale+0x10>
    470c:	2000      	movs	r0, #0
    470e:	bd10      	pop	{r4, pc}
    4710:	00007550 	.word	0x00007550
    4714:	0000754c 	.word	0x0000754c
    4718:	000074e8 	.word	0x000074e8
    471c:	00000000 	.word	0x00000000

00004720 <strcmp>:
    4720:	7802      	ldrb	r2, [r0, #0]
    4722:	780b      	ldrb	r3, [r1, #0]
    4724:	2a01      	cmp	r2, #1
    4726:	bf28      	it	cs
    4728:	429a      	cmpcs	r2, r3
    472a:	f040 80d8 	bne.w	48de <strcmp+0x1be>
    472e:	e96d 4504 	strd	r4, r5, [sp, #-16]!
    4732:	ea40 0401 	orr.w	r4, r0, r1
    4736:	e9cd 6702 	strd	r6, r7, [sp, #8]
    473a:	f06f 0c00 	mvn.w	ip, #0
    473e:	ea4f 7244 	mov.w	r2, r4, lsl #29
    4742:	b31a      	cbz	r2, 478c <strcmp+0x6c>
    4744:	ea80 0401 	eor.w	r4, r0, r1
    4748:	f014 0f07 	tst.w	r4, #7
    474c:	d16b      	bne.n	4826 <strcmp+0x106>
    474e:	f000 0407 	and.w	r4, r0, #7
    4752:	f020 0007 	bic.w	r0, r0, #7
    4756:	f004 0503 	and.w	r5, r4, #3
    475a:	f021 0107 	bic.w	r1, r1, #7
    475e:	ea4f 05c5 	mov.w	r5, r5, lsl #3
    4762:	e8f0 2304 	ldrd	r2, r3, [r0], #16
    4766:	f014 0f04 	tst.w	r4, #4
    476a:	e8f1 6704 	ldrd	r6, r7, [r1], #16
    476e:	fa0c f405 	lsl.w	r4, ip, r5
    4772:	ea62 0204 	orn	r2, r2, r4
    4776:	ea66 0604 	orn	r6, r6, r4
    477a:	d00b      	beq.n	4794 <strcmp+0x74>
    477c:	ea63 0304 	orn	r3, r3, r4
    4780:	4662      	mov	r2, ip
    4782:	ea67 0704 	orn	r7, r7, r4
    4786:	4666      	mov	r6, ip
    4788:	e004      	b.n	4794 <strcmp+0x74>
    478a:	bf00      	nop
    478c:	e8f0 2304 	ldrd	r2, r3, [r0], #16
    4790:	e8f1 6704 	ldrd	r6, r7, [r1], #16
    4794:	fa82 f54c 	uadd8	r5, r2, ip
    4798:	ea82 0406 	eor.w	r4, r2, r6
    479c:	faa4 f48c 	sel	r4, r4, ip
    47a0:	bb6c      	cbnz	r4, 47fe <strcmp+0xde>
    47a2:	fa83 f54c 	uadd8	r5, r3, ip
    47a6:	ea83 0507 	eor.w	r5, r3, r7
    47aa:	faa5 f58c 	sel	r5, r5, ip
    47ae:	b995      	cbnz	r5, 47d6 <strcmp+0xb6>
    47b0:	e950 2302 	ldrd	r2, r3, [r0, #-8]
    47b4:	e951 6702 	ldrd	r6, r7, [r1, #-8]
    47b8:	fa82 f54c 	uadd8	r5, r2, ip
    47bc:	ea82 0406 	eor.w	r4, r2, r6
    47c0:	faa4 f48c 	sel	r4, r4, ip
    47c4:	fa83 f54c 	uadd8	r5, r3, ip
    47c8:	ea83 0507 	eor.w	r5, r3, r7
    47cc:	faa5 f58c 	sel	r5, r5, ip
    47d0:	4325      	orrs	r5, r4
    47d2:	d0db      	beq.n	478c <strcmp+0x6c>
    47d4:	b99c      	cbnz	r4, 47fe <strcmp+0xde>
    47d6:	ba2d      	rev	r5, r5
    47d8:	fab5 f485 	clz	r4, r5
    47dc:	f024 0407 	bic.w	r4, r4, #7
    47e0:	fa27 f104 	lsr.w	r1, r7, r4
    47e4:	e9dd 6702 	ldrd	r6, r7, [sp, #8]
    47e8:	fa23 f304 	lsr.w	r3, r3, r4
    47ec:	f003 00ff 	and.w	r0, r3, #255	@ 0xff
    47f0:	f001 01ff 	and.w	r1, r1, #255	@ 0xff
    47f4:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    47f8:	eba0 0001 	sub.w	r0, r0, r1
    47fc:	4770      	bx	lr
    47fe:	ba24      	rev	r4, r4
    4800:	fab4 f484 	clz	r4, r4
    4804:	f024 0407 	bic.w	r4, r4, #7
    4808:	fa26 f104 	lsr.w	r1, r6, r4
    480c:	e9dd 6702 	ldrd	r6, r7, [sp, #8]
    4810:	fa22 f204 	lsr.w	r2, r2, r4
    4814:	f002 00ff 	and.w	r0, r2, #255	@ 0xff
    4818:	f001 01ff 	and.w	r1, r1, #255	@ 0xff
    481c:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    4820:	eba0 0001 	sub.w	r0, r0, r1
    4824:	4770      	bx	lr
    4826:	f014 0f03 	tst.w	r4, #3
    482a:	d13c      	bne.n	48a6 <strcmp+0x186>
    482c:	f010 0403 	ands.w	r4, r0, #3
    4830:	d128      	bne.n	4884 <strcmp+0x164>
    4832:	f850 2b08 	ldr.w	r2, [r0], #8
    4836:	f851 3b08 	ldr.w	r3, [r1], #8
    483a:	fa82 f54c 	uadd8	r5, r2, ip
    483e:	ea82 0503 	eor.w	r5, r2, r3
    4842:	faa5 f58c 	sel	r5, r5, ip
    4846:	b95d      	cbnz	r5, 4860 <strcmp+0x140>
    4848:	f850 2c04 	ldr.w	r2, [r0, #-4]
    484c:	f851 3c04 	ldr.w	r3, [r1, #-4]
    4850:	fa82 f54c 	uadd8	r5, r2, ip
    4854:	ea82 0503 	eor.w	r5, r2, r3
    4858:	faa5 f58c 	sel	r5, r5, ip
    485c:	2d00      	cmp	r5, #0
    485e:	d0e8      	beq.n	4832 <strcmp+0x112>
    4860:	ba2d      	rev	r5, r5
    4862:	fab5 f485 	clz	r4, r5
    4866:	f024 0407 	bic.w	r4, r4, #7
    486a:	fa23 f104 	lsr.w	r1, r3, r4
    486e:	fa22 f204 	lsr.w	r2, r2, r4
    4872:	f002 00ff 	and.w	r0, r2, #255	@ 0xff
    4876:	f001 01ff 	and.w	r1, r1, #255	@ 0xff
    487a:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    487e:	eba0 0001 	sub.w	r0, r0, r1
    4882:	4770      	bx	lr
    4884:	ea4f 04c4 	mov.w	r4, r4, lsl #3
    4888:	f020 0003 	bic.w	r0, r0, #3
    488c:	f850 2b08 	ldr.w	r2, [r0], #8
    4890:	f021 0103 	bic.w	r1, r1, #3
    4894:	f851 3b08 	ldr.w	r3, [r1], #8
    4898:	fa0c f404 	lsl.w	r4, ip, r4
    489c:	ea62 0204 	orn	r2, r2, r4
    48a0:	ea63 0304 	orn	r3, r3, r4
    48a4:	e7c9      	b.n	483a <strcmp+0x11a>
    48a6:	f010 0403 	ands.w	r4, r0, #3
    48aa:	d01d      	beq.n	48e8 <strcmp+0x1c8>
    48ac:	eba1 0104 	sub.w	r1, r1, r4
    48b0:	f020 0003 	bic.w	r0, r0, #3
    48b4:	07e4      	lsls	r4, r4, #31
    48b6:	f850 2b04 	ldr.w	r2, [r0], #4
    48ba:	d006      	beq.n	48ca <strcmp+0x1aa>
    48bc:	d212      	bcs.n	48e4 <strcmp+0x1c4>
    48be:	788b      	ldrb	r3, [r1, #2]
    48c0:	fa5f f4a2 	uxtb.w	r4, r2, ror #16
    48c4:	1ae4      	subs	r4, r4, r3
    48c6:	d106      	bne.n	48d6 <strcmp+0x1b6>
    48c8:	b12b      	cbz	r3, 48d6 <strcmp+0x1b6>
    48ca:	78cb      	ldrb	r3, [r1, #3]
    48cc:	fa5f f4b2 	uxtb.w	r4, r2, ror #24
    48d0:	1ae4      	subs	r4, r4, r3
    48d2:	d100      	bne.n	48d6 <strcmp+0x1b6>
    48d4:	b933      	cbnz	r3, 48e4 <strcmp+0x1c4>
    48d6:	4620      	mov	r0, r4
    48d8:	f85d 4b10 	ldr.w	r4, [sp], #16
    48dc:	4770      	bx	lr
    48de:	eba2 0003 	sub.w	r0, r2, r3
    48e2:	4770      	bx	lr
    48e4:	f101 0104 	add.w	r1, r1, #4
    48e8:	f850 2b04 	ldr.w	r2, [r0], #4
    48ec:	07cc      	lsls	r4, r1, #31
    48ee:	f021 0103 	bic.w	r1, r1, #3
    48f2:	f851 3b04 	ldr.w	r3, [r1], #4
    48f6:	d848      	bhi.n	498a <strcmp+0x26a>
    48f8:	d224      	bcs.n	4944 <strcmp+0x224>
    48fa:	f022 447f 	bic.w	r4, r2, #4278190080	@ 0xff000000
    48fe:	fa82 f54c 	uadd8	r5, r2, ip
    4902:	ea94 2513 	eors.w	r5, r4, r3, lsr #8
    4906:	faa5 f58c 	sel	r5, r5, ip
    490a:	d10a      	bne.n	4922 <strcmp+0x202>
    490c:	b965      	cbnz	r5, 4928 <strcmp+0x208>
    490e:	f851 3b04 	ldr.w	r3, [r1], #4
    4912:	ea84 0402 	eor.w	r4, r4, r2
    4916:	ebb4 6f03 	cmp.w	r4, r3, lsl #24
    491a:	d10e      	bne.n	493a <strcmp+0x21a>
    491c:	f850 2b04 	ldr.w	r2, [r0], #4
    4920:	e7eb      	b.n	48fa <strcmp+0x1da>
    4922:	ea4f 2313 	mov.w	r3, r3, lsr #8
    4926:	e055      	b.n	49d4 <strcmp+0x2b4>
    4928:	f035 457f 	bics.w	r5, r5, #4278190080	@ 0xff000000
    492c:	d14d      	bne.n	49ca <strcmp+0x2aa>
    492e:	7808      	ldrb	r0, [r1, #0]
    4930:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    4934:	f1c0 0000 	rsb	r0, r0, #0
    4938:	4770      	bx	lr
    493a:	ea4f 6212 	mov.w	r2, r2, lsr #24
    493e:	f003 03ff 	and.w	r3, r3, #255	@ 0xff
    4942:	e047      	b.n	49d4 <strcmp+0x2b4>
    4944:	ea02 441c 	and.w	r4, r2, ip, lsr #16
    4948:	fa82 f54c 	uadd8	r5, r2, ip
    494c:	ea94 4513 	eors.w	r5, r4, r3, lsr #16
    4950:	faa5 f58c 	sel	r5, r5, ip
    4954:	d10a      	bne.n	496c <strcmp+0x24c>
    4956:	b965      	cbnz	r5, 4972 <strcmp+0x252>
    4958:	f851 3b04 	ldr.w	r3, [r1], #4
    495c:	ea84 0402 	eor.w	r4, r4, r2
    4960:	ebb4 4f03 	cmp.w	r4, r3, lsl #16
    4964:	d10c      	bne.n	4980 <strcmp+0x260>
    4966:	f850 2b04 	ldr.w	r2, [r0], #4
    496a:	e7eb      	b.n	4944 <strcmp+0x224>
    496c:	ea4f 4313 	mov.w	r3, r3, lsr #16
    4970:	e030      	b.n	49d4 <strcmp+0x2b4>
    4972:	ea15 451c 	ands.w	r5, r5, ip, lsr #16
    4976:	d128      	bne.n	49ca <strcmp+0x2aa>
    4978:	880b      	ldrh	r3, [r1, #0]
    497a:	ea4f 4212 	mov.w	r2, r2, lsr #16
    497e:	e029      	b.n	49d4 <strcmp+0x2b4>
    4980:	ea4f 4212 	mov.w	r2, r2, lsr #16
    4984:	ea03 431c 	and.w	r3, r3, ip, lsr #16
    4988:	e024      	b.n	49d4 <strcmp+0x2b4>
    498a:	f002 04ff 	and.w	r4, r2, #255	@ 0xff
    498e:	fa82 f54c 	uadd8	r5, r2, ip
    4992:	ea94 6513 	eors.w	r5, r4, r3, lsr #24
    4996:	faa5 f58c 	sel	r5, r5, ip
    499a:	d10a      	bne.n	49b2 <strcmp+0x292>
    499c:	b965      	cbnz	r5, 49b8 <strcmp+0x298>
    499e:	f851 3b04 	ldr.w	r3, [r1], #4
    49a2:	ea84 0402 	eor.w	r4, r4, r2
    49a6:	ebb4 2f03 	cmp.w	r4, r3, lsl #8
    49aa:	d109      	bne.n	49c0 <strcmp+0x2a0>
    49ac:	f850 2b04 	ldr.w	r2, [r0], #4
    49b0:	e7eb      	b.n	498a <strcmp+0x26a>
    49b2:	ea4f 6313 	mov.w	r3, r3, lsr #24
    49b6:	e00d      	b.n	49d4 <strcmp+0x2b4>
    49b8:	f015 0fff 	tst.w	r5, #255	@ 0xff
    49bc:	d105      	bne.n	49ca <strcmp+0x2aa>
    49be:	680b      	ldr	r3, [r1, #0]
    49c0:	ea4f 2212 	mov.w	r2, r2, lsr #8
    49c4:	f023 437f 	bic.w	r3, r3, #4278190080	@ 0xff000000
    49c8:	e004      	b.n	49d4 <strcmp+0x2b4>
    49ca:	f04f 0000 	mov.w	r0, #0
    49ce:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    49d2:	4770      	bx	lr
    49d4:	ba12      	rev	r2, r2
    49d6:	ba1b      	rev	r3, r3
    49d8:	fa82 f44c 	uadd8	r4, r2, ip
    49dc:	ea82 0403 	eor.w	r4, r2, r3
    49e0:	faa4 f58c 	sel	r5, r4, ip
    49e4:	fab5 f485 	clz	r4, r5
    49e8:	fa02 f204 	lsl.w	r2, r2, r4
    49ec:	fa03 f304 	lsl.w	r3, r3, r4
    49f0:	ea4f 6012 	mov.w	r0, r2, lsr #24
    49f4:	e8fd 4504 	ldrd	r4, r5, [sp], #16
    49f8:	eba0 6013 	sub.w	r0, r0, r3, lsr #24
    49fc:	4770      	bx	lr
    49fe:	bf00      	nop

00004a00 <_mbtowc_r>:
    4a00:	b410      	push	{r4}
    4a02:	4c03      	ldr	r4, [pc, #12]	@ (4a10 <_mbtowc_r+0x10>)
    4a04:	f8d4 40e4 	ldr.w	r4, [r4, #228]	@ 0xe4
    4a08:	46a4      	mov	ip, r4
    4a0a:	f85d 4b04 	ldr.w	r4, [sp], #4
    4a0e:	4760      	bx	ip
    4a10:	000079ec 	.word	0x000079ec

00004a14 <__ascii_mbtowc>:
    4a14:	b082      	sub	sp, #8
    4a16:	b149      	cbz	r1, 4a2c <__ascii_mbtowc+0x18>
    4a18:	b15a      	cbz	r2, 4a32 <__ascii_mbtowc+0x1e>
    4a1a:	b16b      	cbz	r3, 4a38 <__ascii_mbtowc+0x24>
    4a1c:	7813      	ldrb	r3, [r2, #0]
    4a1e:	600b      	str	r3, [r1, #0]
    4a20:	7812      	ldrb	r2, [r2, #0]
    4a22:	1e10      	subs	r0, r2, #0
    4a24:	bf18      	it	ne
    4a26:	2001      	movne	r0, #1
    4a28:	b002      	add	sp, #8
    4a2a:	4770      	bx	lr
    4a2c:	a901      	add	r1, sp, #4
    4a2e:	2a00      	cmp	r2, #0
    4a30:	d1f3      	bne.n	4a1a <__ascii_mbtowc+0x6>
    4a32:	4610      	mov	r0, r2
    4a34:	b002      	add	sp, #8
    4a36:	4770      	bx	lr
    4a38:	f06f 0001 	mvn.w	r0, #1
    4a3c:	e7f4      	b.n	4a28 <__ascii_mbtowc+0x14>
    4a3e:	bf00      	nop

00004a40 <__errno>:
    4a40:	4b01      	ldr	r3, [pc, #4]	@ (4a48 <__errno+0x8>)
    4a42:	6818      	ldr	r0, [r3, #0]
    4a44:	4770      	bx	lr
    4a46:	bf00      	nop
    4a48:	000078b8 	.word	0x000078b8

00004a4c <abort>:
    4a4c:	b508      	push	{r3, lr}
    4a4e:	2006      	movs	r0, #6
    4a50:	f000 fe1c 	bl	568c <raise>
    4a54:	2001      	movs	r0, #1
    4a56:	f002 fc83 	bl	7360 <_exit>
    4a5a:	bf00      	nop

00004a5c <_calloc_r>:
    4a5c:	b538      	push	{r3, r4, r5, lr}
    4a5e:	fba1 1402 	umull	r1, r4, r1, r2
    4a62:	bb54      	cbnz	r4, 4aba <_calloc_r+0x5e>
    4a64:	f000 f852 	bl	4b0c <_malloc_r>
    4a68:	4605      	mov	r5, r0
    4a6a:	b350      	cbz	r0, 4ac2 <_calloc_r+0x66>
    4a6c:	f850 2c04 	ldr.w	r2, [r0, #-4]
    4a70:	f022 0203 	bic.w	r2, r2, #3
    4a74:	3a04      	subs	r2, #4
    4a76:	2a24      	cmp	r2, #36	@ 0x24
    4a78:	d810      	bhi.n	4a9c <_calloc_r+0x40>
    4a7a:	2a13      	cmp	r2, #19
    4a7c:	d913      	bls.n	4aa6 <_calloc_r+0x4a>
    4a7e:	2a1b      	cmp	r2, #27
    4a80:	e9c0 4400 	strd	r4, r4, [r0]
    4a84:	d916      	bls.n	4ab4 <_calloc_r+0x58>
    4a86:	2a24      	cmp	r2, #36	@ 0x24
    4a88:	e9c0 4402 	strd	r4, r4, [r0, #8]
    4a8c:	bf0a      	itet	eq
    4a8e:	e9c0 4404 	strdeq	r4, r4, [r0, #16]
    4a92:	f100 0210 	addne.w	r2, r0, #16
    4a96:	f100 0218 	addeq.w	r2, r0, #24
    4a9a:	e005      	b.n	4aa8 <_calloc_r+0x4c>
    4a9c:	4621      	mov	r1, r4
    4a9e:	f7fb fea1 	bl	7e4 <memset>
    4aa2:	4628      	mov	r0, r5
    4aa4:	bd38      	pop	{r3, r4, r5, pc}
    4aa6:	4602      	mov	r2, r0
    4aa8:	2300      	movs	r3, #0
    4aaa:	e9c2 3300 	strd	r3, r3, [r2]
    4aae:	6093      	str	r3, [r2, #8]
    4ab0:	4628      	mov	r0, r5
    4ab2:	bd38      	pop	{r3, r4, r5, pc}
    4ab4:	f100 0208 	add.w	r2, r0, #8
    4ab8:	e7f6      	b.n	4aa8 <_calloc_r+0x4c>
    4aba:	f7ff ffc1 	bl	4a40 <__errno>
    4abe:	230c      	movs	r3, #12
    4ac0:	6003      	str	r3, [r0, #0]
    4ac2:	2500      	movs	r5, #0
    4ac4:	4628      	mov	r0, r5
    4ac6:	bd38      	pop	{r3, r4, r5, pc}

00004ac8 <_fiprintf_r>:
    4ac8:	b40c      	push	{r2, r3}
    4aca:	b500      	push	{lr}
    4acc:	b083      	sub	sp, #12
    4ace:	ab04      	add	r3, sp, #16
    4ad0:	f853 2b04 	ldr.w	r2, [r3], #4
    4ad4:	9301      	str	r3, [sp, #4]
    4ad6:	f000 ff15 	bl	5904 <_vfiprintf_r>
    4ada:	b003      	add	sp, #12
    4adc:	f85d eb04 	ldr.w	lr, [sp], #4
    4ae0:	b002      	add	sp, #8
    4ae2:	4770      	bx	lr

00004ae4 <fiprintf>:
    4ae4:	b40e      	push	{r1, r2, r3}
    4ae6:	b510      	push	{r4, lr}
    4ae8:	b083      	sub	sp, #12
    4aea:	ab05      	add	r3, sp, #20
    4aec:	4c06      	ldr	r4, [pc, #24]	@ (4b08 <fiprintf+0x24>)
    4aee:	f853 2b04 	ldr.w	r2, [r3], #4
    4af2:	9301      	str	r3, [sp, #4]
    4af4:	4601      	mov	r1, r0
    4af6:	6820      	ldr	r0, [r4, #0]
    4af8:	f000 ff04 	bl	5904 <_vfiprintf_r>
    4afc:	b003      	add	sp, #12
    4afe:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    4b02:	b003      	add	sp, #12
    4b04:	4770      	bx	lr
    4b06:	bf00      	nop
    4b08:	000078b8 	.word	0x000078b8

00004b0c <_malloc_r>:
    4b0c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4b10:	f101 050b 	add.w	r5, r1, #11
    4b14:	2d16      	cmp	r5, #22
    4b16:	b083      	sub	sp, #12
    4b18:	4606      	mov	r6, r0
    4b1a:	d823      	bhi.n	4b64 <_malloc_r+0x58>
    4b1c:	2910      	cmp	r1, #16
    4b1e:	f200 80af 	bhi.w	4c80 <_malloc_r+0x174>
    4b22:	f7fe fdab 	bl	367c <__malloc_lock>
    4b26:	2510      	movs	r5, #16
    4b28:	2318      	movs	r3, #24
    4b2a:	2002      	movs	r0, #2
    4b2c:	4fc0      	ldr	r7, [pc, #768]	@ (4e30 <_malloc_r+0x324>)
    4b2e:	443b      	add	r3, r7
    4b30:	f1a3 0208 	sub.w	r2, r3, #8
    4b34:	685c      	ldr	r4, [r3, #4]
    4b36:	4294      	cmp	r4, r2
    4b38:	f000 8124 	beq.w	4d84 <_malloc_r+0x278>
    4b3c:	6863      	ldr	r3, [r4, #4]
    4b3e:	68e2      	ldr	r2, [r4, #12]
    4b40:	68a1      	ldr	r1, [r4, #8]
    4b42:	f023 0303 	bic.w	r3, r3, #3
    4b46:	60ca      	str	r2, [r1, #12]
    4b48:	4423      	add	r3, r4
    4b4a:	4630      	mov	r0, r6
    4b4c:	6091      	str	r1, [r2, #8]
    4b4e:	685a      	ldr	r2, [r3, #4]
    4b50:	f042 0201 	orr.w	r2, r2, #1
    4b54:	605a      	str	r2, [r3, #4]
    4b56:	f7fe fd93 	bl	3680 <__malloc_unlock>
    4b5a:	3408      	adds	r4, #8
    4b5c:	4620      	mov	r0, r4
    4b5e:	b003      	add	sp, #12
    4b60:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4b64:	f035 0507 	bics.w	r5, r5, #7
    4b68:	f100 808a 	bmi.w	4c80 <_malloc_r+0x174>
    4b6c:	42a9      	cmp	r1, r5
    4b6e:	f200 8087 	bhi.w	4c80 <_malloc_r+0x174>
    4b72:	f7fe fd83 	bl	367c <__malloc_lock>
    4b76:	f5b5 7ffc 	cmp.w	r5, #504	@ 0x1f8
    4b7a:	f0c0 816b 	bcc.w	4e54 <_malloc_r+0x348>
    4b7e:	0a6b      	lsrs	r3, r5, #9
    4b80:	f000 8082 	beq.w	4c88 <_malloc_r+0x17c>
    4b84:	2b04      	cmp	r3, #4
    4b86:	f200 8123 	bhi.w	4dd0 <_malloc_r+0x2c4>
    4b8a:	09ab      	lsrs	r3, r5, #6
    4b8c:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    4b90:	f103 0e38 	add.w	lr, r3, #56	@ 0x38
    4b94:	00c3      	lsls	r3, r0, #3
    4b96:	4fa6      	ldr	r7, [pc, #664]	@ (4e30 <_malloc_r+0x324>)
    4b98:	443b      	add	r3, r7
    4b9a:	f1a3 0c08 	sub.w	ip, r3, #8
    4b9e:	685c      	ldr	r4, [r3, #4]
    4ba0:	45a4      	cmp	ip, r4
    4ba2:	d107      	bne.n	4bb4 <_malloc_r+0xa8>
    4ba4:	e00d      	b.n	4bc2 <_malloc_r+0xb6>
    4ba6:	2a00      	cmp	r2, #0
    4ba8:	68e1      	ldr	r1, [r4, #12]
    4baa:	f280 80e5 	bge.w	4d78 <_malloc_r+0x26c>
    4bae:	458c      	cmp	ip, r1
    4bb0:	d007      	beq.n	4bc2 <_malloc_r+0xb6>
    4bb2:	460c      	mov	r4, r1
    4bb4:	6863      	ldr	r3, [r4, #4]
    4bb6:	f023 0303 	bic.w	r3, r3, #3
    4bba:	1b5a      	subs	r2, r3, r5
    4bbc:	2a0f      	cmp	r2, #15
    4bbe:	ddf2      	ble.n	4ba6 <_malloc_r+0x9a>
    4bc0:	4670      	mov	r0, lr
    4bc2:	f8df 8270 	ldr.w	r8, [pc, #624]	@ 4e34 <_malloc_r+0x328>
    4bc6:	693c      	ldr	r4, [r7, #16]
    4bc8:	4544      	cmp	r4, r8
    4bca:	f000 80c2 	beq.w	4d52 <_malloc_r+0x246>
    4bce:	6863      	ldr	r3, [r4, #4]
    4bd0:	f023 0c03 	bic.w	ip, r3, #3
    4bd4:	ebac 0305 	sub.w	r3, ip, r5
    4bd8:	2b0f      	cmp	r3, #15
    4bda:	f300 813f 	bgt.w	4e5c <_malloc_r+0x350>
    4bde:	2b00      	cmp	r3, #0
    4be0:	e9c7 8804 	strd	r8, r8, [r7, #16]
    4be4:	f280 812a 	bge.w	4e3c <_malloc_r+0x330>
    4be8:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
    4bec:	f8d7 e004 	ldr.w	lr, [r7, #4]
    4bf0:	f080 80ce 	bcs.w	4d90 <_malloc_r+0x284>
    4bf4:	ea4f 01dc 	mov.w	r1, ip, lsr #3
    4bf8:	3101      	adds	r1, #1
    4bfa:	ea4f 1c5c 	mov.w	ip, ip, lsr #5
    4bfe:	2301      	movs	r3, #1
    4c00:	fa03 f30c 	lsl.w	r3, r3, ip
    4c04:	f857 2031 	ldr.w	r2, [r7, r1, lsl #3]
    4c08:	60a2      	str	r2, [r4, #8]
    4c0a:	ea4e 0e03 	orr.w	lr, lr, r3
    4c0e:	eb07 03c1 	add.w	r3, r7, r1, lsl #3
    4c12:	3b08      	subs	r3, #8
    4c14:	60e3      	str	r3, [r4, #12]
    4c16:	f8c7 e004 	str.w	lr, [r7, #4]
    4c1a:	f847 4031 	str.w	r4, [r7, r1, lsl #3]
    4c1e:	60d4      	str	r4, [r2, #12]
    4c20:	1083      	asrs	r3, r0, #2
    4c22:	f04f 0c01 	mov.w	ip, #1
    4c26:	fa0c fc03 	lsl.w	ip, ip, r3
    4c2a:	45f4      	cmp	ip, lr
    4c2c:	d832      	bhi.n	4c94 <_malloc_r+0x188>
    4c2e:	ea1c 0f0e 	tst.w	ip, lr
    4c32:	d108      	bne.n	4c46 <_malloc_r+0x13a>
    4c34:	f020 0003 	bic.w	r0, r0, #3
    4c38:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    4c3c:	ea1c 0f0e 	tst.w	ip, lr
    4c40:	f100 0004 	add.w	r0, r0, #4
    4c44:	d0f8      	beq.n	4c38 <_malloc_r+0x12c>
    4c46:	eb07 0ac0 	add.w	sl, r7, r0, lsl #3
    4c4a:	46d6      	mov	lr, sl
    4c4c:	4681      	mov	r9, r0
    4c4e:	f8de 300c 	ldr.w	r3, [lr, #12]
    4c52:	e00b      	b.n	4c6c <_malloc_r+0x160>
    4c54:	6859      	ldr	r1, [r3, #4]
    4c56:	f021 0103 	bic.w	r1, r1, #3
    4c5a:	1b4a      	subs	r2, r1, r5
    4c5c:	2a0f      	cmp	r2, #15
    4c5e:	461c      	mov	r4, r3
    4c60:	68db      	ldr	r3, [r3, #12]
    4c62:	f300 80c1 	bgt.w	4de8 <_malloc_r+0x2dc>
    4c66:	2a00      	cmp	r2, #0
    4c68:	f280 80d5 	bge.w	4e16 <_malloc_r+0x30a>
    4c6c:	459e      	cmp	lr, r3
    4c6e:	d1f1      	bne.n	4c54 <_malloc_r+0x148>
    4c70:	f109 0901 	add.w	r9, r9, #1
    4c74:	f019 0f03 	tst.w	r9, #3
    4c78:	f10e 0e08 	add.w	lr, lr, #8
    4c7c:	d1e7      	bne.n	4c4e <_malloc_r+0x142>
    4c7e:	e116      	b.n	4eae <_malloc_r+0x3a2>
    4c80:	230c      	movs	r3, #12
    4c82:	6033      	str	r3, [r6, #0]
    4c84:	2400      	movs	r4, #0
    4c86:	e769      	b.n	4b5c <_malloc_r+0x50>
    4c88:	f44f 7300 	mov.w	r3, #512	@ 0x200
    4c8c:	2040      	movs	r0, #64	@ 0x40
    4c8e:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
    4c92:	e780      	b.n	4b96 <_malloc_r+0x8a>
    4c94:	68bc      	ldr	r4, [r7, #8]
    4c96:	6863      	ldr	r3, [r4, #4]
    4c98:	f023 0903 	bic.w	r9, r3, #3
    4c9c:	45a9      	cmp	r9, r5
    4c9e:	d303      	bcc.n	4ca8 <_malloc_r+0x19c>
    4ca0:	eba9 0305 	sub.w	r3, r9, r5
    4ca4:	2b0f      	cmp	r3, #15
    4ca6:	dc57      	bgt.n	4d58 <_malloc_r+0x24c>
    4ca8:	f8df b18c 	ldr.w	fp, [pc, #396]	@ 4e38 <_malloc_r+0x32c>
    4cac:	f8db 2000 	ldr.w	r2, [fp]
    4cb0:	eb04 0309 	add.w	r3, r4, r9
    4cb4:	3210      	adds	r2, #16
    4cb6:	2008      	movs	r0, #8
    4cb8:	eb02 0805 	add.w	r8, r2, r5
    4cbc:	9300      	str	r3, [sp, #0]
    4cbe:	f7fe fc9d 	bl	35fc <sysconf>
    4cc2:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    4cc6:	3101      	adds	r1, #1
    4cc8:	4602      	mov	r2, r0
    4cca:	d005      	beq.n	4cd8 <_malloc_r+0x1cc>
    4ccc:	f108 38ff 	add.w	r8, r8, #4294967295	@ 0xffffffff
    4cd0:	4480      	add	r8, r0
    4cd2:	4241      	negs	r1, r0
    4cd4:	ea01 0808 	and.w	r8, r1, r8
    4cd8:	4641      	mov	r1, r8
    4cda:	4630      	mov	r0, r6
    4cdc:	9201      	str	r2, [sp, #4]
    4cde:	f7fe fde3 	bl	38a8 <_sbrk_r>
    4ce2:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
    4ce6:	9a01      	ldr	r2, [sp, #4]
    4ce8:	4682      	mov	sl, r0
    4cea:	f000 80d2 	beq.w	4e92 <_malloc_r+0x386>
    4cee:	9b00      	ldr	r3, [sp, #0]
    4cf0:	4283      	cmp	r3, r0
    4cf2:	f200 80cc 	bhi.w	4e8e <_malloc_r+0x382>
    4cf6:	f8db 1004 	ldr.w	r1, [fp, #4]
    4cfa:	4441      	add	r1, r8
    4cfc:	f8cb 1004 	str.w	r1, [fp, #4]
    4d00:	4608      	mov	r0, r1
    4d02:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    4d06:	f040 80f4 	bne.w	4ef2 <_malloc_r+0x3e6>
    4d0a:	ea1a 0f0c 	tst.w	sl, ip
    4d0e:	f040 80f0 	bne.w	4ef2 <_malloc_r+0x3e6>
    4d12:	f8d7 a008 	ldr.w	sl, [r7, #8]
    4d16:	44c8      	add	r8, r9
    4d18:	f048 0001 	orr.w	r0, r8, #1
    4d1c:	f8ca 0004 	str.w	r0, [sl, #4]
    4d20:	f8db 202c 	ldr.w	r2, [fp, #44]	@ 0x2c
    4d24:	428a      	cmp	r2, r1
    4d26:	f8db 2030 	ldr.w	r2, [fp, #48]	@ 0x30
    4d2a:	bf38      	it	cc
    4d2c:	f8cb 102c 	strcc.w	r1, [fp, #44]	@ 0x2c
    4d30:	428a      	cmp	r2, r1
    4d32:	bf38      	it	cc
    4d34:	f8cb 1030 	strcc.w	r1, [fp, #48]	@ 0x30
    4d38:	4654      	mov	r4, sl
    4d3a:	f020 0803 	bic.w	r8, r0, #3
    4d3e:	45a8      	cmp	r8, r5
    4d40:	eba8 0305 	sub.w	r3, r8, r5
    4d44:	d301      	bcc.n	4d4a <_malloc_r+0x23e>
    4d46:	2b0f      	cmp	r3, #15
    4d48:	dc06      	bgt.n	4d58 <_malloc_r+0x24c>
    4d4a:	4630      	mov	r0, r6
    4d4c:	f7fe fc98 	bl	3680 <__malloc_unlock>
    4d50:	e798      	b.n	4c84 <_malloc_r+0x178>
    4d52:	f8d7 e004 	ldr.w	lr, [r7, #4]
    4d56:	e763      	b.n	4c20 <_malloc_r+0x114>
    4d58:	1962      	adds	r2, r4, r5
    4d5a:	f043 0301 	orr.w	r3, r3, #1
    4d5e:	f045 0501 	orr.w	r5, r5, #1
    4d62:	6065      	str	r5, [r4, #4]
    4d64:	4630      	mov	r0, r6
    4d66:	60ba      	str	r2, [r7, #8]
    4d68:	6053      	str	r3, [r2, #4]
    4d6a:	f7fe fc89 	bl	3680 <__malloc_unlock>
    4d6e:	3408      	adds	r4, #8
    4d70:	4620      	mov	r0, r4
    4d72:	b003      	add	sp, #12
    4d74:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4d78:	68a2      	ldr	r2, [r4, #8]
    4d7a:	4423      	add	r3, r4
    4d7c:	60d1      	str	r1, [r2, #12]
    4d7e:	4630      	mov	r0, r6
    4d80:	608a      	str	r2, [r1, #8]
    4d82:	e6e4      	b.n	4b4e <_malloc_r+0x42>
    4d84:	68dc      	ldr	r4, [r3, #12]
    4d86:	42a3      	cmp	r3, r4
    4d88:	f47f aed8 	bne.w	4b3c <_malloc_r+0x30>
    4d8c:	3002      	adds	r0, #2
    4d8e:	e718      	b.n	4bc2 <_malloc_r+0xb6>
    4d90:	f5bc 6f20 	cmp.w	ip, #2560	@ 0xa00
    4d94:	ea4f 225c 	mov.w	r2, ip, lsr #9
    4d98:	d372      	bcc.n	4e80 <_malloc_r+0x374>
    4d9a:	2a14      	cmp	r2, #20
    4d9c:	f200 8108 	bhi.w	4fb0 <_malloc_r+0x4a4>
    4da0:	f102 035c 	add.w	r3, r2, #92	@ 0x5c
    4da4:	00db      	lsls	r3, r3, #3
    4da6:	325b      	adds	r2, #91	@ 0x5b
    4da8:	18f9      	adds	r1, r7, r3
    4daa:	58fb      	ldr	r3, [r7, r3]
    4dac:	3908      	subs	r1, #8
    4dae:	4299      	cmp	r1, r3
    4db0:	d103      	bne.n	4dba <_malloc_r+0x2ae>
    4db2:	e0e4      	b.n	4f7e <_malloc_r+0x472>
    4db4:	689b      	ldr	r3, [r3, #8]
    4db6:	4299      	cmp	r1, r3
    4db8:	d004      	beq.n	4dc4 <_malloc_r+0x2b8>
    4dba:	685a      	ldr	r2, [r3, #4]
    4dbc:	f022 0203 	bic.w	r2, r2, #3
    4dc0:	4562      	cmp	r2, ip
    4dc2:	d8f7      	bhi.n	4db4 <_malloc_r+0x2a8>
    4dc4:	68d9      	ldr	r1, [r3, #12]
    4dc6:	e9c4 3102 	strd	r3, r1, [r4, #8]
    4dca:	608c      	str	r4, [r1, #8]
    4dcc:	60dc      	str	r4, [r3, #12]
    4dce:	e727      	b.n	4c20 <_malloc_r+0x114>
    4dd0:	2b14      	cmp	r3, #20
    4dd2:	d961      	bls.n	4e98 <_malloc_r+0x38c>
    4dd4:	2b54      	cmp	r3, #84	@ 0x54
    4dd6:	f200 80f4 	bhi.w	4fc2 <_malloc_r+0x4b6>
    4dda:	0b2b      	lsrs	r3, r5, #12
    4ddc:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    4de0:	f103 0e6e 	add.w	lr, r3, #110	@ 0x6e
    4de4:	00c3      	lsls	r3, r0, #3
    4de6:	e6d6      	b.n	4b96 <_malloc_r+0x8a>
    4de8:	f8d4 c008 	ldr.w	ip, [r4, #8]
    4dec:	4630      	mov	r0, r6
    4dee:	1966      	adds	r6, r4, r5
    4df0:	f045 0501 	orr.w	r5, r5, #1
    4df4:	6065      	str	r5, [r4, #4]
    4df6:	f8cc 300c 	str.w	r3, [ip, #12]
    4dfa:	f8c3 c008 	str.w	ip, [r3, #8]
    4dfe:	f042 0301 	orr.w	r3, r2, #1
    4e02:	e9c7 6604 	strd	r6, r6, [r7, #16]
    4e06:	e9c6 8802 	strd	r8, r8, [r6, #8]
    4e0a:	6073      	str	r3, [r6, #4]
    4e0c:	5062      	str	r2, [r4, r1]
    4e0e:	f7fe fc37 	bl	3680 <__malloc_unlock>
    4e12:	3408      	adds	r4, #8
    4e14:	e6a2      	b.n	4b5c <_malloc_r+0x50>
    4e16:	4421      	add	r1, r4
    4e18:	4630      	mov	r0, r6
    4e1a:	684a      	ldr	r2, [r1, #4]
    4e1c:	f042 0201 	orr.w	r2, r2, #1
    4e20:	604a      	str	r2, [r1, #4]
    4e22:	f854 2f08 	ldr.w	r2, [r4, #8]!
    4e26:	60d3      	str	r3, [r2, #12]
    4e28:	609a      	str	r2, [r3, #8]
    4e2a:	f7fe fc29 	bl	3680 <__malloc_unlock>
    4e2e:	e695      	b.n	4b5c <_malloc_r+0x50>
    4e30:	00007b58 	.word	0x00007b58
    4e34:	00007b60 	.word	0x00007b60
    4e38:	0000827c 	.word	0x0000827c
    4e3c:	44a4      	add	ip, r4
    4e3e:	4630      	mov	r0, r6
    4e40:	f8dc 3004 	ldr.w	r3, [ip, #4]
    4e44:	f043 0301 	orr.w	r3, r3, #1
    4e48:	f8cc 3004 	str.w	r3, [ip, #4]
    4e4c:	f7fe fc18 	bl	3680 <__malloc_unlock>
    4e50:	3408      	adds	r4, #8
    4e52:	e683      	b.n	4b5c <_malloc_r+0x50>
    4e54:	08e8      	lsrs	r0, r5, #3
    4e56:	f105 0308 	add.w	r3, r5, #8
    4e5a:	e667      	b.n	4b2c <_malloc_r+0x20>
    4e5c:	1962      	adds	r2, r4, r5
    4e5e:	f043 0101 	orr.w	r1, r3, #1
    4e62:	f045 0501 	orr.w	r5, r5, #1
    4e66:	6065      	str	r5, [r4, #4]
    4e68:	4630      	mov	r0, r6
    4e6a:	e9c7 2204 	strd	r2, r2, [r7, #16]
    4e6e:	e9c2 8802 	strd	r8, r8, [r2, #8]
    4e72:	6051      	str	r1, [r2, #4]
    4e74:	f844 300c 	str.w	r3, [r4, ip]
    4e78:	f7fe fc02 	bl	3680 <__malloc_unlock>
    4e7c:	3408      	adds	r4, #8
    4e7e:	e66d      	b.n	4b5c <_malloc_r+0x50>
    4e80:	ea4f 129c 	mov.w	r2, ip, lsr #6
    4e84:	f102 0339 	add.w	r3, r2, #57	@ 0x39
    4e88:	00db      	lsls	r3, r3, #3
    4e8a:	3238      	adds	r2, #56	@ 0x38
    4e8c:	e78c      	b.n	4da8 <_malloc_r+0x29c>
    4e8e:	42bc      	cmp	r4, r7
    4e90:	d028      	beq.n	4ee4 <_malloc_r+0x3d8>
    4e92:	68bc      	ldr	r4, [r7, #8]
    4e94:	6860      	ldr	r0, [r4, #4]
    4e96:	e750      	b.n	4d3a <_malloc_r+0x22e>
    4e98:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    4e9c:	f103 0e5b 	add.w	lr, r3, #91	@ 0x5b
    4ea0:	00c3      	lsls	r3, r0, #3
    4ea2:	e678      	b.n	4b96 <_malloc_r+0x8a>
    4ea4:	f85a 3908 	ldr.w	r3, [sl], #-8
    4ea8:	4553      	cmp	r3, sl
    4eaa:	f040 80d7 	bne.w	505c <_malloc_r+0x550>
    4eae:	f010 0f03 	tst.w	r0, #3
    4eb2:	f100 30ff 	add.w	r0, r0, #4294967295	@ 0xffffffff
    4eb6:	d1f5      	bne.n	4ea4 <_malloc_r+0x398>
    4eb8:	687b      	ldr	r3, [r7, #4]
    4eba:	ea23 030c 	bic.w	r3, r3, ip
    4ebe:	607b      	str	r3, [r7, #4]
    4ec0:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    4ec4:	459c      	cmp	ip, r3
    4ec6:	f63f aee5 	bhi.w	4c94 <_malloc_r+0x188>
    4eca:	f1bc 0f00 	cmp.w	ip, #0
    4ece:	d104      	bne.n	4eda <_malloc_r+0x3ce>
    4ed0:	e6e0      	b.n	4c94 <_malloc_r+0x188>
    4ed2:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    4ed6:	f109 0904 	add.w	r9, r9, #4
    4eda:	ea1c 0f03 	tst.w	ip, r3
    4ede:	d0f8      	beq.n	4ed2 <_malloc_r+0x3c6>
    4ee0:	4648      	mov	r0, r9
    4ee2:	e6b0      	b.n	4c46 <_malloc_r+0x13a>
    4ee4:	f8db 0004 	ldr.w	r0, [fp, #4]
    4ee8:	4440      	add	r0, r8
    4eea:	f8cb 0004 	str.w	r0, [fp, #4]
    4eee:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    4ef2:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    4ef6:	3101      	adds	r1, #1
    4ef8:	d06d      	beq.n	4fd6 <_malloc_r+0x4ca>
    4efa:	9b00      	ldr	r3, [sp, #0]
    4efc:	ebaa 0303 	sub.w	r3, sl, r3
    4f00:	4418      	add	r0, r3
    4f02:	f8cb 0004 	str.w	r0, [fp, #4]
    4f06:	f01a 0307 	ands.w	r3, sl, #7
    4f0a:	9300      	str	r3, [sp, #0]
    4f0c:	d041      	beq.n	4f92 <_malloc_r+0x486>
    4f0e:	f1c3 0108 	rsb	r1, r3, #8
    4f12:	448a      	add	sl, r1
    4f14:	44d0      	add	r8, sl
    4f16:	440a      	add	r2, r1
    4f18:	ea08 010c 	and.w	r1, r8, ip
    4f1c:	1a52      	subs	r2, r2, r1
    4f1e:	ea02 010c 	and.w	r1, r2, ip
    4f22:	4630      	mov	r0, r6
    4f24:	9101      	str	r1, [sp, #4]
    4f26:	f7fe fcbf 	bl	38a8 <_sbrk_r>
    4f2a:	1c42      	adds	r2, r0, #1
    4f2c:	d06f      	beq.n	500e <_malloc_r+0x502>
    4f2e:	9901      	ldr	r1, [sp, #4]
    4f30:	eba0 000a 	sub.w	r0, r0, sl
    4f34:	eb00 0801 	add.w	r8, r0, r1
    4f38:	f8db 2004 	ldr.w	r2, [fp, #4]
    4f3c:	f8c7 a008 	str.w	sl, [r7, #8]
    4f40:	f048 0001 	orr.w	r0, r8, #1
    4f44:	4411      	add	r1, r2
    4f46:	42bc      	cmp	r4, r7
    4f48:	f8ca 0004 	str.w	r0, [sl, #4]
    4f4c:	f8cb 1004 	str.w	r1, [fp, #4]
    4f50:	f43f aee6 	beq.w	4d20 <_malloc_r+0x214>
    4f54:	f1b9 0f0f 	cmp.w	r9, #15
    4f58:	d940      	bls.n	4fdc <_malloc_r+0x4d0>
    4f5a:	6862      	ldr	r2, [r4, #4]
    4f5c:	f1a9 000c 	sub.w	r0, r9, #12
    4f60:	f020 0007 	bic.w	r0, r0, #7
    4f64:	f002 0201 	and.w	r2, r2, #1
    4f68:	4302      	orrs	r2, r0
    4f6a:	6062      	str	r2, [r4, #4]
    4f6c:	2305      	movs	r3, #5
    4f6e:	1822      	adds	r2, r4, r0
    4f70:	280f      	cmp	r0, #15
    4f72:	e9c2 3301 	strd	r3, r3, [r2, #4]
    4f76:	d852      	bhi.n	501e <_malloc_r+0x512>
    4f78:	f8da 0004 	ldr.w	r0, [sl, #4]
    4f7c:	e6d0      	b.n	4d20 <_malloc_r+0x214>
    4f7e:	1092      	asrs	r2, r2, #2
    4f80:	f04f 0c01 	mov.w	ip, #1
    4f84:	fa0c f202 	lsl.w	r2, ip, r2
    4f88:	ea4e 0e02 	orr.w	lr, lr, r2
    4f8c:	f8c7 e004 	str.w	lr, [r7, #4]
    4f90:	e719      	b.n	4dc6 <_malloc_r+0x2ba>
    4f92:	eb0a 0108 	add.w	r1, sl, r8
    4f96:	ea01 010c 	and.w	r1, r1, ip
    4f9a:	1a52      	subs	r2, r2, r1
    4f9c:	ea02 010c 	and.w	r1, r2, ip
    4fa0:	4630      	mov	r0, r6
    4fa2:	9101      	str	r1, [sp, #4]
    4fa4:	f7fe fc80 	bl	38a8 <_sbrk_r>
    4fa8:	1c43      	adds	r3, r0, #1
    4faa:	d1c0      	bne.n	4f2e <_malloc_r+0x422>
    4fac:	9900      	ldr	r1, [sp, #0]
    4fae:	e7c3      	b.n	4f38 <_malloc_r+0x42c>
    4fb0:	2a54      	cmp	r2, #84	@ 0x54
    4fb2:	d817      	bhi.n	4fe4 <_malloc_r+0x4d8>
    4fb4:	ea4f 321c 	mov.w	r2, ip, lsr #12
    4fb8:	f102 036f 	add.w	r3, r2, #111	@ 0x6f
    4fbc:	00db      	lsls	r3, r3, #3
    4fbe:	326e      	adds	r2, #110	@ 0x6e
    4fc0:	e6f2      	b.n	4da8 <_malloc_r+0x29c>
    4fc2:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    4fc6:	d817      	bhi.n	4ff8 <_malloc_r+0x4ec>
    4fc8:	0beb      	lsrs	r3, r5, #15
    4fca:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    4fce:	f103 0e77 	add.w	lr, r3, #119	@ 0x77
    4fd2:	00c3      	lsls	r3, r0, #3
    4fd4:	e5df      	b.n	4b96 <_malloc_r+0x8a>
    4fd6:	f8c7 a408 	str.w	sl, [r7, #1032]	@ 0x408
    4fda:	e794      	b.n	4f06 <_malloc_r+0x3fa>
    4fdc:	2301      	movs	r3, #1
    4fde:	f8ca 3004 	str.w	r3, [sl, #4]
    4fe2:	e6b2      	b.n	4d4a <_malloc_r+0x23e>
    4fe4:	f5b2 7faa 	cmp.w	r2, #340	@ 0x154
    4fe8:	d823      	bhi.n	5032 <_malloc_r+0x526>
    4fea:	ea4f 32dc 	mov.w	r2, ip, lsr #15
    4fee:	f102 0378 	add.w	r3, r2, #120	@ 0x78
    4ff2:	00db      	lsls	r3, r3, #3
    4ff4:	3277      	adds	r2, #119	@ 0x77
    4ff6:	e6d7      	b.n	4da8 <_malloc_r+0x29c>
    4ff8:	f240 5254 	movw	r2, #1364	@ 0x554
    4ffc:	4293      	cmp	r3, r2
    4ffe:	d823      	bhi.n	5048 <_malloc_r+0x53c>
    5000:	0cab      	lsrs	r3, r5, #18
    5002:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    5006:	f103 0e7c 	add.w	lr, r3, #124	@ 0x7c
    500a:	00c3      	lsls	r3, r0, #3
    500c:	e5c3      	b.n	4b96 <_malloc_r+0x8a>
    500e:	9b00      	ldr	r3, [sp, #0]
    5010:	f1a3 0208 	sub.w	r2, r3, #8
    5014:	4490      	add	r8, r2
    5016:	eba8 080a 	sub.w	r8, r8, sl
    501a:	2100      	movs	r1, #0
    501c:	e78c      	b.n	4f38 <_malloc_r+0x42c>
    501e:	f104 0108 	add.w	r1, r4, #8
    5022:	4630      	mov	r0, r6
    5024:	f7fe f8f2 	bl	320c <_free_r>
    5028:	f8db 1004 	ldr.w	r1, [fp, #4]
    502c:	f8d7 a008 	ldr.w	sl, [r7, #8]
    5030:	e7a2      	b.n	4f78 <_malloc_r+0x46c>
    5032:	f240 5354 	movw	r3, #1364	@ 0x554
    5036:	429a      	cmp	r2, r3
    5038:	d80c      	bhi.n	5054 <_malloc_r+0x548>
    503a:	ea4f 429c 	mov.w	r2, ip, lsr #18
    503e:	f102 037d 	add.w	r3, r2, #125	@ 0x7d
    5042:	00db      	lsls	r3, r3, #3
    5044:	327c      	adds	r2, #124	@ 0x7c
    5046:	e6af      	b.n	4da8 <_malloc_r+0x29c>
    5048:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    504c:	207f      	movs	r0, #127	@ 0x7f
    504e:	f04f 0e7e 	mov.w	lr, #126	@ 0x7e
    5052:	e5a0      	b.n	4b96 <_malloc_r+0x8a>
    5054:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    5058:	227e      	movs	r2, #126	@ 0x7e
    505a:	e6a5      	b.n	4da8 <_malloc_r+0x29c>
    505c:	687b      	ldr	r3, [r7, #4]
    505e:	e72f      	b.n	4ec0 <_malloc_r+0x3b4>

00005060 <_fclose_r>:
    5060:	b570      	push	{r4, r5, r6, lr}
    5062:	b139      	cbz	r1, 5074 <_fclose_r+0x14>
    5064:	4606      	mov	r6, r0
    5066:	460c      	mov	r4, r1
    5068:	b108      	cbz	r0, 506e <_fclose_r+0xe>
    506a:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    506c:	b383      	cbz	r3, 50d0 <_fclose_r+0x70>
    506e:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    5072:	b913      	cbnz	r3, 507a <_fclose_r+0x1a>
    5074:	2500      	movs	r5, #0
    5076:	4628      	mov	r0, r5
    5078:	bd70      	pop	{r4, r5, r6, pc}
    507a:	4621      	mov	r1, r4
    507c:	4630      	mov	r0, r6
    507e:	f7fc ff57 	bl	1f30 <__sflush_r>
    5082:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
    5084:	4605      	mov	r5, r0
    5086:	b133      	cbz	r3, 5096 <_fclose_r+0x36>
    5088:	69e1      	ldr	r1, [r4, #28]
    508a:	4630      	mov	r0, r6
    508c:	4798      	blx	r3
    508e:	2800      	cmp	r0, #0
    5090:	bfb8      	it	lt
    5092:	f04f 35ff 	movlt.w	r5, #4294967295	@ 0xffffffff
    5096:	89a3      	ldrh	r3, [r4, #12]
    5098:	061b      	lsls	r3, r3, #24
    509a:	d41c      	bmi.n	50d6 <_fclose_r+0x76>
    509c:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    509e:	b141      	cbz	r1, 50b2 <_fclose_r+0x52>
    50a0:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    50a4:	4299      	cmp	r1, r3
    50a6:	d002      	beq.n	50ae <_fclose_r+0x4e>
    50a8:	4630      	mov	r0, r6
    50aa:	f7fe f8af 	bl	320c <_free_r>
    50ae:	2300      	movs	r3, #0
    50b0:	6323      	str	r3, [r4, #48]	@ 0x30
    50b2:	6c61      	ldr	r1, [r4, #68]	@ 0x44
    50b4:	b121      	cbz	r1, 50c0 <_fclose_r+0x60>
    50b6:	4630      	mov	r0, r6
    50b8:	f7fe f8a8 	bl	320c <_free_r>
    50bc:	2300      	movs	r3, #0
    50be:	6463      	str	r3, [r4, #68]	@ 0x44
    50c0:	f7fe fbda 	bl	3878 <__sfp_lock_acquire>
    50c4:	2300      	movs	r3, #0
    50c6:	81a3      	strh	r3, [r4, #12]
    50c8:	f7fe fbd8 	bl	387c <__sfp_lock_release>
    50cc:	4628      	mov	r0, r5
    50ce:	bd70      	pop	{r4, r5, r6, pc}
    50d0:	f7fe fbc2 	bl	3858 <__sinit>
    50d4:	e7cb      	b.n	506e <_fclose_r+0xe>
    50d6:	6921      	ldr	r1, [r4, #16]
    50d8:	4630      	mov	r0, r6
    50da:	f7fe f897 	bl	320c <_free_r>
    50de:	e7dd      	b.n	509c <_fclose_r+0x3c>

000050e0 <fclose>:
    50e0:	4b02      	ldr	r3, [pc, #8]	@ (50ec <fclose+0xc>)
    50e2:	4601      	mov	r1, r0
    50e4:	6818      	ldr	r0, [r3, #0]
    50e6:	f7ff bfbb 	b.w	5060 <_fclose_r>
    50ea:	bf00      	nop
    50ec:	000078b8 	.word	0x000078b8

000050f0 <_wctomb_r>:
    50f0:	b410      	push	{r4}
    50f2:	4c03      	ldr	r4, [pc, #12]	@ (5100 <_wctomb_r+0x10>)
    50f4:	f8d4 40e0 	ldr.w	r4, [r4, #224]	@ 0xe0
    50f8:	46a4      	mov	ip, r4
    50fa:	f85d 4b04 	ldr.w	r4, [sp], #4
    50fe:	4760      	bx	ip
    5100:	000079ec 	.word	0x000079ec

00005104 <__ascii_wctomb>:
    5104:	b149      	cbz	r1, 511a <__ascii_wctomb+0x16>
    5106:	2aff      	cmp	r2, #255	@ 0xff
    5108:	d802      	bhi.n	5110 <__ascii_wctomb+0xc>
    510a:	700a      	strb	r2, [r1, #0]
    510c:	2001      	movs	r0, #1
    510e:	4770      	bx	lr
    5110:	238a      	movs	r3, #138	@ 0x8a
    5112:	6003      	str	r3, [r0, #0]
    5114:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5118:	4770      	bx	lr
    511a:	4608      	mov	r0, r1
    511c:	4770      	bx	lr
    511e:	bf00      	nop

00005120 <__sread>:
    5120:	b510      	push	{r4, lr}
    5122:	460c      	mov	r4, r1
    5124:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    5128:	f001 f98e 	bl	6448 <_read_r>
    512c:	2800      	cmp	r0, #0
    512e:	db03      	blt.n	5138 <__sread+0x18>
    5130:	6d23      	ldr	r3, [r4, #80]	@ 0x50
    5132:	4403      	add	r3, r0
    5134:	6523      	str	r3, [r4, #80]	@ 0x50
    5136:	bd10      	pop	{r4, pc}
    5138:	89a3      	ldrh	r3, [r4, #12]
    513a:	f423 5380 	bic.w	r3, r3, #4096	@ 0x1000
    513e:	81a3      	strh	r3, [r4, #12]
    5140:	bd10      	pop	{r4, pc}
    5142:	bf00      	nop

00005144 <__seofread>:
    5144:	2000      	movs	r0, #0
    5146:	4770      	bx	lr

00005148 <__swrite>:
    5148:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    514c:	460c      	mov	r4, r1
    514e:	f9b1 100c 	ldrsh.w	r1, [r1, #12]
    5152:	461f      	mov	r7, r3
    5154:	05cb      	lsls	r3, r1, #23
    5156:	4605      	mov	r5, r0
    5158:	4616      	mov	r6, r2
    515a:	d40b      	bmi.n	5174 <__swrite+0x2c>
    515c:	f421 5180 	bic.w	r1, r1, #4096	@ 0x1000
    5160:	81a1      	strh	r1, [r4, #12]
    5162:	463b      	mov	r3, r7
    5164:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    5168:	4632      	mov	r2, r6
    516a:	4628      	mov	r0, r5
    516c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    5170:	f000 b820 	b.w	51b4 <_write_r>
    5174:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    5178:	2302      	movs	r3, #2
    517a:	2200      	movs	r2, #0
    517c:	f001 f97a 	bl	6474 <_lseek_r>
    5180:	f9b4 100c 	ldrsh.w	r1, [r4, #12]
    5184:	e7ea      	b.n	515c <__swrite+0x14>
    5186:	bf00      	nop

00005188 <__sseek>:
    5188:	b510      	push	{r4, lr}
    518a:	460c      	mov	r4, r1
    518c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    5190:	f001 f970 	bl	6474 <_lseek_r>
    5194:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    5198:	1c42      	adds	r2, r0, #1
    519a:	bf0e      	itee	eq
    519c:	f423 5380 	biceq.w	r3, r3, #4096	@ 0x1000
    51a0:	f443 5380 	orrne.w	r3, r3, #4096	@ 0x1000
    51a4:	6520      	strne	r0, [r4, #80]	@ 0x50
    51a6:	81a3      	strh	r3, [r4, #12]
    51a8:	bd10      	pop	{r4, pc}
    51aa:	bf00      	nop

000051ac <__sclose>:
    51ac:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    51b0:	f000 b9be 	b.w	5530 <_close_r>

000051b4 <_write_r>:
    51b4:	b538      	push	{r3, r4, r5, lr}
    51b6:	460c      	mov	r4, r1
    51b8:	4d08      	ldr	r5, [pc, #32]	@ (51dc <_write_r+0x28>)
    51ba:	4684      	mov	ip, r0
    51bc:	4611      	mov	r1, r2
    51be:	4620      	mov	r0, r4
    51c0:	461a      	mov	r2, r3
    51c2:	2300      	movs	r3, #0
    51c4:	602b      	str	r3, [r5, #0]
    51c6:	4664      	mov	r4, ip
    51c8:	f7fb faf8 	bl	7bc <__wrap__write>
    51cc:	1c43      	adds	r3, r0, #1
    51ce:	d000      	beq.n	51d2 <_write_r+0x1e>
    51d0:	bd38      	pop	{r3, r4, r5, pc}
    51d2:	682b      	ldr	r3, [r5, #0]
    51d4:	2b00      	cmp	r3, #0
    51d6:	d0fb      	beq.n	51d0 <_write_r+0x1c>
    51d8:	6023      	str	r3, [r4, #0]
    51da:	bd38      	pop	{r3, r4, r5, pc}
    51dc:	00007fa4 	.word	0x00007fa4

000051e0 <_fstat_r>:
    51e0:	b570      	push	{r4, r5, r6, lr}
    51e2:	460c      	mov	r4, r1
    51e4:	4d08      	ldr	r5, [pc, #32]	@ (5208 <_fstat_r+0x28>)
    51e6:	4603      	mov	r3, r0
    51e8:	2600      	movs	r6, #0
    51ea:	4620      	mov	r0, r4
    51ec:	4611      	mov	r1, r2
    51ee:	461c      	mov	r4, r3
    51f0:	602e      	str	r6, [r5, #0]
    51f2:	f7fb fa79 	bl	6e8 <__wrap__fstat>
    51f6:	1c43      	adds	r3, r0, #1
    51f8:	d000      	beq.n	51fc <_fstat_r+0x1c>
    51fa:	bd70      	pop	{r4, r5, r6, pc}
    51fc:	682b      	ldr	r3, [r5, #0]
    51fe:	2b00      	cmp	r3, #0
    5200:	d0fb      	beq.n	51fa <_fstat_r+0x1a>
    5202:	6023      	str	r3, [r4, #0]
    5204:	bd70      	pop	{r4, r5, r6, pc}
    5206:	bf00      	nop
    5208:	00007fa4 	.word	0x00007fa4

0000520c <_isatty_r>:
    520c:	b538      	push	{r3, r4, r5, lr}
    520e:	4d07      	ldr	r5, [pc, #28]	@ (522c <_isatty_r+0x20>)
    5210:	2200      	movs	r2, #0
    5212:	4604      	mov	r4, r0
    5214:	4608      	mov	r0, r1
    5216:	602a      	str	r2, [r5, #0]
    5218:	f7fb fa86 	bl	728 <__wrap__isatty>
    521c:	1c43      	adds	r3, r0, #1
    521e:	d000      	beq.n	5222 <_isatty_r+0x16>
    5220:	bd38      	pop	{r3, r4, r5, pc}
    5222:	682b      	ldr	r3, [r5, #0]
    5224:	2b00      	cmp	r3, #0
    5226:	d0fb      	beq.n	5220 <_isatty_r+0x14>
    5228:	6023      	str	r3, [r4, #0]
    522a:	bd38      	pop	{r3, r4, r5, pc}
    522c:	00007fa4 	.word	0x00007fa4

00005230 <__sfvwrite_r>:
    5230:	6893      	ldr	r3, [r2, #8]
    5232:	2b00      	cmp	r3, #0
    5234:	f000 80f8 	beq.w	5428 <__sfvwrite_r+0x1f8>
    5238:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    523c:	f9b1 c00c 	ldrsh.w	ip, [r1, #12]
    5240:	f01c 0f08 	tst.w	ip, #8
    5244:	b083      	sub	sp, #12
    5246:	4690      	mov	r8, r2
    5248:	4681      	mov	r9, r0
    524a:	460c      	mov	r4, r1
    524c:	d031      	beq.n	52b2 <__sfvwrite_r+0x82>
    524e:	690b      	ldr	r3, [r1, #16]
    5250:	b37b      	cbz	r3, 52b2 <__sfvwrite_r+0x82>
    5252:	f01c 0702 	ands.w	r7, ip, #2
    5256:	f8d8 6000 	ldr.w	r6, [r8]
    525a:	d038      	beq.n	52ce <__sfvwrite_r+0x9e>
    525c:	2700      	movs	r7, #0
    525e:	f8d4 b024 	ldr.w	fp, [r4, #36]	@ 0x24
    5262:	69e1      	ldr	r1, [r4, #28]
    5264:	f8df a2c4 	ldr.w	sl, [pc, #708]	@ 552c <__sfvwrite_r+0x2fc>
    5268:	463d      	mov	r5, r7
    526a:	4555      	cmp	r5, sl
    526c:	462b      	mov	r3, r5
    526e:	463a      	mov	r2, r7
    5270:	bf28      	it	cs
    5272:	4653      	movcs	r3, sl
    5274:	4648      	mov	r0, r9
    5276:	b1c5      	cbz	r5, 52aa <__sfvwrite_r+0x7a>
    5278:	47d8      	blx	fp
    527a:	2800      	cmp	r0, #0
    527c:	f340 80ca 	ble.w	5414 <__sfvwrite_r+0x1e4>
    5280:	f8d8 3008 	ldr.w	r3, [r8, #8]
    5284:	1a1b      	subs	r3, r3, r0
    5286:	4407      	add	r7, r0
    5288:	1a2d      	subs	r5, r5, r0
    528a:	f8c8 3008 	str.w	r3, [r8, #8]
    528e:	2b00      	cmp	r3, #0
    5290:	f000 80b6 	beq.w	5400 <__sfvwrite_r+0x1d0>
    5294:	4555      	cmp	r5, sl
    5296:	462b      	mov	r3, r5
    5298:	f8d4 b024 	ldr.w	fp, [r4, #36]	@ 0x24
    529c:	69e1      	ldr	r1, [r4, #28]
    529e:	bf28      	it	cs
    52a0:	4653      	movcs	r3, sl
    52a2:	463a      	mov	r2, r7
    52a4:	4648      	mov	r0, r9
    52a6:	2d00      	cmp	r5, #0
    52a8:	d1e6      	bne.n	5278 <__sfvwrite_r+0x48>
    52aa:	e9d6 7500 	ldrd	r7, r5, [r6]
    52ae:	3608      	adds	r6, #8
    52b0:	e7db      	b.n	526a <__sfvwrite_r+0x3a>
    52b2:	4621      	mov	r1, r4
    52b4:	4648      	mov	r0, r9
    52b6:	f7fd feeb 	bl	3090 <__swsetup_r>
    52ba:	2800      	cmp	r0, #0
    52bc:	f040 80af 	bne.w	541e <__sfvwrite_r+0x1ee>
    52c0:	f9b4 c00c 	ldrsh.w	ip, [r4, #12]
    52c4:	f8d8 6000 	ldr.w	r6, [r8]
    52c8:	f01c 0702 	ands.w	r7, ip, #2
    52cc:	d1c6      	bne.n	525c <__sfvwrite_r+0x2c>
    52ce:	f01c 0a01 	ands.w	sl, ip, #1
    52d2:	d163      	bne.n	539c <__sfvwrite_r+0x16c>
    52d4:	6823      	ldr	r3, [r4, #0]
    52d6:	68a1      	ldr	r1, [r4, #8]
    52d8:	4657      	mov	r7, sl
    52da:	4618      	mov	r0, r3
    52dc:	468b      	mov	fp, r1
    52de:	2f00      	cmp	r7, #0
    52e0:	d058      	beq.n	5394 <__sfvwrite_r+0x164>
    52e2:	f41c 7f00 	tst.w	ip, #512	@ 0x200
    52e6:	f000 80b5 	beq.w	5454 <__sfvwrite_r+0x224>
    52ea:	42b9      	cmp	r1, r7
    52ec:	460a      	mov	r2, r1
    52ee:	f200 80e1 	bhi.w	54b4 <__sfvwrite_r+0x284>
    52f2:	f41c 6f90 	tst.w	ip, #1152	@ 0x480
    52f6:	d02f      	beq.n	5358 <__sfvwrite_r+0x128>
    52f8:	6921      	ldr	r1, [r4, #16]
    52fa:	6962      	ldr	r2, [r4, #20]
    52fc:	1a5d      	subs	r5, r3, r1
    52fe:	eb02 0242 	add.w	r2, r2, r2, lsl #1
    5302:	eb02 72d2 	add.w	r2, r2, r2, lsr #31
    5306:	1c6b      	adds	r3, r5, #1
    5308:	1052      	asrs	r2, r2, #1
    530a:	443b      	add	r3, r7
    530c:	4293      	cmp	r3, r2
    530e:	bf92      	itee	ls
    5310:	4693      	movls	fp, r2
    5312:	469b      	movhi	fp, r3
    5314:	461a      	movhi	r2, r3
    5316:	f41c 6f80 	tst.w	ip, #1024	@ 0x400
    531a:	f000 80ea 	beq.w	54f2 <__sfvwrite_r+0x2c2>
    531e:	4611      	mov	r1, r2
    5320:	4648      	mov	r0, r9
    5322:	f7ff fbf3 	bl	4b0c <_malloc_r>
    5326:	2800      	cmp	r0, #0
    5328:	f000 80f9 	beq.w	551e <__sfvwrite_r+0x2ee>
    532c:	462a      	mov	r2, r5
    532e:	6921      	ldr	r1, [r4, #16]
    5330:	9000      	str	r0, [sp, #0]
    5332:	f7fe f8c9 	bl	34c8 <memcpy>
    5336:	89a2      	ldrh	r2, [r4, #12]
    5338:	9b00      	ldr	r3, [sp, #0]
    533a:	f422 6290 	bic.w	r2, r2, #1152	@ 0x480
    533e:	f042 0280 	orr.w	r2, r2, #128	@ 0x80
    5342:	81a2      	strh	r2, [r4, #12]
    5344:	1958      	adds	r0, r3, r5
    5346:	ebab 0505 	sub.w	r5, fp, r5
    534a:	f8c4 b014 	str.w	fp, [r4, #20]
    534e:	6123      	str	r3, [r4, #16]
    5350:	60a5      	str	r5, [r4, #8]
    5352:	6020      	str	r0, [r4, #0]
    5354:	46bb      	mov	fp, r7
    5356:	463a      	mov	r2, r7
    5358:	4651      	mov	r1, sl
    535a:	9200      	str	r2, [sp, #0]
    535c:	f000 fa52 	bl	5804 <memmove>
    5360:	68a1      	ldr	r1, [r4, #8]
    5362:	6823      	ldr	r3, [r4, #0]
    5364:	9a00      	ldr	r2, [sp, #0]
    5366:	eba1 010b 	sub.w	r1, r1, fp
    536a:	441a      	add	r2, r3
    536c:	463d      	mov	r5, r7
    536e:	60a1      	str	r1, [r4, #8]
    5370:	6022      	str	r2, [r4, #0]
    5372:	2700      	movs	r7, #0
    5374:	f8d8 3008 	ldr.w	r3, [r8, #8]
    5378:	1b5b      	subs	r3, r3, r5
    537a:	44aa      	add	sl, r5
    537c:	f8c8 3008 	str.w	r3, [r8, #8]
    5380:	2b00      	cmp	r3, #0
    5382:	d03d      	beq.n	5400 <__sfvwrite_r+0x1d0>
    5384:	6823      	ldr	r3, [r4, #0]
    5386:	68a1      	ldr	r1, [r4, #8]
    5388:	f9b4 c00c 	ldrsh.w	ip, [r4, #12]
    538c:	4618      	mov	r0, r3
    538e:	468b      	mov	fp, r1
    5390:	2f00      	cmp	r7, #0
    5392:	d1a6      	bne.n	52e2 <__sfvwrite_r+0xb2>
    5394:	e9d6 a700 	ldrd	sl, r7, [r6]
    5398:	3608      	adds	r6, #8
    539a:	e79e      	b.n	52da <__sfvwrite_r+0xaa>
    539c:	4638      	mov	r0, r7
    539e:	46bb      	mov	fp, r7
    53a0:	463d      	mov	r5, r7
    53a2:	9700      	str	r7, [sp, #0]
    53a4:	2d00      	cmp	r5, #0
    53a6:	d041      	beq.n	542c <__sfvwrite_r+0x1fc>
    53a8:	2800      	cmp	r0, #0
    53aa:	d046      	beq.n	543a <__sfvwrite_r+0x20a>
    53ac:	9a00      	ldr	r2, [sp, #0]
    53ae:	6820      	ldr	r0, [r4, #0]
    53b0:	68a1      	ldr	r1, [r4, #8]
    53b2:	e9d4 7304 	ldrd	r7, r3, [r4, #16]
    53b6:	42aa      	cmp	r2, r5
    53b8:	bf28      	it	cs
    53ba:	462a      	movcs	r2, r5
    53bc:	42b8      	cmp	r0, r7
    53be:	d904      	bls.n	53ca <__sfvwrite_r+0x19a>
    53c0:	eb01 0a03 	add.w	sl, r1, r3
    53c4:	4552      	cmp	r2, sl
    53c6:	f300 8085 	bgt.w	54d4 <__sfvwrite_r+0x2a4>
    53ca:	4293      	cmp	r3, r2
    53cc:	dc75      	bgt.n	54ba <__sfvwrite_r+0x28a>
    53ce:	69e1      	ldr	r1, [r4, #28]
    53d0:	6a67      	ldr	r7, [r4, #36]	@ 0x24
    53d2:	465a      	mov	r2, fp
    53d4:	4648      	mov	r0, r9
    53d6:	47b8      	blx	r7
    53d8:	f1b0 0a00 	subs.w	sl, r0, #0
    53dc:	dd1a      	ble.n	5414 <__sfvwrite_r+0x1e4>
    53de:	9b00      	ldr	r3, [sp, #0]
    53e0:	ebb3 030a 	subs.w	r3, r3, sl
    53e4:	9300      	str	r3, [sp, #0]
    53e6:	d00f      	beq.n	5408 <__sfvwrite_r+0x1d8>
    53e8:	2001      	movs	r0, #1
    53ea:	f8d8 3008 	ldr.w	r3, [r8, #8]
    53ee:	eba3 030a 	sub.w	r3, r3, sl
    53f2:	44d3      	add	fp, sl
    53f4:	eba5 050a 	sub.w	r5, r5, sl
    53f8:	f8c8 3008 	str.w	r3, [r8, #8]
    53fc:	2b00      	cmp	r3, #0
    53fe:	d1d1      	bne.n	53a4 <__sfvwrite_r+0x174>
    5400:	2000      	movs	r0, #0
    5402:	b003      	add	sp, #12
    5404:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5408:	4621      	mov	r1, r4
    540a:	4648      	mov	r0, r9
    540c:	f7fc fe2c 	bl	2068 <_fflush_r>
    5410:	2800      	cmp	r0, #0
    5412:	d0ea      	beq.n	53ea <__sfvwrite_r+0x1ba>
    5414:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    5418:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    541c:	81a3      	strh	r3, [r4, #12]
    541e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5422:	b003      	add	sp, #12
    5424:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5428:	2000      	movs	r0, #0
    542a:	4770      	bx	lr
    542c:	6875      	ldr	r5, [r6, #4]
    542e:	4633      	mov	r3, r6
    5430:	3608      	adds	r6, #8
    5432:	2d00      	cmp	r5, #0
    5434:	d0fa      	beq.n	542c <__sfvwrite_r+0x1fc>
    5436:	f8d3 b000 	ldr.w	fp, [r3]
    543a:	462a      	mov	r2, r5
    543c:	210a      	movs	r1, #10
    543e:	4658      	mov	r0, fp
    5440:	f7fc fd26 	bl	1e90 <memchr>
    5444:	2800      	cmp	r0, #0
    5446:	d067      	beq.n	5518 <__sfvwrite_r+0x2e8>
    5448:	3001      	adds	r0, #1
    544a:	eba0 030b 	sub.w	r3, r0, fp
    544e:	9300      	str	r3, [sp, #0]
    5450:	461a      	mov	r2, r3
    5452:	e7ac      	b.n	53ae <__sfvwrite_r+0x17e>
    5454:	6922      	ldr	r2, [r4, #16]
    5456:	429a      	cmp	r2, r3
    5458:	d314      	bcc.n	5484 <__sfvwrite_r+0x254>
    545a:	6962      	ldr	r2, [r4, #20]
    545c:	42ba      	cmp	r2, r7
    545e:	d811      	bhi.n	5484 <__sfvwrite_r+0x254>
    5460:	f06f 4300 	mvn.w	r3, #2147483648	@ 0x80000000
    5464:	42bb      	cmp	r3, r7
    5466:	bf28      	it	cs
    5468:	463b      	movcs	r3, r7
    546a:	6a65      	ldr	r5, [r4, #36]	@ 0x24
    546c:	fb93 f3f2 	sdiv	r3, r3, r2
    5470:	69e1      	ldr	r1, [r4, #28]
    5472:	fb02 f303 	mul.w	r3, r2, r3
    5476:	4648      	mov	r0, r9
    5478:	4652      	mov	r2, sl
    547a:	47a8      	blx	r5
    547c:	1e05      	subs	r5, r0, #0
    547e:	ddc9      	ble.n	5414 <__sfvwrite_r+0x1e4>
    5480:	1b7f      	subs	r7, r7, r5
    5482:	e777      	b.n	5374 <__sfvwrite_r+0x144>
    5484:	42b9      	cmp	r1, r7
    5486:	bf28      	it	cs
    5488:	4639      	movcs	r1, r7
    548a:	460d      	mov	r5, r1
    548c:	4618      	mov	r0, r3
    548e:	460a      	mov	r2, r1
    5490:	4651      	mov	r1, sl
    5492:	f000 f9b7 	bl	5804 <memmove>
    5496:	68a1      	ldr	r1, [r4, #8]
    5498:	6823      	ldr	r3, [r4, #0]
    549a:	1b49      	subs	r1, r1, r5
    549c:	442b      	add	r3, r5
    549e:	60a1      	str	r1, [r4, #8]
    54a0:	6023      	str	r3, [r4, #0]
    54a2:	2900      	cmp	r1, #0
    54a4:	d1ec      	bne.n	5480 <__sfvwrite_r+0x250>
    54a6:	4621      	mov	r1, r4
    54a8:	4648      	mov	r0, r9
    54aa:	f7fc fddd 	bl	2068 <_fflush_r>
    54ae:	2800      	cmp	r0, #0
    54b0:	d0e6      	beq.n	5480 <__sfvwrite_r+0x250>
    54b2:	e7af      	b.n	5414 <__sfvwrite_r+0x1e4>
    54b4:	46bb      	mov	fp, r7
    54b6:	463a      	mov	r2, r7
    54b8:	e74e      	b.n	5358 <__sfvwrite_r+0x128>
    54ba:	4659      	mov	r1, fp
    54bc:	9201      	str	r2, [sp, #4]
    54be:	f000 f9a1 	bl	5804 <memmove>
    54c2:	9a01      	ldr	r2, [sp, #4]
    54c4:	68a3      	ldr	r3, [r4, #8]
    54c6:	1a9b      	subs	r3, r3, r2
    54c8:	60a3      	str	r3, [r4, #8]
    54ca:	6823      	ldr	r3, [r4, #0]
    54cc:	4413      	add	r3, r2
    54ce:	6023      	str	r3, [r4, #0]
    54d0:	4692      	mov	sl, r2
    54d2:	e784      	b.n	53de <__sfvwrite_r+0x1ae>
    54d4:	4659      	mov	r1, fp
    54d6:	4652      	mov	r2, sl
    54d8:	f000 f994 	bl	5804 <memmove>
    54dc:	6823      	ldr	r3, [r4, #0]
    54de:	4453      	add	r3, sl
    54e0:	6023      	str	r3, [r4, #0]
    54e2:	4621      	mov	r1, r4
    54e4:	4648      	mov	r0, r9
    54e6:	f7fc fdbf 	bl	2068 <_fflush_r>
    54ea:	2800      	cmp	r0, #0
    54ec:	f43f af77 	beq.w	53de <__sfvwrite_r+0x1ae>
    54f0:	e790      	b.n	5414 <__sfvwrite_r+0x1e4>
    54f2:	4648      	mov	r0, r9
    54f4:	f000 ffd4 	bl	64a0 <_realloc_r>
    54f8:	4603      	mov	r3, r0
    54fa:	2800      	cmp	r0, #0
    54fc:	f47f af22 	bne.w	5344 <__sfvwrite_r+0x114>
    5500:	6921      	ldr	r1, [r4, #16]
    5502:	4648      	mov	r0, r9
    5504:	f7fd fe82 	bl	320c <_free_r>
    5508:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    550c:	220c      	movs	r2, #12
    550e:	f8c9 2000 	str.w	r2, [r9]
    5512:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
    5516:	e77f      	b.n	5418 <__sfvwrite_r+0x1e8>
    5518:	1c6a      	adds	r2, r5, #1
    551a:	9200      	str	r2, [sp, #0]
    551c:	e747      	b.n	53ae <__sfvwrite_r+0x17e>
    551e:	220c      	movs	r2, #12
    5520:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    5524:	f8c9 2000 	str.w	r2, [r9]
    5528:	e776      	b.n	5418 <__sfvwrite_r+0x1e8>
    552a:	bf00      	nop
    552c:	7ffffc00 	.word	0x7ffffc00

00005530 <_close_r>:
    5530:	b538      	push	{r3, r4, r5, lr}
    5532:	4d07      	ldr	r5, [pc, #28]	@ (5550 <_close_r+0x20>)
    5534:	2200      	movs	r2, #0
    5536:	4604      	mov	r4, r0
    5538:	4608      	mov	r0, r1
    553a:	602a      	str	r2, [r5, #0]
    553c:	f7fb f8c2 	bl	6c4 <__wrap__close>
    5540:	1c43      	adds	r3, r0, #1
    5542:	d000      	beq.n	5546 <_close_r+0x16>
    5544:	bd38      	pop	{r3, r4, r5, pc}
    5546:	682b      	ldr	r3, [r5, #0]
    5548:	2b00      	cmp	r3, #0
    554a:	d0fb      	beq.n	5544 <_close_r+0x14>
    554c:	6023      	str	r3, [r4, #0]
    554e:	bd38      	pop	{r3, r4, r5, pc}
    5550:	00007fa4 	.word	0x00007fa4

00005554 <_init_signal_r>:
    5554:	b538      	push	{r3, r4, r5, lr}
    5556:	f8d0 4118 	ldr.w	r4, [r0, #280]	@ 0x118
    555a:	b10c      	cbz	r4, 5560 <_init_signal_r+0xc>
    555c:	2000      	movs	r0, #0
    555e:	bd38      	pop	{r3, r4, r5, pc}
    5560:	2180      	movs	r1, #128	@ 0x80
    5562:	4605      	mov	r5, r0
    5564:	f7ff fad2 	bl	4b0c <_malloc_r>
    5568:	4602      	mov	r2, r0
    556a:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    556e:	b130      	cbz	r0, 557e <_init_signal_r+0x2a>
    5570:	1f03      	subs	r3, r0, #4
    5572:	327c      	adds	r2, #124	@ 0x7c
    5574:	f843 4f04 	str.w	r4, [r3, #4]!
    5578:	4293      	cmp	r3, r2
    557a:	d1fb      	bne.n	5574 <_init_signal_r+0x20>
    557c:	e7ee      	b.n	555c <_init_signal_r+0x8>
    557e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5582:	bd38      	pop	{r3, r4, r5, pc}

00005584 <_signal_r>:
    5584:	b530      	push	{r4, r5, lr}
    5586:	291f      	cmp	r1, #31
    5588:	b083      	sub	sp, #12
    558a:	4605      	mov	r5, r0
    558c:	d809      	bhi.n	55a2 <_signal_r+0x1e>
    558e:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    5592:	460c      	mov	r4, r1
    5594:	b153      	cbz	r3, 55ac <_signal_r+0x28>
    5596:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    559a:	f843 2024 	str.w	r2, [r3, r4, lsl #2]
    559e:	b003      	add	sp, #12
    55a0:	bd30      	pop	{r4, r5, pc}
    55a2:	2316      	movs	r3, #22
    55a4:	6003      	str	r3, [r0, #0]
    55a6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    55aa:	e7f8      	b.n	559e <_signal_r+0x1a>
    55ac:	2180      	movs	r1, #128	@ 0x80
    55ae:	9201      	str	r2, [sp, #4]
    55b0:	f7ff faac 	bl	4b0c <_malloc_r>
    55b4:	9a01      	ldr	r2, [sp, #4]
    55b6:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    55ba:	4603      	mov	r3, r0
    55bc:	2800      	cmp	r0, #0
    55be:	d0f2      	beq.n	55a6 <_signal_r+0x22>
    55c0:	1f01      	subs	r1, r0, #4
    55c2:	f100 057c 	add.w	r5, r0, #124	@ 0x7c
    55c6:	2000      	movs	r0, #0
    55c8:	f841 0f04 	str.w	r0, [r1, #4]!
    55cc:	42a9      	cmp	r1, r5
    55ce:	d1fb      	bne.n	55c8 <_signal_r+0x44>
    55d0:	e7e1      	b.n	5596 <_signal_r+0x12>
    55d2:	bf00      	nop

000055d4 <_raise_r>:
    55d4:	291f      	cmp	r1, #31
    55d6:	b538      	push	{r3, r4, r5, lr}
    55d8:	4605      	mov	r5, r0
    55da:	d81f      	bhi.n	561c <_raise_r+0x48>
    55dc:	f8d0 2118 	ldr.w	r2, [r0, #280]	@ 0x118
    55e0:	460c      	mov	r4, r1
    55e2:	b16a      	cbz	r2, 5600 <_raise_r+0x2c>
    55e4:	f852 3021 	ldr.w	r3, [r2, r1, lsl #2]
    55e8:	b153      	cbz	r3, 5600 <_raise_r+0x2c>
    55ea:	2b01      	cmp	r3, #1
    55ec:	d006      	beq.n	55fc <_raise_r+0x28>
    55ee:	1c59      	adds	r1, r3, #1
    55f0:	d010      	beq.n	5614 <_raise_r+0x40>
    55f2:	2100      	movs	r1, #0
    55f4:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
    55f8:	4620      	mov	r0, r4
    55fa:	4798      	blx	r3
    55fc:	2000      	movs	r0, #0
    55fe:	bd38      	pop	{r3, r4, r5, pc}
    5600:	4628      	mov	r0, r5
    5602:	f000 f8fd 	bl	5800 <_getpid_r>
    5606:	4622      	mov	r2, r4
    5608:	4601      	mov	r1, r0
    560a:	4628      	mov	r0, r5
    560c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    5610:	f000 b8e0 	b.w	57d4 <_kill_r>
    5614:	2316      	movs	r3, #22
    5616:	6003      	str	r3, [r0, #0]
    5618:	2001      	movs	r0, #1
    561a:	bd38      	pop	{r3, r4, r5, pc}
    561c:	2316      	movs	r3, #22
    561e:	6003      	str	r3, [r0, #0]
    5620:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5624:	bd38      	pop	{r3, r4, r5, pc}
    5626:	bf00      	nop

00005628 <__sigtramp_r>:
    5628:	291f      	cmp	r1, #31
    562a:	d82c      	bhi.n	5686 <__sigtramp_r+0x5e>
    562c:	b538      	push	{r3, r4, r5, lr}
    562e:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    5632:	460c      	mov	r4, r1
    5634:	4605      	mov	r5, r0
    5636:	b1a3      	cbz	r3, 5662 <__sigtramp_r+0x3a>
    5638:	f853 2024 	ldr.w	r2, [r3, r4, lsl #2]
    563c:	eb03 0384 	add.w	r3, r3, r4, lsl #2
    5640:	b14a      	cbz	r2, 5656 <__sigtramp_r+0x2e>
    5642:	1c51      	adds	r1, r2, #1
    5644:	d00b      	beq.n	565e <__sigtramp_r+0x36>
    5646:	2a01      	cmp	r2, #1
    5648:	d007      	beq.n	565a <__sigtramp_r+0x32>
    564a:	2500      	movs	r5, #0
    564c:	4620      	mov	r0, r4
    564e:	601d      	str	r5, [r3, #0]
    5650:	4790      	blx	r2
    5652:	4628      	mov	r0, r5
    5654:	bd38      	pop	{r3, r4, r5, pc}
    5656:	2001      	movs	r0, #1
    5658:	bd38      	pop	{r3, r4, r5, pc}
    565a:	2003      	movs	r0, #3
    565c:	bd38      	pop	{r3, r4, r5, pc}
    565e:	2002      	movs	r0, #2
    5660:	bd38      	pop	{r3, r4, r5, pc}
    5662:	2180      	movs	r1, #128	@ 0x80
    5664:	f7ff fa52 	bl	4b0c <_malloc_r>
    5668:	4603      	mov	r3, r0
    566a:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    566e:	b138      	cbz	r0, 5680 <__sigtramp_r+0x58>
    5670:	1f02      	subs	r2, r0, #4
    5672:	2100      	movs	r1, #0
    5674:	307c      	adds	r0, #124	@ 0x7c
    5676:	f842 1f04 	str.w	r1, [r2, #4]!
    567a:	4282      	cmp	r2, r0
    567c:	d1fb      	bne.n	5676 <__sigtramp_r+0x4e>
    567e:	e7db      	b.n	5638 <__sigtramp_r+0x10>
    5680:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5684:	bd38      	pop	{r3, r4, r5, pc}
    5686:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    568a:	4770      	bx	lr

0000568c <raise>:
    568c:	b538      	push	{r3, r4, r5, lr}
    568e:	4b14      	ldr	r3, [pc, #80]	@ (56e0 <raise+0x54>)
    5690:	281f      	cmp	r0, #31
    5692:	681d      	ldr	r5, [r3, #0]
    5694:	d81e      	bhi.n	56d4 <raise+0x48>
    5696:	f8d5 2118 	ldr.w	r2, [r5, #280]	@ 0x118
    569a:	4604      	mov	r4, r0
    569c:	b162      	cbz	r2, 56b8 <raise+0x2c>
    569e:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
    56a2:	b14b      	cbz	r3, 56b8 <raise+0x2c>
    56a4:	2b01      	cmp	r3, #1
    56a6:	d005      	beq.n	56b4 <raise+0x28>
    56a8:	1c59      	adds	r1, r3, #1
    56aa:	d00f      	beq.n	56cc <raise+0x40>
    56ac:	2100      	movs	r1, #0
    56ae:	f842 1020 	str.w	r1, [r2, r0, lsl #2]
    56b2:	4798      	blx	r3
    56b4:	2000      	movs	r0, #0
    56b6:	bd38      	pop	{r3, r4, r5, pc}
    56b8:	4628      	mov	r0, r5
    56ba:	f000 f8a1 	bl	5800 <_getpid_r>
    56be:	4622      	mov	r2, r4
    56c0:	4601      	mov	r1, r0
    56c2:	4628      	mov	r0, r5
    56c4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    56c8:	f000 b884 	b.w	57d4 <_kill_r>
    56cc:	2316      	movs	r3, #22
    56ce:	602b      	str	r3, [r5, #0]
    56d0:	2001      	movs	r0, #1
    56d2:	bd38      	pop	{r3, r4, r5, pc}
    56d4:	2316      	movs	r3, #22
    56d6:	602b      	str	r3, [r5, #0]
    56d8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    56dc:	bd38      	pop	{r3, r4, r5, pc}
    56de:	bf00      	nop
    56e0:	000078b8 	.word	0x000078b8

000056e4 <signal>:
    56e4:	4b12      	ldr	r3, [pc, #72]	@ (5730 <signal+0x4c>)
    56e6:	281f      	cmp	r0, #31
    56e8:	b570      	push	{r4, r5, r6, lr}
    56ea:	681e      	ldr	r6, [r3, #0]
    56ec:	d809      	bhi.n	5702 <signal+0x1e>
    56ee:	f8d6 3118 	ldr.w	r3, [r6, #280]	@ 0x118
    56f2:	4604      	mov	r4, r0
    56f4:	460d      	mov	r5, r1
    56f6:	b14b      	cbz	r3, 570c <signal+0x28>
    56f8:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    56fc:	f843 5024 	str.w	r5, [r3, r4, lsl #2]
    5700:	bd70      	pop	{r4, r5, r6, pc}
    5702:	2316      	movs	r3, #22
    5704:	6033      	str	r3, [r6, #0]
    5706:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    570a:	bd70      	pop	{r4, r5, r6, pc}
    570c:	2180      	movs	r1, #128	@ 0x80
    570e:	4630      	mov	r0, r6
    5710:	f7ff f9fc 	bl	4b0c <_malloc_r>
    5714:	4603      	mov	r3, r0
    5716:	f8c6 0118 	str.w	r0, [r6, #280]	@ 0x118
    571a:	2800      	cmp	r0, #0
    571c:	d0f3      	beq.n	5706 <signal+0x22>
    571e:	1f02      	subs	r2, r0, #4
    5720:	2100      	movs	r1, #0
    5722:	307c      	adds	r0, #124	@ 0x7c
    5724:	f842 1f04 	str.w	r1, [r2, #4]!
    5728:	4282      	cmp	r2, r0
    572a:	d1fb      	bne.n	5724 <signal+0x40>
    572c:	e7e4      	b.n	56f8 <signal+0x14>
    572e:	bf00      	nop
    5730:	000078b8 	.word	0x000078b8

00005734 <_init_signal>:
    5734:	b538      	push	{r3, r4, r5, lr}
    5736:	4b0c      	ldr	r3, [pc, #48]	@ (5768 <_init_signal+0x34>)
    5738:	681d      	ldr	r5, [r3, #0]
    573a:	f8d5 4118 	ldr.w	r4, [r5, #280]	@ 0x118
    573e:	b10c      	cbz	r4, 5744 <_init_signal+0x10>
    5740:	2000      	movs	r0, #0
    5742:	bd38      	pop	{r3, r4, r5, pc}
    5744:	2180      	movs	r1, #128	@ 0x80
    5746:	4628      	mov	r0, r5
    5748:	f7ff f9e0 	bl	4b0c <_malloc_r>
    574c:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    5750:	b138      	cbz	r0, 5762 <_init_signal+0x2e>
    5752:	1f03      	subs	r3, r0, #4
    5754:	f100 027c 	add.w	r2, r0, #124	@ 0x7c
    5758:	f843 4f04 	str.w	r4, [r3, #4]!
    575c:	4293      	cmp	r3, r2
    575e:	d1fb      	bne.n	5758 <_init_signal+0x24>
    5760:	e7ee      	b.n	5740 <_init_signal+0xc>
    5762:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    5766:	bd38      	pop	{r3, r4, r5, pc}
    5768:	000078b8 	.word	0x000078b8

0000576c <__sigtramp>:
    576c:	b538      	push	{r3, r4, r5, lr}
    576e:	4b18      	ldr	r3, [pc, #96]	@ (57d0 <__sigtramp+0x64>)
    5770:	281f      	cmp	r0, #31
    5772:	681d      	ldr	r5, [r3, #0]
    5774:	d828      	bhi.n	57c8 <__sigtramp+0x5c>
    5776:	4604      	mov	r4, r0
    5778:	f8d5 0118 	ldr.w	r0, [r5, #280]	@ 0x118
    577c:	b1a0      	cbz	r0, 57a8 <__sigtramp+0x3c>
    577e:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
    5782:	eb00 0084 	add.w	r0, r0, r4, lsl #2
    5786:	b14b      	cbz	r3, 579c <__sigtramp+0x30>
    5788:	1c5a      	adds	r2, r3, #1
    578a:	d00b      	beq.n	57a4 <__sigtramp+0x38>
    578c:	2b01      	cmp	r3, #1
    578e:	d007      	beq.n	57a0 <__sigtramp+0x34>
    5790:	2500      	movs	r5, #0
    5792:	6005      	str	r5, [r0, #0]
    5794:	4620      	mov	r0, r4
    5796:	4798      	blx	r3
    5798:	4628      	mov	r0, r5
    579a:	bd38      	pop	{r3, r4, r5, pc}
    579c:	2001      	movs	r0, #1
    579e:	bd38      	pop	{r3, r4, r5, pc}
    57a0:	2003      	movs	r0, #3
    57a2:	bd38      	pop	{r3, r4, r5, pc}
    57a4:	2002      	movs	r0, #2
    57a6:	bd38      	pop	{r3, r4, r5, pc}
    57a8:	2180      	movs	r1, #128	@ 0x80
    57aa:	4628      	mov	r0, r5
    57ac:	f7ff f9ae 	bl	4b0c <_malloc_r>
    57b0:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    57b4:	b140      	cbz	r0, 57c8 <__sigtramp+0x5c>
    57b6:	1f03      	subs	r3, r0, #4
    57b8:	f100 017c 	add.w	r1, r0, #124	@ 0x7c
    57bc:	2200      	movs	r2, #0
    57be:	f843 2f04 	str.w	r2, [r3, #4]!
    57c2:	428b      	cmp	r3, r1
    57c4:	d1fb      	bne.n	57be <__sigtramp+0x52>
    57c6:	e7da      	b.n	577e <__sigtramp+0x12>
    57c8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    57cc:	bd38      	pop	{r3, r4, r5, pc}
    57ce:	bf00      	nop
    57d0:	000078b8 	.word	0x000078b8

000057d4 <_kill_r>:
    57d4:	b570      	push	{r4, r5, r6, lr}
    57d6:	460c      	mov	r4, r1
    57d8:	4d08      	ldr	r5, [pc, #32]	@ (57fc <_kill_r+0x28>)
    57da:	4603      	mov	r3, r0
    57dc:	2600      	movs	r6, #0
    57de:	4620      	mov	r0, r4
    57e0:	4611      	mov	r1, r2
    57e2:	461c      	mov	r4, r3
    57e4:	602e      	str	r6, [r5, #0]
    57e6:	f7fa ffaf 	bl	748 <__wrap__kill>
    57ea:	1c43      	adds	r3, r0, #1
    57ec:	d000      	beq.n	57f0 <_kill_r+0x1c>
    57ee:	bd70      	pop	{r4, r5, r6, pc}
    57f0:	682b      	ldr	r3, [r5, #0]
    57f2:	2b00      	cmp	r3, #0
    57f4:	d0fb      	beq.n	57ee <_kill_r+0x1a>
    57f6:	6023      	str	r3, [r4, #0]
    57f8:	bd70      	pop	{r4, r5, r6, pc}
    57fa:	bf00      	nop
    57fc:	00007fa4 	.word	0x00007fa4

00005800 <_getpid_r>:
    5800:	f7fa bf84 	b.w	70c <__wrap__getpid>

00005804 <memmove>:
    5804:	4288      	cmp	r0, r1
    5806:	d90e      	bls.n	5826 <memmove+0x22>
    5808:	188b      	adds	r3, r1, r2
    580a:	4283      	cmp	r3, r0
    580c:	d90b      	bls.n	5826 <memmove+0x22>
    580e:	eb00 0c02 	add.w	ip, r0, r2
    5812:	2a00      	cmp	r2, #0
    5814:	d06e      	beq.n	58f4 <memmove+0xf0>
    5816:	4662      	mov	r2, ip
    5818:	f813 cd01 	ldrb.w	ip, [r3, #-1]!
    581c:	f802 cd01 	strb.w	ip, [r2, #-1]!
    5820:	4299      	cmp	r1, r3
    5822:	d1f9      	bne.n	5818 <memmove+0x14>
    5824:	4770      	bx	lr
    5826:	2a0f      	cmp	r2, #15
    5828:	d80f      	bhi.n	584a <memmove+0x46>
    582a:	4603      	mov	r3, r0
    582c:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    5830:	2a00      	cmp	r2, #0
    5832:	d05f      	beq.n	58f4 <memmove+0xf0>
    5834:	f10c 0c01 	add.w	ip, ip, #1
    5838:	3b01      	subs	r3, #1
    583a:	448c      	add	ip, r1
    583c:	f811 2b01 	ldrb.w	r2, [r1], #1
    5840:	f803 2f01 	strb.w	r2, [r3, #1]!
    5844:	4561      	cmp	r1, ip
    5846:	d1f9      	bne.n	583c <memmove+0x38>
    5848:	4770      	bx	lr
    584a:	ea40 0301 	orr.w	r3, r0, r1
    584e:	079b      	lsls	r3, r3, #30
    5850:	d151      	bne.n	58f6 <memmove+0xf2>
    5852:	f1a2 0310 	sub.w	r3, r2, #16
    5856:	b570      	push	{r4, r5, r6, lr}
    5858:	f101 0c20 	add.w	ip, r1, #32
    585c:	f023 050f 	bic.w	r5, r3, #15
    5860:	f101 0e10 	add.w	lr, r1, #16
    5864:	f100 0410 	add.w	r4, r0, #16
    5868:	44ac      	add	ip, r5
    586a:	091b      	lsrs	r3, r3, #4
    586c:	f85e 5c10 	ldr.w	r5, [lr, #-16]
    5870:	f844 5c10 	str.w	r5, [r4, #-16]
    5874:	f85e 5c0c 	ldr.w	r5, [lr, #-12]
    5878:	f844 5c0c 	str.w	r5, [r4, #-12]
    587c:	f85e 5c08 	ldr.w	r5, [lr, #-8]
    5880:	f844 5c08 	str.w	r5, [r4, #-8]
    5884:	f85e 5c04 	ldr.w	r5, [lr, #-4]
    5888:	f844 5c04 	str.w	r5, [r4, #-4]
    588c:	f10e 0e10 	add.w	lr, lr, #16
    5890:	45e6      	cmp	lr, ip
    5892:	f104 0410 	add.w	r4, r4, #16
    5896:	d1e9      	bne.n	586c <memmove+0x68>
    5898:	3301      	adds	r3, #1
    589a:	f012 0f0c 	tst.w	r2, #12
    589e:	eb01 1103 	add.w	r1, r1, r3, lsl #4
    58a2:	f002 040f 	and.w	r4, r2, #15
    58a6:	eb00 1303 	add.w	r3, r0, r3, lsl #4
    58aa:	d028      	beq.n	58fe <memmove+0xfa>
    58ac:	3c04      	subs	r4, #4
    58ae:	f024 0603 	bic.w	r6, r4, #3
    58b2:	ea4f 0c94 	mov.w	ip, r4, lsr #2
    58b6:	441e      	add	r6, r3
    58b8:	1f1c      	subs	r4, r3, #4
    58ba:	468e      	mov	lr, r1
    58bc:	f85e 5b04 	ldr.w	r5, [lr], #4
    58c0:	f844 5f04 	str.w	r5, [r4, #4]!
    58c4:	42b4      	cmp	r4, r6
    58c6:	d1f9      	bne.n	58bc <memmove+0xb8>
    58c8:	f10c 0401 	add.w	r4, ip, #1
    58cc:	f002 0203 	and.w	r2, r2, #3
    58d0:	eb03 0384 	add.w	r3, r3, r4, lsl #2
    58d4:	eb01 0184 	add.w	r1, r1, r4, lsl #2
    58d8:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    58dc:	b14a      	cbz	r2, 58f2 <memmove+0xee>
    58de:	f10c 0c01 	add.w	ip, ip, #1
    58e2:	3b01      	subs	r3, #1
    58e4:	448c      	add	ip, r1
    58e6:	f811 2b01 	ldrb.w	r2, [r1], #1
    58ea:	f803 2f01 	strb.w	r2, [r3, #1]!
    58ee:	4561      	cmp	r1, ip
    58f0:	d1f9      	bne.n	58e6 <memmove+0xe2>
    58f2:	bd70      	pop	{r4, r5, r6, pc}
    58f4:	4770      	bx	lr
    58f6:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    58fa:	4603      	mov	r3, r0
    58fc:	e79a      	b.n	5834 <memmove+0x30>
    58fe:	4622      	mov	r2, r4
    5900:	e7ea      	b.n	58d8 <memmove+0xd4>
    5902:	bf00      	nop

00005904 <_vfiprintf_r>:
    5904:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5908:	b0ad      	sub	sp, #180	@ 0xb4
    590a:	e9cd 3007 	strd	r3, r0, [sp, #28]
    590e:	461c      	mov	r4, r3
    5910:	9102      	str	r1, [sp, #8]
    5912:	4693      	mov	fp, r2
    5914:	b118      	cbz	r0, 591e <_vfiprintf_r+0x1a>
    5916:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    5918:	2b00      	cmp	r3, #0
    591a:	f000 8503 	beq.w	6324 <_vfiprintf_r+0xa20>
    591e:	9902      	ldr	r1, [sp, #8]
    5920:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    5924:	6e4b      	ldr	r3, [r1, #100]	@ 0x64
    5926:	0495      	lsls	r5, r2, #18
    5928:	d405      	bmi.n	5936 <_vfiprintf_r+0x32>
    592a:	f442 5200 	orr.w	r2, r2, #8192	@ 0x2000
    592e:	f423 5300 	bic.w	r3, r3, #8192	@ 0x2000
    5932:	818a      	strh	r2, [r1, #12]
    5934:	664b      	str	r3, [r1, #100]	@ 0x64
    5936:	0498      	lsls	r0, r3, #18
    5938:	f100 8524 	bmi.w	6384 <_vfiprintf_r+0xa80>
    593c:	9b02      	ldr	r3, [sp, #8]
    593e:	f9b3 200c 	ldrsh.w	r2, [r3, #12]
    5942:	0711      	lsls	r1, r2, #28
    5944:	f140 80d3 	bpl.w	5aee <_vfiprintf_r+0x1ea>
    5948:	691b      	ldr	r3, [r3, #16]
    594a:	2b00      	cmp	r3, #0
    594c:	f000 80cf 	beq.w	5aee <_vfiprintf_r+0x1ea>
    5950:	f002 021a 	and.w	r2, r2, #26
    5954:	2a0a      	cmp	r2, #10
    5956:	f000 80d9 	beq.w	5b0c <_vfiprintf_r+0x208>
    595a:	2300      	movs	r3, #0
    595c:	e9cd 3310 	strd	r3, r3, [sp, #64]	@ 0x40
    5960:	f10d 0970 	add.w	r9, sp, #112	@ 0x70
    5964:	f8cd 903c 	str.w	r9, [sp, #60]	@ 0x3c
    5968:	9309      	str	r3, [sp, #36]	@ 0x24
    596a:	46ca      	mov	sl, r9
    596c:	9305      	str	r3, [sp, #20]
    596e:	f89b 3000 	ldrb.w	r3, [fp]
    5972:	2b00      	cmp	r3, #0
    5974:	f000 80f4 	beq.w	5b60 <_vfiprintf_r+0x25c>
    5978:	465c      	mov	r4, fp
    597a:	e004      	b.n	5986 <_vfiprintf_r+0x82>
    597c:	f814 3f01 	ldrb.w	r3, [r4, #1]!
    5980:	2b00      	cmp	r3, #0
    5982:	f000 80d2 	beq.w	5b2a <_vfiprintf_r+0x226>
    5986:	2b25      	cmp	r3, #37	@ 0x25
    5988:	d1f8      	bne.n	597c <_vfiprintf_r+0x78>
    598a:	ebb4 050b 	subs.w	r5, r4, fp
    598e:	f040 80cf 	bne.w	5b30 <_vfiprintf_r+0x22c>
    5992:	7823      	ldrb	r3, [r4, #0]
    5994:	2b00      	cmp	r3, #0
    5996:	f000 80e3 	beq.w	5b60 <_vfiprintf_r+0x25c>
    599a:	f04f 0300 	mov.w	r3, #0
    599e:	f88d 3037 	strb.w	r3, [sp, #55]	@ 0x37
    59a2:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
    59a6:	2300      	movs	r3, #0
    59a8:	e9cd 2303 	strd	r2, r3, [sp, #12]
    59ac:	7861      	ldrb	r1, [r4, #1]
    59ae:	f104 0b01 	add.w	fp, r4, #1
    59b2:	4698      	mov	r8, r3
    59b4:	f10b 0b01 	add.w	fp, fp, #1
    59b8:	f1a1 0320 	sub.w	r3, r1, #32
    59bc:	2b58      	cmp	r3, #88	@ 0x58
    59be:	f200 80dc 	bhi.w	5b7a <_vfiprintf_r+0x276>
    59c2:	e8df f013 	tbh	[pc, r3, lsl #1]
    59c6:	01b2      	.short	0x01b2
    59c8:	00da00da 	.word	0x00da00da
    59cc:	00da01ad 	.word	0x00da01ad
    59d0:	00da00da 	.word	0x00da00da
    59d4:	00da00da 	.word	0x00da00da
    59d8:	017600da 	.word	0x017600da
    59dc:	00da01a7 	.word	0x00da01a7
    59e0:	01860181 	.word	0x01860181
    59e4:	01a200da 	.word	0x01a200da
    59e8:	00590059 	.word	0x00590059
    59ec:	00590059 	.word	0x00590059
    59f0:	00590059 	.word	0x00590059
    59f4:	00590059 	.word	0x00590059
    59f8:	00da0059 	.word	0x00da0059
    59fc:	00da00da 	.word	0x00da00da
    5a00:	00da00da 	.word	0x00da00da
    5a04:	00da00da 	.word	0x00da00da
    5a08:	00da00da 	.word	0x00da00da
    5a0c:	006800da 	.word	0x006800da
    5a10:	00da00da 	.word	0x00da00da
    5a14:	00da00da 	.word	0x00da00da
    5a18:	00da00da 	.word	0x00da00da
    5a1c:	00da00da 	.word	0x00da00da
    5a20:	00da00da 	.word	0x00da00da
    5a24:	00da0219 	.word	0x00da0219
    5a28:	00da00da 	.word	0x00da00da
    5a2c:	00da00da 	.word	0x00da00da
    5a30:	00da01ea 	.word	0x00da01ea
    5a34:	041d00da 	.word	0x041d00da
    5a38:	00da00da 	.word	0x00da00da
    5a3c:	00da00da 	.word	0x00da00da
    5a40:	00da00da 	.word	0x00da00da
    5a44:	00da00da 	.word	0x00da00da
    5a48:	00da00da 	.word	0x00da00da
    5a4c:	006a01dd 	.word	0x006a01dd
    5a50:	00da00da 	.word	0x00da00da
    5a54:	01d800da 	.word	0x01d800da
    5a58:	00da006a 	.word	0x00da006a
    5a5c:	01cb00da 	.word	0x01cb00da
    5a60:	01bd00da 	.word	0x01bd00da
    5a64:	027f041b 	.word	0x027f041b
    5a68:	00da027a 	.word	0x00da027a
    5a6c:	00da0259 	.word	0x00da0259
    5a70:	00da0419 	.word	0x00da0419
    5a74:	044200da 	.word	0x044200da
    5a78:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
    5a7c:	2200      	movs	r2, #0
    5a7e:	f81b 1b01 	ldrb.w	r1, [fp], #1
    5a82:	eb02 0282 	add.w	r2, r2, r2, lsl #2
    5a86:	eb03 0242 	add.w	r2, r3, r2, lsl #1
    5a8a:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
    5a8e:	2b09      	cmp	r3, #9
    5a90:	d9f5      	bls.n	5a7e <_vfiprintf_r+0x17a>
    5a92:	9204      	str	r2, [sp, #16]
    5a94:	e790      	b.n	59b8 <_vfiprintf_r+0xb4>
    5a96:	f048 0810 	orr.w	r8, r8, #16
    5a9a:	f018 0f20 	tst.w	r8, #32
    5a9e:	f000 80d7 	beq.w	5c50 <_vfiprintf_r+0x34c>
    5aa2:	9b07      	ldr	r3, [sp, #28]
    5aa4:	3307      	adds	r3, #7
    5aa6:	f023 0307 	bic.w	r3, r3, #7
    5aaa:	461a      	mov	r2, r3
    5aac:	6859      	ldr	r1, [r3, #4]
    5aae:	f852 3b08 	ldr.w	r3, [r2], #8
    5ab2:	9207      	str	r2, [sp, #28]
    5ab4:	460a      	mov	r2, r1
    5ab6:	2900      	cmp	r1, #0
    5ab8:	f2c0 80de 	blt.w	5c78 <_vfiprintf_r+0x374>
    5abc:	9903      	ldr	r1, [sp, #12]
    5abe:	f89d 5037 	ldrb.w	r5, [sp, #55]	@ 0x37
    5ac2:	2900      	cmp	r1, #0
    5ac4:	f2c0 80e3 	blt.w	5c8e <_vfiprintf_r+0x38a>
    5ac8:	ea53 0102 	orrs.w	r1, r3, r2
    5acc:	f028 0880 	bic.w	r8, r8, #128	@ 0x80
    5ad0:	f040 80dd 	bne.w	5c8e <_vfiprintf_r+0x38a>
    5ad4:	9b03      	ldr	r3, [sp, #12]
    5ad6:	2b00      	cmp	r3, #0
    5ad8:	f040 8459 	bne.w	638e <_vfiprintf_r+0xa8a>
    5adc:	9301      	str	r3, [sp, #4]
    5ade:	464c      	mov	r4, r9
    5ae0:	2d00      	cmp	r5, #0
    5ae2:	f000 81be 	beq.w	5e62 <_vfiprintf_r+0x55e>
    5ae6:	9a01      	ldr	r2, [sp, #4]
    5ae8:	3201      	adds	r2, #1
    5aea:	9201      	str	r2, [sp, #4]
    5aec:	e1b9      	b.n	5e62 <_vfiprintf_r+0x55e>
    5aee:	9d02      	ldr	r5, [sp, #8]
    5af0:	9808      	ldr	r0, [sp, #32]
    5af2:	4629      	mov	r1, r5
    5af4:	f7fd facc 	bl	3090 <__swsetup_r>
    5af8:	2800      	cmp	r0, #0
    5afa:	f040 8443 	bne.w	6384 <_vfiprintf_r+0xa80>
    5afe:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
    5b02:	f002 021a 	and.w	r2, r2, #26
    5b06:	2a0a      	cmp	r2, #10
    5b08:	f47f af27 	bne.w	595a <_vfiprintf_r+0x56>
    5b0c:	9b02      	ldr	r3, [sp, #8]
    5b0e:	f9b3 300e 	ldrsh.w	r3, [r3, #14]
    5b12:	2b00      	cmp	r3, #0
    5b14:	f6ff af21 	blt.w	595a <_vfiprintf_r+0x56>
    5b18:	9902      	ldr	r1, [sp, #8]
    5b1a:	9808      	ldr	r0, [sp, #32]
    5b1c:	4623      	mov	r3, r4
    5b1e:	465a      	mov	r2, fp
    5b20:	b02d      	add	sp, #180	@ 0xb4
    5b22:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5b26:	f000 bc59 	b.w	63dc <__sbprintf>
    5b2a:	ebb4 050b 	subs.w	r5, r4, fp
    5b2e:	d017      	beq.n	5b60 <_vfiprintf_r+0x25c>
    5b30:	9b11      	ldr	r3, [sp, #68]	@ 0x44
    5b32:	442b      	add	r3, r5
    5b34:	9311      	str	r3, [sp, #68]	@ 0x44
    5b36:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    5b38:	3301      	adds	r3, #1
    5b3a:	2b07      	cmp	r3, #7
    5b3c:	e9ca b500 	strd	fp, r5, [sl]
    5b40:	9310      	str	r3, [sp, #64]	@ 0x40
    5b42:	dc05      	bgt.n	5b50 <_vfiprintf_r+0x24c>
    5b44:	f10a 0a08 	add.w	sl, sl, #8
    5b48:	9b05      	ldr	r3, [sp, #20]
    5b4a:	442b      	add	r3, r5
    5b4c:	9305      	str	r3, [sp, #20]
    5b4e:	e720      	b.n	5992 <_vfiprintf_r+0x8e>
    5b50:	9902      	ldr	r1, [sp, #8]
    5b52:	9808      	ldr	r0, [sp, #32]
    5b54:	aa0f      	add	r2, sp, #60	@ 0x3c
    5b56:	f7fd ff3f 	bl	39d8 <__sprint_r>
    5b5a:	b928      	cbnz	r0, 5b68 <_vfiprintf_r+0x264>
    5b5c:	46ca      	mov	sl, r9
    5b5e:	e7f3      	b.n	5b48 <_vfiprintf_r+0x244>
    5b60:	9b11      	ldr	r3, [sp, #68]	@ 0x44
    5b62:	2b00      	cmp	r3, #0
    5b64:	f040 8400 	bne.w	6368 <_vfiprintf_r+0xa64>
    5b68:	9b02      	ldr	r3, [sp, #8]
    5b6a:	899b      	ldrh	r3, [r3, #12]
    5b6c:	065b      	lsls	r3, r3, #25
    5b6e:	f100 8409 	bmi.w	6384 <_vfiprintf_r+0xa80>
    5b72:	9805      	ldr	r0, [sp, #20]
    5b74:	b02d      	add	sp, #180	@ 0xb4
    5b76:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5b7a:	2900      	cmp	r1, #0
    5b7c:	d0f0      	beq.n	5b60 <_vfiprintf_r+0x25c>
    5b7e:	2300      	movs	r3, #0
    5b80:	f88d 3037 	strb.w	r3, [sp, #55]	@ 0x37
    5b84:	2301      	movs	r3, #1
    5b86:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
    5b8a:	9301      	str	r3, [sp, #4]
    5b8c:	ac12      	add	r4, sp, #72	@ 0x48
    5b8e:	2200      	movs	r2, #0
    5b90:	9203      	str	r2, [sp, #12]
    5b92:	9206      	str	r2, [sp, #24]
    5b94:	f018 0784 	ands.w	r7, r8, #132	@ 0x84
    5b98:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    5b9c:	d105      	bne.n	5baa <_vfiprintf_r+0x2a6>
    5b9e:	9804      	ldr	r0, [sp, #16]
    5ba0:	9d01      	ldr	r5, [sp, #4]
    5ba2:	1b45      	subs	r5, r0, r5
    5ba4:	2d00      	cmp	r5, #0
    5ba6:	f300 824f 	bgt.w	6048 <_vfiprintf_r+0x744>
    5baa:	f89d 0037 	ldrb.w	r0, [sp, #55]	@ 0x37
    5bae:	b180      	cbz	r0, 5bd2 <_vfiprintf_r+0x2ce>
    5bb0:	3201      	adds	r2, #1
    5bb2:	f10d 0037 	add.w	r0, sp, #55	@ 0x37
    5bb6:	3101      	adds	r1, #1
    5bb8:	f8ca 0000 	str.w	r0, [sl]
    5bbc:	2a07      	cmp	r2, #7
    5bbe:	f04f 0001 	mov.w	r0, #1
    5bc2:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5bc6:	f8ca 0004 	str.w	r0, [sl, #4]
    5bca:	f300 8277 	bgt.w	60bc <_vfiprintf_r+0x7b8>
    5bce:	f10a 0a08 	add.w	sl, sl, #8
    5bd2:	9806      	ldr	r0, [sp, #24]
    5bd4:	b178      	cbz	r0, 5bf6 <_vfiprintf_r+0x2f2>
    5bd6:	3201      	adds	r2, #1
    5bd8:	a80e      	add	r0, sp, #56	@ 0x38
    5bda:	3102      	adds	r1, #2
    5bdc:	f8ca 0000 	str.w	r0, [sl]
    5be0:	2a07      	cmp	r2, #7
    5be2:	f04f 0002 	mov.w	r0, #2
    5be6:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5bea:	f8ca 0004 	str.w	r0, [sl, #4]
    5bee:	f300 8273 	bgt.w	60d8 <_vfiprintf_r+0x7d4>
    5bf2:	f10a 0a08 	add.w	sl, sl, #8
    5bf6:	2f80      	cmp	r7, #128	@ 0x80
    5bf8:	f000 819b 	beq.w	5f32 <_vfiprintf_r+0x62e>
    5bfc:	9803      	ldr	r0, [sp, #12]
    5bfe:	1ac5      	subs	r5, r0, r3
    5c00:	2d00      	cmp	r5, #0
    5c02:	f300 81d5 	bgt.w	5fb0 <_vfiprintf_r+0x6ac>
    5c06:	3201      	adds	r2, #1
    5c08:	4419      	add	r1, r3
    5c0a:	2a07      	cmp	r2, #7
    5c0c:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5c10:	f8ca 4000 	str.w	r4, [sl]
    5c14:	f8ca 3004 	str.w	r3, [sl, #4]
    5c18:	f300 8202 	bgt.w	6020 <_vfiprintf_r+0x71c>
    5c1c:	f10a 0a08 	add.w	sl, sl, #8
    5c20:	f018 0f04 	tst.w	r8, #4
    5c24:	d005      	beq.n	5c32 <_vfiprintf_r+0x32e>
    5c26:	9b04      	ldr	r3, [sp, #16]
    5c28:	9a01      	ldr	r2, [sp, #4]
    5c2a:	1a9c      	subs	r4, r3, r2
    5c2c:	2c00      	cmp	r4, #0
    5c2e:	f300 8261 	bgt.w	60f4 <_vfiprintf_r+0x7f0>
    5c32:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
    5c36:	9801      	ldr	r0, [sp, #4]
    5c38:	4282      	cmp	r2, r0
    5c3a:	bfac      	ite	ge
    5c3c:	189b      	addge	r3, r3, r2
    5c3e:	181b      	addlt	r3, r3, r0
    5c40:	9305      	str	r3, [sp, #20]
    5c42:	2900      	cmp	r1, #0
    5c44:	f040 81f7 	bne.w	6036 <_vfiprintf_r+0x732>
    5c48:	2300      	movs	r3, #0
    5c4a:	9310      	str	r3, [sp, #64]	@ 0x40
    5c4c:	46ca      	mov	sl, r9
    5c4e:	e68e      	b.n	596e <_vfiprintf_r+0x6a>
    5c50:	9a07      	ldr	r2, [sp, #28]
    5c52:	f018 0f10 	tst.w	r8, #16
    5c56:	f852 3b04 	ldr.w	r3, [r2], #4
    5c5a:	9207      	str	r2, [sp, #28]
    5c5c:	d107      	bne.n	5c6e <_vfiprintf_r+0x36a>
    5c5e:	f018 0f40 	tst.w	r8, #64	@ 0x40
    5c62:	d004      	beq.n	5c6e <_vfiprintf_r+0x36a>
    5c64:	f343 32c0 	sbfx	r2, r3, #15, #1
    5c68:	4611      	mov	r1, r2
    5c6a:	b21b      	sxth	r3, r3
    5c6c:	e723      	b.n	5ab6 <_vfiprintf_r+0x1b2>
    5c6e:	17da      	asrs	r2, r3, #31
    5c70:	4611      	mov	r1, r2
    5c72:	2900      	cmp	r1, #0
    5c74:	f6bf af22 	bge.w	5abc <_vfiprintf_r+0x1b8>
    5c78:	9903      	ldr	r1, [sp, #12]
    5c7a:	425b      	negs	r3, r3
    5c7c:	eb62 0242 	sbc.w	r2, r2, r2, lsl #1
    5c80:	252d      	movs	r5, #45	@ 0x2d
    5c82:	2900      	cmp	r1, #0
    5c84:	f88d 5037 	strb.w	r5, [sp, #55]	@ 0x37
    5c88:	db01      	blt.n	5c8e <_vfiprintf_r+0x38a>
    5c8a:	f028 0880 	bic.w	r8, r8, #128	@ 0x80
    5c8e:	2b0a      	cmp	r3, #10
    5c90:	f172 0100 	sbcs.w	r1, r2, #0
    5c94:	f080 82f3 	bcs.w	627e <_vfiprintf_r+0x97a>
    5c98:	3330      	adds	r3, #48	@ 0x30
    5c9a:	b2db      	uxtb	r3, r3
    5c9c:	f88d 306f 	strb.w	r3, [sp, #111]	@ 0x6f
    5ca0:	9b03      	ldr	r3, [sp, #12]
    5ca2:	2b01      	cmp	r3, #1
    5ca4:	bfb8      	it	lt
    5ca6:	2301      	movlt	r3, #1
    5ca8:	9301      	str	r3, [sp, #4]
    5caa:	f10d 046f 	add.w	r4, sp, #111	@ 0x6f
    5cae:	2301      	movs	r3, #1
    5cb0:	e716      	b.n	5ae0 <_vfiprintf_r+0x1dc>
    5cb2:	9b07      	ldr	r3, [sp, #28]
    5cb4:	f853 2b04 	ldr.w	r2, [r3], #4
    5cb8:	9204      	str	r2, [sp, #16]
    5cba:	2a00      	cmp	r2, #0
    5cbc:	f280 8288 	bge.w	61d0 <_vfiprintf_r+0x8cc>
    5cc0:	9a04      	ldr	r2, [sp, #16]
    5cc2:	9307      	str	r3, [sp, #28]
    5cc4:	4252      	negs	r2, r2
    5cc6:	9204      	str	r2, [sp, #16]
    5cc8:	f89b 1000 	ldrb.w	r1, [fp]
    5ccc:	f048 0804 	orr.w	r8, r8, #4
    5cd0:	e670      	b.n	59b4 <_vfiprintf_r+0xb0>
    5cd2:	4658      	mov	r0, fp
    5cd4:	f810 1b01 	ldrb.w	r1, [r0], #1
    5cd8:	292a      	cmp	r1, #42	@ 0x2a
    5cda:	f000 835a 	beq.w	6392 <_vfiprintf_r+0xa8e>
    5cde:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
    5ce2:	2b09      	cmp	r3, #9
    5ce4:	bf98      	it	ls
    5ce6:	2200      	movls	r2, #0
    5ce8:	f200 8347 	bhi.w	637a <_vfiprintf_r+0xa76>
    5cec:	f810 1b01 	ldrb.w	r1, [r0], #1
    5cf0:	eb02 0282 	add.w	r2, r2, r2, lsl #2
    5cf4:	eb03 0242 	add.w	r2, r3, r2, lsl #1
    5cf8:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
    5cfc:	2b09      	cmp	r3, #9
    5cfe:	d9f5      	bls.n	5cec <_vfiprintf_r+0x3e8>
    5d00:	ea42 73e2 	orr.w	r3, r2, r2, asr #31
    5d04:	9303      	str	r3, [sp, #12]
    5d06:	4683      	mov	fp, r0
    5d08:	e656      	b.n	59b8 <_vfiprintf_r+0xb4>
    5d0a:	f89b 1000 	ldrb.w	r1, [fp]
    5d0e:	f048 0880 	orr.w	r8, r8, #128	@ 0x80
    5d12:	e64f      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d14:	232b      	movs	r3, #43	@ 0x2b
    5d16:	f89b 1000 	ldrb.w	r1, [fp]
    5d1a:	f88d 3037 	strb.w	r3, [sp, #55]	@ 0x37
    5d1e:	e649      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d20:	f89b 1000 	ldrb.w	r1, [fp]
    5d24:	f048 0801 	orr.w	r8, r8, #1
    5d28:	e644      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d2a:	f89d 3037 	ldrb.w	r3, [sp, #55]	@ 0x37
    5d2e:	f89b 1000 	ldrb.w	r1, [fp]
    5d32:	2b00      	cmp	r3, #0
    5d34:	f47f ae3e 	bne.w	59b4 <_vfiprintf_r+0xb0>
    5d38:	2320      	movs	r3, #32
    5d3a:	f88d 3037 	strb.w	r3, [sp, #55]	@ 0x37
    5d3e:	e639      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d40:	f018 0f20 	tst.w	r8, #32
    5d44:	f000 824d 	beq.w	61e2 <_vfiprintf_r+0x8de>
    5d48:	9b07      	ldr	r3, [sp, #28]
    5d4a:	9a05      	ldr	r2, [sp, #20]
    5d4c:	681b      	ldr	r3, [r3, #0]
    5d4e:	601a      	str	r2, [r3, #0]
    5d50:	17d2      	asrs	r2, r2, #31
    5d52:	605a      	str	r2, [r3, #4]
    5d54:	9b07      	ldr	r3, [sp, #28]
    5d56:	3304      	adds	r3, #4
    5d58:	9307      	str	r3, [sp, #28]
    5d5a:	e608      	b.n	596e <_vfiprintf_r+0x6a>
    5d5c:	f89b 1000 	ldrb.w	r1, [fp]
    5d60:	296c      	cmp	r1, #108	@ 0x6c
    5d62:	bf03      	ittte	eq
    5d64:	f89b 1001 	ldrbeq.w	r1, [fp, #1]
    5d68:	f048 0820 	orreq.w	r8, r8, #32
    5d6c:	f10b 0b01 	addeq.w	fp, fp, #1
    5d70:	f048 0810 	orrne.w	r8, r8, #16
    5d74:	e61e      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d76:	f89b 1000 	ldrb.w	r1, [fp]
    5d7a:	f048 0840 	orr.w	r8, r8, #64	@ 0x40
    5d7e:	e619      	b.n	59b4 <_vfiprintf_r+0xb0>
    5d80:	9b07      	ldr	r3, [sp, #28]
    5d82:	2200      	movs	r2, #0
    5d84:	f88d 2037 	strb.w	r2, [sp, #55]	@ 0x37
    5d88:	f853 2b04 	ldr.w	r2, [r3], #4
    5d8c:	9307      	str	r3, [sp, #28]
    5d8e:	2301      	movs	r3, #1
    5d90:	f88d 2048 	strb.w	r2, [sp, #72]	@ 0x48
    5d94:	9301      	str	r3, [sp, #4]
    5d96:	ac12      	add	r4, sp, #72	@ 0x48
    5d98:	e6f9      	b.n	5b8e <_vfiprintf_r+0x28a>
    5d9a:	f048 0110 	orr.w	r1, r8, #16
    5d9e:	f011 0220 	ands.w	r2, r1, #32
    5da2:	f000 81de 	beq.w	6162 <_vfiprintf_r+0x85e>
    5da6:	9b07      	ldr	r3, [sp, #28]
    5da8:	3307      	adds	r3, #7
    5daa:	f023 0307 	bic.w	r3, r3, #7
    5dae:	4618      	mov	r0, r3
    5db0:	685a      	ldr	r2, [r3, #4]
    5db2:	f850 3b08 	ldr.w	r3, [r0], #8
    5db6:	9007      	str	r0, [sp, #28]
    5db8:	9803      	ldr	r0, [sp, #12]
    5dba:	2500      	movs	r5, #0
    5dbc:	42a8      	cmp	r0, r5
    5dbe:	f88d 5037 	strb.w	r5, [sp, #55]	@ 0x37
    5dc2:	f2c0 82a7 	blt.w	6314 <_vfiprintf_r+0xa10>
    5dc6:	2501      	movs	r5, #1
    5dc8:	ea53 0002 	orrs.w	r0, r3, r2
    5dcc:	f021 0880 	bic.w	r8, r1, #128	@ 0x80
    5dd0:	f040 8094 	bne.w	5efc <_vfiprintf_r+0x5f8>
    5dd4:	9803      	ldr	r0, [sp, #12]
    5dd6:	2800      	cmp	r0, #0
    5dd8:	f040 829e 	bne.w	6318 <_vfiprintf_r+0xa14>
    5ddc:	2d00      	cmp	r5, #0
    5dde:	f040 81f3 	bne.w	61c8 <_vfiprintf_r+0x8c4>
    5de2:	f011 0301 	ands.w	r3, r1, #1
    5de6:	f000 81f8 	beq.w	61da <_vfiprintf_r+0x8d6>
    5dea:	2230      	movs	r2, #48	@ 0x30
    5dec:	f88d 206f 	strb.w	r2, [sp, #111]	@ 0x6f
    5df0:	9301      	str	r3, [sp, #4]
    5df2:	f10d 046f 	add.w	r4, sp, #111	@ 0x6f
    5df6:	e034      	b.n	5e62 <_vfiprintf_r+0x55e>
    5df8:	f048 0110 	orr.w	r1, r8, #16
    5dfc:	f011 0220 	ands.w	r2, r1, #32
    5e00:	f000 81be 	beq.w	6180 <_vfiprintf_r+0x87c>
    5e04:	9b07      	ldr	r3, [sp, #28]
    5e06:	3307      	adds	r3, #7
    5e08:	f023 0307 	bic.w	r3, r3, #7
    5e0c:	4618      	mov	r0, r3
    5e0e:	685a      	ldr	r2, [r3, #4]
    5e10:	f850 3b08 	ldr.w	r3, [r0], #8
    5e14:	9007      	str	r0, [sp, #28]
    5e16:	9803      	ldr	r0, [sp, #12]
    5e18:	2500      	movs	r5, #0
    5e1a:	42a8      	cmp	r0, r5
    5e1c:	f88d 5037 	strb.w	r5, [sp, #55]	@ 0x37
    5e20:	dad2      	bge.n	5dc8 <_vfiprintf_r+0x4c4>
    5e22:	4688      	mov	r8, r1
    5e24:	464c      	mov	r4, r9
    5e26:	f003 0107 	and.w	r1, r3, #7
    5e2a:	08db      	lsrs	r3, r3, #3
    5e2c:	ea43 7342 	orr.w	r3, r3, r2, lsl #29
    5e30:	08d2      	lsrs	r2, r2, #3
    5e32:	3130      	adds	r1, #48	@ 0x30
    5e34:	ea53 0502 	orrs.w	r5, r3, r2
    5e38:	4620      	mov	r0, r4
    5e3a:	f804 1d01 	strb.w	r1, [r4, #-1]!
    5e3e:	d1f2      	bne.n	5e26 <_vfiprintf_r+0x522>
    5e40:	f018 0f01 	tst.w	r8, #1
    5e44:	d06d      	beq.n	5f22 <_vfiprintf_r+0x61e>
    5e46:	2930      	cmp	r1, #48	@ 0x30
    5e48:	d06b      	beq.n	5f22 <_vfiprintf_r+0x61e>
    5e4a:	9a03      	ldr	r2, [sp, #12]
    5e4c:	3802      	subs	r0, #2
    5e4e:	2330      	movs	r3, #48	@ 0x30
    5e50:	f804 3c01 	strb.w	r3, [r4, #-1]
    5e54:	eba9 0300 	sub.w	r3, r9, r0
    5e58:	429a      	cmp	r2, r3
    5e5a:	bfb8      	it	lt
    5e5c:	461a      	movlt	r2, r3
    5e5e:	4604      	mov	r4, r0
    5e60:	9201      	str	r2, [sp, #4]
    5e62:	f018 0202 	ands.w	r2, r8, #2
    5e66:	9206      	str	r2, [sp, #24]
    5e68:	f43f ae94 	beq.w	5b94 <_vfiprintf_r+0x290>
    5e6c:	9a01      	ldr	r2, [sp, #4]
    5e6e:	3202      	adds	r2, #2
    5e70:	9201      	str	r2, [sp, #4]
    5e72:	2202      	movs	r2, #2
    5e74:	9206      	str	r2, [sp, #24]
    5e76:	e68d      	b.n	5b94 <_vfiprintf_r+0x290>
    5e78:	9d07      	ldr	r5, [sp, #28]
    5e7a:	9b03      	ldr	r3, [sp, #12]
    5e7c:	f855 4b04 	ldr.w	r4, [r5], #4
    5e80:	2100      	movs	r1, #0
    5e82:	f88d 1037 	strb.w	r1, [sp, #55]	@ 0x37
    5e86:	2c00      	cmp	r4, #0
    5e88:	f000 825e 	beq.w	6348 <_vfiprintf_r+0xa44>
    5e8c:	2b00      	cmp	r3, #0
    5e8e:	f2c0 81df 	blt.w	6250 <_vfiprintf_r+0x94c>
    5e92:	461a      	mov	r2, r3
    5e94:	4620      	mov	r0, r4
    5e96:	f7fb fffb 	bl	1e90 <memchr>
    5e9a:	2800      	cmp	r0, #0
    5e9c:	f000 826b 	beq.w	6376 <_vfiprintf_r+0xa72>
    5ea0:	1b03      	subs	r3, r0, r4
    5ea2:	f89d 2037 	ldrb.w	r2, [sp, #55]	@ 0x37
    5ea6:	ea23 71e3 	bic.w	r1, r3, r3, asr #31
    5eaa:	9101      	str	r1, [sp, #4]
    5eac:	2a00      	cmp	r2, #0
    5eae:	f000 8252 	beq.w	6356 <_vfiprintf_r+0xa52>
    5eb2:	2200      	movs	r2, #0
    5eb4:	9507      	str	r5, [sp, #28]
    5eb6:	9203      	str	r2, [sp, #12]
    5eb8:	e615      	b.n	5ae6 <_vfiprintf_r+0x1e2>
    5eba:	f89b 1000 	ldrb.w	r1, [fp]
    5ebe:	f048 0820 	orr.w	r8, r8, #32
    5ec2:	e577      	b.n	59b4 <_vfiprintf_r+0xb0>
    5ec4:	9a07      	ldr	r2, [sp, #28]
    5ec6:	f852 3b04 	ldr.w	r3, [r2], #4
    5eca:	9207      	str	r2, [sp, #28]
    5ecc:	f647 0230 	movw	r2, #30768	@ 0x7830
    5ed0:	f8ad 2038 	strh.w	r2, [sp, #56]	@ 0x38
    5ed4:	4ab2      	ldr	r2, [pc, #712]	@ (61a0 <_vfiprintf_r+0x89c>)
    5ed6:	9209      	str	r2, [sp, #36]	@ 0x24
    5ed8:	f048 0802 	orr.w	r8, r8, #2
    5edc:	2200      	movs	r2, #0
    5ede:	2100      	movs	r1, #0
    5ee0:	f88d 1037 	strb.w	r1, [sp, #55]	@ 0x37
    5ee4:	9903      	ldr	r1, [sp, #12]
    5ee6:	2900      	cmp	r1, #0
    5ee8:	db0d      	blt.n	5f06 <_vfiprintf_r+0x602>
    5eea:	4641      	mov	r1, r8
    5eec:	ea53 0002 	orrs.w	r0, r3, r2
    5ef0:	f04f 0502 	mov.w	r5, #2
    5ef4:	f021 0880 	bic.w	r8, r1, #128	@ 0x80
    5ef8:	f43f af6c 	beq.w	5dd4 <_vfiprintf_r+0x4d0>
    5efc:	2d01      	cmp	r5, #1
    5efe:	f000 8254 	beq.w	63aa <_vfiprintf_r+0xaa6>
    5f02:	2d02      	cmp	r5, #2
    5f04:	d18e      	bne.n	5e24 <_vfiprintf_r+0x520>
    5f06:	9809      	ldr	r0, [sp, #36]	@ 0x24
    5f08:	464c      	mov	r4, r9
    5f0a:	f003 010f 	and.w	r1, r3, #15
    5f0e:	091b      	lsrs	r3, r3, #4
    5f10:	5c41      	ldrb	r1, [r0, r1]
    5f12:	f804 1d01 	strb.w	r1, [r4, #-1]!
    5f16:	ea43 7302 	orr.w	r3, r3, r2, lsl #28
    5f1a:	0912      	lsrs	r2, r2, #4
    5f1c:	ea53 0102 	orrs.w	r1, r3, r2
    5f20:	d1f3      	bne.n	5f0a <_vfiprintf_r+0x606>
    5f22:	9a03      	ldr	r2, [sp, #12]
    5f24:	eba9 0304 	sub.w	r3, r9, r4
    5f28:	429a      	cmp	r2, r3
    5f2a:	bfb8      	it	lt
    5f2c:	461a      	movlt	r2, r3
    5f2e:	9201      	str	r2, [sp, #4]
    5f30:	e797      	b.n	5e62 <_vfiprintf_r+0x55e>
    5f32:	9804      	ldr	r0, [sp, #16]
    5f34:	9d01      	ldr	r5, [sp, #4]
    5f36:	1b45      	subs	r5, r0, r5
    5f38:	2d00      	cmp	r5, #0
    5f3a:	f77f ae5f 	ble.w	5bfc <_vfiprintf_r+0x2f8>
    5f3e:	2d10      	cmp	r5, #16
    5f40:	4e98      	ldr	r6, [pc, #608]	@ (61a4 <_vfiprintf_r+0x8a0>)
    5f42:	dd23      	ble.n	5f8c <_vfiprintf_r+0x688>
    5f44:	9406      	str	r4, [sp, #24]
    5f46:	4650      	mov	r0, sl
    5f48:	9c08      	ldr	r4, [sp, #32]
    5f4a:	2710      	movs	r7, #16
    5f4c:	469a      	mov	sl, r3
    5f4e:	e004      	b.n	5f5a <_vfiprintf_r+0x656>
    5f50:	3d10      	subs	r5, #16
    5f52:	2d10      	cmp	r5, #16
    5f54:	f100 0008 	add.w	r0, r0, #8
    5f58:	dd15      	ble.n	5f86 <_vfiprintf_r+0x682>
    5f5a:	3201      	adds	r2, #1
    5f5c:	3110      	adds	r1, #16
    5f5e:	2a07      	cmp	r2, #7
    5f60:	e9c0 6700 	strd	r6, r7, [r0]
    5f64:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5f68:	ddf2      	ble.n	5f50 <_vfiprintf_r+0x64c>
    5f6a:	9902      	ldr	r1, [sp, #8]
    5f6c:	aa0f      	add	r2, sp, #60	@ 0x3c
    5f6e:	4620      	mov	r0, r4
    5f70:	f7fd fd32 	bl	39d8 <__sprint_r>
    5f74:	2800      	cmp	r0, #0
    5f76:	f47f adf7 	bne.w	5b68 <_vfiprintf_r+0x264>
    5f7a:	3d10      	subs	r5, #16
    5f7c:	2d10      	cmp	r5, #16
    5f7e:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    5f82:	4648      	mov	r0, r9
    5f84:	dce9      	bgt.n	5f5a <_vfiprintf_r+0x656>
    5f86:	9c06      	ldr	r4, [sp, #24]
    5f88:	4653      	mov	r3, sl
    5f8a:	4682      	mov	sl, r0
    5f8c:	3201      	adds	r2, #1
    5f8e:	4429      	add	r1, r5
    5f90:	2a07      	cmp	r2, #7
    5f92:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5f96:	f8ca 6000 	str.w	r6, [sl]
    5f9a:	f8ca 5004 	str.w	r5, [sl, #4]
    5f9e:	f300 81c5 	bgt.w	632c <_vfiprintf_r+0xa28>
    5fa2:	9803      	ldr	r0, [sp, #12]
    5fa4:	1ac5      	subs	r5, r0, r3
    5fa6:	2d00      	cmp	r5, #0
    5fa8:	f10a 0a08 	add.w	sl, sl, #8
    5fac:	f77f ae2b 	ble.w	5c06 <_vfiprintf_r+0x302>
    5fb0:	2d10      	cmp	r5, #16
    5fb2:	4e7c      	ldr	r6, [pc, #496]	@ (61a4 <_vfiprintf_r+0x8a0>)
    5fb4:	dd26      	ble.n	6004 <_vfiprintf_r+0x700>
    5fb6:	9403      	str	r4, [sp, #12]
    5fb8:	4650      	mov	r0, sl
    5fba:	9c08      	ldr	r4, [sp, #32]
    5fbc:	46b2      	mov	sl, r6
    5fbe:	2710      	movs	r7, #16
    5fc0:	461e      	mov	r6, r3
    5fc2:	e004      	b.n	5fce <_vfiprintf_r+0x6ca>
    5fc4:	3d10      	subs	r5, #16
    5fc6:	2d10      	cmp	r5, #16
    5fc8:	f100 0008 	add.w	r0, r0, #8
    5fcc:	dd16      	ble.n	5ffc <_vfiprintf_r+0x6f8>
    5fce:	3201      	adds	r2, #1
    5fd0:	4b74      	ldr	r3, [pc, #464]	@ (61a4 <_vfiprintf_r+0x8a0>)
    5fd2:	3110      	adds	r1, #16
    5fd4:	2a07      	cmp	r2, #7
    5fd6:	e9c0 3700 	strd	r3, r7, [r0]
    5fda:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    5fde:	ddf1      	ble.n	5fc4 <_vfiprintf_r+0x6c0>
    5fe0:	9902      	ldr	r1, [sp, #8]
    5fe2:	aa0f      	add	r2, sp, #60	@ 0x3c
    5fe4:	4620      	mov	r0, r4
    5fe6:	f7fd fcf7 	bl	39d8 <__sprint_r>
    5fea:	2800      	cmp	r0, #0
    5fec:	f47f adbc 	bne.w	5b68 <_vfiprintf_r+0x264>
    5ff0:	3d10      	subs	r5, #16
    5ff2:	2d10      	cmp	r5, #16
    5ff4:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    5ff8:	4648      	mov	r0, r9
    5ffa:	dce8      	bgt.n	5fce <_vfiprintf_r+0x6ca>
    5ffc:	9c03      	ldr	r4, [sp, #12]
    5ffe:	4633      	mov	r3, r6
    6000:	4656      	mov	r6, sl
    6002:	4682      	mov	sl, r0
    6004:	3201      	adds	r2, #1
    6006:	4429      	add	r1, r5
    6008:	2a07      	cmp	r2, #7
    600a:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    600e:	f8ca 6000 	str.w	r6, [sl]
    6012:	f8ca 5004 	str.w	r5, [sl, #4]
    6016:	f300 80c9 	bgt.w	61ac <_vfiprintf_r+0x8a8>
    601a:	f10a 0a08 	add.w	sl, sl, #8
    601e:	e5f2      	b.n	5c06 <_vfiprintf_r+0x302>
    6020:	9902      	ldr	r1, [sp, #8]
    6022:	9808      	ldr	r0, [sp, #32]
    6024:	aa0f      	add	r2, sp, #60	@ 0x3c
    6026:	f7fd fcd7 	bl	39d8 <__sprint_r>
    602a:	2800      	cmp	r0, #0
    602c:	f47f ad9c 	bne.w	5b68 <_vfiprintf_r+0x264>
    6030:	9911      	ldr	r1, [sp, #68]	@ 0x44
    6032:	46ca      	mov	sl, r9
    6034:	e5f4      	b.n	5c20 <_vfiprintf_r+0x31c>
    6036:	9902      	ldr	r1, [sp, #8]
    6038:	9808      	ldr	r0, [sp, #32]
    603a:	aa0f      	add	r2, sp, #60	@ 0x3c
    603c:	f7fd fccc 	bl	39d8 <__sprint_r>
    6040:	2800      	cmp	r0, #0
    6042:	f43f ae01 	beq.w	5c48 <_vfiprintf_r+0x344>
    6046:	e58f      	b.n	5b68 <_vfiprintf_r+0x264>
    6048:	2d10      	cmp	r5, #16
    604a:	4e57      	ldr	r6, [pc, #348]	@ (61a8 <_vfiprintf_r+0x8a4>)
    604c:	dd28      	ble.n	60a0 <_vfiprintf_r+0x79c>
    604e:	e9cd 740a 	strd	r7, r4, [sp, #40]	@ 0x28
    6052:	4650      	mov	r0, sl
    6054:	4637      	mov	r7, r6
    6056:	9c08      	ldr	r4, [sp, #32]
    6058:	9e02      	ldr	r6, [sp, #8]
    605a:	469a      	mov	sl, r3
    605c:	e004      	b.n	6068 <_vfiprintf_r+0x764>
    605e:	3d10      	subs	r5, #16
    6060:	2d10      	cmp	r5, #16
    6062:	f100 0008 	add.w	r0, r0, #8
    6066:	dd16      	ble.n	6096 <_vfiprintf_r+0x792>
    6068:	3201      	adds	r2, #1
    606a:	3110      	adds	r1, #16
    606c:	2310      	movs	r3, #16
    606e:	2a07      	cmp	r2, #7
    6070:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    6074:	6007      	str	r7, [r0, #0]
    6076:	6043      	str	r3, [r0, #4]
    6078:	ddf1      	ble.n	605e <_vfiprintf_r+0x75a>
    607a:	aa0f      	add	r2, sp, #60	@ 0x3c
    607c:	4631      	mov	r1, r6
    607e:	4620      	mov	r0, r4
    6080:	f7fd fcaa 	bl	39d8 <__sprint_r>
    6084:	2800      	cmp	r0, #0
    6086:	f47f ad6f 	bne.w	5b68 <_vfiprintf_r+0x264>
    608a:	3d10      	subs	r5, #16
    608c:	2d10      	cmp	r5, #16
    608e:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    6092:	4648      	mov	r0, r9
    6094:	dce8      	bgt.n	6068 <_vfiprintf_r+0x764>
    6096:	463e      	mov	r6, r7
    6098:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
    609a:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
    609c:	4653      	mov	r3, sl
    609e:	4682      	mov	sl, r0
    60a0:	3201      	adds	r2, #1
    60a2:	4429      	add	r1, r5
    60a4:	2a07      	cmp	r2, #7
    60a6:	e9cd 2110 	strd	r2, r1, [sp, #64]	@ 0x40
    60aa:	f8ca 6000 	str.w	r6, [sl]
    60ae:	f8ca 5004 	str.w	r5, [sl, #4]
    60b2:	f300 8121 	bgt.w	62f8 <_vfiprintf_r+0x9f4>
    60b6:	f10a 0a08 	add.w	sl, sl, #8
    60ba:	e576      	b.n	5baa <_vfiprintf_r+0x2a6>
    60bc:	9902      	ldr	r1, [sp, #8]
    60be:	9808      	ldr	r0, [sp, #32]
    60c0:	930a      	str	r3, [sp, #40]	@ 0x28
    60c2:	aa0f      	add	r2, sp, #60	@ 0x3c
    60c4:	f7fd fc88 	bl	39d8 <__sprint_r>
    60c8:	2800      	cmp	r0, #0
    60ca:	f47f ad4d 	bne.w	5b68 <_vfiprintf_r+0x264>
    60ce:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    60d2:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
    60d4:	46ca      	mov	sl, r9
    60d6:	e57c      	b.n	5bd2 <_vfiprintf_r+0x2ce>
    60d8:	9902      	ldr	r1, [sp, #8]
    60da:	9808      	ldr	r0, [sp, #32]
    60dc:	9306      	str	r3, [sp, #24]
    60de:	aa0f      	add	r2, sp, #60	@ 0x3c
    60e0:	f7fd fc7a 	bl	39d8 <__sprint_r>
    60e4:	2800      	cmp	r0, #0
    60e6:	f47f ad3f 	bne.w	5b68 <_vfiprintf_r+0x264>
    60ea:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    60ee:	9b06      	ldr	r3, [sp, #24]
    60f0:	46ca      	mov	sl, r9
    60f2:	e580      	b.n	5bf6 <_vfiprintf_r+0x2f2>
    60f4:	2c10      	cmp	r4, #16
    60f6:	9b10      	ldr	r3, [sp, #64]	@ 0x40
    60f8:	4e2b      	ldr	r6, [pc, #172]	@ (61a8 <_vfiprintf_r+0x8a4>)
    60fa:	dd1f      	ble.n	613c <_vfiprintf_r+0x838>
    60fc:	9f08      	ldr	r7, [sp, #32]
    60fe:	f8dd 8008 	ldr.w	r8, [sp, #8]
    6102:	2510      	movs	r5, #16
    6104:	e004      	b.n	6110 <_vfiprintf_r+0x80c>
    6106:	3c10      	subs	r4, #16
    6108:	2c10      	cmp	r4, #16
    610a:	f10a 0a08 	add.w	sl, sl, #8
    610e:	dd15      	ble.n	613c <_vfiprintf_r+0x838>
    6110:	3301      	adds	r3, #1
    6112:	3110      	adds	r1, #16
    6114:	2b07      	cmp	r3, #7
    6116:	e9ca 6500 	strd	r6, r5, [sl]
    611a:	e9cd 3110 	strd	r3, r1, [sp, #64]	@ 0x40
    611e:	ddf2      	ble.n	6106 <_vfiprintf_r+0x802>
    6120:	aa0f      	add	r2, sp, #60	@ 0x3c
    6122:	4641      	mov	r1, r8
    6124:	4638      	mov	r0, r7
    6126:	f7fd fc57 	bl	39d8 <__sprint_r>
    612a:	2800      	cmp	r0, #0
    612c:	f47f ad1c 	bne.w	5b68 <_vfiprintf_r+0x264>
    6130:	3c10      	subs	r4, #16
    6132:	2c10      	cmp	r4, #16
    6134:	e9dd 3110 	ldrd	r3, r1, [sp, #64]	@ 0x40
    6138:	46ca      	mov	sl, r9
    613a:	dce9      	bgt.n	6110 <_vfiprintf_r+0x80c>
    613c:	3301      	adds	r3, #1
    613e:	4421      	add	r1, r4
    6140:	2b07      	cmp	r3, #7
    6142:	e9ca 6400 	strd	r6, r4, [sl]
    6146:	e9cd 3110 	strd	r3, r1, [sp, #64]	@ 0x40
    614a:	f77f ad72 	ble.w	5c32 <_vfiprintf_r+0x32e>
    614e:	9902      	ldr	r1, [sp, #8]
    6150:	9808      	ldr	r0, [sp, #32]
    6152:	aa0f      	add	r2, sp, #60	@ 0x3c
    6154:	f7fd fc40 	bl	39d8 <__sprint_r>
    6158:	2800      	cmp	r0, #0
    615a:	f47f ad05 	bne.w	5b68 <_vfiprintf_r+0x264>
    615e:	9911      	ldr	r1, [sp, #68]	@ 0x44
    6160:	e567      	b.n	5c32 <_vfiprintf_r+0x32e>
    6162:	9807      	ldr	r0, [sp, #28]
    6164:	f850 3b04 	ldr.w	r3, [r0], #4
    6168:	9007      	str	r0, [sp, #28]
    616a:	f011 0010 	ands.w	r0, r1, #16
    616e:	f47f ae23 	bne.w	5db8 <_vfiprintf_r+0x4b4>
    6172:	f011 0240 	ands.w	r2, r1, #64	@ 0x40
    6176:	f43f ae1f 	beq.w	5db8 <_vfiprintf_r+0x4b4>
    617a:	b29b      	uxth	r3, r3
    617c:	4602      	mov	r2, r0
    617e:	e61b      	b.n	5db8 <_vfiprintf_r+0x4b4>
    6180:	9807      	ldr	r0, [sp, #28]
    6182:	f850 3b04 	ldr.w	r3, [r0], #4
    6186:	9007      	str	r0, [sp, #28]
    6188:	f011 0010 	ands.w	r0, r1, #16
    618c:	f47f ae43 	bne.w	5e16 <_vfiprintf_r+0x512>
    6190:	f011 0240 	ands.w	r2, r1, #64	@ 0x40
    6194:	f43f ae3f 	beq.w	5e16 <_vfiprintf_r+0x512>
    6198:	b29b      	uxth	r3, r3
    619a:	4602      	mov	r2, r0
    619c:	e63b      	b.n	5e16 <_vfiprintf_r+0x512>
    619e:	bf00      	nop
    61a0:	0000746c 	.word	0x0000746c
    61a4:	000077bc 	.word	0x000077bc
    61a8:	000077ac 	.word	0x000077ac
    61ac:	9902      	ldr	r1, [sp, #8]
    61ae:	9808      	ldr	r0, [sp, #32]
    61b0:	9303      	str	r3, [sp, #12]
    61b2:	aa0f      	add	r2, sp, #60	@ 0x3c
    61b4:	f7fd fc10 	bl	39d8 <__sprint_r>
    61b8:	2800      	cmp	r0, #0
    61ba:	f47f acd5 	bne.w	5b68 <_vfiprintf_r+0x264>
    61be:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    61c2:	9b03      	ldr	r3, [sp, #12]
    61c4:	46ca      	mov	sl, r9
    61c6:	e51e      	b.n	5c06 <_vfiprintf_r+0x302>
    61c8:	9b03      	ldr	r3, [sp, #12]
    61ca:	9301      	str	r3, [sp, #4]
    61cc:	464c      	mov	r4, r9
    61ce:	e648      	b.n	5e62 <_vfiprintf_r+0x55e>
    61d0:	f89b 1000 	ldrb.w	r1, [fp]
    61d4:	9307      	str	r3, [sp, #28]
    61d6:	f7ff bbed 	b.w	59b4 <_vfiprintf_r+0xb0>
    61da:	9a03      	ldr	r2, [sp, #12]
    61dc:	9201      	str	r2, [sp, #4]
    61de:	464c      	mov	r4, r9
    61e0:	e63f      	b.n	5e62 <_vfiprintf_r+0x55e>
    61e2:	f018 0f10 	tst.w	r8, #16
    61e6:	d138      	bne.n	625a <_vfiprintf_r+0x956>
    61e8:	f018 0f40 	tst.w	r8, #64	@ 0x40
    61ec:	d035      	beq.n	625a <_vfiprintf_r+0x956>
    61ee:	9b07      	ldr	r3, [sp, #28]
    61f0:	9a05      	ldr	r2, [sp, #20]
    61f2:	681b      	ldr	r3, [r3, #0]
    61f4:	801a      	strh	r2, [r3, #0]
    61f6:	e5ad      	b.n	5d54 <_vfiprintf_r+0x450>
    61f8:	4641      	mov	r1, r8
    61fa:	e5d0      	b.n	5d9e <_vfiprintf_r+0x49a>
    61fc:	4641      	mov	r1, r8
    61fe:	e5fd      	b.n	5dfc <_vfiprintf_r+0x4f8>
    6200:	4b6b      	ldr	r3, [pc, #428]	@ (63b0 <_vfiprintf_r+0xaac>)
    6202:	9309      	str	r3, [sp, #36]	@ 0x24
    6204:	f018 0220 	ands.w	r2, r8, #32
    6208:	d02c      	beq.n	6264 <_vfiprintf_r+0x960>
    620a:	9b07      	ldr	r3, [sp, #28]
    620c:	3307      	adds	r3, #7
    620e:	f023 0307 	bic.w	r3, r3, #7
    6212:	4618      	mov	r0, r3
    6214:	685a      	ldr	r2, [r3, #4]
    6216:	f850 3b08 	ldr.w	r3, [r0], #8
    621a:	9007      	str	r0, [sp, #28]
    621c:	f018 0f01 	tst.w	r8, #1
    6220:	f43f ae5d 	beq.w	5ede <_vfiprintf_r+0x5da>
    6224:	ea53 0002 	orrs.w	r0, r3, r2
    6228:	f43f ae59 	beq.w	5ede <_vfiprintf_r+0x5da>
    622c:	f88d 1039 	strb.w	r1, [sp, #57]	@ 0x39
    6230:	2130      	movs	r1, #48	@ 0x30
    6232:	f88d 1038 	strb.w	r1, [sp, #56]	@ 0x38
    6236:	2100      	movs	r1, #0
    6238:	f88d 1037 	strb.w	r1, [sp, #55]	@ 0x37
    623c:	9903      	ldr	r1, [sp, #12]
    623e:	2900      	cmp	r1, #0
    6240:	f280 808d 	bge.w	635e <_vfiprintf_r+0xa5a>
    6244:	f048 0802 	orr.w	r8, r8, #2
    6248:	e65d      	b.n	5f06 <_vfiprintf_r+0x602>
    624a:	4b5a      	ldr	r3, [pc, #360]	@ (63b4 <_vfiprintf_r+0xab0>)
    624c:	9309      	str	r3, [sp, #36]	@ 0x24
    624e:	e7d9      	b.n	6204 <_vfiprintf_r+0x900>
    6250:	4620      	mov	r0, r4
    6252:	f7fd fb55 	bl	3900 <strlen>
    6256:	4603      	mov	r3, r0
    6258:	e623      	b.n	5ea2 <_vfiprintf_r+0x59e>
    625a:	9b07      	ldr	r3, [sp, #28]
    625c:	9a05      	ldr	r2, [sp, #20]
    625e:	681b      	ldr	r3, [r3, #0]
    6260:	601a      	str	r2, [r3, #0]
    6262:	e577      	b.n	5d54 <_vfiprintf_r+0x450>
    6264:	9807      	ldr	r0, [sp, #28]
    6266:	f850 3b04 	ldr.w	r3, [r0], #4
    626a:	9007      	str	r0, [sp, #28]
    626c:	f018 0010 	ands.w	r0, r8, #16
    6270:	d1d4      	bne.n	621c <_vfiprintf_r+0x918>
    6272:	f018 0240 	ands.w	r2, r8, #64	@ 0x40
    6276:	bf1c      	itt	ne
    6278:	b29b      	uxthne	r3, r3
    627a:	4602      	movne	r2, r0
    627c:	e7ce      	b.n	621c <_vfiprintf_r+0x918>
    627e:	4e4e      	ldr	r6, [pc, #312]	@ (63b8 <_vfiprintf_r+0xab4>)
    6280:	f8cd a004 	str.w	sl, [sp, #4]
    6284:	464c      	mov	r4, r9
    6286:	f04f 0e05 	mov.w	lr, #5
    628a:	1899      	adds	r1, r3, r2
    628c:	f141 0100 	adc.w	r1, r1, #0
    6290:	fba6 0701 	umull	r0, r7, r6, r1
    6294:	f027 0003 	bic.w	r0, r7, #3
    6298:	eb00 0097 	add.w	r0, r0, r7, lsr #2
    629c:	1a09      	subs	r1, r1, r0
    629e:	1a58      	subs	r0, r3, r1
    62a0:	469a      	mov	sl, r3
    62a2:	4694      	mov	ip, r2
    62a4:	f162 0300 	sbc.w	r3, r2, #0
    62a8:	f04f 32cc 	mov.w	r2, #3435973836	@ 0xcccccccc
    62ac:	fb02 f200 	mul.w	r2, r2, r0
    62b0:	fb06 2203 	mla	r2, r6, r3, r2
    62b4:	fba0 3006 	umull	r3, r0, r0, r6
    62b8:	f003 0701 	and.w	r7, r3, #1
    62bc:	4402      	add	r2, r0
    62be:	fba7 070e 	umull	r0, r7, r7, lr
    62c2:	1840      	adds	r0, r0, r1
    62c4:	f1ba 0f0a 	cmp.w	sl, #10
    62c8:	ea4f 0353 	mov.w	r3, r3, lsr #1
    62cc:	f100 0030 	add.w	r0, r0, #48	@ 0x30
    62d0:	f17c 0c00 	sbcs.w	ip, ip, #0
    62d4:	ea43 73c2 	orr.w	r3, r3, r2, lsl #31
    62d8:	f804 0d01 	strb.w	r0, [r4, #-1]!
    62dc:	ea4f 0252 	mov.w	r2, r2, lsr #1
    62e0:	d2d3      	bcs.n	628a <_vfiprintf_r+0x986>
    62e2:	9a03      	ldr	r2, [sp, #12]
    62e4:	f8dd a004 	ldr.w	sl, [sp, #4]
    62e8:	eba9 0304 	sub.w	r3, r9, r4
    62ec:	429a      	cmp	r2, r3
    62ee:	bfb8      	it	lt
    62f0:	461a      	movlt	r2, r3
    62f2:	9201      	str	r2, [sp, #4]
    62f4:	f7ff bbf4 	b.w	5ae0 <_vfiprintf_r+0x1dc>
    62f8:	9902      	ldr	r1, [sp, #8]
    62fa:	9808      	ldr	r0, [sp, #32]
    62fc:	930a      	str	r3, [sp, #40]	@ 0x28
    62fe:	aa0f      	add	r2, sp, #60	@ 0x3c
    6300:	f7fd fb6a 	bl	39d8 <__sprint_r>
    6304:	2800      	cmp	r0, #0
    6306:	f47f ac2f 	bne.w	5b68 <_vfiprintf_r+0x264>
    630a:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    630e:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
    6310:	46ca      	mov	sl, r9
    6312:	e44a      	b.n	5baa <_vfiprintf_r+0x2a6>
    6314:	4688      	mov	r8, r1
    6316:	e4ba      	b.n	5c8e <_vfiprintf_r+0x38a>
    6318:	2d01      	cmp	r5, #1
    631a:	f47f adf2 	bne.w	5f02 <_vfiprintf_r+0x5fe>
    631e:	2500      	movs	r5, #0
    6320:	2330      	movs	r3, #48	@ 0x30
    6322:	e4bb      	b.n	5c9c <_vfiprintf_r+0x398>
    6324:	f7fd fa98 	bl	3858 <__sinit>
    6328:	f7ff baf9 	b.w	591e <_vfiprintf_r+0x1a>
    632c:	9902      	ldr	r1, [sp, #8]
    632e:	9808      	ldr	r0, [sp, #32]
    6330:	9306      	str	r3, [sp, #24]
    6332:	aa0f      	add	r2, sp, #60	@ 0x3c
    6334:	f7fd fb50 	bl	39d8 <__sprint_r>
    6338:	2800      	cmp	r0, #0
    633a:	f47f ac15 	bne.w	5b68 <_vfiprintf_r+0x264>
    633e:	e9dd 2110 	ldrd	r2, r1, [sp, #64]	@ 0x40
    6342:	9b06      	ldr	r3, [sp, #24]
    6344:	46ca      	mov	sl, r9
    6346:	e459      	b.n	5bfc <_vfiprintf_r+0x2f8>
    6348:	2b06      	cmp	r3, #6
    634a:	bf28      	it	cs
    634c:	2306      	movcs	r3, #6
    634e:	4c1b      	ldr	r4, [pc, #108]	@ (63bc <_vfiprintf_r+0xab8>)
    6350:	9507      	str	r5, [sp, #28]
    6352:	9301      	str	r3, [sp, #4]
    6354:	e41b      	b.n	5b8e <_vfiprintf_r+0x28a>
    6356:	e9cd 2506 	strd	r2, r5, [sp, #24]
    635a:	9203      	str	r2, [sp, #12]
    635c:	e41a      	b.n	5b94 <_vfiprintf_r+0x290>
    635e:	f028 0180 	bic.w	r1, r8, #128	@ 0x80
    6362:	f041 0802 	orr.w	r8, r1, #2
    6366:	e5ce      	b.n	5f06 <_vfiprintf_r+0x602>
    6368:	9902      	ldr	r1, [sp, #8]
    636a:	9808      	ldr	r0, [sp, #32]
    636c:	aa0f      	add	r2, sp, #60	@ 0x3c
    636e:	f7fd fb33 	bl	39d8 <__sprint_r>
    6372:	f7ff bbf9 	b.w	5b68 <_vfiprintf_r+0x264>
    6376:	9b03      	ldr	r3, [sp, #12]
    6378:	e593      	b.n	5ea2 <_vfiprintf_r+0x59e>
    637a:	2300      	movs	r3, #0
    637c:	4683      	mov	fp, r0
    637e:	9303      	str	r3, [sp, #12]
    6380:	f7ff bb1a 	b.w	59b8 <_vfiprintf_r+0xb4>
    6384:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    6388:	9305      	str	r3, [sp, #20]
    638a:	f7ff bbf2 	b.w	5b72 <_vfiprintf_r+0x26e>
    638e:	2330      	movs	r3, #48	@ 0x30
    6390:	e484      	b.n	5c9c <_vfiprintf_r+0x398>
    6392:	9b07      	ldr	r3, [sp, #28]
    6394:	f89b 1001 	ldrb.w	r1, [fp, #1]
    6398:	f853 2b04 	ldr.w	r2, [r3], #4
    639c:	9307      	str	r3, [sp, #28]
    639e:	ea42 72e2 	orr.w	r2, r2, r2, asr #31
    63a2:	4683      	mov	fp, r0
    63a4:	9203      	str	r2, [sp, #12]
    63a6:	f7ff bb05 	b.w	59b4 <_vfiprintf_r+0xb0>
    63aa:	2500      	movs	r5, #0
    63ac:	e46f      	b.n	5c8e <_vfiprintf_r+0x38a>
    63ae:	bf00      	nop
    63b0:	00007458 	.word	0x00007458
    63b4:	0000746c 	.word	0x0000746c
    63b8:	cccccccd 	.word	0xcccccccd
    63bc:	00007480 	.word	0x00007480

000063c0 <vfiprintf>:
    63c0:	b410      	push	{r4}
    63c2:	4c05      	ldr	r4, [pc, #20]	@ (63d8 <vfiprintf+0x18>)
    63c4:	4684      	mov	ip, r0
    63c6:	4613      	mov	r3, r2
    63c8:	6820      	ldr	r0, [r4, #0]
    63ca:	f85d 4b04 	ldr.w	r4, [sp], #4
    63ce:	460a      	mov	r2, r1
    63d0:	4661      	mov	r1, ip
    63d2:	f7ff ba97 	b.w	5904 <_vfiprintf_r>
    63d6:	bf00      	nop
    63d8:	000078b8 	.word	0x000078b8

000063dc <__sbprintf>:
    63dc:	b570      	push	{r4, r5, r6, lr}
    63de:	460c      	mov	r4, r1
    63e0:	8989      	ldrh	r1, [r1, #12]
    63e2:	f5ad 6d8d 	sub.w	sp, sp, #1128	@ 0x468
    63e6:	f021 0102 	bic.w	r1, r1, #2
    63ea:	f8ad 100c 	strh.w	r1, [sp, #12]
    63ee:	a91a      	add	r1, sp, #104	@ 0x68
    63f0:	9100      	str	r1, [sp, #0]
    63f2:	9104      	str	r1, [sp, #16]
    63f4:	f44f 6180 	mov.w	r1, #1024	@ 0x400
    63f8:	9102      	str	r1, [sp, #8]
    63fa:	9105      	str	r1, [sp, #20]
    63fc:	6e61      	ldr	r1, [r4, #100]	@ 0x64
    63fe:	9119      	str	r1, [sp, #100]	@ 0x64
    6400:	89e1      	ldrh	r1, [r4, #14]
    6402:	f8ad 100e 	strh.w	r1, [sp, #14]
    6406:	69e1      	ldr	r1, [r4, #28]
    6408:	9107      	str	r1, [sp, #28]
    640a:	6a61      	ldr	r1, [r4, #36]	@ 0x24
    640c:	9109      	str	r1, [sp, #36]	@ 0x24
    640e:	2100      	movs	r1, #0
    6410:	9106      	str	r1, [sp, #24]
    6412:	4669      	mov	r1, sp
    6414:	4606      	mov	r6, r0
    6416:	f7ff fa75 	bl	5904 <_vfiprintf_r>
    641a:	1e05      	subs	r5, r0, #0
    641c:	db07      	blt.n	642e <__sbprintf+0x52>
    641e:	4669      	mov	r1, sp
    6420:	4630      	mov	r0, r6
    6422:	f7fb fe21 	bl	2068 <_fflush_r>
    6426:	2800      	cmp	r0, #0
    6428:	bf18      	it	ne
    642a:	f04f 35ff 	movne.w	r5, #4294967295	@ 0xffffffff
    642e:	f8bd 300c 	ldrh.w	r3, [sp, #12]
    6432:	065b      	lsls	r3, r3, #25
    6434:	d503      	bpl.n	643e <__sbprintf+0x62>
    6436:	89a3      	ldrh	r3, [r4, #12]
    6438:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    643c:	81a3      	strh	r3, [r4, #12]
    643e:	4628      	mov	r0, r5
    6440:	f50d 6d8d 	add.w	sp, sp, #1128	@ 0x468
    6444:	bd70      	pop	{r4, r5, r6, pc}
    6446:	bf00      	nop

00006448 <_read_r>:
    6448:	b538      	push	{r3, r4, r5, lr}
    644a:	460c      	mov	r4, r1
    644c:	4d08      	ldr	r5, [pc, #32]	@ (6470 <_read_r+0x28>)
    644e:	4684      	mov	ip, r0
    6450:	4611      	mov	r1, r2
    6452:	4620      	mov	r0, r4
    6454:	461a      	mov	r2, r3
    6456:	2300      	movs	r3, #0
    6458:	602b      	str	r3, [r5, #0]
    645a:	4664      	mov	r4, ip
    645c:	f7fa f99a 	bl	794 <__wrap__read>
    6460:	1c43      	adds	r3, r0, #1
    6462:	d000      	beq.n	6466 <_read_r+0x1e>
    6464:	bd38      	pop	{r3, r4, r5, pc}
    6466:	682b      	ldr	r3, [r5, #0]
    6468:	2b00      	cmp	r3, #0
    646a:	d0fb      	beq.n	6464 <_read_r+0x1c>
    646c:	6023      	str	r3, [r4, #0]
    646e:	bd38      	pop	{r3, r4, r5, pc}
    6470:	00007fa4 	.word	0x00007fa4

00006474 <_lseek_r>:
    6474:	b538      	push	{r3, r4, r5, lr}
    6476:	460c      	mov	r4, r1
    6478:	4d08      	ldr	r5, [pc, #32]	@ (649c <_lseek_r+0x28>)
    647a:	4684      	mov	ip, r0
    647c:	4611      	mov	r1, r2
    647e:	4620      	mov	r0, r4
    6480:	461a      	mov	r2, r3
    6482:	2300      	movs	r3, #0
    6484:	602b      	str	r3, [r5, #0]
    6486:	4664      	mov	r4, ip
    6488:	f7fa f970 	bl	76c <__wrap__lseek>
    648c:	1c43      	adds	r3, r0, #1
    648e:	d000      	beq.n	6492 <_lseek_r+0x1e>
    6490:	bd38      	pop	{r3, r4, r5, pc}
    6492:	682b      	ldr	r3, [r5, #0]
    6494:	2b00      	cmp	r3, #0
    6496:	d0fb      	beq.n	6490 <_lseek_r+0x1c>
    6498:	6023      	str	r3, [r4, #0]
    649a:	bd38      	pop	{r3, r4, r5, pc}
    649c:	00007fa4 	.word	0x00007fa4

000064a0 <_realloc_r>:
    64a0:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    64a4:	4616      	mov	r6, r2
    64a6:	2900      	cmp	r1, #0
    64a8:	f000 8096 	beq.w	65d8 <_realloc_r+0x138>
    64ac:	460c      	mov	r4, r1
    64ae:	4680      	mov	r8, r0
    64b0:	f106 050b 	add.w	r5, r6, #11
    64b4:	f7fd f8e2 	bl	367c <__malloc_lock>
    64b8:	f854 1c04 	ldr.w	r1, [r4, #-4]
    64bc:	2d16      	cmp	r5, #22
    64be:	f1a4 0908 	sub.w	r9, r4, #8
    64c2:	f021 0703 	bic.w	r7, r1, #3
    64c6:	d858      	bhi.n	657a <_realloc_r+0xda>
    64c8:	2510      	movs	r5, #16
    64ca:	42ae      	cmp	r6, r5
    64cc:	d858      	bhi.n	6580 <_realloc_r+0xe0>
    64ce:	42af      	cmp	r7, r5
    64d0:	da60      	bge.n	6594 <_realloc_r+0xf4>
    64d2:	4bbe      	ldr	r3, [pc, #760]	@ (67cc <_realloc_r+0x32c>)
    64d4:	689a      	ldr	r2, [r3, #8]
    64d6:	eb09 0c07 	add.w	ip, r9, r7
    64da:	4562      	cmp	r2, ip
    64dc:	f8dc 0004 	ldr.w	r0, [ip, #4]
    64e0:	f000 8090 	beq.w	6604 <_realloc_r+0x164>
    64e4:	f020 0301 	bic.w	r3, r0, #1
    64e8:	4463      	add	r3, ip
    64ea:	685b      	ldr	r3, [r3, #4]
    64ec:	07db      	lsls	r3, r3, #31
    64ee:	d468      	bmi.n	65c2 <_realloc_r+0x122>
    64f0:	f020 0003 	bic.w	r0, r0, #3
    64f4:	183b      	adds	r3, r7, r0
    64f6:	429d      	cmp	r5, r3
    64f8:	dd47      	ble.n	658a <_realloc_r+0xea>
    64fa:	07cb      	lsls	r3, r1, #31
    64fc:	d412      	bmi.n	6524 <_realloc_r+0x84>
    64fe:	f854 3c08 	ldr.w	r3, [r4, #-8]
    6502:	eba9 0b03 	sub.w	fp, r9, r3
    6506:	f8db 3004 	ldr.w	r3, [fp, #4]
    650a:	f023 0203 	bic.w	r2, r3, #3
    650e:	4410      	add	r0, r2
    6510:	eb00 0a07 	add.w	sl, r0, r7
    6514:	4555      	cmp	r5, sl
    6516:	f340 80f6 	ble.w	6706 <_realloc_r+0x266>
    651a:	eb07 0a02 	add.w	sl, r7, r2
    651e:	4555      	cmp	r5, sl
    6520:	f340 80cc 	ble.w	66bc <_realloc_r+0x21c>
    6524:	4631      	mov	r1, r6
    6526:	4640      	mov	r0, r8
    6528:	f7fe faf0 	bl	4b0c <_malloc_r>
    652c:	4606      	mov	r6, r0
    652e:	2800      	cmp	r0, #0
    6530:	f000 8120 	beq.w	6774 <_realloc_r+0x2d4>
    6534:	f854 3c04 	ldr.w	r3, [r4, #-4]
    6538:	f023 0301 	bic.w	r3, r3, #1
    653c:	444b      	add	r3, r9
    653e:	f1a0 0208 	sub.w	r2, r0, #8
    6542:	4293      	cmp	r3, r2
    6544:	f000 80b4 	beq.w	66b0 <_realloc_r+0x210>
    6548:	1f3a      	subs	r2, r7, #4
    654a:	2a24      	cmp	r2, #36	@ 0x24
    654c:	f200 80d7 	bhi.w	66fe <_realloc_r+0x25e>
    6550:	2a13      	cmp	r2, #19
    6552:	f200 80a2 	bhi.w	669a <_realloc_r+0x1fa>
    6556:	4603      	mov	r3, r0
    6558:	4622      	mov	r2, r4
    655a:	6811      	ldr	r1, [r2, #0]
    655c:	6019      	str	r1, [r3, #0]
    655e:	6851      	ldr	r1, [r2, #4]
    6560:	6059      	str	r1, [r3, #4]
    6562:	6892      	ldr	r2, [r2, #8]
    6564:	609a      	str	r2, [r3, #8]
    6566:	4621      	mov	r1, r4
    6568:	4640      	mov	r0, r8
    656a:	f7fc fe4f 	bl	320c <_free_r>
    656e:	4640      	mov	r0, r8
    6570:	f7fd f886 	bl	3680 <__malloc_unlock>
    6574:	4630      	mov	r0, r6
    6576:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    657a:	f035 0507 	bics.w	r5, r5, #7
    657e:	d5a4      	bpl.n	64ca <_realloc_r+0x2a>
    6580:	230c      	movs	r3, #12
    6582:	f8c8 3000 	str.w	r3, [r8]
    6586:	2600      	movs	r6, #0
    6588:	e018      	b.n	65bc <_realloc_r+0x11c>
    658a:	461f      	mov	r7, r3
    658c:	e9dc 2302 	ldrd	r2, r3, [ip, #8]
    6590:	60d3      	str	r3, [r2, #12]
    6592:	609a      	str	r2, [r3, #8]
    6594:	f8d9 3004 	ldr.w	r3, [r9, #4]
    6598:	1b7a      	subs	r2, r7, r5
    659a:	2a0f      	cmp	r2, #15
    659c:	f003 0301 	and.w	r3, r3, #1
    65a0:	eb09 0007 	add.w	r0, r9, r7
    65a4:	d81d      	bhi.n	65e2 <_realloc_r+0x142>
    65a6:	433b      	orrs	r3, r7
    65a8:	f8c9 3004 	str.w	r3, [r9, #4]
    65ac:	6843      	ldr	r3, [r0, #4]
    65ae:	f043 0301 	orr.w	r3, r3, #1
    65b2:	6043      	str	r3, [r0, #4]
    65b4:	4640      	mov	r0, r8
    65b6:	f7fd f863 	bl	3680 <__malloc_unlock>
    65ba:	4626      	mov	r6, r4
    65bc:	4630      	mov	r0, r6
    65be:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    65c2:	07c9      	lsls	r1, r1, #31
    65c4:	d4ae      	bmi.n	6524 <_realloc_r+0x84>
    65c6:	f854 3c08 	ldr.w	r3, [r4, #-8]
    65ca:	eba9 0b03 	sub.w	fp, r9, r3
    65ce:	f8db 3004 	ldr.w	r3, [fp, #4]
    65d2:	f023 0203 	bic.w	r2, r3, #3
    65d6:	e7a0      	b.n	651a <_realloc_r+0x7a>
    65d8:	e8bd 4ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    65dc:	4611      	mov	r1, r2
    65de:	f7fe ba95 	b.w	4b0c <_malloc_r>
    65e2:	eb09 0105 	add.w	r1, r9, r5
    65e6:	432b      	orrs	r3, r5
    65e8:	f042 0201 	orr.w	r2, r2, #1
    65ec:	f8c9 3004 	str.w	r3, [r9, #4]
    65f0:	604a      	str	r2, [r1, #4]
    65f2:	6843      	ldr	r3, [r0, #4]
    65f4:	f043 0301 	orr.w	r3, r3, #1
    65f8:	6043      	str	r3, [r0, #4]
    65fa:	3108      	adds	r1, #8
    65fc:	4640      	mov	r0, r8
    65fe:	f7fc fe05 	bl	320c <_free_r>
    6602:	e7d7      	b.n	65b4 <_realloc_r+0x114>
    6604:	f020 0003 	bic.w	r0, r0, #3
    6608:	19c2      	adds	r2, r0, r7
    660a:	f105 0c10 	add.w	ip, r5, #16
    660e:	4562      	cmp	r2, ip
    6610:	f280 8091 	bge.w	6736 <_realloc_r+0x296>
    6614:	07ca      	lsls	r2, r1, #31
    6616:	d485      	bmi.n	6524 <_realloc_r+0x84>
    6618:	f854 2c08 	ldr.w	r2, [r4, #-8]
    661c:	eba9 0b02 	sub.w	fp, r9, r2
    6620:	f8db 2004 	ldr.w	r2, [fp, #4]
    6624:	f022 0203 	bic.w	r2, r2, #3
    6628:	4410      	add	r0, r2
    662a:	eb00 0a07 	add.w	sl, r0, r7
    662e:	45d4      	cmp	ip, sl
    6630:	f73f af73 	bgt.w	651a <_realloc_r+0x7a>
    6634:	465e      	mov	r6, fp
    6636:	f8db 100c 	ldr.w	r1, [fp, #12]
    663a:	f856 0f08 	ldr.w	r0, [r6, #8]!
    663e:	1f3a      	subs	r2, r7, #4
    6640:	2a24      	cmp	r2, #36	@ 0x24
    6642:	60c1      	str	r1, [r0, #12]
    6644:	6088      	str	r0, [r1, #8]
    6646:	f200 80ae 	bhi.w	67a6 <_realloc_r+0x306>
    664a:	2a13      	cmp	r2, #19
    664c:	f240 80a9 	bls.w	67a2 <_realloc_r+0x302>
    6650:	6821      	ldr	r1, [r4, #0]
    6652:	f8cb 1008 	str.w	r1, [fp, #8]
    6656:	6861      	ldr	r1, [r4, #4]
    6658:	f8cb 100c 	str.w	r1, [fp, #12]
    665c:	2a1b      	cmp	r2, #27
    665e:	f200 80a8 	bhi.w	67b2 <_realloc_r+0x312>
    6662:	3408      	adds	r4, #8
    6664:	f10b 0210 	add.w	r2, fp, #16
    6668:	6821      	ldr	r1, [r4, #0]
    666a:	6011      	str	r1, [r2, #0]
    666c:	6861      	ldr	r1, [r4, #4]
    666e:	6051      	str	r1, [r2, #4]
    6670:	68a1      	ldr	r1, [r4, #8]
    6672:	6091      	str	r1, [r2, #8]
    6674:	eb0b 0105 	add.w	r1, fp, r5
    6678:	ebaa 0205 	sub.w	r2, sl, r5
    667c:	f042 0201 	orr.w	r2, r2, #1
    6680:	6099      	str	r1, [r3, #8]
    6682:	604a      	str	r2, [r1, #4]
    6684:	f8db 3004 	ldr.w	r3, [fp, #4]
    6688:	f003 0301 	and.w	r3, r3, #1
    668c:	432b      	orrs	r3, r5
    668e:	4640      	mov	r0, r8
    6690:	f8cb 3004 	str.w	r3, [fp, #4]
    6694:	f7fc fff4 	bl	3680 <__malloc_unlock>
    6698:	e790      	b.n	65bc <_realloc_r+0x11c>
    669a:	6823      	ldr	r3, [r4, #0]
    669c:	6003      	str	r3, [r0, #0]
    669e:	6863      	ldr	r3, [r4, #4]
    66a0:	6043      	str	r3, [r0, #4]
    66a2:	2a1b      	cmp	r2, #27
    66a4:	d83c      	bhi.n	6720 <_realloc_r+0x280>
    66a6:	f104 0208 	add.w	r2, r4, #8
    66aa:	f100 0308 	add.w	r3, r0, #8
    66ae:	e754      	b.n	655a <_realloc_r+0xba>
    66b0:	f850 3c04 	ldr.w	r3, [r0, #-4]
    66b4:	f023 0303 	bic.w	r3, r3, #3
    66b8:	441f      	add	r7, r3
    66ba:	e76b      	b.n	6594 <_realloc_r+0xf4>
    66bc:	1f3a      	subs	r2, r7, #4
    66be:	465e      	mov	r6, fp
    66c0:	f8db 300c 	ldr.w	r3, [fp, #12]
    66c4:	f856 1f08 	ldr.w	r1, [r6, #8]!
    66c8:	2a24      	cmp	r2, #36	@ 0x24
    66ca:	60cb      	str	r3, [r1, #12]
    66cc:	6099      	str	r1, [r3, #8]
    66ce:	d822      	bhi.n	6716 <_realloc_r+0x276>
    66d0:	2a13      	cmp	r2, #19
    66d2:	d91e      	bls.n	6712 <_realloc_r+0x272>
    66d4:	6823      	ldr	r3, [r4, #0]
    66d6:	f8cb 3008 	str.w	r3, [fp, #8]
    66da:	6863      	ldr	r3, [r4, #4]
    66dc:	f8cb 300c 	str.w	r3, [fp, #12]
    66e0:	2a1b      	cmp	r2, #27
    66e2:	d83b      	bhi.n	675c <_realloc_r+0x2bc>
    66e4:	3408      	adds	r4, #8
    66e6:	f10b 0310 	add.w	r3, fp, #16
    66ea:	6822      	ldr	r2, [r4, #0]
    66ec:	601a      	str	r2, [r3, #0]
    66ee:	6862      	ldr	r2, [r4, #4]
    66f0:	605a      	str	r2, [r3, #4]
    66f2:	68a2      	ldr	r2, [r4, #8]
    66f4:	609a      	str	r2, [r3, #8]
    66f6:	4634      	mov	r4, r6
    66f8:	4657      	mov	r7, sl
    66fa:	46d9      	mov	r9, fp
    66fc:	e74a      	b.n	6594 <_realloc_r+0xf4>
    66fe:	4621      	mov	r1, r4
    6700:	f7ff f880 	bl	5804 <memmove>
    6704:	e72f      	b.n	6566 <_realloc_r+0xc6>
    6706:	e9dc 1302 	ldrd	r1, r3, [ip, #8]
    670a:	1f3a      	subs	r2, r7, #4
    670c:	60cb      	str	r3, [r1, #12]
    670e:	6099      	str	r1, [r3, #8]
    6710:	e7d5      	b.n	66be <_realloc_r+0x21e>
    6712:	4633      	mov	r3, r6
    6714:	e7e9      	b.n	66ea <_realloc_r+0x24a>
    6716:	4621      	mov	r1, r4
    6718:	4630      	mov	r0, r6
    671a:	f7ff f873 	bl	5804 <memmove>
    671e:	e7ea      	b.n	66f6 <_realloc_r+0x256>
    6720:	68a3      	ldr	r3, [r4, #8]
    6722:	6083      	str	r3, [r0, #8]
    6724:	68e3      	ldr	r3, [r4, #12]
    6726:	60c3      	str	r3, [r0, #12]
    6728:	2a24      	cmp	r2, #36	@ 0x24
    672a:	d027      	beq.n	677c <_realloc_r+0x2dc>
    672c:	f104 0210 	add.w	r2, r4, #16
    6730:	f100 0310 	add.w	r3, r0, #16
    6734:	e711      	b.n	655a <_realloc_r+0xba>
    6736:	eb09 0105 	add.w	r1, r9, r5
    673a:	6099      	str	r1, [r3, #8]
    673c:	1b53      	subs	r3, r2, r5
    673e:	f043 0301 	orr.w	r3, r3, #1
    6742:	604b      	str	r3, [r1, #4]
    6744:	f854 3c04 	ldr.w	r3, [r4, #-4]
    6748:	f003 0301 	and.w	r3, r3, #1
    674c:	432b      	orrs	r3, r5
    674e:	4640      	mov	r0, r8
    6750:	f844 3c04 	str.w	r3, [r4, #-4]
    6754:	f7fc ff94 	bl	3680 <__malloc_unlock>
    6758:	4626      	mov	r6, r4
    675a:	e72f      	b.n	65bc <_realloc_r+0x11c>
    675c:	68a3      	ldr	r3, [r4, #8]
    675e:	f8cb 3010 	str.w	r3, [fp, #16]
    6762:	68e3      	ldr	r3, [r4, #12]
    6764:	f8cb 3014 	str.w	r3, [fp, #20]
    6768:	2a24      	cmp	r2, #36	@ 0x24
    676a:	d010      	beq.n	678e <_realloc_r+0x2ee>
    676c:	3410      	adds	r4, #16
    676e:	f10b 0318 	add.w	r3, fp, #24
    6772:	e7ba      	b.n	66ea <_realloc_r+0x24a>
    6774:	4640      	mov	r0, r8
    6776:	f7fc ff83 	bl	3680 <__malloc_unlock>
    677a:	e704      	b.n	6586 <_realloc_r+0xe6>
    677c:	6923      	ldr	r3, [r4, #16]
    677e:	6103      	str	r3, [r0, #16]
    6780:	6961      	ldr	r1, [r4, #20]
    6782:	6141      	str	r1, [r0, #20]
    6784:	f104 0218 	add.w	r2, r4, #24
    6788:	f100 0318 	add.w	r3, r0, #24
    678c:	e6e5      	b.n	655a <_realloc_r+0xba>
    678e:	6923      	ldr	r3, [r4, #16]
    6790:	f8cb 3018 	str.w	r3, [fp, #24]
    6794:	6963      	ldr	r3, [r4, #20]
    6796:	f8cb 301c 	str.w	r3, [fp, #28]
    679a:	3418      	adds	r4, #24
    679c:	f10b 0320 	add.w	r3, fp, #32
    67a0:	e7a3      	b.n	66ea <_realloc_r+0x24a>
    67a2:	4632      	mov	r2, r6
    67a4:	e760      	b.n	6668 <_realloc_r+0x1c8>
    67a6:	4621      	mov	r1, r4
    67a8:	4630      	mov	r0, r6
    67aa:	f7ff f82b 	bl	5804 <memmove>
    67ae:	4b07      	ldr	r3, [pc, #28]	@ (67cc <_realloc_r+0x32c>)
    67b0:	e760      	b.n	6674 <_realloc_r+0x1d4>
    67b2:	68a1      	ldr	r1, [r4, #8]
    67b4:	f8cb 1010 	str.w	r1, [fp, #16]
    67b8:	68e1      	ldr	r1, [r4, #12]
    67ba:	f8cb 1014 	str.w	r1, [fp, #20]
    67be:	2a24      	cmp	r2, #36	@ 0x24
    67c0:	d006      	beq.n	67d0 <_realloc_r+0x330>
    67c2:	3410      	adds	r4, #16
    67c4:	f10b 0218 	add.w	r2, fp, #24
    67c8:	e74e      	b.n	6668 <_realloc_r+0x1c8>
    67ca:	bf00      	nop
    67cc:	00007b58 	.word	0x00007b58
    67d0:	6922      	ldr	r2, [r4, #16]
    67d2:	f8cb 2018 	str.w	r2, [fp, #24]
    67d6:	6962      	ldr	r2, [r4, #20]
    67d8:	f8cb 201c 	str.w	r2, [fp, #28]
    67dc:	3418      	adds	r4, #24
    67de:	f10b 0220 	add.w	r2, fp, #32
    67e2:	e741      	b.n	6668 <_realloc_r+0x1c8>
    67e4:	b570      	push	{r4, r5, r6, lr}
    67e6:	f04f 0cff 	mov.w	ip, #255	@ 0xff
    67ea:	f44c 6ce0 	orr.w	ip, ip, #1792	@ 0x700
    67ee:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    67f2:	bf1d      	ittte	ne
    67f4:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    67f8:	ea94 0f0c 	teqne	r4, ip
    67fc:	ea95 0f0c 	teqne	r5, ip
    6800:	f000 f8de 	bleq	69c0 <_realloc_r+0x520>
    6804:	442c      	add	r4, r5
    6806:	ea81 0603 	eor.w	r6, r1, r3
    680a:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
    680e:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
    6812:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
    6816:	bf18      	it	ne
    6818:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
    681c:	f441 1180 	orr.w	r1, r1, #1048576	@ 0x100000
    6820:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
    6824:	d038      	beq.n	6898 <_realloc_r+0x3f8>
    6826:	fba0 ce02 	umull	ip, lr, r0, r2
    682a:	f04f 0500 	mov.w	r5, #0
    682e:	fbe1 e502 	umlal	lr, r5, r1, r2
    6832:	f006 4200 	and.w	r2, r6, #2147483648	@ 0x80000000
    6836:	fbe0 e503 	umlal	lr, r5, r0, r3
    683a:	f04f 0600 	mov.w	r6, #0
    683e:	fbe1 5603 	umlal	r5, r6, r1, r3
    6842:	f09c 0f00 	teq	ip, #0
    6846:	bf18      	it	ne
    6848:	f04e 0e01 	orrne.w	lr, lr, #1
    684c:	f1a4 04ff 	sub.w	r4, r4, #255	@ 0xff
    6850:	f5b6 7f00 	cmp.w	r6, #512	@ 0x200
    6854:	f564 7440 	sbc.w	r4, r4, #768	@ 0x300
    6858:	d204      	bcs.n	6864 <_realloc_r+0x3c4>
    685a:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
    685e:	416d      	adcs	r5, r5
    6860:	eb46 0606 	adc.w	r6, r6, r6
    6864:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
    6868:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
    686c:	ea4f 20c5 	mov.w	r0, r5, lsl #11
    6870:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
    6874:	ea4f 2ece 	mov.w	lr, lr, lsl #11
    6878:	f1b4 0cfd 	subs.w	ip, r4, #253	@ 0xfd
    687c:	bf88      	it	hi
    687e:	f5bc 6fe0 	cmphi.w	ip, #1792	@ 0x700
    6882:	d81e      	bhi.n	68c2 <_realloc_r+0x422>
    6884:	f1be 4f00 	cmp.w	lr, #2147483648	@ 0x80000000
    6888:	bf08      	it	eq
    688a:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
    688e:	f150 0000 	adcs.w	r0, r0, #0
    6892:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    6896:	bd70      	pop	{r4, r5, r6, pc}
    6898:	f006 4600 	and.w	r6, r6, #2147483648	@ 0x80000000
    689c:	ea46 0101 	orr.w	r1, r6, r1
    68a0:	ea40 0002 	orr.w	r0, r0, r2
    68a4:	ea81 0103 	eor.w	r1, r1, r3
    68a8:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
    68ac:	bfc2      	ittt	gt
    68ae:	ebd4 050c 	rsbsgt	r5, r4, ip
    68b2:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    68b6:	bd70      	popgt	{r4, r5, r6, pc}
    68b8:	f441 1180 	orr.w	r1, r1, #1048576	@ 0x100000
    68bc:	f04f 0e00 	mov.w	lr, #0
    68c0:	3c01      	subs	r4, #1
    68c2:	f300 80ab 	bgt.w	6a1c <_realloc_r+0x57c>
    68c6:	f114 0f36 	cmn.w	r4, #54	@ 0x36
    68ca:	bfde      	ittt	le
    68cc:	2000      	movle	r0, #0
    68ce:	f001 4100 	andle.w	r1, r1, #2147483648	@ 0x80000000
    68d2:	bd70      	pople	{r4, r5, r6, pc}
    68d4:	f1c4 0400 	rsb	r4, r4, #0
    68d8:	3c20      	subs	r4, #32
    68da:	da35      	bge.n	6948 <_realloc_r+0x4a8>
    68dc:	340c      	adds	r4, #12
    68de:	dc1b      	bgt.n	6918 <_realloc_r+0x478>
    68e0:	f104 0414 	add.w	r4, r4, #20
    68e4:	f1c4 0520 	rsb	r5, r4, #32
    68e8:	fa00 f305 	lsl.w	r3, r0, r5
    68ec:	fa20 f004 	lsr.w	r0, r0, r4
    68f0:	fa01 f205 	lsl.w	r2, r1, r5
    68f4:	ea40 0002 	orr.w	r0, r0, r2
    68f8:	f001 4200 	and.w	r2, r1, #2147483648	@ 0x80000000
    68fc:	f021 4100 	bic.w	r1, r1, #2147483648	@ 0x80000000
    6900:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    6904:	fa21 f604 	lsr.w	r6, r1, r4
    6908:	eb42 0106 	adc.w	r1, r2, r6
    690c:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6910:	bf08      	it	eq
    6912:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    6916:	bd70      	pop	{r4, r5, r6, pc}
    6918:	f1c4 040c 	rsb	r4, r4, #12
    691c:	f1c4 0520 	rsb	r5, r4, #32
    6920:	fa00 f304 	lsl.w	r3, r0, r4
    6924:	fa20 f005 	lsr.w	r0, r0, r5
    6928:	fa01 f204 	lsl.w	r2, r1, r4
    692c:	ea40 0002 	orr.w	r0, r0, r2
    6930:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6934:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    6938:	f141 0100 	adc.w	r1, r1, #0
    693c:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6940:	bf08      	it	eq
    6942:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    6946:	bd70      	pop	{r4, r5, r6, pc}
    6948:	f1c4 0520 	rsb	r5, r4, #32
    694c:	fa00 f205 	lsl.w	r2, r0, r5
    6950:	ea4e 0e02 	orr.w	lr, lr, r2
    6954:	fa20 f304 	lsr.w	r3, r0, r4
    6958:	fa01 f205 	lsl.w	r2, r1, r5
    695c:	ea43 0302 	orr.w	r3, r3, r2
    6960:	fa21 f004 	lsr.w	r0, r1, r4
    6964:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6968:	fa21 f204 	lsr.w	r2, r1, r4
    696c:	ea20 0002 	bic.w	r0, r0, r2
    6970:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
    6974:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6978:	bf08      	it	eq
    697a:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    697e:	bd70      	pop	{r4, r5, r6, pc}
    6980:	f094 0f00 	teq	r4, #0
    6984:	d10f      	bne.n	69a6 <_realloc_r+0x506>
    6986:	f001 4600 	and.w	r6, r1, #2147483648	@ 0x80000000
    698a:	0040      	lsls	r0, r0, #1
    698c:	eb41 0101 	adc.w	r1, r1, r1
    6990:	f411 1f80 	tst.w	r1, #1048576	@ 0x100000
    6994:	bf08      	it	eq
    6996:	3c01      	subeq	r4, #1
    6998:	d0f7      	beq.n	698a <_realloc_r+0x4ea>
    699a:	ea41 0106 	orr.w	r1, r1, r6
    699e:	f095 0f00 	teq	r5, #0
    69a2:	bf18      	it	ne
    69a4:	4770      	bxne	lr
    69a6:	f003 4600 	and.w	r6, r3, #2147483648	@ 0x80000000
    69aa:	0052      	lsls	r2, r2, #1
    69ac:	eb43 0303 	adc.w	r3, r3, r3
    69b0:	f413 1f80 	tst.w	r3, #1048576	@ 0x100000
    69b4:	bf08      	it	eq
    69b6:	3d01      	subeq	r5, #1
    69b8:	d0f7      	beq.n	69aa <_realloc_r+0x50a>
    69ba:	ea43 0306 	orr.w	r3, r3, r6
    69be:	4770      	bx	lr
    69c0:	ea94 0f0c 	teq	r4, ip
    69c4:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    69c8:	bf18      	it	ne
    69ca:	ea95 0f0c 	teqne	r5, ip
    69ce:	d00c      	beq.n	69ea <_realloc_r+0x54a>
    69d0:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    69d4:	bf18      	it	ne
    69d6:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    69da:	d1d1      	bne.n	6980 <_realloc_r+0x4e0>
    69dc:	ea81 0103 	eor.w	r1, r1, r3
    69e0:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    69e4:	f04f 0000 	mov.w	r0, #0
    69e8:	bd70      	pop	{r4, r5, r6, pc}
    69ea:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    69ee:	bf06      	itte	eq
    69f0:	4610      	moveq	r0, r2
    69f2:	4619      	moveq	r1, r3
    69f4:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    69f8:	d019      	beq.n	6a2e <_realloc_r+0x58e>
    69fa:	ea94 0f0c 	teq	r4, ip
    69fe:	d102      	bne.n	6a06 <_realloc_r+0x566>
    6a00:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
    6a04:	d113      	bne.n	6a2e <_realloc_r+0x58e>
    6a06:	ea95 0f0c 	teq	r5, ip
    6a0a:	d105      	bne.n	6a18 <_realloc_r+0x578>
    6a0c:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
    6a10:	bf1c      	itt	ne
    6a12:	4610      	movne	r0, r2
    6a14:	4619      	movne	r1, r3
    6a16:	d10a      	bne.n	6a2e <_realloc_r+0x58e>
    6a18:	ea81 0103 	eor.w	r1, r1, r3
    6a1c:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6a20:	f041 41fe 	orr.w	r1, r1, #2130706432	@ 0x7f000000
    6a24:	f441 0170 	orr.w	r1, r1, #15728640	@ 0xf00000
    6a28:	f04f 0000 	mov.w	r0, #0
    6a2c:	bd70      	pop	{r4, r5, r6, pc}
    6a2e:	f041 41fe 	orr.w	r1, r1, #2130706432	@ 0x7f000000
    6a32:	f441 0178 	orr.w	r1, r1, #16252928	@ 0xf80000
    6a36:	bd70      	pop	{r4, r5, r6, pc}

00006a38 <__aeabi_drsub>:
    6a38:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
    6a3c:	e002      	b.n	6a44 <__adddf3>
    6a3e:	bf00      	nop

00006a40 <__aeabi_dsub>:
    6a40:	f083 4300 	eor.w	r3, r3, #2147483648	@ 0x80000000

00006a44 <__adddf3>:
    6a44:	b530      	push	{r4, r5, lr}
    6a46:	ea4f 0441 	mov.w	r4, r1, lsl #1
    6a4a:	ea4f 0543 	mov.w	r5, r3, lsl #1
    6a4e:	ea94 0f05 	teq	r4, r5
    6a52:	bf08      	it	eq
    6a54:	ea90 0f02 	teqeq	r0, r2
    6a58:	bf1f      	itttt	ne
    6a5a:	ea54 0c00 	orrsne.w	ip, r4, r0
    6a5e:	ea55 0c02 	orrsne.w	ip, r5, r2
    6a62:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
    6a66:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    6a6a:	f000 80e2 	beq.w	6c32 <__adddf3+0x1ee>
    6a6e:	ea4f 5454 	mov.w	r4, r4, lsr #21
    6a72:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
    6a76:	bfb8      	it	lt
    6a78:	426d      	neglt	r5, r5
    6a7a:	dd0c      	ble.n	6a96 <__adddf3+0x52>
    6a7c:	442c      	add	r4, r5
    6a7e:	ea80 0202 	eor.w	r2, r0, r2
    6a82:	ea81 0303 	eor.w	r3, r1, r3
    6a86:	ea82 0000 	eor.w	r0, r2, r0
    6a8a:	ea83 0101 	eor.w	r1, r3, r1
    6a8e:	ea80 0202 	eor.w	r2, r0, r2
    6a92:	ea81 0303 	eor.w	r3, r1, r3
    6a96:	2d36      	cmp	r5, #54	@ 0x36
    6a98:	bf88      	it	hi
    6a9a:	bd30      	pophi	{r4, r5, pc}
    6a9c:	f011 4f00 	tst.w	r1, #2147483648	@ 0x80000000
    6aa0:	ea4f 3101 	mov.w	r1, r1, lsl #12
    6aa4:	f44f 1c80 	mov.w	ip, #1048576	@ 0x100000
    6aa8:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
    6aac:	d002      	beq.n	6ab4 <__adddf3+0x70>
    6aae:	4240      	negs	r0, r0
    6ab0:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    6ab4:	f013 4f00 	tst.w	r3, #2147483648	@ 0x80000000
    6ab8:	ea4f 3303 	mov.w	r3, r3, lsl #12
    6abc:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
    6ac0:	d002      	beq.n	6ac8 <__adddf3+0x84>
    6ac2:	4252      	negs	r2, r2
    6ac4:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
    6ac8:	ea94 0f05 	teq	r4, r5
    6acc:	f000 80a7 	beq.w	6c1e <__adddf3+0x1da>
    6ad0:	f1a4 0401 	sub.w	r4, r4, #1
    6ad4:	f1d5 0e20 	rsbs	lr, r5, #32
    6ad8:	db0d      	blt.n	6af6 <__adddf3+0xb2>
    6ada:	fa02 fc0e 	lsl.w	ip, r2, lr
    6ade:	fa22 f205 	lsr.w	r2, r2, r5
    6ae2:	1880      	adds	r0, r0, r2
    6ae4:	f141 0100 	adc.w	r1, r1, #0
    6ae8:	fa03 f20e 	lsl.w	r2, r3, lr
    6aec:	1880      	adds	r0, r0, r2
    6aee:	fa43 f305 	asr.w	r3, r3, r5
    6af2:	4159      	adcs	r1, r3
    6af4:	e00e      	b.n	6b14 <__adddf3+0xd0>
    6af6:	f1a5 0520 	sub.w	r5, r5, #32
    6afa:	f10e 0e20 	add.w	lr, lr, #32
    6afe:	2a01      	cmp	r2, #1
    6b00:	fa03 fc0e 	lsl.w	ip, r3, lr
    6b04:	bf28      	it	cs
    6b06:	f04c 0c02 	orrcs.w	ip, ip, #2
    6b0a:	fa43 f305 	asr.w	r3, r3, r5
    6b0e:	18c0      	adds	r0, r0, r3
    6b10:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
    6b14:	f001 4500 	and.w	r5, r1, #2147483648	@ 0x80000000
    6b18:	d507      	bpl.n	6b2a <__adddf3+0xe6>
    6b1a:	f04f 0e00 	mov.w	lr, #0
    6b1e:	f1dc 0c00 	rsbs	ip, ip, #0
    6b22:	eb7e 0000 	sbcs.w	r0, lr, r0
    6b26:	eb6e 0101 	sbc.w	r1, lr, r1
    6b2a:	f5b1 1f80 	cmp.w	r1, #1048576	@ 0x100000
    6b2e:	d31b      	bcc.n	6b68 <__adddf3+0x124>
    6b30:	f5b1 1f00 	cmp.w	r1, #2097152	@ 0x200000
    6b34:	d30c      	bcc.n	6b50 <__adddf3+0x10c>
    6b36:	0849      	lsrs	r1, r1, #1
    6b38:	ea5f 0030 	movs.w	r0, r0, rrx
    6b3c:	ea4f 0c3c 	mov.w	ip, ip, rrx
    6b40:	f104 0401 	add.w	r4, r4, #1
    6b44:	ea4f 5244 	mov.w	r2, r4, lsl #21
    6b48:	f512 0f80 	cmn.w	r2, #4194304	@ 0x400000
    6b4c:	f080 809a 	bcs.w	6c84 <__adddf3+0x240>
    6b50:	f1bc 4f00 	cmp.w	ip, #2147483648	@ 0x80000000
    6b54:	bf08      	it	eq
    6b56:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    6b5a:	f150 0000 	adcs.w	r0, r0, #0
    6b5e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    6b62:	ea41 0105 	orr.w	r1, r1, r5
    6b66:	bd30      	pop	{r4, r5, pc}
    6b68:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
    6b6c:	4140      	adcs	r0, r0
    6b6e:	eb41 0101 	adc.w	r1, r1, r1
    6b72:	3c01      	subs	r4, #1
    6b74:	bf28      	it	cs
    6b76:	f5b1 1f80 	cmpcs.w	r1, #1048576	@ 0x100000
    6b7a:	d2e9      	bcs.n	6b50 <__adddf3+0x10c>
    6b7c:	f091 0f00 	teq	r1, #0
    6b80:	bf04      	itt	eq
    6b82:	4601      	moveq	r1, r0
    6b84:	2000      	moveq	r0, #0
    6b86:	fab1 f381 	clz	r3, r1
    6b8a:	bf08      	it	eq
    6b8c:	3320      	addeq	r3, #32
    6b8e:	f1a3 030b 	sub.w	r3, r3, #11
    6b92:	f1b3 0220 	subs.w	r2, r3, #32
    6b96:	da0c      	bge.n	6bb2 <__adddf3+0x16e>
    6b98:	320c      	adds	r2, #12
    6b9a:	dd08      	ble.n	6bae <__adddf3+0x16a>
    6b9c:	f102 0c14 	add.w	ip, r2, #20
    6ba0:	f1c2 020c 	rsb	r2, r2, #12
    6ba4:	fa01 f00c 	lsl.w	r0, r1, ip
    6ba8:	fa21 f102 	lsr.w	r1, r1, r2
    6bac:	e00c      	b.n	6bc8 <__adddf3+0x184>
    6bae:	f102 0214 	add.w	r2, r2, #20
    6bb2:	bfd8      	it	le
    6bb4:	f1c2 0c20 	rsble	ip, r2, #32
    6bb8:	fa01 f102 	lsl.w	r1, r1, r2
    6bbc:	fa20 fc0c 	lsr.w	ip, r0, ip
    6bc0:	bfdc      	itt	le
    6bc2:	ea41 010c 	orrle.w	r1, r1, ip
    6bc6:	4090      	lslle	r0, r2
    6bc8:	1ae4      	subs	r4, r4, r3
    6bca:	bfa2      	ittt	ge
    6bcc:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
    6bd0:	4329      	orrge	r1, r5
    6bd2:	bd30      	popge	{r4, r5, pc}
    6bd4:	ea6f 0404 	mvn.w	r4, r4
    6bd8:	3c1f      	subs	r4, #31
    6bda:	da1c      	bge.n	6c16 <__adddf3+0x1d2>
    6bdc:	340c      	adds	r4, #12
    6bde:	dc0e      	bgt.n	6bfe <__adddf3+0x1ba>
    6be0:	f104 0414 	add.w	r4, r4, #20
    6be4:	f1c4 0220 	rsb	r2, r4, #32
    6be8:	fa20 f004 	lsr.w	r0, r0, r4
    6bec:	fa01 f302 	lsl.w	r3, r1, r2
    6bf0:	ea40 0003 	orr.w	r0, r0, r3
    6bf4:	fa21 f304 	lsr.w	r3, r1, r4
    6bf8:	ea45 0103 	orr.w	r1, r5, r3
    6bfc:	bd30      	pop	{r4, r5, pc}
    6bfe:	f1c4 040c 	rsb	r4, r4, #12
    6c02:	f1c4 0220 	rsb	r2, r4, #32
    6c06:	fa20 f002 	lsr.w	r0, r0, r2
    6c0a:	fa01 f304 	lsl.w	r3, r1, r4
    6c0e:	ea40 0003 	orr.w	r0, r0, r3
    6c12:	4629      	mov	r1, r5
    6c14:	bd30      	pop	{r4, r5, pc}
    6c16:	fa21 f004 	lsr.w	r0, r1, r4
    6c1a:	4629      	mov	r1, r5
    6c1c:	bd30      	pop	{r4, r5, pc}
    6c1e:	f094 0f00 	teq	r4, #0
    6c22:	f483 1380 	eor.w	r3, r3, #1048576	@ 0x100000
    6c26:	bf06      	itte	eq
    6c28:	f481 1180 	eoreq.w	r1, r1, #1048576	@ 0x100000
    6c2c:	3401      	addeq	r4, #1
    6c2e:	3d01      	subne	r5, #1
    6c30:	e74e      	b.n	6ad0 <__adddf3+0x8c>
    6c32:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    6c36:	bf18      	it	ne
    6c38:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    6c3c:	d029      	beq.n	6c92 <__adddf3+0x24e>
    6c3e:	ea94 0f05 	teq	r4, r5
    6c42:	bf08      	it	eq
    6c44:	ea90 0f02 	teqeq	r0, r2
    6c48:	d005      	beq.n	6c56 <__adddf3+0x212>
    6c4a:	ea54 0c00 	orrs.w	ip, r4, r0
    6c4e:	bf04      	itt	eq
    6c50:	4619      	moveq	r1, r3
    6c52:	4610      	moveq	r0, r2
    6c54:	bd30      	pop	{r4, r5, pc}
    6c56:	ea91 0f03 	teq	r1, r3
    6c5a:	bf1e      	ittt	ne
    6c5c:	2100      	movne	r1, #0
    6c5e:	2000      	movne	r0, #0
    6c60:	bd30      	popne	{r4, r5, pc}
    6c62:	ea5f 5c54 	movs.w	ip, r4, lsr #21
    6c66:	d105      	bne.n	6c74 <__adddf3+0x230>
    6c68:	0040      	lsls	r0, r0, #1
    6c6a:	4149      	adcs	r1, r1
    6c6c:	bf28      	it	cs
    6c6e:	f041 4100 	orrcs.w	r1, r1, #2147483648	@ 0x80000000
    6c72:	bd30      	pop	{r4, r5, pc}
    6c74:	f514 0480 	adds.w	r4, r4, #4194304	@ 0x400000
    6c78:	bf3c      	itt	cc
    6c7a:	f501 1180 	addcc.w	r1, r1, #1048576	@ 0x100000
    6c7e:	bd30      	popcc	{r4, r5, pc}
    6c80:	f001 4500 	and.w	r5, r1, #2147483648	@ 0x80000000
    6c84:	f045 41fe 	orr.w	r1, r5, #2130706432	@ 0x7f000000
    6c88:	f441 0170 	orr.w	r1, r1, #15728640	@ 0xf00000
    6c8c:	f04f 0000 	mov.w	r0, #0
    6c90:	bd30      	pop	{r4, r5, pc}
    6c92:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    6c96:	bf1a      	itte	ne
    6c98:	4619      	movne	r1, r3
    6c9a:	4610      	movne	r0, r2
    6c9c:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
    6ca0:	bf1c      	itt	ne
    6ca2:	460b      	movne	r3, r1
    6ca4:	4602      	movne	r2, r0
    6ca6:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    6caa:	bf06      	itte	eq
    6cac:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
    6cb0:	ea91 0f03 	teqeq	r1, r3
    6cb4:	f441 2100 	orrne.w	r1, r1, #524288	@ 0x80000
    6cb8:	bd30      	pop	{r4, r5, pc}
    6cba:	bf00      	nop

00006cbc <__aeabi_ui2d>:
    6cbc:	f090 0f00 	teq	r0, #0
    6cc0:	bf04      	itt	eq
    6cc2:	2100      	moveq	r1, #0
    6cc4:	4770      	bxeq	lr
    6cc6:	b530      	push	{r4, r5, lr}
    6cc8:	f44f 6480 	mov.w	r4, #1024	@ 0x400
    6ccc:	f104 0432 	add.w	r4, r4, #50	@ 0x32
    6cd0:	f04f 0500 	mov.w	r5, #0
    6cd4:	f04f 0100 	mov.w	r1, #0
    6cd8:	e750      	b.n	6b7c <__adddf3+0x138>
    6cda:	bf00      	nop

00006cdc <__aeabi_i2d>:
    6cdc:	f090 0f00 	teq	r0, #0
    6ce0:	bf04      	itt	eq
    6ce2:	2100      	moveq	r1, #0
    6ce4:	4770      	bxeq	lr
    6ce6:	b530      	push	{r4, r5, lr}
    6ce8:	f44f 6480 	mov.w	r4, #1024	@ 0x400
    6cec:	f104 0432 	add.w	r4, r4, #50	@ 0x32
    6cf0:	f010 4500 	ands.w	r5, r0, #2147483648	@ 0x80000000
    6cf4:	bf48      	it	mi
    6cf6:	4240      	negmi	r0, r0
    6cf8:	f04f 0100 	mov.w	r1, #0
    6cfc:	e73e      	b.n	6b7c <__adddf3+0x138>
    6cfe:	bf00      	nop

00006d00 <__aeabi_f2d>:
    6d00:	0042      	lsls	r2, r0, #1
    6d02:	ea4f 01e2 	mov.w	r1, r2, asr #3
    6d06:	ea4f 0131 	mov.w	r1, r1, rrx
    6d0a:	ea4f 7002 	mov.w	r0, r2, lsl #28
    6d0e:	bf1f      	itttt	ne
    6d10:	f012 437f 	andsne.w	r3, r2, #4278190080	@ 0xff000000
    6d14:	f093 4f7f 	teqne	r3, #4278190080	@ 0xff000000
    6d18:	f081 5160 	eorne.w	r1, r1, #939524096	@ 0x38000000
    6d1c:	4770      	bxne	lr
    6d1e:	f032 427f 	bics.w	r2, r2, #4278190080	@ 0xff000000
    6d22:	bf08      	it	eq
    6d24:	4770      	bxeq	lr
    6d26:	f093 4f7f 	teq	r3, #4278190080	@ 0xff000000
    6d2a:	bf04      	itt	eq
    6d2c:	f441 2100 	orreq.w	r1, r1, #524288	@ 0x80000
    6d30:	4770      	bxeq	lr
    6d32:	b530      	push	{r4, r5, lr}
    6d34:	f44f 7460 	mov.w	r4, #896	@ 0x380
    6d38:	f001 4500 	and.w	r5, r1, #2147483648	@ 0x80000000
    6d3c:	f021 4100 	bic.w	r1, r1, #2147483648	@ 0x80000000
    6d40:	e71c      	b.n	6b7c <__adddf3+0x138>
    6d42:	bf00      	nop

00006d44 <__aeabi_ul2d>:
    6d44:	ea50 0201 	orrs.w	r2, r0, r1
    6d48:	bf08      	it	eq
    6d4a:	4770      	bxeq	lr
    6d4c:	b530      	push	{r4, r5, lr}
    6d4e:	f04f 0500 	mov.w	r5, #0
    6d52:	e00a      	b.n	6d6a <__aeabi_l2d+0x16>

00006d54 <__aeabi_l2d>:
    6d54:	ea50 0201 	orrs.w	r2, r0, r1
    6d58:	bf08      	it	eq
    6d5a:	4770      	bxeq	lr
    6d5c:	b530      	push	{r4, r5, lr}
    6d5e:	f011 4500 	ands.w	r5, r1, #2147483648	@ 0x80000000
    6d62:	d502      	bpl.n	6d6a <__aeabi_l2d+0x16>
    6d64:	4240      	negs	r0, r0
    6d66:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    6d6a:	f44f 6480 	mov.w	r4, #1024	@ 0x400
    6d6e:	f104 0432 	add.w	r4, r4, #50	@ 0x32
    6d72:	ea5f 5c91 	movs.w	ip, r1, lsr #22
    6d76:	f43f aed8 	beq.w	6b2a <__adddf3+0xe6>
    6d7a:	f04f 0203 	mov.w	r2, #3
    6d7e:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    6d82:	bf18      	it	ne
    6d84:	3203      	addne	r2, #3
    6d86:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    6d8a:	bf18      	it	ne
    6d8c:	3203      	addne	r2, #3
    6d8e:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
    6d92:	f1c2 0320 	rsb	r3, r2, #32
    6d96:	fa00 fc03 	lsl.w	ip, r0, r3
    6d9a:	fa20 f002 	lsr.w	r0, r0, r2
    6d9e:	fa01 fe03 	lsl.w	lr, r1, r3
    6da2:	ea40 000e 	orr.w	r0, r0, lr
    6da6:	fa21 f102 	lsr.w	r1, r1, r2
    6daa:	4414      	add	r4, r2
    6dac:	e6bd      	b.n	6b2a <__adddf3+0xe6>
    6dae:	bf00      	nop

00006db0 <__aeabi_dmul>:
    6db0:	b570      	push	{r4, r5, r6, lr}
    6db2:	f04f 0cff 	mov.w	ip, #255	@ 0xff
    6db6:	f44c 6ce0 	orr.w	ip, ip, #1792	@ 0x700
    6dba:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    6dbe:	bf1d      	ittte	ne
    6dc0:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    6dc4:	ea94 0f0c 	teqne	r4, ip
    6dc8:	ea95 0f0c 	teqne	r5, ip
    6dcc:	f000 f8de 	bleq	6f8c <__aeabi_dmul+0x1dc>
    6dd0:	442c      	add	r4, r5
    6dd2:	ea81 0603 	eor.w	r6, r1, r3
    6dd6:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
    6dda:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
    6dde:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
    6de2:	bf18      	it	ne
    6de4:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
    6de8:	f441 1180 	orr.w	r1, r1, #1048576	@ 0x100000
    6dec:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
    6df0:	d038      	beq.n	6e64 <__aeabi_dmul+0xb4>
    6df2:	fba0 ce02 	umull	ip, lr, r0, r2
    6df6:	f04f 0500 	mov.w	r5, #0
    6dfa:	fbe1 e502 	umlal	lr, r5, r1, r2
    6dfe:	f006 4200 	and.w	r2, r6, #2147483648	@ 0x80000000
    6e02:	fbe0 e503 	umlal	lr, r5, r0, r3
    6e06:	f04f 0600 	mov.w	r6, #0
    6e0a:	fbe1 5603 	umlal	r5, r6, r1, r3
    6e0e:	f09c 0f00 	teq	ip, #0
    6e12:	bf18      	it	ne
    6e14:	f04e 0e01 	orrne.w	lr, lr, #1
    6e18:	f1a4 04ff 	sub.w	r4, r4, #255	@ 0xff
    6e1c:	f5b6 7f00 	cmp.w	r6, #512	@ 0x200
    6e20:	f564 7440 	sbc.w	r4, r4, #768	@ 0x300
    6e24:	d204      	bcs.n	6e30 <__aeabi_dmul+0x80>
    6e26:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
    6e2a:	416d      	adcs	r5, r5
    6e2c:	eb46 0606 	adc.w	r6, r6, r6
    6e30:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
    6e34:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
    6e38:	ea4f 20c5 	mov.w	r0, r5, lsl #11
    6e3c:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
    6e40:	ea4f 2ece 	mov.w	lr, lr, lsl #11
    6e44:	f1b4 0cfd 	subs.w	ip, r4, #253	@ 0xfd
    6e48:	bf88      	it	hi
    6e4a:	f5bc 6fe0 	cmphi.w	ip, #1792	@ 0x700
    6e4e:	d81e      	bhi.n	6e8e <__aeabi_dmul+0xde>
    6e50:	f1be 4f00 	cmp.w	lr, #2147483648	@ 0x80000000
    6e54:	bf08      	it	eq
    6e56:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
    6e5a:	f150 0000 	adcs.w	r0, r0, #0
    6e5e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    6e62:	bd70      	pop	{r4, r5, r6, pc}
    6e64:	f006 4600 	and.w	r6, r6, #2147483648	@ 0x80000000
    6e68:	ea46 0101 	orr.w	r1, r6, r1
    6e6c:	ea40 0002 	orr.w	r0, r0, r2
    6e70:	ea81 0103 	eor.w	r1, r1, r3
    6e74:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
    6e78:	bfc2      	ittt	gt
    6e7a:	ebd4 050c 	rsbsgt	r5, r4, ip
    6e7e:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    6e82:	bd70      	popgt	{r4, r5, r6, pc}
    6e84:	f441 1180 	orr.w	r1, r1, #1048576	@ 0x100000
    6e88:	f04f 0e00 	mov.w	lr, #0
    6e8c:	3c01      	subs	r4, #1
    6e8e:	f300 80ab 	bgt.w	6fe8 <__aeabi_dmul+0x238>
    6e92:	f114 0f36 	cmn.w	r4, #54	@ 0x36
    6e96:	bfde      	ittt	le
    6e98:	2000      	movle	r0, #0
    6e9a:	f001 4100 	andle.w	r1, r1, #2147483648	@ 0x80000000
    6e9e:	bd70      	pople	{r4, r5, r6, pc}
    6ea0:	f1c4 0400 	rsb	r4, r4, #0
    6ea4:	3c20      	subs	r4, #32
    6ea6:	da35      	bge.n	6f14 <__aeabi_dmul+0x164>
    6ea8:	340c      	adds	r4, #12
    6eaa:	dc1b      	bgt.n	6ee4 <__aeabi_dmul+0x134>
    6eac:	f104 0414 	add.w	r4, r4, #20
    6eb0:	f1c4 0520 	rsb	r5, r4, #32
    6eb4:	fa00 f305 	lsl.w	r3, r0, r5
    6eb8:	fa20 f004 	lsr.w	r0, r0, r4
    6ebc:	fa01 f205 	lsl.w	r2, r1, r5
    6ec0:	ea40 0002 	orr.w	r0, r0, r2
    6ec4:	f001 4200 	and.w	r2, r1, #2147483648	@ 0x80000000
    6ec8:	f021 4100 	bic.w	r1, r1, #2147483648	@ 0x80000000
    6ecc:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    6ed0:	fa21 f604 	lsr.w	r6, r1, r4
    6ed4:	eb42 0106 	adc.w	r1, r2, r6
    6ed8:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6edc:	bf08      	it	eq
    6ede:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    6ee2:	bd70      	pop	{r4, r5, r6, pc}
    6ee4:	f1c4 040c 	rsb	r4, r4, #12
    6ee8:	f1c4 0520 	rsb	r5, r4, #32
    6eec:	fa00 f304 	lsl.w	r3, r0, r4
    6ef0:	fa20 f005 	lsr.w	r0, r0, r5
    6ef4:	fa01 f204 	lsl.w	r2, r1, r4
    6ef8:	ea40 0002 	orr.w	r0, r0, r2
    6efc:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6f00:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    6f04:	f141 0100 	adc.w	r1, r1, #0
    6f08:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6f0c:	bf08      	it	eq
    6f0e:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    6f12:	bd70      	pop	{r4, r5, r6, pc}
    6f14:	f1c4 0520 	rsb	r5, r4, #32
    6f18:	fa00 f205 	lsl.w	r2, r0, r5
    6f1c:	ea4e 0e02 	orr.w	lr, lr, r2
    6f20:	fa20 f304 	lsr.w	r3, r0, r4
    6f24:	fa01 f205 	lsl.w	r2, r1, r5
    6f28:	ea43 0302 	orr.w	r3, r3, r2
    6f2c:	fa21 f004 	lsr.w	r0, r1, r4
    6f30:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6f34:	fa21 f204 	lsr.w	r2, r1, r4
    6f38:	ea20 0002 	bic.w	r0, r0, r2
    6f3c:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
    6f40:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    6f44:	bf08      	it	eq
    6f46:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    6f4a:	bd70      	pop	{r4, r5, r6, pc}
    6f4c:	f094 0f00 	teq	r4, #0
    6f50:	d10f      	bne.n	6f72 <__aeabi_dmul+0x1c2>
    6f52:	f001 4600 	and.w	r6, r1, #2147483648	@ 0x80000000
    6f56:	0040      	lsls	r0, r0, #1
    6f58:	eb41 0101 	adc.w	r1, r1, r1
    6f5c:	f411 1f80 	tst.w	r1, #1048576	@ 0x100000
    6f60:	bf08      	it	eq
    6f62:	3c01      	subeq	r4, #1
    6f64:	d0f7      	beq.n	6f56 <__aeabi_dmul+0x1a6>
    6f66:	ea41 0106 	orr.w	r1, r1, r6
    6f6a:	f095 0f00 	teq	r5, #0
    6f6e:	bf18      	it	ne
    6f70:	4770      	bxne	lr
    6f72:	f003 4600 	and.w	r6, r3, #2147483648	@ 0x80000000
    6f76:	0052      	lsls	r2, r2, #1
    6f78:	eb43 0303 	adc.w	r3, r3, r3
    6f7c:	f413 1f80 	tst.w	r3, #1048576	@ 0x100000
    6f80:	bf08      	it	eq
    6f82:	3d01      	subeq	r5, #1
    6f84:	d0f7      	beq.n	6f76 <__aeabi_dmul+0x1c6>
    6f86:	ea43 0306 	orr.w	r3, r3, r6
    6f8a:	4770      	bx	lr
    6f8c:	ea94 0f0c 	teq	r4, ip
    6f90:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    6f94:	bf18      	it	ne
    6f96:	ea95 0f0c 	teqne	r5, ip
    6f9a:	d00c      	beq.n	6fb6 <__aeabi_dmul+0x206>
    6f9c:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    6fa0:	bf18      	it	ne
    6fa2:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    6fa6:	d1d1      	bne.n	6f4c <__aeabi_dmul+0x19c>
    6fa8:	ea81 0103 	eor.w	r1, r1, r3
    6fac:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6fb0:	f04f 0000 	mov.w	r0, #0
    6fb4:	bd70      	pop	{r4, r5, r6, pc}
    6fb6:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    6fba:	bf06      	itte	eq
    6fbc:	4610      	moveq	r0, r2
    6fbe:	4619      	moveq	r1, r3
    6fc0:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    6fc4:	d019      	beq.n	6ffa <__aeabi_dmul+0x24a>
    6fc6:	ea94 0f0c 	teq	r4, ip
    6fca:	d102      	bne.n	6fd2 <__aeabi_dmul+0x222>
    6fcc:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
    6fd0:	d113      	bne.n	6ffa <__aeabi_dmul+0x24a>
    6fd2:	ea95 0f0c 	teq	r5, ip
    6fd6:	d105      	bne.n	6fe4 <__aeabi_dmul+0x234>
    6fd8:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
    6fdc:	bf1c      	itt	ne
    6fde:	4610      	movne	r0, r2
    6fe0:	4619      	movne	r1, r3
    6fe2:	d10a      	bne.n	6ffa <__aeabi_dmul+0x24a>
    6fe4:	ea81 0103 	eor.w	r1, r1, r3
    6fe8:	f001 4100 	and.w	r1, r1, #2147483648	@ 0x80000000
    6fec:	f041 41fe 	orr.w	r1, r1, #2130706432	@ 0x7f000000
    6ff0:	f441 0170 	orr.w	r1, r1, #15728640	@ 0xf00000
    6ff4:	f04f 0000 	mov.w	r0, #0
    6ff8:	bd70      	pop	{r4, r5, r6, pc}
    6ffa:	f041 41fe 	orr.w	r1, r1, #2130706432	@ 0x7f000000
    6ffe:	f441 0178 	orr.w	r1, r1, #16252928	@ 0xf80000
    7002:	bd70      	pop	{r4, r5, r6, pc}

00007004 <__aeabi_ddiv>:
    7004:	b570      	push	{r4, r5, r6, lr}
    7006:	f04f 0cff 	mov.w	ip, #255	@ 0xff
    700a:	f44c 6ce0 	orr.w	ip, ip, #1792	@ 0x700
    700e:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    7012:	bf1d      	ittte	ne
    7014:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    7018:	ea94 0f0c 	teqne	r4, ip
    701c:	ea95 0f0c 	teqne	r5, ip
    7020:	f000 f8a7 	bleq	7172 <__aeabi_ddiv+0x16e>
    7024:	eba4 0405 	sub.w	r4, r4, r5
    7028:	ea81 0e03 	eor.w	lr, r1, r3
    702c:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    7030:	ea4f 3101 	mov.w	r1, r1, lsl #12
    7034:	f000 8088 	beq.w	7148 <__aeabi_ddiv+0x144>
    7038:	ea4f 3303 	mov.w	r3, r3, lsl #12
    703c:	f04f 5580 	mov.w	r5, #268435456	@ 0x10000000
    7040:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
    7044:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
    7048:	ea4f 2202 	mov.w	r2, r2, lsl #8
    704c:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
    7050:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
    7054:	ea4f 2600 	mov.w	r6, r0, lsl #8
    7058:	f00e 4100 	and.w	r1, lr, #2147483648	@ 0x80000000
    705c:	429d      	cmp	r5, r3
    705e:	bf08      	it	eq
    7060:	4296      	cmpeq	r6, r2
    7062:	f144 04fd 	adc.w	r4, r4, #253	@ 0xfd
    7066:	f504 7440 	add.w	r4, r4, #768	@ 0x300
    706a:	d202      	bcs.n	7072 <__aeabi_ddiv+0x6e>
    706c:	085b      	lsrs	r3, r3, #1
    706e:	ea4f 0232 	mov.w	r2, r2, rrx
    7072:	1ab6      	subs	r6, r6, r2
    7074:	eb65 0503 	sbc.w	r5, r5, r3
    7078:	085b      	lsrs	r3, r3, #1
    707a:	ea4f 0232 	mov.w	r2, r2, rrx
    707e:	f44f 1080 	mov.w	r0, #1048576	@ 0x100000
    7082:	f44f 2c00 	mov.w	ip, #524288	@ 0x80000
    7086:	ebb6 0e02 	subs.w	lr, r6, r2
    708a:	eb75 0e03 	sbcs.w	lr, r5, r3
    708e:	bf22      	ittt	cs
    7090:	1ab6      	subcs	r6, r6, r2
    7092:	4675      	movcs	r5, lr
    7094:	ea40 000c 	orrcs.w	r0, r0, ip
    7098:	085b      	lsrs	r3, r3, #1
    709a:	ea4f 0232 	mov.w	r2, r2, rrx
    709e:	ebb6 0e02 	subs.w	lr, r6, r2
    70a2:	eb75 0e03 	sbcs.w	lr, r5, r3
    70a6:	bf22      	ittt	cs
    70a8:	1ab6      	subcs	r6, r6, r2
    70aa:	4675      	movcs	r5, lr
    70ac:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    70b0:	085b      	lsrs	r3, r3, #1
    70b2:	ea4f 0232 	mov.w	r2, r2, rrx
    70b6:	ebb6 0e02 	subs.w	lr, r6, r2
    70ba:	eb75 0e03 	sbcs.w	lr, r5, r3
    70be:	bf22      	ittt	cs
    70c0:	1ab6      	subcs	r6, r6, r2
    70c2:	4675      	movcs	r5, lr
    70c4:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    70c8:	085b      	lsrs	r3, r3, #1
    70ca:	ea4f 0232 	mov.w	r2, r2, rrx
    70ce:	ebb6 0e02 	subs.w	lr, r6, r2
    70d2:	eb75 0e03 	sbcs.w	lr, r5, r3
    70d6:	bf22      	ittt	cs
    70d8:	1ab6      	subcs	r6, r6, r2
    70da:	4675      	movcs	r5, lr
    70dc:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    70e0:	ea55 0e06 	orrs.w	lr, r5, r6
    70e4:	d018      	beq.n	7118 <__aeabi_ddiv+0x114>
    70e6:	ea4f 1505 	mov.w	r5, r5, lsl #4
    70ea:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
    70ee:	ea4f 1606 	mov.w	r6, r6, lsl #4
    70f2:	ea4f 03c3 	mov.w	r3, r3, lsl #3
    70f6:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
    70fa:	ea4f 02c2 	mov.w	r2, r2, lsl #3
    70fe:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
    7102:	d1c0      	bne.n	7086 <__aeabi_ddiv+0x82>
    7104:	f411 1f80 	tst.w	r1, #1048576	@ 0x100000
    7108:	d10b      	bne.n	7122 <__aeabi_ddiv+0x11e>
    710a:	ea41 0100 	orr.w	r1, r1, r0
    710e:	f04f 0000 	mov.w	r0, #0
    7112:	f04f 4c00 	mov.w	ip, #2147483648	@ 0x80000000
    7116:	e7b6      	b.n	7086 <__aeabi_ddiv+0x82>
    7118:	f411 1f80 	tst.w	r1, #1048576	@ 0x100000
    711c:	bf04      	itt	eq
    711e:	4301      	orreq	r1, r0
    7120:	2000      	moveq	r0, #0
    7122:	f1b4 0cfd 	subs.w	ip, r4, #253	@ 0xfd
    7126:	bf88      	it	hi
    7128:	f5bc 6fe0 	cmphi.w	ip, #1792	@ 0x700
    712c:	f63f aeaf 	bhi.w	6e8e <__aeabi_dmul+0xde>
    7130:	ebb5 0c03 	subs.w	ip, r5, r3
    7134:	bf04      	itt	eq
    7136:	ebb6 0c02 	subseq.w	ip, r6, r2
    713a:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    713e:	f150 0000 	adcs.w	r0, r0, #0
    7142:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    7146:	bd70      	pop	{r4, r5, r6, pc}
    7148:	f00e 4e00 	and.w	lr, lr, #2147483648	@ 0x80000000
    714c:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
    7150:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
    7154:	bfc2      	ittt	gt
    7156:	ebd4 050c 	rsbsgt	r5, r4, ip
    715a:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    715e:	bd70      	popgt	{r4, r5, r6, pc}
    7160:	f441 1180 	orr.w	r1, r1, #1048576	@ 0x100000
    7164:	f04f 0e00 	mov.w	lr, #0
    7168:	3c01      	subs	r4, #1
    716a:	e690      	b.n	6e8e <__aeabi_dmul+0xde>
    716c:	ea45 0e06 	orr.w	lr, r5, r6
    7170:	e68d      	b.n	6e8e <__aeabi_dmul+0xde>
    7172:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    7176:	ea94 0f0c 	teq	r4, ip
    717a:	bf08      	it	eq
    717c:	ea95 0f0c 	teqeq	r5, ip
    7180:	f43f af3b 	beq.w	6ffa <__aeabi_dmul+0x24a>
    7184:	ea94 0f0c 	teq	r4, ip
    7188:	d10a      	bne.n	71a0 <__aeabi_ddiv+0x19c>
    718a:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    718e:	f47f af34 	bne.w	6ffa <__aeabi_dmul+0x24a>
    7192:	ea95 0f0c 	teq	r5, ip
    7196:	f47f af25 	bne.w	6fe4 <__aeabi_dmul+0x234>
    719a:	4610      	mov	r0, r2
    719c:	4619      	mov	r1, r3
    719e:	e72c      	b.n	6ffa <__aeabi_dmul+0x24a>
    71a0:	ea95 0f0c 	teq	r5, ip
    71a4:	d106      	bne.n	71b4 <__aeabi_ddiv+0x1b0>
    71a6:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    71aa:	f43f aefd 	beq.w	6fa8 <__aeabi_dmul+0x1f8>
    71ae:	4610      	mov	r0, r2
    71b0:	4619      	mov	r1, r3
    71b2:	e722      	b.n	6ffa <__aeabi_dmul+0x24a>
    71b4:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    71b8:	bf18      	it	ne
    71ba:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    71be:	f47f aec5 	bne.w	6f4c <__aeabi_dmul+0x19c>
    71c2:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
    71c6:	f47f af0d 	bne.w	6fe4 <__aeabi_dmul+0x234>
    71ca:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
    71ce:	f47f aeeb 	bne.w	6fa8 <__aeabi_dmul+0x1f8>
    71d2:	e712      	b.n	6ffa <__aeabi_dmul+0x24a>

000071d4 <__gedf2>:
    71d4:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
    71d8:	e006      	b.n	71e8 <__cmpdf2+0x4>
    71da:	bf00      	nop

000071dc <__ledf2>:
    71dc:	f04f 0c01 	mov.w	ip, #1
    71e0:	e002      	b.n	71e8 <__cmpdf2+0x4>
    71e2:	bf00      	nop

000071e4 <__cmpdf2>:
    71e4:	f04f 0c01 	mov.w	ip, #1
    71e8:	f84d cd04 	str.w	ip, [sp, #-4]!
    71ec:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    71f0:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    71f4:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    71f8:	bf18      	it	ne
    71fa:	ea7f 5c6c 	mvnsne.w	ip, ip, asr #21
    71fe:	d01b      	beq.n	7238 <__cmpdf2+0x54>
    7200:	b001      	add	sp, #4
    7202:	ea50 0c41 	orrs.w	ip, r0, r1, lsl #1
    7206:	bf0c      	ite	eq
    7208:	ea52 0c43 	orrseq.w	ip, r2, r3, lsl #1
    720c:	ea91 0f03 	teqne	r1, r3
    7210:	bf02      	ittt	eq
    7212:	ea90 0f02 	teqeq	r0, r2
    7216:	2000      	moveq	r0, #0
    7218:	4770      	bxeq	lr
    721a:	f110 0f00 	cmn.w	r0, #0
    721e:	ea91 0f03 	teq	r1, r3
    7222:	bf58      	it	pl
    7224:	4299      	cmppl	r1, r3
    7226:	bf08      	it	eq
    7228:	4290      	cmpeq	r0, r2
    722a:	bf2c      	ite	cs
    722c:	17d8      	asrcs	r0, r3, #31
    722e:	ea6f 70e3 	mvncc.w	r0, r3, asr #31
    7232:	f040 0001 	orr.w	r0, r0, #1
    7236:	4770      	bx	lr
    7238:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    723c:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    7240:	d102      	bne.n	7248 <__cmpdf2+0x64>
    7242:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
    7246:	d107      	bne.n	7258 <__cmpdf2+0x74>
    7248:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    724c:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    7250:	d1d6      	bne.n	7200 <__cmpdf2+0x1c>
    7252:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
    7256:	d0d3      	beq.n	7200 <__cmpdf2+0x1c>
    7258:	f85d 0b04 	ldr.w	r0, [sp], #4
    725c:	4770      	bx	lr
    725e:	bf00      	nop

00007260 <__aeabi_cdrcmple>:
    7260:	4684      	mov	ip, r0
    7262:	4610      	mov	r0, r2
    7264:	4662      	mov	r2, ip
    7266:	468c      	mov	ip, r1
    7268:	4619      	mov	r1, r3
    726a:	4663      	mov	r3, ip
    726c:	e000      	b.n	7270 <__aeabi_cdcmpeq>
    726e:	bf00      	nop

00007270 <__aeabi_cdcmpeq>:
    7270:	b501      	push	{r0, lr}
    7272:	f7ff ffb7 	bl	71e4 <__cmpdf2>
    7276:	2800      	cmp	r0, #0
    7278:	bf48      	it	mi
    727a:	f110 0f00 	cmnmi.w	r0, #0
    727e:	bd01      	pop	{r0, pc}

00007280 <__aeabi_dcmpeq>:
    7280:	f84d ed08 	str.w	lr, [sp, #-8]!
    7284:	f7ff fff4 	bl	7270 <__aeabi_cdcmpeq>
    7288:	bf0c      	ite	eq
    728a:	2001      	moveq	r0, #1
    728c:	2000      	movne	r0, #0
    728e:	f85d fb08 	ldr.w	pc, [sp], #8
    7292:	bf00      	nop

00007294 <__aeabi_dcmplt>:
    7294:	f84d ed08 	str.w	lr, [sp, #-8]!
    7298:	f7ff ffea 	bl	7270 <__aeabi_cdcmpeq>
    729c:	bf34      	ite	cc
    729e:	2001      	movcc	r0, #1
    72a0:	2000      	movcs	r0, #0
    72a2:	f85d fb08 	ldr.w	pc, [sp], #8
    72a6:	bf00      	nop

000072a8 <__aeabi_dcmple>:
    72a8:	f84d ed08 	str.w	lr, [sp, #-8]!
    72ac:	f7ff ffe0 	bl	7270 <__aeabi_cdcmpeq>
    72b0:	bf94      	ite	ls
    72b2:	2001      	movls	r0, #1
    72b4:	2000      	movhi	r0, #0
    72b6:	f85d fb08 	ldr.w	pc, [sp], #8
    72ba:	bf00      	nop

000072bc <__aeabi_dcmpge>:
    72bc:	f84d ed08 	str.w	lr, [sp, #-8]!
    72c0:	f7ff ffce 	bl	7260 <__aeabi_cdrcmple>
    72c4:	bf94      	ite	ls
    72c6:	2001      	movls	r0, #1
    72c8:	2000      	movhi	r0, #0
    72ca:	f85d fb08 	ldr.w	pc, [sp], #8
    72ce:	bf00      	nop

000072d0 <__aeabi_dcmpgt>:
    72d0:	f84d ed08 	str.w	lr, [sp, #-8]!
    72d4:	f7ff ffc4 	bl	7260 <__aeabi_cdrcmple>
    72d8:	bf34      	ite	cc
    72da:	2001      	movcc	r0, #1
    72dc:	2000      	movcs	r0, #0
    72de:	f85d fb08 	ldr.w	pc, [sp], #8
    72e2:	bf00      	nop

000072e4 <__aeabi_dcmpun>:
    72e4:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    72e8:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    72ec:	d102      	bne.n	72f4 <__aeabi_dcmpun+0x10>
    72ee:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
    72f2:	d10a      	bne.n	730a <__aeabi_dcmpun+0x26>
    72f4:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    72f8:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    72fc:	d102      	bne.n	7304 <__aeabi_dcmpun+0x20>
    72fe:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
    7302:	d102      	bne.n	730a <__aeabi_dcmpun+0x26>
    7304:	f04f 0000 	mov.w	r0, #0
    7308:	4770      	bx	lr
    730a:	f04f 0001 	mov.w	r0, #1
    730e:	4770      	bx	lr

00007310 <__aeabi_d2iz>:
    7310:	ea4f 0241 	mov.w	r2, r1, lsl #1
    7314:	f512 1200 	adds.w	r2, r2, #2097152	@ 0x200000
    7318:	d215      	bcs.n	7346 <__aeabi_d2iz+0x36>
    731a:	d511      	bpl.n	7340 <__aeabi_d2iz+0x30>
    731c:	f46f 7378 	mvn.w	r3, #992	@ 0x3e0
    7320:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
    7324:	d912      	bls.n	734c <__aeabi_d2iz+0x3c>
    7326:	ea4f 23c1 	mov.w	r3, r1, lsl #11
    732a:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
    732e:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
    7332:	f011 4f00 	tst.w	r1, #2147483648	@ 0x80000000
    7336:	fa23 f002 	lsr.w	r0, r3, r2
    733a:	bf18      	it	ne
    733c:	4240      	negne	r0, r0
    733e:	4770      	bx	lr
    7340:	f04f 0000 	mov.w	r0, #0
    7344:	4770      	bx	lr
    7346:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
    734a:	d105      	bne.n	7358 <__aeabi_d2iz+0x48>
    734c:	f011 4000 	ands.w	r0, r1, #2147483648	@ 0x80000000
    7350:	bf08      	it	eq
    7352:	f06f 4000 	mvneq.w	r0, #2147483648	@ 0x80000000
    7356:	4770      	bx	lr
    7358:	f04f 0000 	mov.w	r0, #0
    735c:	4770      	bx	lr
    735e:	bf00      	nop

00007360 <_exit>:
    7360:	e7fe      	b.n	7360 <_exit>
    7362:	bf00      	nop

00007364 <_init>:
    7364:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    7366:	bf00      	nop
    7368:	bcf8      	pop	{r3, r4, r5, r6, r7}
    736a:	bc08      	pop	{r3}
    736c:	469e      	mov	lr, r3
    736e:	4770      	bx	lr

00007370 <_fini>:
    7370:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    7372:	bf00      	nop
    7374:	bcf8      	pop	{r3, r4, r5, r6, r7}
    7376:	bc08      	pop	{r3}
    7378:	469e      	mov	lr, r3
    737a:	4770      	bx	lr

0000737c <all_implied_fbits>:
    737c:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    738c:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    739c:	410b 0000 6552 7573 746c 3d20 2520 0a64     .A..Result = %d.
    73ac:	0000 0000                                   ....

000073b0 <REPORT_EXCEPTION>:
    73b0:	0018 0000                                   ....

000073b4 <ApplicationExit>:
    73b4:	0026 0002 4d4e 5f49 6148 646e 656c 0072     &...NMI_Handler.
    73c4:	6148 6472 6146 6c75 5f74 6148 646e 656c     HardFault_Handle
    73d4:	0072 0000 654d 4d6d 6e61 6761 5f65 6148     r...MemManage_Ha
    73e4:	646e 656c 0072 0000 7542 4673 7561 746c     ndler...BusFault
    73f4:	485f 6e61 6c64 7265 0000 0000 7355 6761     _Handler....Usag
    7404:	4665 7561 746c 485f 6e61 6c64 7265 0000     eFault_Handler..
    7414:	5653 5f43 6148 646e 656c 0072 6544 7562     SVC_Handler.Debu
    7424:	4d67 6e6f 485f 6e61 6c64 7265 0000 0000     gMon_Handler....
    7434:	6550 646e 5653 485f 6e61 6c64 7265 0000     PendSV_Handler..

00007444 <stackpattern>:
    7444:	beef dead 4e49 0046 6e69 0066 414e 004e     ....INF.inf.NAN.
    7454:	616e 006e 3130 3332 3534 3736 3938 4241     nan.0123456789AB
    7464:	4443 4645 0000 0000 3130 3332 3534 3736     CDEF....01234567
    7474:	3938 6261 6463 6665 0000 0000 6e28 6c75     89abcdef....(nul
    7484:	296c 0000 0030 0000 6e49 6966 696e 7974     l)..0...Infinity
    7494:	0000 0000 614e 004e 6142 6c6c 636f 7320     ....NaN.Balloc s
    74a4:	6375 6563 6465 6465 0000 0000 2e2e 2e2f     ucceeded....../.
    74b4:	2f2e 2e2e 2e2f 2f2e 2e2e 2e2f 2f2e 656e     ./../../../../ne
    74c4:	6c77 6269 6c2f 6269 2f63 7473 6c64 6269     wlib/libc/stdlib
    74d4:	642f 6f74 2e61 0063 202c 7566 636e 6974     /dtoa.c., functi
    74e4:	6e6f 203a 0000 0000 7361 6573 7472 6f69     on: ....assertio
    74f4:	206e 2522 2273 6620 6961 656c 3a64 6620     n "%s" failed: f
    7504:	6c69 2065 2522 2273 202c 696c 656e 2520     ile "%s", line %
    7514:	2564 2573 0a73 0000 2e2e 2e2f 2f2e 2e2e     d%s%s...../../..
    7524:	2e2f 2f2e 2e2e 2e2f 2f2e 656e 6c77 6269     /../../../newlib
    7534:	6c2f 6269 2f63 7473 6c64 6269 6d2f 7270     /libc/stdlib/mpr
    7544:	6365 632e 0000 0000 0043 0000 4f50 4953     ec.c....C...POSI
    7554:	0058 0000 002e 0000                         X.......

0000755c <blanks.1>:
    755c:	2020 2020 2020 2020 2020 2020 2020 2020                     

0000756c <zeroes.0>:
    756c:	3030 3030 3030 3030 3030 3030 3030 3030     0000000000000000
    757c:	0000 0000                                   ....

00007580 <p05.0>:
    7580:	0005 0000 0019 0000 007d 0000 0000 0000     ........}.......

00007590 <__mprec_tens>:
    7590:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
    75a0:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
    75b0:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
    75c0:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
    75d0:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
    75e0:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
    75f0:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
    7600:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
    7610:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
    7620:	c800 674e c16d 43ab 3d00 6091 58e4 43e1     ..Ngm..C.=.`.X.C
    7630:	8c40 78b5 af1d 4415 ef50 d6e2 1ae4 444b     @..x...DP.....KD
    7640:	d592 064d f0cf 4480 4af6 c7e1 2d02 44b5     ..M....D.J...-.D
    7650:	9db4 79d9 7843 44ea                         ...yCx.D

00007658 <__mprec_tinytens>:
    7658:	89bc 97d8 d2b2 3c9c a733 d5a8 f623 3949     .......<3...#.I9
    7668:	a73d 44f4 0ffd 32a5 979d cf8c ba08 255b     =..D...2......[%
    7678:	6f43 64ac 0628 0ac8                         Co.d(...

00007680 <__mprec_bigtens>:
    7680:	8000 37e0 c379 4341 6e17 b505 b8b5 4693     ...7y.AC.n.....F
    7690:	f9f5 e93f 4f03 4d38 1d32 f930 7748 5a82     ..?..O8M2.0.Hw.Z
    76a0:	bf3c 7f73 4fdd 7515                         <.s..O.u

000076a8 <_ctype_>:
    76a8:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
    76b8:	2020 2020 2020 2020 2020 2020 2020 2020                     
    76c8:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
    76d8:	0410 0404 0404 0404 0404 1004 1010 1010     ................
    76e8:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
    76f8:	0101 0101 0101 0101 0101 0101 1010 1010     ................
    7708:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
    7718:	0202 0202 0202 0202 0202 0202 1010 1010     ................
    7728:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...

000077ac <blanks.1>:
    77ac:	2020 2020 2020 2020 2020 2020 2020 2020                     

000077bc <zeroes.0>:
    77bc:	3030 3030 3030 3030 3030 3030 3030 3030     0000000000000000

000077cc <all_implied_fbits>:
    77cc:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    77dc:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    77ec:	410b 0000                                   .A..

000077f0 <__EH_FRAME_BEGIN__>:
    77f0:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
    7800:	0c1b 000d 0038 0000 0018 0000 a684 ffff     ....8...........
    7810:	009e 0000 5100 100e 0484 0385 0286 0187     .....Q..........
    7820:	c75b c5c6 0ec4 4c00 420a 0a0b 0b42 100e     [......L.B..B...
    7830:	0484 0385 0286 0187 c751 c5c6 0ec4 0000     ........Q.......
    7840:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
    7850:	0c1b 000d 0014 0000 0018 0000 bc6c ffff     ............l...
    7860:	0134 0000 0200 0a71 0b43 0000 0010 0000     4.....q.C.......
    7870:	0000 0000 7a01 0052 7c02 010e 0c1b 000d     .....zR..|......
    7880:	001c 0000 0018 0000 c078 ffff 00d8 0000     ........x.......
    7890:	4100 080e 0185 0284 4902 4a0a c4c5 0b41     .A.......I.J..A.

000078a0 <__FRAME_END__>:
    78a0:	0000 0000                                   ....
