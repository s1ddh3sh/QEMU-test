
build/tests_kyber/pack_sk/pack_sk.elf:     file format elf32-littlearm


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
      d0:	00004ed8 	.word	0x00004ed8
      d4:	00004ed8 	.word	0x00004ed8
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
      f4:	00004ed8 	.word	0x00004ed8
      f8:	00004ed8 	.word	0x00004ed8
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
     11c:	00004ed8 	.word	0x00004ed8
     120:	00000000 	.word	0x00000000
     124:	0000485c 	.word	0x0000485c

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
     140:	00004edc 	.word	0x00004edc
     144:	0000485c 	.word	0x0000485c

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
     16a:	f003 f877 	bl	325c <memset>
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
     188:	f003 f9c8 	bl	351c <atexit>
     18c:	f003 f990 	bl	34b0 <__libc_init_array>
     190:	0020      	movs	r0, r4
     192:	0029      	movs	r1, r5
     194:	f001 fd3e 	bl	1c14 <main>
     198:	f003 f9b2 	bl	3500 <exit>
     19c:	00080000 	.word	0x00080000
	...
     1a8:	20400000 	.word	0x20400000
     1ac:	00004ed8 	.word	0x00004ed8
     1b0:	00005210 	.word	0x00005210
     1b4:	000037a9 	.word	0x000037a9

000001b8 <pack_sk>:
     1b8:	b5b0      	push	{r4, r5, r7, lr}
     1ba:	f1a1 0e02 	sub.w	lr, r1, #2
     1be:	1e83      	subs	r3, r0, #2
     1c0:	f04f 0c80 	mov.w	ip, #128	@ 0x80
     1c4:	f93e 2f04 	ldrsh.w	r2, [lr, #4]!
     1c8:	f93e 4c02 	ldrsh.w	r4, [lr, #-2]
     1cc:	2c00      	cmp	r4, #0
     1ce:	bf48      	it	mi
     1d0:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     1d4:	2a00      	cmp	r2, #0
     1d6:	bf48      	it	mi
     1d8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     1dc:	0115      	lsls	r5, r2, #4
     1de:	ea45 2514 	orr.w	r5, r5, r4, lsr #8
     1e2:	f803 5f03 	strb.w	r5, [r3, #3]!
     1e6:	0912      	lsrs	r2, r2, #4
     1e8:	f1bc 0c01 	subs.w	ip, ip, #1
     1ec:	f803 4c01 	strb.w	r4, [r3, #-1]
     1f0:	705a      	strb	r2, [r3, #1]
     1f2:	d1e7      	bne.n	1c4 <pack_sk+0xc>
     1f4:	f200 1e7f 	addw	lr, r0, #383	@ 0x17f
     1f8:	f201 2c02 	addw	ip, r1, #514	@ 0x202
     1fc:	2300      	movs	r3, #0
     1fe:	bf00      	nop
     200:	eb01 0583 	add.w	r5, r1, r3, lsl #2
     204:	f9b5 5200 	ldrsh.w	r5, [r5, #512]	@ 0x200
     208:	f93c 4023 	ldrsh.w	r4, [ip, r3, lsl #2]
     20c:	2d00      	cmp	r5, #0
     20e:	eb03 0243 	add.w	r2, r3, r3, lsl #1
     212:	bf48      	it	mi
     214:	f605 5501 	addwmi	r5, r5, #3329	@ 0xd01
     218:	2c00      	cmp	r4, #0
     21a:	bf48      	it	mi
     21c:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     220:	4402      	add	r2, r0
     222:	f882 5180 	strb.w	r5, [r2, #384]	@ 0x180
     226:	0122      	lsls	r2, r4, #4
     228:	0924      	lsrs	r4, r4, #4
     22a:	3301      	adds	r3, #1
     22c:	ea42 2215 	orr.w	r2, r2, r5, lsr #8
     230:	f80e 4f03 	strb.w	r4, [lr, #3]!
     234:	2b80      	cmp	r3, #128	@ 0x80
     236:	f80e 2c01 	strb.w	r2, [lr, #-1]
     23a:	d1e1      	bne.n	200 <pack_sk+0x48>
     23c:	f200 2eff 	addw	lr, r0, #767	@ 0x2ff
     240:	f201 4c02 	addw	ip, r1, #1026	@ 0x402
     244:	2300      	movs	r3, #0
     246:	bf00      	nop
     248:	eb01 0583 	add.w	r5, r1, r3, lsl #2
     24c:	f9b5 5400 	ldrsh.w	r5, [r5, #1024]	@ 0x400
     250:	f93c 4023 	ldrsh.w	r4, [ip, r3, lsl #2]
     254:	2d00      	cmp	r5, #0
     256:	eb03 0243 	add.w	r2, r3, r3, lsl #1
     25a:	bf48      	it	mi
     25c:	f605 5501 	addwmi	r5, r5, #3329	@ 0xd01
     260:	2c00      	cmp	r4, #0
     262:	bf48      	it	mi
     264:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     268:	4402      	add	r2, r0
     26a:	f882 5300 	strb.w	r5, [r2, #768]	@ 0x300
     26e:	0122      	lsls	r2, r4, #4
     270:	0924      	lsrs	r4, r4, #4
     272:	3301      	adds	r3, #1
     274:	ea42 2215 	orr.w	r2, r2, r5, lsr #8
     278:	f80e 4f03 	strb.w	r4, [lr, #3]!
     27c:	2b80      	cmp	r3, #128	@ 0x80
     27e:	f80e 2c01 	strb.w	r2, [lr, #-1]
     282:	d1e1      	bne.n	248 <pack_sk+0x90>
     284:	bdb0      	pop	{r4, r5, r7, pc}
     286:	bf00      	nop

00000288 <pqcrystals_kyber768_ref_polyvec_tobytes>:
     288:	b5b0      	push	{r4, r5, r7, lr}
     28a:	f1a1 0e02 	sub.w	lr, r1, #2
     28e:	1e83      	subs	r3, r0, #2
     290:	f04f 0c80 	mov.w	ip, #128	@ 0x80
     294:	f93e 2f04 	ldrsh.w	r2, [lr, #4]!
     298:	f93e 4c02 	ldrsh.w	r4, [lr, #-2]
     29c:	2c00      	cmp	r4, #0
     29e:	bf48      	it	mi
     2a0:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     2a4:	2a00      	cmp	r2, #0
     2a6:	bf48      	it	mi
     2a8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     2ac:	0115      	lsls	r5, r2, #4
     2ae:	ea45 2514 	orr.w	r5, r5, r4, lsr #8
     2b2:	f803 5f03 	strb.w	r5, [r3, #3]!
     2b6:	0912      	lsrs	r2, r2, #4
     2b8:	f1bc 0c01 	subs.w	ip, ip, #1
     2bc:	f803 4c01 	strb.w	r4, [r3, #-1]
     2c0:	705a      	strb	r2, [r3, #1]
     2c2:	d1e7      	bne.n	294 <pqcrystals_kyber768_ref_polyvec_tobytes+0xc>
     2c4:	f200 1e7f 	addw	lr, r0, #383	@ 0x17f
     2c8:	f201 2c02 	addw	ip, r1, #514	@ 0x202
     2cc:	2300      	movs	r3, #0
     2ce:	bf00      	nop
     2d0:	eb01 0583 	add.w	r5, r1, r3, lsl #2
     2d4:	f9b5 5200 	ldrsh.w	r5, [r5, #512]	@ 0x200
     2d8:	f93c 4023 	ldrsh.w	r4, [ip, r3, lsl #2]
     2dc:	2d00      	cmp	r5, #0
     2de:	eb03 0243 	add.w	r2, r3, r3, lsl #1
     2e2:	bf48      	it	mi
     2e4:	f605 5501 	addwmi	r5, r5, #3329	@ 0xd01
     2e8:	2c00      	cmp	r4, #0
     2ea:	bf48      	it	mi
     2ec:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     2f0:	4402      	add	r2, r0
     2f2:	f882 5180 	strb.w	r5, [r2, #384]	@ 0x180
     2f6:	0122      	lsls	r2, r4, #4
     2f8:	0924      	lsrs	r4, r4, #4
     2fa:	3301      	adds	r3, #1
     2fc:	ea42 2215 	orr.w	r2, r2, r5, lsr #8
     300:	f80e 4f03 	strb.w	r4, [lr, #3]!
     304:	2b80      	cmp	r3, #128	@ 0x80
     306:	f80e 2c01 	strb.w	r2, [lr, #-1]
     30a:	d1e1      	bne.n	2d0 <pqcrystals_kyber768_ref_polyvec_tobytes+0x48>
     30c:	f200 2eff 	addw	lr, r0, #767	@ 0x2ff
     310:	f201 4c02 	addw	ip, r1, #1026	@ 0x402
     314:	2300      	movs	r3, #0
     316:	bf00      	nop
     318:	eb01 0583 	add.w	r5, r1, r3, lsl #2
     31c:	f9b5 5400 	ldrsh.w	r5, [r5, #1024]	@ 0x400
     320:	f93c 4023 	ldrsh.w	r4, [ip, r3, lsl #2]
     324:	2d00      	cmp	r5, #0
     326:	eb03 0243 	add.w	r2, r3, r3, lsl #1
     32a:	bf48      	it	mi
     32c:	f605 5501 	addwmi	r5, r5, #3329	@ 0xd01
     330:	2c00      	cmp	r4, #0
     332:	bf48      	it	mi
     334:	f604 5401 	addwmi	r4, r4, #3329	@ 0xd01
     338:	4402      	add	r2, r0
     33a:	f882 5300 	strb.w	r5, [r2, #768]	@ 0x300
     33e:	0122      	lsls	r2, r4, #4
     340:	0924      	lsrs	r4, r4, #4
     342:	3301      	adds	r3, #1
     344:	ea42 2215 	orr.w	r2, r2, r5, lsr #8
     348:	f80e 4f03 	strb.w	r4, [lr, #3]!
     34c:	2b80      	cmp	r3, #128	@ 0x80
     34e:	f80e 2c01 	strb.w	r2, [lr, #-1]
     352:	d1e1      	bne.n	318 <pqcrystals_kyber768_ref_polyvec_tobytes+0x90>
     354:	bdb0      	pop	{r4, r5, r7, pc}
     356:	bf00      	nop

00000358 <pqcrystals_kyber768_ref_poly_tobytes>:
     358:	f9b1 2000 	ldrsh.w	r2, [r1]
     35c:	f9b1 c002 	ldrsh.w	ip, [r1, #2]
     360:	2a00      	cmp	r2, #0
     362:	bf48      	it	mi
     364:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     368:	f1bc 0f00 	cmp.w	ip, #0
     36c:	bf48      	it	mi
     36e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     372:	ea4f 130c 	mov.w	r3, ip, lsl #4
     376:	7002      	strb	r2, [r0, #0]
     378:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     37c:	7042      	strb	r2, [r0, #1]
     37e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     382:	7082      	strb	r2, [r0, #2]
     384:	f9b1 2004 	ldrsh.w	r2, [r1, #4]
     388:	f9b1 c006 	ldrsh.w	ip, [r1, #6]
     38c:	2a00      	cmp	r2, #0
     38e:	bf48      	it	mi
     390:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     394:	f1bc 0f00 	cmp.w	ip, #0
     398:	bf48      	it	mi
     39a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     39e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     3a2:	70c2      	strb	r2, [r0, #3]
     3a4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     3a8:	7102      	strb	r2, [r0, #4]
     3aa:	ea4f 121c 	mov.w	r2, ip, lsr #4
     3ae:	7142      	strb	r2, [r0, #5]
     3b0:	f9b1 2008 	ldrsh.w	r2, [r1, #8]
     3b4:	f9b1 c00a 	ldrsh.w	ip, [r1, #10]
     3b8:	2a00      	cmp	r2, #0
     3ba:	bf48      	it	mi
     3bc:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     3c0:	f1bc 0f00 	cmp.w	ip, #0
     3c4:	bf48      	it	mi
     3c6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     3ca:	ea4f 130c 	mov.w	r3, ip, lsl #4
     3ce:	7182      	strb	r2, [r0, #6]
     3d0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     3d4:	71c2      	strb	r2, [r0, #7]
     3d6:	ea4f 121c 	mov.w	r2, ip, lsr #4
     3da:	7202      	strb	r2, [r0, #8]
     3dc:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
     3e0:	f9b1 c00e 	ldrsh.w	ip, [r1, #14]
     3e4:	2a00      	cmp	r2, #0
     3e6:	bf48      	it	mi
     3e8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     3ec:	f1bc 0f00 	cmp.w	ip, #0
     3f0:	bf48      	it	mi
     3f2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     3f6:	ea4f 130c 	mov.w	r3, ip, lsl #4
     3fa:	7242      	strb	r2, [r0, #9]
     3fc:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     400:	7282      	strb	r2, [r0, #10]
     402:	ea4f 121c 	mov.w	r2, ip, lsr #4
     406:	72c2      	strb	r2, [r0, #11]
     408:	f9b1 2010 	ldrsh.w	r2, [r1, #16]
     40c:	f9b1 c012 	ldrsh.w	ip, [r1, #18]
     410:	2a00      	cmp	r2, #0
     412:	bf48      	it	mi
     414:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     418:	f1bc 0f00 	cmp.w	ip, #0
     41c:	bf48      	it	mi
     41e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     422:	ea4f 130c 	mov.w	r3, ip, lsl #4
     426:	7302      	strb	r2, [r0, #12]
     428:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     42c:	7342      	strb	r2, [r0, #13]
     42e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     432:	7382      	strb	r2, [r0, #14]
     434:	f9b1 2014 	ldrsh.w	r2, [r1, #20]
     438:	f9b1 c016 	ldrsh.w	ip, [r1, #22]
     43c:	2a00      	cmp	r2, #0
     43e:	bf48      	it	mi
     440:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     444:	f1bc 0f00 	cmp.w	ip, #0
     448:	bf48      	it	mi
     44a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     44e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     452:	73c2      	strb	r2, [r0, #15]
     454:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     458:	7402      	strb	r2, [r0, #16]
     45a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     45e:	7442      	strb	r2, [r0, #17]
     460:	f9b1 2018 	ldrsh.w	r2, [r1, #24]
     464:	f9b1 c01a 	ldrsh.w	ip, [r1, #26]
     468:	2a00      	cmp	r2, #0
     46a:	bf48      	it	mi
     46c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     470:	f1bc 0f00 	cmp.w	ip, #0
     474:	bf48      	it	mi
     476:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     47a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     47e:	7482      	strb	r2, [r0, #18]
     480:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     484:	74c2      	strb	r2, [r0, #19]
     486:	ea4f 121c 	mov.w	r2, ip, lsr #4
     48a:	7502      	strb	r2, [r0, #20]
     48c:	f9b1 201c 	ldrsh.w	r2, [r1, #28]
     490:	f9b1 c01e 	ldrsh.w	ip, [r1, #30]
     494:	2a00      	cmp	r2, #0
     496:	bf48      	it	mi
     498:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     49c:	f1bc 0f00 	cmp.w	ip, #0
     4a0:	bf48      	it	mi
     4a2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     4a6:	ea4f 130c 	mov.w	r3, ip, lsl #4
     4aa:	7542      	strb	r2, [r0, #21]
     4ac:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     4b0:	7582      	strb	r2, [r0, #22]
     4b2:	ea4f 121c 	mov.w	r2, ip, lsr #4
     4b6:	75c2      	strb	r2, [r0, #23]
     4b8:	f9b1 2020 	ldrsh.w	r2, [r1, #32]
     4bc:	f9b1 c022 	ldrsh.w	ip, [r1, #34]	@ 0x22
     4c0:	2a00      	cmp	r2, #0
     4c2:	bf48      	it	mi
     4c4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     4c8:	f1bc 0f00 	cmp.w	ip, #0
     4cc:	bf48      	it	mi
     4ce:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     4d2:	ea4f 130c 	mov.w	r3, ip, lsl #4
     4d6:	7602      	strb	r2, [r0, #24]
     4d8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     4dc:	7642      	strb	r2, [r0, #25]
     4de:	ea4f 121c 	mov.w	r2, ip, lsr #4
     4e2:	7682      	strb	r2, [r0, #26]
     4e4:	f9b1 2024 	ldrsh.w	r2, [r1, #36]	@ 0x24
     4e8:	f9b1 c026 	ldrsh.w	ip, [r1, #38]	@ 0x26
     4ec:	2a00      	cmp	r2, #0
     4ee:	bf48      	it	mi
     4f0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     4f4:	f1bc 0f00 	cmp.w	ip, #0
     4f8:	bf48      	it	mi
     4fa:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     4fe:	ea4f 130c 	mov.w	r3, ip, lsl #4
     502:	76c2      	strb	r2, [r0, #27]
     504:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     508:	7702      	strb	r2, [r0, #28]
     50a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     50e:	7742      	strb	r2, [r0, #29]
     510:	f9b1 2028 	ldrsh.w	r2, [r1, #40]	@ 0x28
     514:	f9b1 c02a 	ldrsh.w	ip, [r1, #42]	@ 0x2a
     518:	2a00      	cmp	r2, #0
     51a:	bf48      	it	mi
     51c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     520:	f1bc 0f00 	cmp.w	ip, #0
     524:	bf48      	it	mi
     526:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     52a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     52e:	7782      	strb	r2, [r0, #30]
     530:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     534:	77c2      	strb	r2, [r0, #31]
     536:	ea4f 121c 	mov.w	r2, ip, lsr #4
     53a:	f880 2020 	strb.w	r2, [r0, #32]
     53e:	f9b1 202c 	ldrsh.w	r2, [r1, #44]	@ 0x2c
     542:	f9b1 c02e 	ldrsh.w	ip, [r1, #46]	@ 0x2e
     546:	2a00      	cmp	r2, #0
     548:	bf48      	it	mi
     54a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     54e:	f1bc 0f00 	cmp.w	ip, #0
     552:	bf48      	it	mi
     554:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     558:	ea4f 130c 	mov.w	r3, ip, lsl #4
     55c:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
     560:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     564:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
     568:	ea4f 121c 	mov.w	r2, ip, lsr #4
     56c:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
     570:	f9b1 2030 	ldrsh.w	r2, [r1, #48]	@ 0x30
     574:	f9b1 c032 	ldrsh.w	ip, [r1, #50]	@ 0x32
     578:	2a00      	cmp	r2, #0
     57a:	bf48      	it	mi
     57c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     580:	f1bc 0f00 	cmp.w	ip, #0
     584:	bf48      	it	mi
     586:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     58a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     58e:	f880 2024 	strb.w	r2, [r0, #36]	@ 0x24
     592:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     596:	f880 2025 	strb.w	r2, [r0, #37]	@ 0x25
     59a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     59e:	f880 2026 	strb.w	r2, [r0, #38]	@ 0x26
     5a2:	f9b1 2034 	ldrsh.w	r2, [r1, #52]	@ 0x34
     5a6:	f9b1 c036 	ldrsh.w	ip, [r1, #54]	@ 0x36
     5aa:	2a00      	cmp	r2, #0
     5ac:	bf48      	it	mi
     5ae:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     5b2:	f1bc 0f00 	cmp.w	ip, #0
     5b6:	bf48      	it	mi
     5b8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     5bc:	ea4f 130c 	mov.w	r3, ip, lsl #4
     5c0:	f880 2027 	strb.w	r2, [r0, #39]	@ 0x27
     5c4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     5c8:	f880 2028 	strb.w	r2, [r0, #40]	@ 0x28
     5cc:	ea4f 121c 	mov.w	r2, ip, lsr #4
     5d0:	f880 2029 	strb.w	r2, [r0, #41]	@ 0x29
     5d4:	f9b1 2038 	ldrsh.w	r2, [r1, #56]	@ 0x38
     5d8:	f9b1 c03a 	ldrsh.w	ip, [r1, #58]	@ 0x3a
     5dc:	2a00      	cmp	r2, #0
     5de:	bf48      	it	mi
     5e0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     5e4:	f1bc 0f00 	cmp.w	ip, #0
     5e8:	bf48      	it	mi
     5ea:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     5ee:	ea4f 130c 	mov.w	r3, ip, lsl #4
     5f2:	f880 202a 	strb.w	r2, [r0, #42]	@ 0x2a
     5f6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     5fa:	f880 202b 	strb.w	r2, [r0, #43]	@ 0x2b
     5fe:	ea4f 121c 	mov.w	r2, ip, lsr #4
     602:	f880 202c 	strb.w	r2, [r0, #44]	@ 0x2c
     606:	f9b1 203c 	ldrsh.w	r2, [r1, #60]	@ 0x3c
     60a:	f9b1 c03e 	ldrsh.w	ip, [r1, #62]	@ 0x3e
     60e:	2a00      	cmp	r2, #0
     610:	bf48      	it	mi
     612:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     616:	f1bc 0f00 	cmp.w	ip, #0
     61a:	bf48      	it	mi
     61c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     620:	ea4f 130c 	mov.w	r3, ip, lsl #4
     624:	f880 202d 	strb.w	r2, [r0, #45]	@ 0x2d
     628:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     62c:	f880 202e 	strb.w	r2, [r0, #46]	@ 0x2e
     630:	ea4f 121c 	mov.w	r2, ip, lsr #4
     634:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
     638:	f9b1 2040 	ldrsh.w	r2, [r1, #64]	@ 0x40
     63c:	f9b1 c042 	ldrsh.w	ip, [r1, #66]	@ 0x42
     640:	2a00      	cmp	r2, #0
     642:	bf48      	it	mi
     644:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     648:	f1bc 0f00 	cmp.w	ip, #0
     64c:	bf48      	it	mi
     64e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     652:	ea4f 130c 	mov.w	r3, ip, lsl #4
     656:	f880 2030 	strb.w	r2, [r0, #48]	@ 0x30
     65a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     65e:	f880 2031 	strb.w	r2, [r0, #49]	@ 0x31
     662:	ea4f 121c 	mov.w	r2, ip, lsr #4
     666:	f880 2032 	strb.w	r2, [r0, #50]	@ 0x32
     66a:	f9b1 2044 	ldrsh.w	r2, [r1, #68]	@ 0x44
     66e:	f9b1 c046 	ldrsh.w	ip, [r1, #70]	@ 0x46
     672:	2a00      	cmp	r2, #0
     674:	bf48      	it	mi
     676:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     67a:	f1bc 0f00 	cmp.w	ip, #0
     67e:	bf48      	it	mi
     680:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     684:	ea4f 130c 	mov.w	r3, ip, lsl #4
     688:	f880 2033 	strb.w	r2, [r0, #51]	@ 0x33
     68c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     690:	f880 2034 	strb.w	r2, [r0, #52]	@ 0x34
     694:	ea4f 121c 	mov.w	r2, ip, lsr #4
     698:	f880 2035 	strb.w	r2, [r0, #53]	@ 0x35
     69c:	f9b1 2048 	ldrsh.w	r2, [r1, #72]	@ 0x48
     6a0:	f9b1 c04a 	ldrsh.w	ip, [r1, #74]	@ 0x4a
     6a4:	2a00      	cmp	r2, #0
     6a6:	bf48      	it	mi
     6a8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     6ac:	f1bc 0f00 	cmp.w	ip, #0
     6b0:	bf48      	it	mi
     6b2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     6b6:	ea4f 130c 	mov.w	r3, ip, lsl #4
     6ba:	f880 2036 	strb.w	r2, [r0, #54]	@ 0x36
     6be:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     6c2:	f880 2037 	strb.w	r2, [r0, #55]	@ 0x37
     6c6:	ea4f 121c 	mov.w	r2, ip, lsr #4
     6ca:	f880 2038 	strb.w	r2, [r0, #56]	@ 0x38
     6ce:	f9b1 204c 	ldrsh.w	r2, [r1, #76]	@ 0x4c
     6d2:	f9b1 c04e 	ldrsh.w	ip, [r1, #78]	@ 0x4e
     6d6:	2a00      	cmp	r2, #0
     6d8:	bf48      	it	mi
     6da:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     6de:	f1bc 0f00 	cmp.w	ip, #0
     6e2:	bf48      	it	mi
     6e4:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     6e8:	ea4f 130c 	mov.w	r3, ip, lsl #4
     6ec:	f880 2039 	strb.w	r2, [r0, #57]	@ 0x39
     6f0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     6f4:	f880 203a 	strb.w	r2, [r0, #58]	@ 0x3a
     6f8:	ea4f 121c 	mov.w	r2, ip, lsr #4
     6fc:	f880 203b 	strb.w	r2, [r0, #59]	@ 0x3b
     700:	f9b1 2050 	ldrsh.w	r2, [r1, #80]	@ 0x50
     704:	f9b1 c052 	ldrsh.w	ip, [r1, #82]	@ 0x52
     708:	2a00      	cmp	r2, #0
     70a:	bf48      	it	mi
     70c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     710:	f1bc 0f00 	cmp.w	ip, #0
     714:	bf48      	it	mi
     716:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     71a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     71e:	f880 203c 	strb.w	r2, [r0, #60]	@ 0x3c
     722:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     726:	f880 203d 	strb.w	r2, [r0, #61]	@ 0x3d
     72a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     72e:	f880 203e 	strb.w	r2, [r0, #62]	@ 0x3e
     732:	f9b1 2054 	ldrsh.w	r2, [r1, #84]	@ 0x54
     736:	f9b1 c056 	ldrsh.w	ip, [r1, #86]	@ 0x56
     73a:	2a00      	cmp	r2, #0
     73c:	bf48      	it	mi
     73e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     742:	f1bc 0f00 	cmp.w	ip, #0
     746:	bf48      	it	mi
     748:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     74c:	ea4f 130c 	mov.w	r3, ip, lsl #4
     750:	f880 203f 	strb.w	r2, [r0, #63]	@ 0x3f
     754:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     758:	f880 2040 	strb.w	r2, [r0, #64]	@ 0x40
     75c:	ea4f 121c 	mov.w	r2, ip, lsr #4
     760:	f880 2041 	strb.w	r2, [r0, #65]	@ 0x41
     764:	f9b1 2058 	ldrsh.w	r2, [r1, #88]	@ 0x58
     768:	f9b1 c05a 	ldrsh.w	ip, [r1, #90]	@ 0x5a
     76c:	2a00      	cmp	r2, #0
     76e:	bf48      	it	mi
     770:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     774:	f1bc 0f00 	cmp.w	ip, #0
     778:	bf48      	it	mi
     77a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     77e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     782:	f880 2042 	strb.w	r2, [r0, #66]	@ 0x42
     786:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     78a:	f880 2043 	strb.w	r2, [r0, #67]	@ 0x43
     78e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     792:	f880 2044 	strb.w	r2, [r0, #68]	@ 0x44
     796:	f9b1 205c 	ldrsh.w	r2, [r1, #92]	@ 0x5c
     79a:	f9b1 c05e 	ldrsh.w	ip, [r1, #94]	@ 0x5e
     79e:	2a00      	cmp	r2, #0
     7a0:	bf48      	it	mi
     7a2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     7a6:	f1bc 0f00 	cmp.w	ip, #0
     7aa:	bf48      	it	mi
     7ac:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     7b0:	ea4f 130c 	mov.w	r3, ip, lsl #4
     7b4:	f880 2045 	strb.w	r2, [r0, #69]	@ 0x45
     7b8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     7bc:	f880 2046 	strb.w	r2, [r0, #70]	@ 0x46
     7c0:	ea4f 121c 	mov.w	r2, ip, lsr #4
     7c4:	f880 2047 	strb.w	r2, [r0, #71]	@ 0x47
     7c8:	f9b1 2060 	ldrsh.w	r2, [r1, #96]	@ 0x60
     7cc:	f9b1 c062 	ldrsh.w	ip, [r1, #98]	@ 0x62
     7d0:	2a00      	cmp	r2, #0
     7d2:	bf48      	it	mi
     7d4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     7d8:	f1bc 0f00 	cmp.w	ip, #0
     7dc:	bf48      	it	mi
     7de:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     7e2:	ea4f 130c 	mov.w	r3, ip, lsl #4
     7e6:	f880 2048 	strb.w	r2, [r0, #72]	@ 0x48
     7ea:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     7ee:	f880 2049 	strb.w	r2, [r0, #73]	@ 0x49
     7f2:	ea4f 121c 	mov.w	r2, ip, lsr #4
     7f6:	f880 204a 	strb.w	r2, [r0, #74]	@ 0x4a
     7fa:	f9b1 2064 	ldrsh.w	r2, [r1, #100]	@ 0x64
     7fe:	f9b1 c066 	ldrsh.w	ip, [r1, #102]	@ 0x66
     802:	2a00      	cmp	r2, #0
     804:	bf48      	it	mi
     806:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     80a:	f1bc 0f00 	cmp.w	ip, #0
     80e:	bf48      	it	mi
     810:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     814:	ea4f 130c 	mov.w	r3, ip, lsl #4
     818:	f880 204b 	strb.w	r2, [r0, #75]	@ 0x4b
     81c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     820:	f880 204c 	strb.w	r2, [r0, #76]	@ 0x4c
     824:	ea4f 121c 	mov.w	r2, ip, lsr #4
     828:	f880 204d 	strb.w	r2, [r0, #77]	@ 0x4d
     82c:	f9b1 2068 	ldrsh.w	r2, [r1, #104]	@ 0x68
     830:	f9b1 c06a 	ldrsh.w	ip, [r1, #106]	@ 0x6a
     834:	2a00      	cmp	r2, #0
     836:	bf48      	it	mi
     838:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     83c:	f1bc 0f00 	cmp.w	ip, #0
     840:	bf48      	it	mi
     842:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     846:	ea4f 130c 	mov.w	r3, ip, lsl #4
     84a:	f880 204e 	strb.w	r2, [r0, #78]	@ 0x4e
     84e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     852:	f880 204f 	strb.w	r2, [r0, #79]	@ 0x4f
     856:	ea4f 121c 	mov.w	r2, ip, lsr #4
     85a:	f880 2050 	strb.w	r2, [r0, #80]	@ 0x50
     85e:	f9b1 206c 	ldrsh.w	r2, [r1, #108]	@ 0x6c
     862:	f9b1 c06e 	ldrsh.w	ip, [r1, #110]	@ 0x6e
     866:	2a00      	cmp	r2, #0
     868:	bf48      	it	mi
     86a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     86e:	f1bc 0f00 	cmp.w	ip, #0
     872:	bf48      	it	mi
     874:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     878:	ea4f 130c 	mov.w	r3, ip, lsl #4
     87c:	f880 2051 	strb.w	r2, [r0, #81]	@ 0x51
     880:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     884:	f880 2052 	strb.w	r2, [r0, #82]	@ 0x52
     888:	ea4f 121c 	mov.w	r2, ip, lsr #4
     88c:	f880 2053 	strb.w	r2, [r0, #83]	@ 0x53
     890:	f9b1 2070 	ldrsh.w	r2, [r1, #112]	@ 0x70
     894:	f9b1 c072 	ldrsh.w	ip, [r1, #114]	@ 0x72
     898:	2a00      	cmp	r2, #0
     89a:	bf48      	it	mi
     89c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     8a0:	f1bc 0f00 	cmp.w	ip, #0
     8a4:	bf48      	it	mi
     8a6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     8aa:	ea4f 130c 	mov.w	r3, ip, lsl #4
     8ae:	f880 2054 	strb.w	r2, [r0, #84]	@ 0x54
     8b2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     8b6:	f880 2055 	strb.w	r2, [r0, #85]	@ 0x55
     8ba:	ea4f 121c 	mov.w	r2, ip, lsr #4
     8be:	f880 2056 	strb.w	r2, [r0, #86]	@ 0x56
     8c2:	f9b1 2074 	ldrsh.w	r2, [r1, #116]	@ 0x74
     8c6:	f9b1 c076 	ldrsh.w	ip, [r1, #118]	@ 0x76
     8ca:	2a00      	cmp	r2, #0
     8cc:	bf48      	it	mi
     8ce:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     8d2:	f1bc 0f00 	cmp.w	ip, #0
     8d6:	bf48      	it	mi
     8d8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     8dc:	ea4f 130c 	mov.w	r3, ip, lsl #4
     8e0:	f880 2057 	strb.w	r2, [r0, #87]	@ 0x57
     8e4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     8e8:	f880 2058 	strb.w	r2, [r0, #88]	@ 0x58
     8ec:	ea4f 121c 	mov.w	r2, ip, lsr #4
     8f0:	f880 2059 	strb.w	r2, [r0, #89]	@ 0x59
     8f4:	f9b1 2078 	ldrsh.w	r2, [r1, #120]	@ 0x78
     8f8:	f9b1 c07a 	ldrsh.w	ip, [r1, #122]	@ 0x7a
     8fc:	2a00      	cmp	r2, #0
     8fe:	bf48      	it	mi
     900:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     904:	f1bc 0f00 	cmp.w	ip, #0
     908:	bf48      	it	mi
     90a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     90e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     912:	f880 205a 	strb.w	r2, [r0, #90]	@ 0x5a
     916:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     91a:	f880 205b 	strb.w	r2, [r0, #91]	@ 0x5b
     91e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     922:	f880 205c 	strb.w	r2, [r0, #92]	@ 0x5c
     926:	f9b1 207c 	ldrsh.w	r2, [r1, #124]	@ 0x7c
     92a:	f9b1 c07e 	ldrsh.w	ip, [r1, #126]	@ 0x7e
     92e:	2a00      	cmp	r2, #0
     930:	bf48      	it	mi
     932:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     936:	f1bc 0f00 	cmp.w	ip, #0
     93a:	bf48      	it	mi
     93c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     940:	ea4f 130c 	mov.w	r3, ip, lsl #4
     944:	f880 205d 	strb.w	r2, [r0, #93]	@ 0x5d
     948:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     94c:	f880 205e 	strb.w	r2, [r0, #94]	@ 0x5e
     950:	ea4f 121c 	mov.w	r2, ip, lsr #4
     954:	f880 205f 	strb.w	r2, [r0, #95]	@ 0x5f
     958:	f9b1 2080 	ldrsh.w	r2, [r1, #128]	@ 0x80
     95c:	f9b1 c082 	ldrsh.w	ip, [r1, #130]	@ 0x82
     960:	2a00      	cmp	r2, #0
     962:	bf48      	it	mi
     964:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     968:	f1bc 0f00 	cmp.w	ip, #0
     96c:	bf48      	it	mi
     96e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     972:	ea4f 130c 	mov.w	r3, ip, lsl #4
     976:	f880 2060 	strb.w	r2, [r0, #96]	@ 0x60
     97a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     97e:	f880 2061 	strb.w	r2, [r0, #97]	@ 0x61
     982:	ea4f 121c 	mov.w	r2, ip, lsr #4
     986:	f880 2062 	strb.w	r2, [r0, #98]	@ 0x62
     98a:	f9b1 2084 	ldrsh.w	r2, [r1, #132]	@ 0x84
     98e:	f9b1 c086 	ldrsh.w	ip, [r1, #134]	@ 0x86
     992:	2a00      	cmp	r2, #0
     994:	bf48      	it	mi
     996:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     99a:	f1bc 0f00 	cmp.w	ip, #0
     99e:	bf48      	it	mi
     9a0:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     9a4:	ea4f 130c 	mov.w	r3, ip, lsl #4
     9a8:	f880 2063 	strb.w	r2, [r0, #99]	@ 0x63
     9ac:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     9b0:	f880 2064 	strb.w	r2, [r0, #100]	@ 0x64
     9b4:	ea4f 121c 	mov.w	r2, ip, lsr #4
     9b8:	f880 2065 	strb.w	r2, [r0, #101]	@ 0x65
     9bc:	f9b1 2088 	ldrsh.w	r2, [r1, #136]	@ 0x88
     9c0:	f9b1 c08a 	ldrsh.w	ip, [r1, #138]	@ 0x8a
     9c4:	2a00      	cmp	r2, #0
     9c6:	bf48      	it	mi
     9c8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     9cc:	f1bc 0f00 	cmp.w	ip, #0
     9d0:	bf48      	it	mi
     9d2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     9d6:	ea4f 130c 	mov.w	r3, ip, lsl #4
     9da:	f880 2066 	strb.w	r2, [r0, #102]	@ 0x66
     9de:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     9e2:	f880 2067 	strb.w	r2, [r0, #103]	@ 0x67
     9e6:	ea4f 121c 	mov.w	r2, ip, lsr #4
     9ea:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
     9ee:	f9b1 208c 	ldrsh.w	r2, [r1, #140]	@ 0x8c
     9f2:	f9b1 c08e 	ldrsh.w	ip, [r1, #142]	@ 0x8e
     9f6:	2a00      	cmp	r2, #0
     9f8:	bf48      	it	mi
     9fa:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     9fe:	f1bc 0f00 	cmp.w	ip, #0
     a02:	bf48      	it	mi
     a04:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     a08:	ea4f 130c 	mov.w	r3, ip, lsl #4
     a0c:	f880 2069 	strb.w	r2, [r0, #105]	@ 0x69
     a10:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     a14:	f880 206a 	strb.w	r2, [r0, #106]	@ 0x6a
     a18:	ea4f 121c 	mov.w	r2, ip, lsr #4
     a1c:	f880 206b 	strb.w	r2, [r0, #107]	@ 0x6b
     a20:	f9b1 2090 	ldrsh.w	r2, [r1, #144]	@ 0x90
     a24:	f9b1 c092 	ldrsh.w	ip, [r1, #146]	@ 0x92
     a28:	2a00      	cmp	r2, #0
     a2a:	bf48      	it	mi
     a2c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     a30:	f1bc 0f00 	cmp.w	ip, #0
     a34:	bf48      	it	mi
     a36:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     a3a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     a3e:	f880 206c 	strb.w	r2, [r0, #108]	@ 0x6c
     a42:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     a46:	f880 206d 	strb.w	r2, [r0, #109]	@ 0x6d
     a4a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     a4e:	f880 206e 	strb.w	r2, [r0, #110]	@ 0x6e
     a52:	f9b1 2094 	ldrsh.w	r2, [r1, #148]	@ 0x94
     a56:	f9b1 c096 	ldrsh.w	ip, [r1, #150]	@ 0x96
     a5a:	2a00      	cmp	r2, #0
     a5c:	bf48      	it	mi
     a5e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     a62:	f1bc 0f00 	cmp.w	ip, #0
     a66:	bf48      	it	mi
     a68:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     a6c:	ea4f 130c 	mov.w	r3, ip, lsl #4
     a70:	f880 206f 	strb.w	r2, [r0, #111]	@ 0x6f
     a74:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     a78:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
     a7c:	ea4f 121c 	mov.w	r2, ip, lsr #4
     a80:	f880 2071 	strb.w	r2, [r0, #113]	@ 0x71
     a84:	f9b1 2098 	ldrsh.w	r2, [r1, #152]	@ 0x98
     a88:	f9b1 c09a 	ldrsh.w	ip, [r1, #154]	@ 0x9a
     a8c:	2a00      	cmp	r2, #0
     a8e:	bf48      	it	mi
     a90:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     a94:	f1bc 0f00 	cmp.w	ip, #0
     a98:	bf48      	it	mi
     a9a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     a9e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     aa2:	f880 2072 	strb.w	r2, [r0, #114]	@ 0x72
     aa6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     aaa:	f880 2073 	strb.w	r2, [r0, #115]	@ 0x73
     aae:	ea4f 121c 	mov.w	r2, ip, lsr #4
     ab2:	f880 2074 	strb.w	r2, [r0, #116]	@ 0x74
     ab6:	f9b1 209c 	ldrsh.w	r2, [r1, #156]	@ 0x9c
     aba:	f9b1 c09e 	ldrsh.w	ip, [r1, #158]	@ 0x9e
     abe:	2a00      	cmp	r2, #0
     ac0:	bf48      	it	mi
     ac2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     ac6:	f1bc 0f00 	cmp.w	ip, #0
     aca:	bf48      	it	mi
     acc:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     ad0:	ea4f 130c 	mov.w	r3, ip, lsl #4
     ad4:	f880 2075 	strb.w	r2, [r0, #117]	@ 0x75
     ad8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     adc:	f880 2076 	strb.w	r2, [r0, #118]	@ 0x76
     ae0:	ea4f 121c 	mov.w	r2, ip, lsr #4
     ae4:	f880 2077 	strb.w	r2, [r0, #119]	@ 0x77
     ae8:	f9b1 20a0 	ldrsh.w	r2, [r1, #160]	@ 0xa0
     aec:	f9b1 c0a2 	ldrsh.w	ip, [r1, #162]	@ 0xa2
     af0:	2a00      	cmp	r2, #0
     af2:	bf48      	it	mi
     af4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     af8:	f1bc 0f00 	cmp.w	ip, #0
     afc:	bf48      	it	mi
     afe:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     b02:	ea4f 130c 	mov.w	r3, ip, lsl #4
     b06:	f880 2078 	strb.w	r2, [r0, #120]	@ 0x78
     b0a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     b0e:	f880 2079 	strb.w	r2, [r0, #121]	@ 0x79
     b12:	ea4f 121c 	mov.w	r2, ip, lsr #4
     b16:	f880 207a 	strb.w	r2, [r0, #122]	@ 0x7a
     b1a:	f9b1 20a4 	ldrsh.w	r2, [r1, #164]	@ 0xa4
     b1e:	f9b1 c0a6 	ldrsh.w	ip, [r1, #166]	@ 0xa6
     b22:	2a00      	cmp	r2, #0
     b24:	bf48      	it	mi
     b26:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     b2a:	f1bc 0f00 	cmp.w	ip, #0
     b2e:	bf48      	it	mi
     b30:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     b34:	ea4f 130c 	mov.w	r3, ip, lsl #4
     b38:	f880 207b 	strb.w	r2, [r0, #123]	@ 0x7b
     b3c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     b40:	f880 207c 	strb.w	r2, [r0, #124]	@ 0x7c
     b44:	ea4f 121c 	mov.w	r2, ip, lsr #4
     b48:	f880 207d 	strb.w	r2, [r0, #125]	@ 0x7d
     b4c:	f9b1 20a8 	ldrsh.w	r2, [r1, #168]	@ 0xa8
     b50:	f9b1 c0aa 	ldrsh.w	ip, [r1, #170]	@ 0xaa
     b54:	2a00      	cmp	r2, #0
     b56:	bf48      	it	mi
     b58:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     b5c:	f1bc 0f00 	cmp.w	ip, #0
     b60:	bf48      	it	mi
     b62:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     b66:	ea4f 130c 	mov.w	r3, ip, lsl #4
     b6a:	f880 207e 	strb.w	r2, [r0, #126]	@ 0x7e
     b6e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     b72:	f880 207f 	strb.w	r2, [r0, #127]	@ 0x7f
     b76:	ea4f 121c 	mov.w	r2, ip, lsr #4
     b7a:	f880 2080 	strb.w	r2, [r0, #128]	@ 0x80
     b7e:	f9b1 20ac 	ldrsh.w	r2, [r1, #172]	@ 0xac
     b82:	f9b1 c0ae 	ldrsh.w	ip, [r1, #174]	@ 0xae
     b86:	2a00      	cmp	r2, #0
     b88:	bf48      	it	mi
     b8a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     b8e:	f1bc 0f00 	cmp.w	ip, #0
     b92:	bf48      	it	mi
     b94:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     b98:	ea4f 130c 	mov.w	r3, ip, lsl #4
     b9c:	f880 2081 	strb.w	r2, [r0, #129]	@ 0x81
     ba0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     ba4:	f880 2082 	strb.w	r2, [r0, #130]	@ 0x82
     ba8:	ea4f 121c 	mov.w	r2, ip, lsr #4
     bac:	f880 2083 	strb.w	r2, [r0, #131]	@ 0x83
     bb0:	f9b1 20b0 	ldrsh.w	r2, [r1, #176]	@ 0xb0
     bb4:	f9b1 c0b2 	ldrsh.w	ip, [r1, #178]	@ 0xb2
     bb8:	2a00      	cmp	r2, #0
     bba:	bf48      	it	mi
     bbc:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     bc0:	f1bc 0f00 	cmp.w	ip, #0
     bc4:	bf48      	it	mi
     bc6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     bca:	ea4f 130c 	mov.w	r3, ip, lsl #4
     bce:	f880 2084 	strb.w	r2, [r0, #132]	@ 0x84
     bd2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     bd6:	f880 2085 	strb.w	r2, [r0, #133]	@ 0x85
     bda:	ea4f 121c 	mov.w	r2, ip, lsr #4
     bde:	f880 2086 	strb.w	r2, [r0, #134]	@ 0x86
     be2:	f9b1 20b4 	ldrsh.w	r2, [r1, #180]	@ 0xb4
     be6:	f9b1 c0b6 	ldrsh.w	ip, [r1, #182]	@ 0xb6
     bea:	2a00      	cmp	r2, #0
     bec:	bf48      	it	mi
     bee:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     bf2:	f1bc 0f00 	cmp.w	ip, #0
     bf6:	bf48      	it	mi
     bf8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     bfc:	ea4f 130c 	mov.w	r3, ip, lsl #4
     c00:	f880 2087 	strb.w	r2, [r0, #135]	@ 0x87
     c04:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     c08:	f880 2088 	strb.w	r2, [r0, #136]	@ 0x88
     c0c:	ea4f 121c 	mov.w	r2, ip, lsr #4
     c10:	f880 2089 	strb.w	r2, [r0, #137]	@ 0x89
     c14:	f9b1 20b8 	ldrsh.w	r2, [r1, #184]	@ 0xb8
     c18:	f9b1 c0ba 	ldrsh.w	ip, [r1, #186]	@ 0xba
     c1c:	2a00      	cmp	r2, #0
     c1e:	bf48      	it	mi
     c20:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     c24:	f1bc 0f00 	cmp.w	ip, #0
     c28:	bf48      	it	mi
     c2a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     c2e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     c32:	f880 208a 	strb.w	r2, [r0, #138]	@ 0x8a
     c36:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     c3a:	f880 208b 	strb.w	r2, [r0, #139]	@ 0x8b
     c3e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     c42:	f880 208c 	strb.w	r2, [r0, #140]	@ 0x8c
     c46:	f9b1 20bc 	ldrsh.w	r2, [r1, #188]	@ 0xbc
     c4a:	f9b1 c0be 	ldrsh.w	ip, [r1, #190]	@ 0xbe
     c4e:	2a00      	cmp	r2, #0
     c50:	bf48      	it	mi
     c52:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     c56:	f1bc 0f00 	cmp.w	ip, #0
     c5a:	bf48      	it	mi
     c5c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     c60:	ea4f 130c 	mov.w	r3, ip, lsl #4
     c64:	f880 208d 	strb.w	r2, [r0, #141]	@ 0x8d
     c68:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     c6c:	f880 208e 	strb.w	r2, [r0, #142]	@ 0x8e
     c70:	ea4f 121c 	mov.w	r2, ip, lsr #4
     c74:	f880 208f 	strb.w	r2, [r0, #143]	@ 0x8f
     c78:	f9b1 20c0 	ldrsh.w	r2, [r1, #192]	@ 0xc0
     c7c:	f9b1 c0c2 	ldrsh.w	ip, [r1, #194]	@ 0xc2
     c80:	2a00      	cmp	r2, #0
     c82:	bf48      	it	mi
     c84:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     c88:	f1bc 0f00 	cmp.w	ip, #0
     c8c:	bf48      	it	mi
     c8e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     c92:	ea4f 130c 	mov.w	r3, ip, lsl #4
     c96:	f880 2090 	strb.w	r2, [r0, #144]	@ 0x90
     c9a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     c9e:	f880 2091 	strb.w	r2, [r0, #145]	@ 0x91
     ca2:	ea4f 121c 	mov.w	r2, ip, lsr #4
     ca6:	f880 2092 	strb.w	r2, [r0, #146]	@ 0x92
     caa:	f9b1 20c4 	ldrsh.w	r2, [r1, #196]	@ 0xc4
     cae:	f9b1 c0c6 	ldrsh.w	ip, [r1, #198]	@ 0xc6
     cb2:	2a00      	cmp	r2, #0
     cb4:	bf48      	it	mi
     cb6:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     cba:	f1bc 0f00 	cmp.w	ip, #0
     cbe:	bf48      	it	mi
     cc0:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     cc4:	ea4f 130c 	mov.w	r3, ip, lsl #4
     cc8:	f880 2093 	strb.w	r2, [r0, #147]	@ 0x93
     ccc:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     cd0:	f880 2094 	strb.w	r2, [r0, #148]	@ 0x94
     cd4:	ea4f 121c 	mov.w	r2, ip, lsr #4
     cd8:	f880 2095 	strb.w	r2, [r0, #149]	@ 0x95
     cdc:	f9b1 20c8 	ldrsh.w	r2, [r1, #200]	@ 0xc8
     ce0:	f9b1 c0ca 	ldrsh.w	ip, [r1, #202]	@ 0xca
     ce4:	2a00      	cmp	r2, #0
     ce6:	bf48      	it	mi
     ce8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     cec:	f1bc 0f00 	cmp.w	ip, #0
     cf0:	bf48      	it	mi
     cf2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     cf6:	ea4f 130c 	mov.w	r3, ip, lsl #4
     cfa:	f880 2096 	strb.w	r2, [r0, #150]	@ 0x96
     cfe:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     d02:	f880 2097 	strb.w	r2, [r0, #151]	@ 0x97
     d06:	ea4f 121c 	mov.w	r2, ip, lsr #4
     d0a:	f880 2098 	strb.w	r2, [r0, #152]	@ 0x98
     d0e:	f9b1 20cc 	ldrsh.w	r2, [r1, #204]	@ 0xcc
     d12:	f9b1 c0ce 	ldrsh.w	ip, [r1, #206]	@ 0xce
     d16:	2a00      	cmp	r2, #0
     d18:	bf48      	it	mi
     d1a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     d1e:	f1bc 0f00 	cmp.w	ip, #0
     d22:	bf48      	it	mi
     d24:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     d28:	ea4f 130c 	mov.w	r3, ip, lsl #4
     d2c:	f880 2099 	strb.w	r2, [r0, #153]	@ 0x99
     d30:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     d34:	f880 209a 	strb.w	r2, [r0, #154]	@ 0x9a
     d38:	ea4f 121c 	mov.w	r2, ip, lsr #4
     d3c:	f880 209b 	strb.w	r2, [r0, #155]	@ 0x9b
     d40:	f9b1 20d0 	ldrsh.w	r2, [r1, #208]	@ 0xd0
     d44:	f9b1 c0d2 	ldrsh.w	ip, [r1, #210]	@ 0xd2
     d48:	2a00      	cmp	r2, #0
     d4a:	bf48      	it	mi
     d4c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     d50:	f1bc 0f00 	cmp.w	ip, #0
     d54:	bf48      	it	mi
     d56:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     d5a:	ea4f 130c 	mov.w	r3, ip, lsl #4
     d5e:	f880 209c 	strb.w	r2, [r0, #156]	@ 0x9c
     d62:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     d66:	f880 209d 	strb.w	r2, [r0, #157]	@ 0x9d
     d6a:	ea4f 121c 	mov.w	r2, ip, lsr #4
     d6e:	f880 209e 	strb.w	r2, [r0, #158]	@ 0x9e
     d72:	f9b1 20d4 	ldrsh.w	r2, [r1, #212]	@ 0xd4
     d76:	f9b1 c0d6 	ldrsh.w	ip, [r1, #214]	@ 0xd6
     d7a:	2a00      	cmp	r2, #0
     d7c:	bf48      	it	mi
     d7e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     d82:	f1bc 0f00 	cmp.w	ip, #0
     d86:	bf48      	it	mi
     d88:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     d8c:	ea4f 130c 	mov.w	r3, ip, lsl #4
     d90:	f880 209f 	strb.w	r2, [r0, #159]	@ 0x9f
     d94:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     d98:	f880 20a0 	strb.w	r2, [r0, #160]	@ 0xa0
     d9c:	ea4f 121c 	mov.w	r2, ip, lsr #4
     da0:	f880 20a1 	strb.w	r2, [r0, #161]	@ 0xa1
     da4:	f9b1 20d8 	ldrsh.w	r2, [r1, #216]	@ 0xd8
     da8:	f9b1 c0da 	ldrsh.w	ip, [r1, #218]	@ 0xda
     dac:	2a00      	cmp	r2, #0
     dae:	bf48      	it	mi
     db0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     db4:	f1bc 0f00 	cmp.w	ip, #0
     db8:	bf48      	it	mi
     dba:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     dbe:	ea4f 130c 	mov.w	r3, ip, lsl #4
     dc2:	f880 20a2 	strb.w	r2, [r0, #162]	@ 0xa2
     dc6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     dca:	f880 20a3 	strb.w	r2, [r0, #163]	@ 0xa3
     dce:	ea4f 121c 	mov.w	r2, ip, lsr #4
     dd2:	f880 20a4 	strb.w	r2, [r0, #164]	@ 0xa4
     dd6:	f9b1 20dc 	ldrsh.w	r2, [r1, #220]	@ 0xdc
     dda:	f9b1 c0de 	ldrsh.w	ip, [r1, #222]	@ 0xde
     dde:	2a00      	cmp	r2, #0
     de0:	bf48      	it	mi
     de2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     de6:	f1bc 0f00 	cmp.w	ip, #0
     dea:	bf48      	it	mi
     dec:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     df0:	ea4f 130c 	mov.w	r3, ip, lsl #4
     df4:	f880 20a5 	strb.w	r2, [r0, #165]	@ 0xa5
     df8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     dfc:	f880 20a6 	strb.w	r2, [r0, #166]	@ 0xa6
     e00:	ea4f 121c 	mov.w	r2, ip, lsr #4
     e04:	f880 20a7 	strb.w	r2, [r0, #167]	@ 0xa7
     e08:	f9b1 20e0 	ldrsh.w	r2, [r1, #224]	@ 0xe0
     e0c:	f9b1 c0e2 	ldrsh.w	ip, [r1, #226]	@ 0xe2
     e10:	2a00      	cmp	r2, #0
     e12:	bf48      	it	mi
     e14:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     e18:	f1bc 0f00 	cmp.w	ip, #0
     e1c:	bf48      	it	mi
     e1e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     e22:	ea4f 130c 	mov.w	r3, ip, lsl #4
     e26:	f880 20a8 	strb.w	r2, [r0, #168]	@ 0xa8
     e2a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     e2e:	f880 20a9 	strb.w	r2, [r0, #169]	@ 0xa9
     e32:	ea4f 121c 	mov.w	r2, ip, lsr #4
     e36:	f880 20aa 	strb.w	r2, [r0, #170]	@ 0xaa
     e3a:	f9b1 20e4 	ldrsh.w	r2, [r1, #228]	@ 0xe4
     e3e:	f9b1 c0e6 	ldrsh.w	ip, [r1, #230]	@ 0xe6
     e42:	2a00      	cmp	r2, #0
     e44:	bf48      	it	mi
     e46:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     e4a:	f1bc 0f00 	cmp.w	ip, #0
     e4e:	bf48      	it	mi
     e50:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     e54:	ea4f 130c 	mov.w	r3, ip, lsl #4
     e58:	f880 20ab 	strb.w	r2, [r0, #171]	@ 0xab
     e5c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     e60:	f880 20ac 	strb.w	r2, [r0, #172]	@ 0xac
     e64:	ea4f 121c 	mov.w	r2, ip, lsr #4
     e68:	f880 20ad 	strb.w	r2, [r0, #173]	@ 0xad
     e6c:	f9b1 20e8 	ldrsh.w	r2, [r1, #232]	@ 0xe8
     e70:	f9b1 c0ea 	ldrsh.w	ip, [r1, #234]	@ 0xea
     e74:	2a00      	cmp	r2, #0
     e76:	bf48      	it	mi
     e78:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     e7c:	f1bc 0f00 	cmp.w	ip, #0
     e80:	bf48      	it	mi
     e82:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     e86:	ea4f 130c 	mov.w	r3, ip, lsl #4
     e8a:	f880 20ae 	strb.w	r2, [r0, #174]	@ 0xae
     e8e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     e92:	f880 20af 	strb.w	r2, [r0, #175]	@ 0xaf
     e96:	ea4f 121c 	mov.w	r2, ip, lsr #4
     e9a:	f880 20b0 	strb.w	r2, [r0, #176]	@ 0xb0
     e9e:	f9b1 20ec 	ldrsh.w	r2, [r1, #236]	@ 0xec
     ea2:	f9b1 c0ee 	ldrsh.w	ip, [r1, #238]	@ 0xee
     ea6:	2a00      	cmp	r2, #0
     ea8:	bf48      	it	mi
     eaa:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     eae:	f1bc 0f00 	cmp.w	ip, #0
     eb2:	bf48      	it	mi
     eb4:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     eb8:	ea4f 130c 	mov.w	r3, ip, lsl #4
     ebc:	f880 20b1 	strb.w	r2, [r0, #177]	@ 0xb1
     ec0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     ec4:	f880 20b2 	strb.w	r2, [r0, #178]	@ 0xb2
     ec8:	ea4f 121c 	mov.w	r2, ip, lsr #4
     ecc:	f880 20b3 	strb.w	r2, [r0, #179]	@ 0xb3
     ed0:	f9b1 20f0 	ldrsh.w	r2, [r1, #240]	@ 0xf0
     ed4:	f9b1 c0f2 	ldrsh.w	ip, [r1, #242]	@ 0xf2
     ed8:	2a00      	cmp	r2, #0
     eda:	bf48      	it	mi
     edc:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     ee0:	f1bc 0f00 	cmp.w	ip, #0
     ee4:	bf48      	it	mi
     ee6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     eea:	ea4f 130c 	mov.w	r3, ip, lsl #4
     eee:	f880 20b4 	strb.w	r2, [r0, #180]	@ 0xb4
     ef2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     ef6:	f880 20b5 	strb.w	r2, [r0, #181]	@ 0xb5
     efa:	ea4f 121c 	mov.w	r2, ip, lsr #4
     efe:	f880 20b6 	strb.w	r2, [r0, #182]	@ 0xb6
     f02:	f9b1 20f4 	ldrsh.w	r2, [r1, #244]	@ 0xf4
     f06:	f9b1 c0f6 	ldrsh.w	ip, [r1, #246]	@ 0xf6
     f0a:	2a00      	cmp	r2, #0
     f0c:	bf48      	it	mi
     f0e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     f12:	f1bc 0f00 	cmp.w	ip, #0
     f16:	bf48      	it	mi
     f18:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     f1c:	ea4f 130c 	mov.w	r3, ip, lsl #4
     f20:	f880 20b7 	strb.w	r2, [r0, #183]	@ 0xb7
     f24:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     f28:	f880 20b8 	strb.w	r2, [r0, #184]	@ 0xb8
     f2c:	ea4f 121c 	mov.w	r2, ip, lsr #4
     f30:	f880 20b9 	strb.w	r2, [r0, #185]	@ 0xb9
     f34:	f9b1 20f8 	ldrsh.w	r2, [r1, #248]	@ 0xf8
     f38:	f9b1 c0fa 	ldrsh.w	ip, [r1, #250]	@ 0xfa
     f3c:	2a00      	cmp	r2, #0
     f3e:	bf48      	it	mi
     f40:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     f44:	f1bc 0f00 	cmp.w	ip, #0
     f48:	bf48      	it	mi
     f4a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     f4e:	ea4f 130c 	mov.w	r3, ip, lsl #4
     f52:	f880 20ba 	strb.w	r2, [r0, #186]	@ 0xba
     f56:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     f5a:	f880 20bb 	strb.w	r2, [r0, #187]	@ 0xbb
     f5e:	ea4f 121c 	mov.w	r2, ip, lsr #4
     f62:	f880 20bc 	strb.w	r2, [r0, #188]	@ 0xbc
     f66:	f9b1 20fc 	ldrsh.w	r2, [r1, #252]	@ 0xfc
     f6a:	f9b1 c0fe 	ldrsh.w	ip, [r1, #254]	@ 0xfe
     f6e:	2a00      	cmp	r2, #0
     f70:	bf48      	it	mi
     f72:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     f76:	f1bc 0f00 	cmp.w	ip, #0
     f7a:	bf48      	it	mi
     f7c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     f80:	ea4f 130c 	mov.w	r3, ip, lsl #4
     f84:	f880 20bd 	strb.w	r2, [r0, #189]	@ 0xbd
     f88:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     f8c:	f880 20be 	strb.w	r2, [r0, #190]	@ 0xbe
     f90:	ea4f 121c 	mov.w	r2, ip, lsr #4
     f94:	f880 20bf 	strb.w	r2, [r0, #191]	@ 0xbf
     f98:	f9b1 2100 	ldrsh.w	r2, [r1, #256]	@ 0x100
     f9c:	f9b1 c102 	ldrsh.w	ip, [r1, #258]	@ 0x102
     fa0:	2a00      	cmp	r2, #0
     fa2:	bf48      	it	mi
     fa4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     fa8:	f1bc 0f00 	cmp.w	ip, #0
     fac:	bf48      	it	mi
     fae:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     fb2:	ea4f 130c 	mov.w	r3, ip, lsl #4
     fb6:	f880 20c0 	strb.w	r2, [r0, #192]	@ 0xc0
     fba:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     fbe:	f880 20c1 	strb.w	r2, [r0, #193]	@ 0xc1
     fc2:	ea4f 121c 	mov.w	r2, ip, lsr #4
     fc6:	f880 20c2 	strb.w	r2, [r0, #194]	@ 0xc2
     fca:	f9b1 2104 	ldrsh.w	r2, [r1, #260]	@ 0x104
     fce:	f9b1 c106 	ldrsh.w	ip, [r1, #262]	@ 0x106
     fd2:	2a00      	cmp	r2, #0
     fd4:	bf48      	it	mi
     fd6:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
     fda:	f1bc 0f00 	cmp.w	ip, #0
     fde:	bf48      	it	mi
     fe0:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
     fe4:	ea4f 130c 	mov.w	r3, ip, lsl #4
     fe8:	f880 20c3 	strb.w	r2, [r0, #195]	@ 0xc3
     fec:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
     ff0:	f880 20c4 	strb.w	r2, [r0, #196]	@ 0xc4
     ff4:	ea4f 121c 	mov.w	r2, ip, lsr #4
     ff8:	f880 20c5 	strb.w	r2, [r0, #197]	@ 0xc5
     ffc:	f9b1 2108 	ldrsh.w	r2, [r1, #264]	@ 0x108
    1000:	f9b1 c10a 	ldrsh.w	ip, [r1, #266]	@ 0x10a
    1004:	2a00      	cmp	r2, #0
    1006:	bf48      	it	mi
    1008:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    100c:	f1bc 0f00 	cmp.w	ip, #0
    1010:	bf48      	it	mi
    1012:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1016:	ea4f 130c 	mov.w	r3, ip, lsl #4
    101a:	f880 20c6 	strb.w	r2, [r0, #198]	@ 0xc6
    101e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1022:	f880 20c7 	strb.w	r2, [r0, #199]	@ 0xc7
    1026:	ea4f 121c 	mov.w	r2, ip, lsr #4
    102a:	f880 20c8 	strb.w	r2, [r0, #200]	@ 0xc8
    102e:	f9b1 210c 	ldrsh.w	r2, [r1, #268]	@ 0x10c
    1032:	f9b1 c10e 	ldrsh.w	ip, [r1, #270]	@ 0x10e
    1036:	2a00      	cmp	r2, #0
    1038:	bf48      	it	mi
    103a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    103e:	f1bc 0f00 	cmp.w	ip, #0
    1042:	bf48      	it	mi
    1044:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1048:	ea4f 130c 	mov.w	r3, ip, lsl #4
    104c:	f880 20c9 	strb.w	r2, [r0, #201]	@ 0xc9
    1050:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1054:	f880 20ca 	strb.w	r2, [r0, #202]	@ 0xca
    1058:	ea4f 121c 	mov.w	r2, ip, lsr #4
    105c:	f880 20cb 	strb.w	r2, [r0, #203]	@ 0xcb
    1060:	f9b1 2110 	ldrsh.w	r2, [r1, #272]	@ 0x110
    1064:	f9b1 c112 	ldrsh.w	ip, [r1, #274]	@ 0x112
    1068:	2a00      	cmp	r2, #0
    106a:	bf48      	it	mi
    106c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1070:	f1bc 0f00 	cmp.w	ip, #0
    1074:	bf48      	it	mi
    1076:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    107a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    107e:	f880 20cc 	strb.w	r2, [r0, #204]	@ 0xcc
    1082:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1086:	f880 20cd 	strb.w	r2, [r0, #205]	@ 0xcd
    108a:	ea4f 121c 	mov.w	r2, ip, lsr #4
    108e:	f880 20ce 	strb.w	r2, [r0, #206]	@ 0xce
    1092:	f9b1 2114 	ldrsh.w	r2, [r1, #276]	@ 0x114
    1096:	f9b1 c116 	ldrsh.w	ip, [r1, #278]	@ 0x116
    109a:	2a00      	cmp	r2, #0
    109c:	bf48      	it	mi
    109e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    10a2:	f1bc 0f00 	cmp.w	ip, #0
    10a6:	bf48      	it	mi
    10a8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    10ac:	ea4f 130c 	mov.w	r3, ip, lsl #4
    10b0:	f880 20cf 	strb.w	r2, [r0, #207]	@ 0xcf
    10b4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    10b8:	f880 20d0 	strb.w	r2, [r0, #208]	@ 0xd0
    10bc:	ea4f 121c 	mov.w	r2, ip, lsr #4
    10c0:	f880 20d1 	strb.w	r2, [r0, #209]	@ 0xd1
    10c4:	f9b1 2118 	ldrsh.w	r2, [r1, #280]	@ 0x118
    10c8:	f9b1 c11a 	ldrsh.w	ip, [r1, #282]	@ 0x11a
    10cc:	2a00      	cmp	r2, #0
    10ce:	bf48      	it	mi
    10d0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    10d4:	f1bc 0f00 	cmp.w	ip, #0
    10d8:	bf48      	it	mi
    10da:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    10de:	ea4f 130c 	mov.w	r3, ip, lsl #4
    10e2:	f880 20d2 	strb.w	r2, [r0, #210]	@ 0xd2
    10e6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    10ea:	f880 20d3 	strb.w	r2, [r0, #211]	@ 0xd3
    10ee:	ea4f 121c 	mov.w	r2, ip, lsr #4
    10f2:	f880 20d4 	strb.w	r2, [r0, #212]	@ 0xd4
    10f6:	f9b1 211c 	ldrsh.w	r2, [r1, #284]	@ 0x11c
    10fa:	f9b1 c11e 	ldrsh.w	ip, [r1, #286]	@ 0x11e
    10fe:	2a00      	cmp	r2, #0
    1100:	bf48      	it	mi
    1102:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1106:	f1bc 0f00 	cmp.w	ip, #0
    110a:	bf48      	it	mi
    110c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1110:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1114:	f880 20d5 	strb.w	r2, [r0, #213]	@ 0xd5
    1118:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    111c:	f880 20d6 	strb.w	r2, [r0, #214]	@ 0xd6
    1120:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1124:	f880 20d7 	strb.w	r2, [r0, #215]	@ 0xd7
    1128:	f9b1 2120 	ldrsh.w	r2, [r1, #288]	@ 0x120
    112c:	f9b1 c122 	ldrsh.w	ip, [r1, #290]	@ 0x122
    1130:	2a00      	cmp	r2, #0
    1132:	bf48      	it	mi
    1134:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1138:	f1bc 0f00 	cmp.w	ip, #0
    113c:	bf48      	it	mi
    113e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1142:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1146:	f880 20d8 	strb.w	r2, [r0, #216]	@ 0xd8
    114a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    114e:	f880 20d9 	strb.w	r2, [r0, #217]	@ 0xd9
    1152:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1156:	f880 20da 	strb.w	r2, [r0, #218]	@ 0xda
    115a:	f9b1 2124 	ldrsh.w	r2, [r1, #292]	@ 0x124
    115e:	f9b1 c126 	ldrsh.w	ip, [r1, #294]	@ 0x126
    1162:	2a00      	cmp	r2, #0
    1164:	bf48      	it	mi
    1166:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    116a:	f1bc 0f00 	cmp.w	ip, #0
    116e:	bf48      	it	mi
    1170:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1174:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1178:	f880 20db 	strb.w	r2, [r0, #219]	@ 0xdb
    117c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1180:	f880 20dc 	strb.w	r2, [r0, #220]	@ 0xdc
    1184:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1188:	f880 20dd 	strb.w	r2, [r0, #221]	@ 0xdd
    118c:	f9b1 2128 	ldrsh.w	r2, [r1, #296]	@ 0x128
    1190:	f9b1 c12a 	ldrsh.w	ip, [r1, #298]	@ 0x12a
    1194:	2a00      	cmp	r2, #0
    1196:	bf48      	it	mi
    1198:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    119c:	f1bc 0f00 	cmp.w	ip, #0
    11a0:	bf48      	it	mi
    11a2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    11a6:	ea4f 130c 	mov.w	r3, ip, lsl #4
    11aa:	f880 20de 	strb.w	r2, [r0, #222]	@ 0xde
    11ae:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    11b2:	f880 20df 	strb.w	r2, [r0, #223]	@ 0xdf
    11b6:	ea4f 121c 	mov.w	r2, ip, lsr #4
    11ba:	f880 20e0 	strb.w	r2, [r0, #224]	@ 0xe0
    11be:	f9b1 212c 	ldrsh.w	r2, [r1, #300]	@ 0x12c
    11c2:	f9b1 c12e 	ldrsh.w	ip, [r1, #302]	@ 0x12e
    11c6:	2a00      	cmp	r2, #0
    11c8:	bf48      	it	mi
    11ca:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    11ce:	f1bc 0f00 	cmp.w	ip, #0
    11d2:	bf48      	it	mi
    11d4:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    11d8:	ea4f 130c 	mov.w	r3, ip, lsl #4
    11dc:	f880 20e1 	strb.w	r2, [r0, #225]	@ 0xe1
    11e0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    11e4:	f880 20e2 	strb.w	r2, [r0, #226]	@ 0xe2
    11e8:	ea4f 121c 	mov.w	r2, ip, lsr #4
    11ec:	f880 20e3 	strb.w	r2, [r0, #227]	@ 0xe3
    11f0:	f9b1 2130 	ldrsh.w	r2, [r1, #304]	@ 0x130
    11f4:	f9b1 c132 	ldrsh.w	ip, [r1, #306]	@ 0x132
    11f8:	2a00      	cmp	r2, #0
    11fa:	bf48      	it	mi
    11fc:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1200:	f1bc 0f00 	cmp.w	ip, #0
    1204:	bf48      	it	mi
    1206:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    120a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    120e:	f880 20e4 	strb.w	r2, [r0, #228]	@ 0xe4
    1212:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1216:	f880 20e5 	strb.w	r2, [r0, #229]	@ 0xe5
    121a:	ea4f 121c 	mov.w	r2, ip, lsr #4
    121e:	f880 20e6 	strb.w	r2, [r0, #230]	@ 0xe6
    1222:	f9b1 2134 	ldrsh.w	r2, [r1, #308]	@ 0x134
    1226:	f9b1 c136 	ldrsh.w	ip, [r1, #310]	@ 0x136
    122a:	2a00      	cmp	r2, #0
    122c:	bf48      	it	mi
    122e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1232:	f1bc 0f00 	cmp.w	ip, #0
    1236:	bf48      	it	mi
    1238:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    123c:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1240:	f880 20e7 	strb.w	r2, [r0, #231]	@ 0xe7
    1244:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1248:	f880 20e8 	strb.w	r2, [r0, #232]	@ 0xe8
    124c:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1250:	f880 20e9 	strb.w	r2, [r0, #233]	@ 0xe9
    1254:	f9b1 2138 	ldrsh.w	r2, [r1, #312]	@ 0x138
    1258:	f9b1 c13a 	ldrsh.w	ip, [r1, #314]	@ 0x13a
    125c:	2a00      	cmp	r2, #0
    125e:	bf48      	it	mi
    1260:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1264:	f1bc 0f00 	cmp.w	ip, #0
    1268:	bf48      	it	mi
    126a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    126e:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1272:	f880 20ea 	strb.w	r2, [r0, #234]	@ 0xea
    1276:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    127a:	f880 20eb 	strb.w	r2, [r0, #235]	@ 0xeb
    127e:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1282:	f880 20ec 	strb.w	r2, [r0, #236]	@ 0xec
    1286:	f9b1 213c 	ldrsh.w	r2, [r1, #316]	@ 0x13c
    128a:	f9b1 c13e 	ldrsh.w	ip, [r1, #318]	@ 0x13e
    128e:	2a00      	cmp	r2, #0
    1290:	bf48      	it	mi
    1292:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1296:	f1bc 0f00 	cmp.w	ip, #0
    129a:	bf48      	it	mi
    129c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    12a0:	ea4f 130c 	mov.w	r3, ip, lsl #4
    12a4:	f880 20ed 	strb.w	r2, [r0, #237]	@ 0xed
    12a8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    12ac:	f880 20ee 	strb.w	r2, [r0, #238]	@ 0xee
    12b0:	ea4f 121c 	mov.w	r2, ip, lsr #4
    12b4:	f880 20ef 	strb.w	r2, [r0, #239]	@ 0xef
    12b8:	f9b1 2140 	ldrsh.w	r2, [r1, #320]	@ 0x140
    12bc:	f9b1 c142 	ldrsh.w	ip, [r1, #322]	@ 0x142
    12c0:	2a00      	cmp	r2, #0
    12c2:	bf48      	it	mi
    12c4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    12c8:	f1bc 0f00 	cmp.w	ip, #0
    12cc:	bf48      	it	mi
    12ce:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    12d2:	ea4f 130c 	mov.w	r3, ip, lsl #4
    12d6:	f880 20f0 	strb.w	r2, [r0, #240]	@ 0xf0
    12da:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    12de:	f880 20f1 	strb.w	r2, [r0, #241]	@ 0xf1
    12e2:	ea4f 121c 	mov.w	r2, ip, lsr #4
    12e6:	f880 20f2 	strb.w	r2, [r0, #242]	@ 0xf2
    12ea:	f9b1 2144 	ldrsh.w	r2, [r1, #324]	@ 0x144
    12ee:	f9b1 c146 	ldrsh.w	ip, [r1, #326]	@ 0x146
    12f2:	2a00      	cmp	r2, #0
    12f4:	bf48      	it	mi
    12f6:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    12fa:	f1bc 0f00 	cmp.w	ip, #0
    12fe:	bf48      	it	mi
    1300:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1304:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1308:	f880 20f3 	strb.w	r2, [r0, #243]	@ 0xf3
    130c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1310:	f880 20f4 	strb.w	r2, [r0, #244]	@ 0xf4
    1314:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1318:	f880 20f5 	strb.w	r2, [r0, #245]	@ 0xf5
    131c:	f9b1 2148 	ldrsh.w	r2, [r1, #328]	@ 0x148
    1320:	f9b1 c14a 	ldrsh.w	ip, [r1, #330]	@ 0x14a
    1324:	2a00      	cmp	r2, #0
    1326:	bf48      	it	mi
    1328:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    132c:	f1bc 0f00 	cmp.w	ip, #0
    1330:	bf48      	it	mi
    1332:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1336:	ea4f 130c 	mov.w	r3, ip, lsl #4
    133a:	f880 20f6 	strb.w	r2, [r0, #246]	@ 0xf6
    133e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1342:	f880 20f7 	strb.w	r2, [r0, #247]	@ 0xf7
    1346:	ea4f 121c 	mov.w	r2, ip, lsr #4
    134a:	f880 20f8 	strb.w	r2, [r0, #248]	@ 0xf8
    134e:	f9b1 214c 	ldrsh.w	r2, [r1, #332]	@ 0x14c
    1352:	f9b1 c14e 	ldrsh.w	ip, [r1, #334]	@ 0x14e
    1356:	2a00      	cmp	r2, #0
    1358:	bf48      	it	mi
    135a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    135e:	f1bc 0f00 	cmp.w	ip, #0
    1362:	bf48      	it	mi
    1364:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1368:	ea4f 130c 	mov.w	r3, ip, lsl #4
    136c:	f880 20f9 	strb.w	r2, [r0, #249]	@ 0xf9
    1370:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1374:	f880 20fa 	strb.w	r2, [r0, #250]	@ 0xfa
    1378:	ea4f 121c 	mov.w	r2, ip, lsr #4
    137c:	f880 20fb 	strb.w	r2, [r0, #251]	@ 0xfb
    1380:	f9b1 2150 	ldrsh.w	r2, [r1, #336]	@ 0x150
    1384:	f9b1 c152 	ldrsh.w	ip, [r1, #338]	@ 0x152
    1388:	2a00      	cmp	r2, #0
    138a:	bf48      	it	mi
    138c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1390:	f1bc 0f00 	cmp.w	ip, #0
    1394:	bf48      	it	mi
    1396:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    139a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    139e:	f880 20fc 	strb.w	r2, [r0, #252]	@ 0xfc
    13a2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    13a6:	f880 20fd 	strb.w	r2, [r0, #253]	@ 0xfd
    13aa:	ea4f 121c 	mov.w	r2, ip, lsr #4
    13ae:	f880 20fe 	strb.w	r2, [r0, #254]	@ 0xfe
    13b2:	f9b1 2154 	ldrsh.w	r2, [r1, #340]	@ 0x154
    13b6:	f9b1 c156 	ldrsh.w	ip, [r1, #342]	@ 0x156
    13ba:	2a00      	cmp	r2, #0
    13bc:	bf48      	it	mi
    13be:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    13c2:	f1bc 0f00 	cmp.w	ip, #0
    13c6:	bf48      	it	mi
    13c8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    13cc:	ea4f 130c 	mov.w	r3, ip, lsl #4
    13d0:	f880 20ff 	strb.w	r2, [r0, #255]	@ 0xff
    13d4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    13d8:	f880 2100 	strb.w	r2, [r0, #256]	@ 0x100
    13dc:	ea4f 121c 	mov.w	r2, ip, lsr #4
    13e0:	f880 2101 	strb.w	r2, [r0, #257]	@ 0x101
    13e4:	f9b1 2158 	ldrsh.w	r2, [r1, #344]	@ 0x158
    13e8:	f9b1 c15a 	ldrsh.w	ip, [r1, #346]	@ 0x15a
    13ec:	2a00      	cmp	r2, #0
    13ee:	bf48      	it	mi
    13f0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    13f4:	f1bc 0f00 	cmp.w	ip, #0
    13f8:	bf48      	it	mi
    13fa:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    13fe:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1402:	f880 2102 	strb.w	r2, [r0, #258]	@ 0x102
    1406:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    140a:	f880 2103 	strb.w	r2, [r0, #259]	@ 0x103
    140e:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1412:	f880 2104 	strb.w	r2, [r0, #260]	@ 0x104
    1416:	f9b1 215c 	ldrsh.w	r2, [r1, #348]	@ 0x15c
    141a:	f9b1 c15e 	ldrsh.w	ip, [r1, #350]	@ 0x15e
    141e:	2a00      	cmp	r2, #0
    1420:	bf48      	it	mi
    1422:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1426:	f1bc 0f00 	cmp.w	ip, #0
    142a:	bf48      	it	mi
    142c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1430:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1434:	f880 2105 	strb.w	r2, [r0, #261]	@ 0x105
    1438:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    143c:	f880 2106 	strb.w	r2, [r0, #262]	@ 0x106
    1440:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1444:	f880 2107 	strb.w	r2, [r0, #263]	@ 0x107
    1448:	f9b1 2160 	ldrsh.w	r2, [r1, #352]	@ 0x160
    144c:	f9b1 c162 	ldrsh.w	ip, [r1, #354]	@ 0x162
    1450:	2a00      	cmp	r2, #0
    1452:	bf48      	it	mi
    1454:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1458:	f1bc 0f00 	cmp.w	ip, #0
    145c:	bf48      	it	mi
    145e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1462:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1466:	f880 2108 	strb.w	r2, [r0, #264]	@ 0x108
    146a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    146e:	f880 2109 	strb.w	r2, [r0, #265]	@ 0x109
    1472:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1476:	f880 210a 	strb.w	r2, [r0, #266]	@ 0x10a
    147a:	f9b1 2164 	ldrsh.w	r2, [r1, #356]	@ 0x164
    147e:	f9b1 c166 	ldrsh.w	ip, [r1, #358]	@ 0x166
    1482:	2a00      	cmp	r2, #0
    1484:	bf48      	it	mi
    1486:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    148a:	f1bc 0f00 	cmp.w	ip, #0
    148e:	bf48      	it	mi
    1490:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1494:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1498:	f880 210b 	strb.w	r2, [r0, #267]	@ 0x10b
    149c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    14a0:	f880 210c 	strb.w	r2, [r0, #268]	@ 0x10c
    14a4:	ea4f 121c 	mov.w	r2, ip, lsr #4
    14a8:	f880 210d 	strb.w	r2, [r0, #269]	@ 0x10d
    14ac:	f9b1 2168 	ldrsh.w	r2, [r1, #360]	@ 0x168
    14b0:	f9b1 c16a 	ldrsh.w	ip, [r1, #362]	@ 0x16a
    14b4:	2a00      	cmp	r2, #0
    14b6:	bf48      	it	mi
    14b8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    14bc:	f1bc 0f00 	cmp.w	ip, #0
    14c0:	bf48      	it	mi
    14c2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    14c6:	ea4f 130c 	mov.w	r3, ip, lsl #4
    14ca:	f880 210e 	strb.w	r2, [r0, #270]	@ 0x10e
    14ce:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    14d2:	f880 210f 	strb.w	r2, [r0, #271]	@ 0x10f
    14d6:	ea4f 121c 	mov.w	r2, ip, lsr #4
    14da:	f880 2110 	strb.w	r2, [r0, #272]	@ 0x110
    14de:	f9b1 216c 	ldrsh.w	r2, [r1, #364]	@ 0x16c
    14e2:	f9b1 c16e 	ldrsh.w	ip, [r1, #366]	@ 0x16e
    14e6:	2a00      	cmp	r2, #0
    14e8:	bf48      	it	mi
    14ea:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    14ee:	f1bc 0f00 	cmp.w	ip, #0
    14f2:	bf48      	it	mi
    14f4:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    14f8:	ea4f 130c 	mov.w	r3, ip, lsl #4
    14fc:	f880 2111 	strb.w	r2, [r0, #273]	@ 0x111
    1500:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1504:	f880 2112 	strb.w	r2, [r0, #274]	@ 0x112
    1508:	ea4f 121c 	mov.w	r2, ip, lsr #4
    150c:	f880 2113 	strb.w	r2, [r0, #275]	@ 0x113
    1510:	f9b1 2170 	ldrsh.w	r2, [r1, #368]	@ 0x170
    1514:	f9b1 c172 	ldrsh.w	ip, [r1, #370]	@ 0x172
    1518:	2a00      	cmp	r2, #0
    151a:	bf48      	it	mi
    151c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1520:	f1bc 0f00 	cmp.w	ip, #0
    1524:	bf48      	it	mi
    1526:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    152a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    152e:	f880 2114 	strb.w	r2, [r0, #276]	@ 0x114
    1532:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1536:	f880 2115 	strb.w	r2, [r0, #277]	@ 0x115
    153a:	ea4f 121c 	mov.w	r2, ip, lsr #4
    153e:	f880 2116 	strb.w	r2, [r0, #278]	@ 0x116
    1542:	f9b1 2174 	ldrsh.w	r2, [r1, #372]	@ 0x174
    1546:	f9b1 c176 	ldrsh.w	ip, [r1, #374]	@ 0x176
    154a:	2a00      	cmp	r2, #0
    154c:	bf48      	it	mi
    154e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1552:	f1bc 0f00 	cmp.w	ip, #0
    1556:	bf48      	it	mi
    1558:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    155c:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1560:	f880 2117 	strb.w	r2, [r0, #279]	@ 0x117
    1564:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1568:	f880 2118 	strb.w	r2, [r0, #280]	@ 0x118
    156c:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1570:	f880 2119 	strb.w	r2, [r0, #281]	@ 0x119
    1574:	f9b1 2178 	ldrsh.w	r2, [r1, #376]	@ 0x178
    1578:	f9b1 c17a 	ldrsh.w	ip, [r1, #378]	@ 0x17a
    157c:	2a00      	cmp	r2, #0
    157e:	bf48      	it	mi
    1580:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1584:	f1bc 0f00 	cmp.w	ip, #0
    1588:	bf48      	it	mi
    158a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    158e:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1592:	f880 211a 	strb.w	r2, [r0, #282]	@ 0x11a
    1596:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    159a:	f880 211b 	strb.w	r2, [r0, #283]	@ 0x11b
    159e:	ea4f 121c 	mov.w	r2, ip, lsr #4
    15a2:	f880 211c 	strb.w	r2, [r0, #284]	@ 0x11c
    15a6:	f9b1 217c 	ldrsh.w	r2, [r1, #380]	@ 0x17c
    15aa:	f9b1 c17e 	ldrsh.w	ip, [r1, #382]	@ 0x17e
    15ae:	2a00      	cmp	r2, #0
    15b0:	bf48      	it	mi
    15b2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    15b6:	f1bc 0f00 	cmp.w	ip, #0
    15ba:	bf48      	it	mi
    15bc:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    15c0:	ea4f 130c 	mov.w	r3, ip, lsl #4
    15c4:	f880 211d 	strb.w	r2, [r0, #285]	@ 0x11d
    15c8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    15cc:	f880 211e 	strb.w	r2, [r0, #286]	@ 0x11e
    15d0:	ea4f 121c 	mov.w	r2, ip, lsr #4
    15d4:	f880 211f 	strb.w	r2, [r0, #287]	@ 0x11f
    15d8:	f9b1 2180 	ldrsh.w	r2, [r1, #384]	@ 0x180
    15dc:	f9b1 c182 	ldrsh.w	ip, [r1, #386]	@ 0x182
    15e0:	2a00      	cmp	r2, #0
    15e2:	bf48      	it	mi
    15e4:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    15e8:	f1bc 0f00 	cmp.w	ip, #0
    15ec:	bf48      	it	mi
    15ee:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    15f2:	ea4f 130c 	mov.w	r3, ip, lsl #4
    15f6:	f880 2120 	strb.w	r2, [r0, #288]	@ 0x120
    15fa:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    15fe:	f880 2121 	strb.w	r2, [r0, #289]	@ 0x121
    1602:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1606:	f880 2122 	strb.w	r2, [r0, #290]	@ 0x122
    160a:	f9b1 2184 	ldrsh.w	r2, [r1, #388]	@ 0x184
    160e:	f9b1 c186 	ldrsh.w	ip, [r1, #390]	@ 0x186
    1612:	2a00      	cmp	r2, #0
    1614:	bf48      	it	mi
    1616:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    161a:	f1bc 0f00 	cmp.w	ip, #0
    161e:	bf48      	it	mi
    1620:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1624:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1628:	f880 2123 	strb.w	r2, [r0, #291]	@ 0x123
    162c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1630:	f880 2124 	strb.w	r2, [r0, #292]	@ 0x124
    1634:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1638:	f880 2125 	strb.w	r2, [r0, #293]	@ 0x125
    163c:	f9b1 2188 	ldrsh.w	r2, [r1, #392]	@ 0x188
    1640:	f9b1 c18a 	ldrsh.w	ip, [r1, #394]	@ 0x18a
    1644:	2a00      	cmp	r2, #0
    1646:	bf48      	it	mi
    1648:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    164c:	f1bc 0f00 	cmp.w	ip, #0
    1650:	bf48      	it	mi
    1652:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1656:	ea4f 130c 	mov.w	r3, ip, lsl #4
    165a:	f880 2126 	strb.w	r2, [r0, #294]	@ 0x126
    165e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1662:	f880 2127 	strb.w	r2, [r0, #295]	@ 0x127
    1666:	ea4f 121c 	mov.w	r2, ip, lsr #4
    166a:	f880 2128 	strb.w	r2, [r0, #296]	@ 0x128
    166e:	f9b1 218c 	ldrsh.w	r2, [r1, #396]	@ 0x18c
    1672:	f9b1 c18e 	ldrsh.w	ip, [r1, #398]	@ 0x18e
    1676:	2a00      	cmp	r2, #0
    1678:	bf48      	it	mi
    167a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    167e:	f1bc 0f00 	cmp.w	ip, #0
    1682:	bf48      	it	mi
    1684:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1688:	ea4f 130c 	mov.w	r3, ip, lsl #4
    168c:	f880 2129 	strb.w	r2, [r0, #297]	@ 0x129
    1690:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1694:	f880 212a 	strb.w	r2, [r0, #298]	@ 0x12a
    1698:	ea4f 121c 	mov.w	r2, ip, lsr #4
    169c:	f880 212b 	strb.w	r2, [r0, #299]	@ 0x12b
    16a0:	f9b1 2190 	ldrsh.w	r2, [r1, #400]	@ 0x190
    16a4:	f9b1 c192 	ldrsh.w	ip, [r1, #402]	@ 0x192
    16a8:	2a00      	cmp	r2, #0
    16aa:	bf48      	it	mi
    16ac:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    16b0:	f1bc 0f00 	cmp.w	ip, #0
    16b4:	bf48      	it	mi
    16b6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    16ba:	ea4f 130c 	mov.w	r3, ip, lsl #4
    16be:	f880 212c 	strb.w	r2, [r0, #300]	@ 0x12c
    16c2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    16c6:	f880 212d 	strb.w	r2, [r0, #301]	@ 0x12d
    16ca:	ea4f 121c 	mov.w	r2, ip, lsr #4
    16ce:	f880 212e 	strb.w	r2, [r0, #302]	@ 0x12e
    16d2:	f9b1 2194 	ldrsh.w	r2, [r1, #404]	@ 0x194
    16d6:	f9b1 c196 	ldrsh.w	ip, [r1, #406]	@ 0x196
    16da:	2a00      	cmp	r2, #0
    16dc:	bf48      	it	mi
    16de:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    16e2:	f1bc 0f00 	cmp.w	ip, #0
    16e6:	bf48      	it	mi
    16e8:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    16ec:	ea4f 130c 	mov.w	r3, ip, lsl #4
    16f0:	f880 212f 	strb.w	r2, [r0, #303]	@ 0x12f
    16f4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    16f8:	f880 2130 	strb.w	r2, [r0, #304]	@ 0x130
    16fc:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1700:	f880 2131 	strb.w	r2, [r0, #305]	@ 0x131
    1704:	f9b1 2198 	ldrsh.w	r2, [r1, #408]	@ 0x198
    1708:	f9b1 c19a 	ldrsh.w	ip, [r1, #410]	@ 0x19a
    170c:	2a00      	cmp	r2, #0
    170e:	bf48      	it	mi
    1710:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1714:	f1bc 0f00 	cmp.w	ip, #0
    1718:	bf48      	it	mi
    171a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    171e:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1722:	f880 2132 	strb.w	r2, [r0, #306]	@ 0x132
    1726:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    172a:	f880 2133 	strb.w	r2, [r0, #307]	@ 0x133
    172e:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1732:	f880 2134 	strb.w	r2, [r0, #308]	@ 0x134
    1736:	f9b1 219c 	ldrsh.w	r2, [r1, #412]	@ 0x19c
    173a:	f9b1 c19e 	ldrsh.w	ip, [r1, #414]	@ 0x19e
    173e:	2a00      	cmp	r2, #0
    1740:	bf48      	it	mi
    1742:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1746:	f1bc 0f00 	cmp.w	ip, #0
    174a:	bf48      	it	mi
    174c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1750:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1754:	f880 2135 	strb.w	r2, [r0, #309]	@ 0x135
    1758:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    175c:	f880 2136 	strb.w	r2, [r0, #310]	@ 0x136
    1760:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1764:	f880 2137 	strb.w	r2, [r0, #311]	@ 0x137
    1768:	f9b1 21a0 	ldrsh.w	r2, [r1, #416]	@ 0x1a0
    176c:	f9b1 c1a2 	ldrsh.w	ip, [r1, #418]	@ 0x1a2
    1770:	2a00      	cmp	r2, #0
    1772:	bf48      	it	mi
    1774:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1778:	f1bc 0f00 	cmp.w	ip, #0
    177c:	bf48      	it	mi
    177e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1782:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1786:	f880 2138 	strb.w	r2, [r0, #312]	@ 0x138
    178a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    178e:	f880 2139 	strb.w	r2, [r0, #313]	@ 0x139
    1792:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1796:	f880 213a 	strb.w	r2, [r0, #314]	@ 0x13a
    179a:	f9b1 21a4 	ldrsh.w	r2, [r1, #420]	@ 0x1a4
    179e:	f9b1 c1a6 	ldrsh.w	ip, [r1, #422]	@ 0x1a6
    17a2:	2a00      	cmp	r2, #0
    17a4:	bf48      	it	mi
    17a6:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    17aa:	f1bc 0f00 	cmp.w	ip, #0
    17ae:	bf48      	it	mi
    17b0:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    17b4:	ea4f 130c 	mov.w	r3, ip, lsl #4
    17b8:	f880 213b 	strb.w	r2, [r0, #315]	@ 0x13b
    17bc:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    17c0:	f880 213c 	strb.w	r2, [r0, #316]	@ 0x13c
    17c4:	ea4f 121c 	mov.w	r2, ip, lsr #4
    17c8:	f880 213d 	strb.w	r2, [r0, #317]	@ 0x13d
    17cc:	f9b1 21a8 	ldrsh.w	r2, [r1, #424]	@ 0x1a8
    17d0:	f9b1 c1aa 	ldrsh.w	ip, [r1, #426]	@ 0x1aa
    17d4:	2a00      	cmp	r2, #0
    17d6:	bf48      	it	mi
    17d8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    17dc:	f1bc 0f00 	cmp.w	ip, #0
    17e0:	bf48      	it	mi
    17e2:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    17e6:	ea4f 130c 	mov.w	r3, ip, lsl #4
    17ea:	f880 213e 	strb.w	r2, [r0, #318]	@ 0x13e
    17ee:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    17f2:	f880 213f 	strb.w	r2, [r0, #319]	@ 0x13f
    17f6:	ea4f 121c 	mov.w	r2, ip, lsr #4
    17fa:	f880 2140 	strb.w	r2, [r0, #320]	@ 0x140
    17fe:	f9b1 21ac 	ldrsh.w	r2, [r1, #428]	@ 0x1ac
    1802:	f9b1 c1ae 	ldrsh.w	ip, [r1, #430]	@ 0x1ae
    1806:	2a00      	cmp	r2, #0
    1808:	bf48      	it	mi
    180a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    180e:	f1bc 0f00 	cmp.w	ip, #0
    1812:	bf48      	it	mi
    1814:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1818:	ea4f 130c 	mov.w	r3, ip, lsl #4
    181c:	f880 2141 	strb.w	r2, [r0, #321]	@ 0x141
    1820:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1824:	f880 2142 	strb.w	r2, [r0, #322]	@ 0x142
    1828:	ea4f 121c 	mov.w	r2, ip, lsr #4
    182c:	f880 2143 	strb.w	r2, [r0, #323]	@ 0x143
    1830:	f9b1 21b0 	ldrsh.w	r2, [r1, #432]	@ 0x1b0
    1834:	f9b1 c1b2 	ldrsh.w	ip, [r1, #434]	@ 0x1b2
    1838:	2a00      	cmp	r2, #0
    183a:	bf48      	it	mi
    183c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1840:	f1bc 0f00 	cmp.w	ip, #0
    1844:	bf48      	it	mi
    1846:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    184a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    184e:	f880 2144 	strb.w	r2, [r0, #324]	@ 0x144
    1852:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1856:	f880 2145 	strb.w	r2, [r0, #325]	@ 0x145
    185a:	ea4f 121c 	mov.w	r2, ip, lsr #4
    185e:	f880 2146 	strb.w	r2, [r0, #326]	@ 0x146
    1862:	f9b1 21b4 	ldrsh.w	r2, [r1, #436]	@ 0x1b4
    1866:	f9b1 c1b6 	ldrsh.w	ip, [r1, #438]	@ 0x1b6
    186a:	2a00      	cmp	r2, #0
    186c:	bf48      	it	mi
    186e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1872:	f1bc 0f00 	cmp.w	ip, #0
    1876:	bf48      	it	mi
    1878:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    187c:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1880:	f880 2147 	strb.w	r2, [r0, #327]	@ 0x147
    1884:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1888:	f880 2148 	strb.w	r2, [r0, #328]	@ 0x148
    188c:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1890:	f880 2149 	strb.w	r2, [r0, #329]	@ 0x149
    1894:	f9b1 21b8 	ldrsh.w	r2, [r1, #440]	@ 0x1b8
    1898:	f9b1 c1ba 	ldrsh.w	ip, [r1, #442]	@ 0x1ba
    189c:	2a00      	cmp	r2, #0
    189e:	bf48      	it	mi
    18a0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    18a4:	f1bc 0f00 	cmp.w	ip, #0
    18a8:	bf48      	it	mi
    18aa:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    18ae:	ea4f 130c 	mov.w	r3, ip, lsl #4
    18b2:	f880 214a 	strb.w	r2, [r0, #330]	@ 0x14a
    18b6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    18ba:	f880 214b 	strb.w	r2, [r0, #331]	@ 0x14b
    18be:	ea4f 121c 	mov.w	r2, ip, lsr #4
    18c2:	f880 214c 	strb.w	r2, [r0, #332]	@ 0x14c
    18c6:	f9b1 21bc 	ldrsh.w	r2, [r1, #444]	@ 0x1bc
    18ca:	f9b1 c1be 	ldrsh.w	ip, [r1, #446]	@ 0x1be
    18ce:	2a00      	cmp	r2, #0
    18d0:	bf48      	it	mi
    18d2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    18d6:	f1bc 0f00 	cmp.w	ip, #0
    18da:	bf48      	it	mi
    18dc:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    18e0:	ea4f 130c 	mov.w	r3, ip, lsl #4
    18e4:	f880 214d 	strb.w	r2, [r0, #333]	@ 0x14d
    18e8:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    18ec:	f880 214e 	strb.w	r2, [r0, #334]	@ 0x14e
    18f0:	ea4f 121c 	mov.w	r2, ip, lsr #4
    18f4:	f880 214f 	strb.w	r2, [r0, #335]	@ 0x14f
    18f8:	f9b1 21c0 	ldrsh.w	r2, [r1, #448]	@ 0x1c0
    18fc:	f9b1 c1c2 	ldrsh.w	ip, [r1, #450]	@ 0x1c2
    1900:	2a00      	cmp	r2, #0
    1902:	bf48      	it	mi
    1904:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1908:	f1bc 0f00 	cmp.w	ip, #0
    190c:	bf48      	it	mi
    190e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1912:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1916:	f880 2150 	strb.w	r2, [r0, #336]	@ 0x150
    191a:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    191e:	f880 2151 	strb.w	r2, [r0, #337]	@ 0x151
    1922:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1926:	f880 2152 	strb.w	r2, [r0, #338]	@ 0x152
    192a:	f9b1 21c4 	ldrsh.w	r2, [r1, #452]	@ 0x1c4
    192e:	f9b1 c1c6 	ldrsh.w	ip, [r1, #454]	@ 0x1c6
    1932:	2a00      	cmp	r2, #0
    1934:	bf48      	it	mi
    1936:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    193a:	f1bc 0f00 	cmp.w	ip, #0
    193e:	bf48      	it	mi
    1940:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1944:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1948:	f880 2153 	strb.w	r2, [r0, #339]	@ 0x153
    194c:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1950:	f880 2154 	strb.w	r2, [r0, #340]	@ 0x154
    1954:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1958:	f880 2155 	strb.w	r2, [r0, #341]	@ 0x155
    195c:	f9b1 21c8 	ldrsh.w	r2, [r1, #456]	@ 0x1c8
    1960:	f9b1 c1ca 	ldrsh.w	ip, [r1, #458]	@ 0x1ca
    1964:	2a00      	cmp	r2, #0
    1966:	bf48      	it	mi
    1968:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    196c:	f1bc 0f00 	cmp.w	ip, #0
    1970:	bf48      	it	mi
    1972:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1976:	ea4f 130c 	mov.w	r3, ip, lsl #4
    197a:	f880 2156 	strb.w	r2, [r0, #342]	@ 0x156
    197e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1982:	f880 2157 	strb.w	r2, [r0, #343]	@ 0x157
    1986:	ea4f 121c 	mov.w	r2, ip, lsr #4
    198a:	f880 2158 	strb.w	r2, [r0, #344]	@ 0x158
    198e:	f9b1 21cc 	ldrsh.w	r2, [r1, #460]	@ 0x1cc
    1992:	f9b1 c1ce 	ldrsh.w	ip, [r1, #462]	@ 0x1ce
    1996:	2a00      	cmp	r2, #0
    1998:	bf48      	it	mi
    199a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    199e:	f1bc 0f00 	cmp.w	ip, #0
    19a2:	bf48      	it	mi
    19a4:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    19a8:	ea4f 130c 	mov.w	r3, ip, lsl #4
    19ac:	f880 2159 	strb.w	r2, [r0, #345]	@ 0x159
    19b0:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    19b4:	f880 215a 	strb.w	r2, [r0, #346]	@ 0x15a
    19b8:	ea4f 121c 	mov.w	r2, ip, lsr #4
    19bc:	f880 215b 	strb.w	r2, [r0, #347]	@ 0x15b
    19c0:	f9b1 21d0 	ldrsh.w	r2, [r1, #464]	@ 0x1d0
    19c4:	f9b1 c1d2 	ldrsh.w	ip, [r1, #466]	@ 0x1d2
    19c8:	2a00      	cmp	r2, #0
    19ca:	bf48      	it	mi
    19cc:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    19d0:	f1bc 0f00 	cmp.w	ip, #0
    19d4:	bf48      	it	mi
    19d6:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    19da:	ea4f 130c 	mov.w	r3, ip, lsl #4
    19de:	f880 215c 	strb.w	r2, [r0, #348]	@ 0x15c
    19e2:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    19e6:	f880 215d 	strb.w	r2, [r0, #349]	@ 0x15d
    19ea:	ea4f 121c 	mov.w	r2, ip, lsr #4
    19ee:	f880 215e 	strb.w	r2, [r0, #350]	@ 0x15e
    19f2:	f9b1 21d4 	ldrsh.w	r2, [r1, #468]	@ 0x1d4
    19f6:	f9b1 c1d6 	ldrsh.w	ip, [r1, #470]	@ 0x1d6
    19fa:	2a00      	cmp	r2, #0
    19fc:	bf48      	it	mi
    19fe:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1a02:	f1bc 0f00 	cmp.w	ip, #0
    1a06:	bf48      	it	mi
    1a08:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1a0c:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1a10:	f880 215f 	strb.w	r2, [r0, #351]	@ 0x15f
    1a14:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1a18:	f880 2160 	strb.w	r2, [r0, #352]	@ 0x160
    1a1c:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1a20:	f880 2161 	strb.w	r2, [r0, #353]	@ 0x161
    1a24:	f9b1 21d8 	ldrsh.w	r2, [r1, #472]	@ 0x1d8
    1a28:	f9b1 c1da 	ldrsh.w	ip, [r1, #474]	@ 0x1da
    1a2c:	2a00      	cmp	r2, #0
    1a2e:	bf48      	it	mi
    1a30:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1a34:	f1bc 0f00 	cmp.w	ip, #0
    1a38:	bf48      	it	mi
    1a3a:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1a3e:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1a42:	f880 2162 	strb.w	r2, [r0, #354]	@ 0x162
    1a46:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1a4a:	f880 2163 	strb.w	r2, [r0, #355]	@ 0x163
    1a4e:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1a52:	f880 2164 	strb.w	r2, [r0, #356]	@ 0x164
    1a56:	f9b1 21dc 	ldrsh.w	r2, [r1, #476]	@ 0x1dc
    1a5a:	f9b1 c1de 	ldrsh.w	ip, [r1, #478]	@ 0x1de
    1a5e:	2a00      	cmp	r2, #0
    1a60:	bf48      	it	mi
    1a62:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1a66:	f1bc 0f00 	cmp.w	ip, #0
    1a6a:	bf48      	it	mi
    1a6c:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1a70:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1a74:	f880 2165 	strb.w	r2, [r0, #357]	@ 0x165
    1a78:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1a7c:	f880 2166 	strb.w	r2, [r0, #358]	@ 0x166
    1a80:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1a84:	f880 2167 	strb.w	r2, [r0, #359]	@ 0x167
    1a88:	f9b1 21e0 	ldrsh.w	r2, [r1, #480]	@ 0x1e0
    1a8c:	f9b1 c1e2 	ldrsh.w	ip, [r1, #482]	@ 0x1e2
    1a90:	2a00      	cmp	r2, #0
    1a92:	bf48      	it	mi
    1a94:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1a98:	f1bc 0f00 	cmp.w	ip, #0
    1a9c:	bf48      	it	mi
    1a9e:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1aa2:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1aa6:	f880 2168 	strb.w	r2, [r0, #360]	@ 0x168
    1aaa:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1aae:	f880 2169 	strb.w	r2, [r0, #361]	@ 0x169
    1ab2:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1ab6:	f880 216a 	strb.w	r2, [r0, #362]	@ 0x16a
    1aba:	f9b1 21e4 	ldrsh.w	r2, [r1, #484]	@ 0x1e4
    1abe:	f9b1 c1e6 	ldrsh.w	ip, [r1, #486]	@ 0x1e6
    1ac2:	2a00      	cmp	r2, #0
    1ac4:	bf48      	it	mi
    1ac6:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1aca:	f1bc 0f00 	cmp.w	ip, #0
    1ace:	bf48      	it	mi
    1ad0:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1ad4:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1ad8:	f880 216b 	strb.w	r2, [r0, #363]	@ 0x16b
    1adc:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1ae0:	f880 216c 	strb.w	r2, [r0, #364]	@ 0x16c
    1ae4:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1ae8:	f880 216d 	strb.w	r2, [r0, #365]	@ 0x16d
    1aec:	f9b1 21e8 	ldrsh.w	r2, [r1, #488]	@ 0x1e8
    1af0:	f9b1 c1ea 	ldrsh.w	ip, [r1, #490]	@ 0x1ea
    1af4:	2a00      	cmp	r2, #0
    1af6:	bf48      	it	mi
    1af8:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1afc:	f1bc 0f00 	cmp.w	ip, #0
    1b00:	bf48      	it	mi
    1b02:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1b06:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1b0a:	f880 216e 	strb.w	r2, [r0, #366]	@ 0x16e
    1b0e:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1b12:	f880 216f 	strb.w	r2, [r0, #367]	@ 0x16f
    1b16:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1b1a:	f880 2170 	strb.w	r2, [r0, #368]	@ 0x170
    1b1e:	f9b1 21ec 	ldrsh.w	r2, [r1, #492]	@ 0x1ec
    1b22:	f9b1 c1ee 	ldrsh.w	ip, [r1, #494]	@ 0x1ee
    1b26:	2a00      	cmp	r2, #0
    1b28:	bf48      	it	mi
    1b2a:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1b2e:	f1bc 0f00 	cmp.w	ip, #0
    1b32:	bf48      	it	mi
    1b34:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1b38:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1b3c:	f880 2171 	strb.w	r2, [r0, #369]	@ 0x171
    1b40:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1b44:	f880 2172 	strb.w	r2, [r0, #370]	@ 0x172
    1b48:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1b4c:	f880 2173 	strb.w	r2, [r0, #371]	@ 0x173
    1b50:	f9b1 21f0 	ldrsh.w	r2, [r1, #496]	@ 0x1f0
    1b54:	f9b1 c1f2 	ldrsh.w	ip, [r1, #498]	@ 0x1f2
    1b58:	2a00      	cmp	r2, #0
    1b5a:	bf48      	it	mi
    1b5c:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1b60:	f1bc 0f00 	cmp.w	ip, #0
    1b64:	bf48      	it	mi
    1b66:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1b6a:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1b6e:	f880 2174 	strb.w	r2, [r0, #372]	@ 0x174
    1b72:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1b76:	f880 2175 	strb.w	r2, [r0, #373]	@ 0x175
    1b7a:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1b7e:	f880 2176 	strb.w	r2, [r0, #374]	@ 0x176
    1b82:	f9b1 21f4 	ldrsh.w	r2, [r1, #500]	@ 0x1f4
    1b86:	f9b1 c1f6 	ldrsh.w	ip, [r1, #502]	@ 0x1f6
    1b8a:	2a00      	cmp	r2, #0
    1b8c:	bf48      	it	mi
    1b8e:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1b92:	f1bc 0f00 	cmp.w	ip, #0
    1b96:	bf48      	it	mi
    1b98:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1b9c:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1ba0:	f880 2177 	strb.w	r2, [r0, #375]	@ 0x177
    1ba4:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1ba8:	f880 2178 	strb.w	r2, [r0, #376]	@ 0x178
    1bac:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1bb0:	f880 2179 	strb.w	r2, [r0, #377]	@ 0x179
    1bb4:	f9b1 21f8 	ldrsh.w	r2, [r1, #504]	@ 0x1f8
    1bb8:	f9b1 c1fa 	ldrsh.w	ip, [r1, #506]	@ 0x1fa
    1bbc:	2a00      	cmp	r2, #0
    1bbe:	bf48      	it	mi
    1bc0:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1bc4:	f1bc 0f00 	cmp.w	ip, #0
    1bc8:	bf48      	it	mi
    1bca:	f60c 5c01 	addwmi	ip, ip, #3329	@ 0xd01
    1bce:	ea4f 130c 	mov.w	r3, ip, lsl #4
    1bd2:	f880 217a 	strb.w	r2, [r0, #378]	@ 0x17a
    1bd6:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1bda:	f880 217b 	strb.w	r2, [r0, #379]	@ 0x17b
    1bde:	ea4f 121c 	mov.w	r2, ip, lsr #4
    1be2:	f880 217c 	strb.w	r2, [r0, #380]	@ 0x17c
    1be6:	f9b1 21fc 	ldrsh.w	r2, [r1, #508]	@ 0x1fc
    1bea:	f9b1 11fe 	ldrsh.w	r1, [r1, #510]	@ 0x1fe
    1bee:	2a00      	cmp	r2, #0
    1bf0:	bf48      	it	mi
    1bf2:	f602 5201 	addwmi	r2, r2, #3329	@ 0xd01
    1bf6:	2900      	cmp	r1, #0
    1bf8:	bf48      	it	mi
    1bfa:	f601 5101 	addwmi	r1, r1, #3329	@ 0xd01
    1bfe:	010b      	lsls	r3, r1, #4
    1c00:	f880 217d 	strb.w	r2, [r0, #381]	@ 0x17d
    1c04:	ea43 2212 	orr.w	r2, r3, r2, lsr #8
    1c08:	0909      	lsrs	r1, r1, #4
    1c0a:	f880 217e 	strb.w	r2, [r0, #382]	@ 0x17e
    1c0e:	f880 117f 	strb.w	r1, [r0, #383]	@ 0x17f
    1c12:	4770      	bx	lr

00001c14 <main>:
    1c14:	b5b0      	push	{r4, r5, r7, lr}
    1c16:	af02      	add	r7, sp, #8
    1c18:	f5ad 6d76 	sub.w	sp, sp, #3936	@ 0xf60
    1c1c:	466c      	mov	r4, sp
    1c1e:	f36f 0403 	bfc	r4, #0, #4
    1c22:	46a5      	mov	sp, r4
    1c24:	f50d 64c0 	add.w	r4, sp, #1536	@ 0x600
    1c28:	4620      	mov	r0, r4
    1c2a:	2100      	movs	r1, #0
    1c2c:	f44f 6216 	mov.w	r2, #2400	@ 0x960
    1c30:	f000 f810 	bl	1c54 <kyber_memset>
    1c34:	466d      	mov	r5, sp
    1c36:	4628      	mov	r0, r5
    1c38:	2100      	movs	r1, #0
    1c3a:	f44f 62c0 	mov.w	r2, #1536	@ 0x600
    1c3e:	f000 f809 	bl	1c54 <kyber_memset>
    1c42:	4620      	mov	r0, r4
    1c44:	4629      	mov	r1, r5
    1c46:	f7fe fab7 	bl	1b8 <pack_sk>
    1c4a:	f1a7 0408 	sub.w	r4, r7, #8
    1c4e:	2000      	movs	r0, #0
    1c50:	46a5      	mov	sp, r4
    1c52:	bdb0      	pop	{r4, r5, r7, pc}

00001c54 <kyber_memset>:
    1c54:	1e53      	subs	r3, r2, #1
    1c56:	4293      	cmp	r3, r2
    1c58:	bf28      	it	cs
    1c5a:	4770      	bxcs	lr
    1c5c:	f800 1b01 	strb.w	r1, [r0], #1
    1c60:	461a      	mov	r2, r3
    1c62:	e7f7      	b.n	1c54 <kyber_memset>

00001c64 <kyber_memcpy>:
    1c64:	1e53      	subs	r3, r2, #1
    1c66:	4293      	cmp	r3, r2
    1c68:	bf28      	it	cs
    1c6a:	4770      	bxcs	lr
    1c6c:	f811 2b01 	ldrb.w	r2, [r1], #1
    1c70:	f800 2b01 	strb.w	r2, [r0], #1
    1c74:	461a      	mov	r2, r3
    1c76:	e7f5      	b.n	1c64 <kyber_memcpy>

00001c78 <__assert_trap>:
    1c78:	b480      	push	{r7}
    1c7a:	af00      	add	r7, sp, #0
    1c7c:	be00      	bkpt	0x0000
    1c7e:	e7fd      	b.n	1c7c <__assert_trap+0x4>

00001c80 <_Z6assertb>:
    1c80:	b580      	push	{r7, lr}
    1c82:	b082      	sub	sp, #8
    1c84:	af00      	add	r7, sp, #0
    1c86:	4603      	mov	r3, r0
    1c88:	71fb      	strb	r3, [r7, #7]
    1c8a:	79fb      	ldrb	r3, [r7, #7]
    1c8c:	f083 0301 	eor.w	r3, r3, #1
    1c90:	b2db      	uxtb	r3, r3
    1c92:	2b00      	cmp	r3, #0
    1c94:	d001      	beq.n	1c9a <_Z6assertb+0x1a>
    1c96:	f7ff ffef 	bl	1c78 <__assert_trap>
    1c9a:	bf00      	nop
    1c9c:	3708      	adds	r7, #8
    1c9e:	46bd      	mov	sp, r7
    1ca0:	bd80      	pop	{r7, pc}
    1ca2:	e7fe      	b.n	1ca2 <_Z6assertb+0x22>
    1ca4:	e7fe      	b.n	1ca4 <_Z6assertb+0x24>
    1ca6:	e7fe      	b.n	1ca6 <_Z6assertb+0x26>
    1ca8:	e7fe      	b.n	1ca8 <_Z6assertb+0x28>
    1caa:	e7fe      	b.n	1caa <_Z6assertb+0x2a>
    1cac:	e7fe      	b.n	1cac <_Z6assertb+0x2c>
    1cae:	e7fe      	b.n	1cae <_Z6assertb+0x2e>
    1cb0:	e7fe      	b.n	1cb0 <_Z6assertb+0x30>
    1cb2:	e7fe      	b.n	1cb2 <_Z6assertb+0x32>

00001cb4 <ADCSPI_Handler>:
    1cb4:	e7fe      	b.n	1cb4 <ADCSPI_Handler>
	...

00001cb8 <Reset_Handler>:
    1cb8:	4907      	ldr	r1, [pc, #28]	@ (1cd8 <system_startup+0xa>)
    1cba:	4a08      	ldr	r2, [pc, #32]	@ (1cdc <system_startup+0xe>)
    1cbc:	4b08      	ldr	r3, [pc, #32]	@ (1ce0 <system_startup+0x12>)
    1cbe:	2b00      	cmp	r3, #0
    1cc0:	d005      	beq.n	1cce <system_startup>
    1cc2:	f04f 0400 	mov.w	r4, #0

00001cc6 <zero>:
    1cc6:	f801 4b01 	strb.w	r4, [r1], #1
    1cca:	3b01      	subs	r3, #1
    1ccc:	d1fb      	bne.n	1cc6 <zero>

00001cce <system_startup>:
    1cce:	4805      	ldr	r0, [pc, #20]	@ (1ce4 <system_startup+0x16>)
    1cd0:	4780      	blx	r0
    1cd2:	4805      	ldr	r0, [pc, #20]	@ (1ce8 <system_startup+0x1a>)
    1cd4:	4700      	bx	r0
    1cd6:	0000      	.short	0x0000
    1cd8:	00004ed8 	.word	0x00004ed8
    1cdc:	00005210 	.word	0x00005210
    1ce0:	00000338 	.word	0x00000338
    1ce4:	00001d7d 	.word	0x00001d7d
    1ce8:	00000151 	.word	0x00000151

00001cec <__NVIC_EnableIRQ>:
    1cec:	b480      	push	{r7}
    1cee:	b083      	sub	sp, #12
    1cf0:	af00      	add	r7, sp, #0
    1cf2:	4603      	mov	r3, r0
    1cf4:	71fb      	strb	r3, [r7, #7]
    1cf6:	f997 3007 	ldrsb.w	r3, [r7, #7]
    1cfa:	2b00      	cmp	r3, #0
    1cfc:	db0b      	blt.n	1d16 <__NVIC_EnableIRQ+0x2a>
    1cfe:	79fb      	ldrb	r3, [r7, #7]
    1d00:	f003 021f 	and.w	r2, r3, #31
    1d04:	4907      	ldr	r1, [pc, #28]	@ (1d24 <__NVIC_EnableIRQ+0x38>)
    1d06:	f997 3007 	ldrsb.w	r3, [r7, #7]
    1d0a:	095b      	lsrs	r3, r3, #5
    1d0c:	2001      	movs	r0, #1
    1d0e:	fa00 f202 	lsl.w	r2, r0, r2
    1d12:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    1d16:	bf00      	nop
    1d18:	370c      	adds	r7, #12
    1d1a:	46bd      	mov	sp, r7
    1d1c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d20:	4770      	bx	lr
    1d22:	bf00      	nop
    1d24:	e000e100 	.word	0xe000e100

00001d28 <__NVIC_SetPriority>:
    1d28:	b480      	push	{r7}
    1d2a:	b083      	sub	sp, #12
    1d2c:	af00      	add	r7, sp, #0
    1d2e:	4603      	mov	r3, r0
    1d30:	6039      	str	r1, [r7, #0]
    1d32:	71fb      	strb	r3, [r7, #7]
    1d34:	f997 3007 	ldrsb.w	r3, [r7, #7]
    1d38:	2b00      	cmp	r3, #0
    1d3a:	db0a      	blt.n	1d52 <__NVIC_SetPriority+0x2a>
    1d3c:	683b      	ldr	r3, [r7, #0]
    1d3e:	b2da      	uxtb	r2, r3
    1d40:	490c      	ldr	r1, [pc, #48]	@ (1d74 <__NVIC_SetPriority+0x4c>)
    1d42:	f997 3007 	ldrsb.w	r3, [r7, #7]
    1d46:	0152      	lsls	r2, r2, #5
    1d48:	b2d2      	uxtb	r2, r2
    1d4a:	440b      	add	r3, r1
    1d4c:	f883 2300 	strb.w	r2, [r3, #768]	@ 0x300
    1d50:	e00a      	b.n	1d68 <__NVIC_SetPriority+0x40>
    1d52:	683b      	ldr	r3, [r7, #0]
    1d54:	b2da      	uxtb	r2, r3
    1d56:	4908      	ldr	r1, [pc, #32]	@ (1d78 <__NVIC_SetPriority+0x50>)
    1d58:	79fb      	ldrb	r3, [r7, #7]
    1d5a:	f003 030f 	and.w	r3, r3, #15
    1d5e:	3b04      	subs	r3, #4
    1d60:	0152      	lsls	r2, r2, #5
    1d62:	b2d2      	uxtb	r2, r2
    1d64:	440b      	add	r3, r1
    1d66:	761a      	strb	r2, [r3, #24]
    1d68:	bf00      	nop
    1d6a:	370c      	adds	r7, #12
    1d6c:	46bd      	mov	sp, r7
    1d6e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d72:	4770      	bx	lr
    1d74:	e000e100 	.word	0xe000e100
    1d78:	e000ed00 	.word	0xe000ed00

00001d7c <SystemInit>:
    1d7c:	b580      	push	{r7, lr}
    1d7e:	af00      	add	r7, sp, #0
    1d80:	4b1e      	ldr	r3, [pc, #120]	@ (1dfc <SystemInit+0x80>)
    1d82:	f8d3 3088 	ldr.w	r3, [r3, #136]	@ 0x88
    1d86:	4a1d      	ldr	r2, [pc, #116]	@ (1dfc <SystemInit+0x80>)
    1d88:	f443 0370 	orr.w	r3, r3, #15728640	@ 0xf00000
    1d8c:	f8c2 3088 	str.w	r3, [r2, #136]	@ 0x88
    1d90:	4b1b      	ldr	r3, [pc, #108]	@ (1e00 <SystemInit+0x84>)
    1d92:	699b      	ldr	r3, [r3, #24]
    1d94:	4a1a      	ldr	r2, [pc, #104]	@ (1e00 <SystemInit+0x84>)
    1d96:	f043 0301 	orr.w	r3, r3, #1
    1d9a:	6193      	str	r3, [r2, #24]
    1d9c:	4b18      	ldr	r3, [pc, #96]	@ (1e00 <SystemInit+0x84>)
    1d9e:	699b      	ldr	r3, [r3, #24]
    1da0:	4a17      	ldr	r2, [pc, #92]	@ (1e00 <SystemInit+0x84>)
    1da2:	f043 0302 	orr.w	r3, r3, #2
    1da6:	6193      	str	r3, [r2, #24]
    1da8:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    1dac:	f240 228b 	movw	r2, #651	@ 0x28b
    1db0:	611a      	str	r2, [r3, #16]
    1db2:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    1db6:	689b      	ldr	r3, [r3, #8]
    1db8:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    1dbc:	f043 0302 	orr.w	r3, r3, #2
    1dc0:	6093      	str	r3, [r2, #8]
    1dc2:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    1dc6:	689b      	ldr	r3, [r3, #8]
    1dc8:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    1dcc:	f043 0301 	orr.w	r3, r3, #1
    1dd0:	6093      	str	r3, [r2, #8]
    1dd2:	4b0c      	ldr	r3, [pc, #48]	@ (1e04 <SystemInit+0x88>)
    1dd4:	f06f 427f 	mvn.w	r2, #4278190080	@ 0xff000000
    1dd8:	605a      	str	r2, [r3, #4]
    1dda:	2107      	movs	r1, #7
    1ddc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1de0:	f7ff ffa2 	bl	1d28 <__NVIC_SetPriority>
    1de4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1de8:	f7ff ff80 	bl	1cec <__NVIC_EnableIRQ>
    1dec:	4b05      	ldr	r3, [pc, #20]	@ (1e04 <SystemInit+0x88>)
    1dee:	2200      	movs	r2, #0
    1df0:	609a      	str	r2, [r3, #8]
    1df2:	4b04      	ldr	r3, [pc, #16]	@ (1e04 <SystemInit+0x88>)
    1df4:	2207      	movs	r2, #7
    1df6:	601a      	str	r2, [r3, #0]
    1df8:	bf00      	nop
    1dfa:	bd80      	pop	{r7, pc}
    1dfc:	e000ed00 	.word	0xe000ed00
    1e00:	40010000 	.word	0x40010000
    1e04:	e000e010 	.word	0xe000e010

00001e08 <SysTick_Handler>:
    1e08:	b480      	push	{r7}
    1e0a:	af00      	add	r7, sp, #0
    1e0c:	4b06      	ldr	r3, [pc, #24]	@ (1e28 <SysTick_Handler+0x20>)
    1e0e:	e9d3 2300 	ldrd	r2, r3, [r3]
    1e12:	1c50      	adds	r0, r2, #1
    1e14:	f143 0100 	adc.w	r1, r3, #0
    1e18:	4b03      	ldr	r3, [pc, #12]	@ (1e28 <SysTick_Handler+0x20>)
    1e1a:	e9c3 0100 	strd	r0, r1, [r3]
    1e1e:	bf00      	nop
    1e20:	46bd      	mov	sp, r7
    1e22:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e26:	4770      	bx	lr
    1e28:	00004ef8 	.word	0x00004ef8

00001e2c <hal_get_time>:
    1e2c:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    1e30:	b084      	sub	sp, #16
    1e32:	af00      	add	r7, sp, #0
    1e34:	4b17      	ldr	r3, [pc, #92]	@ (1e94 <hal_get_time+0x68>)
    1e36:	e9d3 2300 	ldrd	r2, r3, [r3]
    1e3a:	e9c7 2302 	strd	r2, r3, [r7, #8]
    1e3e:	e9d7 2302 	ldrd	r2, r3, [r7, #8]
    1e42:	1c50      	adds	r0, r2, #1
    1e44:	f143 0100 	adc.w	r1, r3, #0
    1e48:	f04f 0200 	mov.w	r2, #0
    1e4c:	f04f 0300 	mov.w	r3, #0
    1e50:	060b      	lsls	r3, r1, #24
    1e52:	ea43 2310 	orr.w	r3, r3, r0, lsr #8
    1e56:	0602      	lsls	r2, r0, #24
    1e58:	4e0f      	ldr	r6, [pc, #60]	@ (1e98 <hal_get_time+0x6c>)
    1e5a:	68b6      	ldr	r6, [r6, #8]
    1e5c:	f04f 0c00 	mov.w	ip, #0
    1e60:	4634      	mov	r4, r6
    1e62:	4665      	mov	r5, ip
    1e64:	ebb2 0804 	subs.w	r8, r2, r4
    1e68:	eb63 0905 	sbc.w	r9, r3, r5
    1e6c:	e9c7 8900 	strd	r8, r9, [r7]
    1e70:	4b08      	ldr	r3, [pc, #32]	@ (1e94 <hal_get_time+0x68>)
    1e72:	e9d3 2300 	ldrd	r2, r3, [r3]
    1e76:	e9d7 ab02 	ldrd	sl, fp, [r7, #8]
    1e7a:	459b      	cmp	fp, r3
    1e7c:	bf08      	it	eq
    1e7e:	4592      	cmpeq	sl, r2
    1e80:	d1d8      	bne.n	1e34 <hal_get_time+0x8>
    1e82:	e9d7 2300 	ldrd	r2, r3, [r7]
    1e86:	4610      	mov	r0, r2
    1e88:	4619      	mov	r1, r3
    1e8a:	3710      	adds	r7, #16
    1e8c:	46bd      	mov	sp, r7
    1e8e:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    1e92:	4770      	bx	lr
    1e94:	00004ef8 	.word	0x00004ef8
    1e98:	e000e010 	.word	0xe000e010

00001e9c <hal_setup>:
    1e9c:	b480      	push	{r7}
    1e9e:	b083      	sub	sp, #12
    1ea0:	af00      	add	r7, sp, #0
    1ea2:	4603      	mov	r3, r0
    1ea4:	71fb      	strb	r3, [r7, #7]
    1ea6:	bf00      	nop
    1ea8:	370c      	adds	r7, #12
    1eaa:	46bd      	mov	sp, r7
    1eac:	f85d 7b04 	ldr.w	r7, [sp], #4
    1eb0:	4770      	bx	lr

00001eb2 <uart_putc>:
    1eb2:	b480      	push	{r7}
    1eb4:	b083      	sub	sp, #12
    1eb6:	af00      	add	r7, sp, #0
    1eb8:	6078      	str	r0, [r7, #4]
    1eba:	bf00      	nop
    1ebc:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    1ec0:	685b      	ldr	r3, [r3, #4]
    1ec2:	f003 0301 	and.w	r3, r3, #1
    1ec6:	2b00      	cmp	r3, #0
    1ec8:	d1f8      	bne.n	1ebc <uart_putc+0xa>
    1eca:	687b      	ldr	r3, [r7, #4]
    1ecc:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    1ed0:	b2db      	uxtb	r3, r3
    1ed2:	6013      	str	r3, [r2, #0]
    1ed4:	bf00      	nop
    1ed6:	370c      	adds	r7, #12
    1ed8:	46bd      	mov	sp, r7
    1eda:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ede:	4770      	bx	lr

00001ee0 <hal_send_str>:
    1ee0:	b580      	push	{r7, lr}
    1ee2:	b084      	sub	sp, #16
    1ee4:	af00      	add	r7, sp, #0
    1ee6:	6078      	str	r0, [r7, #4]
    1ee8:	687b      	ldr	r3, [r7, #4]
    1eea:	60fb      	str	r3, [r7, #12]
    1eec:	e007      	b.n	1efe <hal_send_str+0x1e>
    1eee:	68fb      	ldr	r3, [r7, #12]
    1ef0:	781b      	ldrb	r3, [r3, #0]
    1ef2:	4618      	mov	r0, r3
    1ef4:	f7ff ffdd 	bl	1eb2 <uart_putc>
    1ef8:	68fb      	ldr	r3, [r7, #12]
    1efa:	3301      	adds	r3, #1
    1efc:	60fb      	str	r3, [r7, #12]
    1efe:	68fb      	ldr	r3, [r7, #12]
    1f00:	781b      	ldrb	r3, [r3, #0]
    1f02:	2b00      	cmp	r3, #0
    1f04:	d1f3      	bne.n	1eee <hal_send_str+0xe>
    1f06:	200a      	movs	r0, #10
    1f08:	f7ff ffd3 	bl	1eb2 <uart_putc>
    1f0c:	bf00      	nop
    1f0e:	3710      	adds	r7, #16
    1f10:	46bd      	mov	sp, r7
    1f12:	bd80      	pop	{r7, pc}

00001f14 <semihosting_syscall>:
    1f14:	b480      	push	{r7}
    1f16:	b083      	sub	sp, #12
    1f18:	af00      	add	r7, sp, #0
    1f1a:	6078      	str	r0, [r7, #4]
    1f1c:	6039      	str	r1, [r7, #0]
    1f1e:	683a      	ldr	r2, [r7, #0]
    1f20:	687b      	ldr	r3, [r7, #4]
    1f22:	4618      	mov	r0, r3
    1f24:	4611      	mov	r1, r2
    1f26:	beab      	bkpt	0x00ab
    1f28:	4603      	mov	r3, r0
    1f2a:	607b      	str	r3, [r7, #4]
    1f2c:	687b      	ldr	r3, [r7, #4]
    1f2e:	4618      	mov	r0, r3
    1f30:	370c      	adds	r7, #12
    1f32:	46bd      	mov	sp, r7
    1f34:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f38:	4770      	bx	lr

00001f3a <semihosting_exit>:
    1f3a:	b580      	push	{r7, lr}
    1f3c:	af00      	add	r7, sp, #0
    1f3e:	2318      	movs	r3, #24
    1f40:	4a03      	ldr	r2, [pc, #12]	@ (1f50 <semihosting_exit+0x16>)
    1f42:	4611      	mov	r1, r2
    1f44:	4618      	mov	r0, r3
    1f46:	f7ff ffe5 	bl	1f14 <semihosting_syscall>
    1f4a:	bf00      	nop
    1f4c:	bd80      	pop	{r7, pc}
    1f4e:	bf00      	nop
    1f50:	00020026 	.word	0x00020026

00001f54 <NMI_Handler>:
    1f54:	b580      	push	{r7, lr}
    1f56:	af00      	add	r7, sp, #0
    1f58:	4805      	ldr	r0, [pc, #20]	@ (1f70 <NMI_Handler+0x1c>)
    1f5a:	f7ff ffc1 	bl	1ee0 <hal_send_str>
    1f5e:	2318      	movs	r3, #24
    1f60:	4a04      	ldr	r2, [pc, #16]	@ (1f74 <NMI_Handler+0x20>)
    1f62:	4611      	mov	r1, r2
    1f64:	4618      	mov	r0, r3
    1f66:	f7ff ffd5 	bl	1f14 <semihosting_syscall>
    1f6a:	bf00      	nop
    1f6c:	bd80      	pop	{r7, pc}
    1f6e:	bf00      	nop
    1f70:	000047a8 	.word	0x000047a8
    1f74:	00020026 	.word	0x00020026

00001f78 <HardFault_Handler>:
    1f78:	b580      	push	{r7, lr}
    1f7a:	af00      	add	r7, sp, #0
    1f7c:	4805      	ldr	r0, [pc, #20]	@ (1f94 <HardFault_Handler+0x1c>)
    1f7e:	f7ff ffaf 	bl	1ee0 <hal_send_str>
    1f82:	2318      	movs	r3, #24
    1f84:	4a04      	ldr	r2, [pc, #16]	@ (1f98 <HardFault_Handler+0x20>)
    1f86:	4611      	mov	r1, r2
    1f88:	4618      	mov	r0, r3
    1f8a:	f7ff ffc3 	bl	1f14 <semihosting_syscall>
    1f8e:	bf00      	nop
    1f90:	bd80      	pop	{r7, pc}
    1f92:	bf00      	nop
    1f94:	000047b4 	.word	0x000047b4
    1f98:	00020026 	.word	0x00020026

00001f9c <MemManage_Handler>:
    1f9c:	b580      	push	{r7, lr}
    1f9e:	af00      	add	r7, sp, #0
    1fa0:	4805      	ldr	r0, [pc, #20]	@ (1fb8 <MemManage_Handler+0x1c>)
    1fa2:	f7ff ff9d 	bl	1ee0 <hal_send_str>
    1fa6:	2318      	movs	r3, #24
    1fa8:	4a04      	ldr	r2, [pc, #16]	@ (1fbc <MemManage_Handler+0x20>)
    1faa:	4611      	mov	r1, r2
    1fac:	4618      	mov	r0, r3
    1fae:	f7ff ffb1 	bl	1f14 <semihosting_syscall>
    1fb2:	bf00      	nop
    1fb4:	bd80      	pop	{r7, pc}
    1fb6:	bf00      	nop
    1fb8:	000047c8 	.word	0x000047c8
    1fbc:	00020026 	.word	0x00020026

00001fc0 <BusFault_Handler>:
    1fc0:	b580      	push	{r7, lr}
    1fc2:	af00      	add	r7, sp, #0
    1fc4:	4805      	ldr	r0, [pc, #20]	@ (1fdc <BusFault_Handler+0x1c>)
    1fc6:	f7ff ff8b 	bl	1ee0 <hal_send_str>
    1fca:	2318      	movs	r3, #24
    1fcc:	4a04      	ldr	r2, [pc, #16]	@ (1fe0 <BusFault_Handler+0x20>)
    1fce:	4611      	mov	r1, r2
    1fd0:	4618      	mov	r0, r3
    1fd2:	f7ff ff9f 	bl	1f14 <semihosting_syscall>
    1fd6:	bf00      	nop
    1fd8:	bd80      	pop	{r7, pc}
    1fda:	bf00      	nop
    1fdc:	000047dc 	.word	0x000047dc
    1fe0:	00020026 	.word	0x00020026

00001fe4 <UsageFault_Handler>:
    1fe4:	b580      	push	{r7, lr}
    1fe6:	af00      	add	r7, sp, #0
    1fe8:	4805      	ldr	r0, [pc, #20]	@ (2000 <UsageFault_Handler+0x1c>)
    1fea:	f7ff ff79 	bl	1ee0 <hal_send_str>
    1fee:	2318      	movs	r3, #24
    1ff0:	4a04      	ldr	r2, [pc, #16]	@ (2004 <UsageFault_Handler+0x20>)
    1ff2:	4611      	mov	r1, r2
    1ff4:	4618      	mov	r0, r3
    1ff6:	f7ff ff8d 	bl	1f14 <semihosting_syscall>
    1ffa:	bf00      	nop
    1ffc:	bd80      	pop	{r7, pc}
    1ffe:	bf00      	nop
    2000:	000047f0 	.word	0x000047f0
    2004:	00020026 	.word	0x00020026

00002008 <SVC_Handler>:
    2008:	b580      	push	{r7, lr}
    200a:	af00      	add	r7, sp, #0
    200c:	4805      	ldr	r0, [pc, #20]	@ (2024 <SVC_Handler+0x1c>)
    200e:	f7ff ff67 	bl	1ee0 <hal_send_str>
    2012:	2318      	movs	r3, #24
    2014:	4a04      	ldr	r2, [pc, #16]	@ (2028 <SVC_Handler+0x20>)
    2016:	4611      	mov	r1, r2
    2018:	4618      	mov	r0, r3
    201a:	f7ff ff7b 	bl	1f14 <semihosting_syscall>
    201e:	bf00      	nop
    2020:	bd80      	pop	{r7, pc}
    2022:	bf00      	nop
    2024:	00004804 	.word	0x00004804
    2028:	00020026 	.word	0x00020026

0000202c <DebugMon_Handler>:
    202c:	b580      	push	{r7, lr}
    202e:	af00      	add	r7, sp, #0
    2030:	4805      	ldr	r0, [pc, #20]	@ (2048 <DebugMon_Handler+0x1c>)
    2032:	f7ff ff55 	bl	1ee0 <hal_send_str>
    2036:	2318      	movs	r3, #24
    2038:	4a04      	ldr	r2, [pc, #16]	@ (204c <DebugMon_Handler+0x20>)
    203a:	4611      	mov	r1, r2
    203c:	4618      	mov	r0, r3
    203e:	f7ff ff69 	bl	1f14 <semihosting_syscall>
    2042:	bf00      	nop
    2044:	bd80      	pop	{r7, pc}
    2046:	bf00      	nop
    2048:	00004810 	.word	0x00004810
    204c:	00020026 	.word	0x00020026

00002050 <PendSV_Handler>:
    2050:	b580      	push	{r7, lr}
    2052:	af00      	add	r7, sp, #0
    2054:	4805      	ldr	r0, [pc, #20]	@ (206c <PendSV_Handler+0x1c>)
    2056:	f7ff ff43 	bl	1ee0 <hal_send_str>
    205a:	2318      	movs	r3, #24
    205c:	4a04      	ldr	r2, [pc, #16]	@ (2070 <PendSV_Handler+0x20>)
    205e:	4611      	mov	r1, r2
    2060:	4618      	mov	r0, r3
    2062:	f7ff ff57 	bl	1f14 <semihosting_syscall>
    2066:	bf00      	nop
    2068:	bd80      	pop	{r7, pc}
    206a:	bf00      	nop
    206c:	00004824 	.word	0x00004824
    2070:	00020026 	.word	0x00020026

00002074 <Default_Handler>:
    2074:	b580      	push	{r7, lr}
    2076:	af00      	add	r7, sp, #0
    2078:	2318      	movs	r3, #24
    207a:	4a03      	ldr	r2, [pc, #12]	@ (2088 <Default_Handler+0x14>)
    207c:	4611      	mov	r1, r2
    207e:	4618      	mov	r0, r3
    2080:	f7ff ff48 	bl	1f14 <semihosting_syscall>
    2084:	bf00      	nop
    2086:	bd80      	pop	{r7, pc}
    2088:	00020026 	.word	0x00020026

0000208c <__wrap__sbrk>:
    208c:	b480      	push	{r7}
    208e:	b085      	sub	sp, #20
    2090:	af00      	add	r7, sp, #0
    2092:	6078      	str	r0, [r7, #4]
    2094:	4b07      	ldr	r3, [pc, #28]	@ (20b4 <__wrap__sbrk+0x28>)
    2096:	681b      	ldr	r3, [r3, #0]
    2098:	60fb      	str	r3, [r7, #12]
    209a:	4b06      	ldr	r3, [pc, #24]	@ (20b4 <__wrap__sbrk+0x28>)
    209c:	681a      	ldr	r2, [r3, #0]
    209e:	687b      	ldr	r3, [r7, #4]
    20a0:	4413      	add	r3, r2
    20a2:	4a04      	ldr	r2, [pc, #16]	@ (20b4 <__wrap__sbrk+0x28>)
    20a4:	6013      	str	r3, [r2, #0]
    20a6:	68fb      	ldr	r3, [r7, #12]
    20a8:	4618      	mov	r0, r3
    20aa:	3714      	adds	r7, #20
    20ac:	46bd      	mov	sp, r7
    20ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    20b2:	4770      	bx	lr
    20b4:	0000497c 	.word	0x0000497c

000020b8 <hal_get_stack_size>:
    20b8:	b490      	push	{r4, r7}
    20ba:	af00      	add	r7, sp, #0
    20bc:	466b      	mov	r3, sp
    20be:	461c      	mov	r4, r3
    20c0:	4b03      	ldr	r3, [pc, #12]	@ (20d0 <hal_get_stack_size+0x18>)
    20c2:	681b      	ldr	r3, [r3, #0]
    20c4:	1ae3      	subs	r3, r4, r3
    20c6:	4618      	mov	r0, r3
    20c8:	46bd      	mov	sp, r7
    20ca:	bc90      	pop	{r4, r7}
    20cc:	4770      	bx	lr
    20ce:	bf00      	nop
    20d0:	0000497c 	.word	0x0000497c

000020d4 <hal_spraystack>:
    20d4:	b480      	push	{r7}
    20d6:	b083      	sub	sp, #12
    20d8:	af00      	add	r7, sp, #0
    20da:	4b0a      	ldr	r3, [pc, #40]	@ (2104 <hal_spraystack+0x30>)
    20dc:	681b      	ldr	r3, [r3, #0]
    20de:	607b      	str	r3, [r7, #4]
    20e0:	4909      	ldr	r1, [pc, #36]	@ (2108 <hal_spraystack+0x34>)
    20e2:	4b0a      	ldr	r3, [pc, #40]	@ (210c <hal_spraystack+0x38>)
    20e4:	681a      	ldr	r2, [r3, #0]
    20e6:	687b      	ldr	r3, [r7, #4]
    20e8:	466a      	mov	r2, sp
    20ea:	f843 1b04 	str.w	r1, [r3], #4
    20ee:	4293      	cmp	r3, r2
    20f0:	dbfb      	blt.n	20ea <hal_spraystack+0x16>
    20f2:	4906      	ldr	r1, [pc, #24]	@ (210c <hal_spraystack+0x38>)
    20f4:	600a      	str	r2, [r1, #0]
    20f6:	607b      	str	r3, [r7, #4]
    20f8:	bf00      	nop
    20fa:	370c      	adds	r7, #12
    20fc:	46bd      	mov	sp, r7
    20fe:	f85d 7b04 	ldr.w	r7, [sp], #4
    2102:	4770      	bx	lr
    2104:	0000497c 	.word	0x0000497c
    2108:	deadbeef 	.word	0xdeadbeef
    210c:	00004f00 	.word	0x00004f00

00002110 <hal_checkstack>:
    2110:	b480      	push	{r7}
    2112:	b083      	sub	sp, #12
    2114:	af00      	add	r7, sp, #0
    2116:	2300      	movs	r3, #0
    2118:	607b      	str	r3, [r7, #4]
    211a:	4b0c      	ldr	r3, [pc, #48]	@ (214c <hal_checkstack+0x3c>)
    211c:	681a      	ldr	r2, [r3, #0]
    211e:	4b0c      	ldr	r3, [pc, #48]	@ (2150 <hal_checkstack+0x40>)
    2120:	6819      	ldr	r1, [r3, #0]
    2122:	480c      	ldr	r0, [pc, #48]	@ (2154 <hal_checkstack+0x44>)
    2124:	687b      	ldr	r3, [r7, #4]
    2126:	eba2 0301 	sub.w	r3, r2, r1
    212a:	f851 cb04 	ldr.w	ip, [r1], #4
    212e:	4584      	cmp	ip, r0
    2130:	bf0c      	ite	eq
    2132:	3b04      	subeq	r3, #4
    2134:	e001      	bne.n	213a <hal_checkstack+0x2a>
    2136:	4291      	cmp	r1, r2
    2138:	dbf7      	blt.n	212a <hal_checkstack+0x1a>
    213a:	607b      	str	r3, [r7, #4]
    213c:	687b      	ldr	r3, [r7, #4]
    213e:	4618      	mov	r0, r3
    2140:	370c      	adds	r7, #12
    2142:	46bd      	mov	sp, r7
    2144:	f85d 7b04 	ldr.w	r7, [sp], #4
    2148:	4770      	bx	lr
    214a:	bf00      	nop
    214c:	00004f00 	.word	0x00004f00
    2150:	0000497c 	.word	0x0000497c
    2154:	deadbeef 	.word	0xdeadbeef

00002158 <__wrap__open>:
    2158:	b480      	push	{r7}
    215a:	b085      	sub	sp, #20
    215c:	af00      	add	r7, sp, #0
    215e:	60f8      	str	r0, [r7, #12]
    2160:	60b9      	str	r1, [r7, #8]
    2162:	607a      	str	r2, [r7, #4]
    2164:	4b05      	ldr	r3, [pc, #20]	@ (217c <__wrap__open+0x24>)
    2166:	2258      	movs	r2, #88	@ 0x58
    2168:	601a      	str	r2, [r3, #0]
    216a:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    216e:	4618      	mov	r0, r3
    2170:	3714      	adds	r7, #20
    2172:	46bd      	mov	sp, r7
    2174:	f85d 7b04 	ldr.w	r7, [sp], #4
    2178:	4770      	bx	lr
    217a:	bf00      	nop
    217c:	00004f04 	.word	0x00004f04

00002180 <__wrap__close>:
    2180:	b480      	push	{r7}
    2182:	b083      	sub	sp, #12
    2184:	af00      	add	r7, sp, #0
    2186:	6078      	str	r0, [r7, #4]
    2188:	4b05      	ldr	r3, [pc, #20]	@ (21a0 <__wrap__close+0x20>)
    218a:	2258      	movs	r2, #88	@ 0x58
    218c:	601a      	str	r2, [r3, #0]
    218e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2192:	4618      	mov	r0, r3
    2194:	370c      	adds	r7, #12
    2196:	46bd      	mov	sp, r7
    2198:	f85d 7b04 	ldr.w	r7, [sp], #4
    219c:	4770      	bx	lr
    219e:	bf00      	nop
    21a0:	00004f04 	.word	0x00004f04

000021a4 <__wrap__fstat>:
    21a4:	b480      	push	{r7}
    21a6:	b083      	sub	sp, #12
    21a8:	af00      	add	r7, sp, #0
    21aa:	6078      	str	r0, [r7, #4]
    21ac:	6039      	str	r1, [r7, #0]
    21ae:	4b05      	ldr	r3, [pc, #20]	@ (21c4 <__wrap__fstat+0x20>)
    21b0:	2258      	movs	r2, #88	@ 0x58
    21b2:	601a      	str	r2, [r3, #0]
    21b4:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    21b8:	4618      	mov	r0, r3
    21ba:	370c      	adds	r7, #12
    21bc:	46bd      	mov	sp, r7
    21be:	f85d 7b04 	ldr.w	r7, [sp], #4
    21c2:	4770      	bx	lr
    21c4:	00004f04 	.word	0x00004f04

000021c8 <__wrap__getpid>:
    21c8:	b480      	push	{r7}
    21ca:	af00      	add	r7, sp, #0
    21cc:	4b04      	ldr	r3, [pc, #16]	@ (21e0 <__wrap__getpid+0x18>)
    21ce:	2258      	movs	r2, #88	@ 0x58
    21d0:	601a      	str	r2, [r3, #0]
    21d2:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    21d6:	4618      	mov	r0, r3
    21d8:	46bd      	mov	sp, r7
    21da:	f85d 7b04 	ldr.w	r7, [sp], #4
    21de:	4770      	bx	lr
    21e0:	00004f04 	.word	0x00004f04

000021e4 <__wrap__isatty>:
    21e4:	b480      	push	{r7}
    21e6:	b083      	sub	sp, #12
    21e8:	af00      	add	r7, sp, #0
    21ea:	6078      	str	r0, [r7, #4]
    21ec:	4b04      	ldr	r3, [pc, #16]	@ (2200 <__wrap__isatty+0x1c>)
    21ee:	2258      	movs	r2, #88	@ 0x58
    21f0:	601a      	str	r2, [r3, #0]
    21f2:	2300      	movs	r3, #0
    21f4:	4618      	mov	r0, r3
    21f6:	370c      	adds	r7, #12
    21f8:	46bd      	mov	sp, r7
    21fa:	f85d 7b04 	ldr.w	r7, [sp], #4
    21fe:	4770      	bx	lr
    2200:	00004f04 	.word	0x00004f04

00002204 <__wrap__kill>:
    2204:	b480      	push	{r7}
    2206:	b083      	sub	sp, #12
    2208:	af00      	add	r7, sp, #0
    220a:	6078      	str	r0, [r7, #4]
    220c:	6039      	str	r1, [r7, #0]
    220e:	4b05      	ldr	r3, [pc, #20]	@ (2224 <__wrap__kill+0x20>)
    2210:	2258      	movs	r2, #88	@ 0x58
    2212:	601a      	str	r2, [r3, #0]
    2214:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2218:	4618      	mov	r0, r3
    221a:	370c      	adds	r7, #12
    221c:	46bd      	mov	sp, r7
    221e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2222:	4770      	bx	lr
    2224:	00004f04 	.word	0x00004f04

00002228 <__wrap__lseek>:
    2228:	b480      	push	{r7}
    222a:	b085      	sub	sp, #20
    222c:	af00      	add	r7, sp, #0
    222e:	60f8      	str	r0, [r7, #12]
    2230:	60b9      	str	r1, [r7, #8]
    2232:	607a      	str	r2, [r7, #4]
    2234:	4b05      	ldr	r3, [pc, #20]	@ (224c <__wrap__lseek+0x24>)
    2236:	2258      	movs	r2, #88	@ 0x58
    2238:	601a      	str	r2, [r3, #0]
    223a:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    223e:	4618      	mov	r0, r3
    2240:	3714      	adds	r7, #20
    2242:	46bd      	mov	sp, r7
    2244:	f85d 7b04 	ldr.w	r7, [sp], #4
    2248:	4770      	bx	lr
    224a:	bf00      	nop
    224c:	00004f04 	.word	0x00004f04

00002250 <__wrap__read>:
    2250:	b480      	push	{r7}
    2252:	b085      	sub	sp, #20
    2254:	af00      	add	r7, sp, #0
    2256:	60f8      	str	r0, [r7, #12]
    2258:	60b9      	str	r1, [r7, #8]
    225a:	607a      	str	r2, [r7, #4]
    225c:	4b05      	ldr	r3, [pc, #20]	@ (2274 <__wrap__read+0x24>)
    225e:	2258      	movs	r2, #88	@ 0x58
    2260:	601a      	str	r2, [r3, #0]
    2262:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2266:	4618      	mov	r0, r3
    2268:	3714      	adds	r7, #20
    226a:	46bd      	mov	sp, r7
    226c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2270:	4770      	bx	lr
    2272:	bf00      	nop
    2274:	00004f04 	.word	0x00004f04

00002278 <__wrap__write>:
    2278:	b580      	push	{r7, lr}
    227a:	b086      	sub	sp, #24
    227c:	af00      	add	r7, sp, #0
    227e:	60f8      	str	r0, [r7, #12]
    2280:	60b9      	str	r1, [r7, #8]
    2282:	607a      	str	r2, [r7, #4]
    2284:	2300      	movs	r3, #0
    2286:	617b      	str	r3, [r7, #20]
    2288:	e009      	b.n	229e <__wrap__write+0x26>
    228a:	697b      	ldr	r3, [r7, #20]
    228c:	68ba      	ldr	r2, [r7, #8]
    228e:	4413      	add	r3, r2
    2290:	781b      	ldrb	r3, [r3, #0]
    2292:	4618      	mov	r0, r3
    2294:	f7ff fe0d 	bl	1eb2 <uart_putc>
    2298:	697b      	ldr	r3, [r7, #20]
    229a:	3301      	adds	r3, #1
    229c:	617b      	str	r3, [r7, #20]
    229e:	697a      	ldr	r2, [r7, #20]
    22a0:	687b      	ldr	r3, [r7, #4]
    22a2:	429a      	cmp	r2, r3
    22a4:	dbf1      	blt.n	228a <__wrap__write+0x12>
    22a6:	687b      	ldr	r3, [r7, #4]
    22a8:	4618      	mov	r0, r3
    22aa:	3718      	adds	r7, #24
    22ac:	46bd      	mov	sp, r7
    22ae:	bd80      	pop	{r7, pc}

000022b0 <selfrel_offset31>:
    22b0:	6803      	ldr	r3, [r0, #0]
    22b2:	005a      	lsls	r2, r3, #1
    22b4:	bf4c      	ite	mi
    22b6:	f043 4300 	orrmi.w	r3, r3, #2147483648	@ 0x80000000
    22ba:	f023 4300 	bicpl.w	r3, r3, #2147483648	@ 0x80000000
    22be:	4418      	add	r0, r3
    22c0:	4770      	bx	lr
    22c2:	bf00      	nop

000022c4 <search_EIT_table>:
    22c4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    22c8:	b359      	cbz	r1, 2322 <search_EIT_table+0x5e>
    22ca:	f101 38ff 	add.w	r8, r1, #4294967295	@ 0xffffffff
    22ce:	4605      	mov	r5, r0
    22d0:	4616      	mov	r6, r2
    22d2:	4647      	mov	r7, r8
    22d4:	f04f 0a00 	mov.w	sl, #0
    22d8:	eb0a 0107 	add.w	r1, sl, r7
    22dc:	eb01 71d1 	add.w	r1, r1, r1, lsr #31
    22e0:	1049      	asrs	r1, r1, #1
    22e2:	eb05 09c1 	add.w	r9, r5, r1, lsl #3
    22e6:	4648      	mov	r0, r9
    22e8:	f7ff ffe2 	bl	22b0 <selfrel_offset31>
    22ec:	4588      	cmp	r8, r1
    22ee:	ea4f 04c1 	mov.w	r4, r1, lsl #3
    22f2:	4603      	mov	r3, r0
    22f4:	d010      	beq.n	2318 <search_EIT_table+0x54>
    22f6:	f104 0008 	add.w	r0, r4, #8
    22fa:	42b3      	cmp	r3, r6
    22fc:	4428      	add	r0, r5
    22fe:	d807      	bhi.n	2310 <search_EIT_table+0x4c>
    2300:	f7ff ffd6 	bl	22b0 <selfrel_offset31>
    2304:	3801      	subs	r0, #1
    2306:	42b0      	cmp	r0, r6
    2308:	d208      	bcs.n	231c <search_EIT_table+0x58>
    230a:	f101 0a01 	add.w	sl, r1, #1
    230e:	e7e3      	b.n	22d8 <search_EIT_table+0x14>
    2310:	458a      	cmp	sl, r1
    2312:	d006      	beq.n	2322 <search_EIT_table+0x5e>
    2314:	1e4f      	subs	r7, r1, #1
    2316:	e7df      	b.n	22d8 <search_EIT_table+0x14>
    2318:	42b0      	cmp	r0, r6
    231a:	d8f9      	bhi.n	2310 <search_EIT_table+0x4c>
    231c:	4648      	mov	r0, r9
    231e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2322:	f04f 0900 	mov.w	r9, #0
    2326:	4648      	mov	r0, r9
    2328:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

0000232c <__gnu_unwind_get_pr_addr>:
    232c:	2801      	cmp	r0, #1
    232e:	d009      	beq.n	2344 <__gnu_unwind_get_pr_addr+0x18>
    2330:	2802      	cmp	r0, #2
    2332:	d005      	beq.n	2340 <__gnu_unwind_get_pr_addr+0x14>
    2334:	4b04      	ldr	r3, [pc, #16]	@ (2348 <__gnu_unwind_get_pr_addr+0x1c>)
    2336:	2800      	cmp	r0, #0
    2338:	bf0c      	ite	eq
    233a:	4618      	moveq	r0, r3
    233c:	2000      	movne	r0, #0
    233e:	4770      	bx	lr
    2340:	4802      	ldr	r0, [pc, #8]	@ (234c <__gnu_unwind_get_pr_addr+0x20>)
    2342:	4770      	bx	lr
    2344:	4802      	ldr	r0, [pc, #8]	@ (2350 <__gnu_unwind_get_pr_addr+0x24>)
    2346:	4770      	bx	lr
    2348:	00002a09 	.word	0x00002a09
    234c:	00002a11 	.word	0x00002a11
    2350:	00002a0d 	.word	0x00002a0d

00002354 <get_eit_entry>:
    2354:	b530      	push	{r4, r5, lr}
    2356:	4b22      	ldr	r3, [pc, #136]	@ (23e0 <get_eit_entry+0x8c>)
    2358:	b083      	sub	sp, #12
    235a:	4604      	mov	r4, r0
    235c:	1e8d      	subs	r5, r1, #2
    235e:	b343      	cbz	r3, 23b2 <get_eit_entry+0x5e>
    2360:	a901      	add	r1, sp, #4
    2362:	4628      	mov	r0, r5
    2364:	f3af 8000 	nop.w
    2368:	b1f0      	cbz	r0, 23a8 <get_eit_entry+0x54>
    236a:	9901      	ldr	r1, [sp, #4]
    236c:	462a      	mov	r2, r5
    236e:	f7ff ffa9 	bl	22c4 <search_EIT_table>
    2372:	4601      	mov	r1, r0
    2374:	b1c0      	cbz	r0, 23a8 <get_eit_entry+0x54>
    2376:	f7ff ff9b 	bl	22b0 <selfrel_offset31>
    237a:	684b      	ldr	r3, [r1, #4]
    237c:	64a0      	str	r0, [r4, #72]	@ 0x48
    237e:	2b01      	cmp	r3, #1
    2380:	d02b      	beq.n	23da <get_eit_entry+0x86>
    2382:	2b00      	cmp	r3, #0
    2384:	f101 0004 	add.w	r0, r1, #4
    2388:	db25      	blt.n	23d6 <get_eit_entry+0x82>
    238a:	f7ff ff91 	bl	22b0 <selfrel_offset31>
    238e:	2300      	movs	r3, #0
    2390:	6523      	str	r3, [r4, #80]	@ 0x50
    2392:	6803      	ldr	r3, [r0, #0]
    2394:	64e0      	str	r0, [r4, #76]	@ 0x4c
    2396:	2b00      	cmp	r3, #0
    2398:	db12      	blt.n	23c0 <get_eit_entry+0x6c>
    239a:	f7ff ff89 	bl	22b0 <selfrel_offset31>
    239e:	4603      	mov	r3, r0
    23a0:	2000      	movs	r0, #0
    23a2:	6123      	str	r3, [r4, #16]
    23a4:	b003      	add	sp, #12
    23a6:	bd30      	pop	{r4, r5, pc}
    23a8:	2300      	movs	r3, #0
    23aa:	2009      	movs	r0, #9
    23ac:	6123      	str	r3, [r4, #16]
    23ae:	b003      	add	sp, #12
    23b0:	bd30      	pop	{r4, r5, pc}
    23b2:	4b0c      	ldr	r3, [pc, #48]	@ (23e4 <get_eit_entry+0x90>)
    23b4:	490c      	ldr	r1, [pc, #48]	@ (23e8 <get_eit_entry+0x94>)
    23b6:	1ac9      	subs	r1, r1, r3
    23b8:	10c9      	asrs	r1, r1, #3
    23ba:	4618      	mov	r0, r3
    23bc:	9101      	str	r1, [sp, #4]
    23be:	e7d5      	b.n	236c <get_eit_entry+0x18>
    23c0:	f3c3 6003 	ubfx	r0, r3, #24, #4
    23c4:	f7ff ffb2 	bl	232c <__gnu_unwind_get_pr_addr>
    23c8:	1e03      	subs	r3, r0, #0
    23ca:	bf0c      	ite	eq
    23cc:	2009      	moveq	r0, #9
    23ce:	2000      	movne	r0, #0
    23d0:	6123      	str	r3, [r4, #16]
    23d2:	b003      	add	sp, #12
    23d4:	bd30      	pop	{r4, r5, pc}
    23d6:	2301      	movs	r3, #1
    23d8:	e7da      	b.n	2390 <get_eit_entry+0x3c>
    23da:	2300      	movs	r3, #0
    23dc:	2005      	movs	r0, #5
    23de:	e7e0      	b.n	23a2 <get_eit_entry+0x4e>
    23e0:	00000000 	.word	0x00000000
    23e4:	000048b0 	.word	0x000048b0
    23e8:	00004978 	.word	0x00004978

000023ec <restore_non_core_regs>:
    23ec:	6803      	ldr	r3, [r0, #0]
    23ee:	07da      	lsls	r2, r3, #31
    23f0:	b510      	push	{r4, lr}
    23f2:	4604      	mov	r4, r0
    23f4:	d406      	bmi.n	2404 <restore_non_core_regs+0x18>
    23f6:	079b      	lsls	r3, r3, #30
    23f8:	f100 0050 	add.w	r0, r0, #80	@ 0x50
    23fc:	d509      	bpl.n	2412 <restore_non_core_regs+0x26>
    23fe:	f000 fc95 	bl	2d2c <__gnu_Unwind_Restore_VFP_D>
    2402:	6823      	ldr	r3, [r4, #0]
    2404:	0759      	lsls	r1, r3, #29
    2406:	d509      	bpl.n	241c <restore_non_core_regs+0x30>
    2408:	071a      	lsls	r2, r3, #28
    240a:	d50e      	bpl.n	242a <restore_non_core_regs+0x3e>
    240c:	06db      	lsls	r3, r3, #27
    240e:	d513      	bpl.n	2438 <restore_non_core_regs+0x4c>
    2410:	bd10      	pop	{r4, pc}
    2412:	f000 fc83 	bl	2d1c <__gnu_Unwind_Restore_VFP>
    2416:	6823      	ldr	r3, [r4, #0]
    2418:	0759      	lsls	r1, r3, #29
    241a:	d4f5      	bmi.n	2408 <restore_non_core_regs+0x1c>
    241c:	f104 00d8 	add.w	r0, r4, #216	@ 0xd8
    2420:	f000 fc8c 	bl	2d3c <__gnu_Unwind_Restore_VFP_D_16_to_31>
    2424:	6823      	ldr	r3, [r4, #0]
    2426:	071a      	lsls	r2, r3, #28
    2428:	d4f0      	bmi.n	240c <restore_non_core_regs+0x20>
    242a:	f504 70ac 	add.w	r0, r4, #344	@ 0x158
    242e:	f000 fc8d 	bl	2d4c <__gnu_Unwind_Restore_WMMXD>
    2432:	6823      	ldr	r3, [r4, #0]
    2434:	06db      	lsls	r3, r3, #27
    2436:	d4eb      	bmi.n	2410 <restore_non_core_regs+0x24>
    2438:	f504 70ec 	add.w	r0, r4, #472	@ 0x1d8
    243c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    2440:	f000 bcc8 	b.w	2dd4 <__gnu_Unwind_Restore_WMMXC>

00002444 <_Unwind_decode_typeinfo_ptr.constprop.0>:
    2444:	4603      	mov	r3, r0
    2446:	6800      	ldr	r0, [r0, #0]
    2448:	b100      	cbz	r0, 244c <_Unwind_decode_typeinfo_ptr.constprop.0+0x8>
    244a:	4418      	add	r0, r3
    244c:	4770      	bx	lr
    244e:	bf00      	nop

00002450 <__gnu_unwind_24bit.isra.0>:
    2450:	2009      	movs	r0, #9
    2452:	4770      	bx	lr

00002454 <_Unwind_DebugHook>:
    2454:	4770      	bx	lr
    2456:	bf00      	nop

00002458 <unwind_phase2>:
    2458:	b570      	push	{r4, r5, r6, lr}
    245a:	4604      	mov	r4, r0
    245c:	460e      	mov	r6, r1
    245e:	6c31      	ldr	r1, [r6, #64]	@ 0x40
    2460:	4620      	mov	r0, r4
    2462:	f7ff ff77 	bl	2354 <get_eit_entry>
    2466:	4605      	mov	r5, r0
    2468:	b988      	cbnz	r0, 248e <unwind_phase2+0x36>
    246a:	6c32      	ldr	r2, [r6, #64]	@ 0x40
    246c:	6162      	str	r2, [r4, #20]
    246e:	6923      	ldr	r3, [r4, #16]
    2470:	4632      	mov	r2, r6
    2472:	4621      	mov	r1, r4
    2474:	2001      	movs	r0, #1
    2476:	4798      	blx	r3
    2478:	2808      	cmp	r0, #8
    247a:	d0f0      	beq.n	245e <unwind_phase2+0x6>
    247c:	2807      	cmp	r0, #7
    247e:	d106      	bne.n	248e <unwind_phase2+0x36>
    2480:	4628      	mov	r0, r5
    2482:	6c31      	ldr	r1, [r6, #64]	@ 0x40
    2484:	f7ff ffe6 	bl	2454 <_Unwind_DebugHook>
    2488:	1d30      	adds	r0, r6, #4
    248a:	f000 fc3b 	bl	2d04 <__restore_core_regs>
    248e:	deff      	udf	#255	@ 0xff

00002490 <unwind_phase2_forced>:
    2490:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2494:	f101 0c04 	add.w	ip, r1, #4
    2498:	68c7      	ldr	r7, [r0, #12]
    249a:	f8d0 8018 	ldr.w	r8, [r0, #24]
    249e:	4606      	mov	r6, r0
    24a0:	4691      	mov	r9, r2
    24a2:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    24a6:	f5ad 7d76 	sub.w	sp, sp, #984	@ 0x3d8
    24aa:	ac03      	add	r4, sp, #12
    24ac:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    24ae:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    24b2:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    24b4:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    24b8:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    24ba:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    24be:	ad02      	add	r5, sp, #8
    24c0:	f04f 0e00 	mov.w	lr, #0
    24c4:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    24c8:	f8c5 e000 	str.w	lr, [r5]
    24cc:	e021      	b.n	2512 <unwind_phase2_forced+0x82>
    24ce:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
    24d0:	6173      	str	r3, [r6, #20]
    24d2:	f44f 72f4 	mov.w	r2, #488	@ 0x1e8
    24d6:	4629      	mov	r1, r5
    24d8:	a87c      	add	r0, sp, #496	@ 0x1f0
    24da:	f000 ff19 	bl	3310 <memcpy>
    24de:	6933      	ldr	r3, [r6, #16]
    24e0:	aa7c      	add	r2, sp, #496	@ 0x1f0
    24e2:	4631      	mov	r1, r6
    24e4:	4650      	mov	r0, sl
    24e6:	4798      	blx	r3
    24e8:	9b8a      	ldr	r3, [sp, #552]	@ 0x228
    24ea:	64ab      	str	r3, [r5, #72]	@ 0x48
    24ec:	4649      	mov	r1, r9
    24ee:	e9cd 5800 	strd	r5, r8, [sp]
    24f2:	4682      	mov	sl, r0
    24f4:	4633      	mov	r3, r6
    24f6:	2001      	movs	r0, #1
    24f8:	4632      	mov	r2, r6
    24fa:	47b8      	blx	r7
    24fc:	4681      	mov	r9, r0
    24fe:	bb30      	cbnz	r0, 254e <unwind_phase2_forced+0xbe>
    2500:	f44f 72f4 	mov.w	r2, #488	@ 0x1e8
    2504:	a97c      	add	r1, sp, #496	@ 0x1f0
    2506:	4628      	mov	r0, r5
    2508:	f000 ff02 	bl	3310 <memcpy>
    250c:	f1ba 0f08 	cmp.w	sl, #8
    2510:	d11a      	bne.n	2548 <unwind_phase2_forced+0xb8>
    2512:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    2514:	4630      	mov	r0, r6
    2516:	f7ff ff1d 	bl	2354 <get_eit_entry>
    251a:	f109 0909 	add.w	r9, r9, #9
    251e:	4604      	mov	r4, r0
    2520:	fa5f fa89 	uxtb.w	sl, r9
    2524:	2800      	cmp	r0, #0
    2526:	d0d2      	beq.n	24ce <unwind_phase2_forced+0x3e>
    2528:	6bab      	ldr	r3, [r5, #56]	@ 0x38
    252a:	64ab      	str	r3, [r5, #72]	@ 0x48
    252c:	4632      	mov	r2, r6
    252e:	e9cd 5800 	strd	r5, r8, [sp]
    2532:	4633      	mov	r3, r6
    2534:	f04a 0110 	orr.w	r1, sl, #16
    2538:	2001      	movs	r0, #1
    253a:	47b8      	blx	r7
    253c:	b938      	cbnz	r0, 254e <unwind_phase2_forced+0xbe>
    253e:	4620      	mov	r0, r4
    2540:	f50d 7d76 	add.w	sp, sp, #984	@ 0x3d8
    2544:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2548:	f1ba 0f07 	cmp.w	sl, #7
    254c:	d005      	beq.n	255a <unwind_phase2_forced+0xca>
    254e:	2409      	movs	r4, #9
    2550:	4620      	mov	r0, r4
    2552:	f50d 7d76 	add.w	sp, sp, #984	@ 0x3d8
    2556:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    255a:	4648      	mov	r0, r9
    255c:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    255e:	f7ff ff79 	bl	2454 <_Unwind_DebugHook>
    2562:	a803      	add	r0, sp, #12
    2564:	f000 fbce 	bl	2d04 <__restore_core_regs>

00002568 <_Unwind_GetCFA>:
    2568:	6c80      	ldr	r0, [r0, #72]	@ 0x48
    256a:	4770      	bx	lr

0000256c <__gnu_Unwind_RaiseException>:
    256c:	b5f0      	push	{r4, r5, r6, r7, lr}
    256e:	6bcb      	ldr	r3, [r1, #60]	@ 0x3c
    2570:	640b      	str	r3, [r1, #64]	@ 0x40
    2572:	f101 0c04 	add.w	ip, r1, #4
    2576:	460e      	mov	r6, r1
    2578:	4605      	mov	r5, r0
    257a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    257e:	b0fb      	sub	sp, #492	@ 0x1ec
    2580:	ac01      	add	r4, sp, #4
    2582:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2584:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2588:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    258a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    258e:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2590:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    2594:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
    2598:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    259c:	9700      	str	r7, [sp, #0]
    259e:	e006      	b.n	25ae <__gnu_Unwind_RaiseException+0x42>
    25a0:	692b      	ldr	r3, [r5, #16]
    25a2:	466a      	mov	r2, sp
    25a4:	4629      	mov	r1, r5
    25a6:	4798      	blx	r3
    25a8:	2808      	cmp	r0, #8
    25aa:	4604      	mov	r4, r0
    25ac:	d108      	bne.n	25c0 <__gnu_Unwind_RaiseException+0x54>
    25ae:	9910      	ldr	r1, [sp, #64]	@ 0x40
    25b0:	4628      	mov	r0, r5
    25b2:	f7ff fecf 	bl	2354 <get_eit_entry>
    25b6:	2800      	cmp	r0, #0
    25b8:	d0f2      	beq.n	25a0 <__gnu_Unwind_RaiseException+0x34>
    25ba:	2009      	movs	r0, #9
    25bc:	b07b      	add	sp, #492	@ 0x1ec
    25be:	bdf0      	pop	{r4, r5, r6, r7, pc}
    25c0:	4668      	mov	r0, sp
    25c2:	f7ff ff13 	bl	23ec <restore_non_core_regs>
    25c6:	2c06      	cmp	r4, #6
    25c8:	d1f7      	bne.n	25ba <__gnu_Unwind_RaiseException+0x4e>
    25ca:	4631      	mov	r1, r6
    25cc:	4628      	mov	r0, r5
    25ce:	f7ff ff43 	bl	2458 <unwind_phase2>
    25d2:	bf00      	nop

000025d4 <__gnu_Unwind_ForcedUnwind>:
    25d4:	60c1      	str	r1, [r0, #12]
    25d6:	6bd9      	ldr	r1, [r3, #60]	@ 0x3c
    25d8:	6182      	str	r2, [r0, #24]
    25da:	6419      	str	r1, [r3, #64]	@ 0x40
    25dc:	2200      	movs	r2, #0
    25de:	4619      	mov	r1, r3
    25e0:	e756      	b.n	2490 <unwind_phase2_forced>
    25e2:	bf00      	nop

000025e4 <__gnu_Unwind_Resume>:
    25e4:	b570      	push	{r4, r5, r6, lr}
    25e6:	68c6      	ldr	r6, [r0, #12]
    25e8:	6943      	ldr	r3, [r0, #20]
    25ea:	640b      	str	r3, [r1, #64]	@ 0x40
    25ec:	b9ae      	cbnz	r6, 261a <__gnu_Unwind_Resume+0x36>
    25ee:	6903      	ldr	r3, [r0, #16]
    25f0:	460a      	mov	r2, r1
    25f2:	4604      	mov	r4, r0
    25f4:	460d      	mov	r5, r1
    25f6:	4601      	mov	r1, r0
    25f8:	2002      	movs	r0, #2
    25fa:	4798      	blx	r3
    25fc:	2807      	cmp	r0, #7
    25fe:	d005      	beq.n	260c <__gnu_Unwind_Resume+0x28>
    2600:	2808      	cmp	r0, #8
    2602:	d10e      	bne.n	2622 <__gnu_Unwind_Resume+0x3e>
    2604:	4629      	mov	r1, r5
    2606:	4620      	mov	r0, r4
    2608:	f7ff ff26 	bl	2458 <unwind_phase2>
    260c:	4630      	mov	r0, r6
    260e:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    2610:	f7ff ff20 	bl	2454 <_Unwind_DebugHook>
    2614:	1d28      	adds	r0, r5, #4
    2616:	f000 fb75 	bl	2d04 <__restore_core_regs>
    261a:	2201      	movs	r2, #1
    261c:	f7ff ff38 	bl	2490 <unwind_phase2_forced>
    2620:	deff      	udf	#255	@ 0xff
    2622:	deff      	udf	#255	@ 0xff

00002624 <__gnu_Unwind_Resume_or_Rethrow>:
    2624:	68c2      	ldr	r2, [r0, #12]
    2626:	b11a      	cbz	r2, 2630 <__gnu_Unwind_Resume_or_Rethrow+0xc>
    2628:	6bca      	ldr	r2, [r1, #60]	@ 0x3c
    262a:	640a      	str	r2, [r1, #64]	@ 0x40
    262c:	2200      	movs	r2, #0
    262e:	e72f      	b.n	2490 <unwind_phase2_forced>
    2630:	e79c      	b.n	256c <__gnu_Unwind_RaiseException>
    2632:	bf00      	nop

00002634 <_Unwind_Complete>:
    2634:	4770      	bx	lr
    2636:	bf00      	nop

00002638 <_Unwind_DeleteException>:
    2638:	6883      	ldr	r3, [r0, #8]
    263a:	4601      	mov	r1, r0
    263c:	b10b      	cbz	r3, 2642 <_Unwind_DeleteException+0xa>
    263e:	2001      	movs	r0, #1
    2640:	4718      	bx	r3
    2642:	4770      	bx	lr

00002644 <_Unwind_VRS_Get>:
    2644:	2905      	cmp	r1, #5
    2646:	d815      	bhi.n	2674 <_Unwind_VRS_Get+0x30>
    2648:	e8df f001 	tbb	[pc, r1]
    264c:	0314030a 	.word	0x0314030a
    2650:	0503      	.short	0x0503
    2652:	2001      	movs	r0, #1
    2654:	4770      	bx	lr
    2656:	9a00      	ldr	r2, [sp, #0]
    2658:	6c43      	ldr	r3, [r0, #68]	@ 0x44
    265a:	6013      	str	r3, [r2, #0]
    265c:	2000      	movs	r0, #0
    265e:	4770      	bx	lr
    2660:	b943      	cbnz	r3, 2674 <_Unwind_VRS_Get+0x30>
    2662:	2a0f      	cmp	r2, #15
    2664:	d806      	bhi.n	2674 <_Unwind_VRS_Get+0x30>
    2666:	eb00 0282 	add.w	r2, r0, r2, lsl #2
    266a:	2000      	movs	r0, #0
    266c:	6853      	ldr	r3, [r2, #4]
    266e:	9a00      	ldr	r2, [sp, #0]
    2670:	6013      	str	r3, [r2, #0]
    2672:	4770      	bx	lr
    2674:	2002      	movs	r0, #2
    2676:	4770      	bx	lr

00002678 <_Unwind_GetGR>:
    2678:	b500      	push	{lr}
    267a:	b085      	sub	sp, #20
    267c:	460a      	mov	r2, r1
    267e:	2300      	movs	r3, #0
    2680:	a903      	add	r1, sp, #12
    2682:	9100      	str	r1, [sp, #0]
    2684:	4619      	mov	r1, r3
    2686:	f7ff ffdd 	bl	2644 <_Unwind_VRS_Get>
    268a:	9803      	ldr	r0, [sp, #12]
    268c:	b005      	add	sp, #20
    268e:	f85d fb04 	ldr.w	pc, [sp], #4
    2692:	bf00      	nop

00002694 <_Unwind_VRS_Set>:
    2694:	2905      	cmp	r1, #5
    2696:	d815      	bhi.n	26c4 <_Unwind_VRS_Set+0x30>
    2698:	e8df f001 	tbb	[pc, r1]
    269c:	0314030a 	.word	0x0314030a
    26a0:	0503      	.short	0x0503
    26a2:	2001      	movs	r0, #1
    26a4:	4770      	bx	lr
    26a6:	9b00      	ldr	r3, [sp, #0]
    26a8:	681b      	ldr	r3, [r3, #0]
    26aa:	6443      	str	r3, [r0, #68]	@ 0x44
    26ac:	2000      	movs	r0, #0
    26ae:	4770      	bx	lr
    26b0:	b943      	cbnz	r3, 26c4 <_Unwind_VRS_Set+0x30>
    26b2:	2a0f      	cmp	r2, #15
    26b4:	d806      	bhi.n	26c4 <_Unwind_VRS_Set+0x30>
    26b6:	9b00      	ldr	r3, [sp, #0]
    26b8:	eb00 0282 	add.w	r2, r0, r2, lsl #2
    26bc:	681b      	ldr	r3, [r3, #0]
    26be:	6053      	str	r3, [r2, #4]
    26c0:	2000      	movs	r0, #0
    26c2:	4770      	bx	lr
    26c4:	2002      	movs	r0, #2
    26c6:	4770      	bx	lr

000026c8 <_Unwind_SetGR>:
    26c8:	b510      	push	{r4, lr}
    26ca:	b084      	sub	sp, #16
    26cc:	2300      	movs	r3, #0
    26ce:	ac03      	add	r4, sp, #12
    26d0:	9203      	str	r2, [sp, #12]
    26d2:	9400      	str	r4, [sp, #0]
    26d4:	460a      	mov	r2, r1
    26d6:	4619      	mov	r1, r3
    26d8:	f7ff ffdc 	bl	2694 <_Unwind_VRS_Set>
    26dc:	b004      	add	sp, #16
    26de:	bd10      	pop	{r4, pc}

000026e0 <__gnu_Unwind_Backtrace>:
    26e0:	b570      	push	{r4, r5, r6, lr}
    26e2:	6bd3      	ldr	r3, [r2, #60]	@ 0x3c
    26e4:	6413      	str	r3, [r2, #64]	@ 0x40
    26e6:	f102 0c04 	add.w	ip, r2, #4
    26ea:	4605      	mov	r5, r0
    26ec:	460c      	mov	r4, r1
    26ee:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    26f2:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
    26f6:	f10d 0e5c 	add.w	lr, sp, #92	@ 0x5c
    26fa:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    26fe:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2702:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    2706:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    270a:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    270e:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    2712:	f04f 36ff 	mov.w	r6, #4294967295	@ 0xffffffff
    2716:	e88e 000f 	stmia.w	lr, {r0, r1, r2, r3}
    271a:	9616      	str	r6, [sp, #88]	@ 0x58
    271c:	e010      	b.n	2740 <__gnu_Unwind_Backtrace+0x60>
    271e:	f7ff ffd3 	bl	26c8 <_Unwind_SetGR>
    2722:	4621      	mov	r1, r4
    2724:	a816      	add	r0, sp, #88	@ 0x58
    2726:	47a8      	blx	r5
    2728:	4603      	mov	r3, r0
    272a:	aa16      	add	r2, sp, #88	@ 0x58
    272c:	2008      	movs	r0, #8
    272e:	4669      	mov	r1, sp
    2730:	b983      	cbnz	r3, 2754 <__gnu_Unwind_Backtrace+0x74>
    2732:	9b04      	ldr	r3, [sp, #16]
    2734:	4798      	blx	r3
    2736:	2805      	cmp	r0, #5
    2738:	4606      	mov	r6, r0
    273a:	d00c      	beq.n	2756 <__gnu_Unwind_Backtrace+0x76>
    273c:	2809      	cmp	r0, #9
    273e:	d009      	beq.n	2754 <__gnu_Unwind_Backtrace+0x74>
    2740:	9926      	ldr	r1, [sp, #152]	@ 0x98
    2742:	4668      	mov	r0, sp
    2744:	f7ff fe06 	bl	2354 <get_eit_entry>
    2748:	4603      	mov	r3, r0
    274a:	210c      	movs	r1, #12
    274c:	466a      	mov	r2, sp
    274e:	a816      	add	r0, sp, #88	@ 0x58
    2750:	2b00      	cmp	r3, #0
    2752:	d0e4      	beq.n	271e <__gnu_Unwind_Backtrace+0x3e>
    2754:	2609      	movs	r6, #9
    2756:	a816      	add	r0, sp, #88	@ 0x58
    2758:	f7ff fe48 	bl	23ec <restore_non_core_regs>
    275c:	4630      	mov	r0, r6
    275e:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
    2762:	bd70      	pop	{r4, r5, r6, pc}

00002764 <__gnu_unwind_pr_common>:
    2764:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2768:	4616      	mov	r6, r2
    276a:	6cca      	ldr	r2, [r1, #76]	@ 0x4c
    276c:	b089      	sub	sp, #36	@ 0x24
    276e:	460d      	mov	r5, r1
    2770:	f852 1b04 	ldr.w	r1, [r2], #4
    2774:	9206      	str	r2, [sp, #24]
    2776:	f000 0c03 	and.w	ip, r0, #3
    277a:	2b00      	cmp	r3, #0
    277c:	d079      	beq.n	2872 <__gnu_unwind_pr_common+0x10e>
    277e:	0c0c      	lsrs	r4, r1, #16
    2780:	f88d 401d 	strb.w	r4, [sp, #29]
    2784:	0409      	lsls	r1, r1, #16
    2786:	b2e4      	uxtb	r4, r4
    2788:	9105      	str	r1, [sp, #20]
    278a:	eb02 0284 	add.w	r2, r2, r4, lsl #2
    278e:	2102      	movs	r1, #2
    2790:	f88d 101c 	strb.w	r1, [sp, #28]
    2794:	6d29      	ldr	r1, [r5, #80]	@ 0x50
    2796:	f1bc 0f02 	cmp.w	ip, #2
    279a:	bf08      	it	eq
    279c:	6baa      	ldreq	r2, [r5, #56]	@ 0x38
    279e:	f011 0801 	ands.w	r8, r1, #1
    27a2:	d009      	beq.n	27b8 <__gnu_unwind_pr_common+0x54>
    27a4:	a905      	add	r1, sp, #20
    27a6:	4630      	mov	r0, r6
    27a8:	f000 fbae 	bl	2f08 <__gnu_unwind_execute>
    27ac:	2800      	cmp	r0, #0
    27ae:	d156      	bne.n	285e <__gnu_unwind_pr_common+0xfa>
    27b0:	2008      	movs	r0, #8
    27b2:	b009      	add	sp, #36	@ 0x24
    27b4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    27b8:	6817      	ldr	r7, [r2, #0]
    27ba:	2f00      	cmp	r7, #0
    27bc:	d0f2      	beq.n	27a4 <__gnu_unwind_pr_common+0x40>
    27be:	f000 0108 	and.w	r1, r0, #8
    27c2:	e9cd 1801 	strd	r1, r8, [sp, #4]
    27c6:	46e3      	mov	fp, ip
    27c8:	469a      	mov	sl, r3
    27ca:	f1ba 0f02 	cmp.w	sl, #2
    27ce:	d04c      	beq.n	286a <__gnu_unwind_pr_common+0x106>
    27d0:	8817      	ldrh	r7, [r2, #0]
    27d2:	8854      	ldrh	r4, [r2, #2]
    27d4:	f102 0904 	add.w	r9, r2, #4
    27d8:	6caa      	ldr	r2, [r5, #72]	@ 0x48
    27da:	f024 0301 	bic.w	r3, r4, #1
    27de:	210f      	movs	r1, #15
    27e0:	4630      	mov	r0, r6
    27e2:	eb03 0802 	add.w	r8, r3, r2
    27e6:	f7ff ff47 	bl	2678 <_Unwind_GetGR>
    27ea:	4580      	cmp	r8, r0
    27ec:	d83b      	bhi.n	2866 <__gnu_unwind_pr_common+0x102>
    27ee:	f027 0201 	bic.w	r2, r7, #1
    27f2:	eb02 0308 	add.w	r3, r2, r8
    27f6:	4283      	cmp	r3, r0
    27f8:	bf94      	ite	ls
    27fa:	2300      	movls	r3, #0
    27fc:	2301      	movhi	r3, #1
    27fe:	0064      	lsls	r4, r4, #1
    2800:	f004 0402 	and.w	r4, r4, #2
    2804:	f007 0701 	and.w	r7, r7, #1
    2808:	4327      	orrs	r7, r4
    280a:	2f01      	cmp	r7, #1
    280c:	d04e      	beq.n	28ac <__gnu_unwind_pr_common+0x148>
    280e:	2f02      	cmp	r7, #2
    2810:	d035      	beq.n	287e <__gnu_unwind_pr_common+0x11a>
    2812:	bb27      	cbnz	r7, 285e <__gnu_unwind_pr_common+0xfa>
    2814:	f1bb 0f00 	cmp.w	fp, #0
    2818:	d002      	beq.n	2820 <__gnu_unwind_pr_common+0xbc>
    281a:	2b00      	cmp	r3, #0
    281c:	f040 80d3 	bne.w	29c6 <__gnu_unwind_pr_common+0x262>
    2820:	f109 0204 	add.w	r2, r9, #4
    2824:	6817      	ldr	r7, [r2, #0]
    2826:	2f00      	cmp	r7, #0
    2828:	d1cf      	bne.n	27ca <__gnu_unwind_pr_common+0x66>
    282a:	a905      	add	r1, sp, #20
    282c:	4630      	mov	r0, r6
    282e:	f8dd 8008 	ldr.w	r8, [sp, #8]
    2832:	f000 fb69 	bl	2f08 <__gnu_unwind_execute>
    2836:	b990      	cbnz	r0, 285e <__gnu_unwind_pr_common+0xfa>
    2838:	f1b8 0f00 	cmp.w	r8, #0
    283c:	d0b8      	beq.n	27b0 <__gnu_unwind_pr_common+0x4c>
    283e:	210f      	movs	r1, #15
    2840:	4630      	mov	r0, r6
    2842:	f7ff ff19 	bl	2678 <_Unwind_GetGR>
    2846:	210e      	movs	r1, #14
    2848:	4602      	mov	r2, r0
    284a:	4630      	mov	r0, r6
    284c:	f7ff ff3c 	bl	26c8 <_Unwind_SetGR>
    2850:	4a6c      	ldr	r2, [pc, #432]	@ (2a04 <__gnu_unwind_pr_common+0x2a0>)
    2852:	210f      	movs	r1, #15
    2854:	4630      	mov	r0, r6
    2856:	f7ff ff37 	bl	26c8 <_Unwind_SetGR>
    285a:	2007      	movs	r0, #7
    285c:	e000      	b.n	2860 <__gnu_unwind_pr_common+0xfc>
    285e:	2009      	movs	r0, #9
    2860:	b009      	add	sp, #36	@ 0x24
    2862:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2866:	2300      	movs	r3, #0
    2868:	e7c9      	b.n	27fe <__gnu_unwind_pr_common+0x9a>
    286a:	6854      	ldr	r4, [r2, #4]
    286c:	f102 0908 	add.w	r9, r2, #8
    2870:	e7b2      	b.n	27d8 <__gnu_unwind_pr_common+0x74>
    2872:	0209      	lsls	r1, r1, #8
    2874:	9105      	str	r1, [sp, #20]
    2876:	f88d 301d 	strb.w	r3, [sp, #29]
    287a:	2103      	movs	r1, #3
    287c:	e788      	b.n	2790 <__gnu_unwind_pr_common+0x2c>
    287e:	f8d9 4000 	ldr.w	r4, [r9]
    2882:	f024 4800 	bic.w	r8, r4, #2147483648	@ 0x80000000
    2886:	f1bb 0f00 	cmp.w	fp, #0
    288a:	d147      	bne.n	291c <__gnu_unwind_pr_common+0x1b8>
    288c:	b12b      	cbz	r3, 289a <__gnu_unwind_pr_common+0x136>
    288e:	9b01      	ldr	r3, [sp, #4]
    2890:	2b00      	cmp	r3, #0
    2892:	d05c      	beq.n	294e <__gnu_unwind_pr_common+0x1ea>
    2894:	f1b8 0f00 	cmp.w	r8, #0
    2898:	d059      	beq.n	294e <__gnu_unwind_pr_common+0x1ea>
    289a:	2c00      	cmp	r4, #0
    289c:	da01      	bge.n	28a2 <__gnu_unwind_pr_common+0x13e>
    289e:	f109 0904 	add.w	r9, r9, #4
    28a2:	f108 0201 	add.w	r2, r8, #1
    28a6:	eb09 0282 	add.w	r2, r9, r2, lsl #2
    28aa:	e7bb      	b.n	2824 <__gnu_unwind_pr_common+0xc0>
    28ac:	f1bb 0f00 	cmp.w	fp, #0
    28b0:	d11c      	bne.n	28ec <__gnu_unwind_pr_common+0x188>
    28b2:	b1c3      	cbz	r3, 28e6 <__gnu_unwind_pr_common+0x182>
    28b4:	f8d9 3004 	ldr.w	r3, [r9, #4]
    28b8:	f8d9 2000 	ldr.w	r2, [r9]
    28bc:	1c99      	adds	r1, r3, #2
    28be:	ea4f 72d2 	mov.w	r2, r2, lsr #31
    28c2:	d0cc      	beq.n	285e <__gnu_unwind_pr_common+0xfa>
    28c4:	f105 0458 	add.w	r4, r5, #88	@ 0x58
    28c8:	3301      	adds	r3, #1
    28ca:	9404      	str	r4, [sp, #16]
    28cc:	f000 808e 	beq.w	29ec <__gnu_unwind_pr_common+0x288>
    28d0:	f109 0004 	add.w	r0, r9, #4
    28d4:	f7ff fdb6 	bl	2444 <_Unwind_decode_typeinfo_ptr.constprop.0>
    28d8:	ab04      	add	r3, sp, #16
    28da:	4601      	mov	r1, r0
    28dc:	4628      	mov	r0, r5
    28de:	f3af 8000 	nop.w
    28e2:	2800      	cmp	r0, #0
    28e4:	d159      	bne.n	299a <__gnu_unwind_pr_common+0x236>
    28e6:	f109 0208 	add.w	r2, r9, #8
    28ea:	e79b      	b.n	2824 <__gnu_unwind_pr_common+0xc0>
    28ec:	210d      	movs	r1, #13
    28ee:	4630      	mov	r0, r6
    28f0:	f7ff fec2 	bl	2678 <_Unwind_GetGR>
    28f4:	6a2c      	ldr	r4, [r5, #32]
    28f6:	4284      	cmp	r4, r0
    28f8:	d1f5      	bne.n	28e6 <__gnu_unwind_pr_common+0x182>
    28fa:	6aab      	ldr	r3, [r5, #40]	@ 0x28
    28fc:	4599      	cmp	r9, r3
    28fe:	d1f2      	bne.n	28e6 <__gnu_unwind_pr_common+0x182>
    2900:	4648      	mov	r0, r9
    2902:	f7ff fcd5 	bl	22b0 <selfrel_offset31>
    2906:	210f      	movs	r1, #15
    2908:	4602      	mov	r2, r0
    290a:	4630      	mov	r0, r6
    290c:	f7ff fedc 	bl	26c8 <_Unwind_SetGR>
    2910:	462a      	mov	r2, r5
    2912:	2100      	movs	r1, #0
    2914:	4630      	mov	r0, r6
    2916:	f7ff fed7 	bl	26c8 <_Unwind_SetGR>
    291a:	e79e      	b.n	285a <__gnu_unwind_pr_common+0xf6>
    291c:	210d      	movs	r1, #13
    291e:	4630      	mov	r0, r6
    2920:	f7ff feaa 	bl	2678 <_Unwind_GetGR>
    2924:	6a2f      	ldr	r7, [r5, #32]
    2926:	4287      	cmp	r7, r0
    2928:	d1b7      	bne.n	289a <__gnu_unwind_pr_common+0x136>
    292a:	6aab      	ldr	r3, [r5, #40]	@ 0x28
    292c:	4599      	cmp	r9, r3
    292e:	d1b4      	bne.n	289a <__gnu_unwind_pr_common+0x136>
    2930:	2400      	movs	r4, #0
    2932:	2304      	movs	r3, #4
    2934:	e9c5 430b 	strd	r4, r3, [r5, #44]	@ 0x2c
    2938:	444b      	add	r3, r9
    293a:	f8c5 8028 	str.w	r8, [r5, #40]	@ 0x28
    293e:	636b      	str	r3, [r5, #52]	@ 0x34
    2940:	f8d9 3000 	ldr.w	r3, [r9]
    2944:	42a3      	cmp	r3, r4
    2946:	db58      	blt.n	29fa <__gnu_unwind_pr_common+0x296>
    2948:	2301      	movs	r3, #1
    294a:	9302      	str	r3, [sp, #8]
    294c:	e7a9      	b.n	28a2 <__gnu_unwind_pr_common+0x13e>
    294e:	f105 0358 	add.w	r3, r5, #88	@ 0x58
    2952:	f8cd b00c 	str.w	fp, [sp, #12]
    2956:	f109 0704 	add.w	r7, r9, #4
    295a:	46b3      	mov	fp, r6
    295c:	2400      	movs	r4, #0
    295e:	461e      	mov	r6, r3
    2960:	e00b      	b.n	297a <__gnu_unwind_pr_common+0x216>
    2962:	4638      	mov	r0, r7
    2964:	9604      	str	r6, [sp, #16]
    2966:	f7ff fd6d 	bl	2444 <_Unwind_decode_typeinfo_ptr.constprop.0>
    296a:	2200      	movs	r2, #0
    296c:	4601      	mov	r1, r0
    296e:	ab04      	add	r3, sp, #16
    2970:	4628      	mov	r0, r5
    2972:	f3af 8000 	nop.w
    2976:	3704      	adds	r7, #4
    2978:	b9f8      	cbnz	r0, 29ba <__gnu_unwind_pr_common+0x256>
    297a:	4544      	cmp	r4, r8
    297c:	f104 0401 	add.w	r4, r4, #1
    2980:	d1ef      	bne.n	2962 <__gnu_unwind_pr_common+0x1fe>
    2982:	210d      	movs	r1, #13
    2984:	4658      	mov	r0, fp
    2986:	f7ff fe77 	bl	2678 <_Unwind_GetGR>
    298a:	9b04      	ldr	r3, [sp, #16]
    298c:	f8c5 9028 	str.w	r9, [r5, #40]	@ 0x28
    2990:	4602      	mov	r2, r0
    2992:	e9c5 2308 	strd	r2, r3, [r5, #32]
    2996:	2006      	movs	r0, #6
    2998:	e762      	b.n	2860 <__gnu_unwind_pr_common+0xfc>
    299a:	4604      	mov	r4, r0
    299c:	210d      	movs	r1, #13
    299e:	4630      	mov	r0, r6
    29a0:	f7ff fe6a 	bl	2678 <_Unwind_GetGR>
    29a4:	9e04      	ldr	r6, [sp, #16]
    29a6:	6228      	str	r0, [r5, #32]
    29a8:	2c02      	cmp	r4, #2
    29aa:	bf04      	itt	eq
    29ac:	62ee      	streq	r6, [r5, #44]	@ 0x2c
    29ae:	f105 062c 	addeq.w	r6, r5, #44	@ 0x2c
    29b2:	e9c5 6909 	strd	r6, r9, [r5, #36]	@ 0x24
    29b6:	2006      	movs	r0, #6
    29b8:	e752      	b.n	2860 <__gnu_unwind_pr_common+0xfc>
    29ba:	465e      	mov	r6, fp
    29bc:	f8d9 4000 	ldr.w	r4, [r9]
    29c0:	f8dd b00c 	ldr.w	fp, [sp, #12]
    29c4:	e769      	b.n	289a <__gnu_unwind_pr_common+0x136>
    29c6:	4648      	mov	r0, r9
    29c8:	f7ff fc72 	bl	22b0 <selfrel_offset31>
    29cc:	f109 0304 	add.w	r3, r9, #4
    29d0:	4604      	mov	r4, r0
    29d2:	63ab      	str	r3, [r5, #56]	@ 0x38
    29d4:	4628      	mov	r0, r5
    29d6:	f3af 8000 	nop.w
    29da:	2800      	cmp	r0, #0
    29dc:	f43f af3f 	beq.w	285e <__gnu_unwind_pr_common+0xfa>
    29e0:	4622      	mov	r2, r4
    29e2:	210f      	movs	r1, #15
    29e4:	4630      	mov	r0, r6
    29e6:	f7ff fe6f 	bl	26c8 <_Unwind_SetGR>
    29ea:	e736      	b.n	285a <__gnu_unwind_pr_common+0xf6>
    29ec:	4630      	mov	r0, r6
    29ee:	210d      	movs	r1, #13
    29f0:	f7ff fe42 	bl	2678 <_Unwind_GetGR>
    29f4:	4626      	mov	r6, r4
    29f6:	6228      	str	r0, [r5, #32]
    29f8:	e7db      	b.n	29b2 <__gnu_unwind_pr_common+0x24e>
    29fa:	f108 0201 	add.w	r2, r8, #1
    29fe:	eb09 0082 	add.w	r0, r9, r2, lsl #2
    2a02:	e77e      	b.n	2902 <__gnu_unwind_pr_common+0x19e>
    2a04:	00000000 	.word	0x00000000

00002a08 <__aeabi_unwind_cpp_pr0>:
    2a08:	2300      	movs	r3, #0
    2a0a:	e6ab      	b.n	2764 <__gnu_unwind_pr_common>

00002a0c <__aeabi_unwind_cpp_pr1>:
    2a0c:	2301      	movs	r3, #1
    2a0e:	e6a9      	b.n	2764 <__gnu_unwind_pr_common>

00002a10 <__aeabi_unwind_cpp_pr2>:
    2a10:	2302      	movs	r3, #2
    2a12:	e6a7      	b.n	2764 <__gnu_unwind_pr_common>

00002a14 <_Unwind_VRS_Pop>:
    2a14:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2a18:	4606      	mov	r6, r0
    2a1a:	b0c4      	sub	sp, #272	@ 0x110
    2a1c:	4614      	mov	r4, r2
    2a1e:	2905      	cmp	r1, #5
    2a20:	f200 80d8 	bhi.w	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2a24:	e8df f011 	tbh	[pc, r1, lsl #1]
    2a28:	002d0012 	.word	0x002d0012
    2a2c:	006c00d6 	.word	0x006c00d6
    2a30:	00060091 	.word	0x00060091
    2a34:	6b83      	ldr	r3, [r0, #56]	@ 0x38
    2a36:	2c00      	cmp	r4, #0
    2a38:	f040 80cc 	bne.w	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2a3c:	f853 2b04 	ldr.w	r2, [r3], #4
    2a40:	6442      	str	r2, [r0, #68]	@ 0x44
    2a42:	6383      	str	r3, [r0, #56]	@ 0x38
    2a44:	2000      	movs	r0, #0
    2a46:	b044      	add	sp, #272	@ 0x110
    2a48:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    2a4c:	2b00      	cmp	r3, #0
    2a4e:	f040 80c1 	bne.w	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2a52:	6b85      	ldr	r5, [r0, #56]	@ 0x38
    2a54:	fa1f fc84 	uxth.w	ip, r4
    2a58:	2001      	movs	r0, #1
    2a5a:	f106 0e04 	add.w	lr, r6, #4
    2a5e:	fa00 f103 	lsl.w	r1, r0, r3
    2a62:	ea11 0f0c 	tst.w	r1, ip
    2a66:	462a      	mov	r2, r5
    2a68:	d004      	beq.n	2a74 <_Unwind_VRS_Pop+0x60>
    2a6a:	f852 1b04 	ldr.w	r1, [r2], #4
    2a6e:	f84e 1023 	str.w	r1, [lr, r3, lsl #2]
    2a72:	4615      	mov	r5, r2
    2a74:	3301      	adds	r3, #1
    2a76:	2b10      	cmp	r3, #16
    2a78:	d1f1      	bne.n	2a5e <_Unwind_VRS_Pop+0x4a>
    2a7a:	04a7      	lsls	r7, r4, #18
    2a7c:	d4e2      	bmi.n	2a44 <_Unwind_VRS_Pop+0x30>
    2a7e:	63b5      	str	r5, [r6, #56]	@ 0x38
    2a80:	e7e0      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2a82:	2b01      	cmp	r3, #1
    2a84:	ea4f 4714 	mov.w	r7, r4, lsr #16
    2a88:	b2a4      	uxth	r4, r4
    2a8a:	f000 8083 	beq.w	2b94 <_Unwind_VRS_Pop+0x180>
    2a8e:	2b05      	cmp	r3, #5
    2a90:	f040 80a0 	bne.w	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2a94:	eb07 0804 	add.w	r8, r7, r4
    2a98:	f1b8 0f20 	cmp.w	r8, #32
    2a9c:	f200 809a 	bhi.w	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2aa0:	2f0f      	cmp	r7, #15
    2aa2:	f240 8099 	bls.w	2bd8 <_Unwind_VRS_Pop+0x1c4>
    2aa6:	2c00      	cmp	r4, #0
    2aa8:	d0cc      	beq.n	2a44 <_Unwind_VRS_Pop+0x30>
    2aaa:	6802      	ldr	r2, [r0, #0]
    2aac:	0750      	lsls	r0, r2, #29
    2aae:	f100 8118 	bmi.w	2ce2 <_Unwind_VRS_Pop+0x2ce>
    2ab2:	9301      	str	r3, [sp, #4]
    2ab4:	ad02      	add	r5, sp, #8
    2ab6:	4628      	mov	r0, r5
    2ab8:	f000 f944 	bl	2d44 <__gnu_Unwind_Save_VFP_D_16_to_31>
    2abc:	ea4f 0c44 	mov.w	ip, r4, lsl #1
    2ac0:	f1a7 0010 	sub.w	r0, r7, #16
    2ac4:	6bb1      	ldr	r1, [r6, #56]	@ 0x38
    2ac6:	9b01      	ldr	r3, [sp, #4]
    2ac8:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
    2acc:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
    2ad0:	f10c 0c01 	add.w	ip, ip, #1
    2ad4:	3804      	subs	r0, #4
    2ad6:	eb01 028c 	add.w	r2, r1, ip, lsl #2
    2ada:	f851 4b04 	ldr.w	r4, [r1], #4
    2ade:	f840 4f04 	str.w	r4, [r0, #4]!
    2ae2:	4291      	cmp	r1, r2
    2ae4:	d1f9      	bne.n	2ada <_Unwind_VRS_Pop+0xc6>
    2ae6:	2b01      	cmp	r3, #1
    2ae8:	f000 80de 	beq.w	2ca8 <_Unwind_VRS_Pop+0x294>
    2aec:	2f0f      	cmp	r7, #15
    2aee:	63b1      	str	r1, [r6, #56]	@ 0x38
    2af0:	d802      	bhi.n	2af8 <_Unwind_VRS_Pop+0xe4>
    2af2:	a822      	add	r0, sp, #136	@ 0x88
    2af4:	f000 f91a 	bl	2d2c <__gnu_Unwind_Restore_VFP_D>
    2af8:	4628      	mov	r0, r5
    2afa:	f000 f91f 	bl	2d3c <__gnu_Unwind_Restore_VFP_D_16_to_31>
    2afe:	e7a1      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2b00:	2b03      	cmp	r3, #3
    2b02:	d167      	bne.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b04:	b2a7      	uxth	r7, r4
    2b06:	eb07 4314 	add.w	r3, r7, r4, lsr #16
    2b0a:	2b10      	cmp	r3, #16
    2b0c:	ea4f 4414 	mov.w	r4, r4, lsr #16
    2b10:	d860      	bhi.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b12:	6803      	ldr	r3, [r0, #0]
    2b14:	0719      	lsls	r1, r3, #28
    2b16:	f100 80bf 	bmi.w	2c98 <_Unwind_VRS_Pop+0x284>
    2b1a:	ad22      	add	r5, sp, #136	@ 0x88
    2b1c:	4628      	mov	r0, r5
    2b1e:	f000 f937 	bl	2d90 <__gnu_Unwind_Save_WMMXD>
    2b22:	007a      	lsls	r2, r7, #1
    2b24:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
    2b26:	eb05 04c4 	add.w	r4, r5, r4, lsl #3
    2b2a:	1e53      	subs	r3, r2, #1
    2b2c:	b142      	cbz	r2, 2b40 <_Unwind_VRS_Pop+0x12c>
    2b2e:	1b01      	subs	r1, r0, r4
    2b30:	5862      	ldr	r2, [r4, r1]
    2b32:	f844 2b04 	str.w	r2, [r4], #4
    2b36:	3b01      	subs	r3, #1
    2b38:	1c5a      	adds	r2, r3, #1
    2b3a:	d1f9      	bne.n	2b30 <_Unwind_VRS_Pop+0x11c>
    2b3c:	eb00 00c7 	add.w	r0, r0, r7, lsl #3
    2b40:	63b0      	str	r0, [r6, #56]	@ 0x38
    2b42:	4628      	mov	r0, r5
    2b44:	f000 f902 	bl	2d4c <__gnu_Unwind_Restore_WMMXD>
    2b48:	e77c      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2b4a:	2b00      	cmp	r3, #0
    2b4c:	d142      	bne.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b4e:	2c10      	cmp	r4, #16
    2b50:	d840      	bhi.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b52:	6803      	ldr	r3, [r0, #0]
    2b54:	06dd      	lsls	r5, r3, #27
    2b56:	f100 8097 	bmi.w	2c88 <_Unwind_VRS_Pop+0x274>
    2b5a:	ad22      	add	r5, sp, #136	@ 0x88
    2b5c:	4628      	mov	r0, r5
    2b5e:	f000 f943 	bl	2de8 <__gnu_Unwind_Save_WMMXC>
    2b62:	6bb7      	ldr	r7, [r6, #56]	@ 0x38
    2b64:	4629      	mov	r1, r5
    2b66:	2300      	movs	r3, #0
    2b68:	f04f 0c01 	mov.w	ip, #1
    2b6c:	fa0c f203 	lsl.w	r2, ip, r3
    2b70:	4222      	tst	r2, r4
    2b72:	4638      	mov	r0, r7
    2b74:	f103 0301 	add.w	r3, r3, #1
    2b78:	d003      	beq.n	2b82 <_Unwind_VRS_Pop+0x16e>
    2b7a:	f850 2b04 	ldr.w	r2, [r0], #4
    2b7e:	600a      	str	r2, [r1, #0]
    2b80:	4607      	mov	r7, r0
    2b82:	2b04      	cmp	r3, #4
    2b84:	f101 0104 	add.w	r1, r1, #4
    2b88:	d1f0      	bne.n	2b6c <_Unwind_VRS_Pop+0x158>
    2b8a:	63b7      	str	r7, [r6, #56]	@ 0x38
    2b8c:	4628      	mov	r0, r5
    2b8e:	f000 f921 	bl	2dd4 <__gnu_Unwind_Restore_WMMXC>
    2b92:	e757      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2b94:	193a      	adds	r2, r7, r4
    2b96:	2a10      	cmp	r2, #16
    2b98:	d81c      	bhi.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b9a:	2f10      	cmp	r7, #16
    2b9c:	d01a      	beq.n	2bd4 <_Unwind_VRS_Pop+0x1c0>
    2b9e:	6802      	ldr	r2, [r0, #0]
    2ba0:	07d0      	lsls	r0, r2, #31
    2ba2:	d508      	bpl.n	2bb6 <_Unwind_VRS_Pop+0x1a2>
    2ba4:	4630      	mov	r0, r6
    2ba6:	f022 0203 	bic.w	r2, r2, #3
    2baa:	f840 2b50 	str.w	r2, [r0], #80
    2bae:	9301      	str	r3, [sp, #4]
    2bb0:	f000 f8b8 	bl	2d24 <__gnu_Unwind_Save_VFP>
    2bb4:	9b01      	ldr	r3, [sp, #4]
    2bb6:	9301      	str	r3, [sp, #4]
    2bb8:	ad22      	add	r5, sp, #136	@ 0x88
    2bba:	4628      	mov	r0, r5
    2bbc:	f000 f8b2 	bl	2d24 <__gnu_Unwind_Save_VFP>
    2bc0:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    2bc2:	9b01      	ldr	r3, [sp, #4]
    2bc4:	2c00      	cmp	r4, #0
    2bc6:	d158      	bne.n	2c7a <_Unwind_VRS_Pop+0x266>
    2bc8:	3204      	adds	r2, #4
    2bca:	63b2      	str	r2, [r6, #56]	@ 0x38
    2bcc:	4628      	mov	r0, r5
    2bce:	f000 f8a5 	bl	2d1c <__gnu_Unwind_Restore_VFP>
    2bd2:	e737      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2bd4:	2002      	movs	r0, #2
    2bd6:	e736      	b.n	2a46 <_Unwind_VRS_Pop+0x32>
    2bd8:	f1b8 0f10 	cmp.w	r8, #16
    2bdc:	6802      	ldr	r2, [r0, #0]
    2bde:	d965      	bls.n	2cac <_Unwind_VRS_Pop+0x298>
    2be0:	07d4      	lsls	r4, r2, #31
    2be2:	d572      	bpl.n	2cca <_Unwind_VRS_Pop+0x2b6>
    2be4:	f022 0201 	bic.w	r2, r2, #1
    2be8:	f042 0202 	orr.w	r2, r2, #2
    2bec:	f840 2b50 	str.w	r2, [r0], #80
    2bf0:	9301      	str	r3, [sp, #4]
    2bf2:	f000 f89f 	bl	2d34 <__gnu_Unwind_Save_VFP_D>
    2bf6:	6832      	ldr	r2, [r6, #0]
    2bf8:	9b01      	ldr	r3, [sp, #4]
    2bfa:	f012 0f04 	tst.w	r2, #4
    2bfe:	d166      	bne.n	2cce <_Unwind_VRS_Pop+0x2ba>
    2c00:	ad22      	add	r5, sp, #136	@ 0x88
    2c02:	4628      	mov	r0, r5
    2c04:	9301      	str	r3, [sp, #4]
    2c06:	f000 f895 	bl	2d34 <__gnu_Unwind_Save_VFP_D>
    2c0a:	a802      	add	r0, sp, #8
    2c0c:	f000 f89a 	bl	2d44 <__gnu_Unwind_Save_VFP_D_16_to_31>
    2c10:	f1c7 0110 	rsb	r1, r7, #16
    2c14:	0049      	lsls	r1, r1, #1
    2c16:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    2c18:	9b01      	ldr	r3, [sp, #4]
    2c1a:	f1a8 0c10 	sub.w	ip, r8, #16
    2c1e:	1e4c      	subs	r4, r1, #1
    2c20:	eb05 00c7 	add.w	r0, r5, r7, lsl #3
    2c24:	3401      	adds	r4, #1
    2c26:	3804      	subs	r0, #4
    2c28:	eb02 0184 	add.w	r1, r2, r4, lsl #2
    2c2c:	f852 4b04 	ldr.w	r4, [r2], #4
    2c30:	f840 4f04 	str.w	r4, [r0, #4]!
    2c34:	428a      	cmp	r2, r1
    2c36:	d1f9      	bne.n	2c2c <_Unwind_VRS_Pop+0x218>
    2c38:	f1bc 0f00 	cmp.w	ip, #0
    2c3c:	d05a      	beq.n	2cf4 <_Unwind_VRS_Pop+0x2e0>
    2c3e:	2f10      	cmp	r7, #16
    2c40:	4638      	mov	r0, r7
    2c42:	bf38      	it	cc
    2c44:	2010      	movcc	r0, #16
    2c46:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    2c4a:	3810      	subs	r0, #16
    2c4c:	ad02      	add	r5, sp, #8
    2c4e:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
    2c52:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
    2c56:	e73b      	b.n	2ad0 <_Unwind_VRS_Pop+0xbc>
    2c58:	4630      	mov	r0, r6
    2c5a:	f022 0201 	bic.w	r2, r2, #1
    2c5e:	f042 0202 	orr.w	r2, r2, #2
    2c62:	f840 2b50 	str.w	r2, [r0], #80
    2c66:	ad22      	add	r5, sp, #136	@ 0x88
    2c68:	9301      	str	r3, [sp, #4]
    2c6a:	f000 f863 	bl	2d34 <__gnu_Unwind_Save_VFP_D>
    2c6e:	4628      	mov	r0, r5
    2c70:	f000 f860 	bl	2d34 <__gnu_Unwind_Save_VFP_D>
    2c74:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    2c76:	b324      	cbz	r4, 2cc2 <_Unwind_VRS_Pop+0x2ae>
    2c78:	9b01      	ldr	r3, [sp, #4]
    2c7a:	0064      	lsls	r4, r4, #1
    2c7c:	3c01      	subs	r4, #1
    2c7e:	eb05 00c7 	add.w	r0, r5, r7, lsl #3
    2c82:	f04f 0c00 	mov.w	ip, #0
    2c86:	e7cd      	b.n	2c24 <_Unwind_VRS_Pop+0x210>
    2c88:	f023 0310 	bic.w	r3, r3, #16
    2c8c:	6003      	str	r3, [r0, #0]
    2c8e:	f500 70ec 	add.w	r0, r0, #472	@ 0x1d8
    2c92:	f000 f8a9 	bl	2de8 <__gnu_Unwind_Save_WMMXC>
    2c96:	e760      	b.n	2b5a <_Unwind_VRS_Pop+0x146>
    2c98:	f023 0308 	bic.w	r3, r3, #8
    2c9c:	6003      	str	r3, [r0, #0]
    2c9e:	f500 70ac 	add.w	r0, r0, #344	@ 0x158
    2ca2:	f000 f875 	bl	2d90 <__gnu_Unwind_Save_WMMXD>
    2ca6:	e738      	b.n	2b1a <_Unwind_VRS_Pop+0x106>
    2ca8:	ad22      	add	r5, sp, #136	@ 0x88
    2caa:	e78d      	b.n	2bc8 <_Unwind_VRS_Pop+0x1b4>
    2cac:	07d1      	lsls	r1, r2, #31
    2cae:	d4d3      	bmi.n	2c58 <_Unwind_VRS_Pop+0x244>
    2cb0:	ad22      	add	r5, sp, #136	@ 0x88
    2cb2:	4628      	mov	r0, r5
    2cb4:	9301      	str	r3, [sp, #4]
    2cb6:	f000 f83d 	bl	2d34 <__gnu_Unwind_Save_VFP_D>
    2cba:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    2cbc:	9b01      	ldr	r3, [sp, #4]
    2cbe:	2c00      	cmp	r4, #0
    2cc0:	d1db      	bne.n	2c7a <_Unwind_VRS_Pop+0x266>
    2cc2:	4628      	mov	r0, r5
    2cc4:	f000 f832 	bl	2d2c <__gnu_Unwind_Restore_VFP_D>
    2cc8:	e6bc      	b.n	2a44 <_Unwind_VRS_Pop+0x30>
    2cca:	0754      	lsls	r4, r2, #29
    2ccc:	d598      	bpl.n	2c00 <_Unwind_VRS_Pop+0x1ec>
    2cce:	4630      	mov	r0, r6
    2cd0:	f022 0204 	bic.w	r2, r2, #4
    2cd4:	f840 2bd8 	str.w	r2, [r0], #216
    2cd8:	9301      	str	r3, [sp, #4]
    2cda:	f000 f833 	bl	2d44 <__gnu_Unwind_Save_VFP_D_16_to_31>
    2cde:	9b01      	ldr	r3, [sp, #4]
    2ce0:	e78e      	b.n	2c00 <_Unwind_VRS_Pop+0x1ec>
    2ce2:	4630      	mov	r0, r6
    2ce4:	f022 0204 	bic.w	r2, r2, #4
    2ce8:	f840 2bd8 	str.w	r2, [r0], #216
    2cec:	9301      	str	r3, [sp, #4]
    2cee:	f000 f829 	bl	2d44 <__gnu_Unwind_Save_VFP_D_16_to_31>
    2cf2:	e6df      	b.n	2ab4 <_Unwind_VRS_Pop+0xa0>
    2cf4:	2b01      	cmp	r3, #1
    2cf6:	f43f af67 	beq.w	2bc8 <_Unwind_VRS_Pop+0x1b4>
    2cfa:	2f0f      	cmp	r7, #15
    2cfc:	63b2      	str	r2, [r6, #56]	@ 0x38
    2cfe:	f63f aea1 	bhi.w	2a44 <_Unwind_VRS_Pop+0x30>
    2d02:	e7de      	b.n	2cc2 <_Unwind_VRS_Pop+0x2ae>

00002d04 <__restore_core_regs>:
    2d04:	f100 0134 	add.w	r1, r0, #52	@ 0x34
    2d08:	e891 0038 	ldmia.w	r1, {r3, r4, r5}
    2d0c:	469c      	mov	ip, r3
    2d0e:	46a6      	mov	lr, r4
    2d10:	f84c 5d04 	str.w	r5, [ip, #-4]!
    2d14:	e890 0fff 	ldmia.w	r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
    2d18:	46e5      	mov	sp, ip
    2d1a:	bd00      	pop	{pc}

00002d1c <__gnu_Unwind_Restore_VFP>:
    2d1c:	ec90 0b21 	fldmiax	r0, {d0-d15}	@ Deprecated
    2d20:	4770      	bx	lr
    2d22:	bf00      	nop

00002d24 <__gnu_Unwind_Save_VFP>:
    2d24:	ec80 0b21 	fstmiax	r0, {d0-d15}	@ Deprecated
    2d28:	4770      	bx	lr
    2d2a:	bf00      	nop

00002d2c <__gnu_Unwind_Restore_VFP_D>:
    2d2c:	ec90 0b20 	vldmia	r0, {d0-d15}
    2d30:	4770      	bx	lr
    2d32:	bf00      	nop

00002d34 <__gnu_Unwind_Save_VFP_D>:
    2d34:	ec80 0b20 	vstmia	r0, {d0-d15}
    2d38:	4770      	bx	lr
    2d3a:	bf00      	nop

00002d3c <__gnu_Unwind_Restore_VFP_D_16_to_31>:
    2d3c:	ecd0 0b20 	vldmia	r0, {d16-d31}
    2d40:	4770      	bx	lr
    2d42:	bf00      	nop

00002d44 <__gnu_Unwind_Save_VFP_D_16_to_31>:
    2d44:	ecc0 0b20 	vstmia	r0, {d16-d31}
    2d48:	4770      	bx	lr
    2d4a:	bf00      	nop

00002d4c <__gnu_Unwind_Restore_WMMXD>:
    2d4c:	ecf0 0102 	ldfe	f0, [r0], #8
    2d50:	ecf0 1102 	ldfe	f1, [r0], #8
    2d54:	ecf0 2102 	ldfe	f2, [r0], #8
    2d58:	ecf0 3102 	ldfe	f3, [r0], #8
    2d5c:	ecf0 4102 	ldfe	f4, [r0], #8
    2d60:	ecf0 5102 	ldfe	f5, [r0], #8
    2d64:	ecf0 6102 	ldfe	f6, [r0], #8
    2d68:	ecf0 7102 	ldfe	f7, [r0], #8
    2d6c:	ecf0 8102 	ldfp	f0, [r0], #8
    2d70:	ecf0 9102 	ldfp	f1, [r0], #8
    2d74:	ecf0 a102 	ldfp	f2, [r0], #8
    2d78:	ecf0 b102 	ldfp	f3, [r0], #8
    2d7c:	ecf0 c102 	ldfp	f4, [r0], #8
    2d80:	ecf0 d102 	ldfp	f5, [r0], #8
    2d84:	ecf0 e102 	ldfp	f6, [r0], #8
    2d88:	ecf0 f102 	ldfp	f7, [r0], #8
    2d8c:	4770      	bx	lr
    2d8e:	bf00      	nop

00002d90 <__gnu_Unwind_Save_WMMXD>:
    2d90:	ece0 0102 	stfe	f0, [r0], #8
    2d94:	ece0 1102 	stfe	f1, [r0], #8
    2d98:	ece0 2102 	stfe	f2, [r0], #8
    2d9c:	ece0 3102 	stfe	f3, [r0], #8
    2da0:	ece0 4102 	stfe	f4, [r0], #8
    2da4:	ece0 5102 	stfe	f5, [r0], #8
    2da8:	ece0 6102 	stfe	f6, [r0], #8
    2dac:	ece0 7102 	stfe	f7, [r0], #8
    2db0:	ece0 8102 	stfp	f0, [r0], #8
    2db4:	ece0 9102 	stfp	f1, [r0], #8
    2db8:	ece0 a102 	stfp	f2, [r0], #8
    2dbc:	ece0 b102 	stfp	f3, [r0], #8
    2dc0:	ece0 c102 	stfp	f4, [r0], #8
    2dc4:	ece0 d102 	stfp	f5, [r0], #8
    2dc8:	ece0 e102 	stfp	f6, [r0], #8
    2dcc:	ece0 f102 	stfp	f7, [r0], #8
    2dd0:	4770      	bx	lr
    2dd2:	bf00      	nop

00002dd4 <__gnu_Unwind_Restore_WMMXC>:
    2dd4:	fcb0 8101 	ldc2	1, cr8, [r0], #4
    2dd8:	fcb0 9101 	ldc2	1, cr9, [r0], #4
    2ddc:	fcb0 a101 	ldc2	1, cr10, [r0], #4
    2de0:	fcb0 b101 	ldc2	1, cr11, [r0], #4
    2de4:	4770      	bx	lr
    2de6:	bf00      	nop

00002de8 <__gnu_Unwind_Save_WMMXC>:
    2de8:	fca0 8101 	stc2	1, cr8, [r0], #4
    2dec:	fca0 9101 	stc2	1, cr9, [r0], #4
    2df0:	fca0 a101 	stc2	1, cr10, [r0], #4
    2df4:	fca0 b101 	stc2	1, cr11, [r0], #4
    2df8:	4770      	bx	lr
    2dfa:	bf00      	nop

00002dfc <_Unwind_RaiseException>:
    2dfc:	46ec      	mov	ip, sp
    2dfe:	b500      	push	{lr}
    2e00:	e92d 5000 	stmdb	sp!, {ip, lr}
    2e04:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    2e08:	f04f 0300 	mov.w	r3, #0
    2e0c:	e92d 000c 	stmdb	sp!, {r2, r3}
    2e10:	a901      	add	r1, sp, #4
    2e12:	f7ff fbab 	bl	256c <__gnu_Unwind_RaiseException>
    2e16:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    2e1a:	b012      	add	sp, #72	@ 0x48
    2e1c:	4770      	bx	lr
    2e1e:	bf00      	nop

00002e20 <_Unwind_Resume>:
    2e20:	46ec      	mov	ip, sp
    2e22:	b500      	push	{lr}
    2e24:	e92d 5000 	stmdb	sp!, {ip, lr}
    2e28:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    2e2c:	f04f 0300 	mov.w	r3, #0
    2e30:	e92d 000c 	stmdb	sp!, {r2, r3}
    2e34:	a901      	add	r1, sp, #4
    2e36:	f7ff fbd5 	bl	25e4 <__gnu_Unwind_Resume>
    2e3a:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    2e3e:	b012      	add	sp, #72	@ 0x48
    2e40:	4770      	bx	lr
    2e42:	bf00      	nop

00002e44 <_Unwind_Resume_or_Rethrow>:
    2e44:	46ec      	mov	ip, sp
    2e46:	b500      	push	{lr}
    2e48:	e92d 5000 	stmdb	sp!, {ip, lr}
    2e4c:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    2e50:	f04f 0300 	mov.w	r3, #0
    2e54:	e92d 000c 	stmdb	sp!, {r2, r3}
    2e58:	a901      	add	r1, sp, #4
    2e5a:	f7ff fbe3 	bl	2624 <__gnu_Unwind_Resume_or_Rethrow>
    2e5e:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    2e62:	b012      	add	sp, #72	@ 0x48
    2e64:	4770      	bx	lr
    2e66:	bf00      	nop

00002e68 <_Unwind_ForcedUnwind>:
    2e68:	46ec      	mov	ip, sp
    2e6a:	b500      	push	{lr}
    2e6c:	e92d 5000 	stmdb	sp!, {ip, lr}
    2e70:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    2e74:	f04f 0300 	mov.w	r3, #0
    2e78:	e92d 000c 	stmdb	sp!, {r2, r3}
    2e7c:	ab01      	add	r3, sp, #4
    2e7e:	f7ff fba9 	bl	25d4 <__gnu_Unwind_ForcedUnwind>
    2e82:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    2e86:	b012      	add	sp, #72	@ 0x48
    2e88:	4770      	bx	lr
    2e8a:	bf00      	nop

00002e8c <_Unwind_Backtrace>:
    2e8c:	46ec      	mov	ip, sp
    2e8e:	b500      	push	{lr}
    2e90:	e92d 5000 	stmdb	sp!, {ip, lr}
    2e94:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    2e98:	f04f 0300 	mov.w	r3, #0
    2e9c:	e92d 000c 	stmdb	sp!, {r2, r3}
    2ea0:	aa01      	add	r2, sp, #4
    2ea2:	f7ff fc1d 	bl	26e0 <__gnu_Unwind_Backtrace>
    2ea6:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    2eaa:	b012      	add	sp, #72	@ 0x48
    2eac:	4770      	bx	lr
    2eae:	bf00      	nop

00002eb0 <next_unwind_byte>:
    2eb0:	7a02      	ldrb	r2, [r0, #8]
    2eb2:	4603      	mov	r3, r0
    2eb4:	b97a      	cbnz	r2, 2ed6 <next_unwind_byte+0x26>
    2eb6:	7a42      	ldrb	r2, [r0, #9]
    2eb8:	b1a2      	cbz	r2, 2ee4 <next_unwind_byte+0x34>
    2eba:	6841      	ldr	r1, [r0, #4]
    2ebc:	3a01      	subs	r2, #1
    2ebe:	b410      	push	{r4}
    2ec0:	7242      	strb	r2, [r0, #9]
    2ec2:	6808      	ldr	r0, [r1, #0]
    2ec4:	2203      	movs	r2, #3
    2ec6:	1d0c      	adds	r4, r1, #4
    2ec8:	721a      	strb	r2, [r3, #8]
    2eca:	0202      	lsls	r2, r0, #8
    2ecc:	605c      	str	r4, [r3, #4]
    2ece:	0e00      	lsrs	r0, r0, #24
    2ed0:	bc10      	pop	{r4}
    2ed2:	601a      	str	r2, [r3, #0]
    2ed4:	4770      	bx	lr
    2ed6:	6800      	ldr	r0, [r0, #0]
    2ed8:	3a01      	subs	r2, #1
    2eda:	721a      	strb	r2, [r3, #8]
    2edc:	0202      	lsls	r2, r0, #8
    2ede:	601a      	str	r2, [r3, #0]
    2ee0:	0e00      	lsrs	r0, r0, #24
    2ee2:	4770      	bx	lr
    2ee4:	20b0      	movs	r0, #176	@ 0xb0
    2ee6:	4770      	bx	lr

00002ee8 <_Unwind_GetGR.constprop.0>:
    2ee8:	b500      	push	{lr}
    2eea:	b085      	sub	sp, #20
    2eec:	aa03      	add	r2, sp, #12
    2eee:	2300      	movs	r3, #0
    2ef0:	9200      	str	r2, [sp, #0]
    2ef2:	4619      	mov	r1, r3
    2ef4:	220c      	movs	r2, #12
    2ef6:	f7ff fba5 	bl	2644 <_Unwind_VRS_Get>
    2efa:	9803      	ldr	r0, [sp, #12]
    2efc:	b005      	add	sp, #20
    2efe:	f85d fb04 	ldr.w	pc, [sp], #4
    2f02:	bf00      	nop

00002f04 <unwind_UCB_from_context>:
    2f04:	e7f0      	b.n	2ee8 <_Unwind_GetGR.constprop.0>
    2f06:	bf00      	nop

00002f08 <__gnu_unwind_execute>:
    2f08:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    2f0c:	4606      	mov	r6, r0
    2f0e:	b085      	sub	sp, #20
    2f10:	460d      	mov	r5, r1
    2f12:	f04f 0800 	mov.w	r8, #0
    2f16:	4628      	mov	r0, r5
    2f18:	f7ff ffca 	bl	2eb0 <next_unwind_byte>
    2f1c:	28b0      	cmp	r0, #176	@ 0xb0
    2f1e:	4604      	mov	r4, r0
    2f20:	f000 811c 	beq.w	315c <__gnu_unwind_execute+0x254>
    2f24:	0607      	lsls	r7, r0, #24
    2f26:	d55b      	bpl.n	2fe0 <__gnu_unwind_execute+0xd8>
    2f28:	f000 03f0 	and.w	r3, r0, #240	@ 0xf0
    2f2c:	2ba0      	cmp	r3, #160	@ 0xa0
    2f2e:	d01a      	beq.n	2f66 <__gnu_unwind_execute+0x5e>
    2f30:	d830      	bhi.n	2f94 <__gnu_unwind_execute+0x8c>
    2f32:	2b80      	cmp	r3, #128	@ 0x80
    2f34:	f000 8082 	beq.w	303c <__gnu_unwind_execute+0x134>
    2f38:	2b90      	cmp	r3, #144	@ 0x90
    2f3a:	d127      	bne.n	2f8c <__gnu_unwind_execute+0x84>
    2f3c:	f000 030d 	and.w	r3, r0, #13
    2f40:	2b0d      	cmp	r3, #13
    2f42:	d023      	beq.n	2f8c <__gnu_unwind_execute+0x84>
    2f44:	af02      	add	r7, sp, #8
    2f46:	2300      	movs	r3, #0
    2f48:	f000 020f 	and.w	r2, r0, #15
    2f4c:	4619      	mov	r1, r3
    2f4e:	9700      	str	r7, [sp, #0]
    2f50:	4630      	mov	r0, r6
    2f52:	f7ff fb77 	bl	2644 <_Unwind_VRS_Get>
    2f56:	2300      	movs	r3, #0
    2f58:	9700      	str	r7, [sp, #0]
    2f5a:	220d      	movs	r2, #13
    2f5c:	4619      	mov	r1, r3
    2f5e:	4630      	mov	r0, r6
    2f60:	f7ff fb98 	bl	2694 <_Unwind_VRS_Set>
    2f64:	e7d7      	b.n	2f16 <__gnu_unwind_execute+0xe>
    2f66:	43c3      	mvns	r3, r0
    2f68:	f003 0307 	and.w	r3, r3, #7
    2f6c:	f44f 627f 	mov.w	r2, #4080	@ 0xff0
    2f70:	411a      	asrs	r2, r3
    2f72:	0701      	lsls	r1, r0, #28
    2f74:	f402 627f 	and.w	r2, r2, #4080	@ 0xff0
    2f78:	d501      	bpl.n	2f7e <__gnu_unwind_execute+0x76>
    2f7a:	f442 4280 	orr.w	r2, r2, #16384	@ 0x4000
    2f7e:	2300      	movs	r3, #0
    2f80:	4619      	mov	r1, r3
    2f82:	4630      	mov	r0, r6
    2f84:	f7ff fd46 	bl	2a14 <_Unwind_VRS_Pop>
    2f88:	2800      	cmp	r0, #0
    2f8a:	d0c4      	beq.n	2f16 <__gnu_unwind_execute+0xe>
    2f8c:	2009      	movs	r0, #9
    2f8e:	b005      	add	sp, #20
    2f90:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    2f94:	2bb0      	cmp	r3, #176	@ 0xb0
    2f96:	d068      	beq.n	306a <__gnu_unwind_execute+0x162>
    2f98:	2bc0      	cmp	r3, #192	@ 0xc0
    2f9a:	d13d      	bne.n	3018 <__gnu_unwind_execute+0x110>
    2f9c:	28c6      	cmp	r0, #198	@ 0xc6
    2f9e:	f000 80ca 	beq.w	3136 <__gnu_unwind_execute+0x22e>
    2fa2:	28c7      	cmp	r0, #199	@ 0xc7
    2fa4:	f000 80df 	beq.w	3166 <__gnu_unwind_execute+0x25e>
    2fa8:	f000 03f8 	and.w	r3, r0, #248	@ 0xf8
    2fac:	2bc0      	cmp	r3, #192	@ 0xc0
    2fae:	f000 80ec 	beq.w	318a <__gnu_unwind_execute+0x282>
    2fb2:	28c8      	cmp	r0, #200	@ 0xc8
    2fb4:	f000 80f7 	beq.w	31a6 <__gnu_unwind_execute+0x29e>
    2fb8:	28c9      	cmp	r0, #201	@ 0xc9
    2fba:	d1e7      	bne.n	2f8c <__gnu_unwind_execute+0x84>
    2fbc:	4628      	mov	r0, r5
    2fbe:	f7ff ff77 	bl	2eb0 <next_unwind_byte>
    2fc2:	0302      	lsls	r2, r0, #12
    2fc4:	f000 000f 	and.w	r0, r0, #15
    2fc8:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    2fcc:	3001      	adds	r0, #1
    2fce:	4302      	orrs	r2, r0
    2fd0:	2101      	movs	r1, #1
    2fd2:	2305      	movs	r3, #5
    2fd4:	4630      	mov	r0, r6
    2fd6:	f7ff fd1d 	bl	2a14 <_Unwind_VRS_Pop>
    2fda:	2800      	cmp	r0, #0
    2fdc:	d09b      	beq.n	2f16 <__gnu_unwind_execute+0xe>
    2fde:	e7d5      	b.n	2f8c <__gnu_unwind_execute+0x84>
    2fe0:	0083      	lsls	r3, r0, #2
    2fe2:	b2db      	uxtb	r3, r3
    2fe4:	1d1f      	adds	r7, r3, #4
    2fe6:	f10d 0908 	add.w	r9, sp, #8
    2fea:	2300      	movs	r3, #0
    2fec:	4619      	mov	r1, r3
    2fee:	f8cd 9000 	str.w	r9, [sp]
    2ff2:	220d      	movs	r2, #13
    2ff4:	4630      	mov	r0, r6
    2ff6:	f7ff fb25 	bl	2644 <_Unwind_VRS_Get>
    2ffa:	9b02      	ldr	r3, [sp, #8]
    2ffc:	f8cd 9000 	str.w	r9, [sp]
    3000:	0660      	lsls	r0, r4, #25
    3002:	bf4c      	ite	mi
    3004:	1bdf      	submi	r7, r3, r7
    3006:	18ff      	addpl	r7, r7, r3
    3008:	2300      	movs	r3, #0
    300a:	220d      	movs	r2, #13
    300c:	4619      	mov	r1, r3
    300e:	4630      	mov	r0, r6
    3010:	9702      	str	r7, [sp, #8]
    3012:	f7ff fb3f 	bl	2694 <_Unwind_VRS_Set>
    3016:	e77e      	b.n	2f16 <__gnu_unwind_execute+0xe>
    3018:	f000 03f8 	and.w	r3, r0, #248	@ 0xf8
    301c:	2bd0      	cmp	r3, #208	@ 0xd0
    301e:	d1b5      	bne.n	2f8c <__gnu_unwind_execute+0x84>
    3020:	f000 0207 	and.w	r2, r0, #7
    3024:	3201      	adds	r2, #1
    3026:	2305      	movs	r3, #5
    3028:	f442 2200 	orr.w	r2, r2, #524288	@ 0x80000
    302c:	2101      	movs	r1, #1
    302e:	4630      	mov	r0, r6
    3030:	f7ff fcf0 	bl	2a14 <_Unwind_VRS_Pop>
    3034:	2800      	cmp	r0, #0
    3036:	f43f af6e 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    303a:	e7a7      	b.n	2f8c <__gnu_unwind_execute+0x84>
    303c:	4628      	mov	r0, r5
    303e:	f7ff ff37 	bl	2eb0 <next_unwind_byte>
    3042:	0224      	lsls	r4, r4, #8
    3044:	4320      	orrs	r0, r4
    3046:	f5b0 4f00 	cmp.w	r0, #32768	@ 0x8000
    304a:	d09f      	beq.n	2f8c <__gnu_unwind_execute+0x84>
    304c:	0104      	lsls	r4, r0, #4
    304e:	2300      	movs	r3, #0
    3050:	b2a2      	uxth	r2, r4
    3052:	4619      	mov	r1, r3
    3054:	4630      	mov	r0, r6
    3056:	f7ff fcdd 	bl	2a14 <_Unwind_VRS_Pop>
    305a:	2800      	cmp	r0, #0
    305c:	d196      	bne.n	2f8c <__gnu_unwind_execute+0x84>
    305e:	f414 4f00 	tst.w	r4, #32768	@ 0x8000
    3062:	bf18      	it	ne
    3064:	f04f 0801 	movne.w	r8, #1
    3068:	e755      	b.n	2f16 <__gnu_unwind_execute+0xe>
    306a:	f1a0 03b1 	sub.w	r3, r0, #177	@ 0xb1
    306e:	2b04      	cmp	r3, #4
    3070:	f200 80b5 	bhi.w	31de <__gnu_unwind_execute+0x2d6>
    3074:	e8df f003 	tbb	[pc, r3]
    3078:	0c162955 	.word	0x0c162955
    307c:	03          	.byte	0x03
    307d:	00          	.byte	0x00
    307e:	aa03      	add	r2, sp, #12
    3080:	2300      	movs	r3, #0
    3082:	9200      	str	r2, [sp, #0]
    3084:	4619      	mov	r1, r3
    3086:	220d      	movs	r2, #13
    3088:	4630      	mov	r0, r6
    308a:	f7ff fadb 	bl	2644 <_Unwind_VRS_Get>
    308e:	e742      	b.n	2f16 <__gnu_unwind_execute+0xe>
    3090:	2300      	movs	r3, #0
    3092:	461a      	mov	r2, r3
    3094:	2105      	movs	r1, #5
    3096:	4630      	mov	r0, r6
    3098:	f7ff fcbc 	bl	2a14 <_Unwind_VRS_Pop>
    309c:	2800      	cmp	r0, #0
    309e:	f43f af3a 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    30a2:	e773      	b.n	2f8c <__gnu_unwind_execute+0x84>
    30a4:	4628      	mov	r0, r5
    30a6:	f7ff ff03 	bl	2eb0 <next_unwind_byte>
    30aa:	0302      	lsls	r2, r0, #12
    30ac:	f000 000f 	and.w	r0, r0, #15
    30b0:	3001      	adds	r0, #1
    30b2:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    30b6:	2301      	movs	r3, #1
    30b8:	4302      	orrs	r2, r0
    30ba:	4619      	mov	r1, r3
    30bc:	4630      	mov	r0, r6
    30be:	f7ff fca9 	bl	2a14 <_Unwind_VRS_Pop>
    30c2:	2800      	cmp	r0, #0
    30c4:	f43f af27 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    30c8:	e760      	b.n	2f8c <__gnu_unwind_execute+0x84>
    30ca:	2300      	movs	r3, #0
    30cc:	f10d 0908 	add.w	r9, sp, #8
    30d0:	220d      	movs	r2, #13
    30d2:	4619      	mov	r1, r3
    30d4:	f8cd 9000 	str.w	r9, [sp]
    30d8:	4630      	mov	r0, r6
    30da:	f7ff fab3 	bl	2644 <_Unwind_VRS_Get>
    30de:	4628      	mov	r0, r5
    30e0:	f7ff fee6 	bl	2eb0 <next_unwind_byte>
    30e4:	0602      	lsls	r2, r0, #24
    30e6:	9c02      	ldr	r4, [sp, #8]
    30e8:	f04f 0702 	mov.w	r7, #2
    30ec:	d50b      	bpl.n	3106 <__gnu_unwind_execute+0x1fe>
    30ee:	f000 007f 	and.w	r0, r0, #127	@ 0x7f
    30f2:	40b8      	lsls	r0, r7
    30f4:	4404      	add	r4, r0
    30f6:	4628      	mov	r0, r5
    30f8:	9402      	str	r4, [sp, #8]
    30fa:	f7ff fed9 	bl	2eb0 <next_unwind_byte>
    30fe:	0603      	lsls	r3, r0, #24
    3100:	f107 0707 	add.w	r7, r7, #7
    3104:	d4f3      	bmi.n	30ee <__gnu_unwind_execute+0x1e6>
    3106:	40b8      	lsls	r0, r7
    3108:	2300      	movs	r3, #0
    310a:	f504 7401 	add.w	r4, r4, #516	@ 0x204
    310e:	4404      	add	r4, r0
    3110:	f8cd 9000 	str.w	r9, [sp]
    3114:	220d      	movs	r2, #13
    3116:	4619      	mov	r1, r3
    3118:	4630      	mov	r0, r6
    311a:	9402      	str	r4, [sp, #8]
    311c:	f7ff faba 	bl	2694 <_Unwind_VRS_Set>
    3120:	e6f9      	b.n	2f16 <__gnu_unwind_execute+0xe>
    3122:	4628      	mov	r0, r5
    3124:	f7ff fec4 	bl	2eb0 <next_unwind_byte>
    3128:	1e43      	subs	r3, r0, #1
    312a:	b2db      	uxtb	r3, r3
    312c:	2b0e      	cmp	r3, #14
    312e:	4602      	mov	r2, r0
    3130:	f67f af25 	bls.w	2f7e <__gnu_unwind_execute+0x76>
    3134:	e72a      	b.n	2f8c <__gnu_unwind_execute+0x84>
    3136:	4628      	mov	r0, r5
    3138:	f7ff feba 	bl	2eb0 <next_unwind_byte>
    313c:	0302      	lsls	r2, r0, #12
    313e:	f000 000f 	and.w	r0, r0, #15
    3142:	3001      	adds	r0, #1
    3144:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    3148:	2303      	movs	r3, #3
    314a:	4302      	orrs	r2, r0
    314c:	4619      	mov	r1, r3
    314e:	4630      	mov	r0, r6
    3150:	f7ff fc60 	bl	2a14 <_Unwind_VRS_Pop>
    3154:	2800      	cmp	r0, #0
    3156:	f43f aede 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    315a:	e717      	b.n	2f8c <__gnu_unwind_execute+0x84>
    315c:	f1b8 0f00 	cmp.w	r8, #0
    3160:	d02d      	beq.n	31be <__gnu_unwind_execute+0x2b6>
    3162:	2000      	movs	r0, #0
    3164:	e713      	b.n	2f8e <__gnu_unwind_execute+0x86>
    3166:	4628      	mov	r0, r5
    3168:	f7ff fea2 	bl	2eb0 <next_unwind_byte>
    316c:	1e43      	subs	r3, r0, #1
    316e:	b2db      	uxtb	r3, r3
    3170:	2b0e      	cmp	r3, #14
    3172:	4602      	mov	r2, r0
    3174:	f63f af0a 	bhi.w	2f8c <__gnu_unwind_execute+0x84>
    3178:	2300      	movs	r3, #0
    317a:	2104      	movs	r1, #4
    317c:	4630      	mov	r0, r6
    317e:	f7ff fc49 	bl	2a14 <_Unwind_VRS_Pop>
    3182:	2800      	cmp	r0, #0
    3184:	f43f aec7 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    3188:	e700      	b.n	2f8c <__gnu_unwind_execute+0x84>
    318a:	f000 020f 	and.w	r2, r0, #15
    318e:	3201      	adds	r2, #1
    3190:	2303      	movs	r3, #3
    3192:	f442 2220 	orr.w	r2, r2, #655360	@ 0xa0000
    3196:	4619      	mov	r1, r3
    3198:	4630      	mov	r0, r6
    319a:	f7ff fc3b 	bl	2a14 <_Unwind_VRS_Pop>
    319e:	2800      	cmp	r0, #0
    31a0:	f43f aeb9 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    31a4:	e6f2      	b.n	2f8c <__gnu_unwind_execute+0x84>
    31a6:	4628      	mov	r0, r5
    31a8:	f7ff fe82 	bl	2eb0 <next_unwind_byte>
    31ac:	f000 02f0 	and.w	r2, r0, #240	@ 0xf0
    31b0:	f000 030f 	and.w	r3, r0, #15
    31b4:	3210      	adds	r2, #16
    31b6:	3301      	adds	r3, #1
    31b8:	ea43 3202 	orr.w	r2, r3, r2, lsl #12
    31bc:	e708      	b.n	2fd0 <__gnu_unwind_execute+0xc8>
    31be:	ac02      	add	r4, sp, #8
    31c0:	4643      	mov	r3, r8
    31c2:	4641      	mov	r1, r8
    31c4:	9400      	str	r4, [sp, #0]
    31c6:	220e      	movs	r2, #14
    31c8:	4630      	mov	r0, r6
    31ca:	f7ff fa3b 	bl	2644 <_Unwind_VRS_Get>
    31ce:	220f      	movs	r2, #15
    31d0:	9400      	str	r4, [sp, #0]
    31d2:	4643      	mov	r3, r8
    31d4:	4641      	mov	r1, r8
    31d6:	4630      	mov	r0, r6
    31d8:	f7ff fa5c 	bl	2694 <_Unwind_VRS_Set>
    31dc:	e7c1      	b.n	3162 <__gnu_unwind_execute+0x25a>
    31de:	f000 03fc 	and.w	r3, r0, #252	@ 0xfc
    31e2:	2bb4      	cmp	r3, #180	@ 0xb4
    31e4:	f43f aed2 	beq.w	2f8c <__gnu_unwind_execute+0x84>
    31e8:	f000 0207 	and.w	r2, r0, #7
    31ec:	3201      	adds	r2, #1
    31ee:	2301      	movs	r3, #1
    31f0:	f442 2200 	orr.w	r2, r2, #524288	@ 0x80000
    31f4:	4619      	mov	r1, r3
    31f6:	4630      	mov	r0, r6
    31f8:	f7ff fc0c 	bl	2a14 <_Unwind_VRS_Pop>
    31fc:	2800      	cmp	r0, #0
    31fe:	f43f ae8a 	beq.w	2f16 <__gnu_unwind_execute+0xe>
    3202:	e6c3      	b.n	2f8c <__gnu_unwind_execute+0x84>

00003204 <__gnu_unwind_frame>:
    3204:	b510      	push	{r4, lr}
    3206:	6cc2      	ldr	r2, [r0, #76]	@ 0x4c
    3208:	6853      	ldr	r3, [r2, #4]
    320a:	b084      	sub	sp, #16
    320c:	f04f 0c03 	mov.w	ip, #3
    3210:	3208      	adds	r2, #8
    3212:	021c      	lsls	r4, r3, #8
    3214:	4608      	mov	r0, r1
    3216:	0e1b      	lsrs	r3, r3, #24
    3218:	a901      	add	r1, sp, #4
    321a:	9401      	str	r4, [sp, #4]
    321c:	9202      	str	r2, [sp, #8]
    321e:	f88d c00c 	strb.w	ip, [sp, #12]
    3222:	f88d 300d 	strb.w	r3, [sp, #13]
    3226:	f7ff fe6f 	bl	2f08 <__gnu_unwind_execute>
    322a:	b004      	add	sp, #16
    322c:	bd10      	pop	{r4, pc}
    322e:	bf00      	nop

00003230 <_Unwind_GetRegionStart>:
    3230:	b508      	push	{r3, lr}
    3232:	f7ff fe67 	bl	2f04 <unwind_UCB_from_context>
    3236:	6c80      	ldr	r0, [r0, #72]	@ 0x48
    3238:	bd08      	pop	{r3, pc}
    323a:	bf00      	nop

0000323c <_Unwind_GetLanguageSpecificData>:
    323c:	b508      	push	{r3, lr}
    323e:	f7ff fe61 	bl	2f04 <unwind_UCB_from_context>
    3242:	6cc0      	ldr	r0, [r0, #76]	@ 0x4c
    3244:	79c3      	ldrb	r3, [r0, #7]
    3246:	eb00 0083 	add.w	r0, r0, r3, lsl #2
    324a:	3008      	adds	r0, #8
    324c:	bd08      	pop	{r3, pc}
    324e:	bf00      	nop

00003250 <_Unwind_GetDataRelBase>:
    3250:	b508      	push	{r3, lr}
    3252:	f000 f855 	bl	3300 <abort>

00003256 <_Unwind_GetTextRelBase>:
    3256:	b508      	push	{r3, lr}
    3258:	f7ff fffa 	bl	3250 <_Unwind_GetDataRelBase>

0000325c <memset>:
    325c:	0783      	lsls	r3, r0, #30
    325e:	b530      	push	{r4, r5, lr}
    3260:	d047      	beq.n	32f2 <memset+0x96>
    3262:	1e54      	subs	r4, r2, #1
    3264:	2a00      	cmp	r2, #0
    3266:	d03e      	beq.n	32e6 <memset+0x8a>
    3268:	b2ca      	uxtb	r2, r1
    326a:	4603      	mov	r3, r0
    326c:	e001      	b.n	3272 <memset+0x16>
    326e:	3c01      	subs	r4, #1
    3270:	d339      	bcc.n	32e6 <memset+0x8a>
    3272:	f803 2b01 	strb.w	r2, [r3], #1
    3276:	079d      	lsls	r5, r3, #30
    3278:	d1f9      	bne.n	326e <memset+0x12>
    327a:	2c03      	cmp	r4, #3
    327c:	d92c      	bls.n	32d8 <memset+0x7c>
    327e:	b2cd      	uxtb	r5, r1
    3280:	eb05 2505 	add.w	r5, r5, r5, lsl #8
    3284:	2c0f      	cmp	r4, #15
    3286:	eb05 4505 	add.w	r5, r5, r5, lsl #16
    328a:	d935      	bls.n	32f8 <memset+0x9c>
    328c:	f1a4 0210 	sub.w	r2, r4, #16
    3290:	f022 0c0f 	bic.w	ip, r2, #15
    3294:	f103 0e10 	add.w	lr, r3, #16
    3298:	44e6      	add	lr, ip
    329a:	ea4f 1c12 	mov.w	ip, r2, lsr #4
    329e:	461a      	mov	r2, r3
    32a0:	e9c2 5500 	strd	r5, r5, [r2]
    32a4:	e9c2 5502 	strd	r5, r5, [r2, #8]
    32a8:	3210      	adds	r2, #16
    32aa:	4572      	cmp	r2, lr
    32ac:	d1f8      	bne.n	32a0 <memset+0x44>
    32ae:	f10c 0201 	add.w	r2, ip, #1
    32b2:	f014 0f0c 	tst.w	r4, #12
    32b6:	eb03 1202 	add.w	r2, r3, r2, lsl #4
    32ba:	f004 0c0f 	and.w	ip, r4, #15
    32be:	d013      	beq.n	32e8 <memset+0x8c>
    32c0:	f1ac 0304 	sub.w	r3, ip, #4
    32c4:	f023 0303 	bic.w	r3, r3, #3
    32c8:	3304      	adds	r3, #4
    32ca:	4413      	add	r3, r2
    32cc:	f842 5b04 	str.w	r5, [r2], #4
    32d0:	4293      	cmp	r3, r2
    32d2:	d1fb      	bne.n	32cc <memset+0x70>
    32d4:	f00c 0403 	and.w	r4, ip, #3
    32d8:	b12c      	cbz	r4, 32e6 <memset+0x8a>
    32da:	b2c9      	uxtb	r1, r1
    32dc:	441c      	add	r4, r3
    32de:	f803 1b01 	strb.w	r1, [r3], #1
    32e2:	42a3      	cmp	r3, r4
    32e4:	d1fb      	bne.n	32de <memset+0x82>
    32e6:	bd30      	pop	{r4, r5, pc}
    32e8:	4664      	mov	r4, ip
    32ea:	4613      	mov	r3, r2
    32ec:	2c00      	cmp	r4, #0
    32ee:	d1f4      	bne.n	32da <memset+0x7e>
    32f0:	e7f9      	b.n	32e6 <memset+0x8a>
    32f2:	4603      	mov	r3, r0
    32f4:	4614      	mov	r4, r2
    32f6:	e7c0      	b.n	327a <memset+0x1e>
    32f8:	461a      	mov	r2, r3
    32fa:	46a4      	mov	ip, r4
    32fc:	e7e0      	b.n	32c0 <memset+0x64>
    32fe:	bf00      	nop

00003300 <abort>:
    3300:	b508      	push	{r3, lr}
    3302:	2006      	movs	r0, #6
    3304:	f000 f9ac 	bl	3660 <raise>
    3308:	2001      	movs	r0, #1
    330a:	f001 fa29 	bl	4760 <_exit>
    330e:	bf00      	nop

00003310 <memcpy>:
    3310:	4684      	mov	ip, r0
    3312:	ea41 0300 	orr.w	r3, r1, r0
    3316:	f013 0303 	ands.w	r3, r3, #3
    331a:	d16d      	bne.n	33f8 <memcpy+0xe8>
    331c:	3a40      	subs	r2, #64	@ 0x40
    331e:	d341      	bcc.n	33a4 <memcpy+0x94>
    3320:	f851 3b04 	ldr.w	r3, [r1], #4
    3324:	f840 3b04 	str.w	r3, [r0], #4
    3328:	f851 3b04 	ldr.w	r3, [r1], #4
    332c:	f840 3b04 	str.w	r3, [r0], #4
    3330:	f851 3b04 	ldr.w	r3, [r1], #4
    3334:	f840 3b04 	str.w	r3, [r0], #4
    3338:	f851 3b04 	ldr.w	r3, [r1], #4
    333c:	f840 3b04 	str.w	r3, [r0], #4
    3340:	f851 3b04 	ldr.w	r3, [r1], #4
    3344:	f840 3b04 	str.w	r3, [r0], #4
    3348:	f851 3b04 	ldr.w	r3, [r1], #4
    334c:	f840 3b04 	str.w	r3, [r0], #4
    3350:	f851 3b04 	ldr.w	r3, [r1], #4
    3354:	f840 3b04 	str.w	r3, [r0], #4
    3358:	f851 3b04 	ldr.w	r3, [r1], #4
    335c:	f840 3b04 	str.w	r3, [r0], #4
    3360:	f851 3b04 	ldr.w	r3, [r1], #4
    3364:	f840 3b04 	str.w	r3, [r0], #4
    3368:	f851 3b04 	ldr.w	r3, [r1], #4
    336c:	f840 3b04 	str.w	r3, [r0], #4
    3370:	f851 3b04 	ldr.w	r3, [r1], #4
    3374:	f840 3b04 	str.w	r3, [r0], #4
    3378:	f851 3b04 	ldr.w	r3, [r1], #4
    337c:	f840 3b04 	str.w	r3, [r0], #4
    3380:	f851 3b04 	ldr.w	r3, [r1], #4
    3384:	f840 3b04 	str.w	r3, [r0], #4
    3388:	f851 3b04 	ldr.w	r3, [r1], #4
    338c:	f840 3b04 	str.w	r3, [r0], #4
    3390:	f851 3b04 	ldr.w	r3, [r1], #4
    3394:	f840 3b04 	str.w	r3, [r0], #4
    3398:	f851 3b04 	ldr.w	r3, [r1], #4
    339c:	f840 3b04 	str.w	r3, [r0], #4
    33a0:	3a40      	subs	r2, #64	@ 0x40
    33a2:	d2bd      	bcs.n	3320 <memcpy+0x10>
    33a4:	3230      	adds	r2, #48	@ 0x30
    33a6:	d311      	bcc.n	33cc <memcpy+0xbc>
    33a8:	f851 3b04 	ldr.w	r3, [r1], #4
    33ac:	f840 3b04 	str.w	r3, [r0], #4
    33b0:	f851 3b04 	ldr.w	r3, [r1], #4
    33b4:	f840 3b04 	str.w	r3, [r0], #4
    33b8:	f851 3b04 	ldr.w	r3, [r1], #4
    33bc:	f840 3b04 	str.w	r3, [r0], #4
    33c0:	f851 3b04 	ldr.w	r3, [r1], #4
    33c4:	f840 3b04 	str.w	r3, [r0], #4
    33c8:	3a10      	subs	r2, #16
    33ca:	d2ed      	bcs.n	33a8 <memcpy+0x98>
    33cc:	320c      	adds	r2, #12
    33ce:	d305      	bcc.n	33dc <memcpy+0xcc>
    33d0:	f851 3b04 	ldr.w	r3, [r1], #4
    33d4:	f840 3b04 	str.w	r3, [r0], #4
    33d8:	3a04      	subs	r2, #4
    33da:	d2f9      	bcs.n	33d0 <memcpy+0xc0>
    33dc:	3204      	adds	r2, #4
    33de:	d008      	beq.n	33f2 <memcpy+0xe2>
    33e0:	07d2      	lsls	r2, r2, #31
    33e2:	bf1c      	itt	ne
    33e4:	f811 3b01 	ldrbne.w	r3, [r1], #1
    33e8:	f800 3b01 	strbne.w	r3, [r0], #1
    33ec:	d301      	bcc.n	33f2 <memcpy+0xe2>
    33ee:	880b      	ldrh	r3, [r1, #0]
    33f0:	8003      	strh	r3, [r0, #0]
    33f2:	4660      	mov	r0, ip
    33f4:	4770      	bx	lr
    33f6:	bf00      	nop
    33f8:	2a08      	cmp	r2, #8
    33fa:	d313      	bcc.n	3424 <memcpy+0x114>
    33fc:	078b      	lsls	r3, r1, #30
    33fe:	d08d      	beq.n	331c <memcpy+0xc>
    3400:	f010 0303 	ands.w	r3, r0, #3
    3404:	d08a      	beq.n	331c <memcpy+0xc>
    3406:	f1c3 0304 	rsb	r3, r3, #4
    340a:	1ad2      	subs	r2, r2, r3
    340c:	07db      	lsls	r3, r3, #31
    340e:	bf1c      	itt	ne
    3410:	f811 3b01 	ldrbne.w	r3, [r1], #1
    3414:	f800 3b01 	strbne.w	r3, [r0], #1
    3418:	d380      	bcc.n	331c <memcpy+0xc>
    341a:	f831 3b02 	ldrh.w	r3, [r1], #2
    341e:	f820 3b02 	strh.w	r3, [r0], #2
    3422:	e77b      	b.n	331c <memcpy+0xc>
    3424:	3a04      	subs	r2, #4
    3426:	d3d9      	bcc.n	33dc <memcpy+0xcc>
    3428:	3a01      	subs	r2, #1
    342a:	f811 3b01 	ldrb.w	r3, [r1], #1
    342e:	f800 3b01 	strb.w	r3, [r0], #1
    3432:	d2f9      	bcs.n	3428 <memcpy+0x118>
    3434:	780b      	ldrb	r3, [r1, #0]
    3436:	7003      	strb	r3, [r0, #0]
    3438:	784b      	ldrb	r3, [r1, #1]
    343a:	7043      	strb	r3, [r0, #1]
    343c:	788b      	ldrb	r3, [r1, #2]
    343e:	7083      	strb	r3, [r0, #2]
    3440:	4660      	mov	r0, ip
    3442:	4770      	bx	lr

00003444 <_reclaim_reent>:
    3444:	4b19      	ldr	r3, [pc, #100]	@ (34ac <_reclaim_reent+0x68>)
    3446:	681b      	ldr	r3, [r3, #0]
    3448:	4283      	cmp	r3, r0
    344a:	d02e      	beq.n	34aa <_reclaim_reent+0x66>
    344c:	6c41      	ldr	r1, [r0, #68]	@ 0x44
    344e:	b570      	push	{r4, r5, r6, lr}
    3450:	4605      	mov	r5, r0
    3452:	b181      	cbz	r1, 3476 <_reclaim_reent+0x32>
    3454:	2600      	movs	r6, #0
    3456:	598c      	ldr	r4, [r1, r6]
    3458:	b13c      	cbz	r4, 346a <_reclaim_reent+0x26>
    345a:	4621      	mov	r1, r4
    345c:	6824      	ldr	r4, [r4, #0]
    345e:	4628      	mov	r0, r5
    3460:	f000 fcd4 	bl	3e0c <_free_r>
    3464:	2c00      	cmp	r4, #0
    3466:	d1f8      	bne.n	345a <_reclaim_reent+0x16>
    3468:	6c69      	ldr	r1, [r5, #68]	@ 0x44
    346a:	3604      	adds	r6, #4
    346c:	2e80      	cmp	r6, #128	@ 0x80
    346e:	d1f2      	bne.n	3456 <_reclaim_reent+0x12>
    3470:	4628      	mov	r0, r5
    3472:	f000 fccb 	bl	3e0c <_free_r>
    3476:	6ba9      	ldr	r1, [r5, #56]	@ 0x38
    3478:	b111      	cbz	r1, 3480 <_reclaim_reent+0x3c>
    347a:	4628      	mov	r0, r5
    347c:	f000 fcc6 	bl	3e0c <_free_r>
    3480:	6c2c      	ldr	r4, [r5, #64]	@ 0x40
    3482:	b134      	cbz	r4, 3492 <_reclaim_reent+0x4e>
    3484:	4621      	mov	r1, r4
    3486:	6824      	ldr	r4, [r4, #0]
    3488:	4628      	mov	r0, r5
    348a:	f000 fcbf 	bl	3e0c <_free_r>
    348e:	2c00      	cmp	r4, #0
    3490:	d1f8      	bne.n	3484 <_reclaim_reent+0x40>
    3492:	6ce9      	ldr	r1, [r5, #76]	@ 0x4c
    3494:	b111      	cbz	r1, 349c <_reclaim_reent+0x58>
    3496:	4628      	mov	r0, r5
    3498:	f000 fcb8 	bl	3e0c <_free_r>
    349c:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
    349e:	b11b      	cbz	r3, 34a8 <_reclaim_reent+0x64>
    34a0:	4628      	mov	r0, r5
    34a2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    34a6:	4718      	bx	r3
    34a8:	bd70      	pop	{r4, r5, r6, pc}
    34aa:	4770      	bx	lr
    34ac:	00004980 	.word	0x00004980

000034b0 <__libc_init_array>:
    34b0:	b570      	push	{r4, r5, r6, lr}
    34b2:	4b0f      	ldr	r3, [pc, #60]	@ (34f0 <__libc_init_array+0x40>)
    34b4:	4d0f      	ldr	r5, [pc, #60]	@ (34f4 <__libc_init_array+0x44>)
    34b6:	42ab      	cmp	r3, r5
    34b8:	eba3 0605 	sub.w	r6, r3, r5
    34bc:	d007      	beq.n	34ce <__libc_init_array+0x1e>
    34be:	10b6      	asrs	r6, r6, #2
    34c0:	2400      	movs	r4, #0
    34c2:	f855 3b04 	ldr.w	r3, [r5], #4
    34c6:	3401      	adds	r4, #1
    34c8:	4798      	blx	r3
    34ca:	42a6      	cmp	r6, r4
    34cc:	d8f9      	bhi.n	34c2 <__libc_init_array+0x12>
    34ce:	f001 f949 	bl	4764 <_init>
    34d2:	4d09      	ldr	r5, [pc, #36]	@ (34f8 <__libc_init_array+0x48>)
    34d4:	4b09      	ldr	r3, [pc, #36]	@ (34fc <__libc_init_array+0x4c>)
    34d6:	1b5e      	subs	r6, r3, r5
    34d8:	42ab      	cmp	r3, r5
    34da:	ea4f 06a6 	mov.w	r6, r6, asr #2
    34de:	d006      	beq.n	34ee <__libc_init_array+0x3e>
    34e0:	2400      	movs	r4, #0
    34e2:	f855 3b04 	ldr.w	r3, [r5], #4
    34e6:	3401      	adds	r4, #1
    34e8:	4798      	blx	r3
    34ea:	42a6      	cmp	r6, r4
    34ec:	d8f9      	bhi.n	34e2 <__libc_init_array+0x32>
    34ee:	bd70      	pop	{r4, r5, r6, pc}
    34f0:	00004ec8 	.word	0x00004ec8
    34f4:	00004ec8 	.word	0x00004ec8
    34f8:	00004ec8 	.word	0x00004ec8
    34fc:	00004ed0 	.word	0x00004ed0

00003500 <exit>:
    3500:	b508      	push	{r3, lr}
    3502:	2100      	movs	r1, #0
    3504:	4604      	mov	r4, r0
    3506:	f000 fd7d 	bl	4004 <__call_exitprocs>
    350a:	4b03      	ldr	r3, [pc, #12]	@ (3518 <exit+0x18>)
    350c:	681b      	ldr	r3, [r3, #0]
    350e:	b103      	cbz	r3, 3512 <exit+0x12>
    3510:	4798      	blx	r3
    3512:	4620      	mov	r0, r4
    3514:	f001 f924 	bl	4760 <_exit>
    3518:	00005208 	.word	0x00005208

0000351c <atexit>:
    351c:	2300      	movs	r3, #0
    351e:	4601      	mov	r1, r0
    3520:	461a      	mov	r2, r3
    3522:	4618      	mov	r0, r3
    3524:	f000 bdde 	b.w	40e4 <__register_exitproc>

00003528 <_init_signal_r>:
    3528:	b538      	push	{r3, r4, r5, lr}
    352a:	f8d0 4118 	ldr.w	r4, [r0, #280]	@ 0x118
    352e:	b10c      	cbz	r4, 3534 <_init_signal_r+0xc>
    3530:	2000      	movs	r0, #0
    3532:	bd38      	pop	{r3, r4, r5, pc}
    3534:	2180      	movs	r1, #128	@ 0x80
    3536:	4605      	mov	r5, r0
    3538:	f000 f962 	bl	3800 <_malloc_r>
    353c:	4602      	mov	r2, r0
    353e:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3542:	b130      	cbz	r0, 3552 <_init_signal_r+0x2a>
    3544:	1f03      	subs	r3, r0, #4
    3546:	327c      	adds	r2, #124	@ 0x7c
    3548:	f843 4f04 	str.w	r4, [r3, #4]!
    354c:	4293      	cmp	r3, r2
    354e:	d1fb      	bne.n	3548 <_init_signal_r+0x20>
    3550:	e7ee      	b.n	3530 <_init_signal_r+0x8>
    3552:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3556:	bd38      	pop	{r3, r4, r5, pc}

00003558 <_signal_r>:
    3558:	b530      	push	{r4, r5, lr}
    355a:	291f      	cmp	r1, #31
    355c:	b083      	sub	sp, #12
    355e:	4605      	mov	r5, r0
    3560:	d809      	bhi.n	3576 <_signal_r+0x1e>
    3562:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    3566:	460c      	mov	r4, r1
    3568:	b153      	cbz	r3, 3580 <_signal_r+0x28>
    356a:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    356e:	f843 2024 	str.w	r2, [r3, r4, lsl #2]
    3572:	b003      	add	sp, #12
    3574:	bd30      	pop	{r4, r5, pc}
    3576:	2316      	movs	r3, #22
    3578:	6003      	str	r3, [r0, #0]
    357a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    357e:	e7f8      	b.n	3572 <_signal_r+0x1a>
    3580:	2180      	movs	r1, #128	@ 0x80
    3582:	9201      	str	r2, [sp, #4]
    3584:	f000 f93c 	bl	3800 <_malloc_r>
    3588:	9a01      	ldr	r2, [sp, #4]
    358a:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    358e:	4603      	mov	r3, r0
    3590:	2800      	cmp	r0, #0
    3592:	d0f2      	beq.n	357a <_signal_r+0x22>
    3594:	1f01      	subs	r1, r0, #4
    3596:	f100 057c 	add.w	r5, r0, #124	@ 0x7c
    359a:	2000      	movs	r0, #0
    359c:	f841 0f04 	str.w	r0, [r1, #4]!
    35a0:	42a9      	cmp	r1, r5
    35a2:	d1fb      	bne.n	359c <_signal_r+0x44>
    35a4:	e7e1      	b.n	356a <_signal_r+0x12>
    35a6:	bf00      	nop

000035a8 <_raise_r>:
    35a8:	291f      	cmp	r1, #31
    35aa:	b538      	push	{r3, r4, r5, lr}
    35ac:	4605      	mov	r5, r0
    35ae:	d81f      	bhi.n	35f0 <_raise_r+0x48>
    35b0:	f8d0 2118 	ldr.w	r2, [r0, #280]	@ 0x118
    35b4:	460c      	mov	r4, r1
    35b6:	b16a      	cbz	r2, 35d4 <_raise_r+0x2c>
    35b8:	f852 3021 	ldr.w	r3, [r2, r1, lsl #2]
    35bc:	b153      	cbz	r3, 35d4 <_raise_r+0x2c>
    35be:	2b01      	cmp	r3, #1
    35c0:	d006      	beq.n	35d0 <_raise_r+0x28>
    35c2:	1c59      	adds	r1, r3, #1
    35c4:	d010      	beq.n	35e8 <_raise_r+0x40>
    35c6:	2100      	movs	r1, #0
    35c8:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
    35cc:	4620      	mov	r0, r4
    35ce:	4798      	blx	r3
    35d0:	2000      	movs	r0, #0
    35d2:	bd38      	pop	{r3, r4, r5, pc}
    35d4:	4628      	mov	r0, r5
    35d6:	f000 f911 	bl	37fc <_getpid_r>
    35da:	4622      	mov	r2, r4
    35dc:	4601      	mov	r1, r0
    35de:	4628      	mov	r0, r5
    35e0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    35e4:	f000 b8f4 	b.w	37d0 <_kill_r>
    35e8:	2316      	movs	r3, #22
    35ea:	6003      	str	r3, [r0, #0]
    35ec:	2001      	movs	r0, #1
    35ee:	bd38      	pop	{r3, r4, r5, pc}
    35f0:	2316      	movs	r3, #22
    35f2:	6003      	str	r3, [r0, #0]
    35f4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    35f8:	bd38      	pop	{r3, r4, r5, pc}
    35fa:	bf00      	nop

000035fc <__sigtramp_r>:
    35fc:	291f      	cmp	r1, #31
    35fe:	d82c      	bhi.n	365a <__sigtramp_r+0x5e>
    3600:	b538      	push	{r3, r4, r5, lr}
    3602:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    3606:	460c      	mov	r4, r1
    3608:	4605      	mov	r5, r0
    360a:	b1a3      	cbz	r3, 3636 <__sigtramp_r+0x3a>
    360c:	f853 2024 	ldr.w	r2, [r3, r4, lsl #2]
    3610:	eb03 0384 	add.w	r3, r3, r4, lsl #2
    3614:	b14a      	cbz	r2, 362a <__sigtramp_r+0x2e>
    3616:	1c51      	adds	r1, r2, #1
    3618:	d00b      	beq.n	3632 <__sigtramp_r+0x36>
    361a:	2a01      	cmp	r2, #1
    361c:	d007      	beq.n	362e <__sigtramp_r+0x32>
    361e:	2500      	movs	r5, #0
    3620:	4620      	mov	r0, r4
    3622:	601d      	str	r5, [r3, #0]
    3624:	4790      	blx	r2
    3626:	4628      	mov	r0, r5
    3628:	bd38      	pop	{r3, r4, r5, pc}
    362a:	2001      	movs	r0, #1
    362c:	bd38      	pop	{r3, r4, r5, pc}
    362e:	2003      	movs	r0, #3
    3630:	bd38      	pop	{r3, r4, r5, pc}
    3632:	2002      	movs	r0, #2
    3634:	bd38      	pop	{r3, r4, r5, pc}
    3636:	2180      	movs	r1, #128	@ 0x80
    3638:	f000 f8e2 	bl	3800 <_malloc_r>
    363c:	4603      	mov	r3, r0
    363e:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3642:	b138      	cbz	r0, 3654 <__sigtramp_r+0x58>
    3644:	1f02      	subs	r2, r0, #4
    3646:	2100      	movs	r1, #0
    3648:	307c      	adds	r0, #124	@ 0x7c
    364a:	f842 1f04 	str.w	r1, [r2, #4]!
    364e:	4282      	cmp	r2, r0
    3650:	d1fb      	bne.n	364a <__sigtramp_r+0x4e>
    3652:	e7db      	b.n	360c <__sigtramp_r+0x10>
    3654:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3658:	bd38      	pop	{r3, r4, r5, pc}
    365a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    365e:	4770      	bx	lr

00003660 <raise>:
    3660:	b538      	push	{r3, r4, r5, lr}
    3662:	4b14      	ldr	r3, [pc, #80]	@ (36b4 <raise+0x54>)
    3664:	281f      	cmp	r0, #31
    3666:	681d      	ldr	r5, [r3, #0]
    3668:	d81e      	bhi.n	36a8 <raise+0x48>
    366a:	f8d5 2118 	ldr.w	r2, [r5, #280]	@ 0x118
    366e:	4604      	mov	r4, r0
    3670:	b162      	cbz	r2, 368c <raise+0x2c>
    3672:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
    3676:	b14b      	cbz	r3, 368c <raise+0x2c>
    3678:	2b01      	cmp	r3, #1
    367a:	d005      	beq.n	3688 <raise+0x28>
    367c:	1c59      	adds	r1, r3, #1
    367e:	d00f      	beq.n	36a0 <raise+0x40>
    3680:	2100      	movs	r1, #0
    3682:	f842 1020 	str.w	r1, [r2, r0, lsl #2]
    3686:	4798      	blx	r3
    3688:	2000      	movs	r0, #0
    368a:	bd38      	pop	{r3, r4, r5, pc}
    368c:	4628      	mov	r0, r5
    368e:	f000 f8b5 	bl	37fc <_getpid_r>
    3692:	4622      	mov	r2, r4
    3694:	4601      	mov	r1, r0
    3696:	4628      	mov	r0, r5
    3698:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    369c:	f000 b898 	b.w	37d0 <_kill_r>
    36a0:	2316      	movs	r3, #22
    36a2:	602b      	str	r3, [r5, #0]
    36a4:	2001      	movs	r0, #1
    36a6:	bd38      	pop	{r3, r4, r5, pc}
    36a8:	2316      	movs	r3, #22
    36aa:	602b      	str	r3, [r5, #0]
    36ac:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    36b0:	bd38      	pop	{r3, r4, r5, pc}
    36b2:	bf00      	nop
    36b4:	00004980 	.word	0x00004980

000036b8 <signal>:
    36b8:	4b12      	ldr	r3, [pc, #72]	@ (3704 <signal+0x4c>)
    36ba:	281f      	cmp	r0, #31
    36bc:	b570      	push	{r4, r5, r6, lr}
    36be:	681e      	ldr	r6, [r3, #0]
    36c0:	d809      	bhi.n	36d6 <signal+0x1e>
    36c2:	f8d6 3118 	ldr.w	r3, [r6, #280]	@ 0x118
    36c6:	4604      	mov	r4, r0
    36c8:	460d      	mov	r5, r1
    36ca:	b14b      	cbz	r3, 36e0 <signal+0x28>
    36cc:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    36d0:	f843 5024 	str.w	r5, [r3, r4, lsl #2]
    36d4:	bd70      	pop	{r4, r5, r6, pc}
    36d6:	2316      	movs	r3, #22
    36d8:	6033      	str	r3, [r6, #0]
    36da:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    36de:	bd70      	pop	{r4, r5, r6, pc}
    36e0:	2180      	movs	r1, #128	@ 0x80
    36e2:	4630      	mov	r0, r6
    36e4:	f000 f88c 	bl	3800 <_malloc_r>
    36e8:	4603      	mov	r3, r0
    36ea:	f8c6 0118 	str.w	r0, [r6, #280]	@ 0x118
    36ee:	2800      	cmp	r0, #0
    36f0:	d0f3      	beq.n	36da <signal+0x22>
    36f2:	1f02      	subs	r2, r0, #4
    36f4:	2100      	movs	r1, #0
    36f6:	307c      	adds	r0, #124	@ 0x7c
    36f8:	f842 1f04 	str.w	r1, [r2, #4]!
    36fc:	4282      	cmp	r2, r0
    36fe:	d1fb      	bne.n	36f8 <signal+0x40>
    3700:	e7e4      	b.n	36cc <signal+0x14>
    3702:	bf00      	nop
    3704:	00004980 	.word	0x00004980

00003708 <_init_signal>:
    3708:	b538      	push	{r3, r4, r5, lr}
    370a:	4b0c      	ldr	r3, [pc, #48]	@ (373c <_init_signal+0x34>)
    370c:	681d      	ldr	r5, [r3, #0]
    370e:	f8d5 4118 	ldr.w	r4, [r5, #280]	@ 0x118
    3712:	b10c      	cbz	r4, 3718 <_init_signal+0x10>
    3714:	2000      	movs	r0, #0
    3716:	bd38      	pop	{r3, r4, r5, pc}
    3718:	2180      	movs	r1, #128	@ 0x80
    371a:	4628      	mov	r0, r5
    371c:	f000 f870 	bl	3800 <_malloc_r>
    3720:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3724:	b138      	cbz	r0, 3736 <_init_signal+0x2e>
    3726:	1f03      	subs	r3, r0, #4
    3728:	f100 027c 	add.w	r2, r0, #124	@ 0x7c
    372c:	f843 4f04 	str.w	r4, [r3, #4]!
    3730:	4293      	cmp	r3, r2
    3732:	d1fb      	bne.n	372c <_init_signal+0x24>
    3734:	e7ee      	b.n	3714 <_init_signal+0xc>
    3736:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    373a:	bd38      	pop	{r3, r4, r5, pc}
    373c:	00004980 	.word	0x00004980

00003740 <__sigtramp>:
    3740:	b538      	push	{r3, r4, r5, lr}
    3742:	4b18      	ldr	r3, [pc, #96]	@ (37a4 <__sigtramp+0x64>)
    3744:	281f      	cmp	r0, #31
    3746:	681d      	ldr	r5, [r3, #0]
    3748:	d828      	bhi.n	379c <__sigtramp+0x5c>
    374a:	4604      	mov	r4, r0
    374c:	f8d5 0118 	ldr.w	r0, [r5, #280]	@ 0x118
    3750:	b1a0      	cbz	r0, 377c <__sigtramp+0x3c>
    3752:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
    3756:	eb00 0084 	add.w	r0, r0, r4, lsl #2
    375a:	b14b      	cbz	r3, 3770 <__sigtramp+0x30>
    375c:	1c5a      	adds	r2, r3, #1
    375e:	d00b      	beq.n	3778 <__sigtramp+0x38>
    3760:	2b01      	cmp	r3, #1
    3762:	d007      	beq.n	3774 <__sigtramp+0x34>
    3764:	2500      	movs	r5, #0
    3766:	6005      	str	r5, [r0, #0]
    3768:	4620      	mov	r0, r4
    376a:	4798      	blx	r3
    376c:	4628      	mov	r0, r5
    376e:	bd38      	pop	{r3, r4, r5, pc}
    3770:	2001      	movs	r0, #1
    3772:	bd38      	pop	{r3, r4, r5, pc}
    3774:	2003      	movs	r0, #3
    3776:	bd38      	pop	{r3, r4, r5, pc}
    3778:	2002      	movs	r0, #2
    377a:	bd38      	pop	{r3, r4, r5, pc}
    377c:	2180      	movs	r1, #128	@ 0x80
    377e:	4628      	mov	r0, r5
    3780:	f000 f83e 	bl	3800 <_malloc_r>
    3784:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3788:	b140      	cbz	r0, 379c <__sigtramp+0x5c>
    378a:	1f03      	subs	r3, r0, #4
    378c:	f100 017c 	add.w	r1, r0, #124	@ 0x7c
    3790:	2200      	movs	r2, #0
    3792:	f843 2f04 	str.w	r2, [r3, #4]!
    3796:	428b      	cmp	r3, r1
    3798:	d1fb      	bne.n	3792 <__sigtramp+0x52>
    379a:	e7da      	b.n	3752 <__sigtramp+0x12>
    379c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    37a0:	bd38      	pop	{r3, r4, r5, pc}
    37a2:	bf00      	nop
    37a4:	00004980 	.word	0x00004980

000037a8 <__libc_fini_array>:
    37a8:	b538      	push	{r3, r4, r5, lr}
    37aa:	4d07      	ldr	r5, [pc, #28]	@ (37c8 <__libc_fini_array+0x20>)
    37ac:	4c07      	ldr	r4, [pc, #28]	@ (37cc <__libc_fini_array+0x24>)
    37ae:	1b2c      	subs	r4, r5, r4
    37b0:	10a4      	asrs	r4, r4, #2
    37b2:	d005      	beq.n	37c0 <__libc_fini_array+0x18>
    37b4:	3c01      	subs	r4, #1
    37b6:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    37ba:	4798      	blx	r3
    37bc:	2c00      	cmp	r4, #0
    37be:	d1f9      	bne.n	37b4 <__libc_fini_array+0xc>
    37c0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    37c4:	f000 bfd4 	b.w	4770 <_fini>
    37c8:	00004ed8 	.word	0x00004ed8
    37cc:	00004ed0 	.word	0x00004ed0

000037d0 <_kill_r>:
    37d0:	b570      	push	{r4, r5, r6, lr}
    37d2:	460c      	mov	r4, r1
    37d4:	4d08      	ldr	r5, [pc, #32]	@ (37f8 <_kill_r+0x28>)
    37d6:	4603      	mov	r3, r0
    37d8:	2600      	movs	r6, #0
    37da:	4620      	mov	r0, r4
    37dc:	4611      	mov	r1, r2
    37de:	461c      	mov	r4, r3
    37e0:	602e      	str	r6, [r5, #0]
    37e2:	f7fe fd0f 	bl	2204 <__wrap__kill>
    37e6:	1c43      	adds	r3, r0, #1
    37e8:	d000      	beq.n	37ec <_kill_r+0x1c>
    37ea:	bd70      	pop	{r4, r5, r6, pc}
    37ec:	682b      	ldr	r3, [r5, #0]
    37ee:	2b00      	cmp	r3, #0
    37f0:	d0fb      	beq.n	37ea <_kill_r+0x1a>
    37f2:	6023      	str	r3, [r4, #0]
    37f4:	bd70      	pop	{r4, r5, r6, pc}
    37f6:	bf00      	nop
    37f8:	00004f04 	.word	0x00004f04

000037fc <_getpid_r>:
    37fc:	f7fe bce4 	b.w	21c8 <__wrap__getpid>

00003800 <_malloc_r>:
    3800:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3804:	f101 050b 	add.w	r5, r1, #11
    3808:	2d16      	cmp	r5, #22
    380a:	b083      	sub	sp, #12
    380c:	4606      	mov	r6, r0
    380e:	d823      	bhi.n	3858 <_malloc_r+0x58>
    3810:	2910      	cmp	r1, #16
    3812:	f200 80af 	bhi.w	3974 <_malloc_r+0x174>
    3816:	f000 fc97 	bl	4148 <__malloc_lock>
    381a:	2510      	movs	r5, #16
    381c:	2318      	movs	r3, #24
    381e:	2002      	movs	r0, #2
    3820:	4fc0      	ldr	r7, [pc, #768]	@ (3b24 <_malloc_r+0x324>)
    3822:	443b      	add	r3, r7
    3824:	f1a3 0208 	sub.w	r2, r3, #8
    3828:	685c      	ldr	r4, [r3, #4]
    382a:	4294      	cmp	r4, r2
    382c:	f000 8124 	beq.w	3a78 <_malloc_r+0x278>
    3830:	6863      	ldr	r3, [r4, #4]
    3832:	68e2      	ldr	r2, [r4, #12]
    3834:	68a1      	ldr	r1, [r4, #8]
    3836:	f023 0303 	bic.w	r3, r3, #3
    383a:	60ca      	str	r2, [r1, #12]
    383c:	4423      	add	r3, r4
    383e:	4630      	mov	r0, r6
    3840:	6091      	str	r1, [r2, #8]
    3842:	685a      	ldr	r2, [r3, #4]
    3844:	f042 0201 	orr.w	r2, r2, #1
    3848:	605a      	str	r2, [r3, #4]
    384a:	f000 fc7f 	bl	414c <__malloc_unlock>
    384e:	3408      	adds	r4, #8
    3850:	4620      	mov	r0, r4
    3852:	b003      	add	sp, #12
    3854:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3858:	f035 0507 	bics.w	r5, r5, #7
    385c:	f100 808a 	bmi.w	3974 <_malloc_r+0x174>
    3860:	42a9      	cmp	r1, r5
    3862:	f200 8087 	bhi.w	3974 <_malloc_r+0x174>
    3866:	f000 fc6f 	bl	4148 <__malloc_lock>
    386a:	f5b5 7ffc 	cmp.w	r5, #504	@ 0x1f8
    386e:	f0c0 816b 	bcc.w	3b48 <_malloc_r+0x348>
    3872:	0a6b      	lsrs	r3, r5, #9
    3874:	f000 8082 	beq.w	397c <_malloc_r+0x17c>
    3878:	2b04      	cmp	r3, #4
    387a:	f200 8123 	bhi.w	3ac4 <_malloc_r+0x2c4>
    387e:	09ab      	lsrs	r3, r5, #6
    3880:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    3884:	f103 0e38 	add.w	lr, r3, #56	@ 0x38
    3888:	00c3      	lsls	r3, r0, #3
    388a:	4fa6      	ldr	r7, [pc, #664]	@ (3b24 <_malloc_r+0x324>)
    388c:	443b      	add	r3, r7
    388e:	f1a3 0c08 	sub.w	ip, r3, #8
    3892:	685c      	ldr	r4, [r3, #4]
    3894:	45a4      	cmp	ip, r4
    3896:	d107      	bne.n	38a8 <_malloc_r+0xa8>
    3898:	e00d      	b.n	38b6 <_malloc_r+0xb6>
    389a:	2a00      	cmp	r2, #0
    389c:	68e1      	ldr	r1, [r4, #12]
    389e:	f280 80e5 	bge.w	3a6c <_malloc_r+0x26c>
    38a2:	458c      	cmp	ip, r1
    38a4:	d007      	beq.n	38b6 <_malloc_r+0xb6>
    38a6:	460c      	mov	r4, r1
    38a8:	6863      	ldr	r3, [r4, #4]
    38aa:	f023 0303 	bic.w	r3, r3, #3
    38ae:	1b5a      	subs	r2, r3, r5
    38b0:	2a0f      	cmp	r2, #15
    38b2:	ddf2      	ble.n	389a <_malloc_r+0x9a>
    38b4:	4670      	mov	r0, lr
    38b6:	f8df 8270 	ldr.w	r8, [pc, #624]	@ 3b28 <_malloc_r+0x328>
    38ba:	693c      	ldr	r4, [r7, #16]
    38bc:	4544      	cmp	r4, r8
    38be:	f000 80c2 	beq.w	3a46 <_malloc_r+0x246>
    38c2:	6863      	ldr	r3, [r4, #4]
    38c4:	f023 0c03 	bic.w	ip, r3, #3
    38c8:	ebac 0305 	sub.w	r3, ip, r5
    38cc:	2b0f      	cmp	r3, #15
    38ce:	f300 813f 	bgt.w	3b50 <_malloc_r+0x350>
    38d2:	2b00      	cmp	r3, #0
    38d4:	e9c7 8804 	strd	r8, r8, [r7, #16]
    38d8:	f280 812a 	bge.w	3b30 <_malloc_r+0x330>
    38dc:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
    38e0:	f8d7 e004 	ldr.w	lr, [r7, #4]
    38e4:	f080 80ce 	bcs.w	3a84 <_malloc_r+0x284>
    38e8:	ea4f 01dc 	mov.w	r1, ip, lsr #3
    38ec:	3101      	adds	r1, #1
    38ee:	ea4f 1c5c 	mov.w	ip, ip, lsr #5
    38f2:	2301      	movs	r3, #1
    38f4:	fa03 f30c 	lsl.w	r3, r3, ip
    38f8:	f857 2031 	ldr.w	r2, [r7, r1, lsl #3]
    38fc:	60a2      	str	r2, [r4, #8]
    38fe:	ea4e 0e03 	orr.w	lr, lr, r3
    3902:	eb07 03c1 	add.w	r3, r7, r1, lsl #3
    3906:	3b08      	subs	r3, #8
    3908:	60e3      	str	r3, [r4, #12]
    390a:	f8c7 e004 	str.w	lr, [r7, #4]
    390e:	f847 4031 	str.w	r4, [r7, r1, lsl #3]
    3912:	60d4      	str	r4, [r2, #12]
    3914:	1083      	asrs	r3, r0, #2
    3916:	f04f 0c01 	mov.w	ip, #1
    391a:	fa0c fc03 	lsl.w	ip, ip, r3
    391e:	45f4      	cmp	ip, lr
    3920:	d832      	bhi.n	3988 <_malloc_r+0x188>
    3922:	ea1c 0f0e 	tst.w	ip, lr
    3926:	d108      	bne.n	393a <_malloc_r+0x13a>
    3928:	f020 0003 	bic.w	r0, r0, #3
    392c:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    3930:	ea1c 0f0e 	tst.w	ip, lr
    3934:	f100 0004 	add.w	r0, r0, #4
    3938:	d0f8      	beq.n	392c <_malloc_r+0x12c>
    393a:	eb07 0ac0 	add.w	sl, r7, r0, lsl #3
    393e:	46d6      	mov	lr, sl
    3940:	4681      	mov	r9, r0
    3942:	f8de 300c 	ldr.w	r3, [lr, #12]
    3946:	e00b      	b.n	3960 <_malloc_r+0x160>
    3948:	6859      	ldr	r1, [r3, #4]
    394a:	f021 0103 	bic.w	r1, r1, #3
    394e:	1b4a      	subs	r2, r1, r5
    3950:	2a0f      	cmp	r2, #15
    3952:	461c      	mov	r4, r3
    3954:	68db      	ldr	r3, [r3, #12]
    3956:	f300 80c1 	bgt.w	3adc <_malloc_r+0x2dc>
    395a:	2a00      	cmp	r2, #0
    395c:	f280 80d5 	bge.w	3b0a <_malloc_r+0x30a>
    3960:	459e      	cmp	lr, r3
    3962:	d1f1      	bne.n	3948 <_malloc_r+0x148>
    3964:	f109 0901 	add.w	r9, r9, #1
    3968:	f019 0f03 	tst.w	r9, #3
    396c:	f10e 0e08 	add.w	lr, lr, #8
    3970:	d1e7      	bne.n	3942 <_malloc_r+0x142>
    3972:	e116      	b.n	3ba2 <_malloc_r+0x3a2>
    3974:	230c      	movs	r3, #12
    3976:	6033      	str	r3, [r6, #0]
    3978:	2400      	movs	r4, #0
    397a:	e769      	b.n	3850 <_malloc_r+0x50>
    397c:	f44f 7300 	mov.w	r3, #512	@ 0x200
    3980:	2040      	movs	r0, #64	@ 0x40
    3982:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
    3986:	e780      	b.n	388a <_malloc_r+0x8a>
    3988:	68bc      	ldr	r4, [r7, #8]
    398a:	6863      	ldr	r3, [r4, #4]
    398c:	f023 0903 	bic.w	r9, r3, #3
    3990:	45a9      	cmp	r9, r5
    3992:	d303      	bcc.n	399c <_malloc_r+0x19c>
    3994:	eba9 0305 	sub.w	r3, r9, r5
    3998:	2b0f      	cmp	r3, #15
    399a:	dc57      	bgt.n	3a4c <_malloc_r+0x24c>
    399c:	f8df b18c 	ldr.w	fp, [pc, #396]	@ 3b2c <_malloc_r+0x32c>
    39a0:	f8db 2000 	ldr.w	r2, [fp]
    39a4:	eb04 0309 	add.w	r3, r4, r9
    39a8:	3210      	adds	r2, #16
    39aa:	2008      	movs	r0, #8
    39ac:	eb02 0805 	add.w	r8, r2, r5
    39b0:	9300      	str	r3, [sp, #0]
    39b2:	f000 fb89 	bl	40c8 <sysconf>
    39b6:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    39ba:	3101      	adds	r1, #1
    39bc:	4602      	mov	r2, r0
    39be:	d005      	beq.n	39cc <_malloc_r+0x1cc>
    39c0:	f108 38ff 	add.w	r8, r8, #4294967295	@ 0xffffffff
    39c4:	4480      	add	r8, r0
    39c6:	4241      	negs	r1, r0
    39c8:	ea01 0808 	and.w	r8, r1, r8
    39cc:	4641      	mov	r1, r8
    39ce:	4630      	mov	r0, r6
    39d0:	9201      	str	r2, [sp, #4]
    39d2:	f000 fccf 	bl	4374 <_sbrk_r>
    39d6:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
    39da:	9a01      	ldr	r2, [sp, #4]
    39dc:	4682      	mov	sl, r0
    39de:	f000 80d2 	beq.w	3b86 <_malloc_r+0x386>
    39e2:	9b00      	ldr	r3, [sp, #0]
    39e4:	4283      	cmp	r3, r0
    39e6:	f200 80cc 	bhi.w	3b82 <_malloc_r+0x382>
    39ea:	f8db 1004 	ldr.w	r1, [fp, #4]
    39ee:	4441      	add	r1, r8
    39f0:	f8cb 1004 	str.w	r1, [fp, #4]
    39f4:	4608      	mov	r0, r1
    39f6:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    39fa:	f040 80f4 	bne.w	3be6 <_malloc_r+0x3e6>
    39fe:	ea1a 0f0c 	tst.w	sl, ip
    3a02:	f040 80f0 	bne.w	3be6 <_malloc_r+0x3e6>
    3a06:	f8d7 a008 	ldr.w	sl, [r7, #8]
    3a0a:	44c8      	add	r8, r9
    3a0c:	f048 0001 	orr.w	r0, r8, #1
    3a10:	f8ca 0004 	str.w	r0, [sl, #4]
    3a14:	f8db 202c 	ldr.w	r2, [fp, #44]	@ 0x2c
    3a18:	428a      	cmp	r2, r1
    3a1a:	f8db 2030 	ldr.w	r2, [fp, #48]	@ 0x30
    3a1e:	bf38      	it	cc
    3a20:	f8cb 102c 	strcc.w	r1, [fp, #44]	@ 0x2c
    3a24:	428a      	cmp	r2, r1
    3a26:	bf38      	it	cc
    3a28:	f8cb 1030 	strcc.w	r1, [fp, #48]	@ 0x30
    3a2c:	4654      	mov	r4, sl
    3a2e:	f020 0803 	bic.w	r8, r0, #3
    3a32:	45a8      	cmp	r8, r5
    3a34:	eba8 0305 	sub.w	r3, r8, r5
    3a38:	d301      	bcc.n	3a3e <_malloc_r+0x23e>
    3a3a:	2b0f      	cmp	r3, #15
    3a3c:	dc06      	bgt.n	3a4c <_malloc_r+0x24c>
    3a3e:	4630      	mov	r0, r6
    3a40:	f000 fb84 	bl	414c <__malloc_unlock>
    3a44:	e798      	b.n	3978 <_malloc_r+0x178>
    3a46:	f8d7 e004 	ldr.w	lr, [r7, #4]
    3a4a:	e763      	b.n	3914 <_malloc_r+0x114>
    3a4c:	1962      	adds	r2, r4, r5
    3a4e:	f043 0301 	orr.w	r3, r3, #1
    3a52:	f045 0501 	orr.w	r5, r5, #1
    3a56:	6065      	str	r5, [r4, #4]
    3a58:	4630      	mov	r0, r6
    3a5a:	60ba      	str	r2, [r7, #8]
    3a5c:	6053      	str	r3, [r2, #4]
    3a5e:	f000 fb75 	bl	414c <__malloc_unlock>
    3a62:	3408      	adds	r4, #8
    3a64:	4620      	mov	r0, r4
    3a66:	b003      	add	sp, #12
    3a68:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3a6c:	68a2      	ldr	r2, [r4, #8]
    3a6e:	4423      	add	r3, r4
    3a70:	60d1      	str	r1, [r2, #12]
    3a72:	4630      	mov	r0, r6
    3a74:	608a      	str	r2, [r1, #8]
    3a76:	e6e4      	b.n	3842 <_malloc_r+0x42>
    3a78:	68dc      	ldr	r4, [r3, #12]
    3a7a:	42a3      	cmp	r3, r4
    3a7c:	f47f aed8 	bne.w	3830 <_malloc_r+0x30>
    3a80:	3002      	adds	r0, #2
    3a82:	e718      	b.n	38b6 <_malloc_r+0xb6>
    3a84:	f5bc 6f20 	cmp.w	ip, #2560	@ 0xa00
    3a88:	ea4f 225c 	mov.w	r2, ip, lsr #9
    3a8c:	d372      	bcc.n	3b74 <_malloc_r+0x374>
    3a8e:	2a14      	cmp	r2, #20
    3a90:	f200 8108 	bhi.w	3ca4 <_malloc_r+0x4a4>
    3a94:	f102 035c 	add.w	r3, r2, #92	@ 0x5c
    3a98:	00db      	lsls	r3, r3, #3
    3a9a:	325b      	adds	r2, #91	@ 0x5b
    3a9c:	18f9      	adds	r1, r7, r3
    3a9e:	58fb      	ldr	r3, [r7, r3]
    3aa0:	3908      	subs	r1, #8
    3aa2:	4299      	cmp	r1, r3
    3aa4:	d103      	bne.n	3aae <_malloc_r+0x2ae>
    3aa6:	e0e4      	b.n	3c72 <_malloc_r+0x472>
    3aa8:	689b      	ldr	r3, [r3, #8]
    3aaa:	4299      	cmp	r1, r3
    3aac:	d004      	beq.n	3ab8 <_malloc_r+0x2b8>
    3aae:	685a      	ldr	r2, [r3, #4]
    3ab0:	f022 0203 	bic.w	r2, r2, #3
    3ab4:	4562      	cmp	r2, ip
    3ab6:	d8f7      	bhi.n	3aa8 <_malloc_r+0x2a8>
    3ab8:	68d9      	ldr	r1, [r3, #12]
    3aba:	e9c4 3102 	strd	r3, r1, [r4, #8]
    3abe:	608c      	str	r4, [r1, #8]
    3ac0:	60dc      	str	r4, [r3, #12]
    3ac2:	e727      	b.n	3914 <_malloc_r+0x114>
    3ac4:	2b14      	cmp	r3, #20
    3ac6:	d961      	bls.n	3b8c <_malloc_r+0x38c>
    3ac8:	2b54      	cmp	r3, #84	@ 0x54
    3aca:	f200 80f4 	bhi.w	3cb6 <_malloc_r+0x4b6>
    3ace:	0b2b      	lsrs	r3, r5, #12
    3ad0:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    3ad4:	f103 0e6e 	add.w	lr, r3, #110	@ 0x6e
    3ad8:	00c3      	lsls	r3, r0, #3
    3ada:	e6d6      	b.n	388a <_malloc_r+0x8a>
    3adc:	f8d4 c008 	ldr.w	ip, [r4, #8]
    3ae0:	4630      	mov	r0, r6
    3ae2:	1966      	adds	r6, r4, r5
    3ae4:	f045 0501 	orr.w	r5, r5, #1
    3ae8:	6065      	str	r5, [r4, #4]
    3aea:	f8cc 300c 	str.w	r3, [ip, #12]
    3aee:	f8c3 c008 	str.w	ip, [r3, #8]
    3af2:	f042 0301 	orr.w	r3, r2, #1
    3af6:	e9c7 6604 	strd	r6, r6, [r7, #16]
    3afa:	e9c6 8802 	strd	r8, r8, [r6, #8]
    3afe:	6073      	str	r3, [r6, #4]
    3b00:	5062      	str	r2, [r4, r1]
    3b02:	f000 fb23 	bl	414c <__malloc_unlock>
    3b06:	3408      	adds	r4, #8
    3b08:	e6a2      	b.n	3850 <_malloc_r+0x50>
    3b0a:	4421      	add	r1, r4
    3b0c:	4630      	mov	r0, r6
    3b0e:	684a      	ldr	r2, [r1, #4]
    3b10:	f042 0201 	orr.w	r2, r2, #1
    3b14:	604a      	str	r2, [r1, #4]
    3b16:	f854 2f08 	ldr.w	r2, [r4, #8]!
    3b1a:	60d3      	str	r3, [r2, #12]
    3b1c:	609a      	str	r2, [r3, #8]
    3b1e:	f000 fb15 	bl	414c <__malloc_unlock>
    3b22:	e695      	b.n	3850 <_malloc_r+0x50>
    3b24:	00004aa8 	.word	0x00004aa8
    3b28:	00004ab0 	.word	0x00004ab0
    3b2c:	00004f08 	.word	0x00004f08
    3b30:	44a4      	add	ip, r4
    3b32:	4630      	mov	r0, r6
    3b34:	f8dc 3004 	ldr.w	r3, [ip, #4]
    3b38:	f043 0301 	orr.w	r3, r3, #1
    3b3c:	f8cc 3004 	str.w	r3, [ip, #4]
    3b40:	f000 fb04 	bl	414c <__malloc_unlock>
    3b44:	3408      	adds	r4, #8
    3b46:	e683      	b.n	3850 <_malloc_r+0x50>
    3b48:	08e8      	lsrs	r0, r5, #3
    3b4a:	f105 0308 	add.w	r3, r5, #8
    3b4e:	e667      	b.n	3820 <_malloc_r+0x20>
    3b50:	1962      	adds	r2, r4, r5
    3b52:	f043 0101 	orr.w	r1, r3, #1
    3b56:	f045 0501 	orr.w	r5, r5, #1
    3b5a:	6065      	str	r5, [r4, #4]
    3b5c:	4630      	mov	r0, r6
    3b5e:	e9c7 2204 	strd	r2, r2, [r7, #16]
    3b62:	e9c2 8802 	strd	r8, r8, [r2, #8]
    3b66:	6051      	str	r1, [r2, #4]
    3b68:	f844 300c 	str.w	r3, [r4, ip]
    3b6c:	f000 faee 	bl	414c <__malloc_unlock>
    3b70:	3408      	adds	r4, #8
    3b72:	e66d      	b.n	3850 <_malloc_r+0x50>
    3b74:	ea4f 129c 	mov.w	r2, ip, lsr #6
    3b78:	f102 0339 	add.w	r3, r2, #57	@ 0x39
    3b7c:	00db      	lsls	r3, r3, #3
    3b7e:	3238      	adds	r2, #56	@ 0x38
    3b80:	e78c      	b.n	3a9c <_malloc_r+0x29c>
    3b82:	42bc      	cmp	r4, r7
    3b84:	d028      	beq.n	3bd8 <_malloc_r+0x3d8>
    3b86:	68bc      	ldr	r4, [r7, #8]
    3b88:	6860      	ldr	r0, [r4, #4]
    3b8a:	e750      	b.n	3a2e <_malloc_r+0x22e>
    3b8c:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    3b90:	f103 0e5b 	add.w	lr, r3, #91	@ 0x5b
    3b94:	00c3      	lsls	r3, r0, #3
    3b96:	e678      	b.n	388a <_malloc_r+0x8a>
    3b98:	f85a 3908 	ldr.w	r3, [sl], #-8
    3b9c:	4553      	cmp	r3, sl
    3b9e:	f040 80d7 	bne.w	3d50 <_malloc_r+0x550>
    3ba2:	f010 0f03 	tst.w	r0, #3
    3ba6:	f100 30ff 	add.w	r0, r0, #4294967295	@ 0xffffffff
    3baa:	d1f5      	bne.n	3b98 <_malloc_r+0x398>
    3bac:	687b      	ldr	r3, [r7, #4]
    3bae:	ea23 030c 	bic.w	r3, r3, ip
    3bb2:	607b      	str	r3, [r7, #4]
    3bb4:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    3bb8:	459c      	cmp	ip, r3
    3bba:	f63f aee5 	bhi.w	3988 <_malloc_r+0x188>
    3bbe:	f1bc 0f00 	cmp.w	ip, #0
    3bc2:	d104      	bne.n	3bce <_malloc_r+0x3ce>
    3bc4:	e6e0      	b.n	3988 <_malloc_r+0x188>
    3bc6:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    3bca:	f109 0904 	add.w	r9, r9, #4
    3bce:	ea1c 0f03 	tst.w	ip, r3
    3bd2:	d0f8      	beq.n	3bc6 <_malloc_r+0x3c6>
    3bd4:	4648      	mov	r0, r9
    3bd6:	e6b0      	b.n	393a <_malloc_r+0x13a>
    3bd8:	f8db 0004 	ldr.w	r0, [fp, #4]
    3bdc:	4440      	add	r0, r8
    3bde:	f8cb 0004 	str.w	r0, [fp, #4]
    3be2:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    3be6:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    3bea:	3101      	adds	r1, #1
    3bec:	d06d      	beq.n	3cca <_malloc_r+0x4ca>
    3bee:	9b00      	ldr	r3, [sp, #0]
    3bf0:	ebaa 0303 	sub.w	r3, sl, r3
    3bf4:	4418      	add	r0, r3
    3bf6:	f8cb 0004 	str.w	r0, [fp, #4]
    3bfa:	f01a 0307 	ands.w	r3, sl, #7
    3bfe:	9300      	str	r3, [sp, #0]
    3c00:	d041      	beq.n	3c86 <_malloc_r+0x486>
    3c02:	f1c3 0108 	rsb	r1, r3, #8
    3c06:	448a      	add	sl, r1
    3c08:	44d0      	add	r8, sl
    3c0a:	440a      	add	r2, r1
    3c0c:	ea08 010c 	and.w	r1, r8, ip
    3c10:	1a52      	subs	r2, r2, r1
    3c12:	ea02 010c 	and.w	r1, r2, ip
    3c16:	4630      	mov	r0, r6
    3c18:	9101      	str	r1, [sp, #4]
    3c1a:	f000 fbab 	bl	4374 <_sbrk_r>
    3c1e:	1c42      	adds	r2, r0, #1
    3c20:	d06f      	beq.n	3d02 <_malloc_r+0x502>
    3c22:	9901      	ldr	r1, [sp, #4]
    3c24:	eba0 000a 	sub.w	r0, r0, sl
    3c28:	eb00 0801 	add.w	r8, r0, r1
    3c2c:	f8db 2004 	ldr.w	r2, [fp, #4]
    3c30:	f8c7 a008 	str.w	sl, [r7, #8]
    3c34:	f048 0001 	orr.w	r0, r8, #1
    3c38:	4411      	add	r1, r2
    3c3a:	42bc      	cmp	r4, r7
    3c3c:	f8ca 0004 	str.w	r0, [sl, #4]
    3c40:	f8cb 1004 	str.w	r1, [fp, #4]
    3c44:	f43f aee6 	beq.w	3a14 <_malloc_r+0x214>
    3c48:	f1b9 0f0f 	cmp.w	r9, #15
    3c4c:	d940      	bls.n	3cd0 <_malloc_r+0x4d0>
    3c4e:	6862      	ldr	r2, [r4, #4]
    3c50:	f1a9 000c 	sub.w	r0, r9, #12
    3c54:	f020 0007 	bic.w	r0, r0, #7
    3c58:	f002 0201 	and.w	r2, r2, #1
    3c5c:	4302      	orrs	r2, r0
    3c5e:	6062      	str	r2, [r4, #4]
    3c60:	2305      	movs	r3, #5
    3c62:	1822      	adds	r2, r4, r0
    3c64:	280f      	cmp	r0, #15
    3c66:	e9c2 3301 	strd	r3, r3, [r2, #4]
    3c6a:	d852      	bhi.n	3d12 <_malloc_r+0x512>
    3c6c:	f8da 0004 	ldr.w	r0, [sl, #4]
    3c70:	e6d0      	b.n	3a14 <_malloc_r+0x214>
    3c72:	1092      	asrs	r2, r2, #2
    3c74:	f04f 0c01 	mov.w	ip, #1
    3c78:	fa0c f202 	lsl.w	r2, ip, r2
    3c7c:	ea4e 0e02 	orr.w	lr, lr, r2
    3c80:	f8c7 e004 	str.w	lr, [r7, #4]
    3c84:	e719      	b.n	3aba <_malloc_r+0x2ba>
    3c86:	eb0a 0108 	add.w	r1, sl, r8
    3c8a:	ea01 010c 	and.w	r1, r1, ip
    3c8e:	1a52      	subs	r2, r2, r1
    3c90:	ea02 010c 	and.w	r1, r2, ip
    3c94:	4630      	mov	r0, r6
    3c96:	9101      	str	r1, [sp, #4]
    3c98:	f000 fb6c 	bl	4374 <_sbrk_r>
    3c9c:	1c43      	adds	r3, r0, #1
    3c9e:	d1c0      	bne.n	3c22 <_malloc_r+0x422>
    3ca0:	9900      	ldr	r1, [sp, #0]
    3ca2:	e7c3      	b.n	3c2c <_malloc_r+0x42c>
    3ca4:	2a54      	cmp	r2, #84	@ 0x54
    3ca6:	d817      	bhi.n	3cd8 <_malloc_r+0x4d8>
    3ca8:	ea4f 321c 	mov.w	r2, ip, lsr #12
    3cac:	f102 036f 	add.w	r3, r2, #111	@ 0x6f
    3cb0:	00db      	lsls	r3, r3, #3
    3cb2:	326e      	adds	r2, #110	@ 0x6e
    3cb4:	e6f2      	b.n	3a9c <_malloc_r+0x29c>
    3cb6:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    3cba:	d817      	bhi.n	3cec <_malloc_r+0x4ec>
    3cbc:	0beb      	lsrs	r3, r5, #15
    3cbe:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    3cc2:	f103 0e77 	add.w	lr, r3, #119	@ 0x77
    3cc6:	00c3      	lsls	r3, r0, #3
    3cc8:	e5df      	b.n	388a <_malloc_r+0x8a>
    3cca:	f8c7 a408 	str.w	sl, [r7, #1032]	@ 0x408
    3cce:	e794      	b.n	3bfa <_malloc_r+0x3fa>
    3cd0:	2301      	movs	r3, #1
    3cd2:	f8ca 3004 	str.w	r3, [sl, #4]
    3cd6:	e6b2      	b.n	3a3e <_malloc_r+0x23e>
    3cd8:	f5b2 7faa 	cmp.w	r2, #340	@ 0x154
    3cdc:	d823      	bhi.n	3d26 <_malloc_r+0x526>
    3cde:	ea4f 32dc 	mov.w	r2, ip, lsr #15
    3ce2:	f102 0378 	add.w	r3, r2, #120	@ 0x78
    3ce6:	00db      	lsls	r3, r3, #3
    3ce8:	3277      	adds	r2, #119	@ 0x77
    3cea:	e6d7      	b.n	3a9c <_malloc_r+0x29c>
    3cec:	f240 5254 	movw	r2, #1364	@ 0x554
    3cf0:	4293      	cmp	r3, r2
    3cf2:	d823      	bhi.n	3d3c <_malloc_r+0x53c>
    3cf4:	0cab      	lsrs	r3, r5, #18
    3cf6:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    3cfa:	f103 0e7c 	add.w	lr, r3, #124	@ 0x7c
    3cfe:	00c3      	lsls	r3, r0, #3
    3d00:	e5c3      	b.n	388a <_malloc_r+0x8a>
    3d02:	9b00      	ldr	r3, [sp, #0]
    3d04:	f1a3 0208 	sub.w	r2, r3, #8
    3d08:	4490      	add	r8, r2
    3d0a:	eba8 080a 	sub.w	r8, r8, sl
    3d0e:	2100      	movs	r1, #0
    3d10:	e78c      	b.n	3c2c <_malloc_r+0x42c>
    3d12:	f104 0108 	add.w	r1, r4, #8
    3d16:	4630      	mov	r0, r6
    3d18:	f000 f878 	bl	3e0c <_free_r>
    3d1c:	f8db 1004 	ldr.w	r1, [fp, #4]
    3d20:	f8d7 a008 	ldr.w	sl, [r7, #8]
    3d24:	e7a2      	b.n	3c6c <_malloc_r+0x46c>
    3d26:	f240 5354 	movw	r3, #1364	@ 0x554
    3d2a:	429a      	cmp	r2, r3
    3d2c:	d80c      	bhi.n	3d48 <_malloc_r+0x548>
    3d2e:	ea4f 429c 	mov.w	r2, ip, lsr #18
    3d32:	f102 037d 	add.w	r3, r2, #125	@ 0x7d
    3d36:	00db      	lsls	r3, r3, #3
    3d38:	327c      	adds	r2, #124	@ 0x7c
    3d3a:	e6af      	b.n	3a9c <_malloc_r+0x29c>
    3d3c:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    3d40:	207f      	movs	r0, #127	@ 0x7f
    3d42:	f04f 0e7e 	mov.w	lr, #126	@ 0x7e
    3d46:	e5a0      	b.n	388a <_malloc_r+0x8a>
    3d48:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    3d4c:	227e      	movs	r2, #126	@ 0x7e
    3d4e:	e6a5      	b.n	3a9c <_malloc_r+0x29c>
    3d50:	687b      	ldr	r3, [r7, #4]
    3d52:	e72f      	b.n	3bb4 <_malloc_r+0x3b4>

00003d54 <_malloc_trim_r>:
    3d54:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    3d58:	4606      	mov	r6, r0
    3d5a:	2008      	movs	r0, #8
    3d5c:	4689      	mov	r9, r1
    3d5e:	f000 f9b3 	bl	40c8 <sysconf>
    3d62:	f8df 80a4 	ldr.w	r8, [pc, #164]	@ 3e08 <_malloc_trim_r+0xb4>
    3d66:	4605      	mov	r5, r0
    3d68:	4630      	mov	r0, r6
    3d6a:	f000 f9ed 	bl	4148 <__malloc_lock>
    3d6e:	f8d8 3008 	ldr.w	r3, [r8, #8]
    3d72:	685f      	ldr	r7, [r3, #4]
    3d74:	f027 0703 	bic.w	r7, r7, #3
    3d78:	f1a7 0411 	sub.w	r4, r7, #17
    3d7c:	eba4 0409 	sub.w	r4, r4, r9
    3d80:	442c      	add	r4, r5
    3d82:	fbb4 f4f5 	udiv	r4, r4, r5
    3d86:	3c01      	subs	r4, #1
    3d88:	fb05 f404 	mul.w	r4, r5, r4
    3d8c:	42a5      	cmp	r5, r4
    3d8e:	dc08      	bgt.n	3da2 <_malloc_trim_r+0x4e>
    3d90:	2100      	movs	r1, #0
    3d92:	4630      	mov	r0, r6
    3d94:	f000 faee 	bl	4374 <_sbrk_r>
    3d98:	f8d8 3008 	ldr.w	r3, [r8, #8]
    3d9c:	443b      	add	r3, r7
    3d9e:	4298      	cmp	r0, r3
    3da0:	d005      	beq.n	3dae <_malloc_trim_r+0x5a>
    3da2:	4630      	mov	r0, r6
    3da4:	f000 f9d2 	bl	414c <__malloc_unlock>
    3da8:	2000      	movs	r0, #0
    3daa:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    3dae:	4261      	negs	r1, r4
    3db0:	4630      	mov	r0, r6
    3db2:	f000 fadf 	bl	4374 <_sbrk_r>
    3db6:	3001      	adds	r0, #1
    3db8:	d00f      	beq.n	3dda <_malloc_trim_r+0x86>
    3dba:	4a11      	ldr	r2, [pc, #68]	@ (3e00 <_malloc_trim_r+0xac>)
    3dbc:	f8d8 3008 	ldr.w	r3, [r8, #8]
    3dc0:	1b3f      	subs	r7, r7, r4
    3dc2:	f047 0701 	orr.w	r7, r7, #1
    3dc6:	605f      	str	r7, [r3, #4]
    3dc8:	6813      	ldr	r3, [r2, #0]
    3dca:	4630      	mov	r0, r6
    3dcc:	1b1b      	subs	r3, r3, r4
    3dce:	6013      	str	r3, [r2, #0]
    3dd0:	f000 f9bc 	bl	414c <__malloc_unlock>
    3dd4:	2001      	movs	r0, #1
    3dd6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    3dda:	2100      	movs	r1, #0
    3ddc:	4630      	mov	r0, r6
    3dde:	f000 fac9 	bl	4374 <_sbrk_r>
    3de2:	f8d8 2008 	ldr.w	r2, [r8, #8]
    3de6:	1a83      	subs	r3, r0, r2
    3de8:	2b0f      	cmp	r3, #15
    3dea:	ddda      	ble.n	3da2 <_malloc_trim_r+0x4e>
    3dec:	f043 0301 	orr.w	r3, r3, #1
    3df0:	6053      	str	r3, [r2, #4]
    3df2:	4b04      	ldr	r3, [pc, #16]	@ (3e04 <_malloc_trim_r+0xb0>)
    3df4:	4902      	ldr	r1, [pc, #8]	@ (3e00 <_malloc_trim_r+0xac>)
    3df6:	681b      	ldr	r3, [r3, #0]
    3df8:	1ac0      	subs	r0, r0, r3
    3dfa:	6008      	str	r0, [r1, #0]
    3dfc:	e7d1      	b.n	3da2 <_malloc_trim_r+0x4e>
    3dfe:	bf00      	nop
    3e00:	00004f0c 	.word	0x00004f0c
    3e04:	00004eb0 	.word	0x00004eb0
    3e08:	00004aa8 	.word	0x00004aa8

00003e0c <_free_r>:
    3e0c:	2900      	cmp	r1, #0
    3e0e:	d07c      	beq.n	3f0a <_free_r+0xfe>
    3e10:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3e14:	460c      	mov	r4, r1
    3e16:	4680      	mov	r8, r0
    3e18:	f000 f996 	bl	4148 <__malloc_lock>
    3e1c:	f854 3c04 	ldr.w	r3, [r4, #-4]
    3e20:	4f75      	ldr	r7, [pc, #468]	@ (3ff8 <_free_r+0x1ec>)
    3e22:	f1a4 0508 	sub.w	r5, r4, #8
    3e26:	f023 0101 	bic.w	r1, r3, #1
    3e2a:	1868      	adds	r0, r5, r1
    3e2c:	68be      	ldr	r6, [r7, #8]
    3e2e:	6842      	ldr	r2, [r0, #4]
    3e30:	4286      	cmp	r6, r0
    3e32:	f022 0203 	bic.w	r2, r2, #3
    3e36:	f000 8083 	beq.w	3f40 <_free_r+0x134>
    3e3a:	07de      	lsls	r6, r3, #31
    3e3c:	6042      	str	r2, [r0, #4]
    3e3e:	eb00 0c02 	add.w	ip, r0, r2
    3e42:	d433      	bmi.n	3eac <_free_r+0xa0>
    3e44:	f854 4c08 	ldr.w	r4, [r4, #-8]
    3e48:	f8dc 3004 	ldr.w	r3, [ip, #4]
    3e4c:	1b2d      	subs	r5, r5, r4
    3e4e:	4421      	add	r1, r4
    3e50:	68ac      	ldr	r4, [r5, #8]
    3e52:	f107 0c08 	add.w	ip, r7, #8
    3e56:	4564      	cmp	r4, ip
    3e58:	f003 0301 	and.w	r3, r3, #1
    3e5c:	d064      	beq.n	3f28 <_free_r+0x11c>
    3e5e:	f8d5 e00c 	ldr.w	lr, [r5, #12]
    3e62:	f8c4 e00c 	str.w	lr, [r4, #12]
    3e66:	f8ce 4008 	str.w	r4, [lr, #8]
    3e6a:	2b00      	cmp	r3, #0
    3e6c:	f000 8081 	beq.w	3f72 <_free_r+0x166>
    3e70:	f041 0301 	orr.w	r3, r1, #1
    3e74:	606b      	str	r3, [r5, #4]
    3e76:	6001      	str	r1, [r0, #0]
    3e78:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    3e7c:	d222      	bcs.n	3ec4 <_free_r+0xb8>
    3e7e:	6878      	ldr	r0, [r7, #4]
    3e80:	08cb      	lsrs	r3, r1, #3
    3e82:	2201      	movs	r2, #1
    3e84:	0949      	lsrs	r1, r1, #5
    3e86:	3301      	adds	r3, #1
    3e88:	408a      	lsls	r2, r1
    3e8a:	4302      	orrs	r2, r0
    3e8c:	f857 1033 	ldr.w	r1, [r7, r3, lsl #3]
    3e90:	607a      	str	r2, [r7, #4]
    3e92:	eb07 02c3 	add.w	r2, r7, r3, lsl #3
    3e96:	3a08      	subs	r2, #8
    3e98:	e9c5 1202 	strd	r1, r2, [r5, #8]
    3e9c:	f847 5033 	str.w	r5, [r7, r3, lsl #3]
    3ea0:	60cd      	str	r5, [r1, #12]
    3ea2:	4640      	mov	r0, r8
    3ea4:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3ea8:	f000 b950 	b.w	414c <__malloc_unlock>
    3eac:	f8dc 3004 	ldr.w	r3, [ip, #4]
    3eb0:	07db      	lsls	r3, r3, #31
    3eb2:	d52b      	bpl.n	3f0c <_free_r+0x100>
    3eb4:	f041 0301 	orr.w	r3, r1, #1
    3eb8:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    3ebc:	f844 3c04 	str.w	r3, [r4, #-4]
    3ec0:	6001      	str	r1, [r0, #0]
    3ec2:	d3dc      	bcc.n	3e7e <_free_r+0x72>
    3ec4:	f5b1 6f20 	cmp.w	r1, #2560	@ 0xa00
    3ec8:	ea4f 2351 	mov.w	r3, r1, lsr #9
    3ecc:	d253      	bcs.n	3f76 <_free_r+0x16a>
    3ece:	098b      	lsrs	r3, r1, #6
    3ed0:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    3ed4:	f103 0238 	add.w	r2, r3, #56	@ 0x38
    3ed8:	00c3      	lsls	r3, r0, #3
    3eda:	18f8      	adds	r0, r7, r3
    3edc:	58fb      	ldr	r3, [r7, r3]
    3ede:	3808      	subs	r0, #8
    3ee0:	4298      	cmp	r0, r3
    3ee2:	d103      	bne.n	3eec <_free_r+0xe0>
    3ee4:	e061      	b.n	3faa <_free_r+0x19e>
    3ee6:	689b      	ldr	r3, [r3, #8]
    3ee8:	4298      	cmp	r0, r3
    3eea:	d004      	beq.n	3ef6 <_free_r+0xea>
    3eec:	685a      	ldr	r2, [r3, #4]
    3eee:	f022 0203 	bic.w	r2, r2, #3
    3ef2:	428a      	cmp	r2, r1
    3ef4:	d8f7      	bhi.n	3ee6 <_free_r+0xda>
    3ef6:	68d8      	ldr	r0, [r3, #12]
    3ef8:	e9c5 3002 	strd	r3, r0, [r5, #8]
    3efc:	6085      	str	r5, [r0, #8]
    3efe:	60dd      	str	r5, [r3, #12]
    3f00:	4640      	mov	r0, r8
    3f02:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3f06:	f000 b921 	b.w	414c <__malloc_unlock>
    3f0a:	4770      	bx	lr
    3f0c:	4411      	add	r1, r2
    3f0e:	f107 0c08 	add.w	ip, r7, #8
    3f12:	6883      	ldr	r3, [r0, #8]
    3f14:	4563      	cmp	r3, ip
    3f16:	d03f      	beq.n	3f98 <_free_r+0x18c>
    3f18:	68c2      	ldr	r2, [r0, #12]
    3f1a:	60da      	str	r2, [r3, #12]
    3f1c:	6093      	str	r3, [r2, #8]
    3f1e:	f041 0301 	orr.w	r3, r1, #1
    3f22:	606b      	str	r3, [r5, #4]
    3f24:	5069      	str	r1, [r5, r1]
    3f26:	e7a7      	b.n	3e78 <_free_r+0x6c>
    3f28:	2b00      	cmp	r3, #0
    3f2a:	d15f      	bne.n	3fec <_free_r+0x1e0>
    3f2c:	440a      	add	r2, r1
    3f2e:	e9d0 1302 	ldrd	r1, r3, [r0, #8]
    3f32:	60cb      	str	r3, [r1, #12]
    3f34:	6099      	str	r1, [r3, #8]
    3f36:	f042 0301 	orr.w	r3, r2, #1
    3f3a:	606b      	str	r3, [r5, #4]
    3f3c:	50aa      	str	r2, [r5, r2]
    3f3e:	e7b0      	b.n	3ea2 <_free_r+0x96>
    3f40:	07db      	lsls	r3, r3, #31
    3f42:	440a      	add	r2, r1
    3f44:	d407      	bmi.n	3f56 <_free_r+0x14a>
    3f46:	f854 3c08 	ldr.w	r3, [r4, #-8]
    3f4a:	1aed      	subs	r5, r5, r3
    3f4c:	441a      	add	r2, r3
    3f4e:	e9d5 1302 	ldrd	r1, r3, [r5, #8]
    3f52:	60cb      	str	r3, [r1, #12]
    3f54:	6099      	str	r1, [r3, #8]
    3f56:	f042 0301 	orr.w	r3, r2, #1
    3f5a:	606b      	str	r3, [r5, #4]
    3f5c:	4b27      	ldr	r3, [pc, #156]	@ (3ffc <_free_r+0x1f0>)
    3f5e:	60bd      	str	r5, [r7, #8]
    3f60:	681b      	ldr	r3, [r3, #0]
    3f62:	4293      	cmp	r3, r2
    3f64:	d89d      	bhi.n	3ea2 <_free_r+0x96>
    3f66:	4b26      	ldr	r3, [pc, #152]	@ (4000 <_free_r+0x1f4>)
    3f68:	4640      	mov	r0, r8
    3f6a:	6819      	ldr	r1, [r3, #0]
    3f6c:	f7ff fef2 	bl	3d54 <_malloc_trim_r>
    3f70:	e797      	b.n	3ea2 <_free_r+0x96>
    3f72:	4411      	add	r1, r2
    3f74:	e7cd      	b.n	3f12 <_free_r+0x106>
    3f76:	2b14      	cmp	r3, #20
    3f78:	d908      	bls.n	3f8c <_free_r+0x180>
    3f7a:	2b54      	cmp	r3, #84	@ 0x54
    3f7c:	d81d      	bhi.n	3fba <_free_r+0x1ae>
    3f7e:	0b0b      	lsrs	r3, r1, #12
    3f80:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    3f84:	f103 026e 	add.w	r2, r3, #110	@ 0x6e
    3f88:	00c3      	lsls	r3, r0, #3
    3f8a:	e7a6      	b.n	3eda <_free_r+0xce>
    3f8c:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    3f90:	f103 025b 	add.w	r2, r3, #91	@ 0x5b
    3f94:	00c3      	lsls	r3, r0, #3
    3f96:	e7a0      	b.n	3eda <_free_r+0xce>
    3f98:	f041 0301 	orr.w	r3, r1, #1
    3f9c:	e9c7 5504 	strd	r5, r5, [r7, #16]
    3fa0:	e9c5 cc02 	strd	ip, ip, [r5, #8]
    3fa4:	606b      	str	r3, [r5, #4]
    3fa6:	5069      	str	r1, [r5, r1]
    3fa8:	e77b      	b.n	3ea2 <_free_r+0x96>
    3faa:	6879      	ldr	r1, [r7, #4]
    3fac:	1092      	asrs	r2, r2, #2
    3fae:	2401      	movs	r4, #1
    3fb0:	fa04 f202 	lsl.w	r2, r4, r2
    3fb4:	430a      	orrs	r2, r1
    3fb6:	607a      	str	r2, [r7, #4]
    3fb8:	e79e      	b.n	3ef8 <_free_r+0xec>
    3fba:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    3fbe:	d806      	bhi.n	3fce <_free_r+0x1c2>
    3fc0:	0bcb      	lsrs	r3, r1, #15
    3fc2:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    3fc6:	f103 0277 	add.w	r2, r3, #119	@ 0x77
    3fca:	00c3      	lsls	r3, r0, #3
    3fcc:	e785      	b.n	3eda <_free_r+0xce>
    3fce:	f240 5254 	movw	r2, #1364	@ 0x554
    3fd2:	4293      	cmp	r3, r2
    3fd4:	d806      	bhi.n	3fe4 <_free_r+0x1d8>
    3fd6:	0c8b      	lsrs	r3, r1, #18
    3fd8:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    3fdc:	f103 027c 	add.w	r2, r3, #124	@ 0x7c
    3fe0:	00c3      	lsls	r3, r0, #3
    3fe2:	e77a      	b.n	3eda <_free_r+0xce>
    3fe4:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    3fe8:	227e      	movs	r2, #126	@ 0x7e
    3fea:	e776      	b.n	3eda <_free_r+0xce>
    3fec:	f041 0301 	orr.w	r3, r1, #1
    3ff0:	606b      	str	r3, [r5, #4]
    3ff2:	6001      	str	r1, [r0, #0]
    3ff4:	e755      	b.n	3ea2 <_free_r+0x96>
    3ff6:	bf00      	nop
    3ff8:	00004aa8 	.word	0x00004aa8
    3ffc:	00004eb4 	.word	0x00004eb4
    4000:	00004f08 	.word	0x00004f08

00004004 <__call_exitprocs>:
    4004:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4008:	4f29      	ldr	r7, [pc, #164]	@ (40b0 <__call_exitprocs+0xac>)
    400a:	b083      	sub	sp, #12
    400c:	683e      	ldr	r6, [r7, #0]
    400e:	9001      	str	r0, [sp, #4]
    4010:	b35e      	cbz	r6, 406a <__call_exitprocs+0x66>
    4012:	468b      	mov	fp, r1
    4014:	f04f 0900 	mov.w	r9, #0
    4018:	f04f 0801 	mov.w	r8, #1
    401c:	6874      	ldr	r4, [r6, #4]
    401e:	1e65      	subs	r5, r4, #1
    4020:	d423      	bmi.n	406a <__call_exitprocs+0x66>
    4022:	3401      	adds	r4, #1
    4024:	eb06 0484 	add.w	r4, r6, r4, lsl #2
    4028:	f1bb 0f00 	cmp.w	fp, #0
    402c:	d120      	bne.n	4070 <__call_exitprocs+0x6c>
    402e:	6873      	ldr	r3, [r6, #4]
    4030:	6822      	ldr	r2, [r4, #0]
    4032:	3b01      	subs	r3, #1
    4034:	42ab      	cmp	r3, r5
    4036:	bf0c      	ite	eq
    4038:	6075      	streq	r5, [r6, #4]
    403a:	f8c4 9000 	strne.w	r9, [r4]
    403e:	b17a      	cbz	r2, 4060 <__call_exitprocs+0x5c>
    4040:	f8d6 1188 	ldr.w	r1, [r6, #392]	@ 0x188
    4044:	f8d6 a004 	ldr.w	sl, [r6, #4]
    4048:	fa08 fc05 	lsl.w	ip, r8, r5
    404c:	ea1c 0f01 	tst.w	ip, r1
    4050:	d11a      	bne.n	4088 <__call_exitprocs+0x84>
    4052:	4790      	blx	r2
    4054:	6871      	ldr	r1, [r6, #4]
    4056:	683a      	ldr	r2, [r7, #0]
    4058:	4551      	cmp	r1, sl
    405a:	d122      	bne.n	40a2 <__call_exitprocs+0x9e>
    405c:	42b2      	cmp	r2, r6
    405e:	d120      	bne.n	40a2 <__call_exitprocs+0x9e>
    4060:	3d01      	subs	r5, #1
    4062:	1c6b      	adds	r3, r5, #1
    4064:	f1a4 0404 	sub.w	r4, r4, #4
    4068:	d1de      	bne.n	4028 <__call_exitprocs+0x24>
    406a:	b003      	add	sp, #12
    406c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4070:	f8d4 3100 	ldr.w	r3, [r4, #256]	@ 0x100
    4074:	455b      	cmp	r3, fp
    4076:	d0da      	beq.n	402e <__call_exitprocs+0x2a>
    4078:	3d01      	subs	r5, #1
    407a:	1c6a      	adds	r2, r5, #1
    407c:	f1a4 0404 	sub.w	r4, r4, #4
    4080:	d1f6      	bne.n	4070 <__call_exitprocs+0x6c>
    4082:	b003      	add	sp, #12
    4084:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4088:	f8d6 318c 	ldr.w	r3, [r6, #396]	@ 0x18c
    408c:	f8d4 1080 	ldr.w	r1, [r4, #128]	@ 0x80
    4090:	ea1c 0f03 	tst.w	ip, r3
    4094:	d109      	bne.n	40aa <__call_exitprocs+0xa6>
    4096:	9801      	ldr	r0, [sp, #4]
    4098:	4790      	blx	r2
    409a:	6871      	ldr	r1, [r6, #4]
    409c:	683a      	ldr	r2, [r7, #0]
    409e:	4551      	cmp	r1, sl
    40a0:	d0dc      	beq.n	405c <__call_exitprocs+0x58>
    40a2:	2a00      	cmp	r2, #0
    40a4:	d0e1      	beq.n	406a <__call_exitprocs+0x66>
    40a6:	4616      	mov	r6, r2
    40a8:	e7b8      	b.n	401c <__call_exitprocs+0x18>
    40aa:	4608      	mov	r0, r1
    40ac:	4790      	blx	r2
    40ae:	e7d1      	b.n	4054 <__call_exitprocs+0x50>
    40b0:	00004f3c 	.word	0x00004f3c

000040b4 <register_fini>:
    40b4:	4b02      	ldr	r3, [pc, #8]	@ (40c0 <register_fini+0xc>)
    40b6:	b113      	cbz	r3, 40be <register_fini+0xa>
    40b8:	4802      	ldr	r0, [pc, #8]	@ (40c4 <register_fini+0x10>)
    40ba:	f7ff ba2f 	b.w	351c <atexit>
    40be:	4770      	bx	lr
    40c0:	00000000 	.word	0x00000000
    40c4:	000037a9 	.word	0x000037a9

000040c8 <sysconf>:
    40c8:	2808      	cmp	r0, #8
    40ca:	d102      	bne.n	40d2 <sysconf+0xa>
    40cc:	f44f 5080 	mov.w	r0, #4096	@ 0x1000
    40d0:	4770      	bx	lr
    40d2:	b508      	push	{r3, lr}
    40d4:	f000 f982 	bl	43dc <__errno>
    40d8:	2316      	movs	r3, #22
    40da:	6003      	str	r3, [r0, #0]
    40dc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    40e0:	bd08      	pop	{r3, pc}
    40e2:	bf00      	nop

000040e4 <__register_exitproc>:
    40e4:	b470      	push	{r4, r5, r6}
    40e6:	4d16      	ldr	r5, [pc, #88]	@ (4140 <__register_exitproc+0x5c>)
    40e8:	682c      	ldr	r4, [r5, #0]
    40ea:	b31c      	cbz	r4, 4134 <__register_exitproc+0x50>
    40ec:	6865      	ldr	r5, [r4, #4]
    40ee:	2d1f      	cmp	r5, #31
    40f0:	dc23      	bgt.n	413a <__register_exitproc+0x56>
    40f2:	b938      	cbnz	r0, 4104 <__register_exitproc+0x20>
    40f4:	1cab      	adds	r3, r5, #2
    40f6:	3501      	adds	r5, #1
    40f8:	6065      	str	r5, [r4, #4]
    40fa:	f844 1023 	str.w	r1, [r4, r3, lsl #2]
    40fe:	2000      	movs	r0, #0
    4100:	bc70      	pop	{r4, r5, r6}
    4102:	4770      	bx	lr
    4104:	eb04 0c85 	add.w	ip, r4, r5, lsl #2
    4108:	2802      	cmp	r0, #2
    410a:	f8cc 2088 	str.w	r2, [ip, #136]	@ 0x88
    410e:	f8d4 6188 	ldr.w	r6, [r4, #392]	@ 0x188
    4112:	f04f 0201 	mov.w	r2, #1
    4116:	fa02 f205 	lsl.w	r2, r2, r5
    411a:	ea46 0602 	orr.w	r6, r6, r2
    411e:	f8c4 6188 	str.w	r6, [r4, #392]	@ 0x188
    4122:	f8cc 3108 	str.w	r3, [ip, #264]	@ 0x108
    4126:	d1e5      	bne.n	40f4 <__register_exitproc+0x10>
    4128:	f8d4 318c 	ldr.w	r3, [r4, #396]	@ 0x18c
    412c:	4313      	orrs	r3, r2
    412e:	f8c4 318c 	str.w	r3, [r4, #396]	@ 0x18c
    4132:	e7df      	b.n	40f4 <__register_exitproc+0x10>
    4134:	4c03      	ldr	r4, [pc, #12]	@ (4144 <__register_exitproc+0x60>)
    4136:	602c      	str	r4, [r5, #0]
    4138:	e7d8      	b.n	40ec <__register_exitproc+0x8>
    413a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    413e:	e7df      	b.n	4100 <__register_exitproc+0x1c>
    4140:	00004f3c 	.word	0x00004f3c
    4144:	00004f40 	.word	0x00004f40

00004148 <__malloc_lock>:
    4148:	4770      	bx	lr
    414a:	bf00      	nop

0000414c <__malloc_unlock>:
    414c:	4770      	bx	lr
    414e:	bf00      	nop

00004150 <__fp_lock>:
    4150:	2000      	movs	r0, #0
    4152:	4770      	bx	lr

00004154 <stdio_exit_handler>:
    4154:	4a02      	ldr	r2, [pc, #8]	@ (4160 <stdio_exit_handler+0xc>)
    4156:	4903      	ldr	r1, [pc, #12]	@ (4164 <stdio_exit_handler+0x10>)
    4158:	4803      	ldr	r0, [pc, #12]	@ (4168 <stdio_exit_handler+0x14>)
    415a:	f000 b91d 	b.w	4398 <_fwalk_sglue>
    415e:	bf00      	nop
    4160:	00004eb8 	.word	0x00004eb8
    4164:	000043e9 	.word	0x000043e9
    4168:	00004988 	.word	0x00004988

0000416c <cleanup_stdio>:
    416c:	4b0c      	ldr	r3, [pc, #48]	@ (41a0 <cleanup_stdio+0x34>)
    416e:	6841      	ldr	r1, [r0, #4]
    4170:	4299      	cmp	r1, r3
    4172:	b510      	push	{r4, lr}
    4174:	4604      	mov	r4, r0
    4176:	d001      	beq.n	417c <cleanup_stdio+0x10>
    4178:	f000 f936 	bl	43e8 <_fclose_r>
    417c:	68a1      	ldr	r1, [r4, #8]
    417e:	4b09      	ldr	r3, [pc, #36]	@ (41a4 <cleanup_stdio+0x38>)
    4180:	4299      	cmp	r1, r3
    4182:	d002      	beq.n	418a <cleanup_stdio+0x1e>
    4184:	4620      	mov	r0, r4
    4186:	f000 f92f 	bl	43e8 <_fclose_r>
    418a:	68e1      	ldr	r1, [r4, #12]
    418c:	4b06      	ldr	r3, [pc, #24]	@ (41a8 <cleanup_stdio+0x3c>)
    418e:	4299      	cmp	r1, r3
    4190:	d004      	beq.n	419c <cleanup_stdio+0x30>
    4192:	4620      	mov	r0, r4
    4194:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    4198:	f000 b926 	b.w	43e8 <_fclose_r>
    419c:	bd10      	pop	{r4, pc}
    419e:	bf00      	nop
    41a0:	000050d0 	.word	0x000050d0
    41a4:	00005138 	.word	0x00005138
    41a8:	000051a0 	.word	0x000051a0

000041ac <__fp_unlock>:
    41ac:	2000      	movs	r0, #0
    41ae:	4770      	bx	lr

000041b0 <global_stdio_init.part.0>:
    41b0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    41b4:	4c2a      	ldr	r4, [pc, #168]	@ (4260 <global_stdio_init.part.0+0xb0>)
    41b6:	492b      	ldr	r1, [pc, #172]	@ (4264 <global_stdio_init.part.0+0xb4>)
    41b8:	f8df 90bc 	ldr.w	r9, [pc, #188]	@ 4278 <global_stdio_init.part.0+0xc8>
    41bc:	f8df 80bc 	ldr.w	r8, [pc, #188]	@ 427c <global_stdio_init.part.0+0xcc>
    41c0:	4f29      	ldr	r7, [pc, #164]	@ (4268 <global_stdio_init.part.0+0xb8>)
    41c2:	f8c4 1138 	str.w	r1, [r4, #312]	@ 0x138
    41c6:	2500      	movs	r5, #0
    41c8:	2304      	movs	r3, #4
    41ca:	2208      	movs	r2, #8
    41cc:	4629      	mov	r1, r5
    41ce:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    41d2:	4e26      	ldr	r6, [pc, #152]	@ (426c <global_stdio_init.part.0+0xbc>)
    41d4:	60e3      	str	r3, [r4, #12]
    41d6:	e9c4 5500 	strd	r5, r5, [r4]
    41da:	e9c4 5504 	strd	r5, r5, [r4, #16]
    41de:	60a5      	str	r5, [r4, #8]
    41e0:	6665      	str	r5, [r4, #100]	@ 0x64
    41e2:	61a5      	str	r5, [r4, #24]
    41e4:	f7ff f83a 	bl	325c <memset>
    41e8:	4b21      	ldr	r3, [pc, #132]	@ (4270 <global_stdio_init.part.0+0xc0>)
    41ea:	6763      	str	r3, [r4, #116]	@ 0x74
    41ec:	2208      	movs	r2, #8
    41ee:	4629      	mov	r1, r5
    41f0:	f104 00c4 	add.w	r0, r4, #196	@ 0xc4
    41f4:	e9c4 4907 	strd	r4, r9, [r4, #28]
    41f8:	e9c4 8709 	strd	r8, r7, [r4, #36]	@ 0x24
    41fc:	e9c4 551a 	strd	r5, r5, [r4, #104]	@ 0x68
    4200:	e9c4 551e 	strd	r5, r5, [r4, #120]	@ 0x78
    4204:	6725      	str	r5, [r4, #112]	@ 0x70
    4206:	f8c4 50cc 	str.w	r5, [r4, #204]	@ 0xcc
    420a:	f8c4 5080 	str.w	r5, [r4, #128]	@ 0x80
    420e:	62e6      	str	r6, [r4, #44]	@ 0x2c
    4210:	f7ff f824 	bl	325c <memset>
    4214:	4b17      	ldr	r3, [pc, #92]	@ (4274 <global_stdio_init.part.0+0xc4>)
    4216:	f8c4 30dc 	str.w	r3, [r4, #220]	@ 0xdc
    421a:	4629      	mov	r1, r5
    421c:	f104 0368 	add.w	r3, r4, #104	@ 0x68
    4220:	2208      	movs	r2, #8
    4222:	f504 7096 	add.w	r0, r4, #300	@ 0x12c
    4226:	f8c4 3084 	str.w	r3, [r4, #132]	@ 0x84
    422a:	e9c4 9822 	strd	r9, r8, [r4, #136]	@ 0x88
    422e:	e9c4 7624 	strd	r7, r6, [r4, #144]	@ 0x90
    4232:	e9c4 5534 	strd	r5, r5, [r4, #208]	@ 0xd0
    4236:	e9c4 5538 	strd	r5, r5, [r4, #224]	@ 0xe0
    423a:	f8c4 50d8 	str.w	r5, [r4, #216]	@ 0xd8
    423e:	f8c4 5134 	str.w	r5, [r4, #308]	@ 0x134
    4242:	f8c4 50e8 	str.w	r5, [r4, #232]	@ 0xe8
    4246:	f7ff f809 	bl	325c <memset>
    424a:	f104 03d0 	add.w	r3, r4, #208	@ 0xd0
    424e:	e9c4 983c 	strd	r9, r8, [r4, #240]	@ 0xf0
    4252:	e9c4 763e 	strd	r7, r6, [r4, #248]	@ 0xf8
    4256:	f8c4 30ec 	str.w	r3, [r4, #236]	@ 0xec
    425a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    425e:	bf00      	nop
    4260:	000050d0 	.word	0x000050d0
    4264:	00004155 	.word	0x00004155
    4268:	000044e1 	.word	0x000044e1
    426c:	00004505 	.word	0x00004505
    4270:	00010009 	.word	0x00010009
    4274:	00020012 	.word	0x00020012
    4278:	00004479 	.word	0x00004479
    427c:	000044a1 	.word	0x000044a1

00004280 <__sfp>:
    4280:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4282:	4b25      	ldr	r3, [pc, #148]	@ (4318 <__sfp+0x98>)
    4284:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    4288:	4606      	mov	r6, r0
    428a:	2b00      	cmp	r3, #0
    428c:	d03c      	beq.n	4308 <__sfp+0x88>
    428e:	4f23      	ldr	r7, [pc, #140]	@ (431c <__sfp+0x9c>)
    4290:	e9d7 3401 	ldrd	r3, r4, [r7, #4]
    4294:	3b01      	subs	r3, #1
    4296:	d504      	bpl.n	42a2 <__sfp+0x22>
    4298:	e01d      	b.n	42d6 <__sfp+0x56>
    429a:	1c5a      	adds	r2, r3, #1
    429c:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    42a0:	d019      	beq.n	42d6 <__sfp+0x56>
    42a2:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
    42a6:	3b01      	subs	r3, #1
    42a8:	2d00      	cmp	r5, #0
    42aa:	d1f6      	bne.n	429a <__sfp+0x1a>
    42ac:	4b1c      	ldr	r3, [pc, #112]	@ (4320 <__sfp+0xa0>)
    42ae:	60e3      	str	r3, [r4, #12]
    42b0:	e9c4 5501 	strd	r5, r5, [r4, #4]
    42b4:	e9c4 5504 	strd	r5, r5, [r4, #16]
    42b8:	6665      	str	r5, [r4, #100]	@ 0x64
    42ba:	6025      	str	r5, [r4, #0]
    42bc:	61a5      	str	r5, [r4, #24]
    42be:	2208      	movs	r2, #8
    42c0:	4629      	mov	r1, r5
    42c2:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    42c6:	f7fe ffc9 	bl	325c <memset>
    42ca:	e9c4 550c 	strd	r5, r5, [r4, #48]	@ 0x30
    42ce:	e9c4 5511 	strd	r5, r5, [r4, #68]	@ 0x44
    42d2:	4620      	mov	r0, r4
    42d4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    42d6:	683d      	ldr	r5, [r7, #0]
    42d8:	b10d      	cbz	r5, 42de <__sfp+0x5e>
    42da:	462f      	mov	r7, r5
    42dc:	e7d8      	b.n	4290 <__sfp+0x10>
    42de:	f44f 71d6 	mov.w	r1, #428	@ 0x1ac
    42e2:	4630      	mov	r0, r6
    42e4:	f7ff fa8c 	bl	3800 <_malloc_r>
    42e8:	4604      	mov	r4, r0
    42ea:	b180      	cbz	r0, 430e <__sfp+0x8e>
    42ec:	2304      	movs	r3, #4
    42ee:	e9c0 5300 	strd	r5, r3, [r0]
    42f2:	300c      	adds	r0, #12
    42f4:	4629      	mov	r1, r5
    42f6:	60a0      	str	r0, [r4, #8]
    42f8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
    42fc:	4625      	mov	r5, r4
    42fe:	f7fe ffad 	bl	325c <memset>
    4302:	603c      	str	r4, [r7, #0]
    4304:	462f      	mov	r7, r5
    4306:	e7c3      	b.n	4290 <__sfp+0x10>
    4308:	f7ff ff52 	bl	41b0 <global_stdio_init.part.0>
    430c:	e7bf      	b.n	428e <__sfp+0xe>
    430e:	230c      	movs	r3, #12
    4310:	6038      	str	r0, [r7, #0]
    4312:	6033      	str	r3, [r6, #0]
    4314:	e7dd      	b.n	42d2 <__sfp+0x52>
    4316:	bf00      	nop
    4318:	000050d0 	.word	0x000050d0
    431c:	00004eb8 	.word	0x00004eb8
    4320:	ffff0001 	.word	0xffff0001

00004324 <__sinit>:
    4324:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    4326:	b103      	cbz	r3, 432a <__sinit+0x6>
    4328:	4770      	bx	lr
    432a:	4b04      	ldr	r3, [pc, #16]	@ (433c <__sinit+0x18>)
    432c:	4a04      	ldr	r2, [pc, #16]	@ (4340 <__sinit+0x1c>)
    432e:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    4332:	6342      	str	r2, [r0, #52]	@ 0x34
    4334:	2b00      	cmp	r3, #0
    4336:	d1f7      	bne.n	4328 <__sinit+0x4>
    4338:	e73a      	b.n	41b0 <global_stdio_init.part.0>
    433a:	bf00      	nop
    433c:	000050d0 	.word	0x000050d0
    4340:	0000416d 	.word	0x0000416d

00004344 <__sfp_lock_acquire>:
    4344:	4770      	bx	lr
    4346:	bf00      	nop

00004348 <__sfp_lock_release>:
    4348:	4770      	bx	lr
    434a:	bf00      	nop

0000434c <__fp_lock_all>:
    434c:	4a02      	ldr	r2, [pc, #8]	@ (4358 <__fp_lock_all+0xc>)
    434e:	4903      	ldr	r1, [pc, #12]	@ (435c <__fp_lock_all+0x10>)
    4350:	2000      	movs	r0, #0
    4352:	f000 b821 	b.w	4398 <_fwalk_sglue>
    4356:	bf00      	nop
    4358:	00004eb8 	.word	0x00004eb8
    435c:	00004151 	.word	0x00004151

00004360 <__fp_unlock_all>:
    4360:	4a02      	ldr	r2, [pc, #8]	@ (436c <__fp_unlock_all+0xc>)
    4362:	4903      	ldr	r1, [pc, #12]	@ (4370 <__fp_unlock_all+0x10>)
    4364:	2000      	movs	r0, #0
    4366:	f000 b817 	b.w	4398 <_fwalk_sglue>
    436a:	bf00      	nop
    436c:	00004eb8 	.word	0x00004eb8
    4370:	000041ad 	.word	0x000041ad

00004374 <_sbrk_r>:
    4374:	b538      	push	{r3, r4, r5, lr}
    4376:	4d07      	ldr	r5, [pc, #28]	@ (4394 <_sbrk_r+0x20>)
    4378:	2200      	movs	r2, #0
    437a:	4604      	mov	r4, r0
    437c:	4608      	mov	r0, r1
    437e:	602a      	str	r2, [r5, #0]
    4380:	f7fd fe84 	bl	208c <__wrap__sbrk>
    4384:	1c43      	adds	r3, r0, #1
    4386:	d000      	beq.n	438a <_sbrk_r+0x16>
    4388:	bd38      	pop	{r3, r4, r5, pc}
    438a:	682b      	ldr	r3, [r5, #0]
    438c:	2b00      	cmp	r3, #0
    438e:	d0fb      	beq.n	4388 <_sbrk_r+0x14>
    4390:	6023      	str	r3, [r4, #0]
    4392:	bd38      	pop	{r3, r4, r5, pc}
    4394:	00004f04 	.word	0x00004f04

00004398 <_fwalk_sglue>:
    4398:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    439c:	4607      	mov	r7, r0
    439e:	4688      	mov	r8, r1
    43a0:	4616      	mov	r6, r2
    43a2:	f04f 0900 	mov.w	r9, #0
    43a6:	e9d6 5401 	ldrd	r5, r4, [r6, #4]
    43aa:	3d01      	subs	r5, #1
    43ac:	d410      	bmi.n	43d0 <_fwalk_sglue+0x38>
    43ae:	89a3      	ldrh	r3, [r4, #12]
    43b0:	2b01      	cmp	r3, #1
    43b2:	d908      	bls.n	43c6 <_fwalk_sglue+0x2e>
    43b4:	f9b4 300e 	ldrsh.w	r3, [r4, #14]
    43b8:	3301      	adds	r3, #1
    43ba:	4621      	mov	r1, r4
    43bc:	4638      	mov	r0, r7
    43be:	d002      	beq.n	43c6 <_fwalk_sglue+0x2e>
    43c0:	47c0      	blx	r8
    43c2:	ea49 0900 	orr.w	r9, r9, r0
    43c6:	3d01      	subs	r5, #1
    43c8:	1c6b      	adds	r3, r5, #1
    43ca:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    43ce:	d1ee      	bne.n	43ae <_fwalk_sglue+0x16>
    43d0:	6836      	ldr	r6, [r6, #0]
    43d2:	2e00      	cmp	r6, #0
    43d4:	d1e7      	bne.n	43a6 <_fwalk_sglue+0xe>
    43d6:	4648      	mov	r0, r9
    43d8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

000043dc <__errno>:
    43dc:	4b01      	ldr	r3, [pc, #4]	@ (43e4 <__errno+0x8>)
    43de:	6818      	ldr	r0, [r3, #0]
    43e0:	4770      	bx	lr
    43e2:	bf00      	nop
    43e4:	00004980 	.word	0x00004980

000043e8 <_fclose_r>:
    43e8:	b570      	push	{r4, r5, r6, lr}
    43ea:	b139      	cbz	r1, 43fc <_fclose_r+0x14>
    43ec:	4606      	mov	r6, r0
    43ee:	460c      	mov	r4, r1
    43f0:	b108      	cbz	r0, 43f6 <_fclose_r+0xe>
    43f2:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    43f4:	b383      	cbz	r3, 4458 <_fclose_r+0x70>
    43f6:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    43fa:	b913      	cbnz	r3, 4402 <_fclose_r+0x1a>
    43fc:	2500      	movs	r5, #0
    43fe:	4628      	mov	r0, r5
    4400:	bd70      	pop	{r4, r5, r6, pc}
    4402:	4621      	mov	r1, r4
    4404:	4630      	mov	r0, r6
    4406:	f000 f8a9 	bl	455c <__sflush_r>
    440a:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
    440c:	4605      	mov	r5, r0
    440e:	b133      	cbz	r3, 441e <_fclose_r+0x36>
    4410:	69e1      	ldr	r1, [r4, #28]
    4412:	4630      	mov	r0, r6
    4414:	4798      	blx	r3
    4416:	2800      	cmp	r0, #0
    4418:	bfb8      	it	lt
    441a:	f04f 35ff 	movlt.w	r5, #4294967295	@ 0xffffffff
    441e:	89a3      	ldrh	r3, [r4, #12]
    4420:	061b      	lsls	r3, r3, #24
    4422:	d41c      	bmi.n	445e <_fclose_r+0x76>
    4424:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    4426:	b141      	cbz	r1, 443a <_fclose_r+0x52>
    4428:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    442c:	4299      	cmp	r1, r3
    442e:	d002      	beq.n	4436 <_fclose_r+0x4e>
    4430:	4630      	mov	r0, r6
    4432:	f7ff fceb 	bl	3e0c <_free_r>
    4436:	2300      	movs	r3, #0
    4438:	6323      	str	r3, [r4, #48]	@ 0x30
    443a:	6c61      	ldr	r1, [r4, #68]	@ 0x44
    443c:	b121      	cbz	r1, 4448 <_fclose_r+0x60>
    443e:	4630      	mov	r0, r6
    4440:	f7ff fce4 	bl	3e0c <_free_r>
    4444:	2300      	movs	r3, #0
    4446:	6463      	str	r3, [r4, #68]	@ 0x44
    4448:	f7ff ff7c 	bl	4344 <__sfp_lock_acquire>
    444c:	2300      	movs	r3, #0
    444e:	81a3      	strh	r3, [r4, #12]
    4450:	f7ff ff7a 	bl	4348 <__sfp_lock_release>
    4454:	4628      	mov	r0, r5
    4456:	bd70      	pop	{r4, r5, r6, pc}
    4458:	f7ff ff64 	bl	4324 <__sinit>
    445c:	e7cb      	b.n	43f6 <_fclose_r+0xe>
    445e:	6921      	ldr	r1, [r4, #16]
    4460:	4630      	mov	r0, r6
    4462:	f7ff fcd3 	bl	3e0c <_free_r>
    4466:	e7dd      	b.n	4424 <_fclose_r+0x3c>

00004468 <fclose>:
    4468:	4b02      	ldr	r3, [pc, #8]	@ (4474 <fclose+0xc>)
    446a:	4601      	mov	r1, r0
    446c:	6818      	ldr	r0, [r3, #0]
    446e:	f7ff bfbb 	b.w	43e8 <_fclose_r>
    4472:	bf00      	nop
    4474:	00004980 	.word	0x00004980

00004478 <__sread>:
    4478:	b510      	push	{r4, lr}
    447a:	460c      	mov	r4, r1
    447c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4480:	f000 f942 	bl	4708 <_read_r>
    4484:	2800      	cmp	r0, #0
    4486:	db03      	blt.n	4490 <__sread+0x18>
    4488:	6d23      	ldr	r3, [r4, #80]	@ 0x50
    448a:	4403      	add	r3, r0
    448c:	6523      	str	r3, [r4, #80]	@ 0x50
    448e:	bd10      	pop	{r4, pc}
    4490:	89a3      	ldrh	r3, [r4, #12]
    4492:	f423 5380 	bic.w	r3, r3, #4096	@ 0x1000
    4496:	81a3      	strh	r3, [r4, #12]
    4498:	bd10      	pop	{r4, pc}
    449a:	bf00      	nop

0000449c <__seofread>:
    449c:	2000      	movs	r0, #0
    449e:	4770      	bx	lr

000044a0 <__swrite>:
    44a0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    44a4:	460c      	mov	r4, r1
    44a6:	f9b1 100c 	ldrsh.w	r1, [r1, #12]
    44aa:	461f      	mov	r7, r3
    44ac:	05cb      	lsls	r3, r1, #23
    44ae:	4605      	mov	r5, r0
    44b0:	4616      	mov	r6, r2
    44b2:	d40b      	bmi.n	44cc <__swrite+0x2c>
    44b4:	f421 5180 	bic.w	r1, r1, #4096	@ 0x1000
    44b8:	81a1      	strh	r1, [r4, #12]
    44ba:	463b      	mov	r3, r7
    44bc:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    44c0:	4632      	mov	r2, r6
    44c2:	4628      	mov	r0, r5
    44c4:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    44c8:	f000 b820 	b.w	450c <_write_r>
    44cc:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    44d0:	2302      	movs	r3, #2
    44d2:	2200      	movs	r2, #0
    44d4:	f000 f92e 	bl	4734 <_lseek_r>
    44d8:	f9b4 100c 	ldrsh.w	r1, [r4, #12]
    44dc:	e7ea      	b.n	44b4 <__swrite+0x14>
    44de:	bf00      	nop

000044e0 <__sseek>:
    44e0:	b510      	push	{r4, lr}
    44e2:	460c      	mov	r4, r1
    44e4:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    44e8:	f000 f924 	bl	4734 <_lseek_r>
    44ec:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    44f0:	1c42      	adds	r2, r0, #1
    44f2:	bf0e      	itee	eq
    44f4:	f423 5380 	biceq.w	r3, r3, #4096	@ 0x1000
    44f8:	f443 5380 	orrne.w	r3, r3, #4096	@ 0x1000
    44fc:	6520      	strne	r0, [r4, #80]	@ 0x50
    44fe:	81a3      	strh	r3, [r4, #12]
    4500:	bd10      	pop	{r4, pc}
    4502:	bf00      	nop

00004504 <__sclose>:
    4504:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4508:	f000 b816 	b.w	4538 <_close_r>

0000450c <_write_r>:
    450c:	b538      	push	{r3, r4, r5, lr}
    450e:	460c      	mov	r4, r1
    4510:	4d08      	ldr	r5, [pc, #32]	@ (4534 <_write_r+0x28>)
    4512:	4684      	mov	ip, r0
    4514:	4611      	mov	r1, r2
    4516:	4620      	mov	r0, r4
    4518:	461a      	mov	r2, r3
    451a:	2300      	movs	r3, #0
    451c:	602b      	str	r3, [r5, #0]
    451e:	4664      	mov	r4, ip
    4520:	f7fd feaa 	bl	2278 <__wrap__write>
    4524:	1c43      	adds	r3, r0, #1
    4526:	d000      	beq.n	452a <_write_r+0x1e>
    4528:	bd38      	pop	{r3, r4, r5, pc}
    452a:	682b      	ldr	r3, [r5, #0]
    452c:	2b00      	cmp	r3, #0
    452e:	d0fb      	beq.n	4528 <_write_r+0x1c>
    4530:	6023      	str	r3, [r4, #0]
    4532:	bd38      	pop	{r3, r4, r5, pc}
    4534:	00004f04 	.word	0x00004f04

00004538 <_close_r>:
    4538:	b538      	push	{r3, r4, r5, lr}
    453a:	4d07      	ldr	r5, [pc, #28]	@ (4558 <_close_r+0x20>)
    453c:	2200      	movs	r2, #0
    453e:	4604      	mov	r4, r0
    4540:	4608      	mov	r0, r1
    4542:	602a      	str	r2, [r5, #0]
    4544:	f7fd fe1c 	bl	2180 <__wrap__close>
    4548:	1c43      	adds	r3, r0, #1
    454a:	d000      	beq.n	454e <_close_r+0x16>
    454c:	bd38      	pop	{r3, r4, r5, pc}
    454e:	682b      	ldr	r3, [r5, #0]
    4550:	2b00      	cmp	r3, #0
    4552:	d0fb      	beq.n	454c <_close_r+0x14>
    4554:	6023      	str	r3, [r4, #0]
    4556:	bd38      	pop	{r3, r4, r5, pc}
    4558:	00004f04 	.word	0x00004f04

0000455c <__sflush_r>:
    455c:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    4560:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4564:	0716      	lsls	r6, r2, #28
    4566:	460c      	mov	r4, r1
    4568:	4680      	mov	r8, r0
    456a:	d44e      	bmi.n	460a <__sflush_r+0xae>
    456c:	6849      	ldr	r1, [r1, #4]
    456e:	f442 6300 	orr.w	r3, r2, #2048	@ 0x800
    4572:	2900      	cmp	r1, #0
    4574:	81a3      	strh	r3, [r4, #12]
    4576:	dd63      	ble.n	4640 <__sflush_r+0xe4>
    4578:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    457a:	2d00      	cmp	r5, #0
    457c:	d042      	beq.n	4604 <__sflush_r+0xa8>
    457e:	2100      	movs	r1, #0
    4580:	f412 5280 	ands.w	r2, r2, #4096	@ 0x1000
    4584:	f8d8 6000 	ldr.w	r6, [r8]
    4588:	f8c8 1000 	str.w	r1, [r8]
    458c:	69e1      	ldr	r1, [r4, #28]
    458e:	d164      	bne.n	465a <__sflush_r+0xfe>
    4590:	2301      	movs	r3, #1
    4592:	4640      	mov	r0, r8
    4594:	47a8      	blx	r5
    4596:	1c45      	adds	r5, r0, #1
    4598:	4602      	mov	r2, r0
    459a:	d06e      	beq.n	467a <__sflush_r+0x11e>
    459c:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    45a0:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    45a2:	69e1      	ldr	r1, [r4, #28]
    45a4:	0758      	lsls	r0, r3, #29
    45a6:	d505      	bpl.n	45b4 <__sflush_r+0x58>
    45a8:	6863      	ldr	r3, [r4, #4]
    45aa:	1ad2      	subs	r2, r2, r3
    45ac:	6b23      	ldr	r3, [r4, #48]	@ 0x30
    45ae:	b10b      	cbz	r3, 45b4 <__sflush_r+0x58>
    45b0:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
    45b2:	1ad2      	subs	r2, r2, r3
    45b4:	2300      	movs	r3, #0
    45b6:	4640      	mov	r0, r8
    45b8:	47a8      	blx	r5
    45ba:	1c43      	adds	r3, r0, #1
    45bc:	d14f      	bne.n	465e <__sflush_r+0x102>
    45be:	f8d8 1000 	ldr.w	r1, [r8]
    45c2:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    45c6:	291d      	cmp	r1, #29
    45c8:	d840      	bhi.n	464c <__sflush_r+0xf0>
    45ca:	4a31      	ldr	r2, [pc, #196]	@ (4690 <__sflush_r+0x134>)
    45cc:	40ca      	lsrs	r2, r1
    45ce:	07d7      	lsls	r7, r2, #31
    45d0:	d53c      	bpl.n	464c <__sflush_r+0xf0>
    45d2:	6922      	ldr	r2, [r4, #16]
    45d4:	6022      	str	r2, [r4, #0]
    45d6:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    45da:	81a2      	strh	r2, [r4, #12]
    45dc:	04dd      	lsls	r5, r3, #19
    45de:	f04f 0200 	mov.w	r2, #0
    45e2:	6062      	str	r2, [r4, #4]
    45e4:	d501      	bpl.n	45ea <__sflush_r+0x8e>
    45e6:	2900      	cmp	r1, #0
    45e8:	d045      	beq.n	4676 <__sflush_r+0x11a>
    45ea:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    45ec:	f8c8 6000 	str.w	r6, [r8]
    45f0:	b141      	cbz	r1, 4604 <__sflush_r+0xa8>
    45f2:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    45f6:	4299      	cmp	r1, r3
    45f8:	d002      	beq.n	4600 <__sflush_r+0xa4>
    45fa:	4640      	mov	r0, r8
    45fc:	f7ff fc06 	bl	3e0c <_free_r>
    4600:	2300      	movs	r3, #0
    4602:	6323      	str	r3, [r4, #48]	@ 0x30
    4604:	2000      	movs	r0, #0
    4606:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    460a:	690e      	ldr	r6, [r1, #16]
    460c:	2e00      	cmp	r6, #0
    460e:	d0f9      	beq.n	4604 <__sflush_r+0xa8>
    4610:	680d      	ldr	r5, [r1, #0]
    4612:	600e      	str	r6, [r1, #0]
    4614:	0792      	lsls	r2, r2, #30
    4616:	bf0c      	ite	eq
    4618:	694b      	ldreq	r3, [r1, #20]
    461a:	2300      	movne	r3, #0
    461c:	1bad      	subs	r5, r5, r6
    461e:	608b      	str	r3, [r1, #8]
    4620:	e00b      	b.n	463a <__sflush_r+0xde>
    4622:	462b      	mov	r3, r5
    4624:	4632      	mov	r2, r6
    4626:	69e1      	ldr	r1, [r4, #28]
    4628:	6a67      	ldr	r7, [r4, #36]	@ 0x24
    462a:	4640      	mov	r0, r8
    462c:	47b8      	blx	r7
    462e:	f1b0 0c00 	subs.w	ip, r0, #0
    4632:	eba5 050c 	sub.w	r5, r5, ip
    4636:	4466      	add	r6, ip
    4638:	dd06      	ble.n	4648 <__sflush_r+0xec>
    463a:	2d00      	cmp	r5, #0
    463c:	dcf1      	bgt.n	4622 <__sflush_r+0xc6>
    463e:	e7e1      	b.n	4604 <__sflush_r+0xa8>
    4640:	6be1      	ldr	r1, [r4, #60]	@ 0x3c
    4642:	2900      	cmp	r1, #0
    4644:	dc98      	bgt.n	4578 <__sflush_r+0x1c>
    4646:	e7dd      	b.n	4604 <__sflush_r+0xa8>
    4648:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    464c:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    4650:	81a3      	strh	r3, [r4, #12]
    4652:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    4656:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    465a:	6d22      	ldr	r2, [r4, #80]	@ 0x50
    465c:	e7a2      	b.n	45a4 <__sflush_r+0x48>
    465e:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4662:	6922      	ldr	r2, [r4, #16]
    4664:	6022      	str	r2, [r4, #0]
    4666:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    466a:	81a2      	strh	r2, [r4, #12]
    466c:	04db      	lsls	r3, r3, #19
    466e:	f04f 0200 	mov.w	r2, #0
    4672:	6062      	str	r2, [r4, #4]
    4674:	d5b9      	bpl.n	45ea <__sflush_r+0x8e>
    4676:	6520      	str	r0, [r4, #80]	@ 0x50
    4678:	e7b7      	b.n	45ea <__sflush_r+0x8e>
    467a:	f8d8 3000 	ldr.w	r3, [r8]
    467e:	2b00      	cmp	r3, #0
    4680:	d08c      	beq.n	459c <__sflush_r+0x40>
    4682:	2b1d      	cmp	r3, #29
    4684:	d001      	beq.n	468a <__sflush_r+0x12e>
    4686:	2b16      	cmp	r3, #22
    4688:	d1de      	bne.n	4648 <__sflush_r+0xec>
    468a:	f8c8 6000 	str.w	r6, [r8]
    468e:	e7b9      	b.n	4604 <__sflush_r+0xa8>
    4690:	20400001 	.word	0x20400001

00004694 <_fflush_r>:
    4694:	b510      	push	{r4, lr}
    4696:	4604      	mov	r4, r0
    4698:	b082      	sub	sp, #8
    469a:	b108      	cbz	r0, 46a0 <_fflush_r+0xc>
    469c:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    469e:	b153      	cbz	r3, 46b6 <_fflush_r+0x22>
    46a0:	f9b1 000c 	ldrsh.w	r0, [r1, #12]
    46a4:	b908      	cbnz	r0, 46aa <_fflush_r+0x16>
    46a6:	b002      	add	sp, #8
    46a8:	bd10      	pop	{r4, pc}
    46aa:	4620      	mov	r0, r4
    46ac:	b002      	add	sp, #8
    46ae:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    46b2:	f7ff bf53 	b.w	455c <__sflush_r>
    46b6:	9101      	str	r1, [sp, #4]
    46b8:	f7ff fe34 	bl	4324 <__sinit>
    46bc:	9901      	ldr	r1, [sp, #4]
    46be:	e7ef      	b.n	46a0 <_fflush_r+0xc>

000046c0 <fflush>:
    46c0:	b1a0      	cbz	r0, 46ec <fflush+0x2c>
    46c2:	b538      	push	{r3, r4, r5, lr}
    46c4:	4b0c      	ldr	r3, [pc, #48]	@ (46f8 <fflush+0x38>)
    46c6:	681d      	ldr	r5, [r3, #0]
    46c8:	4604      	mov	r4, r0
    46ca:	b10d      	cbz	r5, 46d0 <fflush+0x10>
    46cc:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
    46ce:	b14b      	cbz	r3, 46e4 <fflush+0x24>
    46d0:	f9b4 000c 	ldrsh.w	r0, [r4, #12]
    46d4:	b900      	cbnz	r0, 46d8 <fflush+0x18>
    46d6:	bd38      	pop	{r3, r4, r5, pc}
    46d8:	4621      	mov	r1, r4
    46da:	4628      	mov	r0, r5
    46dc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    46e0:	f7ff bf3c 	b.w	455c <__sflush_r>
    46e4:	4628      	mov	r0, r5
    46e6:	f7ff fe1d 	bl	4324 <__sinit>
    46ea:	e7f1      	b.n	46d0 <fflush+0x10>
    46ec:	4a03      	ldr	r2, [pc, #12]	@ (46fc <fflush+0x3c>)
    46ee:	4904      	ldr	r1, [pc, #16]	@ (4700 <fflush+0x40>)
    46f0:	4804      	ldr	r0, [pc, #16]	@ (4704 <fflush+0x44>)
    46f2:	f7ff be51 	b.w	4398 <_fwalk_sglue>
    46f6:	bf00      	nop
    46f8:	00004980 	.word	0x00004980
    46fc:	00004eb8 	.word	0x00004eb8
    4700:	00004695 	.word	0x00004695
    4704:	00004988 	.word	0x00004988

00004708 <_read_r>:
    4708:	b538      	push	{r3, r4, r5, lr}
    470a:	460c      	mov	r4, r1
    470c:	4d08      	ldr	r5, [pc, #32]	@ (4730 <_read_r+0x28>)
    470e:	4684      	mov	ip, r0
    4710:	4611      	mov	r1, r2
    4712:	4620      	mov	r0, r4
    4714:	461a      	mov	r2, r3
    4716:	2300      	movs	r3, #0
    4718:	602b      	str	r3, [r5, #0]
    471a:	4664      	mov	r4, ip
    471c:	f7fd fd98 	bl	2250 <__wrap__read>
    4720:	1c43      	adds	r3, r0, #1
    4722:	d000      	beq.n	4726 <_read_r+0x1e>
    4724:	bd38      	pop	{r3, r4, r5, pc}
    4726:	682b      	ldr	r3, [r5, #0]
    4728:	2b00      	cmp	r3, #0
    472a:	d0fb      	beq.n	4724 <_read_r+0x1c>
    472c:	6023      	str	r3, [r4, #0]
    472e:	bd38      	pop	{r3, r4, r5, pc}
    4730:	00004f04 	.word	0x00004f04

00004734 <_lseek_r>:
    4734:	b538      	push	{r3, r4, r5, lr}
    4736:	460c      	mov	r4, r1
    4738:	4d08      	ldr	r5, [pc, #32]	@ (475c <_lseek_r+0x28>)
    473a:	4684      	mov	ip, r0
    473c:	4611      	mov	r1, r2
    473e:	4620      	mov	r0, r4
    4740:	461a      	mov	r2, r3
    4742:	2300      	movs	r3, #0
    4744:	602b      	str	r3, [r5, #0]
    4746:	4664      	mov	r4, ip
    4748:	f7fd fd6e 	bl	2228 <__wrap__lseek>
    474c:	1c43      	adds	r3, r0, #1
    474e:	d000      	beq.n	4752 <_lseek_r+0x1e>
    4750:	bd38      	pop	{r3, r4, r5, pc}
    4752:	682b      	ldr	r3, [r5, #0]
    4754:	2b00      	cmp	r3, #0
    4756:	d0fb      	beq.n	4750 <_lseek_r+0x1c>
    4758:	6023      	str	r3, [r4, #0]
    475a:	bd38      	pop	{r3, r4, r5, pc}
    475c:	00004f04 	.word	0x00004f04

00004760 <_exit>:
    4760:	e7fe      	b.n	4760 <_exit>
    4762:	bf00      	nop

00004764 <_init>:
    4764:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4766:	bf00      	nop
    4768:	bcf8      	pop	{r3, r4, r5, r6, r7}
    476a:	bc08      	pop	{r3}
    476c:	469e      	mov	lr, r3
    476e:	4770      	bx	lr

00004770 <_fini>:
    4770:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4772:	bf00      	nop
    4774:	bcf8      	pop	{r3, r4, r5, r6, r7}
    4776:	bc08      	pop	{r3}
    4778:	469e      	mov	lr, r3
    477a:	4770      	bx	lr

0000477c <all_implied_fbits>:
    477c:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    478c:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    479c:	410b 0000                                   .A..

000047a0 <REPORT_EXCEPTION>:
    47a0:	0018 0000                                   ....

000047a4 <ApplicationExit>:
    47a4:	0026 0002 4d4e 5f49 6148 646e 656c 0072     &...NMI_Handler.
    47b4:	6148 6472 6146 6c75 5f74 6148 646e 656c     HardFault_Handle
    47c4:	0072 0000 654d 4d6d 6e61 6761 5f65 6148     r...MemManage_Ha
    47d4:	646e 656c 0072 0000 7542 4673 7561 746c     ndler...BusFault
    47e4:	485f 6e61 6c64 7265 0000 0000 7355 6761     _Handler....Usag
    47f4:	4665 7561 746c 485f 6e61 6c64 7265 0000     eFault_Handler..
    4804:	5653 5f43 6148 646e 656c 0072 6544 7562     SVC_Handler.Debu
    4814:	4d67 6e6f 485f 6e61 6c64 7265 0000 0000     gMon_Handler....
    4824:	6550 646e 5653 485f 6e61 6c64 7265 0000     PendSV_Handler..

00004834 <stackpattern>:
    4834:	beef dead                                   ....

00004838 <all_implied_fbits>:
    4838:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    4848:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    4858:	410b 0000                                   .A..

0000485c <__EH_FRAME_BEGIN__>:
    485c:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
    486c:	0c1b 000d 0014 0000 0018 0000 ea98 ffff     ................
    487c:	0134 0000 0200 0a71 0b43 0000               4.....q.C...

00004888 <__FRAME_END__>:
    4888:	0000 0000                                   ....
