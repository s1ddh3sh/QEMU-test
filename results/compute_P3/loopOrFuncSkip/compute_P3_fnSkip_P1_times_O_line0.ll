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
    #dbg_value(i32 5, !176, !DIExpression(), !180)
    #dbg_value(ptr %O, !182, !DIExpression(), !180)
    #dbg_value(ptr %P2, !183, !DIExpression(), !180)
    #dbg_value(ptr %P3, !184, !DIExpression(), !180)
    #dbg_value(i32 78, !185, !DIExpression(), !180)
    #dbg_value(i32 8, !186, !DIExpression(), !180)
    #dbg_value(i32 8, !187, !DIExpression(), !180)
    #dbg_value(i32 0, !188, !DIExpression(), !190)
  br label %for.cond.i, !dbg !191

for.cond.i:                                       ; preds = %for.inc17.i, %entry
  %r.0.i = phi i32 [ 0, %entry ], [ %inc18.i, %for.inc17.i ], !dbg !192
    #dbg_value(i32 %r.0.i, !188, !DIExpression(), !190)
  %exitcond2.i = icmp ne i32 %r.0.i, 8, !dbg !193
  br i1 %exitcond2.i, label %for.cond1.preheader.i, label %mul_add_mat_trans_x_m_mat.exit, !dbg !195

for.cond1.preheader.i:                            ; preds = %for.cond.i
  br label %for.cond1.i, !dbg !196

for.cond1.i:                                      ; preds = %for.inc15.i, %for.cond1.preheader.i
  %c.0.i = phi i32 [ %inc.i, %for.inc15.i ], [ 0, %for.cond1.preheader.i ], !dbg !199
    #dbg_value(i32 %c.0.i, !200, !DIExpression(), !201)
  %exitcond1.i = icmp ne i32 %c.0.i, 78, !dbg !202
  br i1 %exitcond1.i, label %for.cond4.preheader.i, label %for.inc17.i, !dbg !196

for.cond4.preheader.i:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !204

for.cond4.i:                                      ; preds = %m_vec_mul_add.exit, %for.cond4.preheader.i
  %k.0.i = phi i32 [ %add14.i, %m_vec_mul_add.exit ], [ 0, %for.cond4.preheader.i ], !dbg !207
    #dbg_value(i32 %k.0.i, !208, !DIExpression(), !209)
  %exitcond.i = icmp ne i32 %k.0.i, 8, !dbg !210
  br i1 %exitcond.i, label %for.body6.i, label %for.inc15.i, !dbg !204

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i = shl nuw nsw i32 %c.0.i, 3, !dbg !212
  %add.i = or disjoint i32 %mul.i, %k.0.i, !dbg !214
  %add.ptr.idx.i = mul nuw nsw i32 %add.i, 40, !dbg !215
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i, !dbg !215
  %mul8.i = shl nuw nsw i32 %c.0.i, 3, !dbg !216
  %0 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !217
  %arrayidx.i = getelementptr i8, ptr %0, i32 %r.0.i, !dbg !217
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !217
  %mul10.i = shl nuw nsw i32 %r.0.i, 3, !dbg !218
  %add11.i = or disjoint i32 %mul10.i, %k.0.i, !dbg !219
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 40, !dbg !220
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i, !dbg !220
    #dbg_value(i32 5, !221, !DIExpression(), !226)
    #dbg_value(ptr %add.ptr.i, !228, !DIExpression(), !226)
    #dbg_value(i8 %1, !229, !DIExpression(), !226)
    #dbg_value(ptr %add.ptr13.i, !230, !DIExpression(), !226)
    #dbg_value(i8 %1, !231, !DIExpression(), !236)
  %conv.i.i = zext i8 %1 to i32, !dbg !238
  %mul.i.i = mul i32 %conv.i.i, 134480385, !dbg !239
    #dbg_value(i32 %mul.i.i, !240, !DIExpression(), !236)
    #dbg_value(i32 -252645136, !241, !DIExpression(), !236)
  %and.i.i = and i32 %mul.i.i, -252645136, !dbg !242
    #dbg_value(i32 %and.i.i, !243, !DIExpression(), !236)
  %shr.i.i = lshr exact i32 %and.i.i, 4, !dbg !244
  %shr1.i.i = lshr exact i32 %and.i.i, 3, !dbg !245
  %2 = xor i32 %shr.i.i, %shr1.i.i, !dbg !246
  %xor2.i.i = xor i32 %2, %mul.i.i, !dbg !246
    #dbg_value(i32 %xor2.i.i, !247, !DIExpression(), !226)
    #dbg_value(i64 1229782938247303441, !248, !DIExpression(), !226)
    #dbg_value(i32 0, !249, !DIExpression(), !251)
  br label %for.cond.i1, !dbg !252

