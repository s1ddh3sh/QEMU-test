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
define dso_local fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %vPv, ptr noundef nonnull %t, ptr noundef nonnull %y) unnamed_addr #0 !dbg !154 {
entry:
  %temp = alloca [5 x i64], align 8
    #dbg_value(ptr %p, !188, !DIExpression(), !189)
    #dbg_value(ptr %vPv, !190, !DIExpression(), !189)
    #dbg_value(ptr %t, !191, !DIExpression(), !189)
    #dbg_value(ptr %y, !192, !DIExpression(), !189)
    #dbg_value(i32 52, !193, !DIExpression(), !189)
    #dbg_value(i32 5, !195, !DIExpression(), !189)
    #dbg_value(i64 1, !196, !DIExpression(), !199)
    #dbg_value(i64 72057594037927936, !196, !DIExpression(), !199)
    #dbg_value(i64 72057594037927935, !196, !DIExpression(), !199)
    #dbg_value(i32 0, !200, !DIExpression(), !202)
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !204
    #dbg_value(i32 %i.0, !200, !DIExpression(), !202)
  %exitcond = icmp ne i32 %i.0, 100, !dbg !205
  br i1 %exitcond, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %.idx7 = mul nuw nsw i32 %i.0, 40, !dbg !208
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7, !dbg !208
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !208
  %1 = load i64, ptr %arrayidx, align 8, !dbg !210
  %and = and i64 %1, 72057594037927935, !dbg !210
  store i64 %and, ptr %arrayidx, align 8, !dbg !210
  %inc = add nuw nsw i32 %i.0, 1, !dbg !211
    #dbg_value(i32 %inc, !200, !DIExpression(), !202)
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !215, !DIExpression(), !219)
    #dbg_value(ptr %temp, !220, !DIExpression(), !189)
    #dbg_value(i32 9, !221, !DIExpression(), !223)
  br label %for.cond3, !dbg !224

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 9, %for.end ], [ %dec78, %for.inc77 ], !dbg !225
    #dbg_value(i32 %i2.0, !221, !DIExpression(), !223)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !226
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !dbg !228

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !229

for.cond81.preheader:                             ; preds = %for.cond3
  br label %for.cond81, !dbg !232

for.cond6:                                        ; preds = %for.inc74, %for.cond6.preheader
  %j.0 = phi i32 [ %inc75, %for.inc74 ], [ %i2.0, %for.cond6.preheader ], !dbg !234
    #dbg_value(i32 %j.0, !235, !DIExpression(), !236)
  %exitcond10 = icmp ne i32 %j.0, 10, !dbg !237
  br i1 %exitcond10, label %for.body8, label %for.inc77, !dbg !229

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !239
  %2 = load i64, ptr %arrayidx9, align 8, !dbg !239
  %shr = lshr i64 %2, 52, !dbg !241
  %rem.lhs.trunc = trunc i64 %shr to i8, !dbg !242
    #dbg_value(i8 %rem1, !243, !DIExpression(), !244)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !245
  %shl11 = shl i64 %2, 4, !dbg !246
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !246
    #dbg_value(i32 3, !247, !DIExpression(), !249)
  br label %for.cond12, !dbg !250

for.cond12:                                       ; preds = %for.body15, %for.body8
  %k.0 = phi i32 [ 3, %for.body8 ], [ %dec, %for.body15 ], !dbg !251
    #dbg_value(i32 %k.0, !247, !DIExpression(), !249)
  %cmp13 = icmp sgt i32 %k.0, -1, !dbg !252
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !dbg !254

for.cond24.preheader:                             ; preds = %for.cond12
  %rem1 = and i8 %rem.lhs.trunc, 15, !dbg !242
  br label %for.cond24, !dbg !255

for.body15:                                       ; preds = %for.cond12
  %arrayidx16 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !257
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !257
  %shr17 = lshr i64 %3, 60, !dbg !259
  %add18 = add nuw nsw i32 %k.0, 1, !dbg !260
  %arrayidx19 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %add18, !dbg !261
  %4 = load i64, ptr %arrayidx19, align 8, !dbg !262
  %xor = xor i64 %4, %shr17, !dbg !262
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !262
  %arrayidx20 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !263
  %5 = load i64, ptr %arrayidx20, align 8, !dbg !264
  %shl21 = shl i64 %5, 4, !dbg !264
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !264
  %dec = add nsw i32 %k.0, -1, !dbg !265
    #dbg_value(i32 %dec, !247, !DIExpression(), !249)
  br label %for.cond12, !dbg !266, !llvm.loop !267

