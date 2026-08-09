; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !0

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext i8 @lincomb(ptr noundef nonnull %a, ptr noundef nonnull %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(ptr %a, !134, !DIExpression(), !135)
    #dbg_value(ptr %b, !136, !DIExpression(), !135)
    #dbg_value(i32 8, !137, !DIExpression(), !135)
    #dbg_value(i32 1, !138, !DIExpression(), !135)
    #dbg_value(i8 0, !139, !DIExpression(), !135)
    #dbg_value(i32 0, !140, !DIExpression(), !142)
  br label %iter_0_start

for.end:                                          ; preds = %iter_7_end
  %ret.0.lcssa = phi i8 [ %xor1.i5, %iter_7_end ], !dbg !135
  ret i8 %ret.0.lcssa, !dbg !143

iter_0_start:                                     ; preds = %entry
  br label %for.body.iter0

for.body.iter0:                                   ; preds = %iter_0_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter0 = getelementptr inbounds nuw i8, ptr %a, i32 0, !dbg !144
  %0 = load i8, ptr %arrayidx.iter0, align 1, !dbg !144
  %1 = load i8, ptr %b, align 1, !dbg !147
    #dbg_value(i8 %0, !148, !DIExpression(), !152)
    #dbg_value(i8 %1, !154, !DIExpression(), !152)
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i20 = xor i8 %0, %2, !dbg !156
    #dbg_value(i8 %xor1.i20, !148, !DIExpression(), !152)
  %3 = trunc i8 %xor1.i20 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %4 = and i8 %xor1.i20, 2, !dbg !159
  %mul9.i21 = mul i8 %4, %1, !dbg !160
  %conv10.i22 = select i1 %3, i8 %1, i8 0, !dbg !157
  %xor11.i23 = xor i8 %conv10.i22, %mul9.i21, !dbg !161
    #dbg_value(i8 %xor11.i23, !158, !DIExpression(), !152)
  %5 = and i8 %xor1.i20, 4, !dbg !162
  %mul16.i24 = mul i8 %5, %1, !dbg !163
  %xor18.i25 = xor i8 %mul16.i24, %xor11.i23, !dbg !164
    #dbg_value(i8 %xor18.i25, !158, !DIExpression(), !152)
  %6 = and i8 %xor1.i20, 8, !dbg !165
  %mul23.i26 = mul i8 %6, %1, !dbg !166
  %xor25.i27 = xor i8 %mul23.i26, %xor18.i25, !dbg !167
    #dbg_value(i8 %xor25.i27, !158, !DIExpression(), !152)
    #dbg_value(i8 %xor25.i27, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %7 = lshr i8 %xor25.i27, 4, !dbg !169
  %8 = lshr i8 %xor25.i27, 3, !dbg !170
  %9 = and i8 %8, 14, !dbg !170
  %10 = xor i8 %7, %9, !dbg !171
  %xor25.masked.i28 = and i8 %xor25.i27, 15, !dbg !172
  %11 = xor i8 %10, %xor25.masked.i28, !dbg !172
    #dbg_value(i8 %11, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter0 = getelementptr inbounds nuw i8, ptr %b, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_0_end

iter_0_end:                                       ; preds = %for.body.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.body.iter1

for.body.iter1:                                   ; preds = %iter_1_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter1 = getelementptr inbounds nuw i8, ptr %a, i32 1, !dbg !144
  %12 = load i8, ptr %arrayidx.iter1, align 1, !dbg !144
  %13 = load i8, ptr %add.ptr.iter0, align 1, !dbg !147
    #dbg_value(i8 %12, !148, !DIExpression(), !175)
    #dbg_value(i8 %13, !154, !DIExpression(), !175)
  %14 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !177
  %xor1.i65 = xor i8 %12, %14, !dbg !178
    #dbg_value(i8 %xor1.i65, !148, !DIExpression(), !175)
  %15 = trunc i8 %xor1.i65 to i1, !dbg !179
    #dbg_value(i8 poison, !158, !DIExpression(), !175)
  %16 = and i8 %xor1.i65, 2, !dbg !180
  %mul9.i66 = mul i8 %16, %13, !dbg !181
  %conv10.i67 = select i1 %15, i8 %13, i8 0, !dbg !179
  %xor11.i68 = xor i8 %conv10.i67, %mul9.i66, !dbg !182
    #dbg_value(i8 %xor11.i68, !158, !DIExpression(), !175)
  %17 = and i8 %xor1.i65, 4, !dbg !183
  %mul16.i69 = mul i8 %17, %13, !dbg !184
  %xor18.i70 = xor i8 %mul16.i69, %xor11.i68, !dbg !185
    #dbg_value(i8 %xor18.i70, !158, !DIExpression(), !175)
  %18 = and i8 %xor1.i65, 8, !dbg !186
  %mul23.i71 = mul i8 %18, %13, !dbg !187
  %xor25.i72 = xor i8 %mul23.i71, %xor18.i70, !dbg !188
    #dbg_value(i8 %xor25.i72, !158, !DIExpression(), !175)
    #dbg_value(i8 %xor25.i72, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !175)
  %19 = lshr i8 %xor25.i72, 4, !dbg !189
  %20 = lshr i8 %xor25.i72, 3, !dbg !190
  %21 = and i8 %20, 14, !dbg !190
  %22 = xor i8 %19, %21, !dbg !191
  %xor25.masked.i73 = and i8 %xor25.i72, 15, !dbg !192
  %23 = xor i8 %22, %xor25.masked.i73, !dbg !192
    #dbg_value(i8 %23, !173, !DIExpression(), !175)
    #dbg_value(i8 %23, !193, !DIExpression(), !195)
    #dbg_value(i8 %11, !197, !DIExpression(), !195)
  %xor1.i = xor i8 %23, %11, !dbg !198
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr.iter0, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_1_end

iter_1_end:                                       ; preds = %for.body.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.body.iter2

for.body.iter2:                                   ; preds = %iter_2_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter2 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !144
  %24 = load i8, ptr %arrayidx.iter2, align 1, !dbg !144
  %25 = load i8, ptr %add.ptr.iter1, align 1, !dbg !147
    #dbg_value(i8 %24, !148, !DIExpression(), !199)
    #dbg_value(i8 %25, !154, !DIExpression(), !199)
  %26 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !201
  %xor1.i29 = xor i8 %24, %26, !dbg !202
    #dbg_value(i8 %xor1.i29, !148, !DIExpression(), !199)
  %27 = trunc i8 %xor1.i29 to i1, !dbg !203
    #dbg_value(i8 poison, !158, !DIExpression(), !199)
  %28 = and i8 %xor1.i29, 2, !dbg !204
  %mul9.i30 = mul i8 %28, %25, !dbg !205
  %conv10.i31 = select i1 %27, i8 %25, i8 0, !dbg !203
  %xor11.i32 = xor i8 %conv10.i31, %mul9.i30, !dbg !206
    #dbg_value(i8 %xor11.i32, !158, !DIExpression(), !199)
  %29 = and i8 %xor1.i29, 4, !dbg !207
  %mul16.i33 = mul i8 %29, %25, !dbg !208
  %xor18.i34 = xor i8 %mul16.i33, %xor11.i32, !dbg !209
    #dbg_value(i8 %xor18.i34, !158, !DIExpression(), !199)
  %30 = and i8 %xor1.i29, 8, !dbg !210
  %mul23.i35 = mul i8 %30, %25, !dbg !211
  %xor25.i36 = xor i8 %mul23.i35, %xor18.i34, !dbg !212
    #dbg_value(i8 %xor25.i36, !158, !DIExpression(), !199)
    #dbg_value(i8 %xor25.i36, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !199)
  %31 = lshr i8 %xor25.i36, 4, !dbg !213
  %32 = lshr i8 %xor25.i36, 3, !dbg !214
  %33 = and i8 %32, 14, !dbg !214
  %34 = xor i8 %31, %33, !dbg !215
  %xor25.masked.i37 = and i8 %xor25.i36, 15, !dbg !216
  %35 = xor i8 %34, %xor25.masked.i37, !dbg !216
    #dbg_value(i8 %35, !173, !DIExpression(), !199)
    #dbg_value(i8 %35, !193, !DIExpression(), !217)
    #dbg_value(i8 %xor1.i, !197, !DIExpression(), !217)
  %xor1.i7 = xor i8 %35, %xor1.i, !dbg !219
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr.iter1, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_2_end

iter_2_end:                                       ; preds = %for.body.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.body.iter3

for.body.iter3:                                   ; preds = %iter_3_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter3 = getelementptr inbounds nuw i8, ptr %a, i32 3, !dbg !144
  %36 = load i8, ptr %arrayidx.iter3, align 1, !dbg !144
  %37 = load i8, ptr %add.ptr.iter2, align 1, !dbg !147
    #dbg_value(i8 %36, !148, !DIExpression(), !220)
    #dbg_value(i8 %37, !154, !DIExpression(), !220)
  %38 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !222
  %xor1.i10 = xor i8 %36, %38, !dbg !223
    #dbg_value(i8 %xor1.i10, !148, !DIExpression(), !220)
  %39 = trunc i8 %xor1.i10 to i1, !dbg !224
    #dbg_value(i8 poison, !158, !DIExpression(), !220)
  %40 = and i8 %xor1.i10, 2, !dbg !225
  %mul9.i = mul i8 %40, %37, !dbg !226
  %conv10.i = select i1 %39, i8 %37, i8 0, !dbg !224
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !227
    #dbg_value(i8 %xor11.i, !158, !DIExpression(), !220)
  %41 = and i8 %xor1.i10, 4, !dbg !228
  %mul16.i = mul i8 %41, %37, !dbg !229
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !230
    #dbg_value(i8 %xor18.i, !158, !DIExpression(), !220)
  %42 = and i8 %xor1.i10, 8, !dbg !231
  %mul23.i = mul i8 %42, %37, !dbg !232
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !233
    #dbg_value(i8 %xor25.i, !158, !DIExpression(), !220)
    #dbg_value(i8 %xor25.i, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !220)
  %43 = lshr i8 %xor25.i, 4, !dbg !234
  %44 = lshr i8 %xor25.i, 3, !dbg !235
  %45 = and i8 %44, 14, !dbg !235
  %46 = xor i8 %43, %45, !dbg !236
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !237
  %47 = xor i8 %46, %xor25.masked.i, !dbg !237
    #dbg_value(i8 %47, !173, !DIExpression(), !220)
    #dbg_value(i8 %47, !193, !DIExpression(), !238)
    #dbg_value(i8 %xor1.i7, !197, !DIExpression(), !238)
  %xor1.i4 = xor i8 %47, %xor1.i7, !dbg !240
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr.iter2, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_3_end

iter_3_end:                                       ; preds = %for.body.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.body.iter4

for.body.iter4:                                   ; preds = %iter_4_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter4 = getelementptr inbounds nuw i8, ptr %a, i32 4, !dbg !144
  %48 = load i8, ptr %arrayidx.iter4, align 1, !dbg !144
  %49 = load i8, ptr %add.ptr.iter3, align 1, !dbg !147
    #dbg_value(i8 %48, !148, !DIExpression(), !241)
    #dbg_value(i8 %49, !154, !DIExpression(), !241)
  %50 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !243
  %xor1.i38 = xor i8 %48, %50, !dbg !244
    #dbg_value(i8 %xor1.i38, !148, !DIExpression(), !241)
  %51 = trunc i8 %xor1.i38 to i1, !dbg !245
    #dbg_value(i8 poison, !158, !DIExpression(), !241)
  %52 = and i8 %xor1.i38, 2, !dbg !246
  %mul9.i39 = mul i8 %52, %49, !dbg !247
  %conv10.i40 = select i1 %51, i8 %49, i8 0, !dbg !245
  %xor11.i41 = xor i8 %conv10.i40, %mul9.i39, !dbg !248
    #dbg_value(i8 %xor11.i41, !158, !DIExpression(), !241)
  %53 = and i8 %xor1.i38, 4, !dbg !249
  %mul16.i42 = mul i8 %53, %49, !dbg !250
  %xor18.i43 = xor i8 %mul16.i42, %xor11.i41, !dbg !251
    #dbg_value(i8 %xor18.i43, !158, !DIExpression(), !241)
  %54 = and i8 %xor1.i38, 8, !dbg !252
  %mul23.i44 = mul i8 %54, %49, !dbg !253
  %xor25.i45 = xor i8 %mul23.i44, %xor18.i43, !dbg !254
    #dbg_value(i8 %xor25.i45, !158, !DIExpression(), !241)
    #dbg_value(i8 %xor25.i45, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !241)
  %55 = lshr i8 %xor25.i45, 4, !dbg !255
  %56 = lshr i8 %xor25.i45, 3, !dbg !256
  %57 = and i8 %56, 14, !dbg !256
  %58 = xor i8 %55, %57, !dbg !257
  %xor25.masked.i46 = and i8 %xor25.i45, 15, !dbg !258
  %59 = xor i8 %58, %xor25.masked.i46, !dbg !258
    #dbg_value(i8 %59, !173, !DIExpression(), !241)
    #dbg_value(i8 %59, !193, !DIExpression(), !259)
    #dbg_value(i8 %xor1.i4, !197, !DIExpression(), !259)
  %xor1.i9 = xor i8 %59, %xor1.i4, !dbg !261
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr.iter3, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_4_end

iter_4_end:                                       ; preds = %for.body.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.body.iter5

for.body.iter5:                                   ; preds = %iter_5_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter5 = getelementptr inbounds nuw i8, ptr %a, i32 5, !dbg !144
  %60 = load i8, ptr %arrayidx.iter5, align 1, !dbg !144
  %61 = load i8, ptr %add.ptr.iter4, align 1, !dbg !147
    #dbg_value(i8 %60, !148, !DIExpression(), !262)
    #dbg_value(i8 %61, !154, !DIExpression(), !262)
  %62 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !264
  %xor1.i47 = xor i8 %60, %62, !dbg !265
    #dbg_value(i8 %xor1.i47, !148, !DIExpression(), !262)
  %63 = trunc i8 %xor1.i47 to i1, !dbg !266
    #dbg_value(i8 poison, !158, !DIExpression(), !262)
  %64 = and i8 %xor1.i47, 2, !dbg !267
  %mul9.i48 = mul i8 %64, %61, !dbg !268
  %conv10.i49 = select i1 %63, i8 %61, i8 0, !dbg !266
  %xor11.i50 = xor i8 %conv10.i49, %mul9.i48, !dbg !269
    #dbg_value(i8 %xor11.i50, !158, !DIExpression(), !262)
  %65 = and i8 %xor1.i47, 4, !dbg !270
  %mul16.i51 = mul i8 %65, %61, !dbg !271
  %xor18.i52 = xor i8 %mul16.i51, %xor11.i50, !dbg !272
    #dbg_value(i8 %xor18.i52, !158, !DIExpression(), !262)
  %66 = and i8 %xor1.i47, 8, !dbg !273
  %mul23.i53 = mul i8 %66, %61, !dbg !274
  %xor25.i54 = xor i8 %mul23.i53, %xor18.i52, !dbg !275
    #dbg_value(i8 %xor25.i54, !158, !DIExpression(), !262)
    #dbg_value(i8 %xor25.i54, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !262)
  %67 = lshr i8 %xor25.i54, 4, !dbg !276
  %68 = lshr i8 %xor25.i54, 3, !dbg !277
  %69 = and i8 %68, 14, !dbg !277
  %70 = xor i8 %67, %69, !dbg !278
  %xor25.masked.i55 = and i8 %xor25.i54, 15, !dbg !279
  %71 = xor i8 %70, %xor25.masked.i55, !dbg !279
    #dbg_value(i8 %71, !173, !DIExpression(), !262)
    #dbg_value(i8 %71, !193, !DIExpression(), !280)
    #dbg_value(i8 %xor1.i9, !197, !DIExpression(), !280)
  %xor1.i8 = xor i8 %71, %xor1.i9, !dbg !282
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr.iter4, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_5_end

iter_5_end:                                       ; preds = %for.body.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.body.iter6

for.body.iter6:                                   ; preds = %iter_6_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter6 = getelementptr inbounds nuw i8, ptr %a, i32 6, !dbg !144
  %72 = load i8, ptr %arrayidx.iter6, align 1, !dbg !144
  %73 = load i8, ptr %add.ptr.iter5, align 1, !dbg !147
    #dbg_value(i8 %72, !148, !DIExpression(), !283)
    #dbg_value(i8 %73, !154, !DIExpression(), !283)
  %74 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !285
  %xor1.i56 = xor i8 %72, %74, !dbg !286
    #dbg_value(i8 %xor1.i56, !148, !DIExpression(), !283)
  %75 = trunc i8 %xor1.i56 to i1, !dbg !287
    #dbg_value(i8 poison, !158, !DIExpression(), !283)
  %76 = and i8 %xor1.i56, 2, !dbg !288
  %mul9.i57 = mul i8 %76, %73, !dbg !289
  %conv10.i58 = select i1 %75, i8 %73, i8 0, !dbg !287
  %xor11.i59 = xor i8 %conv10.i58, %mul9.i57, !dbg !290
    #dbg_value(i8 %xor11.i59, !158, !DIExpression(), !283)
  %77 = and i8 %xor1.i56, 4, !dbg !291
  %mul16.i60 = mul i8 %77, %73, !dbg !292
  %xor18.i61 = xor i8 %mul16.i60, %xor11.i59, !dbg !293
    #dbg_value(i8 %xor18.i61, !158, !DIExpression(), !283)
  %78 = and i8 %xor1.i56, 8, !dbg !294
  %mul23.i62 = mul i8 %78, %73, !dbg !295
  %xor25.i63 = xor i8 %mul23.i62, %xor18.i61, !dbg !296
    #dbg_value(i8 %xor25.i63, !158, !DIExpression(), !283)
    #dbg_value(i8 %xor25.i63, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !283)
  %79 = lshr i8 %xor25.i63, 4, !dbg !297
  %80 = lshr i8 %xor25.i63, 3, !dbg !298
  %81 = and i8 %80, 14, !dbg !298
  %82 = xor i8 %79, %81, !dbg !299
  %xor25.masked.i64 = and i8 %xor25.i63, 15, !dbg !300
  %83 = xor i8 %82, %xor25.masked.i64, !dbg !300
    #dbg_value(i8 %83, !173, !DIExpression(), !283)
    #dbg_value(i8 %83, !193, !DIExpression(), !301)
    #dbg_value(i8 %xor1.i8, !197, !DIExpression(), !301)
  %xor1.i6 = xor i8 %83, %xor1.i8, !dbg !303
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr.iter5, i32 1, !dbg !174
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_6_end

iter_6_end:                                       ; preds = %for.body.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.body.iter7

for.body.iter7:                                   ; preds = %iter_7_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter7 = getelementptr inbounds nuw i8, ptr %a, i32 7, !dbg !144
  %84 = load i8, ptr %arrayidx.iter7, align 1, !dbg !144
  %85 = load i8, ptr %add.ptr.iter6, align 1, !dbg !147
    #dbg_value(i8 %84, !148, !DIExpression(), !304)
    #dbg_value(i8 %85, !154, !DIExpression(), !304)
  %86 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !306
  %xor1.i11 = xor i8 %84, %86, !dbg !307
    #dbg_value(i8 %xor1.i11, !148, !DIExpression(), !304)
  %87 = trunc i8 %xor1.i11 to i1, !dbg !308
    #dbg_value(i8 poison, !158, !DIExpression(), !304)
  %88 = and i8 %xor1.i11, 2, !dbg !309
  %mul9.i12 = mul i8 %88, %85, !dbg !310
  %conv10.i13 = select i1 %87, i8 %85, i8 0, !dbg !308
  %xor11.i14 = xor i8 %conv10.i13, %mul9.i12, !dbg !311
    #dbg_value(i8 %xor11.i14, !158, !DIExpression(), !304)
  %89 = and i8 %xor1.i11, 4, !dbg !312
  %mul16.i15 = mul i8 %89, %85, !dbg !313
  %xor18.i16 = xor i8 %mul16.i15, %xor11.i14, !dbg !314
    #dbg_value(i8 %xor18.i16, !158, !DIExpression(), !304)
  %90 = and i8 %xor1.i11, 8, !dbg !315
  %mul23.i17 = mul i8 %90, %85, !dbg !316
  %xor25.i18 = xor i8 %mul23.i17, %xor18.i16, !dbg !317
    #dbg_value(i8 %xor25.i18, !158, !DIExpression(), !304)
    #dbg_value(i8 %xor25.i18, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !304)
  %91 = lshr i8 %xor25.i18, 4, !dbg !318
  %92 = lshr i8 %xor25.i18, 3, !dbg !319
  %93 = and i8 %92, 14, !dbg !319
  %94 = xor i8 %91, %93, !dbg !320
  %xor25.masked.i19 = and i8 %xor25.i18, 15, !dbg !321
  %95 = xor i8 %94, %xor25.masked.i19, !dbg !321
    #dbg_value(i8 %95, !173, !DIExpression(), !304)
    #dbg_value(i8 %95, !193, !DIExpression(), !322)
    #dbg_value(i8 %xor1.i6, !197, !DIExpression(), !322)
  %xor1.i5 = xor i8 %95, %xor1.i6, !dbg !324
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_7_end

iter_7_end:                                       ; preds = %for.body.iter7
  br label %for.end
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %a_buf = alloca [128 x i8], align 16, !llvmbmc.var !325
  call void @mayo_memset(ptr %a_buf, i8 0, i32 128)
  %byte0 = getelementptr inbounds nuw i8, ptr %a_buf, i32 0
  store i8 11, ptr %byte0, align 1
  %x = alloca [860 x i8], align 16, !llvmbmc.var !326
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %0 = call fastcc i8 @lincomb(ptr %a_buf, ptr %x, i32 81, i32 1)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !327 {
entry:
    #dbg_value(ptr %dst, !331, !DIExpression(), !332)
    #dbg_value(i8 %val, !333, !DIExpression(), !332)
    #dbg_value(i32 %len, !334, !DIExpression(), !332)
    #dbg_value(ptr %dst, !335, !DIExpression(), !332)
    #dbg_value(i32 0, !336, !DIExpression(), !338)
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !340
    #dbg_value(i32 %i.0, !336, !DIExpression(), !338)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !341
  br i1 %exitcond, label %for.body, label %for.end, !dbg !343

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !344
  store i8 %val, ptr %arrayidx, align 1, !dbg !345
  %inc = add i32 %i.0, 1, !dbg !346
    #dbg_value(i32 %inc, !336, !DIExpression(), !338)
  br label %for.cond, !dbg !347, !llvm.loop !348

for.end:                                          ; preds = %for.cond
  ret void, !dbg !351
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !352 {
entry:
    #dbg_value(ptr %dst, !357, !DIExpression(), !358)
    #dbg_value(ptr %src, !359, !DIExpression(), !358)
    #dbg_value(i32 %len, !360, !DIExpression(), !358)
    #dbg_value(ptr %dst, !361, !DIExpression(), !358)
    #dbg_value(ptr %src, !362, !DIExpression(), !358)
    #dbg_value(i32 0, !365, !DIExpression(), !367)
  br label %for.cond, !dbg !368

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !369
    #dbg_value(i32 %i.0, !365, !DIExpression(), !367)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !370
  br i1 %exitcond, label %for.body, label %for.end, !dbg !372

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !373
  %0 = load i8, ptr %arrayidx, align 1, !dbg !373
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !374
  store i8 %0, ptr %arrayidx1, align 1, !dbg !375
  %inc = add i32 %i.0, 1, !dbg !376
    #dbg_value(i32 %inc, !365, !DIExpression(), !367)
  br label %for.cond, !dbg !377, !llvm.loop !378

for.end:                                          ; preds = %for.cond
  ret void, !dbg !380
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
!130 = distinct !DISubprogram(name: "lincomb", scope: !131, file: !131, line: 71, type: !132, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!131 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{!15, !19, !19, !10, !10}
!134 = !DILocalVariable(name: "a", arg: 1, scope: !130, file: !131, line: 71, type: !19)
!135 = !DILocation(line: 0, scope: !130)
!136 = !DILocalVariable(name: "b", arg: 2, scope: !130, file: !131, line: 72, type: !19)
!137 = !DILocalVariable(name: "n", arg: 3, scope: !130, file: !131, line: 72, type: !10)
!138 = !DILocalVariable(name: "m", arg: 4, scope: !130, file: !131, line: 72, type: !10)
!139 = !DILocalVariable(name: "ret", scope: !130, file: !131, line: 73, type: !15)
!140 = !DILocalVariable(name: "i", scope: !141, file: !131, line: 74, type: !10)
!141 = distinct !DILexicalBlock(scope: !130, file: !131, line: 74, column: 5)
!142 = !DILocation(line: 0, scope: !141)
!143 = !DILocation(line: 79, column: 5, scope: !130)
!144 = !DILocation(line: 75, column: 27, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !131, line: 74, column: 41)
!146 = distinct !DILexicalBlock(scope: !141, file: !131, line: 74, column: 5)
!147 = !DILocation(line: 75, column: 33, scope: !145)
!148 = !DILocalVariable(name: "a", arg: 1, scope: !149, file: !131, line: 10, type: !15)
!149 = distinct !DISubprogram(name: "mul_f", scope: !131, file: !131, line: 10, type: !150, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!150 = !DISubroutineType(types: !151)
!151 = !{!15, !15, !15}
!152 = !DILocation(line: 0, scope: !149, inlinedAt: !153)
!153 = distinct !DILocation(line: 75, column: 21, scope: !145)
!154 = !DILocalVariable(name: "b", arg: 2, scope: !149, file: !131, line: 10, type: !15)
!155 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !153)
!156 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !153)
!157 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !153)
!158 = !DILocalVariable(name: "p", scope: !149, file: !131, line: 12, type: !15)
!159 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !153)
!160 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !153)
!161 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !153)
!162 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !153)
!163 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !153)
!164 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !153)
!165 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !153)
!166 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !153)
!167 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !153)
!168 = !DILocalVariable(name: "top_p", scope: !149, file: !131, line: 24, type: !15)
!169 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !153)
!170 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !153)
!171 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !153)
!172 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !153)
!173 = !DILocalVariable(name: "out", scope: !149, file: !131, line: 25, type: !15)
!174 = !DILocation(line: 74, column: 35, scope: !146)
!175 = !DILocation(line: 0, scope: !149, inlinedAt: !176)
!176 = distinct !DILocation(line: 75, column: 21, scope: !145)
!177 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !176)
!178 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !176)
!179 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !176)
!180 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !176)
!181 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !176)
!182 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !176)
!183 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !176)
!184 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !176)
!185 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !176)
!186 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !176)
!187 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !176)
!188 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !176)
!189 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !176)
!190 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !176)
!191 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !176)
!192 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !176)
!193 = !DILocalVariable(name: "a", arg: 1, scope: !194, file: !131, line: 44, type: !15)
!194 = distinct !DISubprogram(name: "add_f", scope: !131, file: !131, line: 44, type: !150, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!195 = !DILocation(line: 0, scope: !194, inlinedAt: !196)
!196 = distinct !DILocation(line: 75, column: 15, scope: !145)
!197 = !DILocalVariable(name: "b", arg: 2, scope: !194, file: !131, line: 44, type: !15)
!198 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !196)
!199 = !DILocation(line: 0, scope: !149, inlinedAt: !200)
!200 = distinct !DILocation(line: 75, column: 21, scope: !145)
!201 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !200)
!202 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !200)
!203 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !200)
!204 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !200)
!205 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !200)
!206 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !200)
!207 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !200)
!208 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !200)
!209 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !200)
!210 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !200)
!211 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !200)
!212 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !200)
!213 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !200)
!214 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !200)
!215 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !200)
!216 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !200)
!217 = !DILocation(line: 0, scope: !194, inlinedAt: !218)
!218 = distinct !DILocation(line: 75, column: 15, scope: !145)
!219 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !218)
!220 = !DILocation(line: 0, scope: !149, inlinedAt: !221)
!221 = distinct !DILocation(line: 75, column: 21, scope: !145)
!222 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !221)
!223 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !221)
!224 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !221)
!225 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !221)
!226 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !221)
!227 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !221)
!228 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !221)
!229 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !221)
!230 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !221)
!231 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !221)
!232 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !221)
!233 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !221)
!234 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !221)
!235 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !221)
!236 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !221)
!237 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !221)
!238 = !DILocation(line: 0, scope: !194, inlinedAt: !239)
!239 = distinct !DILocation(line: 75, column: 15, scope: !145)
!240 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !239)
!241 = !DILocation(line: 0, scope: !149, inlinedAt: !242)
!242 = distinct !DILocation(line: 75, column: 21, scope: !145)
!243 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !242)
!244 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !242)
!245 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !242)
!246 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !242)
!247 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !242)
!248 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !242)
!249 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !242)
!250 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !242)
!251 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !242)
!252 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !242)
!253 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !242)
!254 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !242)
!255 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !242)
!256 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !242)
!257 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !242)
!258 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !242)
!259 = !DILocation(line: 0, scope: !194, inlinedAt: !260)
!260 = distinct !DILocation(line: 75, column: 15, scope: !145)
!261 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !260)
!262 = !DILocation(line: 0, scope: !149, inlinedAt: !263)
!263 = distinct !DILocation(line: 75, column: 21, scope: !145)
!264 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !263)
!265 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !263)
!266 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !263)
!267 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !263)
!268 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !263)
!269 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !263)
!270 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !263)
!271 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !263)
!272 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !263)
!273 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !263)
!274 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !263)
!275 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !263)
!276 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !263)
!277 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !263)
!278 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !263)
!279 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !263)
!280 = !DILocation(line: 0, scope: !194, inlinedAt: !281)
!281 = distinct !DILocation(line: 75, column: 15, scope: !145)
!282 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !281)
!283 = !DILocation(line: 0, scope: !149, inlinedAt: !284)
!284 = distinct !DILocation(line: 75, column: 21, scope: !145)
!285 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !284)
!286 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !284)
!287 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !284)
!288 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !284)
!289 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !284)
!290 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !284)
!291 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !284)
!292 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !284)
!293 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !284)
!294 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !284)
!295 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !284)
!296 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !284)
!297 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !284)
!298 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !284)
!299 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !284)
!300 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !284)
!301 = !DILocation(line: 0, scope: !194, inlinedAt: !302)
!302 = distinct !DILocation(line: 75, column: 15, scope: !145)
!303 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !302)
!304 = !DILocation(line: 0, scope: !149, inlinedAt: !305)
!305 = distinct !DILocation(line: 75, column: 21, scope: !145)
!306 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !305)
!307 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !305)
!308 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !305)
!309 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !305)
!310 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !305)
!311 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !305)
!312 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !305)
!313 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !305)
!314 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !305)
!315 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !305)
!316 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !305)
!317 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !305)
!318 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !305)
!319 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !305)
!320 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !305)
!321 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !305)
!322 = !DILocation(line: 0, scope: !194, inlinedAt: !323)
!323 = distinct !DILocation(line: 75, column: 15, scope: !145)
!324 = !DILocation(line: 45, column: 14, scope: !194, inlinedAt: !323)
!325 = !{!"a_buf"}
!326 = !{!"x"}
!327 = distinct !DISubprogram(name: "mayo_memset", scope: !328, file: !328, line: 3, type: !329, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !59)
!328 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!329 = !DISubroutineType(types: !330)
!330 = !{null, !70, !42, !16}
!331 = !DILocalVariable(name: "dst", arg: 1, scope: !327, file: !328, line: 3, type: !70)
!332 = !DILocation(line: 0, scope: !327)
!333 = !DILocalVariable(name: "val", arg: 2, scope: !327, file: !328, line: 3, type: !42)
!334 = !DILocalVariable(name: "len", arg: 3, scope: !327, file: !328, line: 3, type: !16)
!335 = !DILocalVariable(name: "d", scope: !327, file: !328, line: 5, type: !41)
!336 = !DILocalVariable(name: "i", scope: !337, file: !328, line: 7, type: !16)
!337 = distinct !DILexicalBlock(scope: !327, file: !328, line: 7, column: 5)
!338 = !DILocation(line: 0, scope: !337)
!339 = !DILocation(line: 7, column: 10, scope: !337)
!340 = !DILocation(line: 7, scope: !337)
!341 = !DILocation(line: 7, column: 28, scope: !342)
!342 = distinct !DILexicalBlock(scope: !337, file: !328, line: 7, column: 5)
!343 = !DILocation(line: 7, column: 5, scope: !337)
!344 = !DILocation(line: 8, column: 9, scope: !342)
!345 = !DILocation(line: 8, column: 14, scope: !342)
!346 = !DILocation(line: 7, column: 36, scope: !342)
!347 = !DILocation(line: 7, column: 5, scope: !342)
!348 = distinct !{!348, !343, !349, !350}
!349 = !DILocation(line: 8, column: 16, scope: !337)
!350 = !{!"llvm.loop.mustprogress"}
!351 = !DILocation(line: 9, column: 1, scope: !327)
!352 = distinct !DISubprogram(name: "mayo_memcpy", scope: !328, file: !328, line: 11, type: !353, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !59)
!353 = !DISubroutineType(types: !354)
!354 = !{null, !70, !355, !16}
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 32)
!356 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!357 = !DILocalVariable(name: "dst", arg: 1, scope: !352, file: !328, line: 11, type: !70)
!358 = !DILocation(line: 0, scope: !352)
!359 = !DILocalVariable(name: "src", arg: 2, scope: !352, file: !328, line: 11, type: !355)
!360 = !DILocalVariable(name: "len", arg: 3, scope: !352, file: !328, line: 11, type: !16)
!361 = !DILocalVariable(name: "d", scope: !352, file: !328, line: 13, type: !41)
!362 = !DILocalVariable(name: "s", scope: !352, file: !328, line: 14, type: !363)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 32)
!364 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!365 = !DILocalVariable(name: "i", scope: !366, file: !328, line: 16, type: !16)
!366 = distinct !DILexicalBlock(scope: !352, file: !328, line: 16, column: 5)
!367 = !DILocation(line: 0, scope: !366)
!368 = !DILocation(line: 16, column: 10, scope: !366)
!369 = !DILocation(line: 16, scope: !366)
!370 = !DILocation(line: 16, column: 28, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !328, line: 16, column: 5)
!372 = !DILocation(line: 16, column: 5, scope: !366)
!373 = !DILocation(line: 17, column: 16, scope: !371)
!374 = !DILocation(line: 17, column: 9, scope: !371)
!375 = !DILocation(line: 17, column: 14, scope: !371)
!376 = !DILocation(line: 16, column: 36, scope: !371)
!377 = !DILocation(line: 16, column: 5, scope: !371)
!378 = distinct !{!378, !372, !379, !350}
!379 = !DILocation(line: 17, column: 19, scope: !366)
!380 = !DILocation(line: 18, column: 1, scope: !352)
