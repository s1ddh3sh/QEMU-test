; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !129 {
entry:
    #dbg_value(ptr %dst, !133, !DIExpression(), !134)
    #dbg_value(i8 %val, !135, !DIExpression(), !134)
    #dbg_value(i32 %len, !136, !DIExpression(), !134)
    #dbg_value(ptr %dst, !137, !DIExpression(), !134)
    #dbg_value(i32 0, !138, !DIExpression(), !140)
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !142
    #dbg_value(i32 %i.0, !138, !DIExpression(), !140)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !143
  br i1 %exitcond, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !146
  store i8 %val, ptr %arrayidx, align 1, !dbg !147
  %inc = add i32 %i.0, 1, !dbg !148
    #dbg_value(i32 %inc, !138, !DIExpression(), !140)
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  ret void, !dbg !153
}

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %L, ptr noundef nonnull %P1, ptr noundef nonnull %VL, ptr noundef nonnull %VP1V) unnamed_addr #0 !dbg !154 {
entry:
  %Pv = alloca [3900 x i64], align 8
    #dbg_value(ptr %p, !190, !DIExpression(), !191)
    #dbg_value(ptr %Vdec, !192, !DIExpression(), !191)
    #dbg_value(ptr %L, !193, !DIExpression(), !191)
    #dbg_value(ptr %P1, !194, !DIExpression(), !191)
    #dbg_value(ptr %VL, !195, !DIExpression(), !191)
    #dbg_value(ptr %VP1V, !196, !DIExpression(), !191)
    #dbg_value(i32 10, !197, !DIExpression(), !191)
    #dbg_value(i32 78, !199, !DIExpression(), !191)
    #dbg_value(i32 8, !200, !DIExpression(), !191)
    #dbg_value(i32 5, !201, !DIExpression(), !205)
    #dbg_value(ptr %Vdec, !207, !DIExpression(), !205)
    #dbg_value(ptr %L, !208, !DIExpression(), !205)
    #dbg_value(ptr %VL, !209, !DIExpression(), !205)
    #dbg_value(i32 10, !210, !DIExpression(), !205)
    #dbg_value(i32 78, !211, !DIExpression(), !205)
    #dbg_value(i32 8, !212, !DIExpression(), !205)
    #dbg_value(i32 0, !213, !DIExpression(), !215)
  br label %for.cond.i1, !dbg !216

for.cond.i1:                                      ; preds = %for.inc17.i, %entry
  %r.0.i = phi i32 [ 0, %entry ], [ %inc18.i, %for.inc17.i ], !dbg !217
    #dbg_value(i32 %r.0.i, !213, !DIExpression(), !215)
  %exitcond2.i = icmp ne i32 %r.0.i, 10, !dbg !218
  br i1 %exitcond2.i, label %for.cond1.preheader.i, label %mul_add_mat_x_m_mat.exit, !dbg !220

for.cond1.preheader.i:                            ; preds = %for.cond.i1
  br label %for.cond1.i, !dbg !221

for.cond1.i:                                      ; preds = %for.inc15.i, %for.cond1.preheader.i
  %c.0.i = phi i32 [ %inc.i3, %for.inc15.i ], [ 0, %for.cond1.preheader.i ], !dbg !224
    #dbg_value(i32 %c.0.i, !225, !DIExpression(), !226)
  %exitcond1.i = icmp ne i32 %c.0.i, 78, !dbg !227
  br i1 %exitcond1.i, label %for.cond4.preheader.i, label %for.inc17.i, !dbg !221

for.cond4.preheader.i:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !229

for.cond4.i:                                      ; preds = %m_vec_mul_add.exit74, %for.cond4.preheader.i
  %k.0.i = phi i32 [ %add14.i, %m_vec_mul_add.exit74 ], [ 0, %for.cond4.preheader.i ], !dbg !232
    #dbg_value(i32 %k.0.i, !233, !DIExpression(), !234)
  %exitcond.i2 = icmp ne i32 %k.0.i, 8, !dbg !235
  br i1 %exitcond.i2, label %for.body6.i, label %for.inc15.i, !dbg !229

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i = mul nuw nsw i32 %c.0.i, 8, !dbg !237
  %add.i = add nuw nsw i32 %mul.i, %k.0.i, !dbg !239
  %add.ptr.idx.i = mul nuw nsw i32 %add.i, 40, !dbg !240
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %L, i32 %add.ptr.idx.i, !dbg !240
  %mul8.i = mul nuw nsw i32 %r.0.i, 78, !dbg !241
  %0 = getelementptr i8, ptr %Vdec, i32 %mul8.i, !dbg !242
  %arrayidx.i4 = getelementptr i8, ptr %0, i32 %c.0.i, !dbg !242
  %1 = load i8, ptr %arrayidx.i4, align 1, !dbg !242
  %mul10.i = mul nuw nsw i32 %r.0.i, 8, !dbg !243
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !244
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 40, !dbg !245
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %VL, i32 %add.ptr13.idx.i, !dbg !245
    #dbg_value(i32 5, !246, !DIExpression(), !251)
    #dbg_value(ptr %add.ptr.i, !253, !DIExpression(), !251)
    #dbg_value(i8 %1, !254, !DIExpression(), !251)
    #dbg_value(ptr %add.ptr13.i, !255, !DIExpression(), !251)
    #dbg_value(i8 %1, !256, !DIExpression(), !261)
  %conv.i.i33 = zext i8 %1 to i32, !dbg !263
  %mul.i.i34 = mul i32 %conv.i.i33, 134480385, !dbg !264
    #dbg_value(i32 %mul.i.i34, !265, !DIExpression(), !261)
    #dbg_value(i32 -252645136, !266, !DIExpression(), !261)
  %and.i.i35 = and i32 %mul.i.i34, -252645136, !dbg !267
    #dbg_value(i32 %and.i.i35, !268, !DIExpression(), !261)
  %shr.i.i36 = lshr exact i32 %and.i.i35, 4, !dbg !269
  %shr1.i.i37 = lshr exact i32 %and.i.i35, 3, !dbg !270
  %2 = xor i32 %shr.i.i36, %shr1.i.i37, !dbg !271
  %xor2.i.i38 = xor i32 %2, %mul.i.i34, !dbg !271
    #dbg_value(i32 %xor2.i.i38, !272, !DIExpression(), !251)
    #dbg_value(i64 1229782938247303441, !273, !DIExpression(), !251)
    #dbg_value(i32 0, !274, !DIExpression(), !276)
  br label %for.cond.i39, !dbg !277

for.cond.i39:                                     ; preds = %for.body.i42, %for.body6.i
  %i.0.i40 = phi i32 [ 0, %for.body6.i ], [ %inc.i73, %for.body.i42 ], !dbg !278
    #dbg_value(i32 %i.0.i40, !274, !DIExpression(), !276)
  %exitcond.i41 = icmp ne i32 %i.0.i40, 5, !dbg !279
  br i1 %exitcond.i41, label %for.body.i42, label %m_vec_mul_add.exit74, !dbg !281

