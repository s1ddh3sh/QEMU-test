; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@f_tail = internal unnamed_addr constant [4 x i8] c"\08\01\01\00", align 1, !dbg !0
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !41

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !129 {
entry:
    #dbg_value(ptr %dst, !133, !DIExpression(), !134)
    #dbg_value(i8 %val, !135, !DIExpression(), !134)
    #dbg_value(i32 %len, !136, !DIExpression(), !134)
    #dbg_value(ptr %dst, !137, !DIExpression(), !134)
    #dbg_value(i32 0, !138, !DIExpression(), !140)
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !142
    #dbg_value(i32 %i.0, !138, !DIExpression(), !140)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !143
  br i1 %exitcond, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !146
  store i8 %val, ptr %arrayidx, align 1, !dbg !147
  %inc = add i32 %i.0, 1, !dbg !148
    #dbg_value(i32 %inc, !138, !DIExpression(), !140)
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  ret void, !dbg !153
}

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %VtL, ptr noundef nonnull %A_out) unnamed_addr #0 !dbg !154 {
entry:
  %A = alloca [800 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !188, !DIExpression(), !189)
    #dbg_value(ptr %VtL, !190, !DIExpression(), !189)
    #dbg_value(ptr %A_out, !191, !DIExpression(), !189)
    #dbg_value(i32 0, !192, !DIExpression(), !189)
    #dbg_value(i32 0, !193, !DIExpression(), !189)
    #dbg_value(i32 5, !194, !DIExpression(), !189)
    #dbg_declare(ptr %A, !196, !DIExpression(), !200)
    #dbg_value(i32 80, !201, !DIExpression(), !189)
    #dbg_value(i64 1, !202, !DIExpression(), !205)
    #dbg_value(i64 72057594037927936, !202, !DIExpression(), !205)
    #dbg_value(i64 72057594037927935, !202, !DIExpression(), !205)
    #dbg_value(i32 0, !206, !DIExpression(), !208)
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !210
    #dbg_value(i32 %i.0, !206, !DIExpression(), !208)
  %exitcond = icmp ne i32 %i.0, 80, !dbg !211
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !213

for.cond3.preheader:                              ; preds = %for.cond
  br label %for.cond3, !dbg !214

for.body:                                         ; preds = %for.cond
  %.idx = mul nuw nsw i32 %i.0, 40, !dbg !216
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx, !dbg !216
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !216
  %1 = load i64, ptr %arrayidx, align 8, !dbg !218
  %and = and i64 %1, 72057594037927935, !dbg !218
  store i64 %and, ptr %arrayidx, align 8, !dbg !218
  %inc = add nuw nsw i32 %i.0, 1, !dbg !219
    #dbg_value(i32 %inc, !206, !DIExpression(), !208)
  br label %for.cond, !dbg !220, !llvm.loop !221

