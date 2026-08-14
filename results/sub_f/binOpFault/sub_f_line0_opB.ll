; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i8 %a, !134, !DIExpression(), !135)
    #dbg_value(i8 %b, !136, !DIExpression(), !135)
  %xor1 = xor i8 0, %b, !dbg !137
  ret i8 %xor1, !dbg !138
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %0 = call fastcc i8 @sub_f(i8 7, i8 3)
  %out_cmp = icmp eq i8 %0, 4
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !139 {
entry:
    #dbg_value(ptr %dst, !143, !DIExpression(), !144)
    #dbg_value(i8 %val, !145, !DIExpression(), !144)
    #dbg_value(i32 %len, !146, !DIExpression(), !144)
    #dbg_value(ptr %dst, !147, !DIExpression(), !144)
    #dbg_value(i32 0, !148, !DIExpression(), !150)
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !152
    #dbg_value(i32 %i.0, !148, !DIExpression(), !150)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !153
  br i1 %exitcond, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !156
  store i8 %val, ptr %arrayidx, align 1, !dbg !157
  %inc = add i32 %i.0, 1, !dbg !158
    #dbg_value(i32 %inc, !148, !DIExpression(), !150)
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  ret void, !dbg !163
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !164 {
entry:
    #dbg_value(ptr %dst, !169, !DIExpression(), !170)
    #dbg_value(ptr %src, !171, !DIExpression(), !170)
    #dbg_value(i32 %len, !172, !DIExpression(), !170)
    #dbg_value(ptr %dst, !173, !DIExpression(), !170)
    #dbg_value(ptr %src, !174, !DIExpression(), !170)
    #dbg_value(i32 0, !177, !DIExpression(), !179)
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !181
    #dbg_value(i32 %i.0, !177, !DIExpression(), !179)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !182
  br i1 %exitcond, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !185
  %0 = load i8, ptr %arrayidx, align 1, !dbg !185
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !186
  store i8 %0, ptr %arrayidx1, align 1, !dbg !187
  %inc = add i32 %i.0, 1, !dbg !188
    #dbg_value(i32 %inc, !177, !DIExpression(), !179)
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  ret void, !dbg !192
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
!130 = distinct !DISubprogram(name: "sub_f", scope: !131, file: !131, line: 49, type: !132, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !44, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{!15, !15, !15}
!134 = !DILocalVariable(name: "a", arg: 1, scope: !130, file: !131, line: 49, type: !15)
!135 = !DILocation(line: 0, scope: !130)
!136 = !DILocalVariable(name: "b", arg: 2, scope: !130, file: !131, line: 49, type: !15)
!137 = !DILocation(line: 50, column: 14, scope: !130)
!138 = !DILocation(line: 50, column: 5, scope: !130)
!139 = distinct !DISubprogram(name: "mayo_memset", scope: !140, file: !140, line: 3, type: !141, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!140 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!141 = !DISubroutineType(types: !142)
!142 = !{null, !70, !13, !20}
!143 = !DILocalVariable(name: "dst", arg: 1, scope: !139, file: !140, line: 3, type: !70)
!144 = !DILocation(line: 0, scope: !139)
!145 = !DILocalVariable(name: "val", arg: 2, scope: !139, file: !140, line: 3, type: !13)
!146 = !DILocalVariable(name: "len", arg: 3, scope: !139, file: !140, line: 3, type: !20)
!147 = !DILocalVariable(name: "d", scope: !139, file: !140, line: 5, type: !12)
!148 = !DILocalVariable(name: "i", scope: !149, file: !140, line: 7, type: !20)
!149 = distinct !DILexicalBlock(scope: !139, file: !140, line: 7, column: 5)
!150 = !DILocation(line: 0, scope: !149)
!151 = !DILocation(line: 7, column: 10, scope: !149)
!152 = !DILocation(line: 7, scope: !149)
!153 = !DILocation(line: 7, column: 28, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !140, line: 7, column: 5)
!155 = !DILocation(line: 7, column: 5, scope: !149)
!156 = !DILocation(line: 8, column: 9, scope: !154)
!157 = !DILocation(line: 8, column: 14, scope: !154)
!158 = !DILocation(line: 7, column: 36, scope: !154)
!159 = !DILocation(line: 7, column: 5, scope: !154)
!160 = distinct !{!160, !155, !161, !162}
!161 = !DILocation(line: 8, column: 16, scope: !149)
!162 = !{!"llvm.loop.mustprogress"}
!163 = !DILocation(line: 9, column: 1, scope: !139)
!164 = distinct !DISubprogram(name: "mayo_memcpy", scope: !140, file: !140, line: 11, type: !165, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!165 = !DISubroutineType(types: !166)
!166 = !{null, !70, !167, !20}
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 32)
!168 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!169 = !DILocalVariable(name: "dst", arg: 1, scope: !164, file: !140, line: 11, type: !70)
!170 = !DILocation(line: 0, scope: !164)
!171 = !DILocalVariable(name: "src", arg: 2, scope: !164, file: !140, line: 11, type: !167)
!172 = !DILocalVariable(name: "len", arg: 3, scope: !164, file: !140, line: 11, type: !20)
!173 = !DILocalVariable(name: "d", scope: !164, file: !140, line: 13, type: !12)
!174 = !DILocalVariable(name: "s", scope: !164, file: !140, line: 14, type: !175)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 32)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!177 = !DILocalVariable(name: "i", scope: !178, file: !140, line: 16, type: !20)
!178 = distinct !DILexicalBlock(scope: !164, file: !140, line: 16, column: 5)
!179 = !DILocation(line: 0, scope: !178)
!180 = !DILocation(line: 16, column: 10, scope: !178)
!181 = !DILocation(line: 16, scope: !178)
!182 = !DILocation(line: 16, column: 28, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !140, line: 16, column: 5)
!184 = !DILocation(line: 16, column: 5, scope: !178)
!185 = !DILocation(line: 17, column: 16, scope: !183)
!186 = !DILocation(line: 17, column: 9, scope: !183)
!187 = !DILocation(line: 17, column: 14, scope: !183)
!188 = !DILocation(line: 16, column: 36, scope: !183)
!189 = !DILocation(line: 16, column: 5, scope: !183)
!190 = distinct !{!190, !184, !191, !162}
!191 = !DILocation(line: 17, column: 19, scope: !178)
!192 = !DILocation(line: 18, column: 1, scope: !164)
