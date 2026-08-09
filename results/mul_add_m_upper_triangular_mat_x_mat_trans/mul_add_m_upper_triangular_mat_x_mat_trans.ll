; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef nonnull %bs_mat, ptr noundef nonnull %mat, ptr noundef nonnull %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i32 5, !136, !DIExpression(), !137)
    #dbg_value(ptr %bs_mat, !138, !DIExpression(), !137)
    #dbg_value(ptr %mat, !139, !DIExpression(), !137)
    #dbg_value(ptr %acc, !140, !DIExpression(), !137)
    #dbg_value(i32 78, !141, !DIExpression(), !137)
    #dbg_value(i32 78, !142, !DIExpression(), !137)
    #dbg_value(i32 10, !143, !DIExpression(), !137)
    #dbg_value(i32 1, !144, !DIExpression(), !137)
    #dbg_value(i32 0, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !146, !DIExpression(), !148)
  br label %iter_0_start

for.end19:                                        ; preds = %iter_77_end
  ret void, !dbg !149

iter_0_start:                                     ; preds = %entry
  br label %for.cond1.preheader.iter0

for.cond1.preheader.iter0:                        ; preds = %iter_0_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter0, !dbg !155

for.body6.iter0:                                  ; preds = %for.cond4.preheader.iter0, %m_vec_mul_add.exit.iter0
  %k.02.iter0 = phi i32 [ 0, %for.cond4.preheader.iter0 ], [ %add13.iter0, %m_vec_mul_add.exit.iter0 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter0 = mul nsw i32 %bs_mat_entries_used.14.iter0, 40, !dbg !161
  %add.ptr.iter0 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter0, !dbg !161
  %mul8.iter0 = mul nuw nsw i32 %k.02.iter0, 78, !dbg !164
  %0 = getelementptr i8, ptr %mat, i32 %mul8.iter0, !dbg !165
  %arrayidx.iter0 = getelementptr i8, ptr %0, i32 %c.05.iter0, !dbg !165
  %1 = load i8, ptr %arrayidx.iter0, align 1, !dbg !165
  %add10.iter0 = add nuw nsw i32 0, %k.02.iter0, !dbg !166
  %add.ptr12.idx.iter0 = mul nuw nsw i32 %add10.iter0, 40, !dbg !167
  %add.ptr12.iter0 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter0, !dbg !167
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
  %arrayidx24.i.iter0 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter0, i32 %i.0.i1.iter0, !dbg !230
  %6 = load i64, ptr %arrayidx24.i.iter0, align 8, !dbg !231
  %xor25.i.iter0 = xor i64 %6, %xor23.i.iter0, !dbg !231
  store i64 %xor25.i.iter0, ptr %arrayidx24.i.iter0, align 8, !dbg !231
  %inc.i.iter0 = add nuw nsw i32 %i.0.i1.iter0, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter0 = icmp eq i32 %inc.i.iter0, 5, !dbg !233
  br i1 %exitcond.i.not.iter0, label %m_vec_mul_add.exit.iter0, label %for.body.i.iter0, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter0:                         ; preds = %for.body.i.iter0
  %add13.iter0 = add nuw nsw i32 %k.02.iter0, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter0 = icmp eq i32 %add13.iter0, 10, !dbg !238
  br i1 %exitcond.not.iter0, label %for.inc15.iter0, label %for.body6.iter0, !dbg !239, !llvm.loop !240

for.inc15.iter0:                                  ; preds = %m_vec_mul_add.exit.iter0
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter0 = add i32 %bs_mat_entries_used.14.iter0, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter0 = add nuw nsw i32 %c.05.iter0, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter0 = icmp eq i32 %add14.iter0, 78, !dbg !244
  br i1 %exitcond1.not.iter0, label %for.cond1.for.inc17_crit_edge.iter0, label %for.cond4.preheader.iter0, !dbg !155, !llvm.loop !245

for.inc17.iter0:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter0
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_0_end

for.cond4.preheader.iter0:                        ; preds = %for.cond4.preheader.lr.ph.iter0, %for.inc15.iter0
  %c.05.iter0 = phi i32 [ 0, %for.cond4.preheader.lr.ph.iter0 ], [ %inc.iter0, %for.inc15.iter0 ]
  %bs_mat_entries_used.14.iter0 = phi i32 [ 0, %for.cond4.preheader.lr.ph.iter0 ], [ %add14.iter0, %for.inc15.iter0 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter0, !dbg !239

for.cond4.preheader.lr.ph.iter0:                  ; preds = %for.cond1.preheader.iter0
  br label %for.cond4.preheader.iter0, !dbg !155

for.cond1.for.inc17_crit_edge.iter0:              ; preds = %for.inc15.iter0
  %split.iter0 = phi i32 [ %add14.iter0, %for.inc15.iter0 ]
  br label %for.inc17.iter0, !dbg !155

iter_0_end:                                       ; preds = %for.inc17.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.cond1.preheader.iter1

for.cond1.preheader.iter1:                        ; preds = %iter_1_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %7 = add i32 %split.iter0, 77, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter1, !dbg !155

for.body6.iter1:                                  ; preds = %for.cond4.preheader.iter1, %m_vec_mul_add.exit.iter1
  %k.02.iter1 = phi i32 [ 0, %for.cond4.preheader.iter1 ], [ %add13.iter1, %m_vec_mul_add.exit.iter1 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter1 = mul nsw i32 %bs_mat_entries_used.14.iter1, 40, !dbg !161
  %add.ptr.iter1 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter1, !dbg !161
  %mul8.iter1 = mul nuw nsw i32 %k.02.iter1, 78, !dbg !164
  %8 = getelementptr i8, ptr %mat, i32 %mul8.iter1, !dbg !165
  %arrayidx.iter1 = getelementptr i8, ptr %8, i32 %c.05.iter1, !dbg !165
  %9 = load i8, ptr %arrayidx.iter1, align 1, !dbg !165
  %add10.iter1 = add nuw nsw i32 10, %k.02.iter1, !dbg !166
  %add.ptr12.idx.iter1 = mul nuw nsw i32 %add10.iter1, 40, !dbg !167
  %add.ptr12.iter1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter1, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter1 = zext i8 %9 to i32, !dbg !185
  %mul.i.i.iter1 = mul i32 %conv.i.i.iter1, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter1 = and i32 %mul.i.i.iter1, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 4, !dbg !191
  %shr1.i.i.iter1 = lshr exact i32 %and.i.i.iter1, 3, !dbg !192
  %10 = xor i32 %shr.i.i.iter1, %shr1.i.i.iter1, !dbg !193
  %xor2.i.i.iter1 = xor i32 %10, %mul.i.i.iter1, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter1, !dbg !199

for.body.i.iter1:                                 ; preds = %for.body.i.iter1, %for.body6.iter1
  %i.0.i1.iter1 = phi i32 [ 0, %for.body6.iter1 ], [ %inc.i.iter1, %for.body.i.iter1 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !200
  %11 = load i64, ptr %arrayidx.i.iter1, align 8, !dbg !200
  %and.i.iter1 = and i64 %11, 1229782938247303441, !dbg !203
  %and1.i.iter1 = and i32 %xor2.i.i.iter1, 255, !dbg !204
  %conv.i.iter1 = zext nneg i32 %and1.i.iter1 to i64, !dbg !205
  %mul.i.iter1 = mul i64 %and.i.iter1, %conv.i.iter1, !dbg !206
  %shr.i.iter1 = lshr i64 %11, 1, !dbg !207
  %and3.i.iter1 = and i64 %shr.i.iter1, 1229782938247303441, !dbg !208
  %shr4.i.iter1 = lshr i32 %xor2.i.i.iter1, 8, !dbg !209
  %and5.i.iter1 = and i32 %shr4.i.iter1, 15, !dbg !210
  %conv6.i.iter1 = zext nneg i32 %and5.i.iter1 to i64, !dbg !211
  %mul7.i.iter1 = mul nuw i64 %and3.i.iter1, %conv6.i.iter1, !dbg !212
  %xor.i.iter1 = xor i64 %mul.i.iter1, %mul7.i.iter1, !dbg !213
  %arrayidx8.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !214
  %12 = load i64, ptr %arrayidx8.i.iter1, align 8, !dbg !214
  %shr9.i.iter1 = lshr i64 %12, 2, !dbg !215
  %and10.i.iter1 = and i64 %shr9.i.iter1, 1229782938247303441, !dbg !216
  %shr11.i.iter1 = lshr i32 %xor2.i.i.iter1, 16, !dbg !217
  %and12.i.iter1 = and i32 %shr11.i.iter1, 15, !dbg !218
  %conv13.i.iter1 = zext nneg i32 %and12.i.iter1 to i64, !dbg !219
  %mul14.i.iter1 = mul nuw i64 %and10.i.iter1, %conv13.i.iter1, !dbg !220
  %xor15.i.iter1 = xor i64 %xor.i.iter1, %mul14.i.iter1, !dbg !221
  %arrayidx16.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr.iter1, i32 %i.0.i1.iter1, !dbg !222
  %13 = load i64, ptr %arrayidx16.i.iter1, align 8, !dbg !222
  %shr17.i.iter1 = lshr i64 %13, 3, !dbg !223
  %and18.i.iter1 = and i64 %shr17.i.iter1, 1229782938247303441, !dbg !224
  %shr19.i.iter1 = lshr i32 %xor2.i.i.iter1, 24, !dbg !225
  %and20.i.iter1 = and i32 %shr19.i.iter1, 15, !dbg !226
  %conv21.i.iter1 = zext nneg i32 %and20.i.iter1 to i64, !dbg !227
  %mul22.i.iter1 = mul nuw i64 %and18.i.iter1, %conv21.i.iter1, !dbg !228
  %xor23.i.iter1 = xor i64 %xor15.i.iter1, %mul22.i.iter1, !dbg !229
  %arrayidx24.i.iter1 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter1, i32 %i.0.i1.iter1, !dbg !230
  %14 = load i64, ptr %arrayidx24.i.iter1, align 8, !dbg !231
  %xor25.i.iter1 = xor i64 %14, %xor23.i.iter1, !dbg !231
  store i64 %xor25.i.iter1, ptr %arrayidx24.i.iter1, align 8, !dbg !231
  %inc.i.iter1 = add nuw nsw i32 %i.0.i1.iter1, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter1 = icmp eq i32 %inc.i.iter1, 5, !dbg !233
  br i1 %exitcond.i.not.iter1, label %m_vec_mul_add.exit.iter1, label %for.body.i.iter1, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter1:                         ; preds = %for.body.i.iter1
  %add13.iter1 = add nuw nsw i32 %k.02.iter1, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter1 = icmp eq i32 %add13.iter1, 10, !dbg !238
  br i1 %exitcond.not.iter1, label %for.inc15.iter1, label %for.body6.iter1, !dbg !239, !llvm.loop !240

for.inc15.iter1:                                  ; preds = %m_vec_mul_add.exit.iter1
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter1 = add i32 %bs_mat_entries_used.14.iter1, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter1 = add nuw nsw i32 %c.05.iter1, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter1 = icmp eq i32 %add14.iter1, %7, !dbg !244
  br i1 %exitcond1.not.iter1, label %for.cond1.for.inc17_crit_edge.iter1, label %for.cond4.preheader.iter1, !dbg !155, !llvm.loop !245

for.inc17.iter1:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter1
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_1_end

for.cond4.preheader.iter1:                        ; preds = %for.cond4.preheader.lr.ph.iter1, %for.inc15.iter1
  %c.05.iter1 = phi i32 [ 1, %for.cond4.preheader.lr.ph.iter1 ], [ %inc.iter1, %for.inc15.iter1 ]
  %bs_mat_entries_used.14.iter1 = phi i32 [ %split.iter0, %for.cond4.preheader.lr.ph.iter1 ], [ %add14.iter1, %for.inc15.iter1 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter1, !dbg !239

for.cond4.preheader.lr.ph.iter1:                  ; preds = %for.cond1.preheader.iter1
  br label %for.cond4.preheader.iter1, !dbg !155

for.cond1.for.inc17_crit_edge.iter1:              ; preds = %for.inc15.iter1
  %split.iter1 = phi i32 [ %add14.iter1, %for.inc15.iter1 ]
  br label %for.inc17.iter1, !dbg !155

iter_1_end:                                       ; preds = %for.inc17.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.cond1.preheader.iter2

for.cond1.preheader.iter2:                        ; preds = %iter_2_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %15 = add i32 %split.iter1, 76, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter2, !dbg !155

for.body6.iter2:                                  ; preds = %for.cond4.preheader.iter2, %m_vec_mul_add.exit.iter2
  %k.02.iter2 = phi i32 [ 0, %for.cond4.preheader.iter2 ], [ %add13.iter2, %m_vec_mul_add.exit.iter2 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter2 = mul nsw i32 %bs_mat_entries_used.14.iter2, 40, !dbg !161
  %add.ptr.iter2 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter2, !dbg !161
  %mul8.iter2 = mul nuw nsw i32 %k.02.iter2, 78, !dbg !164
  %16 = getelementptr i8, ptr %mat, i32 %mul8.iter2, !dbg !165
  %arrayidx.iter2 = getelementptr i8, ptr %16, i32 %c.05.iter2, !dbg !165
  %17 = load i8, ptr %arrayidx.iter2, align 1, !dbg !165
  %add10.iter2 = add nuw nsw i32 20, %k.02.iter2, !dbg !166
  %add.ptr12.idx.iter2 = mul nuw nsw i32 %add10.iter2, 40, !dbg !167
  %add.ptr12.iter2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter2, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter2 = zext i8 %17 to i32, !dbg !185
  %mul.i.i.iter2 = mul i32 %conv.i.i.iter2, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter2 = and i32 %mul.i.i.iter2, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 4, !dbg !191
  %shr1.i.i.iter2 = lshr exact i32 %and.i.i.iter2, 3, !dbg !192
  %18 = xor i32 %shr.i.i.iter2, %shr1.i.i.iter2, !dbg !193
  %xor2.i.i.iter2 = xor i32 %18, %mul.i.i.iter2, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter2, !dbg !199

for.body.i.iter2:                                 ; preds = %for.body.i.iter2, %for.body6.iter2
  %i.0.i1.iter2 = phi i32 [ 0, %for.body6.iter2 ], [ %inc.i.iter2, %for.body.i.iter2 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !200
  %19 = load i64, ptr %arrayidx.i.iter2, align 8, !dbg !200
  %and.i.iter2 = and i64 %19, 1229782938247303441, !dbg !203
  %and1.i.iter2 = and i32 %xor2.i.i.iter2, 255, !dbg !204
  %conv.i.iter2 = zext nneg i32 %and1.i.iter2 to i64, !dbg !205
  %mul.i.iter2 = mul i64 %and.i.iter2, %conv.i.iter2, !dbg !206
  %shr.i.iter2 = lshr i64 %19, 1, !dbg !207
  %and3.i.iter2 = and i64 %shr.i.iter2, 1229782938247303441, !dbg !208
  %shr4.i.iter2 = lshr i32 %xor2.i.i.iter2, 8, !dbg !209
  %and5.i.iter2 = and i32 %shr4.i.iter2, 15, !dbg !210
  %conv6.i.iter2 = zext nneg i32 %and5.i.iter2 to i64, !dbg !211
  %mul7.i.iter2 = mul nuw i64 %and3.i.iter2, %conv6.i.iter2, !dbg !212
  %xor.i.iter2 = xor i64 %mul.i.iter2, %mul7.i.iter2, !dbg !213
  %arrayidx8.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !214
  %20 = load i64, ptr %arrayidx8.i.iter2, align 8, !dbg !214
  %shr9.i.iter2 = lshr i64 %20, 2, !dbg !215
  %and10.i.iter2 = and i64 %shr9.i.iter2, 1229782938247303441, !dbg !216
  %shr11.i.iter2 = lshr i32 %xor2.i.i.iter2, 16, !dbg !217
  %and12.i.iter2 = and i32 %shr11.i.iter2, 15, !dbg !218
  %conv13.i.iter2 = zext nneg i32 %and12.i.iter2 to i64, !dbg !219
  %mul14.i.iter2 = mul nuw i64 %and10.i.iter2, %conv13.i.iter2, !dbg !220
  %xor15.i.iter2 = xor i64 %xor.i.iter2, %mul14.i.iter2, !dbg !221
  %arrayidx16.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr.iter2, i32 %i.0.i1.iter2, !dbg !222
  %21 = load i64, ptr %arrayidx16.i.iter2, align 8, !dbg !222
  %shr17.i.iter2 = lshr i64 %21, 3, !dbg !223
  %and18.i.iter2 = and i64 %shr17.i.iter2, 1229782938247303441, !dbg !224
  %shr19.i.iter2 = lshr i32 %xor2.i.i.iter2, 24, !dbg !225
  %and20.i.iter2 = and i32 %shr19.i.iter2, 15, !dbg !226
  %conv21.i.iter2 = zext nneg i32 %and20.i.iter2 to i64, !dbg !227
  %mul22.i.iter2 = mul nuw i64 %and18.i.iter2, %conv21.i.iter2, !dbg !228
  %xor23.i.iter2 = xor i64 %xor15.i.iter2, %mul22.i.iter2, !dbg !229
  %arrayidx24.i.iter2 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter2, i32 %i.0.i1.iter2, !dbg !230
  %22 = load i64, ptr %arrayidx24.i.iter2, align 8, !dbg !231
  %xor25.i.iter2 = xor i64 %22, %xor23.i.iter2, !dbg !231
  store i64 %xor25.i.iter2, ptr %arrayidx24.i.iter2, align 8, !dbg !231
  %inc.i.iter2 = add nuw nsw i32 %i.0.i1.iter2, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter2 = icmp eq i32 %inc.i.iter2, 5, !dbg !233
  br i1 %exitcond.i.not.iter2, label %m_vec_mul_add.exit.iter2, label %for.body.i.iter2, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter2:                         ; preds = %for.body.i.iter2
  %add13.iter2 = add nuw nsw i32 %k.02.iter2, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter2 = icmp eq i32 %add13.iter2, 10, !dbg !238
  br i1 %exitcond.not.iter2, label %for.inc15.iter2, label %for.body6.iter2, !dbg !239, !llvm.loop !240

for.inc15.iter2:                                  ; preds = %m_vec_mul_add.exit.iter2
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter2 = add i32 %bs_mat_entries_used.14.iter2, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter2 = add nuw nsw i32 %c.05.iter2, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter2 = icmp eq i32 %add14.iter2, %15, !dbg !244
  br i1 %exitcond1.not.iter2, label %for.cond1.for.inc17_crit_edge.iter2, label %for.cond4.preheader.iter2, !dbg !155, !llvm.loop !245

for.inc17.iter2:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter2
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_2_end

for.cond4.preheader.iter2:                        ; preds = %for.cond4.preheader.lr.ph.iter2, %for.inc15.iter2
  %c.05.iter2 = phi i32 [ 2, %for.cond4.preheader.lr.ph.iter2 ], [ %inc.iter2, %for.inc15.iter2 ]
  %bs_mat_entries_used.14.iter2 = phi i32 [ %split.iter1, %for.cond4.preheader.lr.ph.iter2 ], [ %add14.iter2, %for.inc15.iter2 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter2, !dbg !239

for.cond4.preheader.lr.ph.iter2:                  ; preds = %for.cond1.preheader.iter2
  br label %for.cond4.preheader.iter2, !dbg !155

for.cond1.for.inc17_crit_edge.iter2:              ; preds = %for.inc15.iter2
  %split.iter2 = phi i32 [ %add14.iter2, %for.inc15.iter2 ]
  br label %for.inc17.iter2, !dbg !155

iter_2_end:                                       ; preds = %for.inc17.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.cond1.preheader.iter3

for.cond1.preheader.iter3:                        ; preds = %iter_3_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %23 = add i32 %split.iter2, 75, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter3, !dbg !155

for.body6.iter3:                                  ; preds = %for.cond4.preheader.iter3, %m_vec_mul_add.exit.iter3
  %k.02.iter3 = phi i32 [ 0, %for.cond4.preheader.iter3 ], [ %add13.iter3, %m_vec_mul_add.exit.iter3 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter3 = mul nsw i32 %bs_mat_entries_used.14.iter3, 40, !dbg !161
  %add.ptr.iter3 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter3, !dbg !161
  %mul8.iter3 = mul nuw nsw i32 %k.02.iter3, 78, !dbg !164
  %24 = getelementptr i8, ptr %mat, i32 %mul8.iter3, !dbg !165
  %arrayidx.iter3 = getelementptr i8, ptr %24, i32 %c.05.iter3, !dbg !165
  %25 = load i8, ptr %arrayidx.iter3, align 1, !dbg !165
  %add10.iter3 = add nuw nsw i32 30, %k.02.iter3, !dbg !166
  %add.ptr12.idx.iter3 = mul nuw nsw i32 %add10.iter3, 40, !dbg !167
  %add.ptr12.iter3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter3, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter3 = zext i8 %25 to i32, !dbg !185
  %mul.i.i.iter3 = mul i32 %conv.i.i.iter3, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter3 = and i32 %mul.i.i.iter3, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 4, !dbg !191
  %shr1.i.i.iter3 = lshr exact i32 %and.i.i.iter3, 3, !dbg !192
  %26 = xor i32 %shr.i.i.iter3, %shr1.i.i.iter3, !dbg !193
  %xor2.i.i.iter3 = xor i32 %26, %mul.i.i.iter3, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter3, !dbg !199

for.body.i.iter3:                                 ; preds = %for.body.i.iter3, %for.body6.iter3
  %i.0.i1.iter3 = phi i32 [ 0, %for.body6.iter3 ], [ %inc.i.iter3, %for.body.i.iter3 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !200
  %27 = load i64, ptr %arrayidx.i.iter3, align 8, !dbg !200
  %and.i.iter3 = and i64 %27, 1229782938247303441, !dbg !203
  %and1.i.iter3 = and i32 %xor2.i.i.iter3, 255, !dbg !204
  %conv.i.iter3 = zext nneg i32 %and1.i.iter3 to i64, !dbg !205
  %mul.i.iter3 = mul i64 %and.i.iter3, %conv.i.iter3, !dbg !206
  %shr.i.iter3 = lshr i64 %27, 1, !dbg !207
  %and3.i.iter3 = and i64 %shr.i.iter3, 1229782938247303441, !dbg !208
  %shr4.i.iter3 = lshr i32 %xor2.i.i.iter3, 8, !dbg !209
  %and5.i.iter3 = and i32 %shr4.i.iter3, 15, !dbg !210
  %conv6.i.iter3 = zext nneg i32 %and5.i.iter3 to i64, !dbg !211
  %mul7.i.iter3 = mul nuw i64 %and3.i.iter3, %conv6.i.iter3, !dbg !212
  %xor.i.iter3 = xor i64 %mul.i.iter3, %mul7.i.iter3, !dbg !213
  %arrayidx8.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !214
  %28 = load i64, ptr %arrayidx8.i.iter3, align 8, !dbg !214
  %shr9.i.iter3 = lshr i64 %28, 2, !dbg !215
  %and10.i.iter3 = and i64 %shr9.i.iter3, 1229782938247303441, !dbg !216
  %shr11.i.iter3 = lshr i32 %xor2.i.i.iter3, 16, !dbg !217
  %and12.i.iter3 = and i32 %shr11.i.iter3, 15, !dbg !218
  %conv13.i.iter3 = zext nneg i32 %and12.i.iter3 to i64, !dbg !219
  %mul14.i.iter3 = mul nuw i64 %and10.i.iter3, %conv13.i.iter3, !dbg !220
  %xor15.i.iter3 = xor i64 %xor.i.iter3, %mul14.i.iter3, !dbg !221
  %arrayidx16.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr.iter3, i32 %i.0.i1.iter3, !dbg !222
  %29 = load i64, ptr %arrayidx16.i.iter3, align 8, !dbg !222
  %shr17.i.iter3 = lshr i64 %29, 3, !dbg !223
  %and18.i.iter3 = and i64 %shr17.i.iter3, 1229782938247303441, !dbg !224
  %shr19.i.iter3 = lshr i32 %xor2.i.i.iter3, 24, !dbg !225
  %and20.i.iter3 = and i32 %shr19.i.iter3, 15, !dbg !226
  %conv21.i.iter3 = zext nneg i32 %and20.i.iter3 to i64, !dbg !227
  %mul22.i.iter3 = mul nuw i64 %and18.i.iter3, %conv21.i.iter3, !dbg !228
  %xor23.i.iter3 = xor i64 %xor15.i.iter3, %mul22.i.iter3, !dbg !229
  %arrayidx24.i.iter3 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter3, i32 %i.0.i1.iter3, !dbg !230
  %30 = load i64, ptr %arrayidx24.i.iter3, align 8, !dbg !231
  %xor25.i.iter3 = xor i64 %30, %xor23.i.iter3, !dbg !231
  store i64 %xor25.i.iter3, ptr %arrayidx24.i.iter3, align 8, !dbg !231
  %inc.i.iter3 = add nuw nsw i32 %i.0.i1.iter3, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter3 = icmp eq i32 %inc.i.iter3, 5, !dbg !233
  br i1 %exitcond.i.not.iter3, label %m_vec_mul_add.exit.iter3, label %for.body.i.iter3, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter3:                         ; preds = %for.body.i.iter3
  %add13.iter3 = add nuw nsw i32 %k.02.iter3, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter3 = icmp eq i32 %add13.iter3, 10, !dbg !238
  br i1 %exitcond.not.iter3, label %for.inc15.iter3, label %for.body6.iter3, !dbg !239, !llvm.loop !240

for.inc15.iter3:                                  ; preds = %m_vec_mul_add.exit.iter3
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter3 = add i32 %bs_mat_entries_used.14.iter3, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter3 = add nuw nsw i32 %c.05.iter3, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter3 = icmp eq i32 %add14.iter3, %23, !dbg !244
  br i1 %exitcond1.not.iter3, label %for.cond1.for.inc17_crit_edge.iter3, label %for.cond4.preheader.iter3, !dbg !155, !llvm.loop !245

for.inc17.iter3:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter3
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_3_end

for.cond4.preheader.iter3:                        ; preds = %for.cond4.preheader.lr.ph.iter3, %for.inc15.iter3
  %c.05.iter3 = phi i32 [ 3, %for.cond4.preheader.lr.ph.iter3 ], [ %inc.iter3, %for.inc15.iter3 ]
  %bs_mat_entries_used.14.iter3 = phi i32 [ %split.iter2, %for.cond4.preheader.lr.ph.iter3 ], [ %add14.iter3, %for.inc15.iter3 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter3, !dbg !239

for.cond4.preheader.lr.ph.iter3:                  ; preds = %for.cond1.preheader.iter3
  br label %for.cond4.preheader.iter3, !dbg !155

for.cond1.for.inc17_crit_edge.iter3:              ; preds = %for.inc15.iter3
  %split.iter3 = phi i32 [ %add14.iter3, %for.inc15.iter3 ]
  br label %for.inc17.iter3, !dbg !155

iter_3_end:                                       ; preds = %for.inc17.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.cond1.preheader.iter4

for.cond1.preheader.iter4:                        ; preds = %iter_4_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %31 = add i32 %split.iter3, 74, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter4, !dbg !155

for.body6.iter4:                                  ; preds = %for.cond4.preheader.iter4, %m_vec_mul_add.exit.iter4
  %k.02.iter4 = phi i32 [ 0, %for.cond4.preheader.iter4 ], [ %add13.iter4, %m_vec_mul_add.exit.iter4 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter4 = mul nsw i32 %bs_mat_entries_used.14.iter4, 40, !dbg !161
  %add.ptr.iter4 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter4, !dbg !161
  %mul8.iter4 = mul nuw nsw i32 %k.02.iter4, 78, !dbg !164
  %32 = getelementptr i8, ptr %mat, i32 %mul8.iter4, !dbg !165
  %arrayidx.iter4 = getelementptr i8, ptr %32, i32 %c.05.iter4, !dbg !165
  %33 = load i8, ptr %arrayidx.iter4, align 1, !dbg !165
  %add10.iter4 = add nuw nsw i32 40, %k.02.iter4, !dbg !166
  %add.ptr12.idx.iter4 = mul nuw nsw i32 %add10.iter4, 40, !dbg !167
  %add.ptr12.iter4 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter4, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter4 = zext i8 %33 to i32, !dbg !185
  %mul.i.i.iter4 = mul i32 %conv.i.i.iter4, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter4 = and i32 %mul.i.i.iter4, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 4, !dbg !191
  %shr1.i.i.iter4 = lshr exact i32 %and.i.i.iter4, 3, !dbg !192
  %34 = xor i32 %shr.i.i.iter4, %shr1.i.i.iter4, !dbg !193
  %xor2.i.i.iter4 = xor i32 %34, %mul.i.i.iter4, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter4, !dbg !199

for.body.i.iter4:                                 ; preds = %for.body.i.iter4, %for.body6.iter4
  %i.0.i1.iter4 = phi i32 [ 0, %for.body6.iter4 ], [ %inc.i.iter4, %for.body.i.iter4 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !200
  %35 = load i64, ptr %arrayidx.i.iter4, align 8, !dbg !200
  %and.i.iter4 = and i64 %35, 1229782938247303441, !dbg !203
  %and1.i.iter4 = and i32 %xor2.i.i.iter4, 255, !dbg !204
  %conv.i.iter4 = zext nneg i32 %and1.i.iter4 to i64, !dbg !205
  %mul.i.iter4 = mul i64 %and.i.iter4, %conv.i.iter4, !dbg !206
  %shr.i.iter4 = lshr i64 %35, 1, !dbg !207
  %and3.i.iter4 = and i64 %shr.i.iter4, 1229782938247303441, !dbg !208
  %shr4.i.iter4 = lshr i32 %xor2.i.i.iter4, 8, !dbg !209
  %and5.i.iter4 = and i32 %shr4.i.iter4, 15, !dbg !210
  %conv6.i.iter4 = zext nneg i32 %and5.i.iter4 to i64, !dbg !211
  %mul7.i.iter4 = mul nuw i64 %and3.i.iter4, %conv6.i.iter4, !dbg !212
  %xor.i.iter4 = xor i64 %mul.i.iter4, %mul7.i.iter4, !dbg !213
  %arrayidx8.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !214
  %36 = load i64, ptr %arrayidx8.i.iter4, align 8, !dbg !214
  %shr9.i.iter4 = lshr i64 %36, 2, !dbg !215
  %and10.i.iter4 = and i64 %shr9.i.iter4, 1229782938247303441, !dbg !216
  %shr11.i.iter4 = lshr i32 %xor2.i.i.iter4, 16, !dbg !217
  %and12.i.iter4 = and i32 %shr11.i.iter4, 15, !dbg !218
  %conv13.i.iter4 = zext nneg i32 %and12.i.iter4 to i64, !dbg !219
  %mul14.i.iter4 = mul nuw i64 %and10.i.iter4, %conv13.i.iter4, !dbg !220
  %xor15.i.iter4 = xor i64 %xor.i.iter4, %mul14.i.iter4, !dbg !221
  %arrayidx16.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr.iter4, i32 %i.0.i1.iter4, !dbg !222
  %37 = load i64, ptr %arrayidx16.i.iter4, align 8, !dbg !222
  %shr17.i.iter4 = lshr i64 %37, 3, !dbg !223
  %and18.i.iter4 = and i64 %shr17.i.iter4, 1229782938247303441, !dbg !224
  %shr19.i.iter4 = lshr i32 %xor2.i.i.iter4, 24, !dbg !225
  %and20.i.iter4 = and i32 %shr19.i.iter4, 15, !dbg !226
  %conv21.i.iter4 = zext nneg i32 %and20.i.iter4 to i64, !dbg !227
  %mul22.i.iter4 = mul nuw i64 %and18.i.iter4, %conv21.i.iter4, !dbg !228
  %xor23.i.iter4 = xor i64 %xor15.i.iter4, %mul22.i.iter4, !dbg !229
  %arrayidx24.i.iter4 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter4, i32 %i.0.i1.iter4, !dbg !230
  %38 = load i64, ptr %arrayidx24.i.iter4, align 8, !dbg !231
  %xor25.i.iter4 = xor i64 %38, %xor23.i.iter4, !dbg !231
  store i64 %xor25.i.iter4, ptr %arrayidx24.i.iter4, align 8, !dbg !231
  %inc.i.iter4 = add nuw nsw i32 %i.0.i1.iter4, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter4 = icmp eq i32 %inc.i.iter4, 5, !dbg !233
  br i1 %exitcond.i.not.iter4, label %m_vec_mul_add.exit.iter4, label %for.body.i.iter4, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter4:                         ; preds = %for.body.i.iter4
  %add13.iter4 = add nuw nsw i32 %k.02.iter4, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter4 = icmp eq i32 %add13.iter4, 10, !dbg !238
  br i1 %exitcond.not.iter4, label %for.inc15.iter4, label %for.body6.iter4, !dbg !239, !llvm.loop !240

for.inc15.iter4:                                  ; preds = %m_vec_mul_add.exit.iter4
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter4 = add i32 %bs_mat_entries_used.14.iter4, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter4 = add nuw nsw i32 %c.05.iter4, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter4 = icmp eq i32 %add14.iter4, %31, !dbg !244
  br i1 %exitcond1.not.iter4, label %for.cond1.for.inc17_crit_edge.iter4, label %for.cond4.preheader.iter4, !dbg !155, !llvm.loop !245

for.inc17.iter4:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter4
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_4_end

for.cond4.preheader.iter4:                        ; preds = %for.cond4.preheader.lr.ph.iter4, %for.inc15.iter4
  %c.05.iter4 = phi i32 [ 4, %for.cond4.preheader.lr.ph.iter4 ], [ %inc.iter4, %for.inc15.iter4 ]
  %bs_mat_entries_used.14.iter4 = phi i32 [ %split.iter3, %for.cond4.preheader.lr.ph.iter4 ], [ %add14.iter4, %for.inc15.iter4 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter4, !dbg !239

for.cond4.preheader.lr.ph.iter4:                  ; preds = %for.cond1.preheader.iter4
  br label %for.cond4.preheader.iter4, !dbg !155

for.cond1.for.inc17_crit_edge.iter4:              ; preds = %for.inc15.iter4
  %split.iter4 = phi i32 [ %add14.iter4, %for.inc15.iter4 ]
  br label %for.inc17.iter4, !dbg !155

iter_4_end:                                       ; preds = %for.inc17.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.cond1.preheader.iter5

for.cond1.preheader.iter5:                        ; preds = %iter_5_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %39 = add i32 %split.iter4, 73, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter5, !dbg !155

for.body6.iter5:                                  ; preds = %for.cond4.preheader.iter5, %m_vec_mul_add.exit.iter5
  %k.02.iter5 = phi i32 [ 0, %for.cond4.preheader.iter5 ], [ %add13.iter5, %m_vec_mul_add.exit.iter5 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter5 = mul nsw i32 %bs_mat_entries_used.14.iter5, 40, !dbg !161
  %add.ptr.iter5 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter5, !dbg !161
  %mul8.iter5 = mul nuw nsw i32 %k.02.iter5, 78, !dbg !164
  %40 = getelementptr i8, ptr %mat, i32 %mul8.iter5, !dbg !165
  %arrayidx.iter5 = getelementptr i8, ptr %40, i32 %c.05.iter5, !dbg !165
  %41 = load i8, ptr %arrayidx.iter5, align 1, !dbg !165
  %add10.iter5 = add nuw nsw i32 50, %k.02.iter5, !dbg !166
  %add.ptr12.idx.iter5 = mul nuw nsw i32 %add10.iter5, 40, !dbg !167
  %add.ptr12.iter5 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter5, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter5 = zext i8 %41 to i32, !dbg !185
  %mul.i.i.iter5 = mul i32 %conv.i.i.iter5, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter5 = and i32 %mul.i.i.iter5, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 4, !dbg !191
  %shr1.i.i.iter5 = lshr exact i32 %and.i.i.iter5, 3, !dbg !192
  %42 = xor i32 %shr.i.i.iter5, %shr1.i.i.iter5, !dbg !193
  %xor2.i.i.iter5 = xor i32 %42, %mul.i.i.iter5, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter5, !dbg !199

for.body.i.iter5:                                 ; preds = %for.body.i.iter5, %for.body6.iter5
  %i.0.i1.iter5 = phi i32 [ 0, %for.body6.iter5 ], [ %inc.i.iter5, %for.body.i.iter5 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !200
  %43 = load i64, ptr %arrayidx.i.iter5, align 8, !dbg !200
  %and.i.iter5 = and i64 %43, 1229782938247303441, !dbg !203
  %and1.i.iter5 = and i32 %xor2.i.i.iter5, 255, !dbg !204
  %conv.i.iter5 = zext nneg i32 %and1.i.iter5 to i64, !dbg !205
  %mul.i.iter5 = mul i64 %and.i.iter5, %conv.i.iter5, !dbg !206
  %shr.i.iter5 = lshr i64 %43, 1, !dbg !207
  %and3.i.iter5 = and i64 %shr.i.iter5, 1229782938247303441, !dbg !208
  %shr4.i.iter5 = lshr i32 %xor2.i.i.iter5, 8, !dbg !209
  %and5.i.iter5 = and i32 %shr4.i.iter5, 15, !dbg !210
  %conv6.i.iter5 = zext nneg i32 %and5.i.iter5 to i64, !dbg !211
  %mul7.i.iter5 = mul nuw i64 %and3.i.iter5, %conv6.i.iter5, !dbg !212
  %xor.i.iter5 = xor i64 %mul.i.iter5, %mul7.i.iter5, !dbg !213
  %arrayidx8.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !214
  %44 = load i64, ptr %arrayidx8.i.iter5, align 8, !dbg !214
  %shr9.i.iter5 = lshr i64 %44, 2, !dbg !215
  %and10.i.iter5 = and i64 %shr9.i.iter5, 1229782938247303441, !dbg !216
  %shr11.i.iter5 = lshr i32 %xor2.i.i.iter5, 16, !dbg !217
  %and12.i.iter5 = and i32 %shr11.i.iter5, 15, !dbg !218
  %conv13.i.iter5 = zext nneg i32 %and12.i.iter5 to i64, !dbg !219
  %mul14.i.iter5 = mul nuw i64 %and10.i.iter5, %conv13.i.iter5, !dbg !220
  %xor15.i.iter5 = xor i64 %xor.i.iter5, %mul14.i.iter5, !dbg !221
  %arrayidx16.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr.iter5, i32 %i.0.i1.iter5, !dbg !222
  %45 = load i64, ptr %arrayidx16.i.iter5, align 8, !dbg !222
  %shr17.i.iter5 = lshr i64 %45, 3, !dbg !223
  %and18.i.iter5 = and i64 %shr17.i.iter5, 1229782938247303441, !dbg !224
  %shr19.i.iter5 = lshr i32 %xor2.i.i.iter5, 24, !dbg !225
  %and20.i.iter5 = and i32 %shr19.i.iter5, 15, !dbg !226
  %conv21.i.iter5 = zext nneg i32 %and20.i.iter5 to i64, !dbg !227
  %mul22.i.iter5 = mul nuw i64 %and18.i.iter5, %conv21.i.iter5, !dbg !228
  %xor23.i.iter5 = xor i64 %xor15.i.iter5, %mul22.i.iter5, !dbg !229
  %arrayidx24.i.iter5 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter5, i32 %i.0.i1.iter5, !dbg !230
  %46 = load i64, ptr %arrayidx24.i.iter5, align 8, !dbg !231
  %xor25.i.iter5 = xor i64 %46, %xor23.i.iter5, !dbg !231
  store i64 %xor25.i.iter5, ptr %arrayidx24.i.iter5, align 8, !dbg !231
  %inc.i.iter5 = add nuw nsw i32 %i.0.i1.iter5, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter5 = icmp eq i32 %inc.i.iter5, 5, !dbg !233
  br i1 %exitcond.i.not.iter5, label %m_vec_mul_add.exit.iter5, label %for.body.i.iter5, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter5:                         ; preds = %for.body.i.iter5
  %add13.iter5 = add nuw nsw i32 %k.02.iter5, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter5 = icmp eq i32 %add13.iter5, 10, !dbg !238
  br i1 %exitcond.not.iter5, label %for.inc15.iter5, label %for.body6.iter5, !dbg !239, !llvm.loop !240

for.inc15.iter5:                                  ; preds = %m_vec_mul_add.exit.iter5
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter5 = add i32 %bs_mat_entries_used.14.iter5, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter5 = add nuw nsw i32 %c.05.iter5, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter5 = icmp eq i32 %add14.iter5, %39, !dbg !244
  br i1 %exitcond1.not.iter5, label %for.cond1.for.inc17_crit_edge.iter5, label %for.cond4.preheader.iter5, !dbg !155, !llvm.loop !245

for.inc17.iter5:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter5
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_5_end

for.cond4.preheader.iter5:                        ; preds = %for.cond4.preheader.lr.ph.iter5, %for.inc15.iter5
  %c.05.iter5 = phi i32 [ 5, %for.cond4.preheader.lr.ph.iter5 ], [ %inc.iter5, %for.inc15.iter5 ]
  %bs_mat_entries_used.14.iter5 = phi i32 [ %split.iter4, %for.cond4.preheader.lr.ph.iter5 ], [ %add14.iter5, %for.inc15.iter5 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter5, !dbg !239

for.cond4.preheader.lr.ph.iter5:                  ; preds = %for.cond1.preheader.iter5
  br label %for.cond4.preheader.iter5, !dbg !155

for.cond1.for.inc17_crit_edge.iter5:              ; preds = %for.inc15.iter5
  %split.iter5 = phi i32 [ %add14.iter5, %for.inc15.iter5 ]
  br label %for.inc17.iter5, !dbg !155

iter_5_end:                                       ; preds = %for.inc17.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.cond1.preheader.iter6

for.cond1.preheader.iter6:                        ; preds = %iter_6_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %47 = add i32 %split.iter5, 72, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter6, !dbg !155

for.body6.iter6:                                  ; preds = %for.cond4.preheader.iter6, %m_vec_mul_add.exit.iter6
  %k.02.iter6 = phi i32 [ 0, %for.cond4.preheader.iter6 ], [ %add13.iter6, %m_vec_mul_add.exit.iter6 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter6 = mul nsw i32 %bs_mat_entries_used.14.iter6, 40, !dbg !161
  %add.ptr.iter6 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter6, !dbg !161
  %mul8.iter6 = mul nuw nsw i32 %k.02.iter6, 78, !dbg !164
  %48 = getelementptr i8, ptr %mat, i32 %mul8.iter6, !dbg !165
  %arrayidx.iter6 = getelementptr i8, ptr %48, i32 %c.05.iter6, !dbg !165
  %49 = load i8, ptr %arrayidx.iter6, align 1, !dbg !165
  %add10.iter6 = add nuw nsw i32 60, %k.02.iter6, !dbg !166
  %add.ptr12.idx.iter6 = mul nuw nsw i32 %add10.iter6, 40, !dbg !167
  %add.ptr12.iter6 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter6, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter6 = zext i8 %49 to i32, !dbg !185
  %mul.i.i.iter6 = mul i32 %conv.i.i.iter6, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter6 = and i32 %mul.i.i.iter6, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 4, !dbg !191
  %shr1.i.i.iter6 = lshr exact i32 %and.i.i.iter6, 3, !dbg !192
  %50 = xor i32 %shr.i.i.iter6, %shr1.i.i.iter6, !dbg !193
  %xor2.i.i.iter6 = xor i32 %50, %mul.i.i.iter6, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter6, !dbg !199

for.body.i.iter6:                                 ; preds = %for.body.i.iter6, %for.body6.iter6
  %i.0.i1.iter6 = phi i32 [ 0, %for.body6.iter6 ], [ %inc.i.iter6, %for.body.i.iter6 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !200
  %51 = load i64, ptr %arrayidx.i.iter6, align 8, !dbg !200
  %and.i.iter6 = and i64 %51, 1229782938247303441, !dbg !203
  %and1.i.iter6 = and i32 %xor2.i.i.iter6, 255, !dbg !204
  %conv.i.iter6 = zext nneg i32 %and1.i.iter6 to i64, !dbg !205
  %mul.i.iter6 = mul i64 %and.i.iter6, %conv.i.iter6, !dbg !206
  %shr.i.iter6 = lshr i64 %51, 1, !dbg !207
  %and3.i.iter6 = and i64 %shr.i.iter6, 1229782938247303441, !dbg !208
  %shr4.i.iter6 = lshr i32 %xor2.i.i.iter6, 8, !dbg !209
  %and5.i.iter6 = and i32 %shr4.i.iter6, 15, !dbg !210
  %conv6.i.iter6 = zext nneg i32 %and5.i.iter6 to i64, !dbg !211
  %mul7.i.iter6 = mul nuw i64 %and3.i.iter6, %conv6.i.iter6, !dbg !212
  %xor.i.iter6 = xor i64 %mul.i.iter6, %mul7.i.iter6, !dbg !213
  %arrayidx8.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !214
  %52 = load i64, ptr %arrayidx8.i.iter6, align 8, !dbg !214
  %shr9.i.iter6 = lshr i64 %52, 2, !dbg !215
  %and10.i.iter6 = and i64 %shr9.i.iter6, 1229782938247303441, !dbg !216
  %shr11.i.iter6 = lshr i32 %xor2.i.i.iter6, 16, !dbg !217
  %and12.i.iter6 = and i32 %shr11.i.iter6, 15, !dbg !218
  %conv13.i.iter6 = zext nneg i32 %and12.i.iter6 to i64, !dbg !219
  %mul14.i.iter6 = mul nuw i64 %and10.i.iter6, %conv13.i.iter6, !dbg !220
  %xor15.i.iter6 = xor i64 %xor.i.iter6, %mul14.i.iter6, !dbg !221
  %arrayidx16.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr.iter6, i32 %i.0.i1.iter6, !dbg !222
  %53 = load i64, ptr %arrayidx16.i.iter6, align 8, !dbg !222
  %shr17.i.iter6 = lshr i64 %53, 3, !dbg !223
  %and18.i.iter6 = and i64 %shr17.i.iter6, 1229782938247303441, !dbg !224
  %shr19.i.iter6 = lshr i32 %xor2.i.i.iter6, 24, !dbg !225
  %and20.i.iter6 = and i32 %shr19.i.iter6, 15, !dbg !226
  %conv21.i.iter6 = zext nneg i32 %and20.i.iter6 to i64, !dbg !227
  %mul22.i.iter6 = mul nuw i64 %and18.i.iter6, %conv21.i.iter6, !dbg !228
  %xor23.i.iter6 = xor i64 %xor15.i.iter6, %mul22.i.iter6, !dbg !229
  %arrayidx24.i.iter6 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter6, i32 %i.0.i1.iter6, !dbg !230
  %54 = load i64, ptr %arrayidx24.i.iter6, align 8, !dbg !231
  %xor25.i.iter6 = xor i64 %54, %xor23.i.iter6, !dbg !231
  store i64 %xor25.i.iter6, ptr %arrayidx24.i.iter6, align 8, !dbg !231
  %inc.i.iter6 = add nuw nsw i32 %i.0.i1.iter6, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter6 = icmp eq i32 %inc.i.iter6, 5, !dbg !233
  br i1 %exitcond.i.not.iter6, label %m_vec_mul_add.exit.iter6, label %for.body.i.iter6, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter6:                         ; preds = %for.body.i.iter6
  %add13.iter6 = add nuw nsw i32 %k.02.iter6, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter6 = icmp eq i32 %add13.iter6, 10, !dbg !238
  br i1 %exitcond.not.iter6, label %for.inc15.iter6, label %for.body6.iter6, !dbg !239, !llvm.loop !240

for.inc15.iter6:                                  ; preds = %m_vec_mul_add.exit.iter6
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter6 = add i32 %bs_mat_entries_used.14.iter6, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter6 = add nuw nsw i32 %c.05.iter6, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter6 = icmp eq i32 %add14.iter6, %47, !dbg !244
  br i1 %exitcond1.not.iter6, label %for.cond1.for.inc17_crit_edge.iter6, label %for.cond4.preheader.iter6, !dbg !155, !llvm.loop !245

for.inc17.iter6:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter6
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_6_end

for.cond4.preheader.iter6:                        ; preds = %for.cond4.preheader.lr.ph.iter6, %for.inc15.iter6
  %c.05.iter6 = phi i32 [ 6, %for.cond4.preheader.lr.ph.iter6 ], [ %inc.iter6, %for.inc15.iter6 ]
  %bs_mat_entries_used.14.iter6 = phi i32 [ %split.iter5, %for.cond4.preheader.lr.ph.iter6 ], [ %add14.iter6, %for.inc15.iter6 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter6, !dbg !239

for.cond4.preheader.lr.ph.iter6:                  ; preds = %for.cond1.preheader.iter6
  br label %for.cond4.preheader.iter6, !dbg !155

for.cond1.for.inc17_crit_edge.iter6:              ; preds = %for.inc15.iter6
  %split.iter6 = phi i32 [ %add14.iter6, %for.inc15.iter6 ]
  br label %for.inc17.iter6, !dbg !155

iter_6_end:                                       ; preds = %for.inc17.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.cond1.preheader.iter7

for.cond1.preheader.iter7:                        ; preds = %iter_7_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %55 = add i32 %split.iter6, 71, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter7, !dbg !155

for.body6.iter7:                                  ; preds = %for.cond4.preheader.iter7, %m_vec_mul_add.exit.iter7
  %k.02.iter7 = phi i32 [ 0, %for.cond4.preheader.iter7 ], [ %add13.iter7, %m_vec_mul_add.exit.iter7 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter7 = mul nsw i32 %bs_mat_entries_used.14.iter7, 40, !dbg !161
  %add.ptr.iter7 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter7, !dbg !161
  %mul8.iter7 = mul nuw nsw i32 %k.02.iter7, 78, !dbg !164
  %56 = getelementptr i8, ptr %mat, i32 %mul8.iter7, !dbg !165
  %arrayidx.iter7 = getelementptr i8, ptr %56, i32 %c.05.iter7, !dbg !165
  %57 = load i8, ptr %arrayidx.iter7, align 1, !dbg !165
  %add10.iter7 = add nuw nsw i32 70, %k.02.iter7, !dbg !166
  %add.ptr12.idx.iter7 = mul nuw nsw i32 %add10.iter7, 40, !dbg !167
  %add.ptr12.iter7 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter7, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter7 = zext i8 %57 to i32, !dbg !185
  %mul.i.i.iter7 = mul i32 %conv.i.i.iter7, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter7 = and i32 %mul.i.i.iter7, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 4, !dbg !191
  %shr1.i.i.iter7 = lshr exact i32 %and.i.i.iter7, 3, !dbg !192
  %58 = xor i32 %shr.i.i.iter7, %shr1.i.i.iter7, !dbg !193
  %xor2.i.i.iter7 = xor i32 %58, %mul.i.i.iter7, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter7, !dbg !199

for.body.i.iter7:                                 ; preds = %for.body.i.iter7, %for.body6.iter7
  %i.0.i1.iter7 = phi i32 [ 0, %for.body6.iter7 ], [ %inc.i.iter7, %for.body.i.iter7 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !200
  %59 = load i64, ptr %arrayidx.i.iter7, align 8, !dbg !200
  %and.i.iter7 = and i64 %59, 1229782938247303441, !dbg !203
  %and1.i.iter7 = and i32 %xor2.i.i.iter7, 255, !dbg !204
  %conv.i.iter7 = zext nneg i32 %and1.i.iter7 to i64, !dbg !205
  %mul.i.iter7 = mul i64 %and.i.iter7, %conv.i.iter7, !dbg !206
  %shr.i.iter7 = lshr i64 %59, 1, !dbg !207
  %and3.i.iter7 = and i64 %shr.i.iter7, 1229782938247303441, !dbg !208
  %shr4.i.iter7 = lshr i32 %xor2.i.i.iter7, 8, !dbg !209
  %and5.i.iter7 = and i32 %shr4.i.iter7, 15, !dbg !210
  %conv6.i.iter7 = zext nneg i32 %and5.i.iter7 to i64, !dbg !211
  %mul7.i.iter7 = mul nuw i64 %and3.i.iter7, %conv6.i.iter7, !dbg !212
  %xor.i.iter7 = xor i64 %mul.i.iter7, %mul7.i.iter7, !dbg !213
  %arrayidx8.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !214
  %60 = load i64, ptr %arrayidx8.i.iter7, align 8, !dbg !214
  %shr9.i.iter7 = lshr i64 %60, 2, !dbg !215
  %and10.i.iter7 = and i64 %shr9.i.iter7, 1229782938247303441, !dbg !216
  %shr11.i.iter7 = lshr i32 %xor2.i.i.iter7, 16, !dbg !217
  %and12.i.iter7 = and i32 %shr11.i.iter7, 15, !dbg !218
  %conv13.i.iter7 = zext nneg i32 %and12.i.iter7 to i64, !dbg !219
  %mul14.i.iter7 = mul nuw i64 %and10.i.iter7, %conv13.i.iter7, !dbg !220
  %xor15.i.iter7 = xor i64 %xor.i.iter7, %mul14.i.iter7, !dbg !221
  %arrayidx16.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr.iter7, i32 %i.0.i1.iter7, !dbg !222
  %61 = load i64, ptr %arrayidx16.i.iter7, align 8, !dbg !222
  %shr17.i.iter7 = lshr i64 %61, 3, !dbg !223
  %and18.i.iter7 = and i64 %shr17.i.iter7, 1229782938247303441, !dbg !224
  %shr19.i.iter7 = lshr i32 %xor2.i.i.iter7, 24, !dbg !225
  %and20.i.iter7 = and i32 %shr19.i.iter7, 15, !dbg !226
  %conv21.i.iter7 = zext nneg i32 %and20.i.iter7 to i64, !dbg !227
  %mul22.i.iter7 = mul nuw i64 %and18.i.iter7, %conv21.i.iter7, !dbg !228
  %xor23.i.iter7 = xor i64 %xor15.i.iter7, %mul22.i.iter7, !dbg !229
  %arrayidx24.i.iter7 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter7, i32 %i.0.i1.iter7, !dbg !230
  %62 = load i64, ptr %arrayidx24.i.iter7, align 8, !dbg !231
  %xor25.i.iter7 = xor i64 %62, %xor23.i.iter7, !dbg !231
  store i64 %xor25.i.iter7, ptr %arrayidx24.i.iter7, align 8, !dbg !231
  %inc.i.iter7 = add nuw nsw i32 %i.0.i1.iter7, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter7 = icmp eq i32 %inc.i.iter7, 5, !dbg !233
  br i1 %exitcond.i.not.iter7, label %m_vec_mul_add.exit.iter7, label %for.body.i.iter7, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter7:                         ; preds = %for.body.i.iter7
  %add13.iter7 = add nuw nsw i32 %k.02.iter7, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter7 = icmp eq i32 %add13.iter7, 10, !dbg !238
  br i1 %exitcond.not.iter7, label %for.inc15.iter7, label %for.body6.iter7, !dbg !239, !llvm.loop !240

for.inc15.iter7:                                  ; preds = %m_vec_mul_add.exit.iter7
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter7 = add i32 %bs_mat_entries_used.14.iter7, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter7 = add nuw nsw i32 %c.05.iter7, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter7 = icmp eq i32 %add14.iter7, %55, !dbg !244
  br i1 %exitcond1.not.iter7, label %for.cond1.for.inc17_crit_edge.iter7, label %for.cond4.preheader.iter7, !dbg !155, !llvm.loop !245

for.inc17.iter7:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter7
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_7_end

for.cond4.preheader.iter7:                        ; preds = %for.cond4.preheader.lr.ph.iter7, %for.inc15.iter7
  %c.05.iter7 = phi i32 [ 7, %for.cond4.preheader.lr.ph.iter7 ], [ %inc.iter7, %for.inc15.iter7 ]
  %bs_mat_entries_used.14.iter7 = phi i32 [ %split.iter6, %for.cond4.preheader.lr.ph.iter7 ], [ %add14.iter7, %for.inc15.iter7 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter7, !dbg !239

for.cond4.preheader.lr.ph.iter7:                  ; preds = %for.cond1.preheader.iter7
  br label %for.cond4.preheader.iter7, !dbg !155

for.cond1.for.inc17_crit_edge.iter7:              ; preds = %for.inc15.iter7
  %split.iter7 = phi i32 [ %add14.iter7, %for.inc15.iter7 ]
  br label %for.inc17.iter7, !dbg !155

iter_7_end:                                       ; preds = %for.inc17.iter7
  br label %iter_8_start

iter_8_start:                                     ; preds = %iter_7_end
  br label %for.cond1.preheader.iter8

for.cond1.preheader.iter8:                        ; preds = %iter_8_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %63 = add i32 %split.iter7, 70, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter8, !dbg !155

for.body6.iter8:                                  ; preds = %for.cond4.preheader.iter8, %m_vec_mul_add.exit.iter8
  %k.02.iter8 = phi i32 [ 0, %for.cond4.preheader.iter8 ], [ %add13.iter8, %m_vec_mul_add.exit.iter8 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter8 = mul nsw i32 %bs_mat_entries_used.14.iter8, 40, !dbg !161
  %add.ptr.iter8 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter8, !dbg !161
  %mul8.iter8 = mul nuw nsw i32 %k.02.iter8, 78, !dbg !164
  %64 = getelementptr i8, ptr %mat, i32 %mul8.iter8, !dbg !165
  %arrayidx.iter8 = getelementptr i8, ptr %64, i32 %c.05.iter8, !dbg !165
  %65 = load i8, ptr %arrayidx.iter8, align 1, !dbg !165
  %add10.iter8 = add nuw nsw i32 80, %k.02.iter8, !dbg !166
  %add.ptr12.idx.iter8 = mul nuw nsw i32 %add10.iter8, 40, !dbg !167
  %add.ptr12.iter8 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter8, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter8 = zext i8 %65 to i32, !dbg !185
  %mul.i.i.iter8 = mul i32 %conv.i.i.iter8, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter8 = and i32 %mul.i.i.iter8, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter8 = lshr exact i32 %and.i.i.iter8, 4, !dbg !191
  %shr1.i.i.iter8 = lshr exact i32 %and.i.i.iter8, 3, !dbg !192
  %66 = xor i32 %shr.i.i.iter8, %shr1.i.i.iter8, !dbg !193
  %xor2.i.i.iter8 = xor i32 %66, %mul.i.i.iter8, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter8, !dbg !199

for.body.i.iter8:                                 ; preds = %for.body.i.iter8, %for.body6.iter8
  %i.0.i1.iter8 = phi i32 [ 0, %for.body6.iter8 ], [ %inc.i.iter8, %for.body.i.iter8 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.iter8, i32 %i.0.i1.iter8, !dbg !200
  %67 = load i64, ptr %arrayidx.i.iter8, align 8, !dbg !200
  %and.i.iter8 = and i64 %67, 1229782938247303441, !dbg !203
  %and1.i.iter8 = and i32 %xor2.i.i.iter8, 255, !dbg !204
  %conv.i.iter8 = zext nneg i32 %and1.i.iter8 to i64, !dbg !205
  %mul.i.iter8 = mul i64 %and.i.iter8, %conv.i.iter8, !dbg !206
  %shr.i.iter8 = lshr i64 %67, 1, !dbg !207
  %and3.i.iter8 = and i64 %shr.i.iter8, 1229782938247303441, !dbg !208
  %shr4.i.iter8 = lshr i32 %xor2.i.i.iter8, 8, !dbg !209
  %and5.i.iter8 = and i32 %shr4.i.iter8, 15, !dbg !210
  %conv6.i.iter8 = zext nneg i32 %and5.i.iter8 to i64, !dbg !211
  %mul7.i.iter8 = mul nuw i64 %and3.i.iter8, %conv6.i.iter8, !dbg !212
  %xor.i.iter8 = xor i64 %mul.i.iter8, %mul7.i.iter8, !dbg !213
  %arrayidx8.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.iter8, i32 %i.0.i1.iter8, !dbg !214
  %68 = load i64, ptr %arrayidx8.i.iter8, align 8, !dbg !214
  %shr9.i.iter8 = lshr i64 %68, 2, !dbg !215
  %and10.i.iter8 = and i64 %shr9.i.iter8, 1229782938247303441, !dbg !216
  %shr11.i.iter8 = lshr i32 %xor2.i.i.iter8, 16, !dbg !217
  %and12.i.iter8 = and i32 %shr11.i.iter8, 15, !dbg !218
  %conv13.i.iter8 = zext nneg i32 %and12.i.iter8 to i64, !dbg !219
  %mul14.i.iter8 = mul nuw i64 %and10.i.iter8, %conv13.i.iter8, !dbg !220
  %xor15.i.iter8 = xor i64 %xor.i.iter8, %mul14.i.iter8, !dbg !221
  %arrayidx16.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr.iter8, i32 %i.0.i1.iter8, !dbg !222
  %69 = load i64, ptr %arrayidx16.i.iter8, align 8, !dbg !222
  %shr17.i.iter8 = lshr i64 %69, 3, !dbg !223
  %and18.i.iter8 = and i64 %shr17.i.iter8, 1229782938247303441, !dbg !224
  %shr19.i.iter8 = lshr i32 %xor2.i.i.iter8, 24, !dbg !225
  %and20.i.iter8 = and i32 %shr19.i.iter8, 15, !dbg !226
  %conv21.i.iter8 = zext nneg i32 %and20.i.iter8 to i64, !dbg !227
  %mul22.i.iter8 = mul nuw i64 %and18.i.iter8, %conv21.i.iter8, !dbg !228
  %xor23.i.iter8 = xor i64 %xor15.i.iter8, %mul22.i.iter8, !dbg !229
  %arrayidx24.i.iter8 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter8, i32 %i.0.i1.iter8, !dbg !230
  %70 = load i64, ptr %arrayidx24.i.iter8, align 8, !dbg !231
  %xor25.i.iter8 = xor i64 %70, %xor23.i.iter8, !dbg !231
  store i64 %xor25.i.iter8, ptr %arrayidx24.i.iter8, align 8, !dbg !231
  %inc.i.iter8 = add nuw nsw i32 %i.0.i1.iter8, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter8 = icmp eq i32 %inc.i.iter8, 5, !dbg !233
  br i1 %exitcond.i.not.iter8, label %m_vec_mul_add.exit.iter8, label %for.body.i.iter8, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter8:                         ; preds = %for.body.i.iter8
  %add13.iter8 = add nuw nsw i32 %k.02.iter8, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter8 = icmp eq i32 %add13.iter8, 10, !dbg !238
  br i1 %exitcond.not.iter8, label %for.inc15.iter8, label %for.body6.iter8, !dbg !239, !llvm.loop !240

for.inc15.iter8:                                  ; preds = %m_vec_mul_add.exit.iter8
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter8 = add i32 %bs_mat_entries_used.14.iter8, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter8 = add nuw nsw i32 %c.05.iter8, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter8 = icmp eq i32 %add14.iter8, %63, !dbg !244
  br i1 %exitcond1.not.iter8, label %for.cond1.for.inc17_crit_edge.iter8, label %for.cond4.preheader.iter8, !dbg !155, !llvm.loop !245

for.inc17.iter8:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter8
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_8_end

for.cond4.preheader.iter8:                        ; preds = %for.cond4.preheader.lr.ph.iter8, %for.inc15.iter8
  %c.05.iter8 = phi i32 [ 8, %for.cond4.preheader.lr.ph.iter8 ], [ %inc.iter8, %for.inc15.iter8 ]
  %bs_mat_entries_used.14.iter8 = phi i32 [ %split.iter7, %for.cond4.preheader.lr.ph.iter8 ], [ %add14.iter8, %for.inc15.iter8 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter8, !dbg !239

for.cond4.preheader.lr.ph.iter8:                  ; preds = %for.cond1.preheader.iter8
  br label %for.cond4.preheader.iter8, !dbg !155

for.cond1.for.inc17_crit_edge.iter8:              ; preds = %for.inc15.iter8
  %split.iter8 = phi i32 [ %add14.iter8, %for.inc15.iter8 ]
  br label %for.inc17.iter8, !dbg !155

iter_8_end:                                       ; preds = %for.inc17.iter8
  br label %iter_9_start

iter_9_start:                                     ; preds = %iter_8_end
  br label %for.cond1.preheader.iter9

for.cond1.preheader.iter9:                        ; preds = %iter_9_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %71 = add i32 %split.iter8, 69, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter9, !dbg !155

for.body6.iter9:                                  ; preds = %for.cond4.preheader.iter9, %m_vec_mul_add.exit.iter9
  %k.02.iter9 = phi i32 [ 0, %for.cond4.preheader.iter9 ], [ %add13.iter9, %m_vec_mul_add.exit.iter9 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter9 = mul nsw i32 %bs_mat_entries_used.14.iter9, 40, !dbg !161
  %add.ptr.iter9 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter9, !dbg !161
  %mul8.iter9 = mul nuw nsw i32 %k.02.iter9, 78, !dbg !164
  %72 = getelementptr i8, ptr %mat, i32 %mul8.iter9, !dbg !165
  %arrayidx.iter9 = getelementptr i8, ptr %72, i32 %c.05.iter9, !dbg !165
  %73 = load i8, ptr %arrayidx.iter9, align 1, !dbg !165
  %add10.iter9 = add nuw nsw i32 90, %k.02.iter9, !dbg !166
  %add.ptr12.idx.iter9 = mul nuw nsw i32 %add10.iter9, 40, !dbg !167
  %add.ptr12.iter9 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter9, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter9 = zext i8 %73 to i32, !dbg !185
  %mul.i.i.iter9 = mul i32 %conv.i.i.iter9, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter9 = and i32 %mul.i.i.iter9, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter9 = lshr exact i32 %and.i.i.iter9, 4, !dbg !191
  %shr1.i.i.iter9 = lshr exact i32 %and.i.i.iter9, 3, !dbg !192
  %74 = xor i32 %shr.i.i.iter9, %shr1.i.i.iter9, !dbg !193
  %xor2.i.i.iter9 = xor i32 %74, %mul.i.i.iter9, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter9, !dbg !199

for.body.i.iter9:                                 ; preds = %for.body.i.iter9, %for.body6.iter9
  %i.0.i1.iter9 = phi i32 [ 0, %for.body6.iter9 ], [ %inc.i.iter9, %for.body.i.iter9 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.iter9, i32 %i.0.i1.iter9, !dbg !200
  %75 = load i64, ptr %arrayidx.i.iter9, align 8, !dbg !200
  %and.i.iter9 = and i64 %75, 1229782938247303441, !dbg !203
  %and1.i.iter9 = and i32 %xor2.i.i.iter9, 255, !dbg !204
  %conv.i.iter9 = zext nneg i32 %and1.i.iter9 to i64, !dbg !205
  %mul.i.iter9 = mul i64 %and.i.iter9, %conv.i.iter9, !dbg !206
  %shr.i.iter9 = lshr i64 %75, 1, !dbg !207
  %and3.i.iter9 = and i64 %shr.i.iter9, 1229782938247303441, !dbg !208
  %shr4.i.iter9 = lshr i32 %xor2.i.i.iter9, 8, !dbg !209
  %and5.i.iter9 = and i32 %shr4.i.iter9, 15, !dbg !210
  %conv6.i.iter9 = zext nneg i32 %and5.i.iter9 to i64, !dbg !211
  %mul7.i.iter9 = mul nuw i64 %and3.i.iter9, %conv6.i.iter9, !dbg !212
  %xor.i.iter9 = xor i64 %mul.i.iter9, %mul7.i.iter9, !dbg !213
  %arrayidx8.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.iter9, i32 %i.0.i1.iter9, !dbg !214
  %76 = load i64, ptr %arrayidx8.i.iter9, align 8, !dbg !214
  %shr9.i.iter9 = lshr i64 %76, 2, !dbg !215
  %and10.i.iter9 = and i64 %shr9.i.iter9, 1229782938247303441, !dbg !216
  %shr11.i.iter9 = lshr i32 %xor2.i.i.iter9, 16, !dbg !217
  %and12.i.iter9 = and i32 %shr11.i.iter9, 15, !dbg !218
  %conv13.i.iter9 = zext nneg i32 %and12.i.iter9 to i64, !dbg !219
  %mul14.i.iter9 = mul nuw i64 %and10.i.iter9, %conv13.i.iter9, !dbg !220
  %xor15.i.iter9 = xor i64 %xor.i.iter9, %mul14.i.iter9, !dbg !221
  %arrayidx16.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr.iter9, i32 %i.0.i1.iter9, !dbg !222
  %77 = load i64, ptr %arrayidx16.i.iter9, align 8, !dbg !222
  %shr17.i.iter9 = lshr i64 %77, 3, !dbg !223
  %and18.i.iter9 = and i64 %shr17.i.iter9, 1229782938247303441, !dbg !224
  %shr19.i.iter9 = lshr i32 %xor2.i.i.iter9, 24, !dbg !225
  %and20.i.iter9 = and i32 %shr19.i.iter9, 15, !dbg !226
  %conv21.i.iter9 = zext nneg i32 %and20.i.iter9 to i64, !dbg !227
  %mul22.i.iter9 = mul nuw i64 %and18.i.iter9, %conv21.i.iter9, !dbg !228
  %xor23.i.iter9 = xor i64 %xor15.i.iter9, %mul22.i.iter9, !dbg !229
  %arrayidx24.i.iter9 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter9, i32 %i.0.i1.iter9, !dbg !230
  %78 = load i64, ptr %arrayidx24.i.iter9, align 8, !dbg !231
  %xor25.i.iter9 = xor i64 %78, %xor23.i.iter9, !dbg !231
  store i64 %xor25.i.iter9, ptr %arrayidx24.i.iter9, align 8, !dbg !231
  %inc.i.iter9 = add nuw nsw i32 %i.0.i1.iter9, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter9 = icmp eq i32 %inc.i.iter9, 5, !dbg !233
  br i1 %exitcond.i.not.iter9, label %m_vec_mul_add.exit.iter9, label %for.body.i.iter9, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter9:                         ; preds = %for.body.i.iter9
  %add13.iter9 = add nuw nsw i32 %k.02.iter9, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter9 = icmp eq i32 %add13.iter9, 10, !dbg !238
  br i1 %exitcond.not.iter9, label %for.inc15.iter9, label %for.body6.iter9, !dbg !239, !llvm.loop !240

for.inc15.iter9:                                  ; preds = %m_vec_mul_add.exit.iter9
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter9 = add i32 %bs_mat_entries_used.14.iter9, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter9 = add nuw nsw i32 %c.05.iter9, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter9 = icmp eq i32 %add14.iter9, %71, !dbg !244
  br i1 %exitcond1.not.iter9, label %for.cond1.for.inc17_crit_edge.iter9, label %for.cond4.preheader.iter9, !dbg !155, !llvm.loop !245

for.inc17.iter9:                                  ; preds = %for.cond1.for.inc17_crit_edge.iter9
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_9_end

for.cond4.preheader.iter9:                        ; preds = %for.cond4.preheader.lr.ph.iter9, %for.inc15.iter9
  %c.05.iter9 = phi i32 [ 9, %for.cond4.preheader.lr.ph.iter9 ], [ %inc.iter9, %for.inc15.iter9 ]
  %bs_mat_entries_used.14.iter9 = phi i32 [ %split.iter8, %for.cond4.preheader.lr.ph.iter9 ], [ %add14.iter9, %for.inc15.iter9 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter9, !dbg !239

for.cond4.preheader.lr.ph.iter9:                  ; preds = %for.cond1.preheader.iter9
  br label %for.cond4.preheader.iter9, !dbg !155

for.cond1.for.inc17_crit_edge.iter9:              ; preds = %for.inc15.iter9
  %split.iter9 = phi i32 [ %add14.iter9, %for.inc15.iter9 ]
  br label %for.inc17.iter9, !dbg !155

iter_9_end:                                       ; preds = %for.inc17.iter9
  br label %iter_10_start

iter_10_start:                                    ; preds = %iter_9_end
  br label %for.cond1.preheader.iter10

for.cond1.preheader.iter10:                       ; preds = %iter_10_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %79 = add i32 %split.iter9, 68, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter10, !dbg !155

for.body6.iter10:                                 ; preds = %for.cond4.preheader.iter10, %m_vec_mul_add.exit.iter10
  %k.02.iter10 = phi i32 [ 0, %for.cond4.preheader.iter10 ], [ %add13.iter10, %m_vec_mul_add.exit.iter10 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter10 = mul nsw i32 %bs_mat_entries_used.14.iter10, 40, !dbg !161
  %add.ptr.iter10 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter10, !dbg !161
  %mul8.iter10 = mul nuw nsw i32 %k.02.iter10, 78, !dbg !164
  %80 = getelementptr i8, ptr %mat, i32 %mul8.iter10, !dbg !165
  %arrayidx.iter10 = getelementptr i8, ptr %80, i32 %c.05.iter10, !dbg !165
  %81 = load i8, ptr %arrayidx.iter10, align 1, !dbg !165
  %add10.iter10 = add nuw nsw i32 100, %k.02.iter10, !dbg !166
  %add.ptr12.idx.iter10 = mul nuw nsw i32 %add10.iter10, 40, !dbg !167
  %add.ptr12.iter10 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter10, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter10 = zext i8 %81 to i32, !dbg !185
  %mul.i.i.iter10 = mul i32 %conv.i.i.iter10, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter10 = and i32 %mul.i.i.iter10, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter10 = lshr exact i32 %and.i.i.iter10, 4, !dbg !191
  %shr1.i.i.iter10 = lshr exact i32 %and.i.i.iter10, 3, !dbg !192
  %82 = xor i32 %shr.i.i.iter10, %shr1.i.i.iter10, !dbg !193
  %xor2.i.i.iter10 = xor i32 %82, %mul.i.i.iter10, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter10, !dbg !199

for.body.i.iter10:                                ; preds = %for.body.i.iter10, %for.body6.iter10
  %i.0.i1.iter10 = phi i32 [ 0, %for.body6.iter10 ], [ %inc.i.iter10, %for.body.i.iter10 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.iter10, i32 %i.0.i1.iter10, !dbg !200
  %83 = load i64, ptr %arrayidx.i.iter10, align 8, !dbg !200
  %and.i.iter10 = and i64 %83, 1229782938247303441, !dbg !203
  %and1.i.iter10 = and i32 %xor2.i.i.iter10, 255, !dbg !204
  %conv.i.iter10 = zext nneg i32 %and1.i.iter10 to i64, !dbg !205
  %mul.i.iter10 = mul i64 %and.i.iter10, %conv.i.iter10, !dbg !206
  %shr.i.iter10 = lshr i64 %83, 1, !dbg !207
  %and3.i.iter10 = and i64 %shr.i.iter10, 1229782938247303441, !dbg !208
  %shr4.i.iter10 = lshr i32 %xor2.i.i.iter10, 8, !dbg !209
  %and5.i.iter10 = and i32 %shr4.i.iter10, 15, !dbg !210
  %conv6.i.iter10 = zext nneg i32 %and5.i.iter10 to i64, !dbg !211
  %mul7.i.iter10 = mul nuw i64 %and3.i.iter10, %conv6.i.iter10, !dbg !212
  %xor.i.iter10 = xor i64 %mul.i.iter10, %mul7.i.iter10, !dbg !213
  %arrayidx8.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.iter10, i32 %i.0.i1.iter10, !dbg !214
  %84 = load i64, ptr %arrayidx8.i.iter10, align 8, !dbg !214
  %shr9.i.iter10 = lshr i64 %84, 2, !dbg !215
  %and10.i.iter10 = and i64 %shr9.i.iter10, 1229782938247303441, !dbg !216
  %shr11.i.iter10 = lshr i32 %xor2.i.i.iter10, 16, !dbg !217
  %and12.i.iter10 = and i32 %shr11.i.iter10, 15, !dbg !218
  %conv13.i.iter10 = zext nneg i32 %and12.i.iter10 to i64, !dbg !219
  %mul14.i.iter10 = mul nuw i64 %and10.i.iter10, %conv13.i.iter10, !dbg !220
  %xor15.i.iter10 = xor i64 %xor.i.iter10, %mul14.i.iter10, !dbg !221
  %arrayidx16.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr.iter10, i32 %i.0.i1.iter10, !dbg !222
  %85 = load i64, ptr %arrayidx16.i.iter10, align 8, !dbg !222
  %shr17.i.iter10 = lshr i64 %85, 3, !dbg !223
  %and18.i.iter10 = and i64 %shr17.i.iter10, 1229782938247303441, !dbg !224
  %shr19.i.iter10 = lshr i32 %xor2.i.i.iter10, 24, !dbg !225
  %and20.i.iter10 = and i32 %shr19.i.iter10, 15, !dbg !226
  %conv21.i.iter10 = zext nneg i32 %and20.i.iter10 to i64, !dbg !227
  %mul22.i.iter10 = mul nuw i64 %and18.i.iter10, %conv21.i.iter10, !dbg !228
  %xor23.i.iter10 = xor i64 %xor15.i.iter10, %mul22.i.iter10, !dbg !229
  %arrayidx24.i.iter10 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter10, i32 %i.0.i1.iter10, !dbg !230
  %86 = load i64, ptr %arrayidx24.i.iter10, align 8, !dbg !231
  %xor25.i.iter10 = xor i64 %86, %xor23.i.iter10, !dbg !231
  store i64 %xor25.i.iter10, ptr %arrayidx24.i.iter10, align 8, !dbg !231
  %inc.i.iter10 = add nuw nsw i32 %i.0.i1.iter10, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter10 = icmp eq i32 %inc.i.iter10, 5, !dbg !233
  br i1 %exitcond.i.not.iter10, label %m_vec_mul_add.exit.iter10, label %for.body.i.iter10, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter10:                        ; preds = %for.body.i.iter10
  %add13.iter10 = add nuw nsw i32 %k.02.iter10, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter10 = icmp eq i32 %add13.iter10, 10, !dbg !238
  br i1 %exitcond.not.iter10, label %for.inc15.iter10, label %for.body6.iter10, !dbg !239, !llvm.loop !240

for.inc15.iter10:                                 ; preds = %m_vec_mul_add.exit.iter10
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter10 = add i32 %bs_mat_entries_used.14.iter10, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter10 = add nuw nsw i32 %c.05.iter10, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter10 = icmp eq i32 %add14.iter10, %79, !dbg !244
  br i1 %exitcond1.not.iter10, label %for.cond1.for.inc17_crit_edge.iter10, label %for.cond4.preheader.iter10, !dbg !155, !llvm.loop !245

for.inc17.iter10:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter10
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_10_end

for.cond4.preheader.iter10:                       ; preds = %for.cond4.preheader.lr.ph.iter10, %for.inc15.iter10
  %c.05.iter10 = phi i32 [ 10, %for.cond4.preheader.lr.ph.iter10 ], [ %inc.iter10, %for.inc15.iter10 ]
  %bs_mat_entries_used.14.iter10 = phi i32 [ %split.iter9, %for.cond4.preheader.lr.ph.iter10 ], [ %add14.iter10, %for.inc15.iter10 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter10, !dbg !239

for.cond4.preheader.lr.ph.iter10:                 ; preds = %for.cond1.preheader.iter10
  br label %for.cond4.preheader.iter10, !dbg !155

for.cond1.for.inc17_crit_edge.iter10:             ; preds = %for.inc15.iter10
  %split.iter10 = phi i32 [ %add14.iter10, %for.inc15.iter10 ]
  br label %for.inc17.iter10, !dbg !155

iter_10_end:                                      ; preds = %for.inc17.iter10
  br label %iter_11_start

iter_11_start:                                    ; preds = %iter_10_end
  br label %for.cond1.preheader.iter11

for.cond1.preheader.iter11:                       ; preds = %iter_11_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %87 = add i32 %split.iter10, 67, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter11, !dbg !155

for.body6.iter11:                                 ; preds = %for.cond4.preheader.iter11, %m_vec_mul_add.exit.iter11
  %k.02.iter11 = phi i32 [ 0, %for.cond4.preheader.iter11 ], [ %add13.iter11, %m_vec_mul_add.exit.iter11 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter11 = mul nsw i32 %bs_mat_entries_used.14.iter11, 40, !dbg !161
  %add.ptr.iter11 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter11, !dbg !161
  %mul8.iter11 = mul nuw nsw i32 %k.02.iter11, 78, !dbg !164
  %88 = getelementptr i8, ptr %mat, i32 %mul8.iter11, !dbg !165
  %arrayidx.iter11 = getelementptr i8, ptr %88, i32 %c.05.iter11, !dbg !165
  %89 = load i8, ptr %arrayidx.iter11, align 1, !dbg !165
  %add10.iter11 = add nuw nsw i32 110, %k.02.iter11, !dbg !166
  %add.ptr12.idx.iter11 = mul nuw nsw i32 %add10.iter11, 40, !dbg !167
  %add.ptr12.iter11 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter11, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter11 = zext i8 %89 to i32, !dbg !185
  %mul.i.i.iter11 = mul i32 %conv.i.i.iter11, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter11 = and i32 %mul.i.i.iter11, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter11 = lshr exact i32 %and.i.i.iter11, 4, !dbg !191
  %shr1.i.i.iter11 = lshr exact i32 %and.i.i.iter11, 3, !dbg !192
  %90 = xor i32 %shr.i.i.iter11, %shr1.i.i.iter11, !dbg !193
  %xor2.i.i.iter11 = xor i32 %90, %mul.i.i.iter11, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter11, !dbg !199

for.body.i.iter11:                                ; preds = %for.body.i.iter11, %for.body6.iter11
  %i.0.i1.iter11 = phi i32 [ 0, %for.body6.iter11 ], [ %inc.i.iter11, %for.body.i.iter11 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.iter11, i32 %i.0.i1.iter11, !dbg !200
  %91 = load i64, ptr %arrayidx.i.iter11, align 8, !dbg !200
  %and.i.iter11 = and i64 %91, 1229782938247303441, !dbg !203
  %and1.i.iter11 = and i32 %xor2.i.i.iter11, 255, !dbg !204
  %conv.i.iter11 = zext nneg i32 %and1.i.iter11 to i64, !dbg !205
  %mul.i.iter11 = mul i64 %and.i.iter11, %conv.i.iter11, !dbg !206
  %shr.i.iter11 = lshr i64 %91, 1, !dbg !207
  %and3.i.iter11 = and i64 %shr.i.iter11, 1229782938247303441, !dbg !208
  %shr4.i.iter11 = lshr i32 %xor2.i.i.iter11, 8, !dbg !209
  %and5.i.iter11 = and i32 %shr4.i.iter11, 15, !dbg !210
  %conv6.i.iter11 = zext nneg i32 %and5.i.iter11 to i64, !dbg !211
  %mul7.i.iter11 = mul nuw i64 %and3.i.iter11, %conv6.i.iter11, !dbg !212
  %xor.i.iter11 = xor i64 %mul.i.iter11, %mul7.i.iter11, !dbg !213
  %arrayidx8.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.iter11, i32 %i.0.i1.iter11, !dbg !214
  %92 = load i64, ptr %arrayidx8.i.iter11, align 8, !dbg !214
  %shr9.i.iter11 = lshr i64 %92, 2, !dbg !215
  %and10.i.iter11 = and i64 %shr9.i.iter11, 1229782938247303441, !dbg !216
  %shr11.i.iter11 = lshr i32 %xor2.i.i.iter11, 16, !dbg !217
  %and12.i.iter11 = and i32 %shr11.i.iter11, 15, !dbg !218
  %conv13.i.iter11 = zext nneg i32 %and12.i.iter11 to i64, !dbg !219
  %mul14.i.iter11 = mul nuw i64 %and10.i.iter11, %conv13.i.iter11, !dbg !220
  %xor15.i.iter11 = xor i64 %xor.i.iter11, %mul14.i.iter11, !dbg !221
  %arrayidx16.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr.iter11, i32 %i.0.i1.iter11, !dbg !222
  %93 = load i64, ptr %arrayidx16.i.iter11, align 8, !dbg !222
  %shr17.i.iter11 = lshr i64 %93, 3, !dbg !223
  %and18.i.iter11 = and i64 %shr17.i.iter11, 1229782938247303441, !dbg !224
  %shr19.i.iter11 = lshr i32 %xor2.i.i.iter11, 24, !dbg !225
  %and20.i.iter11 = and i32 %shr19.i.iter11, 15, !dbg !226
  %conv21.i.iter11 = zext nneg i32 %and20.i.iter11 to i64, !dbg !227
  %mul22.i.iter11 = mul nuw i64 %and18.i.iter11, %conv21.i.iter11, !dbg !228
  %xor23.i.iter11 = xor i64 %xor15.i.iter11, %mul22.i.iter11, !dbg !229
  %arrayidx24.i.iter11 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter11, i32 %i.0.i1.iter11, !dbg !230
  %94 = load i64, ptr %arrayidx24.i.iter11, align 8, !dbg !231
  %xor25.i.iter11 = xor i64 %94, %xor23.i.iter11, !dbg !231
  store i64 %xor25.i.iter11, ptr %arrayidx24.i.iter11, align 8, !dbg !231
  %inc.i.iter11 = add nuw nsw i32 %i.0.i1.iter11, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter11 = icmp eq i32 %inc.i.iter11, 5, !dbg !233
  br i1 %exitcond.i.not.iter11, label %m_vec_mul_add.exit.iter11, label %for.body.i.iter11, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter11:                        ; preds = %for.body.i.iter11
  %add13.iter11 = add nuw nsw i32 %k.02.iter11, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter11 = icmp eq i32 %add13.iter11, 10, !dbg !238
  br i1 %exitcond.not.iter11, label %for.inc15.iter11, label %for.body6.iter11, !dbg !239, !llvm.loop !240

for.inc15.iter11:                                 ; preds = %m_vec_mul_add.exit.iter11
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter11 = add i32 %bs_mat_entries_used.14.iter11, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter11 = add nuw nsw i32 %c.05.iter11, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter11 = icmp eq i32 %add14.iter11, %87, !dbg !244
  br i1 %exitcond1.not.iter11, label %for.cond1.for.inc17_crit_edge.iter11, label %for.cond4.preheader.iter11, !dbg !155, !llvm.loop !245

for.inc17.iter11:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter11
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_11_end

for.cond4.preheader.iter11:                       ; preds = %for.cond4.preheader.lr.ph.iter11, %for.inc15.iter11
  %c.05.iter11 = phi i32 [ 11, %for.cond4.preheader.lr.ph.iter11 ], [ %inc.iter11, %for.inc15.iter11 ]
  %bs_mat_entries_used.14.iter11 = phi i32 [ %split.iter10, %for.cond4.preheader.lr.ph.iter11 ], [ %add14.iter11, %for.inc15.iter11 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter11, !dbg !239

for.cond4.preheader.lr.ph.iter11:                 ; preds = %for.cond1.preheader.iter11
  br label %for.cond4.preheader.iter11, !dbg !155

for.cond1.for.inc17_crit_edge.iter11:             ; preds = %for.inc15.iter11
  %split.iter11 = phi i32 [ %add14.iter11, %for.inc15.iter11 ]
  br label %for.inc17.iter11, !dbg !155

iter_11_end:                                      ; preds = %for.inc17.iter11
  br label %iter_12_start

iter_12_start:                                    ; preds = %iter_11_end
  br label %for.cond1.preheader.iter12

for.cond1.preheader.iter12:                       ; preds = %iter_12_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %95 = add i32 %split.iter11, 66, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter12, !dbg !155

for.body6.iter12:                                 ; preds = %for.cond4.preheader.iter12, %m_vec_mul_add.exit.iter12
  %k.02.iter12 = phi i32 [ 0, %for.cond4.preheader.iter12 ], [ %add13.iter12, %m_vec_mul_add.exit.iter12 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter12 = mul nsw i32 %bs_mat_entries_used.14.iter12, 40, !dbg !161
  %add.ptr.iter12 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter12, !dbg !161
  %mul8.iter12 = mul nuw nsw i32 %k.02.iter12, 78, !dbg !164
  %96 = getelementptr i8, ptr %mat, i32 %mul8.iter12, !dbg !165
  %arrayidx.iter12 = getelementptr i8, ptr %96, i32 %c.05.iter12, !dbg !165
  %97 = load i8, ptr %arrayidx.iter12, align 1, !dbg !165
  %add10.iter12 = add nuw nsw i32 120, %k.02.iter12, !dbg !166
  %add.ptr12.idx.iter12 = mul nuw nsw i32 %add10.iter12, 40, !dbg !167
  %add.ptr12.iter12 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter12, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter12 = zext i8 %97 to i32, !dbg !185
  %mul.i.i.iter12 = mul i32 %conv.i.i.iter12, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter12 = and i32 %mul.i.i.iter12, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter12 = lshr exact i32 %and.i.i.iter12, 4, !dbg !191
  %shr1.i.i.iter12 = lshr exact i32 %and.i.i.iter12, 3, !dbg !192
  %98 = xor i32 %shr.i.i.iter12, %shr1.i.i.iter12, !dbg !193
  %xor2.i.i.iter12 = xor i32 %98, %mul.i.i.iter12, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter12, !dbg !199

for.body.i.iter12:                                ; preds = %for.body.i.iter12, %for.body6.iter12
  %i.0.i1.iter12 = phi i32 [ 0, %for.body6.iter12 ], [ %inc.i.iter12, %for.body.i.iter12 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.iter12, i32 %i.0.i1.iter12, !dbg !200
  %99 = load i64, ptr %arrayidx.i.iter12, align 8, !dbg !200
  %and.i.iter12 = and i64 %99, 1229782938247303441, !dbg !203
  %and1.i.iter12 = and i32 %xor2.i.i.iter12, 255, !dbg !204
  %conv.i.iter12 = zext nneg i32 %and1.i.iter12 to i64, !dbg !205
  %mul.i.iter12 = mul i64 %and.i.iter12, %conv.i.iter12, !dbg !206
  %shr.i.iter12 = lshr i64 %99, 1, !dbg !207
  %and3.i.iter12 = and i64 %shr.i.iter12, 1229782938247303441, !dbg !208
  %shr4.i.iter12 = lshr i32 %xor2.i.i.iter12, 8, !dbg !209
  %and5.i.iter12 = and i32 %shr4.i.iter12, 15, !dbg !210
  %conv6.i.iter12 = zext nneg i32 %and5.i.iter12 to i64, !dbg !211
  %mul7.i.iter12 = mul nuw i64 %and3.i.iter12, %conv6.i.iter12, !dbg !212
  %xor.i.iter12 = xor i64 %mul.i.iter12, %mul7.i.iter12, !dbg !213
  %arrayidx8.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.iter12, i32 %i.0.i1.iter12, !dbg !214
  %100 = load i64, ptr %arrayidx8.i.iter12, align 8, !dbg !214
  %shr9.i.iter12 = lshr i64 %100, 2, !dbg !215
  %and10.i.iter12 = and i64 %shr9.i.iter12, 1229782938247303441, !dbg !216
  %shr11.i.iter12 = lshr i32 %xor2.i.i.iter12, 16, !dbg !217
  %and12.i.iter12 = and i32 %shr11.i.iter12, 15, !dbg !218
  %conv13.i.iter12 = zext nneg i32 %and12.i.iter12 to i64, !dbg !219
  %mul14.i.iter12 = mul nuw i64 %and10.i.iter12, %conv13.i.iter12, !dbg !220
  %xor15.i.iter12 = xor i64 %xor.i.iter12, %mul14.i.iter12, !dbg !221
  %arrayidx16.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr.iter12, i32 %i.0.i1.iter12, !dbg !222
  %101 = load i64, ptr %arrayidx16.i.iter12, align 8, !dbg !222
  %shr17.i.iter12 = lshr i64 %101, 3, !dbg !223
  %and18.i.iter12 = and i64 %shr17.i.iter12, 1229782938247303441, !dbg !224
  %shr19.i.iter12 = lshr i32 %xor2.i.i.iter12, 24, !dbg !225
  %and20.i.iter12 = and i32 %shr19.i.iter12, 15, !dbg !226
  %conv21.i.iter12 = zext nneg i32 %and20.i.iter12 to i64, !dbg !227
  %mul22.i.iter12 = mul nuw i64 %and18.i.iter12, %conv21.i.iter12, !dbg !228
  %xor23.i.iter12 = xor i64 %xor15.i.iter12, %mul22.i.iter12, !dbg !229
  %arrayidx24.i.iter12 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter12, i32 %i.0.i1.iter12, !dbg !230
  %102 = load i64, ptr %arrayidx24.i.iter12, align 8, !dbg !231
  %xor25.i.iter12 = xor i64 %102, %xor23.i.iter12, !dbg !231
  store i64 %xor25.i.iter12, ptr %arrayidx24.i.iter12, align 8, !dbg !231
  %inc.i.iter12 = add nuw nsw i32 %i.0.i1.iter12, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter12 = icmp eq i32 %inc.i.iter12, 5, !dbg !233
  br i1 %exitcond.i.not.iter12, label %m_vec_mul_add.exit.iter12, label %for.body.i.iter12, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter12:                        ; preds = %for.body.i.iter12
  %add13.iter12 = add nuw nsw i32 %k.02.iter12, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter12 = icmp eq i32 %add13.iter12, 10, !dbg !238
  br i1 %exitcond.not.iter12, label %for.inc15.iter12, label %for.body6.iter12, !dbg !239, !llvm.loop !240

for.inc15.iter12:                                 ; preds = %m_vec_mul_add.exit.iter12
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter12 = add i32 %bs_mat_entries_used.14.iter12, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter12 = add nuw nsw i32 %c.05.iter12, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter12 = icmp eq i32 %add14.iter12, %95, !dbg !244
  br i1 %exitcond1.not.iter12, label %for.cond1.for.inc17_crit_edge.iter12, label %for.cond4.preheader.iter12, !dbg !155, !llvm.loop !245

for.inc17.iter12:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter12
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_12_end

for.cond4.preheader.iter12:                       ; preds = %for.cond4.preheader.lr.ph.iter12, %for.inc15.iter12
  %c.05.iter12 = phi i32 [ 12, %for.cond4.preheader.lr.ph.iter12 ], [ %inc.iter12, %for.inc15.iter12 ]
  %bs_mat_entries_used.14.iter12 = phi i32 [ %split.iter11, %for.cond4.preheader.lr.ph.iter12 ], [ %add14.iter12, %for.inc15.iter12 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter12, !dbg !239

for.cond4.preheader.lr.ph.iter12:                 ; preds = %for.cond1.preheader.iter12
  br label %for.cond4.preheader.iter12, !dbg !155

for.cond1.for.inc17_crit_edge.iter12:             ; preds = %for.inc15.iter12
  %split.iter12 = phi i32 [ %add14.iter12, %for.inc15.iter12 ]
  br label %for.inc17.iter12, !dbg !155

iter_12_end:                                      ; preds = %for.inc17.iter12
  br label %iter_13_start

iter_13_start:                                    ; preds = %iter_12_end
  br label %for.cond1.preheader.iter13

for.cond1.preheader.iter13:                       ; preds = %iter_13_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %103 = add i32 %split.iter12, 65, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter13, !dbg !155

for.body6.iter13:                                 ; preds = %for.cond4.preheader.iter13, %m_vec_mul_add.exit.iter13
  %k.02.iter13 = phi i32 [ 0, %for.cond4.preheader.iter13 ], [ %add13.iter13, %m_vec_mul_add.exit.iter13 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter13 = mul nsw i32 %bs_mat_entries_used.14.iter13, 40, !dbg !161
  %add.ptr.iter13 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter13, !dbg !161
  %mul8.iter13 = mul nuw nsw i32 %k.02.iter13, 78, !dbg !164
  %104 = getelementptr i8, ptr %mat, i32 %mul8.iter13, !dbg !165
  %arrayidx.iter13 = getelementptr i8, ptr %104, i32 %c.05.iter13, !dbg !165
  %105 = load i8, ptr %arrayidx.iter13, align 1, !dbg !165
  %add10.iter13 = add nuw nsw i32 130, %k.02.iter13, !dbg !166
  %add.ptr12.idx.iter13 = mul nuw nsw i32 %add10.iter13, 40, !dbg !167
  %add.ptr12.iter13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter13, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter13 = zext i8 %105 to i32, !dbg !185
  %mul.i.i.iter13 = mul i32 %conv.i.i.iter13, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter13 = and i32 %mul.i.i.iter13, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter13 = lshr exact i32 %and.i.i.iter13, 4, !dbg !191
  %shr1.i.i.iter13 = lshr exact i32 %and.i.i.iter13, 3, !dbg !192
  %106 = xor i32 %shr.i.i.iter13, %shr1.i.i.iter13, !dbg !193
  %xor2.i.i.iter13 = xor i32 %106, %mul.i.i.iter13, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter13, !dbg !199

for.body.i.iter13:                                ; preds = %for.body.i.iter13, %for.body6.iter13
  %i.0.i1.iter13 = phi i32 [ 0, %for.body6.iter13 ], [ %inc.i.iter13, %for.body.i.iter13 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.iter13, i32 %i.0.i1.iter13, !dbg !200
  %107 = load i64, ptr %arrayidx.i.iter13, align 8, !dbg !200
  %and.i.iter13 = and i64 %107, 1229782938247303441, !dbg !203
  %and1.i.iter13 = and i32 %xor2.i.i.iter13, 255, !dbg !204
  %conv.i.iter13 = zext nneg i32 %and1.i.iter13 to i64, !dbg !205
  %mul.i.iter13 = mul i64 %and.i.iter13, %conv.i.iter13, !dbg !206
  %shr.i.iter13 = lshr i64 %107, 1, !dbg !207
  %and3.i.iter13 = and i64 %shr.i.iter13, 1229782938247303441, !dbg !208
  %shr4.i.iter13 = lshr i32 %xor2.i.i.iter13, 8, !dbg !209
  %and5.i.iter13 = and i32 %shr4.i.iter13, 15, !dbg !210
  %conv6.i.iter13 = zext nneg i32 %and5.i.iter13 to i64, !dbg !211
  %mul7.i.iter13 = mul nuw i64 %and3.i.iter13, %conv6.i.iter13, !dbg !212
  %xor.i.iter13 = xor i64 %mul.i.iter13, %mul7.i.iter13, !dbg !213
  %arrayidx8.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.iter13, i32 %i.0.i1.iter13, !dbg !214
  %108 = load i64, ptr %arrayidx8.i.iter13, align 8, !dbg !214
  %shr9.i.iter13 = lshr i64 %108, 2, !dbg !215
  %and10.i.iter13 = and i64 %shr9.i.iter13, 1229782938247303441, !dbg !216
  %shr11.i.iter13 = lshr i32 %xor2.i.i.iter13, 16, !dbg !217
  %and12.i.iter13 = and i32 %shr11.i.iter13, 15, !dbg !218
  %conv13.i.iter13 = zext nneg i32 %and12.i.iter13 to i64, !dbg !219
  %mul14.i.iter13 = mul nuw i64 %and10.i.iter13, %conv13.i.iter13, !dbg !220
  %xor15.i.iter13 = xor i64 %xor.i.iter13, %mul14.i.iter13, !dbg !221
  %arrayidx16.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr.iter13, i32 %i.0.i1.iter13, !dbg !222
  %109 = load i64, ptr %arrayidx16.i.iter13, align 8, !dbg !222
  %shr17.i.iter13 = lshr i64 %109, 3, !dbg !223
  %and18.i.iter13 = and i64 %shr17.i.iter13, 1229782938247303441, !dbg !224
  %shr19.i.iter13 = lshr i32 %xor2.i.i.iter13, 24, !dbg !225
  %and20.i.iter13 = and i32 %shr19.i.iter13, 15, !dbg !226
  %conv21.i.iter13 = zext nneg i32 %and20.i.iter13 to i64, !dbg !227
  %mul22.i.iter13 = mul nuw i64 %and18.i.iter13, %conv21.i.iter13, !dbg !228
  %xor23.i.iter13 = xor i64 %xor15.i.iter13, %mul22.i.iter13, !dbg !229
  %arrayidx24.i.iter13 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter13, i32 %i.0.i1.iter13, !dbg !230
  %110 = load i64, ptr %arrayidx24.i.iter13, align 8, !dbg !231
  %xor25.i.iter13 = xor i64 %110, %xor23.i.iter13, !dbg !231
  store i64 %xor25.i.iter13, ptr %arrayidx24.i.iter13, align 8, !dbg !231
  %inc.i.iter13 = add nuw nsw i32 %i.0.i1.iter13, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter13 = icmp eq i32 %inc.i.iter13, 5, !dbg !233
  br i1 %exitcond.i.not.iter13, label %m_vec_mul_add.exit.iter13, label %for.body.i.iter13, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter13:                        ; preds = %for.body.i.iter13
  %add13.iter13 = add nuw nsw i32 %k.02.iter13, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter13 = icmp eq i32 %add13.iter13, 10, !dbg !238
  br i1 %exitcond.not.iter13, label %for.inc15.iter13, label %for.body6.iter13, !dbg !239, !llvm.loop !240

for.inc15.iter13:                                 ; preds = %m_vec_mul_add.exit.iter13
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter13 = add i32 %bs_mat_entries_used.14.iter13, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter13 = add nuw nsw i32 %c.05.iter13, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter13 = icmp eq i32 %add14.iter13, %103, !dbg !244
  br i1 %exitcond1.not.iter13, label %for.cond1.for.inc17_crit_edge.iter13, label %for.cond4.preheader.iter13, !dbg !155, !llvm.loop !245

for.inc17.iter13:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter13
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_13_end

for.cond4.preheader.iter13:                       ; preds = %for.cond4.preheader.lr.ph.iter13, %for.inc15.iter13
  %c.05.iter13 = phi i32 [ 13, %for.cond4.preheader.lr.ph.iter13 ], [ %inc.iter13, %for.inc15.iter13 ]
  %bs_mat_entries_used.14.iter13 = phi i32 [ %split.iter12, %for.cond4.preheader.lr.ph.iter13 ], [ %add14.iter13, %for.inc15.iter13 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter13, !dbg !239

for.cond4.preheader.lr.ph.iter13:                 ; preds = %for.cond1.preheader.iter13
  br label %for.cond4.preheader.iter13, !dbg !155

for.cond1.for.inc17_crit_edge.iter13:             ; preds = %for.inc15.iter13
  %split.iter13 = phi i32 [ %add14.iter13, %for.inc15.iter13 ]
  br label %for.inc17.iter13, !dbg !155

iter_13_end:                                      ; preds = %for.inc17.iter13
  br label %iter_14_start

iter_14_start:                                    ; preds = %iter_13_end
  br label %for.cond1.preheader.iter14

for.cond1.preheader.iter14:                       ; preds = %iter_14_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %111 = add i32 %split.iter13, 64, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter14, !dbg !155

for.body6.iter14:                                 ; preds = %for.cond4.preheader.iter14, %m_vec_mul_add.exit.iter14
  %k.02.iter14 = phi i32 [ 0, %for.cond4.preheader.iter14 ], [ %add13.iter14, %m_vec_mul_add.exit.iter14 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter14 = mul nsw i32 %bs_mat_entries_used.14.iter14, 40, !dbg !161
  %add.ptr.iter14 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter14, !dbg !161
  %mul8.iter14 = mul nuw nsw i32 %k.02.iter14, 78, !dbg !164
  %112 = getelementptr i8, ptr %mat, i32 %mul8.iter14, !dbg !165
  %arrayidx.iter14 = getelementptr i8, ptr %112, i32 %c.05.iter14, !dbg !165
  %113 = load i8, ptr %arrayidx.iter14, align 1, !dbg !165
  %add10.iter14 = add nuw nsw i32 140, %k.02.iter14, !dbg !166
  %add.ptr12.idx.iter14 = mul nuw nsw i32 %add10.iter14, 40, !dbg !167
  %add.ptr12.iter14 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter14, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter14 = zext i8 %113 to i32, !dbg !185
  %mul.i.i.iter14 = mul i32 %conv.i.i.iter14, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter14 = and i32 %mul.i.i.iter14, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter14 = lshr exact i32 %and.i.i.iter14, 4, !dbg !191
  %shr1.i.i.iter14 = lshr exact i32 %and.i.i.iter14, 3, !dbg !192
  %114 = xor i32 %shr.i.i.iter14, %shr1.i.i.iter14, !dbg !193
  %xor2.i.i.iter14 = xor i32 %114, %mul.i.i.iter14, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter14, !dbg !199

for.body.i.iter14:                                ; preds = %for.body.i.iter14, %for.body6.iter14
  %i.0.i1.iter14 = phi i32 [ 0, %for.body6.iter14 ], [ %inc.i.iter14, %for.body.i.iter14 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.iter14, i32 %i.0.i1.iter14, !dbg !200
  %115 = load i64, ptr %arrayidx.i.iter14, align 8, !dbg !200
  %and.i.iter14 = and i64 %115, 1229782938247303441, !dbg !203
  %and1.i.iter14 = and i32 %xor2.i.i.iter14, 255, !dbg !204
  %conv.i.iter14 = zext nneg i32 %and1.i.iter14 to i64, !dbg !205
  %mul.i.iter14 = mul i64 %and.i.iter14, %conv.i.iter14, !dbg !206
  %shr.i.iter14 = lshr i64 %115, 1, !dbg !207
  %and3.i.iter14 = and i64 %shr.i.iter14, 1229782938247303441, !dbg !208
  %shr4.i.iter14 = lshr i32 %xor2.i.i.iter14, 8, !dbg !209
  %and5.i.iter14 = and i32 %shr4.i.iter14, 15, !dbg !210
  %conv6.i.iter14 = zext nneg i32 %and5.i.iter14 to i64, !dbg !211
  %mul7.i.iter14 = mul nuw i64 %and3.i.iter14, %conv6.i.iter14, !dbg !212
  %xor.i.iter14 = xor i64 %mul.i.iter14, %mul7.i.iter14, !dbg !213
  %arrayidx8.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.iter14, i32 %i.0.i1.iter14, !dbg !214
  %116 = load i64, ptr %arrayidx8.i.iter14, align 8, !dbg !214
  %shr9.i.iter14 = lshr i64 %116, 2, !dbg !215
  %and10.i.iter14 = and i64 %shr9.i.iter14, 1229782938247303441, !dbg !216
  %shr11.i.iter14 = lshr i32 %xor2.i.i.iter14, 16, !dbg !217
  %and12.i.iter14 = and i32 %shr11.i.iter14, 15, !dbg !218
  %conv13.i.iter14 = zext nneg i32 %and12.i.iter14 to i64, !dbg !219
  %mul14.i.iter14 = mul nuw i64 %and10.i.iter14, %conv13.i.iter14, !dbg !220
  %xor15.i.iter14 = xor i64 %xor.i.iter14, %mul14.i.iter14, !dbg !221
  %arrayidx16.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr.iter14, i32 %i.0.i1.iter14, !dbg !222
  %117 = load i64, ptr %arrayidx16.i.iter14, align 8, !dbg !222
  %shr17.i.iter14 = lshr i64 %117, 3, !dbg !223
  %and18.i.iter14 = and i64 %shr17.i.iter14, 1229782938247303441, !dbg !224
  %shr19.i.iter14 = lshr i32 %xor2.i.i.iter14, 24, !dbg !225
  %and20.i.iter14 = and i32 %shr19.i.iter14, 15, !dbg !226
  %conv21.i.iter14 = zext nneg i32 %and20.i.iter14 to i64, !dbg !227
  %mul22.i.iter14 = mul nuw i64 %and18.i.iter14, %conv21.i.iter14, !dbg !228
  %xor23.i.iter14 = xor i64 %xor15.i.iter14, %mul22.i.iter14, !dbg !229
  %arrayidx24.i.iter14 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter14, i32 %i.0.i1.iter14, !dbg !230
  %118 = load i64, ptr %arrayidx24.i.iter14, align 8, !dbg !231
  %xor25.i.iter14 = xor i64 %118, %xor23.i.iter14, !dbg !231
  store i64 %xor25.i.iter14, ptr %arrayidx24.i.iter14, align 8, !dbg !231
  %inc.i.iter14 = add nuw nsw i32 %i.0.i1.iter14, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter14 = icmp eq i32 %inc.i.iter14, 5, !dbg !233
  br i1 %exitcond.i.not.iter14, label %m_vec_mul_add.exit.iter14, label %for.body.i.iter14, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter14:                        ; preds = %for.body.i.iter14
  %add13.iter14 = add nuw nsw i32 %k.02.iter14, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter14 = icmp eq i32 %add13.iter14, 10, !dbg !238
  br i1 %exitcond.not.iter14, label %for.inc15.iter14, label %for.body6.iter14, !dbg !239, !llvm.loop !240

for.inc15.iter14:                                 ; preds = %m_vec_mul_add.exit.iter14
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter14 = add i32 %bs_mat_entries_used.14.iter14, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter14 = add nuw nsw i32 %c.05.iter14, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter14 = icmp eq i32 %add14.iter14, %111, !dbg !244
  br i1 %exitcond1.not.iter14, label %for.cond1.for.inc17_crit_edge.iter14, label %for.cond4.preheader.iter14, !dbg !155, !llvm.loop !245

for.inc17.iter14:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter14
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_14_end

for.cond4.preheader.iter14:                       ; preds = %for.cond4.preheader.lr.ph.iter14, %for.inc15.iter14
  %c.05.iter14 = phi i32 [ 14, %for.cond4.preheader.lr.ph.iter14 ], [ %inc.iter14, %for.inc15.iter14 ]
  %bs_mat_entries_used.14.iter14 = phi i32 [ %split.iter13, %for.cond4.preheader.lr.ph.iter14 ], [ %add14.iter14, %for.inc15.iter14 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter14, !dbg !239

for.cond4.preheader.lr.ph.iter14:                 ; preds = %for.cond1.preheader.iter14
  br label %for.cond4.preheader.iter14, !dbg !155

for.cond1.for.inc17_crit_edge.iter14:             ; preds = %for.inc15.iter14
  %split.iter14 = phi i32 [ %add14.iter14, %for.inc15.iter14 ]
  br label %for.inc17.iter14, !dbg !155

iter_14_end:                                      ; preds = %for.inc17.iter14
  br label %iter_15_start

iter_15_start:                                    ; preds = %iter_14_end
  br label %for.cond1.preheader.iter15

for.cond1.preheader.iter15:                       ; preds = %iter_15_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %119 = add i32 %split.iter14, 63, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter15, !dbg !155

for.body6.iter15:                                 ; preds = %for.cond4.preheader.iter15, %m_vec_mul_add.exit.iter15
  %k.02.iter15 = phi i32 [ 0, %for.cond4.preheader.iter15 ], [ %add13.iter15, %m_vec_mul_add.exit.iter15 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter15 = mul nsw i32 %bs_mat_entries_used.14.iter15, 40, !dbg !161
  %add.ptr.iter15 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter15, !dbg !161
  %mul8.iter15 = mul nuw nsw i32 %k.02.iter15, 78, !dbg !164
  %120 = getelementptr i8, ptr %mat, i32 %mul8.iter15, !dbg !165
  %arrayidx.iter15 = getelementptr i8, ptr %120, i32 %c.05.iter15, !dbg !165
  %121 = load i8, ptr %arrayidx.iter15, align 1, !dbg !165
  %add10.iter15 = add nuw nsw i32 150, %k.02.iter15, !dbg !166
  %add.ptr12.idx.iter15 = mul nuw nsw i32 %add10.iter15, 40, !dbg !167
  %add.ptr12.iter15 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter15, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter15 = zext i8 %121 to i32, !dbg !185
  %mul.i.i.iter15 = mul i32 %conv.i.i.iter15, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter15 = and i32 %mul.i.i.iter15, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter15 = lshr exact i32 %and.i.i.iter15, 4, !dbg !191
  %shr1.i.i.iter15 = lshr exact i32 %and.i.i.iter15, 3, !dbg !192
  %122 = xor i32 %shr.i.i.iter15, %shr1.i.i.iter15, !dbg !193
  %xor2.i.i.iter15 = xor i32 %122, %mul.i.i.iter15, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter15, !dbg !199

for.body.i.iter15:                                ; preds = %for.body.i.iter15, %for.body6.iter15
  %i.0.i1.iter15 = phi i32 [ 0, %for.body6.iter15 ], [ %inc.i.iter15, %for.body.i.iter15 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.iter15, i32 %i.0.i1.iter15, !dbg !200
  %123 = load i64, ptr %arrayidx.i.iter15, align 8, !dbg !200
  %and.i.iter15 = and i64 %123, 1229782938247303441, !dbg !203
  %and1.i.iter15 = and i32 %xor2.i.i.iter15, 255, !dbg !204
  %conv.i.iter15 = zext nneg i32 %and1.i.iter15 to i64, !dbg !205
  %mul.i.iter15 = mul i64 %and.i.iter15, %conv.i.iter15, !dbg !206
  %shr.i.iter15 = lshr i64 %123, 1, !dbg !207
  %and3.i.iter15 = and i64 %shr.i.iter15, 1229782938247303441, !dbg !208
  %shr4.i.iter15 = lshr i32 %xor2.i.i.iter15, 8, !dbg !209
  %and5.i.iter15 = and i32 %shr4.i.iter15, 15, !dbg !210
  %conv6.i.iter15 = zext nneg i32 %and5.i.iter15 to i64, !dbg !211
  %mul7.i.iter15 = mul nuw i64 %and3.i.iter15, %conv6.i.iter15, !dbg !212
  %xor.i.iter15 = xor i64 %mul.i.iter15, %mul7.i.iter15, !dbg !213
  %arrayidx8.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.iter15, i32 %i.0.i1.iter15, !dbg !214
  %124 = load i64, ptr %arrayidx8.i.iter15, align 8, !dbg !214
  %shr9.i.iter15 = lshr i64 %124, 2, !dbg !215
  %and10.i.iter15 = and i64 %shr9.i.iter15, 1229782938247303441, !dbg !216
  %shr11.i.iter15 = lshr i32 %xor2.i.i.iter15, 16, !dbg !217
  %and12.i.iter15 = and i32 %shr11.i.iter15, 15, !dbg !218
  %conv13.i.iter15 = zext nneg i32 %and12.i.iter15 to i64, !dbg !219
  %mul14.i.iter15 = mul nuw i64 %and10.i.iter15, %conv13.i.iter15, !dbg !220
  %xor15.i.iter15 = xor i64 %xor.i.iter15, %mul14.i.iter15, !dbg !221
  %arrayidx16.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr.iter15, i32 %i.0.i1.iter15, !dbg !222
  %125 = load i64, ptr %arrayidx16.i.iter15, align 8, !dbg !222
  %shr17.i.iter15 = lshr i64 %125, 3, !dbg !223
  %and18.i.iter15 = and i64 %shr17.i.iter15, 1229782938247303441, !dbg !224
  %shr19.i.iter15 = lshr i32 %xor2.i.i.iter15, 24, !dbg !225
  %and20.i.iter15 = and i32 %shr19.i.iter15, 15, !dbg !226
  %conv21.i.iter15 = zext nneg i32 %and20.i.iter15 to i64, !dbg !227
  %mul22.i.iter15 = mul nuw i64 %and18.i.iter15, %conv21.i.iter15, !dbg !228
  %xor23.i.iter15 = xor i64 %xor15.i.iter15, %mul22.i.iter15, !dbg !229
  %arrayidx24.i.iter15 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter15, i32 %i.0.i1.iter15, !dbg !230
  %126 = load i64, ptr %arrayidx24.i.iter15, align 8, !dbg !231
  %xor25.i.iter15 = xor i64 %126, %xor23.i.iter15, !dbg !231
  store i64 %xor25.i.iter15, ptr %arrayidx24.i.iter15, align 8, !dbg !231
  %inc.i.iter15 = add nuw nsw i32 %i.0.i1.iter15, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter15 = icmp eq i32 %inc.i.iter15, 5, !dbg !233
  br i1 %exitcond.i.not.iter15, label %m_vec_mul_add.exit.iter15, label %for.body.i.iter15, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter15:                        ; preds = %for.body.i.iter15
  %add13.iter15 = add nuw nsw i32 %k.02.iter15, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter15 = icmp eq i32 %add13.iter15, 10, !dbg !238
  br i1 %exitcond.not.iter15, label %for.inc15.iter15, label %for.body6.iter15, !dbg !239, !llvm.loop !240

for.inc15.iter15:                                 ; preds = %m_vec_mul_add.exit.iter15
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter15 = add i32 %bs_mat_entries_used.14.iter15, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter15 = add nuw nsw i32 %c.05.iter15, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter15 = icmp eq i32 %add14.iter15, %119, !dbg !244
  br i1 %exitcond1.not.iter15, label %for.cond1.for.inc17_crit_edge.iter15, label %for.cond4.preheader.iter15, !dbg !155, !llvm.loop !245

for.inc17.iter15:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter15
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_15_end

for.cond4.preheader.iter15:                       ; preds = %for.cond4.preheader.lr.ph.iter15, %for.inc15.iter15
  %c.05.iter15 = phi i32 [ 15, %for.cond4.preheader.lr.ph.iter15 ], [ %inc.iter15, %for.inc15.iter15 ]
  %bs_mat_entries_used.14.iter15 = phi i32 [ %split.iter14, %for.cond4.preheader.lr.ph.iter15 ], [ %add14.iter15, %for.inc15.iter15 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter15, !dbg !239

for.cond4.preheader.lr.ph.iter15:                 ; preds = %for.cond1.preheader.iter15
  br label %for.cond4.preheader.iter15, !dbg !155

for.cond1.for.inc17_crit_edge.iter15:             ; preds = %for.inc15.iter15
  %split.iter15 = phi i32 [ %add14.iter15, %for.inc15.iter15 ]
  br label %for.inc17.iter15, !dbg !155

iter_15_end:                                      ; preds = %for.inc17.iter15
  br label %iter_16_start

iter_16_start:                                    ; preds = %iter_15_end
  br label %for.cond1.preheader.iter16

for.cond1.preheader.iter16:                       ; preds = %iter_16_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %127 = add i32 %split.iter15, 62, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter16, !dbg !155

for.body6.iter16:                                 ; preds = %for.cond4.preheader.iter16, %m_vec_mul_add.exit.iter16
  %k.02.iter16 = phi i32 [ 0, %for.cond4.preheader.iter16 ], [ %add13.iter16, %m_vec_mul_add.exit.iter16 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter16 = mul nsw i32 %bs_mat_entries_used.14.iter16, 40, !dbg !161
  %add.ptr.iter16 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter16, !dbg !161
  %mul8.iter16 = mul nuw nsw i32 %k.02.iter16, 78, !dbg !164
  %128 = getelementptr i8, ptr %mat, i32 %mul8.iter16, !dbg !165
  %arrayidx.iter16 = getelementptr i8, ptr %128, i32 %c.05.iter16, !dbg !165
  %129 = load i8, ptr %arrayidx.iter16, align 1, !dbg !165
  %add10.iter16 = add nuw nsw i32 160, %k.02.iter16, !dbg !166
  %add.ptr12.idx.iter16 = mul nuw nsw i32 %add10.iter16, 40, !dbg !167
  %add.ptr12.iter16 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter16, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter16 = zext i8 %129 to i32, !dbg !185
  %mul.i.i.iter16 = mul i32 %conv.i.i.iter16, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter16 = and i32 %mul.i.i.iter16, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter16 = lshr exact i32 %and.i.i.iter16, 4, !dbg !191
  %shr1.i.i.iter16 = lshr exact i32 %and.i.i.iter16, 3, !dbg !192
  %130 = xor i32 %shr.i.i.iter16, %shr1.i.i.iter16, !dbg !193
  %xor2.i.i.iter16 = xor i32 %130, %mul.i.i.iter16, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter16, !dbg !199

for.body.i.iter16:                                ; preds = %for.body.i.iter16, %for.body6.iter16
  %i.0.i1.iter16 = phi i32 [ 0, %for.body6.iter16 ], [ %inc.i.iter16, %for.body.i.iter16 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.iter16, i32 %i.0.i1.iter16, !dbg !200
  %131 = load i64, ptr %arrayidx.i.iter16, align 8, !dbg !200
  %and.i.iter16 = and i64 %131, 1229782938247303441, !dbg !203
  %and1.i.iter16 = and i32 %xor2.i.i.iter16, 255, !dbg !204
  %conv.i.iter16 = zext nneg i32 %and1.i.iter16 to i64, !dbg !205
  %mul.i.iter16 = mul i64 %and.i.iter16, %conv.i.iter16, !dbg !206
  %shr.i.iter16 = lshr i64 %131, 1, !dbg !207
  %and3.i.iter16 = and i64 %shr.i.iter16, 1229782938247303441, !dbg !208
  %shr4.i.iter16 = lshr i32 %xor2.i.i.iter16, 8, !dbg !209
  %and5.i.iter16 = and i32 %shr4.i.iter16, 15, !dbg !210
  %conv6.i.iter16 = zext nneg i32 %and5.i.iter16 to i64, !dbg !211
  %mul7.i.iter16 = mul nuw i64 %and3.i.iter16, %conv6.i.iter16, !dbg !212
  %xor.i.iter16 = xor i64 %mul.i.iter16, %mul7.i.iter16, !dbg !213
  %arrayidx8.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.iter16, i32 %i.0.i1.iter16, !dbg !214
  %132 = load i64, ptr %arrayidx8.i.iter16, align 8, !dbg !214
  %shr9.i.iter16 = lshr i64 %132, 2, !dbg !215
  %and10.i.iter16 = and i64 %shr9.i.iter16, 1229782938247303441, !dbg !216
  %shr11.i.iter16 = lshr i32 %xor2.i.i.iter16, 16, !dbg !217
  %and12.i.iter16 = and i32 %shr11.i.iter16, 15, !dbg !218
  %conv13.i.iter16 = zext nneg i32 %and12.i.iter16 to i64, !dbg !219
  %mul14.i.iter16 = mul nuw i64 %and10.i.iter16, %conv13.i.iter16, !dbg !220
  %xor15.i.iter16 = xor i64 %xor.i.iter16, %mul14.i.iter16, !dbg !221
  %arrayidx16.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr.iter16, i32 %i.0.i1.iter16, !dbg !222
  %133 = load i64, ptr %arrayidx16.i.iter16, align 8, !dbg !222
  %shr17.i.iter16 = lshr i64 %133, 3, !dbg !223
  %and18.i.iter16 = and i64 %shr17.i.iter16, 1229782938247303441, !dbg !224
  %shr19.i.iter16 = lshr i32 %xor2.i.i.iter16, 24, !dbg !225
  %and20.i.iter16 = and i32 %shr19.i.iter16, 15, !dbg !226
  %conv21.i.iter16 = zext nneg i32 %and20.i.iter16 to i64, !dbg !227
  %mul22.i.iter16 = mul nuw i64 %and18.i.iter16, %conv21.i.iter16, !dbg !228
  %xor23.i.iter16 = xor i64 %xor15.i.iter16, %mul22.i.iter16, !dbg !229
  %arrayidx24.i.iter16 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter16, i32 %i.0.i1.iter16, !dbg !230
  %134 = load i64, ptr %arrayidx24.i.iter16, align 8, !dbg !231
  %xor25.i.iter16 = xor i64 %134, %xor23.i.iter16, !dbg !231
  store i64 %xor25.i.iter16, ptr %arrayidx24.i.iter16, align 8, !dbg !231
  %inc.i.iter16 = add nuw nsw i32 %i.0.i1.iter16, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter16 = icmp eq i32 %inc.i.iter16, 5, !dbg !233
  br i1 %exitcond.i.not.iter16, label %m_vec_mul_add.exit.iter16, label %for.body.i.iter16, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter16:                        ; preds = %for.body.i.iter16
  %add13.iter16 = add nuw nsw i32 %k.02.iter16, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter16 = icmp eq i32 %add13.iter16, 10, !dbg !238
  br i1 %exitcond.not.iter16, label %for.inc15.iter16, label %for.body6.iter16, !dbg !239, !llvm.loop !240

for.inc15.iter16:                                 ; preds = %m_vec_mul_add.exit.iter16
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter16 = add i32 %bs_mat_entries_used.14.iter16, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter16 = add nuw nsw i32 %c.05.iter16, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter16 = icmp eq i32 %add14.iter16, %127, !dbg !244
  br i1 %exitcond1.not.iter16, label %for.cond1.for.inc17_crit_edge.iter16, label %for.cond4.preheader.iter16, !dbg !155, !llvm.loop !245

for.inc17.iter16:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter16
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_16_end

for.cond4.preheader.iter16:                       ; preds = %for.cond4.preheader.lr.ph.iter16, %for.inc15.iter16
  %c.05.iter16 = phi i32 [ 16, %for.cond4.preheader.lr.ph.iter16 ], [ %inc.iter16, %for.inc15.iter16 ]
  %bs_mat_entries_used.14.iter16 = phi i32 [ %split.iter15, %for.cond4.preheader.lr.ph.iter16 ], [ %add14.iter16, %for.inc15.iter16 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter16, !dbg !239

for.cond4.preheader.lr.ph.iter16:                 ; preds = %for.cond1.preheader.iter16
  br label %for.cond4.preheader.iter16, !dbg !155

for.cond1.for.inc17_crit_edge.iter16:             ; preds = %for.inc15.iter16
  %split.iter16 = phi i32 [ %add14.iter16, %for.inc15.iter16 ]
  br label %for.inc17.iter16, !dbg !155

iter_16_end:                                      ; preds = %for.inc17.iter16
  br label %iter_17_start

iter_17_start:                                    ; preds = %iter_16_end
  br label %for.cond1.preheader.iter17

for.cond1.preheader.iter17:                       ; preds = %iter_17_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %135 = add i32 %split.iter16, 61, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter17, !dbg !155

for.body6.iter17:                                 ; preds = %for.cond4.preheader.iter17, %m_vec_mul_add.exit.iter17
  %k.02.iter17 = phi i32 [ 0, %for.cond4.preheader.iter17 ], [ %add13.iter17, %m_vec_mul_add.exit.iter17 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter17 = mul nsw i32 %bs_mat_entries_used.14.iter17, 40, !dbg !161
  %add.ptr.iter17 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter17, !dbg !161
  %mul8.iter17 = mul nuw nsw i32 %k.02.iter17, 78, !dbg !164
  %136 = getelementptr i8, ptr %mat, i32 %mul8.iter17, !dbg !165
  %arrayidx.iter17 = getelementptr i8, ptr %136, i32 %c.05.iter17, !dbg !165
  %137 = load i8, ptr %arrayidx.iter17, align 1, !dbg !165
  %add10.iter17 = add nuw nsw i32 170, %k.02.iter17, !dbg !166
  %add.ptr12.idx.iter17 = mul nuw nsw i32 %add10.iter17, 40, !dbg !167
  %add.ptr12.iter17 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter17, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter17 = zext i8 %137 to i32, !dbg !185
  %mul.i.i.iter17 = mul i32 %conv.i.i.iter17, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter17 = and i32 %mul.i.i.iter17, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter17 = lshr exact i32 %and.i.i.iter17, 4, !dbg !191
  %shr1.i.i.iter17 = lshr exact i32 %and.i.i.iter17, 3, !dbg !192
  %138 = xor i32 %shr.i.i.iter17, %shr1.i.i.iter17, !dbg !193
  %xor2.i.i.iter17 = xor i32 %138, %mul.i.i.iter17, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter17, !dbg !199

for.body.i.iter17:                                ; preds = %for.body.i.iter17, %for.body6.iter17
  %i.0.i1.iter17 = phi i32 [ 0, %for.body6.iter17 ], [ %inc.i.iter17, %for.body.i.iter17 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.iter17, i32 %i.0.i1.iter17, !dbg !200
  %139 = load i64, ptr %arrayidx.i.iter17, align 8, !dbg !200
  %and.i.iter17 = and i64 %139, 1229782938247303441, !dbg !203
  %and1.i.iter17 = and i32 %xor2.i.i.iter17, 255, !dbg !204
  %conv.i.iter17 = zext nneg i32 %and1.i.iter17 to i64, !dbg !205
  %mul.i.iter17 = mul i64 %and.i.iter17, %conv.i.iter17, !dbg !206
  %shr.i.iter17 = lshr i64 %139, 1, !dbg !207
  %and3.i.iter17 = and i64 %shr.i.iter17, 1229782938247303441, !dbg !208
  %shr4.i.iter17 = lshr i32 %xor2.i.i.iter17, 8, !dbg !209
  %and5.i.iter17 = and i32 %shr4.i.iter17, 15, !dbg !210
  %conv6.i.iter17 = zext nneg i32 %and5.i.iter17 to i64, !dbg !211
  %mul7.i.iter17 = mul nuw i64 %and3.i.iter17, %conv6.i.iter17, !dbg !212
  %xor.i.iter17 = xor i64 %mul.i.iter17, %mul7.i.iter17, !dbg !213
  %arrayidx8.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.iter17, i32 %i.0.i1.iter17, !dbg !214
  %140 = load i64, ptr %arrayidx8.i.iter17, align 8, !dbg !214
  %shr9.i.iter17 = lshr i64 %140, 2, !dbg !215
  %and10.i.iter17 = and i64 %shr9.i.iter17, 1229782938247303441, !dbg !216
  %shr11.i.iter17 = lshr i32 %xor2.i.i.iter17, 16, !dbg !217
  %and12.i.iter17 = and i32 %shr11.i.iter17, 15, !dbg !218
  %conv13.i.iter17 = zext nneg i32 %and12.i.iter17 to i64, !dbg !219
  %mul14.i.iter17 = mul nuw i64 %and10.i.iter17, %conv13.i.iter17, !dbg !220
  %xor15.i.iter17 = xor i64 %xor.i.iter17, %mul14.i.iter17, !dbg !221
  %arrayidx16.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr.iter17, i32 %i.0.i1.iter17, !dbg !222
  %141 = load i64, ptr %arrayidx16.i.iter17, align 8, !dbg !222
  %shr17.i.iter17 = lshr i64 %141, 3, !dbg !223
  %and18.i.iter17 = and i64 %shr17.i.iter17, 1229782938247303441, !dbg !224
  %shr19.i.iter17 = lshr i32 %xor2.i.i.iter17, 24, !dbg !225
  %and20.i.iter17 = and i32 %shr19.i.iter17, 15, !dbg !226
  %conv21.i.iter17 = zext nneg i32 %and20.i.iter17 to i64, !dbg !227
  %mul22.i.iter17 = mul nuw i64 %and18.i.iter17, %conv21.i.iter17, !dbg !228
  %xor23.i.iter17 = xor i64 %xor15.i.iter17, %mul22.i.iter17, !dbg !229
  %arrayidx24.i.iter17 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter17, i32 %i.0.i1.iter17, !dbg !230
  %142 = load i64, ptr %arrayidx24.i.iter17, align 8, !dbg !231
  %xor25.i.iter17 = xor i64 %142, %xor23.i.iter17, !dbg !231
  store i64 %xor25.i.iter17, ptr %arrayidx24.i.iter17, align 8, !dbg !231
  %inc.i.iter17 = add nuw nsw i32 %i.0.i1.iter17, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter17 = icmp eq i32 %inc.i.iter17, 5, !dbg !233
  br i1 %exitcond.i.not.iter17, label %m_vec_mul_add.exit.iter17, label %for.body.i.iter17, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter17:                        ; preds = %for.body.i.iter17
  %add13.iter17 = add nuw nsw i32 %k.02.iter17, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter17 = icmp eq i32 %add13.iter17, 10, !dbg !238
  br i1 %exitcond.not.iter17, label %for.inc15.iter17, label %for.body6.iter17, !dbg !239, !llvm.loop !240

for.inc15.iter17:                                 ; preds = %m_vec_mul_add.exit.iter17
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter17 = add i32 %bs_mat_entries_used.14.iter17, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter17 = add nuw nsw i32 %c.05.iter17, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter17 = icmp eq i32 %add14.iter17, %135, !dbg !244
  br i1 %exitcond1.not.iter17, label %for.cond1.for.inc17_crit_edge.iter17, label %for.cond4.preheader.iter17, !dbg !155, !llvm.loop !245

for.inc17.iter17:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter17
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_17_end

for.cond4.preheader.iter17:                       ; preds = %for.cond4.preheader.lr.ph.iter17, %for.inc15.iter17
  %c.05.iter17 = phi i32 [ 17, %for.cond4.preheader.lr.ph.iter17 ], [ %inc.iter17, %for.inc15.iter17 ]
  %bs_mat_entries_used.14.iter17 = phi i32 [ %split.iter16, %for.cond4.preheader.lr.ph.iter17 ], [ %add14.iter17, %for.inc15.iter17 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter17, !dbg !239

for.cond4.preheader.lr.ph.iter17:                 ; preds = %for.cond1.preheader.iter17
  br label %for.cond4.preheader.iter17, !dbg !155

for.cond1.for.inc17_crit_edge.iter17:             ; preds = %for.inc15.iter17
  %split.iter17 = phi i32 [ %add14.iter17, %for.inc15.iter17 ]
  br label %for.inc17.iter17, !dbg !155

iter_17_end:                                      ; preds = %for.inc17.iter17
  br label %iter_18_start

iter_18_start:                                    ; preds = %iter_17_end
  br label %for.cond1.preheader.iter18

for.cond1.preheader.iter18:                       ; preds = %iter_18_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %143 = add i32 %split.iter17, 60, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter18, !dbg !155

for.body6.iter18:                                 ; preds = %for.cond4.preheader.iter18, %m_vec_mul_add.exit.iter18
  %k.02.iter18 = phi i32 [ 0, %for.cond4.preheader.iter18 ], [ %add13.iter18, %m_vec_mul_add.exit.iter18 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter18 = mul nsw i32 %bs_mat_entries_used.14.iter18, 40, !dbg !161
  %add.ptr.iter18 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter18, !dbg !161
  %mul8.iter18 = mul nuw nsw i32 %k.02.iter18, 78, !dbg !164
  %144 = getelementptr i8, ptr %mat, i32 %mul8.iter18, !dbg !165
  %arrayidx.iter18 = getelementptr i8, ptr %144, i32 %c.05.iter18, !dbg !165
  %145 = load i8, ptr %arrayidx.iter18, align 1, !dbg !165
  %add10.iter18 = add nuw nsw i32 180, %k.02.iter18, !dbg !166
  %add.ptr12.idx.iter18 = mul nuw nsw i32 %add10.iter18, 40, !dbg !167
  %add.ptr12.iter18 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter18, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter18 = zext i8 %145 to i32, !dbg !185
  %mul.i.i.iter18 = mul i32 %conv.i.i.iter18, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter18 = and i32 %mul.i.i.iter18, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter18 = lshr exact i32 %and.i.i.iter18, 4, !dbg !191
  %shr1.i.i.iter18 = lshr exact i32 %and.i.i.iter18, 3, !dbg !192
  %146 = xor i32 %shr.i.i.iter18, %shr1.i.i.iter18, !dbg !193
  %xor2.i.i.iter18 = xor i32 %146, %mul.i.i.iter18, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter18, !dbg !199

for.body.i.iter18:                                ; preds = %for.body.i.iter18, %for.body6.iter18
  %i.0.i1.iter18 = phi i32 [ 0, %for.body6.iter18 ], [ %inc.i.iter18, %for.body.i.iter18 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.iter18, i32 %i.0.i1.iter18, !dbg !200
  %147 = load i64, ptr %arrayidx.i.iter18, align 8, !dbg !200
  %and.i.iter18 = and i64 %147, 1229782938247303441, !dbg !203
  %and1.i.iter18 = and i32 %xor2.i.i.iter18, 255, !dbg !204
  %conv.i.iter18 = zext nneg i32 %and1.i.iter18 to i64, !dbg !205
  %mul.i.iter18 = mul i64 %and.i.iter18, %conv.i.iter18, !dbg !206
  %shr.i.iter18 = lshr i64 %147, 1, !dbg !207
  %and3.i.iter18 = and i64 %shr.i.iter18, 1229782938247303441, !dbg !208
  %shr4.i.iter18 = lshr i32 %xor2.i.i.iter18, 8, !dbg !209
  %and5.i.iter18 = and i32 %shr4.i.iter18, 15, !dbg !210
  %conv6.i.iter18 = zext nneg i32 %and5.i.iter18 to i64, !dbg !211
  %mul7.i.iter18 = mul nuw i64 %and3.i.iter18, %conv6.i.iter18, !dbg !212
  %xor.i.iter18 = xor i64 %mul.i.iter18, %mul7.i.iter18, !dbg !213
  %arrayidx8.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.iter18, i32 %i.0.i1.iter18, !dbg !214
  %148 = load i64, ptr %arrayidx8.i.iter18, align 8, !dbg !214
  %shr9.i.iter18 = lshr i64 %148, 2, !dbg !215
  %and10.i.iter18 = and i64 %shr9.i.iter18, 1229782938247303441, !dbg !216
  %shr11.i.iter18 = lshr i32 %xor2.i.i.iter18, 16, !dbg !217
  %and12.i.iter18 = and i32 %shr11.i.iter18, 15, !dbg !218
  %conv13.i.iter18 = zext nneg i32 %and12.i.iter18 to i64, !dbg !219
  %mul14.i.iter18 = mul nuw i64 %and10.i.iter18, %conv13.i.iter18, !dbg !220
  %xor15.i.iter18 = xor i64 %xor.i.iter18, %mul14.i.iter18, !dbg !221
  %arrayidx16.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr.iter18, i32 %i.0.i1.iter18, !dbg !222
  %149 = load i64, ptr %arrayidx16.i.iter18, align 8, !dbg !222
  %shr17.i.iter18 = lshr i64 %149, 3, !dbg !223
  %and18.i.iter18 = and i64 %shr17.i.iter18, 1229782938247303441, !dbg !224
  %shr19.i.iter18 = lshr i32 %xor2.i.i.iter18, 24, !dbg !225
  %and20.i.iter18 = and i32 %shr19.i.iter18, 15, !dbg !226
  %conv21.i.iter18 = zext nneg i32 %and20.i.iter18 to i64, !dbg !227
  %mul22.i.iter18 = mul nuw i64 %and18.i.iter18, %conv21.i.iter18, !dbg !228
  %xor23.i.iter18 = xor i64 %xor15.i.iter18, %mul22.i.iter18, !dbg !229
  %arrayidx24.i.iter18 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter18, i32 %i.0.i1.iter18, !dbg !230
  %150 = load i64, ptr %arrayidx24.i.iter18, align 8, !dbg !231
  %xor25.i.iter18 = xor i64 %150, %xor23.i.iter18, !dbg !231
  store i64 %xor25.i.iter18, ptr %arrayidx24.i.iter18, align 8, !dbg !231
  %inc.i.iter18 = add nuw nsw i32 %i.0.i1.iter18, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter18 = icmp eq i32 %inc.i.iter18, 5, !dbg !233
  br i1 %exitcond.i.not.iter18, label %m_vec_mul_add.exit.iter18, label %for.body.i.iter18, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter18:                        ; preds = %for.body.i.iter18
  %add13.iter18 = add nuw nsw i32 %k.02.iter18, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter18 = icmp eq i32 %add13.iter18, 10, !dbg !238
  br i1 %exitcond.not.iter18, label %for.inc15.iter18, label %for.body6.iter18, !dbg !239, !llvm.loop !240

for.inc15.iter18:                                 ; preds = %m_vec_mul_add.exit.iter18
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter18 = add i32 %bs_mat_entries_used.14.iter18, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter18 = add nuw nsw i32 %c.05.iter18, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter18 = icmp eq i32 %add14.iter18, %143, !dbg !244
  br i1 %exitcond1.not.iter18, label %for.cond1.for.inc17_crit_edge.iter18, label %for.cond4.preheader.iter18, !dbg !155, !llvm.loop !245

for.inc17.iter18:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter18
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_18_end

for.cond4.preheader.iter18:                       ; preds = %for.cond4.preheader.lr.ph.iter18, %for.inc15.iter18
  %c.05.iter18 = phi i32 [ 18, %for.cond4.preheader.lr.ph.iter18 ], [ %inc.iter18, %for.inc15.iter18 ]
  %bs_mat_entries_used.14.iter18 = phi i32 [ %split.iter17, %for.cond4.preheader.lr.ph.iter18 ], [ %add14.iter18, %for.inc15.iter18 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter18, !dbg !239

for.cond4.preheader.lr.ph.iter18:                 ; preds = %for.cond1.preheader.iter18
  br label %for.cond4.preheader.iter18, !dbg !155

for.cond1.for.inc17_crit_edge.iter18:             ; preds = %for.inc15.iter18
  %split.iter18 = phi i32 [ %add14.iter18, %for.inc15.iter18 ]
  br label %for.inc17.iter18, !dbg !155

iter_18_end:                                      ; preds = %for.inc17.iter18
  br label %iter_19_start

iter_19_start:                                    ; preds = %iter_18_end
  br label %for.cond1.preheader.iter19

for.cond1.preheader.iter19:                       ; preds = %iter_19_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %151 = add i32 %split.iter18, 59, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter19, !dbg !155

for.body6.iter19:                                 ; preds = %for.cond4.preheader.iter19, %m_vec_mul_add.exit.iter19
  %k.02.iter19 = phi i32 [ 0, %for.cond4.preheader.iter19 ], [ %add13.iter19, %m_vec_mul_add.exit.iter19 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter19 = mul nsw i32 %bs_mat_entries_used.14.iter19, 40, !dbg !161
  %add.ptr.iter19 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter19, !dbg !161
  %mul8.iter19 = mul nuw nsw i32 %k.02.iter19, 78, !dbg !164
  %152 = getelementptr i8, ptr %mat, i32 %mul8.iter19, !dbg !165
  %arrayidx.iter19 = getelementptr i8, ptr %152, i32 %c.05.iter19, !dbg !165
  %153 = load i8, ptr %arrayidx.iter19, align 1, !dbg !165
  %add10.iter19 = add nuw nsw i32 190, %k.02.iter19, !dbg !166
  %add.ptr12.idx.iter19 = mul nuw nsw i32 %add10.iter19, 40, !dbg !167
  %add.ptr12.iter19 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter19, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter19 = zext i8 %153 to i32, !dbg !185
  %mul.i.i.iter19 = mul i32 %conv.i.i.iter19, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter19 = and i32 %mul.i.i.iter19, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter19 = lshr exact i32 %and.i.i.iter19, 4, !dbg !191
  %shr1.i.i.iter19 = lshr exact i32 %and.i.i.iter19, 3, !dbg !192
  %154 = xor i32 %shr.i.i.iter19, %shr1.i.i.iter19, !dbg !193
  %xor2.i.i.iter19 = xor i32 %154, %mul.i.i.iter19, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter19, !dbg !199

for.body.i.iter19:                                ; preds = %for.body.i.iter19, %for.body6.iter19
  %i.0.i1.iter19 = phi i32 [ 0, %for.body6.iter19 ], [ %inc.i.iter19, %for.body.i.iter19 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.iter19, i32 %i.0.i1.iter19, !dbg !200
  %155 = load i64, ptr %arrayidx.i.iter19, align 8, !dbg !200
  %and.i.iter19 = and i64 %155, 1229782938247303441, !dbg !203
  %and1.i.iter19 = and i32 %xor2.i.i.iter19, 255, !dbg !204
  %conv.i.iter19 = zext nneg i32 %and1.i.iter19 to i64, !dbg !205
  %mul.i.iter19 = mul i64 %and.i.iter19, %conv.i.iter19, !dbg !206
  %shr.i.iter19 = lshr i64 %155, 1, !dbg !207
  %and3.i.iter19 = and i64 %shr.i.iter19, 1229782938247303441, !dbg !208
  %shr4.i.iter19 = lshr i32 %xor2.i.i.iter19, 8, !dbg !209
  %and5.i.iter19 = and i32 %shr4.i.iter19, 15, !dbg !210
  %conv6.i.iter19 = zext nneg i32 %and5.i.iter19 to i64, !dbg !211
  %mul7.i.iter19 = mul nuw i64 %and3.i.iter19, %conv6.i.iter19, !dbg !212
  %xor.i.iter19 = xor i64 %mul.i.iter19, %mul7.i.iter19, !dbg !213
  %arrayidx8.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.iter19, i32 %i.0.i1.iter19, !dbg !214
  %156 = load i64, ptr %arrayidx8.i.iter19, align 8, !dbg !214
  %shr9.i.iter19 = lshr i64 %156, 2, !dbg !215
  %and10.i.iter19 = and i64 %shr9.i.iter19, 1229782938247303441, !dbg !216
  %shr11.i.iter19 = lshr i32 %xor2.i.i.iter19, 16, !dbg !217
  %and12.i.iter19 = and i32 %shr11.i.iter19, 15, !dbg !218
  %conv13.i.iter19 = zext nneg i32 %and12.i.iter19 to i64, !dbg !219
  %mul14.i.iter19 = mul nuw i64 %and10.i.iter19, %conv13.i.iter19, !dbg !220
  %xor15.i.iter19 = xor i64 %xor.i.iter19, %mul14.i.iter19, !dbg !221
  %arrayidx16.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr.iter19, i32 %i.0.i1.iter19, !dbg !222
  %157 = load i64, ptr %arrayidx16.i.iter19, align 8, !dbg !222
  %shr17.i.iter19 = lshr i64 %157, 3, !dbg !223
  %and18.i.iter19 = and i64 %shr17.i.iter19, 1229782938247303441, !dbg !224
  %shr19.i.iter19 = lshr i32 %xor2.i.i.iter19, 24, !dbg !225
  %and20.i.iter19 = and i32 %shr19.i.iter19, 15, !dbg !226
  %conv21.i.iter19 = zext nneg i32 %and20.i.iter19 to i64, !dbg !227
  %mul22.i.iter19 = mul nuw i64 %and18.i.iter19, %conv21.i.iter19, !dbg !228
  %xor23.i.iter19 = xor i64 %xor15.i.iter19, %mul22.i.iter19, !dbg !229
  %arrayidx24.i.iter19 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter19, i32 %i.0.i1.iter19, !dbg !230
  %158 = load i64, ptr %arrayidx24.i.iter19, align 8, !dbg !231
  %xor25.i.iter19 = xor i64 %158, %xor23.i.iter19, !dbg !231
  store i64 %xor25.i.iter19, ptr %arrayidx24.i.iter19, align 8, !dbg !231
  %inc.i.iter19 = add nuw nsw i32 %i.0.i1.iter19, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter19 = icmp eq i32 %inc.i.iter19, 5, !dbg !233
  br i1 %exitcond.i.not.iter19, label %m_vec_mul_add.exit.iter19, label %for.body.i.iter19, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter19:                        ; preds = %for.body.i.iter19
  %add13.iter19 = add nuw nsw i32 %k.02.iter19, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter19 = icmp eq i32 %add13.iter19, 10, !dbg !238
  br i1 %exitcond.not.iter19, label %for.inc15.iter19, label %for.body6.iter19, !dbg !239, !llvm.loop !240

for.inc15.iter19:                                 ; preds = %m_vec_mul_add.exit.iter19
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter19 = add i32 %bs_mat_entries_used.14.iter19, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter19 = add nuw nsw i32 %c.05.iter19, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter19 = icmp eq i32 %add14.iter19, %151, !dbg !244
  br i1 %exitcond1.not.iter19, label %for.cond1.for.inc17_crit_edge.iter19, label %for.cond4.preheader.iter19, !dbg !155, !llvm.loop !245

for.inc17.iter19:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter19
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_19_end

for.cond4.preheader.iter19:                       ; preds = %for.cond4.preheader.lr.ph.iter19, %for.inc15.iter19
  %c.05.iter19 = phi i32 [ 19, %for.cond4.preheader.lr.ph.iter19 ], [ %inc.iter19, %for.inc15.iter19 ]
  %bs_mat_entries_used.14.iter19 = phi i32 [ %split.iter18, %for.cond4.preheader.lr.ph.iter19 ], [ %add14.iter19, %for.inc15.iter19 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter19, !dbg !239

for.cond4.preheader.lr.ph.iter19:                 ; preds = %for.cond1.preheader.iter19
  br label %for.cond4.preheader.iter19, !dbg !155

for.cond1.for.inc17_crit_edge.iter19:             ; preds = %for.inc15.iter19
  %split.iter19 = phi i32 [ %add14.iter19, %for.inc15.iter19 ]
  br label %for.inc17.iter19, !dbg !155

iter_19_end:                                      ; preds = %for.inc17.iter19
  br label %iter_20_start

iter_20_start:                                    ; preds = %iter_19_end
  br label %for.cond1.preheader.iter20

for.cond1.preheader.iter20:                       ; preds = %iter_20_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %159 = add i32 %split.iter19, 58, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter20, !dbg !155

for.body6.iter20:                                 ; preds = %for.cond4.preheader.iter20, %m_vec_mul_add.exit.iter20
  %k.02.iter20 = phi i32 [ 0, %for.cond4.preheader.iter20 ], [ %add13.iter20, %m_vec_mul_add.exit.iter20 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter20 = mul nsw i32 %bs_mat_entries_used.14.iter20, 40, !dbg !161
  %add.ptr.iter20 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter20, !dbg !161
  %mul8.iter20 = mul nuw nsw i32 %k.02.iter20, 78, !dbg !164
  %160 = getelementptr i8, ptr %mat, i32 %mul8.iter20, !dbg !165
  %arrayidx.iter20 = getelementptr i8, ptr %160, i32 %c.05.iter20, !dbg !165
  %161 = load i8, ptr %arrayidx.iter20, align 1, !dbg !165
  %add10.iter20 = add nuw nsw i32 200, %k.02.iter20, !dbg !166
  %add.ptr12.idx.iter20 = mul nuw nsw i32 %add10.iter20, 40, !dbg !167
  %add.ptr12.iter20 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter20, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter20 = zext i8 %161 to i32, !dbg !185
  %mul.i.i.iter20 = mul i32 %conv.i.i.iter20, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter20 = and i32 %mul.i.i.iter20, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter20 = lshr exact i32 %and.i.i.iter20, 4, !dbg !191
  %shr1.i.i.iter20 = lshr exact i32 %and.i.i.iter20, 3, !dbg !192
  %162 = xor i32 %shr.i.i.iter20, %shr1.i.i.iter20, !dbg !193
  %xor2.i.i.iter20 = xor i32 %162, %mul.i.i.iter20, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter20, !dbg !199

for.body.i.iter20:                                ; preds = %for.body.i.iter20, %for.body6.iter20
  %i.0.i1.iter20 = phi i32 [ 0, %for.body6.iter20 ], [ %inc.i.iter20, %for.body.i.iter20 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.iter20, i32 %i.0.i1.iter20, !dbg !200
  %163 = load i64, ptr %arrayidx.i.iter20, align 8, !dbg !200
  %and.i.iter20 = and i64 %163, 1229782938247303441, !dbg !203
  %and1.i.iter20 = and i32 %xor2.i.i.iter20, 255, !dbg !204
  %conv.i.iter20 = zext nneg i32 %and1.i.iter20 to i64, !dbg !205
  %mul.i.iter20 = mul i64 %and.i.iter20, %conv.i.iter20, !dbg !206
  %shr.i.iter20 = lshr i64 %163, 1, !dbg !207
  %and3.i.iter20 = and i64 %shr.i.iter20, 1229782938247303441, !dbg !208
  %shr4.i.iter20 = lshr i32 %xor2.i.i.iter20, 8, !dbg !209
  %and5.i.iter20 = and i32 %shr4.i.iter20, 15, !dbg !210
  %conv6.i.iter20 = zext nneg i32 %and5.i.iter20 to i64, !dbg !211
  %mul7.i.iter20 = mul nuw i64 %and3.i.iter20, %conv6.i.iter20, !dbg !212
  %xor.i.iter20 = xor i64 %mul.i.iter20, %mul7.i.iter20, !dbg !213
  %arrayidx8.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.iter20, i32 %i.0.i1.iter20, !dbg !214
  %164 = load i64, ptr %arrayidx8.i.iter20, align 8, !dbg !214
  %shr9.i.iter20 = lshr i64 %164, 2, !dbg !215
  %and10.i.iter20 = and i64 %shr9.i.iter20, 1229782938247303441, !dbg !216
  %shr11.i.iter20 = lshr i32 %xor2.i.i.iter20, 16, !dbg !217
  %and12.i.iter20 = and i32 %shr11.i.iter20, 15, !dbg !218
  %conv13.i.iter20 = zext nneg i32 %and12.i.iter20 to i64, !dbg !219
  %mul14.i.iter20 = mul nuw i64 %and10.i.iter20, %conv13.i.iter20, !dbg !220
  %xor15.i.iter20 = xor i64 %xor.i.iter20, %mul14.i.iter20, !dbg !221
  %arrayidx16.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr.iter20, i32 %i.0.i1.iter20, !dbg !222
  %165 = load i64, ptr %arrayidx16.i.iter20, align 8, !dbg !222
  %shr17.i.iter20 = lshr i64 %165, 3, !dbg !223
  %and18.i.iter20 = and i64 %shr17.i.iter20, 1229782938247303441, !dbg !224
  %shr19.i.iter20 = lshr i32 %xor2.i.i.iter20, 24, !dbg !225
  %and20.i.iter20 = and i32 %shr19.i.iter20, 15, !dbg !226
  %conv21.i.iter20 = zext nneg i32 %and20.i.iter20 to i64, !dbg !227
  %mul22.i.iter20 = mul nuw i64 %and18.i.iter20, %conv21.i.iter20, !dbg !228
  %xor23.i.iter20 = xor i64 %xor15.i.iter20, %mul22.i.iter20, !dbg !229
  %arrayidx24.i.iter20 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter20, i32 %i.0.i1.iter20, !dbg !230
  %166 = load i64, ptr %arrayidx24.i.iter20, align 8, !dbg !231
  %xor25.i.iter20 = xor i64 %166, %xor23.i.iter20, !dbg !231
  store i64 %xor25.i.iter20, ptr %arrayidx24.i.iter20, align 8, !dbg !231
  %inc.i.iter20 = add nuw nsw i32 %i.0.i1.iter20, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter20 = icmp eq i32 %inc.i.iter20, 5, !dbg !233
  br i1 %exitcond.i.not.iter20, label %m_vec_mul_add.exit.iter20, label %for.body.i.iter20, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter20:                        ; preds = %for.body.i.iter20
  %add13.iter20 = add nuw nsw i32 %k.02.iter20, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter20 = icmp eq i32 %add13.iter20, 10, !dbg !238
  br i1 %exitcond.not.iter20, label %for.inc15.iter20, label %for.body6.iter20, !dbg !239, !llvm.loop !240

for.inc15.iter20:                                 ; preds = %m_vec_mul_add.exit.iter20
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter20 = add i32 %bs_mat_entries_used.14.iter20, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter20 = add nuw nsw i32 %c.05.iter20, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter20 = icmp eq i32 %add14.iter20, %159, !dbg !244
  br i1 %exitcond1.not.iter20, label %for.cond1.for.inc17_crit_edge.iter20, label %for.cond4.preheader.iter20, !dbg !155, !llvm.loop !245

for.inc17.iter20:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter20
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_20_end

for.cond4.preheader.iter20:                       ; preds = %for.cond4.preheader.lr.ph.iter20, %for.inc15.iter20
  %c.05.iter20 = phi i32 [ 20, %for.cond4.preheader.lr.ph.iter20 ], [ %inc.iter20, %for.inc15.iter20 ]
  %bs_mat_entries_used.14.iter20 = phi i32 [ %split.iter19, %for.cond4.preheader.lr.ph.iter20 ], [ %add14.iter20, %for.inc15.iter20 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter20, !dbg !239

for.cond4.preheader.lr.ph.iter20:                 ; preds = %for.cond1.preheader.iter20
  br label %for.cond4.preheader.iter20, !dbg !155

for.cond1.for.inc17_crit_edge.iter20:             ; preds = %for.inc15.iter20
  %split.iter20 = phi i32 [ %add14.iter20, %for.inc15.iter20 ]
  br label %for.inc17.iter20, !dbg !155

iter_20_end:                                      ; preds = %for.inc17.iter20
  br label %iter_21_start

iter_21_start:                                    ; preds = %iter_20_end
  br label %for.cond1.preheader.iter21

for.cond1.preheader.iter21:                       ; preds = %iter_21_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %167 = add i32 %split.iter20, 57, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter21, !dbg !155

for.body6.iter21:                                 ; preds = %for.cond4.preheader.iter21, %m_vec_mul_add.exit.iter21
  %k.02.iter21 = phi i32 [ 0, %for.cond4.preheader.iter21 ], [ %add13.iter21, %m_vec_mul_add.exit.iter21 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter21 = mul nsw i32 %bs_mat_entries_used.14.iter21, 40, !dbg !161
  %add.ptr.iter21 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter21, !dbg !161
  %mul8.iter21 = mul nuw nsw i32 %k.02.iter21, 78, !dbg !164
  %168 = getelementptr i8, ptr %mat, i32 %mul8.iter21, !dbg !165
  %arrayidx.iter21 = getelementptr i8, ptr %168, i32 %c.05.iter21, !dbg !165
  %169 = load i8, ptr %arrayidx.iter21, align 1, !dbg !165
  %add10.iter21 = add nuw nsw i32 210, %k.02.iter21, !dbg !166
  %add.ptr12.idx.iter21 = mul nuw nsw i32 %add10.iter21, 40, !dbg !167
  %add.ptr12.iter21 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter21, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter21 = zext i8 %169 to i32, !dbg !185
  %mul.i.i.iter21 = mul i32 %conv.i.i.iter21, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter21 = and i32 %mul.i.i.iter21, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter21 = lshr exact i32 %and.i.i.iter21, 4, !dbg !191
  %shr1.i.i.iter21 = lshr exact i32 %and.i.i.iter21, 3, !dbg !192
  %170 = xor i32 %shr.i.i.iter21, %shr1.i.i.iter21, !dbg !193
  %xor2.i.i.iter21 = xor i32 %170, %mul.i.i.iter21, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter21, !dbg !199

for.body.i.iter21:                                ; preds = %for.body.i.iter21, %for.body6.iter21
  %i.0.i1.iter21 = phi i32 [ 0, %for.body6.iter21 ], [ %inc.i.iter21, %for.body.i.iter21 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.iter21, i32 %i.0.i1.iter21, !dbg !200
  %171 = load i64, ptr %arrayidx.i.iter21, align 8, !dbg !200
  %and.i.iter21 = and i64 %171, 1229782938247303441, !dbg !203
  %and1.i.iter21 = and i32 %xor2.i.i.iter21, 255, !dbg !204
  %conv.i.iter21 = zext nneg i32 %and1.i.iter21 to i64, !dbg !205
  %mul.i.iter21 = mul i64 %and.i.iter21, %conv.i.iter21, !dbg !206
  %shr.i.iter21 = lshr i64 %171, 1, !dbg !207
  %and3.i.iter21 = and i64 %shr.i.iter21, 1229782938247303441, !dbg !208
  %shr4.i.iter21 = lshr i32 %xor2.i.i.iter21, 8, !dbg !209
  %and5.i.iter21 = and i32 %shr4.i.iter21, 15, !dbg !210
  %conv6.i.iter21 = zext nneg i32 %and5.i.iter21 to i64, !dbg !211
  %mul7.i.iter21 = mul nuw i64 %and3.i.iter21, %conv6.i.iter21, !dbg !212
  %xor.i.iter21 = xor i64 %mul.i.iter21, %mul7.i.iter21, !dbg !213
  %arrayidx8.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.iter21, i32 %i.0.i1.iter21, !dbg !214
  %172 = load i64, ptr %arrayidx8.i.iter21, align 8, !dbg !214
  %shr9.i.iter21 = lshr i64 %172, 2, !dbg !215
  %and10.i.iter21 = and i64 %shr9.i.iter21, 1229782938247303441, !dbg !216
  %shr11.i.iter21 = lshr i32 %xor2.i.i.iter21, 16, !dbg !217
  %and12.i.iter21 = and i32 %shr11.i.iter21, 15, !dbg !218
  %conv13.i.iter21 = zext nneg i32 %and12.i.iter21 to i64, !dbg !219
  %mul14.i.iter21 = mul nuw i64 %and10.i.iter21, %conv13.i.iter21, !dbg !220
  %xor15.i.iter21 = xor i64 %xor.i.iter21, %mul14.i.iter21, !dbg !221
  %arrayidx16.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr.iter21, i32 %i.0.i1.iter21, !dbg !222
  %173 = load i64, ptr %arrayidx16.i.iter21, align 8, !dbg !222
  %shr17.i.iter21 = lshr i64 %173, 3, !dbg !223
  %and18.i.iter21 = and i64 %shr17.i.iter21, 1229782938247303441, !dbg !224
  %shr19.i.iter21 = lshr i32 %xor2.i.i.iter21, 24, !dbg !225
  %and20.i.iter21 = and i32 %shr19.i.iter21, 15, !dbg !226
  %conv21.i.iter21 = zext nneg i32 %and20.i.iter21 to i64, !dbg !227
  %mul22.i.iter21 = mul nuw i64 %and18.i.iter21, %conv21.i.iter21, !dbg !228
  %xor23.i.iter21 = xor i64 %xor15.i.iter21, %mul22.i.iter21, !dbg !229
  %arrayidx24.i.iter21 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter21, i32 %i.0.i1.iter21, !dbg !230
  %174 = load i64, ptr %arrayidx24.i.iter21, align 8, !dbg !231
  %xor25.i.iter21 = xor i64 %174, %xor23.i.iter21, !dbg !231
  store i64 %xor25.i.iter21, ptr %arrayidx24.i.iter21, align 8, !dbg !231
  %inc.i.iter21 = add nuw nsw i32 %i.0.i1.iter21, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter21 = icmp eq i32 %inc.i.iter21, 5, !dbg !233
  br i1 %exitcond.i.not.iter21, label %m_vec_mul_add.exit.iter21, label %for.body.i.iter21, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter21:                        ; preds = %for.body.i.iter21
  %add13.iter21 = add nuw nsw i32 %k.02.iter21, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter21 = icmp eq i32 %add13.iter21, 10, !dbg !238
  br i1 %exitcond.not.iter21, label %for.inc15.iter21, label %for.body6.iter21, !dbg !239, !llvm.loop !240

for.inc15.iter21:                                 ; preds = %m_vec_mul_add.exit.iter21
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter21 = add i32 %bs_mat_entries_used.14.iter21, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter21 = add nuw nsw i32 %c.05.iter21, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter21 = icmp eq i32 %add14.iter21, %167, !dbg !244
  br i1 %exitcond1.not.iter21, label %for.cond1.for.inc17_crit_edge.iter21, label %for.cond4.preheader.iter21, !dbg !155, !llvm.loop !245

for.inc17.iter21:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter21
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_21_end

for.cond4.preheader.iter21:                       ; preds = %for.cond4.preheader.lr.ph.iter21, %for.inc15.iter21
  %c.05.iter21 = phi i32 [ 21, %for.cond4.preheader.lr.ph.iter21 ], [ %inc.iter21, %for.inc15.iter21 ]
  %bs_mat_entries_used.14.iter21 = phi i32 [ %split.iter20, %for.cond4.preheader.lr.ph.iter21 ], [ %add14.iter21, %for.inc15.iter21 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter21, !dbg !239

for.cond4.preheader.lr.ph.iter21:                 ; preds = %for.cond1.preheader.iter21
  br label %for.cond4.preheader.iter21, !dbg !155

for.cond1.for.inc17_crit_edge.iter21:             ; preds = %for.inc15.iter21
  %split.iter21 = phi i32 [ %add14.iter21, %for.inc15.iter21 ]
  br label %for.inc17.iter21, !dbg !155

iter_21_end:                                      ; preds = %for.inc17.iter21
  br label %iter_22_start

iter_22_start:                                    ; preds = %iter_21_end
  br label %for.cond1.preheader.iter22

for.cond1.preheader.iter22:                       ; preds = %iter_22_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %175 = add i32 %split.iter21, 56, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter22, !dbg !155

for.body6.iter22:                                 ; preds = %for.cond4.preheader.iter22, %m_vec_mul_add.exit.iter22
  %k.02.iter22 = phi i32 [ 0, %for.cond4.preheader.iter22 ], [ %add13.iter22, %m_vec_mul_add.exit.iter22 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter22 = mul nsw i32 %bs_mat_entries_used.14.iter22, 40, !dbg !161
  %add.ptr.iter22 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter22, !dbg !161
  %mul8.iter22 = mul nuw nsw i32 %k.02.iter22, 78, !dbg !164
  %176 = getelementptr i8, ptr %mat, i32 %mul8.iter22, !dbg !165
  %arrayidx.iter22 = getelementptr i8, ptr %176, i32 %c.05.iter22, !dbg !165
  %177 = load i8, ptr %arrayidx.iter22, align 1, !dbg !165
  %add10.iter22 = add nuw nsw i32 220, %k.02.iter22, !dbg !166
  %add.ptr12.idx.iter22 = mul nuw nsw i32 %add10.iter22, 40, !dbg !167
  %add.ptr12.iter22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter22, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter22 = zext i8 %177 to i32, !dbg !185
  %mul.i.i.iter22 = mul i32 %conv.i.i.iter22, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter22 = and i32 %mul.i.i.iter22, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter22 = lshr exact i32 %and.i.i.iter22, 4, !dbg !191
  %shr1.i.i.iter22 = lshr exact i32 %and.i.i.iter22, 3, !dbg !192
  %178 = xor i32 %shr.i.i.iter22, %shr1.i.i.iter22, !dbg !193
  %xor2.i.i.iter22 = xor i32 %178, %mul.i.i.iter22, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter22, !dbg !199

for.body.i.iter22:                                ; preds = %for.body.i.iter22, %for.body6.iter22
  %i.0.i1.iter22 = phi i32 [ 0, %for.body6.iter22 ], [ %inc.i.iter22, %for.body.i.iter22 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.iter22, i32 %i.0.i1.iter22, !dbg !200
  %179 = load i64, ptr %arrayidx.i.iter22, align 8, !dbg !200
  %and.i.iter22 = and i64 %179, 1229782938247303441, !dbg !203
  %and1.i.iter22 = and i32 %xor2.i.i.iter22, 255, !dbg !204
  %conv.i.iter22 = zext nneg i32 %and1.i.iter22 to i64, !dbg !205
  %mul.i.iter22 = mul i64 %and.i.iter22, %conv.i.iter22, !dbg !206
  %shr.i.iter22 = lshr i64 %179, 1, !dbg !207
  %and3.i.iter22 = and i64 %shr.i.iter22, 1229782938247303441, !dbg !208
  %shr4.i.iter22 = lshr i32 %xor2.i.i.iter22, 8, !dbg !209
  %and5.i.iter22 = and i32 %shr4.i.iter22, 15, !dbg !210
  %conv6.i.iter22 = zext nneg i32 %and5.i.iter22 to i64, !dbg !211
  %mul7.i.iter22 = mul nuw i64 %and3.i.iter22, %conv6.i.iter22, !dbg !212
  %xor.i.iter22 = xor i64 %mul.i.iter22, %mul7.i.iter22, !dbg !213
  %arrayidx8.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.iter22, i32 %i.0.i1.iter22, !dbg !214
  %180 = load i64, ptr %arrayidx8.i.iter22, align 8, !dbg !214
  %shr9.i.iter22 = lshr i64 %180, 2, !dbg !215
  %and10.i.iter22 = and i64 %shr9.i.iter22, 1229782938247303441, !dbg !216
  %shr11.i.iter22 = lshr i32 %xor2.i.i.iter22, 16, !dbg !217
  %and12.i.iter22 = and i32 %shr11.i.iter22, 15, !dbg !218
  %conv13.i.iter22 = zext nneg i32 %and12.i.iter22 to i64, !dbg !219
  %mul14.i.iter22 = mul nuw i64 %and10.i.iter22, %conv13.i.iter22, !dbg !220
  %xor15.i.iter22 = xor i64 %xor.i.iter22, %mul14.i.iter22, !dbg !221
  %arrayidx16.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr.iter22, i32 %i.0.i1.iter22, !dbg !222
  %181 = load i64, ptr %arrayidx16.i.iter22, align 8, !dbg !222
  %shr17.i.iter22 = lshr i64 %181, 3, !dbg !223
  %and18.i.iter22 = and i64 %shr17.i.iter22, 1229782938247303441, !dbg !224
  %shr19.i.iter22 = lshr i32 %xor2.i.i.iter22, 24, !dbg !225
  %and20.i.iter22 = and i32 %shr19.i.iter22, 15, !dbg !226
  %conv21.i.iter22 = zext nneg i32 %and20.i.iter22 to i64, !dbg !227
  %mul22.i.iter22 = mul nuw i64 %and18.i.iter22, %conv21.i.iter22, !dbg !228
  %xor23.i.iter22 = xor i64 %xor15.i.iter22, %mul22.i.iter22, !dbg !229
  %arrayidx24.i.iter22 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter22, i32 %i.0.i1.iter22, !dbg !230
  %182 = load i64, ptr %arrayidx24.i.iter22, align 8, !dbg !231
  %xor25.i.iter22 = xor i64 %182, %xor23.i.iter22, !dbg !231
  store i64 %xor25.i.iter22, ptr %arrayidx24.i.iter22, align 8, !dbg !231
  %inc.i.iter22 = add nuw nsw i32 %i.0.i1.iter22, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter22 = icmp eq i32 %inc.i.iter22, 5, !dbg !233
  br i1 %exitcond.i.not.iter22, label %m_vec_mul_add.exit.iter22, label %for.body.i.iter22, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter22:                        ; preds = %for.body.i.iter22
  %add13.iter22 = add nuw nsw i32 %k.02.iter22, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter22 = icmp eq i32 %add13.iter22, 10, !dbg !238
  br i1 %exitcond.not.iter22, label %for.inc15.iter22, label %for.body6.iter22, !dbg !239, !llvm.loop !240

for.inc15.iter22:                                 ; preds = %m_vec_mul_add.exit.iter22
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter22 = add i32 %bs_mat_entries_used.14.iter22, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter22 = add nuw nsw i32 %c.05.iter22, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter22 = icmp eq i32 %add14.iter22, %175, !dbg !244
  br i1 %exitcond1.not.iter22, label %for.cond1.for.inc17_crit_edge.iter22, label %for.cond4.preheader.iter22, !dbg !155, !llvm.loop !245

for.inc17.iter22:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter22
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_22_end

for.cond4.preheader.iter22:                       ; preds = %for.cond4.preheader.lr.ph.iter22, %for.inc15.iter22
  %c.05.iter22 = phi i32 [ 22, %for.cond4.preheader.lr.ph.iter22 ], [ %inc.iter22, %for.inc15.iter22 ]
  %bs_mat_entries_used.14.iter22 = phi i32 [ %split.iter21, %for.cond4.preheader.lr.ph.iter22 ], [ %add14.iter22, %for.inc15.iter22 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter22, !dbg !239

for.cond4.preheader.lr.ph.iter22:                 ; preds = %for.cond1.preheader.iter22
  br label %for.cond4.preheader.iter22, !dbg !155

for.cond1.for.inc17_crit_edge.iter22:             ; preds = %for.inc15.iter22
  %split.iter22 = phi i32 [ %add14.iter22, %for.inc15.iter22 ]
  br label %for.inc17.iter22, !dbg !155

iter_22_end:                                      ; preds = %for.inc17.iter22
  br label %iter_23_start

iter_23_start:                                    ; preds = %iter_22_end
  br label %for.cond1.preheader.iter23

for.cond1.preheader.iter23:                       ; preds = %iter_23_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %183 = add i32 %split.iter22, 55, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter23, !dbg !155

for.body6.iter23:                                 ; preds = %for.cond4.preheader.iter23, %m_vec_mul_add.exit.iter23
  %k.02.iter23 = phi i32 [ 0, %for.cond4.preheader.iter23 ], [ %add13.iter23, %m_vec_mul_add.exit.iter23 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter23 = mul nsw i32 %bs_mat_entries_used.14.iter23, 40, !dbg !161
  %add.ptr.iter23 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter23, !dbg !161
  %mul8.iter23 = mul nuw nsw i32 %k.02.iter23, 78, !dbg !164
  %184 = getelementptr i8, ptr %mat, i32 %mul8.iter23, !dbg !165
  %arrayidx.iter23 = getelementptr i8, ptr %184, i32 %c.05.iter23, !dbg !165
  %185 = load i8, ptr %arrayidx.iter23, align 1, !dbg !165
  %add10.iter23 = add nuw nsw i32 230, %k.02.iter23, !dbg !166
  %add.ptr12.idx.iter23 = mul nuw nsw i32 %add10.iter23, 40, !dbg !167
  %add.ptr12.iter23 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter23, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter23 = zext i8 %185 to i32, !dbg !185
  %mul.i.i.iter23 = mul i32 %conv.i.i.iter23, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter23 = and i32 %mul.i.i.iter23, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter23 = lshr exact i32 %and.i.i.iter23, 4, !dbg !191
  %shr1.i.i.iter23 = lshr exact i32 %and.i.i.iter23, 3, !dbg !192
  %186 = xor i32 %shr.i.i.iter23, %shr1.i.i.iter23, !dbg !193
  %xor2.i.i.iter23 = xor i32 %186, %mul.i.i.iter23, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter23, !dbg !199

for.body.i.iter23:                                ; preds = %for.body.i.iter23, %for.body6.iter23
  %i.0.i1.iter23 = phi i32 [ 0, %for.body6.iter23 ], [ %inc.i.iter23, %for.body.i.iter23 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.iter23, i32 %i.0.i1.iter23, !dbg !200
  %187 = load i64, ptr %arrayidx.i.iter23, align 8, !dbg !200
  %and.i.iter23 = and i64 %187, 1229782938247303441, !dbg !203
  %and1.i.iter23 = and i32 %xor2.i.i.iter23, 255, !dbg !204
  %conv.i.iter23 = zext nneg i32 %and1.i.iter23 to i64, !dbg !205
  %mul.i.iter23 = mul i64 %and.i.iter23, %conv.i.iter23, !dbg !206
  %shr.i.iter23 = lshr i64 %187, 1, !dbg !207
  %and3.i.iter23 = and i64 %shr.i.iter23, 1229782938247303441, !dbg !208
  %shr4.i.iter23 = lshr i32 %xor2.i.i.iter23, 8, !dbg !209
  %and5.i.iter23 = and i32 %shr4.i.iter23, 15, !dbg !210
  %conv6.i.iter23 = zext nneg i32 %and5.i.iter23 to i64, !dbg !211
  %mul7.i.iter23 = mul nuw i64 %and3.i.iter23, %conv6.i.iter23, !dbg !212
  %xor.i.iter23 = xor i64 %mul.i.iter23, %mul7.i.iter23, !dbg !213
  %arrayidx8.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.iter23, i32 %i.0.i1.iter23, !dbg !214
  %188 = load i64, ptr %arrayidx8.i.iter23, align 8, !dbg !214
  %shr9.i.iter23 = lshr i64 %188, 2, !dbg !215
  %and10.i.iter23 = and i64 %shr9.i.iter23, 1229782938247303441, !dbg !216
  %shr11.i.iter23 = lshr i32 %xor2.i.i.iter23, 16, !dbg !217
  %and12.i.iter23 = and i32 %shr11.i.iter23, 15, !dbg !218
  %conv13.i.iter23 = zext nneg i32 %and12.i.iter23 to i64, !dbg !219
  %mul14.i.iter23 = mul nuw i64 %and10.i.iter23, %conv13.i.iter23, !dbg !220
  %xor15.i.iter23 = xor i64 %xor.i.iter23, %mul14.i.iter23, !dbg !221
  %arrayidx16.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr.iter23, i32 %i.0.i1.iter23, !dbg !222
  %189 = load i64, ptr %arrayidx16.i.iter23, align 8, !dbg !222
  %shr17.i.iter23 = lshr i64 %189, 3, !dbg !223
  %and18.i.iter23 = and i64 %shr17.i.iter23, 1229782938247303441, !dbg !224
  %shr19.i.iter23 = lshr i32 %xor2.i.i.iter23, 24, !dbg !225
  %and20.i.iter23 = and i32 %shr19.i.iter23, 15, !dbg !226
  %conv21.i.iter23 = zext nneg i32 %and20.i.iter23 to i64, !dbg !227
  %mul22.i.iter23 = mul nuw i64 %and18.i.iter23, %conv21.i.iter23, !dbg !228
  %xor23.i.iter23 = xor i64 %xor15.i.iter23, %mul22.i.iter23, !dbg !229
  %arrayidx24.i.iter23 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter23, i32 %i.0.i1.iter23, !dbg !230
  %190 = load i64, ptr %arrayidx24.i.iter23, align 8, !dbg !231
  %xor25.i.iter23 = xor i64 %190, %xor23.i.iter23, !dbg !231
  store i64 %xor25.i.iter23, ptr %arrayidx24.i.iter23, align 8, !dbg !231
  %inc.i.iter23 = add nuw nsw i32 %i.0.i1.iter23, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter23 = icmp eq i32 %inc.i.iter23, 5, !dbg !233
  br i1 %exitcond.i.not.iter23, label %m_vec_mul_add.exit.iter23, label %for.body.i.iter23, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter23:                        ; preds = %for.body.i.iter23
  %add13.iter23 = add nuw nsw i32 %k.02.iter23, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter23 = icmp eq i32 %add13.iter23, 10, !dbg !238
  br i1 %exitcond.not.iter23, label %for.inc15.iter23, label %for.body6.iter23, !dbg !239, !llvm.loop !240

for.inc15.iter23:                                 ; preds = %m_vec_mul_add.exit.iter23
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter23 = add i32 %bs_mat_entries_used.14.iter23, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter23 = add nuw nsw i32 %c.05.iter23, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter23 = icmp eq i32 %add14.iter23, %183, !dbg !244
  br i1 %exitcond1.not.iter23, label %for.cond1.for.inc17_crit_edge.iter23, label %for.cond4.preheader.iter23, !dbg !155, !llvm.loop !245

for.inc17.iter23:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter23
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_23_end

for.cond4.preheader.iter23:                       ; preds = %for.cond4.preheader.lr.ph.iter23, %for.inc15.iter23
  %c.05.iter23 = phi i32 [ 23, %for.cond4.preheader.lr.ph.iter23 ], [ %inc.iter23, %for.inc15.iter23 ]
  %bs_mat_entries_used.14.iter23 = phi i32 [ %split.iter22, %for.cond4.preheader.lr.ph.iter23 ], [ %add14.iter23, %for.inc15.iter23 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter23, !dbg !239

for.cond4.preheader.lr.ph.iter23:                 ; preds = %for.cond1.preheader.iter23
  br label %for.cond4.preheader.iter23, !dbg !155

for.cond1.for.inc17_crit_edge.iter23:             ; preds = %for.inc15.iter23
  %split.iter23 = phi i32 [ %add14.iter23, %for.inc15.iter23 ]
  br label %for.inc17.iter23, !dbg !155

iter_23_end:                                      ; preds = %for.inc17.iter23
  br label %iter_24_start

iter_24_start:                                    ; preds = %iter_23_end
  br label %for.cond1.preheader.iter24

for.cond1.preheader.iter24:                       ; preds = %iter_24_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %191 = add i32 %split.iter23, 54, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter24, !dbg !155

for.body6.iter24:                                 ; preds = %for.cond4.preheader.iter24, %m_vec_mul_add.exit.iter24
  %k.02.iter24 = phi i32 [ 0, %for.cond4.preheader.iter24 ], [ %add13.iter24, %m_vec_mul_add.exit.iter24 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter24 = mul nsw i32 %bs_mat_entries_used.14.iter24, 40, !dbg !161
  %add.ptr.iter24 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter24, !dbg !161
  %mul8.iter24 = mul nuw nsw i32 %k.02.iter24, 78, !dbg !164
  %192 = getelementptr i8, ptr %mat, i32 %mul8.iter24, !dbg !165
  %arrayidx.iter24 = getelementptr i8, ptr %192, i32 %c.05.iter24, !dbg !165
  %193 = load i8, ptr %arrayidx.iter24, align 1, !dbg !165
  %add10.iter24 = add nuw nsw i32 240, %k.02.iter24, !dbg !166
  %add.ptr12.idx.iter24 = mul nuw nsw i32 %add10.iter24, 40, !dbg !167
  %add.ptr12.iter24 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter24, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter24 = zext i8 %193 to i32, !dbg !185
  %mul.i.i.iter24 = mul i32 %conv.i.i.iter24, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter24 = and i32 %mul.i.i.iter24, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter24 = lshr exact i32 %and.i.i.iter24, 4, !dbg !191
  %shr1.i.i.iter24 = lshr exact i32 %and.i.i.iter24, 3, !dbg !192
  %194 = xor i32 %shr.i.i.iter24, %shr1.i.i.iter24, !dbg !193
  %xor2.i.i.iter24 = xor i32 %194, %mul.i.i.iter24, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter24, !dbg !199

for.body.i.iter24:                                ; preds = %for.body.i.iter24, %for.body6.iter24
  %i.0.i1.iter24 = phi i32 [ 0, %for.body6.iter24 ], [ %inc.i.iter24, %for.body.i.iter24 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.iter24, i32 %i.0.i1.iter24, !dbg !200
  %195 = load i64, ptr %arrayidx.i.iter24, align 8, !dbg !200
  %and.i.iter24 = and i64 %195, 1229782938247303441, !dbg !203
  %and1.i.iter24 = and i32 %xor2.i.i.iter24, 255, !dbg !204
  %conv.i.iter24 = zext nneg i32 %and1.i.iter24 to i64, !dbg !205
  %mul.i.iter24 = mul i64 %and.i.iter24, %conv.i.iter24, !dbg !206
  %shr.i.iter24 = lshr i64 %195, 1, !dbg !207
  %and3.i.iter24 = and i64 %shr.i.iter24, 1229782938247303441, !dbg !208
  %shr4.i.iter24 = lshr i32 %xor2.i.i.iter24, 8, !dbg !209
  %and5.i.iter24 = and i32 %shr4.i.iter24, 15, !dbg !210
  %conv6.i.iter24 = zext nneg i32 %and5.i.iter24 to i64, !dbg !211
  %mul7.i.iter24 = mul nuw i64 %and3.i.iter24, %conv6.i.iter24, !dbg !212
  %xor.i.iter24 = xor i64 %mul.i.iter24, %mul7.i.iter24, !dbg !213
  %arrayidx8.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.iter24, i32 %i.0.i1.iter24, !dbg !214
  %196 = load i64, ptr %arrayidx8.i.iter24, align 8, !dbg !214
  %shr9.i.iter24 = lshr i64 %196, 2, !dbg !215
  %and10.i.iter24 = and i64 %shr9.i.iter24, 1229782938247303441, !dbg !216
  %shr11.i.iter24 = lshr i32 %xor2.i.i.iter24, 16, !dbg !217
  %and12.i.iter24 = and i32 %shr11.i.iter24, 15, !dbg !218
  %conv13.i.iter24 = zext nneg i32 %and12.i.iter24 to i64, !dbg !219
  %mul14.i.iter24 = mul nuw i64 %and10.i.iter24, %conv13.i.iter24, !dbg !220
  %xor15.i.iter24 = xor i64 %xor.i.iter24, %mul14.i.iter24, !dbg !221
  %arrayidx16.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr.iter24, i32 %i.0.i1.iter24, !dbg !222
  %197 = load i64, ptr %arrayidx16.i.iter24, align 8, !dbg !222
  %shr17.i.iter24 = lshr i64 %197, 3, !dbg !223
  %and18.i.iter24 = and i64 %shr17.i.iter24, 1229782938247303441, !dbg !224
  %shr19.i.iter24 = lshr i32 %xor2.i.i.iter24, 24, !dbg !225
  %and20.i.iter24 = and i32 %shr19.i.iter24, 15, !dbg !226
  %conv21.i.iter24 = zext nneg i32 %and20.i.iter24 to i64, !dbg !227
  %mul22.i.iter24 = mul nuw i64 %and18.i.iter24, %conv21.i.iter24, !dbg !228
  %xor23.i.iter24 = xor i64 %xor15.i.iter24, %mul22.i.iter24, !dbg !229
  %arrayidx24.i.iter24 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter24, i32 %i.0.i1.iter24, !dbg !230
  %198 = load i64, ptr %arrayidx24.i.iter24, align 8, !dbg !231
  %xor25.i.iter24 = xor i64 %198, %xor23.i.iter24, !dbg !231
  store i64 %xor25.i.iter24, ptr %arrayidx24.i.iter24, align 8, !dbg !231
  %inc.i.iter24 = add nuw nsw i32 %i.0.i1.iter24, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter24 = icmp eq i32 %inc.i.iter24, 5, !dbg !233
  br i1 %exitcond.i.not.iter24, label %m_vec_mul_add.exit.iter24, label %for.body.i.iter24, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter24:                        ; preds = %for.body.i.iter24
  %add13.iter24 = add nuw nsw i32 %k.02.iter24, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter24 = icmp eq i32 %add13.iter24, 10, !dbg !238
  br i1 %exitcond.not.iter24, label %for.inc15.iter24, label %for.body6.iter24, !dbg !239, !llvm.loop !240

for.inc15.iter24:                                 ; preds = %m_vec_mul_add.exit.iter24
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter24 = add i32 %bs_mat_entries_used.14.iter24, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter24 = add nuw nsw i32 %c.05.iter24, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter24 = icmp eq i32 %add14.iter24, %191, !dbg !244
  br i1 %exitcond1.not.iter24, label %for.cond1.for.inc17_crit_edge.iter24, label %for.cond4.preheader.iter24, !dbg !155, !llvm.loop !245

for.inc17.iter24:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter24
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_24_end

for.cond4.preheader.iter24:                       ; preds = %for.cond4.preheader.lr.ph.iter24, %for.inc15.iter24
  %c.05.iter24 = phi i32 [ 24, %for.cond4.preheader.lr.ph.iter24 ], [ %inc.iter24, %for.inc15.iter24 ]
  %bs_mat_entries_used.14.iter24 = phi i32 [ %split.iter23, %for.cond4.preheader.lr.ph.iter24 ], [ %add14.iter24, %for.inc15.iter24 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter24, !dbg !239

for.cond4.preheader.lr.ph.iter24:                 ; preds = %for.cond1.preheader.iter24
  br label %for.cond4.preheader.iter24, !dbg !155

for.cond1.for.inc17_crit_edge.iter24:             ; preds = %for.inc15.iter24
  %split.iter24 = phi i32 [ %add14.iter24, %for.inc15.iter24 ]
  br label %for.inc17.iter24, !dbg !155

iter_24_end:                                      ; preds = %for.inc17.iter24
  br label %iter_25_start

iter_25_start:                                    ; preds = %iter_24_end
  br label %for.cond1.preheader.iter25

for.cond1.preheader.iter25:                       ; preds = %iter_25_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %199 = add i32 %split.iter24, 53, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter25, !dbg !155

for.body6.iter25:                                 ; preds = %for.cond4.preheader.iter25, %m_vec_mul_add.exit.iter25
  %k.02.iter25 = phi i32 [ 0, %for.cond4.preheader.iter25 ], [ %add13.iter25, %m_vec_mul_add.exit.iter25 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter25 = mul nsw i32 %bs_mat_entries_used.14.iter25, 40, !dbg !161
  %add.ptr.iter25 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter25, !dbg !161
  %mul8.iter25 = mul nuw nsw i32 %k.02.iter25, 78, !dbg !164
  %200 = getelementptr i8, ptr %mat, i32 %mul8.iter25, !dbg !165
  %arrayidx.iter25 = getelementptr i8, ptr %200, i32 %c.05.iter25, !dbg !165
  %201 = load i8, ptr %arrayidx.iter25, align 1, !dbg !165
  %add10.iter25 = add nuw nsw i32 250, %k.02.iter25, !dbg !166
  %add.ptr12.idx.iter25 = mul nuw nsw i32 %add10.iter25, 40, !dbg !167
  %add.ptr12.iter25 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter25, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter25 = zext i8 %201 to i32, !dbg !185
  %mul.i.i.iter25 = mul i32 %conv.i.i.iter25, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter25 = and i32 %mul.i.i.iter25, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter25 = lshr exact i32 %and.i.i.iter25, 4, !dbg !191
  %shr1.i.i.iter25 = lshr exact i32 %and.i.i.iter25, 3, !dbg !192
  %202 = xor i32 %shr.i.i.iter25, %shr1.i.i.iter25, !dbg !193
  %xor2.i.i.iter25 = xor i32 %202, %mul.i.i.iter25, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter25, !dbg !199

for.body.i.iter25:                                ; preds = %for.body.i.iter25, %for.body6.iter25
  %i.0.i1.iter25 = phi i32 [ 0, %for.body6.iter25 ], [ %inc.i.iter25, %for.body.i.iter25 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.iter25, i32 %i.0.i1.iter25, !dbg !200
  %203 = load i64, ptr %arrayidx.i.iter25, align 8, !dbg !200
  %and.i.iter25 = and i64 %203, 1229782938247303441, !dbg !203
  %and1.i.iter25 = and i32 %xor2.i.i.iter25, 255, !dbg !204
  %conv.i.iter25 = zext nneg i32 %and1.i.iter25 to i64, !dbg !205
  %mul.i.iter25 = mul i64 %and.i.iter25, %conv.i.iter25, !dbg !206
  %shr.i.iter25 = lshr i64 %203, 1, !dbg !207
  %and3.i.iter25 = and i64 %shr.i.iter25, 1229782938247303441, !dbg !208
  %shr4.i.iter25 = lshr i32 %xor2.i.i.iter25, 8, !dbg !209
  %and5.i.iter25 = and i32 %shr4.i.iter25, 15, !dbg !210
  %conv6.i.iter25 = zext nneg i32 %and5.i.iter25 to i64, !dbg !211
  %mul7.i.iter25 = mul nuw i64 %and3.i.iter25, %conv6.i.iter25, !dbg !212
  %xor.i.iter25 = xor i64 %mul.i.iter25, %mul7.i.iter25, !dbg !213
  %arrayidx8.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.iter25, i32 %i.0.i1.iter25, !dbg !214
  %204 = load i64, ptr %arrayidx8.i.iter25, align 8, !dbg !214
  %shr9.i.iter25 = lshr i64 %204, 2, !dbg !215
  %and10.i.iter25 = and i64 %shr9.i.iter25, 1229782938247303441, !dbg !216
  %shr11.i.iter25 = lshr i32 %xor2.i.i.iter25, 16, !dbg !217
  %and12.i.iter25 = and i32 %shr11.i.iter25, 15, !dbg !218
  %conv13.i.iter25 = zext nneg i32 %and12.i.iter25 to i64, !dbg !219
  %mul14.i.iter25 = mul nuw i64 %and10.i.iter25, %conv13.i.iter25, !dbg !220
  %xor15.i.iter25 = xor i64 %xor.i.iter25, %mul14.i.iter25, !dbg !221
  %arrayidx16.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr.iter25, i32 %i.0.i1.iter25, !dbg !222
  %205 = load i64, ptr %arrayidx16.i.iter25, align 8, !dbg !222
  %shr17.i.iter25 = lshr i64 %205, 3, !dbg !223
  %and18.i.iter25 = and i64 %shr17.i.iter25, 1229782938247303441, !dbg !224
  %shr19.i.iter25 = lshr i32 %xor2.i.i.iter25, 24, !dbg !225
  %and20.i.iter25 = and i32 %shr19.i.iter25, 15, !dbg !226
  %conv21.i.iter25 = zext nneg i32 %and20.i.iter25 to i64, !dbg !227
  %mul22.i.iter25 = mul nuw i64 %and18.i.iter25, %conv21.i.iter25, !dbg !228
  %xor23.i.iter25 = xor i64 %xor15.i.iter25, %mul22.i.iter25, !dbg !229
  %arrayidx24.i.iter25 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter25, i32 %i.0.i1.iter25, !dbg !230
  %206 = load i64, ptr %arrayidx24.i.iter25, align 8, !dbg !231
  %xor25.i.iter25 = xor i64 %206, %xor23.i.iter25, !dbg !231
  store i64 %xor25.i.iter25, ptr %arrayidx24.i.iter25, align 8, !dbg !231
  %inc.i.iter25 = add nuw nsw i32 %i.0.i1.iter25, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter25 = icmp eq i32 %inc.i.iter25, 5, !dbg !233
  br i1 %exitcond.i.not.iter25, label %m_vec_mul_add.exit.iter25, label %for.body.i.iter25, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter25:                        ; preds = %for.body.i.iter25
  %add13.iter25 = add nuw nsw i32 %k.02.iter25, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter25 = icmp eq i32 %add13.iter25, 10, !dbg !238
  br i1 %exitcond.not.iter25, label %for.inc15.iter25, label %for.body6.iter25, !dbg !239, !llvm.loop !240

for.inc15.iter25:                                 ; preds = %m_vec_mul_add.exit.iter25
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter25 = add i32 %bs_mat_entries_used.14.iter25, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter25 = add nuw nsw i32 %c.05.iter25, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter25 = icmp eq i32 %add14.iter25, %199, !dbg !244
  br i1 %exitcond1.not.iter25, label %for.cond1.for.inc17_crit_edge.iter25, label %for.cond4.preheader.iter25, !dbg !155, !llvm.loop !245

for.inc17.iter25:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter25
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_25_end

for.cond4.preheader.iter25:                       ; preds = %for.cond4.preheader.lr.ph.iter25, %for.inc15.iter25
  %c.05.iter25 = phi i32 [ 25, %for.cond4.preheader.lr.ph.iter25 ], [ %inc.iter25, %for.inc15.iter25 ]
  %bs_mat_entries_used.14.iter25 = phi i32 [ %split.iter24, %for.cond4.preheader.lr.ph.iter25 ], [ %add14.iter25, %for.inc15.iter25 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter25, !dbg !239

for.cond4.preheader.lr.ph.iter25:                 ; preds = %for.cond1.preheader.iter25
  br label %for.cond4.preheader.iter25, !dbg !155

for.cond1.for.inc17_crit_edge.iter25:             ; preds = %for.inc15.iter25
  %split.iter25 = phi i32 [ %add14.iter25, %for.inc15.iter25 ]
  br label %for.inc17.iter25, !dbg !155

iter_25_end:                                      ; preds = %for.inc17.iter25
  br label %iter_26_start

iter_26_start:                                    ; preds = %iter_25_end
  br label %for.cond1.preheader.iter26

for.cond1.preheader.iter26:                       ; preds = %iter_26_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %207 = add i32 %split.iter25, 52, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter26, !dbg !155

for.body6.iter26:                                 ; preds = %for.cond4.preheader.iter26, %m_vec_mul_add.exit.iter26
  %k.02.iter26 = phi i32 [ 0, %for.cond4.preheader.iter26 ], [ %add13.iter26, %m_vec_mul_add.exit.iter26 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter26 = mul nsw i32 %bs_mat_entries_used.14.iter26, 40, !dbg !161
  %add.ptr.iter26 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter26, !dbg !161
  %mul8.iter26 = mul nuw nsw i32 %k.02.iter26, 78, !dbg !164
  %208 = getelementptr i8, ptr %mat, i32 %mul8.iter26, !dbg !165
  %arrayidx.iter26 = getelementptr i8, ptr %208, i32 %c.05.iter26, !dbg !165
  %209 = load i8, ptr %arrayidx.iter26, align 1, !dbg !165
  %add10.iter26 = add nuw nsw i32 260, %k.02.iter26, !dbg !166
  %add.ptr12.idx.iter26 = mul nuw nsw i32 %add10.iter26, 40, !dbg !167
  %add.ptr12.iter26 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter26, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter26 = zext i8 %209 to i32, !dbg !185
  %mul.i.i.iter26 = mul i32 %conv.i.i.iter26, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter26 = and i32 %mul.i.i.iter26, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter26 = lshr exact i32 %and.i.i.iter26, 4, !dbg !191
  %shr1.i.i.iter26 = lshr exact i32 %and.i.i.iter26, 3, !dbg !192
  %210 = xor i32 %shr.i.i.iter26, %shr1.i.i.iter26, !dbg !193
  %xor2.i.i.iter26 = xor i32 %210, %mul.i.i.iter26, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter26, !dbg !199

for.body.i.iter26:                                ; preds = %for.body.i.iter26, %for.body6.iter26
  %i.0.i1.iter26 = phi i32 [ 0, %for.body6.iter26 ], [ %inc.i.iter26, %for.body.i.iter26 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.iter26, i32 %i.0.i1.iter26, !dbg !200
  %211 = load i64, ptr %arrayidx.i.iter26, align 8, !dbg !200
  %and.i.iter26 = and i64 %211, 1229782938247303441, !dbg !203
  %and1.i.iter26 = and i32 %xor2.i.i.iter26, 255, !dbg !204
  %conv.i.iter26 = zext nneg i32 %and1.i.iter26 to i64, !dbg !205
  %mul.i.iter26 = mul i64 %and.i.iter26, %conv.i.iter26, !dbg !206
  %shr.i.iter26 = lshr i64 %211, 1, !dbg !207
  %and3.i.iter26 = and i64 %shr.i.iter26, 1229782938247303441, !dbg !208
  %shr4.i.iter26 = lshr i32 %xor2.i.i.iter26, 8, !dbg !209
  %and5.i.iter26 = and i32 %shr4.i.iter26, 15, !dbg !210
  %conv6.i.iter26 = zext nneg i32 %and5.i.iter26 to i64, !dbg !211
  %mul7.i.iter26 = mul nuw i64 %and3.i.iter26, %conv6.i.iter26, !dbg !212
  %xor.i.iter26 = xor i64 %mul.i.iter26, %mul7.i.iter26, !dbg !213
  %arrayidx8.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.iter26, i32 %i.0.i1.iter26, !dbg !214
  %212 = load i64, ptr %arrayidx8.i.iter26, align 8, !dbg !214
  %shr9.i.iter26 = lshr i64 %212, 2, !dbg !215
  %and10.i.iter26 = and i64 %shr9.i.iter26, 1229782938247303441, !dbg !216
  %shr11.i.iter26 = lshr i32 %xor2.i.i.iter26, 16, !dbg !217
  %and12.i.iter26 = and i32 %shr11.i.iter26, 15, !dbg !218
  %conv13.i.iter26 = zext nneg i32 %and12.i.iter26 to i64, !dbg !219
  %mul14.i.iter26 = mul nuw i64 %and10.i.iter26, %conv13.i.iter26, !dbg !220
  %xor15.i.iter26 = xor i64 %xor.i.iter26, %mul14.i.iter26, !dbg !221
  %arrayidx16.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr.iter26, i32 %i.0.i1.iter26, !dbg !222
  %213 = load i64, ptr %arrayidx16.i.iter26, align 8, !dbg !222
  %shr17.i.iter26 = lshr i64 %213, 3, !dbg !223
  %and18.i.iter26 = and i64 %shr17.i.iter26, 1229782938247303441, !dbg !224
  %shr19.i.iter26 = lshr i32 %xor2.i.i.iter26, 24, !dbg !225
  %and20.i.iter26 = and i32 %shr19.i.iter26, 15, !dbg !226
  %conv21.i.iter26 = zext nneg i32 %and20.i.iter26 to i64, !dbg !227
  %mul22.i.iter26 = mul nuw i64 %and18.i.iter26, %conv21.i.iter26, !dbg !228
  %xor23.i.iter26 = xor i64 %xor15.i.iter26, %mul22.i.iter26, !dbg !229
  %arrayidx24.i.iter26 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter26, i32 %i.0.i1.iter26, !dbg !230
  %214 = load i64, ptr %arrayidx24.i.iter26, align 8, !dbg !231
  %xor25.i.iter26 = xor i64 %214, %xor23.i.iter26, !dbg !231
  store i64 %xor25.i.iter26, ptr %arrayidx24.i.iter26, align 8, !dbg !231
  %inc.i.iter26 = add nuw nsw i32 %i.0.i1.iter26, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter26 = icmp eq i32 %inc.i.iter26, 5, !dbg !233
  br i1 %exitcond.i.not.iter26, label %m_vec_mul_add.exit.iter26, label %for.body.i.iter26, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter26:                        ; preds = %for.body.i.iter26
  %add13.iter26 = add nuw nsw i32 %k.02.iter26, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter26 = icmp eq i32 %add13.iter26, 10, !dbg !238
  br i1 %exitcond.not.iter26, label %for.inc15.iter26, label %for.body6.iter26, !dbg !239, !llvm.loop !240

for.inc15.iter26:                                 ; preds = %m_vec_mul_add.exit.iter26
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter26 = add i32 %bs_mat_entries_used.14.iter26, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter26 = add nuw nsw i32 %c.05.iter26, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter26 = icmp eq i32 %add14.iter26, %207, !dbg !244
  br i1 %exitcond1.not.iter26, label %for.cond1.for.inc17_crit_edge.iter26, label %for.cond4.preheader.iter26, !dbg !155, !llvm.loop !245

for.inc17.iter26:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter26
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_26_end

for.cond4.preheader.iter26:                       ; preds = %for.cond4.preheader.lr.ph.iter26, %for.inc15.iter26
  %c.05.iter26 = phi i32 [ 26, %for.cond4.preheader.lr.ph.iter26 ], [ %inc.iter26, %for.inc15.iter26 ]
  %bs_mat_entries_used.14.iter26 = phi i32 [ %split.iter25, %for.cond4.preheader.lr.ph.iter26 ], [ %add14.iter26, %for.inc15.iter26 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter26, !dbg !239

for.cond4.preheader.lr.ph.iter26:                 ; preds = %for.cond1.preheader.iter26
  br label %for.cond4.preheader.iter26, !dbg !155

for.cond1.for.inc17_crit_edge.iter26:             ; preds = %for.inc15.iter26
  %split.iter26 = phi i32 [ %add14.iter26, %for.inc15.iter26 ]
  br label %for.inc17.iter26, !dbg !155

iter_26_end:                                      ; preds = %for.inc17.iter26
  br label %iter_27_start

iter_27_start:                                    ; preds = %iter_26_end
  br label %for.cond1.preheader.iter27

for.cond1.preheader.iter27:                       ; preds = %iter_27_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %215 = add i32 %split.iter26, 51, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter27, !dbg !155

for.body6.iter27:                                 ; preds = %for.cond4.preheader.iter27, %m_vec_mul_add.exit.iter27
  %k.02.iter27 = phi i32 [ 0, %for.cond4.preheader.iter27 ], [ %add13.iter27, %m_vec_mul_add.exit.iter27 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter27 = mul nsw i32 %bs_mat_entries_used.14.iter27, 40, !dbg !161
  %add.ptr.iter27 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter27, !dbg !161
  %mul8.iter27 = mul nuw nsw i32 %k.02.iter27, 78, !dbg !164
  %216 = getelementptr i8, ptr %mat, i32 %mul8.iter27, !dbg !165
  %arrayidx.iter27 = getelementptr i8, ptr %216, i32 %c.05.iter27, !dbg !165
  %217 = load i8, ptr %arrayidx.iter27, align 1, !dbg !165
  %add10.iter27 = add nuw nsw i32 270, %k.02.iter27, !dbg !166
  %add.ptr12.idx.iter27 = mul nuw nsw i32 %add10.iter27, 40, !dbg !167
  %add.ptr12.iter27 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter27, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter27 = zext i8 %217 to i32, !dbg !185
  %mul.i.i.iter27 = mul i32 %conv.i.i.iter27, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter27 = and i32 %mul.i.i.iter27, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter27 = lshr exact i32 %and.i.i.iter27, 4, !dbg !191
  %shr1.i.i.iter27 = lshr exact i32 %and.i.i.iter27, 3, !dbg !192
  %218 = xor i32 %shr.i.i.iter27, %shr1.i.i.iter27, !dbg !193
  %xor2.i.i.iter27 = xor i32 %218, %mul.i.i.iter27, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter27, !dbg !199

for.body.i.iter27:                                ; preds = %for.body.i.iter27, %for.body6.iter27
  %i.0.i1.iter27 = phi i32 [ 0, %for.body6.iter27 ], [ %inc.i.iter27, %for.body.i.iter27 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.iter27, i32 %i.0.i1.iter27, !dbg !200
  %219 = load i64, ptr %arrayidx.i.iter27, align 8, !dbg !200
  %and.i.iter27 = and i64 %219, 1229782938247303441, !dbg !203
  %and1.i.iter27 = and i32 %xor2.i.i.iter27, 255, !dbg !204
  %conv.i.iter27 = zext nneg i32 %and1.i.iter27 to i64, !dbg !205
  %mul.i.iter27 = mul i64 %and.i.iter27, %conv.i.iter27, !dbg !206
  %shr.i.iter27 = lshr i64 %219, 1, !dbg !207
  %and3.i.iter27 = and i64 %shr.i.iter27, 1229782938247303441, !dbg !208
  %shr4.i.iter27 = lshr i32 %xor2.i.i.iter27, 8, !dbg !209
  %and5.i.iter27 = and i32 %shr4.i.iter27, 15, !dbg !210
  %conv6.i.iter27 = zext nneg i32 %and5.i.iter27 to i64, !dbg !211
  %mul7.i.iter27 = mul nuw i64 %and3.i.iter27, %conv6.i.iter27, !dbg !212
  %xor.i.iter27 = xor i64 %mul.i.iter27, %mul7.i.iter27, !dbg !213
  %arrayidx8.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.iter27, i32 %i.0.i1.iter27, !dbg !214
  %220 = load i64, ptr %arrayidx8.i.iter27, align 8, !dbg !214
  %shr9.i.iter27 = lshr i64 %220, 2, !dbg !215
  %and10.i.iter27 = and i64 %shr9.i.iter27, 1229782938247303441, !dbg !216
  %shr11.i.iter27 = lshr i32 %xor2.i.i.iter27, 16, !dbg !217
  %and12.i.iter27 = and i32 %shr11.i.iter27, 15, !dbg !218
  %conv13.i.iter27 = zext nneg i32 %and12.i.iter27 to i64, !dbg !219
  %mul14.i.iter27 = mul nuw i64 %and10.i.iter27, %conv13.i.iter27, !dbg !220
  %xor15.i.iter27 = xor i64 %xor.i.iter27, %mul14.i.iter27, !dbg !221
  %arrayidx16.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr.iter27, i32 %i.0.i1.iter27, !dbg !222
  %221 = load i64, ptr %arrayidx16.i.iter27, align 8, !dbg !222
  %shr17.i.iter27 = lshr i64 %221, 3, !dbg !223
  %and18.i.iter27 = and i64 %shr17.i.iter27, 1229782938247303441, !dbg !224
  %shr19.i.iter27 = lshr i32 %xor2.i.i.iter27, 24, !dbg !225
  %and20.i.iter27 = and i32 %shr19.i.iter27, 15, !dbg !226
  %conv21.i.iter27 = zext nneg i32 %and20.i.iter27 to i64, !dbg !227
  %mul22.i.iter27 = mul nuw i64 %and18.i.iter27, %conv21.i.iter27, !dbg !228
  %xor23.i.iter27 = xor i64 %xor15.i.iter27, %mul22.i.iter27, !dbg !229
  %arrayidx24.i.iter27 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter27, i32 %i.0.i1.iter27, !dbg !230
  %222 = load i64, ptr %arrayidx24.i.iter27, align 8, !dbg !231
  %xor25.i.iter27 = xor i64 %222, %xor23.i.iter27, !dbg !231
  store i64 %xor25.i.iter27, ptr %arrayidx24.i.iter27, align 8, !dbg !231
  %inc.i.iter27 = add nuw nsw i32 %i.0.i1.iter27, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter27 = icmp eq i32 %inc.i.iter27, 5, !dbg !233
  br i1 %exitcond.i.not.iter27, label %m_vec_mul_add.exit.iter27, label %for.body.i.iter27, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter27:                        ; preds = %for.body.i.iter27
  %add13.iter27 = add nuw nsw i32 %k.02.iter27, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter27 = icmp eq i32 %add13.iter27, 10, !dbg !238
  br i1 %exitcond.not.iter27, label %for.inc15.iter27, label %for.body6.iter27, !dbg !239, !llvm.loop !240

for.inc15.iter27:                                 ; preds = %m_vec_mul_add.exit.iter27
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter27 = add i32 %bs_mat_entries_used.14.iter27, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter27 = add nuw nsw i32 %c.05.iter27, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter27 = icmp eq i32 %add14.iter27, %215, !dbg !244
  br i1 %exitcond1.not.iter27, label %for.cond1.for.inc17_crit_edge.iter27, label %for.cond4.preheader.iter27, !dbg !155, !llvm.loop !245

for.inc17.iter27:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter27
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_27_end

for.cond4.preheader.iter27:                       ; preds = %for.cond4.preheader.lr.ph.iter27, %for.inc15.iter27
  %c.05.iter27 = phi i32 [ 27, %for.cond4.preheader.lr.ph.iter27 ], [ %inc.iter27, %for.inc15.iter27 ]
  %bs_mat_entries_used.14.iter27 = phi i32 [ %split.iter26, %for.cond4.preheader.lr.ph.iter27 ], [ %add14.iter27, %for.inc15.iter27 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter27, !dbg !239

for.cond4.preheader.lr.ph.iter27:                 ; preds = %for.cond1.preheader.iter27
  br label %for.cond4.preheader.iter27, !dbg !155

for.cond1.for.inc17_crit_edge.iter27:             ; preds = %for.inc15.iter27
  %split.iter27 = phi i32 [ %add14.iter27, %for.inc15.iter27 ]
  br label %for.inc17.iter27, !dbg !155

iter_27_end:                                      ; preds = %for.inc17.iter27
  br label %iter_28_start

iter_28_start:                                    ; preds = %iter_27_end
  br label %for.cond1.preheader.iter28

for.cond1.preheader.iter28:                       ; preds = %iter_28_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %223 = add i32 %split.iter27, 50, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter28, !dbg !155

for.body6.iter28:                                 ; preds = %for.cond4.preheader.iter28, %m_vec_mul_add.exit.iter28
  %k.02.iter28 = phi i32 [ 0, %for.cond4.preheader.iter28 ], [ %add13.iter28, %m_vec_mul_add.exit.iter28 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter28 = mul nsw i32 %bs_mat_entries_used.14.iter28, 40, !dbg !161
  %add.ptr.iter28 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter28, !dbg !161
  %mul8.iter28 = mul nuw nsw i32 %k.02.iter28, 78, !dbg !164
  %224 = getelementptr i8, ptr %mat, i32 %mul8.iter28, !dbg !165
  %arrayidx.iter28 = getelementptr i8, ptr %224, i32 %c.05.iter28, !dbg !165
  %225 = load i8, ptr %arrayidx.iter28, align 1, !dbg !165
  %add10.iter28 = add nuw nsw i32 280, %k.02.iter28, !dbg !166
  %add.ptr12.idx.iter28 = mul nuw nsw i32 %add10.iter28, 40, !dbg !167
  %add.ptr12.iter28 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter28, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter28 = zext i8 %225 to i32, !dbg !185
  %mul.i.i.iter28 = mul i32 %conv.i.i.iter28, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter28 = and i32 %mul.i.i.iter28, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter28 = lshr exact i32 %and.i.i.iter28, 4, !dbg !191
  %shr1.i.i.iter28 = lshr exact i32 %and.i.i.iter28, 3, !dbg !192
  %226 = xor i32 %shr.i.i.iter28, %shr1.i.i.iter28, !dbg !193
  %xor2.i.i.iter28 = xor i32 %226, %mul.i.i.iter28, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter28, !dbg !199

for.body.i.iter28:                                ; preds = %for.body.i.iter28, %for.body6.iter28
  %i.0.i1.iter28 = phi i32 [ 0, %for.body6.iter28 ], [ %inc.i.iter28, %for.body.i.iter28 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.iter28, i32 %i.0.i1.iter28, !dbg !200
  %227 = load i64, ptr %arrayidx.i.iter28, align 8, !dbg !200
  %and.i.iter28 = and i64 %227, 1229782938247303441, !dbg !203
  %and1.i.iter28 = and i32 %xor2.i.i.iter28, 255, !dbg !204
  %conv.i.iter28 = zext nneg i32 %and1.i.iter28 to i64, !dbg !205
  %mul.i.iter28 = mul i64 %and.i.iter28, %conv.i.iter28, !dbg !206
  %shr.i.iter28 = lshr i64 %227, 1, !dbg !207
  %and3.i.iter28 = and i64 %shr.i.iter28, 1229782938247303441, !dbg !208
  %shr4.i.iter28 = lshr i32 %xor2.i.i.iter28, 8, !dbg !209
  %and5.i.iter28 = and i32 %shr4.i.iter28, 15, !dbg !210
  %conv6.i.iter28 = zext nneg i32 %and5.i.iter28 to i64, !dbg !211
  %mul7.i.iter28 = mul nuw i64 %and3.i.iter28, %conv6.i.iter28, !dbg !212
  %xor.i.iter28 = xor i64 %mul.i.iter28, %mul7.i.iter28, !dbg !213
  %arrayidx8.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.iter28, i32 %i.0.i1.iter28, !dbg !214
  %228 = load i64, ptr %arrayidx8.i.iter28, align 8, !dbg !214
  %shr9.i.iter28 = lshr i64 %228, 2, !dbg !215
  %and10.i.iter28 = and i64 %shr9.i.iter28, 1229782938247303441, !dbg !216
  %shr11.i.iter28 = lshr i32 %xor2.i.i.iter28, 16, !dbg !217
  %and12.i.iter28 = and i32 %shr11.i.iter28, 15, !dbg !218
  %conv13.i.iter28 = zext nneg i32 %and12.i.iter28 to i64, !dbg !219
  %mul14.i.iter28 = mul nuw i64 %and10.i.iter28, %conv13.i.iter28, !dbg !220
  %xor15.i.iter28 = xor i64 %xor.i.iter28, %mul14.i.iter28, !dbg !221
  %arrayidx16.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr.iter28, i32 %i.0.i1.iter28, !dbg !222
  %229 = load i64, ptr %arrayidx16.i.iter28, align 8, !dbg !222
  %shr17.i.iter28 = lshr i64 %229, 3, !dbg !223
  %and18.i.iter28 = and i64 %shr17.i.iter28, 1229782938247303441, !dbg !224
  %shr19.i.iter28 = lshr i32 %xor2.i.i.iter28, 24, !dbg !225
  %and20.i.iter28 = and i32 %shr19.i.iter28, 15, !dbg !226
  %conv21.i.iter28 = zext nneg i32 %and20.i.iter28 to i64, !dbg !227
  %mul22.i.iter28 = mul nuw i64 %and18.i.iter28, %conv21.i.iter28, !dbg !228
  %xor23.i.iter28 = xor i64 %xor15.i.iter28, %mul22.i.iter28, !dbg !229
  %arrayidx24.i.iter28 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter28, i32 %i.0.i1.iter28, !dbg !230
  %230 = load i64, ptr %arrayidx24.i.iter28, align 8, !dbg !231
  %xor25.i.iter28 = xor i64 %230, %xor23.i.iter28, !dbg !231
  store i64 %xor25.i.iter28, ptr %arrayidx24.i.iter28, align 8, !dbg !231
  %inc.i.iter28 = add nuw nsw i32 %i.0.i1.iter28, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter28 = icmp eq i32 %inc.i.iter28, 5, !dbg !233
  br i1 %exitcond.i.not.iter28, label %m_vec_mul_add.exit.iter28, label %for.body.i.iter28, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter28:                        ; preds = %for.body.i.iter28
  %add13.iter28 = add nuw nsw i32 %k.02.iter28, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter28 = icmp eq i32 %add13.iter28, 10, !dbg !238
  br i1 %exitcond.not.iter28, label %for.inc15.iter28, label %for.body6.iter28, !dbg !239, !llvm.loop !240

for.inc15.iter28:                                 ; preds = %m_vec_mul_add.exit.iter28
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter28 = add i32 %bs_mat_entries_used.14.iter28, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter28 = add nuw nsw i32 %c.05.iter28, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter28 = icmp eq i32 %add14.iter28, %223, !dbg !244
  br i1 %exitcond1.not.iter28, label %for.cond1.for.inc17_crit_edge.iter28, label %for.cond4.preheader.iter28, !dbg !155, !llvm.loop !245

for.inc17.iter28:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter28
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_28_end

for.cond4.preheader.iter28:                       ; preds = %for.cond4.preheader.lr.ph.iter28, %for.inc15.iter28
  %c.05.iter28 = phi i32 [ 28, %for.cond4.preheader.lr.ph.iter28 ], [ %inc.iter28, %for.inc15.iter28 ]
  %bs_mat_entries_used.14.iter28 = phi i32 [ %split.iter27, %for.cond4.preheader.lr.ph.iter28 ], [ %add14.iter28, %for.inc15.iter28 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter28, !dbg !239

for.cond4.preheader.lr.ph.iter28:                 ; preds = %for.cond1.preheader.iter28
  br label %for.cond4.preheader.iter28, !dbg !155

for.cond1.for.inc17_crit_edge.iter28:             ; preds = %for.inc15.iter28
  %split.iter28 = phi i32 [ %add14.iter28, %for.inc15.iter28 ]
  br label %for.inc17.iter28, !dbg !155

iter_28_end:                                      ; preds = %for.inc17.iter28
  br label %iter_29_start

iter_29_start:                                    ; preds = %iter_28_end
  br label %for.cond1.preheader.iter29

for.cond1.preheader.iter29:                       ; preds = %iter_29_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %231 = add i32 %split.iter28, 49, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter29, !dbg !155

for.body6.iter29:                                 ; preds = %for.cond4.preheader.iter29, %m_vec_mul_add.exit.iter29
  %k.02.iter29 = phi i32 [ 0, %for.cond4.preheader.iter29 ], [ %add13.iter29, %m_vec_mul_add.exit.iter29 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter29 = mul nsw i32 %bs_mat_entries_used.14.iter29, 40, !dbg !161
  %add.ptr.iter29 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter29, !dbg !161
  %mul8.iter29 = mul nuw nsw i32 %k.02.iter29, 78, !dbg !164
  %232 = getelementptr i8, ptr %mat, i32 %mul8.iter29, !dbg !165
  %arrayidx.iter29 = getelementptr i8, ptr %232, i32 %c.05.iter29, !dbg !165
  %233 = load i8, ptr %arrayidx.iter29, align 1, !dbg !165
  %add10.iter29 = add nuw nsw i32 290, %k.02.iter29, !dbg !166
  %add.ptr12.idx.iter29 = mul nuw nsw i32 %add10.iter29, 40, !dbg !167
  %add.ptr12.iter29 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter29, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter29 = zext i8 %233 to i32, !dbg !185
  %mul.i.i.iter29 = mul i32 %conv.i.i.iter29, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter29 = and i32 %mul.i.i.iter29, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter29 = lshr exact i32 %and.i.i.iter29, 4, !dbg !191
  %shr1.i.i.iter29 = lshr exact i32 %and.i.i.iter29, 3, !dbg !192
  %234 = xor i32 %shr.i.i.iter29, %shr1.i.i.iter29, !dbg !193
  %xor2.i.i.iter29 = xor i32 %234, %mul.i.i.iter29, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter29, !dbg !199

for.body.i.iter29:                                ; preds = %for.body.i.iter29, %for.body6.iter29
  %i.0.i1.iter29 = phi i32 [ 0, %for.body6.iter29 ], [ %inc.i.iter29, %for.body.i.iter29 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.iter29, i32 %i.0.i1.iter29, !dbg !200
  %235 = load i64, ptr %arrayidx.i.iter29, align 8, !dbg !200
  %and.i.iter29 = and i64 %235, 1229782938247303441, !dbg !203
  %and1.i.iter29 = and i32 %xor2.i.i.iter29, 255, !dbg !204
  %conv.i.iter29 = zext nneg i32 %and1.i.iter29 to i64, !dbg !205
  %mul.i.iter29 = mul i64 %and.i.iter29, %conv.i.iter29, !dbg !206
  %shr.i.iter29 = lshr i64 %235, 1, !dbg !207
  %and3.i.iter29 = and i64 %shr.i.iter29, 1229782938247303441, !dbg !208
  %shr4.i.iter29 = lshr i32 %xor2.i.i.iter29, 8, !dbg !209
  %and5.i.iter29 = and i32 %shr4.i.iter29, 15, !dbg !210
  %conv6.i.iter29 = zext nneg i32 %and5.i.iter29 to i64, !dbg !211
  %mul7.i.iter29 = mul nuw i64 %and3.i.iter29, %conv6.i.iter29, !dbg !212
  %xor.i.iter29 = xor i64 %mul.i.iter29, %mul7.i.iter29, !dbg !213
  %arrayidx8.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.iter29, i32 %i.0.i1.iter29, !dbg !214
  %236 = load i64, ptr %arrayidx8.i.iter29, align 8, !dbg !214
  %shr9.i.iter29 = lshr i64 %236, 2, !dbg !215
  %and10.i.iter29 = and i64 %shr9.i.iter29, 1229782938247303441, !dbg !216
  %shr11.i.iter29 = lshr i32 %xor2.i.i.iter29, 16, !dbg !217
  %and12.i.iter29 = and i32 %shr11.i.iter29, 15, !dbg !218
  %conv13.i.iter29 = zext nneg i32 %and12.i.iter29 to i64, !dbg !219
  %mul14.i.iter29 = mul nuw i64 %and10.i.iter29, %conv13.i.iter29, !dbg !220
  %xor15.i.iter29 = xor i64 %xor.i.iter29, %mul14.i.iter29, !dbg !221
  %arrayidx16.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr.iter29, i32 %i.0.i1.iter29, !dbg !222
  %237 = load i64, ptr %arrayidx16.i.iter29, align 8, !dbg !222
  %shr17.i.iter29 = lshr i64 %237, 3, !dbg !223
  %and18.i.iter29 = and i64 %shr17.i.iter29, 1229782938247303441, !dbg !224
  %shr19.i.iter29 = lshr i32 %xor2.i.i.iter29, 24, !dbg !225
  %and20.i.iter29 = and i32 %shr19.i.iter29, 15, !dbg !226
  %conv21.i.iter29 = zext nneg i32 %and20.i.iter29 to i64, !dbg !227
  %mul22.i.iter29 = mul nuw i64 %and18.i.iter29, %conv21.i.iter29, !dbg !228
  %xor23.i.iter29 = xor i64 %xor15.i.iter29, %mul22.i.iter29, !dbg !229
  %arrayidx24.i.iter29 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter29, i32 %i.0.i1.iter29, !dbg !230
  %238 = load i64, ptr %arrayidx24.i.iter29, align 8, !dbg !231
  %xor25.i.iter29 = xor i64 %238, %xor23.i.iter29, !dbg !231
  store i64 %xor25.i.iter29, ptr %arrayidx24.i.iter29, align 8, !dbg !231
  %inc.i.iter29 = add nuw nsw i32 %i.0.i1.iter29, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter29 = icmp eq i32 %inc.i.iter29, 5, !dbg !233
  br i1 %exitcond.i.not.iter29, label %m_vec_mul_add.exit.iter29, label %for.body.i.iter29, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter29:                        ; preds = %for.body.i.iter29
  %add13.iter29 = add nuw nsw i32 %k.02.iter29, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter29 = icmp eq i32 %add13.iter29, 10, !dbg !238
  br i1 %exitcond.not.iter29, label %for.inc15.iter29, label %for.body6.iter29, !dbg !239, !llvm.loop !240

for.inc15.iter29:                                 ; preds = %m_vec_mul_add.exit.iter29
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter29 = add i32 %bs_mat_entries_used.14.iter29, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter29 = add nuw nsw i32 %c.05.iter29, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter29 = icmp eq i32 %add14.iter29, %231, !dbg !244
  br i1 %exitcond1.not.iter29, label %for.cond1.for.inc17_crit_edge.iter29, label %for.cond4.preheader.iter29, !dbg !155, !llvm.loop !245

for.inc17.iter29:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter29
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_29_end

for.cond4.preheader.iter29:                       ; preds = %for.cond4.preheader.lr.ph.iter29, %for.inc15.iter29
  %c.05.iter29 = phi i32 [ 29, %for.cond4.preheader.lr.ph.iter29 ], [ %inc.iter29, %for.inc15.iter29 ]
  %bs_mat_entries_used.14.iter29 = phi i32 [ %split.iter28, %for.cond4.preheader.lr.ph.iter29 ], [ %add14.iter29, %for.inc15.iter29 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter29, !dbg !239

for.cond4.preheader.lr.ph.iter29:                 ; preds = %for.cond1.preheader.iter29
  br label %for.cond4.preheader.iter29, !dbg !155

for.cond1.for.inc17_crit_edge.iter29:             ; preds = %for.inc15.iter29
  %split.iter29 = phi i32 [ %add14.iter29, %for.inc15.iter29 ]
  br label %for.inc17.iter29, !dbg !155

iter_29_end:                                      ; preds = %for.inc17.iter29
  br label %iter_30_start

iter_30_start:                                    ; preds = %iter_29_end
  br label %for.cond1.preheader.iter30

for.cond1.preheader.iter30:                       ; preds = %iter_30_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %239 = add i32 %split.iter29, 48, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter30, !dbg !155

for.body6.iter30:                                 ; preds = %for.cond4.preheader.iter30, %m_vec_mul_add.exit.iter30
  %k.02.iter30 = phi i32 [ 0, %for.cond4.preheader.iter30 ], [ %add13.iter30, %m_vec_mul_add.exit.iter30 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter30 = mul nsw i32 %bs_mat_entries_used.14.iter30, 40, !dbg !161
  %add.ptr.iter30 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter30, !dbg !161
  %mul8.iter30 = mul nuw nsw i32 %k.02.iter30, 78, !dbg !164
  %240 = getelementptr i8, ptr %mat, i32 %mul8.iter30, !dbg !165
  %arrayidx.iter30 = getelementptr i8, ptr %240, i32 %c.05.iter30, !dbg !165
  %241 = load i8, ptr %arrayidx.iter30, align 1, !dbg !165
  %add10.iter30 = add nuw nsw i32 300, %k.02.iter30, !dbg !166
  %add.ptr12.idx.iter30 = mul nuw nsw i32 %add10.iter30, 40, !dbg !167
  %add.ptr12.iter30 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter30, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter30 = zext i8 %241 to i32, !dbg !185
  %mul.i.i.iter30 = mul i32 %conv.i.i.iter30, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter30 = and i32 %mul.i.i.iter30, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter30 = lshr exact i32 %and.i.i.iter30, 4, !dbg !191
  %shr1.i.i.iter30 = lshr exact i32 %and.i.i.iter30, 3, !dbg !192
  %242 = xor i32 %shr.i.i.iter30, %shr1.i.i.iter30, !dbg !193
  %xor2.i.i.iter30 = xor i32 %242, %mul.i.i.iter30, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter30, !dbg !199

for.body.i.iter30:                                ; preds = %for.body.i.iter30, %for.body6.iter30
  %i.0.i1.iter30 = phi i32 [ 0, %for.body6.iter30 ], [ %inc.i.iter30, %for.body.i.iter30 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.iter30, i32 %i.0.i1.iter30, !dbg !200
  %243 = load i64, ptr %arrayidx.i.iter30, align 8, !dbg !200
  %and.i.iter30 = and i64 %243, 1229782938247303441, !dbg !203
  %and1.i.iter30 = and i32 %xor2.i.i.iter30, 255, !dbg !204
  %conv.i.iter30 = zext nneg i32 %and1.i.iter30 to i64, !dbg !205
  %mul.i.iter30 = mul i64 %and.i.iter30, %conv.i.iter30, !dbg !206
  %shr.i.iter30 = lshr i64 %243, 1, !dbg !207
  %and3.i.iter30 = and i64 %shr.i.iter30, 1229782938247303441, !dbg !208
  %shr4.i.iter30 = lshr i32 %xor2.i.i.iter30, 8, !dbg !209
  %and5.i.iter30 = and i32 %shr4.i.iter30, 15, !dbg !210
  %conv6.i.iter30 = zext nneg i32 %and5.i.iter30 to i64, !dbg !211
  %mul7.i.iter30 = mul nuw i64 %and3.i.iter30, %conv6.i.iter30, !dbg !212
  %xor.i.iter30 = xor i64 %mul.i.iter30, %mul7.i.iter30, !dbg !213
  %arrayidx8.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.iter30, i32 %i.0.i1.iter30, !dbg !214
  %244 = load i64, ptr %arrayidx8.i.iter30, align 8, !dbg !214
  %shr9.i.iter30 = lshr i64 %244, 2, !dbg !215
  %and10.i.iter30 = and i64 %shr9.i.iter30, 1229782938247303441, !dbg !216
  %shr11.i.iter30 = lshr i32 %xor2.i.i.iter30, 16, !dbg !217
  %and12.i.iter30 = and i32 %shr11.i.iter30, 15, !dbg !218
  %conv13.i.iter30 = zext nneg i32 %and12.i.iter30 to i64, !dbg !219
  %mul14.i.iter30 = mul nuw i64 %and10.i.iter30, %conv13.i.iter30, !dbg !220
  %xor15.i.iter30 = xor i64 %xor.i.iter30, %mul14.i.iter30, !dbg !221
  %arrayidx16.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr.iter30, i32 %i.0.i1.iter30, !dbg !222
  %245 = load i64, ptr %arrayidx16.i.iter30, align 8, !dbg !222
  %shr17.i.iter30 = lshr i64 %245, 3, !dbg !223
  %and18.i.iter30 = and i64 %shr17.i.iter30, 1229782938247303441, !dbg !224
  %shr19.i.iter30 = lshr i32 %xor2.i.i.iter30, 24, !dbg !225
  %and20.i.iter30 = and i32 %shr19.i.iter30, 15, !dbg !226
  %conv21.i.iter30 = zext nneg i32 %and20.i.iter30 to i64, !dbg !227
  %mul22.i.iter30 = mul nuw i64 %and18.i.iter30, %conv21.i.iter30, !dbg !228
  %xor23.i.iter30 = xor i64 %xor15.i.iter30, %mul22.i.iter30, !dbg !229
  %arrayidx24.i.iter30 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter30, i32 %i.0.i1.iter30, !dbg !230
  %246 = load i64, ptr %arrayidx24.i.iter30, align 8, !dbg !231
  %xor25.i.iter30 = xor i64 %246, %xor23.i.iter30, !dbg !231
  store i64 %xor25.i.iter30, ptr %arrayidx24.i.iter30, align 8, !dbg !231
  %inc.i.iter30 = add nuw nsw i32 %i.0.i1.iter30, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter30 = icmp eq i32 %inc.i.iter30, 5, !dbg !233
  br i1 %exitcond.i.not.iter30, label %m_vec_mul_add.exit.iter30, label %for.body.i.iter30, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter30:                        ; preds = %for.body.i.iter30
  %add13.iter30 = add nuw nsw i32 %k.02.iter30, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter30 = icmp eq i32 %add13.iter30, 10, !dbg !238
  br i1 %exitcond.not.iter30, label %for.inc15.iter30, label %for.body6.iter30, !dbg !239, !llvm.loop !240

for.inc15.iter30:                                 ; preds = %m_vec_mul_add.exit.iter30
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter30 = add i32 %bs_mat_entries_used.14.iter30, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter30 = add nuw nsw i32 %c.05.iter30, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter30 = icmp eq i32 %add14.iter30, %239, !dbg !244
  br i1 %exitcond1.not.iter30, label %for.cond1.for.inc17_crit_edge.iter30, label %for.cond4.preheader.iter30, !dbg !155, !llvm.loop !245

for.inc17.iter30:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter30
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_30_end

for.cond4.preheader.iter30:                       ; preds = %for.cond4.preheader.lr.ph.iter30, %for.inc15.iter30
  %c.05.iter30 = phi i32 [ 30, %for.cond4.preheader.lr.ph.iter30 ], [ %inc.iter30, %for.inc15.iter30 ]
  %bs_mat_entries_used.14.iter30 = phi i32 [ %split.iter29, %for.cond4.preheader.lr.ph.iter30 ], [ %add14.iter30, %for.inc15.iter30 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter30, !dbg !239

for.cond4.preheader.lr.ph.iter30:                 ; preds = %for.cond1.preheader.iter30
  br label %for.cond4.preheader.iter30, !dbg !155

for.cond1.for.inc17_crit_edge.iter30:             ; preds = %for.inc15.iter30
  %split.iter30 = phi i32 [ %add14.iter30, %for.inc15.iter30 ]
  br label %for.inc17.iter30, !dbg !155

iter_30_end:                                      ; preds = %for.inc17.iter30
  br label %iter_31_start

iter_31_start:                                    ; preds = %iter_30_end
  br label %for.cond1.preheader.iter31

for.cond1.preheader.iter31:                       ; preds = %iter_31_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %247 = add i32 %split.iter30, 47, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter31, !dbg !155

for.body6.iter31:                                 ; preds = %for.cond4.preheader.iter31, %m_vec_mul_add.exit.iter31
  %k.02.iter31 = phi i32 [ 0, %for.cond4.preheader.iter31 ], [ %add13.iter31, %m_vec_mul_add.exit.iter31 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter31 = mul nsw i32 %bs_mat_entries_used.14.iter31, 40, !dbg !161
  %add.ptr.iter31 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter31, !dbg !161
  %mul8.iter31 = mul nuw nsw i32 %k.02.iter31, 78, !dbg !164
  %248 = getelementptr i8, ptr %mat, i32 %mul8.iter31, !dbg !165
  %arrayidx.iter31 = getelementptr i8, ptr %248, i32 %c.05.iter31, !dbg !165
  %249 = load i8, ptr %arrayidx.iter31, align 1, !dbg !165
  %add10.iter31 = add nuw nsw i32 310, %k.02.iter31, !dbg !166
  %add.ptr12.idx.iter31 = mul nuw nsw i32 %add10.iter31, 40, !dbg !167
  %add.ptr12.iter31 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter31, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter31 = zext i8 %249 to i32, !dbg !185
  %mul.i.i.iter31 = mul i32 %conv.i.i.iter31, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter31 = and i32 %mul.i.i.iter31, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter31 = lshr exact i32 %and.i.i.iter31, 4, !dbg !191
  %shr1.i.i.iter31 = lshr exact i32 %and.i.i.iter31, 3, !dbg !192
  %250 = xor i32 %shr.i.i.iter31, %shr1.i.i.iter31, !dbg !193
  %xor2.i.i.iter31 = xor i32 %250, %mul.i.i.iter31, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter31, !dbg !199

for.body.i.iter31:                                ; preds = %for.body.i.iter31, %for.body6.iter31
  %i.0.i1.iter31 = phi i32 [ 0, %for.body6.iter31 ], [ %inc.i.iter31, %for.body.i.iter31 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.iter31, i32 %i.0.i1.iter31, !dbg !200
  %251 = load i64, ptr %arrayidx.i.iter31, align 8, !dbg !200
  %and.i.iter31 = and i64 %251, 1229782938247303441, !dbg !203
  %and1.i.iter31 = and i32 %xor2.i.i.iter31, 255, !dbg !204
  %conv.i.iter31 = zext nneg i32 %and1.i.iter31 to i64, !dbg !205
  %mul.i.iter31 = mul i64 %and.i.iter31, %conv.i.iter31, !dbg !206
  %shr.i.iter31 = lshr i64 %251, 1, !dbg !207
  %and3.i.iter31 = and i64 %shr.i.iter31, 1229782938247303441, !dbg !208
  %shr4.i.iter31 = lshr i32 %xor2.i.i.iter31, 8, !dbg !209
  %and5.i.iter31 = and i32 %shr4.i.iter31, 15, !dbg !210
  %conv6.i.iter31 = zext nneg i32 %and5.i.iter31 to i64, !dbg !211
  %mul7.i.iter31 = mul nuw i64 %and3.i.iter31, %conv6.i.iter31, !dbg !212
  %xor.i.iter31 = xor i64 %mul.i.iter31, %mul7.i.iter31, !dbg !213
  %arrayidx8.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.iter31, i32 %i.0.i1.iter31, !dbg !214
  %252 = load i64, ptr %arrayidx8.i.iter31, align 8, !dbg !214
  %shr9.i.iter31 = lshr i64 %252, 2, !dbg !215
  %and10.i.iter31 = and i64 %shr9.i.iter31, 1229782938247303441, !dbg !216
  %shr11.i.iter31 = lshr i32 %xor2.i.i.iter31, 16, !dbg !217
  %and12.i.iter31 = and i32 %shr11.i.iter31, 15, !dbg !218
  %conv13.i.iter31 = zext nneg i32 %and12.i.iter31 to i64, !dbg !219
  %mul14.i.iter31 = mul nuw i64 %and10.i.iter31, %conv13.i.iter31, !dbg !220
  %xor15.i.iter31 = xor i64 %xor.i.iter31, %mul14.i.iter31, !dbg !221
  %arrayidx16.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr.iter31, i32 %i.0.i1.iter31, !dbg !222
  %253 = load i64, ptr %arrayidx16.i.iter31, align 8, !dbg !222
  %shr17.i.iter31 = lshr i64 %253, 3, !dbg !223
  %and18.i.iter31 = and i64 %shr17.i.iter31, 1229782938247303441, !dbg !224
  %shr19.i.iter31 = lshr i32 %xor2.i.i.iter31, 24, !dbg !225
  %and20.i.iter31 = and i32 %shr19.i.iter31, 15, !dbg !226
  %conv21.i.iter31 = zext nneg i32 %and20.i.iter31 to i64, !dbg !227
  %mul22.i.iter31 = mul nuw i64 %and18.i.iter31, %conv21.i.iter31, !dbg !228
  %xor23.i.iter31 = xor i64 %xor15.i.iter31, %mul22.i.iter31, !dbg !229
  %arrayidx24.i.iter31 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter31, i32 %i.0.i1.iter31, !dbg !230
  %254 = load i64, ptr %arrayidx24.i.iter31, align 8, !dbg !231
  %xor25.i.iter31 = xor i64 %254, %xor23.i.iter31, !dbg !231
  store i64 %xor25.i.iter31, ptr %arrayidx24.i.iter31, align 8, !dbg !231
  %inc.i.iter31 = add nuw nsw i32 %i.0.i1.iter31, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter31 = icmp eq i32 %inc.i.iter31, 5, !dbg !233
  br i1 %exitcond.i.not.iter31, label %m_vec_mul_add.exit.iter31, label %for.body.i.iter31, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter31:                        ; preds = %for.body.i.iter31
  %add13.iter31 = add nuw nsw i32 %k.02.iter31, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter31 = icmp eq i32 %add13.iter31, 10, !dbg !238
  br i1 %exitcond.not.iter31, label %for.inc15.iter31, label %for.body6.iter31, !dbg !239, !llvm.loop !240

for.inc15.iter31:                                 ; preds = %m_vec_mul_add.exit.iter31
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter31 = add i32 %bs_mat_entries_used.14.iter31, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter31 = add nuw nsw i32 %c.05.iter31, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter31 = icmp eq i32 %add14.iter31, %247, !dbg !244
  br i1 %exitcond1.not.iter31, label %for.cond1.for.inc17_crit_edge.iter31, label %for.cond4.preheader.iter31, !dbg !155, !llvm.loop !245

for.inc17.iter31:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter31
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_31_end

for.cond4.preheader.iter31:                       ; preds = %for.cond4.preheader.lr.ph.iter31, %for.inc15.iter31
  %c.05.iter31 = phi i32 [ 31, %for.cond4.preheader.lr.ph.iter31 ], [ %inc.iter31, %for.inc15.iter31 ]
  %bs_mat_entries_used.14.iter31 = phi i32 [ %split.iter30, %for.cond4.preheader.lr.ph.iter31 ], [ %add14.iter31, %for.inc15.iter31 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter31, !dbg !239

for.cond4.preheader.lr.ph.iter31:                 ; preds = %for.cond1.preheader.iter31
  br label %for.cond4.preheader.iter31, !dbg !155

for.cond1.for.inc17_crit_edge.iter31:             ; preds = %for.inc15.iter31
  %split.iter31 = phi i32 [ %add14.iter31, %for.inc15.iter31 ]
  br label %for.inc17.iter31, !dbg !155

iter_31_end:                                      ; preds = %for.inc17.iter31
  br label %iter_32_start

iter_32_start:                                    ; preds = %iter_31_end
  br label %for.cond1.preheader.iter32

for.cond1.preheader.iter32:                       ; preds = %iter_32_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %255 = add i32 %split.iter31, 46, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter32, !dbg !155

for.body6.iter32:                                 ; preds = %for.cond4.preheader.iter32, %m_vec_mul_add.exit.iter32
  %k.02.iter32 = phi i32 [ 0, %for.cond4.preheader.iter32 ], [ %add13.iter32, %m_vec_mul_add.exit.iter32 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter32 = mul nsw i32 %bs_mat_entries_used.14.iter32, 40, !dbg !161
  %add.ptr.iter32 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter32, !dbg !161
  %mul8.iter32 = mul nuw nsw i32 %k.02.iter32, 78, !dbg !164
  %256 = getelementptr i8, ptr %mat, i32 %mul8.iter32, !dbg !165
  %arrayidx.iter32 = getelementptr i8, ptr %256, i32 %c.05.iter32, !dbg !165
  %257 = load i8, ptr %arrayidx.iter32, align 1, !dbg !165
  %add10.iter32 = add nuw nsw i32 320, %k.02.iter32, !dbg !166
  %add.ptr12.idx.iter32 = mul nuw nsw i32 %add10.iter32, 40, !dbg !167
  %add.ptr12.iter32 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter32, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter32 = zext i8 %257 to i32, !dbg !185
  %mul.i.i.iter32 = mul i32 %conv.i.i.iter32, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter32 = and i32 %mul.i.i.iter32, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter32 = lshr exact i32 %and.i.i.iter32, 4, !dbg !191
  %shr1.i.i.iter32 = lshr exact i32 %and.i.i.iter32, 3, !dbg !192
  %258 = xor i32 %shr.i.i.iter32, %shr1.i.i.iter32, !dbg !193
  %xor2.i.i.iter32 = xor i32 %258, %mul.i.i.iter32, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter32, !dbg !199

for.body.i.iter32:                                ; preds = %for.body.i.iter32, %for.body6.iter32
  %i.0.i1.iter32 = phi i32 [ 0, %for.body6.iter32 ], [ %inc.i.iter32, %for.body.i.iter32 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.iter32, i32 %i.0.i1.iter32, !dbg !200
  %259 = load i64, ptr %arrayidx.i.iter32, align 8, !dbg !200
  %and.i.iter32 = and i64 %259, 1229782938247303441, !dbg !203
  %and1.i.iter32 = and i32 %xor2.i.i.iter32, 255, !dbg !204
  %conv.i.iter32 = zext nneg i32 %and1.i.iter32 to i64, !dbg !205
  %mul.i.iter32 = mul i64 %and.i.iter32, %conv.i.iter32, !dbg !206
  %shr.i.iter32 = lshr i64 %259, 1, !dbg !207
  %and3.i.iter32 = and i64 %shr.i.iter32, 1229782938247303441, !dbg !208
  %shr4.i.iter32 = lshr i32 %xor2.i.i.iter32, 8, !dbg !209
  %and5.i.iter32 = and i32 %shr4.i.iter32, 15, !dbg !210
  %conv6.i.iter32 = zext nneg i32 %and5.i.iter32 to i64, !dbg !211
  %mul7.i.iter32 = mul nuw i64 %and3.i.iter32, %conv6.i.iter32, !dbg !212
  %xor.i.iter32 = xor i64 %mul.i.iter32, %mul7.i.iter32, !dbg !213
  %arrayidx8.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.iter32, i32 %i.0.i1.iter32, !dbg !214
  %260 = load i64, ptr %arrayidx8.i.iter32, align 8, !dbg !214
  %shr9.i.iter32 = lshr i64 %260, 2, !dbg !215
  %and10.i.iter32 = and i64 %shr9.i.iter32, 1229782938247303441, !dbg !216
  %shr11.i.iter32 = lshr i32 %xor2.i.i.iter32, 16, !dbg !217
  %and12.i.iter32 = and i32 %shr11.i.iter32, 15, !dbg !218
  %conv13.i.iter32 = zext nneg i32 %and12.i.iter32 to i64, !dbg !219
  %mul14.i.iter32 = mul nuw i64 %and10.i.iter32, %conv13.i.iter32, !dbg !220
  %xor15.i.iter32 = xor i64 %xor.i.iter32, %mul14.i.iter32, !dbg !221
  %arrayidx16.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr.iter32, i32 %i.0.i1.iter32, !dbg !222
  %261 = load i64, ptr %arrayidx16.i.iter32, align 8, !dbg !222
  %shr17.i.iter32 = lshr i64 %261, 3, !dbg !223
  %and18.i.iter32 = and i64 %shr17.i.iter32, 1229782938247303441, !dbg !224
  %shr19.i.iter32 = lshr i32 %xor2.i.i.iter32, 24, !dbg !225
  %and20.i.iter32 = and i32 %shr19.i.iter32, 15, !dbg !226
  %conv21.i.iter32 = zext nneg i32 %and20.i.iter32 to i64, !dbg !227
  %mul22.i.iter32 = mul nuw i64 %and18.i.iter32, %conv21.i.iter32, !dbg !228
  %xor23.i.iter32 = xor i64 %xor15.i.iter32, %mul22.i.iter32, !dbg !229
  %arrayidx24.i.iter32 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter32, i32 %i.0.i1.iter32, !dbg !230
  %262 = load i64, ptr %arrayidx24.i.iter32, align 8, !dbg !231
  %xor25.i.iter32 = xor i64 %262, %xor23.i.iter32, !dbg !231
  store i64 %xor25.i.iter32, ptr %arrayidx24.i.iter32, align 8, !dbg !231
  %inc.i.iter32 = add nuw nsw i32 %i.0.i1.iter32, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter32 = icmp eq i32 %inc.i.iter32, 5, !dbg !233
  br i1 %exitcond.i.not.iter32, label %m_vec_mul_add.exit.iter32, label %for.body.i.iter32, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter32:                        ; preds = %for.body.i.iter32
  %add13.iter32 = add nuw nsw i32 %k.02.iter32, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter32 = icmp eq i32 %add13.iter32, 10, !dbg !238
  br i1 %exitcond.not.iter32, label %for.inc15.iter32, label %for.body6.iter32, !dbg !239, !llvm.loop !240

for.inc15.iter32:                                 ; preds = %m_vec_mul_add.exit.iter32
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter32 = add i32 %bs_mat_entries_used.14.iter32, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter32 = add nuw nsw i32 %c.05.iter32, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter32 = icmp eq i32 %add14.iter32, %255, !dbg !244
  br i1 %exitcond1.not.iter32, label %for.cond1.for.inc17_crit_edge.iter32, label %for.cond4.preheader.iter32, !dbg !155, !llvm.loop !245

for.inc17.iter32:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter32
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_32_end

for.cond4.preheader.iter32:                       ; preds = %for.cond4.preheader.lr.ph.iter32, %for.inc15.iter32
  %c.05.iter32 = phi i32 [ 32, %for.cond4.preheader.lr.ph.iter32 ], [ %inc.iter32, %for.inc15.iter32 ]
  %bs_mat_entries_used.14.iter32 = phi i32 [ %split.iter31, %for.cond4.preheader.lr.ph.iter32 ], [ %add14.iter32, %for.inc15.iter32 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter32, !dbg !239

for.cond4.preheader.lr.ph.iter32:                 ; preds = %for.cond1.preheader.iter32
  br label %for.cond4.preheader.iter32, !dbg !155

for.cond1.for.inc17_crit_edge.iter32:             ; preds = %for.inc15.iter32
  %split.iter32 = phi i32 [ %add14.iter32, %for.inc15.iter32 ]
  br label %for.inc17.iter32, !dbg !155

iter_32_end:                                      ; preds = %for.inc17.iter32
  br label %iter_33_start

iter_33_start:                                    ; preds = %iter_32_end
  br label %for.cond1.preheader.iter33

for.cond1.preheader.iter33:                       ; preds = %iter_33_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %263 = add i32 %split.iter32, 45, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter33, !dbg !155

for.body6.iter33:                                 ; preds = %for.cond4.preheader.iter33, %m_vec_mul_add.exit.iter33
  %k.02.iter33 = phi i32 [ 0, %for.cond4.preheader.iter33 ], [ %add13.iter33, %m_vec_mul_add.exit.iter33 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter33 = mul nsw i32 %bs_mat_entries_used.14.iter33, 40, !dbg !161
  %add.ptr.iter33 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter33, !dbg !161
  %mul8.iter33 = mul nuw nsw i32 %k.02.iter33, 78, !dbg !164
  %264 = getelementptr i8, ptr %mat, i32 %mul8.iter33, !dbg !165
  %arrayidx.iter33 = getelementptr i8, ptr %264, i32 %c.05.iter33, !dbg !165
  %265 = load i8, ptr %arrayidx.iter33, align 1, !dbg !165
  %add10.iter33 = add nuw nsw i32 330, %k.02.iter33, !dbg !166
  %add.ptr12.idx.iter33 = mul nuw nsw i32 %add10.iter33, 40, !dbg !167
  %add.ptr12.iter33 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter33, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter33 = zext i8 %265 to i32, !dbg !185
  %mul.i.i.iter33 = mul i32 %conv.i.i.iter33, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter33 = and i32 %mul.i.i.iter33, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter33 = lshr exact i32 %and.i.i.iter33, 4, !dbg !191
  %shr1.i.i.iter33 = lshr exact i32 %and.i.i.iter33, 3, !dbg !192
  %266 = xor i32 %shr.i.i.iter33, %shr1.i.i.iter33, !dbg !193
  %xor2.i.i.iter33 = xor i32 %266, %mul.i.i.iter33, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter33, !dbg !199

for.body.i.iter33:                                ; preds = %for.body.i.iter33, %for.body6.iter33
  %i.0.i1.iter33 = phi i32 [ 0, %for.body6.iter33 ], [ %inc.i.iter33, %for.body.i.iter33 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.iter33, i32 %i.0.i1.iter33, !dbg !200
  %267 = load i64, ptr %arrayidx.i.iter33, align 8, !dbg !200
  %and.i.iter33 = and i64 %267, 1229782938247303441, !dbg !203
  %and1.i.iter33 = and i32 %xor2.i.i.iter33, 255, !dbg !204
  %conv.i.iter33 = zext nneg i32 %and1.i.iter33 to i64, !dbg !205
  %mul.i.iter33 = mul i64 %and.i.iter33, %conv.i.iter33, !dbg !206
  %shr.i.iter33 = lshr i64 %267, 1, !dbg !207
  %and3.i.iter33 = and i64 %shr.i.iter33, 1229782938247303441, !dbg !208
  %shr4.i.iter33 = lshr i32 %xor2.i.i.iter33, 8, !dbg !209
  %and5.i.iter33 = and i32 %shr4.i.iter33, 15, !dbg !210
  %conv6.i.iter33 = zext nneg i32 %and5.i.iter33 to i64, !dbg !211
  %mul7.i.iter33 = mul nuw i64 %and3.i.iter33, %conv6.i.iter33, !dbg !212
  %xor.i.iter33 = xor i64 %mul.i.iter33, %mul7.i.iter33, !dbg !213
  %arrayidx8.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.iter33, i32 %i.0.i1.iter33, !dbg !214
  %268 = load i64, ptr %arrayidx8.i.iter33, align 8, !dbg !214
  %shr9.i.iter33 = lshr i64 %268, 2, !dbg !215
  %and10.i.iter33 = and i64 %shr9.i.iter33, 1229782938247303441, !dbg !216
  %shr11.i.iter33 = lshr i32 %xor2.i.i.iter33, 16, !dbg !217
  %and12.i.iter33 = and i32 %shr11.i.iter33, 15, !dbg !218
  %conv13.i.iter33 = zext nneg i32 %and12.i.iter33 to i64, !dbg !219
  %mul14.i.iter33 = mul nuw i64 %and10.i.iter33, %conv13.i.iter33, !dbg !220
  %xor15.i.iter33 = xor i64 %xor.i.iter33, %mul14.i.iter33, !dbg !221
  %arrayidx16.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr.iter33, i32 %i.0.i1.iter33, !dbg !222
  %269 = load i64, ptr %arrayidx16.i.iter33, align 8, !dbg !222
  %shr17.i.iter33 = lshr i64 %269, 3, !dbg !223
  %and18.i.iter33 = and i64 %shr17.i.iter33, 1229782938247303441, !dbg !224
  %shr19.i.iter33 = lshr i32 %xor2.i.i.iter33, 24, !dbg !225
  %and20.i.iter33 = and i32 %shr19.i.iter33, 15, !dbg !226
  %conv21.i.iter33 = zext nneg i32 %and20.i.iter33 to i64, !dbg !227
  %mul22.i.iter33 = mul nuw i64 %and18.i.iter33, %conv21.i.iter33, !dbg !228
  %xor23.i.iter33 = xor i64 %xor15.i.iter33, %mul22.i.iter33, !dbg !229
  %arrayidx24.i.iter33 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter33, i32 %i.0.i1.iter33, !dbg !230
  %270 = load i64, ptr %arrayidx24.i.iter33, align 8, !dbg !231
  %xor25.i.iter33 = xor i64 %270, %xor23.i.iter33, !dbg !231
  store i64 %xor25.i.iter33, ptr %arrayidx24.i.iter33, align 8, !dbg !231
  %inc.i.iter33 = add nuw nsw i32 %i.0.i1.iter33, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter33 = icmp eq i32 %inc.i.iter33, 5, !dbg !233
  br i1 %exitcond.i.not.iter33, label %m_vec_mul_add.exit.iter33, label %for.body.i.iter33, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter33:                        ; preds = %for.body.i.iter33
  %add13.iter33 = add nuw nsw i32 %k.02.iter33, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter33 = icmp eq i32 %add13.iter33, 10, !dbg !238
  br i1 %exitcond.not.iter33, label %for.inc15.iter33, label %for.body6.iter33, !dbg !239, !llvm.loop !240

for.inc15.iter33:                                 ; preds = %m_vec_mul_add.exit.iter33
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter33 = add i32 %bs_mat_entries_used.14.iter33, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter33 = add nuw nsw i32 %c.05.iter33, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter33 = icmp eq i32 %add14.iter33, %263, !dbg !244
  br i1 %exitcond1.not.iter33, label %for.cond1.for.inc17_crit_edge.iter33, label %for.cond4.preheader.iter33, !dbg !155, !llvm.loop !245

for.inc17.iter33:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter33
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_33_end

for.cond4.preheader.iter33:                       ; preds = %for.cond4.preheader.lr.ph.iter33, %for.inc15.iter33
  %c.05.iter33 = phi i32 [ 33, %for.cond4.preheader.lr.ph.iter33 ], [ %inc.iter33, %for.inc15.iter33 ]
  %bs_mat_entries_used.14.iter33 = phi i32 [ %split.iter32, %for.cond4.preheader.lr.ph.iter33 ], [ %add14.iter33, %for.inc15.iter33 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter33, !dbg !239

for.cond4.preheader.lr.ph.iter33:                 ; preds = %for.cond1.preheader.iter33
  br label %for.cond4.preheader.iter33, !dbg !155

for.cond1.for.inc17_crit_edge.iter33:             ; preds = %for.inc15.iter33
  %split.iter33 = phi i32 [ %add14.iter33, %for.inc15.iter33 ]
  br label %for.inc17.iter33, !dbg !155

iter_33_end:                                      ; preds = %for.inc17.iter33
  br label %iter_34_start

iter_34_start:                                    ; preds = %iter_33_end
  br label %for.cond1.preheader.iter34

for.cond1.preheader.iter34:                       ; preds = %iter_34_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %271 = add i32 %split.iter33, 44, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter34, !dbg !155

for.body6.iter34:                                 ; preds = %for.cond4.preheader.iter34, %m_vec_mul_add.exit.iter34
  %k.02.iter34 = phi i32 [ 0, %for.cond4.preheader.iter34 ], [ %add13.iter34, %m_vec_mul_add.exit.iter34 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter34 = mul nsw i32 %bs_mat_entries_used.14.iter34, 40, !dbg !161
  %add.ptr.iter34 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter34, !dbg !161
  %mul8.iter34 = mul nuw nsw i32 %k.02.iter34, 78, !dbg !164
  %272 = getelementptr i8, ptr %mat, i32 %mul8.iter34, !dbg !165
  %arrayidx.iter34 = getelementptr i8, ptr %272, i32 %c.05.iter34, !dbg !165
  %273 = load i8, ptr %arrayidx.iter34, align 1, !dbg !165
  %add10.iter34 = add nuw nsw i32 340, %k.02.iter34, !dbg !166
  %add.ptr12.idx.iter34 = mul nuw nsw i32 %add10.iter34, 40, !dbg !167
  %add.ptr12.iter34 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter34, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter34 = zext i8 %273 to i32, !dbg !185
  %mul.i.i.iter34 = mul i32 %conv.i.i.iter34, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter34 = and i32 %mul.i.i.iter34, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter34 = lshr exact i32 %and.i.i.iter34, 4, !dbg !191
  %shr1.i.i.iter34 = lshr exact i32 %and.i.i.iter34, 3, !dbg !192
  %274 = xor i32 %shr.i.i.iter34, %shr1.i.i.iter34, !dbg !193
  %xor2.i.i.iter34 = xor i32 %274, %mul.i.i.iter34, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter34, !dbg !199

for.body.i.iter34:                                ; preds = %for.body.i.iter34, %for.body6.iter34
  %i.0.i1.iter34 = phi i32 [ 0, %for.body6.iter34 ], [ %inc.i.iter34, %for.body.i.iter34 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.iter34, i32 %i.0.i1.iter34, !dbg !200
  %275 = load i64, ptr %arrayidx.i.iter34, align 8, !dbg !200
  %and.i.iter34 = and i64 %275, 1229782938247303441, !dbg !203
  %and1.i.iter34 = and i32 %xor2.i.i.iter34, 255, !dbg !204
  %conv.i.iter34 = zext nneg i32 %and1.i.iter34 to i64, !dbg !205
  %mul.i.iter34 = mul i64 %and.i.iter34, %conv.i.iter34, !dbg !206
  %shr.i.iter34 = lshr i64 %275, 1, !dbg !207
  %and3.i.iter34 = and i64 %shr.i.iter34, 1229782938247303441, !dbg !208
  %shr4.i.iter34 = lshr i32 %xor2.i.i.iter34, 8, !dbg !209
  %and5.i.iter34 = and i32 %shr4.i.iter34, 15, !dbg !210
  %conv6.i.iter34 = zext nneg i32 %and5.i.iter34 to i64, !dbg !211
  %mul7.i.iter34 = mul nuw i64 %and3.i.iter34, %conv6.i.iter34, !dbg !212
  %xor.i.iter34 = xor i64 %mul.i.iter34, %mul7.i.iter34, !dbg !213
  %arrayidx8.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.iter34, i32 %i.0.i1.iter34, !dbg !214
  %276 = load i64, ptr %arrayidx8.i.iter34, align 8, !dbg !214
  %shr9.i.iter34 = lshr i64 %276, 2, !dbg !215
  %and10.i.iter34 = and i64 %shr9.i.iter34, 1229782938247303441, !dbg !216
  %shr11.i.iter34 = lshr i32 %xor2.i.i.iter34, 16, !dbg !217
  %and12.i.iter34 = and i32 %shr11.i.iter34, 15, !dbg !218
  %conv13.i.iter34 = zext nneg i32 %and12.i.iter34 to i64, !dbg !219
  %mul14.i.iter34 = mul nuw i64 %and10.i.iter34, %conv13.i.iter34, !dbg !220
  %xor15.i.iter34 = xor i64 %xor.i.iter34, %mul14.i.iter34, !dbg !221
  %arrayidx16.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr.iter34, i32 %i.0.i1.iter34, !dbg !222
  %277 = load i64, ptr %arrayidx16.i.iter34, align 8, !dbg !222
  %shr17.i.iter34 = lshr i64 %277, 3, !dbg !223
  %and18.i.iter34 = and i64 %shr17.i.iter34, 1229782938247303441, !dbg !224
  %shr19.i.iter34 = lshr i32 %xor2.i.i.iter34, 24, !dbg !225
  %and20.i.iter34 = and i32 %shr19.i.iter34, 15, !dbg !226
  %conv21.i.iter34 = zext nneg i32 %and20.i.iter34 to i64, !dbg !227
  %mul22.i.iter34 = mul nuw i64 %and18.i.iter34, %conv21.i.iter34, !dbg !228
  %xor23.i.iter34 = xor i64 %xor15.i.iter34, %mul22.i.iter34, !dbg !229
  %arrayidx24.i.iter34 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter34, i32 %i.0.i1.iter34, !dbg !230
  %278 = load i64, ptr %arrayidx24.i.iter34, align 8, !dbg !231
  %xor25.i.iter34 = xor i64 %278, %xor23.i.iter34, !dbg !231
  store i64 %xor25.i.iter34, ptr %arrayidx24.i.iter34, align 8, !dbg !231
  %inc.i.iter34 = add nuw nsw i32 %i.0.i1.iter34, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter34 = icmp eq i32 %inc.i.iter34, 5, !dbg !233
  br i1 %exitcond.i.not.iter34, label %m_vec_mul_add.exit.iter34, label %for.body.i.iter34, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter34:                        ; preds = %for.body.i.iter34
  %add13.iter34 = add nuw nsw i32 %k.02.iter34, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter34 = icmp eq i32 %add13.iter34, 10, !dbg !238
  br i1 %exitcond.not.iter34, label %for.inc15.iter34, label %for.body6.iter34, !dbg !239, !llvm.loop !240

for.inc15.iter34:                                 ; preds = %m_vec_mul_add.exit.iter34
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter34 = add i32 %bs_mat_entries_used.14.iter34, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter34 = add nuw nsw i32 %c.05.iter34, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter34 = icmp eq i32 %add14.iter34, %271, !dbg !244
  br i1 %exitcond1.not.iter34, label %for.cond1.for.inc17_crit_edge.iter34, label %for.cond4.preheader.iter34, !dbg !155, !llvm.loop !245

for.inc17.iter34:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter34
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_34_end

for.cond4.preheader.iter34:                       ; preds = %for.cond4.preheader.lr.ph.iter34, %for.inc15.iter34
  %c.05.iter34 = phi i32 [ 34, %for.cond4.preheader.lr.ph.iter34 ], [ %inc.iter34, %for.inc15.iter34 ]
  %bs_mat_entries_used.14.iter34 = phi i32 [ %split.iter33, %for.cond4.preheader.lr.ph.iter34 ], [ %add14.iter34, %for.inc15.iter34 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter34, !dbg !239

for.cond4.preheader.lr.ph.iter34:                 ; preds = %for.cond1.preheader.iter34
  br label %for.cond4.preheader.iter34, !dbg !155

for.cond1.for.inc17_crit_edge.iter34:             ; preds = %for.inc15.iter34
  %split.iter34 = phi i32 [ %add14.iter34, %for.inc15.iter34 ]
  br label %for.inc17.iter34, !dbg !155

iter_34_end:                                      ; preds = %for.inc17.iter34
  br label %iter_35_start

iter_35_start:                                    ; preds = %iter_34_end
  br label %for.cond1.preheader.iter35

for.cond1.preheader.iter35:                       ; preds = %iter_35_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %279 = add i32 %split.iter34, 43, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter35, !dbg !155

for.body6.iter35:                                 ; preds = %for.cond4.preheader.iter35, %m_vec_mul_add.exit.iter35
  %k.02.iter35 = phi i32 [ 0, %for.cond4.preheader.iter35 ], [ %add13.iter35, %m_vec_mul_add.exit.iter35 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter35 = mul nsw i32 %bs_mat_entries_used.14.iter35, 40, !dbg !161
  %add.ptr.iter35 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter35, !dbg !161
  %mul8.iter35 = mul nuw nsw i32 %k.02.iter35, 78, !dbg !164
  %280 = getelementptr i8, ptr %mat, i32 %mul8.iter35, !dbg !165
  %arrayidx.iter35 = getelementptr i8, ptr %280, i32 %c.05.iter35, !dbg !165
  %281 = load i8, ptr %arrayidx.iter35, align 1, !dbg !165
  %add10.iter35 = add nuw nsw i32 350, %k.02.iter35, !dbg !166
  %add.ptr12.idx.iter35 = mul nuw nsw i32 %add10.iter35, 40, !dbg !167
  %add.ptr12.iter35 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter35, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter35 = zext i8 %281 to i32, !dbg !185
  %mul.i.i.iter35 = mul i32 %conv.i.i.iter35, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter35 = and i32 %mul.i.i.iter35, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter35 = lshr exact i32 %and.i.i.iter35, 4, !dbg !191
  %shr1.i.i.iter35 = lshr exact i32 %and.i.i.iter35, 3, !dbg !192
  %282 = xor i32 %shr.i.i.iter35, %shr1.i.i.iter35, !dbg !193
  %xor2.i.i.iter35 = xor i32 %282, %mul.i.i.iter35, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter35, !dbg !199

for.body.i.iter35:                                ; preds = %for.body.i.iter35, %for.body6.iter35
  %i.0.i1.iter35 = phi i32 [ 0, %for.body6.iter35 ], [ %inc.i.iter35, %for.body.i.iter35 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.iter35, i32 %i.0.i1.iter35, !dbg !200
  %283 = load i64, ptr %arrayidx.i.iter35, align 8, !dbg !200
  %and.i.iter35 = and i64 %283, 1229782938247303441, !dbg !203
  %and1.i.iter35 = and i32 %xor2.i.i.iter35, 255, !dbg !204
  %conv.i.iter35 = zext nneg i32 %and1.i.iter35 to i64, !dbg !205
  %mul.i.iter35 = mul i64 %and.i.iter35, %conv.i.iter35, !dbg !206
  %shr.i.iter35 = lshr i64 %283, 1, !dbg !207
  %and3.i.iter35 = and i64 %shr.i.iter35, 1229782938247303441, !dbg !208
  %shr4.i.iter35 = lshr i32 %xor2.i.i.iter35, 8, !dbg !209
  %and5.i.iter35 = and i32 %shr4.i.iter35, 15, !dbg !210
  %conv6.i.iter35 = zext nneg i32 %and5.i.iter35 to i64, !dbg !211
  %mul7.i.iter35 = mul nuw i64 %and3.i.iter35, %conv6.i.iter35, !dbg !212
  %xor.i.iter35 = xor i64 %mul.i.iter35, %mul7.i.iter35, !dbg !213
  %arrayidx8.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.iter35, i32 %i.0.i1.iter35, !dbg !214
  %284 = load i64, ptr %arrayidx8.i.iter35, align 8, !dbg !214
  %shr9.i.iter35 = lshr i64 %284, 2, !dbg !215
  %and10.i.iter35 = and i64 %shr9.i.iter35, 1229782938247303441, !dbg !216
  %shr11.i.iter35 = lshr i32 %xor2.i.i.iter35, 16, !dbg !217
  %and12.i.iter35 = and i32 %shr11.i.iter35, 15, !dbg !218
  %conv13.i.iter35 = zext nneg i32 %and12.i.iter35 to i64, !dbg !219
  %mul14.i.iter35 = mul nuw i64 %and10.i.iter35, %conv13.i.iter35, !dbg !220
  %xor15.i.iter35 = xor i64 %xor.i.iter35, %mul14.i.iter35, !dbg !221
  %arrayidx16.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr.iter35, i32 %i.0.i1.iter35, !dbg !222
  %285 = load i64, ptr %arrayidx16.i.iter35, align 8, !dbg !222
  %shr17.i.iter35 = lshr i64 %285, 3, !dbg !223
  %and18.i.iter35 = and i64 %shr17.i.iter35, 1229782938247303441, !dbg !224
  %shr19.i.iter35 = lshr i32 %xor2.i.i.iter35, 24, !dbg !225
  %and20.i.iter35 = and i32 %shr19.i.iter35, 15, !dbg !226
  %conv21.i.iter35 = zext nneg i32 %and20.i.iter35 to i64, !dbg !227
  %mul22.i.iter35 = mul nuw i64 %and18.i.iter35, %conv21.i.iter35, !dbg !228
  %xor23.i.iter35 = xor i64 %xor15.i.iter35, %mul22.i.iter35, !dbg !229
  %arrayidx24.i.iter35 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter35, i32 %i.0.i1.iter35, !dbg !230
  %286 = load i64, ptr %arrayidx24.i.iter35, align 8, !dbg !231
  %xor25.i.iter35 = xor i64 %286, %xor23.i.iter35, !dbg !231
  store i64 %xor25.i.iter35, ptr %arrayidx24.i.iter35, align 8, !dbg !231
  %inc.i.iter35 = add nuw nsw i32 %i.0.i1.iter35, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter35 = icmp eq i32 %inc.i.iter35, 5, !dbg !233
  br i1 %exitcond.i.not.iter35, label %m_vec_mul_add.exit.iter35, label %for.body.i.iter35, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter35:                        ; preds = %for.body.i.iter35
  %add13.iter35 = add nuw nsw i32 %k.02.iter35, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter35 = icmp eq i32 %add13.iter35, 10, !dbg !238
  br i1 %exitcond.not.iter35, label %for.inc15.iter35, label %for.body6.iter35, !dbg !239, !llvm.loop !240

for.inc15.iter35:                                 ; preds = %m_vec_mul_add.exit.iter35
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter35 = add i32 %bs_mat_entries_used.14.iter35, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter35 = add nuw nsw i32 %c.05.iter35, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter35 = icmp eq i32 %add14.iter35, %279, !dbg !244
  br i1 %exitcond1.not.iter35, label %for.cond1.for.inc17_crit_edge.iter35, label %for.cond4.preheader.iter35, !dbg !155, !llvm.loop !245

for.inc17.iter35:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter35
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_35_end

for.cond4.preheader.iter35:                       ; preds = %for.cond4.preheader.lr.ph.iter35, %for.inc15.iter35
  %c.05.iter35 = phi i32 [ 35, %for.cond4.preheader.lr.ph.iter35 ], [ %inc.iter35, %for.inc15.iter35 ]
  %bs_mat_entries_used.14.iter35 = phi i32 [ %split.iter34, %for.cond4.preheader.lr.ph.iter35 ], [ %add14.iter35, %for.inc15.iter35 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter35, !dbg !239

for.cond4.preheader.lr.ph.iter35:                 ; preds = %for.cond1.preheader.iter35
  br label %for.cond4.preheader.iter35, !dbg !155

for.cond1.for.inc17_crit_edge.iter35:             ; preds = %for.inc15.iter35
  %split.iter35 = phi i32 [ %add14.iter35, %for.inc15.iter35 ]
  br label %for.inc17.iter35, !dbg !155

iter_35_end:                                      ; preds = %for.inc17.iter35
  br label %iter_36_start

iter_36_start:                                    ; preds = %iter_35_end
  br label %for.cond1.preheader.iter36

for.cond1.preheader.iter36:                       ; preds = %iter_36_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %287 = add i32 %split.iter35, 42, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter36, !dbg !155

for.body6.iter36:                                 ; preds = %for.cond4.preheader.iter36, %m_vec_mul_add.exit.iter36
  %k.02.iter36 = phi i32 [ 0, %for.cond4.preheader.iter36 ], [ %add13.iter36, %m_vec_mul_add.exit.iter36 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter36 = mul nsw i32 %bs_mat_entries_used.14.iter36, 40, !dbg !161
  %add.ptr.iter36 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter36, !dbg !161
  %mul8.iter36 = mul nuw nsw i32 %k.02.iter36, 78, !dbg !164
  %288 = getelementptr i8, ptr %mat, i32 %mul8.iter36, !dbg !165
  %arrayidx.iter36 = getelementptr i8, ptr %288, i32 %c.05.iter36, !dbg !165
  %289 = load i8, ptr %arrayidx.iter36, align 1, !dbg !165
  %add10.iter36 = add nuw nsw i32 360, %k.02.iter36, !dbg !166
  %add.ptr12.idx.iter36 = mul nuw nsw i32 %add10.iter36, 40, !dbg !167
  %add.ptr12.iter36 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter36, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter36 = zext i8 %289 to i32, !dbg !185
  %mul.i.i.iter36 = mul i32 %conv.i.i.iter36, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter36 = and i32 %mul.i.i.iter36, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter36 = lshr exact i32 %and.i.i.iter36, 4, !dbg !191
  %shr1.i.i.iter36 = lshr exact i32 %and.i.i.iter36, 3, !dbg !192
  %290 = xor i32 %shr.i.i.iter36, %shr1.i.i.iter36, !dbg !193
  %xor2.i.i.iter36 = xor i32 %290, %mul.i.i.iter36, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter36, !dbg !199

for.body.i.iter36:                                ; preds = %for.body.i.iter36, %for.body6.iter36
  %i.0.i1.iter36 = phi i32 [ 0, %for.body6.iter36 ], [ %inc.i.iter36, %for.body.i.iter36 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.iter36, i32 %i.0.i1.iter36, !dbg !200
  %291 = load i64, ptr %arrayidx.i.iter36, align 8, !dbg !200
  %and.i.iter36 = and i64 %291, 1229782938247303441, !dbg !203
  %and1.i.iter36 = and i32 %xor2.i.i.iter36, 255, !dbg !204
  %conv.i.iter36 = zext nneg i32 %and1.i.iter36 to i64, !dbg !205
  %mul.i.iter36 = mul i64 %and.i.iter36, %conv.i.iter36, !dbg !206
  %shr.i.iter36 = lshr i64 %291, 1, !dbg !207
  %and3.i.iter36 = and i64 %shr.i.iter36, 1229782938247303441, !dbg !208
  %shr4.i.iter36 = lshr i32 %xor2.i.i.iter36, 8, !dbg !209
  %and5.i.iter36 = and i32 %shr4.i.iter36, 15, !dbg !210
  %conv6.i.iter36 = zext nneg i32 %and5.i.iter36 to i64, !dbg !211
  %mul7.i.iter36 = mul nuw i64 %and3.i.iter36, %conv6.i.iter36, !dbg !212
  %xor.i.iter36 = xor i64 %mul.i.iter36, %mul7.i.iter36, !dbg !213
  %arrayidx8.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.iter36, i32 %i.0.i1.iter36, !dbg !214
  %292 = load i64, ptr %arrayidx8.i.iter36, align 8, !dbg !214
  %shr9.i.iter36 = lshr i64 %292, 2, !dbg !215
  %and10.i.iter36 = and i64 %shr9.i.iter36, 1229782938247303441, !dbg !216
  %shr11.i.iter36 = lshr i32 %xor2.i.i.iter36, 16, !dbg !217
  %and12.i.iter36 = and i32 %shr11.i.iter36, 15, !dbg !218
  %conv13.i.iter36 = zext nneg i32 %and12.i.iter36 to i64, !dbg !219
  %mul14.i.iter36 = mul nuw i64 %and10.i.iter36, %conv13.i.iter36, !dbg !220
  %xor15.i.iter36 = xor i64 %xor.i.iter36, %mul14.i.iter36, !dbg !221
  %arrayidx16.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr.iter36, i32 %i.0.i1.iter36, !dbg !222
  %293 = load i64, ptr %arrayidx16.i.iter36, align 8, !dbg !222
  %shr17.i.iter36 = lshr i64 %293, 3, !dbg !223
  %and18.i.iter36 = and i64 %shr17.i.iter36, 1229782938247303441, !dbg !224
  %shr19.i.iter36 = lshr i32 %xor2.i.i.iter36, 24, !dbg !225
  %and20.i.iter36 = and i32 %shr19.i.iter36, 15, !dbg !226
  %conv21.i.iter36 = zext nneg i32 %and20.i.iter36 to i64, !dbg !227
  %mul22.i.iter36 = mul nuw i64 %and18.i.iter36, %conv21.i.iter36, !dbg !228
  %xor23.i.iter36 = xor i64 %xor15.i.iter36, %mul22.i.iter36, !dbg !229
  %arrayidx24.i.iter36 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter36, i32 %i.0.i1.iter36, !dbg !230
  %294 = load i64, ptr %arrayidx24.i.iter36, align 8, !dbg !231
  %xor25.i.iter36 = xor i64 %294, %xor23.i.iter36, !dbg !231
  store i64 %xor25.i.iter36, ptr %arrayidx24.i.iter36, align 8, !dbg !231
  %inc.i.iter36 = add nuw nsw i32 %i.0.i1.iter36, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter36 = icmp eq i32 %inc.i.iter36, 5, !dbg !233
  br i1 %exitcond.i.not.iter36, label %m_vec_mul_add.exit.iter36, label %for.body.i.iter36, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter36:                        ; preds = %for.body.i.iter36
  %add13.iter36 = add nuw nsw i32 %k.02.iter36, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter36 = icmp eq i32 %add13.iter36, 10, !dbg !238
  br i1 %exitcond.not.iter36, label %for.inc15.iter36, label %for.body6.iter36, !dbg !239, !llvm.loop !240

for.inc15.iter36:                                 ; preds = %m_vec_mul_add.exit.iter36
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter36 = add i32 %bs_mat_entries_used.14.iter36, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter36 = add nuw nsw i32 %c.05.iter36, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter36 = icmp eq i32 %add14.iter36, %287, !dbg !244
  br i1 %exitcond1.not.iter36, label %for.cond1.for.inc17_crit_edge.iter36, label %for.cond4.preheader.iter36, !dbg !155, !llvm.loop !245

for.inc17.iter36:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter36
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_36_end

for.cond4.preheader.iter36:                       ; preds = %for.cond4.preheader.lr.ph.iter36, %for.inc15.iter36
  %c.05.iter36 = phi i32 [ 36, %for.cond4.preheader.lr.ph.iter36 ], [ %inc.iter36, %for.inc15.iter36 ]
  %bs_mat_entries_used.14.iter36 = phi i32 [ %split.iter35, %for.cond4.preheader.lr.ph.iter36 ], [ %add14.iter36, %for.inc15.iter36 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter36, !dbg !239

for.cond4.preheader.lr.ph.iter36:                 ; preds = %for.cond1.preheader.iter36
  br label %for.cond4.preheader.iter36, !dbg !155

for.cond1.for.inc17_crit_edge.iter36:             ; preds = %for.inc15.iter36
  %split.iter36 = phi i32 [ %add14.iter36, %for.inc15.iter36 ]
  br label %for.inc17.iter36, !dbg !155

iter_36_end:                                      ; preds = %for.inc17.iter36
  br label %iter_37_start

iter_37_start:                                    ; preds = %iter_36_end
  br label %for.cond1.preheader.iter37

for.cond1.preheader.iter37:                       ; preds = %iter_37_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %295 = add i32 %split.iter36, 41, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter37, !dbg !155

for.body6.iter37:                                 ; preds = %for.cond4.preheader.iter37, %m_vec_mul_add.exit.iter37
  %k.02.iter37 = phi i32 [ 0, %for.cond4.preheader.iter37 ], [ %add13.iter37, %m_vec_mul_add.exit.iter37 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter37 = mul nsw i32 %bs_mat_entries_used.14.iter37, 40, !dbg !161
  %add.ptr.iter37 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter37, !dbg !161
  %mul8.iter37 = mul nuw nsw i32 %k.02.iter37, 78, !dbg !164
  %296 = getelementptr i8, ptr %mat, i32 %mul8.iter37, !dbg !165
  %arrayidx.iter37 = getelementptr i8, ptr %296, i32 %c.05.iter37, !dbg !165
  %297 = load i8, ptr %arrayidx.iter37, align 1, !dbg !165
  %add10.iter37 = add nuw nsw i32 370, %k.02.iter37, !dbg !166
  %add.ptr12.idx.iter37 = mul nuw nsw i32 %add10.iter37, 40, !dbg !167
  %add.ptr12.iter37 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter37, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter37 = zext i8 %297 to i32, !dbg !185
  %mul.i.i.iter37 = mul i32 %conv.i.i.iter37, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter37 = and i32 %mul.i.i.iter37, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter37 = lshr exact i32 %and.i.i.iter37, 4, !dbg !191
  %shr1.i.i.iter37 = lshr exact i32 %and.i.i.iter37, 3, !dbg !192
  %298 = xor i32 %shr.i.i.iter37, %shr1.i.i.iter37, !dbg !193
  %xor2.i.i.iter37 = xor i32 %298, %mul.i.i.iter37, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter37, !dbg !199

for.body.i.iter37:                                ; preds = %for.body.i.iter37, %for.body6.iter37
  %i.0.i1.iter37 = phi i32 [ 0, %for.body6.iter37 ], [ %inc.i.iter37, %for.body.i.iter37 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.iter37, i32 %i.0.i1.iter37, !dbg !200
  %299 = load i64, ptr %arrayidx.i.iter37, align 8, !dbg !200
  %and.i.iter37 = and i64 %299, 1229782938247303441, !dbg !203
  %and1.i.iter37 = and i32 %xor2.i.i.iter37, 255, !dbg !204
  %conv.i.iter37 = zext nneg i32 %and1.i.iter37 to i64, !dbg !205
  %mul.i.iter37 = mul i64 %and.i.iter37, %conv.i.iter37, !dbg !206
  %shr.i.iter37 = lshr i64 %299, 1, !dbg !207
  %and3.i.iter37 = and i64 %shr.i.iter37, 1229782938247303441, !dbg !208
  %shr4.i.iter37 = lshr i32 %xor2.i.i.iter37, 8, !dbg !209
  %and5.i.iter37 = and i32 %shr4.i.iter37, 15, !dbg !210
  %conv6.i.iter37 = zext nneg i32 %and5.i.iter37 to i64, !dbg !211
  %mul7.i.iter37 = mul nuw i64 %and3.i.iter37, %conv6.i.iter37, !dbg !212
  %xor.i.iter37 = xor i64 %mul.i.iter37, %mul7.i.iter37, !dbg !213
  %arrayidx8.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.iter37, i32 %i.0.i1.iter37, !dbg !214
  %300 = load i64, ptr %arrayidx8.i.iter37, align 8, !dbg !214
  %shr9.i.iter37 = lshr i64 %300, 2, !dbg !215
  %and10.i.iter37 = and i64 %shr9.i.iter37, 1229782938247303441, !dbg !216
  %shr11.i.iter37 = lshr i32 %xor2.i.i.iter37, 16, !dbg !217
  %and12.i.iter37 = and i32 %shr11.i.iter37, 15, !dbg !218
  %conv13.i.iter37 = zext nneg i32 %and12.i.iter37 to i64, !dbg !219
  %mul14.i.iter37 = mul nuw i64 %and10.i.iter37, %conv13.i.iter37, !dbg !220
  %xor15.i.iter37 = xor i64 %xor.i.iter37, %mul14.i.iter37, !dbg !221
  %arrayidx16.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr.iter37, i32 %i.0.i1.iter37, !dbg !222
  %301 = load i64, ptr %arrayidx16.i.iter37, align 8, !dbg !222
  %shr17.i.iter37 = lshr i64 %301, 3, !dbg !223
  %and18.i.iter37 = and i64 %shr17.i.iter37, 1229782938247303441, !dbg !224
  %shr19.i.iter37 = lshr i32 %xor2.i.i.iter37, 24, !dbg !225
  %and20.i.iter37 = and i32 %shr19.i.iter37, 15, !dbg !226
  %conv21.i.iter37 = zext nneg i32 %and20.i.iter37 to i64, !dbg !227
  %mul22.i.iter37 = mul nuw i64 %and18.i.iter37, %conv21.i.iter37, !dbg !228
  %xor23.i.iter37 = xor i64 %xor15.i.iter37, %mul22.i.iter37, !dbg !229
  %arrayidx24.i.iter37 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter37, i32 %i.0.i1.iter37, !dbg !230
  %302 = load i64, ptr %arrayidx24.i.iter37, align 8, !dbg !231
  %xor25.i.iter37 = xor i64 %302, %xor23.i.iter37, !dbg !231
  store i64 %xor25.i.iter37, ptr %arrayidx24.i.iter37, align 8, !dbg !231
  %inc.i.iter37 = add nuw nsw i32 %i.0.i1.iter37, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter37 = icmp eq i32 %inc.i.iter37, 5, !dbg !233
  br i1 %exitcond.i.not.iter37, label %m_vec_mul_add.exit.iter37, label %for.body.i.iter37, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter37:                        ; preds = %for.body.i.iter37
  %add13.iter37 = add nuw nsw i32 %k.02.iter37, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter37 = icmp eq i32 %add13.iter37, 10, !dbg !238
  br i1 %exitcond.not.iter37, label %for.inc15.iter37, label %for.body6.iter37, !dbg !239, !llvm.loop !240

for.inc15.iter37:                                 ; preds = %m_vec_mul_add.exit.iter37
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter37 = add i32 %bs_mat_entries_used.14.iter37, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter37 = add nuw nsw i32 %c.05.iter37, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter37 = icmp eq i32 %add14.iter37, %295, !dbg !244
  br i1 %exitcond1.not.iter37, label %for.cond1.for.inc17_crit_edge.iter37, label %for.cond4.preheader.iter37, !dbg !155, !llvm.loop !245

for.inc17.iter37:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter37
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_37_end

for.cond4.preheader.iter37:                       ; preds = %for.cond4.preheader.lr.ph.iter37, %for.inc15.iter37
  %c.05.iter37 = phi i32 [ 37, %for.cond4.preheader.lr.ph.iter37 ], [ %inc.iter37, %for.inc15.iter37 ]
  %bs_mat_entries_used.14.iter37 = phi i32 [ %split.iter36, %for.cond4.preheader.lr.ph.iter37 ], [ %add14.iter37, %for.inc15.iter37 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter37, !dbg !239

for.cond4.preheader.lr.ph.iter37:                 ; preds = %for.cond1.preheader.iter37
  br label %for.cond4.preheader.iter37, !dbg !155

for.cond1.for.inc17_crit_edge.iter37:             ; preds = %for.inc15.iter37
  %split.iter37 = phi i32 [ %add14.iter37, %for.inc15.iter37 ]
  br label %for.inc17.iter37, !dbg !155

iter_37_end:                                      ; preds = %for.inc17.iter37
  br label %iter_38_start

iter_38_start:                                    ; preds = %iter_37_end
  br label %for.cond1.preheader.iter38

for.cond1.preheader.iter38:                       ; preds = %iter_38_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %303 = add i32 %split.iter37, 40, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter38, !dbg !155

for.body6.iter38:                                 ; preds = %for.cond4.preheader.iter38, %m_vec_mul_add.exit.iter38
  %k.02.iter38 = phi i32 [ 0, %for.cond4.preheader.iter38 ], [ %add13.iter38, %m_vec_mul_add.exit.iter38 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter38 = mul nsw i32 %bs_mat_entries_used.14.iter38, 40, !dbg !161
  %add.ptr.iter38 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter38, !dbg !161
  %mul8.iter38 = mul nuw nsw i32 %k.02.iter38, 78, !dbg !164
  %304 = getelementptr i8, ptr %mat, i32 %mul8.iter38, !dbg !165
  %arrayidx.iter38 = getelementptr i8, ptr %304, i32 %c.05.iter38, !dbg !165
  %305 = load i8, ptr %arrayidx.iter38, align 1, !dbg !165
  %add10.iter38 = add nuw nsw i32 380, %k.02.iter38, !dbg !166
  %add.ptr12.idx.iter38 = mul nuw nsw i32 %add10.iter38, 40, !dbg !167
  %add.ptr12.iter38 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter38, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter38 = zext i8 %305 to i32, !dbg !185
  %mul.i.i.iter38 = mul i32 %conv.i.i.iter38, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter38 = and i32 %mul.i.i.iter38, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter38 = lshr exact i32 %and.i.i.iter38, 4, !dbg !191
  %shr1.i.i.iter38 = lshr exact i32 %and.i.i.iter38, 3, !dbg !192
  %306 = xor i32 %shr.i.i.iter38, %shr1.i.i.iter38, !dbg !193
  %xor2.i.i.iter38 = xor i32 %306, %mul.i.i.iter38, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter38, !dbg !199

for.body.i.iter38:                                ; preds = %for.body.i.iter38, %for.body6.iter38
  %i.0.i1.iter38 = phi i32 [ 0, %for.body6.iter38 ], [ %inc.i.iter38, %for.body.i.iter38 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.iter38, i32 %i.0.i1.iter38, !dbg !200
  %307 = load i64, ptr %arrayidx.i.iter38, align 8, !dbg !200
  %and.i.iter38 = and i64 %307, 1229782938247303441, !dbg !203
  %and1.i.iter38 = and i32 %xor2.i.i.iter38, 255, !dbg !204
  %conv.i.iter38 = zext nneg i32 %and1.i.iter38 to i64, !dbg !205
  %mul.i.iter38 = mul i64 %and.i.iter38, %conv.i.iter38, !dbg !206
  %shr.i.iter38 = lshr i64 %307, 1, !dbg !207
  %and3.i.iter38 = and i64 %shr.i.iter38, 1229782938247303441, !dbg !208
  %shr4.i.iter38 = lshr i32 %xor2.i.i.iter38, 8, !dbg !209
  %and5.i.iter38 = and i32 %shr4.i.iter38, 15, !dbg !210
  %conv6.i.iter38 = zext nneg i32 %and5.i.iter38 to i64, !dbg !211
  %mul7.i.iter38 = mul nuw i64 %and3.i.iter38, %conv6.i.iter38, !dbg !212
  %xor.i.iter38 = xor i64 %mul.i.iter38, %mul7.i.iter38, !dbg !213
  %arrayidx8.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.iter38, i32 %i.0.i1.iter38, !dbg !214
  %308 = load i64, ptr %arrayidx8.i.iter38, align 8, !dbg !214
  %shr9.i.iter38 = lshr i64 %308, 2, !dbg !215
  %and10.i.iter38 = and i64 %shr9.i.iter38, 1229782938247303441, !dbg !216
  %shr11.i.iter38 = lshr i32 %xor2.i.i.iter38, 16, !dbg !217
  %and12.i.iter38 = and i32 %shr11.i.iter38, 15, !dbg !218
  %conv13.i.iter38 = zext nneg i32 %and12.i.iter38 to i64, !dbg !219
  %mul14.i.iter38 = mul nuw i64 %and10.i.iter38, %conv13.i.iter38, !dbg !220
  %xor15.i.iter38 = xor i64 %xor.i.iter38, %mul14.i.iter38, !dbg !221
  %arrayidx16.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr.iter38, i32 %i.0.i1.iter38, !dbg !222
  %309 = load i64, ptr %arrayidx16.i.iter38, align 8, !dbg !222
  %shr17.i.iter38 = lshr i64 %309, 3, !dbg !223
  %and18.i.iter38 = and i64 %shr17.i.iter38, 1229782938247303441, !dbg !224
  %shr19.i.iter38 = lshr i32 %xor2.i.i.iter38, 24, !dbg !225
  %and20.i.iter38 = and i32 %shr19.i.iter38, 15, !dbg !226
  %conv21.i.iter38 = zext nneg i32 %and20.i.iter38 to i64, !dbg !227
  %mul22.i.iter38 = mul nuw i64 %and18.i.iter38, %conv21.i.iter38, !dbg !228
  %xor23.i.iter38 = xor i64 %xor15.i.iter38, %mul22.i.iter38, !dbg !229
  %arrayidx24.i.iter38 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter38, i32 %i.0.i1.iter38, !dbg !230
  %310 = load i64, ptr %arrayidx24.i.iter38, align 8, !dbg !231
  %xor25.i.iter38 = xor i64 %310, %xor23.i.iter38, !dbg !231
  store i64 %xor25.i.iter38, ptr %arrayidx24.i.iter38, align 8, !dbg !231
  %inc.i.iter38 = add nuw nsw i32 %i.0.i1.iter38, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter38 = icmp eq i32 %inc.i.iter38, 5, !dbg !233
  br i1 %exitcond.i.not.iter38, label %m_vec_mul_add.exit.iter38, label %for.body.i.iter38, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter38:                        ; preds = %for.body.i.iter38
  %add13.iter38 = add nuw nsw i32 %k.02.iter38, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter38 = icmp eq i32 %add13.iter38, 10, !dbg !238
  br i1 %exitcond.not.iter38, label %for.inc15.iter38, label %for.body6.iter38, !dbg !239, !llvm.loop !240

for.inc15.iter38:                                 ; preds = %m_vec_mul_add.exit.iter38
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter38 = add i32 %bs_mat_entries_used.14.iter38, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter38 = add nuw nsw i32 %c.05.iter38, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter38 = icmp eq i32 %add14.iter38, %303, !dbg !244
  br i1 %exitcond1.not.iter38, label %for.cond1.for.inc17_crit_edge.iter38, label %for.cond4.preheader.iter38, !dbg !155, !llvm.loop !245

for.inc17.iter38:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter38
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_38_end

for.cond4.preheader.iter38:                       ; preds = %for.cond4.preheader.lr.ph.iter38, %for.inc15.iter38
  %c.05.iter38 = phi i32 [ 38, %for.cond4.preheader.lr.ph.iter38 ], [ %inc.iter38, %for.inc15.iter38 ]
  %bs_mat_entries_used.14.iter38 = phi i32 [ %split.iter37, %for.cond4.preheader.lr.ph.iter38 ], [ %add14.iter38, %for.inc15.iter38 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter38, !dbg !239

for.cond4.preheader.lr.ph.iter38:                 ; preds = %for.cond1.preheader.iter38
  br label %for.cond4.preheader.iter38, !dbg !155

for.cond1.for.inc17_crit_edge.iter38:             ; preds = %for.inc15.iter38
  %split.iter38 = phi i32 [ %add14.iter38, %for.inc15.iter38 ]
  br label %for.inc17.iter38, !dbg !155

iter_38_end:                                      ; preds = %for.inc17.iter38
  br label %iter_39_start

iter_39_start:                                    ; preds = %iter_38_end
  br label %for.cond1.preheader.iter39

for.cond1.preheader.iter39:                       ; preds = %iter_39_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %311 = add i32 %split.iter38, 39, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter39, !dbg !155

for.body6.iter39:                                 ; preds = %for.cond4.preheader.iter39, %m_vec_mul_add.exit.iter39
  %k.02.iter39 = phi i32 [ 0, %for.cond4.preheader.iter39 ], [ %add13.iter39, %m_vec_mul_add.exit.iter39 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter39 = mul nsw i32 %bs_mat_entries_used.14.iter39, 40, !dbg !161
  %add.ptr.iter39 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter39, !dbg !161
  %mul8.iter39 = mul nuw nsw i32 %k.02.iter39, 78, !dbg !164
  %312 = getelementptr i8, ptr %mat, i32 %mul8.iter39, !dbg !165
  %arrayidx.iter39 = getelementptr i8, ptr %312, i32 %c.05.iter39, !dbg !165
  %313 = load i8, ptr %arrayidx.iter39, align 1, !dbg !165
  %add10.iter39 = add nuw nsw i32 390, %k.02.iter39, !dbg !166
  %add.ptr12.idx.iter39 = mul nuw nsw i32 %add10.iter39, 40, !dbg !167
  %add.ptr12.iter39 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter39, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter39 = zext i8 %313 to i32, !dbg !185
  %mul.i.i.iter39 = mul i32 %conv.i.i.iter39, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter39 = and i32 %mul.i.i.iter39, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter39 = lshr exact i32 %and.i.i.iter39, 4, !dbg !191
  %shr1.i.i.iter39 = lshr exact i32 %and.i.i.iter39, 3, !dbg !192
  %314 = xor i32 %shr.i.i.iter39, %shr1.i.i.iter39, !dbg !193
  %xor2.i.i.iter39 = xor i32 %314, %mul.i.i.iter39, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter39, !dbg !199

for.body.i.iter39:                                ; preds = %for.body.i.iter39, %for.body6.iter39
  %i.0.i1.iter39 = phi i32 [ 0, %for.body6.iter39 ], [ %inc.i.iter39, %for.body.i.iter39 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.iter39, i32 %i.0.i1.iter39, !dbg !200
  %315 = load i64, ptr %arrayidx.i.iter39, align 8, !dbg !200
  %and.i.iter39 = and i64 %315, 1229782938247303441, !dbg !203
  %and1.i.iter39 = and i32 %xor2.i.i.iter39, 255, !dbg !204
  %conv.i.iter39 = zext nneg i32 %and1.i.iter39 to i64, !dbg !205
  %mul.i.iter39 = mul i64 %and.i.iter39, %conv.i.iter39, !dbg !206
  %shr.i.iter39 = lshr i64 %315, 1, !dbg !207
  %and3.i.iter39 = and i64 %shr.i.iter39, 1229782938247303441, !dbg !208
  %shr4.i.iter39 = lshr i32 %xor2.i.i.iter39, 8, !dbg !209
  %and5.i.iter39 = and i32 %shr4.i.iter39, 15, !dbg !210
  %conv6.i.iter39 = zext nneg i32 %and5.i.iter39 to i64, !dbg !211
  %mul7.i.iter39 = mul nuw i64 %and3.i.iter39, %conv6.i.iter39, !dbg !212
  %xor.i.iter39 = xor i64 %mul.i.iter39, %mul7.i.iter39, !dbg !213
  %arrayidx8.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.iter39, i32 %i.0.i1.iter39, !dbg !214
  %316 = load i64, ptr %arrayidx8.i.iter39, align 8, !dbg !214
  %shr9.i.iter39 = lshr i64 %316, 2, !dbg !215
  %and10.i.iter39 = and i64 %shr9.i.iter39, 1229782938247303441, !dbg !216
  %shr11.i.iter39 = lshr i32 %xor2.i.i.iter39, 16, !dbg !217
  %and12.i.iter39 = and i32 %shr11.i.iter39, 15, !dbg !218
  %conv13.i.iter39 = zext nneg i32 %and12.i.iter39 to i64, !dbg !219
  %mul14.i.iter39 = mul nuw i64 %and10.i.iter39, %conv13.i.iter39, !dbg !220
  %xor15.i.iter39 = xor i64 %xor.i.iter39, %mul14.i.iter39, !dbg !221
  %arrayidx16.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr.iter39, i32 %i.0.i1.iter39, !dbg !222
  %317 = load i64, ptr %arrayidx16.i.iter39, align 8, !dbg !222
  %shr17.i.iter39 = lshr i64 %317, 3, !dbg !223
  %and18.i.iter39 = and i64 %shr17.i.iter39, 1229782938247303441, !dbg !224
  %shr19.i.iter39 = lshr i32 %xor2.i.i.iter39, 24, !dbg !225
  %and20.i.iter39 = and i32 %shr19.i.iter39, 15, !dbg !226
  %conv21.i.iter39 = zext nneg i32 %and20.i.iter39 to i64, !dbg !227
  %mul22.i.iter39 = mul nuw i64 %and18.i.iter39, %conv21.i.iter39, !dbg !228
  %xor23.i.iter39 = xor i64 %xor15.i.iter39, %mul22.i.iter39, !dbg !229
  %arrayidx24.i.iter39 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter39, i32 %i.0.i1.iter39, !dbg !230
  %318 = load i64, ptr %arrayidx24.i.iter39, align 8, !dbg !231
  %xor25.i.iter39 = xor i64 %318, %xor23.i.iter39, !dbg !231
  store i64 %xor25.i.iter39, ptr %arrayidx24.i.iter39, align 8, !dbg !231
  %inc.i.iter39 = add nuw nsw i32 %i.0.i1.iter39, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter39 = icmp eq i32 %inc.i.iter39, 5, !dbg !233
  br i1 %exitcond.i.not.iter39, label %m_vec_mul_add.exit.iter39, label %for.body.i.iter39, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter39:                        ; preds = %for.body.i.iter39
  %add13.iter39 = add nuw nsw i32 %k.02.iter39, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter39 = icmp eq i32 %add13.iter39, 10, !dbg !238
  br i1 %exitcond.not.iter39, label %for.inc15.iter39, label %for.body6.iter39, !dbg !239, !llvm.loop !240

for.inc15.iter39:                                 ; preds = %m_vec_mul_add.exit.iter39
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter39 = add i32 %bs_mat_entries_used.14.iter39, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter39 = add nuw nsw i32 %c.05.iter39, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter39 = icmp eq i32 %add14.iter39, %311, !dbg !244
  br i1 %exitcond1.not.iter39, label %for.cond1.for.inc17_crit_edge.iter39, label %for.cond4.preheader.iter39, !dbg !155, !llvm.loop !245

for.inc17.iter39:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter39
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_39_end

for.cond4.preheader.iter39:                       ; preds = %for.cond4.preheader.lr.ph.iter39, %for.inc15.iter39
  %c.05.iter39 = phi i32 [ 39, %for.cond4.preheader.lr.ph.iter39 ], [ %inc.iter39, %for.inc15.iter39 ]
  %bs_mat_entries_used.14.iter39 = phi i32 [ %split.iter38, %for.cond4.preheader.lr.ph.iter39 ], [ %add14.iter39, %for.inc15.iter39 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter39, !dbg !239

for.cond4.preheader.lr.ph.iter39:                 ; preds = %for.cond1.preheader.iter39
  br label %for.cond4.preheader.iter39, !dbg !155

for.cond1.for.inc17_crit_edge.iter39:             ; preds = %for.inc15.iter39
  %split.iter39 = phi i32 [ %add14.iter39, %for.inc15.iter39 ]
  br label %for.inc17.iter39, !dbg !155

iter_39_end:                                      ; preds = %for.inc17.iter39
  br label %iter_40_start

iter_40_start:                                    ; preds = %iter_39_end
  br label %for.cond1.preheader.iter40

for.cond1.preheader.iter40:                       ; preds = %iter_40_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %319 = add i32 %split.iter39, 38, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter40, !dbg !155

for.body6.iter40:                                 ; preds = %for.cond4.preheader.iter40, %m_vec_mul_add.exit.iter40
  %k.02.iter40 = phi i32 [ 0, %for.cond4.preheader.iter40 ], [ %add13.iter40, %m_vec_mul_add.exit.iter40 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter40 = mul nsw i32 %bs_mat_entries_used.14.iter40, 40, !dbg !161
  %add.ptr.iter40 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter40, !dbg !161
  %mul8.iter40 = mul nuw nsw i32 %k.02.iter40, 78, !dbg !164
  %320 = getelementptr i8, ptr %mat, i32 %mul8.iter40, !dbg !165
  %arrayidx.iter40 = getelementptr i8, ptr %320, i32 %c.05.iter40, !dbg !165
  %321 = load i8, ptr %arrayidx.iter40, align 1, !dbg !165
  %add10.iter40 = add nuw nsw i32 400, %k.02.iter40, !dbg !166
  %add.ptr12.idx.iter40 = mul nuw nsw i32 %add10.iter40, 40, !dbg !167
  %add.ptr12.iter40 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter40, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter40 = zext i8 %321 to i32, !dbg !185
  %mul.i.i.iter40 = mul i32 %conv.i.i.iter40, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter40 = and i32 %mul.i.i.iter40, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter40 = lshr exact i32 %and.i.i.iter40, 4, !dbg !191
  %shr1.i.i.iter40 = lshr exact i32 %and.i.i.iter40, 3, !dbg !192
  %322 = xor i32 %shr.i.i.iter40, %shr1.i.i.iter40, !dbg !193
  %xor2.i.i.iter40 = xor i32 %322, %mul.i.i.iter40, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter40, !dbg !199

for.body.i.iter40:                                ; preds = %for.body.i.iter40, %for.body6.iter40
  %i.0.i1.iter40 = phi i32 [ 0, %for.body6.iter40 ], [ %inc.i.iter40, %for.body.i.iter40 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.iter40, i32 %i.0.i1.iter40, !dbg !200
  %323 = load i64, ptr %arrayidx.i.iter40, align 8, !dbg !200
  %and.i.iter40 = and i64 %323, 1229782938247303441, !dbg !203
  %and1.i.iter40 = and i32 %xor2.i.i.iter40, 255, !dbg !204
  %conv.i.iter40 = zext nneg i32 %and1.i.iter40 to i64, !dbg !205
  %mul.i.iter40 = mul i64 %and.i.iter40, %conv.i.iter40, !dbg !206
  %shr.i.iter40 = lshr i64 %323, 1, !dbg !207
  %and3.i.iter40 = and i64 %shr.i.iter40, 1229782938247303441, !dbg !208
  %shr4.i.iter40 = lshr i32 %xor2.i.i.iter40, 8, !dbg !209
  %and5.i.iter40 = and i32 %shr4.i.iter40, 15, !dbg !210
  %conv6.i.iter40 = zext nneg i32 %and5.i.iter40 to i64, !dbg !211
  %mul7.i.iter40 = mul nuw i64 %and3.i.iter40, %conv6.i.iter40, !dbg !212
  %xor.i.iter40 = xor i64 %mul.i.iter40, %mul7.i.iter40, !dbg !213
  %arrayidx8.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.iter40, i32 %i.0.i1.iter40, !dbg !214
  %324 = load i64, ptr %arrayidx8.i.iter40, align 8, !dbg !214
  %shr9.i.iter40 = lshr i64 %324, 2, !dbg !215
  %and10.i.iter40 = and i64 %shr9.i.iter40, 1229782938247303441, !dbg !216
  %shr11.i.iter40 = lshr i32 %xor2.i.i.iter40, 16, !dbg !217
  %and12.i.iter40 = and i32 %shr11.i.iter40, 15, !dbg !218
  %conv13.i.iter40 = zext nneg i32 %and12.i.iter40 to i64, !dbg !219
  %mul14.i.iter40 = mul nuw i64 %and10.i.iter40, %conv13.i.iter40, !dbg !220
  %xor15.i.iter40 = xor i64 %xor.i.iter40, %mul14.i.iter40, !dbg !221
  %arrayidx16.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr.iter40, i32 %i.0.i1.iter40, !dbg !222
  %325 = load i64, ptr %arrayidx16.i.iter40, align 8, !dbg !222
  %shr17.i.iter40 = lshr i64 %325, 3, !dbg !223
  %and18.i.iter40 = and i64 %shr17.i.iter40, 1229782938247303441, !dbg !224
  %shr19.i.iter40 = lshr i32 %xor2.i.i.iter40, 24, !dbg !225
  %and20.i.iter40 = and i32 %shr19.i.iter40, 15, !dbg !226
  %conv21.i.iter40 = zext nneg i32 %and20.i.iter40 to i64, !dbg !227
  %mul22.i.iter40 = mul nuw i64 %and18.i.iter40, %conv21.i.iter40, !dbg !228
  %xor23.i.iter40 = xor i64 %xor15.i.iter40, %mul22.i.iter40, !dbg !229
  %arrayidx24.i.iter40 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter40, i32 %i.0.i1.iter40, !dbg !230
  %326 = load i64, ptr %arrayidx24.i.iter40, align 8, !dbg !231
  %xor25.i.iter40 = xor i64 %326, %xor23.i.iter40, !dbg !231
  store i64 %xor25.i.iter40, ptr %arrayidx24.i.iter40, align 8, !dbg !231
  %inc.i.iter40 = add nuw nsw i32 %i.0.i1.iter40, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter40 = icmp eq i32 %inc.i.iter40, 5, !dbg !233
  br i1 %exitcond.i.not.iter40, label %m_vec_mul_add.exit.iter40, label %for.body.i.iter40, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter40:                        ; preds = %for.body.i.iter40
  %add13.iter40 = add nuw nsw i32 %k.02.iter40, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter40 = icmp eq i32 %add13.iter40, 10, !dbg !238
  br i1 %exitcond.not.iter40, label %for.inc15.iter40, label %for.body6.iter40, !dbg !239, !llvm.loop !240

for.inc15.iter40:                                 ; preds = %m_vec_mul_add.exit.iter40
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter40 = add i32 %bs_mat_entries_used.14.iter40, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter40 = add nuw nsw i32 %c.05.iter40, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter40 = icmp eq i32 %add14.iter40, %319, !dbg !244
  br i1 %exitcond1.not.iter40, label %for.cond1.for.inc17_crit_edge.iter40, label %for.cond4.preheader.iter40, !dbg !155, !llvm.loop !245

for.inc17.iter40:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter40
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_40_end

for.cond4.preheader.iter40:                       ; preds = %for.cond4.preheader.lr.ph.iter40, %for.inc15.iter40
  %c.05.iter40 = phi i32 [ 40, %for.cond4.preheader.lr.ph.iter40 ], [ %inc.iter40, %for.inc15.iter40 ]
  %bs_mat_entries_used.14.iter40 = phi i32 [ %split.iter39, %for.cond4.preheader.lr.ph.iter40 ], [ %add14.iter40, %for.inc15.iter40 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter40, !dbg !239

for.cond4.preheader.lr.ph.iter40:                 ; preds = %for.cond1.preheader.iter40
  br label %for.cond4.preheader.iter40, !dbg !155

for.cond1.for.inc17_crit_edge.iter40:             ; preds = %for.inc15.iter40
  %split.iter40 = phi i32 [ %add14.iter40, %for.inc15.iter40 ]
  br label %for.inc17.iter40, !dbg !155

iter_40_end:                                      ; preds = %for.inc17.iter40
  br label %iter_41_start

iter_41_start:                                    ; preds = %iter_40_end
  br label %for.cond1.preheader.iter41

for.cond1.preheader.iter41:                       ; preds = %iter_41_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %327 = add i32 %split.iter40, 37, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter41, !dbg !155

for.body6.iter41:                                 ; preds = %for.cond4.preheader.iter41, %m_vec_mul_add.exit.iter41
  %k.02.iter41 = phi i32 [ 0, %for.cond4.preheader.iter41 ], [ %add13.iter41, %m_vec_mul_add.exit.iter41 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter41 = mul nsw i32 %bs_mat_entries_used.14.iter41, 40, !dbg !161
  %add.ptr.iter41 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter41, !dbg !161
  %mul8.iter41 = mul nuw nsw i32 %k.02.iter41, 78, !dbg !164
  %328 = getelementptr i8, ptr %mat, i32 %mul8.iter41, !dbg !165
  %arrayidx.iter41 = getelementptr i8, ptr %328, i32 %c.05.iter41, !dbg !165
  %329 = load i8, ptr %arrayidx.iter41, align 1, !dbg !165
  %add10.iter41 = add nuw nsw i32 410, %k.02.iter41, !dbg !166
  %add.ptr12.idx.iter41 = mul nuw nsw i32 %add10.iter41, 40, !dbg !167
  %add.ptr12.iter41 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter41, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter41 = zext i8 %329 to i32, !dbg !185
  %mul.i.i.iter41 = mul i32 %conv.i.i.iter41, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter41 = and i32 %mul.i.i.iter41, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter41 = lshr exact i32 %and.i.i.iter41, 4, !dbg !191
  %shr1.i.i.iter41 = lshr exact i32 %and.i.i.iter41, 3, !dbg !192
  %330 = xor i32 %shr.i.i.iter41, %shr1.i.i.iter41, !dbg !193
  %xor2.i.i.iter41 = xor i32 %330, %mul.i.i.iter41, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter41, !dbg !199

for.body.i.iter41:                                ; preds = %for.body.i.iter41, %for.body6.iter41
  %i.0.i1.iter41 = phi i32 [ 0, %for.body6.iter41 ], [ %inc.i.iter41, %for.body.i.iter41 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.iter41, i32 %i.0.i1.iter41, !dbg !200
  %331 = load i64, ptr %arrayidx.i.iter41, align 8, !dbg !200
  %and.i.iter41 = and i64 %331, 1229782938247303441, !dbg !203
  %and1.i.iter41 = and i32 %xor2.i.i.iter41, 255, !dbg !204
  %conv.i.iter41 = zext nneg i32 %and1.i.iter41 to i64, !dbg !205
  %mul.i.iter41 = mul i64 %and.i.iter41, %conv.i.iter41, !dbg !206
  %shr.i.iter41 = lshr i64 %331, 1, !dbg !207
  %and3.i.iter41 = and i64 %shr.i.iter41, 1229782938247303441, !dbg !208
  %shr4.i.iter41 = lshr i32 %xor2.i.i.iter41, 8, !dbg !209
  %and5.i.iter41 = and i32 %shr4.i.iter41, 15, !dbg !210
  %conv6.i.iter41 = zext nneg i32 %and5.i.iter41 to i64, !dbg !211
  %mul7.i.iter41 = mul nuw i64 %and3.i.iter41, %conv6.i.iter41, !dbg !212
  %xor.i.iter41 = xor i64 %mul.i.iter41, %mul7.i.iter41, !dbg !213
  %arrayidx8.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.iter41, i32 %i.0.i1.iter41, !dbg !214
  %332 = load i64, ptr %arrayidx8.i.iter41, align 8, !dbg !214
  %shr9.i.iter41 = lshr i64 %332, 2, !dbg !215
  %and10.i.iter41 = and i64 %shr9.i.iter41, 1229782938247303441, !dbg !216
  %shr11.i.iter41 = lshr i32 %xor2.i.i.iter41, 16, !dbg !217
  %and12.i.iter41 = and i32 %shr11.i.iter41, 15, !dbg !218
  %conv13.i.iter41 = zext nneg i32 %and12.i.iter41 to i64, !dbg !219
  %mul14.i.iter41 = mul nuw i64 %and10.i.iter41, %conv13.i.iter41, !dbg !220
  %xor15.i.iter41 = xor i64 %xor.i.iter41, %mul14.i.iter41, !dbg !221
  %arrayidx16.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr.iter41, i32 %i.0.i1.iter41, !dbg !222
  %333 = load i64, ptr %arrayidx16.i.iter41, align 8, !dbg !222
  %shr17.i.iter41 = lshr i64 %333, 3, !dbg !223
  %and18.i.iter41 = and i64 %shr17.i.iter41, 1229782938247303441, !dbg !224
  %shr19.i.iter41 = lshr i32 %xor2.i.i.iter41, 24, !dbg !225
  %and20.i.iter41 = and i32 %shr19.i.iter41, 15, !dbg !226
  %conv21.i.iter41 = zext nneg i32 %and20.i.iter41 to i64, !dbg !227
  %mul22.i.iter41 = mul nuw i64 %and18.i.iter41, %conv21.i.iter41, !dbg !228
  %xor23.i.iter41 = xor i64 %xor15.i.iter41, %mul22.i.iter41, !dbg !229
  %arrayidx24.i.iter41 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter41, i32 %i.0.i1.iter41, !dbg !230
  %334 = load i64, ptr %arrayidx24.i.iter41, align 8, !dbg !231
  %xor25.i.iter41 = xor i64 %334, %xor23.i.iter41, !dbg !231
  store i64 %xor25.i.iter41, ptr %arrayidx24.i.iter41, align 8, !dbg !231
  %inc.i.iter41 = add nuw nsw i32 %i.0.i1.iter41, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter41 = icmp eq i32 %inc.i.iter41, 5, !dbg !233
  br i1 %exitcond.i.not.iter41, label %m_vec_mul_add.exit.iter41, label %for.body.i.iter41, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter41:                        ; preds = %for.body.i.iter41
  %add13.iter41 = add nuw nsw i32 %k.02.iter41, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter41 = icmp eq i32 %add13.iter41, 10, !dbg !238
  br i1 %exitcond.not.iter41, label %for.inc15.iter41, label %for.body6.iter41, !dbg !239, !llvm.loop !240

for.inc15.iter41:                                 ; preds = %m_vec_mul_add.exit.iter41
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter41 = add i32 %bs_mat_entries_used.14.iter41, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter41 = add nuw nsw i32 %c.05.iter41, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter41 = icmp eq i32 %add14.iter41, %327, !dbg !244
  br i1 %exitcond1.not.iter41, label %for.cond1.for.inc17_crit_edge.iter41, label %for.cond4.preheader.iter41, !dbg !155, !llvm.loop !245

for.inc17.iter41:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter41
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_41_end

for.cond4.preheader.iter41:                       ; preds = %for.cond4.preheader.lr.ph.iter41, %for.inc15.iter41
  %c.05.iter41 = phi i32 [ 41, %for.cond4.preheader.lr.ph.iter41 ], [ %inc.iter41, %for.inc15.iter41 ]
  %bs_mat_entries_used.14.iter41 = phi i32 [ %split.iter40, %for.cond4.preheader.lr.ph.iter41 ], [ %add14.iter41, %for.inc15.iter41 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter41, !dbg !239

for.cond4.preheader.lr.ph.iter41:                 ; preds = %for.cond1.preheader.iter41
  br label %for.cond4.preheader.iter41, !dbg !155

for.cond1.for.inc17_crit_edge.iter41:             ; preds = %for.inc15.iter41
  %split.iter41 = phi i32 [ %add14.iter41, %for.inc15.iter41 ]
  br label %for.inc17.iter41, !dbg !155

iter_41_end:                                      ; preds = %for.inc17.iter41
  br label %iter_42_start

iter_42_start:                                    ; preds = %iter_41_end
  br label %for.cond1.preheader.iter42

for.cond1.preheader.iter42:                       ; preds = %iter_42_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %335 = add i32 %split.iter41, 36, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter42, !dbg !155

for.body6.iter42:                                 ; preds = %for.cond4.preheader.iter42, %m_vec_mul_add.exit.iter42
  %k.02.iter42 = phi i32 [ 0, %for.cond4.preheader.iter42 ], [ %add13.iter42, %m_vec_mul_add.exit.iter42 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter42 = mul nsw i32 %bs_mat_entries_used.14.iter42, 40, !dbg !161
  %add.ptr.iter42 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter42, !dbg !161
  %mul8.iter42 = mul nuw nsw i32 %k.02.iter42, 78, !dbg !164
  %336 = getelementptr i8, ptr %mat, i32 %mul8.iter42, !dbg !165
  %arrayidx.iter42 = getelementptr i8, ptr %336, i32 %c.05.iter42, !dbg !165
  %337 = load i8, ptr %arrayidx.iter42, align 1, !dbg !165
  %add10.iter42 = add nuw nsw i32 420, %k.02.iter42, !dbg !166
  %add.ptr12.idx.iter42 = mul nuw nsw i32 %add10.iter42, 40, !dbg !167
  %add.ptr12.iter42 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter42, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter42 = zext i8 %337 to i32, !dbg !185
  %mul.i.i.iter42 = mul i32 %conv.i.i.iter42, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter42 = and i32 %mul.i.i.iter42, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter42 = lshr exact i32 %and.i.i.iter42, 4, !dbg !191
  %shr1.i.i.iter42 = lshr exact i32 %and.i.i.iter42, 3, !dbg !192
  %338 = xor i32 %shr.i.i.iter42, %shr1.i.i.iter42, !dbg !193
  %xor2.i.i.iter42 = xor i32 %338, %mul.i.i.iter42, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter42, !dbg !199

for.body.i.iter42:                                ; preds = %for.body.i.iter42, %for.body6.iter42
  %i.0.i1.iter42 = phi i32 [ 0, %for.body6.iter42 ], [ %inc.i.iter42, %for.body.i.iter42 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.iter42, i32 %i.0.i1.iter42, !dbg !200
  %339 = load i64, ptr %arrayidx.i.iter42, align 8, !dbg !200
  %and.i.iter42 = and i64 %339, 1229782938247303441, !dbg !203
  %and1.i.iter42 = and i32 %xor2.i.i.iter42, 255, !dbg !204
  %conv.i.iter42 = zext nneg i32 %and1.i.iter42 to i64, !dbg !205
  %mul.i.iter42 = mul i64 %and.i.iter42, %conv.i.iter42, !dbg !206
  %shr.i.iter42 = lshr i64 %339, 1, !dbg !207
  %and3.i.iter42 = and i64 %shr.i.iter42, 1229782938247303441, !dbg !208
  %shr4.i.iter42 = lshr i32 %xor2.i.i.iter42, 8, !dbg !209
  %and5.i.iter42 = and i32 %shr4.i.iter42, 15, !dbg !210
  %conv6.i.iter42 = zext nneg i32 %and5.i.iter42 to i64, !dbg !211
  %mul7.i.iter42 = mul nuw i64 %and3.i.iter42, %conv6.i.iter42, !dbg !212
  %xor.i.iter42 = xor i64 %mul.i.iter42, %mul7.i.iter42, !dbg !213
  %arrayidx8.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.iter42, i32 %i.0.i1.iter42, !dbg !214
  %340 = load i64, ptr %arrayidx8.i.iter42, align 8, !dbg !214
  %shr9.i.iter42 = lshr i64 %340, 2, !dbg !215
  %and10.i.iter42 = and i64 %shr9.i.iter42, 1229782938247303441, !dbg !216
  %shr11.i.iter42 = lshr i32 %xor2.i.i.iter42, 16, !dbg !217
  %and12.i.iter42 = and i32 %shr11.i.iter42, 15, !dbg !218
  %conv13.i.iter42 = zext nneg i32 %and12.i.iter42 to i64, !dbg !219
  %mul14.i.iter42 = mul nuw i64 %and10.i.iter42, %conv13.i.iter42, !dbg !220
  %xor15.i.iter42 = xor i64 %xor.i.iter42, %mul14.i.iter42, !dbg !221
  %arrayidx16.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr.iter42, i32 %i.0.i1.iter42, !dbg !222
  %341 = load i64, ptr %arrayidx16.i.iter42, align 8, !dbg !222
  %shr17.i.iter42 = lshr i64 %341, 3, !dbg !223
  %and18.i.iter42 = and i64 %shr17.i.iter42, 1229782938247303441, !dbg !224
  %shr19.i.iter42 = lshr i32 %xor2.i.i.iter42, 24, !dbg !225
  %and20.i.iter42 = and i32 %shr19.i.iter42, 15, !dbg !226
  %conv21.i.iter42 = zext nneg i32 %and20.i.iter42 to i64, !dbg !227
  %mul22.i.iter42 = mul nuw i64 %and18.i.iter42, %conv21.i.iter42, !dbg !228
  %xor23.i.iter42 = xor i64 %xor15.i.iter42, %mul22.i.iter42, !dbg !229
  %arrayidx24.i.iter42 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter42, i32 %i.0.i1.iter42, !dbg !230
  %342 = load i64, ptr %arrayidx24.i.iter42, align 8, !dbg !231
  %xor25.i.iter42 = xor i64 %342, %xor23.i.iter42, !dbg !231
  store i64 %xor25.i.iter42, ptr %arrayidx24.i.iter42, align 8, !dbg !231
  %inc.i.iter42 = add nuw nsw i32 %i.0.i1.iter42, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter42 = icmp eq i32 %inc.i.iter42, 5, !dbg !233
  br i1 %exitcond.i.not.iter42, label %m_vec_mul_add.exit.iter42, label %for.body.i.iter42, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter42:                        ; preds = %for.body.i.iter42
  %add13.iter42 = add nuw nsw i32 %k.02.iter42, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter42 = icmp eq i32 %add13.iter42, 10, !dbg !238
  br i1 %exitcond.not.iter42, label %for.inc15.iter42, label %for.body6.iter42, !dbg !239, !llvm.loop !240

for.inc15.iter42:                                 ; preds = %m_vec_mul_add.exit.iter42
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter42 = add i32 %bs_mat_entries_used.14.iter42, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter42 = add nuw nsw i32 %c.05.iter42, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter42 = icmp eq i32 %add14.iter42, %335, !dbg !244
  br i1 %exitcond1.not.iter42, label %for.cond1.for.inc17_crit_edge.iter42, label %for.cond4.preheader.iter42, !dbg !155, !llvm.loop !245

for.inc17.iter42:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter42
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_42_end

for.cond4.preheader.iter42:                       ; preds = %for.cond4.preheader.lr.ph.iter42, %for.inc15.iter42
  %c.05.iter42 = phi i32 [ 42, %for.cond4.preheader.lr.ph.iter42 ], [ %inc.iter42, %for.inc15.iter42 ]
  %bs_mat_entries_used.14.iter42 = phi i32 [ %split.iter41, %for.cond4.preheader.lr.ph.iter42 ], [ %add14.iter42, %for.inc15.iter42 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter42, !dbg !239

for.cond4.preheader.lr.ph.iter42:                 ; preds = %for.cond1.preheader.iter42
  br label %for.cond4.preheader.iter42, !dbg !155

for.cond1.for.inc17_crit_edge.iter42:             ; preds = %for.inc15.iter42
  %split.iter42 = phi i32 [ %add14.iter42, %for.inc15.iter42 ]
  br label %for.inc17.iter42, !dbg !155

iter_42_end:                                      ; preds = %for.inc17.iter42
  br label %iter_43_start

iter_43_start:                                    ; preds = %iter_42_end
  br label %for.cond1.preheader.iter43

for.cond1.preheader.iter43:                       ; preds = %iter_43_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %343 = add i32 %split.iter42, 35, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter43, !dbg !155

for.body6.iter43:                                 ; preds = %for.cond4.preheader.iter43, %m_vec_mul_add.exit.iter43
  %k.02.iter43 = phi i32 [ 0, %for.cond4.preheader.iter43 ], [ %add13.iter43, %m_vec_mul_add.exit.iter43 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter43 = mul nsw i32 %bs_mat_entries_used.14.iter43, 40, !dbg !161
  %add.ptr.iter43 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter43, !dbg !161
  %mul8.iter43 = mul nuw nsw i32 %k.02.iter43, 78, !dbg !164
  %344 = getelementptr i8, ptr %mat, i32 %mul8.iter43, !dbg !165
  %arrayidx.iter43 = getelementptr i8, ptr %344, i32 %c.05.iter43, !dbg !165
  %345 = load i8, ptr %arrayidx.iter43, align 1, !dbg !165
  %add10.iter43 = add nuw nsw i32 430, %k.02.iter43, !dbg !166
  %add.ptr12.idx.iter43 = mul nuw nsw i32 %add10.iter43, 40, !dbg !167
  %add.ptr12.iter43 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter43, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter43 = zext i8 %345 to i32, !dbg !185
  %mul.i.i.iter43 = mul i32 %conv.i.i.iter43, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter43 = and i32 %mul.i.i.iter43, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter43 = lshr exact i32 %and.i.i.iter43, 4, !dbg !191
  %shr1.i.i.iter43 = lshr exact i32 %and.i.i.iter43, 3, !dbg !192
  %346 = xor i32 %shr.i.i.iter43, %shr1.i.i.iter43, !dbg !193
  %xor2.i.i.iter43 = xor i32 %346, %mul.i.i.iter43, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter43, !dbg !199

for.body.i.iter43:                                ; preds = %for.body.i.iter43, %for.body6.iter43
  %i.0.i1.iter43 = phi i32 [ 0, %for.body6.iter43 ], [ %inc.i.iter43, %for.body.i.iter43 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.iter43, i32 %i.0.i1.iter43, !dbg !200
  %347 = load i64, ptr %arrayidx.i.iter43, align 8, !dbg !200
  %and.i.iter43 = and i64 %347, 1229782938247303441, !dbg !203
  %and1.i.iter43 = and i32 %xor2.i.i.iter43, 255, !dbg !204
  %conv.i.iter43 = zext nneg i32 %and1.i.iter43 to i64, !dbg !205
  %mul.i.iter43 = mul i64 %and.i.iter43, %conv.i.iter43, !dbg !206
  %shr.i.iter43 = lshr i64 %347, 1, !dbg !207
  %and3.i.iter43 = and i64 %shr.i.iter43, 1229782938247303441, !dbg !208
  %shr4.i.iter43 = lshr i32 %xor2.i.i.iter43, 8, !dbg !209
  %and5.i.iter43 = and i32 %shr4.i.iter43, 15, !dbg !210
  %conv6.i.iter43 = zext nneg i32 %and5.i.iter43 to i64, !dbg !211
  %mul7.i.iter43 = mul nuw i64 %and3.i.iter43, %conv6.i.iter43, !dbg !212
  %xor.i.iter43 = xor i64 %mul.i.iter43, %mul7.i.iter43, !dbg !213
  %arrayidx8.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.iter43, i32 %i.0.i1.iter43, !dbg !214
  %348 = load i64, ptr %arrayidx8.i.iter43, align 8, !dbg !214
  %shr9.i.iter43 = lshr i64 %348, 2, !dbg !215
  %and10.i.iter43 = and i64 %shr9.i.iter43, 1229782938247303441, !dbg !216
  %shr11.i.iter43 = lshr i32 %xor2.i.i.iter43, 16, !dbg !217
  %and12.i.iter43 = and i32 %shr11.i.iter43, 15, !dbg !218
  %conv13.i.iter43 = zext nneg i32 %and12.i.iter43 to i64, !dbg !219
  %mul14.i.iter43 = mul nuw i64 %and10.i.iter43, %conv13.i.iter43, !dbg !220
  %xor15.i.iter43 = xor i64 %xor.i.iter43, %mul14.i.iter43, !dbg !221
  %arrayidx16.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr.iter43, i32 %i.0.i1.iter43, !dbg !222
  %349 = load i64, ptr %arrayidx16.i.iter43, align 8, !dbg !222
  %shr17.i.iter43 = lshr i64 %349, 3, !dbg !223
  %and18.i.iter43 = and i64 %shr17.i.iter43, 1229782938247303441, !dbg !224
  %shr19.i.iter43 = lshr i32 %xor2.i.i.iter43, 24, !dbg !225
  %and20.i.iter43 = and i32 %shr19.i.iter43, 15, !dbg !226
  %conv21.i.iter43 = zext nneg i32 %and20.i.iter43 to i64, !dbg !227
  %mul22.i.iter43 = mul nuw i64 %and18.i.iter43, %conv21.i.iter43, !dbg !228
  %xor23.i.iter43 = xor i64 %xor15.i.iter43, %mul22.i.iter43, !dbg !229
  %arrayidx24.i.iter43 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter43, i32 %i.0.i1.iter43, !dbg !230
  %350 = load i64, ptr %arrayidx24.i.iter43, align 8, !dbg !231
  %xor25.i.iter43 = xor i64 %350, %xor23.i.iter43, !dbg !231
  store i64 %xor25.i.iter43, ptr %arrayidx24.i.iter43, align 8, !dbg !231
  %inc.i.iter43 = add nuw nsw i32 %i.0.i1.iter43, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter43 = icmp eq i32 %inc.i.iter43, 5, !dbg !233
  br i1 %exitcond.i.not.iter43, label %m_vec_mul_add.exit.iter43, label %for.body.i.iter43, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter43:                        ; preds = %for.body.i.iter43
  %add13.iter43 = add nuw nsw i32 %k.02.iter43, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter43 = icmp eq i32 %add13.iter43, 10, !dbg !238
  br i1 %exitcond.not.iter43, label %for.inc15.iter43, label %for.body6.iter43, !dbg !239, !llvm.loop !240

for.inc15.iter43:                                 ; preds = %m_vec_mul_add.exit.iter43
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter43 = add i32 %bs_mat_entries_used.14.iter43, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter43 = add nuw nsw i32 %c.05.iter43, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter43 = icmp eq i32 %add14.iter43, %343, !dbg !244
  br i1 %exitcond1.not.iter43, label %for.cond1.for.inc17_crit_edge.iter43, label %for.cond4.preheader.iter43, !dbg !155, !llvm.loop !245

for.inc17.iter43:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter43
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_43_end

for.cond4.preheader.iter43:                       ; preds = %for.cond4.preheader.lr.ph.iter43, %for.inc15.iter43
  %c.05.iter43 = phi i32 [ 43, %for.cond4.preheader.lr.ph.iter43 ], [ %inc.iter43, %for.inc15.iter43 ]
  %bs_mat_entries_used.14.iter43 = phi i32 [ %split.iter42, %for.cond4.preheader.lr.ph.iter43 ], [ %add14.iter43, %for.inc15.iter43 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter43, !dbg !239

for.cond4.preheader.lr.ph.iter43:                 ; preds = %for.cond1.preheader.iter43
  br label %for.cond4.preheader.iter43, !dbg !155

for.cond1.for.inc17_crit_edge.iter43:             ; preds = %for.inc15.iter43
  %split.iter43 = phi i32 [ %add14.iter43, %for.inc15.iter43 ]
  br label %for.inc17.iter43, !dbg !155

iter_43_end:                                      ; preds = %for.inc17.iter43
  br label %iter_44_start

iter_44_start:                                    ; preds = %iter_43_end
  br label %for.cond1.preheader.iter44

for.cond1.preheader.iter44:                       ; preds = %iter_44_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %351 = add i32 %split.iter43, 34, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter44, !dbg !155

for.body6.iter44:                                 ; preds = %for.cond4.preheader.iter44, %m_vec_mul_add.exit.iter44
  %k.02.iter44 = phi i32 [ 0, %for.cond4.preheader.iter44 ], [ %add13.iter44, %m_vec_mul_add.exit.iter44 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter44 = mul nsw i32 %bs_mat_entries_used.14.iter44, 40, !dbg !161
  %add.ptr.iter44 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter44, !dbg !161
  %mul8.iter44 = mul nuw nsw i32 %k.02.iter44, 78, !dbg !164
  %352 = getelementptr i8, ptr %mat, i32 %mul8.iter44, !dbg !165
  %arrayidx.iter44 = getelementptr i8, ptr %352, i32 %c.05.iter44, !dbg !165
  %353 = load i8, ptr %arrayidx.iter44, align 1, !dbg !165
  %add10.iter44 = add nuw nsw i32 440, %k.02.iter44, !dbg !166
  %add.ptr12.idx.iter44 = mul nuw nsw i32 %add10.iter44, 40, !dbg !167
  %add.ptr12.iter44 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter44, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter44 = zext i8 %353 to i32, !dbg !185
  %mul.i.i.iter44 = mul i32 %conv.i.i.iter44, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter44 = and i32 %mul.i.i.iter44, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter44 = lshr exact i32 %and.i.i.iter44, 4, !dbg !191
  %shr1.i.i.iter44 = lshr exact i32 %and.i.i.iter44, 3, !dbg !192
  %354 = xor i32 %shr.i.i.iter44, %shr1.i.i.iter44, !dbg !193
  %xor2.i.i.iter44 = xor i32 %354, %mul.i.i.iter44, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter44, !dbg !199

for.body.i.iter44:                                ; preds = %for.body.i.iter44, %for.body6.iter44
  %i.0.i1.iter44 = phi i32 [ 0, %for.body6.iter44 ], [ %inc.i.iter44, %for.body.i.iter44 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.iter44, i32 %i.0.i1.iter44, !dbg !200
  %355 = load i64, ptr %arrayidx.i.iter44, align 8, !dbg !200
  %and.i.iter44 = and i64 %355, 1229782938247303441, !dbg !203
  %and1.i.iter44 = and i32 %xor2.i.i.iter44, 255, !dbg !204
  %conv.i.iter44 = zext nneg i32 %and1.i.iter44 to i64, !dbg !205
  %mul.i.iter44 = mul i64 %and.i.iter44, %conv.i.iter44, !dbg !206
  %shr.i.iter44 = lshr i64 %355, 1, !dbg !207
  %and3.i.iter44 = and i64 %shr.i.iter44, 1229782938247303441, !dbg !208
  %shr4.i.iter44 = lshr i32 %xor2.i.i.iter44, 8, !dbg !209
  %and5.i.iter44 = and i32 %shr4.i.iter44, 15, !dbg !210
  %conv6.i.iter44 = zext nneg i32 %and5.i.iter44 to i64, !dbg !211
  %mul7.i.iter44 = mul nuw i64 %and3.i.iter44, %conv6.i.iter44, !dbg !212
  %xor.i.iter44 = xor i64 %mul.i.iter44, %mul7.i.iter44, !dbg !213
  %arrayidx8.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.iter44, i32 %i.0.i1.iter44, !dbg !214
  %356 = load i64, ptr %arrayidx8.i.iter44, align 8, !dbg !214
  %shr9.i.iter44 = lshr i64 %356, 2, !dbg !215
  %and10.i.iter44 = and i64 %shr9.i.iter44, 1229782938247303441, !dbg !216
  %shr11.i.iter44 = lshr i32 %xor2.i.i.iter44, 16, !dbg !217
  %and12.i.iter44 = and i32 %shr11.i.iter44, 15, !dbg !218
  %conv13.i.iter44 = zext nneg i32 %and12.i.iter44 to i64, !dbg !219
  %mul14.i.iter44 = mul nuw i64 %and10.i.iter44, %conv13.i.iter44, !dbg !220
  %xor15.i.iter44 = xor i64 %xor.i.iter44, %mul14.i.iter44, !dbg !221
  %arrayidx16.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr.iter44, i32 %i.0.i1.iter44, !dbg !222
  %357 = load i64, ptr %arrayidx16.i.iter44, align 8, !dbg !222
  %shr17.i.iter44 = lshr i64 %357, 3, !dbg !223
  %and18.i.iter44 = and i64 %shr17.i.iter44, 1229782938247303441, !dbg !224
  %shr19.i.iter44 = lshr i32 %xor2.i.i.iter44, 24, !dbg !225
  %and20.i.iter44 = and i32 %shr19.i.iter44, 15, !dbg !226
  %conv21.i.iter44 = zext nneg i32 %and20.i.iter44 to i64, !dbg !227
  %mul22.i.iter44 = mul nuw i64 %and18.i.iter44, %conv21.i.iter44, !dbg !228
  %xor23.i.iter44 = xor i64 %xor15.i.iter44, %mul22.i.iter44, !dbg !229
  %arrayidx24.i.iter44 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter44, i32 %i.0.i1.iter44, !dbg !230
  %358 = load i64, ptr %arrayidx24.i.iter44, align 8, !dbg !231
  %xor25.i.iter44 = xor i64 %358, %xor23.i.iter44, !dbg !231
  store i64 %xor25.i.iter44, ptr %arrayidx24.i.iter44, align 8, !dbg !231
  %inc.i.iter44 = add nuw nsw i32 %i.0.i1.iter44, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter44 = icmp eq i32 %inc.i.iter44, 5, !dbg !233
  br i1 %exitcond.i.not.iter44, label %m_vec_mul_add.exit.iter44, label %for.body.i.iter44, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter44:                        ; preds = %for.body.i.iter44
  %add13.iter44 = add nuw nsw i32 %k.02.iter44, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter44 = icmp eq i32 %add13.iter44, 10, !dbg !238
  br i1 %exitcond.not.iter44, label %for.inc15.iter44, label %for.body6.iter44, !dbg !239, !llvm.loop !240

for.inc15.iter44:                                 ; preds = %m_vec_mul_add.exit.iter44
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter44 = add i32 %bs_mat_entries_used.14.iter44, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter44 = add nuw nsw i32 %c.05.iter44, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter44 = icmp eq i32 %add14.iter44, %351, !dbg !244
  br i1 %exitcond1.not.iter44, label %for.cond1.for.inc17_crit_edge.iter44, label %for.cond4.preheader.iter44, !dbg !155, !llvm.loop !245

for.inc17.iter44:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter44
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_44_end

for.cond4.preheader.iter44:                       ; preds = %for.cond4.preheader.lr.ph.iter44, %for.inc15.iter44
  %c.05.iter44 = phi i32 [ 44, %for.cond4.preheader.lr.ph.iter44 ], [ %inc.iter44, %for.inc15.iter44 ]
  %bs_mat_entries_used.14.iter44 = phi i32 [ %split.iter43, %for.cond4.preheader.lr.ph.iter44 ], [ %add14.iter44, %for.inc15.iter44 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter44, !dbg !239

for.cond4.preheader.lr.ph.iter44:                 ; preds = %for.cond1.preheader.iter44
  br label %for.cond4.preheader.iter44, !dbg !155

for.cond1.for.inc17_crit_edge.iter44:             ; preds = %for.inc15.iter44
  %split.iter44 = phi i32 [ %add14.iter44, %for.inc15.iter44 ]
  br label %for.inc17.iter44, !dbg !155

iter_44_end:                                      ; preds = %for.inc17.iter44
  br label %iter_45_start

iter_45_start:                                    ; preds = %iter_44_end
  br label %for.cond1.preheader.iter45

for.cond1.preheader.iter45:                       ; preds = %iter_45_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %359 = add i32 %split.iter44, 33, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter45, !dbg !155

for.body6.iter45:                                 ; preds = %for.cond4.preheader.iter45, %m_vec_mul_add.exit.iter45
  %k.02.iter45 = phi i32 [ 0, %for.cond4.preheader.iter45 ], [ %add13.iter45, %m_vec_mul_add.exit.iter45 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter45 = mul nsw i32 %bs_mat_entries_used.14.iter45, 40, !dbg !161
  %add.ptr.iter45 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter45, !dbg !161
  %mul8.iter45 = mul nuw nsw i32 %k.02.iter45, 78, !dbg !164
  %360 = getelementptr i8, ptr %mat, i32 %mul8.iter45, !dbg !165
  %arrayidx.iter45 = getelementptr i8, ptr %360, i32 %c.05.iter45, !dbg !165
  %361 = load i8, ptr %arrayidx.iter45, align 1, !dbg !165
  %add10.iter45 = add nuw nsw i32 450, %k.02.iter45, !dbg !166
  %add.ptr12.idx.iter45 = mul nuw nsw i32 %add10.iter45, 40, !dbg !167
  %add.ptr12.iter45 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter45, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter45 = zext i8 %361 to i32, !dbg !185
  %mul.i.i.iter45 = mul i32 %conv.i.i.iter45, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter45 = and i32 %mul.i.i.iter45, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter45 = lshr exact i32 %and.i.i.iter45, 4, !dbg !191
  %shr1.i.i.iter45 = lshr exact i32 %and.i.i.iter45, 3, !dbg !192
  %362 = xor i32 %shr.i.i.iter45, %shr1.i.i.iter45, !dbg !193
  %xor2.i.i.iter45 = xor i32 %362, %mul.i.i.iter45, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter45, !dbg !199

for.body.i.iter45:                                ; preds = %for.body.i.iter45, %for.body6.iter45
  %i.0.i1.iter45 = phi i32 [ 0, %for.body6.iter45 ], [ %inc.i.iter45, %for.body.i.iter45 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.iter45, i32 %i.0.i1.iter45, !dbg !200
  %363 = load i64, ptr %arrayidx.i.iter45, align 8, !dbg !200
  %and.i.iter45 = and i64 %363, 1229782938247303441, !dbg !203
  %and1.i.iter45 = and i32 %xor2.i.i.iter45, 255, !dbg !204
  %conv.i.iter45 = zext nneg i32 %and1.i.iter45 to i64, !dbg !205
  %mul.i.iter45 = mul i64 %and.i.iter45, %conv.i.iter45, !dbg !206
  %shr.i.iter45 = lshr i64 %363, 1, !dbg !207
  %and3.i.iter45 = and i64 %shr.i.iter45, 1229782938247303441, !dbg !208
  %shr4.i.iter45 = lshr i32 %xor2.i.i.iter45, 8, !dbg !209
  %and5.i.iter45 = and i32 %shr4.i.iter45, 15, !dbg !210
  %conv6.i.iter45 = zext nneg i32 %and5.i.iter45 to i64, !dbg !211
  %mul7.i.iter45 = mul nuw i64 %and3.i.iter45, %conv6.i.iter45, !dbg !212
  %xor.i.iter45 = xor i64 %mul.i.iter45, %mul7.i.iter45, !dbg !213
  %arrayidx8.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.iter45, i32 %i.0.i1.iter45, !dbg !214
  %364 = load i64, ptr %arrayidx8.i.iter45, align 8, !dbg !214
  %shr9.i.iter45 = lshr i64 %364, 2, !dbg !215
  %and10.i.iter45 = and i64 %shr9.i.iter45, 1229782938247303441, !dbg !216
  %shr11.i.iter45 = lshr i32 %xor2.i.i.iter45, 16, !dbg !217
  %and12.i.iter45 = and i32 %shr11.i.iter45, 15, !dbg !218
  %conv13.i.iter45 = zext nneg i32 %and12.i.iter45 to i64, !dbg !219
  %mul14.i.iter45 = mul nuw i64 %and10.i.iter45, %conv13.i.iter45, !dbg !220
  %xor15.i.iter45 = xor i64 %xor.i.iter45, %mul14.i.iter45, !dbg !221
  %arrayidx16.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr.iter45, i32 %i.0.i1.iter45, !dbg !222
  %365 = load i64, ptr %arrayidx16.i.iter45, align 8, !dbg !222
  %shr17.i.iter45 = lshr i64 %365, 3, !dbg !223
  %and18.i.iter45 = and i64 %shr17.i.iter45, 1229782938247303441, !dbg !224
  %shr19.i.iter45 = lshr i32 %xor2.i.i.iter45, 24, !dbg !225
  %and20.i.iter45 = and i32 %shr19.i.iter45, 15, !dbg !226
  %conv21.i.iter45 = zext nneg i32 %and20.i.iter45 to i64, !dbg !227
  %mul22.i.iter45 = mul nuw i64 %and18.i.iter45, %conv21.i.iter45, !dbg !228
  %xor23.i.iter45 = xor i64 %xor15.i.iter45, %mul22.i.iter45, !dbg !229
  %arrayidx24.i.iter45 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter45, i32 %i.0.i1.iter45, !dbg !230
  %366 = load i64, ptr %arrayidx24.i.iter45, align 8, !dbg !231
  %xor25.i.iter45 = xor i64 %366, %xor23.i.iter45, !dbg !231
  store i64 %xor25.i.iter45, ptr %arrayidx24.i.iter45, align 8, !dbg !231
  %inc.i.iter45 = add nuw nsw i32 %i.0.i1.iter45, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter45 = icmp eq i32 %inc.i.iter45, 5, !dbg !233
  br i1 %exitcond.i.not.iter45, label %m_vec_mul_add.exit.iter45, label %for.body.i.iter45, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter45:                        ; preds = %for.body.i.iter45
  %add13.iter45 = add nuw nsw i32 %k.02.iter45, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter45 = icmp eq i32 %add13.iter45, 10, !dbg !238
  br i1 %exitcond.not.iter45, label %for.inc15.iter45, label %for.body6.iter45, !dbg !239, !llvm.loop !240

for.inc15.iter45:                                 ; preds = %m_vec_mul_add.exit.iter45
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter45 = add i32 %bs_mat_entries_used.14.iter45, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter45 = add nuw nsw i32 %c.05.iter45, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter45 = icmp eq i32 %add14.iter45, %359, !dbg !244
  br i1 %exitcond1.not.iter45, label %for.cond1.for.inc17_crit_edge.iter45, label %for.cond4.preheader.iter45, !dbg !155, !llvm.loop !245

for.inc17.iter45:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter45
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_45_end

for.cond4.preheader.iter45:                       ; preds = %for.cond4.preheader.lr.ph.iter45, %for.inc15.iter45
  %c.05.iter45 = phi i32 [ 45, %for.cond4.preheader.lr.ph.iter45 ], [ %inc.iter45, %for.inc15.iter45 ]
  %bs_mat_entries_used.14.iter45 = phi i32 [ %split.iter44, %for.cond4.preheader.lr.ph.iter45 ], [ %add14.iter45, %for.inc15.iter45 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter45, !dbg !239

for.cond4.preheader.lr.ph.iter45:                 ; preds = %for.cond1.preheader.iter45
  br label %for.cond4.preheader.iter45, !dbg !155

for.cond1.for.inc17_crit_edge.iter45:             ; preds = %for.inc15.iter45
  %split.iter45 = phi i32 [ %add14.iter45, %for.inc15.iter45 ]
  br label %for.inc17.iter45, !dbg !155

iter_45_end:                                      ; preds = %for.inc17.iter45
  br label %iter_46_start

iter_46_start:                                    ; preds = %iter_45_end
  br label %for.cond1.preheader.iter46

for.cond1.preheader.iter46:                       ; preds = %iter_46_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %367 = add i32 %split.iter45, 32, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter46, !dbg !155

for.body6.iter46:                                 ; preds = %for.cond4.preheader.iter46, %m_vec_mul_add.exit.iter46
  %k.02.iter46 = phi i32 [ 0, %for.cond4.preheader.iter46 ], [ %add13.iter46, %m_vec_mul_add.exit.iter46 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter46 = mul nsw i32 %bs_mat_entries_used.14.iter46, 40, !dbg !161
  %add.ptr.iter46 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter46, !dbg !161
  %mul8.iter46 = mul nuw nsw i32 %k.02.iter46, 78, !dbg !164
  %368 = getelementptr i8, ptr %mat, i32 %mul8.iter46, !dbg !165
  %arrayidx.iter46 = getelementptr i8, ptr %368, i32 %c.05.iter46, !dbg !165
  %369 = load i8, ptr %arrayidx.iter46, align 1, !dbg !165
  %add10.iter46 = add nuw nsw i32 460, %k.02.iter46, !dbg !166
  %add.ptr12.idx.iter46 = mul nuw nsw i32 %add10.iter46, 40, !dbg !167
  %add.ptr12.iter46 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter46, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter46 = zext i8 %369 to i32, !dbg !185
  %mul.i.i.iter46 = mul i32 %conv.i.i.iter46, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter46 = and i32 %mul.i.i.iter46, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter46 = lshr exact i32 %and.i.i.iter46, 4, !dbg !191
  %shr1.i.i.iter46 = lshr exact i32 %and.i.i.iter46, 3, !dbg !192
  %370 = xor i32 %shr.i.i.iter46, %shr1.i.i.iter46, !dbg !193
  %xor2.i.i.iter46 = xor i32 %370, %mul.i.i.iter46, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter46, !dbg !199

for.body.i.iter46:                                ; preds = %for.body.i.iter46, %for.body6.iter46
  %i.0.i1.iter46 = phi i32 [ 0, %for.body6.iter46 ], [ %inc.i.iter46, %for.body.i.iter46 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.iter46, i32 %i.0.i1.iter46, !dbg !200
  %371 = load i64, ptr %arrayidx.i.iter46, align 8, !dbg !200
  %and.i.iter46 = and i64 %371, 1229782938247303441, !dbg !203
  %and1.i.iter46 = and i32 %xor2.i.i.iter46, 255, !dbg !204
  %conv.i.iter46 = zext nneg i32 %and1.i.iter46 to i64, !dbg !205
  %mul.i.iter46 = mul i64 %and.i.iter46, %conv.i.iter46, !dbg !206
  %shr.i.iter46 = lshr i64 %371, 1, !dbg !207
  %and3.i.iter46 = and i64 %shr.i.iter46, 1229782938247303441, !dbg !208
  %shr4.i.iter46 = lshr i32 %xor2.i.i.iter46, 8, !dbg !209
  %and5.i.iter46 = and i32 %shr4.i.iter46, 15, !dbg !210
  %conv6.i.iter46 = zext nneg i32 %and5.i.iter46 to i64, !dbg !211
  %mul7.i.iter46 = mul nuw i64 %and3.i.iter46, %conv6.i.iter46, !dbg !212
  %xor.i.iter46 = xor i64 %mul.i.iter46, %mul7.i.iter46, !dbg !213
  %arrayidx8.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.iter46, i32 %i.0.i1.iter46, !dbg !214
  %372 = load i64, ptr %arrayidx8.i.iter46, align 8, !dbg !214
  %shr9.i.iter46 = lshr i64 %372, 2, !dbg !215
  %and10.i.iter46 = and i64 %shr9.i.iter46, 1229782938247303441, !dbg !216
  %shr11.i.iter46 = lshr i32 %xor2.i.i.iter46, 16, !dbg !217
  %and12.i.iter46 = and i32 %shr11.i.iter46, 15, !dbg !218
  %conv13.i.iter46 = zext nneg i32 %and12.i.iter46 to i64, !dbg !219
  %mul14.i.iter46 = mul nuw i64 %and10.i.iter46, %conv13.i.iter46, !dbg !220
  %xor15.i.iter46 = xor i64 %xor.i.iter46, %mul14.i.iter46, !dbg !221
  %arrayidx16.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr.iter46, i32 %i.0.i1.iter46, !dbg !222
  %373 = load i64, ptr %arrayidx16.i.iter46, align 8, !dbg !222
  %shr17.i.iter46 = lshr i64 %373, 3, !dbg !223
  %and18.i.iter46 = and i64 %shr17.i.iter46, 1229782938247303441, !dbg !224
  %shr19.i.iter46 = lshr i32 %xor2.i.i.iter46, 24, !dbg !225
  %and20.i.iter46 = and i32 %shr19.i.iter46, 15, !dbg !226
  %conv21.i.iter46 = zext nneg i32 %and20.i.iter46 to i64, !dbg !227
  %mul22.i.iter46 = mul nuw i64 %and18.i.iter46, %conv21.i.iter46, !dbg !228
  %xor23.i.iter46 = xor i64 %xor15.i.iter46, %mul22.i.iter46, !dbg !229
  %arrayidx24.i.iter46 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter46, i32 %i.0.i1.iter46, !dbg !230
  %374 = load i64, ptr %arrayidx24.i.iter46, align 8, !dbg !231
  %xor25.i.iter46 = xor i64 %374, %xor23.i.iter46, !dbg !231
  store i64 %xor25.i.iter46, ptr %arrayidx24.i.iter46, align 8, !dbg !231
  %inc.i.iter46 = add nuw nsw i32 %i.0.i1.iter46, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter46 = icmp eq i32 %inc.i.iter46, 5, !dbg !233
  br i1 %exitcond.i.not.iter46, label %m_vec_mul_add.exit.iter46, label %for.body.i.iter46, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter46:                        ; preds = %for.body.i.iter46
  %add13.iter46 = add nuw nsw i32 %k.02.iter46, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter46 = icmp eq i32 %add13.iter46, 10, !dbg !238
  br i1 %exitcond.not.iter46, label %for.inc15.iter46, label %for.body6.iter46, !dbg !239, !llvm.loop !240

for.inc15.iter46:                                 ; preds = %m_vec_mul_add.exit.iter46
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter46 = add i32 %bs_mat_entries_used.14.iter46, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter46 = add nuw nsw i32 %c.05.iter46, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter46 = icmp eq i32 %add14.iter46, %367, !dbg !244
  br i1 %exitcond1.not.iter46, label %for.cond1.for.inc17_crit_edge.iter46, label %for.cond4.preheader.iter46, !dbg !155, !llvm.loop !245

for.inc17.iter46:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter46
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_46_end

for.cond4.preheader.iter46:                       ; preds = %for.cond4.preheader.lr.ph.iter46, %for.inc15.iter46
  %c.05.iter46 = phi i32 [ 46, %for.cond4.preheader.lr.ph.iter46 ], [ %inc.iter46, %for.inc15.iter46 ]
  %bs_mat_entries_used.14.iter46 = phi i32 [ %split.iter45, %for.cond4.preheader.lr.ph.iter46 ], [ %add14.iter46, %for.inc15.iter46 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter46, !dbg !239

for.cond4.preheader.lr.ph.iter46:                 ; preds = %for.cond1.preheader.iter46
  br label %for.cond4.preheader.iter46, !dbg !155

for.cond1.for.inc17_crit_edge.iter46:             ; preds = %for.inc15.iter46
  %split.iter46 = phi i32 [ %add14.iter46, %for.inc15.iter46 ]
  br label %for.inc17.iter46, !dbg !155

iter_46_end:                                      ; preds = %for.inc17.iter46
  br label %iter_47_start

iter_47_start:                                    ; preds = %iter_46_end
  br label %for.cond1.preheader.iter47

for.cond1.preheader.iter47:                       ; preds = %iter_47_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %375 = add i32 %split.iter46, 31, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter47, !dbg !155

for.body6.iter47:                                 ; preds = %for.cond4.preheader.iter47, %m_vec_mul_add.exit.iter47
  %k.02.iter47 = phi i32 [ 0, %for.cond4.preheader.iter47 ], [ %add13.iter47, %m_vec_mul_add.exit.iter47 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter47 = mul nsw i32 %bs_mat_entries_used.14.iter47, 40, !dbg !161
  %add.ptr.iter47 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter47, !dbg !161
  %mul8.iter47 = mul nuw nsw i32 %k.02.iter47, 78, !dbg !164
  %376 = getelementptr i8, ptr %mat, i32 %mul8.iter47, !dbg !165
  %arrayidx.iter47 = getelementptr i8, ptr %376, i32 %c.05.iter47, !dbg !165
  %377 = load i8, ptr %arrayidx.iter47, align 1, !dbg !165
  %add10.iter47 = add nuw nsw i32 470, %k.02.iter47, !dbg !166
  %add.ptr12.idx.iter47 = mul nuw nsw i32 %add10.iter47, 40, !dbg !167
  %add.ptr12.iter47 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter47, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter47 = zext i8 %377 to i32, !dbg !185
  %mul.i.i.iter47 = mul i32 %conv.i.i.iter47, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter47 = and i32 %mul.i.i.iter47, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter47 = lshr exact i32 %and.i.i.iter47, 4, !dbg !191
  %shr1.i.i.iter47 = lshr exact i32 %and.i.i.iter47, 3, !dbg !192
  %378 = xor i32 %shr.i.i.iter47, %shr1.i.i.iter47, !dbg !193
  %xor2.i.i.iter47 = xor i32 %378, %mul.i.i.iter47, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter47, !dbg !199

for.body.i.iter47:                                ; preds = %for.body.i.iter47, %for.body6.iter47
  %i.0.i1.iter47 = phi i32 [ 0, %for.body6.iter47 ], [ %inc.i.iter47, %for.body.i.iter47 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.iter47, i32 %i.0.i1.iter47, !dbg !200
  %379 = load i64, ptr %arrayidx.i.iter47, align 8, !dbg !200
  %and.i.iter47 = and i64 %379, 1229782938247303441, !dbg !203
  %and1.i.iter47 = and i32 %xor2.i.i.iter47, 255, !dbg !204
  %conv.i.iter47 = zext nneg i32 %and1.i.iter47 to i64, !dbg !205
  %mul.i.iter47 = mul i64 %and.i.iter47, %conv.i.iter47, !dbg !206
  %shr.i.iter47 = lshr i64 %379, 1, !dbg !207
  %and3.i.iter47 = and i64 %shr.i.iter47, 1229782938247303441, !dbg !208
  %shr4.i.iter47 = lshr i32 %xor2.i.i.iter47, 8, !dbg !209
  %and5.i.iter47 = and i32 %shr4.i.iter47, 15, !dbg !210
  %conv6.i.iter47 = zext nneg i32 %and5.i.iter47 to i64, !dbg !211
  %mul7.i.iter47 = mul nuw i64 %and3.i.iter47, %conv6.i.iter47, !dbg !212
  %xor.i.iter47 = xor i64 %mul.i.iter47, %mul7.i.iter47, !dbg !213
  %arrayidx8.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.iter47, i32 %i.0.i1.iter47, !dbg !214
  %380 = load i64, ptr %arrayidx8.i.iter47, align 8, !dbg !214
  %shr9.i.iter47 = lshr i64 %380, 2, !dbg !215
  %and10.i.iter47 = and i64 %shr9.i.iter47, 1229782938247303441, !dbg !216
  %shr11.i.iter47 = lshr i32 %xor2.i.i.iter47, 16, !dbg !217
  %and12.i.iter47 = and i32 %shr11.i.iter47, 15, !dbg !218
  %conv13.i.iter47 = zext nneg i32 %and12.i.iter47 to i64, !dbg !219
  %mul14.i.iter47 = mul nuw i64 %and10.i.iter47, %conv13.i.iter47, !dbg !220
  %xor15.i.iter47 = xor i64 %xor.i.iter47, %mul14.i.iter47, !dbg !221
  %arrayidx16.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr.iter47, i32 %i.0.i1.iter47, !dbg !222
  %381 = load i64, ptr %arrayidx16.i.iter47, align 8, !dbg !222
  %shr17.i.iter47 = lshr i64 %381, 3, !dbg !223
  %and18.i.iter47 = and i64 %shr17.i.iter47, 1229782938247303441, !dbg !224
  %shr19.i.iter47 = lshr i32 %xor2.i.i.iter47, 24, !dbg !225
  %and20.i.iter47 = and i32 %shr19.i.iter47, 15, !dbg !226
  %conv21.i.iter47 = zext nneg i32 %and20.i.iter47 to i64, !dbg !227
  %mul22.i.iter47 = mul nuw i64 %and18.i.iter47, %conv21.i.iter47, !dbg !228
  %xor23.i.iter47 = xor i64 %xor15.i.iter47, %mul22.i.iter47, !dbg !229
  %arrayidx24.i.iter47 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter47, i32 %i.0.i1.iter47, !dbg !230
  %382 = load i64, ptr %arrayidx24.i.iter47, align 8, !dbg !231
  %xor25.i.iter47 = xor i64 %382, %xor23.i.iter47, !dbg !231
  store i64 %xor25.i.iter47, ptr %arrayidx24.i.iter47, align 8, !dbg !231
  %inc.i.iter47 = add nuw nsw i32 %i.0.i1.iter47, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter47 = icmp eq i32 %inc.i.iter47, 5, !dbg !233
  br i1 %exitcond.i.not.iter47, label %m_vec_mul_add.exit.iter47, label %for.body.i.iter47, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter47:                        ; preds = %for.body.i.iter47
  %add13.iter47 = add nuw nsw i32 %k.02.iter47, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter47 = icmp eq i32 %add13.iter47, 10, !dbg !238
  br i1 %exitcond.not.iter47, label %for.inc15.iter47, label %for.body6.iter47, !dbg !239, !llvm.loop !240

for.inc15.iter47:                                 ; preds = %m_vec_mul_add.exit.iter47
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter47 = add i32 %bs_mat_entries_used.14.iter47, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter47 = add nuw nsw i32 %c.05.iter47, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter47 = icmp eq i32 %add14.iter47, %375, !dbg !244
  br i1 %exitcond1.not.iter47, label %for.cond1.for.inc17_crit_edge.iter47, label %for.cond4.preheader.iter47, !dbg !155, !llvm.loop !245

for.inc17.iter47:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter47
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_47_end

for.cond4.preheader.iter47:                       ; preds = %for.cond4.preheader.lr.ph.iter47, %for.inc15.iter47
  %c.05.iter47 = phi i32 [ 47, %for.cond4.preheader.lr.ph.iter47 ], [ %inc.iter47, %for.inc15.iter47 ]
  %bs_mat_entries_used.14.iter47 = phi i32 [ %split.iter46, %for.cond4.preheader.lr.ph.iter47 ], [ %add14.iter47, %for.inc15.iter47 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter47, !dbg !239

for.cond4.preheader.lr.ph.iter47:                 ; preds = %for.cond1.preheader.iter47
  br label %for.cond4.preheader.iter47, !dbg !155

for.cond1.for.inc17_crit_edge.iter47:             ; preds = %for.inc15.iter47
  %split.iter47 = phi i32 [ %add14.iter47, %for.inc15.iter47 ]
  br label %for.inc17.iter47, !dbg !155

iter_47_end:                                      ; preds = %for.inc17.iter47
  br label %iter_48_start

iter_48_start:                                    ; preds = %iter_47_end
  br label %for.cond1.preheader.iter48

for.cond1.preheader.iter48:                       ; preds = %iter_48_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %383 = add i32 %split.iter47, 30, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter48, !dbg !155

for.body6.iter48:                                 ; preds = %for.cond4.preheader.iter48, %m_vec_mul_add.exit.iter48
  %k.02.iter48 = phi i32 [ 0, %for.cond4.preheader.iter48 ], [ %add13.iter48, %m_vec_mul_add.exit.iter48 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter48 = mul nsw i32 %bs_mat_entries_used.14.iter48, 40, !dbg !161
  %add.ptr.iter48 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter48, !dbg !161
  %mul8.iter48 = mul nuw nsw i32 %k.02.iter48, 78, !dbg !164
  %384 = getelementptr i8, ptr %mat, i32 %mul8.iter48, !dbg !165
  %arrayidx.iter48 = getelementptr i8, ptr %384, i32 %c.05.iter48, !dbg !165
  %385 = load i8, ptr %arrayidx.iter48, align 1, !dbg !165
  %add10.iter48 = add nuw nsw i32 480, %k.02.iter48, !dbg !166
  %add.ptr12.idx.iter48 = mul nuw nsw i32 %add10.iter48, 40, !dbg !167
  %add.ptr12.iter48 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter48, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter48 = zext i8 %385 to i32, !dbg !185
  %mul.i.i.iter48 = mul i32 %conv.i.i.iter48, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter48 = and i32 %mul.i.i.iter48, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter48 = lshr exact i32 %and.i.i.iter48, 4, !dbg !191
  %shr1.i.i.iter48 = lshr exact i32 %and.i.i.iter48, 3, !dbg !192
  %386 = xor i32 %shr.i.i.iter48, %shr1.i.i.iter48, !dbg !193
  %xor2.i.i.iter48 = xor i32 %386, %mul.i.i.iter48, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter48, !dbg !199

for.body.i.iter48:                                ; preds = %for.body.i.iter48, %for.body6.iter48
  %i.0.i1.iter48 = phi i32 [ 0, %for.body6.iter48 ], [ %inc.i.iter48, %for.body.i.iter48 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.iter48, i32 %i.0.i1.iter48, !dbg !200
  %387 = load i64, ptr %arrayidx.i.iter48, align 8, !dbg !200
  %and.i.iter48 = and i64 %387, 1229782938247303441, !dbg !203
  %and1.i.iter48 = and i32 %xor2.i.i.iter48, 255, !dbg !204
  %conv.i.iter48 = zext nneg i32 %and1.i.iter48 to i64, !dbg !205
  %mul.i.iter48 = mul i64 %and.i.iter48, %conv.i.iter48, !dbg !206
  %shr.i.iter48 = lshr i64 %387, 1, !dbg !207
  %and3.i.iter48 = and i64 %shr.i.iter48, 1229782938247303441, !dbg !208
  %shr4.i.iter48 = lshr i32 %xor2.i.i.iter48, 8, !dbg !209
  %and5.i.iter48 = and i32 %shr4.i.iter48, 15, !dbg !210
  %conv6.i.iter48 = zext nneg i32 %and5.i.iter48 to i64, !dbg !211
  %mul7.i.iter48 = mul nuw i64 %and3.i.iter48, %conv6.i.iter48, !dbg !212
  %xor.i.iter48 = xor i64 %mul.i.iter48, %mul7.i.iter48, !dbg !213
  %arrayidx8.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.iter48, i32 %i.0.i1.iter48, !dbg !214
  %388 = load i64, ptr %arrayidx8.i.iter48, align 8, !dbg !214
  %shr9.i.iter48 = lshr i64 %388, 2, !dbg !215
  %and10.i.iter48 = and i64 %shr9.i.iter48, 1229782938247303441, !dbg !216
  %shr11.i.iter48 = lshr i32 %xor2.i.i.iter48, 16, !dbg !217
  %and12.i.iter48 = and i32 %shr11.i.iter48, 15, !dbg !218
  %conv13.i.iter48 = zext nneg i32 %and12.i.iter48 to i64, !dbg !219
  %mul14.i.iter48 = mul nuw i64 %and10.i.iter48, %conv13.i.iter48, !dbg !220
  %xor15.i.iter48 = xor i64 %xor.i.iter48, %mul14.i.iter48, !dbg !221
  %arrayidx16.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr.iter48, i32 %i.0.i1.iter48, !dbg !222
  %389 = load i64, ptr %arrayidx16.i.iter48, align 8, !dbg !222
  %shr17.i.iter48 = lshr i64 %389, 3, !dbg !223
  %and18.i.iter48 = and i64 %shr17.i.iter48, 1229782938247303441, !dbg !224
  %shr19.i.iter48 = lshr i32 %xor2.i.i.iter48, 24, !dbg !225
  %and20.i.iter48 = and i32 %shr19.i.iter48, 15, !dbg !226
  %conv21.i.iter48 = zext nneg i32 %and20.i.iter48 to i64, !dbg !227
  %mul22.i.iter48 = mul nuw i64 %and18.i.iter48, %conv21.i.iter48, !dbg !228
  %xor23.i.iter48 = xor i64 %xor15.i.iter48, %mul22.i.iter48, !dbg !229
  %arrayidx24.i.iter48 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter48, i32 %i.0.i1.iter48, !dbg !230
  %390 = load i64, ptr %arrayidx24.i.iter48, align 8, !dbg !231
  %xor25.i.iter48 = xor i64 %390, %xor23.i.iter48, !dbg !231
  store i64 %xor25.i.iter48, ptr %arrayidx24.i.iter48, align 8, !dbg !231
  %inc.i.iter48 = add nuw nsw i32 %i.0.i1.iter48, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter48 = icmp eq i32 %inc.i.iter48, 5, !dbg !233
  br i1 %exitcond.i.not.iter48, label %m_vec_mul_add.exit.iter48, label %for.body.i.iter48, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter48:                        ; preds = %for.body.i.iter48
  %add13.iter48 = add nuw nsw i32 %k.02.iter48, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter48 = icmp eq i32 %add13.iter48, 10, !dbg !238
  br i1 %exitcond.not.iter48, label %for.inc15.iter48, label %for.body6.iter48, !dbg !239, !llvm.loop !240

for.inc15.iter48:                                 ; preds = %m_vec_mul_add.exit.iter48
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter48 = add i32 %bs_mat_entries_used.14.iter48, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter48 = add nuw nsw i32 %c.05.iter48, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter48 = icmp eq i32 %add14.iter48, %383, !dbg !244
  br i1 %exitcond1.not.iter48, label %for.cond1.for.inc17_crit_edge.iter48, label %for.cond4.preheader.iter48, !dbg !155, !llvm.loop !245

for.inc17.iter48:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter48
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_48_end

for.cond4.preheader.iter48:                       ; preds = %for.cond4.preheader.lr.ph.iter48, %for.inc15.iter48
  %c.05.iter48 = phi i32 [ 48, %for.cond4.preheader.lr.ph.iter48 ], [ %inc.iter48, %for.inc15.iter48 ]
  %bs_mat_entries_used.14.iter48 = phi i32 [ %split.iter47, %for.cond4.preheader.lr.ph.iter48 ], [ %add14.iter48, %for.inc15.iter48 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter48, !dbg !239

for.cond4.preheader.lr.ph.iter48:                 ; preds = %for.cond1.preheader.iter48
  br label %for.cond4.preheader.iter48, !dbg !155

for.cond1.for.inc17_crit_edge.iter48:             ; preds = %for.inc15.iter48
  %split.iter48 = phi i32 [ %add14.iter48, %for.inc15.iter48 ]
  br label %for.inc17.iter48, !dbg !155

iter_48_end:                                      ; preds = %for.inc17.iter48
  br label %iter_49_start

iter_49_start:                                    ; preds = %iter_48_end
  br label %for.cond1.preheader.iter49

for.cond1.preheader.iter49:                       ; preds = %iter_49_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %391 = add i32 %split.iter48, 29, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter49, !dbg !155

for.body6.iter49:                                 ; preds = %for.cond4.preheader.iter49, %m_vec_mul_add.exit.iter49
  %k.02.iter49 = phi i32 [ 0, %for.cond4.preheader.iter49 ], [ %add13.iter49, %m_vec_mul_add.exit.iter49 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter49 = mul nsw i32 %bs_mat_entries_used.14.iter49, 40, !dbg !161
  %add.ptr.iter49 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter49, !dbg !161
  %mul8.iter49 = mul nuw nsw i32 %k.02.iter49, 78, !dbg !164
  %392 = getelementptr i8, ptr %mat, i32 %mul8.iter49, !dbg !165
  %arrayidx.iter49 = getelementptr i8, ptr %392, i32 %c.05.iter49, !dbg !165
  %393 = load i8, ptr %arrayidx.iter49, align 1, !dbg !165
  %add10.iter49 = add nuw nsw i32 490, %k.02.iter49, !dbg !166
  %add.ptr12.idx.iter49 = mul nuw nsw i32 %add10.iter49, 40, !dbg !167
  %add.ptr12.iter49 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter49, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter49 = zext i8 %393 to i32, !dbg !185
  %mul.i.i.iter49 = mul i32 %conv.i.i.iter49, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter49 = and i32 %mul.i.i.iter49, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter49 = lshr exact i32 %and.i.i.iter49, 4, !dbg !191
  %shr1.i.i.iter49 = lshr exact i32 %and.i.i.iter49, 3, !dbg !192
  %394 = xor i32 %shr.i.i.iter49, %shr1.i.i.iter49, !dbg !193
  %xor2.i.i.iter49 = xor i32 %394, %mul.i.i.iter49, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter49, !dbg !199

for.body.i.iter49:                                ; preds = %for.body.i.iter49, %for.body6.iter49
  %i.0.i1.iter49 = phi i32 [ 0, %for.body6.iter49 ], [ %inc.i.iter49, %for.body.i.iter49 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.iter49, i32 %i.0.i1.iter49, !dbg !200
  %395 = load i64, ptr %arrayidx.i.iter49, align 8, !dbg !200
  %and.i.iter49 = and i64 %395, 1229782938247303441, !dbg !203
  %and1.i.iter49 = and i32 %xor2.i.i.iter49, 255, !dbg !204
  %conv.i.iter49 = zext nneg i32 %and1.i.iter49 to i64, !dbg !205
  %mul.i.iter49 = mul i64 %and.i.iter49, %conv.i.iter49, !dbg !206
  %shr.i.iter49 = lshr i64 %395, 1, !dbg !207
  %and3.i.iter49 = and i64 %shr.i.iter49, 1229782938247303441, !dbg !208
  %shr4.i.iter49 = lshr i32 %xor2.i.i.iter49, 8, !dbg !209
  %and5.i.iter49 = and i32 %shr4.i.iter49, 15, !dbg !210
  %conv6.i.iter49 = zext nneg i32 %and5.i.iter49 to i64, !dbg !211
  %mul7.i.iter49 = mul nuw i64 %and3.i.iter49, %conv6.i.iter49, !dbg !212
  %xor.i.iter49 = xor i64 %mul.i.iter49, %mul7.i.iter49, !dbg !213
  %arrayidx8.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.iter49, i32 %i.0.i1.iter49, !dbg !214
  %396 = load i64, ptr %arrayidx8.i.iter49, align 8, !dbg !214
  %shr9.i.iter49 = lshr i64 %396, 2, !dbg !215
  %and10.i.iter49 = and i64 %shr9.i.iter49, 1229782938247303441, !dbg !216
  %shr11.i.iter49 = lshr i32 %xor2.i.i.iter49, 16, !dbg !217
  %and12.i.iter49 = and i32 %shr11.i.iter49, 15, !dbg !218
  %conv13.i.iter49 = zext nneg i32 %and12.i.iter49 to i64, !dbg !219
  %mul14.i.iter49 = mul nuw i64 %and10.i.iter49, %conv13.i.iter49, !dbg !220
  %xor15.i.iter49 = xor i64 %xor.i.iter49, %mul14.i.iter49, !dbg !221
  %arrayidx16.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr.iter49, i32 %i.0.i1.iter49, !dbg !222
  %397 = load i64, ptr %arrayidx16.i.iter49, align 8, !dbg !222
  %shr17.i.iter49 = lshr i64 %397, 3, !dbg !223
  %and18.i.iter49 = and i64 %shr17.i.iter49, 1229782938247303441, !dbg !224
  %shr19.i.iter49 = lshr i32 %xor2.i.i.iter49, 24, !dbg !225
  %and20.i.iter49 = and i32 %shr19.i.iter49, 15, !dbg !226
  %conv21.i.iter49 = zext nneg i32 %and20.i.iter49 to i64, !dbg !227
  %mul22.i.iter49 = mul nuw i64 %and18.i.iter49, %conv21.i.iter49, !dbg !228
  %xor23.i.iter49 = xor i64 %xor15.i.iter49, %mul22.i.iter49, !dbg !229
  %arrayidx24.i.iter49 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter49, i32 %i.0.i1.iter49, !dbg !230
  %398 = load i64, ptr %arrayidx24.i.iter49, align 8, !dbg !231
  %xor25.i.iter49 = xor i64 %398, %xor23.i.iter49, !dbg !231
  store i64 %xor25.i.iter49, ptr %arrayidx24.i.iter49, align 8, !dbg !231
  %inc.i.iter49 = add nuw nsw i32 %i.0.i1.iter49, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter49 = icmp eq i32 %inc.i.iter49, 5, !dbg !233
  br i1 %exitcond.i.not.iter49, label %m_vec_mul_add.exit.iter49, label %for.body.i.iter49, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter49:                        ; preds = %for.body.i.iter49
  %add13.iter49 = add nuw nsw i32 %k.02.iter49, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter49 = icmp eq i32 %add13.iter49, 10, !dbg !238
  br i1 %exitcond.not.iter49, label %for.inc15.iter49, label %for.body6.iter49, !dbg !239, !llvm.loop !240

for.inc15.iter49:                                 ; preds = %m_vec_mul_add.exit.iter49
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter49 = add i32 %bs_mat_entries_used.14.iter49, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter49 = add nuw nsw i32 %c.05.iter49, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter49 = icmp eq i32 %add14.iter49, %391, !dbg !244
  br i1 %exitcond1.not.iter49, label %for.cond1.for.inc17_crit_edge.iter49, label %for.cond4.preheader.iter49, !dbg !155, !llvm.loop !245

for.inc17.iter49:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter49
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_49_end

for.cond4.preheader.iter49:                       ; preds = %for.cond4.preheader.lr.ph.iter49, %for.inc15.iter49
  %c.05.iter49 = phi i32 [ 49, %for.cond4.preheader.lr.ph.iter49 ], [ %inc.iter49, %for.inc15.iter49 ]
  %bs_mat_entries_used.14.iter49 = phi i32 [ %split.iter48, %for.cond4.preheader.lr.ph.iter49 ], [ %add14.iter49, %for.inc15.iter49 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter49, !dbg !239

for.cond4.preheader.lr.ph.iter49:                 ; preds = %for.cond1.preheader.iter49
  br label %for.cond4.preheader.iter49, !dbg !155

for.cond1.for.inc17_crit_edge.iter49:             ; preds = %for.inc15.iter49
  %split.iter49 = phi i32 [ %add14.iter49, %for.inc15.iter49 ]
  br label %for.inc17.iter49, !dbg !155

iter_49_end:                                      ; preds = %for.inc17.iter49
  br label %iter_50_start

iter_50_start:                                    ; preds = %iter_49_end
  br label %for.cond1.preheader.iter50

for.cond1.preheader.iter50:                       ; preds = %iter_50_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %399 = add i32 %split.iter49, 28, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter50, !dbg !155

for.body6.iter50:                                 ; preds = %for.cond4.preheader.iter50, %m_vec_mul_add.exit.iter50
  %k.02.iter50 = phi i32 [ 0, %for.cond4.preheader.iter50 ], [ %add13.iter50, %m_vec_mul_add.exit.iter50 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter50 = mul nsw i32 %bs_mat_entries_used.14.iter50, 40, !dbg !161
  %add.ptr.iter50 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter50, !dbg !161
  %mul8.iter50 = mul nuw nsw i32 %k.02.iter50, 78, !dbg !164
  %400 = getelementptr i8, ptr %mat, i32 %mul8.iter50, !dbg !165
  %arrayidx.iter50 = getelementptr i8, ptr %400, i32 %c.05.iter50, !dbg !165
  %401 = load i8, ptr %arrayidx.iter50, align 1, !dbg !165
  %add10.iter50 = add nuw nsw i32 500, %k.02.iter50, !dbg !166
  %add.ptr12.idx.iter50 = mul nuw nsw i32 %add10.iter50, 40, !dbg !167
  %add.ptr12.iter50 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter50, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter50 = zext i8 %401 to i32, !dbg !185
  %mul.i.i.iter50 = mul i32 %conv.i.i.iter50, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter50 = and i32 %mul.i.i.iter50, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter50 = lshr exact i32 %and.i.i.iter50, 4, !dbg !191
  %shr1.i.i.iter50 = lshr exact i32 %and.i.i.iter50, 3, !dbg !192
  %402 = xor i32 %shr.i.i.iter50, %shr1.i.i.iter50, !dbg !193
  %xor2.i.i.iter50 = xor i32 %402, %mul.i.i.iter50, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter50, !dbg !199

for.body.i.iter50:                                ; preds = %for.body.i.iter50, %for.body6.iter50
  %i.0.i1.iter50 = phi i32 [ 0, %for.body6.iter50 ], [ %inc.i.iter50, %for.body.i.iter50 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.iter50, i32 %i.0.i1.iter50, !dbg !200
  %403 = load i64, ptr %arrayidx.i.iter50, align 8, !dbg !200
  %and.i.iter50 = and i64 %403, 1229782938247303441, !dbg !203
  %and1.i.iter50 = and i32 %xor2.i.i.iter50, 255, !dbg !204
  %conv.i.iter50 = zext nneg i32 %and1.i.iter50 to i64, !dbg !205
  %mul.i.iter50 = mul i64 %and.i.iter50, %conv.i.iter50, !dbg !206
  %shr.i.iter50 = lshr i64 %403, 1, !dbg !207
  %and3.i.iter50 = and i64 %shr.i.iter50, 1229782938247303441, !dbg !208
  %shr4.i.iter50 = lshr i32 %xor2.i.i.iter50, 8, !dbg !209
  %and5.i.iter50 = and i32 %shr4.i.iter50, 15, !dbg !210
  %conv6.i.iter50 = zext nneg i32 %and5.i.iter50 to i64, !dbg !211
  %mul7.i.iter50 = mul nuw i64 %and3.i.iter50, %conv6.i.iter50, !dbg !212
  %xor.i.iter50 = xor i64 %mul.i.iter50, %mul7.i.iter50, !dbg !213
  %arrayidx8.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.iter50, i32 %i.0.i1.iter50, !dbg !214
  %404 = load i64, ptr %arrayidx8.i.iter50, align 8, !dbg !214
  %shr9.i.iter50 = lshr i64 %404, 2, !dbg !215
  %and10.i.iter50 = and i64 %shr9.i.iter50, 1229782938247303441, !dbg !216
  %shr11.i.iter50 = lshr i32 %xor2.i.i.iter50, 16, !dbg !217
  %and12.i.iter50 = and i32 %shr11.i.iter50, 15, !dbg !218
  %conv13.i.iter50 = zext nneg i32 %and12.i.iter50 to i64, !dbg !219
  %mul14.i.iter50 = mul nuw i64 %and10.i.iter50, %conv13.i.iter50, !dbg !220
  %xor15.i.iter50 = xor i64 %xor.i.iter50, %mul14.i.iter50, !dbg !221
  %arrayidx16.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr.iter50, i32 %i.0.i1.iter50, !dbg !222
  %405 = load i64, ptr %arrayidx16.i.iter50, align 8, !dbg !222
  %shr17.i.iter50 = lshr i64 %405, 3, !dbg !223
  %and18.i.iter50 = and i64 %shr17.i.iter50, 1229782938247303441, !dbg !224
  %shr19.i.iter50 = lshr i32 %xor2.i.i.iter50, 24, !dbg !225
  %and20.i.iter50 = and i32 %shr19.i.iter50, 15, !dbg !226
  %conv21.i.iter50 = zext nneg i32 %and20.i.iter50 to i64, !dbg !227
  %mul22.i.iter50 = mul nuw i64 %and18.i.iter50, %conv21.i.iter50, !dbg !228
  %xor23.i.iter50 = xor i64 %xor15.i.iter50, %mul22.i.iter50, !dbg !229
  %arrayidx24.i.iter50 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter50, i32 %i.0.i1.iter50, !dbg !230
  %406 = load i64, ptr %arrayidx24.i.iter50, align 8, !dbg !231
  %xor25.i.iter50 = xor i64 %406, %xor23.i.iter50, !dbg !231
  store i64 %xor25.i.iter50, ptr %arrayidx24.i.iter50, align 8, !dbg !231
  %inc.i.iter50 = add nuw nsw i32 %i.0.i1.iter50, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter50 = icmp eq i32 %inc.i.iter50, 5, !dbg !233
  br i1 %exitcond.i.not.iter50, label %m_vec_mul_add.exit.iter50, label %for.body.i.iter50, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter50:                        ; preds = %for.body.i.iter50
  %add13.iter50 = add nuw nsw i32 %k.02.iter50, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter50 = icmp eq i32 %add13.iter50, 10, !dbg !238
  br i1 %exitcond.not.iter50, label %for.inc15.iter50, label %for.body6.iter50, !dbg !239, !llvm.loop !240

for.inc15.iter50:                                 ; preds = %m_vec_mul_add.exit.iter50
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter50 = add i32 %bs_mat_entries_used.14.iter50, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter50 = add nuw nsw i32 %c.05.iter50, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter50 = icmp eq i32 %add14.iter50, %399, !dbg !244
  br i1 %exitcond1.not.iter50, label %for.cond1.for.inc17_crit_edge.iter50, label %for.cond4.preheader.iter50, !dbg !155, !llvm.loop !245

for.inc17.iter50:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter50
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_50_end

for.cond4.preheader.iter50:                       ; preds = %for.cond4.preheader.lr.ph.iter50, %for.inc15.iter50
  %c.05.iter50 = phi i32 [ 50, %for.cond4.preheader.lr.ph.iter50 ], [ %inc.iter50, %for.inc15.iter50 ]
  %bs_mat_entries_used.14.iter50 = phi i32 [ %split.iter49, %for.cond4.preheader.lr.ph.iter50 ], [ %add14.iter50, %for.inc15.iter50 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter50, !dbg !239

for.cond4.preheader.lr.ph.iter50:                 ; preds = %for.cond1.preheader.iter50
  br label %for.cond4.preheader.iter50, !dbg !155

for.cond1.for.inc17_crit_edge.iter50:             ; preds = %for.inc15.iter50
  %split.iter50 = phi i32 [ %add14.iter50, %for.inc15.iter50 ]
  br label %for.inc17.iter50, !dbg !155

iter_50_end:                                      ; preds = %for.inc17.iter50
  br label %iter_51_start

iter_51_start:                                    ; preds = %iter_50_end
  br label %for.cond1.preheader.iter51

for.cond1.preheader.iter51:                       ; preds = %iter_51_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %407 = add i32 %split.iter50, 27, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter51, !dbg !155

for.body6.iter51:                                 ; preds = %for.cond4.preheader.iter51, %m_vec_mul_add.exit.iter51
  %k.02.iter51 = phi i32 [ 0, %for.cond4.preheader.iter51 ], [ %add13.iter51, %m_vec_mul_add.exit.iter51 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter51 = mul nsw i32 %bs_mat_entries_used.14.iter51, 40, !dbg !161
  %add.ptr.iter51 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter51, !dbg !161
  %mul8.iter51 = mul nuw nsw i32 %k.02.iter51, 78, !dbg !164
  %408 = getelementptr i8, ptr %mat, i32 %mul8.iter51, !dbg !165
  %arrayidx.iter51 = getelementptr i8, ptr %408, i32 %c.05.iter51, !dbg !165
  %409 = load i8, ptr %arrayidx.iter51, align 1, !dbg !165
  %add10.iter51 = add nuw nsw i32 510, %k.02.iter51, !dbg !166
  %add.ptr12.idx.iter51 = mul nuw nsw i32 %add10.iter51, 40, !dbg !167
  %add.ptr12.iter51 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter51, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter51 = zext i8 %409 to i32, !dbg !185
  %mul.i.i.iter51 = mul i32 %conv.i.i.iter51, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter51 = and i32 %mul.i.i.iter51, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter51 = lshr exact i32 %and.i.i.iter51, 4, !dbg !191
  %shr1.i.i.iter51 = lshr exact i32 %and.i.i.iter51, 3, !dbg !192
  %410 = xor i32 %shr.i.i.iter51, %shr1.i.i.iter51, !dbg !193
  %xor2.i.i.iter51 = xor i32 %410, %mul.i.i.iter51, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter51, !dbg !199

for.body.i.iter51:                                ; preds = %for.body.i.iter51, %for.body6.iter51
  %i.0.i1.iter51 = phi i32 [ 0, %for.body6.iter51 ], [ %inc.i.iter51, %for.body.i.iter51 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.iter51, i32 %i.0.i1.iter51, !dbg !200
  %411 = load i64, ptr %arrayidx.i.iter51, align 8, !dbg !200
  %and.i.iter51 = and i64 %411, 1229782938247303441, !dbg !203
  %and1.i.iter51 = and i32 %xor2.i.i.iter51, 255, !dbg !204
  %conv.i.iter51 = zext nneg i32 %and1.i.iter51 to i64, !dbg !205
  %mul.i.iter51 = mul i64 %and.i.iter51, %conv.i.iter51, !dbg !206
  %shr.i.iter51 = lshr i64 %411, 1, !dbg !207
  %and3.i.iter51 = and i64 %shr.i.iter51, 1229782938247303441, !dbg !208
  %shr4.i.iter51 = lshr i32 %xor2.i.i.iter51, 8, !dbg !209
  %and5.i.iter51 = and i32 %shr4.i.iter51, 15, !dbg !210
  %conv6.i.iter51 = zext nneg i32 %and5.i.iter51 to i64, !dbg !211
  %mul7.i.iter51 = mul nuw i64 %and3.i.iter51, %conv6.i.iter51, !dbg !212
  %xor.i.iter51 = xor i64 %mul.i.iter51, %mul7.i.iter51, !dbg !213
  %arrayidx8.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.iter51, i32 %i.0.i1.iter51, !dbg !214
  %412 = load i64, ptr %arrayidx8.i.iter51, align 8, !dbg !214
  %shr9.i.iter51 = lshr i64 %412, 2, !dbg !215
  %and10.i.iter51 = and i64 %shr9.i.iter51, 1229782938247303441, !dbg !216
  %shr11.i.iter51 = lshr i32 %xor2.i.i.iter51, 16, !dbg !217
  %and12.i.iter51 = and i32 %shr11.i.iter51, 15, !dbg !218
  %conv13.i.iter51 = zext nneg i32 %and12.i.iter51 to i64, !dbg !219
  %mul14.i.iter51 = mul nuw i64 %and10.i.iter51, %conv13.i.iter51, !dbg !220
  %xor15.i.iter51 = xor i64 %xor.i.iter51, %mul14.i.iter51, !dbg !221
  %arrayidx16.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr.iter51, i32 %i.0.i1.iter51, !dbg !222
  %413 = load i64, ptr %arrayidx16.i.iter51, align 8, !dbg !222
  %shr17.i.iter51 = lshr i64 %413, 3, !dbg !223
  %and18.i.iter51 = and i64 %shr17.i.iter51, 1229782938247303441, !dbg !224
  %shr19.i.iter51 = lshr i32 %xor2.i.i.iter51, 24, !dbg !225
  %and20.i.iter51 = and i32 %shr19.i.iter51, 15, !dbg !226
  %conv21.i.iter51 = zext nneg i32 %and20.i.iter51 to i64, !dbg !227
  %mul22.i.iter51 = mul nuw i64 %and18.i.iter51, %conv21.i.iter51, !dbg !228
  %xor23.i.iter51 = xor i64 %xor15.i.iter51, %mul22.i.iter51, !dbg !229
  %arrayidx24.i.iter51 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter51, i32 %i.0.i1.iter51, !dbg !230
  %414 = load i64, ptr %arrayidx24.i.iter51, align 8, !dbg !231
  %xor25.i.iter51 = xor i64 %414, %xor23.i.iter51, !dbg !231
  store i64 %xor25.i.iter51, ptr %arrayidx24.i.iter51, align 8, !dbg !231
  %inc.i.iter51 = add nuw nsw i32 %i.0.i1.iter51, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter51 = icmp eq i32 %inc.i.iter51, 5, !dbg !233
  br i1 %exitcond.i.not.iter51, label %m_vec_mul_add.exit.iter51, label %for.body.i.iter51, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter51:                        ; preds = %for.body.i.iter51
  %add13.iter51 = add nuw nsw i32 %k.02.iter51, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter51 = icmp eq i32 %add13.iter51, 10, !dbg !238
  br i1 %exitcond.not.iter51, label %for.inc15.iter51, label %for.body6.iter51, !dbg !239, !llvm.loop !240

for.inc15.iter51:                                 ; preds = %m_vec_mul_add.exit.iter51
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter51 = add i32 %bs_mat_entries_used.14.iter51, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter51 = add nuw nsw i32 %c.05.iter51, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter51 = icmp eq i32 %add14.iter51, %407, !dbg !244
  br i1 %exitcond1.not.iter51, label %for.cond1.for.inc17_crit_edge.iter51, label %for.cond4.preheader.iter51, !dbg !155, !llvm.loop !245

for.inc17.iter51:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter51
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_51_end

for.cond4.preheader.iter51:                       ; preds = %for.cond4.preheader.lr.ph.iter51, %for.inc15.iter51
  %c.05.iter51 = phi i32 [ 51, %for.cond4.preheader.lr.ph.iter51 ], [ %inc.iter51, %for.inc15.iter51 ]
  %bs_mat_entries_used.14.iter51 = phi i32 [ %split.iter50, %for.cond4.preheader.lr.ph.iter51 ], [ %add14.iter51, %for.inc15.iter51 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter51, !dbg !239

for.cond4.preheader.lr.ph.iter51:                 ; preds = %for.cond1.preheader.iter51
  br label %for.cond4.preheader.iter51, !dbg !155

for.cond1.for.inc17_crit_edge.iter51:             ; preds = %for.inc15.iter51
  %split.iter51 = phi i32 [ %add14.iter51, %for.inc15.iter51 ]
  br label %for.inc17.iter51, !dbg !155

iter_51_end:                                      ; preds = %for.inc17.iter51
  br label %iter_52_start

iter_52_start:                                    ; preds = %iter_51_end
  br label %for.cond1.preheader.iter52

for.cond1.preheader.iter52:                       ; preds = %iter_52_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %415 = add i32 %split.iter51, 26, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter52, !dbg !155

for.body6.iter52:                                 ; preds = %for.cond4.preheader.iter52, %m_vec_mul_add.exit.iter52
  %k.02.iter52 = phi i32 [ 0, %for.cond4.preheader.iter52 ], [ %add13.iter52, %m_vec_mul_add.exit.iter52 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter52 = mul nsw i32 %bs_mat_entries_used.14.iter52, 40, !dbg !161
  %add.ptr.iter52 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter52, !dbg !161
  %mul8.iter52 = mul nuw nsw i32 %k.02.iter52, 78, !dbg !164
  %416 = getelementptr i8, ptr %mat, i32 %mul8.iter52, !dbg !165
  %arrayidx.iter52 = getelementptr i8, ptr %416, i32 %c.05.iter52, !dbg !165
  %417 = load i8, ptr %arrayidx.iter52, align 1, !dbg !165
  %add10.iter52 = add nuw nsw i32 520, %k.02.iter52, !dbg !166
  %add.ptr12.idx.iter52 = mul nuw nsw i32 %add10.iter52, 40, !dbg !167
  %add.ptr12.iter52 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter52, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter52 = zext i8 %417 to i32, !dbg !185
  %mul.i.i.iter52 = mul i32 %conv.i.i.iter52, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter52 = and i32 %mul.i.i.iter52, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter52 = lshr exact i32 %and.i.i.iter52, 4, !dbg !191
  %shr1.i.i.iter52 = lshr exact i32 %and.i.i.iter52, 3, !dbg !192
  %418 = xor i32 %shr.i.i.iter52, %shr1.i.i.iter52, !dbg !193
  %xor2.i.i.iter52 = xor i32 %418, %mul.i.i.iter52, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter52, !dbg !199

for.body.i.iter52:                                ; preds = %for.body.i.iter52, %for.body6.iter52
  %i.0.i1.iter52 = phi i32 [ 0, %for.body6.iter52 ], [ %inc.i.iter52, %for.body.i.iter52 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.iter52, i32 %i.0.i1.iter52, !dbg !200
  %419 = load i64, ptr %arrayidx.i.iter52, align 8, !dbg !200
  %and.i.iter52 = and i64 %419, 1229782938247303441, !dbg !203
  %and1.i.iter52 = and i32 %xor2.i.i.iter52, 255, !dbg !204
  %conv.i.iter52 = zext nneg i32 %and1.i.iter52 to i64, !dbg !205
  %mul.i.iter52 = mul i64 %and.i.iter52, %conv.i.iter52, !dbg !206
  %shr.i.iter52 = lshr i64 %419, 1, !dbg !207
  %and3.i.iter52 = and i64 %shr.i.iter52, 1229782938247303441, !dbg !208
  %shr4.i.iter52 = lshr i32 %xor2.i.i.iter52, 8, !dbg !209
  %and5.i.iter52 = and i32 %shr4.i.iter52, 15, !dbg !210
  %conv6.i.iter52 = zext nneg i32 %and5.i.iter52 to i64, !dbg !211
  %mul7.i.iter52 = mul nuw i64 %and3.i.iter52, %conv6.i.iter52, !dbg !212
  %xor.i.iter52 = xor i64 %mul.i.iter52, %mul7.i.iter52, !dbg !213
  %arrayidx8.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.iter52, i32 %i.0.i1.iter52, !dbg !214
  %420 = load i64, ptr %arrayidx8.i.iter52, align 8, !dbg !214
  %shr9.i.iter52 = lshr i64 %420, 2, !dbg !215
  %and10.i.iter52 = and i64 %shr9.i.iter52, 1229782938247303441, !dbg !216
  %shr11.i.iter52 = lshr i32 %xor2.i.i.iter52, 16, !dbg !217
  %and12.i.iter52 = and i32 %shr11.i.iter52, 15, !dbg !218
  %conv13.i.iter52 = zext nneg i32 %and12.i.iter52 to i64, !dbg !219
  %mul14.i.iter52 = mul nuw i64 %and10.i.iter52, %conv13.i.iter52, !dbg !220
  %xor15.i.iter52 = xor i64 %xor.i.iter52, %mul14.i.iter52, !dbg !221
  %arrayidx16.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr.iter52, i32 %i.0.i1.iter52, !dbg !222
  %421 = load i64, ptr %arrayidx16.i.iter52, align 8, !dbg !222
  %shr17.i.iter52 = lshr i64 %421, 3, !dbg !223
  %and18.i.iter52 = and i64 %shr17.i.iter52, 1229782938247303441, !dbg !224
  %shr19.i.iter52 = lshr i32 %xor2.i.i.iter52, 24, !dbg !225
  %and20.i.iter52 = and i32 %shr19.i.iter52, 15, !dbg !226
  %conv21.i.iter52 = zext nneg i32 %and20.i.iter52 to i64, !dbg !227
  %mul22.i.iter52 = mul nuw i64 %and18.i.iter52, %conv21.i.iter52, !dbg !228
  %xor23.i.iter52 = xor i64 %xor15.i.iter52, %mul22.i.iter52, !dbg !229
  %arrayidx24.i.iter52 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter52, i32 %i.0.i1.iter52, !dbg !230
  %422 = load i64, ptr %arrayidx24.i.iter52, align 8, !dbg !231
  %xor25.i.iter52 = xor i64 %422, %xor23.i.iter52, !dbg !231
  store i64 %xor25.i.iter52, ptr %arrayidx24.i.iter52, align 8, !dbg !231
  %inc.i.iter52 = add nuw nsw i32 %i.0.i1.iter52, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter52 = icmp eq i32 %inc.i.iter52, 5, !dbg !233
  br i1 %exitcond.i.not.iter52, label %m_vec_mul_add.exit.iter52, label %for.body.i.iter52, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter52:                        ; preds = %for.body.i.iter52
  %add13.iter52 = add nuw nsw i32 %k.02.iter52, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter52 = icmp eq i32 %add13.iter52, 10, !dbg !238
  br i1 %exitcond.not.iter52, label %for.inc15.iter52, label %for.body6.iter52, !dbg !239, !llvm.loop !240

for.inc15.iter52:                                 ; preds = %m_vec_mul_add.exit.iter52
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter52 = add i32 %bs_mat_entries_used.14.iter52, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter52 = add nuw nsw i32 %c.05.iter52, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter52 = icmp eq i32 %add14.iter52, %415, !dbg !244
  br i1 %exitcond1.not.iter52, label %for.cond1.for.inc17_crit_edge.iter52, label %for.cond4.preheader.iter52, !dbg !155, !llvm.loop !245

for.inc17.iter52:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter52
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_52_end

for.cond4.preheader.iter52:                       ; preds = %for.cond4.preheader.lr.ph.iter52, %for.inc15.iter52
  %c.05.iter52 = phi i32 [ 52, %for.cond4.preheader.lr.ph.iter52 ], [ %inc.iter52, %for.inc15.iter52 ]
  %bs_mat_entries_used.14.iter52 = phi i32 [ %split.iter51, %for.cond4.preheader.lr.ph.iter52 ], [ %add14.iter52, %for.inc15.iter52 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter52, !dbg !239

for.cond4.preheader.lr.ph.iter52:                 ; preds = %for.cond1.preheader.iter52
  br label %for.cond4.preheader.iter52, !dbg !155

for.cond1.for.inc17_crit_edge.iter52:             ; preds = %for.inc15.iter52
  %split.iter52 = phi i32 [ %add14.iter52, %for.inc15.iter52 ]
  br label %for.inc17.iter52, !dbg !155

iter_52_end:                                      ; preds = %for.inc17.iter52
  br label %iter_53_start

iter_53_start:                                    ; preds = %iter_52_end
  br label %for.cond1.preheader.iter53

for.cond1.preheader.iter53:                       ; preds = %iter_53_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %423 = add i32 %split.iter52, 25, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter53, !dbg !155

for.body6.iter53:                                 ; preds = %for.cond4.preheader.iter53, %m_vec_mul_add.exit.iter53
  %k.02.iter53 = phi i32 [ 0, %for.cond4.preheader.iter53 ], [ %add13.iter53, %m_vec_mul_add.exit.iter53 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter53 = mul nsw i32 %bs_mat_entries_used.14.iter53, 40, !dbg !161
  %add.ptr.iter53 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter53, !dbg !161
  %mul8.iter53 = mul nuw nsw i32 %k.02.iter53, 78, !dbg !164
  %424 = getelementptr i8, ptr %mat, i32 %mul8.iter53, !dbg !165
  %arrayidx.iter53 = getelementptr i8, ptr %424, i32 %c.05.iter53, !dbg !165
  %425 = load i8, ptr %arrayidx.iter53, align 1, !dbg !165
  %add10.iter53 = add nuw nsw i32 530, %k.02.iter53, !dbg !166
  %add.ptr12.idx.iter53 = mul nuw nsw i32 %add10.iter53, 40, !dbg !167
  %add.ptr12.iter53 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter53, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter53 = zext i8 %425 to i32, !dbg !185
  %mul.i.i.iter53 = mul i32 %conv.i.i.iter53, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter53 = and i32 %mul.i.i.iter53, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter53 = lshr exact i32 %and.i.i.iter53, 4, !dbg !191
  %shr1.i.i.iter53 = lshr exact i32 %and.i.i.iter53, 3, !dbg !192
  %426 = xor i32 %shr.i.i.iter53, %shr1.i.i.iter53, !dbg !193
  %xor2.i.i.iter53 = xor i32 %426, %mul.i.i.iter53, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter53, !dbg !199

for.body.i.iter53:                                ; preds = %for.body.i.iter53, %for.body6.iter53
  %i.0.i1.iter53 = phi i32 [ 0, %for.body6.iter53 ], [ %inc.i.iter53, %for.body.i.iter53 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.iter53, i32 %i.0.i1.iter53, !dbg !200
  %427 = load i64, ptr %arrayidx.i.iter53, align 8, !dbg !200
  %and.i.iter53 = and i64 %427, 1229782938247303441, !dbg !203
  %and1.i.iter53 = and i32 %xor2.i.i.iter53, 255, !dbg !204
  %conv.i.iter53 = zext nneg i32 %and1.i.iter53 to i64, !dbg !205
  %mul.i.iter53 = mul i64 %and.i.iter53, %conv.i.iter53, !dbg !206
  %shr.i.iter53 = lshr i64 %427, 1, !dbg !207
  %and3.i.iter53 = and i64 %shr.i.iter53, 1229782938247303441, !dbg !208
  %shr4.i.iter53 = lshr i32 %xor2.i.i.iter53, 8, !dbg !209
  %and5.i.iter53 = and i32 %shr4.i.iter53, 15, !dbg !210
  %conv6.i.iter53 = zext nneg i32 %and5.i.iter53 to i64, !dbg !211
  %mul7.i.iter53 = mul nuw i64 %and3.i.iter53, %conv6.i.iter53, !dbg !212
  %xor.i.iter53 = xor i64 %mul.i.iter53, %mul7.i.iter53, !dbg !213
  %arrayidx8.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.iter53, i32 %i.0.i1.iter53, !dbg !214
  %428 = load i64, ptr %arrayidx8.i.iter53, align 8, !dbg !214
  %shr9.i.iter53 = lshr i64 %428, 2, !dbg !215
  %and10.i.iter53 = and i64 %shr9.i.iter53, 1229782938247303441, !dbg !216
  %shr11.i.iter53 = lshr i32 %xor2.i.i.iter53, 16, !dbg !217
  %and12.i.iter53 = and i32 %shr11.i.iter53, 15, !dbg !218
  %conv13.i.iter53 = zext nneg i32 %and12.i.iter53 to i64, !dbg !219
  %mul14.i.iter53 = mul nuw i64 %and10.i.iter53, %conv13.i.iter53, !dbg !220
  %xor15.i.iter53 = xor i64 %xor.i.iter53, %mul14.i.iter53, !dbg !221
  %arrayidx16.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr.iter53, i32 %i.0.i1.iter53, !dbg !222
  %429 = load i64, ptr %arrayidx16.i.iter53, align 8, !dbg !222
  %shr17.i.iter53 = lshr i64 %429, 3, !dbg !223
  %and18.i.iter53 = and i64 %shr17.i.iter53, 1229782938247303441, !dbg !224
  %shr19.i.iter53 = lshr i32 %xor2.i.i.iter53, 24, !dbg !225
  %and20.i.iter53 = and i32 %shr19.i.iter53, 15, !dbg !226
  %conv21.i.iter53 = zext nneg i32 %and20.i.iter53 to i64, !dbg !227
  %mul22.i.iter53 = mul nuw i64 %and18.i.iter53, %conv21.i.iter53, !dbg !228
  %xor23.i.iter53 = xor i64 %xor15.i.iter53, %mul22.i.iter53, !dbg !229
  %arrayidx24.i.iter53 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter53, i32 %i.0.i1.iter53, !dbg !230
  %430 = load i64, ptr %arrayidx24.i.iter53, align 8, !dbg !231
  %xor25.i.iter53 = xor i64 %430, %xor23.i.iter53, !dbg !231
  store i64 %xor25.i.iter53, ptr %arrayidx24.i.iter53, align 8, !dbg !231
  %inc.i.iter53 = add nuw nsw i32 %i.0.i1.iter53, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter53 = icmp eq i32 %inc.i.iter53, 5, !dbg !233
  br i1 %exitcond.i.not.iter53, label %m_vec_mul_add.exit.iter53, label %for.body.i.iter53, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter53:                        ; preds = %for.body.i.iter53
  %add13.iter53 = add nuw nsw i32 %k.02.iter53, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter53 = icmp eq i32 %add13.iter53, 10, !dbg !238
  br i1 %exitcond.not.iter53, label %for.inc15.iter53, label %for.body6.iter53, !dbg !239, !llvm.loop !240

for.inc15.iter53:                                 ; preds = %m_vec_mul_add.exit.iter53
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter53 = add i32 %bs_mat_entries_used.14.iter53, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter53 = add nuw nsw i32 %c.05.iter53, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter53 = icmp eq i32 %add14.iter53, %423, !dbg !244
  br i1 %exitcond1.not.iter53, label %for.cond1.for.inc17_crit_edge.iter53, label %for.cond4.preheader.iter53, !dbg !155, !llvm.loop !245

for.inc17.iter53:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter53
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_53_end

for.cond4.preheader.iter53:                       ; preds = %for.cond4.preheader.lr.ph.iter53, %for.inc15.iter53
  %c.05.iter53 = phi i32 [ 53, %for.cond4.preheader.lr.ph.iter53 ], [ %inc.iter53, %for.inc15.iter53 ]
  %bs_mat_entries_used.14.iter53 = phi i32 [ %split.iter52, %for.cond4.preheader.lr.ph.iter53 ], [ %add14.iter53, %for.inc15.iter53 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter53, !dbg !239

for.cond4.preheader.lr.ph.iter53:                 ; preds = %for.cond1.preheader.iter53
  br label %for.cond4.preheader.iter53, !dbg !155

for.cond1.for.inc17_crit_edge.iter53:             ; preds = %for.inc15.iter53
  %split.iter53 = phi i32 [ %add14.iter53, %for.inc15.iter53 ]
  br label %for.inc17.iter53, !dbg !155

iter_53_end:                                      ; preds = %for.inc17.iter53
  br label %iter_54_start

iter_54_start:                                    ; preds = %iter_53_end
  br label %for.cond1.preheader.iter54

for.cond1.preheader.iter54:                       ; preds = %iter_54_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %431 = add i32 %split.iter53, 24, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter54, !dbg !155

for.body6.iter54:                                 ; preds = %for.cond4.preheader.iter54, %m_vec_mul_add.exit.iter54
  %k.02.iter54 = phi i32 [ 0, %for.cond4.preheader.iter54 ], [ %add13.iter54, %m_vec_mul_add.exit.iter54 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter54 = mul nsw i32 %bs_mat_entries_used.14.iter54, 40, !dbg !161
  %add.ptr.iter54 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter54, !dbg !161
  %mul8.iter54 = mul nuw nsw i32 %k.02.iter54, 78, !dbg !164
  %432 = getelementptr i8, ptr %mat, i32 %mul8.iter54, !dbg !165
  %arrayidx.iter54 = getelementptr i8, ptr %432, i32 %c.05.iter54, !dbg !165
  %433 = load i8, ptr %arrayidx.iter54, align 1, !dbg !165
  %add10.iter54 = add nuw nsw i32 540, %k.02.iter54, !dbg !166
  %add.ptr12.idx.iter54 = mul nuw nsw i32 %add10.iter54, 40, !dbg !167
  %add.ptr12.iter54 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter54, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter54 = zext i8 %433 to i32, !dbg !185
  %mul.i.i.iter54 = mul i32 %conv.i.i.iter54, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter54 = and i32 %mul.i.i.iter54, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter54 = lshr exact i32 %and.i.i.iter54, 4, !dbg !191
  %shr1.i.i.iter54 = lshr exact i32 %and.i.i.iter54, 3, !dbg !192
  %434 = xor i32 %shr.i.i.iter54, %shr1.i.i.iter54, !dbg !193
  %xor2.i.i.iter54 = xor i32 %434, %mul.i.i.iter54, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter54, !dbg !199

for.body.i.iter54:                                ; preds = %for.body.i.iter54, %for.body6.iter54
  %i.0.i1.iter54 = phi i32 [ 0, %for.body6.iter54 ], [ %inc.i.iter54, %for.body.i.iter54 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.iter54, i32 %i.0.i1.iter54, !dbg !200
  %435 = load i64, ptr %arrayidx.i.iter54, align 8, !dbg !200
  %and.i.iter54 = and i64 %435, 1229782938247303441, !dbg !203
  %and1.i.iter54 = and i32 %xor2.i.i.iter54, 255, !dbg !204
  %conv.i.iter54 = zext nneg i32 %and1.i.iter54 to i64, !dbg !205
  %mul.i.iter54 = mul i64 %and.i.iter54, %conv.i.iter54, !dbg !206
  %shr.i.iter54 = lshr i64 %435, 1, !dbg !207
  %and3.i.iter54 = and i64 %shr.i.iter54, 1229782938247303441, !dbg !208
  %shr4.i.iter54 = lshr i32 %xor2.i.i.iter54, 8, !dbg !209
  %and5.i.iter54 = and i32 %shr4.i.iter54, 15, !dbg !210
  %conv6.i.iter54 = zext nneg i32 %and5.i.iter54 to i64, !dbg !211
  %mul7.i.iter54 = mul nuw i64 %and3.i.iter54, %conv6.i.iter54, !dbg !212
  %xor.i.iter54 = xor i64 %mul.i.iter54, %mul7.i.iter54, !dbg !213
  %arrayidx8.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.iter54, i32 %i.0.i1.iter54, !dbg !214
  %436 = load i64, ptr %arrayidx8.i.iter54, align 8, !dbg !214
  %shr9.i.iter54 = lshr i64 %436, 2, !dbg !215
  %and10.i.iter54 = and i64 %shr9.i.iter54, 1229782938247303441, !dbg !216
  %shr11.i.iter54 = lshr i32 %xor2.i.i.iter54, 16, !dbg !217
  %and12.i.iter54 = and i32 %shr11.i.iter54, 15, !dbg !218
  %conv13.i.iter54 = zext nneg i32 %and12.i.iter54 to i64, !dbg !219
  %mul14.i.iter54 = mul nuw i64 %and10.i.iter54, %conv13.i.iter54, !dbg !220
  %xor15.i.iter54 = xor i64 %xor.i.iter54, %mul14.i.iter54, !dbg !221
  %arrayidx16.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr.iter54, i32 %i.0.i1.iter54, !dbg !222
  %437 = load i64, ptr %arrayidx16.i.iter54, align 8, !dbg !222
  %shr17.i.iter54 = lshr i64 %437, 3, !dbg !223
  %and18.i.iter54 = and i64 %shr17.i.iter54, 1229782938247303441, !dbg !224
  %shr19.i.iter54 = lshr i32 %xor2.i.i.iter54, 24, !dbg !225
  %and20.i.iter54 = and i32 %shr19.i.iter54, 15, !dbg !226
  %conv21.i.iter54 = zext nneg i32 %and20.i.iter54 to i64, !dbg !227
  %mul22.i.iter54 = mul nuw i64 %and18.i.iter54, %conv21.i.iter54, !dbg !228
  %xor23.i.iter54 = xor i64 %xor15.i.iter54, %mul22.i.iter54, !dbg !229
  %arrayidx24.i.iter54 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter54, i32 %i.0.i1.iter54, !dbg !230
  %438 = load i64, ptr %arrayidx24.i.iter54, align 8, !dbg !231
  %xor25.i.iter54 = xor i64 %438, %xor23.i.iter54, !dbg !231
  store i64 %xor25.i.iter54, ptr %arrayidx24.i.iter54, align 8, !dbg !231
  %inc.i.iter54 = add nuw nsw i32 %i.0.i1.iter54, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter54 = icmp eq i32 %inc.i.iter54, 5, !dbg !233
  br i1 %exitcond.i.not.iter54, label %m_vec_mul_add.exit.iter54, label %for.body.i.iter54, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter54:                        ; preds = %for.body.i.iter54
  %add13.iter54 = add nuw nsw i32 %k.02.iter54, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter54 = icmp eq i32 %add13.iter54, 10, !dbg !238
  br i1 %exitcond.not.iter54, label %for.inc15.iter54, label %for.body6.iter54, !dbg !239, !llvm.loop !240

for.inc15.iter54:                                 ; preds = %m_vec_mul_add.exit.iter54
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter54 = add i32 %bs_mat_entries_used.14.iter54, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter54 = add nuw nsw i32 %c.05.iter54, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter54 = icmp eq i32 %add14.iter54, %431, !dbg !244
  br i1 %exitcond1.not.iter54, label %for.cond1.for.inc17_crit_edge.iter54, label %for.cond4.preheader.iter54, !dbg !155, !llvm.loop !245

for.inc17.iter54:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter54
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_54_end

for.cond4.preheader.iter54:                       ; preds = %for.cond4.preheader.lr.ph.iter54, %for.inc15.iter54
  %c.05.iter54 = phi i32 [ 54, %for.cond4.preheader.lr.ph.iter54 ], [ %inc.iter54, %for.inc15.iter54 ]
  %bs_mat_entries_used.14.iter54 = phi i32 [ %split.iter53, %for.cond4.preheader.lr.ph.iter54 ], [ %add14.iter54, %for.inc15.iter54 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter54, !dbg !239

for.cond4.preheader.lr.ph.iter54:                 ; preds = %for.cond1.preheader.iter54
  br label %for.cond4.preheader.iter54, !dbg !155

for.cond1.for.inc17_crit_edge.iter54:             ; preds = %for.inc15.iter54
  %split.iter54 = phi i32 [ %add14.iter54, %for.inc15.iter54 ]
  br label %for.inc17.iter54, !dbg !155

iter_54_end:                                      ; preds = %for.inc17.iter54
  br label %iter_55_start

iter_55_start:                                    ; preds = %iter_54_end
  br label %for.cond1.preheader.iter55

for.cond1.preheader.iter55:                       ; preds = %iter_55_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %439 = add i32 %split.iter54, 23, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter55, !dbg !155

for.body6.iter55:                                 ; preds = %for.cond4.preheader.iter55, %m_vec_mul_add.exit.iter55
  %k.02.iter55 = phi i32 [ 0, %for.cond4.preheader.iter55 ], [ %add13.iter55, %m_vec_mul_add.exit.iter55 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter55 = mul nsw i32 %bs_mat_entries_used.14.iter55, 40, !dbg !161
  %add.ptr.iter55 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter55, !dbg !161
  %mul8.iter55 = mul nuw nsw i32 %k.02.iter55, 78, !dbg !164
  %440 = getelementptr i8, ptr %mat, i32 %mul8.iter55, !dbg !165
  %arrayidx.iter55 = getelementptr i8, ptr %440, i32 %c.05.iter55, !dbg !165
  %441 = load i8, ptr %arrayidx.iter55, align 1, !dbg !165
  %add10.iter55 = add nuw nsw i32 550, %k.02.iter55, !dbg !166
  %add.ptr12.idx.iter55 = mul nuw nsw i32 %add10.iter55, 40, !dbg !167
  %add.ptr12.iter55 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter55, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter55 = zext i8 %441 to i32, !dbg !185
  %mul.i.i.iter55 = mul i32 %conv.i.i.iter55, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter55 = and i32 %mul.i.i.iter55, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter55 = lshr exact i32 %and.i.i.iter55, 4, !dbg !191
  %shr1.i.i.iter55 = lshr exact i32 %and.i.i.iter55, 3, !dbg !192
  %442 = xor i32 %shr.i.i.iter55, %shr1.i.i.iter55, !dbg !193
  %xor2.i.i.iter55 = xor i32 %442, %mul.i.i.iter55, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter55, !dbg !199

for.body.i.iter55:                                ; preds = %for.body.i.iter55, %for.body6.iter55
  %i.0.i1.iter55 = phi i32 [ 0, %for.body6.iter55 ], [ %inc.i.iter55, %for.body.i.iter55 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.iter55, i32 %i.0.i1.iter55, !dbg !200
  %443 = load i64, ptr %arrayidx.i.iter55, align 8, !dbg !200
  %and.i.iter55 = and i64 %443, 1229782938247303441, !dbg !203
  %and1.i.iter55 = and i32 %xor2.i.i.iter55, 255, !dbg !204
  %conv.i.iter55 = zext nneg i32 %and1.i.iter55 to i64, !dbg !205
  %mul.i.iter55 = mul i64 %and.i.iter55, %conv.i.iter55, !dbg !206
  %shr.i.iter55 = lshr i64 %443, 1, !dbg !207
  %and3.i.iter55 = and i64 %shr.i.iter55, 1229782938247303441, !dbg !208
  %shr4.i.iter55 = lshr i32 %xor2.i.i.iter55, 8, !dbg !209
  %and5.i.iter55 = and i32 %shr4.i.iter55, 15, !dbg !210
  %conv6.i.iter55 = zext nneg i32 %and5.i.iter55 to i64, !dbg !211
  %mul7.i.iter55 = mul nuw i64 %and3.i.iter55, %conv6.i.iter55, !dbg !212
  %xor.i.iter55 = xor i64 %mul.i.iter55, %mul7.i.iter55, !dbg !213
  %arrayidx8.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.iter55, i32 %i.0.i1.iter55, !dbg !214
  %444 = load i64, ptr %arrayidx8.i.iter55, align 8, !dbg !214
  %shr9.i.iter55 = lshr i64 %444, 2, !dbg !215
  %and10.i.iter55 = and i64 %shr9.i.iter55, 1229782938247303441, !dbg !216
  %shr11.i.iter55 = lshr i32 %xor2.i.i.iter55, 16, !dbg !217
  %and12.i.iter55 = and i32 %shr11.i.iter55, 15, !dbg !218
  %conv13.i.iter55 = zext nneg i32 %and12.i.iter55 to i64, !dbg !219
  %mul14.i.iter55 = mul nuw i64 %and10.i.iter55, %conv13.i.iter55, !dbg !220
  %xor15.i.iter55 = xor i64 %xor.i.iter55, %mul14.i.iter55, !dbg !221
  %arrayidx16.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr.iter55, i32 %i.0.i1.iter55, !dbg !222
  %445 = load i64, ptr %arrayidx16.i.iter55, align 8, !dbg !222
  %shr17.i.iter55 = lshr i64 %445, 3, !dbg !223
  %and18.i.iter55 = and i64 %shr17.i.iter55, 1229782938247303441, !dbg !224
  %shr19.i.iter55 = lshr i32 %xor2.i.i.iter55, 24, !dbg !225
  %and20.i.iter55 = and i32 %shr19.i.iter55, 15, !dbg !226
  %conv21.i.iter55 = zext nneg i32 %and20.i.iter55 to i64, !dbg !227
  %mul22.i.iter55 = mul nuw i64 %and18.i.iter55, %conv21.i.iter55, !dbg !228
  %xor23.i.iter55 = xor i64 %xor15.i.iter55, %mul22.i.iter55, !dbg !229
  %arrayidx24.i.iter55 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter55, i32 %i.0.i1.iter55, !dbg !230
  %446 = load i64, ptr %arrayidx24.i.iter55, align 8, !dbg !231
  %xor25.i.iter55 = xor i64 %446, %xor23.i.iter55, !dbg !231
  store i64 %xor25.i.iter55, ptr %arrayidx24.i.iter55, align 8, !dbg !231
  %inc.i.iter55 = add nuw nsw i32 %i.0.i1.iter55, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter55 = icmp eq i32 %inc.i.iter55, 5, !dbg !233
  br i1 %exitcond.i.not.iter55, label %m_vec_mul_add.exit.iter55, label %for.body.i.iter55, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter55:                        ; preds = %for.body.i.iter55
  %add13.iter55 = add nuw nsw i32 %k.02.iter55, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter55 = icmp eq i32 %add13.iter55, 10, !dbg !238
  br i1 %exitcond.not.iter55, label %for.inc15.iter55, label %for.body6.iter55, !dbg !239, !llvm.loop !240

for.inc15.iter55:                                 ; preds = %m_vec_mul_add.exit.iter55
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter55 = add i32 %bs_mat_entries_used.14.iter55, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter55 = add nuw nsw i32 %c.05.iter55, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter55 = icmp eq i32 %add14.iter55, %439, !dbg !244
  br i1 %exitcond1.not.iter55, label %for.cond1.for.inc17_crit_edge.iter55, label %for.cond4.preheader.iter55, !dbg !155, !llvm.loop !245

for.inc17.iter55:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter55
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_55_end

for.cond4.preheader.iter55:                       ; preds = %for.cond4.preheader.lr.ph.iter55, %for.inc15.iter55
  %c.05.iter55 = phi i32 [ 55, %for.cond4.preheader.lr.ph.iter55 ], [ %inc.iter55, %for.inc15.iter55 ]
  %bs_mat_entries_used.14.iter55 = phi i32 [ %split.iter54, %for.cond4.preheader.lr.ph.iter55 ], [ %add14.iter55, %for.inc15.iter55 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter55, !dbg !239

for.cond4.preheader.lr.ph.iter55:                 ; preds = %for.cond1.preheader.iter55
  br label %for.cond4.preheader.iter55, !dbg !155

for.cond1.for.inc17_crit_edge.iter55:             ; preds = %for.inc15.iter55
  %split.iter55 = phi i32 [ %add14.iter55, %for.inc15.iter55 ]
  br label %for.inc17.iter55, !dbg !155

iter_55_end:                                      ; preds = %for.inc17.iter55
  br label %iter_56_start

iter_56_start:                                    ; preds = %iter_55_end
  br label %for.cond1.preheader.iter56

for.cond1.preheader.iter56:                       ; preds = %iter_56_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %447 = add i32 %split.iter55, 22, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter56, !dbg !155

for.body6.iter56:                                 ; preds = %for.cond4.preheader.iter56, %m_vec_mul_add.exit.iter56
  %k.02.iter56 = phi i32 [ 0, %for.cond4.preheader.iter56 ], [ %add13.iter56, %m_vec_mul_add.exit.iter56 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter56 = mul nsw i32 %bs_mat_entries_used.14.iter56, 40, !dbg !161
  %add.ptr.iter56 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter56, !dbg !161
  %mul8.iter56 = mul nuw nsw i32 %k.02.iter56, 78, !dbg !164
  %448 = getelementptr i8, ptr %mat, i32 %mul8.iter56, !dbg !165
  %arrayidx.iter56 = getelementptr i8, ptr %448, i32 %c.05.iter56, !dbg !165
  %449 = load i8, ptr %arrayidx.iter56, align 1, !dbg !165
  %add10.iter56 = add nuw nsw i32 560, %k.02.iter56, !dbg !166
  %add.ptr12.idx.iter56 = mul nuw nsw i32 %add10.iter56, 40, !dbg !167
  %add.ptr12.iter56 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter56, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter56 = zext i8 %449 to i32, !dbg !185
  %mul.i.i.iter56 = mul i32 %conv.i.i.iter56, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter56 = and i32 %mul.i.i.iter56, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter56 = lshr exact i32 %and.i.i.iter56, 4, !dbg !191
  %shr1.i.i.iter56 = lshr exact i32 %and.i.i.iter56, 3, !dbg !192
  %450 = xor i32 %shr.i.i.iter56, %shr1.i.i.iter56, !dbg !193
  %xor2.i.i.iter56 = xor i32 %450, %mul.i.i.iter56, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter56, !dbg !199

for.body.i.iter56:                                ; preds = %for.body.i.iter56, %for.body6.iter56
  %i.0.i1.iter56 = phi i32 [ 0, %for.body6.iter56 ], [ %inc.i.iter56, %for.body.i.iter56 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.iter56, i32 %i.0.i1.iter56, !dbg !200
  %451 = load i64, ptr %arrayidx.i.iter56, align 8, !dbg !200
  %and.i.iter56 = and i64 %451, 1229782938247303441, !dbg !203
  %and1.i.iter56 = and i32 %xor2.i.i.iter56, 255, !dbg !204
  %conv.i.iter56 = zext nneg i32 %and1.i.iter56 to i64, !dbg !205
  %mul.i.iter56 = mul i64 %and.i.iter56, %conv.i.iter56, !dbg !206
  %shr.i.iter56 = lshr i64 %451, 1, !dbg !207
  %and3.i.iter56 = and i64 %shr.i.iter56, 1229782938247303441, !dbg !208
  %shr4.i.iter56 = lshr i32 %xor2.i.i.iter56, 8, !dbg !209
  %and5.i.iter56 = and i32 %shr4.i.iter56, 15, !dbg !210
  %conv6.i.iter56 = zext nneg i32 %and5.i.iter56 to i64, !dbg !211
  %mul7.i.iter56 = mul nuw i64 %and3.i.iter56, %conv6.i.iter56, !dbg !212
  %xor.i.iter56 = xor i64 %mul.i.iter56, %mul7.i.iter56, !dbg !213
  %arrayidx8.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.iter56, i32 %i.0.i1.iter56, !dbg !214
  %452 = load i64, ptr %arrayidx8.i.iter56, align 8, !dbg !214
  %shr9.i.iter56 = lshr i64 %452, 2, !dbg !215
  %and10.i.iter56 = and i64 %shr9.i.iter56, 1229782938247303441, !dbg !216
  %shr11.i.iter56 = lshr i32 %xor2.i.i.iter56, 16, !dbg !217
  %and12.i.iter56 = and i32 %shr11.i.iter56, 15, !dbg !218
  %conv13.i.iter56 = zext nneg i32 %and12.i.iter56 to i64, !dbg !219
  %mul14.i.iter56 = mul nuw i64 %and10.i.iter56, %conv13.i.iter56, !dbg !220
  %xor15.i.iter56 = xor i64 %xor.i.iter56, %mul14.i.iter56, !dbg !221
  %arrayidx16.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr.iter56, i32 %i.0.i1.iter56, !dbg !222
  %453 = load i64, ptr %arrayidx16.i.iter56, align 8, !dbg !222
  %shr17.i.iter56 = lshr i64 %453, 3, !dbg !223
  %and18.i.iter56 = and i64 %shr17.i.iter56, 1229782938247303441, !dbg !224
  %shr19.i.iter56 = lshr i32 %xor2.i.i.iter56, 24, !dbg !225
  %and20.i.iter56 = and i32 %shr19.i.iter56, 15, !dbg !226
  %conv21.i.iter56 = zext nneg i32 %and20.i.iter56 to i64, !dbg !227
  %mul22.i.iter56 = mul nuw i64 %and18.i.iter56, %conv21.i.iter56, !dbg !228
  %xor23.i.iter56 = xor i64 %xor15.i.iter56, %mul22.i.iter56, !dbg !229
  %arrayidx24.i.iter56 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter56, i32 %i.0.i1.iter56, !dbg !230
  %454 = load i64, ptr %arrayidx24.i.iter56, align 8, !dbg !231
  %xor25.i.iter56 = xor i64 %454, %xor23.i.iter56, !dbg !231
  store i64 %xor25.i.iter56, ptr %arrayidx24.i.iter56, align 8, !dbg !231
  %inc.i.iter56 = add nuw nsw i32 %i.0.i1.iter56, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter56 = icmp eq i32 %inc.i.iter56, 5, !dbg !233
  br i1 %exitcond.i.not.iter56, label %m_vec_mul_add.exit.iter56, label %for.body.i.iter56, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter56:                        ; preds = %for.body.i.iter56
  %add13.iter56 = add nuw nsw i32 %k.02.iter56, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter56 = icmp eq i32 %add13.iter56, 10, !dbg !238
  br i1 %exitcond.not.iter56, label %for.inc15.iter56, label %for.body6.iter56, !dbg !239, !llvm.loop !240

for.inc15.iter56:                                 ; preds = %m_vec_mul_add.exit.iter56
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter56 = add i32 %bs_mat_entries_used.14.iter56, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter56 = add nuw nsw i32 %c.05.iter56, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter56 = icmp eq i32 %add14.iter56, %447, !dbg !244
  br i1 %exitcond1.not.iter56, label %for.cond1.for.inc17_crit_edge.iter56, label %for.cond4.preheader.iter56, !dbg !155, !llvm.loop !245

for.inc17.iter56:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter56
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_56_end

for.cond4.preheader.iter56:                       ; preds = %for.cond4.preheader.lr.ph.iter56, %for.inc15.iter56
  %c.05.iter56 = phi i32 [ 56, %for.cond4.preheader.lr.ph.iter56 ], [ %inc.iter56, %for.inc15.iter56 ]
  %bs_mat_entries_used.14.iter56 = phi i32 [ %split.iter55, %for.cond4.preheader.lr.ph.iter56 ], [ %add14.iter56, %for.inc15.iter56 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter56, !dbg !239

for.cond4.preheader.lr.ph.iter56:                 ; preds = %for.cond1.preheader.iter56
  br label %for.cond4.preheader.iter56, !dbg !155

for.cond1.for.inc17_crit_edge.iter56:             ; preds = %for.inc15.iter56
  %split.iter56 = phi i32 [ %add14.iter56, %for.inc15.iter56 ]
  br label %for.inc17.iter56, !dbg !155

iter_56_end:                                      ; preds = %for.inc17.iter56
  br label %iter_57_start

iter_57_start:                                    ; preds = %iter_56_end
  br label %for.cond1.preheader.iter57

for.cond1.preheader.iter57:                       ; preds = %iter_57_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %455 = add i32 %split.iter56, 21, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter57, !dbg !155

for.body6.iter57:                                 ; preds = %for.cond4.preheader.iter57, %m_vec_mul_add.exit.iter57
  %k.02.iter57 = phi i32 [ 0, %for.cond4.preheader.iter57 ], [ %add13.iter57, %m_vec_mul_add.exit.iter57 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter57 = mul nsw i32 %bs_mat_entries_used.14.iter57, 40, !dbg !161
  %add.ptr.iter57 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter57, !dbg !161
  %mul8.iter57 = mul nuw nsw i32 %k.02.iter57, 78, !dbg !164
  %456 = getelementptr i8, ptr %mat, i32 %mul8.iter57, !dbg !165
  %arrayidx.iter57 = getelementptr i8, ptr %456, i32 %c.05.iter57, !dbg !165
  %457 = load i8, ptr %arrayidx.iter57, align 1, !dbg !165
  %add10.iter57 = add nuw nsw i32 570, %k.02.iter57, !dbg !166
  %add.ptr12.idx.iter57 = mul nuw nsw i32 %add10.iter57, 40, !dbg !167
  %add.ptr12.iter57 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter57, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter57 = zext i8 %457 to i32, !dbg !185
  %mul.i.i.iter57 = mul i32 %conv.i.i.iter57, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter57 = and i32 %mul.i.i.iter57, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter57 = lshr exact i32 %and.i.i.iter57, 4, !dbg !191
  %shr1.i.i.iter57 = lshr exact i32 %and.i.i.iter57, 3, !dbg !192
  %458 = xor i32 %shr.i.i.iter57, %shr1.i.i.iter57, !dbg !193
  %xor2.i.i.iter57 = xor i32 %458, %mul.i.i.iter57, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter57, !dbg !199

for.body.i.iter57:                                ; preds = %for.body.i.iter57, %for.body6.iter57
  %i.0.i1.iter57 = phi i32 [ 0, %for.body6.iter57 ], [ %inc.i.iter57, %for.body.i.iter57 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.iter57, i32 %i.0.i1.iter57, !dbg !200
  %459 = load i64, ptr %arrayidx.i.iter57, align 8, !dbg !200
  %and.i.iter57 = and i64 %459, 1229782938247303441, !dbg !203
  %and1.i.iter57 = and i32 %xor2.i.i.iter57, 255, !dbg !204
  %conv.i.iter57 = zext nneg i32 %and1.i.iter57 to i64, !dbg !205
  %mul.i.iter57 = mul i64 %and.i.iter57, %conv.i.iter57, !dbg !206
  %shr.i.iter57 = lshr i64 %459, 1, !dbg !207
  %and3.i.iter57 = and i64 %shr.i.iter57, 1229782938247303441, !dbg !208
  %shr4.i.iter57 = lshr i32 %xor2.i.i.iter57, 8, !dbg !209
  %and5.i.iter57 = and i32 %shr4.i.iter57, 15, !dbg !210
  %conv6.i.iter57 = zext nneg i32 %and5.i.iter57 to i64, !dbg !211
  %mul7.i.iter57 = mul nuw i64 %and3.i.iter57, %conv6.i.iter57, !dbg !212
  %xor.i.iter57 = xor i64 %mul.i.iter57, %mul7.i.iter57, !dbg !213
  %arrayidx8.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.iter57, i32 %i.0.i1.iter57, !dbg !214
  %460 = load i64, ptr %arrayidx8.i.iter57, align 8, !dbg !214
  %shr9.i.iter57 = lshr i64 %460, 2, !dbg !215
  %and10.i.iter57 = and i64 %shr9.i.iter57, 1229782938247303441, !dbg !216
  %shr11.i.iter57 = lshr i32 %xor2.i.i.iter57, 16, !dbg !217
  %and12.i.iter57 = and i32 %shr11.i.iter57, 15, !dbg !218
  %conv13.i.iter57 = zext nneg i32 %and12.i.iter57 to i64, !dbg !219
  %mul14.i.iter57 = mul nuw i64 %and10.i.iter57, %conv13.i.iter57, !dbg !220
  %xor15.i.iter57 = xor i64 %xor.i.iter57, %mul14.i.iter57, !dbg !221
  %arrayidx16.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr.iter57, i32 %i.0.i1.iter57, !dbg !222
  %461 = load i64, ptr %arrayidx16.i.iter57, align 8, !dbg !222
  %shr17.i.iter57 = lshr i64 %461, 3, !dbg !223
  %and18.i.iter57 = and i64 %shr17.i.iter57, 1229782938247303441, !dbg !224
  %shr19.i.iter57 = lshr i32 %xor2.i.i.iter57, 24, !dbg !225
  %and20.i.iter57 = and i32 %shr19.i.iter57, 15, !dbg !226
  %conv21.i.iter57 = zext nneg i32 %and20.i.iter57 to i64, !dbg !227
  %mul22.i.iter57 = mul nuw i64 %and18.i.iter57, %conv21.i.iter57, !dbg !228
  %xor23.i.iter57 = xor i64 %xor15.i.iter57, %mul22.i.iter57, !dbg !229
  %arrayidx24.i.iter57 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter57, i32 %i.0.i1.iter57, !dbg !230
  %462 = load i64, ptr %arrayidx24.i.iter57, align 8, !dbg !231
  %xor25.i.iter57 = xor i64 %462, %xor23.i.iter57, !dbg !231
  store i64 %xor25.i.iter57, ptr %arrayidx24.i.iter57, align 8, !dbg !231
  %inc.i.iter57 = add nuw nsw i32 %i.0.i1.iter57, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter57 = icmp eq i32 %inc.i.iter57, 5, !dbg !233
  br i1 %exitcond.i.not.iter57, label %m_vec_mul_add.exit.iter57, label %for.body.i.iter57, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter57:                        ; preds = %for.body.i.iter57
  %add13.iter57 = add nuw nsw i32 %k.02.iter57, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter57 = icmp eq i32 %add13.iter57, 10, !dbg !238
  br i1 %exitcond.not.iter57, label %for.inc15.iter57, label %for.body6.iter57, !dbg !239, !llvm.loop !240

for.inc15.iter57:                                 ; preds = %m_vec_mul_add.exit.iter57
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter57 = add i32 %bs_mat_entries_used.14.iter57, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter57 = add nuw nsw i32 %c.05.iter57, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter57 = icmp eq i32 %add14.iter57, %455, !dbg !244
  br i1 %exitcond1.not.iter57, label %for.cond1.for.inc17_crit_edge.iter57, label %for.cond4.preheader.iter57, !dbg !155, !llvm.loop !245

for.inc17.iter57:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter57
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_57_end

for.cond4.preheader.iter57:                       ; preds = %for.cond4.preheader.lr.ph.iter57, %for.inc15.iter57
  %c.05.iter57 = phi i32 [ 57, %for.cond4.preheader.lr.ph.iter57 ], [ %inc.iter57, %for.inc15.iter57 ]
  %bs_mat_entries_used.14.iter57 = phi i32 [ %split.iter56, %for.cond4.preheader.lr.ph.iter57 ], [ %add14.iter57, %for.inc15.iter57 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter57, !dbg !239

for.cond4.preheader.lr.ph.iter57:                 ; preds = %for.cond1.preheader.iter57
  br label %for.cond4.preheader.iter57, !dbg !155

for.cond1.for.inc17_crit_edge.iter57:             ; preds = %for.inc15.iter57
  %split.iter57 = phi i32 [ %add14.iter57, %for.inc15.iter57 ]
  br label %for.inc17.iter57, !dbg !155

iter_57_end:                                      ; preds = %for.inc17.iter57
  br label %iter_58_start

iter_58_start:                                    ; preds = %iter_57_end
  br label %for.cond1.preheader.iter58

for.cond1.preheader.iter58:                       ; preds = %iter_58_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %463 = add i32 %split.iter57, 20, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter58, !dbg !155

for.body6.iter58:                                 ; preds = %for.cond4.preheader.iter58, %m_vec_mul_add.exit.iter58
  %k.02.iter58 = phi i32 [ 0, %for.cond4.preheader.iter58 ], [ %add13.iter58, %m_vec_mul_add.exit.iter58 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter58 = mul nsw i32 %bs_mat_entries_used.14.iter58, 40, !dbg !161
  %add.ptr.iter58 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter58, !dbg !161
  %mul8.iter58 = mul nuw nsw i32 %k.02.iter58, 78, !dbg !164
  %464 = getelementptr i8, ptr %mat, i32 %mul8.iter58, !dbg !165
  %arrayidx.iter58 = getelementptr i8, ptr %464, i32 %c.05.iter58, !dbg !165
  %465 = load i8, ptr %arrayidx.iter58, align 1, !dbg !165
  %add10.iter58 = add nuw nsw i32 580, %k.02.iter58, !dbg !166
  %add.ptr12.idx.iter58 = mul nuw nsw i32 %add10.iter58, 40, !dbg !167
  %add.ptr12.iter58 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter58, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter58 = zext i8 %465 to i32, !dbg !185
  %mul.i.i.iter58 = mul i32 %conv.i.i.iter58, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter58 = and i32 %mul.i.i.iter58, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter58 = lshr exact i32 %and.i.i.iter58, 4, !dbg !191
  %shr1.i.i.iter58 = lshr exact i32 %and.i.i.iter58, 3, !dbg !192
  %466 = xor i32 %shr.i.i.iter58, %shr1.i.i.iter58, !dbg !193
  %xor2.i.i.iter58 = xor i32 %466, %mul.i.i.iter58, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter58, !dbg !199

for.body.i.iter58:                                ; preds = %for.body.i.iter58, %for.body6.iter58
  %i.0.i1.iter58 = phi i32 [ 0, %for.body6.iter58 ], [ %inc.i.iter58, %for.body.i.iter58 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.iter58, i32 %i.0.i1.iter58, !dbg !200
  %467 = load i64, ptr %arrayidx.i.iter58, align 8, !dbg !200
  %and.i.iter58 = and i64 %467, 1229782938247303441, !dbg !203
  %and1.i.iter58 = and i32 %xor2.i.i.iter58, 255, !dbg !204
  %conv.i.iter58 = zext nneg i32 %and1.i.iter58 to i64, !dbg !205
  %mul.i.iter58 = mul i64 %and.i.iter58, %conv.i.iter58, !dbg !206
  %shr.i.iter58 = lshr i64 %467, 1, !dbg !207
  %and3.i.iter58 = and i64 %shr.i.iter58, 1229782938247303441, !dbg !208
  %shr4.i.iter58 = lshr i32 %xor2.i.i.iter58, 8, !dbg !209
  %and5.i.iter58 = and i32 %shr4.i.iter58, 15, !dbg !210
  %conv6.i.iter58 = zext nneg i32 %and5.i.iter58 to i64, !dbg !211
  %mul7.i.iter58 = mul nuw i64 %and3.i.iter58, %conv6.i.iter58, !dbg !212
  %xor.i.iter58 = xor i64 %mul.i.iter58, %mul7.i.iter58, !dbg !213
  %arrayidx8.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.iter58, i32 %i.0.i1.iter58, !dbg !214
  %468 = load i64, ptr %arrayidx8.i.iter58, align 8, !dbg !214
  %shr9.i.iter58 = lshr i64 %468, 2, !dbg !215
  %and10.i.iter58 = and i64 %shr9.i.iter58, 1229782938247303441, !dbg !216
  %shr11.i.iter58 = lshr i32 %xor2.i.i.iter58, 16, !dbg !217
  %and12.i.iter58 = and i32 %shr11.i.iter58, 15, !dbg !218
  %conv13.i.iter58 = zext nneg i32 %and12.i.iter58 to i64, !dbg !219
  %mul14.i.iter58 = mul nuw i64 %and10.i.iter58, %conv13.i.iter58, !dbg !220
  %xor15.i.iter58 = xor i64 %xor.i.iter58, %mul14.i.iter58, !dbg !221
  %arrayidx16.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr.iter58, i32 %i.0.i1.iter58, !dbg !222
  %469 = load i64, ptr %arrayidx16.i.iter58, align 8, !dbg !222
  %shr17.i.iter58 = lshr i64 %469, 3, !dbg !223
  %and18.i.iter58 = and i64 %shr17.i.iter58, 1229782938247303441, !dbg !224
  %shr19.i.iter58 = lshr i32 %xor2.i.i.iter58, 24, !dbg !225
  %and20.i.iter58 = and i32 %shr19.i.iter58, 15, !dbg !226
  %conv21.i.iter58 = zext nneg i32 %and20.i.iter58 to i64, !dbg !227
  %mul22.i.iter58 = mul nuw i64 %and18.i.iter58, %conv21.i.iter58, !dbg !228
  %xor23.i.iter58 = xor i64 %xor15.i.iter58, %mul22.i.iter58, !dbg !229
  %arrayidx24.i.iter58 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter58, i32 %i.0.i1.iter58, !dbg !230
  %470 = load i64, ptr %arrayidx24.i.iter58, align 8, !dbg !231
  %xor25.i.iter58 = xor i64 %470, %xor23.i.iter58, !dbg !231
  store i64 %xor25.i.iter58, ptr %arrayidx24.i.iter58, align 8, !dbg !231
  %inc.i.iter58 = add nuw nsw i32 %i.0.i1.iter58, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter58 = icmp eq i32 %inc.i.iter58, 5, !dbg !233
  br i1 %exitcond.i.not.iter58, label %m_vec_mul_add.exit.iter58, label %for.body.i.iter58, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter58:                        ; preds = %for.body.i.iter58
  %add13.iter58 = add nuw nsw i32 %k.02.iter58, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter58 = icmp eq i32 %add13.iter58, 10, !dbg !238
  br i1 %exitcond.not.iter58, label %for.inc15.iter58, label %for.body6.iter58, !dbg !239, !llvm.loop !240

for.inc15.iter58:                                 ; preds = %m_vec_mul_add.exit.iter58
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter58 = add i32 %bs_mat_entries_used.14.iter58, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter58 = add nuw nsw i32 %c.05.iter58, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter58 = icmp eq i32 %add14.iter58, %463, !dbg !244
  br i1 %exitcond1.not.iter58, label %for.cond1.for.inc17_crit_edge.iter58, label %for.cond4.preheader.iter58, !dbg !155, !llvm.loop !245

for.inc17.iter58:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter58
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_58_end

for.cond4.preheader.iter58:                       ; preds = %for.cond4.preheader.lr.ph.iter58, %for.inc15.iter58
  %c.05.iter58 = phi i32 [ 58, %for.cond4.preheader.lr.ph.iter58 ], [ %inc.iter58, %for.inc15.iter58 ]
  %bs_mat_entries_used.14.iter58 = phi i32 [ %split.iter57, %for.cond4.preheader.lr.ph.iter58 ], [ %add14.iter58, %for.inc15.iter58 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter58, !dbg !239

for.cond4.preheader.lr.ph.iter58:                 ; preds = %for.cond1.preheader.iter58
  br label %for.cond4.preheader.iter58, !dbg !155

for.cond1.for.inc17_crit_edge.iter58:             ; preds = %for.inc15.iter58
  %split.iter58 = phi i32 [ %add14.iter58, %for.inc15.iter58 ]
  br label %for.inc17.iter58, !dbg !155

iter_58_end:                                      ; preds = %for.inc17.iter58
  br label %iter_59_start

iter_59_start:                                    ; preds = %iter_58_end
  br label %for.cond1.preheader.iter59

for.cond1.preheader.iter59:                       ; preds = %iter_59_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %471 = add i32 %split.iter58, 19, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter59, !dbg !155

for.body6.iter59:                                 ; preds = %for.cond4.preheader.iter59, %m_vec_mul_add.exit.iter59
  %k.02.iter59 = phi i32 [ 0, %for.cond4.preheader.iter59 ], [ %add13.iter59, %m_vec_mul_add.exit.iter59 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter59 = mul nsw i32 %bs_mat_entries_used.14.iter59, 40, !dbg !161
  %add.ptr.iter59 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter59, !dbg !161
  %mul8.iter59 = mul nuw nsw i32 %k.02.iter59, 78, !dbg !164
  %472 = getelementptr i8, ptr %mat, i32 %mul8.iter59, !dbg !165
  %arrayidx.iter59 = getelementptr i8, ptr %472, i32 %c.05.iter59, !dbg !165
  %473 = load i8, ptr %arrayidx.iter59, align 1, !dbg !165
  %add10.iter59 = add nuw nsw i32 590, %k.02.iter59, !dbg !166
  %add.ptr12.idx.iter59 = mul nuw nsw i32 %add10.iter59, 40, !dbg !167
  %add.ptr12.iter59 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter59, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter59 = zext i8 %473 to i32, !dbg !185
  %mul.i.i.iter59 = mul i32 %conv.i.i.iter59, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter59 = and i32 %mul.i.i.iter59, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter59 = lshr exact i32 %and.i.i.iter59, 4, !dbg !191
  %shr1.i.i.iter59 = lshr exact i32 %and.i.i.iter59, 3, !dbg !192
  %474 = xor i32 %shr.i.i.iter59, %shr1.i.i.iter59, !dbg !193
  %xor2.i.i.iter59 = xor i32 %474, %mul.i.i.iter59, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter59, !dbg !199

for.body.i.iter59:                                ; preds = %for.body.i.iter59, %for.body6.iter59
  %i.0.i1.iter59 = phi i32 [ 0, %for.body6.iter59 ], [ %inc.i.iter59, %for.body.i.iter59 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.iter59, i32 %i.0.i1.iter59, !dbg !200
  %475 = load i64, ptr %arrayidx.i.iter59, align 8, !dbg !200
  %and.i.iter59 = and i64 %475, 1229782938247303441, !dbg !203
  %and1.i.iter59 = and i32 %xor2.i.i.iter59, 255, !dbg !204
  %conv.i.iter59 = zext nneg i32 %and1.i.iter59 to i64, !dbg !205
  %mul.i.iter59 = mul i64 %and.i.iter59, %conv.i.iter59, !dbg !206
  %shr.i.iter59 = lshr i64 %475, 1, !dbg !207
  %and3.i.iter59 = and i64 %shr.i.iter59, 1229782938247303441, !dbg !208
  %shr4.i.iter59 = lshr i32 %xor2.i.i.iter59, 8, !dbg !209
  %and5.i.iter59 = and i32 %shr4.i.iter59, 15, !dbg !210
  %conv6.i.iter59 = zext nneg i32 %and5.i.iter59 to i64, !dbg !211
  %mul7.i.iter59 = mul nuw i64 %and3.i.iter59, %conv6.i.iter59, !dbg !212
  %xor.i.iter59 = xor i64 %mul.i.iter59, %mul7.i.iter59, !dbg !213
  %arrayidx8.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.iter59, i32 %i.0.i1.iter59, !dbg !214
  %476 = load i64, ptr %arrayidx8.i.iter59, align 8, !dbg !214
  %shr9.i.iter59 = lshr i64 %476, 2, !dbg !215
  %and10.i.iter59 = and i64 %shr9.i.iter59, 1229782938247303441, !dbg !216
  %shr11.i.iter59 = lshr i32 %xor2.i.i.iter59, 16, !dbg !217
  %and12.i.iter59 = and i32 %shr11.i.iter59, 15, !dbg !218
  %conv13.i.iter59 = zext nneg i32 %and12.i.iter59 to i64, !dbg !219
  %mul14.i.iter59 = mul nuw i64 %and10.i.iter59, %conv13.i.iter59, !dbg !220
  %xor15.i.iter59 = xor i64 %xor.i.iter59, %mul14.i.iter59, !dbg !221
  %arrayidx16.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr.iter59, i32 %i.0.i1.iter59, !dbg !222
  %477 = load i64, ptr %arrayidx16.i.iter59, align 8, !dbg !222
  %shr17.i.iter59 = lshr i64 %477, 3, !dbg !223
  %and18.i.iter59 = and i64 %shr17.i.iter59, 1229782938247303441, !dbg !224
  %shr19.i.iter59 = lshr i32 %xor2.i.i.iter59, 24, !dbg !225
  %and20.i.iter59 = and i32 %shr19.i.iter59, 15, !dbg !226
  %conv21.i.iter59 = zext nneg i32 %and20.i.iter59 to i64, !dbg !227
  %mul22.i.iter59 = mul nuw i64 %and18.i.iter59, %conv21.i.iter59, !dbg !228
  %xor23.i.iter59 = xor i64 %xor15.i.iter59, %mul22.i.iter59, !dbg !229
  %arrayidx24.i.iter59 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter59, i32 %i.0.i1.iter59, !dbg !230
  %478 = load i64, ptr %arrayidx24.i.iter59, align 8, !dbg !231
  %xor25.i.iter59 = xor i64 %478, %xor23.i.iter59, !dbg !231
  store i64 %xor25.i.iter59, ptr %arrayidx24.i.iter59, align 8, !dbg !231
  %inc.i.iter59 = add nuw nsw i32 %i.0.i1.iter59, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter59 = icmp eq i32 %inc.i.iter59, 5, !dbg !233
  br i1 %exitcond.i.not.iter59, label %m_vec_mul_add.exit.iter59, label %for.body.i.iter59, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter59:                        ; preds = %for.body.i.iter59
  %add13.iter59 = add nuw nsw i32 %k.02.iter59, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter59 = icmp eq i32 %add13.iter59, 10, !dbg !238
  br i1 %exitcond.not.iter59, label %for.inc15.iter59, label %for.body6.iter59, !dbg !239, !llvm.loop !240

for.inc15.iter59:                                 ; preds = %m_vec_mul_add.exit.iter59
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter59 = add i32 %bs_mat_entries_used.14.iter59, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter59 = add nuw nsw i32 %c.05.iter59, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter59 = icmp eq i32 %add14.iter59, %471, !dbg !244
  br i1 %exitcond1.not.iter59, label %for.cond1.for.inc17_crit_edge.iter59, label %for.cond4.preheader.iter59, !dbg !155, !llvm.loop !245

for.inc17.iter59:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter59
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_59_end

for.cond4.preheader.iter59:                       ; preds = %for.cond4.preheader.lr.ph.iter59, %for.inc15.iter59
  %c.05.iter59 = phi i32 [ 59, %for.cond4.preheader.lr.ph.iter59 ], [ %inc.iter59, %for.inc15.iter59 ]
  %bs_mat_entries_used.14.iter59 = phi i32 [ %split.iter58, %for.cond4.preheader.lr.ph.iter59 ], [ %add14.iter59, %for.inc15.iter59 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter59, !dbg !239

for.cond4.preheader.lr.ph.iter59:                 ; preds = %for.cond1.preheader.iter59
  br label %for.cond4.preheader.iter59, !dbg !155

for.cond1.for.inc17_crit_edge.iter59:             ; preds = %for.inc15.iter59
  %split.iter59 = phi i32 [ %add14.iter59, %for.inc15.iter59 ]
  br label %for.inc17.iter59, !dbg !155

iter_59_end:                                      ; preds = %for.inc17.iter59
  br label %iter_60_start

iter_60_start:                                    ; preds = %iter_59_end
  br label %for.cond1.preheader.iter60

for.cond1.preheader.iter60:                       ; preds = %iter_60_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %479 = add i32 %split.iter59, 18, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter60, !dbg !155

for.body6.iter60:                                 ; preds = %for.cond4.preheader.iter60, %m_vec_mul_add.exit.iter60
  %k.02.iter60 = phi i32 [ 0, %for.cond4.preheader.iter60 ], [ %add13.iter60, %m_vec_mul_add.exit.iter60 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter60 = mul nsw i32 %bs_mat_entries_used.14.iter60, 40, !dbg !161
  %add.ptr.iter60 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter60, !dbg !161
  %mul8.iter60 = mul nuw nsw i32 %k.02.iter60, 78, !dbg !164
  %480 = getelementptr i8, ptr %mat, i32 %mul8.iter60, !dbg !165
  %arrayidx.iter60 = getelementptr i8, ptr %480, i32 %c.05.iter60, !dbg !165
  %481 = load i8, ptr %arrayidx.iter60, align 1, !dbg !165
  %add10.iter60 = add nuw nsw i32 600, %k.02.iter60, !dbg !166
  %add.ptr12.idx.iter60 = mul nuw nsw i32 %add10.iter60, 40, !dbg !167
  %add.ptr12.iter60 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter60, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter60 = zext i8 %481 to i32, !dbg !185
  %mul.i.i.iter60 = mul i32 %conv.i.i.iter60, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter60 = and i32 %mul.i.i.iter60, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter60 = lshr exact i32 %and.i.i.iter60, 4, !dbg !191
  %shr1.i.i.iter60 = lshr exact i32 %and.i.i.iter60, 3, !dbg !192
  %482 = xor i32 %shr.i.i.iter60, %shr1.i.i.iter60, !dbg !193
  %xor2.i.i.iter60 = xor i32 %482, %mul.i.i.iter60, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter60, !dbg !199

for.body.i.iter60:                                ; preds = %for.body.i.iter60, %for.body6.iter60
  %i.0.i1.iter60 = phi i32 [ 0, %for.body6.iter60 ], [ %inc.i.iter60, %for.body.i.iter60 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.iter60, i32 %i.0.i1.iter60, !dbg !200
  %483 = load i64, ptr %arrayidx.i.iter60, align 8, !dbg !200
  %and.i.iter60 = and i64 %483, 1229782938247303441, !dbg !203
  %and1.i.iter60 = and i32 %xor2.i.i.iter60, 255, !dbg !204
  %conv.i.iter60 = zext nneg i32 %and1.i.iter60 to i64, !dbg !205
  %mul.i.iter60 = mul i64 %and.i.iter60, %conv.i.iter60, !dbg !206
  %shr.i.iter60 = lshr i64 %483, 1, !dbg !207
  %and3.i.iter60 = and i64 %shr.i.iter60, 1229782938247303441, !dbg !208
  %shr4.i.iter60 = lshr i32 %xor2.i.i.iter60, 8, !dbg !209
  %and5.i.iter60 = and i32 %shr4.i.iter60, 15, !dbg !210
  %conv6.i.iter60 = zext nneg i32 %and5.i.iter60 to i64, !dbg !211
  %mul7.i.iter60 = mul nuw i64 %and3.i.iter60, %conv6.i.iter60, !dbg !212
  %xor.i.iter60 = xor i64 %mul.i.iter60, %mul7.i.iter60, !dbg !213
  %arrayidx8.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.iter60, i32 %i.0.i1.iter60, !dbg !214
  %484 = load i64, ptr %arrayidx8.i.iter60, align 8, !dbg !214
  %shr9.i.iter60 = lshr i64 %484, 2, !dbg !215
  %and10.i.iter60 = and i64 %shr9.i.iter60, 1229782938247303441, !dbg !216
  %shr11.i.iter60 = lshr i32 %xor2.i.i.iter60, 16, !dbg !217
  %and12.i.iter60 = and i32 %shr11.i.iter60, 15, !dbg !218
  %conv13.i.iter60 = zext nneg i32 %and12.i.iter60 to i64, !dbg !219
  %mul14.i.iter60 = mul nuw i64 %and10.i.iter60, %conv13.i.iter60, !dbg !220
  %xor15.i.iter60 = xor i64 %xor.i.iter60, %mul14.i.iter60, !dbg !221
  %arrayidx16.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr.iter60, i32 %i.0.i1.iter60, !dbg !222
  %485 = load i64, ptr %arrayidx16.i.iter60, align 8, !dbg !222
  %shr17.i.iter60 = lshr i64 %485, 3, !dbg !223
  %and18.i.iter60 = and i64 %shr17.i.iter60, 1229782938247303441, !dbg !224
  %shr19.i.iter60 = lshr i32 %xor2.i.i.iter60, 24, !dbg !225
  %and20.i.iter60 = and i32 %shr19.i.iter60, 15, !dbg !226
  %conv21.i.iter60 = zext nneg i32 %and20.i.iter60 to i64, !dbg !227
  %mul22.i.iter60 = mul nuw i64 %and18.i.iter60, %conv21.i.iter60, !dbg !228
  %xor23.i.iter60 = xor i64 %xor15.i.iter60, %mul22.i.iter60, !dbg !229
  %arrayidx24.i.iter60 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter60, i32 %i.0.i1.iter60, !dbg !230
  %486 = load i64, ptr %arrayidx24.i.iter60, align 8, !dbg !231
  %xor25.i.iter60 = xor i64 %486, %xor23.i.iter60, !dbg !231
  store i64 %xor25.i.iter60, ptr %arrayidx24.i.iter60, align 8, !dbg !231
  %inc.i.iter60 = add nuw nsw i32 %i.0.i1.iter60, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter60 = icmp eq i32 %inc.i.iter60, 5, !dbg !233
  br i1 %exitcond.i.not.iter60, label %m_vec_mul_add.exit.iter60, label %for.body.i.iter60, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter60:                        ; preds = %for.body.i.iter60
  %add13.iter60 = add nuw nsw i32 %k.02.iter60, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter60 = icmp eq i32 %add13.iter60, 10, !dbg !238
  br i1 %exitcond.not.iter60, label %for.inc15.iter60, label %for.body6.iter60, !dbg !239, !llvm.loop !240

for.inc15.iter60:                                 ; preds = %m_vec_mul_add.exit.iter60
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter60 = add i32 %bs_mat_entries_used.14.iter60, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter60 = add nuw nsw i32 %c.05.iter60, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter60 = icmp eq i32 %add14.iter60, %479, !dbg !244
  br i1 %exitcond1.not.iter60, label %for.cond1.for.inc17_crit_edge.iter60, label %for.cond4.preheader.iter60, !dbg !155, !llvm.loop !245

for.inc17.iter60:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter60
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_60_end

for.cond4.preheader.iter60:                       ; preds = %for.cond4.preheader.lr.ph.iter60, %for.inc15.iter60
  %c.05.iter60 = phi i32 [ 60, %for.cond4.preheader.lr.ph.iter60 ], [ %inc.iter60, %for.inc15.iter60 ]
  %bs_mat_entries_used.14.iter60 = phi i32 [ %split.iter59, %for.cond4.preheader.lr.ph.iter60 ], [ %add14.iter60, %for.inc15.iter60 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter60, !dbg !239

for.cond4.preheader.lr.ph.iter60:                 ; preds = %for.cond1.preheader.iter60
  br label %for.cond4.preheader.iter60, !dbg !155

for.cond1.for.inc17_crit_edge.iter60:             ; preds = %for.inc15.iter60
  %split.iter60 = phi i32 [ %add14.iter60, %for.inc15.iter60 ]
  br label %for.inc17.iter60, !dbg !155

iter_60_end:                                      ; preds = %for.inc17.iter60
  br label %iter_61_start

iter_61_start:                                    ; preds = %iter_60_end
  br label %for.cond1.preheader.iter61

for.cond1.preheader.iter61:                       ; preds = %iter_61_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %487 = add i32 %split.iter60, 17, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter61, !dbg !155

for.body6.iter61:                                 ; preds = %for.cond4.preheader.iter61, %m_vec_mul_add.exit.iter61
  %k.02.iter61 = phi i32 [ 0, %for.cond4.preheader.iter61 ], [ %add13.iter61, %m_vec_mul_add.exit.iter61 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter61 = mul nsw i32 %bs_mat_entries_used.14.iter61, 40, !dbg !161
  %add.ptr.iter61 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter61, !dbg !161
  %mul8.iter61 = mul nuw nsw i32 %k.02.iter61, 78, !dbg !164
  %488 = getelementptr i8, ptr %mat, i32 %mul8.iter61, !dbg !165
  %arrayidx.iter61 = getelementptr i8, ptr %488, i32 %c.05.iter61, !dbg !165
  %489 = load i8, ptr %arrayidx.iter61, align 1, !dbg !165
  %add10.iter61 = add nuw nsw i32 610, %k.02.iter61, !dbg !166
  %add.ptr12.idx.iter61 = mul nuw nsw i32 %add10.iter61, 40, !dbg !167
  %add.ptr12.iter61 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter61, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter61 = zext i8 %489 to i32, !dbg !185
  %mul.i.i.iter61 = mul i32 %conv.i.i.iter61, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter61 = and i32 %mul.i.i.iter61, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter61 = lshr exact i32 %and.i.i.iter61, 4, !dbg !191
  %shr1.i.i.iter61 = lshr exact i32 %and.i.i.iter61, 3, !dbg !192
  %490 = xor i32 %shr.i.i.iter61, %shr1.i.i.iter61, !dbg !193
  %xor2.i.i.iter61 = xor i32 %490, %mul.i.i.iter61, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter61, !dbg !199

for.body.i.iter61:                                ; preds = %for.body.i.iter61, %for.body6.iter61
  %i.0.i1.iter61 = phi i32 [ 0, %for.body6.iter61 ], [ %inc.i.iter61, %for.body.i.iter61 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.iter61, i32 %i.0.i1.iter61, !dbg !200
  %491 = load i64, ptr %arrayidx.i.iter61, align 8, !dbg !200
  %and.i.iter61 = and i64 %491, 1229782938247303441, !dbg !203
  %and1.i.iter61 = and i32 %xor2.i.i.iter61, 255, !dbg !204
  %conv.i.iter61 = zext nneg i32 %and1.i.iter61 to i64, !dbg !205
  %mul.i.iter61 = mul i64 %and.i.iter61, %conv.i.iter61, !dbg !206
  %shr.i.iter61 = lshr i64 %491, 1, !dbg !207
  %and3.i.iter61 = and i64 %shr.i.iter61, 1229782938247303441, !dbg !208
  %shr4.i.iter61 = lshr i32 %xor2.i.i.iter61, 8, !dbg !209
  %and5.i.iter61 = and i32 %shr4.i.iter61, 15, !dbg !210
  %conv6.i.iter61 = zext nneg i32 %and5.i.iter61 to i64, !dbg !211
  %mul7.i.iter61 = mul nuw i64 %and3.i.iter61, %conv6.i.iter61, !dbg !212
  %xor.i.iter61 = xor i64 %mul.i.iter61, %mul7.i.iter61, !dbg !213
  %arrayidx8.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.iter61, i32 %i.0.i1.iter61, !dbg !214
  %492 = load i64, ptr %arrayidx8.i.iter61, align 8, !dbg !214
  %shr9.i.iter61 = lshr i64 %492, 2, !dbg !215
  %and10.i.iter61 = and i64 %shr9.i.iter61, 1229782938247303441, !dbg !216
  %shr11.i.iter61 = lshr i32 %xor2.i.i.iter61, 16, !dbg !217
  %and12.i.iter61 = and i32 %shr11.i.iter61, 15, !dbg !218
  %conv13.i.iter61 = zext nneg i32 %and12.i.iter61 to i64, !dbg !219
  %mul14.i.iter61 = mul nuw i64 %and10.i.iter61, %conv13.i.iter61, !dbg !220
  %xor15.i.iter61 = xor i64 %xor.i.iter61, %mul14.i.iter61, !dbg !221
  %arrayidx16.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr.iter61, i32 %i.0.i1.iter61, !dbg !222
  %493 = load i64, ptr %arrayidx16.i.iter61, align 8, !dbg !222
  %shr17.i.iter61 = lshr i64 %493, 3, !dbg !223
  %and18.i.iter61 = and i64 %shr17.i.iter61, 1229782938247303441, !dbg !224
  %shr19.i.iter61 = lshr i32 %xor2.i.i.iter61, 24, !dbg !225
  %and20.i.iter61 = and i32 %shr19.i.iter61, 15, !dbg !226
  %conv21.i.iter61 = zext nneg i32 %and20.i.iter61 to i64, !dbg !227
  %mul22.i.iter61 = mul nuw i64 %and18.i.iter61, %conv21.i.iter61, !dbg !228
  %xor23.i.iter61 = xor i64 %xor15.i.iter61, %mul22.i.iter61, !dbg !229
  %arrayidx24.i.iter61 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter61, i32 %i.0.i1.iter61, !dbg !230
  %494 = load i64, ptr %arrayidx24.i.iter61, align 8, !dbg !231
  %xor25.i.iter61 = xor i64 %494, %xor23.i.iter61, !dbg !231
  store i64 %xor25.i.iter61, ptr %arrayidx24.i.iter61, align 8, !dbg !231
  %inc.i.iter61 = add nuw nsw i32 %i.0.i1.iter61, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter61 = icmp eq i32 %inc.i.iter61, 5, !dbg !233
  br i1 %exitcond.i.not.iter61, label %m_vec_mul_add.exit.iter61, label %for.body.i.iter61, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter61:                        ; preds = %for.body.i.iter61
  %add13.iter61 = add nuw nsw i32 %k.02.iter61, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter61 = icmp eq i32 %add13.iter61, 10, !dbg !238
  br i1 %exitcond.not.iter61, label %for.inc15.iter61, label %for.body6.iter61, !dbg !239, !llvm.loop !240

for.inc15.iter61:                                 ; preds = %m_vec_mul_add.exit.iter61
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter61 = add i32 %bs_mat_entries_used.14.iter61, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter61 = add nuw nsw i32 %c.05.iter61, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter61 = icmp eq i32 %add14.iter61, %487, !dbg !244
  br i1 %exitcond1.not.iter61, label %for.cond1.for.inc17_crit_edge.iter61, label %for.cond4.preheader.iter61, !dbg !155, !llvm.loop !245

for.inc17.iter61:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter61
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_61_end

for.cond4.preheader.iter61:                       ; preds = %for.cond4.preheader.lr.ph.iter61, %for.inc15.iter61
  %c.05.iter61 = phi i32 [ 61, %for.cond4.preheader.lr.ph.iter61 ], [ %inc.iter61, %for.inc15.iter61 ]
  %bs_mat_entries_used.14.iter61 = phi i32 [ %split.iter60, %for.cond4.preheader.lr.ph.iter61 ], [ %add14.iter61, %for.inc15.iter61 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter61, !dbg !239

for.cond4.preheader.lr.ph.iter61:                 ; preds = %for.cond1.preheader.iter61
  br label %for.cond4.preheader.iter61, !dbg !155

for.cond1.for.inc17_crit_edge.iter61:             ; preds = %for.inc15.iter61
  %split.iter61 = phi i32 [ %add14.iter61, %for.inc15.iter61 ]
  br label %for.inc17.iter61, !dbg !155

iter_61_end:                                      ; preds = %for.inc17.iter61
  br label %iter_62_start

iter_62_start:                                    ; preds = %iter_61_end
  br label %for.cond1.preheader.iter62

for.cond1.preheader.iter62:                       ; preds = %iter_62_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %495 = add i32 %split.iter61, 16, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter62, !dbg !155

for.body6.iter62:                                 ; preds = %for.cond4.preheader.iter62, %m_vec_mul_add.exit.iter62
  %k.02.iter62 = phi i32 [ 0, %for.cond4.preheader.iter62 ], [ %add13.iter62, %m_vec_mul_add.exit.iter62 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter62 = mul nsw i32 %bs_mat_entries_used.14.iter62, 40, !dbg !161
  %add.ptr.iter62 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter62, !dbg !161
  %mul8.iter62 = mul nuw nsw i32 %k.02.iter62, 78, !dbg !164
  %496 = getelementptr i8, ptr %mat, i32 %mul8.iter62, !dbg !165
  %arrayidx.iter62 = getelementptr i8, ptr %496, i32 %c.05.iter62, !dbg !165
  %497 = load i8, ptr %arrayidx.iter62, align 1, !dbg !165
  %add10.iter62 = add nuw nsw i32 620, %k.02.iter62, !dbg !166
  %add.ptr12.idx.iter62 = mul nuw nsw i32 %add10.iter62, 40, !dbg !167
  %add.ptr12.iter62 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter62, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter62 = zext i8 %497 to i32, !dbg !185
  %mul.i.i.iter62 = mul i32 %conv.i.i.iter62, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter62 = and i32 %mul.i.i.iter62, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter62 = lshr exact i32 %and.i.i.iter62, 4, !dbg !191
  %shr1.i.i.iter62 = lshr exact i32 %and.i.i.iter62, 3, !dbg !192
  %498 = xor i32 %shr.i.i.iter62, %shr1.i.i.iter62, !dbg !193
  %xor2.i.i.iter62 = xor i32 %498, %mul.i.i.iter62, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter62, !dbg !199

for.body.i.iter62:                                ; preds = %for.body.i.iter62, %for.body6.iter62
  %i.0.i1.iter62 = phi i32 [ 0, %for.body6.iter62 ], [ %inc.i.iter62, %for.body.i.iter62 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.iter62, i32 %i.0.i1.iter62, !dbg !200
  %499 = load i64, ptr %arrayidx.i.iter62, align 8, !dbg !200
  %and.i.iter62 = and i64 %499, 1229782938247303441, !dbg !203
  %and1.i.iter62 = and i32 %xor2.i.i.iter62, 255, !dbg !204
  %conv.i.iter62 = zext nneg i32 %and1.i.iter62 to i64, !dbg !205
  %mul.i.iter62 = mul i64 %and.i.iter62, %conv.i.iter62, !dbg !206
  %shr.i.iter62 = lshr i64 %499, 1, !dbg !207
  %and3.i.iter62 = and i64 %shr.i.iter62, 1229782938247303441, !dbg !208
  %shr4.i.iter62 = lshr i32 %xor2.i.i.iter62, 8, !dbg !209
  %and5.i.iter62 = and i32 %shr4.i.iter62, 15, !dbg !210
  %conv6.i.iter62 = zext nneg i32 %and5.i.iter62 to i64, !dbg !211
  %mul7.i.iter62 = mul nuw i64 %and3.i.iter62, %conv6.i.iter62, !dbg !212
  %xor.i.iter62 = xor i64 %mul.i.iter62, %mul7.i.iter62, !dbg !213
  %arrayidx8.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.iter62, i32 %i.0.i1.iter62, !dbg !214
  %500 = load i64, ptr %arrayidx8.i.iter62, align 8, !dbg !214
  %shr9.i.iter62 = lshr i64 %500, 2, !dbg !215
  %and10.i.iter62 = and i64 %shr9.i.iter62, 1229782938247303441, !dbg !216
  %shr11.i.iter62 = lshr i32 %xor2.i.i.iter62, 16, !dbg !217
  %and12.i.iter62 = and i32 %shr11.i.iter62, 15, !dbg !218
  %conv13.i.iter62 = zext nneg i32 %and12.i.iter62 to i64, !dbg !219
  %mul14.i.iter62 = mul nuw i64 %and10.i.iter62, %conv13.i.iter62, !dbg !220
  %xor15.i.iter62 = xor i64 %xor.i.iter62, %mul14.i.iter62, !dbg !221
  %arrayidx16.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr.iter62, i32 %i.0.i1.iter62, !dbg !222
  %501 = load i64, ptr %arrayidx16.i.iter62, align 8, !dbg !222
  %shr17.i.iter62 = lshr i64 %501, 3, !dbg !223
  %and18.i.iter62 = and i64 %shr17.i.iter62, 1229782938247303441, !dbg !224
  %shr19.i.iter62 = lshr i32 %xor2.i.i.iter62, 24, !dbg !225
  %and20.i.iter62 = and i32 %shr19.i.iter62, 15, !dbg !226
  %conv21.i.iter62 = zext nneg i32 %and20.i.iter62 to i64, !dbg !227
  %mul22.i.iter62 = mul nuw i64 %and18.i.iter62, %conv21.i.iter62, !dbg !228
  %xor23.i.iter62 = xor i64 %xor15.i.iter62, %mul22.i.iter62, !dbg !229
  %arrayidx24.i.iter62 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter62, i32 %i.0.i1.iter62, !dbg !230
  %502 = load i64, ptr %arrayidx24.i.iter62, align 8, !dbg !231
  %xor25.i.iter62 = xor i64 %502, %xor23.i.iter62, !dbg !231
  store i64 %xor25.i.iter62, ptr %arrayidx24.i.iter62, align 8, !dbg !231
  %inc.i.iter62 = add nuw nsw i32 %i.0.i1.iter62, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter62 = icmp eq i32 %inc.i.iter62, 5, !dbg !233
  br i1 %exitcond.i.not.iter62, label %m_vec_mul_add.exit.iter62, label %for.body.i.iter62, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter62:                        ; preds = %for.body.i.iter62
  %add13.iter62 = add nuw nsw i32 %k.02.iter62, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter62 = icmp eq i32 %add13.iter62, 10, !dbg !238
  br i1 %exitcond.not.iter62, label %for.inc15.iter62, label %for.body6.iter62, !dbg !239, !llvm.loop !240

for.inc15.iter62:                                 ; preds = %m_vec_mul_add.exit.iter62
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter62 = add i32 %bs_mat_entries_used.14.iter62, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter62 = add nuw nsw i32 %c.05.iter62, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter62 = icmp eq i32 %add14.iter62, %495, !dbg !244
  br i1 %exitcond1.not.iter62, label %for.cond1.for.inc17_crit_edge.iter62, label %for.cond4.preheader.iter62, !dbg !155, !llvm.loop !245

for.inc17.iter62:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter62
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_62_end

for.cond4.preheader.iter62:                       ; preds = %for.cond4.preheader.lr.ph.iter62, %for.inc15.iter62
  %c.05.iter62 = phi i32 [ 62, %for.cond4.preheader.lr.ph.iter62 ], [ %inc.iter62, %for.inc15.iter62 ]
  %bs_mat_entries_used.14.iter62 = phi i32 [ %split.iter61, %for.cond4.preheader.lr.ph.iter62 ], [ %add14.iter62, %for.inc15.iter62 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter62, !dbg !239

for.cond4.preheader.lr.ph.iter62:                 ; preds = %for.cond1.preheader.iter62
  br label %for.cond4.preheader.iter62, !dbg !155

for.cond1.for.inc17_crit_edge.iter62:             ; preds = %for.inc15.iter62
  %split.iter62 = phi i32 [ %add14.iter62, %for.inc15.iter62 ]
  br label %for.inc17.iter62, !dbg !155

iter_62_end:                                      ; preds = %for.inc17.iter62
  br label %iter_63_start

iter_63_start:                                    ; preds = %iter_62_end
  br label %for.cond1.preheader.iter63

for.cond1.preheader.iter63:                       ; preds = %iter_63_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %503 = add i32 %split.iter62, 15, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter63, !dbg !155

for.body6.iter63:                                 ; preds = %for.cond4.preheader.iter63, %m_vec_mul_add.exit.iter63
  %k.02.iter63 = phi i32 [ 0, %for.cond4.preheader.iter63 ], [ %add13.iter63, %m_vec_mul_add.exit.iter63 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter63 = mul nsw i32 %bs_mat_entries_used.14.iter63, 40, !dbg !161
  %add.ptr.iter63 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter63, !dbg !161
  %mul8.iter63 = mul nuw nsw i32 %k.02.iter63, 78, !dbg !164
  %504 = getelementptr i8, ptr %mat, i32 %mul8.iter63, !dbg !165
  %arrayidx.iter63 = getelementptr i8, ptr %504, i32 %c.05.iter63, !dbg !165
  %505 = load i8, ptr %arrayidx.iter63, align 1, !dbg !165
  %add10.iter63 = add nuw nsw i32 630, %k.02.iter63, !dbg !166
  %add.ptr12.idx.iter63 = mul nuw nsw i32 %add10.iter63, 40, !dbg !167
  %add.ptr12.iter63 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter63, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter63 = zext i8 %505 to i32, !dbg !185
  %mul.i.i.iter63 = mul i32 %conv.i.i.iter63, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter63 = and i32 %mul.i.i.iter63, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter63 = lshr exact i32 %and.i.i.iter63, 4, !dbg !191
  %shr1.i.i.iter63 = lshr exact i32 %and.i.i.iter63, 3, !dbg !192
  %506 = xor i32 %shr.i.i.iter63, %shr1.i.i.iter63, !dbg !193
  %xor2.i.i.iter63 = xor i32 %506, %mul.i.i.iter63, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter63, !dbg !199

for.body.i.iter63:                                ; preds = %for.body.i.iter63, %for.body6.iter63
  %i.0.i1.iter63 = phi i32 [ 0, %for.body6.iter63 ], [ %inc.i.iter63, %for.body.i.iter63 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.iter63, i32 %i.0.i1.iter63, !dbg !200
  %507 = load i64, ptr %arrayidx.i.iter63, align 8, !dbg !200
  %and.i.iter63 = and i64 %507, 1229782938247303441, !dbg !203
  %and1.i.iter63 = and i32 %xor2.i.i.iter63, 255, !dbg !204
  %conv.i.iter63 = zext nneg i32 %and1.i.iter63 to i64, !dbg !205
  %mul.i.iter63 = mul i64 %and.i.iter63, %conv.i.iter63, !dbg !206
  %shr.i.iter63 = lshr i64 %507, 1, !dbg !207
  %and3.i.iter63 = and i64 %shr.i.iter63, 1229782938247303441, !dbg !208
  %shr4.i.iter63 = lshr i32 %xor2.i.i.iter63, 8, !dbg !209
  %and5.i.iter63 = and i32 %shr4.i.iter63, 15, !dbg !210
  %conv6.i.iter63 = zext nneg i32 %and5.i.iter63 to i64, !dbg !211
  %mul7.i.iter63 = mul nuw i64 %and3.i.iter63, %conv6.i.iter63, !dbg !212
  %xor.i.iter63 = xor i64 %mul.i.iter63, %mul7.i.iter63, !dbg !213
  %arrayidx8.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.iter63, i32 %i.0.i1.iter63, !dbg !214
  %508 = load i64, ptr %arrayidx8.i.iter63, align 8, !dbg !214
  %shr9.i.iter63 = lshr i64 %508, 2, !dbg !215
  %and10.i.iter63 = and i64 %shr9.i.iter63, 1229782938247303441, !dbg !216
  %shr11.i.iter63 = lshr i32 %xor2.i.i.iter63, 16, !dbg !217
  %and12.i.iter63 = and i32 %shr11.i.iter63, 15, !dbg !218
  %conv13.i.iter63 = zext nneg i32 %and12.i.iter63 to i64, !dbg !219
  %mul14.i.iter63 = mul nuw i64 %and10.i.iter63, %conv13.i.iter63, !dbg !220
  %xor15.i.iter63 = xor i64 %xor.i.iter63, %mul14.i.iter63, !dbg !221
  %arrayidx16.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr.iter63, i32 %i.0.i1.iter63, !dbg !222
  %509 = load i64, ptr %arrayidx16.i.iter63, align 8, !dbg !222
  %shr17.i.iter63 = lshr i64 %509, 3, !dbg !223
  %and18.i.iter63 = and i64 %shr17.i.iter63, 1229782938247303441, !dbg !224
  %shr19.i.iter63 = lshr i32 %xor2.i.i.iter63, 24, !dbg !225
  %and20.i.iter63 = and i32 %shr19.i.iter63, 15, !dbg !226
  %conv21.i.iter63 = zext nneg i32 %and20.i.iter63 to i64, !dbg !227
  %mul22.i.iter63 = mul nuw i64 %and18.i.iter63, %conv21.i.iter63, !dbg !228
  %xor23.i.iter63 = xor i64 %xor15.i.iter63, %mul22.i.iter63, !dbg !229
  %arrayidx24.i.iter63 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter63, i32 %i.0.i1.iter63, !dbg !230
  %510 = load i64, ptr %arrayidx24.i.iter63, align 8, !dbg !231
  %xor25.i.iter63 = xor i64 %510, %xor23.i.iter63, !dbg !231
  store i64 %xor25.i.iter63, ptr %arrayidx24.i.iter63, align 8, !dbg !231
  %inc.i.iter63 = add nuw nsw i32 %i.0.i1.iter63, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter63 = icmp eq i32 %inc.i.iter63, 5, !dbg !233
  br i1 %exitcond.i.not.iter63, label %m_vec_mul_add.exit.iter63, label %for.body.i.iter63, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter63:                        ; preds = %for.body.i.iter63
  %add13.iter63 = add nuw nsw i32 %k.02.iter63, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter63 = icmp eq i32 %add13.iter63, 10, !dbg !238
  br i1 %exitcond.not.iter63, label %for.inc15.iter63, label %for.body6.iter63, !dbg !239, !llvm.loop !240

for.inc15.iter63:                                 ; preds = %m_vec_mul_add.exit.iter63
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter63 = add i32 %bs_mat_entries_used.14.iter63, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter63 = add nuw nsw i32 %c.05.iter63, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter63 = icmp eq i32 %add14.iter63, %503, !dbg !244
  br i1 %exitcond1.not.iter63, label %for.cond1.for.inc17_crit_edge.iter63, label %for.cond4.preheader.iter63, !dbg !155, !llvm.loop !245

for.inc17.iter63:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter63
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_63_end

for.cond4.preheader.iter63:                       ; preds = %for.cond4.preheader.lr.ph.iter63, %for.inc15.iter63
  %c.05.iter63 = phi i32 [ 63, %for.cond4.preheader.lr.ph.iter63 ], [ %inc.iter63, %for.inc15.iter63 ]
  %bs_mat_entries_used.14.iter63 = phi i32 [ %split.iter62, %for.cond4.preheader.lr.ph.iter63 ], [ %add14.iter63, %for.inc15.iter63 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter63, !dbg !239

for.cond4.preheader.lr.ph.iter63:                 ; preds = %for.cond1.preheader.iter63
  br label %for.cond4.preheader.iter63, !dbg !155

for.cond1.for.inc17_crit_edge.iter63:             ; preds = %for.inc15.iter63
  %split.iter63 = phi i32 [ %add14.iter63, %for.inc15.iter63 ]
  br label %for.inc17.iter63, !dbg !155

iter_63_end:                                      ; preds = %for.inc17.iter63
  br label %iter_64_start

iter_64_start:                                    ; preds = %iter_63_end
  br label %for.cond1.preheader.iter64

for.cond1.preheader.iter64:                       ; preds = %iter_64_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %511 = add i32 %split.iter63, 14, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter64, !dbg !155

for.body6.iter64:                                 ; preds = %for.cond4.preheader.iter64, %m_vec_mul_add.exit.iter64
  %k.02.iter64 = phi i32 [ 0, %for.cond4.preheader.iter64 ], [ %add13.iter64, %m_vec_mul_add.exit.iter64 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter64 = mul nsw i32 %bs_mat_entries_used.14.iter64, 40, !dbg !161
  %add.ptr.iter64 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter64, !dbg !161
  %mul8.iter64 = mul nuw nsw i32 %k.02.iter64, 78, !dbg !164
  %512 = getelementptr i8, ptr %mat, i32 %mul8.iter64, !dbg !165
  %arrayidx.iter64 = getelementptr i8, ptr %512, i32 %c.05.iter64, !dbg !165
  %513 = load i8, ptr %arrayidx.iter64, align 1, !dbg !165
  %add10.iter64 = add nuw nsw i32 640, %k.02.iter64, !dbg !166
  %add.ptr12.idx.iter64 = mul nuw nsw i32 %add10.iter64, 40, !dbg !167
  %add.ptr12.iter64 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter64, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter64 = zext i8 %513 to i32, !dbg !185
  %mul.i.i.iter64 = mul i32 %conv.i.i.iter64, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter64 = and i32 %mul.i.i.iter64, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter64 = lshr exact i32 %and.i.i.iter64, 4, !dbg !191
  %shr1.i.i.iter64 = lshr exact i32 %and.i.i.iter64, 3, !dbg !192
  %514 = xor i32 %shr.i.i.iter64, %shr1.i.i.iter64, !dbg !193
  %xor2.i.i.iter64 = xor i32 %514, %mul.i.i.iter64, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter64, !dbg !199

for.body.i.iter64:                                ; preds = %for.body.i.iter64, %for.body6.iter64
  %i.0.i1.iter64 = phi i32 [ 0, %for.body6.iter64 ], [ %inc.i.iter64, %for.body.i.iter64 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.iter64, i32 %i.0.i1.iter64, !dbg !200
  %515 = load i64, ptr %arrayidx.i.iter64, align 8, !dbg !200
  %and.i.iter64 = and i64 %515, 1229782938247303441, !dbg !203
  %and1.i.iter64 = and i32 %xor2.i.i.iter64, 255, !dbg !204
  %conv.i.iter64 = zext nneg i32 %and1.i.iter64 to i64, !dbg !205
  %mul.i.iter64 = mul i64 %and.i.iter64, %conv.i.iter64, !dbg !206
  %shr.i.iter64 = lshr i64 %515, 1, !dbg !207
  %and3.i.iter64 = and i64 %shr.i.iter64, 1229782938247303441, !dbg !208
  %shr4.i.iter64 = lshr i32 %xor2.i.i.iter64, 8, !dbg !209
  %and5.i.iter64 = and i32 %shr4.i.iter64, 15, !dbg !210
  %conv6.i.iter64 = zext nneg i32 %and5.i.iter64 to i64, !dbg !211
  %mul7.i.iter64 = mul nuw i64 %and3.i.iter64, %conv6.i.iter64, !dbg !212
  %xor.i.iter64 = xor i64 %mul.i.iter64, %mul7.i.iter64, !dbg !213
  %arrayidx8.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.iter64, i32 %i.0.i1.iter64, !dbg !214
  %516 = load i64, ptr %arrayidx8.i.iter64, align 8, !dbg !214
  %shr9.i.iter64 = lshr i64 %516, 2, !dbg !215
  %and10.i.iter64 = and i64 %shr9.i.iter64, 1229782938247303441, !dbg !216
  %shr11.i.iter64 = lshr i32 %xor2.i.i.iter64, 16, !dbg !217
  %and12.i.iter64 = and i32 %shr11.i.iter64, 15, !dbg !218
  %conv13.i.iter64 = zext nneg i32 %and12.i.iter64 to i64, !dbg !219
  %mul14.i.iter64 = mul nuw i64 %and10.i.iter64, %conv13.i.iter64, !dbg !220
  %xor15.i.iter64 = xor i64 %xor.i.iter64, %mul14.i.iter64, !dbg !221
  %arrayidx16.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr.iter64, i32 %i.0.i1.iter64, !dbg !222
  %517 = load i64, ptr %arrayidx16.i.iter64, align 8, !dbg !222
  %shr17.i.iter64 = lshr i64 %517, 3, !dbg !223
  %and18.i.iter64 = and i64 %shr17.i.iter64, 1229782938247303441, !dbg !224
  %shr19.i.iter64 = lshr i32 %xor2.i.i.iter64, 24, !dbg !225
  %and20.i.iter64 = and i32 %shr19.i.iter64, 15, !dbg !226
  %conv21.i.iter64 = zext nneg i32 %and20.i.iter64 to i64, !dbg !227
  %mul22.i.iter64 = mul nuw i64 %and18.i.iter64, %conv21.i.iter64, !dbg !228
  %xor23.i.iter64 = xor i64 %xor15.i.iter64, %mul22.i.iter64, !dbg !229
  %arrayidx24.i.iter64 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter64, i32 %i.0.i1.iter64, !dbg !230
  %518 = load i64, ptr %arrayidx24.i.iter64, align 8, !dbg !231
  %xor25.i.iter64 = xor i64 %518, %xor23.i.iter64, !dbg !231
  store i64 %xor25.i.iter64, ptr %arrayidx24.i.iter64, align 8, !dbg !231
  %inc.i.iter64 = add nuw nsw i32 %i.0.i1.iter64, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter64 = icmp eq i32 %inc.i.iter64, 5, !dbg !233
  br i1 %exitcond.i.not.iter64, label %m_vec_mul_add.exit.iter64, label %for.body.i.iter64, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter64:                        ; preds = %for.body.i.iter64
  %add13.iter64 = add nuw nsw i32 %k.02.iter64, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter64 = icmp eq i32 %add13.iter64, 10, !dbg !238
  br i1 %exitcond.not.iter64, label %for.inc15.iter64, label %for.body6.iter64, !dbg !239, !llvm.loop !240

for.inc15.iter64:                                 ; preds = %m_vec_mul_add.exit.iter64
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter64 = add i32 %bs_mat_entries_used.14.iter64, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter64 = add nuw nsw i32 %c.05.iter64, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter64 = icmp eq i32 %add14.iter64, %511, !dbg !244
  br i1 %exitcond1.not.iter64, label %for.cond1.for.inc17_crit_edge.iter64, label %for.cond4.preheader.iter64, !dbg !155, !llvm.loop !245

for.inc17.iter64:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter64
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_64_end

for.cond4.preheader.iter64:                       ; preds = %for.cond4.preheader.lr.ph.iter64, %for.inc15.iter64
  %c.05.iter64 = phi i32 [ 64, %for.cond4.preheader.lr.ph.iter64 ], [ %inc.iter64, %for.inc15.iter64 ]
  %bs_mat_entries_used.14.iter64 = phi i32 [ %split.iter63, %for.cond4.preheader.lr.ph.iter64 ], [ %add14.iter64, %for.inc15.iter64 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter64, !dbg !239

for.cond4.preheader.lr.ph.iter64:                 ; preds = %for.cond1.preheader.iter64
  br label %for.cond4.preheader.iter64, !dbg !155

for.cond1.for.inc17_crit_edge.iter64:             ; preds = %for.inc15.iter64
  %split.iter64 = phi i32 [ %add14.iter64, %for.inc15.iter64 ]
  br label %for.inc17.iter64, !dbg !155

iter_64_end:                                      ; preds = %for.inc17.iter64
  br label %iter_65_start

iter_65_start:                                    ; preds = %iter_64_end
  br label %for.cond1.preheader.iter65

for.cond1.preheader.iter65:                       ; preds = %iter_65_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %519 = add i32 %split.iter64, 13, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter65, !dbg !155

for.body6.iter65:                                 ; preds = %for.cond4.preheader.iter65, %m_vec_mul_add.exit.iter65
  %k.02.iter65 = phi i32 [ 0, %for.cond4.preheader.iter65 ], [ %add13.iter65, %m_vec_mul_add.exit.iter65 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter65 = mul nsw i32 %bs_mat_entries_used.14.iter65, 40, !dbg !161
  %add.ptr.iter65 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter65, !dbg !161
  %mul8.iter65 = mul nuw nsw i32 %k.02.iter65, 78, !dbg !164
  %520 = getelementptr i8, ptr %mat, i32 %mul8.iter65, !dbg !165
  %arrayidx.iter65 = getelementptr i8, ptr %520, i32 %c.05.iter65, !dbg !165
  %521 = load i8, ptr %arrayidx.iter65, align 1, !dbg !165
  %add10.iter65 = add nuw nsw i32 650, %k.02.iter65, !dbg !166
  %add.ptr12.idx.iter65 = mul nuw nsw i32 %add10.iter65, 40, !dbg !167
  %add.ptr12.iter65 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter65, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter65 = zext i8 %521 to i32, !dbg !185
  %mul.i.i.iter65 = mul i32 %conv.i.i.iter65, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter65 = and i32 %mul.i.i.iter65, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter65 = lshr exact i32 %and.i.i.iter65, 4, !dbg !191
  %shr1.i.i.iter65 = lshr exact i32 %and.i.i.iter65, 3, !dbg !192
  %522 = xor i32 %shr.i.i.iter65, %shr1.i.i.iter65, !dbg !193
  %xor2.i.i.iter65 = xor i32 %522, %mul.i.i.iter65, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter65, !dbg !199

for.body.i.iter65:                                ; preds = %for.body.i.iter65, %for.body6.iter65
  %i.0.i1.iter65 = phi i32 [ 0, %for.body6.iter65 ], [ %inc.i.iter65, %for.body.i.iter65 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.iter65, i32 %i.0.i1.iter65, !dbg !200
  %523 = load i64, ptr %arrayidx.i.iter65, align 8, !dbg !200
  %and.i.iter65 = and i64 %523, 1229782938247303441, !dbg !203
  %and1.i.iter65 = and i32 %xor2.i.i.iter65, 255, !dbg !204
  %conv.i.iter65 = zext nneg i32 %and1.i.iter65 to i64, !dbg !205
  %mul.i.iter65 = mul i64 %and.i.iter65, %conv.i.iter65, !dbg !206
  %shr.i.iter65 = lshr i64 %523, 1, !dbg !207
  %and3.i.iter65 = and i64 %shr.i.iter65, 1229782938247303441, !dbg !208
  %shr4.i.iter65 = lshr i32 %xor2.i.i.iter65, 8, !dbg !209
  %and5.i.iter65 = and i32 %shr4.i.iter65, 15, !dbg !210
  %conv6.i.iter65 = zext nneg i32 %and5.i.iter65 to i64, !dbg !211
  %mul7.i.iter65 = mul nuw i64 %and3.i.iter65, %conv6.i.iter65, !dbg !212
  %xor.i.iter65 = xor i64 %mul.i.iter65, %mul7.i.iter65, !dbg !213
  %arrayidx8.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.iter65, i32 %i.0.i1.iter65, !dbg !214
  %524 = load i64, ptr %arrayidx8.i.iter65, align 8, !dbg !214
  %shr9.i.iter65 = lshr i64 %524, 2, !dbg !215
  %and10.i.iter65 = and i64 %shr9.i.iter65, 1229782938247303441, !dbg !216
  %shr11.i.iter65 = lshr i32 %xor2.i.i.iter65, 16, !dbg !217
  %and12.i.iter65 = and i32 %shr11.i.iter65, 15, !dbg !218
  %conv13.i.iter65 = zext nneg i32 %and12.i.iter65 to i64, !dbg !219
  %mul14.i.iter65 = mul nuw i64 %and10.i.iter65, %conv13.i.iter65, !dbg !220
  %xor15.i.iter65 = xor i64 %xor.i.iter65, %mul14.i.iter65, !dbg !221
  %arrayidx16.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr.iter65, i32 %i.0.i1.iter65, !dbg !222
  %525 = load i64, ptr %arrayidx16.i.iter65, align 8, !dbg !222
  %shr17.i.iter65 = lshr i64 %525, 3, !dbg !223
  %and18.i.iter65 = and i64 %shr17.i.iter65, 1229782938247303441, !dbg !224
  %shr19.i.iter65 = lshr i32 %xor2.i.i.iter65, 24, !dbg !225
  %and20.i.iter65 = and i32 %shr19.i.iter65, 15, !dbg !226
  %conv21.i.iter65 = zext nneg i32 %and20.i.iter65 to i64, !dbg !227
  %mul22.i.iter65 = mul nuw i64 %and18.i.iter65, %conv21.i.iter65, !dbg !228
  %xor23.i.iter65 = xor i64 %xor15.i.iter65, %mul22.i.iter65, !dbg !229
  %arrayidx24.i.iter65 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter65, i32 %i.0.i1.iter65, !dbg !230
  %526 = load i64, ptr %arrayidx24.i.iter65, align 8, !dbg !231
  %xor25.i.iter65 = xor i64 %526, %xor23.i.iter65, !dbg !231
  store i64 %xor25.i.iter65, ptr %arrayidx24.i.iter65, align 8, !dbg !231
  %inc.i.iter65 = add nuw nsw i32 %i.0.i1.iter65, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter65 = icmp eq i32 %inc.i.iter65, 5, !dbg !233
  br i1 %exitcond.i.not.iter65, label %m_vec_mul_add.exit.iter65, label %for.body.i.iter65, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter65:                        ; preds = %for.body.i.iter65
  %add13.iter65 = add nuw nsw i32 %k.02.iter65, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter65 = icmp eq i32 %add13.iter65, 10, !dbg !238
  br i1 %exitcond.not.iter65, label %for.inc15.iter65, label %for.body6.iter65, !dbg !239, !llvm.loop !240

for.inc15.iter65:                                 ; preds = %m_vec_mul_add.exit.iter65
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter65 = add i32 %bs_mat_entries_used.14.iter65, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter65 = add nuw nsw i32 %c.05.iter65, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter65 = icmp eq i32 %add14.iter65, %519, !dbg !244
  br i1 %exitcond1.not.iter65, label %for.cond1.for.inc17_crit_edge.iter65, label %for.cond4.preheader.iter65, !dbg !155, !llvm.loop !245

for.inc17.iter65:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter65
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_65_end

for.cond4.preheader.iter65:                       ; preds = %for.cond4.preheader.lr.ph.iter65, %for.inc15.iter65
  %c.05.iter65 = phi i32 [ 65, %for.cond4.preheader.lr.ph.iter65 ], [ %inc.iter65, %for.inc15.iter65 ]
  %bs_mat_entries_used.14.iter65 = phi i32 [ %split.iter64, %for.cond4.preheader.lr.ph.iter65 ], [ %add14.iter65, %for.inc15.iter65 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter65, !dbg !239

for.cond4.preheader.lr.ph.iter65:                 ; preds = %for.cond1.preheader.iter65
  br label %for.cond4.preheader.iter65, !dbg !155

for.cond1.for.inc17_crit_edge.iter65:             ; preds = %for.inc15.iter65
  %split.iter65 = phi i32 [ %add14.iter65, %for.inc15.iter65 ]
  br label %for.inc17.iter65, !dbg !155

iter_65_end:                                      ; preds = %for.inc17.iter65
  br label %iter_66_start

iter_66_start:                                    ; preds = %iter_65_end
  br label %for.cond1.preheader.iter66

for.cond1.preheader.iter66:                       ; preds = %iter_66_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %527 = add i32 %split.iter65, 12, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter66, !dbg !155

for.body6.iter66:                                 ; preds = %for.cond4.preheader.iter66, %m_vec_mul_add.exit.iter66
  %k.02.iter66 = phi i32 [ 0, %for.cond4.preheader.iter66 ], [ %add13.iter66, %m_vec_mul_add.exit.iter66 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter66 = mul nsw i32 %bs_mat_entries_used.14.iter66, 40, !dbg !161
  %add.ptr.iter66 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter66, !dbg !161
  %mul8.iter66 = mul nuw nsw i32 %k.02.iter66, 78, !dbg !164
  %528 = getelementptr i8, ptr %mat, i32 %mul8.iter66, !dbg !165
  %arrayidx.iter66 = getelementptr i8, ptr %528, i32 %c.05.iter66, !dbg !165
  %529 = load i8, ptr %arrayidx.iter66, align 1, !dbg !165
  %add10.iter66 = add nuw nsw i32 660, %k.02.iter66, !dbg !166
  %add.ptr12.idx.iter66 = mul nuw nsw i32 %add10.iter66, 40, !dbg !167
  %add.ptr12.iter66 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter66, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter66 = zext i8 %529 to i32, !dbg !185
  %mul.i.i.iter66 = mul i32 %conv.i.i.iter66, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter66 = and i32 %mul.i.i.iter66, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter66 = lshr exact i32 %and.i.i.iter66, 4, !dbg !191
  %shr1.i.i.iter66 = lshr exact i32 %and.i.i.iter66, 3, !dbg !192
  %530 = xor i32 %shr.i.i.iter66, %shr1.i.i.iter66, !dbg !193
  %xor2.i.i.iter66 = xor i32 %530, %mul.i.i.iter66, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter66, !dbg !199

for.body.i.iter66:                                ; preds = %for.body.i.iter66, %for.body6.iter66
  %i.0.i1.iter66 = phi i32 [ 0, %for.body6.iter66 ], [ %inc.i.iter66, %for.body.i.iter66 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.iter66, i32 %i.0.i1.iter66, !dbg !200
  %531 = load i64, ptr %arrayidx.i.iter66, align 8, !dbg !200
  %and.i.iter66 = and i64 %531, 1229782938247303441, !dbg !203
  %and1.i.iter66 = and i32 %xor2.i.i.iter66, 255, !dbg !204
  %conv.i.iter66 = zext nneg i32 %and1.i.iter66 to i64, !dbg !205
  %mul.i.iter66 = mul i64 %and.i.iter66, %conv.i.iter66, !dbg !206
  %shr.i.iter66 = lshr i64 %531, 1, !dbg !207
  %and3.i.iter66 = and i64 %shr.i.iter66, 1229782938247303441, !dbg !208
  %shr4.i.iter66 = lshr i32 %xor2.i.i.iter66, 8, !dbg !209
  %and5.i.iter66 = and i32 %shr4.i.iter66, 15, !dbg !210
  %conv6.i.iter66 = zext nneg i32 %and5.i.iter66 to i64, !dbg !211
  %mul7.i.iter66 = mul nuw i64 %and3.i.iter66, %conv6.i.iter66, !dbg !212
  %xor.i.iter66 = xor i64 %mul.i.iter66, %mul7.i.iter66, !dbg !213
  %arrayidx8.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.iter66, i32 %i.0.i1.iter66, !dbg !214
  %532 = load i64, ptr %arrayidx8.i.iter66, align 8, !dbg !214
  %shr9.i.iter66 = lshr i64 %532, 2, !dbg !215
  %and10.i.iter66 = and i64 %shr9.i.iter66, 1229782938247303441, !dbg !216
  %shr11.i.iter66 = lshr i32 %xor2.i.i.iter66, 16, !dbg !217
  %and12.i.iter66 = and i32 %shr11.i.iter66, 15, !dbg !218
  %conv13.i.iter66 = zext nneg i32 %and12.i.iter66 to i64, !dbg !219
  %mul14.i.iter66 = mul nuw i64 %and10.i.iter66, %conv13.i.iter66, !dbg !220
  %xor15.i.iter66 = xor i64 %xor.i.iter66, %mul14.i.iter66, !dbg !221
  %arrayidx16.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr.iter66, i32 %i.0.i1.iter66, !dbg !222
  %533 = load i64, ptr %arrayidx16.i.iter66, align 8, !dbg !222
  %shr17.i.iter66 = lshr i64 %533, 3, !dbg !223
  %and18.i.iter66 = and i64 %shr17.i.iter66, 1229782938247303441, !dbg !224
  %shr19.i.iter66 = lshr i32 %xor2.i.i.iter66, 24, !dbg !225
  %and20.i.iter66 = and i32 %shr19.i.iter66, 15, !dbg !226
  %conv21.i.iter66 = zext nneg i32 %and20.i.iter66 to i64, !dbg !227
  %mul22.i.iter66 = mul nuw i64 %and18.i.iter66, %conv21.i.iter66, !dbg !228
  %xor23.i.iter66 = xor i64 %xor15.i.iter66, %mul22.i.iter66, !dbg !229
  %arrayidx24.i.iter66 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter66, i32 %i.0.i1.iter66, !dbg !230
  %534 = load i64, ptr %arrayidx24.i.iter66, align 8, !dbg !231
  %xor25.i.iter66 = xor i64 %534, %xor23.i.iter66, !dbg !231
  store i64 %xor25.i.iter66, ptr %arrayidx24.i.iter66, align 8, !dbg !231
  %inc.i.iter66 = add nuw nsw i32 %i.0.i1.iter66, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter66 = icmp eq i32 %inc.i.iter66, 5, !dbg !233
  br i1 %exitcond.i.not.iter66, label %m_vec_mul_add.exit.iter66, label %for.body.i.iter66, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter66:                        ; preds = %for.body.i.iter66
  %add13.iter66 = add nuw nsw i32 %k.02.iter66, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter66 = icmp eq i32 %add13.iter66, 10, !dbg !238
  br i1 %exitcond.not.iter66, label %for.inc15.iter66, label %for.body6.iter66, !dbg !239, !llvm.loop !240

for.inc15.iter66:                                 ; preds = %m_vec_mul_add.exit.iter66
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter66 = add i32 %bs_mat_entries_used.14.iter66, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter66 = add nuw nsw i32 %c.05.iter66, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter66 = icmp eq i32 %add14.iter66, %527, !dbg !244
  br i1 %exitcond1.not.iter66, label %for.cond1.for.inc17_crit_edge.iter66, label %for.cond4.preheader.iter66, !dbg !155, !llvm.loop !245

for.inc17.iter66:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter66
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_66_end

for.cond4.preheader.iter66:                       ; preds = %for.cond4.preheader.lr.ph.iter66, %for.inc15.iter66
  %c.05.iter66 = phi i32 [ 66, %for.cond4.preheader.lr.ph.iter66 ], [ %inc.iter66, %for.inc15.iter66 ]
  %bs_mat_entries_used.14.iter66 = phi i32 [ %split.iter65, %for.cond4.preheader.lr.ph.iter66 ], [ %add14.iter66, %for.inc15.iter66 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter66, !dbg !239

for.cond4.preheader.lr.ph.iter66:                 ; preds = %for.cond1.preheader.iter66
  br label %for.cond4.preheader.iter66, !dbg !155

for.cond1.for.inc17_crit_edge.iter66:             ; preds = %for.inc15.iter66
  %split.iter66 = phi i32 [ %add14.iter66, %for.inc15.iter66 ]
  br label %for.inc17.iter66, !dbg !155

iter_66_end:                                      ; preds = %for.inc17.iter66
  br label %iter_67_start

iter_67_start:                                    ; preds = %iter_66_end
  br label %for.cond1.preheader.iter67

for.cond1.preheader.iter67:                       ; preds = %iter_67_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %535 = add i32 %split.iter66, 11, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter67, !dbg !155

for.body6.iter67:                                 ; preds = %for.cond4.preheader.iter67, %m_vec_mul_add.exit.iter67
  %k.02.iter67 = phi i32 [ 0, %for.cond4.preheader.iter67 ], [ %add13.iter67, %m_vec_mul_add.exit.iter67 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter67 = mul nsw i32 %bs_mat_entries_used.14.iter67, 40, !dbg !161
  %add.ptr.iter67 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter67, !dbg !161
  %mul8.iter67 = mul nuw nsw i32 %k.02.iter67, 78, !dbg !164
  %536 = getelementptr i8, ptr %mat, i32 %mul8.iter67, !dbg !165
  %arrayidx.iter67 = getelementptr i8, ptr %536, i32 %c.05.iter67, !dbg !165
  %537 = load i8, ptr %arrayidx.iter67, align 1, !dbg !165
  %add10.iter67 = add nuw nsw i32 670, %k.02.iter67, !dbg !166
  %add.ptr12.idx.iter67 = mul nuw nsw i32 %add10.iter67, 40, !dbg !167
  %add.ptr12.iter67 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter67, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter67 = zext i8 %537 to i32, !dbg !185
  %mul.i.i.iter67 = mul i32 %conv.i.i.iter67, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter67 = and i32 %mul.i.i.iter67, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter67 = lshr exact i32 %and.i.i.iter67, 4, !dbg !191
  %shr1.i.i.iter67 = lshr exact i32 %and.i.i.iter67, 3, !dbg !192
  %538 = xor i32 %shr.i.i.iter67, %shr1.i.i.iter67, !dbg !193
  %xor2.i.i.iter67 = xor i32 %538, %mul.i.i.iter67, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter67, !dbg !199

for.body.i.iter67:                                ; preds = %for.body.i.iter67, %for.body6.iter67
  %i.0.i1.iter67 = phi i32 [ 0, %for.body6.iter67 ], [ %inc.i.iter67, %for.body.i.iter67 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.iter67, i32 %i.0.i1.iter67, !dbg !200
  %539 = load i64, ptr %arrayidx.i.iter67, align 8, !dbg !200
  %and.i.iter67 = and i64 %539, 1229782938247303441, !dbg !203
  %and1.i.iter67 = and i32 %xor2.i.i.iter67, 255, !dbg !204
  %conv.i.iter67 = zext nneg i32 %and1.i.iter67 to i64, !dbg !205
  %mul.i.iter67 = mul i64 %and.i.iter67, %conv.i.iter67, !dbg !206
  %shr.i.iter67 = lshr i64 %539, 1, !dbg !207
  %and3.i.iter67 = and i64 %shr.i.iter67, 1229782938247303441, !dbg !208
  %shr4.i.iter67 = lshr i32 %xor2.i.i.iter67, 8, !dbg !209
  %and5.i.iter67 = and i32 %shr4.i.iter67, 15, !dbg !210
  %conv6.i.iter67 = zext nneg i32 %and5.i.iter67 to i64, !dbg !211
  %mul7.i.iter67 = mul nuw i64 %and3.i.iter67, %conv6.i.iter67, !dbg !212
  %xor.i.iter67 = xor i64 %mul.i.iter67, %mul7.i.iter67, !dbg !213
  %arrayidx8.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.iter67, i32 %i.0.i1.iter67, !dbg !214
  %540 = load i64, ptr %arrayidx8.i.iter67, align 8, !dbg !214
  %shr9.i.iter67 = lshr i64 %540, 2, !dbg !215
  %and10.i.iter67 = and i64 %shr9.i.iter67, 1229782938247303441, !dbg !216
  %shr11.i.iter67 = lshr i32 %xor2.i.i.iter67, 16, !dbg !217
  %and12.i.iter67 = and i32 %shr11.i.iter67, 15, !dbg !218
  %conv13.i.iter67 = zext nneg i32 %and12.i.iter67 to i64, !dbg !219
  %mul14.i.iter67 = mul nuw i64 %and10.i.iter67, %conv13.i.iter67, !dbg !220
  %xor15.i.iter67 = xor i64 %xor.i.iter67, %mul14.i.iter67, !dbg !221
  %arrayidx16.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr.iter67, i32 %i.0.i1.iter67, !dbg !222
  %541 = load i64, ptr %arrayidx16.i.iter67, align 8, !dbg !222
  %shr17.i.iter67 = lshr i64 %541, 3, !dbg !223
  %and18.i.iter67 = and i64 %shr17.i.iter67, 1229782938247303441, !dbg !224
  %shr19.i.iter67 = lshr i32 %xor2.i.i.iter67, 24, !dbg !225
  %and20.i.iter67 = and i32 %shr19.i.iter67, 15, !dbg !226
  %conv21.i.iter67 = zext nneg i32 %and20.i.iter67 to i64, !dbg !227
  %mul22.i.iter67 = mul nuw i64 %and18.i.iter67, %conv21.i.iter67, !dbg !228
  %xor23.i.iter67 = xor i64 %xor15.i.iter67, %mul22.i.iter67, !dbg !229
  %arrayidx24.i.iter67 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter67, i32 %i.0.i1.iter67, !dbg !230
  %542 = load i64, ptr %arrayidx24.i.iter67, align 8, !dbg !231
  %xor25.i.iter67 = xor i64 %542, %xor23.i.iter67, !dbg !231
  store i64 %xor25.i.iter67, ptr %arrayidx24.i.iter67, align 8, !dbg !231
  %inc.i.iter67 = add nuw nsw i32 %i.0.i1.iter67, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter67 = icmp eq i32 %inc.i.iter67, 5, !dbg !233
  br i1 %exitcond.i.not.iter67, label %m_vec_mul_add.exit.iter67, label %for.body.i.iter67, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter67:                        ; preds = %for.body.i.iter67
  %add13.iter67 = add nuw nsw i32 %k.02.iter67, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter67 = icmp eq i32 %add13.iter67, 10, !dbg !238
  br i1 %exitcond.not.iter67, label %for.inc15.iter67, label %for.body6.iter67, !dbg !239, !llvm.loop !240

for.inc15.iter67:                                 ; preds = %m_vec_mul_add.exit.iter67
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter67 = add i32 %bs_mat_entries_used.14.iter67, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter67 = add nuw nsw i32 %c.05.iter67, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter67 = icmp eq i32 %add14.iter67, %535, !dbg !244
  br i1 %exitcond1.not.iter67, label %for.cond1.for.inc17_crit_edge.iter67, label %for.cond4.preheader.iter67, !dbg !155, !llvm.loop !245

for.inc17.iter67:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter67
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_67_end

for.cond4.preheader.iter67:                       ; preds = %for.cond4.preheader.lr.ph.iter67, %for.inc15.iter67
  %c.05.iter67 = phi i32 [ 67, %for.cond4.preheader.lr.ph.iter67 ], [ %inc.iter67, %for.inc15.iter67 ]
  %bs_mat_entries_used.14.iter67 = phi i32 [ %split.iter66, %for.cond4.preheader.lr.ph.iter67 ], [ %add14.iter67, %for.inc15.iter67 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter67, !dbg !239

for.cond4.preheader.lr.ph.iter67:                 ; preds = %for.cond1.preheader.iter67
  br label %for.cond4.preheader.iter67, !dbg !155

for.cond1.for.inc17_crit_edge.iter67:             ; preds = %for.inc15.iter67
  %split.iter67 = phi i32 [ %add14.iter67, %for.inc15.iter67 ]
  br label %for.inc17.iter67, !dbg !155

iter_67_end:                                      ; preds = %for.inc17.iter67
  br label %iter_68_start

iter_68_start:                                    ; preds = %iter_67_end
  br label %for.cond1.preheader.iter68

for.cond1.preheader.iter68:                       ; preds = %iter_68_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %543 = add i32 %split.iter67, 10, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter68, !dbg !155

for.body6.iter68:                                 ; preds = %for.cond4.preheader.iter68, %m_vec_mul_add.exit.iter68
  %k.02.iter68 = phi i32 [ 0, %for.cond4.preheader.iter68 ], [ %add13.iter68, %m_vec_mul_add.exit.iter68 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter68 = mul nsw i32 %bs_mat_entries_used.14.iter68, 40, !dbg !161
  %add.ptr.iter68 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter68, !dbg !161
  %mul8.iter68 = mul nuw nsw i32 %k.02.iter68, 78, !dbg !164
  %544 = getelementptr i8, ptr %mat, i32 %mul8.iter68, !dbg !165
  %arrayidx.iter68 = getelementptr i8, ptr %544, i32 %c.05.iter68, !dbg !165
  %545 = load i8, ptr %arrayidx.iter68, align 1, !dbg !165
  %add10.iter68 = add nuw nsw i32 680, %k.02.iter68, !dbg !166
  %add.ptr12.idx.iter68 = mul nuw nsw i32 %add10.iter68, 40, !dbg !167
  %add.ptr12.iter68 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter68, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter68 = zext i8 %545 to i32, !dbg !185
  %mul.i.i.iter68 = mul i32 %conv.i.i.iter68, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter68 = and i32 %mul.i.i.iter68, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter68 = lshr exact i32 %and.i.i.iter68, 4, !dbg !191
  %shr1.i.i.iter68 = lshr exact i32 %and.i.i.iter68, 3, !dbg !192
  %546 = xor i32 %shr.i.i.iter68, %shr1.i.i.iter68, !dbg !193
  %xor2.i.i.iter68 = xor i32 %546, %mul.i.i.iter68, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter68, !dbg !199

for.body.i.iter68:                                ; preds = %for.body.i.iter68, %for.body6.iter68
  %i.0.i1.iter68 = phi i32 [ 0, %for.body6.iter68 ], [ %inc.i.iter68, %for.body.i.iter68 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.iter68, i32 %i.0.i1.iter68, !dbg !200
  %547 = load i64, ptr %arrayidx.i.iter68, align 8, !dbg !200
  %and.i.iter68 = and i64 %547, 1229782938247303441, !dbg !203
  %and1.i.iter68 = and i32 %xor2.i.i.iter68, 255, !dbg !204
  %conv.i.iter68 = zext nneg i32 %and1.i.iter68 to i64, !dbg !205
  %mul.i.iter68 = mul i64 %and.i.iter68, %conv.i.iter68, !dbg !206
  %shr.i.iter68 = lshr i64 %547, 1, !dbg !207
  %and3.i.iter68 = and i64 %shr.i.iter68, 1229782938247303441, !dbg !208
  %shr4.i.iter68 = lshr i32 %xor2.i.i.iter68, 8, !dbg !209
  %and5.i.iter68 = and i32 %shr4.i.iter68, 15, !dbg !210
  %conv6.i.iter68 = zext nneg i32 %and5.i.iter68 to i64, !dbg !211
  %mul7.i.iter68 = mul nuw i64 %and3.i.iter68, %conv6.i.iter68, !dbg !212
  %xor.i.iter68 = xor i64 %mul.i.iter68, %mul7.i.iter68, !dbg !213
  %arrayidx8.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.iter68, i32 %i.0.i1.iter68, !dbg !214
  %548 = load i64, ptr %arrayidx8.i.iter68, align 8, !dbg !214
  %shr9.i.iter68 = lshr i64 %548, 2, !dbg !215
  %and10.i.iter68 = and i64 %shr9.i.iter68, 1229782938247303441, !dbg !216
  %shr11.i.iter68 = lshr i32 %xor2.i.i.iter68, 16, !dbg !217
  %and12.i.iter68 = and i32 %shr11.i.iter68, 15, !dbg !218
  %conv13.i.iter68 = zext nneg i32 %and12.i.iter68 to i64, !dbg !219
  %mul14.i.iter68 = mul nuw i64 %and10.i.iter68, %conv13.i.iter68, !dbg !220
  %xor15.i.iter68 = xor i64 %xor.i.iter68, %mul14.i.iter68, !dbg !221
  %arrayidx16.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr.iter68, i32 %i.0.i1.iter68, !dbg !222
  %549 = load i64, ptr %arrayidx16.i.iter68, align 8, !dbg !222
  %shr17.i.iter68 = lshr i64 %549, 3, !dbg !223
  %and18.i.iter68 = and i64 %shr17.i.iter68, 1229782938247303441, !dbg !224
  %shr19.i.iter68 = lshr i32 %xor2.i.i.iter68, 24, !dbg !225
  %and20.i.iter68 = and i32 %shr19.i.iter68, 15, !dbg !226
  %conv21.i.iter68 = zext nneg i32 %and20.i.iter68 to i64, !dbg !227
  %mul22.i.iter68 = mul nuw i64 %and18.i.iter68, %conv21.i.iter68, !dbg !228
  %xor23.i.iter68 = xor i64 %xor15.i.iter68, %mul22.i.iter68, !dbg !229
  %arrayidx24.i.iter68 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter68, i32 %i.0.i1.iter68, !dbg !230
  %550 = load i64, ptr %arrayidx24.i.iter68, align 8, !dbg !231
  %xor25.i.iter68 = xor i64 %550, %xor23.i.iter68, !dbg !231
  store i64 %xor25.i.iter68, ptr %arrayidx24.i.iter68, align 8, !dbg !231
  %inc.i.iter68 = add nuw nsw i32 %i.0.i1.iter68, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter68 = icmp eq i32 %inc.i.iter68, 5, !dbg !233
  br i1 %exitcond.i.not.iter68, label %m_vec_mul_add.exit.iter68, label %for.body.i.iter68, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter68:                        ; preds = %for.body.i.iter68
  %add13.iter68 = add nuw nsw i32 %k.02.iter68, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter68 = icmp eq i32 %add13.iter68, 10, !dbg !238
  br i1 %exitcond.not.iter68, label %for.inc15.iter68, label %for.body6.iter68, !dbg !239, !llvm.loop !240

for.inc15.iter68:                                 ; preds = %m_vec_mul_add.exit.iter68
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter68 = add i32 %bs_mat_entries_used.14.iter68, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter68 = add nuw nsw i32 %c.05.iter68, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter68 = icmp eq i32 %add14.iter68, %543, !dbg !244
  br i1 %exitcond1.not.iter68, label %for.cond1.for.inc17_crit_edge.iter68, label %for.cond4.preheader.iter68, !dbg !155, !llvm.loop !245

for.inc17.iter68:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter68
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_68_end

for.cond4.preheader.iter68:                       ; preds = %for.cond4.preheader.lr.ph.iter68, %for.inc15.iter68
  %c.05.iter68 = phi i32 [ 68, %for.cond4.preheader.lr.ph.iter68 ], [ %inc.iter68, %for.inc15.iter68 ]
  %bs_mat_entries_used.14.iter68 = phi i32 [ %split.iter67, %for.cond4.preheader.lr.ph.iter68 ], [ %add14.iter68, %for.inc15.iter68 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter68, !dbg !239

for.cond4.preheader.lr.ph.iter68:                 ; preds = %for.cond1.preheader.iter68
  br label %for.cond4.preheader.iter68, !dbg !155

for.cond1.for.inc17_crit_edge.iter68:             ; preds = %for.inc15.iter68
  %split.iter68 = phi i32 [ %add14.iter68, %for.inc15.iter68 ]
  br label %for.inc17.iter68, !dbg !155

iter_68_end:                                      ; preds = %for.inc17.iter68
  br label %iter_69_start

iter_69_start:                                    ; preds = %iter_68_end
  br label %for.cond1.preheader.iter69

for.cond1.preheader.iter69:                       ; preds = %iter_69_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %551 = add i32 %split.iter68, 9, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter69, !dbg !155

for.body6.iter69:                                 ; preds = %for.cond4.preheader.iter69, %m_vec_mul_add.exit.iter69
  %k.02.iter69 = phi i32 [ 0, %for.cond4.preheader.iter69 ], [ %add13.iter69, %m_vec_mul_add.exit.iter69 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter69 = mul nsw i32 %bs_mat_entries_used.14.iter69, 40, !dbg !161
  %add.ptr.iter69 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter69, !dbg !161
  %mul8.iter69 = mul nuw nsw i32 %k.02.iter69, 78, !dbg !164
  %552 = getelementptr i8, ptr %mat, i32 %mul8.iter69, !dbg !165
  %arrayidx.iter69 = getelementptr i8, ptr %552, i32 %c.05.iter69, !dbg !165
  %553 = load i8, ptr %arrayidx.iter69, align 1, !dbg !165
  %add10.iter69 = add nuw nsw i32 690, %k.02.iter69, !dbg !166
  %add.ptr12.idx.iter69 = mul nuw nsw i32 %add10.iter69, 40, !dbg !167
  %add.ptr12.iter69 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter69, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter69 = zext i8 %553 to i32, !dbg !185
  %mul.i.i.iter69 = mul i32 %conv.i.i.iter69, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter69 = and i32 %mul.i.i.iter69, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter69 = lshr exact i32 %and.i.i.iter69, 4, !dbg !191
  %shr1.i.i.iter69 = lshr exact i32 %and.i.i.iter69, 3, !dbg !192
  %554 = xor i32 %shr.i.i.iter69, %shr1.i.i.iter69, !dbg !193
  %xor2.i.i.iter69 = xor i32 %554, %mul.i.i.iter69, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter69, !dbg !199

for.body.i.iter69:                                ; preds = %for.body.i.iter69, %for.body6.iter69
  %i.0.i1.iter69 = phi i32 [ 0, %for.body6.iter69 ], [ %inc.i.iter69, %for.body.i.iter69 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.iter69, i32 %i.0.i1.iter69, !dbg !200
  %555 = load i64, ptr %arrayidx.i.iter69, align 8, !dbg !200
  %and.i.iter69 = and i64 %555, 1229782938247303441, !dbg !203
  %and1.i.iter69 = and i32 %xor2.i.i.iter69, 255, !dbg !204
  %conv.i.iter69 = zext nneg i32 %and1.i.iter69 to i64, !dbg !205
  %mul.i.iter69 = mul i64 %and.i.iter69, %conv.i.iter69, !dbg !206
  %shr.i.iter69 = lshr i64 %555, 1, !dbg !207
  %and3.i.iter69 = and i64 %shr.i.iter69, 1229782938247303441, !dbg !208
  %shr4.i.iter69 = lshr i32 %xor2.i.i.iter69, 8, !dbg !209
  %and5.i.iter69 = and i32 %shr4.i.iter69, 15, !dbg !210
  %conv6.i.iter69 = zext nneg i32 %and5.i.iter69 to i64, !dbg !211
  %mul7.i.iter69 = mul nuw i64 %and3.i.iter69, %conv6.i.iter69, !dbg !212
  %xor.i.iter69 = xor i64 %mul.i.iter69, %mul7.i.iter69, !dbg !213
  %arrayidx8.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.iter69, i32 %i.0.i1.iter69, !dbg !214
  %556 = load i64, ptr %arrayidx8.i.iter69, align 8, !dbg !214
  %shr9.i.iter69 = lshr i64 %556, 2, !dbg !215
  %and10.i.iter69 = and i64 %shr9.i.iter69, 1229782938247303441, !dbg !216
  %shr11.i.iter69 = lshr i32 %xor2.i.i.iter69, 16, !dbg !217
  %and12.i.iter69 = and i32 %shr11.i.iter69, 15, !dbg !218
  %conv13.i.iter69 = zext nneg i32 %and12.i.iter69 to i64, !dbg !219
  %mul14.i.iter69 = mul nuw i64 %and10.i.iter69, %conv13.i.iter69, !dbg !220
  %xor15.i.iter69 = xor i64 %xor.i.iter69, %mul14.i.iter69, !dbg !221
  %arrayidx16.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr.iter69, i32 %i.0.i1.iter69, !dbg !222
  %557 = load i64, ptr %arrayidx16.i.iter69, align 8, !dbg !222
  %shr17.i.iter69 = lshr i64 %557, 3, !dbg !223
  %and18.i.iter69 = and i64 %shr17.i.iter69, 1229782938247303441, !dbg !224
  %shr19.i.iter69 = lshr i32 %xor2.i.i.iter69, 24, !dbg !225
  %and20.i.iter69 = and i32 %shr19.i.iter69, 15, !dbg !226
  %conv21.i.iter69 = zext nneg i32 %and20.i.iter69 to i64, !dbg !227
  %mul22.i.iter69 = mul nuw i64 %and18.i.iter69, %conv21.i.iter69, !dbg !228
  %xor23.i.iter69 = xor i64 %xor15.i.iter69, %mul22.i.iter69, !dbg !229
  %arrayidx24.i.iter69 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter69, i32 %i.0.i1.iter69, !dbg !230
  %558 = load i64, ptr %arrayidx24.i.iter69, align 8, !dbg !231
  %xor25.i.iter69 = xor i64 %558, %xor23.i.iter69, !dbg !231
  store i64 %xor25.i.iter69, ptr %arrayidx24.i.iter69, align 8, !dbg !231
  %inc.i.iter69 = add nuw nsw i32 %i.0.i1.iter69, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter69 = icmp eq i32 %inc.i.iter69, 5, !dbg !233
  br i1 %exitcond.i.not.iter69, label %m_vec_mul_add.exit.iter69, label %for.body.i.iter69, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter69:                        ; preds = %for.body.i.iter69
  %add13.iter69 = add nuw nsw i32 %k.02.iter69, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter69 = icmp eq i32 %add13.iter69, 10, !dbg !238
  br i1 %exitcond.not.iter69, label %for.inc15.iter69, label %for.body6.iter69, !dbg !239, !llvm.loop !240

for.inc15.iter69:                                 ; preds = %m_vec_mul_add.exit.iter69
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter69 = add i32 %bs_mat_entries_used.14.iter69, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter69 = add nuw nsw i32 %c.05.iter69, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter69 = icmp eq i32 %add14.iter69, %551, !dbg !244
  br i1 %exitcond1.not.iter69, label %for.cond1.for.inc17_crit_edge.iter69, label %for.cond4.preheader.iter69, !dbg !155, !llvm.loop !245

for.inc17.iter69:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter69
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_69_end

for.cond4.preheader.iter69:                       ; preds = %for.cond4.preheader.lr.ph.iter69, %for.inc15.iter69
  %c.05.iter69 = phi i32 [ 69, %for.cond4.preheader.lr.ph.iter69 ], [ %inc.iter69, %for.inc15.iter69 ]
  %bs_mat_entries_used.14.iter69 = phi i32 [ %split.iter68, %for.cond4.preheader.lr.ph.iter69 ], [ %add14.iter69, %for.inc15.iter69 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter69, !dbg !239

for.cond4.preheader.lr.ph.iter69:                 ; preds = %for.cond1.preheader.iter69
  br label %for.cond4.preheader.iter69, !dbg !155

for.cond1.for.inc17_crit_edge.iter69:             ; preds = %for.inc15.iter69
  %split.iter69 = phi i32 [ %add14.iter69, %for.inc15.iter69 ]
  br label %for.inc17.iter69, !dbg !155

iter_69_end:                                      ; preds = %for.inc17.iter69
  br label %iter_70_start

iter_70_start:                                    ; preds = %iter_69_end
  br label %for.cond1.preheader.iter70

for.cond1.preheader.iter70:                       ; preds = %iter_70_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %559 = add i32 %split.iter69, 8, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter70, !dbg !155

for.body6.iter70:                                 ; preds = %for.cond4.preheader.iter70, %m_vec_mul_add.exit.iter70
  %k.02.iter70 = phi i32 [ 0, %for.cond4.preheader.iter70 ], [ %add13.iter70, %m_vec_mul_add.exit.iter70 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter70 = mul nsw i32 %bs_mat_entries_used.14.iter70, 40, !dbg !161
  %add.ptr.iter70 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter70, !dbg !161
  %mul8.iter70 = mul nuw nsw i32 %k.02.iter70, 78, !dbg !164
  %560 = getelementptr i8, ptr %mat, i32 %mul8.iter70, !dbg !165
  %arrayidx.iter70 = getelementptr i8, ptr %560, i32 %c.05.iter70, !dbg !165
  %561 = load i8, ptr %arrayidx.iter70, align 1, !dbg !165
  %add10.iter70 = add nuw nsw i32 700, %k.02.iter70, !dbg !166
  %add.ptr12.idx.iter70 = mul nuw nsw i32 %add10.iter70, 40, !dbg !167
  %add.ptr12.iter70 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter70, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter70 = zext i8 %561 to i32, !dbg !185
  %mul.i.i.iter70 = mul i32 %conv.i.i.iter70, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter70 = and i32 %mul.i.i.iter70, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter70 = lshr exact i32 %and.i.i.iter70, 4, !dbg !191
  %shr1.i.i.iter70 = lshr exact i32 %and.i.i.iter70, 3, !dbg !192
  %562 = xor i32 %shr.i.i.iter70, %shr1.i.i.iter70, !dbg !193
  %xor2.i.i.iter70 = xor i32 %562, %mul.i.i.iter70, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter70, !dbg !199

for.body.i.iter70:                                ; preds = %for.body.i.iter70, %for.body6.iter70
  %i.0.i1.iter70 = phi i32 [ 0, %for.body6.iter70 ], [ %inc.i.iter70, %for.body.i.iter70 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.iter70, i32 %i.0.i1.iter70, !dbg !200
  %563 = load i64, ptr %arrayidx.i.iter70, align 8, !dbg !200
  %and.i.iter70 = and i64 %563, 1229782938247303441, !dbg !203
  %and1.i.iter70 = and i32 %xor2.i.i.iter70, 255, !dbg !204
  %conv.i.iter70 = zext nneg i32 %and1.i.iter70 to i64, !dbg !205
  %mul.i.iter70 = mul i64 %and.i.iter70, %conv.i.iter70, !dbg !206
  %shr.i.iter70 = lshr i64 %563, 1, !dbg !207
  %and3.i.iter70 = and i64 %shr.i.iter70, 1229782938247303441, !dbg !208
  %shr4.i.iter70 = lshr i32 %xor2.i.i.iter70, 8, !dbg !209
  %and5.i.iter70 = and i32 %shr4.i.iter70, 15, !dbg !210
  %conv6.i.iter70 = zext nneg i32 %and5.i.iter70 to i64, !dbg !211
  %mul7.i.iter70 = mul nuw i64 %and3.i.iter70, %conv6.i.iter70, !dbg !212
  %xor.i.iter70 = xor i64 %mul.i.iter70, %mul7.i.iter70, !dbg !213
  %arrayidx8.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.iter70, i32 %i.0.i1.iter70, !dbg !214
  %564 = load i64, ptr %arrayidx8.i.iter70, align 8, !dbg !214
  %shr9.i.iter70 = lshr i64 %564, 2, !dbg !215
  %and10.i.iter70 = and i64 %shr9.i.iter70, 1229782938247303441, !dbg !216
  %shr11.i.iter70 = lshr i32 %xor2.i.i.iter70, 16, !dbg !217
  %and12.i.iter70 = and i32 %shr11.i.iter70, 15, !dbg !218
  %conv13.i.iter70 = zext nneg i32 %and12.i.iter70 to i64, !dbg !219
  %mul14.i.iter70 = mul nuw i64 %and10.i.iter70, %conv13.i.iter70, !dbg !220
  %xor15.i.iter70 = xor i64 %xor.i.iter70, %mul14.i.iter70, !dbg !221
  %arrayidx16.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr.iter70, i32 %i.0.i1.iter70, !dbg !222
  %565 = load i64, ptr %arrayidx16.i.iter70, align 8, !dbg !222
  %shr17.i.iter70 = lshr i64 %565, 3, !dbg !223
  %and18.i.iter70 = and i64 %shr17.i.iter70, 1229782938247303441, !dbg !224
  %shr19.i.iter70 = lshr i32 %xor2.i.i.iter70, 24, !dbg !225
  %and20.i.iter70 = and i32 %shr19.i.iter70, 15, !dbg !226
  %conv21.i.iter70 = zext nneg i32 %and20.i.iter70 to i64, !dbg !227
  %mul22.i.iter70 = mul nuw i64 %and18.i.iter70, %conv21.i.iter70, !dbg !228
  %xor23.i.iter70 = xor i64 %xor15.i.iter70, %mul22.i.iter70, !dbg !229
  %arrayidx24.i.iter70 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter70, i32 %i.0.i1.iter70, !dbg !230
  %566 = load i64, ptr %arrayidx24.i.iter70, align 8, !dbg !231
  %xor25.i.iter70 = xor i64 %566, %xor23.i.iter70, !dbg !231
  store i64 %xor25.i.iter70, ptr %arrayidx24.i.iter70, align 8, !dbg !231
  %inc.i.iter70 = add nuw nsw i32 %i.0.i1.iter70, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter70 = icmp eq i32 %inc.i.iter70, 5, !dbg !233
  br i1 %exitcond.i.not.iter70, label %m_vec_mul_add.exit.iter70, label %for.body.i.iter70, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter70:                        ; preds = %for.body.i.iter70
  %add13.iter70 = add nuw nsw i32 %k.02.iter70, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter70 = icmp eq i32 %add13.iter70, 10, !dbg !238
  br i1 %exitcond.not.iter70, label %for.inc15.iter70, label %for.body6.iter70, !dbg !239, !llvm.loop !240

for.inc15.iter70:                                 ; preds = %m_vec_mul_add.exit.iter70
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter70 = add i32 %bs_mat_entries_used.14.iter70, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter70 = add nuw nsw i32 %c.05.iter70, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter70 = icmp eq i32 %add14.iter70, %559, !dbg !244
  br i1 %exitcond1.not.iter70, label %for.cond1.for.inc17_crit_edge.iter70, label %for.cond4.preheader.iter70, !dbg !155, !llvm.loop !245

for.inc17.iter70:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter70
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_70_end

for.cond4.preheader.iter70:                       ; preds = %for.cond4.preheader.lr.ph.iter70, %for.inc15.iter70
  %c.05.iter70 = phi i32 [ 70, %for.cond4.preheader.lr.ph.iter70 ], [ %inc.iter70, %for.inc15.iter70 ]
  %bs_mat_entries_used.14.iter70 = phi i32 [ %split.iter69, %for.cond4.preheader.lr.ph.iter70 ], [ %add14.iter70, %for.inc15.iter70 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter70, !dbg !239

for.cond4.preheader.lr.ph.iter70:                 ; preds = %for.cond1.preheader.iter70
  br label %for.cond4.preheader.iter70, !dbg !155

for.cond1.for.inc17_crit_edge.iter70:             ; preds = %for.inc15.iter70
  %split.iter70 = phi i32 [ %add14.iter70, %for.inc15.iter70 ]
  br label %for.inc17.iter70, !dbg !155

iter_70_end:                                      ; preds = %for.inc17.iter70
  br label %iter_71_start

iter_71_start:                                    ; preds = %iter_70_end
  br label %for.cond1.preheader.iter71

for.cond1.preheader.iter71:                       ; preds = %iter_71_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %567 = add i32 %split.iter70, 7, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter71, !dbg !155

for.body6.iter71:                                 ; preds = %for.cond4.preheader.iter71, %m_vec_mul_add.exit.iter71
  %k.02.iter71 = phi i32 [ 0, %for.cond4.preheader.iter71 ], [ %add13.iter71, %m_vec_mul_add.exit.iter71 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter71 = mul nsw i32 %bs_mat_entries_used.14.iter71, 40, !dbg !161
  %add.ptr.iter71 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter71, !dbg !161
  %mul8.iter71 = mul nuw nsw i32 %k.02.iter71, 78, !dbg !164
  %568 = getelementptr i8, ptr %mat, i32 %mul8.iter71, !dbg !165
  %arrayidx.iter71 = getelementptr i8, ptr %568, i32 %c.05.iter71, !dbg !165
  %569 = load i8, ptr %arrayidx.iter71, align 1, !dbg !165
  %add10.iter71 = add nuw nsw i32 710, %k.02.iter71, !dbg !166
  %add.ptr12.idx.iter71 = mul nuw nsw i32 %add10.iter71, 40, !dbg !167
  %add.ptr12.iter71 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter71, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter71 = zext i8 %569 to i32, !dbg !185
  %mul.i.i.iter71 = mul i32 %conv.i.i.iter71, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter71 = and i32 %mul.i.i.iter71, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter71 = lshr exact i32 %and.i.i.iter71, 4, !dbg !191
  %shr1.i.i.iter71 = lshr exact i32 %and.i.i.iter71, 3, !dbg !192
  %570 = xor i32 %shr.i.i.iter71, %shr1.i.i.iter71, !dbg !193
  %xor2.i.i.iter71 = xor i32 %570, %mul.i.i.iter71, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter71, !dbg !199

for.body.i.iter71:                                ; preds = %for.body.i.iter71, %for.body6.iter71
  %i.0.i1.iter71 = phi i32 [ 0, %for.body6.iter71 ], [ %inc.i.iter71, %for.body.i.iter71 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.iter71, i32 %i.0.i1.iter71, !dbg !200
  %571 = load i64, ptr %arrayidx.i.iter71, align 8, !dbg !200
  %and.i.iter71 = and i64 %571, 1229782938247303441, !dbg !203
  %and1.i.iter71 = and i32 %xor2.i.i.iter71, 255, !dbg !204
  %conv.i.iter71 = zext nneg i32 %and1.i.iter71 to i64, !dbg !205
  %mul.i.iter71 = mul i64 %and.i.iter71, %conv.i.iter71, !dbg !206
  %shr.i.iter71 = lshr i64 %571, 1, !dbg !207
  %and3.i.iter71 = and i64 %shr.i.iter71, 1229782938247303441, !dbg !208
  %shr4.i.iter71 = lshr i32 %xor2.i.i.iter71, 8, !dbg !209
  %and5.i.iter71 = and i32 %shr4.i.iter71, 15, !dbg !210
  %conv6.i.iter71 = zext nneg i32 %and5.i.iter71 to i64, !dbg !211
  %mul7.i.iter71 = mul nuw i64 %and3.i.iter71, %conv6.i.iter71, !dbg !212
  %xor.i.iter71 = xor i64 %mul.i.iter71, %mul7.i.iter71, !dbg !213
  %arrayidx8.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.iter71, i32 %i.0.i1.iter71, !dbg !214
  %572 = load i64, ptr %arrayidx8.i.iter71, align 8, !dbg !214
  %shr9.i.iter71 = lshr i64 %572, 2, !dbg !215
  %and10.i.iter71 = and i64 %shr9.i.iter71, 1229782938247303441, !dbg !216
  %shr11.i.iter71 = lshr i32 %xor2.i.i.iter71, 16, !dbg !217
  %and12.i.iter71 = and i32 %shr11.i.iter71, 15, !dbg !218
  %conv13.i.iter71 = zext nneg i32 %and12.i.iter71 to i64, !dbg !219
  %mul14.i.iter71 = mul nuw i64 %and10.i.iter71, %conv13.i.iter71, !dbg !220
  %xor15.i.iter71 = xor i64 %xor.i.iter71, %mul14.i.iter71, !dbg !221
  %arrayidx16.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr.iter71, i32 %i.0.i1.iter71, !dbg !222
  %573 = load i64, ptr %arrayidx16.i.iter71, align 8, !dbg !222
  %shr17.i.iter71 = lshr i64 %573, 3, !dbg !223
  %and18.i.iter71 = and i64 %shr17.i.iter71, 1229782938247303441, !dbg !224
  %shr19.i.iter71 = lshr i32 %xor2.i.i.iter71, 24, !dbg !225
  %and20.i.iter71 = and i32 %shr19.i.iter71, 15, !dbg !226
  %conv21.i.iter71 = zext nneg i32 %and20.i.iter71 to i64, !dbg !227
  %mul22.i.iter71 = mul nuw i64 %and18.i.iter71, %conv21.i.iter71, !dbg !228
  %xor23.i.iter71 = xor i64 %xor15.i.iter71, %mul22.i.iter71, !dbg !229
  %arrayidx24.i.iter71 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter71, i32 %i.0.i1.iter71, !dbg !230
  %574 = load i64, ptr %arrayidx24.i.iter71, align 8, !dbg !231
  %xor25.i.iter71 = xor i64 %574, %xor23.i.iter71, !dbg !231
  store i64 %xor25.i.iter71, ptr %arrayidx24.i.iter71, align 8, !dbg !231
  %inc.i.iter71 = add nuw nsw i32 %i.0.i1.iter71, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter71 = icmp eq i32 %inc.i.iter71, 5, !dbg !233
  br i1 %exitcond.i.not.iter71, label %m_vec_mul_add.exit.iter71, label %for.body.i.iter71, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter71:                        ; preds = %for.body.i.iter71
  %add13.iter71 = add nuw nsw i32 %k.02.iter71, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter71 = icmp eq i32 %add13.iter71, 10, !dbg !238
  br i1 %exitcond.not.iter71, label %for.inc15.iter71, label %for.body6.iter71, !dbg !239, !llvm.loop !240

for.inc15.iter71:                                 ; preds = %m_vec_mul_add.exit.iter71
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter71 = add i32 %bs_mat_entries_used.14.iter71, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter71 = add nuw nsw i32 %c.05.iter71, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter71 = icmp eq i32 %add14.iter71, %567, !dbg !244
  br i1 %exitcond1.not.iter71, label %for.cond1.for.inc17_crit_edge.iter71, label %for.cond4.preheader.iter71, !dbg !155, !llvm.loop !245

for.inc17.iter71:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter71
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_71_end

for.cond4.preheader.iter71:                       ; preds = %for.cond4.preheader.lr.ph.iter71, %for.inc15.iter71
  %c.05.iter71 = phi i32 [ 71, %for.cond4.preheader.lr.ph.iter71 ], [ %inc.iter71, %for.inc15.iter71 ]
  %bs_mat_entries_used.14.iter71 = phi i32 [ %split.iter70, %for.cond4.preheader.lr.ph.iter71 ], [ %add14.iter71, %for.inc15.iter71 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter71, !dbg !239

for.cond4.preheader.lr.ph.iter71:                 ; preds = %for.cond1.preheader.iter71
  br label %for.cond4.preheader.iter71, !dbg !155

for.cond1.for.inc17_crit_edge.iter71:             ; preds = %for.inc15.iter71
  %split.iter71 = phi i32 [ %add14.iter71, %for.inc15.iter71 ]
  br label %for.inc17.iter71, !dbg !155

iter_71_end:                                      ; preds = %for.inc17.iter71
  br label %iter_72_start

iter_72_start:                                    ; preds = %iter_71_end
  br label %for.cond1.preheader.iter72

for.cond1.preheader.iter72:                       ; preds = %iter_72_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %575 = add i32 %split.iter71, 6, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter72, !dbg !155

for.body6.iter72:                                 ; preds = %for.cond4.preheader.iter72, %m_vec_mul_add.exit.iter72
  %k.02.iter72 = phi i32 [ 0, %for.cond4.preheader.iter72 ], [ %add13.iter72, %m_vec_mul_add.exit.iter72 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter72 = mul nsw i32 %bs_mat_entries_used.14.iter72, 40, !dbg !161
  %add.ptr.iter72 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter72, !dbg !161
  %mul8.iter72 = mul nuw nsw i32 %k.02.iter72, 78, !dbg !164
  %576 = getelementptr i8, ptr %mat, i32 %mul8.iter72, !dbg !165
  %arrayidx.iter72 = getelementptr i8, ptr %576, i32 %c.05.iter72, !dbg !165
  %577 = load i8, ptr %arrayidx.iter72, align 1, !dbg !165
  %add10.iter72 = add nuw nsw i32 720, %k.02.iter72, !dbg !166
  %add.ptr12.idx.iter72 = mul nuw nsw i32 %add10.iter72, 40, !dbg !167
  %add.ptr12.iter72 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter72, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter72 = zext i8 %577 to i32, !dbg !185
  %mul.i.i.iter72 = mul i32 %conv.i.i.iter72, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter72 = and i32 %mul.i.i.iter72, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter72 = lshr exact i32 %and.i.i.iter72, 4, !dbg !191
  %shr1.i.i.iter72 = lshr exact i32 %and.i.i.iter72, 3, !dbg !192
  %578 = xor i32 %shr.i.i.iter72, %shr1.i.i.iter72, !dbg !193
  %xor2.i.i.iter72 = xor i32 %578, %mul.i.i.iter72, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter72, !dbg !199

for.body.i.iter72:                                ; preds = %for.body.i.iter72, %for.body6.iter72
  %i.0.i1.iter72 = phi i32 [ 0, %for.body6.iter72 ], [ %inc.i.iter72, %for.body.i.iter72 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.iter72, i32 %i.0.i1.iter72, !dbg !200
  %579 = load i64, ptr %arrayidx.i.iter72, align 8, !dbg !200
  %and.i.iter72 = and i64 %579, 1229782938247303441, !dbg !203
  %and1.i.iter72 = and i32 %xor2.i.i.iter72, 255, !dbg !204
  %conv.i.iter72 = zext nneg i32 %and1.i.iter72 to i64, !dbg !205
  %mul.i.iter72 = mul i64 %and.i.iter72, %conv.i.iter72, !dbg !206
  %shr.i.iter72 = lshr i64 %579, 1, !dbg !207
  %and3.i.iter72 = and i64 %shr.i.iter72, 1229782938247303441, !dbg !208
  %shr4.i.iter72 = lshr i32 %xor2.i.i.iter72, 8, !dbg !209
  %and5.i.iter72 = and i32 %shr4.i.iter72, 15, !dbg !210
  %conv6.i.iter72 = zext nneg i32 %and5.i.iter72 to i64, !dbg !211
  %mul7.i.iter72 = mul nuw i64 %and3.i.iter72, %conv6.i.iter72, !dbg !212
  %xor.i.iter72 = xor i64 %mul.i.iter72, %mul7.i.iter72, !dbg !213
  %arrayidx8.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.iter72, i32 %i.0.i1.iter72, !dbg !214
  %580 = load i64, ptr %arrayidx8.i.iter72, align 8, !dbg !214
  %shr9.i.iter72 = lshr i64 %580, 2, !dbg !215
  %and10.i.iter72 = and i64 %shr9.i.iter72, 1229782938247303441, !dbg !216
  %shr11.i.iter72 = lshr i32 %xor2.i.i.iter72, 16, !dbg !217
  %and12.i.iter72 = and i32 %shr11.i.iter72, 15, !dbg !218
  %conv13.i.iter72 = zext nneg i32 %and12.i.iter72 to i64, !dbg !219
  %mul14.i.iter72 = mul nuw i64 %and10.i.iter72, %conv13.i.iter72, !dbg !220
  %xor15.i.iter72 = xor i64 %xor.i.iter72, %mul14.i.iter72, !dbg !221
  %arrayidx16.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr.iter72, i32 %i.0.i1.iter72, !dbg !222
  %581 = load i64, ptr %arrayidx16.i.iter72, align 8, !dbg !222
  %shr17.i.iter72 = lshr i64 %581, 3, !dbg !223
  %and18.i.iter72 = and i64 %shr17.i.iter72, 1229782938247303441, !dbg !224
  %shr19.i.iter72 = lshr i32 %xor2.i.i.iter72, 24, !dbg !225
  %and20.i.iter72 = and i32 %shr19.i.iter72, 15, !dbg !226
  %conv21.i.iter72 = zext nneg i32 %and20.i.iter72 to i64, !dbg !227
  %mul22.i.iter72 = mul nuw i64 %and18.i.iter72, %conv21.i.iter72, !dbg !228
  %xor23.i.iter72 = xor i64 %xor15.i.iter72, %mul22.i.iter72, !dbg !229
  %arrayidx24.i.iter72 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter72, i32 %i.0.i1.iter72, !dbg !230
  %582 = load i64, ptr %arrayidx24.i.iter72, align 8, !dbg !231
  %xor25.i.iter72 = xor i64 %582, %xor23.i.iter72, !dbg !231
  store i64 %xor25.i.iter72, ptr %arrayidx24.i.iter72, align 8, !dbg !231
  %inc.i.iter72 = add nuw nsw i32 %i.0.i1.iter72, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter72 = icmp eq i32 %inc.i.iter72, 5, !dbg !233
  br i1 %exitcond.i.not.iter72, label %m_vec_mul_add.exit.iter72, label %for.body.i.iter72, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter72:                        ; preds = %for.body.i.iter72
  %add13.iter72 = add nuw nsw i32 %k.02.iter72, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter72 = icmp eq i32 %add13.iter72, 10, !dbg !238
  br i1 %exitcond.not.iter72, label %for.inc15.iter72, label %for.body6.iter72, !dbg !239, !llvm.loop !240

for.inc15.iter72:                                 ; preds = %m_vec_mul_add.exit.iter72
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter72 = add i32 %bs_mat_entries_used.14.iter72, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter72 = add nuw nsw i32 %c.05.iter72, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter72 = icmp eq i32 %add14.iter72, %575, !dbg !244
  br i1 %exitcond1.not.iter72, label %for.cond1.for.inc17_crit_edge.iter72, label %for.cond4.preheader.iter72, !dbg !155, !llvm.loop !245

for.inc17.iter72:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter72
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_72_end

for.cond4.preheader.iter72:                       ; preds = %for.cond4.preheader.lr.ph.iter72, %for.inc15.iter72
  %c.05.iter72 = phi i32 [ 72, %for.cond4.preheader.lr.ph.iter72 ], [ %inc.iter72, %for.inc15.iter72 ]
  %bs_mat_entries_used.14.iter72 = phi i32 [ %split.iter71, %for.cond4.preheader.lr.ph.iter72 ], [ %add14.iter72, %for.inc15.iter72 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter72, !dbg !239

for.cond4.preheader.lr.ph.iter72:                 ; preds = %for.cond1.preheader.iter72
  br label %for.cond4.preheader.iter72, !dbg !155

for.cond1.for.inc17_crit_edge.iter72:             ; preds = %for.inc15.iter72
  %split.iter72 = phi i32 [ %add14.iter72, %for.inc15.iter72 ]
  br label %for.inc17.iter72, !dbg !155

iter_72_end:                                      ; preds = %for.inc17.iter72
  br label %iter_73_start

iter_73_start:                                    ; preds = %iter_72_end
  br label %for.cond1.preheader.iter73

for.cond1.preheader.iter73:                       ; preds = %iter_73_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %583 = add i32 %split.iter72, 5, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter73, !dbg !155

for.body6.iter73:                                 ; preds = %for.cond4.preheader.iter73, %m_vec_mul_add.exit.iter73
  %k.02.iter73 = phi i32 [ 0, %for.cond4.preheader.iter73 ], [ %add13.iter73, %m_vec_mul_add.exit.iter73 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter73 = mul nsw i32 %bs_mat_entries_used.14.iter73, 40, !dbg !161
  %add.ptr.iter73 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter73, !dbg !161
  %mul8.iter73 = mul nuw nsw i32 %k.02.iter73, 78, !dbg !164
  %584 = getelementptr i8, ptr %mat, i32 %mul8.iter73, !dbg !165
  %arrayidx.iter73 = getelementptr i8, ptr %584, i32 %c.05.iter73, !dbg !165
  %585 = load i8, ptr %arrayidx.iter73, align 1, !dbg !165
  %add10.iter73 = add nuw nsw i32 730, %k.02.iter73, !dbg !166
  %add.ptr12.idx.iter73 = mul nuw nsw i32 %add10.iter73, 40, !dbg !167
  %add.ptr12.iter73 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter73, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter73 = zext i8 %585 to i32, !dbg !185
  %mul.i.i.iter73 = mul i32 %conv.i.i.iter73, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter73 = and i32 %mul.i.i.iter73, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter73 = lshr exact i32 %and.i.i.iter73, 4, !dbg !191
  %shr1.i.i.iter73 = lshr exact i32 %and.i.i.iter73, 3, !dbg !192
  %586 = xor i32 %shr.i.i.iter73, %shr1.i.i.iter73, !dbg !193
  %xor2.i.i.iter73 = xor i32 %586, %mul.i.i.iter73, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter73, !dbg !199

for.body.i.iter73:                                ; preds = %for.body.i.iter73, %for.body6.iter73
  %i.0.i1.iter73 = phi i32 [ 0, %for.body6.iter73 ], [ %inc.i.iter73, %for.body.i.iter73 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.iter73, i32 %i.0.i1.iter73, !dbg !200
  %587 = load i64, ptr %arrayidx.i.iter73, align 8, !dbg !200
  %and.i.iter73 = and i64 %587, 1229782938247303441, !dbg !203
  %and1.i.iter73 = and i32 %xor2.i.i.iter73, 255, !dbg !204
  %conv.i.iter73 = zext nneg i32 %and1.i.iter73 to i64, !dbg !205
  %mul.i.iter73 = mul i64 %and.i.iter73, %conv.i.iter73, !dbg !206
  %shr.i.iter73 = lshr i64 %587, 1, !dbg !207
  %and3.i.iter73 = and i64 %shr.i.iter73, 1229782938247303441, !dbg !208
  %shr4.i.iter73 = lshr i32 %xor2.i.i.iter73, 8, !dbg !209
  %and5.i.iter73 = and i32 %shr4.i.iter73, 15, !dbg !210
  %conv6.i.iter73 = zext nneg i32 %and5.i.iter73 to i64, !dbg !211
  %mul7.i.iter73 = mul nuw i64 %and3.i.iter73, %conv6.i.iter73, !dbg !212
  %xor.i.iter73 = xor i64 %mul.i.iter73, %mul7.i.iter73, !dbg !213
  %arrayidx8.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.iter73, i32 %i.0.i1.iter73, !dbg !214
  %588 = load i64, ptr %arrayidx8.i.iter73, align 8, !dbg !214
  %shr9.i.iter73 = lshr i64 %588, 2, !dbg !215
  %and10.i.iter73 = and i64 %shr9.i.iter73, 1229782938247303441, !dbg !216
  %shr11.i.iter73 = lshr i32 %xor2.i.i.iter73, 16, !dbg !217
  %and12.i.iter73 = and i32 %shr11.i.iter73, 15, !dbg !218
  %conv13.i.iter73 = zext nneg i32 %and12.i.iter73 to i64, !dbg !219
  %mul14.i.iter73 = mul nuw i64 %and10.i.iter73, %conv13.i.iter73, !dbg !220
  %xor15.i.iter73 = xor i64 %xor.i.iter73, %mul14.i.iter73, !dbg !221
  %arrayidx16.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr.iter73, i32 %i.0.i1.iter73, !dbg !222
  %589 = load i64, ptr %arrayidx16.i.iter73, align 8, !dbg !222
  %shr17.i.iter73 = lshr i64 %589, 3, !dbg !223
  %and18.i.iter73 = and i64 %shr17.i.iter73, 1229782938247303441, !dbg !224
  %shr19.i.iter73 = lshr i32 %xor2.i.i.iter73, 24, !dbg !225
  %and20.i.iter73 = and i32 %shr19.i.iter73, 15, !dbg !226
  %conv21.i.iter73 = zext nneg i32 %and20.i.iter73 to i64, !dbg !227
  %mul22.i.iter73 = mul nuw i64 %and18.i.iter73, %conv21.i.iter73, !dbg !228
  %xor23.i.iter73 = xor i64 %xor15.i.iter73, %mul22.i.iter73, !dbg !229
  %arrayidx24.i.iter73 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter73, i32 %i.0.i1.iter73, !dbg !230
  %590 = load i64, ptr %arrayidx24.i.iter73, align 8, !dbg !231
  %xor25.i.iter73 = xor i64 %590, %xor23.i.iter73, !dbg !231
  store i64 %xor25.i.iter73, ptr %arrayidx24.i.iter73, align 8, !dbg !231
  %inc.i.iter73 = add nuw nsw i32 %i.0.i1.iter73, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter73 = icmp eq i32 %inc.i.iter73, 5, !dbg !233
  br i1 %exitcond.i.not.iter73, label %m_vec_mul_add.exit.iter73, label %for.body.i.iter73, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter73:                        ; preds = %for.body.i.iter73
  %add13.iter73 = add nuw nsw i32 %k.02.iter73, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter73 = icmp eq i32 %add13.iter73, 10, !dbg !238
  br i1 %exitcond.not.iter73, label %for.inc15.iter73, label %for.body6.iter73, !dbg !239, !llvm.loop !240

for.inc15.iter73:                                 ; preds = %m_vec_mul_add.exit.iter73
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter73 = add i32 %bs_mat_entries_used.14.iter73, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter73 = add nuw nsw i32 %c.05.iter73, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter73 = icmp eq i32 %add14.iter73, %583, !dbg !244
  br i1 %exitcond1.not.iter73, label %for.cond1.for.inc17_crit_edge.iter73, label %for.cond4.preheader.iter73, !dbg !155, !llvm.loop !245

for.inc17.iter73:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter73
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_73_end

for.cond4.preheader.iter73:                       ; preds = %for.cond4.preheader.lr.ph.iter73, %for.inc15.iter73
  %c.05.iter73 = phi i32 [ 73, %for.cond4.preheader.lr.ph.iter73 ], [ %inc.iter73, %for.inc15.iter73 ]
  %bs_mat_entries_used.14.iter73 = phi i32 [ %split.iter72, %for.cond4.preheader.lr.ph.iter73 ], [ %add14.iter73, %for.inc15.iter73 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter73, !dbg !239

for.cond4.preheader.lr.ph.iter73:                 ; preds = %for.cond1.preheader.iter73
  br label %for.cond4.preheader.iter73, !dbg !155

for.cond1.for.inc17_crit_edge.iter73:             ; preds = %for.inc15.iter73
  %split.iter73 = phi i32 [ %add14.iter73, %for.inc15.iter73 ]
  br label %for.inc17.iter73, !dbg !155

iter_73_end:                                      ; preds = %for.inc17.iter73
  br label %iter_74_start

iter_74_start:                                    ; preds = %iter_73_end
  br label %for.cond1.preheader.iter74

for.cond1.preheader.iter74:                       ; preds = %iter_74_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %591 = add i32 %split.iter73, 4, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter74, !dbg !155

for.body6.iter74:                                 ; preds = %for.cond4.preheader.iter74, %m_vec_mul_add.exit.iter74
  %k.02.iter74 = phi i32 [ 0, %for.cond4.preheader.iter74 ], [ %add13.iter74, %m_vec_mul_add.exit.iter74 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter74 = mul nsw i32 %bs_mat_entries_used.14.iter74, 40, !dbg !161
  %add.ptr.iter74 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter74, !dbg !161
  %mul8.iter74 = mul nuw nsw i32 %k.02.iter74, 78, !dbg !164
  %592 = getelementptr i8, ptr %mat, i32 %mul8.iter74, !dbg !165
  %arrayidx.iter74 = getelementptr i8, ptr %592, i32 %c.05.iter74, !dbg !165
  %593 = load i8, ptr %arrayidx.iter74, align 1, !dbg !165
  %add10.iter74 = add nuw nsw i32 740, %k.02.iter74, !dbg !166
  %add.ptr12.idx.iter74 = mul nuw nsw i32 %add10.iter74, 40, !dbg !167
  %add.ptr12.iter74 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter74, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter74 = zext i8 %593 to i32, !dbg !185
  %mul.i.i.iter74 = mul i32 %conv.i.i.iter74, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter74 = and i32 %mul.i.i.iter74, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter74 = lshr exact i32 %and.i.i.iter74, 4, !dbg !191
  %shr1.i.i.iter74 = lshr exact i32 %and.i.i.iter74, 3, !dbg !192
  %594 = xor i32 %shr.i.i.iter74, %shr1.i.i.iter74, !dbg !193
  %xor2.i.i.iter74 = xor i32 %594, %mul.i.i.iter74, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter74, !dbg !199

for.body.i.iter74:                                ; preds = %for.body.i.iter74, %for.body6.iter74
  %i.0.i1.iter74 = phi i32 [ 0, %for.body6.iter74 ], [ %inc.i.iter74, %for.body.i.iter74 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.iter74, i32 %i.0.i1.iter74, !dbg !200
  %595 = load i64, ptr %arrayidx.i.iter74, align 8, !dbg !200
  %and.i.iter74 = and i64 %595, 1229782938247303441, !dbg !203
  %and1.i.iter74 = and i32 %xor2.i.i.iter74, 255, !dbg !204
  %conv.i.iter74 = zext nneg i32 %and1.i.iter74 to i64, !dbg !205
  %mul.i.iter74 = mul i64 %and.i.iter74, %conv.i.iter74, !dbg !206
  %shr.i.iter74 = lshr i64 %595, 1, !dbg !207
  %and3.i.iter74 = and i64 %shr.i.iter74, 1229782938247303441, !dbg !208
  %shr4.i.iter74 = lshr i32 %xor2.i.i.iter74, 8, !dbg !209
  %and5.i.iter74 = and i32 %shr4.i.iter74, 15, !dbg !210
  %conv6.i.iter74 = zext nneg i32 %and5.i.iter74 to i64, !dbg !211
  %mul7.i.iter74 = mul nuw i64 %and3.i.iter74, %conv6.i.iter74, !dbg !212
  %xor.i.iter74 = xor i64 %mul.i.iter74, %mul7.i.iter74, !dbg !213
  %arrayidx8.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.iter74, i32 %i.0.i1.iter74, !dbg !214
  %596 = load i64, ptr %arrayidx8.i.iter74, align 8, !dbg !214
  %shr9.i.iter74 = lshr i64 %596, 2, !dbg !215
  %and10.i.iter74 = and i64 %shr9.i.iter74, 1229782938247303441, !dbg !216
  %shr11.i.iter74 = lshr i32 %xor2.i.i.iter74, 16, !dbg !217
  %and12.i.iter74 = and i32 %shr11.i.iter74, 15, !dbg !218
  %conv13.i.iter74 = zext nneg i32 %and12.i.iter74 to i64, !dbg !219
  %mul14.i.iter74 = mul nuw i64 %and10.i.iter74, %conv13.i.iter74, !dbg !220
  %xor15.i.iter74 = xor i64 %xor.i.iter74, %mul14.i.iter74, !dbg !221
  %arrayidx16.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr.iter74, i32 %i.0.i1.iter74, !dbg !222
  %597 = load i64, ptr %arrayidx16.i.iter74, align 8, !dbg !222
  %shr17.i.iter74 = lshr i64 %597, 3, !dbg !223
  %and18.i.iter74 = and i64 %shr17.i.iter74, 1229782938247303441, !dbg !224
  %shr19.i.iter74 = lshr i32 %xor2.i.i.iter74, 24, !dbg !225
  %and20.i.iter74 = and i32 %shr19.i.iter74, 15, !dbg !226
  %conv21.i.iter74 = zext nneg i32 %and20.i.iter74 to i64, !dbg !227
  %mul22.i.iter74 = mul nuw i64 %and18.i.iter74, %conv21.i.iter74, !dbg !228
  %xor23.i.iter74 = xor i64 %xor15.i.iter74, %mul22.i.iter74, !dbg !229
  %arrayidx24.i.iter74 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter74, i32 %i.0.i1.iter74, !dbg !230
  %598 = load i64, ptr %arrayidx24.i.iter74, align 8, !dbg !231
  %xor25.i.iter74 = xor i64 %598, %xor23.i.iter74, !dbg !231
  store i64 %xor25.i.iter74, ptr %arrayidx24.i.iter74, align 8, !dbg !231
  %inc.i.iter74 = add nuw nsw i32 %i.0.i1.iter74, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter74 = icmp eq i32 %inc.i.iter74, 5, !dbg !233
  br i1 %exitcond.i.not.iter74, label %m_vec_mul_add.exit.iter74, label %for.body.i.iter74, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter74:                        ; preds = %for.body.i.iter74
  %add13.iter74 = add nuw nsw i32 %k.02.iter74, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter74 = icmp eq i32 %add13.iter74, 10, !dbg !238
  br i1 %exitcond.not.iter74, label %for.inc15.iter74, label %for.body6.iter74, !dbg !239, !llvm.loop !240

for.inc15.iter74:                                 ; preds = %m_vec_mul_add.exit.iter74
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter74 = add i32 %bs_mat_entries_used.14.iter74, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter74 = add nuw nsw i32 %c.05.iter74, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter74 = icmp eq i32 %add14.iter74, %591, !dbg !244
  br i1 %exitcond1.not.iter74, label %for.cond1.for.inc17_crit_edge.iter74, label %for.cond4.preheader.iter74, !dbg !155, !llvm.loop !245

for.inc17.iter74:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter74
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_74_end

for.cond4.preheader.iter74:                       ; preds = %for.cond4.preheader.lr.ph.iter74, %for.inc15.iter74
  %c.05.iter74 = phi i32 [ 74, %for.cond4.preheader.lr.ph.iter74 ], [ %inc.iter74, %for.inc15.iter74 ]
  %bs_mat_entries_used.14.iter74 = phi i32 [ %split.iter73, %for.cond4.preheader.lr.ph.iter74 ], [ %add14.iter74, %for.inc15.iter74 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter74, !dbg !239

for.cond4.preheader.lr.ph.iter74:                 ; preds = %for.cond1.preheader.iter74
  br label %for.cond4.preheader.iter74, !dbg !155

for.cond1.for.inc17_crit_edge.iter74:             ; preds = %for.inc15.iter74
  %split.iter74 = phi i32 [ %add14.iter74, %for.inc15.iter74 ]
  br label %for.inc17.iter74, !dbg !155

iter_74_end:                                      ; preds = %for.inc17.iter74
  br label %iter_75_start

iter_75_start:                                    ; preds = %iter_74_end
  br label %for.cond1.preheader.iter75

for.cond1.preheader.iter75:                       ; preds = %iter_75_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %599 = add i32 %split.iter74, 3, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter75, !dbg !155

for.body6.iter75:                                 ; preds = %for.cond4.preheader.iter75, %m_vec_mul_add.exit.iter75
  %k.02.iter75 = phi i32 [ 0, %for.cond4.preheader.iter75 ], [ %add13.iter75, %m_vec_mul_add.exit.iter75 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter75 = mul nsw i32 %bs_mat_entries_used.14.iter75, 40, !dbg !161
  %add.ptr.iter75 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter75, !dbg !161
  %mul8.iter75 = mul nuw nsw i32 %k.02.iter75, 78, !dbg !164
  %600 = getelementptr i8, ptr %mat, i32 %mul8.iter75, !dbg !165
  %arrayidx.iter75 = getelementptr i8, ptr %600, i32 %c.05.iter75, !dbg !165
  %601 = load i8, ptr %arrayidx.iter75, align 1, !dbg !165
  %add10.iter75 = add nuw nsw i32 750, %k.02.iter75, !dbg !166
  %add.ptr12.idx.iter75 = mul nuw nsw i32 %add10.iter75, 40, !dbg !167
  %add.ptr12.iter75 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter75, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter75 = zext i8 %601 to i32, !dbg !185
  %mul.i.i.iter75 = mul i32 %conv.i.i.iter75, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter75 = and i32 %mul.i.i.iter75, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter75 = lshr exact i32 %and.i.i.iter75, 4, !dbg !191
  %shr1.i.i.iter75 = lshr exact i32 %and.i.i.iter75, 3, !dbg !192
  %602 = xor i32 %shr.i.i.iter75, %shr1.i.i.iter75, !dbg !193
  %xor2.i.i.iter75 = xor i32 %602, %mul.i.i.iter75, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter75, !dbg !199

for.body.i.iter75:                                ; preds = %for.body.i.iter75, %for.body6.iter75
  %i.0.i1.iter75 = phi i32 [ 0, %for.body6.iter75 ], [ %inc.i.iter75, %for.body.i.iter75 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.iter75, i32 %i.0.i1.iter75, !dbg !200
  %603 = load i64, ptr %arrayidx.i.iter75, align 8, !dbg !200
  %and.i.iter75 = and i64 %603, 1229782938247303441, !dbg !203
  %and1.i.iter75 = and i32 %xor2.i.i.iter75, 255, !dbg !204
  %conv.i.iter75 = zext nneg i32 %and1.i.iter75 to i64, !dbg !205
  %mul.i.iter75 = mul i64 %and.i.iter75, %conv.i.iter75, !dbg !206
  %shr.i.iter75 = lshr i64 %603, 1, !dbg !207
  %and3.i.iter75 = and i64 %shr.i.iter75, 1229782938247303441, !dbg !208
  %shr4.i.iter75 = lshr i32 %xor2.i.i.iter75, 8, !dbg !209
  %and5.i.iter75 = and i32 %shr4.i.iter75, 15, !dbg !210
  %conv6.i.iter75 = zext nneg i32 %and5.i.iter75 to i64, !dbg !211
  %mul7.i.iter75 = mul nuw i64 %and3.i.iter75, %conv6.i.iter75, !dbg !212
  %xor.i.iter75 = xor i64 %mul.i.iter75, %mul7.i.iter75, !dbg !213
  %arrayidx8.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.iter75, i32 %i.0.i1.iter75, !dbg !214
  %604 = load i64, ptr %arrayidx8.i.iter75, align 8, !dbg !214
  %shr9.i.iter75 = lshr i64 %604, 2, !dbg !215
  %and10.i.iter75 = and i64 %shr9.i.iter75, 1229782938247303441, !dbg !216
  %shr11.i.iter75 = lshr i32 %xor2.i.i.iter75, 16, !dbg !217
  %and12.i.iter75 = and i32 %shr11.i.iter75, 15, !dbg !218
  %conv13.i.iter75 = zext nneg i32 %and12.i.iter75 to i64, !dbg !219
  %mul14.i.iter75 = mul nuw i64 %and10.i.iter75, %conv13.i.iter75, !dbg !220
  %xor15.i.iter75 = xor i64 %xor.i.iter75, %mul14.i.iter75, !dbg !221
  %arrayidx16.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr.iter75, i32 %i.0.i1.iter75, !dbg !222
  %605 = load i64, ptr %arrayidx16.i.iter75, align 8, !dbg !222
  %shr17.i.iter75 = lshr i64 %605, 3, !dbg !223
  %and18.i.iter75 = and i64 %shr17.i.iter75, 1229782938247303441, !dbg !224
  %shr19.i.iter75 = lshr i32 %xor2.i.i.iter75, 24, !dbg !225
  %and20.i.iter75 = and i32 %shr19.i.iter75, 15, !dbg !226
  %conv21.i.iter75 = zext nneg i32 %and20.i.iter75 to i64, !dbg !227
  %mul22.i.iter75 = mul nuw i64 %and18.i.iter75, %conv21.i.iter75, !dbg !228
  %xor23.i.iter75 = xor i64 %xor15.i.iter75, %mul22.i.iter75, !dbg !229
  %arrayidx24.i.iter75 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter75, i32 %i.0.i1.iter75, !dbg !230
  %606 = load i64, ptr %arrayidx24.i.iter75, align 8, !dbg !231
  %xor25.i.iter75 = xor i64 %606, %xor23.i.iter75, !dbg !231
  store i64 %xor25.i.iter75, ptr %arrayidx24.i.iter75, align 8, !dbg !231
  %inc.i.iter75 = add nuw nsw i32 %i.0.i1.iter75, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter75 = icmp eq i32 %inc.i.iter75, 5, !dbg !233
  br i1 %exitcond.i.not.iter75, label %m_vec_mul_add.exit.iter75, label %for.body.i.iter75, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter75:                        ; preds = %for.body.i.iter75
  %add13.iter75 = add nuw nsw i32 %k.02.iter75, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter75 = icmp eq i32 %add13.iter75, 10, !dbg !238
  br i1 %exitcond.not.iter75, label %for.inc15.iter75, label %for.body6.iter75, !dbg !239, !llvm.loop !240

for.inc15.iter75:                                 ; preds = %m_vec_mul_add.exit.iter75
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter75 = add i32 %bs_mat_entries_used.14.iter75, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter75 = add nuw nsw i32 %c.05.iter75, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter75 = icmp eq i32 %add14.iter75, %599, !dbg !244
  br i1 %exitcond1.not.iter75, label %for.cond1.for.inc17_crit_edge.iter75, label %for.cond4.preheader.iter75, !dbg !155, !llvm.loop !245

for.inc17.iter75:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter75
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_75_end

for.cond4.preheader.iter75:                       ; preds = %for.cond4.preheader.lr.ph.iter75, %for.inc15.iter75
  %c.05.iter75 = phi i32 [ 75, %for.cond4.preheader.lr.ph.iter75 ], [ %inc.iter75, %for.inc15.iter75 ]
  %bs_mat_entries_used.14.iter75 = phi i32 [ %split.iter74, %for.cond4.preheader.lr.ph.iter75 ], [ %add14.iter75, %for.inc15.iter75 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter75, !dbg !239

for.cond4.preheader.lr.ph.iter75:                 ; preds = %for.cond1.preheader.iter75
  br label %for.cond4.preheader.iter75, !dbg !155

for.cond1.for.inc17_crit_edge.iter75:             ; preds = %for.inc15.iter75
  %split.iter75 = phi i32 [ %add14.iter75, %for.inc15.iter75 ]
  br label %for.inc17.iter75, !dbg !155

iter_75_end:                                      ; preds = %for.inc17.iter75
  br label %iter_76_start

iter_76_start:                                    ; preds = %iter_75_end
  br label %for.cond1.preheader.iter76

for.cond1.preheader.iter76:                       ; preds = %iter_76_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %607 = add i32 %split.iter75, 2, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter76, !dbg !155

for.body6.iter76:                                 ; preds = %for.cond4.preheader.iter76, %m_vec_mul_add.exit.iter76
  %k.02.iter76 = phi i32 [ 0, %for.cond4.preheader.iter76 ], [ %add13.iter76, %m_vec_mul_add.exit.iter76 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter76 = mul nsw i32 %bs_mat_entries_used.14.iter76, 40, !dbg !161
  %add.ptr.iter76 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter76, !dbg !161
  %mul8.iter76 = mul nuw nsw i32 %k.02.iter76, 78, !dbg !164
  %608 = getelementptr i8, ptr %mat, i32 %mul8.iter76, !dbg !165
  %arrayidx.iter76 = getelementptr i8, ptr %608, i32 %c.05.iter76, !dbg !165
  %609 = load i8, ptr %arrayidx.iter76, align 1, !dbg !165
  %add10.iter76 = add nuw nsw i32 760, %k.02.iter76, !dbg !166
  %add.ptr12.idx.iter76 = mul nuw nsw i32 %add10.iter76, 40, !dbg !167
  %add.ptr12.iter76 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter76, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter76 = zext i8 %609 to i32, !dbg !185
  %mul.i.i.iter76 = mul i32 %conv.i.i.iter76, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter76 = and i32 %mul.i.i.iter76, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter76 = lshr exact i32 %and.i.i.iter76, 4, !dbg !191
  %shr1.i.i.iter76 = lshr exact i32 %and.i.i.iter76, 3, !dbg !192
  %610 = xor i32 %shr.i.i.iter76, %shr1.i.i.iter76, !dbg !193
  %xor2.i.i.iter76 = xor i32 %610, %mul.i.i.iter76, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter76, !dbg !199

for.body.i.iter76:                                ; preds = %for.body.i.iter76, %for.body6.iter76
  %i.0.i1.iter76 = phi i32 [ 0, %for.body6.iter76 ], [ %inc.i.iter76, %for.body.i.iter76 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.iter76, i32 %i.0.i1.iter76, !dbg !200
  %611 = load i64, ptr %arrayidx.i.iter76, align 8, !dbg !200
  %and.i.iter76 = and i64 %611, 1229782938247303441, !dbg !203
  %and1.i.iter76 = and i32 %xor2.i.i.iter76, 255, !dbg !204
  %conv.i.iter76 = zext nneg i32 %and1.i.iter76 to i64, !dbg !205
  %mul.i.iter76 = mul i64 %and.i.iter76, %conv.i.iter76, !dbg !206
  %shr.i.iter76 = lshr i64 %611, 1, !dbg !207
  %and3.i.iter76 = and i64 %shr.i.iter76, 1229782938247303441, !dbg !208
  %shr4.i.iter76 = lshr i32 %xor2.i.i.iter76, 8, !dbg !209
  %and5.i.iter76 = and i32 %shr4.i.iter76, 15, !dbg !210
  %conv6.i.iter76 = zext nneg i32 %and5.i.iter76 to i64, !dbg !211
  %mul7.i.iter76 = mul nuw i64 %and3.i.iter76, %conv6.i.iter76, !dbg !212
  %xor.i.iter76 = xor i64 %mul.i.iter76, %mul7.i.iter76, !dbg !213
  %arrayidx8.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.iter76, i32 %i.0.i1.iter76, !dbg !214
  %612 = load i64, ptr %arrayidx8.i.iter76, align 8, !dbg !214
  %shr9.i.iter76 = lshr i64 %612, 2, !dbg !215
  %and10.i.iter76 = and i64 %shr9.i.iter76, 1229782938247303441, !dbg !216
  %shr11.i.iter76 = lshr i32 %xor2.i.i.iter76, 16, !dbg !217
  %and12.i.iter76 = and i32 %shr11.i.iter76, 15, !dbg !218
  %conv13.i.iter76 = zext nneg i32 %and12.i.iter76 to i64, !dbg !219
  %mul14.i.iter76 = mul nuw i64 %and10.i.iter76, %conv13.i.iter76, !dbg !220
  %xor15.i.iter76 = xor i64 %xor.i.iter76, %mul14.i.iter76, !dbg !221
  %arrayidx16.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr.iter76, i32 %i.0.i1.iter76, !dbg !222
  %613 = load i64, ptr %arrayidx16.i.iter76, align 8, !dbg !222
  %shr17.i.iter76 = lshr i64 %613, 3, !dbg !223
  %and18.i.iter76 = and i64 %shr17.i.iter76, 1229782938247303441, !dbg !224
  %shr19.i.iter76 = lshr i32 %xor2.i.i.iter76, 24, !dbg !225
  %and20.i.iter76 = and i32 %shr19.i.iter76, 15, !dbg !226
  %conv21.i.iter76 = zext nneg i32 %and20.i.iter76 to i64, !dbg !227
  %mul22.i.iter76 = mul nuw i64 %and18.i.iter76, %conv21.i.iter76, !dbg !228
  %xor23.i.iter76 = xor i64 %xor15.i.iter76, %mul22.i.iter76, !dbg !229
  %arrayidx24.i.iter76 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter76, i32 %i.0.i1.iter76, !dbg !230
  %614 = load i64, ptr %arrayidx24.i.iter76, align 8, !dbg !231
  %xor25.i.iter76 = xor i64 %614, %xor23.i.iter76, !dbg !231
  store i64 %xor25.i.iter76, ptr %arrayidx24.i.iter76, align 8, !dbg !231
  %inc.i.iter76 = add nuw nsw i32 %i.0.i1.iter76, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter76 = icmp eq i32 %inc.i.iter76, 5, !dbg !233
  br i1 %exitcond.i.not.iter76, label %m_vec_mul_add.exit.iter76, label %for.body.i.iter76, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter76:                        ; preds = %for.body.i.iter76
  %add13.iter76 = add nuw nsw i32 %k.02.iter76, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter76 = icmp eq i32 %add13.iter76, 10, !dbg !238
  br i1 %exitcond.not.iter76, label %for.inc15.iter76, label %for.body6.iter76, !dbg !239, !llvm.loop !240

for.inc15.iter76:                                 ; preds = %m_vec_mul_add.exit.iter76
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter76 = add i32 %bs_mat_entries_used.14.iter76, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter76 = add nuw nsw i32 %c.05.iter76, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter76 = icmp eq i32 %add14.iter76, %607, !dbg !244
  br i1 %exitcond1.not.iter76, label %for.cond1.for.inc17_crit_edge.iter76, label %for.cond4.preheader.iter76, !dbg !155, !llvm.loop !245

for.inc17.iter76:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter76
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_76_end

for.cond4.preheader.iter76:                       ; preds = %for.cond4.preheader.lr.ph.iter76, %for.inc15.iter76
  %c.05.iter76 = phi i32 [ 76, %for.cond4.preheader.lr.ph.iter76 ], [ %inc.iter76, %for.inc15.iter76 ]
  %bs_mat_entries_used.14.iter76 = phi i32 [ %split.iter75, %for.cond4.preheader.lr.ph.iter76 ], [ %add14.iter76, %for.inc15.iter76 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter76, !dbg !239

for.cond4.preheader.lr.ph.iter76:                 ; preds = %for.cond1.preheader.iter76
  br label %for.cond4.preheader.iter76, !dbg !155

for.cond1.for.inc17_crit_edge.iter76:             ; preds = %for.inc15.iter76
  %split.iter76 = phi i32 [ %add14.iter76, %for.inc15.iter76 ]
  br label %for.inc17.iter76, !dbg !155

iter_76_end:                                      ; preds = %for.inc17.iter76
  br label %iter_77_start

iter_77_start:                                    ; preds = %iter_76_end
  br label %for.cond1.preheader.iter77

for.cond1.preheader.iter77:                       ; preds = %iter_77_start
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %615 = add i32 %split.iter76, 1, !dbg !155
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %for.cond4.preheader.lr.ph.iter77, !dbg !155

for.body6.iter77:                                 ; preds = %for.cond4.preheader.iter77, %m_vec_mul_add.exit.iter77
  %k.02.iter77 = phi i32 [ 0, %for.cond4.preheader.iter77 ], [ %add13.iter77, %m_vec_mul_add.exit.iter77 ]
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %add.ptr.idx.iter77 = mul nsw i32 %bs_mat_entries_used.14.iter77, 40, !dbg !161
  %add.ptr.iter77 = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx.iter77, !dbg !161
  %mul8.iter77 = mul nuw nsw i32 %k.02.iter77, 78, !dbg !164
  %616 = getelementptr i8, ptr %mat, i32 %mul8.iter77, !dbg !165
  %arrayidx.iter77 = getelementptr i8, ptr %616, i32 %c.05.iter77, !dbg !165
  %617 = load i8, ptr %arrayidx.iter77, align 1, !dbg !165
  %add10.iter77 = add nuw nsw i32 770, %k.02.iter77, !dbg !166
  %add.ptr12.idx.iter77 = mul nuw nsw i32 %add10.iter77, 40, !dbg !167
  %add.ptr12.iter77 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.iter77, !dbg !167
    #dbg_value(i32 5, !168, !DIExpression(), !173)
    #dbg_value(ptr undef, !175, !DIExpression(), !173)
    #dbg_value(i8 undef, !176, !DIExpression(), !173)
    #dbg_value(ptr undef, !177, !DIExpression(), !173)
    #dbg_value(i8 undef, !178, !DIExpression(), !183)
  %conv.i.i.iter77 = zext i8 %617 to i32, !dbg !185
  %mul.i.i.iter77 = mul i32 %conv.i.i.iter77, 134480385, !dbg !186
    #dbg_value(i32 undef, !187, !DIExpression(), !183)
    #dbg_value(i32 -252645136, !188, !DIExpression(), !183)
  %and.i.i.iter77 = and i32 %mul.i.i.iter77, -252645136, !dbg !189
    #dbg_value(i32 undef, !190, !DIExpression(), !183)
  %shr.i.i.iter77 = lshr exact i32 %and.i.i.iter77, 4, !dbg !191
  %shr1.i.i.iter77 = lshr exact i32 %and.i.i.iter77, 3, !dbg !192
  %618 = xor i32 %shr.i.i.iter77, %shr1.i.i.iter77, !dbg !193
  %xor2.i.i.iter77 = xor i32 %618, %mul.i.i.iter77, !dbg !193
    #dbg_value(i32 undef, !194, !DIExpression(), !173)
    #dbg_value(i64 1229782938247303441, !195, !DIExpression(), !173)
    #dbg_value(i32 0, !196, !DIExpression(), !198)
  br label %for.body.i.iter77, !dbg !199

for.body.i.iter77:                                ; preds = %for.body.i.iter77, %for.body6.iter77
  %i.0.i1.iter77 = phi i32 [ 0, %for.body6.iter77 ], [ %inc.i.iter77, %for.body.i.iter77 ]
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %arrayidx.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.iter77, i32 %i.0.i1.iter77, !dbg !200
  %619 = load i64, ptr %arrayidx.i.iter77, align 8, !dbg !200
  %and.i.iter77 = and i64 %619, 1229782938247303441, !dbg !203
  %and1.i.iter77 = and i32 %xor2.i.i.iter77, 255, !dbg !204
  %conv.i.iter77 = zext nneg i32 %and1.i.iter77 to i64, !dbg !205
  %mul.i.iter77 = mul i64 %and.i.iter77, %conv.i.iter77, !dbg !206
  %shr.i.iter77 = lshr i64 %619, 1, !dbg !207
  %and3.i.iter77 = and i64 %shr.i.iter77, 1229782938247303441, !dbg !208
  %shr4.i.iter77 = lshr i32 %xor2.i.i.iter77, 8, !dbg !209
  %and5.i.iter77 = and i32 %shr4.i.iter77, 15, !dbg !210
  %conv6.i.iter77 = zext nneg i32 %and5.i.iter77 to i64, !dbg !211
  %mul7.i.iter77 = mul nuw i64 %and3.i.iter77, %conv6.i.iter77, !dbg !212
  %xor.i.iter77 = xor i64 %mul.i.iter77, %mul7.i.iter77, !dbg !213
  %arrayidx8.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.iter77, i32 %i.0.i1.iter77, !dbg !214
  %620 = load i64, ptr %arrayidx8.i.iter77, align 8, !dbg !214
  %shr9.i.iter77 = lshr i64 %620, 2, !dbg !215
  %and10.i.iter77 = and i64 %shr9.i.iter77, 1229782938247303441, !dbg !216
  %shr11.i.iter77 = lshr i32 %xor2.i.i.iter77, 16, !dbg !217
  %and12.i.iter77 = and i32 %shr11.i.iter77, 15, !dbg !218
  %conv13.i.iter77 = zext nneg i32 %and12.i.iter77 to i64, !dbg !219
  %mul14.i.iter77 = mul nuw i64 %and10.i.iter77, %conv13.i.iter77, !dbg !220
  %xor15.i.iter77 = xor i64 %xor.i.iter77, %mul14.i.iter77, !dbg !221
  %arrayidx16.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr.iter77, i32 %i.0.i1.iter77, !dbg !222
  %621 = load i64, ptr %arrayidx16.i.iter77, align 8, !dbg !222
  %shr17.i.iter77 = lshr i64 %621, 3, !dbg !223
  %and18.i.iter77 = and i64 %shr17.i.iter77, 1229782938247303441, !dbg !224
  %shr19.i.iter77 = lshr i32 %xor2.i.i.iter77, 24, !dbg !225
  %and20.i.iter77 = and i32 %shr19.i.iter77, 15, !dbg !226
  %conv21.i.iter77 = zext nneg i32 %and20.i.iter77 to i64, !dbg !227
  %mul22.i.iter77 = mul nuw i64 %and18.i.iter77, %conv21.i.iter77, !dbg !228
  %xor23.i.iter77 = xor i64 %xor15.i.iter77, %mul22.i.iter77, !dbg !229
  %arrayidx24.i.iter77 = getelementptr inbounds nuw i64, ptr %add.ptr12.iter77, i32 %i.0.i1.iter77, !dbg !230
  %622 = load i64, ptr %arrayidx24.i.iter77, align 8, !dbg !231
  %xor25.i.iter77 = xor i64 %622, %xor23.i.iter77, !dbg !231
  store i64 %xor25.i.iter77, ptr %arrayidx24.i.iter77, align 8, !dbg !231
  %inc.i.iter77 = add nuw nsw i32 %i.0.i1.iter77, 1, !dbg !232
    #dbg_value(i32 undef, !196, !DIExpression(), !198)
  %exitcond.i.not.iter77 = icmp eq i32 %inc.i.iter77, 5, !dbg !233
  br i1 %exitcond.i.not.iter77, label %m_vec_mul_add.exit.iter77, label %for.body.i.iter77, !dbg !199, !llvm.loop !234

m_vec_mul_add.exit.iter77:                        ; preds = %for.body.i.iter77
  %add13.iter77 = add nuw nsw i32 %k.02.iter77, 1, !dbg !237
    #dbg_value(i32 undef, !156, !DIExpression(), !160)
  %exitcond.not.iter77 = icmp eq i32 %add13.iter77, 10, !dbg !238
  br i1 %exitcond.not.iter77, label %for.inc15.iter77, label %for.body6.iter77, !dbg !239, !llvm.loop !240

for.inc15.iter77:                                 ; preds = %m_vec_mul_add.exit.iter77
    #dbg_value(i32 undef, !145, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !137)
  %add14.iter77 = add i32 %bs_mat_entries_used.14.iter77, 1, !dbg !242
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  %inc.iter77 = add nuw nsw i32 %c.05.iter77, 1, !dbg !243
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
  %exitcond1.not.iter77 = icmp eq i32 %add14.iter77, %615, !dbg !244
  br i1 %exitcond1.not.iter77, label %for.cond1.for.inc17_crit_edge.iter77, label %for.cond4.preheader.iter77, !dbg !155, !llvm.loop !245

for.inc17.iter77:                                 ; preds = %for.cond1.for.inc17_crit_edge.iter77
    #dbg_value(i32 undef, !146, !DIExpression(), !148)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
  br label %iter_77_end

for.cond4.preheader.iter77:                       ; preds = %for.cond4.preheader.lr.ph.iter77, %for.inc15.iter77
  %c.05.iter77 = phi i32 [ 77, %for.cond4.preheader.lr.ph.iter77 ], [ %inc.iter77, %for.inc15.iter77 ]
  %bs_mat_entries_used.14.iter77 = phi i32 [ %split.iter76, %for.cond4.preheader.lr.ph.iter77 ], [ %add14.iter77, %for.inc15.iter77 ]
    #dbg_value(i32 undef, !150, !DIExpression(), !154)
    #dbg_value(i32 undef, !145, !DIExpression(), !137)
    #dbg_value(i32 0, !156, !DIExpression(), !160)
  br label %for.body6.iter77, !dbg !239

for.cond4.preheader.lr.ph.iter77:                 ; preds = %for.cond1.preheader.iter77
  br label %for.cond4.preheader.iter77, !dbg !155

for.cond1.for.inc17_crit_edge.iter77:             ; preds = %for.inc15.iter77
  br label %for.inc17.iter77, !dbg !155

iter_77_end:                                      ; preds = %for.inc17.iter77
  br label %for.end19
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16, !llvmbmc.var !247
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %Vdec = alloca [780 x i8], align 16, !llvmbmc.var !248
  call void @mayo_memset(ptr %Vdec, i8 0, i32 780)
  %Pv = alloca [3900 x i64], align 16, !llvmbmc.var !249
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 5, ptr %sk, ptr %Vdec, ptr %Pv, i32 78, i32 78, i32 10, i32 1)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !250 {
entry:
    #dbg_value(ptr %dst, !254, !DIExpression(), !255)
    #dbg_value(i8 %val, !256, !DIExpression(), !255)
    #dbg_value(i32 %len, !257, !DIExpression(), !255)
    #dbg_value(ptr %dst, !258, !DIExpression(), !255)
    #dbg_value(i32 0, !259, !DIExpression(), !261)
  br label %for.cond, !dbg !262

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !263
    #dbg_value(i32 %i.0, !259, !DIExpression(), !261)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !264
  br i1 %exitcond, label %for.body, label %for.end, !dbg !266

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !267
  store i8 %val, ptr %arrayidx, align 1, !dbg !268
  %inc = add i32 %i.0, 1, !dbg !269
    #dbg_value(i32 %inc, !259, !DIExpression(), !261)
  br label %for.cond, !dbg !270, !llvm.loop !271

for.end:                                          ; preds = %for.cond
  ret void, !dbg !273
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !274 {
entry:
    #dbg_value(ptr %dst, !279, !DIExpression(), !280)
    #dbg_value(ptr %src, !281, !DIExpression(), !280)
    #dbg_value(i32 %len, !282, !DIExpression(), !280)
    #dbg_value(ptr %dst, !283, !DIExpression(), !280)
    #dbg_value(ptr %src, !284, !DIExpression(), !280)
    #dbg_value(i32 0, !287, !DIExpression(), !289)
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !291
    #dbg_value(i32 %i.0, !287, !DIExpression(), !289)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !292
  br i1 %exitcond, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !295
  %0 = load i8, ptr %arrayidx, align 1, !dbg !295
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !296
  store i8 %0, ptr %arrayidx1, align 1, !dbg !297
  %inc = add i32 %i.0, 1, !dbg !298
    #dbg_value(i32 %inc, !287, !DIExpression(), !289)
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  ret void, !dbg !302
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
!130 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !131, file: !131, line: 32, type: !132, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !134, !135, !50, !6, !134, !134, !134, !134}
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!136 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !130, file: !131, line: 32, type: !134)
!137 = !DILocation(line: 0, scope: !130)
!138 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !130, file: !131, line: 32, type: !135)
!139 = !DILocalVariable(name: "mat", arg: 3, scope: !130, file: !131, line: 32, type: !50)
!140 = !DILocalVariable(name: "acc", arg: 4, scope: !130, file: !131, line: 32, type: !6)
!141 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !130, file: !131, line: 33, type: !134)
!142 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !130, file: !131, line: 33, type: !134)
!143 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !130, file: !131, line: 33, type: !134)
!144 = !DILocalVariable(name: "triangular", arg: 8, scope: !130, file: !131, line: 33, type: !134)
!145 = !DILocalVariable(name: "bs_mat_entries_used", scope: !130, file: !131, line: 34, type: !46)
!146 = !DILocalVariable(name: "r", scope: !147, file: !131, line: 35, type: !46)
!147 = distinct !DILexicalBlock(scope: !130, file: !131, line: 35, column: 5)
!148 = !DILocation(line: 0, scope: !147)
!149 = !DILocation(line: 43, column: 1, scope: !130)
!150 = !DILocalVariable(name: "c", scope: !151, file: !131, line: 36, type: !46)
!151 = distinct !DILexicalBlock(scope: !152, file: !131, line: 36, column: 9)
!152 = distinct !DILexicalBlock(scope: !153, file: !131, line: 35, column: 43)
!153 = distinct !DILexicalBlock(scope: !147, file: !131, line: 35, column: 5)
!154 = !DILocation(line: 0, scope: !151)
!155 = !DILocation(line: 36, column: 9, scope: !151)
!156 = !DILocalVariable(name: "k", scope: !157, file: !131, line: 37, type: !46)
!157 = distinct !DILexicalBlock(scope: !158, file: !131, line: 37, column: 13)
!158 = distinct !DILexicalBlock(scope: !159, file: !131, line: 36, column: 60)
!159 = distinct !DILexicalBlock(scope: !151, file: !131, line: 36, column: 9)
!160 = !DILocation(line: 0, scope: !157)
!161 = !DILocation(line: 38, column: 51, scope: !162)
!162 = distinct !DILexicalBlock(scope: !163, file: !131, line: 37, column: 51)
!163 = distinct !DILexicalBlock(scope: !157, file: !131, line: 37, column: 13)
!164 = !DILocation(line: 38, column: 94, scope: !162)
!165 = !DILocation(line: 38, column: 88, scope: !162)
!166 = !DILocation(line: 38, column: 148, scope: !162)
!167 = !DILocation(line: 38, column: 118, scope: !162)
!168 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !169, file: !170, line: 31, type: !46)
!169 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !170, file: !170, line: 31, type: !171, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!170 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!171 = !DISubroutineType(types: !172)
!172 = !{null, !46, !135, !15, !6}
!173 = !DILocation(line: 0, scope: !169, inlinedAt: !174)
!174 = distinct !DILocation(line: 38, column: 17, scope: !162)
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
!237 = !DILocation(line: 37, column: 45, scope: !163)
!238 = !DILocation(line: 37, column: 31, scope: !163)
!239 = !DILocation(line: 37, column: 13, scope: !157)
!240 = distinct !{!240, !239, !241, !236}
!241 = !DILocation(line: 39, column: 13, scope: !157)
!242 = !DILocation(line: 40, column: 33, scope: !158)
!243 = !DILocation(line: 36, column: 56, scope: !159)
!244 = !DILocation(line: 36, column: 40, scope: !159)
!245 = distinct !{!245, !155, !246, !236}
!246 = !DILocation(line: 41, column: 9, scope: !151)
!247 = !{!"sk"}
!248 = !{!"Vdec"}
!249 = !{!"Pv"}
!250 = distinct !DISubprogram(name: "mayo_memset", scope: !251, file: !251, line: 3, type: !252, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!251 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!252 = !DISubroutineType(types: !253)
!253 = !{null, !70, !13, !20}
!254 = !DILocalVariable(name: "dst", arg: 1, scope: !250, file: !251, line: 3, type: !70)
!255 = !DILocation(line: 0, scope: !250)
!256 = !DILocalVariable(name: "val", arg: 2, scope: !250, file: !251, line: 3, type: !13)
!257 = !DILocalVariable(name: "len", arg: 3, scope: !250, file: !251, line: 3, type: !20)
!258 = !DILocalVariable(name: "d", scope: !250, file: !251, line: 5, type: !12)
!259 = !DILocalVariable(name: "i", scope: !260, file: !251, line: 7, type: !20)
!260 = distinct !DILexicalBlock(scope: !250, file: !251, line: 7, column: 5)
!261 = !DILocation(line: 0, scope: !260)
!262 = !DILocation(line: 7, column: 10, scope: !260)
!263 = !DILocation(line: 7, scope: !260)
!264 = !DILocation(line: 7, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !251, line: 7, column: 5)
!266 = !DILocation(line: 7, column: 5, scope: !260)
!267 = !DILocation(line: 8, column: 9, scope: !265)
!268 = !DILocation(line: 8, column: 14, scope: !265)
!269 = !DILocation(line: 7, column: 36, scope: !265)
!270 = !DILocation(line: 7, column: 5, scope: !265)
!271 = distinct !{!271, !266, !272, !236}
!272 = !DILocation(line: 8, column: 16, scope: !260)
!273 = !DILocation(line: 9, column: 1, scope: !250)
!274 = distinct !DISubprogram(name: "mayo_memcpy", scope: !251, file: !251, line: 11, type: !275, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!275 = !DISubroutineType(types: !276)
!276 = !{null, !70, !277, !20}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 32)
!278 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!279 = !DILocalVariable(name: "dst", arg: 1, scope: !274, file: !251, line: 11, type: !70)
!280 = !DILocation(line: 0, scope: !274)
!281 = !DILocalVariable(name: "src", arg: 2, scope: !274, file: !251, line: 11, type: !277)
!282 = !DILocalVariable(name: "len", arg: 3, scope: !274, file: !251, line: 11, type: !20)
!283 = !DILocalVariable(name: "d", scope: !274, file: !251, line: 13, type: !12)
!284 = !DILocalVariable(name: "s", scope: !274, file: !251, line: 14, type: !285)
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 32)
!286 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!287 = !DILocalVariable(name: "i", scope: !288, file: !251, line: 16, type: !20)
!288 = distinct !DILexicalBlock(scope: !274, file: !251, line: 16, column: 5)
!289 = !DILocation(line: 0, scope: !288)
!290 = !DILocation(line: 16, column: 10, scope: !288)
!291 = !DILocation(line: 16, scope: !288)
!292 = !DILocation(line: 16, column: 28, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !251, line: 16, column: 5)
!294 = !DILocation(line: 16, column: 5, scope: !288)
!295 = !DILocation(line: 17, column: 16, scope: !293)
!296 = !DILocation(line: 17, column: 9, scope: !293)
!297 = !DILocation(line: 17, column: 14, scope: !293)
!298 = !DILocation(line: 16, column: 36, scope: !293)
!299 = !DILocation(line: 16, column: 5, scope: !293)
!300 = distinct !{!300, !294, !301, !236}
!301 = !DILocation(line: 17, column: 19, scope: !288)
!302 = !DILocation(line: 18, column: 1, scope: !274)