for.body.i42:                                     ; preds = %for.cond.i39
  %arrayidx.i43 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i40, !dbg !282
  %3 = load i64, ptr %arrayidx.i43, align 8, !dbg !282
  %and.i44 = and i64 %3, 1229782938247303441, !dbg !284
  %and1.i45 = and i32 %xor2.i.i38, 255, !dbg !285
  %conv.i46 = zext nneg i32 %and1.i45 to i64, !dbg !286
  %mul.i47 = mul i64 %and.i44, %conv.i46, !dbg !287
  %shr.i48 = lshr i64 %3, 1, !dbg !288
  %and3.i49 = and i64 %shr.i48, 1229782938247303441, !dbg !289
  %shr4.i50 = lshr i32 %xor2.i.i38, 8, !dbg !290
  %and5.i51 = and i32 %shr4.i50, 15, !dbg !291
  %conv6.i52 = zext nneg i32 %and5.i51 to i64, !dbg !292
  %mul7.i53 = mul nuw i64 %and3.i49, %conv6.i52, !dbg !293
  %xor.i54 = xor i64 %mul.i47, %mul7.i53, !dbg !294
  %arrayidx8.i55 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i40, !dbg !295
  %4 = load i64, ptr %arrayidx8.i55, align 8, !dbg !295
  %shr9.i56 = lshr i64 %4, 2, !dbg !296
  %and10.i57 = and i64 %shr9.i56, 1229782938247303441, !dbg !297
  %shr11.i58 = lshr i32 %xor2.i.i38, 16, !dbg !298
  %and12.i59 = and i32 %shr11.i58, 15, !dbg !299
  %conv13.i60 = zext nneg i32 %and12.i59 to i64, !dbg !300
  %mul14.i61 = mul nuw i64 %and10.i57, %conv13.i60, !dbg !301
  %xor15.i62 = xor i64 %xor.i54, %mul14.i61, !dbg !302
  %arrayidx16.i63 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i40, !dbg !303
  %5 = load i64, ptr %arrayidx16.i63, align 8, !dbg !303
  %shr17.i64 = lshr i64 %5, 3, !dbg !304
  %and18.i65 = and i64 %shr17.i64, 1229782938247303441, !dbg !305
  %shr19.i66 = lshr i32 %xor2.i.i38, 24, !dbg !306
  %and20.i67 = and i32 %shr19.i66, 15, !dbg !307
  %conv21.i68 = zext nneg i32 %and20.i67 to i64, !dbg !308
  %mul22.i69 = mul nuw i64 %and18.i65, %conv21.i68, !dbg !309
  %xor23.i70 = xor i64 %xor15.i62, %mul22.i69, !dbg !310
  %arrayidx24.i71 = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i40, !dbg !311
  %6 = load i64, ptr %arrayidx24.i71, align 8, !dbg !312
  %xor25.i72 = xor i64 %6, %xor23.i70, !dbg !312
  store i64 %xor25.i72, ptr %arrayidx24.i71, align 8, !dbg !312
  %inc.i73 = add nuw nsw i32 %i.0.i40, 1, !dbg !313
    #dbg_value(i32 %inc.i73, !274, !DIExpression(), !276)
  br label %for.cond.i39, !dbg !314, !llvm.loop !315

m_vec_mul_add.exit74:                             ; preds = %for.cond.i39
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !317
    #dbg_value(i32 %add14.i, !233, !DIExpression(), !234)
  br label %for.cond4.i, !dbg !318, !llvm.loop !319

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i3 = add nuw nsw i32 %c.0.i, 1, !dbg !321
    #dbg_value(i32 %inc.i3, !225, !DIExpression(), !226)
  br label %for.cond1.i, !dbg !322, !llvm.loop !323

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !325
    #dbg_value(i32 %inc18.i, !213, !DIExpression(), !215)
  br label %for.cond.i1, !dbg !326, !llvm.loop !327

mul_add_mat_x_m_mat.exit:                         ; preds = %for.cond.i1
    #dbg_declare(ptr %Pv, !329, !DIExpression(), !333)
    #dbg_value(ptr %Pv, !133, !DIExpression(), !334)
    #dbg_value(i8 0, !135, !DIExpression(), !334)
    #dbg_value(i32 31200, !136, !DIExpression(), !334)
    #dbg_value(ptr %Pv, !137, !DIExpression(), !334)
    #dbg_value(i32 0, !138, !DIExpression(), !336)
  br label %for.cond.i, !dbg !337

for.cond.i:                                       ; preds = %for.body.i, %mul_add_mat_x_m_mat.exit
  %i.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %inc.i, %for.body.i ], !dbg !338
    #dbg_value(i32 %i.0.i, !138, !DIExpression(), !336)
  %exitcond.i = icmp ne i32 %i.0.i, 31200, !dbg !339
  br i1 %exitcond.i, label %for.body.i, label %mayo_memset.exit, !dbg !340

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %Pv, i32 %i.0.i, !dbg !341
  store i8 0, ptr %arrayidx.i, align 1, !dbg !342
  %inc.i = add i32 %i.0.i, 1, !dbg !343
    #dbg_value(i32 %inc.i, !138, !DIExpression(), !336)
  br label %for.cond.i, !dbg !344, !llvm.loop !345

mayo_memset.exit:                                 ; preds = %for.cond.i
    #dbg_value(ptr %p, !347, !DIExpression(), !351)
    #dbg_value(ptr %P1, !353, !DIExpression(), !351)
    #dbg_value(ptr %Vdec, !354, !DIExpression(), !351)
    #dbg_value(ptr %Pv, !355, !DIExpression(), !351)
    #dbg_value(i32 5, !356, !DIExpression(), !360)
    #dbg_value(ptr %P1, !362, !DIExpression(), !360)
    #dbg_value(ptr %Vdec, !363, !DIExpression(), !360)
    #dbg_value(ptr %Pv, !364, !DIExpression(), !360)
    #dbg_value(i32 78, !365, !DIExpression(), !360)
    #dbg_value(i32 78, !366, !DIExpression(), !360)
    #dbg_value(i32 10, !367, !DIExpression(), !360)
    #dbg_value(i32 1, !368, !DIExpression(), !360)
    #dbg_value(i32 0, !369, !DIExpression(), !360)
    #dbg_value(i32 0, !370, !DIExpression(), !372)
  br label %for.cond.i5, !dbg !373

for.cond.i5:                                      ; preds = %for.inc17.i12, %mayo_memset.exit
  %indvars.iv.i = phi i32 [ %indvars.iv.next.i, %for.inc17.i12 ], [ 78, %mayo_memset.exit ], !dbg !374
  %bs_mat_entries_used.0.i = phi i32 [ 0, %mayo_memset.exit ], [ %bs_mat_entries_used.1.i, %for.inc17.i12 ], !dbg !374
  %r.0.i6 = phi i32 [ 0, %mayo_memset.exit ], [ %inc18.i13, %for.inc17.i12 ], !dbg !375
    #dbg_value(i32 %r.0.i6, !370, !DIExpression(), !372)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !369, !DIExpression(), !360)
  %exitcond2.i7 = icmp ne i32 %r.0.i6, 78, !dbg !376
  br i1 %exitcond2.i7, label %for.cond1.preheader.i8, label %mul_add_m_upper_triangular_mat_x_mat_trans.exit, !dbg !378

for.cond1.preheader.i8:                           ; preds = %for.cond.i5
  %7 = add i32 %bs_mat_entries_used.0.i, %indvars.iv.i, !dbg !379
  br label %for.cond1.i9, !dbg !379

