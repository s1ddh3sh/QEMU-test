
build/tests_dilithium/pqcrystals_dilithium2_ref_signature_internal/loopOrFuncSkip/pqcrystals_dilithium2_ref_signature_internal_fnSkip_pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery_line52.elf:     file format elf32-littlearm


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
      d0:	00005a10 	.word	0x00005a10
      d4:	00005a10 	.word	0x00005a10
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
      f4:	00005a10 	.word	0x00005a10
      f8:	00005a10 	.word	0x00005a10
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
     11c:	00005a10 	.word	0x00005a10
     120:	00000000 	.word	0x00000000
     124:	0000539c 	.word	0x0000539c

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
     140:	00005a14 	.word	0x00005a14
     144:	0000539c 	.word	0x0000539c

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
     16a:	f003 fbb5 	bl	38d8 <memset>
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
     188:	f003 fd06 	bl	3b98 <atexit>
     18c:	f003 fcce 	bl	3b2c <__libc_init_array>
     190:	0020      	movs	r0, r4
     192:	0029      	movs	r1, r5
     194:	f002 f850 	bl	2238 <main>
     198:	f003 fcf0 	bl	3b7c <exit>
     19c:	00080000 	.word	0x00080000
	...
     1a8:	20400000 	.word	0x20400000
     1ac:	00005a10 	.word	0x00005a10
     1b0:	00005d48 	.word	0x00005d48
     1b4:	00003e25 	.word	0x00003e25

000001b8 <pqcrystals_dilithium2_ref_signature_internal>:
     1b8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     1bc:	f5ad 4d45 	sub.w	sp, sp, #50432	@ 0xc500
     1c0:	b0bd      	sub	sp, #244	@ 0xf4
     1c2:	f50d 4e40 	add.w	lr, sp, #49152	@ 0xc000
     1c6:	4680      	mov	r8, r0
     1c8:	f8de 0624 	ldr.w	r0, [lr, #1572]	@ 0x624
     1cc:	f10d 0ef4 	add.w	lr, sp, #244	@ 0xf4
     1d0:	f50e 4444 	add.w	r4, lr, #50176	@ 0xc400
     1d4:	f10d 0e34 	add.w	lr, sp, #52	@ 0x34
     1d8:	f104 0920 	add.w	r9, r4, #32
     1dc:	f50e 5553 	add.w	r5, lr, #13504	@ 0x34c0
     1e0:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     1e4:	461e      	mov	r6, r3
     1e6:	4617      	mov	r7, r2
     1e8:	9104      	str	r1, [sp, #16]
     1ea:	f104 0260 	add.w	r2, r4, #96	@ 0x60
     1ee:	f50e 4ae9 	add.w	sl, lr, #29824	@ 0x7480
     1f2:	9002      	str	r0, [sp, #8]
     1f4:	f50e 4389 	add.w	r3, lr, #17536	@ 0x4480
     1f8:	4620      	mov	r0, r4
     1fa:	4649      	mov	r1, r9
     1fc:	f104 0b80 	add.w	fp, r4, #128	@ 0x80
     200:	f8cd a000 	str.w	sl, [sp]
     204:	9501      	str	r5, [sp, #4]
     206:	f001 ff51 	bl	20ac <pqcrystals_dilithium2_ref_unpack_sk>
     20a:	ad08      	add	r5, sp, #32
     20c:	4628      	mov	r0, r5
     20e:	f001 fedf 	bl	1fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>
     212:	4628      	mov	r0, r5
     214:	4649      	mov	r1, r9
     216:	2240      	movs	r2, #64	@ 0x40
     218:	f001 fee2 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     21c:	f50d 4e40 	add.w	lr, sp, #49152	@ 0xc000
     220:	f8de 1618 	ldr.w	r1, [lr, #1560]	@ 0x618
     224:	f8de 261c 	ldr.w	r2, [lr, #1564]	@ 0x61c
     228:	4628      	mov	r0, r5
     22a:	f001 fed9 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     22e:	4628      	mov	r0, r5
     230:	4639      	mov	r1, r7
     232:	4632      	mov	r2, r6
     234:	f001 fed4 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     238:	4628      	mov	r0, r5
     23a:	f001 fee3 	bl	2004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
     23e:	4658      	mov	r0, fp
     240:	2140      	movs	r1, #64	@ 0x40
     242:	462a      	mov	r2, r5
     244:	f001 feec 	bl	2020 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
     248:	4628      	mov	r0, r5
     24a:	f001 fec1 	bl	1fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>
     24e:	4628      	mov	r0, r5
     250:	f104 0160 	add.w	r1, r4, #96	@ 0x60
     254:	2220      	movs	r2, #32
     256:	f001 fec3 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     25a:	f50d 4e40 	add.w	lr, sp, #49152	@ 0xc000
     25e:	f8de 1620 	ldr.w	r1, [lr, #1568]	@ 0x620
     262:	4628      	mov	r0, r5
     264:	2220      	movs	r2, #32
     266:	f001 febb 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     26a:	4628      	mov	r0, r5
     26c:	4659      	mov	r1, fp
     26e:	2240      	movs	r2, #64	@ 0x40
     270:	f8cd b01c 	str.w	fp, [sp, #28]
     274:	f001 feb4 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     278:	4628      	mov	r0, r5
     27a:	f001 fec3 	bl	2004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
     27e:	f104 00c0 	add.w	r0, r4, #192	@ 0xc0
     282:	9006      	str	r0, [sp, #24]
     284:	f104 00c0 	add.w	r0, r4, #192	@ 0xc0
     288:	2140      	movs	r1, #64	@ 0x40
     28a:	462a      	mov	r2, r5
     28c:	f001 fec8 	bl	2020 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
     290:	f10d 0ef4 	add.w	lr, sp, #244	@ 0xf4
     294:	f50e 4004 	add.w	r0, lr, #33792	@ 0x8400
     298:	4621      	mov	r1, r4
     29a:	f000 f8f5 	bl	488 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>
     29e:	4650      	mov	r0, sl
     2a0:	f000 f97a 	bl	598 <pqcrystals_dilithium2_ref_polyvecl_ntt>
     2a4:	f10d 0e34 	add.w	lr, sp, #52	@ 0x34
     2a8:	f50e 5053 	add.w	r0, lr, #13504	@ 0x34c0
     2ac:	f000 f9f4 	bl	698 <pqcrystals_dilithium2_ref_polyveck_ntt>
     2b0:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     2b4:	f50e 4089 	add.w	r0, lr, #17536	@ 0x4480
     2b8:	f000 f9ee 	bl	698 <pqcrystals_dilithium2_ref_polyveck_ntt>
     2bc:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     2c0:	f50e 47c9 	add.w	r7, lr, #25728	@ 0x6480
     2c4:	f50e 4aa9 	add.w	sl, lr, #21632	@ 0x5480
     2c8:	f10d 0e34 	add.w	lr, sp, #52	@ 0x34
     2cc:	f04f 0900 	mov.w	r9, #0
     2d0:	f50e 5613 	add.w	r6, lr, #9408	@ 0x24c0
     2d4:	ac3d      	add	r4, sp, #244	@ 0xf4
     2d6:	bf00      	nop
     2d8:	4648      	mov	r0, r9
     2da:	9906      	ldr	r1, [sp, #24]
     2dc:	b282      	uxth	r2, r0
     2de:	4638      	mov	r0, r7
     2e0:	f109 0901 	add.w	r9, r9, #1
     2e4:	f000 f924 	bl	530 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>
     2e8:	4650      	mov	r0, sl
     2ea:	4639      	mov	r1, r7
     2ec:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
     2f0:	f003 fb4c 	bl	398c <memcpy>
     2f4:	4650      	mov	r0, sl
     2f6:	f000 f94f 	bl	598 <pqcrystals_dilithium2_ref_polyvecl_ntt>
     2fa:	f10d 0ef4 	add.w	lr, sp, #244	@ 0xf4
     2fe:	4630      	mov	r0, r6
     300:	f50e 4104 	add.w	r1, lr, #33792	@ 0x8400
     304:	4652      	mov	r2, sl
     306:	f000 f8df 	bl	4c8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>
     30a:	4630      	mov	r0, r6
     30c:	f000 f984 	bl	618 <pqcrystals_dilithium2_ref_polyveck_reduce>
     310:	4630      	mov	r0, r6
     312:	f000 f9cf 	bl	6b4 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
     316:	4630      	mov	r0, r6
     318:	f000 f98c 	bl	634 <pqcrystals_dilithium2_ref_polyveck_caddq>
     31c:	f10d 0e14 	add.w	lr, sp, #20
     320:	4630      	mov	r0, r6
     322:	f50e 51a7 	add.w	r1, lr, #5344	@ 0x14e0
     326:	4632      	mov	r2, r6
     328:	f000 f9f6 	bl	718 <pqcrystals_dilithium2_ref_polyveck_decompose>
     32c:	4640      	mov	r0, r8
     32e:	4631      	mov	r1, r6
     330:	f000 fa1c 	bl	76c <pqcrystals_dilithium2_ref_polyveck_pack_w1>
     334:	4628      	mov	r0, r5
     336:	f001 fe4b 	bl	1fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>
     33a:	9907      	ldr	r1, [sp, #28]
     33c:	4628      	mov	r0, r5
     33e:	2240      	movs	r2, #64	@ 0x40
     340:	f001 fe4e 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     344:	4628      	mov	r0, r5
     346:	4641      	mov	r1, r8
     348:	f44f 7240 	mov.w	r2, #768	@ 0x300
     34c:	f001 fe48 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     350:	4628      	mov	r0, r5
     352:	f001 fe57 	bl	2004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
     356:	4640      	mov	r0, r8
     358:	2120      	movs	r1, #32
     35a:	462a      	mov	r2, r5
     35c:	f001 fe60 	bl	2020 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
     360:	4620      	mov	r0, r4
     362:	4641      	mov	r1, r8
     364:	f000 fb84 	bl	a70 <pqcrystals_dilithium2_ref_poly_challenge>
     368:	4620      	mov	r0, r4
     36a:	f000 fa4b 	bl	804 <pqcrystals_dilithium2_ref_poly_ntt>
     36e:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     372:	4650      	mov	r0, sl
     374:	4621      	mov	r1, r4
     376:	f50e 42e9 	add.w	r2, lr, #29824	@ 0x7480
     37a:	f000 f929 	bl	5d0 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>
     37e:	4650      	mov	r0, sl
     380:	f000 f918 	bl	5b4 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>
     384:	4650      	mov	r0, sl
     386:	4651      	mov	r1, sl
     388:	463a      	mov	r2, r7
     38a:	f000 f8f3 	bl	574 <pqcrystals_dilithium2_ref_polyvecl_add>
     38e:	4650      	mov	r0, sl
     390:	f000 f8e2 	bl	558 <pqcrystals_dilithium2_ref_polyvecl_reduce>
     394:	f247 30b2 	movw	r0, #29618	@ 0x73b2
     398:	f2c0 0001 	movt	r0, #1
     39c:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
     3a0:	4650      	mov	r0, sl
     3a2:	f000 f927 	bl	5f4 <pqcrystals_dilithium2_ref_polyvecl_chknorm>
     3a6:	2800      	cmp	r0, #0
     3a8:	d196      	bne.n	2d8 <pqcrystals_dilithium2_ref_signature_internal+0x120>
     3aa:	f20d 4bf4 	addw	fp, sp, #1268	@ 0x4f4
     3ae:	f10d 0e34 	add.w	lr, sp, #52	@ 0x34
     3b2:	4658      	mov	r0, fp
     3b4:	4621      	mov	r1, r4
     3b6:	f50e 5253 	add.w	r2, lr, #13504	@ 0x34c0
     3ba:	f000 f989 	bl	6d0 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
     3be:	4658      	mov	r0, fp
     3c0:	f000 f978 	bl	6b4 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
     3c4:	f10d 0e14 	add.w	lr, sp, #20
     3c8:	f8cd 9014 	str.w	r9, [sp, #20]
     3cc:	f50e 59a7 	add.w	r9, lr, #5344	@ 0x14e0
     3d0:	4648      	mov	r0, r9
     3d2:	4649      	mov	r1, r9
     3d4:	465a      	mov	r2, fp
     3d6:	f000 f94d 	bl	674 <pqcrystals_dilithium2_ref_polyveck_sub>
     3da:	4648      	mov	r0, r9
     3dc:	f000 f91c 	bl	618 <pqcrystals_dilithium2_ref_polyveck_reduce>
     3e0:	f247 31b2 	movw	r1, #29618	@ 0x73b2
     3e4:	4648      	mov	r0, r9
     3e6:	f8dd 9014 	ldr.w	r9, [sp, #20]
     3ea:	f2c0 0101 	movt	r1, #1
     3ee:	ad08      	add	r5, sp, #32
     3f0:	ac3d      	add	r4, sp, #244	@ 0xf4
     3f2:	f000 f97f 	bl	6f4 <pqcrystals_dilithium2_ref_polyveck_chknorm>
     3f6:	2800      	cmp	r0, #0
     3f8:	f47f af6e 	bne.w	2d8 <pqcrystals_dilithium2_ref_signature_internal+0x120>
     3fc:	46bb      	mov	fp, r7
     3fe:	f20d 47f4 	addw	r7, sp, #1268	@ 0x4f4
     402:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     406:	4638      	mov	r0, r7
     408:	4621      	mov	r1, r4
     40a:	f50e 4289 	add.w	r2, lr, #17536	@ 0x4480
     40e:	f000 f95f 	bl	6d0 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
     412:	4638      	mov	r0, r7
     414:	f000 f94e 	bl	6b4 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
     418:	4638      	mov	r0, r7
     41a:	f000 f8fd 	bl	618 <pqcrystals_dilithium2_ref_polyveck_reduce>
     41e:	4638      	mov	r0, r7
     420:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
     424:	465f      	mov	r7, fp
     426:	f000 f965 	bl	6f4 <pqcrystals_dilithium2_ref_polyveck_chknorm>
     42a:	2800      	cmp	r0, #0
     42c:	f47f af54 	bne.w	2d8 <pqcrystals_dilithium2_ref_signature_internal+0x120>
     430:	f10d 0e14 	add.w	lr, sp, #20
     434:	f50e 59a7 	add.w	r9, lr, #5344	@ 0x14e0
     438:	f20d 47f4 	addw	r7, sp, #1268	@ 0x4f4
     43c:	4648      	mov	r0, r9
     43e:	4649      	mov	r1, r9
     440:	463a      	mov	r2, r7
     442:	f000 f905 	bl	650 <pqcrystals_dilithium2_ref_polyveck_add>
     446:	4638      	mov	r0, r7
     448:	4649      	mov	r1, r9
     44a:	f8dd 9014 	ldr.w	r9, [sp, #20]
     44e:	4632      	mov	r2, r6
     450:	465f      	mov	r7, fp
     452:	ad08      	add	r5, sp, #32
     454:	ac3d      	add	r4, sp, #244	@ 0xf4
     456:	f000 f971 	bl	73c <pqcrystals_dilithium2_ref_polyveck_make_hint>
     45a:	2850      	cmp	r0, #80	@ 0x50
     45c:	f63f af3c 	bhi.w	2d8 <pqcrystals_dilithium2_ref_signature_internal+0x120>
     460:	f10d 0e74 	add.w	lr, sp, #116	@ 0x74
     464:	f50e 42a9 	add.w	r2, lr, #21632	@ 0x5480
     468:	f20d 43f4 	addw	r3, sp, #1268	@ 0x4f4
     46c:	4640      	mov	r0, r8
     46e:	4641      	mov	r1, r8
     470:	f001 fe6e 	bl	2150 <pqcrystals_dilithium2_ref_pack_sig>
     474:	9a04      	ldr	r2, [sp, #16]
     476:	f640 1174 	movw	r1, #2420	@ 0x974
     47a:	2000      	movs	r0, #0
     47c:	6011      	str	r1, [r2, #0]
     47e:	f50d 4d45 	add.w	sp, sp, #50432	@ 0xc500
     482:	b03d      	add	sp, #244	@ 0xf4
     484:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000488 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>:
     488:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
     48c:	b081      	sub	sp, #4
     48e:	460c      	mov	r4, r1
     490:	4680      	mov	r8, r0
     492:	2700      	movs	r7, #0
     494:	f04f 0900 	mov.w	r9, #0
     498:	2500      	movs	r5, #0
     49a:	4646      	mov	r6, r8
     49c:	197a      	adds	r2, r7, r5
     49e:	4630      	mov	r0, r6
     4a0:	4621      	mov	r1, r4
     4a2:	f000 fa11 	bl	8c8 <pqcrystals_dilithium2_ref_poly_uniform>
     4a6:	3501      	adds	r5, #1
     4a8:	2d04      	cmp	r5, #4
     4aa:	f506 6680 	add.w	r6, r6, #1024	@ 0x400
     4ae:	d1f5      	bne.n	49c <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x14>
     4b0:	f109 0901 	add.w	r9, r9, #1
     4b4:	f507 7780 	add.w	r7, r7, #256	@ 0x100
     4b8:	f1b9 0f04 	cmp.w	r9, #4
     4bc:	f508 5880 	add.w	r8, r8, #4096	@ 0x1000
     4c0:	d1ea      	bne.n	498 <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x10>
     4c2:	b001      	add	sp, #4
     4c4:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

000004c8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>:
     4c8:	b5f0      	push	{r4, r5, r6, r7, lr}
     4ca:	b081      	sub	sp, #4
     4cc:	4614      	mov	r4, r2
     4ce:	460d      	mov	r5, r1
     4d0:	4606      	mov	r6, r0
     4d2:	2700      	movs	r7, #0
     4d4:	19f0      	adds	r0, r6, r7
     4d6:	4629      	mov	r1, r5
     4d8:	4622      	mov	r2, r4
     4da:	f000 f809 	bl	4f0 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>
     4de:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     4e2:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     4e6:	f505 5580 	add.w	r5, r5, #4096	@ 0x1000
     4ea:	d1f3      	bne.n	4d4 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery+0xc>
     4ec:	b001      	add	sp, #4
     4ee:	bdf0      	pop	{r4, r5, r6, r7, pc}

000004f0 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>:
     4f0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     4f4:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
     4f8:	4690      	mov	r8, r2
     4fa:	460d      	mov	r5, r1
     4fc:	4606      	mov	r6, r0
     4fe:	f000 f989 	bl	814 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     502:	f44f 6480 	mov.w	r4, #1024	@ 0x400
     506:	466f      	mov	r7, sp
     508:	1929      	adds	r1, r5, r4
     50a:	eb08 0204 	add.w	r2, r8, r4
     50e:	4638      	mov	r0, r7
     510:	f000 f980 	bl	814 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     514:	4630      	mov	r0, r6
     516:	4631      	mov	r1, r6
     518:	463a      	mov	r2, r7
     51a:	f000 f94f 	bl	7bc <pqcrystals_dilithium2_ref_poly_add>
     51e:	f504 6480 	add.w	r4, r4, #1024	@ 0x400
     522:	f5b4 5f80 	cmp.w	r4, #4096	@ 0x1000
     526:	d1ef      	bne.n	508 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery+0x18>
     528:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
     52c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

00000530 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>:
     530:	b5f0      	push	{r4, r5, r6, r7, lr}
     532:	b081      	sub	sp, #4
     534:	460c      	mov	r4, r1
     536:	4605      	mov	r5, r0
     538:	0096      	lsls	r6, r2, #2
     53a:	2700      	movs	r7, #0
     53c:	19f0      	adds	r0, r6, r7
     53e:	b282      	uxth	r2, r0
     540:	4628      	mov	r0, r5
     542:	4621      	mov	r1, r4
     544:	f000 fa2c 	bl	9a0 <pqcrystals_dilithium2_ref_poly_uniform_gamma1>
     548:	3701      	adds	r7, #1
     54a:	2f04      	cmp	r7, #4
     54c:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     550:	d1f4      	bne.n	53c <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1+0xc>
     552:	b001      	add	sp, #4
     554:	bdf0      	pop	{r4, r5, r6, r7, pc}
     556:	bf00      	nop

00000558 <pqcrystals_dilithium2_ref_polyvecl_reduce>:
     558:	b5b0      	push	{r4, r5, r7, lr}
     55a:	4604      	mov	r4, r0
     55c:	2500      	movs	r5, #0
     55e:	bf00      	nop
     560:	1960      	adds	r0, r4, r5
     562:	f000 f913 	bl	78c <pqcrystals_dilithium2_ref_poly_reduce>
     566:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     56a:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     56e:	d1f7      	bne.n	560 <pqcrystals_dilithium2_ref_polyvecl_reduce+0x8>
     570:	bdb0      	pop	{r4, r5, r7, pc}
     572:	bf00      	nop

00000574 <pqcrystals_dilithium2_ref_polyvecl_add>:
     574:	b5f0      	push	{r4, r5, r6, r7, lr}
     576:	b081      	sub	sp, #4
     578:	4614      	mov	r4, r2
     57a:	460d      	mov	r5, r1
     57c:	4606      	mov	r6, r0
     57e:	2700      	movs	r7, #0
     580:	19f0      	adds	r0, r6, r7
     582:	19e9      	adds	r1, r5, r7
     584:	19e2      	adds	r2, r4, r7
     586:	f000 f919 	bl	7bc <pqcrystals_dilithium2_ref_poly_add>
     58a:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     58e:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     592:	d1f5      	bne.n	580 <pqcrystals_dilithium2_ref_polyvecl_add+0xc>
     594:	b001      	add	sp, #4
     596:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000598 <pqcrystals_dilithium2_ref_polyvecl_ntt>:
     598:	b5b0      	push	{r4, r5, r7, lr}
     59a:	4604      	mov	r4, r0
     59c:	2500      	movs	r5, #0
     59e:	bf00      	nop
     5a0:	1960      	adds	r0, r4, r5
     5a2:	f000 f92f 	bl	804 <pqcrystals_dilithium2_ref_poly_ntt>
     5a6:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     5aa:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     5ae:	d1f7      	bne.n	5a0 <pqcrystals_dilithium2_ref_polyvecl_ntt+0x8>
     5b0:	bdb0      	pop	{r4, r5, r7, pc}
     5b2:	bf00      	nop

000005b4 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>:
     5b4:	b5b0      	push	{r4, r5, r7, lr}
     5b6:	4604      	mov	r4, r0
     5b8:	2500      	movs	r5, #0
     5ba:	bf00      	nop
     5bc:	1960      	adds	r0, r4, r5
     5be:	f000 f925 	bl	80c <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     5c2:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     5c6:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     5ca:	d1f7      	bne.n	5bc <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont+0x8>
     5cc:	bdb0      	pop	{r4, r5, r7, pc}
     5ce:	bf00      	nop

000005d0 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>:
     5d0:	b5f0      	push	{r4, r5, r6, r7, lr}
     5d2:	b081      	sub	sp, #4
     5d4:	4614      	mov	r4, r2
     5d6:	460d      	mov	r5, r1
     5d8:	4606      	mov	r6, r0
     5da:	2700      	movs	r7, #0
     5dc:	19f0      	adds	r0, r6, r7
     5de:	19e2      	adds	r2, r4, r7
     5e0:	4629      	mov	r1, r5
     5e2:	f000 f917 	bl	814 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     5e6:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     5ea:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     5ee:	d1f5      	bne.n	5dc <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery+0xc>
     5f0:	b001      	add	sp, #4
     5f2:	bdf0      	pop	{r4, r5, r6, r7, pc}

000005f4 <pqcrystals_dilithium2_ref_polyvecl_chknorm>:
     5f4:	b570      	push	{r4, r5, r6, lr}
     5f6:	460c      	mov	r4, r1
     5f8:	4605      	mov	r5, r0
     5fa:	2600      	movs	r6, #0
     5fc:	19a8      	adds	r0, r5, r6
     5fe:	4621      	mov	r1, r4
     600:	f000 f948 	bl	894 <pqcrystals_dilithium2_ref_poly_chknorm>
     604:	b930      	cbnz	r0, 614 <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x20>
     606:	f506 6680 	add.w	r6, r6, #1024	@ 0x400
     60a:	f5b6 5f80 	cmp.w	r6, #4096	@ 0x1000
     60e:	d1f5      	bne.n	5fc <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x8>
     610:	2000      	movs	r0, #0
     612:	bd70      	pop	{r4, r5, r6, pc}
     614:	2001      	movs	r0, #1
     616:	bd70      	pop	{r4, r5, r6, pc}

00000618 <pqcrystals_dilithium2_ref_polyveck_reduce>:
     618:	b5b0      	push	{r4, r5, r7, lr}
     61a:	4604      	mov	r4, r0
     61c:	2500      	movs	r5, #0
     61e:	bf00      	nop
     620:	1960      	adds	r0, r4, r5
     622:	f000 f8b3 	bl	78c <pqcrystals_dilithium2_ref_poly_reduce>
     626:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     62a:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     62e:	d1f7      	bne.n	620 <pqcrystals_dilithium2_ref_polyveck_reduce+0x8>
     630:	bdb0      	pop	{r4, r5, r7, pc}
     632:	bf00      	nop

00000634 <pqcrystals_dilithium2_ref_polyveck_caddq>:
     634:	b5b0      	push	{r4, r5, r7, lr}
     636:	4604      	mov	r4, r0
     638:	2500      	movs	r5, #0
     63a:	bf00      	nop
     63c:	1960      	adds	r0, r4, r5
     63e:	f000 f8b1 	bl	7a4 <pqcrystals_dilithium2_ref_poly_caddq>
     642:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     646:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     64a:	d1f7      	bne.n	63c <pqcrystals_dilithium2_ref_polyveck_caddq+0x8>
     64c:	bdb0      	pop	{r4, r5, r7, pc}
     64e:	bf00      	nop

00000650 <pqcrystals_dilithium2_ref_polyveck_add>:
     650:	b5f0      	push	{r4, r5, r6, r7, lr}
     652:	b081      	sub	sp, #4
     654:	4614      	mov	r4, r2
     656:	460d      	mov	r5, r1
     658:	4606      	mov	r6, r0
     65a:	2700      	movs	r7, #0
     65c:	19f0      	adds	r0, r6, r7
     65e:	19e9      	adds	r1, r5, r7
     660:	19e2      	adds	r2, r4, r7
     662:	f000 f8ab 	bl	7bc <pqcrystals_dilithium2_ref_poly_add>
     666:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     66a:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     66e:	d1f5      	bne.n	65c <pqcrystals_dilithium2_ref_polyveck_add+0xc>
     670:	b001      	add	sp, #4
     672:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000674 <pqcrystals_dilithium2_ref_polyveck_sub>:
     674:	b5f0      	push	{r4, r5, r6, r7, lr}
     676:	b081      	sub	sp, #4
     678:	4614      	mov	r4, r2
     67a:	460d      	mov	r5, r1
     67c:	4606      	mov	r6, r0
     67e:	2700      	movs	r7, #0
     680:	19f0      	adds	r0, r6, r7
     682:	19e9      	adds	r1, r5, r7
     684:	19e2      	adds	r2, r4, r7
     686:	f000 f8ab 	bl	7e0 <pqcrystals_dilithium2_ref_poly_sub>
     68a:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     68e:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     692:	d1f5      	bne.n	680 <pqcrystals_dilithium2_ref_polyveck_sub+0xc>
     694:	b001      	add	sp, #4
     696:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000698 <pqcrystals_dilithium2_ref_polyveck_ntt>:
     698:	b5b0      	push	{r4, r5, r7, lr}
     69a:	4604      	mov	r4, r0
     69c:	2500      	movs	r5, #0
     69e:	bf00      	nop
     6a0:	1960      	adds	r0, r4, r5
     6a2:	f000 f8af 	bl	804 <pqcrystals_dilithium2_ref_poly_ntt>
     6a6:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     6aa:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     6ae:	d1f7      	bne.n	6a0 <pqcrystals_dilithium2_ref_polyveck_ntt+0x8>
     6b0:	bdb0      	pop	{r4, r5, r7, pc}
     6b2:	bf00      	nop

000006b4 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>:
     6b4:	b5b0      	push	{r4, r5, r7, lr}
     6b6:	4604      	mov	r4, r0
     6b8:	2500      	movs	r5, #0
     6ba:	bf00      	nop
     6bc:	1960      	adds	r0, r4, r5
     6be:	f000 f8a5 	bl	80c <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     6c2:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
     6c6:	f5b5 5f80 	cmp.w	r5, #4096	@ 0x1000
     6ca:	d1f7      	bne.n	6bc <pqcrystals_dilithium2_ref_polyveck_invntt_tomont+0x8>
     6cc:	bdb0      	pop	{r4, r5, r7, pc}
     6ce:	bf00      	nop

000006d0 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>:
     6d0:	b5f0      	push	{r4, r5, r6, r7, lr}
     6d2:	b081      	sub	sp, #4
     6d4:	4614      	mov	r4, r2
     6d6:	460d      	mov	r5, r1
     6d8:	4606      	mov	r6, r0
     6da:	2700      	movs	r7, #0
     6dc:	19f0      	adds	r0, r6, r7
     6de:	19e2      	adds	r2, r4, r7
     6e0:	4629      	mov	r1, r5
     6e2:	f000 f897 	bl	814 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     6e6:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     6ea:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     6ee:	d1f5      	bne.n	6dc <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery+0xc>
     6f0:	b001      	add	sp, #4
     6f2:	bdf0      	pop	{r4, r5, r6, r7, pc}

000006f4 <pqcrystals_dilithium2_ref_polyveck_chknorm>:
     6f4:	b570      	push	{r4, r5, r6, lr}
     6f6:	460c      	mov	r4, r1
     6f8:	4605      	mov	r5, r0
     6fa:	2600      	movs	r6, #0
     6fc:	19a8      	adds	r0, r5, r6
     6fe:	4621      	mov	r1, r4
     700:	f000 f8c8 	bl	894 <pqcrystals_dilithium2_ref_poly_chknorm>
     704:	b930      	cbnz	r0, 714 <pqcrystals_dilithium2_ref_polyveck_chknorm+0x20>
     706:	f506 6680 	add.w	r6, r6, #1024	@ 0x400
     70a:	f5b6 5f80 	cmp.w	r6, #4096	@ 0x1000
     70e:	d1f5      	bne.n	6fc <pqcrystals_dilithium2_ref_polyveck_chknorm+0x8>
     710:	2000      	movs	r0, #0
     712:	bd70      	pop	{r4, r5, r6, pc}
     714:	2001      	movs	r0, #1
     716:	bd70      	pop	{r4, r5, r6, pc}

00000718 <pqcrystals_dilithium2_ref_polyveck_decompose>:
     718:	b5f0      	push	{r4, r5, r6, r7, lr}
     71a:	b081      	sub	sp, #4
     71c:	4614      	mov	r4, r2
     71e:	460d      	mov	r5, r1
     720:	4606      	mov	r6, r0
     722:	2700      	movs	r7, #0
     724:	19f0      	adds	r0, r6, r7
     726:	19e9      	adds	r1, r5, r7
     728:	19e2      	adds	r2, r4, r7
     72a:	f000 f889 	bl	840 <pqcrystals_dilithium2_ref_poly_decompose>
     72e:	f507 6780 	add.w	r7, r7, #1024	@ 0x400
     732:	f5b7 5f80 	cmp.w	r7, #4096	@ 0x1000
     736:	d1f5      	bne.n	724 <pqcrystals_dilithium2_ref_polyveck_decompose+0xc>
     738:	b001      	add	sp, #4
     73a:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000073c <pqcrystals_dilithium2_ref_polyveck_make_hint>:
     73c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     740:	4690      	mov	r8, r2
     742:	460d      	mov	r5, r1
     744:	4607      	mov	r7, r0
     746:	2600      	movs	r6, #0
     748:	2400      	movs	r4, #0
     74a:	bf00      	nop
     74c:	1938      	adds	r0, r7, r4
     74e:	1929      	adds	r1, r5, r4
     750:	eb08 0204 	add.w	r2, r8, r4
     754:	f000 f886 	bl	864 <pqcrystals_dilithium2_ref_poly_make_hint>
     758:	f504 6480 	add.w	r4, r4, #1024	@ 0x400
     75c:	f5b4 5f80 	cmp.w	r4, #4096	@ 0x1000
     760:	4406      	add	r6, r0
     762:	d1f3      	bne.n	74c <pqcrystals_dilithium2_ref_polyveck_make_hint+0x10>
     764:	4630      	mov	r0, r6
     766:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     76a:	bf00      	nop

0000076c <pqcrystals_dilithium2_ref_polyveck_pack_w1>:
     76c:	b570      	push	{r4, r5, r6, lr}
     76e:	460c      	mov	r4, r1
     770:	4605      	mov	r5, r0
     772:	2600      	movs	r6, #0
     774:	19a8      	adds	r0, r5, r6
     776:	4621      	mov	r1, r4
     778:	f000 fb14 	bl	da4 <pqcrystals_dilithium2_ref_polyw1_pack>
     77c:	36c0      	adds	r6, #192	@ 0xc0
     77e:	f5b6 7f40 	cmp.w	r6, #768	@ 0x300
     782:	f504 6480 	add.w	r4, r4, #1024	@ 0x400
     786:	d1f5      	bne.n	774 <pqcrystals_dilithium2_ref_polyveck_pack_w1+0x8>
     788:	bd70      	pop	{r4, r5, r6, pc}
     78a:	bf00      	nop

0000078c <pqcrystals_dilithium2_ref_poly_reduce>:
     78c:	b5b0      	push	{r4, r5, r7, lr}
     78e:	1f04      	subs	r4, r0, #4
     790:	f44f 7580 	mov.w	r5, #256	@ 0x100
     794:	f854 0f04 	ldr.w	r0, [r4, #4]!
     798:	f000 fbae 	bl	ef8 <pqcrystals_dilithium2_ref_reduce32>
     79c:	3d01      	subs	r5, #1
     79e:	6020      	str	r0, [r4, #0]
     7a0:	d1f8      	bne.n	794 <pqcrystals_dilithium2_ref_poly_reduce+0x8>
     7a2:	bdb0      	pop	{r4, r5, r7, pc}

000007a4 <pqcrystals_dilithium2_ref_poly_caddq>:
     7a4:	b5b0      	push	{r4, r5, r7, lr}
     7a6:	1f04      	subs	r4, r0, #4
     7a8:	f44f 7580 	mov.w	r5, #256	@ 0x100
     7ac:	f854 0f04 	ldr.w	r0, [r4, #4]!
     7b0:	f000 fbac 	bl	f0c <pqcrystals_dilithium2_ref_caddq>
     7b4:	3d01      	subs	r5, #1
     7b6:	6020      	str	r0, [r4, #0]
     7b8:	d1f8      	bne.n	7ac <pqcrystals_dilithium2_ref_poly_caddq+0x8>
     7ba:	bdb0      	pop	{r4, r5, r7, pc}

000007bc <pqcrystals_dilithium2_ref_poly_add>:
     7bc:	b580      	push	{r7, lr}
     7be:	f04f 0e00 	mov.w	lr, #0
     7c2:	bf00      	nop
     7c4:	f851 c02e 	ldr.w	ip, [r1, lr, lsl #2]
     7c8:	f852 302e 	ldr.w	r3, [r2, lr, lsl #2]
     7cc:	4463      	add	r3, ip
     7ce:	f840 302e 	str.w	r3, [r0, lr, lsl #2]
     7d2:	f10e 0e01 	add.w	lr, lr, #1
     7d6:	f5be 7f80 	cmp.w	lr, #256	@ 0x100
     7da:	d1f3      	bne.n	7c4 <pqcrystals_dilithium2_ref_poly_add+0x8>
     7dc:	bd80      	pop	{r7, pc}
     7de:	bf00      	nop

000007e0 <pqcrystals_dilithium2_ref_poly_sub>:
     7e0:	b580      	push	{r7, lr}
     7e2:	f04f 0e00 	mov.w	lr, #0
     7e6:	bf00      	nop
     7e8:	f851 c02e 	ldr.w	ip, [r1, lr, lsl #2]
     7ec:	f852 302e 	ldr.w	r3, [r2, lr, lsl #2]
     7f0:	ebac 0303 	sub.w	r3, ip, r3
     7f4:	f840 302e 	str.w	r3, [r0, lr, lsl #2]
     7f8:	f10e 0e01 	add.w	lr, lr, #1
     7fc:	f5be 7f80 	cmp.w	lr, #256	@ 0x100
     800:	d1f2      	bne.n	7e8 <pqcrystals_dilithium2_ref_poly_sub+0x8>
     802:	bd80      	pop	{r7, pc}

00000804 <pqcrystals_dilithium2_ref_poly_ntt>:
     804:	b580      	push	{r7, lr}
     806:	f000 faf1 	bl	dec <pqcrystals_dilithium2_ref_ntt>
     80a:	bd80      	pop	{r7, pc}

0000080c <pqcrystals_dilithium2_ref_poly_invntt_tomont>:
     80c:	b580      	push	{r7, lr}
     80e:	f000 fb1f 	bl	e50 <pqcrystals_dilithium2_ref_invntt_tomont>
     812:	bd80      	pop	{r7, pc}

00000814 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>:
     814:	b5f0      	push	{r4, r5, r6, r7, lr}
     816:	b081      	sub	sp, #4
     818:	4614      	mov	r4, r2
     81a:	460d      	mov	r5, r1
     81c:	4606      	mov	r6, r0
     81e:	2700      	movs	r7, #0
     820:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
     824:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
     828:	fb80 0101 	smull	r0, r1, r0, r1
     82c:	f000 fb56 	bl	edc <pqcrystals_dilithium2_ref_montgomery_reduce>
     830:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
     834:	3701      	adds	r7, #1
     836:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
     83a:	d1f1      	bne.n	820 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery+0xc>
     83c:	b001      	add	sp, #4
     83e:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000840 <pqcrystals_dilithium2_ref_poly_decompose>:
     840:	b5f0      	push	{r4, r5, r6, r7, lr}
     842:	b081      	sub	sp, #4
     844:	4614      	mov	r4, r2
     846:	460d      	mov	r5, r1
     848:	4606      	mov	r6, r0
     84a:	2700      	movs	r7, #0
     84c:	59e1      	ldr	r1, [r4, r7]
     84e:	19e8      	adds	r0, r5, r7
     850:	f001 fcbc 	bl	21cc <pqcrystals_dilithium2_ref_decompose>
     854:	51f0      	str	r0, [r6, r7]
     856:	3704      	adds	r7, #4
     858:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
     85c:	d1f6      	bne.n	84c <pqcrystals_dilithium2_ref_poly_decompose+0xc>
     85e:	b001      	add	sp, #4
     860:	bdf0      	pop	{r4, r5, r6, r7, pc}
     862:	bf00      	nop

00000864 <pqcrystals_dilithium2_ref_poly_make_hint>:
     864:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     868:	4690      	mov	r8, r2
     86a:	460d      	mov	r5, r1
     86c:	4607      	mov	r7, r0
     86e:	2600      	movs	r6, #0
     870:	2400      	movs	r4, #0
     872:	bf00      	nop
     874:	f855 0024 	ldr.w	r0, [r5, r4, lsl #2]
     878:	f858 1024 	ldr.w	r1, [r8, r4, lsl #2]
     87c:	f001 fcc6 	bl	220c <pqcrystals_dilithium2_ref_make_hint>
     880:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
     884:	3401      	adds	r4, #1
     886:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
     88a:	4406      	add	r6, r0
     88c:	d1f2      	bne.n	874 <pqcrystals_dilithium2_ref_poly_make_hint+0x10>
     88e:	4630      	mov	r0, r6
     890:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

00000894 <pqcrystals_dilithium2_ref_poly_chknorm>:
     894:	f64f 4200 	movw	r2, #64512	@ 0xfc00
     898:	f2c0 020f 	movt	r2, #15
     89c:	4291      	cmp	r1, r2
     89e:	dd01      	ble.n	8a4 <pqcrystals_dilithium2_ref_poly_chknorm+0x10>
     8a0:	2001      	movs	r0, #1
     8a2:	4770      	bx	lr
     8a4:	2200      	movs	r2, #0
     8a6:	bf00      	nop
     8a8:	f850 c022 	ldr.w	ip, [r0, r2, lsl #2]
     8ac:	ea0c 73ec 	and.w	r3, ip, ip, asr #31
     8b0:	ebac 0343 	sub.w	r3, ip, r3, lsl #1
     8b4:	428b      	cmp	r3, r1
     8b6:	daf3      	bge.n	8a0 <pqcrystals_dilithium2_ref_poly_chknorm+0xc>
     8b8:	3201      	adds	r2, #1
     8ba:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
     8be:	bf04      	itt	eq
     8c0:	2000      	moveq	r0, #0
     8c2:	4770      	bxeq	lr
     8c4:	e7f0      	b.n	8a8 <pqcrystals_dilithium2_ref_poly_chknorm+0x14>
     8c6:	bf00      	nop

000008c8 <pqcrystals_dilithium2_ref_poly_uniform>:
     8c8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     8cc:	f2ad 4d1c 	subw	sp, sp, #1052	@ 0x41c
     8d0:	466e      	mov	r6, sp
     8d2:	4683      	mov	fp, r0
     8d4:	4630      	mov	r0, r6
     8d6:	f001 fbb9 	bl	204c <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>
     8da:	f10d 05d2 	add.w	r5, sp, #210	@ 0xd2
     8de:	4628      	mov	r0, r5
     8e0:	2105      	movs	r1, #5
     8e2:	4632      	mov	r2, r6
     8e4:	f001 fb34 	bl	1f50 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
     8e8:	4658      	mov	r0, fp
     8ea:	f44f 7180 	mov.w	r1, #256	@ 0x100
     8ee:	462a      	mov	r2, r5
     8f0:	f44f 7352 	mov.w	r3, #840	@ 0x348
     8f4:	f000 f836 	bl	964 <rej_uniform>
     8f8:	28ff      	cmp	r0, #255	@ 0xff
     8fa:	d82f      	bhi.n	95c <pqcrystals_dilithium2_ref_poly_uniform+0x94>
     8fc:	f64a 2aab 	movw	sl, #43691	@ 0xaaab
     900:	4606      	mov	r6, r0
     902:	f1a5 0901 	sub.w	r9, r5, #1
     906:	f44f 7752 	mov.w	r7, #840	@ 0x348
     90a:	f6ca 2aaa 	movt	sl, #43690	@ 0xaaaa
     90e:	46e8      	mov	r8, sp
     910:	e013      	b.n	93a <pqcrystals_dilithium2_ref_poly_uniform+0x72>
     912:	bf00      	nop
     914:	1928      	adds	r0, r5, r4
     916:	2101      	movs	r1, #1
     918:	4642      	mov	r2, r8
     91a:	f001 fb19 	bl	1f50 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
     91e:	f044 07a8 	orr.w	r7, r4, #168	@ 0xa8
     922:	eb0b 0086 	add.w	r0, fp, r6, lsl #2
     926:	f5c6 7180 	rsb	r1, r6, #256	@ 0x100
     92a:	462a      	mov	r2, r5
     92c:	463b      	mov	r3, r7
     92e:	f000 f819 	bl	964 <rej_uniform>
     932:	4406      	add	r6, r0
     934:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
     938:	d210      	bcs.n	95c <pqcrystals_dilithium2_ref_poly_uniform+0x94>
     93a:	fba7 010a 	umull	r0, r1, r7, sl
     93e:	0848      	lsrs	r0, r1, #1
     940:	eb00 0040 	add.w	r0, r0, r0, lsl #1
     944:	1a3c      	subs	r4, r7, r0
     946:	d0e5      	beq.n	914 <pqcrystals_dilithium2_ref_poly_uniform+0x4c>
     948:	4649      	mov	r1, r9
     94a:	bf00      	nop
     94c:	180a      	adds	r2, r1, r0
     94e:	7852      	ldrb	r2, [r2, #1]
     950:	3f01      	subs	r7, #1
     952:	42b8      	cmp	r0, r7
     954:	f801 2f01 	strb.w	r2, [r1, #1]!
     958:	d1f8      	bne.n	94c <pqcrystals_dilithium2_ref_poly_uniform+0x84>
     95a:	e7db      	b.n	914 <pqcrystals_dilithium2_ref_poly_uniform+0x4c>
     95c:	f20d 4d1c 	addw	sp, sp, #1052	@ 0x41c
     960:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000964 <rej_uniform>:
     964:	b570      	push	{r4, r5, r6, lr}
     966:	f24e 0e00 	movw	lr, #57344	@ 0xe000
     96a:	f04f 0c00 	mov.w	ip, #0
     96e:	f2c0 0e7f 	movt	lr, #127	@ 0x7f
     972:	2400      	movs	r4, #0
     974:	1915      	adds	r5, r2, r4
     976:	78ad      	ldrb	r5, [r5, #2]
     978:	5b16      	ldrh	r6, [r2, r4]
     97a:	f005 057f 	and.w	r5, r5, #127	@ 0x7f
     97e:	ea46 4505 	orr.w	r5, r6, r5, lsl #16
     982:	4575      	cmp	r5, lr
     984:	bf9c      	itt	ls
     986:	f840 502c 	strls.w	r5, [r0, ip, lsl #2]
     98a:	f10c 0c01 	addls.w	ip, ip, #1
     98e:	458c      	cmp	ip, r1
     990:	d204      	bcs.n	99c <rej_uniform+0x38>
     992:	1da5      	adds	r5, r4, #6
     994:	429d      	cmp	r5, r3
     996:	f104 0403 	add.w	r4, r4, #3
     99a:	d9eb      	bls.n	974 <rej_uniform+0x10>
     99c:	4660      	mov	r0, ip
     99e:	bd70      	pop	{r4, r5, r6, pc}

000009a0 <pqcrystals_dilithium2_ref_poly_uniform_gamma1>:
     9a0:	b570      	push	{r4, r5, r6, lr}
     9a2:	f5ad 7d5e 	sub.w	sp, sp, #888	@ 0x378
     9a6:	466d      	mov	r5, sp
     9a8:	4604      	mov	r4, r0
     9aa:	4628      	mov	r0, r5
     9ac:	f001 fb66 	bl	207c <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>
     9b0:	ae34      	add	r6, sp, #208	@ 0xd0
     9b2:	4630      	mov	r0, r6
     9b4:	2105      	movs	r1, #5
     9b6:	462a      	mov	r2, r5
     9b8:	f001 fb42 	bl	2040 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
     9bc:	4620      	mov	r0, r4
     9be:	4631      	mov	r1, r6
     9c0:	f000 f804 	bl	9cc <pqcrystals_dilithium2_ref_polyz_unpack>
     9c4:	f50d 7d5e 	add.w	sp, sp, #888	@ 0x378
     9c8:	bd70      	pop	{r4, r5, r6, pc}
     9ca:	bf00      	nop

000009cc <pqcrystals_dilithium2_ref_polyz_unpack>:
     9cc:	b5f0      	push	{r4, r5, r6, r7, lr}
     9ce:	f64f 7cff 	movw	ip, #65535	@ 0xffff
     9d2:	f2c0 0c03 	movt	ip, #3
     9d6:	3810      	subs	r0, #16
     9d8:	2500      	movs	r5, #0
     9da:	bf00      	nop
     9dc:	5d4b      	ldrb	r3, [r1, r5]
     9de:	194a      	adds	r2, r1, r5
     9e0:	f840 3f10 	str.w	r3, [r0, #16]!
     9e4:	7854      	ldrb	r4, [r2, #1]
     9e6:	3509      	adds	r5, #9
     9e8:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
     9ec:	6003      	str	r3, [r0, #0]
     9ee:	7894      	ldrb	r4, [r2, #2]
     9f0:	f5b5 7f10 	cmp.w	r5, #576	@ 0x240
     9f4:	ea43 4304 	orr.w	r3, r3, r4, lsl #16
     9f8:	ea03 0e0c 	and.w	lr, r3, ip
     9fc:	f8c0 e000 	str.w	lr, [r0]
     a00:	7893      	ldrb	r3, [r2, #2]
     a02:	ea4f 0393 	mov.w	r3, r3, lsr #2
     a06:	6043      	str	r3, [r0, #4]
     a08:	78d4      	ldrb	r4, [r2, #3]
     a0a:	ea43 1384 	orr.w	r3, r3, r4, lsl #6
     a0e:	6043      	str	r3, [r0, #4]
     a10:	7914      	ldrb	r4, [r2, #4]
     a12:	ea43 3384 	orr.w	r3, r3, r4, lsl #14
     a16:	ea03 030c 	and.w	r3, r3, ip
     a1a:	6043      	str	r3, [r0, #4]
     a1c:	7914      	ldrb	r4, [r2, #4]
     a1e:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
     a22:	ea4f 1414 	mov.w	r4, r4, lsr #4
     a26:	6084      	str	r4, [r0, #8]
     a28:	7956      	ldrb	r6, [r2, #5]
     a2a:	ea44 1406 	orr.w	r4, r4, r6, lsl #4
     a2e:	6084      	str	r4, [r0, #8]
     a30:	7996      	ldrb	r6, [r2, #6]
     a32:	ea44 3406 	orr.w	r4, r4, r6, lsl #12
     a36:	ea04 040c 	and.w	r4, r4, ip
     a3a:	6084      	str	r4, [r0, #8]
     a3c:	7996      	ldrb	r6, [r2, #6]
     a3e:	ea4f 1696 	mov.w	r6, r6, lsr #6
     a42:	60c6      	str	r6, [r0, #12]
     a44:	79d7      	ldrb	r7, [r2, #7]
     a46:	ea46 0687 	orr.w	r6, r6, r7, lsl #2
     a4a:	60c6      	str	r6, [r0, #12]
     a4c:	7a12      	ldrb	r2, [r2, #8]
     a4e:	f5ce 3700 	rsb	r7, lr, #131072	@ 0x20000
     a52:	ea46 2282 	orr.w	r2, r6, r2, lsl #10
     a56:	ea02 020c 	and.w	r2, r2, ip
     a5a:	6043      	str	r3, [r0, #4]
     a5c:	f5c4 3300 	rsb	r3, r4, #131072	@ 0x20000
     a60:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
     a64:	6007      	str	r7, [r0, #0]
     a66:	6083      	str	r3, [r0, #8]
     a68:	60c2      	str	r2, [r0, #12]
     a6a:	d1b7      	bne.n	9dc <pqcrystals_dilithium2_ref_polyz_unpack+0x10>
     a6c:	bdf0      	pop	{r4, r5, r6, r7, pc}
     a6e:	bf00      	nop

00000a70 <pqcrystals_dilithium2_ref_poly_challenge>:
     a70:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     a74:	b0d6      	sub	sp, #344	@ 0x158
     a76:	466e      	mov	r6, sp
     a78:	4680      	mov	r8, r0
     a7a:	4630      	mov	r0, r6
     a7c:	460d      	mov	r5, r1
     a7e:	f001 faa7 	bl	1fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>
     a82:	4630      	mov	r0, r6
     a84:	4629      	mov	r1, r5
     a86:	2220      	movs	r2, #32
     a88:	f001 faaa 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
     a8c:	4630      	mov	r0, r6
     a8e:	f001 fab9 	bl	2004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
     a92:	ad34      	add	r5, sp, #208	@ 0xd0
     a94:	4628      	mov	r0, r5
     a96:	2101      	movs	r1, #1
     a98:	4632      	mov	r2, r6
     a9a:	f001 fad1 	bl	2040 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
     a9e:	1e68      	subs	r0, r5, #1
     aa0:	2100      	movs	r1, #0
     aa2:	2700      	movs	r7, #0
     aa4:	f04f 0900 	mov.w	r9, #0
     aa8:	f810 2f01 	ldrb.w	r2, [r0, #1]!
     aac:	f1c1 0620 	rsb	r6, r1, #32
     ab0:	fa22 f606 	lsr.w	r6, r2, r6
     ab4:	f1b1 0320 	subs.w	r3, r1, #32
     ab8:	bf58      	it	pl
     aba:	fa02 f603 	lslpl.w	r6, r2, r3
     abe:	fa02 f201 	lsl.w	r2, r2, r1
     ac2:	f101 0108 	add.w	r1, r1, #8
     ac6:	bf58      	it	pl
     ac8:	2200      	movpl	r2, #0
     aca:	ea49 0906 	orr.w	r9, r9, r6
     ace:	2940      	cmp	r1, #64	@ 0x40
     ad0:	ea47 0702 	orr.w	r7, r7, r2
     ad4:	d1e8      	bne.n	aa8 <pqcrystals_dilithium2_ref_poly_challenge+0x38>
     ad6:	f1a8 0004 	sub.w	r0, r8, #4
     ada:	f44f 7180 	mov.w	r1, #256	@ 0x100
     ade:	2200      	movs	r2, #0
     ae0:	3901      	subs	r1, #1
     ae2:	f840 2f04 	str.w	r2, [r0, #4]!
     ae6:	d1fb      	bne.n	ae0 <pqcrystals_dilithium2_ref_poly_challenge+0x70>
     ae8:	24d9      	movs	r4, #217	@ 0xd9
     aea:	2008      	movs	r0, #8
     aec:	466e      	mov	r6, sp
     aee:	f04f 0a02 	mov.w	sl, #2
     af2:	e003      	b.n	afc <pqcrystals_dilithium2_ref_poly_challenge+0x8c>
     af4:	5c29      	ldrb	r1, [r5, r0]
     af6:	3001      	adds	r0, #1
     af8:	428c      	cmp	r4, r1
     afa:	d208      	bcs.n	b0e <pqcrystals_dilithium2_ref_poly_challenge+0x9e>
     afc:	2888      	cmp	r0, #136	@ 0x88
     afe:	d3f9      	bcc.n	af4 <pqcrystals_dilithium2_ref_poly_challenge+0x84>
     b00:	4628      	mov	r0, r5
     b02:	2101      	movs	r1, #1
     b04:	4632      	mov	r2, r6
     b06:	f001 fa9b 	bl	2040 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
     b0a:	2000      	movs	r0, #0
     b0c:	e7f2      	b.n	af4 <pqcrystals_dilithium2_ref_poly_challenge+0x84>
     b0e:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
     b12:	ea5f 0959 	movs.w	r9, r9, lsr #1
     b16:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
     b1a:	ea0a 0247 	and.w	r2, sl, r7, lsl #1
     b1e:	f104 0401 	add.w	r4, r4, #1
     b22:	f1c2 0201 	rsb	r2, r2, #1
     b26:	ea4f 0737 	mov.w	r7, r7, rrx
     b2a:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
     b2e:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
     b32:	d1e3      	bne.n	afc <pqcrystals_dilithium2_ref_poly_challenge+0x8c>
     b34:	b056      	add	sp, #344	@ 0x158
     b36:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     b3a:	bf00      	nop

00000b3c <pqcrystals_dilithium2_ref_polyeta_unpack>:
     b3c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     b40:	b082      	sub	sp, #8
     b42:	3902      	subs	r1, #2
     b44:	2300      	movs	r3, #0
     b46:	9000      	str	r0, [sp, #0]
     b48:	788a      	ldrb	r2, [r1, #2]
     b4a:	9800      	ldr	r0, [sp, #0]
     b4c:	f002 0807 	and.w	r8, r2, #7
     b50:	f840 8003 	str.w	r8, [r0, r3]
     b54:	788d      	ldrb	r5, [r1, #2]
     b56:	18c2      	adds	r2, r0, r3
     b58:	f3c5 09c2 	ubfx	r9, r5, #3, #3
     b5c:	f8c2 9004 	str.w	r9, [r2, #4]
     b60:	788e      	ldrb	r6, [r1, #2]
     b62:	f811 7f03 	ldrb.w	r7, [r1, #3]!
     b66:	09b6      	lsrs	r6, r6, #6
     b68:	f367 0682 	bfi	r6, r7, #2, #1
     b6c:	6096      	str	r6, [r2, #8]
     b6e:	780f      	ldrb	r7, [r1, #0]
     b70:	f1c6 0602 	rsb	r6, r6, #2
     b74:	f3c7 0b42 	ubfx	fp, r7, #1, #3
     b78:	f100 0710 	add.w	r7, r0, #16
     b7c:	eb07 0a03 	add.w	sl, r7, r3
     b80:	f84a bc04 	str.w	fp, [sl, #-4]
     b84:	780d      	ldrb	r5, [r1, #0]
     b86:	9701      	str	r7, [sp, #4]
     b88:	f3c5 1e02 	ubfx	lr, r5, #4, #3
     b8c:	f847 e003 	str.w	lr, [r7, r3]
     b90:	780c      	ldrb	r4, [r1, #0]
     b92:	784f      	ldrb	r7, [r1, #1]
     b94:	09e4      	lsrs	r4, r4, #7
     b96:	f367 0442 	bfi	r4, r7, #1, #2
     b9a:	6154      	str	r4, [r2, #20]
     b9c:	784f      	ldrb	r7, [r1, #1]
     b9e:	f1c8 0502 	rsb	r5, r8, #2
     ba2:	f3c7 0782 	ubfx	r7, r7, #2, #3
     ba6:	6197      	str	r7, [r2, #24]
     ba8:	f891 c001 	ldrb.w	ip, [r1, #1]
     bac:	50c5      	str	r5, [r0, r3]
     bae:	f1c9 0502 	rsb	r5, r9, #2
     bb2:	9801      	ldr	r0, [sp, #4]
     bb4:	e9c2 5601 	strd	r5, r6, [r2, #4]
     bb8:	f1ce 0602 	rsb	r6, lr, #2
     bbc:	f1cb 0502 	rsb	r5, fp, #2
     bc0:	50c6      	str	r6, [r0, r3]
     bc2:	2002      	movs	r0, #2
     bc4:	3320      	adds	r3, #32
     bc6:	f84a 5c04 	str.w	r5, [sl, #-4]
     bca:	f1c4 0602 	rsb	r6, r4, #2
     bce:	f1c7 0702 	rsb	r7, r7, #2
     bd2:	eba0 155c 	sub.w	r5, r0, ip, lsr #5
     bd6:	f5b3 6f80 	cmp.w	r3, #1024	@ 0x400
     bda:	e9c2 6705 	strd	r6, r7, [r2, #20]
     bde:	61d5      	str	r5, [r2, #28]
     be0:	d1b2      	bne.n	b48 <pqcrystals_dilithium2_ref_polyeta_unpack+0xc>
     be2:	b002      	add	sp, #8
     be4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000be8 <pqcrystals_dilithium2_ref_polyt0_unpack>:
     be8:	b510      	push	{r4, lr}
     bea:	301c      	adds	r0, #28
     bec:	f04f 0c00 	mov.w	ip, #0
     bf0:	f811 e00c 	ldrb.w	lr, [r1, ip]
     bf4:	eb01 030c 	add.w	r3, r1, ip
     bf8:	f840 ec1c 	str.w	lr, [r0, #-28]
     bfc:	785a      	ldrb	r2, [r3, #1]
     bfe:	f10c 0c0d 	add.w	ip, ip, #13
     c02:	ea4e 2202 	orr.w	r2, lr, r2, lsl #8
     c06:	f36f 325f 	bfc	r2, #13, #19
     c0a:	f840 2c1c 	str.w	r2, [r0, #-28]
     c0e:	785a      	ldrb	r2, [r3, #1]
     c10:	f850 4c1c 	ldr.w	r4, [r0, #-28]
     c14:	ea4f 1e52 	mov.w	lr, r2, lsr #5
     c18:	f840 ec18 	str.w	lr, [r0, #-24]
     c1c:	789a      	ldrb	r2, [r3, #2]
     c1e:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
     c22:	ea4e 0ec2 	orr.w	lr, lr, r2, lsl #3
     c26:	f840 ec18 	str.w	lr, [r0, #-24]
     c2a:	78da      	ldrb	r2, [r3, #3]
     c2c:	ea4e 22c2 	orr.w	r2, lr, r2, lsl #11
     c30:	f36f 325f 	bfc	r2, #13, #19
     c34:	f840 2c18 	str.w	r2, [r0, #-24]
     c38:	78da      	ldrb	r2, [r3, #3]
     c3a:	ea4f 0e92 	mov.w	lr, r2, lsr #2
     c3e:	f840 ec14 	str.w	lr, [r0, #-20]
     c42:	791a      	ldrb	r2, [r3, #4]
     c44:	ea4e 1282 	orr.w	r2, lr, r2, lsl #6
     c48:	f36f 325f 	bfc	r2, #13, #19
     c4c:	f840 2c14 	str.w	r2, [r0, #-20]
     c50:	791a      	ldrb	r2, [r3, #4]
     c52:	ea4f 1ed2 	mov.w	lr, r2, lsr #7
     c56:	f840 ec10 	str.w	lr, [r0, #-16]
     c5a:	795a      	ldrb	r2, [r3, #5]
     c5c:	ea4e 0e42 	orr.w	lr, lr, r2, lsl #1
     c60:	f840 ec10 	str.w	lr, [r0, #-16]
     c64:	799a      	ldrb	r2, [r3, #6]
     c66:	ea4e 2242 	orr.w	r2, lr, r2, lsl #9
     c6a:	f36f 325f 	bfc	r2, #13, #19
     c6e:	f840 2c10 	str.w	r2, [r0, #-16]
     c72:	799a      	ldrb	r2, [r3, #6]
     c74:	ea4f 1e12 	mov.w	lr, r2, lsr #4
     c78:	f840 ec0c 	str.w	lr, [r0, #-12]
     c7c:	79da      	ldrb	r2, [r3, #7]
     c7e:	ea4e 1e02 	orr.w	lr, lr, r2, lsl #4
     c82:	f840 ec0c 	str.w	lr, [r0, #-12]
     c86:	7a1a      	ldrb	r2, [r3, #8]
     c88:	ea4e 3202 	orr.w	r2, lr, r2, lsl #12
     c8c:	f36f 325f 	bfc	r2, #13, #19
     c90:	f840 2c0c 	str.w	r2, [r0, #-12]
     c94:	7a1a      	ldrb	r2, [r3, #8]
     c96:	ea4f 0e52 	mov.w	lr, r2, lsr #1
     c9a:	f840 ec08 	str.w	lr, [r0, #-8]
     c9e:	7a5a      	ldrb	r2, [r3, #9]
     ca0:	ea4e 12c2 	orr.w	r2, lr, r2, lsl #7
     ca4:	f36f 325f 	bfc	r2, #13, #19
     ca8:	f840 2c08 	str.w	r2, [r0, #-8]
     cac:	7a5a      	ldrb	r2, [r3, #9]
     cae:	ea4f 1e92 	mov.w	lr, r2, lsr #6
     cb2:	f840 ec04 	str.w	lr, [r0, #-4]
     cb6:	7a9a      	ldrb	r2, [r3, #10]
     cb8:	ea4e 0e82 	orr.w	lr, lr, r2, lsl #2
     cbc:	f840 ec04 	str.w	lr, [r0, #-4]
     cc0:	7ada      	ldrb	r2, [r3, #11]
     cc2:	ea4e 2e82 	orr.w	lr, lr, r2, lsl #10
     cc6:	f36f 3e5f 	bfc	lr, #13, #19
     cca:	f840 ec04 	str.w	lr, [r0, #-4]
     cce:	7ada      	ldrb	r2, [r3, #11]
     cd0:	ea4f 02d2 	mov.w	r2, r2, lsr #3
     cd4:	6002      	str	r2, [r0, #0]
     cd6:	7b1b      	ldrb	r3, [r3, #12]
     cd8:	ea42 1243 	orr.w	r2, r2, r3, lsl #5
     cdc:	f5c4 5380 	rsb	r3, r4, #4096	@ 0x1000
     ce0:	f850 4c18 	ldr.w	r4, [r0, #-24]
     ce4:	f840 3c1c 	str.w	r3, [r0, #-28]
     ce8:	f5c4 5380 	rsb	r3, r4, #4096	@ 0x1000
     cec:	f850 4c14 	ldr.w	r4, [r0, #-20]
     cf0:	f840 3c18 	str.w	r3, [r0, #-24]
     cf4:	f5c4 5380 	rsb	r3, r4, #4096	@ 0x1000
     cf8:	f850 4c10 	ldr.w	r4, [r0, #-16]
     cfc:	f840 3c14 	str.w	r3, [r0, #-20]
     d00:	f5c4 5380 	rsb	r3, r4, #4096	@ 0x1000
     d04:	f840 3c10 	str.w	r3, [r0, #-16]
     d08:	f850 3c0c 	ldr.w	r3, [r0, #-12]
     d0c:	f36f 325f 	bfc	r2, #13, #19
     d10:	f5c3 5380 	rsb	r3, r3, #4096	@ 0x1000
     d14:	f840 3c0c 	str.w	r3, [r0, #-12]
     d18:	f850 3c08 	ldr.w	r3, [r0, #-8]
     d1c:	6002      	str	r2, [r0, #0]
     d1e:	f5c3 5380 	rsb	r3, r3, #4096	@ 0x1000
     d22:	f840 3c08 	str.w	r3, [r0, #-8]
     d26:	f5ce 5380 	rsb	r3, lr, #4096	@ 0x1000
     d2a:	f5c2 5280 	rsb	r2, r2, #4096	@ 0x1000
     d2e:	f840 3c04 	str.w	r3, [r0, #-4]
     d32:	f840 2b20 	str.w	r2, [r0], #32
     d36:	f47f af5b 	bne.w	bf0 <pqcrystals_dilithium2_ref_polyt0_unpack+0x8>
     d3a:	bd10      	pop	{r4, pc}

00000d3c <pqcrystals_dilithium2_ref_polyz_pack>:
     d3c:	b570      	push	{r4, r5, r6, lr}
     d3e:	3910      	subs	r1, #16
     d40:	2200      	movs	r2, #0
     d42:	bf00      	nop
     d44:	f851 3f10 	ldr.w	r3, [r1, #16]!
     d48:	e9d1 ce01 	ldrd	ip, lr, [r1, #4]
     d4c:	68ce      	ldr	r6, [r1, #12]
     d4e:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
     d52:	f5cc 3400 	rsb	r4, ip, #131072	@ 0x20000
     d56:	f5c6 3c00 	rsb	ip, r6, #131072	@ 0x20000
     d5a:	1886      	adds	r6, r0, r2
     d5c:	0a1d      	lsrs	r5, r3, #8
     d5e:	7075      	strb	r5, [r6, #1]
     d60:	00a5      	lsls	r5, r4, #2
     d62:	5483      	strb	r3, [r0, r2]
     d64:	ea45 4313 	orr.w	r3, r5, r3, lsr #16
     d68:	f5ce 3e00 	rsb	lr, lr, #131072	@ 0x20000
     d6c:	70b3      	strb	r3, [r6, #2]
     d6e:	09a3      	lsrs	r3, r4, #6
     d70:	70f3      	strb	r3, [r6, #3]
     d72:	ea4f 130e 	mov.w	r3, lr, lsl #4
     d76:	ea43 3394 	orr.w	r3, r3, r4, lsr #14
     d7a:	7133      	strb	r3, [r6, #4]
     d7c:	ea4f 131e 	mov.w	r3, lr, lsr #4
     d80:	7173      	strb	r3, [r6, #5]
     d82:	ea4f 138c 	mov.w	r3, ip, lsl #6
     d86:	ea43 331e 	orr.w	r3, r3, lr, lsr #12
     d8a:	71b3      	strb	r3, [r6, #6]
     d8c:	ea4f 039c 	mov.w	r3, ip, lsr #2
     d90:	3209      	adds	r2, #9
     d92:	71f3      	strb	r3, [r6, #7]
     d94:	ea4f 239c 	mov.w	r3, ip, lsr #10
     d98:	f5b2 7f10 	cmp.w	r2, #576	@ 0x240
     d9c:	7233      	strb	r3, [r6, #8]
     d9e:	d1d1      	bne.n	d44 <pqcrystals_dilithium2_ref_polyz_pack+0x8>
     da0:	bd70      	pop	{r4, r5, r6, pc}
     da2:	bf00      	nop

00000da4 <pqcrystals_dilithium2_ref_polyw1_pack>:
     da4:	3802      	subs	r0, #2
     da6:	3910      	subs	r1, #16
     da8:	f04f 0c40 	mov.w	ip, #64	@ 0x40
     dac:	f811 3f10 	ldrb.w	r3, [r1, #16]!
     db0:	f1bc 0c01 	subs.w	ip, ip, #1
     db4:	7083      	strb	r3, [r0, #2]
     db6:	790a      	ldrb	r2, [r1, #4]
     db8:	ea43 1282 	orr.w	r2, r3, r2, lsl #6
     dbc:	7082      	strb	r2, [r0, #2]
     dbe:	684a      	ldr	r2, [r1, #4]
     dc0:	ea4f 0392 	mov.w	r3, r2, lsr #2
     dc4:	f800 3f03 	strb.w	r3, [r0, #3]!
     dc8:	7a0b      	ldrb	r3, [r1, #8]
     dca:	ea4f 1303 	mov.w	r3, r3, lsl #4
     dce:	ea43 0292 	orr.w	r2, r3, r2, lsr #2
     dd2:	7002      	strb	r2, [r0, #0]
     dd4:	688a      	ldr	r2, [r1, #8]
     dd6:	ea4f 1312 	mov.w	r3, r2, lsr #4
     dda:	7043      	strb	r3, [r0, #1]
     ddc:	7b0b      	ldrb	r3, [r1, #12]
     dde:	ea4f 0383 	mov.w	r3, r3, lsl #2
     de2:	ea43 1212 	orr.w	r2, r3, r2, lsr #4
     de6:	7042      	strb	r2, [r0, #1]
     de8:	d1e0      	bne.n	dac <pqcrystals_dilithium2_ref_polyw1_pack+0x8>
     dea:	4770      	bx	lr

00000dec <pqcrystals_dilithium2_ref_ntt>:
     dec:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     df0:	b081      	sub	sp, #4
     df2:	f644 6820 	movw	r8, #20000	@ 0x4e20
     df6:	4604      	mov	r4, r0
     df8:	f04f 0980 	mov.w	r9, #128	@ 0x80
     dfc:	f04f 0a00 	mov.w	sl, #0
     e00:	f2c0 0800 	movt	r8, #0
     e04:	eb04 0789 	add.w	r7, r4, r9, lsl #2
     e08:	2500      	movs	r5, #0
     e0a:	bf00      	nop
     e0c:	f10a 0a01 	add.w	sl, sl, #1
     e10:	f858 b02a 	ldr.w	fp, [r8, sl, lsl #2]
     e14:	eb05 0609 	add.w	r6, r5, r9
     e18:	f857 0025 	ldr.w	r0, [r7, r5, lsl #2]
     e1c:	fb8b 0100 	smull	r0, r1, fp, r0
     e20:	f000 f85c 	bl	edc <pqcrystals_dilithium2_ref_montgomery_reduce>
     e24:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
     e28:	1a0a      	subs	r2, r1, r0
     e2a:	4408      	add	r0, r1
     e2c:	f847 2025 	str.w	r2, [r7, r5, lsl #2]
     e30:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
     e34:	3501      	adds	r5, #1
     e36:	42b5      	cmp	r5, r6
     e38:	d3ee      	bcc.n	e18 <pqcrystals_dilithium2_ref_ntt+0x2c>
     e3a:	444d      	add	r5, r9
     e3c:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
     e40:	d3e4      	bcc.n	e0c <pqcrystals_dilithium2_ref_ntt+0x20>
     e42:	ea5f 0959 	movs.w	r9, r9, lsr #1
     e46:	d1dd      	bne.n	e04 <pqcrystals_dilithium2_ref_ntt+0x18>
     e48:	b001      	add	sp, #4
     e4a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     e4e:	bf00      	nop

00000e50 <pqcrystals_dilithium2_ref_invntt_tomont>:
     e50:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     e54:	b081      	sub	sp, #4
     e56:	f644 6820 	movw	r8, #20000	@ 0x4e20
     e5a:	4604      	mov	r4, r0
     e5c:	f04f 0901 	mov.w	r9, #1
     e60:	f44f 7a80 	mov.w	sl, #256	@ 0x100
     e64:	f2c0 0800 	movt	r8, #0
     e68:	eb04 0789 	add.w	r7, r4, r9, lsl #2
     e6c:	2500      	movs	r5, #0
     e6e:	bf00      	nop
     e70:	f1aa 0a01 	sub.w	sl, sl, #1
     e74:	f858 002a 	ldr.w	r0, [r8, sl, lsl #2]
     e78:	eb05 0609 	add.w	r6, r5, r9
     e7c:	f1c0 0b00 	rsb	fp, r0, #0
     e80:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
     e84:	f857 1025 	ldr.w	r1, [r7, r5, lsl #2]
     e88:	1842      	adds	r2, r0, r1
     e8a:	1a40      	subs	r0, r0, r1
     e8c:	f847 0025 	str.w	r0, [r7, r5, lsl #2]
     e90:	fb8b 0100 	smull	r0, r1, fp, r0
     e94:	f844 2025 	str.w	r2, [r4, r5, lsl #2]
     e98:	f000 f820 	bl	edc <pqcrystals_dilithium2_ref_montgomery_reduce>
     e9c:	f847 0025 	str.w	r0, [r7, r5, lsl #2]
     ea0:	3501      	adds	r5, #1
     ea2:	42b5      	cmp	r5, r6
     ea4:	d3ec      	bcc.n	e80 <pqcrystals_dilithium2_ref_invntt_tomont+0x30>
     ea6:	444d      	add	r5, r9
     ea8:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
     eac:	d3e0      	bcc.n	e70 <pqcrystals_dilithium2_ref_invntt_tomont+0x20>
     eae:	ea4f 0949 	mov.w	r9, r9, lsl #1
     eb2:	f5b9 7f80 	cmp.w	r9, #256	@ 0x100
     eb6:	d3d7      	bcc.n	e68 <pqcrystals_dilithium2_ref_invntt_tomont+0x18>
     eb8:	3c04      	subs	r4, #4
     eba:	f44f 7580 	mov.w	r5, #256	@ 0x100
     ebe:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
     ec2:	bf00      	nop
     ec4:	f854 0f04 	ldr.w	r0, [r4, #4]!
     ec8:	fb80 0106 	smull	r0, r1, r0, r6
     ecc:	f000 f806 	bl	edc <pqcrystals_dilithium2_ref_montgomery_reduce>
     ed0:	3d01      	subs	r5, #1
     ed2:	6020      	str	r0, [r4, #0]
     ed4:	d1f6      	bne.n	ec4 <pqcrystals_dilithium2_ref_invntt_tomont+0x74>
     ed6:	b001      	add	sp, #4
     ed8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000edc <pqcrystals_dilithium2_ref_montgomery_reduce>:
     edc:	f242 0201 	movw	r2, #8193	@ 0x2001
     ee0:	f2c0 3280 	movt	r2, #896	@ 0x380
     ee4:	f641 73ff 	movw	r3, #8191	@ 0x1fff
     ee8:	4342      	muls	r2, r0
     eea:	f6cf 7380 	movt	r3, #65408	@ 0xff80
     eee:	fbc2 0103 	smlal	r0, r1, r2, r3
     ef2:	4608      	mov	r0, r1
     ef4:	4770      	bx	lr
     ef6:	bf00      	nop

00000ef8 <pqcrystals_dilithium2_ref_reduce32>:
     ef8:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
     efc:	f641 72ff 	movw	r2, #8191	@ 0x1fff
     f00:	15c9      	asrs	r1, r1, #23
     f02:	f6cf 7280 	movt	r2, #65408	@ 0xff80
     f06:	fb01 0002 	mla	r0, r1, r2, r0
     f0a:	4770      	bx	lr

00000f0c <pqcrystals_dilithium2_ref_caddq>:
     f0c:	f24e 0101 	movw	r1, #57345	@ 0xe001
     f10:	f2c0 017f 	movt	r1, #127	@ 0x7f
     f14:	2800      	cmp	r0, #0
     f16:	bf48      	it	mi
     f18:	4408      	addmi	r0, r1
     f1a:	4770      	bx	lr

00000f1c <pqcrystals_dilithium_fips202_ref_shake128_init>:
     f1c:	b510      	push	{r4, lr}
     f1e:	4604      	mov	r4, r0
     f20:	f000 f804 	bl	f2c <keccak_init>
     f24:	2000      	movs	r0, #0
     f26:	e9c4 0032 	strd	r0, r0, [r4, #200]	@ 0xc8
     f2a:	bd10      	pop	{r4, pc}

00000f2c <keccak_init>:
     f2c:	3808      	subs	r0, #8
     f2e:	2119      	movs	r1, #25
     f30:	2200      	movs	r2, #0
     f32:	bf00      	nop
     f34:	f840 2f08 	str.w	r2, [r0, #8]!
     f38:	3901      	subs	r1, #1
     f3a:	6042      	str	r2, [r0, #4]
     f3c:	d1fa      	bne.n	f34 <keccak_init+0x8>
     f3e:	4770      	bx	lr

00000f40 <pqcrystals_dilithium_fips202_ref_shake128_absorb>:
     f40:	b510      	push	{r4, lr}
     f42:	b082      	sub	sp, #8
     f44:	4694      	mov	ip, r2
     f46:	f8d0 20c8 	ldr.w	r2, [r0, #200]	@ 0xc8
     f4a:	460b      	mov	r3, r1
     f4c:	4611      	mov	r1, r2
     f4e:	22a8      	movs	r2, #168	@ 0xa8
     f50:	4604      	mov	r4, r0
     f52:	f8cd c000 	str.w	ip, [sp]
     f56:	f000 f805 	bl	f64 <keccak_absorb>
     f5a:	2100      	movs	r1, #0
     f5c:	e9c4 0132 	strd	r0, r1, [r4, #200]	@ 0xc8
     f60:	b002      	add	sp, #8
     f62:	bd10      	pop	{r4, pc}

00000f64 <keccak_absorb>:
     f64:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     f68:	b081      	sub	sp, #4
     f6a:	f8dd 9028 	ldr.w	r9, [sp, #40]	@ 0x28
     f6e:	4690      	mov	r8, r2
     f70:	eb01 0209 	add.w	r2, r1, r9
     f74:	469b      	mov	fp, r3
     f76:	468c      	mov	ip, r1
     f78:	4542      	cmp	r2, r8
     f7a:	4682      	mov	sl, r0
     f7c:	d23a      	bcs.n	ff4 <keccak_absorb+0x90>
     f7e:	eb0c 0009 	add.w	r0, ip, r9
     f82:	4584      	cmp	ip, r0
     f84:	d228      	bcs.n	fd8 <keccak_absorb+0x74>
     f86:	ea4f 00cc 	mov.w	r0, ip, lsl #3
     f8a:	f1ab 0201 	sub.w	r2, fp, #1
     f8e:	bf00      	nop
     f90:	f812 1f01 	ldrb.w	r1, [r2, #1]!
     f94:	f000 0338 	and.w	r3, r0, #56	@ 0x38
     f98:	f1c3 0620 	rsb	r6, r3, #32
     f9c:	fa21 f606 	lsr.w	r6, r1, r6
     fa0:	f1b3 0720 	subs.w	r7, r3, #32
     fa4:	bf58      	it	pl
     fa6:	fa01 f607 	lslpl.w	r6, r1, r7
     faa:	fa01 f103 	lsl.w	r1, r1, r3
     fae:	f02c 0307 	bic.w	r3, ip, #7
     fb2:	eb0a 0703 	add.w	r7, sl, r3
     fb6:	bf58      	it	pl
     fb8:	2100      	movpl	r1, #0
     fba:	687d      	ldr	r5, [r7, #4]
     fbc:	f85a 4003 	ldr.w	r4, [sl, r3]
     fc0:	406e      	eors	r6, r5
     fc2:	4061      	eors	r1, r4
     fc4:	f10c 0c01 	add.w	ip, ip, #1
     fc8:	f1b9 0901 	subs.w	r9, r9, #1
     fcc:	f100 0008 	add.w	r0, r0, #8
     fd0:	f84a 1003 	str.w	r1, [sl, r3]
     fd4:	607e      	str	r6, [r7, #4]
     fd6:	d1db      	bne.n	f90 <keccak_absorb+0x2c>
     fd8:	4660      	mov	r0, ip
     fda:	b001      	add	sp, #4
     fdc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     fe0:	ebac 0008 	sub.w	r0, ip, r8
     fe4:	4481      	add	r9, r0
     fe6:	4650      	mov	r0, sl
     fe8:	f000 f832 	bl	1050 <KeccakF1600_StatePermute>
     fec:	45c1      	cmp	r9, r8
     fee:	f04f 0c00 	mov.w	ip, #0
     ff2:	d3c4      	bcc.n	f7e <keccak_absorb+0x1a>
     ff4:	45c4      	cmp	ip, r8
     ff6:	46c6      	mov	lr, r8
     ff8:	bf88      	it	hi
     ffa:	46e6      	movhi	lr, ip
     ffc:	45f4      	cmp	ip, lr
     ffe:	d0ef      	beq.n	fe0 <keccak_absorb+0x7c>
    1000:	ea4f 02cc 	mov.w	r2, ip, lsl #3
    1004:	4663      	mov	r3, ip
    1006:	bf00      	nop
    1008:	f81b 6b01 	ldrb.w	r6, [fp], #1
    100c:	f002 0738 	and.w	r7, r2, #56	@ 0x38
    1010:	f1c7 0020 	rsb	r0, r7, #32
    1014:	f1b7 0120 	subs.w	r1, r7, #32
    1018:	fa26 f000 	lsr.w	r0, r6, r0
    101c:	bf58      	it	pl
    101e:	fa06 f001 	lslpl.w	r0, r6, r1
    1022:	fa06 f107 	lsl.w	r1, r6, r7
    1026:	f023 0607 	bic.w	r6, r3, #7
    102a:	eb0a 0706 	add.w	r7, sl, r6
    102e:	bf58      	it	pl
    1030:	2100      	movpl	r1, #0
    1032:	687c      	ldr	r4, [r7, #4]
    1034:	f85a 5006 	ldr.w	r5, [sl, r6]
    1038:	3301      	adds	r3, #1
    103a:	4060      	eors	r0, r4
    103c:	4069      	eors	r1, r5
    103e:	459e      	cmp	lr, r3
    1040:	f102 0208 	add.w	r2, r2, #8
    1044:	f84a 1006 	str.w	r1, [sl, r6]
    1048:	6078      	str	r0, [r7, #4]
    104a:	d1dd      	bne.n	1008 <keccak_absorb+0xa4>
    104c:	e7c8      	b.n	fe0 <keccak_absorb+0x7c>
    104e:	bf00      	nop

00001050 <KeccakF1600_StatePermute>:
    1050:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1054:	b0de      	sub	sp, #376	@ 0x178
    1056:	6801      	ldr	r1, [r0, #0]
    1058:	e9d0 e704 	ldrd	lr, r7, [r0, #16]
    105c:	915a      	str	r1, [sp, #360]	@ 0x168
    105e:	6841      	ldr	r1, [r0, #4]
    1060:	e9d0 5b08 	ldrd	r5, fp, [r0, #32]
    1064:	915b      	str	r1, [sp, #364]	@ 0x16c
    1066:	e9d0 4102 	ldrd	r4, r1, [r0, #8]
    106a:	9000      	str	r0, [sp, #0]
    106c:	915d      	str	r1, [sp, #372]	@ 0x174
    106e:	e9d0 9106 	ldrd	r9, r1, [r0, #24]
    1072:	915c      	str	r1, [sp, #368]	@ 0x170
    1074:	6a81      	ldr	r1, [r0, #40]	@ 0x28
    1076:	9137      	str	r1, [sp, #220]	@ 0xdc
    1078:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
    107a:	9147      	str	r1, [sp, #284]	@ 0x11c
    107c:	6b01      	ldr	r1, [r0, #48]	@ 0x30
    107e:	9136      	str	r1, [sp, #216]	@ 0xd8
    1080:	f245 2120 	movw	r1, #21024	@ 0x5220
    1084:	f2c0 0100 	movt	r1, #0
    1088:	3910      	subs	r1, #16
    108a:	9133      	str	r1, [sp, #204]	@ 0xcc
    108c:	6b41      	ldr	r1, [r0, #52]	@ 0x34
    108e:	9134      	str	r1, [sp, #208]	@ 0xd0
    1090:	6b81      	ldr	r1, [r0, #56]	@ 0x38
    1092:	914d      	str	r1, [sp, #308]	@ 0x134
    1094:	6bc1      	ldr	r1, [r0, #60]	@ 0x3c
    1096:	9149      	str	r1, [sp, #292]	@ 0x124
    1098:	6c01      	ldr	r1, [r0, #64]	@ 0x40
    109a:	9129      	str	r1, [sp, #164]	@ 0xa4
    109c:	6c41      	ldr	r1, [r0, #68]	@ 0x44
    109e:	9128      	str	r1, [sp, #160]	@ 0xa0
    10a0:	6c81      	ldr	r1, [r0, #72]	@ 0x48
    10a2:	914a      	str	r1, [sp, #296]	@ 0x128
    10a4:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
    10a6:	9135      	str	r1, [sp, #212]	@ 0xd4
    10a8:	6d01      	ldr	r1, [r0, #80]	@ 0x50
    10aa:	914f      	str	r1, [sp, #316]	@ 0x13c
    10ac:	6d41      	ldr	r1, [r0, #84]	@ 0x54
    10ae:	9150      	str	r1, [sp, #320]	@ 0x140
    10b0:	6d81      	ldr	r1, [r0, #88]	@ 0x58
    10b2:	9156      	str	r1, [sp, #344]	@ 0x158
    10b4:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
    10b6:	9148      	str	r1, [sp, #288]	@ 0x120
    10b8:	6e01      	ldr	r1, [r0, #96]	@ 0x60
    10ba:	914e      	str	r1, [sp, #312]	@ 0x138
    10bc:	6e41      	ldr	r1, [r0, #100]	@ 0x64
    10be:	914b      	str	r1, [sp, #300]	@ 0x12c
    10c0:	6e81      	ldr	r1, [r0, #104]	@ 0x68
    10c2:	9154      	str	r1, [sp, #336]	@ 0x150
    10c4:	6ec1      	ldr	r1, [r0, #108]	@ 0x6c
    10c6:	9151      	str	r1, [sp, #324]	@ 0x144
    10c8:	6f01      	ldr	r1, [r0, #112]	@ 0x70
    10ca:	914c      	str	r1, [sp, #304]	@ 0x130
    10cc:	6f41      	ldr	r1, [r0, #116]	@ 0x74
    10ce:	912b      	str	r1, [sp, #172]	@ 0xac
    10d0:	6f81      	ldr	r1, [r0, #120]	@ 0x78
    10d2:	912c      	str	r1, [sp, #176]	@ 0xb0
    10d4:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
    10d6:	912a      	str	r1, [sp, #168]	@ 0xa8
    10d8:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
    10dc:	913c      	str	r1, [sp, #240]	@ 0xf0
    10de:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
    10e2:	913a      	str	r1, [sp, #232]	@ 0xe8
    10e4:	f8d0 1088 	ldr.w	r1, [r0, #136]	@ 0x88
    10e8:	913e      	str	r1, [sp, #248]	@ 0xf8
    10ea:	f8d0 108c 	ldr.w	r1, [r0, #140]	@ 0x8c
    10ee:	9138      	str	r1, [sp, #224]	@ 0xe0
    10f0:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
    10f4:	913b      	str	r1, [sp, #236]	@ 0xec
    10f6:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
    10fa:	9139      	str	r1, [sp, #228]	@ 0xe4
    10fc:	f8d0 1098 	ldr.w	r1, [r0, #152]	@ 0x98
    1100:	913f      	str	r1, [sp, #252]	@ 0xfc
    1102:	f8d0 109c 	ldr.w	r1, [r0, #156]	@ 0x9c
    1106:	913d      	str	r1, [sp, #244]	@ 0xf4
    1108:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
    110c:	9142      	str	r1, [sp, #264]	@ 0x108
    110e:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
    1112:	9140      	str	r1, [sp, #256]	@ 0x100
    1114:	f8d0 10a8 	ldr.w	r1, [r0, #168]	@ 0xa8
    1118:	9145      	str	r1, [sp, #276]	@ 0x114
    111a:	f8d0 10ac 	ldr.w	r1, [r0, #172]	@ 0xac
    111e:	9153      	str	r1, [sp, #332]	@ 0x14c
    1120:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
    1124:	9141      	str	r1, [sp, #260]	@ 0x104
    1126:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
    112a:	9143      	str	r1, [sp, #268]	@ 0x10c
    112c:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
    1130:	9144      	str	r1, [sp, #272]	@ 0x110
    1132:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
    1136:	9152      	str	r1, [sp, #328]	@ 0x148
    1138:	e9d0 1030 	ldrd	r1, r0, [r0, #192]	@ 0xc0
    113c:	9055      	str	r0, [sp, #340]	@ 0x154
    113e:	2000      	movs	r0, #0
    1140:	9146      	str	r1, [sp, #280]	@ 0x118
    1142:	bf00      	nop
    1144:	9023      	str	r0, [sp, #140]	@ 0x8c
    1146:	9849      	ldr	r0, [sp, #292]	@ 0x124
    1148:	994b      	ldr	r1, [sp, #300]	@ 0x12c
    114a:	4078      	eors	r0, r7
    114c:	4048      	eors	r0, r1
    114e:	994d      	ldr	r1, [sp, #308]	@ 0x134
    1150:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
    1152:	ea81 010e 	eor.w	r1, r1, lr
    1156:	4051      	eors	r1, r2
    1158:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
    115a:	9758      	str	r7, [sp, #352]	@ 0x160
    115c:	4051      	eors	r1, r2
    115e:	9a38      	ldr	r2, [sp, #224]	@ 0xe0
    1160:	f8cd b15c 	str.w	fp, [sp, #348]	@ 0x15c
    1164:	4050      	eors	r0, r2
    1166:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
    1168:	e9cd 5e26 	strd	r5, lr, [sp, #152]	@ 0x98
    116c:	ea80 0c02 	eor.w	ip, r0, r2
    1170:	9841      	ldr	r0, [sp, #260]	@ 0x104
    1172:	f8dd 80a4 	ldr.w	r8, [sp, #164]	@ 0xa4
    1176:	ea81 0200 	eor.w	r2, r1, r0
    117a:	984a      	ldr	r0, [sp, #296]	@ 0x128
    117c:	464b      	mov	r3, r9
    117e:	ea85 0100 	eor.w	r1, r5, r0
    1182:	984c      	ldr	r0, [sp, #304]	@ 0x130
    1184:	f8cd 9070 	str.w	r9, [sp, #112]	@ 0x70
    1188:	4041      	eors	r1, r0
    118a:	9835      	ldr	r0, [sp, #212]	@ 0xd4
    118c:	f8dd 90a0 	ldr.w	r9, [sp, #160]	@ 0xa0
    1190:	ea8b 0700 	eor.w	r7, fp, r0
    1194:	f8dd b0ac 	ldr.w	fp, [sp, #172]	@ 0xac
    1198:	983d      	ldr	r0, [sp, #244]	@ 0xf4
    119a:	ea87 070b 	eor.w	r7, r7, fp
    119e:	ea87 0600 	eor.w	r6, r7, r0
    11a2:	983f      	ldr	r0, [sp, #252]	@ 0xfc
    11a4:	9222      	str	r2, [sp, #136]	@ 0x88
    11a6:	4041      	eors	r1, r0
    11a8:	9846      	ldr	r0, [sp, #280]	@ 0x118
    11aa:	9425      	str	r4, [sp, #148]	@ 0x94
    11ac:	ea81 0700 	eor.w	r7, r1, r0
    11b0:	9855      	ldr	r0, [sp, #340]	@ 0x154
    11b2:	007d      	lsls	r5, r7, #1
    11b4:	ea86 0100 	eor.w	r1, r6, r0
    11b8:	004e      	lsls	r6, r1, #1
    11ba:	ea45 75d1 	orr.w	r5, r5, r1, lsr #31
    11be:	ea46 76d7 	orr.w	r6, r6, r7, lsr #31
    11c2:	ea82 0005 	eor.w	r0, r2, r5
    11c6:	ea8c 0206 	eor.w	r2, ip, r6
    11ca:	ea88 0500 	eor.w	r5, r8, r0
    11ce:	9224      	str	r2, [sp, #144]	@ 0x90
    11d0:	ea89 0602 	eor.w	r6, r9, r2
    11d4:	4622      	mov	r2, r4
    11d6:	05ec      	lsls	r4, r5, #23
    11d8:	9020      	str	r0, [sp, #128]	@ 0x80
    11da:	ea44 2056 	orr.w	r0, r4, r6, lsr #9
    11de:	05f6      	lsls	r6, r6, #23
    11e0:	9030      	str	r0, [sp, #192]	@ 0xc0
    11e2:	ea46 2055 	orr.w	r0, r6, r5, lsr #9
    11e6:	902f      	str	r0, [sp, #188]	@ 0xbc
    11e8:	985d      	ldr	r0, [sp, #372]	@ 0x174
    11ea:	9e34      	ldr	r6, [sp, #208]	@ 0xd0
    11ec:	f8dd a170 	ldr.w	sl, [sp, #368]	@ 0x170
    11f0:	4046      	eors	r6, r0
    11f2:	9848      	ldr	r0, [sp, #288]	@ 0x120
    11f4:	4046      	eors	r6, r0
    11f6:	9836      	ldr	r0, [sp, #216]	@ 0xd8
    11f8:	ea82 0500 	eor.w	r5, r2, r0
    11fc:	9856      	ldr	r0, [sp, #344]	@ 0x158
    11fe:	4045      	eors	r5, r0
    1200:	983c      	ldr	r0, [sp, #240]	@ 0xf0
    1202:	4045      	eors	r5, r0
    1204:	983a      	ldr	r0, [sp, #232]	@ 0xe8
    1206:	4046      	eors	r6, r0
    1208:	9853      	ldr	r0, [sp, #332]	@ 0x14c
    120a:	4046      	eors	r6, r0
    120c:	9845      	ldr	r0, [sp, #276]	@ 0x114
    120e:	0074      	lsls	r4, r6, #1
    1210:	ea85 0e00 	eor.w	lr, r5, r0
    1214:	ea44 74de 	orr.w	r4, r4, lr, lsr #31
    1218:	ea81 0204 	eor.w	r2, r1, r4
    121c:	ea4f 044e 	mov.w	r4, lr, lsl #1
    1220:	9d2a      	ldr	r5, [sp, #168]	@ 0xa8
    1222:	ea44 74d6 	orr.w	r4, r4, r6, lsr #31
    1226:	992c      	ldr	r1, [sp, #176]	@ 0xb0
    1228:	ea87 0004 	eor.w	r0, r7, r4
    122c:	ea85 0402 	eor.w	r4, r5, r2
    1230:	921f      	str	r2, [sp, #124]	@ 0x7c
    1232:	ea81 0700 	eor.w	r7, r1, r0
    1236:	0262      	lsls	r2, r4, #9
    1238:	901e      	str	r0, [sp, #120]	@ 0x78
    123a:	ea42 50d7 	orr.w	r0, r2, r7, lsr #23
    123e:	027a      	lsls	r2, r7, #9
    1240:	902e      	str	r0, [sp, #184]	@ 0xb8
    1242:	ea42 50d4 	orr.w	r0, r2, r4, lsr #23
    1246:	902d      	str	r0, [sp, #180]	@ 0xb4
    1248:	985a      	ldr	r0, [sp, #360]	@ 0x168
    124a:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
    124c:	ea8a 0409 	eor.w	r4, sl, r9
    1250:	4042      	eors	r2, r0
    1252:	984f      	ldr	r0, [sp, #316]	@ 0x13c
    1254:	4042      	eors	r2, r0
    1256:	ea82 0701 	eor.w	r7, r2, r1
    125a:	985b      	ldr	r0, [sp, #364]	@ 0x16c
    125c:	9947      	ldr	r1, [sp, #284]	@ 0x11c
    125e:	ea80 0201 	eor.w	r2, r0, r1
    1262:	9850      	ldr	r0, [sp, #320]	@ 0x140
    1264:	ea83 0108 	eor.w	r1, r3, r8
    1268:	4042      	eors	r2, r0
    126a:	9854      	ldr	r0, [sp, #336]	@ 0x150
    126c:	406a      	eors	r2, r5
    126e:	4041      	eors	r1, r0
    1270:	9851      	ldr	r0, [sp, #324]	@ 0x144
    1272:	9d44      	ldr	r5, [sp, #272]	@ 0x110
    1274:	4044      	eors	r4, r0
    1276:	9839      	ldr	r0, [sp, #228]	@ 0xe4
    1278:	4044      	eors	r4, r0
    127a:	983b      	ldr	r0, [sp, #236]	@ 0xec
    127c:	4041      	eors	r1, r0
    127e:	4069      	eors	r1, r5
    1280:	9d52      	ldr	r5, [sp, #328]	@ 0x148
    1282:	9842      	ldr	r0, [sp, #264]	@ 0x108
    1284:	406c      	eors	r4, r5
    1286:	9d40      	ldr	r5, [sp, #256]	@ 0x100
    1288:	ea87 0800 	eor.w	r8, r7, r0
    128c:	406a      	eors	r2, r5
    128e:	ea4f 0748 	mov.w	r7, r8, lsl #1
    1292:	ea47 75d2 	orr.w	r5, r7, r2, lsr #31
    1296:	0057      	lsls	r7, r2, #1
    1298:	ea47 77d8 	orr.w	r7, r7, r8, lsr #31
    129c:	984c      	ldr	r0, [sp, #304]	@ 0x130
    129e:	ea84 0307 	eor.w	r3, r4, r7
    12a2:	ea81 0705 	eor.w	r7, r1, r5
    12a6:	ea80 0507 	eor.w	r5, r0, r7
    12aa:	ea8b 0003 	eor.w	r0, fp, r3
    12ae:	ea4f 1bc0 	mov.w	fp, r0, lsl #7
    12b2:	931d      	str	r3, [sp, #116]	@ 0x74
    12b4:	ea4b 6355 	orr.w	r3, fp, r5, lsr #25
    12b8:	01ed      	lsls	r5, r5, #7
    12ba:	ea45 6050 	orr.w	r0, r5, r0, lsr #25
    12be:	902c      	str	r0, [sp, #176]	@ 0xb0
    12c0:	0048      	lsls	r0, r1, #1
    12c2:	ea40 70d4 	orr.w	r0, r0, r4, lsr #31
    12c6:	0064      	lsls	r4, r4, #1
    12c8:	ea44 71d1 	orr.w	r1, r4, r1, lsr #31
    12cc:	ea86 0901 	eor.w	r9, r6, r1
    12d0:	994b      	ldr	r1, [sp, #300]	@ 0x12c
    12d2:	ea8e 0e00 	eor.w	lr, lr, r0
    12d6:	984e      	ldr	r0, [sp, #312]	@ 0x138
    12d8:	ea81 0109 	eor.w	r1, r1, r9
    12dc:	ea80 000e 	eor.w	r0, r0, lr
    12e0:	02cd      	lsls	r5, r1, #11
    12e2:	9359      	str	r3, [sp, #356]	@ 0x164
    12e4:	ea45 5b50 	orr.w	fp, r5, r0, lsr #21
    12e8:	02c0      	lsls	r0, r0, #11
    12ea:	9b22      	ldr	r3, [sp, #136]	@ 0x88
    12ec:	ea40 5451 	orr.w	r4, r0, r1, lsr #21
    12f0:	ea4f 014c 	mov.w	r1, ip, lsl #1
    12f4:	ea41 71d3 	orr.w	r1, r1, r3, lsr #31
    12f8:	0058      	lsls	r0, r3, #1
    12fa:	ea82 0301 	eor.w	r3, r2, r1
    12fe:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
    1300:	ea40 70dc 	orr.w	r0, r0, ip, lsr #31
    1304:	9936      	ldr	r1, [sp, #216]	@ 0xd8
    1306:	ea80 0008 	eor.w	r0, r0, r8
    130a:	405a      	eors	r2, r3
    130c:	931a      	str	r3, [sp, #104]	@ 0x68
    130e:	4041      	eors	r1, r0
    1310:	0313      	lsls	r3, r2, #12
    1312:	ea43 5611 	orr.w	r6, r3, r1, lsr #20
    1316:	9b33      	ldr	r3, [sp, #204]	@ 0xcc
    1318:	0309      	lsls	r1, r1, #12
    131a:	ea41 5512 	orr.w	r5, r1, r2, lsr #20
    131e:	f853 1f10 	ldr.w	r1, [r3, #16]!
    1322:	ea2b 0206 	bic.w	r2, fp, r6
    1326:	4051      	eors	r1, r2
    1328:	9121      	str	r1, [sp, #132]	@ 0x84
    132a:	6859      	ldr	r1, [r3, #4]
    132c:	ea24 0205 	bic.w	r2, r4, r5
    1330:	4051      	eors	r1, r2
    1332:	f8dd 8080 	ldr.w	r8, [sp, #128]	@ 0x80
    1336:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
    1338:	f8cd b0c8 	str.w	fp, [sp, #200]	@ 0xc8
    133c:	f8dd b090 	ldr.w	fp, [sp, #144]	@ 0x90
    1340:	ea82 0208 	eor.w	r2, r2, r8
    1344:	9333      	str	r3, [sp, #204]	@ 0xcc
    1346:	9122      	str	r1, [sp, #136]	@ 0x88
    1348:	ea8a 010b 	eor.w	r1, sl, fp
    134c:	0713      	lsls	r3, r2, #28
    134e:	ea43 1311 	orr.w	r3, r3, r1, lsr #4
    1352:	0709      	lsls	r1, r1, #28
    1354:	ea41 1112 	orr.w	r1, r1, r2, lsr #4
    1358:	f8dd c07c 	ldr.w	ip, [sp, #124]	@ 0x7c
    135c:	9a50      	ldr	r2, [sp, #320]	@ 0x140
    135e:	9636      	str	r6, [sp, #216]	@ 0xd8
    1360:	912b      	str	r1, [sp, #172]	@ 0xac
    1362:	9e1e      	ldr	r6, [sp, #120]	@ 0x78
    1364:	994f      	ldr	r1, [sp, #316]	@ 0x13c
    1366:	ea82 020c 	eor.w	r2, r2, ip
    136a:	9334      	str	r3, [sp, #208]	@ 0xd0
    136c:	4071      	eors	r1, r6
    136e:	00d3      	lsls	r3, r2, #3
    1370:	ea43 7351 	orr.w	r3, r3, r1, lsr #29
    1374:	00c9      	lsls	r1, r1, #3
    1376:	9431      	str	r4, [sp, #196]	@ 0xc4
    1378:	ea41 7152 	orr.w	r1, r1, r2, lsr #29
    137c:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
    137e:	9a35      	ldr	r2, [sp, #212]	@ 0xd4
    1380:	912a      	str	r1, [sp, #168]	@ 0xa8
    1382:	994a      	ldr	r1, [sp, #296]	@ 0x128
    1384:	4062      	eors	r2, r4
    1386:	9350      	str	r3, [sp, #320]	@ 0x140
    1388:	4079      	eors	r1, r7
    138a:	0513      	lsls	r3, r2, #20
    138c:	ea43 3311 	orr.w	r3, r3, r1, lsr #12
    1390:	0509      	lsls	r1, r1, #20
    1392:	ea41 3112 	orr.w	r1, r1, r2, lsr #12
    1396:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
    139a:	9a5d      	ldr	r2, [sp, #372]	@ 0x174
    139c:	914c      	str	r1, [sp, #304]	@ 0x130
    139e:	9925      	ldr	r1, [sp, #148]	@ 0x94
    13a0:	ea82 020a 	eor.w	r2, r2, sl
    13a4:	934e      	str	r3, [sp, #312]	@ 0x138
    13a6:	4041      	eors	r1, r0
    13a8:	0053      	lsls	r3, r2, #1
    13aa:	ea43 73d1 	orr.w	r3, r3, r1, lsr #31
    13ae:	0049      	lsls	r1, r1, #1
    13b0:	ea41 71d2 	orr.w	r1, r1, r2, lsr #31
    13b4:	9a54      	ldr	r2, [sp, #336]	@ 0x150
    13b6:	914f      	str	r1, [sp, #316]	@ 0x13c
    13b8:	9951      	ldr	r1, [sp, #324]	@ 0x144
    13ba:	ea82 0208 	eor.w	r2, r2, r8
    13be:	934b      	str	r3, [sp, #300]	@ 0x12c
    13c0:	ea81 010b 	eor.w	r1, r1, fp
    13c4:	0653      	lsls	r3, r2, #25
    13c6:	ea43 13d1 	orr.w	r3, r3, r1, lsr #7
    13ca:	0649      	lsls	r1, r1, #25
    13cc:	ea41 11d2 	orr.w	r1, r1, r2, lsr #7
    13d0:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
    13d2:	9129      	str	r1, [sp, #164]	@ 0xa4
    13d4:	9949      	ldr	r1, [sp, #292]	@ 0x124
    13d6:	ea82 020e 	eor.w	r2, r2, lr
    13da:	934a      	str	r3, [sp, #296]	@ 0x128
    13dc:	ea81 0109 	eor.w	r1, r1, r9
    13e0:	0193      	lsls	r3, r2, #6
    13e2:	ea43 6391 	orr.w	r3, r3, r1, lsr #26
    13e6:	0189      	lsls	r1, r1, #6
    13e8:	ea41 6192 	orr.w	r1, r1, r2, lsr #26
    13ec:	9a26      	ldr	r2, [sp, #152]	@ 0x98
    13ee:	915c      	str	r1, [sp, #368]	@ 0x170
    13f0:	9957      	ldr	r1, [sp, #348]	@ 0x15c
    13f2:	407a      	eors	r2, r7
    13f4:	9351      	str	r3, [sp, #324]	@ 0x144
    13f6:	4061      	eors	r1, r4
    13f8:	06d3      	lsls	r3, r2, #27
    13fa:	ea43 1351 	orr.w	r3, r3, r1, lsr #5
    13fe:	06c9      	lsls	r1, r1, #27
    1400:	ea41 1152 	orr.w	r1, r1, r2, lsr #5
    1404:	9a48      	ldr	r2, [sp, #288]	@ 0x120
    1406:	914d      	str	r1, [sp, #308]	@ 0x134
    1408:	9956      	ldr	r1, [sp, #344]	@ 0x158
    140a:	ea82 020a 	eor.w	r2, r2, sl
    140e:	9349      	str	r3, [sp, #292]	@ 0x124
    1410:	4041      	eors	r1, r0
    1412:	0293      	lsls	r3, r2, #10
    1414:	ea43 5391 	orr.w	r3, r3, r1, lsr #22
    1418:	0289      	lsls	r1, r1, #10
    141a:	ea41 5192 	orr.w	r1, r1, r2, lsr #22
    141e:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
    1420:	9128      	str	r1, [sp, #160]	@ 0xa0
    1422:	9947      	ldr	r1, [sp, #284]	@ 0x11c
    1424:	4072      	eors	r2, r6
    1426:	9348      	str	r3, [sp, #288]	@ 0x120
    1428:	ea81 010c 	eor.w	r1, r1, ip
    142c:	0113      	lsls	r3, r2, #4
    142e:	ea43 7311 	orr.w	r3, r3, r1, lsr #28
    1432:	0109      	lsls	r1, r1, #4
    1434:	ea41 7112 	orr.w	r1, r1, r2, lsr #28
    1438:	9a27      	ldr	r2, [sp, #156]	@ 0x9c
    143a:	9156      	str	r1, [sp, #344]	@ 0x158
    143c:	9958      	ldr	r1, [sp, #352]	@ 0x160
    143e:	ea82 020e 	eor.w	r2, r2, lr
    1442:	9357      	str	r3, [sp, #348]	@ 0x15c
    1444:	ea81 0109 	eor.w	r1, r1, r9
    1448:	0793      	lsls	r3, r2, #30
    144a:	ea43 0391 	orr.w	r3, r3, r1, lsr #2
    144e:	0789      	lsls	r1, r1, #30
    1450:	ea41 0192 	orr.w	r1, r1, r2, lsr #2
    1454:	9a46      	ldr	r2, [sp, #280]	@ 0x118
    1456:	9154      	str	r1, [sp, #336]	@ 0x150
    1458:	9955      	ldr	r1, [sp, #340]	@ 0x154
    145a:	407a      	eors	r2, r7
    145c:	9347      	str	r3, [sp, #284]	@ 0x11c
    145e:	4061      	eors	r1, r4
    1460:	0393      	lsls	r3, r2, #14
    1462:	ea43 4391 	orr.w	r3, r3, r1, lsr #18
    1466:	0389      	lsls	r1, r1, #14
    1468:	ea41 4192 	orr.w	r1, r1, r2, lsr #18
    146c:	9a3b      	ldr	r2, [sp, #236]	@ 0xec
    146e:	9146      	str	r1, [sp, #280]	@ 0x118
    1470:	9939      	ldr	r1, [sp, #228]	@ 0xe4
    1472:	ea82 0208 	eor.w	r2, r2, r8
    1476:	9327      	str	r3, [sp, #156]	@ 0x9c
    1478:	ea81 010b 	eor.w	r1, r1, fp
    147c:	0553      	lsls	r3, r2, #21
    147e:	ea43 23d1 	orr.w	r3, r3, r1, lsr #11
    1482:	0549      	lsls	r1, r1, #21
    1484:	ea41 21d2 	orr.w	r1, r1, r2, lsr #11
    1488:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
    148a:	9155      	str	r1, [sp, #340]	@ 0x154
    148c:	9941      	ldr	r1, [sp, #260]	@ 0x104
    148e:	933b      	str	r3, [sp, #236]	@ 0xec
    1490:	ea82 0309 	eor.w	r3, r2, r9
    1494:	ea81 010e 	eor.w	r1, r1, lr
    1498:	075a      	lsls	r2, r3, #29
    149a:	ea42 02d1 	orr.w	r2, r2, r1, lsr #3
    149e:	0749      	lsls	r1, r1, #29
    14a0:	9235      	str	r2, [sp, #212]	@ 0xd4
    14a2:	ea41 01d3 	orr.w	r1, r1, r3, lsr #3
    14a6:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
    14a8:	915d      	str	r1, [sp, #372]	@ 0x174
    14aa:	993c      	ldr	r1, [sp, #240]	@ 0xf0
    14ac:	951b      	str	r5, [sp, #108]	@ 0x6c
    14ae:	ea82 050a 	eor.w	r5, r2, sl
    14b2:	4041      	eors	r1, r0
    14b4:	036b      	lsls	r3, r5, #13
    14b6:	ea43 42d1 	orr.w	r2, r3, r1, lsr #19
    14ba:	9241      	str	r2, [sp, #260]	@ 0x104
    14bc:	0349      	lsls	r1, r1, #13
    14be:	9a5a      	ldr	r2, [sp, #360]	@ 0x168
    14c0:	ea41 41d5 	orr.w	r1, r1, r5, lsr #19
    14c4:	913c      	str	r1, [sp, #240]	@ 0xf0
    14c6:	4631      	mov	r1, r6
    14c8:	4056      	eors	r6, r2
    14ca:	9a42      	ldr	r2, [sp, #264]	@ 0x108
    14cc:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
    14ce:	4051      	eors	r1, r2
    14d0:	4662      	mov	r2, ip
    14d2:	ea8c 0c03 	eor.w	ip, ip, r3
    14d6:	9b40      	ldr	r3, [sp, #256]	@ 0x100
    14d8:	f8cd c0e4 	str.w	ip, [sp, #228]	@ 0xe4
    14dc:	4053      	eors	r3, r2
    14de:	049d      	lsls	r5, r3, #18
    14e0:	ea45 3291 	orr.w	r2, r5, r1, lsr #14
    14e4:	0489      	lsls	r1, r1, #18
    14e6:	9258      	str	r2, [sp, #352]	@ 0x160
    14e8:	ea41 3193 	orr.w	r1, r1, r3, lsr #14
    14ec:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
    14ee:	9126      	str	r1, [sp, #152]	@ 0x98
    14f0:	993f      	ldr	r1, [sp, #252]	@ 0xfc
    14f2:	ea82 0304 	eor.w	r3, r2, r4
    14f6:	4079      	eors	r1, r7
    14f8:	021f      	lsls	r7, r3, #8
    14fa:	ea47 6211 	orr.w	r2, r7, r1, lsr #24
    14fe:	0209      	lsls	r1, r1, #8
    1500:	9243      	str	r2, [sp, #268]	@ 0x10c
    1502:	ea41 6113 	orr.w	r1, r1, r3, lsr #24
    1506:	9a52      	ldr	r2, [sp, #328]	@ 0x148
    1508:	9142      	str	r1, [sp, #264]	@ 0x108
    150a:	9944      	ldr	r1, [sp, #272]	@ 0x110
    150c:	ea82 030b 	eor.w	r3, r2, fp
    1510:	ea81 0108 	eor.w	r1, r1, r8
    1514:	061f      	lsls	r7, r3, #24
    1516:	ea47 2211 	orr.w	r2, r7, r1, lsr #8
    151a:	0609      	lsls	r1, r1, #24
    151c:	9225      	str	r2, [sp, #148]	@ 0x94
    151e:	ea41 2113 	orr.w	r1, r1, r3, lsr #8
    1522:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
    1524:	9124      	str	r1, [sp, #144]	@ 0x90
    1526:	9938      	ldr	r1, [sp, #224]	@ 0xe0
    1528:	ea82 030e 	eor.w	r3, r2, lr
    152c:	ea81 0109 	eor.w	r1, r1, r9
    1530:	03df      	lsls	r7, r3, #15
    1532:	ea47 4251 	orr.w	r2, r7, r1, lsr #17
    1536:	03c9      	lsls	r1, r1, #15
    1538:	ea41 4153 	orr.w	r1, r1, r3, lsr #17
    153c:	913f      	str	r1, [sp, #252]	@ 0xfc
    153e:	9945      	ldr	r1, [sp, #276]	@ 0x114
    1540:	9240      	str	r2, [sp, #256]	@ 0x100
    1542:	4048      	eors	r0, r1
    1544:	9953      	ldr	r1, [sp, #332]	@ 0x14c
    1546:	f8dd 80b8 	ldr.w	r8, [sp, #184]	@ 0xb8
    154a:	ea81 010a 	eor.w	r1, r1, sl
    154e:	008b      	lsls	r3, r1, #2
    1550:	ea43 7290 	orr.w	r2, r3, r0, lsr #30
    1554:	0080      	lsls	r0, r0, #2
    1556:	ea40 7091 	orr.w	r0, r0, r1, lsr #30
    155a:	9052      	str	r0, [sp, #328]	@ 0x148
    155c:	9859      	ldr	r0, [sp, #356]	@ 0x164
    155e:	f8dd a0bc 	ldr.w	sl, [sp, #188]	@ 0xbc
    1562:	ea28 0000 	bic.w	r0, r8, r0
    1566:	ea80 000a 	eor.w	r0, r0, sl
    156a:	903e      	str	r0, [sp, #248]	@ 0xf8
    156c:	e9dd 052c 	ldrd	r0, r5, [sp, #176]	@ 0xb0
    1570:	9c30      	ldr	r4, [sp, #192]	@ 0xc0
    1572:	ea25 0000 	bic.w	r0, r5, r0
    1576:	4060      	eors	r0, r4
    1578:	903d      	str	r0, [sp, #244]	@ 0xf4
    157a:	9822      	ldr	r0, [sp, #136]	@ 0x88
    157c:	9950      	ldr	r1, [sp, #320]	@ 0x140
    157e:	ea8c 0c00 	eor.w	ip, ip, r0
    1582:	9821      	ldr	r0, [sp, #132]	@ 0x84
    1584:	f8dd 90a8 	ldr.w	r9, [sp, #168]	@ 0xa8
    1588:	ea80 0e06 	eor.w	lr, r0, r6
    158c:	984e      	ldr	r0, [sp, #312]	@ 0x138
    158e:	9253      	str	r2, [sp, #332]	@ 0x14c
    1590:	ea21 0000 	bic.w	r0, r1, r0
    1594:	992b      	ldr	r1, [sp, #172]	@ 0xac
    1596:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
    1598:	ea81 0300 	eor.w	r3, r1, r0
    159c:	984c      	ldr	r0, [sp, #304]	@ 0x130
    159e:	994a      	ldr	r1, [sp, #296]	@ 0x128
    15a0:	ea29 0000 	bic.w	r0, r9, r0
    15a4:	4042      	eors	r2, r0
    15a6:	9851      	ldr	r0, [sp, #324]	@ 0x144
    15a8:	963a      	str	r6, [sp, #232]	@ 0xe8
    15aa:	9e4f      	ldr	r6, [sp, #316]	@ 0x13c
    15ac:	ea21 0000 	bic.w	r0, r1, r0
    15b0:	ea86 0700 	eor.w	r7, r6, r0
    15b4:	f8dd b0a4 	ldr.w	fp, [sp, #164]	@ 0xa4
    15b8:	985c      	ldr	r0, [sp, #368]	@ 0x170
    15ba:	994b      	ldr	r1, [sp, #300]	@ 0x12c
    15bc:	ea2b 0000 	bic.w	r0, fp, r0
    15c0:	9338      	str	r3, [sp, #224]	@ 0xe0
    15c2:	9215      	str	r2, [sp, #84]	@ 0x54
    15c4:	ea81 0600 	eor.w	r6, r1, r0
    15c8:	ea8c 0003 	eor.w	r0, ip, r3
    15cc:	ea8e 0102 	eor.w	r1, lr, r2
    15d0:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
    15d2:	9a48      	ldr	r2, [sp, #288]	@ 0x120
    15d4:	f8cd c088 	str.w	ip, [sp, #136]	@ 0x88
    15d8:	ea22 0303 	bic.w	r3, r2, r3
    15dc:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
    15de:	961e      	str	r6, [sp, #120]	@ 0x78
    15e0:	4070      	eors	r0, r6
    15e2:	ea82 0603 	eor.w	r6, r2, r3
    15e6:	f8dd c0a0 	ldr.w	ip, [sp, #160]	@ 0xa0
    15ea:	9b56      	ldr	r3, [sp, #344]	@ 0x158
    15ec:	9a49      	ldr	r2, [sp, #292]	@ 0x124
    15ee:	ea2c 0303 	bic.w	r3, ip, r3
    15f2:	4079      	eors	r1, r7
    15f4:	4053      	eors	r3, r2
    15f6:	930f      	str	r3, [sp, #60]	@ 0x3c
    15f8:	4059      	eors	r1, r3
    15fa:	9b53      	ldr	r3, [sp, #332]	@ 0x14c
    15fc:	971d      	str	r7, [sp, #116]	@ 0x74
    15fe:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
    1600:	43ab      	bics	r3, r5
    1602:	407b      	eors	r3, r7
    1604:	9337      	str	r3, [sp, #220]	@ 0xdc
    1606:	ea27 0304 	bic.w	r3, r7, r4
    160a:	9f52      	ldr	r7, [sp, #328]	@ 0x148
    160c:	9c59      	ldr	r4, [sp, #356]	@ 0x164
    160e:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
    1610:	9610      	str	r6, [sp, #64]	@ 0x40
    1612:	4070      	eors	r0, r6
    1614:	ea27 0608 	bic.w	r6, r7, r8
    1618:	9d54      	ldr	r5, [sp, #336]	@ 0x150
    161a:	ea84 0706 	eor.w	r7, r4, r6
    161e:	ea24 060a 	bic.w	r6, r4, sl
    1622:	4053      	eors	r3, r2
    1624:	406e      	eors	r6, r5
    1626:	4058      	eors	r0, r3
    1628:	9045      	str	r0, [sp, #276]	@ 0x114
    162a:	ea81 0006 	eor.w	r0, r1, r6
    162e:	9044      	str	r0, [sp, #272]	@ 0x110
    1630:	f8dd a09c 	ldr.w	sl, [sp, #156]	@ 0x9c
    1634:	983b      	ldr	r0, [sp, #236]	@ 0xec
    1636:	9932      	ldr	r1, [sp, #200]	@ 0xc8
    1638:	ea2a 0000 	bic.w	r0, sl, r0
    163c:	ea81 0400 	eor.w	r4, r1, r0
    1640:	9855      	ldr	r0, [sp, #340]	@ 0x154
    1642:	9946      	ldr	r1, [sp, #280]	@ 0x118
    1644:	9619      	str	r6, [sp, #100]	@ 0x64
    1646:	ea21 0000 	bic.w	r0, r1, r0
    164a:	9931      	ldr	r1, [sp, #196]	@ 0xc4
    164c:	f8cd e084 	str.w	lr, [sp, #132]	@ 0x84
    1650:	ea81 0200 	eor.w	r2, r1, r0
    1654:	9841      	ldr	r0, [sp, #260]	@ 0x104
    1656:	9935      	ldr	r1, [sp, #212]	@ 0xd4
    1658:	9318      	str	r3, [sp, #96]	@ 0x60
    165a:	ea21 0000 	bic.w	r0, r1, r0
    165e:	ea89 0600 	eor.w	r6, r9, r0
    1662:	983c      	ldr	r0, [sp, #240]	@ 0xf0
    1664:	995d      	ldr	r1, [sp, #372]	@ 0x174
    1666:	f8dd e098 	ldr.w	lr, [sp, #152]	@ 0x98
    166a:	ea21 0000 	bic.w	r0, r1, r0
    166e:	9950      	ldr	r1, [sp, #320]	@ 0x140
    1670:	9617      	str	r6, [sp, #92]	@ 0x5c
    1672:	ea81 0500 	eor.w	r5, r1, r0
    1676:	9858      	ldr	r0, [sp, #352]	@ 0x160
    1678:	9943      	ldr	r1, [sp, #268]	@ 0x10c
    167a:	940a      	str	r4, [sp, #40]	@ 0x28
    167c:	4388      	bics	r0, r1
    167e:	ea8b 0300 	eor.w	r3, fp, r0
    1682:	9842      	ldr	r0, [sp, #264]	@ 0x108
    1684:	994a      	ldr	r1, [sp, #296]	@ 0x128
    1686:	ea2e 0000 	bic.w	r0, lr, r0
    168a:	4041      	eors	r1, r0
    168c:	ea84 0006 	eor.w	r0, r4, r6
    1690:	9120      	str	r1, [sp, #128]	@ 0x80
    1692:	4048      	eors	r0, r1
    1694:	ea82 0105 	eor.w	r1, r2, r5
    1698:	931f      	str	r3, [sp, #124]	@ 0x7c
    169a:	4059      	eors	r1, r3
    169c:	9e25      	ldr	r6, [sp, #148]	@ 0x94
    169e:	9b40      	ldr	r3, [sp, #256]	@ 0x100
    16a0:	9209      	str	r2, [sp, #36]	@ 0x24
    16a2:	ea26 0303 	bic.w	r3, r6, r3
    16a6:	ea8c 0403 	eor.w	r4, ip, r3
    16aa:	f8dd c090 	ldr.w	ip, [sp, #144]	@ 0x90
    16ae:	9b3f      	ldr	r3, [sp, #252]	@ 0xfc
    16b0:	9a48      	ldr	r2, [sp, #288]	@ 0x120
    16b2:	ea2c 0303 	bic.w	r3, ip, r3
    16b6:	4060      	eors	r0, r4
    16b8:	4053      	eors	r3, r2
    16ba:	ea80 0b07 	eor.w	fp, r0, r7
    16be:	9837      	ldr	r0, [sp, #220]	@ 0xdc
    16c0:	4059      	eors	r1, r3
    16c2:	9313      	str	r3, [sp, #76]	@ 0x4c
    16c4:	4048      	eors	r0, r1
    16c6:	ea4f 034b 	mov.w	r3, fp, lsl #1
    16ca:	9a44      	ldr	r2, [sp, #272]	@ 0x110
    16cc:	ea43 73d0 	orr.w	r3, r3, r0, lsr #31
    16d0:	0041      	lsls	r1, r0, #1
    16d2:	405a      	eors	r2, r3
    16d4:	9b45      	ldr	r3, [sp, #276]	@ 0x114
    16d6:	ea41 71db 	orr.w	r1, r1, fp, lsr #31
    16da:	4059      	eors	r1, r3
    16dc:	9b3d      	ldr	r3, [sp, #244]	@ 0xf4
    16de:	9159      	str	r1, [sp, #356]	@ 0x164
    16e0:	4059      	eors	r1, r3
    16e2:	9b3e      	ldr	r3, [sp, #248]	@ 0xf8
    16e4:	971c      	str	r7, [sp, #112]	@ 0x70
    16e6:	4053      	eors	r3, r2
    16e8:	009f      	lsls	r7, r3, #2
    16ea:	925a      	str	r2, [sp, #360]	@ 0x168
    16ec:	ea47 7291 	orr.w	r2, r7, r1, lsr #30
    16f0:	0089      	lsls	r1, r1, #2
    16f2:	ea41 7193 	orr.w	r1, r1, r3, lsr #30
    16f6:	920e      	str	r2, [sp, #56]	@ 0x38
    16f8:	910b      	str	r1, [sp, #44]	@ 0x2c
    16fa:	e9dd 1234 	ldrd	r1, r2, [sp, #208]	@ 0xd0
    16fe:	942c      	str	r4, [sp, #176]	@ 0xb0
    1700:	ea21 0302 	bic.w	r3, r1, r2
    1704:	931a      	str	r3, [sp, #104]	@ 0x68
    1706:	9b4c      	ldr	r3, [sp, #304]	@ 0x130
    1708:	f8dd 806c 	ldr.w	r8, [sp, #108]	@ 0x6c
    170c:	438b      	bics	r3, r1
    170e:	ea82 0903 	eor.w	r9, r2, r3
    1712:	992b      	ldr	r1, [sp, #172]	@ 0xac
    1714:	9b5d      	ldr	r3, [sp, #372]	@ 0x174
    1716:	9516      	str	r5, [sp, #88]	@ 0x58
    1718:	ea21 0203 	bic.w	r2, r1, r3
    171c:	9212      	str	r2, [sp, #72]	@ 0x48
    171e:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
    1720:	9d58      	ldr	r5, [sp, #352]	@ 0x160
    1722:	438a      	bics	r2, r1
    1724:	4053      	eors	r3, r2
    1726:	9936      	ldr	r1, [sp, #216]	@ 0xd8
    1728:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
    172a:	9334      	str	r3, [sp, #208]	@ 0xd0
    172c:	ea21 0202 	bic.w	r2, r1, r2
    1730:	ea8a 0402 	eor.w	r4, sl, r2
    1734:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
    1736:	9946      	ldr	r1, [sp, #280]	@ 0x118
    1738:	ea28 0202 	bic.w	r2, r8, r2
    173c:	ea81 0702 	eor.w	r7, r1, r2
    1740:	994b      	ldr	r1, [sp, #300]	@ 0x12c
    1742:	9a5c      	ldr	r2, [sp, #368]	@ 0x170
    1744:	970c      	str	r7, [sp, #48]	@ 0x30
    1746:	438a      	bics	r2, r1
    1748:	4055      	eors	r5, r2
    174a:	9a4f      	ldr	r2, [sp, #316]	@ 0x13c
    174c:	9951      	ldr	r1, [sp, #324]	@ 0x144
    174e:	407b      	eors	r3, r7
    1750:	ea21 0202 	bic.w	r2, r1, r2
    1754:	ea8e 0102 	eor.w	r1, lr, r2
    1758:	ea84 0209 	eor.w	r2, r4, r9
    175c:	9108      	str	r1, [sp, #32]
    175e:	404a      	eors	r2, r1
    1760:	9949      	ldr	r1, [sp, #292]	@ 0x124
    1762:	9f56      	ldr	r7, [sp, #344]	@ 0x158
    1764:	9507      	str	r5, [sp, #28]
    1766:	438f      	bics	r7, r1
    1768:	406b      	eors	r3, r5
    176a:	ea86 0507 	eor.w	r5, r6, r7
    176e:	9f4d      	ldr	r7, [sp, #308]	@ 0x134
    1770:	9957      	ldr	r1, [sp, #348]	@ 0x15c
    1772:	952b      	str	r5, [sp, #172]	@ 0xac
    1774:	ea21 0707 	bic.w	r7, r1, r7
    1778:	ea87 070c 	eor.w	r7, r7, ip
    177c:	ea83 0a07 	eor.w	sl, r3, r7
    1780:	992f      	ldr	r1, [sp, #188]	@ 0xbc
    1782:	9b54      	ldr	r3, [sp, #336]	@ 0x150
    1784:	9714      	str	r7, [sp, #80]	@ 0x50
    1786:	ea21 0703 	bic.w	r7, r1, r3
    178a:	9930      	ldr	r1, [sp, #192]	@ 0xc0
    178c:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
    178e:	406a      	eors	r2, r5
    1790:	ea21 0503 	bic.w	r5, r1, r3
    1794:	9b53      	ldr	r3, [sp, #332]	@ 0x14c
    1796:	9e41      	ldr	r6, [sp, #260]	@ 0x104
    1798:	405d      	eors	r5, r3
    179a:	9b52      	ldr	r3, [sp, #328]	@ 0x148
    179c:	952f      	str	r5, [sp, #188]	@ 0xbc
    179e:	405f      	eors	r7, r3
    17a0:	ea82 0107 	eor.w	r1, r2, r7
    17a4:	ea8a 0205 	eor.w	r2, sl, r5
    17a8:	004b      	lsls	r3, r1, #1
    17aa:	ea43 73d2 	orr.w	r3, r3, r2, lsr #31
    17ae:	ea8b 0503 	eor.w	r5, fp, r3
    17b2:	0053      	lsls	r3, r2, #1
    17b4:	9104      	str	r1, [sp, #16]
    17b6:	ea43 73d1 	orr.w	r3, r3, r1, lsr #31
    17ba:	991a      	ldr	r1, [sp, #104]	@ 0x68
    17bc:	940d      	str	r4, [sp, #52]	@ 0x34
    17be:	9203      	str	r2, [sp, #12]
    17c0:	9c3c      	ldr	r4, [sp, #240]	@ 0xf0
    17c2:	9a12      	ldr	r2, [sp, #72]	@ 0x48
    17c4:	4071      	eors	r1, r6
    17c6:	4058      	eors	r0, r3
    17c8:	4062      	eors	r2, r4
    17ca:	ea81 0305 	eor.w	r3, r1, r5
    17ce:	9730      	str	r7, [sp, #192]	@ 0xc0
    17d0:	905d      	str	r0, [sp, #372]	@ 0x174
    17d2:	4050      	eors	r0, r2
    17d4:	05df      	lsls	r7, r3, #23
    17d6:	9102      	str	r1, [sp, #8]
    17d8:	ea47 2150 	orr.w	r1, r7, r0, lsr #9
    17dc:	05c0      	lsls	r0, r0, #23
    17de:	ea40 2053 	orr.w	r0, r0, r3, lsr #9
    17e2:	9105      	str	r1, [sp, #20]
    17e4:	9006      	str	r0, [sp, #24]
    17e6:	9831      	ldr	r0, [sp, #196]	@ 0xc4
    17e8:	9955      	ldr	r1, [sp, #340]	@ 0x154
    17ea:	f8dd a0ec 	ldr.w	sl, [sp, #236]	@ 0xec
    17ee:	ea21 0000 	bic.w	r0, r1, r0
    17f2:	ea88 0e00 	eor.w	lr, r8, r0
    17f6:	9832      	ldr	r0, [sp, #200]	@ 0xc8
    17f8:	9936      	ldr	r1, [sp, #216]	@ 0xd8
    17fa:	ea2a 0000 	bic.w	r0, sl, r0
    17fe:	ea81 0b00 	eor.w	fp, r1, r0
    1802:	9950      	ldr	r1, [sp, #320]	@ 0x140
    1804:	982a      	ldr	r0, [sp, #168]	@ 0xa8
    1806:	ea24 0301 	bic.w	r3, r4, r1
    180a:	994e      	ldr	r1, [sp, #312]	@ 0x138
    180c:	ea26 0000 	bic.w	r0, r6, r0
    1810:	ea81 0c03 	eor.w	ip, r1, r3
    1814:	994c      	ldr	r1, [sp, #304]	@ 0x130
    1816:	f8cd 90d4 	str.w	r9, [sp, #212]	@ 0xd4
    181a:	ea81 0700 	eor.w	r7, r1, r0
    181e:	f8dd 9108 	ldr.w	r9, [sp, #264]	@ 0x108
    1822:	984a      	ldr	r0, [sp, #296]	@ 0x128
    1824:	9951      	ldr	r1, [sp, #324]	@ 0x144
    1826:	ea29 0000 	bic.w	r0, r9, r0
    182a:	ea81 0300 	eor.w	r3, r1, r0
    182e:	9e43      	ldr	r6, [sp, #268]	@ 0x10c
    1830:	9829      	ldr	r0, [sp, #164]	@ 0xa4
    1832:	995c      	ldr	r1, [sp, #368]	@ 0x170
    1834:	ea26 0000 	bic.w	r0, r6, r0
    1838:	9201      	str	r2, [sp, #4]
    183a:	ea81 0200 	eor.w	r2, r1, r0
    183e:	f8dd 80fc 	ldr.w	r8, [sp, #252]	@ 0xfc
    1842:	9848      	ldr	r0, [sp, #288]	@ 0x120
    1844:	9957      	ldr	r1, [sp, #348]	@ 0x15c
    1846:	ea28 0000 	bic.w	r0, r8, r0
    184a:	4041      	eors	r1, r0
    184c:	9c40      	ldr	r4, [sp, #256]	@ 0x100
    184e:	9828      	ldr	r0, [sp, #160]	@ 0xa0
    1850:	955b      	str	r5, [sp, #364]	@ 0x16c
    1852:	9d56      	ldr	r5, [sp, #344]	@ 0x158
    1854:	ea24 0000 	bic.w	r0, r4, r0
    1858:	4045      	eors	r5, r0
    185a:	ea8e 000c 	eor.w	r0, lr, ip
    185e:	4050      	eors	r0, r2
    1860:	914a      	str	r1, [sp, #296]	@ 0x128
    1862:	4048      	eors	r0, r1
    1864:	993d      	ldr	r1, [sp, #244]	@ 0xf4
    1866:	f8cd c06c 	str.w	ip, [sp, #108]	@ 0x6c
    186a:	4048      	eors	r0, r1
    186c:	904c      	str	r0, [sp, #304]	@ 0x130
    186e:	ea8b 0007 	eor.w	r0, fp, r7
    1872:	4058      	eors	r0, r3
    1874:	993e      	ldr	r1, [sp, #248]	@ 0xf8
    1876:	4068      	eors	r0, r5
    1878:	ea80 0c01 	eor.w	ip, r0, r1
    187c:	9839      	ldr	r0, [sp, #228]	@ 0xe4
    187e:	9946      	ldr	r1, [sp, #280]	@ 0x118
    1880:	934e      	str	r3, [sp, #312]	@ 0x138
    1882:	ea20 0301 	bic.w	r3, r0, r1
    1886:	983a      	ldr	r0, [sp, #232]	@ 0xe8
    1888:	9927      	ldr	r1, [sp, #156]	@ 0x9c
    188a:	9536      	str	r5, [sp, #216]	@ 0xd8
    188c:	ea20 0501 	bic.w	r5, r0, r1
    1890:	9855      	ldr	r0, [sp, #340]	@ 0x154
    1892:	9250      	str	r2, [sp, #320]	@ 0x140
    1894:	ea80 0103 	eor.w	r1, r0, r3
    1898:	984f      	ldr	r0, [sp, #316]	@ 0x13c
    189a:	9a26      	ldr	r2, [sp, #152]	@ 0x98
    189c:	f8cd b044 	str.w	fp, [sp, #68]	@ 0x44
    18a0:	ea20 0302 	bic.w	r3, r0, r2
    18a4:	9858      	ldr	r0, [sp, #352]	@ 0x160
    18a6:	9a4b      	ldr	r2, [sp, #300]	@ 0x12c
    18a8:	ea8a 0b05 	eor.w	fp, sl, r5
    18ac:	ea22 0500 	bic.w	r5, r2, r0
    18b0:	ea89 0003 	eor.w	r0, r9, r3
    18b4:	9b4d      	ldr	r3, [sp, #308]	@ 0x134
    18b6:	9a24      	ldr	r2, [sp, #144]	@ 0x90
    18b8:	f8cd e048 	str.w	lr, [sp, #72]	@ 0x48
    18bc:	ea86 0e05 	eor.w	lr, r6, r5
    18c0:	4393      	bics	r3, r2
    18c2:	9a49      	ldr	r2, [sp, #292]	@ 0x124
    18c4:	9d25      	ldr	r5, [sp, #148]	@ 0x94
    18c6:	971a      	str	r7, [sp, #104]	@ 0x68
    18c8:	ea22 0505 	bic.w	r5, r2, r5
    18cc:	ea88 0703 	eor.w	r7, r8, r3
    18d0:	9b52      	ldr	r3, [sp, #328]	@ 0x148
    18d2:	9a54      	ldr	r2, [sp, #336]	@ 0x150
    18d4:	9e53      	ldr	r6, [sp, #332]	@ 0x14c
    18d6:	ea22 0303 	bic.w	r3, r2, r3
    18da:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
    18dc:	4065      	eors	r5, r4
    18de:	ea22 0406 	bic.w	r4, r2, r6
    18e2:	9e2d      	ldr	r6, [sp, #180]	@ 0xb4
    18e4:	9129      	str	r1, [sp, #164]	@ 0xa4
    18e6:	ea86 0204 	eor.w	r2, r6, r4
    18ea:	9e2e      	ldr	r6, [sp, #184]	@ 0xb8
    18ec:	9527      	str	r5, [sp, #156]	@ 0x9c
    18ee:	ea86 0403 	eor.w	r4, r6, r3
    18f2:	9b01      	ldr	r3, [sp, #4]
    18f4:	9254      	str	r2, [sp, #336]	@ 0x150
    18f6:	404b      	eors	r3, r1
    18f8:	9902      	ldr	r1, [sp, #8]
    18fa:	ea83 030e 	eor.w	r3, r3, lr
    18fe:	ea81 010b 	eor.w	r1, r1, fp
    1902:	4041      	eors	r1, r0
    1904:	407b      	eors	r3, r7
    1906:	4069      	eors	r1, r5
    1908:	4053      	eors	r3, r2
    190a:	ea81 0a04 	eor.w	sl, r1, r4
    190e:	0059      	lsls	r1, r3, #1
    1910:	9d4c      	ldr	r5, [sp, #304]	@ 0x130
    1912:	ea41 71da 	orr.w	r1, r1, sl, lsr #31
    1916:	ea85 0201 	eor.w	r2, r5, r1
    191a:	9909      	ldr	r1, [sp, #36]	@ 0x24
    191c:	ea4f 064a 	mov.w	r6, sl, lsl #1
    1920:	ea46 76d3 	orr.w	r6, r6, r3, lsr #31
    1924:	9257      	str	r2, [sp, #348]	@ 0x15c
    1926:	4051      	eors	r1, r2
    1928:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
    192a:	9056      	str	r0, [sp, #344]	@ 0x158
    192c:	ea8c 0006 	eor.w	r0, ip, r6
    1930:	ea82 0600 	eor.w	r6, r2, r0
    1934:	9726      	str	r7, [sp, #152]	@ 0x98
    1936:	07b7      	lsls	r7, r6, #30
    1938:	f8cd b0a0 	str.w	fp, [sp, #160]	@ 0xa0
    193c:	ea47 0b91 	orr.w	fp, r7, r1, lsr #2
    1940:	0789      	lsls	r1, r1, #30
    1942:	f8cd e144 	str.w	lr, [sp, #324]	@ 0x144
    1946:	ea41 0e96 	orr.w	lr, r1, r6, lsr #2
    194a:	ea4f 064c 	mov.w	r6, ip, lsl #1
    194e:	ea46 77d5 	orr.w	r7, r6, r5, lsr #31
    1952:	006e      	lsls	r6, r5, #1
    1954:	9903      	ldr	r1, [sp, #12]
    1956:	905c      	str	r0, [sp, #368]	@ 0x170
    1958:	ea46 70dc 	orr.w	r0, r6, ip, lsr #31
    195c:	ea81 0900 	eor.w	r9, r1, r0
    1960:	9904      	ldr	r1, [sp, #16]
    1962:	9d10      	ldr	r5, [sp, #64]	@ 0x40
    1964:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
    1966:	4079      	eors	r1, r7
    1968:	ea85 0709 	eor.w	r7, r5, r9
    196c:	404a      	eors	r2, r1
    196e:	0278      	lsls	r0, r7, #9
    1970:	ea40 58d2 	orr.w	r8, r0, r2, lsr #23
    1974:	9845      	ldr	r0, [sp, #276]	@ 0x114
    1976:	9d44      	ldr	r5, [sp, #272]	@ 0x110
    1978:	0252      	lsls	r2, r2, #9
    197a:	0046      	lsls	r6, r0, #1
    197c:	ea42 52d7 	orr.w	r2, r2, r7, lsr #23
    1980:	006f      	lsls	r7, r5, #1
    1982:	ea46 76d5 	orr.w	r6, r6, r5, lsr #31
    1986:	9d07      	ldr	r5, [sp, #28]
    1988:	ea47 77d0 	orr.w	r7, r7, r0, lsr #31
    198c:	ea83 0006 	eor.w	r0, r3, r6
    1990:	9b08      	ldr	r3, [sp, #32]
    1992:	ea8a 0c07 	eor.w	ip, sl, r7
    1996:	ea85 0600 	eor.w	r6, r5, r0
    199a:	9158      	str	r1, [sp, #352]	@ 0x160
    199c:	ea83 030c 	eor.w	r3, r3, ip
    19a0:	01f7      	lsls	r7, r6, #7
    19a2:	9905      	ldr	r1, [sp, #20]
    19a4:	4682      	mov	sl, r0
    19a6:	902e      	str	r0, [sp, #184]	@ 0xb8
    19a8:	ea47 6753 	orr.w	r7, r7, r3, lsr #25
    19ac:	01db      	lsls	r3, r3, #7
    19ae:	980b      	ldr	r0, [sp, #44]	@ 0x2c
    19b0:	ea43 6356 	orr.w	r3, r3, r6, lsr #25
    19b4:	ea21 060b 	bic.w	r6, r1, fp
    19b8:	ea80 0506 	eor.w	r5, r0, r6
    19bc:	ea2b 0600 	bic.w	r6, fp, r0
    19c0:	9555      	str	r5, [sp, #340]	@ 0x154
    19c2:	ea82 0506 	eor.w	r5, r2, r6
    19c6:	ea20 0602 	bic.w	r6, r0, r2
    19ca:	9552      	str	r5, [sp, #328]	@ 0x148
    19cc:	ea83 0506 	eor.w	r5, r3, r6
    19d0:	439a      	bics	r2, r3
    19d2:	9e06      	ldr	r6, [sp, #24]
    19d4:	404a      	eors	r2, r1
    19d6:	980e      	ldr	r0, [sp, #56]	@ 0x38
    19d8:	9253      	str	r2, [sp, #332]	@ 0x14c
    19da:	ea23 0201 	bic.w	r2, r3, r1
    19de:	ea26 030e 	bic.w	r3, r6, lr
    19e2:	4043      	eors	r3, r0
    19e4:	9346      	str	r3, [sp, #280]	@ 0x118
    19e6:	ea2e 0300 	bic.w	r3, lr, r0
    19ea:	ea83 0308 	eor.w	r3, r3, r8
    19ee:	9344      	str	r3, [sp, #272]	@ 0x110
    19f0:	ea20 0308 	bic.w	r3, r0, r8
    19f4:	ea28 0007 	bic.w	r0, r8, r7
    19f8:	4070      	eors	r0, r6
    19fa:	9045      	str	r0, [sp, #276]	@ 0x114
    19fc:	ea27 0006 	bic.w	r0, r7, r6
    1a00:	ea80 000e 	eor.w	r0, r0, lr
    1a04:	9042      	str	r0, [sp, #264]	@ 0x108
    1a06:	ea8b 0002 	eor.w	r0, fp, r2
    1a0a:	995d      	ldr	r1, [sp, #372]	@ 0x174
    1a0c:	9a54      	ldr	r2, [sp, #336]	@ 0x150
    1a0e:	9040      	str	r0, [sp, #256]	@ 0x100
    1a10:	985b      	ldr	r0, [sp, #364]	@ 0x16c
    1a12:	4051      	eors	r1, r2
    1a14:	4060      	eors	r0, r4
    1a16:	060a      	lsls	r2, r1, #24
    1a18:	ea42 2410 	orr.w	r4, r2, r0, lsr #8
    1a1c:	0600      	lsls	r0, r0, #24
    1a1e:	ea40 2811 	orr.w	r8, r0, r1, lsr #8
    1a22:	9915      	ldr	r1, [sp, #84]	@ 0x54
    1a24:	9a58      	ldr	r2, [sp, #352]	@ 0x160
    1a26:	9838      	ldr	r0, [sp, #224]	@ 0xe0
    1a28:	4051      	eors	r1, r2
    1a2a:	ea80 0009 	eor.w	r0, r0, r9
    1a2e:	010a      	lsls	r2, r1, #4
    1a30:	ea42 7b10 	orr.w	fp, r2, r0, lsr #28
    1a34:	0100      	lsls	r0, r0, #4
    1a36:	407b      	eors	r3, r7
    1a38:	ea40 7711 	orr.w	r7, r0, r1, lsr #28
    1a3c:	990c      	ldr	r1, [sp, #48]	@ 0x30
    1a3e:	980d      	ldr	r0, [sp, #52]	@ 0x34
    1a40:	ea81 010a 	eor.w	r1, r1, sl
    1a44:	9341      	str	r3, [sp, #260]	@ 0x104
    1a46:	ea80 000c 	eor.w	r0, r0, ip
    1a4a:	06cb      	lsls	r3, r1, #27
    1a4c:	f8cd 90c8 	str.w	r9, [sp, #200]	@ 0xc8
    1a50:	ea43 1950 	orr.w	r9, r3, r0, lsr #5
    1a54:	06c0      	lsls	r0, r0, #27
    1a56:	9a2c      	ldr	r2, [sp, #176]	@ 0xb0
    1a58:	9b5c      	ldr	r3, [sp, #368]	@ 0x170
    1a5a:	ea40 1151 	orr.w	r1, r0, r1, lsr #5
    1a5e:	f8dd e15c 	ldr.w	lr, [sp, #348]	@ 0x15c
    1a62:	9813      	ldr	r0, [sp, #76]	@ 0x4c
    1a64:	ea82 0603 	eor.w	r6, r2, r3
    1a68:	f8cd c0c4 	str.w	ip, [sp, #196]	@ 0xc4
    1a6c:	9543      	str	r5, [sp, #268]	@ 0x10c
    1a6e:	ea80 000e 	eor.w	r0, r0, lr
    1a72:	03f5      	lsls	r5, r6, #15
    1a74:	f8dd c164 	ldr.w	ip, [sp, #356]	@ 0x164
    1a78:	9a50      	ldr	r2, [sp, #320]	@ 0x140
    1a7a:	ea45 4550 	orr.w	r5, r5, r0, lsr #17
    1a7e:	03c0      	lsls	r0, r0, #15
    1a80:	ea40 4056 	orr.w	r0, r0, r6, lsr #17
    1a84:	ea82 060c 	eor.w	r6, r2, ip
    1a88:	f8dd a168 	ldr.w	sl, [sp, #360]	@ 0x168
    1a8c:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
    1a8e:	ea82 020a 	eor.w	r2, r2, sl
    1a92:	0293      	lsls	r3, r2, #10
    1a94:	ea43 5396 	orr.w	r3, r3, r6, lsr #22
    1a98:	02b6      	lsls	r6, r6, #10
    1a9a:	ea46 5292 	orr.w	r2, r6, r2, lsr #22
    1a9e:	ea27 0601 	bic.w	r6, r7, r1
    1aa2:	4066      	eors	r6, r4
    1aa4:	963f      	str	r6, [sp, #252]	@ 0xfc
    1aa6:	ea21 0604 	bic.w	r6, r1, r4
    1aaa:	43ac      	bics	r4, r5
    1aac:	405c      	eors	r4, r3
    1aae:	943e      	str	r4, [sp, #248]	@ 0xf8
    1ab0:	ea25 0403 	bic.w	r4, r5, r3
    1ab4:	407c      	eors	r4, r7
    1ab6:	943c      	str	r4, [sp, #240]	@ 0xf0
    1ab8:	ea2b 0409 	bic.w	r4, fp, r9
    1abc:	ea84 0408 	eor.w	r4, r4, r8
    1ac0:	943d      	str	r4, [sp, #244]	@ 0xf4
    1ac2:	ea29 0408 	bic.w	r4, r9, r8
    1ac6:	43bb      	bics	r3, r7
    1ac8:	4044      	eors	r4, r0
    1aca:	ea28 0700 	bic.w	r7, r8, r0
    1ace:	4390      	bics	r0, r2
    1ad0:	ea80 000b 	eor.w	r0, r0, fp
    1ad4:	903a      	str	r0, [sp, #232]	@ 0xe8
    1ad6:	ea22 000b 	bic.w	r0, r2, fp
    1ada:	ea80 0009 	eor.w	r0, r0, r9
    1ade:	902a      	str	r0, [sp, #168]	@ 0xa8
    1ae0:	ea81 0003 	eor.w	r0, r1, r3
    1ae4:	902c      	str	r0, [sp, #176]	@ 0xb0
    1ae6:	9818      	ldr	r0, [sp, #96]	@ 0x60
    1ae8:	9932      	ldr	r1, [sp, #200]	@ 0xc8
    1aea:	4057      	eors	r7, r2
    1aec:	4048      	eors	r0, r1
    1aee:	9919      	ldr	r1, [sp, #100]	@ 0x64
    1af0:	9a58      	ldr	r2, [sp, #352]	@ 0x160
    1af2:	9439      	str	r4, [sp, #228]	@ 0xe4
    1af4:	4051      	eors	r1, r2
    1af6:	048a      	lsls	r2, r1, #18
    1af8:	ea42 3490 	orr.w	r4, r2, r0, lsr #14
    1afc:	0480      	lsls	r0, r0, #18
    1afe:	ea40 3891 	orr.w	r8, r0, r1, lsr #14
    1b02:	9817      	ldr	r0, [sp, #92]	@ 0x5c
    1b04:	995c      	ldr	r1, [sp, #368]	@ 0x170
    1b06:	9738      	str	r7, [sp, #224]	@ 0xe0
    1b08:	4048      	eors	r0, r1
    1b0a:	9916      	ldr	r1, [sp, #88]	@ 0x58
    1b0c:	406e      	eors	r6, r5
    1b0e:	ea81 010e 	eor.w	r1, r1, lr
    1b12:	018a      	lsls	r2, r1, #6
    1b14:	ea42 6b90 	orr.w	fp, r2, r0, lsr #26
    1b18:	0180      	lsls	r0, r0, #6
    1b1a:	ea40 6791 	orr.w	r7, r0, r1, lsr #26
    1b1e:	9912      	ldr	r1, [sp, #72]	@ 0x48
    1b20:	9811      	ldr	r0, [sp, #68]	@ 0x44
    1b22:	ea81 010c 	eor.w	r1, r1, ip
    1b26:	ea80 000a 	eor.w	r0, r0, sl
    1b2a:	004b      	lsls	r3, r1, #1
    1b2c:	ea43 79d0 	orr.w	r9, r3, r0, lsr #31
    1b30:	0040      	lsls	r0, r0, #1
    1b32:	9a2b      	ldr	r2, [sp, #172]	@ 0xac
    1b34:	f8dd c0c4 	ldr.w	ip, [sp, #196]	@ 0xc4
    1b38:	ea40 71d1 	orr.w	r1, r0, r1, lsr #31
    1b3c:	9814      	ldr	r0, [sp, #80]	@ 0x50
    1b3e:	f8dd e0b8 	ldr.w	lr, [sp, #184]	@ 0xb8
    1b42:	963b      	str	r6, [sp, #236]	@ 0xec
    1b44:	ea82 060c 	eor.w	r6, r2, ip
    1b48:	ea80 000e 	eor.w	r0, r0, lr
    1b4c:	0235      	lsls	r5, r6, #8
    1b4e:	9a5d      	ldr	r2, [sp, #372]	@ 0x174
    1b50:	9b51      	ldr	r3, [sp, #324]	@ 0x144
    1b52:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
    1b56:	0200      	lsls	r0, r0, #8
    1b58:	ea40 6016 	orr.w	r0, r0, r6, lsr #24
    1b5c:	ea83 0602 	eor.w	r6, r3, r2
    1b60:	f8dd a16c 	ldr.w	sl, [sp, #364]	@ 0x16c
    1b64:	9a56      	ldr	r2, [sp, #344]	@ 0x158
    1b66:	ea82 020a 	eor.w	r2, r2, sl
    1b6a:	0653      	lsls	r3, r2, #25
    1b6c:	ea43 13d6 	orr.w	r3, r3, r6, lsr #7
    1b70:	0676      	lsls	r6, r6, #25
    1b72:	ea46 12d2 	orr.w	r2, r6, r2, lsr #7
    1b76:	ea27 0601 	bic.w	r6, r7, r1
    1b7a:	4066      	eors	r6, r4
    1b7c:	964c      	str	r6, [sp, #304]	@ 0x130
    1b7e:	ea21 0604 	bic.w	r6, r1, r4
    1b82:	43ac      	bics	r4, r5
    1b84:	405c      	eors	r4, r3
    1b86:	944e      	str	r4, [sp, #312]	@ 0x138
    1b88:	ea25 0403 	bic.w	r4, r5, r3
    1b8c:	407c      	eors	r4, r7
    1b8e:	9456      	str	r4, [sp, #344]	@ 0x158
    1b90:	ea2b 0409 	bic.w	r4, fp, r9
    1b94:	ea84 0408 	eor.w	r4, r4, r8
    1b98:	942b      	str	r4, [sp, #172]	@ 0xac
    1b9a:	ea29 0408 	bic.w	r4, r9, r8
    1b9e:	43bb      	bics	r3, r7
    1ba0:	4044      	eors	r4, r0
    1ba2:	ea28 0700 	bic.w	r7, r8, r0
    1ba6:	4390      	bics	r0, r2
    1ba8:	ea80 000b 	eor.w	r0, r0, fp
    1bac:	9048      	str	r0, [sp, #288]	@ 0x120
    1bae:	ea22 000b 	bic.w	r0, r2, fp
    1bb2:	ea80 0009 	eor.w	r0, r0, r9
    1bb6:	9050      	str	r0, [sp, #320]	@ 0x140
    1bb8:	ea81 0003 	eor.w	r0, r1, r3
    1bbc:	904f      	str	r0, [sp, #316]	@ 0x13c
    1bbe:	981c      	ldr	r0, [sp, #112]	@ 0x70
    1bc0:	995c      	ldr	r1, [sp, #368]	@ 0x170
    1bc2:	4057      	eors	r7, r2
    1bc4:	4048      	eors	r0, r1
    1bc6:	9937      	ldr	r1, [sp, #220]	@ 0xdc
    1bc8:	9a57      	ldr	r2, [sp, #348]	@ 0x15c
    1bca:	974b      	str	r7, [sp, #300]	@ 0x12c
    1bcc:	4051      	eors	r1, r2
    1bce:	074a      	lsls	r2, r1, #29
    1bd0:	ea42 07d0 	orr.w	r7, r2, r0, lsr #3
    1bd4:	0740      	lsls	r0, r0, #29
    1bd6:	ea40 08d1 	orr.w	r8, r0, r1, lsr #3
    1bda:	9934      	ldr	r1, [sp, #208]	@ 0xd0
    1bdc:	9835      	ldr	r0, [sp, #212]	@ 0xd4
    1bde:	ea81 010e 	eor.w	r1, r1, lr
    1be2:	ea80 000c 	eor.w	r0, r0, ip
    1be6:	050a      	lsls	r2, r1, #20
    1be8:	ea42 3c10 	orr.w	ip, r2, r0, lsr #12
    1bec:	0500      	lsls	r0, r0, #20
    1bee:	ea40 3211 	orr.w	r2, r0, r1, lsr #12
    1bf2:	9929      	ldr	r1, [sp, #164]	@ 0xa4
    1bf4:	9b5d      	ldr	r3, [sp, #372]	@ 0x174
    1bf6:	9828      	ldr	r0, [sp, #160]	@ 0xa0
    1bf8:	406e      	eors	r6, r5
    1bfa:	4059      	eors	r1, r3
    1bfc:	9654      	str	r6, [sp, #336]	@ 0x150
    1bfe:	ea80 000a 	eor.w	r0, r0, sl
    1c02:	070e      	lsls	r6, r1, #28
    1c04:	ea46 1910 	orr.w	r9, r6, r0, lsr #4
    1c08:	0700      	lsls	r0, r0, #28
    1c0a:	ea40 1111 	orr.w	r1, r0, r1, lsr #4
    1c0e:	9836      	ldr	r0, [sp, #216]	@ 0xd8
    1c10:	9b5a      	ldr	r3, [sp, #360]	@ 0x168
    1c12:	9e59      	ldr	r6, [sp, #356]	@ 0x164
    1c14:	4058      	eors	r0, r3
    1c16:	9b4a      	ldr	r3, [sp, #296]	@ 0x128
    1c18:	f8dd b0c8 	ldr.w	fp, [sp, #200]	@ 0xc8
    1c1c:	405e      	eors	r6, r3
    1c1e:	0375      	lsls	r5, r6, #13
    1c20:	9b1e      	ldr	r3, [sp, #120]	@ 0x78
    1c22:	ea45 45d0 	orr.w	r5, r5, r0, lsr #19
    1c26:	0340      	lsls	r0, r0, #13
    1c28:	ea40 40d6 	orr.w	r0, r0, r6, lsr #19
    1c2c:	ea83 060b 	eor.w	r6, r3, fp
    1c30:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
    1c32:	f8dd a160 	ldr.w	sl, [sp, #352]	@ 0x160
    1c36:	9451      	str	r4, [sp, #324]	@ 0x144
    1c38:	ea83 030a 	eor.w	r3, r3, sl
    1c3c:	00dc      	lsls	r4, r3, #3
    1c3e:	ea44 7456 	orr.w	r4, r4, r6, lsr #29
    1c42:	00f6      	lsls	r6, r6, #3
    1c44:	ea46 7353 	orr.w	r3, r6, r3, lsr #29
    1c48:	ea22 0601 	bic.w	r6, r2, r1
    1c4c:	407e      	eors	r6, r7
    1c4e:	964a      	str	r6, [sp, #296]	@ 0x128
    1c50:	ea21 0607 	bic.w	r6, r1, r7
    1c54:	406e      	eors	r6, r5
    1c56:	9629      	str	r6, [sp, #164]	@ 0xa4
    1c58:	ea27 0605 	bic.w	r6, r7, r5
    1c5c:	43a5      	bics	r5, r4
    1c5e:	4066      	eors	r6, r4
    1c60:	4055      	eors	r5, r2
    1c62:	ea24 0202 	bic.w	r2, r4, r2
    1c66:	ea2c 0409 	bic.w	r4, ip, r9
    1c6a:	ea84 0408 	eor.w	r4, r4, r8
    1c6e:	9435      	str	r4, [sp, #212]	@ 0xd4
    1c70:	ea29 0408 	bic.w	r4, r9, r8
    1c74:	4044      	eors	r4, r0
    1c76:	ea28 0700 	bic.w	r7, r8, r0
    1c7a:	4398      	bics	r0, r3
    1c7c:	ea80 000c 	eor.w	r0, r0, ip
    1c80:	9034      	str	r0, [sp, #208]	@ 0xd0
    1c82:	ea23 000c 	bic.w	r0, r3, ip
    1c86:	ea80 0009 	eor.w	r0, r0, r9
    1c8a:	9047      	str	r0, [sp, #284]	@ 0x11c
    1c8c:	ea81 0002 	eor.w	r0, r1, r2
    1c90:	e9dd 1230 	ldrd	r1, r2, [sp, #192]	@ 0xc0
    1c94:	9037      	str	r0, [sp, #220]	@ 0xdc
    1c96:	982f      	ldr	r0, [sp, #188]	@ 0xbc
    1c98:	4051      	eors	r1, r2
    1c9a:	ea80 000e 	eor.w	r0, r0, lr
    1c9e:	038a      	lsls	r2, r1, #14
    1ca0:	405f      	eors	r7, r3
    1ca2:	ea42 4e90 	orr.w	lr, r2, r0, lsr #18
    1ca6:	0380      	lsls	r0, r0, #14
    1ca8:	9749      	str	r7, [sp, #292]	@ 0x124
    1caa:	ea40 4791 	orr.w	r7, r0, r1, lsr #18
    1cae:	981b      	ldr	r0, [sp, #108]	@ 0x6c
    1cb0:	9959      	ldr	r1, [sp, #356]	@ 0x164
    1cb2:	9a5a      	ldr	r2, [sp, #360]	@ 0x168
    1cb4:	4048      	eors	r0, r1
    1cb6:	991a      	ldr	r1, [sp, #104]	@ 0x68
    1cb8:	9536      	str	r5, [sp, #216]	@ 0xd8
    1cba:	4051      	eors	r1, r2
    1cbc:	030a      	lsls	r2, r1, #12
    1cbe:	ea42 5510 	orr.w	r5, r2, r0, lsr #20
    1cc2:	0300      	lsls	r0, r0, #12
    1cc4:	ea40 5111 	orr.w	r1, r0, r1, lsr #20
    1cc8:	9822      	ldr	r0, [sp, #136]	@ 0x88
    1cca:	9a5d      	ldr	r2, [sp, #372]	@ 0x174
    1ccc:	ea80 080b 	eor.w	r8, r0, fp
    1cd0:	9821      	ldr	r0, [sp, #132]	@ 0x84
    1cd2:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
    1cd4:	ea80 0c0a 	eor.w	ip, r0, sl
    1cd8:	9826      	ldr	r0, [sp, #152]	@ 0x98
    1cda:	9428      	str	r4, [sp, #160]	@ 0xa0
    1cdc:	4042      	eors	r2, r0
    1cde:	9827      	ldr	r0, [sp, #156]	@ 0x9c
    1ce0:	964d      	str	r6, [sp, #308]	@ 0x134
    1ce2:	4058      	eors	r0, r3
    1ce4:	0544      	lsls	r4, r0, #21
    1ce6:	ea44 24d2 	orr.w	r4, r4, r2, lsr #11
    1cea:	0552      	lsls	r2, r2, #21
    1cec:	ea42 20d0 	orr.w	r0, r2, r0, lsr #11
    1cf0:	9a20      	ldr	r2, [sp, #128]	@ 0x80
    1cf2:	9b5c      	ldr	r3, [sp, #368]	@ 0x170
    1cf4:	9e57      	ldr	r6, [sp, #348]	@ 0x15c
    1cf6:	405a      	eors	r2, r3
    1cf8:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
    1cfa:	4073      	eors	r3, r6
    1cfc:	02de      	lsls	r6, r3, #11
    1cfe:	ea46 5652 	orr.w	r6, r6, r2, lsr #21
    1d02:	02d2      	lsls	r2, r2, #11
    1d04:	ea42 5253 	orr.w	r2, r2, r3, lsr #21
    1d08:	ea25 0308 	bic.w	r3, r5, r8
    1d0c:	ea87 0b03 	eor.w	fp, r7, r3
    1d10:	ea28 0307 	bic.w	r3, r8, r7
    1d14:	4043      	eors	r3, r0
    1d16:	935c      	str	r3, [sp, #368]	@ 0x170
    1d18:	ea27 0300 	bic.w	r3, r7, r0
    1d1c:	4390      	bics	r0, r2
    1d1e:	4068      	eors	r0, r5
    1d20:	ea82 0703 	eor.w	r7, r2, r3
    1d24:	905d      	str	r0, [sp, #372]	@ 0x174
    1d26:	ea22 0005 	bic.w	r0, r2, r5
    1d2a:	ea21 020c 	bic.w	r2, r1, ip
    1d2e:	ea8e 0502 	eor.w	r5, lr, r2
    1d32:	ea2c 020e 	bic.w	r2, ip, lr
    1d36:	ea84 0902 	eor.w	r9, r4, r2
    1d3a:	ea2e 0204 	bic.w	r2, lr, r4
    1d3e:	9b33      	ldr	r3, [sp, #204]	@ 0xcc
    1d40:	ea86 0e02 	eor.w	lr, r6, r2
    1d44:	ea24 0206 	bic.w	r2, r4, r6
    1d48:	ea81 0402 	eor.w	r4, r1, r2
    1d4c:	e9d3 2302 	ldrd	r2, r3, [r3, #8]
    1d50:	ea26 0101 	bic.w	r1, r6, r1
    1d54:	4058      	eors	r0, r3
    1d56:	ea80 0008 	eor.w	r0, r0, r8
    1d5a:	905b      	str	r0, [sp, #364]	@ 0x16c
    1d5c:	9823      	ldr	r0, [sp, #140]	@ 0x8c
    1d5e:	4051      	eors	r1, r2
    1d60:	3002      	adds	r0, #2
    1d62:	2818      	cmp	r0, #24
    1d64:	ea81 010c 	eor.w	r1, r1, ip
    1d68:	915a      	str	r1, [sp, #360]	@ 0x168
    1d6a:	f4ff a9eb 	bcc.w	1144 <KeccakF1600_StatePermute+0xf4>
    1d6e:	9800      	ldr	r0, [sp, #0]
    1d70:	9955      	ldr	r1, [sp, #340]	@ 0x154
    1d72:	9a46      	ldr	r2, [sp, #280]	@ 0x118
    1d74:	e9c0 7905 	strd	r7, r9, [r0, #20]
    1d78:	e9c0 2130 	strd	r2, r1, [r0, #192]	@ 0xc0
    1d7c:	995a      	ldr	r1, [sp, #360]	@ 0x168
    1d7e:	f100 021c 	add.w	r2, r0, #28
    1d82:	6001      	str	r1, [r0, #0]
    1d84:	995b      	ldr	r1, [sp, #364]	@ 0x16c
    1d86:	e9c0 1401 	strd	r1, r4, [r0, #4]
    1d8a:	995d      	ldr	r1, [sp, #372]	@ 0x174
    1d8c:	e9c0 1e03 	strd	r1, lr, [r0, #12]
    1d90:	995c      	ldr	r1, [sp, #368]	@ 0x170
    1d92:	e882 0822 	stmia.w	r2, {r1, r5, fp}
    1d96:	9937      	ldr	r1, [sp, #220]	@ 0xdc
    1d98:	6281      	str	r1, [r0, #40]	@ 0x28
    1d9a:	9947      	ldr	r1, [sp, #284]	@ 0x11c
    1d9c:	62c1      	str	r1, [r0, #44]	@ 0x2c
    1d9e:	9936      	ldr	r1, [sp, #216]	@ 0xd8
    1da0:	6301      	str	r1, [r0, #48]	@ 0x30
    1da2:	9934      	ldr	r1, [sp, #208]	@ 0xd0
    1da4:	6341      	str	r1, [r0, #52]	@ 0x34
    1da6:	994d      	ldr	r1, [sp, #308]	@ 0x134
    1da8:	6381      	str	r1, [r0, #56]	@ 0x38
    1daa:	9949      	ldr	r1, [sp, #292]	@ 0x124
    1dac:	63c1      	str	r1, [r0, #60]	@ 0x3c
    1dae:	9929      	ldr	r1, [sp, #164]	@ 0xa4
    1db0:	6401      	str	r1, [r0, #64]	@ 0x40
    1db2:	9928      	ldr	r1, [sp, #160]	@ 0xa0
    1db4:	6441      	str	r1, [r0, #68]	@ 0x44
    1db6:	994a      	ldr	r1, [sp, #296]	@ 0x128
    1db8:	6481      	str	r1, [r0, #72]	@ 0x48
    1dba:	9935      	ldr	r1, [sp, #212]	@ 0xd4
    1dbc:	64c1      	str	r1, [r0, #76]	@ 0x4c
    1dbe:	994f      	ldr	r1, [sp, #316]	@ 0x13c
    1dc0:	6501      	str	r1, [r0, #80]	@ 0x50
    1dc2:	9950      	ldr	r1, [sp, #320]	@ 0x140
    1dc4:	6541      	str	r1, [r0, #84]	@ 0x54
    1dc6:	9956      	ldr	r1, [sp, #344]	@ 0x158
    1dc8:	6581      	str	r1, [r0, #88]	@ 0x58
    1dca:	9948      	ldr	r1, [sp, #288]	@ 0x120
    1dcc:	65c1      	str	r1, [r0, #92]	@ 0x5c
    1dce:	994e      	ldr	r1, [sp, #312]	@ 0x138
    1dd0:	6601      	str	r1, [r0, #96]	@ 0x60
    1dd2:	994b      	ldr	r1, [sp, #300]	@ 0x12c
    1dd4:	6641      	str	r1, [r0, #100]	@ 0x64
    1dd6:	9954      	ldr	r1, [sp, #336]	@ 0x150
    1dd8:	6681      	str	r1, [r0, #104]	@ 0x68
    1dda:	9951      	ldr	r1, [sp, #324]	@ 0x144
    1ddc:	66c1      	str	r1, [r0, #108]	@ 0x6c
    1dde:	994c      	ldr	r1, [sp, #304]	@ 0x130
    1de0:	6701      	str	r1, [r0, #112]	@ 0x70
    1de2:	992b      	ldr	r1, [sp, #172]	@ 0xac
    1de4:	6741      	str	r1, [r0, #116]	@ 0x74
    1de6:	992c      	ldr	r1, [sp, #176]	@ 0xb0
    1de8:	6781      	str	r1, [r0, #120]	@ 0x78
    1dea:	992a      	ldr	r1, [sp, #168]	@ 0xa8
    1dec:	67c1      	str	r1, [r0, #124]	@ 0x7c
    1dee:	993c      	ldr	r1, [sp, #240]	@ 0xf0
    1df0:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
    1df4:	993a      	ldr	r1, [sp, #232]	@ 0xe8
    1df6:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
    1dfa:	993e      	ldr	r1, [sp, #248]	@ 0xf8
    1dfc:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
    1e00:	9938      	ldr	r1, [sp, #224]	@ 0xe0
    1e02:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
    1e06:	993b      	ldr	r1, [sp, #236]	@ 0xec
    1e08:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
    1e0c:	9939      	ldr	r1, [sp, #228]	@ 0xe4
    1e0e:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
    1e12:	993f      	ldr	r1, [sp, #252]	@ 0xfc
    1e14:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
    1e18:	993d      	ldr	r1, [sp, #244]	@ 0xf4
    1e1a:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
    1e1e:	9942      	ldr	r1, [sp, #264]	@ 0x108
    1e20:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
    1e24:	9940      	ldr	r1, [sp, #256]	@ 0x100
    1e26:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
    1e2a:	9945      	ldr	r1, [sp, #276]	@ 0x114
    1e2c:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
    1e30:	9953      	ldr	r1, [sp, #332]	@ 0x14c
    1e32:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
    1e36:	9941      	ldr	r1, [sp, #260]	@ 0x104
    1e38:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
    1e3c:	9943      	ldr	r1, [sp, #268]	@ 0x10c
    1e3e:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
    1e42:	9944      	ldr	r1, [sp, #272]	@ 0x110
    1e44:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
    1e48:	9952      	ldr	r1, [sp, #328]	@ 0x148
    1e4a:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
    1e4e:	b05e      	add	sp, #376	@ 0x178
    1e50:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00001e54 <pqcrystals_dilithium_fips202_ref_shake128_finalize>:
    1e54:	b5b0      	push	{r4, r5, r7, lr}
    1e56:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
    1e5a:	22a8      	movs	r2, #168	@ 0xa8
    1e5c:	231f      	movs	r3, #31
    1e5e:	4604      	mov	r4, r0
    1e60:	25a8      	movs	r5, #168	@ 0xa8
    1e62:	f000 f805 	bl	1e70 <keccak_finalize>
    1e66:	2000      	movs	r0, #0
    1e68:	e9c4 5032 	strd	r5, r0, [r4, #200]	@ 0xc8
    1e6c:	bdb0      	pop	{r4, r5, r7, pc}
    1e6e:	bf00      	nop

00001e70 <keccak_finalize>:
    1e70:	b5b0      	push	{r4, r5, r7, lr}
    1e72:	2338      	movs	r3, #56	@ 0x38
    1e74:	ea03 03c1 	and.w	r3, r3, r1, lsl #3
    1e78:	f04f 0e1f 	mov.w	lr, #31
    1e7c:	f1c3 0420 	rsb	r4, r3, #32
    1e80:	f1b3 0c20 	subs.w	ip, r3, #32
    1e84:	fa2e f404 	lsr.w	r4, lr, r4
    1e88:	fa0e f303 	lsl.w	r3, lr, r3
    1e8c:	f021 0107 	bic.w	r1, r1, #7
    1e90:	bf58      	it	pl
    1e92:	fa0e f40c 	lslpl.w	r4, lr, ip
    1e96:	bf58      	it	pl
    1e98:	2300      	movpl	r3, #0
    1e9a:	eb00 0c01 	add.w	ip, r0, r1
    1e9e:	5845      	ldr	r5, [r0, r1]
    1ea0:	f8dc e004 	ldr.w	lr, [ip, #4]
    1ea4:	406b      	eors	r3, r5
    1ea6:	ea84 040e 	eor.w	r4, r4, lr
    1eaa:	5043      	str	r3, [r0, r1]
    1eac:	f022 0107 	bic.w	r1, r2, #7
    1eb0:	f8cc 4004 	str.w	r4, [ip, #4]
    1eb4:	4408      	add	r0, r1
    1eb6:	f850 1c04 	ldr.w	r1, [r0, #-4]
    1eba:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
    1ebe:	f840 1c04 	str.w	r1, [r0, #-4]
    1ec2:	bdb0      	pop	{r4, r5, r7, pc}

00001ec4 <keccak_squeeze>:
    1ec4:	2900      	cmp	r1, #0
    1ec6:	d041      	beq.n	1f4c <keccak_squeeze+0x88>
    1ec8:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1ecc:	b081      	sub	sp, #4
    1ece:	f8dd 9020 	ldr.w	r9, [sp, #32]
    1ed2:	4614      	mov	r4, r2
    1ed4:	4688      	mov	r8, r1
    1ed6:	4606      	mov	r6, r0
    1ed8:	e006      	b.n	1ee8 <keccak_squeeze+0x24>
    1eda:	bf00      	nop
    1edc:	4663      	mov	r3, ip
    1ede:	ebac 0003 	sub.w	r0, ip, r3
    1ee2:	eb18 0800 	adds.w	r8, r8, r0
    1ee6:	d02e      	beq.n	1f46 <keccak_squeeze+0x82>
    1ee8:	454b      	cmp	r3, r9
    1eea:	469c      	mov	ip, r3
    1eec:	d104      	bne.n	1ef8 <keccak_squeeze+0x34>
    1eee:	4620      	mov	r0, r4
    1ef0:	f7ff f8ae 	bl	1050 <KeccakF1600_StatePermute>
    1ef4:	f04f 0c00 	mov.w	ip, #0
    1ef8:	45cc      	cmp	ip, r9
    1efa:	d2ef      	bcs.n	1edc <keccak_squeeze+0x18>
    1efc:	eb0c 0e08 	add.w	lr, ip, r8
    1f00:	45f4      	cmp	ip, lr
    1f02:	d2eb      	bcs.n	1edc <keccak_squeeze+0x18>
    1f04:	ea4f 02cc 	mov.w	r2, ip, lsl #3
    1f08:	4663      	mov	r3, ip
    1f0a:	bf00      	nop
    1f0c:	f023 0507 	bic.w	r5, r3, #7
    1f10:	1960      	adds	r0, r4, r5
    1f12:	6840      	ldr	r0, [r0, #4]
    1f14:	5965      	ldr	r5, [r4, r5]
    1f16:	f002 0738 	and.w	r7, r2, #56	@ 0x38
    1f1a:	f1c7 0120 	rsb	r1, r7, #32
    1f1e:	40fd      	lsrs	r5, r7
    1f20:	fa00 f101 	lsl.w	r1, r0, r1
    1f24:	4329      	orrs	r1, r5
    1f26:	f1b7 0520 	subs.w	r5, r7, #32
    1f2a:	f103 0301 	add.w	r3, r3, #1
    1f2e:	bf58      	it	pl
    1f30:	fa20 f105 	lsrpl.w	r1, r0, r5
    1f34:	454b      	cmp	r3, r9
    1f36:	f806 1b01 	strb.w	r1, [r6], #1
    1f3a:	d2d0      	bcs.n	1ede <keccak_squeeze+0x1a>
    1f3c:	4573      	cmp	r3, lr
    1f3e:	f102 0208 	add.w	r2, r2, #8
    1f42:	d3e3      	bcc.n	1f0c <keccak_squeeze+0x48>
    1f44:	e7cb      	b.n	1ede <keccak_squeeze+0x1a>
    1f46:	b001      	add	sp, #4
    1f48:	e8bd 43f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1f4c:	4618      	mov	r0, r3
    1f4e:	4770      	bx	lr

00001f50 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>:
    1f50:	b580      	push	{r7, lr}
    1f52:	23a8      	movs	r3, #168	@ 0xa8
    1f54:	f000 f802 	bl	1f5c <keccak_squeezeblocks>
    1f58:	bd80      	pop	{r7, pc}
    1f5a:	bf00      	nop

00001f5c <keccak_squeezeblocks>:
    1f5c:	2900      	cmp	r1, #0
    1f5e:	bf08      	it	eq
    1f60:	4770      	bxeq	lr
    1f62:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1f66:	b081      	sub	sp, #4
    1f68:	4607      	mov	r7, r0
    1f6a:	08d8      	lsrs	r0, r3, #3
    1f6c:	4698      	mov	r8, r3
    1f6e:	4615      	mov	r5, r2
    1f70:	4689      	mov	r9, r1
    1f72:	00c4      	lsls	r4, r0, #3
    1f74:	4628      	mov	r0, r5
    1f76:	f7ff f86b 	bl	1050 <KeccakF1600_StatePermute>
    1f7a:	2600      	movs	r6, #0
    1f7c:	19a8      	adds	r0, r5, r6
    1f7e:	59aa      	ldr	r2, [r5, r6]
    1f80:	6843      	ldr	r3, [r0, #4]
    1f82:	19b8      	adds	r0, r7, r6
    1f84:	f000 f80c 	bl	1fa0 <store64>
    1f88:	3608      	adds	r6, #8
    1f8a:	42b4      	cmp	r4, r6
    1f8c:	d1f6      	bne.n	1f7c <keccak_squeezeblocks+0x20>
    1f8e:	f1b9 0901 	subs.w	r9, r9, #1
    1f92:	4447      	add	r7, r8
    1f94:	d1ee      	bne.n	1f74 <keccak_squeezeblocks+0x18>
    1f96:	b001      	add	sp, #4
    1f98:	e8bd 43f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1f9c:	4770      	bx	lr
    1f9e:	bf00      	nop

00001fa0 <store64>:
    1fa0:	b580      	push	{r7, lr}
    1fa2:	f1a0 0e01 	sub.w	lr, r0, #1
    1fa6:	2100      	movs	r1, #0
    1fa8:	f1c1 0020 	rsb	r0, r1, #32
    1fac:	fa22 fc01 	lsr.w	ip, r2, r1
    1fb0:	fa03 f000 	lsl.w	r0, r3, r0
    1fb4:	ea4c 0c00 	orr.w	ip, ip, r0
    1fb8:	f1b1 0020 	subs.w	r0, r1, #32
    1fbc:	f101 0108 	add.w	r1, r1, #8
    1fc0:	bf58      	it	pl
    1fc2:	fa23 fc00 	lsrpl.w	ip, r3, r0
    1fc6:	2940      	cmp	r1, #64	@ 0x40
    1fc8:	f80e cf01 	strb.w	ip, [lr, #1]!
    1fcc:	d1ec      	bne.n	1fa8 <store64+0x8>
    1fce:	bd80      	pop	{r7, pc}

00001fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>:
    1fd0:	b510      	push	{r4, lr}
    1fd2:	4604      	mov	r4, r0
    1fd4:	f7fe ffaa 	bl	f2c <keccak_init>
    1fd8:	2000      	movs	r0, #0
    1fda:	e9c4 0032 	strd	r0, r0, [r4, #200]	@ 0xc8
    1fde:	bd10      	pop	{r4, pc}

00001fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>:
    1fe0:	b510      	push	{r4, lr}
    1fe2:	b082      	sub	sp, #8
    1fe4:	4694      	mov	ip, r2
    1fe6:	f8d0 20c8 	ldr.w	r2, [r0, #200]	@ 0xc8
    1fea:	460b      	mov	r3, r1
    1fec:	4611      	mov	r1, r2
    1fee:	2288      	movs	r2, #136	@ 0x88
    1ff0:	4604      	mov	r4, r0
    1ff2:	f8cd c000 	str.w	ip, [sp]
    1ff6:	f7fe ffb5 	bl	f64 <keccak_absorb>
    1ffa:	2100      	movs	r1, #0
    1ffc:	e9c4 0132 	strd	r0, r1, [r4, #200]	@ 0xc8
    2000:	b002      	add	sp, #8
    2002:	bd10      	pop	{r4, pc}

00002004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>:
    2004:	b5b0      	push	{r4, r5, r7, lr}
    2006:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
    200a:	2288      	movs	r2, #136	@ 0x88
    200c:	231f      	movs	r3, #31
    200e:	4604      	mov	r4, r0
    2010:	2588      	movs	r5, #136	@ 0x88
    2012:	f7ff ff2d 	bl	1e70 <keccak_finalize>
    2016:	2000      	movs	r0, #0
    2018:	e9c4 5032 	strd	r5, r0, [r4, #200]	@ 0xc8
    201c:	bdb0      	pop	{r4, r5, r7, pc}
    201e:	bf00      	nop

00002020 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>:
    2020:	b510      	push	{r4, lr}
    2022:	b082      	sub	sp, #8
    2024:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
    2028:	f04f 0c88 	mov.w	ip, #136	@ 0x88
    202c:	4614      	mov	r4, r2
    202e:	f8cd c000 	str.w	ip, [sp]
    2032:	f7ff ff47 	bl	1ec4 <keccak_squeeze>
    2036:	2100      	movs	r1, #0
    2038:	e9c4 0132 	strd	r0, r1, [r4, #200]	@ 0xc8
    203c:	b002      	add	sp, #8
    203e:	bd10      	pop	{r4, pc}

00002040 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>:
    2040:	b580      	push	{r7, lr}
    2042:	2388      	movs	r3, #136	@ 0x88
    2044:	f7ff ff8a 	bl	1f5c <keccak_squeezeblocks>
    2048:	bd80      	pop	{r7, pc}
    204a:	bf00      	nop

0000204c <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>:
    204c:	b5b0      	push	{r4, r5, r7, lr}
    204e:	b082      	sub	sp, #8
    2050:	460c      	mov	r4, r1
    2052:	4605      	mov	r5, r0
    2054:	f8ad 2006 	strh.w	r2, [sp, #6]
    2058:	f7fe ff60 	bl	f1c <pqcrystals_dilithium_fips202_ref_shake128_init>
    205c:	4628      	mov	r0, r5
    205e:	4621      	mov	r1, r4
    2060:	2220      	movs	r2, #32
    2062:	f7fe ff6d 	bl	f40 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
    2066:	f10d 0106 	add.w	r1, sp, #6
    206a:	4628      	mov	r0, r5
    206c:	2202      	movs	r2, #2
    206e:	f7fe ff67 	bl	f40 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
    2072:	4628      	mov	r0, r5
    2074:	f7ff feee 	bl	1e54 <pqcrystals_dilithium_fips202_ref_shake128_finalize>
    2078:	b002      	add	sp, #8
    207a:	bdb0      	pop	{r4, r5, r7, pc}

0000207c <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>:
    207c:	b5b0      	push	{r4, r5, r7, lr}
    207e:	b082      	sub	sp, #8
    2080:	460c      	mov	r4, r1
    2082:	4605      	mov	r5, r0
    2084:	f8ad 2006 	strh.w	r2, [sp, #6]
    2088:	f7ff ffa2 	bl	1fd0 <pqcrystals_dilithium_fips202_ref_shake256_init>
    208c:	4628      	mov	r0, r5
    208e:	4621      	mov	r1, r4
    2090:	2240      	movs	r2, #64	@ 0x40
    2092:	f7ff ffa5 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
    2096:	f10d 0106 	add.w	r1, sp, #6
    209a:	4628      	mov	r0, r5
    209c:	2202      	movs	r2, #2
    209e:	f7ff ff9f 	bl	1fe0 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
    20a2:	4628      	mov	r0, r5
    20a4:	f7ff ffae 	bl	2004 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
    20a8:	b002      	add	sp, #8
    20aa:	bdb0      	pop	{r4, r5, r7, pc}

000020ac <pqcrystals_dilithium2_ref_unpack_sk>:
    20ac:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    20b0:	b081      	sub	sp, #4
    20b2:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
    20b6:	e9dd 6508 	ldrd	r6, r5, [sp, #32]
    20ba:	4699      	mov	r9, r3
    20bc:	3801      	subs	r0, #1
    20be:	f1a8 0301 	sub.w	r3, r8, #1
    20c2:	2720      	movs	r7, #32
    20c4:	f813 4f01 	ldrb.w	r4, [r3, #1]!
    20c8:	3f01      	subs	r7, #1
    20ca:	f800 4f01 	strb.w	r4, [r0, #1]!
    20ce:	d1f9      	bne.n	20c4 <pqcrystals_dilithium2_ref_unpack_sk+0x18>
    20d0:	1e50      	subs	r0, r2, #1
    20d2:	f108 021f 	add.w	r2, r8, #31
    20d6:	2320      	movs	r3, #32
    20d8:	f812 7f01 	ldrb.w	r7, [r2, #1]!
    20dc:	3b01      	subs	r3, #1
    20de:	f800 7f01 	strb.w	r7, [r0, #1]!
    20e2:	d1f9      	bne.n	20d8 <pqcrystals_dilithium2_ref_unpack_sk+0x2c>
    20e4:	1e48      	subs	r0, r1, #1
    20e6:	f108 013f 	add.w	r1, r8, #63	@ 0x3f
    20ea:	2240      	movs	r2, #64	@ 0x40
    20ec:	f811 3f01 	ldrb.w	r3, [r1, #1]!
    20f0:	3a01      	subs	r2, #1
    20f2:	f800 3f01 	strb.w	r3, [r0, #1]!
    20f6:	d1f9      	bne.n	20ec <pqcrystals_dilithium2_ref_unpack_sk+0x40>
    20f8:	2780      	movs	r7, #128	@ 0x80
    20fa:	bf00      	nop
    20fc:	eb08 0107 	add.w	r1, r8, r7
    2100:	4630      	mov	r0, r6
    2102:	f7fe fd1b 	bl	b3c <pqcrystals_dilithium2_ref_polyeta_unpack>
    2106:	3760      	adds	r7, #96	@ 0x60
    2108:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
    210c:	f506 6680 	add.w	r6, r6, #1024	@ 0x400
    2110:	d1f4      	bne.n	20fc <pqcrystals_dilithium2_ref_unpack_sk+0x50>
    2112:	f508 7600 	add.w	r6, r8, #512	@ 0x200
    2116:	2700      	movs	r7, #0
    2118:	19f1      	adds	r1, r6, r7
    211a:	4628      	mov	r0, r5
    211c:	f7fe fd0e 	bl	b3c <pqcrystals_dilithium2_ref_polyeta_unpack>
    2120:	3760      	adds	r7, #96	@ 0x60
    2122:	f5b7 7fc0 	cmp.w	r7, #384	@ 0x180
    2126:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
    212a:	d1f5      	bne.n	2118 <pqcrystals_dilithium2_ref_unpack_sk+0x6c>
    212c:	f508 7560 	add.w	r5, r8, #896	@ 0x380
    2130:	2600      	movs	r6, #0
    2132:	bf00      	nop
    2134:	19a9      	adds	r1, r5, r6
    2136:	4648      	mov	r0, r9
    2138:	f7fe fd56 	bl	be8 <pqcrystals_dilithium2_ref_polyt0_unpack>
    213c:	f506 76d0 	add.w	r6, r6, #416	@ 0x1a0
    2140:	f5b6 6fd0 	cmp.w	r6, #1664	@ 0x680
    2144:	f509 6980 	add.w	r9, r9, #1024	@ 0x400
    2148:	d1f4      	bne.n	2134 <pqcrystals_dilithium2_ref_unpack_sk+0x88>
    214a:	b001      	add	sp, #4
    214c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

00002150 <pqcrystals_dilithium2_ref_pack_sig>:
    2150:	b5f0      	push	{r4, r5, r6, r7, lr}
    2152:	b081      	sub	sp, #4
    2154:	461c      	mov	r4, r3
    2156:	4616      	mov	r6, r2
    2158:	4605      	mov	r5, r0
    215a:	3801      	subs	r0, #1
    215c:	3901      	subs	r1, #1
    215e:	2220      	movs	r2, #32
    2160:	f811 3f01 	ldrb.w	r3, [r1, #1]!
    2164:	3a01      	subs	r2, #1
    2166:	f800 3f01 	strb.w	r3, [r0, #1]!
    216a:	d1f9      	bne.n	2160 <pqcrystals_dilithium2_ref_pack_sig+0x10>
    216c:	2720      	movs	r7, #32
    216e:	bf00      	nop
    2170:	19e8      	adds	r0, r5, r7
    2172:	4631      	mov	r1, r6
    2174:	f7fe fde2 	bl	d3c <pqcrystals_dilithium2_ref_polyz_pack>
    2178:	f507 7710 	add.w	r7, r7, #576	@ 0x240
    217c:	f5b7 6f12 	cmp.w	r7, #2336	@ 0x920
    2180:	f506 6680 	add.w	r6, r6, #1024	@ 0x400
    2184:	d1f4      	bne.n	2170 <pqcrystals_dilithium2_ref_pack_sig+0x20>
    2186:	f505 6012 	add.w	r0, r5, #2336	@ 0x920
    218a:	f605 111f 	addw	r1, r5, #2335	@ 0x91f
    218e:	2254      	movs	r2, #84	@ 0x54
    2190:	2300      	movs	r3, #0
    2192:	bf00      	nop
    2194:	3a01      	subs	r2, #1
    2196:	f801 3f01 	strb.w	r3, [r1, #1]!
    219a:	d1fb      	bne.n	2194 <pqcrystals_dilithium2_ref_pack_sig+0x44>
    219c:	2100      	movs	r1, #0
    219e:	2200      	movs	r2, #0
    21a0:	2300      	movs	r3, #0
    21a2:	bf00      	nop
    21a4:	f854 7023 	ldr.w	r7, [r4, r3, lsl #2]
    21a8:	2f00      	cmp	r7, #0
    21aa:	bf1c      	itt	ne
    21ac:	5443      	strbne	r3, [r0, r1]
    21ae:	3101      	addne	r1, #1
    21b0:	3301      	adds	r3, #1
    21b2:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
    21b6:	d1f5      	bne.n	21a4 <pqcrystals_dilithium2_ref_pack_sig+0x54>
    21b8:	1883      	adds	r3, r0, r2
    21ba:	3201      	adds	r2, #1
    21bc:	2a04      	cmp	r2, #4
    21be:	f504 6480 	add.w	r4, r4, #1024	@ 0x400
    21c2:	f883 1050 	strb.w	r1, [r3, #80]	@ 0x50
    21c6:	d1eb      	bne.n	21a0 <pqcrystals_dilithium2_ref_pack_sig+0x50>
    21c8:	b001      	add	sp, #4
    21ca:	bdf0      	pop	{r4, r5, r6, r7, pc}

000021cc <pqcrystals_dilithium2_ref_decompose>:
    21cc:	4602      	mov	r2, r0
    21ce:	f101 007f 	add.w	r0, r1, #127	@ 0x7f
    21d2:	11c0      	asrs	r0, r0, #7
    21d4:	f642 430b 	movw	r3, #11275	@ 0x2c0b
    21d8:	4358      	muls	r0, r3
    21da:	f500 0000 	add.w	r0, r0, #8388608	@ 0x800000
    21de:	f641 0300 	movw	r3, #6144	@ 0x1800
    21e2:	1600      	asrs	r0, r0, #24
    21e4:	f6cf 73fd 	movt	r3, #65533	@ 0xfffd
    21e8:	282b      	cmp	r0, #43	@ 0x2b
    21ea:	bfc8      	it	gt
    21ec:	2000      	movgt	r0, #0
    21ee:	fb00 1103 	mla	r1, r0, r3, r1
    21f2:	f24f 0300 	movw	r3, #61440	@ 0xf000
    21f6:	f641 7cff 	movw	ip, #8191	@ 0x1fff
    21fa:	f2c0 033f 	movt	r3, #63	@ 0x3f
    21fe:	f6cf 7c80 	movt	ip, #65408	@ 0xff80
    2202:	4299      	cmp	r1, r3
    2204:	bfc8      	it	gt
    2206:	4461      	addgt	r1, ip
    2208:	6011      	str	r1, [r2, #0]
    220a:	4770      	bx	lr

0000220c <pqcrystals_dilithium2_ref_make_hint>:
    220c:	f46f 32ba 	mvn.w	r2, #95232	@ 0x17400
    2210:	4402      	add	r2, r0
    2212:	f500 30ba 	add.w	r0, r0, #95232	@ 0x17400
    2216:	f46f 333a 	mvn.w	r3, #190464	@ 0x2e800
    221a:	fab0 f080 	clz	r0, r0
    221e:	429a      	cmp	r2, r3
    2220:	f04f 0200 	mov.w	r2, #0
    2224:	ea4f 1050 	mov.w	r0, r0, lsr #5
    2228:	bf38      	it	cc
    222a:	2201      	movcc	r2, #1
    222c:	2900      	cmp	r1, #0
    222e:	bf18      	it	ne
    2230:	2101      	movne	r1, #1
    2232:	4008      	ands	r0, r1
    2234:	4310      	orrs	r0, r2
    2236:	4770      	bx	lr

00002238 <main>:
    2238:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    223c:	af03      	add	r7, sp, #12
    223e:	f5ad 5df6 	sub.w	sp, sp, #7872	@ 0x1ec0
    2242:	b083      	sub	sp, #12
    2244:	466c      	mov	r4, sp
    2246:	f36f 0403 	bfc	r4, #0, #4
    224a:	46a5      	mov	sp, r4
    224c:	f10d 0e10 	add.w	lr, sp, #16
    2250:	f50e 58a8 	add.w	r8, lr, #5376	@ 0x1500
    2254:	4640      	mov	r0, r8
    2256:	2100      	movs	r1, #0
    2258:	f640 12af 	movw	r2, #2479	@ 0x9af
    225c:	f04f 0b00 	mov.w	fp, #0
    2260:	f000 f836 	bl	22d0 <dilithium_memset>
    2264:	f50d 59a8 	add.w	r9, sp, #5376	@ 0x1500
    2268:	4648      	mov	r0, r9
    226a:	2100      	movs	r1, #0
    226c:	2204      	movs	r2, #4
    226e:	f000 f82f 	bl	22d0 <dilithium_memset>
    2272:	f50d 6a35 	add.w	sl, sp, #2896	@ 0xb50
    2276:	4650      	mov	r0, sl
    2278:	2100      	movs	r1, #0
    227a:	f640 12af 	movw	r2, #2479	@ 0x9af
    227e:	f000 f827 	bl	22d0 <dilithium_memset>
    2282:	f50d 6424 	add.w	r4, sp, #2624	@ 0xa40
    2286:	4620      	mov	r0, r4
    2288:	2100      	movs	r1, #0
    228a:	f240 1201 	movw	r2, #257	@ 0x101
    228e:	f000 f81f 	bl	22d0 <dilithium_memset>
    2292:	f50d 6522 	add.w	r5, sp, #2592	@ 0xa20
    2296:	4628      	mov	r0, r5
    2298:	2100      	movs	r1, #0
    229a:	2220      	movs	r2, #32
    229c:	f000 f818 	bl	22d0 <dilithium_memset>
    22a0:	ae08      	add	r6, sp, #32
    22a2:	4630      	mov	r0, r6
    22a4:	2100      	movs	r1, #0
    22a6:	f44f 6220 	mov.w	r2, #2560	@ 0xa00
    22aa:	f000 f811 	bl	22d0 <dilithium_memset>
    22ae:	4640      	mov	r0, r8
    22b0:	4649      	mov	r1, r9
    22b2:	4652      	mov	r2, sl
    22b4:	233b      	movs	r3, #59	@ 0x3b
    22b6:	e9cd 4b00 	strd	r4, fp, [sp]
    22ba:	9502      	str	r5, [sp, #8]
    22bc:	9603      	str	r6, [sp, #12]
    22be:	f7fd ff7b 	bl	1b8 <pqcrystals_dilithium2_ref_signature_internal>
    22c2:	f1a7 040c 	sub.w	r4, r7, #12
    22c6:	2000      	movs	r0, #0
    22c8:	46a5      	mov	sp, r4
    22ca:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    22ce:	bf00      	nop

000022d0 <dilithium_memset>:
    22d0:	1e53      	subs	r3, r2, #1
    22d2:	4293      	cmp	r3, r2
    22d4:	bf28      	it	cs
    22d6:	4770      	bxcs	lr
    22d8:	f800 1b01 	strb.w	r1, [r0], #1
    22dc:	461a      	mov	r2, r3
    22de:	e7f7      	b.n	22d0 <dilithium_memset>

000022e0 <dilithium_memcpy>:
    22e0:	1e53      	subs	r3, r2, #1
    22e2:	4293      	cmp	r3, r2
    22e4:	bf28      	it	cs
    22e6:	4770      	bxcs	lr
    22e8:	f811 2b01 	ldrb.w	r2, [r1], #1
    22ec:	f800 2b01 	strb.w	r2, [r0], #1
    22f0:	461a      	mov	r2, r3
    22f2:	e7f5      	b.n	22e0 <dilithium_memcpy>

000022f4 <__assert_trap>:
    22f4:	b480      	push	{r7}
    22f6:	af00      	add	r7, sp, #0
    22f8:	be00      	bkpt	0x0000
    22fa:	e7fd      	b.n	22f8 <__assert_trap+0x4>

000022fc <_Z6assertb>:
    22fc:	b580      	push	{r7, lr}
    22fe:	b082      	sub	sp, #8
    2300:	af00      	add	r7, sp, #0
    2302:	4603      	mov	r3, r0
    2304:	71fb      	strb	r3, [r7, #7]
    2306:	79fb      	ldrb	r3, [r7, #7]
    2308:	f083 0301 	eor.w	r3, r3, #1
    230c:	b2db      	uxtb	r3, r3
    230e:	2b00      	cmp	r3, #0
    2310:	d001      	beq.n	2316 <_Z6assertb+0x1a>
    2312:	f7ff ffef 	bl	22f4 <__assert_trap>
    2316:	bf00      	nop
    2318:	3708      	adds	r7, #8
    231a:	46bd      	mov	sp, r7
    231c:	bd80      	pop	{r7, pc}
    231e:	e7fe      	b.n	231e <_Z6assertb+0x22>
    2320:	e7fe      	b.n	2320 <_Z6assertb+0x24>
    2322:	e7fe      	b.n	2322 <_Z6assertb+0x26>
    2324:	e7fe      	b.n	2324 <_Z6assertb+0x28>
    2326:	e7fe      	b.n	2326 <_Z6assertb+0x2a>
    2328:	e7fe      	b.n	2328 <_Z6assertb+0x2c>
    232a:	e7fe      	b.n	232a <_Z6assertb+0x2e>
    232c:	e7fe      	b.n	232c <_Z6assertb+0x30>
    232e:	e7fe      	b.n	232e <_Z6assertb+0x32>

00002330 <ADCSPI_Handler>:
    2330:	e7fe      	b.n	2330 <ADCSPI_Handler>
	...

00002334 <Reset_Handler>:
    2334:	4907      	ldr	r1, [pc, #28]	@ (2354 <system_startup+0xa>)
    2336:	4a08      	ldr	r2, [pc, #32]	@ (2358 <system_startup+0xe>)
    2338:	4b08      	ldr	r3, [pc, #32]	@ (235c <system_startup+0x12>)
    233a:	2b00      	cmp	r3, #0
    233c:	d005      	beq.n	234a <system_startup>
    233e:	f04f 0400 	mov.w	r4, #0

00002342 <zero>:
    2342:	f801 4b01 	strb.w	r4, [r1], #1
    2346:	3b01      	subs	r3, #1
    2348:	d1fb      	bne.n	2342 <zero>

0000234a <system_startup>:
    234a:	4805      	ldr	r0, [pc, #20]	@ (2360 <system_startup+0x16>)
    234c:	4780      	blx	r0
    234e:	4805      	ldr	r0, [pc, #20]	@ (2364 <system_startup+0x1a>)
    2350:	4700      	bx	r0
    2352:	0000      	.short	0x0000
    2354:	00005a10 	.word	0x00005a10
    2358:	00005d48 	.word	0x00005d48
    235c:	00000338 	.word	0x00000338
    2360:	000023f9 	.word	0x000023f9
    2364:	00000151 	.word	0x00000151

00002368 <__NVIC_EnableIRQ>:
    2368:	b480      	push	{r7}
    236a:	b083      	sub	sp, #12
    236c:	af00      	add	r7, sp, #0
    236e:	4603      	mov	r3, r0
    2370:	71fb      	strb	r3, [r7, #7]
    2372:	f997 3007 	ldrsb.w	r3, [r7, #7]
    2376:	2b00      	cmp	r3, #0
    2378:	db0b      	blt.n	2392 <__NVIC_EnableIRQ+0x2a>
    237a:	79fb      	ldrb	r3, [r7, #7]
    237c:	f003 021f 	and.w	r2, r3, #31
    2380:	4907      	ldr	r1, [pc, #28]	@ (23a0 <__NVIC_EnableIRQ+0x38>)
    2382:	f997 3007 	ldrsb.w	r3, [r7, #7]
    2386:	095b      	lsrs	r3, r3, #5
    2388:	2001      	movs	r0, #1
    238a:	fa00 f202 	lsl.w	r2, r0, r2
    238e:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    2392:	bf00      	nop
    2394:	370c      	adds	r7, #12
    2396:	46bd      	mov	sp, r7
    2398:	f85d 7b04 	ldr.w	r7, [sp], #4
    239c:	4770      	bx	lr
    239e:	bf00      	nop
    23a0:	e000e100 	.word	0xe000e100

000023a4 <__NVIC_SetPriority>:
    23a4:	b480      	push	{r7}
    23a6:	b083      	sub	sp, #12
    23a8:	af00      	add	r7, sp, #0
    23aa:	4603      	mov	r3, r0
    23ac:	6039      	str	r1, [r7, #0]
    23ae:	71fb      	strb	r3, [r7, #7]
    23b0:	f997 3007 	ldrsb.w	r3, [r7, #7]
    23b4:	2b00      	cmp	r3, #0
    23b6:	db0a      	blt.n	23ce <__NVIC_SetPriority+0x2a>
    23b8:	683b      	ldr	r3, [r7, #0]
    23ba:	b2da      	uxtb	r2, r3
    23bc:	490c      	ldr	r1, [pc, #48]	@ (23f0 <__NVIC_SetPriority+0x4c>)
    23be:	f997 3007 	ldrsb.w	r3, [r7, #7]
    23c2:	0152      	lsls	r2, r2, #5
    23c4:	b2d2      	uxtb	r2, r2
    23c6:	440b      	add	r3, r1
    23c8:	f883 2300 	strb.w	r2, [r3, #768]	@ 0x300
    23cc:	e00a      	b.n	23e4 <__NVIC_SetPriority+0x40>
    23ce:	683b      	ldr	r3, [r7, #0]
    23d0:	b2da      	uxtb	r2, r3
    23d2:	4908      	ldr	r1, [pc, #32]	@ (23f4 <__NVIC_SetPriority+0x50>)
    23d4:	79fb      	ldrb	r3, [r7, #7]
    23d6:	f003 030f 	and.w	r3, r3, #15
    23da:	3b04      	subs	r3, #4
    23dc:	0152      	lsls	r2, r2, #5
    23de:	b2d2      	uxtb	r2, r2
    23e0:	440b      	add	r3, r1
    23e2:	761a      	strb	r2, [r3, #24]
    23e4:	bf00      	nop
    23e6:	370c      	adds	r7, #12
    23e8:	46bd      	mov	sp, r7
    23ea:	f85d 7b04 	ldr.w	r7, [sp], #4
    23ee:	4770      	bx	lr
    23f0:	e000e100 	.word	0xe000e100
    23f4:	e000ed00 	.word	0xe000ed00

000023f8 <SystemInit>:
    23f8:	b580      	push	{r7, lr}
    23fa:	af00      	add	r7, sp, #0
    23fc:	4b1e      	ldr	r3, [pc, #120]	@ (2478 <SystemInit+0x80>)
    23fe:	f8d3 3088 	ldr.w	r3, [r3, #136]	@ 0x88
    2402:	4a1d      	ldr	r2, [pc, #116]	@ (2478 <SystemInit+0x80>)
    2404:	f443 0370 	orr.w	r3, r3, #15728640	@ 0xf00000
    2408:	f8c2 3088 	str.w	r3, [r2, #136]	@ 0x88
    240c:	4b1b      	ldr	r3, [pc, #108]	@ (247c <SystemInit+0x84>)
    240e:	699b      	ldr	r3, [r3, #24]
    2410:	4a1a      	ldr	r2, [pc, #104]	@ (247c <SystemInit+0x84>)
    2412:	f043 0301 	orr.w	r3, r3, #1
    2416:	6193      	str	r3, [r2, #24]
    2418:	4b18      	ldr	r3, [pc, #96]	@ (247c <SystemInit+0x84>)
    241a:	699b      	ldr	r3, [r3, #24]
    241c:	4a17      	ldr	r2, [pc, #92]	@ (247c <SystemInit+0x84>)
    241e:	f043 0302 	orr.w	r3, r3, #2
    2422:	6193      	str	r3, [r2, #24]
    2424:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    2428:	f240 228b 	movw	r2, #651	@ 0x28b
    242c:	611a      	str	r2, [r3, #16]
    242e:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    2432:	689b      	ldr	r3, [r3, #8]
    2434:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    2438:	f043 0302 	orr.w	r3, r3, #2
    243c:	6093      	str	r3, [r2, #8]
    243e:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    2442:	689b      	ldr	r3, [r3, #8]
    2444:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    2448:	f043 0301 	orr.w	r3, r3, #1
    244c:	6093      	str	r3, [r2, #8]
    244e:	4b0c      	ldr	r3, [pc, #48]	@ (2480 <SystemInit+0x88>)
    2450:	f06f 427f 	mvn.w	r2, #4278190080	@ 0xff000000
    2454:	605a      	str	r2, [r3, #4]
    2456:	2107      	movs	r1, #7
    2458:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    245c:	f7ff ffa2 	bl	23a4 <__NVIC_SetPriority>
    2460:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    2464:	f7ff ff80 	bl	2368 <__NVIC_EnableIRQ>
    2468:	4b05      	ldr	r3, [pc, #20]	@ (2480 <SystemInit+0x88>)
    246a:	2200      	movs	r2, #0
    246c:	609a      	str	r2, [r3, #8]
    246e:	4b04      	ldr	r3, [pc, #16]	@ (2480 <SystemInit+0x88>)
    2470:	2207      	movs	r2, #7
    2472:	601a      	str	r2, [r3, #0]
    2474:	bf00      	nop
    2476:	bd80      	pop	{r7, pc}
    2478:	e000ed00 	.word	0xe000ed00
    247c:	40010000 	.word	0x40010000
    2480:	e000e010 	.word	0xe000e010

00002484 <SysTick_Handler>:
    2484:	b480      	push	{r7}
    2486:	af00      	add	r7, sp, #0
    2488:	4b06      	ldr	r3, [pc, #24]	@ (24a4 <SysTick_Handler+0x20>)
    248a:	e9d3 2300 	ldrd	r2, r3, [r3]
    248e:	1c50      	adds	r0, r2, #1
    2490:	f143 0100 	adc.w	r1, r3, #0
    2494:	4b03      	ldr	r3, [pc, #12]	@ (24a4 <SysTick_Handler+0x20>)
    2496:	e9c3 0100 	strd	r0, r1, [r3]
    249a:	bf00      	nop
    249c:	46bd      	mov	sp, r7
    249e:	f85d 7b04 	ldr.w	r7, [sp], #4
    24a2:	4770      	bx	lr
    24a4:	00005a30 	.word	0x00005a30

000024a8 <hal_get_time>:
    24a8:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    24ac:	b084      	sub	sp, #16
    24ae:	af00      	add	r7, sp, #0
    24b0:	4b17      	ldr	r3, [pc, #92]	@ (2510 <hal_get_time+0x68>)
    24b2:	e9d3 2300 	ldrd	r2, r3, [r3]
    24b6:	e9c7 2302 	strd	r2, r3, [r7, #8]
    24ba:	e9d7 2302 	ldrd	r2, r3, [r7, #8]
    24be:	1c50      	adds	r0, r2, #1
    24c0:	f143 0100 	adc.w	r1, r3, #0
    24c4:	f04f 0200 	mov.w	r2, #0
    24c8:	f04f 0300 	mov.w	r3, #0
    24cc:	060b      	lsls	r3, r1, #24
    24ce:	ea43 2310 	orr.w	r3, r3, r0, lsr #8
    24d2:	0602      	lsls	r2, r0, #24
    24d4:	4e0f      	ldr	r6, [pc, #60]	@ (2514 <hal_get_time+0x6c>)
    24d6:	68b6      	ldr	r6, [r6, #8]
    24d8:	f04f 0c00 	mov.w	ip, #0
    24dc:	4634      	mov	r4, r6
    24de:	4665      	mov	r5, ip
    24e0:	ebb2 0804 	subs.w	r8, r2, r4
    24e4:	eb63 0905 	sbc.w	r9, r3, r5
    24e8:	e9c7 8900 	strd	r8, r9, [r7]
    24ec:	4b08      	ldr	r3, [pc, #32]	@ (2510 <hal_get_time+0x68>)
    24ee:	e9d3 2300 	ldrd	r2, r3, [r3]
    24f2:	e9d7 ab02 	ldrd	sl, fp, [r7, #8]
    24f6:	459b      	cmp	fp, r3
    24f8:	bf08      	it	eq
    24fa:	4592      	cmpeq	sl, r2
    24fc:	d1d8      	bne.n	24b0 <hal_get_time+0x8>
    24fe:	e9d7 2300 	ldrd	r2, r3, [r7]
    2502:	4610      	mov	r0, r2
    2504:	4619      	mov	r1, r3
    2506:	3710      	adds	r7, #16
    2508:	46bd      	mov	sp, r7
    250a:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    250e:	4770      	bx	lr
    2510:	00005a30 	.word	0x00005a30
    2514:	e000e010 	.word	0xe000e010

00002518 <hal_setup>:
    2518:	b480      	push	{r7}
    251a:	b083      	sub	sp, #12
    251c:	af00      	add	r7, sp, #0
    251e:	4603      	mov	r3, r0
    2520:	71fb      	strb	r3, [r7, #7]
    2522:	bf00      	nop
    2524:	370c      	adds	r7, #12
    2526:	46bd      	mov	sp, r7
    2528:	f85d 7b04 	ldr.w	r7, [sp], #4
    252c:	4770      	bx	lr

0000252e <uart_putc>:
    252e:	b480      	push	{r7}
    2530:	b083      	sub	sp, #12
    2532:	af00      	add	r7, sp, #0
    2534:	6078      	str	r0, [r7, #4]
    2536:	bf00      	nop
    2538:	f04f 2340 	mov.w	r3, #1073758208	@ 0x40004000
    253c:	685b      	ldr	r3, [r3, #4]
    253e:	f003 0301 	and.w	r3, r3, #1
    2542:	2b00      	cmp	r3, #0
    2544:	d1f8      	bne.n	2538 <uart_putc+0xa>
    2546:	687b      	ldr	r3, [r7, #4]
    2548:	f04f 2240 	mov.w	r2, #1073758208	@ 0x40004000
    254c:	b2db      	uxtb	r3, r3
    254e:	6013      	str	r3, [r2, #0]
    2550:	bf00      	nop
    2552:	370c      	adds	r7, #12
    2554:	46bd      	mov	sp, r7
    2556:	f85d 7b04 	ldr.w	r7, [sp], #4
    255a:	4770      	bx	lr

0000255c <hal_send_str>:
    255c:	b580      	push	{r7, lr}
    255e:	b084      	sub	sp, #16
    2560:	af00      	add	r7, sp, #0
    2562:	6078      	str	r0, [r7, #4]
    2564:	687b      	ldr	r3, [r7, #4]
    2566:	60fb      	str	r3, [r7, #12]
    2568:	e007      	b.n	257a <hal_send_str+0x1e>
    256a:	68fb      	ldr	r3, [r7, #12]
    256c:	781b      	ldrb	r3, [r3, #0]
    256e:	4618      	mov	r0, r3
    2570:	f7ff ffdd 	bl	252e <uart_putc>
    2574:	68fb      	ldr	r3, [r7, #12]
    2576:	3301      	adds	r3, #1
    2578:	60fb      	str	r3, [r7, #12]
    257a:	68fb      	ldr	r3, [r7, #12]
    257c:	781b      	ldrb	r3, [r3, #0]
    257e:	2b00      	cmp	r3, #0
    2580:	d1f3      	bne.n	256a <hal_send_str+0xe>
    2582:	200a      	movs	r0, #10
    2584:	f7ff ffd3 	bl	252e <uart_putc>
    2588:	bf00      	nop
    258a:	3710      	adds	r7, #16
    258c:	46bd      	mov	sp, r7
    258e:	bd80      	pop	{r7, pc}

00002590 <semihosting_syscall>:
    2590:	b480      	push	{r7}
    2592:	b083      	sub	sp, #12
    2594:	af00      	add	r7, sp, #0
    2596:	6078      	str	r0, [r7, #4]
    2598:	6039      	str	r1, [r7, #0]
    259a:	683a      	ldr	r2, [r7, #0]
    259c:	687b      	ldr	r3, [r7, #4]
    259e:	4618      	mov	r0, r3
    25a0:	4611      	mov	r1, r2
    25a2:	beab      	bkpt	0x00ab
    25a4:	4603      	mov	r3, r0
    25a6:	607b      	str	r3, [r7, #4]
    25a8:	687b      	ldr	r3, [r7, #4]
    25aa:	4618      	mov	r0, r3
    25ac:	370c      	adds	r7, #12
    25ae:	46bd      	mov	sp, r7
    25b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    25b4:	4770      	bx	lr

000025b6 <semihosting_exit>:
    25b6:	b580      	push	{r7, lr}
    25b8:	af00      	add	r7, sp, #0
    25ba:	2318      	movs	r3, #24
    25bc:	4a03      	ldr	r2, [pc, #12]	@ (25cc <semihosting_exit+0x16>)
    25be:	4611      	mov	r1, r2
    25c0:	4618      	mov	r0, r3
    25c2:	f7ff ffe5 	bl	2590 <semihosting_syscall>
    25c6:	bf00      	nop
    25c8:	bd80      	pop	{r7, pc}
    25ca:	bf00      	nop
    25cc:	00020026 	.word	0x00020026

000025d0 <NMI_Handler>:
    25d0:	b580      	push	{r7, lr}
    25d2:	af00      	add	r7, sp, #0
    25d4:	4805      	ldr	r0, [pc, #20]	@ (25ec <NMI_Handler+0x1c>)
    25d6:	f7ff ffc1 	bl	255c <hal_send_str>
    25da:	2318      	movs	r3, #24
    25dc:	4a04      	ldr	r2, [pc, #16]	@ (25f0 <NMI_Handler+0x20>)
    25de:	4611      	mov	r1, r2
    25e0:	4618      	mov	r0, r3
    25e2:	f7ff ffd5 	bl	2590 <semihosting_syscall>
    25e6:	bf00      	nop
    25e8:	bd80      	pop	{r7, pc}
    25ea:	bf00      	nop
    25ec:	000052e8 	.word	0x000052e8
    25f0:	00020026 	.word	0x00020026

000025f4 <HardFault_Handler>:
    25f4:	b580      	push	{r7, lr}
    25f6:	af00      	add	r7, sp, #0
    25f8:	4805      	ldr	r0, [pc, #20]	@ (2610 <HardFault_Handler+0x1c>)
    25fa:	f7ff ffaf 	bl	255c <hal_send_str>
    25fe:	2318      	movs	r3, #24
    2600:	4a04      	ldr	r2, [pc, #16]	@ (2614 <HardFault_Handler+0x20>)
    2602:	4611      	mov	r1, r2
    2604:	4618      	mov	r0, r3
    2606:	f7ff ffc3 	bl	2590 <semihosting_syscall>
    260a:	bf00      	nop
    260c:	bd80      	pop	{r7, pc}
    260e:	bf00      	nop
    2610:	000052f4 	.word	0x000052f4
    2614:	00020026 	.word	0x00020026

00002618 <MemManage_Handler>:
    2618:	b580      	push	{r7, lr}
    261a:	af00      	add	r7, sp, #0
    261c:	4805      	ldr	r0, [pc, #20]	@ (2634 <MemManage_Handler+0x1c>)
    261e:	f7ff ff9d 	bl	255c <hal_send_str>
    2622:	2318      	movs	r3, #24
    2624:	4a04      	ldr	r2, [pc, #16]	@ (2638 <MemManage_Handler+0x20>)
    2626:	4611      	mov	r1, r2
    2628:	4618      	mov	r0, r3
    262a:	f7ff ffb1 	bl	2590 <semihosting_syscall>
    262e:	bf00      	nop
    2630:	bd80      	pop	{r7, pc}
    2632:	bf00      	nop
    2634:	00005308 	.word	0x00005308
    2638:	00020026 	.word	0x00020026

0000263c <BusFault_Handler>:
    263c:	b580      	push	{r7, lr}
    263e:	af00      	add	r7, sp, #0
    2640:	4805      	ldr	r0, [pc, #20]	@ (2658 <BusFault_Handler+0x1c>)
    2642:	f7ff ff8b 	bl	255c <hal_send_str>
    2646:	2318      	movs	r3, #24
    2648:	4a04      	ldr	r2, [pc, #16]	@ (265c <BusFault_Handler+0x20>)
    264a:	4611      	mov	r1, r2
    264c:	4618      	mov	r0, r3
    264e:	f7ff ff9f 	bl	2590 <semihosting_syscall>
    2652:	bf00      	nop
    2654:	bd80      	pop	{r7, pc}
    2656:	bf00      	nop
    2658:	0000531c 	.word	0x0000531c
    265c:	00020026 	.word	0x00020026

00002660 <UsageFault_Handler>:
    2660:	b580      	push	{r7, lr}
    2662:	af00      	add	r7, sp, #0
    2664:	4805      	ldr	r0, [pc, #20]	@ (267c <UsageFault_Handler+0x1c>)
    2666:	f7ff ff79 	bl	255c <hal_send_str>
    266a:	2318      	movs	r3, #24
    266c:	4a04      	ldr	r2, [pc, #16]	@ (2680 <UsageFault_Handler+0x20>)
    266e:	4611      	mov	r1, r2
    2670:	4618      	mov	r0, r3
    2672:	f7ff ff8d 	bl	2590 <semihosting_syscall>
    2676:	bf00      	nop
    2678:	bd80      	pop	{r7, pc}
    267a:	bf00      	nop
    267c:	00005330 	.word	0x00005330
    2680:	00020026 	.word	0x00020026

00002684 <SVC_Handler>:
    2684:	b580      	push	{r7, lr}
    2686:	af00      	add	r7, sp, #0
    2688:	4805      	ldr	r0, [pc, #20]	@ (26a0 <SVC_Handler+0x1c>)
    268a:	f7ff ff67 	bl	255c <hal_send_str>
    268e:	2318      	movs	r3, #24
    2690:	4a04      	ldr	r2, [pc, #16]	@ (26a4 <SVC_Handler+0x20>)
    2692:	4611      	mov	r1, r2
    2694:	4618      	mov	r0, r3
    2696:	f7ff ff7b 	bl	2590 <semihosting_syscall>
    269a:	bf00      	nop
    269c:	bd80      	pop	{r7, pc}
    269e:	bf00      	nop
    26a0:	00005344 	.word	0x00005344
    26a4:	00020026 	.word	0x00020026

000026a8 <DebugMon_Handler>:
    26a8:	b580      	push	{r7, lr}
    26aa:	af00      	add	r7, sp, #0
    26ac:	4805      	ldr	r0, [pc, #20]	@ (26c4 <DebugMon_Handler+0x1c>)
    26ae:	f7ff ff55 	bl	255c <hal_send_str>
    26b2:	2318      	movs	r3, #24
    26b4:	4a04      	ldr	r2, [pc, #16]	@ (26c8 <DebugMon_Handler+0x20>)
    26b6:	4611      	mov	r1, r2
    26b8:	4618      	mov	r0, r3
    26ba:	f7ff ff69 	bl	2590 <semihosting_syscall>
    26be:	bf00      	nop
    26c0:	bd80      	pop	{r7, pc}
    26c2:	bf00      	nop
    26c4:	00005350 	.word	0x00005350
    26c8:	00020026 	.word	0x00020026

000026cc <PendSV_Handler>:
    26cc:	b580      	push	{r7, lr}
    26ce:	af00      	add	r7, sp, #0
    26d0:	4805      	ldr	r0, [pc, #20]	@ (26e8 <PendSV_Handler+0x1c>)
    26d2:	f7ff ff43 	bl	255c <hal_send_str>
    26d6:	2318      	movs	r3, #24
    26d8:	4a04      	ldr	r2, [pc, #16]	@ (26ec <PendSV_Handler+0x20>)
    26da:	4611      	mov	r1, r2
    26dc:	4618      	mov	r0, r3
    26de:	f7ff ff57 	bl	2590 <semihosting_syscall>
    26e2:	bf00      	nop
    26e4:	bd80      	pop	{r7, pc}
    26e6:	bf00      	nop
    26e8:	00005364 	.word	0x00005364
    26ec:	00020026 	.word	0x00020026

000026f0 <Default_Handler>:
    26f0:	b580      	push	{r7, lr}
    26f2:	af00      	add	r7, sp, #0
    26f4:	2318      	movs	r3, #24
    26f6:	4a03      	ldr	r2, [pc, #12]	@ (2704 <Default_Handler+0x14>)
    26f8:	4611      	mov	r1, r2
    26fa:	4618      	mov	r0, r3
    26fc:	f7ff ff48 	bl	2590 <semihosting_syscall>
    2700:	bf00      	nop
    2702:	bd80      	pop	{r7, pc}
    2704:	00020026 	.word	0x00020026

00002708 <__wrap__sbrk>:
    2708:	b480      	push	{r7}
    270a:	b085      	sub	sp, #20
    270c:	af00      	add	r7, sp, #0
    270e:	6078      	str	r0, [r7, #4]
    2710:	4b07      	ldr	r3, [pc, #28]	@ (2730 <__wrap__sbrk+0x28>)
    2712:	681b      	ldr	r3, [r3, #0]
    2714:	60fb      	str	r3, [r7, #12]
    2716:	4b06      	ldr	r3, [pc, #24]	@ (2730 <__wrap__sbrk+0x28>)
    2718:	681a      	ldr	r2, [r3, #0]
    271a:	687b      	ldr	r3, [r7, #4]
    271c:	4413      	add	r3, r2
    271e:	4a04      	ldr	r2, [pc, #16]	@ (2730 <__wrap__sbrk+0x28>)
    2720:	6013      	str	r3, [r2, #0]
    2722:	68fb      	ldr	r3, [r7, #12]
    2724:	4618      	mov	r0, r3
    2726:	3714      	adds	r7, #20
    2728:	46bd      	mov	sp, r7
    272a:	f85d 7b04 	ldr.w	r7, [sp], #4
    272e:	4770      	bx	lr
    2730:	000054b4 	.word	0x000054b4

00002734 <hal_get_stack_size>:
    2734:	b490      	push	{r4, r7}
    2736:	af00      	add	r7, sp, #0
    2738:	466b      	mov	r3, sp
    273a:	461c      	mov	r4, r3
    273c:	4b03      	ldr	r3, [pc, #12]	@ (274c <hal_get_stack_size+0x18>)
    273e:	681b      	ldr	r3, [r3, #0]
    2740:	1ae3      	subs	r3, r4, r3
    2742:	4618      	mov	r0, r3
    2744:	46bd      	mov	sp, r7
    2746:	bc90      	pop	{r4, r7}
    2748:	4770      	bx	lr
    274a:	bf00      	nop
    274c:	000054b4 	.word	0x000054b4

00002750 <hal_spraystack>:
    2750:	b480      	push	{r7}
    2752:	b083      	sub	sp, #12
    2754:	af00      	add	r7, sp, #0
    2756:	4b0a      	ldr	r3, [pc, #40]	@ (2780 <hal_spraystack+0x30>)
    2758:	681b      	ldr	r3, [r3, #0]
    275a:	607b      	str	r3, [r7, #4]
    275c:	4909      	ldr	r1, [pc, #36]	@ (2784 <hal_spraystack+0x34>)
    275e:	4b0a      	ldr	r3, [pc, #40]	@ (2788 <hal_spraystack+0x38>)
    2760:	681a      	ldr	r2, [r3, #0]
    2762:	687b      	ldr	r3, [r7, #4]
    2764:	466a      	mov	r2, sp
    2766:	f843 1b04 	str.w	r1, [r3], #4
    276a:	4293      	cmp	r3, r2
    276c:	dbfb      	blt.n	2766 <hal_spraystack+0x16>
    276e:	4906      	ldr	r1, [pc, #24]	@ (2788 <hal_spraystack+0x38>)
    2770:	600a      	str	r2, [r1, #0]
    2772:	607b      	str	r3, [r7, #4]
    2774:	bf00      	nop
    2776:	370c      	adds	r7, #12
    2778:	46bd      	mov	sp, r7
    277a:	f85d 7b04 	ldr.w	r7, [sp], #4
    277e:	4770      	bx	lr
    2780:	000054b4 	.word	0x000054b4
    2784:	deadbeef 	.word	0xdeadbeef
    2788:	00005a38 	.word	0x00005a38

0000278c <hal_checkstack>:
    278c:	b480      	push	{r7}
    278e:	b083      	sub	sp, #12
    2790:	af00      	add	r7, sp, #0
    2792:	2300      	movs	r3, #0
    2794:	607b      	str	r3, [r7, #4]
    2796:	4b0c      	ldr	r3, [pc, #48]	@ (27c8 <hal_checkstack+0x3c>)
    2798:	681a      	ldr	r2, [r3, #0]
    279a:	4b0c      	ldr	r3, [pc, #48]	@ (27cc <hal_checkstack+0x40>)
    279c:	6819      	ldr	r1, [r3, #0]
    279e:	480c      	ldr	r0, [pc, #48]	@ (27d0 <hal_checkstack+0x44>)
    27a0:	687b      	ldr	r3, [r7, #4]
    27a2:	eba2 0301 	sub.w	r3, r2, r1
    27a6:	f851 cb04 	ldr.w	ip, [r1], #4
    27aa:	4584      	cmp	ip, r0
    27ac:	bf0c      	ite	eq
    27ae:	3b04      	subeq	r3, #4
    27b0:	e001      	bne.n	27b6 <hal_checkstack+0x2a>
    27b2:	4291      	cmp	r1, r2
    27b4:	dbf7      	blt.n	27a6 <hal_checkstack+0x1a>
    27b6:	607b      	str	r3, [r7, #4]
    27b8:	687b      	ldr	r3, [r7, #4]
    27ba:	4618      	mov	r0, r3
    27bc:	370c      	adds	r7, #12
    27be:	46bd      	mov	sp, r7
    27c0:	f85d 7b04 	ldr.w	r7, [sp], #4
    27c4:	4770      	bx	lr
    27c6:	bf00      	nop
    27c8:	00005a38 	.word	0x00005a38
    27cc:	000054b4 	.word	0x000054b4
    27d0:	deadbeef 	.word	0xdeadbeef

000027d4 <__wrap__open>:
    27d4:	b480      	push	{r7}
    27d6:	b085      	sub	sp, #20
    27d8:	af00      	add	r7, sp, #0
    27da:	60f8      	str	r0, [r7, #12]
    27dc:	60b9      	str	r1, [r7, #8]
    27de:	607a      	str	r2, [r7, #4]
    27e0:	4b05      	ldr	r3, [pc, #20]	@ (27f8 <__wrap__open+0x24>)
    27e2:	2258      	movs	r2, #88	@ 0x58
    27e4:	601a      	str	r2, [r3, #0]
    27e6:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    27ea:	4618      	mov	r0, r3
    27ec:	3714      	adds	r7, #20
    27ee:	46bd      	mov	sp, r7
    27f0:	f85d 7b04 	ldr.w	r7, [sp], #4
    27f4:	4770      	bx	lr
    27f6:	bf00      	nop
    27f8:	00005a3c 	.word	0x00005a3c

000027fc <__wrap__close>:
    27fc:	b480      	push	{r7}
    27fe:	b083      	sub	sp, #12
    2800:	af00      	add	r7, sp, #0
    2802:	6078      	str	r0, [r7, #4]
    2804:	4b05      	ldr	r3, [pc, #20]	@ (281c <__wrap__close+0x20>)
    2806:	2258      	movs	r2, #88	@ 0x58
    2808:	601a      	str	r2, [r3, #0]
    280a:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    280e:	4618      	mov	r0, r3
    2810:	370c      	adds	r7, #12
    2812:	46bd      	mov	sp, r7
    2814:	f85d 7b04 	ldr.w	r7, [sp], #4
    2818:	4770      	bx	lr
    281a:	bf00      	nop
    281c:	00005a3c 	.word	0x00005a3c

00002820 <__wrap__fstat>:
    2820:	b480      	push	{r7}
    2822:	b083      	sub	sp, #12
    2824:	af00      	add	r7, sp, #0
    2826:	6078      	str	r0, [r7, #4]
    2828:	6039      	str	r1, [r7, #0]
    282a:	4b05      	ldr	r3, [pc, #20]	@ (2840 <__wrap__fstat+0x20>)
    282c:	2258      	movs	r2, #88	@ 0x58
    282e:	601a      	str	r2, [r3, #0]
    2830:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2834:	4618      	mov	r0, r3
    2836:	370c      	adds	r7, #12
    2838:	46bd      	mov	sp, r7
    283a:	f85d 7b04 	ldr.w	r7, [sp], #4
    283e:	4770      	bx	lr
    2840:	00005a3c 	.word	0x00005a3c

00002844 <__wrap__getpid>:
    2844:	b480      	push	{r7}
    2846:	af00      	add	r7, sp, #0
    2848:	4b04      	ldr	r3, [pc, #16]	@ (285c <__wrap__getpid+0x18>)
    284a:	2258      	movs	r2, #88	@ 0x58
    284c:	601a      	str	r2, [r3, #0]
    284e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2852:	4618      	mov	r0, r3
    2854:	46bd      	mov	sp, r7
    2856:	f85d 7b04 	ldr.w	r7, [sp], #4
    285a:	4770      	bx	lr
    285c:	00005a3c 	.word	0x00005a3c

00002860 <__wrap__isatty>:
    2860:	b480      	push	{r7}
    2862:	b083      	sub	sp, #12
    2864:	af00      	add	r7, sp, #0
    2866:	6078      	str	r0, [r7, #4]
    2868:	4b04      	ldr	r3, [pc, #16]	@ (287c <__wrap__isatty+0x1c>)
    286a:	2258      	movs	r2, #88	@ 0x58
    286c:	601a      	str	r2, [r3, #0]
    286e:	2300      	movs	r3, #0
    2870:	4618      	mov	r0, r3
    2872:	370c      	adds	r7, #12
    2874:	46bd      	mov	sp, r7
    2876:	f85d 7b04 	ldr.w	r7, [sp], #4
    287a:	4770      	bx	lr
    287c:	00005a3c 	.word	0x00005a3c

00002880 <__wrap__kill>:
    2880:	b480      	push	{r7}
    2882:	b083      	sub	sp, #12
    2884:	af00      	add	r7, sp, #0
    2886:	6078      	str	r0, [r7, #4]
    2888:	6039      	str	r1, [r7, #0]
    288a:	4b05      	ldr	r3, [pc, #20]	@ (28a0 <__wrap__kill+0x20>)
    288c:	2258      	movs	r2, #88	@ 0x58
    288e:	601a      	str	r2, [r3, #0]
    2890:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    2894:	4618      	mov	r0, r3
    2896:	370c      	adds	r7, #12
    2898:	46bd      	mov	sp, r7
    289a:	f85d 7b04 	ldr.w	r7, [sp], #4
    289e:	4770      	bx	lr
    28a0:	00005a3c 	.word	0x00005a3c

000028a4 <__wrap__lseek>:
    28a4:	b480      	push	{r7}
    28a6:	b085      	sub	sp, #20
    28a8:	af00      	add	r7, sp, #0
    28aa:	60f8      	str	r0, [r7, #12]
    28ac:	60b9      	str	r1, [r7, #8]
    28ae:	607a      	str	r2, [r7, #4]
    28b0:	4b05      	ldr	r3, [pc, #20]	@ (28c8 <__wrap__lseek+0x24>)
    28b2:	2258      	movs	r2, #88	@ 0x58
    28b4:	601a      	str	r2, [r3, #0]
    28b6:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    28ba:	4618      	mov	r0, r3
    28bc:	3714      	adds	r7, #20
    28be:	46bd      	mov	sp, r7
    28c0:	f85d 7b04 	ldr.w	r7, [sp], #4
    28c4:	4770      	bx	lr
    28c6:	bf00      	nop
    28c8:	00005a3c 	.word	0x00005a3c

000028cc <__wrap__read>:
    28cc:	b480      	push	{r7}
    28ce:	b085      	sub	sp, #20
    28d0:	af00      	add	r7, sp, #0
    28d2:	60f8      	str	r0, [r7, #12]
    28d4:	60b9      	str	r1, [r7, #8]
    28d6:	607a      	str	r2, [r7, #4]
    28d8:	4b05      	ldr	r3, [pc, #20]	@ (28f0 <__wrap__read+0x24>)
    28da:	2258      	movs	r2, #88	@ 0x58
    28dc:	601a      	str	r2, [r3, #0]
    28de:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    28e2:	4618      	mov	r0, r3
    28e4:	3714      	adds	r7, #20
    28e6:	46bd      	mov	sp, r7
    28e8:	f85d 7b04 	ldr.w	r7, [sp], #4
    28ec:	4770      	bx	lr
    28ee:	bf00      	nop
    28f0:	00005a3c 	.word	0x00005a3c

000028f4 <__wrap__write>:
    28f4:	b580      	push	{r7, lr}
    28f6:	b086      	sub	sp, #24
    28f8:	af00      	add	r7, sp, #0
    28fa:	60f8      	str	r0, [r7, #12]
    28fc:	60b9      	str	r1, [r7, #8]
    28fe:	607a      	str	r2, [r7, #4]
    2900:	2300      	movs	r3, #0
    2902:	617b      	str	r3, [r7, #20]
    2904:	e009      	b.n	291a <__wrap__write+0x26>
    2906:	697b      	ldr	r3, [r7, #20]
    2908:	68ba      	ldr	r2, [r7, #8]
    290a:	4413      	add	r3, r2
    290c:	781b      	ldrb	r3, [r3, #0]
    290e:	4618      	mov	r0, r3
    2910:	f7ff fe0d 	bl	252e <uart_putc>
    2914:	697b      	ldr	r3, [r7, #20]
    2916:	3301      	adds	r3, #1
    2918:	617b      	str	r3, [r7, #20]
    291a:	697a      	ldr	r2, [r7, #20]
    291c:	687b      	ldr	r3, [r7, #4]
    291e:	429a      	cmp	r2, r3
    2920:	dbf1      	blt.n	2906 <__wrap__write+0x12>
    2922:	687b      	ldr	r3, [r7, #4]
    2924:	4618      	mov	r0, r3
    2926:	3718      	adds	r7, #24
    2928:	46bd      	mov	sp, r7
    292a:	bd80      	pop	{r7, pc}

0000292c <selfrel_offset31>:
    292c:	6803      	ldr	r3, [r0, #0]
    292e:	005a      	lsls	r2, r3, #1
    2930:	bf4c      	ite	mi
    2932:	f043 4300 	orrmi.w	r3, r3, #2147483648	@ 0x80000000
    2936:	f023 4300 	bicpl.w	r3, r3, #2147483648	@ 0x80000000
    293a:	4418      	add	r0, r3
    293c:	4770      	bx	lr
    293e:	bf00      	nop

00002940 <search_EIT_table>:
    2940:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2944:	b359      	cbz	r1, 299e <search_EIT_table+0x5e>
    2946:	f101 38ff 	add.w	r8, r1, #4294967295	@ 0xffffffff
    294a:	4605      	mov	r5, r0
    294c:	4616      	mov	r6, r2
    294e:	4647      	mov	r7, r8
    2950:	f04f 0a00 	mov.w	sl, #0
    2954:	eb0a 0107 	add.w	r1, sl, r7
    2958:	eb01 71d1 	add.w	r1, r1, r1, lsr #31
    295c:	1049      	asrs	r1, r1, #1
    295e:	eb05 09c1 	add.w	r9, r5, r1, lsl #3
    2962:	4648      	mov	r0, r9
    2964:	f7ff ffe2 	bl	292c <selfrel_offset31>
    2968:	4588      	cmp	r8, r1
    296a:	ea4f 04c1 	mov.w	r4, r1, lsl #3
    296e:	4603      	mov	r3, r0
    2970:	d010      	beq.n	2994 <search_EIT_table+0x54>
    2972:	f104 0008 	add.w	r0, r4, #8
    2976:	42b3      	cmp	r3, r6
    2978:	4428      	add	r0, r5
    297a:	d807      	bhi.n	298c <search_EIT_table+0x4c>
    297c:	f7ff ffd6 	bl	292c <selfrel_offset31>
    2980:	3801      	subs	r0, #1
    2982:	42b0      	cmp	r0, r6
    2984:	d208      	bcs.n	2998 <search_EIT_table+0x58>
    2986:	f101 0a01 	add.w	sl, r1, #1
    298a:	e7e3      	b.n	2954 <search_EIT_table+0x14>
    298c:	458a      	cmp	sl, r1
    298e:	d006      	beq.n	299e <search_EIT_table+0x5e>
    2990:	1e4f      	subs	r7, r1, #1
    2992:	e7df      	b.n	2954 <search_EIT_table+0x14>
    2994:	42b0      	cmp	r0, r6
    2996:	d8f9      	bhi.n	298c <search_EIT_table+0x4c>
    2998:	4648      	mov	r0, r9
    299a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    299e:	f04f 0900 	mov.w	r9, #0
    29a2:	4648      	mov	r0, r9
    29a4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

000029a8 <__gnu_unwind_get_pr_addr>:
    29a8:	2801      	cmp	r0, #1
    29aa:	d009      	beq.n	29c0 <__gnu_unwind_get_pr_addr+0x18>
    29ac:	2802      	cmp	r0, #2
    29ae:	d005      	beq.n	29bc <__gnu_unwind_get_pr_addr+0x14>
    29b0:	4b04      	ldr	r3, [pc, #16]	@ (29c4 <__gnu_unwind_get_pr_addr+0x1c>)
    29b2:	2800      	cmp	r0, #0
    29b4:	bf0c      	ite	eq
    29b6:	4618      	moveq	r0, r3
    29b8:	2000      	movne	r0, #0
    29ba:	4770      	bx	lr
    29bc:	4802      	ldr	r0, [pc, #8]	@ (29c8 <__gnu_unwind_get_pr_addr+0x20>)
    29be:	4770      	bx	lr
    29c0:	4802      	ldr	r0, [pc, #8]	@ (29cc <__gnu_unwind_get_pr_addr+0x24>)
    29c2:	4770      	bx	lr
    29c4:	00003085 	.word	0x00003085
    29c8:	0000308d 	.word	0x0000308d
    29cc:	00003089 	.word	0x00003089

000029d0 <get_eit_entry>:
    29d0:	b530      	push	{r4, r5, lr}
    29d2:	4b22      	ldr	r3, [pc, #136]	@ (2a5c <get_eit_entry+0x8c>)
    29d4:	b083      	sub	sp, #12
    29d6:	4604      	mov	r4, r0
    29d8:	1e8d      	subs	r5, r1, #2
    29da:	b343      	cbz	r3, 2a2e <get_eit_entry+0x5e>
    29dc:	a901      	add	r1, sp, #4
    29de:	4628      	mov	r0, r5
    29e0:	f3af 8000 	nop.w
    29e4:	b1f0      	cbz	r0, 2a24 <get_eit_entry+0x54>
    29e6:	9901      	ldr	r1, [sp, #4]
    29e8:	462a      	mov	r2, r5
    29ea:	f7ff ffa9 	bl	2940 <search_EIT_table>
    29ee:	4601      	mov	r1, r0
    29f0:	b1c0      	cbz	r0, 2a24 <get_eit_entry+0x54>
    29f2:	f7ff ff9b 	bl	292c <selfrel_offset31>
    29f6:	684b      	ldr	r3, [r1, #4]
    29f8:	64a0      	str	r0, [r4, #72]	@ 0x48
    29fa:	2b01      	cmp	r3, #1
    29fc:	d02b      	beq.n	2a56 <get_eit_entry+0x86>
    29fe:	2b00      	cmp	r3, #0
    2a00:	f101 0004 	add.w	r0, r1, #4
    2a04:	db25      	blt.n	2a52 <get_eit_entry+0x82>
    2a06:	f7ff ff91 	bl	292c <selfrel_offset31>
    2a0a:	2300      	movs	r3, #0
    2a0c:	6523      	str	r3, [r4, #80]	@ 0x50
    2a0e:	6803      	ldr	r3, [r0, #0]
    2a10:	64e0      	str	r0, [r4, #76]	@ 0x4c
    2a12:	2b00      	cmp	r3, #0
    2a14:	db12      	blt.n	2a3c <get_eit_entry+0x6c>
    2a16:	f7ff ff89 	bl	292c <selfrel_offset31>
    2a1a:	4603      	mov	r3, r0
    2a1c:	2000      	movs	r0, #0
    2a1e:	6123      	str	r3, [r4, #16]
    2a20:	b003      	add	sp, #12
    2a22:	bd30      	pop	{r4, r5, pc}
    2a24:	2300      	movs	r3, #0
    2a26:	2009      	movs	r0, #9
    2a28:	6123      	str	r3, [r4, #16]
    2a2a:	b003      	add	sp, #12
    2a2c:	bd30      	pop	{r4, r5, pc}
    2a2e:	4b0c      	ldr	r3, [pc, #48]	@ (2a60 <get_eit_entry+0x90>)
    2a30:	490c      	ldr	r1, [pc, #48]	@ (2a64 <get_eit_entry+0x94>)
    2a32:	1ac9      	subs	r1, r1, r3
    2a34:	10c9      	asrs	r1, r1, #3
    2a36:	4618      	mov	r0, r3
    2a38:	9101      	str	r1, [sp, #4]
    2a3a:	e7d5      	b.n	29e8 <get_eit_entry+0x18>
    2a3c:	f3c3 6003 	ubfx	r0, r3, #24, #4
    2a40:	f7ff ffb2 	bl	29a8 <__gnu_unwind_get_pr_addr>
    2a44:	1e03      	subs	r3, r0, #0
    2a46:	bf0c      	ite	eq
    2a48:	2009      	moveq	r0, #9
    2a4a:	2000      	movne	r0, #0
    2a4c:	6123      	str	r3, [r4, #16]
    2a4e:	b003      	add	sp, #12
    2a50:	bd30      	pop	{r4, r5, pc}
    2a52:	2301      	movs	r3, #1
    2a54:	e7da      	b.n	2a0c <get_eit_entry+0x3c>
    2a56:	2300      	movs	r3, #0
    2a58:	2005      	movs	r0, #5
    2a5a:	e7e0      	b.n	2a1e <get_eit_entry+0x4e>
    2a5c:	00000000 	.word	0x00000000
    2a60:	000053e4 	.word	0x000053e4
    2a64:	000054ac 	.word	0x000054ac

00002a68 <restore_non_core_regs>:
    2a68:	6803      	ldr	r3, [r0, #0]
    2a6a:	07da      	lsls	r2, r3, #31
    2a6c:	b510      	push	{r4, lr}
    2a6e:	4604      	mov	r4, r0
    2a70:	d406      	bmi.n	2a80 <restore_non_core_regs+0x18>
    2a72:	079b      	lsls	r3, r3, #30
    2a74:	f100 0050 	add.w	r0, r0, #80	@ 0x50
    2a78:	d509      	bpl.n	2a8e <restore_non_core_regs+0x26>
    2a7a:	f000 fc95 	bl	33a8 <__gnu_Unwind_Restore_VFP_D>
    2a7e:	6823      	ldr	r3, [r4, #0]
    2a80:	0759      	lsls	r1, r3, #29
    2a82:	d509      	bpl.n	2a98 <restore_non_core_regs+0x30>
    2a84:	071a      	lsls	r2, r3, #28
    2a86:	d50e      	bpl.n	2aa6 <restore_non_core_regs+0x3e>
    2a88:	06db      	lsls	r3, r3, #27
    2a8a:	d513      	bpl.n	2ab4 <restore_non_core_regs+0x4c>
    2a8c:	bd10      	pop	{r4, pc}
    2a8e:	f000 fc83 	bl	3398 <__gnu_Unwind_Restore_VFP>
    2a92:	6823      	ldr	r3, [r4, #0]
    2a94:	0759      	lsls	r1, r3, #29
    2a96:	d4f5      	bmi.n	2a84 <restore_non_core_regs+0x1c>
    2a98:	f104 00d8 	add.w	r0, r4, #216	@ 0xd8
    2a9c:	f000 fc8c 	bl	33b8 <__gnu_Unwind_Restore_VFP_D_16_to_31>
    2aa0:	6823      	ldr	r3, [r4, #0]
    2aa2:	071a      	lsls	r2, r3, #28
    2aa4:	d4f0      	bmi.n	2a88 <restore_non_core_regs+0x20>
    2aa6:	f504 70ac 	add.w	r0, r4, #344	@ 0x158
    2aaa:	f000 fc8d 	bl	33c8 <__gnu_Unwind_Restore_WMMXD>
    2aae:	6823      	ldr	r3, [r4, #0]
    2ab0:	06db      	lsls	r3, r3, #27
    2ab2:	d4eb      	bmi.n	2a8c <restore_non_core_regs+0x24>
    2ab4:	f504 70ec 	add.w	r0, r4, #472	@ 0x1d8
    2ab8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    2abc:	f000 bcc8 	b.w	3450 <__gnu_Unwind_Restore_WMMXC>

00002ac0 <_Unwind_decode_typeinfo_ptr.constprop.0>:
    2ac0:	4603      	mov	r3, r0
    2ac2:	6800      	ldr	r0, [r0, #0]
    2ac4:	b100      	cbz	r0, 2ac8 <_Unwind_decode_typeinfo_ptr.constprop.0+0x8>
    2ac6:	4418      	add	r0, r3
    2ac8:	4770      	bx	lr
    2aca:	bf00      	nop

00002acc <__gnu_unwind_24bit.isra.0>:
    2acc:	2009      	movs	r0, #9
    2ace:	4770      	bx	lr

00002ad0 <_Unwind_DebugHook>:
    2ad0:	4770      	bx	lr
    2ad2:	bf00      	nop

00002ad4 <unwind_phase2>:
    2ad4:	b570      	push	{r4, r5, r6, lr}
    2ad6:	4604      	mov	r4, r0
    2ad8:	460e      	mov	r6, r1
    2ada:	6c31      	ldr	r1, [r6, #64]	@ 0x40
    2adc:	4620      	mov	r0, r4
    2ade:	f7ff ff77 	bl	29d0 <get_eit_entry>
    2ae2:	4605      	mov	r5, r0
    2ae4:	b988      	cbnz	r0, 2b0a <unwind_phase2+0x36>
    2ae6:	6c32      	ldr	r2, [r6, #64]	@ 0x40
    2ae8:	6162      	str	r2, [r4, #20]
    2aea:	6923      	ldr	r3, [r4, #16]
    2aec:	4632      	mov	r2, r6
    2aee:	4621      	mov	r1, r4
    2af0:	2001      	movs	r0, #1
    2af2:	4798      	blx	r3
    2af4:	2808      	cmp	r0, #8
    2af6:	d0f0      	beq.n	2ada <unwind_phase2+0x6>
    2af8:	2807      	cmp	r0, #7
    2afa:	d106      	bne.n	2b0a <unwind_phase2+0x36>
    2afc:	4628      	mov	r0, r5
    2afe:	6c31      	ldr	r1, [r6, #64]	@ 0x40
    2b00:	f7ff ffe6 	bl	2ad0 <_Unwind_DebugHook>
    2b04:	1d30      	adds	r0, r6, #4
    2b06:	f000 fc3b 	bl	3380 <__restore_core_regs>
    2b0a:	deff      	udf	#255	@ 0xff

00002b0c <unwind_phase2_forced>:
    2b0c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2b10:	f101 0c04 	add.w	ip, r1, #4
    2b14:	68c7      	ldr	r7, [r0, #12]
    2b16:	f8d0 8018 	ldr.w	r8, [r0, #24]
    2b1a:	4606      	mov	r6, r0
    2b1c:	4691      	mov	r9, r2
    2b1e:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2b22:	f5ad 7d76 	sub.w	sp, sp, #984	@ 0x3d8
    2b26:	ac03      	add	r4, sp, #12
    2b28:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2b2a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2b2e:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2b30:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2b34:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2b36:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    2b3a:	ad02      	add	r5, sp, #8
    2b3c:	f04f 0e00 	mov.w	lr, #0
    2b40:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    2b44:	f8c5 e000 	str.w	lr, [r5]
    2b48:	e021      	b.n	2b8e <unwind_phase2_forced+0x82>
    2b4a:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
    2b4c:	6173      	str	r3, [r6, #20]
    2b4e:	f44f 72f4 	mov.w	r2, #488	@ 0x1e8
    2b52:	4629      	mov	r1, r5
    2b54:	a87c      	add	r0, sp, #496	@ 0x1f0
    2b56:	f000 ff19 	bl	398c <memcpy>
    2b5a:	6933      	ldr	r3, [r6, #16]
    2b5c:	aa7c      	add	r2, sp, #496	@ 0x1f0
    2b5e:	4631      	mov	r1, r6
    2b60:	4650      	mov	r0, sl
    2b62:	4798      	blx	r3
    2b64:	9b8a      	ldr	r3, [sp, #552]	@ 0x228
    2b66:	64ab      	str	r3, [r5, #72]	@ 0x48
    2b68:	4649      	mov	r1, r9
    2b6a:	e9cd 5800 	strd	r5, r8, [sp]
    2b6e:	4682      	mov	sl, r0
    2b70:	4633      	mov	r3, r6
    2b72:	2001      	movs	r0, #1
    2b74:	4632      	mov	r2, r6
    2b76:	47b8      	blx	r7
    2b78:	4681      	mov	r9, r0
    2b7a:	bb30      	cbnz	r0, 2bca <unwind_phase2_forced+0xbe>
    2b7c:	f44f 72f4 	mov.w	r2, #488	@ 0x1e8
    2b80:	a97c      	add	r1, sp, #496	@ 0x1f0
    2b82:	4628      	mov	r0, r5
    2b84:	f000 ff02 	bl	398c <memcpy>
    2b88:	f1ba 0f08 	cmp.w	sl, #8
    2b8c:	d11a      	bne.n	2bc4 <unwind_phase2_forced+0xb8>
    2b8e:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    2b90:	4630      	mov	r0, r6
    2b92:	f7ff ff1d 	bl	29d0 <get_eit_entry>
    2b96:	f109 0909 	add.w	r9, r9, #9
    2b9a:	4604      	mov	r4, r0
    2b9c:	fa5f fa89 	uxtb.w	sl, r9
    2ba0:	2800      	cmp	r0, #0
    2ba2:	d0d2      	beq.n	2b4a <unwind_phase2_forced+0x3e>
    2ba4:	6bab      	ldr	r3, [r5, #56]	@ 0x38
    2ba6:	64ab      	str	r3, [r5, #72]	@ 0x48
    2ba8:	4632      	mov	r2, r6
    2baa:	e9cd 5800 	strd	r5, r8, [sp]
    2bae:	4633      	mov	r3, r6
    2bb0:	f04a 0110 	orr.w	r1, sl, #16
    2bb4:	2001      	movs	r0, #1
    2bb6:	47b8      	blx	r7
    2bb8:	b938      	cbnz	r0, 2bca <unwind_phase2_forced+0xbe>
    2bba:	4620      	mov	r0, r4
    2bbc:	f50d 7d76 	add.w	sp, sp, #984	@ 0x3d8
    2bc0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2bc4:	f1ba 0f07 	cmp.w	sl, #7
    2bc8:	d005      	beq.n	2bd6 <unwind_phase2_forced+0xca>
    2bca:	2409      	movs	r4, #9
    2bcc:	4620      	mov	r0, r4
    2bce:	f50d 7d76 	add.w	sp, sp, #984	@ 0x3d8
    2bd2:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2bd6:	4648      	mov	r0, r9
    2bd8:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    2bda:	f7ff ff79 	bl	2ad0 <_Unwind_DebugHook>
    2bde:	a803      	add	r0, sp, #12
    2be0:	f000 fbce 	bl	3380 <__restore_core_regs>

00002be4 <_Unwind_GetCFA>:
    2be4:	6c80      	ldr	r0, [r0, #72]	@ 0x48
    2be6:	4770      	bx	lr

00002be8 <__gnu_Unwind_RaiseException>:
    2be8:	b5f0      	push	{r4, r5, r6, r7, lr}
    2bea:	6bcb      	ldr	r3, [r1, #60]	@ 0x3c
    2bec:	640b      	str	r3, [r1, #64]	@ 0x40
    2bee:	f101 0c04 	add.w	ip, r1, #4
    2bf2:	460e      	mov	r6, r1
    2bf4:	4605      	mov	r5, r0
    2bf6:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2bfa:	b0fb      	sub	sp, #492	@ 0x1ec
    2bfc:	ac01      	add	r4, sp, #4
    2bfe:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2c00:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2c04:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2c06:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2c0a:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    2c0c:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    2c10:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
    2c14:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    2c18:	9700      	str	r7, [sp, #0]
    2c1a:	e006      	b.n	2c2a <__gnu_Unwind_RaiseException+0x42>
    2c1c:	692b      	ldr	r3, [r5, #16]
    2c1e:	466a      	mov	r2, sp
    2c20:	4629      	mov	r1, r5
    2c22:	4798      	blx	r3
    2c24:	2808      	cmp	r0, #8
    2c26:	4604      	mov	r4, r0
    2c28:	d108      	bne.n	2c3c <__gnu_Unwind_RaiseException+0x54>
    2c2a:	9910      	ldr	r1, [sp, #64]	@ 0x40
    2c2c:	4628      	mov	r0, r5
    2c2e:	f7ff fecf 	bl	29d0 <get_eit_entry>
    2c32:	2800      	cmp	r0, #0
    2c34:	d0f2      	beq.n	2c1c <__gnu_Unwind_RaiseException+0x34>
    2c36:	2009      	movs	r0, #9
    2c38:	b07b      	add	sp, #492	@ 0x1ec
    2c3a:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2c3c:	4668      	mov	r0, sp
    2c3e:	f7ff ff13 	bl	2a68 <restore_non_core_regs>
    2c42:	2c06      	cmp	r4, #6
    2c44:	d1f7      	bne.n	2c36 <__gnu_Unwind_RaiseException+0x4e>
    2c46:	4631      	mov	r1, r6
    2c48:	4628      	mov	r0, r5
    2c4a:	f7ff ff43 	bl	2ad4 <unwind_phase2>
    2c4e:	bf00      	nop

00002c50 <__gnu_Unwind_ForcedUnwind>:
    2c50:	60c1      	str	r1, [r0, #12]
    2c52:	6bd9      	ldr	r1, [r3, #60]	@ 0x3c
    2c54:	6182      	str	r2, [r0, #24]
    2c56:	6419      	str	r1, [r3, #64]	@ 0x40
    2c58:	2200      	movs	r2, #0
    2c5a:	4619      	mov	r1, r3
    2c5c:	e756      	b.n	2b0c <unwind_phase2_forced>
    2c5e:	bf00      	nop

00002c60 <__gnu_Unwind_Resume>:
    2c60:	b570      	push	{r4, r5, r6, lr}
    2c62:	68c6      	ldr	r6, [r0, #12]
    2c64:	6943      	ldr	r3, [r0, #20]
    2c66:	640b      	str	r3, [r1, #64]	@ 0x40
    2c68:	b9ae      	cbnz	r6, 2c96 <__gnu_Unwind_Resume+0x36>
    2c6a:	6903      	ldr	r3, [r0, #16]
    2c6c:	460a      	mov	r2, r1
    2c6e:	4604      	mov	r4, r0
    2c70:	460d      	mov	r5, r1
    2c72:	4601      	mov	r1, r0
    2c74:	2002      	movs	r0, #2
    2c76:	4798      	blx	r3
    2c78:	2807      	cmp	r0, #7
    2c7a:	d005      	beq.n	2c88 <__gnu_Unwind_Resume+0x28>
    2c7c:	2808      	cmp	r0, #8
    2c7e:	d10e      	bne.n	2c9e <__gnu_Unwind_Resume+0x3e>
    2c80:	4629      	mov	r1, r5
    2c82:	4620      	mov	r0, r4
    2c84:	f7ff ff26 	bl	2ad4 <unwind_phase2>
    2c88:	4630      	mov	r0, r6
    2c8a:	6c29      	ldr	r1, [r5, #64]	@ 0x40
    2c8c:	f7ff ff20 	bl	2ad0 <_Unwind_DebugHook>
    2c90:	1d28      	adds	r0, r5, #4
    2c92:	f000 fb75 	bl	3380 <__restore_core_regs>
    2c96:	2201      	movs	r2, #1
    2c98:	f7ff ff38 	bl	2b0c <unwind_phase2_forced>
    2c9c:	deff      	udf	#255	@ 0xff
    2c9e:	deff      	udf	#255	@ 0xff

00002ca0 <__gnu_Unwind_Resume_or_Rethrow>:
    2ca0:	68c2      	ldr	r2, [r0, #12]
    2ca2:	b11a      	cbz	r2, 2cac <__gnu_Unwind_Resume_or_Rethrow+0xc>
    2ca4:	6bca      	ldr	r2, [r1, #60]	@ 0x3c
    2ca6:	640a      	str	r2, [r1, #64]	@ 0x40
    2ca8:	2200      	movs	r2, #0
    2caa:	e72f      	b.n	2b0c <unwind_phase2_forced>
    2cac:	e79c      	b.n	2be8 <__gnu_Unwind_RaiseException>
    2cae:	bf00      	nop

00002cb0 <_Unwind_Complete>:
    2cb0:	4770      	bx	lr
    2cb2:	bf00      	nop

00002cb4 <_Unwind_DeleteException>:
    2cb4:	6883      	ldr	r3, [r0, #8]
    2cb6:	4601      	mov	r1, r0
    2cb8:	b10b      	cbz	r3, 2cbe <_Unwind_DeleteException+0xa>
    2cba:	2001      	movs	r0, #1
    2cbc:	4718      	bx	r3
    2cbe:	4770      	bx	lr

00002cc0 <_Unwind_VRS_Get>:
    2cc0:	2905      	cmp	r1, #5
    2cc2:	d815      	bhi.n	2cf0 <_Unwind_VRS_Get+0x30>
    2cc4:	e8df f001 	tbb	[pc, r1]
    2cc8:	0314030a 	.word	0x0314030a
    2ccc:	0503      	.short	0x0503
    2cce:	2001      	movs	r0, #1
    2cd0:	4770      	bx	lr
    2cd2:	9a00      	ldr	r2, [sp, #0]
    2cd4:	6c43      	ldr	r3, [r0, #68]	@ 0x44
    2cd6:	6013      	str	r3, [r2, #0]
    2cd8:	2000      	movs	r0, #0
    2cda:	4770      	bx	lr
    2cdc:	b943      	cbnz	r3, 2cf0 <_Unwind_VRS_Get+0x30>
    2cde:	2a0f      	cmp	r2, #15
    2ce0:	d806      	bhi.n	2cf0 <_Unwind_VRS_Get+0x30>
    2ce2:	eb00 0282 	add.w	r2, r0, r2, lsl #2
    2ce6:	2000      	movs	r0, #0
    2ce8:	6853      	ldr	r3, [r2, #4]
    2cea:	9a00      	ldr	r2, [sp, #0]
    2cec:	6013      	str	r3, [r2, #0]
    2cee:	4770      	bx	lr
    2cf0:	2002      	movs	r0, #2
    2cf2:	4770      	bx	lr

00002cf4 <_Unwind_GetGR>:
    2cf4:	b500      	push	{lr}
    2cf6:	b085      	sub	sp, #20
    2cf8:	460a      	mov	r2, r1
    2cfa:	2300      	movs	r3, #0
    2cfc:	a903      	add	r1, sp, #12
    2cfe:	9100      	str	r1, [sp, #0]
    2d00:	4619      	mov	r1, r3
    2d02:	f7ff ffdd 	bl	2cc0 <_Unwind_VRS_Get>
    2d06:	9803      	ldr	r0, [sp, #12]
    2d08:	b005      	add	sp, #20
    2d0a:	f85d fb04 	ldr.w	pc, [sp], #4
    2d0e:	bf00      	nop

00002d10 <_Unwind_VRS_Set>:
    2d10:	2905      	cmp	r1, #5
    2d12:	d815      	bhi.n	2d40 <_Unwind_VRS_Set+0x30>
    2d14:	e8df f001 	tbb	[pc, r1]
    2d18:	0314030a 	.word	0x0314030a
    2d1c:	0503      	.short	0x0503
    2d1e:	2001      	movs	r0, #1
    2d20:	4770      	bx	lr
    2d22:	9b00      	ldr	r3, [sp, #0]
    2d24:	681b      	ldr	r3, [r3, #0]
    2d26:	6443      	str	r3, [r0, #68]	@ 0x44
    2d28:	2000      	movs	r0, #0
    2d2a:	4770      	bx	lr
    2d2c:	b943      	cbnz	r3, 2d40 <_Unwind_VRS_Set+0x30>
    2d2e:	2a0f      	cmp	r2, #15
    2d30:	d806      	bhi.n	2d40 <_Unwind_VRS_Set+0x30>
    2d32:	9b00      	ldr	r3, [sp, #0]
    2d34:	eb00 0282 	add.w	r2, r0, r2, lsl #2
    2d38:	681b      	ldr	r3, [r3, #0]
    2d3a:	6053      	str	r3, [r2, #4]
    2d3c:	2000      	movs	r0, #0
    2d3e:	4770      	bx	lr
    2d40:	2002      	movs	r0, #2
    2d42:	4770      	bx	lr

00002d44 <_Unwind_SetGR>:
    2d44:	b510      	push	{r4, lr}
    2d46:	b084      	sub	sp, #16
    2d48:	2300      	movs	r3, #0
    2d4a:	ac03      	add	r4, sp, #12
    2d4c:	9203      	str	r2, [sp, #12]
    2d4e:	9400      	str	r4, [sp, #0]
    2d50:	460a      	mov	r2, r1
    2d52:	4619      	mov	r1, r3
    2d54:	f7ff ffdc 	bl	2d10 <_Unwind_VRS_Set>
    2d58:	b004      	add	sp, #16
    2d5a:	bd10      	pop	{r4, pc}

00002d5c <__gnu_Unwind_Backtrace>:
    2d5c:	b570      	push	{r4, r5, r6, lr}
    2d5e:	6bd3      	ldr	r3, [r2, #60]	@ 0x3c
    2d60:	6413      	str	r3, [r2, #64]	@ 0x40
    2d62:	f102 0c04 	add.w	ip, r2, #4
    2d66:	4605      	mov	r5, r0
    2d68:	460c      	mov	r4, r1
    2d6a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2d6e:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
    2d72:	f10d 0e5c 	add.w	lr, sp, #92	@ 0x5c
    2d76:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    2d7a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2d7e:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    2d82:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
    2d86:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
    2d8a:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
    2d8e:	f04f 36ff 	mov.w	r6, #4294967295	@ 0xffffffff
    2d92:	e88e 000f 	stmia.w	lr, {r0, r1, r2, r3}
    2d96:	9616      	str	r6, [sp, #88]	@ 0x58
    2d98:	e010      	b.n	2dbc <__gnu_Unwind_Backtrace+0x60>
    2d9a:	f7ff ffd3 	bl	2d44 <_Unwind_SetGR>
    2d9e:	4621      	mov	r1, r4
    2da0:	a816      	add	r0, sp, #88	@ 0x58
    2da2:	47a8      	blx	r5
    2da4:	4603      	mov	r3, r0
    2da6:	aa16      	add	r2, sp, #88	@ 0x58
    2da8:	2008      	movs	r0, #8
    2daa:	4669      	mov	r1, sp
    2dac:	b983      	cbnz	r3, 2dd0 <__gnu_Unwind_Backtrace+0x74>
    2dae:	9b04      	ldr	r3, [sp, #16]
    2db0:	4798      	blx	r3
    2db2:	2805      	cmp	r0, #5
    2db4:	4606      	mov	r6, r0
    2db6:	d00c      	beq.n	2dd2 <__gnu_Unwind_Backtrace+0x76>
    2db8:	2809      	cmp	r0, #9
    2dba:	d009      	beq.n	2dd0 <__gnu_Unwind_Backtrace+0x74>
    2dbc:	9926      	ldr	r1, [sp, #152]	@ 0x98
    2dbe:	4668      	mov	r0, sp
    2dc0:	f7ff fe06 	bl	29d0 <get_eit_entry>
    2dc4:	4603      	mov	r3, r0
    2dc6:	210c      	movs	r1, #12
    2dc8:	466a      	mov	r2, sp
    2dca:	a816      	add	r0, sp, #88	@ 0x58
    2dcc:	2b00      	cmp	r3, #0
    2dce:	d0e4      	beq.n	2d9a <__gnu_Unwind_Backtrace+0x3e>
    2dd0:	2609      	movs	r6, #9
    2dd2:	a816      	add	r0, sp, #88	@ 0x58
    2dd4:	f7ff fe48 	bl	2a68 <restore_non_core_regs>
    2dd8:	4630      	mov	r0, r6
    2dda:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
    2dde:	bd70      	pop	{r4, r5, r6, pc}

00002de0 <__gnu_unwind_pr_common>:
    2de0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2de4:	4616      	mov	r6, r2
    2de6:	6cca      	ldr	r2, [r1, #76]	@ 0x4c
    2de8:	b089      	sub	sp, #36	@ 0x24
    2dea:	460d      	mov	r5, r1
    2dec:	f852 1b04 	ldr.w	r1, [r2], #4
    2df0:	9206      	str	r2, [sp, #24]
    2df2:	f000 0c03 	and.w	ip, r0, #3
    2df6:	2b00      	cmp	r3, #0
    2df8:	d079      	beq.n	2eee <__gnu_unwind_pr_common+0x10e>
    2dfa:	0c0c      	lsrs	r4, r1, #16
    2dfc:	f88d 401d 	strb.w	r4, [sp, #29]
    2e00:	0409      	lsls	r1, r1, #16
    2e02:	b2e4      	uxtb	r4, r4
    2e04:	9105      	str	r1, [sp, #20]
    2e06:	eb02 0284 	add.w	r2, r2, r4, lsl #2
    2e0a:	2102      	movs	r1, #2
    2e0c:	f88d 101c 	strb.w	r1, [sp, #28]
    2e10:	6d29      	ldr	r1, [r5, #80]	@ 0x50
    2e12:	f1bc 0f02 	cmp.w	ip, #2
    2e16:	bf08      	it	eq
    2e18:	6baa      	ldreq	r2, [r5, #56]	@ 0x38
    2e1a:	f011 0801 	ands.w	r8, r1, #1
    2e1e:	d009      	beq.n	2e34 <__gnu_unwind_pr_common+0x54>
    2e20:	a905      	add	r1, sp, #20
    2e22:	4630      	mov	r0, r6
    2e24:	f000 fbae 	bl	3584 <__gnu_unwind_execute>
    2e28:	2800      	cmp	r0, #0
    2e2a:	d156      	bne.n	2eda <__gnu_unwind_pr_common+0xfa>
    2e2c:	2008      	movs	r0, #8
    2e2e:	b009      	add	sp, #36	@ 0x24
    2e30:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2e34:	6817      	ldr	r7, [r2, #0]
    2e36:	2f00      	cmp	r7, #0
    2e38:	d0f2      	beq.n	2e20 <__gnu_unwind_pr_common+0x40>
    2e3a:	f000 0108 	and.w	r1, r0, #8
    2e3e:	e9cd 1801 	strd	r1, r8, [sp, #4]
    2e42:	46e3      	mov	fp, ip
    2e44:	469a      	mov	sl, r3
    2e46:	f1ba 0f02 	cmp.w	sl, #2
    2e4a:	d04c      	beq.n	2ee6 <__gnu_unwind_pr_common+0x106>
    2e4c:	8817      	ldrh	r7, [r2, #0]
    2e4e:	8854      	ldrh	r4, [r2, #2]
    2e50:	f102 0904 	add.w	r9, r2, #4
    2e54:	6caa      	ldr	r2, [r5, #72]	@ 0x48
    2e56:	f024 0301 	bic.w	r3, r4, #1
    2e5a:	210f      	movs	r1, #15
    2e5c:	4630      	mov	r0, r6
    2e5e:	eb03 0802 	add.w	r8, r3, r2
    2e62:	f7ff ff47 	bl	2cf4 <_Unwind_GetGR>
    2e66:	4580      	cmp	r8, r0
    2e68:	d83b      	bhi.n	2ee2 <__gnu_unwind_pr_common+0x102>
    2e6a:	f027 0201 	bic.w	r2, r7, #1
    2e6e:	eb02 0308 	add.w	r3, r2, r8
    2e72:	4283      	cmp	r3, r0
    2e74:	bf94      	ite	ls
    2e76:	2300      	movls	r3, #0
    2e78:	2301      	movhi	r3, #1
    2e7a:	0064      	lsls	r4, r4, #1
    2e7c:	f004 0402 	and.w	r4, r4, #2
    2e80:	f007 0701 	and.w	r7, r7, #1
    2e84:	4327      	orrs	r7, r4
    2e86:	2f01      	cmp	r7, #1
    2e88:	d04e      	beq.n	2f28 <__gnu_unwind_pr_common+0x148>
    2e8a:	2f02      	cmp	r7, #2
    2e8c:	d035      	beq.n	2efa <__gnu_unwind_pr_common+0x11a>
    2e8e:	bb27      	cbnz	r7, 2eda <__gnu_unwind_pr_common+0xfa>
    2e90:	f1bb 0f00 	cmp.w	fp, #0
    2e94:	d002      	beq.n	2e9c <__gnu_unwind_pr_common+0xbc>
    2e96:	2b00      	cmp	r3, #0
    2e98:	f040 80d3 	bne.w	3042 <__gnu_unwind_pr_common+0x262>
    2e9c:	f109 0204 	add.w	r2, r9, #4
    2ea0:	6817      	ldr	r7, [r2, #0]
    2ea2:	2f00      	cmp	r7, #0
    2ea4:	d1cf      	bne.n	2e46 <__gnu_unwind_pr_common+0x66>
    2ea6:	a905      	add	r1, sp, #20
    2ea8:	4630      	mov	r0, r6
    2eaa:	f8dd 8008 	ldr.w	r8, [sp, #8]
    2eae:	f000 fb69 	bl	3584 <__gnu_unwind_execute>
    2eb2:	b990      	cbnz	r0, 2eda <__gnu_unwind_pr_common+0xfa>
    2eb4:	f1b8 0f00 	cmp.w	r8, #0
    2eb8:	d0b8      	beq.n	2e2c <__gnu_unwind_pr_common+0x4c>
    2eba:	210f      	movs	r1, #15
    2ebc:	4630      	mov	r0, r6
    2ebe:	f7ff ff19 	bl	2cf4 <_Unwind_GetGR>
    2ec2:	210e      	movs	r1, #14
    2ec4:	4602      	mov	r2, r0
    2ec6:	4630      	mov	r0, r6
    2ec8:	f7ff ff3c 	bl	2d44 <_Unwind_SetGR>
    2ecc:	4a6c      	ldr	r2, [pc, #432]	@ (3080 <__gnu_unwind_pr_common+0x2a0>)
    2ece:	210f      	movs	r1, #15
    2ed0:	4630      	mov	r0, r6
    2ed2:	f7ff ff37 	bl	2d44 <_Unwind_SetGR>
    2ed6:	2007      	movs	r0, #7
    2ed8:	e000      	b.n	2edc <__gnu_unwind_pr_common+0xfc>
    2eda:	2009      	movs	r0, #9
    2edc:	b009      	add	sp, #36	@ 0x24
    2ede:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2ee2:	2300      	movs	r3, #0
    2ee4:	e7c9      	b.n	2e7a <__gnu_unwind_pr_common+0x9a>
    2ee6:	6854      	ldr	r4, [r2, #4]
    2ee8:	f102 0908 	add.w	r9, r2, #8
    2eec:	e7b2      	b.n	2e54 <__gnu_unwind_pr_common+0x74>
    2eee:	0209      	lsls	r1, r1, #8
    2ef0:	9105      	str	r1, [sp, #20]
    2ef2:	f88d 301d 	strb.w	r3, [sp, #29]
    2ef6:	2103      	movs	r1, #3
    2ef8:	e788      	b.n	2e0c <__gnu_unwind_pr_common+0x2c>
    2efa:	f8d9 4000 	ldr.w	r4, [r9]
    2efe:	f024 4800 	bic.w	r8, r4, #2147483648	@ 0x80000000
    2f02:	f1bb 0f00 	cmp.w	fp, #0
    2f06:	d147      	bne.n	2f98 <__gnu_unwind_pr_common+0x1b8>
    2f08:	b12b      	cbz	r3, 2f16 <__gnu_unwind_pr_common+0x136>
    2f0a:	9b01      	ldr	r3, [sp, #4]
    2f0c:	2b00      	cmp	r3, #0
    2f0e:	d05c      	beq.n	2fca <__gnu_unwind_pr_common+0x1ea>
    2f10:	f1b8 0f00 	cmp.w	r8, #0
    2f14:	d059      	beq.n	2fca <__gnu_unwind_pr_common+0x1ea>
    2f16:	2c00      	cmp	r4, #0
    2f18:	da01      	bge.n	2f1e <__gnu_unwind_pr_common+0x13e>
    2f1a:	f109 0904 	add.w	r9, r9, #4
    2f1e:	f108 0201 	add.w	r2, r8, #1
    2f22:	eb09 0282 	add.w	r2, r9, r2, lsl #2
    2f26:	e7bb      	b.n	2ea0 <__gnu_unwind_pr_common+0xc0>
    2f28:	f1bb 0f00 	cmp.w	fp, #0
    2f2c:	d11c      	bne.n	2f68 <__gnu_unwind_pr_common+0x188>
    2f2e:	b1c3      	cbz	r3, 2f62 <__gnu_unwind_pr_common+0x182>
    2f30:	f8d9 3004 	ldr.w	r3, [r9, #4]
    2f34:	f8d9 2000 	ldr.w	r2, [r9]
    2f38:	1c99      	adds	r1, r3, #2
    2f3a:	ea4f 72d2 	mov.w	r2, r2, lsr #31
    2f3e:	d0cc      	beq.n	2eda <__gnu_unwind_pr_common+0xfa>
    2f40:	f105 0458 	add.w	r4, r5, #88	@ 0x58
    2f44:	3301      	adds	r3, #1
    2f46:	9404      	str	r4, [sp, #16]
    2f48:	f000 808e 	beq.w	3068 <__gnu_unwind_pr_common+0x288>
    2f4c:	f109 0004 	add.w	r0, r9, #4
    2f50:	f7ff fdb6 	bl	2ac0 <_Unwind_decode_typeinfo_ptr.constprop.0>
    2f54:	ab04      	add	r3, sp, #16
    2f56:	4601      	mov	r1, r0
    2f58:	4628      	mov	r0, r5
    2f5a:	f3af 8000 	nop.w
    2f5e:	2800      	cmp	r0, #0
    2f60:	d159      	bne.n	3016 <__gnu_unwind_pr_common+0x236>
    2f62:	f109 0208 	add.w	r2, r9, #8
    2f66:	e79b      	b.n	2ea0 <__gnu_unwind_pr_common+0xc0>
    2f68:	210d      	movs	r1, #13
    2f6a:	4630      	mov	r0, r6
    2f6c:	f7ff fec2 	bl	2cf4 <_Unwind_GetGR>
    2f70:	6a2c      	ldr	r4, [r5, #32]
    2f72:	4284      	cmp	r4, r0
    2f74:	d1f5      	bne.n	2f62 <__gnu_unwind_pr_common+0x182>
    2f76:	6aab      	ldr	r3, [r5, #40]	@ 0x28
    2f78:	4599      	cmp	r9, r3
    2f7a:	d1f2      	bne.n	2f62 <__gnu_unwind_pr_common+0x182>
    2f7c:	4648      	mov	r0, r9
    2f7e:	f7ff fcd5 	bl	292c <selfrel_offset31>
    2f82:	210f      	movs	r1, #15
    2f84:	4602      	mov	r2, r0
    2f86:	4630      	mov	r0, r6
    2f88:	f7ff fedc 	bl	2d44 <_Unwind_SetGR>
    2f8c:	462a      	mov	r2, r5
    2f8e:	2100      	movs	r1, #0
    2f90:	4630      	mov	r0, r6
    2f92:	f7ff fed7 	bl	2d44 <_Unwind_SetGR>
    2f96:	e79e      	b.n	2ed6 <__gnu_unwind_pr_common+0xf6>
    2f98:	210d      	movs	r1, #13
    2f9a:	4630      	mov	r0, r6
    2f9c:	f7ff feaa 	bl	2cf4 <_Unwind_GetGR>
    2fa0:	6a2f      	ldr	r7, [r5, #32]
    2fa2:	4287      	cmp	r7, r0
    2fa4:	d1b7      	bne.n	2f16 <__gnu_unwind_pr_common+0x136>
    2fa6:	6aab      	ldr	r3, [r5, #40]	@ 0x28
    2fa8:	4599      	cmp	r9, r3
    2faa:	d1b4      	bne.n	2f16 <__gnu_unwind_pr_common+0x136>
    2fac:	2400      	movs	r4, #0
    2fae:	2304      	movs	r3, #4
    2fb0:	e9c5 430b 	strd	r4, r3, [r5, #44]	@ 0x2c
    2fb4:	444b      	add	r3, r9
    2fb6:	f8c5 8028 	str.w	r8, [r5, #40]	@ 0x28
    2fba:	636b      	str	r3, [r5, #52]	@ 0x34
    2fbc:	f8d9 3000 	ldr.w	r3, [r9]
    2fc0:	42a3      	cmp	r3, r4
    2fc2:	db58      	blt.n	3076 <__gnu_unwind_pr_common+0x296>
    2fc4:	2301      	movs	r3, #1
    2fc6:	9302      	str	r3, [sp, #8]
    2fc8:	e7a9      	b.n	2f1e <__gnu_unwind_pr_common+0x13e>
    2fca:	f105 0358 	add.w	r3, r5, #88	@ 0x58
    2fce:	f8cd b00c 	str.w	fp, [sp, #12]
    2fd2:	f109 0704 	add.w	r7, r9, #4
    2fd6:	46b3      	mov	fp, r6
    2fd8:	2400      	movs	r4, #0
    2fda:	461e      	mov	r6, r3
    2fdc:	e00b      	b.n	2ff6 <__gnu_unwind_pr_common+0x216>
    2fde:	4638      	mov	r0, r7
    2fe0:	9604      	str	r6, [sp, #16]
    2fe2:	f7ff fd6d 	bl	2ac0 <_Unwind_decode_typeinfo_ptr.constprop.0>
    2fe6:	2200      	movs	r2, #0
    2fe8:	4601      	mov	r1, r0
    2fea:	ab04      	add	r3, sp, #16
    2fec:	4628      	mov	r0, r5
    2fee:	f3af 8000 	nop.w
    2ff2:	3704      	adds	r7, #4
    2ff4:	b9f8      	cbnz	r0, 3036 <__gnu_unwind_pr_common+0x256>
    2ff6:	4544      	cmp	r4, r8
    2ff8:	f104 0401 	add.w	r4, r4, #1
    2ffc:	d1ef      	bne.n	2fde <__gnu_unwind_pr_common+0x1fe>
    2ffe:	210d      	movs	r1, #13
    3000:	4658      	mov	r0, fp
    3002:	f7ff fe77 	bl	2cf4 <_Unwind_GetGR>
    3006:	9b04      	ldr	r3, [sp, #16]
    3008:	f8c5 9028 	str.w	r9, [r5, #40]	@ 0x28
    300c:	4602      	mov	r2, r0
    300e:	e9c5 2308 	strd	r2, r3, [r5, #32]
    3012:	2006      	movs	r0, #6
    3014:	e762      	b.n	2edc <__gnu_unwind_pr_common+0xfc>
    3016:	4604      	mov	r4, r0
    3018:	210d      	movs	r1, #13
    301a:	4630      	mov	r0, r6
    301c:	f7ff fe6a 	bl	2cf4 <_Unwind_GetGR>
    3020:	9e04      	ldr	r6, [sp, #16]
    3022:	6228      	str	r0, [r5, #32]
    3024:	2c02      	cmp	r4, #2
    3026:	bf04      	itt	eq
    3028:	62ee      	streq	r6, [r5, #44]	@ 0x2c
    302a:	f105 062c 	addeq.w	r6, r5, #44	@ 0x2c
    302e:	e9c5 6909 	strd	r6, r9, [r5, #36]	@ 0x24
    3032:	2006      	movs	r0, #6
    3034:	e752      	b.n	2edc <__gnu_unwind_pr_common+0xfc>
    3036:	465e      	mov	r6, fp
    3038:	f8d9 4000 	ldr.w	r4, [r9]
    303c:	f8dd b00c 	ldr.w	fp, [sp, #12]
    3040:	e769      	b.n	2f16 <__gnu_unwind_pr_common+0x136>
    3042:	4648      	mov	r0, r9
    3044:	f7ff fc72 	bl	292c <selfrel_offset31>
    3048:	f109 0304 	add.w	r3, r9, #4
    304c:	4604      	mov	r4, r0
    304e:	63ab      	str	r3, [r5, #56]	@ 0x38
    3050:	4628      	mov	r0, r5
    3052:	f3af 8000 	nop.w
    3056:	2800      	cmp	r0, #0
    3058:	f43f af3f 	beq.w	2eda <__gnu_unwind_pr_common+0xfa>
    305c:	4622      	mov	r2, r4
    305e:	210f      	movs	r1, #15
    3060:	4630      	mov	r0, r6
    3062:	f7ff fe6f 	bl	2d44 <_Unwind_SetGR>
    3066:	e736      	b.n	2ed6 <__gnu_unwind_pr_common+0xf6>
    3068:	4630      	mov	r0, r6
    306a:	210d      	movs	r1, #13
    306c:	f7ff fe42 	bl	2cf4 <_Unwind_GetGR>
    3070:	4626      	mov	r6, r4
    3072:	6228      	str	r0, [r5, #32]
    3074:	e7db      	b.n	302e <__gnu_unwind_pr_common+0x24e>
    3076:	f108 0201 	add.w	r2, r8, #1
    307a:	eb09 0082 	add.w	r0, r9, r2, lsl #2
    307e:	e77e      	b.n	2f7e <__gnu_unwind_pr_common+0x19e>
    3080:	00000000 	.word	0x00000000

00003084 <__aeabi_unwind_cpp_pr0>:
    3084:	2300      	movs	r3, #0
    3086:	e6ab      	b.n	2de0 <__gnu_unwind_pr_common>

00003088 <__aeabi_unwind_cpp_pr1>:
    3088:	2301      	movs	r3, #1
    308a:	e6a9      	b.n	2de0 <__gnu_unwind_pr_common>

0000308c <__aeabi_unwind_cpp_pr2>:
    308c:	2302      	movs	r3, #2
    308e:	e6a7      	b.n	2de0 <__gnu_unwind_pr_common>

00003090 <_Unwind_VRS_Pop>:
    3090:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3094:	4606      	mov	r6, r0
    3096:	b0c4      	sub	sp, #272	@ 0x110
    3098:	4614      	mov	r4, r2
    309a:	2905      	cmp	r1, #5
    309c:	f200 80d8 	bhi.w	3250 <_Unwind_VRS_Pop+0x1c0>
    30a0:	e8df f011 	tbh	[pc, r1, lsl #1]
    30a4:	002d0012 	.word	0x002d0012
    30a8:	006c00d6 	.word	0x006c00d6
    30ac:	00060091 	.word	0x00060091
    30b0:	6b83      	ldr	r3, [r0, #56]	@ 0x38
    30b2:	2c00      	cmp	r4, #0
    30b4:	f040 80cc 	bne.w	3250 <_Unwind_VRS_Pop+0x1c0>
    30b8:	f853 2b04 	ldr.w	r2, [r3], #4
    30bc:	6442      	str	r2, [r0, #68]	@ 0x44
    30be:	6383      	str	r3, [r0, #56]	@ 0x38
    30c0:	2000      	movs	r0, #0
    30c2:	b044      	add	sp, #272	@ 0x110
    30c4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    30c8:	2b00      	cmp	r3, #0
    30ca:	f040 80c1 	bne.w	3250 <_Unwind_VRS_Pop+0x1c0>
    30ce:	6b85      	ldr	r5, [r0, #56]	@ 0x38
    30d0:	fa1f fc84 	uxth.w	ip, r4
    30d4:	2001      	movs	r0, #1
    30d6:	f106 0e04 	add.w	lr, r6, #4
    30da:	fa00 f103 	lsl.w	r1, r0, r3
    30de:	ea11 0f0c 	tst.w	r1, ip
    30e2:	462a      	mov	r2, r5
    30e4:	d004      	beq.n	30f0 <_Unwind_VRS_Pop+0x60>
    30e6:	f852 1b04 	ldr.w	r1, [r2], #4
    30ea:	f84e 1023 	str.w	r1, [lr, r3, lsl #2]
    30ee:	4615      	mov	r5, r2
    30f0:	3301      	adds	r3, #1
    30f2:	2b10      	cmp	r3, #16
    30f4:	d1f1      	bne.n	30da <_Unwind_VRS_Pop+0x4a>
    30f6:	04a7      	lsls	r7, r4, #18
    30f8:	d4e2      	bmi.n	30c0 <_Unwind_VRS_Pop+0x30>
    30fa:	63b5      	str	r5, [r6, #56]	@ 0x38
    30fc:	e7e0      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    30fe:	2b01      	cmp	r3, #1
    3100:	ea4f 4714 	mov.w	r7, r4, lsr #16
    3104:	b2a4      	uxth	r4, r4
    3106:	f000 8083 	beq.w	3210 <_Unwind_VRS_Pop+0x180>
    310a:	2b05      	cmp	r3, #5
    310c:	f040 80a0 	bne.w	3250 <_Unwind_VRS_Pop+0x1c0>
    3110:	eb07 0804 	add.w	r8, r7, r4
    3114:	f1b8 0f20 	cmp.w	r8, #32
    3118:	f200 809a 	bhi.w	3250 <_Unwind_VRS_Pop+0x1c0>
    311c:	2f0f      	cmp	r7, #15
    311e:	f240 8099 	bls.w	3254 <_Unwind_VRS_Pop+0x1c4>
    3122:	2c00      	cmp	r4, #0
    3124:	d0cc      	beq.n	30c0 <_Unwind_VRS_Pop+0x30>
    3126:	6802      	ldr	r2, [r0, #0]
    3128:	0750      	lsls	r0, r2, #29
    312a:	f100 8118 	bmi.w	335e <_Unwind_VRS_Pop+0x2ce>
    312e:	9301      	str	r3, [sp, #4]
    3130:	ad02      	add	r5, sp, #8
    3132:	4628      	mov	r0, r5
    3134:	f000 f944 	bl	33c0 <__gnu_Unwind_Save_VFP_D_16_to_31>
    3138:	ea4f 0c44 	mov.w	ip, r4, lsl #1
    313c:	f1a7 0010 	sub.w	r0, r7, #16
    3140:	6bb1      	ldr	r1, [r6, #56]	@ 0x38
    3142:	9b01      	ldr	r3, [sp, #4]
    3144:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
    3148:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
    314c:	f10c 0c01 	add.w	ip, ip, #1
    3150:	3804      	subs	r0, #4
    3152:	eb01 028c 	add.w	r2, r1, ip, lsl #2
    3156:	f851 4b04 	ldr.w	r4, [r1], #4
    315a:	f840 4f04 	str.w	r4, [r0, #4]!
    315e:	4291      	cmp	r1, r2
    3160:	d1f9      	bne.n	3156 <_Unwind_VRS_Pop+0xc6>
    3162:	2b01      	cmp	r3, #1
    3164:	f000 80de 	beq.w	3324 <_Unwind_VRS_Pop+0x294>
    3168:	2f0f      	cmp	r7, #15
    316a:	63b1      	str	r1, [r6, #56]	@ 0x38
    316c:	d802      	bhi.n	3174 <_Unwind_VRS_Pop+0xe4>
    316e:	a822      	add	r0, sp, #136	@ 0x88
    3170:	f000 f91a 	bl	33a8 <__gnu_Unwind_Restore_VFP_D>
    3174:	4628      	mov	r0, r5
    3176:	f000 f91f 	bl	33b8 <__gnu_Unwind_Restore_VFP_D_16_to_31>
    317a:	e7a1      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    317c:	2b03      	cmp	r3, #3
    317e:	d167      	bne.n	3250 <_Unwind_VRS_Pop+0x1c0>
    3180:	b2a7      	uxth	r7, r4
    3182:	eb07 4314 	add.w	r3, r7, r4, lsr #16
    3186:	2b10      	cmp	r3, #16
    3188:	ea4f 4414 	mov.w	r4, r4, lsr #16
    318c:	d860      	bhi.n	3250 <_Unwind_VRS_Pop+0x1c0>
    318e:	6803      	ldr	r3, [r0, #0]
    3190:	0719      	lsls	r1, r3, #28
    3192:	f100 80bf 	bmi.w	3314 <_Unwind_VRS_Pop+0x284>
    3196:	ad22      	add	r5, sp, #136	@ 0x88
    3198:	4628      	mov	r0, r5
    319a:	f000 f937 	bl	340c <__gnu_Unwind_Save_WMMXD>
    319e:	007a      	lsls	r2, r7, #1
    31a0:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
    31a2:	eb05 04c4 	add.w	r4, r5, r4, lsl #3
    31a6:	1e53      	subs	r3, r2, #1
    31a8:	b142      	cbz	r2, 31bc <_Unwind_VRS_Pop+0x12c>
    31aa:	1b01      	subs	r1, r0, r4
    31ac:	5862      	ldr	r2, [r4, r1]
    31ae:	f844 2b04 	str.w	r2, [r4], #4
    31b2:	3b01      	subs	r3, #1
    31b4:	1c5a      	adds	r2, r3, #1
    31b6:	d1f9      	bne.n	31ac <_Unwind_VRS_Pop+0x11c>
    31b8:	eb00 00c7 	add.w	r0, r0, r7, lsl #3
    31bc:	63b0      	str	r0, [r6, #56]	@ 0x38
    31be:	4628      	mov	r0, r5
    31c0:	f000 f902 	bl	33c8 <__gnu_Unwind_Restore_WMMXD>
    31c4:	e77c      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    31c6:	2b00      	cmp	r3, #0
    31c8:	d142      	bne.n	3250 <_Unwind_VRS_Pop+0x1c0>
    31ca:	2c10      	cmp	r4, #16
    31cc:	d840      	bhi.n	3250 <_Unwind_VRS_Pop+0x1c0>
    31ce:	6803      	ldr	r3, [r0, #0]
    31d0:	06dd      	lsls	r5, r3, #27
    31d2:	f100 8097 	bmi.w	3304 <_Unwind_VRS_Pop+0x274>
    31d6:	ad22      	add	r5, sp, #136	@ 0x88
    31d8:	4628      	mov	r0, r5
    31da:	f000 f943 	bl	3464 <__gnu_Unwind_Save_WMMXC>
    31de:	6bb7      	ldr	r7, [r6, #56]	@ 0x38
    31e0:	4629      	mov	r1, r5
    31e2:	2300      	movs	r3, #0
    31e4:	f04f 0c01 	mov.w	ip, #1
    31e8:	fa0c f203 	lsl.w	r2, ip, r3
    31ec:	4222      	tst	r2, r4
    31ee:	4638      	mov	r0, r7
    31f0:	f103 0301 	add.w	r3, r3, #1
    31f4:	d003      	beq.n	31fe <_Unwind_VRS_Pop+0x16e>
    31f6:	f850 2b04 	ldr.w	r2, [r0], #4
    31fa:	600a      	str	r2, [r1, #0]
    31fc:	4607      	mov	r7, r0
    31fe:	2b04      	cmp	r3, #4
    3200:	f101 0104 	add.w	r1, r1, #4
    3204:	d1f0      	bne.n	31e8 <_Unwind_VRS_Pop+0x158>
    3206:	63b7      	str	r7, [r6, #56]	@ 0x38
    3208:	4628      	mov	r0, r5
    320a:	f000 f921 	bl	3450 <__gnu_Unwind_Restore_WMMXC>
    320e:	e757      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    3210:	193a      	adds	r2, r7, r4
    3212:	2a10      	cmp	r2, #16
    3214:	d81c      	bhi.n	3250 <_Unwind_VRS_Pop+0x1c0>
    3216:	2f10      	cmp	r7, #16
    3218:	d01a      	beq.n	3250 <_Unwind_VRS_Pop+0x1c0>
    321a:	6802      	ldr	r2, [r0, #0]
    321c:	07d0      	lsls	r0, r2, #31
    321e:	d508      	bpl.n	3232 <_Unwind_VRS_Pop+0x1a2>
    3220:	4630      	mov	r0, r6
    3222:	f022 0203 	bic.w	r2, r2, #3
    3226:	f840 2b50 	str.w	r2, [r0], #80
    322a:	9301      	str	r3, [sp, #4]
    322c:	f000 f8b8 	bl	33a0 <__gnu_Unwind_Save_VFP>
    3230:	9b01      	ldr	r3, [sp, #4]
    3232:	9301      	str	r3, [sp, #4]
    3234:	ad22      	add	r5, sp, #136	@ 0x88
    3236:	4628      	mov	r0, r5
    3238:	f000 f8b2 	bl	33a0 <__gnu_Unwind_Save_VFP>
    323c:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    323e:	9b01      	ldr	r3, [sp, #4]
    3240:	2c00      	cmp	r4, #0
    3242:	d158      	bne.n	32f6 <_Unwind_VRS_Pop+0x266>
    3244:	3204      	adds	r2, #4
    3246:	63b2      	str	r2, [r6, #56]	@ 0x38
    3248:	4628      	mov	r0, r5
    324a:	f000 f8a5 	bl	3398 <__gnu_Unwind_Restore_VFP>
    324e:	e737      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    3250:	2002      	movs	r0, #2
    3252:	e736      	b.n	30c2 <_Unwind_VRS_Pop+0x32>
    3254:	f1b8 0f10 	cmp.w	r8, #16
    3258:	6802      	ldr	r2, [r0, #0]
    325a:	d965      	bls.n	3328 <_Unwind_VRS_Pop+0x298>
    325c:	07d4      	lsls	r4, r2, #31
    325e:	d572      	bpl.n	3346 <_Unwind_VRS_Pop+0x2b6>
    3260:	f022 0201 	bic.w	r2, r2, #1
    3264:	f042 0202 	orr.w	r2, r2, #2
    3268:	f840 2b50 	str.w	r2, [r0], #80
    326c:	9301      	str	r3, [sp, #4]
    326e:	f000 f89f 	bl	33b0 <__gnu_Unwind_Save_VFP_D>
    3272:	6832      	ldr	r2, [r6, #0]
    3274:	9b01      	ldr	r3, [sp, #4]
    3276:	f012 0f04 	tst.w	r2, #4
    327a:	d166      	bne.n	334a <_Unwind_VRS_Pop+0x2ba>
    327c:	ad22      	add	r5, sp, #136	@ 0x88
    327e:	4628      	mov	r0, r5
    3280:	9301      	str	r3, [sp, #4]
    3282:	f000 f895 	bl	33b0 <__gnu_Unwind_Save_VFP_D>
    3286:	a802      	add	r0, sp, #8
    3288:	f000 f89a 	bl	33c0 <__gnu_Unwind_Save_VFP_D_16_to_31>
    328c:	f1c7 0110 	rsb	r1, r7, #16
    3290:	0049      	lsls	r1, r1, #1
    3292:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    3294:	9b01      	ldr	r3, [sp, #4]
    3296:	f1a8 0c10 	sub.w	ip, r8, #16
    329a:	1e4c      	subs	r4, r1, #1
    329c:	eb05 00c7 	add.w	r0, r5, r7, lsl #3
    32a0:	3401      	adds	r4, #1
    32a2:	3804      	subs	r0, #4
    32a4:	eb02 0184 	add.w	r1, r2, r4, lsl #2
    32a8:	f852 4b04 	ldr.w	r4, [r2], #4
    32ac:	f840 4f04 	str.w	r4, [r0, #4]!
    32b0:	428a      	cmp	r2, r1
    32b2:	d1f9      	bne.n	32a8 <_Unwind_VRS_Pop+0x218>
    32b4:	f1bc 0f00 	cmp.w	ip, #0
    32b8:	d05a      	beq.n	3370 <_Unwind_VRS_Pop+0x2e0>
    32ba:	2f10      	cmp	r7, #16
    32bc:	4638      	mov	r0, r7
    32be:	bf38      	it	cc
    32c0:	2010      	movcc	r0, #16
    32c2:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    32c6:	3810      	subs	r0, #16
    32c8:	ad02      	add	r5, sp, #8
    32ca:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
    32ce:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
    32d2:	e73b      	b.n	314c <_Unwind_VRS_Pop+0xbc>
    32d4:	4630      	mov	r0, r6
    32d6:	f022 0201 	bic.w	r2, r2, #1
    32da:	f042 0202 	orr.w	r2, r2, #2
    32de:	f840 2b50 	str.w	r2, [r0], #80
    32e2:	ad22      	add	r5, sp, #136	@ 0x88
    32e4:	9301      	str	r3, [sp, #4]
    32e6:	f000 f863 	bl	33b0 <__gnu_Unwind_Save_VFP_D>
    32ea:	4628      	mov	r0, r5
    32ec:	f000 f860 	bl	33b0 <__gnu_Unwind_Save_VFP_D>
    32f0:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    32f2:	b324      	cbz	r4, 333e <_Unwind_VRS_Pop+0x2ae>
    32f4:	9b01      	ldr	r3, [sp, #4]
    32f6:	0064      	lsls	r4, r4, #1
    32f8:	3c01      	subs	r4, #1
    32fa:	eb05 00c7 	add.w	r0, r5, r7, lsl #3
    32fe:	f04f 0c00 	mov.w	ip, #0
    3302:	e7cd      	b.n	32a0 <_Unwind_VRS_Pop+0x210>
    3304:	f023 0310 	bic.w	r3, r3, #16
    3308:	6003      	str	r3, [r0, #0]
    330a:	f500 70ec 	add.w	r0, r0, #472	@ 0x1d8
    330e:	f000 f8a9 	bl	3464 <__gnu_Unwind_Save_WMMXC>
    3312:	e760      	b.n	31d6 <_Unwind_VRS_Pop+0x146>
    3314:	f023 0308 	bic.w	r3, r3, #8
    3318:	6003      	str	r3, [r0, #0]
    331a:	f500 70ac 	add.w	r0, r0, #344	@ 0x158
    331e:	f000 f875 	bl	340c <__gnu_Unwind_Save_WMMXD>
    3322:	e738      	b.n	3196 <_Unwind_VRS_Pop+0x106>
    3324:	ad22      	add	r5, sp, #136	@ 0x88
    3326:	e78d      	b.n	3244 <_Unwind_VRS_Pop+0x1b4>
    3328:	07d1      	lsls	r1, r2, #31
    332a:	d4d3      	bmi.n	32d4 <_Unwind_VRS_Pop+0x244>
    332c:	ad22      	add	r5, sp, #136	@ 0x88
    332e:	4628      	mov	r0, r5
    3330:	9301      	str	r3, [sp, #4]
    3332:	f000 f83d 	bl	33b0 <__gnu_Unwind_Save_VFP_D>
    3336:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
    3338:	9b01      	ldr	r3, [sp, #4]
    333a:	2c00      	cmp	r4, #0
    333c:	d1db      	bne.n	32f6 <_Unwind_VRS_Pop+0x266>
    333e:	4628      	mov	r0, r5
    3340:	f000 f832 	bl	33a8 <__gnu_Unwind_Restore_VFP_D>
    3344:	e6bc      	b.n	30c0 <_Unwind_VRS_Pop+0x30>
    3346:	0754      	lsls	r4, r2, #29
    3348:	d598      	bpl.n	327c <_Unwind_VRS_Pop+0x1ec>
    334a:	4630      	mov	r0, r6
    334c:	f022 0204 	bic.w	r2, r2, #4
    3350:	f840 2bd8 	str.w	r2, [r0], #216
    3354:	9301      	str	r3, [sp, #4]
    3356:	f000 f833 	bl	33c0 <__gnu_Unwind_Save_VFP_D_16_to_31>
    335a:	9b01      	ldr	r3, [sp, #4]
    335c:	e78e      	b.n	327c <_Unwind_VRS_Pop+0x1ec>
    335e:	4630      	mov	r0, r6
    3360:	f022 0204 	bic.w	r2, r2, #4
    3364:	f840 2bd8 	str.w	r2, [r0], #216
    3368:	9301      	str	r3, [sp, #4]
    336a:	f000 f829 	bl	33c0 <__gnu_Unwind_Save_VFP_D_16_to_31>
    336e:	e6df      	b.n	3130 <_Unwind_VRS_Pop+0xa0>
    3370:	2b01      	cmp	r3, #1
    3372:	f43f af67 	beq.w	3244 <_Unwind_VRS_Pop+0x1b4>
    3376:	2f0f      	cmp	r7, #15
    3378:	63b2      	str	r2, [r6, #56]	@ 0x38
    337a:	f63f aea1 	bhi.w	30c0 <_Unwind_VRS_Pop+0x30>
    337e:	e7de      	b.n	333e <_Unwind_VRS_Pop+0x2ae>

00003380 <__restore_core_regs>:
    3380:	f100 0134 	add.w	r1, r0, #52	@ 0x34
    3384:	e891 0038 	ldmia.w	r1, {r3, r4, r5}
    3388:	469c      	mov	ip, r3
    338a:	46a6      	mov	lr, r4
    338c:	f84c 5d04 	str.w	r5, [ip, #-4]!
    3390:	e890 0fff 	ldmia.w	r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
    3394:	46e5      	mov	sp, ip
    3396:	bd00      	pop	{pc}

00003398 <__gnu_Unwind_Restore_VFP>:
    3398:	ec90 0b21 	fldmiax	r0, {d0-d15}	@ Deprecated
    339c:	4770      	bx	lr
    339e:	bf00      	nop

000033a0 <__gnu_Unwind_Save_VFP>:
    33a0:	ec80 0b21 	fstmiax	r0, {d0-d15}	@ Deprecated
    33a4:	4770      	bx	lr
    33a6:	bf00      	nop

000033a8 <__gnu_Unwind_Restore_VFP_D>:
    33a8:	ec90 0b20 	vldmia	r0, {d0-d15}
    33ac:	4770      	bx	lr
    33ae:	bf00      	nop

000033b0 <__gnu_Unwind_Save_VFP_D>:
    33b0:	ec80 0b20 	vstmia	r0, {d0-d15}
    33b4:	4770      	bx	lr
    33b6:	bf00      	nop

000033b8 <__gnu_Unwind_Restore_VFP_D_16_to_31>:
    33b8:	ecd0 0b20 	vldmia	r0, {d16-d31}
    33bc:	4770      	bx	lr
    33be:	bf00      	nop

000033c0 <__gnu_Unwind_Save_VFP_D_16_to_31>:
    33c0:	ecc0 0b20 	vstmia	r0, {d16-d31}
    33c4:	4770      	bx	lr
    33c6:	bf00      	nop

000033c8 <__gnu_Unwind_Restore_WMMXD>:
    33c8:	ecf0 0102 	ldfe	f0, [r0], #8
    33cc:	ecf0 1102 	ldfe	f1, [r0], #8
    33d0:	ecf0 2102 	ldfe	f2, [r0], #8
    33d4:	ecf0 3102 	ldfe	f3, [r0], #8
    33d8:	ecf0 4102 	ldfe	f4, [r0], #8
    33dc:	ecf0 5102 	ldfe	f5, [r0], #8
    33e0:	ecf0 6102 	ldfe	f6, [r0], #8
    33e4:	ecf0 7102 	ldfe	f7, [r0], #8
    33e8:	ecf0 8102 	ldfp	f0, [r0], #8
    33ec:	ecf0 9102 	ldfp	f1, [r0], #8
    33f0:	ecf0 a102 	ldfp	f2, [r0], #8
    33f4:	ecf0 b102 	ldfp	f3, [r0], #8
    33f8:	ecf0 c102 	ldfp	f4, [r0], #8
    33fc:	ecf0 d102 	ldfp	f5, [r0], #8
    3400:	ecf0 e102 	ldfp	f6, [r0], #8
    3404:	ecf0 f102 	ldfp	f7, [r0], #8
    3408:	4770      	bx	lr
    340a:	bf00      	nop

0000340c <__gnu_Unwind_Save_WMMXD>:
    340c:	ece0 0102 	stfe	f0, [r0], #8
    3410:	ece0 1102 	stfe	f1, [r0], #8
    3414:	ece0 2102 	stfe	f2, [r0], #8
    3418:	ece0 3102 	stfe	f3, [r0], #8
    341c:	ece0 4102 	stfe	f4, [r0], #8
    3420:	ece0 5102 	stfe	f5, [r0], #8
    3424:	ece0 6102 	stfe	f6, [r0], #8
    3428:	ece0 7102 	stfe	f7, [r0], #8
    342c:	ece0 8102 	stfp	f0, [r0], #8
    3430:	ece0 9102 	stfp	f1, [r0], #8
    3434:	ece0 a102 	stfp	f2, [r0], #8
    3438:	ece0 b102 	stfp	f3, [r0], #8
    343c:	ece0 c102 	stfp	f4, [r0], #8
    3440:	ece0 d102 	stfp	f5, [r0], #8
    3444:	ece0 e102 	stfp	f6, [r0], #8
    3448:	ece0 f102 	stfp	f7, [r0], #8
    344c:	4770      	bx	lr
    344e:	bf00      	nop

00003450 <__gnu_Unwind_Restore_WMMXC>:
    3450:	fcb0 8101 	ldc2	1, cr8, [r0], #4
    3454:	fcb0 9101 	ldc2	1, cr9, [r0], #4
    3458:	fcb0 a101 	ldc2	1, cr10, [r0], #4
    345c:	fcb0 b101 	ldc2	1, cr11, [r0], #4
    3460:	4770      	bx	lr
    3462:	bf00      	nop

00003464 <__gnu_Unwind_Save_WMMXC>:
    3464:	fca0 8101 	stc2	1, cr8, [r0], #4
    3468:	fca0 9101 	stc2	1, cr9, [r0], #4
    346c:	fca0 a101 	stc2	1, cr10, [r0], #4
    3470:	fca0 b101 	stc2	1, cr11, [r0], #4
    3474:	4770      	bx	lr
    3476:	bf00      	nop

00003478 <_Unwind_RaiseException>:
    3478:	46ec      	mov	ip, sp
    347a:	b500      	push	{lr}
    347c:	e92d 5000 	stmdb	sp!, {ip, lr}
    3480:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    3484:	f04f 0300 	mov.w	r3, #0
    3488:	e92d 000c 	stmdb	sp!, {r2, r3}
    348c:	a901      	add	r1, sp, #4
    348e:	f7ff fbab 	bl	2be8 <__gnu_Unwind_RaiseException>
    3492:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    3496:	b012      	add	sp, #72	@ 0x48
    3498:	4770      	bx	lr
    349a:	bf00      	nop

0000349c <_Unwind_Resume>:
    349c:	46ec      	mov	ip, sp
    349e:	b500      	push	{lr}
    34a0:	e92d 5000 	stmdb	sp!, {ip, lr}
    34a4:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    34a8:	f04f 0300 	mov.w	r3, #0
    34ac:	e92d 000c 	stmdb	sp!, {r2, r3}
    34b0:	a901      	add	r1, sp, #4
    34b2:	f7ff fbd5 	bl	2c60 <__gnu_Unwind_Resume>
    34b6:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    34ba:	b012      	add	sp, #72	@ 0x48
    34bc:	4770      	bx	lr
    34be:	bf00      	nop

000034c0 <_Unwind_Resume_or_Rethrow>:
    34c0:	46ec      	mov	ip, sp
    34c2:	b500      	push	{lr}
    34c4:	e92d 5000 	stmdb	sp!, {ip, lr}
    34c8:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    34cc:	f04f 0300 	mov.w	r3, #0
    34d0:	e92d 000c 	stmdb	sp!, {r2, r3}
    34d4:	a901      	add	r1, sp, #4
    34d6:	f7ff fbe3 	bl	2ca0 <__gnu_Unwind_Resume_or_Rethrow>
    34da:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    34de:	b012      	add	sp, #72	@ 0x48
    34e0:	4770      	bx	lr
    34e2:	bf00      	nop

000034e4 <_Unwind_ForcedUnwind>:
    34e4:	46ec      	mov	ip, sp
    34e6:	b500      	push	{lr}
    34e8:	e92d 5000 	stmdb	sp!, {ip, lr}
    34ec:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    34f0:	f04f 0300 	mov.w	r3, #0
    34f4:	e92d 000c 	stmdb	sp!, {r2, r3}
    34f8:	ab01      	add	r3, sp, #4
    34fa:	f7ff fba9 	bl	2c50 <__gnu_Unwind_ForcedUnwind>
    34fe:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    3502:	b012      	add	sp, #72	@ 0x48
    3504:	4770      	bx	lr
    3506:	bf00      	nop

00003508 <_Unwind_Backtrace>:
    3508:	46ec      	mov	ip, sp
    350a:	b500      	push	{lr}
    350c:	e92d 5000 	stmdb	sp!, {ip, lr}
    3510:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    3514:	f04f 0300 	mov.w	r3, #0
    3518:	e92d 000c 	stmdb	sp!, {r2, r3}
    351c:	aa01      	add	r2, sp, #4
    351e:	f7ff fc1d 	bl	2d5c <__gnu_Unwind_Backtrace>
    3522:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
    3526:	b012      	add	sp, #72	@ 0x48
    3528:	4770      	bx	lr
    352a:	bf00      	nop

0000352c <next_unwind_byte>:
    352c:	7a02      	ldrb	r2, [r0, #8]
    352e:	4603      	mov	r3, r0
    3530:	b97a      	cbnz	r2, 3552 <next_unwind_byte+0x26>
    3532:	7a42      	ldrb	r2, [r0, #9]
    3534:	b1a2      	cbz	r2, 3560 <next_unwind_byte+0x34>
    3536:	6841      	ldr	r1, [r0, #4]
    3538:	3a01      	subs	r2, #1
    353a:	b410      	push	{r4}
    353c:	7242      	strb	r2, [r0, #9]
    353e:	6808      	ldr	r0, [r1, #0]
    3540:	2203      	movs	r2, #3
    3542:	1d0c      	adds	r4, r1, #4
    3544:	721a      	strb	r2, [r3, #8]
    3546:	0202      	lsls	r2, r0, #8
    3548:	605c      	str	r4, [r3, #4]
    354a:	0e00      	lsrs	r0, r0, #24
    354c:	bc10      	pop	{r4}
    354e:	601a      	str	r2, [r3, #0]
    3550:	4770      	bx	lr
    3552:	6800      	ldr	r0, [r0, #0]
    3554:	3a01      	subs	r2, #1
    3556:	721a      	strb	r2, [r3, #8]
    3558:	0202      	lsls	r2, r0, #8
    355a:	601a      	str	r2, [r3, #0]
    355c:	0e00      	lsrs	r0, r0, #24
    355e:	4770      	bx	lr
    3560:	20b0      	movs	r0, #176	@ 0xb0
    3562:	4770      	bx	lr

00003564 <_Unwind_GetGR.constprop.0>:
    3564:	b500      	push	{lr}
    3566:	b085      	sub	sp, #20
    3568:	aa03      	add	r2, sp, #12
    356a:	2300      	movs	r3, #0
    356c:	9200      	str	r2, [sp, #0]
    356e:	4619      	mov	r1, r3
    3570:	220c      	movs	r2, #12
    3572:	f7ff fba5 	bl	2cc0 <_Unwind_VRS_Get>
    3576:	9803      	ldr	r0, [sp, #12]
    3578:	b005      	add	sp, #20
    357a:	f85d fb04 	ldr.w	pc, [sp], #4
    357e:	bf00      	nop

00003580 <unwind_UCB_from_context>:
    3580:	e7f0      	b.n	3564 <_Unwind_GetGR.constprop.0>
    3582:	bf00      	nop

00003584 <__gnu_unwind_execute>:
    3584:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    3588:	4606      	mov	r6, r0
    358a:	b085      	sub	sp, #20
    358c:	460d      	mov	r5, r1
    358e:	f04f 0800 	mov.w	r8, #0
    3592:	4628      	mov	r0, r5
    3594:	f7ff ffca 	bl	352c <next_unwind_byte>
    3598:	28b0      	cmp	r0, #176	@ 0xb0
    359a:	4604      	mov	r4, r0
    359c:	f000 811c 	beq.w	37d8 <__gnu_unwind_execute+0x254>
    35a0:	0607      	lsls	r7, r0, #24
    35a2:	d55b      	bpl.n	365c <__gnu_unwind_execute+0xd8>
    35a4:	f000 03f0 	and.w	r3, r0, #240	@ 0xf0
    35a8:	2ba0      	cmp	r3, #160	@ 0xa0
    35aa:	d01a      	beq.n	35e2 <__gnu_unwind_execute+0x5e>
    35ac:	d830      	bhi.n	3610 <__gnu_unwind_execute+0x8c>
    35ae:	2b80      	cmp	r3, #128	@ 0x80
    35b0:	f000 8082 	beq.w	36b8 <__gnu_unwind_execute+0x134>
    35b4:	2b90      	cmp	r3, #144	@ 0x90
    35b6:	d127      	bne.n	3608 <__gnu_unwind_execute+0x84>
    35b8:	f000 030d 	and.w	r3, r0, #13
    35bc:	2b0d      	cmp	r3, #13
    35be:	d023      	beq.n	3608 <__gnu_unwind_execute+0x84>
    35c0:	af02      	add	r7, sp, #8
    35c2:	2300      	movs	r3, #0
    35c4:	f000 020f 	and.w	r2, r0, #15
    35c8:	4619      	mov	r1, r3
    35ca:	9700      	str	r7, [sp, #0]
    35cc:	4630      	mov	r0, r6
    35ce:	f7ff fb77 	bl	2cc0 <_Unwind_VRS_Get>
    35d2:	2300      	movs	r3, #0
    35d4:	9700      	str	r7, [sp, #0]
    35d6:	220d      	movs	r2, #13
    35d8:	4619      	mov	r1, r3
    35da:	4630      	mov	r0, r6
    35dc:	f7ff fb98 	bl	2d10 <_Unwind_VRS_Set>
    35e0:	e7d7      	b.n	3592 <__gnu_unwind_execute+0xe>
    35e2:	43c3      	mvns	r3, r0
    35e4:	f003 0307 	and.w	r3, r3, #7
    35e8:	f44f 627f 	mov.w	r2, #4080	@ 0xff0
    35ec:	411a      	asrs	r2, r3
    35ee:	0701      	lsls	r1, r0, #28
    35f0:	f402 627f 	and.w	r2, r2, #4080	@ 0xff0
    35f4:	d501      	bpl.n	35fa <__gnu_unwind_execute+0x76>
    35f6:	f442 4280 	orr.w	r2, r2, #16384	@ 0x4000
    35fa:	2300      	movs	r3, #0
    35fc:	4619      	mov	r1, r3
    35fe:	4630      	mov	r0, r6
    3600:	f7ff fd46 	bl	3090 <_Unwind_VRS_Pop>
    3604:	2800      	cmp	r0, #0
    3606:	d0c4      	beq.n	3592 <__gnu_unwind_execute+0xe>
    3608:	2009      	movs	r0, #9
    360a:	b005      	add	sp, #20
    360c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    3610:	2bb0      	cmp	r3, #176	@ 0xb0
    3612:	d068      	beq.n	36e6 <__gnu_unwind_execute+0x162>
    3614:	2bc0      	cmp	r3, #192	@ 0xc0
    3616:	d13d      	bne.n	3694 <__gnu_unwind_execute+0x110>
    3618:	28c6      	cmp	r0, #198	@ 0xc6
    361a:	f000 80ca 	beq.w	37b2 <__gnu_unwind_execute+0x22e>
    361e:	28c7      	cmp	r0, #199	@ 0xc7
    3620:	f000 80df 	beq.w	37e2 <__gnu_unwind_execute+0x25e>
    3624:	f000 03f8 	and.w	r3, r0, #248	@ 0xf8
    3628:	2bc0      	cmp	r3, #192	@ 0xc0
    362a:	f000 80ec 	beq.w	3806 <__gnu_unwind_execute+0x282>
    362e:	28c8      	cmp	r0, #200	@ 0xc8
    3630:	f000 80f7 	beq.w	3822 <__gnu_unwind_execute+0x29e>
    3634:	28c9      	cmp	r0, #201	@ 0xc9
    3636:	d1e7      	bne.n	3608 <__gnu_unwind_execute+0x84>
    3638:	4628      	mov	r0, r5
    363a:	f7ff ff77 	bl	352c <next_unwind_byte>
    363e:	0302      	lsls	r2, r0, #12
    3640:	f000 000f 	and.w	r0, r0, #15
    3644:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    3648:	3001      	adds	r0, #1
    364a:	4302      	orrs	r2, r0
    364c:	2101      	movs	r1, #1
    364e:	2305      	movs	r3, #5
    3650:	4630      	mov	r0, r6
    3652:	f7ff fd1d 	bl	3090 <_Unwind_VRS_Pop>
    3656:	2800      	cmp	r0, #0
    3658:	d09b      	beq.n	3592 <__gnu_unwind_execute+0xe>
    365a:	e7d5      	b.n	3608 <__gnu_unwind_execute+0x84>
    365c:	0083      	lsls	r3, r0, #2
    365e:	b2db      	uxtb	r3, r3
    3660:	1d1f      	adds	r7, r3, #4
    3662:	f10d 0908 	add.w	r9, sp, #8
    3666:	2300      	movs	r3, #0
    3668:	4619      	mov	r1, r3
    366a:	f8cd 9000 	str.w	r9, [sp]
    366e:	220d      	movs	r2, #13
    3670:	4630      	mov	r0, r6
    3672:	f7ff fb25 	bl	2cc0 <_Unwind_VRS_Get>
    3676:	9b02      	ldr	r3, [sp, #8]
    3678:	f8cd 9000 	str.w	r9, [sp]
    367c:	0660      	lsls	r0, r4, #25
    367e:	bf4c      	ite	mi
    3680:	1bdf      	submi	r7, r3, r7
    3682:	18ff      	addpl	r7, r7, r3
    3684:	2300      	movs	r3, #0
    3686:	220d      	movs	r2, #13
    3688:	4619      	mov	r1, r3
    368a:	4630      	mov	r0, r6
    368c:	9702      	str	r7, [sp, #8]
    368e:	f7ff fb3f 	bl	2d10 <_Unwind_VRS_Set>
    3692:	e77e      	b.n	3592 <__gnu_unwind_execute+0xe>
    3694:	f000 03f8 	and.w	r3, r0, #248	@ 0xf8
    3698:	2bd0      	cmp	r3, #208	@ 0xd0
    369a:	d1b5      	bne.n	3608 <__gnu_unwind_execute+0x84>
    369c:	f000 0207 	and.w	r2, r0, #7
    36a0:	3201      	adds	r2, #1
    36a2:	2305      	movs	r3, #5
    36a4:	f442 2200 	orr.w	r2, r2, #524288	@ 0x80000
    36a8:	2101      	movs	r1, #1
    36aa:	4630      	mov	r0, r6
    36ac:	f7ff fcf0 	bl	3090 <_Unwind_VRS_Pop>
    36b0:	2800      	cmp	r0, #0
    36b2:	f43f af6e 	beq.w	3592 <__gnu_unwind_execute+0xe>
    36b6:	e7a7      	b.n	3608 <__gnu_unwind_execute+0x84>
    36b8:	4628      	mov	r0, r5
    36ba:	f7ff ff37 	bl	352c <next_unwind_byte>
    36be:	0224      	lsls	r4, r4, #8
    36c0:	4320      	orrs	r0, r4
    36c2:	f5b0 4f00 	cmp.w	r0, #32768	@ 0x8000
    36c6:	d09f      	beq.n	3608 <__gnu_unwind_execute+0x84>
    36c8:	0104      	lsls	r4, r0, #4
    36ca:	2300      	movs	r3, #0
    36cc:	b2a2      	uxth	r2, r4
    36ce:	4619      	mov	r1, r3
    36d0:	4630      	mov	r0, r6
    36d2:	f7ff fcdd 	bl	3090 <_Unwind_VRS_Pop>
    36d6:	2800      	cmp	r0, #0
    36d8:	d196      	bne.n	3608 <__gnu_unwind_execute+0x84>
    36da:	f414 4f00 	tst.w	r4, #32768	@ 0x8000
    36de:	bf18      	it	ne
    36e0:	f04f 0801 	movne.w	r8, #1
    36e4:	e755      	b.n	3592 <__gnu_unwind_execute+0xe>
    36e6:	f1a0 03b1 	sub.w	r3, r0, #177	@ 0xb1
    36ea:	2b04      	cmp	r3, #4
    36ec:	f200 80b5 	bhi.w	385a <__gnu_unwind_execute+0x2d6>
    36f0:	e8df f003 	tbb	[pc, r3]
    36f4:	0c162955 	.word	0x0c162955
    36f8:	03          	.byte	0x03
    36f9:	00          	.byte	0x00
    36fa:	aa03      	add	r2, sp, #12
    36fc:	2300      	movs	r3, #0
    36fe:	9200      	str	r2, [sp, #0]
    3700:	4619      	mov	r1, r3
    3702:	220d      	movs	r2, #13
    3704:	4630      	mov	r0, r6
    3706:	f7ff fadb 	bl	2cc0 <_Unwind_VRS_Get>
    370a:	e742      	b.n	3592 <__gnu_unwind_execute+0xe>
    370c:	2300      	movs	r3, #0
    370e:	461a      	mov	r2, r3
    3710:	2105      	movs	r1, #5
    3712:	4630      	mov	r0, r6
    3714:	f7ff fcbc 	bl	3090 <_Unwind_VRS_Pop>
    3718:	2800      	cmp	r0, #0
    371a:	f43f af3a 	beq.w	3592 <__gnu_unwind_execute+0xe>
    371e:	e773      	b.n	3608 <__gnu_unwind_execute+0x84>
    3720:	4628      	mov	r0, r5
    3722:	f7ff ff03 	bl	352c <next_unwind_byte>
    3726:	0302      	lsls	r2, r0, #12
    3728:	f000 000f 	and.w	r0, r0, #15
    372c:	3001      	adds	r0, #1
    372e:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    3732:	2301      	movs	r3, #1
    3734:	4302      	orrs	r2, r0
    3736:	4619      	mov	r1, r3
    3738:	4630      	mov	r0, r6
    373a:	f7ff fca9 	bl	3090 <_Unwind_VRS_Pop>
    373e:	2800      	cmp	r0, #0
    3740:	f43f af27 	beq.w	3592 <__gnu_unwind_execute+0xe>
    3744:	e760      	b.n	3608 <__gnu_unwind_execute+0x84>
    3746:	2300      	movs	r3, #0
    3748:	f10d 0908 	add.w	r9, sp, #8
    374c:	220d      	movs	r2, #13
    374e:	4619      	mov	r1, r3
    3750:	f8cd 9000 	str.w	r9, [sp]
    3754:	4630      	mov	r0, r6
    3756:	f7ff fab3 	bl	2cc0 <_Unwind_VRS_Get>
    375a:	4628      	mov	r0, r5
    375c:	f7ff fee6 	bl	352c <next_unwind_byte>
    3760:	0602      	lsls	r2, r0, #24
    3762:	9c02      	ldr	r4, [sp, #8]
    3764:	f04f 0702 	mov.w	r7, #2
    3768:	d50b      	bpl.n	3782 <__gnu_unwind_execute+0x1fe>
    376a:	f000 007f 	and.w	r0, r0, #127	@ 0x7f
    376e:	40b8      	lsls	r0, r7
    3770:	4404      	add	r4, r0
    3772:	4628      	mov	r0, r5
    3774:	9402      	str	r4, [sp, #8]
    3776:	f7ff fed9 	bl	352c <next_unwind_byte>
    377a:	0603      	lsls	r3, r0, #24
    377c:	f107 0707 	add.w	r7, r7, #7
    3780:	d4f3      	bmi.n	376a <__gnu_unwind_execute+0x1e6>
    3782:	40b8      	lsls	r0, r7
    3784:	2300      	movs	r3, #0
    3786:	f504 7401 	add.w	r4, r4, #516	@ 0x204
    378a:	4404      	add	r4, r0
    378c:	f8cd 9000 	str.w	r9, [sp]
    3790:	220d      	movs	r2, #13
    3792:	4619      	mov	r1, r3
    3794:	4630      	mov	r0, r6
    3796:	9402      	str	r4, [sp, #8]
    3798:	f7ff faba 	bl	2d10 <_Unwind_VRS_Set>
    379c:	e6f9      	b.n	3592 <__gnu_unwind_execute+0xe>
    379e:	4628      	mov	r0, r5
    37a0:	f7ff fec4 	bl	352c <next_unwind_byte>
    37a4:	1e43      	subs	r3, r0, #1
    37a6:	b2db      	uxtb	r3, r3
    37a8:	2b0e      	cmp	r3, #14
    37aa:	4602      	mov	r2, r0
    37ac:	f67f af25 	bls.w	35fa <__gnu_unwind_execute+0x76>
    37b0:	e72a      	b.n	3608 <__gnu_unwind_execute+0x84>
    37b2:	4628      	mov	r0, r5
    37b4:	f7ff feba 	bl	352c <next_unwind_byte>
    37b8:	0302      	lsls	r2, r0, #12
    37ba:	f000 000f 	and.w	r0, r0, #15
    37be:	3001      	adds	r0, #1
    37c0:	f402 2270 	and.w	r2, r2, #983040	@ 0xf0000
    37c4:	2303      	movs	r3, #3
    37c6:	4302      	orrs	r2, r0
    37c8:	4619      	mov	r1, r3
    37ca:	4630      	mov	r0, r6
    37cc:	f7ff fc60 	bl	3090 <_Unwind_VRS_Pop>
    37d0:	2800      	cmp	r0, #0
    37d2:	f43f aede 	beq.w	3592 <__gnu_unwind_execute+0xe>
    37d6:	e717      	b.n	3608 <__gnu_unwind_execute+0x84>
    37d8:	f1b8 0f00 	cmp.w	r8, #0
    37dc:	d02d      	beq.n	383a <__gnu_unwind_execute+0x2b6>
    37de:	2000      	movs	r0, #0
    37e0:	e713      	b.n	360a <__gnu_unwind_execute+0x86>
    37e2:	4628      	mov	r0, r5
    37e4:	f7ff fea2 	bl	352c <next_unwind_byte>
    37e8:	1e43      	subs	r3, r0, #1
    37ea:	b2db      	uxtb	r3, r3
    37ec:	2b0e      	cmp	r3, #14
    37ee:	4602      	mov	r2, r0
    37f0:	f63f af0a 	bhi.w	3608 <__gnu_unwind_execute+0x84>
    37f4:	2300      	movs	r3, #0
    37f6:	2104      	movs	r1, #4
    37f8:	4630      	mov	r0, r6
    37fa:	f7ff fc49 	bl	3090 <_Unwind_VRS_Pop>
    37fe:	2800      	cmp	r0, #0
    3800:	f43f aec7 	beq.w	3592 <__gnu_unwind_execute+0xe>
    3804:	e700      	b.n	3608 <__gnu_unwind_execute+0x84>
    3806:	f000 020f 	and.w	r2, r0, #15
    380a:	3201      	adds	r2, #1
    380c:	2303      	movs	r3, #3
    380e:	f442 2220 	orr.w	r2, r2, #655360	@ 0xa0000
    3812:	4619      	mov	r1, r3
    3814:	4630      	mov	r0, r6
    3816:	f7ff fc3b 	bl	3090 <_Unwind_VRS_Pop>
    381a:	2800      	cmp	r0, #0
    381c:	f43f aeb9 	beq.w	3592 <__gnu_unwind_execute+0xe>
    3820:	e6f2      	b.n	3608 <__gnu_unwind_execute+0x84>
    3822:	4628      	mov	r0, r5
    3824:	f7ff fe82 	bl	352c <next_unwind_byte>
    3828:	f000 02f0 	and.w	r2, r0, #240	@ 0xf0
    382c:	f000 030f 	and.w	r3, r0, #15
    3830:	3210      	adds	r2, #16
    3832:	3301      	adds	r3, #1
    3834:	ea43 3202 	orr.w	r2, r3, r2, lsl #12
    3838:	e708      	b.n	364c <__gnu_unwind_execute+0xc8>
    383a:	ac02      	add	r4, sp, #8
    383c:	4643      	mov	r3, r8
    383e:	4641      	mov	r1, r8
    3840:	9400      	str	r4, [sp, #0]
    3842:	220e      	movs	r2, #14
    3844:	4630      	mov	r0, r6
    3846:	f7ff fa3b 	bl	2cc0 <_Unwind_VRS_Get>
    384a:	220f      	movs	r2, #15
    384c:	9400      	str	r4, [sp, #0]
    384e:	4643      	mov	r3, r8
    3850:	4641      	mov	r1, r8
    3852:	4630      	mov	r0, r6
    3854:	f7ff fa5c 	bl	2d10 <_Unwind_VRS_Set>
    3858:	e7c1      	b.n	37de <__gnu_unwind_execute+0x25a>
    385a:	f000 03fc 	and.w	r3, r0, #252	@ 0xfc
    385e:	2bb4      	cmp	r3, #180	@ 0xb4
    3860:	f43f aed2 	beq.w	3608 <__gnu_unwind_execute+0x84>
    3864:	f000 0207 	and.w	r2, r0, #7
    3868:	3201      	adds	r2, #1
    386a:	2301      	movs	r3, #1
    386c:	f442 2200 	orr.w	r2, r2, #524288	@ 0x80000
    3870:	4619      	mov	r1, r3
    3872:	4630      	mov	r0, r6
    3874:	f7ff fc0c 	bl	3090 <_Unwind_VRS_Pop>
    3878:	2800      	cmp	r0, #0
    387a:	f43f ae8a 	beq.w	3592 <__gnu_unwind_execute+0xe>
    387e:	e6c3      	b.n	3608 <__gnu_unwind_execute+0x84>

00003880 <__gnu_unwind_frame>:
    3880:	b510      	push	{r4, lr}
    3882:	6cc2      	ldr	r2, [r0, #76]	@ 0x4c
    3884:	6853      	ldr	r3, [r2, #4]
    3886:	b084      	sub	sp, #16
    3888:	f04f 0c03 	mov.w	ip, #3
    388c:	3208      	adds	r2, #8
    388e:	021c      	lsls	r4, r3, #8
    3890:	4608      	mov	r0, r1
    3892:	0e1b      	lsrs	r3, r3, #24
    3894:	a901      	add	r1, sp, #4
    3896:	9401      	str	r4, [sp, #4]
    3898:	9202      	str	r2, [sp, #8]
    389a:	f88d c00c 	strb.w	ip, [sp, #12]
    389e:	f88d 300d 	strb.w	r3, [sp, #13]
    38a2:	f7ff fe6f 	bl	3584 <__gnu_unwind_execute>
    38a6:	b004      	add	sp, #16
    38a8:	bd10      	pop	{r4, pc}
    38aa:	bf00      	nop

000038ac <_Unwind_GetRegionStart>:
    38ac:	b508      	push	{r3, lr}
    38ae:	f7ff fe67 	bl	3580 <unwind_UCB_from_context>
    38b2:	6c80      	ldr	r0, [r0, #72]	@ 0x48
    38b4:	bd08      	pop	{r3, pc}
    38b6:	bf00      	nop

000038b8 <_Unwind_GetLanguageSpecificData>:
    38b8:	b508      	push	{r3, lr}
    38ba:	f7ff fe61 	bl	3580 <unwind_UCB_from_context>
    38be:	6cc0      	ldr	r0, [r0, #76]	@ 0x4c
    38c0:	79c3      	ldrb	r3, [r0, #7]
    38c2:	eb00 0083 	add.w	r0, r0, r3, lsl #2
    38c6:	3008      	adds	r0, #8
    38c8:	bd08      	pop	{r3, pc}
    38ca:	bf00      	nop

000038cc <_Unwind_GetDataRelBase>:
    38cc:	b508      	push	{r3, lr}
    38ce:	f000 f855 	bl	397c <abort>

000038d2 <_Unwind_GetTextRelBase>:
    38d2:	b508      	push	{r3, lr}
    38d4:	f7ff fffa 	bl	38cc <_Unwind_GetDataRelBase>

000038d8 <memset>:
    38d8:	0783      	lsls	r3, r0, #30
    38da:	b530      	push	{r4, r5, lr}
    38dc:	d047      	beq.n	396e <memset+0x96>
    38de:	1e54      	subs	r4, r2, #1
    38e0:	2a00      	cmp	r2, #0
    38e2:	d03e      	beq.n	3962 <memset+0x8a>
    38e4:	b2ca      	uxtb	r2, r1
    38e6:	4603      	mov	r3, r0
    38e8:	e001      	b.n	38ee <memset+0x16>
    38ea:	3c01      	subs	r4, #1
    38ec:	d339      	bcc.n	3962 <memset+0x8a>
    38ee:	f803 2b01 	strb.w	r2, [r3], #1
    38f2:	079d      	lsls	r5, r3, #30
    38f4:	d1f9      	bne.n	38ea <memset+0x12>
    38f6:	2c03      	cmp	r4, #3
    38f8:	d92c      	bls.n	3954 <memset+0x7c>
    38fa:	b2cd      	uxtb	r5, r1
    38fc:	eb05 2505 	add.w	r5, r5, r5, lsl #8
    3900:	2c0f      	cmp	r4, #15
    3902:	eb05 4505 	add.w	r5, r5, r5, lsl #16
    3906:	d935      	bls.n	3974 <memset+0x9c>
    3908:	f1a4 0210 	sub.w	r2, r4, #16
    390c:	f022 0c0f 	bic.w	ip, r2, #15
    3910:	f103 0e10 	add.w	lr, r3, #16
    3914:	44e6      	add	lr, ip
    3916:	ea4f 1c12 	mov.w	ip, r2, lsr #4
    391a:	461a      	mov	r2, r3
    391c:	e9c2 5500 	strd	r5, r5, [r2]
    3920:	e9c2 5502 	strd	r5, r5, [r2, #8]
    3924:	3210      	adds	r2, #16
    3926:	4572      	cmp	r2, lr
    3928:	d1f8      	bne.n	391c <memset+0x44>
    392a:	f10c 0201 	add.w	r2, ip, #1
    392e:	f014 0f0c 	tst.w	r4, #12
    3932:	eb03 1202 	add.w	r2, r3, r2, lsl #4
    3936:	f004 0c0f 	and.w	ip, r4, #15
    393a:	d013      	beq.n	3964 <memset+0x8c>
    393c:	f1ac 0304 	sub.w	r3, ip, #4
    3940:	f023 0303 	bic.w	r3, r3, #3
    3944:	3304      	adds	r3, #4
    3946:	4413      	add	r3, r2
    3948:	f842 5b04 	str.w	r5, [r2], #4
    394c:	4293      	cmp	r3, r2
    394e:	d1fb      	bne.n	3948 <memset+0x70>
    3950:	f00c 0403 	and.w	r4, ip, #3
    3954:	b12c      	cbz	r4, 3962 <memset+0x8a>
    3956:	b2c9      	uxtb	r1, r1
    3958:	441c      	add	r4, r3
    395a:	f803 1b01 	strb.w	r1, [r3], #1
    395e:	42a3      	cmp	r3, r4
    3960:	d1fb      	bne.n	395a <memset+0x82>
    3962:	bd30      	pop	{r4, r5, pc}
    3964:	4664      	mov	r4, ip
    3966:	4613      	mov	r3, r2
    3968:	2c00      	cmp	r4, #0
    396a:	d1f4      	bne.n	3956 <memset+0x7e>
    396c:	e7f9      	b.n	3962 <memset+0x8a>
    396e:	4603      	mov	r3, r0
    3970:	4614      	mov	r4, r2
    3972:	e7c0      	b.n	38f6 <memset+0x1e>
    3974:	461a      	mov	r2, r3
    3976:	46a4      	mov	ip, r4
    3978:	e7e0      	b.n	393c <memset+0x64>
    397a:	bf00      	nop

0000397c <abort>:
    397c:	b508      	push	{r3, lr}
    397e:	2006      	movs	r0, #6
    3980:	f000 f9ac 	bl	3cdc <raise>
    3984:	2001      	movs	r0, #1
    3986:	f001 fa29 	bl	4ddc <_exit>
    398a:	bf00      	nop

0000398c <memcpy>:
    398c:	4684      	mov	ip, r0
    398e:	ea41 0300 	orr.w	r3, r1, r0
    3992:	f013 0303 	ands.w	r3, r3, #3
    3996:	d16d      	bne.n	3a74 <memcpy+0xe8>
    3998:	3a40      	subs	r2, #64	@ 0x40
    399a:	d341      	bcc.n	3a20 <memcpy+0x94>
    399c:	f851 3b04 	ldr.w	r3, [r1], #4
    39a0:	f840 3b04 	str.w	r3, [r0], #4
    39a4:	f851 3b04 	ldr.w	r3, [r1], #4
    39a8:	f840 3b04 	str.w	r3, [r0], #4
    39ac:	f851 3b04 	ldr.w	r3, [r1], #4
    39b0:	f840 3b04 	str.w	r3, [r0], #4
    39b4:	f851 3b04 	ldr.w	r3, [r1], #4
    39b8:	f840 3b04 	str.w	r3, [r0], #4
    39bc:	f851 3b04 	ldr.w	r3, [r1], #4
    39c0:	f840 3b04 	str.w	r3, [r0], #4
    39c4:	f851 3b04 	ldr.w	r3, [r1], #4
    39c8:	f840 3b04 	str.w	r3, [r0], #4
    39cc:	f851 3b04 	ldr.w	r3, [r1], #4
    39d0:	f840 3b04 	str.w	r3, [r0], #4
    39d4:	f851 3b04 	ldr.w	r3, [r1], #4
    39d8:	f840 3b04 	str.w	r3, [r0], #4
    39dc:	f851 3b04 	ldr.w	r3, [r1], #4
    39e0:	f840 3b04 	str.w	r3, [r0], #4
    39e4:	f851 3b04 	ldr.w	r3, [r1], #4
    39e8:	f840 3b04 	str.w	r3, [r0], #4
    39ec:	f851 3b04 	ldr.w	r3, [r1], #4
    39f0:	f840 3b04 	str.w	r3, [r0], #4
    39f4:	f851 3b04 	ldr.w	r3, [r1], #4
    39f8:	f840 3b04 	str.w	r3, [r0], #4
    39fc:	f851 3b04 	ldr.w	r3, [r1], #4
    3a00:	f840 3b04 	str.w	r3, [r0], #4
    3a04:	f851 3b04 	ldr.w	r3, [r1], #4
    3a08:	f840 3b04 	str.w	r3, [r0], #4
    3a0c:	f851 3b04 	ldr.w	r3, [r1], #4
    3a10:	f840 3b04 	str.w	r3, [r0], #4
    3a14:	f851 3b04 	ldr.w	r3, [r1], #4
    3a18:	f840 3b04 	str.w	r3, [r0], #4
    3a1c:	3a40      	subs	r2, #64	@ 0x40
    3a1e:	d2bd      	bcs.n	399c <memcpy+0x10>
    3a20:	3230      	adds	r2, #48	@ 0x30
    3a22:	d311      	bcc.n	3a48 <memcpy+0xbc>
    3a24:	f851 3b04 	ldr.w	r3, [r1], #4
    3a28:	f840 3b04 	str.w	r3, [r0], #4
    3a2c:	f851 3b04 	ldr.w	r3, [r1], #4
    3a30:	f840 3b04 	str.w	r3, [r0], #4
    3a34:	f851 3b04 	ldr.w	r3, [r1], #4
    3a38:	f840 3b04 	str.w	r3, [r0], #4
    3a3c:	f851 3b04 	ldr.w	r3, [r1], #4
    3a40:	f840 3b04 	str.w	r3, [r0], #4
    3a44:	3a10      	subs	r2, #16
    3a46:	d2ed      	bcs.n	3a24 <memcpy+0x98>
    3a48:	320c      	adds	r2, #12
    3a4a:	d305      	bcc.n	3a58 <memcpy+0xcc>
    3a4c:	f851 3b04 	ldr.w	r3, [r1], #4
    3a50:	f840 3b04 	str.w	r3, [r0], #4
    3a54:	3a04      	subs	r2, #4
    3a56:	d2f9      	bcs.n	3a4c <memcpy+0xc0>
    3a58:	3204      	adds	r2, #4
    3a5a:	d008      	beq.n	3a6e <memcpy+0xe2>
    3a5c:	07d2      	lsls	r2, r2, #31
    3a5e:	bf1c      	itt	ne
    3a60:	f811 3b01 	ldrbne.w	r3, [r1], #1
    3a64:	f800 3b01 	strbne.w	r3, [r0], #1
    3a68:	d301      	bcc.n	3a6e <memcpy+0xe2>
    3a6a:	880b      	ldrh	r3, [r1, #0]
    3a6c:	8003      	strh	r3, [r0, #0]
    3a6e:	4660      	mov	r0, ip
    3a70:	4770      	bx	lr
    3a72:	bf00      	nop
    3a74:	2a08      	cmp	r2, #8
    3a76:	d313      	bcc.n	3aa0 <memcpy+0x114>
    3a78:	078b      	lsls	r3, r1, #30
    3a7a:	d08d      	beq.n	3998 <memcpy+0xc>
    3a7c:	f010 0303 	ands.w	r3, r0, #3
    3a80:	d08a      	beq.n	3998 <memcpy+0xc>
    3a82:	f1c3 0304 	rsb	r3, r3, #4
    3a86:	1ad2      	subs	r2, r2, r3
    3a88:	07db      	lsls	r3, r3, #31
    3a8a:	bf1c      	itt	ne
    3a8c:	f811 3b01 	ldrbne.w	r3, [r1], #1
    3a90:	f800 3b01 	strbne.w	r3, [r0], #1
    3a94:	d380      	bcc.n	3998 <memcpy+0xc>
    3a96:	f831 3b02 	ldrh.w	r3, [r1], #2
    3a9a:	f820 3b02 	strh.w	r3, [r0], #2
    3a9e:	e77b      	b.n	3998 <memcpy+0xc>
    3aa0:	3a04      	subs	r2, #4
    3aa2:	d3d9      	bcc.n	3a58 <memcpy+0xcc>
    3aa4:	3a01      	subs	r2, #1
    3aa6:	f811 3b01 	ldrb.w	r3, [r1], #1
    3aaa:	f800 3b01 	strb.w	r3, [r0], #1
    3aae:	d2f9      	bcs.n	3aa4 <memcpy+0x118>
    3ab0:	780b      	ldrb	r3, [r1, #0]
    3ab2:	7003      	strb	r3, [r0, #0]
    3ab4:	784b      	ldrb	r3, [r1, #1]
    3ab6:	7043      	strb	r3, [r0, #1]
    3ab8:	788b      	ldrb	r3, [r1, #2]
    3aba:	7083      	strb	r3, [r0, #2]
    3abc:	4660      	mov	r0, ip
    3abe:	4770      	bx	lr

00003ac0 <_reclaim_reent>:
    3ac0:	4b19      	ldr	r3, [pc, #100]	@ (3b28 <_reclaim_reent+0x68>)
    3ac2:	681b      	ldr	r3, [r3, #0]
    3ac4:	4283      	cmp	r3, r0
    3ac6:	d02e      	beq.n	3b26 <_reclaim_reent+0x66>
    3ac8:	6c41      	ldr	r1, [r0, #68]	@ 0x44
    3aca:	b570      	push	{r4, r5, r6, lr}
    3acc:	4605      	mov	r5, r0
    3ace:	b181      	cbz	r1, 3af2 <_reclaim_reent+0x32>
    3ad0:	2600      	movs	r6, #0
    3ad2:	598c      	ldr	r4, [r1, r6]
    3ad4:	b13c      	cbz	r4, 3ae6 <_reclaim_reent+0x26>
    3ad6:	4621      	mov	r1, r4
    3ad8:	6824      	ldr	r4, [r4, #0]
    3ada:	4628      	mov	r0, r5
    3adc:	f000 fcd4 	bl	4488 <_free_r>
    3ae0:	2c00      	cmp	r4, #0
    3ae2:	d1f8      	bne.n	3ad6 <_reclaim_reent+0x16>
    3ae4:	6c69      	ldr	r1, [r5, #68]	@ 0x44
    3ae6:	3604      	adds	r6, #4
    3ae8:	2e80      	cmp	r6, #128	@ 0x80
    3aea:	d1f2      	bne.n	3ad2 <_reclaim_reent+0x12>
    3aec:	4628      	mov	r0, r5
    3aee:	f000 fccb 	bl	4488 <_free_r>
    3af2:	6ba9      	ldr	r1, [r5, #56]	@ 0x38
    3af4:	b111      	cbz	r1, 3afc <_reclaim_reent+0x3c>
    3af6:	4628      	mov	r0, r5
    3af8:	f000 fcc6 	bl	4488 <_free_r>
    3afc:	6c2c      	ldr	r4, [r5, #64]	@ 0x40
    3afe:	b134      	cbz	r4, 3b0e <_reclaim_reent+0x4e>
    3b00:	4621      	mov	r1, r4
    3b02:	6824      	ldr	r4, [r4, #0]
    3b04:	4628      	mov	r0, r5
    3b06:	f000 fcbf 	bl	4488 <_free_r>
    3b0a:	2c00      	cmp	r4, #0
    3b0c:	d1f8      	bne.n	3b00 <_reclaim_reent+0x40>
    3b0e:	6ce9      	ldr	r1, [r5, #76]	@ 0x4c
    3b10:	b111      	cbz	r1, 3b18 <_reclaim_reent+0x58>
    3b12:	4628      	mov	r0, r5
    3b14:	f000 fcb8 	bl	4488 <_free_r>
    3b18:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
    3b1a:	b11b      	cbz	r3, 3b24 <_reclaim_reent+0x64>
    3b1c:	4628      	mov	r0, r5
    3b1e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    3b22:	4718      	bx	r3
    3b24:	bd70      	pop	{r4, r5, r6, pc}
    3b26:	4770      	bx	lr
    3b28:	000054b8 	.word	0x000054b8

00003b2c <__libc_init_array>:
    3b2c:	b570      	push	{r4, r5, r6, lr}
    3b2e:	4b0f      	ldr	r3, [pc, #60]	@ (3b6c <__libc_init_array+0x40>)
    3b30:	4d0f      	ldr	r5, [pc, #60]	@ (3b70 <__libc_init_array+0x44>)
    3b32:	42ab      	cmp	r3, r5
    3b34:	eba3 0605 	sub.w	r6, r3, r5
    3b38:	d007      	beq.n	3b4a <__libc_init_array+0x1e>
    3b3a:	10b6      	asrs	r6, r6, #2
    3b3c:	2400      	movs	r4, #0
    3b3e:	f855 3b04 	ldr.w	r3, [r5], #4
    3b42:	3401      	adds	r4, #1
    3b44:	4798      	blx	r3
    3b46:	42a6      	cmp	r6, r4
    3b48:	d8f9      	bhi.n	3b3e <__libc_init_array+0x12>
    3b4a:	f001 f949 	bl	4de0 <_init>
    3b4e:	4d09      	ldr	r5, [pc, #36]	@ (3b74 <__libc_init_array+0x48>)
    3b50:	4b09      	ldr	r3, [pc, #36]	@ (3b78 <__libc_init_array+0x4c>)
    3b52:	1b5e      	subs	r6, r3, r5
    3b54:	42ab      	cmp	r3, r5
    3b56:	ea4f 06a6 	mov.w	r6, r6, asr #2
    3b5a:	d006      	beq.n	3b6a <__libc_init_array+0x3e>
    3b5c:	2400      	movs	r4, #0
    3b5e:	f855 3b04 	ldr.w	r3, [r5], #4
    3b62:	3401      	adds	r4, #1
    3b64:	4798      	blx	r3
    3b66:	42a6      	cmp	r6, r4
    3b68:	d8f9      	bhi.n	3b5e <__libc_init_array+0x32>
    3b6a:	bd70      	pop	{r4, r5, r6, pc}
    3b6c:	00005a00 	.word	0x00005a00
    3b70:	00005a00 	.word	0x00005a00
    3b74:	00005a00 	.word	0x00005a00
    3b78:	00005a08 	.word	0x00005a08

00003b7c <exit>:
    3b7c:	b508      	push	{r3, lr}
    3b7e:	2100      	movs	r1, #0
    3b80:	4604      	mov	r4, r0
    3b82:	f000 fd7d 	bl	4680 <__call_exitprocs>
    3b86:	4b03      	ldr	r3, [pc, #12]	@ (3b94 <exit+0x18>)
    3b88:	681b      	ldr	r3, [r3, #0]
    3b8a:	b103      	cbz	r3, 3b8e <exit+0x12>
    3b8c:	4798      	blx	r3
    3b8e:	4620      	mov	r0, r4
    3b90:	f001 f924 	bl	4ddc <_exit>
    3b94:	00005d40 	.word	0x00005d40

00003b98 <atexit>:
    3b98:	2300      	movs	r3, #0
    3b9a:	4601      	mov	r1, r0
    3b9c:	461a      	mov	r2, r3
    3b9e:	4618      	mov	r0, r3
    3ba0:	f000 bdde 	b.w	4760 <__register_exitproc>

00003ba4 <_init_signal_r>:
    3ba4:	b538      	push	{r3, r4, r5, lr}
    3ba6:	f8d0 4118 	ldr.w	r4, [r0, #280]	@ 0x118
    3baa:	b10c      	cbz	r4, 3bb0 <_init_signal_r+0xc>
    3bac:	2000      	movs	r0, #0
    3bae:	bd38      	pop	{r3, r4, r5, pc}
    3bb0:	2180      	movs	r1, #128	@ 0x80
    3bb2:	4605      	mov	r5, r0
    3bb4:	f000 f962 	bl	3e7c <_malloc_r>
    3bb8:	4602      	mov	r2, r0
    3bba:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3bbe:	b130      	cbz	r0, 3bce <_init_signal_r+0x2a>
    3bc0:	1f03      	subs	r3, r0, #4
    3bc2:	327c      	adds	r2, #124	@ 0x7c
    3bc4:	f843 4f04 	str.w	r4, [r3, #4]!
    3bc8:	4293      	cmp	r3, r2
    3bca:	d1fb      	bne.n	3bc4 <_init_signal_r+0x20>
    3bcc:	e7ee      	b.n	3bac <_init_signal_r+0x8>
    3bce:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3bd2:	bd38      	pop	{r3, r4, r5, pc}

00003bd4 <_signal_r>:
    3bd4:	b530      	push	{r4, r5, lr}
    3bd6:	291f      	cmp	r1, #31
    3bd8:	b083      	sub	sp, #12
    3bda:	4605      	mov	r5, r0
    3bdc:	d809      	bhi.n	3bf2 <_signal_r+0x1e>
    3bde:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    3be2:	460c      	mov	r4, r1
    3be4:	b153      	cbz	r3, 3bfc <_signal_r+0x28>
    3be6:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    3bea:	f843 2024 	str.w	r2, [r3, r4, lsl #2]
    3bee:	b003      	add	sp, #12
    3bf0:	bd30      	pop	{r4, r5, pc}
    3bf2:	2316      	movs	r3, #22
    3bf4:	6003      	str	r3, [r0, #0]
    3bf6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3bfa:	e7f8      	b.n	3bee <_signal_r+0x1a>
    3bfc:	2180      	movs	r1, #128	@ 0x80
    3bfe:	9201      	str	r2, [sp, #4]
    3c00:	f000 f93c 	bl	3e7c <_malloc_r>
    3c04:	9a01      	ldr	r2, [sp, #4]
    3c06:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3c0a:	4603      	mov	r3, r0
    3c0c:	2800      	cmp	r0, #0
    3c0e:	d0f2      	beq.n	3bf6 <_signal_r+0x22>
    3c10:	1f01      	subs	r1, r0, #4
    3c12:	f100 057c 	add.w	r5, r0, #124	@ 0x7c
    3c16:	2000      	movs	r0, #0
    3c18:	f841 0f04 	str.w	r0, [r1, #4]!
    3c1c:	42a9      	cmp	r1, r5
    3c1e:	d1fb      	bne.n	3c18 <_signal_r+0x44>
    3c20:	e7e1      	b.n	3be6 <_signal_r+0x12>
    3c22:	bf00      	nop

00003c24 <_raise_r>:
    3c24:	291f      	cmp	r1, #31
    3c26:	b538      	push	{r3, r4, r5, lr}
    3c28:	4605      	mov	r5, r0
    3c2a:	d81f      	bhi.n	3c6c <_raise_r+0x48>
    3c2c:	f8d0 2118 	ldr.w	r2, [r0, #280]	@ 0x118
    3c30:	460c      	mov	r4, r1
    3c32:	b16a      	cbz	r2, 3c50 <_raise_r+0x2c>
    3c34:	f852 3021 	ldr.w	r3, [r2, r1, lsl #2]
    3c38:	b153      	cbz	r3, 3c50 <_raise_r+0x2c>
    3c3a:	2b01      	cmp	r3, #1
    3c3c:	d006      	beq.n	3c4c <_raise_r+0x28>
    3c3e:	1c59      	adds	r1, r3, #1
    3c40:	d010      	beq.n	3c64 <_raise_r+0x40>
    3c42:	2100      	movs	r1, #0
    3c44:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
    3c48:	4620      	mov	r0, r4
    3c4a:	4798      	blx	r3
    3c4c:	2000      	movs	r0, #0
    3c4e:	bd38      	pop	{r3, r4, r5, pc}
    3c50:	4628      	mov	r0, r5
    3c52:	f000 f911 	bl	3e78 <_getpid_r>
    3c56:	4622      	mov	r2, r4
    3c58:	4601      	mov	r1, r0
    3c5a:	4628      	mov	r0, r5
    3c5c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    3c60:	f000 b8f4 	b.w	3e4c <_kill_r>
    3c64:	2316      	movs	r3, #22
    3c66:	6003      	str	r3, [r0, #0]
    3c68:	2001      	movs	r0, #1
    3c6a:	bd38      	pop	{r3, r4, r5, pc}
    3c6c:	2316      	movs	r3, #22
    3c6e:	6003      	str	r3, [r0, #0]
    3c70:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3c74:	bd38      	pop	{r3, r4, r5, pc}
    3c76:	bf00      	nop

00003c78 <__sigtramp_r>:
    3c78:	291f      	cmp	r1, #31
    3c7a:	d82c      	bhi.n	3cd6 <__sigtramp_r+0x5e>
    3c7c:	b538      	push	{r3, r4, r5, lr}
    3c7e:	f8d0 3118 	ldr.w	r3, [r0, #280]	@ 0x118
    3c82:	460c      	mov	r4, r1
    3c84:	4605      	mov	r5, r0
    3c86:	b1a3      	cbz	r3, 3cb2 <__sigtramp_r+0x3a>
    3c88:	f853 2024 	ldr.w	r2, [r3, r4, lsl #2]
    3c8c:	eb03 0384 	add.w	r3, r3, r4, lsl #2
    3c90:	b14a      	cbz	r2, 3ca6 <__sigtramp_r+0x2e>
    3c92:	1c51      	adds	r1, r2, #1
    3c94:	d00b      	beq.n	3cae <__sigtramp_r+0x36>
    3c96:	2a01      	cmp	r2, #1
    3c98:	d007      	beq.n	3caa <__sigtramp_r+0x32>
    3c9a:	2500      	movs	r5, #0
    3c9c:	4620      	mov	r0, r4
    3c9e:	601d      	str	r5, [r3, #0]
    3ca0:	4790      	blx	r2
    3ca2:	4628      	mov	r0, r5
    3ca4:	bd38      	pop	{r3, r4, r5, pc}
    3ca6:	2001      	movs	r0, #1
    3ca8:	bd38      	pop	{r3, r4, r5, pc}
    3caa:	2003      	movs	r0, #3
    3cac:	bd38      	pop	{r3, r4, r5, pc}
    3cae:	2002      	movs	r0, #2
    3cb0:	bd38      	pop	{r3, r4, r5, pc}
    3cb2:	2180      	movs	r1, #128	@ 0x80
    3cb4:	f000 f8e2 	bl	3e7c <_malloc_r>
    3cb8:	4603      	mov	r3, r0
    3cba:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3cbe:	b138      	cbz	r0, 3cd0 <__sigtramp_r+0x58>
    3cc0:	1f02      	subs	r2, r0, #4
    3cc2:	2100      	movs	r1, #0
    3cc4:	307c      	adds	r0, #124	@ 0x7c
    3cc6:	f842 1f04 	str.w	r1, [r2, #4]!
    3cca:	4282      	cmp	r2, r0
    3ccc:	d1fb      	bne.n	3cc6 <__sigtramp_r+0x4e>
    3cce:	e7db      	b.n	3c88 <__sigtramp_r+0x10>
    3cd0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3cd4:	bd38      	pop	{r3, r4, r5, pc}
    3cd6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3cda:	4770      	bx	lr

00003cdc <raise>:
    3cdc:	b538      	push	{r3, r4, r5, lr}
    3cde:	4b14      	ldr	r3, [pc, #80]	@ (3d30 <raise+0x54>)
    3ce0:	281f      	cmp	r0, #31
    3ce2:	681d      	ldr	r5, [r3, #0]
    3ce4:	d81e      	bhi.n	3d24 <raise+0x48>
    3ce6:	f8d5 2118 	ldr.w	r2, [r5, #280]	@ 0x118
    3cea:	4604      	mov	r4, r0
    3cec:	b162      	cbz	r2, 3d08 <raise+0x2c>
    3cee:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
    3cf2:	b14b      	cbz	r3, 3d08 <raise+0x2c>
    3cf4:	2b01      	cmp	r3, #1
    3cf6:	d005      	beq.n	3d04 <raise+0x28>
    3cf8:	1c59      	adds	r1, r3, #1
    3cfa:	d00f      	beq.n	3d1c <raise+0x40>
    3cfc:	2100      	movs	r1, #0
    3cfe:	f842 1020 	str.w	r1, [r2, r0, lsl #2]
    3d02:	4798      	blx	r3
    3d04:	2000      	movs	r0, #0
    3d06:	bd38      	pop	{r3, r4, r5, pc}
    3d08:	4628      	mov	r0, r5
    3d0a:	f000 f8b5 	bl	3e78 <_getpid_r>
    3d0e:	4622      	mov	r2, r4
    3d10:	4601      	mov	r1, r0
    3d12:	4628      	mov	r0, r5
    3d14:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    3d18:	f000 b898 	b.w	3e4c <_kill_r>
    3d1c:	2316      	movs	r3, #22
    3d1e:	602b      	str	r3, [r5, #0]
    3d20:	2001      	movs	r0, #1
    3d22:	bd38      	pop	{r3, r4, r5, pc}
    3d24:	2316      	movs	r3, #22
    3d26:	602b      	str	r3, [r5, #0]
    3d28:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3d2c:	bd38      	pop	{r3, r4, r5, pc}
    3d2e:	bf00      	nop
    3d30:	000054b8 	.word	0x000054b8

00003d34 <signal>:
    3d34:	4b12      	ldr	r3, [pc, #72]	@ (3d80 <signal+0x4c>)
    3d36:	281f      	cmp	r0, #31
    3d38:	b570      	push	{r4, r5, r6, lr}
    3d3a:	681e      	ldr	r6, [r3, #0]
    3d3c:	d809      	bhi.n	3d52 <signal+0x1e>
    3d3e:	f8d6 3118 	ldr.w	r3, [r6, #280]	@ 0x118
    3d42:	4604      	mov	r4, r0
    3d44:	460d      	mov	r5, r1
    3d46:	b14b      	cbz	r3, 3d5c <signal+0x28>
    3d48:	f853 0024 	ldr.w	r0, [r3, r4, lsl #2]
    3d4c:	f843 5024 	str.w	r5, [r3, r4, lsl #2]
    3d50:	bd70      	pop	{r4, r5, r6, pc}
    3d52:	2316      	movs	r3, #22
    3d54:	6033      	str	r3, [r6, #0]
    3d56:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3d5a:	bd70      	pop	{r4, r5, r6, pc}
    3d5c:	2180      	movs	r1, #128	@ 0x80
    3d5e:	4630      	mov	r0, r6
    3d60:	f000 f88c 	bl	3e7c <_malloc_r>
    3d64:	4603      	mov	r3, r0
    3d66:	f8c6 0118 	str.w	r0, [r6, #280]	@ 0x118
    3d6a:	2800      	cmp	r0, #0
    3d6c:	d0f3      	beq.n	3d56 <signal+0x22>
    3d6e:	1f02      	subs	r2, r0, #4
    3d70:	2100      	movs	r1, #0
    3d72:	307c      	adds	r0, #124	@ 0x7c
    3d74:	f842 1f04 	str.w	r1, [r2, #4]!
    3d78:	4282      	cmp	r2, r0
    3d7a:	d1fb      	bne.n	3d74 <signal+0x40>
    3d7c:	e7e4      	b.n	3d48 <signal+0x14>
    3d7e:	bf00      	nop
    3d80:	000054b8 	.word	0x000054b8

00003d84 <_init_signal>:
    3d84:	b538      	push	{r3, r4, r5, lr}
    3d86:	4b0c      	ldr	r3, [pc, #48]	@ (3db8 <_init_signal+0x34>)
    3d88:	681d      	ldr	r5, [r3, #0]
    3d8a:	f8d5 4118 	ldr.w	r4, [r5, #280]	@ 0x118
    3d8e:	b10c      	cbz	r4, 3d94 <_init_signal+0x10>
    3d90:	2000      	movs	r0, #0
    3d92:	bd38      	pop	{r3, r4, r5, pc}
    3d94:	2180      	movs	r1, #128	@ 0x80
    3d96:	4628      	mov	r0, r5
    3d98:	f000 f870 	bl	3e7c <_malloc_r>
    3d9c:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3da0:	b138      	cbz	r0, 3db2 <_init_signal+0x2e>
    3da2:	1f03      	subs	r3, r0, #4
    3da4:	f100 027c 	add.w	r2, r0, #124	@ 0x7c
    3da8:	f843 4f04 	str.w	r4, [r3, #4]!
    3dac:	4293      	cmp	r3, r2
    3dae:	d1fb      	bne.n	3da8 <_init_signal+0x24>
    3db0:	e7ee      	b.n	3d90 <_init_signal+0xc>
    3db2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3db6:	bd38      	pop	{r3, r4, r5, pc}
    3db8:	000054b8 	.word	0x000054b8

00003dbc <__sigtramp>:
    3dbc:	b538      	push	{r3, r4, r5, lr}
    3dbe:	4b18      	ldr	r3, [pc, #96]	@ (3e20 <__sigtramp+0x64>)
    3dc0:	281f      	cmp	r0, #31
    3dc2:	681d      	ldr	r5, [r3, #0]
    3dc4:	d828      	bhi.n	3e18 <__sigtramp+0x5c>
    3dc6:	4604      	mov	r4, r0
    3dc8:	f8d5 0118 	ldr.w	r0, [r5, #280]	@ 0x118
    3dcc:	b1a0      	cbz	r0, 3df8 <__sigtramp+0x3c>
    3dce:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
    3dd2:	eb00 0084 	add.w	r0, r0, r4, lsl #2
    3dd6:	b14b      	cbz	r3, 3dec <__sigtramp+0x30>
    3dd8:	1c5a      	adds	r2, r3, #1
    3dda:	d00b      	beq.n	3df4 <__sigtramp+0x38>
    3ddc:	2b01      	cmp	r3, #1
    3dde:	d007      	beq.n	3df0 <__sigtramp+0x34>
    3de0:	2500      	movs	r5, #0
    3de2:	6005      	str	r5, [r0, #0]
    3de4:	4620      	mov	r0, r4
    3de6:	4798      	blx	r3
    3de8:	4628      	mov	r0, r5
    3dea:	bd38      	pop	{r3, r4, r5, pc}
    3dec:	2001      	movs	r0, #1
    3dee:	bd38      	pop	{r3, r4, r5, pc}
    3df0:	2003      	movs	r0, #3
    3df2:	bd38      	pop	{r3, r4, r5, pc}
    3df4:	2002      	movs	r0, #2
    3df6:	bd38      	pop	{r3, r4, r5, pc}
    3df8:	2180      	movs	r1, #128	@ 0x80
    3dfa:	4628      	mov	r0, r5
    3dfc:	f000 f83e 	bl	3e7c <_malloc_r>
    3e00:	f8c5 0118 	str.w	r0, [r5, #280]	@ 0x118
    3e04:	b140      	cbz	r0, 3e18 <__sigtramp+0x5c>
    3e06:	1f03      	subs	r3, r0, #4
    3e08:	f100 017c 	add.w	r1, r0, #124	@ 0x7c
    3e0c:	2200      	movs	r2, #0
    3e0e:	f843 2f04 	str.w	r2, [r3, #4]!
    3e12:	428b      	cmp	r3, r1
    3e14:	d1fb      	bne.n	3e0e <__sigtramp+0x52>
    3e16:	e7da      	b.n	3dce <__sigtramp+0x12>
    3e18:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    3e1c:	bd38      	pop	{r3, r4, r5, pc}
    3e1e:	bf00      	nop
    3e20:	000054b8 	.word	0x000054b8

00003e24 <__libc_fini_array>:
    3e24:	b538      	push	{r3, r4, r5, lr}
    3e26:	4d07      	ldr	r5, [pc, #28]	@ (3e44 <__libc_fini_array+0x20>)
    3e28:	4c07      	ldr	r4, [pc, #28]	@ (3e48 <__libc_fini_array+0x24>)
    3e2a:	1b2c      	subs	r4, r5, r4
    3e2c:	10a4      	asrs	r4, r4, #2
    3e2e:	d005      	beq.n	3e3c <__libc_fini_array+0x18>
    3e30:	3c01      	subs	r4, #1
    3e32:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    3e36:	4798      	blx	r3
    3e38:	2c00      	cmp	r4, #0
    3e3a:	d1f9      	bne.n	3e30 <__libc_fini_array+0xc>
    3e3c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    3e40:	f000 bfd4 	b.w	4dec <_fini>
    3e44:	00005a10 	.word	0x00005a10
    3e48:	00005a08 	.word	0x00005a08

00003e4c <_kill_r>:
    3e4c:	b570      	push	{r4, r5, r6, lr}
    3e4e:	460c      	mov	r4, r1
    3e50:	4d08      	ldr	r5, [pc, #32]	@ (3e74 <_kill_r+0x28>)
    3e52:	4603      	mov	r3, r0
    3e54:	2600      	movs	r6, #0
    3e56:	4620      	mov	r0, r4
    3e58:	4611      	mov	r1, r2
    3e5a:	461c      	mov	r4, r3
    3e5c:	602e      	str	r6, [r5, #0]
    3e5e:	f7fe fd0f 	bl	2880 <__wrap__kill>
    3e62:	1c43      	adds	r3, r0, #1
    3e64:	d000      	beq.n	3e68 <_kill_r+0x1c>
    3e66:	bd70      	pop	{r4, r5, r6, pc}
    3e68:	682b      	ldr	r3, [r5, #0]
    3e6a:	2b00      	cmp	r3, #0
    3e6c:	d0fb      	beq.n	3e66 <_kill_r+0x1a>
    3e6e:	6023      	str	r3, [r4, #0]
    3e70:	bd70      	pop	{r4, r5, r6, pc}
    3e72:	bf00      	nop
    3e74:	00005a3c 	.word	0x00005a3c

00003e78 <_getpid_r>:
    3e78:	f7fe bce4 	b.w	2844 <__wrap__getpid>

00003e7c <_malloc_r>:
    3e7c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3e80:	f101 050b 	add.w	r5, r1, #11
    3e84:	2d16      	cmp	r5, #22
    3e86:	b083      	sub	sp, #12
    3e88:	4606      	mov	r6, r0
    3e8a:	d823      	bhi.n	3ed4 <_malloc_r+0x58>
    3e8c:	2910      	cmp	r1, #16
    3e8e:	f200 80af 	bhi.w	3ff0 <_malloc_r+0x174>
    3e92:	f000 fc97 	bl	47c4 <__malloc_lock>
    3e96:	2510      	movs	r5, #16
    3e98:	2318      	movs	r3, #24
    3e9a:	2002      	movs	r0, #2
    3e9c:	4fc0      	ldr	r7, [pc, #768]	@ (41a0 <_malloc_r+0x324>)
    3e9e:	443b      	add	r3, r7
    3ea0:	f1a3 0208 	sub.w	r2, r3, #8
    3ea4:	685c      	ldr	r4, [r3, #4]
    3ea6:	4294      	cmp	r4, r2
    3ea8:	f000 8124 	beq.w	40f4 <_malloc_r+0x278>
    3eac:	6863      	ldr	r3, [r4, #4]
    3eae:	68e2      	ldr	r2, [r4, #12]
    3eb0:	68a1      	ldr	r1, [r4, #8]
    3eb2:	f023 0303 	bic.w	r3, r3, #3
    3eb6:	60ca      	str	r2, [r1, #12]
    3eb8:	4423      	add	r3, r4
    3eba:	4630      	mov	r0, r6
    3ebc:	6091      	str	r1, [r2, #8]
    3ebe:	685a      	ldr	r2, [r3, #4]
    3ec0:	f042 0201 	orr.w	r2, r2, #1
    3ec4:	605a      	str	r2, [r3, #4]
    3ec6:	f000 fc7f 	bl	47c8 <__malloc_unlock>
    3eca:	3408      	adds	r4, #8
    3ecc:	4620      	mov	r0, r4
    3ece:	b003      	add	sp, #12
    3ed0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3ed4:	f035 0507 	bics.w	r5, r5, #7
    3ed8:	f100 808a 	bmi.w	3ff0 <_malloc_r+0x174>
    3edc:	42a9      	cmp	r1, r5
    3ede:	f200 8087 	bhi.w	3ff0 <_malloc_r+0x174>
    3ee2:	f000 fc6f 	bl	47c4 <__malloc_lock>
    3ee6:	f5b5 7ffc 	cmp.w	r5, #504	@ 0x1f8
    3eea:	f0c0 816b 	bcc.w	41c4 <_malloc_r+0x348>
    3eee:	0a6b      	lsrs	r3, r5, #9
    3ef0:	f000 8082 	beq.w	3ff8 <_malloc_r+0x17c>
    3ef4:	2b04      	cmp	r3, #4
    3ef6:	f200 8123 	bhi.w	4140 <_malloc_r+0x2c4>
    3efa:	09ab      	lsrs	r3, r5, #6
    3efc:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    3f00:	f103 0e38 	add.w	lr, r3, #56	@ 0x38
    3f04:	00c3      	lsls	r3, r0, #3
    3f06:	4fa6      	ldr	r7, [pc, #664]	@ (41a0 <_malloc_r+0x324>)
    3f08:	443b      	add	r3, r7
    3f0a:	f1a3 0c08 	sub.w	ip, r3, #8
    3f0e:	685c      	ldr	r4, [r3, #4]
    3f10:	45a4      	cmp	ip, r4
    3f12:	d107      	bne.n	3f24 <_malloc_r+0xa8>
    3f14:	e00d      	b.n	3f32 <_malloc_r+0xb6>
    3f16:	2a00      	cmp	r2, #0
    3f18:	68e1      	ldr	r1, [r4, #12]
    3f1a:	f280 80e5 	bge.w	40e8 <_malloc_r+0x26c>
    3f1e:	458c      	cmp	ip, r1
    3f20:	d007      	beq.n	3f32 <_malloc_r+0xb6>
    3f22:	460c      	mov	r4, r1
    3f24:	6863      	ldr	r3, [r4, #4]
    3f26:	f023 0303 	bic.w	r3, r3, #3
    3f2a:	1b5a      	subs	r2, r3, r5
    3f2c:	2a0f      	cmp	r2, #15
    3f2e:	ddf2      	ble.n	3f16 <_malloc_r+0x9a>
    3f30:	4670      	mov	r0, lr
    3f32:	f8df 8270 	ldr.w	r8, [pc, #624]	@ 41a4 <_malloc_r+0x328>
    3f36:	693c      	ldr	r4, [r7, #16]
    3f38:	4544      	cmp	r4, r8
    3f3a:	f000 80c2 	beq.w	40c2 <_malloc_r+0x246>
    3f3e:	6863      	ldr	r3, [r4, #4]
    3f40:	f023 0c03 	bic.w	ip, r3, #3
    3f44:	ebac 0305 	sub.w	r3, ip, r5
    3f48:	2b0f      	cmp	r3, #15
    3f4a:	f300 813f 	bgt.w	41cc <_malloc_r+0x350>
    3f4e:	2b00      	cmp	r3, #0
    3f50:	e9c7 8804 	strd	r8, r8, [r7, #16]
    3f54:	f280 812a 	bge.w	41ac <_malloc_r+0x330>
    3f58:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
    3f5c:	f8d7 e004 	ldr.w	lr, [r7, #4]
    3f60:	f080 80ce 	bcs.w	4100 <_malloc_r+0x284>
    3f64:	ea4f 01dc 	mov.w	r1, ip, lsr #3
    3f68:	3101      	adds	r1, #1
    3f6a:	ea4f 1c5c 	mov.w	ip, ip, lsr #5
    3f6e:	2301      	movs	r3, #1
    3f70:	fa03 f30c 	lsl.w	r3, r3, ip
    3f74:	f857 2031 	ldr.w	r2, [r7, r1, lsl #3]
    3f78:	60a2      	str	r2, [r4, #8]
    3f7a:	ea4e 0e03 	orr.w	lr, lr, r3
    3f7e:	eb07 03c1 	add.w	r3, r7, r1, lsl #3
    3f82:	3b08      	subs	r3, #8
    3f84:	60e3      	str	r3, [r4, #12]
    3f86:	f8c7 e004 	str.w	lr, [r7, #4]
    3f8a:	f847 4031 	str.w	r4, [r7, r1, lsl #3]
    3f8e:	60d4      	str	r4, [r2, #12]
    3f90:	1083      	asrs	r3, r0, #2
    3f92:	f04f 0c01 	mov.w	ip, #1
    3f96:	fa0c fc03 	lsl.w	ip, ip, r3
    3f9a:	45f4      	cmp	ip, lr
    3f9c:	d832      	bhi.n	4004 <_malloc_r+0x188>
    3f9e:	ea1c 0f0e 	tst.w	ip, lr
    3fa2:	d108      	bne.n	3fb6 <_malloc_r+0x13a>
    3fa4:	f020 0003 	bic.w	r0, r0, #3
    3fa8:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    3fac:	ea1c 0f0e 	tst.w	ip, lr
    3fb0:	f100 0004 	add.w	r0, r0, #4
    3fb4:	d0f8      	beq.n	3fa8 <_malloc_r+0x12c>
    3fb6:	eb07 0ac0 	add.w	sl, r7, r0, lsl #3
    3fba:	46d6      	mov	lr, sl
    3fbc:	4681      	mov	r9, r0
    3fbe:	f8de 300c 	ldr.w	r3, [lr, #12]
    3fc2:	e00b      	b.n	3fdc <_malloc_r+0x160>
    3fc4:	6859      	ldr	r1, [r3, #4]
    3fc6:	f021 0103 	bic.w	r1, r1, #3
    3fca:	1b4a      	subs	r2, r1, r5
    3fcc:	2a0f      	cmp	r2, #15
    3fce:	461c      	mov	r4, r3
    3fd0:	68db      	ldr	r3, [r3, #12]
    3fd2:	f300 80c1 	bgt.w	4158 <_malloc_r+0x2dc>
    3fd6:	2a00      	cmp	r2, #0
    3fd8:	f280 80d5 	bge.w	4186 <_malloc_r+0x30a>
    3fdc:	459e      	cmp	lr, r3
    3fde:	d1f1      	bne.n	3fc4 <_malloc_r+0x148>
    3fe0:	f109 0901 	add.w	r9, r9, #1
    3fe4:	f019 0f03 	tst.w	r9, #3
    3fe8:	f10e 0e08 	add.w	lr, lr, #8
    3fec:	d1e7      	bne.n	3fbe <_malloc_r+0x142>
    3fee:	e116      	b.n	421e <_malloc_r+0x3a2>
    3ff0:	230c      	movs	r3, #12
    3ff2:	6033      	str	r3, [r6, #0]
    3ff4:	2400      	movs	r4, #0
    3ff6:	e769      	b.n	3ecc <_malloc_r+0x50>
    3ff8:	f44f 7300 	mov.w	r3, #512	@ 0x200
    3ffc:	2040      	movs	r0, #64	@ 0x40
    3ffe:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
    4002:	e780      	b.n	3f06 <_malloc_r+0x8a>
    4004:	68bc      	ldr	r4, [r7, #8]
    4006:	6863      	ldr	r3, [r4, #4]
    4008:	f023 0903 	bic.w	r9, r3, #3
    400c:	45a9      	cmp	r9, r5
    400e:	d303      	bcc.n	4018 <_malloc_r+0x19c>
    4010:	eba9 0305 	sub.w	r3, r9, r5
    4014:	2b0f      	cmp	r3, #15
    4016:	dc57      	bgt.n	40c8 <_malloc_r+0x24c>
    4018:	f8df b18c 	ldr.w	fp, [pc, #396]	@ 41a8 <_malloc_r+0x32c>
    401c:	f8db 2000 	ldr.w	r2, [fp]
    4020:	eb04 0309 	add.w	r3, r4, r9
    4024:	3210      	adds	r2, #16
    4026:	2008      	movs	r0, #8
    4028:	eb02 0805 	add.w	r8, r2, r5
    402c:	9300      	str	r3, [sp, #0]
    402e:	f000 fb89 	bl	4744 <sysconf>
    4032:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    4036:	3101      	adds	r1, #1
    4038:	4602      	mov	r2, r0
    403a:	d005      	beq.n	4048 <_malloc_r+0x1cc>
    403c:	f108 38ff 	add.w	r8, r8, #4294967295	@ 0xffffffff
    4040:	4480      	add	r8, r0
    4042:	4241      	negs	r1, r0
    4044:	ea01 0808 	and.w	r8, r1, r8
    4048:	4641      	mov	r1, r8
    404a:	4630      	mov	r0, r6
    404c:	9201      	str	r2, [sp, #4]
    404e:	f000 fccf 	bl	49f0 <_sbrk_r>
    4052:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
    4056:	9a01      	ldr	r2, [sp, #4]
    4058:	4682      	mov	sl, r0
    405a:	f000 80d2 	beq.w	4202 <_malloc_r+0x386>
    405e:	9b00      	ldr	r3, [sp, #0]
    4060:	4283      	cmp	r3, r0
    4062:	f200 80cc 	bhi.w	41fe <_malloc_r+0x382>
    4066:	f8db 1004 	ldr.w	r1, [fp, #4]
    406a:	4441      	add	r1, r8
    406c:	f8cb 1004 	str.w	r1, [fp, #4]
    4070:	4608      	mov	r0, r1
    4072:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    4076:	f040 80f4 	bne.w	4262 <_malloc_r+0x3e6>
    407a:	ea1a 0f0c 	tst.w	sl, ip
    407e:	f040 80f0 	bne.w	4262 <_malloc_r+0x3e6>
    4082:	f8d7 a008 	ldr.w	sl, [r7, #8]
    4086:	44c8      	add	r8, r9
    4088:	f048 0001 	orr.w	r0, r8, #1
    408c:	f8ca 0004 	str.w	r0, [sl, #4]
    4090:	f8db 202c 	ldr.w	r2, [fp, #44]	@ 0x2c
    4094:	428a      	cmp	r2, r1
    4096:	f8db 2030 	ldr.w	r2, [fp, #48]	@ 0x30
    409a:	bf38      	it	cc
    409c:	f8cb 102c 	strcc.w	r1, [fp, #44]	@ 0x2c
    40a0:	428a      	cmp	r2, r1
    40a2:	bf38      	it	cc
    40a4:	f8cb 1030 	strcc.w	r1, [fp, #48]	@ 0x30
    40a8:	4654      	mov	r4, sl
    40aa:	f020 0803 	bic.w	r8, r0, #3
    40ae:	45a8      	cmp	r8, r5
    40b0:	eba8 0305 	sub.w	r3, r8, r5
    40b4:	d301      	bcc.n	40ba <_malloc_r+0x23e>
    40b6:	2b0f      	cmp	r3, #15
    40b8:	dc06      	bgt.n	40c8 <_malloc_r+0x24c>
    40ba:	4630      	mov	r0, r6
    40bc:	f000 fb84 	bl	47c8 <__malloc_unlock>
    40c0:	e798      	b.n	3ff4 <_malloc_r+0x178>
    40c2:	f8d7 e004 	ldr.w	lr, [r7, #4]
    40c6:	e763      	b.n	3f90 <_malloc_r+0x114>
    40c8:	1962      	adds	r2, r4, r5
    40ca:	f043 0301 	orr.w	r3, r3, #1
    40ce:	f045 0501 	orr.w	r5, r5, #1
    40d2:	6065      	str	r5, [r4, #4]
    40d4:	4630      	mov	r0, r6
    40d6:	60ba      	str	r2, [r7, #8]
    40d8:	6053      	str	r3, [r2, #4]
    40da:	f000 fb75 	bl	47c8 <__malloc_unlock>
    40de:	3408      	adds	r4, #8
    40e0:	4620      	mov	r0, r4
    40e2:	b003      	add	sp, #12
    40e4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    40e8:	68a2      	ldr	r2, [r4, #8]
    40ea:	4423      	add	r3, r4
    40ec:	60d1      	str	r1, [r2, #12]
    40ee:	4630      	mov	r0, r6
    40f0:	608a      	str	r2, [r1, #8]
    40f2:	e6e4      	b.n	3ebe <_malloc_r+0x42>
    40f4:	68dc      	ldr	r4, [r3, #12]
    40f6:	42a3      	cmp	r3, r4
    40f8:	f47f aed8 	bne.w	3eac <_malloc_r+0x30>
    40fc:	3002      	adds	r0, #2
    40fe:	e718      	b.n	3f32 <_malloc_r+0xb6>
    4100:	f5bc 6f20 	cmp.w	ip, #2560	@ 0xa00
    4104:	ea4f 225c 	mov.w	r2, ip, lsr #9
    4108:	d372      	bcc.n	41f0 <_malloc_r+0x374>
    410a:	2a14      	cmp	r2, #20
    410c:	f200 8108 	bhi.w	4320 <_malloc_r+0x4a4>
    4110:	f102 035c 	add.w	r3, r2, #92	@ 0x5c
    4114:	00db      	lsls	r3, r3, #3
    4116:	325b      	adds	r2, #91	@ 0x5b
    4118:	18f9      	adds	r1, r7, r3
    411a:	58fb      	ldr	r3, [r7, r3]
    411c:	3908      	subs	r1, #8
    411e:	4299      	cmp	r1, r3
    4120:	d103      	bne.n	412a <_malloc_r+0x2ae>
    4122:	e0e4      	b.n	42ee <_malloc_r+0x472>
    4124:	689b      	ldr	r3, [r3, #8]
    4126:	4299      	cmp	r1, r3
    4128:	d004      	beq.n	4134 <_malloc_r+0x2b8>
    412a:	685a      	ldr	r2, [r3, #4]
    412c:	f022 0203 	bic.w	r2, r2, #3
    4130:	4562      	cmp	r2, ip
    4132:	d8f7      	bhi.n	4124 <_malloc_r+0x2a8>
    4134:	68d9      	ldr	r1, [r3, #12]
    4136:	e9c4 3102 	strd	r3, r1, [r4, #8]
    413a:	608c      	str	r4, [r1, #8]
    413c:	60dc      	str	r4, [r3, #12]
    413e:	e727      	b.n	3f90 <_malloc_r+0x114>
    4140:	2b14      	cmp	r3, #20
    4142:	d961      	bls.n	4208 <_malloc_r+0x38c>
    4144:	2b54      	cmp	r3, #84	@ 0x54
    4146:	f200 80f4 	bhi.w	4332 <_malloc_r+0x4b6>
    414a:	0b2b      	lsrs	r3, r5, #12
    414c:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    4150:	f103 0e6e 	add.w	lr, r3, #110	@ 0x6e
    4154:	00c3      	lsls	r3, r0, #3
    4156:	e6d6      	b.n	3f06 <_malloc_r+0x8a>
    4158:	f8d4 c008 	ldr.w	ip, [r4, #8]
    415c:	4630      	mov	r0, r6
    415e:	1966      	adds	r6, r4, r5
    4160:	f045 0501 	orr.w	r5, r5, #1
    4164:	6065      	str	r5, [r4, #4]
    4166:	f8cc 300c 	str.w	r3, [ip, #12]
    416a:	f8c3 c008 	str.w	ip, [r3, #8]
    416e:	f042 0301 	orr.w	r3, r2, #1
    4172:	e9c7 6604 	strd	r6, r6, [r7, #16]
    4176:	e9c6 8802 	strd	r8, r8, [r6, #8]
    417a:	6073      	str	r3, [r6, #4]
    417c:	5062      	str	r2, [r4, r1]
    417e:	f000 fb23 	bl	47c8 <__malloc_unlock>
    4182:	3408      	adds	r4, #8
    4184:	e6a2      	b.n	3ecc <_malloc_r+0x50>
    4186:	4421      	add	r1, r4
    4188:	4630      	mov	r0, r6
    418a:	684a      	ldr	r2, [r1, #4]
    418c:	f042 0201 	orr.w	r2, r2, #1
    4190:	604a      	str	r2, [r1, #4]
    4192:	f854 2f08 	ldr.w	r2, [r4, #8]!
    4196:	60d3      	str	r3, [r2, #12]
    4198:	609a      	str	r2, [r3, #8]
    419a:	f000 fb15 	bl	47c8 <__malloc_unlock>
    419e:	e695      	b.n	3ecc <_malloc_r+0x50>
    41a0:	000055e0 	.word	0x000055e0
    41a4:	000055e8 	.word	0x000055e8
    41a8:	00005a40 	.word	0x00005a40
    41ac:	44a4      	add	ip, r4
    41ae:	4630      	mov	r0, r6
    41b0:	f8dc 3004 	ldr.w	r3, [ip, #4]
    41b4:	f043 0301 	orr.w	r3, r3, #1
    41b8:	f8cc 3004 	str.w	r3, [ip, #4]
    41bc:	f000 fb04 	bl	47c8 <__malloc_unlock>
    41c0:	3408      	adds	r4, #8
    41c2:	e683      	b.n	3ecc <_malloc_r+0x50>
    41c4:	08e8      	lsrs	r0, r5, #3
    41c6:	f105 0308 	add.w	r3, r5, #8
    41ca:	e667      	b.n	3e9c <_malloc_r+0x20>
    41cc:	1962      	adds	r2, r4, r5
    41ce:	f043 0101 	orr.w	r1, r3, #1
    41d2:	f045 0501 	orr.w	r5, r5, #1
    41d6:	6065      	str	r5, [r4, #4]
    41d8:	4630      	mov	r0, r6
    41da:	e9c7 2204 	strd	r2, r2, [r7, #16]
    41de:	e9c2 8802 	strd	r8, r8, [r2, #8]
    41e2:	6051      	str	r1, [r2, #4]
    41e4:	f844 300c 	str.w	r3, [r4, ip]
    41e8:	f000 faee 	bl	47c8 <__malloc_unlock>
    41ec:	3408      	adds	r4, #8
    41ee:	e66d      	b.n	3ecc <_malloc_r+0x50>
    41f0:	ea4f 129c 	mov.w	r2, ip, lsr #6
    41f4:	f102 0339 	add.w	r3, r2, #57	@ 0x39
    41f8:	00db      	lsls	r3, r3, #3
    41fa:	3238      	adds	r2, #56	@ 0x38
    41fc:	e78c      	b.n	4118 <_malloc_r+0x29c>
    41fe:	42bc      	cmp	r4, r7
    4200:	d028      	beq.n	4254 <_malloc_r+0x3d8>
    4202:	68bc      	ldr	r4, [r7, #8]
    4204:	6860      	ldr	r0, [r4, #4]
    4206:	e750      	b.n	40aa <_malloc_r+0x22e>
    4208:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    420c:	f103 0e5b 	add.w	lr, r3, #91	@ 0x5b
    4210:	00c3      	lsls	r3, r0, #3
    4212:	e678      	b.n	3f06 <_malloc_r+0x8a>
    4214:	f85a 3908 	ldr.w	r3, [sl], #-8
    4218:	4553      	cmp	r3, sl
    421a:	f040 80d7 	bne.w	43cc <_malloc_r+0x550>
    421e:	f010 0f03 	tst.w	r0, #3
    4222:	f100 30ff 	add.w	r0, r0, #4294967295	@ 0xffffffff
    4226:	d1f5      	bne.n	4214 <_malloc_r+0x398>
    4228:	687b      	ldr	r3, [r7, #4]
    422a:	ea23 030c 	bic.w	r3, r3, ip
    422e:	607b      	str	r3, [r7, #4]
    4230:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    4234:	459c      	cmp	ip, r3
    4236:	f63f aee5 	bhi.w	4004 <_malloc_r+0x188>
    423a:	f1bc 0f00 	cmp.w	ip, #0
    423e:	d104      	bne.n	424a <_malloc_r+0x3ce>
    4240:	e6e0      	b.n	4004 <_malloc_r+0x188>
    4242:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
    4246:	f109 0904 	add.w	r9, r9, #4
    424a:	ea1c 0f03 	tst.w	ip, r3
    424e:	d0f8      	beq.n	4242 <_malloc_r+0x3c6>
    4250:	4648      	mov	r0, r9
    4252:	e6b0      	b.n	3fb6 <_malloc_r+0x13a>
    4254:	f8db 0004 	ldr.w	r0, [fp, #4]
    4258:	4440      	add	r0, r8
    425a:	f8cb 0004 	str.w	r0, [fp, #4]
    425e:	f102 3cff 	add.w	ip, r2, #4294967295	@ 0xffffffff
    4262:	f8d7 1408 	ldr.w	r1, [r7, #1032]	@ 0x408
    4266:	3101      	adds	r1, #1
    4268:	d06d      	beq.n	4346 <_malloc_r+0x4ca>
    426a:	9b00      	ldr	r3, [sp, #0]
    426c:	ebaa 0303 	sub.w	r3, sl, r3
    4270:	4418      	add	r0, r3
    4272:	f8cb 0004 	str.w	r0, [fp, #4]
    4276:	f01a 0307 	ands.w	r3, sl, #7
    427a:	9300      	str	r3, [sp, #0]
    427c:	d041      	beq.n	4302 <_malloc_r+0x486>
    427e:	f1c3 0108 	rsb	r1, r3, #8
    4282:	448a      	add	sl, r1
    4284:	44d0      	add	r8, sl
    4286:	440a      	add	r2, r1
    4288:	ea08 010c 	and.w	r1, r8, ip
    428c:	1a52      	subs	r2, r2, r1
    428e:	ea02 010c 	and.w	r1, r2, ip
    4292:	4630      	mov	r0, r6
    4294:	9101      	str	r1, [sp, #4]
    4296:	f000 fbab 	bl	49f0 <_sbrk_r>
    429a:	1c42      	adds	r2, r0, #1
    429c:	d06f      	beq.n	437e <_malloc_r+0x502>
    429e:	9901      	ldr	r1, [sp, #4]
    42a0:	eba0 000a 	sub.w	r0, r0, sl
    42a4:	eb00 0801 	add.w	r8, r0, r1
    42a8:	f8db 2004 	ldr.w	r2, [fp, #4]
    42ac:	f8c7 a008 	str.w	sl, [r7, #8]
    42b0:	f048 0001 	orr.w	r0, r8, #1
    42b4:	4411      	add	r1, r2
    42b6:	42bc      	cmp	r4, r7
    42b8:	f8ca 0004 	str.w	r0, [sl, #4]
    42bc:	f8cb 1004 	str.w	r1, [fp, #4]
    42c0:	f43f aee6 	beq.w	4090 <_malloc_r+0x214>
    42c4:	f1b9 0f0f 	cmp.w	r9, #15
    42c8:	d940      	bls.n	434c <_malloc_r+0x4d0>
    42ca:	6862      	ldr	r2, [r4, #4]
    42cc:	f1a9 000c 	sub.w	r0, r9, #12
    42d0:	f020 0007 	bic.w	r0, r0, #7
    42d4:	f002 0201 	and.w	r2, r2, #1
    42d8:	4302      	orrs	r2, r0
    42da:	6062      	str	r2, [r4, #4]
    42dc:	2305      	movs	r3, #5
    42de:	1822      	adds	r2, r4, r0
    42e0:	280f      	cmp	r0, #15
    42e2:	e9c2 3301 	strd	r3, r3, [r2, #4]
    42e6:	d852      	bhi.n	438e <_malloc_r+0x512>
    42e8:	f8da 0004 	ldr.w	r0, [sl, #4]
    42ec:	e6d0      	b.n	4090 <_malloc_r+0x214>
    42ee:	1092      	asrs	r2, r2, #2
    42f0:	f04f 0c01 	mov.w	ip, #1
    42f4:	fa0c f202 	lsl.w	r2, ip, r2
    42f8:	ea4e 0e02 	orr.w	lr, lr, r2
    42fc:	f8c7 e004 	str.w	lr, [r7, #4]
    4300:	e719      	b.n	4136 <_malloc_r+0x2ba>
    4302:	eb0a 0108 	add.w	r1, sl, r8
    4306:	ea01 010c 	and.w	r1, r1, ip
    430a:	1a52      	subs	r2, r2, r1
    430c:	ea02 010c 	and.w	r1, r2, ip
    4310:	4630      	mov	r0, r6
    4312:	9101      	str	r1, [sp, #4]
    4314:	f000 fb6c 	bl	49f0 <_sbrk_r>
    4318:	1c43      	adds	r3, r0, #1
    431a:	d1c0      	bne.n	429e <_malloc_r+0x422>
    431c:	9900      	ldr	r1, [sp, #0]
    431e:	e7c3      	b.n	42a8 <_malloc_r+0x42c>
    4320:	2a54      	cmp	r2, #84	@ 0x54
    4322:	d817      	bhi.n	4354 <_malloc_r+0x4d8>
    4324:	ea4f 321c 	mov.w	r2, ip, lsr #12
    4328:	f102 036f 	add.w	r3, r2, #111	@ 0x6f
    432c:	00db      	lsls	r3, r3, #3
    432e:	326e      	adds	r2, #110	@ 0x6e
    4330:	e6f2      	b.n	4118 <_malloc_r+0x29c>
    4332:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    4336:	d817      	bhi.n	4368 <_malloc_r+0x4ec>
    4338:	0beb      	lsrs	r3, r5, #15
    433a:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    433e:	f103 0e77 	add.w	lr, r3, #119	@ 0x77
    4342:	00c3      	lsls	r3, r0, #3
    4344:	e5df      	b.n	3f06 <_malloc_r+0x8a>
    4346:	f8c7 a408 	str.w	sl, [r7, #1032]	@ 0x408
    434a:	e794      	b.n	4276 <_malloc_r+0x3fa>
    434c:	2301      	movs	r3, #1
    434e:	f8ca 3004 	str.w	r3, [sl, #4]
    4352:	e6b2      	b.n	40ba <_malloc_r+0x23e>
    4354:	f5b2 7faa 	cmp.w	r2, #340	@ 0x154
    4358:	d823      	bhi.n	43a2 <_malloc_r+0x526>
    435a:	ea4f 32dc 	mov.w	r2, ip, lsr #15
    435e:	f102 0378 	add.w	r3, r2, #120	@ 0x78
    4362:	00db      	lsls	r3, r3, #3
    4364:	3277      	adds	r2, #119	@ 0x77
    4366:	e6d7      	b.n	4118 <_malloc_r+0x29c>
    4368:	f240 5254 	movw	r2, #1364	@ 0x554
    436c:	4293      	cmp	r3, r2
    436e:	d823      	bhi.n	43b8 <_malloc_r+0x53c>
    4370:	0cab      	lsrs	r3, r5, #18
    4372:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    4376:	f103 0e7c 	add.w	lr, r3, #124	@ 0x7c
    437a:	00c3      	lsls	r3, r0, #3
    437c:	e5c3      	b.n	3f06 <_malloc_r+0x8a>
    437e:	9b00      	ldr	r3, [sp, #0]
    4380:	f1a3 0208 	sub.w	r2, r3, #8
    4384:	4490      	add	r8, r2
    4386:	eba8 080a 	sub.w	r8, r8, sl
    438a:	2100      	movs	r1, #0
    438c:	e78c      	b.n	42a8 <_malloc_r+0x42c>
    438e:	f104 0108 	add.w	r1, r4, #8
    4392:	4630      	mov	r0, r6
    4394:	f000 f878 	bl	4488 <_free_r>
    4398:	f8db 1004 	ldr.w	r1, [fp, #4]
    439c:	f8d7 a008 	ldr.w	sl, [r7, #8]
    43a0:	e7a2      	b.n	42e8 <_malloc_r+0x46c>
    43a2:	f240 5354 	movw	r3, #1364	@ 0x554
    43a6:	429a      	cmp	r2, r3
    43a8:	d80c      	bhi.n	43c4 <_malloc_r+0x548>
    43aa:	ea4f 429c 	mov.w	r2, ip, lsr #18
    43ae:	f102 037d 	add.w	r3, r2, #125	@ 0x7d
    43b2:	00db      	lsls	r3, r3, #3
    43b4:	327c      	adds	r2, #124	@ 0x7c
    43b6:	e6af      	b.n	4118 <_malloc_r+0x29c>
    43b8:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    43bc:	207f      	movs	r0, #127	@ 0x7f
    43be:	f04f 0e7e 	mov.w	lr, #126	@ 0x7e
    43c2:	e5a0      	b.n	3f06 <_malloc_r+0x8a>
    43c4:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    43c8:	227e      	movs	r2, #126	@ 0x7e
    43ca:	e6a5      	b.n	4118 <_malloc_r+0x29c>
    43cc:	687b      	ldr	r3, [r7, #4]
    43ce:	e72f      	b.n	4230 <_malloc_r+0x3b4>

000043d0 <_malloc_trim_r>:
    43d0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    43d4:	4606      	mov	r6, r0
    43d6:	2008      	movs	r0, #8
    43d8:	4689      	mov	r9, r1
    43da:	f000 f9b3 	bl	4744 <sysconf>
    43de:	f8df 80a4 	ldr.w	r8, [pc, #164]	@ 4484 <_malloc_trim_r+0xb4>
    43e2:	4605      	mov	r5, r0
    43e4:	4630      	mov	r0, r6
    43e6:	f000 f9ed 	bl	47c4 <__malloc_lock>
    43ea:	f8d8 3008 	ldr.w	r3, [r8, #8]
    43ee:	685f      	ldr	r7, [r3, #4]
    43f0:	f027 0703 	bic.w	r7, r7, #3
    43f4:	f1a7 0411 	sub.w	r4, r7, #17
    43f8:	eba4 0409 	sub.w	r4, r4, r9
    43fc:	442c      	add	r4, r5
    43fe:	fbb4 f4f5 	udiv	r4, r4, r5
    4402:	3c01      	subs	r4, #1
    4404:	fb05 f404 	mul.w	r4, r5, r4
    4408:	42a5      	cmp	r5, r4
    440a:	dc08      	bgt.n	441e <_malloc_trim_r+0x4e>
    440c:	2100      	movs	r1, #0
    440e:	4630      	mov	r0, r6
    4410:	f000 faee 	bl	49f0 <_sbrk_r>
    4414:	f8d8 3008 	ldr.w	r3, [r8, #8]
    4418:	443b      	add	r3, r7
    441a:	4298      	cmp	r0, r3
    441c:	d005      	beq.n	442a <_malloc_trim_r+0x5a>
    441e:	4630      	mov	r0, r6
    4420:	f000 f9d2 	bl	47c8 <__malloc_unlock>
    4424:	2000      	movs	r0, #0
    4426:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    442a:	4261      	negs	r1, r4
    442c:	4630      	mov	r0, r6
    442e:	f000 fadf 	bl	49f0 <_sbrk_r>
    4432:	3001      	adds	r0, #1
    4434:	d00f      	beq.n	4456 <_malloc_trim_r+0x86>
    4436:	4a11      	ldr	r2, [pc, #68]	@ (447c <_malloc_trim_r+0xac>)
    4438:	f8d8 3008 	ldr.w	r3, [r8, #8]
    443c:	1b3f      	subs	r7, r7, r4
    443e:	f047 0701 	orr.w	r7, r7, #1
    4442:	605f      	str	r7, [r3, #4]
    4444:	6813      	ldr	r3, [r2, #0]
    4446:	4630      	mov	r0, r6
    4448:	1b1b      	subs	r3, r3, r4
    444a:	6013      	str	r3, [r2, #0]
    444c:	f000 f9bc 	bl	47c8 <__malloc_unlock>
    4450:	2001      	movs	r0, #1
    4452:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    4456:	2100      	movs	r1, #0
    4458:	4630      	mov	r0, r6
    445a:	f000 fac9 	bl	49f0 <_sbrk_r>
    445e:	f8d8 2008 	ldr.w	r2, [r8, #8]
    4462:	1a83      	subs	r3, r0, r2
    4464:	2b0f      	cmp	r3, #15
    4466:	ddda      	ble.n	441e <_malloc_trim_r+0x4e>
    4468:	f043 0301 	orr.w	r3, r3, #1
    446c:	6053      	str	r3, [r2, #4]
    446e:	4b04      	ldr	r3, [pc, #16]	@ (4480 <_malloc_trim_r+0xb0>)
    4470:	4902      	ldr	r1, [pc, #8]	@ (447c <_malloc_trim_r+0xac>)
    4472:	681b      	ldr	r3, [r3, #0]
    4474:	1ac0      	subs	r0, r0, r3
    4476:	6008      	str	r0, [r1, #0]
    4478:	e7d1      	b.n	441e <_malloc_trim_r+0x4e>
    447a:	bf00      	nop
    447c:	00005a44 	.word	0x00005a44
    4480:	000059e8 	.word	0x000059e8
    4484:	000055e0 	.word	0x000055e0

00004488 <_free_r>:
    4488:	2900      	cmp	r1, #0
    448a:	d07c      	beq.n	4586 <_free_r+0xfe>
    448c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4490:	460c      	mov	r4, r1
    4492:	4680      	mov	r8, r0
    4494:	f000 f996 	bl	47c4 <__malloc_lock>
    4498:	f854 3c04 	ldr.w	r3, [r4, #-4]
    449c:	4f75      	ldr	r7, [pc, #468]	@ (4674 <_free_r+0x1ec>)
    449e:	f1a4 0508 	sub.w	r5, r4, #8
    44a2:	f023 0101 	bic.w	r1, r3, #1
    44a6:	1868      	adds	r0, r5, r1
    44a8:	68be      	ldr	r6, [r7, #8]
    44aa:	6842      	ldr	r2, [r0, #4]
    44ac:	4286      	cmp	r6, r0
    44ae:	f022 0203 	bic.w	r2, r2, #3
    44b2:	f000 8083 	beq.w	45bc <_free_r+0x134>
    44b6:	07de      	lsls	r6, r3, #31
    44b8:	6042      	str	r2, [r0, #4]
    44ba:	eb00 0c02 	add.w	ip, r0, r2
    44be:	d433      	bmi.n	4528 <_free_r+0xa0>
    44c0:	f854 4c08 	ldr.w	r4, [r4, #-8]
    44c4:	f8dc 3004 	ldr.w	r3, [ip, #4]
    44c8:	1b2d      	subs	r5, r5, r4
    44ca:	4421      	add	r1, r4
    44cc:	68ac      	ldr	r4, [r5, #8]
    44ce:	f107 0c08 	add.w	ip, r7, #8
    44d2:	4564      	cmp	r4, ip
    44d4:	f003 0301 	and.w	r3, r3, #1
    44d8:	d064      	beq.n	45a4 <_free_r+0x11c>
    44da:	f8d5 e00c 	ldr.w	lr, [r5, #12]
    44de:	f8c4 e00c 	str.w	lr, [r4, #12]
    44e2:	f8ce 4008 	str.w	r4, [lr, #8]
    44e6:	2b00      	cmp	r3, #0
    44e8:	f000 8081 	beq.w	45ee <_free_r+0x166>
    44ec:	f041 0301 	orr.w	r3, r1, #1
    44f0:	606b      	str	r3, [r5, #4]
    44f2:	6001      	str	r1, [r0, #0]
    44f4:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    44f8:	d222      	bcs.n	4540 <_free_r+0xb8>
    44fa:	6878      	ldr	r0, [r7, #4]
    44fc:	08cb      	lsrs	r3, r1, #3
    44fe:	2201      	movs	r2, #1
    4500:	0949      	lsrs	r1, r1, #5
    4502:	3301      	adds	r3, #1
    4504:	408a      	lsls	r2, r1
    4506:	4302      	orrs	r2, r0
    4508:	f857 1033 	ldr.w	r1, [r7, r3, lsl #3]
    450c:	607a      	str	r2, [r7, #4]
    450e:	eb07 02c3 	add.w	r2, r7, r3, lsl #3
    4512:	3a08      	subs	r2, #8
    4514:	e9c5 1202 	strd	r1, r2, [r5, #8]
    4518:	f847 5033 	str.w	r5, [r7, r3, lsl #3]
    451c:	60cd      	str	r5, [r1, #12]
    451e:	4640      	mov	r0, r8
    4520:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    4524:	f000 b950 	b.w	47c8 <__malloc_unlock>
    4528:	f8dc 3004 	ldr.w	r3, [ip, #4]
    452c:	07db      	lsls	r3, r3, #31
    452e:	d52b      	bpl.n	4588 <_free_r+0x100>
    4530:	f041 0301 	orr.w	r3, r1, #1
    4534:	f5b1 7f00 	cmp.w	r1, #512	@ 0x200
    4538:	f844 3c04 	str.w	r3, [r4, #-4]
    453c:	6001      	str	r1, [r0, #0]
    453e:	d3dc      	bcc.n	44fa <_free_r+0x72>
    4540:	f5b1 6f20 	cmp.w	r1, #2560	@ 0xa00
    4544:	ea4f 2351 	mov.w	r3, r1, lsr #9
    4548:	d253      	bcs.n	45f2 <_free_r+0x16a>
    454a:	098b      	lsrs	r3, r1, #6
    454c:	f103 0039 	add.w	r0, r3, #57	@ 0x39
    4550:	f103 0238 	add.w	r2, r3, #56	@ 0x38
    4554:	00c3      	lsls	r3, r0, #3
    4556:	18f8      	adds	r0, r7, r3
    4558:	58fb      	ldr	r3, [r7, r3]
    455a:	3808      	subs	r0, #8
    455c:	4298      	cmp	r0, r3
    455e:	d103      	bne.n	4568 <_free_r+0xe0>
    4560:	e061      	b.n	4626 <_free_r+0x19e>
    4562:	689b      	ldr	r3, [r3, #8]
    4564:	4298      	cmp	r0, r3
    4566:	d004      	beq.n	4572 <_free_r+0xea>
    4568:	685a      	ldr	r2, [r3, #4]
    456a:	f022 0203 	bic.w	r2, r2, #3
    456e:	428a      	cmp	r2, r1
    4570:	d8f7      	bhi.n	4562 <_free_r+0xda>
    4572:	68d8      	ldr	r0, [r3, #12]
    4574:	e9c5 3002 	strd	r3, r0, [r5, #8]
    4578:	6085      	str	r5, [r0, #8]
    457a:	60dd      	str	r5, [r3, #12]
    457c:	4640      	mov	r0, r8
    457e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    4582:	f000 b921 	b.w	47c8 <__malloc_unlock>
    4586:	4770      	bx	lr
    4588:	4411      	add	r1, r2
    458a:	f107 0c08 	add.w	ip, r7, #8
    458e:	6883      	ldr	r3, [r0, #8]
    4590:	4563      	cmp	r3, ip
    4592:	d03f      	beq.n	4614 <_free_r+0x18c>
    4594:	68c2      	ldr	r2, [r0, #12]
    4596:	60da      	str	r2, [r3, #12]
    4598:	6093      	str	r3, [r2, #8]
    459a:	f041 0301 	orr.w	r3, r1, #1
    459e:	606b      	str	r3, [r5, #4]
    45a0:	5069      	str	r1, [r5, r1]
    45a2:	e7a7      	b.n	44f4 <_free_r+0x6c>
    45a4:	2b00      	cmp	r3, #0
    45a6:	d15f      	bne.n	4668 <_free_r+0x1e0>
    45a8:	440a      	add	r2, r1
    45aa:	e9d0 1302 	ldrd	r1, r3, [r0, #8]
    45ae:	60cb      	str	r3, [r1, #12]
    45b0:	6099      	str	r1, [r3, #8]
    45b2:	f042 0301 	orr.w	r3, r2, #1
    45b6:	606b      	str	r3, [r5, #4]
    45b8:	50aa      	str	r2, [r5, r2]
    45ba:	e7b0      	b.n	451e <_free_r+0x96>
    45bc:	07db      	lsls	r3, r3, #31
    45be:	440a      	add	r2, r1
    45c0:	d407      	bmi.n	45d2 <_free_r+0x14a>
    45c2:	f854 3c08 	ldr.w	r3, [r4, #-8]
    45c6:	1aed      	subs	r5, r5, r3
    45c8:	441a      	add	r2, r3
    45ca:	e9d5 1302 	ldrd	r1, r3, [r5, #8]
    45ce:	60cb      	str	r3, [r1, #12]
    45d0:	6099      	str	r1, [r3, #8]
    45d2:	f042 0301 	orr.w	r3, r2, #1
    45d6:	606b      	str	r3, [r5, #4]
    45d8:	4b27      	ldr	r3, [pc, #156]	@ (4678 <_free_r+0x1f0>)
    45da:	60bd      	str	r5, [r7, #8]
    45dc:	681b      	ldr	r3, [r3, #0]
    45de:	4293      	cmp	r3, r2
    45e0:	d89d      	bhi.n	451e <_free_r+0x96>
    45e2:	4b26      	ldr	r3, [pc, #152]	@ (467c <_free_r+0x1f4>)
    45e4:	4640      	mov	r0, r8
    45e6:	6819      	ldr	r1, [r3, #0]
    45e8:	f7ff fef2 	bl	43d0 <_malloc_trim_r>
    45ec:	e797      	b.n	451e <_free_r+0x96>
    45ee:	4411      	add	r1, r2
    45f0:	e7cd      	b.n	458e <_free_r+0x106>
    45f2:	2b14      	cmp	r3, #20
    45f4:	d908      	bls.n	4608 <_free_r+0x180>
    45f6:	2b54      	cmp	r3, #84	@ 0x54
    45f8:	d81d      	bhi.n	4636 <_free_r+0x1ae>
    45fa:	0b0b      	lsrs	r3, r1, #12
    45fc:	f103 006f 	add.w	r0, r3, #111	@ 0x6f
    4600:	f103 026e 	add.w	r2, r3, #110	@ 0x6e
    4604:	00c3      	lsls	r3, r0, #3
    4606:	e7a6      	b.n	4556 <_free_r+0xce>
    4608:	f103 005c 	add.w	r0, r3, #92	@ 0x5c
    460c:	f103 025b 	add.w	r2, r3, #91	@ 0x5b
    4610:	00c3      	lsls	r3, r0, #3
    4612:	e7a0      	b.n	4556 <_free_r+0xce>
    4614:	f041 0301 	orr.w	r3, r1, #1
    4618:	e9c7 5504 	strd	r5, r5, [r7, #16]
    461c:	e9c5 cc02 	strd	ip, ip, [r5, #8]
    4620:	606b      	str	r3, [r5, #4]
    4622:	5069      	str	r1, [r5, r1]
    4624:	e77b      	b.n	451e <_free_r+0x96>
    4626:	6879      	ldr	r1, [r7, #4]
    4628:	1092      	asrs	r2, r2, #2
    462a:	2401      	movs	r4, #1
    462c:	fa04 f202 	lsl.w	r2, r4, r2
    4630:	430a      	orrs	r2, r1
    4632:	607a      	str	r2, [r7, #4]
    4634:	e79e      	b.n	4574 <_free_r+0xec>
    4636:	f5b3 7faa 	cmp.w	r3, #340	@ 0x154
    463a:	d806      	bhi.n	464a <_free_r+0x1c2>
    463c:	0bcb      	lsrs	r3, r1, #15
    463e:	f103 0078 	add.w	r0, r3, #120	@ 0x78
    4642:	f103 0277 	add.w	r2, r3, #119	@ 0x77
    4646:	00c3      	lsls	r3, r0, #3
    4648:	e785      	b.n	4556 <_free_r+0xce>
    464a:	f240 5254 	movw	r2, #1364	@ 0x554
    464e:	4293      	cmp	r3, r2
    4650:	d806      	bhi.n	4660 <_free_r+0x1d8>
    4652:	0c8b      	lsrs	r3, r1, #18
    4654:	f103 007d 	add.w	r0, r3, #125	@ 0x7d
    4658:	f103 027c 	add.w	r2, r3, #124	@ 0x7c
    465c:	00c3      	lsls	r3, r0, #3
    465e:	e77a      	b.n	4556 <_free_r+0xce>
    4660:	f44f 737e 	mov.w	r3, #1016	@ 0x3f8
    4664:	227e      	movs	r2, #126	@ 0x7e
    4666:	e776      	b.n	4556 <_free_r+0xce>
    4668:	f041 0301 	orr.w	r3, r1, #1
    466c:	606b      	str	r3, [r5, #4]
    466e:	6001      	str	r1, [r0, #0]
    4670:	e755      	b.n	451e <_free_r+0x96>
    4672:	bf00      	nop
    4674:	000055e0 	.word	0x000055e0
    4678:	000059ec 	.word	0x000059ec
    467c:	00005a40 	.word	0x00005a40

00004680 <__call_exitprocs>:
    4680:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4684:	4f29      	ldr	r7, [pc, #164]	@ (472c <__call_exitprocs+0xac>)
    4686:	b083      	sub	sp, #12
    4688:	683e      	ldr	r6, [r7, #0]
    468a:	9001      	str	r0, [sp, #4]
    468c:	b35e      	cbz	r6, 46e6 <__call_exitprocs+0x66>
    468e:	468b      	mov	fp, r1
    4690:	f04f 0900 	mov.w	r9, #0
    4694:	f04f 0801 	mov.w	r8, #1
    4698:	6874      	ldr	r4, [r6, #4]
    469a:	1e65      	subs	r5, r4, #1
    469c:	d423      	bmi.n	46e6 <__call_exitprocs+0x66>
    469e:	3401      	adds	r4, #1
    46a0:	eb06 0484 	add.w	r4, r6, r4, lsl #2
    46a4:	f1bb 0f00 	cmp.w	fp, #0
    46a8:	d120      	bne.n	46ec <__call_exitprocs+0x6c>
    46aa:	6873      	ldr	r3, [r6, #4]
    46ac:	6822      	ldr	r2, [r4, #0]
    46ae:	3b01      	subs	r3, #1
    46b0:	42ab      	cmp	r3, r5
    46b2:	bf0c      	ite	eq
    46b4:	6075      	streq	r5, [r6, #4]
    46b6:	f8c4 9000 	strne.w	r9, [r4]
    46ba:	b17a      	cbz	r2, 46dc <__call_exitprocs+0x5c>
    46bc:	f8d6 1188 	ldr.w	r1, [r6, #392]	@ 0x188
    46c0:	f8d6 a004 	ldr.w	sl, [r6, #4]
    46c4:	fa08 fc05 	lsl.w	ip, r8, r5
    46c8:	ea1c 0f01 	tst.w	ip, r1
    46cc:	d11a      	bne.n	4704 <__call_exitprocs+0x84>
    46ce:	4790      	blx	r2
    46d0:	6871      	ldr	r1, [r6, #4]
    46d2:	683a      	ldr	r2, [r7, #0]
    46d4:	4551      	cmp	r1, sl
    46d6:	d122      	bne.n	471e <__call_exitprocs+0x9e>
    46d8:	42b2      	cmp	r2, r6
    46da:	d120      	bne.n	471e <__call_exitprocs+0x9e>
    46dc:	3d01      	subs	r5, #1
    46de:	1c6b      	adds	r3, r5, #1
    46e0:	f1a4 0404 	sub.w	r4, r4, #4
    46e4:	d1de      	bne.n	46a4 <__call_exitprocs+0x24>
    46e6:	b003      	add	sp, #12
    46e8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    46ec:	f8d4 3100 	ldr.w	r3, [r4, #256]	@ 0x100
    46f0:	455b      	cmp	r3, fp
    46f2:	d0da      	beq.n	46aa <__call_exitprocs+0x2a>
    46f4:	3d01      	subs	r5, #1
    46f6:	1c6a      	adds	r2, r5, #1
    46f8:	f1a4 0404 	sub.w	r4, r4, #4
    46fc:	d1f6      	bne.n	46ec <__call_exitprocs+0x6c>
    46fe:	b003      	add	sp, #12
    4700:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4704:	f8d6 318c 	ldr.w	r3, [r6, #396]	@ 0x18c
    4708:	f8d4 1080 	ldr.w	r1, [r4, #128]	@ 0x80
    470c:	ea1c 0f03 	tst.w	ip, r3
    4710:	d109      	bne.n	4726 <__call_exitprocs+0xa6>
    4712:	9801      	ldr	r0, [sp, #4]
    4714:	4790      	blx	r2
    4716:	6871      	ldr	r1, [r6, #4]
    4718:	683a      	ldr	r2, [r7, #0]
    471a:	4551      	cmp	r1, sl
    471c:	d0dc      	beq.n	46d8 <__call_exitprocs+0x58>
    471e:	2a00      	cmp	r2, #0
    4720:	d0e1      	beq.n	46e6 <__call_exitprocs+0x66>
    4722:	4616      	mov	r6, r2
    4724:	e7b8      	b.n	4698 <__call_exitprocs+0x18>
    4726:	4608      	mov	r0, r1
    4728:	4790      	blx	r2
    472a:	e7d1      	b.n	46d0 <__call_exitprocs+0x50>
    472c:	00005a74 	.word	0x00005a74

00004730 <register_fini>:
    4730:	4b02      	ldr	r3, [pc, #8]	@ (473c <register_fini+0xc>)
    4732:	b113      	cbz	r3, 473a <register_fini+0xa>
    4734:	4802      	ldr	r0, [pc, #8]	@ (4740 <register_fini+0x10>)
    4736:	f7ff ba2f 	b.w	3b98 <atexit>
    473a:	4770      	bx	lr
    473c:	00000000 	.word	0x00000000
    4740:	00003e25 	.word	0x00003e25

00004744 <sysconf>:
    4744:	2808      	cmp	r0, #8
    4746:	d102      	bne.n	474e <sysconf+0xa>
    4748:	f44f 5080 	mov.w	r0, #4096	@ 0x1000
    474c:	4770      	bx	lr
    474e:	b508      	push	{r3, lr}
    4750:	f000 f982 	bl	4a58 <__errno>
    4754:	2316      	movs	r3, #22
    4756:	6003      	str	r3, [r0, #0]
    4758:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    475c:	bd08      	pop	{r3, pc}
    475e:	bf00      	nop

00004760 <__register_exitproc>:
    4760:	b470      	push	{r4, r5, r6}
    4762:	4d16      	ldr	r5, [pc, #88]	@ (47bc <__register_exitproc+0x5c>)
    4764:	682c      	ldr	r4, [r5, #0]
    4766:	b31c      	cbz	r4, 47b0 <__register_exitproc+0x50>
    4768:	6865      	ldr	r5, [r4, #4]
    476a:	2d1f      	cmp	r5, #31
    476c:	dc23      	bgt.n	47b6 <__register_exitproc+0x56>
    476e:	b938      	cbnz	r0, 4780 <__register_exitproc+0x20>
    4770:	1cab      	adds	r3, r5, #2
    4772:	3501      	adds	r5, #1
    4774:	6065      	str	r5, [r4, #4]
    4776:	f844 1023 	str.w	r1, [r4, r3, lsl #2]
    477a:	2000      	movs	r0, #0
    477c:	bc70      	pop	{r4, r5, r6}
    477e:	4770      	bx	lr
    4780:	eb04 0c85 	add.w	ip, r4, r5, lsl #2
    4784:	2802      	cmp	r0, #2
    4786:	f8cc 2088 	str.w	r2, [ip, #136]	@ 0x88
    478a:	f8d4 6188 	ldr.w	r6, [r4, #392]	@ 0x188
    478e:	f04f 0201 	mov.w	r2, #1
    4792:	fa02 f205 	lsl.w	r2, r2, r5
    4796:	ea46 0602 	orr.w	r6, r6, r2
    479a:	f8c4 6188 	str.w	r6, [r4, #392]	@ 0x188
    479e:	f8cc 3108 	str.w	r3, [ip, #264]	@ 0x108
    47a2:	d1e5      	bne.n	4770 <__register_exitproc+0x10>
    47a4:	f8d4 318c 	ldr.w	r3, [r4, #396]	@ 0x18c
    47a8:	4313      	orrs	r3, r2
    47aa:	f8c4 318c 	str.w	r3, [r4, #396]	@ 0x18c
    47ae:	e7df      	b.n	4770 <__register_exitproc+0x10>
    47b0:	4c03      	ldr	r4, [pc, #12]	@ (47c0 <__register_exitproc+0x60>)
    47b2:	602c      	str	r4, [r5, #0]
    47b4:	e7d8      	b.n	4768 <__register_exitproc+0x8>
    47b6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    47ba:	e7df      	b.n	477c <__register_exitproc+0x1c>
    47bc:	00005a74 	.word	0x00005a74
    47c0:	00005a78 	.word	0x00005a78

000047c4 <__malloc_lock>:
    47c4:	4770      	bx	lr
    47c6:	bf00      	nop

000047c8 <__malloc_unlock>:
    47c8:	4770      	bx	lr
    47ca:	bf00      	nop

000047cc <__fp_lock>:
    47cc:	2000      	movs	r0, #0
    47ce:	4770      	bx	lr

000047d0 <stdio_exit_handler>:
    47d0:	4a02      	ldr	r2, [pc, #8]	@ (47dc <stdio_exit_handler+0xc>)
    47d2:	4903      	ldr	r1, [pc, #12]	@ (47e0 <stdio_exit_handler+0x10>)
    47d4:	4803      	ldr	r0, [pc, #12]	@ (47e4 <stdio_exit_handler+0x14>)
    47d6:	f000 b91d 	b.w	4a14 <_fwalk_sglue>
    47da:	bf00      	nop
    47dc:	000059f0 	.word	0x000059f0
    47e0:	00004a65 	.word	0x00004a65
    47e4:	000054c0 	.word	0x000054c0

000047e8 <cleanup_stdio>:
    47e8:	4b0c      	ldr	r3, [pc, #48]	@ (481c <cleanup_stdio+0x34>)
    47ea:	6841      	ldr	r1, [r0, #4]
    47ec:	4299      	cmp	r1, r3
    47ee:	b510      	push	{r4, lr}
    47f0:	4604      	mov	r4, r0
    47f2:	d001      	beq.n	47f8 <cleanup_stdio+0x10>
    47f4:	f000 f936 	bl	4a64 <_fclose_r>
    47f8:	68a1      	ldr	r1, [r4, #8]
    47fa:	4b09      	ldr	r3, [pc, #36]	@ (4820 <cleanup_stdio+0x38>)
    47fc:	4299      	cmp	r1, r3
    47fe:	d002      	beq.n	4806 <cleanup_stdio+0x1e>
    4800:	4620      	mov	r0, r4
    4802:	f000 f92f 	bl	4a64 <_fclose_r>
    4806:	68e1      	ldr	r1, [r4, #12]
    4808:	4b06      	ldr	r3, [pc, #24]	@ (4824 <cleanup_stdio+0x3c>)
    480a:	4299      	cmp	r1, r3
    480c:	d004      	beq.n	4818 <cleanup_stdio+0x30>
    480e:	4620      	mov	r0, r4
    4810:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    4814:	f000 b926 	b.w	4a64 <_fclose_r>
    4818:	bd10      	pop	{r4, pc}
    481a:	bf00      	nop
    481c:	00005c08 	.word	0x00005c08
    4820:	00005c70 	.word	0x00005c70
    4824:	00005cd8 	.word	0x00005cd8

00004828 <__fp_unlock>:
    4828:	2000      	movs	r0, #0
    482a:	4770      	bx	lr

0000482c <global_stdio_init.part.0>:
    482c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    4830:	4c2a      	ldr	r4, [pc, #168]	@ (48dc <global_stdio_init.part.0+0xb0>)
    4832:	492b      	ldr	r1, [pc, #172]	@ (48e0 <global_stdio_init.part.0+0xb4>)
    4834:	f8df 90bc 	ldr.w	r9, [pc, #188]	@ 48f4 <global_stdio_init.part.0+0xc8>
    4838:	f8df 80bc 	ldr.w	r8, [pc, #188]	@ 48f8 <global_stdio_init.part.0+0xcc>
    483c:	4f29      	ldr	r7, [pc, #164]	@ (48e4 <global_stdio_init.part.0+0xb8>)
    483e:	f8c4 1138 	str.w	r1, [r4, #312]	@ 0x138
    4842:	2500      	movs	r5, #0
    4844:	2304      	movs	r3, #4
    4846:	2208      	movs	r2, #8
    4848:	4629      	mov	r1, r5
    484a:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    484e:	4e26      	ldr	r6, [pc, #152]	@ (48e8 <global_stdio_init.part.0+0xbc>)
    4850:	60e3      	str	r3, [r4, #12]
    4852:	e9c4 5500 	strd	r5, r5, [r4]
    4856:	e9c4 5504 	strd	r5, r5, [r4, #16]
    485a:	60a5      	str	r5, [r4, #8]
    485c:	6665      	str	r5, [r4, #100]	@ 0x64
    485e:	61a5      	str	r5, [r4, #24]
    4860:	f7ff f83a 	bl	38d8 <memset>
    4864:	4b21      	ldr	r3, [pc, #132]	@ (48ec <global_stdio_init.part.0+0xc0>)
    4866:	6763      	str	r3, [r4, #116]	@ 0x74
    4868:	2208      	movs	r2, #8
    486a:	4629      	mov	r1, r5
    486c:	f104 00c4 	add.w	r0, r4, #196	@ 0xc4
    4870:	e9c4 4907 	strd	r4, r9, [r4, #28]
    4874:	e9c4 8709 	strd	r8, r7, [r4, #36]	@ 0x24
    4878:	e9c4 551a 	strd	r5, r5, [r4, #104]	@ 0x68
    487c:	e9c4 551e 	strd	r5, r5, [r4, #120]	@ 0x78
    4880:	6725      	str	r5, [r4, #112]	@ 0x70
    4882:	f8c4 50cc 	str.w	r5, [r4, #204]	@ 0xcc
    4886:	f8c4 5080 	str.w	r5, [r4, #128]	@ 0x80
    488a:	62e6      	str	r6, [r4, #44]	@ 0x2c
    488c:	f7ff f824 	bl	38d8 <memset>
    4890:	4b17      	ldr	r3, [pc, #92]	@ (48f0 <global_stdio_init.part.0+0xc4>)
    4892:	f8c4 30dc 	str.w	r3, [r4, #220]	@ 0xdc
    4896:	4629      	mov	r1, r5
    4898:	f104 0368 	add.w	r3, r4, #104	@ 0x68
    489c:	2208      	movs	r2, #8
    489e:	f504 7096 	add.w	r0, r4, #300	@ 0x12c
    48a2:	f8c4 3084 	str.w	r3, [r4, #132]	@ 0x84
    48a6:	e9c4 9822 	strd	r9, r8, [r4, #136]	@ 0x88
    48aa:	e9c4 7624 	strd	r7, r6, [r4, #144]	@ 0x90
    48ae:	e9c4 5534 	strd	r5, r5, [r4, #208]	@ 0xd0
    48b2:	e9c4 5538 	strd	r5, r5, [r4, #224]	@ 0xe0
    48b6:	f8c4 50d8 	str.w	r5, [r4, #216]	@ 0xd8
    48ba:	f8c4 5134 	str.w	r5, [r4, #308]	@ 0x134
    48be:	f8c4 50e8 	str.w	r5, [r4, #232]	@ 0xe8
    48c2:	f7ff f809 	bl	38d8 <memset>
    48c6:	f104 03d0 	add.w	r3, r4, #208	@ 0xd0
    48ca:	e9c4 983c 	strd	r9, r8, [r4, #240]	@ 0xf0
    48ce:	e9c4 763e 	strd	r7, r6, [r4, #248]	@ 0xf8
    48d2:	f8c4 30ec 	str.w	r3, [r4, #236]	@ 0xec
    48d6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    48da:	bf00      	nop
    48dc:	00005c08 	.word	0x00005c08
    48e0:	000047d1 	.word	0x000047d1
    48e4:	00004b5d 	.word	0x00004b5d
    48e8:	00004b81 	.word	0x00004b81
    48ec:	00010009 	.word	0x00010009
    48f0:	00020012 	.word	0x00020012
    48f4:	00004af5 	.word	0x00004af5
    48f8:	00004b1d 	.word	0x00004b1d

000048fc <__sfp>:
    48fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    48fe:	4b25      	ldr	r3, [pc, #148]	@ (4994 <__sfp+0x98>)
    4900:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    4904:	4606      	mov	r6, r0
    4906:	2b00      	cmp	r3, #0
    4908:	d03c      	beq.n	4984 <__sfp+0x88>
    490a:	4f23      	ldr	r7, [pc, #140]	@ (4998 <__sfp+0x9c>)
    490c:	e9d7 3401 	ldrd	r3, r4, [r7, #4]
    4910:	3b01      	subs	r3, #1
    4912:	d504      	bpl.n	491e <__sfp+0x22>
    4914:	e01d      	b.n	4952 <__sfp+0x56>
    4916:	1c5a      	adds	r2, r3, #1
    4918:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    491c:	d019      	beq.n	4952 <__sfp+0x56>
    491e:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
    4922:	3b01      	subs	r3, #1
    4924:	2d00      	cmp	r5, #0
    4926:	d1f6      	bne.n	4916 <__sfp+0x1a>
    4928:	4b1c      	ldr	r3, [pc, #112]	@ (499c <__sfp+0xa0>)
    492a:	60e3      	str	r3, [r4, #12]
    492c:	e9c4 5501 	strd	r5, r5, [r4, #4]
    4930:	e9c4 5504 	strd	r5, r5, [r4, #16]
    4934:	6665      	str	r5, [r4, #100]	@ 0x64
    4936:	6025      	str	r5, [r4, #0]
    4938:	61a5      	str	r5, [r4, #24]
    493a:	2208      	movs	r2, #8
    493c:	4629      	mov	r1, r5
    493e:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
    4942:	f7fe ffc9 	bl	38d8 <memset>
    4946:	e9c4 550c 	strd	r5, r5, [r4, #48]	@ 0x30
    494a:	e9c4 5511 	strd	r5, r5, [r4, #68]	@ 0x44
    494e:	4620      	mov	r0, r4
    4950:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    4952:	683d      	ldr	r5, [r7, #0]
    4954:	b10d      	cbz	r5, 495a <__sfp+0x5e>
    4956:	462f      	mov	r7, r5
    4958:	e7d8      	b.n	490c <__sfp+0x10>
    495a:	f44f 71d6 	mov.w	r1, #428	@ 0x1ac
    495e:	4630      	mov	r0, r6
    4960:	f7ff fa8c 	bl	3e7c <_malloc_r>
    4964:	4604      	mov	r4, r0
    4966:	b180      	cbz	r0, 498a <__sfp+0x8e>
    4968:	2304      	movs	r3, #4
    496a:	e9c0 5300 	strd	r5, r3, [r0]
    496e:	300c      	adds	r0, #12
    4970:	4629      	mov	r1, r5
    4972:	60a0      	str	r0, [r4, #8]
    4974:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
    4978:	4625      	mov	r5, r4
    497a:	f7fe ffad 	bl	38d8 <memset>
    497e:	603c      	str	r4, [r7, #0]
    4980:	462f      	mov	r7, r5
    4982:	e7c3      	b.n	490c <__sfp+0x10>
    4984:	f7ff ff52 	bl	482c <global_stdio_init.part.0>
    4988:	e7bf      	b.n	490a <__sfp+0xe>
    498a:	230c      	movs	r3, #12
    498c:	6038      	str	r0, [r7, #0]
    498e:	6033      	str	r3, [r6, #0]
    4990:	e7dd      	b.n	494e <__sfp+0x52>
    4992:	bf00      	nop
    4994:	00005c08 	.word	0x00005c08
    4998:	000059f0 	.word	0x000059f0
    499c:	ffff0001 	.word	0xffff0001

000049a0 <__sinit>:
    49a0:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    49a2:	b103      	cbz	r3, 49a6 <__sinit+0x6>
    49a4:	4770      	bx	lr
    49a6:	4b04      	ldr	r3, [pc, #16]	@ (49b8 <__sinit+0x18>)
    49a8:	4a04      	ldr	r2, [pc, #16]	@ (49bc <__sinit+0x1c>)
    49aa:	f8d3 3138 	ldr.w	r3, [r3, #312]	@ 0x138
    49ae:	6342      	str	r2, [r0, #52]	@ 0x34
    49b0:	2b00      	cmp	r3, #0
    49b2:	d1f7      	bne.n	49a4 <__sinit+0x4>
    49b4:	e73a      	b.n	482c <global_stdio_init.part.0>
    49b6:	bf00      	nop
    49b8:	00005c08 	.word	0x00005c08
    49bc:	000047e9 	.word	0x000047e9

000049c0 <__sfp_lock_acquire>:
    49c0:	4770      	bx	lr
    49c2:	bf00      	nop

000049c4 <__sfp_lock_release>:
    49c4:	4770      	bx	lr
    49c6:	bf00      	nop

000049c8 <__fp_lock_all>:
    49c8:	4a02      	ldr	r2, [pc, #8]	@ (49d4 <__fp_lock_all+0xc>)
    49ca:	4903      	ldr	r1, [pc, #12]	@ (49d8 <__fp_lock_all+0x10>)
    49cc:	2000      	movs	r0, #0
    49ce:	f000 b821 	b.w	4a14 <_fwalk_sglue>
    49d2:	bf00      	nop
    49d4:	000059f0 	.word	0x000059f0
    49d8:	000047cd 	.word	0x000047cd

000049dc <__fp_unlock_all>:
    49dc:	4a02      	ldr	r2, [pc, #8]	@ (49e8 <__fp_unlock_all+0xc>)
    49de:	4903      	ldr	r1, [pc, #12]	@ (49ec <__fp_unlock_all+0x10>)
    49e0:	2000      	movs	r0, #0
    49e2:	f000 b817 	b.w	4a14 <_fwalk_sglue>
    49e6:	bf00      	nop
    49e8:	000059f0 	.word	0x000059f0
    49ec:	00004829 	.word	0x00004829

000049f0 <_sbrk_r>:
    49f0:	b538      	push	{r3, r4, r5, lr}
    49f2:	4d07      	ldr	r5, [pc, #28]	@ (4a10 <_sbrk_r+0x20>)
    49f4:	2200      	movs	r2, #0
    49f6:	4604      	mov	r4, r0
    49f8:	4608      	mov	r0, r1
    49fa:	602a      	str	r2, [r5, #0]
    49fc:	f7fd fe84 	bl	2708 <__wrap__sbrk>
    4a00:	1c43      	adds	r3, r0, #1
    4a02:	d000      	beq.n	4a06 <_sbrk_r+0x16>
    4a04:	bd38      	pop	{r3, r4, r5, pc}
    4a06:	682b      	ldr	r3, [r5, #0]
    4a08:	2b00      	cmp	r3, #0
    4a0a:	d0fb      	beq.n	4a04 <_sbrk_r+0x14>
    4a0c:	6023      	str	r3, [r4, #0]
    4a0e:	bd38      	pop	{r3, r4, r5, pc}
    4a10:	00005a3c 	.word	0x00005a3c

00004a14 <_fwalk_sglue>:
    4a14:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    4a18:	4607      	mov	r7, r0
    4a1a:	4688      	mov	r8, r1
    4a1c:	4616      	mov	r6, r2
    4a1e:	f04f 0900 	mov.w	r9, #0
    4a22:	e9d6 5401 	ldrd	r5, r4, [r6, #4]
    4a26:	3d01      	subs	r5, #1
    4a28:	d410      	bmi.n	4a4c <_fwalk_sglue+0x38>
    4a2a:	89a3      	ldrh	r3, [r4, #12]
    4a2c:	2b01      	cmp	r3, #1
    4a2e:	d908      	bls.n	4a42 <_fwalk_sglue+0x2e>
    4a30:	f9b4 300e 	ldrsh.w	r3, [r4, #14]
    4a34:	3301      	adds	r3, #1
    4a36:	4621      	mov	r1, r4
    4a38:	4638      	mov	r0, r7
    4a3a:	d002      	beq.n	4a42 <_fwalk_sglue+0x2e>
    4a3c:	47c0      	blx	r8
    4a3e:	ea49 0900 	orr.w	r9, r9, r0
    4a42:	3d01      	subs	r5, #1
    4a44:	1c6b      	adds	r3, r5, #1
    4a46:	f104 0468 	add.w	r4, r4, #104	@ 0x68
    4a4a:	d1ee      	bne.n	4a2a <_fwalk_sglue+0x16>
    4a4c:	6836      	ldr	r6, [r6, #0]
    4a4e:	2e00      	cmp	r6, #0
    4a50:	d1e7      	bne.n	4a22 <_fwalk_sglue+0xe>
    4a52:	4648      	mov	r0, r9
    4a54:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

00004a58 <__errno>:
    4a58:	4b01      	ldr	r3, [pc, #4]	@ (4a60 <__errno+0x8>)
    4a5a:	6818      	ldr	r0, [r3, #0]
    4a5c:	4770      	bx	lr
    4a5e:	bf00      	nop
    4a60:	000054b8 	.word	0x000054b8

00004a64 <_fclose_r>:
    4a64:	b570      	push	{r4, r5, r6, lr}
    4a66:	b139      	cbz	r1, 4a78 <_fclose_r+0x14>
    4a68:	4606      	mov	r6, r0
    4a6a:	460c      	mov	r4, r1
    4a6c:	b108      	cbz	r0, 4a72 <_fclose_r+0xe>
    4a6e:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    4a70:	b383      	cbz	r3, 4ad4 <_fclose_r+0x70>
    4a72:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4a76:	b913      	cbnz	r3, 4a7e <_fclose_r+0x1a>
    4a78:	2500      	movs	r5, #0
    4a7a:	4628      	mov	r0, r5
    4a7c:	bd70      	pop	{r4, r5, r6, pc}
    4a7e:	4621      	mov	r1, r4
    4a80:	4630      	mov	r0, r6
    4a82:	f000 f8a9 	bl	4bd8 <__sflush_r>
    4a86:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
    4a88:	4605      	mov	r5, r0
    4a8a:	b133      	cbz	r3, 4a9a <_fclose_r+0x36>
    4a8c:	69e1      	ldr	r1, [r4, #28]
    4a8e:	4630      	mov	r0, r6
    4a90:	4798      	blx	r3
    4a92:	2800      	cmp	r0, #0
    4a94:	bfb8      	it	lt
    4a96:	f04f 35ff 	movlt.w	r5, #4294967295	@ 0xffffffff
    4a9a:	89a3      	ldrh	r3, [r4, #12]
    4a9c:	061b      	lsls	r3, r3, #24
    4a9e:	d41c      	bmi.n	4ada <_fclose_r+0x76>
    4aa0:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    4aa2:	b141      	cbz	r1, 4ab6 <_fclose_r+0x52>
    4aa4:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    4aa8:	4299      	cmp	r1, r3
    4aaa:	d002      	beq.n	4ab2 <_fclose_r+0x4e>
    4aac:	4630      	mov	r0, r6
    4aae:	f7ff fceb 	bl	4488 <_free_r>
    4ab2:	2300      	movs	r3, #0
    4ab4:	6323      	str	r3, [r4, #48]	@ 0x30
    4ab6:	6c61      	ldr	r1, [r4, #68]	@ 0x44
    4ab8:	b121      	cbz	r1, 4ac4 <_fclose_r+0x60>
    4aba:	4630      	mov	r0, r6
    4abc:	f7ff fce4 	bl	4488 <_free_r>
    4ac0:	2300      	movs	r3, #0
    4ac2:	6463      	str	r3, [r4, #68]	@ 0x44
    4ac4:	f7ff ff7c 	bl	49c0 <__sfp_lock_acquire>
    4ac8:	2300      	movs	r3, #0
    4aca:	81a3      	strh	r3, [r4, #12]
    4acc:	f7ff ff7a 	bl	49c4 <__sfp_lock_release>
    4ad0:	4628      	mov	r0, r5
    4ad2:	bd70      	pop	{r4, r5, r6, pc}
    4ad4:	f7ff ff64 	bl	49a0 <__sinit>
    4ad8:	e7cb      	b.n	4a72 <_fclose_r+0xe>
    4ada:	6921      	ldr	r1, [r4, #16]
    4adc:	4630      	mov	r0, r6
    4ade:	f7ff fcd3 	bl	4488 <_free_r>
    4ae2:	e7dd      	b.n	4aa0 <_fclose_r+0x3c>

00004ae4 <fclose>:
    4ae4:	4b02      	ldr	r3, [pc, #8]	@ (4af0 <fclose+0xc>)
    4ae6:	4601      	mov	r1, r0
    4ae8:	6818      	ldr	r0, [r3, #0]
    4aea:	f7ff bfbb 	b.w	4a64 <_fclose_r>
    4aee:	bf00      	nop
    4af0:	000054b8 	.word	0x000054b8

00004af4 <__sread>:
    4af4:	b510      	push	{r4, lr}
    4af6:	460c      	mov	r4, r1
    4af8:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4afc:	f000 f942 	bl	4d84 <_read_r>
    4b00:	2800      	cmp	r0, #0
    4b02:	db03      	blt.n	4b0c <__sread+0x18>
    4b04:	6d23      	ldr	r3, [r4, #80]	@ 0x50
    4b06:	4403      	add	r3, r0
    4b08:	6523      	str	r3, [r4, #80]	@ 0x50
    4b0a:	bd10      	pop	{r4, pc}
    4b0c:	89a3      	ldrh	r3, [r4, #12]
    4b0e:	f423 5380 	bic.w	r3, r3, #4096	@ 0x1000
    4b12:	81a3      	strh	r3, [r4, #12]
    4b14:	bd10      	pop	{r4, pc}
    4b16:	bf00      	nop

00004b18 <__seofread>:
    4b18:	2000      	movs	r0, #0
    4b1a:	4770      	bx	lr

00004b1c <__swrite>:
    4b1c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4b20:	460c      	mov	r4, r1
    4b22:	f9b1 100c 	ldrsh.w	r1, [r1, #12]
    4b26:	461f      	mov	r7, r3
    4b28:	05cb      	lsls	r3, r1, #23
    4b2a:	4605      	mov	r5, r0
    4b2c:	4616      	mov	r6, r2
    4b2e:	d40b      	bmi.n	4b48 <__swrite+0x2c>
    4b30:	f421 5180 	bic.w	r1, r1, #4096	@ 0x1000
    4b34:	81a1      	strh	r1, [r4, #12]
    4b36:	463b      	mov	r3, r7
    4b38:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    4b3c:	4632      	mov	r2, r6
    4b3e:	4628      	mov	r0, r5
    4b40:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    4b44:	f000 b820 	b.w	4b88 <_write_r>
    4b48:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    4b4c:	2302      	movs	r3, #2
    4b4e:	2200      	movs	r2, #0
    4b50:	f000 f92e 	bl	4db0 <_lseek_r>
    4b54:	f9b4 100c 	ldrsh.w	r1, [r4, #12]
    4b58:	e7ea      	b.n	4b30 <__swrite+0x14>
    4b5a:	bf00      	nop

00004b5c <__sseek>:
    4b5c:	b510      	push	{r4, lr}
    4b5e:	460c      	mov	r4, r1
    4b60:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4b64:	f000 f924 	bl	4db0 <_lseek_r>
    4b68:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4b6c:	1c42      	adds	r2, r0, #1
    4b6e:	bf0e      	itee	eq
    4b70:	f423 5380 	biceq.w	r3, r3, #4096	@ 0x1000
    4b74:	f443 5380 	orrne.w	r3, r3, #4096	@ 0x1000
    4b78:	6520      	strne	r0, [r4, #80]	@ 0x50
    4b7a:	81a3      	strh	r3, [r4, #12]
    4b7c:	bd10      	pop	{r4, pc}
    4b7e:	bf00      	nop

00004b80 <__sclose>:
    4b80:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    4b84:	f000 b816 	b.w	4bb4 <_close_r>

00004b88 <_write_r>:
    4b88:	b538      	push	{r3, r4, r5, lr}
    4b8a:	460c      	mov	r4, r1
    4b8c:	4d08      	ldr	r5, [pc, #32]	@ (4bb0 <_write_r+0x28>)
    4b8e:	4684      	mov	ip, r0
    4b90:	4611      	mov	r1, r2
    4b92:	4620      	mov	r0, r4
    4b94:	461a      	mov	r2, r3
    4b96:	2300      	movs	r3, #0
    4b98:	602b      	str	r3, [r5, #0]
    4b9a:	4664      	mov	r4, ip
    4b9c:	f7fd feaa 	bl	28f4 <__wrap__write>
    4ba0:	1c43      	adds	r3, r0, #1
    4ba2:	d000      	beq.n	4ba6 <_write_r+0x1e>
    4ba4:	bd38      	pop	{r3, r4, r5, pc}
    4ba6:	682b      	ldr	r3, [r5, #0]
    4ba8:	2b00      	cmp	r3, #0
    4baa:	d0fb      	beq.n	4ba4 <_write_r+0x1c>
    4bac:	6023      	str	r3, [r4, #0]
    4bae:	bd38      	pop	{r3, r4, r5, pc}
    4bb0:	00005a3c 	.word	0x00005a3c

00004bb4 <_close_r>:
    4bb4:	b538      	push	{r3, r4, r5, lr}
    4bb6:	4d07      	ldr	r5, [pc, #28]	@ (4bd4 <_close_r+0x20>)
    4bb8:	2200      	movs	r2, #0
    4bba:	4604      	mov	r4, r0
    4bbc:	4608      	mov	r0, r1
    4bbe:	602a      	str	r2, [r5, #0]
    4bc0:	f7fd fe1c 	bl	27fc <__wrap__close>
    4bc4:	1c43      	adds	r3, r0, #1
    4bc6:	d000      	beq.n	4bca <_close_r+0x16>
    4bc8:	bd38      	pop	{r3, r4, r5, pc}
    4bca:	682b      	ldr	r3, [r5, #0]
    4bcc:	2b00      	cmp	r3, #0
    4bce:	d0fb      	beq.n	4bc8 <_close_r+0x14>
    4bd0:	6023      	str	r3, [r4, #0]
    4bd2:	bd38      	pop	{r3, r4, r5, pc}
    4bd4:	00005a3c 	.word	0x00005a3c

00004bd8 <__sflush_r>:
    4bd8:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    4bdc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4be0:	0716      	lsls	r6, r2, #28
    4be2:	460c      	mov	r4, r1
    4be4:	4680      	mov	r8, r0
    4be6:	d44e      	bmi.n	4c86 <__sflush_r+0xae>
    4be8:	6849      	ldr	r1, [r1, #4]
    4bea:	f442 6300 	orr.w	r3, r2, #2048	@ 0x800
    4bee:	2900      	cmp	r1, #0
    4bf0:	81a3      	strh	r3, [r4, #12]
    4bf2:	dd63      	ble.n	4cbc <__sflush_r+0xe4>
    4bf4:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    4bf6:	2d00      	cmp	r5, #0
    4bf8:	d042      	beq.n	4c80 <__sflush_r+0xa8>
    4bfa:	2100      	movs	r1, #0
    4bfc:	f412 5280 	ands.w	r2, r2, #4096	@ 0x1000
    4c00:	f8d8 6000 	ldr.w	r6, [r8]
    4c04:	f8c8 1000 	str.w	r1, [r8]
    4c08:	69e1      	ldr	r1, [r4, #28]
    4c0a:	d164      	bne.n	4cd6 <__sflush_r+0xfe>
    4c0c:	2301      	movs	r3, #1
    4c0e:	4640      	mov	r0, r8
    4c10:	47a8      	blx	r5
    4c12:	1c45      	adds	r5, r0, #1
    4c14:	4602      	mov	r2, r0
    4c16:	d06e      	beq.n	4cf6 <__sflush_r+0x11e>
    4c18:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4c1c:	6aa5      	ldr	r5, [r4, #40]	@ 0x28
    4c1e:	69e1      	ldr	r1, [r4, #28]
    4c20:	0758      	lsls	r0, r3, #29
    4c22:	d505      	bpl.n	4c30 <__sflush_r+0x58>
    4c24:	6863      	ldr	r3, [r4, #4]
    4c26:	1ad2      	subs	r2, r2, r3
    4c28:	6b23      	ldr	r3, [r4, #48]	@ 0x30
    4c2a:	b10b      	cbz	r3, 4c30 <__sflush_r+0x58>
    4c2c:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
    4c2e:	1ad2      	subs	r2, r2, r3
    4c30:	2300      	movs	r3, #0
    4c32:	4640      	mov	r0, r8
    4c34:	47a8      	blx	r5
    4c36:	1c43      	adds	r3, r0, #1
    4c38:	d14f      	bne.n	4cda <__sflush_r+0x102>
    4c3a:	f8d8 1000 	ldr.w	r1, [r8]
    4c3e:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4c42:	291d      	cmp	r1, #29
    4c44:	d840      	bhi.n	4cc8 <__sflush_r+0xf0>
    4c46:	4a31      	ldr	r2, [pc, #196]	@ (4d0c <__sflush_r+0x134>)
    4c48:	40ca      	lsrs	r2, r1
    4c4a:	07d7      	lsls	r7, r2, #31
    4c4c:	d53c      	bpl.n	4cc8 <__sflush_r+0xf0>
    4c4e:	6922      	ldr	r2, [r4, #16]
    4c50:	6022      	str	r2, [r4, #0]
    4c52:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    4c56:	81a2      	strh	r2, [r4, #12]
    4c58:	04dd      	lsls	r5, r3, #19
    4c5a:	f04f 0200 	mov.w	r2, #0
    4c5e:	6062      	str	r2, [r4, #4]
    4c60:	d501      	bpl.n	4c66 <__sflush_r+0x8e>
    4c62:	2900      	cmp	r1, #0
    4c64:	d045      	beq.n	4cf2 <__sflush_r+0x11a>
    4c66:	6b21      	ldr	r1, [r4, #48]	@ 0x30
    4c68:	f8c8 6000 	str.w	r6, [r8]
    4c6c:	b141      	cbz	r1, 4c80 <__sflush_r+0xa8>
    4c6e:	f104 0340 	add.w	r3, r4, #64	@ 0x40
    4c72:	4299      	cmp	r1, r3
    4c74:	d002      	beq.n	4c7c <__sflush_r+0xa4>
    4c76:	4640      	mov	r0, r8
    4c78:	f7ff fc06 	bl	4488 <_free_r>
    4c7c:	2300      	movs	r3, #0
    4c7e:	6323      	str	r3, [r4, #48]	@ 0x30
    4c80:	2000      	movs	r0, #0
    4c82:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    4c86:	690e      	ldr	r6, [r1, #16]
    4c88:	2e00      	cmp	r6, #0
    4c8a:	d0f9      	beq.n	4c80 <__sflush_r+0xa8>
    4c8c:	680d      	ldr	r5, [r1, #0]
    4c8e:	600e      	str	r6, [r1, #0]
    4c90:	0792      	lsls	r2, r2, #30
    4c92:	bf0c      	ite	eq
    4c94:	694b      	ldreq	r3, [r1, #20]
    4c96:	2300      	movne	r3, #0
    4c98:	1bad      	subs	r5, r5, r6
    4c9a:	608b      	str	r3, [r1, #8]
    4c9c:	e00b      	b.n	4cb6 <__sflush_r+0xde>
    4c9e:	462b      	mov	r3, r5
    4ca0:	4632      	mov	r2, r6
    4ca2:	69e1      	ldr	r1, [r4, #28]
    4ca4:	6a67      	ldr	r7, [r4, #36]	@ 0x24
    4ca6:	4640      	mov	r0, r8
    4ca8:	47b8      	blx	r7
    4caa:	f1b0 0c00 	subs.w	ip, r0, #0
    4cae:	eba5 050c 	sub.w	r5, r5, ip
    4cb2:	4466      	add	r6, ip
    4cb4:	dd06      	ble.n	4cc4 <__sflush_r+0xec>
    4cb6:	2d00      	cmp	r5, #0
    4cb8:	dcf1      	bgt.n	4c9e <__sflush_r+0xc6>
    4cba:	e7e1      	b.n	4c80 <__sflush_r+0xa8>
    4cbc:	6be1      	ldr	r1, [r4, #60]	@ 0x3c
    4cbe:	2900      	cmp	r1, #0
    4cc0:	dc98      	bgt.n	4bf4 <__sflush_r+0x1c>
    4cc2:	e7dd      	b.n	4c80 <__sflush_r+0xa8>
    4cc4:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4cc8:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    4ccc:	81a3      	strh	r3, [r4, #12]
    4cce:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    4cd2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    4cd6:	6d22      	ldr	r2, [r4, #80]	@ 0x50
    4cd8:	e7a2      	b.n	4c20 <__sflush_r+0x48>
    4cda:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    4cde:	6922      	ldr	r2, [r4, #16]
    4ce0:	6022      	str	r2, [r4, #0]
    4ce2:	f423 6200 	bic.w	r2, r3, #2048	@ 0x800
    4ce6:	81a2      	strh	r2, [r4, #12]
    4ce8:	04db      	lsls	r3, r3, #19
    4cea:	f04f 0200 	mov.w	r2, #0
    4cee:	6062      	str	r2, [r4, #4]
    4cf0:	d5b9      	bpl.n	4c66 <__sflush_r+0x8e>
    4cf2:	6520      	str	r0, [r4, #80]	@ 0x50
    4cf4:	e7b7      	b.n	4c66 <__sflush_r+0x8e>
    4cf6:	f8d8 3000 	ldr.w	r3, [r8]
    4cfa:	2b00      	cmp	r3, #0
    4cfc:	d08c      	beq.n	4c18 <__sflush_r+0x40>
    4cfe:	2b1d      	cmp	r3, #29
    4d00:	d001      	beq.n	4d06 <__sflush_r+0x12e>
    4d02:	2b16      	cmp	r3, #22
    4d04:	d1de      	bne.n	4cc4 <__sflush_r+0xec>
    4d06:	f8c8 6000 	str.w	r6, [r8]
    4d0a:	e7b9      	b.n	4c80 <__sflush_r+0xa8>
    4d0c:	20400001 	.word	0x20400001

00004d10 <_fflush_r>:
    4d10:	b510      	push	{r4, lr}
    4d12:	4604      	mov	r4, r0
    4d14:	b082      	sub	sp, #8
    4d16:	b108      	cbz	r0, 4d1c <_fflush_r+0xc>
    4d18:	6b43      	ldr	r3, [r0, #52]	@ 0x34
    4d1a:	b153      	cbz	r3, 4d32 <_fflush_r+0x22>
    4d1c:	f9b1 000c 	ldrsh.w	r0, [r1, #12]
    4d20:	b908      	cbnz	r0, 4d26 <_fflush_r+0x16>
    4d22:	b002      	add	sp, #8
    4d24:	bd10      	pop	{r4, pc}
    4d26:	4620      	mov	r0, r4
    4d28:	b002      	add	sp, #8
    4d2a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    4d2e:	f7ff bf53 	b.w	4bd8 <__sflush_r>
    4d32:	9101      	str	r1, [sp, #4]
    4d34:	f7ff fe34 	bl	49a0 <__sinit>
    4d38:	9901      	ldr	r1, [sp, #4]
    4d3a:	e7ef      	b.n	4d1c <_fflush_r+0xc>

00004d3c <fflush>:
    4d3c:	b1a0      	cbz	r0, 4d68 <fflush+0x2c>
    4d3e:	b538      	push	{r3, r4, r5, lr}
    4d40:	4b0c      	ldr	r3, [pc, #48]	@ (4d74 <fflush+0x38>)
    4d42:	681d      	ldr	r5, [r3, #0]
    4d44:	4604      	mov	r4, r0
    4d46:	b10d      	cbz	r5, 4d4c <fflush+0x10>
    4d48:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
    4d4a:	b14b      	cbz	r3, 4d60 <fflush+0x24>
    4d4c:	f9b4 000c 	ldrsh.w	r0, [r4, #12]
    4d50:	b900      	cbnz	r0, 4d54 <fflush+0x18>
    4d52:	bd38      	pop	{r3, r4, r5, pc}
    4d54:	4621      	mov	r1, r4
    4d56:	4628      	mov	r0, r5
    4d58:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    4d5c:	f7ff bf3c 	b.w	4bd8 <__sflush_r>
    4d60:	4628      	mov	r0, r5
    4d62:	f7ff fe1d 	bl	49a0 <__sinit>
    4d66:	e7f1      	b.n	4d4c <fflush+0x10>
    4d68:	4a03      	ldr	r2, [pc, #12]	@ (4d78 <fflush+0x3c>)
    4d6a:	4904      	ldr	r1, [pc, #16]	@ (4d7c <fflush+0x40>)
    4d6c:	4804      	ldr	r0, [pc, #16]	@ (4d80 <fflush+0x44>)
    4d6e:	f7ff be51 	b.w	4a14 <_fwalk_sglue>
    4d72:	bf00      	nop
    4d74:	000054b8 	.word	0x000054b8
    4d78:	000059f0 	.word	0x000059f0
    4d7c:	00004d11 	.word	0x00004d11
    4d80:	000054c0 	.word	0x000054c0

00004d84 <_read_r>:
    4d84:	b538      	push	{r3, r4, r5, lr}
    4d86:	460c      	mov	r4, r1
    4d88:	4d08      	ldr	r5, [pc, #32]	@ (4dac <_read_r+0x28>)
    4d8a:	4684      	mov	ip, r0
    4d8c:	4611      	mov	r1, r2
    4d8e:	4620      	mov	r0, r4
    4d90:	461a      	mov	r2, r3
    4d92:	2300      	movs	r3, #0
    4d94:	602b      	str	r3, [r5, #0]
    4d96:	4664      	mov	r4, ip
    4d98:	f7fd fd98 	bl	28cc <__wrap__read>
    4d9c:	1c43      	adds	r3, r0, #1
    4d9e:	d000      	beq.n	4da2 <_read_r+0x1e>
    4da0:	bd38      	pop	{r3, r4, r5, pc}
    4da2:	682b      	ldr	r3, [r5, #0]
    4da4:	2b00      	cmp	r3, #0
    4da6:	d0fb      	beq.n	4da0 <_read_r+0x1c>
    4da8:	6023      	str	r3, [r4, #0]
    4daa:	bd38      	pop	{r3, r4, r5, pc}
    4dac:	00005a3c 	.word	0x00005a3c

00004db0 <_lseek_r>:
    4db0:	b538      	push	{r3, r4, r5, lr}
    4db2:	460c      	mov	r4, r1
    4db4:	4d08      	ldr	r5, [pc, #32]	@ (4dd8 <_lseek_r+0x28>)
    4db6:	4684      	mov	ip, r0
    4db8:	4611      	mov	r1, r2
    4dba:	4620      	mov	r0, r4
    4dbc:	461a      	mov	r2, r3
    4dbe:	2300      	movs	r3, #0
    4dc0:	602b      	str	r3, [r5, #0]
    4dc2:	4664      	mov	r4, ip
    4dc4:	f7fd fd6e 	bl	28a4 <__wrap__lseek>
    4dc8:	1c43      	adds	r3, r0, #1
    4dca:	d000      	beq.n	4dce <_lseek_r+0x1e>
    4dcc:	bd38      	pop	{r3, r4, r5, pc}
    4dce:	682b      	ldr	r3, [r5, #0]
    4dd0:	2b00      	cmp	r3, #0
    4dd2:	d0fb      	beq.n	4dcc <_lseek_r+0x1c>
    4dd4:	6023      	str	r3, [r4, #0]
    4dd6:	bd38      	pop	{r3, r4, r5, pc}
    4dd8:	00005a3c 	.word	0x00005a3c

00004ddc <_exit>:
    4ddc:	e7fe      	b.n	4ddc <_exit>
    4dde:	bf00      	nop

00004de0 <_init>:
    4de0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4de2:	bf00      	nop
    4de4:	bcf8      	pop	{r3, r4, r5, r6, r7}
    4de6:	bc08      	pop	{r3}
    4de8:	469e      	mov	lr, r3
    4dea:	4770      	bx	lr

00004dec <_fini>:
    4dec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4dee:	bf00      	nop
    4df0:	bcf8      	pop	{r3, r4, r5, r6, r7}
    4df2:	bc08      	pop	{r3}
    4df4:	469e      	mov	lr, r3
    4df6:	4770      	bx	lr

00004df8 <all_implied_fbits>:
    4df8:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    4e08:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    4e18:	410b 0000 0000 0000                         .A......

00004e20 <zetas>:
    4e20:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
    4e30:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
    4e40:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
    4e50:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
    4e60:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
    4e70:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
    4e80:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
    4e90:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
    4ea0:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
    4eb0:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
    4ec0:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
    4ed0:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
    4ee0:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
    4ef0:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
    4f00:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
    4f10:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
    4f20:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
    4f30:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
    4f40:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
    4f50:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
    4f60:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
    4f70:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
    4f80:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
    4f90:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
    4fa0:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
    4fb0:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
    4fc0:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
    4fd0:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
    4fe0:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
    4ff0:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
    5000:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
    5010:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
    5020:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
    5030:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
    5040:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
    5050:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
    5060:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
    5070:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
    5080:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
    5090:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
    50a0:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
    50b0:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
    50c0:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
    50d0:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
    50e0:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
    50f0:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
    5100:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
    5110:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
    5120:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
    5130:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
    5140:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
    5150:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
    5160:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
    5170:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
    5180:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
    5190:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
    51a0:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
    51b0:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
    51c0:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
    51d0:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
    51e0:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
    51f0:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
    5200:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
    5210:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

00005220 <pqcrystals_dilithium_fips202_ref_KeccakF_RoundConstants>:
    5220:	0001 0000 0000 0000 8082 0000 0000 0000     ................
    5230:	808a 0000 0000 8000 8000 8000 0000 8000     ................
    5240:	808b 0000 0000 0000 0001 8000 0000 0000     ................
    5250:	8081 8000 0000 8000 8009 0000 0000 8000     ................
    5260:	008a 0000 0000 0000 0088 0000 0000 0000     ................
    5270:	8009 8000 0000 0000 000a 8000 0000 0000     ................
    5280:	808b 8000 0000 0000 008b 0000 0000 8000     ................
    5290:	8089 0000 0000 8000 8003 0000 0000 8000     ................
    52a0:	8002 0000 0000 8000 0080 0000 0000 8000     ................
    52b0:	800a 0000 0000 0000 000a 8000 0000 8000     ................
    52c0:	8081 8000 0000 8000 8080 0000 0000 8000     ................
    52d0:	0001 8000 0000 0000 8008 8000 0000 8000     ................

000052e0 <REPORT_EXCEPTION>:
    52e0:	0018 0000                                   ....

000052e4 <ApplicationExit>:
    52e4:	0026 0002 4d4e 5f49 6148 646e 656c 0072     &...NMI_Handler.
    52f4:	6148 6472 6146 6c75 5f74 6148 646e 656c     HardFault_Handle
    5304:	0072 0000 654d 4d6d 6e61 6761 5f65 6148     r...MemManage_Ha
    5314:	646e 656c 0072 0000 7542 4673 7561 746c     ndler...BusFault
    5324:	485f 6e61 6c64 7265 0000 0000 7355 6761     _Handler....Usag
    5334:	4665 7561 746c 485f 6e61 6c64 7265 0000     eFault_Handler..
    5344:	5653 5f43 6148 646e 656c 0072 6544 7562     SVC_Handler.Debu
    5354:	4d67 6e6f 485f 6e61 6c64 7265 0000 0000     gMon_Handler....
    5364:	6550 646e 5653 485f 6e61 6c64 7265 0000     PendSV_Handler..

00005374 <stackpattern>:
    5374:	beef dead                                   ....

00005378 <all_implied_fbits>:
    5378:	413e 410c 4111 4127 4136 4103 4106 4115     >A.A.A'A6A.A.A.A
    5388:	410f 410e 4126 4113 4129 4102 4119 410a     .A.A&A.A)A.A.A.A
    5398:	410b 0000                                   .A..

0000539c <__EH_FRAME_BEGIN__>:
    539c:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
    53ac:	0c1b 000d 0014 0000 0018 0000 e5d4 ffff     ................
    53bc:	0134 0000 0200 0a71 0b43 0000               4.....q.C...

000053c8 <__FRAME_END__>:
    53c8:	0000 0000                                   ....
