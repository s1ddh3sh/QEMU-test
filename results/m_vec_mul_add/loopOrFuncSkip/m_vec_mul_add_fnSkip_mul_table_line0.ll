; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i32 %m_vec_limbs, !135, !DIExpression(), !136)
    #dbg_value(ptr %in, !137, !DIExpression(), !136)
    #dbg_value(i8 %a, !138, !DIExpression(), !136)
    #dbg_value(ptr %acc, !139, !DIExpression(), !136)
    #dbg_value(i32 0, !140, !DIExpression(), !136)
    #dbg_value(i64 1229782938247303441, !141, !DIExpression(), !136)
    #dbg_value(i32 0, !142, !DIExpression(), !144)
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !146
    #dbg_value(i32 %i.0, !142, !DIExpression(), !144)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !147
  br i1 %exitcond, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !150
  %0 = load i64, ptr %arrayidx, align 8, !dbg !150
  %and = and i64 %0, 1229782938247303441, !dbg !152
  %and1 = and i32 0, 255, !dbg !153
  %conv = zext nneg i32 %and1 to i64, !dbg !154
  %mul = mul i64 %and, %conv, !dbg !155
  %shr = lshr i64 %0, 1, !dbg !156
  %and3 = and i64 %shr, 1229782938247303441, !dbg !157
  %shr4 = lshr i32 0, 8, !dbg !158
  %and5 = and i32 %shr4, 15, !dbg !159
  %conv6 = zext nneg i32 %and5 to i64, !dbg !160
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !161
  %xor = xor i64 %mul, %mul7, !dbg !162
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !163
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !163
  %shr9 = lshr i64 %1, 2, !dbg !164
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !165
  %shr11 = lshr i32 0, 16, !dbg !166
  %and12 = and i32 %shr11, 15, !dbg !167
  %conv13 = zext nneg i32 %and12 to i64, !dbg !168
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !169
  %xor15 = xor i64 %xor, %mul14, !dbg !170
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !171
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !171
  %shr17 = lshr i64 %2, 3, !dbg !172
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !173
  %shr19 = lshr i32 0, 24, !dbg !174
  %and20 = and i32 %shr19, 15, !dbg !175
  %conv21 = zext nneg i32 %and20 to i64, !dbg !176
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !177
  %xor23 = xor i64 %xor15, %mul22, !dbg !178
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !179
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !180
  %xor25 = xor i64 %3, %xor23, !dbg !180
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !180
  %inc = add nuw nsw i32 %i.0, 1, !dbg !181
    #dbg_value(i32 %inc, !142, !DIExpression(), !144)
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  ret void, !dbg !186
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16, !llvmbmc.var !187
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %byte0 = getelementptr inbounds i8, ptr %sk, i32 0
  store i8 -80, ptr %byte0, align 1
  %byte1 = getelementptr inbounds i8, ptr %sk, i32 1
  store i8 78, ptr %byte1, align 1
  %byte2 = getelementptr inbounds i8, ptr %sk, i32 2
  store i8 25, ptr %byte2, align 1
  %byte3 = getelementptr inbounds i8, ptr %sk, i32 3
  store i8 47, ptr %byte3, align 1
  %byte4 = getelementptr inbounds i8, ptr %sk, i32 4
  store i8 4, ptr %byte4, align 1
  %byte5 = getelementptr inbounds i8, ptr %sk, i32 5
  store i8 19, ptr %byte5, align 1
  %byte6 = getelementptr inbounds i8, ptr %sk, i32 6
  store i8 -91, ptr %byte6, align 1
  %byte7 = getelementptr inbounds i8, ptr %sk, i32 7
  store i8 23, ptr %byte7, align 1
  %Pv = alloca [3900 x i64], align 16, !llvmbmc.var !188
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200)
  call fastcc void @m_vec_mul_add(i32 5, ptr %sk, i8 13, ptr %Pv)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !189 {
entry:
    #dbg_value(ptr %dst, !193, !DIExpression(), !194)
    #dbg_value(i8 %val, !195, !DIExpression(), !194)
    #dbg_value(i32 %len, !196, !DIExpression(), !194)
    #dbg_value(ptr %dst, !197, !DIExpression(), !194)
    #dbg_value(i32 0, !198, !DIExpression(), !200)
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !202
    #dbg_value(i32 %i.0, !198, !DIExpression(), !200)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !203
  br i1 %exitcond, label %for.body, label %for.end, !dbg !205

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !206
  store i8 %val, ptr %arrayidx, align 1, !dbg !207
  %inc = add i32 %i.0, 1, !dbg !208
    #dbg_value(i32 %inc, !198, !DIExpression(), !200)
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  ret void, !dbg !212
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !213 {
entry:
    #dbg_value(ptr %dst, !218, !DIExpression(), !219)
    #dbg_value(ptr %src, !220, !DIExpression(), !219)
    #dbg_value(i32 %len, !221, !DIExpression(), !219)
    #dbg_value(ptr %dst, !222, !DIExpression(), !219)
    #dbg_value(ptr %src, !223, !DIExpression(), !219)
    #dbg_value(i32 0, !226, !DIExpression(), !228)
  br label %for.cond, !dbg !229

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !230
    #dbg_value(i32 %i.0, !226, !DIExpression(), !228)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !231
  br i1 %exitcond, label %for.body, label %for.end, !dbg !233

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !234
  %0 = load i8, ptr %arrayidx, align 1, !dbg !234
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !235
  store i8 %0, ptr %arrayidx1, align 1, !dbg !236
  %inc = add i32 %i.0, 1, !dbg !237
    #dbg_value(i32 %inc, !226, !DIExpression(), !228)
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  ret void, !dbg !241
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
!130 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !131, file: !131, line: 31, type: !132, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !46, !134, !15, !6}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!135 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !130, file: !131, line: 31, type: !46)
!136 = !DILocation(line: 0, scope: !130)
!137 = !DILocalVariable(name: "in", arg: 2, scope: !130, file: !131, line: 31, type: !134)
!138 = !DILocalVariable(name: "a", arg: 3, scope: !130, file: !131, line: 31, type: !15)
!139 = !DILocalVariable(name: "acc", arg: 4, scope: !130, file: !131, line: 31, type: !6)
!140 = !DILocalVariable(name: "tab", scope: !130, file: !131, line: 33, type: !20)
!141 = !DILocalVariable(name: "lsb_ask", scope: !130, file: !131, line: 35, type: !7)
!142 = !DILocalVariable(name: "i", scope: !143, file: !131, line: 37, type: !46)
!143 = distinct !DILexicalBlock(scope: !130, file: !131, line: 37, column: 5)
!144 = !DILocation(line: 0, scope: !143)
!145 = !DILocation(line: 37, column: 9, scope: !143)
!146 = !DILocation(line: 37, scope: !143)
!147 = !DILocation(line: 37, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !131, line: 37, column: 5)
!149 = !DILocation(line: 37, column: 5, scope: !143)
!150 = !DILocation(line: 38, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !131, line: 37, column: 43)
!152 = !DILocation(line: 38, column: 33, scope: !151)
!153 = !DILocation(line: 38, column: 51, scope: !151)
!154 = !DILocation(line: 38, column: 46, scope: !151)
!155 = !DILocation(line: 38, column: 44, scope: !151)
!156 = !DILocation(line: 39, column: 27, scope: !151)
!157 = !DILocation(line: 39, column: 33, scope: !151)
!158 = !DILocation(line: 39, column: 52, scope: !151)
!159 = !DILocation(line: 39, column: 59, scope: !151)
!160 = !DILocation(line: 39, column: 46, scope: !151)
!161 = !DILocation(line: 39, column: 44, scope: !151)
!162 = !DILocation(line: 39, column: 17, scope: !151)
!163 = !DILocation(line: 40, column: 21, scope: !151)
!164 = !DILocation(line: 40, column: 27, scope: !151)
!165 = !DILocation(line: 40, column: 33, scope: !151)
!166 = !DILocation(line: 40, column: 52, scope: !151)
!167 = !DILocation(line: 40, column: 59, scope: !151)
!168 = !DILocation(line: 40, column: 46, scope: !151)
!169 = !DILocation(line: 40, column: 44, scope: !151)
!170 = !DILocation(line: 40, column: 17, scope: !151)
!171 = !DILocation(line: 41, column: 21, scope: !151)
!172 = !DILocation(line: 41, column: 27, scope: !151)
!173 = !DILocation(line: 41, column: 33, scope: !151)
!174 = !DILocation(line: 41, column: 52, scope: !151)
!175 = !DILocation(line: 41, column: 59, scope: !151)
!176 = !DILocation(line: 41, column: 46, scope: !151)
!177 = !DILocation(line: 41, column: 44, scope: !151)
!178 = !DILocation(line: 41, column: 17, scope: !151)
!179 = !DILocation(line: 38, column: 9, scope: !151)
!180 = !DILocation(line: 38, column: 16, scope: !151)
!181 = !DILocation(line: 37, column: 40, scope: !148)
!182 = !DILocation(line: 37, column: 5, scope: !148)
!183 = distinct !{!183, !149, !184, !185}
!184 = !DILocation(line: 42, column: 5, scope: !143)
!185 = !{!"llvm.loop.mustprogress"}
!186 = !DILocation(line: 44, column: 1, scope: !130)
!187 = !{!"sk"}
!188 = !{!"Pv"}
!189 = distinct !DISubprogram(name: "mayo_memset", scope: !190, file: !190, line: 3, type: !191, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!190 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!191 = !DISubroutineType(types: !192)
!192 = !{null, !70, !13, !20}
!193 = !DILocalVariable(name: "dst", arg: 1, scope: !189, file: !190, line: 3, type: !70)
!194 = !DILocation(line: 0, scope: !189)
!195 = !DILocalVariable(name: "val", arg: 2, scope: !189, file: !190, line: 3, type: !13)
!196 = !DILocalVariable(name: "len", arg: 3, scope: !189, file: !190, line: 3, type: !20)
!197 = !DILocalVariable(name: "d", scope: !189, file: !190, line: 5, type: !12)
!198 = !DILocalVariable(name: "i", scope: !199, file: !190, line: 7, type: !20)
!199 = distinct !DILexicalBlock(scope: !189, file: !190, line: 7, column: 5)
!200 = !DILocation(line: 0, scope: !199)
!201 = !DILocation(line: 7, column: 10, scope: !199)
!202 = !DILocation(line: 7, scope: !199)
!203 = !DILocation(line: 7, column: 28, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !190, line: 7, column: 5)
!205 = !DILocation(line: 7, column: 5, scope: !199)
!206 = !DILocation(line: 8, column: 9, scope: !204)
!207 = !DILocation(line: 8, column: 14, scope: !204)
!208 = !DILocation(line: 7, column: 36, scope: !204)
!209 = !DILocation(line: 7, column: 5, scope: !204)
!210 = distinct !{!210, !205, !211, !185}
!211 = !DILocation(line: 8, column: 16, scope: !199)
!212 = !DILocation(line: 9, column: 1, scope: !189)
!213 = distinct !DISubprogram(name: "mayo_memcpy", scope: !190, file: !190, line: 11, type: !214, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!214 = !DISubroutineType(types: !215)
!215 = !{null, !70, !216, !20}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 32)
!217 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!218 = !DILocalVariable(name: "dst", arg: 1, scope: !213, file: !190, line: 11, type: !70)
!219 = !DILocation(line: 0, scope: !213)
!220 = !DILocalVariable(name: "src", arg: 2, scope: !213, file: !190, line: 11, type: !216)
!221 = !DILocalVariable(name: "len", arg: 3, scope: !213, file: !190, line: 11, type: !20)
!222 = !DILocalVariable(name: "d", scope: !213, file: !190, line: 13, type: !12)
!223 = !DILocalVariable(name: "s", scope: !213, file: !190, line: 14, type: !224)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!226 = !DILocalVariable(name: "i", scope: !227, file: !190, line: 16, type: !20)
!227 = distinct !DILexicalBlock(scope: !213, file: !190, line: 16, column: 5)
!228 = !DILocation(line: 0, scope: !227)
!229 = !DILocation(line: 16, column: 10, scope: !227)
!230 = !DILocation(line: 16, scope: !227)
!231 = !DILocation(line: 16, column: 28, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !190, line: 16, column: 5)
!233 = !DILocation(line: 16, column: 5, scope: !227)
!234 = !DILocation(line: 17, column: 16, scope: !232)
!235 = !DILocation(line: 17, column: 9, scope: !232)
!236 = !DILocation(line: 17, column: 14, scope: !232)
!237 = !DILocation(line: 16, column: 36, scope: !232)
!238 = !DILocation(line: 16, column: 5, scope: !232)
!239 = distinct !{!239, !233, !240, !185}
!240 = !DILocation(line: 17, column: 19, scope: !227)
!241 = !DILocation(line: 18, column: 1, scope: !213)
