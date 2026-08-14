; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %O, ptr noundef nonnull %P3) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(ptr %p, !166, !DIExpression(), !167)
    #dbg_value(ptr %P1, !168, !DIExpression(), !167)
    #dbg_value(ptr %P2, !169, !DIExpression(), !167)
    #dbg_value(ptr %O, !170, !DIExpression(), !167)
    #dbg_value(ptr %P3, !171, !DIExpression(), !167)
    #dbg_value(i32 5, !172, !DIExpression(), !167)
    #dbg_value(i32 78, !174, !DIExpression(), !167)
    #dbg_value(i32 8, !175, !DIExpression(), !167)
    #dbg_value(ptr %p, !176, !DIExpression(), !180)
    #dbg_value(ptr %P1, !182, !DIExpression(), !180)
    #dbg_value(ptr %O, !183, !DIExpression(), !180)
    #dbg_value(ptr %P2, !184, !DIExpression(), !180)
    #dbg_value(i32 5, !185, !DIExpression(), !189)
    #dbg_value(ptr %P1, !191, !DIExpression(), !189)
    #dbg_value(ptr %O, !192, !DIExpression(), !189)
    #dbg_value(ptr %P2, !193, !DIExpression(), !189)
    #dbg_value(i32 78, !194, !DIExpression(), !189)
    #dbg_value(i32 78, !195, !DIExpression(), !189)
    #dbg_value(i32 8, !196, !DIExpression(), !189)
    #dbg_value(i32 1, !197, !DIExpression(), !189)
    #dbg_value(i32 0, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !199, !DIExpression(), !201)
  br label %for.cond.i, !dbg !202

for.cond.i:                                       ; preds = %for.inc17.i, %entry
  %indvars.iv.i = phi i32 [ %indvars.iv.next.i, %for.inc17.i ], [ 78, %entry ], !dbg !203
  %bs_mat_entries_used.0.i = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1.i, %for.inc17.i ], !dbg !203
  %r.0.i = phi i32 [ 0, %entry ], [ %inc18.i, %for.inc17.i ], !dbg !204
    #dbg_value(i32 %r.0.i, !199, !DIExpression(), !201)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !198, !DIExpression(), !189)
  %exitcond2.i = icmp ne i32 %r.0.i, 78, !dbg !205
  br i1 %exitcond2.i, label %for.cond1.preheader.i, label %mul_add_m_upper_triangular_mat_x_mat.exit, !dbg !207

for.cond1.preheader.i:                            ; preds = %for.cond.i
  %0 = add i32 %bs_mat_entries_used.0.i, %indvars.iv.i, !dbg !208
  br label %for.cond1.i, !dbg !208

for.cond1.i:                                      ; preds = %for.inc15.i, %for.cond1.preheader.i
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i, %for.inc15.i ], [ %bs_mat_entries_used.0.i, %for.cond1.preheader.i ], !dbg !189
  %c.0.i = phi i32 [ %inc.i, %for.inc15.i ], [ %r.0.i, %for.cond1.preheader.i ], !dbg !211
    #dbg_value(i32 %c.0.i, !212, !DIExpression(), !213)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !198, !DIExpression(), !189)
  %exitcond1.i = icmp ne i32 %bs_mat_entries_used.1.i, %0, !dbg !214
  br i1 %exitcond1.i, label %for.cond4.preheader.i, label %for.inc17.i, !dbg !208

for.cond4.preheader.i:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !216

for.cond4.i:                                      ; preds = %m_vec_mul_add.exit, %for.cond4.preheader.i
  %k.0.i = phi i32 [ %add13.i, %m_vec_mul_add.exit ], [ 0, %for.cond4.preheader.i ], !dbg !219
    #dbg_value(i32 %k.0.i, !220, !DIExpression(), !221)
  %exitcond.i = icmp ne i32 %k.0.i, 8, !dbg !222
  br i1 %exitcond.i, label %for.body6.i, label %for.inc15.i, !dbg !216