for.cond3:                                        ; preds = %for.inc103, %for.cond3.preheader
  %i2.0 = phi i32 [ %inc104, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !223
  %words_to_shift.0 = phi i32 [ %words_to_shift.1.lcssa, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !224
  %bits_to_shift.0 = phi i32 [ %bits_to_shift.1.lcssa, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !225
    #dbg_value(i32 %bits_to_shift.0, !192, !DIExpression(), !189)
    #dbg_value(i32 %words_to_shift.0, !193, !DIExpression(), !189)
    #dbg_value(i32 %i2.0, !226, !DIExpression(), !227)
  %exitcond8 = icmp ne i32 %i2.0, 10, !dbg !228
  br i1 %exitcond8, label %for.cond6.preheader, label %for.cond107.preheader, !dbg !214

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !230

for.cond107.preheader:                            ; preds = %for.cond3
  br label %for.cond107, !dbg !233

for.cond6:                                        ; preds = %if.end95, %for.cond6.preheader
  %j.0 = phi i32 [ %dec, %if.end95 ], [ 9, %for.cond6.preheader ], !dbg !235
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end95 ], [ %words_to_shift.0, %for.cond6.preheader ], !dbg !189
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end95 ], [ %bits_to_shift.0, %for.cond6.preheader ], !dbg !189
    #dbg_value(i32 %bits_to_shift.1, !192, !DIExpression(), !189)
    #dbg_value(i32 %words_to_shift.1, !193, !DIExpression(), !189)
    #dbg_value(i32 %j.0, !236, !DIExpression(), !237)
  %cmp7.not = icmp slt i32 %j.0, %i2.0, !dbg !238
  br i1 %cmp7.not, label %for.inc103, label %for.body8, !dbg !230

for.body8:                                        ; preds = %for.cond6
  %add.ptr.idx = mul nsw i32 %j.0, 320, !dbg !240
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !240
    #dbg_value(ptr %add.ptr, !242, !DIExpression(), !189)
    #dbg_value(i32 0, !244, !DIExpression(), !246)
  br label %for.cond11, !dbg !247

for.cond11:                                       ; preds = %for.inc44, %for.body8
  %c.0 = phi i32 [ 0, %for.body8 ], [ %inc45, %for.inc44 ], !dbg !248
    #dbg_value(i32 %c.0, !244, !DIExpression(), !246)
  %exitcond5 = icmp ne i32 %c.0, 8, !dbg !249
  br i1 %exitcond5, label %for.cond14.preheader, label %for.end46, !dbg !251

for.cond14.preheader:                             ; preds = %for.cond11
  br label %for.cond14, !dbg !252

for.cond14:                                       ; preds = %for.inc41, %for.cond14.preheader
  %k.0 = phi i32 [ %inc42, %for.inc41 ], [ 0, %for.cond14.preheader ], !dbg !255
    #dbg_value(i32 %k.0, !256, !DIExpression(), !257)
  %exitcond4 = icmp ne i32 %k.0, 5, !dbg !258
  br i1 %exitcond4, label %for.body16, label %for.inc44, !dbg !252

for.body16:                                       ; preds = %for.cond14
  %2 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0, !dbg !260
  %arrayidx19.idx = mul nuw nsw i32 %c.0, 40, !dbg !260
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %2, i32 %arrayidx19.idx, !dbg !260
  %3 = load i64, ptr %arrayidx19, align 8, !dbg !260
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !262
  %shl20 = shl i64 %3, %sh_prom, !dbg !262
  %mul21 = shl nuw nsw i32 %i2.0, 3, !dbg !263
  %add22 = or disjoint i32 %mul21, %c.0, !dbg !264
  %add23 = add nsw i32 %k.0, %words_to_shift.1, !dbg !265
  %mul24 = mul i32 %add23, 80, !dbg !266
  %add25 = add i32 %add22, %mul24, !dbg !267
  %arrayidx26 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25, !dbg !268
  %4 = load i64, ptr %arrayidx26, align 8, !dbg !269
  %xor = xor i64 %4, %shl20, !dbg !269
  store i64 %xor, ptr %arrayidx26, align 8, !dbg !269
  %cmp27 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !270
  br i1 %cmp27, label %if.then, label %for.inc41, !dbg !270

if.then:                                          ; preds = %for.body16
  %5 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0, !dbg !272
  %arrayidx30.idx = mul nuw nsw i32 %c.0, 40, !dbg !272
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 %arrayidx30.idx, !dbg !272
  %6 = load i64, ptr %arrayidx30, align 8, !dbg !272
  %sub31 = sub nsw i32 64, %bits_to_shift.1, !dbg !274
  %sh_prom32 = zext nneg i32 %sub31 to i64, !dbg !275
  %shr = lshr i64 %6, %sh_prom32, !dbg !275
  %mul33 = shl nuw nsw i32 %i2.0, 3, !dbg !276
  %add34 = or disjoint i32 %mul33, %c.0, !dbg !277
  %add35 = add nsw i32 %k.0, %words_to_shift.1, !dbg !278
  %7 = mul i32 %add35, 80, !dbg !279
  %mul37 = add i32 %7, 80, !dbg !279
  %add38 = add i32 %add34, %mul37, !dbg !280
  %arrayidx39 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38, !dbg !281
  %8 = load i64, ptr %arrayidx39, align 8, !dbg !282
  %xor40 = xor i64 %8, %shr, !dbg !282
  store i64 %xor40, ptr %arrayidx39, align 8, !dbg !282
  br label %for.inc41, !dbg !283

for.inc41:                                        ; preds = %if.then, %for.body16
  %inc42 = add nuw nsw i32 %k.0, 1, !dbg !284
    #dbg_value(i32 %inc42, !256, !DIExpression(), !257)
  br label %for.cond14, !dbg !285, !llvm.loop !286

for.inc44:                                        ; preds = %for.cond14
  %inc45 = add nuw nsw i32 %c.0, 1, !dbg !288
    #dbg_value(i32 %inc45, !244, !DIExpression(), !246)
  br label %for.cond11, !dbg !289, !llvm.loop !290

for.end46:                                        ; preds = %for.cond11
  %cmp47.not = icmp eq i32 %i2.0, %j.0, !dbg !292
  br i1 %cmp47.not, label %if.end95, label %if.then48, !dbg !292

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.0, 320, !dbg !294
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx, !dbg !294
    #dbg_value(ptr %add.ptr51, !296, !DIExpression(), !189)
    #dbg_value(i32 0, !297, !DIExpression(), !299)
  br label %for.cond53, !dbg !300

for.cond53:                                       ; preds = %for.inc92, %if.then48
  %c52.0 = phi i32 [ 0, %if.then48 ], [ %inc93, %for.inc92 ], !dbg !301
    #dbg_value(i32 %c52.0, !297, !DIExpression(), !299)
  %exitcond7 = icmp ne i32 %c52.0, 8, !dbg !302
  br i1 %exitcond7, label %for.cond57.preheader, label %if.end95.loopexit, !dbg !304

for.cond57.preheader:                             ; preds = %for.cond53
  br label %for.cond57, !dbg !305

for.cond57:                                       ; preds = %for.inc89, %for.cond57.preheader
  %k56.0 = phi i32 [ %inc90, %for.inc89 ], [ 0, %for.cond57.preheader ], !dbg !308
    #dbg_value(i32 %k56.0, !309, !DIExpression(), !310)
  %exitcond6 = icmp ne i32 %k56.0, 5, !dbg !311
  br i1 %exitcond6, label %for.body59, label %for.inc92, !dbg !305

for.body59:                                       ; preds = %for.cond57
  %9 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0, !dbg !313
  %arrayidx62.idx = mul nuw nsw i32 %c52.0, 40, !dbg !313
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %9, i32 %arrayidx62.idx, !dbg !313
  %10 = load i64, ptr %arrayidx62, align 8, !dbg !313
  %sh_prom63 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !315
  %shl64 = shl i64 %10, %sh_prom63, !dbg !315
  %mul65 = shl nsw i32 %j.0, 3, !dbg !316
  %add66 = or disjoint i32 %mul65, %c52.0, !dbg !317
  %add67 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !318
  %mul68 = mul i32 %add67, 80, !dbg !319
  %add69 = add i32 %add66, %mul68, !dbg !320
  %arrayidx70 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69, !dbg !321
  %11 = load i64, ptr %arrayidx70, align 8, !dbg !322
  %xor71 = xor i64 %11, %shl64, !dbg !322
  store i64 %xor71, ptr %arrayidx70, align 8, !dbg !322
  %cmp72 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !323
  br i1 %cmp72, label %if.then73, label %for.inc89, !dbg !323

if.then73:                                        ; preds = %for.body59
  %12 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0, !dbg !325
  %arrayidx76.idx = mul nuw nsw i32 %c52.0, 40, !dbg !325
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %12, i32 %arrayidx76.idx, !dbg !325
  %13 = load i64, ptr %arrayidx76, align 8, !dbg !325
  %sub77 = sub nsw i32 64, %bits_to_shift.1, !dbg !327
  %sh_prom78 = zext nneg i32 %sub77 to i64, !dbg !328
  %shr79 = lshr i64 %13, %sh_prom78, !dbg !328
  %mul80 = shl nsw i32 %j.0, 3, !dbg !329
  %add81 = or disjoint i32 %mul80, %c52.0, !dbg !330
  %add82 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !331
  %14 = mul i32 %add82, 80, !dbg !332
  %mul84 = add i32 %14, 80, !dbg !332
  %add85 = add i32 %add81, %mul84, !dbg !333
  %arrayidx86 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85, !dbg !334
  %15 = load i64, ptr %arrayidx86, align 8, !dbg !335
  %xor87 = xor i64 %15, %shr79, !dbg !335
  store i64 %xor87, ptr %arrayidx86, align 8, !dbg !335
  br label %for.inc89, !dbg !336

for.inc89:                                        ; preds = %if.then73, %for.body59
  %inc90 = add nuw nsw i32 %k56.0, 1, !dbg !337
    #dbg_value(i32 %inc90, !309, !DIExpression(), !310)
  br label %for.cond57, !dbg !338, !llvm.loop !339

for.inc92:                                        ; preds = %for.cond57
  %inc93 = add nuw nsw i32 %c52.0, 1, !dbg !341
    #dbg_value(i32 %inc93, !297, !DIExpression(), !299)
  br label %for.cond53, !dbg !342, !llvm.loop !343

if.end95.loopexit:                                ; preds = %for.cond53
  br label %if.end95, !dbg !345

if.end95:                                         ; preds = %if.end95.loopexit, %for.end46
  %add96 = add nsw i32 %bits_to_shift.1, 4, !dbg !345
    #dbg_value(i32 %add96, !192, !DIExpression(), !189)
  %cmp97 = icmp eq i32 %add96, 64, !dbg !346
  %inc99 = zext i1 %cmp97 to i32, !dbg !346
  %spec.select = add nsw i32 %words_to_shift.1, %inc99, !dbg !346
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96, !dbg !346
    #dbg_value(i32 %spec.select3, !192, !DIExpression(), !189)
    #dbg_value(i32 %spec.select, !193, !DIExpression(), !189)
  %dec = add nsw i32 %j.0, -1, !dbg !348
    #dbg_value(i32 %dec, !236, !DIExpression(), !237)
  br label %for.cond6, !dbg !349, !llvm.loop !350

for.inc103:                                       ; preds = %for.cond6
  %words_to_shift.1.lcssa = phi i32 [ %words_to_shift.1, %for.cond6 ], !dbg !189
  %bits_to_shift.1.lcssa = phi i32 [ %bits_to_shift.1, %for.cond6 ], !dbg !189
  %inc104 = add nuw nsw i32 %i2.0, 1, !dbg !352
    #dbg_value(i32 %inc104, !226, !DIExpression(), !227)
  br label %for.cond3, !dbg !353, !llvm.loop !354

for.cond107:                                      ; preds = %transpose_16x16_nibbles.exit, %for.cond107.preheader
  %c106.0 = phi i32 [ %add113, %transpose_16x16_nibbles.exit ], [ 0, %for.cond107.preheader ], !dbg !356
    #dbg_value(i32 %c106.0, !357, !DIExpression(), !356)
  %cmp109 = icmp samesign ult i32 %c106.0, 720, !dbg !358
  br i1 %cmp109, label %for.body110, label %for.end114, !dbg !233

for.body110:                                      ; preds = %for.cond107
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.0, !dbg !360
    #dbg_value(ptr %add.ptr111, !362, !DIExpression(), !363)
    #dbg_value(i32 0, !365, !DIExpression(), !367)
  br label %for.cond.i30, !dbg !368

for.cond.i30:                                     ; preds = %for.body.i35, %for.body110
  %i.0.i31 = phi i32 [ 0, %for.body110 ], [ %add7.i, %for.body.i35 ], !dbg !369
    #dbg_value(i32 %i.0.i31, !365, !DIExpression(), !367)
  %cmp.i32 = icmp samesign ult i32 %i.0.i31, 16, !dbg !370
  br i1 %cmp.i32, label %for.body.i35, label %for.cond9.preheader.i, !dbg !372

for.cond9.preheader.i:                            ; preds = %for.cond.i30
  br label %for.cond9.i, !dbg !373

for.body.i35:                                     ; preds = %for.cond.i30
  %arrayidx.i36 = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i.0.i31, !dbg !375
  %16 = load i64, ptr %arrayidx.i36, align 8, !dbg !375
  %shr.i = lshr i64 %16, 4, !dbg !377
  %add.i = or disjoint i32 %i.0.i31, 1, !dbg !378
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add.i, !dbg !379
  %17 = load i64, ptr %arrayidx1.i, align 8, !dbg !379
  %xor.i = xor i64 %shr.i, %17, !dbg !380
  %and.i = and i64 %xor.i, 1085102592571150095, !dbg !381
    #dbg_value(i64 %and.i, !382, !DIExpression(), !383)
  %shl.i = shl nuw i64 %and.i, 4, !dbg !384
  %arrayidx2.i37 = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i.0.i31, !dbg !385
  %18 = load i64, ptr %arrayidx2.i37, align 8, !dbg !386
  %xor3.i = xor i64 %18, %shl.i, !dbg !386
  store i64 %xor3.i, ptr %arrayidx2.i37, align 8, !dbg !386
  %add4.i = or disjoint i32 %i.0.i31, 1, !dbg !387
  %arrayidx5.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add4.i, !dbg !388
  %19 = load i64, ptr %arrayidx5.i, align 8, !dbg !389
  %xor6.i = xor i64 %19, %and.i, !dbg !389
  store i64 %xor6.i, ptr %arrayidx5.i, align 8, !dbg !389
  %add7.i = add nuw nsw i32 %i.0.i31, 2, !dbg !390
    #dbg_value(i32 %add7.i, !365, !DIExpression(), !367)
  br label %for.cond.i30, !dbg !391, !llvm.loop !392

for.cond9.i:                                      ; preds = %for.body11.i, %for.cond9.preheader.i
  %i8.0.i = phi i32 [ %add39.i, %for.body11.i ], [ 0, %for.cond9.preheader.i ], !dbg !394
    #dbg_value(i32 %i8.0.i, !395, !DIExpression(), !396)
  %cmp10.i = icmp samesign ult i32 %i8.0.i, 16, !dbg !397
  br i1 %cmp10.i, label %for.body11.i, label %for.cond42.preheader.i, !dbg !373

for.cond42.preheader.i:                           ; preds = %for.cond9.i
  br label %for.cond42.i, !dbg !399

for.body11.i:                                     ; preds = %for.cond9.i
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i8.0.i, !dbg !401
  %20 = load i64, ptr %arrayidx12.i, align 8, !dbg !401
  %shr13.i = lshr i64 %20, 8, !dbg !403
  %add14.i = or disjoint i32 %i8.0.i, 2, !dbg !404
  %arrayidx15.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add14.i, !dbg !405
  %21 = load i64, ptr %arrayidx15.i, align 8, !dbg !405
  %xor16.i = xor i64 %shr13.i, %21, !dbg !406
  %and17.i = and i64 %xor16.i, 71777214294589695, !dbg !407
    #dbg_value(i64 %and17.i, !408, !DIExpression(), !409)
  %add18.i = or disjoint i32 %i8.0.i, 1, !dbg !410
  %arrayidx19.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add18.i, !dbg !411
  %22 = load i64, ptr %arrayidx19.i, align 8, !dbg !411
  %shr20.i = lshr i64 %22, 8, !dbg !412
  %add21.i = or disjoint i32 %i8.0.i, 3, !dbg !413
  %arrayidx22.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add21.i, !dbg !414
  %23 = load i64, ptr %arrayidx22.i, align 8, !dbg !414
  %xor23.i = xor i64 %shr20.i, %23, !dbg !415
  %and24.i = and i64 %xor23.i, 71777214294589695, !dbg !416
    #dbg_value(i64 %and24.i, !417, !DIExpression(), !409)
  %shl25.i = shl nuw i64 %and17.i, 8, !dbg !418
  %arrayidx26.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i8.0.i, !dbg !419
  %24 = load i64, ptr %arrayidx26.i, align 8, !dbg !420
  %xor27.i = xor i64 %24, %shl25.i, !dbg !420
  store i64 %xor27.i, ptr %arrayidx26.i, align 8, !dbg !420
  %shl28.i = shl nuw i64 %and24.i, 8, !dbg !421
  %add29.i = or disjoint i32 %i8.0.i, 1, !dbg !422
  %arrayidx30.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add29.i, !dbg !423
  %25 = load i64, ptr %arrayidx30.i, align 8, !dbg !424
  %xor31.i = xor i64 %25, %shl28.i, !dbg !424
  store i64 %xor31.i, ptr %arrayidx30.i, align 8, !dbg !424
  %add32.i = or disjoint i32 %i8.0.i, 2, !dbg !425
  %arrayidx33.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add32.i, !dbg !426
  %26 = load i64, ptr %arrayidx33.i, align 8, !dbg !427
  %xor34.i = xor i64 %26, %and17.i, !dbg !427
  store i64 %xor34.i, ptr %arrayidx33.i, align 8, !dbg !427
  %add35.i = or disjoint i32 %i8.0.i, 3, !dbg !428
  %arrayidx36.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add35.i, !dbg !429
  %27 = load i64, ptr %arrayidx36.i, align 8, !dbg !430
  %xor37.i = xor i64 %27, %and24.i, !dbg !430
  store i64 %xor37.i, ptr %arrayidx36.i, align 8, !dbg !430
  %add39.i = add nuw nsw i32 %i8.0.i, 4, !dbg !431
    #dbg_value(i32 %add39.i, !395, !DIExpression(), !396)
  br label %for.cond9.i, !dbg !432, !llvm.loop !433

for.cond42.i:                                     ; preds = %for.body44.i, %for.cond42.preheader.i
  %i41.0.i = phi i32 [ %inc.i34, %for.body44.i ], [ 0, %for.cond42.preheader.i ], !dbg !435
    #dbg_value(i32 %i41.0.i, !436, !DIExpression(), !437)
  %exitcond.i33 = icmp ne i32 %i41.0.i, 4, !dbg !438
  br i1 %exitcond.i33, label %for.body44.i, label %for.cond76.preheader.i, !dbg !399

for.cond76.preheader.i:                           ; preds = %for.cond42.i
  br label %for.cond76.i, !dbg !440

for.body44.i:                                     ; preds = %for.cond42.i
  %arrayidx46.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i41.0.i, !dbg !442
  %28 = load i64, ptr %arrayidx46.i, align 8, !dbg !442
  %shr47.i = lshr i64 %28, 16, !dbg !444
  %add48.i = or disjoint i32 %i41.0.i, 4, !dbg !445
  %arrayidx49.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add48.i, !dbg !446
  %29 = load i64, ptr %arrayidx49.i, align 8, !dbg !446
  %xor50.i = xor i64 %shr47.i, %29, !dbg !447
  %and51.i = and i64 %xor50.i, 281470681808895, !dbg !448
    #dbg_value(i64 %and51.i, !449, !DIExpression(), !450)
  %add53.i = or disjoint i32 %i41.0.i, 8, !dbg !451
  %arrayidx54.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add53.i, !dbg !452
  %30 = load i64, ptr %arrayidx54.i, align 8, !dbg !452
  %shr55.i = lshr i64 %30, 16, !dbg !453
  %add56.i = or disjoint i32 %i41.0.i, 12, !dbg !454
  %arrayidx57.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add56.i, !dbg !455
  %31 = load i64, ptr %arrayidx57.i, align 8, !dbg !455
  %xor58.i = xor i64 %shr55.i, %31, !dbg !456
  %and59.i = and i64 %xor58.i, 281470681808895, !dbg !457
    #dbg_value(i64 %and59.i, !458, !DIExpression(), !450)
  %shl60.i = shl nuw i64 %and51.i, 16, !dbg !459
  %arrayidx61.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i41.0.i, !dbg !460
  %32 = load i64, ptr %arrayidx61.i, align 8, !dbg !461
  %xor62.i = xor i64 %32, %shl60.i, !dbg !461
  store i64 %xor62.i, ptr %arrayidx61.i, align 8, !dbg !461
  %shl63.i = shl nuw i64 %and59.i, 16, !dbg !462
  %add64.i = or disjoint i32 %i41.0.i, 8, !dbg !463
  %arrayidx65.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add64.i, !dbg !464
  %33 = load i64, ptr %arrayidx65.i, align 8, !dbg !465
  %xor66.i = xor i64 %33, %shl63.i, !dbg !465
  store i64 %xor66.i, ptr %arrayidx65.i, align 8, !dbg !465
  %add67.i = or disjoint i32 %i41.0.i, 4, !dbg !466
  %arrayidx68.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add67.i, !dbg !467
  %34 = load i64, ptr %arrayidx68.i, align 8, !dbg !468
  %xor69.i = xor i64 %34, %and51.i, !dbg !468
  store i64 %xor69.i, ptr %arrayidx68.i, align 8, !dbg !468
  %add70.i = or disjoint i32 %i41.0.i, 12, !dbg !469
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add70.i, !dbg !470
  %35 = load i64, ptr %arrayidx71.i, align 8, !dbg !471
  %xor72.i = xor i64 %35, %and59.i, !dbg !471
  store i64 %xor72.i, ptr %arrayidx71.i, align 8, !dbg !471
  %inc.i34 = add nuw nsw i32 %i41.0.i, 1, !dbg !472
    #dbg_value(i32 %inc.i34, !436, !DIExpression(), !437)
  br label %for.cond42.i, !dbg !473, !llvm.loop !474

for.cond76.i:                                     ; preds = %for.body78.i, %for.cond76.preheader.i
  %i75.0.i = phi i32 [ %inc93.i, %for.body78.i ], [ 0, %for.cond76.preheader.i ], !dbg !476
    #dbg_value(i32 %i75.0.i, !477, !DIExpression(), !478)
  %exitcond1.i = icmp ne i32 %i75.0.i, 8, !dbg !479
  br i1 %exitcond1.i, label %for.body78.i, label %transpose_16x16_nibbles.exit, !dbg !440

for.body78.i:                                     ; preds = %for.cond76.i
  %arrayidx80.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i75.0.i, !dbg !481
  %36 = load i64, ptr %arrayidx80.i, align 8, !dbg !481
  %shr81.i = lshr i64 %36, 32, !dbg !483
  %add82.i = or disjoint i32 %i75.0.i, 8, !dbg !484
  %arrayidx83.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add82.i, !dbg !485
  %37 = load i64, ptr %arrayidx83.i, align 8, !dbg !485
  %.masked.i = and i64 %37, 4294967295, !dbg !486
  %and85.i = xor i64 %shr81.i, %.masked.i, !dbg !486
    #dbg_value(i64 %and85.i, !487, !DIExpression(), !488)
  %shl86.i = shl nuw i64 %and85.i, 32, !dbg !489
  %arrayidx87.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i75.0.i, !dbg !490
  %38 = load i64, ptr %arrayidx87.i, align 8, !dbg !491
  %xor88.i = xor i64 %38, %shl86.i, !dbg !491
  store i64 %xor88.i, ptr %arrayidx87.i, align 8, !dbg !491
  %add89.i = or disjoint i32 %i75.0.i, 8, !dbg !492
  %arrayidx90.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add89.i, !dbg !493
  %39 = load i64, ptr %arrayidx90.i, align 8, !dbg !494
  %xor91.i = xor i64 %39, %and85.i, !dbg !494
  store i64 %xor91.i, ptr %arrayidx90.i, align 8, !dbg !494
  %inc93.i = add nuw nsw i32 %i75.0.i, 1, !dbg !495
    #dbg_value(i32 %inc93.i, !477, !DIExpression(), !478)
  br label %for.cond76.i, !dbg !496, !llvm.loop !497

transpose_16x16_nibbles.exit:                     ; preds = %for.cond76.i
  %add113 = add nuw nsw i32 %c106.0, 16, !dbg !499
    #dbg_value(i32 %add113, !357, !DIExpression(), !356)
  br label %for.cond107, !dbg !500, !llvm.loop !501

for.end114:                                       ; preds = %for.cond107
    #dbg_declare(ptr %tab, !503, !DIExpression(), !504)
    #dbg_value(ptr %tab, !133, !DIExpression(), !505)
    #dbg_value(i8 0, !135, !DIExpression(), !505)
    #dbg_value(i32 16, !136, !DIExpression(), !505)
    #dbg_value(ptr %tab, !137, !DIExpression(), !505)
    #dbg_value(i32 0, !138, !DIExpression(), !507)
  br label %for.cond.i, !dbg !508

for.cond.i:                                       ; preds = %for.body.i, %for.end114
  %i.0.i = phi i32 [ 0, %for.end114 ], [ %inc.i, %for.body.i ], !dbg !509
    #dbg_value(i32 %i.0.i, !138, !DIExpression(), !507)
  %exitcond.i = icmp ne i32 %i.0.i, 16, !dbg !510
  br i1 %exitcond.i, label %for.body.i, label %mayo_memset.exit, !dbg !511

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tab, i32 %i.0.i, !dbg !512
  store i8 0, ptr %arrayidx.i, align 1, !dbg !513
  %inc.i = add i32 %i.0.i, 1, !dbg !514
    #dbg_value(i32 %inc.i, !138, !DIExpression(), !507)
  br label %for.cond.i, !dbg !515, !llvm.loop !516

mayo_memset.exit:                                 ; preds = %for.cond.i
    #dbg_value(i32 0, !518, !DIExpression(), !520)
  br label %for.cond116, !dbg !521

for.cond116:                                      ; preds = %for.body118, %mayo_memset.exit
  %i115.0 = phi i32 [ 0, %mayo_memset.exit ], [ %inc138, %for.body118 ], !dbg !522
    #dbg_value(i32 %i115.0, !518, !DIExpression(), !520)
  %exitcond9 = icmp ne i32 %i115.0, 4, !dbg !523
  br i1 %exitcond9, label %for.body118, label %for.cond141.preheader, !dbg !525

for.cond141.preheader:                            ; preds = %for.cond116
  br label %for.cond141, !dbg !526

for.body118:                                      ; preds = %for.cond116
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !528
  %40 = load i8, ptr %arrayidx119, align 1, !dbg !528
    #dbg_value(i8 %40, !530, !DIExpression(), !535)
    #dbg_value(i8 1, !537, !DIExpression(), !535)
  %41 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !538
  %xor1.i = xor i8 %40, %41, !dbg !539
    #dbg_value(i8 %xor1.i, !530, !DIExpression(), !535)
  %42 = trunc i8 %xor1.i to i1, !dbg !540
    #dbg_value(i8 poison, !541, !DIExpression(), !535)
  %43 = and i8 %xor1.i, 2, !dbg !542
  %conv10.i = select i1 %42, i8 1, i8 0, !dbg !540
  %xor11.i = xor i8 %conv10.i, %43, !dbg !543
    #dbg_value(i8 %xor11.i, !541, !DIExpression(), !535)
  %44 = and i8 %xor1.i, 4, !dbg !544
  %xor18.i = xor i8 %44, %xor11.i, !dbg !545
    #dbg_value(i8 %xor18.i, !541, !DIExpression(), !535)
  %45 = and i8 %xor1.i, 8, !dbg !546
  %xor25.i = xor i8 %45, %xor18.i, !dbg !547
    #dbg_value(i8 %xor25.i, !541, !DIExpression(), !535)
    #dbg_value(i8 %xor25.i, !548, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !535)
  %46 = lshr i8 %xor25.i, 4, !dbg !549
  %47 = lshr i8 %xor25.i, 3, !dbg !550
  %48 = and i8 %47, 14, !dbg !550
  %49 = xor i8 %46, %48, !dbg !551
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !552
  %50 = xor i8 %49, %xor25.masked.i, !dbg !552
    #dbg_value(i8 %50, !553, !DIExpression(), !535)
  %mul120 = shl nuw nsw i32 %i115.0, 2, !dbg !554
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120, !dbg !555
  store i8 %50, ptr %arrayidx121, align 1, !dbg !556
    #dbg_value(i8 %40, !530, !DIExpression(), !557)
    #dbg_value(i8 2, !537, !DIExpression(), !557)
  %51 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !559
  %xor1.i7 = xor i8 %40, %51, !dbg !560
    #dbg_value(i8 %xor1.i7, !530, !DIExpression(), !557)
  %52 = trunc i8 %xor1.i7 to i1, !dbg !561
    #dbg_value(i8 poison, !541, !DIExpression(), !557)
  %53 = and i8 %xor1.i7, 2, !dbg !562
  %mul9.i8 = mul i8 %53, 2, !dbg !563
  %conv10.i9 = select i1 %52, i8 2, i8 0, !dbg !561
  %xor11.i10 = xor i8 %conv10.i9, %mul9.i8, !dbg !564
    #dbg_value(i8 %xor11.i10, !541, !DIExpression(), !557)
  %54 = and i8 %xor1.i7, 4, !dbg !565
  %mul16.i11 = mul i8 %54, 2, !dbg !566
  %xor18.i12 = xor i8 %mul16.i11, %xor11.i10, !dbg !567
    #dbg_value(i8 %xor18.i12, !541, !DIExpression(), !557)
  %55 = and i8 %xor1.i7, 8, !dbg !568
  %mul23.i13 = mul i8 %55, 2, !dbg !569
  %xor25.i14 = xor i8 %mul23.i13, %xor18.i12, !dbg !570
    #dbg_value(i8 %xor25.i14, !541, !DIExpression(), !557)
    #dbg_value(i8 %xor25.i14, !548, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !557)
  %56 = lshr i8 %xor25.i14, 4, !dbg !571
  %57 = lshr i8 %xor25.i14, 3, !dbg !572
  %58 = and i8 %57, 14, !dbg !572
  %59 = xor i8 %56, %58, !dbg !573
  %xor25.masked.i15 = and i8 %xor25.i14, 15, !dbg !574
  %60 = xor i8 %59, %xor25.masked.i15, !dbg !574
    #dbg_value(i8 %60, !553, !DIExpression(), !557)
  %mul124 = shl nuw nsw i32 %i115.0, 2, !dbg !575
  %add125 = or disjoint i32 %mul124, 1, !dbg !576
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125, !dbg !577
  store i8 %60, ptr %arrayidx126, align 1, !dbg !578
  %arrayidx127 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !579
  %61 = load i8, ptr %arrayidx127, align 1, !dbg !579
    #dbg_value(i8 %61, !530, !DIExpression(), !580)
    #dbg_value(i8 4, !537, !DIExpression(), !580)
  %62 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !582
  %xor1.i16 = xor i8 %61, %62, !dbg !583
    #dbg_value(i8 %xor1.i16, !530, !DIExpression(), !580)
  %63 = trunc i8 %xor1.i16 to i1, !dbg !584
    #dbg_value(i8 poison, !541, !DIExpression(), !580)
  %64 = and i8 %xor1.i16, 2, !dbg !585
  %mul9.i17 = mul i8 %64, 4, !dbg !586
  %conv10.i18 = select i1 %63, i8 4, i8 0, !dbg !584
  %xor11.i19 = xor i8 %conv10.i18, %mul9.i17, !dbg !587
    #dbg_value(i8 %xor11.i19, !541, !DIExpression(), !580)
  %65 = and i8 %xor1.i16, 4, !dbg !588
  %mul16.i20 = mul i8 %65, 4, !dbg !589
  %xor18.i21 = xor i8 %mul16.i20, %xor11.i19, !dbg !590
    #dbg_value(i8 %xor18.i21, !541, !DIExpression(), !580)
  %66 = and i8 %xor1.i16, 8, !dbg !591
  %mul23.i22 = mul i8 %66, 4, !dbg !592
  %xor25.i23 = xor i8 %mul23.i22, %xor18.i21, !dbg !593
    #dbg_value(i8 %xor25.i23, !541, !DIExpression(), !580)
    #dbg_value(i8 %xor25.i23, !548, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !580)
  %67 = lshr i8 %xor25.i23, 4, !dbg !594
  %68 = lshr i8 %xor25.i23, 3, !dbg !595
  %69 = and i8 %68, 14, !dbg !595
  %70 = xor i8 %67, %69, !dbg !596
  %xor25.masked.i24 = and i8 %xor25.i23, 15, !dbg !597
  %71 = xor i8 %70, %xor25.masked.i24, !dbg !597
    #dbg_value(i8 %71, !553, !DIExpression(), !580)
  %mul129 = shl nuw nsw i32 %i115.0, 2, !dbg !598
  %add130 = or disjoint i32 %mul129, 2, !dbg !599
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130, !dbg !600
  store i8 %71, ptr %arrayidx131, align 1, !dbg !601
  %arrayidx132 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !602
  %72 = load i8, ptr %arrayidx132, align 1, !dbg !602
    #dbg_value(i8 %72, !530, !DIExpression(), !603)
    #dbg_value(i8 8, !537, !DIExpression(), !603)
  %73 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !605
  %xor1.i1 = xor i8 %72, %73, !dbg !606
    #dbg_value(i8 %xor1.i1, !530, !DIExpression(), !603)
  %74 = trunc i8 %xor1.i1 to i1, !dbg !607
    #dbg_value(i8 poison, !541, !DIExpression(), !603)
  %75 = and i8 %xor1.i1, 2, !dbg !608
  %mul9.i = mul i8 %75, 8, !dbg !609
  %conv10.i2 = select i1 %74, i8 8, i8 0, !dbg !607
  %xor11.i3 = xor i8 %conv10.i2, %mul9.i, !dbg !610
    #dbg_value(i8 %xor11.i3, !541, !DIExpression(), !603)
  %76 = and i8 %xor1.i1, 4, !dbg !611
  %mul16.i = mul i8 %76, 8, !dbg !612
  %xor18.i4 = xor i8 %mul16.i, %xor11.i3, !dbg !613
    #dbg_value(i8 %xor18.i4, !541, !DIExpression(), !603)
  %77 = and i8 %xor1.i1, 8, !dbg !614
  %mul23.i = mul i8 %77, 8, !dbg !615
  %xor25.i5 = xor i8 %mul23.i, %xor18.i4, !dbg !616
    #dbg_value(i8 %xor25.i5, !541, !DIExpression(), !603)
    #dbg_value(i8 %xor25.i5, !548, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !603)
  %78 = lshr i8 %xor25.i5, 4, !dbg !617
  %79 = lshr i8 %xor25.i5, 3, !dbg !618
  %80 = and i8 %79, 14, !dbg !618
  %81 = xor i8 %78, %80, !dbg !619
  %xor25.masked.i6 = and i8 %xor25.i5, 15, !dbg !620
  %82 = xor i8 %81, %xor25.masked.i6, !dbg !620
    #dbg_value(i8 %82, !553, !DIExpression(), !603)
  %mul134 = shl nuw nsw i32 %i115.0, 2, !dbg !621
  %add135 = or disjoint i32 %mul134, 3, !dbg !622
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135, !dbg !623
  store i8 %82, ptr %arrayidx136, align 1, !dbg !624
  %inc138 = add nuw nsw i32 %i115.0, 1, !dbg !625
    #dbg_value(i32 %inc138, !518, !DIExpression(), !520)
  br label %for.cond116, !dbg !626, !llvm.loop !627

for.cond141:                                      ; preds = %for.inc203, %for.cond141.preheader
  %c140.0 = phi i32 [ %add204, %for.inc203 ], [ 0, %for.cond141.preheader ], !dbg !629
    #dbg_value(i32 %c140.0, !630, !DIExpression(), !631)
  %cmp142 = icmp samesign ult i32 %c140.0, 80, !dbg !632
  br i1 %cmp142, label %for.cond144.preheader, label %for.cond207.preheader, !dbg !526

for.cond144.preheader:                            ; preds = %for.cond141
  br label %for.cond144, !dbg !634

for.cond207.preheader:                            ; preds = %for.cond141
  br label %for.cond207, !dbg !637

for.cond144:                                      ; preds = %for.inc200, %for.cond144.preheader
  %r.0 = phi i32 [ %inc201, %for.inc200 ], [ 78, %for.cond144.preheader ], !dbg !639
    #dbg_value(i32 %r.0, !640, !DIExpression(), !639)
  %exitcond11 = icmp ne i32 %r.0, 133, !dbg !641
  br i1 %exitcond11, label %for.body146, label %for.inc203, !dbg !634

for.body146:                                      ; preds = %for.cond144
  %div1 = lshr i32 %r.0, 4, !dbg !643
  %mul147 = mul nuw nsw i32 %div1, 80, !dbg !645
  %add148 = add nuw nsw i32 %mul147, %c140.0, !dbg !646
  %rem = and i32 %r.0, 15, !dbg !647
  %add149 = or disjoint i32 %add148, %rem, !dbg !648
    #dbg_value(i32 %add149, !649, !DIExpression(), !650)
  %arrayidx150 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !651
  %83 = load i64, ptr %arrayidx150, align 8, !dbg !651
  %and151 = and i64 %83, 1229782938247303441, !dbg !652
    #dbg_value(i64 %and151, !653, !DIExpression(), !650)
  %shr153 = lshr i64 %83, 1, !dbg !654
  %and154 = and i64 %shr153, 1229782938247303441, !dbg !655
    #dbg_value(i64 %and154, !656, !DIExpression(), !650)
  %shr156 = lshr i64 %83, 2, !dbg !657
  %and157 = and i64 %shr156, 1229782938247303441, !dbg !658
    #dbg_value(i64 %and157, !659, !DIExpression(), !650)
  %arrayidx158 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !660
  %84 = load i64, ptr %arrayidx158, align 8, !dbg !660
  %shr159 = lshr i64 %84, 3, !dbg !661
  %and160 = and i64 %shr159, 1229782938247303441, !dbg !662
    #dbg_value(i64 %and160, !663, !DIExpression(), !650)
    #dbg_value(i32 0, !664, !DIExpression(), !666)
  br label %for.cond161, !dbg !667

for.cond161:                                      ; preds = %for.body163, %for.body146
  %t.0 = phi i32 [ 0, %for.body146 ], [ %inc198, %for.body163 ], !dbg !668
    #dbg_value(i32 %t.0, !664, !DIExpression(), !666)
  %exitcond10 = icmp ne i32 %t.0, 4, !dbg !669
  br i1 %exitcond10, label %for.body163, label %for.inc200, !dbg !671

for.body163:                                      ; preds = %for.cond161
  %mul164 = shl nuw nsw i32 %t.0, 2, !dbg !672
  %arrayidx166 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul164, !dbg !674
  %85 = load i8, ptr %arrayidx166, align 1, !dbg !674
  %conv = zext i8 %85 to i64, !dbg !674
  %mul167 = mul i64 %and151, %conv, !dbg !675
  %mul168 = shl nuw nsw i32 %t.0, 2, !dbg !676
  %add169 = or disjoint i32 %mul168, 1, !dbg !677
  %arrayidx170 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add169, !dbg !678
  %86 = load i8, ptr %arrayidx170, align 1, !dbg !678
  %conv171 = zext i8 %86 to i64, !dbg !678
  %mul172 = mul i64 %and154, %conv171, !dbg !679
  %xor173 = xor i64 %mul167, %mul172, !dbg !680
  %mul174 = shl nuw nsw i32 %t.0, 2, !dbg !681
  %add175 = or disjoint i32 %mul174, 2, !dbg !682
  %arrayidx176 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add175, !dbg !683
  %87 = load i8, ptr %arrayidx176, align 1, !dbg !683
  %conv177 = zext i8 %87 to i64, !dbg !683
  %mul178 = mul i64 %and157, %conv177, !dbg !684
  %xor179 = xor i64 %xor173, %mul178, !dbg !685
  %mul180 = shl nuw nsw i32 %t.0, 2, !dbg !686
  %add181 = or disjoint i32 %mul180, 3, !dbg !687
  %arrayidx182 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add181, !dbg !688
  %88 = load i8, ptr %arrayidx182, align 1, !dbg !688
  %conv183 = zext i8 %88 to i64, !dbg !688
  %mul184 = mul i64 %and160, %conv183, !dbg !689
  %xor185 = xor i64 %xor179, %mul184, !dbg !690
  %add186 = add nuw nsw i32 %r.0, %t.0, !dbg !691
  %sub187 = add nsw i32 %add186, -78, !dbg !692
  %div1882 = lshr i32 %sub187, 4, !dbg !693
  %mul189 = mul i32 %div1882, 80, !dbg !694
  %add190 = add i32 %mul189, %c140.0, !dbg !695
  %add191 = add nuw nsw i32 %r.0, %t.0, !dbg !696
  %sub192 = add nuw nsw i32 %add191, 2, !dbg !697
  %rem193 = and i32 %sub192, 15, !dbg !698
  %add194 = or disjoint i32 %add190, %rem193, !dbg !699
  %arrayidx195 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194, !dbg !700
  %89 = load i64, ptr %arrayidx195, align 8, !dbg !701
  %xor196 = xor i64 %89, %xor185, !dbg !701
  store i64 %xor196, ptr %arrayidx195, align 8, !dbg !701
  %inc198 = add nuw nsw i32 %t.0, 1, !dbg !702
    #dbg_value(i32 %inc198, !664, !DIExpression(), !666)
  br label %for.cond161, !dbg !703, !llvm.loop !704

for.inc200:                                       ; preds = %for.cond161
  %inc201 = add nuw nsw i32 %r.0, 1, !dbg !706
    #dbg_value(i32 %inc201, !640, !DIExpression(), !639)
  br label %for.cond144, !dbg !707, !llvm.loop !708

for.inc203:                                       ; preds = %for.cond144
  %add204 = add nuw nsw i32 %c140.0, 16, !dbg !710
    #dbg_value(i32 %add204, !630, !DIExpression(), !631)
  br label %for.cond141, !dbg !711, !llvm.loop !712

for.cond207:                                      ; preds = %for.inc241, %for.cond207.preheader
  %indvars.iv = phi i32 [ 78, %for.cond207.preheader ], [ %indvars.iv.next, %for.inc241 ], !dbg !714
  %r206.0 = phi i32 [ %add242, %for.inc241 ], [ 0, %for.cond207.preheader ], !dbg !714
    #dbg_value(i32 %r206.0, !715, !DIExpression(), !716)
  %cmp208 = icmp samesign ult i32 %r206.0, 78, !dbg !717
  br i1 %cmp208, label %for.cond212.preheader, label %for.end243, !dbg !637

for.cond212.preheader:                            ; preds = %for.cond207
  br label %for.cond212, !dbg !719

for.cond212:                                      ; preds = %for.inc238, %for.cond212.preheader
  %c211.0 = phi i32 [ %add239, %for.inc238 ], [ 0, %for.cond212.preheader ], !dbg !722
    #dbg_value(i32 %c211.0, !723, !DIExpression(), !724)
  %cmp213 = icmp samesign ult i32 %c211.0, 80, !dbg !725
  br i1 %cmp213, label %for.cond217.preheader, label %for.inc241, !dbg !719

for.cond217.preheader:                            ; preds = %for.cond212
  br label %for.cond217, !dbg !727

for.cond217:                                      ; preds = %decode.exit, %for.cond217.preheader
  %i216.0 = phi i32 [ %inc236, %decode.exit ], [ 0, %for.cond217.preheader ], !dbg !730
    #dbg_value(i32 %i216.0, !731, !DIExpression(), !732)
  %exitcond12 = icmp ne i32 %i216.0, %indvars.iv, !dbg !733
  br i1 %exitcond12, label %for.body221, label %for.inc238, !dbg !727

for.body221:                                      ; preds = %for.cond217
  %div223 = mul nuw nsw i32 %r206.0, 5, !dbg !735
  %add224 = add nuw nsw i32 %div223, %c211.0, !dbg !737
  %add225 = add nuw nsw i32 %add224, %i216.0, !dbg !738
  %arrayidx226 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225, !dbg !739
  %add227 = add nuw nsw i32 %r206.0, %i216.0, !dbg !740
  %mul228 = mul nuw nsw i32 %add227, 81, !dbg !741
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228, !dbg !742
  %add.ptr230 = getelementptr inbounds nuw i8, ptr %add.ptr229, i32 %c211.0, !dbg !743
  %cmp232 = icmp samesign ult i32 %c211.0, 64, !dbg !744
  %sub234 = sub nuw nsw i32 80, %c211.0, !dbg !744
  %cond = select i1 %cmp232, i32 16, i32 %sub234, !dbg !744
    #dbg_value(ptr %arrayidx226, !745, !DIExpression(), !749)
    #dbg_value(ptr %add.ptr230, !751, !DIExpression(), !749)
    #dbg_value(i32 %cond, !752, !DIExpression(), !749)
    #dbg_value(i32 0, !753, !DIExpression(), !749)
  br label %for.cond.i25, !dbg !754

for.cond.i25:                                     ; preds = %for.body.i27, %for.body221
  %mdec.addr.0.i = phi ptr [ %add.ptr230, %for.body221 ], [ %incdec.ptr5.i, %for.body.i27 ]
  %i.0.i26 = phi i32 [ 0, %for.body221 ], [ %inc.i29, %for.body.i27 ], !dbg !756
    #dbg_value(i32 %i.0.i26, !753, !DIExpression(), !749)
    #dbg_value(ptr %mdec.addr.0.i, !751, !DIExpression(), !749)
  %div.i = sdiv i32 %cond, 2, !dbg !757
  %cmp.i = icmp slt i32 %i.0.i26, %div.i, !dbg !759
  br i1 %cmp.i, label %for.body.i27, label %decode.exit, !dbg !760

for.body.i27:                                     ; preds = %for.cond.i25
  %arrayidx.i28 = getelementptr inbounds nuw i8, ptr %arrayidx226, i32 %i.0.i26, !dbg !761
  %90 = load i8, ptr %arrayidx.i28, align 1, !dbg !761
  %91 = and i8 %90, 15, !dbg !763
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !764
    #dbg_value(ptr %incdec.ptr.i, !751, !DIExpression(), !749)
  store i8 %91, ptr %mdec.addr.0.i, align 1, !dbg !765
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %arrayidx226, i32 %i.0.i26, !dbg !766
  %92 = load i8, ptr %arrayidx2.i, align 1, !dbg !766
  %93 = lshr i8 %92, 4, !dbg !767
    #dbg_value(ptr %incdec.ptr.i, !751, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !749)
  store i8 %93, ptr %incdec.ptr.i, align 1, !dbg !768
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !769
    #dbg_value(ptr %incdec.ptr5.i, !751, !DIExpression(), !749)
  %inc.i29 = add nuw nsw i32 %i.0.i26, 1, !dbg !770
    #dbg_value(i32 %inc.i29, !753, !DIExpression(), !749)
  br label %for.cond.i25, !dbg !771, !llvm.loop !772

decode.exit:                                      ; preds = %for.cond.i25
  %inc236 = add nuw nsw i32 %i216.0, 1, !dbg !774
    #dbg_value(i32 %inc236, !731, !DIExpression(), !732)
  br label %for.cond217, !dbg !775, !llvm.loop !776

for.inc238:                                       ; preds = %for.cond217
  %add239 = add nuw nsw i32 %c211.0, 16, !dbg !778
    #dbg_value(i32 %add239, !723, !DIExpression(), !724)
  br label %for.cond212, !dbg !779, !llvm.loop !780

for.inc241:                                       ; preds = %for.cond212
  %add242 = add nuw nsw i32 %r206.0, 16, !dbg !782
    #dbg_value(i32 %add242, !715, !DIExpression(), !716)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !783
  br label %for.cond207, !dbg !783, !llvm.loop !784

for.end243:                                       ; preds = %for.cond207
  ret void, !dbg !786
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !787
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %Mtmp = alloca [400 x i64], align 16, !llvmbmc.var !788
  call void @mayo_memset(ptr %Mtmp, i8 0, i32 3200)
  %byte0 = getelementptr inbounds i8, ptr %Mtmp, i32 0
  store i8 52, ptr %byte0, align 1
  %byte1 = getelementptr inbounds i8, ptr %Mtmp, i32 1
  store i8 -18, ptr %byte1, align 1
  %byte2 = getelementptr inbounds i8, ptr %Mtmp, i32 2
  store i8 -110, ptr %byte2, align 1
  %byte3 = getelementptr inbounds i8, ptr %Mtmp, i32 3
  store i8 -61, ptr %byte3, align 1
  %byte4 = getelementptr inbounds i8, ptr %Mtmp, i32 4
  store i8 57, ptr %byte4, align 1
  %byte5 = getelementptr inbounds i8, ptr %Mtmp, i32 5
  store i8 -33, ptr %byte5, align 1
  %byte6 = getelementptr inbounds i8, ptr %Mtmp, i32 6
  store i8 51, ptr %byte6, align 1
  %byte7 = getelementptr inbounds i8, ptr %Mtmp, i32 7
  store i8 -3, ptr %byte7, align 1
  %A = alloca [6480 x i8], align 16, !llvmbmc.var !789
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  call fastcc void @compute_A(ptr %p_buf, ptr %Mtmp, ptr %A)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !790 {
entry:
    #dbg_value(ptr %dst, !795, !DIExpression(), !796)
    #dbg_value(ptr %src, !797, !DIExpression(), !796)
    #dbg_value(i32 %len, !798, !DIExpression(), !796)
    #dbg_value(ptr %dst, !799, !DIExpression(), !796)
    #dbg_value(ptr %src, !800, !DIExpression(), !796)
    #dbg_value(i32 0, !803, !DIExpression(), !805)
  br label %for.cond, !dbg !806

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !807
    #dbg_value(i32 %i.0, !803, !DIExpression(), !805)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !808
  br i1 %exitcond, label %for.body, label %for.end, !dbg !810

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !811
  %0 = load i8, ptr %arrayidx, align 1, !dbg !811
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !812
  store i8 %0, ptr %arrayidx1, align 1, !dbg !813
  %inc = add i32 %i.0, 1, !dbg !814
    #dbg_value(i32 %inc, !803, !DIExpression(), !805)
  br label %for.cond, !dbg !815, !llvm.loop !816

for.end:                                          ; preds = %for.cond
  ret void, !dbg !818
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!64, !66, !2, !43, !67, !78, !87, !105, !123}
!llvm.ident = !{!124, !124, !124, !124, !124, !124, !124, !124}
!llvm.module.flags = !{!125, !126, !127, !128}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "f_tail", scope: !2, file: !36, line: 247, type: !37, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !21, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4 = !{!5, !11, !14, !15, !18, !19}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !7, line: 60, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !9, line: 105, baseType: !10)
!9 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!10 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 214, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 48, baseType: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 79, baseType: !17)
!21 = !{!0, !22, !30, !32, !34}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !24, file: !25, line: 118, type: !29, isLocal: true, isDefinition: true)
!24 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !25, file: !25, line: 117, type: !26, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!25 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!26 = !DISubroutineType(types: !27)
!27 = !{null, !5}
!28 = !{}
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "even_bytes", scope: !24, file: !25, line: 119, type: !29, isLocal: true, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !24, file: !25, line: 120, type: !29, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "even_half", scope: !24, file: !25, line: 121, type: !29, isLocal: true, isDefinition: true)
!36 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 32, elements: !39)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!39 = !{!40}
!40 = !DISubrange(count: 4)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !43, file: !58, line: 128, type: !63, isLocal: false, isDefinition: true)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, globals: !55, splitDebugInlining: false, nameTableKind: None)
!44 = !{!6, !45, !46, !18, !19, !49, !50, !53}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 56, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 103, baseType: !48)
!48 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 20, baseType: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 41, baseType: !52)
!52 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 44, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 77, baseType: !45)
!55 = !{!56, !60, !41}
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !43, file: !58, line: 126, type: !59, isLocal: false, isDefinition: true)
!58 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!59 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !19)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !43, file: !58, line: 127, type: !62, isLocal: false, isDefinition: true)
!62 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!64 = distinct !DICompileUnit(language: DW_LANG_C11, file: !65, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!65 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!66 = distinct !DICompileUnit(language: DW_LANG_C11, file: !65, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !19, !6, !15, !12}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !45, !6, !19, !14}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !28)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !15}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !45, !15}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !28)
!103 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !102, file: !92, line: 16, baseType: !97)
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !106, globals: !107, splitDebugInlining: false, nameTableKind: None)
!106 = !{!70}
!107 = !{!108}
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "DRBG_ctx", scope: !105, file: !110, line: 48, type: !111, isLocal: false, isDefinition: true)
!110 = !DIFile(filename: "../../../src/common/randombytes_ctrdrbg.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES256_CTR_DRBG_struct", file: !110, line: 40, baseType: !112)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !110, line: 36, size: 416, elements: !113)
!113 = !{!114, !118, !122}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "Key", scope: !112, file: !110, line: 37, baseType: !115, size: 256)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !112, file: !110, line: 38, baseType: !119, size: 128, offset: 256)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 16)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !45, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !65, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!125 = !{i32 2, !"Debug Info Version", i32 3}
!126 = !{i32 1, !"wchar_size", i32 4}
!127 = !{i32 1, !"min_enum_size", i32 4}
!128 = !{i32 1, !"Code Model", i32 1}
!129 = distinct !DISubprogram(name: "mayo_memset", scope: !130, file: !130, line: 3, type: !131, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!130 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!131 = !DISubroutineType(types: !132)
!132 = !{null, !70, !12, !19}
!133 = !DILocalVariable(name: "dst", arg: 1, scope: !129, file: !130, line: 3, type: !70)
!134 = !DILocation(line: 0, scope: !129)
!135 = !DILocalVariable(name: "val", arg: 2, scope: !129, file: !130, line: 3, type: !12)
!136 = !DILocalVariable(name: "len", arg: 3, scope: !129, file: !130, line: 3, type: !19)
!137 = !DILocalVariable(name: "d", scope: !129, file: !130, line: 5, type: !11)
!138 = !DILocalVariable(name: "i", scope: !139, file: !130, line: 7, type: !19)
!139 = distinct !DILexicalBlock(scope: !129, file: !130, line: 7, column: 5)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 7, column: 10, scope: !139)
!142 = !DILocation(line: 7, scope: !139)
!143 = !DILocation(line: 7, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !130, line: 7, column: 5)
!145 = !DILocation(line: 7, column: 5, scope: !139)
!146 = !DILocation(line: 8, column: 9, scope: !144)
!147 = !DILocation(line: 8, column: 14, scope: !144)
!148 = !DILocation(line: 7, column: 36, scope: !144)
!149 = !DILocation(line: 7, column: 5, scope: !144)
!150 = distinct !{!150, !145, !151, !152}
!151 = !DILocation(line: 8, column: 16, scope: !139)
!152 = !{!"llvm.loop.mustprogress"}
!153 = !DILocation(line: 9, column: 1, scope: !129)
!154 = distinct !DISubprogram(name: "compute_A", scope: !25, file: !25, line: 156, type: !155, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157, !5, !18}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 32)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !36, line: 289, baseType: !160)
!160 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !36, line: 265, size: 736, elements: !161)
!161 = !{!162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184}
!162 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !160, file: !36, line: 266, baseType: !45, size: 32)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !160, file: !36, line: 267, baseType: !45, size: 32, offset: 32)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !160, file: !36, line: 268, baseType: !45, size: 32, offset: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !160, file: !36, line: 269, baseType: !45, size: 32, offset: 96)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !160, file: !36, line: 270, baseType: !45, size: 32, offset: 128)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !160, file: !36, line: 271, baseType: !49, size: 32, offset: 160)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !160, file: !36, line: 272, baseType: !45, size: 32, offset: 192)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !160, file: !36, line: 273, baseType: !45, size: 32, offset: 224)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !160, file: !36, line: 274, baseType: !45, size: 32, offset: 256)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !160, file: !36, line: 275, baseType: !45, size: 32, offset: 288)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !160, file: !36, line: 276, baseType: !45, size: 32, offset: 320)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !160, file: !36, line: 277, baseType: !45, size: 32, offset: 352)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !160, file: !36, line: 278, baseType: !45, size: 32, offset: 384)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !160, file: !36, line: 279, baseType: !45, size: 32, offset: 416)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !160, file: !36, line: 280, baseType: !45, size: 32, offset: 448)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !160, file: !36, line: 281, baseType: !45, size: 32, offset: 480)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !160, file: !36, line: 282, baseType: !45, size: 32, offset: 512)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !160, file: !36, line: 283, baseType: !45, size: 32, offset: 544)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !160, file: !36, line: 284, baseType: !45, size: 32, offset: 576)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !160, file: !36, line: 285, baseType: !45, size: 32, offset: 608)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !160, file: !36, line: 286, baseType: !45, size: 32, offset: 640)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !160, file: !36, line: 287, baseType: !45, size: 32, offset: 672)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !160, file: !36, line: 288, baseType: !185, size: 32, offset: 704)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !187)
!187 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!188 = !DILocalVariable(name: "p", arg: 1, scope: !154, file: !25, line: 156, type: !157)
!189 = !DILocation(line: 0, scope: !154)
!190 = !DILocalVariable(name: "VtL", arg: 2, scope: !154, file: !25, line: 156, type: !5)
!191 = !DILocalVariable(name: "A_out", arg: 3, scope: !154, file: !25, line: 157, type: !18)
!192 = !DILocalVariable(name: "bits_to_shift", scope: !154, file: !25, line: 162, type: !45)
!193 = !DILocalVariable(name: "words_to_shift", scope: !154, file: !25, line: 163, type: !45)
!194 = !DILocalVariable(name: "m_vec_limbs", scope: !154, file: !25, line: 164, type: !195)
!195 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!196 = !DILocalVariable(name: "A", scope: !154, file: !25, line: 165, type: !197)
!197 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 51200, elements: !198)
!198 = !{!199}
!199 = !DISubrange(count: 800)
!200 = !DILocation(line: 165, column: 12, scope: !154)
!201 = !DILocalVariable(name: "A_width", scope: !154, file: !25, line: 166, type: !15)
!202 = !DILocalVariable(name: "mask", scope: !203, file: !25, line: 171, type: !6)
!203 = distinct !DILexicalBlock(scope: !204, file: !25, line: 170, column: 29)
!204 = distinct !DILexicalBlock(scope: !154, file: !25, line: 170, column: 7)
!205 = !DILocation(line: 0, scope: !203)
!206 = !DILocalVariable(name: "i", scope: !207, file: !25, line: 174, type: !45)
!207 = distinct !DILexicalBlock(scope: !203, file: !25, line: 174, column: 5)
!208 = !DILocation(line: 0, scope: !207)
!209 = !DILocation(line: 174, column: 10, scope: !207)
!210 = !DILocation(line: 174, scope: !207)
!211 = !DILocation(line: 174, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !25, line: 174, column: 5)
!213 = !DILocation(line: 174, column: 5, scope: !207)
!214 = !DILocation(line: 179, column: 3, scope: !215)
!215 = distinct !DILexicalBlock(scope: !154, file: !25, line: 179, column: 3)
!216 = !DILocation(line: 175, column: 7, scope: !217)
!217 = distinct !DILexicalBlock(scope: !212, file: !25, line: 174, column: 55)
!218 = !DILocation(line: 175, column: 46, scope: !217)
!219 = !DILocation(line: 174, column: 51, scope: !212)
!220 = !DILocation(line: 174, column: 5, scope: !212)
!221 = distinct !{!221, !213, !222, !152}
!222 = !DILocation(line: 176, column: 5, scope: !207)
!223 = !DILocation(line: 179, scope: !215)
!224 = !DILocation(line: 163, column: 7, scope: !154)
!225 = !DILocation(line: 162, column: 7, scope: !154)
!226 = !DILocalVariable(name: "i", scope: !215, file: !25, line: 179, type: !45)
!227 = !DILocation(line: 0, scope: !215)
!228 = !DILocation(line: 179, column: 21, scope: !229)
!229 = distinct !DILexicalBlock(scope: !215, file: !25, line: 179, column: 3)
!230 = !DILocation(line: 180, column: 5, scope: !231)
!231 = distinct !DILexicalBlock(scope: !232, file: !25, line: 180, column: 5)
!232 = distinct !DILexicalBlock(scope: !229, file: !25, line: 179, column: 45)
!233 = !DILocation(line: 216, column: 3, scope: !234)
!234 = distinct !DILexicalBlock(scope: !154, file: !25, line: 216, column: 3)
!235 = !DILocation(line: 180, scope: !231)
!236 = !DILocalVariable(name: "j", scope: !231, file: !25, line: 180, type: !45)
!237 = !DILocation(line: 0, scope: !231)
!238 = !DILocation(line: 180, column: 36, scope: !239)
!239 = distinct !DILexicalBlock(scope: !231, file: !25, line: 180, column: 5)
!240 = !DILocation(line: 182, column: 16, scope: !241)
!241 = distinct !DILexicalBlock(scope: !239, file: !25, line: 180, column: 47)
!242 = !DILocalVariable(name: "Mj", scope: !154, file: !25, line: 167, type: !243)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 32)
!244 = !DILocalVariable(name: "c", scope: !245, file: !25, line: 183, type: !45)
!245 = distinct !DILexicalBlock(scope: !241, file: !25, line: 183, column: 7)
!246 = !DILocation(line: 0, scope: !245)
!247 = !DILocation(line: 183, column: 12, scope: !245)
!248 = !DILocation(line: 183, scope: !245)
!249 = !DILocation(line: 183, column: 25, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !25, line: 183, column: 7)
!251 = !DILocation(line: 183, column: 7, scope: !245)
!252 = !DILocation(line: 184, column: 9, scope: !253)
!253 = distinct !DILexicalBlock(scope: !254, file: !25, line: 184, column: 9)
!254 = distinct !DILexicalBlock(scope: !250, file: !25, line: 183, column: 44)
!255 = !DILocation(line: 184, scope: !253)
!256 = !DILocalVariable(name: "k", scope: !253, file: !25, line: 184, type: !45)
!257 = !DILocation(line: 0, scope: !253)
!258 = !DILocation(line: 184, column: 27, scope: !259)
!259 = distinct !DILexicalBlock(scope: !253, file: !25, line: 184, column: 9)
!260 = !DILocation(line: 186, column: 15, scope: !261)
!261 = distinct !DILexicalBlock(scope: !259, file: !25, line: 184, column: 47)
!262 = !DILocation(line: 186, column: 39, scope: !261)
!263 = !DILocation(line: 185, column: 24, scope: !261)
!264 = !DILocation(line: 185, column: 28, scope: !261)
!265 = !DILocation(line: 185, column: 37, scope: !261)
!266 = !DILocation(line: 185, column: 55, scope: !261)
!267 = !DILocation(line: 185, column: 32, scope: !261)
!268 = !DILocation(line: 185, column: 11, scope: !261)
!269 = !DILocation(line: 185, column: 66, scope: !261)
!270 = !DILocation(line: 187, column: 29, scope: !271)
!271 = distinct !DILexicalBlock(scope: !261, file: !25, line: 187, column: 15)
!272 = !DILocation(line: 189, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !271, file: !25, line: 187, column: 34)
!274 = !DILocation(line: 189, column: 48, scope: !273)
!275 = !DILocation(line: 189, column: 41, scope: !273)
!276 = !DILocation(line: 188, column: 26, scope: !273)
!277 = !DILocation(line: 188, column: 30, scope: !273)
!278 = !DILocation(line: 188, column: 39, scope: !273)
!279 = !DILocation(line: 188, column: 61, scope: !273)
!280 = !DILocation(line: 188, column: 34, scope: !273)
!281 = !DILocation(line: 188, column: 13, scope: !273)
!282 = !DILocation(line: 188, column: 72, scope: !273)
!283 = !DILocation(line: 190, column: 11, scope: !273)
!284 = !DILocation(line: 184, column: 43, scope: !259)
!285 = !DILocation(line: 184, column: 9, scope: !259)
!286 = distinct !{!286, !252, !287, !152}
!287 = !DILocation(line: 191, column: 9, scope: !253)
!288 = !DILocation(line: 183, column: 40, scope: !250)
!289 = !DILocation(line: 183, column: 7, scope: !250)
!290 = distinct !{!290, !251, !291, !152}
!291 = !DILocation(line: 192, column: 7, scope: !245)
!292 = !DILocation(line: 194, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !241, file: !25, line: 194, column: 11)
!294 = !DILocation(line: 195, column: 18, scope: !295)
!295 = distinct !DILexicalBlock(scope: !293, file: !25, line: 194, column: 19)
!296 = !DILocalVariable(name: "Mi", scope: !154, file: !25, line: 167, type: !243)
!297 = !DILocalVariable(name: "c", scope: !298, file: !25, line: 196, type: !45)
!298 = distinct !DILexicalBlock(scope: !295, file: !25, line: 196, column: 9)
!299 = !DILocation(line: 0, scope: !298)
!300 = !DILocation(line: 196, column: 14, scope: !298)
!301 = !DILocation(line: 196, scope: !298)
!302 = !DILocation(line: 196, column: 27, scope: !303)
!303 = distinct !DILexicalBlock(scope: !298, file: !25, line: 196, column: 9)
!304 = !DILocation(line: 196, column: 9, scope: !298)
!305 = !DILocation(line: 197, column: 11, scope: !306)
!306 = distinct !DILexicalBlock(scope: !307, file: !25, line: 197, column: 11)
!307 = distinct !DILexicalBlock(scope: !303, file: !25, line: 196, column: 46)
!308 = !DILocation(line: 197, scope: !306)
!309 = !DILocalVariable(name: "k", scope: !306, file: !25, line: 197, type: !45)
!310 = !DILocation(line: 0, scope: !306)
!311 = !DILocation(line: 197, column: 29, scope: !312)
!312 = distinct !DILexicalBlock(scope: !306, file: !25, line: 197, column: 11)
!313 = !DILocation(line: 199, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !312, file: !25, line: 197, column: 49)
!315 = !DILocation(line: 199, column: 41, scope: !314)
!316 = !DILocation(line: 198, column: 26, scope: !314)
!317 = !DILocation(line: 198, column: 30, scope: !314)
!318 = !DILocation(line: 198, column: 39, scope: !314)
!319 = !DILocation(line: 198, column: 57, scope: !314)
!320 = !DILocation(line: 198, column: 34, scope: !314)
!321 = !DILocation(line: 198, column: 13, scope: !314)
!322 = !DILocation(line: 198, column: 68, scope: !314)
!323 = !DILocation(line: 200, column: 31, scope: !324)
!324 = distinct !DILexicalBlock(scope: !314, file: !25, line: 200, column: 17)
!325 = !DILocation(line: 202, column: 19, scope: !326)
!326 = distinct !DILexicalBlock(scope: !324, file: !25, line: 200, column: 36)
!327 = !DILocation(line: 202, column: 50, scope: !326)
!328 = !DILocation(line: 202, column: 43, scope: !326)
!329 = !DILocation(line: 201, column: 28, scope: !326)
!330 = !DILocation(line: 201, column: 32, scope: !326)
!331 = !DILocation(line: 201, column: 41, scope: !326)
!332 = !DILocation(line: 201, column: 63, scope: !326)
!333 = !DILocation(line: 201, column: 36, scope: !326)
!334 = !DILocation(line: 201, column: 15, scope: !326)
!335 = !DILocation(line: 201, column: 74, scope: !326)
!336 = !DILocation(line: 203, column: 13, scope: !326)
!337 = !DILocation(line: 197, column: 45, scope: !312)
!338 = !DILocation(line: 197, column: 11, scope: !312)
!339 = distinct !{!339, !305, !340, !152}
!340 = !DILocation(line: 204, column: 11, scope: !306)
!341 = !DILocation(line: 196, column: 42, scope: !303)
!342 = !DILocation(line: 196, column: 9, scope: !303)
!343 = distinct !{!343, !304, !344, !152}
!344 = !DILocation(line: 205, column: 9, scope: !298)
!345 = !DILocation(line: 208, column: 21, scope: !241)
!346 = !DILocation(line: 209, column: 25, scope: !347)
!347 = distinct !DILexicalBlock(scope: !241, file: !25, line: 209, column: 11)
!348 = !DILocation(line: 180, column: 42, scope: !239)
!349 = !DILocation(line: 180, column: 5, scope: !239)
!350 = distinct !{!350, !230, !351, !152}
!351 = !DILocation(line: 213, column: 5, scope: !231)
!352 = !DILocation(line: 179, column: 40, scope: !229)
!353 = !DILocation(line: 179, column: 3, scope: !229)
!354 = distinct !{!354, !214, !355, !152}
!355 = !DILocation(line: 214, column: 3, scope: !215)
!356 = !DILocation(line: 0, scope: !234)
!357 = !DILocalVariable(name: "c", scope: !234, file: !25, line: 216, type: !15)
!358 = !DILocation(line: 217, column: 10, scope: !359)
!359 = distinct !DILexicalBlock(scope: !234, file: !25, line: 216, column: 3)
!360 = !DILocation(line: 220, column: 31, scope: !361)
!361 = distinct !DILexicalBlock(scope: !359, file: !25, line: 219, column: 17)
!362 = !DILocalVariable(name: "M", arg: 1, scope: !24, file: !25, line: 117, type: !5)
!363 = !DILocation(line: 0, scope: !24, inlinedAt: !364)
!364 = distinct !DILocation(line: 220, column: 5, scope: !361)
!365 = !DILocalVariable(name: "i", scope: !366, file: !25, line: 123, type: !15)
!366 = distinct !DILexicalBlock(scope: !24, file: !25, line: 123, column: 3)
!367 = !DILocation(line: 0, scope: !366, inlinedAt: !364)
!368 = !DILocation(line: 123, column: 8, scope: !366, inlinedAt: !364)
!369 = !DILocation(line: 123, scope: !366, inlinedAt: !364)
!370 = !DILocation(line: 123, column: 24, scope: !371, inlinedAt: !364)
!371 = distinct !DILexicalBlock(scope: !366, file: !25, line: 123, column: 3)
!372 = !DILocation(line: 123, column: 3, scope: !366, inlinedAt: !364)
!373 = !DILocation(line: 129, column: 3, scope: !374, inlinedAt: !364)
!374 = distinct !DILexicalBlock(scope: !24, file: !25, line: 129, column: 3)
!375 = !DILocation(line: 124, column: 20, scope: !376, inlinedAt: !364)
!376 = distinct !DILexicalBlock(scope: !371, file: !25, line: 123, column: 38)
!377 = !DILocation(line: 124, column: 25, scope: !376, inlinedAt: !364)
!378 = !DILocation(line: 124, column: 37, scope: !376, inlinedAt: !364)
!379 = !DILocation(line: 124, column: 33, scope: !376, inlinedAt: !364)
!380 = !DILocation(line: 124, column: 31, scope: !376, inlinedAt: !364)
!381 = !DILocation(line: 124, column: 43, scope: !376, inlinedAt: !364)
!382 = !DILocalVariable(name: "t", scope: !376, file: !25, line: 124, type: !6)
!383 = !DILocation(line: 0, scope: !376, inlinedAt: !364)
!384 = !DILocation(line: 125, column: 15, scope: !376, inlinedAt: !364)
!385 = !DILocation(line: 125, column: 5, scope: !376, inlinedAt: !364)
!386 = !DILocation(line: 125, column: 10, scope: !376, inlinedAt: !364)
!387 = !DILocation(line: 126, column: 9, scope: !376, inlinedAt: !364)
!388 = !DILocation(line: 126, column: 5, scope: !376, inlinedAt: !364)
!389 = !DILocation(line: 126, column: 14, scope: !376, inlinedAt: !364)
!390 = !DILocation(line: 123, column: 32, scope: !371, inlinedAt: !364)
!391 = !DILocation(line: 123, column: 3, scope: !371, inlinedAt: !364)
!392 = distinct !{!392, !372, !393, !152}
!393 = !DILocation(line: 127, column: 3, scope: !366, inlinedAt: !364)
!394 = !DILocation(line: 129, scope: !374, inlinedAt: !364)
!395 = !DILocalVariable(name: "i", scope: !374, file: !25, line: 129, type: !15)
!396 = !DILocation(line: 0, scope: !374, inlinedAt: !364)
!397 = !DILocation(line: 129, column: 24, scope: !398, inlinedAt: !364)
!398 = distinct !DILexicalBlock(scope: !374, file: !25, line: 129, column: 3)
!399 = !DILocation(line: 138, column: 3, scope: !400, inlinedAt: !364)
!400 = distinct !DILexicalBlock(scope: !24, file: !25, line: 138, column: 3)
!401 = !DILocation(line: 130, column: 21, scope: !402, inlinedAt: !364)
!402 = distinct !DILexicalBlock(scope: !398, file: !25, line: 129, column: 38)
!403 = !DILocation(line: 130, column: 26, scope: !402, inlinedAt: !364)
!404 = !DILocation(line: 130, column: 38, scope: !402, inlinedAt: !364)
!405 = !DILocation(line: 130, column: 34, scope: !402, inlinedAt: !364)
!406 = !DILocation(line: 130, column: 32, scope: !402, inlinedAt: !364)
!407 = !DILocation(line: 130, column: 44, scope: !402, inlinedAt: !364)
!408 = !DILocalVariable(name: "t0", scope: !402, file: !25, line: 130, type: !6)
!409 = !DILocation(line: 0, scope: !402, inlinedAt: !364)
!410 = !DILocation(line: 131, column: 25, scope: !402, inlinedAt: !364)
!411 = !DILocation(line: 131, column: 21, scope: !402, inlinedAt: !364)
!412 = !DILocation(line: 131, column: 30, scope: !402, inlinedAt: !364)
!413 = !DILocation(line: 131, column: 42, scope: !402, inlinedAt: !364)
!414 = !DILocation(line: 131, column: 38, scope: !402, inlinedAt: !364)
!415 = !DILocation(line: 131, column: 36, scope: !402, inlinedAt: !364)
!416 = !DILocation(line: 131, column: 48, scope: !402, inlinedAt: !364)
!417 = !DILocalVariable(name: "t1", scope: !402, file: !25, line: 131, type: !6)
!418 = !DILocation(line: 132, column: 17, scope: !402, inlinedAt: !364)
!419 = !DILocation(line: 132, column: 5, scope: !402, inlinedAt: !364)
!420 = !DILocation(line: 132, column: 10, scope: !402, inlinedAt: !364)
!421 = !DILocation(line: 133, column: 21, scope: !402, inlinedAt: !364)
!422 = !DILocation(line: 133, column: 9, scope: !402, inlinedAt: !364)
!423 = !DILocation(line: 133, column: 5, scope: !402, inlinedAt: !364)
!424 = !DILocation(line: 133, column: 14, scope: !402, inlinedAt: !364)
!425 = !DILocation(line: 134, column: 9, scope: !402, inlinedAt: !364)
!426 = !DILocation(line: 134, column: 5, scope: !402, inlinedAt: !364)
!427 = !DILocation(line: 134, column: 14, scope: !402, inlinedAt: !364)
!428 = !DILocation(line: 135, column: 9, scope: !402, inlinedAt: !364)
!429 = !DILocation(line: 135, column: 5, scope: !402, inlinedAt: !364)
!430 = !DILocation(line: 135, column: 14, scope: !402, inlinedAt: !364)
!431 = !DILocation(line: 129, column: 32, scope: !398, inlinedAt: !364)
!432 = !DILocation(line: 129, column: 3, scope: !398, inlinedAt: !364)
!433 = distinct !{!433, !373, !434, !152}
!434 = !DILocation(line: 136, column: 3, scope: !374, inlinedAt: !364)
!435 = !DILocation(line: 138, scope: !400, inlinedAt: !364)
!436 = !DILocalVariable(name: "i", scope: !400, file: !25, line: 138, type: !15)
!437 = !DILocation(line: 0, scope: !400, inlinedAt: !364)
!438 = !DILocation(line: 138, column: 24, scope: !439, inlinedAt: !364)
!439 = distinct !DILexicalBlock(scope: !400, file: !25, line: 138, column: 3)
!440 = !DILocation(line: 148, column: 3, scope: !441, inlinedAt: !364)
!441 = distinct !DILexicalBlock(scope: !24, file: !25, line: 148, column: 3)
!442 = !DILocation(line: 139, column: 21, scope: !443, inlinedAt: !364)
!443 = distinct !DILexicalBlock(scope: !439, file: !25, line: 138, column: 34)
!444 = !DILocation(line: 139, column: 26, scope: !443, inlinedAt: !364)
!445 = !DILocation(line: 139, column: 39, scope: !443, inlinedAt: !364)
!446 = !DILocation(line: 139, column: 35, scope: !443, inlinedAt: !364)
!447 = !DILocation(line: 139, column: 33, scope: !443, inlinedAt: !364)
!448 = !DILocation(line: 139, column: 45, scope: !443, inlinedAt: !364)
!449 = !DILocalVariable(name: "t0", scope: !443, file: !25, line: 139, type: !6)
!450 = !DILocation(line: 0, scope: !443, inlinedAt: !364)
!451 = !DILocation(line: 140, column: 25, scope: !443, inlinedAt: !364)
!452 = !DILocation(line: 140, column: 21, scope: !443, inlinedAt: !364)
!453 = !DILocation(line: 140, column: 30, scope: !443, inlinedAt: !364)
!454 = !DILocation(line: 140, column: 43, scope: !443, inlinedAt: !364)
!455 = !DILocation(line: 140, column: 39, scope: !443, inlinedAt: !364)
!456 = !DILocation(line: 140, column: 37, scope: !443, inlinedAt: !364)
!457 = !DILocation(line: 140, column: 50, scope: !443, inlinedAt: !364)
!458 = !DILocalVariable(name: "t1", scope: !443, file: !25, line: 140, type: !6)
!459 = !DILocation(line: 142, column: 16, scope: !443, inlinedAt: !364)
!460 = !DILocation(line: 142, column: 5, scope: !443, inlinedAt: !364)
!461 = !DILocation(line: 142, column: 10, scope: !443, inlinedAt: !364)
!462 = !DILocation(line: 143, column: 20, scope: !443, inlinedAt: !364)
!463 = !DILocation(line: 143, column: 9, scope: !443, inlinedAt: !364)
!464 = !DILocation(line: 143, column: 5, scope: !443, inlinedAt: !364)
!465 = !DILocation(line: 143, column: 14, scope: !443, inlinedAt: !364)
!466 = !DILocation(line: 144, column: 9, scope: !443, inlinedAt: !364)
!467 = !DILocation(line: 144, column: 5, scope: !443, inlinedAt: !364)
!468 = !DILocation(line: 144, column: 14, scope: !443, inlinedAt: !364)
!469 = !DILocation(line: 145, column: 9, scope: !443, inlinedAt: !364)
!470 = !DILocation(line: 145, column: 5, scope: !443, inlinedAt: !364)
!471 = !DILocation(line: 145, column: 15, scope: !443, inlinedAt: !364)
!472 = !DILocation(line: 138, column: 30, scope: !439, inlinedAt: !364)
!473 = !DILocation(line: 138, column: 3, scope: !439, inlinedAt: !364)
!474 = distinct !{!474, !399, !475, !152}
!475 = !DILocation(line: 146, column: 3, scope: !400, inlinedAt: !364)
!476 = !DILocation(line: 148, scope: !441, inlinedAt: !364)
!477 = !DILocalVariable(name: "i", scope: !441, file: !25, line: 148, type: !15)
!478 = !DILocation(line: 0, scope: !441, inlinedAt: !364)
!479 = !DILocation(line: 148, column: 24, scope: !480, inlinedAt: !364)
!480 = distinct !DILexicalBlock(scope: !441, file: !25, line: 148, column: 3)
!481 = !DILocation(line: 149, column: 20, scope: !482, inlinedAt: !364)
!482 = distinct !DILexicalBlock(scope: !480, file: !25, line: 148, column: 34)
!483 = !DILocation(line: 149, column: 25, scope: !482, inlinedAt: !364)
!484 = !DILocation(line: 149, column: 38, scope: !482, inlinedAt: !364)
!485 = !DILocation(line: 149, column: 34, scope: !482, inlinedAt: !364)
!486 = !DILocation(line: 149, column: 44, scope: !482, inlinedAt: !364)
!487 = !DILocalVariable(name: "t", scope: !482, file: !25, line: 149, type: !6)
!488 = !DILocation(line: 0, scope: !482, inlinedAt: !364)
!489 = !DILocation(line: 150, column: 15, scope: !482, inlinedAt: !364)
!490 = !DILocation(line: 150, column: 5, scope: !482, inlinedAt: !364)
!491 = !DILocation(line: 150, column: 10, scope: !482, inlinedAt: !364)
!492 = !DILocation(line: 151, column: 9, scope: !482, inlinedAt: !364)
!493 = !DILocation(line: 151, column: 5, scope: !482, inlinedAt: !364)
!494 = !DILocation(line: 151, column: 14, scope: !482, inlinedAt: !364)
!495 = !DILocation(line: 148, column: 30, scope: !480, inlinedAt: !364)
!496 = !DILocation(line: 148, column: 3, scope: !480, inlinedAt: !364)
!497 = distinct !{!497, !440, !498, !152}
!498 = !DILocation(line: 152, column: 3, scope: !441, inlinedAt: !364)
!499 = !DILocation(line: 219, column: 10, scope: !359)
!500 = !DILocation(line: 216, column: 3, scope: !359)
!501 = distinct !{!501, !233, !502, !152}
!502 = !DILocation(line: 221, column: 3, scope: !234)
!503 = !DILocalVariable(name: "tab", scope: !154, file: !25, line: 223, type: !119)
!504 = !DILocation(line: 223, column: 17, scope: !154)
!505 = !DILocation(line: 0, scope: !129, inlinedAt: !506)
!506 = distinct !DILocation(line: 223, column: 17, scope: !154)
!507 = !DILocation(line: 0, scope: !139, inlinedAt: !506)
!508 = !DILocation(line: 7, column: 10, scope: !139, inlinedAt: !506)
!509 = !DILocation(line: 7, scope: !139, inlinedAt: !506)
!510 = !DILocation(line: 7, column: 28, scope: !144, inlinedAt: !506)
!511 = !DILocation(line: 7, column: 5, scope: !139, inlinedAt: !506)
!512 = !DILocation(line: 8, column: 9, scope: !144, inlinedAt: !506)
!513 = !DILocation(line: 8, column: 14, scope: !144, inlinedAt: !506)
!514 = !DILocation(line: 7, column: 36, scope: !144, inlinedAt: !506)
!515 = !DILocation(line: 7, column: 5, scope: !144, inlinedAt: !506)
!516 = distinct !{!516, !511, !517, !152}
!517 = !DILocation(line: 8, column: 16, scope: !139, inlinedAt: !506)
!518 = !DILocalVariable(name: "i", scope: !519, file: !25, line: 224, type: !15)
!519 = distinct !DILexicalBlock(scope: !154, file: !25, line: 224, column: 3)
!520 = !DILocation(line: 0, scope: !519)
!521 = !DILocation(line: 224, column: 8, scope: !519)
!522 = !DILocation(line: 224, scope: !519)
!523 = !DILocation(line: 224, column: 24, scope: !524)
!524 = distinct !DILexicalBlock(scope: !519, file: !25, line: 224, column: 3)
!525 = !DILocation(line: 224, column: 3, scope: !519)
!526 = !DILocation(line: 233, column: 3, scope: !527)
!527 = distinct !DILexicalBlock(scope: !154, file: !25, line: 233, column: 3)
!528 = !DILocation(line: 225, column: 24, scope: !529)
!529 = distinct !DILexicalBlock(scope: !524, file: !25, line: 224, column: 43)
!530 = !DILocalVariable(name: "a", arg: 1, scope: !531, file: !532, line: 10, type: !14)
!531 = distinct !DISubprogram(name: "mul_f", scope: !532, file: !532, line: 10, type: !533, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!532 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!533 = !DISubroutineType(types: !534)
!534 = !{!14, !14, !14}
!535 = !DILocation(line: 0, scope: !531, inlinedAt: !536)
!536 = distinct !DILocation(line: 225, column: 18, scope: !529)
!537 = !DILocalVariable(name: "b", arg: 2, scope: !531, file: !532, line: 10, type: !14)
!538 = !DILocation(line: 15, column: 10, scope: !531, inlinedAt: !536)
!539 = !DILocation(line: 15, column: 7, scope: !531, inlinedAt: !536)
!540 = !DILocation(line: 18, column: 17, scope: !531, inlinedAt: !536)
!541 = !DILocalVariable(name: "p", scope: !531, file: !532, line: 12, type: !14)
!542 = !DILocation(line: 19, column: 13, scope: !531, inlinedAt: !536)
!543 = !DILocation(line: 19, column: 7, scope: !531, inlinedAt: !536)
!544 = !DILocation(line: 20, column: 13, scope: !531, inlinedAt: !536)
!545 = !DILocation(line: 20, column: 7, scope: !531, inlinedAt: !536)
!546 = !DILocation(line: 21, column: 13, scope: !531, inlinedAt: !536)
!547 = !DILocation(line: 21, column: 7, scope: !531, inlinedAt: !536)
!548 = !DILocalVariable(name: "top_p", scope: !531, file: !532, line: 24, type: !14)
!549 = !DILocation(line: 25, column: 37, scope: !531, inlinedAt: !536)
!550 = !DILocation(line: 25, column: 52, scope: !531, inlinedAt: !536)
!551 = !DILocation(line: 25, column: 43, scope: !531, inlinedAt: !536)
!552 = !DILocation(line: 25, column: 59, scope: !531, inlinedAt: !536)
!553 = !DILocalVariable(name: "out", scope: !531, file: !532, line: 25, type: !14)
!554 = !DILocation(line: 225, column: 11, scope: !529)
!555 = !DILocation(line: 225, column: 5, scope: !529)
!556 = !DILocation(line: 225, column: 16, scope: !529)
!557 = !DILocation(line: 0, scope: !531, inlinedAt: !558)
!558 = distinct !DILocation(line: 226, column: 22, scope: !529)
!559 = !DILocation(line: 15, column: 10, scope: !531, inlinedAt: !558)
!560 = !DILocation(line: 15, column: 7, scope: !531, inlinedAt: !558)
!561 = !DILocation(line: 18, column: 17, scope: !531, inlinedAt: !558)
!562 = !DILocation(line: 19, column: 13, scope: !531, inlinedAt: !558)
!563 = !DILocation(line: 19, column: 17, scope: !531, inlinedAt: !558)
!564 = !DILocation(line: 19, column: 7, scope: !531, inlinedAt: !558)
!565 = !DILocation(line: 20, column: 13, scope: !531, inlinedAt: !558)
!566 = !DILocation(line: 20, column: 17, scope: !531, inlinedAt: !558)
!567 = !DILocation(line: 20, column: 7, scope: !531, inlinedAt: !558)
!568 = !DILocation(line: 21, column: 13, scope: !531, inlinedAt: !558)
!569 = !DILocation(line: 21, column: 17, scope: !531, inlinedAt: !558)
!570 = !DILocation(line: 21, column: 7, scope: !531, inlinedAt: !558)
!571 = !DILocation(line: 25, column: 37, scope: !531, inlinedAt: !558)
!572 = !DILocation(line: 25, column: 52, scope: !531, inlinedAt: !558)
!573 = !DILocation(line: 25, column: 43, scope: !531, inlinedAt: !558)
!574 = !DILocation(line: 25, column: 59, scope: !531, inlinedAt: !558)
!575 = !DILocation(line: 226, column: 11, scope: !529)
!576 = !DILocation(line: 226, column: 15, scope: !529)
!577 = !DILocation(line: 226, column: 5, scope: !529)
!578 = !DILocation(line: 226, column: 20, scope: !529)
!579 = !DILocation(line: 227, column: 28, scope: !529)
!580 = !DILocation(line: 0, scope: !531, inlinedAt: !581)
!581 = distinct !DILocation(line: 227, column: 22, scope: !529)
!582 = !DILocation(line: 15, column: 10, scope: !531, inlinedAt: !581)
!583 = !DILocation(line: 15, column: 7, scope: !531, inlinedAt: !581)
!584 = !DILocation(line: 18, column: 17, scope: !531, inlinedAt: !581)
!585 = !DILocation(line: 19, column: 13, scope: !531, inlinedAt: !581)
!586 = !DILocation(line: 19, column: 17, scope: !531, inlinedAt: !581)
!587 = !DILocation(line: 19, column: 7, scope: !531, inlinedAt: !581)
!588 = !DILocation(line: 20, column: 13, scope: !531, inlinedAt: !581)
!589 = !DILocation(line: 20, column: 17, scope: !531, inlinedAt: !581)
!590 = !DILocation(line: 20, column: 7, scope: !531, inlinedAt: !581)
!591 = !DILocation(line: 21, column: 13, scope: !531, inlinedAt: !581)
!592 = !DILocation(line: 21, column: 17, scope: !531, inlinedAt: !581)
!593 = !DILocation(line: 21, column: 7, scope: !531, inlinedAt: !581)
!594 = !DILocation(line: 25, column: 37, scope: !531, inlinedAt: !581)
!595 = !DILocation(line: 25, column: 52, scope: !531, inlinedAt: !581)
!596 = !DILocation(line: 25, column: 43, scope: !531, inlinedAt: !581)
!597 = !DILocation(line: 25, column: 59, scope: !531, inlinedAt: !581)
!598 = !DILocation(line: 227, column: 11, scope: !529)
!599 = !DILocation(line: 227, column: 15, scope: !529)
!600 = !DILocation(line: 227, column: 5, scope: !529)
!601 = !DILocation(line: 227, column: 20, scope: !529)
!602 = !DILocation(line: 228, column: 28, scope: !529)
!603 = !DILocation(line: 0, scope: !531, inlinedAt: !604)
!604 = distinct !DILocation(line: 228, column: 22, scope: !529)
!605 = !DILocation(line: 15, column: 10, scope: !531, inlinedAt: !604)
!606 = !DILocation(line: 15, column: 7, scope: !531, inlinedAt: !604)
!607 = !DILocation(line: 18, column: 17, scope: !531, inlinedAt: !604)
!608 = !DILocation(line: 19, column: 13, scope: !531, inlinedAt: !604)
!609 = !DILocation(line: 19, column: 17, scope: !531, inlinedAt: !604)
!610 = !DILocation(line: 19, column: 7, scope: !531, inlinedAt: !604)
!611 = !DILocation(line: 20, column: 13, scope: !531, inlinedAt: !604)
!612 = !DILocation(line: 20, column: 17, scope: !531, inlinedAt: !604)
!613 = !DILocation(line: 20, column: 7, scope: !531, inlinedAt: !604)
!614 = !DILocation(line: 21, column: 13, scope: !531, inlinedAt: !604)
!615 = !DILocation(line: 21, column: 17, scope: !531, inlinedAt: !604)
!616 = !DILocation(line: 21, column: 7, scope: !531, inlinedAt: !604)
!617 = !DILocation(line: 25, column: 37, scope: !531, inlinedAt: !604)
!618 = !DILocation(line: 25, column: 52, scope: !531, inlinedAt: !604)
!619 = !DILocation(line: 25, column: 43, scope: !531, inlinedAt: !604)
!620 = !DILocation(line: 25, column: 59, scope: !531, inlinedAt: !604)
!621 = !DILocation(line: 228, column: 11, scope: !529)
!622 = !DILocation(line: 228, column: 15, scope: !529)
!623 = !DILocation(line: 228, column: 5, scope: !529)
!624 = !DILocation(line: 228, column: 20, scope: !529)
!625 = !DILocation(line: 224, column: 39, scope: !524)
!626 = !DILocation(line: 224, column: 3, scope: !524)
!627 = distinct !{!627, !525, !628, !152}
!628 = !DILocation(line: 229, column: 3, scope: !519)
!629 = !DILocation(line: 233, scope: !527)
!630 = !DILocalVariable(name: "c", scope: !527, file: !25, line: 233, type: !15)
!631 = !DILocation(line: 0, scope: !527)
!632 = !DILocation(line: 233, column: 24, scope: !633)
!633 = distinct !DILexicalBlock(scope: !527, file: !25, line: 233, column: 3)
!634 = !DILocation(line: 234, column: 5, scope: !635)
!635 = distinct !DILexicalBlock(scope: !636, file: !25, line: 234, column: 5)
!636 = distinct !DILexicalBlock(scope: !633, file: !25, line: 233, column: 44)
!637 = !DILocation(line: 256, column: 3, scope: !638)
!638 = distinct !DILexicalBlock(scope: !154, file: !25, line: 256, column: 3)
!639 = !DILocation(line: 0, scope: !635)
!640 = !DILocalVariable(name: "r", scope: !635, file: !25, line: 234, type: !45)
!641 = !DILocation(line: 234, column: 32, scope: !642)
!642 = distinct !DILexicalBlock(scope: !635, file: !25, line: 234, column: 5)
!643 = !DILocation(line: 236, column: 23, scope: !644)
!644 = distinct !DILexicalBlock(scope: !642, file: !25, line: 235, column: 15)
!645 = !DILocation(line: 236, column: 29, scope: !644)
!646 = !DILocation(line: 236, column: 39, scope: !644)
!647 = !DILocation(line: 236, column: 48, scope: !644)
!648 = !DILocation(line: 236, column: 43, scope: !644)
!649 = !DILocalVariable(name: "pos", scope: !644, file: !25, line: 236, type: !15)
!650 = !DILocation(line: 0, scope: !644)
!651 = !DILocation(line: 237, column: 21, scope: !644)
!652 = !DILocation(line: 237, column: 28, scope: !644)
!653 = !DILocalVariable(name: "t0", scope: !644, file: !25, line: 237, type: !6)
!654 = !DILocation(line: 238, column: 29, scope: !644)
!655 = !DILocation(line: 238, column: 35, scope: !644)
!656 = !DILocalVariable(name: "t1", scope: !644, file: !25, line: 238, type: !6)
!657 = !DILocation(line: 239, column: 29, scope: !644)
!658 = !DILocation(line: 239, column: 35, scope: !644)
!659 = !DILocalVariable(name: "t2", scope: !644, file: !25, line: 239, type: !6)
!660 = !DILocation(line: 240, column: 22, scope: !644)
!661 = !DILocation(line: 240, column: 29, scope: !644)
!662 = !DILocation(line: 240, column: 35, scope: !644)
!663 = !DILocalVariable(name: "t3", scope: !644, file: !25, line: 240, type: !6)
!664 = !DILocalVariable(name: "t", scope: !665, file: !25, line: 241, type: !15)
!665 = distinct !DILexicalBlock(scope: !644, file: !25, line: 241, column: 7)
!666 = !DILocation(line: 0, scope: !665)
!667 = !DILocation(line: 241, column: 12, scope: !665)
!668 = !DILocation(line: 241, scope: !665)
!669 = !DILocation(line: 241, column: 28, scope: !670)
!670 = distinct !DILexicalBlock(scope: !665, file: !25, line: 241, column: 7)
!671 = !DILocation(line: 241, column: 7, scope: !665)
!672 = !DILocation(line: 244, column: 24, scope: !673)
!673 = distinct !DILexicalBlock(scope: !670, file: !25, line: 241, column: 47)
!674 = !DILocation(line: 244, column: 18, scope: !673)
!675 = !DILocation(line: 244, column: 16, scope: !673)
!676 = !DILocation(line: 244, column: 46, scope: !673)
!677 = !DILocation(line: 244, column: 50, scope: !673)
!678 = !DILocation(line: 244, column: 40, scope: !673)
!679 = !DILocation(line: 244, column: 38, scope: !673)
!680 = !DILocation(line: 244, column: 33, scope: !673)
!681 = !DILocation(line: 244, column: 68, scope: !673)
!682 = !DILocation(line: 244, column: 72, scope: !673)
!683 = !DILocation(line: 244, column: 62, scope: !673)
!684 = !DILocation(line: 244, column: 60, scope: !673)
!685 = !DILocation(line: 244, column: 55, scope: !673)
!686 = !DILocation(line: 245, column: 24, scope: !673)
!687 = !DILocation(line: 245, column: 28, scope: !673)
!688 = !DILocation(line: 245, column: 18, scope: !673)
!689 = !DILocation(line: 245, column: 16, scope: !673)
!690 = !DILocation(line: 244, column: 77, scope: !673)
!691 = !DILocation(line: 242, column: 15, scope: !673)
!692 = !DILocation(line: 242, column: 19, scope: !673)
!693 = !DILocation(line: 242, column: 33, scope: !673)
!694 = !DILocation(line: 242, column: 39, scope: !673)
!695 = !DILocation(line: 242, column: 49, scope: !673)
!696 = !DILocation(line: 243, column: 15, scope: !673)
!697 = !DILocation(line: 243, column: 19, scope: !673)
!698 = !DILocation(line: 243, column: 33, scope: !673)
!699 = !DILocation(line: 242, column: 53, scope: !673)
!700 = !DILocation(line: 242, column: 9, scope: !673)
!701 = !DILocation(line: 243, column: 40, scope: !673)
!702 = !DILocation(line: 241, column: 43, scope: !670)
!703 = !DILocation(line: 241, column: 7, scope: !670)
!704 = distinct !{!704, !671, !705, !152}
!705 = !DILocation(line: 246, column: 7, scope: !665)
!706 = !DILocation(line: 235, column: 11, scope: !642)
!707 = !DILocation(line: 234, column: 5, scope: !642)
!708 = distinct !{!708, !634, !709, !152}
!709 = !DILocation(line: 247, column: 5, scope: !635)
!710 = !DILocation(line: 233, column: 37, scope: !633)
!711 = !DILocation(line: 233, column: 3, scope: !633)
!712 = distinct !{!712, !526, !713, !152}
!713 = !DILocation(line: 248, column: 3, scope: !527)
!714 = !DILocation(line: 256, scope: !638)
!715 = !DILocalVariable(name: "r", scope: !638, file: !25, line: 256, type: !45)
!716 = !DILocation(line: 0, scope: !638)
!717 = !DILocation(line: 256, column: 21, scope: !718)
!718 = distinct !DILexicalBlock(scope: !638, file: !25, line: 256, column: 3)
!719 = !DILocation(line: 257, column: 5, scope: !720)
!720 = distinct !DILexicalBlock(scope: !721, file: !25, line: 257, column: 5)
!721 = distinct !DILexicalBlock(scope: !718, file: !25, line: 256, column: 44)
!722 = !DILocation(line: 257, scope: !720)
!723 = !DILocalVariable(name: "c", scope: !720, file: !25, line: 257, type: !45)
!724 = !DILocation(line: 0, scope: !720)
!725 = !DILocation(line: 257, column: 23, scope: !726)
!726 = distinct !DILexicalBlock(scope: !720, file: !25, line: 257, column: 5)
!727 = !DILocation(line: 258, column: 7, scope: !728)
!728 = distinct !DILexicalBlock(scope: !729, file: !25, line: 258, column: 7)
!729 = distinct !DILexicalBlock(scope: !726, file: !25, line: 257, column: 55)
!730 = !DILocation(line: 258, scope: !728)
!731 = !DILocalVariable(name: "i", scope: !728, file: !25, line: 258, type: !45)
!732 = !DILocation(line: 0, scope: !728)
!733 = !DILocation(line: 258, column: 29, scope: !734)
!734 = distinct !DILexicalBlock(scope: !728, file: !25, line: 258, column: 7)
!735 = !DILocation(line: 259, column: 48, scope: !736)
!736 = distinct !DILexicalBlock(scope: !734, file: !25, line: 258, column: 48)
!737 = !DILocation(line: 259, column: 53, scope: !736)
!738 = !DILocation(line: 259, column: 57, scope: !736)
!739 = !DILocation(line: 259, column: 34, scope: !736)
!740 = !DILocation(line: 260, column: 45, scope: !736)
!741 = !DILocation(line: 260, column: 40, scope: !736)
!742 = !DILocation(line: 260, column: 22, scope: !736)
!743 = !DILocation(line: 260, column: 50, scope: !736)
!744 = !DILocation(line: 261, column: 16, scope: !736)
!745 = !DILocalVariable(name: "m", arg: 1, scope: !746, file: !25, line: 21, type: !49)
!746 = distinct !DISubprogram(name: "decode", scope: !25, file: !25, line: 21, type: !747, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!747 = !DISubroutineType(types: !748)
!748 = !{null, !49, !18, !45}
!749 = !DILocation(line: 0, scope: !746, inlinedAt: !750)
!750 = distinct !DILocation(line: 259, column: 9, scope: !736)
!751 = !DILocalVariable(name: "mdec", arg: 2, scope: !746, file: !25, line: 21, type: !18)
!752 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !746, file: !25, line: 21, type: !45)
!753 = !DILocalVariable(name: "i", scope: !746, file: !25, line: 22, type: !45)
!754 = !DILocation(line: 23, column: 8, scope: !755, inlinedAt: !750)
!755 = distinct !DILexicalBlock(scope: !746, file: !25, line: 23, column: 3)
!756 = !DILocation(line: 23, scope: !755, inlinedAt: !750)
!757 = !DILocation(line: 23, column: 27, scope: !758, inlinedAt: !750)
!758 = distinct !DILexicalBlock(scope: !755, file: !25, line: 23, column: 3)
!759 = !DILocation(line: 23, column: 17, scope: !758, inlinedAt: !750)
!760 = !DILocation(line: 23, column: 3, scope: !755, inlinedAt: !750)
!761 = !DILocation(line: 24, column: 15, scope: !762, inlinedAt: !750)
!762 = distinct !DILexicalBlock(scope: !758, file: !25, line: 23, column: 37)
!763 = !DILocation(line: 24, column: 20, scope: !762, inlinedAt: !750)
!764 = !DILocation(line: 24, column: 10, scope: !762, inlinedAt: !750)
!765 = !DILocation(line: 24, column: 13, scope: !762, inlinedAt: !750)
!766 = !DILocation(line: 25, column: 15, scope: !762, inlinedAt: !750)
!767 = !DILocation(line: 25, column: 20, scope: !762, inlinedAt: !750)
!768 = !DILocation(line: 25, column: 13, scope: !762, inlinedAt: !750)
!769 = !DILocation(line: 25, column: 10, scope: !762, inlinedAt: !750)
!770 = !DILocation(line: 23, column: 32, scope: !758, inlinedAt: !750)
!771 = !DILocation(line: 23, column: 3, scope: !758, inlinedAt: !750)
!772 = distinct !{!772, !760, !773, !152}
!773 = !DILocation(line: 26, column: 3, scope: !755, inlinedAt: !750)
!774 = !DILocation(line: 258, column: 44, scope: !734)
!775 = !DILocation(line: 258, column: 7, scope: !734)
!776 = distinct !{!776, !727, !777, !152}
!777 = !DILocation(line: 262, column: 7, scope: !728)
!778 = !DILocation(line: 257, column: 48, scope: !726)
!779 = !DILocation(line: 257, column: 5, scope: !726)
!780 = distinct !{!780, !719, !781, !152}
!781 = !DILocation(line: 263, column: 5, scope: !720)
!782 = !DILocation(line: 256, column: 37, scope: !718)
!783 = !DILocation(line: 256, column: 3, scope: !718)
!784 = distinct !{!784, !637, !785, !152}
!785 = !DILocation(line: 264, column: 3, scope: !638)
!786 = !DILocation(line: 266, column: 1, scope: !154)
!787 = !{!"p_buf"}
!788 = !{!"Mtmp"}
!789 = !{!"A"}
!790 = distinct !DISubprogram(name: "mayo_memcpy", scope: !130, file: !130, line: 11, type: !791, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !28)
!791 = !DISubroutineType(types: !792)
!792 = !{null, !70, !793, !19}
!793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !794, size: 32)
!794 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!795 = !DILocalVariable(name: "dst", arg: 1, scope: !790, file: !130, line: 11, type: !70)
!796 = !DILocation(line: 0, scope: !790)
!797 = !DILocalVariable(name: "src", arg: 2, scope: !790, file: !130, line: 11, type: !793)
!798 = !DILocalVariable(name: "len", arg: 3, scope: !790, file: !130, line: 11, type: !19)
!799 = !DILocalVariable(name: "d", scope: !790, file: !130, line: 13, type: !11)
!800 = !DILocalVariable(name: "s", scope: !790, file: !130, line: 14, type: !801)
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !802, size: 32)
!802 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!803 = !DILocalVariable(name: "i", scope: !804, file: !130, line: 16, type: !19)
!804 = distinct !DILexicalBlock(scope: !790, file: !130, line: 16, column: 5)
!805 = !DILocation(line: 0, scope: !804)
!806 = !DILocation(line: 16, column: 10, scope: !804)
!807 = !DILocation(line: 16, scope: !804)
!808 = !DILocation(line: 16, column: 28, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !130, line: 16, column: 5)
!810 = !DILocation(line: 16, column: 5, scope: !804)
!811 = !DILocation(line: 17, column: 16, scope: !809)
!812 = !DILocation(line: 17, column: 9, scope: !809)
!813 = !DILocation(line: 17, column: 14, scope: !809)
!814 = !DILocation(line: 16, column: 36, scope: !809)
!815 = !DILocation(line: 16, column: 5, scope: !809)
!816 = distinct !{!816, !810, !817, !152}
!817 = !DILocation(line: 17, column: 19, scope: !804)
!818 = !DILocation(line: 18, column: 1, scope: !790)
