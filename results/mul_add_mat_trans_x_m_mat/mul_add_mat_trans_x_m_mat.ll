; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef nonnull %mat, ptr noundef nonnull %bs_mat, ptr noundef nonnull %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i32 5, !136, !DIExpression(), !137)
    #dbg_value(ptr %mat, !138, !DIExpression(), !137)
    #dbg_value(ptr %bs_mat, !139, !DIExpression(), !137)
    #dbg_value(ptr %acc, !140, !DIExpression(), !137)
    #dbg_value(i32 78, !141, !DIExpression(), !137)
    #dbg_value(i32 8, !142, !DIExpression(), !137)
    #dbg_value(i32 8, !143, !DIExpression(), !137)
    #dbg_value(i32 0, !144, !DIExpression(), !146)
  br label %iter_0_start

for.end19:                                        ; preds = %iter_7_end
  ret void, !dbg !147

iter_0_start:                                     ; preds = %entry
  br label %for.cond1.preheader.iter0

for.cond1.preheader.iter0:                        ; preds = %iter_0_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter0, !dbg !153

for.body6.iter0:                                  ; preds = %for.cond4.preheader.iter0, %m_vec_mul_add.exit.iter0
  %k.02.iter0 = phi i32 [ 0, %for.cond4.preheader.iter0 ], [ %add14.iter0, %m_vec_mul_add.exit.iter0 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter0 = shl nuw nsw i32 %c.03.iter0, 3, !dbg !159
  %add.iter0 = or disjoint i32 %mul.iter0, %k.02.iter0, !dbg !162
  %add.ptr.idx.iter0 = mul nuw nsw i32 %add.iter0, 40, !dbg !163
  %add.ptr.iter0 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter0, !dbg !163
  %mul8.iter0 = shl nuw nsw i32 %c.03.iter0, 3, !dbg !164
  %0 = getelementptr i8, ptr %mat, i32 %mul8.iter0, !dbg !165
  %arrayidx.iter0 = getelementptr i8, ptr %0, i32 0, !dbg !165
  %1 = load i8, ptr %arrayidx.iter0, align 1, !dbg !165
  %add11.iter0 = or disjoint i32 0, %k.02.iter0, !dbg !166
  %add.ptr13.idx.iter0 = mul nuw nsw i32 %add11.iter0, 40, !dbg !167
  %add.ptr13.iter0 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter0, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter0 = zext i8 %1 to i32, !dbg !185
  %mul.i.i.iter0 = mul i32 %conv.i.i.iter0, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter0 = and i32 %mul.i.i.iter0, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter0 = lshr exact i32 %and.i.i.iter0, 4, !dbg !191
  %shr1.i.i.iter0 = lshr exact i32 %and.i.i.iter0, 3, !dbg !192
  %2 = xor i32 %shr.i.i.iter0, %shr1.i.i.iter0, !dbg !193
  %xor2.i.i.iter0 = xor i32 %2, %mul.i.i.iter0, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter0, !dbg !199

for.body.i.iter0:                                 ; preds = %for.body.i.iter0, %for.body6.iter0
  %i.0.i1.iter0 = phi i32 [ 0, %for.body6.iter0 ], [ %inc.i.iter0, %for.body.i.iter0 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.iter0, i32 %i.0.i1.iter0, !dbg !200
  %3 = load i64, ptr %arrayidx.i.iter0, align 8, !dbg !200
  %and.i.iter0 = and i64 %3, 1229782938247303441, !dbg !203
  %and1.i.iter0 = and i32 %xor2.i.i.iter0, 255, !dbg !204
  %conv.i.iter0 = zext nneg i32 %and1.i.iter0 to i64, !dbg !205
  %mul.i.iter0 = mul i64 %and.i.iter0, %conv.i.iter0, !dbg !206
  %shr.i.iter0 = lshr i64 %3, 1, !dbg !207
  %and3.i.iter0 = and i64 %shr.i.iter0, 1229782938247303441, !dbg !208
  %shr4.i.iter0 = lshr i32 %xor2.i.i.iter0, 8, !dbg !209
  %and5.i.iter0 = and i32 %shr4.i.iter0, 15, !dbg !210
  %conv6.i.iter0 = zext nneg i32 %and5.i.iter0 to i64, !dbg !211
  %mul7.i.iter0 = mul nuw i64 %and3.i.iter0, %conv6.i.iter0, !dbg !212
  %xor.i.iter0 = xor i64 %mul.i.iter0, %mul7.i.iter0, !dbg !213
  %arrayidx8.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.iter0, i32 %i.0.i1.iter0, !dbg !214
  %4 = load i64, ptr %arrayidx8.i.iter0, align 8, !dbg !214
  %shr9.i.iter0 = lshr i64 %4, 2, !dbg !215
  %and10.i.iter0 = and i64 %shr9.i.iter0, 1229782938247303441, !dbg !216
  %shr11.i.iter0 = lshr i32 %xor2.i.i.iter0, 16, !dbg !217
  %and12.i.iter0 = and i32 %shr11.i.iter0, 15, !dbg !218
  %conv13.i.iter0 = zext nneg i32 %and12.i.iter0 to i64, !dbg !219
  %mul14.i.iter0 = mul nuw i64 %and10.i.iter0, %conv13.i.iter0, !dbg !220
  %xor15.i.iter0 = xor i64 %xor.i.iter0, %mul14.i.iter0, !dbg !221
  %arrayidx16.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr.iter0, i32 %i.0.i1.iter0, !dbg !222
  %5 = load i64, ptr %arrayidx16.i.iter0, align 8, !dbg !222
  %shr17.i.iter0 = lshr i64 %5, 3, !dbg !223
  %and18.i.iter0 = and i64 %shr17.i.iter0, 1229782938247303441, !dbg !224
  %shr19.i.iter0 = lshr i32 %xor2.i.i.iter0, 24, !dbg !225
  %and20.i.iter0 = and i32 %shr19.i.iter0, 15, !dbg !226
  %conv21.i.iter0 = zext nneg i32 %and20.i.iter0 to i64, !dbg !227
  %mul22.i.iter0 = mul nuw i64 %and18.i.iter0, %conv21.i.iter0, !dbg !228
  %xor23.i.iter0 = xor i64 %xor15.i.iter0, %mul22.i.iter0, !dbg !229
  %arrayidx24.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter0, i32 %i.0.i1.iter0, !dbg !230
  %6 = load i64, ptr %arrayidx24.i.iter0, align 8, !dbg !231
  %xor25.i.iter0 = xor i64 %6, %xor23.i.iter0, !dbg !231
  store i64 %xor25.i.iter0, ptr %arrayidx24.i.iter0, align 8, !dbg !231
  %inc.i.iter0 = add nuw nsw i32 %i.0.i1.iter0, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter0 = icmp eq i32 %inc.i.iter0, 5, !dbg !233
  br i1 %exitcond.i.not.iter0, label %m_vec_mul_add.exit.iter0, label %for.body.i.iter0, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter0:                         ; preds = %for.body.i.iter0
  %add14.iter0 = add nuw nsw i32 %k.02.iter0, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter0 = icmp eq i32 %add14.iter0, 8, !dbg !238
  br i1 %exitcond.not.iter0, label %for.inc15.iter0, label %for.body6.iter0, !dbg !239, !llvm.loop !240

for.inc15.iter0:                                  ; preds = %m_vec_mul_add.exit.iter0
  %inc.iter0 = add nuw nsw i32 %c.03.iter0, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter0 = icmp eq i32 %inc.iter0, 78, !dbg !243
  br i1 %exitcond1.not.iter0, label %for.inc17.iter0, label %for.cond4.preheader.iter0, !dbg !153, !llvm.loop !244

for.inc17.iter0:                                  ; preds = %for.inc15.iter0
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_0_end

for.cond4.preheader.iter0:                        ; preds = %for.inc15.iter0, %for.cond1.preheader.iter0
  %c.03.iter0 = phi i32 [ 0, %for.cond1.preheader.iter0 ], [ %inc.iter0, %for.inc15.iter0 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter0, !dbg !239

iter_0_end:                                       ; preds = %for.inc17.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.cond1.preheader.iter1

for.cond1.preheader.iter1:                        ; preds = %iter_1_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter1, !dbg !153

for.body6.iter1:                                  ; preds = %for.cond4.preheader.iter1, %m_vec_mul_add.exit.iter1
  %k.02.iter1 = phi i32 [ 0, %for.cond4.preheader.iter1 ], [ %add14.iter1, %m_vec_mul_add.exit.iter1 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter1 = shl nuw nsw i32 %c.03.iter1, 3, !dbg !159
  %add.iter1 = or disjoint i32 %mul.iter1, %k.02.iter1, !dbg !162
  %add.ptr.idx.iter1 = mul nuw nsw i32 %add.iter1, 40, !dbg !163
  %add.ptr.iter1 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter1, !dbg !163
  %mul8.iter1 = shl nuw nsw i32 %c.03.iter1, 3, !dbg !164
  %7 = getelementptr i8, ptr %mat, i32 %mul8.iter1, !dbg !165
  %arrayidx.iter1 = getelementptr i8, ptr %7, i32 1, !dbg !165
  %8 = load i8, ptr %arrayidx.iter1, align 1, !dbg !165
  %add11.iter1 = or disjoint i32 8, %k.02.iter1, !dbg !166
  %add.ptr13.idx.iter1 = mul nuw nsw i32 %add11.iter1, 40, !dbg !167
  %add.ptr13.iter1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter1, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter1 = zext i8 %8 to i32, !dbg !185
  %mul.i.i.iter1 = mul i32 %conv.i.i.iter1, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter1 = and i32 %mul.i.i.iter1, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 4, !dbg !191
  %shr1.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 3, !dbg !192
  %9 = xor i32 %shr.i.i.iter1, %shr1.i.i.iter1, !dbg !193
  %xor2.i.i.iter1 = xor i32 %9, %mul.i.i.iter1, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter1, !dbg !199

for.body.i.iter1:                                 ; preds = %for.body.i.iter1, %for.body6.iter1
  %i.0.i1.iter1 = phi i32 [ 0, %for.body6.iter1 ], [ %inc.i.iter1, %for.body.i.iter1 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !200
  %10 = load i64, ptr %arrayidx.i.iter1, align 8, !dbg !200
  %and.i.iter1 = and i64 %10, 1229782938247303441, !dbg !203
  %and1.i.iter1 = and i32 %xor2.i.i.iter1, 255, !dbg !204
  %conv.i.iter1 = zext nneg i32 %and1.i.iter1 to i64, !dbg !205
  %mul.i.iter1 = mul i64 %and.i.iter1, %conv.i.iter1, !dbg !206
  %shr.i.iter1 = lshr i64 %10, 1, !dbg !207
  %and3.i.iter1 = and i64 %shr.i.iter1, 1229782938247303441, !dbg !208
  %shr4.i.iter1 = lshr i32 %xor2.i.i.iter1, 8, !dbg !209
  %and5.i.iter1 = and i32 %shr4.i.iter1, 15, !dbg !210
  %conv6.i.iter1 = zext nneg i32 %and5.i.iter1 to i64, !dbg !211
  %mul7.i.iter1 = mul nuw i64 %and3.i.iter1, %conv6.i.iter1, !dbg !212
  %xor.i.iter1 = xor i64 %mul.i.iter1, %mul7.i.iter1, !dbg !213
  %arrayidx8.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !214
  %11 = load i64, ptr %arrayidx8.i.iter1, align 8, !dbg !214
  %shr9.i.iter1 = lshr i64 %11, 2, !dbg !215
  %and10.i.iter1 = and i64 %shr9.i.iter1, 1229782938247303441, !dbg !216
  %shr11.i.iter1 = lshr i32 %xor2.i.i.iter1, 16, !dbg !217
  %and12.i.iter1 = and i32 %shr11.i.iter1, 15, !dbg !218
  %conv13.i.iter1 = zext nneg i32 %and12.i.iter1 to i64, !dbg !219
  %mul14.i.iter1 = mul nuw i64 %and10.i.iter1, %conv13.i.iter1, !dbg !220
  %xor15.i.iter1 = xor i64 %xor.i.iter1, %mul14.i.iter1, !dbg !221
  %arrayidx16.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !222
  %12 = load i64, ptr %arrayidx16.i.iter1, align 8, !dbg !222
  %shr17.i.iter1 = lshr i64 %12, 3, !dbg !223
  %and18.i.iter1 = and i64 %shr17.i.iter1, 1229782938247303441, !dbg !224
  %shr19.i.iter1 = lshr i32 %xor2.i.i.iter1, 24, !dbg !225
  %and20.i.iter1 = and i32 %shr19.i.iter1, 15, !dbg !226
  %conv21.i.iter1 = zext nneg i32 %and20.i.iter1 to i64, !dbg !227
  %mul22.i.iter1 = mul nuw i64 %and18.i.iter1, %conv21.i.iter1, !dbg !228
  %xor23.i.iter1 = xor i64 %xor15.i.iter1, %mul22.i.iter1, !dbg !229
  %arrayidx24.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter1, i32 %i.0.i1.iter1, !dbg !230
  %13 = load i64, ptr %arrayidx24.i.iter1, align 8, !dbg !231
  %xor25.i.iter1 = xor i64 %13, %xor23.i.iter1, !dbg !231
  store i64 %xor25.i.iter1, ptr %arrayidx24.i.iter1, align 8, !dbg !231
  %inc.i.iter1 = add nuw nsw i32 %i.0.i1.iter1, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter1 = icmp eq i32 %inc.i.iter1, 5, !dbg !233
  br i1 %exitcond.i.not.iter1, label %m_vec_mul_add.exit.iter1, label %for.body.i.iter1, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter1:                         ; preds = %for.body.i.iter1
  %add14.iter1 = add nuw nsw i32 %k.02.iter1, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter1 = icmp eq i32 %add14.iter1, 8, !dbg !238
  br i1 %exitcond.not.iter1, label %for.inc15.iter1, label %for.body6.iter1, !dbg !239, !llvm.loop !240

for.inc15.iter1:                                  ; preds = %m_vec_mul_add.exit.iter1
  %inc.iter1 = add nuw nsw i32 %c.03.iter1, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter1 = icmp eq i32 %inc.iter1, 78, !dbg !243
  br i1 %exitcond1.not.iter1, label %for.inc17.iter1, label %for.cond4.preheader.iter1, !dbg !153, !llvm.loop !244

for.inc17.iter1:                                  ; preds = %for.inc15.iter1
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_1_end

for.cond4.preheader.iter1:                        ; preds = %for.inc15.iter1, %for.cond1.preheader.iter1
  %c.03.iter1 = phi i32 [ 0, %for.cond1.preheader.iter1 ], [ %inc.iter1, %for.inc15.iter1 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter1, !dbg !239

iter_1_end:                                       ; preds = %for.inc17.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.cond1.preheader.iter2

for.cond1.preheader.iter2:                        ; preds = %iter_2_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter2, !dbg !153

for.body6.iter2:                                  ; preds = %for.cond4.preheader.iter2, %m_vec_mul_add.exit.iter2
  %k.02.iter2 = phi i32 [ 0, %for.cond4.preheader.iter2 ], [ %add14.iter2, %m_vec_mul_add.exit.iter2 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter2 = shl nuw nsw i32 %c.03.iter2, 3, !dbg !159
  %add.iter2 = or disjoint i32 %mul.iter2, %k.02.iter2, !dbg !162
  %add.ptr.idx.iter2 = mul nuw nsw i32 %add.iter2, 40, !dbg !163
  %add.ptr.iter2 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter2, !dbg !163
  %mul8.iter2 = shl nuw nsw i32 %c.03.iter2, 3, !dbg !164
  %14 = getelementptr i8, ptr %mat, i32 %mul8.iter2, !dbg !165
  %arrayidx.iter2 = getelementptr i8, ptr %14, i32 2, !dbg !165
  %15 = load i8, ptr %arrayidx.iter2, align 1, !dbg !165
  %add11.iter2 = or disjoint i32 16, %k.02.iter2, !dbg !166
  %add.ptr13.idx.iter2 = mul nuw nsw i32 %add11.iter2, 40, !dbg !167
  %add.ptr13.iter2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter2, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter2 = zext i8 %15 to i32, !dbg !185
  %mul.i.i.iter2 = mul i32 %conv.i.i.iter2, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter2 = and i32 %mul.i.i.iter2, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 4, !dbg !191
  %shr1.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 3, !dbg !192
  %16 = xor i32 %shr.i.i.iter2, %shr1.i.i.iter2, !dbg !193
  %xor2.i.i.iter2 = xor i32 %16, %mul.i.i.iter2, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter2, !dbg !199

for.body.i.iter2:                                 ; preds = %for.body.i.iter2, %for.body6.iter2
  %i.0.i1.iter2 = phi i32 [ 0, %for.body6.iter2 ], [ %inc.i.iter2, %for.body.i.iter2 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !200
  %17 = load i64, ptr %arrayidx.i.iter2, align 8, !dbg !200
  %and.i.iter2 = and i64 %17, 1229782938247303441, !dbg !203
  %and1.i.iter2 = and i32 %xor2.i.i.iter2, 255, !dbg !204
  %conv.i.iter2 = zext nneg i32 %and1.i.iter2 to i64, !dbg !205
  %mul.i.iter2 = mul i64 %and.i.iter2, %conv.i.iter2, !dbg !206
  %shr.i.iter2 = lshr i64 %17, 1, !dbg !207
  %and3.i.iter2 = and i64 %shr.i.iter2, 1229782938247303441, !dbg !208
  %shr4.i.iter2 = lshr i32 %xor2.i.i.iter2, 8, !dbg !209
  %and5.i.iter2 = and i32 %shr4.i.iter2, 15, !dbg !210
  %conv6.i.iter2 = zext nneg i32 %and5.i.iter2 to i64, !dbg !211
  %mul7.i.iter2 = mul nuw i64 %and3.i.iter2, %conv6.i.iter2, !dbg !212
  %xor.i.iter2 = xor i64 %mul.i.iter2, %mul7.i.iter2, !dbg !213
  %arrayidx8.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !214
  %18 = load i64, ptr %arrayidx8.i.iter2, align 8, !dbg !214
  %shr9.i.iter2 = lshr i64 %18, 2, !dbg !215
  %and10.i.iter2 = and i64 %shr9.i.iter2, 1229782938247303441, !dbg !216
  %shr11.i.iter2 = lshr i32 %xor2.i.i.iter2, 16, !dbg !217
  %and12.i.iter2 = and i32 %shr11.i.iter2, 15, !dbg !218
  %conv13.i.iter2 = zext nneg i32 %and12.i.iter2 to i64, !dbg !219
  %mul14.i.iter2 = mul nuw i64 %and10.i.iter2, %conv13.i.iter2, !dbg !220
  %xor15.i.iter2 = xor i64 %xor.i.iter2, %mul14.i.iter2, !dbg !221
  %arrayidx16.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !222
  %19 = load i64, ptr %arrayidx16.i.iter2, align 8, !dbg !222
  %shr17.i.iter2 = lshr i64 %19, 3, !dbg !223
  %and18.i.iter2 = and i64 %shr17.i.iter2, 1229782938247303441, !dbg !224
  %shr19.i.iter2 = lshr i32 %xor2.i.i.iter2, 24, !dbg !225
  %and20.i.iter2 = and i32 %shr19.i.iter2, 15, !dbg !226
  %conv21.i.iter2 = zext nneg i32 %and20.i.iter2 to i64, !dbg !227
  %mul22.i.iter2 = mul nuw i64 %and18.i.iter2, %conv21.i.iter2, !dbg !228
  %xor23.i.iter2 = xor i64 %xor15.i.iter2, %mul22.i.iter2, !dbg !229
  %arrayidx24.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter2, i32 %i.0.i1.iter2, !dbg !230
  %20 = load i64, ptr %arrayidx24.i.iter2, align 8, !dbg !231
  %xor25.i.iter2 = xor i64 %20, %xor23.i.iter2, !dbg !231
  store i64 %xor25.i.iter2, ptr %arrayidx24.i.iter2, align 8, !dbg !231
  %inc.i.iter2 = add nuw nsw i32 %i.0.i1.iter2, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter2 = icmp eq i32 %inc.i.iter2, 5, !dbg !233
  br i1 %exitcond.i.not.iter2, label %m_vec_mul_add.exit.iter2, label %for.body.i.iter2, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter2:                         ; preds = %for.body.i.iter2
  %add14.iter2 = add nuw nsw i32 %k.02.iter2, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter2 = icmp eq i32 %add14.iter2, 8, !dbg !238
  br i1 %exitcond.not.iter2, label %for.inc15.iter2, label %for.body6.iter2, !dbg !239, !llvm.loop !240

for.inc15.iter2:                                  ; preds = %m_vec_mul_add.exit.iter2
  %inc.iter2 = add nuw nsw i32 %c.03.iter2, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter2 = icmp eq i32 %inc.iter2, 78, !dbg !243
  br i1 %exitcond1.not.iter2, label %for.inc17.iter2, label %for.cond4.preheader.iter2, !dbg !153, !llvm.loop !244

for.inc17.iter2:                                  ; preds = %for.inc15.iter2
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_2_end

for.cond4.preheader.iter2:                        ; preds = %for.inc15.iter2, %for.cond1.preheader.iter2
  %c.03.iter2 = phi i32 [ 0, %for.cond1.preheader.iter2 ], [ %inc.iter2, %for.inc15.iter2 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter2, !dbg !239

iter_2_end:                                       ; preds = %for.inc17.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.cond1.preheader.iter3

for.cond1.preheader.iter3:                        ; preds = %iter_3_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter3, !dbg !153

for.body6.iter3:                                  ; preds = %for.cond4.preheader.iter3, %m_vec_mul_add.exit.iter3
  %k.02.iter3 = phi i32 [ 0, %for.cond4.preheader.iter3 ], [ %add14.iter3, %m_vec_mul_add.exit.iter3 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter3 = shl nuw nsw i32 %c.03.iter3, 3, !dbg !159
  %add.iter3 = or disjoint i32 %mul.iter3, %k.02.iter3, !dbg !162
  %add.ptr.idx.iter3 = mul nuw nsw i32 %add.iter3, 40, !dbg !163
  %add.ptr.iter3 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter3, !dbg !163
  %mul8.iter3 = shl nuw nsw i32 %c.03.iter3, 3, !dbg !164
  %21 = getelementptr i8, ptr %mat, i32 %mul8.iter3, !dbg !165
  %arrayidx.iter3 = getelementptr i8, ptr %21, i32 3, !dbg !165
  %22 = load i8, ptr %arrayidx.iter3, align 1, !dbg !165
  %add11.iter3 = or disjoint i32 24, %k.02.iter3, !dbg !166
  %add.ptr13.idx.iter3 = mul nuw nsw i32 %add11.iter3, 40, !dbg !167
  %add.ptr13.iter3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter3, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter3 = zext i8 %22 to i32, !dbg !185
  %mul.i.i.iter3 = mul i32 %conv.i.i.iter3, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter3 = and i32 %mul.i.i.iter3, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 4, !dbg !191
  %shr1.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 3, !dbg !192
  %23 = xor i32 %shr.i.i.iter3, %shr1.i.i.iter3, !dbg !193
  %xor2.i.i.iter3 = xor i32 %23, %mul.i.i.iter3, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter3, !dbg !199

for.body.i.iter3:                                 ; preds = %for.body.i.iter3, %for.body6.iter3
  %i.0.i1.iter3 = phi i32 [ 0, %for.body6.iter3 ], [ %inc.i.iter3, %for.body.i.iter3 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !200
  %24 = load i64, ptr %arrayidx.i.iter3, align 8, !dbg !200
  %and.i.iter3 = and i64 %24, 1229782938247303441, !dbg !203
  %and1.i.iter3 = and i32 %xor2.i.i.iter3, 255, !dbg !204
  %conv.i.iter3 = zext nneg i32 %and1.i.iter3 to i64, !dbg !205
  %mul.i.iter3 = mul i64 %and.i.iter3, %conv.i.iter3, !dbg !206
  %shr.i.iter3 = lshr i64 %24, 1, !dbg !207
  %and3.i.iter3 = and i64 %shr.i.iter3, 1229782938247303441, !dbg !208
  %shr4.i.iter3 = lshr i32 %xor2.i.i.iter3, 8, !dbg !209
  %and5.i.iter3 = and i32 %shr4.i.iter3, 15, !dbg !210
  %conv6.i.iter3 = zext nneg i32 %and5.i.iter3 to i64, !dbg !211
  %mul7.i.iter3 = mul nuw i64 %and3.i.iter3, %conv6.i.iter3, !dbg !212
  %xor.i.iter3 = xor i64 %mul.i.iter3, %mul7.i.iter3, !dbg !213
  %arrayidx8.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !214
  %25 = load i64, ptr %arrayidx8.i.iter3, align 8, !dbg !214
  %shr9.i.iter3 = lshr i64 %25, 2, !dbg !215
  %and10.i.iter3 = and i64 %shr9.i.iter3, 1229782938247303441, !dbg !216
  %shr11.i.iter3 = lshr i32 %xor2.i.i.iter3, 16, !dbg !217
  %and12.i.iter3 = and i32 %shr11.i.iter3, 15, !dbg !218
  %conv13.i.iter3 = zext nneg i32 %and12.i.iter3 to i64, !dbg !219
  %mul14.i.iter3 = mul nuw i64 %and10.i.iter3, %conv13.i.iter3, !dbg !220
  %xor15.i.iter3 = xor i64 %xor.i.iter3, %mul14.i.iter3, !dbg !221
  %arrayidx16.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !222
  %26 = load i64, ptr %arrayidx16.i.iter3, align 8, !dbg !222
  %shr17.i.iter3 = lshr i64 %26, 3, !dbg !223
  %and18.i.iter3 = and i64 %shr17.i.iter3, 1229782938247303441, !dbg !224
  %shr19.i.iter3 = lshr i32 %xor2.i.i.iter3, 24, !dbg !225
  %and20.i.iter3 = and i32 %shr19.i.iter3, 15, !dbg !226
  %conv21.i.iter3 = zext nneg i32 %and20.i.iter3 to i64, !dbg !227
  %mul22.i.iter3 = mul nuw i64 %and18.i.iter3, %conv21.i.iter3, !dbg !228
  %xor23.i.iter3 = xor i64 %xor15.i.iter3, %mul22.i.iter3, !dbg !229
  %arrayidx24.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter3, i32 %i.0.i1.iter3, !dbg !230
  %27 = load i64, ptr %arrayidx24.i.iter3, align 8, !dbg !231
  %xor25.i.iter3 = xor i64 %27, %xor23.i.iter3, !dbg !231
  store i64 %xor25.i.iter3, ptr %arrayidx24.i.iter3, align 8, !dbg !231
  %inc.i.iter3 = add nuw nsw i32 %i.0.i1.iter3, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter3 = icmp eq i32 %inc.i.iter3, 5, !dbg !233
  br i1 %exitcond.i.not.iter3, label %m_vec_mul_add.exit.iter3, label %for.body.i.iter3, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter3:                         ; preds = %for.body.i.iter3
  %add14.iter3 = add nuw nsw i32 %k.02.iter3, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter3 = icmp eq i32 %add14.iter3, 8, !dbg !238
  br i1 %exitcond.not.iter3, label %for.inc15.iter3, label %for.body6.iter3, !dbg !239, !llvm.loop !240

for.inc15.iter3:                                  ; preds = %m_vec_mul_add.exit.iter3
  %inc.iter3 = add nuw nsw i32 %c.03.iter3, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter3 = icmp eq i32 %inc.iter3, 78, !dbg !243
  br i1 %exitcond1.not.iter3, label %for.inc17.iter3, label %for.cond4.preheader.iter3, !dbg !153, !llvm.loop !244

for.inc17.iter3:                                  ; preds = %for.inc15.iter3
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_3_end

for.cond4.preheader.iter3:                        ; preds = %for.inc15.iter3, %for.cond1.preheader.iter3
  %c.03.iter3 = phi i32 [ 0, %for.cond1.preheader.iter3 ], [ %inc.iter3, %for.inc15.iter3 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter3, !dbg !239

iter_3_end:                                       ; preds = %for.inc17.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.cond1.preheader.iter4

for.cond1.preheader.iter4:                        ; preds = %iter_4_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter4, !dbg !153

for.body6.iter4:                                  ; preds = %for.cond4.preheader.iter4, %m_vec_mul_add.exit.iter4
  %k.02.iter4 = phi i32 [ 0, %for.cond4.preheader.iter4 ], [ %add14.iter4, %m_vec_mul_add.exit.iter4 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter4 = shl nuw nsw i32 %c.03.iter4, 3, !dbg !159
  %add.iter4 = or disjoint i32 %mul.iter4, %k.02.iter4, !dbg !162
  %add.ptr.idx.iter4 = mul nuw nsw i32 %add.iter4, 40, !dbg !163
  %add.ptr.iter4 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter4, !dbg !163
  %mul8.iter4 = shl nuw nsw i32 %c.03.iter4, 3, !dbg !164
  %28 = getelementptr i8, ptr %mat, i32 %mul8.iter4, !dbg !165
  %arrayidx.iter4 = getelementptr i8, ptr %28, i32 4, !dbg !165
  %29 = load i8, ptr %arrayidx.iter4, align 1, !dbg !165
  %add11.iter4 = or disjoint i32 32, %k.02.iter4, !dbg !166
  %add.ptr13.idx.iter4 = mul nuw nsw i32 %add11.iter4, 40, !dbg !167
  %add.ptr13.iter4 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter4, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter4 = zext i8 %29 to i32, !dbg !185
  %mul.i.i.iter4 = mul i32 %conv.i.i.iter4, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter4 = and i32 %mul.i.i.iter4, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 4, !dbg !191
  %shr1.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 3, !dbg !192
  %30 = xor i32 %shr.i.i.iter4, %shr1.i.i.iter4, !dbg !193
  %xor2.i.i.iter4 = xor i32 %30, %mul.i.i.iter4, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter4, !dbg !199

for.body.i.iter4:                                 ; preds = %for.body.i.iter4, %for.body6.iter4
  %i.0.i1.iter4 = phi i32 [ 0, %for.body6.iter4 ], [ %inc.i.iter4, %for.body.i.iter4 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !200
  %31 = load i64, ptr %arrayidx.i.iter4, align 8, !dbg !200
  %and.i.iter4 = and i64 %31, 1229782938247303441, !dbg !203
  %and1.i.iter4 = and i32 %xor2.i.i.iter4, 255, !dbg !204
  %conv.i.iter4 = zext nneg i32 %and1.i.iter4 to i64, !dbg !205
  %mul.i.iter4 = mul i64 %and.i.iter4, %conv.i.iter4, !dbg !206
  %shr.i.iter4 = lshr i64 %31, 1, !dbg !207
  %and3.i.iter4 = and i64 %shr.i.iter4, 1229782938247303441, !dbg !208
  %shr4.i.iter4 = lshr i32 %xor2.i.i.iter4, 8, !dbg !209
  %and5.i.iter4 = and i32 %shr4.i.iter4, 15, !dbg !210
  %conv6.i.iter4 = zext nneg i32 %and5.i.iter4 to i64, !dbg !211
  %mul7.i.iter4 = mul nuw i64 %and3.i.iter4, %conv6.i.iter4, !dbg !212
  %xor.i.iter4 = xor i64 %mul.i.iter4, %mul7.i.iter4, !dbg !213
  %arrayidx8.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !214
  %32 = load i64, ptr %arrayidx8.i.iter4, align 8, !dbg !214
  %shr9.i.iter4 = lshr i64 %32, 2, !dbg !215
  %and10.i.iter4 = and i64 %shr9.i.iter4, 1229782938247303441, !dbg !216
  %shr11.i.iter4 = lshr i32 %xor2.i.i.iter4, 16, !dbg !217
  %and12.i.iter4 = and i32 %shr11.i.iter4, 15, !dbg !218
  %conv13.i.iter4 = zext nneg i32 %and12.i.iter4 to i64, !dbg !219
  %mul14.i.iter4 = mul nuw i64 %and10.i.iter4, %conv13.i.iter4, !dbg !220
  %xor15.i.iter4 = xor i64 %xor.i.iter4, %mul14.i.iter4, !dbg !221
  %arrayidx16.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !222
  %33 = load i64, ptr %arrayidx16.i.iter4, align 8, !dbg !222
  %shr17.i.iter4 = lshr i64 %33, 3, !dbg !223
  %and18.i.iter4 = and i64 %shr17.i.iter4, 1229782938247303441, !dbg !224
  %shr19.i.iter4 = lshr i32 %xor2.i.i.iter4, 24, !dbg !225
  %and20.i.iter4 = and i32 %shr19.i.iter4, 15, !dbg !226
  %conv21.i.iter4 = zext nneg i32 %and20.i.iter4 to i64, !dbg !227
  %mul22.i.iter4 = mul nuw i64 %and18.i.iter4, %conv21.i.iter4, !dbg !228
  %xor23.i.iter4 = xor i64 %xor15.i.iter4, %mul22.i.iter4, !dbg !229
  %arrayidx24.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter4, i32 %i.0.i1.iter4, !dbg !230
  %34 = load i64, ptr %arrayidx24.i.iter4, align 8, !dbg !231
  %xor25.i.iter4 = xor i64 %34, %xor23.i.iter4, !dbg !231
  store i64 %xor25.i.iter4, ptr %arrayidx24.i.iter4, align 8, !dbg !231
  %inc.i.iter4 = add nuw nsw i32 %i.0.i1.iter4, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter4 = icmp eq i32 %inc.i.iter4, 5, !dbg !233
  br i1 %exitcond.i.not.iter4, label %m_vec_mul_add.exit.iter4, label %for.body.i.iter4, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter4:                         ; preds = %for.body.i.iter4
  %add14.iter4 = add nuw nsw i32 %k.02.iter4, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter4 = icmp eq i32 %add14.iter4, 8, !dbg !238
  br i1 %exitcond.not.iter4, label %for.inc15.iter4, label %for.body6.iter4, !dbg !239, !llvm.loop !240

for.inc15.iter4:                                  ; preds = %m_vec_mul_add.exit.iter4
  %inc.iter4 = add nuw nsw i32 %c.03.iter4, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter4 = icmp eq i32 %inc.iter4, 78, !dbg !243
  br i1 %exitcond1.not.iter4, label %for.inc17.iter4, label %for.cond4.preheader.iter4, !dbg !153, !llvm.loop !244

for.inc17.iter4:                                  ; preds = %for.inc15.iter4
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_4_end

for.cond4.preheader.iter4:                        ; preds = %for.inc15.iter4, %for.cond1.preheader.iter4
  %c.03.iter4 = phi i32 [ 0, %for.cond1.preheader.iter4 ], [ %inc.iter4, %for.inc15.iter4 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter4, !dbg !239

iter_4_end:                                       ; preds = %for.inc17.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.cond1.preheader.iter5

for.cond1.preheader.iter5:                        ; preds = %iter_5_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter5, !dbg !153

for.body6.iter5:                                  ; preds = %for.cond4.preheader.iter5, %m_vec_mul_add.exit.iter5
  %k.02.iter5 = phi i32 [ 0, %for.cond4.preheader.iter5 ], [ %add14.iter5, %m_vec_mul_add.exit.iter5 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter5 = shl nuw nsw i32 %c.03.iter5, 3, !dbg !159
  %add.iter5 = or disjoint i32 %mul.iter5, %k.02.iter5, !dbg !162
  %add.ptr.idx.iter5 = mul nuw nsw i32 %add.iter5, 40, !dbg !163
  %add.ptr.iter5 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter5, !dbg !163
  %mul8.iter5 = shl nuw nsw i32 %c.03.iter5, 3, !dbg !164
  %35 = getelementptr i8, ptr %mat, i32 %mul8.iter5, !dbg !165
  %arrayidx.iter5 = getelementptr i8, ptr %35, i32 5, !dbg !165
  %36 = load i8, ptr %arrayidx.iter5, align 1, !dbg !165
  %add11.iter5 = or disjoint i32 40, %k.02.iter5, !dbg !166
  %add.ptr13.idx.iter5 = mul nuw nsw i32 %add11.iter5, 40, !dbg !167
  %add.ptr13.iter5 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter5, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter5 = zext i8 %36 to i32, !dbg !185
  %mul.i.i.iter5 = mul i32 %conv.i.i.iter5, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter5 = and i32 %mul.i.i.iter5, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 4, !dbg !191
  %shr1.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 3, !dbg !192
  %37 = xor i32 %shr.i.i.iter5, %shr1.i.i.iter5, !dbg !193
  %xor2.i.i.iter5 = xor i32 %37, %mul.i.i.iter5, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter5, !dbg !199

for.body.i.iter5:                                 ; preds = %for.body.i.iter5, %for.body6.iter5
  %i.0.i1.iter5 = phi i32 [ 0, %for.body6.iter5 ], [ %inc.i.iter5, %for.body.i.iter5 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !200
  %38 = load i64, ptr %arrayidx.i.iter5, align 8, !dbg !200
  %and.i.iter5 = and i64 %38, 1229782938247303441, !dbg !203
  %and1.i.iter5 = and i32 %xor2.i.i.iter5, 255, !dbg !204
  %conv.i.iter5 = zext nneg i32 %and1.i.iter5 to i64, !dbg !205
  %mul.i.iter5 = mul i64 %and.i.iter5, %conv.i.iter5, !dbg !206
  %shr.i.iter5 = lshr i64 %38, 1, !dbg !207
  %and3.i.iter5 = and i64 %shr.i.iter5, 1229782938247303441, !dbg !208
  %shr4.i.iter5 = lshr i32 %xor2.i.i.iter5, 8, !dbg !209
  %and5.i.iter5 = and i32 %shr4.i.iter5, 15, !dbg !210
  %conv6.i.iter5 = zext nneg i32 %and5.i.iter5 to i64, !dbg !211
  %mul7.i.iter5 = mul nuw i64 %and3.i.iter5, %conv6.i.iter5, !dbg !212
  %xor.i.iter5 = xor i64 %mul.i.iter5, %mul7.i.iter5, !dbg !213
  %arrayidx8.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !214
  %39 = load i64, ptr %arrayidx8.i.iter5, align 8, !dbg !214
  %shr9.i.iter5 = lshr i64 %39, 2, !dbg !215
  %and10.i.iter5 = and i64 %shr9.i.iter5, 1229782938247303441, !dbg !216
  %shr11.i.iter5 = lshr i32 %xor2.i.i.iter5, 16, !dbg !217
  %and12.i.iter5 = and i32 %shr11.i.iter5, 15, !dbg !218
  %conv13.i.iter5 = zext nneg i32 %and12.i.iter5 to i64, !dbg !219
  %mul14.i.iter5 = mul nuw i64 %and10.i.iter5, %conv13.i.iter5, !dbg !220
  %xor15.i.iter5 = xor i64 %xor.i.iter5, %mul14.i.iter5, !dbg !221
  %arrayidx16.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !222
  %40 = load i64, ptr %arrayidx16.i.iter5, align 8, !dbg !222
  %shr17.i.iter5 = lshr i64 %40, 3, !dbg !223
  %and18.i.iter5 = and i64 %shr17.i.iter5, 1229782938247303441, !dbg !224
  %shr19.i.iter5 = lshr i32 %xor2.i.i.iter5, 24, !dbg !225
  %and20.i.iter5 = and i32 %shr19.i.iter5, 15, !dbg !226
  %conv21.i.iter5 = zext nneg i32 %and20.i.iter5 to i64, !dbg !227
  %mul22.i.iter5 = mul nuw i64 %and18.i.iter5, %conv21.i.iter5, !dbg !228
  %xor23.i.iter5 = xor i64 %xor15.i.iter5, %mul22.i.iter5, !dbg !229
  %arrayidx24.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter5, i32 %i.0.i1.iter5, !dbg !230
  %41 = load i64, ptr %arrayidx24.i.iter5, align 8, !dbg !231
  %xor25.i.iter5 = xor i64 %41, %xor23.i.iter5, !dbg !231
  store i64 %xor25.i.iter5, ptr %arrayidx24.i.iter5, align 8, !dbg !231
  %inc.i.iter5 = add nuw nsw i32 %i.0.i1.iter5, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter5 = icmp eq i32 %inc.i.iter5, 5, !dbg !233
  br i1 %exitcond.i.not.iter5, label %m_vec_mul_add.exit.iter5, label %for.body.i.iter5, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter5:                         ; preds = %for.body.i.iter5
  %add14.iter5 = add nuw nsw i32 %k.02.iter5, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter5 = icmp eq i32 %add14.iter5, 8, !dbg !238
  br i1 %exitcond.not.iter5, label %for.inc15.iter5, label %for.body6.iter5, !dbg !239, !llvm.loop !240

for.inc15.iter5:                                  ; preds = %m_vec_mul_add.exit.iter5
  %inc.iter5 = add nuw nsw i32 %c.03.iter5, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter5 = icmp eq i32 %inc.iter5, 78, !dbg !243
  br i1 %exitcond1.not.iter5, label %for.inc17.iter5, label %for.cond4.preheader.iter5, !dbg !153, !llvm.loop !244

for.inc17.iter5:                                  ; preds = %for.inc15.iter5
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_5_end

for.cond4.preheader.iter5:                        ; preds = %for.inc15.iter5, %for.cond1.preheader.iter5
  %c.03.iter5 = phi i32 [ 0, %for.cond1.preheader.iter5 ], [ %inc.iter5, %for.inc15.iter5 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter5, !dbg !239

iter_5_end:                                       ; preds = %for.inc17.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.cond1.preheader.iter6

for.cond1.preheader.iter6:                        ; preds = %iter_6_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter6, !dbg !153

for.body6.iter6:                                  ; preds = %for.cond4.preheader.iter6, %m_vec_mul_add.exit.iter6
  %k.02.iter6 = phi i32 [ 0, %for.cond4.preheader.iter6 ], [ %add14.iter6, %m_vec_mul_add.exit.iter6 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter6 = shl nuw nsw i32 %c.03.iter6, 3, !dbg !159
  %add.iter6 = or disjoint i32 %mul.iter6, %k.02.iter6, !dbg !162
  %add.ptr.idx.iter6 = mul nuw nsw i32 %add.iter6, 40, !dbg !163
  %add.ptr.iter6 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter6, !dbg !163
  %mul8.iter6 = shl nuw nsw i32 %c.03.iter6, 3, !dbg !164
  %42 = getelementptr i8, ptr %mat, i32 %mul8.iter6, !dbg !165
  %arrayidx.iter6 = getelementptr i8, ptr %42, i32 6, !dbg !165
  %43 = load i8, ptr %arrayidx.iter6, align 1, !dbg !165
  %add11.iter6 = or disjoint i32 48, %k.02.iter6, !dbg !166
  %add.ptr13.idx.iter6 = mul nuw nsw i32 %add11.iter6, 40, !dbg !167
  %add.ptr13.iter6 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter6, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter6 = zext i8 %43 to i32, !dbg !185
  %mul.i.i.iter6 = mul i32 %conv.i.i.iter6, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter6 = and i32 %mul.i.i.iter6, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 4, !dbg !191
  %shr1.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 3, !dbg !192
  %44 = xor i32 %shr.i.i.iter6, %shr1.i.i.iter6, !dbg !193
  %xor2.i.i.iter6 = xor i32 %44, %mul.i.i.iter6, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter6, !dbg !199

for.body.i.iter6:                                 ; preds = %for.body.i.iter6, %for.body6.iter6
  %i.0.i1.iter6 = phi i32 [ 0, %for.body6.iter6 ], [ %inc.i.iter6, %for.body.i.iter6 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !200
  %45 = load i64, ptr %arrayidx.i.iter6, align 8, !dbg !200
  %and.i.iter6 = and i64 %45, 1229782938247303441, !dbg !203
  %and1.i.iter6 = and i32 %xor2.i.i.iter6, 255, !dbg !204
  %conv.i.iter6 = zext nneg i32 %and1.i.iter6 to i64, !dbg !205
  %mul.i.iter6 = mul i64 %and.i.iter6, %conv.i.iter6, !dbg !206
  %shr.i.iter6 = lshr i64 %45, 1, !dbg !207
  %and3.i.iter6 = and i64 %shr.i.iter6, 1229782938247303441, !dbg !208
  %shr4.i.iter6 = lshr i32 %xor2.i.i.iter6, 8, !dbg !209
  %and5.i.iter6 = and i32 %shr4.i.iter6, 15, !dbg !210
  %conv6.i.iter6 = zext nneg i32 %and5.i.iter6 to i64, !dbg !211
  %mul7.i.iter6 = mul nuw i64 %and3.i.iter6, %conv6.i.iter6, !dbg !212
  %xor.i.iter6 = xor i64 %mul.i.iter6, %mul7.i.iter6, !dbg !213
  %arrayidx8.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !214
  %46 = load i64, ptr %arrayidx8.i.iter6, align 8, !dbg !214
  %shr9.i.iter6 = lshr i64 %46, 2, !dbg !215
  %and10.i.iter6 = and i64 %shr9.i.iter6, 1229782938247303441, !dbg !216
  %shr11.i.iter6 = lshr i32 %xor2.i.i.iter6, 16, !dbg !217
  %and12.i.iter6 = and i32 %shr11.i.iter6, 15, !dbg !218
  %conv13.i.iter6 = zext nneg i32 %and12.i.iter6 to i64, !dbg !219
  %mul14.i.iter6 = mul nuw i64 %and10.i.iter6, %conv13.i.iter6, !dbg !220
  %xor15.i.iter6 = xor i64 %xor.i.iter6, %mul14.i.iter6, !dbg !221
  %arrayidx16.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !222
  %47 = load i64, ptr %arrayidx16.i.iter6, align 8, !dbg !222
  %shr17.i.iter6 = lshr i64 %47, 3, !dbg !223
  %and18.i.iter6 = and i64 %shr17.i.iter6, 1229782938247303441, !dbg !224
  %shr19.i.iter6 = lshr i32 %xor2.i.i.iter6, 24, !dbg !225
  %and20.i.iter6 = and i32 %shr19.i.iter6, 15, !dbg !226
  %conv21.i.iter6 = zext nneg i32 %and20.i.iter6 to i64, !dbg !227
  %mul22.i.iter6 = mul nuw i64 %and18.i.iter6, %conv21.i.iter6, !dbg !228
  %xor23.i.iter6 = xor i64 %xor15.i.iter6, %mul22.i.iter6, !dbg !229
  %arrayidx24.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter6, i32 %i.0.i1.iter6, !dbg !230
  %48 = load i64, ptr %arrayidx24.i.iter6, align 8, !dbg !231
  %xor25.i.iter6 = xor i64 %48, %xor23.i.iter6, !dbg !231
  store i64 %xor25.i.iter6, ptr %arrayidx24.i.iter6, align 8, !dbg !231
  %inc.i.iter6 = add nuw nsw i32 %i.0.i1.iter6, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter6 = icmp eq i32 %inc.i.iter6, 5, !dbg !233
  br i1 %exitcond.i.not.iter6, label %m_vec_mul_add.exit.iter6, label %for.body.i.iter6, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter6:                         ; preds = %for.body.i.iter6
  %add14.iter6 = add nuw nsw i32 %k.02.iter6, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter6 = icmp eq i32 %add14.iter6, 8, !dbg !238
  br i1 %exitcond.not.iter6, label %for.inc15.iter6, label %for.body6.iter6, !dbg !239, !llvm.loop !240

for.inc15.iter6:                                  ; preds = %m_vec_mul_add.exit.iter6
  %inc.iter6 = add nuw nsw i32 %c.03.iter6, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter6 = icmp eq i32 %inc.iter6, 78, !dbg !243
  br i1 %exitcond1.not.iter6, label %for.inc17.iter6, label %for.cond4.preheader.iter6, !dbg !153, !llvm.loop !244

for.inc17.iter6:                                  ; preds = %for.inc15.iter6
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_6_end

for.cond4.preheader.iter6:                        ; preds = %for.inc15.iter6, %for.cond1.preheader.iter6
  %c.03.iter6 = phi i32 [ 0, %for.cond1.preheader.iter6 ], [ %inc.iter6, %for.inc15.iter6 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter6, !dbg !239

iter_6_end:                                       ; preds = %for.inc17.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.cond1.preheader.iter7

for.cond1.preheader.iter7:                        ; preds = %iter_7_start
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
    #dbg_value(i32 0, !148, !DIExpression(), !152)
  br label %for.cond4.preheader.iter7, !dbg !153

for.body6.iter7:                                  ; preds = %for.cond4.preheader.iter7, %m_vec_mul_add.exit.iter7
  %k.02.iter7 = phi i32 [ 0, %for.cond4.preheader.iter7 ], [ %add14.iter7, %m_vec_mul_add.exit.iter7 ]
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %mul.iter7 = shl nuw nsw i32 %c.03.iter7, 3, !dbg !159
  %add.iter7 = or disjoint i32 %mul.iter7, %k.02.iter7, !dbg !162
  %add.ptr.idx.iter7 = mul nuw nsw i32 %add.iter7, 40, !dbg !163
  %add.ptr.iter7 = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx.iter7, !dbg !163
  %mul8.iter7 = shl nuw nsw i32 %c.03.iter7, 3, !dbg !164
  %49 = getelementptr i8, ptr %mat, i32 %mul8.iter7, !dbg !165
  %arrayidx.iter7 = getelementptr i8, ptr %49, i32 7, !dbg !165
  %50 = load i8, ptr %arrayidx.iter7, align 1, !dbg !165
  %add11.iter7 = or disjoint i32 56, %k.02.iter7, !dbg !166
  %add.ptr13.idx.iter7 = mul nuw nsw i32 %add11.iter7, 40, !dbg !167
  %add.ptr13.iter7 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.iter7, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter7 = zext i8 %50 to i32, !dbg !185
  %mul.i.i.iter7 = mul i32 %conv.i.i.iter7, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter7 = and i32 %mul.i.i.iter7, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 4, !dbg !191
  %shr1.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 3, !dbg !192
  %51 = xor i32 %shr.i.i.iter7, %shr1.i.i.iter7, !dbg !193
  %xor2.i.i.iter7 = xor i32 %51, %mul.i.i.iter7, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter7, !dbg !199

for.body.i.iter7:                                 ; preds = %for.body.i.iter7, %for.body6.iter7
  %i.0.i1.iter7 = phi i32 [ 0, %for.body6.iter7 ], [ %inc.i.iter7, %for.body.i.iter7 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !200
  %52 = load i64, ptr %arrayidx.i.iter7, align 8, !dbg !200
  %and.i.iter7 = and i64 %52, 1229782938247303441, !dbg !203
  %and1.i.iter7 = and i32 %xor2.i.i.iter7, 255, !dbg !204
  %conv.i.iter7 = zext nneg i32 %and1.i.iter7 to i64, !dbg !205
  %mul.i.iter7 = mul i64 %and.i.iter7, %conv.i.iter7, !dbg !206
  %shr.i.iter7 = lshr i64 %52, 1, !dbg !207
  %and3.i.iter7 = and i64 %shr.i.iter7, 1229782938247303441, !dbg !208
  %shr4.i.iter7 = lshr i32 %xor2.i.i.iter7, 8, !dbg !209
  %and5.i.iter7 = and i32 %shr4.i.iter7, 15, !dbg !210
  %conv6.i.iter7 = zext nneg i32 %and5.i.iter7 to i64, !dbg !211
  %mul7.i.iter7 = mul nuw i64 %and3.i.iter7, %conv6.i.iter7, !dbg !212
  %xor.i.iter7 = xor i64 %mul.i.iter7, %mul7.i.iter7, !dbg !213
  %arrayidx8.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !214
  %53 = load i64, ptr %arrayidx8.i.iter7, align 8, !dbg !214
  %shr9.i.iter7 = lshr i64 %53, 2, !dbg !215
  %and10.i.iter7 = and i64 %shr9.i.iter7, 1229782938247303441, !dbg !216
  %shr11.i.iter7 = lshr i32 %xor2.i.i.iter7, 16, !dbg !217
  %and12.i.iter7 = and i32 %shr11.i.iter7, 15, !dbg !218
  %conv13.i.iter7 = zext nneg i32 %and12.i.iter7 to i64, !dbg !219
  %mul14.i.iter7 = mul nuw i64 %and10.i.iter7, %conv13.i.iter7, !dbg !220
  %xor15.i.iter7 = xor i64 %xor.i.iter7, %mul14.i.iter7, !dbg !221
  %arrayidx16.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !222
  %54 = load i64, ptr %arrayidx16.i.iter7, align 8, !dbg !222
  %shr17.i.iter7 = lshr i64 %54, 3, !dbg !223
  %and18.i.iter7 = and i64 %shr17.i.iter7, 1229782938247303441, !dbg !224
  %shr19.i.iter7 = lshr i32 %xor2.i.i.iter7, 24, !dbg !225
  %and20.i.iter7 = and i32 %shr19.i.iter7, 15, !dbg !226
  %conv21.i.iter7 = zext nneg i32 %and20.i.iter7 to i64, !dbg !227
  %mul22.i.iter7 = mul nuw i64 %and18.i.iter7, %conv21.i.iter7, !dbg !228
  %xor23.i.iter7 = xor i64 %xor15.i.iter7, %mul22.i.iter7, !dbg !229
  %arrayidx24.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr13.iter7, i32 %i.0.i1.iter7, !dbg !230
  %55 = load i64, ptr %arrayidx24.i.iter7, align 8, !dbg !231
  %xor25.i.iter7 = xor i64 %55, %xor23.i.iter7, !dbg !231
  store i64 %xor25.i.iter7, ptr %arrayidx24.i.iter7, align 8, !dbg !231
  %inc.i.iter7 = add nuw nsw i32 %i.0.i1.iter7, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter7 = icmp eq i32 %inc.i.iter7, 5, !dbg !233
  br i1 %exitcond.i.not.iter7, label %m_vec_mul_add.exit.iter7, label %for.body.i.iter7, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter7:                         ; preds = %for.body.i.iter7
  %add14.iter7 = add nuw nsw i32 %k.02.iter7, 1, !dbg !237
    #dbg_value(i32 undef, !154, !DIExpression(), !158)
  %exitcond.not.iter7 = icmp eq i32 %add14.iter7, 8, !dbg !238
  br i1 %exitcond.not.iter7, label %for.inc15.iter7, label %for.body6.iter7, !dbg !239, !llvm.loop !240

for.inc15.iter7:                                  ; preds = %m_vec_mul_add.exit.iter7
  %inc.iter7 = add nuw nsw i32 %c.03.iter7, 1, !dbg !242
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
  %exitcond1.not.iter7 = icmp eq i32 %inc.iter7, 78, !dbg !243
  br i1 %exitcond1.not.iter7, label %for.inc17.iter7, label %for.cond4.preheader.iter7, !dbg !153, !llvm.loop !244

for.inc17.iter7:                                  ; preds = %for.inc15.iter7
    #dbg_value(i32 undef, !144, !DIExpression(), !146)
  br label %iter_7_end

for.cond4.preheader.iter7:                        ; preds = %for.inc15.iter7, %for.cond1.preheader.iter7
  %c.03.iter7 = phi i32 [ 0, %for.cond1.preheader.iter7 ], [ %inc.iter7, %for.inc15.iter7 ]
    #dbg_value(i32 undef, !148, !DIExpression(), !152)
    #dbg_value(i32 0, !154, !DIExpression(), !158)
  br label %for.body6.iter7, !dbg !239

iter_7_end:                                       ; preds = %for.inc17.iter7
  br label %for.end19
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %O = alloca [624 x i8], align 16, !llvmbmc.var !246
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  store i8 13, ptr %O, align 1
  %P = alloca [18525 x i64], align 16, !llvmbmc.var !247
  call void @mayo_memset(ptr %P, i8 0, i32 148200)
  store i8 -48, ptr %P, align 1
  %byte1 = getelementptr inbounds nuw i8, ptr %P, i32 1
  store i8 -40, ptr %byte1, align 1
  %byte2 = getelementptr inbounds nuw i8, ptr %P, i32 2
  store i8 65, ptr %byte2, align 1
  %byte3 = getelementptr inbounds nuw i8, ptr %P, i32 3
  store i8 55, ptr %byte3, align 1
  %byte4 = getelementptr inbounds nuw i8, ptr %P, i32 4
  store i8 34, ptr %byte4, align 1
  %byte5 = getelementptr inbounds nuw i8, ptr %P, i32 5
  store i8 59, ptr %byte5, align 1
  %byte6 = getelementptr inbounds nuw i8, ptr %P, i32 6
  store i8 33, ptr %byte6, align 1
  %byte7 = getelementptr inbounds nuw i8, ptr %P, i32 7
  store i8 54, ptr %byte7, align 1
  %P3 = alloca [320 x i64], align 16, !llvmbmc.var !248
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 5, ptr %O, ptr %P, ptr %P3, i32 78, i32 8, i32 8)
  %out_actual_i8 = load i8, ptr %P3, align 1
  %out_cmp = icmp eq i8 %out_actual_i8, -111
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !249 {
entry:
    #dbg_value(ptr %dst, !253, !DIExpression(), !254)
    #dbg_value(i8 %val, !255, !DIExpression(), !254)
    #dbg_value(i32 %len, !256, !DIExpression(), !254)
    #dbg_value(ptr %dst, !257, !DIExpression(), !254)
    #dbg_value(i32 0, !258, !DIExpression(), !260)
  br label %for.cond, !dbg !261

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !262
    #dbg_value(i32 %i.0, !258, !DIExpression(), !260)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !263
  br i1 %exitcond, label %for.body, label %for.end, !dbg !265

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !266
  store i8 %val, ptr %arrayidx, align 1, !dbg !267
  %inc = add i32 %i.0, 1, !dbg !268
    #dbg_value(i32 %inc, !258, !DIExpression(), !260)
  br label %for.cond, !dbg !269, !llvm.loop !270

for.end:                                          ; preds = %for.cond
  ret void, !dbg !272
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !273 {
entry:
    #dbg_value(ptr %dst, !278, !DIExpression(), !279)
    #dbg_value(ptr %src, !280, !DIExpression(), !279)
    #dbg_value(i32 %len, !281, !DIExpression(), !279)
    #dbg_value(ptr %dst, !282, !DIExpression(), !279)
    #dbg_value(ptr %src, !283, !DIExpression(), !279)
    #dbg_value(i32 0, !286, !DIExpression(), !288)
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !290
    #dbg_value(i32 %i.0, !286, !DIExpression(), !288)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !291
  br i1 %exitcond, label %for.body, label %for.end, !dbg !293

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !294
  %0 = load i8, ptr %arrayidx, align 1, !dbg !294
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !295
  store i8 %0, ptr %arrayidx1, align 1, !dbg !296
  %inc = add i32 %i.0, 1, !dbg !297
    #dbg_value(i32 %inc, !286, !DIExpression(), !288)
  br label %for.cond, !dbg !298, !llvm.loop !299

for.end:                                          ; preds = %for.cond
  ret void, !dbg !301
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
!130 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !131, file: !131, line: 47, type: !132, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !134, !50, !135, !6, !134, !134, !134}
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!136 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !130, file: !131, line: 47, type: !134)
!137 = !DILocation(line: 0, scope: !130)
!138 = !DILocalVariable(name: "mat", arg: 2, scope: !130, file: !131, line: 47, type: !50)
!139 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !130, file: !131, line: 47, type: !135)
!140 = !DILocalVariable(name: "acc", arg: 4, scope: !130, file: !131, line: 47, type: !6)
!141 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !130, file: !131, line: 48, type: !134)
!142 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !130, file: !131, line: 48, type: !134)
!143 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !130, file: !131, line: 48, type: !134)
!144 = !DILocalVariable(name: "r", scope: !145, file: !131, line: 50, type: !46)
!145 = distinct !DILexicalBlock(scope: !130, file: !131, line: 50, column: 5)
!146 = !DILocation(line: 0, scope: !145)
!147 = !DILocation(line: 59, column: 1, scope: !130)
!148 = !DILocalVariable(name: "c", scope: !149, file: !131, line: 51, type: !46)
!149 = distinct !DILexicalBlock(scope: !150, file: !131, line: 51, column: 9)
!150 = distinct !DILexicalBlock(scope: !151, file: !131, line: 50, column: 40)
!151 = distinct !DILexicalBlock(scope: !145, file: !131, line: 50, column: 5)
!152 = !DILocation(line: 0, scope: !149)
!153 = !DILocation(line: 51, column: 9, scope: !149)
!154 = !DILocalVariable(name: "k", scope: !155, file: !131, line: 52, type: !46)
!155 = distinct !DILexicalBlock(scope: !156, file: !131, line: 52, column: 13)
!156 = distinct !DILexicalBlock(scope: !157, file: !131, line: 51, column: 44)
!157 = distinct !DILexicalBlock(scope: !149, file: !131, line: 51, column: 9)
!158 = !DILocation(line: 0, scope: !155)
!159 = !DILocation(line: 53, column: 70, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !131, line: 52, column: 54)
!161 = distinct !DILexicalBlock(scope: !155, file: !131, line: 52, column: 13)
!162 = !DILocation(line: 53, column: 84, scope: !160)
!163 = !DILocation(line: 53, column: 51, scope: !160)
!164 = !DILocation(line: 53, column: 96, scope: !160)
!165 = !DILocation(line: 53, column: 90, scope: !160)
!166 = !DILocation(line: 53, column: 150, scope: !160)
!167 = !DILocation(line: 53, column: 117, scope: !160)
!168 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !169, file: !170, line: 31, type: !46)
!169 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !170, file: !170, line: 31, type: !171, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!170 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!171 = !DISubroutineType(types: !172)
!172 = !{null, !46, !135, !15, !6}
!173 = !DILocation(line: 0, scope: !169, inlinedAt: !174)
!174 = distinct !DILocation(line: 53, column: 17, scope: !160)
!175 = !DILocalVariable(name: "in", arg: 2, scope: !169, file: !170, line: 31, type: !135)
!176 = !DILocalVariable(name: "a", arg: 3, scope: !169, file: !170, line: 31, type: !15)
!177 = !DILocalVariable(name: "acc", arg: 4, scope: !169, file: !170, line: 31, type: !6)
!178 = !DILocalVariable(name: "b", arg: 1, scope: !179, file: !180, line: 136, type: !13)
!179 = distinct !DISubprogram(name: "mul_table", scope: !180, file: !180, line: 136, type: !181, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!180 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!181 = !DISubroutineType(types: !182)
!182 = !{!20, !13}
!183 = !DILocation(line: 0, scope: !179, inlinedAt: !184)
!184 = distinct !DILocation(line: 33, column: 20, scope: !169, inlinedAt: !174)
!185 = !DILocation(line: 137, column: 19, scope: !179, inlinedAt: !184)
!186 = !DILocation(line: 137, column: 33, scope: !179, inlinedAt: !184)
!187 = !DILocalVariable(name: "x", scope: !179, file: !180, line: 137, type: !20)
!188 = !DILocalVariable(name: "high_nibble_mask", scope: !179, file: !180, line: 139, type: !20)
!189 = !DILocation(line: 141, column: 28, scope: !179, inlinedAt: !184)
!190 = !DILocalVariable(name: "high_half", scope: !179, file: !180, line: 141, type: !20)
!191 = !DILocation(line: 142, column: 28, scope: !179, inlinedAt: !184)
!192 = !DILocation(line: 142, column: 47, scope: !179, inlinedAt: !184)
!193 = !DILocation(line: 142, column: 34, scope: !179, inlinedAt: !184)
!194 = !DILocalVariable(name: "tab", scope: !169, file: !170, line: 33, type: !20)
!195 = !DILocalVariable(name: "lsb_ask", scope: !169, file: !170, line: 35, type: !7)
!196 = !DILocalVariable(name: "i", scope: !197, file: !170, line: 37, type: !46)
!197 = distinct !DILexicalBlock(scope: !169, file: !170, line: 37, column: 5)
!198 = !DILocation(line: 0, scope: !197, inlinedAt: !174)
!199 = !DILocation(line: 37, column: 5, scope: !197, inlinedAt: !174)
!200 = !DILocation(line: 38, column: 21, scope: !201, inlinedAt: !174)
!201 = distinct !DILexicalBlock(scope: !202, file: !170, line: 37, column: 43)
!202 = distinct !DILexicalBlock(scope: !197, file: !170, line: 37, column: 5)
!203 = !DILocation(line: 38, column: 33, scope: !201, inlinedAt: !174)
!204 = !DILocation(line: 38, column: 51, scope: !201, inlinedAt: !174)
!205 = !DILocation(line: 38, column: 46, scope: !201, inlinedAt: !174)
!206 = !DILocation(line: 38, column: 44, scope: !201, inlinedAt: !174)
!207 = !DILocation(line: 39, column: 27, scope: !201, inlinedAt: !174)
!208 = !DILocation(line: 39, column: 33, scope: !201, inlinedAt: !174)
!209 = !DILocation(line: 39, column: 52, scope: !201, inlinedAt: !174)
!210 = !DILocation(line: 39, column: 59, scope: !201, inlinedAt: !174)
!211 = !DILocation(line: 39, column: 46, scope: !201, inlinedAt: !174)
!212 = !DILocation(line: 39, column: 44, scope: !201, inlinedAt: !174)
!213 = !DILocation(line: 39, column: 17, scope: !201, inlinedAt: !174)
!214 = !DILocation(line: 40, column: 21, scope: !201, inlinedAt: !174)
!215 = !DILocation(line: 40, column: 27, scope: !201, inlinedAt: !174)
!216 = !DILocation(line: 40, column: 33, scope: !201, inlinedAt: !174)
!217 = !DILocation(line: 40, column: 52, scope: !201, inlinedAt: !174)
!218 = !DILocation(line: 40, column: 59, scope: !201, inlinedAt: !174)
!219 = !DILocation(line: 40, column: 46, scope: !201, inlinedAt: !174)
!220 = !DILocation(line: 40, column: 44, scope: !201, inlinedAt: !174)
!221 = !DILocation(line: 40, column: 17, scope: !201, inlinedAt: !174)
!222 = !DILocation(line: 41, column: 21, scope: !201, inlinedAt: !174)
!223 = !DILocation(line: 41, column: 27, scope: !201, inlinedAt: !174)
!224 = !DILocation(line: 41, column: 33, scope: !201, inlinedAt: !174)
!225 = !DILocation(line: 41, column: 52, scope: !201, inlinedAt: !174)
!226 = !DILocation(line: 41, column: 59, scope: !201, inlinedAt: !174)
!227 = !DILocation(line: 41, column: 46, scope: !201, inlinedAt: !174)
!228 = !DILocation(line: 41, column: 44, scope: !201, inlinedAt: !174)
!229 = !DILocation(line: 41, column: 17, scope: !201, inlinedAt: !174)
!230 = !DILocation(line: 38, column: 9, scope: !201, inlinedAt: !174)
!231 = !DILocation(line: 38, column: 16, scope: !201, inlinedAt: !174)
!232 = !DILocation(line: 37, column: 40, scope: !202, inlinedAt: !174)
!233 = !DILocation(line: 37, column: 20, scope: !202, inlinedAt: !174)
!234 = distinct !{!234, !199, !235, !236}
!235 = !DILocation(line: 42, column: 5, scope: !197, inlinedAt: !174)
!236 = !{!"llvm.loop.mustprogress"}
!237 = !DILocation(line: 52, column: 48, scope: !161)
!238 = !DILocation(line: 52, column: 31, scope: !161)
!239 = !DILocation(line: 52, column: 13, scope: !155)
!240 = distinct !{!240, !239, !241, !236}
!241 = !DILocation(line: 54, column: 13, scope: !155)
!242 = !DILocation(line: 51, column: 40, scope: !157)
!243 = !DILocation(line: 51, column: 27, scope: !157)
!244 = distinct !{!244, !153, !245, !236}
!245 = !DILocation(line: 55, column: 9, scope: !149)
!246 = !{!"O"}
!247 = !{!"P"}
!248 = !{!"P3"}
!249 = distinct !DISubprogram(name: "mayo_memset", scope: !250, file: !250, line: 3, type: !251, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!250 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!251 = !DISubroutineType(types: !252)
!252 = !{null, !70, !13, !20}
!253 = !DILocalVariable(name: "dst", arg: 1, scope: !249, file: !250, line: 3, type: !70)
!254 = !DILocation(line: 0, scope: !249)
!255 = !DILocalVariable(name: "val", arg: 2, scope: !249, file: !250, line: 3, type: !13)
!256 = !DILocalVariable(name: "len", arg: 3, scope: !249, file: !250, line: 3, type: !20)
!257 = !DILocalVariable(name: "d", scope: !249, file: !250, line: 5, type: !12)
!258 = !DILocalVariable(name: "i", scope: !259, file: !250, line: 7, type: !20)
!259 = distinct !DILexicalBlock(scope: !249, file: !250, line: 7, column: 5)
!260 = !DILocation(line: 0, scope: !259)
!261 = !DILocation(line: 7, column: 10, scope: !259)
!262 = !DILocation(line: 7, scope: !259)
!263 = !DILocation(line: 7, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !250, line: 7, column: 5)
!265 = !DILocation(line: 7, column: 5, scope: !259)
!266 = !DILocation(line: 8, column: 9, scope: !264)
!267 = !DILocation(line: 8, column: 14, scope: !264)
!268 = !DILocation(line: 7, column: 36, scope: !264)
!269 = !DILocation(line: 7, column: 5, scope: !264)
!270 = distinct !{!270, !265, !271, !236}
!271 = !DILocation(line: 8, column: 16, scope: !259)
!272 = !DILocation(line: 9, column: 1, scope: !249)
!273 = distinct !DISubprogram(name: "mayo_memcpy", scope: !250, file: !250, line: 11, type: !274, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!274 = !DISubroutineType(types: !275)
!275 = !{null, !70, !276, !20}
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 32)
!277 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!278 = !DILocalVariable(name: "dst", arg: 1, scope: !273, file: !250, line: 11, type: !70)
!279 = !DILocation(line: 0, scope: !273)
!280 = !DILocalVariable(name: "src", arg: 2, scope: !273, file: !250, line: 11, type: !276)
!281 = !DILocalVariable(name: "len", arg: 3, scope: !273, file: !250, line: 11, type: !20)
!282 = !DILocalVariable(name: "d", scope: !273, file: !250, line: 13, type: !12)
!283 = !DILocalVariable(name: "s", scope: !273, file: !250, line: 14, type: !284)
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 32)
!285 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!286 = !DILocalVariable(name: "i", scope: !287, file: !250, line: 16, type: !20)
!287 = distinct !DILexicalBlock(scope: !273, file: !250, line: 16, column: 5)
!288 = !DILocation(line: 0, scope: !287)
!289 = !DILocation(line: 16, column: 10, scope: !287)
!290 = !DILocation(line: 16, scope: !287)
!291 = !DILocation(line: 16, column: 28, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !250, line: 16, column: 5)
!293 = !DILocation(line: 16, column: 5, scope: !287)
!294 = !DILocation(line: 17, column: 16, scope: !292)
!295 = !DILocation(line: 17, column: 9, scope: !292)
!296 = !DILocation(line: 17, column: 14, scope: !292)
!297 = !DILocation(line: 16, column: 36, scope: !292)
!298 = !DILocation(line: 16, column: 5, scope: !292)
!299 = distinct !{!299, !293, !300, !236}
!300 = !DILocation(line: 17, column: 19, scope: !287)
!301 = !DILocation(line: 18, column: 1, scope: !273)
