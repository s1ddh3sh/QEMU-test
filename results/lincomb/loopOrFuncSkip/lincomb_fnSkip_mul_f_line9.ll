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
    #dbg_value(i8 %0, !147, !DIExpression(), !151)
    #dbg_value(i8 0, !153, !DIExpression(), !151)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter0 = getelementptr inbounds nuw i8, ptr %b, i32 1, !dbg !154
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
  %1 = load i8, ptr %arrayidx.iter1, align 1, !dbg !144
  %2 = load i8, ptr %add.ptr.iter0, align 1, !dbg !155
    #dbg_value(i8 %1, !156, !DIExpression(), !158)
    #dbg_value(i8 %2, !160, !DIExpression(), !158)
  %3 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !161
  %xor1.i56 = xor i8 %1, %3, !dbg !162
    #dbg_value(i8 %xor1.i56, !156, !DIExpression(), !158)
  %4 = trunc i8 %xor1.i56 to i1, !dbg !163
    #dbg_value(i8 poison, !164, !DIExpression(), !158)
  %5 = and i8 %xor1.i56, 2, !dbg !165
  %mul9.i57 = mul i8 %5, %2, !dbg !166
  %conv10.i58 = select i1 %4, i8 %2, i8 0, !dbg !163
  %xor11.i59 = xor i8 %conv10.i58, %mul9.i57, !dbg !167
    #dbg_value(i8 %xor11.i59, !164, !DIExpression(), !158)
  %6 = and i8 %xor1.i56, 4, !dbg !168
  %mul16.i60 = mul i8 %6, %2, !dbg !169
  %xor18.i61 = xor i8 %mul16.i60, %xor11.i59, !dbg !170
    #dbg_value(i8 %xor18.i61, !164, !DIExpression(), !158)
  %7 = and i8 %xor1.i56, 8, !dbg !171
  %mul23.i62 = mul i8 %7, %2, !dbg !172
  %xor25.i63 = xor i8 %mul23.i62, %xor18.i61, !dbg !173
    #dbg_value(i8 %xor25.i63, !164, !DIExpression(), !158)
    #dbg_value(i8 %xor25.i63, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !158)
  %8 = lshr i8 %xor25.i63, 4, !dbg !175
  %9 = lshr i8 %xor25.i63, 3, !dbg !176
  %10 = and i8 %9, 14, !dbg !176
  %11 = xor i8 %8, %10, !dbg !177
  %xor25.masked.i64 = and i8 %xor25.i63, 15, !dbg !178
  %12 = xor i8 %11, %xor25.masked.i64, !dbg !178
    #dbg_value(i8 %12, !179, !DIExpression(), !158)
    #dbg_value(i8 %12, !147, !DIExpression(), !180)
    #dbg_value(i8 %0, !153, !DIExpression(), !180)
  %xor1.i = xor i8 %12, %0, !dbg !182
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr.iter0, i32 1, !dbg !154
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
  %13 = load i8, ptr %arrayidx.iter2, align 1, !dbg !144
  %14 = load i8, ptr %add.ptr.iter1, align 1, !dbg !155
    #dbg_value(i8 %13, !156, !DIExpression(), !183)
    #dbg_value(i8 %14, !160, !DIExpression(), !183)
  %15 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !185
  %xor1.i29 = xor i8 %13, %15, !dbg !186
    #dbg_value(i8 %xor1.i29, !156, !DIExpression(), !183)
  %16 = trunc i8 %xor1.i29 to i1, !dbg !187
    #dbg_value(i8 poison, !164, !DIExpression(), !183)
  %17 = and i8 %xor1.i29, 2, !dbg !188
  %mul9.i30 = mul i8 %17, %14, !dbg !189
  %conv10.i31 = select i1 %16, i8 %14, i8 0, !dbg !187
  %xor11.i32 = xor i8 %conv10.i31, %mul9.i30, !dbg !190
    #dbg_value(i8 %xor11.i32, !164, !DIExpression(), !183)
  %18 = and i8 %xor1.i29, 4, !dbg !191
  %mul16.i33 = mul i8 %18, %14, !dbg !192
  %xor18.i34 = xor i8 %mul16.i33, %xor11.i32, !dbg !193
    #dbg_value(i8 %xor18.i34, !164, !DIExpression(), !183)
  %19 = and i8 %xor1.i29, 8, !dbg !194
  %mul23.i35 = mul i8 %19, %14, !dbg !195
  %xor25.i36 = xor i8 %mul23.i35, %xor18.i34, !dbg !196
    #dbg_value(i8 %xor25.i36, !164, !DIExpression(), !183)
    #dbg_value(i8 %xor25.i36, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !183)
  %20 = lshr i8 %xor25.i36, 4, !dbg !197
  %21 = lshr i8 %xor25.i36, 3, !dbg !198
  %22 = and i8 %21, 14, !dbg !198
  %23 = xor i8 %20, %22, !dbg !199
  %xor25.masked.i37 = and i8 %xor25.i36, 15, !dbg !200
  %24 = xor i8 %23, %xor25.masked.i37, !dbg !200
    #dbg_value(i8 %24, !179, !DIExpression(), !183)
    #dbg_value(i8 %24, !147, !DIExpression(), !201)
    #dbg_value(i8 %xor1.i, !153, !DIExpression(), !201)
  %xor1.i7 = xor i8 %24, %xor1.i, !dbg !203
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr.iter1, i32 1, !dbg !154
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
  %25 = load i8, ptr %arrayidx.iter3, align 1, !dbg !144
  %26 = load i8, ptr %add.ptr.iter2, align 1, !dbg !155
    #dbg_value(i8 %25, !156, !DIExpression(), !204)
    #dbg_value(i8 %26, !160, !DIExpression(), !204)
  %27 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !206
  %xor1.i11 = xor i8 %25, %27, !dbg !207
    #dbg_value(i8 %xor1.i11, !156, !DIExpression(), !204)
  %28 = trunc i8 %xor1.i11 to i1, !dbg !208
    #dbg_value(i8 poison, !164, !DIExpression(), !204)
  %29 = and i8 %xor1.i11, 2, !dbg !209
  %mul9.i12 = mul i8 %29, %26, !dbg !210
  %conv10.i13 = select i1 %28, i8 %26, i8 0, !dbg !208
  %xor11.i14 = xor i8 %conv10.i13, %mul9.i12, !dbg !211
    #dbg_value(i8 %xor11.i14, !164, !DIExpression(), !204)
  %30 = and i8 %xor1.i11, 4, !dbg !212
  %mul16.i15 = mul i8 %30, %26, !dbg !213
  %xor18.i16 = xor i8 %mul16.i15, %xor11.i14, !dbg !214
    #dbg_value(i8 %xor18.i16, !164, !DIExpression(), !204)
  %31 = and i8 %xor1.i11, 8, !dbg !215
  %mul23.i17 = mul i8 %31, %26, !dbg !216
  %xor25.i18 = xor i8 %mul23.i17, %xor18.i16, !dbg !217
    #dbg_value(i8 %xor25.i18, !164, !DIExpression(), !204)
    #dbg_value(i8 %xor25.i18, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !204)
  %32 = lshr i8 %xor25.i18, 4, !dbg !218
  %33 = lshr i8 %xor25.i18, 3, !dbg !219
  %34 = and i8 %33, 14, !dbg !219
  %35 = xor i8 %32, %34, !dbg !220
  %xor25.masked.i19 = and i8 %xor25.i18, 15, !dbg !221
  %36 = xor i8 %35, %xor25.masked.i19, !dbg !221
    #dbg_value(i8 %36, !179, !DIExpression(), !204)
    #dbg_value(i8 %36, !147, !DIExpression(), !222)
    #dbg_value(i8 %xor1.i7, !153, !DIExpression(), !222)
  %xor1.i4 = xor i8 %36, %xor1.i7, !dbg !224
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr.iter2, i32 1, !dbg !154
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
  %37 = load i8, ptr %arrayidx.iter4, align 1, !dbg !144
  %38 = load i8, ptr %add.ptr.iter3, align 1, !dbg !155
    #dbg_value(i8 %37, !156, !DIExpression(), !225)
    #dbg_value(i8 %38, !160, !DIExpression(), !225)
  %39 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !227
  %xor1.i47 = xor i8 %37, %39, !dbg !228
    #dbg_value(i8 %xor1.i47, !156, !DIExpression(), !225)
  %40 = trunc i8 %xor1.i47 to i1, !dbg !229
    #dbg_value(i8 poison, !164, !DIExpression(), !225)
  %41 = and i8 %xor1.i47, 2, !dbg !230
  %mul9.i48 = mul i8 %41, %38, !dbg !231
  %conv10.i49 = select i1 %40, i8 %38, i8 0, !dbg !229
  %xor11.i50 = xor i8 %conv10.i49, %mul9.i48, !dbg !232
    #dbg_value(i8 %xor11.i50, !164, !DIExpression(), !225)
  %42 = and i8 %xor1.i47, 4, !dbg !233
  %mul16.i51 = mul i8 %42, %38, !dbg !234
  %xor18.i52 = xor i8 %mul16.i51, %xor11.i50, !dbg !235
    #dbg_value(i8 %xor18.i52, !164, !DIExpression(), !225)
  %43 = and i8 %xor1.i47, 8, !dbg !236
  %mul23.i53 = mul i8 %43, %38, !dbg !237
  %xor25.i54 = xor i8 %mul23.i53, %xor18.i52, !dbg !238
    #dbg_value(i8 %xor25.i54, !164, !DIExpression(), !225)
    #dbg_value(i8 %xor25.i54, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !225)
  %44 = lshr i8 %xor25.i54, 4, !dbg !239
  %45 = lshr i8 %xor25.i54, 3, !dbg !240
  %46 = and i8 %45, 14, !dbg !240
  %47 = xor i8 %44, %46, !dbg !241
  %xor25.masked.i55 = and i8 %xor25.i54, 15, !dbg !242
  %48 = xor i8 %47, %xor25.masked.i55, !dbg !242
    #dbg_value(i8 %48, !179, !DIExpression(), !225)
    #dbg_value(i8 %48, !147, !DIExpression(), !243)
    #dbg_value(i8 %xor1.i4, !153, !DIExpression(), !243)
  %xor1.i9 = xor i8 %48, %xor1.i4, !dbg !245
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr.iter3, i32 1, !dbg !154
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
  %49 = load i8, ptr %arrayidx.iter5, align 1, !dbg !144
  %50 = load i8, ptr %add.ptr.iter4, align 1, !dbg !155
    #dbg_value(i8 %49, !156, !DIExpression(), !246)
    #dbg_value(i8 %50, !160, !DIExpression(), !246)
  %51 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !248
  %xor1.i38 = xor i8 %49, %51, !dbg !249
    #dbg_value(i8 %xor1.i38, !156, !DIExpression(), !246)
  %52 = trunc i8 %xor1.i38 to i1, !dbg !250
    #dbg_value(i8 poison, !164, !DIExpression(), !246)
  %53 = and i8 %xor1.i38, 2, !dbg !251
  %mul9.i39 = mul i8 %53, %50, !dbg !252
  %conv10.i40 = select i1 %52, i8 %50, i8 0, !dbg !250
  %xor11.i41 = xor i8 %conv10.i40, %mul9.i39, !dbg !253
    #dbg_value(i8 %xor11.i41, !164, !DIExpression(), !246)
  %54 = and i8 %xor1.i38, 4, !dbg !254
  %mul16.i42 = mul i8 %54, %50, !dbg !255
  %xor18.i43 = xor i8 %mul16.i42, %xor11.i41, !dbg !256
    #dbg_value(i8 %xor18.i43, !164, !DIExpression(), !246)
  %55 = and i8 %xor1.i38, 8, !dbg !257
  %mul23.i44 = mul i8 %55, %50, !dbg !258
  %xor25.i45 = xor i8 %mul23.i44, %xor18.i43, !dbg !259
    #dbg_value(i8 %xor25.i45, !164, !DIExpression(), !246)
    #dbg_value(i8 %xor25.i45, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !246)
  %56 = lshr i8 %xor25.i45, 4, !dbg !260
  %57 = lshr i8 %xor25.i45, 3, !dbg !261
  %58 = and i8 %57, 14, !dbg !261
  %59 = xor i8 %56, %58, !dbg !262
  %xor25.masked.i46 = and i8 %xor25.i45, 15, !dbg !263
  %60 = xor i8 %59, %xor25.masked.i46, !dbg !263
    #dbg_value(i8 %60, !179, !DIExpression(), !246)
    #dbg_value(i8 %60, !147, !DIExpression(), !264)
    #dbg_value(i8 %xor1.i9, !153, !DIExpression(), !264)
  %xor1.i8 = xor i8 %60, %xor1.i9, !dbg !266
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr.iter4, i32 1, !dbg !154
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
  %61 = load i8, ptr %arrayidx.iter6, align 1, !dbg !144
  %62 = load i8, ptr %add.ptr.iter5, align 1, !dbg !155
    #dbg_value(i8 %61, !156, !DIExpression(), !267)
    #dbg_value(i8 %62, !160, !DIExpression(), !267)
  %63 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !269
  %xor1.i10 = xor i8 %61, %63, !dbg !270
    #dbg_value(i8 %xor1.i10, !156, !DIExpression(), !267)
  %64 = trunc i8 %xor1.i10 to i1, !dbg !271
    #dbg_value(i8 poison, !164, !DIExpression(), !267)
  %65 = and i8 %xor1.i10, 2, !dbg !272
  %mul9.i = mul i8 %65, %62, !dbg !273
  %conv10.i = select i1 %64, i8 %62, i8 0, !dbg !271
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !274
    #dbg_value(i8 %xor11.i, !164, !DIExpression(), !267)
  %66 = and i8 %xor1.i10, 4, !dbg !275
  %mul16.i = mul i8 %66, %62, !dbg !276
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !277
    #dbg_value(i8 %xor18.i, !164, !DIExpression(), !267)
  %67 = and i8 %xor1.i10, 8, !dbg !278
  %mul23.i = mul i8 %67, %62, !dbg !279
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !280
    #dbg_value(i8 %xor25.i, !164, !DIExpression(), !267)
    #dbg_value(i8 %xor25.i, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !267)
  %68 = lshr i8 %xor25.i, 4, !dbg !281
  %69 = lshr i8 %xor25.i, 3, !dbg !282
  %70 = and i8 %69, 14, !dbg !282
  %71 = xor i8 %68, %70, !dbg !283
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !284
  %72 = xor i8 %71, %xor25.masked.i, !dbg !284
    #dbg_value(i8 %72, !179, !DIExpression(), !267)
    #dbg_value(i8 %72, !147, !DIExpression(), !285)
    #dbg_value(i8 %xor1.i8, !153, !DIExpression(), !285)
  %xor1.i6 = xor i8 %72, %xor1.i8, !dbg !287
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr.iter5, i32 1, !dbg !154
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
  %73 = load i8, ptr %arrayidx.iter7, align 1, !dbg !144
  %74 = load i8, ptr %add.ptr.iter6, align 1, !dbg !155
    #dbg_value(i8 %73, !156, !DIExpression(), !288)
    #dbg_value(i8 %74, !160, !DIExpression(), !288)
  %75 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !290
  %xor1.i20 = xor i8 %73, %75, !dbg !291
    #dbg_value(i8 %xor1.i20, !156, !DIExpression(), !288)
  %76 = trunc i8 %xor1.i20 to i1, !dbg !292
    #dbg_value(i8 poison, !164, !DIExpression(), !288)
  %77 = and i8 %xor1.i20, 2, !dbg !293
  %mul9.i21 = mul i8 %77, %74, !dbg !294
  %conv10.i22 = select i1 %76, i8 %74, i8 0, !dbg !292
  %xor11.i23 = xor i8 %conv10.i22, %mul9.i21, !dbg !295
    #dbg_value(i8 %xor11.i23, !164, !DIExpression(), !288)
  %78 = and i8 %xor1.i20, 4, !dbg !296
  %mul16.i24 = mul i8 %78, %74, !dbg !297
  %xor18.i25 = xor i8 %mul16.i24, %xor11.i23, !dbg !298
    #dbg_value(i8 %xor18.i25, !164, !DIExpression(), !288)
  %79 = and i8 %xor1.i20, 8, !dbg !299
  %mul23.i26 = mul i8 %79, %74, !dbg !300
  %xor25.i27 = xor i8 %mul23.i26, %xor18.i25, !dbg !301
    #dbg_value(i8 %xor25.i27, !164, !DIExpression(), !288)
    #dbg_value(i8 %xor25.i27, !174, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !288)
  %80 = lshr i8 %xor25.i27, 4, !dbg !302
  %81 = lshr i8 %xor25.i27, 3, !dbg !303
  %82 = and i8 %81, 14, !dbg !303
  %83 = xor i8 %80, %82, !dbg !304
  %xor25.masked.i28 = and i8 %xor25.i27, 15, !dbg !305
  %84 = xor i8 %83, %xor25.masked.i28, !dbg !305
    #dbg_value(i8 %84, !179, !DIExpression(), !288)
    #dbg_value(i8 %84, !147, !DIExpression(), !306)
    #dbg_value(i8 %xor1.i6, !153, !DIExpression(), !306)
  %xor1.i5 = xor i8 %84, %xor1.i6, !dbg !308
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
  %a_buf = alloca [128 x i8], align 16, !llvmbmc.var !309
  call void @mayo_memset(ptr %a_buf, i8 0, i32 128)
  %byte0 = getelementptr inbounds nuw i8, ptr %a_buf, i32 0
  store i8 11, ptr %byte0, align 1
  %x = alloca [860 x i8], align 16, !llvmbmc.var !310
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %0 = call fastcc i8 @lincomb(ptr %a_buf, ptr %x, i32 81, i32 1)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !311 {
entry:
    #dbg_value(ptr %dst, !315, !DIExpression(), !316)
    #dbg_value(i8 %val, !317, !DIExpression(), !316)
    #dbg_value(i32 %len, !318, !DIExpression(), !316)
    #dbg_value(ptr %dst, !319, !DIExpression(), !316)
    #dbg_value(i32 0, !320, !DIExpression(), !322)
  br label %for.cond, !dbg !323

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !324
    #dbg_value(i32 %i.0, !320, !DIExpression(), !322)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !325
  br i1 %exitcond, label %for.body, label %for.end, !dbg !327

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !328
  store i8 %val, ptr %arrayidx, align 1, !dbg !329
  %inc = add i32 %i.0, 1, !dbg !330
    #dbg_value(i32 %inc, !320, !DIExpression(), !322)
  br label %for.cond, !dbg !331, !llvm.loop !332

for.end:                                          ; preds = %for.cond
  ret void, !dbg !335
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !336 {
entry:
    #dbg_value(ptr %dst, !341, !DIExpression(), !342)
    #dbg_value(ptr %src, !343, !DIExpression(), !342)
    #dbg_value(i32 %len, !344, !DIExpression(), !342)
    #dbg_value(ptr %dst, !345, !DIExpression(), !342)
    #dbg_value(ptr %src, !346, !DIExpression(), !342)
    #dbg_value(i32 0, !349, !DIExpression(), !351)
  br label %for.cond, !dbg !352

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !353
    #dbg_value(i32 %i.0, !349, !DIExpression(), !351)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !354
  br i1 %exitcond, label %for.body, label %for.end, !dbg !356

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !357
  %0 = load i8, ptr %arrayidx, align 1, !dbg !357
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !358
  store i8 %0, ptr %arrayidx1, align 1, !dbg !359
  %inc = add i32 %i.0, 1, !dbg !360
    #dbg_value(i32 %inc, !349, !DIExpression(), !351)
  br label %for.cond, !dbg !361, !llvm.loop !362

for.end:                                          ; preds = %for.cond
  ret void, !dbg !364
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
!147 = !DILocalVariable(name: "a", arg: 1, scope: !148, file: !131, line: 44, type: !15)
!148 = distinct !DISubprogram(name: "add_f", scope: !131, file: !131, line: 44, type: !149, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!149 = !DISubroutineType(types: !150)
!150 = !{!15, !15, !15}
!151 = !DILocation(line: 0, scope: !148, inlinedAt: !152)
!152 = distinct !DILocation(line: 75, column: 15, scope: !145)
!153 = !DILocalVariable(name: "b", arg: 2, scope: !148, file: !131, line: 44, type: !15)
!154 = !DILocation(line: 74, column: 35, scope: !146)
!155 = !DILocation(line: 75, column: 33, scope: !145)
!156 = !DILocalVariable(name: "a", arg: 1, scope: !157, file: !131, line: 10, type: !15)
!157 = distinct !DISubprogram(name: "mul_f", scope: !131, file: !131, line: 10, type: !149, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!158 = !DILocation(line: 0, scope: !157, inlinedAt: !159)
!159 = distinct !DILocation(line: 75, column: 21, scope: !145)
!160 = !DILocalVariable(name: "b", arg: 2, scope: !157, file: !131, line: 10, type: !15)
!161 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !159)
!162 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !159)
!163 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !159)
!164 = !DILocalVariable(name: "p", scope: !157, file: !131, line: 12, type: !15)
!165 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !159)
!166 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !159)
!167 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !159)
!168 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !159)
!169 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !159)
!170 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !159)
!171 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !159)
!172 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !159)
!173 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !159)
!174 = !DILocalVariable(name: "top_p", scope: !157, file: !131, line: 24, type: !15)
!175 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !159)
!176 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !159)
!177 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !159)
!178 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !159)
!179 = !DILocalVariable(name: "out", scope: !157, file: !131, line: 25, type: !15)
!180 = !DILocation(line: 0, scope: !148, inlinedAt: !181)
!181 = distinct !DILocation(line: 75, column: 15, scope: !145)
!182 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !181)
!183 = !DILocation(line: 0, scope: !157, inlinedAt: !184)
!184 = distinct !DILocation(line: 75, column: 21, scope: !145)
!185 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !184)
!186 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !184)
!187 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !184)
!188 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !184)
!189 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !184)
!190 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !184)
!191 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !184)
!192 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !184)
!193 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !184)
!194 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !184)
!195 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !184)
!196 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !184)
!197 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !184)
!198 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !184)
!199 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !184)
!200 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !184)
!201 = !DILocation(line: 0, scope: !148, inlinedAt: !202)
!202 = distinct !DILocation(line: 75, column: 15, scope: !145)
!203 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !202)
!204 = !DILocation(line: 0, scope: !157, inlinedAt: !205)
!205 = distinct !DILocation(line: 75, column: 21, scope: !145)
!206 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !205)
!207 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !205)
!208 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !205)
!209 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !205)
!210 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !205)
!211 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !205)
!212 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !205)
!213 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !205)
!214 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !205)
!215 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !205)
!216 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !205)
!217 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !205)
!218 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !205)
!219 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !205)
!220 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !205)
!221 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !205)
!222 = !DILocation(line: 0, scope: !148, inlinedAt: !223)
!223 = distinct !DILocation(line: 75, column: 15, scope: !145)
!224 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !223)
!225 = !DILocation(line: 0, scope: !157, inlinedAt: !226)
!226 = distinct !DILocation(line: 75, column: 21, scope: !145)
!227 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !226)
!228 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !226)
!229 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !226)
!230 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !226)
!231 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !226)
!232 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !226)
!233 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !226)
!234 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !226)
!235 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !226)
!236 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !226)
!237 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !226)
!238 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !226)
!239 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !226)
!240 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !226)
!241 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !226)
!242 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !226)
!243 = !DILocation(line: 0, scope: !148, inlinedAt: !244)
!244 = distinct !DILocation(line: 75, column: 15, scope: !145)
!245 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !244)
!246 = !DILocation(line: 0, scope: !157, inlinedAt: !247)
!247 = distinct !DILocation(line: 75, column: 21, scope: !145)
!248 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !247)
!249 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !247)
!250 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !247)
!251 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !247)
!252 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !247)
!253 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !247)
!254 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !247)
!255 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !247)
!256 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !247)
!257 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !247)
!258 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !247)
!259 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !247)
!260 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !247)
!261 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !247)
!262 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !247)
!263 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !247)
!264 = !DILocation(line: 0, scope: !148, inlinedAt: !265)
!265 = distinct !DILocation(line: 75, column: 15, scope: !145)
!266 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !265)
!267 = !DILocation(line: 0, scope: !157, inlinedAt: !268)
!268 = distinct !DILocation(line: 75, column: 21, scope: !145)
!269 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !268)
!270 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !268)
!271 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !268)
!272 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !268)
!273 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !268)
!274 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !268)
!275 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !268)
!276 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !268)
!277 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !268)
!278 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !268)
!279 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !268)
!280 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !268)
!281 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !268)
!282 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !268)
!283 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !268)
!284 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !268)
!285 = !DILocation(line: 0, scope: !148, inlinedAt: !286)
!286 = distinct !DILocation(line: 75, column: 15, scope: !145)
!287 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !286)
!288 = !DILocation(line: 0, scope: !157, inlinedAt: !289)
!289 = distinct !DILocation(line: 75, column: 21, scope: !145)
!290 = !DILocation(line: 15, column: 10, scope: !157, inlinedAt: !289)
!291 = !DILocation(line: 15, column: 7, scope: !157, inlinedAt: !289)
!292 = !DILocation(line: 18, column: 17, scope: !157, inlinedAt: !289)
!293 = !DILocation(line: 19, column: 13, scope: !157, inlinedAt: !289)
!294 = !DILocation(line: 19, column: 17, scope: !157, inlinedAt: !289)
!295 = !DILocation(line: 19, column: 7, scope: !157, inlinedAt: !289)
!296 = !DILocation(line: 20, column: 13, scope: !157, inlinedAt: !289)
!297 = !DILocation(line: 20, column: 17, scope: !157, inlinedAt: !289)
!298 = !DILocation(line: 20, column: 7, scope: !157, inlinedAt: !289)
!299 = !DILocation(line: 21, column: 13, scope: !157, inlinedAt: !289)
!300 = !DILocation(line: 21, column: 17, scope: !157, inlinedAt: !289)
!301 = !DILocation(line: 21, column: 7, scope: !157, inlinedAt: !289)
!302 = !DILocation(line: 25, column: 37, scope: !157, inlinedAt: !289)
!303 = !DILocation(line: 25, column: 52, scope: !157, inlinedAt: !289)
!304 = !DILocation(line: 25, column: 43, scope: !157, inlinedAt: !289)
!305 = !DILocation(line: 25, column: 59, scope: !157, inlinedAt: !289)
!306 = !DILocation(line: 0, scope: !148, inlinedAt: !307)
!307 = distinct !DILocation(line: 75, column: 15, scope: !145)
!308 = !DILocation(line: 45, column: 14, scope: !148, inlinedAt: !307)
!309 = !{!"a_buf"}
!310 = !{!"x"}
!311 = distinct !DISubprogram(name: "mayo_memset", scope: !312, file: !312, line: 3, type: !313, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !59)
!312 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!313 = !DISubroutineType(types: !314)
!314 = !{null, !70, !42, !16}
!315 = !DILocalVariable(name: "dst", arg: 1, scope: !311, file: !312, line: 3, type: !70)
!316 = !DILocation(line: 0, scope: !311)
!317 = !DILocalVariable(name: "val", arg: 2, scope: !311, file: !312, line: 3, type: !42)
!318 = !DILocalVariable(name: "len", arg: 3, scope: !311, file: !312, line: 3, type: !16)
!319 = !DILocalVariable(name: "d", scope: !311, file: !312, line: 5, type: !41)
!320 = !DILocalVariable(name: "i", scope: !321, file: !312, line: 7, type: !16)
!321 = distinct !DILexicalBlock(scope: !311, file: !312, line: 7, column: 5)
!322 = !DILocation(line: 0, scope: !321)
!323 = !DILocation(line: 7, column: 10, scope: !321)
!324 = !DILocation(line: 7, scope: !321)
!325 = !DILocation(line: 7, column: 28, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !312, line: 7, column: 5)
!327 = !DILocation(line: 7, column: 5, scope: !321)
!328 = !DILocation(line: 8, column: 9, scope: !326)
!329 = !DILocation(line: 8, column: 14, scope: !326)
!330 = !DILocation(line: 7, column: 36, scope: !326)
!331 = !DILocation(line: 7, column: 5, scope: !326)
!332 = distinct !{!332, !327, !333, !334}
!333 = !DILocation(line: 8, column: 16, scope: !321)
!334 = !{!"llvm.loop.mustprogress"}
!335 = !DILocation(line: 9, column: 1, scope: !311)
!336 = distinct !DISubprogram(name: "mayo_memcpy", scope: !312, file: !312, line: 11, type: !337, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !59)
!337 = !DISubroutineType(types: !338)
!338 = !{null, !70, !339, !16}
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 32)
!340 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!341 = !DILocalVariable(name: "dst", arg: 1, scope: !336, file: !312, line: 11, type: !70)
!342 = !DILocation(line: 0, scope: !336)
!343 = !DILocalVariable(name: "src", arg: 2, scope: !336, file: !312, line: 11, type: !339)
!344 = !DILocalVariable(name: "len", arg: 3, scope: !336, file: !312, line: 11, type: !16)
!345 = !DILocalVariable(name: "d", scope: !336, file: !312, line: 13, type: !41)
!346 = !DILocalVariable(name: "s", scope: !336, file: !312, line: 14, type: !347)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 32)
!348 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!349 = !DILocalVariable(name: "i", scope: !350, file: !312, line: 16, type: !16)
!350 = distinct !DILexicalBlock(scope: !336, file: !312, line: 16, column: 5)
!351 = !DILocation(line: 0, scope: !350)
!352 = !DILocation(line: 16, column: 10, scope: !350)
!353 = !DILocation(line: 16, scope: !350)
!354 = !DILocation(line: 16, column: 28, scope: !355)
!355 = distinct !DILexicalBlock(scope: !350, file: !312, line: 16, column: 5)
!356 = !DILocation(line: 16, column: 5, scope: !350)
!357 = !DILocation(line: 17, column: 16, scope: !355)
!358 = !DILocation(line: 17, column: 9, scope: !355)
!359 = !DILocation(line: 17, column: 14, scope: !355)
!360 = !DILocation(line: 16, column: 36, scope: !355)
!361 = !DILocation(line: 16, column: 5, scope: !355)
!362 = distinct !{!362, !356, !363, !334}
!363 = !DILocation(line: 17, column: 19, scope: !350)
!364 = !DILocation(line: 18, column: 1, scope: !336)