for.cond24:                                       ; preds = %for.inc46, %for.cond24.preheader
  %jj.0 = phi i32 [ %inc47, %for.inc46 ], [ 0, %for.cond24.preheader ], !dbg !269
    #dbg_value(i32 %jj.0, !270, !DIExpression(), !271)
  %exitcond8 = icmp ne i32 %jj.0, 4, !dbg !272
  br i1 %exitcond8, label %for.body27, label %for.cond50.preheader, !dbg !255

for.cond50.preheader:                             ; preds = %for.cond24
  br label %for.cond50, !dbg !274

for.body27:                                       ; preds = %for.cond24
  %rem28 = and i32 %jj.0, 1, !dbg !276
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !279
  br i1 %cmp29, label %if.then, label %if.else, !dbg !279

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !280
  %6 = load i8, ptr %arrayidx31, align 1, !dbg !280
    #dbg_value(i8 %rem1, !282, !DIExpression(), !287)
    #dbg_value(i8 %6, !289, !DIExpression(), !287)
  %7 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !290
  %xor1.i = xor i8 %rem1, %7, !dbg !291
    #dbg_value(i8 %xor1.i, !282, !DIExpression(), !287)
  %8 = trunc i8 %xor1.i to i1, !dbg !292
    #dbg_value(i8 poison, !293, !DIExpression(), !287)
  %9 = and i8 %xor1.i, 2, !dbg !294
  %mul9.i = mul i8 %9, %6, !dbg !295
  %conv10.i = select i1 %8, i8 %6, i8 0, !dbg !292
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !296
    #dbg_value(i8 %xor11.i, !293, !DIExpression(), !287)
  %10 = and i8 %xor1.i, 4, !dbg !297
  %mul16.i = mul i8 %10, %6, !dbg !298
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !299
    #dbg_value(i8 %xor18.i, !293, !DIExpression(), !287)
  %11 = and i8 %xor1.i, 8, !dbg !300
  %mul23.i = mul i8 %11, %6, !dbg !301
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !302
    #dbg_value(i8 %xor25.i, !293, !DIExpression(), !287)
    #dbg_value(i8 %xor25.i, !303, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !287)
  %12 = lshr i8 %xor25.i, 4, !dbg !304
  %13 = lshr i8 %xor25.i, 3, !dbg !305
  %14 = and i8 %13, 14, !dbg !305
  %15 = xor i8 %12, %14, !dbg !306
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !307
  %16 = xor i8 %15, %xor25.masked.i, !dbg !307
    #dbg_value(i8 %16, !308, !DIExpression(), !287)
  %div = lshr exact i32 %jj.0, 1, !dbg !309
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !310
  %17 = load i8, ptr %arrayidx33, align 1, !dbg !311
  %xor356 = xor i8 %17, %16, !dbg !311
  store i8 %xor356, ptr %arrayidx33, align 1, !dbg !311
  br label %for.inc46, !dbg !312

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !313
  %18 = load i8, ptr %arrayidx37, align 1, !dbg !313
    #dbg_value(i8 %rem1, !282, !DIExpression(), !315)
    #dbg_value(i8 %18, !289, !DIExpression(), !315)
  %19 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !317
  %xor1.i1 = xor i8 %rem1, %19, !dbg !318
    #dbg_value(i8 %xor1.i1, !282, !DIExpression(), !315)
  %20 = trunc i8 %xor1.i1 to i1, !dbg !319
    #dbg_value(i8 poison, !293, !DIExpression(), !315)
  %21 = and i8 %xor1.i1, 2, !dbg !320
  %mul9.i2 = mul i8 %21, %18, !dbg !321
  %conv10.i3 = select i1 %20, i8 %18, i8 0, !dbg !319
  %xor11.i4 = xor i8 %conv10.i3, %mul9.i2, !dbg !322
    #dbg_value(i8 %xor11.i4, !293, !DIExpression(), !315)
  %22 = and i8 %xor1.i1, 4, !dbg !323
  %mul16.i5 = mul i8 %22, %18, !dbg !324
  %xor18.i6 = xor i8 %mul16.i5, %xor11.i4, !dbg !325
    #dbg_value(i8 %xor18.i6, !293, !DIExpression(), !315)
  %23 = and i8 %xor1.i1, 8, !dbg !326
  %mul23.i7 = mul i8 %23, %18, !dbg !327
  %xor25.i8 = xor i8 %mul23.i7, %xor18.i6, !dbg !328
    #dbg_value(i8 %xor25.i8, !293, !DIExpression(), !315)
    #dbg_value(i8 %xor25.i8, !303, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !315)
  %24 = lshr i8 %xor25.i8, 4, !dbg !329
  %25 = lshr i8 %xor25.i8, 3, !dbg !330
  %26 = and i8 %25, 14, !dbg !330
  %27 = xor i8 %24, %26, !dbg !331
  %xor25.masked.i9 = and i8 %xor25.i8, 15, !dbg !332
  %28 = xor i8 %27, %xor25.masked.i9, !dbg !332
    #dbg_value(i8 %28, !308, !DIExpression(), !315)
  %shl40 = shl nuw i8 %28, 4, !dbg !333
  %div415 = lshr i32 %jj.0, 1, !dbg !334
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div415, !dbg !335
  %29 = load i8, ptr %arrayidx42, align 1, !dbg !336
  %xor44 = xor i8 %shl40, %29, !dbg !336
  store i8 %xor44, ptr %arrayidx42, align 1, !dbg !336
  br label %for.inc46