for.body6.i:                                      ; preds = %for.cond4.i
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !224
  %add.ptr.i = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i, !dbg !224
  %mul8.i = shl nuw nsw i32 %c.0.i, 3, !dbg !226
  %1 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !227
  %arrayidx.i = getelementptr i8, ptr %1, i32 %k.0.i, !dbg !227
  %2 = load i8, ptr %arrayidx.i, align 1, !dbg !227
  %mul9.i = shl nuw nsw i32 %r.0.i, 3, !dbg !228
  %add10.i = or disjoint i32 %mul9.i, %k.0.i, !dbg !229
  %add.ptr12.idx.i = mul nuw nsw i32 %add10.i, 40, !dbg !230
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i, !dbg !230
    #dbg_value(i32 5, !231, !DIExpression(), !236)
    #dbg_value(ptr %add.ptr.i, !238, !DIExpression(), !236)
    #dbg_value(i8 %2, !239, !DIExpression(), !236)
    #dbg_value(ptr %add.ptr12.i, !240, !DIExpression(), !236)
    #dbg_value(i8 %2, !241, !DIExpression(), !246)
  %conv.i.i = zext i8 %2 to i32, !dbg !248
  %mul.i.i = mul i32 %conv.i.i, 134480385, !dbg !249
    #dbg_value(i32 %mul.i.i, !250, !DIExpression(), !246)
    #dbg_value(i32 -252645136, !251, !DIExpression(), !246)
  %and.i.i = and i32 %mul.i.i, -252645136, !dbg !252
    #dbg_value(i32 %and.i.i, !253, !DIExpression(), !246)
  %shr.i.i = lshr exact i32 %and.i.i, 4, !dbg !254
  %shr1.i.i = lshr exact i32 %and.i.i, 3, !dbg !255
  %3 = xor i32 %shr.i.i, %shr1.i.i, !dbg !256
  %xor2.i.i = xor i32 %3, %mul.i.i, !dbg !256
    #dbg_value(i32 %xor2.i.i, !257, !DIExpression(), !236)
    #dbg_value(i64 1229782938247303441, !258, !DIExpression(), !236)
    #dbg_value(i32 0, !259, !DIExpression(), !261)
  br label %for.cond.i1, !dbg !262

for.cond.i1:                                      ; preds = %for.body.i, %for.body6.i
  %i.0.i = phi i32 [ 0, %for.body6.i ], [ %inc.i4, %for.body.i ], !dbg !263
    #dbg_value(i32 %i.0.i, !259, !DIExpression(), !261)
  %exitcond.i2 = icmp ne i32 %i.0.i, 5, !dbg !264
  br i1 %exitcond.i2, label %for.body.i, label %m_vec_mul_add.exit, !dbg !266

for.body.i:                                       ; preds = %for.cond.i1
  %arrayidx.i3 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !267
  %4 = load i64, ptr %arrayidx.i3, align 8, !dbg !267
  %and.i = and i64 %4, 1229782938247303441, !dbg !269
  %and1.i = and i32 %xor2.i.i, 255, !dbg !270
  %conv.i = zext nneg i32 %and1.i to i64, !dbg !271
  %mul.i = mul i64 %and.i, %conv.i, !dbg !272
  %shr.i = lshr i64 %4, 1, !dbg !273
  %and3.i = and i64 %shr.i, 1229782938247303441, !dbg !274
  %shr4.i = lshr i32 %xor2.i.i, 8, !dbg !275
  %and5.i = and i32 %shr4.i, 15, !dbg !276
  %conv6.i = zext nneg i32 %and5.i to i64, !dbg !277
  %mul7.i = mul nuw i64 %and3.i, %conv6.i, !dbg !278
  %xor.i = xor i64 %mul.i, %mul7.i, !dbg !279
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !280
  %5 = load i64, ptr %arrayidx8.i, align 8, !dbg !280
  %shr9.i = lshr i64 %5, 2, !dbg !281
  %and10.i = and i64 %shr9.i, 1229782938247303441, !dbg !282
  %shr11.i = lshr i32 %xor2.i.i, 16, !dbg !283
  %and12.i = and i32 %shr11.i, 15, !dbg !284
  %conv13.i = zext nneg i32 %and12.i to i64, !dbg !285
  %mul14.i = mul nuw i64 %and10.i, %conv13.i, !dbg !286
  %xor15.i = xor i64 %xor.i, %mul14.i, !dbg !287
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !288
  %6 = load i64, ptr %arrayidx16.i, align 8, !dbg !288
  %shr17.i = lshr i64 %6, 3, !dbg !289
  %and18.i = and i64 %shr17.i, 1229782938247303441, !dbg !290
  %shr19.i = lshr i32 %xor2.i.i, 24, !dbg !291
  %and20.i = and i32 %shr19.i, 15, !dbg !292
  %conv21.i = zext nneg i32 %and20.i to i64, !dbg !293
  %mul22.i = mul nuw i64 %and18.i, %conv21.i, !dbg !294
  %xor23.i = xor i64 %xor15.i, %mul22.i, !dbg !295
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i, !dbg !296
  %7 = load i64, ptr %arrayidx24.i, align 8, !dbg !297
  %xor25.i = xor i64 %7, %xor23.i, !dbg !297
  store i64 %xor25.i, ptr %arrayidx24.i, align 8, !dbg !297
  %inc.i4 = add nuw nsw i32 %i.0.i, 1, !dbg !298
    #dbg_value(i32 %inc.i4, !259, !DIExpression(), !261)
  br label %for.cond.i1, !dbg !299, !llvm.loop !300