for.cond1.i9:                                     ; preds = %for.inc15.i18, %for.cond1.preheader.i8
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i19, %for.inc15.i18 ], [ %bs_mat_entries_used.0.i, %for.cond1.preheader.i8 ], !dbg !360
  %c.0.i10 = phi i32 [ %inc.i20, %for.inc15.i18 ], [ %r.0.i6, %for.cond1.preheader.i8 ], !dbg !382
    #dbg_value(i32 %c.0.i10, !383, !DIExpression(), !384)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !369, !DIExpression(), !360)
  %exitcond1.i11 = icmp ne i32 %bs_mat_entries_used.1.i, %7, !dbg !385
  br i1 %exitcond1.i11, label %for.cond4.preheader.i14, label %for.inc17.i12, !dbg !379

for.cond4.preheader.i14:                          ; preds = %for.cond1.i9
  br label %for.cond4.i15, !dbg !387

for.cond4.i15:                                    ; preds = %m_vec_mul_add.exit, %for.cond4.preheader.i14
  %k.0.i16 = phi i32 [ %add13.i, %m_vec_mul_add.exit ], [ 0, %for.cond4.preheader.i14 ], !dbg !390
    #dbg_value(i32 %k.0.i16, !391, !DIExpression(), !392)
  %exitcond.i17 = icmp ne i32 %k.0.i16, 10, !dbg !393
  br i1 %exitcond.i17, label %for.body6.i21, label %for.inc15.i18, !dbg !387

for.body6.i21:                                    ; preds = %for.cond4.i15
  %add.ptr.idx.i22 = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !395
  %add.ptr.i23 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i22, !dbg !395
  %mul8.i24 = mul nuw nsw i32 %k.0.i16, 78, !dbg !397
  %8 = getelementptr i8, ptr %Vdec, i32 %mul8.i24, !dbg !398
  %arrayidx.i25 = getelementptr i8, ptr %8, i32 %c.0.i10, !dbg !398
  %9 = load i8, ptr %arrayidx.i25, align 1, !dbg !398
  %mul9.i = mul nuw nsw i32 %r.0.i6, 10, !dbg !399
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i16, !dbg !400
  %add.ptr12.idx.i = mul nuw nsw i32 %add10.i, 40, !dbg !401
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %Pv, i32 %add.ptr12.idx.i, !dbg !401
    #dbg_value(i32 5, !246, !DIExpression(), !402)
    #dbg_value(ptr %add.ptr.i23, !253, !DIExpression(), !402)
    #dbg_value(i8 %9, !254, !DIExpression(), !402)
    #dbg_value(ptr %add.ptr12.i, !255, !DIExpression(), !402)
    #dbg_value(i8 %9, !256, !DIExpression(), !404)
  %conv.i.i = zext i8 %9 to i32, !dbg !406
  %mul.i.i = mul i32 %conv.i.i, 134480385, !dbg !407
    #dbg_value(i32 %mul.i.i, !265, !DIExpression(), !404)
    #dbg_value(i32 -252645136, !266, !DIExpression(), !404)
  %and.i.i = and i32 %mul.i.i, -252645136, !dbg !408
    #dbg_value(i32 %and.i.i, !268, !DIExpression(), !404)
  %shr.i.i = lshr exact i32 %and.i.i, 4, !dbg !409
  %shr1.i.i = lshr exact i32 %and.i.i, 3, !dbg !410
  %10 = xor i32 %shr.i.i, %shr1.i.i, !dbg !411
  %xor2.i.i = xor i32 %10, %mul.i.i, !dbg !411
    #dbg_value(i32 %xor2.i.i, !272, !DIExpression(), !402)
    #dbg_value(i64 1229782938247303441, !273, !DIExpression(), !402)
    #dbg_value(i32 0, !274, !DIExpression(), !412)
  br label %for.cond.i26, !dbg !413

for.cond.i26:                                     ; preds = %for.body.i29, %for.body6.i21
  %i.0.i27 = phi i32 [ 0, %for.body6.i21 ], [ %inc.i32, %for.body.i29 ], !dbg !414
    #dbg_value(i32 %i.0.i27, !274, !DIExpression(), !412)
  %exitcond.i28 = icmp ne i32 %i.0.i27, 5, !dbg !415
  br i1 %exitcond.i28, label %for.body.i29, label %m_vec_mul_add.exit, !dbg !416

for.body.i29:                                     ; preds = %for.cond.i26
  %arrayidx.i30 = getelementptr inbounds nuw i64, ptr %add.ptr.i23, i32 %i.0.i27, !dbg !417
  %11 = load i64, ptr %arrayidx.i30, align 8, !dbg !417
  %and.i = and i64 %11, 1229782938247303441, !dbg !418
  %and1.i = and i32 %xor2.i.i, 255, !dbg !419
  %conv.i = zext nneg i32 %and1.i to i64, !dbg !420
  %mul.i31 = mul i64 %and.i, %conv.i, !dbg !421
  %shr.i = lshr i64 %11, 1, !dbg !422
  %and3.i = and i64 %shr.i, 1229782938247303441, !dbg !423
  %shr4.i = lshr i32 %xor2.i.i, 8, !dbg !424
  %and5.i = and i32 %shr4.i, 15, !dbg !425
  %conv6.i = zext nneg i32 %and5.i to i64, !dbg !426
  %mul7.i = mul nuw i64 %and3.i, %conv6.i, !dbg !427
  %xor.i = xor i64 %mul.i31, %mul7.i, !dbg !428
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i23, i32 %i.0.i27, !dbg !429
  %12 = load i64, ptr %arrayidx8.i, align 8, !dbg !429
  %shr9.i = lshr i64 %12, 2, !dbg !430
  %and10.i = and i64 %shr9.i, 1229782938247303441, !dbg !431
  %shr11.i = lshr i32 %xor2.i.i, 16, !dbg !432
  %and12.i = and i32 %shr11.i, 15, !dbg !433
  %conv13.i = zext nneg i32 %and12.i to i64, !dbg !434
  %mul14.i = mul nuw i64 %and10.i, %conv13.i, !dbg !435
  %xor15.i = xor i64 %xor.i, %mul14.i, !dbg !436
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i23, i32 %i.0.i27, !dbg !437
  %13 = load i64, ptr %arrayidx16.i, align 8, !dbg !437
  %shr17.i = lshr i64 %13, 3, !dbg !438
  %and18.i = and i64 %shr17.i, 1229782938247303441, !dbg !439
  %shr19.i = lshr i32 %xor2.i.i, 24, !dbg !440
  %and20.i = and i32 %shr19.i, 15, !dbg !441
  %conv21.i = zext nneg i32 %and20.i to i64, !dbg !442
  %mul22.i = mul nuw i64 %and18.i, %conv21.i, !dbg !443
  %xor23.i = xor i64 %xor15.i, %mul22.i, !dbg !444
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i27, !dbg !445
  %14 = load i64, ptr %arrayidx24.i, align 8, !dbg !446
  %xor25.i = xor i64 %14, %xor23.i, !dbg !446
  store i64 %xor25.i, ptr %arrayidx24.i, align 8, !dbg !446
  %inc.i32 = add nuw nsw i32 %i.0.i27, 1, !dbg !447
    #dbg_value(i32 %inc.i32, !274, !DIExpression(), !412)
  br label %for.cond.i26, !dbg !448, !llvm.loop !449