for.cond.i1:                                      ; preds = %for.body.i, %for.body6.i
  %i.0.i = phi i32 [ 0, %for.body6.i ], [ %inc.i5, %for.body.i ], !dbg !253
    #dbg_value(i32 %i.0.i, !249, !DIExpression(), !251)
  %exitcond.i2 = icmp ne i32 %i.0.i, 5, !dbg !254
  br i1 %exitcond.i2, label %for.body.i, label %m_vec_mul_add.exit, !dbg !256

for.body.i:                                       ; preds = %for.cond.i1
  %arrayidx.i3 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !257
  %3 = load i64, ptr %arrayidx.i3, align 8, !dbg !257
  %and.i = and i64 %3, 1229782938247303441, !dbg !259
  %and1.i = and i32 %xor2.i.i, 255, !dbg !260
  %conv.i = zext nneg i32 %and1.i to i64, !dbg !261
  %mul.i4 = mul i64 %and.i, %conv.i, !dbg !262
  %shr.i = lshr i64 %3, 1, !dbg !263
  %and3.i = and i64 %shr.i, 1229782938247303441, !dbg !264
  %shr4.i = lshr i32 %xor2.i.i, 8, !dbg !265
  %and5.i = and i32 %shr4.i, 15, !dbg !266
  %conv6.i = zext nneg i32 %and5.i to i64, !dbg !267
  %mul7.i = mul nuw i64 %and3.i, %conv6.i, !dbg !268
  %xor.i = xor i64 %mul.i4, %mul7.i, !dbg !269
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !270
  %4 = load i64, ptr %arrayidx8.i, align 8, !dbg !270
  %shr9.i = lshr i64 %4, 2, !dbg !271
  %and10.i = and i64 %shr9.i, 1229782938247303441, !dbg !272
  %shr11.i = lshr i32 %xor2.i.i, 16, !dbg !273
  %and12.i = and i32 %shr11.i, 15, !dbg !274
  %conv13.i = zext nneg i32 %and12.i to i64, !dbg !275
  %mul14.i = mul nuw i64 %and10.i, %conv13.i, !dbg !276
  %xor15.i = xor i64 %xor.i, %mul14.i, !dbg !277
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i, !dbg !278
  %5 = load i64, ptr %arrayidx16.i, align 8, !dbg !278
  %shr17.i = lshr i64 %5, 3, !dbg !279
  %and18.i = and i64 %shr17.i, 1229782938247303441, !dbg !280
  %shr19.i = lshr i32 %xor2.i.i, 24, !dbg !281
  %and20.i = and i32 %shr19.i, 15, !dbg !282
  %conv21.i = zext nneg i32 %and20.i to i64, !dbg !283
  %mul22.i = mul nuw i64 %and18.i, %conv21.i, !dbg !284
  %xor23.i = xor i64 %xor15.i, %mul22.i, !dbg !285
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i, !dbg !286
  %6 = load i64, ptr %arrayidx24.i, align 8, !dbg !287
  %xor25.i = xor i64 %6, %xor23.i, !dbg !287
  store i64 %xor25.i, ptr %arrayidx24.i, align 8, !dbg !287
  %inc.i5 = add nuw nsw i32 %i.0.i, 1, !dbg !288
    #dbg_value(i32 %inc.i5, !249, !DIExpression(), !251)
  br label %for.cond.i1, !dbg !289, !llvm.loop !290