m_vec_mul_add.exit:                               ; preds = %for.cond.i1
  %add13.i = add nuw nsw i32 %k.0.i, 1, !dbg !303
    #dbg_value(i32 %add13.i, !220, !DIExpression(), !221)
  br label %for.cond4.i, !dbg !304, !llvm.loop !305

for.inc15.i:                                      ; preds = %for.cond4.i
    #dbg_value(i32 %bs_mat_entries_used.1.i, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i = add i32 %bs_mat_entries_used.1.i, 1, !dbg !307
    #dbg_value(i32 %add14.i, !198, !DIExpression(), !189)
  %inc.i = add nuw nsw i32 %c.0.i, 1, !dbg !308
    #dbg_value(i32 %inc.i, !212, !DIExpression(), !213)
  br label %for.cond1.i, !dbg !309, !llvm.loop !310

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !312
    #dbg_value(i32 %inc18.i, !199, !DIExpression(), !201)
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i, -1, !dbg !313
  br label %for.cond.i, !dbg !313, !llvm.loop !314

mul_add_m_upper_triangular_mat_x_mat.exit:        ; preds = %for.cond.i
  ret void, !dbg !316
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !317
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P = alloca [18525 x i64], align 16, !llvmbmc.var !318
  call void @mayo_memset(ptr %P, i8 0, i32 148200)
  %byte0 = getelementptr inbounds i8, ptr %P, i32 0
  store i8 -80, ptr %byte0, align 1
  %byte1 = getelementptr inbounds i8, ptr %P, i32 1
  store i8 78, ptr %byte1, align 1
  %byte2 = getelementptr inbounds i8, ptr %P, i32 2
  store i8 25, ptr %byte2, align 1
  %byte3 = getelementptr inbounds i8, ptr %P, i32 3
  store i8 47, ptr %byte3, align 1
  %byte4 = getelementptr inbounds i8, ptr %P, i32 4
  store i8 4, ptr %byte4, align 1
  %byte5 = getelementptr inbounds i8, ptr %P, i32 5
  store i8 19, ptr %byte5, align 1
  %byte6 = getelementptr inbounds i8, ptr %P, i32 6
  store i8 -91, ptr %byte6, align 1
  %byte7 = getelementptr inbounds i8, ptr %P, i32 7
  store i8 23, ptr %byte7, align 1
  %P1 = alloca [18525 x i64], align 16, !llvmbmc.var !318
  call void @mayo_memset(ptr %P1, i8 0, i32 148200)
  %byte02 = getelementptr inbounds i8, ptr %P1, i32 0
  store i8 -48, ptr %byte02, align 1
  %byte13 = getelementptr inbounds i8, ptr %P1, i32 1
  store i8 -40, ptr %byte13, align 1
  %byte24 = getelementptr inbounds i8, ptr %P1, i32 2
  store i8 65, ptr %byte24, align 1
  %byte35 = getelementptr inbounds i8, ptr %P1, i32 3
  store i8 55, ptr %byte35, align 1
  %byte46 = getelementptr inbounds i8, ptr %P1, i32 4
  store i8 34, ptr %byte46, align 1
  %byte57 = getelementptr inbounds i8, ptr %P1, i32 5
  store i8 59, ptr %byte57, align 1
  %byte68 = getelementptr inbounds i8, ptr %P1, i32 6
  store i8 33, ptr %byte68, align 1
  %byte79 = getelementptr inbounds i8, ptr %P1, i32 7
  store i8 54, ptr %byte79, align 1
  %O = alloca [624 x i8], align 16, !llvmbmc.var !319
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  %byte010 = getelementptr inbounds i8, ptr %O, i32 0
  store i8 13, ptr %byte010, align 1
  %P3 = alloca [320 x i64], align 16, !llvmbmc.var !320
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  call fastcc void @compute_P3(ptr %p_buf, ptr %P, ptr %P1, ptr %O, ptr %P3)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !321 {
entry:
    #dbg_value(ptr %dst, !325, !DIExpression(), !326)
    #dbg_value(i8 %val, !327, !DIExpression(), !326)
    #dbg_value(i32 %len, !328, !DIExpression(), !326)
    #dbg_value(ptr %dst, !329, !DIExpression(), !326)
    #dbg_value(i32 0, !330, !DIExpression(), !332)
  br label %for.cond, !dbg !333

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !334
    #dbg_value(i32 %i.0, !330, !DIExpression(), !332)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !335
  br i1 %exitcond, label %for.body, label %for.end, !dbg !337

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !338
  store i8 %val, ptr %arrayidx, align 1, !dbg !339
  %inc = add i32 %i.0, 1, !dbg !340
    #dbg_value(i32 %inc, !330, !DIExpression(), !332)
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond
  ret void, !dbg !344
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !345 {
entry:
    #dbg_value(ptr %dst, !350, !DIExpression(), !351)
    #dbg_value(ptr %src, !352, !DIExpression(), !351)
    #dbg_value(i32 %len, !353, !DIExpression(), !351)
    #dbg_value(ptr %dst, !354, !DIExpression(), !351)
    #dbg_value(ptr %src, !355, !DIExpression(), !351)
    #dbg_value(i32 0, !358, !DIExpression(), !360)
  br label %for.cond, !dbg !361

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !362
    #dbg_value(i32 %i.0, !358, !DIExpression(), !360)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !363
  br i1 %exitcond, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !366
  %0 = load i8, ptr %arrayidx, align 1, !dbg !366
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !367
  store i8 %0, ptr %arrayidx1, align 1, !dbg !368
  %inc = add i32 %i.0, 1, !dbg !369
    #dbg_value(i32 %inc, !358, !DIExpression(), !360)
  br label %for.cond, !dbg !370, !llvm.loop !371

for.end:                                          ; preds = %for.cond
  ret void, !dbg !373
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!0, !2, !3, !44, !67, !78, !87, !105, !123, !124}
!llvm.ident = !{!125, !125, !125, !125, !125, !125, !125, !125}
!llvm.module.flags = !{!126, !127, !128, !129}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!3 = distinct !DICompileUnit(language: DW_LANG_C11, file: !4, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !5, globals: !22, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!5 = !{!6, !12, !15, !16, !19, !20}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 60, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 105, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!11 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 43, baseType: !15)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 214, baseType: !18)
!17 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 48, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 79, baseType: !18)
!22 = !{!23, !30, !38, !40, !42}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "f_tail", scope: !3, file: !25, line: 247, type: !26, isLocal: true, isDefinition: true)
!25 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 32, elements: !28)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !{!29}
!29 = !DISubrange(count: 4)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !32, file: !33, line: 118, type: !37, isLocal: true, isDefinition: true)
!32 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !33, file: !33, line: 117, type: !34, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!33 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!34 = !DISubroutineType(types: !35)
!35 = !{null, !6}
!36 = !{}
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "even_bytes", scope: !32, file: !33, line: 119, type: !37, isLocal: true, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !32, file: !33, line: 120, type: !37, isLocal: true, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "even_half", scope: !32, file: !33, line: 121, type: !37, isLocal: true, isDefinition: true)
!44 = distinct !DICompileUnit(language: DW_LANG_C11, file: !4, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !45, globals: !56, splitDebugInlining: false, nameTableKind: None)
!45 = !{!7, !46, !47, !19, !20, !50, !51, !54}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 56, baseType: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 103, baseType: !49)
!49 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !8, line: 20, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !10, line: 41, baseType: !53)
!53 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 44, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 77, baseType: !46)
!56 = !{!57, !61, !64}
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !44, file: !59, line: 126, type: !60, isLocal: false, isDefinition: true)
!59 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!60 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !20)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !44, file: !59, line: 127, type: !63, isLocal: false, isDefinition: true)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !7)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !44, file: !59, line: 128, type: !66, isLocal: false, isDefinition: true)
!66 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !20, !7, !16, !13}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !46, !7, !20, !15}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !36)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !16}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !46, !16}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !36)
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
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !112, file: !110, line: 38, baseType: !119, size: 128, offset: 256)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 16)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !46, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!125 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 1, !"min_enum_size", i32 4}
!129 = !{i32 1, !"Code Model", i32 1}
!130 = distinct !DISubprogram(name: "compute_P3", scope: !131, file: !131, line: 268, type: !132, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !134, !165, !6, !50, !6}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 32)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !136)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !25, line: 289, baseType: !137)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 265, size: 736, elements: !138)
!138 = !{!139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !137, file: !25, line: 266, baseType: !46, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !137, file: !25, line: 267, baseType: !46, size: 32, offset: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !137, file: !25, line: 268, baseType: !46, size: 32, offset: 64)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !137, file: !25, line: 269, baseType: !46, size: 32, offset: 96)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !137, file: !25, line: 270, baseType: !46, size: 32, offset: 128)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !137, file: !25, line: 271, baseType: !50, size: 32, offset: 160)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !137, file: !25, line: 272, baseType: !46, size: 32, offset: 192)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !137, file: !25, line: 273, baseType: !46, size: 32, offset: 224)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !137, file: !25, line: 274, baseType: !46, size: 32, offset: 256)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !137, file: !25, line: 275, baseType: !46, size: 32, offset: 288)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !137, file: !25, line: 276, baseType: !46, size: 32, offset: 320)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !137, file: !25, line: 277, baseType: !46, size: 32, offset: 352)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !137, file: !25, line: 278, baseType: !46, size: 32, offset: 384)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !137, file: !25, line: 279, baseType: !46, size: 32, offset: 416)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !137, file: !25, line: 280, baseType: !46, size: 32, offset: 448)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !137, file: !25, line: 281, baseType: !46, size: 32, offset: 480)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !137, file: !25, line: 282, baseType: !46, size: 32, offset: 512)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !137, file: !25, line: 283, baseType: !46, size: 32, offset: 544)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !137, file: !25, line: 284, baseType: !46, size: 32, offset: 576)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !137, file: !25, line: 285, baseType: !46, size: 32, offset: 608)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !137, file: !25, line: 286, baseType: !46, size: 32, offset: 640)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !137, file: !25, line: 287, baseType: !46, size: 32, offset: 672)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !137, file: !25, line: 288, baseType: !162, size: 32, offset: 704)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 32)
!163 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !164)
!164 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!166 = !DILocalVariable(name: "p", arg: 1, scope: !130, file: !131, line: 268, type: !134)
!167 = !DILocation(line: 0, scope: !130)
!168 = !DILocalVariable(name: "P1", arg: 2, scope: !130, file: !131, line: 268, type: !165)
!169 = !DILocalVariable(name: "P2", arg: 3, scope: !130, file: !131, line: 268, type: !6)
!170 = !DILocalVariable(name: "O", arg: 4, scope: !130, file: !131, line: 268, type: !50)
!171 = !DILocalVariable(name: "P3", arg: 5, scope: !130, file: !131, line: 268, type: !6)
!172 = !DILocalVariable(name: "m_vec_limbs", scope: !130, file: !131, line: 270, type: !173)
!173 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!174 = !DILocalVariable(name: "param_v", scope: !130, file: !131, line: 271, type: !173)
!175 = !DILocalVariable(name: "param_o", scope: !130, file: !131, line: 272, type: !173)
!176 = !DILocalVariable(name: "p", arg: 1, scope: !177, file: !131, line: 76, type: !134)
!177 = distinct !DISubprogram(name: "P1_times_O", scope: !131, file: !131, line: 76, type: !178, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !134, !165, !50, !6}
!180 = !DILocation(line: 0, scope: !177, inlinedAt: !181)
!181 = distinct !DILocation(line: 275, column: 5, scope: !130)
!182 = !DILocalVariable(name: "P1", arg: 2, scope: !177, file: !131, line: 76, type: !165)
!183 = !DILocalVariable(name: "O", arg: 3, scope: !177, file: !131, line: 76, type: !50)
!184 = !DILocalVariable(name: "acc", arg: 4, scope: !177, file: !131, line: 76, type: !6)
!185 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !186, file: !131, line: 16, type: !173)
!186 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !131, file: !131, line: 16, type: !187, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!187 = !DISubroutineType(types: !188)
!188 = !{null, !173, !165, !50, !6, !173, !173, !173, !173}
!189 = !DILocation(line: 0, scope: !186, inlinedAt: !190)
!190 = distinct !DILocation(line: 80, column: 5, scope: !177, inlinedAt: !181)
!191 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !186, file: !131, line: 16, type: !165)
!192 = !DILocalVariable(name: "mat", arg: 3, scope: !186, file: !131, line: 16, type: !50)
!193 = !DILocalVariable(name: "acc", arg: 4, scope: !186, file: !131, line: 16, type: !6)
!194 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !186, file: !131, line: 17, type: !173)
!195 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !186, file: !131, line: 17, type: !173)
!196 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !186, file: !131, line: 17, type: !173)
!197 = !DILocalVariable(name: "triangular", arg: 8, scope: !186, file: !131, line: 17, type: !173)
!198 = !DILocalVariable(name: "bs_mat_entries_used", scope: !186, file: !131, line: 19, type: !46)
!199 = !DILocalVariable(name: "r", scope: !200, file: !131, line: 20, type: !46)
!200 = distinct !DILexicalBlock(scope: !186, file: !131, line: 20, column: 5)
!201 = !DILocation(line: 0, scope: !200, inlinedAt: !190)
!202 = !DILocation(line: 20, column: 10, scope: !200, inlinedAt: !190)
!203 = !DILocation(line: 19, column: 9, scope: !186, inlinedAt: !190)
!204 = !DILocation(line: 20, scope: !200, inlinedAt: !190)
!205 = !DILocation(line: 20, column: 23, scope: !206, inlinedAt: !190)
!206 = distinct !DILexicalBlock(scope: !200, file: !131, line: 20, column: 5)
!207 = !DILocation(line: 20, column: 5, scope: !200, inlinedAt: !190)
!208 = !DILocation(line: 21, column: 9, scope: !209, inlinedAt: !190)
!209 = distinct !DILexicalBlock(scope: !210, file: !131, line: 21, column: 9)
!210 = distinct !DILexicalBlock(scope: !206, file: !131, line: 20, column: 43)
!211 = !DILocation(line: 21, scope: !209, inlinedAt: !190)
!212 = !DILocalVariable(name: "c", scope: !209, file: !131, line: 21, type: !46)
!213 = !DILocation(line: 0, scope: !209, inlinedAt: !190)
!214 = !DILocation(line: 21, column: 40, scope: !215, inlinedAt: !190)
!215 = distinct !DILexicalBlock(scope: !209, file: !131, line: 21, column: 9)
!216 = !DILocation(line: 22, column: 13, scope: !217, inlinedAt: !190)
!217 = distinct !DILexicalBlock(scope: !218, file: !131, line: 22, column: 13)
!218 = distinct !DILexicalBlock(scope: !215, file: !131, line: 21, column: 60)
!219 = !DILocation(line: 22, scope: !217, inlinedAt: !190)
!220 = !DILocalVariable(name: "k", scope: !217, file: !131, line: 22, type: !46)
!221 = !DILocation(line: 0, scope: !217, inlinedAt: !190)
!222 = !DILocation(line: 22, column: 31, scope: !223, inlinedAt: !190)
!223 = distinct !DILexicalBlock(scope: !217, file: !131, line: 22, column: 13)
!224 = !DILocation(line: 23, column: 51, scope: !225, inlinedAt: !190)
!225 = distinct !DILexicalBlock(scope: !223, file: !131, line: 22, column: 51)
!226 = !DILocation(line: 23, column: 94, scope: !225, inlinedAt: !190)
!227 = !DILocation(line: 23, column: 88, scope: !225, inlinedAt: !190)
!228 = !DILocation(line: 23, column: 134, scope: !225, inlinedAt: !190)
!229 = !DILocation(line: 23, column: 145, scope: !225, inlinedAt: !190)
!230 = !DILocation(line: 23, column: 115, scope: !225, inlinedAt: !190)
!231 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !232, file: !233, line: 31, type: !46)
!232 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !233, file: !233, line: 31, type: !234, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!233 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!234 = !DISubroutineType(types: !235)
!235 = !{null, !46, !165, !15, !6}
!236 = !DILocation(line: 0, scope: !232, inlinedAt: !237)
!237 = distinct !DILocation(line: 23, column: 17, scope: !225, inlinedAt: !190)
!238 = !DILocalVariable(name: "in", arg: 2, scope: !232, file: !233, line: 31, type: !165)
!239 = !DILocalVariable(name: "a", arg: 3, scope: !232, file: !233, line: 31, type: !15)
!240 = !DILocalVariable(name: "acc", arg: 4, scope: !232, file: !233, line: 31, type: !6)
!241 = !DILocalVariable(name: "b", arg: 1, scope: !242, file: !243, line: 136, type: !13)
!242 = distinct !DISubprogram(name: "mul_table", scope: !243, file: !243, line: 136, type: !244, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!243 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!244 = !DISubroutineType(types: !245)
!245 = !{!20, !13}
!246 = !DILocation(line: 0, scope: !242, inlinedAt: !247)
!247 = distinct !DILocation(line: 33, column: 20, scope: !232, inlinedAt: !237)
!248 = !DILocation(line: 137, column: 19, scope: !242, inlinedAt: !247)
!249 = !DILocation(line: 137, column: 33, scope: !242, inlinedAt: !247)
!250 = !DILocalVariable(name: "x", scope: !242, file: !243, line: 137, type: !20)
!251 = !DILocalVariable(name: "high_nibble_mask", scope: !242, file: !243, line: 139, type: !20)
!252 = !DILocation(line: 141, column: 28, scope: !242, inlinedAt: !247)
!253 = !DILocalVariable(name: "high_half", scope: !242, file: !243, line: 141, type: !20)
!254 = !DILocation(line: 142, column: 28, scope: !242, inlinedAt: !247)
!255 = !DILocation(line: 142, column: 47, scope: !242, inlinedAt: !247)
!256 = !DILocation(line: 142, column: 34, scope: !242, inlinedAt: !247)
!257 = !DILocalVariable(name: "tab", scope: !232, file: !233, line: 33, type: !20)
!258 = !DILocalVariable(name: "lsb_ask", scope: !232, file: !233, line: 35, type: !7)
!259 = !DILocalVariable(name: "i", scope: !260, file: !233, line: 37, type: !46)
!260 = distinct !DILexicalBlock(scope: !232, file: !233, line: 37, column: 5)
!261 = !DILocation(line: 0, scope: !260, inlinedAt: !237)
!262 = !DILocation(line: 37, column: 9, scope: !260, inlinedAt: !237)
!263 = !DILocation(line: 37, scope: !260, inlinedAt: !237)
!264 = !DILocation(line: 37, column: 20, scope: !265, inlinedAt: !237)
!265 = distinct !DILexicalBlock(scope: !260, file: !233, line: 37, column: 5)
!266 = !DILocation(line: 37, column: 5, scope: !260, inlinedAt: !237)
!267 = !DILocation(line: 38, column: 21, scope: !268, inlinedAt: !237)
!268 = distinct !DILexicalBlock(scope: !265, file: !233, line: 37, column: 43)
!269 = !DILocation(line: 38, column: 33, scope: !268, inlinedAt: !237)
!270 = !DILocation(line: 38, column: 51, scope: !268, inlinedAt: !237)
!271 = !DILocation(line: 38, column: 46, scope: !268, inlinedAt: !237)
!272 = !DILocation(line: 38, column: 44, scope: !268, inlinedAt: !237)
!273 = !DILocation(line: 39, column: 27, scope: !268, inlinedAt: !237)
!274 = !DILocation(line: 39, column: 33, scope: !268, inlinedAt: !237)
!275 = !DILocation(line: 39, column: 52, scope: !268, inlinedAt: !237)
!276 = !DILocation(line: 39, column: 59, scope: !268, inlinedAt: !237)
!277 = !DILocation(line: 39, column: 46, scope: !268, inlinedAt: !237)
!278 = !DILocation(line: 39, column: 44, scope: !268, inlinedAt: !237)
!279 = !DILocation(line: 39, column: 17, scope: !268, inlinedAt: !237)
!280 = !DILocation(line: 40, column: 21, scope: !268, inlinedAt: !237)
!281 = !DILocation(line: 40, column: 27, scope: !268, inlinedAt: !237)
!282 = !DILocation(line: 40, column: 33, scope: !268, inlinedAt: !237)
!283 = !DILocation(line: 40, column: 52, scope: !268, inlinedAt: !237)
!284 = !DILocation(line: 40, column: 59, scope: !268, inlinedAt: !237)
!285 = !DILocation(line: 40, column: 46, scope: !268, inlinedAt: !237)
!286 = !DILocation(line: 40, column: 44, scope: !268, inlinedAt: !237)
!287 = !DILocation(line: 40, column: 17, scope: !268, inlinedAt: !237)
!288 = !DILocation(line: 41, column: 21, scope: !268, inlinedAt: !237)
!289 = !DILocation(line: 41, column: 27, scope: !268, inlinedAt: !237)
!290 = !DILocation(line: 41, column: 33, scope: !268, inlinedAt: !237)
!291 = !DILocation(line: 41, column: 52, scope: !268, inlinedAt: !237)
!292 = !DILocation(line: 41, column: 59, scope: !268, inlinedAt: !237)
!293 = !DILocation(line: 41, column: 46, scope: !268, inlinedAt: !237)
!294 = !DILocation(line: 41, column: 44, scope: !268, inlinedAt: !237)
!295 = !DILocation(line: 41, column: 17, scope: !268, inlinedAt: !237)
!296 = !DILocation(line: 38, column: 9, scope: !268, inlinedAt: !237)
!297 = !DILocation(line: 38, column: 16, scope: !268, inlinedAt: !237)
!298 = !DILocation(line: 37, column: 40, scope: !265, inlinedAt: !237)
!299 = !DILocation(line: 37, column: 5, scope: !265, inlinedAt: !237)
!300 = distinct !{!300, !266, !301, !302}
!301 = !DILocation(line: 42, column: 5, scope: !260, inlinedAt: !237)
!302 = !{!"llvm.loop.mustprogress"}
!303 = !DILocation(line: 22, column: 45, scope: !223, inlinedAt: !190)
!304 = !DILocation(line: 22, column: 13, scope: !223, inlinedAt: !190)
!305 = distinct !{!305, !216, !306, !302}
!306 = !DILocation(line: 24, column: 13, scope: !217, inlinedAt: !190)
!307 = !DILocation(line: 25, column: 33, scope: !218, inlinedAt: !190)
!308 = !DILocation(line: 21, column: 56, scope: !215, inlinedAt: !190)
!309 = !DILocation(line: 21, column: 9, scope: !215, inlinedAt: !190)
!310 = distinct !{!310, !208, !311, !302}
!311 = !DILocation(line: 26, column: 9, scope: !209, inlinedAt: !190)
!312 = !DILocation(line: 20, column: 39, scope: !206, inlinedAt: !190)
!313 = !DILocation(line: 20, column: 5, scope: !206, inlinedAt: !190)
!314 = distinct !{!314, !207, !315, !302}
!315 = !DILocation(line: 27, column: 5, scope: !200, inlinedAt: !190)
!316 = !DILocation(line: 281, column: 1, scope: !130)
!317 = !{!"p_buf"}
!318 = !{!"P"}
!319 = !{!"O"}
!320 = !{!"P3"}
!321 = distinct !DISubprogram(name: "mayo_memset", scope: !322, file: !322, line: 3, type: !323, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!322 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!323 = !DISubroutineType(types: !324)
!324 = !{null, !70, !13, !20}
!325 = !DILocalVariable(name: "dst", arg: 1, scope: !321, file: !322, line: 3, type: !70)
!326 = !DILocation(line: 0, scope: !321)
!327 = !DILocalVariable(name: "val", arg: 2, scope: !321, file: !322, line: 3, type: !13)
!328 = !DILocalVariable(name: "len", arg: 3, scope: !321, file: !322, line: 3, type: !20)
!329 = !DILocalVariable(name: "d", scope: !321, file: !322, line: 5, type: !12)
!330 = !DILocalVariable(name: "i", scope: !331, file: !322, line: 7, type: !20)
!331 = distinct !DILexicalBlock(scope: !321, file: !322, line: 7, column: 5)
!332 = !DILocation(line: 0, scope: !331)
!333 = !DILocation(line: 7, column: 10, scope: !331)
!334 = !DILocation(line: 7, scope: !331)
!335 = !DILocation(line: 7, column: 28, scope: !336)
!336 = distinct !DILexicalBlock(scope: !331, file: !322, line: 7, column: 5)
!337 = !DILocation(line: 7, column: 5, scope: !331)
!338 = !DILocation(line: 8, column: 9, scope: !336)
!339 = !DILocation(line: 8, column: 14, scope: !336)
!340 = !DILocation(line: 7, column: 36, scope: !336)
!341 = !DILocation(line: 7, column: 5, scope: !336)
!342 = distinct !{!342, !337, !343, !302}
!343 = !DILocation(line: 8, column: 16, scope: !331)
!344 = !DILocation(line: 9, column: 1, scope: !321)
!345 = distinct !DISubprogram(name: "mayo_memcpy", scope: !322, file: !322, line: 11, type: !346, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!346 = !DISubroutineType(types: !347)
!347 = !{null, !70, !348, !20}
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 32)
!349 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!350 = !DILocalVariable(name: "dst", arg: 1, scope: !345, file: !322, line: 11, type: !70)
!351 = !DILocation(line: 0, scope: !345)
!352 = !DILocalVariable(name: "src", arg: 2, scope: !345, file: !322, line: 11, type: !348)
!353 = !DILocalVariable(name: "len", arg: 3, scope: !345, file: !322, line: 11, type: !20)
!354 = !DILocalVariable(name: "d", scope: !345, file: !322, line: 13, type: !12)
!355 = !DILocalVariable(name: "s", scope: !345, file: !322, line: 14, type: !356)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 32)
!357 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!358 = !DILocalVariable(name: "i", scope: !359, file: !322, line: 16, type: !20)
!359 = distinct !DILexicalBlock(scope: !345, file: !322, line: 16, column: 5)
!360 = !DILocation(line: 0, scope: !359)
!361 = !DILocation(line: 16, column: 10, scope: !359)
!362 = !DILocation(line: 16, scope: !359)
!363 = !DILocation(line: 16, column: 28, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !322, line: 16, column: 5)
!365 = !DILocation(line: 16, column: 5, scope: !359)
!366 = !DILocation(line: 17, column: 16, scope: !364)
!367 = !DILocation(line: 17, column: 9, scope: !364)
!368 = !DILocation(line: 17, column: 14, scope: !364)
!369 = !DILocation(line: 16, column: 36, scope: !364)
!370 = !DILocation(line: 16, column: 5, scope: !364)
!371 = distinct !{!371, !365, !372, !302}
!372 = !DILocation(line: 17, column: 19, scope: !359)
!373 = !DILocation(line: 18, column: 1, scope: !345)
