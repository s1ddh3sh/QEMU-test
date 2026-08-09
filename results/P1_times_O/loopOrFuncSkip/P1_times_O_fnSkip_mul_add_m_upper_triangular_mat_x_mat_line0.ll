; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @P1_times_O(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %O, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(ptr %p, !166, !DIExpression(), !167)
    #dbg_value(ptr %P1, !168, !DIExpression(), !167)
    #dbg_value(ptr %O, !169, !DIExpression(), !167)
    #dbg_value(ptr %acc, !170, !DIExpression(), !167)
  ret void, !dbg !171
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !172
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P = alloca [18525 x i64], align 16, !llvmbmc.var !173
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
  %O = alloca [624 x i8], align 16, !llvmbmc.var !174
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  %byte01 = getelementptr inbounds i8, ptr %O, i32 0
  store i8 13, ptr %byte01, align 1
  %P2 = alloca [18525 x i64], align 16, !llvmbmc.var !173
  call void @mayo_memset(ptr %P2, i8 0, i32 148200)
  call fastcc void @P1_times_O(ptr %p_buf, ptr %P, ptr %O, ptr %P2)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !175 {
entry:
    #dbg_value(ptr %dst, !179, !DIExpression(), !180)
    #dbg_value(i8 %val, !181, !DIExpression(), !180)
    #dbg_value(i32 %len, !182, !DIExpression(), !180)
    #dbg_value(ptr %dst, !183, !DIExpression(), !180)
    #dbg_value(i32 0, !184, !DIExpression(), !186)
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !188
    #dbg_value(i32 %i.0, !184, !DIExpression(), !186)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !189
  br i1 %exitcond, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !192
  store i8 %val, ptr %arrayidx, align 1, !dbg !193
  %inc = add i32 %i.0, 1, !dbg !194
    #dbg_value(i32 %inc, !184, !DIExpression(), !186)
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  ret void, !dbg !199
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !200 {
entry:
    #dbg_value(ptr %dst, !205, !DIExpression(), !206)
    #dbg_value(ptr %src, !207, !DIExpression(), !206)
    #dbg_value(i32 %len, !208, !DIExpression(), !206)
    #dbg_value(ptr %dst, !209, !DIExpression(), !206)
    #dbg_value(ptr %src, !210, !DIExpression(), !206)
    #dbg_value(i32 0, !213, !DIExpression(), !215)
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !217
    #dbg_value(i32 %i.0, !213, !DIExpression(), !215)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !218
  br i1 %exitcond, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !221
  %0 = load i8, ptr %arrayidx, align 1, !dbg !221
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !222
  store i8 %0, ptr %arrayidx1, align 1, !dbg !223
  %inc = add i32 %i.0, 1, !dbg !224
    #dbg_value(i32 %inc, !213, !DIExpression(), !215)
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  ret void, !dbg !228
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
!130 = distinct !DISubprogram(name: "P1_times_O", scope: !131, file: !131, line: 76, type: !132, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !134, !165, !50, !6}
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
!166 = !DILocalVariable(name: "p", arg: 1, scope: !130, file: !131, line: 76, type: !134)
!167 = !DILocation(line: 0, scope: !130)
!168 = !DILocalVariable(name: "P1", arg: 2, scope: !130, file: !131, line: 76, type: !165)
!169 = !DILocalVariable(name: "O", arg: 3, scope: !130, file: !131, line: 76, type: !50)
!170 = !DILocalVariable(name: "acc", arg: 4, scope: !130, file: !131, line: 76, type: !6)
!171 = !DILocation(line: 83, column: 1, scope: !130)
!172 = !{!"p_buf"}
!173 = !{!"P"}
!174 = !{!"O"}
!175 = distinct !DISubprogram(name: "mayo_memset", scope: !176, file: !176, line: 3, type: !177, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!176 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!177 = !DISubroutineType(types: !178)
!178 = !{null, !70, !13, !20}
!179 = !DILocalVariable(name: "dst", arg: 1, scope: !175, file: !176, line: 3, type: !70)
!180 = !DILocation(line: 0, scope: !175)
!181 = !DILocalVariable(name: "val", arg: 2, scope: !175, file: !176, line: 3, type: !13)
!182 = !DILocalVariable(name: "len", arg: 3, scope: !175, file: !176, line: 3, type: !20)
!183 = !DILocalVariable(name: "d", scope: !175, file: !176, line: 5, type: !12)
!184 = !DILocalVariable(name: "i", scope: !185, file: !176, line: 7, type: !20)
!185 = distinct !DILexicalBlock(scope: !175, file: !176, line: 7, column: 5)
!186 = !DILocation(line: 0, scope: !185)
!187 = !DILocation(line: 7, column: 10, scope: !185)
!188 = !DILocation(line: 7, scope: !185)
!189 = !DILocation(line: 7, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !176, line: 7, column: 5)
!191 = !DILocation(line: 7, column: 5, scope: !185)
!192 = !DILocation(line: 8, column: 9, scope: !190)
!193 = !DILocation(line: 8, column: 14, scope: !190)
!194 = !DILocation(line: 7, column: 36, scope: !190)
!195 = !DILocation(line: 7, column: 5, scope: !190)
!196 = distinct !{!196, !191, !197, !198}
!197 = !DILocation(line: 8, column: 16, scope: !185)
!198 = !{!"llvm.loop.mustprogress"}
!199 = !DILocation(line: 9, column: 1, scope: !175)
!200 = distinct !DISubprogram(name: "mayo_memcpy", scope: !176, file: !176, line: 11, type: !201, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!201 = !DISubroutineType(types: !202)
!202 = !{null, !70, !203, !20}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 32)
!204 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!205 = !DILocalVariable(name: "dst", arg: 1, scope: !200, file: !176, line: 11, type: !70)
!206 = !DILocation(line: 0, scope: !200)
!207 = !DILocalVariable(name: "src", arg: 2, scope: !200, file: !176, line: 11, type: !203)
!208 = !DILocalVariable(name: "len", arg: 3, scope: !200, file: !176, line: 11, type: !20)
!209 = !DILocalVariable(name: "d", scope: !200, file: !176, line: 13, type: !12)
!210 = !DILocalVariable(name: "s", scope: !200, file: !176, line: 14, type: !211)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 32)
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!213 = !DILocalVariable(name: "i", scope: !214, file: !176, line: 16, type: !20)
!214 = distinct !DILexicalBlock(scope: !200, file: !176, line: 16, column: 5)
!215 = !DILocation(line: 0, scope: !214)
!216 = !DILocation(line: 16, column: 10, scope: !214)
!217 = !DILocation(line: 16, scope: !214)
!218 = !DILocation(line: 16, column: 28, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !176, line: 16, column: 5)
!220 = !DILocation(line: 16, column: 5, scope: !214)
!221 = !DILocation(line: 17, column: 16, scope: !219)
!222 = !DILocation(line: 17, column: 9, scope: !219)
!223 = !DILocation(line: 17, column: 14, scope: !219)
!224 = !DILocation(line: 16, column: 36, scope: !219)
!225 = !DILocation(line: 16, column: 5, scope: !219)
!226 = distinct !{!226, !220, !227, !198}
!227 = !DILocation(line: 17, column: 19, scope: !214)
!228 = !DILocation(line: 18, column: 1, scope: !200)