m_vec_mul_add.exit:                               ; preds = %for.cond.i1
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !293
    #dbg_value(i32 %add14.i, !208, !DIExpression(), !209)
  br label %for.cond4.i, !dbg !294, !llvm.loop !295

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i = add nuw nsw i32 %c.0.i, 1, !dbg !297
    #dbg_value(i32 %inc.i, !200, !DIExpression(), !201)
  br label %for.cond1.i, !dbg !298, !llvm.loop !299

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !301
    #dbg_value(i32 %inc18.i, !188, !DIExpression(), !190)
  br label %for.cond.i, !dbg !302, !llvm.loop !303

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %for.cond.i
  ret void, !dbg !305
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !306
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P = alloca [18525 x i64], align 16, !llvmbmc.var !307
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
  %P1 = alloca [18525 x i64], align 16, !llvmbmc.var !307
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
  %O = alloca [624 x i8], align 16, !llvmbmc.var !308
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  %byte010 = getelementptr inbounds i8, ptr %O, i32 0
  store i8 13, ptr %byte010, align 1
  %P3 = alloca [320 x i64], align 16, !llvmbmc.var !309
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  call fastcc void @compute_P3(ptr %p_buf, ptr %P, ptr %P1, ptr %O, ptr %P3)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !310 {
entry:
    #dbg_value(ptr %dst, !314, !DIExpression(), !315)
    #dbg_value(i8 %val, !316, !DIExpression(), !315)
    #dbg_value(i32 %len, !317, !DIExpression(), !315)
    #dbg_value(ptr %dst, !318, !DIExpression(), !315)
    #dbg_value(i32 0, !319, !DIExpression(), !321)
  br label %for.cond, !dbg !322

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !323
    #dbg_value(i32 %i.0, !319, !DIExpression(), !321)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !324
  br i1 %exitcond, label %for.body, label %for.end, !dbg !326

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !327
  store i8 %val, ptr %arrayidx, align 1, !dbg !328
  %inc = add i32 %i.0, 1, !dbg !329
    #dbg_value(i32 %inc, !319, !DIExpression(), !321)
  br label %for.cond, !dbg !330, !llvm.loop !331

for.end:                                          ; preds = %for.cond
  ret void, !dbg !333
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !334 {
entry:
    #dbg_value(ptr %dst, !339, !DIExpression(), !340)
    #dbg_value(ptr %src, !341, !DIExpression(), !340)
    #dbg_value(i32 %len, !342, !DIExpression(), !340)
    #dbg_value(ptr %dst, !343, !DIExpression(), !340)
    #dbg_value(ptr %src, !344, !DIExpression(), !340)
    #dbg_value(i32 0, !347, !DIExpression(), !349)
  br label %for.cond, !dbg !350

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !351
    #dbg_value(i32 %i.0, !347, !DIExpression(), !349)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !352
  br i1 %exitcond, label %for.body, label %for.end, !dbg !354

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !355
  %0 = load i8, ptr %arrayidx, align 1, !dbg !355
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !356
  store i8 %0, ptr %arrayidx1, align 1, !dbg !357
  %inc = add i32 %i.0, 1, !dbg !358
    #dbg_value(i32 %inc, !347, !DIExpression(), !349)
  br label %for.cond, !dbg !359, !llvm.loop !360

for.end:                                          ; preds = %for.cond
  ret void, !dbg !362
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
!176 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !177, file: !131, line: 47, type: !173)
!177 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !131, file: !131, line: 47, type: !178, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !173, !50, !165, !6, !173, !173, !173}
!180 = !DILocation(line: 0, scope: !177, inlinedAt: !181)
!181 = distinct !DILocation(line: 278, column: 5, scope: !130)
!182 = !DILocalVariable(name: "mat", arg: 2, scope: !177, file: !131, line: 47, type: !50)
!183 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !177, file: !131, line: 47, type: !165)
!184 = !DILocalVariable(name: "acc", arg: 4, scope: !177, file: !131, line: 47, type: !6)
!185 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !177, file: !131, line: 48, type: !173)
!186 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !177, file: !131, line: 48, type: !173)
!187 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !177, file: !131, line: 48, type: !173)
!188 = !DILocalVariable(name: "r", scope: !189, file: !131, line: 50, type: !46)
!189 = distinct !DILexicalBlock(scope: !177, file: !131, line: 50, column: 5)
!190 = !DILocation(line: 0, scope: !189, inlinedAt: !181)
!191 = !DILocation(line: 50, column: 10, scope: !189, inlinedAt: !181)
!192 = !DILocation(line: 50, scope: !189, inlinedAt: !181)
!193 = !DILocation(line: 50, column: 23, scope: !194, inlinedAt: !181)
!194 = distinct !DILexicalBlock(scope: !189, file: !131, line: 50, column: 5)
!195 = !DILocation(line: 50, column: 5, scope: !189, inlinedAt: !181)
!196 = !DILocation(line: 51, column: 9, scope: !197, inlinedAt: !181)
!197 = distinct !DILexicalBlock(scope: !198, file: !131, line: 51, column: 9)
!198 = distinct !DILexicalBlock(scope: !194, file: !131, line: 50, column: 40)
!199 = !DILocation(line: 51, scope: !197, inlinedAt: !181)
!200 = !DILocalVariable(name: "c", scope: !197, file: !131, line: 51, type: !46)
!201 = !DILocation(line: 0, scope: !197, inlinedAt: !181)
!202 = !DILocation(line: 51, column: 27, scope: !203, inlinedAt: !181)
!203 = distinct !DILexicalBlock(scope: !197, file: !131, line: 51, column: 9)
!204 = !DILocation(line: 52, column: 13, scope: !205, inlinedAt: !181)
!205 = distinct !DILexicalBlock(scope: !206, file: !131, line: 52, column: 13)
!206 = distinct !DILexicalBlock(scope: !203, file: !131, line: 51, column: 44)
!207 = !DILocation(line: 52, scope: !205, inlinedAt: !181)
!208 = !DILocalVariable(name: "k", scope: !205, file: !131, line: 52, type: !46)
!209 = !DILocation(line: 0, scope: !205, inlinedAt: !181)
!210 = !DILocation(line: 52, column: 31, scope: !211, inlinedAt: !181)
!211 = distinct !DILexicalBlock(scope: !205, file: !131, line: 52, column: 13)
!212 = !DILocation(line: 53, column: 70, scope: !213, inlinedAt: !181)
!213 = distinct !DILexicalBlock(scope: !211, file: !131, line: 52, column: 54)
!214 = !DILocation(line: 53, column: 84, scope: !213, inlinedAt: !181)
!215 = !DILocation(line: 53, column: 51, scope: !213, inlinedAt: !181)
!216 = !DILocation(line: 53, column: 96, scope: !213, inlinedAt: !181)
!217 = !DILocation(line: 53, column: 90, scope: !213, inlinedAt: !181)
!218 = !DILocation(line: 53, column: 136, scope: !213, inlinedAt: !181)
!219 = !DILocation(line: 53, column: 150, scope: !213, inlinedAt: !181)
!220 = !DILocation(line: 53, column: 117, scope: !213, inlinedAt: !181)
!221 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !222, file: !223, line: 31, type: !46)
!222 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !223, file: !223, line: 31, type: !224, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!223 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!224 = !DISubroutineType(types: !225)
!225 = !{null, !46, !165, !15, !6}
!226 = !DILocation(line: 0, scope: !222, inlinedAt: !227)
!227 = distinct !DILocation(line: 53, column: 17, scope: !213, inlinedAt: !181)
!228 = !DILocalVariable(name: "in", arg: 2, scope: !222, file: !223, line: 31, type: !165)
!229 = !DILocalVariable(name: "a", arg: 3, scope: !222, file: !223, line: 31, type: !15)
!230 = !DILocalVariable(name: "acc", arg: 4, scope: !222, file: !223, line: 31, type: !6)
!231 = !DILocalVariable(name: "b", arg: 1, scope: !232, file: !233, line: 136, type: !13)
!232 = distinct !DISubprogram(name: "mul_table", scope: !233, file: !233, line: 136, type: !234, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!233 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!234 = !DISubroutineType(types: !235)
!235 = !{!20, !13}
!236 = !DILocation(line: 0, scope: !232, inlinedAt: !237)
!237 = distinct !DILocation(line: 33, column: 20, scope: !222, inlinedAt: !227)
!238 = !DILocation(line: 137, column: 19, scope: !232, inlinedAt: !237)
!239 = !DILocation(line: 137, column: 33, scope: !232, inlinedAt: !237)
!240 = !DILocalVariable(name: "x", scope: !232, file: !233, line: 137, type: !20)
!241 = !DILocalVariable(name: "high_nibble_mask", scope: !232, file: !233, line: 139, type: !20)
!242 = !DILocation(line: 141, column: 28, scope: !232, inlinedAt: !237)
!243 = !DILocalVariable(name: "high_half", scope: !232, file: !233, line: 141, type: !20)
!244 = !DILocation(line: 142, column: 28, scope: !232, inlinedAt: !237)
!245 = !DILocation(line: 142, column: 47, scope: !232, inlinedAt: !237)
!246 = !DILocation(line: 142, column: 34, scope: !232, inlinedAt: !237)
!247 = !DILocalVariable(name: "tab", scope: !222, file: !223, line: 33, type: !20)
!248 = !DILocalVariable(name: "lsb_ask", scope: !222, file: !223, line: 35, type: !7)
!249 = !DILocalVariable(name: "i", scope: !250, file: !223, line: 37, type: !46)
!250 = distinct !DILexicalBlock(scope: !222, file: !223, line: 37, column: 5)
!251 = !DILocation(line: 0, scope: !250, inlinedAt: !227)
!252 = !DILocation(line: 37, column: 9, scope: !250, inlinedAt: !227)
!253 = !DILocation(line: 37, scope: !250, inlinedAt: !227)
!254 = !DILocation(line: 37, column: 20, scope: !255, inlinedAt: !227)
!255 = distinct !DILexicalBlock(scope: !250, file: !223, line: 37, column: 5)
!256 = !DILocation(line: 37, column: 5, scope: !250, inlinedAt: !227)
!257 = !DILocation(line: 38, column: 21, scope: !258, inlinedAt: !227)
!258 = distinct !DILexicalBlock(scope: !255, file: !223, line: 37, column: 43)
!259 = !DILocation(line: 38, column: 33, scope: !258, inlinedAt: !227)
!260 = !DILocation(line: 38, column: 51, scope: !258, inlinedAt: !227)
!261 = !DILocation(line: 38, column: 46, scope: !258, inlinedAt: !227)
!262 = !DILocation(line: 38, column: 44, scope: !258, inlinedAt: !227)
!263 = !DILocation(line: 39, column: 27, scope: !258, inlinedAt: !227)
!264 = !DILocation(line: 39, column: 33, scope: !258, inlinedAt: !227)
!265 = !DILocation(line: 39, column: 52, scope: !258, inlinedAt: !227)
!266 = !DILocation(line: 39, column: 59, scope: !258, inlinedAt: !227)
!267 = !DILocation(line: 39, column: 46, scope: !258, inlinedAt: !227)
!268 = !DILocation(line: 39, column: 44, scope: !258, inlinedAt: !227)
!269 = !DILocation(line: 39, column: 17, scope: !258, inlinedAt: !227)
!270 = !DILocation(line: 40, column: 21, scope: !258, inlinedAt: !227)
!271 = !DILocation(line: 40, column: 27, scope: !258, inlinedAt: !227)
!272 = !DILocation(line: 40, column: 33, scope: !258, inlinedAt: !227)
!273 = !DILocation(line: 40, column: 52, scope: !258, inlinedAt: !227)
!274 = !DILocation(line: 40, column: 59, scope: !258, inlinedAt: !227)
!275 = !DILocation(line: 40, column: 46, scope: !258, inlinedAt: !227)
!276 = !DILocation(line: 40, column: 44, scope: !258, inlinedAt: !227)
!277 = !DILocation(line: 40, column: 17, scope: !258, inlinedAt: !227)
!278 = !DILocation(line: 41, column: 21, scope: !258, inlinedAt: !227)
!279 = !DILocation(line: 41, column: 27, scope: !258, inlinedAt: !227)
!280 = !DILocation(line: 41, column: 33, scope: !258, inlinedAt: !227)
!281 = !DILocation(line: 41, column: 52, scope: !258, inlinedAt: !227)
!282 = !DILocation(line: 41, column: 59, scope: !258, inlinedAt: !227)
!283 = !DILocation(line: 41, column: 46, scope: !258, inlinedAt: !227)
!284 = !DILocation(line: 41, column: 44, scope: !258, inlinedAt: !227)
!285 = !DILocation(line: 41, column: 17, scope: !258, inlinedAt: !227)
!286 = !DILocation(line: 38, column: 9, scope: !258, inlinedAt: !227)
!287 = !DILocation(line: 38, column: 16, scope: !258, inlinedAt: !227)
!288 = !DILocation(line: 37, column: 40, scope: !255, inlinedAt: !227)
!289 = !DILocation(line: 37, column: 5, scope: !255, inlinedAt: !227)
!290 = distinct !{!290, !256, !291, !292}
!291 = !DILocation(line: 42, column: 5, scope: !250, inlinedAt: !227)
!292 = !{!"llvm.loop.mustprogress"}
!293 = !DILocation(line: 52, column: 48, scope: !211, inlinedAt: !181)
!294 = !DILocation(line: 52, column: 13, scope: !211, inlinedAt: !181)
!295 = distinct !{!295, !204, !296, !292}
!296 = !DILocation(line: 54, column: 13, scope: !205, inlinedAt: !181)
!297 = !DILocation(line: 51, column: 40, scope: !203, inlinedAt: !181)
!298 = !DILocation(line: 51, column: 9, scope: !203, inlinedAt: !181)
!299 = distinct !{!299, !196, !300, !292}
!300 = !DILocation(line: 55, column: 9, scope: !197, inlinedAt: !181)
!301 = !DILocation(line: 50, column: 36, scope: !194, inlinedAt: !181)
!302 = !DILocation(line: 50, column: 5, scope: !194, inlinedAt: !181)
!303 = distinct !{!303, !195, !304, !292}
!304 = !DILocation(line: 56, column: 5, scope: !189, inlinedAt: !181)
!305 = !DILocation(line: 281, column: 1, scope: !130)
!306 = !{!"p_buf"}
!307 = !{!"P"}
!308 = !{!"O"}
!309 = !{!"P3"}
!310 = distinct !DISubprogram(name: "mayo_memset", scope: !311, file: !311, line: 3, type: !312, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!311 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!312 = !DISubroutineType(types: !313)
!313 = !{null, !70, !13, !20}
!314 = !DILocalVariable(name: "dst", arg: 1, scope: !310, file: !311, line: 3, type: !70)
!315 = !DILocation(line: 0, scope: !310)
!316 = !DILocalVariable(name: "val", arg: 2, scope: !310, file: !311, line: 3, type: !13)
!317 = !DILocalVariable(name: "len", arg: 3, scope: !310, file: !311, line: 3, type: !20)
!318 = !DILocalVariable(name: "d", scope: !310, file: !311, line: 5, type: !12)
!319 = !DILocalVariable(name: "i", scope: !320, file: !311, line: 7, type: !20)
!320 = distinct !DILexicalBlock(scope: !310, file: !311, line: 7, column: 5)
!321 = !DILocation(line: 0, scope: !320)
!322 = !DILocation(line: 7, column: 10, scope: !320)
!323 = !DILocation(line: 7, scope: !320)
!324 = !DILocation(line: 7, column: 28, scope: !325)
!325 = distinct !DILexicalBlock(scope: !320, file: !311, line: 7, column: 5)
!326 = !DILocation(line: 7, column: 5, scope: !320)
!327 = !DILocation(line: 8, column: 9, scope: !325)
!328 = !DILocation(line: 8, column: 14, scope: !325)
!329 = !DILocation(line: 7, column: 36, scope: !325)
!330 = !DILocation(line: 7, column: 5, scope: !325)
!331 = distinct !{!331, !326, !332, !292}
!332 = !DILocation(line: 8, column: 16, scope: !320)
!333 = !DILocation(line: 9, column: 1, scope: !310)
!334 = distinct !DISubprogram(name: "mayo_memcpy", scope: !311, file: !311, line: 11, type: !335, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!335 = !DISubroutineType(types: !336)
!336 = !{null, !70, !337, !20}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 32)
!338 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!339 = !DILocalVariable(name: "dst", arg: 1, scope: !334, file: !311, line: 11, type: !70)
!340 = !DILocation(line: 0, scope: !334)
!341 = !DILocalVariable(name: "src", arg: 2, scope: !334, file: !311, line: 11, type: !337)
!342 = !DILocalVariable(name: "len", arg: 3, scope: !334, file: !311, line: 11, type: !20)
!343 = !DILocalVariable(name: "d", scope: !334, file: !311, line: 13, type: !12)
!344 = !DILocalVariable(name: "s", scope: !334, file: !311, line: 14, type: !345)
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 32)
!346 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!347 = !DILocalVariable(name: "i", scope: !348, file: !311, line: 16, type: !20)
!348 = distinct !DILexicalBlock(scope: !334, file: !311, line: 16, column: 5)
!349 = !DILocation(line: 0, scope: !348)
!350 = !DILocation(line: 16, column: 10, scope: !348)
!351 = !DILocation(line: 16, scope: !348)
!352 = !DILocation(line: 16, column: 28, scope: !353)
!353 = distinct !DILexicalBlock(scope: !348, file: !311, line: 16, column: 5)
!354 = !DILocation(line: 16, column: 5, scope: !348)
!355 = !DILocation(line: 17, column: 16, scope: !353)
!356 = !DILocation(line: 17, column: 9, scope: !353)
!357 = !DILocation(line: 17, column: 14, scope: !353)
!358 = !DILocation(line: 16, column: 36, scope: !353)
!359 = !DILocation(line: 16, column: 5, scope: !353)
!360 = distinct !{!360, !354, !361, !292}
!361 = !DILocation(line: 17, column: 19, scope: !348)
!362 = !DILocation(line: 18, column: 1, scope: !334)