for.inc46:                                        ; preds = %if.else, %if.then
  %inc47 = add nuw nsw i32 %jj.0, 1, !dbg !337
    #dbg_value(i32 %inc47, !270, !DIExpression(), !271)
  br label %for.cond24, !dbg !338, !llvm.loop !339

for.cond50:                                       ; preds = %for.body53, %for.cond50.preheader
  %k49.0 = phi i32 [ %inc72, %for.body53 ], [ 0, %for.cond50.preheader ], !dbg !341
    #dbg_value(i32 %k49.0, !342, !DIExpression(), !343)
  %exitcond9 = icmp ne i32 %k49.0, 5, !dbg !344
  br i1 %exitcond9, label %for.body53, label %for.inc74, !dbg !274

for.body53:                                       ; preds = %for.cond50
  %mul54 = mul nuw nsw i32 %i2.0, 10, !dbg !346
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !348
  %.idx = mul nsw i32 %add55, 40, !dbg !349
  %30 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !349
  %arrayidx58 = getelementptr i64, ptr %30, i32 %k49.0, !dbg !349
  %31 = load i64, ptr %arrayidx58, align 8, !dbg !349
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !350
  %mul62 = mul nuw nsw i32 %j.0, 10, !dbg !351
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !352
  %.idx4 = mul nsw i32 %add63, 40, !dbg !353
  %32 = getelementptr i8, ptr %vPv, i32 %.idx4, !dbg !353
  %arrayidx66 = getelementptr i64, ptr %32, i32 %k49.0, !dbg !353
  %33 = load i64, ptr %arrayidx66, align 8, !dbg !353
  %mul67 = select i1 %cmp59.not, i64 0, i64 %33, !dbg !354
  %xor68 = xor i64 %31, %mul67, !dbg !355
  %arrayidx69 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k49.0, !dbg !356
  %34 = load i64, ptr %arrayidx69, align 8, !dbg !357
  %xor70 = xor i64 %34, %xor68, !dbg !357
  store i64 %xor70, ptr %arrayidx69, align 8, !dbg !357
  %inc72 = add nuw nsw i32 %k49.0, 1, !dbg !358
    #dbg_value(i32 %inc72, !342, !DIExpression(), !343)
  br label %for.cond50, !dbg !359, !llvm.loop !360

for.inc74:                                        ; preds = %for.cond50
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !362
    #dbg_value(i32 %inc75, !235, !DIExpression(), !236)
  br label %for.cond6, !dbg !363, !llvm.loop !364

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !366
    #dbg_value(i32 %dec78, !221, !DIExpression(), !223)
  br label %for.cond3, !dbg !367, !llvm.loop !368

for.cond81:                                       ; preds = %for.body84, %for.cond81.preheader
  %i80.0 = phi i32 [ %add106, %for.body84 ], [ 0, %for.cond81.preheader ], !dbg !370
    #dbg_value(i32 %i80.0, !371, !DIExpression(), !372)
  %cmp82 = icmp samesign ult i32 %i80.0, 78, !dbg !373
  br i1 %cmp82, label %for.body84, label %for.end107, !dbg !232

