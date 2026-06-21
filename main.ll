; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !12, !DIExpression(), !13)
  store i32 5, ptr %2, align 4, !dbg !13
    #dbg_declare(ptr %3, !14, !DIExpression(), !15)
  store i32 3, ptr %3, align 4, !dbg !15
    #dbg_declare(ptr %4, !16, !DIExpression(), !17)
  %5 = load i32, ptr %2, align 4, !dbg !18
  %6 = load i32, ptr %3, align 4, !dbg !19
  %7 = mul nsw i32 %5, %6, !dbg !20
  %8 = add nsw i32 %7, 2, !dbg !21
  store i32 %8, ptr %4, align 4, !dbg !17
  %9 = load i32, ptr %4, align 4, !dbg !22
  ret i32 %9, !dbg !23
}

attributes #0 = { noinline nounwind optnone "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-aes,-bf16,-cdecp0,-cdecp1,-cdecp2,-cdecp3,-cdecp4,-cdecp5,-cdecp6,-cdecp7,-crc,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16fml,-fp64,-fullfp16,-hwdiv-arm,-i8mm,-lob,-mve,-mve.fp,-neon,-pacbti,-ras,-sb,-sha2,-vfp2,-vfp3,-vfp3d16,-vfp3sp,-vfp4,-vfp4d16,-vfp4sp" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "main.c", directory: "/home/siddhesh/Desktop/test_qemu", checksumkind: CSK_MD5, checksum: "81bf6110d89855fc40d88423cf65054f")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"min_enum_size", i32 4}
!6 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 2, type: !8, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{}
!12 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 3, type: !10)
!13 = !DILocation(line: 3, column: 7, scope: !7)
!14 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 7, scope: !7)
!16 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 5, type: !10)
!17 = !DILocation(line: 5, column: 7, scope: !7)
!18 = !DILocation(line: 5, column: 16, scope: !7)
!19 = !DILocation(line: 5, column: 20, scope: !7)
!20 = !DILocation(line: 5, column: 18, scope: !7)
!21 = !DILocation(line: 5, column: 22, scope: !7)
!22 = !DILocation(line: 7, column: 10, scope: !7)
!23 = !DILocation(line: 7, column: 3, scope: !7)
