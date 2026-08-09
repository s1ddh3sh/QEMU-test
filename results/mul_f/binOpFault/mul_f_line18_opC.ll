; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !0

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i8 %a, !134, !DIExpression(), !135)
    #dbg_value(i8 %b, !136, !DIExpression(), !135)
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !137
  %xor1 = xor i8 %a, %0, !dbg !138
    #dbg_value(i8 %xor1, !134, !DIExpression(), !135)
  %1 = trunc i8 %xor1 to i1, !dbg !139
    #dbg_value(i8 poison, !140, !DIExpression(), !135)
  %2 = and i8 %xor1, 2, !dbg !141
  %mul9 = mul i8 %2, %b, !dbg !142
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !139
  %xor11 = xor i8 %conv10, %mul9, !dbg !143
    #dbg_value(i8 %xor11, !140, !DIExpression(), !135)
  %3 = and i8 %xor1, 4, !dbg !144
  %mul16 = mul i8 %3, %b, !dbg !145
  %xor18 = xor i8 %mul16, %xor11, !dbg !146
    #dbg_value(i8 %xor18, !140, !DIExpression(), !135)
  %4 = and i8 %xor1, 8, !dbg !147
  %mul23 = mul i8 %4, %b, !dbg !148
  %xor25 = xor i8 %mul23, %xor18, !dbg !149
    #dbg_value(i8 %xor25, !140, !DIExpression(), !135)
    #dbg_value(i8 %xor25, !150, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !135)
  %5 = lshr i8 %xor25, 4, !dbg !151
  %6 = lshr i8 %xor25, 3, !dbg !152
  %7 = and i8 %6, 14, !dbg !152
  %8 = xor i8 %5, %7, !dbg !153
  %xor25.masked = and i8 %xor25, 0, !dbg !154
  %9 = xor i8 %8, %xor25.masked, !dbg !154
    #dbg_value(i8 %9, !155, !DIExpression(), !135)
  ret i8 %9, !dbg !156
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %0 = call fastcc i8 @mul_f(i8 0, i8 8)
  %out_cmp = icmp eq i8 %0, 0
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !157 {
entry:
    #dbg_value(ptr %dst, !161, !DIExpression(), !162)
    #dbg_value(i8 %val, !163, !DIExpression(), !162)
    #dbg_value(i32 %len, !164, !DIExpression(), !162)
    #dbg_value(ptr %dst, !165, !DIExpression(), !162)
    #dbg_value(i32 0, !166, !DIExpression(), !168)
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !170
    #dbg_value(i32 %i.0, !166, !DIExpression(), !168)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !171
  br i1 %exitcond, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !174
  store i8 %val, ptr %arrayidx, align 1, !dbg !175
  %inc = add i32 %i.0, 1, !dbg !176
    #dbg_value(i32 %inc, !166, !DIExpression(), !168)
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  ret void, !dbg !181
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !182 {
entry:
    #dbg_value(ptr %dst, !187, !DIExpression(), !188)
    #dbg_value(ptr %src, !189, !DIExpression(), !188)
    #dbg_value(i32 %len, !190, !DIExpression(), !188)
    #dbg_value(ptr %dst, !191, !DIExpression(), !188)
    #dbg_value(ptr %src, !192, !DIExpression(), !188)
    #dbg_value(i32 0, !195, !DIExpression(), !197)
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !199
    #dbg_value(i32 %i.0, !195, !DIExpression(), !197)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !200
  br i1 %exitcond, label %for.body, label %for.end, !dbg !202

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !203
  %0 = load i8, ptr %arrayidx, align 1, !dbg !203
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !204
  store i8 %0, ptr %arrayidx1, align 1, !dbg !205
  %inc = add i32 %i.0, 1, !dbg !206
    #dbg_value(i32 %inc, !195, !DIExpression(), !197)
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  ret void, !dbg !210
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!35, !37, !38, !2, !67, !78, !87, !105, !123, !124}
!llvm.ident = !{!125, !125, !125, !125, !125, !125, !125, !125}
!llvm.module.flags = !{!126, !127, !128, !129}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !2, file: !29, line: 128, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4 = !{!5, !10, !11, !14, !16, !19, !21, !24}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 60, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !8, line: 105, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 56, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 103, baseType: !13)
!13 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !6, line: 48, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !8, line: 79, baseType: !18)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !6, line: 20, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !8, line: 41, baseType: !23)
!23 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !10)
!26 = !{!27, !31, !0}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !2, file: !29, line: 126, type: !30, isLocal: false, isDefinition: true)
!29 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!30 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !16)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !2, file: !29, line: 127, type: !33, isLocal: false, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !5)
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!35 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!38 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !39, globals: !46, splitDebugInlining: false, nameTableKind: None)
!39 = !{!40, !41, !15, !44, !14, !16}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !15)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 214, baseType: !18)
!45 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!46 = !{!47, !53, !61, !63, !65}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "f_tail", scope: !38, file: !49, line: 247, type: !50, isLocal: true, isDefinition: true)
!49 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 32, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !55, file: !56, line: 118, type: !60, isLocal: true, isDefinition: true)
!55 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !56, file: !56, line: 117, type: !57, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!56 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!57 = !DISubroutineType(types: !58)
!58 = !{null, !40}
!59 = !{}
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "even_bytes", scope: !55, file: !56, line: 119, type: !60, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !55, file: !56, line: 120, type: !60, isLocal: true, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "even_half", scope: !55, file: !56, line: 121, type: !60, isLocal: true, isDefinition: true)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !16, !5, !44, !42}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !10, !5, !16, !15}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !44}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !10, !44}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
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
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !10, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!125 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 1, !"min_enum_size", i32 4}
!129 = !{i32 1, !"Code Model", i32 1}
!130 = distinct !DISubprogram(name: "mul_f", scope: !131, file: !131, line: 10, type: !132, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!131 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{!15, !15, !15}
!134 = !DILocalVariable(name: "a", arg: 1, scope: !130, file: !131, line: 10, type: !15)
!135 = !DILocation(line: 0, scope: !130)
!136 = !DILocalVariable(name: "b", arg: 2, scope: !130, file: !131, line: 10, type: !15)
!137 = !DILocation(line: 15, column: 10, scope: !130)
!138 = !DILocation(line: 15, column: 7, scope: !130)
!139 = !DILocation(line: 18, column: 17, scope: !130)
!140 = !DILocalVariable(name: "p", scope: !130, file: !131, line: 12, type: !15)
!141 = !DILocation(line: 19, column: 13, scope: !130)
!142 = !DILocation(line: 19, column: 17, scope: !130)
!143 = !DILocation(line: 19, column: 7, scope: !130)
!144 = !DILocation(line: 20, column: 13, scope: !130)
!145 = !DILocation(line: 20, column: 17, scope: !130)
!146 = !DILocation(line: 20, column: 7, scope: !130)
!147 = !DILocation(line: 21, column: 13, scope: !130)
!148 = !DILocation(line: 21, column: 17, scope: !130)
!149 = !DILocation(line: 21, column: 7, scope: !130)
!150 = !DILocalVariable(name: "top_p", scope: !130, file: !131, line: 24, type: !15)
!151 = !DILocation(line: 25, column: 37, scope: !130)
!152 = !DILocation(line: 25, column: 52, scope: !130)
!153 = !DILocation(line: 25, column: 43, scope: !130)
!154 = !DILocation(line: 25, column: 59, scope: !130)
!155 = !DILocalVariable(name: "out", scope: !130, file: !131, line: 25, type: !15)
!156 = !DILocation(line: 26, column: 5, scope: !130)
!157 = distinct !DISubprogram(name: "mayo_memset", scope: !158, file: !158, line: 3, type: !159, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !59)
!158 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!159 = !DISubroutineType(types: !160)
!160 = !{null, !70, !42, !16}
!161 = !DILocalVariable(name: "dst", arg: 1, scope: !157, file: !158, line: 3, type: !70)
!162 = !DILocation(line: 0, scope: !157)
!163 = !DILocalVariable(name: "val", arg: 2, scope: !157, file: !158, line: 3, type: !42)
!164 = !DILocalVariable(name: "len", arg: 3, scope: !157, file: !158, line: 3, type: !16)
!165 = !DILocalVariable(name: "d", scope: !157, file: !158, line: 5, type: !41)
!166 = !DILocalVariable(name: "i", scope: !167, file: !158, line: 7, type: !16)
!167 = distinct !DILexicalBlock(scope: !157, file: !158, line: 7, column: 5)
!168 = !DILocation(line: 0, scope: !167)
!169 = !DILocation(line: 7, column: 10, scope: !167)
!170 = !DILocation(line: 7, scope: !167)
!171 = !DILocation(line: 7, column: 28, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !158, line: 7, column: 5)
!173 = !DILocation(line: 7, column: 5, scope: !167)
!174 = !DILocation(line: 8, column: 9, scope: !172)
!175 = !DILocation(line: 8, column: 14, scope: !172)
!176 = !DILocation(line: 7, column: 36, scope: !172)
!177 = !DILocation(line: 7, column: 5, scope: !172)
!178 = distinct !{!178, !173, !179, !180}
!179 = !DILocation(line: 8, column: 16, scope: !167)
!180 = !{!"llvm.loop.mustprogress"}
!181 = !DILocation(line: 9, column: 1, scope: !157)
!182 = distinct !DISubprogram(name: "mayo_memcpy", scope: !158, file: !158, line: 11, type: !183, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !59)
!183 = !DISubroutineType(types: !184)
!184 = !{null, !70, !185, !16}
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!187 = !DILocalVariable(name: "dst", arg: 1, scope: !182, file: !158, line: 11, type: !70)
!188 = !DILocation(line: 0, scope: !182)
!189 = !DILocalVariable(name: "src", arg: 2, scope: !182, file: !158, line: 11, type: !185)
!190 = !DILocalVariable(name: "len", arg: 3, scope: !182, file: !158, line: 11, type: !16)
!191 = !DILocalVariable(name: "d", scope: !182, file: !158, line: 13, type: !41)
!192 = !DILocalVariable(name: "s", scope: !182, file: !158, line: 14, type: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 32)
!194 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!195 = !DILocalVariable(name: "i", scope: !196, file: !158, line: 16, type: !16)
!196 = distinct !DILexicalBlock(scope: !182, file: !158, line: 16, column: 5)
!197 = !DILocation(line: 0, scope: !196)
!198 = !DILocation(line: 16, column: 10, scope: !196)
!199 = !DILocation(line: 16, scope: !196)
!200 = !DILocation(line: 16, column: 28, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !158, line: 16, column: 5)
!202 = !DILocation(line: 16, column: 5, scope: !196)
!203 = !DILocation(line: 17, column: 16, scope: !201)
!204 = !DILocation(line: 17, column: 9, scope: !201)
!205 = !DILocation(line: 17, column: 14, scope: !201)
!206 = !DILocation(line: 16, column: 36, scope: !201)
!207 = !DILocation(line: 16, column: 5, scope: !201)
!208 = distinct !{!208, !202, !209, !180}
!209 = !DILocation(line: 17, column: 19, scope: !196)
!210 = !DILocation(line: 18, column: 1, scope: !182)