for.body84:                                       ; preds = %for.cond81
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !375
  %35 = load i8, ptr %arrayidx85, align 1, !dbg !375
  %div87 = lshr exact i32 %i80.0, 1, !dbg !377
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !378
  %36 = load i8, ptr %arrayidx88, align 1, !dbg !378
  %37 = and i8 %36, 15, !dbg !379
  %xor912 = xor i8 %35, %37, !dbg !380
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !381
  store i8 %xor912, ptr %arrayidx93, align 1, !dbg !382
  %add94 = or disjoint i32 %i80.0, 1, !dbg !383
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !384
  %38 = load i8, ptr %arrayidx95, align 1, !dbg !384
  %div97 = lshr exact i32 %i80.0, 1, !dbg !385
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97, !dbg !386
  %39 = load i8, ptr %arrayidx98, align 1, !dbg !386
  %40 = lshr i8 %39, 4, !dbg !387
  %xor1013 = xor i8 %38, %40, !dbg !388
  %add103 = or disjoint i32 %i80.0, 1, !dbg !389
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !390
  store i8 %xor1013, ptr %arrayidx104, align 1, !dbg !391
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !392
    #dbg_value(i32 %add106, !371, !DIExpression(), !372)
  br label %for.cond81, !dbg !393, !llvm.loop !394

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !396
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !397
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %SPS = alloca [500 x i64], align 16, !llvmbmc.var !398
  call void @mayo_memset(ptr %SPS, i8 0, i32 4000)
  %byte0 = getelementptr inbounds i8, ptr %SPS, i32 0
  store i8 -79, ptr %byte0, align 1
  %byte1 = getelementptr inbounds i8, ptr %SPS, i32 1
  store i8 96, ptr %byte1, align 1
  %byte2 = getelementptr inbounds i8, ptr %SPS, i32 2
  store i8 109, ptr %byte2, align 1
  %byte3 = getelementptr inbounds i8, ptr %SPS, i32 3
  store i8 -57, ptr %byte3, align 1
  %byte4 = getelementptr inbounds i8, ptr %SPS, i32 4
  store i8 95, ptr %byte4, align 1
  %byte6 = getelementptr inbounds i8, ptr %SPS, i32 6
  store i8 -45, ptr %byte6, align 1
  %byte7 = getelementptr inbounds i8, ptr %SPS, i32 7
  store i8 -53, ptr %byte7, align 1
  %zero = alloca [78 x i8], align 16, !llvmbmc.var !399
  call void @mayo_memset(ptr %zero, i8 0, i32 78)
  %y = alloca [156 x i8], align 16, !llvmbmc.var !400
  call void @mayo_memset(ptr %y, i8 0, i32 156)
  %byte01 = getelementptr inbounds i8, ptr %y, i32 0
  store i8 3, ptr %byte01, align 1
  call fastcc void @compute_rhs(ptr %p_buf, ptr %SPS, ptr %zero, ptr %y)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !401 {
entry:
    #dbg_value(ptr %dst, !406, !DIExpression(), !407)
    #dbg_value(ptr %src, !408, !DIExpression(), !407)
    #dbg_value(i32 %len, !409, !DIExpression(), !407)
    #dbg_value(ptr %dst, !410, !DIExpression(), !407)
    #dbg_value(ptr %src, !411, !DIExpression(), !407)
    #dbg_value(i32 0, !414, !DIExpression(), !416)
  br label %for.cond, !dbg !417

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !418
    #dbg_value(i32 %i.0, !414, !DIExpression(), !416)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !419
  br i1 %exitcond, label %for.body, label %for.end, !dbg !421

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !422
  %0 = load i8, ptr %arrayidx, align 1, !dbg !422
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !423
  store i8 %0, ptr %arrayidx1, align 1, !dbg !424
  %inc = add i32 %i.0, 1, !dbg !425
    #dbg_value(i32 %inc, !414, !DIExpression(), !416)
  br label %for.cond, !dbg !426, !llvm.loop !427

for.end:                                          ; preds = %for.cond
  ret void, !dbg !429
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
!154 = distinct !DISubprogram(name: "compute_rhs", scope: !25, file: !25, line: 46, type: !155, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157, !5, !49, !18}
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
!188 = !DILocalVariable(name: "p", arg: 1, scope: !154, file: !25, line: 46, type: !157)
!189 = !DILocation(line: 0, scope: !154)
!190 = !DILocalVariable(name: "vPv", arg: 2, scope: !154, file: !25, line: 46, type: !5)
!191 = !DILocalVariable(name: "t", arg: 3, scope: !154, file: !25, line: 47, type: !49)
!192 = !DILocalVariable(name: "y", arg: 4, scope: !154, file: !25, line: 47, type: !18)
!193 = !DILocalVariable(name: "top_pos", scope: !154, file: !25, line: 52, type: !194)
!194 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!195 = !DILocalVariable(name: "m_vec_limbs", scope: !154, file: !25, line: 53, type: !194)
!196 = !DILocalVariable(name: "mask", scope: !197, file: !25, line: 57, type: !6)
!197 = distinct !DILexicalBlock(scope: !198, file: !25, line: 56, column: 29)
!198 = distinct !DILexicalBlock(scope: !154, file: !25, line: 56, column: 7)
!199 = !DILocation(line: 0, scope: !197)
!200 = !DILocalVariable(name: "i", scope: !201, file: !25, line: 60, type: !45)
!201 = distinct !DILexicalBlock(scope: !197, file: !25, line: 60, column: 5)
!202 = !DILocation(line: 0, scope: !201)
!203 = !DILocation(line: 60, column: 10, scope: !201)
!204 = !DILocation(line: 60, scope: !201)
!205 = !DILocation(line: 60, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !25, line: 60, column: 5)
!207 = !DILocation(line: 60, column: 5, scope: !201)
!208 = !DILocation(line: 61, column: 7, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !25, line: 60, column: 55)
!210 = !DILocation(line: 61, column: 46, scope: !209)
!211 = !DILocation(line: 60, column: 51, scope: !206)
!212 = !DILocation(line: 60, column: 5, scope: !206)
!213 = distinct !{!213, !207, !214, !152}
!214 = !DILocation(line: 62, column: 5, scope: !201)
!215 = !DILocalVariable(name: "temp", scope: !154, file: !25, line: 65, type: !216)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 5)
!219 = !DILocation(line: 65, column: 12, scope: !154)
!220 = !DILocalVariable(name: "temp_bytes", scope: !154, file: !25, line: 66, type: !18)
!221 = !DILocalVariable(name: "i", scope: !222, file: !25, line: 67, type: !45)
!222 = distinct !DILexicalBlock(scope: !154, file: !25, line: 67, column: 3)
!223 = !DILocation(line: 0, scope: !222)
!224 = !DILocation(line: 67, column: 8, scope: !222)
!225 = !DILocation(line: 67, scope: !222)
!226 = !DILocation(line: 67, column: 34, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !25, line: 67, column: 3)
!228 = !DILocation(line: 67, column: 3, scope: !222)
!229 = !DILocation(line: 68, column: 5, scope: !230)
!230 = distinct !DILexicalBlock(scope: !231, file: !25, line: 68, column: 5)
!231 = distinct !DILexicalBlock(scope: !227, file: !25, line: 67, column: 45)
!232 = !DILocation(line: 104, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !154, file: !25, line: 104, column: 3)
!234 = !DILocation(line: 68, scope: !230)
!235 = !DILocalVariable(name: "j", scope: !230, file: !25, line: 68, type: !45)
!236 = !DILocation(line: 0, scope: !230)
!237 = !DILocation(line: 68, column: 23, scope: !238)
!238 = distinct !DILexicalBlock(scope: !230, file: !25, line: 68, column: 5)
!239 = !DILocation(line: 70, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !238, file: !25, line: 68, column: 42)
!241 = !DILocation(line: 70, column: 50, scope: !240)
!242 = !DILocation(line: 70, column: 62, scope: !240)
!243 = !DILocalVariable(name: "top", scope: !240, file: !25, line: 70, type: !14)
!244 = !DILocation(line: 0, scope: !240)
!245 = !DILocation(line: 71, column: 7, scope: !240)
!246 = !DILocation(line: 71, column: 29, scope: !240)
!247 = !DILocalVariable(name: "k", scope: !248, file: !25, line: 72, type: !45)
!248 = distinct !DILexicalBlock(scope: !240, file: !25, line: 72, column: 7)
!249 = !DILocation(line: 0, scope: !248)
!250 = !DILocation(line: 72, column: 12, scope: !248)
!251 = !DILocation(line: 72, scope: !248)
!252 = !DILocation(line: 72, column: 39, scope: !253)
!253 = distinct !DILexicalBlock(scope: !248, file: !25, line: 72, column: 7)
!254 = !DILocation(line: 72, column: 7, scope: !248)
!255 = !DILocation(line: 77, column: 7, scope: !256)
!256 = distinct !DILexicalBlock(scope: !240, file: !25, line: 77, column: 7)
!257 = !DILocation(line: 73, column: 24, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !25, line: 72, column: 50)
!259 = !DILocation(line: 73, column: 32, scope: !258)
!260 = !DILocation(line: 73, column: 16, scope: !258)
!261 = !DILocation(line: 73, column: 9, scope: !258)
!262 = !DILocation(line: 73, column: 21, scope: !258)
!263 = !DILocation(line: 74, column: 9, scope: !258)
!264 = !DILocation(line: 74, column: 17, scope: !258)
!265 = !DILocation(line: 72, column: 46, scope: !253)
!266 = !DILocation(line: 72, column: 7, scope: !253)
!267 = distinct !{!267, !254, !268, !152}
!268 = !DILocation(line: 75, column: 7, scope: !248)
!269 = !DILocation(line: 77, scope: !256)
!270 = !DILocalVariable(name: "jj", scope: !256, file: !25, line: 77, type: !45)
!271 = !DILocation(line: 0, scope: !256)
!272 = !DILocation(line: 77, column: 27, scope: !273)
!273 = distinct !DILexicalBlock(scope: !256, file: !25, line: 77, column: 7)
!274 = !DILocation(line: 96, column: 7, scope: !275)
!275 = distinct !DILexicalBlock(scope: !240, file: !25, line: 96, column: 7)
!276 = !DILocation(line: 78, column: 16, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !25, line: 78, column: 13)
!278 = distinct !DILexicalBlock(scope: !273, file: !25, line: 77, column: 47)
!279 = !DILocation(line: 78, column: 20, scope: !277)
!280 = !DILocation(line: 83, column: 44, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !25, line: 78, column: 26)
!282 = !DILocalVariable(name: "a", arg: 1, scope: !283, file: !284, line: 10, type: !14)
!283 = distinct !DISubprogram(name: "mul_f", scope: !284, file: !284, line: 10, type: !285, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!284 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!285 = !DISubroutineType(types: !286)
!286 = !{!14, !14, !14}
!287 = !DILocation(line: 0, scope: !283, inlinedAt: !288)
!288 = distinct !DILocation(line: 83, column: 33, scope: !281)
!289 = !DILocalVariable(name: "b", arg: 2, scope: !283, file: !284, line: 10, type: !14)
!290 = !DILocation(line: 15, column: 10, scope: !283, inlinedAt: !288)
!291 = !DILocation(line: 15, column: 7, scope: !283, inlinedAt: !288)
!292 = !DILocation(line: 18, column: 17, scope: !283, inlinedAt: !288)
!293 = !DILocalVariable(name: "p", scope: !283, file: !284, line: 12, type: !14)
!294 = !DILocation(line: 19, column: 13, scope: !283, inlinedAt: !288)
!295 = !DILocation(line: 19, column: 17, scope: !283, inlinedAt: !288)
!296 = !DILocation(line: 19, column: 7, scope: !283, inlinedAt: !288)
!297 = !DILocation(line: 20, column: 13, scope: !283, inlinedAt: !288)
!298 = !DILocation(line: 20, column: 17, scope: !283, inlinedAt: !288)
!299 = !DILocation(line: 20, column: 7, scope: !283, inlinedAt: !288)
!300 = !DILocation(line: 21, column: 13, scope: !283, inlinedAt: !288)
!301 = !DILocation(line: 21, column: 17, scope: !283, inlinedAt: !288)
!302 = !DILocation(line: 21, column: 7, scope: !283, inlinedAt: !288)
!303 = !DILocalVariable(name: "top_p", scope: !283, file: !284, line: 24, type: !14)
!304 = !DILocation(line: 25, column: 37, scope: !283, inlinedAt: !288)
!305 = !DILocation(line: 25, column: 52, scope: !283, inlinedAt: !288)
!306 = !DILocation(line: 25, column: 43, scope: !283, inlinedAt: !288)
!307 = !DILocation(line: 25, column: 59, scope: !283, inlinedAt: !288)
!308 = !DILocalVariable(name: "out", scope: !283, file: !284, line: 25, type: !14)
!309 = !DILocation(line: 83, column: 25, scope: !281)
!310 = !DILocation(line: 83, column: 11, scope: !281)
!311 = !DILocation(line: 83, column: 30, scope: !281)
!312 = !DILocation(line: 85, column: 9, scope: !281)
!313 = !DILocation(line: 90, column: 44, scope: !314)
!314 = distinct !DILexicalBlock(scope: !277, file: !25, line: 85, column: 16)
!315 = !DILocation(line: 0, scope: !283, inlinedAt: !316)
!316 = distinct !DILocation(line: 90, column: 33, scope: !314)
!317 = !DILocation(line: 15, column: 10, scope: !283, inlinedAt: !316)
!318 = !DILocation(line: 15, column: 7, scope: !283, inlinedAt: !316)
!319 = !DILocation(line: 18, column: 17, scope: !283, inlinedAt: !316)
!320 = !DILocation(line: 19, column: 13, scope: !283, inlinedAt: !316)
!321 = !DILocation(line: 19, column: 17, scope: !283, inlinedAt: !316)
!322 = !DILocation(line: 19, column: 7, scope: !283, inlinedAt: !316)
!323 = !DILocation(line: 20, column: 13, scope: !283, inlinedAt: !316)
!324 = !DILocation(line: 20, column: 17, scope: !283, inlinedAt: !316)
!325 = !DILocation(line: 20, column: 7, scope: !283, inlinedAt: !316)
!326 = !DILocation(line: 21, column: 13, scope: !283, inlinedAt: !316)
!327 = !DILocation(line: 21, column: 17, scope: !283, inlinedAt: !316)
!328 = !DILocation(line: 21, column: 7, scope: !283, inlinedAt: !316)
!329 = !DILocation(line: 25, column: 37, scope: !283, inlinedAt: !316)
!330 = !DILocation(line: 25, column: 52, scope: !283, inlinedAt: !316)
!331 = !DILocation(line: 25, column: 43, scope: !283, inlinedAt: !316)
!332 = !DILocation(line: 25, column: 59, scope: !283, inlinedAt: !316)
!333 = !DILocation(line: 90, column: 65, scope: !314)
!334 = !DILocation(line: 90, column: 25, scope: !314)
!335 = !DILocation(line: 90, column: 11, scope: !314)
!336 = !DILocation(line: 90, column: 30, scope: !314)
!337 = !DILocation(line: 77, column: 43, scope: !273)
!338 = !DILocation(line: 77, column: 7, scope: !273)
!339 = distinct !{!339, !255, !340, !152}
!340 = !DILocation(line: 93, column: 7, scope: !256)
!341 = !DILocation(line: 96, scope: !275)
!342 = !DILocalVariable(name: "k", scope: !275, file: !25, line: 96, type: !15)
!343 = !DILocation(line: 0, scope: !275)
!344 = !DILocation(line: 96, column: 28, scope: !345)
!345 = distinct !DILexicalBlock(scope: !275, file: !25, line: 96, column: 7)
!346 = !DILocation(line: 97, column: 27, scope: !347)
!347 = distinct !DILexicalBlock(scope: !345, file: !25, line: 96, column: 48)
!348 = !DILocation(line: 97, column: 40, scope: !347)
!349 = !DILocation(line: 97, column: 20, scope: !347)
!350 = !DILocation(line: 98, column: 24, scope: !347)
!351 = !DILocation(line: 98, column: 39, scope: !347)
!352 = !DILocation(line: 98, column: 52, scope: !347)
!353 = !DILocation(line: 98, column: 32, scope: !347)
!354 = !DILocation(line: 98, column: 30, scope: !347)
!355 = !DILocation(line: 97, column: 64, scope: !347)
!356 = !DILocation(line: 97, column: 9, scope: !347)
!357 = !DILocation(line: 97, column: 17, scope: !347)
!358 = !DILocation(line: 96, column: 44, scope: !345)
!359 = !DILocation(line: 96, column: 7, scope: !345)
!360 = distinct !{!360, !274, !361, !152}
!361 = !DILocation(line: 99, column: 7, scope: !275)
!362 = !DILocation(line: 68, column: 38, scope: !238)
!363 = !DILocation(line: 68, column: 5, scope: !238)
!364 = distinct !{!364, !229, !365, !152}
!365 = !DILocation(line: 100, column: 5, scope: !230)
!366 = !DILocation(line: 67, column: 41, scope: !227)
!367 = !DILocation(line: 67, column: 3, scope: !227)
!368 = distinct !{!368, !228, !369, !152}
!369 = !DILocation(line: 101, column: 3, scope: !222)
!370 = !DILocation(line: 104, scope: !233)
!371 = !DILocalVariable(name: "i", scope: !233, file: !25, line: 104, type: !45)
!372 = !DILocation(line: 0, scope: !233)
!373 = !DILocation(line: 104, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !233, file: !25, line: 104, column: 3)
!375 = !DILocation(line: 110, column: 12, scope: !376)
!376 = distinct !DILexicalBlock(scope: !374, file: !25, line: 104, column: 43)
!377 = !DILocation(line: 110, column: 33, scope: !376)
!378 = !DILocation(line: 110, column: 20, scope: !376)
!379 = !DILocation(line: 110, column: 38, scope: !376)
!380 = !DILocation(line: 110, column: 17, scope: !376)
!381 = !DILocation(line: 110, column: 5, scope: !376)
!382 = !DILocation(line: 110, column: 10, scope: !376)
!383 = !DILocation(line: 111, column: 20, scope: !376)
!384 = !DILocation(line: 111, column: 16, scope: !376)
!385 = !DILocation(line: 111, column: 41, scope: !376)
!386 = !DILocation(line: 111, column: 28, scope: !376)
!387 = !DILocation(line: 111, column: 46, scope: !376)
!388 = !DILocation(line: 111, column: 25, scope: !376)
!389 = !DILocation(line: 111, column: 9, scope: !376)
!390 = !DILocation(line: 111, column: 5, scope: !376)
!391 = !DILocation(line: 111, column: 14, scope: !376)
!392 = !DILocation(line: 104, column: 37, scope: !374)
!393 = !DILocation(line: 104, column: 3, scope: !374)
!394 = distinct !{!394, !232, !395, !152}
!395 = !DILocation(line: 113, column: 3, scope: !233)
!396 = !DILocation(line: 115, column: 1, scope: !154)
!397 = !{!"p_buf"}
!398 = !{!"SPS"}
!399 = !{!"zero"}
!400 = !{!"y"}
!401 = distinct !DISubprogram(name: "mayo_memcpy", scope: !130, file: !130, line: 11, type: !402, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !28)
!402 = !DISubroutineType(types: !403)
!403 = !{null, !70, !404, !19}
!404 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !405, size: 32)
!405 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!406 = !DILocalVariable(name: "dst", arg: 1, scope: !401, file: !130, line: 11, type: !70)
!407 = !DILocation(line: 0, scope: !401)
!408 = !DILocalVariable(name: "src", arg: 2, scope: !401, file: !130, line: 11, type: !404)
!409 = !DILocalVariable(name: "len", arg: 3, scope: !401, file: !130, line: 11, type: !19)
!410 = !DILocalVariable(name: "d", scope: !401, file: !130, line: 13, type: !11)
!411 = !DILocalVariable(name: "s", scope: !401, file: !130, line: 14, type: !412)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !413, size: 32)
!413 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!414 = !DILocalVariable(name: "i", scope: !415, file: !130, line: 16, type: !19)
!415 = distinct !DILexicalBlock(scope: !401, file: !130, line: 16, column: 5)
!416 = !DILocation(line: 0, scope: !415)
!417 = !DILocation(line: 16, column: 10, scope: !415)
!418 = !DILocation(line: 16, scope: !415)
!419 = !DILocation(line: 16, column: 28, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !130, line: 16, column: 5)
!421 = !DILocation(line: 16, column: 5, scope: !415)
!422 = !DILocation(line: 17, column: 16, scope: !420)
!423 = !DILocation(line: 17, column: 9, scope: !420)
!424 = !DILocation(line: 17, column: 14, scope: !420)
!425 = !DILocation(line: 16, column: 36, scope: !420)
!426 = !DILocation(line: 16, column: 5, scope: !420)
!427 = distinct !{!427, !421, !428, !152}
!428 = !DILocation(line: 17, column: 19, scope: !415)
!429 = !DILocation(line: 18, column: 1, scope: !401)
