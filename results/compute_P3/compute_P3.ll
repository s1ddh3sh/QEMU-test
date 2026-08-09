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
  br label %iter_0_start81

for.cond.i.preheader:                             ; preds = %iter_77_end
    #dbg_value(i32 0, !202, !DIExpression(), !207)
  br label %iter_0_start

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %iter_7_end
  ret void, !dbg !209

iter_0_start:                                     ; preds = %for.cond.i.preheader
  br label %for.cond1.i.preheader.iter0

for.cond1.i.preheader.iter0:                      ; preds = %iter_0_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter0, !dbg !215

for.body6.i.iter0:                                ; preds = %for.cond4.i.preheader.iter0, %m_vec_mul_add.exit68.iter0
  %k.0.i78.iter0 = phi i32 [ 0, %for.cond4.i.preheader.iter0 ], [ %add14.i.iter0, %m_vec_mul_add.exit68.iter0 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter0 = shl nuw nsw i32 %c.0.i79.iter0, 3, !dbg !221
  %add.i.iter0 = or disjoint i32 %mul.i.iter0, %k.0.i78.iter0, !dbg !224
  %add.ptr.idx.i.iter0 = mul nuw nsw i32 %add.i.iter0, 40, !dbg !225
  %add.ptr.i.iter0 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter0, !dbg !225
  %mul8.i.iter0 = shl nuw nsw i32 %c.0.i79.iter0, 3, !dbg !226
  %0 = getelementptr i8, ptr %O, i32 %mul8.i.iter0, !dbg !227
  %arrayidx.i.iter0 = getelementptr i8, ptr %0, i32 0, !dbg !227
  %1 = load i8, ptr %arrayidx.i.iter0, align 1, !dbg !227
  %add11.i.iter0 = or disjoint i32 0, %k.0.i78.iter0, !dbg !228
  %add.ptr13.idx.i.iter0 = mul nuw nsw i32 %add11.i.iter0, 40, !dbg !229
  %add.ptr13.i.iter0 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter0, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter0 = zext i8 %1 to i32, !dbg !247
  %mul.i.i28.iter0 = mul i32 %conv.i.i27.iter0, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter0 = and i32 %mul.i.i28.iter0, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter0 = lshr exact i32 %and.i.i29.iter0, 4, !dbg !253
  %shr1.i.i31.iter0 = lshr exact i32 %and.i.i29.iter0, 3, !dbg !254
  %2 = xor i32 %shr.i.i30.iter0, %shr1.i.i31.iter0, !dbg !255
  %xor2.i.i32.iter0 = xor i32 %2, %mul.i.i28.iter0, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter0, !dbg !261

for.body.i36.iter0:                               ; preds = %for.body.i36.iter0, %for.body6.i.iter0
  %i.0.i3477.iter0 = phi i32 [ 0, %for.body6.i.iter0 ], [ %inc.i67.iter0, %for.body.i36.iter0 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter0, i32 %i.0.i3477.iter0, !dbg !262
  %3 = load i64, ptr %arrayidx.i37.iter0, align 8, !dbg !262
  %and.i38.iter0 = and i64 %3, 1229782938247303441, !dbg !265
  %and1.i39.iter0 = and i32 %xor2.i.i32.iter0, 255, !dbg !266
  %conv.i40.iter0 = zext nneg i32 %and1.i39.iter0 to i64, !dbg !267
  %mul.i41.iter0 = mul i64 %and.i38.iter0, %conv.i40.iter0, !dbg !268
  %shr.i42.iter0 = lshr i64 %3, 1, !dbg !269
  %and3.i43.iter0 = and i64 %shr.i42.iter0, 1229782938247303441, !dbg !270
  %shr4.i44.iter0 = lshr i32 %xor2.i.i32.iter0, 8, !dbg !271
  %and5.i45.iter0 = and i32 %shr4.i44.iter0, 15, !dbg !272
  %conv6.i46.iter0 = zext nneg i32 %and5.i45.iter0 to i64, !dbg !273
  %mul7.i47.iter0 = mul nuw i64 %and3.i43.iter0, %conv6.i46.iter0, !dbg !274
  %xor.i48.iter0 = xor i64 %mul.i41.iter0, %mul7.i47.iter0, !dbg !275
  %arrayidx8.i49.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter0, i32 %i.0.i3477.iter0, !dbg !276
  %4 = load i64, ptr %arrayidx8.i49.iter0, align 8, !dbg !276
  %shr9.i50.iter0 = lshr i64 %4, 2, !dbg !277
  %and10.i51.iter0 = and i64 %shr9.i50.iter0, 1229782938247303441, !dbg !278
  %shr11.i52.iter0 = lshr i32 %xor2.i.i32.iter0, 16, !dbg !279
  %and12.i53.iter0 = and i32 %shr11.i52.iter0, 15, !dbg !280
  %conv13.i54.iter0 = zext nneg i32 %and12.i53.iter0 to i64, !dbg !281
  %mul14.i55.iter0 = mul nuw i64 %and10.i51.iter0, %conv13.i54.iter0, !dbg !282
  %xor15.i56.iter0 = xor i64 %xor.i48.iter0, %mul14.i55.iter0, !dbg !283
  %arrayidx16.i57.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter0, i32 %i.0.i3477.iter0, !dbg !284
  %5 = load i64, ptr %arrayidx16.i57.iter0, align 8, !dbg !284
  %shr17.i58.iter0 = lshr i64 %5, 3, !dbg !285
  %and18.i59.iter0 = and i64 %shr17.i58.iter0, 1229782938247303441, !dbg !286
  %shr19.i60.iter0 = lshr i32 %xor2.i.i32.iter0, 24, !dbg !287
  %and20.i61.iter0 = and i32 %shr19.i60.iter0, 15, !dbg !288
  %conv21.i62.iter0 = zext nneg i32 %and20.i61.iter0 to i64, !dbg !289
  %mul22.i63.iter0 = mul nuw i64 %and18.i59.iter0, %conv21.i62.iter0, !dbg !290
  %xor23.i64.iter0 = xor i64 %xor15.i56.iter0, %mul22.i63.iter0, !dbg !291
  %arrayidx24.i65.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter0, i32 %i.0.i3477.iter0, !dbg !292
  %6 = load i64, ptr %arrayidx24.i65.iter0, align 8, !dbg !293
  %xor25.i66.iter0 = xor i64 %6, %xor23.i64.iter0, !dbg !293
  store i64 %xor25.i66.iter0, ptr %arrayidx24.i65.iter0, align 8, !dbg !293
  %inc.i67.iter0 = add nuw nsw i32 %i.0.i3477.iter0, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter0 = icmp eq i32 %inc.i67.iter0, 5, !dbg !295
  br i1 %exitcond.i35.not.iter0, label %m_vec_mul_add.exit68.iter0, label %for.body.i36.iter0, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter0:                       ; preds = %for.body.i36.iter0
  %add14.i.iter0 = add nuw nsw i32 %k.0.i78.iter0, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter0 = icmp eq i32 %add14.i.iter0, 8, !dbg !300
  br i1 %exitcond.i.not.iter0, label %for.inc15.i.iter0, label %for.body6.i.iter0, !dbg !301, !llvm.loop !302

for.inc15.i.iter0:                                ; preds = %m_vec_mul_add.exit68.iter0
  %inc.i.iter0 = add nuw nsw i32 %c.0.i79.iter0, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter0 = icmp eq i32 %inc.i.iter0, 78, !dbg !305
  br i1 %exitcond1.i.not.iter0, label %for.inc17.i.iter0, label %for.cond4.i.preheader.iter0, !dbg !215, !llvm.loop !306

for.inc17.i.iter0:                                ; preds = %for.inc15.i.iter0
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_0_end

for.cond4.i.preheader.iter0:                      ; preds = %for.inc15.i.iter0, %for.cond1.i.preheader.iter0
  %c.0.i79.iter0 = phi i32 [ 0, %for.cond1.i.preheader.iter0 ], [ %inc.i.iter0, %for.inc15.i.iter0 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter0, !dbg !301

iter_0_end:                                       ; preds = %for.inc17.i.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.cond1.i.preheader.iter1

for.cond1.i.preheader.iter1:                      ; preds = %iter_1_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter1, !dbg !215

for.body6.i.iter1:                                ; preds = %for.cond4.i.preheader.iter1, %m_vec_mul_add.exit68.iter1
  %k.0.i78.iter1 = phi i32 [ 0, %for.cond4.i.preheader.iter1 ], [ %add14.i.iter1, %m_vec_mul_add.exit68.iter1 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter1 = shl nuw nsw i32 %c.0.i79.iter1, 3, !dbg !221
  %add.i.iter1 = or disjoint i32 %mul.i.iter1, %k.0.i78.iter1, !dbg !224
  %add.ptr.idx.i.iter1 = mul nuw nsw i32 %add.i.iter1, 40, !dbg !225
  %add.ptr.i.iter1 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter1, !dbg !225
  %mul8.i.iter1 = shl nuw nsw i32 %c.0.i79.iter1, 3, !dbg !226
  %7 = getelementptr i8, ptr %O, i32 %mul8.i.iter1, !dbg !227
  %arrayidx.i.iter1 = getelementptr i8, ptr %7, i32 1, !dbg !227
  %8 = load i8, ptr %arrayidx.i.iter1, align 1, !dbg !227
  %add11.i.iter1 = or disjoint i32 8, %k.0.i78.iter1, !dbg !228
  %add.ptr13.idx.i.iter1 = mul nuw nsw i32 %add11.i.iter1, 40, !dbg !229
  %add.ptr13.i.iter1 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter1, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter1 = zext i8 %8 to i32, !dbg !247
  %mul.i.i28.iter1 = mul i32 %conv.i.i27.iter1, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter1 = and i32 %mul.i.i28.iter1, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter1 = lshr exact i32 %and.i.i29.iter1, 4, !dbg !253
  %shr1.i.i31.iter1 = lshr exact i32 %and.i.i29.iter1, 3, !dbg !254
  %9 = xor i32 %shr.i.i30.iter1, %shr1.i.i31.iter1, !dbg !255
  %xor2.i.i32.iter1 = xor i32 %9, %mul.i.i28.iter1, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter1, !dbg !261

for.body.i36.iter1:                               ; preds = %for.body.i36.iter1, %for.body6.i.iter1
  %i.0.i3477.iter1 = phi i32 [ 0, %for.body6.i.iter1 ], [ %inc.i67.iter1, %for.body.i36.iter1 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter1, i32 %i.0.i3477.iter1, !dbg !262
  %10 = load i64, ptr %arrayidx.i37.iter1, align 8, !dbg !262
  %and.i38.iter1 = and i64 %10, 1229782938247303441, !dbg !265
  %and1.i39.iter1 = and i32 %xor2.i.i32.iter1, 255, !dbg !266
  %conv.i40.iter1 = zext nneg i32 %and1.i39.iter1 to i64, !dbg !267
  %mul.i41.iter1 = mul i64 %and.i38.iter1, %conv.i40.iter1, !dbg !268
  %shr.i42.iter1 = lshr i64 %10, 1, !dbg !269
  %and3.i43.iter1 = and i64 %shr.i42.iter1, 1229782938247303441, !dbg !270
  %shr4.i44.iter1 = lshr i32 %xor2.i.i32.iter1, 8, !dbg !271
  %and5.i45.iter1 = and i32 %shr4.i44.iter1, 15, !dbg !272
  %conv6.i46.iter1 = zext nneg i32 %and5.i45.iter1 to i64, !dbg !273
  %mul7.i47.iter1 = mul nuw i64 %and3.i43.iter1, %conv6.i46.iter1, !dbg !274
  %xor.i48.iter1 = xor i64 %mul.i41.iter1, %mul7.i47.iter1, !dbg !275
  %arrayidx8.i49.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter1, i32 %i.0.i3477.iter1, !dbg !276
  %11 = load i64, ptr %arrayidx8.i49.iter1, align 8, !dbg !276
  %shr9.i50.iter1 = lshr i64 %11, 2, !dbg !277
  %and10.i51.iter1 = and i64 %shr9.i50.iter1, 1229782938247303441, !dbg !278
  %shr11.i52.iter1 = lshr i32 %xor2.i.i32.iter1, 16, !dbg !279
  %and12.i53.iter1 = and i32 %shr11.i52.iter1, 15, !dbg !280
  %conv13.i54.iter1 = zext nneg i32 %and12.i53.iter1 to i64, !dbg !281
  %mul14.i55.iter1 = mul nuw i64 %and10.i51.iter1, %conv13.i54.iter1, !dbg !282
  %xor15.i56.iter1 = xor i64 %xor.i48.iter1, %mul14.i55.iter1, !dbg !283
  %arrayidx16.i57.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter1, i32 %i.0.i3477.iter1, !dbg !284
  %12 = load i64, ptr %arrayidx16.i57.iter1, align 8, !dbg !284
  %shr17.i58.iter1 = lshr i64 %12, 3, !dbg !285
  %and18.i59.iter1 = and i64 %shr17.i58.iter1, 1229782938247303441, !dbg !286
  %shr19.i60.iter1 = lshr i32 %xor2.i.i32.iter1, 24, !dbg !287
  %and20.i61.iter1 = and i32 %shr19.i60.iter1, 15, !dbg !288
  %conv21.i62.iter1 = zext nneg i32 %and20.i61.iter1 to i64, !dbg !289
  %mul22.i63.iter1 = mul nuw i64 %and18.i59.iter1, %conv21.i62.iter1, !dbg !290
  %xor23.i64.iter1 = xor i64 %xor15.i56.iter1, %mul22.i63.iter1, !dbg !291
  %arrayidx24.i65.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter1, i32 %i.0.i3477.iter1, !dbg !292
  %13 = load i64, ptr %arrayidx24.i65.iter1, align 8, !dbg !293
  %xor25.i66.iter1 = xor i64 %13, %xor23.i64.iter1, !dbg !293
  store i64 %xor25.i66.iter1, ptr %arrayidx24.i65.iter1, align 8, !dbg !293
  %inc.i67.iter1 = add nuw nsw i32 %i.0.i3477.iter1, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter1 = icmp eq i32 %inc.i67.iter1, 5, !dbg !295
  br i1 %exitcond.i35.not.iter1, label %m_vec_mul_add.exit68.iter1, label %for.body.i36.iter1, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter1:                       ; preds = %for.body.i36.iter1
  %add14.i.iter1 = add nuw nsw i32 %k.0.i78.iter1, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter1 = icmp eq i32 %add14.i.iter1, 8, !dbg !300
  br i1 %exitcond.i.not.iter1, label %for.inc15.i.iter1, label %for.body6.i.iter1, !dbg !301, !llvm.loop !302

for.inc15.i.iter1:                                ; preds = %m_vec_mul_add.exit68.iter1
  %inc.i.iter1 = add nuw nsw i32 %c.0.i79.iter1, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter1 = icmp eq i32 %inc.i.iter1, 78, !dbg !305
  br i1 %exitcond1.i.not.iter1, label %for.inc17.i.iter1, label %for.cond4.i.preheader.iter1, !dbg !215, !llvm.loop !306

for.inc17.i.iter1:                                ; preds = %for.inc15.i.iter1
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_1_end

for.cond4.i.preheader.iter1:                      ; preds = %for.inc15.i.iter1, %for.cond1.i.preheader.iter1
  %c.0.i79.iter1 = phi i32 [ 0, %for.cond1.i.preheader.iter1 ], [ %inc.i.iter1, %for.inc15.i.iter1 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter1, !dbg !301

iter_1_end:                                       ; preds = %for.inc17.i.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.cond1.i.preheader.iter2

for.cond1.i.preheader.iter2:                      ; preds = %iter_2_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter2, !dbg !215

for.body6.i.iter2:                                ; preds = %for.cond4.i.preheader.iter2, %m_vec_mul_add.exit68.iter2
  %k.0.i78.iter2 = phi i32 [ 0, %for.cond4.i.preheader.iter2 ], [ %add14.i.iter2, %m_vec_mul_add.exit68.iter2 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter2 = shl nuw nsw i32 %c.0.i79.iter2, 3, !dbg !221
  %add.i.iter2 = or disjoint i32 %mul.i.iter2, %k.0.i78.iter2, !dbg !224
  %add.ptr.idx.i.iter2 = mul nuw nsw i32 %add.i.iter2, 40, !dbg !225
  %add.ptr.i.iter2 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter2, !dbg !225
  %mul8.i.iter2 = shl nuw nsw i32 %c.0.i79.iter2, 3, !dbg !226
  %14 = getelementptr i8, ptr %O, i32 %mul8.i.iter2, !dbg !227
  %arrayidx.i.iter2 = getelementptr i8, ptr %14, i32 2, !dbg !227
  %15 = load i8, ptr %arrayidx.i.iter2, align 1, !dbg !227
  %add11.i.iter2 = or disjoint i32 16, %k.0.i78.iter2, !dbg !228
  %add.ptr13.idx.i.iter2 = mul nuw nsw i32 %add11.i.iter2, 40, !dbg !229
  %add.ptr13.i.iter2 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter2, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter2 = zext i8 %15 to i32, !dbg !247
  %mul.i.i28.iter2 = mul i32 %conv.i.i27.iter2, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter2 = and i32 %mul.i.i28.iter2, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter2 = lshr exact i32 %and.i.i29.iter2, 4, !dbg !253
  %shr1.i.i31.iter2 = lshr exact i32 %and.i.i29.iter2, 3, !dbg !254
  %16 = xor i32 %shr.i.i30.iter2, %shr1.i.i31.iter2, !dbg !255
  %xor2.i.i32.iter2 = xor i32 %16, %mul.i.i28.iter2, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter2, !dbg !261

for.body.i36.iter2:                               ; preds = %for.body.i36.iter2, %for.body6.i.iter2
  %i.0.i3477.iter2 = phi i32 [ 0, %for.body6.i.iter2 ], [ %inc.i67.iter2, %for.body.i36.iter2 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter2, i32 %i.0.i3477.iter2, !dbg !262
  %17 = load i64, ptr %arrayidx.i37.iter2, align 8, !dbg !262
  %and.i38.iter2 = and i64 %17, 1229782938247303441, !dbg !265
  %and1.i39.iter2 = and i32 %xor2.i.i32.iter2, 255, !dbg !266
  %conv.i40.iter2 = zext nneg i32 %and1.i39.iter2 to i64, !dbg !267
  %mul.i41.iter2 = mul i64 %and.i38.iter2, %conv.i40.iter2, !dbg !268
  %shr.i42.iter2 = lshr i64 %17, 1, !dbg !269
  %and3.i43.iter2 = and i64 %shr.i42.iter2, 1229782938247303441, !dbg !270
  %shr4.i44.iter2 = lshr i32 %xor2.i.i32.iter2, 8, !dbg !271
  %and5.i45.iter2 = and i32 %shr4.i44.iter2, 15, !dbg !272
  %conv6.i46.iter2 = zext nneg i32 %and5.i45.iter2 to i64, !dbg !273
  %mul7.i47.iter2 = mul nuw i64 %and3.i43.iter2, %conv6.i46.iter2, !dbg !274
  %xor.i48.iter2 = xor i64 %mul.i41.iter2, %mul7.i47.iter2, !dbg !275
  %arrayidx8.i49.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter2, i32 %i.0.i3477.iter2, !dbg !276
  %18 = load i64, ptr %arrayidx8.i49.iter2, align 8, !dbg !276
  %shr9.i50.iter2 = lshr i64 %18, 2, !dbg !277
  %and10.i51.iter2 = and i64 %shr9.i50.iter2, 1229782938247303441, !dbg !278
  %shr11.i52.iter2 = lshr i32 %xor2.i.i32.iter2, 16, !dbg !279
  %and12.i53.iter2 = and i32 %shr11.i52.iter2, 15, !dbg !280
  %conv13.i54.iter2 = zext nneg i32 %and12.i53.iter2 to i64, !dbg !281
  %mul14.i55.iter2 = mul nuw i64 %and10.i51.iter2, %conv13.i54.iter2, !dbg !282
  %xor15.i56.iter2 = xor i64 %xor.i48.iter2, %mul14.i55.iter2, !dbg !283
  %arrayidx16.i57.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter2, i32 %i.0.i3477.iter2, !dbg !284
  %19 = load i64, ptr %arrayidx16.i57.iter2, align 8, !dbg !284
  %shr17.i58.iter2 = lshr i64 %19, 3, !dbg !285
  %and18.i59.iter2 = and i64 %shr17.i58.iter2, 1229782938247303441, !dbg !286
  %shr19.i60.iter2 = lshr i32 %xor2.i.i32.iter2, 24, !dbg !287
  %and20.i61.iter2 = and i32 %shr19.i60.iter2, 15, !dbg !288
  %conv21.i62.iter2 = zext nneg i32 %and20.i61.iter2 to i64, !dbg !289
  %mul22.i63.iter2 = mul nuw i64 %and18.i59.iter2, %conv21.i62.iter2, !dbg !290
  %xor23.i64.iter2 = xor i64 %xor15.i56.iter2, %mul22.i63.iter2, !dbg !291
  %arrayidx24.i65.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter2, i32 %i.0.i3477.iter2, !dbg !292
  %20 = load i64, ptr %arrayidx24.i65.iter2, align 8, !dbg !293
  %xor25.i66.iter2 = xor i64 %20, %xor23.i64.iter2, !dbg !293
  store i64 %xor25.i66.iter2, ptr %arrayidx24.i65.iter2, align 8, !dbg !293
  %inc.i67.iter2 = add nuw nsw i32 %i.0.i3477.iter2, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter2 = icmp eq i32 %inc.i67.iter2, 5, !dbg !295
  br i1 %exitcond.i35.not.iter2, label %m_vec_mul_add.exit68.iter2, label %for.body.i36.iter2, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter2:                       ; preds = %for.body.i36.iter2
  %add14.i.iter2 = add nuw nsw i32 %k.0.i78.iter2, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter2 = icmp eq i32 %add14.i.iter2, 8, !dbg !300
  br i1 %exitcond.i.not.iter2, label %for.inc15.i.iter2, label %for.body6.i.iter2, !dbg !301, !llvm.loop !302

for.inc15.i.iter2:                                ; preds = %m_vec_mul_add.exit68.iter2
  %inc.i.iter2 = add nuw nsw i32 %c.0.i79.iter2, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter2 = icmp eq i32 %inc.i.iter2, 78, !dbg !305
  br i1 %exitcond1.i.not.iter2, label %for.inc17.i.iter2, label %for.cond4.i.preheader.iter2, !dbg !215, !llvm.loop !306

for.inc17.i.iter2:                                ; preds = %for.inc15.i.iter2
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_2_end

for.cond4.i.preheader.iter2:                      ; preds = %for.inc15.i.iter2, %for.cond1.i.preheader.iter2
  %c.0.i79.iter2 = phi i32 [ 0, %for.cond1.i.preheader.iter2 ], [ %inc.i.iter2, %for.inc15.i.iter2 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter2, !dbg !301

iter_2_end:                                       ; preds = %for.inc17.i.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.cond1.i.preheader.iter3

for.cond1.i.preheader.iter3:                      ; preds = %iter_3_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter3, !dbg !215

for.body6.i.iter3:                                ; preds = %for.cond4.i.preheader.iter3, %m_vec_mul_add.exit68.iter3
  %k.0.i78.iter3 = phi i32 [ 0, %for.cond4.i.preheader.iter3 ], [ %add14.i.iter3, %m_vec_mul_add.exit68.iter3 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter3 = shl nuw nsw i32 %c.0.i79.iter3, 3, !dbg !221
  %add.i.iter3 = or disjoint i32 %mul.i.iter3, %k.0.i78.iter3, !dbg !224
  %add.ptr.idx.i.iter3 = mul nuw nsw i32 %add.i.iter3, 40, !dbg !225
  %add.ptr.i.iter3 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter3, !dbg !225
  %mul8.i.iter3 = shl nuw nsw i32 %c.0.i79.iter3, 3, !dbg !226
  %21 = getelementptr i8, ptr %O, i32 %mul8.i.iter3, !dbg !227
  %arrayidx.i.iter3 = getelementptr i8, ptr %21, i32 3, !dbg !227
  %22 = load i8, ptr %arrayidx.i.iter3, align 1, !dbg !227
  %add11.i.iter3 = or disjoint i32 24, %k.0.i78.iter3, !dbg !228
  %add.ptr13.idx.i.iter3 = mul nuw nsw i32 %add11.i.iter3, 40, !dbg !229
  %add.ptr13.i.iter3 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter3, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter3 = zext i8 %22 to i32, !dbg !247
  %mul.i.i28.iter3 = mul i32 %conv.i.i27.iter3, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter3 = and i32 %mul.i.i28.iter3, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter3 = lshr exact i32 %and.i.i29.iter3, 4, !dbg !253
  %shr1.i.i31.iter3 = lshr exact i32 %and.i.i29.iter3, 3, !dbg !254
  %23 = xor i32 %shr.i.i30.iter3, %shr1.i.i31.iter3, !dbg !255
  %xor2.i.i32.iter3 = xor i32 %23, %mul.i.i28.iter3, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter3, !dbg !261

for.body.i36.iter3:                               ; preds = %for.body.i36.iter3, %for.body6.i.iter3
  %i.0.i3477.iter3 = phi i32 [ 0, %for.body6.i.iter3 ], [ %inc.i67.iter3, %for.body.i36.iter3 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter3, i32 %i.0.i3477.iter3, !dbg !262
  %24 = load i64, ptr %arrayidx.i37.iter3, align 8, !dbg !262
  %and.i38.iter3 = and i64 %24, 1229782938247303441, !dbg !265
  %and1.i39.iter3 = and i32 %xor2.i.i32.iter3, 255, !dbg !266
  %conv.i40.iter3 = zext nneg i32 %and1.i39.iter3 to i64, !dbg !267
  %mul.i41.iter3 = mul i64 %and.i38.iter3, %conv.i40.iter3, !dbg !268
  %shr.i42.iter3 = lshr i64 %24, 1, !dbg !269
  %and3.i43.iter3 = and i64 %shr.i42.iter3, 1229782938247303441, !dbg !270
  %shr4.i44.iter3 = lshr i32 %xor2.i.i32.iter3, 8, !dbg !271
  %and5.i45.iter3 = and i32 %shr4.i44.iter3, 15, !dbg !272
  %conv6.i46.iter3 = zext nneg i32 %and5.i45.iter3 to i64, !dbg !273
  %mul7.i47.iter3 = mul nuw i64 %and3.i43.iter3, %conv6.i46.iter3, !dbg !274
  %xor.i48.iter3 = xor i64 %mul.i41.iter3, %mul7.i47.iter3, !dbg !275
  %arrayidx8.i49.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter3, i32 %i.0.i3477.iter3, !dbg !276
  %25 = load i64, ptr %arrayidx8.i49.iter3, align 8, !dbg !276
  %shr9.i50.iter3 = lshr i64 %25, 2, !dbg !277
  %and10.i51.iter3 = and i64 %shr9.i50.iter3, 1229782938247303441, !dbg !278
  %shr11.i52.iter3 = lshr i32 %xor2.i.i32.iter3, 16, !dbg !279
  %and12.i53.iter3 = and i32 %shr11.i52.iter3, 15, !dbg !280
  %conv13.i54.iter3 = zext nneg i32 %and12.i53.iter3 to i64, !dbg !281
  %mul14.i55.iter3 = mul nuw i64 %and10.i51.iter3, %conv13.i54.iter3, !dbg !282
  %xor15.i56.iter3 = xor i64 %xor.i48.iter3, %mul14.i55.iter3, !dbg !283
  %arrayidx16.i57.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter3, i32 %i.0.i3477.iter3, !dbg !284
  %26 = load i64, ptr %arrayidx16.i57.iter3, align 8, !dbg !284
  %shr17.i58.iter3 = lshr i64 %26, 3, !dbg !285
  %and18.i59.iter3 = and i64 %shr17.i58.iter3, 1229782938247303441, !dbg !286
  %shr19.i60.iter3 = lshr i32 %xor2.i.i32.iter3, 24, !dbg !287
  %and20.i61.iter3 = and i32 %shr19.i60.iter3, 15, !dbg !288
  %conv21.i62.iter3 = zext nneg i32 %and20.i61.iter3 to i64, !dbg !289
  %mul22.i63.iter3 = mul nuw i64 %and18.i59.iter3, %conv21.i62.iter3, !dbg !290
  %xor23.i64.iter3 = xor i64 %xor15.i56.iter3, %mul22.i63.iter3, !dbg !291
  %arrayidx24.i65.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter3, i32 %i.0.i3477.iter3, !dbg !292
  %27 = load i64, ptr %arrayidx24.i65.iter3, align 8, !dbg !293
  %xor25.i66.iter3 = xor i64 %27, %xor23.i64.iter3, !dbg !293
  store i64 %xor25.i66.iter3, ptr %arrayidx24.i65.iter3, align 8, !dbg !293
  %inc.i67.iter3 = add nuw nsw i32 %i.0.i3477.iter3, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter3 = icmp eq i32 %inc.i67.iter3, 5, !dbg !295
  br i1 %exitcond.i35.not.iter3, label %m_vec_mul_add.exit68.iter3, label %for.body.i36.iter3, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter3:                       ; preds = %for.body.i36.iter3
  %add14.i.iter3 = add nuw nsw i32 %k.0.i78.iter3, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter3 = icmp eq i32 %add14.i.iter3, 8, !dbg !300
  br i1 %exitcond.i.not.iter3, label %for.inc15.i.iter3, label %for.body6.i.iter3, !dbg !301, !llvm.loop !302

for.inc15.i.iter3:                                ; preds = %m_vec_mul_add.exit68.iter3
  %inc.i.iter3 = add nuw nsw i32 %c.0.i79.iter3, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter3 = icmp eq i32 %inc.i.iter3, 78, !dbg !305
  br i1 %exitcond1.i.not.iter3, label %for.inc17.i.iter3, label %for.cond4.i.preheader.iter3, !dbg !215, !llvm.loop !306

for.inc17.i.iter3:                                ; preds = %for.inc15.i.iter3
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_3_end

for.cond4.i.preheader.iter3:                      ; preds = %for.inc15.i.iter3, %for.cond1.i.preheader.iter3
  %c.0.i79.iter3 = phi i32 [ 0, %for.cond1.i.preheader.iter3 ], [ %inc.i.iter3, %for.inc15.i.iter3 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter3, !dbg !301

iter_3_end:                                       ; preds = %for.inc17.i.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.cond1.i.preheader.iter4

for.cond1.i.preheader.iter4:                      ; preds = %iter_4_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter4, !dbg !215

for.body6.i.iter4:                                ; preds = %for.cond4.i.preheader.iter4, %m_vec_mul_add.exit68.iter4
  %k.0.i78.iter4 = phi i32 [ 0, %for.cond4.i.preheader.iter4 ], [ %add14.i.iter4, %m_vec_mul_add.exit68.iter4 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter4 = shl nuw nsw i32 %c.0.i79.iter4, 3, !dbg !221
  %add.i.iter4 = or disjoint i32 %mul.i.iter4, %k.0.i78.iter4, !dbg !224
  %add.ptr.idx.i.iter4 = mul nuw nsw i32 %add.i.iter4, 40, !dbg !225
  %add.ptr.i.iter4 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter4, !dbg !225
  %mul8.i.iter4 = shl nuw nsw i32 %c.0.i79.iter4, 3, !dbg !226
  %28 = getelementptr i8, ptr %O, i32 %mul8.i.iter4, !dbg !227
  %arrayidx.i.iter4 = getelementptr i8, ptr %28, i32 4, !dbg !227
  %29 = load i8, ptr %arrayidx.i.iter4, align 1, !dbg !227
  %add11.i.iter4 = or disjoint i32 32, %k.0.i78.iter4, !dbg !228
  %add.ptr13.idx.i.iter4 = mul nuw nsw i32 %add11.i.iter4, 40, !dbg !229
  %add.ptr13.i.iter4 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter4, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter4 = zext i8 %29 to i32, !dbg !247
  %mul.i.i28.iter4 = mul i32 %conv.i.i27.iter4, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter4 = and i32 %mul.i.i28.iter4, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter4 = lshr exact i32 %and.i.i29.iter4, 4, !dbg !253
  %shr1.i.i31.iter4 = lshr exact i32 %and.i.i29.iter4, 3, !dbg !254
  %30 = xor i32 %shr.i.i30.iter4, %shr1.i.i31.iter4, !dbg !255
  %xor2.i.i32.iter4 = xor i32 %30, %mul.i.i28.iter4, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter4, !dbg !261

for.body.i36.iter4:                               ; preds = %for.body.i36.iter4, %for.body6.i.iter4
  %i.0.i3477.iter4 = phi i32 [ 0, %for.body6.i.iter4 ], [ %inc.i67.iter4, %for.body.i36.iter4 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter4, i32 %i.0.i3477.iter4, !dbg !262
  %31 = load i64, ptr %arrayidx.i37.iter4, align 8, !dbg !262
  %and.i38.iter4 = and i64 %31, 1229782938247303441, !dbg !265
  %and1.i39.iter4 = and i32 %xor2.i.i32.iter4, 255, !dbg !266
  %conv.i40.iter4 = zext nneg i32 %and1.i39.iter4 to i64, !dbg !267
  %mul.i41.iter4 = mul i64 %and.i38.iter4, %conv.i40.iter4, !dbg !268
  %shr.i42.iter4 = lshr i64 %31, 1, !dbg !269
  %and3.i43.iter4 = and i64 %shr.i42.iter4, 1229782938247303441, !dbg !270
  %shr4.i44.iter4 = lshr i32 %xor2.i.i32.iter4, 8, !dbg !271
  %and5.i45.iter4 = and i32 %shr4.i44.iter4, 15, !dbg !272
  %conv6.i46.iter4 = zext nneg i32 %and5.i45.iter4 to i64, !dbg !273
  %mul7.i47.iter4 = mul nuw i64 %and3.i43.iter4, %conv6.i46.iter4, !dbg !274
  %xor.i48.iter4 = xor i64 %mul.i41.iter4, %mul7.i47.iter4, !dbg !275
  %arrayidx8.i49.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter4, i32 %i.0.i3477.iter4, !dbg !276
  %32 = load i64, ptr %arrayidx8.i49.iter4, align 8, !dbg !276
  %shr9.i50.iter4 = lshr i64 %32, 2, !dbg !277
  %and10.i51.iter4 = and i64 %shr9.i50.iter4, 1229782938247303441, !dbg !278
  %shr11.i52.iter4 = lshr i32 %xor2.i.i32.iter4, 16, !dbg !279
  %and12.i53.iter4 = and i32 %shr11.i52.iter4, 15, !dbg !280
  %conv13.i54.iter4 = zext nneg i32 %and12.i53.iter4 to i64, !dbg !281
  %mul14.i55.iter4 = mul nuw i64 %and10.i51.iter4, %conv13.i54.iter4, !dbg !282
  %xor15.i56.iter4 = xor i64 %xor.i48.iter4, %mul14.i55.iter4, !dbg !283
  %arrayidx16.i57.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter4, i32 %i.0.i3477.iter4, !dbg !284
  %33 = load i64, ptr %arrayidx16.i57.iter4, align 8, !dbg !284
  %shr17.i58.iter4 = lshr i64 %33, 3, !dbg !285
  %and18.i59.iter4 = and i64 %shr17.i58.iter4, 1229782938247303441, !dbg !286
  %shr19.i60.iter4 = lshr i32 %xor2.i.i32.iter4, 24, !dbg !287
  %and20.i61.iter4 = and i32 %shr19.i60.iter4, 15, !dbg !288
  %conv21.i62.iter4 = zext nneg i32 %and20.i61.iter4 to i64, !dbg !289
  %mul22.i63.iter4 = mul nuw i64 %and18.i59.iter4, %conv21.i62.iter4, !dbg !290
  %xor23.i64.iter4 = xor i64 %xor15.i56.iter4, %mul22.i63.iter4, !dbg !291
  %arrayidx24.i65.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter4, i32 %i.0.i3477.iter4, !dbg !292
  %34 = load i64, ptr %arrayidx24.i65.iter4, align 8, !dbg !293
  %xor25.i66.iter4 = xor i64 %34, %xor23.i64.iter4, !dbg !293
  store i64 %xor25.i66.iter4, ptr %arrayidx24.i65.iter4, align 8, !dbg !293
  %inc.i67.iter4 = add nuw nsw i32 %i.0.i3477.iter4, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter4 = icmp eq i32 %inc.i67.iter4, 5, !dbg !295
  br i1 %exitcond.i35.not.iter4, label %m_vec_mul_add.exit68.iter4, label %for.body.i36.iter4, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter4:                       ; preds = %for.body.i36.iter4
  %add14.i.iter4 = add nuw nsw i32 %k.0.i78.iter4, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter4 = icmp eq i32 %add14.i.iter4, 8, !dbg !300
  br i1 %exitcond.i.not.iter4, label %for.inc15.i.iter4, label %for.body6.i.iter4, !dbg !301, !llvm.loop !302

for.inc15.i.iter4:                                ; preds = %m_vec_mul_add.exit68.iter4
  %inc.i.iter4 = add nuw nsw i32 %c.0.i79.iter4, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter4 = icmp eq i32 %inc.i.iter4, 78, !dbg !305
  br i1 %exitcond1.i.not.iter4, label %for.inc17.i.iter4, label %for.cond4.i.preheader.iter4, !dbg !215, !llvm.loop !306

for.inc17.i.iter4:                                ; preds = %for.inc15.i.iter4
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_4_end

for.cond4.i.preheader.iter4:                      ; preds = %for.inc15.i.iter4, %for.cond1.i.preheader.iter4
  %c.0.i79.iter4 = phi i32 [ 0, %for.cond1.i.preheader.iter4 ], [ %inc.i.iter4, %for.inc15.i.iter4 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter4, !dbg !301

iter_4_end:                                       ; preds = %for.inc17.i.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.cond1.i.preheader.iter5

for.cond1.i.preheader.iter5:                      ; preds = %iter_5_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter5, !dbg !215

for.body6.i.iter5:                                ; preds = %for.cond4.i.preheader.iter5, %m_vec_mul_add.exit68.iter5
  %k.0.i78.iter5 = phi i32 [ 0, %for.cond4.i.preheader.iter5 ], [ %add14.i.iter5, %m_vec_mul_add.exit68.iter5 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter5 = shl nuw nsw i32 %c.0.i79.iter5, 3, !dbg !221
  %add.i.iter5 = or disjoint i32 %mul.i.iter5, %k.0.i78.iter5, !dbg !224
  %add.ptr.idx.i.iter5 = mul nuw nsw i32 %add.i.iter5, 40, !dbg !225
  %add.ptr.i.iter5 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter5, !dbg !225
  %mul8.i.iter5 = shl nuw nsw i32 %c.0.i79.iter5, 3, !dbg !226
  %35 = getelementptr i8, ptr %O, i32 %mul8.i.iter5, !dbg !227
  %arrayidx.i.iter5 = getelementptr i8, ptr %35, i32 5, !dbg !227
  %36 = load i8, ptr %arrayidx.i.iter5, align 1, !dbg !227
  %add11.i.iter5 = or disjoint i32 40, %k.0.i78.iter5, !dbg !228
  %add.ptr13.idx.i.iter5 = mul nuw nsw i32 %add11.i.iter5, 40, !dbg !229
  %add.ptr13.i.iter5 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter5, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter5 = zext i8 %36 to i32, !dbg !247
  %mul.i.i28.iter5 = mul i32 %conv.i.i27.iter5, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter5 = and i32 %mul.i.i28.iter5, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter5 = lshr exact i32 %and.i.i29.iter5, 4, !dbg !253
  %shr1.i.i31.iter5 = lshr exact i32 %and.i.i29.iter5, 3, !dbg !254
  %37 = xor i32 %shr.i.i30.iter5, %shr1.i.i31.iter5, !dbg !255
  %xor2.i.i32.iter5 = xor i32 %37, %mul.i.i28.iter5, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter5, !dbg !261

for.body.i36.iter5:                               ; preds = %for.body.i36.iter5, %for.body6.i.iter5
  %i.0.i3477.iter5 = phi i32 [ 0, %for.body6.i.iter5 ], [ %inc.i67.iter5, %for.body.i36.iter5 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter5, i32 %i.0.i3477.iter5, !dbg !262
  %38 = load i64, ptr %arrayidx.i37.iter5, align 8, !dbg !262
  %and.i38.iter5 = and i64 %38, 1229782938247303441, !dbg !265
  %and1.i39.iter5 = and i32 %xor2.i.i32.iter5, 255, !dbg !266
  %conv.i40.iter5 = zext nneg i32 %and1.i39.iter5 to i64, !dbg !267
  %mul.i41.iter5 = mul i64 %and.i38.iter5, %conv.i40.iter5, !dbg !268
  %shr.i42.iter5 = lshr i64 %38, 1, !dbg !269
  %and3.i43.iter5 = and i64 %shr.i42.iter5, 1229782938247303441, !dbg !270
  %shr4.i44.iter5 = lshr i32 %xor2.i.i32.iter5, 8, !dbg !271
  %and5.i45.iter5 = and i32 %shr4.i44.iter5, 15, !dbg !272
  %conv6.i46.iter5 = zext nneg i32 %and5.i45.iter5 to i64, !dbg !273
  %mul7.i47.iter5 = mul nuw i64 %and3.i43.iter5, %conv6.i46.iter5, !dbg !274
  %xor.i48.iter5 = xor i64 %mul.i41.iter5, %mul7.i47.iter5, !dbg !275
  %arrayidx8.i49.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter5, i32 %i.0.i3477.iter5, !dbg !276
  %39 = load i64, ptr %arrayidx8.i49.iter5, align 8, !dbg !276
  %shr9.i50.iter5 = lshr i64 %39, 2, !dbg !277
  %and10.i51.iter5 = and i64 %shr9.i50.iter5, 1229782938247303441, !dbg !278
  %shr11.i52.iter5 = lshr i32 %xor2.i.i32.iter5, 16, !dbg !279
  %and12.i53.iter5 = and i32 %shr11.i52.iter5, 15, !dbg !280
  %conv13.i54.iter5 = zext nneg i32 %and12.i53.iter5 to i64, !dbg !281
  %mul14.i55.iter5 = mul nuw i64 %and10.i51.iter5, %conv13.i54.iter5, !dbg !282
  %xor15.i56.iter5 = xor i64 %xor.i48.iter5, %mul14.i55.iter5, !dbg !283
  %arrayidx16.i57.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter5, i32 %i.0.i3477.iter5, !dbg !284
  %40 = load i64, ptr %arrayidx16.i57.iter5, align 8, !dbg !284
  %shr17.i58.iter5 = lshr i64 %40, 3, !dbg !285
  %and18.i59.iter5 = and i64 %shr17.i58.iter5, 1229782938247303441, !dbg !286
  %shr19.i60.iter5 = lshr i32 %xor2.i.i32.iter5, 24, !dbg !287
  %and20.i61.iter5 = and i32 %shr19.i60.iter5, 15, !dbg !288
  %conv21.i62.iter5 = zext nneg i32 %and20.i61.iter5 to i64, !dbg !289
  %mul22.i63.iter5 = mul nuw i64 %and18.i59.iter5, %conv21.i62.iter5, !dbg !290
  %xor23.i64.iter5 = xor i64 %xor15.i56.iter5, %mul22.i63.iter5, !dbg !291
  %arrayidx24.i65.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter5, i32 %i.0.i3477.iter5, !dbg !292
  %41 = load i64, ptr %arrayidx24.i65.iter5, align 8, !dbg !293
  %xor25.i66.iter5 = xor i64 %41, %xor23.i64.iter5, !dbg !293
  store i64 %xor25.i66.iter5, ptr %arrayidx24.i65.iter5, align 8, !dbg !293
  %inc.i67.iter5 = add nuw nsw i32 %i.0.i3477.iter5, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter5 = icmp eq i32 %inc.i67.iter5, 5, !dbg !295
  br i1 %exitcond.i35.not.iter5, label %m_vec_mul_add.exit68.iter5, label %for.body.i36.iter5, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter5:                       ; preds = %for.body.i36.iter5
  %add14.i.iter5 = add nuw nsw i32 %k.0.i78.iter5, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter5 = icmp eq i32 %add14.i.iter5, 8, !dbg !300
  br i1 %exitcond.i.not.iter5, label %for.inc15.i.iter5, label %for.body6.i.iter5, !dbg !301, !llvm.loop !302

for.inc15.i.iter5:                                ; preds = %m_vec_mul_add.exit68.iter5
  %inc.i.iter5 = add nuw nsw i32 %c.0.i79.iter5, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter5 = icmp eq i32 %inc.i.iter5, 78, !dbg !305
  br i1 %exitcond1.i.not.iter5, label %for.inc17.i.iter5, label %for.cond4.i.preheader.iter5, !dbg !215, !llvm.loop !306

for.inc17.i.iter5:                                ; preds = %for.inc15.i.iter5
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_5_end

for.cond4.i.preheader.iter5:                      ; preds = %for.inc15.i.iter5, %for.cond1.i.preheader.iter5
  %c.0.i79.iter5 = phi i32 [ 0, %for.cond1.i.preheader.iter5 ], [ %inc.i.iter5, %for.inc15.i.iter5 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter5, !dbg !301

iter_5_end:                                       ; preds = %for.inc17.i.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.cond1.i.preheader.iter6

for.cond1.i.preheader.iter6:                      ; preds = %iter_6_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter6, !dbg !215

for.body6.i.iter6:                                ; preds = %for.cond4.i.preheader.iter6, %m_vec_mul_add.exit68.iter6
  %k.0.i78.iter6 = phi i32 [ 0, %for.cond4.i.preheader.iter6 ], [ %add14.i.iter6, %m_vec_mul_add.exit68.iter6 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter6 = shl nuw nsw i32 %c.0.i79.iter6, 3, !dbg !221
  %add.i.iter6 = or disjoint i32 %mul.i.iter6, %k.0.i78.iter6, !dbg !224
  %add.ptr.idx.i.iter6 = mul nuw nsw i32 %add.i.iter6, 40, !dbg !225
  %add.ptr.i.iter6 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter6, !dbg !225
  %mul8.i.iter6 = shl nuw nsw i32 %c.0.i79.iter6, 3, !dbg !226
  %42 = getelementptr i8, ptr %O, i32 %mul8.i.iter6, !dbg !227
  %arrayidx.i.iter6 = getelementptr i8, ptr %42, i32 6, !dbg !227
  %43 = load i8, ptr %arrayidx.i.iter6, align 1, !dbg !227
  %add11.i.iter6 = or disjoint i32 48, %k.0.i78.iter6, !dbg !228
  %add.ptr13.idx.i.iter6 = mul nuw nsw i32 %add11.i.iter6, 40, !dbg !229
  %add.ptr13.i.iter6 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter6, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter6 = zext i8 %43 to i32, !dbg !247
  %mul.i.i28.iter6 = mul i32 %conv.i.i27.iter6, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter6 = and i32 %mul.i.i28.iter6, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter6 = lshr exact i32 %and.i.i29.iter6, 4, !dbg !253
  %shr1.i.i31.iter6 = lshr exact i32 %and.i.i29.iter6, 3, !dbg !254
  %44 = xor i32 %shr.i.i30.iter6, %shr1.i.i31.iter6, !dbg !255
  %xor2.i.i32.iter6 = xor i32 %44, %mul.i.i28.iter6, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter6, !dbg !261

for.body.i36.iter6:                               ; preds = %for.body.i36.iter6, %for.body6.i.iter6
  %i.0.i3477.iter6 = phi i32 [ 0, %for.body6.i.iter6 ], [ %inc.i67.iter6, %for.body.i36.iter6 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter6, i32 %i.0.i3477.iter6, !dbg !262
  %45 = load i64, ptr %arrayidx.i37.iter6, align 8, !dbg !262
  %and.i38.iter6 = and i64 %45, 1229782938247303441, !dbg !265
  %and1.i39.iter6 = and i32 %xor2.i.i32.iter6, 255, !dbg !266
  %conv.i40.iter6 = zext nneg i32 %and1.i39.iter6 to i64, !dbg !267
  %mul.i41.iter6 = mul i64 %and.i38.iter6, %conv.i40.iter6, !dbg !268
  %shr.i42.iter6 = lshr i64 %45, 1, !dbg !269
  %and3.i43.iter6 = and i64 %shr.i42.iter6, 1229782938247303441, !dbg !270
  %shr4.i44.iter6 = lshr i32 %xor2.i.i32.iter6, 8, !dbg !271
  %and5.i45.iter6 = and i32 %shr4.i44.iter6, 15, !dbg !272
  %conv6.i46.iter6 = zext nneg i32 %and5.i45.iter6 to i64, !dbg !273
  %mul7.i47.iter6 = mul nuw i64 %and3.i43.iter6, %conv6.i46.iter6, !dbg !274
  %xor.i48.iter6 = xor i64 %mul.i41.iter6, %mul7.i47.iter6, !dbg !275
  %arrayidx8.i49.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter6, i32 %i.0.i3477.iter6, !dbg !276
  %46 = load i64, ptr %arrayidx8.i49.iter6, align 8, !dbg !276
  %shr9.i50.iter6 = lshr i64 %46, 2, !dbg !277
  %and10.i51.iter6 = and i64 %shr9.i50.iter6, 1229782938247303441, !dbg !278
  %shr11.i52.iter6 = lshr i32 %xor2.i.i32.iter6, 16, !dbg !279
  %and12.i53.iter6 = and i32 %shr11.i52.iter6, 15, !dbg !280
  %conv13.i54.iter6 = zext nneg i32 %and12.i53.iter6 to i64, !dbg !281
  %mul14.i55.iter6 = mul nuw i64 %and10.i51.iter6, %conv13.i54.iter6, !dbg !282
  %xor15.i56.iter6 = xor i64 %xor.i48.iter6, %mul14.i55.iter6, !dbg !283
  %arrayidx16.i57.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter6, i32 %i.0.i3477.iter6, !dbg !284
  %47 = load i64, ptr %arrayidx16.i57.iter6, align 8, !dbg !284
  %shr17.i58.iter6 = lshr i64 %47, 3, !dbg !285
  %and18.i59.iter6 = and i64 %shr17.i58.iter6, 1229782938247303441, !dbg !286
  %shr19.i60.iter6 = lshr i32 %xor2.i.i32.iter6, 24, !dbg !287
  %and20.i61.iter6 = and i32 %shr19.i60.iter6, 15, !dbg !288
  %conv21.i62.iter6 = zext nneg i32 %and20.i61.iter6 to i64, !dbg !289
  %mul22.i63.iter6 = mul nuw i64 %and18.i59.iter6, %conv21.i62.iter6, !dbg !290
  %xor23.i64.iter6 = xor i64 %xor15.i56.iter6, %mul22.i63.iter6, !dbg !291
  %arrayidx24.i65.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter6, i32 %i.0.i3477.iter6, !dbg !292
  %48 = load i64, ptr %arrayidx24.i65.iter6, align 8, !dbg !293
  %xor25.i66.iter6 = xor i64 %48, %xor23.i64.iter6, !dbg !293
  store i64 %xor25.i66.iter6, ptr %arrayidx24.i65.iter6, align 8, !dbg !293
  %inc.i67.iter6 = add nuw nsw i32 %i.0.i3477.iter6, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter6 = icmp eq i32 %inc.i67.iter6, 5, !dbg !295
  br i1 %exitcond.i35.not.iter6, label %m_vec_mul_add.exit68.iter6, label %for.body.i36.iter6, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter6:                       ; preds = %for.body.i36.iter6
  %add14.i.iter6 = add nuw nsw i32 %k.0.i78.iter6, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter6 = icmp eq i32 %add14.i.iter6, 8, !dbg !300
  br i1 %exitcond.i.not.iter6, label %for.inc15.i.iter6, label %for.body6.i.iter6, !dbg !301, !llvm.loop !302

for.inc15.i.iter6:                                ; preds = %m_vec_mul_add.exit68.iter6
  %inc.i.iter6 = add nuw nsw i32 %c.0.i79.iter6, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter6 = icmp eq i32 %inc.i.iter6, 78, !dbg !305
  br i1 %exitcond1.i.not.iter6, label %for.inc17.i.iter6, label %for.cond4.i.preheader.iter6, !dbg !215, !llvm.loop !306

for.inc17.i.iter6:                                ; preds = %for.inc15.i.iter6
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_6_end

for.cond4.i.preheader.iter6:                      ; preds = %for.inc15.i.iter6, %for.cond1.i.preheader.iter6
  %c.0.i79.iter6 = phi i32 [ 0, %for.cond1.i.preheader.iter6 ], [ %inc.i.iter6, %for.inc15.i.iter6 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter6, !dbg !301

iter_6_end:                                       ; preds = %for.inc17.i.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.cond1.i.preheader.iter7

for.cond1.i.preheader.iter7:                      ; preds = %iter_7_start
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
    #dbg_value(i32 0, !210, !DIExpression(), !214)
  br label %for.cond4.i.preheader.iter7, !dbg !215

for.body6.i.iter7:                                ; preds = %for.cond4.i.preheader.iter7, %m_vec_mul_add.exit68.iter7
  %k.0.i78.iter7 = phi i32 [ 0, %for.cond4.i.preheader.iter7 ], [ %add14.i.iter7, %m_vec_mul_add.exit68.iter7 ]
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %mul.i.iter7 = shl nuw nsw i32 %c.0.i79.iter7, 3, !dbg !221
  %add.i.iter7 = or disjoint i32 %mul.i.iter7, %k.0.i78.iter7, !dbg !224
  %add.ptr.idx.i.iter7 = mul nuw nsw i32 %add.i.iter7, 40, !dbg !225
  %add.ptr.i.iter7 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i.iter7, !dbg !225
  %mul8.i.iter7 = shl nuw nsw i32 %c.0.i79.iter7, 3, !dbg !226
  %49 = getelementptr i8, ptr %O, i32 %mul8.i.iter7, !dbg !227
  %arrayidx.i.iter7 = getelementptr i8, ptr %49, i32 7, !dbg !227
  %50 = load i8, ptr %arrayidx.i.iter7, align 1, !dbg !227
  %add11.i.iter7 = or disjoint i32 56, %k.0.i78.iter7, !dbg !228
  %add.ptr13.idx.i.iter7 = mul nuw nsw i32 %add11.i.iter7, 40, !dbg !229
  %add.ptr13.i.iter7 = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i.iter7, !dbg !229
    #dbg_value(i32 5, !230, !DIExpression(), !235)
    #dbg_value(ptr undef, !237, !DIExpression(), !235)
    #dbg_value(i8 undef, !238, !DIExpression(), !235)
    #dbg_value(ptr undef, !239, !DIExpression(), !235)
    #dbg_value(i8 undef, !240, !DIExpression(), !245)
  %conv.i.i27.iter7 = zext i8 %50 to i32, !dbg !247
  %mul.i.i28.iter7 = mul i32 %conv.i.i27.iter7, 134480385, !dbg !248
    #dbg_value(i32 undef, !249, !DIExpression(), !245)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !245)
  %and.i.i29.iter7 = and i32 %mul.i.i28.iter7, -252645136, !dbg !251
    #dbg_value(i32 undef, !252, !DIExpression(), !245)
  %shr.i.i30.iter7 = lshr exact i32 %and.i.i29.iter7, 4, !dbg !253
  %shr1.i.i31.iter7 = lshr exact i32 %and.i.i29.iter7, 3, !dbg !254
  %51 = xor i32 %shr.i.i30.iter7, %shr1.i.i31.iter7, !dbg !255
  %xor2.i.i32.iter7 = xor i32 %51, %mul.i.i28.iter7, !dbg !255
    #dbg_value(i32 undef, !256, !DIExpression(), !235)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !235)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.body.i36.iter7, !dbg !261

for.body.i36.iter7:                               ; preds = %for.body.i36.iter7, %for.body6.i.iter7
  %i.0.i3477.iter7 = phi i32 [ 0, %for.body6.i.iter7 ], [ %inc.i67.iter7, %for.body.i36.iter7 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %arrayidx.i37.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter7, i32 %i.0.i3477.iter7, !dbg !262
  %52 = load i64, ptr %arrayidx.i37.iter7, align 8, !dbg !262
  %and.i38.iter7 = and i64 %52, 1229782938247303441, !dbg !265
  %and1.i39.iter7 = and i32 %xor2.i.i32.iter7, 255, !dbg !266
  %conv.i40.iter7 = zext nneg i32 %and1.i39.iter7 to i64, !dbg !267
  %mul.i41.iter7 = mul i64 %and.i38.iter7, %conv.i40.iter7, !dbg !268
  %shr.i42.iter7 = lshr i64 %52, 1, !dbg !269
  %and3.i43.iter7 = and i64 %shr.i42.iter7, 1229782938247303441, !dbg !270
  %shr4.i44.iter7 = lshr i32 %xor2.i.i32.iter7, 8, !dbg !271
  %and5.i45.iter7 = and i32 %shr4.i44.iter7, 15, !dbg !272
  %conv6.i46.iter7 = zext nneg i32 %and5.i45.iter7 to i64, !dbg !273
  %mul7.i47.iter7 = mul nuw i64 %and3.i43.iter7, %conv6.i46.iter7, !dbg !274
  %xor.i48.iter7 = xor i64 %mul.i41.iter7, %mul7.i47.iter7, !dbg !275
  %arrayidx8.i49.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter7, i32 %i.0.i3477.iter7, !dbg !276
  %53 = load i64, ptr %arrayidx8.i49.iter7, align 8, !dbg !276
  %shr9.i50.iter7 = lshr i64 %53, 2, !dbg !277
  %and10.i51.iter7 = and i64 %shr9.i50.iter7, 1229782938247303441, !dbg !278
  %shr11.i52.iter7 = lshr i32 %xor2.i.i32.iter7, 16, !dbg !279
  %and12.i53.iter7 = and i32 %shr11.i52.iter7, 15, !dbg !280
  %conv13.i54.iter7 = zext nneg i32 %and12.i53.iter7 to i64, !dbg !281
  %mul14.i55.iter7 = mul nuw i64 %and10.i51.iter7, %conv13.i54.iter7, !dbg !282
  %xor15.i56.iter7 = xor i64 %xor.i48.iter7, %mul14.i55.iter7, !dbg !283
  %arrayidx16.i57.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i.iter7, i32 %i.0.i3477.iter7, !dbg !284
  %54 = load i64, ptr %arrayidx16.i57.iter7, align 8, !dbg !284
  %shr17.i58.iter7 = lshr i64 %54, 3, !dbg !285
  %and18.i59.iter7 = and i64 %shr17.i58.iter7, 1229782938247303441, !dbg !286
  %shr19.i60.iter7 = lshr i32 %xor2.i.i32.iter7, 24, !dbg !287
  %and20.i61.iter7 = and i32 %shr19.i60.iter7, 15, !dbg !288
  %conv21.i62.iter7 = zext nneg i32 %and20.i61.iter7 to i64, !dbg !289
  %mul22.i63.iter7 = mul nuw i64 %and18.i59.iter7, %conv21.i62.iter7, !dbg !290
  %xor23.i64.iter7 = xor i64 %xor15.i56.iter7, %mul22.i63.iter7, !dbg !291
  %arrayidx24.i65.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr13.i.iter7, i32 %i.0.i3477.iter7, !dbg !292
  %55 = load i64, ptr %arrayidx24.i65.iter7, align 8, !dbg !293
  %xor25.i66.iter7 = xor i64 %55, %xor23.i64.iter7, !dbg !293
  store i64 %xor25.i66.iter7, ptr %arrayidx24.i65.iter7, align 8, !dbg !293
  %inc.i67.iter7 = add nuw nsw i32 %i.0.i3477.iter7, 1, !dbg !294
    #dbg_value(i32 undef, !258, !DIExpression(), !260)
  %exitcond.i35.not.iter7 = icmp eq i32 %inc.i67.iter7, 5, !dbg !295
  br i1 %exitcond.i35.not.iter7, label %m_vec_mul_add.exit68.iter7, label %for.body.i36.iter7, !dbg !261, !llvm.loop !296

m_vec_mul_add.exit68.iter7:                       ; preds = %for.body.i36.iter7
  %add14.i.iter7 = add nuw nsw i32 %k.0.i78.iter7, 1, !dbg !299
    #dbg_value(i32 undef, !216, !DIExpression(), !220)
  %exitcond.i.not.iter7 = icmp eq i32 %add14.i.iter7, 8, !dbg !300
  br i1 %exitcond.i.not.iter7, label %for.inc15.i.iter7, label %for.body6.i.iter7, !dbg !301, !llvm.loop !302

for.inc15.i.iter7:                                ; preds = %m_vec_mul_add.exit68.iter7
  %inc.i.iter7 = add nuw nsw i32 %c.0.i79.iter7, 1, !dbg !304
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
  %exitcond1.i.not.iter7 = icmp eq i32 %inc.i.iter7, 78, !dbg !305
  br i1 %exitcond1.i.not.iter7, label %for.inc17.i.iter7, label %for.cond4.i.preheader.iter7, !dbg !215, !llvm.loop !306

for.inc17.i.iter7:                                ; preds = %for.inc15.i.iter7
    #dbg_value(i32 undef, !202, !DIExpression(), !207)
  br label %iter_7_end

for.cond4.i.preheader.iter7:                      ; preds = %for.inc15.i.iter7, %for.cond1.i.preheader.iter7
  %c.0.i79.iter7 = phi i32 [ 0, %for.cond1.i.preheader.iter7 ], [ %inc.i.iter7, %for.inc15.i.iter7 ]
    #dbg_value(i32 undef, !210, !DIExpression(), !214)
    #dbg_value(i32 0, !216, !DIExpression(), !220)
  br label %for.body6.i.iter7, !dbg !301

iter_7_end:                                       ; preds = %for.inc17.i.iter7
  br label %mul_add_mat_trans_x_m_mat.exit

iter_0_start81:                                   ; preds = %entry
  br label %for.cond1.preheader.i4.iter0

for.cond1.preheader.i4.iter0:                     ; preds = %iter_0_start81
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter0, !dbg !313

for.body6.i17.iter0:                              ; preds = %for.cond4.i11.preheader.iter0, %m_vec_mul_add.exit.iter0
  %k.0.i1270.iter0 = phi i32 [ 0, %for.cond4.i11.preheader.iter0 ], [ %add13.i.iter0, %m_vec_mul_add.exit.iter0 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter0 = mul nsw i32 %bs_mat_entries_used.1.i72.iter0, 40, !dbg !319
  %add.ptr.i19.iter0 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter0, !dbg !319
  %mul8.i20.iter0 = shl nuw nsw i32 %c.0.i673.iter0, 3, !dbg !322
  %56 = getelementptr i8, ptr %O, i32 %mul8.i20.iter0, !dbg !323
  %arrayidx.i21.iter0 = getelementptr i8, ptr %56, i32 %k.0.i1270.iter0, !dbg !323
  %57 = load i8, ptr %arrayidx.i21.iter0, align 1, !dbg !323
  %add10.i.iter0 = or disjoint i32 0, %k.0.i1270.iter0, !dbg !324
  %add.ptr12.idx.i.iter0 = mul nuw nsw i32 %add10.i.iter0, 40, !dbg !325
  %add.ptr12.i.iter0 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter0, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter0 = zext i8 %57 to i32, !dbg !330
  %mul.i.i.iter0 = mul i32 %conv.i.i.iter0, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter0 = and i32 %mul.i.i.iter0, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter0 = lshr exact i32 %and.i.i.iter0, 4, !dbg !333
  %shr1.i.i.iter0 = lshr exact i32 %and.i.i.iter0, 3, !dbg !334
  %58 = xor i32 %shr.i.i.iter0, %shr1.i.i.iter0, !dbg !335
  %xor2.i.i.iter0 = xor i32 %58, %mul.i.i.iter0, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter0, !dbg !337

for.body.i.iter0:                                 ; preds = %for.body.i.iter0, %for.body6.i17.iter0
  %i.0.i69.iter0 = phi i32 [ 0, %for.body6.i17.iter0 ], [ %inc.i26.iter0, %for.body.i.iter0 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter0, i32 %i.0.i69.iter0, !dbg !338
  %59 = load i64, ptr %arrayidx.i24.iter0, align 8, !dbg !338
  %and.i.iter0 = and i64 %59, 1229782938247303441, !dbg !339
  %and1.i.iter0 = and i32 %xor2.i.i.iter0, 255, !dbg !340
  %conv.i.iter0 = zext nneg i32 %and1.i.iter0 to i64, !dbg !341
  %mul.i25.iter0 = mul i64 %and.i.iter0, %conv.i.iter0, !dbg !342
  %shr.i.iter0 = lshr i64 %59, 1, !dbg !343
  %and3.i.iter0 = and i64 %shr.i.iter0, 1229782938247303441, !dbg !344
  %shr4.i.iter0 = lshr i32 %xor2.i.i.iter0, 8, !dbg !345
  %and5.i.iter0 = and i32 %shr4.i.iter0, 15, !dbg !346
  %conv6.i.iter0 = zext nneg i32 %and5.i.iter0 to i64, !dbg !347
  %mul7.i.iter0 = mul nuw i64 %and3.i.iter0, %conv6.i.iter0, !dbg !348
  %xor.i.iter0 = xor i64 %mul.i25.iter0, %mul7.i.iter0, !dbg !349
  %arrayidx8.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter0, i32 %i.0.i69.iter0, !dbg !350
  %60 = load i64, ptr %arrayidx8.i.iter0, align 8, !dbg !350
  %shr9.i.iter0 = lshr i64 %60, 2, !dbg !351
  %and10.i.iter0 = and i64 %shr9.i.iter0, 1229782938247303441, !dbg !352
  %shr11.i.iter0 = lshr i32 %xor2.i.i.iter0, 16, !dbg !353
  %and12.i.iter0 = and i32 %shr11.i.iter0, 15, !dbg !354
  %conv13.i.iter0 = zext nneg i32 %and12.i.iter0 to i64, !dbg !355
  %mul14.i.iter0 = mul nuw i64 %and10.i.iter0, %conv13.i.iter0, !dbg !356
  %xor15.i.iter0 = xor i64 %xor.i.iter0, %mul14.i.iter0, !dbg !357
  %arrayidx16.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter0, i32 %i.0.i69.iter0, !dbg !358
  %61 = load i64, ptr %arrayidx16.i.iter0, align 8, !dbg !358
  %shr17.i.iter0 = lshr i64 %61, 3, !dbg !359
  %and18.i.iter0 = and i64 %shr17.i.iter0, 1229782938247303441, !dbg !360
  %shr19.i.iter0 = lshr i32 %xor2.i.i.iter0, 24, !dbg !361
  %and20.i.iter0 = and i32 %shr19.i.iter0, 15, !dbg !362
  %conv21.i.iter0 = zext nneg i32 %and20.i.iter0 to i64, !dbg !363
  %mul22.i.iter0 = mul nuw i64 %and18.i.iter0, %conv21.i.iter0, !dbg !364
  %xor23.i.iter0 = xor i64 %xor15.i.iter0, %mul22.i.iter0, !dbg !365
  %arrayidx24.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter0, i32 %i.0.i69.iter0, !dbg !366
  %62 = load i64, ptr %arrayidx24.i.iter0, align 8, !dbg !367
  %xor25.i.iter0 = xor i64 %62, %xor23.i.iter0, !dbg !367
  store i64 %xor25.i.iter0, ptr %arrayidx24.i.iter0, align 8, !dbg !367
  %inc.i26.iter0 = add nuw nsw i32 %i.0.i69.iter0, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter0 = icmp eq i32 %inc.i26.iter0, 5, !dbg !369
  br i1 %exitcond.i23.not.iter0, label %m_vec_mul_add.exit.iter0, label %for.body.i.iter0, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter0:                         ; preds = %for.body.i.iter0
  %add13.i.iter0 = add nuw nsw i32 %k.0.i1270.iter0, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter0 = icmp eq i32 %add13.i.iter0, 8, !dbg !373
  br i1 %exitcond.i13.not.iter0, label %for.inc15.i14.iter0, label %for.body6.i17.iter0, !dbg !374, !llvm.loop !375

for.inc15.i14.iter0:                              ; preds = %m_vec_mul_add.exit.iter0
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter0 = add i32 %bs_mat_entries_used.1.i72.iter0, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter0 = add nuw nsw i32 %c.0.i673.iter0, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter0 = icmp eq i32 %add14.i15.iter0, 78, !dbg !379
  br i1 %exitcond1.i7.not.iter0, label %for.cond1.i5.for.inc17.i8_crit_edge.iter0, label %for.cond4.i11.preheader.iter0, !dbg !313, !llvm.loop !380

for.inc17.i8.iter0:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter0
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_0_end82

for.cond4.i11.preheader.iter0:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter0, %for.inc15.i14.iter0
  %c.0.i673.iter0 = phi i32 [ 0, %for.cond4.i11.preheader.lr.ph.iter0 ], [ %inc.i16.iter0, %for.inc15.i14.iter0 ]
  %bs_mat_entries_used.1.i72.iter0 = phi i32 [ 0, %for.cond4.i11.preheader.lr.ph.iter0 ], [ %add14.i15.iter0, %for.inc15.i14.iter0 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter0, !dbg !374

for.cond4.i11.preheader.lr.ph.iter0:              ; preds = %for.cond1.preheader.i4.iter0
  br label %for.cond4.i11.preheader.iter0, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter0:        ; preds = %for.inc15.i14.iter0
  %split.iter0 = phi i32 [ %add14.i15.iter0, %for.inc15.i14.iter0 ]
  br label %for.inc17.i8.iter0, !dbg !313

iter_0_end82:                                     ; preds = %for.inc17.i8.iter0
  br label %iter_1_start83

iter_1_start83:                                   ; preds = %iter_0_end82
  br label %for.cond1.preheader.i4.iter1

for.cond1.preheader.i4.iter1:                     ; preds = %iter_1_start83
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %63 = add i32 %split.iter0, 77, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter1, !dbg !313

for.body6.i17.iter1:                              ; preds = %for.cond4.i11.preheader.iter1, %m_vec_mul_add.exit.iter1
  %k.0.i1270.iter1 = phi i32 [ 0, %for.cond4.i11.preheader.iter1 ], [ %add13.i.iter1, %m_vec_mul_add.exit.iter1 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter1 = mul nsw i32 %bs_mat_entries_used.1.i72.iter1, 40, !dbg !319
  %add.ptr.i19.iter1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter1, !dbg !319
  %mul8.i20.iter1 = shl nuw nsw i32 %c.0.i673.iter1, 3, !dbg !322
  %64 = getelementptr i8, ptr %O, i32 %mul8.i20.iter1, !dbg !323
  %arrayidx.i21.iter1 = getelementptr i8, ptr %64, i32 %k.0.i1270.iter1, !dbg !323
  %65 = load i8, ptr %arrayidx.i21.iter1, align 1, !dbg !323
  %add10.i.iter1 = or disjoint i32 8, %k.0.i1270.iter1, !dbg !324
  %add.ptr12.idx.i.iter1 = mul nuw nsw i32 %add10.i.iter1, 40, !dbg !325
  %add.ptr12.i.iter1 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter1, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter1 = zext i8 %65 to i32, !dbg !330
  %mul.i.i.iter1 = mul i32 %conv.i.i.iter1, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter1 = and i32 %mul.i.i.iter1, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 4, !dbg !333
  %shr1.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 3, !dbg !334
  %66 = xor i32 %shr.i.i.iter1, %shr1.i.i.iter1, !dbg !335
  %xor2.i.i.iter1 = xor i32 %66, %mul.i.i.iter1, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter1, !dbg !337

for.body.i.iter1:                                 ; preds = %for.body.i.iter1, %for.body6.i17.iter1
  %i.0.i69.iter1 = phi i32 [ 0, %for.body6.i17.iter1 ], [ %inc.i26.iter1, %for.body.i.iter1 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter1, i32 %i.0.i69.iter1, !dbg !338
  %67 = load i64, ptr %arrayidx.i24.iter1, align 8, !dbg !338
  %and.i.iter1 = and i64 %67, 1229782938247303441, !dbg !339
  %and1.i.iter1 = and i32 %xor2.i.i.iter1, 255, !dbg !340
  %conv.i.iter1 = zext nneg i32 %and1.i.iter1 to i64, !dbg !341
  %mul.i25.iter1 = mul i64 %and.i.iter1, %conv.i.iter1, !dbg !342
  %shr.i.iter1 = lshr i64 %67, 1, !dbg !343
  %and3.i.iter1 = and i64 %shr.i.iter1, 1229782938247303441, !dbg !344
  %shr4.i.iter1 = lshr i32 %xor2.i.i.iter1, 8, !dbg !345
  %and5.i.iter1 = and i32 %shr4.i.iter1, 15, !dbg !346
  %conv6.i.iter1 = zext nneg i32 %and5.i.iter1 to i64, !dbg !347
  %mul7.i.iter1 = mul nuw i64 %and3.i.iter1, %conv6.i.iter1, !dbg !348
  %xor.i.iter1 = xor i64 %mul.i25.iter1, %mul7.i.iter1, !dbg !349
  %arrayidx8.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter1, i32 %i.0.i69.iter1, !dbg !350
  %68 = load i64, ptr %arrayidx8.i.iter1, align 8, !dbg !350
  %shr9.i.iter1 = lshr i64 %68, 2, !dbg !351
  %and10.i.iter1 = and i64 %shr9.i.iter1, 1229782938247303441, !dbg !352
  %shr11.i.iter1 = lshr i32 %xor2.i.i.iter1, 16, !dbg !353
  %and12.i.iter1 = and i32 %shr11.i.iter1, 15, !dbg !354
  %conv13.i.iter1 = zext nneg i32 %and12.i.iter1 to i64, !dbg !355
  %mul14.i.iter1 = mul nuw i64 %and10.i.iter1, %conv13.i.iter1, !dbg !356
  %xor15.i.iter1 = xor i64 %xor.i.iter1, %mul14.i.iter1, !dbg !357
  %arrayidx16.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter1, i32 %i.0.i69.iter1, !dbg !358
  %69 = load i64, ptr %arrayidx16.i.iter1, align 8, !dbg !358
  %shr17.i.iter1 = lshr i64 %69, 3, !dbg !359
  %and18.i.iter1 = and i64 %shr17.i.iter1, 1229782938247303441, !dbg !360
  %shr19.i.iter1 = lshr i32 %xor2.i.i.iter1, 24, !dbg !361
  %and20.i.iter1 = and i32 %shr19.i.iter1, 15, !dbg !362
  %conv21.i.iter1 = zext nneg i32 %and20.i.iter1 to i64, !dbg !363
  %mul22.i.iter1 = mul nuw i64 %and18.i.iter1, %conv21.i.iter1, !dbg !364
  %xor23.i.iter1 = xor i64 %xor15.i.iter1, %mul22.i.iter1, !dbg !365
  %arrayidx24.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter1, i32 %i.0.i69.iter1, !dbg !366
  %70 = load i64, ptr %arrayidx24.i.iter1, align 8, !dbg !367
  %xor25.i.iter1 = xor i64 %70, %xor23.i.iter1, !dbg !367
  store i64 %xor25.i.iter1, ptr %arrayidx24.i.iter1, align 8, !dbg !367
  %inc.i26.iter1 = add nuw nsw i32 %i.0.i69.iter1, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter1 = icmp eq i32 %inc.i26.iter1, 5, !dbg !369
  br i1 %exitcond.i23.not.iter1, label %m_vec_mul_add.exit.iter1, label %for.body.i.iter1, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter1:                         ; preds = %for.body.i.iter1
  %add13.i.iter1 = add nuw nsw i32 %k.0.i1270.iter1, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter1 = icmp eq i32 %add13.i.iter1, 8, !dbg !373
  br i1 %exitcond.i13.not.iter1, label %for.inc15.i14.iter1, label %for.body6.i17.iter1, !dbg !374, !llvm.loop !375

for.inc15.i14.iter1:                              ; preds = %m_vec_mul_add.exit.iter1
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter1 = add i32 %bs_mat_entries_used.1.i72.iter1, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter1 = add nuw nsw i32 %c.0.i673.iter1, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter1 = icmp eq i32 %add14.i15.iter1, %63, !dbg !379
  br i1 %exitcond1.i7.not.iter1, label %for.cond1.i5.for.inc17.i8_crit_edge.iter1, label %for.cond4.i11.preheader.iter1, !dbg !313, !llvm.loop !380

for.inc17.i8.iter1:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter1
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_1_end84

for.cond4.i11.preheader.iter1:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter1, %for.inc15.i14.iter1
  %c.0.i673.iter1 = phi i32 [ 1, %for.cond4.i11.preheader.lr.ph.iter1 ], [ %inc.i16.iter1, %for.inc15.i14.iter1 ]
  %bs_mat_entries_used.1.i72.iter1 = phi i32 [ %split.iter0, %for.cond4.i11.preheader.lr.ph.iter1 ], [ %add14.i15.iter1, %for.inc15.i14.iter1 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter1, !dbg !374

for.cond4.i11.preheader.lr.ph.iter1:              ; preds = %for.cond1.preheader.i4.iter1
  br label %for.cond4.i11.preheader.iter1, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter1:        ; preds = %for.inc15.i14.iter1
  %split.iter1 = phi i32 [ %add14.i15.iter1, %for.inc15.i14.iter1 ]
  br label %for.inc17.i8.iter1, !dbg !313

iter_1_end84:                                     ; preds = %for.inc17.i8.iter1
  br label %iter_2_start85

iter_2_start85:                                   ; preds = %iter_1_end84
  br label %for.cond1.preheader.i4.iter2

for.cond1.preheader.i4.iter2:                     ; preds = %iter_2_start85
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %71 = add i32 %split.iter1, 76, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter2, !dbg !313

for.body6.i17.iter2:                              ; preds = %for.cond4.i11.preheader.iter2, %m_vec_mul_add.exit.iter2
  %k.0.i1270.iter2 = phi i32 [ 0, %for.cond4.i11.preheader.iter2 ], [ %add13.i.iter2, %m_vec_mul_add.exit.iter2 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter2 = mul nsw i32 %bs_mat_entries_used.1.i72.iter2, 40, !dbg !319
  %add.ptr.i19.iter2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter2, !dbg !319
  %mul8.i20.iter2 = shl nuw nsw i32 %c.0.i673.iter2, 3, !dbg !322
  %72 = getelementptr i8, ptr %O, i32 %mul8.i20.iter2, !dbg !323
  %arrayidx.i21.iter2 = getelementptr i8, ptr %72, i32 %k.0.i1270.iter2, !dbg !323
  %73 = load i8, ptr %arrayidx.i21.iter2, align 1, !dbg !323
  %add10.i.iter2 = or disjoint i32 16, %k.0.i1270.iter2, !dbg !324
  %add.ptr12.idx.i.iter2 = mul nuw nsw i32 %add10.i.iter2, 40, !dbg !325
  %add.ptr12.i.iter2 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter2, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter2 = zext i8 %73 to i32, !dbg !330
  %mul.i.i.iter2 = mul i32 %conv.i.i.iter2, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter2 = and i32 %mul.i.i.iter2, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 4, !dbg !333
  %shr1.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 3, !dbg !334
  %74 = xor i32 %shr.i.i.iter2, %shr1.i.i.iter2, !dbg !335
  %xor2.i.i.iter2 = xor i32 %74, %mul.i.i.iter2, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter2, !dbg !337

for.body.i.iter2:                                 ; preds = %for.body.i.iter2, %for.body6.i17.iter2
  %i.0.i69.iter2 = phi i32 [ 0, %for.body6.i17.iter2 ], [ %inc.i26.iter2, %for.body.i.iter2 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter2, i32 %i.0.i69.iter2, !dbg !338
  %75 = load i64, ptr %arrayidx.i24.iter2, align 8, !dbg !338
  %and.i.iter2 = and i64 %75, 1229782938247303441, !dbg !339
  %and1.i.iter2 = and i32 %xor2.i.i.iter2, 255, !dbg !340
  %conv.i.iter2 = zext nneg i32 %and1.i.iter2 to i64, !dbg !341
  %mul.i25.iter2 = mul i64 %and.i.iter2, %conv.i.iter2, !dbg !342
  %shr.i.iter2 = lshr i64 %75, 1, !dbg !343
  %and3.i.iter2 = and i64 %shr.i.iter2, 1229782938247303441, !dbg !344
  %shr4.i.iter2 = lshr i32 %xor2.i.i.iter2, 8, !dbg !345
  %and5.i.iter2 = and i32 %shr4.i.iter2, 15, !dbg !346
  %conv6.i.iter2 = zext nneg i32 %and5.i.iter2 to i64, !dbg !347
  %mul7.i.iter2 = mul nuw i64 %and3.i.iter2, %conv6.i.iter2, !dbg !348
  %xor.i.iter2 = xor i64 %mul.i25.iter2, %mul7.i.iter2, !dbg !349
  %arrayidx8.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter2, i32 %i.0.i69.iter2, !dbg !350
  %76 = load i64, ptr %arrayidx8.i.iter2, align 8, !dbg !350
  %shr9.i.iter2 = lshr i64 %76, 2, !dbg !351
  %and10.i.iter2 = and i64 %shr9.i.iter2, 1229782938247303441, !dbg !352
  %shr11.i.iter2 = lshr i32 %xor2.i.i.iter2, 16, !dbg !353
  %and12.i.iter2 = and i32 %shr11.i.iter2, 15, !dbg !354
  %conv13.i.iter2 = zext nneg i32 %and12.i.iter2 to i64, !dbg !355
  %mul14.i.iter2 = mul nuw i64 %and10.i.iter2, %conv13.i.iter2, !dbg !356
  %xor15.i.iter2 = xor i64 %xor.i.iter2, %mul14.i.iter2, !dbg !357
  %arrayidx16.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter2, i32 %i.0.i69.iter2, !dbg !358
  %77 = load i64, ptr %arrayidx16.i.iter2, align 8, !dbg !358
  %shr17.i.iter2 = lshr i64 %77, 3, !dbg !359
  %and18.i.iter2 = and i64 %shr17.i.iter2, 1229782938247303441, !dbg !360
  %shr19.i.iter2 = lshr i32 %xor2.i.i.iter2, 24, !dbg !361
  %and20.i.iter2 = and i32 %shr19.i.iter2, 15, !dbg !362
  %conv21.i.iter2 = zext nneg i32 %and20.i.iter2 to i64, !dbg !363
  %mul22.i.iter2 = mul nuw i64 %and18.i.iter2, %conv21.i.iter2, !dbg !364
  %xor23.i.iter2 = xor i64 %xor15.i.iter2, %mul22.i.iter2, !dbg !365
  %arrayidx24.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter2, i32 %i.0.i69.iter2, !dbg !366
  %78 = load i64, ptr %arrayidx24.i.iter2, align 8, !dbg !367
  %xor25.i.iter2 = xor i64 %78, %xor23.i.iter2, !dbg !367
  store i64 %xor25.i.iter2, ptr %arrayidx24.i.iter2, align 8, !dbg !367
  %inc.i26.iter2 = add nuw nsw i32 %i.0.i69.iter2, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter2 = icmp eq i32 %inc.i26.iter2, 5, !dbg !369
  br i1 %exitcond.i23.not.iter2, label %m_vec_mul_add.exit.iter2, label %for.body.i.iter2, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter2:                         ; preds = %for.body.i.iter2
  %add13.i.iter2 = add nuw nsw i32 %k.0.i1270.iter2, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter2 = icmp eq i32 %add13.i.iter2, 8, !dbg !373
  br i1 %exitcond.i13.not.iter2, label %for.inc15.i14.iter2, label %for.body6.i17.iter2, !dbg !374, !llvm.loop !375

for.inc15.i14.iter2:                              ; preds = %m_vec_mul_add.exit.iter2
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter2 = add i32 %bs_mat_entries_used.1.i72.iter2, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter2 = add nuw nsw i32 %c.0.i673.iter2, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter2 = icmp eq i32 %add14.i15.iter2, %71, !dbg !379
  br i1 %exitcond1.i7.not.iter2, label %for.cond1.i5.for.inc17.i8_crit_edge.iter2, label %for.cond4.i11.preheader.iter2, !dbg !313, !llvm.loop !380

for.inc17.i8.iter2:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter2
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_2_end86

for.cond4.i11.preheader.iter2:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter2, %for.inc15.i14.iter2
  %c.0.i673.iter2 = phi i32 [ 2, %for.cond4.i11.preheader.lr.ph.iter2 ], [ %inc.i16.iter2, %for.inc15.i14.iter2 ]
  %bs_mat_entries_used.1.i72.iter2 = phi i32 [ %split.iter1, %for.cond4.i11.preheader.lr.ph.iter2 ], [ %add14.i15.iter2, %for.inc15.i14.iter2 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter2, !dbg !374

for.cond4.i11.preheader.lr.ph.iter2:              ; preds = %for.cond1.preheader.i4.iter2
  br label %for.cond4.i11.preheader.iter2, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter2:        ; preds = %for.inc15.i14.iter2
  %split.iter2 = phi i32 [ %add14.i15.iter2, %for.inc15.i14.iter2 ]
  br label %for.inc17.i8.iter2, !dbg !313

iter_2_end86:                                     ; preds = %for.inc17.i8.iter2
  br label %iter_3_start87

iter_3_start87:                                   ; preds = %iter_2_end86
  br label %for.cond1.preheader.i4.iter3

for.cond1.preheader.i4.iter3:                     ; preds = %iter_3_start87
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %79 = add i32 %split.iter2, 75, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter3, !dbg !313

for.body6.i17.iter3:                              ; preds = %for.cond4.i11.preheader.iter3, %m_vec_mul_add.exit.iter3
  %k.0.i1270.iter3 = phi i32 [ 0, %for.cond4.i11.preheader.iter3 ], [ %add13.i.iter3, %m_vec_mul_add.exit.iter3 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter3 = mul nsw i32 %bs_mat_entries_used.1.i72.iter3, 40, !dbg !319
  %add.ptr.i19.iter3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter3, !dbg !319
  %mul8.i20.iter3 = shl nuw nsw i32 %c.0.i673.iter3, 3, !dbg !322
  %80 = getelementptr i8, ptr %O, i32 %mul8.i20.iter3, !dbg !323
  %arrayidx.i21.iter3 = getelementptr i8, ptr %80, i32 %k.0.i1270.iter3, !dbg !323
  %81 = load i8, ptr %arrayidx.i21.iter3, align 1, !dbg !323
  %add10.i.iter3 = or disjoint i32 24, %k.0.i1270.iter3, !dbg !324
  %add.ptr12.idx.i.iter3 = mul nuw nsw i32 %add10.i.iter3, 40, !dbg !325
  %add.ptr12.i.iter3 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter3, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter3 = zext i8 %81 to i32, !dbg !330
  %mul.i.i.iter3 = mul i32 %conv.i.i.iter3, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter3 = and i32 %mul.i.i.iter3, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 4, !dbg !333
  %shr1.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 3, !dbg !334
  %82 = xor i32 %shr.i.i.iter3, %shr1.i.i.iter3, !dbg !335
  %xor2.i.i.iter3 = xor i32 %82, %mul.i.i.iter3, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter3, !dbg !337

for.body.i.iter3:                                 ; preds = %for.body.i.iter3, %for.body6.i17.iter3
  %i.0.i69.iter3 = phi i32 [ 0, %for.body6.i17.iter3 ], [ %inc.i26.iter3, %for.body.i.iter3 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter3, i32 %i.0.i69.iter3, !dbg !338
  %83 = load i64, ptr %arrayidx.i24.iter3, align 8, !dbg !338
  %and.i.iter3 = and i64 %83, 1229782938247303441, !dbg !339
  %and1.i.iter3 = and i32 %xor2.i.i.iter3, 255, !dbg !340
  %conv.i.iter3 = zext nneg i32 %and1.i.iter3 to i64, !dbg !341
  %mul.i25.iter3 = mul i64 %and.i.iter3, %conv.i.iter3, !dbg !342
  %shr.i.iter3 = lshr i64 %83, 1, !dbg !343
  %and3.i.iter3 = and i64 %shr.i.iter3, 1229782938247303441, !dbg !344
  %shr4.i.iter3 = lshr i32 %xor2.i.i.iter3, 8, !dbg !345
  %and5.i.iter3 = and i32 %shr4.i.iter3, 15, !dbg !346
  %conv6.i.iter3 = zext nneg i32 %and5.i.iter3 to i64, !dbg !347
  %mul7.i.iter3 = mul nuw i64 %and3.i.iter3, %conv6.i.iter3, !dbg !348
  %xor.i.iter3 = xor i64 %mul.i25.iter3, %mul7.i.iter3, !dbg !349
  %arrayidx8.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter3, i32 %i.0.i69.iter3, !dbg !350
  %84 = load i64, ptr %arrayidx8.i.iter3, align 8, !dbg !350
  %shr9.i.iter3 = lshr i64 %84, 2, !dbg !351
  %and10.i.iter3 = and i64 %shr9.i.iter3, 1229782938247303441, !dbg !352
  %shr11.i.iter3 = lshr i32 %xor2.i.i.iter3, 16, !dbg !353
  %and12.i.iter3 = and i32 %shr11.i.iter3, 15, !dbg !354
  %conv13.i.iter3 = zext nneg i32 %and12.i.iter3 to i64, !dbg !355
  %mul14.i.iter3 = mul nuw i64 %and10.i.iter3, %conv13.i.iter3, !dbg !356
  %xor15.i.iter3 = xor i64 %xor.i.iter3, %mul14.i.iter3, !dbg !357
  %arrayidx16.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter3, i32 %i.0.i69.iter3, !dbg !358
  %85 = load i64, ptr %arrayidx16.i.iter3, align 8, !dbg !358
  %shr17.i.iter3 = lshr i64 %85, 3, !dbg !359
  %and18.i.iter3 = and i64 %shr17.i.iter3, 1229782938247303441, !dbg !360
  %shr19.i.iter3 = lshr i32 %xor2.i.i.iter3, 24, !dbg !361
  %and20.i.iter3 = and i32 %shr19.i.iter3, 15, !dbg !362
  %conv21.i.iter3 = zext nneg i32 %and20.i.iter3 to i64, !dbg !363
  %mul22.i.iter3 = mul nuw i64 %and18.i.iter3, %conv21.i.iter3, !dbg !364
  %xor23.i.iter3 = xor i64 %xor15.i.iter3, %mul22.i.iter3, !dbg !365
  %arrayidx24.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter3, i32 %i.0.i69.iter3, !dbg !366
  %86 = load i64, ptr %arrayidx24.i.iter3, align 8, !dbg !367
  %xor25.i.iter3 = xor i64 %86, %xor23.i.iter3, !dbg !367
  store i64 %xor25.i.iter3, ptr %arrayidx24.i.iter3, align 8, !dbg !367
  %inc.i26.iter3 = add nuw nsw i32 %i.0.i69.iter3, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter3 = icmp eq i32 %inc.i26.iter3, 5, !dbg !369
  br i1 %exitcond.i23.not.iter3, label %m_vec_mul_add.exit.iter3, label %for.body.i.iter3, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter3:                         ; preds = %for.body.i.iter3
  %add13.i.iter3 = add nuw nsw i32 %k.0.i1270.iter3, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter3 = icmp eq i32 %add13.i.iter3, 8, !dbg !373
  br i1 %exitcond.i13.not.iter3, label %for.inc15.i14.iter3, label %for.body6.i17.iter3, !dbg !374, !llvm.loop !375

for.inc15.i14.iter3:                              ; preds = %m_vec_mul_add.exit.iter3
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter3 = add i32 %bs_mat_entries_used.1.i72.iter3, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter3 = add nuw nsw i32 %c.0.i673.iter3, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter3 = icmp eq i32 %add14.i15.iter3, %79, !dbg !379
  br i1 %exitcond1.i7.not.iter3, label %for.cond1.i5.for.inc17.i8_crit_edge.iter3, label %for.cond4.i11.preheader.iter3, !dbg !313, !llvm.loop !380

for.inc17.i8.iter3:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter3
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_3_end88

for.cond4.i11.preheader.iter3:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter3, %for.inc15.i14.iter3
  %c.0.i673.iter3 = phi i32 [ 3, %for.cond4.i11.preheader.lr.ph.iter3 ], [ %inc.i16.iter3, %for.inc15.i14.iter3 ]
  %bs_mat_entries_used.1.i72.iter3 = phi i32 [ %split.iter2, %for.cond4.i11.preheader.lr.ph.iter3 ], [ %add14.i15.iter3, %for.inc15.i14.iter3 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter3, !dbg !374

for.cond4.i11.preheader.lr.ph.iter3:              ; preds = %for.cond1.preheader.i4.iter3
  br label %for.cond4.i11.preheader.iter3, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter3:        ; preds = %for.inc15.i14.iter3
  %split.iter3 = phi i32 [ %add14.i15.iter3, %for.inc15.i14.iter3 ]
  br label %for.inc17.i8.iter3, !dbg !313

iter_3_end88:                                     ; preds = %for.inc17.i8.iter3
  br label %iter_4_start89

iter_4_start89:                                   ; preds = %iter_3_end88
  br label %for.cond1.preheader.i4.iter4

for.cond1.preheader.i4.iter4:                     ; preds = %iter_4_start89
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %87 = add i32 %split.iter3, 74, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter4, !dbg !313

for.body6.i17.iter4:                              ; preds = %for.cond4.i11.preheader.iter4, %m_vec_mul_add.exit.iter4
  %k.0.i1270.iter4 = phi i32 [ 0, %for.cond4.i11.preheader.iter4 ], [ %add13.i.iter4, %m_vec_mul_add.exit.iter4 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter4 = mul nsw i32 %bs_mat_entries_used.1.i72.iter4, 40, !dbg !319
  %add.ptr.i19.iter4 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter4, !dbg !319
  %mul8.i20.iter4 = shl nuw nsw i32 %c.0.i673.iter4, 3, !dbg !322
  %88 = getelementptr i8, ptr %O, i32 %mul8.i20.iter4, !dbg !323
  %arrayidx.i21.iter4 = getelementptr i8, ptr %88, i32 %k.0.i1270.iter4, !dbg !323
  %89 = load i8, ptr %arrayidx.i21.iter4, align 1, !dbg !323
  %add10.i.iter4 = or disjoint i32 32, %k.0.i1270.iter4, !dbg !324
  %add.ptr12.idx.i.iter4 = mul nuw nsw i32 %add10.i.iter4, 40, !dbg !325
  %add.ptr12.i.iter4 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter4, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter4 = zext i8 %89 to i32, !dbg !330
  %mul.i.i.iter4 = mul i32 %conv.i.i.iter4, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter4 = and i32 %mul.i.i.iter4, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 4, !dbg !333
  %shr1.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 3, !dbg !334
  %90 = xor i32 %shr.i.i.iter4, %shr1.i.i.iter4, !dbg !335
  %xor2.i.i.iter4 = xor i32 %90, %mul.i.i.iter4, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter4, !dbg !337

for.body.i.iter4:                                 ; preds = %for.body.i.iter4, %for.body6.i17.iter4
  %i.0.i69.iter4 = phi i32 [ 0, %for.body6.i17.iter4 ], [ %inc.i26.iter4, %for.body.i.iter4 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter4, i32 %i.0.i69.iter4, !dbg !338
  %91 = load i64, ptr %arrayidx.i24.iter4, align 8, !dbg !338
  %and.i.iter4 = and i64 %91, 1229782938247303441, !dbg !339
  %and1.i.iter4 = and i32 %xor2.i.i.iter4, 255, !dbg !340
  %conv.i.iter4 = zext nneg i32 %and1.i.iter4 to i64, !dbg !341
  %mul.i25.iter4 = mul i64 %and.i.iter4, %conv.i.iter4, !dbg !342
  %shr.i.iter4 = lshr i64 %91, 1, !dbg !343
  %and3.i.iter4 = and i64 %shr.i.iter4, 1229782938247303441, !dbg !344
  %shr4.i.iter4 = lshr i32 %xor2.i.i.iter4, 8, !dbg !345
  %and5.i.iter4 = and i32 %shr4.i.iter4, 15, !dbg !346
  %conv6.i.iter4 = zext nneg i32 %and5.i.iter4 to i64, !dbg !347
  %mul7.i.iter4 = mul nuw i64 %and3.i.iter4, %conv6.i.iter4, !dbg !348
  %xor.i.iter4 = xor i64 %mul.i25.iter4, %mul7.i.iter4, !dbg !349
  %arrayidx8.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter4, i32 %i.0.i69.iter4, !dbg !350
  %92 = load i64, ptr %arrayidx8.i.iter4, align 8, !dbg !350
  %shr9.i.iter4 = lshr i64 %92, 2, !dbg !351
  %and10.i.iter4 = and i64 %shr9.i.iter4, 1229782938247303441, !dbg !352
  %shr11.i.iter4 = lshr i32 %xor2.i.i.iter4, 16, !dbg !353
  %and12.i.iter4 = and i32 %shr11.i.iter4, 15, !dbg !354
  %conv13.i.iter4 = zext nneg i32 %and12.i.iter4 to i64, !dbg !355
  %mul14.i.iter4 = mul nuw i64 %and10.i.iter4, %conv13.i.iter4, !dbg !356
  %xor15.i.iter4 = xor i64 %xor.i.iter4, %mul14.i.iter4, !dbg !357
  %arrayidx16.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter4, i32 %i.0.i69.iter4, !dbg !358
  %93 = load i64, ptr %arrayidx16.i.iter4, align 8, !dbg !358
  %shr17.i.iter4 = lshr i64 %93, 3, !dbg !359
  %and18.i.iter4 = and i64 %shr17.i.iter4, 1229782938247303441, !dbg !360
  %shr19.i.iter4 = lshr i32 %xor2.i.i.iter4, 24, !dbg !361
  %and20.i.iter4 = and i32 %shr19.i.iter4, 15, !dbg !362
  %conv21.i.iter4 = zext nneg i32 %and20.i.iter4 to i64, !dbg !363
  %mul22.i.iter4 = mul nuw i64 %and18.i.iter4, %conv21.i.iter4, !dbg !364
  %xor23.i.iter4 = xor i64 %xor15.i.iter4, %mul22.i.iter4, !dbg !365
  %arrayidx24.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter4, i32 %i.0.i69.iter4, !dbg !366
  %94 = load i64, ptr %arrayidx24.i.iter4, align 8, !dbg !367
  %xor25.i.iter4 = xor i64 %94, %xor23.i.iter4, !dbg !367
  store i64 %xor25.i.iter4, ptr %arrayidx24.i.iter4, align 8, !dbg !367
  %inc.i26.iter4 = add nuw nsw i32 %i.0.i69.iter4, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter4 = icmp eq i32 %inc.i26.iter4, 5, !dbg !369
  br i1 %exitcond.i23.not.iter4, label %m_vec_mul_add.exit.iter4, label %for.body.i.iter4, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter4:                         ; preds = %for.body.i.iter4
  %add13.i.iter4 = add nuw nsw i32 %k.0.i1270.iter4, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter4 = icmp eq i32 %add13.i.iter4, 8, !dbg !373
  br i1 %exitcond.i13.not.iter4, label %for.inc15.i14.iter4, label %for.body6.i17.iter4, !dbg !374, !llvm.loop !375

for.inc15.i14.iter4:                              ; preds = %m_vec_mul_add.exit.iter4
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter4 = add i32 %bs_mat_entries_used.1.i72.iter4, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter4 = add nuw nsw i32 %c.0.i673.iter4, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter4 = icmp eq i32 %add14.i15.iter4, %87, !dbg !379
  br i1 %exitcond1.i7.not.iter4, label %for.cond1.i5.for.inc17.i8_crit_edge.iter4, label %for.cond4.i11.preheader.iter4, !dbg !313, !llvm.loop !380

for.inc17.i8.iter4:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter4
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_4_end90

for.cond4.i11.preheader.iter4:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter4, %for.inc15.i14.iter4
  %c.0.i673.iter4 = phi i32 [ 4, %for.cond4.i11.preheader.lr.ph.iter4 ], [ %inc.i16.iter4, %for.inc15.i14.iter4 ]
  %bs_mat_entries_used.1.i72.iter4 = phi i32 [ %split.iter3, %for.cond4.i11.preheader.lr.ph.iter4 ], [ %add14.i15.iter4, %for.inc15.i14.iter4 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter4, !dbg !374

for.cond4.i11.preheader.lr.ph.iter4:              ; preds = %for.cond1.preheader.i4.iter4
  br label %for.cond4.i11.preheader.iter4, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter4:        ; preds = %for.inc15.i14.iter4
  %split.iter4 = phi i32 [ %add14.i15.iter4, %for.inc15.i14.iter4 ]
  br label %for.inc17.i8.iter4, !dbg !313

iter_4_end90:                                     ; preds = %for.inc17.i8.iter4
  br label %iter_5_start91

iter_5_start91:                                   ; preds = %iter_4_end90
  br label %for.cond1.preheader.i4.iter5

for.cond1.preheader.i4.iter5:                     ; preds = %iter_5_start91
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %95 = add i32 %split.iter4, 73, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter5, !dbg !313

for.body6.i17.iter5:                              ; preds = %for.cond4.i11.preheader.iter5, %m_vec_mul_add.exit.iter5
  %k.0.i1270.iter5 = phi i32 [ 0, %for.cond4.i11.preheader.iter5 ], [ %add13.i.iter5, %m_vec_mul_add.exit.iter5 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter5 = mul nsw i32 %bs_mat_entries_used.1.i72.iter5, 40, !dbg !319
  %add.ptr.i19.iter5 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter5, !dbg !319
  %mul8.i20.iter5 = shl nuw nsw i32 %c.0.i673.iter5, 3, !dbg !322
  %96 = getelementptr i8, ptr %O, i32 %mul8.i20.iter5, !dbg !323
  %arrayidx.i21.iter5 = getelementptr i8, ptr %96, i32 %k.0.i1270.iter5, !dbg !323
  %97 = load i8, ptr %arrayidx.i21.iter5, align 1, !dbg !323
  %add10.i.iter5 = or disjoint i32 40, %k.0.i1270.iter5, !dbg !324
  %add.ptr12.idx.i.iter5 = mul nuw nsw i32 %add10.i.iter5, 40, !dbg !325
  %add.ptr12.i.iter5 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter5, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter5 = zext i8 %97 to i32, !dbg !330
  %mul.i.i.iter5 = mul i32 %conv.i.i.iter5, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter5 = and i32 %mul.i.i.iter5, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 4, !dbg !333
  %shr1.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 3, !dbg !334
  %98 = xor i32 %shr.i.i.iter5, %shr1.i.i.iter5, !dbg !335
  %xor2.i.i.iter5 = xor i32 %98, %mul.i.i.iter5, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter5, !dbg !337

for.body.i.iter5:                                 ; preds = %for.body.i.iter5, %for.body6.i17.iter5
  %i.0.i69.iter5 = phi i32 [ 0, %for.body6.i17.iter5 ], [ %inc.i26.iter5, %for.body.i.iter5 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter5, i32 %i.0.i69.iter5, !dbg !338
  %99 = load i64, ptr %arrayidx.i24.iter5, align 8, !dbg !338
  %and.i.iter5 = and i64 %99, 1229782938247303441, !dbg !339
  %and1.i.iter5 = and i32 %xor2.i.i.iter5, 255, !dbg !340
  %conv.i.iter5 = zext nneg i32 %and1.i.iter5 to i64, !dbg !341
  %mul.i25.iter5 = mul i64 %and.i.iter5, %conv.i.iter5, !dbg !342
  %shr.i.iter5 = lshr i64 %99, 1, !dbg !343
  %and3.i.iter5 = and i64 %shr.i.iter5, 1229782938247303441, !dbg !344
  %shr4.i.iter5 = lshr i32 %xor2.i.i.iter5, 8, !dbg !345
  %and5.i.iter5 = and i32 %shr4.i.iter5, 15, !dbg !346
  %conv6.i.iter5 = zext nneg i32 %and5.i.iter5 to i64, !dbg !347
  %mul7.i.iter5 = mul nuw i64 %and3.i.iter5, %conv6.i.iter5, !dbg !348
  %xor.i.iter5 = xor i64 %mul.i25.iter5, %mul7.i.iter5, !dbg !349
  %arrayidx8.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter5, i32 %i.0.i69.iter5, !dbg !350
  %100 = load i64, ptr %arrayidx8.i.iter5, align 8, !dbg !350
  %shr9.i.iter5 = lshr i64 %100, 2, !dbg !351
  %and10.i.iter5 = and i64 %shr9.i.iter5, 1229782938247303441, !dbg !352
  %shr11.i.iter5 = lshr i32 %xor2.i.i.iter5, 16, !dbg !353
  %and12.i.iter5 = and i32 %shr11.i.iter5, 15, !dbg !354
  %conv13.i.iter5 = zext nneg i32 %and12.i.iter5 to i64, !dbg !355
  %mul14.i.iter5 = mul nuw i64 %and10.i.iter5, %conv13.i.iter5, !dbg !356
  %xor15.i.iter5 = xor i64 %xor.i.iter5, %mul14.i.iter5, !dbg !357
  %arrayidx16.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter5, i32 %i.0.i69.iter5, !dbg !358
  %101 = load i64, ptr %arrayidx16.i.iter5, align 8, !dbg !358
  %shr17.i.iter5 = lshr i64 %101, 3, !dbg !359
  %and18.i.iter5 = and i64 %shr17.i.iter5, 1229782938247303441, !dbg !360
  %shr19.i.iter5 = lshr i32 %xor2.i.i.iter5, 24, !dbg !361
  %and20.i.iter5 = and i32 %shr19.i.iter5, 15, !dbg !362
  %conv21.i.iter5 = zext nneg i32 %and20.i.iter5 to i64, !dbg !363
  %mul22.i.iter5 = mul nuw i64 %and18.i.iter5, %conv21.i.iter5, !dbg !364
  %xor23.i.iter5 = xor i64 %xor15.i.iter5, %mul22.i.iter5, !dbg !365
  %arrayidx24.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter5, i32 %i.0.i69.iter5, !dbg !366
  %102 = load i64, ptr %arrayidx24.i.iter5, align 8, !dbg !367
  %xor25.i.iter5 = xor i64 %102, %xor23.i.iter5, !dbg !367
  store i64 %xor25.i.iter5, ptr %arrayidx24.i.iter5, align 8, !dbg !367
  %inc.i26.iter5 = add nuw nsw i32 %i.0.i69.iter5, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter5 = icmp eq i32 %inc.i26.iter5, 5, !dbg !369
  br i1 %exitcond.i23.not.iter5, label %m_vec_mul_add.exit.iter5, label %for.body.i.iter5, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter5:                         ; preds = %for.body.i.iter5
  %add13.i.iter5 = add nuw nsw i32 %k.0.i1270.iter5, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter5 = icmp eq i32 %add13.i.iter5, 8, !dbg !373
  br i1 %exitcond.i13.not.iter5, label %for.inc15.i14.iter5, label %for.body6.i17.iter5, !dbg !374, !llvm.loop !375

for.inc15.i14.iter5:                              ; preds = %m_vec_mul_add.exit.iter5
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter5 = add i32 %bs_mat_entries_used.1.i72.iter5, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter5 = add nuw nsw i32 %c.0.i673.iter5, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter5 = icmp eq i32 %add14.i15.iter5, %95, !dbg !379
  br i1 %exitcond1.i7.not.iter5, label %for.cond1.i5.for.inc17.i8_crit_edge.iter5, label %for.cond4.i11.preheader.iter5, !dbg !313, !llvm.loop !380

for.inc17.i8.iter5:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter5
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_5_end92

for.cond4.i11.preheader.iter5:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter5, %for.inc15.i14.iter5
  %c.0.i673.iter5 = phi i32 [ 5, %for.cond4.i11.preheader.lr.ph.iter5 ], [ %inc.i16.iter5, %for.inc15.i14.iter5 ]
  %bs_mat_entries_used.1.i72.iter5 = phi i32 [ %split.iter4, %for.cond4.i11.preheader.lr.ph.iter5 ], [ %add14.i15.iter5, %for.inc15.i14.iter5 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter5, !dbg !374

for.cond4.i11.preheader.lr.ph.iter5:              ; preds = %for.cond1.preheader.i4.iter5
  br label %for.cond4.i11.preheader.iter5, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter5:        ; preds = %for.inc15.i14.iter5
  %split.iter5 = phi i32 [ %add14.i15.iter5, %for.inc15.i14.iter5 ]
  br label %for.inc17.i8.iter5, !dbg !313

iter_5_end92:                                     ; preds = %for.inc17.i8.iter5
  br label %iter_6_start93

iter_6_start93:                                   ; preds = %iter_5_end92
  br label %for.cond1.preheader.i4.iter6

for.cond1.preheader.i4.iter6:                     ; preds = %iter_6_start93
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %103 = add i32 %split.iter5, 72, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter6, !dbg !313

for.body6.i17.iter6:                              ; preds = %for.cond4.i11.preheader.iter6, %m_vec_mul_add.exit.iter6
  %k.0.i1270.iter6 = phi i32 [ 0, %for.cond4.i11.preheader.iter6 ], [ %add13.i.iter6, %m_vec_mul_add.exit.iter6 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter6 = mul nsw i32 %bs_mat_entries_used.1.i72.iter6, 40, !dbg !319
  %add.ptr.i19.iter6 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter6, !dbg !319
  %mul8.i20.iter6 = shl nuw nsw i32 %c.0.i673.iter6, 3, !dbg !322
  %104 = getelementptr i8, ptr %O, i32 %mul8.i20.iter6, !dbg !323
  %arrayidx.i21.iter6 = getelementptr i8, ptr %104, i32 %k.0.i1270.iter6, !dbg !323
  %105 = load i8, ptr %arrayidx.i21.iter6, align 1, !dbg !323
  %add10.i.iter6 = or disjoint i32 48, %k.0.i1270.iter6, !dbg !324
  %add.ptr12.idx.i.iter6 = mul nuw nsw i32 %add10.i.iter6, 40, !dbg !325
  %add.ptr12.i.iter6 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter6, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter6 = zext i8 %105 to i32, !dbg !330
  %mul.i.i.iter6 = mul i32 %conv.i.i.iter6, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter6 = and i32 %mul.i.i.iter6, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 4, !dbg !333
  %shr1.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 3, !dbg !334
  %106 = xor i32 %shr.i.i.iter6, %shr1.i.i.iter6, !dbg !335
  %xor2.i.i.iter6 = xor i32 %106, %mul.i.i.iter6, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter6, !dbg !337

for.body.i.iter6:                                 ; preds = %for.body.i.iter6, %for.body6.i17.iter6
  %i.0.i69.iter6 = phi i32 [ 0, %for.body6.i17.iter6 ], [ %inc.i26.iter6, %for.body.i.iter6 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter6, i32 %i.0.i69.iter6, !dbg !338
  %107 = load i64, ptr %arrayidx.i24.iter6, align 8, !dbg !338
  %and.i.iter6 = and i64 %107, 1229782938247303441, !dbg !339
  %and1.i.iter6 = and i32 %xor2.i.i.iter6, 255, !dbg !340
  %conv.i.iter6 = zext nneg i32 %and1.i.iter6 to i64, !dbg !341
  %mul.i25.iter6 = mul i64 %and.i.iter6, %conv.i.iter6, !dbg !342
  %shr.i.iter6 = lshr i64 %107, 1, !dbg !343
  %and3.i.iter6 = and i64 %shr.i.iter6, 1229782938247303441, !dbg !344
  %shr4.i.iter6 = lshr i32 %xor2.i.i.iter6, 8, !dbg !345
  %and5.i.iter6 = and i32 %shr4.i.iter6, 15, !dbg !346
  %conv6.i.iter6 = zext nneg i32 %and5.i.iter6 to i64, !dbg !347
  %mul7.i.iter6 = mul nuw i64 %and3.i.iter6, %conv6.i.iter6, !dbg !348
  %xor.i.iter6 = xor i64 %mul.i25.iter6, %mul7.i.iter6, !dbg !349
  %arrayidx8.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter6, i32 %i.0.i69.iter6, !dbg !350
  %108 = load i64, ptr %arrayidx8.i.iter6, align 8, !dbg !350
  %shr9.i.iter6 = lshr i64 %108, 2, !dbg !351
  %and10.i.iter6 = and i64 %shr9.i.iter6, 1229782938247303441, !dbg !352
  %shr11.i.iter6 = lshr i32 %xor2.i.i.iter6, 16, !dbg !353
  %and12.i.iter6 = and i32 %shr11.i.iter6, 15, !dbg !354
  %conv13.i.iter6 = zext nneg i32 %and12.i.iter6 to i64, !dbg !355
  %mul14.i.iter6 = mul nuw i64 %and10.i.iter6, %conv13.i.iter6, !dbg !356
  %xor15.i.iter6 = xor i64 %xor.i.iter6, %mul14.i.iter6, !dbg !357
  %arrayidx16.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter6, i32 %i.0.i69.iter6, !dbg !358
  %109 = load i64, ptr %arrayidx16.i.iter6, align 8, !dbg !358
  %shr17.i.iter6 = lshr i64 %109, 3, !dbg !359
  %and18.i.iter6 = and i64 %shr17.i.iter6, 1229782938247303441, !dbg !360
  %shr19.i.iter6 = lshr i32 %xor2.i.i.iter6, 24, !dbg !361
  %and20.i.iter6 = and i32 %shr19.i.iter6, 15, !dbg !362
  %conv21.i.iter6 = zext nneg i32 %and20.i.iter6 to i64, !dbg !363
  %mul22.i.iter6 = mul nuw i64 %and18.i.iter6, %conv21.i.iter6, !dbg !364
  %xor23.i.iter6 = xor i64 %xor15.i.iter6, %mul22.i.iter6, !dbg !365
  %arrayidx24.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter6, i32 %i.0.i69.iter6, !dbg !366
  %110 = load i64, ptr %arrayidx24.i.iter6, align 8, !dbg !367
  %xor25.i.iter6 = xor i64 %110, %xor23.i.iter6, !dbg !367
  store i64 %xor25.i.iter6, ptr %arrayidx24.i.iter6, align 8, !dbg !367
  %inc.i26.iter6 = add nuw nsw i32 %i.0.i69.iter6, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter6 = icmp eq i32 %inc.i26.iter6, 5, !dbg !369
  br i1 %exitcond.i23.not.iter6, label %m_vec_mul_add.exit.iter6, label %for.body.i.iter6, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter6:                         ; preds = %for.body.i.iter6
  %add13.i.iter6 = add nuw nsw i32 %k.0.i1270.iter6, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter6 = icmp eq i32 %add13.i.iter6, 8, !dbg !373
  br i1 %exitcond.i13.not.iter6, label %for.inc15.i14.iter6, label %for.body6.i17.iter6, !dbg !374, !llvm.loop !375

for.inc15.i14.iter6:                              ; preds = %m_vec_mul_add.exit.iter6
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter6 = add i32 %bs_mat_entries_used.1.i72.iter6, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter6 = add nuw nsw i32 %c.0.i673.iter6, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter6 = icmp eq i32 %add14.i15.iter6, %103, !dbg !379
  br i1 %exitcond1.i7.not.iter6, label %for.cond1.i5.for.inc17.i8_crit_edge.iter6, label %for.cond4.i11.preheader.iter6, !dbg !313, !llvm.loop !380

for.inc17.i8.iter6:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter6
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_6_end94

for.cond4.i11.preheader.iter6:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter6, %for.inc15.i14.iter6
  %c.0.i673.iter6 = phi i32 [ 6, %for.cond4.i11.preheader.lr.ph.iter6 ], [ %inc.i16.iter6, %for.inc15.i14.iter6 ]
  %bs_mat_entries_used.1.i72.iter6 = phi i32 [ %split.iter5, %for.cond4.i11.preheader.lr.ph.iter6 ], [ %add14.i15.iter6, %for.inc15.i14.iter6 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter6, !dbg !374

for.cond4.i11.preheader.lr.ph.iter6:              ; preds = %for.cond1.preheader.i4.iter6
  br label %for.cond4.i11.preheader.iter6, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter6:        ; preds = %for.inc15.i14.iter6
  %split.iter6 = phi i32 [ %add14.i15.iter6, %for.inc15.i14.iter6 ]
  br label %for.inc17.i8.iter6, !dbg !313

iter_6_end94:                                     ; preds = %for.inc17.i8.iter6
  br label %iter_7_start95

iter_7_start95:                                   ; preds = %iter_6_end94
  br label %for.cond1.preheader.i4.iter7

for.cond1.preheader.i4.iter7:                     ; preds = %iter_7_start95
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %111 = add i32 %split.iter6, 71, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter7, !dbg !313

for.body6.i17.iter7:                              ; preds = %for.cond4.i11.preheader.iter7, %m_vec_mul_add.exit.iter7
  %k.0.i1270.iter7 = phi i32 [ 0, %for.cond4.i11.preheader.iter7 ], [ %add13.i.iter7, %m_vec_mul_add.exit.iter7 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter7 = mul nsw i32 %bs_mat_entries_used.1.i72.iter7, 40, !dbg !319
  %add.ptr.i19.iter7 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter7, !dbg !319
  %mul8.i20.iter7 = shl nuw nsw i32 %c.0.i673.iter7, 3, !dbg !322
  %112 = getelementptr i8, ptr %O, i32 %mul8.i20.iter7, !dbg !323
  %arrayidx.i21.iter7 = getelementptr i8, ptr %112, i32 %k.0.i1270.iter7, !dbg !323
  %113 = load i8, ptr %arrayidx.i21.iter7, align 1, !dbg !323
  %add10.i.iter7 = or disjoint i32 56, %k.0.i1270.iter7, !dbg !324
  %add.ptr12.idx.i.iter7 = mul nuw nsw i32 %add10.i.iter7, 40, !dbg !325
  %add.ptr12.i.iter7 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter7, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter7 = zext i8 %113 to i32, !dbg !330
  %mul.i.i.iter7 = mul i32 %conv.i.i.iter7, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter7 = and i32 %mul.i.i.iter7, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 4, !dbg !333
  %shr1.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 3, !dbg !334
  %114 = xor i32 %shr.i.i.iter7, %shr1.i.i.iter7, !dbg !335
  %xor2.i.i.iter7 = xor i32 %114, %mul.i.i.iter7, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter7, !dbg !337

for.body.i.iter7:                                 ; preds = %for.body.i.iter7, %for.body6.i17.iter7
  %i.0.i69.iter7 = phi i32 [ 0, %for.body6.i17.iter7 ], [ %inc.i26.iter7, %for.body.i.iter7 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter7, i32 %i.0.i69.iter7, !dbg !338
  %115 = load i64, ptr %arrayidx.i24.iter7, align 8, !dbg !338
  %and.i.iter7 = and i64 %115, 1229782938247303441, !dbg !339
  %and1.i.iter7 = and i32 %xor2.i.i.iter7, 255, !dbg !340
  %conv.i.iter7 = zext nneg i32 %and1.i.iter7 to i64, !dbg !341
  %mul.i25.iter7 = mul i64 %and.i.iter7, %conv.i.iter7, !dbg !342
  %shr.i.iter7 = lshr i64 %115, 1, !dbg !343
  %and3.i.iter7 = and i64 %shr.i.iter7, 1229782938247303441, !dbg !344
  %shr4.i.iter7 = lshr i32 %xor2.i.i.iter7, 8, !dbg !345
  %and5.i.iter7 = and i32 %shr4.i.iter7, 15, !dbg !346
  %conv6.i.iter7 = zext nneg i32 %and5.i.iter7 to i64, !dbg !347
  %mul7.i.iter7 = mul nuw i64 %and3.i.iter7, %conv6.i.iter7, !dbg !348
  %xor.i.iter7 = xor i64 %mul.i25.iter7, %mul7.i.iter7, !dbg !349
  %arrayidx8.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter7, i32 %i.0.i69.iter7, !dbg !350
  %116 = load i64, ptr %arrayidx8.i.iter7, align 8, !dbg !350
  %shr9.i.iter7 = lshr i64 %116, 2, !dbg !351
  %and10.i.iter7 = and i64 %shr9.i.iter7, 1229782938247303441, !dbg !352
  %shr11.i.iter7 = lshr i32 %xor2.i.i.iter7, 16, !dbg !353
  %and12.i.iter7 = and i32 %shr11.i.iter7, 15, !dbg !354
  %conv13.i.iter7 = zext nneg i32 %and12.i.iter7 to i64, !dbg !355
  %mul14.i.iter7 = mul nuw i64 %and10.i.iter7, %conv13.i.iter7, !dbg !356
  %xor15.i.iter7 = xor i64 %xor.i.iter7, %mul14.i.iter7, !dbg !357
  %arrayidx16.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter7, i32 %i.0.i69.iter7, !dbg !358
  %117 = load i64, ptr %arrayidx16.i.iter7, align 8, !dbg !358
  %shr17.i.iter7 = lshr i64 %117, 3, !dbg !359
  %and18.i.iter7 = and i64 %shr17.i.iter7, 1229782938247303441, !dbg !360
  %shr19.i.iter7 = lshr i32 %xor2.i.i.iter7, 24, !dbg !361
  %and20.i.iter7 = and i32 %shr19.i.iter7, 15, !dbg !362
  %conv21.i.iter7 = zext nneg i32 %and20.i.iter7 to i64, !dbg !363
  %mul22.i.iter7 = mul nuw i64 %and18.i.iter7, %conv21.i.iter7, !dbg !364
  %xor23.i.iter7 = xor i64 %xor15.i.iter7, %mul22.i.iter7, !dbg !365
  %arrayidx24.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter7, i32 %i.0.i69.iter7, !dbg !366
  %118 = load i64, ptr %arrayidx24.i.iter7, align 8, !dbg !367
  %xor25.i.iter7 = xor i64 %118, %xor23.i.iter7, !dbg !367
  store i64 %xor25.i.iter7, ptr %arrayidx24.i.iter7, align 8, !dbg !367
  %inc.i26.iter7 = add nuw nsw i32 %i.0.i69.iter7, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter7 = icmp eq i32 %inc.i26.iter7, 5, !dbg !369
  br i1 %exitcond.i23.not.iter7, label %m_vec_mul_add.exit.iter7, label %for.body.i.iter7, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter7:                         ; preds = %for.body.i.iter7
  %add13.i.iter7 = add nuw nsw i32 %k.0.i1270.iter7, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter7 = icmp eq i32 %add13.i.iter7, 8, !dbg !373
  br i1 %exitcond.i13.not.iter7, label %for.inc15.i14.iter7, label %for.body6.i17.iter7, !dbg !374, !llvm.loop !375

for.inc15.i14.iter7:                              ; preds = %m_vec_mul_add.exit.iter7
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter7 = add i32 %bs_mat_entries_used.1.i72.iter7, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter7 = add nuw nsw i32 %c.0.i673.iter7, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter7 = icmp eq i32 %add14.i15.iter7, %111, !dbg !379
  br i1 %exitcond1.i7.not.iter7, label %for.cond1.i5.for.inc17.i8_crit_edge.iter7, label %for.cond4.i11.preheader.iter7, !dbg !313, !llvm.loop !380

for.inc17.i8.iter7:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter7
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_7_end96

for.cond4.i11.preheader.iter7:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter7, %for.inc15.i14.iter7
  %c.0.i673.iter7 = phi i32 [ 7, %for.cond4.i11.preheader.lr.ph.iter7 ], [ %inc.i16.iter7, %for.inc15.i14.iter7 ]
  %bs_mat_entries_used.1.i72.iter7 = phi i32 [ %split.iter6, %for.cond4.i11.preheader.lr.ph.iter7 ], [ %add14.i15.iter7, %for.inc15.i14.iter7 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter7, !dbg !374

for.cond4.i11.preheader.lr.ph.iter7:              ; preds = %for.cond1.preheader.i4.iter7
  br label %for.cond4.i11.preheader.iter7, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter7:        ; preds = %for.inc15.i14.iter7
  %split.iter7 = phi i32 [ %add14.i15.iter7, %for.inc15.i14.iter7 ]
  br label %for.inc17.i8.iter7, !dbg !313

iter_7_end96:                                     ; preds = %for.inc17.i8.iter7
  br label %iter_8_start

iter_8_start:                                     ; preds = %iter_7_end96
  br label %for.cond1.preheader.i4.iter8

for.cond1.preheader.i4.iter8:                     ; preds = %iter_8_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %119 = add i32 %split.iter7, 70, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter8, !dbg !313

for.body6.i17.iter8:                              ; preds = %for.cond4.i11.preheader.iter8, %m_vec_mul_add.exit.iter8
  %k.0.i1270.iter8 = phi i32 [ 0, %for.cond4.i11.preheader.iter8 ], [ %add13.i.iter8, %m_vec_mul_add.exit.iter8 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter8 = mul nsw i32 %bs_mat_entries_used.1.i72.iter8, 40, !dbg !319
  %add.ptr.i19.iter8 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter8, !dbg !319
  %mul8.i20.iter8 = shl nuw nsw i32 %c.0.i673.iter8, 3, !dbg !322
  %120 = getelementptr i8, ptr %O, i32 %mul8.i20.iter8, !dbg !323
  %arrayidx.i21.iter8 = getelementptr i8, ptr %120, i32 %k.0.i1270.iter8, !dbg !323
  %121 = load i8, ptr %arrayidx.i21.iter8, align 1, !dbg !323
  %add10.i.iter8 = or disjoint i32 64, %k.0.i1270.iter8, !dbg !324
  %add.ptr12.idx.i.iter8 = mul nuw nsw i32 %add10.i.iter8, 40, !dbg !325
  %add.ptr12.i.iter8 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter8, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter8 = zext i8 %121 to i32, !dbg !330
  %mul.i.i.iter8 = mul i32 %conv.i.i.iter8, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter8 = and i32 %mul.i.i.iter8, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter8 = lshr exact i32 %and.i.i.iter8, 4, !dbg !333
  %shr1.i.i.iter8 = lshr exact i32 %and.i.i.iter8, 3, !dbg !334
  %122 = xor i32 %shr.i.i.iter8, %shr1.i.i.iter8, !dbg !335
  %xor2.i.i.iter8 = xor i32 %122, %mul.i.i.iter8, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter8, !dbg !337

for.body.i.iter8:                                 ; preds = %for.body.i.iter8, %for.body6.i17.iter8
  %i.0.i69.iter8 = phi i32 [ 0, %for.body6.i17.iter8 ], [ %inc.i26.iter8, %for.body.i.iter8 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter8, i32 %i.0.i69.iter8, !dbg !338
  %123 = load i64, ptr %arrayidx.i24.iter8, align 8, !dbg !338
  %and.i.iter8 = and i64 %123, 1229782938247303441, !dbg !339
  %and1.i.iter8 = and i32 %xor2.i.i.iter8, 255, !dbg !340
  %conv.i.iter8 = zext nneg i32 %and1.i.iter8 to i64, !dbg !341
  %mul.i25.iter8 = mul i64 %and.i.iter8, %conv.i.iter8, !dbg !342
  %shr.i.iter8 = lshr i64 %123, 1, !dbg !343
  %and3.i.iter8 = and i64 %shr.i.iter8, 1229782938247303441, !dbg !344
  %shr4.i.iter8 = lshr i32 %xor2.i.i.iter8, 8, !dbg !345
  %and5.i.iter8 = and i32 %shr4.i.iter8, 15, !dbg !346
  %conv6.i.iter8 = zext nneg i32 %and5.i.iter8 to i64, !dbg !347
  %mul7.i.iter8 = mul nuw i64 %and3.i.iter8, %conv6.i.iter8, !dbg !348
  %xor.i.iter8 = xor i64 %mul.i25.iter8, %mul7.i.iter8, !dbg !349
  %arrayidx8.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter8, i32 %i.0.i69.iter8, !dbg !350
  %124 = load i64, ptr %arrayidx8.i.iter8, align 8, !dbg !350
  %shr9.i.iter8 = lshr i64 %124, 2, !dbg !351
  %and10.i.iter8 = and i64 %shr9.i.iter8, 1229782938247303441, !dbg !352
  %shr11.i.iter8 = lshr i32 %xor2.i.i.iter8, 16, !dbg !353
  %and12.i.iter8 = and i32 %shr11.i.iter8, 15, !dbg !354
  %conv13.i.iter8 = zext nneg i32 %and12.i.iter8 to i64, !dbg !355
  %mul14.i.iter8 = mul nuw i64 %and10.i.iter8, %conv13.i.iter8, !dbg !356
  %xor15.i.iter8 = xor i64 %xor.i.iter8, %mul14.i.iter8, !dbg !357
  %arrayidx16.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter8, i32 %i.0.i69.iter8, !dbg !358
  %125 = load i64, ptr %arrayidx16.i.iter8, align 8, !dbg !358
  %shr17.i.iter8 = lshr i64 %125, 3, !dbg !359
  %and18.i.iter8 = and i64 %shr17.i.iter8, 1229782938247303441, !dbg !360
  %shr19.i.iter8 = lshr i32 %xor2.i.i.iter8, 24, !dbg !361
  %and20.i.iter8 = and i32 %shr19.i.iter8, 15, !dbg !362
  %conv21.i.iter8 = zext nneg i32 %and20.i.iter8 to i64, !dbg !363
  %mul22.i.iter8 = mul nuw i64 %and18.i.iter8, %conv21.i.iter8, !dbg !364
  %xor23.i.iter8 = xor i64 %xor15.i.iter8, %mul22.i.iter8, !dbg !365
  %arrayidx24.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter8, i32 %i.0.i69.iter8, !dbg !366
  %126 = load i64, ptr %arrayidx24.i.iter8, align 8, !dbg !367
  %xor25.i.iter8 = xor i64 %126, %xor23.i.iter8, !dbg !367
  store i64 %xor25.i.iter8, ptr %arrayidx24.i.iter8, align 8, !dbg !367
  %inc.i26.iter8 = add nuw nsw i32 %i.0.i69.iter8, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter8 = icmp eq i32 %inc.i26.iter8, 5, !dbg !369
  br i1 %exitcond.i23.not.iter8, label %m_vec_mul_add.exit.iter8, label %for.body.i.iter8, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter8:                         ; preds = %for.body.i.iter8
  %add13.i.iter8 = add nuw nsw i32 %k.0.i1270.iter8, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter8 = icmp eq i32 %add13.i.iter8, 8, !dbg !373
  br i1 %exitcond.i13.not.iter8, label %for.inc15.i14.iter8, label %for.body6.i17.iter8, !dbg !374, !llvm.loop !375

for.inc15.i14.iter8:                              ; preds = %m_vec_mul_add.exit.iter8
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter8 = add i32 %bs_mat_entries_used.1.i72.iter8, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter8 = add nuw nsw i32 %c.0.i673.iter8, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter8 = icmp eq i32 %add14.i15.iter8, %119, !dbg !379
  br i1 %exitcond1.i7.not.iter8, label %for.cond1.i5.for.inc17.i8_crit_edge.iter8, label %for.cond4.i11.preheader.iter8, !dbg !313, !llvm.loop !380

for.inc17.i8.iter8:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter8
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_8_end

for.cond4.i11.preheader.iter8:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter8, %for.inc15.i14.iter8
  %c.0.i673.iter8 = phi i32 [ 8, %for.cond4.i11.preheader.lr.ph.iter8 ], [ %inc.i16.iter8, %for.inc15.i14.iter8 ]
  %bs_mat_entries_used.1.i72.iter8 = phi i32 [ %split.iter7, %for.cond4.i11.preheader.lr.ph.iter8 ], [ %add14.i15.iter8, %for.inc15.i14.iter8 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter8, !dbg !374

for.cond4.i11.preheader.lr.ph.iter8:              ; preds = %for.cond1.preheader.i4.iter8
  br label %for.cond4.i11.preheader.iter8, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter8:        ; preds = %for.inc15.i14.iter8
  %split.iter8 = phi i32 [ %add14.i15.iter8, %for.inc15.i14.iter8 ]
  br label %for.inc17.i8.iter8, !dbg !313

iter_8_end:                                       ; preds = %for.inc17.i8.iter8
  br label %iter_9_start

iter_9_start:                                     ; preds = %iter_8_end
  br label %for.cond1.preheader.i4.iter9

for.cond1.preheader.i4.iter9:                     ; preds = %iter_9_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %127 = add i32 %split.iter8, 69, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter9, !dbg !313

for.body6.i17.iter9:                              ; preds = %for.cond4.i11.preheader.iter9, %m_vec_mul_add.exit.iter9
  %k.0.i1270.iter9 = phi i32 [ 0, %for.cond4.i11.preheader.iter9 ], [ %add13.i.iter9, %m_vec_mul_add.exit.iter9 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter9 = mul nsw i32 %bs_mat_entries_used.1.i72.iter9, 40, !dbg !319
  %add.ptr.i19.iter9 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter9, !dbg !319
  %mul8.i20.iter9 = shl nuw nsw i32 %c.0.i673.iter9, 3, !dbg !322
  %128 = getelementptr i8, ptr %O, i32 %mul8.i20.iter9, !dbg !323
  %arrayidx.i21.iter9 = getelementptr i8, ptr %128, i32 %k.0.i1270.iter9, !dbg !323
  %129 = load i8, ptr %arrayidx.i21.iter9, align 1, !dbg !323
  %add10.i.iter9 = or disjoint i32 72, %k.0.i1270.iter9, !dbg !324
  %add.ptr12.idx.i.iter9 = mul nuw nsw i32 %add10.i.iter9, 40, !dbg !325
  %add.ptr12.i.iter9 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter9, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter9 = zext i8 %129 to i32, !dbg !330
  %mul.i.i.iter9 = mul i32 %conv.i.i.iter9, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter9 = and i32 %mul.i.i.iter9, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter9 = lshr exact i32 %and.i.i.iter9, 4, !dbg !333
  %shr1.i.i.iter9 = lshr exact i32 %and.i.i.iter9, 3, !dbg !334
  %130 = xor i32 %shr.i.i.iter9, %shr1.i.i.iter9, !dbg !335
  %xor2.i.i.iter9 = xor i32 %130, %mul.i.i.iter9, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter9, !dbg !337

for.body.i.iter9:                                 ; preds = %for.body.i.iter9, %for.body6.i17.iter9
  %i.0.i69.iter9 = phi i32 [ 0, %for.body6.i17.iter9 ], [ %inc.i26.iter9, %for.body.i.iter9 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter9, i32 %i.0.i69.iter9, !dbg !338
  %131 = load i64, ptr %arrayidx.i24.iter9, align 8, !dbg !338
  %and.i.iter9 = and i64 %131, 1229782938247303441, !dbg !339
  %and1.i.iter9 = and i32 %xor2.i.i.iter9, 255, !dbg !340
  %conv.i.iter9 = zext nneg i32 %and1.i.iter9 to i64, !dbg !341
  %mul.i25.iter9 = mul i64 %and.i.iter9, %conv.i.iter9, !dbg !342
  %shr.i.iter9 = lshr i64 %131, 1, !dbg !343
  %and3.i.iter9 = and i64 %shr.i.iter9, 1229782938247303441, !dbg !344
  %shr4.i.iter9 = lshr i32 %xor2.i.i.iter9, 8, !dbg !345
  %and5.i.iter9 = and i32 %shr4.i.iter9, 15, !dbg !346
  %conv6.i.iter9 = zext nneg i32 %and5.i.iter9 to i64, !dbg !347
  %mul7.i.iter9 = mul nuw i64 %and3.i.iter9, %conv6.i.iter9, !dbg !348
  %xor.i.iter9 = xor i64 %mul.i25.iter9, %mul7.i.iter9, !dbg !349
  %arrayidx8.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter9, i32 %i.0.i69.iter9, !dbg !350
  %132 = load i64, ptr %arrayidx8.i.iter9, align 8, !dbg !350
  %shr9.i.iter9 = lshr i64 %132, 2, !dbg !351
  %and10.i.iter9 = and i64 %shr9.i.iter9, 1229782938247303441, !dbg !352
  %shr11.i.iter9 = lshr i32 %xor2.i.i.iter9, 16, !dbg !353
  %and12.i.iter9 = and i32 %shr11.i.iter9, 15, !dbg !354
  %conv13.i.iter9 = zext nneg i32 %and12.i.iter9 to i64, !dbg !355
  %mul14.i.iter9 = mul nuw i64 %and10.i.iter9, %conv13.i.iter9, !dbg !356
  %xor15.i.iter9 = xor i64 %xor.i.iter9, %mul14.i.iter9, !dbg !357
  %arrayidx16.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter9, i32 %i.0.i69.iter9, !dbg !358
  %133 = load i64, ptr %arrayidx16.i.iter9, align 8, !dbg !358
  %shr17.i.iter9 = lshr i64 %133, 3, !dbg !359
  %and18.i.iter9 = and i64 %shr17.i.iter9, 1229782938247303441, !dbg !360
  %shr19.i.iter9 = lshr i32 %xor2.i.i.iter9, 24, !dbg !361
  %and20.i.iter9 = and i32 %shr19.i.iter9, 15, !dbg !362
  %conv21.i.iter9 = zext nneg i32 %and20.i.iter9 to i64, !dbg !363
  %mul22.i.iter9 = mul nuw i64 %and18.i.iter9, %conv21.i.iter9, !dbg !364
  %xor23.i.iter9 = xor i64 %xor15.i.iter9, %mul22.i.iter9, !dbg !365
  %arrayidx24.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter9, i32 %i.0.i69.iter9, !dbg !366
  %134 = load i64, ptr %arrayidx24.i.iter9, align 8, !dbg !367
  %xor25.i.iter9 = xor i64 %134, %xor23.i.iter9, !dbg !367
  store i64 %xor25.i.iter9, ptr %arrayidx24.i.iter9, align 8, !dbg !367
  %inc.i26.iter9 = add nuw nsw i32 %i.0.i69.iter9, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter9 = icmp eq i32 %inc.i26.iter9, 5, !dbg !369
  br i1 %exitcond.i23.not.iter9, label %m_vec_mul_add.exit.iter9, label %for.body.i.iter9, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter9:                         ; preds = %for.body.i.iter9
  %add13.i.iter9 = add nuw nsw i32 %k.0.i1270.iter9, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter9 = icmp eq i32 %add13.i.iter9, 8, !dbg !373
  br i1 %exitcond.i13.not.iter9, label %for.inc15.i14.iter9, label %for.body6.i17.iter9, !dbg !374, !llvm.loop !375

for.inc15.i14.iter9:                              ; preds = %m_vec_mul_add.exit.iter9
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter9 = add i32 %bs_mat_entries_used.1.i72.iter9, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter9 = add nuw nsw i32 %c.0.i673.iter9, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter9 = icmp eq i32 %add14.i15.iter9, %127, !dbg !379
  br i1 %exitcond1.i7.not.iter9, label %for.cond1.i5.for.inc17.i8_crit_edge.iter9, label %for.cond4.i11.preheader.iter9, !dbg !313, !llvm.loop !380

for.inc17.i8.iter9:                               ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter9
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_9_end

for.cond4.i11.preheader.iter9:                    ; preds = %for.cond4.i11.preheader.lr.ph.iter9, %for.inc15.i14.iter9
  %c.0.i673.iter9 = phi i32 [ 9, %for.cond4.i11.preheader.lr.ph.iter9 ], [ %inc.i16.iter9, %for.inc15.i14.iter9 ]
  %bs_mat_entries_used.1.i72.iter9 = phi i32 [ %split.iter8, %for.cond4.i11.preheader.lr.ph.iter9 ], [ %add14.i15.iter9, %for.inc15.i14.iter9 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter9, !dbg !374

for.cond4.i11.preheader.lr.ph.iter9:              ; preds = %for.cond1.preheader.i4.iter9
  br label %for.cond4.i11.preheader.iter9, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter9:        ; preds = %for.inc15.i14.iter9
  %split.iter9 = phi i32 [ %add14.i15.iter9, %for.inc15.i14.iter9 ]
  br label %for.inc17.i8.iter9, !dbg !313

iter_9_end:                                       ; preds = %for.inc17.i8.iter9
  br label %iter_10_start

iter_10_start:                                    ; preds = %iter_9_end
  br label %for.cond1.preheader.i4.iter10

for.cond1.preheader.i4.iter10:                    ; preds = %iter_10_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %135 = add i32 %split.iter9, 68, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter10, !dbg !313

for.body6.i17.iter10:                             ; preds = %for.cond4.i11.preheader.iter10, %m_vec_mul_add.exit.iter10
  %k.0.i1270.iter10 = phi i32 [ 0, %for.cond4.i11.preheader.iter10 ], [ %add13.i.iter10, %m_vec_mul_add.exit.iter10 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter10 = mul nsw i32 %bs_mat_entries_used.1.i72.iter10, 40, !dbg !319
  %add.ptr.i19.iter10 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter10, !dbg !319
  %mul8.i20.iter10 = shl nuw nsw i32 %c.0.i673.iter10, 3, !dbg !322
  %136 = getelementptr i8, ptr %O, i32 %mul8.i20.iter10, !dbg !323
  %arrayidx.i21.iter10 = getelementptr i8, ptr %136, i32 %k.0.i1270.iter10, !dbg !323
  %137 = load i8, ptr %arrayidx.i21.iter10, align 1, !dbg !323
  %add10.i.iter10 = or disjoint i32 80, %k.0.i1270.iter10, !dbg !324
  %add.ptr12.idx.i.iter10 = mul nuw nsw i32 %add10.i.iter10, 40, !dbg !325
  %add.ptr12.i.iter10 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter10, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter10 = zext i8 %137 to i32, !dbg !330
  %mul.i.i.iter10 = mul i32 %conv.i.i.iter10, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter10 = and i32 %mul.i.i.iter10, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter10 = lshr exact i32 %and.i.i.iter10, 4, !dbg !333
  %shr1.i.i.iter10 = lshr exact i32 %and.i.i.iter10, 3, !dbg !334
  %138 = xor i32 %shr.i.i.iter10, %shr1.i.i.iter10, !dbg !335
  %xor2.i.i.iter10 = xor i32 %138, %mul.i.i.iter10, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter10, !dbg !337

for.body.i.iter10:                                ; preds = %for.body.i.iter10, %for.body6.i17.iter10
  %i.0.i69.iter10 = phi i32 [ 0, %for.body6.i17.iter10 ], [ %inc.i26.iter10, %for.body.i.iter10 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter10, i32 %i.0.i69.iter10, !dbg !338
  %139 = load i64, ptr %arrayidx.i24.iter10, align 8, !dbg !338
  %and.i.iter10 = and i64 %139, 1229782938247303441, !dbg !339
  %and1.i.iter10 = and i32 %xor2.i.i.iter10, 255, !dbg !340
  %conv.i.iter10 = zext nneg i32 %and1.i.iter10 to i64, !dbg !341
  %mul.i25.iter10 = mul i64 %and.i.iter10, %conv.i.iter10, !dbg !342
  %shr.i.iter10 = lshr i64 %139, 1, !dbg !343
  %and3.i.iter10 = and i64 %shr.i.iter10, 1229782938247303441, !dbg !344
  %shr4.i.iter10 = lshr i32 %xor2.i.i.iter10, 8, !dbg !345
  %and5.i.iter10 = and i32 %shr4.i.iter10, 15, !dbg !346
  %conv6.i.iter10 = zext nneg i32 %and5.i.iter10 to i64, !dbg !347
  %mul7.i.iter10 = mul nuw i64 %and3.i.iter10, %conv6.i.iter10, !dbg !348
  %xor.i.iter10 = xor i64 %mul.i25.iter10, %mul7.i.iter10, !dbg !349
  %arrayidx8.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter10, i32 %i.0.i69.iter10, !dbg !350
  %140 = load i64, ptr %arrayidx8.i.iter10, align 8, !dbg !350
  %shr9.i.iter10 = lshr i64 %140, 2, !dbg !351
  %and10.i.iter10 = and i64 %shr9.i.iter10, 1229782938247303441, !dbg !352
  %shr11.i.iter10 = lshr i32 %xor2.i.i.iter10, 16, !dbg !353
  %and12.i.iter10 = and i32 %shr11.i.iter10, 15, !dbg !354
  %conv13.i.iter10 = zext nneg i32 %and12.i.iter10 to i64, !dbg !355
  %mul14.i.iter10 = mul nuw i64 %and10.i.iter10, %conv13.i.iter10, !dbg !356
  %xor15.i.iter10 = xor i64 %xor.i.iter10, %mul14.i.iter10, !dbg !357
  %arrayidx16.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter10, i32 %i.0.i69.iter10, !dbg !358
  %141 = load i64, ptr %arrayidx16.i.iter10, align 8, !dbg !358
  %shr17.i.iter10 = lshr i64 %141, 3, !dbg !359
  %and18.i.iter10 = and i64 %shr17.i.iter10, 1229782938247303441, !dbg !360
  %shr19.i.iter10 = lshr i32 %xor2.i.i.iter10, 24, !dbg !361
  %and20.i.iter10 = and i32 %shr19.i.iter10, 15, !dbg !362
  %conv21.i.iter10 = zext nneg i32 %and20.i.iter10 to i64, !dbg !363
  %mul22.i.iter10 = mul nuw i64 %and18.i.iter10, %conv21.i.iter10, !dbg !364
  %xor23.i.iter10 = xor i64 %xor15.i.iter10, %mul22.i.iter10, !dbg !365
  %arrayidx24.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter10, i32 %i.0.i69.iter10, !dbg !366
  %142 = load i64, ptr %arrayidx24.i.iter10, align 8, !dbg !367
  %xor25.i.iter10 = xor i64 %142, %xor23.i.iter10, !dbg !367
  store i64 %xor25.i.iter10, ptr %arrayidx24.i.iter10, align 8, !dbg !367
  %inc.i26.iter10 = add nuw nsw i32 %i.0.i69.iter10, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter10 = icmp eq i32 %inc.i26.iter10, 5, !dbg !369
  br i1 %exitcond.i23.not.iter10, label %m_vec_mul_add.exit.iter10, label %for.body.i.iter10, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter10:                        ; preds = %for.body.i.iter10
  %add13.i.iter10 = add nuw nsw i32 %k.0.i1270.iter10, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter10 = icmp eq i32 %add13.i.iter10, 8, !dbg !373
  br i1 %exitcond.i13.not.iter10, label %for.inc15.i14.iter10, label %for.body6.i17.iter10, !dbg !374, !llvm.loop !375

for.inc15.i14.iter10:                             ; preds = %m_vec_mul_add.exit.iter10
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter10 = add i32 %bs_mat_entries_used.1.i72.iter10, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter10 = add nuw nsw i32 %c.0.i673.iter10, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter10 = icmp eq i32 %add14.i15.iter10, %135, !dbg !379
  br i1 %exitcond1.i7.not.iter10, label %for.cond1.i5.for.inc17.i8_crit_edge.iter10, label %for.cond4.i11.preheader.iter10, !dbg !313, !llvm.loop !380

for.inc17.i8.iter10:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter10
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_10_end

for.cond4.i11.preheader.iter10:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter10, %for.inc15.i14.iter10
  %c.0.i673.iter10 = phi i32 [ 10, %for.cond4.i11.preheader.lr.ph.iter10 ], [ %inc.i16.iter10, %for.inc15.i14.iter10 ]
  %bs_mat_entries_used.1.i72.iter10 = phi i32 [ %split.iter9, %for.cond4.i11.preheader.lr.ph.iter10 ], [ %add14.i15.iter10, %for.inc15.i14.iter10 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter10, !dbg !374

for.cond4.i11.preheader.lr.ph.iter10:             ; preds = %for.cond1.preheader.i4.iter10
  br label %for.cond4.i11.preheader.iter10, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter10:       ; preds = %for.inc15.i14.iter10
  %split.iter10 = phi i32 [ %add14.i15.iter10, %for.inc15.i14.iter10 ]
  br label %for.inc17.i8.iter10, !dbg !313

iter_10_end:                                      ; preds = %for.inc17.i8.iter10
  br label %iter_11_start

iter_11_start:                                    ; preds = %iter_10_end
  br label %for.cond1.preheader.i4.iter11

for.cond1.preheader.i4.iter11:                    ; preds = %iter_11_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %143 = add i32 %split.iter10, 67, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter11, !dbg !313

for.body6.i17.iter11:                             ; preds = %for.cond4.i11.preheader.iter11, %m_vec_mul_add.exit.iter11
  %k.0.i1270.iter11 = phi i32 [ 0, %for.cond4.i11.preheader.iter11 ], [ %add13.i.iter11, %m_vec_mul_add.exit.iter11 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter11 = mul nsw i32 %bs_mat_entries_used.1.i72.iter11, 40, !dbg !319
  %add.ptr.i19.iter11 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter11, !dbg !319
  %mul8.i20.iter11 = shl nuw nsw i32 %c.0.i673.iter11, 3, !dbg !322
  %144 = getelementptr i8, ptr %O, i32 %mul8.i20.iter11, !dbg !323
  %arrayidx.i21.iter11 = getelementptr i8, ptr %144, i32 %k.0.i1270.iter11, !dbg !323
  %145 = load i8, ptr %arrayidx.i21.iter11, align 1, !dbg !323
  %add10.i.iter11 = or disjoint i32 88, %k.0.i1270.iter11, !dbg !324
  %add.ptr12.idx.i.iter11 = mul nuw nsw i32 %add10.i.iter11, 40, !dbg !325
  %add.ptr12.i.iter11 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter11, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter11 = zext i8 %145 to i32, !dbg !330
  %mul.i.i.iter11 = mul i32 %conv.i.i.iter11, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter11 = and i32 %mul.i.i.iter11, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter11 = lshr exact i32 %and.i.i.iter11, 4, !dbg !333
  %shr1.i.i.iter11 = lshr exact i32 %and.i.i.iter11, 3, !dbg !334
  %146 = xor i32 %shr.i.i.iter11, %shr1.i.i.iter11, !dbg !335
  %xor2.i.i.iter11 = xor i32 %146, %mul.i.i.iter11, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter11, !dbg !337

for.body.i.iter11:                                ; preds = %for.body.i.iter11, %for.body6.i17.iter11
  %i.0.i69.iter11 = phi i32 [ 0, %for.body6.i17.iter11 ], [ %inc.i26.iter11, %for.body.i.iter11 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter11, i32 %i.0.i69.iter11, !dbg !338
  %147 = load i64, ptr %arrayidx.i24.iter11, align 8, !dbg !338
  %and.i.iter11 = and i64 %147, 1229782938247303441, !dbg !339
  %and1.i.iter11 = and i32 %xor2.i.i.iter11, 255, !dbg !340
  %conv.i.iter11 = zext nneg i32 %and1.i.iter11 to i64, !dbg !341
  %mul.i25.iter11 = mul i64 %and.i.iter11, %conv.i.iter11, !dbg !342
  %shr.i.iter11 = lshr i64 %147, 1, !dbg !343
  %and3.i.iter11 = and i64 %shr.i.iter11, 1229782938247303441, !dbg !344
  %shr4.i.iter11 = lshr i32 %xor2.i.i.iter11, 8, !dbg !345
  %and5.i.iter11 = and i32 %shr4.i.iter11, 15, !dbg !346
  %conv6.i.iter11 = zext nneg i32 %and5.i.iter11 to i64, !dbg !347
  %mul7.i.iter11 = mul nuw i64 %and3.i.iter11, %conv6.i.iter11, !dbg !348
  %xor.i.iter11 = xor i64 %mul.i25.iter11, %mul7.i.iter11, !dbg !349
  %arrayidx8.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter11, i32 %i.0.i69.iter11, !dbg !350
  %148 = load i64, ptr %arrayidx8.i.iter11, align 8, !dbg !350
  %shr9.i.iter11 = lshr i64 %148, 2, !dbg !351
  %and10.i.iter11 = and i64 %shr9.i.iter11, 1229782938247303441, !dbg !352
  %shr11.i.iter11 = lshr i32 %xor2.i.i.iter11, 16, !dbg !353
  %and12.i.iter11 = and i32 %shr11.i.iter11, 15, !dbg !354
  %conv13.i.iter11 = zext nneg i32 %and12.i.iter11 to i64, !dbg !355
  %mul14.i.iter11 = mul nuw i64 %and10.i.iter11, %conv13.i.iter11, !dbg !356
  %xor15.i.iter11 = xor i64 %xor.i.iter11, %mul14.i.iter11, !dbg !357
  %arrayidx16.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter11, i32 %i.0.i69.iter11, !dbg !358
  %149 = load i64, ptr %arrayidx16.i.iter11, align 8, !dbg !358
  %shr17.i.iter11 = lshr i64 %149, 3, !dbg !359
  %and18.i.iter11 = and i64 %shr17.i.iter11, 1229782938247303441, !dbg !360
  %shr19.i.iter11 = lshr i32 %xor2.i.i.iter11, 24, !dbg !361
  %and20.i.iter11 = and i32 %shr19.i.iter11, 15, !dbg !362
  %conv21.i.iter11 = zext nneg i32 %and20.i.iter11 to i64, !dbg !363
  %mul22.i.iter11 = mul nuw i64 %and18.i.iter11, %conv21.i.iter11, !dbg !364
  %xor23.i.iter11 = xor i64 %xor15.i.iter11, %mul22.i.iter11, !dbg !365
  %arrayidx24.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter11, i32 %i.0.i69.iter11, !dbg !366
  %150 = load i64, ptr %arrayidx24.i.iter11, align 8, !dbg !367
  %xor25.i.iter11 = xor i64 %150, %xor23.i.iter11, !dbg !367
  store i64 %xor25.i.iter11, ptr %arrayidx24.i.iter11, align 8, !dbg !367
  %inc.i26.iter11 = add nuw nsw i32 %i.0.i69.iter11, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter11 = icmp eq i32 %inc.i26.iter11, 5, !dbg !369
  br i1 %exitcond.i23.not.iter11, label %m_vec_mul_add.exit.iter11, label %for.body.i.iter11, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter11:                        ; preds = %for.body.i.iter11
  %add13.i.iter11 = add nuw nsw i32 %k.0.i1270.iter11, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter11 = icmp eq i32 %add13.i.iter11, 8, !dbg !373
  br i1 %exitcond.i13.not.iter11, label %for.inc15.i14.iter11, label %for.body6.i17.iter11, !dbg !374, !llvm.loop !375

for.inc15.i14.iter11:                             ; preds = %m_vec_mul_add.exit.iter11
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter11 = add i32 %bs_mat_entries_used.1.i72.iter11, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter11 = add nuw nsw i32 %c.0.i673.iter11, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter11 = icmp eq i32 %add14.i15.iter11, %143, !dbg !379
  br i1 %exitcond1.i7.not.iter11, label %for.cond1.i5.for.inc17.i8_crit_edge.iter11, label %for.cond4.i11.preheader.iter11, !dbg !313, !llvm.loop !380

for.inc17.i8.iter11:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter11
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_11_end

for.cond4.i11.preheader.iter11:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter11, %for.inc15.i14.iter11
  %c.0.i673.iter11 = phi i32 [ 11, %for.cond4.i11.preheader.lr.ph.iter11 ], [ %inc.i16.iter11, %for.inc15.i14.iter11 ]
  %bs_mat_entries_used.1.i72.iter11 = phi i32 [ %split.iter10, %for.cond4.i11.preheader.lr.ph.iter11 ], [ %add14.i15.iter11, %for.inc15.i14.iter11 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter11, !dbg !374

for.cond4.i11.preheader.lr.ph.iter11:             ; preds = %for.cond1.preheader.i4.iter11
  br label %for.cond4.i11.preheader.iter11, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter11:       ; preds = %for.inc15.i14.iter11
  %split.iter11 = phi i32 [ %add14.i15.iter11, %for.inc15.i14.iter11 ]
  br label %for.inc17.i8.iter11, !dbg !313

iter_11_end:                                      ; preds = %for.inc17.i8.iter11
  br label %iter_12_start

iter_12_start:                                    ; preds = %iter_11_end
  br label %for.cond1.preheader.i4.iter12

for.cond1.preheader.i4.iter12:                    ; preds = %iter_12_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %151 = add i32 %split.iter11, 66, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter12, !dbg !313

for.body6.i17.iter12:                             ; preds = %for.cond4.i11.preheader.iter12, %m_vec_mul_add.exit.iter12
  %k.0.i1270.iter12 = phi i32 [ 0, %for.cond4.i11.preheader.iter12 ], [ %add13.i.iter12, %m_vec_mul_add.exit.iter12 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter12 = mul nsw i32 %bs_mat_entries_used.1.i72.iter12, 40, !dbg !319
  %add.ptr.i19.iter12 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter12, !dbg !319
  %mul8.i20.iter12 = shl nuw nsw i32 %c.0.i673.iter12, 3, !dbg !322
  %152 = getelementptr i8, ptr %O, i32 %mul8.i20.iter12, !dbg !323
  %arrayidx.i21.iter12 = getelementptr i8, ptr %152, i32 %k.0.i1270.iter12, !dbg !323
  %153 = load i8, ptr %arrayidx.i21.iter12, align 1, !dbg !323
  %add10.i.iter12 = or disjoint i32 96, %k.0.i1270.iter12, !dbg !324
  %add.ptr12.idx.i.iter12 = mul nuw nsw i32 %add10.i.iter12, 40, !dbg !325
  %add.ptr12.i.iter12 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter12, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter12 = zext i8 %153 to i32, !dbg !330
  %mul.i.i.iter12 = mul i32 %conv.i.i.iter12, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter12 = and i32 %mul.i.i.iter12, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter12 = lshr exact i32 %and.i.i.iter12, 4, !dbg !333
  %shr1.i.i.iter12 = lshr exact i32 %and.i.i.iter12, 3, !dbg !334
  %154 = xor i32 %shr.i.i.iter12, %shr1.i.i.iter12, !dbg !335
  %xor2.i.i.iter12 = xor i32 %154, %mul.i.i.iter12, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter12, !dbg !337

for.body.i.iter12:                                ; preds = %for.body.i.iter12, %for.body6.i17.iter12
  %i.0.i69.iter12 = phi i32 [ 0, %for.body6.i17.iter12 ], [ %inc.i26.iter12, %for.body.i.iter12 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter12, i32 %i.0.i69.iter12, !dbg !338
  %155 = load i64, ptr %arrayidx.i24.iter12, align 8, !dbg !338
  %and.i.iter12 = and i64 %155, 1229782938247303441, !dbg !339
  %and1.i.iter12 = and i32 %xor2.i.i.iter12, 255, !dbg !340
  %conv.i.iter12 = zext nneg i32 %and1.i.iter12 to i64, !dbg !341
  %mul.i25.iter12 = mul i64 %and.i.iter12, %conv.i.iter12, !dbg !342
  %shr.i.iter12 = lshr i64 %155, 1, !dbg !343
  %and3.i.iter12 = and i64 %shr.i.iter12, 1229782938247303441, !dbg !344
  %shr4.i.iter12 = lshr i32 %xor2.i.i.iter12, 8, !dbg !345
  %and5.i.iter12 = and i32 %shr4.i.iter12, 15, !dbg !346
  %conv6.i.iter12 = zext nneg i32 %and5.i.iter12 to i64, !dbg !347
  %mul7.i.iter12 = mul nuw i64 %and3.i.iter12, %conv6.i.iter12, !dbg !348
  %xor.i.iter12 = xor i64 %mul.i25.iter12, %mul7.i.iter12, !dbg !349
  %arrayidx8.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter12, i32 %i.0.i69.iter12, !dbg !350
  %156 = load i64, ptr %arrayidx8.i.iter12, align 8, !dbg !350
  %shr9.i.iter12 = lshr i64 %156, 2, !dbg !351
  %and10.i.iter12 = and i64 %shr9.i.iter12, 1229782938247303441, !dbg !352
  %shr11.i.iter12 = lshr i32 %xor2.i.i.iter12, 16, !dbg !353
  %and12.i.iter12 = and i32 %shr11.i.iter12, 15, !dbg !354
  %conv13.i.iter12 = zext nneg i32 %and12.i.iter12 to i64, !dbg !355
  %mul14.i.iter12 = mul nuw i64 %and10.i.iter12, %conv13.i.iter12, !dbg !356
  %xor15.i.iter12 = xor i64 %xor.i.iter12, %mul14.i.iter12, !dbg !357
  %arrayidx16.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter12, i32 %i.0.i69.iter12, !dbg !358
  %157 = load i64, ptr %arrayidx16.i.iter12, align 8, !dbg !358
  %shr17.i.iter12 = lshr i64 %157, 3, !dbg !359
  %and18.i.iter12 = and i64 %shr17.i.iter12, 1229782938247303441, !dbg !360
  %shr19.i.iter12 = lshr i32 %xor2.i.i.iter12, 24, !dbg !361
  %and20.i.iter12 = and i32 %shr19.i.iter12, 15, !dbg !362
  %conv21.i.iter12 = zext nneg i32 %and20.i.iter12 to i64, !dbg !363
  %mul22.i.iter12 = mul nuw i64 %and18.i.iter12, %conv21.i.iter12, !dbg !364
  %xor23.i.iter12 = xor i64 %xor15.i.iter12, %mul22.i.iter12, !dbg !365
  %arrayidx24.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter12, i32 %i.0.i69.iter12, !dbg !366
  %158 = load i64, ptr %arrayidx24.i.iter12, align 8, !dbg !367
  %xor25.i.iter12 = xor i64 %158, %xor23.i.iter12, !dbg !367
  store i64 %xor25.i.iter12, ptr %arrayidx24.i.iter12, align 8, !dbg !367
  %inc.i26.iter12 = add nuw nsw i32 %i.0.i69.iter12, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter12 = icmp eq i32 %inc.i26.iter12, 5, !dbg !369
  br i1 %exitcond.i23.not.iter12, label %m_vec_mul_add.exit.iter12, label %for.body.i.iter12, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter12:                        ; preds = %for.body.i.iter12
  %add13.i.iter12 = add nuw nsw i32 %k.0.i1270.iter12, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter12 = icmp eq i32 %add13.i.iter12, 8, !dbg !373
  br i1 %exitcond.i13.not.iter12, label %for.inc15.i14.iter12, label %for.body6.i17.iter12, !dbg !374, !llvm.loop !375

for.inc15.i14.iter12:                             ; preds = %m_vec_mul_add.exit.iter12
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter12 = add i32 %bs_mat_entries_used.1.i72.iter12, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter12 = add nuw nsw i32 %c.0.i673.iter12, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter12 = icmp eq i32 %add14.i15.iter12, %151, !dbg !379
  br i1 %exitcond1.i7.not.iter12, label %for.cond1.i5.for.inc17.i8_crit_edge.iter12, label %for.cond4.i11.preheader.iter12, !dbg !313, !llvm.loop !380

for.inc17.i8.iter12:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter12
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_12_end

for.cond4.i11.preheader.iter12:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter12, %for.inc15.i14.iter12
  %c.0.i673.iter12 = phi i32 [ 12, %for.cond4.i11.preheader.lr.ph.iter12 ], [ %inc.i16.iter12, %for.inc15.i14.iter12 ]
  %bs_mat_entries_used.1.i72.iter12 = phi i32 [ %split.iter11, %for.cond4.i11.preheader.lr.ph.iter12 ], [ %add14.i15.iter12, %for.inc15.i14.iter12 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter12, !dbg !374

for.cond4.i11.preheader.lr.ph.iter12:             ; preds = %for.cond1.preheader.i4.iter12
  br label %for.cond4.i11.preheader.iter12, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter12:       ; preds = %for.inc15.i14.iter12
  %split.iter12 = phi i32 [ %add14.i15.iter12, %for.inc15.i14.iter12 ]
  br label %for.inc17.i8.iter12, !dbg !313

iter_12_end:                                      ; preds = %for.inc17.i8.iter12
  br label %iter_13_start

iter_13_start:                                    ; preds = %iter_12_end
  br label %for.cond1.preheader.i4.iter13

for.cond1.preheader.i4.iter13:                    ; preds = %iter_13_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %159 = add i32 %split.iter12, 65, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter13, !dbg !313

for.body6.i17.iter13:                             ; preds = %for.cond4.i11.preheader.iter13, %m_vec_mul_add.exit.iter13
  %k.0.i1270.iter13 = phi i32 [ 0, %for.cond4.i11.preheader.iter13 ], [ %add13.i.iter13, %m_vec_mul_add.exit.iter13 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter13 = mul nsw i32 %bs_mat_entries_used.1.i72.iter13, 40, !dbg !319
  %add.ptr.i19.iter13 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter13, !dbg !319
  %mul8.i20.iter13 = shl nuw nsw i32 %c.0.i673.iter13, 3, !dbg !322
  %160 = getelementptr i8, ptr %O, i32 %mul8.i20.iter13, !dbg !323
  %arrayidx.i21.iter13 = getelementptr i8, ptr %160, i32 %k.0.i1270.iter13, !dbg !323
  %161 = load i8, ptr %arrayidx.i21.iter13, align 1, !dbg !323
  %add10.i.iter13 = or disjoint i32 104, %k.0.i1270.iter13, !dbg !324
  %add.ptr12.idx.i.iter13 = mul nuw nsw i32 %add10.i.iter13, 40, !dbg !325
  %add.ptr12.i.iter13 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter13, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter13 = zext i8 %161 to i32, !dbg !330
  %mul.i.i.iter13 = mul i32 %conv.i.i.iter13, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter13 = and i32 %mul.i.i.iter13, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter13 = lshr exact i32 %and.i.i.iter13, 4, !dbg !333
  %shr1.i.i.iter13 = lshr exact i32 %and.i.i.iter13, 3, !dbg !334
  %162 = xor i32 %shr.i.i.iter13, %shr1.i.i.iter13, !dbg !335
  %xor2.i.i.iter13 = xor i32 %162, %mul.i.i.iter13, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter13, !dbg !337

for.body.i.iter13:                                ; preds = %for.body.i.iter13, %for.body6.i17.iter13
  %i.0.i69.iter13 = phi i32 [ 0, %for.body6.i17.iter13 ], [ %inc.i26.iter13, %for.body.i.iter13 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter13, i32 %i.0.i69.iter13, !dbg !338
  %163 = load i64, ptr %arrayidx.i24.iter13, align 8, !dbg !338
  %and.i.iter13 = and i64 %163, 1229782938247303441, !dbg !339
  %and1.i.iter13 = and i32 %xor2.i.i.iter13, 255, !dbg !340
  %conv.i.iter13 = zext nneg i32 %and1.i.iter13 to i64, !dbg !341
  %mul.i25.iter13 = mul i64 %and.i.iter13, %conv.i.iter13, !dbg !342
  %shr.i.iter13 = lshr i64 %163, 1, !dbg !343
  %and3.i.iter13 = and i64 %shr.i.iter13, 1229782938247303441, !dbg !344
  %shr4.i.iter13 = lshr i32 %xor2.i.i.iter13, 8, !dbg !345
  %and5.i.iter13 = and i32 %shr4.i.iter13, 15, !dbg !346
  %conv6.i.iter13 = zext nneg i32 %and5.i.iter13 to i64, !dbg !347
  %mul7.i.iter13 = mul nuw i64 %and3.i.iter13, %conv6.i.iter13, !dbg !348
  %xor.i.iter13 = xor i64 %mul.i25.iter13, %mul7.i.iter13, !dbg !349
  %arrayidx8.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter13, i32 %i.0.i69.iter13, !dbg !350
  %164 = load i64, ptr %arrayidx8.i.iter13, align 8, !dbg !350
  %shr9.i.iter13 = lshr i64 %164, 2, !dbg !351
  %and10.i.iter13 = and i64 %shr9.i.iter13, 1229782938247303441, !dbg !352
  %shr11.i.iter13 = lshr i32 %xor2.i.i.iter13, 16, !dbg !353
  %and12.i.iter13 = and i32 %shr11.i.iter13, 15, !dbg !354
  %conv13.i.iter13 = zext nneg i32 %and12.i.iter13 to i64, !dbg !355
  %mul14.i.iter13 = mul nuw i64 %and10.i.iter13, %conv13.i.iter13, !dbg !356
  %xor15.i.iter13 = xor i64 %xor.i.iter13, %mul14.i.iter13, !dbg !357
  %arrayidx16.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter13, i32 %i.0.i69.iter13, !dbg !358
  %165 = load i64, ptr %arrayidx16.i.iter13, align 8, !dbg !358
  %shr17.i.iter13 = lshr i64 %165, 3, !dbg !359
  %and18.i.iter13 = and i64 %shr17.i.iter13, 1229782938247303441, !dbg !360
  %shr19.i.iter13 = lshr i32 %xor2.i.i.iter13, 24, !dbg !361
  %and20.i.iter13 = and i32 %shr19.i.iter13, 15, !dbg !362
  %conv21.i.iter13 = zext nneg i32 %and20.i.iter13 to i64, !dbg !363
  %mul22.i.iter13 = mul nuw i64 %and18.i.iter13, %conv21.i.iter13, !dbg !364
  %xor23.i.iter13 = xor i64 %xor15.i.iter13, %mul22.i.iter13, !dbg !365
  %arrayidx24.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter13, i32 %i.0.i69.iter13, !dbg !366
  %166 = load i64, ptr %arrayidx24.i.iter13, align 8, !dbg !367
  %xor25.i.iter13 = xor i64 %166, %xor23.i.iter13, !dbg !367
  store i64 %xor25.i.iter13, ptr %arrayidx24.i.iter13, align 8, !dbg !367
  %inc.i26.iter13 = add nuw nsw i32 %i.0.i69.iter13, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter13 = icmp eq i32 %inc.i26.iter13, 5, !dbg !369
  br i1 %exitcond.i23.not.iter13, label %m_vec_mul_add.exit.iter13, label %for.body.i.iter13, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter13:                        ; preds = %for.body.i.iter13
  %add13.i.iter13 = add nuw nsw i32 %k.0.i1270.iter13, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter13 = icmp eq i32 %add13.i.iter13, 8, !dbg !373
  br i1 %exitcond.i13.not.iter13, label %for.inc15.i14.iter13, label %for.body6.i17.iter13, !dbg !374, !llvm.loop !375

for.inc15.i14.iter13:                             ; preds = %m_vec_mul_add.exit.iter13
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter13 = add i32 %bs_mat_entries_used.1.i72.iter13, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter13 = add nuw nsw i32 %c.0.i673.iter13, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter13 = icmp eq i32 %add14.i15.iter13, %159, !dbg !379
  br i1 %exitcond1.i7.not.iter13, label %for.cond1.i5.for.inc17.i8_crit_edge.iter13, label %for.cond4.i11.preheader.iter13, !dbg !313, !llvm.loop !380

for.inc17.i8.iter13:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter13
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_13_end

for.cond4.i11.preheader.iter13:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter13, %for.inc15.i14.iter13
  %c.0.i673.iter13 = phi i32 [ 13, %for.cond4.i11.preheader.lr.ph.iter13 ], [ %inc.i16.iter13, %for.inc15.i14.iter13 ]
  %bs_mat_entries_used.1.i72.iter13 = phi i32 [ %split.iter12, %for.cond4.i11.preheader.lr.ph.iter13 ], [ %add14.i15.iter13, %for.inc15.i14.iter13 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter13, !dbg !374

for.cond4.i11.preheader.lr.ph.iter13:             ; preds = %for.cond1.preheader.i4.iter13
  br label %for.cond4.i11.preheader.iter13, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter13:       ; preds = %for.inc15.i14.iter13
  %split.iter13 = phi i32 [ %add14.i15.iter13, %for.inc15.i14.iter13 ]
  br label %for.inc17.i8.iter13, !dbg !313

iter_13_end:                                      ; preds = %for.inc17.i8.iter13
  br label %iter_14_start

iter_14_start:                                    ; preds = %iter_13_end
  br label %for.cond1.preheader.i4.iter14

for.cond1.preheader.i4.iter14:                    ; preds = %iter_14_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %167 = add i32 %split.iter13, 64, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter14, !dbg !313

for.body6.i17.iter14:                             ; preds = %for.cond4.i11.preheader.iter14, %m_vec_mul_add.exit.iter14
  %k.0.i1270.iter14 = phi i32 [ 0, %for.cond4.i11.preheader.iter14 ], [ %add13.i.iter14, %m_vec_mul_add.exit.iter14 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter14 = mul nsw i32 %bs_mat_entries_used.1.i72.iter14, 40, !dbg !319
  %add.ptr.i19.iter14 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter14, !dbg !319
  %mul8.i20.iter14 = shl nuw nsw i32 %c.0.i673.iter14, 3, !dbg !322
  %168 = getelementptr i8, ptr %O, i32 %mul8.i20.iter14, !dbg !323
  %arrayidx.i21.iter14 = getelementptr i8, ptr %168, i32 %k.0.i1270.iter14, !dbg !323
  %169 = load i8, ptr %arrayidx.i21.iter14, align 1, !dbg !323
  %add10.i.iter14 = or disjoint i32 112, %k.0.i1270.iter14, !dbg !324
  %add.ptr12.idx.i.iter14 = mul nuw nsw i32 %add10.i.iter14, 40, !dbg !325
  %add.ptr12.i.iter14 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter14, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter14 = zext i8 %169 to i32, !dbg !330
  %mul.i.i.iter14 = mul i32 %conv.i.i.iter14, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter14 = and i32 %mul.i.i.iter14, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter14 = lshr exact i32 %and.i.i.iter14, 4, !dbg !333
  %shr1.i.i.iter14 = lshr exact i32 %and.i.i.iter14, 3, !dbg !334
  %170 = xor i32 %shr.i.i.iter14, %shr1.i.i.iter14, !dbg !335
  %xor2.i.i.iter14 = xor i32 %170, %mul.i.i.iter14, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter14, !dbg !337

for.body.i.iter14:                                ; preds = %for.body.i.iter14, %for.body6.i17.iter14
  %i.0.i69.iter14 = phi i32 [ 0, %for.body6.i17.iter14 ], [ %inc.i26.iter14, %for.body.i.iter14 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter14, i32 %i.0.i69.iter14, !dbg !338
  %171 = load i64, ptr %arrayidx.i24.iter14, align 8, !dbg !338
  %and.i.iter14 = and i64 %171, 1229782938247303441, !dbg !339
  %and1.i.iter14 = and i32 %xor2.i.i.iter14, 255, !dbg !340
  %conv.i.iter14 = zext nneg i32 %and1.i.iter14 to i64, !dbg !341
  %mul.i25.iter14 = mul i64 %and.i.iter14, %conv.i.iter14, !dbg !342
  %shr.i.iter14 = lshr i64 %171, 1, !dbg !343
  %and3.i.iter14 = and i64 %shr.i.iter14, 1229782938247303441, !dbg !344
  %shr4.i.iter14 = lshr i32 %xor2.i.i.iter14, 8, !dbg !345
  %and5.i.iter14 = and i32 %shr4.i.iter14, 15, !dbg !346
  %conv6.i.iter14 = zext nneg i32 %and5.i.iter14 to i64, !dbg !347
  %mul7.i.iter14 = mul nuw i64 %and3.i.iter14, %conv6.i.iter14, !dbg !348
  %xor.i.iter14 = xor i64 %mul.i25.iter14, %mul7.i.iter14, !dbg !349
  %arrayidx8.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter14, i32 %i.0.i69.iter14, !dbg !350
  %172 = load i64, ptr %arrayidx8.i.iter14, align 8, !dbg !350
  %shr9.i.iter14 = lshr i64 %172, 2, !dbg !351
  %and10.i.iter14 = and i64 %shr9.i.iter14, 1229782938247303441, !dbg !352
  %shr11.i.iter14 = lshr i32 %xor2.i.i.iter14, 16, !dbg !353
  %and12.i.iter14 = and i32 %shr11.i.iter14, 15, !dbg !354
  %conv13.i.iter14 = zext nneg i32 %and12.i.iter14 to i64, !dbg !355
  %mul14.i.iter14 = mul nuw i64 %and10.i.iter14, %conv13.i.iter14, !dbg !356
  %xor15.i.iter14 = xor i64 %xor.i.iter14, %mul14.i.iter14, !dbg !357
  %arrayidx16.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter14, i32 %i.0.i69.iter14, !dbg !358
  %173 = load i64, ptr %arrayidx16.i.iter14, align 8, !dbg !358
  %shr17.i.iter14 = lshr i64 %173, 3, !dbg !359
  %and18.i.iter14 = and i64 %shr17.i.iter14, 1229782938247303441, !dbg !360
  %shr19.i.iter14 = lshr i32 %xor2.i.i.iter14, 24, !dbg !361
  %and20.i.iter14 = and i32 %shr19.i.iter14, 15, !dbg !362
  %conv21.i.iter14 = zext nneg i32 %and20.i.iter14 to i64, !dbg !363
  %mul22.i.iter14 = mul nuw i64 %and18.i.iter14, %conv21.i.iter14, !dbg !364
  %xor23.i.iter14 = xor i64 %xor15.i.iter14, %mul22.i.iter14, !dbg !365
  %arrayidx24.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter14, i32 %i.0.i69.iter14, !dbg !366
  %174 = load i64, ptr %arrayidx24.i.iter14, align 8, !dbg !367
  %xor25.i.iter14 = xor i64 %174, %xor23.i.iter14, !dbg !367
  store i64 %xor25.i.iter14, ptr %arrayidx24.i.iter14, align 8, !dbg !367
  %inc.i26.iter14 = add nuw nsw i32 %i.0.i69.iter14, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter14 = icmp eq i32 %inc.i26.iter14, 5, !dbg !369
  br i1 %exitcond.i23.not.iter14, label %m_vec_mul_add.exit.iter14, label %for.body.i.iter14, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter14:                        ; preds = %for.body.i.iter14
  %add13.i.iter14 = add nuw nsw i32 %k.0.i1270.iter14, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter14 = icmp eq i32 %add13.i.iter14, 8, !dbg !373
  br i1 %exitcond.i13.not.iter14, label %for.inc15.i14.iter14, label %for.body6.i17.iter14, !dbg !374, !llvm.loop !375

for.inc15.i14.iter14:                             ; preds = %m_vec_mul_add.exit.iter14
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter14 = add i32 %bs_mat_entries_used.1.i72.iter14, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter14 = add nuw nsw i32 %c.0.i673.iter14, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter14 = icmp eq i32 %add14.i15.iter14, %167, !dbg !379
  br i1 %exitcond1.i7.not.iter14, label %for.cond1.i5.for.inc17.i8_crit_edge.iter14, label %for.cond4.i11.preheader.iter14, !dbg !313, !llvm.loop !380

for.inc17.i8.iter14:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter14
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_14_end

for.cond4.i11.preheader.iter14:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter14, %for.inc15.i14.iter14
  %c.0.i673.iter14 = phi i32 [ 14, %for.cond4.i11.preheader.lr.ph.iter14 ], [ %inc.i16.iter14, %for.inc15.i14.iter14 ]
  %bs_mat_entries_used.1.i72.iter14 = phi i32 [ %split.iter13, %for.cond4.i11.preheader.lr.ph.iter14 ], [ %add14.i15.iter14, %for.inc15.i14.iter14 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter14, !dbg !374

for.cond4.i11.preheader.lr.ph.iter14:             ; preds = %for.cond1.preheader.i4.iter14
  br label %for.cond4.i11.preheader.iter14, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter14:       ; preds = %for.inc15.i14.iter14
  %split.iter14 = phi i32 [ %add14.i15.iter14, %for.inc15.i14.iter14 ]
  br label %for.inc17.i8.iter14, !dbg !313

iter_14_end:                                      ; preds = %for.inc17.i8.iter14
  br label %iter_15_start

iter_15_start:                                    ; preds = %iter_14_end
  br label %for.cond1.preheader.i4.iter15

for.cond1.preheader.i4.iter15:                    ; preds = %iter_15_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %175 = add i32 %split.iter14, 63, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter15, !dbg !313

for.body6.i17.iter15:                             ; preds = %for.cond4.i11.preheader.iter15, %m_vec_mul_add.exit.iter15
  %k.0.i1270.iter15 = phi i32 [ 0, %for.cond4.i11.preheader.iter15 ], [ %add13.i.iter15, %m_vec_mul_add.exit.iter15 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter15 = mul nsw i32 %bs_mat_entries_used.1.i72.iter15, 40, !dbg !319
  %add.ptr.i19.iter15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter15, !dbg !319
  %mul8.i20.iter15 = shl nuw nsw i32 %c.0.i673.iter15, 3, !dbg !322
  %176 = getelementptr i8, ptr %O, i32 %mul8.i20.iter15, !dbg !323
  %arrayidx.i21.iter15 = getelementptr i8, ptr %176, i32 %k.0.i1270.iter15, !dbg !323
  %177 = load i8, ptr %arrayidx.i21.iter15, align 1, !dbg !323
  %add10.i.iter15 = or disjoint i32 120, %k.0.i1270.iter15, !dbg !324
  %add.ptr12.idx.i.iter15 = mul nuw nsw i32 %add10.i.iter15, 40, !dbg !325
  %add.ptr12.i.iter15 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter15, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter15 = zext i8 %177 to i32, !dbg !330
  %mul.i.i.iter15 = mul i32 %conv.i.i.iter15, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter15 = and i32 %mul.i.i.iter15, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter15 = lshr exact i32 %and.i.i.iter15, 4, !dbg !333
  %shr1.i.i.iter15 = lshr exact i32 %and.i.i.iter15, 3, !dbg !334
  %178 = xor i32 %shr.i.i.iter15, %shr1.i.i.iter15, !dbg !335
  %xor2.i.i.iter15 = xor i32 %178, %mul.i.i.iter15, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter15, !dbg !337

for.body.i.iter15:                                ; preds = %for.body.i.iter15, %for.body6.i17.iter15
  %i.0.i69.iter15 = phi i32 [ 0, %for.body6.i17.iter15 ], [ %inc.i26.iter15, %for.body.i.iter15 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter15, i32 %i.0.i69.iter15, !dbg !338
  %179 = load i64, ptr %arrayidx.i24.iter15, align 8, !dbg !338
  %and.i.iter15 = and i64 %179, 1229782938247303441, !dbg !339
  %and1.i.iter15 = and i32 %xor2.i.i.iter15, 255, !dbg !340
  %conv.i.iter15 = zext nneg i32 %and1.i.iter15 to i64, !dbg !341
  %mul.i25.iter15 = mul i64 %and.i.iter15, %conv.i.iter15, !dbg !342
  %shr.i.iter15 = lshr i64 %179, 1, !dbg !343
  %and3.i.iter15 = and i64 %shr.i.iter15, 1229782938247303441, !dbg !344
  %shr4.i.iter15 = lshr i32 %xor2.i.i.iter15, 8, !dbg !345
  %and5.i.iter15 = and i32 %shr4.i.iter15, 15, !dbg !346
  %conv6.i.iter15 = zext nneg i32 %and5.i.iter15 to i64, !dbg !347
  %mul7.i.iter15 = mul nuw i64 %and3.i.iter15, %conv6.i.iter15, !dbg !348
  %xor.i.iter15 = xor i64 %mul.i25.iter15, %mul7.i.iter15, !dbg !349
  %arrayidx8.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter15, i32 %i.0.i69.iter15, !dbg !350
  %180 = load i64, ptr %arrayidx8.i.iter15, align 8, !dbg !350
  %shr9.i.iter15 = lshr i64 %180, 2, !dbg !351
  %and10.i.iter15 = and i64 %shr9.i.iter15, 1229782938247303441, !dbg !352
  %shr11.i.iter15 = lshr i32 %xor2.i.i.iter15, 16, !dbg !353
  %and12.i.iter15 = and i32 %shr11.i.iter15, 15, !dbg !354
  %conv13.i.iter15 = zext nneg i32 %and12.i.iter15 to i64, !dbg !355
  %mul14.i.iter15 = mul nuw i64 %and10.i.iter15, %conv13.i.iter15, !dbg !356
  %xor15.i.iter15 = xor i64 %xor.i.iter15, %mul14.i.iter15, !dbg !357
  %arrayidx16.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter15, i32 %i.0.i69.iter15, !dbg !358
  %181 = load i64, ptr %arrayidx16.i.iter15, align 8, !dbg !358
  %shr17.i.iter15 = lshr i64 %181, 3, !dbg !359
  %and18.i.iter15 = and i64 %shr17.i.iter15, 1229782938247303441, !dbg !360
  %shr19.i.iter15 = lshr i32 %xor2.i.i.iter15, 24, !dbg !361
  %and20.i.iter15 = and i32 %shr19.i.iter15, 15, !dbg !362
  %conv21.i.iter15 = zext nneg i32 %and20.i.iter15 to i64, !dbg !363
  %mul22.i.iter15 = mul nuw i64 %and18.i.iter15, %conv21.i.iter15, !dbg !364
  %xor23.i.iter15 = xor i64 %xor15.i.iter15, %mul22.i.iter15, !dbg !365
  %arrayidx24.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter15, i32 %i.0.i69.iter15, !dbg !366
  %182 = load i64, ptr %arrayidx24.i.iter15, align 8, !dbg !367
  %xor25.i.iter15 = xor i64 %182, %xor23.i.iter15, !dbg !367
  store i64 %xor25.i.iter15, ptr %arrayidx24.i.iter15, align 8, !dbg !367
  %inc.i26.iter15 = add nuw nsw i32 %i.0.i69.iter15, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter15 = icmp eq i32 %inc.i26.iter15, 5, !dbg !369
  br i1 %exitcond.i23.not.iter15, label %m_vec_mul_add.exit.iter15, label %for.body.i.iter15, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter15:                        ; preds = %for.body.i.iter15
  %add13.i.iter15 = add nuw nsw i32 %k.0.i1270.iter15, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter15 = icmp eq i32 %add13.i.iter15, 8, !dbg !373
  br i1 %exitcond.i13.not.iter15, label %for.inc15.i14.iter15, label %for.body6.i17.iter15, !dbg !374, !llvm.loop !375

for.inc15.i14.iter15:                             ; preds = %m_vec_mul_add.exit.iter15
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter15 = add i32 %bs_mat_entries_used.1.i72.iter15, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter15 = add nuw nsw i32 %c.0.i673.iter15, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter15 = icmp eq i32 %add14.i15.iter15, %175, !dbg !379
  br i1 %exitcond1.i7.not.iter15, label %for.cond1.i5.for.inc17.i8_crit_edge.iter15, label %for.cond4.i11.preheader.iter15, !dbg !313, !llvm.loop !380

for.inc17.i8.iter15:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter15
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_15_end

for.cond4.i11.preheader.iter15:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter15, %for.inc15.i14.iter15
  %c.0.i673.iter15 = phi i32 [ 15, %for.cond4.i11.preheader.lr.ph.iter15 ], [ %inc.i16.iter15, %for.inc15.i14.iter15 ]
  %bs_mat_entries_used.1.i72.iter15 = phi i32 [ %split.iter14, %for.cond4.i11.preheader.lr.ph.iter15 ], [ %add14.i15.iter15, %for.inc15.i14.iter15 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter15, !dbg !374

for.cond4.i11.preheader.lr.ph.iter15:             ; preds = %for.cond1.preheader.i4.iter15
  br label %for.cond4.i11.preheader.iter15, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter15:       ; preds = %for.inc15.i14.iter15
  %split.iter15 = phi i32 [ %add14.i15.iter15, %for.inc15.i14.iter15 ]
  br label %for.inc17.i8.iter15, !dbg !313

iter_15_end:                                      ; preds = %for.inc17.i8.iter15
  br label %iter_16_start

iter_16_start:                                    ; preds = %iter_15_end
  br label %for.cond1.preheader.i4.iter16

for.cond1.preheader.i4.iter16:                    ; preds = %iter_16_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %183 = add i32 %split.iter15, 62, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter16, !dbg !313

for.body6.i17.iter16:                             ; preds = %for.cond4.i11.preheader.iter16, %m_vec_mul_add.exit.iter16
  %k.0.i1270.iter16 = phi i32 [ 0, %for.cond4.i11.preheader.iter16 ], [ %add13.i.iter16, %m_vec_mul_add.exit.iter16 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter16 = mul nsw i32 %bs_mat_entries_used.1.i72.iter16, 40, !dbg !319
  %add.ptr.i19.iter16 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter16, !dbg !319
  %mul8.i20.iter16 = shl nuw nsw i32 %c.0.i673.iter16, 3, !dbg !322
  %184 = getelementptr i8, ptr %O, i32 %mul8.i20.iter16, !dbg !323
  %arrayidx.i21.iter16 = getelementptr i8, ptr %184, i32 %k.0.i1270.iter16, !dbg !323
  %185 = load i8, ptr %arrayidx.i21.iter16, align 1, !dbg !323
  %add10.i.iter16 = or disjoint i32 128, %k.0.i1270.iter16, !dbg !324
  %add.ptr12.idx.i.iter16 = mul nuw nsw i32 %add10.i.iter16, 40, !dbg !325
  %add.ptr12.i.iter16 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter16, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter16 = zext i8 %185 to i32, !dbg !330
  %mul.i.i.iter16 = mul i32 %conv.i.i.iter16, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter16 = and i32 %mul.i.i.iter16, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter16 = lshr exact i32 %and.i.i.iter16, 4, !dbg !333
  %shr1.i.i.iter16 = lshr exact i32 %and.i.i.iter16, 3, !dbg !334
  %186 = xor i32 %shr.i.i.iter16, %shr1.i.i.iter16, !dbg !335
  %xor2.i.i.iter16 = xor i32 %186, %mul.i.i.iter16, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter16, !dbg !337

for.body.i.iter16:                                ; preds = %for.body.i.iter16, %for.body6.i17.iter16
  %i.0.i69.iter16 = phi i32 [ 0, %for.body6.i17.iter16 ], [ %inc.i26.iter16, %for.body.i.iter16 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter16, i32 %i.0.i69.iter16, !dbg !338
  %187 = load i64, ptr %arrayidx.i24.iter16, align 8, !dbg !338
  %and.i.iter16 = and i64 %187, 1229782938247303441, !dbg !339
  %and1.i.iter16 = and i32 %xor2.i.i.iter16, 255, !dbg !340
  %conv.i.iter16 = zext nneg i32 %and1.i.iter16 to i64, !dbg !341
  %mul.i25.iter16 = mul i64 %and.i.iter16, %conv.i.iter16, !dbg !342
  %shr.i.iter16 = lshr i64 %187, 1, !dbg !343
  %and3.i.iter16 = and i64 %shr.i.iter16, 1229782938247303441, !dbg !344
  %shr4.i.iter16 = lshr i32 %xor2.i.i.iter16, 8, !dbg !345
  %and5.i.iter16 = and i32 %shr4.i.iter16, 15, !dbg !346
  %conv6.i.iter16 = zext nneg i32 %and5.i.iter16 to i64, !dbg !347
  %mul7.i.iter16 = mul nuw i64 %and3.i.iter16, %conv6.i.iter16, !dbg !348
  %xor.i.iter16 = xor i64 %mul.i25.iter16, %mul7.i.iter16, !dbg !349
  %arrayidx8.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter16, i32 %i.0.i69.iter16, !dbg !350
  %188 = load i64, ptr %arrayidx8.i.iter16, align 8, !dbg !350
  %shr9.i.iter16 = lshr i64 %188, 2, !dbg !351
  %and10.i.iter16 = and i64 %shr9.i.iter16, 1229782938247303441, !dbg !352
  %shr11.i.iter16 = lshr i32 %xor2.i.i.iter16, 16, !dbg !353
  %and12.i.iter16 = and i32 %shr11.i.iter16, 15, !dbg !354
  %conv13.i.iter16 = zext nneg i32 %and12.i.iter16 to i64, !dbg !355
  %mul14.i.iter16 = mul nuw i64 %and10.i.iter16, %conv13.i.iter16, !dbg !356
  %xor15.i.iter16 = xor i64 %xor.i.iter16, %mul14.i.iter16, !dbg !357
  %arrayidx16.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter16, i32 %i.0.i69.iter16, !dbg !358
  %189 = load i64, ptr %arrayidx16.i.iter16, align 8, !dbg !358
  %shr17.i.iter16 = lshr i64 %189, 3, !dbg !359
  %and18.i.iter16 = and i64 %shr17.i.iter16, 1229782938247303441, !dbg !360
  %shr19.i.iter16 = lshr i32 %xor2.i.i.iter16, 24, !dbg !361
  %and20.i.iter16 = and i32 %shr19.i.iter16, 15, !dbg !362
  %conv21.i.iter16 = zext nneg i32 %and20.i.iter16 to i64, !dbg !363
  %mul22.i.iter16 = mul nuw i64 %and18.i.iter16, %conv21.i.iter16, !dbg !364
  %xor23.i.iter16 = xor i64 %xor15.i.iter16, %mul22.i.iter16, !dbg !365
  %arrayidx24.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter16, i32 %i.0.i69.iter16, !dbg !366
  %190 = load i64, ptr %arrayidx24.i.iter16, align 8, !dbg !367
  %xor25.i.iter16 = xor i64 %190, %xor23.i.iter16, !dbg !367
  store i64 %xor25.i.iter16, ptr %arrayidx24.i.iter16, align 8, !dbg !367
  %inc.i26.iter16 = add nuw nsw i32 %i.0.i69.iter16, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter16 = icmp eq i32 %inc.i26.iter16, 5, !dbg !369
  br i1 %exitcond.i23.not.iter16, label %m_vec_mul_add.exit.iter16, label %for.body.i.iter16, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter16:                        ; preds = %for.body.i.iter16
  %add13.i.iter16 = add nuw nsw i32 %k.0.i1270.iter16, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter16 = icmp eq i32 %add13.i.iter16, 8, !dbg !373
  br i1 %exitcond.i13.not.iter16, label %for.inc15.i14.iter16, label %for.body6.i17.iter16, !dbg !374, !llvm.loop !375

for.inc15.i14.iter16:                             ; preds = %m_vec_mul_add.exit.iter16
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter16 = add i32 %bs_mat_entries_used.1.i72.iter16, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter16 = add nuw nsw i32 %c.0.i673.iter16, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter16 = icmp eq i32 %add14.i15.iter16, %183, !dbg !379
  br i1 %exitcond1.i7.not.iter16, label %for.cond1.i5.for.inc17.i8_crit_edge.iter16, label %for.cond4.i11.preheader.iter16, !dbg !313, !llvm.loop !380

for.inc17.i8.iter16:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter16
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_16_end

for.cond4.i11.preheader.iter16:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter16, %for.inc15.i14.iter16
  %c.0.i673.iter16 = phi i32 [ 16, %for.cond4.i11.preheader.lr.ph.iter16 ], [ %inc.i16.iter16, %for.inc15.i14.iter16 ]
  %bs_mat_entries_used.1.i72.iter16 = phi i32 [ %split.iter15, %for.cond4.i11.preheader.lr.ph.iter16 ], [ %add14.i15.iter16, %for.inc15.i14.iter16 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter16, !dbg !374

for.cond4.i11.preheader.lr.ph.iter16:             ; preds = %for.cond1.preheader.i4.iter16
  br label %for.cond4.i11.preheader.iter16, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter16:       ; preds = %for.inc15.i14.iter16
  %split.iter16 = phi i32 [ %add14.i15.iter16, %for.inc15.i14.iter16 ]
  br label %for.inc17.i8.iter16, !dbg !313

iter_16_end:                                      ; preds = %for.inc17.i8.iter16
  br label %iter_17_start

iter_17_start:                                    ; preds = %iter_16_end
  br label %for.cond1.preheader.i4.iter17

for.cond1.preheader.i4.iter17:                    ; preds = %iter_17_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %191 = add i32 %split.iter16, 61, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter17, !dbg !313

for.body6.i17.iter17:                             ; preds = %for.cond4.i11.preheader.iter17, %m_vec_mul_add.exit.iter17
  %k.0.i1270.iter17 = phi i32 [ 0, %for.cond4.i11.preheader.iter17 ], [ %add13.i.iter17, %m_vec_mul_add.exit.iter17 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter17 = mul nsw i32 %bs_mat_entries_used.1.i72.iter17, 40, !dbg !319
  %add.ptr.i19.iter17 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter17, !dbg !319
  %mul8.i20.iter17 = shl nuw nsw i32 %c.0.i673.iter17, 3, !dbg !322
  %192 = getelementptr i8, ptr %O, i32 %mul8.i20.iter17, !dbg !323
  %arrayidx.i21.iter17 = getelementptr i8, ptr %192, i32 %k.0.i1270.iter17, !dbg !323
  %193 = load i8, ptr %arrayidx.i21.iter17, align 1, !dbg !323
  %add10.i.iter17 = or disjoint i32 136, %k.0.i1270.iter17, !dbg !324
  %add.ptr12.idx.i.iter17 = mul nuw nsw i32 %add10.i.iter17, 40, !dbg !325
  %add.ptr12.i.iter17 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter17, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter17 = zext i8 %193 to i32, !dbg !330
  %mul.i.i.iter17 = mul i32 %conv.i.i.iter17, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter17 = and i32 %mul.i.i.iter17, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter17 = lshr exact i32 %and.i.i.iter17, 4, !dbg !333
  %shr1.i.i.iter17 = lshr exact i32 %and.i.i.iter17, 3, !dbg !334
  %194 = xor i32 %shr.i.i.iter17, %shr1.i.i.iter17, !dbg !335
  %xor2.i.i.iter17 = xor i32 %194, %mul.i.i.iter17, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter17, !dbg !337

for.body.i.iter17:                                ; preds = %for.body.i.iter17, %for.body6.i17.iter17
  %i.0.i69.iter17 = phi i32 [ 0, %for.body6.i17.iter17 ], [ %inc.i26.iter17, %for.body.i.iter17 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter17, i32 %i.0.i69.iter17, !dbg !338
  %195 = load i64, ptr %arrayidx.i24.iter17, align 8, !dbg !338
  %and.i.iter17 = and i64 %195, 1229782938247303441, !dbg !339
  %and1.i.iter17 = and i32 %xor2.i.i.iter17, 255, !dbg !340
  %conv.i.iter17 = zext nneg i32 %and1.i.iter17 to i64, !dbg !341
  %mul.i25.iter17 = mul i64 %and.i.iter17, %conv.i.iter17, !dbg !342
  %shr.i.iter17 = lshr i64 %195, 1, !dbg !343
  %and3.i.iter17 = and i64 %shr.i.iter17, 1229782938247303441, !dbg !344
  %shr4.i.iter17 = lshr i32 %xor2.i.i.iter17, 8, !dbg !345
  %and5.i.iter17 = and i32 %shr4.i.iter17, 15, !dbg !346
  %conv6.i.iter17 = zext nneg i32 %and5.i.iter17 to i64, !dbg !347
  %mul7.i.iter17 = mul nuw i64 %and3.i.iter17, %conv6.i.iter17, !dbg !348
  %xor.i.iter17 = xor i64 %mul.i25.iter17, %mul7.i.iter17, !dbg !349
  %arrayidx8.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter17, i32 %i.0.i69.iter17, !dbg !350
  %196 = load i64, ptr %arrayidx8.i.iter17, align 8, !dbg !350
  %shr9.i.iter17 = lshr i64 %196, 2, !dbg !351
  %and10.i.iter17 = and i64 %shr9.i.iter17, 1229782938247303441, !dbg !352
  %shr11.i.iter17 = lshr i32 %xor2.i.i.iter17, 16, !dbg !353
  %and12.i.iter17 = and i32 %shr11.i.iter17, 15, !dbg !354
  %conv13.i.iter17 = zext nneg i32 %and12.i.iter17 to i64, !dbg !355
  %mul14.i.iter17 = mul nuw i64 %and10.i.iter17, %conv13.i.iter17, !dbg !356
  %xor15.i.iter17 = xor i64 %xor.i.iter17, %mul14.i.iter17, !dbg !357
  %arrayidx16.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter17, i32 %i.0.i69.iter17, !dbg !358
  %197 = load i64, ptr %arrayidx16.i.iter17, align 8, !dbg !358
  %shr17.i.iter17 = lshr i64 %197, 3, !dbg !359
  %and18.i.iter17 = and i64 %shr17.i.iter17, 1229782938247303441, !dbg !360
  %shr19.i.iter17 = lshr i32 %xor2.i.i.iter17, 24, !dbg !361
  %and20.i.iter17 = and i32 %shr19.i.iter17, 15, !dbg !362
  %conv21.i.iter17 = zext nneg i32 %and20.i.iter17 to i64, !dbg !363
  %mul22.i.iter17 = mul nuw i64 %and18.i.iter17, %conv21.i.iter17, !dbg !364
  %xor23.i.iter17 = xor i64 %xor15.i.iter17, %mul22.i.iter17, !dbg !365
  %arrayidx24.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter17, i32 %i.0.i69.iter17, !dbg !366
  %198 = load i64, ptr %arrayidx24.i.iter17, align 8, !dbg !367
  %xor25.i.iter17 = xor i64 %198, %xor23.i.iter17, !dbg !367
  store i64 %xor25.i.iter17, ptr %arrayidx24.i.iter17, align 8, !dbg !367
  %inc.i26.iter17 = add nuw nsw i32 %i.0.i69.iter17, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter17 = icmp eq i32 %inc.i26.iter17, 5, !dbg !369
  br i1 %exitcond.i23.not.iter17, label %m_vec_mul_add.exit.iter17, label %for.body.i.iter17, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter17:                        ; preds = %for.body.i.iter17
  %add13.i.iter17 = add nuw nsw i32 %k.0.i1270.iter17, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter17 = icmp eq i32 %add13.i.iter17, 8, !dbg !373
  br i1 %exitcond.i13.not.iter17, label %for.inc15.i14.iter17, label %for.body6.i17.iter17, !dbg !374, !llvm.loop !375

for.inc15.i14.iter17:                             ; preds = %m_vec_mul_add.exit.iter17
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter17 = add i32 %bs_mat_entries_used.1.i72.iter17, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter17 = add nuw nsw i32 %c.0.i673.iter17, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter17 = icmp eq i32 %add14.i15.iter17, %191, !dbg !379
  br i1 %exitcond1.i7.not.iter17, label %for.cond1.i5.for.inc17.i8_crit_edge.iter17, label %for.cond4.i11.preheader.iter17, !dbg !313, !llvm.loop !380

for.inc17.i8.iter17:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter17
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_17_end

for.cond4.i11.preheader.iter17:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter17, %for.inc15.i14.iter17
  %c.0.i673.iter17 = phi i32 [ 17, %for.cond4.i11.preheader.lr.ph.iter17 ], [ %inc.i16.iter17, %for.inc15.i14.iter17 ]
  %bs_mat_entries_used.1.i72.iter17 = phi i32 [ %split.iter16, %for.cond4.i11.preheader.lr.ph.iter17 ], [ %add14.i15.iter17, %for.inc15.i14.iter17 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter17, !dbg !374

for.cond4.i11.preheader.lr.ph.iter17:             ; preds = %for.cond1.preheader.i4.iter17
  br label %for.cond4.i11.preheader.iter17, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter17:       ; preds = %for.inc15.i14.iter17
  %split.iter17 = phi i32 [ %add14.i15.iter17, %for.inc15.i14.iter17 ]
  br label %for.inc17.i8.iter17, !dbg !313

iter_17_end:                                      ; preds = %for.inc17.i8.iter17
  br label %iter_18_start

iter_18_start:                                    ; preds = %iter_17_end
  br label %for.cond1.preheader.i4.iter18

for.cond1.preheader.i4.iter18:                    ; preds = %iter_18_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %199 = add i32 %split.iter17, 60, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter18, !dbg !313

for.body6.i17.iter18:                             ; preds = %for.cond4.i11.preheader.iter18, %m_vec_mul_add.exit.iter18
  %k.0.i1270.iter18 = phi i32 [ 0, %for.cond4.i11.preheader.iter18 ], [ %add13.i.iter18, %m_vec_mul_add.exit.iter18 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter18 = mul nsw i32 %bs_mat_entries_used.1.i72.iter18, 40, !dbg !319
  %add.ptr.i19.iter18 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter18, !dbg !319
  %mul8.i20.iter18 = shl nuw nsw i32 %c.0.i673.iter18, 3, !dbg !322
  %200 = getelementptr i8, ptr %O, i32 %mul8.i20.iter18, !dbg !323
  %arrayidx.i21.iter18 = getelementptr i8, ptr %200, i32 %k.0.i1270.iter18, !dbg !323
  %201 = load i8, ptr %arrayidx.i21.iter18, align 1, !dbg !323
  %add10.i.iter18 = or disjoint i32 144, %k.0.i1270.iter18, !dbg !324
  %add.ptr12.idx.i.iter18 = mul nuw nsw i32 %add10.i.iter18, 40, !dbg !325
  %add.ptr12.i.iter18 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter18, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter18 = zext i8 %201 to i32, !dbg !330
  %mul.i.i.iter18 = mul i32 %conv.i.i.iter18, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter18 = and i32 %mul.i.i.iter18, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter18 = lshr exact i32 %and.i.i.iter18, 4, !dbg !333
  %shr1.i.i.iter18 = lshr exact i32 %and.i.i.iter18, 3, !dbg !334
  %202 = xor i32 %shr.i.i.iter18, %shr1.i.i.iter18, !dbg !335
  %xor2.i.i.iter18 = xor i32 %202, %mul.i.i.iter18, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter18, !dbg !337

for.body.i.iter18:                                ; preds = %for.body.i.iter18, %for.body6.i17.iter18
  %i.0.i69.iter18 = phi i32 [ 0, %for.body6.i17.iter18 ], [ %inc.i26.iter18, %for.body.i.iter18 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter18, i32 %i.0.i69.iter18, !dbg !338
  %203 = load i64, ptr %arrayidx.i24.iter18, align 8, !dbg !338
  %and.i.iter18 = and i64 %203, 1229782938247303441, !dbg !339
  %and1.i.iter18 = and i32 %xor2.i.i.iter18, 255, !dbg !340
  %conv.i.iter18 = zext nneg i32 %and1.i.iter18 to i64, !dbg !341
  %mul.i25.iter18 = mul i64 %and.i.iter18, %conv.i.iter18, !dbg !342
  %shr.i.iter18 = lshr i64 %203, 1, !dbg !343
  %and3.i.iter18 = and i64 %shr.i.iter18, 1229782938247303441, !dbg !344
  %shr4.i.iter18 = lshr i32 %xor2.i.i.iter18, 8, !dbg !345
  %and5.i.iter18 = and i32 %shr4.i.iter18, 15, !dbg !346
  %conv6.i.iter18 = zext nneg i32 %and5.i.iter18 to i64, !dbg !347
  %mul7.i.iter18 = mul nuw i64 %and3.i.iter18, %conv6.i.iter18, !dbg !348
  %xor.i.iter18 = xor i64 %mul.i25.iter18, %mul7.i.iter18, !dbg !349
  %arrayidx8.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter18, i32 %i.0.i69.iter18, !dbg !350
  %204 = load i64, ptr %arrayidx8.i.iter18, align 8, !dbg !350
  %shr9.i.iter18 = lshr i64 %204, 2, !dbg !351
  %and10.i.iter18 = and i64 %shr9.i.iter18, 1229782938247303441, !dbg !352
  %shr11.i.iter18 = lshr i32 %xor2.i.i.iter18, 16, !dbg !353
  %and12.i.iter18 = and i32 %shr11.i.iter18, 15, !dbg !354
  %conv13.i.iter18 = zext nneg i32 %and12.i.iter18 to i64, !dbg !355
  %mul14.i.iter18 = mul nuw i64 %and10.i.iter18, %conv13.i.iter18, !dbg !356
  %xor15.i.iter18 = xor i64 %xor.i.iter18, %mul14.i.iter18, !dbg !357
  %arrayidx16.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter18, i32 %i.0.i69.iter18, !dbg !358
  %205 = load i64, ptr %arrayidx16.i.iter18, align 8, !dbg !358
  %shr17.i.iter18 = lshr i64 %205, 3, !dbg !359
  %and18.i.iter18 = and i64 %shr17.i.iter18, 1229782938247303441, !dbg !360
  %shr19.i.iter18 = lshr i32 %xor2.i.i.iter18, 24, !dbg !361
  %and20.i.iter18 = and i32 %shr19.i.iter18, 15, !dbg !362
  %conv21.i.iter18 = zext nneg i32 %and20.i.iter18 to i64, !dbg !363
  %mul22.i.iter18 = mul nuw i64 %and18.i.iter18, %conv21.i.iter18, !dbg !364
  %xor23.i.iter18 = xor i64 %xor15.i.iter18, %mul22.i.iter18, !dbg !365
  %arrayidx24.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter18, i32 %i.0.i69.iter18, !dbg !366
  %206 = load i64, ptr %arrayidx24.i.iter18, align 8, !dbg !367
  %xor25.i.iter18 = xor i64 %206, %xor23.i.iter18, !dbg !367
  store i64 %xor25.i.iter18, ptr %arrayidx24.i.iter18, align 8, !dbg !367
  %inc.i26.iter18 = add nuw nsw i32 %i.0.i69.iter18, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter18 = icmp eq i32 %inc.i26.iter18, 5, !dbg !369
  br i1 %exitcond.i23.not.iter18, label %m_vec_mul_add.exit.iter18, label %for.body.i.iter18, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter18:                        ; preds = %for.body.i.iter18
  %add13.i.iter18 = add nuw nsw i32 %k.0.i1270.iter18, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter18 = icmp eq i32 %add13.i.iter18, 8, !dbg !373
  br i1 %exitcond.i13.not.iter18, label %for.inc15.i14.iter18, label %for.body6.i17.iter18, !dbg !374, !llvm.loop !375

for.inc15.i14.iter18:                             ; preds = %m_vec_mul_add.exit.iter18
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter18 = add i32 %bs_mat_entries_used.1.i72.iter18, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter18 = add nuw nsw i32 %c.0.i673.iter18, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter18 = icmp eq i32 %add14.i15.iter18, %199, !dbg !379
  br i1 %exitcond1.i7.not.iter18, label %for.cond1.i5.for.inc17.i8_crit_edge.iter18, label %for.cond4.i11.preheader.iter18, !dbg !313, !llvm.loop !380

for.inc17.i8.iter18:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter18
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_18_end

for.cond4.i11.preheader.iter18:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter18, %for.inc15.i14.iter18
  %c.0.i673.iter18 = phi i32 [ 18, %for.cond4.i11.preheader.lr.ph.iter18 ], [ %inc.i16.iter18, %for.inc15.i14.iter18 ]
  %bs_mat_entries_used.1.i72.iter18 = phi i32 [ %split.iter17, %for.cond4.i11.preheader.lr.ph.iter18 ], [ %add14.i15.iter18, %for.inc15.i14.iter18 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter18, !dbg !374

for.cond4.i11.preheader.lr.ph.iter18:             ; preds = %for.cond1.preheader.i4.iter18
  br label %for.cond4.i11.preheader.iter18, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter18:       ; preds = %for.inc15.i14.iter18
  %split.iter18 = phi i32 [ %add14.i15.iter18, %for.inc15.i14.iter18 ]
  br label %for.inc17.i8.iter18, !dbg !313

iter_18_end:                                      ; preds = %for.inc17.i8.iter18
  br label %iter_19_start

iter_19_start:                                    ; preds = %iter_18_end
  br label %for.cond1.preheader.i4.iter19

for.cond1.preheader.i4.iter19:                    ; preds = %iter_19_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %207 = add i32 %split.iter18, 59, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter19, !dbg !313

for.body6.i17.iter19:                             ; preds = %for.cond4.i11.preheader.iter19, %m_vec_mul_add.exit.iter19
  %k.0.i1270.iter19 = phi i32 [ 0, %for.cond4.i11.preheader.iter19 ], [ %add13.i.iter19, %m_vec_mul_add.exit.iter19 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter19 = mul nsw i32 %bs_mat_entries_used.1.i72.iter19, 40, !dbg !319
  %add.ptr.i19.iter19 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter19, !dbg !319
  %mul8.i20.iter19 = shl nuw nsw i32 %c.0.i673.iter19, 3, !dbg !322
  %208 = getelementptr i8, ptr %O, i32 %mul8.i20.iter19, !dbg !323
  %arrayidx.i21.iter19 = getelementptr i8, ptr %208, i32 %k.0.i1270.iter19, !dbg !323
  %209 = load i8, ptr %arrayidx.i21.iter19, align 1, !dbg !323
  %add10.i.iter19 = or disjoint i32 152, %k.0.i1270.iter19, !dbg !324
  %add.ptr12.idx.i.iter19 = mul nuw nsw i32 %add10.i.iter19, 40, !dbg !325
  %add.ptr12.i.iter19 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter19, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter19 = zext i8 %209 to i32, !dbg !330
  %mul.i.i.iter19 = mul i32 %conv.i.i.iter19, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter19 = and i32 %mul.i.i.iter19, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter19 = lshr exact i32 %and.i.i.iter19, 4, !dbg !333
  %shr1.i.i.iter19 = lshr exact i32 %and.i.i.iter19, 3, !dbg !334
  %210 = xor i32 %shr.i.i.iter19, %shr1.i.i.iter19, !dbg !335
  %xor2.i.i.iter19 = xor i32 %210, %mul.i.i.iter19, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter19, !dbg !337

for.body.i.iter19:                                ; preds = %for.body.i.iter19, %for.body6.i17.iter19
  %i.0.i69.iter19 = phi i32 [ 0, %for.body6.i17.iter19 ], [ %inc.i26.iter19, %for.body.i.iter19 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter19, i32 %i.0.i69.iter19, !dbg !338
  %211 = load i64, ptr %arrayidx.i24.iter19, align 8, !dbg !338
  %and.i.iter19 = and i64 %211, 1229782938247303441, !dbg !339
  %and1.i.iter19 = and i32 %xor2.i.i.iter19, 255, !dbg !340
  %conv.i.iter19 = zext nneg i32 %and1.i.iter19 to i64, !dbg !341
  %mul.i25.iter19 = mul i64 %and.i.iter19, %conv.i.iter19, !dbg !342
  %shr.i.iter19 = lshr i64 %211, 1, !dbg !343
  %and3.i.iter19 = and i64 %shr.i.iter19, 1229782938247303441, !dbg !344
  %shr4.i.iter19 = lshr i32 %xor2.i.i.iter19, 8, !dbg !345
  %and5.i.iter19 = and i32 %shr4.i.iter19, 15, !dbg !346
  %conv6.i.iter19 = zext nneg i32 %and5.i.iter19 to i64, !dbg !347
  %mul7.i.iter19 = mul nuw i64 %and3.i.iter19, %conv6.i.iter19, !dbg !348
  %xor.i.iter19 = xor i64 %mul.i25.iter19, %mul7.i.iter19, !dbg !349
  %arrayidx8.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter19, i32 %i.0.i69.iter19, !dbg !350
  %212 = load i64, ptr %arrayidx8.i.iter19, align 8, !dbg !350
  %shr9.i.iter19 = lshr i64 %212, 2, !dbg !351
  %and10.i.iter19 = and i64 %shr9.i.iter19, 1229782938247303441, !dbg !352
  %shr11.i.iter19 = lshr i32 %xor2.i.i.iter19, 16, !dbg !353
  %and12.i.iter19 = and i32 %shr11.i.iter19, 15, !dbg !354
  %conv13.i.iter19 = zext nneg i32 %and12.i.iter19 to i64, !dbg !355
  %mul14.i.iter19 = mul nuw i64 %and10.i.iter19, %conv13.i.iter19, !dbg !356
  %xor15.i.iter19 = xor i64 %xor.i.iter19, %mul14.i.iter19, !dbg !357
  %arrayidx16.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter19, i32 %i.0.i69.iter19, !dbg !358
  %213 = load i64, ptr %arrayidx16.i.iter19, align 8, !dbg !358
  %shr17.i.iter19 = lshr i64 %213, 3, !dbg !359
  %and18.i.iter19 = and i64 %shr17.i.iter19, 1229782938247303441, !dbg !360
  %shr19.i.iter19 = lshr i32 %xor2.i.i.iter19, 24, !dbg !361
  %and20.i.iter19 = and i32 %shr19.i.iter19, 15, !dbg !362
  %conv21.i.iter19 = zext nneg i32 %and20.i.iter19 to i64, !dbg !363
  %mul22.i.iter19 = mul nuw i64 %and18.i.iter19, %conv21.i.iter19, !dbg !364
  %xor23.i.iter19 = xor i64 %xor15.i.iter19, %mul22.i.iter19, !dbg !365
  %arrayidx24.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter19, i32 %i.0.i69.iter19, !dbg !366
  %214 = load i64, ptr %arrayidx24.i.iter19, align 8, !dbg !367
  %xor25.i.iter19 = xor i64 %214, %xor23.i.iter19, !dbg !367
  store i64 %xor25.i.iter19, ptr %arrayidx24.i.iter19, align 8, !dbg !367
  %inc.i26.iter19 = add nuw nsw i32 %i.0.i69.iter19, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter19 = icmp eq i32 %inc.i26.iter19, 5, !dbg !369
  br i1 %exitcond.i23.not.iter19, label %m_vec_mul_add.exit.iter19, label %for.body.i.iter19, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter19:                        ; preds = %for.body.i.iter19
  %add13.i.iter19 = add nuw nsw i32 %k.0.i1270.iter19, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter19 = icmp eq i32 %add13.i.iter19, 8, !dbg !373
  br i1 %exitcond.i13.not.iter19, label %for.inc15.i14.iter19, label %for.body6.i17.iter19, !dbg !374, !llvm.loop !375

for.inc15.i14.iter19:                             ; preds = %m_vec_mul_add.exit.iter19
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter19 = add i32 %bs_mat_entries_used.1.i72.iter19, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter19 = add nuw nsw i32 %c.0.i673.iter19, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter19 = icmp eq i32 %add14.i15.iter19, %207, !dbg !379
  br i1 %exitcond1.i7.not.iter19, label %for.cond1.i5.for.inc17.i8_crit_edge.iter19, label %for.cond4.i11.preheader.iter19, !dbg !313, !llvm.loop !380

for.inc17.i8.iter19:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter19
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_19_end

for.cond4.i11.preheader.iter19:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter19, %for.inc15.i14.iter19
  %c.0.i673.iter19 = phi i32 [ 19, %for.cond4.i11.preheader.lr.ph.iter19 ], [ %inc.i16.iter19, %for.inc15.i14.iter19 ]
  %bs_mat_entries_used.1.i72.iter19 = phi i32 [ %split.iter18, %for.cond4.i11.preheader.lr.ph.iter19 ], [ %add14.i15.iter19, %for.inc15.i14.iter19 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter19, !dbg !374

for.cond4.i11.preheader.lr.ph.iter19:             ; preds = %for.cond1.preheader.i4.iter19
  br label %for.cond4.i11.preheader.iter19, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter19:       ; preds = %for.inc15.i14.iter19
  %split.iter19 = phi i32 [ %add14.i15.iter19, %for.inc15.i14.iter19 ]
  br label %for.inc17.i8.iter19, !dbg !313

iter_19_end:                                      ; preds = %for.inc17.i8.iter19
  br label %iter_20_start

iter_20_start:                                    ; preds = %iter_19_end
  br label %for.cond1.preheader.i4.iter20

for.cond1.preheader.i4.iter20:                    ; preds = %iter_20_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %215 = add i32 %split.iter19, 58, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter20, !dbg !313

for.body6.i17.iter20:                             ; preds = %for.cond4.i11.preheader.iter20, %m_vec_mul_add.exit.iter20
  %k.0.i1270.iter20 = phi i32 [ 0, %for.cond4.i11.preheader.iter20 ], [ %add13.i.iter20, %m_vec_mul_add.exit.iter20 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter20 = mul nsw i32 %bs_mat_entries_used.1.i72.iter20, 40, !dbg !319
  %add.ptr.i19.iter20 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter20, !dbg !319
  %mul8.i20.iter20 = shl nuw nsw i32 %c.0.i673.iter20, 3, !dbg !322
  %216 = getelementptr i8, ptr %O, i32 %mul8.i20.iter20, !dbg !323
  %arrayidx.i21.iter20 = getelementptr i8, ptr %216, i32 %k.0.i1270.iter20, !dbg !323
  %217 = load i8, ptr %arrayidx.i21.iter20, align 1, !dbg !323
  %add10.i.iter20 = or disjoint i32 160, %k.0.i1270.iter20, !dbg !324
  %add.ptr12.idx.i.iter20 = mul nuw nsw i32 %add10.i.iter20, 40, !dbg !325
  %add.ptr12.i.iter20 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter20, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter20 = zext i8 %217 to i32, !dbg !330
  %mul.i.i.iter20 = mul i32 %conv.i.i.iter20, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter20 = and i32 %mul.i.i.iter20, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter20 = lshr exact i32 %and.i.i.iter20, 4, !dbg !333
  %shr1.i.i.iter20 = lshr exact i32 %and.i.i.iter20, 3, !dbg !334
  %218 = xor i32 %shr.i.i.iter20, %shr1.i.i.iter20, !dbg !335
  %xor2.i.i.iter20 = xor i32 %218, %mul.i.i.iter20, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter20, !dbg !337

for.body.i.iter20:                                ; preds = %for.body.i.iter20, %for.body6.i17.iter20
  %i.0.i69.iter20 = phi i32 [ 0, %for.body6.i17.iter20 ], [ %inc.i26.iter20, %for.body.i.iter20 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter20, i32 %i.0.i69.iter20, !dbg !338
  %219 = load i64, ptr %arrayidx.i24.iter20, align 8, !dbg !338
  %and.i.iter20 = and i64 %219, 1229782938247303441, !dbg !339
  %and1.i.iter20 = and i32 %xor2.i.i.iter20, 255, !dbg !340
  %conv.i.iter20 = zext nneg i32 %and1.i.iter20 to i64, !dbg !341
  %mul.i25.iter20 = mul i64 %and.i.iter20, %conv.i.iter20, !dbg !342
  %shr.i.iter20 = lshr i64 %219, 1, !dbg !343
  %and3.i.iter20 = and i64 %shr.i.iter20, 1229782938247303441, !dbg !344
  %shr4.i.iter20 = lshr i32 %xor2.i.i.iter20, 8, !dbg !345
  %and5.i.iter20 = and i32 %shr4.i.iter20, 15, !dbg !346
  %conv6.i.iter20 = zext nneg i32 %and5.i.iter20 to i64, !dbg !347
  %mul7.i.iter20 = mul nuw i64 %and3.i.iter20, %conv6.i.iter20, !dbg !348
  %xor.i.iter20 = xor i64 %mul.i25.iter20, %mul7.i.iter20, !dbg !349
  %arrayidx8.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter20, i32 %i.0.i69.iter20, !dbg !350
  %220 = load i64, ptr %arrayidx8.i.iter20, align 8, !dbg !350
  %shr9.i.iter20 = lshr i64 %220, 2, !dbg !351
  %and10.i.iter20 = and i64 %shr9.i.iter20, 1229782938247303441, !dbg !352
  %shr11.i.iter20 = lshr i32 %xor2.i.i.iter20, 16, !dbg !353
  %and12.i.iter20 = and i32 %shr11.i.iter20, 15, !dbg !354
  %conv13.i.iter20 = zext nneg i32 %and12.i.iter20 to i64, !dbg !355
  %mul14.i.iter20 = mul nuw i64 %and10.i.iter20, %conv13.i.iter20, !dbg !356
  %xor15.i.iter20 = xor i64 %xor.i.iter20, %mul14.i.iter20, !dbg !357
  %arrayidx16.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter20, i32 %i.0.i69.iter20, !dbg !358
  %221 = load i64, ptr %arrayidx16.i.iter20, align 8, !dbg !358
  %shr17.i.iter20 = lshr i64 %221, 3, !dbg !359
  %and18.i.iter20 = and i64 %shr17.i.iter20, 1229782938247303441, !dbg !360
  %shr19.i.iter20 = lshr i32 %xor2.i.i.iter20, 24, !dbg !361
  %and20.i.iter20 = and i32 %shr19.i.iter20, 15, !dbg !362
  %conv21.i.iter20 = zext nneg i32 %and20.i.iter20 to i64, !dbg !363
  %mul22.i.iter20 = mul nuw i64 %and18.i.iter20, %conv21.i.iter20, !dbg !364
  %xor23.i.iter20 = xor i64 %xor15.i.iter20, %mul22.i.iter20, !dbg !365
  %arrayidx24.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter20, i32 %i.0.i69.iter20, !dbg !366
  %222 = load i64, ptr %arrayidx24.i.iter20, align 8, !dbg !367
  %xor25.i.iter20 = xor i64 %222, %xor23.i.iter20, !dbg !367
  store i64 %xor25.i.iter20, ptr %arrayidx24.i.iter20, align 8, !dbg !367
  %inc.i26.iter20 = add nuw nsw i32 %i.0.i69.iter20, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter20 = icmp eq i32 %inc.i26.iter20, 5, !dbg !369
  br i1 %exitcond.i23.not.iter20, label %m_vec_mul_add.exit.iter20, label %for.body.i.iter20, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter20:                        ; preds = %for.body.i.iter20
  %add13.i.iter20 = add nuw nsw i32 %k.0.i1270.iter20, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter20 = icmp eq i32 %add13.i.iter20, 8, !dbg !373
  br i1 %exitcond.i13.not.iter20, label %for.inc15.i14.iter20, label %for.body6.i17.iter20, !dbg !374, !llvm.loop !375

for.inc15.i14.iter20:                             ; preds = %m_vec_mul_add.exit.iter20
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter20 = add i32 %bs_mat_entries_used.1.i72.iter20, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter20 = add nuw nsw i32 %c.0.i673.iter20, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter20 = icmp eq i32 %add14.i15.iter20, %215, !dbg !379
  br i1 %exitcond1.i7.not.iter20, label %for.cond1.i5.for.inc17.i8_crit_edge.iter20, label %for.cond4.i11.preheader.iter20, !dbg !313, !llvm.loop !380

for.inc17.i8.iter20:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter20
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_20_end

for.cond4.i11.preheader.iter20:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter20, %for.inc15.i14.iter20
  %c.0.i673.iter20 = phi i32 [ 20, %for.cond4.i11.preheader.lr.ph.iter20 ], [ %inc.i16.iter20, %for.inc15.i14.iter20 ]
  %bs_mat_entries_used.1.i72.iter20 = phi i32 [ %split.iter19, %for.cond4.i11.preheader.lr.ph.iter20 ], [ %add14.i15.iter20, %for.inc15.i14.iter20 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter20, !dbg !374

for.cond4.i11.preheader.lr.ph.iter20:             ; preds = %for.cond1.preheader.i4.iter20
  br label %for.cond4.i11.preheader.iter20, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter20:       ; preds = %for.inc15.i14.iter20
  %split.iter20 = phi i32 [ %add14.i15.iter20, %for.inc15.i14.iter20 ]
  br label %for.inc17.i8.iter20, !dbg !313

iter_20_end:                                      ; preds = %for.inc17.i8.iter20
  br label %iter_21_start

iter_21_start:                                    ; preds = %iter_20_end
  br label %for.cond1.preheader.i4.iter21

for.cond1.preheader.i4.iter21:                    ; preds = %iter_21_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %223 = add i32 %split.iter20, 57, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter21, !dbg !313

for.body6.i17.iter21:                             ; preds = %for.cond4.i11.preheader.iter21, %m_vec_mul_add.exit.iter21
  %k.0.i1270.iter21 = phi i32 [ 0, %for.cond4.i11.preheader.iter21 ], [ %add13.i.iter21, %m_vec_mul_add.exit.iter21 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter21 = mul nsw i32 %bs_mat_entries_used.1.i72.iter21, 40, !dbg !319
  %add.ptr.i19.iter21 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter21, !dbg !319
  %mul8.i20.iter21 = shl nuw nsw i32 %c.0.i673.iter21, 3, !dbg !322
  %224 = getelementptr i8, ptr %O, i32 %mul8.i20.iter21, !dbg !323
  %arrayidx.i21.iter21 = getelementptr i8, ptr %224, i32 %k.0.i1270.iter21, !dbg !323
  %225 = load i8, ptr %arrayidx.i21.iter21, align 1, !dbg !323
  %add10.i.iter21 = or disjoint i32 168, %k.0.i1270.iter21, !dbg !324
  %add.ptr12.idx.i.iter21 = mul nuw nsw i32 %add10.i.iter21, 40, !dbg !325
  %add.ptr12.i.iter21 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter21, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter21 = zext i8 %225 to i32, !dbg !330
  %mul.i.i.iter21 = mul i32 %conv.i.i.iter21, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter21 = and i32 %mul.i.i.iter21, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter21 = lshr exact i32 %and.i.i.iter21, 4, !dbg !333
  %shr1.i.i.iter21 = lshr exact i32 %and.i.i.iter21, 3, !dbg !334
  %226 = xor i32 %shr.i.i.iter21, %shr1.i.i.iter21, !dbg !335
  %xor2.i.i.iter21 = xor i32 %226, %mul.i.i.iter21, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter21, !dbg !337

for.body.i.iter21:                                ; preds = %for.body.i.iter21, %for.body6.i17.iter21
  %i.0.i69.iter21 = phi i32 [ 0, %for.body6.i17.iter21 ], [ %inc.i26.iter21, %for.body.i.iter21 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter21, i32 %i.0.i69.iter21, !dbg !338
  %227 = load i64, ptr %arrayidx.i24.iter21, align 8, !dbg !338
  %and.i.iter21 = and i64 %227, 1229782938247303441, !dbg !339
  %and1.i.iter21 = and i32 %xor2.i.i.iter21, 255, !dbg !340
  %conv.i.iter21 = zext nneg i32 %and1.i.iter21 to i64, !dbg !341
  %mul.i25.iter21 = mul i64 %and.i.iter21, %conv.i.iter21, !dbg !342
  %shr.i.iter21 = lshr i64 %227, 1, !dbg !343
  %and3.i.iter21 = and i64 %shr.i.iter21, 1229782938247303441, !dbg !344
  %shr4.i.iter21 = lshr i32 %xor2.i.i.iter21, 8, !dbg !345
  %and5.i.iter21 = and i32 %shr4.i.iter21, 15, !dbg !346
  %conv6.i.iter21 = zext nneg i32 %and5.i.iter21 to i64, !dbg !347
  %mul7.i.iter21 = mul nuw i64 %and3.i.iter21, %conv6.i.iter21, !dbg !348
  %xor.i.iter21 = xor i64 %mul.i25.iter21, %mul7.i.iter21, !dbg !349
  %arrayidx8.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter21, i32 %i.0.i69.iter21, !dbg !350
  %228 = load i64, ptr %arrayidx8.i.iter21, align 8, !dbg !350
  %shr9.i.iter21 = lshr i64 %228, 2, !dbg !351
  %and10.i.iter21 = and i64 %shr9.i.iter21, 1229782938247303441, !dbg !352
  %shr11.i.iter21 = lshr i32 %xor2.i.i.iter21, 16, !dbg !353
  %and12.i.iter21 = and i32 %shr11.i.iter21, 15, !dbg !354
  %conv13.i.iter21 = zext nneg i32 %and12.i.iter21 to i64, !dbg !355
  %mul14.i.iter21 = mul nuw i64 %and10.i.iter21, %conv13.i.iter21, !dbg !356
  %xor15.i.iter21 = xor i64 %xor.i.iter21, %mul14.i.iter21, !dbg !357
  %arrayidx16.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter21, i32 %i.0.i69.iter21, !dbg !358
  %229 = load i64, ptr %arrayidx16.i.iter21, align 8, !dbg !358
  %shr17.i.iter21 = lshr i64 %229, 3, !dbg !359
  %and18.i.iter21 = and i64 %shr17.i.iter21, 1229782938247303441, !dbg !360
  %shr19.i.iter21 = lshr i32 %xor2.i.i.iter21, 24, !dbg !361
  %and20.i.iter21 = and i32 %shr19.i.iter21, 15, !dbg !362
  %conv21.i.iter21 = zext nneg i32 %and20.i.iter21 to i64, !dbg !363
  %mul22.i.iter21 = mul nuw i64 %and18.i.iter21, %conv21.i.iter21, !dbg !364
  %xor23.i.iter21 = xor i64 %xor15.i.iter21, %mul22.i.iter21, !dbg !365
  %arrayidx24.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter21, i32 %i.0.i69.iter21, !dbg !366
  %230 = load i64, ptr %arrayidx24.i.iter21, align 8, !dbg !367
  %xor25.i.iter21 = xor i64 %230, %xor23.i.iter21, !dbg !367
  store i64 %xor25.i.iter21, ptr %arrayidx24.i.iter21, align 8, !dbg !367
  %inc.i26.iter21 = add nuw nsw i32 %i.0.i69.iter21, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter21 = icmp eq i32 %inc.i26.iter21, 5, !dbg !369
  br i1 %exitcond.i23.not.iter21, label %m_vec_mul_add.exit.iter21, label %for.body.i.iter21, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter21:                        ; preds = %for.body.i.iter21
  %add13.i.iter21 = add nuw nsw i32 %k.0.i1270.iter21, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter21 = icmp eq i32 %add13.i.iter21, 8, !dbg !373
  br i1 %exitcond.i13.not.iter21, label %for.inc15.i14.iter21, label %for.body6.i17.iter21, !dbg !374, !llvm.loop !375

for.inc15.i14.iter21:                             ; preds = %m_vec_mul_add.exit.iter21
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter21 = add i32 %bs_mat_entries_used.1.i72.iter21, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter21 = add nuw nsw i32 %c.0.i673.iter21, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter21 = icmp eq i32 %add14.i15.iter21, %223, !dbg !379
  br i1 %exitcond1.i7.not.iter21, label %for.cond1.i5.for.inc17.i8_crit_edge.iter21, label %for.cond4.i11.preheader.iter21, !dbg !313, !llvm.loop !380

for.inc17.i8.iter21:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter21
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_21_end

for.cond4.i11.preheader.iter21:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter21, %for.inc15.i14.iter21
  %c.0.i673.iter21 = phi i32 [ 21, %for.cond4.i11.preheader.lr.ph.iter21 ], [ %inc.i16.iter21, %for.inc15.i14.iter21 ]
  %bs_mat_entries_used.1.i72.iter21 = phi i32 [ %split.iter20, %for.cond4.i11.preheader.lr.ph.iter21 ], [ %add14.i15.iter21, %for.inc15.i14.iter21 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter21, !dbg !374

for.cond4.i11.preheader.lr.ph.iter21:             ; preds = %for.cond1.preheader.i4.iter21
  br label %for.cond4.i11.preheader.iter21, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter21:       ; preds = %for.inc15.i14.iter21
  %split.iter21 = phi i32 [ %add14.i15.iter21, %for.inc15.i14.iter21 ]
  br label %for.inc17.i8.iter21, !dbg !313

iter_21_end:                                      ; preds = %for.inc17.i8.iter21
  br label %iter_22_start

iter_22_start:                                    ; preds = %iter_21_end
  br label %for.cond1.preheader.i4.iter22

for.cond1.preheader.i4.iter22:                    ; preds = %iter_22_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %231 = add i32 %split.iter21, 56, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter22, !dbg !313

for.body6.i17.iter22:                             ; preds = %for.cond4.i11.preheader.iter22, %m_vec_mul_add.exit.iter22
  %k.0.i1270.iter22 = phi i32 [ 0, %for.cond4.i11.preheader.iter22 ], [ %add13.i.iter22, %m_vec_mul_add.exit.iter22 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter22 = mul nsw i32 %bs_mat_entries_used.1.i72.iter22, 40, !dbg !319
  %add.ptr.i19.iter22 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter22, !dbg !319
  %mul8.i20.iter22 = shl nuw nsw i32 %c.0.i673.iter22, 3, !dbg !322
  %232 = getelementptr i8, ptr %O, i32 %mul8.i20.iter22, !dbg !323
  %arrayidx.i21.iter22 = getelementptr i8, ptr %232, i32 %k.0.i1270.iter22, !dbg !323
  %233 = load i8, ptr %arrayidx.i21.iter22, align 1, !dbg !323
  %add10.i.iter22 = or disjoint i32 176, %k.0.i1270.iter22, !dbg !324
  %add.ptr12.idx.i.iter22 = mul nuw nsw i32 %add10.i.iter22, 40, !dbg !325
  %add.ptr12.i.iter22 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter22, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter22 = zext i8 %233 to i32, !dbg !330
  %mul.i.i.iter22 = mul i32 %conv.i.i.iter22, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter22 = and i32 %mul.i.i.iter22, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter22 = lshr exact i32 %and.i.i.iter22, 4, !dbg !333
  %shr1.i.i.iter22 = lshr exact i32 %and.i.i.iter22, 3, !dbg !334
  %234 = xor i32 %shr.i.i.iter22, %shr1.i.i.iter22, !dbg !335
  %xor2.i.i.iter22 = xor i32 %234, %mul.i.i.iter22, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter22, !dbg !337

for.body.i.iter22:                                ; preds = %for.body.i.iter22, %for.body6.i17.iter22
  %i.0.i69.iter22 = phi i32 [ 0, %for.body6.i17.iter22 ], [ %inc.i26.iter22, %for.body.i.iter22 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter22, i32 %i.0.i69.iter22, !dbg !338
  %235 = load i64, ptr %arrayidx.i24.iter22, align 8, !dbg !338
  %and.i.iter22 = and i64 %235, 1229782938247303441, !dbg !339
  %and1.i.iter22 = and i32 %xor2.i.i.iter22, 255, !dbg !340
  %conv.i.iter22 = zext nneg i32 %and1.i.iter22 to i64, !dbg !341
  %mul.i25.iter22 = mul i64 %and.i.iter22, %conv.i.iter22, !dbg !342
  %shr.i.iter22 = lshr i64 %235, 1, !dbg !343
  %and3.i.iter22 = and i64 %shr.i.iter22, 1229782938247303441, !dbg !344
  %shr4.i.iter22 = lshr i32 %xor2.i.i.iter22, 8, !dbg !345
  %and5.i.iter22 = and i32 %shr4.i.iter22, 15, !dbg !346
  %conv6.i.iter22 = zext nneg i32 %and5.i.iter22 to i64, !dbg !347
  %mul7.i.iter22 = mul nuw i64 %and3.i.iter22, %conv6.i.iter22, !dbg !348
  %xor.i.iter22 = xor i64 %mul.i25.iter22, %mul7.i.iter22, !dbg !349
  %arrayidx8.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter22, i32 %i.0.i69.iter22, !dbg !350
  %236 = load i64, ptr %arrayidx8.i.iter22, align 8, !dbg !350
  %shr9.i.iter22 = lshr i64 %236, 2, !dbg !351
  %and10.i.iter22 = and i64 %shr9.i.iter22, 1229782938247303441, !dbg !352
  %shr11.i.iter22 = lshr i32 %xor2.i.i.iter22, 16, !dbg !353
  %and12.i.iter22 = and i32 %shr11.i.iter22, 15, !dbg !354
  %conv13.i.iter22 = zext nneg i32 %and12.i.iter22 to i64, !dbg !355
  %mul14.i.iter22 = mul nuw i64 %and10.i.iter22, %conv13.i.iter22, !dbg !356
  %xor15.i.iter22 = xor i64 %xor.i.iter22, %mul14.i.iter22, !dbg !357
  %arrayidx16.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter22, i32 %i.0.i69.iter22, !dbg !358
  %237 = load i64, ptr %arrayidx16.i.iter22, align 8, !dbg !358
  %shr17.i.iter22 = lshr i64 %237, 3, !dbg !359
  %and18.i.iter22 = and i64 %shr17.i.iter22, 1229782938247303441, !dbg !360
  %shr19.i.iter22 = lshr i32 %xor2.i.i.iter22, 24, !dbg !361
  %and20.i.iter22 = and i32 %shr19.i.iter22, 15, !dbg !362
  %conv21.i.iter22 = zext nneg i32 %and20.i.iter22 to i64, !dbg !363
  %mul22.i.iter22 = mul nuw i64 %and18.i.iter22, %conv21.i.iter22, !dbg !364
  %xor23.i.iter22 = xor i64 %xor15.i.iter22, %mul22.i.iter22, !dbg !365
  %arrayidx24.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter22, i32 %i.0.i69.iter22, !dbg !366
  %238 = load i64, ptr %arrayidx24.i.iter22, align 8, !dbg !367
  %xor25.i.iter22 = xor i64 %238, %xor23.i.iter22, !dbg !367
  store i64 %xor25.i.iter22, ptr %arrayidx24.i.iter22, align 8, !dbg !367
  %inc.i26.iter22 = add nuw nsw i32 %i.0.i69.iter22, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter22 = icmp eq i32 %inc.i26.iter22, 5, !dbg !369
  br i1 %exitcond.i23.not.iter22, label %m_vec_mul_add.exit.iter22, label %for.body.i.iter22, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter22:                        ; preds = %for.body.i.iter22
  %add13.i.iter22 = add nuw nsw i32 %k.0.i1270.iter22, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter22 = icmp eq i32 %add13.i.iter22, 8, !dbg !373
  br i1 %exitcond.i13.not.iter22, label %for.inc15.i14.iter22, label %for.body6.i17.iter22, !dbg !374, !llvm.loop !375

for.inc15.i14.iter22:                             ; preds = %m_vec_mul_add.exit.iter22
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter22 = add i32 %bs_mat_entries_used.1.i72.iter22, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter22 = add nuw nsw i32 %c.0.i673.iter22, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter22 = icmp eq i32 %add14.i15.iter22, %231, !dbg !379
  br i1 %exitcond1.i7.not.iter22, label %for.cond1.i5.for.inc17.i8_crit_edge.iter22, label %for.cond4.i11.preheader.iter22, !dbg !313, !llvm.loop !380

for.inc17.i8.iter22:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter22
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_22_end

for.cond4.i11.preheader.iter22:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter22, %for.inc15.i14.iter22
  %c.0.i673.iter22 = phi i32 [ 22, %for.cond4.i11.preheader.lr.ph.iter22 ], [ %inc.i16.iter22, %for.inc15.i14.iter22 ]
  %bs_mat_entries_used.1.i72.iter22 = phi i32 [ %split.iter21, %for.cond4.i11.preheader.lr.ph.iter22 ], [ %add14.i15.iter22, %for.inc15.i14.iter22 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter22, !dbg !374

for.cond4.i11.preheader.lr.ph.iter22:             ; preds = %for.cond1.preheader.i4.iter22
  br label %for.cond4.i11.preheader.iter22, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter22:       ; preds = %for.inc15.i14.iter22
  %split.iter22 = phi i32 [ %add14.i15.iter22, %for.inc15.i14.iter22 ]
  br label %for.inc17.i8.iter22, !dbg !313

iter_22_end:                                      ; preds = %for.inc17.i8.iter22
  br label %iter_23_start

iter_23_start:                                    ; preds = %iter_22_end
  br label %for.cond1.preheader.i4.iter23

for.cond1.preheader.i4.iter23:                    ; preds = %iter_23_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %239 = add i32 %split.iter22, 55, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter23, !dbg !313

for.body6.i17.iter23:                             ; preds = %for.cond4.i11.preheader.iter23, %m_vec_mul_add.exit.iter23
  %k.0.i1270.iter23 = phi i32 [ 0, %for.cond4.i11.preheader.iter23 ], [ %add13.i.iter23, %m_vec_mul_add.exit.iter23 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter23 = mul nsw i32 %bs_mat_entries_used.1.i72.iter23, 40, !dbg !319
  %add.ptr.i19.iter23 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter23, !dbg !319
  %mul8.i20.iter23 = shl nuw nsw i32 %c.0.i673.iter23, 3, !dbg !322
  %240 = getelementptr i8, ptr %O, i32 %mul8.i20.iter23, !dbg !323
  %arrayidx.i21.iter23 = getelementptr i8, ptr %240, i32 %k.0.i1270.iter23, !dbg !323
  %241 = load i8, ptr %arrayidx.i21.iter23, align 1, !dbg !323
  %add10.i.iter23 = or disjoint i32 184, %k.0.i1270.iter23, !dbg !324
  %add.ptr12.idx.i.iter23 = mul nuw nsw i32 %add10.i.iter23, 40, !dbg !325
  %add.ptr12.i.iter23 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter23, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter23 = zext i8 %241 to i32, !dbg !330
  %mul.i.i.iter23 = mul i32 %conv.i.i.iter23, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter23 = and i32 %mul.i.i.iter23, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter23 = lshr exact i32 %and.i.i.iter23, 4, !dbg !333
  %shr1.i.i.iter23 = lshr exact i32 %and.i.i.iter23, 3, !dbg !334
  %242 = xor i32 %shr.i.i.iter23, %shr1.i.i.iter23, !dbg !335
  %xor2.i.i.iter23 = xor i32 %242, %mul.i.i.iter23, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter23, !dbg !337

for.body.i.iter23:                                ; preds = %for.body.i.iter23, %for.body6.i17.iter23
  %i.0.i69.iter23 = phi i32 [ 0, %for.body6.i17.iter23 ], [ %inc.i26.iter23, %for.body.i.iter23 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter23, i32 %i.0.i69.iter23, !dbg !338
  %243 = load i64, ptr %arrayidx.i24.iter23, align 8, !dbg !338
  %and.i.iter23 = and i64 %243, 1229782938247303441, !dbg !339
  %and1.i.iter23 = and i32 %xor2.i.i.iter23, 255, !dbg !340
  %conv.i.iter23 = zext nneg i32 %and1.i.iter23 to i64, !dbg !341
  %mul.i25.iter23 = mul i64 %and.i.iter23, %conv.i.iter23, !dbg !342
  %shr.i.iter23 = lshr i64 %243, 1, !dbg !343
  %and3.i.iter23 = and i64 %shr.i.iter23, 1229782938247303441, !dbg !344
  %shr4.i.iter23 = lshr i32 %xor2.i.i.iter23, 8, !dbg !345
  %and5.i.iter23 = and i32 %shr4.i.iter23, 15, !dbg !346
  %conv6.i.iter23 = zext nneg i32 %and5.i.iter23 to i64, !dbg !347
  %mul7.i.iter23 = mul nuw i64 %and3.i.iter23, %conv6.i.iter23, !dbg !348
  %xor.i.iter23 = xor i64 %mul.i25.iter23, %mul7.i.iter23, !dbg !349
  %arrayidx8.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter23, i32 %i.0.i69.iter23, !dbg !350
  %244 = load i64, ptr %arrayidx8.i.iter23, align 8, !dbg !350
  %shr9.i.iter23 = lshr i64 %244, 2, !dbg !351
  %and10.i.iter23 = and i64 %shr9.i.iter23, 1229782938247303441, !dbg !352
  %shr11.i.iter23 = lshr i32 %xor2.i.i.iter23, 16, !dbg !353
  %and12.i.iter23 = and i32 %shr11.i.iter23, 15, !dbg !354
  %conv13.i.iter23 = zext nneg i32 %and12.i.iter23 to i64, !dbg !355
  %mul14.i.iter23 = mul nuw i64 %and10.i.iter23, %conv13.i.iter23, !dbg !356
  %xor15.i.iter23 = xor i64 %xor.i.iter23, %mul14.i.iter23, !dbg !357
  %arrayidx16.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter23, i32 %i.0.i69.iter23, !dbg !358
  %245 = load i64, ptr %arrayidx16.i.iter23, align 8, !dbg !358
  %shr17.i.iter23 = lshr i64 %245, 3, !dbg !359
  %and18.i.iter23 = and i64 %shr17.i.iter23, 1229782938247303441, !dbg !360
  %shr19.i.iter23 = lshr i32 %xor2.i.i.iter23, 24, !dbg !361
  %and20.i.iter23 = and i32 %shr19.i.iter23, 15, !dbg !362
  %conv21.i.iter23 = zext nneg i32 %and20.i.iter23 to i64, !dbg !363
  %mul22.i.iter23 = mul nuw i64 %and18.i.iter23, %conv21.i.iter23, !dbg !364
  %xor23.i.iter23 = xor i64 %xor15.i.iter23, %mul22.i.iter23, !dbg !365
  %arrayidx24.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter23, i32 %i.0.i69.iter23, !dbg !366
  %246 = load i64, ptr %arrayidx24.i.iter23, align 8, !dbg !367
  %xor25.i.iter23 = xor i64 %246, %xor23.i.iter23, !dbg !367
  store i64 %xor25.i.iter23, ptr %arrayidx24.i.iter23, align 8, !dbg !367
  %inc.i26.iter23 = add nuw nsw i32 %i.0.i69.iter23, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter23 = icmp eq i32 %inc.i26.iter23, 5, !dbg !369
  br i1 %exitcond.i23.not.iter23, label %m_vec_mul_add.exit.iter23, label %for.body.i.iter23, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter23:                        ; preds = %for.body.i.iter23
  %add13.i.iter23 = add nuw nsw i32 %k.0.i1270.iter23, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter23 = icmp eq i32 %add13.i.iter23, 8, !dbg !373
  br i1 %exitcond.i13.not.iter23, label %for.inc15.i14.iter23, label %for.body6.i17.iter23, !dbg !374, !llvm.loop !375

for.inc15.i14.iter23:                             ; preds = %m_vec_mul_add.exit.iter23
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter23 = add i32 %bs_mat_entries_used.1.i72.iter23, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter23 = add nuw nsw i32 %c.0.i673.iter23, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter23 = icmp eq i32 %add14.i15.iter23, %239, !dbg !379
  br i1 %exitcond1.i7.not.iter23, label %for.cond1.i5.for.inc17.i8_crit_edge.iter23, label %for.cond4.i11.preheader.iter23, !dbg !313, !llvm.loop !380

for.inc17.i8.iter23:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter23
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_23_end

for.cond4.i11.preheader.iter23:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter23, %for.inc15.i14.iter23
  %c.0.i673.iter23 = phi i32 [ 23, %for.cond4.i11.preheader.lr.ph.iter23 ], [ %inc.i16.iter23, %for.inc15.i14.iter23 ]
  %bs_mat_entries_used.1.i72.iter23 = phi i32 [ %split.iter22, %for.cond4.i11.preheader.lr.ph.iter23 ], [ %add14.i15.iter23, %for.inc15.i14.iter23 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter23, !dbg !374

for.cond4.i11.preheader.lr.ph.iter23:             ; preds = %for.cond1.preheader.i4.iter23
  br label %for.cond4.i11.preheader.iter23, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter23:       ; preds = %for.inc15.i14.iter23
  %split.iter23 = phi i32 [ %add14.i15.iter23, %for.inc15.i14.iter23 ]
  br label %for.inc17.i8.iter23, !dbg !313

iter_23_end:                                      ; preds = %for.inc17.i8.iter23
  br label %iter_24_start

iter_24_start:                                    ; preds = %iter_23_end
  br label %for.cond1.preheader.i4.iter24

for.cond1.preheader.i4.iter24:                    ; preds = %iter_24_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %247 = add i32 %split.iter23, 54, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter24, !dbg !313

for.body6.i17.iter24:                             ; preds = %for.cond4.i11.preheader.iter24, %m_vec_mul_add.exit.iter24
  %k.0.i1270.iter24 = phi i32 [ 0, %for.cond4.i11.preheader.iter24 ], [ %add13.i.iter24, %m_vec_mul_add.exit.iter24 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter24 = mul nsw i32 %bs_mat_entries_used.1.i72.iter24, 40, !dbg !319
  %add.ptr.i19.iter24 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter24, !dbg !319
  %mul8.i20.iter24 = shl nuw nsw i32 %c.0.i673.iter24, 3, !dbg !322
  %248 = getelementptr i8, ptr %O, i32 %mul8.i20.iter24, !dbg !323
  %arrayidx.i21.iter24 = getelementptr i8, ptr %248, i32 %k.0.i1270.iter24, !dbg !323
  %249 = load i8, ptr %arrayidx.i21.iter24, align 1, !dbg !323
  %add10.i.iter24 = or disjoint i32 192, %k.0.i1270.iter24, !dbg !324
  %add.ptr12.idx.i.iter24 = mul nuw nsw i32 %add10.i.iter24, 40, !dbg !325
  %add.ptr12.i.iter24 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter24, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter24 = zext i8 %249 to i32, !dbg !330
  %mul.i.i.iter24 = mul i32 %conv.i.i.iter24, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter24 = and i32 %mul.i.i.iter24, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter24 = lshr exact i32 %and.i.i.iter24, 4, !dbg !333
  %shr1.i.i.iter24 = lshr exact i32 %and.i.i.iter24, 3, !dbg !334
  %250 = xor i32 %shr.i.i.iter24, %shr1.i.i.iter24, !dbg !335
  %xor2.i.i.iter24 = xor i32 %250, %mul.i.i.iter24, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter24, !dbg !337

for.body.i.iter24:                                ; preds = %for.body.i.iter24, %for.body6.i17.iter24
  %i.0.i69.iter24 = phi i32 [ 0, %for.body6.i17.iter24 ], [ %inc.i26.iter24, %for.body.i.iter24 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter24, i32 %i.0.i69.iter24, !dbg !338
  %251 = load i64, ptr %arrayidx.i24.iter24, align 8, !dbg !338
  %and.i.iter24 = and i64 %251, 1229782938247303441, !dbg !339
  %and1.i.iter24 = and i32 %xor2.i.i.iter24, 255, !dbg !340
  %conv.i.iter24 = zext nneg i32 %and1.i.iter24 to i64, !dbg !341
  %mul.i25.iter24 = mul i64 %and.i.iter24, %conv.i.iter24, !dbg !342
  %shr.i.iter24 = lshr i64 %251, 1, !dbg !343
  %and3.i.iter24 = and i64 %shr.i.iter24, 1229782938247303441, !dbg !344
  %shr4.i.iter24 = lshr i32 %xor2.i.i.iter24, 8, !dbg !345
  %and5.i.iter24 = and i32 %shr4.i.iter24, 15, !dbg !346
  %conv6.i.iter24 = zext nneg i32 %and5.i.iter24 to i64, !dbg !347
  %mul7.i.iter24 = mul nuw i64 %and3.i.iter24, %conv6.i.iter24, !dbg !348
  %xor.i.iter24 = xor i64 %mul.i25.iter24, %mul7.i.iter24, !dbg !349
  %arrayidx8.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter24, i32 %i.0.i69.iter24, !dbg !350
  %252 = load i64, ptr %arrayidx8.i.iter24, align 8, !dbg !350
  %shr9.i.iter24 = lshr i64 %252, 2, !dbg !351
  %and10.i.iter24 = and i64 %shr9.i.iter24, 1229782938247303441, !dbg !352
  %shr11.i.iter24 = lshr i32 %xor2.i.i.iter24, 16, !dbg !353
  %and12.i.iter24 = and i32 %shr11.i.iter24, 15, !dbg !354
  %conv13.i.iter24 = zext nneg i32 %and12.i.iter24 to i64, !dbg !355
  %mul14.i.iter24 = mul nuw i64 %and10.i.iter24, %conv13.i.iter24, !dbg !356
  %xor15.i.iter24 = xor i64 %xor.i.iter24, %mul14.i.iter24, !dbg !357
  %arrayidx16.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter24, i32 %i.0.i69.iter24, !dbg !358
  %253 = load i64, ptr %arrayidx16.i.iter24, align 8, !dbg !358
  %shr17.i.iter24 = lshr i64 %253, 3, !dbg !359
  %and18.i.iter24 = and i64 %shr17.i.iter24, 1229782938247303441, !dbg !360
  %shr19.i.iter24 = lshr i32 %xor2.i.i.iter24, 24, !dbg !361
  %and20.i.iter24 = and i32 %shr19.i.iter24, 15, !dbg !362
  %conv21.i.iter24 = zext nneg i32 %and20.i.iter24 to i64, !dbg !363
  %mul22.i.iter24 = mul nuw i64 %and18.i.iter24, %conv21.i.iter24, !dbg !364
  %xor23.i.iter24 = xor i64 %xor15.i.iter24, %mul22.i.iter24, !dbg !365
  %arrayidx24.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter24, i32 %i.0.i69.iter24, !dbg !366
  %254 = load i64, ptr %arrayidx24.i.iter24, align 8, !dbg !367
  %xor25.i.iter24 = xor i64 %254, %xor23.i.iter24, !dbg !367
  store i64 %xor25.i.iter24, ptr %arrayidx24.i.iter24, align 8, !dbg !367
  %inc.i26.iter24 = add nuw nsw i32 %i.0.i69.iter24, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter24 = icmp eq i32 %inc.i26.iter24, 5, !dbg !369
  br i1 %exitcond.i23.not.iter24, label %m_vec_mul_add.exit.iter24, label %for.body.i.iter24, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter24:                        ; preds = %for.body.i.iter24
  %add13.i.iter24 = add nuw nsw i32 %k.0.i1270.iter24, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter24 = icmp eq i32 %add13.i.iter24, 8, !dbg !373
  br i1 %exitcond.i13.not.iter24, label %for.inc15.i14.iter24, label %for.body6.i17.iter24, !dbg !374, !llvm.loop !375

for.inc15.i14.iter24:                             ; preds = %m_vec_mul_add.exit.iter24
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter24 = add i32 %bs_mat_entries_used.1.i72.iter24, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter24 = add nuw nsw i32 %c.0.i673.iter24, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter24 = icmp eq i32 %add14.i15.iter24, %247, !dbg !379
  br i1 %exitcond1.i7.not.iter24, label %for.cond1.i5.for.inc17.i8_crit_edge.iter24, label %for.cond4.i11.preheader.iter24, !dbg !313, !llvm.loop !380

for.inc17.i8.iter24:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter24
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_24_end

for.cond4.i11.preheader.iter24:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter24, %for.inc15.i14.iter24
  %c.0.i673.iter24 = phi i32 [ 24, %for.cond4.i11.preheader.lr.ph.iter24 ], [ %inc.i16.iter24, %for.inc15.i14.iter24 ]
  %bs_mat_entries_used.1.i72.iter24 = phi i32 [ %split.iter23, %for.cond4.i11.preheader.lr.ph.iter24 ], [ %add14.i15.iter24, %for.inc15.i14.iter24 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter24, !dbg !374

for.cond4.i11.preheader.lr.ph.iter24:             ; preds = %for.cond1.preheader.i4.iter24
  br label %for.cond4.i11.preheader.iter24, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter24:       ; preds = %for.inc15.i14.iter24
  %split.iter24 = phi i32 [ %add14.i15.iter24, %for.inc15.i14.iter24 ]
  br label %for.inc17.i8.iter24, !dbg !313

iter_24_end:                                      ; preds = %for.inc17.i8.iter24
  br label %iter_25_start

iter_25_start:                                    ; preds = %iter_24_end
  br label %for.cond1.preheader.i4.iter25

for.cond1.preheader.i4.iter25:                    ; preds = %iter_25_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %255 = add i32 %split.iter24, 53, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter25, !dbg !313

for.body6.i17.iter25:                             ; preds = %for.cond4.i11.preheader.iter25, %m_vec_mul_add.exit.iter25
  %k.0.i1270.iter25 = phi i32 [ 0, %for.cond4.i11.preheader.iter25 ], [ %add13.i.iter25, %m_vec_mul_add.exit.iter25 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter25 = mul nsw i32 %bs_mat_entries_used.1.i72.iter25, 40, !dbg !319
  %add.ptr.i19.iter25 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter25, !dbg !319
  %mul8.i20.iter25 = shl nuw nsw i32 %c.0.i673.iter25, 3, !dbg !322
  %256 = getelementptr i8, ptr %O, i32 %mul8.i20.iter25, !dbg !323
  %arrayidx.i21.iter25 = getelementptr i8, ptr %256, i32 %k.0.i1270.iter25, !dbg !323
  %257 = load i8, ptr %arrayidx.i21.iter25, align 1, !dbg !323
  %add10.i.iter25 = or disjoint i32 200, %k.0.i1270.iter25, !dbg !324
  %add.ptr12.idx.i.iter25 = mul nuw nsw i32 %add10.i.iter25, 40, !dbg !325
  %add.ptr12.i.iter25 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter25, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter25 = zext i8 %257 to i32, !dbg !330
  %mul.i.i.iter25 = mul i32 %conv.i.i.iter25, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter25 = and i32 %mul.i.i.iter25, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter25 = lshr exact i32 %and.i.i.iter25, 4, !dbg !333
  %shr1.i.i.iter25 = lshr exact i32 %and.i.i.iter25, 3, !dbg !334
  %258 = xor i32 %shr.i.i.iter25, %shr1.i.i.iter25, !dbg !335
  %xor2.i.i.iter25 = xor i32 %258, %mul.i.i.iter25, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter25, !dbg !337

for.body.i.iter25:                                ; preds = %for.body.i.iter25, %for.body6.i17.iter25
  %i.0.i69.iter25 = phi i32 [ 0, %for.body6.i17.iter25 ], [ %inc.i26.iter25, %for.body.i.iter25 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter25, i32 %i.0.i69.iter25, !dbg !338
  %259 = load i64, ptr %arrayidx.i24.iter25, align 8, !dbg !338
  %and.i.iter25 = and i64 %259, 1229782938247303441, !dbg !339
  %and1.i.iter25 = and i32 %xor2.i.i.iter25, 255, !dbg !340
  %conv.i.iter25 = zext nneg i32 %and1.i.iter25 to i64, !dbg !341
  %mul.i25.iter25 = mul i64 %and.i.iter25, %conv.i.iter25, !dbg !342
  %shr.i.iter25 = lshr i64 %259, 1, !dbg !343
  %and3.i.iter25 = and i64 %shr.i.iter25, 1229782938247303441, !dbg !344
  %shr4.i.iter25 = lshr i32 %xor2.i.i.iter25, 8, !dbg !345
  %and5.i.iter25 = and i32 %shr4.i.iter25, 15, !dbg !346
  %conv6.i.iter25 = zext nneg i32 %and5.i.iter25 to i64, !dbg !347
  %mul7.i.iter25 = mul nuw i64 %and3.i.iter25, %conv6.i.iter25, !dbg !348
  %xor.i.iter25 = xor i64 %mul.i25.iter25, %mul7.i.iter25, !dbg !349
  %arrayidx8.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter25, i32 %i.0.i69.iter25, !dbg !350
  %260 = load i64, ptr %arrayidx8.i.iter25, align 8, !dbg !350
  %shr9.i.iter25 = lshr i64 %260, 2, !dbg !351
  %and10.i.iter25 = and i64 %shr9.i.iter25, 1229782938247303441, !dbg !352
  %shr11.i.iter25 = lshr i32 %xor2.i.i.iter25, 16, !dbg !353
  %and12.i.iter25 = and i32 %shr11.i.iter25, 15, !dbg !354
  %conv13.i.iter25 = zext nneg i32 %and12.i.iter25 to i64, !dbg !355
  %mul14.i.iter25 = mul nuw i64 %and10.i.iter25, %conv13.i.iter25, !dbg !356
  %xor15.i.iter25 = xor i64 %xor.i.iter25, %mul14.i.iter25, !dbg !357
  %arrayidx16.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter25, i32 %i.0.i69.iter25, !dbg !358
  %261 = load i64, ptr %arrayidx16.i.iter25, align 8, !dbg !358
  %shr17.i.iter25 = lshr i64 %261, 3, !dbg !359
  %and18.i.iter25 = and i64 %shr17.i.iter25, 1229782938247303441, !dbg !360
  %shr19.i.iter25 = lshr i32 %xor2.i.i.iter25, 24, !dbg !361
  %and20.i.iter25 = and i32 %shr19.i.iter25, 15, !dbg !362
  %conv21.i.iter25 = zext nneg i32 %and20.i.iter25 to i64, !dbg !363
  %mul22.i.iter25 = mul nuw i64 %and18.i.iter25, %conv21.i.iter25, !dbg !364
  %xor23.i.iter25 = xor i64 %xor15.i.iter25, %mul22.i.iter25, !dbg !365
  %arrayidx24.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter25, i32 %i.0.i69.iter25, !dbg !366
  %262 = load i64, ptr %arrayidx24.i.iter25, align 8, !dbg !367
  %xor25.i.iter25 = xor i64 %262, %xor23.i.iter25, !dbg !367
  store i64 %xor25.i.iter25, ptr %arrayidx24.i.iter25, align 8, !dbg !367
  %inc.i26.iter25 = add nuw nsw i32 %i.0.i69.iter25, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter25 = icmp eq i32 %inc.i26.iter25, 5, !dbg !369
  br i1 %exitcond.i23.not.iter25, label %m_vec_mul_add.exit.iter25, label %for.body.i.iter25, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter25:                        ; preds = %for.body.i.iter25
  %add13.i.iter25 = add nuw nsw i32 %k.0.i1270.iter25, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter25 = icmp eq i32 %add13.i.iter25, 8, !dbg !373
  br i1 %exitcond.i13.not.iter25, label %for.inc15.i14.iter25, label %for.body6.i17.iter25, !dbg !374, !llvm.loop !375

for.inc15.i14.iter25:                             ; preds = %m_vec_mul_add.exit.iter25
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter25 = add i32 %bs_mat_entries_used.1.i72.iter25, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter25 = add nuw nsw i32 %c.0.i673.iter25, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter25 = icmp eq i32 %add14.i15.iter25, %255, !dbg !379
  br i1 %exitcond1.i7.not.iter25, label %for.cond1.i5.for.inc17.i8_crit_edge.iter25, label %for.cond4.i11.preheader.iter25, !dbg !313, !llvm.loop !380

for.inc17.i8.iter25:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter25
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_25_end

for.cond4.i11.preheader.iter25:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter25, %for.inc15.i14.iter25
  %c.0.i673.iter25 = phi i32 [ 25, %for.cond4.i11.preheader.lr.ph.iter25 ], [ %inc.i16.iter25, %for.inc15.i14.iter25 ]
  %bs_mat_entries_used.1.i72.iter25 = phi i32 [ %split.iter24, %for.cond4.i11.preheader.lr.ph.iter25 ], [ %add14.i15.iter25, %for.inc15.i14.iter25 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter25, !dbg !374

for.cond4.i11.preheader.lr.ph.iter25:             ; preds = %for.cond1.preheader.i4.iter25
  br label %for.cond4.i11.preheader.iter25, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter25:       ; preds = %for.inc15.i14.iter25
  %split.iter25 = phi i32 [ %add14.i15.iter25, %for.inc15.i14.iter25 ]
  br label %for.inc17.i8.iter25, !dbg !313

iter_25_end:                                      ; preds = %for.inc17.i8.iter25
  br label %iter_26_start

iter_26_start:                                    ; preds = %iter_25_end
  br label %for.cond1.preheader.i4.iter26

for.cond1.preheader.i4.iter26:                    ; preds = %iter_26_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %263 = add i32 %split.iter25, 52, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter26, !dbg !313

for.body6.i17.iter26:                             ; preds = %for.cond4.i11.preheader.iter26, %m_vec_mul_add.exit.iter26
  %k.0.i1270.iter26 = phi i32 [ 0, %for.cond4.i11.preheader.iter26 ], [ %add13.i.iter26, %m_vec_mul_add.exit.iter26 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter26 = mul nsw i32 %bs_mat_entries_used.1.i72.iter26, 40, !dbg !319
  %add.ptr.i19.iter26 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter26, !dbg !319
  %mul8.i20.iter26 = shl nuw nsw i32 %c.0.i673.iter26, 3, !dbg !322
  %264 = getelementptr i8, ptr %O, i32 %mul8.i20.iter26, !dbg !323
  %arrayidx.i21.iter26 = getelementptr i8, ptr %264, i32 %k.0.i1270.iter26, !dbg !323
  %265 = load i8, ptr %arrayidx.i21.iter26, align 1, !dbg !323
  %add10.i.iter26 = or disjoint i32 208, %k.0.i1270.iter26, !dbg !324
  %add.ptr12.idx.i.iter26 = mul nuw nsw i32 %add10.i.iter26, 40, !dbg !325
  %add.ptr12.i.iter26 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter26, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter26 = zext i8 %265 to i32, !dbg !330
  %mul.i.i.iter26 = mul i32 %conv.i.i.iter26, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter26 = and i32 %mul.i.i.iter26, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter26 = lshr exact i32 %and.i.i.iter26, 4, !dbg !333
  %shr1.i.i.iter26 = lshr exact i32 %and.i.i.iter26, 3, !dbg !334
  %266 = xor i32 %shr.i.i.iter26, %shr1.i.i.iter26, !dbg !335
  %xor2.i.i.iter26 = xor i32 %266, %mul.i.i.iter26, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter26, !dbg !337

for.body.i.iter26:                                ; preds = %for.body.i.iter26, %for.body6.i17.iter26
  %i.0.i69.iter26 = phi i32 [ 0, %for.body6.i17.iter26 ], [ %inc.i26.iter26, %for.body.i.iter26 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter26, i32 %i.0.i69.iter26, !dbg !338
  %267 = load i64, ptr %arrayidx.i24.iter26, align 8, !dbg !338
  %and.i.iter26 = and i64 %267, 1229782938247303441, !dbg !339
  %and1.i.iter26 = and i32 %xor2.i.i.iter26, 255, !dbg !340
  %conv.i.iter26 = zext nneg i32 %and1.i.iter26 to i64, !dbg !341
  %mul.i25.iter26 = mul i64 %and.i.iter26, %conv.i.iter26, !dbg !342
  %shr.i.iter26 = lshr i64 %267, 1, !dbg !343
  %and3.i.iter26 = and i64 %shr.i.iter26, 1229782938247303441, !dbg !344
  %shr4.i.iter26 = lshr i32 %xor2.i.i.iter26, 8, !dbg !345
  %and5.i.iter26 = and i32 %shr4.i.iter26, 15, !dbg !346
  %conv6.i.iter26 = zext nneg i32 %and5.i.iter26 to i64, !dbg !347
  %mul7.i.iter26 = mul nuw i64 %and3.i.iter26, %conv6.i.iter26, !dbg !348
  %xor.i.iter26 = xor i64 %mul.i25.iter26, %mul7.i.iter26, !dbg !349
  %arrayidx8.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter26, i32 %i.0.i69.iter26, !dbg !350
  %268 = load i64, ptr %arrayidx8.i.iter26, align 8, !dbg !350
  %shr9.i.iter26 = lshr i64 %268, 2, !dbg !351
  %and10.i.iter26 = and i64 %shr9.i.iter26, 1229782938247303441, !dbg !352
  %shr11.i.iter26 = lshr i32 %xor2.i.i.iter26, 16, !dbg !353
  %and12.i.iter26 = and i32 %shr11.i.iter26, 15, !dbg !354
  %conv13.i.iter26 = zext nneg i32 %and12.i.iter26 to i64, !dbg !355
  %mul14.i.iter26 = mul nuw i64 %and10.i.iter26, %conv13.i.iter26, !dbg !356
  %xor15.i.iter26 = xor i64 %xor.i.iter26, %mul14.i.iter26, !dbg !357
  %arrayidx16.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter26, i32 %i.0.i69.iter26, !dbg !358
  %269 = load i64, ptr %arrayidx16.i.iter26, align 8, !dbg !358
  %shr17.i.iter26 = lshr i64 %269, 3, !dbg !359
  %and18.i.iter26 = and i64 %shr17.i.iter26, 1229782938247303441, !dbg !360
  %shr19.i.iter26 = lshr i32 %xor2.i.i.iter26, 24, !dbg !361
  %and20.i.iter26 = and i32 %shr19.i.iter26, 15, !dbg !362
  %conv21.i.iter26 = zext nneg i32 %and20.i.iter26 to i64, !dbg !363
  %mul22.i.iter26 = mul nuw i64 %and18.i.iter26, %conv21.i.iter26, !dbg !364
  %xor23.i.iter26 = xor i64 %xor15.i.iter26, %mul22.i.iter26, !dbg !365
  %arrayidx24.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter26, i32 %i.0.i69.iter26, !dbg !366
  %270 = load i64, ptr %arrayidx24.i.iter26, align 8, !dbg !367
  %xor25.i.iter26 = xor i64 %270, %xor23.i.iter26, !dbg !367
  store i64 %xor25.i.iter26, ptr %arrayidx24.i.iter26, align 8, !dbg !367
  %inc.i26.iter26 = add nuw nsw i32 %i.0.i69.iter26, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter26 = icmp eq i32 %inc.i26.iter26, 5, !dbg !369
  br i1 %exitcond.i23.not.iter26, label %m_vec_mul_add.exit.iter26, label %for.body.i.iter26, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter26:                        ; preds = %for.body.i.iter26
  %add13.i.iter26 = add nuw nsw i32 %k.0.i1270.iter26, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter26 = icmp eq i32 %add13.i.iter26, 8, !dbg !373
  br i1 %exitcond.i13.not.iter26, label %for.inc15.i14.iter26, label %for.body6.i17.iter26, !dbg !374, !llvm.loop !375

for.inc15.i14.iter26:                             ; preds = %m_vec_mul_add.exit.iter26
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter26 = add i32 %bs_mat_entries_used.1.i72.iter26, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter26 = add nuw nsw i32 %c.0.i673.iter26, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter26 = icmp eq i32 %add14.i15.iter26, %263, !dbg !379
  br i1 %exitcond1.i7.not.iter26, label %for.cond1.i5.for.inc17.i8_crit_edge.iter26, label %for.cond4.i11.preheader.iter26, !dbg !313, !llvm.loop !380

for.inc17.i8.iter26:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter26
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_26_end

for.cond4.i11.preheader.iter26:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter26, %for.inc15.i14.iter26
  %c.0.i673.iter26 = phi i32 [ 26, %for.cond4.i11.preheader.lr.ph.iter26 ], [ %inc.i16.iter26, %for.inc15.i14.iter26 ]
  %bs_mat_entries_used.1.i72.iter26 = phi i32 [ %split.iter25, %for.cond4.i11.preheader.lr.ph.iter26 ], [ %add14.i15.iter26, %for.inc15.i14.iter26 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter26, !dbg !374

for.cond4.i11.preheader.lr.ph.iter26:             ; preds = %for.cond1.preheader.i4.iter26
  br label %for.cond4.i11.preheader.iter26, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter26:       ; preds = %for.inc15.i14.iter26
  %split.iter26 = phi i32 [ %add14.i15.iter26, %for.inc15.i14.iter26 ]
  br label %for.inc17.i8.iter26, !dbg !313

iter_26_end:                                      ; preds = %for.inc17.i8.iter26
  br label %iter_27_start

iter_27_start:                                    ; preds = %iter_26_end
  br label %for.cond1.preheader.i4.iter27

for.cond1.preheader.i4.iter27:                    ; preds = %iter_27_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %271 = add i32 %split.iter26, 51, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter27, !dbg !313

for.body6.i17.iter27:                             ; preds = %for.cond4.i11.preheader.iter27, %m_vec_mul_add.exit.iter27
  %k.0.i1270.iter27 = phi i32 [ 0, %for.cond4.i11.preheader.iter27 ], [ %add13.i.iter27, %m_vec_mul_add.exit.iter27 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter27 = mul nsw i32 %bs_mat_entries_used.1.i72.iter27, 40, !dbg !319
  %add.ptr.i19.iter27 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter27, !dbg !319
  %mul8.i20.iter27 = shl nuw nsw i32 %c.0.i673.iter27, 3, !dbg !322
  %272 = getelementptr i8, ptr %O, i32 %mul8.i20.iter27, !dbg !323
  %arrayidx.i21.iter27 = getelementptr i8, ptr %272, i32 %k.0.i1270.iter27, !dbg !323
  %273 = load i8, ptr %arrayidx.i21.iter27, align 1, !dbg !323
  %add10.i.iter27 = or disjoint i32 216, %k.0.i1270.iter27, !dbg !324
  %add.ptr12.idx.i.iter27 = mul nuw nsw i32 %add10.i.iter27, 40, !dbg !325
  %add.ptr12.i.iter27 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter27, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter27 = zext i8 %273 to i32, !dbg !330
  %mul.i.i.iter27 = mul i32 %conv.i.i.iter27, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter27 = and i32 %mul.i.i.iter27, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter27 = lshr exact i32 %and.i.i.iter27, 4, !dbg !333
  %shr1.i.i.iter27 = lshr exact i32 %and.i.i.iter27, 3, !dbg !334
  %274 = xor i32 %shr.i.i.iter27, %shr1.i.i.iter27, !dbg !335
  %xor2.i.i.iter27 = xor i32 %274, %mul.i.i.iter27, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter27, !dbg !337

for.body.i.iter27:                                ; preds = %for.body.i.iter27, %for.body6.i17.iter27
  %i.0.i69.iter27 = phi i32 [ 0, %for.body6.i17.iter27 ], [ %inc.i26.iter27, %for.body.i.iter27 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter27, i32 %i.0.i69.iter27, !dbg !338
  %275 = load i64, ptr %arrayidx.i24.iter27, align 8, !dbg !338
  %and.i.iter27 = and i64 %275, 1229782938247303441, !dbg !339
  %and1.i.iter27 = and i32 %xor2.i.i.iter27, 255, !dbg !340
  %conv.i.iter27 = zext nneg i32 %and1.i.iter27 to i64, !dbg !341
  %mul.i25.iter27 = mul i64 %and.i.iter27, %conv.i.iter27, !dbg !342
  %shr.i.iter27 = lshr i64 %275, 1, !dbg !343
  %and3.i.iter27 = and i64 %shr.i.iter27, 1229782938247303441, !dbg !344
  %shr4.i.iter27 = lshr i32 %xor2.i.i.iter27, 8, !dbg !345
  %and5.i.iter27 = and i32 %shr4.i.iter27, 15, !dbg !346
  %conv6.i.iter27 = zext nneg i32 %and5.i.iter27 to i64, !dbg !347
  %mul7.i.iter27 = mul nuw i64 %and3.i.iter27, %conv6.i.iter27, !dbg !348
  %xor.i.iter27 = xor i64 %mul.i25.iter27, %mul7.i.iter27, !dbg !349
  %arrayidx8.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter27, i32 %i.0.i69.iter27, !dbg !350
  %276 = load i64, ptr %arrayidx8.i.iter27, align 8, !dbg !350
  %shr9.i.iter27 = lshr i64 %276, 2, !dbg !351
  %and10.i.iter27 = and i64 %shr9.i.iter27, 1229782938247303441, !dbg !352
  %shr11.i.iter27 = lshr i32 %xor2.i.i.iter27, 16, !dbg !353
  %and12.i.iter27 = and i32 %shr11.i.iter27, 15, !dbg !354
  %conv13.i.iter27 = zext nneg i32 %and12.i.iter27 to i64, !dbg !355
  %mul14.i.iter27 = mul nuw i64 %and10.i.iter27, %conv13.i.iter27, !dbg !356
  %xor15.i.iter27 = xor i64 %xor.i.iter27, %mul14.i.iter27, !dbg !357
  %arrayidx16.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter27, i32 %i.0.i69.iter27, !dbg !358
  %277 = load i64, ptr %arrayidx16.i.iter27, align 8, !dbg !358
  %shr17.i.iter27 = lshr i64 %277, 3, !dbg !359
  %and18.i.iter27 = and i64 %shr17.i.iter27, 1229782938247303441, !dbg !360
  %shr19.i.iter27 = lshr i32 %xor2.i.i.iter27, 24, !dbg !361
  %and20.i.iter27 = and i32 %shr19.i.iter27, 15, !dbg !362
  %conv21.i.iter27 = zext nneg i32 %and20.i.iter27 to i64, !dbg !363
  %mul22.i.iter27 = mul nuw i64 %and18.i.iter27, %conv21.i.iter27, !dbg !364
  %xor23.i.iter27 = xor i64 %xor15.i.iter27, %mul22.i.iter27, !dbg !365
  %arrayidx24.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter27, i32 %i.0.i69.iter27, !dbg !366
  %278 = load i64, ptr %arrayidx24.i.iter27, align 8, !dbg !367
  %xor25.i.iter27 = xor i64 %278, %xor23.i.iter27, !dbg !367
  store i64 %xor25.i.iter27, ptr %arrayidx24.i.iter27, align 8, !dbg !367
  %inc.i26.iter27 = add nuw nsw i32 %i.0.i69.iter27, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter27 = icmp eq i32 %inc.i26.iter27, 5, !dbg !369
  br i1 %exitcond.i23.not.iter27, label %m_vec_mul_add.exit.iter27, label %for.body.i.iter27, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter27:                        ; preds = %for.body.i.iter27
  %add13.i.iter27 = add nuw nsw i32 %k.0.i1270.iter27, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter27 = icmp eq i32 %add13.i.iter27, 8, !dbg !373
  br i1 %exitcond.i13.not.iter27, label %for.inc15.i14.iter27, label %for.body6.i17.iter27, !dbg !374, !llvm.loop !375

for.inc15.i14.iter27:                             ; preds = %m_vec_mul_add.exit.iter27
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter27 = add i32 %bs_mat_entries_used.1.i72.iter27, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter27 = add nuw nsw i32 %c.0.i673.iter27, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter27 = icmp eq i32 %add14.i15.iter27, %271, !dbg !379
  br i1 %exitcond1.i7.not.iter27, label %for.cond1.i5.for.inc17.i8_crit_edge.iter27, label %for.cond4.i11.preheader.iter27, !dbg !313, !llvm.loop !380

for.inc17.i8.iter27:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter27
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_27_end

for.cond4.i11.preheader.iter27:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter27, %for.inc15.i14.iter27
  %c.0.i673.iter27 = phi i32 [ 27, %for.cond4.i11.preheader.lr.ph.iter27 ], [ %inc.i16.iter27, %for.inc15.i14.iter27 ]
  %bs_mat_entries_used.1.i72.iter27 = phi i32 [ %split.iter26, %for.cond4.i11.preheader.lr.ph.iter27 ], [ %add14.i15.iter27, %for.inc15.i14.iter27 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter27, !dbg !374

for.cond4.i11.preheader.lr.ph.iter27:             ; preds = %for.cond1.preheader.i4.iter27
  br label %for.cond4.i11.preheader.iter27, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter27:       ; preds = %for.inc15.i14.iter27
  %split.iter27 = phi i32 [ %add14.i15.iter27, %for.inc15.i14.iter27 ]
  br label %for.inc17.i8.iter27, !dbg !313

iter_27_end:                                      ; preds = %for.inc17.i8.iter27
  br label %iter_28_start

iter_28_start:                                    ; preds = %iter_27_end
  br label %for.cond1.preheader.i4.iter28

for.cond1.preheader.i4.iter28:                    ; preds = %iter_28_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %279 = add i32 %split.iter27, 50, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter28, !dbg !313

for.body6.i17.iter28:                             ; preds = %for.cond4.i11.preheader.iter28, %m_vec_mul_add.exit.iter28
  %k.0.i1270.iter28 = phi i32 [ 0, %for.cond4.i11.preheader.iter28 ], [ %add13.i.iter28, %m_vec_mul_add.exit.iter28 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter28 = mul nsw i32 %bs_mat_entries_used.1.i72.iter28, 40, !dbg !319
  %add.ptr.i19.iter28 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter28, !dbg !319
  %mul8.i20.iter28 = shl nuw nsw i32 %c.0.i673.iter28, 3, !dbg !322
  %280 = getelementptr i8, ptr %O, i32 %mul8.i20.iter28, !dbg !323
  %arrayidx.i21.iter28 = getelementptr i8, ptr %280, i32 %k.0.i1270.iter28, !dbg !323
  %281 = load i8, ptr %arrayidx.i21.iter28, align 1, !dbg !323
  %add10.i.iter28 = or disjoint i32 224, %k.0.i1270.iter28, !dbg !324
  %add.ptr12.idx.i.iter28 = mul nuw nsw i32 %add10.i.iter28, 40, !dbg !325
  %add.ptr12.i.iter28 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter28, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter28 = zext i8 %281 to i32, !dbg !330
  %mul.i.i.iter28 = mul i32 %conv.i.i.iter28, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter28 = and i32 %mul.i.i.iter28, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter28 = lshr exact i32 %and.i.i.iter28, 4, !dbg !333
  %shr1.i.i.iter28 = lshr exact i32 %and.i.i.iter28, 3, !dbg !334
  %282 = xor i32 %shr.i.i.iter28, %shr1.i.i.iter28, !dbg !335
  %xor2.i.i.iter28 = xor i32 %282, %mul.i.i.iter28, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter28, !dbg !337

for.body.i.iter28:                                ; preds = %for.body.i.iter28, %for.body6.i17.iter28
  %i.0.i69.iter28 = phi i32 [ 0, %for.body6.i17.iter28 ], [ %inc.i26.iter28, %for.body.i.iter28 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter28, i32 %i.0.i69.iter28, !dbg !338
  %283 = load i64, ptr %arrayidx.i24.iter28, align 8, !dbg !338
  %and.i.iter28 = and i64 %283, 1229782938247303441, !dbg !339
  %and1.i.iter28 = and i32 %xor2.i.i.iter28, 255, !dbg !340
  %conv.i.iter28 = zext nneg i32 %and1.i.iter28 to i64, !dbg !341
  %mul.i25.iter28 = mul i64 %and.i.iter28, %conv.i.iter28, !dbg !342
  %shr.i.iter28 = lshr i64 %283, 1, !dbg !343
  %and3.i.iter28 = and i64 %shr.i.iter28, 1229782938247303441, !dbg !344
  %shr4.i.iter28 = lshr i32 %xor2.i.i.iter28, 8, !dbg !345
  %and5.i.iter28 = and i32 %shr4.i.iter28, 15, !dbg !346
  %conv6.i.iter28 = zext nneg i32 %and5.i.iter28 to i64, !dbg !347
  %mul7.i.iter28 = mul nuw i64 %and3.i.iter28, %conv6.i.iter28, !dbg !348
  %xor.i.iter28 = xor i64 %mul.i25.iter28, %mul7.i.iter28, !dbg !349
  %arrayidx8.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter28, i32 %i.0.i69.iter28, !dbg !350
  %284 = load i64, ptr %arrayidx8.i.iter28, align 8, !dbg !350
  %shr9.i.iter28 = lshr i64 %284, 2, !dbg !351
  %and10.i.iter28 = and i64 %shr9.i.iter28, 1229782938247303441, !dbg !352
  %shr11.i.iter28 = lshr i32 %xor2.i.i.iter28, 16, !dbg !353
  %and12.i.iter28 = and i32 %shr11.i.iter28, 15, !dbg !354
  %conv13.i.iter28 = zext nneg i32 %and12.i.iter28 to i64, !dbg !355
  %mul14.i.iter28 = mul nuw i64 %and10.i.iter28, %conv13.i.iter28, !dbg !356
  %xor15.i.iter28 = xor i64 %xor.i.iter28, %mul14.i.iter28, !dbg !357
  %arrayidx16.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter28, i32 %i.0.i69.iter28, !dbg !358
  %285 = load i64, ptr %arrayidx16.i.iter28, align 8, !dbg !358
  %shr17.i.iter28 = lshr i64 %285, 3, !dbg !359
  %and18.i.iter28 = and i64 %shr17.i.iter28, 1229782938247303441, !dbg !360
  %shr19.i.iter28 = lshr i32 %xor2.i.i.iter28, 24, !dbg !361
  %and20.i.iter28 = and i32 %shr19.i.iter28, 15, !dbg !362
  %conv21.i.iter28 = zext nneg i32 %and20.i.iter28 to i64, !dbg !363
  %mul22.i.iter28 = mul nuw i64 %and18.i.iter28, %conv21.i.iter28, !dbg !364
  %xor23.i.iter28 = xor i64 %xor15.i.iter28, %mul22.i.iter28, !dbg !365
  %arrayidx24.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter28, i32 %i.0.i69.iter28, !dbg !366
  %286 = load i64, ptr %arrayidx24.i.iter28, align 8, !dbg !367
  %xor25.i.iter28 = xor i64 %286, %xor23.i.iter28, !dbg !367
  store i64 %xor25.i.iter28, ptr %arrayidx24.i.iter28, align 8, !dbg !367
  %inc.i26.iter28 = add nuw nsw i32 %i.0.i69.iter28, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter28 = icmp eq i32 %inc.i26.iter28, 5, !dbg !369
  br i1 %exitcond.i23.not.iter28, label %m_vec_mul_add.exit.iter28, label %for.body.i.iter28, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter28:                        ; preds = %for.body.i.iter28
  %add13.i.iter28 = add nuw nsw i32 %k.0.i1270.iter28, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter28 = icmp eq i32 %add13.i.iter28, 8, !dbg !373
  br i1 %exitcond.i13.not.iter28, label %for.inc15.i14.iter28, label %for.body6.i17.iter28, !dbg !374, !llvm.loop !375

for.inc15.i14.iter28:                             ; preds = %m_vec_mul_add.exit.iter28
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter28 = add i32 %bs_mat_entries_used.1.i72.iter28, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter28 = add nuw nsw i32 %c.0.i673.iter28, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter28 = icmp eq i32 %add14.i15.iter28, %279, !dbg !379
  br i1 %exitcond1.i7.not.iter28, label %for.cond1.i5.for.inc17.i8_crit_edge.iter28, label %for.cond4.i11.preheader.iter28, !dbg !313, !llvm.loop !380

for.inc17.i8.iter28:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter28
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_28_end

for.cond4.i11.preheader.iter28:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter28, %for.inc15.i14.iter28
  %c.0.i673.iter28 = phi i32 [ 28, %for.cond4.i11.preheader.lr.ph.iter28 ], [ %inc.i16.iter28, %for.inc15.i14.iter28 ]
  %bs_mat_entries_used.1.i72.iter28 = phi i32 [ %split.iter27, %for.cond4.i11.preheader.lr.ph.iter28 ], [ %add14.i15.iter28, %for.inc15.i14.iter28 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter28, !dbg !374

for.cond4.i11.preheader.lr.ph.iter28:             ; preds = %for.cond1.preheader.i4.iter28
  br label %for.cond4.i11.preheader.iter28, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter28:       ; preds = %for.inc15.i14.iter28
  %split.iter28 = phi i32 [ %add14.i15.iter28, %for.inc15.i14.iter28 ]
  br label %for.inc17.i8.iter28, !dbg !313

iter_28_end:                                      ; preds = %for.inc17.i8.iter28
  br label %iter_29_start

iter_29_start:                                    ; preds = %iter_28_end
  br label %for.cond1.preheader.i4.iter29

for.cond1.preheader.i4.iter29:                    ; preds = %iter_29_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %287 = add i32 %split.iter28, 49, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter29, !dbg !313

for.body6.i17.iter29:                             ; preds = %for.cond4.i11.preheader.iter29, %m_vec_mul_add.exit.iter29
  %k.0.i1270.iter29 = phi i32 [ 0, %for.cond4.i11.preheader.iter29 ], [ %add13.i.iter29, %m_vec_mul_add.exit.iter29 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter29 = mul nsw i32 %bs_mat_entries_used.1.i72.iter29, 40, !dbg !319
  %add.ptr.i19.iter29 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter29, !dbg !319
  %mul8.i20.iter29 = shl nuw nsw i32 %c.0.i673.iter29, 3, !dbg !322
  %288 = getelementptr i8, ptr %O, i32 %mul8.i20.iter29, !dbg !323
  %arrayidx.i21.iter29 = getelementptr i8, ptr %288, i32 %k.0.i1270.iter29, !dbg !323
  %289 = load i8, ptr %arrayidx.i21.iter29, align 1, !dbg !323
  %add10.i.iter29 = or disjoint i32 232, %k.0.i1270.iter29, !dbg !324
  %add.ptr12.idx.i.iter29 = mul nuw nsw i32 %add10.i.iter29, 40, !dbg !325
  %add.ptr12.i.iter29 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter29, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter29 = zext i8 %289 to i32, !dbg !330
  %mul.i.i.iter29 = mul i32 %conv.i.i.iter29, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter29 = and i32 %mul.i.i.iter29, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter29 = lshr exact i32 %and.i.i.iter29, 4, !dbg !333
  %shr1.i.i.iter29 = lshr exact i32 %and.i.i.iter29, 3, !dbg !334
  %290 = xor i32 %shr.i.i.iter29, %shr1.i.i.iter29, !dbg !335
  %xor2.i.i.iter29 = xor i32 %290, %mul.i.i.iter29, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter29, !dbg !337

for.body.i.iter29:                                ; preds = %for.body.i.iter29, %for.body6.i17.iter29
  %i.0.i69.iter29 = phi i32 [ 0, %for.body6.i17.iter29 ], [ %inc.i26.iter29, %for.body.i.iter29 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter29, i32 %i.0.i69.iter29, !dbg !338
  %291 = load i64, ptr %arrayidx.i24.iter29, align 8, !dbg !338
  %and.i.iter29 = and i64 %291, 1229782938247303441, !dbg !339
  %and1.i.iter29 = and i32 %xor2.i.i.iter29, 255, !dbg !340
  %conv.i.iter29 = zext nneg i32 %and1.i.iter29 to i64, !dbg !341
  %mul.i25.iter29 = mul i64 %and.i.iter29, %conv.i.iter29, !dbg !342
  %shr.i.iter29 = lshr i64 %291, 1, !dbg !343
  %and3.i.iter29 = and i64 %shr.i.iter29, 1229782938247303441, !dbg !344
  %shr4.i.iter29 = lshr i32 %xor2.i.i.iter29, 8, !dbg !345
  %and5.i.iter29 = and i32 %shr4.i.iter29, 15, !dbg !346
  %conv6.i.iter29 = zext nneg i32 %and5.i.iter29 to i64, !dbg !347
  %mul7.i.iter29 = mul nuw i64 %and3.i.iter29, %conv6.i.iter29, !dbg !348
  %xor.i.iter29 = xor i64 %mul.i25.iter29, %mul7.i.iter29, !dbg !349
  %arrayidx8.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter29, i32 %i.0.i69.iter29, !dbg !350
  %292 = load i64, ptr %arrayidx8.i.iter29, align 8, !dbg !350
  %shr9.i.iter29 = lshr i64 %292, 2, !dbg !351
  %and10.i.iter29 = and i64 %shr9.i.iter29, 1229782938247303441, !dbg !352
  %shr11.i.iter29 = lshr i32 %xor2.i.i.iter29, 16, !dbg !353
  %and12.i.iter29 = and i32 %shr11.i.iter29, 15, !dbg !354
  %conv13.i.iter29 = zext nneg i32 %and12.i.iter29 to i64, !dbg !355
  %mul14.i.iter29 = mul nuw i64 %and10.i.iter29, %conv13.i.iter29, !dbg !356
  %xor15.i.iter29 = xor i64 %xor.i.iter29, %mul14.i.iter29, !dbg !357
  %arrayidx16.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter29, i32 %i.0.i69.iter29, !dbg !358
  %293 = load i64, ptr %arrayidx16.i.iter29, align 8, !dbg !358
  %shr17.i.iter29 = lshr i64 %293, 3, !dbg !359
  %and18.i.iter29 = and i64 %shr17.i.iter29, 1229782938247303441, !dbg !360
  %shr19.i.iter29 = lshr i32 %xor2.i.i.iter29, 24, !dbg !361
  %and20.i.iter29 = and i32 %shr19.i.iter29, 15, !dbg !362
  %conv21.i.iter29 = zext nneg i32 %and20.i.iter29 to i64, !dbg !363
  %mul22.i.iter29 = mul nuw i64 %and18.i.iter29, %conv21.i.iter29, !dbg !364
  %xor23.i.iter29 = xor i64 %xor15.i.iter29, %mul22.i.iter29, !dbg !365
  %arrayidx24.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter29, i32 %i.0.i69.iter29, !dbg !366
  %294 = load i64, ptr %arrayidx24.i.iter29, align 8, !dbg !367
  %xor25.i.iter29 = xor i64 %294, %xor23.i.iter29, !dbg !367
  store i64 %xor25.i.iter29, ptr %arrayidx24.i.iter29, align 8, !dbg !367
  %inc.i26.iter29 = add nuw nsw i32 %i.0.i69.iter29, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter29 = icmp eq i32 %inc.i26.iter29, 5, !dbg !369
  br i1 %exitcond.i23.not.iter29, label %m_vec_mul_add.exit.iter29, label %for.body.i.iter29, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter29:                        ; preds = %for.body.i.iter29
  %add13.i.iter29 = add nuw nsw i32 %k.0.i1270.iter29, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter29 = icmp eq i32 %add13.i.iter29, 8, !dbg !373
  br i1 %exitcond.i13.not.iter29, label %for.inc15.i14.iter29, label %for.body6.i17.iter29, !dbg !374, !llvm.loop !375

for.inc15.i14.iter29:                             ; preds = %m_vec_mul_add.exit.iter29
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter29 = add i32 %bs_mat_entries_used.1.i72.iter29, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter29 = add nuw nsw i32 %c.0.i673.iter29, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter29 = icmp eq i32 %add14.i15.iter29, %287, !dbg !379
  br i1 %exitcond1.i7.not.iter29, label %for.cond1.i5.for.inc17.i8_crit_edge.iter29, label %for.cond4.i11.preheader.iter29, !dbg !313, !llvm.loop !380

for.inc17.i8.iter29:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter29
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_29_end

for.cond4.i11.preheader.iter29:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter29, %for.inc15.i14.iter29
  %c.0.i673.iter29 = phi i32 [ 29, %for.cond4.i11.preheader.lr.ph.iter29 ], [ %inc.i16.iter29, %for.inc15.i14.iter29 ]
  %bs_mat_entries_used.1.i72.iter29 = phi i32 [ %split.iter28, %for.cond4.i11.preheader.lr.ph.iter29 ], [ %add14.i15.iter29, %for.inc15.i14.iter29 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter29, !dbg !374

for.cond4.i11.preheader.lr.ph.iter29:             ; preds = %for.cond1.preheader.i4.iter29
  br label %for.cond4.i11.preheader.iter29, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter29:       ; preds = %for.inc15.i14.iter29
  %split.iter29 = phi i32 [ %add14.i15.iter29, %for.inc15.i14.iter29 ]
  br label %for.inc17.i8.iter29, !dbg !313

iter_29_end:                                      ; preds = %for.inc17.i8.iter29
  br label %iter_30_start

iter_30_start:                                    ; preds = %iter_29_end
  br label %for.cond1.preheader.i4.iter30

for.cond1.preheader.i4.iter30:                    ; preds = %iter_30_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %295 = add i32 %split.iter29, 48, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter30, !dbg !313

for.body6.i17.iter30:                             ; preds = %for.cond4.i11.preheader.iter30, %m_vec_mul_add.exit.iter30
  %k.0.i1270.iter30 = phi i32 [ 0, %for.cond4.i11.preheader.iter30 ], [ %add13.i.iter30, %m_vec_mul_add.exit.iter30 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter30 = mul nsw i32 %bs_mat_entries_used.1.i72.iter30, 40, !dbg !319
  %add.ptr.i19.iter30 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter30, !dbg !319
  %mul8.i20.iter30 = shl nuw nsw i32 %c.0.i673.iter30, 3, !dbg !322
  %296 = getelementptr i8, ptr %O, i32 %mul8.i20.iter30, !dbg !323
  %arrayidx.i21.iter30 = getelementptr i8, ptr %296, i32 %k.0.i1270.iter30, !dbg !323
  %297 = load i8, ptr %arrayidx.i21.iter30, align 1, !dbg !323
  %add10.i.iter30 = or disjoint i32 240, %k.0.i1270.iter30, !dbg !324
  %add.ptr12.idx.i.iter30 = mul nuw nsw i32 %add10.i.iter30, 40, !dbg !325
  %add.ptr12.i.iter30 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter30, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter30 = zext i8 %297 to i32, !dbg !330
  %mul.i.i.iter30 = mul i32 %conv.i.i.iter30, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter30 = and i32 %mul.i.i.iter30, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter30 = lshr exact i32 %and.i.i.iter30, 4, !dbg !333
  %shr1.i.i.iter30 = lshr exact i32 %and.i.i.iter30, 3, !dbg !334
  %298 = xor i32 %shr.i.i.iter30, %shr1.i.i.iter30, !dbg !335
  %xor2.i.i.iter30 = xor i32 %298, %mul.i.i.iter30, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter30, !dbg !337

for.body.i.iter30:                                ; preds = %for.body.i.iter30, %for.body6.i17.iter30
  %i.0.i69.iter30 = phi i32 [ 0, %for.body6.i17.iter30 ], [ %inc.i26.iter30, %for.body.i.iter30 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter30, i32 %i.0.i69.iter30, !dbg !338
  %299 = load i64, ptr %arrayidx.i24.iter30, align 8, !dbg !338
  %and.i.iter30 = and i64 %299, 1229782938247303441, !dbg !339
  %and1.i.iter30 = and i32 %xor2.i.i.iter30, 255, !dbg !340
  %conv.i.iter30 = zext nneg i32 %and1.i.iter30 to i64, !dbg !341
  %mul.i25.iter30 = mul i64 %and.i.iter30, %conv.i.iter30, !dbg !342
  %shr.i.iter30 = lshr i64 %299, 1, !dbg !343
  %and3.i.iter30 = and i64 %shr.i.iter30, 1229782938247303441, !dbg !344
  %shr4.i.iter30 = lshr i32 %xor2.i.i.iter30, 8, !dbg !345
  %and5.i.iter30 = and i32 %shr4.i.iter30, 15, !dbg !346
  %conv6.i.iter30 = zext nneg i32 %and5.i.iter30 to i64, !dbg !347
  %mul7.i.iter30 = mul nuw i64 %and3.i.iter30, %conv6.i.iter30, !dbg !348
  %xor.i.iter30 = xor i64 %mul.i25.iter30, %mul7.i.iter30, !dbg !349
  %arrayidx8.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter30, i32 %i.0.i69.iter30, !dbg !350
  %300 = load i64, ptr %arrayidx8.i.iter30, align 8, !dbg !350
  %shr9.i.iter30 = lshr i64 %300, 2, !dbg !351
  %and10.i.iter30 = and i64 %shr9.i.iter30, 1229782938247303441, !dbg !352
  %shr11.i.iter30 = lshr i32 %xor2.i.i.iter30, 16, !dbg !353
  %and12.i.iter30 = and i32 %shr11.i.iter30, 15, !dbg !354
  %conv13.i.iter30 = zext nneg i32 %and12.i.iter30 to i64, !dbg !355
  %mul14.i.iter30 = mul nuw i64 %and10.i.iter30, %conv13.i.iter30, !dbg !356
  %xor15.i.iter30 = xor i64 %xor.i.iter30, %mul14.i.iter30, !dbg !357
  %arrayidx16.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter30, i32 %i.0.i69.iter30, !dbg !358
  %301 = load i64, ptr %arrayidx16.i.iter30, align 8, !dbg !358
  %shr17.i.iter30 = lshr i64 %301, 3, !dbg !359
  %and18.i.iter30 = and i64 %shr17.i.iter30, 1229782938247303441, !dbg !360
  %shr19.i.iter30 = lshr i32 %xor2.i.i.iter30, 24, !dbg !361
  %and20.i.iter30 = and i32 %shr19.i.iter30, 15, !dbg !362
  %conv21.i.iter30 = zext nneg i32 %and20.i.iter30 to i64, !dbg !363
  %mul22.i.iter30 = mul nuw i64 %and18.i.iter30, %conv21.i.iter30, !dbg !364
  %xor23.i.iter30 = xor i64 %xor15.i.iter30, %mul22.i.iter30, !dbg !365
  %arrayidx24.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter30, i32 %i.0.i69.iter30, !dbg !366
  %302 = load i64, ptr %arrayidx24.i.iter30, align 8, !dbg !367
  %xor25.i.iter30 = xor i64 %302, %xor23.i.iter30, !dbg !367
  store i64 %xor25.i.iter30, ptr %arrayidx24.i.iter30, align 8, !dbg !367
  %inc.i26.iter30 = add nuw nsw i32 %i.0.i69.iter30, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter30 = icmp eq i32 %inc.i26.iter30, 5, !dbg !369
  br i1 %exitcond.i23.not.iter30, label %m_vec_mul_add.exit.iter30, label %for.body.i.iter30, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter30:                        ; preds = %for.body.i.iter30
  %add13.i.iter30 = add nuw nsw i32 %k.0.i1270.iter30, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter30 = icmp eq i32 %add13.i.iter30, 8, !dbg !373
  br i1 %exitcond.i13.not.iter30, label %for.inc15.i14.iter30, label %for.body6.i17.iter30, !dbg !374, !llvm.loop !375

for.inc15.i14.iter30:                             ; preds = %m_vec_mul_add.exit.iter30
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter30 = add i32 %bs_mat_entries_used.1.i72.iter30, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter30 = add nuw nsw i32 %c.0.i673.iter30, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter30 = icmp eq i32 %add14.i15.iter30, %295, !dbg !379
  br i1 %exitcond1.i7.not.iter30, label %for.cond1.i5.for.inc17.i8_crit_edge.iter30, label %for.cond4.i11.preheader.iter30, !dbg !313, !llvm.loop !380

for.inc17.i8.iter30:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter30
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_30_end

for.cond4.i11.preheader.iter30:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter30, %for.inc15.i14.iter30
  %c.0.i673.iter30 = phi i32 [ 30, %for.cond4.i11.preheader.lr.ph.iter30 ], [ %inc.i16.iter30, %for.inc15.i14.iter30 ]
  %bs_mat_entries_used.1.i72.iter30 = phi i32 [ %split.iter29, %for.cond4.i11.preheader.lr.ph.iter30 ], [ %add14.i15.iter30, %for.inc15.i14.iter30 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter30, !dbg !374

for.cond4.i11.preheader.lr.ph.iter30:             ; preds = %for.cond1.preheader.i4.iter30
  br label %for.cond4.i11.preheader.iter30, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter30:       ; preds = %for.inc15.i14.iter30
  %split.iter30 = phi i32 [ %add14.i15.iter30, %for.inc15.i14.iter30 ]
  br label %for.inc17.i8.iter30, !dbg !313

iter_30_end:                                      ; preds = %for.inc17.i8.iter30
  br label %iter_31_start

iter_31_start:                                    ; preds = %iter_30_end
  br label %for.cond1.preheader.i4.iter31

for.cond1.preheader.i4.iter31:                    ; preds = %iter_31_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %303 = add i32 %split.iter30, 47, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter31, !dbg !313

for.body6.i17.iter31:                             ; preds = %for.cond4.i11.preheader.iter31, %m_vec_mul_add.exit.iter31
  %k.0.i1270.iter31 = phi i32 [ 0, %for.cond4.i11.preheader.iter31 ], [ %add13.i.iter31, %m_vec_mul_add.exit.iter31 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter31 = mul nsw i32 %bs_mat_entries_used.1.i72.iter31, 40, !dbg !319
  %add.ptr.i19.iter31 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter31, !dbg !319
  %mul8.i20.iter31 = shl nuw nsw i32 %c.0.i673.iter31, 3, !dbg !322
  %304 = getelementptr i8, ptr %O, i32 %mul8.i20.iter31, !dbg !323
  %arrayidx.i21.iter31 = getelementptr i8, ptr %304, i32 %k.0.i1270.iter31, !dbg !323
  %305 = load i8, ptr %arrayidx.i21.iter31, align 1, !dbg !323
  %add10.i.iter31 = or disjoint i32 248, %k.0.i1270.iter31, !dbg !324
  %add.ptr12.idx.i.iter31 = mul nuw nsw i32 %add10.i.iter31, 40, !dbg !325
  %add.ptr12.i.iter31 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter31, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter31 = zext i8 %305 to i32, !dbg !330
  %mul.i.i.iter31 = mul i32 %conv.i.i.iter31, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter31 = and i32 %mul.i.i.iter31, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter31 = lshr exact i32 %and.i.i.iter31, 4, !dbg !333
  %shr1.i.i.iter31 = lshr exact i32 %and.i.i.iter31, 3, !dbg !334
  %306 = xor i32 %shr.i.i.iter31, %shr1.i.i.iter31, !dbg !335
  %xor2.i.i.iter31 = xor i32 %306, %mul.i.i.iter31, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter31, !dbg !337

for.body.i.iter31:                                ; preds = %for.body.i.iter31, %for.body6.i17.iter31
  %i.0.i69.iter31 = phi i32 [ 0, %for.body6.i17.iter31 ], [ %inc.i26.iter31, %for.body.i.iter31 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter31, i32 %i.0.i69.iter31, !dbg !338
  %307 = load i64, ptr %arrayidx.i24.iter31, align 8, !dbg !338
  %and.i.iter31 = and i64 %307, 1229782938247303441, !dbg !339
  %and1.i.iter31 = and i32 %xor2.i.i.iter31, 255, !dbg !340
  %conv.i.iter31 = zext nneg i32 %and1.i.iter31 to i64, !dbg !341
  %mul.i25.iter31 = mul i64 %and.i.iter31, %conv.i.iter31, !dbg !342
  %shr.i.iter31 = lshr i64 %307, 1, !dbg !343
  %and3.i.iter31 = and i64 %shr.i.iter31, 1229782938247303441, !dbg !344
  %shr4.i.iter31 = lshr i32 %xor2.i.i.iter31, 8, !dbg !345
  %and5.i.iter31 = and i32 %shr4.i.iter31, 15, !dbg !346
  %conv6.i.iter31 = zext nneg i32 %and5.i.iter31 to i64, !dbg !347
  %mul7.i.iter31 = mul nuw i64 %and3.i.iter31, %conv6.i.iter31, !dbg !348
  %xor.i.iter31 = xor i64 %mul.i25.iter31, %mul7.i.iter31, !dbg !349
  %arrayidx8.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter31, i32 %i.0.i69.iter31, !dbg !350
  %308 = load i64, ptr %arrayidx8.i.iter31, align 8, !dbg !350
  %shr9.i.iter31 = lshr i64 %308, 2, !dbg !351
  %and10.i.iter31 = and i64 %shr9.i.iter31, 1229782938247303441, !dbg !352
  %shr11.i.iter31 = lshr i32 %xor2.i.i.iter31, 16, !dbg !353
  %and12.i.iter31 = and i32 %shr11.i.iter31, 15, !dbg !354
  %conv13.i.iter31 = zext nneg i32 %and12.i.iter31 to i64, !dbg !355
  %mul14.i.iter31 = mul nuw i64 %and10.i.iter31, %conv13.i.iter31, !dbg !356
  %xor15.i.iter31 = xor i64 %xor.i.iter31, %mul14.i.iter31, !dbg !357
  %arrayidx16.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter31, i32 %i.0.i69.iter31, !dbg !358
  %309 = load i64, ptr %arrayidx16.i.iter31, align 8, !dbg !358
  %shr17.i.iter31 = lshr i64 %309, 3, !dbg !359
  %and18.i.iter31 = and i64 %shr17.i.iter31, 1229782938247303441, !dbg !360
  %shr19.i.iter31 = lshr i32 %xor2.i.i.iter31, 24, !dbg !361
  %and20.i.iter31 = and i32 %shr19.i.iter31, 15, !dbg !362
  %conv21.i.iter31 = zext nneg i32 %and20.i.iter31 to i64, !dbg !363
  %mul22.i.iter31 = mul nuw i64 %and18.i.iter31, %conv21.i.iter31, !dbg !364
  %xor23.i.iter31 = xor i64 %xor15.i.iter31, %mul22.i.iter31, !dbg !365
  %arrayidx24.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter31, i32 %i.0.i69.iter31, !dbg !366
  %310 = load i64, ptr %arrayidx24.i.iter31, align 8, !dbg !367
  %xor25.i.iter31 = xor i64 %310, %xor23.i.iter31, !dbg !367
  store i64 %xor25.i.iter31, ptr %arrayidx24.i.iter31, align 8, !dbg !367
  %inc.i26.iter31 = add nuw nsw i32 %i.0.i69.iter31, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter31 = icmp eq i32 %inc.i26.iter31, 5, !dbg !369
  br i1 %exitcond.i23.not.iter31, label %m_vec_mul_add.exit.iter31, label %for.body.i.iter31, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter31:                        ; preds = %for.body.i.iter31
  %add13.i.iter31 = add nuw nsw i32 %k.0.i1270.iter31, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter31 = icmp eq i32 %add13.i.iter31, 8, !dbg !373
  br i1 %exitcond.i13.not.iter31, label %for.inc15.i14.iter31, label %for.body6.i17.iter31, !dbg !374, !llvm.loop !375

for.inc15.i14.iter31:                             ; preds = %m_vec_mul_add.exit.iter31
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter31 = add i32 %bs_mat_entries_used.1.i72.iter31, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter31 = add nuw nsw i32 %c.0.i673.iter31, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter31 = icmp eq i32 %add14.i15.iter31, %303, !dbg !379
  br i1 %exitcond1.i7.not.iter31, label %for.cond1.i5.for.inc17.i8_crit_edge.iter31, label %for.cond4.i11.preheader.iter31, !dbg !313, !llvm.loop !380

for.inc17.i8.iter31:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter31
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_31_end

for.cond4.i11.preheader.iter31:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter31, %for.inc15.i14.iter31
  %c.0.i673.iter31 = phi i32 [ 31, %for.cond4.i11.preheader.lr.ph.iter31 ], [ %inc.i16.iter31, %for.inc15.i14.iter31 ]
  %bs_mat_entries_used.1.i72.iter31 = phi i32 [ %split.iter30, %for.cond4.i11.preheader.lr.ph.iter31 ], [ %add14.i15.iter31, %for.inc15.i14.iter31 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter31, !dbg !374

for.cond4.i11.preheader.lr.ph.iter31:             ; preds = %for.cond1.preheader.i4.iter31
  br label %for.cond4.i11.preheader.iter31, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter31:       ; preds = %for.inc15.i14.iter31
  %split.iter31 = phi i32 [ %add14.i15.iter31, %for.inc15.i14.iter31 ]
  br label %for.inc17.i8.iter31, !dbg !313

iter_31_end:                                      ; preds = %for.inc17.i8.iter31
  br label %iter_32_start

iter_32_start:                                    ; preds = %iter_31_end
  br label %for.cond1.preheader.i4.iter32

for.cond1.preheader.i4.iter32:                    ; preds = %iter_32_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %311 = add i32 %split.iter31, 46, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter32, !dbg !313

for.body6.i17.iter32:                             ; preds = %for.cond4.i11.preheader.iter32, %m_vec_mul_add.exit.iter32
  %k.0.i1270.iter32 = phi i32 [ 0, %for.cond4.i11.preheader.iter32 ], [ %add13.i.iter32, %m_vec_mul_add.exit.iter32 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter32 = mul nsw i32 %bs_mat_entries_used.1.i72.iter32, 40, !dbg !319
  %add.ptr.i19.iter32 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter32, !dbg !319
  %mul8.i20.iter32 = shl nuw nsw i32 %c.0.i673.iter32, 3, !dbg !322
  %312 = getelementptr i8, ptr %O, i32 %mul8.i20.iter32, !dbg !323
  %arrayidx.i21.iter32 = getelementptr i8, ptr %312, i32 %k.0.i1270.iter32, !dbg !323
  %313 = load i8, ptr %arrayidx.i21.iter32, align 1, !dbg !323
  %add10.i.iter32 = or disjoint i32 256, %k.0.i1270.iter32, !dbg !324
  %add.ptr12.idx.i.iter32 = mul nuw nsw i32 %add10.i.iter32, 40, !dbg !325
  %add.ptr12.i.iter32 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter32, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter32 = zext i8 %313 to i32, !dbg !330
  %mul.i.i.iter32 = mul i32 %conv.i.i.iter32, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter32 = and i32 %mul.i.i.iter32, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter32 = lshr exact i32 %and.i.i.iter32, 4, !dbg !333
  %shr1.i.i.iter32 = lshr exact i32 %and.i.i.iter32, 3, !dbg !334
  %314 = xor i32 %shr.i.i.iter32, %shr1.i.i.iter32, !dbg !335
  %xor2.i.i.iter32 = xor i32 %314, %mul.i.i.iter32, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter32, !dbg !337

for.body.i.iter32:                                ; preds = %for.body.i.iter32, %for.body6.i17.iter32
  %i.0.i69.iter32 = phi i32 [ 0, %for.body6.i17.iter32 ], [ %inc.i26.iter32, %for.body.i.iter32 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter32, i32 %i.0.i69.iter32, !dbg !338
  %315 = load i64, ptr %arrayidx.i24.iter32, align 8, !dbg !338
  %and.i.iter32 = and i64 %315, 1229782938247303441, !dbg !339
  %and1.i.iter32 = and i32 %xor2.i.i.iter32, 255, !dbg !340
  %conv.i.iter32 = zext nneg i32 %and1.i.iter32 to i64, !dbg !341
  %mul.i25.iter32 = mul i64 %and.i.iter32, %conv.i.iter32, !dbg !342
  %shr.i.iter32 = lshr i64 %315, 1, !dbg !343
  %and3.i.iter32 = and i64 %shr.i.iter32, 1229782938247303441, !dbg !344
  %shr4.i.iter32 = lshr i32 %xor2.i.i.iter32, 8, !dbg !345
  %and5.i.iter32 = and i32 %shr4.i.iter32, 15, !dbg !346
  %conv6.i.iter32 = zext nneg i32 %and5.i.iter32 to i64, !dbg !347
  %mul7.i.iter32 = mul nuw i64 %and3.i.iter32, %conv6.i.iter32, !dbg !348
  %xor.i.iter32 = xor i64 %mul.i25.iter32, %mul7.i.iter32, !dbg !349
  %arrayidx8.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter32, i32 %i.0.i69.iter32, !dbg !350
  %316 = load i64, ptr %arrayidx8.i.iter32, align 8, !dbg !350
  %shr9.i.iter32 = lshr i64 %316, 2, !dbg !351
  %and10.i.iter32 = and i64 %shr9.i.iter32, 1229782938247303441, !dbg !352
  %shr11.i.iter32 = lshr i32 %xor2.i.i.iter32, 16, !dbg !353
  %and12.i.iter32 = and i32 %shr11.i.iter32, 15, !dbg !354
  %conv13.i.iter32 = zext nneg i32 %and12.i.iter32 to i64, !dbg !355
  %mul14.i.iter32 = mul nuw i64 %and10.i.iter32, %conv13.i.iter32, !dbg !356
  %xor15.i.iter32 = xor i64 %xor.i.iter32, %mul14.i.iter32, !dbg !357
  %arrayidx16.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter32, i32 %i.0.i69.iter32, !dbg !358
  %317 = load i64, ptr %arrayidx16.i.iter32, align 8, !dbg !358
  %shr17.i.iter32 = lshr i64 %317, 3, !dbg !359
  %and18.i.iter32 = and i64 %shr17.i.iter32, 1229782938247303441, !dbg !360
  %shr19.i.iter32 = lshr i32 %xor2.i.i.iter32, 24, !dbg !361
  %and20.i.iter32 = and i32 %shr19.i.iter32, 15, !dbg !362
  %conv21.i.iter32 = zext nneg i32 %and20.i.iter32 to i64, !dbg !363
  %mul22.i.iter32 = mul nuw i64 %and18.i.iter32, %conv21.i.iter32, !dbg !364
  %xor23.i.iter32 = xor i64 %xor15.i.iter32, %mul22.i.iter32, !dbg !365
  %arrayidx24.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter32, i32 %i.0.i69.iter32, !dbg !366
  %318 = load i64, ptr %arrayidx24.i.iter32, align 8, !dbg !367
  %xor25.i.iter32 = xor i64 %318, %xor23.i.iter32, !dbg !367
  store i64 %xor25.i.iter32, ptr %arrayidx24.i.iter32, align 8, !dbg !367
  %inc.i26.iter32 = add nuw nsw i32 %i.0.i69.iter32, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter32 = icmp eq i32 %inc.i26.iter32, 5, !dbg !369
  br i1 %exitcond.i23.not.iter32, label %m_vec_mul_add.exit.iter32, label %for.body.i.iter32, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter32:                        ; preds = %for.body.i.iter32
  %add13.i.iter32 = add nuw nsw i32 %k.0.i1270.iter32, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter32 = icmp eq i32 %add13.i.iter32, 8, !dbg !373
  br i1 %exitcond.i13.not.iter32, label %for.inc15.i14.iter32, label %for.body6.i17.iter32, !dbg !374, !llvm.loop !375

for.inc15.i14.iter32:                             ; preds = %m_vec_mul_add.exit.iter32
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter32 = add i32 %bs_mat_entries_used.1.i72.iter32, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter32 = add nuw nsw i32 %c.0.i673.iter32, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter32 = icmp eq i32 %add14.i15.iter32, %311, !dbg !379
  br i1 %exitcond1.i7.not.iter32, label %for.cond1.i5.for.inc17.i8_crit_edge.iter32, label %for.cond4.i11.preheader.iter32, !dbg !313, !llvm.loop !380

for.inc17.i8.iter32:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter32
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_32_end

for.cond4.i11.preheader.iter32:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter32, %for.inc15.i14.iter32
  %c.0.i673.iter32 = phi i32 [ 32, %for.cond4.i11.preheader.lr.ph.iter32 ], [ %inc.i16.iter32, %for.inc15.i14.iter32 ]
  %bs_mat_entries_used.1.i72.iter32 = phi i32 [ %split.iter31, %for.cond4.i11.preheader.lr.ph.iter32 ], [ %add14.i15.iter32, %for.inc15.i14.iter32 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter32, !dbg !374

for.cond4.i11.preheader.lr.ph.iter32:             ; preds = %for.cond1.preheader.i4.iter32
  br label %for.cond4.i11.preheader.iter32, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter32:       ; preds = %for.inc15.i14.iter32
  %split.iter32 = phi i32 [ %add14.i15.iter32, %for.inc15.i14.iter32 ]
  br label %for.inc17.i8.iter32, !dbg !313

iter_32_end:                                      ; preds = %for.inc17.i8.iter32
  br label %iter_33_start

iter_33_start:                                    ; preds = %iter_32_end
  br label %for.cond1.preheader.i4.iter33

for.cond1.preheader.i4.iter33:                    ; preds = %iter_33_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %319 = add i32 %split.iter32, 45, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter33, !dbg !313

for.body6.i17.iter33:                             ; preds = %for.cond4.i11.preheader.iter33, %m_vec_mul_add.exit.iter33
  %k.0.i1270.iter33 = phi i32 [ 0, %for.cond4.i11.preheader.iter33 ], [ %add13.i.iter33, %m_vec_mul_add.exit.iter33 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter33 = mul nsw i32 %bs_mat_entries_used.1.i72.iter33, 40, !dbg !319
  %add.ptr.i19.iter33 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter33, !dbg !319
  %mul8.i20.iter33 = shl nuw nsw i32 %c.0.i673.iter33, 3, !dbg !322
  %320 = getelementptr i8, ptr %O, i32 %mul8.i20.iter33, !dbg !323
  %arrayidx.i21.iter33 = getelementptr i8, ptr %320, i32 %k.0.i1270.iter33, !dbg !323
  %321 = load i8, ptr %arrayidx.i21.iter33, align 1, !dbg !323
  %add10.i.iter33 = or disjoint i32 264, %k.0.i1270.iter33, !dbg !324
  %add.ptr12.idx.i.iter33 = mul nuw nsw i32 %add10.i.iter33, 40, !dbg !325
  %add.ptr12.i.iter33 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter33, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter33 = zext i8 %321 to i32, !dbg !330
  %mul.i.i.iter33 = mul i32 %conv.i.i.iter33, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter33 = and i32 %mul.i.i.iter33, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter33 = lshr exact i32 %and.i.i.iter33, 4, !dbg !333
  %shr1.i.i.iter33 = lshr exact i32 %and.i.i.iter33, 3, !dbg !334
  %322 = xor i32 %shr.i.i.iter33, %shr1.i.i.iter33, !dbg !335
  %xor2.i.i.iter33 = xor i32 %322, %mul.i.i.iter33, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter33, !dbg !337

for.body.i.iter33:                                ; preds = %for.body.i.iter33, %for.body6.i17.iter33
  %i.0.i69.iter33 = phi i32 [ 0, %for.body6.i17.iter33 ], [ %inc.i26.iter33, %for.body.i.iter33 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter33, i32 %i.0.i69.iter33, !dbg !338
  %323 = load i64, ptr %arrayidx.i24.iter33, align 8, !dbg !338
  %and.i.iter33 = and i64 %323, 1229782938247303441, !dbg !339
  %and1.i.iter33 = and i32 %xor2.i.i.iter33, 255, !dbg !340
  %conv.i.iter33 = zext nneg i32 %and1.i.iter33 to i64, !dbg !341
  %mul.i25.iter33 = mul i64 %and.i.iter33, %conv.i.iter33, !dbg !342
  %shr.i.iter33 = lshr i64 %323, 1, !dbg !343
  %and3.i.iter33 = and i64 %shr.i.iter33, 1229782938247303441, !dbg !344
  %shr4.i.iter33 = lshr i32 %xor2.i.i.iter33, 8, !dbg !345
  %and5.i.iter33 = and i32 %shr4.i.iter33, 15, !dbg !346
  %conv6.i.iter33 = zext nneg i32 %and5.i.iter33 to i64, !dbg !347
  %mul7.i.iter33 = mul nuw i64 %and3.i.iter33, %conv6.i.iter33, !dbg !348
  %xor.i.iter33 = xor i64 %mul.i25.iter33, %mul7.i.iter33, !dbg !349
  %arrayidx8.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter33, i32 %i.0.i69.iter33, !dbg !350
  %324 = load i64, ptr %arrayidx8.i.iter33, align 8, !dbg !350
  %shr9.i.iter33 = lshr i64 %324, 2, !dbg !351
  %and10.i.iter33 = and i64 %shr9.i.iter33, 1229782938247303441, !dbg !352
  %shr11.i.iter33 = lshr i32 %xor2.i.i.iter33, 16, !dbg !353
  %and12.i.iter33 = and i32 %shr11.i.iter33, 15, !dbg !354
  %conv13.i.iter33 = zext nneg i32 %and12.i.iter33 to i64, !dbg !355
  %mul14.i.iter33 = mul nuw i64 %and10.i.iter33, %conv13.i.iter33, !dbg !356
  %xor15.i.iter33 = xor i64 %xor.i.iter33, %mul14.i.iter33, !dbg !357
  %arrayidx16.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter33, i32 %i.0.i69.iter33, !dbg !358
  %325 = load i64, ptr %arrayidx16.i.iter33, align 8, !dbg !358
  %shr17.i.iter33 = lshr i64 %325, 3, !dbg !359
  %and18.i.iter33 = and i64 %shr17.i.iter33, 1229782938247303441, !dbg !360
  %shr19.i.iter33 = lshr i32 %xor2.i.i.iter33, 24, !dbg !361
  %and20.i.iter33 = and i32 %shr19.i.iter33, 15, !dbg !362
  %conv21.i.iter33 = zext nneg i32 %and20.i.iter33 to i64, !dbg !363
  %mul22.i.iter33 = mul nuw i64 %and18.i.iter33, %conv21.i.iter33, !dbg !364
  %xor23.i.iter33 = xor i64 %xor15.i.iter33, %mul22.i.iter33, !dbg !365
  %arrayidx24.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter33, i32 %i.0.i69.iter33, !dbg !366
  %326 = load i64, ptr %arrayidx24.i.iter33, align 8, !dbg !367
  %xor25.i.iter33 = xor i64 %326, %xor23.i.iter33, !dbg !367
  store i64 %xor25.i.iter33, ptr %arrayidx24.i.iter33, align 8, !dbg !367
  %inc.i26.iter33 = add nuw nsw i32 %i.0.i69.iter33, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter33 = icmp eq i32 %inc.i26.iter33, 5, !dbg !369
  br i1 %exitcond.i23.not.iter33, label %m_vec_mul_add.exit.iter33, label %for.body.i.iter33, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter33:                        ; preds = %for.body.i.iter33
  %add13.i.iter33 = add nuw nsw i32 %k.0.i1270.iter33, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter33 = icmp eq i32 %add13.i.iter33, 8, !dbg !373
  br i1 %exitcond.i13.not.iter33, label %for.inc15.i14.iter33, label %for.body6.i17.iter33, !dbg !374, !llvm.loop !375

for.inc15.i14.iter33:                             ; preds = %m_vec_mul_add.exit.iter33
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter33 = add i32 %bs_mat_entries_used.1.i72.iter33, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter33 = add nuw nsw i32 %c.0.i673.iter33, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter33 = icmp eq i32 %add14.i15.iter33, %319, !dbg !379
  br i1 %exitcond1.i7.not.iter33, label %for.cond1.i5.for.inc17.i8_crit_edge.iter33, label %for.cond4.i11.preheader.iter33, !dbg !313, !llvm.loop !380

for.inc17.i8.iter33:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter33
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_33_end

for.cond4.i11.preheader.iter33:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter33, %for.inc15.i14.iter33
  %c.0.i673.iter33 = phi i32 [ 33, %for.cond4.i11.preheader.lr.ph.iter33 ], [ %inc.i16.iter33, %for.inc15.i14.iter33 ]
  %bs_mat_entries_used.1.i72.iter33 = phi i32 [ %split.iter32, %for.cond4.i11.preheader.lr.ph.iter33 ], [ %add14.i15.iter33, %for.inc15.i14.iter33 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter33, !dbg !374

for.cond4.i11.preheader.lr.ph.iter33:             ; preds = %for.cond1.preheader.i4.iter33
  br label %for.cond4.i11.preheader.iter33, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter33:       ; preds = %for.inc15.i14.iter33
  %split.iter33 = phi i32 [ %add14.i15.iter33, %for.inc15.i14.iter33 ]
  br label %for.inc17.i8.iter33, !dbg !313

iter_33_end:                                      ; preds = %for.inc17.i8.iter33
  br label %iter_34_start

iter_34_start:                                    ; preds = %iter_33_end
  br label %for.cond1.preheader.i4.iter34

for.cond1.preheader.i4.iter34:                    ; preds = %iter_34_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %327 = add i32 %split.iter33, 44, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter34, !dbg !313

for.body6.i17.iter34:                             ; preds = %for.cond4.i11.preheader.iter34, %m_vec_mul_add.exit.iter34
  %k.0.i1270.iter34 = phi i32 [ 0, %for.cond4.i11.preheader.iter34 ], [ %add13.i.iter34, %m_vec_mul_add.exit.iter34 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter34 = mul nsw i32 %bs_mat_entries_used.1.i72.iter34, 40, !dbg !319
  %add.ptr.i19.iter34 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter34, !dbg !319
  %mul8.i20.iter34 = shl nuw nsw i32 %c.0.i673.iter34, 3, !dbg !322
  %328 = getelementptr i8, ptr %O, i32 %mul8.i20.iter34, !dbg !323
  %arrayidx.i21.iter34 = getelementptr i8, ptr %328, i32 %k.0.i1270.iter34, !dbg !323
  %329 = load i8, ptr %arrayidx.i21.iter34, align 1, !dbg !323
  %add10.i.iter34 = or disjoint i32 272, %k.0.i1270.iter34, !dbg !324
  %add.ptr12.idx.i.iter34 = mul nuw nsw i32 %add10.i.iter34, 40, !dbg !325
  %add.ptr12.i.iter34 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter34, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter34 = zext i8 %329 to i32, !dbg !330
  %mul.i.i.iter34 = mul i32 %conv.i.i.iter34, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter34 = and i32 %mul.i.i.iter34, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter34 = lshr exact i32 %and.i.i.iter34, 4, !dbg !333
  %shr1.i.i.iter34 = lshr exact i32 %and.i.i.iter34, 3, !dbg !334
  %330 = xor i32 %shr.i.i.iter34, %shr1.i.i.iter34, !dbg !335
  %xor2.i.i.iter34 = xor i32 %330, %mul.i.i.iter34, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter34, !dbg !337

for.body.i.iter34:                                ; preds = %for.body.i.iter34, %for.body6.i17.iter34
  %i.0.i69.iter34 = phi i32 [ 0, %for.body6.i17.iter34 ], [ %inc.i26.iter34, %for.body.i.iter34 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter34, i32 %i.0.i69.iter34, !dbg !338
  %331 = load i64, ptr %arrayidx.i24.iter34, align 8, !dbg !338
  %and.i.iter34 = and i64 %331, 1229782938247303441, !dbg !339
  %and1.i.iter34 = and i32 %xor2.i.i.iter34, 255, !dbg !340
  %conv.i.iter34 = zext nneg i32 %and1.i.iter34 to i64, !dbg !341
  %mul.i25.iter34 = mul i64 %and.i.iter34, %conv.i.iter34, !dbg !342
  %shr.i.iter34 = lshr i64 %331, 1, !dbg !343
  %and3.i.iter34 = and i64 %shr.i.iter34, 1229782938247303441, !dbg !344
  %shr4.i.iter34 = lshr i32 %xor2.i.i.iter34, 8, !dbg !345
  %and5.i.iter34 = and i32 %shr4.i.iter34, 15, !dbg !346
  %conv6.i.iter34 = zext nneg i32 %and5.i.iter34 to i64, !dbg !347
  %mul7.i.iter34 = mul nuw i64 %and3.i.iter34, %conv6.i.iter34, !dbg !348
  %xor.i.iter34 = xor i64 %mul.i25.iter34, %mul7.i.iter34, !dbg !349
  %arrayidx8.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter34, i32 %i.0.i69.iter34, !dbg !350
  %332 = load i64, ptr %arrayidx8.i.iter34, align 8, !dbg !350
  %shr9.i.iter34 = lshr i64 %332, 2, !dbg !351
  %and10.i.iter34 = and i64 %shr9.i.iter34, 1229782938247303441, !dbg !352
  %shr11.i.iter34 = lshr i32 %xor2.i.i.iter34, 16, !dbg !353
  %and12.i.iter34 = and i32 %shr11.i.iter34, 15, !dbg !354
  %conv13.i.iter34 = zext nneg i32 %and12.i.iter34 to i64, !dbg !355
  %mul14.i.iter34 = mul nuw i64 %and10.i.iter34, %conv13.i.iter34, !dbg !356
  %xor15.i.iter34 = xor i64 %xor.i.iter34, %mul14.i.iter34, !dbg !357
  %arrayidx16.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter34, i32 %i.0.i69.iter34, !dbg !358
  %333 = load i64, ptr %arrayidx16.i.iter34, align 8, !dbg !358
  %shr17.i.iter34 = lshr i64 %333, 3, !dbg !359
  %and18.i.iter34 = and i64 %shr17.i.iter34, 1229782938247303441, !dbg !360
  %shr19.i.iter34 = lshr i32 %xor2.i.i.iter34, 24, !dbg !361
  %and20.i.iter34 = and i32 %shr19.i.iter34, 15, !dbg !362
  %conv21.i.iter34 = zext nneg i32 %and20.i.iter34 to i64, !dbg !363
  %mul22.i.iter34 = mul nuw i64 %and18.i.iter34, %conv21.i.iter34, !dbg !364
  %xor23.i.iter34 = xor i64 %xor15.i.iter34, %mul22.i.iter34, !dbg !365
  %arrayidx24.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter34, i32 %i.0.i69.iter34, !dbg !366
  %334 = load i64, ptr %arrayidx24.i.iter34, align 8, !dbg !367
  %xor25.i.iter34 = xor i64 %334, %xor23.i.iter34, !dbg !367
  store i64 %xor25.i.iter34, ptr %arrayidx24.i.iter34, align 8, !dbg !367
  %inc.i26.iter34 = add nuw nsw i32 %i.0.i69.iter34, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter34 = icmp eq i32 %inc.i26.iter34, 5, !dbg !369
  br i1 %exitcond.i23.not.iter34, label %m_vec_mul_add.exit.iter34, label %for.body.i.iter34, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter34:                        ; preds = %for.body.i.iter34
  %add13.i.iter34 = add nuw nsw i32 %k.0.i1270.iter34, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter34 = icmp eq i32 %add13.i.iter34, 8, !dbg !373
  br i1 %exitcond.i13.not.iter34, label %for.inc15.i14.iter34, label %for.body6.i17.iter34, !dbg !374, !llvm.loop !375

for.inc15.i14.iter34:                             ; preds = %m_vec_mul_add.exit.iter34
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter34 = add i32 %bs_mat_entries_used.1.i72.iter34, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter34 = add nuw nsw i32 %c.0.i673.iter34, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter34 = icmp eq i32 %add14.i15.iter34, %327, !dbg !379
  br i1 %exitcond1.i7.not.iter34, label %for.cond1.i5.for.inc17.i8_crit_edge.iter34, label %for.cond4.i11.preheader.iter34, !dbg !313, !llvm.loop !380

for.inc17.i8.iter34:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter34
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_34_end

for.cond4.i11.preheader.iter34:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter34, %for.inc15.i14.iter34
  %c.0.i673.iter34 = phi i32 [ 34, %for.cond4.i11.preheader.lr.ph.iter34 ], [ %inc.i16.iter34, %for.inc15.i14.iter34 ]
  %bs_mat_entries_used.1.i72.iter34 = phi i32 [ %split.iter33, %for.cond4.i11.preheader.lr.ph.iter34 ], [ %add14.i15.iter34, %for.inc15.i14.iter34 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter34, !dbg !374

for.cond4.i11.preheader.lr.ph.iter34:             ; preds = %for.cond1.preheader.i4.iter34
  br label %for.cond4.i11.preheader.iter34, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter34:       ; preds = %for.inc15.i14.iter34
  %split.iter34 = phi i32 [ %add14.i15.iter34, %for.inc15.i14.iter34 ]
  br label %for.inc17.i8.iter34, !dbg !313

iter_34_end:                                      ; preds = %for.inc17.i8.iter34
  br label %iter_35_start

iter_35_start:                                    ; preds = %iter_34_end
  br label %for.cond1.preheader.i4.iter35

for.cond1.preheader.i4.iter35:                    ; preds = %iter_35_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %335 = add i32 %split.iter34, 43, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter35, !dbg !313

for.body6.i17.iter35:                             ; preds = %for.cond4.i11.preheader.iter35, %m_vec_mul_add.exit.iter35
  %k.0.i1270.iter35 = phi i32 [ 0, %for.cond4.i11.preheader.iter35 ], [ %add13.i.iter35, %m_vec_mul_add.exit.iter35 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter35 = mul nsw i32 %bs_mat_entries_used.1.i72.iter35, 40, !dbg !319
  %add.ptr.i19.iter35 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter35, !dbg !319
  %mul8.i20.iter35 = shl nuw nsw i32 %c.0.i673.iter35, 3, !dbg !322
  %336 = getelementptr i8, ptr %O, i32 %mul8.i20.iter35, !dbg !323
  %arrayidx.i21.iter35 = getelementptr i8, ptr %336, i32 %k.0.i1270.iter35, !dbg !323
  %337 = load i8, ptr %arrayidx.i21.iter35, align 1, !dbg !323
  %add10.i.iter35 = or disjoint i32 280, %k.0.i1270.iter35, !dbg !324
  %add.ptr12.idx.i.iter35 = mul nuw nsw i32 %add10.i.iter35, 40, !dbg !325
  %add.ptr12.i.iter35 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter35, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter35 = zext i8 %337 to i32, !dbg !330
  %mul.i.i.iter35 = mul i32 %conv.i.i.iter35, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter35 = and i32 %mul.i.i.iter35, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter35 = lshr exact i32 %and.i.i.iter35, 4, !dbg !333
  %shr1.i.i.iter35 = lshr exact i32 %and.i.i.iter35, 3, !dbg !334
  %338 = xor i32 %shr.i.i.iter35, %shr1.i.i.iter35, !dbg !335
  %xor2.i.i.iter35 = xor i32 %338, %mul.i.i.iter35, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter35, !dbg !337

for.body.i.iter35:                                ; preds = %for.body.i.iter35, %for.body6.i17.iter35
  %i.0.i69.iter35 = phi i32 [ 0, %for.body6.i17.iter35 ], [ %inc.i26.iter35, %for.body.i.iter35 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter35, i32 %i.0.i69.iter35, !dbg !338
  %339 = load i64, ptr %arrayidx.i24.iter35, align 8, !dbg !338
  %and.i.iter35 = and i64 %339, 1229782938247303441, !dbg !339
  %and1.i.iter35 = and i32 %xor2.i.i.iter35, 255, !dbg !340
  %conv.i.iter35 = zext nneg i32 %and1.i.iter35 to i64, !dbg !341
  %mul.i25.iter35 = mul i64 %and.i.iter35, %conv.i.iter35, !dbg !342
  %shr.i.iter35 = lshr i64 %339, 1, !dbg !343
  %and3.i.iter35 = and i64 %shr.i.iter35, 1229782938247303441, !dbg !344
  %shr4.i.iter35 = lshr i32 %xor2.i.i.iter35, 8, !dbg !345
  %and5.i.iter35 = and i32 %shr4.i.iter35, 15, !dbg !346
  %conv6.i.iter35 = zext nneg i32 %and5.i.iter35 to i64, !dbg !347
  %mul7.i.iter35 = mul nuw i64 %and3.i.iter35, %conv6.i.iter35, !dbg !348
  %xor.i.iter35 = xor i64 %mul.i25.iter35, %mul7.i.iter35, !dbg !349
  %arrayidx8.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter35, i32 %i.0.i69.iter35, !dbg !350
  %340 = load i64, ptr %arrayidx8.i.iter35, align 8, !dbg !350
  %shr9.i.iter35 = lshr i64 %340, 2, !dbg !351
  %and10.i.iter35 = and i64 %shr9.i.iter35, 1229782938247303441, !dbg !352
  %shr11.i.iter35 = lshr i32 %xor2.i.i.iter35, 16, !dbg !353
  %and12.i.iter35 = and i32 %shr11.i.iter35, 15, !dbg !354
  %conv13.i.iter35 = zext nneg i32 %and12.i.iter35 to i64, !dbg !355
  %mul14.i.iter35 = mul nuw i64 %and10.i.iter35, %conv13.i.iter35, !dbg !356
  %xor15.i.iter35 = xor i64 %xor.i.iter35, %mul14.i.iter35, !dbg !357
  %arrayidx16.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter35, i32 %i.0.i69.iter35, !dbg !358
  %341 = load i64, ptr %arrayidx16.i.iter35, align 8, !dbg !358
  %shr17.i.iter35 = lshr i64 %341, 3, !dbg !359
  %and18.i.iter35 = and i64 %shr17.i.iter35, 1229782938247303441, !dbg !360
  %shr19.i.iter35 = lshr i32 %xor2.i.i.iter35, 24, !dbg !361
  %and20.i.iter35 = and i32 %shr19.i.iter35, 15, !dbg !362
  %conv21.i.iter35 = zext nneg i32 %and20.i.iter35 to i64, !dbg !363
  %mul22.i.iter35 = mul nuw i64 %and18.i.iter35, %conv21.i.iter35, !dbg !364
  %xor23.i.iter35 = xor i64 %xor15.i.iter35, %mul22.i.iter35, !dbg !365
  %arrayidx24.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter35, i32 %i.0.i69.iter35, !dbg !366
  %342 = load i64, ptr %arrayidx24.i.iter35, align 8, !dbg !367
  %xor25.i.iter35 = xor i64 %342, %xor23.i.iter35, !dbg !367
  store i64 %xor25.i.iter35, ptr %arrayidx24.i.iter35, align 8, !dbg !367
  %inc.i26.iter35 = add nuw nsw i32 %i.0.i69.iter35, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter35 = icmp eq i32 %inc.i26.iter35, 5, !dbg !369
  br i1 %exitcond.i23.not.iter35, label %m_vec_mul_add.exit.iter35, label %for.body.i.iter35, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter35:                        ; preds = %for.body.i.iter35
  %add13.i.iter35 = add nuw nsw i32 %k.0.i1270.iter35, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter35 = icmp eq i32 %add13.i.iter35, 8, !dbg !373
  br i1 %exitcond.i13.not.iter35, label %for.inc15.i14.iter35, label %for.body6.i17.iter35, !dbg !374, !llvm.loop !375

for.inc15.i14.iter35:                             ; preds = %m_vec_mul_add.exit.iter35
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter35 = add i32 %bs_mat_entries_used.1.i72.iter35, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter35 = add nuw nsw i32 %c.0.i673.iter35, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter35 = icmp eq i32 %add14.i15.iter35, %335, !dbg !379
  br i1 %exitcond1.i7.not.iter35, label %for.cond1.i5.for.inc17.i8_crit_edge.iter35, label %for.cond4.i11.preheader.iter35, !dbg !313, !llvm.loop !380

for.inc17.i8.iter35:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter35
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_35_end

for.cond4.i11.preheader.iter35:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter35, %for.inc15.i14.iter35
  %c.0.i673.iter35 = phi i32 [ 35, %for.cond4.i11.preheader.lr.ph.iter35 ], [ %inc.i16.iter35, %for.inc15.i14.iter35 ]
  %bs_mat_entries_used.1.i72.iter35 = phi i32 [ %split.iter34, %for.cond4.i11.preheader.lr.ph.iter35 ], [ %add14.i15.iter35, %for.inc15.i14.iter35 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter35, !dbg !374

for.cond4.i11.preheader.lr.ph.iter35:             ; preds = %for.cond1.preheader.i4.iter35
  br label %for.cond4.i11.preheader.iter35, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter35:       ; preds = %for.inc15.i14.iter35
  %split.iter35 = phi i32 [ %add14.i15.iter35, %for.inc15.i14.iter35 ]
  br label %for.inc17.i8.iter35, !dbg !313

iter_35_end:                                      ; preds = %for.inc17.i8.iter35
  br label %iter_36_start

iter_36_start:                                    ; preds = %iter_35_end
  br label %for.cond1.preheader.i4.iter36

for.cond1.preheader.i4.iter36:                    ; preds = %iter_36_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %343 = add i32 %split.iter35, 42, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter36, !dbg !313

for.body6.i17.iter36:                             ; preds = %for.cond4.i11.preheader.iter36, %m_vec_mul_add.exit.iter36
  %k.0.i1270.iter36 = phi i32 [ 0, %for.cond4.i11.preheader.iter36 ], [ %add13.i.iter36, %m_vec_mul_add.exit.iter36 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter36 = mul nsw i32 %bs_mat_entries_used.1.i72.iter36, 40, !dbg !319
  %add.ptr.i19.iter36 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter36, !dbg !319
  %mul8.i20.iter36 = shl nuw nsw i32 %c.0.i673.iter36, 3, !dbg !322
  %344 = getelementptr i8, ptr %O, i32 %mul8.i20.iter36, !dbg !323
  %arrayidx.i21.iter36 = getelementptr i8, ptr %344, i32 %k.0.i1270.iter36, !dbg !323
  %345 = load i8, ptr %arrayidx.i21.iter36, align 1, !dbg !323
  %add10.i.iter36 = or disjoint i32 288, %k.0.i1270.iter36, !dbg !324
  %add.ptr12.idx.i.iter36 = mul nuw nsw i32 %add10.i.iter36, 40, !dbg !325
  %add.ptr12.i.iter36 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter36, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter36 = zext i8 %345 to i32, !dbg !330
  %mul.i.i.iter36 = mul i32 %conv.i.i.iter36, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter36 = and i32 %mul.i.i.iter36, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter36 = lshr exact i32 %and.i.i.iter36, 4, !dbg !333
  %shr1.i.i.iter36 = lshr exact i32 %and.i.i.iter36, 3, !dbg !334
  %346 = xor i32 %shr.i.i.iter36, %shr1.i.i.iter36, !dbg !335
  %xor2.i.i.iter36 = xor i32 %346, %mul.i.i.iter36, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter36, !dbg !337

for.body.i.iter36:                                ; preds = %for.body.i.iter36, %for.body6.i17.iter36
  %i.0.i69.iter36 = phi i32 [ 0, %for.body6.i17.iter36 ], [ %inc.i26.iter36, %for.body.i.iter36 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter36, i32 %i.0.i69.iter36, !dbg !338
  %347 = load i64, ptr %arrayidx.i24.iter36, align 8, !dbg !338
  %and.i.iter36 = and i64 %347, 1229782938247303441, !dbg !339
  %and1.i.iter36 = and i32 %xor2.i.i.iter36, 255, !dbg !340
  %conv.i.iter36 = zext nneg i32 %and1.i.iter36 to i64, !dbg !341
  %mul.i25.iter36 = mul i64 %and.i.iter36, %conv.i.iter36, !dbg !342
  %shr.i.iter36 = lshr i64 %347, 1, !dbg !343
  %and3.i.iter36 = and i64 %shr.i.iter36, 1229782938247303441, !dbg !344
  %shr4.i.iter36 = lshr i32 %xor2.i.i.iter36, 8, !dbg !345
  %and5.i.iter36 = and i32 %shr4.i.iter36, 15, !dbg !346
  %conv6.i.iter36 = zext nneg i32 %and5.i.iter36 to i64, !dbg !347
  %mul7.i.iter36 = mul nuw i64 %and3.i.iter36, %conv6.i.iter36, !dbg !348
  %xor.i.iter36 = xor i64 %mul.i25.iter36, %mul7.i.iter36, !dbg !349
  %arrayidx8.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter36, i32 %i.0.i69.iter36, !dbg !350
  %348 = load i64, ptr %arrayidx8.i.iter36, align 8, !dbg !350
  %shr9.i.iter36 = lshr i64 %348, 2, !dbg !351
  %and10.i.iter36 = and i64 %shr9.i.iter36, 1229782938247303441, !dbg !352
  %shr11.i.iter36 = lshr i32 %xor2.i.i.iter36, 16, !dbg !353
  %and12.i.iter36 = and i32 %shr11.i.iter36, 15, !dbg !354
  %conv13.i.iter36 = zext nneg i32 %and12.i.iter36 to i64, !dbg !355
  %mul14.i.iter36 = mul nuw i64 %and10.i.iter36, %conv13.i.iter36, !dbg !356
  %xor15.i.iter36 = xor i64 %xor.i.iter36, %mul14.i.iter36, !dbg !357
  %arrayidx16.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter36, i32 %i.0.i69.iter36, !dbg !358
  %349 = load i64, ptr %arrayidx16.i.iter36, align 8, !dbg !358
  %shr17.i.iter36 = lshr i64 %349, 3, !dbg !359
  %and18.i.iter36 = and i64 %shr17.i.iter36, 1229782938247303441, !dbg !360
  %shr19.i.iter36 = lshr i32 %xor2.i.i.iter36, 24, !dbg !361
  %and20.i.iter36 = and i32 %shr19.i.iter36, 15, !dbg !362
  %conv21.i.iter36 = zext nneg i32 %and20.i.iter36 to i64, !dbg !363
  %mul22.i.iter36 = mul nuw i64 %and18.i.iter36, %conv21.i.iter36, !dbg !364
  %xor23.i.iter36 = xor i64 %xor15.i.iter36, %mul22.i.iter36, !dbg !365
  %arrayidx24.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter36, i32 %i.0.i69.iter36, !dbg !366
  %350 = load i64, ptr %arrayidx24.i.iter36, align 8, !dbg !367
  %xor25.i.iter36 = xor i64 %350, %xor23.i.iter36, !dbg !367
  store i64 %xor25.i.iter36, ptr %arrayidx24.i.iter36, align 8, !dbg !367
  %inc.i26.iter36 = add nuw nsw i32 %i.0.i69.iter36, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter36 = icmp eq i32 %inc.i26.iter36, 5, !dbg !369
  br i1 %exitcond.i23.not.iter36, label %m_vec_mul_add.exit.iter36, label %for.body.i.iter36, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter36:                        ; preds = %for.body.i.iter36
  %add13.i.iter36 = add nuw nsw i32 %k.0.i1270.iter36, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter36 = icmp eq i32 %add13.i.iter36, 8, !dbg !373
  br i1 %exitcond.i13.not.iter36, label %for.inc15.i14.iter36, label %for.body6.i17.iter36, !dbg !374, !llvm.loop !375

for.inc15.i14.iter36:                             ; preds = %m_vec_mul_add.exit.iter36
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter36 = add i32 %bs_mat_entries_used.1.i72.iter36, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter36 = add nuw nsw i32 %c.0.i673.iter36, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter36 = icmp eq i32 %add14.i15.iter36, %343, !dbg !379
  br i1 %exitcond1.i7.not.iter36, label %for.cond1.i5.for.inc17.i8_crit_edge.iter36, label %for.cond4.i11.preheader.iter36, !dbg !313, !llvm.loop !380

for.inc17.i8.iter36:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter36
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_36_end

for.cond4.i11.preheader.iter36:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter36, %for.inc15.i14.iter36
  %c.0.i673.iter36 = phi i32 [ 36, %for.cond4.i11.preheader.lr.ph.iter36 ], [ %inc.i16.iter36, %for.inc15.i14.iter36 ]
  %bs_mat_entries_used.1.i72.iter36 = phi i32 [ %split.iter35, %for.cond4.i11.preheader.lr.ph.iter36 ], [ %add14.i15.iter36, %for.inc15.i14.iter36 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter36, !dbg !374

for.cond4.i11.preheader.lr.ph.iter36:             ; preds = %for.cond1.preheader.i4.iter36
  br label %for.cond4.i11.preheader.iter36, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter36:       ; preds = %for.inc15.i14.iter36
  %split.iter36 = phi i32 [ %add14.i15.iter36, %for.inc15.i14.iter36 ]
  br label %for.inc17.i8.iter36, !dbg !313

iter_36_end:                                      ; preds = %for.inc17.i8.iter36
  br label %iter_37_start

iter_37_start:                                    ; preds = %iter_36_end
  br label %for.cond1.preheader.i4.iter37

for.cond1.preheader.i4.iter37:                    ; preds = %iter_37_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %351 = add i32 %split.iter36, 41, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter37, !dbg !313

for.body6.i17.iter37:                             ; preds = %for.cond4.i11.preheader.iter37, %m_vec_mul_add.exit.iter37
  %k.0.i1270.iter37 = phi i32 [ 0, %for.cond4.i11.preheader.iter37 ], [ %add13.i.iter37, %m_vec_mul_add.exit.iter37 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter37 = mul nsw i32 %bs_mat_entries_used.1.i72.iter37, 40, !dbg !319
  %add.ptr.i19.iter37 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter37, !dbg !319
  %mul8.i20.iter37 = shl nuw nsw i32 %c.0.i673.iter37, 3, !dbg !322
  %352 = getelementptr i8, ptr %O, i32 %mul8.i20.iter37, !dbg !323
  %arrayidx.i21.iter37 = getelementptr i8, ptr %352, i32 %k.0.i1270.iter37, !dbg !323
  %353 = load i8, ptr %arrayidx.i21.iter37, align 1, !dbg !323
  %add10.i.iter37 = or disjoint i32 296, %k.0.i1270.iter37, !dbg !324
  %add.ptr12.idx.i.iter37 = mul nuw nsw i32 %add10.i.iter37, 40, !dbg !325
  %add.ptr12.i.iter37 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter37, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter37 = zext i8 %353 to i32, !dbg !330
  %mul.i.i.iter37 = mul i32 %conv.i.i.iter37, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter37 = and i32 %mul.i.i.iter37, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter37 = lshr exact i32 %and.i.i.iter37, 4, !dbg !333
  %shr1.i.i.iter37 = lshr exact i32 %and.i.i.iter37, 3, !dbg !334
  %354 = xor i32 %shr.i.i.iter37, %shr1.i.i.iter37, !dbg !335
  %xor2.i.i.iter37 = xor i32 %354, %mul.i.i.iter37, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter37, !dbg !337

for.body.i.iter37:                                ; preds = %for.body.i.iter37, %for.body6.i17.iter37
  %i.0.i69.iter37 = phi i32 [ 0, %for.body6.i17.iter37 ], [ %inc.i26.iter37, %for.body.i.iter37 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter37, i32 %i.0.i69.iter37, !dbg !338
  %355 = load i64, ptr %arrayidx.i24.iter37, align 8, !dbg !338
  %and.i.iter37 = and i64 %355, 1229782938247303441, !dbg !339
  %and1.i.iter37 = and i32 %xor2.i.i.iter37, 255, !dbg !340
  %conv.i.iter37 = zext nneg i32 %and1.i.iter37 to i64, !dbg !341
  %mul.i25.iter37 = mul i64 %and.i.iter37, %conv.i.iter37, !dbg !342
  %shr.i.iter37 = lshr i64 %355, 1, !dbg !343
  %and3.i.iter37 = and i64 %shr.i.iter37, 1229782938247303441, !dbg !344
  %shr4.i.iter37 = lshr i32 %xor2.i.i.iter37, 8, !dbg !345
  %and5.i.iter37 = and i32 %shr4.i.iter37, 15, !dbg !346
  %conv6.i.iter37 = zext nneg i32 %and5.i.iter37 to i64, !dbg !347
  %mul7.i.iter37 = mul nuw i64 %and3.i.iter37, %conv6.i.iter37, !dbg !348
  %xor.i.iter37 = xor i64 %mul.i25.iter37, %mul7.i.iter37, !dbg !349
  %arrayidx8.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter37, i32 %i.0.i69.iter37, !dbg !350
  %356 = load i64, ptr %arrayidx8.i.iter37, align 8, !dbg !350
  %shr9.i.iter37 = lshr i64 %356, 2, !dbg !351
  %and10.i.iter37 = and i64 %shr9.i.iter37, 1229782938247303441, !dbg !352
  %shr11.i.iter37 = lshr i32 %xor2.i.i.iter37, 16, !dbg !353
  %and12.i.iter37 = and i32 %shr11.i.iter37, 15, !dbg !354
  %conv13.i.iter37 = zext nneg i32 %and12.i.iter37 to i64, !dbg !355
  %mul14.i.iter37 = mul nuw i64 %and10.i.iter37, %conv13.i.iter37, !dbg !356
  %xor15.i.iter37 = xor i64 %xor.i.iter37, %mul14.i.iter37, !dbg !357
  %arrayidx16.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter37, i32 %i.0.i69.iter37, !dbg !358
  %357 = load i64, ptr %arrayidx16.i.iter37, align 8, !dbg !358
  %shr17.i.iter37 = lshr i64 %357, 3, !dbg !359
  %and18.i.iter37 = and i64 %shr17.i.iter37, 1229782938247303441, !dbg !360
  %shr19.i.iter37 = lshr i32 %xor2.i.i.iter37, 24, !dbg !361
  %and20.i.iter37 = and i32 %shr19.i.iter37, 15, !dbg !362
  %conv21.i.iter37 = zext nneg i32 %and20.i.iter37 to i64, !dbg !363
  %mul22.i.iter37 = mul nuw i64 %and18.i.iter37, %conv21.i.iter37, !dbg !364
  %xor23.i.iter37 = xor i64 %xor15.i.iter37, %mul22.i.iter37, !dbg !365
  %arrayidx24.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter37, i32 %i.0.i69.iter37, !dbg !366
  %358 = load i64, ptr %arrayidx24.i.iter37, align 8, !dbg !367
  %xor25.i.iter37 = xor i64 %358, %xor23.i.iter37, !dbg !367
  store i64 %xor25.i.iter37, ptr %arrayidx24.i.iter37, align 8, !dbg !367
  %inc.i26.iter37 = add nuw nsw i32 %i.0.i69.iter37, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter37 = icmp eq i32 %inc.i26.iter37, 5, !dbg !369
  br i1 %exitcond.i23.not.iter37, label %m_vec_mul_add.exit.iter37, label %for.body.i.iter37, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter37:                        ; preds = %for.body.i.iter37
  %add13.i.iter37 = add nuw nsw i32 %k.0.i1270.iter37, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter37 = icmp eq i32 %add13.i.iter37, 8, !dbg !373
  br i1 %exitcond.i13.not.iter37, label %for.inc15.i14.iter37, label %for.body6.i17.iter37, !dbg !374, !llvm.loop !375

for.inc15.i14.iter37:                             ; preds = %m_vec_mul_add.exit.iter37
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter37 = add i32 %bs_mat_entries_used.1.i72.iter37, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter37 = add nuw nsw i32 %c.0.i673.iter37, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter37 = icmp eq i32 %add14.i15.iter37, %351, !dbg !379
  br i1 %exitcond1.i7.not.iter37, label %for.cond1.i5.for.inc17.i8_crit_edge.iter37, label %for.cond4.i11.preheader.iter37, !dbg !313, !llvm.loop !380

for.inc17.i8.iter37:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter37
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_37_end

for.cond4.i11.preheader.iter37:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter37, %for.inc15.i14.iter37
  %c.0.i673.iter37 = phi i32 [ 37, %for.cond4.i11.preheader.lr.ph.iter37 ], [ %inc.i16.iter37, %for.inc15.i14.iter37 ]
  %bs_mat_entries_used.1.i72.iter37 = phi i32 [ %split.iter36, %for.cond4.i11.preheader.lr.ph.iter37 ], [ %add14.i15.iter37, %for.inc15.i14.iter37 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter37, !dbg !374

for.cond4.i11.preheader.lr.ph.iter37:             ; preds = %for.cond1.preheader.i4.iter37
  br label %for.cond4.i11.preheader.iter37, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter37:       ; preds = %for.inc15.i14.iter37
  %split.iter37 = phi i32 [ %add14.i15.iter37, %for.inc15.i14.iter37 ]
  br label %for.inc17.i8.iter37, !dbg !313

iter_37_end:                                      ; preds = %for.inc17.i8.iter37
  br label %iter_38_start

iter_38_start:                                    ; preds = %iter_37_end
  br label %for.cond1.preheader.i4.iter38

for.cond1.preheader.i4.iter38:                    ; preds = %iter_38_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %359 = add i32 %split.iter37, 40, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter38, !dbg !313

for.body6.i17.iter38:                             ; preds = %for.cond4.i11.preheader.iter38, %m_vec_mul_add.exit.iter38
  %k.0.i1270.iter38 = phi i32 [ 0, %for.cond4.i11.preheader.iter38 ], [ %add13.i.iter38, %m_vec_mul_add.exit.iter38 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter38 = mul nsw i32 %bs_mat_entries_used.1.i72.iter38, 40, !dbg !319
  %add.ptr.i19.iter38 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter38, !dbg !319
  %mul8.i20.iter38 = shl nuw nsw i32 %c.0.i673.iter38, 3, !dbg !322
  %360 = getelementptr i8, ptr %O, i32 %mul8.i20.iter38, !dbg !323
  %arrayidx.i21.iter38 = getelementptr i8, ptr %360, i32 %k.0.i1270.iter38, !dbg !323
  %361 = load i8, ptr %arrayidx.i21.iter38, align 1, !dbg !323
  %add10.i.iter38 = or disjoint i32 304, %k.0.i1270.iter38, !dbg !324
  %add.ptr12.idx.i.iter38 = mul nuw nsw i32 %add10.i.iter38, 40, !dbg !325
  %add.ptr12.i.iter38 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter38, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter38 = zext i8 %361 to i32, !dbg !330
  %mul.i.i.iter38 = mul i32 %conv.i.i.iter38, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter38 = and i32 %mul.i.i.iter38, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter38 = lshr exact i32 %and.i.i.iter38, 4, !dbg !333
  %shr1.i.i.iter38 = lshr exact i32 %and.i.i.iter38, 3, !dbg !334
  %362 = xor i32 %shr.i.i.iter38, %shr1.i.i.iter38, !dbg !335
  %xor2.i.i.iter38 = xor i32 %362, %mul.i.i.iter38, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter38, !dbg !337

for.body.i.iter38:                                ; preds = %for.body.i.iter38, %for.body6.i17.iter38
  %i.0.i69.iter38 = phi i32 [ 0, %for.body6.i17.iter38 ], [ %inc.i26.iter38, %for.body.i.iter38 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter38, i32 %i.0.i69.iter38, !dbg !338
  %363 = load i64, ptr %arrayidx.i24.iter38, align 8, !dbg !338
  %and.i.iter38 = and i64 %363, 1229782938247303441, !dbg !339
  %and1.i.iter38 = and i32 %xor2.i.i.iter38, 255, !dbg !340
  %conv.i.iter38 = zext nneg i32 %and1.i.iter38 to i64, !dbg !341
  %mul.i25.iter38 = mul i64 %and.i.iter38, %conv.i.iter38, !dbg !342
  %shr.i.iter38 = lshr i64 %363, 1, !dbg !343
  %and3.i.iter38 = and i64 %shr.i.iter38, 1229782938247303441, !dbg !344
  %shr4.i.iter38 = lshr i32 %xor2.i.i.iter38, 8, !dbg !345
  %and5.i.iter38 = and i32 %shr4.i.iter38, 15, !dbg !346
  %conv6.i.iter38 = zext nneg i32 %and5.i.iter38 to i64, !dbg !347
  %mul7.i.iter38 = mul nuw i64 %and3.i.iter38, %conv6.i.iter38, !dbg !348
  %xor.i.iter38 = xor i64 %mul.i25.iter38, %mul7.i.iter38, !dbg !349
  %arrayidx8.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter38, i32 %i.0.i69.iter38, !dbg !350
  %364 = load i64, ptr %arrayidx8.i.iter38, align 8, !dbg !350
  %shr9.i.iter38 = lshr i64 %364, 2, !dbg !351
  %and10.i.iter38 = and i64 %shr9.i.iter38, 1229782938247303441, !dbg !352
  %shr11.i.iter38 = lshr i32 %xor2.i.i.iter38, 16, !dbg !353
  %and12.i.iter38 = and i32 %shr11.i.iter38, 15, !dbg !354
  %conv13.i.iter38 = zext nneg i32 %and12.i.iter38 to i64, !dbg !355
  %mul14.i.iter38 = mul nuw i64 %and10.i.iter38, %conv13.i.iter38, !dbg !356
  %xor15.i.iter38 = xor i64 %xor.i.iter38, %mul14.i.iter38, !dbg !357
  %arrayidx16.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter38, i32 %i.0.i69.iter38, !dbg !358
  %365 = load i64, ptr %arrayidx16.i.iter38, align 8, !dbg !358
  %shr17.i.iter38 = lshr i64 %365, 3, !dbg !359
  %and18.i.iter38 = and i64 %shr17.i.iter38, 1229782938247303441, !dbg !360
  %shr19.i.iter38 = lshr i32 %xor2.i.i.iter38, 24, !dbg !361
  %and20.i.iter38 = and i32 %shr19.i.iter38, 15, !dbg !362
  %conv21.i.iter38 = zext nneg i32 %and20.i.iter38 to i64, !dbg !363
  %mul22.i.iter38 = mul nuw i64 %and18.i.iter38, %conv21.i.iter38, !dbg !364
  %xor23.i.iter38 = xor i64 %xor15.i.iter38, %mul22.i.iter38, !dbg !365
  %arrayidx24.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter38, i32 %i.0.i69.iter38, !dbg !366
  %366 = load i64, ptr %arrayidx24.i.iter38, align 8, !dbg !367
  %xor25.i.iter38 = xor i64 %366, %xor23.i.iter38, !dbg !367
  store i64 %xor25.i.iter38, ptr %arrayidx24.i.iter38, align 8, !dbg !367
  %inc.i26.iter38 = add nuw nsw i32 %i.0.i69.iter38, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter38 = icmp eq i32 %inc.i26.iter38, 5, !dbg !369
  br i1 %exitcond.i23.not.iter38, label %m_vec_mul_add.exit.iter38, label %for.body.i.iter38, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter38:                        ; preds = %for.body.i.iter38
  %add13.i.iter38 = add nuw nsw i32 %k.0.i1270.iter38, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter38 = icmp eq i32 %add13.i.iter38, 8, !dbg !373
  br i1 %exitcond.i13.not.iter38, label %for.inc15.i14.iter38, label %for.body6.i17.iter38, !dbg !374, !llvm.loop !375

for.inc15.i14.iter38:                             ; preds = %m_vec_mul_add.exit.iter38
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter38 = add i32 %bs_mat_entries_used.1.i72.iter38, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter38 = add nuw nsw i32 %c.0.i673.iter38, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter38 = icmp eq i32 %add14.i15.iter38, %359, !dbg !379
  br i1 %exitcond1.i7.not.iter38, label %for.cond1.i5.for.inc17.i8_crit_edge.iter38, label %for.cond4.i11.preheader.iter38, !dbg !313, !llvm.loop !380

for.inc17.i8.iter38:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter38
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_38_end

for.cond4.i11.preheader.iter38:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter38, %for.inc15.i14.iter38
  %c.0.i673.iter38 = phi i32 [ 38, %for.cond4.i11.preheader.lr.ph.iter38 ], [ %inc.i16.iter38, %for.inc15.i14.iter38 ]
  %bs_mat_entries_used.1.i72.iter38 = phi i32 [ %split.iter37, %for.cond4.i11.preheader.lr.ph.iter38 ], [ %add14.i15.iter38, %for.inc15.i14.iter38 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter38, !dbg !374

for.cond4.i11.preheader.lr.ph.iter38:             ; preds = %for.cond1.preheader.i4.iter38
  br label %for.cond4.i11.preheader.iter38, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter38:       ; preds = %for.inc15.i14.iter38
  %split.iter38 = phi i32 [ %add14.i15.iter38, %for.inc15.i14.iter38 ]
  br label %for.inc17.i8.iter38, !dbg !313

iter_38_end:                                      ; preds = %for.inc17.i8.iter38
  br label %iter_39_start

iter_39_start:                                    ; preds = %iter_38_end
  br label %for.cond1.preheader.i4.iter39

for.cond1.preheader.i4.iter39:                    ; preds = %iter_39_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %367 = add i32 %split.iter38, 39, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter39, !dbg !313

for.body6.i17.iter39:                             ; preds = %for.cond4.i11.preheader.iter39, %m_vec_mul_add.exit.iter39
  %k.0.i1270.iter39 = phi i32 [ 0, %for.cond4.i11.preheader.iter39 ], [ %add13.i.iter39, %m_vec_mul_add.exit.iter39 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter39 = mul nsw i32 %bs_mat_entries_used.1.i72.iter39, 40, !dbg !319
  %add.ptr.i19.iter39 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter39, !dbg !319
  %mul8.i20.iter39 = shl nuw nsw i32 %c.0.i673.iter39, 3, !dbg !322
  %368 = getelementptr i8, ptr %O, i32 %mul8.i20.iter39, !dbg !323
  %arrayidx.i21.iter39 = getelementptr i8, ptr %368, i32 %k.0.i1270.iter39, !dbg !323
  %369 = load i8, ptr %arrayidx.i21.iter39, align 1, !dbg !323
  %add10.i.iter39 = or disjoint i32 312, %k.0.i1270.iter39, !dbg !324
  %add.ptr12.idx.i.iter39 = mul nuw nsw i32 %add10.i.iter39, 40, !dbg !325
  %add.ptr12.i.iter39 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter39, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter39 = zext i8 %369 to i32, !dbg !330
  %mul.i.i.iter39 = mul i32 %conv.i.i.iter39, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter39 = and i32 %mul.i.i.iter39, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter39 = lshr exact i32 %and.i.i.iter39, 4, !dbg !333
  %shr1.i.i.iter39 = lshr exact i32 %and.i.i.iter39, 3, !dbg !334
  %370 = xor i32 %shr.i.i.iter39, %shr1.i.i.iter39, !dbg !335
  %xor2.i.i.iter39 = xor i32 %370, %mul.i.i.iter39, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter39, !dbg !337

for.body.i.iter39:                                ; preds = %for.body.i.iter39, %for.body6.i17.iter39
  %i.0.i69.iter39 = phi i32 [ 0, %for.body6.i17.iter39 ], [ %inc.i26.iter39, %for.body.i.iter39 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter39, i32 %i.0.i69.iter39, !dbg !338
  %371 = load i64, ptr %arrayidx.i24.iter39, align 8, !dbg !338
  %and.i.iter39 = and i64 %371, 1229782938247303441, !dbg !339
  %and1.i.iter39 = and i32 %xor2.i.i.iter39, 255, !dbg !340
  %conv.i.iter39 = zext nneg i32 %and1.i.iter39 to i64, !dbg !341
  %mul.i25.iter39 = mul i64 %and.i.iter39, %conv.i.iter39, !dbg !342
  %shr.i.iter39 = lshr i64 %371, 1, !dbg !343
  %and3.i.iter39 = and i64 %shr.i.iter39, 1229782938247303441, !dbg !344
  %shr4.i.iter39 = lshr i32 %xor2.i.i.iter39, 8, !dbg !345
  %and5.i.iter39 = and i32 %shr4.i.iter39, 15, !dbg !346
  %conv6.i.iter39 = zext nneg i32 %and5.i.iter39 to i64, !dbg !347
  %mul7.i.iter39 = mul nuw i64 %and3.i.iter39, %conv6.i.iter39, !dbg !348
  %xor.i.iter39 = xor i64 %mul.i25.iter39, %mul7.i.iter39, !dbg !349
  %arrayidx8.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter39, i32 %i.0.i69.iter39, !dbg !350
  %372 = load i64, ptr %arrayidx8.i.iter39, align 8, !dbg !350
  %shr9.i.iter39 = lshr i64 %372, 2, !dbg !351
  %and10.i.iter39 = and i64 %shr9.i.iter39, 1229782938247303441, !dbg !352
  %shr11.i.iter39 = lshr i32 %xor2.i.i.iter39, 16, !dbg !353
  %and12.i.iter39 = and i32 %shr11.i.iter39, 15, !dbg !354
  %conv13.i.iter39 = zext nneg i32 %and12.i.iter39 to i64, !dbg !355
  %mul14.i.iter39 = mul nuw i64 %and10.i.iter39, %conv13.i.iter39, !dbg !356
  %xor15.i.iter39 = xor i64 %xor.i.iter39, %mul14.i.iter39, !dbg !357
  %arrayidx16.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter39, i32 %i.0.i69.iter39, !dbg !358
  %373 = load i64, ptr %arrayidx16.i.iter39, align 8, !dbg !358
  %shr17.i.iter39 = lshr i64 %373, 3, !dbg !359
  %and18.i.iter39 = and i64 %shr17.i.iter39, 1229782938247303441, !dbg !360
  %shr19.i.iter39 = lshr i32 %xor2.i.i.iter39, 24, !dbg !361
  %and20.i.iter39 = and i32 %shr19.i.iter39, 15, !dbg !362
  %conv21.i.iter39 = zext nneg i32 %and20.i.iter39 to i64, !dbg !363
  %mul22.i.iter39 = mul nuw i64 %and18.i.iter39, %conv21.i.iter39, !dbg !364
  %xor23.i.iter39 = xor i64 %xor15.i.iter39, %mul22.i.iter39, !dbg !365
  %arrayidx24.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter39, i32 %i.0.i69.iter39, !dbg !366
  %374 = load i64, ptr %arrayidx24.i.iter39, align 8, !dbg !367
  %xor25.i.iter39 = xor i64 %374, %xor23.i.iter39, !dbg !367
  store i64 %xor25.i.iter39, ptr %arrayidx24.i.iter39, align 8, !dbg !367
  %inc.i26.iter39 = add nuw nsw i32 %i.0.i69.iter39, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter39 = icmp eq i32 %inc.i26.iter39, 5, !dbg !369
  br i1 %exitcond.i23.not.iter39, label %m_vec_mul_add.exit.iter39, label %for.body.i.iter39, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter39:                        ; preds = %for.body.i.iter39
  %add13.i.iter39 = add nuw nsw i32 %k.0.i1270.iter39, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter39 = icmp eq i32 %add13.i.iter39, 8, !dbg !373
  br i1 %exitcond.i13.not.iter39, label %for.inc15.i14.iter39, label %for.body6.i17.iter39, !dbg !374, !llvm.loop !375

for.inc15.i14.iter39:                             ; preds = %m_vec_mul_add.exit.iter39
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter39 = add i32 %bs_mat_entries_used.1.i72.iter39, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter39 = add nuw nsw i32 %c.0.i673.iter39, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter39 = icmp eq i32 %add14.i15.iter39, %367, !dbg !379
  br i1 %exitcond1.i7.not.iter39, label %for.cond1.i5.for.inc17.i8_crit_edge.iter39, label %for.cond4.i11.preheader.iter39, !dbg !313, !llvm.loop !380

for.inc17.i8.iter39:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter39
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_39_end

for.cond4.i11.preheader.iter39:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter39, %for.inc15.i14.iter39
  %c.0.i673.iter39 = phi i32 [ 39, %for.cond4.i11.preheader.lr.ph.iter39 ], [ %inc.i16.iter39, %for.inc15.i14.iter39 ]
  %bs_mat_entries_used.1.i72.iter39 = phi i32 [ %split.iter38, %for.cond4.i11.preheader.lr.ph.iter39 ], [ %add14.i15.iter39, %for.inc15.i14.iter39 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter39, !dbg !374

for.cond4.i11.preheader.lr.ph.iter39:             ; preds = %for.cond1.preheader.i4.iter39
  br label %for.cond4.i11.preheader.iter39, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter39:       ; preds = %for.inc15.i14.iter39
  %split.iter39 = phi i32 [ %add14.i15.iter39, %for.inc15.i14.iter39 ]
  br label %for.inc17.i8.iter39, !dbg !313

iter_39_end:                                      ; preds = %for.inc17.i8.iter39
  br label %iter_40_start

iter_40_start:                                    ; preds = %iter_39_end
  br label %for.cond1.preheader.i4.iter40

for.cond1.preheader.i4.iter40:                    ; preds = %iter_40_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %375 = add i32 %split.iter39, 38, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter40, !dbg !313

for.body6.i17.iter40:                             ; preds = %for.cond4.i11.preheader.iter40, %m_vec_mul_add.exit.iter40
  %k.0.i1270.iter40 = phi i32 [ 0, %for.cond4.i11.preheader.iter40 ], [ %add13.i.iter40, %m_vec_mul_add.exit.iter40 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter40 = mul nsw i32 %bs_mat_entries_used.1.i72.iter40, 40, !dbg !319
  %add.ptr.i19.iter40 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter40, !dbg !319
  %mul8.i20.iter40 = shl nuw nsw i32 %c.0.i673.iter40, 3, !dbg !322
  %376 = getelementptr i8, ptr %O, i32 %mul8.i20.iter40, !dbg !323
  %arrayidx.i21.iter40 = getelementptr i8, ptr %376, i32 %k.0.i1270.iter40, !dbg !323
  %377 = load i8, ptr %arrayidx.i21.iter40, align 1, !dbg !323
  %add10.i.iter40 = or disjoint i32 320, %k.0.i1270.iter40, !dbg !324
  %add.ptr12.idx.i.iter40 = mul nuw nsw i32 %add10.i.iter40, 40, !dbg !325
  %add.ptr12.i.iter40 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter40, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter40 = zext i8 %377 to i32, !dbg !330
  %mul.i.i.iter40 = mul i32 %conv.i.i.iter40, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter40 = and i32 %mul.i.i.iter40, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter40 = lshr exact i32 %and.i.i.iter40, 4, !dbg !333
  %shr1.i.i.iter40 = lshr exact i32 %and.i.i.iter40, 3, !dbg !334
  %378 = xor i32 %shr.i.i.iter40, %shr1.i.i.iter40, !dbg !335
  %xor2.i.i.iter40 = xor i32 %378, %mul.i.i.iter40, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter40, !dbg !337

for.body.i.iter40:                                ; preds = %for.body.i.iter40, %for.body6.i17.iter40
  %i.0.i69.iter40 = phi i32 [ 0, %for.body6.i17.iter40 ], [ %inc.i26.iter40, %for.body.i.iter40 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter40, i32 %i.0.i69.iter40, !dbg !338
  %379 = load i64, ptr %arrayidx.i24.iter40, align 8, !dbg !338
  %and.i.iter40 = and i64 %379, 1229782938247303441, !dbg !339
  %and1.i.iter40 = and i32 %xor2.i.i.iter40, 255, !dbg !340
  %conv.i.iter40 = zext nneg i32 %and1.i.iter40 to i64, !dbg !341
  %mul.i25.iter40 = mul i64 %and.i.iter40, %conv.i.iter40, !dbg !342
  %shr.i.iter40 = lshr i64 %379, 1, !dbg !343
  %and3.i.iter40 = and i64 %shr.i.iter40, 1229782938247303441, !dbg !344
  %shr4.i.iter40 = lshr i32 %xor2.i.i.iter40, 8, !dbg !345
  %and5.i.iter40 = and i32 %shr4.i.iter40, 15, !dbg !346
  %conv6.i.iter40 = zext nneg i32 %and5.i.iter40 to i64, !dbg !347
  %mul7.i.iter40 = mul nuw i64 %and3.i.iter40, %conv6.i.iter40, !dbg !348
  %xor.i.iter40 = xor i64 %mul.i25.iter40, %mul7.i.iter40, !dbg !349
  %arrayidx8.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter40, i32 %i.0.i69.iter40, !dbg !350
  %380 = load i64, ptr %arrayidx8.i.iter40, align 8, !dbg !350
  %shr9.i.iter40 = lshr i64 %380, 2, !dbg !351
  %and10.i.iter40 = and i64 %shr9.i.iter40, 1229782938247303441, !dbg !352
  %shr11.i.iter40 = lshr i32 %xor2.i.i.iter40, 16, !dbg !353
  %and12.i.iter40 = and i32 %shr11.i.iter40, 15, !dbg !354
  %conv13.i.iter40 = zext nneg i32 %and12.i.iter40 to i64, !dbg !355
  %mul14.i.iter40 = mul nuw i64 %and10.i.iter40, %conv13.i.iter40, !dbg !356
  %xor15.i.iter40 = xor i64 %xor.i.iter40, %mul14.i.iter40, !dbg !357
  %arrayidx16.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter40, i32 %i.0.i69.iter40, !dbg !358
  %381 = load i64, ptr %arrayidx16.i.iter40, align 8, !dbg !358
  %shr17.i.iter40 = lshr i64 %381, 3, !dbg !359
  %and18.i.iter40 = and i64 %shr17.i.iter40, 1229782938247303441, !dbg !360
  %shr19.i.iter40 = lshr i32 %xor2.i.i.iter40, 24, !dbg !361
  %and20.i.iter40 = and i32 %shr19.i.iter40, 15, !dbg !362
  %conv21.i.iter40 = zext nneg i32 %and20.i.iter40 to i64, !dbg !363
  %mul22.i.iter40 = mul nuw i64 %and18.i.iter40, %conv21.i.iter40, !dbg !364
  %xor23.i.iter40 = xor i64 %xor15.i.iter40, %mul22.i.iter40, !dbg !365
  %arrayidx24.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter40, i32 %i.0.i69.iter40, !dbg !366
  %382 = load i64, ptr %arrayidx24.i.iter40, align 8, !dbg !367
  %xor25.i.iter40 = xor i64 %382, %xor23.i.iter40, !dbg !367
  store i64 %xor25.i.iter40, ptr %arrayidx24.i.iter40, align 8, !dbg !367
  %inc.i26.iter40 = add nuw nsw i32 %i.0.i69.iter40, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter40 = icmp eq i32 %inc.i26.iter40, 5, !dbg !369
  br i1 %exitcond.i23.not.iter40, label %m_vec_mul_add.exit.iter40, label %for.body.i.iter40, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter40:                        ; preds = %for.body.i.iter40
  %add13.i.iter40 = add nuw nsw i32 %k.0.i1270.iter40, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter40 = icmp eq i32 %add13.i.iter40, 8, !dbg !373
  br i1 %exitcond.i13.not.iter40, label %for.inc15.i14.iter40, label %for.body6.i17.iter40, !dbg !374, !llvm.loop !375

for.inc15.i14.iter40:                             ; preds = %m_vec_mul_add.exit.iter40
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter40 = add i32 %bs_mat_entries_used.1.i72.iter40, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter40 = add nuw nsw i32 %c.0.i673.iter40, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter40 = icmp eq i32 %add14.i15.iter40, %375, !dbg !379
  br i1 %exitcond1.i7.not.iter40, label %for.cond1.i5.for.inc17.i8_crit_edge.iter40, label %for.cond4.i11.preheader.iter40, !dbg !313, !llvm.loop !380

for.inc17.i8.iter40:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter40
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_40_end

for.cond4.i11.preheader.iter40:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter40, %for.inc15.i14.iter40
  %c.0.i673.iter40 = phi i32 [ 40, %for.cond4.i11.preheader.lr.ph.iter40 ], [ %inc.i16.iter40, %for.inc15.i14.iter40 ]
  %bs_mat_entries_used.1.i72.iter40 = phi i32 [ %split.iter39, %for.cond4.i11.preheader.lr.ph.iter40 ], [ %add14.i15.iter40, %for.inc15.i14.iter40 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter40, !dbg !374

for.cond4.i11.preheader.lr.ph.iter40:             ; preds = %for.cond1.preheader.i4.iter40
  br label %for.cond4.i11.preheader.iter40, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter40:       ; preds = %for.inc15.i14.iter40
  %split.iter40 = phi i32 [ %add14.i15.iter40, %for.inc15.i14.iter40 ]
  br label %for.inc17.i8.iter40, !dbg !313

iter_40_end:                                      ; preds = %for.inc17.i8.iter40
  br label %iter_41_start

iter_41_start:                                    ; preds = %iter_40_end
  br label %for.cond1.preheader.i4.iter41

for.cond1.preheader.i4.iter41:                    ; preds = %iter_41_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %383 = add i32 %split.iter40, 37, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter41, !dbg !313

for.body6.i17.iter41:                             ; preds = %for.cond4.i11.preheader.iter41, %m_vec_mul_add.exit.iter41
  %k.0.i1270.iter41 = phi i32 [ 0, %for.cond4.i11.preheader.iter41 ], [ %add13.i.iter41, %m_vec_mul_add.exit.iter41 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter41 = mul nsw i32 %bs_mat_entries_used.1.i72.iter41, 40, !dbg !319
  %add.ptr.i19.iter41 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter41, !dbg !319
  %mul8.i20.iter41 = shl nuw nsw i32 %c.0.i673.iter41, 3, !dbg !322
  %384 = getelementptr i8, ptr %O, i32 %mul8.i20.iter41, !dbg !323
  %arrayidx.i21.iter41 = getelementptr i8, ptr %384, i32 %k.0.i1270.iter41, !dbg !323
  %385 = load i8, ptr %arrayidx.i21.iter41, align 1, !dbg !323
  %add10.i.iter41 = or disjoint i32 328, %k.0.i1270.iter41, !dbg !324
  %add.ptr12.idx.i.iter41 = mul nuw nsw i32 %add10.i.iter41, 40, !dbg !325
  %add.ptr12.i.iter41 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter41, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter41 = zext i8 %385 to i32, !dbg !330
  %mul.i.i.iter41 = mul i32 %conv.i.i.iter41, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter41 = and i32 %mul.i.i.iter41, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter41 = lshr exact i32 %and.i.i.iter41, 4, !dbg !333
  %shr1.i.i.iter41 = lshr exact i32 %and.i.i.iter41, 3, !dbg !334
  %386 = xor i32 %shr.i.i.iter41, %shr1.i.i.iter41, !dbg !335
  %xor2.i.i.iter41 = xor i32 %386, %mul.i.i.iter41, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter41, !dbg !337

for.body.i.iter41:                                ; preds = %for.body.i.iter41, %for.body6.i17.iter41
  %i.0.i69.iter41 = phi i32 [ 0, %for.body6.i17.iter41 ], [ %inc.i26.iter41, %for.body.i.iter41 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter41, i32 %i.0.i69.iter41, !dbg !338
  %387 = load i64, ptr %arrayidx.i24.iter41, align 8, !dbg !338
  %and.i.iter41 = and i64 %387, 1229782938247303441, !dbg !339
  %and1.i.iter41 = and i32 %xor2.i.i.iter41, 255, !dbg !340
  %conv.i.iter41 = zext nneg i32 %and1.i.iter41 to i64, !dbg !341
  %mul.i25.iter41 = mul i64 %and.i.iter41, %conv.i.iter41, !dbg !342
  %shr.i.iter41 = lshr i64 %387, 1, !dbg !343
  %and3.i.iter41 = and i64 %shr.i.iter41, 1229782938247303441, !dbg !344
  %shr4.i.iter41 = lshr i32 %xor2.i.i.iter41, 8, !dbg !345
  %and5.i.iter41 = and i32 %shr4.i.iter41, 15, !dbg !346
  %conv6.i.iter41 = zext nneg i32 %and5.i.iter41 to i64, !dbg !347
  %mul7.i.iter41 = mul nuw i64 %and3.i.iter41, %conv6.i.iter41, !dbg !348
  %xor.i.iter41 = xor i64 %mul.i25.iter41, %mul7.i.iter41, !dbg !349
  %arrayidx8.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter41, i32 %i.0.i69.iter41, !dbg !350
  %388 = load i64, ptr %arrayidx8.i.iter41, align 8, !dbg !350
  %shr9.i.iter41 = lshr i64 %388, 2, !dbg !351
  %and10.i.iter41 = and i64 %shr9.i.iter41, 1229782938247303441, !dbg !352
  %shr11.i.iter41 = lshr i32 %xor2.i.i.iter41, 16, !dbg !353
  %and12.i.iter41 = and i32 %shr11.i.iter41, 15, !dbg !354
  %conv13.i.iter41 = zext nneg i32 %and12.i.iter41 to i64, !dbg !355
  %mul14.i.iter41 = mul nuw i64 %and10.i.iter41, %conv13.i.iter41, !dbg !356
  %xor15.i.iter41 = xor i64 %xor.i.iter41, %mul14.i.iter41, !dbg !357
  %arrayidx16.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter41, i32 %i.0.i69.iter41, !dbg !358
  %389 = load i64, ptr %arrayidx16.i.iter41, align 8, !dbg !358
  %shr17.i.iter41 = lshr i64 %389, 3, !dbg !359
  %and18.i.iter41 = and i64 %shr17.i.iter41, 1229782938247303441, !dbg !360
  %shr19.i.iter41 = lshr i32 %xor2.i.i.iter41, 24, !dbg !361
  %and20.i.iter41 = and i32 %shr19.i.iter41, 15, !dbg !362
  %conv21.i.iter41 = zext nneg i32 %and20.i.iter41 to i64, !dbg !363
  %mul22.i.iter41 = mul nuw i64 %and18.i.iter41, %conv21.i.iter41, !dbg !364
  %xor23.i.iter41 = xor i64 %xor15.i.iter41, %mul22.i.iter41, !dbg !365
  %arrayidx24.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter41, i32 %i.0.i69.iter41, !dbg !366
  %390 = load i64, ptr %arrayidx24.i.iter41, align 8, !dbg !367
  %xor25.i.iter41 = xor i64 %390, %xor23.i.iter41, !dbg !367
  store i64 %xor25.i.iter41, ptr %arrayidx24.i.iter41, align 8, !dbg !367
  %inc.i26.iter41 = add nuw nsw i32 %i.0.i69.iter41, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter41 = icmp eq i32 %inc.i26.iter41, 5, !dbg !369
  br i1 %exitcond.i23.not.iter41, label %m_vec_mul_add.exit.iter41, label %for.body.i.iter41, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter41:                        ; preds = %for.body.i.iter41
  %add13.i.iter41 = add nuw nsw i32 %k.0.i1270.iter41, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter41 = icmp eq i32 %add13.i.iter41, 8, !dbg !373
  br i1 %exitcond.i13.not.iter41, label %for.inc15.i14.iter41, label %for.body6.i17.iter41, !dbg !374, !llvm.loop !375

for.inc15.i14.iter41:                             ; preds = %m_vec_mul_add.exit.iter41
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter41 = add i32 %bs_mat_entries_used.1.i72.iter41, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter41 = add nuw nsw i32 %c.0.i673.iter41, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter41 = icmp eq i32 %add14.i15.iter41, %383, !dbg !379
  br i1 %exitcond1.i7.not.iter41, label %for.cond1.i5.for.inc17.i8_crit_edge.iter41, label %for.cond4.i11.preheader.iter41, !dbg !313, !llvm.loop !380

for.inc17.i8.iter41:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter41
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_41_end

for.cond4.i11.preheader.iter41:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter41, %for.inc15.i14.iter41
  %c.0.i673.iter41 = phi i32 [ 41, %for.cond4.i11.preheader.lr.ph.iter41 ], [ %inc.i16.iter41, %for.inc15.i14.iter41 ]
  %bs_mat_entries_used.1.i72.iter41 = phi i32 [ %split.iter40, %for.cond4.i11.preheader.lr.ph.iter41 ], [ %add14.i15.iter41, %for.inc15.i14.iter41 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter41, !dbg !374

for.cond4.i11.preheader.lr.ph.iter41:             ; preds = %for.cond1.preheader.i4.iter41
  br label %for.cond4.i11.preheader.iter41, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter41:       ; preds = %for.inc15.i14.iter41
  %split.iter41 = phi i32 [ %add14.i15.iter41, %for.inc15.i14.iter41 ]
  br label %for.inc17.i8.iter41, !dbg !313

iter_41_end:                                      ; preds = %for.inc17.i8.iter41
  br label %iter_42_start

iter_42_start:                                    ; preds = %iter_41_end
  br label %for.cond1.preheader.i4.iter42

for.cond1.preheader.i4.iter42:                    ; preds = %iter_42_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %391 = add i32 %split.iter41, 36, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter42, !dbg !313

for.body6.i17.iter42:                             ; preds = %for.cond4.i11.preheader.iter42, %m_vec_mul_add.exit.iter42
  %k.0.i1270.iter42 = phi i32 [ 0, %for.cond4.i11.preheader.iter42 ], [ %add13.i.iter42, %m_vec_mul_add.exit.iter42 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter42 = mul nsw i32 %bs_mat_entries_used.1.i72.iter42, 40, !dbg !319
  %add.ptr.i19.iter42 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter42, !dbg !319
  %mul8.i20.iter42 = shl nuw nsw i32 %c.0.i673.iter42, 3, !dbg !322
  %392 = getelementptr i8, ptr %O, i32 %mul8.i20.iter42, !dbg !323
  %arrayidx.i21.iter42 = getelementptr i8, ptr %392, i32 %k.0.i1270.iter42, !dbg !323
  %393 = load i8, ptr %arrayidx.i21.iter42, align 1, !dbg !323
  %add10.i.iter42 = or disjoint i32 336, %k.0.i1270.iter42, !dbg !324
  %add.ptr12.idx.i.iter42 = mul nuw nsw i32 %add10.i.iter42, 40, !dbg !325
  %add.ptr12.i.iter42 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter42, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter42 = zext i8 %393 to i32, !dbg !330
  %mul.i.i.iter42 = mul i32 %conv.i.i.iter42, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter42 = and i32 %mul.i.i.iter42, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter42 = lshr exact i32 %and.i.i.iter42, 4, !dbg !333
  %shr1.i.i.iter42 = lshr exact i32 %and.i.i.iter42, 3, !dbg !334
  %394 = xor i32 %shr.i.i.iter42, %shr1.i.i.iter42, !dbg !335
  %xor2.i.i.iter42 = xor i32 %394, %mul.i.i.iter42, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter42, !dbg !337

for.body.i.iter42:                                ; preds = %for.body.i.iter42, %for.body6.i17.iter42
  %i.0.i69.iter42 = phi i32 [ 0, %for.body6.i17.iter42 ], [ %inc.i26.iter42, %for.body.i.iter42 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter42, i32 %i.0.i69.iter42, !dbg !338
  %395 = load i64, ptr %arrayidx.i24.iter42, align 8, !dbg !338
  %and.i.iter42 = and i64 %395, 1229782938247303441, !dbg !339
  %and1.i.iter42 = and i32 %xor2.i.i.iter42, 255, !dbg !340
  %conv.i.iter42 = zext nneg i32 %and1.i.iter42 to i64, !dbg !341
  %mul.i25.iter42 = mul i64 %and.i.iter42, %conv.i.iter42, !dbg !342
  %shr.i.iter42 = lshr i64 %395, 1, !dbg !343
  %and3.i.iter42 = and i64 %shr.i.iter42, 1229782938247303441, !dbg !344
  %shr4.i.iter42 = lshr i32 %xor2.i.i.iter42, 8, !dbg !345
  %and5.i.iter42 = and i32 %shr4.i.iter42, 15, !dbg !346
  %conv6.i.iter42 = zext nneg i32 %and5.i.iter42 to i64, !dbg !347
  %mul7.i.iter42 = mul nuw i64 %and3.i.iter42, %conv6.i.iter42, !dbg !348
  %xor.i.iter42 = xor i64 %mul.i25.iter42, %mul7.i.iter42, !dbg !349
  %arrayidx8.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter42, i32 %i.0.i69.iter42, !dbg !350
  %396 = load i64, ptr %arrayidx8.i.iter42, align 8, !dbg !350
  %shr9.i.iter42 = lshr i64 %396, 2, !dbg !351
  %and10.i.iter42 = and i64 %shr9.i.iter42, 1229782938247303441, !dbg !352
  %shr11.i.iter42 = lshr i32 %xor2.i.i.iter42, 16, !dbg !353
  %and12.i.iter42 = and i32 %shr11.i.iter42, 15, !dbg !354
  %conv13.i.iter42 = zext nneg i32 %and12.i.iter42 to i64, !dbg !355
  %mul14.i.iter42 = mul nuw i64 %and10.i.iter42, %conv13.i.iter42, !dbg !356
  %xor15.i.iter42 = xor i64 %xor.i.iter42, %mul14.i.iter42, !dbg !357
  %arrayidx16.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter42, i32 %i.0.i69.iter42, !dbg !358
  %397 = load i64, ptr %arrayidx16.i.iter42, align 8, !dbg !358
  %shr17.i.iter42 = lshr i64 %397, 3, !dbg !359
  %and18.i.iter42 = and i64 %shr17.i.iter42, 1229782938247303441, !dbg !360
  %shr19.i.iter42 = lshr i32 %xor2.i.i.iter42, 24, !dbg !361
  %and20.i.iter42 = and i32 %shr19.i.iter42, 15, !dbg !362
  %conv21.i.iter42 = zext nneg i32 %and20.i.iter42 to i64, !dbg !363
  %mul22.i.iter42 = mul nuw i64 %and18.i.iter42, %conv21.i.iter42, !dbg !364
  %xor23.i.iter42 = xor i64 %xor15.i.iter42, %mul22.i.iter42, !dbg !365
  %arrayidx24.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter42, i32 %i.0.i69.iter42, !dbg !366
  %398 = load i64, ptr %arrayidx24.i.iter42, align 8, !dbg !367
  %xor25.i.iter42 = xor i64 %398, %xor23.i.iter42, !dbg !367
  store i64 %xor25.i.iter42, ptr %arrayidx24.i.iter42, align 8, !dbg !367
  %inc.i26.iter42 = add nuw nsw i32 %i.0.i69.iter42, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter42 = icmp eq i32 %inc.i26.iter42, 5, !dbg !369
  br i1 %exitcond.i23.not.iter42, label %m_vec_mul_add.exit.iter42, label %for.body.i.iter42, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter42:                        ; preds = %for.body.i.iter42
  %add13.i.iter42 = add nuw nsw i32 %k.0.i1270.iter42, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter42 = icmp eq i32 %add13.i.iter42, 8, !dbg !373
  br i1 %exitcond.i13.not.iter42, label %for.inc15.i14.iter42, label %for.body6.i17.iter42, !dbg !374, !llvm.loop !375

for.inc15.i14.iter42:                             ; preds = %m_vec_mul_add.exit.iter42
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter42 = add i32 %bs_mat_entries_used.1.i72.iter42, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter42 = add nuw nsw i32 %c.0.i673.iter42, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter42 = icmp eq i32 %add14.i15.iter42, %391, !dbg !379
  br i1 %exitcond1.i7.not.iter42, label %for.cond1.i5.for.inc17.i8_crit_edge.iter42, label %for.cond4.i11.preheader.iter42, !dbg !313, !llvm.loop !380

for.inc17.i8.iter42:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter42
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_42_end

for.cond4.i11.preheader.iter42:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter42, %for.inc15.i14.iter42
  %c.0.i673.iter42 = phi i32 [ 42, %for.cond4.i11.preheader.lr.ph.iter42 ], [ %inc.i16.iter42, %for.inc15.i14.iter42 ]
  %bs_mat_entries_used.1.i72.iter42 = phi i32 [ %split.iter41, %for.cond4.i11.preheader.lr.ph.iter42 ], [ %add14.i15.iter42, %for.inc15.i14.iter42 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter42, !dbg !374

for.cond4.i11.preheader.lr.ph.iter42:             ; preds = %for.cond1.preheader.i4.iter42
  br label %for.cond4.i11.preheader.iter42, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter42:       ; preds = %for.inc15.i14.iter42
  %split.iter42 = phi i32 [ %add14.i15.iter42, %for.inc15.i14.iter42 ]
  br label %for.inc17.i8.iter42, !dbg !313

iter_42_end:                                      ; preds = %for.inc17.i8.iter42
  br label %iter_43_start

iter_43_start:                                    ; preds = %iter_42_end
  br label %for.cond1.preheader.i4.iter43

for.cond1.preheader.i4.iter43:                    ; preds = %iter_43_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %399 = add i32 %split.iter42, 35, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter43, !dbg !313

for.body6.i17.iter43:                             ; preds = %for.cond4.i11.preheader.iter43, %m_vec_mul_add.exit.iter43
  %k.0.i1270.iter43 = phi i32 [ 0, %for.cond4.i11.preheader.iter43 ], [ %add13.i.iter43, %m_vec_mul_add.exit.iter43 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter43 = mul nsw i32 %bs_mat_entries_used.1.i72.iter43, 40, !dbg !319
  %add.ptr.i19.iter43 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter43, !dbg !319
  %mul8.i20.iter43 = shl nuw nsw i32 %c.0.i673.iter43, 3, !dbg !322
  %400 = getelementptr i8, ptr %O, i32 %mul8.i20.iter43, !dbg !323
  %arrayidx.i21.iter43 = getelementptr i8, ptr %400, i32 %k.0.i1270.iter43, !dbg !323
  %401 = load i8, ptr %arrayidx.i21.iter43, align 1, !dbg !323
  %add10.i.iter43 = or disjoint i32 344, %k.0.i1270.iter43, !dbg !324
  %add.ptr12.idx.i.iter43 = mul nuw nsw i32 %add10.i.iter43, 40, !dbg !325
  %add.ptr12.i.iter43 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter43, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter43 = zext i8 %401 to i32, !dbg !330
  %mul.i.i.iter43 = mul i32 %conv.i.i.iter43, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter43 = and i32 %mul.i.i.iter43, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter43 = lshr exact i32 %and.i.i.iter43, 4, !dbg !333
  %shr1.i.i.iter43 = lshr exact i32 %and.i.i.iter43, 3, !dbg !334
  %402 = xor i32 %shr.i.i.iter43, %shr1.i.i.iter43, !dbg !335
  %xor2.i.i.iter43 = xor i32 %402, %mul.i.i.iter43, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter43, !dbg !337

for.body.i.iter43:                                ; preds = %for.body.i.iter43, %for.body6.i17.iter43
  %i.0.i69.iter43 = phi i32 [ 0, %for.body6.i17.iter43 ], [ %inc.i26.iter43, %for.body.i.iter43 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter43, i32 %i.0.i69.iter43, !dbg !338
  %403 = load i64, ptr %arrayidx.i24.iter43, align 8, !dbg !338
  %and.i.iter43 = and i64 %403, 1229782938247303441, !dbg !339
  %and1.i.iter43 = and i32 %xor2.i.i.iter43, 255, !dbg !340
  %conv.i.iter43 = zext nneg i32 %and1.i.iter43 to i64, !dbg !341
  %mul.i25.iter43 = mul i64 %and.i.iter43, %conv.i.iter43, !dbg !342
  %shr.i.iter43 = lshr i64 %403, 1, !dbg !343
  %and3.i.iter43 = and i64 %shr.i.iter43, 1229782938247303441, !dbg !344
  %shr4.i.iter43 = lshr i32 %xor2.i.i.iter43, 8, !dbg !345
  %and5.i.iter43 = and i32 %shr4.i.iter43, 15, !dbg !346
  %conv6.i.iter43 = zext nneg i32 %and5.i.iter43 to i64, !dbg !347
  %mul7.i.iter43 = mul nuw i64 %and3.i.iter43, %conv6.i.iter43, !dbg !348
  %xor.i.iter43 = xor i64 %mul.i25.iter43, %mul7.i.iter43, !dbg !349
  %arrayidx8.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter43, i32 %i.0.i69.iter43, !dbg !350
  %404 = load i64, ptr %arrayidx8.i.iter43, align 8, !dbg !350
  %shr9.i.iter43 = lshr i64 %404, 2, !dbg !351
  %and10.i.iter43 = and i64 %shr9.i.iter43, 1229782938247303441, !dbg !352
  %shr11.i.iter43 = lshr i32 %xor2.i.i.iter43, 16, !dbg !353
  %and12.i.iter43 = and i32 %shr11.i.iter43, 15, !dbg !354
  %conv13.i.iter43 = zext nneg i32 %and12.i.iter43 to i64, !dbg !355
  %mul14.i.iter43 = mul nuw i64 %and10.i.iter43, %conv13.i.iter43, !dbg !356
  %xor15.i.iter43 = xor i64 %xor.i.iter43, %mul14.i.iter43, !dbg !357
  %arrayidx16.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter43, i32 %i.0.i69.iter43, !dbg !358
  %405 = load i64, ptr %arrayidx16.i.iter43, align 8, !dbg !358
  %shr17.i.iter43 = lshr i64 %405, 3, !dbg !359
  %and18.i.iter43 = and i64 %shr17.i.iter43, 1229782938247303441, !dbg !360
  %shr19.i.iter43 = lshr i32 %xor2.i.i.iter43, 24, !dbg !361
  %and20.i.iter43 = and i32 %shr19.i.iter43, 15, !dbg !362
  %conv21.i.iter43 = zext nneg i32 %and20.i.iter43 to i64, !dbg !363
  %mul22.i.iter43 = mul nuw i64 %and18.i.iter43, %conv21.i.iter43, !dbg !364
  %xor23.i.iter43 = xor i64 %xor15.i.iter43, %mul22.i.iter43, !dbg !365
  %arrayidx24.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter43, i32 %i.0.i69.iter43, !dbg !366
  %406 = load i64, ptr %arrayidx24.i.iter43, align 8, !dbg !367
  %xor25.i.iter43 = xor i64 %406, %xor23.i.iter43, !dbg !367
  store i64 %xor25.i.iter43, ptr %arrayidx24.i.iter43, align 8, !dbg !367
  %inc.i26.iter43 = add nuw nsw i32 %i.0.i69.iter43, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter43 = icmp eq i32 %inc.i26.iter43, 5, !dbg !369
  br i1 %exitcond.i23.not.iter43, label %m_vec_mul_add.exit.iter43, label %for.body.i.iter43, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter43:                        ; preds = %for.body.i.iter43
  %add13.i.iter43 = add nuw nsw i32 %k.0.i1270.iter43, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter43 = icmp eq i32 %add13.i.iter43, 8, !dbg !373
  br i1 %exitcond.i13.not.iter43, label %for.inc15.i14.iter43, label %for.body6.i17.iter43, !dbg !374, !llvm.loop !375

for.inc15.i14.iter43:                             ; preds = %m_vec_mul_add.exit.iter43
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter43 = add i32 %bs_mat_entries_used.1.i72.iter43, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter43 = add nuw nsw i32 %c.0.i673.iter43, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter43 = icmp eq i32 %add14.i15.iter43, %399, !dbg !379
  br i1 %exitcond1.i7.not.iter43, label %for.cond1.i5.for.inc17.i8_crit_edge.iter43, label %for.cond4.i11.preheader.iter43, !dbg !313, !llvm.loop !380

for.inc17.i8.iter43:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter43
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_43_end

for.cond4.i11.preheader.iter43:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter43, %for.inc15.i14.iter43
  %c.0.i673.iter43 = phi i32 [ 43, %for.cond4.i11.preheader.lr.ph.iter43 ], [ %inc.i16.iter43, %for.inc15.i14.iter43 ]
  %bs_mat_entries_used.1.i72.iter43 = phi i32 [ %split.iter42, %for.cond4.i11.preheader.lr.ph.iter43 ], [ %add14.i15.iter43, %for.inc15.i14.iter43 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter43, !dbg !374

for.cond4.i11.preheader.lr.ph.iter43:             ; preds = %for.cond1.preheader.i4.iter43
  br label %for.cond4.i11.preheader.iter43, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter43:       ; preds = %for.inc15.i14.iter43
  %split.iter43 = phi i32 [ %add14.i15.iter43, %for.inc15.i14.iter43 ]
  br label %for.inc17.i8.iter43, !dbg !313

iter_43_end:                                      ; preds = %for.inc17.i8.iter43
  br label %iter_44_start

iter_44_start:                                    ; preds = %iter_43_end
  br label %for.cond1.preheader.i4.iter44

for.cond1.preheader.i4.iter44:                    ; preds = %iter_44_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %407 = add i32 %split.iter43, 34, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter44, !dbg !313

for.body6.i17.iter44:                             ; preds = %for.cond4.i11.preheader.iter44, %m_vec_mul_add.exit.iter44
  %k.0.i1270.iter44 = phi i32 [ 0, %for.cond4.i11.preheader.iter44 ], [ %add13.i.iter44, %m_vec_mul_add.exit.iter44 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter44 = mul nsw i32 %bs_mat_entries_used.1.i72.iter44, 40, !dbg !319
  %add.ptr.i19.iter44 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter44, !dbg !319
  %mul8.i20.iter44 = shl nuw nsw i32 %c.0.i673.iter44, 3, !dbg !322
  %408 = getelementptr i8, ptr %O, i32 %mul8.i20.iter44, !dbg !323
  %arrayidx.i21.iter44 = getelementptr i8, ptr %408, i32 %k.0.i1270.iter44, !dbg !323
  %409 = load i8, ptr %arrayidx.i21.iter44, align 1, !dbg !323
  %add10.i.iter44 = or disjoint i32 352, %k.0.i1270.iter44, !dbg !324
  %add.ptr12.idx.i.iter44 = mul nuw nsw i32 %add10.i.iter44, 40, !dbg !325
  %add.ptr12.i.iter44 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter44, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter44 = zext i8 %409 to i32, !dbg !330
  %mul.i.i.iter44 = mul i32 %conv.i.i.iter44, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter44 = and i32 %mul.i.i.iter44, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter44 = lshr exact i32 %and.i.i.iter44, 4, !dbg !333
  %shr1.i.i.iter44 = lshr exact i32 %and.i.i.iter44, 3, !dbg !334
  %410 = xor i32 %shr.i.i.iter44, %shr1.i.i.iter44, !dbg !335
  %xor2.i.i.iter44 = xor i32 %410, %mul.i.i.iter44, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter44, !dbg !337

for.body.i.iter44:                                ; preds = %for.body.i.iter44, %for.body6.i17.iter44
  %i.0.i69.iter44 = phi i32 [ 0, %for.body6.i17.iter44 ], [ %inc.i26.iter44, %for.body.i.iter44 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter44, i32 %i.0.i69.iter44, !dbg !338
  %411 = load i64, ptr %arrayidx.i24.iter44, align 8, !dbg !338
  %and.i.iter44 = and i64 %411, 1229782938247303441, !dbg !339
  %and1.i.iter44 = and i32 %xor2.i.i.iter44, 255, !dbg !340
  %conv.i.iter44 = zext nneg i32 %and1.i.iter44 to i64, !dbg !341
  %mul.i25.iter44 = mul i64 %and.i.iter44, %conv.i.iter44, !dbg !342
  %shr.i.iter44 = lshr i64 %411, 1, !dbg !343
  %and3.i.iter44 = and i64 %shr.i.iter44, 1229782938247303441, !dbg !344
  %shr4.i.iter44 = lshr i32 %xor2.i.i.iter44, 8, !dbg !345
  %and5.i.iter44 = and i32 %shr4.i.iter44, 15, !dbg !346
  %conv6.i.iter44 = zext nneg i32 %and5.i.iter44 to i64, !dbg !347
  %mul7.i.iter44 = mul nuw i64 %and3.i.iter44, %conv6.i.iter44, !dbg !348
  %xor.i.iter44 = xor i64 %mul.i25.iter44, %mul7.i.iter44, !dbg !349
  %arrayidx8.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter44, i32 %i.0.i69.iter44, !dbg !350
  %412 = load i64, ptr %arrayidx8.i.iter44, align 8, !dbg !350
  %shr9.i.iter44 = lshr i64 %412, 2, !dbg !351
  %and10.i.iter44 = and i64 %shr9.i.iter44, 1229782938247303441, !dbg !352
  %shr11.i.iter44 = lshr i32 %xor2.i.i.iter44, 16, !dbg !353
  %and12.i.iter44 = and i32 %shr11.i.iter44, 15, !dbg !354
  %conv13.i.iter44 = zext nneg i32 %and12.i.iter44 to i64, !dbg !355
  %mul14.i.iter44 = mul nuw i64 %and10.i.iter44, %conv13.i.iter44, !dbg !356
  %xor15.i.iter44 = xor i64 %xor.i.iter44, %mul14.i.iter44, !dbg !357
  %arrayidx16.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter44, i32 %i.0.i69.iter44, !dbg !358
  %413 = load i64, ptr %arrayidx16.i.iter44, align 8, !dbg !358
  %shr17.i.iter44 = lshr i64 %413, 3, !dbg !359
  %and18.i.iter44 = and i64 %shr17.i.iter44, 1229782938247303441, !dbg !360
  %shr19.i.iter44 = lshr i32 %xor2.i.i.iter44, 24, !dbg !361
  %and20.i.iter44 = and i32 %shr19.i.iter44, 15, !dbg !362
  %conv21.i.iter44 = zext nneg i32 %and20.i.iter44 to i64, !dbg !363
  %mul22.i.iter44 = mul nuw i64 %and18.i.iter44, %conv21.i.iter44, !dbg !364
  %xor23.i.iter44 = xor i64 %xor15.i.iter44, %mul22.i.iter44, !dbg !365
  %arrayidx24.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter44, i32 %i.0.i69.iter44, !dbg !366
  %414 = load i64, ptr %arrayidx24.i.iter44, align 8, !dbg !367
  %xor25.i.iter44 = xor i64 %414, %xor23.i.iter44, !dbg !367
  store i64 %xor25.i.iter44, ptr %arrayidx24.i.iter44, align 8, !dbg !367
  %inc.i26.iter44 = add nuw nsw i32 %i.0.i69.iter44, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter44 = icmp eq i32 %inc.i26.iter44, 5, !dbg !369
  br i1 %exitcond.i23.not.iter44, label %m_vec_mul_add.exit.iter44, label %for.body.i.iter44, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter44:                        ; preds = %for.body.i.iter44
  %add13.i.iter44 = add nuw nsw i32 %k.0.i1270.iter44, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter44 = icmp eq i32 %add13.i.iter44, 8, !dbg !373
  br i1 %exitcond.i13.not.iter44, label %for.inc15.i14.iter44, label %for.body6.i17.iter44, !dbg !374, !llvm.loop !375

for.inc15.i14.iter44:                             ; preds = %m_vec_mul_add.exit.iter44
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter44 = add i32 %bs_mat_entries_used.1.i72.iter44, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter44 = add nuw nsw i32 %c.0.i673.iter44, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter44 = icmp eq i32 %add14.i15.iter44, %407, !dbg !379
  br i1 %exitcond1.i7.not.iter44, label %for.cond1.i5.for.inc17.i8_crit_edge.iter44, label %for.cond4.i11.preheader.iter44, !dbg !313, !llvm.loop !380

for.inc17.i8.iter44:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter44
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_44_end

for.cond4.i11.preheader.iter44:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter44, %for.inc15.i14.iter44
  %c.0.i673.iter44 = phi i32 [ 44, %for.cond4.i11.preheader.lr.ph.iter44 ], [ %inc.i16.iter44, %for.inc15.i14.iter44 ]
  %bs_mat_entries_used.1.i72.iter44 = phi i32 [ %split.iter43, %for.cond4.i11.preheader.lr.ph.iter44 ], [ %add14.i15.iter44, %for.inc15.i14.iter44 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter44, !dbg !374

for.cond4.i11.preheader.lr.ph.iter44:             ; preds = %for.cond1.preheader.i4.iter44
  br label %for.cond4.i11.preheader.iter44, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter44:       ; preds = %for.inc15.i14.iter44
  %split.iter44 = phi i32 [ %add14.i15.iter44, %for.inc15.i14.iter44 ]
  br label %for.inc17.i8.iter44, !dbg !313

iter_44_end:                                      ; preds = %for.inc17.i8.iter44
  br label %iter_45_start

iter_45_start:                                    ; preds = %iter_44_end
  br label %for.cond1.preheader.i4.iter45

for.cond1.preheader.i4.iter45:                    ; preds = %iter_45_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %415 = add i32 %split.iter44, 33, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter45, !dbg !313

for.body6.i17.iter45:                             ; preds = %for.cond4.i11.preheader.iter45, %m_vec_mul_add.exit.iter45
  %k.0.i1270.iter45 = phi i32 [ 0, %for.cond4.i11.preheader.iter45 ], [ %add13.i.iter45, %m_vec_mul_add.exit.iter45 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter45 = mul nsw i32 %bs_mat_entries_used.1.i72.iter45, 40, !dbg !319
  %add.ptr.i19.iter45 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter45, !dbg !319
  %mul8.i20.iter45 = shl nuw nsw i32 %c.0.i673.iter45, 3, !dbg !322
  %416 = getelementptr i8, ptr %O, i32 %mul8.i20.iter45, !dbg !323
  %arrayidx.i21.iter45 = getelementptr i8, ptr %416, i32 %k.0.i1270.iter45, !dbg !323
  %417 = load i8, ptr %arrayidx.i21.iter45, align 1, !dbg !323
  %add10.i.iter45 = or disjoint i32 360, %k.0.i1270.iter45, !dbg !324
  %add.ptr12.idx.i.iter45 = mul nuw nsw i32 %add10.i.iter45, 40, !dbg !325
  %add.ptr12.i.iter45 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter45, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter45 = zext i8 %417 to i32, !dbg !330
  %mul.i.i.iter45 = mul i32 %conv.i.i.iter45, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter45 = and i32 %mul.i.i.iter45, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter45 = lshr exact i32 %and.i.i.iter45, 4, !dbg !333
  %shr1.i.i.iter45 = lshr exact i32 %and.i.i.iter45, 3, !dbg !334
  %418 = xor i32 %shr.i.i.iter45, %shr1.i.i.iter45, !dbg !335
  %xor2.i.i.iter45 = xor i32 %418, %mul.i.i.iter45, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter45, !dbg !337

for.body.i.iter45:                                ; preds = %for.body.i.iter45, %for.body6.i17.iter45
  %i.0.i69.iter45 = phi i32 [ 0, %for.body6.i17.iter45 ], [ %inc.i26.iter45, %for.body.i.iter45 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter45, i32 %i.0.i69.iter45, !dbg !338
  %419 = load i64, ptr %arrayidx.i24.iter45, align 8, !dbg !338
  %and.i.iter45 = and i64 %419, 1229782938247303441, !dbg !339
  %and1.i.iter45 = and i32 %xor2.i.i.iter45, 255, !dbg !340
  %conv.i.iter45 = zext nneg i32 %and1.i.iter45 to i64, !dbg !341
  %mul.i25.iter45 = mul i64 %and.i.iter45, %conv.i.iter45, !dbg !342
  %shr.i.iter45 = lshr i64 %419, 1, !dbg !343
  %and3.i.iter45 = and i64 %shr.i.iter45, 1229782938247303441, !dbg !344
  %shr4.i.iter45 = lshr i32 %xor2.i.i.iter45, 8, !dbg !345
  %and5.i.iter45 = and i32 %shr4.i.iter45, 15, !dbg !346
  %conv6.i.iter45 = zext nneg i32 %and5.i.iter45 to i64, !dbg !347
  %mul7.i.iter45 = mul nuw i64 %and3.i.iter45, %conv6.i.iter45, !dbg !348
  %xor.i.iter45 = xor i64 %mul.i25.iter45, %mul7.i.iter45, !dbg !349
  %arrayidx8.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter45, i32 %i.0.i69.iter45, !dbg !350
  %420 = load i64, ptr %arrayidx8.i.iter45, align 8, !dbg !350
  %shr9.i.iter45 = lshr i64 %420, 2, !dbg !351
  %and10.i.iter45 = and i64 %shr9.i.iter45, 1229782938247303441, !dbg !352
  %shr11.i.iter45 = lshr i32 %xor2.i.i.iter45, 16, !dbg !353
  %and12.i.iter45 = and i32 %shr11.i.iter45, 15, !dbg !354
  %conv13.i.iter45 = zext nneg i32 %and12.i.iter45 to i64, !dbg !355
  %mul14.i.iter45 = mul nuw i64 %and10.i.iter45, %conv13.i.iter45, !dbg !356
  %xor15.i.iter45 = xor i64 %xor.i.iter45, %mul14.i.iter45, !dbg !357
  %arrayidx16.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter45, i32 %i.0.i69.iter45, !dbg !358
  %421 = load i64, ptr %arrayidx16.i.iter45, align 8, !dbg !358
  %shr17.i.iter45 = lshr i64 %421, 3, !dbg !359
  %and18.i.iter45 = and i64 %shr17.i.iter45, 1229782938247303441, !dbg !360
  %shr19.i.iter45 = lshr i32 %xor2.i.i.iter45, 24, !dbg !361
  %and20.i.iter45 = and i32 %shr19.i.iter45, 15, !dbg !362
  %conv21.i.iter45 = zext nneg i32 %and20.i.iter45 to i64, !dbg !363
  %mul22.i.iter45 = mul nuw i64 %and18.i.iter45, %conv21.i.iter45, !dbg !364
  %xor23.i.iter45 = xor i64 %xor15.i.iter45, %mul22.i.iter45, !dbg !365
  %arrayidx24.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter45, i32 %i.0.i69.iter45, !dbg !366
  %422 = load i64, ptr %arrayidx24.i.iter45, align 8, !dbg !367
  %xor25.i.iter45 = xor i64 %422, %xor23.i.iter45, !dbg !367
  store i64 %xor25.i.iter45, ptr %arrayidx24.i.iter45, align 8, !dbg !367
  %inc.i26.iter45 = add nuw nsw i32 %i.0.i69.iter45, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter45 = icmp eq i32 %inc.i26.iter45, 5, !dbg !369
  br i1 %exitcond.i23.not.iter45, label %m_vec_mul_add.exit.iter45, label %for.body.i.iter45, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter45:                        ; preds = %for.body.i.iter45
  %add13.i.iter45 = add nuw nsw i32 %k.0.i1270.iter45, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter45 = icmp eq i32 %add13.i.iter45, 8, !dbg !373
  br i1 %exitcond.i13.not.iter45, label %for.inc15.i14.iter45, label %for.body6.i17.iter45, !dbg !374, !llvm.loop !375

for.inc15.i14.iter45:                             ; preds = %m_vec_mul_add.exit.iter45
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter45 = add i32 %bs_mat_entries_used.1.i72.iter45, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter45 = add nuw nsw i32 %c.0.i673.iter45, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter45 = icmp eq i32 %add14.i15.iter45, %415, !dbg !379
  br i1 %exitcond1.i7.not.iter45, label %for.cond1.i5.for.inc17.i8_crit_edge.iter45, label %for.cond4.i11.preheader.iter45, !dbg !313, !llvm.loop !380

for.inc17.i8.iter45:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter45
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_45_end

for.cond4.i11.preheader.iter45:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter45, %for.inc15.i14.iter45
  %c.0.i673.iter45 = phi i32 [ 45, %for.cond4.i11.preheader.lr.ph.iter45 ], [ %inc.i16.iter45, %for.inc15.i14.iter45 ]
  %bs_mat_entries_used.1.i72.iter45 = phi i32 [ %split.iter44, %for.cond4.i11.preheader.lr.ph.iter45 ], [ %add14.i15.iter45, %for.inc15.i14.iter45 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter45, !dbg !374

for.cond4.i11.preheader.lr.ph.iter45:             ; preds = %for.cond1.preheader.i4.iter45
  br label %for.cond4.i11.preheader.iter45, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter45:       ; preds = %for.inc15.i14.iter45
  %split.iter45 = phi i32 [ %add14.i15.iter45, %for.inc15.i14.iter45 ]
  br label %for.inc17.i8.iter45, !dbg !313

iter_45_end:                                      ; preds = %for.inc17.i8.iter45
  br label %iter_46_start

iter_46_start:                                    ; preds = %iter_45_end
  br label %for.cond1.preheader.i4.iter46

for.cond1.preheader.i4.iter46:                    ; preds = %iter_46_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %423 = add i32 %split.iter45, 32, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter46, !dbg !313

for.body6.i17.iter46:                             ; preds = %for.cond4.i11.preheader.iter46, %m_vec_mul_add.exit.iter46
  %k.0.i1270.iter46 = phi i32 [ 0, %for.cond4.i11.preheader.iter46 ], [ %add13.i.iter46, %m_vec_mul_add.exit.iter46 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter46 = mul nsw i32 %bs_mat_entries_used.1.i72.iter46, 40, !dbg !319
  %add.ptr.i19.iter46 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter46, !dbg !319
  %mul8.i20.iter46 = shl nuw nsw i32 %c.0.i673.iter46, 3, !dbg !322
  %424 = getelementptr i8, ptr %O, i32 %mul8.i20.iter46, !dbg !323
  %arrayidx.i21.iter46 = getelementptr i8, ptr %424, i32 %k.0.i1270.iter46, !dbg !323
  %425 = load i8, ptr %arrayidx.i21.iter46, align 1, !dbg !323
  %add10.i.iter46 = or disjoint i32 368, %k.0.i1270.iter46, !dbg !324
  %add.ptr12.idx.i.iter46 = mul nuw nsw i32 %add10.i.iter46, 40, !dbg !325
  %add.ptr12.i.iter46 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter46, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter46 = zext i8 %425 to i32, !dbg !330
  %mul.i.i.iter46 = mul i32 %conv.i.i.iter46, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter46 = and i32 %mul.i.i.iter46, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter46 = lshr exact i32 %and.i.i.iter46, 4, !dbg !333
  %shr1.i.i.iter46 = lshr exact i32 %and.i.i.iter46, 3, !dbg !334
  %426 = xor i32 %shr.i.i.iter46, %shr1.i.i.iter46, !dbg !335
  %xor2.i.i.iter46 = xor i32 %426, %mul.i.i.iter46, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter46, !dbg !337

for.body.i.iter46:                                ; preds = %for.body.i.iter46, %for.body6.i17.iter46
  %i.0.i69.iter46 = phi i32 [ 0, %for.body6.i17.iter46 ], [ %inc.i26.iter46, %for.body.i.iter46 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter46, i32 %i.0.i69.iter46, !dbg !338
  %427 = load i64, ptr %arrayidx.i24.iter46, align 8, !dbg !338
  %and.i.iter46 = and i64 %427, 1229782938247303441, !dbg !339
  %and1.i.iter46 = and i32 %xor2.i.i.iter46, 255, !dbg !340
  %conv.i.iter46 = zext nneg i32 %and1.i.iter46 to i64, !dbg !341
  %mul.i25.iter46 = mul i64 %and.i.iter46, %conv.i.iter46, !dbg !342
  %shr.i.iter46 = lshr i64 %427, 1, !dbg !343
  %and3.i.iter46 = and i64 %shr.i.iter46, 1229782938247303441, !dbg !344
  %shr4.i.iter46 = lshr i32 %xor2.i.i.iter46, 8, !dbg !345
  %and5.i.iter46 = and i32 %shr4.i.iter46, 15, !dbg !346
  %conv6.i.iter46 = zext nneg i32 %and5.i.iter46 to i64, !dbg !347
  %mul7.i.iter46 = mul nuw i64 %and3.i.iter46, %conv6.i.iter46, !dbg !348
  %xor.i.iter46 = xor i64 %mul.i25.iter46, %mul7.i.iter46, !dbg !349
  %arrayidx8.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter46, i32 %i.0.i69.iter46, !dbg !350
  %428 = load i64, ptr %arrayidx8.i.iter46, align 8, !dbg !350
  %shr9.i.iter46 = lshr i64 %428, 2, !dbg !351
  %and10.i.iter46 = and i64 %shr9.i.iter46, 1229782938247303441, !dbg !352
  %shr11.i.iter46 = lshr i32 %xor2.i.i.iter46, 16, !dbg !353
  %and12.i.iter46 = and i32 %shr11.i.iter46, 15, !dbg !354
  %conv13.i.iter46 = zext nneg i32 %and12.i.iter46 to i64, !dbg !355
  %mul14.i.iter46 = mul nuw i64 %and10.i.iter46, %conv13.i.iter46, !dbg !356
  %xor15.i.iter46 = xor i64 %xor.i.iter46, %mul14.i.iter46, !dbg !357
  %arrayidx16.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter46, i32 %i.0.i69.iter46, !dbg !358
  %429 = load i64, ptr %arrayidx16.i.iter46, align 8, !dbg !358
  %shr17.i.iter46 = lshr i64 %429, 3, !dbg !359
  %and18.i.iter46 = and i64 %shr17.i.iter46, 1229782938247303441, !dbg !360
  %shr19.i.iter46 = lshr i32 %xor2.i.i.iter46, 24, !dbg !361
  %and20.i.iter46 = and i32 %shr19.i.iter46, 15, !dbg !362
  %conv21.i.iter46 = zext nneg i32 %and20.i.iter46 to i64, !dbg !363
  %mul22.i.iter46 = mul nuw i64 %and18.i.iter46, %conv21.i.iter46, !dbg !364
  %xor23.i.iter46 = xor i64 %xor15.i.iter46, %mul22.i.iter46, !dbg !365
  %arrayidx24.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter46, i32 %i.0.i69.iter46, !dbg !366
  %430 = load i64, ptr %arrayidx24.i.iter46, align 8, !dbg !367
  %xor25.i.iter46 = xor i64 %430, %xor23.i.iter46, !dbg !367
  store i64 %xor25.i.iter46, ptr %arrayidx24.i.iter46, align 8, !dbg !367
  %inc.i26.iter46 = add nuw nsw i32 %i.0.i69.iter46, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter46 = icmp eq i32 %inc.i26.iter46, 5, !dbg !369
  br i1 %exitcond.i23.not.iter46, label %m_vec_mul_add.exit.iter46, label %for.body.i.iter46, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter46:                        ; preds = %for.body.i.iter46
  %add13.i.iter46 = add nuw nsw i32 %k.0.i1270.iter46, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter46 = icmp eq i32 %add13.i.iter46, 8, !dbg !373
  br i1 %exitcond.i13.not.iter46, label %for.inc15.i14.iter46, label %for.body6.i17.iter46, !dbg !374, !llvm.loop !375

for.inc15.i14.iter46:                             ; preds = %m_vec_mul_add.exit.iter46
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter46 = add i32 %bs_mat_entries_used.1.i72.iter46, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter46 = add nuw nsw i32 %c.0.i673.iter46, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter46 = icmp eq i32 %add14.i15.iter46, %423, !dbg !379
  br i1 %exitcond1.i7.not.iter46, label %for.cond1.i5.for.inc17.i8_crit_edge.iter46, label %for.cond4.i11.preheader.iter46, !dbg !313, !llvm.loop !380

for.inc17.i8.iter46:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter46
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_46_end

for.cond4.i11.preheader.iter46:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter46, %for.inc15.i14.iter46
  %c.0.i673.iter46 = phi i32 [ 46, %for.cond4.i11.preheader.lr.ph.iter46 ], [ %inc.i16.iter46, %for.inc15.i14.iter46 ]
  %bs_mat_entries_used.1.i72.iter46 = phi i32 [ %split.iter45, %for.cond4.i11.preheader.lr.ph.iter46 ], [ %add14.i15.iter46, %for.inc15.i14.iter46 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter46, !dbg !374

for.cond4.i11.preheader.lr.ph.iter46:             ; preds = %for.cond1.preheader.i4.iter46
  br label %for.cond4.i11.preheader.iter46, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter46:       ; preds = %for.inc15.i14.iter46
  %split.iter46 = phi i32 [ %add14.i15.iter46, %for.inc15.i14.iter46 ]
  br label %for.inc17.i8.iter46, !dbg !313

iter_46_end:                                      ; preds = %for.inc17.i8.iter46
  br label %iter_47_start

iter_47_start:                                    ; preds = %iter_46_end
  br label %for.cond1.preheader.i4.iter47

for.cond1.preheader.i4.iter47:                    ; preds = %iter_47_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %431 = add i32 %split.iter46, 31, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter47, !dbg !313

for.body6.i17.iter47:                             ; preds = %for.cond4.i11.preheader.iter47, %m_vec_mul_add.exit.iter47
  %k.0.i1270.iter47 = phi i32 [ 0, %for.cond4.i11.preheader.iter47 ], [ %add13.i.iter47, %m_vec_mul_add.exit.iter47 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter47 = mul nsw i32 %bs_mat_entries_used.1.i72.iter47, 40, !dbg !319
  %add.ptr.i19.iter47 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter47, !dbg !319
  %mul8.i20.iter47 = shl nuw nsw i32 %c.0.i673.iter47, 3, !dbg !322
  %432 = getelementptr i8, ptr %O, i32 %mul8.i20.iter47, !dbg !323
  %arrayidx.i21.iter47 = getelementptr i8, ptr %432, i32 %k.0.i1270.iter47, !dbg !323
  %433 = load i8, ptr %arrayidx.i21.iter47, align 1, !dbg !323
  %add10.i.iter47 = or disjoint i32 376, %k.0.i1270.iter47, !dbg !324
  %add.ptr12.idx.i.iter47 = mul nuw nsw i32 %add10.i.iter47, 40, !dbg !325
  %add.ptr12.i.iter47 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter47, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter47 = zext i8 %433 to i32, !dbg !330
  %mul.i.i.iter47 = mul i32 %conv.i.i.iter47, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter47 = and i32 %mul.i.i.iter47, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter47 = lshr exact i32 %and.i.i.iter47, 4, !dbg !333
  %shr1.i.i.iter47 = lshr exact i32 %and.i.i.iter47, 3, !dbg !334
  %434 = xor i32 %shr.i.i.iter47, %shr1.i.i.iter47, !dbg !335
  %xor2.i.i.iter47 = xor i32 %434, %mul.i.i.iter47, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter47, !dbg !337

for.body.i.iter47:                                ; preds = %for.body.i.iter47, %for.body6.i17.iter47
  %i.0.i69.iter47 = phi i32 [ 0, %for.body6.i17.iter47 ], [ %inc.i26.iter47, %for.body.i.iter47 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter47, i32 %i.0.i69.iter47, !dbg !338
  %435 = load i64, ptr %arrayidx.i24.iter47, align 8, !dbg !338
  %and.i.iter47 = and i64 %435, 1229782938247303441, !dbg !339
  %and1.i.iter47 = and i32 %xor2.i.i.iter47, 255, !dbg !340
  %conv.i.iter47 = zext nneg i32 %and1.i.iter47 to i64, !dbg !341
  %mul.i25.iter47 = mul i64 %and.i.iter47, %conv.i.iter47, !dbg !342
  %shr.i.iter47 = lshr i64 %435, 1, !dbg !343
  %and3.i.iter47 = and i64 %shr.i.iter47, 1229782938247303441, !dbg !344
  %shr4.i.iter47 = lshr i32 %xor2.i.i.iter47, 8, !dbg !345
  %and5.i.iter47 = and i32 %shr4.i.iter47, 15, !dbg !346
  %conv6.i.iter47 = zext nneg i32 %and5.i.iter47 to i64, !dbg !347
  %mul7.i.iter47 = mul nuw i64 %and3.i.iter47, %conv6.i.iter47, !dbg !348
  %xor.i.iter47 = xor i64 %mul.i25.iter47, %mul7.i.iter47, !dbg !349
  %arrayidx8.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter47, i32 %i.0.i69.iter47, !dbg !350
  %436 = load i64, ptr %arrayidx8.i.iter47, align 8, !dbg !350
  %shr9.i.iter47 = lshr i64 %436, 2, !dbg !351
  %and10.i.iter47 = and i64 %shr9.i.iter47, 1229782938247303441, !dbg !352
  %shr11.i.iter47 = lshr i32 %xor2.i.i.iter47, 16, !dbg !353
  %and12.i.iter47 = and i32 %shr11.i.iter47, 15, !dbg !354
  %conv13.i.iter47 = zext nneg i32 %and12.i.iter47 to i64, !dbg !355
  %mul14.i.iter47 = mul nuw i64 %and10.i.iter47, %conv13.i.iter47, !dbg !356
  %xor15.i.iter47 = xor i64 %xor.i.iter47, %mul14.i.iter47, !dbg !357
  %arrayidx16.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter47, i32 %i.0.i69.iter47, !dbg !358
  %437 = load i64, ptr %arrayidx16.i.iter47, align 8, !dbg !358
  %shr17.i.iter47 = lshr i64 %437, 3, !dbg !359
  %and18.i.iter47 = and i64 %shr17.i.iter47, 1229782938247303441, !dbg !360
  %shr19.i.iter47 = lshr i32 %xor2.i.i.iter47, 24, !dbg !361
  %and20.i.iter47 = and i32 %shr19.i.iter47, 15, !dbg !362
  %conv21.i.iter47 = zext nneg i32 %and20.i.iter47 to i64, !dbg !363
  %mul22.i.iter47 = mul nuw i64 %and18.i.iter47, %conv21.i.iter47, !dbg !364
  %xor23.i.iter47 = xor i64 %xor15.i.iter47, %mul22.i.iter47, !dbg !365
  %arrayidx24.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter47, i32 %i.0.i69.iter47, !dbg !366
  %438 = load i64, ptr %arrayidx24.i.iter47, align 8, !dbg !367
  %xor25.i.iter47 = xor i64 %438, %xor23.i.iter47, !dbg !367
  store i64 %xor25.i.iter47, ptr %arrayidx24.i.iter47, align 8, !dbg !367
  %inc.i26.iter47 = add nuw nsw i32 %i.0.i69.iter47, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter47 = icmp eq i32 %inc.i26.iter47, 5, !dbg !369
  br i1 %exitcond.i23.not.iter47, label %m_vec_mul_add.exit.iter47, label %for.body.i.iter47, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter47:                        ; preds = %for.body.i.iter47
  %add13.i.iter47 = add nuw nsw i32 %k.0.i1270.iter47, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter47 = icmp eq i32 %add13.i.iter47, 8, !dbg !373
  br i1 %exitcond.i13.not.iter47, label %for.inc15.i14.iter47, label %for.body6.i17.iter47, !dbg !374, !llvm.loop !375

for.inc15.i14.iter47:                             ; preds = %m_vec_mul_add.exit.iter47
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter47 = add i32 %bs_mat_entries_used.1.i72.iter47, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter47 = add nuw nsw i32 %c.0.i673.iter47, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter47 = icmp eq i32 %add14.i15.iter47, %431, !dbg !379
  br i1 %exitcond1.i7.not.iter47, label %for.cond1.i5.for.inc17.i8_crit_edge.iter47, label %for.cond4.i11.preheader.iter47, !dbg !313, !llvm.loop !380

for.inc17.i8.iter47:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter47
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_47_end

for.cond4.i11.preheader.iter47:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter47, %for.inc15.i14.iter47
  %c.0.i673.iter47 = phi i32 [ 47, %for.cond4.i11.preheader.lr.ph.iter47 ], [ %inc.i16.iter47, %for.inc15.i14.iter47 ]
  %bs_mat_entries_used.1.i72.iter47 = phi i32 [ %split.iter46, %for.cond4.i11.preheader.lr.ph.iter47 ], [ %add14.i15.iter47, %for.inc15.i14.iter47 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter47, !dbg !374

for.cond4.i11.preheader.lr.ph.iter47:             ; preds = %for.cond1.preheader.i4.iter47
  br label %for.cond4.i11.preheader.iter47, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter47:       ; preds = %for.inc15.i14.iter47
  %split.iter47 = phi i32 [ %add14.i15.iter47, %for.inc15.i14.iter47 ]
  br label %for.inc17.i8.iter47, !dbg !313

iter_47_end:                                      ; preds = %for.inc17.i8.iter47
  br label %iter_48_start

iter_48_start:                                    ; preds = %iter_47_end
  br label %for.cond1.preheader.i4.iter48

for.cond1.preheader.i4.iter48:                    ; preds = %iter_48_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %439 = add i32 %split.iter47, 30, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter48, !dbg !313

for.body6.i17.iter48:                             ; preds = %for.cond4.i11.preheader.iter48, %m_vec_mul_add.exit.iter48
  %k.0.i1270.iter48 = phi i32 [ 0, %for.cond4.i11.preheader.iter48 ], [ %add13.i.iter48, %m_vec_mul_add.exit.iter48 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter48 = mul nsw i32 %bs_mat_entries_used.1.i72.iter48, 40, !dbg !319
  %add.ptr.i19.iter48 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter48, !dbg !319
  %mul8.i20.iter48 = shl nuw nsw i32 %c.0.i673.iter48, 3, !dbg !322
  %440 = getelementptr i8, ptr %O, i32 %mul8.i20.iter48, !dbg !323
  %arrayidx.i21.iter48 = getelementptr i8, ptr %440, i32 %k.0.i1270.iter48, !dbg !323
  %441 = load i8, ptr %arrayidx.i21.iter48, align 1, !dbg !323
  %add10.i.iter48 = or disjoint i32 384, %k.0.i1270.iter48, !dbg !324
  %add.ptr12.idx.i.iter48 = mul nuw nsw i32 %add10.i.iter48, 40, !dbg !325
  %add.ptr12.i.iter48 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter48, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter48 = zext i8 %441 to i32, !dbg !330
  %mul.i.i.iter48 = mul i32 %conv.i.i.iter48, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter48 = and i32 %mul.i.i.iter48, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter48 = lshr exact i32 %and.i.i.iter48, 4, !dbg !333
  %shr1.i.i.iter48 = lshr exact i32 %and.i.i.iter48, 3, !dbg !334
  %442 = xor i32 %shr.i.i.iter48, %shr1.i.i.iter48, !dbg !335
  %xor2.i.i.iter48 = xor i32 %442, %mul.i.i.iter48, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter48, !dbg !337

for.body.i.iter48:                                ; preds = %for.body.i.iter48, %for.body6.i17.iter48
  %i.0.i69.iter48 = phi i32 [ 0, %for.body6.i17.iter48 ], [ %inc.i26.iter48, %for.body.i.iter48 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter48, i32 %i.0.i69.iter48, !dbg !338
  %443 = load i64, ptr %arrayidx.i24.iter48, align 8, !dbg !338
  %and.i.iter48 = and i64 %443, 1229782938247303441, !dbg !339
  %and1.i.iter48 = and i32 %xor2.i.i.iter48, 255, !dbg !340
  %conv.i.iter48 = zext nneg i32 %and1.i.iter48 to i64, !dbg !341
  %mul.i25.iter48 = mul i64 %and.i.iter48, %conv.i.iter48, !dbg !342
  %shr.i.iter48 = lshr i64 %443, 1, !dbg !343
  %and3.i.iter48 = and i64 %shr.i.iter48, 1229782938247303441, !dbg !344
  %shr4.i.iter48 = lshr i32 %xor2.i.i.iter48, 8, !dbg !345
  %and5.i.iter48 = and i32 %shr4.i.iter48, 15, !dbg !346
  %conv6.i.iter48 = zext nneg i32 %and5.i.iter48 to i64, !dbg !347
  %mul7.i.iter48 = mul nuw i64 %and3.i.iter48, %conv6.i.iter48, !dbg !348
  %xor.i.iter48 = xor i64 %mul.i25.iter48, %mul7.i.iter48, !dbg !349
  %arrayidx8.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter48, i32 %i.0.i69.iter48, !dbg !350
  %444 = load i64, ptr %arrayidx8.i.iter48, align 8, !dbg !350
  %shr9.i.iter48 = lshr i64 %444, 2, !dbg !351
  %and10.i.iter48 = and i64 %shr9.i.iter48, 1229782938247303441, !dbg !352
  %shr11.i.iter48 = lshr i32 %xor2.i.i.iter48, 16, !dbg !353
  %and12.i.iter48 = and i32 %shr11.i.iter48, 15, !dbg !354
  %conv13.i.iter48 = zext nneg i32 %and12.i.iter48 to i64, !dbg !355
  %mul14.i.iter48 = mul nuw i64 %and10.i.iter48, %conv13.i.iter48, !dbg !356
  %xor15.i.iter48 = xor i64 %xor.i.iter48, %mul14.i.iter48, !dbg !357
  %arrayidx16.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter48, i32 %i.0.i69.iter48, !dbg !358
  %445 = load i64, ptr %arrayidx16.i.iter48, align 8, !dbg !358
  %shr17.i.iter48 = lshr i64 %445, 3, !dbg !359
  %and18.i.iter48 = and i64 %shr17.i.iter48, 1229782938247303441, !dbg !360
  %shr19.i.iter48 = lshr i32 %xor2.i.i.iter48, 24, !dbg !361
  %and20.i.iter48 = and i32 %shr19.i.iter48, 15, !dbg !362
  %conv21.i.iter48 = zext nneg i32 %and20.i.iter48 to i64, !dbg !363
  %mul22.i.iter48 = mul nuw i64 %and18.i.iter48, %conv21.i.iter48, !dbg !364
  %xor23.i.iter48 = xor i64 %xor15.i.iter48, %mul22.i.iter48, !dbg !365
  %arrayidx24.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter48, i32 %i.0.i69.iter48, !dbg !366
  %446 = load i64, ptr %arrayidx24.i.iter48, align 8, !dbg !367
  %xor25.i.iter48 = xor i64 %446, %xor23.i.iter48, !dbg !367
  store i64 %xor25.i.iter48, ptr %arrayidx24.i.iter48, align 8, !dbg !367
  %inc.i26.iter48 = add nuw nsw i32 %i.0.i69.iter48, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter48 = icmp eq i32 %inc.i26.iter48, 5, !dbg !369
  br i1 %exitcond.i23.not.iter48, label %m_vec_mul_add.exit.iter48, label %for.body.i.iter48, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter48:                        ; preds = %for.body.i.iter48
  %add13.i.iter48 = add nuw nsw i32 %k.0.i1270.iter48, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter48 = icmp eq i32 %add13.i.iter48, 8, !dbg !373
  br i1 %exitcond.i13.not.iter48, label %for.inc15.i14.iter48, label %for.body6.i17.iter48, !dbg !374, !llvm.loop !375

for.inc15.i14.iter48:                             ; preds = %m_vec_mul_add.exit.iter48
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter48 = add i32 %bs_mat_entries_used.1.i72.iter48, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter48 = add nuw nsw i32 %c.0.i673.iter48, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter48 = icmp eq i32 %add14.i15.iter48, %439, !dbg !379
  br i1 %exitcond1.i7.not.iter48, label %for.cond1.i5.for.inc17.i8_crit_edge.iter48, label %for.cond4.i11.preheader.iter48, !dbg !313, !llvm.loop !380

for.inc17.i8.iter48:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter48
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_48_end

for.cond4.i11.preheader.iter48:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter48, %for.inc15.i14.iter48
  %c.0.i673.iter48 = phi i32 [ 48, %for.cond4.i11.preheader.lr.ph.iter48 ], [ %inc.i16.iter48, %for.inc15.i14.iter48 ]
  %bs_mat_entries_used.1.i72.iter48 = phi i32 [ %split.iter47, %for.cond4.i11.preheader.lr.ph.iter48 ], [ %add14.i15.iter48, %for.inc15.i14.iter48 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter48, !dbg !374

for.cond4.i11.preheader.lr.ph.iter48:             ; preds = %for.cond1.preheader.i4.iter48
  br label %for.cond4.i11.preheader.iter48, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter48:       ; preds = %for.inc15.i14.iter48
  %split.iter48 = phi i32 [ %add14.i15.iter48, %for.inc15.i14.iter48 ]
  br label %for.inc17.i8.iter48, !dbg !313

iter_48_end:                                      ; preds = %for.inc17.i8.iter48
  br label %iter_49_start

iter_49_start:                                    ; preds = %iter_48_end
  br label %for.cond1.preheader.i4.iter49

for.cond1.preheader.i4.iter49:                    ; preds = %iter_49_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %447 = add i32 %split.iter48, 29, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter49, !dbg !313

for.body6.i17.iter49:                             ; preds = %for.cond4.i11.preheader.iter49, %m_vec_mul_add.exit.iter49
  %k.0.i1270.iter49 = phi i32 [ 0, %for.cond4.i11.preheader.iter49 ], [ %add13.i.iter49, %m_vec_mul_add.exit.iter49 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter49 = mul nsw i32 %bs_mat_entries_used.1.i72.iter49, 40, !dbg !319
  %add.ptr.i19.iter49 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter49, !dbg !319
  %mul8.i20.iter49 = shl nuw nsw i32 %c.0.i673.iter49, 3, !dbg !322
  %448 = getelementptr i8, ptr %O, i32 %mul8.i20.iter49, !dbg !323
  %arrayidx.i21.iter49 = getelementptr i8, ptr %448, i32 %k.0.i1270.iter49, !dbg !323
  %449 = load i8, ptr %arrayidx.i21.iter49, align 1, !dbg !323
  %add10.i.iter49 = or disjoint i32 392, %k.0.i1270.iter49, !dbg !324
  %add.ptr12.idx.i.iter49 = mul nuw nsw i32 %add10.i.iter49, 40, !dbg !325
  %add.ptr12.i.iter49 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter49, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter49 = zext i8 %449 to i32, !dbg !330
  %mul.i.i.iter49 = mul i32 %conv.i.i.iter49, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter49 = and i32 %mul.i.i.iter49, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter49 = lshr exact i32 %and.i.i.iter49, 4, !dbg !333
  %shr1.i.i.iter49 = lshr exact i32 %and.i.i.iter49, 3, !dbg !334
  %450 = xor i32 %shr.i.i.iter49, %shr1.i.i.iter49, !dbg !335
  %xor2.i.i.iter49 = xor i32 %450, %mul.i.i.iter49, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter49, !dbg !337

for.body.i.iter49:                                ; preds = %for.body.i.iter49, %for.body6.i17.iter49
  %i.0.i69.iter49 = phi i32 [ 0, %for.body6.i17.iter49 ], [ %inc.i26.iter49, %for.body.i.iter49 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter49, i32 %i.0.i69.iter49, !dbg !338
  %451 = load i64, ptr %arrayidx.i24.iter49, align 8, !dbg !338
  %and.i.iter49 = and i64 %451, 1229782938247303441, !dbg !339
  %and1.i.iter49 = and i32 %xor2.i.i.iter49, 255, !dbg !340
  %conv.i.iter49 = zext nneg i32 %and1.i.iter49 to i64, !dbg !341
  %mul.i25.iter49 = mul i64 %and.i.iter49, %conv.i.iter49, !dbg !342
  %shr.i.iter49 = lshr i64 %451, 1, !dbg !343
  %and3.i.iter49 = and i64 %shr.i.iter49, 1229782938247303441, !dbg !344
  %shr4.i.iter49 = lshr i32 %xor2.i.i.iter49, 8, !dbg !345
  %and5.i.iter49 = and i32 %shr4.i.iter49, 15, !dbg !346
  %conv6.i.iter49 = zext nneg i32 %and5.i.iter49 to i64, !dbg !347
  %mul7.i.iter49 = mul nuw i64 %and3.i.iter49, %conv6.i.iter49, !dbg !348
  %xor.i.iter49 = xor i64 %mul.i25.iter49, %mul7.i.iter49, !dbg !349
  %arrayidx8.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter49, i32 %i.0.i69.iter49, !dbg !350
  %452 = load i64, ptr %arrayidx8.i.iter49, align 8, !dbg !350
  %shr9.i.iter49 = lshr i64 %452, 2, !dbg !351
  %and10.i.iter49 = and i64 %shr9.i.iter49, 1229782938247303441, !dbg !352
  %shr11.i.iter49 = lshr i32 %xor2.i.i.iter49, 16, !dbg !353
  %and12.i.iter49 = and i32 %shr11.i.iter49, 15, !dbg !354
  %conv13.i.iter49 = zext nneg i32 %and12.i.iter49 to i64, !dbg !355
  %mul14.i.iter49 = mul nuw i64 %and10.i.iter49, %conv13.i.iter49, !dbg !356
  %xor15.i.iter49 = xor i64 %xor.i.iter49, %mul14.i.iter49, !dbg !357
  %arrayidx16.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter49, i32 %i.0.i69.iter49, !dbg !358
  %453 = load i64, ptr %arrayidx16.i.iter49, align 8, !dbg !358
  %shr17.i.iter49 = lshr i64 %453, 3, !dbg !359
  %and18.i.iter49 = and i64 %shr17.i.iter49, 1229782938247303441, !dbg !360
  %shr19.i.iter49 = lshr i32 %xor2.i.i.iter49, 24, !dbg !361
  %and20.i.iter49 = and i32 %shr19.i.iter49, 15, !dbg !362
  %conv21.i.iter49 = zext nneg i32 %and20.i.iter49 to i64, !dbg !363
  %mul22.i.iter49 = mul nuw i64 %and18.i.iter49, %conv21.i.iter49, !dbg !364
  %xor23.i.iter49 = xor i64 %xor15.i.iter49, %mul22.i.iter49, !dbg !365
  %arrayidx24.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter49, i32 %i.0.i69.iter49, !dbg !366
  %454 = load i64, ptr %arrayidx24.i.iter49, align 8, !dbg !367
  %xor25.i.iter49 = xor i64 %454, %xor23.i.iter49, !dbg !367
  store i64 %xor25.i.iter49, ptr %arrayidx24.i.iter49, align 8, !dbg !367
  %inc.i26.iter49 = add nuw nsw i32 %i.0.i69.iter49, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter49 = icmp eq i32 %inc.i26.iter49, 5, !dbg !369
  br i1 %exitcond.i23.not.iter49, label %m_vec_mul_add.exit.iter49, label %for.body.i.iter49, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter49:                        ; preds = %for.body.i.iter49
  %add13.i.iter49 = add nuw nsw i32 %k.0.i1270.iter49, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter49 = icmp eq i32 %add13.i.iter49, 8, !dbg !373
  br i1 %exitcond.i13.not.iter49, label %for.inc15.i14.iter49, label %for.body6.i17.iter49, !dbg !374, !llvm.loop !375

for.inc15.i14.iter49:                             ; preds = %m_vec_mul_add.exit.iter49
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter49 = add i32 %bs_mat_entries_used.1.i72.iter49, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter49 = add nuw nsw i32 %c.0.i673.iter49, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter49 = icmp eq i32 %add14.i15.iter49, %447, !dbg !379
  br i1 %exitcond1.i7.not.iter49, label %for.cond1.i5.for.inc17.i8_crit_edge.iter49, label %for.cond4.i11.preheader.iter49, !dbg !313, !llvm.loop !380

for.inc17.i8.iter49:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter49
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_49_end

for.cond4.i11.preheader.iter49:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter49, %for.inc15.i14.iter49
  %c.0.i673.iter49 = phi i32 [ 49, %for.cond4.i11.preheader.lr.ph.iter49 ], [ %inc.i16.iter49, %for.inc15.i14.iter49 ]
  %bs_mat_entries_used.1.i72.iter49 = phi i32 [ %split.iter48, %for.cond4.i11.preheader.lr.ph.iter49 ], [ %add14.i15.iter49, %for.inc15.i14.iter49 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter49, !dbg !374

for.cond4.i11.preheader.lr.ph.iter49:             ; preds = %for.cond1.preheader.i4.iter49
  br label %for.cond4.i11.preheader.iter49, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter49:       ; preds = %for.inc15.i14.iter49
  %split.iter49 = phi i32 [ %add14.i15.iter49, %for.inc15.i14.iter49 ]
  br label %for.inc17.i8.iter49, !dbg !313

iter_49_end:                                      ; preds = %for.inc17.i8.iter49
  br label %iter_50_start

iter_50_start:                                    ; preds = %iter_49_end
  br label %for.cond1.preheader.i4.iter50

for.cond1.preheader.i4.iter50:                    ; preds = %iter_50_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %455 = add i32 %split.iter49, 28, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter50, !dbg !313

for.body6.i17.iter50:                             ; preds = %for.cond4.i11.preheader.iter50, %m_vec_mul_add.exit.iter50
  %k.0.i1270.iter50 = phi i32 [ 0, %for.cond4.i11.preheader.iter50 ], [ %add13.i.iter50, %m_vec_mul_add.exit.iter50 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter50 = mul nsw i32 %bs_mat_entries_used.1.i72.iter50, 40, !dbg !319
  %add.ptr.i19.iter50 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter50, !dbg !319
  %mul8.i20.iter50 = shl nuw nsw i32 %c.0.i673.iter50, 3, !dbg !322
  %456 = getelementptr i8, ptr %O, i32 %mul8.i20.iter50, !dbg !323
  %arrayidx.i21.iter50 = getelementptr i8, ptr %456, i32 %k.0.i1270.iter50, !dbg !323
  %457 = load i8, ptr %arrayidx.i21.iter50, align 1, !dbg !323
  %add10.i.iter50 = or disjoint i32 400, %k.0.i1270.iter50, !dbg !324
  %add.ptr12.idx.i.iter50 = mul nuw nsw i32 %add10.i.iter50, 40, !dbg !325
  %add.ptr12.i.iter50 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter50, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter50 = zext i8 %457 to i32, !dbg !330
  %mul.i.i.iter50 = mul i32 %conv.i.i.iter50, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter50 = and i32 %mul.i.i.iter50, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter50 = lshr exact i32 %and.i.i.iter50, 4, !dbg !333
  %shr1.i.i.iter50 = lshr exact i32 %and.i.i.iter50, 3, !dbg !334
  %458 = xor i32 %shr.i.i.iter50, %shr1.i.i.iter50, !dbg !335
  %xor2.i.i.iter50 = xor i32 %458, %mul.i.i.iter50, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter50, !dbg !337

for.body.i.iter50:                                ; preds = %for.body.i.iter50, %for.body6.i17.iter50
  %i.0.i69.iter50 = phi i32 [ 0, %for.body6.i17.iter50 ], [ %inc.i26.iter50, %for.body.i.iter50 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter50, i32 %i.0.i69.iter50, !dbg !338
  %459 = load i64, ptr %arrayidx.i24.iter50, align 8, !dbg !338
  %and.i.iter50 = and i64 %459, 1229782938247303441, !dbg !339
  %and1.i.iter50 = and i32 %xor2.i.i.iter50, 255, !dbg !340
  %conv.i.iter50 = zext nneg i32 %and1.i.iter50 to i64, !dbg !341
  %mul.i25.iter50 = mul i64 %and.i.iter50, %conv.i.iter50, !dbg !342
  %shr.i.iter50 = lshr i64 %459, 1, !dbg !343
  %and3.i.iter50 = and i64 %shr.i.iter50, 1229782938247303441, !dbg !344
  %shr4.i.iter50 = lshr i32 %xor2.i.i.iter50, 8, !dbg !345
  %and5.i.iter50 = and i32 %shr4.i.iter50, 15, !dbg !346
  %conv6.i.iter50 = zext nneg i32 %and5.i.iter50 to i64, !dbg !347
  %mul7.i.iter50 = mul nuw i64 %and3.i.iter50, %conv6.i.iter50, !dbg !348
  %xor.i.iter50 = xor i64 %mul.i25.iter50, %mul7.i.iter50, !dbg !349
  %arrayidx8.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter50, i32 %i.0.i69.iter50, !dbg !350
  %460 = load i64, ptr %arrayidx8.i.iter50, align 8, !dbg !350
  %shr9.i.iter50 = lshr i64 %460, 2, !dbg !351
  %and10.i.iter50 = and i64 %shr9.i.iter50, 1229782938247303441, !dbg !352
  %shr11.i.iter50 = lshr i32 %xor2.i.i.iter50, 16, !dbg !353
  %and12.i.iter50 = and i32 %shr11.i.iter50, 15, !dbg !354
  %conv13.i.iter50 = zext nneg i32 %and12.i.iter50 to i64, !dbg !355
  %mul14.i.iter50 = mul nuw i64 %and10.i.iter50, %conv13.i.iter50, !dbg !356
  %xor15.i.iter50 = xor i64 %xor.i.iter50, %mul14.i.iter50, !dbg !357
  %arrayidx16.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter50, i32 %i.0.i69.iter50, !dbg !358
  %461 = load i64, ptr %arrayidx16.i.iter50, align 8, !dbg !358
  %shr17.i.iter50 = lshr i64 %461, 3, !dbg !359
  %and18.i.iter50 = and i64 %shr17.i.iter50, 1229782938247303441, !dbg !360
  %shr19.i.iter50 = lshr i32 %xor2.i.i.iter50, 24, !dbg !361
  %and20.i.iter50 = and i32 %shr19.i.iter50, 15, !dbg !362
  %conv21.i.iter50 = zext nneg i32 %and20.i.iter50 to i64, !dbg !363
  %mul22.i.iter50 = mul nuw i64 %and18.i.iter50, %conv21.i.iter50, !dbg !364
  %xor23.i.iter50 = xor i64 %xor15.i.iter50, %mul22.i.iter50, !dbg !365
  %arrayidx24.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter50, i32 %i.0.i69.iter50, !dbg !366
  %462 = load i64, ptr %arrayidx24.i.iter50, align 8, !dbg !367
  %xor25.i.iter50 = xor i64 %462, %xor23.i.iter50, !dbg !367
  store i64 %xor25.i.iter50, ptr %arrayidx24.i.iter50, align 8, !dbg !367
  %inc.i26.iter50 = add nuw nsw i32 %i.0.i69.iter50, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter50 = icmp eq i32 %inc.i26.iter50, 5, !dbg !369
  br i1 %exitcond.i23.not.iter50, label %m_vec_mul_add.exit.iter50, label %for.body.i.iter50, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter50:                        ; preds = %for.body.i.iter50
  %add13.i.iter50 = add nuw nsw i32 %k.0.i1270.iter50, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter50 = icmp eq i32 %add13.i.iter50, 8, !dbg !373
  br i1 %exitcond.i13.not.iter50, label %for.inc15.i14.iter50, label %for.body6.i17.iter50, !dbg !374, !llvm.loop !375

for.inc15.i14.iter50:                             ; preds = %m_vec_mul_add.exit.iter50
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter50 = add i32 %bs_mat_entries_used.1.i72.iter50, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter50 = add nuw nsw i32 %c.0.i673.iter50, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter50 = icmp eq i32 %add14.i15.iter50, %455, !dbg !379
  br i1 %exitcond1.i7.not.iter50, label %for.cond1.i5.for.inc17.i8_crit_edge.iter50, label %for.cond4.i11.preheader.iter50, !dbg !313, !llvm.loop !380

for.inc17.i8.iter50:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter50
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_50_end

for.cond4.i11.preheader.iter50:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter50, %for.inc15.i14.iter50
  %c.0.i673.iter50 = phi i32 [ 50, %for.cond4.i11.preheader.lr.ph.iter50 ], [ %inc.i16.iter50, %for.inc15.i14.iter50 ]
  %bs_mat_entries_used.1.i72.iter50 = phi i32 [ %split.iter49, %for.cond4.i11.preheader.lr.ph.iter50 ], [ %add14.i15.iter50, %for.inc15.i14.iter50 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter50, !dbg !374

for.cond4.i11.preheader.lr.ph.iter50:             ; preds = %for.cond1.preheader.i4.iter50
  br label %for.cond4.i11.preheader.iter50, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter50:       ; preds = %for.inc15.i14.iter50
  %split.iter50 = phi i32 [ %add14.i15.iter50, %for.inc15.i14.iter50 ]
  br label %for.inc17.i8.iter50, !dbg !313

iter_50_end:                                      ; preds = %for.inc17.i8.iter50
  br label %iter_51_start

iter_51_start:                                    ; preds = %iter_50_end
  br label %for.cond1.preheader.i4.iter51

for.cond1.preheader.i4.iter51:                    ; preds = %iter_51_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %463 = add i32 %split.iter50, 27, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter51, !dbg !313

for.body6.i17.iter51:                             ; preds = %for.cond4.i11.preheader.iter51, %m_vec_mul_add.exit.iter51
  %k.0.i1270.iter51 = phi i32 [ 0, %for.cond4.i11.preheader.iter51 ], [ %add13.i.iter51, %m_vec_mul_add.exit.iter51 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter51 = mul nsw i32 %bs_mat_entries_used.1.i72.iter51, 40, !dbg !319
  %add.ptr.i19.iter51 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter51, !dbg !319
  %mul8.i20.iter51 = shl nuw nsw i32 %c.0.i673.iter51, 3, !dbg !322
  %464 = getelementptr i8, ptr %O, i32 %mul8.i20.iter51, !dbg !323
  %arrayidx.i21.iter51 = getelementptr i8, ptr %464, i32 %k.0.i1270.iter51, !dbg !323
  %465 = load i8, ptr %arrayidx.i21.iter51, align 1, !dbg !323
  %add10.i.iter51 = or disjoint i32 408, %k.0.i1270.iter51, !dbg !324
  %add.ptr12.idx.i.iter51 = mul nuw nsw i32 %add10.i.iter51, 40, !dbg !325
  %add.ptr12.i.iter51 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter51, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter51 = zext i8 %465 to i32, !dbg !330
  %mul.i.i.iter51 = mul i32 %conv.i.i.iter51, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter51 = and i32 %mul.i.i.iter51, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter51 = lshr exact i32 %and.i.i.iter51, 4, !dbg !333
  %shr1.i.i.iter51 = lshr exact i32 %and.i.i.iter51, 3, !dbg !334
  %466 = xor i32 %shr.i.i.iter51, %shr1.i.i.iter51, !dbg !335
  %xor2.i.i.iter51 = xor i32 %466, %mul.i.i.iter51, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter51, !dbg !337

for.body.i.iter51:                                ; preds = %for.body.i.iter51, %for.body6.i17.iter51
  %i.0.i69.iter51 = phi i32 [ 0, %for.body6.i17.iter51 ], [ %inc.i26.iter51, %for.body.i.iter51 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter51, i32 %i.0.i69.iter51, !dbg !338
  %467 = load i64, ptr %arrayidx.i24.iter51, align 8, !dbg !338
  %and.i.iter51 = and i64 %467, 1229782938247303441, !dbg !339
  %and1.i.iter51 = and i32 %xor2.i.i.iter51, 255, !dbg !340
  %conv.i.iter51 = zext nneg i32 %and1.i.iter51 to i64, !dbg !341
  %mul.i25.iter51 = mul i64 %and.i.iter51, %conv.i.iter51, !dbg !342
  %shr.i.iter51 = lshr i64 %467, 1, !dbg !343
  %and3.i.iter51 = and i64 %shr.i.iter51, 1229782938247303441, !dbg !344
  %shr4.i.iter51 = lshr i32 %xor2.i.i.iter51, 8, !dbg !345
  %and5.i.iter51 = and i32 %shr4.i.iter51, 15, !dbg !346
  %conv6.i.iter51 = zext nneg i32 %and5.i.iter51 to i64, !dbg !347
  %mul7.i.iter51 = mul nuw i64 %and3.i.iter51, %conv6.i.iter51, !dbg !348
  %xor.i.iter51 = xor i64 %mul.i25.iter51, %mul7.i.iter51, !dbg !349
  %arrayidx8.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter51, i32 %i.0.i69.iter51, !dbg !350
  %468 = load i64, ptr %arrayidx8.i.iter51, align 8, !dbg !350
  %shr9.i.iter51 = lshr i64 %468, 2, !dbg !351
  %and10.i.iter51 = and i64 %shr9.i.iter51, 1229782938247303441, !dbg !352
  %shr11.i.iter51 = lshr i32 %xor2.i.i.iter51, 16, !dbg !353
  %and12.i.iter51 = and i32 %shr11.i.iter51, 15, !dbg !354
  %conv13.i.iter51 = zext nneg i32 %and12.i.iter51 to i64, !dbg !355
  %mul14.i.iter51 = mul nuw i64 %and10.i.iter51, %conv13.i.iter51, !dbg !356
  %xor15.i.iter51 = xor i64 %xor.i.iter51, %mul14.i.iter51, !dbg !357
  %arrayidx16.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter51, i32 %i.0.i69.iter51, !dbg !358
  %469 = load i64, ptr %arrayidx16.i.iter51, align 8, !dbg !358
  %shr17.i.iter51 = lshr i64 %469, 3, !dbg !359
  %and18.i.iter51 = and i64 %shr17.i.iter51, 1229782938247303441, !dbg !360
  %shr19.i.iter51 = lshr i32 %xor2.i.i.iter51, 24, !dbg !361
  %and20.i.iter51 = and i32 %shr19.i.iter51, 15, !dbg !362
  %conv21.i.iter51 = zext nneg i32 %and20.i.iter51 to i64, !dbg !363
  %mul22.i.iter51 = mul nuw i64 %and18.i.iter51, %conv21.i.iter51, !dbg !364
  %xor23.i.iter51 = xor i64 %xor15.i.iter51, %mul22.i.iter51, !dbg !365
  %arrayidx24.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter51, i32 %i.0.i69.iter51, !dbg !366
  %470 = load i64, ptr %arrayidx24.i.iter51, align 8, !dbg !367
  %xor25.i.iter51 = xor i64 %470, %xor23.i.iter51, !dbg !367
  store i64 %xor25.i.iter51, ptr %arrayidx24.i.iter51, align 8, !dbg !367
  %inc.i26.iter51 = add nuw nsw i32 %i.0.i69.iter51, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter51 = icmp eq i32 %inc.i26.iter51, 5, !dbg !369
  br i1 %exitcond.i23.not.iter51, label %m_vec_mul_add.exit.iter51, label %for.body.i.iter51, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter51:                        ; preds = %for.body.i.iter51
  %add13.i.iter51 = add nuw nsw i32 %k.0.i1270.iter51, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter51 = icmp eq i32 %add13.i.iter51, 8, !dbg !373
  br i1 %exitcond.i13.not.iter51, label %for.inc15.i14.iter51, label %for.body6.i17.iter51, !dbg !374, !llvm.loop !375

for.inc15.i14.iter51:                             ; preds = %m_vec_mul_add.exit.iter51
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter51 = add i32 %bs_mat_entries_used.1.i72.iter51, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter51 = add nuw nsw i32 %c.0.i673.iter51, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter51 = icmp eq i32 %add14.i15.iter51, %463, !dbg !379
  br i1 %exitcond1.i7.not.iter51, label %for.cond1.i5.for.inc17.i8_crit_edge.iter51, label %for.cond4.i11.preheader.iter51, !dbg !313, !llvm.loop !380

for.inc17.i8.iter51:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter51
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_51_end

for.cond4.i11.preheader.iter51:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter51, %for.inc15.i14.iter51
  %c.0.i673.iter51 = phi i32 [ 51, %for.cond4.i11.preheader.lr.ph.iter51 ], [ %inc.i16.iter51, %for.inc15.i14.iter51 ]
  %bs_mat_entries_used.1.i72.iter51 = phi i32 [ %split.iter50, %for.cond4.i11.preheader.lr.ph.iter51 ], [ %add14.i15.iter51, %for.inc15.i14.iter51 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter51, !dbg !374

for.cond4.i11.preheader.lr.ph.iter51:             ; preds = %for.cond1.preheader.i4.iter51
  br label %for.cond4.i11.preheader.iter51, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter51:       ; preds = %for.inc15.i14.iter51
  %split.iter51 = phi i32 [ %add14.i15.iter51, %for.inc15.i14.iter51 ]
  br label %for.inc17.i8.iter51, !dbg !313

iter_51_end:                                      ; preds = %for.inc17.i8.iter51
  br label %iter_52_start

iter_52_start:                                    ; preds = %iter_51_end
  br label %for.cond1.preheader.i4.iter52

for.cond1.preheader.i4.iter52:                    ; preds = %iter_52_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %471 = add i32 %split.iter51, 26, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter52, !dbg !313

for.body6.i17.iter52:                             ; preds = %for.cond4.i11.preheader.iter52, %m_vec_mul_add.exit.iter52
  %k.0.i1270.iter52 = phi i32 [ 0, %for.cond4.i11.preheader.iter52 ], [ %add13.i.iter52, %m_vec_mul_add.exit.iter52 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter52 = mul nsw i32 %bs_mat_entries_used.1.i72.iter52, 40, !dbg !319
  %add.ptr.i19.iter52 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter52, !dbg !319
  %mul8.i20.iter52 = shl nuw nsw i32 %c.0.i673.iter52, 3, !dbg !322
  %472 = getelementptr i8, ptr %O, i32 %mul8.i20.iter52, !dbg !323
  %arrayidx.i21.iter52 = getelementptr i8, ptr %472, i32 %k.0.i1270.iter52, !dbg !323
  %473 = load i8, ptr %arrayidx.i21.iter52, align 1, !dbg !323
  %add10.i.iter52 = or disjoint i32 416, %k.0.i1270.iter52, !dbg !324
  %add.ptr12.idx.i.iter52 = mul nuw nsw i32 %add10.i.iter52, 40, !dbg !325
  %add.ptr12.i.iter52 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter52, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter52 = zext i8 %473 to i32, !dbg !330
  %mul.i.i.iter52 = mul i32 %conv.i.i.iter52, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter52 = and i32 %mul.i.i.iter52, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter52 = lshr exact i32 %and.i.i.iter52, 4, !dbg !333
  %shr1.i.i.iter52 = lshr exact i32 %and.i.i.iter52, 3, !dbg !334
  %474 = xor i32 %shr.i.i.iter52, %shr1.i.i.iter52, !dbg !335
  %xor2.i.i.iter52 = xor i32 %474, %mul.i.i.iter52, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter52, !dbg !337

for.body.i.iter52:                                ; preds = %for.body.i.iter52, %for.body6.i17.iter52
  %i.0.i69.iter52 = phi i32 [ 0, %for.body6.i17.iter52 ], [ %inc.i26.iter52, %for.body.i.iter52 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter52, i32 %i.0.i69.iter52, !dbg !338
  %475 = load i64, ptr %arrayidx.i24.iter52, align 8, !dbg !338
  %and.i.iter52 = and i64 %475, 1229782938247303441, !dbg !339
  %and1.i.iter52 = and i32 %xor2.i.i.iter52, 255, !dbg !340
  %conv.i.iter52 = zext nneg i32 %and1.i.iter52 to i64, !dbg !341
  %mul.i25.iter52 = mul i64 %and.i.iter52, %conv.i.iter52, !dbg !342
  %shr.i.iter52 = lshr i64 %475, 1, !dbg !343
  %and3.i.iter52 = and i64 %shr.i.iter52, 1229782938247303441, !dbg !344
  %shr4.i.iter52 = lshr i32 %xor2.i.i.iter52, 8, !dbg !345
  %and5.i.iter52 = and i32 %shr4.i.iter52, 15, !dbg !346
  %conv6.i.iter52 = zext nneg i32 %and5.i.iter52 to i64, !dbg !347
  %mul7.i.iter52 = mul nuw i64 %and3.i.iter52, %conv6.i.iter52, !dbg !348
  %xor.i.iter52 = xor i64 %mul.i25.iter52, %mul7.i.iter52, !dbg !349
  %arrayidx8.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter52, i32 %i.0.i69.iter52, !dbg !350
  %476 = load i64, ptr %arrayidx8.i.iter52, align 8, !dbg !350
  %shr9.i.iter52 = lshr i64 %476, 2, !dbg !351
  %and10.i.iter52 = and i64 %shr9.i.iter52, 1229782938247303441, !dbg !352
  %shr11.i.iter52 = lshr i32 %xor2.i.i.iter52, 16, !dbg !353
  %and12.i.iter52 = and i32 %shr11.i.iter52, 15, !dbg !354
  %conv13.i.iter52 = zext nneg i32 %and12.i.iter52 to i64, !dbg !355
  %mul14.i.iter52 = mul nuw i64 %and10.i.iter52, %conv13.i.iter52, !dbg !356
  %xor15.i.iter52 = xor i64 %xor.i.iter52, %mul14.i.iter52, !dbg !357
  %arrayidx16.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter52, i32 %i.0.i69.iter52, !dbg !358
  %477 = load i64, ptr %arrayidx16.i.iter52, align 8, !dbg !358
  %shr17.i.iter52 = lshr i64 %477, 3, !dbg !359
  %and18.i.iter52 = and i64 %shr17.i.iter52, 1229782938247303441, !dbg !360
  %shr19.i.iter52 = lshr i32 %xor2.i.i.iter52, 24, !dbg !361
  %and20.i.iter52 = and i32 %shr19.i.iter52, 15, !dbg !362
  %conv21.i.iter52 = zext nneg i32 %and20.i.iter52 to i64, !dbg !363
  %mul22.i.iter52 = mul nuw i64 %and18.i.iter52, %conv21.i.iter52, !dbg !364
  %xor23.i.iter52 = xor i64 %xor15.i.iter52, %mul22.i.iter52, !dbg !365
  %arrayidx24.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter52, i32 %i.0.i69.iter52, !dbg !366
  %478 = load i64, ptr %arrayidx24.i.iter52, align 8, !dbg !367
  %xor25.i.iter52 = xor i64 %478, %xor23.i.iter52, !dbg !367
  store i64 %xor25.i.iter52, ptr %arrayidx24.i.iter52, align 8, !dbg !367
  %inc.i26.iter52 = add nuw nsw i32 %i.0.i69.iter52, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter52 = icmp eq i32 %inc.i26.iter52, 5, !dbg !369
  br i1 %exitcond.i23.not.iter52, label %m_vec_mul_add.exit.iter52, label %for.body.i.iter52, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter52:                        ; preds = %for.body.i.iter52
  %add13.i.iter52 = add nuw nsw i32 %k.0.i1270.iter52, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter52 = icmp eq i32 %add13.i.iter52, 8, !dbg !373
  br i1 %exitcond.i13.not.iter52, label %for.inc15.i14.iter52, label %for.body6.i17.iter52, !dbg !374, !llvm.loop !375

for.inc15.i14.iter52:                             ; preds = %m_vec_mul_add.exit.iter52
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter52 = add i32 %bs_mat_entries_used.1.i72.iter52, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter52 = add nuw nsw i32 %c.0.i673.iter52, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter52 = icmp eq i32 %add14.i15.iter52, %471, !dbg !379
  br i1 %exitcond1.i7.not.iter52, label %for.cond1.i5.for.inc17.i8_crit_edge.iter52, label %for.cond4.i11.preheader.iter52, !dbg !313, !llvm.loop !380

for.inc17.i8.iter52:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter52
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_52_end

for.cond4.i11.preheader.iter52:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter52, %for.inc15.i14.iter52
  %c.0.i673.iter52 = phi i32 [ 52, %for.cond4.i11.preheader.lr.ph.iter52 ], [ %inc.i16.iter52, %for.inc15.i14.iter52 ]
  %bs_mat_entries_used.1.i72.iter52 = phi i32 [ %split.iter51, %for.cond4.i11.preheader.lr.ph.iter52 ], [ %add14.i15.iter52, %for.inc15.i14.iter52 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter52, !dbg !374

for.cond4.i11.preheader.lr.ph.iter52:             ; preds = %for.cond1.preheader.i4.iter52
  br label %for.cond4.i11.preheader.iter52, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter52:       ; preds = %for.inc15.i14.iter52
  %split.iter52 = phi i32 [ %add14.i15.iter52, %for.inc15.i14.iter52 ]
  br label %for.inc17.i8.iter52, !dbg !313

iter_52_end:                                      ; preds = %for.inc17.i8.iter52
  br label %iter_53_start

iter_53_start:                                    ; preds = %iter_52_end
  br label %for.cond1.preheader.i4.iter53

for.cond1.preheader.i4.iter53:                    ; preds = %iter_53_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %479 = add i32 %split.iter52, 25, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter53, !dbg !313

for.body6.i17.iter53:                             ; preds = %for.cond4.i11.preheader.iter53, %m_vec_mul_add.exit.iter53
  %k.0.i1270.iter53 = phi i32 [ 0, %for.cond4.i11.preheader.iter53 ], [ %add13.i.iter53, %m_vec_mul_add.exit.iter53 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter53 = mul nsw i32 %bs_mat_entries_used.1.i72.iter53, 40, !dbg !319
  %add.ptr.i19.iter53 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter53, !dbg !319
  %mul8.i20.iter53 = shl nuw nsw i32 %c.0.i673.iter53, 3, !dbg !322
  %480 = getelementptr i8, ptr %O, i32 %mul8.i20.iter53, !dbg !323
  %arrayidx.i21.iter53 = getelementptr i8, ptr %480, i32 %k.0.i1270.iter53, !dbg !323
  %481 = load i8, ptr %arrayidx.i21.iter53, align 1, !dbg !323
  %add10.i.iter53 = or disjoint i32 424, %k.0.i1270.iter53, !dbg !324
  %add.ptr12.idx.i.iter53 = mul nuw nsw i32 %add10.i.iter53, 40, !dbg !325
  %add.ptr12.i.iter53 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter53, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter53 = zext i8 %481 to i32, !dbg !330
  %mul.i.i.iter53 = mul i32 %conv.i.i.iter53, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter53 = and i32 %mul.i.i.iter53, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter53 = lshr exact i32 %and.i.i.iter53, 4, !dbg !333
  %shr1.i.i.iter53 = lshr exact i32 %and.i.i.iter53, 3, !dbg !334
  %482 = xor i32 %shr.i.i.iter53, %shr1.i.i.iter53, !dbg !335
  %xor2.i.i.iter53 = xor i32 %482, %mul.i.i.iter53, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter53, !dbg !337

for.body.i.iter53:                                ; preds = %for.body.i.iter53, %for.body6.i17.iter53
  %i.0.i69.iter53 = phi i32 [ 0, %for.body6.i17.iter53 ], [ %inc.i26.iter53, %for.body.i.iter53 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter53, i32 %i.0.i69.iter53, !dbg !338
  %483 = load i64, ptr %arrayidx.i24.iter53, align 8, !dbg !338
  %and.i.iter53 = and i64 %483, 1229782938247303441, !dbg !339
  %and1.i.iter53 = and i32 %xor2.i.i.iter53, 255, !dbg !340
  %conv.i.iter53 = zext nneg i32 %and1.i.iter53 to i64, !dbg !341
  %mul.i25.iter53 = mul i64 %and.i.iter53, %conv.i.iter53, !dbg !342
  %shr.i.iter53 = lshr i64 %483, 1, !dbg !343
  %and3.i.iter53 = and i64 %shr.i.iter53, 1229782938247303441, !dbg !344
  %shr4.i.iter53 = lshr i32 %xor2.i.i.iter53, 8, !dbg !345
  %and5.i.iter53 = and i32 %shr4.i.iter53, 15, !dbg !346
  %conv6.i.iter53 = zext nneg i32 %and5.i.iter53 to i64, !dbg !347
  %mul7.i.iter53 = mul nuw i64 %and3.i.iter53, %conv6.i.iter53, !dbg !348
  %xor.i.iter53 = xor i64 %mul.i25.iter53, %mul7.i.iter53, !dbg !349
  %arrayidx8.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter53, i32 %i.0.i69.iter53, !dbg !350
  %484 = load i64, ptr %arrayidx8.i.iter53, align 8, !dbg !350
  %shr9.i.iter53 = lshr i64 %484, 2, !dbg !351
  %and10.i.iter53 = and i64 %shr9.i.iter53, 1229782938247303441, !dbg !352
  %shr11.i.iter53 = lshr i32 %xor2.i.i.iter53, 16, !dbg !353
  %and12.i.iter53 = and i32 %shr11.i.iter53, 15, !dbg !354
  %conv13.i.iter53 = zext nneg i32 %and12.i.iter53 to i64, !dbg !355
  %mul14.i.iter53 = mul nuw i64 %and10.i.iter53, %conv13.i.iter53, !dbg !356
  %xor15.i.iter53 = xor i64 %xor.i.iter53, %mul14.i.iter53, !dbg !357
  %arrayidx16.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter53, i32 %i.0.i69.iter53, !dbg !358
  %485 = load i64, ptr %arrayidx16.i.iter53, align 8, !dbg !358
  %shr17.i.iter53 = lshr i64 %485, 3, !dbg !359
  %and18.i.iter53 = and i64 %shr17.i.iter53, 1229782938247303441, !dbg !360
  %shr19.i.iter53 = lshr i32 %xor2.i.i.iter53, 24, !dbg !361
  %and20.i.iter53 = and i32 %shr19.i.iter53, 15, !dbg !362
  %conv21.i.iter53 = zext nneg i32 %and20.i.iter53 to i64, !dbg !363
  %mul22.i.iter53 = mul nuw i64 %and18.i.iter53, %conv21.i.iter53, !dbg !364
  %xor23.i.iter53 = xor i64 %xor15.i.iter53, %mul22.i.iter53, !dbg !365
  %arrayidx24.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter53, i32 %i.0.i69.iter53, !dbg !366
  %486 = load i64, ptr %arrayidx24.i.iter53, align 8, !dbg !367
  %xor25.i.iter53 = xor i64 %486, %xor23.i.iter53, !dbg !367
  store i64 %xor25.i.iter53, ptr %arrayidx24.i.iter53, align 8, !dbg !367
  %inc.i26.iter53 = add nuw nsw i32 %i.0.i69.iter53, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter53 = icmp eq i32 %inc.i26.iter53, 5, !dbg !369
  br i1 %exitcond.i23.not.iter53, label %m_vec_mul_add.exit.iter53, label %for.body.i.iter53, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter53:                        ; preds = %for.body.i.iter53
  %add13.i.iter53 = add nuw nsw i32 %k.0.i1270.iter53, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter53 = icmp eq i32 %add13.i.iter53, 8, !dbg !373
  br i1 %exitcond.i13.not.iter53, label %for.inc15.i14.iter53, label %for.body6.i17.iter53, !dbg !374, !llvm.loop !375

for.inc15.i14.iter53:                             ; preds = %m_vec_mul_add.exit.iter53
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter53 = add i32 %bs_mat_entries_used.1.i72.iter53, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter53 = add nuw nsw i32 %c.0.i673.iter53, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter53 = icmp eq i32 %add14.i15.iter53, %479, !dbg !379
  br i1 %exitcond1.i7.not.iter53, label %for.cond1.i5.for.inc17.i8_crit_edge.iter53, label %for.cond4.i11.preheader.iter53, !dbg !313, !llvm.loop !380

for.inc17.i8.iter53:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter53
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_53_end

for.cond4.i11.preheader.iter53:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter53, %for.inc15.i14.iter53
  %c.0.i673.iter53 = phi i32 [ 53, %for.cond4.i11.preheader.lr.ph.iter53 ], [ %inc.i16.iter53, %for.inc15.i14.iter53 ]
  %bs_mat_entries_used.1.i72.iter53 = phi i32 [ %split.iter52, %for.cond4.i11.preheader.lr.ph.iter53 ], [ %add14.i15.iter53, %for.inc15.i14.iter53 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter53, !dbg !374

for.cond4.i11.preheader.lr.ph.iter53:             ; preds = %for.cond1.preheader.i4.iter53
  br label %for.cond4.i11.preheader.iter53, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter53:       ; preds = %for.inc15.i14.iter53
  %split.iter53 = phi i32 [ %add14.i15.iter53, %for.inc15.i14.iter53 ]
  br label %for.inc17.i8.iter53, !dbg !313

iter_53_end:                                      ; preds = %for.inc17.i8.iter53
  br label %iter_54_start

iter_54_start:                                    ; preds = %iter_53_end
  br label %for.cond1.preheader.i4.iter54

for.cond1.preheader.i4.iter54:                    ; preds = %iter_54_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %487 = add i32 %split.iter53, 24, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter54, !dbg !313

for.body6.i17.iter54:                             ; preds = %for.cond4.i11.preheader.iter54, %m_vec_mul_add.exit.iter54
  %k.0.i1270.iter54 = phi i32 [ 0, %for.cond4.i11.preheader.iter54 ], [ %add13.i.iter54, %m_vec_mul_add.exit.iter54 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter54 = mul nsw i32 %bs_mat_entries_used.1.i72.iter54, 40, !dbg !319
  %add.ptr.i19.iter54 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter54, !dbg !319
  %mul8.i20.iter54 = shl nuw nsw i32 %c.0.i673.iter54, 3, !dbg !322
  %488 = getelementptr i8, ptr %O, i32 %mul8.i20.iter54, !dbg !323
  %arrayidx.i21.iter54 = getelementptr i8, ptr %488, i32 %k.0.i1270.iter54, !dbg !323
  %489 = load i8, ptr %arrayidx.i21.iter54, align 1, !dbg !323
  %add10.i.iter54 = or disjoint i32 432, %k.0.i1270.iter54, !dbg !324
  %add.ptr12.idx.i.iter54 = mul nuw nsw i32 %add10.i.iter54, 40, !dbg !325
  %add.ptr12.i.iter54 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter54, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter54 = zext i8 %489 to i32, !dbg !330
  %mul.i.i.iter54 = mul i32 %conv.i.i.iter54, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter54 = and i32 %mul.i.i.iter54, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter54 = lshr exact i32 %and.i.i.iter54, 4, !dbg !333
  %shr1.i.i.iter54 = lshr exact i32 %and.i.i.iter54, 3, !dbg !334
  %490 = xor i32 %shr.i.i.iter54, %shr1.i.i.iter54, !dbg !335
  %xor2.i.i.iter54 = xor i32 %490, %mul.i.i.iter54, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter54, !dbg !337

for.body.i.iter54:                                ; preds = %for.body.i.iter54, %for.body6.i17.iter54
  %i.0.i69.iter54 = phi i32 [ 0, %for.body6.i17.iter54 ], [ %inc.i26.iter54, %for.body.i.iter54 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter54, i32 %i.0.i69.iter54, !dbg !338
  %491 = load i64, ptr %arrayidx.i24.iter54, align 8, !dbg !338
  %and.i.iter54 = and i64 %491, 1229782938247303441, !dbg !339
  %and1.i.iter54 = and i32 %xor2.i.i.iter54, 255, !dbg !340
  %conv.i.iter54 = zext nneg i32 %and1.i.iter54 to i64, !dbg !341
  %mul.i25.iter54 = mul i64 %and.i.iter54, %conv.i.iter54, !dbg !342
  %shr.i.iter54 = lshr i64 %491, 1, !dbg !343
  %and3.i.iter54 = and i64 %shr.i.iter54, 1229782938247303441, !dbg !344
  %shr4.i.iter54 = lshr i32 %xor2.i.i.iter54, 8, !dbg !345
  %and5.i.iter54 = and i32 %shr4.i.iter54, 15, !dbg !346
  %conv6.i.iter54 = zext nneg i32 %and5.i.iter54 to i64, !dbg !347
  %mul7.i.iter54 = mul nuw i64 %and3.i.iter54, %conv6.i.iter54, !dbg !348
  %xor.i.iter54 = xor i64 %mul.i25.iter54, %mul7.i.iter54, !dbg !349
  %arrayidx8.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter54, i32 %i.0.i69.iter54, !dbg !350
  %492 = load i64, ptr %arrayidx8.i.iter54, align 8, !dbg !350
  %shr9.i.iter54 = lshr i64 %492, 2, !dbg !351
  %and10.i.iter54 = and i64 %shr9.i.iter54, 1229782938247303441, !dbg !352
  %shr11.i.iter54 = lshr i32 %xor2.i.i.iter54, 16, !dbg !353
  %and12.i.iter54 = and i32 %shr11.i.iter54, 15, !dbg !354
  %conv13.i.iter54 = zext nneg i32 %and12.i.iter54 to i64, !dbg !355
  %mul14.i.iter54 = mul nuw i64 %and10.i.iter54, %conv13.i.iter54, !dbg !356
  %xor15.i.iter54 = xor i64 %xor.i.iter54, %mul14.i.iter54, !dbg !357
  %arrayidx16.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter54, i32 %i.0.i69.iter54, !dbg !358
  %493 = load i64, ptr %arrayidx16.i.iter54, align 8, !dbg !358
  %shr17.i.iter54 = lshr i64 %493, 3, !dbg !359
  %and18.i.iter54 = and i64 %shr17.i.iter54, 1229782938247303441, !dbg !360
  %shr19.i.iter54 = lshr i32 %xor2.i.i.iter54, 24, !dbg !361
  %and20.i.iter54 = and i32 %shr19.i.iter54, 15, !dbg !362
  %conv21.i.iter54 = zext nneg i32 %and20.i.iter54 to i64, !dbg !363
  %mul22.i.iter54 = mul nuw i64 %and18.i.iter54, %conv21.i.iter54, !dbg !364
  %xor23.i.iter54 = xor i64 %xor15.i.iter54, %mul22.i.iter54, !dbg !365
  %arrayidx24.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter54, i32 %i.0.i69.iter54, !dbg !366
  %494 = load i64, ptr %arrayidx24.i.iter54, align 8, !dbg !367
  %xor25.i.iter54 = xor i64 %494, %xor23.i.iter54, !dbg !367
  store i64 %xor25.i.iter54, ptr %arrayidx24.i.iter54, align 8, !dbg !367
  %inc.i26.iter54 = add nuw nsw i32 %i.0.i69.iter54, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter54 = icmp eq i32 %inc.i26.iter54, 5, !dbg !369
  br i1 %exitcond.i23.not.iter54, label %m_vec_mul_add.exit.iter54, label %for.body.i.iter54, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter54:                        ; preds = %for.body.i.iter54
  %add13.i.iter54 = add nuw nsw i32 %k.0.i1270.iter54, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter54 = icmp eq i32 %add13.i.iter54, 8, !dbg !373
  br i1 %exitcond.i13.not.iter54, label %for.inc15.i14.iter54, label %for.body6.i17.iter54, !dbg !374, !llvm.loop !375

for.inc15.i14.iter54:                             ; preds = %m_vec_mul_add.exit.iter54
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter54 = add i32 %bs_mat_entries_used.1.i72.iter54, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter54 = add nuw nsw i32 %c.0.i673.iter54, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter54 = icmp eq i32 %add14.i15.iter54, %487, !dbg !379
  br i1 %exitcond1.i7.not.iter54, label %for.cond1.i5.for.inc17.i8_crit_edge.iter54, label %for.cond4.i11.preheader.iter54, !dbg !313, !llvm.loop !380

for.inc17.i8.iter54:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter54
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_54_end

for.cond4.i11.preheader.iter54:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter54, %for.inc15.i14.iter54
  %c.0.i673.iter54 = phi i32 [ 54, %for.cond4.i11.preheader.lr.ph.iter54 ], [ %inc.i16.iter54, %for.inc15.i14.iter54 ]
  %bs_mat_entries_used.1.i72.iter54 = phi i32 [ %split.iter53, %for.cond4.i11.preheader.lr.ph.iter54 ], [ %add14.i15.iter54, %for.inc15.i14.iter54 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter54, !dbg !374

for.cond4.i11.preheader.lr.ph.iter54:             ; preds = %for.cond1.preheader.i4.iter54
  br label %for.cond4.i11.preheader.iter54, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter54:       ; preds = %for.inc15.i14.iter54
  %split.iter54 = phi i32 [ %add14.i15.iter54, %for.inc15.i14.iter54 ]
  br label %for.inc17.i8.iter54, !dbg !313

iter_54_end:                                      ; preds = %for.inc17.i8.iter54
  br label %iter_55_start

iter_55_start:                                    ; preds = %iter_54_end
  br label %for.cond1.preheader.i4.iter55

for.cond1.preheader.i4.iter55:                    ; preds = %iter_55_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %495 = add i32 %split.iter54, 23, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter55, !dbg !313

for.body6.i17.iter55:                             ; preds = %for.cond4.i11.preheader.iter55, %m_vec_mul_add.exit.iter55
  %k.0.i1270.iter55 = phi i32 [ 0, %for.cond4.i11.preheader.iter55 ], [ %add13.i.iter55, %m_vec_mul_add.exit.iter55 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter55 = mul nsw i32 %bs_mat_entries_used.1.i72.iter55, 40, !dbg !319
  %add.ptr.i19.iter55 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter55, !dbg !319
  %mul8.i20.iter55 = shl nuw nsw i32 %c.0.i673.iter55, 3, !dbg !322
  %496 = getelementptr i8, ptr %O, i32 %mul8.i20.iter55, !dbg !323
  %arrayidx.i21.iter55 = getelementptr i8, ptr %496, i32 %k.0.i1270.iter55, !dbg !323
  %497 = load i8, ptr %arrayidx.i21.iter55, align 1, !dbg !323
  %add10.i.iter55 = or disjoint i32 440, %k.0.i1270.iter55, !dbg !324
  %add.ptr12.idx.i.iter55 = mul nuw nsw i32 %add10.i.iter55, 40, !dbg !325
  %add.ptr12.i.iter55 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter55, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter55 = zext i8 %497 to i32, !dbg !330
  %mul.i.i.iter55 = mul i32 %conv.i.i.iter55, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter55 = and i32 %mul.i.i.iter55, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter55 = lshr exact i32 %and.i.i.iter55, 4, !dbg !333
  %shr1.i.i.iter55 = lshr exact i32 %and.i.i.iter55, 3, !dbg !334
  %498 = xor i32 %shr.i.i.iter55, %shr1.i.i.iter55, !dbg !335
  %xor2.i.i.iter55 = xor i32 %498, %mul.i.i.iter55, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter55, !dbg !337

for.body.i.iter55:                                ; preds = %for.body.i.iter55, %for.body6.i17.iter55
  %i.0.i69.iter55 = phi i32 [ 0, %for.body6.i17.iter55 ], [ %inc.i26.iter55, %for.body.i.iter55 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter55, i32 %i.0.i69.iter55, !dbg !338
  %499 = load i64, ptr %arrayidx.i24.iter55, align 8, !dbg !338
  %and.i.iter55 = and i64 %499, 1229782938247303441, !dbg !339
  %and1.i.iter55 = and i32 %xor2.i.i.iter55, 255, !dbg !340
  %conv.i.iter55 = zext nneg i32 %and1.i.iter55 to i64, !dbg !341
  %mul.i25.iter55 = mul i64 %and.i.iter55, %conv.i.iter55, !dbg !342
  %shr.i.iter55 = lshr i64 %499, 1, !dbg !343
  %and3.i.iter55 = and i64 %shr.i.iter55, 1229782938247303441, !dbg !344
  %shr4.i.iter55 = lshr i32 %xor2.i.i.iter55, 8, !dbg !345
  %and5.i.iter55 = and i32 %shr4.i.iter55, 15, !dbg !346
  %conv6.i.iter55 = zext nneg i32 %and5.i.iter55 to i64, !dbg !347
  %mul7.i.iter55 = mul nuw i64 %and3.i.iter55, %conv6.i.iter55, !dbg !348
  %xor.i.iter55 = xor i64 %mul.i25.iter55, %mul7.i.iter55, !dbg !349
  %arrayidx8.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter55, i32 %i.0.i69.iter55, !dbg !350
  %500 = load i64, ptr %arrayidx8.i.iter55, align 8, !dbg !350
  %shr9.i.iter55 = lshr i64 %500, 2, !dbg !351
  %and10.i.iter55 = and i64 %shr9.i.iter55, 1229782938247303441, !dbg !352
  %shr11.i.iter55 = lshr i32 %xor2.i.i.iter55, 16, !dbg !353
  %and12.i.iter55 = and i32 %shr11.i.iter55, 15, !dbg !354
  %conv13.i.iter55 = zext nneg i32 %and12.i.iter55 to i64, !dbg !355
  %mul14.i.iter55 = mul nuw i64 %and10.i.iter55, %conv13.i.iter55, !dbg !356
  %xor15.i.iter55 = xor i64 %xor.i.iter55, %mul14.i.iter55, !dbg !357
  %arrayidx16.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter55, i32 %i.0.i69.iter55, !dbg !358
  %501 = load i64, ptr %arrayidx16.i.iter55, align 8, !dbg !358
  %shr17.i.iter55 = lshr i64 %501, 3, !dbg !359
  %and18.i.iter55 = and i64 %shr17.i.iter55, 1229782938247303441, !dbg !360
  %shr19.i.iter55 = lshr i32 %xor2.i.i.iter55, 24, !dbg !361
  %and20.i.iter55 = and i32 %shr19.i.iter55, 15, !dbg !362
  %conv21.i.iter55 = zext nneg i32 %and20.i.iter55 to i64, !dbg !363
  %mul22.i.iter55 = mul nuw i64 %and18.i.iter55, %conv21.i.iter55, !dbg !364
  %xor23.i.iter55 = xor i64 %xor15.i.iter55, %mul22.i.iter55, !dbg !365
  %arrayidx24.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter55, i32 %i.0.i69.iter55, !dbg !366
  %502 = load i64, ptr %arrayidx24.i.iter55, align 8, !dbg !367
  %xor25.i.iter55 = xor i64 %502, %xor23.i.iter55, !dbg !367
  store i64 %xor25.i.iter55, ptr %arrayidx24.i.iter55, align 8, !dbg !367
  %inc.i26.iter55 = add nuw nsw i32 %i.0.i69.iter55, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter55 = icmp eq i32 %inc.i26.iter55, 5, !dbg !369
  br i1 %exitcond.i23.not.iter55, label %m_vec_mul_add.exit.iter55, label %for.body.i.iter55, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter55:                        ; preds = %for.body.i.iter55
  %add13.i.iter55 = add nuw nsw i32 %k.0.i1270.iter55, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter55 = icmp eq i32 %add13.i.iter55, 8, !dbg !373
  br i1 %exitcond.i13.not.iter55, label %for.inc15.i14.iter55, label %for.body6.i17.iter55, !dbg !374, !llvm.loop !375

for.inc15.i14.iter55:                             ; preds = %m_vec_mul_add.exit.iter55
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter55 = add i32 %bs_mat_entries_used.1.i72.iter55, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter55 = add nuw nsw i32 %c.0.i673.iter55, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter55 = icmp eq i32 %add14.i15.iter55, %495, !dbg !379
  br i1 %exitcond1.i7.not.iter55, label %for.cond1.i5.for.inc17.i8_crit_edge.iter55, label %for.cond4.i11.preheader.iter55, !dbg !313, !llvm.loop !380

for.inc17.i8.iter55:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter55
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_55_end

for.cond4.i11.preheader.iter55:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter55, %for.inc15.i14.iter55
  %c.0.i673.iter55 = phi i32 [ 55, %for.cond4.i11.preheader.lr.ph.iter55 ], [ %inc.i16.iter55, %for.inc15.i14.iter55 ]
  %bs_mat_entries_used.1.i72.iter55 = phi i32 [ %split.iter54, %for.cond4.i11.preheader.lr.ph.iter55 ], [ %add14.i15.iter55, %for.inc15.i14.iter55 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter55, !dbg !374

for.cond4.i11.preheader.lr.ph.iter55:             ; preds = %for.cond1.preheader.i4.iter55
  br label %for.cond4.i11.preheader.iter55, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter55:       ; preds = %for.inc15.i14.iter55
  %split.iter55 = phi i32 [ %add14.i15.iter55, %for.inc15.i14.iter55 ]
  br label %for.inc17.i8.iter55, !dbg !313

iter_55_end:                                      ; preds = %for.inc17.i8.iter55
  br label %iter_56_start

iter_56_start:                                    ; preds = %iter_55_end
  br label %for.cond1.preheader.i4.iter56

for.cond1.preheader.i4.iter56:                    ; preds = %iter_56_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %503 = add i32 %split.iter55, 22, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter56, !dbg !313

for.body6.i17.iter56:                             ; preds = %for.cond4.i11.preheader.iter56, %m_vec_mul_add.exit.iter56
  %k.0.i1270.iter56 = phi i32 [ 0, %for.cond4.i11.preheader.iter56 ], [ %add13.i.iter56, %m_vec_mul_add.exit.iter56 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter56 = mul nsw i32 %bs_mat_entries_used.1.i72.iter56, 40, !dbg !319
  %add.ptr.i19.iter56 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter56, !dbg !319
  %mul8.i20.iter56 = shl nuw nsw i32 %c.0.i673.iter56, 3, !dbg !322
  %504 = getelementptr i8, ptr %O, i32 %mul8.i20.iter56, !dbg !323
  %arrayidx.i21.iter56 = getelementptr i8, ptr %504, i32 %k.0.i1270.iter56, !dbg !323
  %505 = load i8, ptr %arrayidx.i21.iter56, align 1, !dbg !323
  %add10.i.iter56 = or disjoint i32 448, %k.0.i1270.iter56, !dbg !324
  %add.ptr12.idx.i.iter56 = mul nuw nsw i32 %add10.i.iter56, 40, !dbg !325
  %add.ptr12.i.iter56 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter56, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter56 = zext i8 %505 to i32, !dbg !330
  %mul.i.i.iter56 = mul i32 %conv.i.i.iter56, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter56 = and i32 %mul.i.i.iter56, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter56 = lshr exact i32 %and.i.i.iter56, 4, !dbg !333
  %shr1.i.i.iter56 = lshr exact i32 %and.i.i.iter56, 3, !dbg !334
  %506 = xor i32 %shr.i.i.iter56, %shr1.i.i.iter56, !dbg !335
  %xor2.i.i.iter56 = xor i32 %506, %mul.i.i.iter56, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter56, !dbg !337

for.body.i.iter56:                                ; preds = %for.body.i.iter56, %for.body6.i17.iter56
  %i.0.i69.iter56 = phi i32 [ 0, %for.body6.i17.iter56 ], [ %inc.i26.iter56, %for.body.i.iter56 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter56, i32 %i.0.i69.iter56, !dbg !338
  %507 = load i64, ptr %arrayidx.i24.iter56, align 8, !dbg !338
  %and.i.iter56 = and i64 %507, 1229782938247303441, !dbg !339
  %and1.i.iter56 = and i32 %xor2.i.i.iter56, 255, !dbg !340
  %conv.i.iter56 = zext nneg i32 %and1.i.iter56 to i64, !dbg !341
  %mul.i25.iter56 = mul i64 %and.i.iter56, %conv.i.iter56, !dbg !342
  %shr.i.iter56 = lshr i64 %507, 1, !dbg !343
  %and3.i.iter56 = and i64 %shr.i.iter56, 1229782938247303441, !dbg !344
  %shr4.i.iter56 = lshr i32 %xor2.i.i.iter56, 8, !dbg !345
  %and5.i.iter56 = and i32 %shr4.i.iter56, 15, !dbg !346
  %conv6.i.iter56 = zext nneg i32 %and5.i.iter56 to i64, !dbg !347
  %mul7.i.iter56 = mul nuw i64 %and3.i.iter56, %conv6.i.iter56, !dbg !348
  %xor.i.iter56 = xor i64 %mul.i25.iter56, %mul7.i.iter56, !dbg !349
  %arrayidx8.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter56, i32 %i.0.i69.iter56, !dbg !350
  %508 = load i64, ptr %arrayidx8.i.iter56, align 8, !dbg !350
  %shr9.i.iter56 = lshr i64 %508, 2, !dbg !351
  %and10.i.iter56 = and i64 %shr9.i.iter56, 1229782938247303441, !dbg !352
  %shr11.i.iter56 = lshr i32 %xor2.i.i.iter56, 16, !dbg !353
  %and12.i.iter56 = and i32 %shr11.i.iter56, 15, !dbg !354
  %conv13.i.iter56 = zext nneg i32 %and12.i.iter56 to i64, !dbg !355
  %mul14.i.iter56 = mul nuw i64 %and10.i.iter56, %conv13.i.iter56, !dbg !356
  %xor15.i.iter56 = xor i64 %xor.i.iter56, %mul14.i.iter56, !dbg !357
  %arrayidx16.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter56, i32 %i.0.i69.iter56, !dbg !358
  %509 = load i64, ptr %arrayidx16.i.iter56, align 8, !dbg !358
  %shr17.i.iter56 = lshr i64 %509, 3, !dbg !359
  %and18.i.iter56 = and i64 %shr17.i.iter56, 1229782938247303441, !dbg !360
  %shr19.i.iter56 = lshr i32 %xor2.i.i.iter56, 24, !dbg !361
  %and20.i.iter56 = and i32 %shr19.i.iter56, 15, !dbg !362
  %conv21.i.iter56 = zext nneg i32 %and20.i.iter56 to i64, !dbg !363
  %mul22.i.iter56 = mul nuw i64 %and18.i.iter56, %conv21.i.iter56, !dbg !364
  %xor23.i.iter56 = xor i64 %xor15.i.iter56, %mul22.i.iter56, !dbg !365
  %arrayidx24.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter56, i32 %i.0.i69.iter56, !dbg !366
  %510 = load i64, ptr %arrayidx24.i.iter56, align 8, !dbg !367
  %xor25.i.iter56 = xor i64 %510, %xor23.i.iter56, !dbg !367
  store i64 %xor25.i.iter56, ptr %arrayidx24.i.iter56, align 8, !dbg !367
  %inc.i26.iter56 = add nuw nsw i32 %i.0.i69.iter56, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter56 = icmp eq i32 %inc.i26.iter56, 5, !dbg !369
  br i1 %exitcond.i23.not.iter56, label %m_vec_mul_add.exit.iter56, label %for.body.i.iter56, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter56:                        ; preds = %for.body.i.iter56
  %add13.i.iter56 = add nuw nsw i32 %k.0.i1270.iter56, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter56 = icmp eq i32 %add13.i.iter56, 8, !dbg !373
  br i1 %exitcond.i13.not.iter56, label %for.inc15.i14.iter56, label %for.body6.i17.iter56, !dbg !374, !llvm.loop !375

for.inc15.i14.iter56:                             ; preds = %m_vec_mul_add.exit.iter56
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter56 = add i32 %bs_mat_entries_used.1.i72.iter56, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter56 = add nuw nsw i32 %c.0.i673.iter56, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter56 = icmp eq i32 %add14.i15.iter56, %503, !dbg !379
  br i1 %exitcond1.i7.not.iter56, label %for.cond1.i5.for.inc17.i8_crit_edge.iter56, label %for.cond4.i11.preheader.iter56, !dbg !313, !llvm.loop !380

for.inc17.i8.iter56:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter56
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_56_end

for.cond4.i11.preheader.iter56:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter56, %for.inc15.i14.iter56
  %c.0.i673.iter56 = phi i32 [ 56, %for.cond4.i11.preheader.lr.ph.iter56 ], [ %inc.i16.iter56, %for.inc15.i14.iter56 ]
  %bs_mat_entries_used.1.i72.iter56 = phi i32 [ %split.iter55, %for.cond4.i11.preheader.lr.ph.iter56 ], [ %add14.i15.iter56, %for.inc15.i14.iter56 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter56, !dbg !374

for.cond4.i11.preheader.lr.ph.iter56:             ; preds = %for.cond1.preheader.i4.iter56
  br label %for.cond4.i11.preheader.iter56, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter56:       ; preds = %for.inc15.i14.iter56
  %split.iter56 = phi i32 [ %add14.i15.iter56, %for.inc15.i14.iter56 ]
  br label %for.inc17.i8.iter56, !dbg !313

iter_56_end:                                      ; preds = %for.inc17.i8.iter56
  br label %iter_57_start

iter_57_start:                                    ; preds = %iter_56_end
  br label %for.cond1.preheader.i4.iter57

for.cond1.preheader.i4.iter57:                    ; preds = %iter_57_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %511 = add i32 %split.iter56, 21, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter57, !dbg !313

for.body6.i17.iter57:                             ; preds = %for.cond4.i11.preheader.iter57, %m_vec_mul_add.exit.iter57
  %k.0.i1270.iter57 = phi i32 [ 0, %for.cond4.i11.preheader.iter57 ], [ %add13.i.iter57, %m_vec_mul_add.exit.iter57 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter57 = mul nsw i32 %bs_mat_entries_used.1.i72.iter57, 40, !dbg !319
  %add.ptr.i19.iter57 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter57, !dbg !319
  %mul8.i20.iter57 = shl nuw nsw i32 %c.0.i673.iter57, 3, !dbg !322
  %512 = getelementptr i8, ptr %O, i32 %mul8.i20.iter57, !dbg !323
  %arrayidx.i21.iter57 = getelementptr i8, ptr %512, i32 %k.0.i1270.iter57, !dbg !323
  %513 = load i8, ptr %arrayidx.i21.iter57, align 1, !dbg !323
  %add10.i.iter57 = or disjoint i32 456, %k.0.i1270.iter57, !dbg !324
  %add.ptr12.idx.i.iter57 = mul nuw nsw i32 %add10.i.iter57, 40, !dbg !325
  %add.ptr12.i.iter57 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter57, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter57 = zext i8 %513 to i32, !dbg !330
  %mul.i.i.iter57 = mul i32 %conv.i.i.iter57, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter57 = and i32 %mul.i.i.iter57, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter57 = lshr exact i32 %and.i.i.iter57, 4, !dbg !333
  %shr1.i.i.iter57 = lshr exact i32 %and.i.i.iter57, 3, !dbg !334
  %514 = xor i32 %shr.i.i.iter57, %shr1.i.i.iter57, !dbg !335
  %xor2.i.i.iter57 = xor i32 %514, %mul.i.i.iter57, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter57, !dbg !337

for.body.i.iter57:                                ; preds = %for.body.i.iter57, %for.body6.i17.iter57
  %i.0.i69.iter57 = phi i32 [ 0, %for.body6.i17.iter57 ], [ %inc.i26.iter57, %for.body.i.iter57 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter57, i32 %i.0.i69.iter57, !dbg !338
  %515 = load i64, ptr %arrayidx.i24.iter57, align 8, !dbg !338
  %and.i.iter57 = and i64 %515, 1229782938247303441, !dbg !339
  %and1.i.iter57 = and i32 %xor2.i.i.iter57, 255, !dbg !340
  %conv.i.iter57 = zext nneg i32 %and1.i.iter57 to i64, !dbg !341
  %mul.i25.iter57 = mul i64 %and.i.iter57, %conv.i.iter57, !dbg !342
  %shr.i.iter57 = lshr i64 %515, 1, !dbg !343
  %and3.i.iter57 = and i64 %shr.i.iter57, 1229782938247303441, !dbg !344
  %shr4.i.iter57 = lshr i32 %xor2.i.i.iter57, 8, !dbg !345
  %and5.i.iter57 = and i32 %shr4.i.iter57, 15, !dbg !346
  %conv6.i.iter57 = zext nneg i32 %and5.i.iter57 to i64, !dbg !347
  %mul7.i.iter57 = mul nuw i64 %and3.i.iter57, %conv6.i.iter57, !dbg !348
  %xor.i.iter57 = xor i64 %mul.i25.iter57, %mul7.i.iter57, !dbg !349
  %arrayidx8.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter57, i32 %i.0.i69.iter57, !dbg !350
  %516 = load i64, ptr %arrayidx8.i.iter57, align 8, !dbg !350
  %shr9.i.iter57 = lshr i64 %516, 2, !dbg !351
  %and10.i.iter57 = and i64 %shr9.i.iter57, 1229782938247303441, !dbg !352
  %shr11.i.iter57 = lshr i32 %xor2.i.i.iter57, 16, !dbg !353
  %and12.i.iter57 = and i32 %shr11.i.iter57, 15, !dbg !354
  %conv13.i.iter57 = zext nneg i32 %and12.i.iter57 to i64, !dbg !355
  %mul14.i.iter57 = mul nuw i64 %and10.i.iter57, %conv13.i.iter57, !dbg !356
  %xor15.i.iter57 = xor i64 %xor.i.iter57, %mul14.i.iter57, !dbg !357
  %arrayidx16.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter57, i32 %i.0.i69.iter57, !dbg !358
  %517 = load i64, ptr %arrayidx16.i.iter57, align 8, !dbg !358
  %shr17.i.iter57 = lshr i64 %517, 3, !dbg !359
  %and18.i.iter57 = and i64 %shr17.i.iter57, 1229782938247303441, !dbg !360
  %shr19.i.iter57 = lshr i32 %xor2.i.i.iter57, 24, !dbg !361
  %and20.i.iter57 = and i32 %shr19.i.iter57, 15, !dbg !362
  %conv21.i.iter57 = zext nneg i32 %and20.i.iter57 to i64, !dbg !363
  %mul22.i.iter57 = mul nuw i64 %and18.i.iter57, %conv21.i.iter57, !dbg !364
  %xor23.i.iter57 = xor i64 %xor15.i.iter57, %mul22.i.iter57, !dbg !365
  %arrayidx24.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter57, i32 %i.0.i69.iter57, !dbg !366
  %518 = load i64, ptr %arrayidx24.i.iter57, align 8, !dbg !367
  %xor25.i.iter57 = xor i64 %518, %xor23.i.iter57, !dbg !367
  store i64 %xor25.i.iter57, ptr %arrayidx24.i.iter57, align 8, !dbg !367
  %inc.i26.iter57 = add nuw nsw i32 %i.0.i69.iter57, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter57 = icmp eq i32 %inc.i26.iter57, 5, !dbg !369
  br i1 %exitcond.i23.not.iter57, label %m_vec_mul_add.exit.iter57, label %for.body.i.iter57, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter57:                        ; preds = %for.body.i.iter57
  %add13.i.iter57 = add nuw nsw i32 %k.0.i1270.iter57, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter57 = icmp eq i32 %add13.i.iter57, 8, !dbg !373
  br i1 %exitcond.i13.not.iter57, label %for.inc15.i14.iter57, label %for.body6.i17.iter57, !dbg !374, !llvm.loop !375

for.inc15.i14.iter57:                             ; preds = %m_vec_mul_add.exit.iter57
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter57 = add i32 %bs_mat_entries_used.1.i72.iter57, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter57 = add nuw nsw i32 %c.0.i673.iter57, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter57 = icmp eq i32 %add14.i15.iter57, %511, !dbg !379
  br i1 %exitcond1.i7.not.iter57, label %for.cond1.i5.for.inc17.i8_crit_edge.iter57, label %for.cond4.i11.preheader.iter57, !dbg !313, !llvm.loop !380

for.inc17.i8.iter57:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter57
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_57_end

for.cond4.i11.preheader.iter57:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter57, %for.inc15.i14.iter57
  %c.0.i673.iter57 = phi i32 [ 57, %for.cond4.i11.preheader.lr.ph.iter57 ], [ %inc.i16.iter57, %for.inc15.i14.iter57 ]
  %bs_mat_entries_used.1.i72.iter57 = phi i32 [ %split.iter56, %for.cond4.i11.preheader.lr.ph.iter57 ], [ %add14.i15.iter57, %for.inc15.i14.iter57 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter57, !dbg !374

for.cond4.i11.preheader.lr.ph.iter57:             ; preds = %for.cond1.preheader.i4.iter57
  br label %for.cond4.i11.preheader.iter57, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter57:       ; preds = %for.inc15.i14.iter57
  %split.iter57 = phi i32 [ %add14.i15.iter57, %for.inc15.i14.iter57 ]
  br label %for.inc17.i8.iter57, !dbg !313

iter_57_end:                                      ; preds = %for.inc17.i8.iter57
  br label %iter_58_start

iter_58_start:                                    ; preds = %iter_57_end
  br label %for.cond1.preheader.i4.iter58

for.cond1.preheader.i4.iter58:                    ; preds = %iter_58_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %519 = add i32 %split.iter57, 20, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter58, !dbg !313

for.body6.i17.iter58:                             ; preds = %for.cond4.i11.preheader.iter58, %m_vec_mul_add.exit.iter58
  %k.0.i1270.iter58 = phi i32 [ 0, %for.cond4.i11.preheader.iter58 ], [ %add13.i.iter58, %m_vec_mul_add.exit.iter58 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter58 = mul nsw i32 %bs_mat_entries_used.1.i72.iter58, 40, !dbg !319
  %add.ptr.i19.iter58 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter58, !dbg !319
  %mul8.i20.iter58 = shl nuw nsw i32 %c.0.i673.iter58, 3, !dbg !322
  %520 = getelementptr i8, ptr %O, i32 %mul8.i20.iter58, !dbg !323
  %arrayidx.i21.iter58 = getelementptr i8, ptr %520, i32 %k.0.i1270.iter58, !dbg !323
  %521 = load i8, ptr %arrayidx.i21.iter58, align 1, !dbg !323
  %add10.i.iter58 = or disjoint i32 464, %k.0.i1270.iter58, !dbg !324
  %add.ptr12.idx.i.iter58 = mul nuw nsw i32 %add10.i.iter58, 40, !dbg !325
  %add.ptr12.i.iter58 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter58, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter58 = zext i8 %521 to i32, !dbg !330
  %mul.i.i.iter58 = mul i32 %conv.i.i.iter58, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter58 = and i32 %mul.i.i.iter58, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter58 = lshr exact i32 %and.i.i.iter58, 4, !dbg !333
  %shr1.i.i.iter58 = lshr exact i32 %and.i.i.iter58, 3, !dbg !334
  %522 = xor i32 %shr.i.i.iter58, %shr1.i.i.iter58, !dbg !335
  %xor2.i.i.iter58 = xor i32 %522, %mul.i.i.iter58, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter58, !dbg !337

for.body.i.iter58:                                ; preds = %for.body.i.iter58, %for.body6.i17.iter58
  %i.0.i69.iter58 = phi i32 [ 0, %for.body6.i17.iter58 ], [ %inc.i26.iter58, %for.body.i.iter58 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter58, i32 %i.0.i69.iter58, !dbg !338
  %523 = load i64, ptr %arrayidx.i24.iter58, align 8, !dbg !338
  %and.i.iter58 = and i64 %523, 1229782938247303441, !dbg !339
  %and1.i.iter58 = and i32 %xor2.i.i.iter58, 255, !dbg !340
  %conv.i.iter58 = zext nneg i32 %and1.i.iter58 to i64, !dbg !341
  %mul.i25.iter58 = mul i64 %and.i.iter58, %conv.i.iter58, !dbg !342
  %shr.i.iter58 = lshr i64 %523, 1, !dbg !343
  %and3.i.iter58 = and i64 %shr.i.iter58, 1229782938247303441, !dbg !344
  %shr4.i.iter58 = lshr i32 %xor2.i.i.iter58, 8, !dbg !345
  %and5.i.iter58 = and i32 %shr4.i.iter58, 15, !dbg !346
  %conv6.i.iter58 = zext nneg i32 %and5.i.iter58 to i64, !dbg !347
  %mul7.i.iter58 = mul nuw i64 %and3.i.iter58, %conv6.i.iter58, !dbg !348
  %xor.i.iter58 = xor i64 %mul.i25.iter58, %mul7.i.iter58, !dbg !349
  %arrayidx8.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter58, i32 %i.0.i69.iter58, !dbg !350
  %524 = load i64, ptr %arrayidx8.i.iter58, align 8, !dbg !350
  %shr9.i.iter58 = lshr i64 %524, 2, !dbg !351
  %and10.i.iter58 = and i64 %shr9.i.iter58, 1229782938247303441, !dbg !352
  %shr11.i.iter58 = lshr i32 %xor2.i.i.iter58, 16, !dbg !353
  %and12.i.iter58 = and i32 %shr11.i.iter58, 15, !dbg !354
  %conv13.i.iter58 = zext nneg i32 %and12.i.iter58 to i64, !dbg !355
  %mul14.i.iter58 = mul nuw i64 %and10.i.iter58, %conv13.i.iter58, !dbg !356
  %xor15.i.iter58 = xor i64 %xor.i.iter58, %mul14.i.iter58, !dbg !357
  %arrayidx16.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter58, i32 %i.0.i69.iter58, !dbg !358
  %525 = load i64, ptr %arrayidx16.i.iter58, align 8, !dbg !358
  %shr17.i.iter58 = lshr i64 %525, 3, !dbg !359
  %and18.i.iter58 = and i64 %shr17.i.iter58, 1229782938247303441, !dbg !360
  %shr19.i.iter58 = lshr i32 %xor2.i.i.iter58, 24, !dbg !361
  %and20.i.iter58 = and i32 %shr19.i.iter58, 15, !dbg !362
  %conv21.i.iter58 = zext nneg i32 %and20.i.iter58 to i64, !dbg !363
  %mul22.i.iter58 = mul nuw i64 %and18.i.iter58, %conv21.i.iter58, !dbg !364
  %xor23.i.iter58 = xor i64 %xor15.i.iter58, %mul22.i.iter58, !dbg !365
  %arrayidx24.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter58, i32 %i.0.i69.iter58, !dbg !366
  %526 = load i64, ptr %arrayidx24.i.iter58, align 8, !dbg !367
  %xor25.i.iter58 = xor i64 %526, %xor23.i.iter58, !dbg !367
  store i64 %xor25.i.iter58, ptr %arrayidx24.i.iter58, align 8, !dbg !367
  %inc.i26.iter58 = add nuw nsw i32 %i.0.i69.iter58, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter58 = icmp eq i32 %inc.i26.iter58, 5, !dbg !369
  br i1 %exitcond.i23.not.iter58, label %m_vec_mul_add.exit.iter58, label %for.body.i.iter58, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter58:                        ; preds = %for.body.i.iter58
  %add13.i.iter58 = add nuw nsw i32 %k.0.i1270.iter58, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter58 = icmp eq i32 %add13.i.iter58, 8, !dbg !373
  br i1 %exitcond.i13.not.iter58, label %for.inc15.i14.iter58, label %for.body6.i17.iter58, !dbg !374, !llvm.loop !375

for.inc15.i14.iter58:                             ; preds = %m_vec_mul_add.exit.iter58
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter58 = add i32 %bs_mat_entries_used.1.i72.iter58, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter58 = add nuw nsw i32 %c.0.i673.iter58, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter58 = icmp eq i32 %add14.i15.iter58, %519, !dbg !379
  br i1 %exitcond1.i7.not.iter58, label %for.cond1.i5.for.inc17.i8_crit_edge.iter58, label %for.cond4.i11.preheader.iter58, !dbg !313, !llvm.loop !380

for.inc17.i8.iter58:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter58
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_58_end

for.cond4.i11.preheader.iter58:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter58, %for.inc15.i14.iter58
  %c.0.i673.iter58 = phi i32 [ 58, %for.cond4.i11.preheader.lr.ph.iter58 ], [ %inc.i16.iter58, %for.inc15.i14.iter58 ]
  %bs_mat_entries_used.1.i72.iter58 = phi i32 [ %split.iter57, %for.cond4.i11.preheader.lr.ph.iter58 ], [ %add14.i15.iter58, %for.inc15.i14.iter58 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter58, !dbg !374

for.cond4.i11.preheader.lr.ph.iter58:             ; preds = %for.cond1.preheader.i4.iter58
  br label %for.cond4.i11.preheader.iter58, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter58:       ; preds = %for.inc15.i14.iter58
  %split.iter58 = phi i32 [ %add14.i15.iter58, %for.inc15.i14.iter58 ]
  br label %for.inc17.i8.iter58, !dbg !313

iter_58_end:                                      ; preds = %for.inc17.i8.iter58
  br label %iter_59_start

iter_59_start:                                    ; preds = %iter_58_end
  br label %for.cond1.preheader.i4.iter59

for.cond1.preheader.i4.iter59:                    ; preds = %iter_59_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %527 = add i32 %split.iter58, 19, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter59, !dbg !313

for.body6.i17.iter59:                             ; preds = %for.cond4.i11.preheader.iter59, %m_vec_mul_add.exit.iter59
  %k.0.i1270.iter59 = phi i32 [ 0, %for.cond4.i11.preheader.iter59 ], [ %add13.i.iter59, %m_vec_mul_add.exit.iter59 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter59 = mul nsw i32 %bs_mat_entries_used.1.i72.iter59, 40, !dbg !319
  %add.ptr.i19.iter59 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter59, !dbg !319
  %mul8.i20.iter59 = shl nuw nsw i32 %c.0.i673.iter59, 3, !dbg !322
  %528 = getelementptr i8, ptr %O, i32 %mul8.i20.iter59, !dbg !323
  %arrayidx.i21.iter59 = getelementptr i8, ptr %528, i32 %k.0.i1270.iter59, !dbg !323
  %529 = load i8, ptr %arrayidx.i21.iter59, align 1, !dbg !323
  %add10.i.iter59 = or disjoint i32 472, %k.0.i1270.iter59, !dbg !324
  %add.ptr12.idx.i.iter59 = mul nuw nsw i32 %add10.i.iter59, 40, !dbg !325
  %add.ptr12.i.iter59 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter59, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter59 = zext i8 %529 to i32, !dbg !330
  %mul.i.i.iter59 = mul i32 %conv.i.i.iter59, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter59 = and i32 %mul.i.i.iter59, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter59 = lshr exact i32 %and.i.i.iter59, 4, !dbg !333
  %shr1.i.i.iter59 = lshr exact i32 %and.i.i.iter59, 3, !dbg !334
  %530 = xor i32 %shr.i.i.iter59, %shr1.i.i.iter59, !dbg !335
  %xor2.i.i.iter59 = xor i32 %530, %mul.i.i.iter59, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter59, !dbg !337

for.body.i.iter59:                                ; preds = %for.body.i.iter59, %for.body6.i17.iter59
  %i.0.i69.iter59 = phi i32 [ 0, %for.body6.i17.iter59 ], [ %inc.i26.iter59, %for.body.i.iter59 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter59, i32 %i.0.i69.iter59, !dbg !338
  %531 = load i64, ptr %arrayidx.i24.iter59, align 8, !dbg !338
  %and.i.iter59 = and i64 %531, 1229782938247303441, !dbg !339
  %and1.i.iter59 = and i32 %xor2.i.i.iter59, 255, !dbg !340
  %conv.i.iter59 = zext nneg i32 %and1.i.iter59 to i64, !dbg !341
  %mul.i25.iter59 = mul i64 %and.i.iter59, %conv.i.iter59, !dbg !342
  %shr.i.iter59 = lshr i64 %531, 1, !dbg !343
  %and3.i.iter59 = and i64 %shr.i.iter59, 1229782938247303441, !dbg !344
  %shr4.i.iter59 = lshr i32 %xor2.i.i.iter59, 8, !dbg !345
  %and5.i.iter59 = and i32 %shr4.i.iter59, 15, !dbg !346
  %conv6.i.iter59 = zext nneg i32 %and5.i.iter59 to i64, !dbg !347
  %mul7.i.iter59 = mul nuw i64 %and3.i.iter59, %conv6.i.iter59, !dbg !348
  %xor.i.iter59 = xor i64 %mul.i25.iter59, %mul7.i.iter59, !dbg !349
  %arrayidx8.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter59, i32 %i.0.i69.iter59, !dbg !350
  %532 = load i64, ptr %arrayidx8.i.iter59, align 8, !dbg !350
  %shr9.i.iter59 = lshr i64 %532, 2, !dbg !351
  %and10.i.iter59 = and i64 %shr9.i.iter59, 1229782938247303441, !dbg !352
  %shr11.i.iter59 = lshr i32 %xor2.i.i.iter59, 16, !dbg !353
  %and12.i.iter59 = and i32 %shr11.i.iter59, 15, !dbg !354
  %conv13.i.iter59 = zext nneg i32 %and12.i.iter59 to i64, !dbg !355
  %mul14.i.iter59 = mul nuw i64 %and10.i.iter59, %conv13.i.iter59, !dbg !356
  %xor15.i.iter59 = xor i64 %xor.i.iter59, %mul14.i.iter59, !dbg !357
  %arrayidx16.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter59, i32 %i.0.i69.iter59, !dbg !358
  %533 = load i64, ptr %arrayidx16.i.iter59, align 8, !dbg !358
  %shr17.i.iter59 = lshr i64 %533, 3, !dbg !359
  %and18.i.iter59 = and i64 %shr17.i.iter59, 1229782938247303441, !dbg !360
  %shr19.i.iter59 = lshr i32 %xor2.i.i.iter59, 24, !dbg !361
  %and20.i.iter59 = and i32 %shr19.i.iter59, 15, !dbg !362
  %conv21.i.iter59 = zext nneg i32 %and20.i.iter59 to i64, !dbg !363
  %mul22.i.iter59 = mul nuw i64 %and18.i.iter59, %conv21.i.iter59, !dbg !364
  %xor23.i.iter59 = xor i64 %xor15.i.iter59, %mul22.i.iter59, !dbg !365
  %arrayidx24.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter59, i32 %i.0.i69.iter59, !dbg !366
  %534 = load i64, ptr %arrayidx24.i.iter59, align 8, !dbg !367
  %xor25.i.iter59 = xor i64 %534, %xor23.i.iter59, !dbg !367
  store i64 %xor25.i.iter59, ptr %arrayidx24.i.iter59, align 8, !dbg !367
  %inc.i26.iter59 = add nuw nsw i32 %i.0.i69.iter59, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter59 = icmp eq i32 %inc.i26.iter59, 5, !dbg !369
  br i1 %exitcond.i23.not.iter59, label %m_vec_mul_add.exit.iter59, label %for.body.i.iter59, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter59:                        ; preds = %for.body.i.iter59
  %add13.i.iter59 = add nuw nsw i32 %k.0.i1270.iter59, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter59 = icmp eq i32 %add13.i.iter59, 8, !dbg !373
  br i1 %exitcond.i13.not.iter59, label %for.inc15.i14.iter59, label %for.body6.i17.iter59, !dbg !374, !llvm.loop !375

for.inc15.i14.iter59:                             ; preds = %m_vec_mul_add.exit.iter59
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter59 = add i32 %bs_mat_entries_used.1.i72.iter59, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter59 = add nuw nsw i32 %c.0.i673.iter59, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter59 = icmp eq i32 %add14.i15.iter59, %527, !dbg !379
  br i1 %exitcond1.i7.not.iter59, label %for.cond1.i5.for.inc17.i8_crit_edge.iter59, label %for.cond4.i11.preheader.iter59, !dbg !313, !llvm.loop !380

for.inc17.i8.iter59:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter59
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_59_end

for.cond4.i11.preheader.iter59:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter59, %for.inc15.i14.iter59
  %c.0.i673.iter59 = phi i32 [ 59, %for.cond4.i11.preheader.lr.ph.iter59 ], [ %inc.i16.iter59, %for.inc15.i14.iter59 ]
  %bs_mat_entries_used.1.i72.iter59 = phi i32 [ %split.iter58, %for.cond4.i11.preheader.lr.ph.iter59 ], [ %add14.i15.iter59, %for.inc15.i14.iter59 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter59, !dbg !374

for.cond4.i11.preheader.lr.ph.iter59:             ; preds = %for.cond1.preheader.i4.iter59
  br label %for.cond4.i11.preheader.iter59, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter59:       ; preds = %for.inc15.i14.iter59
  %split.iter59 = phi i32 [ %add14.i15.iter59, %for.inc15.i14.iter59 ]
  br label %for.inc17.i8.iter59, !dbg !313

iter_59_end:                                      ; preds = %for.inc17.i8.iter59
  br label %iter_60_start

iter_60_start:                                    ; preds = %iter_59_end
  br label %for.cond1.preheader.i4.iter60

for.cond1.preheader.i4.iter60:                    ; preds = %iter_60_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %535 = add i32 %split.iter59, 18, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter60, !dbg !313

for.body6.i17.iter60:                             ; preds = %for.cond4.i11.preheader.iter60, %m_vec_mul_add.exit.iter60
  %k.0.i1270.iter60 = phi i32 [ 0, %for.cond4.i11.preheader.iter60 ], [ %add13.i.iter60, %m_vec_mul_add.exit.iter60 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter60 = mul nsw i32 %bs_mat_entries_used.1.i72.iter60, 40, !dbg !319
  %add.ptr.i19.iter60 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter60, !dbg !319
  %mul8.i20.iter60 = shl nuw nsw i32 %c.0.i673.iter60, 3, !dbg !322
  %536 = getelementptr i8, ptr %O, i32 %mul8.i20.iter60, !dbg !323
  %arrayidx.i21.iter60 = getelementptr i8, ptr %536, i32 %k.0.i1270.iter60, !dbg !323
  %537 = load i8, ptr %arrayidx.i21.iter60, align 1, !dbg !323
  %add10.i.iter60 = or disjoint i32 480, %k.0.i1270.iter60, !dbg !324
  %add.ptr12.idx.i.iter60 = mul nuw nsw i32 %add10.i.iter60, 40, !dbg !325
  %add.ptr12.i.iter60 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter60, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter60 = zext i8 %537 to i32, !dbg !330
  %mul.i.i.iter60 = mul i32 %conv.i.i.iter60, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter60 = and i32 %mul.i.i.iter60, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter60 = lshr exact i32 %and.i.i.iter60, 4, !dbg !333
  %shr1.i.i.iter60 = lshr exact i32 %and.i.i.iter60, 3, !dbg !334
  %538 = xor i32 %shr.i.i.iter60, %shr1.i.i.iter60, !dbg !335
  %xor2.i.i.iter60 = xor i32 %538, %mul.i.i.iter60, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter60, !dbg !337

for.body.i.iter60:                                ; preds = %for.body.i.iter60, %for.body6.i17.iter60
  %i.0.i69.iter60 = phi i32 [ 0, %for.body6.i17.iter60 ], [ %inc.i26.iter60, %for.body.i.iter60 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter60, i32 %i.0.i69.iter60, !dbg !338
  %539 = load i64, ptr %arrayidx.i24.iter60, align 8, !dbg !338
  %and.i.iter60 = and i64 %539, 1229782938247303441, !dbg !339
  %and1.i.iter60 = and i32 %xor2.i.i.iter60, 255, !dbg !340
  %conv.i.iter60 = zext nneg i32 %and1.i.iter60 to i64, !dbg !341
  %mul.i25.iter60 = mul i64 %and.i.iter60, %conv.i.iter60, !dbg !342
  %shr.i.iter60 = lshr i64 %539, 1, !dbg !343
  %and3.i.iter60 = and i64 %shr.i.iter60, 1229782938247303441, !dbg !344
  %shr4.i.iter60 = lshr i32 %xor2.i.i.iter60, 8, !dbg !345
  %and5.i.iter60 = and i32 %shr4.i.iter60, 15, !dbg !346
  %conv6.i.iter60 = zext nneg i32 %and5.i.iter60 to i64, !dbg !347
  %mul7.i.iter60 = mul nuw i64 %and3.i.iter60, %conv6.i.iter60, !dbg !348
  %xor.i.iter60 = xor i64 %mul.i25.iter60, %mul7.i.iter60, !dbg !349
  %arrayidx8.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter60, i32 %i.0.i69.iter60, !dbg !350
  %540 = load i64, ptr %arrayidx8.i.iter60, align 8, !dbg !350
  %shr9.i.iter60 = lshr i64 %540, 2, !dbg !351
  %and10.i.iter60 = and i64 %shr9.i.iter60, 1229782938247303441, !dbg !352
  %shr11.i.iter60 = lshr i32 %xor2.i.i.iter60, 16, !dbg !353
  %and12.i.iter60 = and i32 %shr11.i.iter60, 15, !dbg !354
  %conv13.i.iter60 = zext nneg i32 %and12.i.iter60 to i64, !dbg !355
  %mul14.i.iter60 = mul nuw i64 %and10.i.iter60, %conv13.i.iter60, !dbg !356
  %xor15.i.iter60 = xor i64 %xor.i.iter60, %mul14.i.iter60, !dbg !357
  %arrayidx16.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter60, i32 %i.0.i69.iter60, !dbg !358
  %541 = load i64, ptr %arrayidx16.i.iter60, align 8, !dbg !358
  %shr17.i.iter60 = lshr i64 %541, 3, !dbg !359
  %and18.i.iter60 = and i64 %shr17.i.iter60, 1229782938247303441, !dbg !360
  %shr19.i.iter60 = lshr i32 %xor2.i.i.iter60, 24, !dbg !361
  %and20.i.iter60 = and i32 %shr19.i.iter60, 15, !dbg !362
  %conv21.i.iter60 = zext nneg i32 %and20.i.iter60 to i64, !dbg !363
  %mul22.i.iter60 = mul nuw i64 %and18.i.iter60, %conv21.i.iter60, !dbg !364
  %xor23.i.iter60 = xor i64 %xor15.i.iter60, %mul22.i.iter60, !dbg !365
  %arrayidx24.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter60, i32 %i.0.i69.iter60, !dbg !366
  %542 = load i64, ptr %arrayidx24.i.iter60, align 8, !dbg !367
  %xor25.i.iter60 = xor i64 %542, %xor23.i.iter60, !dbg !367
  store i64 %xor25.i.iter60, ptr %arrayidx24.i.iter60, align 8, !dbg !367
  %inc.i26.iter60 = add nuw nsw i32 %i.0.i69.iter60, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter60 = icmp eq i32 %inc.i26.iter60, 5, !dbg !369
  br i1 %exitcond.i23.not.iter60, label %m_vec_mul_add.exit.iter60, label %for.body.i.iter60, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter60:                        ; preds = %for.body.i.iter60
  %add13.i.iter60 = add nuw nsw i32 %k.0.i1270.iter60, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter60 = icmp eq i32 %add13.i.iter60, 8, !dbg !373
  br i1 %exitcond.i13.not.iter60, label %for.inc15.i14.iter60, label %for.body6.i17.iter60, !dbg !374, !llvm.loop !375

for.inc15.i14.iter60:                             ; preds = %m_vec_mul_add.exit.iter60
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter60 = add i32 %bs_mat_entries_used.1.i72.iter60, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter60 = add nuw nsw i32 %c.0.i673.iter60, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter60 = icmp eq i32 %add14.i15.iter60, %535, !dbg !379
  br i1 %exitcond1.i7.not.iter60, label %for.cond1.i5.for.inc17.i8_crit_edge.iter60, label %for.cond4.i11.preheader.iter60, !dbg !313, !llvm.loop !380

for.inc17.i8.iter60:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter60
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_60_end

for.cond4.i11.preheader.iter60:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter60, %for.inc15.i14.iter60
  %c.0.i673.iter60 = phi i32 [ 60, %for.cond4.i11.preheader.lr.ph.iter60 ], [ %inc.i16.iter60, %for.inc15.i14.iter60 ]
  %bs_mat_entries_used.1.i72.iter60 = phi i32 [ %split.iter59, %for.cond4.i11.preheader.lr.ph.iter60 ], [ %add14.i15.iter60, %for.inc15.i14.iter60 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter60, !dbg !374

for.cond4.i11.preheader.lr.ph.iter60:             ; preds = %for.cond1.preheader.i4.iter60
  br label %for.cond4.i11.preheader.iter60, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter60:       ; preds = %for.inc15.i14.iter60
  %split.iter60 = phi i32 [ %add14.i15.iter60, %for.inc15.i14.iter60 ]
  br label %for.inc17.i8.iter60, !dbg !313

iter_60_end:                                      ; preds = %for.inc17.i8.iter60
  br label %iter_61_start

iter_61_start:                                    ; preds = %iter_60_end
  br label %for.cond1.preheader.i4.iter61

for.cond1.preheader.i4.iter61:                    ; preds = %iter_61_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %543 = add i32 %split.iter60, 17, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter61, !dbg !313

for.body6.i17.iter61:                             ; preds = %for.cond4.i11.preheader.iter61, %m_vec_mul_add.exit.iter61
  %k.0.i1270.iter61 = phi i32 [ 0, %for.cond4.i11.preheader.iter61 ], [ %add13.i.iter61, %m_vec_mul_add.exit.iter61 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter61 = mul nsw i32 %bs_mat_entries_used.1.i72.iter61, 40, !dbg !319
  %add.ptr.i19.iter61 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter61, !dbg !319
  %mul8.i20.iter61 = shl nuw nsw i32 %c.0.i673.iter61, 3, !dbg !322
  %544 = getelementptr i8, ptr %O, i32 %mul8.i20.iter61, !dbg !323
  %arrayidx.i21.iter61 = getelementptr i8, ptr %544, i32 %k.0.i1270.iter61, !dbg !323
  %545 = load i8, ptr %arrayidx.i21.iter61, align 1, !dbg !323
  %add10.i.iter61 = or disjoint i32 488, %k.0.i1270.iter61, !dbg !324
  %add.ptr12.idx.i.iter61 = mul nuw nsw i32 %add10.i.iter61, 40, !dbg !325
  %add.ptr12.i.iter61 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter61, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter61 = zext i8 %545 to i32, !dbg !330
  %mul.i.i.iter61 = mul i32 %conv.i.i.iter61, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter61 = and i32 %mul.i.i.iter61, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter61 = lshr exact i32 %and.i.i.iter61, 4, !dbg !333
  %shr1.i.i.iter61 = lshr exact i32 %and.i.i.iter61, 3, !dbg !334
  %546 = xor i32 %shr.i.i.iter61, %shr1.i.i.iter61, !dbg !335
  %xor2.i.i.iter61 = xor i32 %546, %mul.i.i.iter61, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter61, !dbg !337

for.body.i.iter61:                                ; preds = %for.body.i.iter61, %for.body6.i17.iter61
  %i.0.i69.iter61 = phi i32 [ 0, %for.body6.i17.iter61 ], [ %inc.i26.iter61, %for.body.i.iter61 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter61, i32 %i.0.i69.iter61, !dbg !338
  %547 = load i64, ptr %arrayidx.i24.iter61, align 8, !dbg !338
  %and.i.iter61 = and i64 %547, 1229782938247303441, !dbg !339
  %and1.i.iter61 = and i32 %xor2.i.i.iter61, 255, !dbg !340
  %conv.i.iter61 = zext nneg i32 %and1.i.iter61 to i64, !dbg !341
  %mul.i25.iter61 = mul i64 %and.i.iter61, %conv.i.iter61, !dbg !342
  %shr.i.iter61 = lshr i64 %547, 1, !dbg !343
  %and3.i.iter61 = and i64 %shr.i.iter61, 1229782938247303441, !dbg !344
  %shr4.i.iter61 = lshr i32 %xor2.i.i.iter61, 8, !dbg !345
  %and5.i.iter61 = and i32 %shr4.i.iter61, 15, !dbg !346
  %conv6.i.iter61 = zext nneg i32 %and5.i.iter61 to i64, !dbg !347
  %mul7.i.iter61 = mul nuw i64 %and3.i.iter61, %conv6.i.iter61, !dbg !348
  %xor.i.iter61 = xor i64 %mul.i25.iter61, %mul7.i.iter61, !dbg !349
  %arrayidx8.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter61, i32 %i.0.i69.iter61, !dbg !350
  %548 = load i64, ptr %arrayidx8.i.iter61, align 8, !dbg !350
  %shr9.i.iter61 = lshr i64 %548, 2, !dbg !351
  %and10.i.iter61 = and i64 %shr9.i.iter61, 1229782938247303441, !dbg !352
  %shr11.i.iter61 = lshr i32 %xor2.i.i.iter61, 16, !dbg !353
  %and12.i.iter61 = and i32 %shr11.i.iter61, 15, !dbg !354
  %conv13.i.iter61 = zext nneg i32 %and12.i.iter61 to i64, !dbg !355
  %mul14.i.iter61 = mul nuw i64 %and10.i.iter61, %conv13.i.iter61, !dbg !356
  %xor15.i.iter61 = xor i64 %xor.i.iter61, %mul14.i.iter61, !dbg !357
  %arrayidx16.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter61, i32 %i.0.i69.iter61, !dbg !358
  %549 = load i64, ptr %arrayidx16.i.iter61, align 8, !dbg !358
  %shr17.i.iter61 = lshr i64 %549, 3, !dbg !359
  %and18.i.iter61 = and i64 %shr17.i.iter61, 1229782938247303441, !dbg !360
  %shr19.i.iter61 = lshr i32 %xor2.i.i.iter61, 24, !dbg !361
  %and20.i.iter61 = and i32 %shr19.i.iter61, 15, !dbg !362
  %conv21.i.iter61 = zext nneg i32 %and20.i.iter61 to i64, !dbg !363
  %mul22.i.iter61 = mul nuw i64 %and18.i.iter61, %conv21.i.iter61, !dbg !364
  %xor23.i.iter61 = xor i64 %xor15.i.iter61, %mul22.i.iter61, !dbg !365
  %arrayidx24.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter61, i32 %i.0.i69.iter61, !dbg !366
  %550 = load i64, ptr %arrayidx24.i.iter61, align 8, !dbg !367
  %xor25.i.iter61 = xor i64 %550, %xor23.i.iter61, !dbg !367
  store i64 %xor25.i.iter61, ptr %arrayidx24.i.iter61, align 8, !dbg !367
  %inc.i26.iter61 = add nuw nsw i32 %i.0.i69.iter61, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter61 = icmp eq i32 %inc.i26.iter61, 5, !dbg !369
  br i1 %exitcond.i23.not.iter61, label %m_vec_mul_add.exit.iter61, label %for.body.i.iter61, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter61:                        ; preds = %for.body.i.iter61
  %add13.i.iter61 = add nuw nsw i32 %k.0.i1270.iter61, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter61 = icmp eq i32 %add13.i.iter61, 8, !dbg !373
  br i1 %exitcond.i13.not.iter61, label %for.inc15.i14.iter61, label %for.body6.i17.iter61, !dbg !374, !llvm.loop !375

for.inc15.i14.iter61:                             ; preds = %m_vec_mul_add.exit.iter61
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter61 = add i32 %bs_mat_entries_used.1.i72.iter61, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter61 = add nuw nsw i32 %c.0.i673.iter61, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter61 = icmp eq i32 %add14.i15.iter61, %543, !dbg !379
  br i1 %exitcond1.i7.not.iter61, label %for.cond1.i5.for.inc17.i8_crit_edge.iter61, label %for.cond4.i11.preheader.iter61, !dbg !313, !llvm.loop !380

for.inc17.i8.iter61:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter61
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_61_end

for.cond4.i11.preheader.iter61:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter61, %for.inc15.i14.iter61
  %c.0.i673.iter61 = phi i32 [ 61, %for.cond4.i11.preheader.lr.ph.iter61 ], [ %inc.i16.iter61, %for.inc15.i14.iter61 ]
  %bs_mat_entries_used.1.i72.iter61 = phi i32 [ %split.iter60, %for.cond4.i11.preheader.lr.ph.iter61 ], [ %add14.i15.iter61, %for.inc15.i14.iter61 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter61, !dbg !374

for.cond4.i11.preheader.lr.ph.iter61:             ; preds = %for.cond1.preheader.i4.iter61
  br label %for.cond4.i11.preheader.iter61, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter61:       ; preds = %for.inc15.i14.iter61
  %split.iter61 = phi i32 [ %add14.i15.iter61, %for.inc15.i14.iter61 ]
  br label %for.inc17.i8.iter61, !dbg !313

iter_61_end:                                      ; preds = %for.inc17.i8.iter61
  br label %iter_62_start

iter_62_start:                                    ; preds = %iter_61_end
  br label %for.cond1.preheader.i4.iter62

for.cond1.preheader.i4.iter62:                    ; preds = %iter_62_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %551 = add i32 %split.iter61, 16, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter62, !dbg !313

for.body6.i17.iter62:                             ; preds = %for.cond4.i11.preheader.iter62, %m_vec_mul_add.exit.iter62
  %k.0.i1270.iter62 = phi i32 [ 0, %for.cond4.i11.preheader.iter62 ], [ %add13.i.iter62, %m_vec_mul_add.exit.iter62 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter62 = mul nsw i32 %bs_mat_entries_used.1.i72.iter62, 40, !dbg !319
  %add.ptr.i19.iter62 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter62, !dbg !319
  %mul8.i20.iter62 = shl nuw nsw i32 %c.0.i673.iter62, 3, !dbg !322
  %552 = getelementptr i8, ptr %O, i32 %mul8.i20.iter62, !dbg !323
  %arrayidx.i21.iter62 = getelementptr i8, ptr %552, i32 %k.0.i1270.iter62, !dbg !323
  %553 = load i8, ptr %arrayidx.i21.iter62, align 1, !dbg !323
  %add10.i.iter62 = or disjoint i32 496, %k.0.i1270.iter62, !dbg !324
  %add.ptr12.idx.i.iter62 = mul nuw nsw i32 %add10.i.iter62, 40, !dbg !325
  %add.ptr12.i.iter62 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter62, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter62 = zext i8 %553 to i32, !dbg !330
  %mul.i.i.iter62 = mul i32 %conv.i.i.iter62, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter62 = and i32 %mul.i.i.iter62, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter62 = lshr exact i32 %and.i.i.iter62, 4, !dbg !333
  %shr1.i.i.iter62 = lshr exact i32 %and.i.i.iter62, 3, !dbg !334
  %554 = xor i32 %shr.i.i.iter62, %shr1.i.i.iter62, !dbg !335
  %xor2.i.i.iter62 = xor i32 %554, %mul.i.i.iter62, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter62, !dbg !337

for.body.i.iter62:                                ; preds = %for.body.i.iter62, %for.body6.i17.iter62
  %i.0.i69.iter62 = phi i32 [ 0, %for.body6.i17.iter62 ], [ %inc.i26.iter62, %for.body.i.iter62 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter62, i32 %i.0.i69.iter62, !dbg !338
  %555 = load i64, ptr %arrayidx.i24.iter62, align 8, !dbg !338
  %and.i.iter62 = and i64 %555, 1229782938247303441, !dbg !339
  %and1.i.iter62 = and i32 %xor2.i.i.iter62, 255, !dbg !340
  %conv.i.iter62 = zext nneg i32 %and1.i.iter62 to i64, !dbg !341
  %mul.i25.iter62 = mul i64 %and.i.iter62, %conv.i.iter62, !dbg !342
  %shr.i.iter62 = lshr i64 %555, 1, !dbg !343
  %and3.i.iter62 = and i64 %shr.i.iter62, 1229782938247303441, !dbg !344
  %shr4.i.iter62 = lshr i32 %xor2.i.i.iter62, 8, !dbg !345
  %and5.i.iter62 = and i32 %shr4.i.iter62, 15, !dbg !346
  %conv6.i.iter62 = zext nneg i32 %and5.i.iter62 to i64, !dbg !347
  %mul7.i.iter62 = mul nuw i64 %and3.i.iter62, %conv6.i.iter62, !dbg !348
  %xor.i.iter62 = xor i64 %mul.i25.iter62, %mul7.i.iter62, !dbg !349
  %arrayidx8.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter62, i32 %i.0.i69.iter62, !dbg !350
  %556 = load i64, ptr %arrayidx8.i.iter62, align 8, !dbg !350
  %shr9.i.iter62 = lshr i64 %556, 2, !dbg !351
  %and10.i.iter62 = and i64 %shr9.i.iter62, 1229782938247303441, !dbg !352
  %shr11.i.iter62 = lshr i32 %xor2.i.i.iter62, 16, !dbg !353
  %and12.i.iter62 = and i32 %shr11.i.iter62, 15, !dbg !354
  %conv13.i.iter62 = zext nneg i32 %and12.i.iter62 to i64, !dbg !355
  %mul14.i.iter62 = mul nuw i64 %and10.i.iter62, %conv13.i.iter62, !dbg !356
  %xor15.i.iter62 = xor i64 %xor.i.iter62, %mul14.i.iter62, !dbg !357
  %arrayidx16.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter62, i32 %i.0.i69.iter62, !dbg !358
  %557 = load i64, ptr %arrayidx16.i.iter62, align 8, !dbg !358
  %shr17.i.iter62 = lshr i64 %557, 3, !dbg !359
  %and18.i.iter62 = and i64 %shr17.i.iter62, 1229782938247303441, !dbg !360
  %shr19.i.iter62 = lshr i32 %xor2.i.i.iter62, 24, !dbg !361
  %and20.i.iter62 = and i32 %shr19.i.iter62, 15, !dbg !362
  %conv21.i.iter62 = zext nneg i32 %and20.i.iter62 to i64, !dbg !363
  %mul22.i.iter62 = mul nuw i64 %and18.i.iter62, %conv21.i.iter62, !dbg !364
  %xor23.i.iter62 = xor i64 %xor15.i.iter62, %mul22.i.iter62, !dbg !365
  %arrayidx24.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter62, i32 %i.0.i69.iter62, !dbg !366
  %558 = load i64, ptr %arrayidx24.i.iter62, align 8, !dbg !367
  %xor25.i.iter62 = xor i64 %558, %xor23.i.iter62, !dbg !367
  store i64 %xor25.i.iter62, ptr %arrayidx24.i.iter62, align 8, !dbg !367
  %inc.i26.iter62 = add nuw nsw i32 %i.0.i69.iter62, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter62 = icmp eq i32 %inc.i26.iter62, 5, !dbg !369
  br i1 %exitcond.i23.not.iter62, label %m_vec_mul_add.exit.iter62, label %for.body.i.iter62, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter62:                        ; preds = %for.body.i.iter62
  %add13.i.iter62 = add nuw nsw i32 %k.0.i1270.iter62, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter62 = icmp eq i32 %add13.i.iter62, 8, !dbg !373
  br i1 %exitcond.i13.not.iter62, label %for.inc15.i14.iter62, label %for.body6.i17.iter62, !dbg !374, !llvm.loop !375

for.inc15.i14.iter62:                             ; preds = %m_vec_mul_add.exit.iter62
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter62 = add i32 %bs_mat_entries_used.1.i72.iter62, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter62 = add nuw nsw i32 %c.0.i673.iter62, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter62 = icmp eq i32 %add14.i15.iter62, %551, !dbg !379
  br i1 %exitcond1.i7.not.iter62, label %for.cond1.i5.for.inc17.i8_crit_edge.iter62, label %for.cond4.i11.preheader.iter62, !dbg !313, !llvm.loop !380

for.inc17.i8.iter62:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter62
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_62_end

for.cond4.i11.preheader.iter62:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter62, %for.inc15.i14.iter62
  %c.0.i673.iter62 = phi i32 [ 62, %for.cond4.i11.preheader.lr.ph.iter62 ], [ %inc.i16.iter62, %for.inc15.i14.iter62 ]
  %bs_mat_entries_used.1.i72.iter62 = phi i32 [ %split.iter61, %for.cond4.i11.preheader.lr.ph.iter62 ], [ %add14.i15.iter62, %for.inc15.i14.iter62 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter62, !dbg !374

for.cond4.i11.preheader.lr.ph.iter62:             ; preds = %for.cond1.preheader.i4.iter62
  br label %for.cond4.i11.preheader.iter62, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter62:       ; preds = %for.inc15.i14.iter62
  %split.iter62 = phi i32 [ %add14.i15.iter62, %for.inc15.i14.iter62 ]
  br label %for.inc17.i8.iter62, !dbg !313

iter_62_end:                                      ; preds = %for.inc17.i8.iter62
  br label %iter_63_start

iter_63_start:                                    ; preds = %iter_62_end
  br label %for.cond1.preheader.i4.iter63

for.cond1.preheader.i4.iter63:                    ; preds = %iter_63_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %559 = add i32 %split.iter62, 15, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter63, !dbg !313

for.body6.i17.iter63:                             ; preds = %for.cond4.i11.preheader.iter63, %m_vec_mul_add.exit.iter63
  %k.0.i1270.iter63 = phi i32 [ 0, %for.cond4.i11.preheader.iter63 ], [ %add13.i.iter63, %m_vec_mul_add.exit.iter63 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter63 = mul nsw i32 %bs_mat_entries_used.1.i72.iter63, 40, !dbg !319
  %add.ptr.i19.iter63 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter63, !dbg !319
  %mul8.i20.iter63 = shl nuw nsw i32 %c.0.i673.iter63, 3, !dbg !322
  %560 = getelementptr i8, ptr %O, i32 %mul8.i20.iter63, !dbg !323
  %arrayidx.i21.iter63 = getelementptr i8, ptr %560, i32 %k.0.i1270.iter63, !dbg !323
  %561 = load i8, ptr %arrayidx.i21.iter63, align 1, !dbg !323
  %add10.i.iter63 = or disjoint i32 504, %k.0.i1270.iter63, !dbg !324
  %add.ptr12.idx.i.iter63 = mul nuw nsw i32 %add10.i.iter63, 40, !dbg !325
  %add.ptr12.i.iter63 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter63, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter63 = zext i8 %561 to i32, !dbg !330
  %mul.i.i.iter63 = mul i32 %conv.i.i.iter63, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter63 = and i32 %mul.i.i.iter63, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter63 = lshr exact i32 %and.i.i.iter63, 4, !dbg !333
  %shr1.i.i.iter63 = lshr exact i32 %and.i.i.iter63, 3, !dbg !334
  %562 = xor i32 %shr.i.i.iter63, %shr1.i.i.iter63, !dbg !335
  %xor2.i.i.iter63 = xor i32 %562, %mul.i.i.iter63, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter63, !dbg !337

for.body.i.iter63:                                ; preds = %for.body.i.iter63, %for.body6.i17.iter63
  %i.0.i69.iter63 = phi i32 [ 0, %for.body6.i17.iter63 ], [ %inc.i26.iter63, %for.body.i.iter63 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter63, i32 %i.0.i69.iter63, !dbg !338
  %563 = load i64, ptr %arrayidx.i24.iter63, align 8, !dbg !338
  %and.i.iter63 = and i64 %563, 1229782938247303441, !dbg !339
  %and1.i.iter63 = and i32 %xor2.i.i.iter63, 255, !dbg !340
  %conv.i.iter63 = zext nneg i32 %and1.i.iter63 to i64, !dbg !341
  %mul.i25.iter63 = mul i64 %and.i.iter63, %conv.i.iter63, !dbg !342
  %shr.i.iter63 = lshr i64 %563, 1, !dbg !343
  %and3.i.iter63 = and i64 %shr.i.iter63, 1229782938247303441, !dbg !344
  %shr4.i.iter63 = lshr i32 %xor2.i.i.iter63, 8, !dbg !345
  %and5.i.iter63 = and i32 %shr4.i.iter63, 15, !dbg !346
  %conv6.i.iter63 = zext nneg i32 %and5.i.iter63 to i64, !dbg !347
  %mul7.i.iter63 = mul nuw i64 %and3.i.iter63, %conv6.i.iter63, !dbg !348
  %xor.i.iter63 = xor i64 %mul.i25.iter63, %mul7.i.iter63, !dbg !349
  %arrayidx8.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter63, i32 %i.0.i69.iter63, !dbg !350
  %564 = load i64, ptr %arrayidx8.i.iter63, align 8, !dbg !350
  %shr9.i.iter63 = lshr i64 %564, 2, !dbg !351
  %and10.i.iter63 = and i64 %shr9.i.iter63, 1229782938247303441, !dbg !352
  %shr11.i.iter63 = lshr i32 %xor2.i.i.iter63, 16, !dbg !353
  %and12.i.iter63 = and i32 %shr11.i.iter63, 15, !dbg !354
  %conv13.i.iter63 = zext nneg i32 %and12.i.iter63 to i64, !dbg !355
  %mul14.i.iter63 = mul nuw i64 %and10.i.iter63, %conv13.i.iter63, !dbg !356
  %xor15.i.iter63 = xor i64 %xor.i.iter63, %mul14.i.iter63, !dbg !357
  %arrayidx16.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter63, i32 %i.0.i69.iter63, !dbg !358
  %565 = load i64, ptr %arrayidx16.i.iter63, align 8, !dbg !358
  %shr17.i.iter63 = lshr i64 %565, 3, !dbg !359
  %and18.i.iter63 = and i64 %shr17.i.iter63, 1229782938247303441, !dbg !360
  %shr19.i.iter63 = lshr i32 %xor2.i.i.iter63, 24, !dbg !361
  %and20.i.iter63 = and i32 %shr19.i.iter63, 15, !dbg !362
  %conv21.i.iter63 = zext nneg i32 %and20.i.iter63 to i64, !dbg !363
  %mul22.i.iter63 = mul nuw i64 %and18.i.iter63, %conv21.i.iter63, !dbg !364
  %xor23.i.iter63 = xor i64 %xor15.i.iter63, %mul22.i.iter63, !dbg !365
  %arrayidx24.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter63, i32 %i.0.i69.iter63, !dbg !366
  %566 = load i64, ptr %arrayidx24.i.iter63, align 8, !dbg !367
  %xor25.i.iter63 = xor i64 %566, %xor23.i.iter63, !dbg !367
  store i64 %xor25.i.iter63, ptr %arrayidx24.i.iter63, align 8, !dbg !367
  %inc.i26.iter63 = add nuw nsw i32 %i.0.i69.iter63, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter63 = icmp eq i32 %inc.i26.iter63, 5, !dbg !369
  br i1 %exitcond.i23.not.iter63, label %m_vec_mul_add.exit.iter63, label %for.body.i.iter63, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter63:                        ; preds = %for.body.i.iter63
  %add13.i.iter63 = add nuw nsw i32 %k.0.i1270.iter63, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter63 = icmp eq i32 %add13.i.iter63, 8, !dbg !373
  br i1 %exitcond.i13.not.iter63, label %for.inc15.i14.iter63, label %for.body6.i17.iter63, !dbg !374, !llvm.loop !375

for.inc15.i14.iter63:                             ; preds = %m_vec_mul_add.exit.iter63
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter63 = add i32 %bs_mat_entries_used.1.i72.iter63, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter63 = add nuw nsw i32 %c.0.i673.iter63, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter63 = icmp eq i32 %add14.i15.iter63, %559, !dbg !379
  br i1 %exitcond1.i7.not.iter63, label %for.cond1.i5.for.inc17.i8_crit_edge.iter63, label %for.cond4.i11.preheader.iter63, !dbg !313, !llvm.loop !380

for.inc17.i8.iter63:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter63
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_63_end

for.cond4.i11.preheader.iter63:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter63, %for.inc15.i14.iter63
  %c.0.i673.iter63 = phi i32 [ 63, %for.cond4.i11.preheader.lr.ph.iter63 ], [ %inc.i16.iter63, %for.inc15.i14.iter63 ]
  %bs_mat_entries_used.1.i72.iter63 = phi i32 [ %split.iter62, %for.cond4.i11.preheader.lr.ph.iter63 ], [ %add14.i15.iter63, %for.inc15.i14.iter63 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter63, !dbg !374

for.cond4.i11.preheader.lr.ph.iter63:             ; preds = %for.cond1.preheader.i4.iter63
  br label %for.cond4.i11.preheader.iter63, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter63:       ; preds = %for.inc15.i14.iter63
  %split.iter63 = phi i32 [ %add14.i15.iter63, %for.inc15.i14.iter63 ]
  br label %for.inc17.i8.iter63, !dbg !313

iter_63_end:                                      ; preds = %for.inc17.i8.iter63
  br label %iter_64_start

iter_64_start:                                    ; preds = %iter_63_end
  br label %for.cond1.preheader.i4.iter64

for.cond1.preheader.i4.iter64:                    ; preds = %iter_64_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %567 = add i32 %split.iter63, 14, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter64, !dbg !313

for.body6.i17.iter64:                             ; preds = %for.cond4.i11.preheader.iter64, %m_vec_mul_add.exit.iter64
  %k.0.i1270.iter64 = phi i32 [ 0, %for.cond4.i11.preheader.iter64 ], [ %add13.i.iter64, %m_vec_mul_add.exit.iter64 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter64 = mul nsw i32 %bs_mat_entries_used.1.i72.iter64, 40, !dbg !319
  %add.ptr.i19.iter64 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter64, !dbg !319
  %mul8.i20.iter64 = shl nuw nsw i32 %c.0.i673.iter64, 3, !dbg !322
  %568 = getelementptr i8, ptr %O, i32 %mul8.i20.iter64, !dbg !323
  %arrayidx.i21.iter64 = getelementptr i8, ptr %568, i32 %k.0.i1270.iter64, !dbg !323
  %569 = load i8, ptr %arrayidx.i21.iter64, align 1, !dbg !323
  %add10.i.iter64 = or disjoint i32 512, %k.0.i1270.iter64, !dbg !324
  %add.ptr12.idx.i.iter64 = mul nuw nsw i32 %add10.i.iter64, 40, !dbg !325
  %add.ptr12.i.iter64 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter64, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter64 = zext i8 %569 to i32, !dbg !330
  %mul.i.i.iter64 = mul i32 %conv.i.i.iter64, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter64 = and i32 %mul.i.i.iter64, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter64 = lshr exact i32 %and.i.i.iter64, 4, !dbg !333
  %shr1.i.i.iter64 = lshr exact i32 %and.i.i.iter64, 3, !dbg !334
  %570 = xor i32 %shr.i.i.iter64, %shr1.i.i.iter64, !dbg !335
  %xor2.i.i.iter64 = xor i32 %570, %mul.i.i.iter64, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter64, !dbg !337

for.body.i.iter64:                                ; preds = %for.body.i.iter64, %for.body6.i17.iter64
  %i.0.i69.iter64 = phi i32 [ 0, %for.body6.i17.iter64 ], [ %inc.i26.iter64, %for.body.i.iter64 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter64, i32 %i.0.i69.iter64, !dbg !338
  %571 = load i64, ptr %arrayidx.i24.iter64, align 8, !dbg !338
  %and.i.iter64 = and i64 %571, 1229782938247303441, !dbg !339
  %and1.i.iter64 = and i32 %xor2.i.i.iter64, 255, !dbg !340
  %conv.i.iter64 = zext nneg i32 %and1.i.iter64 to i64, !dbg !341
  %mul.i25.iter64 = mul i64 %and.i.iter64, %conv.i.iter64, !dbg !342
  %shr.i.iter64 = lshr i64 %571, 1, !dbg !343
  %and3.i.iter64 = and i64 %shr.i.iter64, 1229782938247303441, !dbg !344
  %shr4.i.iter64 = lshr i32 %xor2.i.i.iter64, 8, !dbg !345
  %and5.i.iter64 = and i32 %shr4.i.iter64, 15, !dbg !346
  %conv6.i.iter64 = zext nneg i32 %and5.i.iter64 to i64, !dbg !347
  %mul7.i.iter64 = mul nuw i64 %and3.i.iter64, %conv6.i.iter64, !dbg !348
  %xor.i.iter64 = xor i64 %mul.i25.iter64, %mul7.i.iter64, !dbg !349
  %arrayidx8.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter64, i32 %i.0.i69.iter64, !dbg !350
  %572 = load i64, ptr %arrayidx8.i.iter64, align 8, !dbg !350
  %shr9.i.iter64 = lshr i64 %572, 2, !dbg !351
  %and10.i.iter64 = and i64 %shr9.i.iter64, 1229782938247303441, !dbg !352
  %shr11.i.iter64 = lshr i32 %xor2.i.i.iter64, 16, !dbg !353
  %and12.i.iter64 = and i32 %shr11.i.iter64, 15, !dbg !354
  %conv13.i.iter64 = zext nneg i32 %and12.i.iter64 to i64, !dbg !355
  %mul14.i.iter64 = mul nuw i64 %and10.i.iter64, %conv13.i.iter64, !dbg !356
  %xor15.i.iter64 = xor i64 %xor.i.iter64, %mul14.i.iter64, !dbg !357
  %arrayidx16.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter64, i32 %i.0.i69.iter64, !dbg !358
  %573 = load i64, ptr %arrayidx16.i.iter64, align 8, !dbg !358
  %shr17.i.iter64 = lshr i64 %573, 3, !dbg !359
  %and18.i.iter64 = and i64 %shr17.i.iter64, 1229782938247303441, !dbg !360
  %shr19.i.iter64 = lshr i32 %xor2.i.i.iter64, 24, !dbg !361
  %and20.i.iter64 = and i32 %shr19.i.iter64, 15, !dbg !362
  %conv21.i.iter64 = zext nneg i32 %and20.i.iter64 to i64, !dbg !363
  %mul22.i.iter64 = mul nuw i64 %and18.i.iter64, %conv21.i.iter64, !dbg !364
  %xor23.i.iter64 = xor i64 %xor15.i.iter64, %mul22.i.iter64, !dbg !365
  %arrayidx24.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter64, i32 %i.0.i69.iter64, !dbg !366
  %574 = load i64, ptr %arrayidx24.i.iter64, align 8, !dbg !367
  %xor25.i.iter64 = xor i64 %574, %xor23.i.iter64, !dbg !367
  store i64 %xor25.i.iter64, ptr %arrayidx24.i.iter64, align 8, !dbg !367
  %inc.i26.iter64 = add nuw nsw i32 %i.0.i69.iter64, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter64 = icmp eq i32 %inc.i26.iter64, 5, !dbg !369
  br i1 %exitcond.i23.not.iter64, label %m_vec_mul_add.exit.iter64, label %for.body.i.iter64, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter64:                        ; preds = %for.body.i.iter64
  %add13.i.iter64 = add nuw nsw i32 %k.0.i1270.iter64, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter64 = icmp eq i32 %add13.i.iter64, 8, !dbg !373
  br i1 %exitcond.i13.not.iter64, label %for.inc15.i14.iter64, label %for.body6.i17.iter64, !dbg !374, !llvm.loop !375

for.inc15.i14.iter64:                             ; preds = %m_vec_mul_add.exit.iter64
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter64 = add i32 %bs_mat_entries_used.1.i72.iter64, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter64 = add nuw nsw i32 %c.0.i673.iter64, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter64 = icmp eq i32 %add14.i15.iter64, %567, !dbg !379
  br i1 %exitcond1.i7.not.iter64, label %for.cond1.i5.for.inc17.i8_crit_edge.iter64, label %for.cond4.i11.preheader.iter64, !dbg !313, !llvm.loop !380

for.inc17.i8.iter64:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter64
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_64_end

for.cond4.i11.preheader.iter64:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter64, %for.inc15.i14.iter64
  %c.0.i673.iter64 = phi i32 [ 64, %for.cond4.i11.preheader.lr.ph.iter64 ], [ %inc.i16.iter64, %for.inc15.i14.iter64 ]
  %bs_mat_entries_used.1.i72.iter64 = phi i32 [ %split.iter63, %for.cond4.i11.preheader.lr.ph.iter64 ], [ %add14.i15.iter64, %for.inc15.i14.iter64 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter64, !dbg !374

for.cond4.i11.preheader.lr.ph.iter64:             ; preds = %for.cond1.preheader.i4.iter64
  br label %for.cond4.i11.preheader.iter64, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter64:       ; preds = %for.inc15.i14.iter64
  %split.iter64 = phi i32 [ %add14.i15.iter64, %for.inc15.i14.iter64 ]
  br label %for.inc17.i8.iter64, !dbg !313

iter_64_end:                                      ; preds = %for.inc17.i8.iter64
  br label %iter_65_start

iter_65_start:                                    ; preds = %iter_64_end
  br label %for.cond1.preheader.i4.iter65

for.cond1.preheader.i4.iter65:                    ; preds = %iter_65_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %575 = add i32 %split.iter64, 13, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter65, !dbg !313

for.body6.i17.iter65:                             ; preds = %for.cond4.i11.preheader.iter65, %m_vec_mul_add.exit.iter65
  %k.0.i1270.iter65 = phi i32 [ 0, %for.cond4.i11.preheader.iter65 ], [ %add13.i.iter65, %m_vec_mul_add.exit.iter65 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter65 = mul nsw i32 %bs_mat_entries_used.1.i72.iter65, 40, !dbg !319
  %add.ptr.i19.iter65 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter65, !dbg !319
  %mul8.i20.iter65 = shl nuw nsw i32 %c.0.i673.iter65, 3, !dbg !322
  %576 = getelementptr i8, ptr %O, i32 %mul8.i20.iter65, !dbg !323
  %arrayidx.i21.iter65 = getelementptr i8, ptr %576, i32 %k.0.i1270.iter65, !dbg !323
  %577 = load i8, ptr %arrayidx.i21.iter65, align 1, !dbg !323
  %add10.i.iter65 = or disjoint i32 520, %k.0.i1270.iter65, !dbg !324
  %add.ptr12.idx.i.iter65 = mul nuw nsw i32 %add10.i.iter65, 40, !dbg !325
  %add.ptr12.i.iter65 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter65, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter65 = zext i8 %577 to i32, !dbg !330
  %mul.i.i.iter65 = mul i32 %conv.i.i.iter65, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter65 = and i32 %mul.i.i.iter65, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter65 = lshr exact i32 %and.i.i.iter65, 4, !dbg !333
  %shr1.i.i.iter65 = lshr exact i32 %and.i.i.iter65, 3, !dbg !334
  %578 = xor i32 %shr.i.i.iter65, %shr1.i.i.iter65, !dbg !335
  %xor2.i.i.iter65 = xor i32 %578, %mul.i.i.iter65, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter65, !dbg !337

for.body.i.iter65:                                ; preds = %for.body.i.iter65, %for.body6.i17.iter65
  %i.0.i69.iter65 = phi i32 [ 0, %for.body6.i17.iter65 ], [ %inc.i26.iter65, %for.body.i.iter65 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter65, i32 %i.0.i69.iter65, !dbg !338
  %579 = load i64, ptr %arrayidx.i24.iter65, align 8, !dbg !338
  %and.i.iter65 = and i64 %579, 1229782938247303441, !dbg !339
  %and1.i.iter65 = and i32 %xor2.i.i.iter65, 255, !dbg !340
  %conv.i.iter65 = zext nneg i32 %and1.i.iter65 to i64, !dbg !341
  %mul.i25.iter65 = mul i64 %and.i.iter65, %conv.i.iter65, !dbg !342
  %shr.i.iter65 = lshr i64 %579, 1, !dbg !343
  %and3.i.iter65 = and i64 %shr.i.iter65, 1229782938247303441, !dbg !344
  %shr4.i.iter65 = lshr i32 %xor2.i.i.iter65, 8, !dbg !345
  %and5.i.iter65 = and i32 %shr4.i.iter65, 15, !dbg !346
  %conv6.i.iter65 = zext nneg i32 %and5.i.iter65 to i64, !dbg !347
  %mul7.i.iter65 = mul nuw i64 %and3.i.iter65, %conv6.i.iter65, !dbg !348
  %xor.i.iter65 = xor i64 %mul.i25.iter65, %mul7.i.iter65, !dbg !349
  %arrayidx8.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter65, i32 %i.0.i69.iter65, !dbg !350
  %580 = load i64, ptr %arrayidx8.i.iter65, align 8, !dbg !350
  %shr9.i.iter65 = lshr i64 %580, 2, !dbg !351
  %and10.i.iter65 = and i64 %shr9.i.iter65, 1229782938247303441, !dbg !352
  %shr11.i.iter65 = lshr i32 %xor2.i.i.iter65, 16, !dbg !353
  %and12.i.iter65 = and i32 %shr11.i.iter65, 15, !dbg !354
  %conv13.i.iter65 = zext nneg i32 %and12.i.iter65 to i64, !dbg !355
  %mul14.i.iter65 = mul nuw i64 %and10.i.iter65, %conv13.i.iter65, !dbg !356
  %xor15.i.iter65 = xor i64 %xor.i.iter65, %mul14.i.iter65, !dbg !357
  %arrayidx16.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter65, i32 %i.0.i69.iter65, !dbg !358
  %581 = load i64, ptr %arrayidx16.i.iter65, align 8, !dbg !358
  %shr17.i.iter65 = lshr i64 %581, 3, !dbg !359
  %and18.i.iter65 = and i64 %shr17.i.iter65, 1229782938247303441, !dbg !360
  %shr19.i.iter65 = lshr i32 %xor2.i.i.iter65, 24, !dbg !361
  %and20.i.iter65 = and i32 %shr19.i.iter65, 15, !dbg !362
  %conv21.i.iter65 = zext nneg i32 %and20.i.iter65 to i64, !dbg !363
  %mul22.i.iter65 = mul nuw i64 %and18.i.iter65, %conv21.i.iter65, !dbg !364
  %xor23.i.iter65 = xor i64 %xor15.i.iter65, %mul22.i.iter65, !dbg !365
  %arrayidx24.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter65, i32 %i.0.i69.iter65, !dbg !366
  %582 = load i64, ptr %arrayidx24.i.iter65, align 8, !dbg !367
  %xor25.i.iter65 = xor i64 %582, %xor23.i.iter65, !dbg !367
  store i64 %xor25.i.iter65, ptr %arrayidx24.i.iter65, align 8, !dbg !367
  %inc.i26.iter65 = add nuw nsw i32 %i.0.i69.iter65, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter65 = icmp eq i32 %inc.i26.iter65, 5, !dbg !369
  br i1 %exitcond.i23.not.iter65, label %m_vec_mul_add.exit.iter65, label %for.body.i.iter65, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter65:                        ; preds = %for.body.i.iter65
  %add13.i.iter65 = add nuw nsw i32 %k.0.i1270.iter65, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter65 = icmp eq i32 %add13.i.iter65, 8, !dbg !373
  br i1 %exitcond.i13.not.iter65, label %for.inc15.i14.iter65, label %for.body6.i17.iter65, !dbg !374, !llvm.loop !375

for.inc15.i14.iter65:                             ; preds = %m_vec_mul_add.exit.iter65
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter65 = add i32 %bs_mat_entries_used.1.i72.iter65, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter65 = add nuw nsw i32 %c.0.i673.iter65, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter65 = icmp eq i32 %add14.i15.iter65, %575, !dbg !379
  br i1 %exitcond1.i7.not.iter65, label %for.cond1.i5.for.inc17.i8_crit_edge.iter65, label %for.cond4.i11.preheader.iter65, !dbg !313, !llvm.loop !380

for.inc17.i8.iter65:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter65
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_65_end

for.cond4.i11.preheader.iter65:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter65, %for.inc15.i14.iter65
  %c.0.i673.iter65 = phi i32 [ 65, %for.cond4.i11.preheader.lr.ph.iter65 ], [ %inc.i16.iter65, %for.inc15.i14.iter65 ]
  %bs_mat_entries_used.1.i72.iter65 = phi i32 [ %split.iter64, %for.cond4.i11.preheader.lr.ph.iter65 ], [ %add14.i15.iter65, %for.inc15.i14.iter65 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter65, !dbg !374

for.cond4.i11.preheader.lr.ph.iter65:             ; preds = %for.cond1.preheader.i4.iter65
  br label %for.cond4.i11.preheader.iter65, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter65:       ; preds = %for.inc15.i14.iter65
  %split.iter65 = phi i32 [ %add14.i15.iter65, %for.inc15.i14.iter65 ]
  br label %for.inc17.i8.iter65, !dbg !313

iter_65_end:                                      ; preds = %for.inc17.i8.iter65
  br label %iter_66_start

iter_66_start:                                    ; preds = %iter_65_end
  br label %for.cond1.preheader.i4.iter66

for.cond1.preheader.i4.iter66:                    ; preds = %iter_66_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %583 = add i32 %split.iter65, 12, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter66, !dbg !313

for.body6.i17.iter66:                             ; preds = %for.cond4.i11.preheader.iter66, %m_vec_mul_add.exit.iter66
  %k.0.i1270.iter66 = phi i32 [ 0, %for.cond4.i11.preheader.iter66 ], [ %add13.i.iter66, %m_vec_mul_add.exit.iter66 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter66 = mul nsw i32 %bs_mat_entries_used.1.i72.iter66, 40, !dbg !319
  %add.ptr.i19.iter66 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter66, !dbg !319
  %mul8.i20.iter66 = shl nuw nsw i32 %c.0.i673.iter66, 3, !dbg !322
  %584 = getelementptr i8, ptr %O, i32 %mul8.i20.iter66, !dbg !323
  %arrayidx.i21.iter66 = getelementptr i8, ptr %584, i32 %k.0.i1270.iter66, !dbg !323
  %585 = load i8, ptr %arrayidx.i21.iter66, align 1, !dbg !323
  %add10.i.iter66 = or disjoint i32 528, %k.0.i1270.iter66, !dbg !324
  %add.ptr12.idx.i.iter66 = mul nuw nsw i32 %add10.i.iter66, 40, !dbg !325
  %add.ptr12.i.iter66 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter66, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter66 = zext i8 %585 to i32, !dbg !330
  %mul.i.i.iter66 = mul i32 %conv.i.i.iter66, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter66 = and i32 %mul.i.i.iter66, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter66 = lshr exact i32 %and.i.i.iter66, 4, !dbg !333
  %shr1.i.i.iter66 = lshr exact i32 %and.i.i.iter66, 3, !dbg !334
  %586 = xor i32 %shr.i.i.iter66, %shr1.i.i.iter66, !dbg !335
  %xor2.i.i.iter66 = xor i32 %586, %mul.i.i.iter66, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter66, !dbg !337

for.body.i.iter66:                                ; preds = %for.body.i.iter66, %for.body6.i17.iter66
  %i.0.i69.iter66 = phi i32 [ 0, %for.body6.i17.iter66 ], [ %inc.i26.iter66, %for.body.i.iter66 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter66, i32 %i.0.i69.iter66, !dbg !338
  %587 = load i64, ptr %arrayidx.i24.iter66, align 8, !dbg !338
  %and.i.iter66 = and i64 %587, 1229782938247303441, !dbg !339
  %and1.i.iter66 = and i32 %xor2.i.i.iter66, 255, !dbg !340
  %conv.i.iter66 = zext nneg i32 %and1.i.iter66 to i64, !dbg !341
  %mul.i25.iter66 = mul i64 %and.i.iter66, %conv.i.iter66, !dbg !342
  %shr.i.iter66 = lshr i64 %587, 1, !dbg !343
  %and3.i.iter66 = and i64 %shr.i.iter66, 1229782938247303441, !dbg !344
  %shr4.i.iter66 = lshr i32 %xor2.i.i.iter66, 8, !dbg !345
  %and5.i.iter66 = and i32 %shr4.i.iter66, 15, !dbg !346
  %conv6.i.iter66 = zext nneg i32 %and5.i.iter66 to i64, !dbg !347
  %mul7.i.iter66 = mul nuw i64 %and3.i.iter66, %conv6.i.iter66, !dbg !348
  %xor.i.iter66 = xor i64 %mul.i25.iter66, %mul7.i.iter66, !dbg !349
  %arrayidx8.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter66, i32 %i.0.i69.iter66, !dbg !350
  %588 = load i64, ptr %arrayidx8.i.iter66, align 8, !dbg !350
  %shr9.i.iter66 = lshr i64 %588, 2, !dbg !351
  %and10.i.iter66 = and i64 %shr9.i.iter66, 1229782938247303441, !dbg !352
  %shr11.i.iter66 = lshr i32 %xor2.i.i.iter66, 16, !dbg !353
  %and12.i.iter66 = and i32 %shr11.i.iter66, 15, !dbg !354
  %conv13.i.iter66 = zext nneg i32 %and12.i.iter66 to i64, !dbg !355
  %mul14.i.iter66 = mul nuw i64 %and10.i.iter66, %conv13.i.iter66, !dbg !356
  %xor15.i.iter66 = xor i64 %xor.i.iter66, %mul14.i.iter66, !dbg !357
  %arrayidx16.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter66, i32 %i.0.i69.iter66, !dbg !358
  %589 = load i64, ptr %arrayidx16.i.iter66, align 8, !dbg !358
  %shr17.i.iter66 = lshr i64 %589, 3, !dbg !359
  %and18.i.iter66 = and i64 %shr17.i.iter66, 1229782938247303441, !dbg !360
  %shr19.i.iter66 = lshr i32 %xor2.i.i.iter66, 24, !dbg !361
  %and20.i.iter66 = and i32 %shr19.i.iter66, 15, !dbg !362
  %conv21.i.iter66 = zext nneg i32 %and20.i.iter66 to i64, !dbg !363
  %mul22.i.iter66 = mul nuw i64 %and18.i.iter66, %conv21.i.iter66, !dbg !364
  %xor23.i.iter66 = xor i64 %xor15.i.iter66, %mul22.i.iter66, !dbg !365
  %arrayidx24.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter66, i32 %i.0.i69.iter66, !dbg !366
  %590 = load i64, ptr %arrayidx24.i.iter66, align 8, !dbg !367
  %xor25.i.iter66 = xor i64 %590, %xor23.i.iter66, !dbg !367
  store i64 %xor25.i.iter66, ptr %arrayidx24.i.iter66, align 8, !dbg !367
  %inc.i26.iter66 = add nuw nsw i32 %i.0.i69.iter66, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter66 = icmp eq i32 %inc.i26.iter66, 5, !dbg !369
  br i1 %exitcond.i23.not.iter66, label %m_vec_mul_add.exit.iter66, label %for.body.i.iter66, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter66:                        ; preds = %for.body.i.iter66
  %add13.i.iter66 = add nuw nsw i32 %k.0.i1270.iter66, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter66 = icmp eq i32 %add13.i.iter66, 8, !dbg !373
  br i1 %exitcond.i13.not.iter66, label %for.inc15.i14.iter66, label %for.body6.i17.iter66, !dbg !374, !llvm.loop !375

for.inc15.i14.iter66:                             ; preds = %m_vec_mul_add.exit.iter66
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter66 = add i32 %bs_mat_entries_used.1.i72.iter66, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter66 = add nuw nsw i32 %c.0.i673.iter66, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter66 = icmp eq i32 %add14.i15.iter66, %583, !dbg !379
  br i1 %exitcond1.i7.not.iter66, label %for.cond1.i5.for.inc17.i8_crit_edge.iter66, label %for.cond4.i11.preheader.iter66, !dbg !313, !llvm.loop !380

for.inc17.i8.iter66:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter66
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_66_end

for.cond4.i11.preheader.iter66:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter66, %for.inc15.i14.iter66
  %c.0.i673.iter66 = phi i32 [ 66, %for.cond4.i11.preheader.lr.ph.iter66 ], [ %inc.i16.iter66, %for.inc15.i14.iter66 ]
  %bs_mat_entries_used.1.i72.iter66 = phi i32 [ %split.iter65, %for.cond4.i11.preheader.lr.ph.iter66 ], [ %add14.i15.iter66, %for.inc15.i14.iter66 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter66, !dbg !374

for.cond4.i11.preheader.lr.ph.iter66:             ; preds = %for.cond1.preheader.i4.iter66
  br label %for.cond4.i11.preheader.iter66, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter66:       ; preds = %for.inc15.i14.iter66
  %split.iter66 = phi i32 [ %add14.i15.iter66, %for.inc15.i14.iter66 ]
  br label %for.inc17.i8.iter66, !dbg !313

iter_66_end:                                      ; preds = %for.inc17.i8.iter66
  br label %iter_67_start

iter_67_start:                                    ; preds = %iter_66_end
  br label %for.cond1.preheader.i4.iter67

for.cond1.preheader.i4.iter67:                    ; preds = %iter_67_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %591 = add i32 %split.iter66, 11, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter67, !dbg !313

for.body6.i17.iter67:                             ; preds = %for.cond4.i11.preheader.iter67, %m_vec_mul_add.exit.iter67
  %k.0.i1270.iter67 = phi i32 [ 0, %for.cond4.i11.preheader.iter67 ], [ %add13.i.iter67, %m_vec_mul_add.exit.iter67 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter67 = mul nsw i32 %bs_mat_entries_used.1.i72.iter67, 40, !dbg !319
  %add.ptr.i19.iter67 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter67, !dbg !319
  %mul8.i20.iter67 = shl nuw nsw i32 %c.0.i673.iter67, 3, !dbg !322
  %592 = getelementptr i8, ptr %O, i32 %mul8.i20.iter67, !dbg !323
  %arrayidx.i21.iter67 = getelementptr i8, ptr %592, i32 %k.0.i1270.iter67, !dbg !323
  %593 = load i8, ptr %arrayidx.i21.iter67, align 1, !dbg !323
  %add10.i.iter67 = or disjoint i32 536, %k.0.i1270.iter67, !dbg !324
  %add.ptr12.idx.i.iter67 = mul nuw nsw i32 %add10.i.iter67, 40, !dbg !325
  %add.ptr12.i.iter67 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter67, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter67 = zext i8 %593 to i32, !dbg !330
  %mul.i.i.iter67 = mul i32 %conv.i.i.iter67, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter67 = and i32 %mul.i.i.iter67, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter67 = lshr exact i32 %and.i.i.iter67, 4, !dbg !333
  %shr1.i.i.iter67 = lshr exact i32 %and.i.i.iter67, 3, !dbg !334
  %594 = xor i32 %shr.i.i.iter67, %shr1.i.i.iter67, !dbg !335
  %xor2.i.i.iter67 = xor i32 %594, %mul.i.i.iter67, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter67, !dbg !337

for.body.i.iter67:                                ; preds = %for.body.i.iter67, %for.body6.i17.iter67
  %i.0.i69.iter67 = phi i32 [ 0, %for.body6.i17.iter67 ], [ %inc.i26.iter67, %for.body.i.iter67 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter67, i32 %i.0.i69.iter67, !dbg !338
  %595 = load i64, ptr %arrayidx.i24.iter67, align 8, !dbg !338
  %and.i.iter67 = and i64 %595, 1229782938247303441, !dbg !339
  %and1.i.iter67 = and i32 %xor2.i.i.iter67, 255, !dbg !340
  %conv.i.iter67 = zext nneg i32 %and1.i.iter67 to i64, !dbg !341
  %mul.i25.iter67 = mul i64 %and.i.iter67, %conv.i.iter67, !dbg !342
  %shr.i.iter67 = lshr i64 %595, 1, !dbg !343
  %and3.i.iter67 = and i64 %shr.i.iter67, 1229782938247303441, !dbg !344
  %shr4.i.iter67 = lshr i32 %xor2.i.i.iter67, 8, !dbg !345
  %and5.i.iter67 = and i32 %shr4.i.iter67, 15, !dbg !346
  %conv6.i.iter67 = zext nneg i32 %and5.i.iter67 to i64, !dbg !347
  %mul7.i.iter67 = mul nuw i64 %and3.i.iter67, %conv6.i.iter67, !dbg !348
  %xor.i.iter67 = xor i64 %mul.i25.iter67, %mul7.i.iter67, !dbg !349
  %arrayidx8.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter67, i32 %i.0.i69.iter67, !dbg !350
  %596 = load i64, ptr %arrayidx8.i.iter67, align 8, !dbg !350
  %shr9.i.iter67 = lshr i64 %596, 2, !dbg !351
  %and10.i.iter67 = and i64 %shr9.i.iter67, 1229782938247303441, !dbg !352
  %shr11.i.iter67 = lshr i32 %xor2.i.i.iter67, 16, !dbg !353
  %and12.i.iter67 = and i32 %shr11.i.iter67, 15, !dbg !354
  %conv13.i.iter67 = zext nneg i32 %and12.i.iter67 to i64, !dbg !355
  %mul14.i.iter67 = mul nuw i64 %and10.i.iter67, %conv13.i.iter67, !dbg !356
  %xor15.i.iter67 = xor i64 %xor.i.iter67, %mul14.i.iter67, !dbg !357
  %arrayidx16.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter67, i32 %i.0.i69.iter67, !dbg !358
  %597 = load i64, ptr %arrayidx16.i.iter67, align 8, !dbg !358
  %shr17.i.iter67 = lshr i64 %597, 3, !dbg !359
  %and18.i.iter67 = and i64 %shr17.i.iter67, 1229782938247303441, !dbg !360
  %shr19.i.iter67 = lshr i32 %xor2.i.i.iter67, 24, !dbg !361
  %and20.i.iter67 = and i32 %shr19.i.iter67, 15, !dbg !362
  %conv21.i.iter67 = zext nneg i32 %and20.i.iter67 to i64, !dbg !363
  %mul22.i.iter67 = mul nuw i64 %and18.i.iter67, %conv21.i.iter67, !dbg !364
  %xor23.i.iter67 = xor i64 %xor15.i.iter67, %mul22.i.iter67, !dbg !365
  %arrayidx24.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter67, i32 %i.0.i69.iter67, !dbg !366
  %598 = load i64, ptr %arrayidx24.i.iter67, align 8, !dbg !367
  %xor25.i.iter67 = xor i64 %598, %xor23.i.iter67, !dbg !367
  store i64 %xor25.i.iter67, ptr %arrayidx24.i.iter67, align 8, !dbg !367
  %inc.i26.iter67 = add nuw nsw i32 %i.0.i69.iter67, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter67 = icmp eq i32 %inc.i26.iter67, 5, !dbg !369
  br i1 %exitcond.i23.not.iter67, label %m_vec_mul_add.exit.iter67, label %for.body.i.iter67, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter67:                        ; preds = %for.body.i.iter67
  %add13.i.iter67 = add nuw nsw i32 %k.0.i1270.iter67, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter67 = icmp eq i32 %add13.i.iter67, 8, !dbg !373
  br i1 %exitcond.i13.not.iter67, label %for.inc15.i14.iter67, label %for.body6.i17.iter67, !dbg !374, !llvm.loop !375

for.inc15.i14.iter67:                             ; preds = %m_vec_mul_add.exit.iter67
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter67 = add i32 %bs_mat_entries_used.1.i72.iter67, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter67 = add nuw nsw i32 %c.0.i673.iter67, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter67 = icmp eq i32 %add14.i15.iter67, %591, !dbg !379
  br i1 %exitcond1.i7.not.iter67, label %for.cond1.i5.for.inc17.i8_crit_edge.iter67, label %for.cond4.i11.preheader.iter67, !dbg !313, !llvm.loop !380

for.inc17.i8.iter67:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter67
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_67_end

for.cond4.i11.preheader.iter67:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter67, %for.inc15.i14.iter67
  %c.0.i673.iter67 = phi i32 [ 67, %for.cond4.i11.preheader.lr.ph.iter67 ], [ %inc.i16.iter67, %for.inc15.i14.iter67 ]
  %bs_mat_entries_used.1.i72.iter67 = phi i32 [ %split.iter66, %for.cond4.i11.preheader.lr.ph.iter67 ], [ %add14.i15.iter67, %for.inc15.i14.iter67 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter67, !dbg !374

for.cond4.i11.preheader.lr.ph.iter67:             ; preds = %for.cond1.preheader.i4.iter67
  br label %for.cond4.i11.preheader.iter67, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter67:       ; preds = %for.inc15.i14.iter67
  %split.iter67 = phi i32 [ %add14.i15.iter67, %for.inc15.i14.iter67 ]
  br label %for.inc17.i8.iter67, !dbg !313

iter_67_end:                                      ; preds = %for.inc17.i8.iter67
  br label %iter_68_start

iter_68_start:                                    ; preds = %iter_67_end
  br label %for.cond1.preheader.i4.iter68

for.cond1.preheader.i4.iter68:                    ; preds = %iter_68_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %599 = add i32 %split.iter67, 10, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter68, !dbg !313

for.body6.i17.iter68:                             ; preds = %for.cond4.i11.preheader.iter68, %m_vec_mul_add.exit.iter68
  %k.0.i1270.iter68 = phi i32 [ 0, %for.cond4.i11.preheader.iter68 ], [ %add13.i.iter68, %m_vec_mul_add.exit.iter68 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter68 = mul nsw i32 %bs_mat_entries_used.1.i72.iter68, 40, !dbg !319
  %add.ptr.i19.iter68 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter68, !dbg !319
  %mul8.i20.iter68 = shl nuw nsw i32 %c.0.i673.iter68, 3, !dbg !322
  %600 = getelementptr i8, ptr %O, i32 %mul8.i20.iter68, !dbg !323
  %arrayidx.i21.iter68 = getelementptr i8, ptr %600, i32 %k.0.i1270.iter68, !dbg !323
  %601 = load i8, ptr %arrayidx.i21.iter68, align 1, !dbg !323
  %add10.i.iter68 = or disjoint i32 544, %k.0.i1270.iter68, !dbg !324
  %add.ptr12.idx.i.iter68 = mul nuw nsw i32 %add10.i.iter68, 40, !dbg !325
  %add.ptr12.i.iter68 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter68, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter68 = zext i8 %601 to i32, !dbg !330
  %mul.i.i.iter68 = mul i32 %conv.i.i.iter68, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter68 = and i32 %mul.i.i.iter68, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter68 = lshr exact i32 %and.i.i.iter68, 4, !dbg !333
  %shr1.i.i.iter68 = lshr exact i32 %and.i.i.iter68, 3, !dbg !334
  %602 = xor i32 %shr.i.i.iter68, %shr1.i.i.iter68, !dbg !335
  %xor2.i.i.iter68 = xor i32 %602, %mul.i.i.iter68, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter68, !dbg !337

for.body.i.iter68:                                ; preds = %for.body.i.iter68, %for.body6.i17.iter68
  %i.0.i69.iter68 = phi i32 [ 0, %for.body6.i17.iter68 ], [ %inc.i26.iter68, %for.body.i.iter68 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter68, i32 %i.0.i69.iter68, !dbg !338
  %603 = load i64, ptr %arrayidx.i24.iter68, align 8, !dbg !338
  %and.i.iter68 = and i64 %603, 1229782938247303441, !dbg !339
  %and1.i.iter68 = and i32 %xor2.i.i.iter68, 255, !dbg !340
  %conv.i.iter68 = zext nneg i32 %and1.i.iter68 to i64, !dbg !341
  %mul.i25.iter68 = mul i64 %and.i.iter68, %conv.i.iter68, !dbg !342
  %shr.i.iter68 = lshr i64 %603, 1, !dbg !343
  %and3.i.iter68 = and i64 %shr.i.iter68, 1229782938247303441, !dbg !344
  %shr4.i.iter68 = lshr i32 %xor2.i.i.iter68, 8, !dbg !345
  %and5.i.iter68 = and i32 %shr4.i.iter68, 15, !dbg !346
  %conv6.i.iter68 = zext nneg i32 %and5.i.iter68 to i64, !dbg !347
  %mul7.i.iter68 = mul nuw i64 %and3.i.iter68, %conv6.i.iter68, !dbg !348
  %xor.i.iter68 = xor i64 %mul.i25.iter68, %mul7.i.iter68, !dbg !349
  %arrayidx8.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter68, i32 %i.0.i69.iter68, !dbg !350
  %604 = load i64, ptr %arrayidx8.i.iter68, align 8, !dbg !350
  %shr9.i.iter68 = lshr i64 %604, 2, !dbg !351
  %and10.i.iter68 = and i64 %shr9.i.iter68, 1229782938247303441, !dbg !352
  %shr11.i.iter68 = lshr i32 %xor2.i.i.iter68, 16, !dbg !353
  %and12.i.iter68 = and i32 %shr11.i.iter68, 15, !dbg !354
  %conv13.i.iter68 = zext nneg i32 %and12.i.iter68 to i64, !dbg !355
  %mul14.i.iter68 = mul nuw i64 %and10.i.iter68, %conv13.i.iter68, !dbg !356
  %xor15.i.iter68 = xor i64 %xor.i.iter68, %mul14.i.iter68, !dbg !357
  %arrayidx16.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter68, i32 %i.0.i69.iter68, !dbg !358
  %605 = load i64, ptr %arrayidx16.i.iter68, align 8, !dbg !358
  %shr17.i.iter68 = lshr i64 %605, 3, !dbg !359
  %and18.i.iter68 = and i64 %shr17.i.iter68, 1229782938247303441, !dbg !360
  %shr19.i.iter68 = lshr i32 %xor2.i.i.iter68, 24, !dbg !361
  %and20.i.iter68 = and i32 %shr19.i.iter68, 15, !dbg !362
  %conv21.i.iter68 = zext nneg i32 %and20.i.iter68 to i64, !dbg !363
  %mul22.i.iter68 = mul nuw i64 %and18.i.iter68, %conv21.i.iter68, !dbg !364
  %xor23.i.iter68 = xor i64 %xor15.i.iter68, %mul22.i.iter68, !dbg !365
  %arrayidx24.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter68, i32 %i.0.i69.iter68, !dbg !366
  %606 = load i64, ptr %arrayidx24.i.iter68, align 8, !dbg !367
  %xor25.i.iter68 = xor i64 %606, %xor23.i.iter68, !dbg !367
  store i64 %xor25.i.iter68, ptr %arrayidx24.i.iter68, align 8, !dbg !367
  %inc.i26.iter68 = add nuw nsw i32 %i.0.i69.iter68, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter68 = icmp eq i32 %inc.i26.iter68, 5, !dbg !369
  br i1 %exitcond.i23.not.iter68, label %m_vec_mul_add.exit.iter68, label %for.body.i.iter68, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter68:                        ; preds = %for.body.i.iter68
  %add13.i.iter68 = add nuw nsw i32 %k.0.i1270.iter68, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter68 = icmp eq i32 %add13.i.iter68, 8, !dbg !373
  br i1 %exitcond.i13.not.iter68, label %for.inc15.i14.iter68, label %for.body6.i17.iter68, !dbg !374, !llvm.loop !375

for.inc15.i14.iter68:                             ; preds = %m_vec_mul_add.exit.iter68
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter68 = add i32 %bs_mat_entries_used.1.i72.iter68, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter68 = add nuw nsw i32 %c.0.i673.iter68, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter68 = icmp eq i32 %add14.i15.iter68, %599, !dbg !379
  br i1 %exitcond1.i7.not.iter68, label %for.cond1.i5.for.inc17.i8_crit_edge.iter68, label %for.cond4.i11.preheader.iter68, !dbg !313, !llvm.loop !380

for.inc17.i8.iter68:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter68
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_68_end

for.cond4.i11.preheader.iter68:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter68, %for.inc15.i14.iter68
  %c.0.i673.iter68 = phi i32 [ 68, %for.cond4.i11.preheader.lr.ph.iter68 ], [ %inc.i16.iter68, %for.inc15.i14.iter68 ]
  %bs_mat_entries_used.1.i72.iter68 = phi i32 [ %split.iter67, %for.cond4.i11.preheader.lr.ph.iter68 ], [ %add14.i15.iter68, %for.inc15.i14.iter68 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter68, !dbg !374

for.cond4.i11.preheader.lr.ph.iter68:             ; preds = %for.cond1.preheader.i4.iter68
  br label %for.cond4.i11.preheader.iter68, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter68:       ; preds = %for.inc15.i14.iter68
  %split.iter68 = phi i32 [ %add14.i15.iter68, %for.inc15.i14.iter68 ]
  br label %for.inc17.i8.iter68, !dbg !313

iter_68_end:                                      ; preds = %for.inc17.i8.iter68
  br label %iter_69_start

iter_69_start:                                    ; preds = %iter_68_end
  br label %for.cond1.preheader.i4.iter69

for.cond1.preheader.i4.iter69:                    ; preds = %iter_69_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %607 = add i32 %split.iter68, 9, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter69, !dbg !313

for.body6.i17.iter69:                             ; preds = %for.cond4.i11.preheader.iter69, %m_vec_mul_add.exit.iter69
  %k.0.i1270.iter69 = phi i32 [ 0, %for.cond4.i11.preheader.iter69 ], [ %add13.i.iter69, %m_vec_mul_add.exit.iter69 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter69 = mul nsw i32 %bs_mat_entries_used.1.i72.iter69, 40, !dbg !319
  %add.ptr.i19.iter69 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter69, !dbg !319
  %mul8.i20.iter69 = shl nuw nsw i32 %c.0.i673.iter69, 3, !dbg !322
  %608 = getelementptr i8, ptr %O, i32 %mul8.i20.iter69, !dbg !323
  %arrayidx.i21.iter69 = getelementptr i8, ptr %608, i32 %k.0.i1270.iter69, !dbg !323
  %609 = load i8, ptr %arrayidx.i21.iter69, align 1, !dbg !323
  %add10.i.iter69 = or disjoint i32 552, %k.0.i1270.iter69, !dbg !324
  %add.ptr12.idx.i.iter69 = mul nuw nsw i32 %add10.i.iter69, 40, !dbg !325
  %add.ptr12.i.iter69 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter69, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter69 = zext i8 %609 to i32, !dbg !330
  %mul.i.i.iter69 = mul i32 %conv.i.i.iter69, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter69 = and i32 %mul.i.i.iter69, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter69 = lshr exact i32 %and.i.i.iter69, 4, !dbg !333
  %shr1.i.i.iter69 = lshr exact i32 %and.i.i.iter69, 3, !dbg !334
  %610 = xor i32 %shr.i.i.iter69, %shr1.i.i.iter69, !dbg !335
  %xor2.i.i.iter69 = xor i32 %610, %mul.i.i.iter69, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter69, !dbg !337

for.body.i.iter69:                                ; preds = %for.body.i.iter69, %for.body6.i17.iter69
  %i.0.i69.iter69 = phi i32 [ 0, %for.body6.i17.iter69 ], [ %inc.i26.iter69, %for.body.i.iter69 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter69, i32 %i.0.i69.iter69, !dbg !338
  %611 = load i64, ptr %arrayidx.i24.iter69, align 8, !dbg !338
  %and.i.iter69 = and i64 %611, 1229782938247303441, !dbg !339
  %and1.i.iter69 = and i32 %xor2.i.i.iter69, 255, !dbg !340
  %conv.i.iter69 = zext nneg i32 %and1.i.iter69 to i64, !dbg !341
  %mul.i25.iter69 = mul i64 %and.i.iter69, %conv.i.iter69, !dbg !342
  %shr.i.iter69 = lshr i64 %611, 1, !dbg !343
  %and3.i.iter69 = and i64 %shr.i.iter69, 1229782938247303441, !dbg !344
  %shr4.i.iter69 = lshr i32 %xor2.i.i.iter69, 8, !dbg !345
  %and5.i.iter69 = and i32 %shr4.i.iter69, 15, !dbg !346
  %conv6.i.iter69 = zext nneg i32 %and5.i.iter69 to i64, !dbg !347
  %mul7.i.iter69 = mul nuw i64 %and3.i.iter69, %conv6.i.iter69, !dbg !348
  %xor.i.iter69 = xor i64 %mul.i25.iter69, %mul7.i.iter69, !dbg !349
  %arrayidx8.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter69, i32 %i.0.i69.iter69, !dbg !350
  %612 = load i64, ptr %arrayidx8.i.iter69, align 8, !dbg !350
  %shr9.i.iter69 = lshr i64 %612, 2, !dbg !351
  %and10.i.iter69 = and i64 %shr9.i.iter69, 1229782938247303441, !dbg !352
  %shr11.i.iter69 = lshr i32 %xor2.i.i.iter69, 16, !dbg !353
  %and12.i.iter69 = and i32 %shr11.i.iter69, 15, !dbg !354
  %conv13.i.iter69 = zext nneg i32 %and12.i.iter69 to i64, !dbg !355
  %mul14.i.iter69 = mul nuw i64 %and10.i.iter69, %conv13.i.iter69, !dbg !356
  %xor15.i.iter69 = xor i64 %xor.i.iter69, %mul14.i.iter69, !dbg !357
  %arrayidx16.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter69, i32 %i.0.i69.iter69, !dbg !358
  %613 = load i64, ptr %arrayidx16.i.iter69, align 8, !dbg !358
  %shr17.i.iter69 = lshr i64 %613, 3, !dbg !359
  %and18.i.iter69 = and i64 %shr17.i.iter69, 1229782938247303441, !dbg !360
  %shr19.i.iter69 = lshr i32 %xor2.i.i.iter69, 24, !dbg !361
  %and20.i.iter69 = and i32 %shr19.i.iter69, 15, !dbg !362
  %conv21.i.iter69 = zext nneg i32 %and20.i.iter69 to i64, !dbg !363
  %mul22.i.iter69 = mul nuw i64 %and18.i.iter69, %conv21.i.iter69, !dbg !364
  %xor23.i.iter69 = xor i64 %xor15.i.iter69, %mul22.i.iter69, !dbg !365
  %arrayidx24.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter69, i32 %i.0.i69.iter69, !dbg !366
  %614 = load i64, ptr %arrayidx24.i.iter69, align 8, !dbg !367
  %xor25.i.iter69 = xor i64 %614, %xor23.i.iter69, !dbg !367
  store i64 %xor25.i.iter69, ptr %arrayidx24.i.iter69, align 8, !dbg !367
  %inc.i26.iter69 = add nuw nsw i32 %i.0.i69.iter69, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter69 = icmp eq i32 %inc.i26.iter69, 5, !dbg !369
  br i1 %exitcond.i23.not.iter69, label %m_vec_mul_add.exit.iter69, label %for.body.i.iter69, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter69:                        ; preds = %for.body.i.iter69
  %add13.i.iter69 = add nuw nsw i32 %k.0.i1270.iter69, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter69 = icmp eq i32 %add13.i.iter69, 8, !dbg !373
  br i1 %exitcond.i13.not.iter69, label %for.inc15.i14.iter69, label %for.body6.i17.iter69, !dbg !374, !llvm.loop !375

for.inc15.i14.iter69:                             ; preds = %m_vec_mul_add.exit.iter69
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter69 = add i32 %bs_mat_entries_used.1.i72.iter69, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter69 = add nuw nsw i32 %c.0.i673.iter69, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter69 = icmp eq i32 %add14.i15.iter69, %607, !dbg !379
  br i1 %exitcond1.i7.not.iter69, label %for.cond1.i5.for.inc17.i8_crit_edge.iter69, label %for.cond4.i11.preheader.iter69, !dbg !313, !llvm.loop !380

for.inc17.i8.iter69:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter69
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_69_end

for.cond4.i11.preheader.iter69:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter69, %for.inc15.i14.iter69
  %c.0.i673.iter69 = phi i32 [ 69, %for.cond4.i11.preheader.lr.ph.iter69 ], [ %inc.i16.iter69, %for.inc15.i14.iter69 ]
  %bs_mat_entries_used.1.i72.iter69 = phi i32 [ %split.iter68, %for.cond4.i11.preheader.lr.ph.iter69 ], [ %add14.i15.iter69, %for.inc15.i14.iter69 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter69, !dbg !374

for.cond4.i11.preheader.lr.ph.iter69:             ; preds = %for.cond1.preheader.i4.iter69
  br label %for.cond4.i11.preheader.iter69, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter69:       ; preds = %for.inc15.i14.iter69
  %split.iter69 = phi i32 [ %add14.i15.iter69, %for.inc15.i14.iter69 ]
  br label %for.inc17.i8.iter69, !dbg !313

iter_69_end:                                      ; preds = %for.inc17.i8.iter69
  br label %iter_70_start

iter_70_start:                                    ; preds = %iter_69_end
  br label %for.cond1.preheader.i4.iter70

for.cond1.preheader.i4.iter70:                    ; preds = %iter_70_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %615 = add i32 %split.iter69, 8, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter70, !dbg !313

for.body6.i17.iter70:                             ; preds = %for.cond4.i11.preheader.iter70, %m_vec_mul_add.exit.iter70
  %k.0.i1270.iter70 = phi i32 [ 0, %for.cond4.i11.preheader.iter70 ], [ %add13.i.iter70, %m_vec_mul_add.exit.iter70 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter70 = mul nsw i32 %bs_mat_entries_used.1.i72.iter70, 40, !dbg !319
  %add.ptr.i19.iter70 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter70, !dbg !319
  %mul8.i20.iter70 = shl nuw nsw i32 %c.0.i673.iter70, 3, !dbg !322
  %616 = getelementptr i8, ptr %O, i32 %mul8.i20.iter70, !dbg !323
  %arrayidx.i21.iter70 = getelementptr i8, ptr %616, i32 %k.0.i1270.iter70, !dbg !323
  %617 = load i8, ptr %arrayidx.i21.iter70, align 1, !dbg !323
  %add10.i.iter70 = or disjoint i32 560, %k.0.i1270.iter70, !dbg !324
  %add.ptr12.idx.i.iter70 = mul nuw nsw i32 %add10.i.iter70, 40, !dbg !325
  %add.ptr12.i.iter70 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter70, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter70 = zext i8 %617 to i32, !dbg !330
  %mul.i.i.iter70 = mul i32 %conv.i.i.iter70, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter70 = and i32 %mul.i.i.iter70, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter70 = lshr exact i32 %and.i.i.iter70, 4, !dbg !333
  %shr1.i.i.iter70 = lshr exact i32 %and.i.i.iter70, 3, !dbg !334
  %618 = xor i32 %shr.i.i.iter70, %shr1.i.i.iter70, !dbg !335
  %xor2.i.i.iter70 = xor i32 %618, %mul.i.i.iter70, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter70, !dbg !337

for.body.i.iter70:                                ; preds = %for.body.i.iter70, %for.body6.i17.iter70
  %i.0.i69.iter70 = phi i32 [ 0, %for.body6.i17.iter70 ], [ %inc.i26.iter70, %for.body.i.iter70 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter70, i32 %i.0.i69.iter70, !dbg !338
  %619 = load i64, ptr %arrayidx.i24.iter70, align 8, !dbg !338
  %and.i.iter70 = and i64 %619, 1229782938247303441, !dbg !339
  %and1.i.iter70 = and i32 %xor2.i.i.iter70, 255, !dbg !340
  %conv.i.iter70 = zext nneg i32 %and1.i.iter70 to i64, !dbg !341
  %mul.i25.iter70 = mul i64 %and.i.iter70, %conv.i.iter70, !dbg !342
  %shr.i.iter70 = lshr i64 %619, 1, !dbg !343
  %and3.i.iter70 = and i64 %shr.i.iter70, 1229782938247303441, !dbg !344
  %shr4.i.iter70 = lshr i32 %xor2.i.i.iter70, 8, !dbg !345
  %and5.i.iter70 = and i32 %shr4.i.iter70, 15, !dbg !346
  %conv6.i.iter70 = zext nneg i32 %and5.i.iter70 to i64, !dbg !347
  %mul7.i.iter70 = mul nuw i64 %and3.i.iter70, %conv6.i.iter70, !dbg !348
  %xor.i.iter70 = xor i64 %mul.i25.iter70, %mul7.i.iter70, !dbg !349
  %arrayidx8.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter70, i32 %i.0.i69.iter70, !dbg !350
  %620 = load i64, ptr %arrayidx8.i.iter70, align 8, !dbg !350
  %shr9.i.iter70 = lshr i64 %620, 2, !dbg !351
  %and10.i.iter70 = and i64 %shr9.i.iter70, 1229782938247303441, !dbg !352
  %shr11.i.iter70 = lshr i32 %xor2.i.i.iter70, 16, !dbg !353
  %and12.i.iter70 = and i32 %shr11.i.iter70, 15, !dbg !354
  %conv13.i.iter70 = zext nneg i32 %and12.i.iter70 to i64, !dbg !355
  %mul14.i.iter70 = mul nuw i64 %and10.i.iter70, %conv13.i.iter70, !dbg !356
  %xor15.i.iter70 = xor i64 %xor.i.iter70, %mul14.i.iter70, !dbg !357
  %arrayidx16.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter70, i32 %i.0.i69.iter70, !dbg !358
  %621 = load i64, ptr %arrayidx16.i.iter70, align 8, !dbg !358
  %shr17.i.iter70 = lshr i64 %621, 3, !dbg !359
  %and18.i.iter70 = and i64 %shr17.i.iter70, 1229782938247303441, !dbg !360
  %shr19.i.iter70 = lshr i32 %xor2.i.i.iter70, 24, !dbg !361
  %and20.i.iter70 = and i32 %shr19.i.iter70, 15, !dbg !362
  %conv21.i.iter70 = zext nneg i32 %and20.i.iter70 to i64, !dbg !363
  %mul22.i.iter70 = mul nuw i64 %and18.i.iter70, %conv21.i.iter70, !dbg !364
  %xor23.i.iter70 = xor i64 %xor15.i.iter70, %mul22.i.iter70, !dbg !365
  %arrayidx24.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter70, i32 %i.0.i69.iter70, !dbg !366
  %622 = load i64, ptr %arrayidx24.i.iter70, align 8, !dbg !367
  %xor25.i.iter70 = xor i64 %622, %xor23.i.iter70, !dbg !367
  store i64 %xor25.i.iter70, ptr %arrayidx24.i.iter70, align 8, !dbg !367
  %inc.i26.iter70 = add nuw nsw i32 %i.0.i69.iter70, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter70 = icmp eq i32 %inc.i26.iter70, 5, !dbg !369
  br i1 %exitcond.i23.not.iter70, label %m_vec_mul_add.exit.iter70, label %for.body.i.iter70, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter70:                        ; preds = %for.body.i.iter70
  %add13.i.iter70 = add nuw nsw i32 %k.0.i1270.iter70, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter70 = icmp eq i32 %add13.i.iter70, 8, !dbg !373
  br i1 %exitcond.i13.not.iter70, label %for.inc15.i14.iter70, label %for.body6.i17.iter70, !dbg !374, !llvm.loop !375

for.inc15.i14.iter70:                             ; preds = %m_vec_mul_add.exit.iter70
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter70 = add i32 %bs_mat_entries_used.1.i72.iter70, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter70 = add nuw nsw i32 %c.0.i673.iter70, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter70 = icmp eq i32 %add14.i15.iter70, %615, !dbg !379
  br i1 %exitcond1.i7.not.iter70, label %for.cond1.i5.for.inc17.i8_crit_edge.iter70, label %for.cond4.i11.preheader.iter70, !dbg !313, !llvm.loop !380

for.inc17.i8.iter70:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter70
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_70_end

for.cond4.i11.preheader.iter70:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter70, %for.inc15.i14.iter70
  %c.0.i673.iter70 = phi i32 [ 70, %for.cond4.i11.preheader.lr.ph.iter70 ], [ %inc.i16.iter70, %for.inc15.i14.iter70 ]
  %bs_mat_entries_used.1.i72.iter70 = phi i32 [ %split.iter69, %for.cond4.i11.preheader.lr.ph.iter70 ], [ %add14.i15.iter70, %for.inc15.i14.iter70 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter70, !dbg !374

for.cond4.i11.preheader.lr.ph.iter70:             ; preds = %for.cond1.preheader.i4.iter70
  br label %for.cond4.i11.preheader.iter70, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter70:       ; preds = %for.inc15.i14.iter70
  %split.iter70 = phi i32 [ %add14.i15.iter70, %for.inc15.i14.iter70 ]
  br label %for.inc17.i8.iter70, !dbg !313

iter_70_end:                                      ; preds = %for.inc17.i8.iter70
  br label %iter_71_start

iter_71_start:                                    ; preds = %iter_70_end
  br label %for.cond1.preheader.i4.iter71

for.cond1.preheader.i4.iter71:                    ; preds = %iter_71_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %623 = add i32 %split.iter70, 7, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter71, !dbg !313

for.body6.i17.iter71:                             ; preds = %for.cond4.i11.preheader.iter71, %m_vec_mul_add.exit.iter71
  %k.0.i1270.iter71 = phi i32 [ 0, %for.cond4.i11.preheader.iter71 ], [ %add13.i.iter71, %m_vec_mul_add.exit.iter71 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter71 = mul nsw i32 %bs_mat_entries_used.1.i72.iter71, 40, !dbg !319
  %add.ptr.i19.iter71 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter71, !dbg !319
  %mul8.i20.iter71 = shl nuw nsw i32 %c.0.i673.iter71, 3, !dbg !322
  %624 = getelementptr i8, ptr %O, i32 %mul8.i20.iter71, !dbg !323
  %arrayidx.i21.iter71 = getelementptr i8, ptr %624, i32 %k.0.i1270.iter71, !dbg !323
  %625 = load i8, ptr %arrayidx.i21.iter71, align 1, !dbg !323
  %add10.i.iter71 = or disjoint i32 568, %k.0.i1270.iter71, !dbg !324
  %add.ptr12.idx.i.iter71 = mul nuw nsw i32 %add10.i.iter71, 40, !dbg !325
  %add.ptr12.i.iter71 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter71, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter71 = zext i8 %625 to i32, !dbg !330
  %mul.i.i.iter71 = mul i32 %conv.i.i.iter71, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter71 = and i32 %mul.i.i.iter71, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter71 = lshr exact i32 %and.i.i.iter71, 4, !dbg !333
  %shr1.i.i.iter71 = lshr exact i32 %and.i.i.iter71, 3, !dbg !334
  %626 = xor i32 %shr.i.i.iter71, %shr1.i.i.iter71, !dbg !335
  %xor2.i.i.iter71 = xor i32 %626, %mul.i.i.iter71, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter71, !dbg !337

for.body.i.iter71:                                ; preds = %for.body.i.iter71, %for.body6.i17.iter71
  %i.0.i69.iter71 = phi i32 [ 0, %for.body6.i17.iter71 ], [ %inc.i26.iter71, %for.body.i.iter71 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter71, i32 %i.0.i69.iter71, !dbg !338
  %627 = load i64, ptr %arrayidx.i24.iter71, align 8, !dbg !338
  %and.i.iter71 = and i64 %627, 1229782938247303441, !dbg !339
  %and1.i.iter71 = and i32 %xor2.i.i.iter71, 255, !dbg !340
  %conv.i.iter71 = zext nneg i32 %and1.i.iter71 to i64, !dbg !341
  %mul.i25.iter71 = mul i64 %and.i.iter71, %conv.i.iter71, !dbg !342
  %shr.i.iter71 = lshr i64 %627, 1, !dbg !343
  %and3.i.iter71 = and i64 %shr.i.iter71, 1229782938247303441, !dbg !344
  %shr4.i.iter71 = lshr i32 %xor2.i.i.iter71, 8, !dbg !345
  %and5.i.iter71 = and i32 %shr4.i.iter71, 15, !dbg !346
  %conv6.i.iter71 = zext nneg i32 %and5.i.iter71 to i64, !dbg !347
  %mul7.i.iter71 = mul nuw i64 %and3.i.iter71, %conv6.i.iter71, !dbg !348
  %xor.i.iter71 = xor i64 %mul.i25.iter71, %mul7.i.iter71, !dbg !349
  %arrayidx8.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter71, i32 %i.0.i69.iter71, !dbg !350
  %628 = load i64, ptr %arrayidx8.i.iter71, align 8, !dbg !350
  %shr9.i.iter71 = lshr i64 %628, 2, !dbg !351
  %and10.i.iter71 = and i64 %shr9.i.iter71, 1229782938247303441, !dbg !352
  %shr11.i.iter71 = lshr i32 %xor2.i.i.iter71, 16, !dbg !353
  %and12.i.iter71 = and i32 %shr11.i.iter71, 15, !dbg !354
  %conv13.i.iter71 = zext nneg i32 %and12.i.iter71 to i64, !dbg !355
  %mul14.i.iter71 = mul nuw i64 %and10.i.iter71, %conv13.i.iter71, !dbg !356
  %xor15.i.iter71 = xor i64 %xor.i.iter71, %mul14.i.iter71, !dbg !357
  %arrayidx16.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter71, i32 %i.0.i69.iter71, !dbg !358
  %629 = load i64, ptr %arrayidx16.i.iter71, align 8, !dbg !358
  %shr17.i.iter71 = lshr i64 %629, 3, !dbg !359
  %and18.i.iter71 = and i64 %shr17.i.iter71, 1229782938247303441, !dbg !360
  %shr19.i.iter71 = lshr i32 %xor2.i.i.iter71, 24, !dbg !361
  %and20.i.iter71 = and i32 %shr19.i.iter71, 15, !dbg !362
  %conv21.i.iter71 = zext nneg i32 %and20.i.iter71 to i64, !dbg !363
  %mul22.i.iter71 = mul nuw i64 %and18.i.iter71, %conv21.i.iter71, !dbg !364
  %xor23.i.iter71 = xor i64 %xor15.i.iter71, %mul22.i.iter71, !dbg !365
  %arrayidx24.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter71, i32 %i.0.i69.iter71, !dbg !366
  %630 = load i64, ptr %arrayidx24.i.iter71, align 8, !dbg !367
  %xor25.i.iter71 = xor i64 %630, %xor23.i.iter71, !dbg !367
  store i64 %xor25.i.iter71, ptr %arrayidx24.i.iter71, align 8, !dbg !367
  %inc.i26.iter71 = add nuw nsw i32 %i.0.i69.iter71, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter71 = icmp eq i32 %inc.i26.iter71, 5, !dbg !369
  br i1 %exitcond.i23.not.iter71, label %m_vec_mul_add.exit.iter71, label %for.body.i.iter71, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter71:                        ; preds = %for.body.i.iter71
  %add13.i.iter71 = add nuw nsw i32 %k.0.i1270.iter71, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter71 = icmp eq i32 %add13.i.iter71, 8, !dbg !373
  br i1 %exitcond.i13.not.iter71, label %for.inc15.i14.iter71, label %for.body6.i17.iter71, !dbg !374, !llvm.loop !375

for.inc15.i14.iter71:                             ; preds = %m_vec_mul_add.exit.iter71
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter71 = add i32 %bs_mat_entries_used.1.i72.iter71, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter71 = add nuw nsw i32 %c.0.i673.iter71, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter71 = icmp eq i32 %add14.i15.iter71, %623, !dbg !379
  br i1 %exitcond1.i7.not.iter71, label %for.cond1.i5.for.inc17.i8_crit_edge.iter71, label %for.cond4.i11.preheader.iter71, !dbg !313, !llvm.loop !380

for.inc17.i8.iter71:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter71
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_71_end

for.cond4.i11.preheader.iter71:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter71, %for.inc15.i14.iter71
  %c.0.i673.iter71 = phi i32 [ 71, %for.cond4.i11.preheader.lr.ph.iter71 ], [ %inc.i16.iter71, %for.inc15.i14.iter71 ]
  %bs_mat_entries_used.1.i72.iter71 = phi i32 [ %split.iter70, %for.cond4.i11.preheader.lr.ph.iter71 ], [ %add14.i15.iter71, %for.inc15.i14.iter71 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter71, !dbg !374

for.cond4.i11.preheader.lr.ph.iter71:             ; preds = %for.cond1.preheader.i4.iter71
  br label %for.cond4.i11.preheader.iter71, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter71:       ; preds = %for.inc15.i14.iter71
  %split.iter71 = phi i32 [ %add14.i15.iter71, %for.inc15.i14.iter71 ]
  br label %for.inc17.i8.iter71, !dbg !313

iter_71_end:                                      ; preds = %for.inc17.i8.iter71
  br label %iter_72_start

iter_72_start:                                    ; preds = %iter_71_end
  br label %for.cond1.preheader.i4.iter72

for.cond1.preheader.i4.iter72:                    ; preds = %iter_72_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %631 = add i32 %split.iter71, 6, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter72, !dbg !313

for.body6.i17.iter72:                             ; preds = %for.cond4.i11.preheader.iter72, %m_vec_mul_add.exit.iter72
  %k.0.i1270.iter72 = phi i32 [ 0, %for.cond4.i11.preheader.iter72 ], [ %add13.i.iter72, %m_vec_mul_add.exit.iter72 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter72 = mul nsw i32 %bs_mat_entries_used.1.i72.iter72, 40, !dbg !319
  %add.ptr.i19.iter72 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter72, !dbg !319
  %mul8.i20.iter72 = shl nuw nsw i32 %c.0.i673.iter72, 3, !dbg !322
  %632 = getelementptr i8, ptr %O, i32 %mul8.i20.iter72, !dbg !323
  %arrayidx.i21.iter72 = getelementptr i8, ptr %632, i32 %k.0.i1270.iter72, !dbg !323
  %633 = load i8, ptr %arrayidx.i21.iter72, align 1, !dbg !323
  %add10.i.iter72 = or disjoint i32 576, %k.0.i1270.iter72, !dbg !324
  %add.ptr12.idx.i.iter72 = mul nuw nsw i32 %add10.i.iter72, 40, !dbg !325
  %add.ptr12.i.iter72 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter72, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter72 = zext i8 %633 to i32, !dbg !330
  %mul.i.i.iter72 = mul i32 %conv.i.i.iter72, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter72 = and i32 %mul.i.i.iter72, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter72 = lshr exact i32 %and.i.i.iter72, 4, !dbg !333
  %shr1.i.i.iter72 = lshr exact i32 %and.i.i.iter72, 3, !dbg !334
  %634 = xor i32 %shr.i.i.iter72, %shr1.i.i.iter72, !dbg !335
  %xor2.i.i.iter72 = xor i32 %634, %mul.i.i.iter72, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter72, !dbg !337

for.body.i.iter72:                                ; preds = %for.body.i.iter72, %for.body6.i17.iter72
  %i.0.i69.iter72 = phi i32 [ 0, %for.body6.i17.iter72 ], [ %inc.i26.iter72, %for.body.i.iter72 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter72, i32 %i.0.i69.iter72, !dbg !338
  %635 = load i64, ptr %arrayidx.i24.iter72, align 8, !dbg !338
  %and.i.iter72 = and i64 %635, 1229782938247303441, !dbg !339
  %and1.i.iter72 = and i32 %xor2.i.i.iter72, 255, !dbg !340
  %conv.i.iter72 = zext nneg i32 %and1.i.iter72 to i64, !dbg !341
  %mul.i25.iter72 = mul i64 %and.i.iter72, %conv.i.iter72, !dbg !342
  %shr.i.iter72 = lshr i64 %635, 1, !dbg !343
  %and3.i.iter72 = and i64 %shr.i.iter72, 1229782938247303441, !dbg !344
  %shr4.i.iter72 = lshr i32 %xor2.i.i.iter72, 8, !dbg !345
  %and5.i.iter72 = and i32 %shr4.i.iter72, 15, !dbg !346
  %conv6.i.iter72 = zext nneg i32 %and5.i.iter72 to i64, !dbg !347
  %mul7.i.iter72 = mul nuw i64 %and3.i.iter72, %conv6.i.iter72, !dbg !348
  %xor.i.iter72 = xor i64 %mul.i25.iter72, %mul7.i.iter72, !dbg !349
  %arrayidx8.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter72, i32 %i.0.i69.iter72, !dbg !350
  %636 = load i64, ptr %arrayidx8.i.iter72, align 8, !dbg !350
  %shr9.i.iter72 = lshr i64 %636, 2, !dbg !351
  %and10.i.iter72 = and i64 %shr9.i.iter72, 1229782938247303441, !dbg !352
  %shr11.i.iter72 = lshr i32 %xor2.i.i.iter72, 16, !dbg !353
  %and12.i.iter72 = and i32 %shr11.i.iter72, 15, !dbg !354
  %conv13.i.iter72 = zext nneg i32 %and12.i.iter72 to i64, !dbg !355
  %mul14.i.iter72 = mul nuw i64 %and10.i.iter72, %conv13.i.iter72, !dbg !356
  %xor15.i.iter72 = xor i64 %xor.i.iter72, %mul14.i.iter72, !dbg !357
  %arrayidx16.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter72, i32 %i.0.i69.iter72, !dbg !358
  %637 = load i64, ptr %arrayidx16.i.iter72, align 8, !dbg !358
  %shr17.i.iter72 = lshr i64 %637, 3, !dbg !359
  %and18.i.iter72 = and i64 %shr17.i.iter72, 1229782938247303441, !dbg !360
  %shr19.i.iter72 = lshr i32 %xor2.i.i.iter72, 24, !dbg !361
  %and20.i.iter72 = and i32 %shr19.i.iter72, 15, !dbg !362
  %conv21.i.iter72 = zext nneg i32 %and20.i.iter72 to i64, !dbg !363
  %mul22.i.iter72 = mul nuw i64 %and18.i.iter72, %conv21.i.iter72, !dbg !364
  %xor23.i.iter72 = xor i64 %xor15.i.iter72, %mul22.i.iter72, !dbg !365
  %arrayidx24.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter72, i32 %i.0.i69.iter72, !dbg !366
  %638 = load i64, ptr %arrayidx24.i.iter72, align 8, !dbg !367
  %xor25.i.iter72 = xor i64 %638, %xor23.i.iter72, !dbg !367
  store i64 %xor25.i.iter72, ptr %arrayidx24.i.iter72, align 8, !dbg !367
  %inc.i26.iter72 = add nuw nsw i32 %i.0.i69.iter72, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter72 = icmp eq i32 %inc.i26.iter72, 5, !dbg !369
  br i1 %exitcond.i23.not.iter72, label %m_vec_mul_add.exit.iter72, label %for.body.i.iter72, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter72:                        ; preds = %for.body.i.iter72
  %add13.i.iter72 = add nuw nsw i32 %k.0.i1270.iter72, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter72 = icmp eq i32 %add13.i.iter72, 8, !dbg !373
  br i1 %exitcond.i13.not.iter72, label %for.inc15.i14.iter72, label %for.body6.i17.iter72, !dbg !374, !llvm.loop !375

for.inc15.i14.iter72:                             ; preds = %m_vec_mul_add.exit.iter72
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter72 = add i32 %bs_mat_entries_used.1.i72.iter72, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter72 = add nuw nsw i32 %c.0.i673.iter72, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter72 = icmp eq i32 %add14.i15.iter72, %631, !dbg !379
  br i1 %exitcond1.i7.not.iter72, label %for.cond1.i5.for.inc17.i8_crit_edge.iter72, label %for.cond4.i11.preheader.iter72, !dbg !313, !llvm.loop !380

for.inc17.i8.iter72:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter72
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_72_end

for.cond4.i11.preheader.iter72:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter72, %for.inc15.i14.iter72
  %c.0.i673.iter72 = phi i32 [ 72, %for.cond4.i11.preheader.lr.ph.iter72 ], [ %inc.i16.iter72, %for.inc15.i14.iter72 ]
  %bs_mat_entries_used.1.i72.iter72 = phi i32 [ %split.iter71, %for.cond4.i11.preheader.lr.ph.iter72 ], [ %add14.i15.iter72, %for.inc15.i14.iter72 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter72, !dbg !374

for.cond4.i11.preheader.lr.ph.iter72:             ; preds = %for.cond1.preheader.i4.iter72
  br label %for.cond4.i11.preheader.iter72, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter72:       ; preds = %for.inc15.i14.iter72
  %split.iter72 = phi i32 [ %add14.i15.iter72, %for.inc15.i14.iter72 ]
  br label %for.inc17.i8.iter72, !dbg !313

iter_72_end:                                      ; preds = %for.inc17.i8.iter72
  br label %iter_73_start

iter_73_start:                                    ; preds = %iter_72_end
  br label %for.cond1.preheader.i4.iter73

for.cond1.preheader.i4.iter73:                    ; preds = %iter_73_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %639 = add i32 %split.iter72, 5, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter73, !dbg !313

for.body6.i17.iter73:                             ; preds = %for.cond4.i11.preheader.iter73, %m_vec_mul_add.exit.iter73
  %k.0.i1270.iter73 = phi i32 [ 0, %for.cond4.i11.preheader.iter73 ], [ %add13.i.iter73, %m_vec_mul_add.exit.iter73 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter73 = mul nsw i32 %bs_mat_entries_used.1.i72.iter73, 40, !dbg !319
  %add.ptr.i19.iter73 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter73, !dbg !319
  %mul8.i20.iter73 = shl nuw nsw i32 %c.0.i673.iter73, 3, !dbg !322
  %640 = getelementptr i8, ptr %O, i32 %mul8.i20.iter73, !dbg !323
  %arrayidx.i21.iter73 = getelementptr i8, ptr %640, i32 %k.0.i1270.iter73, !dbg !323
  %641 = load i8, ptr %arrayidx.i21.iter73, align 1, !dbg !323
  %add10.i.iter73 = or disjoint i32 584, %k.0.i1270.iter73, !dbg !324
  %add.ptr12.idx.i.iter73 = mul nuw nsw i32 %add10.i.iter73, 40, !dbg !325
  %add.ptr12.i.iter73 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter73, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter73 = zext i8 %641 to i32, !dbg !330
  %mul.i.i.iter73 = mul i32 %conv.i.i.iter73, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter73 = and i32 %mul.i.i.iter73, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter73 = lshr exact i32 %and.i.i.iter73, 4, !dbg !333
  %shr1.i.i.iter73 = lshr exact i32 %and.i.i.iter73, 3, !dbg !334
  %642 = xor i32 %shr.i.i.iter73, %shr1.i.i.iter73, !dbg !335
  %xor2.i.i.iter73 = xor i32 %642, %mul.i.i.iter73, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter73, !dbg !337

for.body.i.iter73:                                ; preds = %for.body.i.iter73, %for.body6.i17.iter73
  %i.0.i69.iter73 = phi i32 [ 0, %for.body6.i17.iter73 ], [ %inc.i26.iter73, %for.body.i.iter73 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter73, i32 %i.0.i69.iter73, !dbg !338
  %643 = load i64, ptr %arrayidx.i24.iter73, align 8, !dbg !338
  %and.i.iter73 = and i64 %643, 1229782938247303441, !dbg !339
  %and1.i.iter73 = and i32 %xor2.i.i.iter73, 255, !dbg !340
  %conv.i.iter73 = zext nneg i32 %and1.i.iter73 to i64, !dbg !341
  %mul.i25.iter73 = mul i64 %and.i.iter73, %conv.i.iter73, !dbg !342
  %shr.i.iter73 = lshr i64 %643, 1, !dbg !343
  %and3.i.iter73 = and i64 %shr.i.iter73, 1229782938247303441, !dbg !344
  %shr4.i.iter73 = lshr i32 %xor2.i.i.iter73, 8, !dbg !345
  %and5.i.iter73 = and i32 %shr4.i.iter73, 15, !dbg !346
  %conv6.i.iter73 = zext nneg i32 %and5.i.iter73 to i64, !dbg !347
  %mul7.i.iter73 = mul nuw i64 %and3.i.iter73, %conv6.i.iter73, !dbg !348
  %xor.i.iter73 = xor i64 %mul.i25.iter73, %mul7.i.iter73, !dbg !349
  %arrayidx8.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter73, i32 %i.0.i69.iter73, !dbg !350
  %644 = load i64, ptr %arrayidx8.i.iter73, align 8, !dbg !350
  %shr9.i.iter73 = lshr i64 %644, 2, !dbg !351
  %and10.i.iter73 = and i64 %shr9.i.iter73, 1229782938247303441, !dbg !352
  %shr11.i.iter73 = lshr i32 %xor2.i.i.iter73, 16, !dbg !353
  %and12.i.iter73 = and i32 %shr11.i.iter73, 15, !dbg !354
  %conv13.i.iter73 = zext nneg i32 %and12.i.iter73 to i64, !dbg !355
  %mul14.i.iter73 = mul nuw i64 %and10.i.iter73, %conv13.i.iter73, !dbg !356
  %xor15.i.iter73 = xor i64 %xor.i.iter73, %mul14.i.iter73, !dbg !357
  %arrayidx16.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter73, i32 %i.0.i69.iter73, !dbg !358
  %645 = load i64, ptr %arrayidx16.i.iter73, align 8, !dbg !358
  %shr17.i.iter73 = lshr i64 %645, 3, !dbg !359
  %and18.i.iter73 = and i64 %shr17.i.iter73, 1229782938247303441, !dbg !360
  %shr19.i.iter73 = lshr i32 %xor2.i.i.iter73, 24, !dbg !361
  %and20.i.iter73 = and i32 %shr19.i.iter73, 15, !dbg !362
  %conv21.i.iter73 = zext nneg i32 %and20.i.iter73 to i64, !dbg !363
  %mul22.i.iter73 = mul nuw i64 %and18.i.iter73, %conv21.i.iter73, !dbg !364
  %xor23.i.iter73 = xor i64 %xor15.i.iter73, %mul22.i.iter73, !dbg !365
  %arrayidx24.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter73, i32 %i.0.i69.iter73, !dbg !366
  %646 = load i64, ptr %arrayidx24.i.iter73, align 8, !dbg !367
  %xor25.i.iter73 = xor i64 %646, %xor23.i.iter73, !dbg !367
  store i64 %xor25.i.iter73, ptr %arrayidx24.i.iter73, align 8, !dbg !367
  %inc.i26.iter73 = add nuw nsw i32 %i.0.i69.iter73, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter73 = icmp eq i32 %inc.i26.iter73, 5, !dbg !369
  br i1 %exitcond.i23.not.iter73, label %m_vec_mul_add.exit.iter73, label %for.body.i.iter73, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter73:                        ; preds = %for.body.i.iter73
  %add13.i.iter73 = add nuw nsw i32 %k.0.i1270.iter73, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter73 = icmp eq i32 %add13.i.iter73, 8, !dbg !373
  br i1 %exitcond.i13.not.iter73, label %for.inc15.i14.iter73, label %for.body6.i17.iter73, !dbg !374, !llvm.loop !375

for.inc15.i14.iter73:                             ; preds = %m_vec_mul_add.exit.iter73
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter73 = add i32 %bs_mat_entries_used.1.i72.iter73, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter73 = add nuw nsw i32 %c.0.i673.iter73, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter73 = icmp eq i32 %add14.i15.iter73, %639, !dbg !379
  br i1 %exitcond1.i7.not.iter73, label %for.cond1.i5.for.inc17.i8_crit_edge.iter73, label %for.cond4.i11.preheader.iter73, !dbg !313, !llvm.loop !380

for.inc17.i8.iter73:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter73
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_73_end

for.cond4.i11.preheader.iter73:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter73, %for.inc15.i14.iter73
  %c.0.i673.iter73 = phi i32 [ 73, %for.cond4.i11.preheader.lr.ph.iter73 ], [ %inc.i16.iter73, %for.inc15.i14.iter73 ]
  %bs_mat_entries_used.1.i72.iter73 = phi i32 [ %split.iter72, %for.cond4.i11.preheader.lr.ph.iter73 ], [ %add14.i15.iter73, %for.inc15.i14.iter73 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter73, !dbg !374

for.cond4.i11.preheader.lr.ph.iter73:             ; preds = %for.cond1.preheader.i4.iter73
  br label %for.cond4.i11.preheader.iter73, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter73:       ; preds = %for.inc15.i14.iter73
  %split.iter73 = phi i32 [ %add14.i15.iter73, %for.inc15.i14.iter73 ]
  br label %for.inc17.i8.iter73, !dbg !313

iter_73_end:                                      ; preds = %for.inc17.i8.iter73
  br label %iter_74_start

iter_74_start:                                    ; preds = %iter_73_end
  br label %for.cond1.preheader.i4.iter74

for.cond1.preheader.i4.iter74:                    ; preds = %iter_74_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %647 = add i32 %split.iter73, 4, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter74, !dbg !313

for.body6.i17.iter74:                             ; preds = %for.cond4.i11.preheader.iter74, %m_vec_mul_add.exit.iter74
  %k.0.i1270.iter74 = phi i32 [ 0, %for.cond4.i11.preheader.iter74 ], [ %add13.i.iter74, %m_vec_mul_add.exit.iter74 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter74 = mul nsw i32 %bs_mat_entries_used.1.i72.iter74, 40, !dbg !319
  %add.ptr.i19.iter74 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter74, !dbg !319
  %mul8.i20.iter74 = shl nuw nsw i32 %c.0.i673.iter74, 3, !dbg !322
  %648 = getelementptr i8, ptr %O, i32 %mul8.i20.iter74, !dbg !323
  %arrayidx.i21.iter74 = getelementptr i8, ptr %648, i32 %k.0.i1270.iter74, !dbg !323
  %649 = load i8, ptr %arrayidx.i21.iter74, align 1, !dbg !323
  %add10.i.iter74 = or disjoint i32 592, %k.0.i1270.iter74, !dbg !324
  %add.ptr12.idx.i.iter74 = mul nuw nsw i32 %add10.i.iter74, 40, !dbg !325
  %add.ptr12.i.iter74 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter74, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter74 = zext i8 %649 to i32, !dbg !330
  %mul.i.i.iter74 = mul i32 %conv.i.i.iter74, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter74 = and i32 %mul.i.i.iter74, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter74 = lshr exact i32 %and.i.i.iter74, 4, !dbg !333
  %shr1.i.i.iter74 = lshr exact i32 %and.i.i.iter74, 3, !dbg !334
  %650 = xor i32 %shr.i.i.iter74, %shr1.i.i.iter74, !dbg !335
  %xor2.i.i.iter74 = xor i32 %650, %mul.i.i.iter74, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter74, !dbg !337

for.body.i.iter74:                                ; preds = %for.body.i.iter74, %for.body6.i17.iter74
  %i.0.i69.iter74 = phi i32 [ 0, %for.body6.i17.iter74 ], [ %inc.i26.iter74, %for.body.i.iter74 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter74, i32 %i.0.i69.iter74, !dbg !338
  %651 = load i64, ptr %arrayidx.i24.iter74, align 8, !dbg !338
  %and.i.iter74 = and i64 %651, 1229782938247303441, !dbg !339
  %and1.i.iter74 = and i32 %xor2.i.i.iter74, 255, !dbg !340
  %conv.i.iter74 = zext nneg i32 %and1.i.iter74 to i64, !dbg !341
  %mul.i25.iter74 = mul i64 %and.i.iter74, %conv.i.iter74, !dbg !342
  %shr.i.iter74 = lshr i64 %651, 1, !dbg !343
  %and3.i.iter74 = and i64 %shr.i.iter74, 1229782938247303441, !dbg !344
  %shr4.i.iter74 = lshr i32 %xor2.i.i.iter74, 8, !dbg !345
  %and5.i.iter74 = and i32 %shr4.i.iter74, 15, !dbg !346
  %conv6.i.iter74 = zext nneg i32 %and5.i.iter74 to i64, !dbg !347
  %mul7.i.iter74 = mul nuw i64 %and3.i.iter74, %conv6.i.iter74, !dbg !348
  %xor.i.iter74 = xor i64 %mul.i25.iter74, %mul7.i.iter74, !dbg !349
  %arrayidx8.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter74, i32 %i.0.i69.iter74, !dbg !350
  %652 = load i64, ptr %arrayidx8.i.iter74, align 8, !dbg !350
  %shr9.i.iter74 = lshr i64 %652, 2, !dbg !351
  %and10.i.iter74 = and i64 %shr9.i.iter74, 1229782938247303441, !dbg !352
  %shr11.i.iter74 = lshr i32 %xor2.i.i.iter74, 16, !dbg !353
  %and12.i.iter74 = and i32 %shr11.i.iter74, 15, !dbg !354
  %conv13.i.iter74 = zext nneg i32 %and12.i.iter74 to i64, !dbg !355
  %mul14.i.iter74 = mul nuw i64 %and10.i.iter74, %conv13.i.iter74, !dbg !356
  %xor15.i.iter74 = xor i64 %xor.i.iter74, %mul14.i.iter74, !dbg !357
  %arrayidx16.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter74, i32 %i.0.i69.iter74, !dbg !358
  %653 = load i64, ptr %arrayidx16.i.iter74, align 8, !dbg !358
  %shr17.i.iter74 = lshr i64 %653, 3, !dbg !359
  %and18.i.iter74 = and i64 %shr17.i.iter74, 1229782938247303441, !dbg !360
  %shr19.i.iter74 = lshr i32 %xor2.i.i.iter74, 24, !dbg !361
  %and20.i.iter74 = and i32 %shr19.i.iter74, 15, !dbg !362
  %conv21.i.iter74 = zext nneg i32 %and20.i.iter74 to i64, !dbg !363
  %mul22.i.iter74 = mul nuw i64 %and18.i.iter74, %conv21.i.iter74, !dbg !364
  %xor23.i.iter74 = xor i64 %xor15.i.iter74, %mul22.i.iter74, !dbg !365
  %arrayidx24.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter74, i32 %i.0.i69.iter74, !dbg !366
  %654 = load i64, ptr %arrayidx24.i.iter74, align 8, !dbg !367
  %xor25.i.iter74 = xor i64 %654, %xor23.i.iter74, !dbg !367
  store i64 %xor25.i.iter74, ptr %arrayidx24.i.iter74, align 8, !dbg !367
  %inc.i26.iter74 = add nuw nsw i32 %i.0.i69.iter74, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter74 = icmp eq i32 %inc.i26.iter74, 5, !dbg !369
  br i1 %exitcond.i23.not.iter74, label %m_vec_mul_add.exit.iter74, label %for.body.i.iter74, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter74:                        ; preds = %for.body.i.iter74
  %add13.i.iter74 = add nuw nsw i32 %k.0.i1270.iter74, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter74 = icmp eq i32 %add13.i.iter74, 8, !dbg !373
  br i1 %exitcond.i13.not.iter74, label %for.inc15.i14.iter74, label %for.body6.i17.iter74, !dbg !374, !llvm.loop !375

for.inc15.i14.iter74:                             ; preds = %m_vec_mul_add.exit.iter74
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter74 = add i32 %bs_mat_entries_used.1.i72.iter74, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter74 = add nuw nsw i32 %c.0.i673.iter74, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter74 = icmp eq i32 %add14.i15.iter74, %647, !dbg !379
  br i1 %exitcond1.i7.not.iter74, label %for.cond1.i5.for.inc17.i8_crit_edge.iter74, label %for.cond4.i11.preheader.iter74, !dbg !313, !llvm.loop !380

for.inc17.i8.iter74:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter74
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_74_end

for.cond4.i11.preheader.iter74:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter74, %for.inc15.i14.iter74
  %c.0.i673.iter74 = phi i32 [ 74, %for.cond4.i11.preheader.lr.ph.iter74 ], [ %inc.i16.iter74, %for.inc15.i14.iter74 ]
  %bs_mat_entries_used.1.i72.iter74 = phi i32 [ %split.iter73, %for.cond4.i11.preheader.lr.ph.iter74 ], [ %add14.i15.iter74, %for.inc15.i14.iter74 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter74, !dbg !374

for.cond4.i11.preheader.lr.ph.iter74:             ; preds = %for.cond1.preheader.i4.iter74
  br label %for.cond4.i11.preheader.iter74, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter74:       ; preds = %for.inc15.i14.iter74
  %split.iter74 = phi i32 [ %add14.i15.iter74, %for.inc15.i14.iter74 ]
  br label %for.inc17.i8.iter74, !dbg !313

iter_74_end:                                      ; preds = %for.inc17.i8.iter74
  br label %iter_75_start

iter_75_start:                                    ; preds = %iter_74_end
  br label %for.cond1.preheader.i4.iter75

for.cond1.preheader.i4.iter75:                    ; preds = %iter_75_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %655 = add i32 %split.iter74, 3, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter75, !dbg !313

for.body6.i17.iter75:                             ; preds = %for.cond4.i11.preheader.iter75, %m_vec_mul_add.exit.iter75
  %k.0.i1270.iter75 = phi i32 [ 0, %for.cond4.i11.preheader.iter75 ], [ %add13.i.iter75, %m_vec_mul_add.exit.iter75 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter75 = mul nsw i32 %bs_mat_entries_used.1.i72.iter75, 40, !dbg !319
  %add.ptr.i19.iter75 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter75, !dbg !319
  %mul8.i20.iter75 = shl nuw nsw i32 %c.0.i673.iter75, 3, !dbg !322
  %656 = getelementptr i8, ptr %O, i32 %mul8.i20.iter75, !dbg !323
  %arrayidx.i21.iter75 = getelementptr i8, ptr %656, i32 %k.0.i1270.iter75, !dbg !323
  %657 = load i8, ptr %arrayidx.i21.iter75, align 1, !dbg !323
  %add10.i.iter75 = or disjoint i32 600, %k.0.i1270.iter75, !dbg !324
  %add.ptr12.idx.i.iter75 = mul nuw nsw i32 %add10.i.iter75, 40, !dbg !325
  %add.ptr12.i.iter75 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter75, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter75 = zext i8 %657 to i32, !dbg !330
  %mul.i.i.iter75 = mul i32 %conv.i.i.iter75, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter75 = and i32 %mul.i.i.iter75, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter75 = lshr exact i32 %and.i.i.iter75, 4, !dbg !333
  %shr1.i.i.iter75 = lshr exact i32 %and.i.i.iter75, 3, !dbg !334
  %658 = xor i32 %shr.i.i.iter75, %shr1.i.i.iter75, !dbg !335
  %xor2.i.i.iter75 = xor i32 %658, %mul.i.i.iter75, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter75, !dbg !337

for.body.i.iter75:                                ; preds = %for.body.i.iter75, %for.body6.i17.iter75
  %i.0.i69.iter75 = phi i32 [ 0, %for.body6.i17.iter75 ], [ %inc.i26.iter75, %for.body.i.iter75 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter75, i32 %i.0.i69.iter75, !dbg !338
  %659 = load i64, ptr %arrayidx.i24.iter75, align 8, !dbg !338
  %and.i.iter75 = and i64 %659, 1229782938247303441, !dbg !339
  %and1.i.iter75 = and i32 %xor2.i.i.iter75, 255, !dbg !340
  %conv.i.iter75 = zext nneg i32 %and1.i.iter75 to i64, !dbg !341
  %mul.i25.iter75 = mul i64 %and.i.iter75, %conv.i.iter75, !dbg !342
  %shr.i.iter75 = lshr i64 %659, 1, !dbg !343
  %and3.i.iter75 = and i64 %shr.i.iter75, 1229782938247303441, !dbg !344
  %shr4.i.iter75 = lshr i32 %xor2.i.i.iter75, 8, !dbg !345
  %and5.i.iter75 = and i32 %shr4.i.iter75, 15, !dbg !346
  %conv6.i.iter75 = zext nneg i32 %and5.i.iter75 to i64, !dbg !347
  %mul7.i.iter75 = mul nuw i64 %and3.i.iter75, %conv6.i.iter75, !dbg !348
  %xor.i.iter75 = xor i64 %mul.i25.iter75, %mul7.i.iter75, !dbg !349
  %arrayidx8.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter75, i32 %i.0.i69.iter75, !dbg !350
  %660 = load i64, ptr %arrayidx8.i.iter75, align 8, !dbg !350
  %shr9.i.iter75 = lshr i64 %660, 2, !dbg !351
  %and10.i.iter75 = and i64 %shr9.i.iter75, 1229782938247303441, !dbg !352
  %shr11.i.iter75 = lshr i32 %xor2.i.i.iter75, 16, !dbg !353
  %and12.i.iter75 = and i32 %shr11.i.iter75, 15, !dbg !354
  %conv13.i.iter75 = zext nneg i32 %and12.i.iter75 to i64, !dbg !355
  %mul14.i.iter75 = mul nuw i64 %and10.i.iter75, %conv13.i.iter75, !dbg !356
  %xor15.i.iter75 = xor i64 %xor.i.iter75, %mul14.i.iter75, !dbg !357
  %arrayidx16.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter75, i32 %i.0.i69.iter75, !dbg !358
  %661 = load i64, ptr %arrayidx16.i.iter75, align 8, !dbg !358
  %shr17.i.iter75 = lshr i64 %661, 3, !dbg !359
  %and18.i.iter75 = and i64 %shr17.i.iter75, 1229782938247303441, !dbg !360
  %shr19.i.iter75 = lshr i32 %xor2.i.i.iter75, 24, !dbg !361
  %and20.i.iter75 = and i32 %shr19.i.iter75, 15, !dbg !362
  %conv21.i.iter75 = zext nneg i32 %and20.i.iter75 to i64, !dbg !363
  %mul22.i.iter75 = mul nuw i64 %and18.i.iter75, %conv21.i.iter75, !dbg !364
  %xor23.i.iter75 = xor i64 %xor15.i.iter75, %mul22.i.iter75, !dbg !365
  %arrayidx24.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter75, i32 %i.0.i69.iter75, !dbg !366
  %662 = load i64, ptr %arrayidx24.i.iter75, align 8, !dbg !367
  %xor25.i.iter75 = xor i64 %662, %xor23.i.iter75, !dbg !367
  store i64 %xor25.i.iter75, ptr %arrayidx24.i.iter75, align 8, !dbg !367
  %inc.i26.iter75 = add nuw nsw i32 %i.0.i69.iter75, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter75 = icmp eq i32 %inc.i26.iter75, 5, !dbg !369
  br i1 %exitcond.i23.not.iter75, label %m_vec_mul_add.exit.iter75, label %for.body.i.iter75, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter75:                        ; preds = %for.body.i.iter75
  %add13.i.iter75 = add nuw nsw i32 %k.0.i1270.iter75, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter75 = icmp eq i32 %add13.i.iter75, 8, !dbg !373
  br i1 %exitcond.i13.not.iter75, label %for.inc15.i14.iter75, label %for.body6.i17.iter75, !dbg !374, !llvm.loop !375

for.inc15.i14.iter75:                             ; preds = %m_vec_mul_add.exit.iter75
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter75 = add i32 %bs_mat_entries_used.1.i72.iter75, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter75 = add nuw nsw i32 %c.0.i673.iter75, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter75 = icmp eq i32 %add14.i15.iter75, %655, !dbg !379
  br i1 %exitcond1.i7.not.iter75, label %for.cond1.i5.for.inc17.i8_crit_edge.iter75, label %for.cond4.i11.preheader.iter75, !dbg !313, !llvm.loop !380

for.inc17.i8.iter75:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter75
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_75_end

for.cond4.i11.preheader.iter75:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter75, %for.inc15.i14.iter75
  %c.0.i673.iter75 = phi i32 [ 75, %for.cond4.i11.preheader.lr.ph.iter75 ], [ %inc.i16.iter75, %for.inc15.i14.iter75 ]
  %bs_mat_entries_used.1.i72.iter75 = phi i32 [ %split.iter74, %for.cond4.i11.preheader.lr.ph.iter75 ], [ %add14.i15.iter75, %for.inc15.i14.iter75 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter75, !dbg !374

for.cond4.i11.preheader.lr.ph.iter75:             ; preds = %for.cond1.preheader.i4.iter75
  br label %for.cond4.i11.preheader.iter75, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter75:       ; preds = %for.inc15.i14.iter75
  %split.iter75 = phi i32 [ %add14.i15.iter75, %for.inc15.i14.iter75 ]
  br label %for.inc17.i8.iter75, !dbg !313

iter_75_end:                                      ; preds = %for.inc17.i8.iter75
  br label %iter_76_start

iter_76_start:                                    ; preds = %iter_75_end
  br label %for.cond1.preheader.i4.iter76

for.cond1.preheader.i4.iter76:                    ; preds = %iter_76_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %663 = add i32 %split.iter75, 2, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter76, !dbg !313

for.body6.i17.iter76:                             ; preds = %for.cond4.i11.preheader.iter76, %m_vec_mul_add.exit.iter76
  %k.0.i1270.iter76 = phi i32 [ 0, %for.cond4.i11.preheader.iter76 ], [ %add13.i.iter76, %m_vec_mul_add.exit.iter76 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter76 = mul nsw i32 %bs_mat_entries_used.1.i72.iter76, 40, !dbg !319
  %add.ptr.i19.iter76 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter76, !dbg !319
  %mul8.i20.iter76 = shl nuw nsw i32 %c.0.i673.iter76, 3, !dbg !322
  %664 = getelementptr i8, ptr %O, i32 %mul8.i20.iter76, !dbg !323
  %arrayidx.i21.iter76 = getelementptr i8, ptr %664, i32 %k.0.i1270.iter76, !dbg !323
  %665 = load i8, ptr %arrayidx.i21.iter76, align 1, !dbg !323
  %add10.i.iter76 = or disjoint i32 608, %k.0.i1270.iter76, !dbg !324
  %add.ptr12.idx.i.iter76 = mul nuw nsw i32 %add10.i.iter76, 40, !dbg !325
  %add.ptr12.i.iter76 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter76, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter76 = zext i8 %665 to i32, !dbg !330
  %mul.i.i.iter76 = mul i32 %conv.i.i.iter76, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter76 = and i32 %mul.i.i.iter76, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter76 = lshr exact i32 %and.i.i.iter76, 4, !dbg !333
  %shr1.i.i.iter76 = lshr exact i32 %and.i.i.iter76, 3, !dbg !334
  %666 = xor i32 %shr.i.i.iter76, %shr1.i.i.iter76, !dbg !335
  %xor2.i.i.iter76 = xor i32 %666, %mul.i.i.iter76, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter76, !dbg !337

for.body.i.iter76:                                ; preds = %for.body.i.iter76, %for.body6.i17.iter76
  %i.0.i69.iter76 = phi i32 [ 0, %for.body6.i17.iter76 ], [ %inc.i26.iter76, %for.body.i.iter76 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter76, i32 %i.0.i69.iter76, !dbg !338
  %667 = load i64, ptr %arrayidx.i24.iter76, align 8, !dbg !338
  %and.i.iter76 = and i64 %667, 1229782938247303441, !dbg !339
  %and1.i.iter76 = and i32 %xor2.i.i.iter76, 255, !dbg !340
  %conv.i.iter76 = zext nneg i32 %and1.i.iter76 to i64, !dbg !341
  %mul.i25.iter76 = mul i64 %and.i.iter76, %conv.i.iter76, !dbg !342
  %shr.i.iter76 = lshr i64 %667, 1, !dbg !343
  %and3.i.iter76 = and i64 %shr.i.iter76, 1229782938247303441, !dbg !344
  %shr4.i.iter76 = lshr i32 %xor2.i.i.iter76, 8, !dbg !345
  %and5.i.iter76 = and i32 %shr4.i.iter76, 15, !dbg !346
  %conv6.i.iter76 = zext nneg i32 %and5.i.iter76 to i64, !dbg !347
  %mul7.i.iter76 = mul nuw i64 %and3.i.iter76, %conv6.i.iter76, !dbg !348
  %xor.i.iter76 = xor i64 %mul.i25.iter76, %mul7.i.iter76, !dbg !349
  %arrayidx8.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter76, i32 %i.0.i69.iter76, !dbg !350
  %668 = load i64, ptr %arrayidx8.i.iter76, align 8, !dbg !350
  %shr9.i.iter76 = lshr i64 %668, 2, !dbg !351
  %and10.i.iter76 = and i64 %shr9.i.iter76, 1229782938247303441, !dbg !352
  %shr11.i.iter76 = lshr i32 %xor2.i.i.iter76, 16, !dbg !353
  %and12.i.iter76 = and i32 %shr11.i.iter76, 15, !dbg !354
  %conv13.i.iter76 = zext nneg i32 %and12.i.iter76 to i64, !dbg !355
  %mul14.i.iter76 = mul nuw i64 %and10.i.iter76, %conv13.i.iter76, !dbg !356
  %xor15.i.iter76 = xor i64 %xor.i.iter76, %mul14.i.iter76, !dbg !357
  %arrayidx16.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter76, i32 %i.0.i69.iter76, !dbg !358
  %669 = load i64, ptr %arrayidx16.i.iter76, align 8, !dbg !358
  %shr17.i.iter76 = lshr i64 %669, 3, !dbg !359
  %and18.i.iter76 = and i64 %shr17.i.iter76, 1229782938247303441, !dbg !360
  %shr19.i.iter76 = lshr i32 %xor2.i.i.iter76, 24, !dbg !361
  %and20.i.iter76 = and i32 %shr19.i.iter76, 15, !dbg !362
  %conv21.i.iter76 = zext nneg i32 %and20.i.iter76 to i64, !dbg !363
  %mul22.i.iter76 = mul nuw i64 %and18.i.iter76, %conv21.i.iter76, !dbg !364
  %xor23.i.iter76 = xor i64 %xor15.i.iter76, %mul22.i.iter76, !dbg !365
  %arrayidx24.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter76, i32 %i.0.i69.iter76, !dbg !366
  %670 = load i64, ptr %arrayidx24.i.iter76, align 8, !dbg !367
  %xor25.i.iter76 = xor i64 %670, %xor23.i.iter76, !dbg !367
  store i64 %xor25.i.iter76, ptr %arrayidx24.i.iter76, align 8, !dbg !367
  %inc.i26.iter76 = add nuw nsw i32 %i.0.i69.iter76, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter76 = icmp eq i32 %inc.i26.iter76, 5, !dbg !369
  br i1 %exitcond.i23.not.iter76, label %m_vec_mul_add.exit.iter76, label %for.body.i.iter76, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter76:                        ; preds = %for.body.i.iter76
  %add13.i.iter76 = add nuw nsw i32 %k.0.i1270.iter76, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter76 = icmp eq i32 %add13.i.iter76, 8, !dbg !373
  br i1 %exitcond.i13.not.iter76, label %for.inc15.i14.iter76, label %for.body6.i17.iter76, !dbg !374, !llvm.loop !375

for.inc15.i14.iter76:                             ; preds = %m_vec_mul_add.exit.iter76
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter76 = add i32 %bs_mat_entries_used.1.i72.iter76, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter76 = add nuw nsw i32 %c.0.i673.iter76, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter76 = icmp eq i32 %add14.i15.iter76, %663, !dbg !379
  br i1 %exitcond1.i7.not.iter76, label %for.cond1.i5.for.inc17.i8_crit_edge.iter76, label %for.cond4.i11.preheader.iter76, !dbg !313, !llvm.loop !380

for.inc17.i8.iter76:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter76
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_76_end

for.cond4.i11.preheader.iter76:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter76, %for.inc15.i14.iter76
  %c.0.i673.iter76 = phi i32 [ 76, %for.cond4.i11.preheader.lr.ph.iter76 ], [ %inc.i16.iter76, %for.inc15.i14.iter76 ]
  %bs_mat_entries_used.1.i72.iter76 = phi i32 [ %split.iter75, %for.cond4.i11.preheader.lr.ph.iter76 ], [ %add14.i15.iter76, %for.inc15.i14.iter76 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter76, !dbg !374

for.cond4.i11.preheader.lr.ph.iter76:             ; preds = %for.cond1.preheader.i4.iter76
  br label %for.cond4.i11.preheader.iter76, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter76:       ; preds = %for.inc15.i14.iter76
  %split.iter76 = phi i32 [ %add14.i15.iter76, %for.inc15.i14.iter76 ]
  br label %for.inc17.i8.iter76, !dbg !313

iter_76_end:                                      ; preds = %for.inc17.i8.iter76
  br label %iter_77_start

iter_77_start:                                    ; preds = %iter_76_end
  br label %for.cond1.preheader.i4.iter77

for.cond1.preheader.i4.iter77:                    ; preds = %iter_77_start
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %671 = add i32 %split.iter76, 1, !dbg !313
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %for.cond4.i11.preheader.lr.ph.iter77, !dbg !313

for.body6.i17.iter77:                             ; preds = %for.cond4.i11.preheader.iter77, %m_vec_mul_add.exit.iter77
  %k.0.i1270.iter77 = phi i32 [ 0, %for.cond4.i11.preheader.iter77 ], [ %add13.i.iter77, %m_vec_mul_add.exit.iter77 ]
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %add.ptr.idx.i18.iter77 = mul nsw i32 %bs_mat_entries_used.1.i72.iter77, 40, !dbg !319
  %add.ptr.i19.iter77 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18.iter77, !dbg !319
  %mul8.i20.iter77 = shl nuw nsw i32 %c.0.i673.iter77, 3, !dbg !322
  %672 = getelementptr i8, ptr %O, i32 %mul8.i20.iter77, !dbg !323
  %arrayidx.i21.iter77 = getelementptr i8, ptr %672, i32 %k.0.i1270.iter77, !dbg !323
  %673 = load i8, ptr %arrayidx.i21.iter77, align 1, !dbg !323
  %add10.i.iter77 = or disjoint i32 616, %k.0.i1270.iter77, !dbg !324
  %add.ptr12.idx.i.iter77 = mul nuw nsw i32 %add10.i.iter77, 40, !dbg !325
  %add.ptr12.i.iter77 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i.iter77, !dbg !325
    #dbg_value(i32 5, !230, !DIExpression(), !326)
    #dbg_value(ptr undef, !237, !DIExpression(), !326)
    #dbg_value(i8 undef, !238, !DIExpression(), !326)
    #dbg_value(ptr undef, !239, !DIExpression(), !326)
    #dbg_value(i8 undef, !240, !DIExpression(), !328)
  %conv.i.i.iter77 = zext i8 %673 to i32, !dbg !330
  %mul.i.i.iter77 = mul i32 %conv.i.i.iter77, 134480385, !dbg !331
    #dbg_value(i32 undef, !249, !DIExpression(), !328)
    #dbg_value(i32 -252645136, !250, !DIExpression(), !328)
  %and.i.i.iter77 = and i32 %mul.i.i.iter77, -252645136, !dbg !332
    #dbg_value(i32 undef, !252, !DIExpression(), !328)
  %shr.i.i.iter77 = lshr exact i32 %and.i.i.iter77, 4, !dbg !333
  %shr1.i.i.iter77 = lshr exact i32 %and.i.i.iter77, 3, !dbg !334
  %674 = xor i32 %shr.i.i.iter77, %shr1.i.i.iter77, !dbg !335
  %xor2.i.i.iter77 = xor i32 %674, %mul.i.i.iter77, !dbg !335
    #dbg_value(i32 undef, !256, !DIExpression(), !326)
    #dbg_value(i64 1229782938247303441, !257, !DIExpression(), !326)
    #dbg_value(i32 0, !258, !DIExpression(), !336)
  br label %for.body.i.iter77, !dbg !337

for.body.i.iter77:                                ; preds = %for.body.i.iter77, %for.body6.i17.iter77
  %i.0.i69.iter77 = phi i32 [ 0, %for.body6.i17.iter77 ], [ %inc.i26.iter77, %for.body.i.iter77 ]
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %arrayidx.i24.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter77, i32 %i.0.i69.iter77, !dbg !338
  %675 = load i64, ptr %arrayidx.i24.iter77, align 8, !dbg !338
  %and.i.iter77 = and i64 %675, 1229782938247303441, !dbg !339
  %and1.i.iter77 = and i32 %xor2.i.i.iter77, 255, !dbg !340
  %conv.i.iter77 = zext nneg i32 %and1.i.iter77 to i64, !dbg !341
  %mul.i25.iter77 = mul i64 %and.i.iter77, %conv.i.iter77, !dbg !342
  %shr.i.iter77 = lshr i64 %675, 1, !dbg !343
  %and3.i.iter77 = and i64 %shr.i.iter77, 1229782938247303441, !dbg !344
  %shr4.i.iter77 = lshr i32 %xor2.i.i.iter77, 8, !dbg !345
  %and5.i.iter77 = and i32 %shr4.i.iter77, 15, !dbg !346
  %conv6.i.iter77 = zext nneg i32 %and5.i.iter77 to i64, !dbg !347
  %mul7.i.iter77 = mul nuw i64 %and3.i.iter77, %conv6.i.iter77, !dbg !348
  %xor.i.iter77 = xor i64 %mul.i25.iter77, %mul7.i.iter77, !dbg !349
  %arrayidx8.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter77, i32 %i.0.i69.iter77, !dbg !350
  %676 = load i64, ptr %arrayidx8.i.iter77, align 8, !dbg !350
  %shr9.i.iter77 = lshr i64 %676, 2, !dbg !351
  %and10.i.iter77 = and i64 %shr9.i.iter77, 1229782938247303441, !dbg !352
  %shr11.i.iter77 = lshr i32 %xor2.i.i.iter77, 16, !dbg !353
  %and12.i.iter77 = and i32 %shr11.i.iter77, 15, !dbg !354
  %conv13.i.iter77 = zext nneg i32 %and12.i.iter77 to i64, !dbg !355
  %mul14.i.iter77 = mul nuw i64 %and10.i.iter77, %conv13.i.iter77, !dbg !356
  %xor15.i.iter77 = xor i64 %xor.i.iter77, %mul14.i.iter77, !dbg !357
  %arrayidx16.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.i19.iter77, i32 %i.0.i69.iter77, !dbg !358
  %677 = load i64, ptr %arrayidx16.i.iter77, align 8, !dbg !358
  %shr17.i.iter77 = lshr i64 %677, 3, !dbg !359
  %and18.i.iter77 = and i64 %shr17.i.iter77, 1229782938247303441, !dbg !360
  %shr19.i.iter77 = lshr i32 %xor2.i.i.iter77, 24, !dbg !361
  %and20.i.iter77 = and i32 %shr19.i.iter77, 15, !dbg !362
  %conv21.i.iter77 = zext nneg i32 %and20.i.iter77 to i64, !dbg !363
  %mul22.i.iter77 = mul nuw i64 %and18.i.iter77, %conv21.i.iter77, !dbg !364
  %xor23.i.iter77 = xor i64 %xor15.i.iter77, %mul22.i.iter77, !dbg !365
  %arrayidx24.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr12.i.iter77, i32 %i.0.i69.iter77, !dbg !366
  %678 = load i64, ptr %arrayidx24.i.iter77, align 8, !dbg !367
  %xor25.i.iter77 = xor i64 %678, %xor23.i.iter77, !dbg !367
  store i64 %xor25.i.iter77, ptr %arrayidx24.i.iter77, align 8, !dbg !367
  %inc.i26.iter77 = add nuw nsw i32 %i.0.i69.iter77, 1, !dbg !368
    #dbg_value(i32 undef, !258, !DIExpression(), !336)
  %exitcond.i23.not.iter77 = icmp eq i32 %inc.i26.iter77, 5, !dbg !369
  br i1 %exitcond.i23.not.iter77, label %m_vec_mul_add.exit.iter77, label %for.body.i.iter77, !dbg !337, !llvm.loop !370

m_vec_mul_add.exit.iter77:                        ; preds = %for.body.i.iter77
  %add13.i.iter77 = add nuw nsw i32 %k.0.i1270.iter77, 1, !dbg !372
    #dbg_value(i32 undef, !314, !DIExpression(), !318)
  %exitcond.i13.not.iter77 = icmp eq i32 %add13.i.iter77, 8, !dbg !373
  br i1 %exitcond.i13.not.iter77, label %for.inc15.i14.iter77, label %for.body6.i17.iter77, !dbg !374, !llvm.loop !375

for.inc15.i14.iter77:                             ; preds = %m_vec_mul_add.exit.iter77
    #dbg_value(i32 undef, !198, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !189)
  %add14.i15.iter77 = add i32 %bs_mat_entries_used.1.i72.iter77, 1, !dbg !377
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  %inc.i16.iter77 = add nuw nsw i32 %c.0.i673.iter77, 1, !dbg !378
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
  %exitcond1.i7.not.iter77 = icmp eq i32 %add14.i15.iter77, %671, !dbg !379
  br i1 %exitcond1.i7.not.iter77, label %for.cond1.i5.for.inc17.i8_crit_edge.iter77, label %for.cond4.i11.preheader.iter77, !dbg !313, !llvm.loop !380

for.inc17.i8.iter77:                              ; preds = %for.cond1.i5.for.inc17.i8_crit_edge.iter77
    #dbg_value(i32 undef, !199, !DIExpression(), !201)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
  br label %iter_77_end

for.cond4.i11.preheader.iter77:                   ; preds = %for.cond4.i11.preheader.lr.ph.iter77, %for.inc15.i14.iter77
  %c.0.i673.iter77 = phi i32 [ 77, %for.cond4.i11.preheader.lr.ph.iter77 ], [ %inc.i16.iter77, %for.inc15.i14.iter77 ]
  %bs_mat_entries_used.1.i72.iter77 = phi i32 [ %split.iter76, %for.cond4.i11.preheader.lr.ph.iter77 ], [ %add14.i15.iter77, %for.inc15.i14.iter77 ]
    #dbg_value(i32 undef, !308, !DIExpression(), !312)
    #dbg_value(i32 undef, !198, !DIExpression(), !189)
    #dbg_value(i32 0, !314, !DIExpression(), !318)
  br label %for.body6.i17.iter77, !dbg !374

for.cond4.i11.preheader.lr.ph.iter77:             ; preds = %for.cond1.preheader.i4.iter77
  br label %for.cond4.i11.preheader.iter77, !dbg !313

for.cond1.i5.for.inc17.i8_crit_edge.iter77:       ; preds = %for.inc15.i14.iter77
  br label %for.inc17.i8.iter77, !dbg !313

iter_77_end:                                      ; preds = %for.inc17.i8.iter77
  br label %for.cond.i.preheader
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !382
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P = alloca [18525 x i64], align 16, !llvmbmc.var !383
  call void @mayo_memset(ptr %P, i8 0, i32 148200)
  store i8 -80, ptr %P, align 1
  %byte1 = getelementptr inbounds nuw i8, ptr %P, i32 1
  store i8 78, ptr %byte1, align 1
  %byte2 = getelementptr inbounds nuw i8, ptr %P, i32 2
  store i8 25, ptr %byte2, align 1
  %byte3 = getelementptr inbounds nuw i8, ptr %P, i32 3
  store i8 47, ptr %byte3, align 1
  %byte4 = getelementptr inbounds nuw i8, ptr %P, i32 4
  store i8 4, ptr %byte4, align 1
  %byte5 = getelementptr inbounds nuw i8, ptr %P, i32 5
  store i8 19, ptr %byte5, align 1
  %byte6 = getelementptr inbounds nuw i8, ptr %P, i32 6
  store i8 -91, ptr %byte6, align 1
  %byte7 = getelementptr inbounds nuw i8, ptr %P, i32 7
  store i8 23, ptr %byte7, align 1
  %P1 = alloca [18525 x i64], align 16, !llvmbmc.var !383
  call void @mayo_memset(ptr %P1, i8 0, i32 148200)
  store i8 -48, ptr %P1, align 1
  %byte13 = getelementptr inbounds nuw i8, ptr %P1, i32 1
  store i8 -40, ptr %byte13, align 1
  %byte24 = getelementptr inbounds nuw i8, ptr %P1, i32 2
  store i8 65, ptr %byte24, align 1
  %byte35 = getelementptr inbounds nuw i8, ptr %P1, i32 3
  store i8 55, ptr %byte35, align 1
  %byte46 = getelementptr inbounds nuw i8, ptr %P1, i32 4
  store i8 34, ptr %byte46, align 1
  %byte57 = getelementptr inbounds nuw i8, ptr %P1, i32 5
  store i8 59, ptr %byte57, align 1
  %byte68 = getelementptr inbounds nuw i8, ptr %P1, i32 6
  store i8 33, ptr %byte68, align 1
  %byte79 = getelementptr inbounds nuw i8, ptr %P1, i32 7
  store i8 54, ptr %byte79, align 1
  %O = alloca [624 x i8], align 16, !llvmbmc.var !384
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  store i8 13, ptr %O, align 1
  %P3 = alloca [320 x i64], align 16, !llvmbmc.var !385
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  call fastcc void @compute_P3(ptr nonnull %p_buf, ptr %P, ptr %P1, ptr %O, ptr %P3)
  %out_actual_i8 = load i8, ptr %P3, align 1
  %out_cmp = icmp eq i8 %out_actual_i8, -111
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !386 {
entry:
    #dbg_value(ptr %dst, !390, !DIExpression(), !391)
    #dbg_value(i8 %val, !392, !DIExpression(), !391)
    #dbg_value(i32 %len, !393, !DIExpression(), !391)
    #dbg_value(ptr %dst, !394, !DIExpression(), !391)
    #dbg_value(i32 0, !395, !DIExpression(), !397)
  br label %for.cond, !dbg !398

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !399
    #dbg_value(i32 %i.0, !395, !DIExpression(), !397)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !400
  br i1 %exitcond, label %for.body, label %for.end, !dbg !402

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !403
  store i8 %val, ptr %arrayidx, align 1, !dbg !404
  %inc = add i32 %i.0, 1, !dbg !405
    #dbg_value(i32 %inc, !395, !DIExpression(), !397)
  br label %for.cond, !dbg !406, !llvm.loop !407

for.end:                                          ; preds = %for.cond
  ret void, !dbg !409
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !410 {
entry:
    #dbg_value(ptr %dst, !415, !DIExpression(), !416)
    #dbg_value(ptr %src, !417, !DIExpression(), !416)
    #dbg_value(i32 %len, !418, !DIExpression(), !416)
    #dbg_value(ptr %dst, !419, !DIExpression(), !416)
    #dbg_value(ptr %src, !420, !DIExpression(), !416)
    #dbg_value(i32 0, !423, !DIExpression(), !425)
  br label %for.cond, !dbg !426

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !427
    #dbg_value(i32 %i.0, !423, !DIExpression(), !425)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !428
  br i1 %exitcond, label %for.body, label %for.end, !dbg !430

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !431
  %0 = load i8, ptr %arrayidx, align 1, !dbg !431
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !432
  store i8 %0, ptr %arrayidx1, align 1, !dbg !433
  %inc = add i32 %i.0, 1, !dbg !434
    #dbg_value(i32 %inc, !423, !DIExpression(), !425)
  br label %for.cond, !dbg !435, !llvm.loop !436

for.end:                                          ; preds = %for.cond
  ret void, !dbg !438
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
!202 = !DILocalVariable(name: "r", scope: !203, file: !131, line: 50, type: !46)
!203 = distinct !DILexicalBlock(scope: !204, file: !131, line: 50, column: 5)
!204 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !131, file: !131, line: 47, type: !205, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!205 = !DISubroutineType(types: !206)
!206 = !{null, !173, !50, !165, !6, !173, !173, !173}
!207 = !DILocation(line: 0, scope: !203, inlinedAt: !208)
!208 = distinct !DILocation(line: 278, column: 5, scope: !130)
!209 = !DILocation(line: 281, column: 1, scope: !130)
!210 = !DILocalVariable(name: "c", scope: !211, file: !131, line: 51, type: !46)
!211 = distinct !DILexicalBlock(scope: !212, file: !131, line: 51, column: 9)
!212 = distinct !DILexicalBlock(scope: !213, file: !131, line: 50, column: 40)
!213 = distinct !DILexicalBlock(scope: !203, file: !131, line: 50, column: 5)
!214 = !DILocation(line: 0, scope: !211, inlinedAt: !208)
!215 = !DILocation(line: 51, column: 9, scope: !211, inlinedAt: !208)
!216 = !DILocalVariable(name: "k", scope: !217, file: !131, line: 52, type: !46)
!217 = distinct !DILexicalBlock(scope: !218, file: !131, line: 52, column: 13)
!218 = distinct !DILexicalBlock(scope: !219, file: !131, line: 51, column: 44)
!219 = distinct !DILexicalBlock(scope: !211, file: !131, line: 51, column: 9)
!220 = !DILocation(line: 0, scope: !217, inlinedAt: !208)
!221 = !DILocation(line: 53, column: 70, scope: !222, inlinedAt: !208)
!222 = distinct !DILexicalBlock(scope: !223, file: !131, line: 52, column: 54)
!223 = distinct !DILexicalBlock(scope: !217, file: !131, line: 52, column: 13)
!224 = !DILocation(line: 53, column: 84, scope: !222, inlinedAt: !208)
!225 = !DILocation(line: 53, column: 51, scope: !222, inlinedAt: !208)
!226 = !DILocation(line: 53, column: 96, scope: !222, inlinedAt: !208)
!227 = !DILocation(line: 53, column: 90, scope: !222, inlinedAt: !208)
!228 = !DILocation(line: 53, column: 150, scope: !222, inlinedAt: !208)
!229 = !DILocation(line: 53, column: 117, scope: !222, inlinedAt: !208)
!230 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !231, file: !232, line: 31, type: !46)
!231 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !232, file: !232, line: 31, type: !233, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!232 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!233 = !DISubroutineType(types: !234)
!234 = !{null, !46, !165, !15, !6}
!235 = !DILocation(line: 0, scope: !231, inlinedAt: !236)
!236 = distinct !DILocation(line: 53, column: 17, scope: !222, inlinedAt: !208)
!237 = !DILocalVariable(name: "in", arg: 2, scope: !231, file: !232, line: 31, type: !165)
!238 = !DILocalVariable(name: "a", arg: 3, scope: !231, file: !232, line: 31, type: !15)
!239 = !DILocalVariable(name: "acc", arg: 4, scope: !231, file: !232, line: 31, type: !6)
!240 = !DILocalVariable(name: "b", arg: 1, scope: !241, file: !242, line: 136, type: !13)
!241 = distinct !DISubprogram(name: "mul_table", scope: !242, file: !242, line: 136, type: !243, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!242 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!243 = !DISubroutineType(types: !244)
!244 = !{!20, !13}
!245 = !DILocation(line: 0, scope: !241, inlinedAt: !246)
!246 = distinct !DILocation(line: 33, column: 20, scope: !231, inlinedAt: !236)
!247 = !DILocation(line: 137, column: 19, scope: !241, inlinedAt: !246)
!248 = !DILocation(line: 137, column: 33, scope: !241, inlinedAt: !246)
!249 = !DILocalVariable(name: "x", scope: !241, file: !242, line: 137, type: !20)
!250 = !DILocalVariable(name: "high_nibble_mask", scope: !241, file: !242, line: 139, type: !20)
!251 = !DILocation(line: 141, column: 28, scope: !241, inlinedAt: !246)
!252 = !DILocalVariable(name: "high_half", scope: !241, file: !242, line: 141, type: !20)
!253 = !DILocation(line: 142, column: 28, scope: !241, inlinedAt: !246)
!254 = !DILocation(line: 142, column: 47, scope: !241, inlinedAt: !246)
!255 = !DILocation(line: 142, column: 34, scope: !241, inlinedAt: !246)
!256 = !DILocalVariable(name: "tab", scope: !231, file: !232, line: 33, type: !20)
!257 = !DILocalVariable(name: "lsb_ask", scope: !231, file: !232, line: 35, type: !7)
!258 = !DILocalVariable(name: "i", scope: !259, file: !232, line: 37, type: !46)
!259 = distinct !DILexicalBlock(scope: !231, file: !232, line: 37, column: 5)
!260 = !DILocation(line: 0, scope: !259, inlinedAt: !236)
!261 = !DILocation(line: 37, column: 5, scope: !259, inlinedAt: !236)
!262 = !DILocation(line: 38, column: 21, scope: !263, inlinedAt: !236)
!263 = distinct !DILexicalBlock(scope: !264, file: !232, line: 37, column: 43)
!264 = distinct !DILexicalBlock(scope: !259, file: !232, line: 37, column: 5)
!265 = !DILocation(line: 38, column: 33, scope: !263, inlinedAt: !236)
!266 = !DILocation(line: 38, column: 51, scope: !263, inlinedAt: !236)
!267 = !DILocation(line: 38, column: 46, scope: !263, inlinedAt: !236)
!268 = !DILocation(line: 38, column: 44, scope: !263, inlinedAt: !236)
!269 = !DILocation(line: 39, column: 27, scope: !263, inlinedAt: !236)
!270 = !DILocation(line: 39, column: 33, scope: !263, inlinedAt: !236)
!271 = !DILocation(line: 39, column: 52, scope: !263, inlinedAt: !236)
!272 = !DILocation(line: 39, column: 59, scope: !263, inlinedAt: !236)
!273 = !DILocation(line: 39, column: 46, scope: !263, inlinedAt: !236)
!274 = !DILocation(line: 39, column: 44, scope: !263, inlinedAt: !236)
!275 = !DILocation(line: 39, column: 17, scope: !263, inlinedAt: !236)
!276 = !DILocation(line: 40, column: 21, scope: !263, inlinedAt: !236)
!277 = !DILocation(line: 40, column: 27, scope: !263, inlinedAt: !236)
!278 = !DILocation(line: 40, column: 33, scope: !263, inlinedAt: !236)
!279 = !DILocation(line: 40, column: 52, scope: !263, inlinedAt: !236)
!280 = !DILocation(line: 40, column: 59, scope: !263, inlinedAt: !236)
!281 = !DILocation(line: 40, column: 46, scope: !263, inlinedAt: !236)
!282 = !DILocation(line: 40, column: 44, scope: !263, inlinedAt: !236)
!283 = !DILocation(line: 40, column: 17, scope: !263, inlinedAt: !236)
!284 = !DILocation(line: 41, column: 21, scope: !263, inlinedAt: !236)
!285 = !DILocation(line: 41, column: 27, scope: !263, inlinedAt: !236)
!286 = !DILocation(line: 41, column: 33, scope: !263, inlinedAt: !236)
!287 = !DILocation(line: 41, column: 52, scope: !263, inlinedAt: !236)
!288 = !DILocation(line: 41, column: 59, scope: !263, inlinedAt: !236)
!289 = !DILocation(line: 41, column: 46, scope: !263, inlinedAt: !236)
!290 = !DILocation(line: 41, column: 44, scope: !263, inlinedAt: !236)
!291 = !DILocation(line: 41, column: 17, scope: !263, inlinedAt: !236)
!292 = !DILocation(line: 38, column: 9, scope: !263, inlinedAt: !236)
!293 = !DILocation(line: 38, column: 16, scope: !263, inlinedAt: !236)
!294 = !DILocation(line: 37, column: 40, scope: !264, inlinedAt: !236)
!295 = !DILocation(line: 37, column: 20, scope: !264, inlinedAt: !236)
!296 = distinct !{!296, !261, !297, !298}
!297 = !DILocation(line: 42, column: 5, scope: !259, inlinedAt: !236)
!298 = !{!"llvm.loop.mustprogress"}
!299 = !DILocation(line: 52, column: 48, scope: !223, inlinedAt: !208)
!300 = !DILocation(line: 52, column: 31, scope: !223, inlinedAt: !208)
!301 = !DILocation(line: 52, column: 13, scope: !217, inlinedAt: !208)
!302 = distinct !{!302, !301, !303, !298}
!303 = !DILocation(line: 54, column: 13, scope: !217, inlinedAt: !208)
!304 = !DILocation(line: 51, column: 40, scope: !219, inlinedAt: !208)
!305 = !DILocation(line: 51, column: 27, scope: !219, inlinedAt: !208)
!306 = distinct !{!306, !215, !307, !298}
!307 = !DILocation(line: 55, column: 9, scope: !211, inlinedAt: !208)
!308 = !DILocalVariable(name: "c", scope: !309, file: !131, line: 21, type: !46)
!309 = distinct !DILexicalBlock(scope: !310, file: !131, line: 21, column: 9)
!310 = distinct !DILexicalBlock(scope: !311, file: !131, line: 20, column: 43)
!311 = distinct !DILexicalBlock(scope: !200, file: !131, line: 20, column: 5)
!312 = !DILocation(line: 0, scope: !309, inlinedAt: !190)
!313 = !DILocation(line: 21, column: 9, scope: !309, inlinedAt: !190)
!314 = !DILocalVariable(name: "k", scope: !315, file: !131, line: 22, type: !46)
!315 = distinct !DILexicalBlock(scope: !316, file: !131, line: 22, column: 13)
!316 = distinct !DILexicalBlock(scope: !317, file: !131, line: 21, column: 60)
!317 = distinct !DILexicalBlock(scope: !309, file: !131, line: 21, column: 9)
!318 = !DILocation(line: 0, scope: !315, inlinedAt: !190)
!319 = !DILocation(line: 23, column: 51, scope: !320, inlinedAt: !190)
!320 = distinct !DILexicalBlock(scope: !321, file: !131, line: 22, column: 51)
!321 = distinct !DILexicalBlock(scope: !315, file: !131, line: 22, column: 13)
!322 = !DILocation(line: 23, column: 94, scope: !320, inlinedAt: !190)
!323 = !DILocation(line: 23, column: 88, scope: !320, inlinedAt: !190)
!324 = !DILocation(line: 23, column: 145, scope: !320, inlinedAt: !190)
!325 = !DILocation(line: 23, column: 115, scope: !320, inlinedAt: !190)
!326 = !DILocation(line: 0, scope: !231, inlinedAt: !327)
!327 = distinct !DILocation(line: 23, column: 17, scope: !320, inlinedAt: !190)
!328 = !DILocation(line: 0, scope: !241, inlinedAt: !329)
!329 = distinct !DILocation(line: 33, column: 20, scope: !231, inlinedAt: !327)
!330 = !DILocation(line: 137, column: 19, scope: !241, inlinedAt: !329)
!331 = !DILocation(line: 137, column: 33, scope: !241, inlinedAt: !329)
!332 = !DILocation(line: 141, column: 28, scope: !241, inlinedAt: !329)
!333 = !DILocation(line: 142, column: 28, scope: !241, inlinedAt: !329)
!334 = !DILocation(line: 142, column: 47, scope: !241, inlinedAt: !329)
!335 = !DILocation(line: 142, column: 34, scope: !241, inlinedAt: !329)
!336 = !DILocation(line: 0, scope: !259, inlinedAt: !327)
!337 = !DILocation(line: 37, column: 5, scope: !259, inlinedAt: !327)
!338 = !DILocation(line: 38, column: 21, scope: !263, inlinedAt: !327)
!339 = !DILocation(line: 38, column: 33, scope: !263, inlinedAt: !327)
!340 = !DILocation(line: 38, column: 51, scope: !263, inlinedAt: !327)
!341 = !DILocation(line: 38, column: 46, scope: !263, inlinedAt: !327)
!342 = !DILocation(line: 38, column: 44, scope: !263, inlinedAt: !327)
!343 = !DILocation(line: 39, column: 27, scope: !263, inlinedAt: !327)
!344 = !DILocation(line: 39, column: 33, scope: !263, inlinedAt: !327)
!345 = !DILocation(line: 39, column: 52, scope: !263, inlinedAt: !327)
!346 = !DILocation(line: 39, column: 59, scope: !263, inlinedAt: !327)
!347 = !DILocation(line: 39, column: 46, scope: !263, inlinedAt: !327)
!348 = !DILocation(line: 39, column: 44, scope: !263, inlinedAt: !327)
!349 = !DILocation(line: 39, column: 17, scope: !263, inlinedAt: !327)
!350 = !DILocation(line: 40, column: 21, scope: !263, inlinedAt: !327)
!351 = !DILocation(line: 40, column: 27, scope: !263, inlinedAt: !327)
!352 = !DILocation(line: 40, column: 33, scope: !263, inlinedAt: !327)
!353 = !DILocation(line: 40, column: 52, scope: !263, inlinedAt: !327)
!354 = !DILocation(line: 40, column: 59, scope: !263, inlinedAt: !327)
!355 = !DILocation(line: 40, column: 46, scope: !263, inlinedAt: !327)
!356 = !DILocation(line: 40, column: 44, scope: !263, inlinedAt: !327)
!357 = !DILocation(line: 40, column: 17, scope: !263, inlinedAt: !327)
!358 = !DILocation(line: 41, column: 21, scope: !263, inlinedAt: !327)
!359 = !DILocation(line: 41, column: 27, scope: !263, inlinedAt: !327)
!360 = !DILocation(line: 41, column: 33, scope: !263, inlinedAt: !327)
!361 = !DILocation(line: 41, column: 52, scope: !263, inlinedAt: !327)
!362 = !DILocation(line: 41, column: 59, scope: !263, inlinedAt: !327)
!363 = !DILocation(line: 41, column: 46, scope: !263, inlinedAt: !327)
!364 = !DILocation(line: 41, column: 44, scope: !263, inlinedAt: !327)
!365 = !DILocation(line: 41, column: 17, scope: !263, inlinedAt: !327)
!366 = !DILocation(line: 38, column: 9, scope: !263, inlinedAt: !327)
!367 = !DILocation(line: 38, column: 16, scope: !263, inlinedAt: !327)
!368 = !DILocation(line: 37, column: 40, scope: !264, inlinedAt: !327)
!369 = !DILocation(line: 37, column: 20, scope: !264, inlinedAt: !327)
!370 = distinct !{!370, !337, !371, !298}
!371 = !DILocation(line: 42, column: 5, scope: !259, inlinedAt: !327)
!372 = !DILocation(line: 22, column: 45, scope: !321, inlinedAt: !190)
!373 = !DILocation(line: 22, column: 31, scope: !321, inlinedAt: !190)
!374 = !DILocation(line: 22, column: 13, scope: !315, inlinedAt: !190)
!375 = distinct !{!375, !374, !376, !298}
!376 = !DILocation(line: 24, column: 13, scope: !315, inlinedAt: !190)
!377 = !DILocation(line: 25, column: 33, scope: !316, inlinedAt: !190)
!378 = !DILocation(line: 21, column: 56, scope: !317, inlinedAt: !190)
!379 = !DILocation(line: 21, column: 40, scope: !317, inlinedAt: !190)
!380 = distinct !{!380, !313, !381, !298}
!381 = !DILocation(line: 26, column: 9, scope: !309, inlinedAt: !190)
!382 = !{!"p_buf"}
!383 = !{!"P"}
!384 = !{!"O"}
!385 = !{!"P3"}
!386 = distinct !DISubprogram(name: "mayo_memset", scope: !387, file: !387, line: 3, type: !388, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!387 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!388 = !DISubroutineType(types: !389)
!389 = !{null, !70, !13, !20}
!390 = !DILocalVariable(name: "dst", arg: 1, scope: !386, file: !387, line: 3, type: !70)
!391 = !DILocation(line: 0, scope: !386)
!392 = !DILocalVariable(name: "val", arg: 2, scope: !386, file: !387, line: 3, type: !13)
!393 = !DILocalVariable(name: "len", arg: 3, scope: !386, file: !387, line: 3, type: !20)
!394 = !DILocalVariable(name: "d", scope: !386, file: !387, line: 5, type: !12)
!395 = !DILocalVariable(name: "i", scope: !396, file: !387, line: 7, type: !20)
!396 = distinct !DILexicalBlock(scope: !386, file: !387, line: 7, column: 5)
!397 = !DILocation(line: 0, scope: !396)
!398 = !DILocation(line: 7, column: 10, scope: !396)
!399 = !DILocation(line: 7, scope: !396)
!400 = !DILocation(line: 7, column: 28, scope: !401)
!401 = distinct !DILexicalBlock(scope: !396, file: !387, line: 7, column: 5)
!402 = !DILocation(line: 7, column: 5, scope: !396)
!403 = !DILocation(line: 8, column: 9, scope: !401)
!404 = !DILocation(line: 8, column: 14, scope: !401)
!405 = !DILocation(line: 7, column: 36, scope: !401)
!406 = !DILocation(line: 7, column: 5, scope: !401)
!407 = distinct !{!407, !402, !408, !298}
!408 = !DILocation(line: 8, column: 16, scope: !396)
!409 = !DILocation(line: 9, column: 1, scope: !386)
!410 = distinct !DISubprogram(name: "mayo_memcpy", scope: !387, file: !387, line: 11, type: !411, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!411 = !DISubroutineType(types: !412)
!412 = !{null, !70, !413, !20}
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 32)
!414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!415 = !DILocalVariable(name: "dst", arg: 1, scope: !410, file: !387, line: 11, type: !70)
!416 = !DILocation(line: 0, scope: !410)
!417 = !DILocalVariable(name: "src", arg: 2, scope: !410, file: !387, line: 11, type: !413)
!418 = !DILocalVariable(name: "len", arg: 3, scope: !410, file: !387, line: 11, type: !20)
!419 = !DILocalVariable(name: "d", scope: !410, file: !387, line: 13, type: !12)
!420 = !DILocalVariable(name: "s", scope: !410, file: !387, line: 14, type: !421)
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !422, size: 32)
!422 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!423 = !DILocalVariable(name: "i", scope: !424, file: !387, line: 16, type: !20)
!424 = distinct !DILexicalBlock(scope: !410, file: !387, line: 16, column: 5)
!425 = !DILocation(line: 0, scope: !424)
!426 = !DILocation(line: 16, column: 10, scope: !424)
!427 = !DILocation(line: 16, scope: !424)
!428 = !DILocation(line: 16, column: 28, scope: !429)
!429 = distinct !DILexicalBlock(scope: !424, file: !387, line: 16, column: 5)
!430 = !DILocation(line: 16, column: 5, scope: !424)
!431 = !DILocation(line: 17, column: 16, scope: !429)
!432 = !DILocation(line: 17, column: 9, scope: !429)
!433 = !DILocation(line: 17, column: 14, scope: !429)
!434 = !DILocation(line: 16, column: 36, scope: !429)
!435 = !DILocation(line: 16, column: 5, scope: !429)
!436 = distinct !{!436, !430, !437, !298}
!437 = !DILocation(line: 17, column: 19, scope: !424)
!438 = !DILocation(line: 18, column: 1, scope: !410)