m_vec_mul_add.exit:                               ; preds = %for.cond.i26
  %add13.i = add nuw nsw i32 %k.0.i16, 1, !dbg !451
    #dbg_value(i32 %add13.i, !391, !DIExpression(), !392)
  br label %for.cond4.i15, !dbg !452, !llvm.loop !453

for.inc15.i18:                                    ; preds = %for.cond4.i15
    #dbg_value(i32 %bs_mat_entries_used.1.i, !369, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !360)
  %add14.i19 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !455
    #dbg_value(i32 %add14.i19, !369, !DIExpression(), !360)
  %inc.i20 = add nuw nsw i32 %c.0.i10, 1, !dbg !456
    #dbg_value(i32 %inc.i20, !383, !DIExpression(), !384)
  br label %for.cond1.i9, !dbg !457, !llvm.loop !458

for.inc17.i12:                                    ; preds = %for.cond1.i9
  %inc18.i13 = add nuw nsw i32 %r.0.i6, 1, !dbg !460
    #dbg_value(i32 %inc18.i13, !370, !DIExpression(), !372)
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i, -1, !dbg !461
  br label %for.cond.i5, !dbg !461, !llvm.loop !462

mul_add_m_upper_triangular_mat_x_mat_trans.exit:  ; preds = %for.cond.i5
  ret void, !dbg !464
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16, !llvmbmc.var !465
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %Vdec = alloca [780 x i8], align 16, !llvmbmc.var !466
  call void @mayo_memset(ptr %Vdec, i8 0, i32 780)
  %byte0 = getelementptr inbounds i8, ptr %Vdec, i32 0
  store i8 9, ptr %byte0, align 1
  %sk = alloca [18603 x i64], align 16, !llvmbmc.var !467
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %byte01 = getelementptr inbounds i8, ptr %sk, i32 0
  store i8 -80, ptr %byte01, align 1
  %byte1 = getelementptr inbounds i8, ptr %sk, i32 1
  store i8 -62, ptr %byte1, align 1
  %byte2 = getelementptr inbounds i8, ptr %sk, i32 2
  store i8 -98, ptr %byte2, align 1
  %byte3 = getelementptr inbounds i8, ptr %sk, i32 3
  store i8 -96, ptr %byte3, align 1
  %byte4 = getelementptr inbounds i8, ptr %sk, i32 4
  store i8 35, ptr %byte4, align 1
  %byte5 = getelementptr inbounds i8, ptr %sk, i32 5
  store i8 -17, ptr %byte5, align 1
  %byte6 = getelementptr inbounds i8, ptr %sk, i32 6
  store i8 -99, ptr %byte6, align 1
  %byte7 = getelementptr inbounds i8, ptr %sk, i32 7
  store i8 -29, ptr %byte7, align 1
  %sk2 = alloca [18603 x i64], align 16, !llvmbmc.var !467
  call void @mayo_memset(ptr %sk2, i8 0, i32 148824)
  %byte03 = getelementptr inbounds i8, ptr %sk2, i32 0
  store i8 -80, ptr %byte03, align 1
  %byte14 = getelementptr inbounds i8, ptr %sk2, i32 1
  store i8 78, ptr %byte14, align 1
  %byte25 = getelementptr inbounds i8, ptr %sk2, i32 2
  store i8 25, ptr %byte25, align 1
  %byte36 = getelementptr inbounds i8, ptr %sk2, i32 3
  store i8 47, ptr %byte36, align 1
  %byte47 = getelementptr inbounds i8, ptr %sk2, i32 4
  store i8 4, ptr %byte47, align 1
  %byte58 = getelementptr inbounds i8, ptr %sk2, i32 5
  store i8 19, ptr %byte58, align 1
  %byte69 = getelementptr inbounds i8, ptr %sk2, i32 6
  store i8 -91, ptr %byte69, align 1
  %byte710 = getelementptr inbounds i8, ptr %sk2, i32 7
  store i8 23, ptr %byte710, align 1
  %Mtmp = alloca [400 x i64], align 16, !llvmbmc.var !468
  call void @mayo_memset(ptr %Mtmp, i8 0, i32 3200)
  %A = alloca [6480 x i8], align 16, !llvmbmc.var !469
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  %byte011 = getelementptr inbounds i8, ptr %A, i32 0
  store i8 -79, ptr %byte011, align 1
  %byte112 = getelementptr inbounds i8, ptr %A, i32 1
  store i8 96, ptr %byte112, align 1
  %byte213 = getelementptr inbounds i8, ptr %A, i32 2
  store i8 109, ptr %byte213, align 1
  %byte314 = getelementptr inbounds i8, ptr %A, i32 3
  store i8 -57, ptr %byte314, align 1
  %byte415 = getelementptr inbounds i8, ptr %A, i32 4
  store i8 95, ptr %byte415, align 1
  %byte616 = getelementptr inbounds i8, ptr %A, i32 6
  store i8 -45, ptr %byte616, align 1
  %byte717 = getelementptr inbounds i8, ptr %A, i32 7
  store i8 -53, ptr %byte717, align 1
  call fastcc void @compute_M_and_VPV(ptr %p_buf, ptr %Vdec, ptr %sk, ptr %sk2, ptr %Mtmp, ptr %A)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !470 {
entry:
    #dbg_value(ptr %dst, !475, !DIExpression(), !476)
    #dbg_value(ptr %src, !477, !DIExpression(), !476)
    #dbg_value(i32 %len, !478, !DIExpression(), !476)
    #dbg_value(ptr %dst, !479, !DIExpression(), !476)
    #dbg_value(ptr %src, !480, !DIExpression(), !476)
    #dbg_value(i32 0, !483, !DIExpression(), !485)
  br label %for.cond, !dbg !486

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !487
    #dbg_value(i32 %i.0, !483, !DIExpression(), !485)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !488
  br i1 %exitcond, label %for.body, label %for.end, !dbg !490

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !491
  %0 = load i8, ptr %arrayidx, align 1, !dbg !491
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !492
  store i8 %0, ptr %arrayidx1, align 1, !dbg !493
  %inc = add i32 %i.0, 1, !dbg !494
    #dbg_value(i32 %inc, !483, !DIExpression(), !485)
  br label %for.cond, !dbg !495, !llvm.loop !496

for.end:                                          ; preds = %for.cond
  ret void, !dbg !498
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!0, !2, !3, !44, !67, !78, !87, !105, !123}
!llvm.ident = !{!124, !124, !124, !124, !124, !124, !124, !124}
!llvm.module.flags = !{!125, !126, !127, !128}

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
!124 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!125 = !{i32 2, !"Debug Info Version", i32 3}
!126 = !{i32 1, !"wchar_size", i32 4}
!127 = !{i32 1, !"min_enum_size", i32 4}
!128 = !{i32 1, !"Code Model", i32 1}
!129 = distinct !DISubprogram(name: "mayo_memset", scope: !130, file: !130, line: 3, type: !131, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !36)
!130 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!131 = !DISubroutineType(types: !132)
!132 = !{null, !70, !13, !20}
!133 = !DILocalVariable(name: "dst", arg: 1, scope: !129, file: !130, line: 3, type: !70)
!134 = !DILocation(line: 0, scope: !129)
!135 = !DILocalVariable(name: "val", arg: 2, scope: !129, file: !130, line: 3, type: !13)
!136 = !DILocalVariable(name: "len", arg: 3, scope: !129, file: !130, line: 3, type: !20)
!137 = !DILocalVariable(name: "d", scope: !129, file: !130, line: 5, type: !12)
!138 = !DILocalVariable(name: "i", scope: !139, file: !130, line: 7, type: !20)
!139 = distinct !DILexicalBlock(scope: !129, file: !130, line: 7, column: 5)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 7, column: 10, scope: !139)
!142 = !DILocation(line: 7, scope: !139)
!143 = !DILocation(line: 7, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !130, line: 7, column: 5)
!145 = !DILocation(line: 7, column: 5, scope: !139)
!146 = !DILocation(line: 8, column: 9, scope: !144)
!147 = !DILocation(line: 8, column: 14, scope: !144)
!148 = !DILocation(line: 7, column: 36, scope: !144)
!149 = !DILocation(line: 7, column: 5, scope: !144)
!150 = distinct !{!150, !145, !151, !152}
!151 = !DILocation(line: 8, column: 16, scope: !139)
!152 = !{!"llvm.loop.mustprogress"}
!153 = !DILocation(line: 9, column: 1, scope: !129)
!154 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !155, file: !155, line: 251, type: !156, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!155 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!156 = !DISubroutineType(types: !157)
!157 = !{null, !158, !50, !189, !189, !6, !6}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 32)
!159 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !160)
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !25, line: 289, baseType: !161)
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 265, size: 736, elements: !162)
!162 = !{!163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !161, file: !25, line: 266, baseType: !46, size: 32)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !161, file: !25, line: 267, baseType: !46, size: 32, offset: 32)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !161, file: !25, line: 268, baseType: !46, size: 32, offset: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !161, file: !25, line: 269, baseType: !46, size: 32, offset: 96)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !161, file: !25, line: 270, baseType: !46, size: 32, offset: 128)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !161, file: !25, line: 271, baseType: !50, size: 32, offset: 160)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !161, file: !25, line: 272, baseType: !46, size: 32, offset: 192)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !161, file: !25, line: 273, baseType: !46, size: 32, offset: 224)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !161, file: !25, line: 274, baseType: !46, size: 32, offset: 256)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !161, file: !25, line: 275, baseType: !46, size: 32, offset: 288)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !161, file: !25, line: 276, baseType: !46, size: 32, offset: 320)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !161, file: !25, line: 277, baseType: !46, size: 32, offset: 352)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !161, file: !25, line: 278, baseType: !46, size: 32, offset: 384)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !161, file: !25, line: 279, baseType: !46, size: 32, offset: 416)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !161, file: !25, line: 280, baseType: !46, size: 32, offset: 448)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !161, file: !25, line: 281, baseType: !46, size: 32, offset: 480)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !161, file: !25, line: 282, baseType: !46, size: 32, offset: 512)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !161, file: !25, line: 283, baseType: !46, size: 32, offset: 544)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !161, file: !25, line: 284, baseType: !46, size: 32, offset: 576)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !161, file: !25, line: 285, baseType: !46, size: 32, offset: 608)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !161, file: !25, line: 286, baseType: !46, size: 32, offset: 640)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !161, file: !25, line: 287, baseType: !46, size: 32, offset: 672)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !161, file: !25, line: 288, baseType: !186, size: 32, offset: 704)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 32)
!187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !188)
!188 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!190 = !DILocalVariable(name: "p", arg: 1, scope: !154, file: !155, line: 251, type: !158)
!191 = !DILocation(line: 0, scope: !154)
!192 = !DILocalVariable(name: "Vdec", arg: 2, scope: !154, file: !155, line: 251, type: !50)
!193 = !DILocalVariable(name: "L", arg: 3, scope: !154, file: !155, line: 251, type: !189)
!194 = !DILocalVariable(name: "P1", arg: 4, scope: !154, file: !155, line: 251, type: !189)
!195 = !DILocalVariable(name: "VL", arg: 5, scope: !154, file: !155, line: 251, type: !6)
!196 = !DILocalVariable(name: "VP1V", arg: 6, scope: !154, file: !155, line: 251, type: !6)
!197 = !DILocalVariable(name: "param_k", scope: !154, file: !155, line: 253, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!199 = !DILocalVariable(name: "param_v", scope: !154, file: !155, line: 254, type: !198)
!200 = !DILocalVariable(name: "param_o", scope: !154, file: !155, line: 255, type: !198)
!201 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !202, file: !155, line: 63, type: !198)
!202 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !155, file: !155, line: 63, type: !203, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!203 = !DISubroutineType(types: !204)
!204 = !{null, !198, !50, !189, !6, !198, !198, !198}
!205 = !DILocation(line: 0, scope: !202, inlinedAt: !206)
!206 = distinct !DILocation(line: 258, column: 5, scope: !154)
!207 = !DILocalVariable(name: "mat", arg: 2, scope: !202, file: !155, line: 63, type: !50)
!208 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !202, file: !155, line: 63, type: !189)
!209 = !DILocalVariable(name: "acc", arg: 4, scope: !202, file: !155, line: 63, type: !6)
!210 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !202, file: !155, line: 64, type: !198)
!211 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !202, file: !155, line: 64, type: !198)
!212 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !202, file: !155, line: 64, type: !198)
!213 = !DILocalVariable(name: "r", scope: !214, file: !155, line: 66, type: !46)
!214 = distinct !DILexicalBlock(scope: !202, file: !155, line: 66, column: 5)
!215 = !DILocation(line: 0, scope: !214, inlinedAt: !206)
!216 = !DILocation(line: 66, column: 10, scope: !214, inlinedAt: !206)
!217 = !DILocation(line: 66, scope: !214, inlinedAt: !206)
!218 = !DILocation(line: 66, column: 23, scope: !219, inlinedAt: !206)
!219 = distinct !DILexicalBlock(scope: !214, file: !155, line: 66, column: 5)
!220 = !DILocation(line: 66, column: 5, scope: !214, inlinedAt: !206)
!221 = !DILocation(line: 67, column: 9, scope: !222, inlinedAt: !206)
!222 = distinct !DILexicalBlock(scope: !223, file: !155, line: 67, column: 9)
!223 = distinct !DILexicalBlock(scope: !219, file: !155, line: 66, column: 40)
!224 = !DILocation(line: 67, scope: !222, inlinedAt: !206)
!225 = !DILocalVariable(name: "c", scope: !222, file: !155, line: 67, type: !46)
!226 = !DILocation(line: 0, scope: !222, inlinedAt: !206)
!227 = !DILocation(line: 67, column: 27, scope: !228, inlinedAt: !206)
!228 = distinct !DILexicalBlock(scope: !222, file: !155, line: 67, column: 9)
!229 = !DILocation(line: 68, column: 13, scope: !230, inlinedAt: !206)
!230 = distinct !DILexicalBlock(scope: !231, file: !155, line: 68, column: 13)
!231 = distinct !DILexicalBlock(scope: !228, file: !155, line: 67, column: 44)
!232 = !DILocation(line: 68, scope: !230, inlinedAt: !206)
!233 = !DILocalVariable(name: "k", scope: !230, file: !155, line: 68, type: !46)
!234 = !DILocation(line: 0, scope: !230, inlinedAt: !206)
!235 = !DILocation(line: 68, column: 31, scope: !236, inlinedAt: !206)
!236 = distinct !DILexicalBlock(scope: !230, file: !155, line: 68, column: 13)
!237 = !DILocation(line: 69, column: 70, scope: !238, inlinedAt: !206)
!238 = distinct !DILexicalBlock(scope: !236, file: !155, line: 68, column: 54)
!239 = !DILocation(line: 69, column: 84, scope: !238, inlinedAt: !206)
!240 = !DILocation(line: 69, column: 51, scope: !238, inlinedAt: !206)
!241 = !DILocation(line: 69, column: 96, scope: !238, inlinedAt: !206)
!242 = !DILocation(line: 69, column: 90, scope: !238, inlinedAt: !206)
!243 = !DILocation(line: 69, column: 136, scope: !238, inlinedAt: !206)
!244 = !DILocation(line: 69, column: 150, scope: !238, inlinedAt: !206)
!245 = !DILocation(line: 69, column: 117, scope: !238, inlinedAt: !206)
!246 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !247, file: !248, line: 31, type: !46)
!247 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !248, file: !248, line: 31, type: !249, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!248 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!249 = !DISubroutineType(types: !250)
!250 = !{null, !46, !189, !15, !6}
!251 = !DILocation(line: 0, scope: !247, inlinedAt: !252)
!252 = distinct !DILocation(line: 69, column: 17, scope: !238, inlinedAt: !206)
!253 = !DILocalVariable(name: "in", arg: 2, scope: !247, file: !248, line: 31, type: !189)
!254 = !DILocalVariable(name: "a", arg: 3, scope: !247, file: !248, line: 31, type: !15)
!255 = !DILocalVariable(name: "acc", arg: 4, scope: !247, file: !248, line: 31, type: !6)
!256 = !DILocalVariable(name: "b", arg: 1, scope: !257, file: !258, line: 136, type: !13)
!257 = distinct !DISubprogram(name: "mul_table", scope: !258, file: !258, line: 136, type: !259, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!258 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!259 = !DISubroutineType(types: !260)
!260 = !{!20, !13}
!261 = !DILocation(line: 0, scope: !257, inlinedAt: !262)
!262 = distinct !DILocation(line: 33, column: 20, scope: !247, inlinedAt: !252)
!263 = !DILocation(line: 137, column: 19, scope: !257, inlinedAt: !262)
!264 = !DILocation(line: 137, column: 33, scope: !257, inlinedAt: !262)
!265 = !DILocalVariable(name: "x", scope: !257, file: !258, line: 137, type: !20)
!266 = !DILocalVariable(name: "high_nibble_mask", scope: !257, file: !258, line: 139, type: !20)
!267 = !DILocation(line: 141, column: 28, scope: !257, inlinedAt: !262)
!268 = !DILocalVariable(name: "high_half", scope: !257, file: !258, line: 141, type: !20)
!269 = !DILocation(line: 142, column: 28, scope: !257, inlinedAt: !262)
!270 = !DILocation(line: 142, column: 47, scope: !257, inlinedAt: !262)
!271 = !DILocation(line: 142, column: 34, scope: !257, inlinedAt: !262)
!272 = !DILocalVariable(name: "tab", scope: !247, file: !248, line: 33, type: !20)
!273 = !DILocalVariable(name: "lsb_ask", scope: !247, file: !248, line: 35, type: !7)
!274 = !DILocalVariable(name: "i", scope: !275, file: !248, line: 37, type: !46)
!275 = distinct !DILexicalBlock(scope: !247, file: !248, line: 37, column: 5)
!276 = !DILocation(line: 0, scope: !275, inlinedAt: !252)
!277 = !DILocation(line: 37, column: 9, scope: !275, inlinedAt: !252)
!278 = !DILocation(line: 37, scope: !275, inlinedAt: !252)
!279 = !DILocation(line: 37, column: 20, scope: !280, inlinedAt: !252)
!280 = distinct !DILexicalBlock(scope: !275, file: !248, line: 37, column: 5)
!281 = !DILocation(line: 37, column: 5, scope: !275, inlinedAt: !252)
!282 = !DILocation(line: 38, column: 21, scope: !283, inlinedAt: !252)
!283 = distinct !DILexicalBlock(scope: !280, file: !248, line: 37, column: 43)
!284 = !DILocation(line: 38, column: 33, scope: !283, inlinedAt: !252)
!285 = !DILocation(line: 38, column: 51, scope: !283, inlinedAt: !252)
!286 = !DILocation(line: 38, column: 46, scope: !283, inlinedAt: !252)
!287 = !DILocation(line: 38, column: 44, scope: !283, inlinedAt: !252)
!288 = !DILocation(line: 39, column: 27, scope: !283, inlinedAt: !252)
!289 = !DILocation(line: 39, column: 33, scope: !283, inlinedAt: !252)
!290 = !DILocation(line: 39, column: 52, scope: !283, inlinedAt: !252)
!291 = !DILocation(line: 39, column: 59, scope: !283, inlinedAt: !252)
!292 = !DILocation(line: 39, column: 46, scope: !283, inlinedAt: !252)
!293 = !DILocation(line: 39, column: 44, scope: !283, inlinedAt: !252)
!294 = !DILocation(line: 39, column: 17, scope: !283, inlinedAt: !252)
!295 = !DILocation(line: 40, column: 21, scope: !283, inlinedAt: !252)
!296 = !DILocation(line: 40, column: 27, scope: !283, inlinedAt: !252)
!297 = !DILocation(line: 40, column: 33, scope: !283, inlinedAt: !252)
!298 = !DILocation(line: 40, column: 52, scope: !283, inlinedAt: !252)
!299 = !DILocation(line: 40, column: 59, scope: !283, inlinedAt: !252)
!300 = !DILocation(line: 40, column: 46, scope: !283, inlinedAt: !252)
!301 = !DILocation(line: 40, column: 44, scope: !283, inlinedAt: !252)
!302 = !DILocation(line: 40, column: 17, scope: !283, inlinedAt: !252)
!303 = !DILocation(line: 41, column: 21, scope: !283, inlinedAt: !252)
!304 = !DILocation(line: 41, column: 27, scope: !283, inlinedAt: !252)
!305 = !DILocation(line: 41, column: 33, scope: !283, inlinedAt: !252)
!306 = !DILocation(line: 41, column: 52, scope: !283, inlinedAt: !252)
!307 = !DILocation(line: 41, column: 59, scope: !283, inlinedAt: !252)
!308 = !DILocation(line: 41, column: 46, scope: !283, inlinedAt: !252)
!309 = !DILocation(line: 41, column: 44, scope: !283, inlinedAt: !252)
!310 = !DILocation(line: 41, column: 17, scope: !283, inlinedAt: !252)
!311 = !DILocation(line: 38, column: 9, scope: !283, inlinedAt: !252)
!312 = !DILocation(line: 38, column: 16, scope: !283, inlinedAt: !252)
!313 = !DILocation(line: 37, column: 40, scope: !280, inlinedAt: !252)
!314 = !DILocation(line: 37, column: 5, scope: !280, inlinedAt: !252)
!315 = distinct !{!315, !281, !316, !152}
!316 = !DILocation(line: 42, column: 5, scope: !275, inlinedAt: !252)
!317 = !DILocation(line: 68, column: 48, scope: !236, inlinedAt: !206)
!318 = !DILocation(line: 68, column: 13, scope: !236, inlinedAt: !206)
!319 = distinct !{!319, !229, !320, !152}
!320 = !DILocation(line: 70, column: 13, scope: !230, inlinedAt: !206)
!321 = !DILocation(line: 67, column: 40, scope: !228, inlinedAt: !206)
!322 = !DILocation(line: 67, column: 9, scope: !228, inlinedAt: !206)
!323 = distinct !{!323, !221, !324, !152}
!324 = !DILocation(line: 71, column: 9, scope: !222, inlinedAt: !206)
!325 = !DILocation(line: 66, column: 36, scope: !219, inlinedAt: !206)
!326 = !DILocation(line: 66, column: 5, scope: !219, inlinedAt: !206)
!327 = distinct !{!327, !220, !328, !152}
!328 = !DILocation(line: 72, column: 5, scope: !214, inlinedAt: !206)
!329 = !DILocalVariable(name: "Pv", scope: !154, file: !155, line: 261, type: !330)
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 249600, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 3900)
!333 = !DILocation(line: 261, column: 14, scope: !154)
!334 = !DILocation(line: 0, scope: !129, inlinedAt: !335)
!335 = distinct !DILocation(line: 261, column: 14, scope: !154)
!336 = !DILocation(line: 0, scope: !139, inlinedAt: !335)
!337 = !DILocation(line: 7, column: 10, scope: !139, inlinedAt: !335)
!338 = !DILocation(line: 7, scope: !139, inlinedAt: !335)
!339 = !DILocation(line: 7, column: 28, scope: !144, inlinedAt: !335)
!340 = !DILocation(line: 7, column: 5, scope: !139, inlinedAt: !335)
!341 = !DILocation(line: 8, column: 9, scope: !144, inlinedAt: !335)
!342 = !DILocation(line: 8, column: 14, scope: !144, inlinedAt: !335)
!343 = !DILocation(line: 7, column: 36, scope: !144, inlinedAt: !335)
!344 = !DILocation(line: 7, column: 5, scope: !144, inlinedAt: !335)
!345 = distinct !{!345, !340, !346, !152}
!346 = !DILocation(line: 8, column: 16, scope: !139, inlinedAt: !335)
!347 = !DILocalVariable(name: "p", arg: 1, scope: !348, file: !155, line: 86, type: !158)
!348 = distinct !DISubprogram(name: "P1_times_Vt", scope: !155, file: !155, line: 86, type: !349, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!349 = !DISubroutineType(types: !350)
!350 = !{null, !158, !189, !50, !6}
!351 = !DILocation(line: 0, scope: !348, inlinedAt: !352)
!352 = distinct !DILocation(line: 262, column: 5, scope: !154)
!353 = !DILocalVariable(name: "P1", arg: 2, scope: !348, file: !155, line: 86, type: !189)
!354 = !DILocalVariable(name: "V", arg: 3, scope: !348, file: !155, line: 86, type: !50)
!355 = !DILocalVariable(name: "acc", arg: 4, scope: !348, file: !155, line: 86, type: !6)
!356 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !357, file: !155, line: 32, type: !198)
!357 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !155, file: !155, line: 32, type: !358, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!358 = !DISubroutineType(types: !359)
!359 = !{null, !198, !189, !50, !6, !198, !198, !198, !198}
!360 = !DILocation(line: 0, scope: !357, inlinedAt: !361)
!361 = distinct !DILocation(line: 90, column: 5, scope: !348, inlinedAt: !352)
!362 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !357, file: !155, line: 32, type: !189)
!363 = !DILocalVariable(name: "mat", arg: 3, scope: !357, file: !155, line: 32, type: !50)
!364 = !DILocalVariable(name: "acc", arg: 4, scope: !357, file: !155, line: 32, type: !6)
!365 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !357, file: !155, line: 33, type: !198)
!366 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !357, file: !155, line: 33, type: !198)
!367 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !357, file: !155, line: 33, type: !198)
!368 = !DILocalVariable(name: "triangular", arg: 8, scope: !357, file: !155, line: 33, type: !198)
!369 = !DILocalVariable(name: "bs_mat_entries_used", scope: !357, file: !155, line: 34, type: !46)
!370 = !DILocalVariable(name: "r", scope: !371, file: !155, line: 35, type: !46)
!371 = distinct !DILexicalBlock(scope: !357, file: !155, line: 35, column: 5)
!372 = !DILocation(line: 0, scope: !371, inlinedAt: !361)
!373 = !DILocation(line: 35, column: 10, scope: !371, inlinedAt: !361)
!374 = !DILocation(line: 34, column: 9, scope: !357, inlinedAt: !361)
!375 = !DILocation(line: 35, scope: !371, inlinedAt: !361)
!376 = !DILocation(line: 35, column: 23, scope: !377, inlinedAt: !361)
!377 = distinct !DILexicalBlock(scope: !371, file: !155, line: 35, column: 5)
!378 = !DILocation(line: 35, column: 5, scope: !371, inlinedAt: !361)
!379 = !DILocation(line: 36, column: 9, scope: !380, inlinedAt: !361)
!380 = distinct !DILexicalBlock(scope: !381, file: !155, line: 36, column: 9)
!381 = distinct !DILexicalBlock(scope: !377, file: !155, line: 35, column: 43)
!382 = !DILocation(line: 36, scope: !380, inlinedAt: !361)
!383 = !DILocalVariable(name: "c", scope: !380, file: !155, line: 36, type: !46)
!384 = !DILocation(line: 0, scope: !380, inlinedAt: !361)
!385 = !DILocation(line: 36, column: 40, scope: !386, inlinedAt: !361)
!386 = distinct !DILexicalBlock(scope: !380, file: !155, line: 36, column: 9)
!387 = !DILocation(line: 37, column: 13, scope: !388, inlinedAt: !361)
!388 = distinct !DILexicalBlock(scope: !389, file: !155, line: 37, column: 13)
!389 = distinct !DILexicalBlock(scope: !386, file: !155, line: 36, column: 60)
!390 = !DILocation(line: 37, scope: !388, inlinedAt: !361)
!391 = !DILocalVariable(name: "k", scope: !388, file: !155, line: 37, type: !46)
!392 = !DILocation(line: 0, scope: !388, inlinedAt: !361)
!393 = !DILocation(line: 37, column: 31, scope: !394, inlinedAt: !361)
!394 = distinct !DILexicalBlock(scope: !388, file: !155, line: 37, column: 13)
!395 = !DILocation(line: 38, column: 51, scope: !396, inlinedAt: !361)
!396 = distinct !DILexicalBlock(scope: !394, file: !155, line: 37, column: 51)
!397 = !DILocation(line: 38, column: 94, scope: !396, inlinedAt: !361)
!398 = !DILocation(line: 38, column: 88, scope: !396, inlinedAt: !361)
!399 = !DILocation(line: 38, column: 137, scope: !396, inlinedAt: !361)
!400 = !DILocation(line: 38, column: 148, scope: !396, inlinedAt: !361)
!401 = !DILocation(line: 38, column: 118, scope: !396, inlinedAt: !361)
!402 = !DILocation(line: 0, scope: !247, inlinedAt: !403)
!403 = distinct !DILocation(line: 38, column: 17, scope: !396, inlinedAt: !361)
!404 = !DILocation(line: 0, scope: !257, inlinedAt: !405)
!405 = distinct !DILocation(line: 33, column: 20, scope: !247, inlinedAt: !403)
!406 = !DILocation(line: 137, column: 19, scope: !257, inlinedAt: !405)
!407 = !DILocation(line: 137, column: 33, scope: !257, inlinedAt: !405)
!408 = !DILocation(line: 141, column: 28, scope: !257, inlinedAt: !405)
!409 = !DILocation(line: 142, column: 28, scope: !257, inlinedAt: !405)
!410 = !DILocation(line: 142, column: 47, scope: !257, inlinedAt: !405)
!411 = !DILocation(line: 142, column: 34, scope: !257, inlinedAt: !405)
!412 = !DILocation(line: 0, scope: !275, inlinedAt: !403)
!413 = !DILocation(line: 37, column: 9, scope: !275, inlinedAt: !403)
!414 = !DILocation(line: 37, scope: !275, inlinedAt: !403)
!415 = !DILocation(line: 37, column: 20, scope: !280, inlinedAt: !403)
!416 = !DILocation(line: 37, column: 5, scope: !275, inlinedAt: !403)
!417 = !DILocation(line: 38, column: 21, scope: !283, inlinedAt: !403)
!418 = !DILocation(line: 38, column: 33, scope: !283, inlinedAt: !403)
!419 = !DILocation(line: 38, column: 51, scope: !283, inlinedAt: !403)
!420 = !DILocation(line: 38, column: 46, scope: !283, inlinedAt: !403)
!421 = !DILocation(line: 38, column: 44, scope: !283, inlinedAt: !403)
!422 = !DILocation(line: 39, column: 27, scope: !283, inlinedAt: !403)
!423 = !DILocation(line: 39, column: 33, scope: !283, inlinedAt: !403)
!424 = !DILocation(line: 39, column: 52, scope: !283, inlinedAt: !403)
!425 = !DILocation(line: 39, column: 59, scope: !283, inlinedAt: !403)
!426 = !DILocation(line: 39, column: 46, scope: !283, inlinedAt: !403)
!427 = !DILocation(line: 39, column: 44, scope: !283, inlinedAt: !403)
!428 = !DILocation(line: 39, column: 17, scope: !283, inlinedAt: !403)
!429 = !DILocation(line: 40, column: 21, scope: !283, inlinedAt: !403)
!430 = !DILocation(line: 40, column: 27, scope: !283, inlinedAt: !403)
!431 = !DILocation(line: 40, column: 33, scope: !283, inlinedAt: !403)
!432 = !DILocation(line: 40, column: 52, scope: !283, inlinedAt: !403)
!433 = !DILocation(line: 40, column: 59, scope: !283, inlinedAt: !403)
!434 = !DILocation(line: 40, column: 46, scope: !283, inlinedAt: !403)
!435 = !DILocation(line: 40, column: 44, scope: !283, inlinedAt: !403)
!436 = !DILocation(line: 40, column: 17, scope: !283, inlinedAt: !403)
!437 = !DILocation(line: 41, column: 21, scope: !283, inlinedAt: !403)
!438 = !DILocation(line: 41, column: 27, scope: !283, inlinedAt: !403)
!439 = !DILocation(line: 41, column: 33, scope: !283, inlinedAt: !403)
!440 = !DILocation(line: 41, column: 52, scope: !283, inlinedAt: !403)
!441 = !DILocation(line: 41, column: 59, scope: !283, inlinedAt: !403)
!442 = !DILocation(line: 41, column: 46, scope: !283, inlinedAt: !403)
!443 = !DILocation(line: 41, column: 44, scope: !283, inlinedAt: !403)
!444 = !DILocation(line: 41, column: 17, scope: !283, inlinedAt: !403)
!445 = !DILocation(line: 38, column: 9, scope: !283, inlinedAt: !403)
!446 = !DILocation(line: 38, column: 16, scope: !283, inlinedAt: !403)
!447 = !DILocation(line: 37, column: 40, scope: !280, inlinedAt: !403)
!448 = !DILocation(line: 37, column: 5, scope: !280, inlinedAt: !403)
!449 = distinct !{!449, !416, !450, !152}
!450 = !DILocation(line: 42, column: 5, scope: !275, inlinedAt: !403)
!451 = !DILocation(line: 37, column: 45, scope: !394, inlinedAt: !361)
!452 = !DILocation(line: 37, column: 13, scope: !394, inlinedAt: !361)
!453 = distinct !{!453, !387, !454, !152}
!454 = !DILocation(line: 39, column: 13, scope: !388, inlinedAt: !361)
!455 = !DILocation(line: 40, column: 33, scope: !389, inlinedAt: !361)
!456 = !DILocation(line: 36, column: 56, scope: !386, inlinedAt: !361)
!457 = !DILocation(line: 36, column: 9, scope: !386, inlinedAt: !361)
!458 = distinct !{!458, !379, !459, !152}
!459 = !DILocation(line: 41, column: 9, scope: !380, inlinedAt: !361)
!460 = !DILocation(line: 35, column: 39, scope: !377, inlinedAt: !361)
!461 = !DILocation(line: 35, column: 5, scope: !377, inlinedAt: !361)
!462 = distinct !{!462, !378, !463, !152}
!463 = !DILocation(line: 42, column: 5, scope: !371, inlinedAt: !361)
!464 = !DILocation(line: 265, column: 1, scope: !154)
!465 = !{!"p_buf"}
!466 = !{!"Vdec"}
!467 = !{!"sk"}
!468 = !{!"Mtmp"}
!469 = !{!"A"}
!470 = distinct !DISubprogram(name: "mayo_memcpy", scope: !130, file: !130, line: 11, type: !471, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !70, !473, !20}
!473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !474, size: 32)
!474 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!475 = !DILocalVariable(name: "dst", arg: 1, scope: !470, file: !130, line: 11, type: !70)
!476 = !DILocation(line: 0, scope: !470)
!477 = !DILocalVariable(name: "src", arg: 2, scope: !470, file: !130, line: 11, type: !473)
!478 = !DILocalVariable(name: "len", arg: 3, scope: !470, file: !130, line: 11, type: !20)
!479 = !DILocalVariable(name: "d", scope: !470, file: !130, line: 13, type: !12)
!480 = !DILocalVariable(name: "s", scope: !470, file: !130, line: 14, type: !481)
!481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !482, size: 32)
!482 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!483 = !DILocalVariable(name: "i", scope: !484, file: !130, line: 16, type: !20)
!484 = distinct !DILexicalBlock(scope: !470, file: !130, line: 16, column: 5)
!485 = !DILocation(line: 0, scope: !484)
!486 = !DILocation(line: 16, column: 10, scope: !484)
!487 = !DILocation(line: 16, scope: !484)
!488 = !DILocation(line: 16, column: 28, scope: !489)
!489 = distinct !DILexicalBlock(scope: !484, file: !130, line: 16, column: 5)
!490 = !DILocation(line: 16, column: 5, scope: !484)
!491 = !DILocation(line: 17, column: 16, scope: !489)
!492 = !DILocation(line: 17, column: 9, scope: !489)
!493 = !DILocation(line: 17, column: 14, scope: !489)
!494 = !DILocation(line: 16, column: 36, scope: !489)
!495 = !DILocation(line: 16, column: 5, scope: !489)
!496 = distinct !{!496, !490, !497, !152}
!497 = !DILocation(line: 17, column: 19, scope: !484)
!498 = !DILocation(line: 18, column: 1, scope: !470)
