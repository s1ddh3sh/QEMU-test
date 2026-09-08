; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

%struct.AES256_CTR_DRBG_struct = type { [32 x i8], [16 x i8], i32 }
%struct.shake128incctx = type { ptr }

@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@f_tail = internal unnamed_addr constant [4 x i8] c"\08\01\01\00", align 1, !dbg !0
@pqmayo_MAYO_1_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !41
@pqmayo_MAYO_1_ref_uint64_t_blocker = dso_local global i64 0, align 8, !dbg !56
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !60
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !64
@Rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1, !dbg !75
@mayo_secure_free.memset_func = internal global ptr @memset, align 4, !dbg !84
@mayo_secure_clear.memset_func = internal global ptr @memset, align 4, !dbg !92
@DRBG_ctx = dso_local global %struct.AES256_CTR_DRBG_struct zeroinitializer, align 4, !dbg !102

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #0 !dbg !128 {
entry:
  %call = call fastcc i32 @example_mayo(ptr noundef null) #4, !dbg !132
  ret i32 %call, !dbg !133
}

; Function Attrs: nounwind
define internal fastcc range(i32 -1, 1) i32 @example_mayo(ptr noundef %p) unnamed_addr #0 !dbg !134 {
entry:
  %msglen = alloca i32, align 4
  %smlen = alloca i32, align 4
  %epk = alloca [18705 x i64], align 8
  %esk = alloca [18603 x i64], align 8
  %msg = alloca [32 x i8], align 1
  %msg2 = alloca [32 x i8], align 1
    #dbg_value(ptr null, !168, !DIExpression(), !169)
    #dbg_value(i32 32, !170, !DIExpression(), !169)
  store i32 32, ptr %msglen, align 4, !dbg !171
    #dbg_value(i32 32, !170, !DIExpression(), !169)
    #dbg_value(i32 486, !172, !DIExpression(), !169)
  store i32 486, ptr %smlen, align 4, !dbg !173
  %call = call dereferenceable_or_null(1420) ptr @calloc(i32 noundef 1420, i32 noundef 1) #5, !dbg !174
    #dbg_value(ptr %call, !175, !DIExpression(), !169)
  %call1 = call dereferenceable_or_null(24) ptr @calloc(i32 noundef 24, i32 noundef 1) #5, !dbg !176
    #dbg_value(ptr %call1, !177, !DIExpression(), !169)
    #dbg_declare(ptr %epk, !178, !DIExpression(), !183)
    #dbg_declare(ptr %esk, !184, !DIExpression(), !189)
  %0 = load i32, ptr %msglen, align 4, !dbg !190
    #dbg_value(i32 %0, !170, !DIExpression(), !169)
  %add2 = add i32 %0, 454, !dbg !191
  %call3 = call ptr @calloc(i32 noundef %add2, i32 noundef 1) #5, !dbg !192
    #dbg_value(ptr %call3, !193, !DIExpression(), !169)
    #dbg_declare(ptr %msg, !194, !DIExpression(), !195)
  call void @mayo_memcpy(ptr %msg, ptr @__const.example_mayo.msg, i32 32), !dbg !195
    #dbg_declare(ptr %msg2, !196, !DIExpression(), !197)
  call void @mayo_memset(ptr %msg2, i8 0, i32 32), !dbg !197
  %call4 = call i32 @pqmayo_MAYO_1_ref_mayo_keypair(ptr noundef null, ptr noundef %call, ptr noundef %call1) #4, !dbg !198
    #dbg_value(i32 0, !199, !DIExpression(), !169)
  %call5 = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef null, ptr noundef %call1, ptr noundef nonnull %esk) #4, !dbg !200
    #dbg_value(i32 0, !199, !DIExpression(), !169)
  %call11 = call i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef null, ptr noundef %call, ptr noundef nonnull %epk) #4, !dbg !201
    #dbg_value(i32 0, !199, !DIExpression(), !169)
  %1 = load i32, ptr %msglen, align 4, !dbg !202
    #dbg_value(i32 %1, !170, !DIExpression(), !169)
    #dbg_value(ptr %smlen, !172, !DIExpression(DW_OP_deref), !169)
  %call17 = call i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef null, ptr noundef %call3, ptr noundef nonnull %smlen, ptr noundef nonnull %msg, i32 noundef %1, ptr noundef %call1) #4, !dbg !203
    #dbg_value(i32 0, !199, !DIExpression(), !169)
  %2 = load i32, ptr %smlen, align 4, !dbg !204
    #dbg_value(i32 %2, !172, !DIExpression(), !169)
    #dbg_value(ptr %msglen, !170, !DIExpression(DW_OP_deref), !169)
  %call23 = call i32 @pqmayo_MAYO_1_ref_mayo_open(ptr noundef null, ptr noundef nonnull %msg2, ptr noundef nonnull %msglen, ptr noundef %call3, i32 noundef %2, ptr noundef %call) #4, !dbg !205
    #dbg_value(i32 %call23, !199, !DIExpression(), !169)
  %cmp24.not = icmp eq i32 %call23, 0, !dbg !206
  br i1 %cmp24.not, label %lor.lhs.false, label %err, !dbg !208

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, ptr %msglen, align 4, !dbg !209
    #dbg_value(i32 %3, !170, !DIExpression(), !169)
  %call27 = call i32 @memcmp(ptr noundef nonnull %msg, ptr noundef nonnull %msg2, i32 noundef %3) #6, !dbg !210
  %tobool.not = icmp eq i32 %call27, 0, !dbg !210
  br i1 %tobool.not, label %if.end30, label %err, !dbg !208

if.end30:                                         ; preds = %lor.lhs.false
    #dbg_value(i32 0, !199, !DIExpression(), !169)
  %4 = load i32, ptr %msglen, align 4, !dbg !211
    #dbg_value(i32 %4, !170, !DIExpression(), !169)
  %call32 = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %msg, i32 noundef %4, ptr noundef %call3, ptr noundef %call) #4, !dbg !212
    #dbg_value(i32 %call32, !199, !DIExpression(), !169)
  %sext = sub nsw i32 0, %call32, !dbg !213
  br label %err, !dbg !213

err:                                              ; preds = %if.end30, %entry, %lor.lhs.false
  %res.0 = phi i32 [ -1, %lor.lhs.false ], [ -1, %entry ], [ %sext, %if.end30 ], !dbg !169
    #dbg_value(i32 %res.0, !199, !DIExpression(), !169)
    #dbg_label(!215, !216)
  call void @free(ptr noundef %call) #6, !dbg !217
  call void @mayo_secure_free(ptr noundef %call1, i32 noundef 24) #4, !dbg !218
  call void @free(ptr noundef %call3) #6, !dbg !219
  ret i32 %res.0, !dbg !220
}

; Function Attrs: allocsize(0,1)
declare dso_local ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local void @free(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !221 {
entry:
    #dbg_value(ptr %dst, !225, !DIExpression(), !226)
    #dbg_value(i8 %val, !227, !DIExpression(), !226)
    #dbg_value(i32 %len, !228, !DIExpression(), !226)
    #dbg_value(ptr %dst, !229, !DIExpression(), !226)
    #dbg_value(i32 0, !230, !DIExpression(), !232)
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !234
    #dbg_value(i32 %i.0, !230, !DIExpression(), !232)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !235
  br i1 %exitcond, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !238
  store i8 %val, ptr %arrayidx, align 1, !dbg !239
  %inc = add i32 %i.0, 1, !dbg !240
    #dbg_value(i32 %inc, !230, !DIExpression(), !232)
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end:                                          ; preds = %for.cond
  ret void, !dbg !245
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #0 !dbg !246 {
entry:
    #dbg_value(ptr %dst, !251, !DIExpression(), !252)
    #dbg_value(ptr %src, !253, !DIExpression(), !252)
    #dbg_value(i32 %len, !254, !DIExpression(), !252)
    #dbg_value(ptr %dst, !255, !DIExpression(), !252)
    #dbg_value(ptr %src, !256, !DIExpression(), !252)
    #dbg_value(i32 0, !259, !DIExpression(), !261)
  br label %for.cond, !dbg !262

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !263
    #dbg_value(i32 %i.0, !259, !DIExpression(), !261)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !264
  br i1 %exitcond, label %for.body, label %for.end, !dbg !266

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !267
  %0 = load i8, ptr %arrayidx, align 1, !dbg !267
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !268
  store i8 %0, ptr %arrayidx1, align 1, !dbg !269
  %inc = add i32 %i.0, 1, !dbg !270
    #dbg_value(i32 %inc, !259, !DIExpression(), !261)
  br label %for.cond, !dbg !271, !llvm.loop !272

for.end:                                          ; preds = %for.cond
  ret void, !dbg !274
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !275 {
entry:
    #dbg_value(ptr %p, !306, !DIExpression(), !307)
    #dbg_value(ptr %pk, !308, !DIExpression(), !307)
    #dbg_value(ptr %sk, !309, !DIExpression(), !307)
    #dbg_value(i32 0, !310, !DIExpression(), !307)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #4, !dbg !311
    #dbg_value(i32 0, !310, !DIExpression(), !307)
    #dbg_label(!312, !313)
  ret i32 0, !dbg !314
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !315 {
entry:
  %S = alloca [328 x i8], align 1
  %P = alloca [18525 x i64], align 8
  %P3 = alloca [320 x i64], align 8
  %O = alloca [624 x i8], align 1
  %P3_upper = alloca [180 x i64], align 8
    #dbg_value(ptr %p, !316, !DIExpression(), !317)
    #dbg_value(ptr %cpk, !318, !DIExpression(), !317)
    #dbg_value(ptr %csk, !319, !DIExpression(), !317)
    #dbg_value(i32 0, !320, !DIExpression(), !317)
    #dbg_value(ptr %csk, !321, !DIExpression(), !317)
    #dbg_declare(ptr %S, !322, !DIExpression(), !326)
    #dbg_declare(ptr %P, !327, !DIExpression(), !331)
    #dbg_declare(ptr %P3, !332, !DIExpression(), !336)
  call void @mayo_memset(ptr %P3, i8 0, i32 2560), !dbg !336
    #dbg_declare(ptr %O, !337, !DIExpression(), !341)
    #dbg_value(i32 5, !342, !DIExpression(), !317)
    #dbg_value(i32 78, !344, !DIExpression(), !317)
    #dbg_value(i32 78, !345, !DIExpression(), !317)
    #dbg_value(i32 8, !346, !DIExpression(), !317)
    #dbg_value(i32 312, !347, !DIExpression(), !317)
    #dbg_value(i32 15405, !348, !DIExpression(), !317)
    #dbg_value(i32 180, !349, !DIExpression(), !317)
    #dbg_value(i32 16, !350, !DIExpression(), !317)
    #dbg_value(i32 24, !351, !DIExpression(), !317)
    #dbg_value(ptr %P, !352, !DIExpression(), !317)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 123240, !dbg !353
    #dbg_value(ptr %add.ptr, !354, !DIExpression(), !317)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 24) #4, !dbg !355
    #dbg_value(ptr %P, !352, !DIExpression(), !317)
  call void @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #4, !dbg !357
    #dbg_value(ptr %S, !358, !DIExpression(), !317)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !359
  call fastcc void @decode(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %O, i32 noundef 624) #4, !dbg !360
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %S) #4, !dbg !361
  call fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %add.ptr, ptr noundef nonnull %O, ptr noundef nonnull %P3) #4, !dbg !362
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #6, !dbg !363
    #dbg_declare(ptr %P3_upper, !364, !DIExpression(), !368)
  call void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 8) #4, !dbg !369
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !370
  call fastcc void @pack_m_vecs(ptr noundef nonnull %P3_upper, ptr noundef nonnull %add.ptr15, i32 noundef 36, i32 noundef 78) #4, !dbg !371
    #dbg_value(i32 0, !320, !DIExpression(), !317)
    #dbg_label(!372, !373)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 624) #4, !dbg !374
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 24960) #4, !dbg !375
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 2560) #4, !dbg !376
  ret i32 0, !dbg !377
}

; Function Attrs: nounwind
define internal fastcc void @decode(ptr noundef %m, ptr noundef %mdec, i32 noundef range(i32 -2147483567, -2147483648) %mdeclen) unnamed_addr #0 !dbg !378 {
entry:
    #dbg_value(ptr %m, !381, !DIExpression(), !382)
    #dbg_value(ptr %mdec, !383, !DIExpression(), !382)
    #dbg_value(i32 %mdeclen, !384, !DIExpression(), !382)
    #dbg_value(i32 0, !385, !DIExpression(), !382)
  br label %for.cond, !dbg !386

for.cond:                                         ; preds = %for.body, %entry
  %mdec.addr.0 = phi ptr [ %mdec, %entry ], [ %incdec.ptr5, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !388
    #dbg_value(i32 %i.0, !385, !DIExpression(), !382)
    #dbg_value(ptr %mdec.addr.0, !383, !DIExpression(), !382)
  %div = sdiv i32 %mdeclen, 2, !dbg !389
  %cmp = icmp slt i32 %i.0, %div, !dbg !391
  br i1 %cmp, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %m, i32 %i.0, !dbg !393
  %0 = load i8, ptr %arrayidx, align 1, !dbg !393
  %1 = and i8 %0, 15, !dbg !395
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %mdec.addr.0, i32 1, !dbg !396
    #dbg_value(ptr %incdec.ptr, !383, !DIExpression(), !382)
  store i8 %1, ptr %mdec.addr.0, align 1, !dbg !397
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0, !dbg !398
  %2 = load i8, ptr %arrayidx2, align 1, !dbg !398
  %3 = lshr i8 %2, 4, !dbg !399
    #dbg_value(ptr %incdec.ptr, !383, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !382)
  store i8 %3, ptr %incdec.ptr, align 1, !dbg !400
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %mdec.addr.0, i32 2, !dbg !401
    #dbg_value(ptr %incdec.ptr5, !383, !DIExpression(), !382)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !402
    #dbg_value(i32 %inc, !385, !DIExpression(), !382)
  br label %for.cond, !dbg !403, !llvm.loop !404

for.end:                                          ; preds = %for.cond
  %mdec.addr.0.lcssa = phi ptr [ %mdec.addr.0, %for.cond ]
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !388
  %4 = and i32 %mdeclen, -2147483647, !dbg !406
  %cmp6 = icmp eq i32 %4, 1, !dbg !406
  br i1 %cmp6, label %if.then, label %if.end, !dbg !406

if.then:                                          ; preds = %for.end
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.lcssa, !dbg !408
  %5 = load i8, ptr %arrayidx8, align 1, !dbg !408
  %6 = and i8 %5, 15, !dbg !410
    #dbg_value(ptr %mdec.addr.0.lcssa, !383, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !382)
  store i8 %6, ptr %mdec.addr.0.lcssa, align 1, !dbg !411
  br label %if.end, !dbg !412

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !413
}

; Function Attrs: nounwind
define internal fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %P, ptr noundef %seed_pk) unnamed_addr #0 !dbg !414 {
entry:
    #dbg_value(ptr %p, !417, !DIExpression(), !418)
    #dbg_value(ptr %P, !419, !DIExpression(), !418)
    #dbg_value(ptr %seed_pk, !420, !DIExpression(), !418)
  %call = call i32 @AES_128_CTR(ptr noundef %P, i32 noundef 144495, ptr noundef %seed_pk, i32 noundef 16) #4, !dbg !421
  call fastcc void @unpack_m_vecs(ptr noundef %P, ptr noundef %P, i32 noundef 3705, i32 noundef 78) #4, !dbg !422
  ret void, !dbg !423
}

; Function Attrs: nounwind
define internal fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %O, ptr noundef nonnull %P3) unnamed_addr #0 !dbg !424 {
entry:
    #dbg_value(ptr %p, !429, !DIExpression(), !430)
    #dbg_value(ptr %P1, !431, !DIExpression(), !430)
    #dbg_value(ptr %P2, !432, !DIExpression(), !430)
    #dbg_value(ptr %O, !433, !DIExpression(), !430)
    #dbg_value(ptr %P3, !434, !DIExpression(), !430)
    #dbg_value(i32 5, !435, !DIExpression(), !430)
    #dbg_value(i32 78, !436, !DIExpression(), !430)
    #dbg_value(i32 8, !437, !DIExpression(), !430)
  call fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %P2) #4, !dbg !438
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef 5, ptr noundef %O, ptr noundef %P2, ptr noundef %P3, i32 noundef 78, i32 noundef 8, i32 noundef 8) #4, !dbg !439
  ret void, !dbg !440
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define internal fastcc void @pack_m_vecs(ptr noundef nonnull %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) unnamed_addr #0 !dbg !441 {
entry:
    #dbg_value(ptr %in, !444, !DIExpression(), !445)
    #dbg_value(ptr %out, !446, !DIExpression(), !445)
    #dbg_value(i32 36, !447, !DIExpression(), !445)
    #dbg_value(i32 78, !448, !DIExpression(), !445)
    #dbg_value(i32 5, !449, !DIExpression(), !445)
    #dbg_value(ptr %in, !450, !DIExpression(), !445)
    #dbg_value(i32 0, !451, !DIExpression(), !453)
  br label %for.cond, !dbg !454

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !455
    #dbg_value(i32 %i.0, !451, !DIExpression(), !453)
  %exitcond = icmp ne i32 %i.0, 36, !dbg !456
  br i1 %exitcond, label %for.body, label %for.end, !dbg !458

for.body:                                         ; preds = %for.cond
  %div1 = mul nuw nsw i32 %i.0, 39, !dbg !459
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %div1, !dbg !461
  %mul3 = mul nuw nsw i32 %i.0, 40, !dbg !462
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %in, i32 %mul3, !dbg !463
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr4, i32 noundef 39) #6, !dbg !464
  %inc = add nuw nsw i32 %i.0, 1, !dbg !465
    #dbg_value(i32 %inc, !451, !DIExpression(), !453)
  br label %for.cond, !dbg !466, !llvm.loop !467

for.end:                                          ; preds = %for.cond
  ret void, !dbg !469
}

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define internal fastcc void @P1_times_O(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %O, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !470 {
entry:
    #dbg_value(ptr %p, !473, !DIExpression(), !474)
    #dbg_value(ptr %P1, !475, !DIExpression(), !474)
    #dbg_value(ptr %O, !476, !DIExpression(), !474)
    #dbg_value(ptr %acc, !477, !DIExpression(), !474)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef 5, ptr noundef %P1, ptr noundef %O, ptr noundef %acc, i32 noundef 78, i32 noundef 78, i32 noundef 8, i32 noundef 1) #4, !dbg !478
  ret void, !dbg !479
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef nonnull %mat, ptr noundef nonnull %bs_mat, ptr noundef nonnull %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !480 {
entry:
    #dbg_value(i32 5, !483, !DIExpression(), !484)
    #dbg_value(ptr %mat, !485, !DIExpression(), !484)
    #dbg_value(ptr %bs_mat, !486, !DIExpression(), !484)
    #dbg_value(ptr %acc, !487, !DIExpression(), !484)
    #dbg_value(i32 78, !488, !DIExpression(), !484)
    #dbg_value(i32 8, !489, !DIExpression(), !484)
    #dbg_value(i32 8, !490, !DIExpression(), !484)
    #dbg_value(i32 0, !491, !DIExpression(), !493)
  br label %for.cond, !dbg !494

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !495
    #dbg_value(i32 %r.0, !491, !DIExpression(), !493)
  %exitcond2 = icmp ne i32 %r.0, 8, !dbg !496
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end19, !dbg !498

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !499

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond1.preheader ], !dbg !502
    #dbg_value(i32 %c.0, !503, !DIExpression(), !504)
  %exitcond1 = icmp ne i32 %c.0, 78, !dbg !505
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc17, !dbg !499

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !507

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !510
    #dbg_value(i32 %k.0, !511, !DIExpression(), !512)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !513
  br i1 %exitcond, label %for.body6, label %for.inc15, !dbg !507

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %c.0, 3, !dbg !515
  %add = or disjoint i32 %mul, %k.0, !dbg !517
  %add.ptr.idx = mul nuw nsw i32 %add, 40, !dbg !518
  %add.ptr = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx, !dbg !518
  %mul8 = shl nuw nsw i32 %c.0, 3, !dbg !519
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !520
  %arrayidx = getelementptr i8, ptr %0, i32 %r.0, !dbg !520
  %1 = load i8, ptr %arrayidx, align 1, !dbg !520
  %mul10 = shl nuw nsw i32 %r.0, 3, !dbg !521
  %add11 = or disjoint i32 %mul10, %k.0, !dbg !522
  %add.ptr13.idx = mul nuw nsw i32 %add11, 40, !dbg !523
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !523
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr, i8 noundef zeroext %1, ptr noundef nonnull %add.ptr13) #4, !dbg !524
  %add14 = add nuw nsw i32 %k.0, 1, !dbg !525
    #dbg_value(i32 %add14, !511, !DIExpression(), !512)
  br label %for.cond4, !dbg !526, !llvm.loop !527

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw nsw i32 %c.0, 1, !dbg !529
    #dbg_value(i32 %inc, !503, !DIExpression(), !504)
  br label %for.cond1, !dbg !530, !llvm.loop !531

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw nsw i32 %r.0, 1, !dbg !533
    #dbg_value(i32 %inc18, !491, !DIExpression(), !493)
  br label %for.cond, !dbg !534, !llvm.loop !535

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !537
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !538 {
entry:
    #dbg_value(i32 %m_vec_limbs, !542, !DIExpression(), !543)
    #dbg_value(ptr %in, !544, !DIExpression(), !543)
    #dbg_value(i8 %a, !545, !DIExpression(), !543)
    #dbg_value(ptr %acc, !546, !DIExpression(), !543)
  %call = call fastcc i32 @mul_table(i8 noundef zeroext %a) #4, !dbg !547
    #dbg_value(i32 %call, !548, !DIExpression(), !543)
    #dbg_value(i64 1229782938247303441, !549, !DIExpression(), !543)
    #dbg_value(i32 0, !550, !DIExpression(), !552)
  br label %for.cond, !dbg !553

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !554
    #dbg_value(i32 %i.0, !550, !DIExpression(), !552)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !555
  br i1 %exitcond, label %for.body, label %for.end, !dbg !557

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !558
  %0 = load i64, ptr %arrayidx, align 8, !dbg !558
  %and = and i64 %0, 1229782938247303441, !dbg !560
  %and1 = and i32 %call, 255, !dbg !561
  %conv = zext nneg i32 %and1 to i64, !dbg !562
  %mul = mul i64 %and, %conv, !dbg !563
  %shr = lshr i64 %0, 1, !dbg !564
  %and3 = and i64 %shr, 1229782938247303441, !dbg !565
  %shr4 = lshr i32 %call, 8, !dbg !566
  %and5 = and i32 %shr4, 15, !dbg !567
  %conv6 = zext nneg i32 %and5 to i64, !dbg !568
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !569
  %xor = xor i64 %mul, %mul7, !dbg !570
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !571
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !571
  %shr9 = lshr i64 %1, 2, !dbg !572
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !573
  %shr11 = lshr i32 %call, 16, !dbg !574
  %and12 = and i32 %shr11, 15, !dbg !575
  %conv13 = zext nneg i32 %and12 to i64, !dbg !576
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !577
  %xor15 = xor i64 %xor, %mul14, !dbg !578
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !579
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !579
  %shr17 = lshr i64 %2, 3, !dbg !580
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !581
  %shr19 = lshr i32 %call, 24, !dbg !582
  %and20 = and i32 %shr19, 15, !dbg !583
  %conv21 = zext nneg i32 %and20 to i64, !dbg !584
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !585
  %xor23 = xor i64 %xor15, %mul22, !dbg !586
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !587
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !588
  %xor25 = xor i64 %3, %xor23, !dbg !588
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !588
  %inc = add nuw nsw i32 %i.0, 1, !dbg !589
    #dbg_value(i32 %inc, !550, !DIExpression(), !552)
  br label %for.cond, !dbg !590, !llvm.loop !591

for.end:                                          ; preds = %for.cond
  ret void, !dbg !593
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table(i8 noundef zeroext %b) unnamed_addr #0 !dbg !594 {
entry:
    #dbg_value(i8 %b, !598, !DIExpression(), !599)
  %conv = zext i8 %b to i32, !dbg !600
  %mul = mul i32 %conv, 134480385, !dbg !601
    #dbg_value(i32 %mul, !602, !DIExpression(), !599)
    #dbg_value(i32 -252645136, !603, !DIExpression(), !599)
  %and = and i32 %mul, -252645136, !dbg !604
    #dbg_value(i32 %and, !605, !DIExpression(), !599)
  %shr = lshr exact i32 %and, 4, !dbg !606
  %shr1 = lshr exact i32 %and, 3, !dbg !607
  %0 = xor i32 %shr, %shr1, !dbg !608
  %xor2 = xor i32 %0, %mul, !dbg !608
  ret i32 %xor2, !dbg !609
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %m_vec_limbs, ptr noundef nonnull %bs_mat, ptr noundef nonnull %mat, ptr noundef nonnull %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_cols, i32 noundef %triangular) unnamed_addr #0 !dbg !610 {
entry:
    #dbg_value(i32 5, !613, !DIExpression(), !614)
    #dbg_value(ptr %bs_mat, !615, !DIExpression(), !614)
    #dbg_value(ptr %mat, !616, !DIExpression(), !614)
    #dbg_value(ptr %acc, !617, !DIExpression(), !614)
    #dbg_value(i32 78, !618, !DIExpression(), !614)
    #dbg_value(i32 78, !619, !DIExpression(), !614)
    #dbg_value(i32 8, !620, !DIExpression(), !614)
    #dbg_value(i32 1, !621, !DIExpression(), !614)
    #dbg_value(i32 0, !622, !DIExpression(), !614)
    #dbg_value(i32 0, !623, !DIExpression(), !625)
  br label %for.cond, !dbg !626

for.cond:                                         ; preds = %for.inc17, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17 ], [ 78, %entry ], !dbg !627
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1.lcssa, %for.inc17 ], !dbg !627
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !628
    #dbg_value(i32 %r.0, !623, !DIExpression(), !625)
    #dbg_value(i32 %bs_mat_entries_used.0, !622, !DIExpression(), !614)
  %exitcond2 = icmp ne i32 %r.0, 78, !dbg !629
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end19, !dbg !631

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !632
  br label %for.cond1, !dbg !632

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc15
  %bs_mat_entries_used.1 = phi i32 [ %add14, %for.inc15 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !614
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ %r.0, %for.cond1.preheader ], !dbg !635
    #dbg_value(i32 %c.0, !636, !DIExpression(), !637)
    #dbg_value(i32 %bs_mat_entries_used.1, !622, !DIExpression(), !614)
  %exitcond1 = icmp ne i32 %bs_mat_entries_used.1, %0, !dbg !638
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc17, !dbg !632

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !640

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !643
    #dbg_value(i32 %k.0, !644, !DIExpression(), !645)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !646
  br i1 %exitcond, label %for.body6, label %for.inc15, !dbg !640

for.body6:                                        ; preds = %for.cond4
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !648
  %add.ptr = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx, !dbg !648
  %mul8 = shl nuw nsw i32 %c.0, 3, !dbg !650
  %1 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !651
  %arrayidx = getelementptr i8, ptr %1, i32 %k.0, !dbg !651
  %2 = load i8, ptr %arrayidx, align 1, !dbg !651
  %mul9 = shl nuw nsw i32 %r.0, 3, !dbg !652
  %add10 = or disjoint i32 %mul9, %k.0, !dbg !653
  %add.ptr12.idx = mul nuw nsw i32 %add10, 40, !dbg !654
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx, !dbg !654
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr, i8 noundef zeroext %2, ptr noundef nonnull %add.ptr12) #4, !dbg !655
  %add13 = add nuw nsw i32 %k.0, 1, !dbg !656
    #dbg_value(i32 %add13, !644, !DIExpression(), !645)
  br label %for.cond4, !dbg !657, !llvm.loop !658

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !622, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !614)
  %add14 = add i32 %bs_mat_entries_used.1, 1, !dbg !660
    #dbg_value(i32 %add14, !622, !DIExpression(), !614)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !661
    #dbg_value(i32 %inc, !636, !DIExpression(), !637)
  br label %for.cond1, !dbg !662, !llvm.loop !663

for.inc17:                                        ; preds = %for.cond1
  %bs_mat_entries_used.1.lcssa = phi i32 [ %bs_mat_entries_used.1, %for.cond1 ], !dbg !614
  %inc18 = add nuw nsw i32 %r.0, 1, !dbg !665
    #dbg_value(i32 %inc18, !623, !DIExpression(), !625)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !666
  br label %for.cond, !dbg !666, !llvm.loop !667

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !669
}

; Function Attrs: nounwind
define internal fastcc void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef range(i32 36, 3706) %vecs, i32 noundef %m) unnamed_addr #0 !dbg !670 {
entry:
  %tmp = alloca [5 x i64], align 8
    #dbg_value(ptr %in, !673, !DIExpression(), !674)
    #dbg_value(ptr %out, !675, !DIExpression(), !674)
    #dbg_value(i32 %vecs, !676, !DIExpression(), !674)
    #dbg_value(i32 78, !677, !DIExpression(), !674)
    #dbg_value(i32 5, !678, !DIExpression(), !674)
    #dbg_value(ptr %out, !679, !DIExpression(), !674)
    #dbg_declare(ptr %tmp, !680, !DIExpression(), !684)
  call void @mayo_memset(ptr %tmp, i8 0, i32 40), !dbg !684
    #dbg_value(i32 %vecs, !685, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !687)
  br label %for.cond, !dbg !688

for.cond:                                         ; preds = %for.body, %entry
  %i.0.in = phi i32 [ %vecs, %entry ], [ %i.0, %for.body ]
    #dbg_value(i32 %i.0.in, !685, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !687)
  %cmp = icmp sgt i32 %i.0.in, 0, !dbg !689
  br i1 %cmp, label %for.body, label %for.end, !dbg !691

for.body:                                         ; preds = %for.cond
  %i.0 = add nsw i32 %i.0.in, -1, !dbg !692
    #dbg_value(i32 %i.0, !685, !DIExpression(), !687)
  %div1 = mul nsw i32 %i.0, 39, !dbg !693
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %div1, !dbg !695
  %call = call ptr @memcpy(ptr noundef nonnull %tmp, ptr noundef %add.ptr, i32 noundef 39) #6, !dbg !696
  %mul4 = mul nsw i32 %i.0, 40, !dbg !697
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %out, i32 %mul4, !dbg !698
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef nonnull %tmp, i32 noundef 40) #6, !dbg !699
    #dbg_value(i32 %i.0, !685, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !687)
  br label %for.cond, !dbg !700, !llvm.loop !701

for.end:                                          ; preds = %for.cond
  ret void, !dbg !703
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !704 {
entry:
  %S = alloca [328 x i8], align 1
    #dbg_value(ptr %p, !707, !DIExpression(), !708)
    #dbg_value(ptr %csk, !709, !DIExpression(), !708)
    #dbg_value(ptr %sk, !710, !DIExpression(), !708)
    #dbg_value(i32 0, !711, !DIExpression(), !708)
    #dbg_declare(ptr %S, !712, !DIExpression(), !713)
    #dbg_value(ptr %sk, !714, !DIExpression(), !708)
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !715
    #dbg_value(ptr %add.ptr1, !716, !DIExpression(), !708)
    #dbg_value(i32 8, !717, !DIExpression(), !708)
    #dbg_value(i32 78, !718, !DIExpression(), !708)
    #dbg_value(i32 312, !719, !DIExpression(), !708)
    #dbg_value(i32 16, !720, !DIExpression(), !708)
    #dbg_value(i32 24, !721, !DIExpression(), !708)
    #dbg_value(ptr %csk, !722, !DIExpression(), !708)
    #dbg_value(ptr %S, !723, !DIExpression(), !708)
  call void @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #4, !dbg !724
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !725
  call fastcc void @decode(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr1, i32 noundef 624) #4, !dbg !726
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %S) #4, !dbg !727
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !728
    #dbg_value(ptr %add.ptr5, !729, !DIExpression(), !708)
    #dbg_value(ptr %sk, !730, !DIExpression(), !708)
    #dbg_value(ptr %add.ptr5, !731, !DIExpression(), !708)
  call fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %add.ptr1, ptr noundef nonnull %add.ptr5) #4, !dbg !732
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 328) #4, !dbg !733
  ret i32 0, !dbg !734
}

; Function Attrs: nounwind
define internal fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !735 {
entry:
    #dbg_value(ptr %p, !736, !DIExpression(), !737)
    #dbg_value(ptr %P1, !738, !DIExpression(), !737)
    #dbg_value(ptr %O, !739, !DIExpression(), !737)
    #dbg_value(ptr %acc, !740, !DIExpression(), !737)
    #dbg_value(i32 8, !741, !DIExpression(), !737)
    #dbg_value(i32 78, !742, !DIExpression(), !737)
    #dbg_value(i32 5, !743, !DIExpression(), !737)
    #dbg_value(i32 0, !744, !DIExpression(), !737)
    #dbg_value(i32 0, !745, !DIExpression(), !747)
  br label %for.cond, !dbg !748

for.cond:                                         ; preds = %for.inc27, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27 ], [ 78, %entry ], !dbg !749
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1.lcssa, %for.inc27 ], !dbg !749
  %r.0 = phi i32 [ 0, %entry ], [ %inc28, %for.inc27 ], !dbg !750
    #dbg_value(i32 %r.0, !745, !DIExpression(), !747)
    #dbg_value(i32 %bs_mat_entries_used.0, !744, !DIExpression(), !737)
  %exitcond2 = icmp ne i32 %r.0, 78, !dbg !751
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end29, !dbg !753

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !754
  br label %for.cond1, !dbg !754

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc25
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.2, %for.inc25 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !737
  %c.0 = phi i32 [ %inc, %for.inc25 ], [ %r.0, %for.cond1.preheader ], !dbg !757
    #dbg_value(i32 %c.0, !758, !DIExpression(), !759)
    #dbg_value(i32 %bs_mat_entries_used.1, !744, !DIExpression(), !737)
  %exitcond1 = icmp ne i32 %bs_mat_entries_used.1, %0, !dbg !760
  br i1 %exitcond1, label %for.body3, label %for.inc27, !dbg !754

for.body3:                                        ; preds = %for.cond1
  %cmp4 = icmp eq i32 %c.0, %r.0, !dbg !762
  br i1 %cmp4, label %for.inc25, label %for.cond5.preheader, !dbg !762

for.cond5.preheader:                              ; preds = %for.body3
  br label %for.cond5, !dbg !765

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %k.0 = phi i32 [ %add23, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !767
    #dbg_value(i32 %k.0, !768, !DIExpression(), !769)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !770
  br i1 %exitcond, label %for.body7, label %for.inc25.loopexit, !dbg !765

for.body7:                                        ; preds = %for.cond5
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !772
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !772
  %mul8 = shl nuw nsw i32 %c.0, 3, !dbg !774
  %add9 = or disjoint i32 %mul8, %k.0, !dbg !775
  %arrayidx = getelementptr inbounds nuw i8, ptr %O, i32 %add9, !dbg !776
  %1 = load i8, ptr %arrayidx, align 1, !dbg !776
  %mul10 = shl nuw nsw i32 %r.0, 3, !dbg !777
  %add11 = or disjoint i32 %mul10, %k.0, !dbg !778
  %add.ptr13.idx = mul nuw nsw i32 %add11, 40, !dbg !779
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !779
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #4, !dbg !780
  %add.ptr15.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !781
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx, !dbg !781
  %mul16 = shl nuw nsw i32 %r.0, 3, !dbg !782
  %add17 = or disjoint i32 %mul16, %k.0, !dbg !783
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %O, i32 %add17, !dbg !784
  %2 = load i8, ptr %arrayidx18, align 1, !dbg !784
  %mul19 = shl nuw nsw i32 %c.0, 3, !dbg !785
  %add20 = or disjoint i32 %mul19, %k.0, !dbg !786
  %add.ptr22.idx = mul nuw nsw i32 %add20, 40, !dbg !787
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx, !dbg !787
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr15, i8 noundef zeroext %2, ptr noundef %add.ptr22) #4, !dbg !788
  %add23 = add nuw nsw i32 %k.0, 1, !dbg !789
    #dbg_value(i32 %add23, !768, !DIExpression(), !769)
  br label %for.cond5, !dbg !790, !llvm.loop !791

for.inc25.loopexit:                               ; preds = %for.cond5
  br label %for.inc25, !dbg !793

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %bs_mat_entries_used.2 = add i32 %bs_mat_entries_used.1, 1, !dbg !793
    #dbg_value(i32 %bs_mat_entries_used.2, !744, !DIExpression(), !737)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !794
    #dbg_value(i32 %inc, !758, !DIExpression(), !759)
  br label %for.cond1, !dbg !795, !llvm.loop !796

for.inc27:                                        ; preds = %for.cond1
  %bs_mat_entries_used.1.lcssa = phi i32 [ %bs_mat_entries_used.1, %for.cond1 ], !dbg !737
  %inc28 = add nuw nsw i32 %r.0, 1, !dbg !798
    #dbg_value(i32 %inc28, !745, !DIExpression(), !747)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !799
  br label %for.cond, !dbg !799, !llvm.loop !800

for.end29:                                        ; preds = %for.cond
  ret void, !dbg !802
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !803 {
entry:
  %tenc = alloca [39 x i8], align 1
  %t = alloca [78 x i8], align 1
  %y = alloca [78 x i8], align 1
  %salt = alloca [24 x i8], align 1
  %V = alloca [430 x i8], align 1
  %Vdec = alloca [780 x i8], align 1
  %A = alloca [6480 x i8], align 1
  %x = alloca [860 x i8], align 1
  %r = alloca [81 x i8], align 1
  %s = alloca [860 x i8], align 1
  %sk = alloca [18603 x i64], align 32
  %Ox = alloca [78 x i8], align 1
  %tmp = alloca [81 x i8], align 1
  %Mtmp = alloca [400 x i64], align 8
    #dbg_value(ptr %p, !807, !DIExpression(), !808)
    #dbg_value(ptr %sig, !809, !DIExpression(), !808)
    #dbg_value(ptr %siglen, !810, !DIExpression(), !808)
    #dbg_value(ptr %m, !811, !DIExpression(), !808)
    #dbg_value(i32 %mlen, !812, !DIExpression(), !808)
    #dbg_value(ptr %csk, !813, !DIExpression(), !808)
    #dbg_value(i32 0, !814, !DIExpression(), !808)
    #dbg_declare(ptr %tenc, !815, !DIExpression(), !819)
    #dbg_declare(ptr %t, !820, !DIExpression(), !824)
    #dbg_declare(ptr %y, !825, !DIExpression(), !826)
    #dbg_declare(ptr %salt, !827, !DIExpression(), !829)
    #dbg_declare(ptr %V, !830, !DIExpression(), !834)
    #dbg_declare(ptr %Vdec, !835, !DIExpression(), !839)
    #dbg_declare(ptr %A, !840, !DIExpression(), !844)
  call void @mayo_memset(ptr %A, i8 0, i32 6480), !dbg !844
    #dbg_declare(ptr %x, !845, !DIExpression(), !849)
    #dbg_declare(ptr %r, !850, !DIExpression(), !854)
  call void @mayo_memset(ptr %r, i8 0, i32 81), !dbg !854
    #dbg_declare(ptr %s, !855, !DIExpression(), !856)
    #dbg_declare(ptr %sk, !857, !DIExpression(), !858)
    #dbg_declare(ptr %Ox, !859, !DIExpression(), !860)
    #dbg_declare(ptr %tmp, !861, !DIExpression(), !862)
    #dbg_value(i32 78, !863, !DIExpression(), !808)
    #dbg_value(i32 86, !864, !DIExpression(), !808)
    #dbg_value(i32 8, !865, !DIExpression(), !808)
    #dbg_value(i32 10, !866, !DIExpression(), !808)
    #dbg_value(i32 78, !867, !DIExpression(), !808)
    #dbg_value(i32 39, !868, !DIExpression(), !808)
    #dbg_value(i32 39, !869, !DIExpression(), !808)
    #dbg_value(i32 40, !870, !DIExpression(), !808)
    #dbg_value(i32 454, !871, !DIExpression(), !808)
    #dbg_value(i32 81, !872, !DIExpression(), !808)
    #dbg_value(i32 32, !873, !DIExpression(), !808)
    #dbg_value(i32 24, !874, !DIExpression(), !808)
    #dbg_value(i32 24, !875, !DIExpression(), !808)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #4, !dbg !876
    #dbg_value(i32 0, !814, !DIExpression(), !808)
    #dbg_value(ptr %csk, !877, !DIExpression(), !808)
  call void @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #4, !dbg !878
    #dbg_value(ptr %sk, !879, !DIExpression(), !808)
    #dbg_value(ptr %add.ptr, !880, !DIExpression(), !808)
    #dbg_declare(ptr %Mtmp, !881, !DIExpression(), !885)
  call void @mayo_memset(ptr %Mtmp, i8 0, i32 3200), !dbg !885
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !886
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 24) #4, !dbg !888
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 56, !dbg !889
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 24) #6, !dbg !890
  call void @shake256(ptr noundef nonnull %salt, i32 noundef 24, ptr noundef nonnull %tmp, i32 noundef 80) #4, !dbg !891
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !892
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 24) #6, !dbg !893
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !894
    #dbg_value(ptr %add.ptr24, !895, !DIExpression(), !808)
  call void @shake256(ptr noundef nonnull %tenc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #4, !dbg !896
  call fastcc void @decode(ptr noundef nonnull %tenc, ptr noundef nonnull %t, i32 noundef 78) #4, !dbg !897
  store i8 0, ptr %add.ptr24, align 1, !dbg !898
  call void @shake256(ptr noundef nonnull %V, i32 noundef 430, ptr noundef nonnull %tmp, i32 noundef 81) #4, !dbg !899
    #dbg_value(i32 0, !900, !DIExpression(), !902)
  br label %for.cond, !dbg !903

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !904
    #dbg_value(i32 %i.0, !900, !DIExpression(), !902)
  %exitcond = icmp ne i32 %i.0, 10, !dbg !905
  br i1 %exitcond, label %for.body, label %for.end, !dbg !907

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 39, !dbg !908
  %add.ptr35 = getelementptr inbounds nuw i8, ptr %V, i32 %mul, !dbg !910
  %mul37 = mul nuw nsw i32 %i.0, 78, !dbg !911
  %add.ptr38 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul37, !dbg !912
  call fastcc void @decode(ptr noundef nonnull %add.ptr35, ptr noundef nonnull %add.ptr38, i32 noundef 78) #4, !dbg !913
  %inc = add nuw nsw i32 %i.0, 1, !dbg !914
    #dbg_value(i32 %inc, !900, !DIExpression(), !902)
  br label %for.cond, !dbg !915, !llvm.loop !916

for.end:                                          ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !918
  call fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %add.ptr, ptr noundef nonnull %sk, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #4, !dbg !919
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #4, !dbg !920
  call fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #4, !dbg !921
    #dbg_value(i32 0, !922, !DIExpression(), !924)
  br label %for.cond48, !dbg !925

for.cond48:                                       ; preds = %for.body50, %for.end
  %i47.0 = phi i32 [ 0, %for.end ], [ %inc53, %for.body50 ], !dbg !926
    #dbg_value(i32 %i47.0, !922, !DIExpression(), !924)
  %exitcond1 = icmp ne i32 %i47.0, 78, !dbg !927
  br i1 %exitcond1, label %for.body50, label %for.end54, !dbg !929

for.body50:                                       ; preds = %for.cond48
  %0 = mul nuw nsw i32 %i47.0, 81, !dbg !930
  %sub = add nuw nsw i32 %0, 80, !dbg !932
  %arrayidx = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub, !dbg !933
  store i8 0, ptr %arrayidx, align 1, !dbg !934
  %inc53 = add nuw nsw i32 %i47.0, 1, !dbg !935
    #dbg_value(i32 %inc53, !922, !DIExpression(), !924)
  br label %for.cond48, !dbg !936, !llvm.loop !937

for.end54:                                        ; preds = %for.cond48
  %add.ptr56 = getelementptr inbounds nuw i8, ptr %V, i32 390, !dbg !939
  call fastcc void @decode(ptr noundef nonnull %add.ptr56, ptr noundef nonnull %r, i32 noundef 80) #4, !dbg !940
  %call62 = call i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 10, i32 noundef 8, i32 noundef 78, i32 noundef 81) #4, !dbg !941
  %tobool.not = icmp eq i32 %call62, 0, !dbg !941
  br i1 %tobool.not, label %if.else, label %if.end68, !dbg !941

if.else:                                          ; preds = %for.end54
  %call65 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 3200) #6, !dbg !943
  %call67 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 6480) #6, !dbg !945
  br label %if.end68

if.end68:                                         ; preds = %for.end54, %if.else
    #dbg_value(i32 0, !946, !DIExpression(), !948)
  br label %for.cond70, !dbg !949

for.cond70:                                       ; preds = %for.body72, %if.end68
  %i69.0 = phi i32 [ 0, %if.end68 ], [ %inc96, %for.body72 ], !dbg !950
    #dbg_value(i32 %i69.0, !946, !DIExpression(), !948)
  %exitcond2 = icmp ne i32 %i69.0, 10, !dbg !951
  br i1 %exitcond2, label %for.body72, label %for.end97, !dbg !953

for.body72:                                       ; preds = %for.cond70
  %mul74 = mul nuw nsw i32 %i69.0, 78, !dbg !954
  %add.ptr75 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul74, !dbg !956
    #dbg_value(ptr %add.ptr75, !957, !DIExpression(), !808)
  %add.ptr78 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !958
  %mul80 = shl nuw nsw i32 %i69.0, 3, !dbg !959
  %add.ptr81 = getelementptr inbounds nuw i8, ptr %x, i32 %mul80, !dbg !960
  call fastcc void @mat_mul(ptr noundef nonnull %add.ptr78, ptr noundef nonnull %add.ptr81, ptr noundef nonnull %Ox, i32 noundef 8, i32 noundef 78, i32 noundef 1) #4, !dbg !961
  %mul85 = mul nuw nsw i32 %i69.0, 86, !dbg !962
  %add.ptr86 = getelementptr inbounds nuw i8, ptr %s, i32 %mul85, !dbg !963
  call fastcc void @mat_add(ptr noundef nonnull %add.ptr75, ptr noundef nonnull %Ox, ptr noundef nonnull %add.ptr86, i32 noundef 78, i32 noundef 1) #4, !dbg !964
  %mul88 = mul nuw nsw i32 %i69.0, 86, !dbg !965
  %add.ptr89 = getelementptr inbounds nuw i8, ptr %s, i32 %mul88, !dbg !966
  %add.ptr90 = getelementptr inbounds nuw i8, ptr %add.ptr89, i32 78, !dbg !967
  %mul92 = shl nuw nsw i32 %i69.0, 3, !dbg !968
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %x, i32 %mul92, !dbg !969
  %call94 = call ptr @memcpy(ptr noundef nonnull %add.ptr90, ptr noundef nonnull %add.ptr93, i32 noundef 8) #6, !dbg !970
  %inc96 = add nuw nsw i32 %i69.0, 1, !dbg !971
    #dbg_value(i32 %inc96, !946, !DIExpression(), !948)
  br label %for.cond70, !dbg !972, !llvm.loop !973

for.end97:                                        ; preds = %for.cond70
  call fastcc void @encode(ptr noundef nonnull %s, ptr noundef %sig, i32 noundef 860) #4, !dbg !975
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !976
  %call102 = call ptr @memcpy(ptr noundef nonnull %add.ptr100, ptr noundef nonnull %salt, i32 noundef 24) #6, !dbg !977
  store i32 454, ptr %siglen, align 4, !dbg !978
    #dbg_value(i32 0, !814, !DIExpression(), !808)
    #dbg_label(!979, !980)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 430) #4, !dbg !981
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 780) #4, !dbg !982
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 6480) #4, !dbg !983
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 81) #4, !dbg !984
  %add.ptr109 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !985
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr109, i32 noundef 624) #4, !dbg !986
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 148824) #4, !dbg !987
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 78) #4, !dbg !988
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 81) #4, !dbg !989
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 3200) #4, !dbg !990
  ret i32 0, !dbg !991
}

; Function Attrs: nounwind
define internal fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %L, ptr noundef nonnull %P1, ptr noundef nonnull %VL, ptr noundef nonnull %VP1V) unnamed_addr #0 !dbg !992 {
entry:
  %Pv = alloca [3900 x i64], align 8
    #dbg_value(ptr %p, !995, !DIExpression(), !996)
    #dbg_value(ptr %Vdec, !997, !DIExpression(), !996)
    #dbg_value(ptr %L, !998, !DIExpression(), !996)
    #dbg_value(ptr %P1, !999, !DIExpression(), !996)
    #dbg_value(ptr %VL, !1000, !DIExpression(), !996)
    #dbg_value(ptr %VP1V, !1001, !DIExpression(), !996)
    #dbg_value(i32 10, !1002, !DIExpression(), !996)
    #dbg_value(i32 78, !1003, !DIExpression(), !996)
    #dbg_value(i32 8, !1004, !DIExpression(), !996)
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 5, ptr noundef %Vdec, ptr noundef %L, ptr noundef %VL, i32 noundef 10, i32 noundef 78, i32 noundef 8) #4, !dbg !1005
    #dbg_declare(ptr %Pv, !1006, !DIExpression(), !1010)
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200), !dbg !1010
  call fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %Vdec, ptr noundef nonnull %Pv) #4, !dbg !1011
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 5, ptr noundef %Vdec, ptr noundef nonnull %Pv, ptr noundef %VP1V, i32 noundef 10, i32 noundef 78, i32 noundef 10) #4, !dbg !1012
  ret void, !dbg !1013
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %vPv, ptr noundef nonnull %t, ptr noundef nonnull %y) unnamed_addr #0 !dbg !1014 {
entry:
  %temp = alloca [5 x i64], align 8
    #dbg_value(ptr %p, !1017, !DIExpression(), !1018)
    #dbg_value(ptr %vPv, !1019, !DIExpression(), !1018)
    #dbg_value(ptr %t, !1020, !DIExpression(), !1018)
    #dbg_value(ptr %y, !1021, !DIExpression(), !1018)
    #dbg_value(i32 52, !1022, !DIExpression(), !1018)
    #dbg_value(i32 5, !1024, !DIExpression(), !1018)
    #dbg_value(i64 1, !1025, !DIExpression(), !1028)
    #dbg_value(i64 72057594037927936, !1025, !DIExpression(), !1028)
    #dbg_value(i64 72057594037927935, !1025, !DIExpression(), !1028)
    #dbg_value(i32 0, !1029, !DIExpression(), !1031)
  br label %for.cond, !dbg !1032

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1033
    #dbg_value(i32 %i.0, !1029, !DIExpression(), !1031)
  %exitcond = icmp ne i32 %i.0, 100, !dbg !1034
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1036

for.body:                                         ; preds = %for.cond
  %.idx7 = mul nuw nsw i32 %i.0, 40, !dbg !1037
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7, !dbg !1037
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !1037
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1039
  %and = and i64 %1, 72057594037927935, !dbg !1039
  store i64 %and, ptr %arrayidx, align 8, !dbg !1039
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1040
    #dbg_value(i32 %inc, !1029, !DIExpression(), !1031)
  br label %for.cond, !dbg !1041, !llvm.loop !1042

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !1044, !DIExpression(), !1045)
  call void @mayo_memset(ptr %temp, i8 0, i32 40), !dbg !1045
    #dbg_value(ptr %temp, !1046, !DIExpression(), !1018)
    #dbg_value(i32 9, !1047, !DIExpression(), !1049)
  br label %for.cond3, !dbg !1050

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 9, %for.end ], [ %dec78, %for.inc77 ], !dbg !1051
    #dbg_value(i32 %i2.0, !1047, !DIExpression(), !1049)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !1052
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !dbg !1054

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !1055

for.cond81.preheader:                             ; preds = %for.cond3
  br label %for.cond81, !dbg !1058

for.cond6:                                        ; preds = %for.cond6.preheader, %for.inc74
  %j.0 = phi i32 [ %inc75, %for.inc74 ], [ %i2.0, %for.cond6.preheader ], !dbg !1060
    #dbg_value(i32 %j.0, !1061, !DIExpression(), !1062)
  %exitcond10 = icmp ne i32 %j.0, 10, !dbg !1063
  br i1 %exitcond10, label %for.body8, label %for.inc77, !dbg !1055

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1065
  %2 = load i64, ptr %arrayidx9, align 8, !dbg !1065
  %shr = lshr i64 %2, 52, !dbg !1067
  %rem.lhs.trunc = trunc i64 %shr to i8, !dbg !1068
    #dbg_value(i8 %rem1, !1069, !DIExpression(), !1070)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1071
  %shl11 = shl i64 %2, 4, !dbg !1072
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !1072
    #dbg_value(i32 3, !1073, !DIExpression(), !1075)
  br label %for.cond12, !dbg !1076

for.cond12:                                       ; preds = %for.body15, %for.body8
  %k.0 = phi i32 [ 3, %for.body8 ], [ %dec, %for.body15 ], !dbg !1077
    #dbg_value(i32 %k.0, !1073, !DIExpression(), !1075)
  %cmp13 = icmp sgt i32 %k.0, -1, !dbg !1078
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !dbg !1080

for.cond24.preheader:                             ; preds = %for.cond12
  %rem1 = and i8 %rem.lhs.trunc, 15, !dbg !1068
  br label %for.cond24, !dbg !1081

for.body15:                                       ; preds = %for.cond12
  %arrayidx16 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !1083
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !1083
  %shr17 = lshr i64 %3, 60, !dbg !1085
  %add18 = add nuw nsw i32 %k.0, 1, !dbg !1086
  %arrayidx19 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %add18, !dbg !1087
  %4 = load i64, ptr %arrayidx19, align 8, !dbg !1088
  %xor = xor i64 %4, %shr17, !dbg !1088
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !1088
  %arrayidx20 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !1089
  %5 = load i64, ptr %arrayidx20, align 8, !dbg !1090
  %shl21 = shl i64 %5, 4, !dbg !1090
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !1090
  %dec = add nsw i32 %k.0, -1, !dbg !1091
    #dbg_value(i32 %dec, !1073, !DIExpression(), !1075)
  br label %for.cond12, !dbg !1092, !llvm.loop !1093

for.cond24:                                       ; preds = %for.cond24.preheader, %for.inc46
  %jj.0 = phi i32 [ %inc47, %for.inc46 ], [ 0, %for.cond24.preheader ], !dbg !1095
    #dbg_value(i32 %jj.0, !1096, !DIExpression(), !1097)
  %exitcond8 = icmp ne i32 %jj.0, 4, !dbg !1098
  br i1 %exitcond8, label %for.body27, label %for.cond50.preheader, !dbg !1081

for.cond50.preheader:                             ; preds = %for.cond24
  br label %for.cond50, !dbg !1100

for.body27:                                       ; preds = %for.cond24
  %rem28 = and i32 %jj.0, 1, !dbg !1102
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !1105
  br i1 %cmp29, label %if.then, label %if.else, !dbg !1105

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !1106
  %6 = load i8, ptr %arrayidx31, align 1, !dbg !1106
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext %6) #4, !dbg !1108
  %div = lshr exact i32 %jj.0, 1, !dbg !1109
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !1110
  %7 = load i8, ptr %arrayidx33, align 1, !dbg !1111
  %xor356 = xor i8 %7, %call, !dbg !1111
  store i8 %xor356, ptr %arrayidx33, align 1, !dbg !1111
  br label %for.inc46, !dbg !1112

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !1113
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1113
  %call38 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext %8) #4, !dbg !1115
  %shl40 = shl nuw i8 %call38, 4, !dbg !1116
  %div415 = lshr i32 %jj.0, 1, !dbg !1117
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div415, !dbg !1118
  %9 = load i8, ptr %arrayidx42, align 1, !dbg !1119
  %xor44 = xor i8 %shl40, %9, !dbg !1119
  store i8 %xor44, ptr %arrayidx42, align 1, !dbg !1119
  br label %for.inc46

for.inc46:                                        ; preds = %if.then, %if.else
  %inc47 = add nuw nsw i32 %jj.0, 1, !dbg !1120
    #dbg_value(i32 %inc47, !1096, !DIExpression(), !1097)
  br label %for.cond24, !dbg !1121, !llvm.loop !1122

for.cond50:                                       ; preds = %for.cond50.preheader, %for.body53
  %k49.0 = phi i32 [ %inc72, %for.body53 ], [ 0, %for.cond50.preheader ], !dbg !1124
    #dbg_value(i32 %k49.0, !1125, !DIExpression(), !1126)
  %exitcond9 = icmp ne i32 %k49.0, 5, !dbg !1127
  br i1 %exitcond9, label %for.body53, label %for.inc74, !dbg !1100

for.body53:                                       ; preds = %for.cond50
  %mul54 = mul nuw nsw i32 %i2.0, 10, !dbg !1129
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !1131
  %.idx = mul nsw i32 %add55, 40, !dbg !1132
  %10 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !1132
  %arrayidx58 = getelementptr i64, ptr %10, i32 %k49.0, !dbg !1132
  %11 = load i64, ptr %arrayidx58, align 8, !dbg !1132
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !1133
  %mul62 = mul nuw nsw i32 %j.0, 10, !dbg !1134
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !1135
  %.idx4 = mul nsw i32 %add63, 40, !dbg !1136
  %12 = getelementptr i8, ptr %vPv, i32 %.idx4, !dbg !1136
  %arrayidx66 = getelementptr i64, ptr %12, i32 %k49.0, !dbg !1136
  %13 = load i64, ptr %arrayidx66, align 8, !dbg !1136
  %mul67 = select i1 %cmp59.not, i64 0, i64 %13, !dbg !1137
  %xor68 = xor i64 %11, %mul67, !dbg !1138
  %arrayidx69 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k49.0, !dbg !1139
  %14 = load i64, ptr %arrayidx69, align 8, !dbg !1140
  %xor70 = xor i64 %14, %xor68, !dbg !1140
  store i64 %xor70, ptr %arrayidx69, align 8, !dbg !1140
  %inc72 = add nuw nsw i32 %k49.0, 1, !dbg !1141
    #dbg_value(i32 %inc72, !1125, !DIExpression(), !1126)
  br label %for.cond50, !dbg !1142, !llvm.loop !1143

for.inc74:                                        ; preds = %for.cond50
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !1145
    #dbg_value(i32 %inc75, !1061, !DIExpression(), !1062)
  br label %for.cond6, !dbg !1146, !llvm.loop !1147

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !1149
    #dbg_value(i32 %dec78, !1047, !DIExpression(), !1049)
  br label %for.cond3, !dbg !1150, !llvm.loop !1151

for.cond81:                                       ; preds = %for.cond81.preheader, %for.body84
  %i80.0 = phi i32 [ %add106, %for.body84 ], [ 0, %for.cond81.preheader ], !dbg !1153
    #dbg_value(i32 %i80.0, !1154, !DIExpression(), !1155)
  %cmp82 = icmp samesign ult i32 %i80.0, 78, !dbg !1156
  br i1 %cmp82, label %for.body84, label %for.end107, !dbg !1058

for.body84:                                       ; preds = %for.cond81
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !1158
  %15 = load i8, ptr %arrayidx85, align 1, !dbg !1158
  %div87 = lshr exact i32 %i80.0, 1, !dbg !1160
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !1161
  %16 = load i8, ptr %arrayidx88, align 1, !dbg !1161
  %17 = and i8 %16, 15, !dbg !1162
  %xor912 = xor i8 %15, %17, !dbg !1163
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !1164
  store i8 %xor912, ptr %arrayidx93, align 1, !dbg !1165
  %add94 = or disjoint i32 %i80.0, 1, !dbg !1166
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !1167
  %18 = load i8, ptr %arrayidx95, align 1, !dbg !1167
  %div97 = lshr exact i32 %i80.0, 1, !dbg !1168
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97, !dbg !1169
  %19 = load i8, ptr %arrayidx98, align 1, !dbg !1169
  %20 = lshr i8 %19, 4, !dbg !1170
  %xor1013 = xor i8 %18, %20, !dbg !1171
  %add103 = or disjoint i32 %i80.0, 1, !dbg !1172
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !1173
  store i8 %xor1013, ptr %arrayidx104, align 1, !dbg !1174
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !1175
    #dbg_value(i32 %add106, !1154, !DIExpression(), !1155)
  br label %for.cond81, !dbg !1176, !llvm.loop !1177

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !1179
}

; Function Attrs: nounwind
define internal fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %VtL, ptr noundef nonnull %A_out) unnamed_addr #0 !dbg !1180 {
entry:
  %A = alloca [800 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !1183, !DIExpression(), !1184)
    #dbg_value(ptr %VtL, !1185, !DIExpression(), !1184)
    #dbg_value(ptr %A_out, !1186, !DIExpression(), !1184)
    #dbg_value(i32 0, !1187, !DIExpression(), !1184)
    #dbg_value(i32 0, !1188, !DIExpression(), !1184)
    #dbg_value(i32 5, !1189, !DIExpression(), !1184)
    #dbg_declare(ptr %A, !1190, !DIExpression(), !1194)
  call void @mayo_memset(ptr %A, i8 0, i32 6400), !dbg !1194
    #dbg_value(i32 80, !1195, !DIExpression(), !1184)
    #dbg_value(i64 1, !1196, !DIExpression(), !1199)
    #dbg_value(i64 72057594037927936, !1196, !DIExpression(), !1199)
    #dbg_value(i64 72057594037927935, !1196, !DIExpression(), !1199)
    #dbg_value(i32 0, !1200, !DIExpression(), !1202)
  br label %for.cond, !dbg !1203

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1204
    #dbg_value(i32 %i.0, !1200, !DIExpression(), !1202)
  %exitcond = icmp ne i32 %i.0, 80, !dbg !1205
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !1207

for.cond3.preheader:                              ; preds = %for.cond
  br label %for.cond3, !dbg !1208

for.body:                                         ; preds = %for.cond
  %.idx = mul nuw nsw i32 %i.0, 40, !dbg !1210
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx, !dbg !1210
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !1210
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1212
  %and = and i64 %1, 72057594037927935, !dbg !1212
  store i64 %and, ptr %arrayidx, align 8, !dbg !1212
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1213
    #dbg_value(i32 %inc, !1200, !DIExpression(), !1202)
  br label %for.cond, !dbg !1214, !llvm.loop !1215

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc103
  %i2.0 = phi i32 [ %inc104, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !1217
  %words_to_shift.0 = phi i32 [ %words_to_shift.1.lcssa, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !1218
  %bits_to_shift.0 = phi i32 [ %bits_to_shift.1.lcssa, %for.inc103 ], [ 0, %for.cond3.preheader ], !dbg !1219
    #dbg_value(i32 %bits_to_shift.0, !1187, !DIExpression(), !1184)
    #dbg_value(i32 %words_to_shift.0, !1188, !DIExpression(), !1184)
    #dbg_value(i32 %i2.0, !1220, !DIExpression(), !1221)
  %exitcond8 = icmp ne i32 %i2.0, 10, !dbg !1222
  br i1 %exitcond8, label %for.cond6.preheader, label %for.cond107.preheader, !dbg !1208

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !1224

for.cond107.preheader:                            ; preds = %for.cond3
  br label %for.cond107, !dbg !1227

for.cond6:                                        ; preds = %for.cond6.preheader, %if.end95
  %j.0 = phi i32 [ %dec, %if.end95 ], [ 9, %for.cond6.preheader ], !dbg !1229
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end95 ], [ %words_to_shift.0, %for.cond6.preheader ], !dbg !1184
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end95 ], [ %bits_to_shift.0, %for.cond6.preheader ], !dbg !1184
    #dbg_value(i32 %bits_to_shift.1, !1187, !DIExpression(), !1184)
    #dbg_value(i32 %words_to_shift.1, !1188, !DIExpression(), !1184)
    #dbg_value(i32 %j.0, !1230, !DIExpression(), !1231)
  %cmp7.not = icmp slt i32 %j.0, %i2.0, !dbg !1232
  br i1 %cmp7.not, label %for.inc103, label %for.body8, !dbg !1224

for.body8:                                        ; preds = %for.cond6
  %add.ptr.idx = mul nsw i32 %j.0, 320, !dbg !1234
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !1234
    #dbg_value(ptr %add.ptr, !1236, !DIExpression(), !1184)
    #dbg_value(i32 0, !1237, !DIExpression(), !1239)
  br label %for.cond11, !dbg !1240

for.cond11:                                       ; preds = %for.inc44, %for.body8
  %c.0 = phi i32 [ 0, %for.body8 ], [ %inc45, %for.inc44 ], !dbg !1241
    #dbg_value(i32 %c.0, !1237, !DIExpression(), !1239)
  %exitcond5 = icmp ne i32 %c.0, 8, !dbg !1242
  br i1 %exitcond5, label %for.cond14.preheader, label %for.end46, !dbg !1244

for.cond14.preheader:                             ; preds = %for.cond11
  br label %for.cond14, !dbg !1245

for.cond14:                                       ; preds = %for.cond14.preheader, %for.inc41
  %k.0 = phi i32 [ %inc42, %for.inc41 ], [ 0, %for.cond14.preheader ], !dbg !1248
    #dbg_value(i32 %k.0, !1249, !DIExpression(), !1250)
  %exitcond4 = icmp ne i32 %k.0, 5, !dbg !1251
  br i1 %exitcond4, label %for.body16, label %for.inc44, !dbg !1245

for.body16:                                       ; preds = %for.cond14
  %2 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0, !dbg !1253
  %arrayidx19.idx = mul nuw nsw i32 %c.0, 40, !dbg !1253
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %2, i32 %arrayidx19.idx, !dbg !1253
  %3 = load i64, ptr %arrayidx19, align 8, !dbg !1253
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1255
  %shl20 = shl i64 %3, %sh_prom, !dbg !1255
  %mul21 = shl nuw nsw i32 %i2.0, 3, !dbg !1256
  %add22 = or disjoint i32 %mul21, %c.0, !dbg !1257
  %add23 = add nsw i32 %k.0, %words_to_shift.1, !dbg !1258
  %mul24 = mul i32 %add23, 80, !dbg !1259
  %add25 = add i32 %add22, %mul24, !dbg !1260
  %arrayidx26 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25, !dbg !1261
  %4 = load i64, ptr %arrayidx26, align 8, !dbg !1262
  %xor = xor i64 %4, %shl20, !dbg !1262
  store i64 %xor, ptr %arrayidx26, align 8, !dbg !1262
  %cmp27 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1263
  br i1 %cmp27, label %if.then, label %for.inc41, !dbg !1263

if.then:                                          ; preds = %for.body16
  %5 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0, !dbg !1265
  %arrayidx30.idx = mul nuw nsw i32 %c.0, 40, !dbg !1265
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 %arrayidx30.idx, !dbg !1265
  %6 = load i64, ptr %arrayidx30, align 8, !dbg !1265
  %sub31 = sub nsw i32 64, %bits_to_shift.1, !dbg !1267
  %sh_prom32 = zext nneg i32 %sub31 to i64, !dbg !1268
  %shr = lshr i64 %6, %sh_prom32, !dbg !1268
  %mul33 = shl nuw nsw i32 %i2.0, 3, !dbg !1269
  %add34 = or disjoint i32 %mul33, %c.0, !dbg !1270
  %add35 = add nsw i32 %k.0, %words_to_shift.1, !dbg !1271
  %7 = mul i32 %add35, 80, !dbg !1272
  %mul37 = add i32 %7, 80, !dbg !1272
  %add38 = add i32 %add34, %mul37, !dbg !1273
  %arrayidx39 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38, !dbg !1274
  %8 = load i64, ptr %arrayidx39, align 8, !dbg !1275
  %xor40 = xor i64 %8, %shr, !dbg !1275
  store i64 %xor40, ptr %arrayidx39, align 8, !dbg !1275
  br label %for.inc41, !dbg !1276

for.inc41:                                        ; preds = %for.body16, %if.then
  %inc42 = add nuw nsw i32 %k.0, 1, !dbg !1277
    #dbg_value(i32 %inc42, !1249, !DIExpression(), !1250)
  br label %for.cond14, !dbg !1278, !llvm.loop !1279

for.inc44:                                        ; preds = %for.cond14
  %inc45 = add nuw nsw i32 %c.0, 1, !dbg !1281
    #dbg_value(i32 %inc45, !1237, !DIExpression(), !1239)
  br label %for.cond11, !dbg !1282, !llvm.loop !1283

for.end46:                                        ; preds = %for.cond11
  %cmp47.not = icmp eq i32 %i2.0, %j.0, !dbg !1285
  br i1 %cmp47.not, label %if.end95, label %if.then48, !dbg !1285

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.0, 320, !dbg !1287
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx, !dbg !1287
    #dbg_value(ptr %add.ptr51, !1289, !DIExpression(), !1184)
    #dbg_value(i32 0, !1290, !DIExpression(), !1292)
  br label %for.cond53, !dbg !1293

for.cond53:                                       ; preds = %for.inc92, %if.then48
  %c52.0 = phi i32 [ 0, %if.then48 ], [ %inc93, %for.inc92 ], !dbg !1294
    #dbg_value(i32 %c52.0, !1290, !DIExpression(), !1292)
  %exitcond7 = icmp ne i32 %c52.0, 8, !dbg !1295
  br i1 %exitcond7, label %for.cond57.preheader, label %if.end95.loopexit, !dbg !1297

for.cond57.preheader:                             ; preds = %for.cond53
  br label %for.cond57, !dbg !1298

for.cond57:                                       ; preds = %for.cond57.preheader, %for.inc89
  %k56.0 = phi i32 [ %inc90, %for.inc89 ], [ 0, %for.cond57.preheader ], !dbg !1301
    #dbg_value(i32 %k56.0, !1302, !DIExpression(), !1303)
  %exitcond6 = icmp ne i32 %k56.0, 5, !dbg !1304
  br i1 %exitcond6, label %for.body59, label %for.inc92, !dbg !1298

for.body59:                                       ; preds = %for.cond57
  %9 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0, !dbg !1306
  %arrayidx62.idx = mul nuw nsw i32 %c52.0, 40, !dbg !1306
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %9, i32 %arrayidx62.idx, !dbg !1306
  %10 = load i64, ptr %arrayidx62, align 8, !dbg !1306
  %sh_prom63 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1308
  %shl64 = shl i64 %10, %sh_prom63, !dbg !1308
  %mul65 = shl nsw i32 %j.0, 3, !dbg !1309
  %add66 = or disjoint i32 %mul65, %c52.0, !dbg !1310
  %add67 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !1311
  %mul68 = mul i32 %add67, 80, !dbg !1312
  %add69 = add i32 %add66, %mul68, !dbg !1313
  %arrayidx70 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69, !dbg !1314
  %11 = load i64, ptr %arrayidx70, align 8, !dbg !1315
  %xor71 = xor i64 %11, %shl64, !dbg !1315
  store i64 %xor71, ptr %arrayidx70, align 8, !dbg !1315
  %cmp72 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1316
  br i1 %cmp72, label %if.then73, label %for.inc89, !dbg !1316

if.then73:                                        ; preds = %for.body59
  %12 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0, !dbg !1318
  %arrayidx76.idx = mul nuw nsw i32 %c52.0, 40, !dbg !1318
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %12, i32 %arrayidx76.idx, !dbg !1318
  %13 = load i64, ptr %arrayidx76, align 8, !dbg !1318
  %sub77 = sub nsw i32 64, %bits_to_shift.1, !dbg !1320
  %sh_prom78 = zext nneg i32 %sub77 to i64, !dbg !1321
  %shr79 = lshr i64 %13, %sh_prom78, !dbg !1321
  %mul80 = shl nsw i32 %j.0, 3, !dbg !1322
  %add81 = or disjoint i32 %mul80, %c52.0, !dbg !1323
  %add82 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !1324
  %14 = mul i32 %add82, 80, !dbg !1325
  %mul84 = add i32 %14, 80, !dbg !1325
  %add85 = add i32 %add81, %mul84, !dbg !1326
  %arrayidx86 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85, !dbg !1327
  %15 = load i64, ptr %arrayidx86, align 8, !dbg !1328
  %xor87 = xor i64 %15, %shr79, !dbg !1328
  store i64 %xor87, ptr %arrayidx86, align 8, !dbg !1328
  br label %for.inc89, !dbg !1329

for.inc89:                                        ; preds = %for.body59, %if.then73
  %inc90 = add nuw nsw i32 %k56.0, 1, !dbg !1330
    #dbg_value(i32 %inc90, !1302, !DIExpression(), !1303)
  br label %for.cond57, !dbg !1331, !llvm.loop !1332

for.inc92:                                        ; preds = %for.cond57
  %inc93 = add nuw nsw i32 %c52.0, 1, !dbg !1334
    #dbg_value(i32 %inc93, !1290, !DIExpression(), !1292)
  br label %for.cond53, !dbg !1335, !llvm.loop !1336

if.end95.loopexit:                                ; preds = %for.cond53
  br label %if.end95, !dbg !1338

if.end95:                                         ; preds = %if.end95.loopexit, %for.end46
  %add96 = add nsw i32 %bits_to_shift.1, 4, !dbg !1338
    #dbg_value(i32 %add96, !1187, !DIExpression(), !1184)
  %cmp97 = icmp eq i32 %add96, 64, !dbg !1339
  %inc99 = zext i1 %cmp97 to i32, !dbg !1339
  %spec.select = add nsw i32 %words_to_shift.1, %inc99, !dbg !1339
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96, !dbg !1339
    #dbg_value(i32 %spec.select3, !1187, !DIExpression(), !1184)
    #dbg_value(i32 %spec.select, !1188, !DIExpression(), !1184)
  %dec = add nsw i32 %j.0, -1, !dbg !1341
    #dbg_value(i32 %dec, !1230, !DIExpression(), !1231)
  br label %for.cond6, !dbg !1342, !llvm.loop !1343

for.inc103:                                       ; preds = %for.cond6
  %words_to_shift.1.lcssa = phi i32 [ %words_to_shift.1, %for.cond6 ], !dbg !1184
  %bits_to_shift.1.lcssa = phi i32 [ %bits_to_shift.1, %for.cond6 ], !dbg !1184
  %inc104 = add nuw nsw i32 %i2.0, 1, !dbg !1345
    #dbg_value(i32 %inc104, !1220, !DIExpression(), !1221)
  br label %for.cond3, !dbg !1346, !llvm.loop !1347

for.cond107:                                      ; preds = %for.cond107.preheader, %for.body110
  %c106.0 = phi i32 [ %add113, %for.body110 ], [ 0, %for.cond107.preheader ], !dbg !1349
    #dbg_value(i32 %c106.0, !1350, !DIExpression(), !1349)
  %cmp109 = icmp samesign ult i32 %c106.0, 720, !dbg !1351
  br i1 %cmp109, label %for.body110, label %for.end114, !dbg !1227

for.body110:                                      ; preds = %for.cond107
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.0, !dbg !1353
  call fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %add.ptr111) #4, !dbg !1355
  %add113 = add nuw nsw i32 %c106.0, 16, !dbg !1356
    #dbg_value(i32 %add113, !1350, !DIExpression(), !1349)
  br label %for.cond107, !dbg !1357, !llvm.loop !1358

for.end114:                                       ; preds = %for.cond107
    #dbg_declare(ptr %tab, !1360, !DIExpression(), !1361)
  call void @mayo_memset(ptr %tab, i8 0, i32 16), !dbg !1361
    #dbg_value(i32 0, !1362, !DIExpression(), !1364)
  br label %for.cond116, !dbg !1365

for.cond116:                                      ; preds = %for.body118, %for.end114
  %i115.0 = phi i32 [ 0, %for.end114 ], [ %inc138, %for.body118 ], !dbg !1366
    #dbg_value(i32 %i115.0, !1362, !DIExpression(), !1364)
  %exitcond9 = icmp ne i32 %i115.0, 4, !dbg !1367
  br i1 %exitcond9, label %for.body118, label %for.cond141.preheader, !dbg !1369

for.cond141.preheader:                            ; preds = %for.cond116
  br label %for.cond141, !dbg !1370

for.body118:                                      ; preds = %for.cond116
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1372
  %16 = load i8, ptr %arrayidx119, align 1, !dbg !1372
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %16, i8 noundef zeroext 1) #4, !dbg !1374
  %mul120 = shl nuw nsw i32 %i115.0, 2, !dbg !1375
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120, !dbg !1376
  store i8 %call, ptr %arrayidx121, align 1, !dbg !1377
  %call123 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %16, i8 noundef zeroext 2) #4, !dbg !1378
  %mul124 = shl nuw nsw i32 %i115.0, 2, !dbg !1379
  %add125 = or disjoint i32 %mul124, 1, !dbg !1380
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125, !dbg !1381
  store i8 %call123, ptr %arrayidx126, align 1, !dbg !1382
  %arrayidx127 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1383
  %17 = load i8, ptr %arrayidx127, align 1, !dbg !1383
  %call128 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %17, i8 noundef zeroext 4) #4, !dbg !1384
  %mul129 = shl nuw nsw i32 %i115.0, 2, !dbg !1385
  %add130 = or disjoint i32 %mul129, 2, !dbg !1386
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130, !dbg !1387
  store i8 %call128, ptr %arrayidx131, align 1, !dbg !1388
  %arrayidx132 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1389
  %18 = load i8, ptr %arrayidx132, align 1, !dbg !1389
  %call133 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %18, i8 noundef zeroext 8) #4, !dbg !1390
  %mul134 = shl nuw nsw i32 %i115.0, 2, !dbg !1391
  %add135 = or disjoint i32 %mul134, 3, !dbg !1392
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135, !dbg !1393
  store i8 %call133, ptr %arrayidx136, align 1, !dbg !1394
  %inc138 = add nuw nsw i32 %i115.0, 1, !dbg !1395
    #dbg_value(i32 %inc138, !1362, !DIExpression(), !1364)
  br label %for.cond116, !dbg !1396, !llvm.loop !1397

for.cond141:                                      ; preds = %for.cond141.preheader, %for.inc203
  %c140.0 = phi i32 [ %add204, %for.inc203 ], [ 0, %for.cond141.preheader ], !dbg !1399
    #dbg_value(i32 %c140.0, !1400, !DIExpression(), !1401)
  %cmp142 = icmp samesign ult i32 %c140.0, 80, !dbg !1402
  br i1 %cmp142, label %for.cond144.preheader, label %for.cond207.preheader, !dbg !1370

for.cond144.preheader:                            ; preds = %for.cond141
  br label %for.cond144, !dbg !1404

for.cond207.preheader:                            ; preds = %for.cond141
  br label %for.cond207, !dbg !1407

for.cond144:                                      ; preds = %for.cond144.preheader, %for.inc200
  %r.0 = phi i32 [ %inc201, %for.inc200 ], [ 78, %for.cond144.preheader ], !dbg !1409
    #dbg_value(i32 %r.0, !1410, !DIExpression(), !1409)
  %exitcond11 = icmp ne i32 %r.0, 133, !dbg !1411
  br i1 %exitcond11, label %for.body146, label %for.inc203, !dbg !1404

for.body146:                                      ; preds = %for.cond144
  %div1 = lshr i32 %r.0, 4, !dbg !1413
  %mul147 = mul nuw nsw i32 %div1, 80, !dbg !1415
  %add148 = add nuw nsw i32 %mul147, %c140.0, !dbg !1416
  %rem = and i32 %r.0, 15, !dbg !1417
  %add149 = or disjoint i32 %add148, %rem, !dbg !1418
    #dbg_value(i32 %add149, !1419, !DIExpression(), !1420)
  %arrayidx150 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !1421
  %19 = load i64, ptr %arrayidx150, align 8, !dbg !1421
  %and151 = and i64 %19, 1229782938247303441, !dbg !1422
    #dbg_value(i64 %and151, !1423, !DIExpression(), !1420)
  %shr153 = lshr i64 %19, 1, !dbg !1424
  %and154 = and i64 %shr153, 1229782938247303441, !dbg !1425
    #dbg_value(i64 %and154, !1426, !DIExpression(), !1420)
  %shr156 = lshr i64 %19, 2, !dbg !1427
  %and157 = and i64 %shr156, 1229782938247303441, !dbg !1428
    #dbg_value(i64 %and157, !1429, !DIExpression(), !1420)
  %arrayidx158 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !1430
  %20 = load i64, ptr %arrayidx158, align 8, !dbg !1430
  %shr159 = lshr i64 %20, 3, !dbg !1431
  %and160 = and i64 %shr159, 1229782938247303441, !dbg !1432
    #dbg_value(i64 %and160, !1433, !DIExpression(), !1420)
    #dbg_value(i32 0, !1434, !DIExpression(), !1436)
  br label %for.cond161, !dbg !1437

for.cond161:                                      ; preds = %for.body163, %for.body146
  %t.0 = phi i32 [ 0, %for.body146 ], [ %inc198, %for.body163 ], !dbg !1438
    #dbg_value(i32 %t.0, !1434, !DIExpression(), !1436)
  %exitcond10 = icmp ne i32 %t.0, 4, !dbg !1439
  br i1 %exitcond10, label %for.body163, label %for.inc200, !dbg !1441

for.body163:                                      ; preds = %for.cond161
  %mul164 = shl nuw nsw i32 %t.0, 2, !dbg !1442
  %arrayidx166 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul164, !dbg !1444
  %21 = load i8, ptr %arrayidx166, align 1, !dbg !1444
  %conv = zext i8 %21 to i64, !dbg !1444
  %mul167 = mul i64 %and151, %conv, !dbg !1445
  %mul168 = shl nuw nsw i32 %t.0, 2, !dbg !1446
  %add169 = or disjoint i32 %mul168, 1, !dbg !1447
  %arrayidx170 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add169, !dbg !1448
  %22 = load i8, ptr %arrayidx170, align 1, !dbg !1448
  %conv171 = zext i8 %22 to i64, !dbg !1448
  %mul172 = mul i64 %and154, %conv171, !dbg !1449
  %xor173 = xor i64 %mul167, %mul172, !dbg !1450
  %mul174 = shl nuw nsw i32 %t.0, 2, !dbg !1451
  %add175 = or disjoint i32 %mul174, 2, !dbg !1452
  %arrayidx176 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add175, !dbg !1453
  %23 = load i8, ptr %arrayidx176, align 1, !dbg !1453
  %conv177 = zext i8 %23 to i64, !dbg !1453
  %mul178 = mul i64 %and157, %conv177, !dbg !1454
  %xor179 = xor i64 %xor173, %mul178, !dbg !1455
  %mul180 = shl nuw nsw i32 %t.0, 2, !dbg !1456
  %add181 = or disjoint i32 %mul180, 3, !dbg !1457
  %arrayidx182 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add181, !dbg !1458
  %24 = load i8, ptr %arrayidx182, align 1, !dbg !1458
  %conv183 = zext i8 %24 to i64, !dbg !1458
  %mul184 = mul i64 %and160, %conv183, !dbg !1459
  %xor185 = xor i64 %xor179, %mul184, !dbg !1460
  %add186 = add nuw nsw i32 %r.0, %t.0, !dbg !1461
  %sub187 = add nsw i32 %add186, -78, !dbg !1462
  %div1882 = lshr i32 %sub187, 4, !dbg !1463
  %mul189 = mul i32 %div1882, 80, !dbg !1464
  %add190 = add i32 %mul189, %c140.0, !dbg !1465
  %add191 = add nuw nsw i32 %r.0, %t.0, !dbg !1466
  %sub192 = add nuw nsw i32 %add191, 2, !dbg !1467
  %rem193 = and i32 %sub192, 15, !dbg !1468
  %add194 = or disjoint i32 %add190, %rem193, !dbg !1469
  %arrayidx195 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194, !dbg !1470
  %25 = load i64, ptr %arrayidx195, align 8, !dbg !1471
  %xor196 = xor i64 %25, %xor185, !dbg !1471
  store i64 %xor196, ptr %arrayidx195, align 8, !dbg !1471
  %inc198 = add nuw nsw i32 %t.0, 1, !dbg !1472
    #dbg_value(i32 %inc198, !1434, !DIExpression(), !1436)
  br label %for.cond161, !dbg !1473, !llvm.loop !1474

for.inc200:                                       ; preds = %for.cond161
  %inc201 = add nuw nsw i32 %r.0, 1, !dbg !1476
    #dbg_value(i32 %inc201, !1410, !DIExpression(), !1409)
  br label %for.cond144, !dbg !1477, !llvm.loop !1478

for.inc203:                                       ; preds = %for.cond144
  %add204 = add nuw nsw i32 %c140.0, 16, !dbg !1480
    #dbg_value(i32 %add204, !1400, !DIExpression(), !1401)
  br label %for.cond141, !dbg !1481, !llvm.loop !1482

for.cond207:                                      ; preds = %for.cond207.preheader, %for.inc241
  %indvars.iv = phi i32 [ 78, %for.cond207.preheader ], [ %indvars.iv.next, %for.inc241 ], !dbg !1484
  %r206.0 = phi i32 [ %add242, %for.inc241 ], [ 0, %for.cond207.preheader ], !dbg !1484
    #dbg_value(i32 %r206.0, !1485, !DIExpression(), !1486)
  %cmp208 = icmp samesign ult i32 %r206.0, 78, !dbg !1487
  br i1 %cmp208, label %for.cond212.preheader, label %for.end243, !dbg !1407

for.cond212.preheader:                            ; preds = %for.cond207
  br label %for.cond212, !dbg !1489

for.cond212:                                      ; preds = %for.cond212.preheader, %for.inc238
  %c211.0 = phi i32 [ %add239, %for.inc238 ], [ 0, %for.cond212.preheader ], !dbg !1492
    #dbg_value(i32 %c211.0, !1493, !DIExpression(), !1494)
  %cmp213 = icmp samesign ult i32 %c211.0, 80, !dbg !1495
  br i1 %cmp213, label %for.cond217.preheader, label %for.inc241, !dbg !1489

for.cond217.preheader:                            ; preds = %for.cond212
  br label %for.cond217, !dbg !1497

for.cond217:                                      ; preds = %for.cond217.preheader, %for.body221
  %i216.0 = phi i32 [ %inc236, %for.body221 ], [ 0, %for.cond217.preheader ], !dbg !1500
    #dbg_value(i32 %i216.0, !1501, !DIExpression(), !1502)
  %exitcond12 = icmp ne i32 %i216.0, %indvars.iv, !dbg !1503
  br i1 %exitcond12, label %for.body221, label %for.inc238, !dbg !1497

for.body221:                                      ; preds = %for.cond217
  %div223 = mul nuw nsw i32 %r206.0, 5, !dbg !1505
  %add224 = add nuw nsw i32 %div223, %c211.0, !dbg !1507
  %add225 = add nuw nsw i32 %add224, %i216.0, !dbg !1508
  %arrayidx226 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225, !dbg !1509
  %add227 = add nuw nsw i32 %r206.0, %i216.0, !dbg !1510
  %mul228 = mul nuw nsw i32 %add227, 81, !dbg !1511
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228, !dbg !1512
  %add.ptr230 = getelementptr inbounds nuw i8, ptr %add.ptr229, i32 %c211.0, !dbg !1513
  %cmp232 = icmp samesign ult i32 %c211.0, 64, !dbg !1514
  %sub234 = sub nuw nsw i32 80, %c211.0, !dbg !1514
  %cond = select i1 %cmp232, i32 16, i32 %sub234, !dbg !1514
  call fastcc void @decode(ptr noundef nonnull %arrayidx226, ptr noundef nonnull %add.ptr230, i32 noundef %cond) #4, !dbg !1515
  %inc236 = add nuw nsw i32 %i216.0, 1, !dbg !1516
    #dbg_value(i32 %inc236, !1501, !DIExpression(), !1502)
  br label %for.cond217, !dbg !1517, !llvm.loop !1518

for.inc238:                                       ; preds = %for.cond217
  %add239 = add nuw nsw i32 %c211.0, 16, !dbg !1520
    #dbg_value(i32 %add239, !1493, !DIExpression(), !1494)
  br label %for.cond212, !dbg !1521, !llvm.loop !1522

for.inc241:                                       ; preds = %for.cond212
  %add242 = add nuw nsw i32 %r206.0, 16, !dbg !1524
    #dbg_value(i32 %add242, !1485, !DIExpression(), !1486)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !1525
  br label %for.cond207, !dbg !1525, !llvm.loop !1526

for.end243:                                       ; preds = %for.cond207
  ret void, !dbg !1528
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: nounwind
define internal fastcc void @mat_mul(ptr noundef nonnull %a, ptr noundef nonnull %b, ptr noundef nonnull %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !1529 {
entry:
    #dbg_value(ptr %a, !1532, !DIExpression(), !1533)
    #dbg_value(ptr %b, !1534, !DIExpression(), !1533)
    #dbg_value(ptr %c, !1535, !DIExpression(), !1533)
    #dbg_value(i32 8, !1536, !DIExpression(), !1533)
    #dbg_value(i32 78, !1537, !DIExpression(), !1533)
    #dbg_value(i32 1, !1538, !DIExpression(), !1533)
    #dbg_value(i32 0, !1539, !DIExpression(), !1541)
  br label %for.cond, !dbg !1542

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !1543
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1.lcssa, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !1532, !DIExpression(), !1533)
    #dbg_value(ptr %c.addr.0, !1535, !DIExpression(), !1533)
    #dbg_value(i32 %i.0, !1539, !DIExpression(), !1541)
  %exitcond = icmp ne i32 %i.0, 78, !dbg !1544
  br i1 %exitcond, label %for.cond1.preheader, label %for.end7, !dbg !1546

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1547

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond1.preheader ]
  %cmp2 = phi i1 [ false, %for.body3 ], [ true, %for.cond1.preheader ], !dbg !1550
    #dbg_value(i32 poison, !1551, !DIExpression(), !1552)
    #dbg_value(ptr %c.addr.1, !1535, !DIExpression(), !1533)
  br i1 %cmp2, label %for.body3, label %for.inc4, !dbg !1547

for.body3:                                        ; preds = %for.cond1
  %call = call fastcc zeroext i8 @lincomb(ptr noundef %a.addr.0, ptr noundef %b, i32 noundef 8, i32 noundef 1) #4, !dbg !1553
  store i8 %call, ptr %c.addr.1, align 1, !dbg !1556
    #dbg_value(i32 1, !1551, !DIExpression(), !1552)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !1557
    #dbg_value(ptr %incdec.ptr, !1535, !DIExpression(), !1533)
  br label %for.cond1, !dbg !1558, !llvm.loop !1559

for.inc4:                                         ; preds = %for.cond1
  %c.addr.1.lcssa = phi ptr [ %c.addr.1, %for.cond1 ]
  %inc5 = add nuw nsw i32 %i.0, 1, !dbg !1561
    #dbg_value(i32 %inc5, !1539, !DIExpression(), !1541)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 8, !dbg !1562
    #dbg_value(ptr %add.ptr6, !1532, !DIExpression(), !1533)
  br label %for.cond, !dbg !1563, !llvm.loop !1564

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !1566
}

; Function Attrs: nounwind
define internal fastcc void @mat_add(ptr noundef nonnull %a, ptr noundef nonnull %b, ptr noundef nonnull %c, i32 noundef %m, i32 noundef %n) unnamed_addr #0 !dbg !1567 {
entry:
    #dbg_value(ptr %a, !1570, !DIExpression(), !1571)
    #dbg_value(ptr %b, !1572, !DIExpression(), !1571)
    #dbg_value(ptr %c, !1573, !DIExpression(), !1571)
    #dbg_value(i32 78, !1574, !DIExpression(), !1571)
    #dbg_value(i32 1, !1575, !DIExpression(), !1571)
    #dbg_value(i32 0, !1576, !DIExpression(), !1578)
  br label %for.cond, !dbg !1579

for.cond:                                         ; preds = %for.body3, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.body3 ], !dbg !1580
    #dbg_value(i32 %i.0, !1576, !DIExpression(), !1578)
  %exitcond = icmp ne i32 %i.0, 78, !dbg !1581
  br i1 %exitcond, label %for.body3, label %for.end13, !dbg !1583

for.body3:                                        ; preds = %for.cond
    #dbg_value(i32 poison, !1584, !DIExpression(), !1587)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1588
  %0 = load i8, ptr %add.ptr, align 1, !dbg !1591
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1592
  %1 = load i8, ptr %add.ptr6, align 1, !dbg !1593
  %call = call fastcc zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #4, !dbg !1594
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %c, i32 %i.0, !dbg !1595
  store i8 %call, ptr %add.ptr9, align 1, !dbg !1596
    #dbg_value(i32 1, !1584, !DIExpression(), !1587)
    #dbg_value(i32 poison, !1584, !DIExpression(), !1587)
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1597
    #dbg_value(i32 %inc12, !1576, !DIExpression(), !1578)
  br label %for.cond, !dbg !1598, !llvm.loop !1599

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1601
}

; Function Attrs: nounwind
define internal fastcc void @encode(ptr noundef nonnull %m, ptr noundef %menc, i32 noundef %mlen) unnamed_addr #0 !dbg !1602 {
entry:
    #dbg_value(ptr %m, !1603, !DIExpression(), !1604)
    #dbg_value(ptr %menc, !1605, !DIExpression(), !1604)
    #dbg_value(i32 860, !1606, !DIExpression(), !1604)
    #dbg_value(i32 0, !1607, !DIExpression(), !1604)
  br label %for.cond, !dbg !1608

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1610
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr3, %for.body ]
    #dbg_value(ptr %m.addr.0, !1603, !DIExpression(), !1604)
    #dbg_value(i32 %i.0, !1607, !DIExpression(), !1604)
  %exitcond = icmp ne i32 %i.0, 430, !dbg !1611
  br i1 %exitcond, label %for.body, label %if.end, !dbg !1613

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %m.addr.0, align 1, !dbg !1614
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 1, !dbg !1616
  %1 = load i8, ptr %add.ptr, align 1, !dbg !1617
  %shl = shl i8 %1, 4, !dbg !1618
  %or = or i8 %shl, %0, !dbg !1619
  %arrayidx = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1620
  store i8 %or, ptr %arrayidx, align 1, !dbg !1621
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1622
    #dbg_value(i32 %inc, !1607, !DIExpression(), !1604)
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 2, !dbg !1623
    #dbg_value(ptr %add.ptr3, !1603, !DIExpression(), !1604)
  br label %for.cond, !dbg !1624, !llvm.loop !1625

if.end:                                           ; preds = %for.cond
  ret void, !dbg !1627
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1628 {
entry:
    #dbg_value(i8 %a, !1631, !DIExpression(), !1632)
    #dbg_value(i8 %b, !1633, !DIExpression(), !1632)
  %xor1 = xor i8 %a, %b, !dbg !1634
  ret i8 %xor1, !dbg !1635
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb(ptr noundef nonnull %a, ptr noundef nonnull %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !1636 {
entry:
    #dbg_value(ptr %a, !1639, !DIExpression(), !1640)
    #dbg_value(ptr %b, !1641, !DIExpression(), !1640)
    #dbg_value(i32 8, !1642, !DIExpression(), !1640)
    #dbg_value(i32 1, !1643, !DIExpression(), !1640)
    #dbg_value(i8 0, !1644, !DIExpression(), !1640)
    #dbg_value(i32 0, !1645, !DIExpression(), !1647)
  br label %for.cond, !dbg !1648

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !1640
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1649
    #dbg_value(i32 %i.0, !1645, !DIExpression(), !1647)
    #dbg_value(ptr %b.addr.0, !1641, !DIExpression(), !1640)
    #dbg_value(i8 %ret.0, !1644, !DIExpression(), !1640)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !1650
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1652

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1653
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1653
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !1655
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #4, !dbg !1656
  %call1 = call fastcc zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #4, !dbg !1657
    #dbg_value(i8 %call1, !1644, !DIExpression(), !1640)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1658
    #dbg_value(i32 %inc, !1645, !DIExpression(), !1647)
  %add.ptr = getelementptr inbounds nuw i8, ptr %b.addr.0, i32 1, !dbg !1659
    #dbg_value(ptr %add.ptr, !1641, !DIExpression(), !1640)
  br label %for.cond, !dbg !1660, !llvm.loop !1661

for.end:                                          ; preds = %for.cond
  %ret.0.lcssa = phi i8 [ %ret.0, %for.cond ], !dbg !1640
  ret i8 %ret.0.lcssa, !dbg !1663
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1664 {
entry:
    #dbg_value(i8 %a, !1665, !DIExpression(), !1666)
    #dbg_value(i8 %b, !1667, !DIExpression(), !1666)
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1668
  %xor1 = xor i8 %a, %0, !dbg !1669
    #dbg_value(i8 %xor1, !1665, !DIExpression(), !1666)
  %1 = trunc i8 %xor1 to i1, !dbg !1670
    #dbg_value(i8 poison, !1671, !DIExpression(), !1666)
  %2 = and i8 %xor1, 2, !dbg !1672
  %mul9 = mul i8 %2, %b, !dbg !1673
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !1670
  %xor11 = xor i8 %conv10, %mul9, !dbg !1674
    #dbg_value(i8 %xor11, !1671, !DIExpression(), !1666)
  %3 = and i8 %xor1, 4, !dbg !1675
  %mul16 = mul i8 %3, %b, !dbg !1676
  %xor18 = xor i8 %mul16, %xor11, !dbg !1677
    #dbg_value(i8 %xor18, !1671, !DIExpression(), !1666)
  %4 = and i8 %xor1, 8, !dbg !1678
  %mul23 = mul i8 %4, %b, !dbg !1679
  %xor25 = xor i8 %mul23, %xor18, !dbg !1680
    #dbg_value(i8 %xor25, !1671, !DIExpression(), !1666)
    #dbg_value(i8 %xor25, !1681, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1666)
  %5 = lshr i8 %xor25, 4, !dbg !1682
  %6 = lshr i8 %xor25, 3, !dbg !1683
  %7 = and i8 %6, 14, !dbg !1683
  %8 = xor i8 %5, %7, !dbg !1684
  %xor25.masked = and i8 %xor25, 15, !dbg !1685
  %9 = xor i8 %8, %xor25.masked, !dbg !1685
    #dbg_value(i8 %9, !1686, !DIExpression(), !1666)
  ret i8 %9, !dbg !1687
}

; Function Attrs: nounwind
define internal fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %M) unnamed_addr #0 !dbg !24 {
entry:
    #dbg_value(ptr %M, !1688, !DIExpression(), !1689)
    #dbg_value(i32 0, !1690, !DIExpression(), !1692)
  br label %for.cond, !dbg !1693

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add7, %for.body ], !dbg !1694
    #dbg_value(i32 %i.0, !1690, !DIExpression(), !1692)
  %cmp = icmp samesign ult i32 %i.0, 16, !dbg !1695
  br i1 %cmp, label %for.body, label %for.cond9.preheader, !dbg !1697

for.cond9.preheader:                              ; preds = %for.cond
  br label %for.cond9, !dbg !1698

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %M, i32 %i.0, !dbg !1700
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1700
  %shr = lshr i64 %0, 4, !dbg !1702
  %add = or disjoint i32 %i.0, 1, !dbg !1703
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %M, i32 %add, !dbg !1704
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1704
  %xor = xor i64 %shr, %1, !dbg !1705
  %and = and i64 %xor, 1085102592571150095, !dbg !1706
    #dbg_value(i64 %and, !1707, !DIExpression(), !1708)
  %shl = shl nuw i64 %and, 4, !dbg !1709
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %M, i32 %i.0, !dbg !1710
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1711
  %xor3 = xor i64 %2, %shl, !dbg !1711
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !1711
  %add4 = or disjoint i32 %i.0, 1, !dbg !1712
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %M, i32 %add4, !dbg !1713
  %3 = load i64, ptr %arrayidx5, align 8, !dbg !1714
  %xor6 = xor i64 %3, %and, !dbg !1714
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !1714
  %add7 = add nuw nsw i32 %i.0, 2, !dbg !1715
    #dbg_value(i32 %add7, !1690, !DIExpression(), !1692)
  br label %for.cond, !dbg !1716, !llvm.loop !1717

for.cond9:                                        ; preds = %for.cond9.preheader, %for.body11
  %i8.0 = phi i32 [ %add39, %for.body11 ], [ 0, %for.cond9.preheader ], !dbg !1719
    #dbg_value(i32 %i8.0, !1720, !DIExpression(), !1721)
  %cmp10 = icmp samesign ult i32 %i8.0, 16, !dbg !1722
  br i1 %cmp10, label %for.body11, label %for.cond42.preheader, !dbg !1698

for.cond42.preheader:                             ; preds = %for.cond9
  br label %for.cond42, !dbg !1724

for.body11:                                       ; preds = %for.cond9
  %arrayidx12 = getelementptr inbounds nuw i64, ptr %M, i32 %i8.0, !dbg !1726
  %4 = load i64, ptr %arrayidx12, align 8, !dbg !1726
  %shr13 = lshr i64 %4, 8, !dbg !1728
  %add14 = or disjoint i32 %i8.0, 2, !dbg !1729
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %M, i32 %add14, !dbg !1730
  %5 = load i64, ptr %arrayidx15, align 8, !dbg !1730
  %xor16 = xor i64 %shr13, %5, !dbg !1731
  %and17 = and i64 %xor16, 71777214294589695, !dbg !1732
    #dbg_value(i64 %and17, !1733, !DIExpression(), !1734)
  %add18 = or disjoint i32 %i8.0, 1, !dbg !1735
  %arrayidx19 = getelementptr inbounds nuw i64, ptr %M, i32 %add18, !dbg !1736
  %6 = load i64, ptr %arrayidx19, align 8, !dbg !1736
  %shr20 = lshr i64 %6, 8, !dbg !1737
  %add21 = or disjoint i32 %i8.0, 3, !dbg !1738
  %arrayidx22 = getelementptr inbounds nuw i64, ptr %M, i32 %add21, !dbg !1739
  %7 = load i64, ptr %arrayidx22, align 8, !dbg !1739
  %xor23 = xor i64 %shr20, %7, !dbg !1740
  %and24 = and i64 %xor23, 71777214294589695, !dbg !1741
    #dbg_value(i64 %and24, !1742, !DIExpression(), !1734)
  %shl25 = shl nuw i64 %and17, 8, !dbg !1743
  %arrayidx26 = getelementptr inbounds nuw i64, ptr %M, i32 %i8.0, !dbg !1744
  %8 = load i64, ptr %arrayidx26, align 8, !dbg !1745
  %xor27 = xor i64 %8, %shl25, !dbg !1745
  store i64 %xor27, ptr %arrayidx26, align 8, !dbg !1745
  %shl28 = shl nuw i64 %and24, 8, !dbg !1746
  %add29 = or disjoint i32 %i8.0, 1, !dbg !1747
  %arrayidx30 = getelementptr inbounds nuw i64, ptr %M, i32 %add29, !dbg !1748
  %9 = load i64, ptr %arrayidx30, align 8, !dbg !1749
  %xor31 = xor i64 %9, %shl28, !dbg !1749
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !1749
  %add32 = or disjoint i32 %i8.0, 2, !dbg !1750
  %arrayidx33 = getelementptr inbounds nuw i64, ptr %M, i32 %add32, !dbg !1751
  %10 = load i64, ptr %arrayidx33, align 8, !dbg !1752
  %xor34 = xor i64 %10, %and17, !dbg !1752
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !1752
  %add35 = or disjoint i32 %i8.0, 3, !dbg !1753
  %arrayidx36 = getelementptr inbounds nuw i64, ptr %M, i32 %add35, !dbg !1754
  %11 = load i64, ptr %arrayidx36, align 8, !dbg !1755
  %xor37 = xor i64 %11, %and24, !dbg !1755
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !1755
  %add39 = add nuw nsw i32 %i8.0, 4, !dbg !1756
    #dbg_value(i32 %add39, !1720, !DIExpression(), !1721)
  br label %for.cond9, !dbg !1757, !llvm.loop !1758

for.cond42:                                       ; preds = %for.cond42.preheader, %for.body44
  %i41.0 = phi i32 [ %inc, %for.body44 ], [ 0, %for.cond42.preheader ], !dbg !1760
    #dbg_value(i32 %i41.0, !1761, !DIExpression(), !1762)
  %exitcond = icmp ne i32 %i41.0, 4, !dbg !1763
  br i1 %exitcond, label %for.body44, label %for.cond76.preheader, !dbg !1724

for.cond76.preheader:                             ; preds = %for.cond42
  br label %for.cond76, !dbg !1765

for.body44:                                       ; preds = %for.cond42
  %arrayidx46 = getelementptr inbounds nuw i64, ptr %M, i32 %i41.0, !dbg !1767
  %12 = load i64, ptr %arrayidx46, align 8, !dbg !1767
  %shr47 = lshr i64 %12, 16, !dbg !1769
  %add48 = or disjoint i32 %i41.0, 4, !dbg !1770
  %arrayidx49 = getelementptr inbounds nuw i64, ptr %M, i32 %add48, !dbg !1771
  %13 = load i64, ptr %arrayidx49, align 8, !dbg !1771
  %xor50 = xor i64 %shr47, %13, !dbg !1772
  %and51 = and i64 %xor50, 281470681808895, !dbg !1773
    #dbg_value(i64 %and51, !1774, !DIExpression(), !1775)
  %add53 = or disjoint i32 %i41.0, 8, !dbg !1776
  %arrayidx54 = getelementptr inbounds nuw i64, ptr %M, i32 %add53, !dbg !1777
  %14 = load i64, ptr %arrayidx54, align 8, !dbg !1777
  %shr55 = lshr i64 %14, 16, !dbg !1778
  %add56 = or disjoint i32 %i41.0, 12, !dbg !1779
  %arrayidx57 = getelementptr inbounds nuw i64, ptr %M, i32 %add56, !dbg !1780
  %15 = load i64, ptr %arrayidx57, align 8, !dbg !1780
  %xor58 = xor i64 %shr55, %15, !dbg !1781
  %and59 = and i64 %xor58, 281470681808895, !dbg !1782
    #dbg_value(i64 %and59, !1783, !DIExpression(), !1775)
  %shl60 = shl nuw i64 %and51, 16, !dbg !1784
  %arrayidx61 = getelementptr inbounds nuw i64, ptr %M, i32 %i41.0, !dbg !1785
  %16 = load i64, ptr %arrayidx61, align 8, !dbg !1786
  %xor62 = xor i64 %16, %shl60, !dbg !1786
  store i64 %xor62, ptr %arrayidx61, align 8, !dbg !1786
  %shl63 = shl nuw i64 %and59, 16, !dbg !1787
  %add64 = or disjoint i32 %i41.0, 8, !dbg !1788
  %arrayidx65 = getelementptr inbounds nuw i64, ptr %M, i32 %add64, !dbg !1789
  %17 = load i64, ptr %arrayidx65, align 8, !dbg !1790
  %xor66 = xor i64 %17, %shl63, !dbg !1790
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !1790
  %add67 = or disjoint i32 %i41.0, 4, !dbg !1791
  %arrayidx68 = getelementptr inbounds nuw i64, ptr %M, i32 %add67, !dbg !1792
  %18 = load i64, ptr %arrayidx68, align 8, !dbg !1793
  %xor69 = xor i64 %18, %and51, !dbg !1793
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !1793
  %add70 = or disjoint i32 %i41.0, 12, !dbg !1794
  %arrayidx71 = getelementptr inbounds nuw i64, ptr %M, i32 %add70, !dbg !1795
  %19 = load i64, ptr %arrayidx71, align 8, !dbg !1796
  %xor72 = xor i64 %19, %and59, !dbg !1796
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !1796
  %inc = add nuw nsw i32 %i41.0, 1, !dbg !1797
    #dbg_value(i32 %inc, !1761, !DIExpression(), !1762)
  br label %for.cond42, !dbg !1798, !llvm.loop !1799

for.cond76:                                       ; preds = %for.cond76.preheader, %for.body78
  %i75.0 = phi i32 [ %inc93, %for.body78 ], [ 0, %for.cond76.preheader ], !dbg !1801
    #dbg_value(i32 %i75.0, !1802, !DIExpression(), !1803)
  %exitcond1 = icmp ne i32 %i75.0, 8, !dbg !1804
  br i1 %exitcond1, label %for.body78, label %for.end94, !dbg !1765

for.body78:                                       ; preds = %for.cond76
  %arrayidx80 = getelementptr inbounds nuw i64, ptr %M, i32 %i75.0, !dbg !1806
  %20 = load i64, ptr %arrayidx80, align 8, !dbg !1806
  %shr81 = lshr i64 %20, 32, !dbg !1808
  %add82 = or disjoint i32 %i75.0, 8, !dbg !1809
  %arrayidx83 = getelementptr inbounds nuw i64, ptr %M, i32 %add82, !dbg !1810
  %21 = load i64, ptr %arrayidx83, align 8, !dbg !1810
  %.masked = and i64 %21, 4294967295, !dbg !1811
  %and85 = xor i64 %shr81, %.masked, !dbg !1811
    #dbg_value(i64 %and85, !1812, !DIExpression(), !1813)
  %shl86 = shl nuw i64 %and85, 32, !dbg !1814
  %arrayidx87 = getelementptr inbounds nuw i64, ptr %M, i32 %i75.0, !dbg !1815
  %22 = load i64, ptr %arrayidx87, align 8, !dbg !1816
  %xor88 = xor i64 %22, %shl86, !dbg !1816
  store i64 %xor88, ptr %arrayidx87, align 8, !dbg !1816
  %add89 = or disjoint i32 %i75.0, 8, !dbg !1817
  %arrayidx90 = getelementptr inbounds nuw i64, ptr %M, i32 %add89, !dbg !1818
  %23 = load i64, ptr %arrayidx90, align 8, !dbg !1819
  %xor91 = xor i64 %23, %and85, !dbg !1819
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !1819
  %inc93 = add nuw nsw i32 %i75.0, 1, !dbg !1820
    #dbg_value(i32 %inc93, !1802, !DIExpression(), !1803)
  br label %for.cond76, !dbg !1821, !llvm.loop !1822

for.end94:                                        ; preds = %for.cond76
  ret void, !dbg !1824
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef nonnull %mat, ptr noundef nonnull %bs_mat, ptr noundef nonnull %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef range(i32 8, 11) %bs_mat_cols) unnamed_addr #0 !dbg !1825 {
entry:
    #dbg_value(i32 5, !1826, !DIExpression(), !1827)
    #dbg_value(ptr %mat, !1828, !DIExpression(), !1827)
    #dbg_value(ptr %bs_mat, !1829, !DIExpression(), !1827)
    #dbg_value(ptr %acc, !1830, !DIExpression(), !1827)
    #dbg_value(i32 10, !1831, !DIExpression(), !1827)
    #dbg_value(i32 78, !1832, !DIExpression(), !1827)
    #dbg_value(i32 %bs_mat_cols, !1833, !DIExpression(), !1827)
    #dbg_value(i32 0, !1834, !DIExpression(), !1836)
  br label %for.cond, !dbg !1837

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1838
    #dbg_value(i32 %r.0, !1834, !DIExpression(), !1836)
  %exitcond2 = icmp ne i32 %r.0, 10, !dbg !1839
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end19, !dbg !1841

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1842

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond1.preheader ], !dbg !1845
    #dbg_value(i32 %c.0, !1846, !DIExpression(), !1847)
  %exitcond1 = icmp ne i32 %c.0, 78, !dbg !1848
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc17, !dbg !1842

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1850

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1853
    #dbg_value(i32 %k.0, !1854, !DIExpression(), !1855)
  %exitcond = icmp ne i32 %k.0, %bs_mat_cols, !dbg !1856
  br i1 %exitcond, label %for.body6, label %for.inc15, !dbg !1850

for.body6:                                        ; preds = %for.cond4
  %mul = mul nuw nsw i32 %c.0, %bs_mat_cols, !dbg !1858
  %add = add nuw nsw i32 %mul, %k.0, !dbg !1860
  %add.ptr.idx = mul nuw nsw i32 %add, 40, !dbg !1861
  %add.ptr = getelementptr inbounds nuw i8, ptr %bs_mat, i32 %add.ptr.idx, !dbg !1861
  %mul8 = mul nuw nsw i32 %r.0, 78, !dbg !1862
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1863
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1863
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1863
  %mul10 = mul nuw nsw i32 %r.0, %bs_mat_cols, !dbg !1864
  %add11 = add nuw nsw i32 %mul10, %k.0, !dbg !1865
  %add.ptr13.idx = mul nuw nsw i32 %add11, 40, !dbg !1866
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !1866
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr, i8 noundef zeroext %1, ptr noundef nonnull %add.ptr13) #4, !dbg !1867
  %add14 = add nuw nsw i32 %k.0, 1, !dbg !1868
    #dbg_value(i32 %add14, !1854, !DIExpression(), !1855)
  br label %for.cond4, !dbg !1869, !llvm.loop !1870

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw nsw i32 %c.0, 1, !dbg !1872
    #dbg_value(i32 %inc, !1846, !DIExpression(), !1847)
  br label %for.cond1, !dbg !1873, !llvm.loop !1874

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw nsw i32 %r.0, 1, !dbg !1876
    #dbg_value(i32 %inc18, !1834, !DIExpression(), !1836)
  br label %for.cond, !dbg !1877, !llvm.loop !1878

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1880
}

; Function Attrs: nounwind
define internal fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %V, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !1881 {
entry:
    #dbg_value(ptr %p, !1882, !DIExpression(), !1883)
    #dbg_value(ptr %P1, !1884, !DIExpression(), !1883)
    #dbg_value(ptr %V, !1885, !DIExpression(), !1883)
    #dbg_value(ptr %acc, !1886, !DIExpression(), !1883)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef 5, ptr noundef %P1, ptr noundef %V, ptr noundef %acc, i32 noundef 78, i32 noundef 78, i32 noundef 10, i32 noundef 1) #4, !dbg !1887
  ret void, !dbg !1888
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef nonnull %bs_mat, ptr noundef nonnull %mat, ptr noundef nonnull %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !1889 {
entry:
    #dbg_value(i32 5, !1890, !DIExpression(), !1891)
    #dbg_value(ptr %bs_mat, !1892, !DIExpression(), !1891)
    #dbg_value(ptr %mat, !1893, !DIExpression(), !1891)
    #dbg_value(ptr %acc, !1894, !DIExpression(), !1891)
    #dbg_value(i32 78, !1895, !DIExpression(), !1891)
    #dbg_value(i32 78, !1896, !DIExpression(), !1891)
    #dbg_value(i32 10, !1897, !DIExpression(), !1891)
    #dbg_value(i32 1, !1898, !DIExpression(), !1891)
    #dbg_value(i32 0, !1899, !DIExpression(), !1891)
    #dbg_value(i32 0, !1900, !DIExpression(), !1902)
  br label %for.cond, !dbg !1903

for.cond:                                         ; preds = %for.inc17, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17 ], [ 78, %entry ], !dbg !1904
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1.lcssa, %for.inc17 ], !dbg !1904
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1905
    #dbg_value(i32 %r.0, !1900, !DIExpression(), !1902)
    #dbg_value(i32 %bs_mat_entries_used.0, !1899, !DIExpression(), !1891)
  %exitcond2 = icmp ne i32 %r.0, 78, !dbg !1906
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end19, !dbg !1908

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !1909
  br label %for.cond1, !dbg !1909

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc15
  %bs_mat_entries_used.1 = phi i32 [ %add14, %for.inc15 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !1891
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ %r.0, %for.cond1.preheader ], !dbg !1912
    #dbg_value(i32 %c.0, !1913, !DIExpression(), !1914)
    #dbg_value(i32 %bs_mat_entries_used.1, !1899, !DIExpression(), !1891)
  %exitcond1 = icmp ne i32 %bs_mat_entries_used.1, %0, !dbg !1915
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc17, !dbg !1909

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1917

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1920
    #dbg_value(i32 %k.0, !1921, !DIExpression(), !1922)
  %exitcond = icmp ne i32 %k.0, 10, !dbg !1923
  br i1 %exitcond, label %for.body6, label %for.inc15, !dbg !1917

for.body6:                                        ; preds = %for.cond4
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !1925
  %add.ptr = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx, !dbg !1925
  %mul8 = mul nuw nsw i32 %k.0, 78, !dbg !1927
  %1 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1928
  %arrayidx = getelementptr i8, ptr %1, i32 %c.0, !dbg !1928
  %2 = load i8, ptr %arrayidx, align 1, !dbg !1928
  %mul9 = mul nuw nsw i32 %r.0, 10, !dbg !1929
  %add10 = add nuw nsw i32 %mul9, %k.0, !dbg !1930
  %add.ptr12.idx = mul nuw nsw i32 %add10, 40, !dbg !1931
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx, !dbg !1931
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr, i8 noundef zeroext %2, ptr noundef nonnull %add.ptr12) #4, !dbg !1932
  %add13 = add nuw nsw i32 %k.0, 1, !dbg !1933
    #dbg_value(i32 %add13, !1921, !DIExpression(), !1922)
  br label %for.cond4, !dbg !1934, !llvm.loop !1935

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !1899, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1891)
  %add14 = add i32 %bs_mat_entries_used.1, 1, !dbg !1937
    #dbg_value(i32 %add14, !1899, !DIExpression(), !1891)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !1938
    #dbg_value(i32 %inc, !1913, !DIExpression(), !1914)
  br label %for.cond1, !dbg !1939, !llvm.loop !1940

for.inc17:                                        ; preds = %for.cond1
  %bs_mat_entries_used.1.lcssa = phi i32 [ %bs_mat_entries_used.1, %for.cond1 ], !dbg !1891
  %inc18 = add nuw nsw i32 %r.0, 1, !dbg !1942
    #dbg_value(i32 %inc18, !1900, !DIExpression(), !1902)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !1943
  br label %for.cond, !dbg !1943, !llvm.loop !1944

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1946
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !1947 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !1948, !DIExpression(), !1949)
    #dbg_value(ptr %sm, !1950, !DIExpression(), !1949)
    #dbg_value(ptr %smlen, !1951, !DIExpression(), !1949)
    #dbg_value(ptr %m, !1952, !DIExpression(), !1949)
    #dbg_value(i32 %mlen, !1953, !DIExpression(), !1949)
    #dbg_value(ptr %csk, !1954, !DIExpression(), !1949)
    #dbg_value(i32 0, !1955, !DIExpression(), !1949)
    #dbg_value(i32 454, !1956, !DIExpression(), !1949)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1957
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #6, !dbg !1958
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1959
    #dbg_value(ptr %siglen, !1960, !DIExpression(DW_OP_deref), !1949)
  %call2 = call i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #4, !dbg !1961
    #dbg_value(i32 0, !1955, !DIExpression(), !1949)
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !1960, !DIExpression(), !1949)
  %cmp3.not = icmp eq i32 %0, 454
  br i1 %cmp3.not, label %if.end, label %if.then, !dbg !1962

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !1964
    #dbg_value(i32 %1, !1960, !DIExpression(), !1949)
  %add = add i32 %1, %mlen, !dbg !1966
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #6, !dbg !1967
  br label %err, !dbg !1968

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !1969
    #dbg_value(i32 %2, !1960, !DIExpression(), !1949)
  %add5 = add i32 %2, %mlen, !dbg !1970
  store i32 %add5, ptr %smlen, align 4, !dbg !1971
  br label %err, !dbg !1972

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!1973, !1974)
  ret i32 0, !dbg !1975
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !1976 {
entry:
    #dbg_value(ptr %p, !1977, !DIExpression(), !1978)
    #dbg_value(ptr %m, !1979, !DIExpression(), !1978)
    #dbg_value(ptr %mlen, !1980, !DIExpression(), !1978)
    #dbg_value(ptr %sm, !1981, !DIExpression(), !1978)
    #dbg_value(i32 %smlen, !1982, !DIExpression(), !1978)
    #dbg_value(ptr %pk, !1983, !DIExpression(), !1978)
    #dbg_value(i32 454, !1984, !DIExpression(), !1978)
  %cmp = icmp ult i32 %smlen, 454, !dbg !1985
  br i1 %cmp, label %return, label %if.end, !dbg !1985

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1987
  %sub = add i32 %smlen, -454, !dbg !1988
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #4, !dbg !1989
    #dbg_value(i32 %call, !1990, !DIExpression(), !1978)
  %cmp1 = icmp eq i32 %call, 0, !dbg !1991
  br i1 %cmp1, label %if.then2, label %return, !dbg !1991

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -454, !dbg !1993
  store i32 %sub3, ptr %mlen, align 4, !dbg !1995
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1996
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #6, !dbg !1997
  br label %return, !dbg !1998

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then2 ], [ %call, %if.end ], !dbg !1978
  ret i32 %retval.0, !dbg !1999
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !2000 {
entry:
  %tEnc = alloca [39 x i8], align 1
  %t = alloca [78 x i8], align 1
  %y = alloca [156 x i8], align 1
  %s = alloca [860 x i8], align 1
  %pk = alloca [18705 x i64], align 8
  %tmp = alloca [56 x i8], align 1
    #dbg_value(ptr %p, !2003, !DIExpression(), !2004)
    #dbg_value(ptr %m, !2005, !DIExpression(), !2004)
    #dbg_value(i32 %mlen, !2006, !DIExpression(), !2004)
    #dbg_value(ptr %sig, !2007, !DIExpression(), !2004)
    #dbg_value(ptr %cpk, !2008, !DIExpression(), !2004)
    #dbg_declare(ptr %tEnc, !2009, !DIExpression(), !2010)
    #dbg_declare(ptr %t, !2011, !DIExpression(), !2012)
    #dbg_declare(ptr %y, !2013, !DIExpression(), !2017)
  call void @mayo_memset(ptr %y, i8 0, i32 156), !dbg !2017
    #dbg_declare(ptr %s, !2018, !DIExpression(), !2019)
    #dbg_declare(ptr %pk, !2020, !DIExpression(), !2021)
  call void @mayo_memset(ptr %pk, i8 0, i32 149640), !dbg !2021
    #dbg_declare(ptr %tmp, !2022, !DIExpression(), !2026)
    #dbg_value(i32 78, !2027, !DIExpression(), !2004)
    #dbg_value(i32 86, !2028, !DIExpression(), !2004)
    #dbg_value(i32 10, !2029, !DIExpression(), !2004)
    #dbg_value(i32 39, !2030, !DIExpression(), !2004)
    #dbg_value(i32 454, !2031, !DIExpression(), !2004)
    #dbg_value(i32 32, !2032, !DIExpression(), !2004)
    #dbg_value(i32 24, !2033, !DIExpression(), !2004)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef nonnull %pk) #4, !dbg !2034
    #dbg_value(i32 0, !2035, !DIExpression(), !2004)
    #dbg_value(ptr %pk, !2036, !DIExpression(), !2004)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 123240, !dbg !2037
    #dbg_value(ptr %add.ptr, !2038, !DIExpression(), !2004)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !2039
    #dbg_value(ptr %add.ptr2, !2040, !DIExpression(), !2004)
  call void @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #4, !dbg !2041
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !2042
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !2043
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 24) #6, !dbg !2044
  call void @shake256(ptr noundef nonnull %tEnc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #4, !dbg !2045
  call fastcc void @decode(ptr noundef nonnull %tEnc, ptr noundef nonnull %t, i32 noundef 78) #4, !dbg !2046
  call fastcc void @decode(ptr noundef %sig, ptr noundef nonnull %s, i32 noundef 860) #4, !dbg !2047
  call fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %pk, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %y) #4, !dbg !2048
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 78) #6, !dbg !2049
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2051
  %. = zext i1 %cmp21 to i32, !dbg !2004
  ret i32 %., !dbg !2052
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !2053 {
entry:
    #dbg_value(ptr %p, !2054, !DIExpression(), !2055)
    #dbg_value(ptr %cpk, !2056, !DIExpression(), !2055)
    #dbg_value(ptr %pk, !2057, !DIExpression(), !2055)
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %pk, ptr noundef %cpk) #4, !dbg !2058
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2059
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !2060
  call fastcc void @unpack_m_vecs(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef 36, i32 noundef 78) #4, !dbg !2061
  ret i32 0, !dbg !2062
}

; Function Attrs: nounwind
define internal fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %eval) unnamed_addr #0 !dbg !2063 {
entry:
  %SPS = alloca [500 x i64], align 8
  %zero = alloca [78 x i8], align 1
    #dbg_value(ptr %p, !2066, !DIExpression(), !2067)
    #dbg_value(ptr %s, !2068, !DIExpression(), !2067)
    #dbg_value(ptr %P1, !2069, !DIExpression(), !2067)
    #dbg_value(ptr %P2, !2070, !DIExpression(), !2067)
    #dbg_value(ptr %P3, !2071, !DIExpression(), !2067)
    #dbg_value(ptr %eval, !2072, !DIExpression(), !2067)
    #dbg_declare(ptr %SPS, !2073, !DIExpression(), !2077)
  call void @mayo_memset(ptr %SPS, i8 0, i32 4000), !dbg !2077
  call fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef nonnull %SPS) #4, !dbg !2078
    #dbg_declare(ptr %zero, !2079, !DIExpression(), !2080)
  call void @mayo_memset(ptr %zero, i8 0, i32 78), !dbg !2080
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS, ptr noundef nonnull %zero, ptr noundef %eval) #4, !dbg !2081
  ret void, !dbg !2082
}

; Function Attrs: nounwind
define internal fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %s, ptr noundef nonnull %SPS) unnamed_addr #0 !dbg !2083 {
entry:
  %PS = alloca [4300 x i64], align 8
    #dbg_value(ptr %p, !2086, !DIExpression(), !2087)
    #dbg_value(ptr %P1, !2088, !DIExpression(), !2087)
    #dbg_value(ptr %P2, !2089, !DIExpression(), !2087)
    #dbg_value(ptr %P3, !2090, !DIExpression(), !2087)
    #dbg_value(ptr %s, !2091, !DIExpression(), !2087)
    #dbg_value(ptr %SPS, !2092, !DIExpression(), !2087)
    #dbg_declare(ptr %PS, !2093, !DIExpression(), !2097)
  call void @mayo_memset(ptr %PS, i8 0, i32 34400), !dbg !2097
  call fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, i32 noundef 78, i32 noundef 78, i32 noundef 8, i32 noundef 10, ptr noundef nonnull %PS) #4, !dbg !2098
  call fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef %s, i32 noundef 78, i32 noundef 10, i32 noundef 86, ptr noundef %SPS) #4, !dbg !2099
  ret void, !dbg !2100
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_PS(ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef nonnull %PS) unnamed_addr #0 !dbg !2101 {
entry:
  %accumulator = alloca [68800 x i64], align 8
    #dbg_value(ptr %P1, !2104, !DIExpression(), !2105)
    #dbg_value(ptr %P2, !2106, !DIExpression(), !2105)
    #dbg_value(ptr %P3, !2107, !DIExpression(), !2105)
    #dbg_value(ptr %S, !2108, !DIExpression(), !2105)
    #dbg_value(i32 78, !2109, !DIExpression(), !2105)
    #dbg_value(i32 78, !2110, !DIExpression(), !2105)
    #dbg_value(i32 8, !2111, !DIExpression(), !2105)
    #dbg_value(i32 10, !2112, !DIExpression(), !2105)
    #dbg_value(ptr %PS, !2113, !DIExpression(), !2105)
    #dbg_value(i32 86, !2114, !DIExpression(), !2105)
    #dbg_value(i32 5, !2115, !DIExpression(), !2105)
    #dbg_declare(ptr %accumulator, !2116, !DIExpression(), !2120)
  call void @mayo_memset(ptr %accumulator, i8 0, i32 550400), !dbg !2120
    #dbg_value(i32 0, !2121, !DIExpression(), !2105)
    #dbg_value(i32 0, !2122, !DIExpression(), !2124)
  br label %for.cond, !dbg !2125

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52 ], [ 78, %entry ], !dbg !2126
  %P1_used.0 = phi i32 [ 0, %entry ], [ %P1_used.1.lcssa, %for.inc52 ], !dbg !2126
  %row.0 = phi i32 [ 0, %entry ], [ %inc53, %for.inc52 ], !dbg !2127
    #dbg_value(i32 %row.0, !2122, !DIExpression(), !2124)
    #dbg_value(i32 %P1_used.0, !2121, !DIExpression(), !2105)
  %exitcond4 = icmp ne i32 %row.0, 78, !dbg !2128
  br i1 %exitcond4, label %for.cond2.preheader, label %for.cond56.preheader, !dbg !2130

for.cond2.preheader:                              ; preds = %for.cond
  %0 = add i32 %P1_used.0, %indvars.iv, !dbg !2131
  br label %for.cond2, !dbg !2131

for.cond56.preheader:                             ; preds = %for.cond
  br label %for.cond56, !dbg !2134

for.cond2:                                        ; preds = %for.cond2.preheader, %for.inc17
  %P1_used.1 = phi i32 [ %inc16, %for.inc17 ], [ %P1_used.0, %for.cond2.preheader ], !dbg !2105
  %j.0 = phi i32 [ %inc18, %for.inc17 ], [ %row.0, %for.cond2.preheader ], !dbg !2136
    #dbg_value(i32 %j.0, !2137, !DIExpression(), !2138)
    #dbg_value(i32 %P1_used.1, !2121, !DIExpression(), !2105)
  %exitcond1 = icmp ne i32 %P1_used.1, %0, !dbg !2139
  br i1 %exitcond1, label %for.cond5.preheader, label %for.cond21.preheader, !dbg !2131

for.cond21.preheader:                             ; preds = %for.cond2
  %P1_used.1.lcssa = phi i32 [ %P1_used.1, %for.cond2 ], !dbg !2105
  br label %for.cond21, !dbg !2141

for.cond5.preheader:                              ; preds = %for.cond2
  br label %for.cond5, !dbg !2143

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %col.0 = phi i32 [ %inc, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !2146
    #dbg_value(i32 %col.0, !2147, !DIExpression(), !2148)
  %exitcond = icmp ne i32 %col.0, 10, !dbg !2149
  br i1 %exitcond, label %for.body7, label %for.inc17, !dbg !2143

for.body7:                                        ; preds = %for.cond5
  %add.ptr.idx = mul nsw i32 %P1_used.1, 40, !dbg !2151
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !2151
  %mul8 = mul nuw nsw i32 %row.0, 10, !dbg !2153
  %add9 = add nuw nsw i32 %mul8, %col.0, !dbg !2154
  %mul10 = shl nuw nsw i32 %add9, 4, !dbg !2155
  %mul11 = mul nuw nsw i32 %col.0, 86, !dbg !2156
  %1 = getelementptr i8, ptr %S, i32 %mul11, !dbg !2157
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2157
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2157
  %conv = zext i8 %2 to i32, !dbg !2157
  %add13 = add nuw nsw i32 %mul10, %conv, !dbg !2158
  %add.ptr15.idx = mul nuw nsw i32 %add13, 40, !dbg !2159
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr15.idx, !dbg !2159
  call fastcc void @m_vec_add(i32 noundef 5, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr15) #4, !dbg !2160
  %inc = add nuw nsw i32 %col.0, 1, !dbg !2161
    #dbg_value(i32 %inc, !2147, !DIExpression(), !2148)
  br label %for.cond5, !dbg !2162, !llvm.loop !2163

for.inc17:                                        ; preds = %for.cond5
    #dbg_value(i32 %P1_used.1, !2121, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2105)
  %inc16 = add i32 %P1_used.1, 1, !dbg !2165
    #dbg_value(i32 %inc16, !2121, !DIExpression(), !2105)
  %inc18 = add nuw nsw i32 %j.0, 1, !dbg !2166
    #dbg_value(i32 %inc18, !2137, !DIExpression(), !2138)
  br label %for.cond2, !dbg !2167, !llvm.loop !2168

for.cond21:                                       ; preds = %for.cond21.preheader, %for.inc49
  %j20.0 = phi i32 [ %inc50, %for.inc49 ], [ 0, %for.cond21.preheader ], !dbg !2170
    #dbg_value(i32 %j20.0, !2171, !DIExpression(), !2172)
  %exitcond3 = icmp ne i32 %j20.0, 8, !dbg !2173
  br i1 %exitcond3, label %for.cond26.preheader, label %for.inc52, !dbg !2141

for.cond26.preheader:                             ; preds = %for.cond21
  br label %for.cond26, !dbg !2175

for.cond26:                                       ; preds = %for.cond26.preheader, %for.body29
  %col25.0 = phi i32 [ %inc47, %for.body29 ], [ 0, %for.cond26.preheader ], !dbg !2178
    #dbg_value(i32 %col25.0, !2179, !DIExpression(), !2180)
  %exitcond2 = icmp ne i32 %col25.0, 10, !dbg !2181
  br i1 %exitcond2, label %for.body29, label %for.inc49, !dbg !2175

for.body29:                                       ; preds = %for.cond26
  %mul30 = shl nuw nsw i32 %row.0, 3, !dbg !2183
  %add31 = or disjoint i32 %mul30, %j20.0, !dbg !2185
  %add.ptr33.idx = mul nuw nsw i32 %add31, 40, !dbg !2186
  %add.ptr33 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr33.idx, !dbg !2186
  %mul35 = mul nuw nsw i32 %row.0, 10, !dbg !2187
  %add36 = add nuw nsw i32 %mul35, %col25.0, !dbg !2188
  %mul37 = shl nuw nsw i32 %add36, 4, !dbg !2189
  %mul38 = mul nuw nsw i32 %col25.0, 86, !dbg !2190
  %3 = getelementptr i8, ptr %S, i32 %mul38, !dbg !2191
  %4 = getelementptr i8, ptr %3, i32 %j20.0, !dbg !2191
  %arrayidx41 = getelementptr i8, ptr %4, i32 78, !dbg !2191
  %5 = load i8, ptr %arrayidx41, align 1, !dbg !2191
  %conv42 = zext i8 %5 to i32, !dbg !2191
  %add43 = add nuw nsw i32 %mul37, %conv42, !dbg !2192
  %add.ptr45.idx = mul nuw nsw i32 %add43, 40, !dbg !2193
  %add.ptr45 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr45.idx, !dbg !2193
  call fastcc void @m_vec_add(i32 noundef 5, ptr noundef %add.ptr33, ptr noundef nonnull %add.ptr45) #4, !dbg !2194
  %inc47 = add nuw nsw i32 %col25.0, 1, !dbg !2195
    #dbg_value(i32 %inc47, !2179, !DIExpression(), !2180)
  br label %for.cond26, !dbg !2196, !llvm.loop !2197

for.inc49:                                        ; preds = %for.cond26
  %inc50 = add nuw nsw i32 %j20.0, 1, !dbg !2199
    #dbg_value(i32 %inc50, !2171, !DIExpression(), !2172)
  br label %for.cond21, !dbg !2200, !llvm.loop !2201

for.inc52:                                        ; preds = %for.cond21
  %inc53 = add nuw nsw i32 %row.0, 1, !dbg !2203
    #dbg_value(i32 %inc53, !2122, !DIExpression(), !2124)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !2204
  br label %for.cond, !dbg !2204, !llvm.loop !2205

for.cond56:                                       ; preds = %for.cond56.preheader, %for.inc90
  %indvars.iv6 = phi i32 [ 8, %for.cond56.preheader ], [ %indvars.iv.next7, %for.inc90 ], !dbg !2207
  %P3_used.0 = phi i32 [ %P3_used.1.lcssa, %for.inc90 ], [ 0, %for.cond56.preheader ], !dbg !2207
  %row55.0 = phi i32 [ %inc91, %for.inc90 ], [ 78, %for.cond56.preheader ], !dbg !2208
    #dbg_value(i32 %row55.0, !2209, !DIExpression(), !2210)
    #dbg_value(i32 %P3_used.0, !2211, !DIExpression(), !2105)
  %exitcond9 = icmp ne i32 %row55.0, 86, !dbg !2212
  br i1 %exitcond9, label %for.cond61.preheader, label %while.cond.preheader, !dbg !2134

for.cond61.preheader:                             ; preds = %for.cond56
  %6 = add i32 %P3_used.0, %indvars.iv6, !dbg !2214
  br label %for.cond61, !dbg !2214

while.cond.preheader:                             ; preds = %for.cond56
  br label %while.cond, !dbg !2217

for.cond61:                                       ; preds = %for.cond61.preheader, %for.inc87
  %P3_used.1 = phi i32 [ %inc86, %for.inc87 ], [ %P3_used.0, %for.cond61.preheader ], !dbg !2105
  %j60.0 = phi i32 [ %inc88, %for.inc87 ], [ %row55.0, %for.cond61.preheader ], !dbg !2218
    #dbg_value(i32 %j60.0, !2219, !DIExpression(), !2220)
    #dbg_value(i32 %P3_used.1, !2211, !DIExpression(), !2105)
  %exitcond8 = icmp ne i32 %P3_used.1, %6, !dbg !2221
  br i1 %exitcond8, label %for.cond66.preheader, label %for.inc90, !dbg !2214

for.cond66.preheader:                             ; preds = %for.cond61
  br label %for.cond66, !dbg !2223

for.cond66:                                       ; preds = %for.cond66.preheader, %for.body69
  %col65.0 = phi i32 [ %inc84, %for.body69 ], [ 0, %for.cond66.preheader ], !dbg !2226
    #dbg_value(i32 %col65.0, !2227, !DIExpression(), !2228)
  %exitcond5 = icmp ne i32 %col65.0, 10, !dbg !2229
  br i1 %exitcond5, label %for.body69, label %for.inc87, !dbg !2223

for.body69:                                       ; preds = %for.cond66
  %add.ptr71.idx = mul nsw i32 %P3_used.1, 40, !dbg !2231
  %add.ptr71 = getelementptr inbounds i8, ptr %P3, i32 %add.ptr71.idx, !dbg !2231
  %mul73 = mul nuw nsw i32 %row55.0, 10, !dbg !2233
  %add74 = add nuw nsw i32 %mul73, %col65.0, !dbg !2234
  %mul75 = shl nuw nsw i32 %add74, 4, !dbg !2235
  %mul76 = mul nuw nsw i32 %col65.0, 86, !dbg !2236
  %7 = getelementptr i8, ptr %S, i32 %mul76, !dbg !2237
  %arrayidx78 = getelementptr i8, ptr %7, i32 %j60.0, !dbg !2237
  %8 = load i8, ptr %arrayidx78, align 1, !dbg !2237
  %conv79 = zext i8 %8 to i32, !dbg !2237
  %add80 = add nuw nsw i32 %mul75, %conv79, !dbg !2238
  %add.ptr82.idx = mul nuw nsw i32 %add80, 40, !dbg !2239
  %add.ptr82 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr82.idx, !dbg !2239
  call fastcc void @m_vec_add(i32 noundef 5, ptr noundef %add.ptr71, ptr noundef nonnull %add.ptr82) #4, !dbg !2240
  %inc84 = add nuw nsw i32 %col65.0, 1, !dbg !2241
    #dbg_value(i32 %inc84, !2227, !DIExpression(), !2228)
  br label %for.cond66, !dbg !2242, !llvm.loop !2243

for.inc87:                                        ; preds = %for.cond66
    #dbg_value(i32 %P3_used.1, !2211, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2105)
  %inc86 = add i32 %P3_used.1, 1, !dbg !2245
    #dbg_value(i32 %inc86, !2211, !DIExpression(), !2105)
  %inc88 = add nuw nsw i32 %j60.0, 1, !dbg !2246
    #dbg_value(i32 %inc88, !2219, !DIExpression(), !2220)
  br label %for.cond61, !dbg !2247, !llvm.loop !2248

for.inc90:                                        ; preds = %for.cond61
  %P3_used.1.lcssa = phi i32 [ %P3_used.1, %for.cond61 ], !dbg !2105
  %inc91 = add nuw nsw i32 %row55.0, 1, !dbg !2250
    #dbg_value(i32 %inc91, !2209, !DIExpression(), !2210)
  %indvars.iv.next7 = add nsw i32 %indvars.iv6, -1, !dbg !2251
  br label %for.cond56, !dbg !2251, !llvm.loop !2252

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc102, %while.body ], [ 0, %while.cond.preheader ], !dbg !2105
    #dbg_value(i32 %i.0, !2254, !DIExpression(), !2105)
  %exitcond10 = icmp ne i32 %i.0, 860, !dbg !2255
  br i1 %exitcond10, label %while.body, label %while.end, !dbg !2217

while.body:                                       ; preds = %while.cond
  %add.ptr99.idx = mul nuw nsw i32 %i.0, 640, !dbg !2256
  %add.ptr99 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr99.idx, !dbg !2256
  %add.ptr101.idx = mul nuw nsw i32 %i.0, 40, !dbg !2258
  %add.ptr101 = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr101.idx, !dbg !2258
  call fastcc void @m_vec_multiply_bins(i32 noundef 5, ptr noundef nonnull %add.ptr99, ptr noundef %add.ptr101) #4, !dbg !2259
  %inc102 = add nuw nsw i32 %i.0, 1, !dbg !2260
    #dbg_value(i32 %inc102, !2254, !DIExpression(), !2105)
  br label %while.cond, !dbg !2217, !llvm.loop !2261

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2263
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef nonnull %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef nonnull %SPS) unnamed_addr #0 !dbg !2264 {
entry:
  %accumulator = alloca [8000 x i64], align 8
    #dbg_value(ptr %PS, !2267, !DIExpression(), !2268)
    #dbg_value(ptr %S, !2269, !DIExpression(), !2268)
    #dbg_value(i32 78, !2270, !DIExpression(), !2268)
    #dbg_value(i32 10, !2271, !DIExpression(), !2268)
    #dbg_value(i32 86, !2272, !DIExpression(), !2268)
    #dbg_value(ptr %SPS, !2273, !DIExpression(), !2268)
    #dbg_declare(ptr %accumulator, !2274, !DIExpression(), !2278)
  call void @mayo_memset(ptr %accumulator, i8 0, i32 64000), !dbg !2278
    #dbg_value(i32 5, !2279, !DIExpression(), !2268)
    #dbg_value(i32 0, !2280, !DIExpression(), !2282)
  br label %for.cond, !dbg !2283

for.cond:                                         ; preds = %for.inc20, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !2284
    #dbg_value(i32 %row.0, !2280, !DIExpression(), !2282)
  %exitcond2 = icmp ne i32 %row.0, 10, !dbg !2285
  br i1 %exitcond2, label %for.cond1.preheader, label %while.cond.preheader, !dbg !2287

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2288

while.cond.preheader:                             ; preds = %for.cond
  br label %while.cond, !dbg !2291

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc18
  %j.0 = phi i32 [ %inc, %for.inc18 ], [ 0, %for.cond1.preheader ], !dbg !2292
    #dbg_value(i32 %j.0, !2293, !DIExpression(), !2294)
  %exitcond1 = icmp ne i32 %j.0, 86, !dbg !2295
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc20, !dbg !2288

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !2297

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %col.0 = phi i32 [ %add17, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !2300
    #dbg_value(i32 %col.0, !2301, !DIExpression(), !2302)
  %exitcond = icmp ne i32 %col.0, 10, !dbg !2303
  br i1 %exitcond, label %for.body6, label %for.inc18, !dbg !2297

for.body6:                                        ; preds = %for.cond4
  %mul = mul nuw nsw i32 %j.0, 10, !dbg !2305
  %add7 = add nuw nsw i32 %mul, %col.0, !dbg !2307
  %add.ptr.idx = mul nuw nsw i32 %add7, 40, !dbg !2308
  %add.ptr = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr.idx, !dbg !2308
  %mul9 = mul nuw nsw i32 %row.0, 10, !dbg !2309
  %add10 = add nuw nsw i32 %mul9, %col.0, !dbg !2310
  %mul11 = shl nuw nsw i32 %add10, 4, !dbg !2311
  %mul12 = mul nuw nsw i32 %row.0, 86, !dbg !2312
  %0 = getelementptr i8, ptr %S, i32 %mul12, !dbg !2313
  %arrayidx = getelementptr i8, ptr %0, i32 %j.0, !dbg !2313
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2313
  %conv = zext i8 %1 to i32, !dbg !2313
  %add14 = add nuw nsw i32 %mul11, %conv, !dbg !2314
  %add.ptr16.idx = mul nuw nsw i32 %add14, 40, !dbg !2315
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr16.idx, !dbg !2315
  call fastcc void @m_vec_add(i32 noundef 5, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr16) #4, !dbg !2316
  %add17 = add nuw nsw i32 %col.0, 1, !dbg !2317
    #dbg_value(i32 %add17, !2301, !DIExpression(), !2302)
  br label %for.cond4, !dbg !2318, !llvm.loop !2319

for.inc18:                                        ; preds = %for.cond4
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2321
    #dbg_value(i32 %inc, !2293, !DIExpression(), !2294)
  br label %for.cond1, !dbg !2322, !llvm.loop !2323

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %row.0, 1, !dbg !2325
    #dbg_value(i32 %inc21, !2280, !DIExpression(), !2282)
  br label %for.cond, !dbg !2326, !llvm.loop !2327

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc32, %while.body ], [ 0, %while.cond.preheader ], !dbg !2268
    #dbg_value(i32 %i.0, !2329, !DIExpression(), !2268)
  %exitcond3 = icmp ne i32 %i.0, 100, !dbg !2330
  br i1 %exitcond3, label %while.body, label %while.end, !dbg !2291

while.body:                                       ; preds = %while.cond
  %add.ptr29.idx = mul nuw nsw i32 %i.0, 640, !dbg !2331
  %add.ptr29 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr29.idx, !dbg !2331
  %add.ptr31.idx = mul nuw nsw i32 %i.0, 40, !dbg !2333
  %add.ptr31 = getelementptr inbounds nuw i8, ptr %SPS, i32 %add.ptr31.idx, !dbg !2333
  call fastcc void @m_vec_multiply_bins(i32 noundef 5, ptr noundef nonnull %add.ptr29, ptr noundef %add.ptr31) #4, !dbg !2334
  %inc32 = add nuw nsw i32 %i.0, 1, !dbg !2335
    #dbg_value(i32 %inc32, !2329, !DIExpression(), !2268)
  br label %while.cond, !dbg !2291, !llvm.loop !2336

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2338
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef nonnull %in, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !2339 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2342, !DIExpression(), !2343)
    #dbg_value(ptr %in, !2344, !DIExpression(), !2343)
    #dbg_value(ptr %acc, !2345, !DIExpression(), !2343)
    #dbg_value(i32 0, !2346, !DIExpression(), !2348)
  br label %for.cond, !dbg !2349

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2350
    #dbg_value(i32 %i.0, !2346, !DIExpression(), !2348)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2351
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2353

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2354
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2354
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !2356
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2357
  %xor = xor i64 %1, %0, !dbg !2357
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !2357
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2358
    #dbg_value(i32 %inc, !2346, !DIExpression(), !2348)
  br label %for.cond, !dbg !2359, !llvm.loop !2360

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2362
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef nonnull %bins, ptr noundef nonnull %out) unnamed_addr #0 !dbg !2363 {
entry:
    #dbg_value(i32 5, !2366, !DIExpression(), !2367)
    #dbg_value(ptr %bins, !2368, !DIExpression(), !2367)
    #dbg_value(ptr %out, !2369, !DIExpression(), !2367)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 200, !dbg !2370
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2371
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr1) #4, !dbg !2372
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 440, !dbg !2373
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2374
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr3) #4, !dbg !2375
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2376
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2377
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5) #4, !dbg !2378
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2379
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2380
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr7) #4, !dbg !2381
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2382
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2383
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr8, ptr noundef nonnull %add.ptr9) #4, !dbg !2384
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2385
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2386
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr10, ptr noundef nonnull %add.ptr11) #4, !dbg !2387
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2388
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2389
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr12, ptr noundef nonnull %add.ptr13) #4, !dbg !2390
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2391
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2392
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr14, ptr noundef nonnull %add.ptr15) #4, !dbg !2393
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2394
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !2395
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr16, ptr noundef nonnull %add.ptr17) #4, !dbg !2396
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2397
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2398
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr19) #4, !dbg !2399
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !2400
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2401
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr20, ptr noundef nonnull %add.ptr21) #4, !dbg !2402
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2403
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !2404
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr22, ptr noundef nonnull %add.ptr23) #4, !dbg !2405
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2406
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2407
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef 5, ptr noundef nonnull %add.ptr24, ptr noundef nonnull %add.ptr25) #4, !dbg !2408
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !2409
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2410
  call fastcc void @m_vec_mul_add_x(i32 noundef 5, ptr noundef nonnull %add.ptr26, ptr noundef nonnull %add.ptr27) #4, !dbg !2411
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2412
  call fastcc void @m_vec_copy(i32 noundef 5, ptr noundef nonnull %add.ptr28, ptr noundef %out) #4, !dbg !2413
  ret void, !dbg !2414
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %in, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !2415 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2416, !DIExpression(), !2417)
    #dbg_value(ptr %in, !2418, !DIExpression(), !2417)
    #dbg_value(ptr %acc, !2419, !DIExpression(), !2417)
    #dbg_value(i64 1229782938247303441, !2420, !DIExpression(), !2417)
    #dbg_value(i32 0, !2421, !DIExpression(), !2423)
  br label %for.cond, !dbg !2424

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2425
    #dbg_value(i32 %i.0, !2421, !DIExpression(), !2423)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2426
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2428

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2429
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2429
  %and = and i64 %0, 1229782938247303441, !dbg !2431
    #dbg_value(i64 %and, !2432, !DIExpression(), !2433)
  %xor = lshr i64 %0, 1, !dbg !2434
  %shr = and i64 %xor, 8608480567731124087, !dbg !2434
  %mul = mul nuw i64 %and, 9, !dbg !2435
  %xor2 = xor i64 %shr, %mul, !dbg !2436
  %arrayidx3 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !2437
  %1 = load i64, ptr %arrayidx3, align 8, !dbg !2438
  %xor4 = xor i64 %1, %xor2, !dbg !2438
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !2438
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2439
    #dbg_value(i32 %inc, !2421, !DIExpression(), !2423)
  br label %for.cond, !dbg !2440, !llvm.loop !2441

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2443
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %in, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !2444 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2445, !DIExpression(), !2446)
    #dbg_value(ptr %in, !2447, !DIExpression(), !2446)
    #dbg_value(ptr %acc, !2448, !DIExpression(), !2446)
    #dbg_value(i64 -8608480567731124088, !2449, !DIExpression(), !2446)
    #dbg_value(i32 0, !2450, !DIExpression(), !2452)
  br label %for.cond, !dbg !2453

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2454
    #dbg_value(i32 %i.0, !2450, !DIExpression(), !2452)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2455
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2457

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2458
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2458
    #dbg_value(i64 %0, !2460, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2461)
  %xor = shl i64 %0, 1, !dbg !2462
  %shl = and i64 %xor, -1229782938247303442, !dbg !2462
  %and = lshr i64 %0, 3, !dbg !2463
  %shr = and i64 %and, 1229782938247303441, !dbg !2463
  %mul = mul nuw nsw i64 %shr, 3, !dbg !2464
  %xor2 = xor i64 %shl, %mul, !dbg !2465
  %arrayidx3 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !2466
  %1 = load i64, ptr %arrayidx3, align 8, !dbg !2467
  %xor4 = xor i64 %1, %xor2, !dbg !2467
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !2467
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2468
    #dbg_value(i32 %inc, !2450, !DIExpression(), !2452)
  br label %for.cond, !dbg !2469, !llvm.loop !2470

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2472
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef nonnull %in, ptr noundef nonnull %out) unnamed_addr #0 !dbg !2473 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2474, !DIExpression(), !2475)
    #dbg_value(ptr %in, !2476, !DIExpression(), !2475)
    #dbg_value(ptr %out, !2477, !DIExpression(), !2475)
    #dbg_value(i32 0, !2478, !DIExpression(), !2480)
  br label %for.cond, !dbg !2481

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2482
    #dbg_value(i32 %i.0, !2478, !DIExpression(), !2480)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2483
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2485

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2486
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2486
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %out, i32 %i.0, !dbg !2488
  store i64 %0, ptr %arrayidx1, align 8, !dbg !2489
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2490
    #dbg_value(i32 %inc, !2478, !DIExpression(), !2480)
  br label %for.cond, !dbg !2491, !llvm.loop !2492

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2494
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !2495 {
entry:
    #dbg_value(ptr %p, !2526, !DIExpression(), !2527)
    #dbg_value(ptr %in, !2528, !DIExpression(), !2527)
    #dbg_value(ptr %out, !2529, !DIExpression(), !2527)
    #dbg_value(i32 %size, !2530, !DIExpression(), !2527)
    #dbg_value(i32 5, !2531, !DIExpression(), !2527)
    #dbg_value(i32 0, !2532, !DIExpression(), !2527)
    #dbg_value(i32 0, !2533, !DIExpression(), !2535)
  %0 = icmp sgt i32 %size, 0, !dbg !2536
  %1 = select i1 %0, i32 %size, i32 0, !dbg !2536
  br label %for.cond, !dbg !2536

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !2537
  %m_vecs_stored.0 = phi i32 [ 0, %entry ], [ %m_vecs_stored.1.lcssa, %for.inc15 ], !dbg !2537
  %r.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ], !dbg !2538
    #dbg_value(i32 %r.0, !2533, !DIExpression(), !2535)
    #dbg_value(i32 %m_vecs_stored.0, !2532, !DIExpression(), !2527)
  %exitcond1 = icmp ne i32 %r.0, %1, !dbg !2539
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end17, !dbg !2541

for.cond1.preheader:                              ; preds = %for.cond
  %2 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !2542
  br label %for.cond1, !dbg !2542

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !2527
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !2545
    #dbg_value(i32 %c.0, !2546, !DIExpression(), !2547)
    #dbg_value(i32 %m_vecs_stored.1, !2532, !DIExpression(), !2527)
  %exitcond = icmp ne i32 %m_vecs_stored.1, %2, !dbg !2548
  br i1 %exitcond, label %for.body3, label %for.inc15, !dbg !2542

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !2550
  %add = add nsw i32 %mul, %c.0, !dbg !2552
  %add.ptr.idx = mul nsw i32 %add, 40, !dbg !2553
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !2553
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !2554
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !2554
  call fastcc void @m_vec_copy.17(i32 noundef 5, ptr noundef %add.ptr, ptr noundef %add.ptr6) #4, !dbg !2555
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !2556
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !2556

if.then:                                          ; preds = %for.body3
  %mul8 = mul nsw i32 %c.0, %size, !dbg !2558
  %add9 = add nsw i32 %mul8, %r.0, !dbg !2560
  %add.ptr11.idx = mul nsw i32 %add9, 40, !dbg !2561
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !2561
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !2562
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !2562
  call fastcc void @m_vec_add.18(i32 noundef 5, ptr noundef %add.ptr11, ptr noundef %add.ptr13) #4, !dbg !2563
  br label %for.inc, !dbg !2564

for.inc:                                          ; preds = %for.body3, %if.then
    #dbg_value(i32 %m_vecs_stored.1, !2532, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2527)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !2565
    #dbg_value(i32 %inc, !2532, !DIExpression(), !2527)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !2566
    #dbg_value(i32 %inc14, !2546, !DIExpression(), !2547)
  br label %for.cond1, !dbg !2567, !llvm.loop !2568

for.inc15:                                        ; preds = %for.cond1
  %m_vecs_stored.1.lcssa = phi i32 [ %m_vecs_stored.1, %for.cond1 ], !dbg !2527
  %inc16 = add nuw i32 %r.0, 1, !dbg !2570
    #dbg_value(i32 %inc16, !2533, !DIExpression(), !2535)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2571
  br label %for.cond, !dbg !2571, !llvm.loop !2572

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !2574
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2575 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2576, !DIExpression(), !2577)
    #dbg_value(ptr %in, !2578, !DIExpression(), !2577)
    #dbg_value(ptr %out, !2579, !DIExpression(), !2577)
    #dbg_value(i32 0, !2580, !DIExpression(), !2582)
  br label %for.cond, !dbg !2583

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2584
    #dbg_value(i32 %i.0, !2580, !DIExpression(), !2582)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2585
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2587

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2588
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2588
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %out, i32 %i.0, !dbg !2590
  store i64 %0, ptr %arrayidx1, align 8, !dbg !2591
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2592
    #dbg_value(i32 %inc, !2580, !DIExpression(), !2582)
  br label %for.cond, !dbg !2593, !llvm.loop !2594

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2596
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2597 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2598, !DIExpression(), !2599)
    #dbg_value(ptr %in, !2600, !DIExpression(), !2599)
    #dbg_value(ptr %acc, !2601, !DIExpression(), !2599)
    #dbg_value(i32 0, !2602, !DIExpression(), !2604)
  br label %for.cond, !dbg !2605

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2606
    #dbg_value(i32 %i.0, !2602, !DIExpression(), !2604)
  %exitcond = icmp ne i32 %i.0, 5, !dbg !2607
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2609

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !2610
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2610
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !2612
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2613
  %xor = xor i64 %1, %0, !dbg !2613
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !2613
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2614
    #dbg_value(i32 %inc, !2602, !DIExpression(), !2604)
  br label %for.cond, !dbg !2615, !llvm.loop !2616

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2618
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !2619 {
entry:
  %Ar = alloca [78 x i8], align 1
    #dbg_value(ptr %p, !2622, !DIExpression(), !2623)
    #dbg_value(ptr %A, !2624, !DIExpression(), !2623)
    #dbg_value(ptr %y, !2625, !DIExpression(), !2623)
    #dbg_value(ptr %r, !2626, !DIExpression(), !2623)
    #dbg_value(ptr %x, !2627, !DIExpression(), !2623)
    #dbg_value(i32 %k, !2628, !DIExpression(), !2623)
    #dbg_value(i32 %o, !2629, !DIExpression(), !2623)
    #dbg_value(i32 %m, !2630, !DIExpression(), !2623)
    #dbg_value(i32 %A_cols, !2631, !DIExpression(), !2623)
    #dbg_value(i32 0, !2632, !DIExpression(), !2634)
  %0 = mul nsw i32 %o, %k, !dbg !2635
  %1 = icmp sgt i32 %0, 0, !dbg !2635
  %2 = select i1 %1, i32 %0, i32 0, !dbg !2635
  br label %for.cond, !dbg !2635

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2636
    #dbg_value(i32 %i.0, !2632, !DIExpression(), !2634)
  %exitcond = icmp ne i32 %i.0, %2, !dbg !2637
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !2639

for.cond3.preheader:                              ; preds = %for.cond
  %3 = icmp sgt i32 %m, 0, !dbg !2640
  %4 = select i1 %3, i32 %m, i32 0, !dbg !2640
  br label %for.cond3, !dbg !2640

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2642
  %5 = load i8, ptr %arrayidx, align 1, !dbg !2642
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2644
  store i8 %5, ptr %arrayidx1, align 1, !dbg !2645
  %inc = add nuw i32 %i.0, 1, !dbg !2646
    #dbg_value(i32 %inc, !2632, !DIExpression(), !2634)
  br label %for.cond, !dbg !2647, !llvm.loop !2648

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !2650
    #dbg_value(i32 %i2.0, !2651, !DIExpression(), !2652)
  %exitcond14 = icmp ne i32 %i2.0, %4, !dbg !2653
  br i1 %exitcond14, label %for.body5, label %for.end13, !dbg !2640

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !2655
  %mul7 = mul nsw i32 %k, %o, !dbg !2657
  %add = add nsw i32 %mul7, 1, !dbg !2658
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !2659
  %6 = getelementptr i8, ptr %A, i32 %mul6, !dbg !2660
  %arrayidx10 = getelementptr i8, ptr %6, i32 %mul8, !dbg !2660
  store i8 0, ptr %arrayidx10, align 1, !dbg !2661
  %inc12 = add nuw i32 %i2.0, 1, !dbg !2662
    #dbg_value(i32 %inc12, !2651, !DIExpression(), !2652)
  br label %for.cond3, !dbg !2663, !llvm.loop !2664

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !2666
  %add15 = add nsw i32 %mul14, 1, !dbg !2667
  call fastcc void @mat_mul.21(ptr noundef %A, ptr noundef %r, ptr noundef nonnull %Ar, i32 noundef %add15, i32 noundef %m, i32 noundef 1) #4, !dbg !2668
    #dbg_value(i32 0, !2669, !DIExpression(), !2671)
  br label %for.cond17, !dbg !2672

for.cond17:                                       ; preds = %for.body19, %for.end13
  %i16.0 = phi i32 [ 0, %for.end13 ], [ %inc29, %for.body19 ], !dbg !2673
    #dbg_value(i32 %i16.0, !2669, !DIExpression(), !2671)
  %exitcond15 = icmp ne i32 %i16.0, %4, !dbg !2674
  br i1 %exitcond15, label %for.body19, label %for.end30, !dbg !2676

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !2677
  %7 = load i8, ptr %arrayidx20, align 1, !dbg !2677
  %arrayidx21 = getelementptr inbounds nuw [78 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !2679
  %8 = load i8, ptr %arrayidx21, align 1, !dbg !2679
  %call = call fastcc zeroext i8 @sub_f(i8 noundef zeroext %7, i8 noundef zeroext %8) #4, !dbg !2680
  %mul22 = mul nsw i32 %k, %o, !dbg !2681
  %mul23 = mul nsw i32 %k, %o, !dbg !2682
  %add24 = add nsw i32 %mul23, 1, !dbg !2683
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !2684
  %9 = getelementptr i8, ptr %A, i32 %mul22, !dbg !2685
  %arrayidx27 = getelementptr i8, ptr %9, i32 %mul25, !dbg !2685
  store i8 %call, ptr %arrayidx27, align 1, !dbg !2686
  %inc29 = add nuw i32 %i16.0, 1, !dbg !2687
    #dbg_value(i32 %inc29, !2669, !DIExpression(), !2671)
  br label %for.cond17, !dbg !2688, !llvm.loop !2689

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !2691
  %add32 = add nsw i32 %mul31, 1, !dbg !2692
  call fastcc void @EF(ptr noundef %A, i32 noundef %m, i32 noundef %add32) #4, !dbg !2693
    #dbg_value(i8 0, !2694, !DIExpression(), !2623)
    #dbg_value(i32 0, !2695, !DIExpression(), !2697)
  %10 = add i32 %A_cols, -1, !dbg !2698
  %11 = icmp sgt i32 %10, 0, !dbg !2698
  %12 = select i1 %11, i32 %10, i32 0, !dbg !2698
  br label %for.cond34, !dbg !2698

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %full_rank.0 = phi i8 [ 0, %for.end30 ], [ %or12, %for.inc43 ], !dbg !2623
  %i33.0 = phi i32 [ 0, %for.end30 ], [ %inc44, %for.inc43 ], !dbg !2699
    #dbg_value(i32 %i33.0, !2695, !DIExpression(), !2697)
    #dbg_value(i8 %full_rank.0, !2694, !DIExpression(), !2623)
  %exitcond17 = icmp ne i32 %i33.0, %12, !dbg !2700
  br i1 %exitcond17, label %for.inc43, label %for.end45, !dbg !2702

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !2694, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2623)
  %sub37 = add nsw i32 %m, -1, !dbg !2703
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !2705
  %13 = getelementptr i8, ptr %A, i32 %mul38, !dbg !2706
  %arrayidx40 = getelementptr i8, ptr %13, i32 %i33.0, !dbg !2706
  %14 = load i8, ptr %arrayidx40, align 1, !dbg !2706
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %14), !2694, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2623)
  %or12 = or i8 %full_rank.0, %14, !dbg !2707
    #dbg_value(i8 %or12, !2694, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2623)
    #dbg_value(i8 %or12, !2694, !DIExpression(), !2623)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !2708
    #dbg_value(i32 %inc44, !2695, !DIExpression(), !2697)
  br label %for.cond34, !dbg !2709, !llvm.loop !2710

for.end45:                                        ; preds = %for.cond34
  %full_rank.0.lcssa = phi i8 [ %full_rank.0, %for.cond34 ], !dbg !2623
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0, !dbg !2712
  br i1 %cmp47, label %return, label %for.cond50.preheader, !dbg !2712

for.cond50.preheader:                             ; preds = %for.end45
  br label %for.cond50, !dbg !2714

for.cond50.loopexit:                              ; preds = %for.cond63
  br label %for.cond50, !dbg !2714, !llvm.loop !2716

for.cond50:                                       ; preds = %for.cond50.preheader, %for.cond50.loopexit
  %row.0.in = phi i32 [ %row.0, %for.cond50.loopexit ], [ %m, %for.cond50.preheader ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !2718
    #dbg_value(i32 %row.0, !2719, !DIExpression(), !2720)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !2721
  br i1 %cmp51, label %for.body53, label %return.loopexit, !dbg !2714

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !2723, !DIExpression(), !2623)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !2724
  %div = sdiv i32 32, %sub54, !dbg !2724
  %add55 = add nsw i32 %row.0, %div, !dbg !2724
  %mul56 = mul nsw i32 %k, %o, !dbg !2724
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !2724
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !2724

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !2724
  %div60 = sdiv i32 32, %sub59, !dbg !2724
  %add61 = add nsw i32 %row.0, %div60, !dbg !2724
  br label %cond.end, !dbg !2724

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !2724
  br label %cond.end, !dbg !2724

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !2724
    #dbg_value(i32 %cond, !2726, !DIExpression(), !2623)
    #dbg_value(i32 %row.0, !2727, !DIExpression(), !2729)
  br label %for.cond63, !dbg !2730

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !2731
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !2732
    #dbg_value(i32 %col.0, !2727, !DIExpression(), !2729)
    #dbg_value(i8 %finished.0, !2723, !DIExpression(), !2623)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !2733
  br i1 %cmp64.not, label %for.cond50.loopexit, label %for.body66, !dbg !2735

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !2736
  %15 = getelementptr i8, ptr %A, i32 %mul67, !dbg !2738
  %arrayidx69 = getelementptr i8, ptr %15, i32 %col.0, !dbg !2738
  %16 = load i8, ptr %arrayidx69, align 1, !dbg !2738
  %call70 = call fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %16, i8 noundef zeroext 0) #4, !dbg !2739
  %not = xor i8 %finished.0, -1, !dbg !2740
    #dbg_value(!DIArgList(i8 %call70, i8 %not), !2741, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !2623)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !2742
  %17 = getelementptr i8, ptr %A, i32 %add76, !dbg !2743
  %arrayidx78 = getelementptr i8, ptr %17, i32 -1, !dbg !2743
  %18 = load i8, ptr %arrayidx78, align 1, !dbg !2743
  %19 = and i8 %18, %not, !dbg !2744
  %and801 = and i8 %19, %call70, !dbg !2744
    #dbg_value(i8 %and801, !2745, !DIExpression(), !2746)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !2747
  %20 = load i8, ptr %arrayidx83, align 1, !dbg !2748
  %xor2 = xor i8 %20, %and801, !dbg !2748
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !2748
    #dbg_value(i32 0, !2749, !DIExpression(), !2751)
  br label %for.cond87, !dbg !2752

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !2753
    #dbg_value(i32 %i86.0, !2749, !DIExpression(), !2751)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !2754
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !2756

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !2757
  %21 = getelementptr i8, ptr %A, i32 %mul91, !dbg !2759
  %arrayidx93 = getelementptr i8, ptr %21, i32 %col.0, !dbg !2759
  %22 = load i8, ptr %arrayidx93, align 1, !dbg !2759
  %conv94 = zext i8 %22 to i64, !dbg !2760
  %add95 = or disjoint i32 %i86.0, 1, !dbg !2761
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !2762
  %23 = getelementptr i8, ptr %A, i32 %mul96, !dbg !2763
  %arrayidx98 = getelementptr i8, ptr %23, i32 %col.0, !dbg !2763
  %24 = load i8, ptr %arrayidx98, align 1, !dbg !2763
  %conv99 = zext i8 %24 to i64, !dbg !2764
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !2765
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !2766
  %add102 = or disjoint i32 %i86.0, 2, !dbg !2767
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !2768
  %25 = getelementptr i8, ptr %A, i32 %mul103, !dbg !2769
  %arrayidx105 = getelementptr i8, ptr %25, i32 %col.0, !dbg !2769
  %26 = load i8, ptr %arrayidx105, align 1, !dbg !2769
  %conv106 = zext i8 %26 to i64, !dbg !2770
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !2771
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !2772
  %add109 = or disjoint i32 %i86.0, 3, !dbg !2773
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !2774
  %27 = getelementptr i8, ptr %A, i32 %mul110, !dbg !2775
  %arrayidx112 = getelementptr i8, ptr %27, i32 %col.0, !dbg !2775
  %28 = load i8, ptr %arrayidx112, align 1, !dbg !2775
  %conv113 = zext i8 %28 to i64, !dbg !2776
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !2777
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !2778
  %add116 = or disjoint i32 %i86.0, 4, !dbg !2779
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !2780
  %29 = getelementptr i8, ptr %A, i32 %mul117, !dbg !2781
  %arrayidx119 = getelementptr i8, ptr %29, i32 %col.0, !dbg !2781
  %30 = load i8, ptr %arrayidx119, align 1, !dbg !2781
  %conv120 = zext i8 %30 to i64, !dbg !2782
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !2783
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !2784
  %add123 = or disjoint i32 %i86.0, 5, !dbg !2785
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !2786
  %31 = getelementptr i8, ptr %A, i32 %mul124, !dbg !2787
  %arrayidx126 = getelementptr i8, ptr %31, i32 %col.0, !dbg !2787
  %32 = load i8, ptr %arrayidx126, align 1, !dbg !2787
  %conv127 = zext i8 %32 to i64, !dbg !2788
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !2789
  %xor129 = xor i64 %xor122, %shl128, !dbg !2790
  %add130 = or disjoint i32 %i86.0, 6, !dbg !2791
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !2792
  %33 = getelementptr i8, ptr %A, i32 %mul131, !dbg !2793
  %arrayidx133 = getelementptr i8, ptr %33, i32 %col.0, !dbg !2793
  %34 = load i8, ptr %arrayidx133, align 1, !dbg !2793
  %conv134 = zext i8 %34 to i64, !dbg !2794
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !2795
  %xor136 = xor i64 %xor129, %shl135, !dbg !2796
  %add137 = or disjoint i32 %i86.0, 7, !dbg !2797
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !2798
  %35 = getelementptr i8, ptr %A, i32 %mul138, !dbg !2799
  %arrayidx140 = getelementptr i8, ptr %35, i32 %col.0, !dbg !2799
  %36 = load i8, ptr %arrayidx140, align 1, !dbg !2799
  %conv141 = zext i8 %36 to i64, !dbg !2800
  %shl142 = shl nuw i64 %conv141, 56, !dbg !2801
  %xor143 = xor i64 %xor136, %shl142, !dbg !2802
    #dbg_value(i64 %xor143, !2803, !DIExpression(), !2804)
  %call144 = call fastcc i64 @mul_fx8(i8 noundef zeroext %and801, i64 noundef %xor143) #4, !dbg !2805
    #dbg_value(i64 %call144, !2803, !DIExpression(), !2804)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !2806
  %add147 = mul i32 %mul1464, %A_cols, !dbg !2806
  %37 = getelementptr i8, ptr %A, i32 %add147, !dbg !2807
  %arrayidx149 = getelementptr i8, ptr %37, i32 -1, !dbg !2807
  %38 = load i8, ptr %arrayidx149, align 1, !dbg !2808
  %39 = trunc i64 %call144 to i8, !dbg !2808
  %40 = and i8 %39, 15, !dbg !2808
  %conv152 = xor i8 %40, %38, !dbg !2808
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !2808
  %shr = lshr i64 %call144, 8, !dbg !2809
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !2810
  %add156 = mul i32 %mul1555, %A_cols, !dbg !2810
  %41 = getelementptr i8, ptr %A, i32 %add156, !dbg !2811
  %arrayidx158 = getelementptr i8, ptr %41, i32 -1, !dbg !2811
  %42 = load i8, ptr %arrayidx158, align 1, !dbg !2812
  %43 = trunc i64 %shr to i8, !dbg !2812
  %44 = and i8 %43, 15, !dbg !2812
  %conv161 = xor i8 %44, %42, !dbg !2812
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !2812
  %shr162 = lshr i64 %call144, 16, !dbg !2813
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !2814
  %add166 = mul i32 %mul1656, %A_cols, !dbg !2814
  %45 = getelementptr i8, ptr %A, i32 %add166, !dbg !2815
  %arrayidx168 = getelementptr i8, ptr %45, i32 -1, !dbg !2815
  %46 = load i8, ptr %arrayidx168, align 1, !dbg !2816
  %47 = trunc i64 %shr162 to i8, !dbg !2816
  %48 = and i8 %47, 15, !dbg !2816
  %conv171 = xor i8 %48, %46, !dbg !2816
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !2816
  %shr172 = lshr i64 %call144, 24, !dbg !2817
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !2818
  %add176 = mul i32 %mul1757, %A_cols, !dbg !2818
  %49 = getelementptr i8, ptr %A, i32 %add176, !dbg !2819
  %arrayidx178 = getelementptr i8, ptr %49, i32 -1, !dbg !2819
  %50 = load i8, ptr %arrayidx178, align 1, !dbg !2820
  %51 = trunc i64 %shr172 to i8, !dbg !2820
  %52 = and i8 %51, 15, !dbg !2820
  %conv181 = xor i8 %52, %50, !dbg !2820
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !2820
  %shr182 = lshr i64 %call144, 32, !dbg !2821
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !2822
  %add186 = mul i32 %mul1858, %A_cols, !dbg !2822
  %53 = getelementptr i8, ptr %A, i32 %add186, !dbg !2823
  %arrayidx188 = getelementptr i8, ptr %53, i32 -1, !dbg !2823
  %54 = load i8, ptr %arrayidx188, align 1, !dbg !2824
  %55 = trunc i64 %shr182 to i8, !dbg !2824
  %56 = and i8 %55, 15, !dbg !2824
  %conv191 = xor i8 %56, %54, !dbg !2824
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !2824
  %shr192 = lshr i64 %call144, 40, !dbg !2825
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !2826
  %add196 = mul i32 %mul1959, %A_cols, !dbg !2826
  %57 = getelementptr i8, ptr %A, i32 %add196, !dbg !2827
  %arrayidx198 = getelementptr i8, ptr %57, i32 -1, !dbg !2827
  %58 = load i8, ptr %arrayidx198, align 1, !dbg !2828
  %59 = trunc i64 %shr192 to i8, !dbg !2828
  %60 = and i8 %59, 15, !dbg !2828
  %conv201 = xor i8 %60, %58, !dbg !2828
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !2828
  %shr202 = lshr i64 %call144, 48, !dbg !2829
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !2830
  %add206 = mul i32 %mul20510, %A_cols, !dbg !2830
  %61 = getelementptr i8, ptr %A, i32 %add206, !dbg !2831
  %arrayidx208 = getelementptr i8, ptr %61, i32 -1, !dbg !2831
  %62 = load i8, ptr %arrayidx208, align 1, !dbg !2832
  %63 = trunc i64 %shr202 to i8, !dbg !2832
  %64 = and i8 %63, 15, !dbg !2832
  %conv211 = xor i8 %64, %62, !dbg !2832
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !2832
  %shr212 = lshr i64 %call144, 56, !dbg !2833
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !2834
  %add216 = mul i32 %mul21511, %A_cols, !dbg !2834
  %65 = getelementptr i8, ptr %A, i32 %add216, !dbg !2835
  %arrayidx218 = getelementptr i8, ptr %65, i32 -1, !dbg !2835
  %66 = load i8, ptr %arrayidx218, align 1, !dbg !2836
  %67 = trunc nuw nsw i64 %shr212 to i8, !dbg !2836
  %conv221 = xor i8 %66, %67, !dbg !2836
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !2836
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !2837
    #dbg_value(i32 %add223, !2749, !DIExpression(), !2751)
  br label %for.cond87, !dbg !2838, !llvm.loop !2839

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %call70), !2723, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2623)
  %or2273 = or i8 %finished.0, %call70, !dbg !2841
    #dbg_value(i8 %or2273, !2723, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2623)
    #dbg_value(i8 %or2273, !2723, !DIExpression(), !2623)
  %inc230 = add nsw i32 %col.0, 1, !dbg !2842
    #dbg_value(i32 %inc230, !2727, !DIExpression(), !2729)
  br label %for.cond63, !dbg !2843, !llvm.loop !2844

return.loopexit:                                  ; preds = %for.cond50
  br label %return, !dbg !2846

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ], !dbg !2623
  ret i32 %retval.0, !dbg !2846
}

; Function Attrs: nounwind
define internal fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef nonnull %c, i32 noundef range(i32 -2147483647, -2147483648) %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !2847 {
entry:
    #dbg_value(ptr %a, !2848, !DIExpression(), !2849)
    #dbg_value(ptr %b, !2850, !DIExpression(), !2849)
    #dbg_value(ptr %c, !2851, !DIExpression(), !2849)
    #dbg_value(i32 %colrow_ab, !2852, !DIExpression(), !2849)
    #dbg_value(i32 %row_a, !2853, !DIExpression(), !2849)
    #dbg_value(i32 1, !2854, !DIExpression(), !2849)
    #dbg_value(i32 0, !2855, !DIExpression(), !2857)
  %0 = icmp sgt i32 %row_a, 0, !dbg !2858
  %1 = select i1 %0, i32 %row_a, i32 0, !dbg !2858
  br label %for.cond, !dbg !2858

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !2859
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1.lcssa, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !2848, !DIExpression(), !2849)
    #dbg_value(ptr %c.addr.0, !2851, !DIExpression(), !2849)
    #dbg_value(i32 %i.0, !2855, !DIExpression(), !2857)
  %exitcond = icmp ne i32 %i.0, %1, !dbg !2860
  br i1 %exitcond, label %for.cond1.preheader, label %for.end7, !dbg !2862

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2863

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond1.preheader ]
  %cmp2 = phi i1 [ false, %for.body3 ], [ true, %for.cond1.preheader ], !dbg !2866
    #dbg_value(i32 poison, !2867, !DIExpression(), !2868)
    #dbg_value(ptr %c.addr.1, !2851, !DIExpression(), !2849)
  br i1 %cmp2, label %for.body3, label %for.inc4, !dbg !2863

for.body3:                                        ; preds = %for.cond1
  %call = call fastcc zeroext i8 @lincomb.24(ptr noundef %a.addr.0, ptr noundef %b, i32 noundef %colrow_ab, i32 noundef 1) #4, !dbg !2869
  store i8 %call, ptr %c.addr.1, align 1, !dbg !2872
    #dbg_value(i32 1, !2867, !DIExpression(), !2868)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !2873
    #dbg_value(ptr %incdec.ptr, !2851, !DIExpression(), !2849)
  br label %for.cond1, !dbg !2874, !llvm.loop !2875

for.inc4:                                         ; preds = %for.cond1
  %c.addr.1.lcssa = phi ptr [ %c.addr.1, %for.cond1 ]
  %inc5 = add nuw i32 %i.0, 1, !dbg !2877
    #dbg_value(i32 %inc5, !2855, !DIExpression(), !2857)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !2878
    #dbg_value(ptr %add.ptr6, !2848, !DIExpression(), !2849)
  br label %for.cond, !dbg !2879, !llvm.loop !2880

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !2882
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2883 {
entry:
    #dbg_value(i8 %a, !2884, !DIExpression(), !2885)
    #dbg_value(i8 %b, !2886, !DIExpression(), !2885)
  %xor1 = xor i8 %a, %b, !dbg !2887
  ret i8 %xor1, !dbg !2888
}

; Function Attrs: nounwind
define internal fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef range(i32 -2147483647, -2147483648) %ncols) unnamed_addr #0 !dbg !2889 {
entry:
  %_pivot_row = alloca [6 x i64], align 32
  %_pivot_row2 = alloca [6 x i64], align 32
  %packed_A = alloca [468 x i64], align 32
  %temp = alloca [96 x i8], align 1
    #dbg_value(ptr %A, !2893, !DIExpression(), !2894)
    #dbg_value(i32 %nrows, !2895, !DIExpression(), !2894)
    #dbg_value(i32 %ncols, !2896, !DIExpression(), !2894)
    #dbg_declare(ptr %_pivot_row, !2897, !DIExpression(), !2901)
    #dbg_declare(ptr %_pivot_row2, !2902, !DIExpression(), !2903)
    #dbg_declare(ptr %packed_A, !2904, !DIExpression(), !2908)
  call void @mayo_memset(ptr %packed_A, i8 0, i32 3744), !dbg !2908
  %add = add nsw i32 %ncols, 15, !dbg !2909
  %div = sdiv i32 %add, 16, !dbg !2910
    #dbg_value(i32 %div, !2911, !DIExpression(), !2894)
    #dbg_value(i32 0, !2912, !DIExpression(), !2914)
  %0 = icmp sgt i32 %nrows, 0, !dbg !2915
  %1 = select i1 %0, i32 %nrows, i32 0, !dbg !2915
  br label %for.cond, !dbg !2915

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2916
    #dbg_value(i32 %i.0, !2912, !DIExpression(), !2914)
  %exitcond = icmp ne i32 %i.0, %1, !dbg !2917
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !2919

for.cond3.preheader:                              ; preds = %for.cond
  %2 = icmp sgt i32 %div, 0, !dbg !2920
  %3 = select i1 %2, i32 %div, i32 0, !dbg !2920
  %4 = icmp sgt i32 %ncols, 0, !dbg !2920
  %5 = select i1 %4, i32 %ncols, i32 0, !dbg !2920
  br label %for.cond3, !dbg !2920

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %ncols, !dbg !2922
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul, !dbg !2924
  %mul1 = mul nsw i32 %i.0, %div, !dbg !2925
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1, !dbg !2926
  call fastcc void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef %ncols) #4, !dbg !2927
  %inc = add nuw i32 %i.0, 1, !dbg !2928
    #dbg_value(i32 %inc, !2912, !DIExpression(), !2914)
  br label %for.cond, !dbg !2929, !llvm.loop !2930

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc117
  %pivot_col.0 = phi i32 [ %inc118, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2932
  %pivot_row.0 = phi i32 [ %conv116, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2894
    #dbg_value(i32 %pivot_row.0, !2933, !DIExpression(), !2894)
    #dbg_value(i32 %pivot_col.0, !2934, !DIExpression(), !2935)
  %exitcond6 = icmp ne i32 %pivot_col.0, %5, !dbg !2936
  br i1 %exitcond6, label %for.body5, label %for.cond121.preheader, !dbg !2920

for.cond121.preheader:                            ; preds = %for.cond3
  br label %for.cond121, !dbg !2938

for.body5:                                        ; preds = %for.cond3
  %add6 = add nsw i32 %pivot_col.0, %nrows, !dbg !2940
  %cmp7 = icmp slt i32 %add6, %ncols, !dbg !2940
  %add8 = add nsw i32 %pivot_col.0, %nrows, !dbg !2940
  %sub9 = sub nsw i32 %add8, %ncols, !dbg !2940
  %cond = select i1 %cmp7, i32 0, i32 %sub9, !dbg !2940
    #dbg_value(i32 %cond, !2942, !DIExpression(), !2943)
  %sub13 = add nsw i32 %nrows, -1, !dbg !2944
    #dbg_value(i32 %cond16, !2945, !DIExpression(), !2943)
    #dbg_value(i32 0, !2946, !DIExpression(), !2948)
  br label %for.cond18, !dbg !2949

for.cond18:                                       ; preds = %for.body20, %for.body5
  %i17.0 = phi i32 [ 0, %for.body5 ], [ %inc23, %for.body20 ], !dbg !2950
    #dbg_value(i32 %i17.0, !2946, !DIExpression(), !2948)
  %exitcond2 = icmp ne i32 %i17.0, %3, !dbg !2951
  br i1 %exitcond2, label %for.body20, label %for.cond25.preheader, !dbg !2953

for.cond25.preheader:                             ; preds = %for.cond18
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0, !dbg !2944
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0, i32 %sub13, !dbg !2944
  br label %for.cond25, !dbg !2954

for.body20:                                       ; preds = %for.cond18
  %arrayidx = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %i17.0, !dbg !2956
  store i64 0, ptr %arrayidx, align 8, !dbg !2958
  %arrayidx21 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0, !dbg !2959
  store i64 0, ptr %arrayidx21, align 8, !dbg !2960
  %inc23 = add nuw nsw i32 %i17.0, 1, !dbg !2961
    #dbg_value(i32 %inc23, !2946, !DIExpression(), !2948)
  br label %for.cond18, !dbg !2962, !llvm.loop !2963

for.cond25:                                       ; preds = %for.cond25.preheader, %for.end48
  %pivot_is_zero.0 = phi i64 [ %not52, %for.end48 ], [ -1, %for.cond25.preheader ], !dbg !2943
  %pivot.0 = phi i8 [ %call50, %for.end48 ], [ 0, %for.cond25.preheader ], !dbg !2943
  %row.0 = phi i32 [ %inc54, %for.end48 ], [ %cond, %for.cond25.preheader ], !dbg !2965
    #dbg_value(i32 %row.0, !2966, !DIExpression(), !2965)
    #dbg_value(i8 %pivot.0, !2967, !DIExpression(), !2943)
    #dbg_value(i64 %pivot_is_zero.0, !2968, !DIExpression(), !2943)
  %add27 = add nsw i32 %cond16, 32, !dbg !2969
  %cmp28.not = icmp sgt i32 %nrows, %add27, !dbg !2969
  %sub30 = add nsw i32 %nrows, -1, !dbg !2969
  %add32 = add nsw i32 %cond16, 32, !dbg !2969
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30, !dbg !2969
  %cmp35.not = icmp sgt i32 %row.0, %cond34, !dbg !2971
  br i1 %cmp35.not, label %for.end55, label %for.body36, !dbg !2954

for.body36:                                       ; preds = %for.cond25
  %call = call fastcc i64 @ct_compare_64(i32 noundef %row.0, i32 noundef %pivot_row.0) #4, !dbg !2972
  %not = xor i64 %call, -1, !dbg !2974
    #dbg_value(i64 %not, !2975, !DIExpression(), !2976)
  %call37 = call fastcc i64 @ct_64_is_greater_than(i32 noundef %row.0, i32 noundef %pivot_row.0) #4, !dbg !2977
    #dbg_value(i64 %call37, !2978, !DIExpression(), !2976)
    #dbg_value(i32 0, !2979, !DIExpression(), !2981)
  br label %for.cond38, !dbg !2982

for.cond38:                                       ; preds = %for.body40, %for.body36
  %j.0 = phi i32 [ 0, %for.body36 ], [ %inc47, %for.body40 ], !dbg !2983
    #dbg_value(i32 %j.0, !2979, !DIExpression(), !2981)
  %exitcond3 = icmp ne i32 %j.0, %3, !dbg !2984
  br i1 %exitcond3, label %for.body40, label %for.end48, !dbg !2986

for.body40:                                       ; preds = %for.cond38
  %and = and i64 %call37, %pivot_is_zero.0, !dbg !2987
  %or = or i64 %and, %not, !dbg !2989
  %mul41 = mul nsw i32 %row.0, %div, !dbg !2990
  %add42 = add nsw i32 %mul41, %j.0, !dbg !2991
  %arrayidx43 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !2992
  %6 = load i64, ptr %arrayidx43, align 8, !dbg !2992
  %and44 = and i64 %or, %6, !dbg !2993
  %arrayidx45 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %j.0, !dbg !2994
  %7 = load i64, ptr %arrayidx45, align 8, !dbg !2995
  %xor = xor i64 %7, %and44, !dbg !2995
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !2995
  %inc47 = add nuw nsw i32 %j.0, 1, !dbg !2996
    #dbg_value(i32 %inc47, !2979, !DIExpression(), !2981)
  br label %for.cond38, !dbg !2997, !llvm.loop !2998

for.end48:                                        ; preds = %for.cond38
  %call50 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %_pivot_row, i32 noundef %pivot_col.0) #4, !dbg !3000
    #dbg_value(i8 %call50, !2967, !DIExpression(), !2943)
  %conv = zext nneg i8 %call50 to i32, !dbg !3001
  %call51 = call fastcc i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #4, !dbg !3002
    #dbg_value(i64 %call51, !2968, !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !2943)
  %not52 = xor i64 %call51, -1, !dbg !3003
    #dbg_value(i64 %not52, !2968, !DIExpression(), !2943)
  %inc54 = add nsw i32 %row.0, 1, !dbg !3004
    #dbg_value(i32 %inc54, !2966, !DIExpression(), !2965)
  br label %for.cond25, !dbg !3005, !llvm.loop !3006

for.end55:                                        ; preds = %for.cond25
  %pivot_is_zero.0.lcssa = phi i64 [ %pivot_is_zero.0, %for.cond25 ], !dbg !2943
  %pivot.0.lcssa = phi i8 [ %pivot.0, %for.cond25 ], !dbg !2943
  %call56 = call fastcc zeroext i8 @inverse_f(i8 noundef zeroext %pivot.0.lcssa) #4, !dbg !3008
    #dbg_value(i8 %call56, !3009, !DIExpression(), !2894)
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row, i8 noundef zeroext %call56, ptr noundef nonnull %_pivot_row2) #4, !dbg !3010
    #dbg_value(i32 %cond, !3011, !DIExpression(), !3013)
  br label %for.cond60, !dbg !3014

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %row59.0 = phi i32 [ %cond, %for.end55 ], [ %inc87, %for.inc86 ], !dbg !3015
    #dbg_value(i32 %row59.0, !3011, !DIExpression(), !3013)
  %cmp61.not = icmp sgt i32 %row59.0, %cond16, !dbg !3016
  br i1 %cmp61.not, label %for.cond90.preheader, label %for.body63, !dbg !3018

for.cond90.preheader:                             ; preds = %for.cond60
  br label %for.cond90, !dbg !3019

for.body63:                                       ; preds = %for.cond60
  %call64 = call fastcc i64 @ct_compare_64(i32 noundef %row59.0, i32 noundef %pivot_row.0) #4, !dbg !3021
  %and67.demorgan = or i64 %call64, %pivot_is_zero.0.lcssa, !dbg !3023
  %and67 = xor i64 %and67.demorgan, -1, !dbg !3023
    #dbg_value(i64 %and67, !3024, !DIExpression(), !3025)
    #dbg_value(i64 %and67.demorgan, !3026, !DIExpression(), !3025)
    #dbg_value(i32 0, !3027, !DIExpression(), !3029)
  br label %for.cond69, !dbg !3030

for.cond69:                                       ; preds = %for.body72, %for.body63
  %col.0 = phi i32 [ 0, %for.body63 ], [ %inc84, %for.body72 ], !dbg !3031
    #dbg_value(i32 %col.0, !3027, !DIExpression(), !3029)
  %exitcond4 = icmp ne i32 %col.0, %3, !dbg !3032
  br i1 %exitcond4, label %for.body72, label %for.inc86, !dbg !3034

for.body72:                                       ; preds = %for.cond69
  %mul73 = mul nsw i32 %row59.0, %div, !dbg !3035
  %add74 = add nsw i32 %mul73, %col.0, !dbg !3037
  %arrayidx75 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !3038
  %8 = load i64, ptr %arrayidx75, align 8, !dbg !3038
  %and76 = and i64 %and67.demorgan, %8, !dbg !3039
  %arrayidx77 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %col.0, !dbg !3040
  %9 = load i64, ptr %arrayidx77, align 8, !dbg !3040
  %and78 = and i64 %9, %and67, !dbg !3041
  %add79 = add i64 %and76, %and78, !dbg !3042
  %mul80 = mul nsw i32 %row59.0, %div, !dbg !3043
  %add81 = add nsw i32 %mul80, %col.0, !dbg !3044
  %arrayidx82 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !3045
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !3046
  %inc84 = add nuw nsw i32 %col.0, 1, !dbg !3047
    #dbg_value(i32 %inc84, !3027, !DIExpression(), !3029)
  br label %for.cond69, !dbg !3048, !llvm.loop !3049

for.inc86:                                        ; preds = %for.cond69
  %inc87 = add nsw i32 %row59.0, 1, !dbg !3051
    #dbg_value(i32 %inc87, !3011, !DIExpression(), !3013)
  br label %for.cond60, !dbg !3052, !llvm.loop !3053

for.cond90:                                       ; preds = %for.cond90.preheader, %for.body93
  %row89.0 = phi i32 [ %inc110, %for.body93 ], [ %cond, %for.cond90.preheader ], !dbg !3055
    #dbg_value(i32 %row89.0, !3056, !DIExpression(), !3057)
  %cmp91 = icmp slt i32 %row89.0, %nrows, !dbg !3058
  br i1 %cmp91, label %for.body93, label %for.inc117, !dbg !3019

for.body93:                                       ; preds = %for.cond90
  %cmp94 = icmp sgt i32 %row89.0, %pivot_row.0, !dbg !3060
    #dbg_value(i1 %cmp94, !3062, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3063)
  %mul98 = mul nsw i32 %row89.0, %div, !dbg !3064
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98, !dbg !3065
  %call100 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %add.ptr99, i32 noundef %pivot_col.0) #4, !dbg !3066
    #dbg_value(i8 %call100, !3067, !DIExpression(), !3063)
  %conv105 = select i1 %cmp94, i8 %call100, i8 0, !dbg !3068
  %mul107 = mul nsw i32 %row89.0, %div, !dbg !3069
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107, !dbg !3070
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row2, i8 noundef zeroext %conv105, ptr noundef nonnull %add.ptr108) #4, !dbg !3071
  %inc110 = add nsw i32 %row89.0, 1, !dbg !3072
    #dbg_value(i32 %inc110, !3056, !DIExpression(), !3057)
  br label %for.cond90, !dbg !3073, !llvm.loop !3074

for.inc117:                                       ; preds = %for.cond90
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0.lcssa, i32 %pivot_row.0), !2933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !2894)
  %10 = trunc i64 %pivot_is_zero.0.lcssa to i32, !dbg !3076
  %11 = add i32 %10, 1, !dbg !3076
  %conv116 = add i32 %11, %pivot_row.0, !dbg !3076
    #dbg_value(i32 %conv116, !2933, !DIExpression(), !2894)
  %inc118 = add nuw i32 %pivot_col.0, 1, !dbg !3077
    #dbg_value(i32 %inc118, !2934, !DIExpression(), !2935)
  br label %for.cond3, !dbg !3078, !llvm.loop !3079

for.cond121:                                      ; preds = %for.cond121.preheader, %for.inc141
  %i120.0 = phi i32 [ %inc142, %for.inc141 ], [ 0, %for.cond121.preheader ], !dbg !3081
    #dbg_value(i32 %i120.0, !3082, !DIExpression(), !3083)
  %exitcond8 = icmp ne i32 %i120.0, %1, !dbg !3084
  br i1 %exitcond8, label %for.body124, label %for.end143, !dbg !2938

for.body124:                                      ; preds = %for.cond121
  %mul126 = mul nsw i32 %i120.0, %div, !dbg !3086
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126, !dbg !3088
  call fastcc void @ef_unpack_m_vec(i32 noundef %div, ptr noundef nonnull %add.ptr127, ptr noundef nonnull %temp) #4, !dbg !3089
    #dbg_value(i32 0, !3090, !DIExpression(), !3092)
  br label %for.cond130, !dbg !3093

for.cond130:                                      ; preds = %for.body133, %for.body124
  %j129.0 = phi i32 [ 0, %for.body124 ], [ %inc139, %for.body133 ], !dbg !3094
    #dbg_value(i32 %j129.0, !3090, !DIExpression(), !3092)
  %exitcond7 = icmp ne i32 %j129.0, %5, !dbg !3095
  br i1 %exitcond7, label %for.body133, label %for.inc141, !dbg !3097

for.body133:                                      ; preds = %for.cond130
  %arrayidx134 = getelementptr inbounds nuw [96 x i8], ptr %temp, i32 0, i32 %j129.0, !dbg !3098
  %12 = load i8, ptr %arrayidx134, align 1, !dbg !3098
  %mul135 = mul nsw i32 %i120.0, %ncols, !dbg !3100
  %13 = getelementptr i8, ptr %A, i32 %mul135, !dbg !3101
  %arrayidx137 = getelementptr i8, ptr %13, i32 %j129.0, !dbg !3101
  store i8 %12, ptr %arrayidx137, align 1, !dbg !3102
  %inc139 = add nuw i32 %j129.0, 1, !dbg !3103
    #dbg_value(i32 %inc139, !3090, !DIExpression(), !3092)
  br label %for.cond130, !dbg !3104, !llvm.loop !3105

for.inc141:                                       ; preds = %for.cond130
  %inc142 = add nuw i32 %i120.0, 1, !dbg !3107
    #dbg_value(i32 %inc142, !3082, !DIExpression(), !3083)
  br label %for.cond121, !dbg !3108, !llvm.loop !3109

for.end143:                                       ; preds = %for.cond121
  call void @mayo_secure_clear(ptr noundef nonnull %temp, i32 noundef 96) #4, !dbg !3111
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row, i32 noundef 48) #4, !dbg !3112
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2, i32 noundef 48) #4, !dbg !3113
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A, i32 noundef 3744) #4, !dbg !3114
  ret void, !dbg !3115
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3116 {
entry:
    #dbg_value(i8 %a, !3118, !DIExpression(), !3119)
    #dbg_value(i8 0, !3120, !DIExpression(), !3119)
  %0 = icmp ne i8 %a, 0, !dbg !3121
  %conv3 = sext i1 %0 to i8, !dbg !3122
  %1 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3123
  %xor5 = xor i8 %1, %conv3, !dbg !3124
  ret i8 %xor5, !dbg !3125
}

; Function Attrs: nounwind
define internal fastcc range(i64 0, 1085102592571150096) i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) unnamed_addr #0 !dbg !3126 {
entry:
    #dbg_value(i8 %a, !3129, !DIExpression(), !3130)
    #dbg_value(i64 %b, !3131, !DIExpression(), !3130)
  %0 = and i8 %a, 1, !dbg !3132
  %conv1 = zext nneg i8 %0 to i64, !dbg !3133
  %mul = mul nuw nsw i64 %b, %conv1, !dbg !3134
    #dbg_value(i64 %mul, !3135, !DIExpression(), !3130)
  %1 = and i8 %a, 2, !dbg !3136
  %conv4 = zext nneg i8 %1 to i64, !dbg !3137
  %mul5 = mul i64 %b, %conv4, !dbg !3138
  %xor = xor i64 %mul, %mul5, !dbg !3139
    #dbg_value(i64 %xor, !3135, !DIExpression(), !3130)
  %2 = and i8 %a, 4, !dbg !3140
  %conv8 = zext nneg i8 %2 to i64, !dbg !3141
  %mul9 = mul i64 %b, %conv8, !dbg !3142
  %xor10 = xor i64 %xor, %mul9, !dbg !3143
    #dbg_value(i64 %xor10, !3135, !DIExpression(), !3130)
  %3 = and i8 %a, 8, !dbg !3144
  %conv13 = zext nneg i8 %3 to i64, !dbg !3145
  %mul14 = mul i64 %b, %conv13, !dbg !3146
  %xor15 = xor i64 %xor10, %mul14, !dbg !3147
    #dbg_value(i64 %xor15, !3135, !DIExpression(), !3130)
    #dbg_value(i64 %xor15, !3148, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3130)
  %shr = lshr i64 %xor15, 4, !dbg !3149
  %and16 = lshr i64 %xor15, 3, !dbg !3150
  %shr18 = and i64 %and16, 1012762419733073422, !dbg !3150
  %4 = xor i64 %shr, %shr18, !dbg !3151
  %xor19 = xor i64 %4, %xor15, !dbg !3151
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !3152
    #dbg_value(i64 %and20, !3153, !DIExpression(), !3130)
  ret i64 %and20, !dbg !3154
}

; Function Attrs: nounwind
define internal fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef nonnull %out, i32 noundef range(i32 -2147483647, -2147483648) %ncols) unnamed_addr #0 !dbg !3155 {
entry:
    #dbg_value(ptr %in, !3158, !DIExpression(), !3159)
    #dbg_value(ptr %out, !3160, !DIExpression(), !3159)
    #dbg_value(i32 %ncols, !3161, !DIExpression(), !3159)
    #dbg_value(ptr %out, !3162, !DIExpression(), !3159)
    #dbg_value(i32 0, !3163, !DIExpression(), !3159)
  br label %for.cond, !dbg !3164

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3166
    #dbg_value(i32 %i.0, !3163, !DIExpression(), !3159)
  %add = or disjoint i32 %i.0, 1, !dbg !3167
  %cmp = icmp slt i32 %add, %ncols, !dbg !3169
  br i1 %cmp, label %for.body, label %for.end, !dbg !3170

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3171
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3171
  %add2 = or disjoint i32 %i.0, 1, !dbg !3173
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2, !dbg !3174
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !3174
  %shl5 = shl i8 %1, 4, !dbg !3175
  %or = or i8 %shl5, %0, !dbg !3176
  %div = lshr exact i32 %i.0, 1, !dbg !3177
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div, !dbg !3178
  store i8 %or, ptr %arrayidx7, align 1, !dbg !3179
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3180
    #dbg_value(i32 %add8, !3163, !DIExpression(), !3159)
  br label %for.cond, !dbg !3181, !llvm.loop !3182

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !3166
  %2 = and i32 %ncols, -2147483647, !dbg !3184
  %cmp9 = icmp eq i32 %2, 1, !dbg !3184
  br i1 %cmp9, label %if.then, label %if.end, !dbg !3184

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0.lcssa, !dbg !3186
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !3186
  %div16 = lshr exact i32 %i.0.lcssa, 1, !dbg !3188
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16, !dbg !3189
  store i8 %3, ptr %arrayidx17, align 1, !dbg !3190
  br label %if.end, !dbg !3191

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !3192
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3193 {
entry:
    #dbg_value(i32 %a, !3196, !DIExpression(), !3197)
    #dbg_value(i32 %b, !3198, !DIExpression(), !3197)
  %xor = xor i32 %a, %b, !dbg !3199
  %0 = icmp sgt i32 %xor, 0, !dbg !3200
  %shr = sext i1 %0 to i64, !dbg !3200
  %1 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3201
  %xor1 = xor i64 %1, %shr, !dbg !3202
  ret i64 %xor1, !dbg !3203
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3204 {
entry:
    #dbg_value(i32 %a, !3205, !DIExpression(), !3206)
    #dbg_value(i32 %b, !3207, !DIExpression(), !3206)
    #dbg_value(!DIArgList(i32 %b, i32 %a), !3208, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3206)
  %0 = icmp slt i32 %b, %a, !dbg !3209
  %shr = sext i1 %0 to i64, !dbg !3209
  %1 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3210
  %xor = xor i64 %1, %shr, !dbg !3211
  ret i64 %xor, !dbg !3212
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @m_extract_element(ptr noundef nonnull %in, i32 noundef range(i32 -2147483648, 2147483647) %index) unnamed_addr #0 !dbg !3213 {
entry:
    #dbg_value(ptr %in, !3216, !DIExpression(), !3217)
    #dbg_value(i32 %index, !3218, !DIExpression(), !3217)
  %div = sdiv i32 %index, 16, !dbg !3219
    #dbg_value(i32 %div, !3220, !DIExpression(), !3217)
  %rem = srem i32 %index, 16, !dbg !3221
    #dbg_value(i32 %rem, !3222, !DIExpression(), !3217)
  %arrayidx = getelementptr inbounds i64, ptr %in, i32 %div, !dbg !3223
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3223
  %mul = shl nsw i32 %rem, 2, !dbg !3224
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3225
  %shr = lshr i64 %0, %sh_prom, !dbg !3225
  %1 = trunc i64 %shr to i8, !dbg !3226
  %conv = and i8 %1, 15, !dbg !3226
  ret i8 %conv, !dbg !3227
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext range(i8 0, 16) %a) unnamed_addr #0 !dbg !3228 {
entry:
    #dbg_value(i8 %a, !3231, !DIExpression(), !3232)
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %a) #4, !dbg !3233
    #dbg_value(i8 %call, !3234, !DIExpression(), !3232)
  %call1 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call) #4, !dbg !3235
    #dbg_value(i8 %call1, !3236, !DIExpression(), !3232)
  %call2 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call1, i8 noundef zeroext %call1) #4, !dbg !3237
    #dbg_value(i8 %call2, !3238, !DIExpression(), !3232)
  %call3 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call1) #4, !dbg !3239
    #dbg_value(i8 %call3, !3240, !DIExpression(), !3232)
  %call4 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call2, i8 noundef zeroext %call3) #4, !dbg !3241
    #dbg_value(i8 %call4, !3242, !DIExpression(), !3232)
  ret i8 %call4, !dbg !3243
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef range(i32 -134217727, 134217728) %legs, ptr noundef nonnull %in, i8 noundef zeroext range(i8 0, 16) %a, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !3244 {
entry:
    #dbg_value(i32 %legs, !3247, !DIExpression(), !3248)
    #dbg_value(ptr %in, !3249, !DIExpression(), !3248)
    #dbg_value(i8 %a, !3250, !DIExpression(), !3248)
    #dbg_value(ptr %acc, !3251, !DIExpression(), !3248)
  %call = call fastcc i32 @mul_table.22(i8 noundef zeroext %a) #4, !dbg !3252
    #dbg_value(i32 %call, !3253, !DIExpression(), !3248)
    #dbg_value(i64 1229782938247303441, !3254, !DIExpression(), !3248)
    #dbg_value(i32 0, !3255, !DIExpression(), !3257)
  %0 = icmp sgt i32 %legs, 0, !dbg !3258
  %1 = select i1 %0, i32 %legs, i32 0, !dbg !3258
  br label %for.cond, !dbg !3258

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3259
    #dbg_value(i32 %i.0, !3255, !DIExpression(), !3257)
  %exitcond = icmp ne i32 %i.0, %1, !dbg !3260
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3262

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3263
  %2 = load i64, ptr %arrayidx, align 8, !dbg !3263
  %and = and i64 %2, 1229782938247303441, !dbg !3265
  %and1 = and i32 %call, 255, !dbg !3266
  %conv = zext nneg i32 %and1 to i64, !dbg !3267
  %mul = mul i64 %and, %conv, !dbg !3268
  %shr = lshr i64 %2, 1, !dbg !3269
  %and3 = and i64 %shr, 1229782938247303441, !dbg !3270
  %shr4 = lshr i32 %call, 8, !dbg !3271
  %and5 = and i32 %shr4, 15, !dbg !3272
  %conv6 = zext nneg i32 %and5 to i64, !dbg !3273
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !3274
  %xor = xor i64 %mul, %mul7, !dbg !3275
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3276
  %3 = load i64, ptr %arrayidx8, align 8, !dbg !3276
  %shr9 = lshr i64 %3, 2, !dbg !3277
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !3278
  %shr11 = lshr i32 %call, 16, !dbg !3279
  %and12 = and i32 %shr11, 15, !dbg !3280
  %conv13 = zext nneg i32 %and12 to i64, !dbg !3281
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !3282
  %xor15 = xor i64 %xor, %mul14, !dbg !3283
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3284
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !3284
  %shr17 = lshr i64 %4, 3, !dbg !3285
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !3286
  %shr19 = lshr i32 %call, 24, !dbg !3287
  %and20 = and i32 %shr19, 15, !dbg !3288
  %conv21 = zext nneg i32 %and20 to i64, !dbg !3289
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !3290
  %xor23 = xor i64 %xor15, %mul22, !dbg !3291
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !3292
  %5 = load i64, ptr %arrayidx24, align 8, !dbg !3293
  %xor25 = xor i64 %5, %xor23, !dbg !3293
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !3293
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3294
    #dbg_value(i32 %inc, !3255, !DIExpression(), !3257)
  br label %for.cond, !dbg !3295, !llvm.loop !3296

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3298
}

; Function Attrs: nounwind
define internal fastcc void @ef_unpack_m_vec(i32 noundef range(i32 -134217727, 134217728) %legs, ptr noundef nonnull %in, ptr noundef nonnull %out) unnamed_addr #0 !dbg !3299 {
entry:
    #dbg_value(i32 %legs, !3302, !DIExpression(), !3303)
    #dbg_value(ptr %in, !3304, !DIExpression(), !3303)
    #dbg_value(ptr %out, !3305, !DIExpression(), !3303)
    #dbg_value(ptr %in, !3306, !DIExpression(), !3303)
    #dbg_value(i32 0, !3307, !DIExpression(), !3309)
  br label %for.cond, !dbg !3310

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3311
    #dbg_value(i32 %i.0, !3307, !DIExpression(), !3309)
  %mul = shl nsw i32 %legs, 4, !dbg !3312
  %cmp = icmp slt i32 %i.0, %mul, !dbg !3314
  br i1 %cmp, label %for.body, label %for.end, !dbg !3315

for.body:                                         ; preds = %for.cond
  %div = lshr exact i32 %i.0, 1, !dbg !3316
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %div, !dbg !3318
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3318
  %1 = and i8 %0, 15, !dbg !3319
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %out, i32 %i.0, !dbg !3320
  store i8 %1, ptr %arrayidx2, align 1, !dbg !3321
  %div3 = lshr exact i32 %i.0, 1, !dbg !3322
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %in, i32 %div3, !dbg !3323
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !3323
  %3 = lshr i8 %2, 4, !dbg !3324
  %add = or disjoint i32 %i.0, 1, !dbg !3325
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %add, !dbg !3326
  store i8 %3, ptr %arrayidx7, align 1, !dbg !3327
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3328
    #dbg_value(i32 %add8, !3307, !DIExpression(), !3309)
  br label %for.cond, !dbg !3329, !llvm.loop !3330

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3332
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, -2147483648) i32 @mul_table.22(i8 noundef zeroext range(i8 0, 16) %b) unnamed_addr #0 !dbg !3333 {
entry:
    #dbg_value(i8 %b, !3334, !DIExpression(), !3335)
  %conv = zext nneg i8 %b to i32, !dbg !3336
  %mul = mul nuw nsw i32 %conv, 134480385, !dbg !3337
    #dbg_value(i32 %mul, !3338, !DIExpression(), !3335)
    #dbg_value(i32 -252645136, !3339, !DIExpression(), !3335)
  %and = and i32 %mul, 1894838512, !dbg !3340
    #dbg_value(i32 %and, !3341, !DIExpression(), !3335)
  %shr = lshr exact i32 %and, 4, !dbg !3342
  %shr1 = lshr exact i32 %and, 3, !dbg !3343
  %0 = xor i32 %shr, %shr1, !dbg !3344
  %xor2 = xor i32 %0, %mul, !dbg !3344
  ret i32 %xor2, !dbg !3345
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3346 {
entry:
    #dbg_value(i8 %a, !3347, !DIExpression(), !3348)
    #dbg_value(i8 %b, !3349, !DIExpression(), !3348)
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3350
  %xor1 = xor i8 %a, %0, !dbg !3351
    #dbg_value(i8 %xor1, !3347, !DIExpression(), !3348)
  %1 = trunc i8 %xor1 to i1, !dbg !3352
    #dbg_value(i8 poison, !3353, !DIExpression(), !3348)
  %2 = and i8 %xor1, 2, !dbg !3354
  %mul9 = mul i8 %2, %b, !dbg !3355
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !3352
  %xor11 = xor i8 %conv10, %mul9, !dbg !3356
    #dbg_value(i8 %xor11, !3353, !DIExpression(), !3348)
  %3 = and i8 %xor1, 4, !dbg !3357
  %mul16 = mul i8 %3, %b, !dbg !3358
  %xor18 = xor i8 %mul16, %xor11, !dbg !3359
    #dbg_value(i8 %xor18, !3353, !DIExpression(), !3348)
  %4 = and i8 %xor1, 8, !dbg !3360
  %mul23 = mul i8 %4, %b, !dbg !3361
  %xor25 = xor i8 %mul23, %xor18, !dbg !3362
    #dbg_value(i8 %xor25, !3353, !DIExpression(), !3348)
    #dbg_value(i8 %xor25, !3363, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3348)
  %5 = lshr i8 %xor25, 4, !dbg !3364
  %6 = lshr i8 %xor25, 3, !dbg !3365
  %7 = and i8 %6, 14, !dbg !3365
  %8 = xor i8 %5, %7, !dbg !3366
  %xor25.masked = and i8 %xor25, 15, !dbg !3367
  %9 = xor i8 %8, %xor25.masked, !dbg !3367
    #dbg_value(i8 %9, !3368, !DIExpression(), !3348)
  ret i8 %9, !dbg !3369
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef range(i32 -2147483647, -2147483648) %n, i32 noundef %m) unnamed_addr #0 !dbg !3370 {
entry:
    #dbg_value(ptr %a, !3371, !DIExpression(), !3372)
    #dbg_value(ptr %b, !3373, !DIExpression(), !3372)
    #dbg_value(i32 %n, !3374, !DIExpression(), !3372)
    #dbg_value(i32 1, !3375, !DIExpression(), !3372)
    #dbg_value(i8 0, !3376, !DIExpression(), !3372)
    #dbg_value(i32 0, !3377, !DIExpression(), !3379)
  %0 = icmp sgt i32 %n, 0, !dbg !3380
  %1 = select i1 %0, i32 %n, i32 0, !dbg !3380
  br label %for.cond, !dbg !3380

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !3372
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3381
    #dbg_value(i32 %i.0, !3377, !DIExpression(), !3379)
    #dbg_value(ptr %b.addr.0, !3373, !DIExpression(), !3372)
    #dbg_value(i8 %ret.0, !3376, !DIExpression(), !3372)
  %exitcond = icmp ne i32 %i.0, %1, !dbg !3382
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3384

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3385
  %2 = load i8, ptr %arrayidx, align 1, !dbg !3385
  %3 = load i8, ptr %b.addr.0, align 1, !dbg !3387
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %2, i8 noundef zeroext %3) #4, !dbg !3388
  %call1 = call fastcc zeroext i8 @add_f.25(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #4, !dbg !3389
    #dbg_value(i8 %call1, !3376, !DIExpression(), !3372)
  %inc = add nuw i32 %i.0, 1, !dbg !3390
    #dbg_value(i32 %inc, !3377, !DIExpression(), !3379)
  %add.ptr = getelementptr inbounds nuw i8, ptr %b.addr.0, i32 1, !dbg !3391
    #dbg_value(ptr %add.ptr, !3373, !DIExpression(), !3372)
  br label %for.cond, !dbg !3392, !llvm.loop !3393

for.end:                                          ; preds = %for.cond
  %ret.0.lcssa = phi i8 [ %ret.0, %for.cond ], !dbg !3372
  ret i8 %ret.0.lcssa, !dbg !3395
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @add_f.25(i8 noundef zeroext range(i8 0, 16) %a, i8 noundef zeroext range(i8 0, 16) %b) unnamed_addr #0 !dbg !3396 {
entry:
    #dbg_value(i8 %a, !3397, !DIExpression(), !3398)
    #dbg_value(i8 %b, !3399, !DIExpression(), !3398)
  %xor1 = xor i8 %a, %b, !dbg !3400
  ret i8 %xor1, !dbg !3401
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3402 {
entry:
    #dbg_value(ptr %state, !3410, !DIExpression(), !3411)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !3412
  store ptr %call, ptr %state, align 4, !dbg !3413
  %cmp = icmp eq ptr %call, null, !dbg !3414
  br i1 %cmp, label %if.then, label %if.end, !dbg !3414

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !3416
  br label %if.end, !dbg !3418

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !3419
  call fastcc void @keccak_inc_init(ptr noundef %0) #4, !dbg !3420
  ret void, !dbg !3421
}

; Function Attrs: allocsize(0)
declare dso_local ptr @malloc(i32 noundef) local_unnamed_addr #3

declare dso_local void @exit(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define internal fastcc void @keccak_inc_init(ptr noundef %s_inc) unnamed_addr #0 !dbg !3422 {
entry:
    #dbg_value(ptr %s_inc, !3423, !DIExpression(), !3424)
    #dbg_value(i32 0, !3425, !DIExpression(), !3424)
  br label %for.cond, !dbg !3426

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3428
    #dbg_value(i32 %i.0, !3425, !DIExpression(), !3424)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3429
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3431

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s_inc, i32 %i.0, !dbg !3432
  store i64 0, ptr %arrayidx, align 8, !dbg !3434
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3435
    #dbg_value(i32 %inc, !3425, !DIExpression(), !3424)
  br label %for.cond, !dbg !3436, !llvm.loop !3437

for.end:                                          ; preds = %for.cond
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3439
  store i64 0, ptr %arrayidx1, align 8, !dbg !3440
  ret void, !dbg !3441
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3442 {
entry:
    #dbg_value(ptr %state, !3445, !DIExpression(), !3446)
    #dbg_value(ptr %input, !3447, !DIExpression(), !3446)
    #dbg_value(i32 %inlen, !3448, !DIExpression(), !3446)
  %0 = load ptr, ptr %state, align 4, !dbg !3449
  call fastcc void @keccak_inc_absorb(ptr noundef %0, i32 noundef 168, ptr noundef %input, i32 noundef %inlen) #4, !dbg !3450
  ret void, !dbg !3451
}

; Function Attrs: nounwind
define internal fastcc void @keccak_inc_absorb(ptr noundef %s_inc, i32 noundef range(i32 72, 169) %r, ptr noundef %m, i32 noundef %mlen) unnamed_addr #0 !dbg !3452 {
entry:
    #dbg_value(ptr %s_inc, !3455, !DIExpression(), !3456)
    #dbg_value(i32 %r, !3457, !DIExpression(), !3456)
    #dbg_value(ptr %m, !3458, !DIExpression(), !3456)
    #dbg_value(i32 %mlen, !3459, !DIExpression(), !3456)
  br label %while.cond, !dbg !3460

while.cond:                                       ; preds = %for.end, %entry
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr, %for.end ]
  %mlen.addr.0 = phi i32 [ %mlen, %entry ], [ %sub20, %for.end ]
    #dbg_value(i32 %mlen.addr.0, !3459, !DIExpression(), !3456)
    #dbg_value(ptr %m.addr.0, !3458, !DIExpression(), !3456)
  %conv = zext i32 %mlen.addr.0 to i64, !dbg !3461
  %arrayidx = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3462
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3462
  %add = add i64 %0, %conv, !dbg !3463
  %conv1 = zext nneg i32 %r to i64, !dbg !3464
  %cmp.not = icmp ult i64 %add, %conv1, !dbg !3465
  br i1 %cmp.not, label %for.cond25.preheader, label %for.cond.preheader, !dbg !3460

for.cond.preheader:                               ; preds = %while.cond
  br label %for.cond, !dbg !3466

for.cond25.preheader:                             ; preds = %while.cond
  %mlen.addr.0.lcssa1 = phi i32 [ %mlen.addr.0, %while.cond ]
  %m.addr.0.lcssa = phi ptr [ %m.addr.0, %while.cond ]
  %mlen.addr.0.lcssa = phi i32 [ %mlen.addr.0, %while.cond ]
  br label %for.cond25, !dbg !3469

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %i.0 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ], !dbg !3471
    #dbg_value(i32 %i.0, !3472, !DIExpression(), !3456)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3473
  %1 = load i64, ptr %arrayidx3, align 8, !dbg !3473
  %conv4 = trunc i64 %1 to i32, !dbg !3475
  %sub = sub i32 %r, %conv4, !dbg !3476
  %cmp5 = icmp ult i32 %i.0, %sub, !dbg !3477
  br i1 %cmp5, label %for.body, label %for.end, !dbg !3466

for.body:                                         ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 %i.0, !dbg !3478
  %2 = load i8, ptr %arrayidx7, align 1, !dbg !3478
  %conv8 = zext i8 %2 to i64, !dbg !3480
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3481
  %3 = load i64, ptr %arrayidx9, align 8, !dbg !3481
  %conv10 = zext i32 %i.0 to i64, !dbg !3482
  %add11 = add i64 %3, %conv10, !dbg !3483
  %and = shl i64 %add11, 3, !dbg !3484
  %mul = and i64 %and, 56, !dbg !3484
  %shl = shl nuw i64 %conv8, %mul, !dbg !3485
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3486
  %4 = load i64, ptr %arrayidx12, align 8, !dbg !3486
  %conv13 = zext i32 %i.0 to i64, !dbg !3487
  %add14 = add i64 %4, %conv13, !dbg !3488
  %shr = lshr i64 %add14, 3, !dbg !3489
  %idxprom = trunc i64 %shr to i32, !dbg !3490
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %idxprom, !dbg !3490
  %5 = load i64, ptr %arrayidx15, align 8, !dbg !3491
  %xor = xor i64 %5, %shl, !dbg !3491
  store i64 %xor, ptr %arrayidx15, align 8, !dbg !3491
  %inc = add nuw i32 %i.0, 1, !dbg !3492
    #dbg_value(i32 %inc, !3472, !DIExpression(), !3456)
  br label %for.cond, !dbg !3493, !llvm.loop !3494

for.end:                                          ; preds = %for.cond
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3496
  %6 = load i64, ptr %arrayidx17, align 8, !dbg !3496
  %7 = trunc i64 %6 to i32, !dbg !3497
  %conv19.neg = sub i32 %7, %r, !dbg !3497
  %sub20 = add i32 %conv19.neg, %mlen.addr.0, !dbg !3498
    #dbg_value(i32 %sub20, !3459, !DIExpression(), !3456)
  %8 = trunc i64 %6 to i32, !dbg !3499
  %idx.ext = sub i32 %r, %8, !dbg !3499
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 %idx.ext, !dbg !3499
    #dbg_value(ptr %add.ptr, !3458, !DIExpression(), !3456)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3500
  store i64 0, ptr %arrayidx24, align 8, !dbg !3501
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s_inc) #4, !dbg !3502
  br label %while.cond, !dbg !3460, !llvm.loop !3503

for.cond25:                                       ; preds = %for.cond25.preheader, %for.body28
  %i.1 = phi i32 [ %inc45, %for.body28 ], [ 0, %for.cond25.preheader ], !dbg !3505
    #dbg_value(i32 %i.1, !3472, !DIExpression(), !3456)
  %exitcond = icmp ne i32 %i.1, %mlen.addr.0.lcssa1, !dbg !3506
  br i1 %exitcond, label %for.body28, label %for.end46, !dbg !3469

for.body28:                                       ; preds = %for.cond25
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %m.addr.0.lcssa, i32 %i.1, !dbg !3508
  %9 = load i8, ptr %arrayidx29, align 1, !dbg !3508
  %conv30 = zext i8 %9 to i64, !dbg !3510
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3511
  %10 = load i64, ptr %arrayidx31, align 8, !dbg !3511
  %conv32 = zext i32 %i.1 to i64, !dbg !3512
  %add33 = add i64 %10, %conv32, !dbg !3513
  %and34 = shl i64 %add33, 3, !dbg !3514
  %mul35 = and i64 %and34, 56, !dbg !3514
  %shl36 = shl nuw i64 %conv30, %mul35, !dbg !3515
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3516
  %11 = load i64, ptr %arrayidx37, align 8, !dbg !3516
  %conv38 = zext i32 %i.1 to i64, !dbg !3517
  %add39 = add i64 %11, %conv38, !dbg !3518
  %shr40 = lshr i64 %add39, 3, !dbg !3519
  %idxprom41 = trunc i64 %shr40 to i32, !dbg !3520
  %arrayidx42 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %idxprom41, !dbg !3520
  %12 = load i64, ptr %arrayidx42, align 8, !dbg !3521
  %xor43 = xor i64 %12, %shl36, !dbg !3521
  store i64 %xor43, ptr %arrayidx42, align 8, !dbg !3521
  %inc45 = add i32 %i.1, 1, !dbg !3522
    #dbg_value(i32 %inc45, !3472, !DIExpression(), !3456)
  br label %for.cond25, !dbg !3523, !llvm.loop !3524

for.end46:                                        ; preds = %for.cond25
  %conv47 = zext i32 %mlen.addr.0.lcssa to i64, !dbg !3526
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !3527
  %13 = load i64, ptr %arrayidx48, align 8, !dbg !3528
  %add49 = add i64 %13, %conv47, !dbg !3528
  store i64 %add49, ptr %arrayidx48, align 8, !dbg !3528
  ret void, !dbg !3529
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3530 {
entry:
    #dbg_value(ptr %state, !3531, !DIExpression(), !3532)
  %0 = load i64, ptr %state, align 8, !dbg !3533
    #dbg_value(i64 %0, !3534, !DIExpression(), !3532)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3535
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3535
    #dbg_value(i64 %1, !3536, !DIExpression(), !3532)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3537
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3537
    #dbg_value(i64 %2, !3538, !DIExpression(), !3532)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3539
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3539
    #dbg_value(i64 %3, !3540, !DIExpression(), !3532)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3541
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3541
    #dbg_value(i64 %4, !3542, !DIExpression(), !3532)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3543
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3543
    #dbg_value(i64 %5, !3544, !DIExpression(), !3532)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3545
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3545
    #dbg_value(i64 %6, !3546, !DIExpression(), !3532)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3547
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3547
    #dbg_value(i64 %7, !3548, !DIExpression(), !3532)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3549
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3549
    #dbg_value(i64 %8, !3550, !DIExpression(), !3532)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3551
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3551
    #dbg_value(i64 %9, !3552, !DIExpression(), !3532)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3553
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3553
    #dbg_value(i64 %10, !3554, !DIExpression(), !3532)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3555
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3555
    #dbg_value(i64 %11, !3556, !DIExpression(), !3532)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3557
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3557
    #dbg_value(i64 %12, !3558, !DIExpression(), !3532)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3559
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3559
    #dbg_value(i64 %13, !3560, !DIExpression(), !3532)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3561
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3561
    #dbg_value(i64 %14, !3562, !DIExpression(), !3532)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3563
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3563
    #dbg_value(i64 %15, !3564, !DIExpression(), !3532)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3565
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3565
    #dbg_value(i64 %16, !3566, !DIExpression(), !3532)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3567
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3567
    #dbg_value(i64 %17, !3568, !DIExpression(), !3532)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3569
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3569
    #dbg_value(i64 %18, !3570, !DIExpression(), !3532)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3571
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3571
    #dbg_value(i64 %19, !3572, !DIExpression(), !3532)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3573
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3573
    #dbg_value(i64 %20, !3574, !DIExpression(), !3532)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3575
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3575
    #dbg_value(i64 %21, !3576, !DIExpression(), !3532)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3577
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3577
    #dbg_value(i64 %22, !3578, !DIExpression(), !3532)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3579
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3579
    #dbg_value(i64 %23, !3580, !DIExpression(), !3532)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3581
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3581
    #dbg_value(i64 %24, !3582, !DIExpression(), !3532)
    #dbg_value(i32 0, !3583, !DIExpression(), !3532)
  br label %for.cond, !dbg !3584

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3532
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3532
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3532
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3532
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3532
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3532
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3532
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3532
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3532
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3532
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3532
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3532
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3532
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3532
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3532
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3532
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3532
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3532
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3532
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3532
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3532
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3532
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3532
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3532
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3586
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3532
    #dbg_value(i64 %Asu.0, !3582, !DIExpression(), !3532)
    #dbg_value(i32 %round.0, !3583, !DIExpression(), !3532)
    #dbg_value(i64 %Aba.0, !3534, !DIExpression(), !3532)
    #dbg_value(i64 %Abe.0, !3536, !DIExpression(), !3532)
    #dbg_value(i64 %Abi.0, !3538, !DIExpression(), !3532)
    #dbg_value(i64 %Abo.0, !3540, !DIExpression(), !3532)
    #dbg_value(i64 %Abu.0, !3542, !DIExpression(), !3532)
    #dbg_value(i64 %Aga.0, !3544, !DIExpression(), !3532)
    #dbg_value(i64 %Age.0, !3546, !DIExpression(), !3532)
    #dbg_value(i64 %Agi.0, !3548, !DIExpression(), !3532)
    #dbg_value(i64 %Ago.0, !3550, !DIExpression(), !3532)
    #dbg_value(i64 %Agu.0, !3552, !DIExpression(), !3532)
    #dbg_value(i64 %Aka.0, !3554, !DIExpression(), !3532)
    #dbg_value(i64 %Ake.0, !3556, !DIExpression(), !3532)
    #dbg_value(i64 %Aki.0, !3558, !DIExpression(), !3532)
    #dbg_value(i64 %Ako.0, !3560, !DIExpression(), !3532)
    #dbg_value(i64 %Aku.0, !3562, !DIExpression(), !3532)
    #dbg_value(i64 %Ama.0, !3564, !DIExpression(), !3532)
    #dbg_value(i64 %Ame.0, !3566, !DIExpression(), !3532)
    #dbg_value(i64 %Ami.0, !3568, !DIExpression(), !3532)
    #dbg_value(i64 %Amo.0, !3570, !DIExpression(), !3532)
    #dbg_value(i64 %Amu.0, !3572, !DIExpression(), !3532)
    #dbg_value(i64 %Asa.0, !3574, !DIExpression(), !3532)
    #dbg_value(i64 %Ase.0, !3576, !DIExpression(), !3532)
    #dbg_value(i64 %Asi.0, !3578, !DIExpression(), !3532)
    #dbg_value(i64 %Aso.0, !3580, !DIExpression(), !3532)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3587
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3589

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 poison, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3625
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3627
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3628
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3629
    #dbg_value(i64 %xor35, !3592, !DIExpression(), !3532)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3630
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3631
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3632
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3633
    #dbg_value(i64 %xor43, !3594, !DIExpression(), !3532)
  %25 = shl i64 %xor43, 1, !dbg !3634
  %26 = lshr i64 %xor43, 63, !dbg !3634
  %27 = or i64 %25, %26, !dbg !3634
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor57 = xor i64 %xor35, %27, !dbg !3635
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 %xor57, !3598, !DIExpression(), !3532)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3636
    #dbg_value(i64 %xor203, !3550, !DIExpression(), !3532)
  %28 = shl i64 %xor203, 55, !dbg !3637
  %29 = lshr i64 %xor203, 9, !dbg !3637
  %30 = or i64 %28, %29, !dbg !3637
    #dbg_value(i64 %30, !3591, !DIExpression(), !3532)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3638
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3639
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3640
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3641
    #dbg_value(i64 %xor31, !3591, !DIExpression(), !3532)
  %31 = shl i64 %xor31, 1, !dbg !3642
  %32 = lshr i64 %xor31, 63, !dbg !3642
  %33 = or i64 %31, %32, !dbg !3642
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor45 = xor i64 %xor43, %33, !dbg !3643
    #dbg_value(i64 %xor45, !3595, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3644
    #dbg_value(i64 %xor211, !3564, !DIExpression(), !3532)
  %34 = shl i64 %xor211, 41, !dbg !3645
  %35 = lshr i64 %xor211, 23, !dbg !3645
  %36 = or i64 %34, %35, !dbg !3645
    #dbg_value(i64 %36, !3593, !DIExpression(), !3532)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3646
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3647
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3648
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3649
    #dbg_value(i64 %xor39, !3593, !DIExpression(), !3532)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3650
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3651
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3652
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3653
    #dbg_value(i64 %xor27, !3590, !DIExpression(), !3532)
  %37 = shl i64 %xor27, 1, !dbg !3654
  %38 = lshr i64 %xor27, 63, !dbg !3654
  %39 = or i64 %37, %38, !dbg !3654
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor61 = xor i64 %xor39, %39, !dbg !3655
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 %xor61, !3599, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3656
    #dbg_value(i64 %xor207, !3562, !DIExpression(), !3532)
  %40 = shl i64 %xor207, 39, !dbg !3657
  %41 = lshr i64 %xor207, 25, !dbg !3657
  %42 = or i64 %40, %41, !dbg !3657
    #dbg_value(i64 %42, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not222 = xor i64 %42, -1, !dbg !3658
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and223 = and i64 %36, %not222, !dbg !3659
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor224 = xor i64 %30, %and223, !dbg !3660
    #dbg_value(i64 %xor224, !3621, !DIExpression(), !3532)
  %43 = shl i64 %xor39, 1, !dbg !3661
  %44 = lshr i64 %xor39, 63, !dbg !3661
  %45 = or i64 %43, %44, !dbg !3661
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor53 = xor i64 %xor31, %45, !dbg !3662
    #dbg_value(i64 %xor53, !3597, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3663
    #dbg_value(i64 %xor67, !3558, !DIExpression(), !3532)
  %46 = shl i64 %xor67, 43, !dbg !3664
  %47 = lshr i64 %xor67, 21, !dbg !3664
  %48 = or i64 %46, %47, !dbg !3664
    #dbg_value(i64 %48, !3592, !DIExpression(), !3532)
  %49 = shl i64 %xor35, 1, !dbg !3665
  %50 = lshr i64 %xor35, 63, !dbg !3665
  %51 = or i64 %49, %50, !dbg !3665
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor49 = xor i64 %xor27, %51, !dbg !3666
    #dbg_value(i64 %xor49, !3596, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3667
    #dbg_value(i64 %xor63, !3546, !DIExpression(), !3532)
  %52 = shl i64 %xor63, 44, !dbg !3668
  %53 = lshr i64 %xor63, 20, !dbg !3668
  %54 = or i64 %52, %53, !dbg !3668
    #dbg_value(i64 %54, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not = xor i64 %54, -1, !dbg !3669
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and = and i64 %48, %not, !dbg !3670
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3671
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !3671
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %56 = xor i64 %and, %55, !dbg !3672
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3673
    #dbg_value(i64 %xor62, !3534, !DIExpression(), !3532)
    #dbg_value(i64 %xor62, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor81 = xor i64 %56, %xor62, !dbg !3672
    #dbg_value(i64 %xor81, !3600, !DIExpression(), !3532)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3674
    #dbg_value(i64 %xor94, !3540, !DIExpression(), !3532)
  %57 = shl i64 %xor94, 28, !dbg !3675
  %58 = lshr i64 %xor94, 36, !dbg !3675
  %59 = or i64 %57, %58, !dbg !3675
    #dbg_value(i64 %59, !3590, !DIExpression(), !3532)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3676
    #dbg_value(i64 %xor102, !3554, !DIExpression(), !3532)
  %60 = shl i64 %xor102, 3, !dbg !3677
  %61 = lshr i64 %xor102, 61, !dbg !3677
  %62 = or i64 %60, %61, !dbg !3677
    #dbg_value(i64 %62, !3592, !DIExpression(), !3532)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3678
    #dbg_value(i64 %xor98, !3552, !DIExpression(), !3532)
  %63 = shl i64 %xor98, 20, !dbg !3679
  %64 = lshr i64 %xor98, 44, !dbg !3679
  %65 = or i64 %63, %64, !dbg !3679
    #dbg_value(i64 %65, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not114 = xor i64 %65, -1, !dbg !3680
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and115 = and i64 %62, %not114, !dbg !3681
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor116 = xor i64 %59, %and115, !dbg !3682
    #dbg_value(i64 %xor116, !3605, !DIExpression(), !3532)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3683
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3684
    #dbg_value(i64 %xor129, !3536, !DIExpression(), !3532)
  %66 = shl i64 %xor129, 1, !dbg !3685
  %67 = lshr i64 %xor129, 63, !dbg !3685
  %68 = or i64 %66, %67, !dbg !3685
    #dbg_value(i64 %68, !3590, !DIExpression(), !3532)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3686
    #dbg_value(i64 %xor137, !3560, !DIExpression(), !3532)
  %69 = shl i64 %xor137, 25, !dbg !3687
  %70 = lshr i64 %xor137, 39, !dbg !3687
  %71 = or i64 %69, %70, !dbg !3687
    #dbg_value(i64 %71, !3592, !DIExpression(), !3532)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3688
    #dbg_value(i64 %xor133, !3548, !DIExpression(), !3532)
  %72 = shl i64 %xor133, 6, !dbg !3689
  %73 = lshr i64 %xor133, 58, !dbg !3689
  %74 = or i64 %72, %73, !dbg !3689
    #dbg_value(i64 %74, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not149 = xor i64 %74, -1, !dbg !3690
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and150 = and i64 %71, %not149, !dbg !3691
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor151 = xor i64 %68, %and150, !dbg !3692
    #dbg_value(i64 %xor151, !3610, !DIExpression(), !3532)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3693
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3694
    #dbg_value(i64 %xor164, !3542, !DIExpression(), !3532)
  %75 = shl i64 %xor164, 27, !dbg !3695
  %76 = lshr i64 %xor164, 37, !dbg !3695
  %77 = or i64 %75, %76, !dbg !3695
    #dbg_value(i64 %77, !3590, !DIExpression(), !3532)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3696
    #dbg_value(i64 %xor172, !3556, !DIExpression(), !3532)
  %78 = shl i64 %xor172, 10, !dbg !3697
  %79 = lshr i64 %xor172, 54, !dbg !3697
  %80 = or i64 %78, %79, !dbg !3697
    #dbg_value(i64 %80, !3592, !DIExpression(), !3532)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3698
    #dbg_value(i64 %xor168, !3544, !DIExpression(), !3532)
  %81 = shl i64 %xor168, 36, !dbg !3699
  %82 = lshr i64 %xor168, 28, !dbg !3699
  %83 = or i64 %81, %82, !dbg !3699
    #dbg_value(i64 %83, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not184 = xor i64 %83, -1, !dbg !3700
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and185 = and i64 %80, %not184, !dbg !3701
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor186 = xor i64 %77, %and185, !dbg !3702
    #dbg_value(i64 %xor186, !3615, !DIExpression(), !3532)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3703
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3704
    #dbg_value(i64 %xor199, !3538, !DIExpression(), !3532)
  %84 = shl i64 %xor199, 62, !dbg !3705
  %85 = lshr i64 %xor199, 2, !dbg !3705
  %86 = or i64 %84, %85, !dbg !3705
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not219 = xor i64 %30, -1, !dbg !3706
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and220 = and i64 %42, %not219, !dbg !3707
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor221 = xor i64 %86, %and220, !dbg !3708
    #dbg_value(i64 %xor221, !3620, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3709
    #dbg_value(i64 %xor237, !3590, !DIExpression(), !3532)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3710
    #dbg_value(i64 %xor75, !3582, !DIExpression(), !3532)
  %87 = shl i64 %xor75, 14, !dbg !3711
  %88 = lshr i64 %xor75, 50, !dbg !3711
  %89 = or i64 %87, %88, !dbg !3711
    #dbg_value(i64 %89, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3712
    #dbg_value(i64 %xor71, !3570, !DIExpression(), !3532)
  %90 = shl i64 %xor71, 21, !dbg !3713
  %91 = lshr i64 %xor71, 43, !dbg !3713
  %92 = or i64 %90, %91, !dbg !3713
    #dbg_value(i64 %92, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not85 = xor i64 %92, -1, !dbg !3714
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and86 = and i64 %89, %not85, !dbg !3715
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor87 = xor i64 %48, %and86, !dbg !3716
    #dbg_value(i64 %xor87, !3602, !DIExpression(), !3532)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3717
    #dbg_value(i64 %xor110, !3578, !DIExpression(), !3532)
  %93 = shl i64 %xor110, 61, !dbg !3718
  %94 = lshr i64 %xor110, 3, !dbg !3718
  %95 = or i64 %93, %94, !dbg !3718
    #dbg_value(i64 %95, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3719
    #dbg_value(i64 %xor106, !3566, !DIExpression(), !3532)
  %96 = shl i64 %xor106, 45, !dbg !3720
  %97 = lshr i64 %xor106, 19, !dbg !3720
  %98 = or i64 %96, %97, !dbg !3720
    #dbg_value(i64 %98, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not120 = xor i64 %98, -1, !dbg !3721
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and121 = and i64 %95, %not120, !dbg !3722
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor122 = xor i64 %62, %and121, !dbg !3723
    #dbg_value(i64 %xor122, !3607, !DIExpression(), !3532)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3724
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3725
    #dbg_value(i64 %xor145, !3574, !DIExpression(), !3532)
  %99 = shl i64 %xor145, 18, !dbg !3726
  %100 = lshr i64 %xor145, 46, !dbg !3726
  %101 = or i64 %99, %100, !dbg !3726
    #dbg_value(i64 %101, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3727
    #dbg_value(i64 %xor141, !3572, !DIExpression(), !3532)
  %102 = shl i64 %xor141, 8, !dbg !3728
  %103 = lshr i64 %xor141, 56, !dbg !3728
  %104 = or i64 %102, %103, !dbg !3728
    #dbg_value(i64 %104, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not155 = xor i64 %104, -1, !dbg !3729
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and156 = and i64 %101, %not155, !dbg !3730
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor157 = xor i64 %71, %and156, !dbg !3731
    #dbg_value(i64 %xor157, !3612, !DIExpression(), !3532)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3732
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3733
    #dbg_value(i64 %xor180, !3580, !DIExpression(), !3532)
  %105 = shl i64 %xor180, 56, !dbg !3734
  %106 = lshr i64 %xor180, 8, !dbg !3734
  %107 = or i64 %105, %106, !dbg !3734
    #dbg_value(i64 %107, !3594, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3735
    #dbg_value(i64 %xor176, !3568, !DIExpression(), !3532)
  %108 = shl i64 %xor176, 15, !dbg !3736
  %109 = lshr i64 %xor176, 49, !dbg !3736
  %110 = or i64 %108, %109, !dbg !3736
    #dbg_value(i64 %110, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %not190 = xor i64 %110, -1, !dbg !3737
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and191 = and i64 %107, %not190, !dbg !3738
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor192 = xor i64 %80, %and191, !dbg !3739
    #dbg_value(i64 %xor192, !3617, !DIExpression(), !3532)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3740
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3741
    #dbg_value(i64 %xor215, !3576, !DIExpression(), !3532)
  %111 = shl i64 %xor215, 2, !dbg !3742
  %112 = lshr i64 %xor215, 62, !dbg !3742
  %113 = or i64 %111, %112, !dbg !3742
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not225 = xor i64 %36, -1, !dbg !3743
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and226 = and i64 %113, %not225, !dbg !3744
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor227 = xor i64 %42, %and226, !dbg !3745
    #dbg_value(i64 %xor227, !3622, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3746
    #dbg_value(i64 %xor245, !3592, !DIExpression(), !3532)
  %114 = shl i64 %xor245, 1, !dbg !3747
  %115 = lshr i64 %xor245, 63, !dbg !3747
  %116 = or i64 %114, %115, !dbg !3747
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor261 = xor i64 %xor237, %116, !dbg !3748
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 %xor261, !3596, !DIExpression(), !3532)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3749
    #dbg_value(i64 %xor429, !3621, !DIExpression(), !3532)
  %117 = shl i64 %xor429, 2, !dbg !3750
  %118 = lshr i64 %xor429, 62, !dbg !3750
  %119 = or i64 %117, %118, !dbg !3750
    #dbg_value(i64 %119, !3594, !DIExpression(), !3532)
  %not123 = xor i64 %95, -1, !dbg !3751
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and124 = and i64 %59, %not123, !dbg !3752
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor125 = xor i64 %98, %and124, !dbg !3753
    #dbg_value(i64 %xor125, !3608, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not91 = xor i64 %xor62, -1, !dbg !3754
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and92 = and i64 %54, %not91, !dbg !3755
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor93 = xor i64 %89, %and92, !dbg !3756
    #dbg_value(i64 %xor93, !3604, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not126 = xor i64 %59, -1, !dbg !3757
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and127 = and i64 %65, %not126, !dbg !3758
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor128 = xor i64 %95, %and127, !dbg !3759
    #dbg_value(i64 %xor128, !3609, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3760
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not161 = xor i64 %68, -1, !dbg !3761
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and162 = and i64 %74, %not161, !dbg !3762
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor163 = xor i64 %101, %and162, !dbg !3763
    #dbg_value(i64 %xor163, !3614, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3764
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not196 = xor i64 %77, -1, !dbg !3765
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and197 = and i64 %83, %not196, !dbg !3766
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor198 = xor i64 %107, %and197, !dbg !3767
    #dbg_value(i64 %xor198, !3619, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3768
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not231 = xor i64 %86, -1, !dbg !3769
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %and232 = and i64 %30, %not231, !dbg !3770
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor233 = xor i64 %113, %and232, !dbg !3771
    #dbg_value(i64 %xor233, !3624, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3772
    #dbg_value(i64 %xor253, !3594, !DIExpression(), !3532)
  %120 = shl i64 %xor253, 1, !dbg !3773
  %121 = lshr i64 %xor253, 63, !dbg !3773
  %122 = or i64 %120, %121, !dbg !3773
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor269 = xor i64 %xor245, %122, !dbg !3774
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 %xor269, !3598, !DIExpression(), !3532)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3775
    #dbg_value(i64 %xor417, !3608, !DIExpression(), !3532)
  %123 = shl i64 %xor417, 55, !dbg !3776
  %124 = lshr i64 %xor417, 9, !dbg !3776
  %125 = or i64 %123, %124, !dbg !3776
    #dbg_value(i64 %125, !3591, !DIExpression(), !3532)
  %not82 = xor i64 %48, -1, !dbg !3777
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and83 = and i64 %92, %not82, !dbg !3778
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor84 = xor i64 %54, %and83, !dbg !3779
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %not117 = xor i64 %62, -1, !dbg !3780
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and118 = and i64 %98, %not117, !dbg !3781
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor119 = xor i64 %65, %and118, !dbg !3782
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3783
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %not152 = xor i64 %71, -1, !dbg !3784
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and153 = and i64 %104, %not152, !dbg !3785
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor154 = xor i64 %74, %and153, !dbg !3786
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3787
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %not187 = xor i64 %80, -1, !dbg !3788
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and188 = and i64 %110, %not187, !dbg !3789
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor189 = xor i64 %83, %and188, !dbg !3790
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3791
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3792
    #dbg_value(i64 %xor241, !3591, !DIExpression(), !3532)
  %not88 = xor i64 %89, -1, !dbg !3793
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and89 = and i64 %xor62, %not88, !dbg !3794
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor90 = xor i64 %92, %and89, !dbg !3795
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3796
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not158 = xor i64 %101, -1, !dbg !3797
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and159 = and i64 %68, %not158, !dbg !3798
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor160 = xor i64 %104, %and159, !dbg !3799
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3800
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not193 = xor i64 %107, -1, !dbg !3801
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and194 = and i64 %77, %not193, !dbg !3802
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor195 = xor i64 %110, %and194, !dbg !3803
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3804
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %not228 = xor i64 %113, -1, !dbg !3805
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and229 = and i64 %86, %not228, !dbg !3806
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor230 = xor i64 %36, %and229, !dbg !3807
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3623, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3808
    #dbg_value(i64 %xor249, !3593, !DIExpression(), !3532)
  %126 = shl i64 %xor249, 1, !dbg !3809
  %127 = lshr i64 %xor249, 63, !dbg !3809
  %128 = or i64 %126, %127, !dbg !3809
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor265 = xor i64 %xor241, %128, !dbg !3810
    #dbg_value(i64 %xor265, !3597, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3622, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3811
    #dbg_value(i64 %xor413, !3602, !DIExpression(), !3532)
  %129 = shl i64 %xor413, 62, !dbg !3812
  %130 = lshr i64 %xor413, 2, !dbg !3812
  %131 = or i64 %129, %130, !dbg !3812
    #dbg_value(i64 %131, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not445 = xor i64 %131, -1, !dbg !3813
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and446 = and i64 %125, %not445, !dbg !3814
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !3582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor447 = xor i64 %119, %and446, !dbg !3815
    #dbg_value(i64 %xor447, !3582, !DIExpression(), !3532)
  %132 = shl i64 %xor241, 1, !dbg !3816
  %133 = lshr i64 %xor241, 63, !dbg !3816
  %134 = or i64 %132, %133, !dbg !3816
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor257 = xor i64 %xor253, %134, !dbg !3817
    #dbg_value(i64 %xor257, !3595, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3818
    #dbg_value(i64 %xor425, !3615, !DIExpression(), !3532)
  %135 = shl i64 %xor425, 41, !dbg !3819
  %136 = lshr i64 %xor425, 23, !dbg !3819
  %137 = or i64 %135, %136, !dbg !3819
    #dbg_value(i64 %137, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not442 = xor i64 %119, -1, !dbg !3820
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and443 = and i64 %131, %not442, !dbg !3821
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !3580, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor444 = xor i64 %137, %and443, !dbg !3822
    #dbg_value(i64 %xor444, !3580, !DIExpression(), !3532)
  %138 = shl i64 %xor237, 1, !dbg !3823
  %139 = lshr i64 %xor237, 63, !dbg !3823
  %140 = or i64 %138, %139, !dbg !3823
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor273 = xor i64 %xor249, %140, !dbg !3824
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3624, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(i64 %xor273, !3599, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3825
    #dbg_value(i64 %xor421, !3614, !DIExpression(), !3532)
  %141 = shl i64 %xor421, 39, !dbg !3826
  %142 = lshr i64 %xor421, 25, !dbg !3826
  %143 = or i64 %141, %142, !dbg !3826
    #dbg_value(i64 %143, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not439 = xor i64 %137, -1, !dbg !3827
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and440 = and i64 %119, %not439, !dbg !3828
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !3578, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor441 = xor i64 %143, %and440, !dbg !3829
    #dbg_value(i64 %xor441, !3578, !DIExpression(), !3532)
  %not436 = xor i64 %143, -1, !dbg !3830
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and437 = and i64 %137, %not436, !dbg !3831
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !3576, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor438 = xor i64 %125, %and437, !dbg !3832
    #dbg_value(i64 %xor438, !3576, !DIExpression(), !3532)
  %not433 = xor i64 %125, -1, !dbg !3833
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and434 = and i64 %143, %not433, !dbg !3834
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !3574, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor435 = xor i64 %131, %and434, !dbg !3835
    #dbg_value(i64 %xor435, !3574, !DIExpression(), !3532)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3836
    #dbg_value(i64 %xor394, !3623, !DIExpression(), !3532)
  %144 = shl i64 %xor394, 56, !dbg !3837
  %145 = lshr i64 %xor394, 8, !dbg !3837
  %146 = or i64 %144, %145, !dbg !3837
    #dbg_value(i64 %146, !3594, !DIExpression(), !3532)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3838
    #dbg_value(i64 %xor382, !3605, !DIExpression(), !3532)
  %147 = shl i64 %xor382, 36, !dbg !3839
  %148 = lshr i64 %xor382, 28, !dbg !3839
  %149 = or i64 %147, %148, !dbg !3839
    #dbg_value(i64 %149, !3591, !DIExpression(), !3532)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3840
    #dbg_value(i64 %xor378, !3604, !DIExpression(), !3532)
  %150 = shl i64 %xor378, 27, !dbg !3841
  %151 = lshr i64 %xor378, 37, !dbg !3841
  %152 = or i64 %150, %151, !dbg !3841
    #dbg_value(i64 %152, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not410 = xor i64 %152, -1, !dbg !3842
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and411 = and i64 %149, %not410, !dbg !3843
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !3572, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor412 = xor i64 %146, %and411, !dbg !3844
    #dbg_value(i64 %xor412, !3572, !DIExpression(), !3532)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3845
    #dbg_value(i64 %xor390, !3617, !DIExpression(), !3532)
  %153 = shl i64 %xor390, 15, !dbg !3846
  %154 = lshr i64 %xor390, 49, !dbg !3846
  %155 = or i64 %153, %154, !dbg !3846
    #dbg_value(i64 %155, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not407 = xor i64 %146, -1, !dbg !3847
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and408 = and i64 %152, %not407, !dbg !3848
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !3570, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor409 = xor i64 %155, %and408, !dbg !3849
    #dbg_value(i64 %xor409, !3570, !DIExpression(), !3532)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3850
    #dbg_value(i64 %xor386, !3611, !DIExpression(), !3532)
  %156 = shl i64 %xor386, 10, !dbg !3851
  %157 = lshr i64 %xor386, 54, !dbg !3851
  %158 = or i64 %156, %157, !dbg !3851
    #dbg_value(i64 %158, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not404 = xor i64 %155, -1, !dbg !3852
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and405 = and i64 %146, %not404, !dbg !3853
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !3568, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor406 = xor i64 %158, %and405, !dbg !3854
    #dbg_value(i64 %xor406, !3568, !DIExpression(), !3532)
  %not401 = xor i64 %158, -1, !dbg !3855
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and402 = and i64 %155, %not401, !dbg !3856
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !3566, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor403 = xor i64 %149, %and402, !dbg !3857
    #dbg_value(i64 %xor403, !3566, !DIExpression(), !3532)
  %not398 = xor i64 %149, -1, !dbg !3858
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and399 = and i64 %158, %not398, !dbg !3859
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !3564, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor400 = xor i64 %152, %and399, !dbg !3860
    #dbg_value(i64 %xor400, !3564, !DIExpression(), !3532)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3861
    #dbg_value(i64 %xor359, !3620, !DIExpression(), !3532)
  %159 = shl i64 %xor359, 18, !dbg !3862
  %160 = lshr i64 %xor359, 46, !dbg !3862
  %161 = or i64 %159, %160, !dbg !3862
    #dbg_value(i64 %161, !3594, !DIExpression(), !3532)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3863
    #dbg_value(i64 %xor347, !3607, !DIExpression(), !3532)
  %162 = shl i64 %xor347, 6, !dbg !3864
  %163 = lshr i64 %xor347, 58, !dbg !3864
  %164 = or i64 %162, %163, !dbg !3864
    #dbg_value(i64 %164, !3591, !DIExpression(), !3532)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3865
    #dbg_value(i64 %xor343, !3601, !DIExpression(), !3532)
  %165 = shl i64 %xor343, 1, !dbg !3866
  %166 = lshr i64 %xor343, 63, !dbg !3866
  %167 = or i64 %165, %166, !dbg !3866
    #dbg_value(i64 %167, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not375 = xor i64 %167, -1, !dbg !3867
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and376 = and i64 %164, %not375, !dbg !3868
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !3562, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor377 = xor i64 %161, %and376, !dbg !3869
    #dbg_value(i64 %xor377, !3562, !DIExpression(), !3532)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3870
    #dbg_value(i64 %xor355, !3619, !DIExpression(), !3532)
  %168 = shl i64 %xor355, 8, !dbg !3871
  %169 = lshr i64 %xor355, 56, !dbg !3871
  %170 = or i64 %168, %169, !dbg !3871
    #dbg_value(i64 %170, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not372 = xor i64 %161, -1, !dbg !3872
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and373 = and i64 %167, %not372, !dbg !3873
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !3560, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor374 = xor i64 %170, %and373, !dbg !3874
    #dbg_value(i64 %xor374, !3560, !DIExpression(), !3532)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3875
    #dbg_value(i64 %xor351, !3613, !DIExpression(), !3532)
  %171 = shl i64 %xor351, 25, !dbg !3876
  %172 = lshr i64 %xor351, 39, !dbg !3876
  %173 = or i64 %171, %172, !dbg !3876
    #dbg_value(i64 %173, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not369 = xor i64 %170, -1, !dbg !3877
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and370 = and i64 %161, %not369, !dbg !3878
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !3558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor371 = xor i64 %173, %and370, !dbg !3879
    #dbg_value(i64 %xor371, !3558, !DIExpression(), !3532)
  %not366 = xor i64 %173, -1, !dbg !3880
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and367 = and i64 %170, %not366, !dbg !3881
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !3556, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor368 = xor i64 %164, %and367, !dbg !3882
    #dbg_value(i64 %xor368, !3556, !DIExpression(), !3532)
  %not363 = xor i64 %164, -1, !dbg !3883
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and364 = and i64 %173, %not363, !dbg !3884
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !3554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor365 = xor i64 %167, %and364, !dbg !3885
    #dbg_value(i64 %xor365, !3554, !DIExpression(), !3532)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3886
    #dbg_value(i64 %xor324, !3622, !DIExpression(), !3532)
  %174 = shl i64 %xor324, 61, !dbg !3887
  %175 = lshr i64 %xor324, 3, !dbg !3887
  %176 = or i64 %174, %175, !dbg !3887
    #dbg_value(i64 %176, !3594, !DIExpression(), !3532)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3888
    #dbg_value(i64 %xor312, !3609, !DIExpression(), !3532)
  %177 = shl i64 %xor312, 20, !dbg !3889
  %178 = lshr i64 %xor312, 44, !dbg !3889
  %179 = or i64 %177, %178, !dbg !3889
    #dbg_value(i64 %179, !3591, !DIExpression(), !3532)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3890
    #dbg_value(i64 %xor308, !3603, !DIExpression(), !3532)
  %180 = shl i64 %xor308, 28, !dbg !3891
  %181 = lshr i64 %xor308, 36, !dbg !3891
  %182 = or i64 %180, %181, !dbg !3891
    #dbg_value(i64 %182, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not340 = xor i64 %182, -1, !dbg !3892
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and341 = and i64 %179, %not340, !dbg !3893
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !3552, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor342 = xor i64 %176, %and341, !dbg !3894
    #dbg_value(i64 %xor342, !3552, !DIExpression(), !3532)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3895
    #dbg_value(i64 %xor320, !3616, !DIExpression(), !3532)
  %183 = shl i64 %xor320, 45, !dbg !3896
  %184 = lshr i64 %xor320, 19, !dbg !3896
  %185 = or i64 %183, %184, !dbg !3896
    #dbg_value(i64 %185, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not337 = xor i64 %176, -1, !dbg !3897
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and338 = and i64 %182, %not337, !dbg !3898
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !3550, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor339 = xor i64 %185, %and338, !dbg !3899
    #dbg_value(i64 %xor339, !3550, !DIExpression(), !3532)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3900
    #dbg_value(i64 %xor316, !3610, !DIExpression(), !3532)
  %186 = shl i64 %xor316, 3, !dbg !3901
  %187 = lshr i64 %xor316, 61, !dbg !3901
  %188 = or i64 %186, %187, !dbg !3901
    #dbg_value(i64 %188, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not334 = xor i64 %185, -1, !dbg !3902
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and335 = and i64 %176, %not334, !dbg !3903
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !3548, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor336 = xor i64 %188, %and335, !dbg !3904
    #dbg_value(i64 %xor336, !3548, !DIExpression(), !3532)
  %not331 = xor i64 %188, -1, !dbg !3905
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and332 = and i64 %185, %not331, !dbg !3906
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !3546, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor333 = xor i64 %179, %and332, !dbg !3907
    #dbg_value(i64 %xor333, !3546, !DIExpression(), !3532)
  %not328 = xor i64 %179, -1, !dbg !3908
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and329 = and i64 %188, %not328, !dbg !3909
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !3544, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor330 = xor i64 %182, %and329, !dbg !3910
    #dbg_value(i64 %xor330, !3544, !DIExpression(), !3532)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3911
    #dbg_value(i64 %xor287, !3624, !DIExpression(), !3532)
  %189 = shl i64 %xor287, 14, !dbg !3912
  %190 = lshr i64 %xor287, 50, !dbg !3912
  %191 = or i64 %189, %190, !dbg !3912
    #dbg_value(i64 %191, !3594, !DIExpression(), !3532)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3913
    #dbg_value(i64 %xor275, !3606, !DIExpression(), !3532)
  %192 = shl i64 %xor275, 44, !dbg !3914
  %193 = lshr i64 %xor275, 20, !dbg !3914
  %194 = or i64 %192, %193, !dbg !3914
    #dbg_value(i64 %194, !3591, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3915
    #dbg_value(i64 %xor274, !3600, !DIExpression(), !3532)
    #dbg_value(i64 %xor274, !3590, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not305 = xor i64 %xor274, -1, !dbg !3916
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and306 = and i64 %194, %not305, !dbg !3917
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !3542, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor307 = xor i64 %191, %and306, !dbg !3918
    #dbg_value(i64 %xor307, !3542, !DIExpression(), !3532)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3919
    #dbg_value(i64 %xor283, !3618, !DIExpression(), !3532)
  %195 = shl i64 %xor283, 21, !dbg !3920
  %196 = lshr i64 %xor283, 43, !dbg !3920
  %197 = or i64 %195, %196, !dbg !3920
    #dbg_value(i64 %197, !3593, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not302 = xor i64 %191, -1, !dbg !3921
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and303 = and i64 %xor274, %not302, !dbg !3922
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !3540, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor304 = xor i64 %197, %and303, !dbg !3923
    #dbg_value(i64 %xor304, !3540, !DIExpression(), !3532)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3924
    #dbg_value(i64 %xor279, !3612, !DIExpression(), !3532)
  %198 = shl i64 %xor279, 43, !dbg !3925
  %199 = lshr i64 %xor279, 21, !dbg !3925
  %200 = or i64 %198, %199, !dbg !3925
    #dbg_value(i64 %200, !3592, !DIExpression(), !3532)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %not299 = xor i64 %197, -1, !dbg !3926
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and300 = and i64 %191, %not299, !dbg !3927
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !3538, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor301 = xor i64 %200, %and300, !dbg !3928
    #dbg_value(i64 %xor301, !3538, !DIExpression(), !3532)
  %not296 = xor i64 %200, -1, !dbg !3929
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3532)
  %and297 = and i64 %197, %not296, !dbg !3930
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %xor298 = xor i64 %194, %and297, !dbg !3931
    #dbg_value(i64 %xor298, !3536, !DIExpression(), !3532)
  %add = or disjoint i32 %round.0, 1, !dbg !3932
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3933
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !3933
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %not291 = xor i64 %194, -1, !dbg !3934
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %and292 = and i64 %200, %not291, !dbg !3935
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !3534, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3532)
  %202 = xor i64 %and292, %201, !dbg !3936
  %xor295 = xor i64 %202, %xor274, !dbg !3936
    #dbg_value(i64 %xor295, !3534, !DIExpression(), !3532)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3937
    #dbg_value(i32 %add448, !3583, !DIExpression(), !3532)
  br label %for.cond, !dbg !3938, !llvm.loop !3939

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3532
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3532
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3532
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3532
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3532
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3532
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3532
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3532
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3532
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3532
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3532
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3532
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3532
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3532
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3532
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3532
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3532
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3532
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3532
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3532
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3532
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3532
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3532
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3532
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3532
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3941
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3942
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3943
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3944
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3945
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3946
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3947
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3948
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3949
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3950
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3951
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3952
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3953
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3954
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3955
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3956
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3957
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3958
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3959
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3960
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3961
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3962
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3963
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3964
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3965
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3966
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3967
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3968
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3969
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3970
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3971
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3972
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3973
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3974
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3975
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3976
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3977
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3978
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3979
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3980
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3981
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3982
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3983
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3984
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3985
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3986
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3987
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3988
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3989
  ret void, !dbg !3990
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3991 {
entry:
    #dbg_value(ptr %state, !3992, !DIExpression(), !3993)
  %0 = load ptr, ptr %state, align 4, !dbg !3994
  call fastcc void @keccak_inc_finalize(ptr noundef %0, i32 noundef 168, i8 noundef zeroext 31) #4, !dbg !3995
  ret void, !dbg !3996
}

; Function Attrs: nounwind
define internal fastcc void @keccak_inc_finalize(ptr noundef %s_inc, i32 noundef range(i32 72, 169) %r, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !3997 {
entry:
    #dbg_value(ptr %s_inc, !4000, !DIExpression(), !4001)
    #dbg_value(i32 %r, !4002, !DIExpression(), !4001)
    #dbg_value(i8 %p, !4003, !DIExpression(), !4001)
  %conv = zext nneg i8 %p to i64, !dbg !4004
  %arrayidx = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4005
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4005
  %and = shl i64 %0, 3, !dbg !4006
  %mul = and i64 %and, 56, !dbg !4006
  %shl = shl nuw nsw i64 %conv, %mul, !dbg !4007
  %shr = lshr i64 %0, 3, !dbg !4008
  %idxprom = trunc i64 %shr to i32, !dbg !4009
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %idxprom, !dbg !4009
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !4010
  %xor = xor i64 %1, %shl, !dbg !4010
  store i64 %xor, ptr %arrayidx2, align 8, !dbg !4010
  %sub = shl nuw nsw i32 %r, 3, !dbg !4011
  %and3 = add nuw nsw i32 %sub, 56, !dbg !4011
  %mul4 = and i32 %and3, 56, !dbg !4011
  %sh_prom = zext nneg i32 %mul4 to i64, !dbg !4012
  %shl5 = shl nuw i64 128, %sh_prom, !dbg !4012
  %sub6 = add nsw i32 %r, -1, !dbg !4013
  %shr7 = lshr i32 %sub6, 3, !dbg !4014
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %shr7, !dbg !4015
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !4016
  %xor9 = xor i64 %2, %shl5, !dbg !4016
  store i64 %xor9, ptr %arrayidx8, align 8, !dbg !4016
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4017
  store i64 0, ptr %arrayidx10, align 8, !dbg !4018
  ret void, !dbg !4019
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_squeeze(ptr noundef %output, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !4020 {
entry:
    #dbg_value(ptr %output, !4023, !DIExpression(), !4024)
    #dbg_value(i32 %outlen, !4025, !DIExpression(), !4024)
    #dbg_value(ptr %state, !4026, !DIExpression(), !4024)
  %0 = load ptr, ptr %state, align 4, !dbg !4027
  call fastcc void @keccak_inc_squeeze(ptr noundef %output, i32 noundef %outlen, ptr noundef %0, i32 noundef 168) #4, !dbg !4028
  ret void, !dbg !4029
}

; Function Attrs: nounwind
define internal fastcc void @keccak_inc_squeeze(ptr noundef %h, i32 noundef %outlen, ptr noundef %s_inc, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !4030 {
entry:
    #dbg_value(ptr %h, !4033, !DIExpression(), !4034)
    #dbg_value(i32 %outlen, !4035, !DIExpression(), !4034)
    #dbg_value(ptr %s_inc, !4036, !DIExpression(), !4034)
    #dbg_value(i32 %r, !4037, !DIExpression(), !4034)
    #dbg_value(i32 0, !4038, !DIExpression(), !4034)
  br label %for.cond, !dbg !4039

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4041
    #dbg_value(i32 %i.0, !4038, !DIExpression(), !4034)
  %exitcond = icmp ne i32 %i.0, %outlen, !dbg !4042
  br i1 %exitcond, label %land.rhs, label %for.end, !dbg !4044

land.rhs:                                         ; preds = %for.cond
  %conv = zext i32 %i.0 to i64, !dbg !4045
  %arrayidx = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4046
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4046
  %cmp1 = icmp ugt i64 %0, %conv, !dbg !4047
  br i1 %cmp1, label %for.body, label %for.end, !dbg !4048

for.body:                                         ; preds = %land.rhs
  %conv3 = zext nneg i32 %r to i64, !dbg !4049
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4051
  %1 = load i64, ptr %arrayidx4, align 8, !dbg !4051
  %sub = sub i64 %conv3, %1, !dbg !4052
  %conv5 = zext i32 %i.0 to i64, !dbg !4053
  %add = add i64 %sub, %conv5, !dbg !4054
  %shr = lshr i64 %add, 3, !dbg !4055
  %idxprom = trunc i64 %shr to i32, !dbg !4056
  %arrayidx6 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %idxprom, !dbg !4056
  %2 = load i64, ptr %arrayidx6, align 8, !dbg !4056
  %conv7 = zext nneg i32 %r to i64, !dbg !4057
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4058
  %3 = load i64, ptr %arrayidx8, align 8, !dbg !4058
  %sub9 = sub i64 %conv7, %3, !dbg !4059
  %conv10 = zext i32 %i.0 to i64, !dbg !4060
  %add11 = add i64 %sub9, %conv10, !dbg !4061
  %and = shl i64 %add11, 3, !dbg !4062
  %mul = and i64 %and, 56, !dbg !4062
  %shr12 = lshr i64 %2, %mul, !dbg !4063
  %conv13 = trunc i64 %shr12 to i8, !dbg !4064
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %h, i32 %i.0, !dbg !4065
  store i8 %conv13, ptr %arrayidx14, align 1, !dbg !4066
  %inc = add i32 %i.0, 1, !dbg !4067
    #dbg_value(i32 %inc, !4038, !DIExpression(), !4034)
  br label %for.cond, !dbg !4068, !llvm.loop !4069

for.end:                                          ; preds = %for.cond, %land.rhs
  %i.0.lcssa = phi i32 [ %outlen, %for.cond ], [ %i.0, %land.rhs ], !dbg !4041
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %i.0.lcssa, !dbg !4071
    #dbg_value(ptr %add.ptr, !4033, !DIExpression(), !4034)
  %sub15 = sub i32 %outlen, %i.0.lcssa, !dbg !4072
    #dbg_value(i32 %sub15, !4035, !DIExpression(), !4034)
  %conv16 = zext i32 %i.0.lcssa to i64, !dbg !4073
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4074
  %4 = load i64, ptr %arrayidx17, align 8, !dbg !4075
  %sub18 = sub i64 %4, %conv16, !dbg !4075
  store i64 %sub18, ptr %arrayidx17, align 8, !dbg !4075
  br label %while.cond, !dbg !4076

while.cond:                                       ; preds = %for.end38, %for.end
  %outlen.addr.0 = phi i32 [ %sub15, %for.end ], [ %sub40, %for.end38 ], !dbg !4034
  %h.addr.0 = phi ptr [ %add.ptr, %for.end ], [ %add.ptr39, %for.end38 ], !dbg !4034
    #dbg_value(ptr %h.addr.0, !4033, !DIExpression(), !4034)
    #dbg_value(i32 %outlen.addr.0, !4035, !DIExpression(), !4034)
  %cmp19.not = icmp eq i32 %outlen.addr.0, 0, !dbg !4077
  br i1 %cmp19.not, label %while.end, label %while.body, !dbg !4076

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s_inc) #4, !dbg !4078
    #dbg_value(i32 0, !4038, !DIExpression(), !4034)
  %5 = icmp ult i32 %outlen.addr.0, %r, !dbg !4080
  %6 = select i1 %5, i32 %outlen.addr.0, i32 %r, !dbg !4080
  br label %for.cond21, !dbg !4080

for.cond21:                                       ; preds = %for.body28, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc37, %for.body28 ], !dbg !4082
    #dbg_value(i32 %i.1, !4038, !DIExpression(), !4034)
  %exitcond1 = icmp ne i32 %i.1, %6, !dbg !4083
  br i1 %exitcond1, label %for.body28, label %for.end38, !dbg !4085

for.body28:                                       ; preds = %for.cond21
  %shr29 = lshr i32 %i.1, 3, !dbg !4086
  %arrayidx30 = getelementptr inbounds nuw i64, ptr %s_inc, i32 %shr29, !dbg !4088
  %7 = load i64, ptr %arrayidx30, align 8, !dbg !4088
  %and31 = shl nuw nsw i32 %i.1, 3, !dbg !4089
  %mul32 = and i32 %and31, 56, !dbg !4089
  %sh_prom = zext nneg i32 %mul32 to i64, !dbg !4090
  %shr33 = lshr i64 %7, %sh_prom, !dbg !4090
  %conv34 = trunc i64 %shr33 to i8, !dbg !4091
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %h.addr.0, i32 %i.1, !dbg !4092
  store i8 %conv34, ptr %arrayidx35, align 1, !dbg !4093
  %inc37 = add nuw nsw i32 %i.1, 1, !dbg !4094
    #dbg_value(i32 %inc37, !4038, !DIExpression(), !4034)
  br label %for.cond21, !dbg !4095, !llvm.loop !4096

for.end38:                                        ; preds = %for.cond21
  %i.1.lcssa = phi i32 [ %i.1, %for.cond21 ], !dbg !4082
  %add.ptr39 = getelementptr inbounds nuw i8, ptr %h.addr.0, i32 %i.1.lcssa, !dbg !4098
    #dbg_value(ptr %add.ptr39, !4033, !DIExpression(), !4034)
  %sub40 = sub i32 %outlen.addr.0, %i.1.lcssa, !dbg !4099
    #dbg_value(i32 %sub40, !4035, !DIExpression(), !4034)
  %sub41 = sub nsw i32 %r, %i.1.lcssa, !dbg !4100
  %conv42 = zext i32 %sub41 to i64, !dbg !4101
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %s_inc, i32 200, !dbg !4102
  store i64 %conv42, ptr %arrayidx43, align 8, !dbg !4103
  br label %while.cond, !dbg !4076, !llvm.loop !4104

while.end:                                        ; preds = %while.cond
  ret void, !dbg !4106
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4107 {
entry:
    #dbg_value(ptr %dest, !4112, !DIExpression(), !4113)
    #dbg_value(ptr %src, !4114, !DIExpression(), !4113)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4115
  store ptr %call, ptr %dest, align 4, !dbg !4116
  %cmp = icmp eq ptr %call, null, !dbg !4117
  br i1 %cmp, label %if.then, label %if.end, !dbg !4117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4119
  br label %if.end, !dbg !4121

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4122
  %1 = load ptr, ptr %src, align 4, !dbg !4123
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 208) #6, !dbg !4124
  ret void, !dbg !4125
}

; Function Attrs: nounwind
define dso_local void @shake128_inc_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4126 {
entry:
    #dbg_value(ptr %state, !4127, !DIExpression(), !4128)
  %0 = load ptr, ptr %state, align 4, !dbg !4129
  call void @free(ptr noundef %0) #6, !dbg !4130
  ret void, !dbg !4131
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4132 {
entry:
    #dbg_value(ptr %state, !4140, !DIExpression(), !4141)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4142
  store ptr %call, ptr %state, align 4, !dbg !4143
  %cmp = icmp eq ptr %call, null, !dbg !4144
  br i1 %cmp, label %if.then, label %if.end, !dbg !4144

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4146
  br label %if.end, !dbg !4148

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4149
  call fastcc void @keccak_inc_init(ptr noundef %0) #4, !dbg !4150
  ret void, !dbg !4151
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4152 {
entry:
    #dbg_value(ptr %state, !4155, !DIExpression(), !4156)
    #dbg_value(ptr %input, !4157, !DIExpression(), !4156)
    #dbg_value(i32 %inlen, !4158, !DIExpression(), !4156)
  %0 = load ptr, ptr %state, align 4, !dbg !4159
  call fastcc void @keccak_inc_absorb(ptr noundef %0, i32 noundef 136, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4160
  ret void, !dbg !4161
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !4162 {
entry:
    #dbg_value(ptr %state, !4163, !DIExpression(), !4164)
  %0 = load ptr, ptr %state, align 4, !dbg !4165
  call fastcc void @keccak_inc_finalize(ptr noundef %0, i32 noundef 136, i8 noundef zeroext 31) #4, !dbg !4166
  ret void, !dbg !4167
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_squeeze(ptr noundef %output, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !4168 {
entry:
    #dbg_value(ptr %output, !4171, !DIExpression(), !4172)
    #dbg_value(i32 %outlen, !4173, !DIExpression(), !4172)
    #dbg_value(ptr %state, !4174, !DIExpression(), !4172)
  %0 = load ptr, ptr %state, align 4, !dbg !4175
  call fastcc void @keccak_inc_squeeze(ptr noundef %output, i32 noundef %outlen, ptr noundef %0, i32 noundef 136) #4, !dbg !4176
  ret void, !dbg !4177
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4178 {
entry:
    #dbg_value(ptr %dest, !4183, !DIExpression(), !4184)
    #dbg_value(ptr %src, !4185, !DIExpression(), !4184)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4186
  store ptr %call, ptr %dest, align 4, !dbg !4187
  %cmp = icmp eq ptr %call, null, !dbg !4188
  br i1 %cmp, label %if.then, label %if.end, !dbg !4188

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4190
  br label %if.end, !dbg !4192

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4193
  %1 = load ptr, ptr %src, align 4, !dbg !4194
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 208) #6, !dbg !4195
  ret void, !dbg !4196
}

; Function Attrs: nounwind
define dso_local void @shake256_inc_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4197 {
entry:
    #dbg_value(ptr %state, !4198, !DIExpression(), !4199)
  %0 = load ptr, ptr %state, align 4, !dbg !4200
  call void @free(ptr noundef %0) #6, !dbg !4201
  ret void, !dbg !4202
}

; Function Attrs: nounwind
define dso_local void @shake128_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4203 {
entry:
    #dbg_value(ptr %state, !4211, !DIExpression(), !4212)
    #dbg_value(ptr %input, !4213, !DIExpression(), !4212)
    #dbg_value(i32 %inlen, !4214, !DIExpression(), !4212)
  %call = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7, !dbg !4215
  store ptr %call, ptr %state, align 4, !dbg !4216
  %cmp = icmp eq ptr %call, null, !dbg !4217
  br i1 %cmp, label %if.then, label %if.end, !dbg !4217

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4219
  br label %if.end, !dbg !4221

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4222
  call fastcc void @keccak_absorb(ptr noundef %0, i32 noundef 168, ptr noundef %input, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4223
  ret void, !dbg !4224
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %m, i32 noundef %mlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !4225 {
entry:
  %t = alloca [200 x i8], align 1
    #dbg_value(ptr %s, !4228, !DIExpression(), !4229)
    #dbg_value(i32 %r, !4230, !DIExpression(), !4229)
    #dbg_value(ptr %m, !4231, !DIExpression(), !4229)
    #dbg_value(i32 %mlen, !4232, !DIExpression(), !4229)
    #dbg_value(i8 %p, !4233, !DIExpression(), !4229)
    #dbg_declare(ptr %t, !4234, !DIExpression(), !4238)
    #dbg_value(i32 0, !4239, !DIExpression(), !4229)
  br label %for.cond, !dbg !4240

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4242
    #dbg_value(i32 %i.0, !4239, !DIExpression(), !4229)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !4243
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !4245

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !4246
  br label %while.cond, !dbg !4246

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !4247
  store i64 0, ptr %arrayidx, align 8, !dbg !4249
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4250
    #dbg_value(i32 %inc, !4239, !DIExpression(), !4229)
  br label %for.cond, !dbg !4251, !llvm.loop !4252

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %m.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %m, %while.cond.preheader ]
  %mlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %mlen, %while.cond.preheader ]
    #dbg_value(i32 %mlen.addr.0, !4232, !DIExpression(), !4229)
    #dbg_value(ptr %m.addr.0, !4231, !DIExpression(), !4229)
  %cmp1.not = icmp ult i32 %mlen.addr.0, %r, !dbg !4254
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !4246

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !4255

for.cond10.preheader:                             ; preds = %while.cond
  %mlen.addr.0.lcssa5 = phi i32 [ %mlen.addr.0, %while.cond ]
  %m.addr.0.lcssa = phi ptr [ %m.addr.0, %while.cond ]
  br label %for.cond10, !dbg !4258

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !4260
    #dbg_value(i32 %i.1, !4239, !DIExpression(), !4229)
  %exitcond3 = icmp ne i32 %i.1, %0, !dbg !4261
  br i1 %exitcond3, label %for.body4, label %for.end8, !dbg !4255

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !4263
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 %mul, !dbg !4265
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #4, !dbg !4266
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !4267
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !4268
  %xor = xor i64 %1, %call, !dbg !4268
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !4268
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !4269
    #dbg_value(i32 %inc7, !4239, !DIExpression(), !4229)
  br label %for.cond2, !dbg !4270, !llvm.loop !4271

for.end8:                                         ; preds = %for.cond2
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !4273
  %sub = sub i32 %mlen.addr.0, %r, !dbg !4274
    #dbg_value(i32 %sub, !4232, !DIExpression(), !4229)
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 %r, !dbg !4275
    #dbg_value(ptr %add.ptr9, !4231, !DIExpression(), !4229)
  br label %while.cond, !dbg !4246, !llvm.loop !4276

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc15, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !4278
    #dbg_value(i32 %i.2, !4239, !DIExpression(), !4229)
  %exitcond4 = icmp ne i32 %i.2, %r, !dbg !4279
  br i1 %exitcond4, label %for.body12, label %for.cond17.preheader, !dbg !4258

for.cond17.preheader:                             ; preds = %for.cond10
  br label %for.cond17, !dbg !4281

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw [200 x i8], ptr %t, i32 0, i32 %i.2, !dbg !4283
  store i8 0, ptr %arrayidx13, align 1, !dbg !4285
  %inc15 = add nuw nsw i32 %i.2, 1, !dbg !4286
    #dbg_value(i32 %inc15, !4239, !DIExpression(), !4229)
  br label %for.cond10, !dbg !4287, !llvm.loop !4288

for.cond17:                                       ; preds = %for.cond17.preheader, %for.body19
  %i.3 = phi i32 [ %inc23, %for.body19 ], [ 0, %for.cond17.preheader ], !dbg !4290
    #dbg_value(i32 %i.3, !4239, !DIExpression(), !4229)
  %exitcond6 = icmp ne i32 %i.3, %mlen.addr.0.lcssa5, !dbg !4291
  br i1 %exitcond6, label %for.body19, label %for.end24, !dbg !4281

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %m.addr.0.lcssa, i32 %i.3, !dbg !4293
  %2 = load i8, ptr %arrayidx20, align 1, !dbg !4293
  %arrayidx21 = getelementptr inbounds nuw [200 x i8], ptr %t, i32 0, i32 %i.3, !dbg !4295
  store i8 %2, ptr %arrayidx21, align 1, !dbg !4296
  %inc23 = add i32 %i.3, 1, !dbg !4297
    #dbg_value(i32 %inc23, !4239, !DIExpression(), !4229)
  br label %for.cond17, !dbg !4298, !llvm.loop !4299

for.end24:                                        ; preds = %for.cond17
  %i.3.lcssa = phi i32 [ %i.3, %for.cond17 ], !dbg !4290
  %arrayidx25 = getelementptr inbounds nuw [200 x i8], ptr %t, i32 0, i32 %i.3.lcssa, !dbg !4301
  store i8 %p, ptr %arrayidx25, align 1, !dbg !4302
  %sub26 = add nsw i32 %r, -1, !dbg !4303
  %arrayidx27 = getelementptr inbounds nuw [200 x i8], ptr %t, i32 0, i32 %sub26, !dbg !4304
  %3 = load i8, ptr %arrayidx27, align 1, !dbg !4305
  %4 = or i8 %3, -128, !dbg !4305
  store i8 %4, ptr %arrayidx27, align 1, !dbg !4305
    #dbg_value(i32 0, !4239, !DIExpression(), !4229)
  br label %for.cond29, !dbg !4306

for.cond29:                                       ; preds = %for.body33, %for.end24
  %i.4 = phi i32 [ 0, %for.end24 ], [ %inc40, %for.body33 ], !dbg !4308
    #dbg_value(i32 %i.4, !4239, !DIExpression(), !4229)
  %exitcond7 = icmp ne i32 %i.4, %0, !dbg !4309
  br i1 %exitcond7, label %for.body33, label %for.end41, !dbg !4311

for.body33:                                       ; preds = %for.cond29
  %mul34 = shl nuw nsw i32 %i.4, 3, !dbg !4312
  %add.ptr35 = getelementptr inbounds nuw i8, ptr %t, i32 %mul34, !dbg !4314
  %call36 = call fastcc i64 @load64(ptr noundef nonnull %add.ptr35) #4, !dbg !4315
  %arrayidx37 = getelementptr inbounds nuw i64, ptr %s, i32 %i.4, !dbg !4316
  %5 = load i64, ptr %arrayidx37, align 8, !dbg !4317
  %xor38 = xor i64 %5, %call36, !dbg !4317
  store i64 %xor38, ptr %arrayidx37, align 8, !dbg !4317
  %inc40 = add nuw nsw i32 %i.4, 1, !dbg !4318
    #dbg_value(i32 %inc40, !4239, !DIExpression(), !4229)
  br label %for.cond29, !dbg !4319, !llvm.loop !4320

for.end41:                                        ; preds = %for.cond29
  ret void, !dbg !4322
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !4323 {
entry:
    #dbg_value(ptr %x, !4326, !DIExpression(), !4327)
    #dbg_value(i64 0, !4328, !DIExpression(), !4327)
    #dbg_value(i32 0, !4329, !DIExpression(), !4331)
  br label %for.cond, !dbg !4332

for.cond:                                         ; preds = %for.inc, %entry
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !4327
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !4333
    #dbg_value(i32 %i.0, !4329, !DIExpression(), !4331)
    #dbg_value(i64 %r.0, !4328, !DIExpression(), !4327)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !4334
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !4336

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4327)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !4337
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4337
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4327)
  %conv = zext i8 %0 to i64, !dbg !4339
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4327)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4340
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4327)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !4341
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4327)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !4341
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !4328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !4327)
  %or = or i64 %r.0, %shl, !dbg !4342
    #dbg_value(i64 %or, !4328, !DIExpression(), !4327)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4343
    #dbg_value(i32 %inc, !4329, !DIExpression(), !4331)
  br label %for.cond, !dbg !4344, !llvm.loop !4345

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !4327
  ret i64 %r.0.lcssa, !dbg !4347
}

; Function Attrs: nounwind
define dso_local void @shake128_squeezeblocks(ptr noundef %output, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !4348 {
entry:
    #dbg_value(ptr %output, !4351, !DIExpression(), !4352)
    #dbg_value(i32 %nblocks, !4353, !DIExpression(), !4352)
    #dbg_value(ptr %state, !4354, !DIExpression(), !4352)
  %0 = load ptr, ptr %state, align 4, !dbg !4355
  call fastcc void @keccak_squeezeblocks(ptr noundef %output, i32 noundef %nblocks, ptr noundef %0, i32 noundef 168) #4, !dbg !4356
  ret void, !dbg !4357
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %h, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 72, 169) %r) unnamed_addr #0 !dbg !4358 {
entry:
    #dbg_value(ptr %h, !4359, !DIExpression(), !4360)
    #dbg_value(i32 %nblocks, !4361, !DIExpression(), !4360)
    #dbg_value(ptr %s, !4362, !DIExpression(), !4360)
    #dbg_value(i32 %r, !4363, !DIExpression(), !4360)
  %0 = lshr i32 %r, 3, !dbg !4364
  br label %while.cond, !dbg !4364

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %dec, %for.end ]
  %h.addr.0 = phi ptr [ %h, %entry ], [ %add.ptr2, %for.end ]
    #dbg_value(ptr %h.addr.0, !4359, !DIExpression(), !4360)
    #dbg_value(i32 %nblocks.addr.0, !4361, !DIExpression(), !4360)
  %cmp.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !4365
  br i1 %cmp.not, label %while.end, label %while.body, !dbg !4364

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !4366
    #dbg_value(i32 0, !4368, !DIExpression(), !4370)
  br label %for.cond, !dbg !4371

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !4372
    #dbg_value(i32 %i.0, !4368, !DIExpression(), !4370)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !4373
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4375

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4376
  %add.ptr = getelementptr inbounds nuw i8, ptr %h.addr.0, i32 %mul, !dbg !4378
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !4379
  %1 = load i64, ptr %arrayidx, align 8, !dbg !4379
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #4, !dbg !4380
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4381
    #dbg_value(i32 %inc, !4368, !DIExpression(), !4370)
  br label %for.cond, !dbg !4382, !llvm.loop !4383

for.end:                                          ; preds = %for.cond
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %h.addr.0, i32 %r, !dbg !4385
    #dbg_value(ptr %add.ptr2, !4359, !DIExpression(), !4360)
  %dec = add i32 %nblocks.addr.0, -1, !dbg !4386
    #dbg_value(i32 %dec, !4361, !DIExpression(), !4360)
  br label %while.cond, !dbg !4364, !llvm.loop !4387

while.end:                                        ; preds = %while.cond
  ret void, !dbg !4389
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !4390 {
entry:
    #dbg_value(ptr %x, !4393, !DIExpression(), !4394)
    #dbg_value(i64 %u, !4395, !DIExpression(), !4394)
    #dbg_value(i32 0, !4396, !DIExpression(), !4398)
  br label %for.cond, !dbg !4399

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4400
    #dbg_value(i32 %i.0, !4396, !DIExpression(), !4398)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !4401
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4403

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4404
  %sh_prom = zext nneg i32 %mul to i64, !dbg !4406
  %shr = lshr i64 %u, %sh_prom, !dbg !4406
  %conv = trunc i64 %shr to i8, !dbg !4407
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !4408
  store i8 %conv, ptr %arrayidx, align 1, !dbg !4409
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4410
    #dbg_value(i32 %inc, !4396, !DIExpression(), !4398)
  br label %for.cond, !dbg !4411, !llvm.loop !4412

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4414
}

; Function Attrs: nounwind
define dso_local void @shake128_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4415 {
entry:
    #dbg_value(ptr %dest, !4420, !DIExpression(), !4421)
    #dbg_value(ptr %src, !4422, !DIExpression(), !4421)
  %call = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7, !dbg !4423
  store ptr %call, ptr %dest, align 4, !dbg !4424
  %cmp = icmp eq ptr %call, null, !dbg !4425
  br i1 %cmp, label %if.then, label %if.end, !dbg !4425

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4427
  br label %if.end, !dbg !4429

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4430
  %1 = load ptr, ptr %src, align 4, !dbg !4431
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 200) #6, !dbg !4432
  ret void, !dbg !4433
}

; Function Attrs: nounwind
define dso_local void @shake128_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4434 {
entry:
    #dbg_value(ptr %state, !4437, !DIExpression(), !4438)
  %0 = load ptr, ptr %state, align 4, !dbg !4439
  call void @free(ptr noundef %0) #6, !dbg !4440
  ret void, !dbg !4441
}

; Function Attrs: nounwind
define dso_local void @shake256_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4442 {
entry:
    #dbg_value(ptr %state, !4450, !DIExpression(), !4451)
    #dbg_value(ptr %input, !4452, !DIExpression(), !4451)
    #dbg_value(i32 %inlen, !4453, !DIExpression(), !4451)
  %call = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7, !dbg !4454
  store ptr %call, ptr %state, align 4, !dbg !4455
  %cmp = icmp eq ptr %call, null, !dbg !4456
  br i1 %cmp, label %if.then, label %if.end, !dbg !4456

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4458
  br label %if.end, !dbg !4460

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4461
  call fastcc void @keccak_absorb(ptr noundef %0, i32 noundef 136, ptr noundef %input, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4462
  ret void, !dbg !4463
}

; Function Attrs: nounwind
define dso_local void @shake256_squeezeblocks(ptr noundef %output, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !4464 {
entry:
    #dbg_value(ptr %output, !4467, !DIExpression(), !4468)
    #dbg_value(i32 %nblocks, !4469, !DIExpression(), !4468)
    #dbg_value(ptr %state, !4470, !DIExpression(), !4468)
  %0 = load ptr, ptr %state, align 4, !dbg !4471
  call fastcc void @keccak_squeezeblocks(ptr noundef %output, i32 noundef %nblocks, ptr noundef %0, i32 noundef 136) #4, !dbg !4472
  ret void, !dbg !4473
}

; Function Attrs: nounwind
define dso_local void @shake256_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4474 {
entry:
    #dbg_value(ptr %dest, !4479, !DIExpression(), !4480)
    #dbg_value(ptr %src, !4481, !DIExpression(), !4480)
  %call = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7, !dbg !4482
  store ptr %call, ptr %dest, align 4, !dbg !4483
  %cmp = icmp eq ptr %call, null, !dbg !4484
  br i1 %cmp, label %if.then, label %if.end, !dbg !4484

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4486
  br label %if.end, !dbg !4488

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4489
  %1 = load ptr, ptr %src, align 4, !dbg !4490
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 200) #6, !dbg !4491
  ret void, !dbg !4492
}

; Function Attrs: nounwind
define dso_local void @shake256_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4493 {
entry:
    #dbg_value(ptr %state, !4496, !DIExpression(), !4497)
  %0 = load ptr, ptr %state, align 4, !dbg !4498
  call void @free(ptr noundef %0) #6, !dbg !4499
  ret void, !dbg !4500
}

; Function Attrs: nounwind
define dso_local void @shake128(ptr noundef %output, i32 noundef %outlen, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4501 {
entry:
  %t = alloca [168 x i8], align 1
  %s = alloca %struct.shake128incctx, align 4
    #dbg_value(ptr %output, !4504, !DIExpression(), !4505)
    #dbg_value(i32 %outlen, !4506, !DIExpression(), !4505)
    #dbg_value(ptr %input, !4507, !DIExpression(), !4505)
    #dbg_value(i32 %inlen, !4508, !DIExpression(), !4505)
  %div = udiv i32 %outlen, 168, !dbg !4509
    #dbg_value(i32 %div, !4510, !DIExpression(), !4505)
    #dbg_declare(ptr %t, !4511, !DIExpression(), !4515)
    #dbg_declare(ptr %s, !4516, !DIExpression(), !4517)
  call void @shake128_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4518
  call void @shake128_squeezeblocks(ptr noundef %output, i32 noundef %div, ptr noundef nonnull %s) #4, !dbg !4519
  %mul = mul nuw i32 %div, 168, !dbg !4520
  %add.ptr = getelementptr inbounds nuw i8, ptr %output, i32 %mul, !dbg !4521
    #dbg_value(ptr %add.ptr, !4504, !DIExpression(), !4505)
  %mul1.neg = mul i32 %div, -168, !dbg !4522
  %sub = add i32 %mul1.neg, %outlen, !dbg !4523
    #dbg_value(i32 %sub, !4506, !DIExpression(), !4505)
  %tobool.not = icmp eq i32 %sub, 0, !dbg !4524
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !4524

if.then:                                          ; preds = %entry
  call void @shake128_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef nonnull %s) #4, !dbg !4526
    #dbg_value(i32 0, !4528, !DIExpression(), !4530)
  br label %for.cond, !dbg !4531

for.cond:                                         ; preds = %for.body, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc, %for.body ], !dbg !4532
    #dbg_value(i32 %i.0, !4528, !DIExpression(), !4530)
  %exitcond = icmp ne i32 %i.0, %sub, !dbg !4533
  br i1 %exitcond, label %for.body, label %if.end.loopexit, !dbg !4535

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [168 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4536
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4536
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0, !dbg !4538
  store i8 %0, ptr %arrayidx2, align 1, !dbg !4539
  %inc = add i32 %i.0, 1, !dbg !4540
    #dbg_value(i32 %inc, !4528, !DIExpression(), !4530)
  br label %for.cond, !dbg !4541, !llvm.loop !4542

if.end.loopexit:                                  ; preds = %for.cond
  br label %if.end, !dbg !4544

if.end:                                           ; preds = %if.end.loopexit, %entry
  call void @shake128_ctx_release(ptr noundef nonnull %s) #4, !dbg !4544
  ret void, !dbg !4545
}

; Function Attrs: nounwind
define dso_local void @shake256(ptr noundef %output, i32 noundef %outlen, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4546 {
entry:
  %t = alloca [136 x i8], align 1
  %s = alloca %struct.shake128incctx, align 4
    #dbg_value(ptr %output, !4547, !DIExpression(), !4548)
    #dbg_value(i32 %outlen, !4549, !DIExpression(), !4548)
    #dbg_value(ptr %input, !4550, !DIExpression(), !4548)
    #dbg_value(i32 %inlen, !4551, !DIExpression(), !4548)
  %div = udiv i32 %outlen, 136, !dbg !4552
    #dbg_value(i32 %div, !4553, !DIExpression(), !4548)
    #dbg_declare(ptr %t, !4554, !DIExpression(), !4558)
    #dbg_declare(ptr %s, !4559, !DIExpression(), !4560)
  call void @shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4561
  call void @shake256_squeezeblocks(ptr noundef %output, i32 noundef %div, ptr noundef nonnull %s) #4, !dbg !4562
  %mul = mul nuw i32 %div, 136, !dbg !4563
  %add.ptr = getelementptr inbounds nuw i8, ptr %output, i32 %mul, !dbg !4564
    #dbg_value(ptr %add.ptr, !4547, !DIExpression(), !4548)
  %mul1.neg = mul i32 %div, -136, !dbg !4565
  %sub = add i32 %mul1.neg, %outlen, !dbg !4566
    #dbg_value(i32 %sub, !4549, !DIExpression(), !4548)
  %tobool.not = icmp eq i32 %sub, 0, !dbg !4567
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !4567

if.then:                                          ; preds = %entry
  call void @shake256_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef nonnull %s) #4, !dbg !4569
    #dbg_value(i32 0, !4571, !DIExpression(), !4573)
  br label %for.cond, !dbg !4574

for.cond:                                         ; preds = %for.body, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc, %for.body ], !dbg !4575
    #dbg_value(i32 %i.0, !4571, !DIExpression(), !4573)
  %exitcond = icmp ne i32 %i.0, %sub, !dbg !4576
  br i1 %exitcond, label %for.body, label %if.end.loopexit, !dbg !4578

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [136 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4579
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4579
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0, !dbg !4581
  store i8 %0, ptr %arrayidx2, align 1, !dbg !4582
  %inc = add i32 %i.0, 1, !dbg !4583
    #dbg_value(i32 %inc, !4571, !DIExpression(), !4573)
  br label %for.cond, !dbg !4584, !llvm.loop !4585

if.end.loopexit:                                  ; preds = %for.cond
  br label %if.end, !dbg !4587

if.end:                                           ; preds = %if.end.loopexit, %entry
  call void @shake256_ctx_release(ptr noundef nonnull %s) #4, !dbg !4587
  ret void, !dbg !4588
}

; Function Attrs: nounwind
define dso_local void @sha3_256_inc_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4589 {
entry:
    #dbg_value(ptr %state, !4597, !DIExpression(), !4598)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4599
  store ptr %call, ptr %state, align 4, !dbg !4600
  %cmp = icmp eq ptr %call, null, !dbg !4601
  br i1 %cmp, label %if.then, label %if.end, !dbg !4601

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4603
  br label %if.end, !dbg !4605

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4606
  call fastcc void @keccak_inc_init(ptr noundef %0) #4, !dbg !4607
  ret void, !dbg !4608
}

; Function Attrs: nounwind
define dso_local void @sha3_256_inc_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4609 {
entry:
    #dbg_value(ptr %dest, !4614, !DIExpression(), !4615)
    #dbg_value(ptr %src, !4616, !DIExpression(), !4615)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4617
  store ptr %call, ptr %dest, align 4, !dbg !4618
  %cmp = icmp eq ptr %call, null, !dbg !4619
  br i1 %cmp, label %if.then, label %if.end, !dbg !4619

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4621
  br label %if.end, !dbg !4623

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4624
  %1 = load ptr, ptr %src, align 4, !dbg !4625
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 208) #6, !dbg !4626
  ret void, !dbg !4627
}

; Function Attrs: nounwind
define dso_local void @sha3_256_inc_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4628 {
entry:
    #dbg_value(ptr %state, !4629, !DIExpression(), !4630)
  %0 = load ptr, ptr %state, align 4, !dbg !4631
  call void @free(ptr noundef %0) #6, !dbg !4632
  ret void, !dbg !4633
}

; Function Attrs: nounwind
define dso_local void @sha3_256_inc_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4634 {
entry:
    #dbg_value(ptr %state, !4637, !DIExpression(), !4638)
    #dbg_value(ptr %input, !4639, !DIExpression(), !4638)
    #dbg_value(i32 %inlen, !4640, !DIExpression(), !4638)
  %0 = load ptr, ptr %state, align 4, !dbg !4641
  call fastcc void @keccak_inc_absorb(ptr noundef %0, i32 noundef 136, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4642
  ret void, !dbg !4643
}

; Function Attrs: nounwind
define dso_local void @sha3_256_inc_finalize(ptr noundef %output, ptr noundef %state) local_unnamed_addr #0 !dbg !4644 {
entry:
  %t = alloca [136 x i8], align 1
    #dbg_value(ptr %output, !4647, !DIExpression(), !4648)
    #dbg_value(ptr %state, !4649, !DIExpression(), !4648)
    #dbg_declare(ptr %t, !4650, !DIExpression(), !4651)
  %0 = load ptr, ptr %state, align 4, !dbg !4652
  call fastcc void @keccak_inc_finalize(ptr noundef %0, i32 noundef 136, i8 noundef zeroext 6) #4, !dbg !4653
  %1 = load ptr, ptr %state, align 4, !dbg !4654
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef %1, i32 noundef 136) #4, !dbg !4655
  call void @sha3_256_inc_ctx_release(ptr noundef nonnull %state) #4, !dbg !4656
    #dbg_value(i32 0, !4657, !DIExpression(), !4659)
  br label %for.cond, !dbg !4660

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4661
    #dbg_value(i32 %i.0, !4657, !DIExpression(), !4659)
  %exitcond = icmp ne i32 %i.0, 32, !dbg !4662
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4664

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [136 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4665
  %2 = load i8, ptr %arrayidx, align 1, !dbg !4665
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4667
  store i8 %2, ptr %arrayidx2, align 1, !dbg !4668
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4669
    #dbg_value(i32 %inc, !4657, !DIExpression(), !4659)
  br label %for.cond, !dbg !4670, !llvm.loop !4671

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4673
}

; Function Attrs: nounwind
define dso_local void @sha3_256(ptr noundef %output, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4674 {
entry:
  %s = alloca [25 x i64], align 8
  %t = alloca [136 x i8], align 1
    #dbg_value(ptr %output, !4677, !DIExpression(), !4678)
    #dbg_value(ptr %input, !4679, !DIExpression(), !4678)
    #dbg_value(i32 %inlen, !4680, !DIExpression(), !4678)
    #dbg_declare(ptr %s, !4681, !DIExpression(), !4685)
    #dbg_declare(ptr %t, !4686, !DIExpression(), !4687)
  call fastcc void @keccak_absorb(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %input, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4688
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef nonnull %s, i32 noundef 136) #4, !dbg !4689
    #dbg_value(i32 0, !4690, !DIExpression(), !4692)
  br label %for.cond, !dbg !4693

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4694
    #dbg_value(i32 %i.0, !4690, !DIExpression(), !4692)
  %exitcond = icmp ne i32 %i.0, 32, !dbg !4695
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4697

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [136 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4698
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4698
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4700
  store i8 %0, ptr %arrayidx3, align 1, !dbg !4701
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4702
    #dbg_value(i32 %inc, !4690, !DIExpression(), !4692)
  br label %for.cond, !dbg !4703, !llvm.loop !4704

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4706
}

; Function Attrs: nounwind
define dso_local void @sha3_384_inc_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4707 {
entry:
    #dbg_value(ptr %state, !4715, !DIExpression(), !4716)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4717
  store ptr %call, ptr %state, align 4, !dbg !4718
  %cmp = icmp eq ptr %call, null, !dbg !4719
  br i1 %cmp, label %if.then, label %if.end, !dbg !4719

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4721
  br label %if.end, !dbg !4723

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4724
  call fastcc void @keccak_inc_init(ptr noundef %0) #4, !dbg !4725
  ret void, !dbg !4726
}

; Function Attrs: nounwind
define dso_local void @sha3_384_inc_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4727 {
entry:
    #dbg_value(ptr %dest, !4732, !DIExpression(), !4733)
    #dbg_value(ptr %src, !4734, !DIExpression(), !4733)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4735
  store ptr %call, ptr %dest, align 4, !dbg !4736
  %cmp = icmp eq ptr %call, null, !dbg !4737
  br i1 %cmp, label %if.then, label %if.end, !dbg !4737

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4739
  br label %if.end, !dbg !4741

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4742
  %1 = load ptr, ptr %src, align 4, !dbg !4743
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 208) #6, !dbg !4744
  ret void, !dbg !4745
}

; Function Attrs: nounwind
define dso_local void @sha3_384_inc_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4746 {
entry:
    #dbg_value(ptr %state, !4749, !DIExpression(), !4750)
    #dbg_value(ptr %input, !4751, !DIExpression(), !4750)
    #dbg_value(i32 %inlen, !4752, !DIExpression(), !4750)
  %0 = load ptr, ptr %state, align 4, !dbg !4753
  call fastcc void @keccak_inc_absorb(ptr noundef %0, i32 noundef 104, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4754
  ret void, !dbg !4755
}

; Function Attrs: nounwind
define dso_local void @sha3_384_inc_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4756 {
entry:
    #dbg_value(ptr %state, !4757, !DIExpression(), !4758)
  %0 = load ptr, ptr %state, align 4, !dbg !4759
  call void @free(ptr noundef %0) #6, !dbg !4760
  ret void, !dbg !4761
}

; Function Attrs: nounwind
define dso_local void @sha3_384_inc_finalize(ptr noundef %output, ptr noundef %state) local_unnamed_addr #0 !dbg !4762 {
entry:
  %t = alloca [104 x i8], align 1
    #dbg_value(ptr %output, !4765, !DIExpression(), !4766)
    #dbg_value(ptr %state, !4767, !DIExpression(), !4766)
    #dbg_declare(ptr %t, !4768, !DIExpression(), !4772)
  %0 = load ptr, ptr %state, align 4, !dbg !4773
  call fastcc void @keccak_inc_finalize(ptr noundef %0, i32 noundef 104, i8 noundef zeroext 6) #4, !dbg !4774
  %1 = load ptr, ptr %state, align 4, !dbg !4775
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef %1, i32 noundef 104) #4, !dbg !4776
  call void @sha3_384_inc_ctx_release(ptr noundef nonnull %state) #4, !dbg !4777
    #dbg_value(i32 0, !4778, !DIExpression(), !4780)
  br label %for.cond, !dbg !4781

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4782
    #dbg_value(i32 %i.0, !4778, !DIExpression(), !4780)
  %exitcond = icmp ne i32 %i.0, 48, !dbg !4783
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4785

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [104 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4786
  %2 = load i8, ptr %arrayidx, align 1, !dbg !4786
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4788
  store i8 %2, ptr %arrayidx2, align 1, !dbg !4789
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4790
    #dbg_value(i32 %inc, !4778, !DIExpression(), !4780)
  br label %for.cond, !dbg !4791, !llvm.loop !4792

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4794
}

; Function Attrs: nounwind
define dso_local void @sha3_384(ptr noundef %output, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4795 {
entry:
  %s = alloca [25 x i64], align 8
  %t = alloca [104 x i8], align 1
    #dbg_value(ptr %output, !4796, !DIExpression(), !4797)
    #dbg_value(ptr %input, !4798, !DIExpression(), !4797)
    #dbg_value(i32 %inlen, !4799, !DIExpression(), !4797)
    #dbg_declare(ptr %s, !4800, !DIExpression(), !4801)
    #dbg_declare(ptr %t, !4802, !DIExpression(), !4803)
  call fastcc void @keccak_absorb(ptr noundef nonnull %s, i32 noundef 104, ptr noundef %input, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4804
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef nonnull %s, i32 noundef 104) #4, !dbg !4805
    #dbg_value(i32 0, !4806, !DIExpression(), !4808)
  br label %for.cond, !dbg !4809

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4810
    #dbg_value(i32 %i.0, !4806, !DIExpression(), !4808)
  %exitcond = icmp ne i32 %i.0, 48, !dbg !4811
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4813

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [104 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4814
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4814
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4816
  store i8 %0, ptr %arrayidx3, align 1, !dbg !4817
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4818
    #dbg_value(i32 %inc, !4806, !DIExpression(), !4808)
  br label %for.cond, !dbg !4819, !llvm.loop !4820

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4822
}

; Function Attrs: nounwind
define dso_local void @sha3_512_inc_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4823 {
entry:
    #dbg_value(ptr %state, !4831, !DIExpression(), !4832)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4833
  store ptr %call, ptr %state, align 4, !dbg !4834
  %cmp = icmp eq ptr %call, null, !dbg !4835
  br i1 %cmp, label %if.then, label %if.end, !dbg !4835

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4837
  br label %if.end, !dbg !4839

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4, !dbg !4840
  call fastcc void @keccak_inc_init(ptr noundef %0) #4, !dbg !4841
  ret void, !dbg !4842
}

; Function Attrs: nounwind
define dso_local void @sha3_512_inc_ctx_clone(ptr noundef %dest, ptr noundef %src) local_unnamed_addr #0 !dbg !4843 {
entry:
    #dbg_value(ptr %dest, !4848, !DIExpression(), !4849)
    #dbg_value(ptr %src, !4850, !DIExpression(), !4849)
  %call = call dereferenceable_or_null(208) ptr @malloc(i32 noundef 208) #7, !dbg !4851
  store ptr %call, ptr %dest, align 4, !dbg !4852
  %cmp = icmp eq ptr %call, null, !dbg !4853
  br i1 %cmp, label %if.then, label %if.end, !dbg !4853

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4855
  br label %if.end, !dbg !4857

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %dest, align 4, !dbg !4858
  %1 = load ptr, ptr %src, align 4, !dbg !4859
  %call4 = call ptr @memcpy(ptr noundef %0, ptr noundef %1, i32 noundef 208) #6, !dbg !4860
  ret void, !dbg !4861
}

; Function Attrs: nounwind
define dso_local void @sha3_512_inc_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4862 {
entry:
    #dbg_value(ptr %state, !4865, !DIExpression(), !4866)
    #dbg_value(ptr %input, !4867, !DIExpression(), !4866)
    #dbg_value(i32 %inlen, !4868, !DIExpression(), !4866)
  %0 = load ptr, ptr %state, align 4, !dbg !4869
  call fastcc void @keccak_inc_absorb(ptr noundef %0, i32 noundef 72, ptr noundef %input, i32 noundef %inlen) #4, !dbg !4870
  ret void, !dbg !4871
}

; Function Attrs: nounwind
define dso_local void @sha3_512_inc_ctx_release(ptr noundef %state) local_unnamed_addr #0 !dbg !4872 {
entry:
    #dbg_value(ptr %state, !4873, !DIExpression(), !4874)
  %0 = load ptr, ptr %state, align 4, !dbg !4875
  call void @free(ptr noundef %0) #6, !dbg !4876
  ret void, !dbg !4877
}

; Function Attrs: nounwind
define dso_local void @sha3_512_inc_finalize(ptr noundef %output, ptr noundef %state) local_unnamed_addr #0 !dbg !4878 {
entry:
  %t = alloca [72 x i8], align 1
    #dbg_value(ptr %output, !4881, !DIExpression(), !4882)
    #dbg_value(ptr %state, !4883, !DIExpression(), !4882)
    #dbg_declare(ptr %t, !4884, !DIExpression(), !4888)
  %0 = load ptr, ptr %state, align 4, !dbg !4889
  call fastcc void @keccak_inc_finalize(ptr noundef %0, i32 noundef 72, i8 noundef zeroext 6) #4, !dbg !4890
  %1 = load ptr, ptr %state, align 4, !dbg !4891
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef %1, i32 noundef 72) #4, !dbg !4892
  call void @sha3_512_inc_ctx_release(ptr noundef nonnull %state) #4, !dbg !4893
    #dbg_value(i32 0, !4894, !DIExpression(), !4896)
  br label %for.cond, !dbg !4897

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4898
    #dbg_value(i32 %i.0, !4894, !DIExpression(), !4896)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !4899
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4901

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [72 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4902
  %2 = load i8, ptr %arrayidx, align 1, !dbg !4902
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4904
  store i8 %2, ptr %arrayidx2, align 1, !dbg !4905
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4906
    #dbg_value(i32 %inc, !4894, !DIExpression(), !4896)
  br label %for.cond, !dbg !4907, !llvm.loop !4908

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4910
}

; Function Attrs: nounwind
define dso_local void @sha3_512(ptr noundef %output, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4911 {
entry:
  %s = alloca [25 x i64], align 8
  %t = alloca [72 x i8], align 1
    #dbg_value(ptr %output, !4912, !DIExpression(), !4913)
    #dbg_value(ptr %input, !4914, !DIExpression(), !4913)
    #dbg_value(i32 %inlen, !4915, !DIExpression(), !4913)
    #dbg_declare(ptr %s, !4916, !DIExpression(), !4917)
    #dbg_declare(ptr %t, !4918, !DIExpression(), !4919)
  call fastcc void @keccak_absorb(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %input, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4920
  call fastcc void @keccak_squeezeblocks(ptr noundef nonnull %t, i32 noundef 1, ptr noundef nonnull %s, i32 noundef 72) #4, !dbg !4921
    #dbg_value(i32 0, !4922, !DIExpression(), !4924)
  br label %for.cond, !dbg !4925

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4926
    #dbg_value(i32 %i.0, !4922, !DIExpression(), !4924)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !4927
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4929

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [72 x i8], ptr %t, i32 0, i32 %i.0, !dbg !4930
  %0 = load i8, ptr %arrayidx, align 1, !dbg !4930
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %output, i32 %i.0, !dbg !4932
  store i8 %0, ptr %arrayidx3, align 1, !dbg !4933
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4934
    #dbg_value(i32 %inc, !4922, !DIExpression(), !4924)
  br label %for.cond, !dbg !4935, !llvm.loop !4936

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4938
}

; Function Attrs: nounwind
define dso_local void @aes128_ecb_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !4939 {
entry:
  %skey = alloca [22 x i64], align 8
    #dbg_value(ptr %r, !4947, !DIExpression(), !4948)
    #dbg_value(ptr %key, !4949, !DIExpression(), !4948)
    #dbg_declare(ptr %skey, !4950, !DIExpression(), !4954)
  %call = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7, !dbg !4955
  store ptr %call, ptr %r, align 4, !dbg !4956
  %cmp = icmp eq ptr %call, null, !dbg !4957
  br i1 %cmp, label %if.then, label %if.end, !dbg !4957

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !4959
  br label %if.end, !dbg !4961

if.end:                                           ; preds = %if.then, %entry
  call fastcc void @br_aes_ct64_keysched(ptr noundef nonnull %skey, ptr noundef %key, i32 noundef 16) #4, !dbg !4962
  %0 = load ptr, ptr %r, align 4, !dbg !4963
  call fastcc void @br_aes_ct64_skey_expand(ptr noundef %0, ptr noundef nonnull %skey, i32 noundef 10) #4, !dbg !4964
  ret void, !dbg !4965
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_keysched(ptr noundef nonnull %comp_skey, ptr noundef %key, i32 noundef range(i32 16, 33) %key_len) unnamed_addr #0 !dbg !4966 {
entry:
  %skey = alloca [60 x i32], align 4
  %q = alloca [8 x i64], align 8
    #dbg_value(ptr %comp_skey, !4969, !DIExpression(), !4970)
    #dbg_value(ptr %key, !4971, !DIExpression(), !4970)
    #dbg_value(i32 %key_len, !4972, !DIExpression(), !4970)
    #dbg_declare(ptr %skey, !4973, !DIExpression(), !4977)
  %0 = and i32 %key_len, 60, !dbg !4978
    #dbg_value(i32 %key_len, !4979, !DIExpression(DW_OP_constu, 16, DW_OP_minus, DW_OP_constu, 2, DW_OP_shr, DW_OP_plus_uconst, 10, DW_OP_stack_value), !4970)
  %shr1 = lshr i32 %key_len, 2, !dbg !4980
    #dbg_value(i32 %shr1, !4981, !DIExpression(), !4970)
  %shl = add nuw nsw i32 %0, 28, !dbg !4978
    #dbg_value(i32 %shl, !4982, !DIExpression(), !4970)
  %shr3 = lshr i32 %key_len, 2, !dbg !4983
  call fastcc void @br_range_dec32le(ptr noundef nonnull %skey, i32 noundef %shr3, ptr noundef %key) #4, !dbg !4984
  %shr4 = lshr i32 %key_len, 2, !dbg !4985
  %sub5 = add nsw i32 %shr4, -1, !dbg !4986
  %arrayidx = getelementptr inbounds nuw [60 x i32], ptr %skey, i32 0, i32 %sub5, !dbg !4987
  %1 = load i32, ptr %arrayidx, align 4, !dbg !4987
    #dbg_value(i32 %1, !4988, !DIExpression(), !4970)
    #dbg_value(i32 %shr1, !4989, !DIExpression(), !4970)
    #dbg_value(i32 0, !4990, !DIExpression(), !4970)
    #dbg_value(i32 0, !4991, !DIExpression(), !4970)
  br label %for.cond, !dbg !4992

for.cond:                                         ; preds = %if.end16, %entry
  %i.0 = phi i32 [ %shr1, %entry ], [ %inc26, %if.end16 ], !dbg !4994
  %j.0 = phi i32 [ 0, %entry ], [ %spec.select, %if.end16 ], !dbg !4995
  %k.0 = phi i32 [ 0, %entry ], [ %spec.select1, %if.end16 ], !dbg !4995
  %tmp.0 = phi i32 [ %1, %entry ], [ %xor19, %if.end16 ], !dbg !4970
    #dbg_value(i32 %tmp.0, !4988, !DIExpression(), !4970)
    #dbg_value(i32 %k.0, !4991, !DIExpression(), !4970)
    #dbg_value(i32 %j.0, !4990, !DIExpression(), !4970)
    #dbg_value(i32 %i.0, !4989, !DIExpression(), !4970)
  %exitcond = icmp ne i32 %i.0, %shl, !dbg !4996
  br i1 %exitcond, label %for.body, label %for.cond27.preheader, !dbg !4998

for.cond27.preheader:                             ; preds = %for.cond
  br label %for.cond27, !dbg !4999

for.body:                                         ; preds = %for.cond
  %cmp6 = icmp eq i32 %j.0, 0, !dbg !5001
  br i1 %cmp6, label %if.then, label %if.else, !dbg !5001

if.then:                                          ; preds = %for.body
  %2 = shl i32 %tmp.0, 24, !dbg !5004
  %3 = lshr i32 %tmp.0, 8, !dbg !5004
  %4 = or i32 %2, %3, !dbg !5004
    #dbg_value(i32 %4, !4988, !DIExpression(), !4970)
  %call = call fastcc i32 @sub_word(i32 noundef %4) #4, !dbg !5006
  %arrayidx9 = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0, !dbg !5007
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !5007
  %conv = zext i8 %5 to i32, !dbg !5007
  %xor = xor i32 %call, %conv, !dbg !5008
    #dbg_value(i32 %xor, !4988, !DIExpression(), !4970)
  br label %if.end16, !dbg !5009

if.else:                                          ; preds = %for.body
  %cmp10 = icmp samesign ugt i32 %key_len, 27, !dbg !5010
  %cmp12 = icmp eq i32 %j.0, 4
  %or.cond = and i1 %cmp10, %cmp12, !dbg !5012
  br i1 %or.cond, label %if.then14, label %if.end16, !dbg !5012

if.then14:                                        ; preds = %if.else
  %call15 = call fastcc i32 @sub_word(i32 noundef %tmp.0) #4, !dbg !5013
    #dbg_value(i32 %call15, !4988, !DIExpression(), !4970)
  br label %if.end16, !dbg !5015

if.end16:                                         ; preds = %if.else, %if.then14, %if.then
  %tmp.2 = phi i32 [ %xor, %if.then ], [ %call15, %if.then14 ], [ %tmp.0, %if.else ], !dbg !5016
    #dbg_value(i32 %tmp.2, !4988, !DIExpression(), !4970)
  %sub17 = sub nuw nsw i32 %i.0, %shr1, !dbg !5017
  %arrayidx18 = getelementptr inbounds nuw [60 x i32], ptr %skey, i32 0, i32 %sub17, !dbg !5018
  %6 = load i32, ptr %arrayidx18, align 4, !dbg !5018
  %xor19 = xor i32 %tmp.2, %6, !dbg !5019
    #dbg_value(i32 %xor19, !4988, !DIExpression(), !4970)
  %arrayidx20 = getelementptr inbounds nuw [60 x i32], ptr %skey, i32 0, i32 %i.0, !dbg !5020
  store i32 %xor19, ptr %arrayidx20, align 4, !dbg !5021
  %inc = add i32 %j.0, 1, !dbg !5022
    #dbg_value(i32 %inc, !4990, !DIExpression(), !4970)
  %cmp21 = icmp eq i32 %inc, %shr1, !dbg !5024
  %spec.select = select i1 %cmp21, i32 0, i32 %inc, !dbg !5024
  %inc24 = zext i1 %cmp21 to i32, !dbg !5024
  %spec.select1 = add i32 %k.0, %inc24, !dbg !5024
    #dbg_value(i32 %spec.select1, !4991, !DIExpression(), !4970)
    #dbg_value(i32 %spec.select, !4990, !DIExpression(), !4970)
  %inc26 = add nuw nsw i32 %i.0, 1, !dbg !5025
    #dbg_value(i32 %inc26, !4989, !DIExpression(), !4970)
  br label %for.cond, !dbg !5026, !llvm.loop !5027

for.cond27:                                       ; preds = %for.cond27.preheader, %for.body30
  %i.1 = phi i32 [ %add73, %for.body30 ], [ 0, %for.cond27.preheader ], !dbg !5029
  %j.2 = phi i32 [ %add74, %for.body30 ], [ 0, %for.cond27.preheader ], !dbg !5029
    #dbg_value(i32 %j.2, !4990, !DIExpression(), !4970)
    #dbg_value(i32 %i.1, !4989, !DIExpression(), !4970)
  %cmp28 = icmp samesign ult i32 %i.1, %shl, !dbg !5030
  br i1 %cmp28, label %for.body30, label %for.end75, !dbg !4999

for.body30:                                       ; preds = %for.cond27
    #dbg_declare(ptr %q, !5032, !DIExpression(), !5037)
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5038
  %add.ptr = getelementptr inbounds nuw i32, ptr %skey, i32 %i.1, !dbg !5039
  call fastcc void @br_aes_ct64_interleave_in(ptr noundef nonnull %q, ptr noundef nonnull %arrayidx32, ptr noundef nonnull %add.ptr) #4, !dbg !5040
  %7 = load i64, ptr %q, align 8, !dbg !5041
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5042
  store i64 %7, ptr %arrayidx35, align 8, !dbg !5043
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5044
  store i64 %7, ptr %arrayidx37, align 8, !dbg !5045
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5046
  store i64 %7, ptr %arrayidx39, align 8, !dbg !5047
  %arrayidx40 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5048
  %8 = load i64, ptr %arrayidx40, align 8, !dbg !5048
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5049
  store i64 %8, ptr %arrayidx41, align 8, !dbg !5050
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5051
  store i64 %8, ptr %arrayidx43, align 8, !dbg !5052
  %arrayidx45 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5053
  store i64 %8, ptr %arrayidx45, align 8, !dbg !5054
  call fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) #4, !dbg !5055
  %9 = load i64, ptr %q, align 8, !dbg !5056
  %and = and i64 %9, 1229782938247303441, !dbg !5057
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5058
  %10 = load i64, ptr %arrayidx48, align 8, !dbg !5058
  %and49 = and i64 %10, 2459565876494606882, !dbg !5059
  %or50 = or disjoint i64 %and, %and49, !dbg !5060
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5061
  %11 = load i64, ptr %arrayidx51, align 8, !dbg !5061
  %and52 = and i64 %11, 4919131752989213764, !dbg !5062
  %or53 = or disjoint i64 %or50, %and52, !dbg !5063
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5064
  %12 = load i64, ptr %arrayidx54, align 8, !dbg !5064
  %and55 = and i64 %12, -8608480567731124088, !dbg !5065
  %or56 = or disjoint i64 %or53, %and55, !dbg !5066
  %arrayidx58 = getelementptr inbounds nuw i64, ptr %comp_skey, i32 %j.2, !dbg !5067
  store i64 %or56, ptr %arrayidx58, align 8, !dbg !5068
  %arrayidx59 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5069
  %13 = load i64, ptr %arrayidx59, align 8, !dbg !5069
  %and60 = and i64 %13, 1229782938247303441, !dbg !5070
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5071
  %14 = load i64, ptr %arrayidx61, align 8, !dbg !5071
  %and62 = and i64 %14, 2459565876494606882, !dbg !5072
  %or63 = or disjoint i64 %and60, %and62, !dbg !5073
  %arrayidx64 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5074
  %15 = load i64, ptr %arrayidx64, align 8, !dbg !5074
  %and65 = and i64 %15, 4919131752989213764, !dbg !5075
  %or66 = or disjoint i64 %or63, %and65, !dbg !5076
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5077
  %16 = load i64, ptr %arrayidx67, align 8, !dbg !5077
  %and68 = and i64 %16, -8608480567731124088, !dbg !5078
  %or69 = or disjoint i64 %or66, %and68, !dbg !5079
  %add70 = or disjoint i32 %j.2, 1, !dbg !5080
  %arrayidx71 = getelementptr inbounds nuw i64, ptr %comp_skey, i32 %add70, !dbg !5081
  store i64 %or69, ptr %arrayidx71, align 8, !dbg !5082
  %add73 = add nuw nsw i32 %i.1, 4, !dbg !5083
    #dbg_value(i32 %add73, !4989, !DIExpression(), !4970)
  %add74 = add nuw nsw i32 %j.2, 2, !dbg !5084
    #dbg_value(i32 %add74, !4990, !DIExpression(), !4970)
  br label %for.cond27, !dbg !5085, !llvm.loop !5086

for.end75:                                        ; preds = %for.cond27
  ret void, !dbg !5088
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_skey_expand(ptr noundef %skey, ptr noundef nonnull %comp_skey, i32 noundef range(i32 10, 15) %nrounds) unnamed_addr #0 !dbg !5089 {
entry:
    #dbg_value(ptr %skey, !5092, !DIExpression(), !5093)
    #dbg_value(ptr %comp_skey, !5094, !DIExpression(), !5093)
    #dbg_value(i32 %nrounds, !5095, !DIExpression(), !5093)
  %add = shl nuw nsw i32 %nrounds, 1, !dbg !5096
  %shl = add nuw nsw i32 %add, 2, !dbg !5096
    #dbg_value(i32 %shl, !5097, !DIExpression(), !5093)
    #dbg_value(i32 0, !5098, !DIExpression(), !5093)
    #dbg_value(i32 0, !5099, !DIExpression(), !5093)
  br label %for.cond, !dbg !5100

for.cond:                                         ; preds = %for.body, %entry
  %u.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !5102
  %v.0 = phi i32 [ 0, %entry ], [ %add21, %for.body ], !dbg !5102
    #dbg_value(i32 %v.0, !5099, !DIExpression(), !5093)
    #dbg_value(i32 %u.0, !5098, !DIExpression(), !5093)
  %exitcond = icmp ne i32 %u.0, %shl, !dbg !5103
  br i1 %exitcond, label %for.body, label %for.end, !dbg !5105

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %comp_skey, i32 %u.0, !dbg !5106
  %0 = load i64, ptr %arrayidx, align 8, !dbg !5106
    #dbg_value(i64 %0, !5108, !DIExpression(), !5109)
    #dbg_value(i64 %0, !5110, !DIExpression(), !5109)
    #dbg_value(i64 %0, !5111, !DIExpression(), !5109)
    #dbg_value(i64 %0, !5112, !DIExpression(), !5109)
  %and = and i64 %0, 1229782938247303441, !dbg !5113
    #dbg_value(i64 %and, !5112, !DIExpression(), !5109)
    #dbg_value(i64 %0, !5111, !DIExpression(DW_OP_constu, 2459565876494606882, DW_OP_and, DW_OP_stack_value), !5109)
    #dbg_value(i64 %0, !5110, !DIExpression(DW_OP_constu, 4919131752989213764, DW_OP_and, DW_OP_stack_value), !5109)
    #dbg_value(i64 %0, !5108, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !5109)
  %and1 = lshr i64 %0, 1, !dbg !5114
  %shr = and i64 %and1, 1229782938247303441, !dbg !5114
    #dbg_value(i64 %shr, !5111, !DIExpression(), !5109)
  %and2 = lshr i64 %0, 2, !dbg !5115
  %shr4 = and i64 %and2, 1229782938247303441, !dbg !5115
    #dbg_value(i64 %shr4, !5110, !DIExpression(), !5109)
  %and3 = lshr i64 %0, 3, !dbg !5116
  %shr5 = and i64 %and3, 1229782938247303441, !dbg !5116
    #dbg_value(i64 %shr5, !5108, !DIExpression(), !5109)
  %sub = mul nuw i64 %and, 15, !dbg !5117
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %skey, i32 %v.0, !dbg !5118
  store i64 %sub, ptr %arrayidx8, align 8, !dbg !5119
  %sub10 = mul nuw i64 %shr, 15, !dbg !5120
  %add11 = or disjoint i32 %v.0, 1, !dbg !5121
  %arrayidx12 = getelementptr inbounds nuw i64, ptr %skey, i32 %add11, !dbg !5122
  store i64 %sub10, ptr %arrayidx12, align 8, !dbg !5123
  %sub14 = mul nuw i64 %shr4, 15, !dbg !5124
  %add15 = or disjoint i32 %v.0, 2, !dbg !5125
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %skey, i32 %add15, !dbg !5126
  store i64 %sub14, ptr %arrayidx16, align 8, !dbg !5127
  %sub18 = mul nuw i64 %shr5, 15, !dbg !5128
  %add19 = or disjoint i32 %v.0, 3, !dbg !5129
  %arrayidx20 = getelementptr inbounds nuw i64, ptr %skey, i32 %add19, !dbg !5130
  store i64 %sub18, ptr %arrayidx20, align 8, !dbg !5131
  %inc = add nuw nsw i32 %u.0, 1, !dbg !5132
    #dbg_value(i32 %inc, !5098, !DIExpression(), !5093)
  %add21 = add nuw nsw i32 %v.0, 4, !dbg !5133
    #dbg_value(i32 %add21, !5099, !DIExpression(), !5093)
  br label %for.cond, !dbg !5134, !llvm.loop !5135

for.end:                                          ; preds = %for.cond
  ret void, !dbg !5137
}

; Function Attrs: nounwind
define internal fastcc void @br_range_dec32le(ptr noundef nonnull %v, i32 noundef range(i32 3, 17) %num, ptr noundef %src) unnamed_addr #0 !dbg !5138 {
entry:
    #dbg_value(ptr %v, !5142, !DIExpression(), !5143)
    #dbg_value(i32 %num, !5144, !DIExpression(), !5143)
    #dbg_value(ptr %src, !5145, !DIExpression(), !5143)
  br label %while.cond, !dbg !5146

while.cond:                                       ; preds = %while.body, %entry
  %src.addr.0 = phi ptr [ %src, %entry ], [ %add.ptr, %while.body ]
  %num.addr.0 = phi i32 [ %num, %entry ], [ %dec, %while.body ]
  %v.addr.0 = phi ptr [ %v, %entry ], [ %incdec.ptr, %while.body ]
    #dbg_value(ptr %v.addr.0, !5142, !DIExpression(), !5143)
    #dbg_value(i32 %num.addr.0, !5144, !DIExpression(), !5143)
    #dbg_value(ptr %src.addr.0, !5145, !DIExpression(), !5143)
    #dbg_value(i32 %num.addr.0, !5144, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !5143)
  %cmp.not = icmp eq i32 %num.addr.0, 0, !dbg !5147
  br i1 %cmp.not, label %while.end, label %while.body, !dbg !5146

while.body:                                       ; preds = %while.cond
  %dec = add nsw i32 %num.addr.0, -1, !dbg !5148
    #dbg_value(i32 %dec, !5144, !DIExpression(), !5143)
  %call = call fastcc i32 @br_dec32le(ptr noundef %src.addr.0) #4, !dbg !5149
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %v.addr.0, i32 4, !dbg !5151
    #dbg_value(ptr %incdec.ptr, !5142, !DIExpression(), !5143)
  store i32 %call, ptr %v.addr.0, align 4, !dbg !5152
  %add.ptr = getelementptr inbounds nuw i8, ptr %src.addr.0, i32 4, !dbg !5153
    #dbg_value(ptr %add.ptr, !5145, !DIExpression(), !5143)
  br label %while.cond, !dbg !5146, !llvm.loop !5154

while.end:                                        ; preds = %while.cond
  ret void, !dbg !5156
}

; Function Attrs: nounwind
define internal fastcc i32 @sub_word(i32 noundef %x) unnamed_addr #0 !dbg !5157 {
entry:
  %q = alloca [8 x i64], align 8
    #dbg_value(i32 %x, !5160, !DIExpression(), !5161)
    #dbg_declare(ptr %q, !5162, !DIExpression(), !5163)
  %call = call ptr @memset(ptr noundef nonnull %q, i32 noundef 0, i32 noundef 64) #6, !dbg !5164
  %conv = zext i32 %x to i64, !dbg !5165
  store i64 %conv, ptr %q, align 8, !dbg !5166
  call fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) #4, !dbg !5167
  call fastcc void @br_aes_ct64_bitslice_Sbox(ptr noundef nonnull %q) #4, !dbg !5168
  call fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) #4, !dbg !5169
  %0 = load i64, ptr %q, align 8, !dbg !5170
  %conv5 = trunc i64 %0 to i32, !dbg !5171
  ret i32 %conv5, !dbg !5172
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_interleave_in(ptr noundef nonnull %q0, ptr noundef nonnull %q1, ptr noundef nonnull %w) unnamed_addr #0 !dbg !5173 {
entry:
    #dbg_value(ptr %q0, !5178, !DIExpression(), !5179)
    #dbg_value(ptr %q1, !5180, !DIExpression(), !5179)
    #dbg_value(ptr %w, !5181, !DIExpression(), !5179)
  %0 = load i32, ptr %w, align 4, !dbg !5182
  %conv = zext i32 %0 to i64, !dbg !5182
    #dbg_value(i64 %conv, !5183, !DIExpression(), !5179)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %w, i32 4, !dbg !5184
  %1 = load i32, ptr %arrayidx1, align 4, !dbg !5184
  %conv2 = zext i32 %1 to i64, !dbg !5184
    #dbg_value(i64 %conv2, !5185, !DIExpression(), !5179)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %w, i32 8, !dbg !5186
  %2 = load i32, ptr %arrayidx3, align 4, !dbg !5186
  %conv4 = zext i32 %2 to i64, !dbg !5186
    #dbg_value(i64 %conv4, !5187, !DIExpression(), !5179)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %w, i32 12, !dbg !5188
  %3 = load i32, ptr %arrayidx5, align 4, !dbg !5188
  %conv6 = zext i32 %3 to i64, !dbg !5188
    #dbg_value(i64 %conv6, !5189, !DIExpression(), !5179)
  %shl = shl nuw nsw i64 %conv, 16, !dbg !5190
  %or = or i64 %shl, %conv, !dbg !5191
    #dbg_value(i64 %or, !5183, !DIExpression(), !5179)
  %shl7 = shl nuw nsw i64 %conv2, 16, !dbg !5192
  %or8 = or i64 %shl7, %conv2, !dbg !5193
    #dbg_value(i64 %or8, !5185, !DIExpression(), !5179)
  %shl9 = shl nuw nsw i64 %conv4, 16, !dbg !5194
  %or10 = or i64 %shl9, %conv4, !dbg !5195
    #dbg_value(i64 %or10, !5187, !DIExpression(), !5179)
  %shl11 = shl nuw nsw i64 %conv6, 16, !dbg !5196
  %or12 = or i64 %shl11, %conv6, !dbg !5197
    #dbg_value(i64 %or12, !5189, !DIExpression(), !5179)
  %and = and i64 %or, 281470681808895, !dbg !5198
    #dbg_value(i64 %and, !5183, !DIExpression(), !5179)
  %and13 = and i64 %or8, 281470681808895, !dbg !5199
    #dbg_value(i64 %and13, !5185, !DIExpression(), !5179)
  %and14 = and i64 %or10, 281470681808895, !dbg !5200
    #dbg_value(i64 %and14, !5187, !DIExpression(), !5179)
  %and15 = and i64 %or12, 281470681808895, !dbg !5201
    #dbg_value(i64 %and15, !5189, !DIExpression(), !5179)
  %shl16 = shl nuw nsw i64 %and, 8, !dbg !5202
  %or17 = or i64 %and, %shl16, !dbg !5203
    #dbg_value(i64 %or17, !5183, !DIExpression(), !5179)
  %shl18 = shl nuw nsw i64 %and13, 8, !dbg !5204
  %or19 = or i64 %and13, %shl18, !dbg !5205
    #dbg_value(i64 %or19, !5185, !DIExpression(), !5179)
    #dbg_value(!DIArgList(i64 %and14, i64 %and14), !5187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !5179)
    #dbg_value(!DIArgList(i64 %and15, i64 %and15), !5189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !5179)
  %and24 = and i64 %or17, 71777214294589695, !dbg !5206
    #dbg_value(i64 %and24, !5183, !DIExpression(), !5179)
  %and25 = and i64 %or19, 71777214294589695, !dbg !5207
    #dbg_value(i64 %and25, !5185, !DIExpression(), !5179)
    #dbg_value(!DIArgList(i64 %and14, i64 %and14), !5187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_shl, DW_OP_or, DW_OP_constu, 71777214294589695, DW_OP_and, DW_OP_stack_value), !5179)
    #dbg_value(!DIArgList(i64 %and15, i64 %and15), !5189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_shl, DW_OP_or, DW_OP_constu, 71777214294589695, DW_OP_and, DW_OP_stack_value), !5179)
  %4 = shl nuw i64 %and14, 16, !dbg !5208
  %5 = shl nuw nsw i64 %and14, 8, !dbg !5208
  %and26 = or i64 %4, %5, !dbg !5208
  %shl28 = and i64 %and26, -71777214294589696, !dbg !5208
  %or29 = or disjoint i64 %and24, %shl28, !dbg !5209
  store i64 %or29, ptr %q0, align 8, !dbg !5210
  %6 = shl nuw i64 %and15, 16, !dbg !5211
  %7 = shl nuw nsw i64 %and15, 8, !dbg !5211
  %and27 = or i64 %6, %7, !dbg !5211
  %shl30 = and i64 %and27, -71777214294589696, !dbg !5211
  %or31 = or disjoint i64 %and25, %shl30, !dbg !5212
  store i64 %or31, ptr %q1, align 8, !dbg !5213
  ret void, !dbg !5214
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) unnamed_addr #0 !dbg !5215 {
entry:
    #dbg_value(ptr %q, !5216, !DIExpression(), !5217)
  %0 = load i64, ptr %q, align 8, !dbg !5218
    #dbg_value(i64 %0, !5220, !DIExpression(), !5221)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5218
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !5218
    #dbg_value(i64 %1, !5222, !DIExpression(), !5221)
  %and = and i64 %0, 6148914691236517205, !dbg !5218
  %and2 = shl i64 %1, 1, !dbg !5218
  %shl = and i64 %and2, -6148914691236517206, !dbg !5218
  %or = or disjoint i64 %and, %shl, !dbg !5218
  store i64 %or, ptr %q, align 8, !dbg !5218
  %and4 = lshr i64 %0, 1, !dbg !5218
  %shr = and i64 %and4, 6148914691236517205, !dbg !5218
  %and5 = and i64 %1, -6148914691236517206, !dbg !5218
  %or6 = or disjoint i64 %shr, %and5, !dbg !5218
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5218
  store i64 %or6, ptr %arrayidx7, align 8, !dbg !5218
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5223
  %2 = load i64, ptr %arrayidx11, align 8, !dbg !5223
    #dbg_value(i64 %2, !5225, !DIExpression(), !5226)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5223
  %3 = load i64, ptr %arrayidx12, align 8, !dbg !5223
    #dbg_value(i64 %3, !5227, !DIExpression(), !5226)
  %and13 = and i64 %2, 6148914691236517205, !dbg !5223
  %and14 = shl i64 %3, 1, !dbg !5223
  %shl15 = and i64 %and14, -6148914691236517206, !dbg !5223
  %or16 = or disjoint i64 %and13, %shl15, !dbg !5223
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5223
  store i64 %or16, ptr %arrayidx17, align 8, !dbg !5223
  %and18 = lshr i64 %2, 1, !dbg !5223
  %shr19 = and i64 %and18, 6148914691236517205, !dbg !5223
  %and20 = and i64 %3, -6148914691236517206, !dbg !5223
  %or21 = or disjoint i64 %shr19, %and20, !dbg !5223
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5223
  store i64 %or21, ptr %arrayidx22, align 8, !dbg !5223
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5228
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !5228
    #dbg_value(i64 %4, !5230, !DIExpression(), !5231)
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5228
  %5 = load i64, ptr %arrayidx28, align 8, !dbg !5228
    #dbg_value(i64 %5, !5232, !DIExpression(), !5231)
  %and29 = and i64 %4, 6148914691236517205, !dbg !5228
  %and30 = shl i64 %5, 1, !dbg !5228
  %shl31 = and i64 %and30, -6148914691236517206, !dbg !5228
  %or32 = or disjoint i64 %and29, %shl31, !dbg !5228
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5228
  store i64 %or32, ptr %arrayidx33, align 8, !dbg !5228
  %and34 = lshr i64 %4, 1, !dbg !5228
  %shr35 = and i64 %and34, 6148914691236517205, !dbg !5228
  %and36 = and i64 %5, -6148914691236517206, !dbg !5228
  %or37 = or disjoint i64 %shr35, %and36, !dbg !5228
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5228
  store i64 %or37, ptr %arrayidx38, align 8, !dbg !5228
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5233
  %6 = load i64, ptr %arrayidx43, align 8, !dbg !5233
    #dbg_value(i64 %6, !5235, !DIExpression(), !5236)
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5233
  %7 = load i64, ptr %arrayidx44, align 8, !dbg !5233
    #dbg_value(i64 %7, !5237, !DIExpression(), !5236)
  %and45 = and i64 %6, 6148914691236517205, !dbg !5233
  %and46 = shl i64 %7, 1, !dbg !5233
  %shl47 = and i64 %and46, -6148914691236517206, !dbg !5233
  %or48 = or disjoint i64 %and45, %shl47, !dbg !5233
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5233
  store i64 %or48, ptr %arrayidx49, align 8, !dbg !5233
  %and50 = lshr i64 %6, 1, !dbg !5233
  %shr51 = and i64 %and50, 6148914691236517205, !dbg !5233
  %and52 = and i64 %7, -6148914691236517206, !dbg !5233
  %or53 = or disjoint i64 %shr51, %and52, !dbg !5233
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5233
  store i64 %or53, ptr %arrayidx54, align 8, !dbg !5233
  %8 = load i64, ptr %q, align 8, !dbg !5238
    #dbg_value(i64 %8, !5240, !DIExpression(), !5241)
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5238
  %9 = load i64, ptr %arrayidx60, align 8, !dbg !5238
    #dbg_value(i64 %9, !5242, !DIExpression(), !5241)
  %and61 = and i64 %8, 3689348814741910323, !dbg !5238
  %and62 = shl i64 %9, 2, !dbg !5238
  %shl63 = and i64 %and62, -3689348814741910324, !dbg !5238
  %or64 = or disjoint i64 %and61, %shl63, !dbg !5238
  store i64 %or64, ptr %q, align 8, !dbg !5238
  %and66 = lshr i64 %8, 2, !dbg !5238
  %shr67 = and i64 %and66, 3689348814741910323, !dbg !5238
  %and68 = and i64 %9, -3689348814741910324, !dbg !5238
  %or69 = or disjoint i64 %shr67, %and68, !dbg !5238
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5238
  store i64 %or69, ptr %arrayidx70, align 8, !dbg !5238
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5243
  %10 = load i64, ptr %arrayidx75, align 8, !dbg !5243
    #dbg_value(i64 %10, !5245, !DIExpression(), !5246)
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5243
  %11 = load i64, ptr %arrayidx76, align 8, !dbg !5243
    #dbg_value(i64 %11, !5247, !DIExpression(), !5246)
  %and77 = and i64 %10, 3689348814741910323, !dbg !5243
  %and78 = shl i64 %11, 2, !dbg !5243
  %shl79 = and i64 %and78, -3689348814741910324, !dbg !5243
  %or80 = or disjoint i64 %and77, %shl79, !dbg !5243
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5243
  store i64 %or80, ptr %arrayidx81, align 8, !dbg !5243
  %and82 = lshr i64 %10, 2, !dbg !5243
  %shr83 = and i64 %and82, 3689348814741910323, !dbg !5243
  %and84 = and i64 %11, -3689348814741910324, !dbg !5243
  %or85 = or disjoint i64 %shr83, %and84, !dbg !5243
  %arrayidx86 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5243
  store i64 %or85, ptr %arrayidx86, align 8, !dbg !5243
  %arrayidx91 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5248
  %12 = load i64, ptr %arrayidx91, align 8, !dbg !5248
    #dbg_value(i64 %12, !5250, !DIExpression(), !5251)
  %arrayidx92 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5248
  %13 = load i64, ptr %arrayidx92, align 8, !dbg !5248
    #dbg_value(i64 %13, !5252, !DIExpression(), !5251)
  %and93 = and i64 %12, 3689348814741910323, !dbg !5248
  %and94 = shl i64 %13, 2, !dbg !5248
  %shl95 = and i64 %and94, -3689348814741910324, !dbg !5248
  %or96 = or disjoint i64 %and93, %shl95, !dbg !5248
  %arrayidx97 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5248
  store i64 %or96, ptr %arrayidx97, align 8, !dbg !5248
  %and98 = lshr i64 %12, 2, !dbg !5248
  %shr99 = and i64 %and98, 3689348814741910323, !dbg !5248
  %and100 = and i64 %13, -3689348814741910324, !dbg !5248
  %or101 = or disjoint i64 %shr99, %and100, !dbg !5248
  %arrayidx102 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5248
  store i64 %or101, ptr %arrayidx102, align 8, !dbg !5248
  %arrayidx107 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5253
  %14 = load i64, ptr %arrayidx107, align 8, !dbg !5253
    #dbg_value(i64 %14, !5255, !DIExpression(), !5256)
  %arrayidx108 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5253
  %15 = load i64, ptr %arrayidx108, align 8, !dbg !5253
    #dbg_value(i64 %15, !5257, !DIExpression(), !5256)
  %and109 = and i64 %14, 3689348814741910323, !dbg !5253
  %and110 = shl i64 %15, 2, !dbg !5253
  %shl111 = and i64 %and110, -3689348814741910324, !dbg !5253
  %or112 = or disjoint i64 %and109, %shl111, !dbg !5253
  %arrayidx113 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5253
  store i64 %or112, ptr %arrayidx113, align 8, !dbg !5253
  %and114 = lshr i64 %14, 2, !dbg !5253
  %shr115 = and i64 %and114, 3689348814741910323, !dbg !5253
  %and116 = and i64 %15, -3689348814741910324, !dbg !5253
  %or117 = or disjoint i64 %shr115, %and116, !dbg !5253
  %arrayidx118 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5253
  store i64 %or117, ptr %arrayidx118, align 8, !dbg !5253
  %16 = load i64, ptr %q, align 8, !dbg !5258
    #dbg_value(i64 %16, !5260, !DIExpression(), !5261)
  %arrayidx124 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5258
  %17 = load i64, ptr %arrayidx124, align 8, !dbg !5258
    #dbg_value(i64 %17, !5262, !DIExpression(), !5261)
  %and125 = and i64 %16, 1085102592571150095, !dbg !5258
  %and126 = shl i64 %17, 4, !dbg !5258
  %shl127 = and i64 %and126, -1085102592571150096, !dbg !5258
  %or128 = or disjoint i64 %and125, %shl127, !dbg !5258
  store i64 %or128, ptr %q, align 8, !dbg !5258
  %and130 = lshr i64 %16, 4, !dbg !5258
  %shr131 = and i64 %and130, 1085102592571150095, !dbg !5258
  %and132 = and i64 %17, -1085102592571150096, !dbg !5258
  %or133 = or disjoint i64 %shr131, %and132, !dbg !5258
  %arrayidx134 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5258
  store i64 %or133, ptr %arrayidx134, align 8, !dbg !5258
  %arrayidx139 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5263
  %18 = load i64, ptr %arrayidx139, align 8, !dbg !5263
    #dbg_value(i64 %18, !5265, !DIExpression(), !5266)
  %arrayidx140 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5263
  %19 = load i64, ptr %arrayidx140, align 8, !dbg !5263
    #dbg_value(i64 %19, !5267, !DIExpression(), !5266)
  %and141 = and i64 %18, 1085102592571150095, !dbg !5263
  %and142 = shl i64 %19, 4, !dbg !5263
  %shl143 = and i64 %and142, -1085102592571150096, !dbg !5263
  %or144 = or disjoint i64 %and141, %shl143, !dbg !5263
  %arrayidx145 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5263
  store i64 %or144, ptr %arrayidx145, align 8, !dbg !5263
  %and146 = lshr i64 %18, 4, !dbg !5263
  %shr147 = and i64 %and146, 1085102592571150095, !dbg !5263
  %and148 = and i64 %19, -1085102592571150096, !dbg !5263
  %or149 = or disjoint i64 %shr147, %and148, !dbg !5263
  %arrayidx150 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5263
  store i64 %or149, ptr %arrayidx150, align 8, !dbg !5263
  %arrayidx155 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5268
  %20 = load i64, ptr %arrayidx155, align 8, !dbg !5268
    #dbg_value(i64 %20, !5270, !DIExpression(), !5271)
  %arrayidx156 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5268
  %21 = load i64, ptr %arrayidx156, align 8, !dbg !5268
    #dbg_value(i64 %21, !5272, !DIExpression(), !5271)
  %and157 = and i64 %20, 1085102592571150095, !dbg !5268
  %and158 = shl i64 %21, 4, !dbg !5268
  %shl159 = and i64 %and158, -1085102592571150096, !dbg !5268
  %or160 = or disjoint i64 %and157, %shl159, !dbg !5268
  %arrayidx161 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5268
  store i64 %or160, ptr %arrayidx161, align 8, !dbg !5268
  %and162 = lshr i64 %20, 4, !dbg !5268
  %shr163 = and i64 %and162, 1085102592571150095, !dbg !5268
  %and164 = and i64 %21, -1085102592571150096, !dbg !5268
  %or165 = or disjoint i64 %shr163, %and164, !dbg !5268
  %arrayidx166 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5268
  store i64 %or165, ptr %arrayidx166, align 8, !dbg !5268
  %arrayidx171 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5273
  %22 = load i64, ptr %arrayidx171, align 8, !dbg !5273
    #dbg_value(i64 %22, !5275, !DIExpression(), !5276)
  %arrayidx172 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5273
  %23 = load i64, ptr %arrayidx172, align 8, !dbg !5273
    #dbg_value(i64 %23, !5277, !DIExpression(), !5276)
  %and173 = and i64 %22, 1085102592571150095, !dbg !5273
  %and174 = shl i64 %23, 4, !dbg !5273
  %shl175 = and i64 %and174, -1085102592571150096, !dbg !5273
  %or176 = or disjoint i64 %and173, %shl175, !dbg !5273
  %arrayidx177 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5273
  store i64 %or176, ptr %arrayidx177, align 8, !dbg !5273
  %and178 = lshr i64 %22, 4, !dbg !5273
  %shr179 = and i64 %and178, 1085102592571150095, !dbg !5273
  %and180 = and i64 %23, -1085102592571150096, !dbg !5273
  %or181 = or disjoint i64 %shr179, %and180, !dbg !5273
  %arrayidx182 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5273
  store i64 %or181, ptr %arrayidx182, align 8, !dbg !5273
  ret void, !dbg !5278
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_bitslice_Sbox(ptr noundef nonnull %q) unnamed_addr #0 !dbg !5279 {
entry:
    #dbg_value(ptr %q, !5280, !DIExpression(), !5281)
  %arrayidx = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5282
  %0 = load i64, ptr %arrayidx, align 8, !dbg !5282
    #dbg_value(i64 %0, !5283, !DIExpression(), !5281)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5284
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !5284
    #dbg_value(i64 %1, !5285, !DIExpression(), !5281)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5286
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !5286
    #dbg_value(i64 %2, !5287, !DIExpression(), !5281)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5288
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !5288
    #dbg_value(i64 %3, !5289, !DIExpression(), !5281)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5290
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !5290
    #dbg_value(i64 %4, !5291, !DIExpression(), !5281)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5292
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !5292
    #dbg_value(i64 %5, !5293, !DIExpression(), !5281)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5294
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !5294
    #dbg_value(i64 %6, !5295, !DIExpression(), !5281)
  %7 = load i64, ptr %q, align 8, !dbg !5296
    #dbg_value(i64 %7, !5297, !DIExpression(), !5281)
  %xor = xor i64 %3, %5, !dbg !5298
    #dbg_value(i64 %xor, !5299, !DIExpression(), !5281)
  %xor8 = xor i64 %0, %6, !dbg !5300
    #dbg_value(i64 %xor8, !5301, !DIExpression(), !5281)
  %xor9 = xor i64 %0, %3, !dbg !5302
    #dbg_value(i64 %xor9, !5303, !DIExpression(), !5281)
  %xor10 = xor i64 %0, %5, !dbg !5304
    #dbg_value(i64 %xor10, !5305, !DIExpression(), !5281)
  %xor11 = xor i64 %1, %2, !dbg !5306
    #dbg_value(i64 %xor11, !5307, !DIExpression(), !5281)
  %xor12 = xor i64 %xor11, %7, !dbg !5308
    #dbg_value(i64 %xor12, !5309, !DIExpression(), !5281)
  %xor13 = xor i64 %xor12, %3, !dbg !5310
    #dbg_value(i64 %xor13, !5311, !DIExpression(), !5281)
  %xor14 = xor i64 %xor8, %xor, !dbg !5312
    #dbg_value(i64 %xor14, !5313, !DIExpression(), !5281)
  %xor15 = xor i64 %xor12, %0, !dbg !5314
    #dbg_value(i64 %xor15, !5315, !DIExpression(), !5281)
  %xor16 = xor i64 %xor12, %6, !dbg !5316
    #dbg_value(i64 %xor16, !5317, !DIExpression(), !5281)
  %xor17 = xor i64 %xor16, %xor10, !dbg !5318
    #dbg_value(i64 %xor17, !5319, !DIExpression(), !5281)
  %xor18 = xor i64 %4, %xor14, !dbg !5320
    #dbg_value(i64 %xor18, !5321, !DIExpression(), !5281)
  %xor19 = xor i64 %xor18, %5, !dbg !5322
    #dbg_value(i64 %xor19, !5323, !DIExpression(), !5281)
  %xor20 = xor i64 %xor18, %1, !dbg !5324
    #dbg_value(i64 %xor20, !5325, !DIExpression(), !5281)
  %xor21 = xor i64 %xor19, %7, !dbg !5326
    #dbg_value(i64 %xor21, !5327, !DIExpression(), !5281)
  %xor22 = xor i64 %xor19, %xor11, !dbg !5328
    #dbg_value(i64 %xor22, !5329, !DIExpression(), !5281)
  %xor23 = xor i64 %xor20, %xor9, !dbg !5330
    #dbg_value(i64 %xor23, !5331, !DIExpression(), !5281)
  %xor24 = xor i64 %7, %xor23, !dbg !5332
    #dbg_value(i64 %xor24, !5333, !DIExpression(), !5281)
  %xor25 = xor i64 %xor22, %xor23, !dbg !5334
    #dbg_value(i64 %xor25, !5335, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %xor22, i64 %xor10), !5336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %xor27 = xor i64 %xor11, %xor23, !dbg !5337
    #dbg_value(i64 %xor27, !5338, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %xor8, i64 %xor27), !5339, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
    #dbg_value(!DIArgList(i64 %0, i64 %xor27), !5340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %and = and i64 %xor14, %xor19, !dbg !5341
    #dbg_value(i64 %and, !5342, !DIExpression(), !5281)
  %and30 = and i64 %xor17, %xor21, !dbg !5343
    #dbg_value(i64 %and30, !5344, !DIExpression(), !5281)
  %xor31 = xor i64 %and30, %and, !dbg !5345
    #dbg_value(i64 %xor31, !5346, !DIExpression(), !5281)
  %and32 = and i64 %xor13, %7, !dbg !5347
    #dbg_value(i64 %and32, !5348, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %and32, i64 %and), !5349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %and34 = and i64 %xor8, %xor27, !dbg !5350
    #dbg_value(i64 %and34, !5351, !DIExpression(), !5281)
  %and35 = and i64 %xor16, %xor12, !dbg !5352
    #dbg_value(i64 %and35, !5353, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %and35, i64 %and34), !5354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %and37 = and i64 %xor15, %xor24, !dbg !5355
    #dbg_value(i64 %and37, !5356, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %and37, i64 %and34), !5357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %and39 = and i64 %xor9, %xor23, !dbg !5358
    #dbg_value(i64 %and39, !5359, !DIExpression(), !5281)
  %and40 = and i64 %xor, %xor25, !dbg !5360
    #dbg_value(i64 %and40, !5361, !DIExpression(), !5281)
  %xor41 = xor i64 %and40, %and39, !dbg !5362
    #dbg_value(i64 %xor41, !5363, !DIExpression(), !5281)
  %and42 = and i64 %xor10, %xor22, !dbg !5364
    #dbg_value(i64 %and42, !5365, !DIExpression(), !5281)
  %xor43 = xor i64 %and42, %and39, !dbg !5366
    #dbg_value(i64 %xor43, !5367, !DIExpression(), !5281)
  %xor44 = xor i64 %xor31, %xor41, !dbg !5368
    #dbg_value(i64 %xor44, !5369, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %and32, i64 %xor43, i64 %and), !5370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
    #dbg_value(!DIArgList(i64 %and35, i64 %xor41, i64 %and34), !5371, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
    #dbg_value(!DIArgList(i64 %and37, i64 %xor43, i64 %and34), !5372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %xor48 = xor i64 %xor44, %xor20, !dbg !5373
    #dbg_value(i64 %xor48, !5374, !DIExpression(), !5281)
  %8 = xor i64 %xor10, %and32, !dbg !5375
  %9 = xor i64 %8, %xor22, !dbg !5375
  %10 = xor i64 %9, %and, !dbg !5375
  %xor49 = xor i64 %10, %xor43, !dbg !5375
    #dbg_value(i64 %xor49, !5376, !DIExpression(), !5281)
  %11 = xor i64 %xor27, %and35, !dbg !5377
  %12 = xor i64 %11, %xor8, !dbg !5377
  %13 = xor i64 %12, %and34, !dbg !5377
  %xor50 = xor i64 %13, %xor41, !dbg !5377
    #dbg_value(i64 %xor50, !5378, !DIExpression(), !5281)
  %14 = xor i64 %xor27, %and37, !dbg !5379
  %15 = xor i64 %14, %0, !dbg !5379
  %16 = xor i64 %15, %and34, !dbg !5379
  %xor51 = xor i64 %16, %xor43, !dbg !5379
    #dbg_value(i64 %xor51, !5380, !DIExpression(), !5281)
  %xor52 = xor i64 %xor48, %xor49, !dbg !5381
    #dbg_value(i64 %xor52, !5382, !DIExpression(), !5281)
  %and53 = and i64 %xor48, %xor50, !dbg !5383
    #dbg_value(i64 %and53, !5384, !DIExpression(), !5281)
  %xor54 = xor i64 %xor51, %and53, !dbg !5385
    #dbg_value(i64 %xor54, !5386, !DIExpression(), !5281)
  %and55 = and i64 %xor52, %xor54, !dbg !5387
    #dbg_value(i64 %and55, !5388, !DIExpression(), !5281)
  %xor56 = xor i64 %and55, %xor49, !dbg !5389
    #dbg_value(i64 %xor56, !5390, !DIExpression(), !5281)
  %xor57 = xor i64 %xor50, %xor51, !dbg !5391
    #dbg_value(i64 %xor57, !5392, !DIExpression(), !5281)
  %xor58 = xor i64 %xor49, %and53, !dbg !5393
    #dbg_value(i64 %xor58, !5394, !DIExpression(), !5281)
  %and59 = and i64 %xor58, %xor57, !dbg !5395
    #dbg_value(i64 %and59, !5396, !DIExpression(), !5281)
  %xor60 = xor i64 %and59, %xor51, !dbg !5397
    #dbg_value(i64 %xor60, !5398, !DIExpression(), !5281)
  %xor61 = xor i64 %xor50, %xor60, !dbg !5399
    #dbg_value(i64 %xor61, !5400, !DIExpression(), !5281)
  %xor62 = xor i64 %and59, %and53, !dbg !5401
    #dbg_value(i64 %xor62, !5402, !DIExpression(), !5281)
  %and63 = and i64 %xor51, %xor62, !dbg !5403
    #dbg_value(i64 %and63, !5404, !DIExpression(), !5281)
  %xor64 = xor i64 %and63, %xor61, !dbg !5405
    #dbg_value(i64 %xor64, !5406, !DIExpression(), !5281)
  %xor65 = xor i64 %xor54, %and63, !dbg !5407
    #dbg_value(i64 %xor65, !5408, !DIExpression(), !5281)
  %and66 = and i64 %xor56, %xor65, !dbg !5409
    #dbg_value(i64 %and66, !5410, !DIExpression(), !5281)
  %xor67 = xor i64 %xor52, %and66, !dbg !5411
    #dbg_value(i64 %xor67, !5412, !DIExpression(), !5281)
  %xor68 = xor i64 %xor67, %xor64, !dbg !5413
    #dbg_value(i64 %xor68, !5414, !DIExpression(), !5281)
  %xor69 = xor i64 %xor56, %xor60, !dbg !5415
    #dbg_value(i64 %xor69, !5416, !DIExpression(), !5281)
  %xor70 = xor i64 %xor56, %xor67, !dbg !5417
    #dbg_value(i64 %xor70, !5418, !DIExpression(), !5281)
  %xor71 = xor i64 %and63, %xor50, !dbg !5419
    #dbg_value(i64 %xor71, !5420, !DIExpression(), !5281)
  %xor72 = xor i64 %xor69, %xor68, !dbg !5421
    #dbg_value(i64 %xor72, !5422, !DIExpression(), !5281)
  %and73 = and i64 %xor71, %xor19, !dbg !5423
    #dbg_value(i64 %and73, !5424, !DIExpression(), !5281)
  %and74 = and i64 %xor64, %xor21, !dbg !5425
    #dbg_value(i64 %and74, !5426, !DIExpression(), !5281)
  %and75 = and i64 %xor60, %7, !dbg !5427
    #dbg_value(i64 %and75, !5428, !DIExpression(), !5281)
  %and76 = and i64 %xor70, %xor27, !dbg !5429
    #dbg_value(i64 %and76, !5430, !DIExpression(), !5281)
  %and77 = and i64 %xor67, %xor12, !dbg !5431
    #dbg_value(i64 %and77, !5432, !DIExpression(), !5281)
  %and78 = and i64 %xor56, %xor24, !dbg !5433
    #dbg_value(i64 %and78, !5434, !DIExpression(), !5281)
  %and79 = and i64 %xor69, %xor23, !dbg !5435
    #dbg_value(i64 %and79, !5436, !DIExpression(), !5281)
  %and80 = and i64 %xor72, %xor25, !dbg !5437
    #dbg_value(i64 %and80, !5438, !DIExpression(), !5281)
  %and81 = and i64 %xor68, %xor22, !dbg !5439
    #dbg_value(i64 %and81, !5440, !DIExpression(), !5281)
  %and82 = and i64 %xor71, %xor14, !dbg !5441
    #dbg_value(i64 %and82, !5442, !DIExpression(), !5281)
  %and83 = and i64 %xor64, %xor17, !dbg !5443
    #dbg_value(i64 %and83, !5444, !DIExpression(), !5281)
  %and84 = and i64 %xor60, %xor13, !dbg !5445
    #dbg_value(i64 %and84, !5446, !DIExpression(), !5281)
  %and85 = and i64 %xor70, %xor8, !dbg !5447
    #dbg_value(i64 %and85, !5448, !DIExpression(), !5281)
  %and86 = and i64 %xor67, %xor16, !dbg !5449
    #dbg_value(i64 %and86, !5450, !DIExpression(), !5281)
  %and87 = and i64 %xor56, %xor15, !dbg !5451
    #dbg_value(i64 %and87, !5452, !DIExpression(), !5281)
  %and88 = and i64 %xor69, %xor9, !dbg !5453
    #dbg_value(i64 %and88, !5454, !DIExpression(), !5281)
  %and89 = and i64 %xor72, %xor, !dbg !5455
    #dbg_value(i64 %and89, !5456, !DIExpression(), !5281)
  %and90 = and i64 %xor68, %xor10, !dbg !5457
    #dbg_value(i64 %and90, !5458, !DIExpression(), !5281)
  %xor91 = xor i64 %and88, %and89, !dbg !5459
    #dbg_value(i64 %xor91, !5460, !DIExpression(), !5281)
  %xor92 = xor i64 %and83, %and84, !dbg !5461
    #dbg_value(i64 %xor92, !5462, !DIExpression(), !5281)
  %xor93 = xor i64 %and78, %and86, !dbg !5463
    #dbg_value(i64 %xor93, !5464, !DIExpression(), !5281)
  %xor94 = xor i64 %and82, %and83, !dbg !5465
    #dbg_value(i64 %xor94, !5466, !DIExpression(), !5281)
  %xor95 = xor i64 %and75, %and85, !dbg !5467
    #dbg_value(i64 %xor95, !5468, !DIExpression(), !5281)
  %xor96 = xor i64 %and75, %and78, !dbg !5469
    #dbg_value(i64 %xor96, !5470, !DIExpression(), !5281)
  %xor97 = xor i64 %and80, %and81, !dbg !5471
    #dbg_value(i64 %xor97, !5472, !DIExpression(), !5281)
  %xor98 = xor i64 %and73, %and76, !dbg !5473
    #dbg_value(i64 %xor98, !5474, !DIExpression(), !5281)
  %xor99 = xor i64 %and79, %and80, !dbg !5475
    #dbg_value(i64 %xor99, !5476, !DIExpression(), !5281)
  %xor100 = xor i64 %and89, %and90, !dbg !5477
    #dbg_value(i64 %xor100, !5478, !DIExpression(), !5281)
  %xor101 = xor i64 %and85, %xor93, !dbg !5479
    #dbg_value(i64 %xor101, !5480, !DIExpression(), !5281)
  %xor102 = xor i64 %xor95, %xor98, !dbg !5481
    #dbg_value(i64 %xor102, !5482, !DIExpression(), !5281)
  %xor103 = xor i64 %and77, %xor91, !dbg !5483
    #dbg_value(i64 %xor103, !5484, !DIExpression(), !5281)
  %xor104 = xor i64 %and76, %xor99, !dbg !5485
    #dbg_value(i64 %xor104, !5486, !DIExpression(), !5281)
  %xor105 = xor i64 %xor91, %xor102, !dbg !5487
    #dbg_value(i64 %xor105, !5488, !DIExpression(), !5281)
  %xor106 = xor i64 %and87, %xor102, !dbg !5489
    #dbg_value(i64 %xor106, !5490, !DIExpression(), !5281)
  %xor107 = xor i64 %xor97, %xor103, !dbg !5491
    #dbg_value(i64 %xor107, !5492, !DIExpression(), !5281)
  %xor108 = xor i64 %xor94, %xor103, !dbg !5493
    #dbg_value(i64 %xor108, !5494, !DIExpression(), !5281)
  %xor109 = xor i64 %and77, %xor104, !dbg !5495
    #dbg_value(i64 %xor109, !5496, !DIExpression(), !5281)
  %xor110 = xor i64 %xor106, %xor107, !dbg !5497
    #dbg_value(i64 %xor110, !5498, !DIExpression(), !5281)
  %xor111 = xor i64 %and74, %xor108, !dbg !5499
    #dbg_value(i64 %xor111, !5500, !DIExpression(), !5281)
  %xor112 = xor i64 %xor104, %xor108, !dbg !5501
    #dbg_value(i64 %xor112, !5502, !DIExpression(), !5281)
  %17 = xor i64 %xor107, %xor101, !dbg !5503
  %xor113 = xor i64 %17, -1, !dbg !5503
    #dbg_value(i64 %xor113, !5504, !DIExpression(), !5281)
  %18 = xor i64 %xor105, %xor93, !dbg !5505
  %xor115 = xor i64 %18, -1, !dbg !5505
    #dbg_value(i64 %xor115, !5506, !DIExpression(), !5281)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor110), !5507, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !5281)
  %xor117 = xor i64 %xor98, %xor111, !dbg !5508
    #dbg_value(i64 %xor117, !5509, !DIExpression(), !5281)
  %xor118 = xor i64 %xor96, %xor111, !dbg !5510
    #dbg_value(i64 %xor118, !5511, !DIExpression(), !5281)
  %xor119 = xor i64 %xor92, %xor110, !dbg !5512
    #dbg_value(i64 %xor119, !5513, !DIExpression(), !5281)
  %19 = xor i64 %xor117, %xor109, !dbg !5514
  %xor121 = xor i64 %19, -1, !dbg !5514
    #dbg_value(i64 %xor121, !5515, !DIExpression(), !5281)
  %20 = xor i64 %xor110, %xor100, !dbg !5516
  %21 = xor i64 %20, %xor109, !dbg !5516
  %xor123 = xor i64 %21, -1, !dbg !5516
    #dbg_value(i64 %xor123, !5517, !DIExpression(), !5281)
  %arrayidx124 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5518
  store i64 %xor112, ptr %arrayidx124, align 8, !dbg !5519
  %arrayidx125 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5520
  store i64 %xor121, ptr %arrayidx125, align 8, !dbg !5521
  %arrayidx126 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5522
  store i64 %xor123, ptr %arrayidx126, align 8, !dbg !5523
  %arrayidx127 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5524
  store i64 %xor117, ptr %arrayidx127, align 8, !dbg !5525
  %arrayidx128 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5526
  store i64 %xor118, ptr %arrayidx128, align 8, !dbg !5527
  %arrayidx129 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5528
  store i64 %xor119, ptr %arrayidx129, align 8, !dbg !5529
  %arrayidx130 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5530
  store i64 %xor113, ptr %arrayidx130, align 8, !dbg !5531
  store i64 %xor115, ptr %q, align 8, !dbg !5532
  ret void, !dbg !5533
}

; Function Attrs: nounwind
define internal fastcc i32 @br_dec32le(ptr noundef %src) unnamed_addr #0 !dbg !5534 {
entry:
    #dbg_value(ptr %src, !5537, !DIExpression(), !5538)
  %0 = load i8, ptr %src, align 1, !dbg !5539
  %conv = zext i8 %0 to i32, !dbg !5540
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %src, i32 1, !dbg !5541
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !5541
  %conv2 = zext i8 %1 to i32, !dbg !5542
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !5543
  %or = or disjoint i32 %shl, %conv, !dbg !5544
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %src, i32 2, !dbg !5545
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !5545
  %conv4 = zext i8 %2 to i32, !dbg !5546
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !5547
  %or6 = or disjoint i32 %or, %shl5, !dbg !5548
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %src, i32 3, !dbg !5549
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !5549
  %conv8 = zext i8 %3 to i32, !dbg !5550
  %shl9 = shl nuw i32 %conv8, 24, !dbg !5551
  %or10 = or disjoint i32 %or6, %shl9, !dbg !5552
  ret i32 %or10, !dbg !5553
}

; Function Attrs: nounwind
define dso_local void @aes128_ctr_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !5554 {
entry:
    #dbg_value(ptr %r, !5555, !DIExpression(), !5556)
    #dbg_value(ptr %key, !5557, !DIExpression(), !5556)
  call void @aes128_ecb_keyexp(ptr noundef %r, ptr noundef %key) #4, !dbg !5558
  ret void, !dbg !5559
}

; Function Attrs: nounwind
define dso_local void @aes192_ecb_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !5560 {
entry:
  %skey = alloca [26 x i64], align 8
    #dbg_value(ptr %r, !5568, !DIExpression(), !5569)
    #dbg_value(ptr %key, !5570, !DIExpression(), !5569)
    #dbg_declare(ptr %skey, !5571, !DIExpression(), !5575)
  %call = call dereferenceable_or_null(832) ptr @malloc(i32 noundef 832) #7, !dbg !5576
  store ptr %call, ptr %r, align 4, !dbg !5577
  %cmp = icmp eq ptr %call, null, !dbg !5578
  br i1 %cmp, label %if.then, label %if.end, !dbg !5578

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !5580
  br label %if.end, !dbg !5582

if.end:                                           ; preds = %if.then, %entry
  call fastcc void @br_aes_ct64_keysched(ptr noundef nonnull %skey, ptr noundef %key, i32 noundef 24) #4, !dbg !5583
  %0 = load ptr, ptr %r, align 4, !dbg !5584
  call fastcc void @br_aes_ct64_skey_expand(ptr noundef %0, ptr noundef nonnull %skey, i32 noundef 12) #4, !dbg !5585
  ret void, !dbg !5586
}

; Function Attrs: nounwind
define dso_local void @aes192_ctr_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !5587 {
entry:
    #dbg_value(ptr %r, !5588, !DIExpression(), !5589)
    #dbg_value(ptr %key, !5590, !DIExpression(), !5589)
  call void @aes192_ecb_keyexp(ptr noundef %r, ptr noundef %key) #4, !dbg !5591
  ret void, !dbg !5592
}

; Function Attrs: nounwind
define dso_local void @aes256_ecb_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !5593 {
entry:
  %skey = alloca [30 x i64], align 8
    #dbg_value(ptr %r, !5601, !DIExpression(), !5602)
    #dbg_value(ptr %key, !5603, !DIExpression(), !5602)
    #dbg_declare(ptr %skey, !5604, !DIExpression(), !5608)
  %call = call dereferenceable_or_null(960) ptr @malloc(i32 noundef 960) #7, !dbg !5609
  store ptr %call, ptr %r, align 4, !dbg !5610
  %cmp = icmp eq ptr %call, null, !dbg !5611
  br i1 %cmp, label %if.then, label %if.end, !dbg !5611

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #6, !dbg !5613
  br label %if.end, !dbg !5615

if.end:                                           ; preds = %if.then, %entry
  call fastcc void @br_aes_ct64_keysched(ptr noundef nonnull %skey, ptr noundef %key, i32 noundef 32) #4, !dbg !5616
  %0 = load ptr, ptr %r, align 4, !dbg !5617
  call fastcc void @br_aes_ct64_skey_expand(ptr noundef %0, ptr noundef nonnull %skey, i32 noundef 14) #4, !dbg !5618
  ret void, !dbg !5619
}

; Function Attrs: nounwind
define dso_local void @aes256_ctr_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #0 !dbg !5620 {
entry:
    #dbg_value(ptr %r, !5621, !DIExpression(), !5622)
    #dbg_value(ptr %key, !5623, !DIExpression(), !5622)
  call void @aes256_ecb_keyexp(ptr noundef %r, ptr noundef %key) #4, !dbg !5624
  ret void, !dbg !5625
}

; Function Attrs: nounwind
define dso_local void @aes128_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %ctx) local_unnamed_addr #0 !dbg !5626 {
entry:
    #dbg_value(ptr %out, !5631, !DIExpression(), !5632)
    #dbg_value(ptr %in, !5633, !DIExpression(), !5632)
    #dbg_value(i32 %nblocks, !5634, !DIExpression(), !5632)
    #dbg_value(ptr %ctx, !5635, !DIExpression(), !5632)
  %0 = load ptr, ptr %ctx, align 4, !dbg !5636
  call fastcc void @aes_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %0, i32 noundef 10) #4, !dbg !5637
  ret void, !dbg !5638
}

; Function Attrs: nounwind
define internal fastcc void @aes_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %rkeys, i32 noundef range(i32 10, 15) %nrounds) unnamed_addr #0 !dbg !5639 {
entry:
  %blocks = alloca [16 x i32], align 4
  %t = alloca [64 x i8], align 1
    #dbg_value(ptr %out, !5642, !DIExpression(), !5643)
    #dbg_value(ptr %in, !5644, !DIExpression(), !5643)
    #dbg_value(i32 %nblocks, !5645, !DIExpression(), !5643)
    #dbg_value(ptr %rkeys, !5646, !DIExpression(), !5643)
    #dbg_value(i32 %nrounds, !5647, !DIExpression(), !5643)
    #dbg_declare(ptr %blocks, !5648, !DIExpression(), !5650)
    #dbg_declare(ptr %t, !5651, !DIExpression(), !5655)
  br label %while.cond, !dbg !5656

while.cond:                                       ; preds = %while.body, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %while.body ]
  %in.addr.0 = phi ptr [ %in, %entry ], [ %add.ptr, %while.body ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr2, %while.body ]
    #dbg_value(ptr %out.addr.0, !5642, !DIExpression(), !5643)
    #dbg_value(ptr %in.addr.0, !5644, !DIExpression(), !5643)
    #dbg_value(i32 %nblocks.addr.0, !5645, !DIExpression(), !5643)
  %cmp = icmp ugt i32 %nblocks.addr.0, 3, !dbg !5657
  br i1 %cmp, label %while.body, label %while.end, !dbg !5656

while.body:                                       ; preds = %while.cond
  call fastcc void @br_range_dec32le(ptr noundef nonnull %blocks, i32 noundef 16, ptr noundef %in.addr.0) #4, !dbg !5658
  call fastcc void @aes_ecb4x(ptr noundef %out.addr.0, ptr noundef nonnull %blocks, ptr noundef %rkeys, i32 noundef %nrounds) #4, !dbg !5660
  %sub = add i32 %nblocks.addr.0, -4, !dbg !5661
    #dbg_value(i32 %sub, !5645, !DIExpression(), !5643)
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 64, !dbg !5662
    #dbg_value(ptr %add.ptr, !5644, !DIExpression(), !5643)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 64, !dbg !5663
    #dbg_value(ptr %add.ptr2, !5642, !DIExpression(), !5643)
  br label %while.cond, !dbg !5656, !llvm.loop !5664

while.end:                                        ; preds = %while.cond
  %nblocks.addr.0.lcssa = phi i32 [ %nblocks.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %out.addr.0.lcssa = phi ptr [ %out.addr.0, %while.cond ]
  %tobool.not = icmp eq i32 %nblocks.addr.0.lcssa, 0, !dbg !5666
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !5666

if.then:                                          ; preds = %while.end
  %mul = shl nuw nsw i32 %nblocks.addr.0.lcssa, 2, !dbg !5668
  call fastcc void @br_range_dec32le(ptr noundef nonnull %blocks, i32 noundef %mul, ptr noundef %in.addr.0.lcssa) #4, !dbg !5670
  call fastcc void @aes_ecb4x(ptr noundef nonnull %t, ptr noundef nonnull %blocks, ptr noundef %rkeys, i32 noundef %nrounds) #4, !dbg !5671
  %mul7 = shl nuw nsw i32 %nblocks.addr.0.lcssa, 4, !dbg !5672
  %call = call ptr @memcpy(ptr noundef %out.addr.0.lcssa, ptr noundef nonnull %t, i32 noundef %mul7) #6, !dbg !5673
  br label %if.end, !dbg !5674

if.end:                                           ; preds = %if.then, %while.end
  ret void, !dbg !5675
}

; Function Attrs: nounwind
define internal fastcc void @aes_ecb4x(ptr noundef %out, ptr noundef nonnull %ivw, ptr noundef %sk_exp, i32 noundef range(i32 10, 15) %nrounds) unnamed_addr #0 !dbg !5676 {
entry:
  %w = alloca [16 x i32], align 4
  %q = alloca [8 x i64], align 8
    #dbg_value(ptr %out, !5679, !DIExpression(), !5680)
    #dbg_value(ptr %ivw, !5681, !DIExpression(), !5680)
    #dbg_value(ptr %sk_exp, !5682, !DIExpression(), !5680)
    #dbg_value(i32 %nrounds, !5683, !DIExpression(), !5680)
    #dbg_declare(ptr %w, !5684, !DIExpression(), !5685)
    #dbg_declare(ptr %q, !5686, !DIExpression(), !5687)
  %call = call ptr @memcpy(ptr noundef nonnull %w, ptr noundef nonnull %ivw, i32 noundef 64) #6, !dbg !5688
    #dbg_value(i32 0, !5689, !DIExpression(), !5680)
  br label %for.cond, !dbg !5690

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !5692
    #dbg_value(i32 %i.0, !5689, !DIExpression(), !5680)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !5693
  br i1 %exitcond, label %for.body, label %for.end, !dbg !5695

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [8 x i64], ptr %q, i32 0, i32 %i.0, !dbg !5696
  %add = or disjoint i32 %i.0, 4, !dbg !5698
  %arrayidx1 = getelementptr inbounds nuw [8 x i64], ptr %q, i32 0, i32 %add, !dbg !5699
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !5700
  %add.ptr = getelementptr inbounds nuw i8, ptr %w, i32 %add.ptr.idx, !dbg !5700
  call fastcc void @br_aes_ct64_interleave_in(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx1, ptr noundef nonnull %add.ptr) #4, !dbg !5701
  %inc = add nuw nsw i32 %i.0, 1, !dbg !5702
    #dbg_value(i32 %inc, !5689, !DIExpression(), !5680)
  br label %for.cond, !dbg !5703, !llvm.loop !5704

for.end:                                          ; preds = %for.cond
  call fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) #4, !dbg !5706
  call fastcc void @add_round_key(ptr noundef nonnull %q, ptr noundef %sk_exp) #4, !dbg !5707
    #dbg_value(i32 1, !5689, !DIExpression(), !5680)
  br label %for.cond5, !dbg !5708

for.cond5:                                        ; preds = %for.body7, %for.end
  %i.1 = phi i32 [ 1, %for.end ], [ %inc15, %for.body7 ], !dbg !5710
    #dbg_value(i32 %i.1, !5689, !DIExpression(), !5680)
  %exitcond1 = icmp ne i32 %i.1, %nrounds, !dbg !5711
  br i1 %exitcond1, label %for.body7, label %for.end16, !dbg !5713

for.body7:                                        ; preds = %for.cond5
  call fastcc void @br_aes_ct64_bitslice_Sbox(ptr noundef nonnull %q) #4, !dbg !5714
  call fastcc void @shift_rows(ptr noundef nonnull %q) #4, !dbg !5716
  call fastcc void @mix_columns(ptr noundef nonnull %q) #4, !dbg !5717
  %add.ptr13.idx = shl nuw nsw i32 %i.1, 6, !dbg !5718
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %sk_exp, i32 %add.ptr13.idx, !dbg !5718
  call fastcc void @add_round_key(ptr noundef nonnull %q, ptr noundef nonnull %add.ptr13) #4, !dbg !5719
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !5720
    #dbg_value(i32 %inc15, !5689, !DIExpression(), !5680)
  br label %for.cond5, !dbg !5721, !llvm.loop !5722

for.end16:                                        ; preds = %for.cond5
  call fastcc void @br_aes_ct64_bitslice_Sbox(ptr noundef nonnull %q) #4, !dbg !5724
  call fastcc void @shift_rows(ptr noundef nonnull %q) #4, !dbg !5725
  %add.ptr20.idx = shl nuw nsw i32 %nrounds, 6, !dbg !5726
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %sk_exp, i32 %add.ptr20.idx, !dbg !5726
  call fastcc void @add_round_key(ptr noundef nonnull %q, ptr noundef nonnull %add.ptr20) #4, !dbg !5727
  call fastcc void @br_aes_ct64_ortho(ptr noundef nonnull %q) #4, !dbg !5728
    #dbg_value(i32 0, !5689, !DIExpression(), !5680)
  br label %for.cond22, !dbg !5729

for.cond22:                                       ; preds = %for.body24, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc32, %for.body24 ], !dbg !5731
    #dbg_value(i32 %i.2, !5689, !DIExpression(), !5680)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !5732
  br i1 %exitcond2, label %for.body24, label %for.end33, !dbg !5734

for.body24:                                       ; preds = %for.cond22
  %add.ptr27.idx = shl nuw nsw i32 %i.2, 4, !dbg !5735
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %w, i32 %add.ptr27.idx, !dbg !5735
  %arrayidx28 = getelementptr inbounds nuw [8 x i64], ptr %q, i32 0, i32 %i.2, !dbg !5737
  %0 = load i64, ptr %arrayidx28, align 8, !dbg !5737
  %add29 = or disjoint i32 %i.2, 4, !dbg !5738
  %arrayidx30 = getelementptr inbounds nuw [8 x i64], ptr %q, i32 0, i32 %add29, !dbg !5739
  %1 = load i64, ptr %arrayidx30, align 8, !dbg !5739
  call fastcc void @br_aes_ct64_interleave_out(ptr noundef nonnull %add.ptr27, i64 noundef %0, i64 noundef %1) #4, !dbg !5740
  %inc32 = add nuw nsw i32 %i.2, 1, !dbg !5741
    #dbg_value(i32 %inc32, !5689, !DIExpression(), !5680)
  br label %for.cond22, !dbg !5742, !llvm.loop !5743

for.end33:                                        ; preds = %for.cond22
  call fastcc void @br_range_enc32le(ptr noundef %out, ptr noundef nonnull %w, i32 noundef 16) #4, !dbg !5745
  ret void, !dbg !5746
}

; Function Attrs: nounwind
define internal fastcc void @add_round_key(ptr noundef nonnull %q, ptr noundef %sk) unnamed_addr #0 !dbg !5747 {
entry:
    #dbg_value(ptr %q, !5750, !DIExpression(), !5751)
    #dbg_value(ptr %sk, !5752, !DIExpression(), !5751)
  %0 = load i64, ptr %sk, align 8, !dbg !5753
  %1 = load i64, ptr %q, align 8, !dbg !5754
  %xor = xor i64 %1, %0, !dbg !5754
  store i64 %xor, ptr %q, align 8, !dbg !5754
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %sk, i32 8, !dbg !5755
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !5755
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5756
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !5757
  %xor4 = xor i64 %3, %2, !dbg !5757
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !5757
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %sk, i32 16, !dbg !5758
  %4 = load i64, ptr %arrayidx5, align 8, !dbg !5758
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5759
  %5 = load i64, ptr %arrayidx6, align 8, !dbg !5760
  %xor7 = xor i64 %5, %4, !dbg !5760
  store i64 %xor7, ptr %arrayidx6, align 8, !dbg !5760
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %sk, i32 24, !dbg !5761
  %6 = load i64, ptr %arrayidx8, align 8, !dbg !5761
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5762
  %7 = load i64, ptr %arrayidx9, align 8, !dbg !5763
  %xor10 = xor i64 %7, %6, !dbg !5763
  store i64 %xor10, ptr %arrayidx9, align 8, !dbg !5763
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %sk, i32 32, !dbg !5764
  %8 = load i64, ptr %arrayidx11, align 8, !dbg !5764
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5765
  %9 = load i64, ptr %arrayidx12, align 8, !dbg !5766
  %xor13 = xor i64 %9, %8, !dbg !5766
  store i64 %xor13, ptr %arrayidx12, align 8, !dbg !5766
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %sk, i32 40, !dbg !5767
  %10 = load i64, ptr %arrayidx14, align 8, !dbg !5767
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5768
  %11 = load i64, ptr %arrayidx15, align 8, !dbg !5769
  %xor16 = xor i64 %11, %10, !dbg !5769
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !5769
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %sk, i32 48, !dbg !5770
  %12 = load i64, ptr %arrayidx17, align 8, !dbg !5770
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5771
  %13 = load i64, ptr %arrayidx18, align 8, !dbg !5772
  %xor19 = xor i64 %13, %12, !dbg !5772
  store i64 %xor19, ptr %arrayidx18, align 8, !dbg !5772
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %sk, i32 56, !dbg !5773
  %14 = load i64, ptr %arrayidx20, align 8, !dbg !5773
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5774
  %15 = load i64, ptr %arrayidx21, align 8, !dbg !5775
  %xor22 = xor i64 %15, %14, !dbg !5775
  store i64 %xor22, ptr %arrayidx21, align 8, !dbg !5775
  ret void, !dbg !5776
}

; Function Attrs: nounwind
define internal fastcc void @shift_rows(ptr noundef nonnull %q) unnamed_addr #0 !dbg !5777 {
entry:
    #dbg_value(ptr %q, !5778, !DIExpression(), !5779)
    #dbg_value(i32 0, !5780, !DIExpression(), !5779)
  br label %for.cond, !dbg !5781

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !5783
    #dbg_value(i32 %i.0, !5780, !DIExpression(), !5779)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !5784
  br i1 %exitcond, label %for.body, label %for.end, !dbg !5786

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %q, i32 %i.0, !dbg !5787
  %0 = load i64, ptr %arrayidx, align 8, !dbg !5787
    #dbg_value(i64 %0, !5789, !DIExpression(), !5790)
  %and = and i64 %0, 65535, !dbg !5791
  %and1 = lshr i64 %0, 4, !dbg !5792
  %shr = and i64 %and1, 268369920, !dbg !5792
  %or = or disjoint i64 %and, %shr, !dbg !5793
  %and2 = shl i64 %0, 12, !dbg !5794
  %shl = and i64 %and2, 4026531840, !dbg !5794
  %or3 = or disjoint i64 %or, %shl, !dbg !5795
  %and4 = lshr i64 %0, 8, !dbg !5796
  %shr5 = and i64 %and4, 1095216660480, !dbg !5796
  %or6 = or disjoint i64 %or3, %shr5, !dbg !5797
  %and7 = shl i64 %0, 8, !dbg !5798
  %shl8 = and i64 %and7, 280375465082880, !dbg !5798
  %or9 = or disjoint i64 %or6, %shl8, !dbg !5799
  %and10 = lshr i64 %0, 12, !dbg !5800
  %shr11 = and i64 %and10, 4222124650659840, !dbg !5800
  %or12 = or disjoint i64 %or9, %shr11, !dbg !5801
  %and13 = shl i64 %0, 4, !dbg !5802
  %shl14 = and i64 %and13, -4503599627370496, !dbg !5802
  %or15 = or i64 %or12, %shl14, !dbg !5803
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %q, i32 %i.0, !dbg !5804
  store i64 %or15, ptr %arrayidx16, align 8, !dbg !5805
  %inc = add nuw nsw i32 %i.0, 1, !dbg !5806
    #dbg_value(i32 %inc, !5780, !DIExpression(), !5779)
  br label %for.cond, !dbg !5807, !llvm.loop !5808

for.end:                                          ; preds = %for.cond
  ret void, !dbg !5810
}

; Function Attrs: nounwind
define internal fastcc void @mix_columns(ptr noundef nonnull %q) unnamed_addr #0 !dbg !5811 {
entry:
    #dbg_value(ptr %q, !5812, !DIExpression(), !5813)
  %0 = load i64, ptr %q, align 8, !dbg !5814
    #dbg_value(i64 %0, !5815, !DIExpression(), !5813)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5816
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !5816
    #dbg_value(i64 %1, !5817, !DIExpression(), !5813)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5818
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !5818
    #dbg_value(i64 %2, !5819, !DIExpression(), !5813)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5820
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !5820
    #dbg_value(i64 %3, !5821, !DIExpression(), !5813)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5822
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !5822
    #dbg_value(i64 %4, !5823, !DIExpression(), !5813)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5824
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !5824
    #dbg_value(i64 %5, !5825, !DIExpression(), !5813)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5826
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !5826
    #dbg_value(i64 %6, !5827, !DIExpression(), !5813)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5828
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !5828
    #dbg_value(i64 %7, !5829, !DIExpression(), !5813)
  %8 = shl i64 %0, 48, !dbg !5830
  %9 = lshr i64 %0, 16, !dbg !5830
  %10 = or i64 %8, %9, !dbg !5830
    #dbg_value(i64 %10, !5831, !DIExpression(), !5813)
  %11 = shl i64 %1, 48, !dbg !5832
  %12 = lshr i64 %1, 16, !dbg !5832
  %13 = or i64 %11, %12, !dbg !5832
    #dbg_value(i64 %13, !5833, !DIExpression(), !5813)
  %14 = shl i64 %2, 48, !dbg !5834
  %15 = lshr i64 %2, 16, !dbg !5834
  %16 = or i64 %14, %15, !dbg !5834
    #dbg_value(i64 %16, !5835, !DIExpression(), !5813)
  %17 = shl i64 %3, 48, !dbg !5836
  %18 = lshr i64 %3, 16, !dbg !5836
  %19 = or i64 %17, %18, !dbg !5836
    #dbg_value(i64 %19, !5837, !DIExpression(), !5813)
  %20 = shl i64 %4, 48, !dbg !5838
  %21 = lshr i64 %4, 16, !dbg !5838
  %22 = or i64 %20, %21, !dbg !5838
    #dbg_value(i64 %22, !5839, !DIExpression(), !5813)
  %23 = shl i64 %5, 48, !dbg !5840
  %24 = lshr i64 %5, 16, !dbg !5840
  %25 = or i64 %23, %24, !dbg !5840
    #dbg_value(i64 %25, !5841, !DIExpression(), !5813)
  %26 = shl i64 %6, 48, !dbg !5842
  %27 = lshr i64 %6, 16, !dbg !5842
  %28 = or i64 %26, %27, !dbg !5842
    #dbg_value(i64 %28, !5843, !DIExpression(), !5813)
  %29 = shl i64 %7, 48, !dbg !5844
  %30 = lshr i64 %7, 16, !dbg !5844
  %31 = or i64 %29, %30, !dbg !5844
    #dbg_value(i64 %31, !5845, !DIExpression(), !5813)
  %xor30 = xor i64 %0, %10, !dbg !5846
  %call = call fastcc i64 @rotr32(i64 noundef %xor30) #4, !dbg !5847
  %32 = xor i64 %31, %call, !dbg !5848
  %33 = xor i64 %32, %7, !dbg !5848
  %xor31 = xor i64 %33, %10, !dbg !5848
  store i64 %xor31, ptr %q, align 8, !dbg !5849
  %xor37 = xor i64 %1, %13, !dbg !5850
  %call38 = call fastcc i64 @rotr32(i64 noundef %xor37) #4, !dbg !5851
  %34 = xor i64 %10, %call38, !dbg !5852
  %35 = xor i64 %34, %0, !dbg !5852
  %36 = xor i64 %35, %7, !dbg !5852
  %37 = xor i64 %36, %31, !dbg !5852
  %xor39 = xor i64 %37, %13, !dbg !5852
  %arrayidx40 = getelementptr inbounds nuw i8, ptr %q, i32 8, !dbg !5853
  store i64 %xor39, ptr %arrayidx40, align 8, !dbg !5854
  %xor43 = xor i64 %2, %16, !dbg !5855
  %call44 = call fastcc i64 @rotr32(i64 noundef %xor43) #4, !dbg !5856
  %38 = xor i64 %13, %call44, !dbg !5857
  %39 = xor i64 %38, %1, !dbg !5857
  %xor45 = xor i64 %39, %16, !dbg !5857
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %q, i32 16, !dbg !5858
  store i64 %xor45, ptr %arrayidx46, align 8, !dbg !5859
  %xor51 = xor i64 %3, %19, !dbg !5860
  %call52 = call fastcc i64 @rotr32(i64 noundef %xor51) #4, !dbg !5861
  %40 = xor i64 %16, %call52, !dbg !5862
  %41 = xor i64 %40, %2, !dbg !5862
  %42 = xor i64 %41, %7, !dbg !5862
  %43 = xor i64 %42, %31, !dbg !5862
  %xor53 = xor i64 %43, %19, !dbg !5862
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %q, i32 24, !dbg !5863
  store i64 %xor53, ptr %arrayidx54, align 8, !dbg !5864
  %xor59 = xor i64 %4, %22, !dbg !5865
  %call60 = call fastcc i64 @rotr32(i64 noundef %xor59) #4, !dbg !5866
  %44 = xor i64 %19, %call60, !dbg !5867
  %45 = xor i64 %44, %3, !dbg !5867
  %46 = xor i64 %45, %7, !dbg !5867
  %47 = xor i64 %46, %31, !dbg !5867
  %xor61 = xor i64 %47, %22, !dbg !5867
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %q, i32 32, !dbg !5868
  store i64 %xor61, ptr %arrayidx62, align 8, !dbg !5869
  %xor65 = xor i64 %5, %25, !dbg !5870
  %call66 = call fastcc i64 @rotr32(i64 noundef %xor65) #4, !dbg !5871
  %48 = xor i64 %22, %call66, !dbg !5872
  %49 = xor i64 %48, %4, !dbg !5872
  %xor67 = xor i64 %49, %25, !dbg !5872
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %q, i32 40, !dbg !5873
  store i64 %xor67, ptr %arrayidx68, align 8, !dbg !5874
  %xor71 = xor i64 %6, %28, !dbg !5875
  %call72 = call fastcc i64 @rotr32(i64 noundef %xor71) #4, !dbg !5876
  %50 = xor i64 %25, %call72, !dbg !5877
  %51 = xor i64 %50, %5, !dbg !5877
  %xor73 = xor i64 %51, %28, !dbg !5877
  %arrayidx74 = getelementptr inbounds nuw i8, ptr %q, i32 48, !dbg !5878
  store i64 %xor73, ptr %arrayidx74, align 8, !dbg !5879
  %xor77 = xor i64 %7, %31, !dbg !5880
  %call78 = call fastcc i64 @rotr32(i64 noundef %xor77) #4, !dbg !5881
  %52 = xor i64 %28, %call78, !dbg !5882
  %53 = xor i64 %52, %6, !dbg !5882
  %xor79 = xor i64 %53, %31, !dbg !5882
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %q, i32 56, !dbg !5883
  store i64 %xor79, ptr %arrayidx80, align 8, !dbg !5884
  ret void, !dbg !5885
}

; Function Attrs: nounwind
define internal fastcc void @br_aes_ct64_interleave_out(ptr noundef nonnull %w, i64 noundef %q0, i64 noundef %q1) unnamed_addr #0 !dbg !5886 {
entry:
    #dbg_value(ptr %w, !5889, !DIExpression(), !5890)
    #dbg_value(i64 %q0, !5891, !DIExpression(), !5890)
    #dbg_value(i64 %q1, !5892, !DIExpression(), !5890)
  %and = and i64 %q0, 71777214294589695, !dbg !5893
    #dbg_value(i64 %and, !5894, !DIExpression(), !5890)
  %and1 = and i64 %q1, 71777214294589695, !dbg !5895
    #dbg_value(i64 %and1, !5896, !DIExpression(), !5890)
  %shr = lshr i64 %q0, 8, !dbg !5897
  %and2 = and i64 %shr, 71776119077928960, !dbg !5898
    #dbg_value(i64 %shr, !5899, !DIExpression(DW_OP_constu, 71777214294589440, DW_OP_and, DW_OP_stack_value), !5890)
  %shr3 = lshr i64 %q1, 8, !dbg !5900
  %and4 = and i64 %shr3, 71776119077928960, !dbg !5901
    #dbg_value(i64 %shr3, !5902, !DIExpression(DW_OP_constu, 71777214294589440, DW_OP_and, DW_OP_stack_value), !5890)
  %shr5 = lshr i64 %and, 8, !dbg !5903
  %or = or disjoint i64 %and, %shr5, !dbg !5904
    #dbg_value(i64 %or, !5894, !DIExpression(), !5890)
  %shr6 = lshr i64 %and1, 8, !dbg !5905
  %or7 = or disjoint i64 %and1, %shr6, !dbg !5906
    #dbg_value(i64 %or7, !5896, !DIExpression(), !5890)
  %0 = and i64 %q0, 280375465148160, !dbg !5907
  %1 = or disjoint i64 %and2, %0, !dbg !5907
  %or9 = lshr exact i64 %1, 8, !dbg !5907
    #dbg_value(!DIArgList(i64 %and2, i64 %0), !5899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 8, DW_OP_shr, DW_OP_stack_value), !5890)
  %2 = and i64 %q1, 280375465148160, !dbg !5908
  %3 = or disjoint i64 %and4, %2, !dbg !5908
  %or11 = lshr exact i64 %3, 8, !dbg !5908
    #dbg_value(!DIArgList(i64 %and4, i64 %2), !5902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 8, DW_OP_shr, DW_OP_stack_value), !5890)
  %and12 = and i64 %or, 281470681808895, !dbg !5909
    #dbg_value(i64 %and12, !5894, !DIExpression(), !5890)
  %and13 = and i64 %or7, 281470681808895, !dbg !5910
    #dbg_value(i64 %and13, !5896, !DIExpression(), !5890)
    #dbg_value(i64 %or9, !5899, !DIExpression(), !5890)
    #dbg_value(i64 %or11, !5902, !DIExpression(), !5890)
  %shr16 = lshr i64 %and12, 16, !dbg !5911
  %or181 = or disjoint i64 %and12, %shr16, !dbg !5912
  %or18 = trunc i64 %or181 to i32, !dbg !5912
  store i32 %or18, ptr %w, align 4, !dbg !5913
  %shr20 = lshr i64 %and13, 16, !dbg !5914
  %or222 = or disjoint i64 %and13, %shr20, !dbg !5915
  %or22 = trunc i64 %or222 to i32, !dbg !5915
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %w, i32 4, !dbg !5916
  store i32 %or22, ptr %arrayidx23, align 4, !dbg !5917
  %shr25 = lshr i64 %1, 24, !dbg !5918
  %or273 = or disjoint i64 %or9, %shr25, !dbg !5919
  %or27 = trunc i64 %or273 to i32, !dbg !5919
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %w, i32 8, !dbg !5920
  store i32 %or27, ptr %arrayidx28, align 4, !dbg !5921
  %shr30 = lshr i64 %3, 24, !dbg !5922
  %or324 = or disjoint i64 %or11, %shr30, !dbg !5923
  %or32 = trunc i64 %or324 to i32, !dbg !5923
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %w, i32 12, !dbg !5924
  store i32 %or32, ptr %arrayidx33, align 4, !dbg !5925
  ret void, !dbg !5926
}

; Function Attrs: nounwind
define internal fastcc void @br_range_enc32le(ptr noundef %dst, ptr noundef nonnull %v, i32 noundef %num) unnamed_addr #0 !dbg !5927 {
entry:
    #dbg_value(ptr %dst, !5930, !DIExpression(), !5931)
    #dbg_value(ptr %v, !5932, !DIExpression(), !5931)
    #dbg_value(i32 16, !5933, !DIExpression(), !5931)
  br label %while.cond, !dbg !5934

while.cond:                                       ; preds = %while.body, %entry
  %num.addr.0 = phi i32 [ 16, %entry ], [ %dec, %while.body ]
  %v.addr.0 = phi ptr [ %v, %entry ], [ %incdec.ptr, %while.body ]
  %dst.addr.0 = phi ptr [ %dst, %entry ], [ %add.ptr, %while.body ]
    #dbg_value(ptr %dst.addr.0, !5930, !DIExpression(), !5931)
    #dbg_value(ptr %v.addr.0, !5932, !DIExpression(), !5931)
    #dbg_value(i32 %num.addr.0, !5933, !DIExpression(), !5931)
    #dbg_value(i32 %num.addr.0, !5933, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !5931)
  %cmp.not = icmp eq i32 %num.addr.0, 0, !dbg !5935
  br i1 %cmp.not, label %while.end, label %while.body, !dbg !5934

while.body:                                       ; preds = %while.cond
  %dec = add nsw i32 %num.addr.0, -1, !dbg !5936
    #dbg_value(i32 %dec, !5933, !DIExpression(), !5931)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %v.addr.0, i32 4, !dbg !5937
    #dbg_value(ptr %incdec.ptr, !5932, !DIExpression(), !5931)
  %0 = load i32, ptr %v.addr.0, align 4, !dbg !5939
  call fastcc void @br_enc32le(ptr noundef %dst.addr.0, i32 noundef %0) #4, !dbg !5940
  %add.ptr = getelementptr inbounds nuw i8, ptr %dst.addr.0, i32 4, !dbg !5941
    #dbg_value(ptr %add.ptr, !5930, !DIExpression(), !5931)
  br label %while.cond, !dbg !5934, !llvm.loop !5942

while.end:                                        ; preds = %while.cond
  ret void, !dbg !5944
}

; Function Attrs: nounwind
define internal fastcc void @br_enc32le(ptr noundef %dst, i32 noundef %x) unnamed_addr #0 !dbg !5945 {
entry:
    #dbg_value(ptr %dst, !5948, !DIExpression(), !5949)
    #dbg_value(i32 %x, !5950, !DIExpression(), !5949)
  %conv = trunc i32 %x to i8, !dbg !5951
  store i8 %conv, ptr %dst, align 1, !dbg !5952
  %shr = lshr i32 %x, 8, !dbg !5953
  %conv1 = trunc i32 %shr to i8, !dbg !5954
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %dst, i32 1, !dbg !5955
  store i8 %conv1, ptr %arrayidx2, align 1, !dbg !5956
  %shr3 = lshr i32 %x, 16, !dbg !5957
  %conv4 = trunc i32 %shr3 to i8, !dbg !5958
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %dst, i32 2, !dbg !5959
  store i8 %conv4, ptr %arrayidx5, align 1, !dbg !5960
  %shr6 = lshr i32 %x, 24, !dbg !5961
  %conv7 = trunc nuw i32 %shr6 to i8, !dbg !5962
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %dst, i32 3, !dbg !5963
  store i8 %conv7, ptr %arrayidx8, align 1, !dbg !5964
  ret void, !dbg !5965
}

; Function Attrs: nounwind
define internal fastcc i64 @rotr32(i64 noundef %x) unnamed_addr #0 !dbg !5966 {
entry:
    #dbg_value(i64 %x, !5969, !DIExpression(), !5970)
  %0 = shl i64 %x, 32, !dbg !5971
  %1 = lshr i64 %x, 32, !dbg !5971
  %2 = or i64 %0, %1, !dbg !5971
  ret i64 %2, !dbg !5972
}

; Function Attrs: nounwind
define dso_local void @aes128_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %ctx) local_unnamed_addr #0 !dbg !5973 {
entry:
    #dbg_value(ptr %out, !5976, !DIExpression(), !5977)
    #dbg_value(i32 %outlen, !5978, !DIExpression(), !5977)
    #dbg_value(ptr %iv, !5979, !DIExpression(), !5977)
    #dbg_value(ptr %ctx, !5980, !DIExpression(), !5977)
  %0 = load ptr, ptr %ctx, align 4, !dbg !5981
  call fastcc void @aes_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %0, i32 noundef 10) #4, !dbg !5982
  ret void, !dbg !5983
}

; Function Attrs: nounwind
define internal fastcc void @aes_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %rkeys, i32 noundef range(i32 10, 15) %nrounds) unnamed_addr #0 !dbg !5984 {
entry:
  %ivw = alloca [16 x i32], align 4
  %tmp = alloca [64 x i8], align 1
    #dbg_value(ptr %out, !5987, !DIExpression(), !5988)
    #dbg_value(i32 %outlen, !5989, !DIExpression(), !5988)
    #dbg_value(ptr %iv, !5990, !DIExpression(), !5988)
    #dbg_value(ptr %rkeys, !5991, !DIExpression(), !5988)
    #dbg_value(i32 %nrounds, !5992, !DIExpression(), !5988)
    #dbg_declare(ptr %ivw, !5993, !DIExpression(), !5994)
    #dbg_value(i32 0, !5995, !DIExpression(), !5988)
  call fastcc void @br_range_dec32le(ptr noundef nonnull %ivw, i32 noundef 3, ptr noundef %iv) #4, !dbg !5996
  %add.ptr = getelementptr inbounds nuw i8, ptr %ivw, i32 16, !dbg !5997
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %ivw, i32 noundef 12) #6, !dbg !5998
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %ivw, i32 32, !dbg !5999
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %ivw, i32 noundef 12) #6, !dbg !6000
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %ivw, i32 48, !dbg !6001
  %call10 = call ptr @memcpy(ptr noundef nonnull %add.ptr8, ptr noundef nonnull %ivw, i32 noundef 12) #6, !dbg !6002
  %call11 = call fastcc i32 @br_swap32(i32 noundef 0) #4, !dbg !6003
  %arrayidx = getelementptr inbounds nuw i8, ptr %ivw, i32 12, !dbg !6004
  store i32 %call11, ptr %arrayidx, align 4, !dbg !6005
  %call12 = call fastcc i32 @br_swap32(i32 noundef 1) #4, !dbg !6006
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %ivw, i32 28, !dbg !6007
  store i32 %call12, ptr %arrayidx13, align 4, !dbg !6008
  %call15 = call fastcc i32 @br_swap32(i32 noundef 2) #4, !dbg !6009
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %ivw, i32 44, !dbg !6010
  store i32 %call15, ptr %arrayidx16, align 4, !dbg !6011
  %call18 = call fastcc i32 @br_swap32(i32 noundef 3) #4, !dbg !6012
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %ivw, i32 60, !dbg !6013
  store i32 %call18, ptr %arrayidx19, align 4, !dbg !6014
  br label %while.cond, !dbg !6015

while.cond:                                       ; preds = %while.body, %entry
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub, %while.body ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr21, %while.body ]
    #dbg_value(ptr %out.addr.0, !5987, !DIExpression(), !5988)
    #dbg_value(i32 %outlen.addr.0, !5989, !DIExpression(), !5988)
  %cmp = icmp ugt i32 %outlen.addr.0, 64, !dbg !6016
  br i1 %cmp, label %while.body, label %while.end, !dbg !6015

while.body:                                       ; preds = %while.cond
  call fastcc void @aes_ctr4x(ptr noundef %out.addr.0, ptr noundef nonnull %ivw, ptr noundef %rkeys, i32 noundef %nrounds) #4, !dbg !6017
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 64, !dbg !6019
    #dbg_value(ptr %add.ptr21, !5987, !DIExpression(), !5988)
  %sub = add i32 %outlen.addr.0, -64, !dbg !6020
    #dbg_value(i32 %sub, !5989, !DIExpression(), !5988)
  br label %while.cond, !dbg !6015, !llvm.loop !6021

while.end:                                        ; preds = %while.cond
  %outlen.addr.0.lcssa = phi i32 [ %outlen.addr.0, %while.cond ]
  %out.addr.0.lcssa = phi ptr [ %out.addr.0, %while.cond ]
  %cmp22.not = icmp eq i32 %outlen.addr.0.lcssa, 0, !dbg !6023
  br i1 %cmp22.not, label %if.end, label %if.then, !dbg !6023

if.then:                                          ; preds = %while.end
    #dbg_declare(ptr %tmp, !6025, !DIExpression(), !6027)
  call fastcc void @aes_ctr4x(ptr noundef nonnull %tmp, ptr noundef nonnull %ivw, ptr noundef %rkeys, i32 noundef %nrounds) #4, !dbg !6028
    #dbg_value(i32 0, !6029, !DIExpression(), !5988)
  br label %for.cond, !dbg !6030

for.cond:                                         ; preds = %for.body, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc, %for.body ], !dbg !6032
    #dbg_value(i32 %i.0, !6029, !DIExpression(), !5988)
  %cmp25 = icmp ult i32 %i.0, %outlen.addr.0.lcssa, !dbg !6033
  br i1 %cmp25, label %for.body, label %if.end.loopexit, !dbg !6035

for.body:                                         ; preds = %for.cond
  %arrayidx26 = getelementptr inbounds nuw [64 x i8], ptr %tmp, i32 0, i32 %i.0, !dbg !6036
  %0 = load i8, ptr %arrayidx26, align 1, !dbg !6036
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %out.addr.0.lcssa, i32 %i.0, !dbg !6038
  store i8 %0, ptr %arrayidx27, align 1, !dbg !6039
  %inc = add nuw nsw i32 %i.0, 1, !dbg !6040
    #dbg_value(i32 %inc, !6029, !DIExpression(), !5988)
  br label %for.cond, !dbg !6041, !llvm.loop !6042

if.end.loopexit:                                  ; preds = %for.cond
  br label %if.end, !dbg !6044

if.end:                                           ; preds = %if.end.loopexit, %while.end
  ret void, !dbg !6044
}

; Function Attrs: nounwind
define internal fastcc i32 @br_swap32(i32 noundef %x) unnamed_addr #0 !dbg !6045 {
entry:
    #dbg_value(i32 %x, !6046, !DIExpression(), !6047)
    #dbg_value(!DIArgList(i32 %x, i32 %x), !6046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 8, DW_OP_shl, DW_OP_constu, 18446744073692839680, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_shr, DW_OP_constu, 16711935, DW_OP_and, DW_OP_or, DW_OP_stack_value), !6047)
  %0 = and i32 %x, 255, !dbg !6048
  %1 = shl i32 %0, 24, !dbg !6048
  %2 = and i32 %x, 65280, !dbg !6048
  %3 = shl i32 %2, 8, !dbg !6048
  %4 = and i32 %x, 16711680, !dbg !6048
  %5 = lshr i32 %4, 8, !dbg !6048
  %6 = and i32 %x, -16777216, !dbg !6048
  %7 = lshr i32 %6, 24, !dbg !6048
  %8 = or i32 %1, %3, !dbg !6048
  %9 = or i32 %8, %5, !dbg !6048
  %10 = or i32 %9, %7, !dbg !6048
  ret i32 %10, !dbg !6049
}

; Function Attrs: nounwind
define internal fastcc void @aes_ctr4x(ptr noundef %out, ptr noundef nonnull %ivw, ptr noundef %sk_exp, i32 noundef range(i32 10, 15) %nrounds) unnamed_addr #0 !dbg !6050 {
entry:
    #dbg_value(ptr %out, !6053, !DIExpression(), !6054)
    #dbg_value(ptr %ivw, !6055, !DIExpression(), !6054)
    #dbg_value(ptr %sk_exp, !6056, !DIExpression(), !6054)
    #dbg_value(i32 %nrounds, !6057, !DIExpression(), !6054)
  call fastcc void @aes_ecb4x(ptr noundef %out, ptr noundef %ivw, ptr noundef %sk_exp, i32 noundef %nrounds) #4, !dbg !6058
  %add.ptr = getelementptr inbounds nuw i8, ptr %ivw, i32 12, !dbg !6059
  call fastcc void @inc4_be(ptr noundef nonnull %add.ptr) #4, !dbg !6060
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %ivw, i32 28, !dbg !6061
  call fastcc void @inc4_be(ptr noundef nonnull %add.ptr1) #4, !dbg !6062
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %ivw, i32 44, !dbg !6063
  call fastcc void @inc4_be(ptr noundef nonnull %add.ptr2) #4, !dbg !6064
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %ivw, i32 60, !dbg !6065
  call fastcc void @inc4_be(ptr noundef nonnull %add.ptr3) #4, !dbg !6066
  ret void, !dbg !6067
}

; Function Attrs: nounwind
define internal fastcc void @inc4_be(ptr noundef nonnull %x) unnamed_addr #0 !dbg !6068 {
entry:
    #dbg_value(ptr %x, !6071, !DIExpression(), !6072)
  %0 = load i32, ptr %x, align 4, !dbg !6073
  %call = call fastcc i32 @br_swap32(i32 noundef %0) #4, !dbg !6074
  %add = add i32 %call, 4, !dbg !6075
    #dbg_value(i32 %add, !6076, !DIExpression(), !6072)
  %call1 = call fastcc i32 @br_swap32(i32 noundef %add) #4, !dbg !6077
  store i32 %call1, ptr %x, align 4, !dbg !6078
  ret void, !dbg !6079
}

; Function Attrs: nounwind
define dso_local void @aes192_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %ctx) local_unnamed_addr #0 !dbg !6080 {
entry:
    #dbg_value(ptr %out, !6085, !DIExpression(), !6086)
    #dbg_value(ptr %in, !6087, !DIExpression(), !6086)
    #dbg_value(i32 %nblocks, !6088, !DIExpression(), !6086)
    #dbg_value(ptr %ctx, !6089, !DIExpression(), !6086)
  %0 = load ptr, ptr %ctx, align 4, !dbg !6090
  call fastcc void @aes_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %0, i32 noundef 12) #4, !dbg !6091
  ret void, !dbg !6092
}

; Function Attrs: nounwind
define dso_local void @aes192_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %ctx) local_unnamed_addr #0 !dbg !6093 {
entry:
    #dbg_value(ptr %out, !6096, !DIExpression(), !6097)
    #dbg_value(i32 %outlen, !6098, !DIExpression(), !6097)
    #dbg_value(ptr %iv, !6099, !DIExpression(), !6097)
    #dbg_value(ptr %ctx, !6100, !DIExpression(), !6097)
  %0 = load ptr, ptr %ctx, align 4, !dbg !6101
  call fastcc void @aes_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %0, i32 noundef 12) #4, !dbg !6102
  ret void, !dbg !6103
}

; Function Attrs: nounwind
define dso_local void @aes256_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %ctx) local_unnamed_addr #0 !dbg !6104 {
entry:
    #dbg_value(ptr %out, !6109, !DIExpression(), !6110)
    #dbg_value(ptr %in, !6111, !DIExpression(), !6110)
    #dbg_value(i32 %nblocks, !6112, !DIExpression(), !6110)
    #dbg_value(ptr %ctx, !6113, !DIExpression(), !6110)
  %0 = load ptr, ptr %ctx, align 4, !dbg !6114
  call fastcc void @aes_ecb(ptr noundef %out, ptr noundef %in, i32 noundef %nblocks, ptr noundef %0, i32 noundef 14) #4, !dbg !6115
  ret void, !dbg !6116
}

; Function Attrs: nounwind
define dso_local void @aes256_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %ctx) local_unnamed_addr #0 !dbg !6117 {
entry:
    #dbg_value(ptr %out, !6120, !DIExpression(), !6121)
    #dbg_value(i32 %outlen, !6122, !DIExpression(), !6121)
    #dbg_value(ptr %iv, !6123, !DIExpression(), !6121)
    #dbg_value(ptr %ctx, !6124, !DIExpression(), !6121)
  %0 = load ptr, ptr %ctx, align 4, !dbg !6125
  call fastcc void @aes_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %0, i32 noundef 14) #4, !dbg !6126
  ret void, !dbg !6127
}

; Function Attrs: nounwind
define dso_local void @aes128_ctx_release(ptr noundef %r) local_unnamed_addr #0 !dbg !6128 {
entry:
    #dbg_value(ptr %r, !6131, !DIExpression(), !6132)
  %0 = load ptr, ptr %r, align 4, !dbg !6133
  call void @free(ptr noundef %0) #6, !dbg !6134
  ret void, !dbg !6135
}

; Function Attrs: nounwind
define dso_local void @aes192_ctx_release(ptr noundef %r) local_unnamed_addr #0 !dbg !6136 {
entry:
    #dbg_value(ptr %r, !6139, !DIExpression(), !6140)
  %0 = load ptr, ptr %r, align 4, !dbg !6141
  call void @free(ptr noundef %0) #6, !dbg !6142
  ret void, !dbg !6143
}

; Function Attrs: nounwind
define dso_local void @aes256_ctx_release(ptr noundef %r) local_unnamed_addr #0 !dbg !6144 {
entry:
    #dbg_value(ptr %r, !6147, !DIExpression(), !6148)
  %0 = load ptr, ptr %r, align 4, !dbg !6149
  call void @free(ptr noundef %0) #6, !dbg !6150
  ret void, !dbg !6151
}

; Function Attrs: nounwind
define dso_local i32 @AES_128_CTR(ptr noundef %output, i32 noundef %outputByteLen, ptr noundef %input, i32 noundef %inputByteLen) local_unnamed_addr #0 !dbg !6152 {
entry:
  %ctx = alloca %struct.shake128incctx, align 4
  %iv = alloca [16 x i8], align 1
    #dbg_value(ptr %output, !6155, !DIExpression(), !6156)
    #dbg_value(i32 %outputByteLen, !6157, !DIExpression(), !6156)
    #dbg_value(ptr %input, !6158, !DIExpression(), !6156)
    #dbg_value(i32 %inputByteLen, !6159, !DIExpression(), !6156)
    #dbg_declare(ptr %ctx, !6160, !DIExpression(), !6161)
    #dbg_declare(ptr %iv, !6162, !DIExpression(), !6163)
  call void @mayo_memset(ptr %iv, i8 0, i32 16), !dbg !6163
  call void @aes128_ctr_keyexp(ptr noundef nonnull %ctx, ptr noundef %input) #4, !dbg !6164
  call void @aes128_ctr(ptr noundef %output, i32 noundef %outputByteLen, ptr noundef nonnull %iv, ptr noundef nonnull %ctx) #4, !dbg !6165
  call void @aes128_ctx_release(ptr noundef nonnull %ctx) #4, !dbg !6166
  ret i32 %outputByteLen, !dbg !6167
}

; Function Attrs: nounwind
define dso_local void @AES_256_ECB(ptr noundef %input, ptr noundef %key, ptr noundef %output) local_unnamed_addr #0 !dbg !6168 {
entry:
  %ctx = alloca %struct.shake128incctx, align 4
    #dbg_value(ptr %input, !6171, !DIExpression(), !6172)
    #dbg_value(ptr %key, !6173, !DIExpression(), !6172)
    #dbg_value(ptr %output, !6174, !DIExpression(), !6172)
    #dbg_declare(ptr %ctx, !6175, !DIExpression(), !6176)
  call void @aes256_ecb_keyexp(ptr noundef nonnull %ctx, ptr noundef %key) #4, !dbg !6177
  call void @aes256_ecb(ptr noundef %output, ptr noundef %input, i32 noundef 1, ptr noundef nonnull %ctx) #4, !dbg !6178
  call void @aes256_ctx_release(ptr noundef nonnull %ctx) #4, !dbg !6179
  ret void, !dbg !6180
}

; Function Attrs: nounwind
define dso_local void @mayo_secure_free(ptr noundef %mem, i32 noundef %size) local_unnamed_addr #0 !dbg !86 {
entry:
    #dbg_value(ptr %mem, !6181, !DIExpression(), !6182)
    #dbg_value(i32 %size, !6183, !DIExpression(), !6182)
  %tobool.not = icmp eq ptr %mem, null, !dbg !6184
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !6184

if.then:                                          ; preds = %entry
  %0 = load volatile ptr, ptr @mayo_secure_free.memset_func, align 4, !dbg !6186
  %call = call ptr %0(ptr noundef nonnull %mem, i32 noundef 0, i32 noundef %size) #6, !dbg !6186
  call void @free(ptr noundef nonnull %mem) #6, !dbg !6188
  br label %if.end, !dbg !6189

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !6190
}

; Function Attrs: nounwind
define dso_local void @mayo_secure_clear(ptr noundef %mem, i32 noundef %size) local_unnamed_addr #0 !dbg !94 {
entry:
    #dbg_value(ptr %mem, !6191, !DIExpression(), !6192)
    #dbg_value(i32 %size, !6193, !DIExpression(), !6192)
  %0 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4, !dbg !6194
  %call = call ptr %0(ptr noundef %mem, i32 noundef 0, i32 noundef %size) #6, !dbg !6194
  ret void, !dbg !6195
}

; Function Attrs: nounwind
define dso_local void @AES256_CTR_DRBG_Update(ptr noundef %provided_data, ptr noundef %Key, ptr noundef %V) local_unnamed_addr #0 !dbg !6196 {
entry:
  %temp = alloca [48 x i8], align 1
    #dbg_value(ptr %provided_data, !6199, !DIExpression(), !6200)
    #dbg_value(ptr %Key, !6201, !DIExpression(), !6200)
    #dbg_value(ptr %V, !6202, !DIExpression(), !6200)
    #dbg_declare(ptr %temp, !6203, !DIExpression(), !6207)
    #dbg_value(i32 0, !6208, !DIExpression(), !6210)
  br label %for.cond, !dbg !6211

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.end ], !dbg !6212
    #dbg_value(i32 %i.0, !6208, !DIExpression(), !6210)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !6213
  br i1 %exitcond, label %for.cond1.preheader, label %for.end10, !dbg !6215

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !6216

for.cond1:                                        ; preds = %for.cond1.preheader, %if.then
  %j.0 = phi i32 [ %dec, %if.then ], [ 15, %for.cond1.preheader ], !dbg !6219
    #dbg_value(i32 %j.0, !6220, !DIExpression(), !6221)
  %cmp2 = icmp sgt i32 %j.0, -1, !dbg !6222
  br i1 %cmp2, label %for.body3, label %for.end.loopexit, !dbg !6216

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds nuw i8, ptr %V, i32 %j.0, !dbg !6224
  %0 = load i8, ptr %arrayidx, align 1, !dbg !6224
  %cmp4 = icmp eq i8 %0, -1, !dbg !6227
  br i1 %cmp4, label %if.then, label %if.else, !dbg !6227

if.then:                                          ; preds = %for.body3
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %V, i32 %j.0, !dbg !6228
  store i8 0, ptr %arrayidx6, align 1, !dbg !6230
  %dec = add nsw i32 %j.0, -1, !dbg !6231
    #dbg_value(i32 %dec, !6220, !DIExpression(), !6221)
  br label %for.cond1, !dbg !6232, !llvm.loop !6233

if.else:                                          ; preds = %for.body3
  %j.0.lcssa2 = phi i32 [ %j.0, %for.body3 ], !dbg !6219
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %V, i32 %j.0.lcssa2, !dbg !6235
  %1 = load i8, ptr %arrayidx7, align 1, !dbg !6237
  %inc = add i8 %1, 1, !dbg !6237
  store i8 %inc, ptr %arrayidx7, align 1, !dbg !6237
  br label %for.end, !dbg !6238

for.end.loopexit:                                 ; preds = %for.cond1
  br label %for.end, !dbg !6239

for.end:                                          ; preds = %for.end.loopexit, %if.else
  %mul = shl nuw nsw i32 %i.0, 4, !dbg !6239
  %add.ptr = getelementptr inbounds nuw i8, ptr %temp, i32 %mul, !dbg !6240
  call fastcc void @AES256_ECB(ptr noundef %Key, ptr noundef %V, ptr noundef nonnull %add.ptr) #4, !dbg !6241
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !6242
    #dbg_value(i32 %inc9, !6208, !DIExpression(), !6210)
  br label %for.cond, !dbg !6243, !llvm.loop !6244

for.end10:                                        ; preds = %for.cond
  %cmp11.not = icmp eq ptr %provided_data, null, !dbg !6246
  br i1 %cmp11.not, label %if.end27, label %for.cond15.preheader, !dbg !6246

for.cond15.preheader:                             ; preds = %for.end10
  br label %for.cond15, !dbg !6248

for.cond15:                                       ; preds = %for.cond15.preheader, %for.body18
  %i14.0 = phi i32 [ %inc25, %for.body18 ], [ 0, %for.cond15.preheader ], !dbg !6250
    #dbg_value(i32 %i14.0, !6251, !DIExpression(), !6252)
  %exitcond3 = icmp ne i32 %i14.0, 48, !dbg !6253
  br i1 %exitcond3, label %for.body18, label %if.end27.loopexit, !dbg !6248

for.body18:                                       ; preds = %for.cond15
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %provided_data, i32 %i14.0, !dbg !6255
  %2 = load i8, ptr %arrayidx19, align 1, !dbg !6255
  %arrayidx21 = getelementptr inbounds nuw [48 x i8], ptr %temp, i32 0, i32 %i14.0, !dbg !6257
  %3 = load i8, ptr %arrayidx21, align 1, !dbg !6258
  %xor1 = xor i8 %3, %2, !dbg !6258
  store i8 %xor1, ptr %arrayidx21, align 1, !dbg !6258
  %inc25 = add nuw nsw i32 %i14.0, 1, !dbg !6259
    #dbg_value(i32 %inc25, !6251, !DIExpression(), !6252)
  br label %for.cond15, !dbg !6260, !llvm.loop !6261

if.end27.loopexit:                                ; preds = %for.cond15
  br label %if.end27, !dbg !6263

if.end27:                                         ; preds = %if.end27.loopexit, %for.end10
  %call = call ptr @memcpy(ptr noundef %Key, ptr noundef nonnull %temp, i32 noundef 32) #6, !dbg !6263
  %add.ptr30 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !6264
  %call31 = call ptr @memcpy(ptr noundef %V, ptr noundef nonnull %add.ptr30, i32 noundef 16) #6, !dbg !6265
  ret void, !dbg !6266
}

; Function Attrs: nounwind
define internal fastcc void @AES256_ECB(ptr noundef %key, ptr noundef %ctr, ptr noundef nonnull %buffer) unnamed_addr #0 !dbg !6267 {
entry:
    #dbg_value(ptr %key, !6268, !DIExpression(), !6269)
    #dbg_value(ptr %ctr, !6270, !DIExpression(), !6269)
    #dbg_value(ptr %buffer, !6271, !DIExpression(), !6269)
  call void @AES_256_ECB(ptr noundef %ctr, ptr noundef %key, ptr noundef nonnull %buffer) #4, !dbg !6272
  ret void, !dbg !6273
}

; Function Attrs: nounwind
define dso_local i32 @randombytes(ptr noundef %random_array, i32 noundef %nbytes) local_unnamed_addr #0 !dbg !6274 {
entry:
    #dbg_value(ptr %random_array, !6277, !DIExpression(), !6278)
    #dbg_value(i32 %nbytes, !6279, !DIExpression(), !6278)
  %call = call fastcc i32 @randombytes_nist(ptr noundef %random_array, i32 noundef %nbytes) #4, !dbg !6280
    #dbg_value(i32 0, !6281, !DIExpression(), !6278)
  ret i32 0, !dbg !6282
}

; Function Attrs: nounwind
define internal fastcc i32 @randombytes_nist(ptr noundef %x, i32 noundef %xlen) unnamed_addr #0 !dbg !6283 {
entry:
  %block = alloca [16 x i8], align 1
    #dbg_value(ptr %x, !6284, !DIExpression(), !6285)
    #dbg_value(i32 %xlen, !6286, !DIExpression(), !6285)
    #dbg_declare(ptr %block, !6287, !DIExpression(), !6288)
    #dbg_value(i32 0, !6289, !DIExpression(), !6285)
  br label %while.cond, !dbg !6290

while.cond:                                       ; preds = %if.end15, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %i.1, %if.end15 ], !dbg !6285
  %xlen.addr.0 = phi i32 [ %xlen, %entry ], [ %xlen.addr.1, %if.end15 ]
    #dbg_value(i32 %xlen.addr.0, !6286, !DIExpression(), !6285)
    #dbg_value(i32 %i.0, !6289, !DIExpression(), !6285)
  %cmp.not = icmp eq i32 %xlen.addr.0, 0, !dbg !6291
  br i1 %cmp.not, label %while.end, label %for.cond.preheader, !dbg !6290

for.cond.preheader:                               ; preds = %while.cond
  br label %for.cond, !dbg !6292

for.cond:                                         ; preds = %for.cond.preheader, %if.then
  %j.0 = phi i32 [ %dec, %if.then ], [ 15, %for.cond.preheader ], !dbg !6295
    #dbg_value(i32 %j.0, !6296, !DIExpression(), !6297)
  %cmp1 = icmp sgt i32 %j.0, -1, !dbg !6298
  br i1 %cmp1, label %for.body, label %for.end.loopexit, !dbg !6292

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [16 x i8], ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32), i32 0, i32 %j.0, !dbg !6300
  %0 = load i8, ptr %arrayidx, align 1, !dbg !6300
  %cmp2 = icmp eq i8 %0, -1, !dbg !6303
  br i1 %cmp2, label %if.then, label %if.else, !dbg !6303

if.then:                                          ; preds = %for.body
  %arrayidx4 = getelementptr inbounds nuw [16 x i8], ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32), i32 0, i32 %j.0, !dbg !6304
  store i8 0, ptr %arrayidx4, align 1, !dbg !6306
  %dec = add nsw i32 %j.0, -1, !dbg !6307
    #dbg_value(i32 %dec, !6296, !DIExpression(), !6297)
  br label %for.cond, !dbg !6308, !llvm.loop !6309

if.else:                                          ; preds = %for.body
  %j.0.lcssa1 = phi i32 [ %j.0, %for.body ], !dbg !6295
  %arrayidx5 = getelementptr inbounds nuw [16 x i8], ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32), i32 0, i32 %j.0.lcssa1, !dbg !6311
  %1 = load i8, ptr %arrayidx5, align 1, !dbg !6313
  %inc = add i8 %1, 1, !dbg !6313
  store i8 %inc, ptr %arrayidx5, align 1, !dbg !6313
  br label %for.end, !dbg !6314

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !6315

for.end:                                          ; preds = %for.end.loopexit, %if.else
  call fastcc void @AES256_ECB(ptr noundef nonnull @DRBG_ctx, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32), ptr noundef nonnull %block) #4, !dbg !6315
  %cmp6 = icmp ugt i32 %xlen.addr.0, 15, !dbg !6316
  br i1 %cmp6, label %if.then8, label %if.else10, !dbg !6316

if.then8:                                         ; preds = %for.end
  %add.ptr = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !6318
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef nonnull %block, i32 noundef 16) #6, !dbg !6320
  %add = add i32 %i.0, 16, !dbg !6321
    #dbg_value(i32 %add, !6289, !DIExpression(), !6285)
  %sub = add i32 %xlen.addr.0, -16, !dbg !6322
    #dbg_value(i32 %sub, !6286, !DIExpression(), !6285)
  br label %if.end15, !dbg !6323

if.else10:                                        ; preds = %for.end
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !6324
  %call13 = call ptr @memcpy(ptr noundef %add.ptr11, ptr noundef nonnull %block, i32 noundef %xlen.addr.0) #6, !dbg !6326
  %add14 = add i32 %i.0, %xlen.addr.0, !dbg !6327
    #dbg_value(i32 %add14, !6289, !DIExpression(), !6285)
    #dbg_value(i32 0, !6286, !DIExpression(), !6285)
  br label %if.end15

if.end15:                                         ; preds = %if.else10, %if.then8
  %i.1 = phi i32 [ %add, %if.then8 ], [ %add14, %if.else10 ], !dbg !6328
  %xlen.addr.1 = phi i32 [ %sub, %if.then8 ], [ 0, %if.else10 ], !dbg !6328
    #dbg_value(i32 %xlen.addr.1, !6286, !DIExpression(), !6285)
    #dbg_value(i32 %i.1, !6289, !DIExpression(), !6285)
  br label %while.cond, !dbg !6290, !llvm.loop !6329

while.end:                                        ; preds = %while.cond
  call void @AES256_CTR_DRBG_Update(ptr noundef null, ptr noundef nonnull @DRBG_ctx, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32)) #4, !dbg !6331
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 48), align 4, !dbg !6332
  %inc16 = add nsw i32 %2, 1, !dbg !6332
  store i32 %inc16, ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 48), align 4, !dbg !6332
  ret i32 poison, !dbg !6333
}

; Function Attrs: nounwind
define dso_local void @randombytes_init(ptr noundef %entropy_input, ptr noundef %personalization_string, i32 noundef %security_strength) local_unnamed_addr #0 !dbg !6334 {
entry:
    #dbg_value(ptr %entropy_input, !6337, !DIExpression(), !6338)
    #dbg_value(ptr %personalization_string, !6339, !DIExpression(), !6338)
    #dbg_value(i32 %security_strength, !6340, !DIExpression(), !6338)
  call fastcc void @randombytes_init_nist(ptr noundef %entropy_input, ptr noundef %personalization_string, i32 noundef %security_strength) #4, !dbg !6341
  ret void, !dbg !6342
}

; Function Attrs: nounwind
define internal fastcc void @randombytes_init_nist(ptr noundef %entropy_input, ptr noundef %personalization_string, i32 noundef %security_strength) unnamed_addr #0 !dbg !6343 {
entry:
  %seed_material = alloca [48 x i8], align 1
    #dbg_value(ptr %entropy_input, !6344, !DIExpression(), !6345)
    #dbg_value(ptr %personalization_string, !6346, !DIExpression(), !6345)
    #dbg_value(i32 %security_strength, !6347, !DIExpression(), !6345)
    #dbg_declare(ptr %seed_material, !6348, !DIExpression(), !6349)
  %call = call ptr @memcpy(ptr noundef nonnull %seed_material, ptr noundef %entropy_input, i32 noundef 48) #6, !dbg !6350
  %tobool.not = icmp eq ptr %personalization_string, null, !dbg !6351
  br i1 %tobool.not, label %if.end, label %for.cond.preheader, !dbg !6351

for.cond.preheader:                               ; preds = %entry
  br label %for.cond, !dbg !6353

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %i.0 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ], !dbg !6355
    #dbg_value(i32 %i.0, !6356, !DIExpression(), !6357)
  %exitcond = icmp ne i32 %i.0, 48, !dbg !6358
  br i1 %exitcond, label %for.body, label %if.end.loopexit, !dbg !6353

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %personalization_string, i32 %i.0, !dbg !6360
  %0 = load i8, ptr %arrayidx, align 1, !dbg !6360
  %arrayidx1 = getelementptr inbounds nuw [48 x i8], ptr %seed_material, i32 0, i32 %i.0, !dbg !6362
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !6363
  %xor1 = xor i8 %1, %0, !dbg !6363
  store i8 %xor1, ptr %arrayidx1, align 1, !dbg !6363
  %inc = add nuw nsw i32 %i.0, 1, !dbg !6364
    #dbg_value(i32 %inc, !6356, !DIExpression(), !6357)
  br label %for.cond, !dbg !6365, !llvm.loop !6366

if.end.loopexit:                                  ; preds = %for.cond
  br label %if.end, !dbg !6368

if.end:                                           ; preds = %if.end.loopexit, %entry
  %call4 = call ptr @memset(ptr noundef nonnull @DRBG_ctx, i32 noundef 0, i32 noundef 32) #6, !dbg !6368
  %call5 = call ptr @memset(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32), i32 noundef 0, i32 noundef 16) #6, !dbg !6369
  call void @AES256_CTR_DRBG_Update(ptr noundef nonnull %seed_material, ptr noundef nonnull @DRBG_ctx, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 32)) #4, !dbg !6370
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @DRBG_ctx, i32 48), align 4, !dbg !6371
  ret void, !dbg !6372
}

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { allocsize(0,1) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #3 = { allocsize(0) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #4 = { nobuiltin "no-builtins" }
attributes #5 = { nobuiltin nounwind allocsize(0,1) "no-builtins" }
attributes #6 = { nobuiltin nounwind "no-builtins" }
attributes #7 = { nobuiltin nounwind allocsize(0) "no-builtins" }

!llvm.dbg.cu = !{!120, !122, !2, !43, !66, !77, !90, !104}
!llvm.ident = !{!123, !123, !123, !123, !123, !123, !123, !123}
!llvm.module.flags = !{!124, !125, !126, !127}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "f_tail", scope: !2, file: !36, line: 247, type: !37, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !21, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4 = !{!5, !11, !14, !15, !18, !19}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !7, line: 60, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !9, line: 105, baseType: !10)
!9 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!10 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 214, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 48, baseType: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 79, baseType: !17)
!21 = !{!0, !22, !30, !32, !34}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !24, file: !25, line: 118, type: !29, isLocal: true, isDefinition: true)
!24 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !25, file: !25, line: 117, type: !26, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!25 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!26 = !DISubroutineType(types: !27)
!27 = !{null, !5}
!28 = !{}
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "even_bytes", scope: !24, file: !25, line: 119, type: !29, isLocal: true, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !24, file: !25, line: 120, type: !29, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "even_half", scope: !24, file: !25, line: 121, type: !29, isLocal: true, isDefinition: true)
!36 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 32, elements: !39)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!39 = !{!40}
!40 = !DISubrange(count: 4)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !43, file: !58, line: 126, type: !63, isLocal: false, isDefinition: true)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, globals: !55, splitDebugInlining: false, nameTableKind: None)
!44 = !{!6, !45, !46, !18, !19, !49, !50, !53}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 56, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 103, baseType: !48)
!48 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 20, baseType: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 41, baseType: !52)
!52 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 44, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 77, baseType: !45)
!55 = !{!41, !56, !60}
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !43, file: !58, line: 127, type: !59, isLocal: false, isDefinition: true)
!58 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!59 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !43, file: !58, line: 128, type: !62, isLocal: false, isDefinition: true)
!62 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !19)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !66, file: !71, line: 214, type: !72, isLocal: true, isDefinition: true)
!66 = distinct !DICompileUnit(language: DW_LANG_C11, file: !67, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !68, globals: !70, splitDebugInlining: false, nameTableKind: None)
!67 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!68 = !{!69, !19, !6, !15, !12}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!70 = !{!64}
!71 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1536, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 24)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "Rcon", scope: !77, file: !80, line: 388, type: !81, isLocal: true, isDefinition: true)
!77 = distinct !DICompileUnit(language: DW_LANG_C11, file: !67, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !78, globals: !79, splitDebugInlining: false, nameTableKind: None)
!78 = !{!69, !45, !6, !19, !14}
!79 = !{!75}
!80 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 80, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 10)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "memset_func", scope: !86, file: !87, line: 10, type: !100, isLocal: true, isDefinition: true)
!86 = distinct !DISubprogram(name: "mayo_secure_free", scope: !87, file: !87, line: 7, type: !88, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !90, retainedNodes: !28)
!87 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!88 = !DISubroutineType(types: !89)
!89 = !{null, !69, !15}
!90 = distinct !DICompileUnit(language: DW_LANG_C11, file: !67, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !91, splitDebugInlining: false, nameTableKind: None)
!91 = !{!84, !92}
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "memset_func", scope: !94, file: !87, line: 17, type: !95, isLocal: true, isDefinition: true)
!94 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !87, file: !87, line: 15, type: !88, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !90, retainedNodes: !28)
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !94, file: !87, line: 16, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!69, !69, !45, !15}
!100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !86, file: !87, line: 9, baseType: !97)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "DRBG_ctx", scope: !104, file: !107, line: 48, type: !108, isLocal: false, isDefinition: true)
!104 = distinct !DICompileUnit(language: DW_LANG_C11, file: !67, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !105, globals: !106, splitDebugInlining: false, nameTableKind: None)
!105 = !{!69}
!106 = !{!102}
!107 = !DIFile(filename: "../../../src/common/randombytes_ctrdrbg.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES256_CTR_DRBG_struct", file: !107, line: 40, baseType: !109)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !107, line: 36, size: 416, elements: !110)
!110 = !{!111, !115, !119}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "Key", scope: !109, file: !107, line: 37, baseType: !112, size: 256)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 32)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !109, file: !107, line: 38, baseType: !116, size: 128, offset: 256)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 16)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !109, file: !107, line: 39, baseType: !45, size: 32, offset: 384)
!120 = distinct !DICompileUnit(language: DW_LANG_C11, file: !121, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!121 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!122 = distinct !DICompileUnit(language: DW_LANG_C11, file: !121, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!123 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!124 = !{i32 2, !"Debug Info Version", i32 3}
!125 = !{i32 1, !"wchar_size", i32 4}
!126 = !{i32 1, !"min_enum_size", i32 4}
!127 = !{i32 1, !"Code Model", i32 1}
!128 = distinct !DISubprogram(name: "main", scope: !129, file: !129, line: 116, type: !130, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !120)
!129 = !DIFile(filename: "../example.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!130 = !DISubroutineType(types: !131)
!131 = !{!45}
!132 = !DILocation(line: 126, column: 12, scope: !128)
!133 = !DILocation(line: 126, column: 5, scope: !128)
!134 = distinct !DISubprogram(name: "example_mayo", scope: !129, file: !129, line: 25, type: !135, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !120, retainedNodes: !28)
!135 = !DISubroutineType(types: !136)
!136 = !{!45, !137}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 32)
!138 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !139)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !36, line: 289, baseType: !140)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !36, line: 265, size: 736, elements: !141)
!141 = !{!142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164}
!142 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !140, file: !36, line: 266, baseType: !45, size: 32)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !140, file: !36, line: 267, baseType: !45, size: 32, offset: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !140, file: !36, line: 268, baseType: !45, size: 32, offset: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !140, file: !36, line: 269, baseType: !45, size: 32, offset: 96)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !140, file: !36, line: 270, baseType: !45, size: 32, offset: 128)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !140, file: !36, line: 271, baseType: !49, size: 32, offset: 160)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !140, file: !36, line: 272, baseType: !45, size: 32, offset: 192)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !140, file: !36, line: 273, baseType: !45, size: 32, offset: 224)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !140, file: !36, line: 274, baseType: !45, size: 32, offset: 256)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !140, file: !36, line: 275, baseType: !45, size: 32, offset: 288)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !140, file: !36, line: 276, baseType: !45, size: 32, offset: 320)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !140, file: !36, line: 277, baseType: !45, size: 32, offset: 352)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !140, file: !36, line: 278, baseType: !45, size: 32, offset: 384)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !140, file: !36, line: 279, baseType: !45, size: 32, offset: 416)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !140, file: !36, line: 280, baseType: !45, size: 32, offset: 448)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !140, file: !36, line: 281, baseType: !45, size: 32, offset: 480)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !140, file: !36, line: 282, baseType: !45, size: 32, offset: 512)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !140, file: !36, line: 283, baseType: !45, size: 32, offset: 544)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !140, file: !36, line: 284, baseType: !45, size: 32, offset: 576)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !140, file: !36, line: 285, baseType: !45, size: 32, offset: 608)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !140, file: !36, line: 286, baseType: !45, size: 32, offset: 640)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !140, file: !36, line: 287, baseType: !45, size: 32, offset: 672)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !140, file: !36, line: 288, baseType: !165, size: 32, offset: 704)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !167)
!167 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!168 = !DILocalVariable(name: "p", arg: 1, scope: !134, file: !129, line: 25, type: !137)
!169 = !DILocation(line: 0, scope: !134)
!170 = !DILocalVariable(name: "msglen", scope: !134, file: !129, line: 27, type: !15)
!171 = !DILocation(line: 27, column: 12, scope: !134)
!172 = !DILocalVariable(name: "smlen", scope: !134, file: !129, line: 28, type: !15)
!173 = !DILocation(line: 28, column: 12, scope: !134)
!174 = !DILocation(line: 30, column: 26, scope: !134)
!175 = !DILocalVariable(name: "pk", scope: !134, file: !129, line: 30, type: !18)
!176 = !DILocation(line: 31, column: 26, scope: !134)
!177 = !DILocalVariable(name: "sk", scope: !134, file: !129, line: 31, type: !18)
!178 = !DILocalVariable(name: "epk", scope: !134, file: !129, line: 32, type: !179)
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "pk_t", file: !36, line: 295, baseType: !180)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1197120, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 18705)
!183 = !DILocation(line: 32, column: 10, scope: !134)
!184 = !DILocalVariable(name: "esk", scope: !134, file: !129, line: 33, type: !185)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !36, line: 291, baseType: !186)
!186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1190592, elements: !187)
!187 = !{!188}
!188 = !DISubrange(count: 18603)
!189 = !DILocation(line: 33, column: 10, scope: !134)
!190 = !DILocation(line: 35, column: 54, scope: !134)
!191 = !DILocation(line: 35, column: 52, scope: !134)
!192 = !DILocation(line: 35, column: 26, scope: !134)
!193 = !DILocalVariable(name: "sig", scope: !134, file: !129, line: 35, type: !18)
!194 = !DILocalVariable(name: "msg", scope: !134, file: !129, line: 37, type: !112)
!195 = !DILocation(line: 37, column: 19, scope: !134)
!196 = !DILocalVariable(name: "msg2", scope: !134, file: !129, line: 38, type: !112)
!197 = !DILocation(line: 38, column: 19, scope: !134)
!198 = !DILocation(line: 41, column: 15, scope: !134)
!199 = !DILocalVariable(name: "res", scope: !134, file: !129, line: 41, type: !45)
!200 = !DILocation(line: 48, column: 11, scope: !134)
!201 = !DILocation(line: 55, column: 11, scope: !134)
!202 = !DILocation(line: 62, column: 42, scope: !134)
!203 = !DILocation(line: 62, column: 11, scope: !134)
!204 = !DILocation(line: 69, column: 44, scope: !134)
!205 = !DILocation(line: 69, column: 11, scope: !134)
!206 = !DILocation(line: 70, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !134, file: !129, line: 70, column: 9)
!208 = !DILocation(line: 70, column: 24, scope: !207)
!209 = !DILocation(line: 70, column: 45, scope: !207)
!210 = !DILocation(line: 70, column: 27, scope: !207)
!211 = !DILocation(line: 77, column: 31, scope: !134)
!212 = !DILocation(line: 77, column: 11, scope: !134)
!213 = !DILocation(line: 78, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !134, file: !129, line: 78, column: 9)
!215 = !DILabel(scope: !134, name: "err", file: !129, line: 109)
!216 = !DILocation(line: 109, column: 1, scope: !134)
!217 = !DILocation(line: 110, column: 5, scope: !134)
!218 = !DILocation(line: 111, column: 5, scope: !134)
!219 = !DILocation(line: 112, column: 5, scope: !134)
!220 = !DILocation(line: 113, column: 5, scope: !134)
!221 = distinct !DISubprogram(name: "mayo_memset", scope: !222, file: !222, line: 3, type: !223, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !122, retainedNodes: !28)
!222 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!223 = !DISubroutineType(types: !224)
!224 = !{null, !69, !12, !19}
!225 = !DILocalVariable(name: "dst", arg: 1, scope: !221, file: !222, line: 3, type: !69)
!226 = !DILocation(line: 0, scope: !221)
!227 = !DILocalVariable(name: "val", arg: 2, scope: !221, file: !222, line: 3, type: !12)
!228 = !DILocalVariable(name: "len", arg: 3, scope: !221, file: !222, line: 3, type: !19)
!229 = !DILocalVariable(name: "d", scope: !221, file: !222, line: 5, type: !11)
!230 = !DILocalVariable(name: "i", scope: !231, file: !222, line: 7, type: !19)
!231 = distinct !DILexicalBlock(scope: !221, file: !222, line: 7, column: 5)
!232 = !DILocation(line: 0, scope: !231)
!233 = !DILocation(line: 7, column: 10, scope: !231)
!234 = !DILocation(line: 7, scope: !231)
!235 = !DILocation(line: 7, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !231, file: !222, line: 7, column: 5)
!237 = !DILocation(line: 7, column: 5, scope: !231)
!238 = !DILocation(line: 8, column: 9, scope: !236)
!239 = !DILocation(line: 8, column: 14, scope: !236)
!240 = !DILocation(line: 7, column: 36, scope: !236)
!241 = !DILocation(line: 7, column: 5, scope: !236)
!242 = distinct !{!242, !237, !243, !244}
!243 = !DILocation(line: 8, column: 16, scope: !231)
!244 = !{!"llvm.loop.mustprogress"}
!245 = !DILocation(line: 9, column: 1, scope: !221)
!246 = distinct !DISubprogram(name: "mayo_memcpy", scope: !222, file: !222, line: 11, type: !247, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !122, retainedNodes: !28)
!247 = !DISubroutineType(types: !248)
!248 = !{null, !69, !249, !19}
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 32)
!250 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!251 = !DILocalVariable(name: "dst", arg: 1, scope: !246, file: !222, line: 11, type: !69)
!252 = !DILocation(line: 0, scope: !246)
!253 = !DILocalVariable(name: "src", arg: 2, scope: !246, file: !222, line: 11, type: !249)
!254 = !DILocalVariable(name: "len", arg: 3, scope: !246, file: !222, line: 11, type: !19)
!255 = !DILocalVariable(name: "d", scope: !246, file: !222, line: 13, type: !11)
!256 = !DILocalVariable(name: "s", scope: !246, file: !222, line: 14, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 32)
!258 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!259 = !DILocalVariable(name: "i", scope: !260, file: !222, line: 16, type: !19)
!260 = distinct !DILexicalBlock(scope: !246, file: !222, line: 16, column: 5)
!261 = !DILocation(line: 0, scope: !260)
!262 = !DILocation(line: 16, column: 10, scope: !260)
!263 = !DILocation(line: 16, scope: !260)
!264 = !DILocation(line: 16, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !222, line: 16, column: 5)
!266 = !DILocation(line: 16, column: 5, scope: !260)
!267 = !DILocation(line: 17, column: 16, scope: !265)
!268 = !DILocation(line: 17, column: 9, scope: !265)
!269 = !DILocation(line: 17, column: 14, scope: !265)
!270 = !DILocation(line: 16, column: 36, scope: !265)
!271 = !DILocation(line: 16, column: 5, scope: !265)
!272 = distinct !{!272, !266, !273, !244}
!273 = !DILocation(line: 17, column: 19, scope: !260)
!274 = !DILocation(line: 18, column: 1, scope: !246)
!275 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair", scope: !25, file: !25, line: 312, type: !276, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!276 = !DISubroutineType(types: !277)
!277 = !{!45, !278, !18, !18}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 32)
!279 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !280)
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !36, line: 289, baseType: !281)
!281 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !36, line: 265, size: 736, elements: !282)
!282 = !{!283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !281, file: !36, line: 266, baseType: !45, size: 32)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !281, file: !36, line: 267, baseType: !45, size: 32, offset: 32)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !281, file: !36, line: 268, baseType: !45, size: 32, offset: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !281, file: !36, line: 269, baseType: !45, size: 32, offset: 96)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !281, file: !36, line: 270, baseType: !45, size: 32, offset: 128)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !281, file: !36, line: 271, baseType: !49, size: 32, offset: 160)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !281, file: !36, line: 272, baseType: !45, size: 32, offset: 192)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !281, file: !36, line: 273, baseType: !45, size: 32, offset: 224)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !281, file: !36, line: 274, baseType: !45, size: 32, offset: 256)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !281, file: !36, line: 275, baseType: !45, size: 32, offset: 288)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !281, file: !36, line: 276, baseType: !45, size: 32, offset: 320)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !281, file: !36, line: 277, baseType: !45, size: 32, offset: 352)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !281, file: !36, line: 278, baseType: !45, size: 32, offset: 384)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !281, file: !36, line: 279, baseType: !45, size: 32, offset: 416)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !281, file: !36, line: 280, baseType: !45, size: 32, offset: 448)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !281, file: !36, line: 281, baseType: !45, size: 32, offset: 480)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !281, file: !36, line: 282, baseType: !45, size: 32, offset: 512)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !281, file: !36, line: 283, baseType: !45, size: 32, offset: 544)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !281, file: !36, line: 284, baseType: !45, size: 32, offset: 576)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !281, file: !36, line: 285, baseType: !45, size: 32, offset: 608)
!303 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !281, file: !36, line: 286, baseType: !45, size: 32, offset: 640)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !281, file: !36, line: 287, baseType: !45, size: 32, offset: 672)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !281, file: !36, line: 288, baseType: !165, size: 32, offset: 704)
!306 = !DILocalVariable(name: "p", arg: 1, scope: !275, file: !25, line: 312, type: !278)
!307 = !DILocation(line: 0, scope: !275)
!308 = !DILocalVariable(name: "pk", arg: 2, scope: !275, file: !25, line: 312, type: !18)
!309 = !DILocalVariable(name: "sk", arg: 3, scope: !275, file: !25, line: 312, type: !18)
!310 = !DILocalVariable(name: "ret", scope: !275, file: !25, line: 313, type: !45)
!311 = !DILocation(line: 315, column: 9, scope: !275)
!312 = !DILabel(scope: !275, name: "err", file: !25, line: 320)
!313 = !DILocation(line: 320, column: 1, scope: !275)
!314 = !DILocation(line: 321, column: 3, scope: !275)
!315 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair_compact", scope: !25, file: !25, line: 549, type: !276, scopeLine: 550, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!316 = !DILocalVariable(name: "p", arg: 1, scope: !315, file: !25, line: 549, type: !278)
!317 = !DILocation(line: 0, scope: !315)
!318 = !DILocalVariable(name: "cpk", arg: 2, scope: !315, file: !25, line: 549, type: !18)
!319 = !DILocalVariable(name: "csk", arg: 3, scope: !315, file: !25, line: 550, type: !18)
!320 = !DILocalVariable(name: "ret", scope: !315, file: !25, line: 551, type: !45)
!321 = !DILocalVariable(name: "seed_sk", scope: !315, file: !25, line: 552, type: !18)
!322 = !DILocalVariable(name: "S", scope: !315, file: !25, line: 553, type: !323)
!323 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 2624, elements: !324)
!324 = !{!325}
!325 = !DISubrange(count: 328)
!326 = !DILocation(line: 553, column: 17, scope: !315)
!327 = !DILocalVariable(name: "P", scope: !315, file: !25, line: 554, type: !328)
!328 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1185600, elements: !329)
!329 = !{!330}
!330 = !DISubrange(count: 18525)
!331 = !DILocation(line: 554, column: 12, scope: !315)
!332 = !DILocalVariable(name: "P3", scope: !315, file: !25, line: 555, type: !333)
!333 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 20480, elements: !334)
!334 = !{!335}
!335 = !DISubrange(count: 320)
!336 = !DILocation(line: 555, column: 12, scope: !315)
!337 = !DILocalVariable(name: "O", scope: !315, file: !25, line: 558, type: !338)
!338 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4992, elements: !339)
!339 = !{!340}
!340 = !DISubrange(count: 624)
!341 = !DILocation(line: 558, column: 17, scope: !315)
!342 = !DILocalVariable(name: "m_vec_limbs", scope: !315, file: !25, line: 560, type: !343)
!343 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!344 = !DILocalVariable(name: "param_m", scope: !315, file: !25, line: 561, type: !343)
!345 = !DILocalVariable(name: "param_v", scope: !315, file: !25, line: 562, type: !343)
!346 = !DILocalVariable(name: "param_o", scope: !315, file: !25, line: 563, type: !343)
!347 = !DILocalVariable(name: "param_O_bytes", scope: !315, file: !25, line: 564, type: !343)
!348 = !DILocalVariable(name: "param_P1_limbs", scope: !315, file: !25, line: 565, type: !343)
!349 = !DILocalVariable(name: "param_P3_limbs", scope: !315, file: !25, line: 566, type: !343)
!350 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !315, file: !25, line: 567, type: !343)
!351 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !315, file: !25, line: 568, type: !343)
!352 = !DILocalVariable(name: "P1", scope: !315, file: !25, line: 570, type: !5)
!353 = !DILocation(line: 571, column: 20, scope: !315)
!354 = !DILocalVariable(name: "P2", scope: !315, file: !25, line: 571, type: !5)
!355 = !DILocation(line: 577, column: 7, scope: !356)
!356 = distinct !DILexicalBlock(scope: !315, file: !25, line: 577, column: 7)
!357 = !DILocation(line: 584, column: 3, scope: !315)
!358 = !DILocalVariable(name: "seed_pk", scope: !315, file: !25, line: 557, type: !18)
!359 = !DILocation(line: 590, column: 12, scope: !315)
!360 = !DILocation(line: 590, column: 3, scope: !315)
!361 = !DILocation(line: 596, column: 3, scope: !315)
!362 = !DILocation(line: 599, column: 3, scope: !315)
!363 = !DILocation(line: 602, column: 3, scope: !315)
!364 = !DILocalVariable(name: "P3_upper", scope: !315, file: !25, line: 604, type: !365)
!365 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 11520, elements: !366)
!366 = !{!367}
!367 = !DISubrange(count: 180)
!368 = !DILocation(line: 604, column: 12, scope: !315)
!369 = !DILocation(line: 607, column: 3, scope: !315)
!370 = !DILocation(line: 608, column: 29, scope: !315)
!371 = !DILocation(line: 608, column: 3, scope: !315)
!372 = !DILabel(scope: !315, name: "err", file: !25, line: 612)
!373 = !DILocation(line: 612, column: 1, scope: !315)
!374 = !DILocation(line: 614, column: 3, scope: !315)
!375 = !DILocation(line: 615, column: 3, scope: !315)
!376 = !DILocation(line: 616, column: 3, scope: !315)
!377 = !DILocation(line: 617, column: 3, scope: !315)
!378 = distinct !DISubprogram(name: "decode", scope: !25, file: !25, line: 21, type: !379, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !49, !18, !45}
!381 = !DILocalVariable(name: "m", arg: 1, scope: !378, file: !25, line: 21, type: !49)
!382 = !DILocation(line: 0, scope: !378)
!383 = !DILocalVariable(name: "mdec", arg: 2, scope: !378, file: !25, line: 21, type: !18)
!384 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !378, file: !25, line: 21, type: !45)
!385 = !DILocalVariable(name: "i", scope: !378, file: !25, line: 22, type: !45)
!386 = !DILocation(line: 23, column: 8, scope: !387)
!387 = distinct !DILexicalBlock(scope: !378, file: !25, line: 23, column: 3)
!388 = !DILocation(line: 23, scope: !387)
!389 = !DILocation(line: 23, column: 27, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !25, line: 23, column: 3)
!391 = !DILocation(line: 23, column: 17, scope: !390)
!392 = !DILocation(line: 23, column: 3, scope: !387)
!393 = !DILocation(line: 24, column: 15, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !25, line: 23, column: 37)
!395 = !DILocation(line: 24, column: 20, scope: !394)
!396 = !DILocation(line: 24, column: 10, scope: !394)
!397 = !DILocation(line: 24, column: 13, scope: !394)
!398 = !DILocation(line: 25, column: 15, scope: !394)
!399 = !DILocation(line: 25, column: 20, scope: !394)
!400 = !DILocation(line: 25, column: 13, scope: !394)
!401 = !DILocation(line: 25, column: 10, scope: !394)
!402 = !DILocation(line: 23, column: 32, scope: !390)
!403 = !DILocation(line: 23, column: 3, scope: !390)
!404 = distinct !{!404, !392, !405, !244}
!405 = !DILocation(line: 26, column: 3, scope: !387)
!406 = !DILocation(line: 28, column: 19, scope: !407)
!407 = distinct !DILexicalBlock(scope: !378, file: !25, line: 28, column: 7)
!408 = !DILocation(line: 29, column: 15, scope: !409)
!409 = distinct !DILexicalBlock(scope: !407, file: !25, line: 28, column: 25)
!410 = !DILocation(line: 29, column: 20, scope: !409)
!411 = !DILocation(line: 29, column: 13, scope: !409)
!412 = !DILocation(line: 30, column: 3, scope: !409)
!413 = !DILocation(line: 32, column: 1, scope: !378)
!414 = distinct !DISubprogram(name: "expand_P1_P2", scope: !25, file: !25, line: 287, type: !415, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!415 = !DISubroutineType(types: !416)
!416 = !{null, !278, !5, !49}
!417 = !DILocalVariable(name: "p", arg: 1, scope: !414, file: !25, line: 287, type: !278)
!418 = !DILocation(line: 0, scope: !414)
!419 = !DILocalVariable(name: "P", arg: 2, scope: !414, file: !25, line: 287, type: !5)
!420 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !414, file: !25, line: 288, type: !49)
!421 = !DILocation(line: 292, column: 3, scope: !414)
!422 = !DILocation(line: 294, column: 3, scope: !414)
!423 = !DILocation(line: 298, column: 1, scope: !414)
!424 = distinct !DISubprogram(name: "compute_P3", scope: !425, file: !425, line: 268, type: !426, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!425 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!426 = !DISubroutineType(types: !427)
!427 = !{null, !278, !428, !5, !49, !5}
!428 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 32)
!429 = !DILocalVariable(name: "p", arg: 1, scope: !424, file: !425, line: 268, type: !278)
!430 = !DILocation(line: 0, scope: !424)
!431 = !DILocalVariable(name: "P1", arg: 2, scope: !424, file: !425, line: 268, type: !428)
!432 = !DILocalVariable(name: "P2", arg: 3, scope: !424, file: !425, line: 268, type: !5)
!433 = !DILocalVariable(name: "O", arg: 4, scope: !424, file: !425, line: 268, type: !49)
!434 = !DILocalVariable(name: "P3", arg: 5, scope: !424, file: !425, line: 268, type: !5)
!435 = !DILocalVariable(name: "m_vec_limbs", scope: !424, file: !425, line: 270, type: !343)
!436 = !DILocalVariable(name: "param_v", scope: !424, file: !425, line: 271, type: !343)
!437 = !DILocalVariable(name: "param_o", scope: !424, file: !425, line: 272, type: !343)
!438 = !DILocation(line: 275, column: 5, scope: !424)
!439 = !DILocation(line: 278, column: 5, scope: !424)
!440 = !DILocation(line: 281, column: 1, scope: !424)
!441 = distinct !DISubprogram(name: "pack_m_vecs", scope: !25, file: !25, line: 279, type: !442, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!442 = !DISubroutineType(types: !443)
!443 = !{null, !428, !18, !45, !45}
!444 = !DILocalVariable(name: "in", arg: 1, scope: !441, file: !25, line: 279, type: !428)
!445 = !DILocation(line: 0, scope: !441)
!446 = !DILocalVariable(name: "out", arg: 2, scope: !441, file: !25, line: 279, type: !18)
!447 = !DILocalVariable(name: "vecs", arg: 3, scope: !441, file: !25, line: 279, type: !45)
!448 = !DILocalVariable(name: "m", arg: 4, scope: !441, file: !25, line: 280, type: !45)
!449 = !DILocalVariable(name: "m_vec_limbs", scope: !441, file: !25, line: 281, type: !343)
!450 = !DILocalVariable(name: "_in", scope: !441, file: !25, line: 282, type: !18)
!451 = !DILocalVariable(name: "i", scope: !452, file: !25, line: 283, type: !45)
!452 = distinct !DILexicalBlock(scope: !441, file: !25, line: 283, column: 3)
!453 = !DILocation(line: 0, scope: !452)
!454 = !DILocation(line: 283, column: 8, scope: !452)
!455 = !DILocation(line: 283, scope: !452)
!456 = !DILocation(line: 283, column: 21, scope: !457)
!457 = distinct !DILexicalBlock(scope: !452, file: !25, line: 283, column: 3)
!458 = !DILocation(line: 283, column: 3, scope: !452)
!459 = !DILocation(line: 284, column: 26, scope: !460)
!460 = distinct !DILexicalBlock(scope: !457, file: !25, line: 283, column: 34)
!461 = !DILocation(line: 284, column: 17, scope: !460)
!462 = !DILocation(line: 284, column: 54, scope: !460)
!463 = !DILocation(line: 284, column: 36, scope: !460)
!464 = !DILocation(line: 284, column: 5, scope: !460)
!465 = !DILocation(line: 283, column: 30, scope: !457)
!466 = !DILocation(line: 283, column: 3, scope: !457)
!467 = distinct !{!467, !458, !468, !244}
!468 = !DILocation(line: 285, column: 3, scope: !452)
!469 = !DILocation(line: 286, column: 1, scope: !441)
!470 = distinct !DISubprogram(name: "P1_times_O", scope: !425, file: !425, line: 76, type: !471, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !278, !428, !49, !5}
!473 = !DILocalVariable(name: "p", arg: 1, scope: !470, file: !425, line: 76, type: !278)
!474 = !DILocation(line: 0, scope: !470)
!475 = !DILocalVariable(name: "P1", arg: 2, scope: !470, file: !425, line: 76, type: !428)
!476 = !DILocalVariable(name: "O", arg: 3, scope: !470, file: !425, line: 76, type: !49)
!477 = !DILocalVariable(name: "acc", arg: 4, scope: !470, file: !425, line: 76, type: !5)
!478 = !DILocation(line: 80, column: 5, scope: !470)
!479 = !DILocation(line: 83, column: 1, scope: !470)
!480 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !425, file: !425, line: 47, type: !481, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!481 = !DISubroutineType(types: !482)
!482 = !{null, !343, !49, !428, !5, !343, !343, !343}
!483 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !480, file: !425, line: 47, type: !343)
!484 = !DILocation(line: 0, scope: !480)
!485 = !DILocalVariable(name: "mat", arg: 2, scope: !480, file: !425, line: 47, type: !49)
!486 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !480, file: !425, line: 47, type: !428)
!487 = !DILocalVariable(name: "acc", arg: 4, scope: !480, file: !425, line: 47, type: !5)
!488 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !480, file: !425, line: 48, type: !343)
!489 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !480, file: !425, line: 48, type: !343)
!490 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !480, file: !425, line: 48, type: !343)
!491 = !DILocalVariable(name: "r", scope: !492, file: !425, line: 50, type: !45)
!492 = distinct !DILexicalBlock(scope: !480, file: !425, line: 50, column: 5)
!493 = !DILocation(line: 0, scope: !492)
!494 = !DILocation(line: 50, column: 10, scope: !492)
!495 = !DILocation(line: 50, scope: !492)
!496 = !DILocation(line: 50, column: 23, scope: !497)
!497 = distinct !DILexicalBlock(scope: !492, file: !425, line: 50, column: 5)
!498 = !DILocation(line: 50, column: 5, scope: !492)
!499 = !DILocation(line: 51, column: 9, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !425, line: 51, column: 9)
!501 = distinct !DILexicalBlock(scope: !497, file: !425, line: 50, column: 40)
!502 = !DILocation(line: 51, scope: !500)
!503 = !DILocalVariable(name: "c", scope: !500, file: !425, line: 51, type: !45)
!504 = !DILocation(line: 0, scope: !500)
!505 = !DILocation(line: 51, column: 27, scope: !506)
!506 = distinct !DILexicalBlock(scope: !500, file: !425, line: 51, column: 9)
!507 = !DILocation(line: 52, column: 13, scope: !508)
!508 = distinct !DILexicalBlock(scope: !509, file: !425, line: 52, column: 13)
!509 = distinct !DILexicalBlock(scope: !506, file: !425, line: 51, column: 44)
!510 = !DILocation(line: 52, scope: !508)
!511 = !DILocalVariable(name: "k", scope: !508, file: !425, line: 52, type: !45)
!512 = !DILocation(line: 0, scope: !508)
!513 = !DILocation(line: 52, column: 31, scope: !514)
!514 = distinct !DILexicalBlock(scope: !508, file: !425, line: 52, column: 13)
!515 = !DILocation(line: 53, column: 70, scope: !516)
!516 = distinct !DILexicalBlock(scope: !514, file: !425, line: 52, column: 54)
!517 = !DILocation(line: 53, column: 84, scope: !516)
!518 = !DILocation(line: 53, column: 51, scope: !516)
!519 = !DILocation(line: 53, column: 96, scope: !516)
!520 = !DILocation(line: 53, column: 90, scope: !516)
!521 = !DILocation(line: 53, column: 136, scope: !516)
!522 = !DILocation(line: 53, column: 150, scope: !516)
!523 = !DILocation(line: 53, column: 117, scope: !516)
!524 = !DILocation(line: 53, column: 17, scope: !516)
!525 = !DILocation(line: 52, column: 48, scope: !514)
!526 = !DILocation(line: 52, column: 13, scope: !514)
!527 = distinct !{!527, !507, !528, !244}
!528 = !DILocation(line: 54, column: 13, scope: !508)
!529 = !DILocation(line: 51, column: 40, scope: !506)
!530 = !DILocation(line: 51, column: 9, scope: !506)
!531 = distinct !{!531, !499, !532, !244}
!532 = !DILocation(line: 55, column: 9, scope: !500)
!533 = !DILocation(line: 50, column: 36, scope: !497)
!534 = !DILocation(line: 50, column: 5, scope: !497)
!535 = distinct !{!535, !498, !536, !244}
!536 = !DILocation(line: 56, column: 5, scope: !492)
!537 = !DILocation(line: 59, column: 1, scope: !480)
!538 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !539, file: !539, line: 31, type: !540, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!539 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!540 = !DISubroutineType(types: !541)
!541 = !{null, !45, !428, !14, !5}
!542 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !538, file: !539, line: 31, type: !45)
!543 = !DILocation(line: 0, scope: !538)
!544 = !DILocalVariable(name: "in", arg: 2, scope: !538, file: !539, line: 31, type: !428)
!545 = !DILocalVariable(name: "a", arg: 3, scope: !538, file: !539, line: 31, type: !14)
!546 = !DILocalVariable(name: "acc", arg: 4, scope: !538, file: !539, line: 31, type: !5)
!547 = !DILocation(line: 33, column: 20, scope: !538)
!548 = !DILocalVariable(name: "tab", scope: !538, file: !539, line: 33, type: !19)
!549 = !DILocalVariable(name: "lsb_ask", scope: !538, file: !539, line: 35, type: !6)
!550 = !DILocalVariable(name: "i", scope: !551, file: !539, line: 37, type: !45)
!551 = distinct !DILexicalBlock(scope: !538, file: !539, line: 37, column: 5)
!552 = !DILocation(line: 0, scope: !551)
!553 = !DILocation(line: 37, column: 9, scope: !551)
!554 = !DILocation(line: 37, scope: !551)
!555 = !DILocation(line: 37, column: 20, scope: !556)
!556 = distinct !DILexicalBlock(scope: !551, file: !539, line: 37, column: 5)
!557 = !DILocation(line: 37, column: 5, scope: !551)
!558 = !DILocation(line: 38, column: 21, scope: !559)
!559 = distinct !DILexicalBlock(scope: !556, file: !539, line: 37, column: 43)
!560 = !DILocation(line: 38, column: 33, scope: !559)
!561 = !DILocation(line: 38, column: 51, scope: !559)
!562 = !DILocation(line: 38, column: 46, scope: !559)
!563 = !DILocation(line: 38, column: 44, scope: !559)
!564 = !DILocation(line: 39, column: 27, scope: !559)
!565 = !DILocation(line: 39, column: 33, scope: !559)
!566 = !DILocation(line: 39, column: 52, scope: !559)
!567 = !DILocation(line: 39, column: 59, scope: !559)
!568 = !DILocation(line: 39, column: 46, scope: !559)
!569 = !DILocation(line: 39, column: 44, scope: !559)
!570 = !DILocation(line: 39, column: 17, scope: !559)
!571 = !DILocation(line: 40, column: 21, scope: !559)
!572 = !DILocation(line: 40, column: 27, scope: !559)
!573 = !DILocation(line: 40, column: 33, scope: !559)
!574 = !DILocation(line: 40, column: 52, scope: !559)
!575 = !DILocation(line: 40, column: 59, scope: !559)
!576 = !DILocation(line: 40, column: 46, scope: !559)
!577 = !DILocation(line: 40, column: 44, scope: !559)
!578 = !DILocation(line: 40, column: 17, scope: !559)
!579 = !DILocation(line: 41, column: 21, scope: !559)
!580 = !DILocation(line: 41, column: 27, scope: !559)
!581 = !DILocation(line: 41, column: 33, scope: !559)
!582 = !DILocation(line: 41, column: 52, scope: !559)
!583 = !DILocation(line: 41, column: 59, scope: !559)
!584 = !DILocation(line: 41, column: 46, scope: !559)
!585 = !DILocation(line: 41, column: 44, scope: !559)
!586 = !DILocation(line: 41, column: 17, scope: !559)
!587 = !DILocation(line: 38, column: 9, scope: !559)
!588 = !DILocation(line: 38, column: 16, scope: !559)
!589 = !DILocation(line: 37, column: 40, scope: !556)
!590 = !DILocation(line: 37, column: 5, scope: !556)
!591 = distinct !{!591, !557, !592, !244}
!592 = !DILocation(line: 42, column: 5, scope: !551)
!593 = !DILocation(line: 44, column: 1, scope: !538)
!594 = distinct !DISubprogram(name: "mul_table", scope: !595, file: !595, line: 136, type: !596, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!595 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!596 = !DISubroutineType(types: !597)
!597 = !{!19, !12}
!598 = !DILocalVariable(name: "b", arg: 1, scope: !594, file: !595, line: 136, type: !12)
!599 = !DILocation(line: 0, scope: !594)
!600 = !DILocation(line: 137, column: 19, scope: !594)
!601 = !DILocation(line: 137, column: 33, scope: !594)
!602 = !DILocalVariable(name: "x", scope: !594, file: !595, line: 137, type: !19)
!603 = !DILocalVariable(name: "high_nibble_mask", scope: !594, file: !595, line: 139, type: !19)
!604 = !DILocation(line: 141, column: 28, scope: !594)
!605 = !DILocalVariable(name: "high_half", scope: !594, file: !595, line: 141, type: !19)
!606 = !DILocation(line: 142, column: 28, scope: !594)
!607 = !DILocation(line: 142, column: 47, scope: !594)
!608 = !DILocation(line: 142, column: 34, scope: !594)
!609 = !DILocation(line: 142, column: 5, scope: !594)
!610 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !425, file: !425, line: 16, type: !611, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!611 = !DISubroutineType(types: !612)
!612 = !{null, !343, !428, !49, !5, !343, !343, !343, !343}
!613 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !610, file: !425, line: 16, type: !343)
!614 = !DILocation(line: 0, scope: !610)
!615 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !610, file: !425, line: 16, type: !428)
!616 = !DILocalVariable(name: "mat", arg: 3, scope: !610, file: !425, line: 16, type: !49)
!617 = !DILocalVariable(name: "acc", arg: 4, scope: !610, file: !425, line: 16, type: !5)
!618 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !610, file: !425, line: 17, type: !343)
!619 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !610, file: !425, line: 17, type: !343)
!620 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !610, file: !425, line: 17, type: !343)
!621 = !DILocalVariable(name: "triangular", arg: 8, scope: !610, file: !425, line: 17, type: !343)
!622 = !DILocalVariable(name: "bs_mat_entries_used", scope: !610, file: !425, line: 19, type: !45)
!623 = !DILocalVariable(name: "r", scope: !624, file: !425, line: 20, type: !45)
!624 = distinct !DILexicalBlock(scope: !610, file: !425, line: 20, column: 5)
!625 = !DILocation(line: 0, scope: !624)
!626 = !DILocation(line: 20, column: 10, scope: !624)
!627 = !DILocation(line: 19, column: 9, scope: !610)
!628 = !DILocation(line: 20, scope: !624)
!629 = !DILocation(line: 20, column: 23, scope: !630)
!630 = distinct !DILexicalBlock(scope: !624, file: !425, line: 20, column: 5)
!631 = !DILocation(line: 20, column: 5, scope: !624)
!632 = !DILocation(line: 21, column: 9, scope: !633)
!633 = distinct !DILexicalBlock(scope: !634, file: !425, line: 21, column: 9)
!634 = distinct !DILexicalBlock(scope: !630, file: !425, line: 20, column: 43)
!635 = !DILocation(line: 21, scope: !633)
!636 = !DILocalVariable(name: "c", scope: !633, file: !425, line: 21, type: !45)
!637 = !DILocation(line: 0, scope: !633)
!638 = !DILocation(line: 21, column: 40, scope: !639)
!639 = distinct !DILexicalBlock(scope: !633, file: !425, line: 21, column: 9)
!640 = !DILocation(line: 22, column: 13, scope: !641)
!641 = distinct !DILexicalBlock(scope: !642, file: !425, line: 22, column: 13)
!642 = distinct !DILexicalBlock(scope: !639, file: !425, line: 21, column: 60)
!643 = !DILocation(line: 22, scope: !641)
!644 = !DILocalVariable(name: "k", scope: !641, file: !425, line: 22, type: !45)
!645 = !DILocation(line: 0, scope: !641)
!646 = !DILocation(line: 22, column: 31, scope: !647)
!647 = distinct !DILexicalBlock(scope: !641, file: !425, line: 22, column: 13)
!648 = !DILocation(line: 23, column: 51, scope: !649)
!649 = distinct !DILexicalBlock(scope: !647, file: !425, line: 22, column: 51)
!650 = !DILocation(line: 23, column: 94, scope: !649)
!651 = !DILocation(line: 23, column: 88, scope: !649)
!652 = !DILocation(line: 23, column: 134, scope: !649)
!653 = !DILocation(line: 23, column: 145, scope: !649)
!654 = !DILocation(line: 23, column: 115, scope: !649)
!655 = !DILocation(line: 23, column: 17, scope: !649)
!656 = !DILocation(line: 22, column: 45, scope: !647)
!657 = !DILocation(line: 22, column: 13, scope: !647)
!658 = distinct !{!658, !640, !659, !244}
!659 = !DILocation(line: 24, column: 13, scope: !641)
!660 = !DILocation(line: 25, column: 33, scope: !642)
!661 = !DILocation(line: 21, column: 56, scope: !639)
!662 = !DILocation(line: 21, column: 9, scope: !639)
!663 = distinct !{!663, !632, !664, !244}
!664 = !DILocation(line: 26, column: 9, scope: !633)
!665 = !DILocation(line: 20, column: 39, scope: !630)
!666 = !DILocation(line: 20, column: 5, scope: !630)
!667 = distinct !{!667, !631, !668, !244}
!668 = !DILocation(line: 27, column: 5, scope: !624)
!669 = !DILocation(line: 28, column: 1, scope: !610)
!670 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !25, file: !25, line: 268, type: !671, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!671 = !DISubroutineType(types: !672)
!672 = !{null, !49, !5, !45, !45}
!673 = !DILocalVariable(name: "in", arg: 1, scope: !670, file: !25, line: 268, type: !49)
!674 = !DILocation(line: 0, scope: !670)
!675 = !DILocalVariable(name: "out", arg: 2, scope: !670, file: !25, line: 268, type: !5)
!676 = !DILocalVariable(name: "vecs", arg: 3, scope: !670, file: !25, line: 268, type: !45)
!677 = !DILocalVariable(name: "m", arg: 4, scope: !670, file: !25, line: 269, type: !45)
!678 = !DILocalVariable(name: "m_vec_limbs", scope: !670, file: !25, line: 270, type: !343)
!679 = !DILocalVariable(name: "_out", scope: !670, file: !25, line: 271, type: !18)
!680 = !DILocalVariable(name: "tmp", scope: !670, file: !25, line: 272, type: !681)
!681 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !682)
!682 = !{!683}
!683 = !DISubrange(count: 5)
!684 = !DILocation(line: 272, column: 12, scope: !670)
!685 = !DILocalVariable(name: "i", scope: !686, file: !25, line: 273, type: !45)
!686 = distinct !DILexicalBlock(scope: !670, file: !25, line: 273, column: 3)
!687 = !DILocation(line: 0, scope: !686)
!688 = !DILocation(line: 273, column: 8, scope: !686)
!689 = !DILocation(line: 273, column: 28, scope: !690)
!690 = distinct !DILexicalBlock(scope: !686, file: !25, line: 273, column: 3)
!691 = !DILocation(line: 273, column: 3, scope: !686)
!692 = !DILocation(line: 273, scope: !686)
!693 = !DILocation(line: 274, column: 28, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !25, line: 273, column: 39)
!695 = !DILocation(line: 274, column: 20, scope: !694)
!696 = !DILocation(line: 274, column: 5, scope: !694)
!697 = !DILocation(line: 275, column: 35, scope: !694)
!698 = !DILocation(line: 275, column: 17, scope: !694)
!699 = !DILocation(line: 275, column: 5, scope: !694)
!700 = !DILocation(line: 273, column: 3, scope: !690)
!701 = distinct !{!701, !691, !702, !244}
!702 = !DILocation(line: 277, column: 3, scope: !686)
!703 = !DILocation(line: 278, column: 1, scope: !670)
!704 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_sk", scope: !25, file: !25, line: 324, type: !705, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!705 = !DISubroutineType(types: !706)
!706 = !{!45, !278, !49, !5}
!707 = !DILocalVariable(name: "p", arg: 1, scope: !704, file: !25, line: 324, type: !278)
!708 = !DILocation(line: 0, scope: !704)
!709 = !DILocalVariable(name: "csk", arg: 2, scope: !704, file: !25, line: 324, type: !49)
!710 = !DILocalVariable(name: "sk", arg: 3, scope: !704, file: !25, line: 324, type: !5)
!711 = !DILocalVariable(name: "ret", scope: !704, file: !25, line: 325, type: !45)
!712 = !DILocalVariable(name: "S", scope: !704, file: !25, line: 326, type: !323)
!713 = !DILocation(line: 326, column: 17, scope: !704)
!714 = !DILocalVariable(name: "P", scope: !704, file: !25, line: 327, type: !5)
!715 = !DILocation(line: 328, column: 22, scope: !704)
!716 = !DILocalVariable(name: "O", scope: !704, file: !25, line: 328, type: !18)
!717 = !DILocalVariable(name: "param_o", scope: !704, file: !25, line: 330, type: !343)
!718 = !DILocalVariable(name: "param_v", scope: !704, file: !25, line: 331, type: !343)
!719 = !DILocalVariable(name: "param_O_bytes", scope: !704, file: !25, line: 332, type: !343)
!720 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !704, file: !25, line: 333, type: !343)
!721 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !704, file: !25, line: 334, type: !343)
!722 = !DILocalVariable(name: "seed_sk", scope: !704, file: !25, line: 336, type: !49)
!723 = !DILocalVariable(name: "seed_pk", scope: !704, file: !25, line: 337, type: !18)
!724 = !DILocation(line: 339, column: 3, scope: !704)
!725 = !DILocation(line: 341, column: 12, scope: !704)
!726 = !DILocation(line: 341, column: 3, scope: !704)
!727 = !DILocation(line: 347, column: 3, scope: !704)
!728 = !DILocation(line: 354, column: 20, scope: !704)
!729 = !DILocalVariable(name: "P2", scope: !704, file: !25, line: 354, type: !5)
!730 = !DILocalVariable(name: "P1", scope: !704, file: !25, line: 356, type: !5)
!731 = !DILocalVariable(name: "L", scope: !704, file: !25, line: 359, type: !5)
!732 = !DILocation(line: 360, column: 3, scope: !704)
!733 = !DILocation(line: 368, column: 3, scope: !704)
!734 = !DILocation(line: 370, column: 3, scope: !704)
!735 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !425, file: !425, line: 223, type: !471, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!736 = !DILocalVariable(name: "p", arg: 1, scope: !735, file: !425, line: 223, type: !278)
!737 = !DILocation(line: 0, scope: !735)
!738 = !DILocalVariable(name: "P1", arg: 2, scope: !735, file: !425, line: 223, type: !428)
!739 = !DILocalVariable(name: "O", arg: 3, scope: !735, file: !425, line: 223, type: !49)
!740 = !DILocalVariable(name: "acc", arg: 4, scope: !735, file: !425, line: 223, type: !5)
!741 = !DILocalVariable(name: "param_o", scope: !735, file: !425, line: 227, type: !343)
!742 = !DILocalVariable(name: "param_v", scope: !735, file: !425, line: 228, type: !343)
!743 = !DILocalVariable(name: "m_vec_limbs", scope: !735, file: !425, line: 229, type: !343)
!744 = !DILocalVariable(name: "bs_mat_entries_used", scope: !735, file: !425, line: 231, type: !45)
!745 = !DILocalVariable(name: "r", scope: !746, file: !425, line: 232, type: !45)
!746 = distinct !DILexicalBlock(scope: !735, file: !425, line: 232, column: 5)
!747 = !DILocation(line: 0, scope: !746)
!748 = !DILocation(line: 232, column: 10, scope: !746)
!749 = !DILocation(line: 231, column: 9, scope: !735)
!750 = !DILocation(line: 232, scope: !746)
!751 = !DILocation(line: 232, column: 23, scope: !752)
!752 = distinct !DILexicalBlock(scope: !746, file: !425, line: 232, column: 5)
!753 = !DILocation(line: 232, column: 5, scope: !746)
!754 = !DILocation(line: 233, column: 9, scope: !755)
!755 = distinct !DILexicalBlock(scope: !756, file: !425, line: 233, column: 9)
!756 = distinct !DILexicalBlock(scope: !752, file: !425, line: 232, column: 39)
!757 = !DILocation(line: 233, scope: !755)
!758 = !DILocalVariable(name: "c", scope: !755, file: !425, line: 233, type: !45)
!759 = !DILocation(line: 0, scope: !755)
!760 = !DILocation(line: 233, column: 27, scope: !761)
!761 = distinct !DILexicalBlock(scope: !755, file: !425, line: 233, column: 9)
!762 = !DILocation(line: 234, column: 17, scope: !763)
!763 = distinct !DILexicalBlock(scope: !764, file: !425, line: 234, column: 16)
!764 = distinct !DILexicalBlock(scope: !761, file: !425, line: 233, column: 43)
!765 = !DILocation(line: 238, column: 13, scope: !766)
!766 = distinct !DILexicalBlock(scope: !764, file: !425, line: 238, column: 13)
!767 = !DILocation(line: 238, scope: !766)
!768 = !DILocalVariable(name: "k", scope: !766, file: !425, line: 238, type: !45)
!769 = !DILocation(line: 0, scope: !766)
!770 = !DILocation(line: 238, column: 31, scope: !771)
!771 = distinct !DILexicalBlock(scope: !766, file: !425, line: 238, column: 13)
!772 = !DILocation(line: 239, column: 47, scope: !773)
!773 = distinct !DILexicalBlock(scope: !771, file: !425, line: 238, column: 50)
!774 = !DILocation(line: 239, column: 88, scope: !773)
!775 = !DILocation(line: 239, column: 98, scope: !773)
!776 = !DILocation(line: 239, column: 84, scope: !773)
!777 = !DILocation(line: 239, column: 127, scope: !773)
!778 = !DILocation(line: 239, column: 137, scope: !773)
!779 = !DILocation(line: 239, column: 108, scope: !773)
!780 = !DILocation(line: 239, column: 17, scope: !773)
!781 = !DILocation(line: 240, column: 47, scope: !773)
!782 = !DILocation(line: 240, column: 88, scope: !773)
!783 = !DILocation(line: 240, column: 98, scope: !773)
!784 = !DILocation(line: 240, column: 84, scope: !773)
!785 = !DILocation(line: 240, column: 127, scope: !773)
!786 = !DILocation(line: 240, column: 137, scope: !773)
!787 = !DILocation(line: 240, column: 108, scope: !773)
!788 = !DILocation(line: 240, column: 17, scope: !773)
!789 = !DILocation(line: 238, column: 44, scope: !771)
!790 = !DILocation(line: 238, column: 13, scope: !771)
!791 = distinct !{!791, !765, !792, !244}
!792 = !DILocation(line: 241, column: 13, scope: !766)
!793 = !DILocation(line: 0, scope: !764)
!794 = !DILocation(line: 233, column: 39, scope: !761)
!795 = !DILocation(line: 233, column: 9, scope: !761)
!796 = distinct !{!796, !754, !797, !244}
!797 = !DILocation(line: 243, column: 9, scope: !755)
!798 = !DILocation(line: 232, column: 35, scope: !752)
!799 = !DILocation(line: 232, column: 5, scope: !752)
!800 = distinct !{!800, !753, !801, !244}
!801 = !DILocation(line: 244, column: 5, scope: !746)
!802 = !DILocation(line: 247, column: 1, scope: !735)
!803 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign_signature", scope: !25, file: !25, line: 373, type: !804, scopeLine: 375, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!804 = !DISubroutineType(types: !805)
!805 = !{!45, !278, !18, !806, !49, !15, !49}
!806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!807 = !DILocalVariable(name: "p", arg: 1, scope: !803, file: !25, line: 373, type: !278)
!808 = !DILocation(line: 0, scope: !803)
!809 = !DILocalVariable(name: "sig", arg: 2, scope: !803, file: !25, line: 373, type: !18)
!810 = !DILocalVariable(name: "siglen", arg: 3, scope: !803, file: !25, line: 374, type: !806)
!811 = !DILocalVariable(name: "m", arg: 4, scope: !803, file: !25, line: 374, type: !49)
!812 = !DILocalVariable(name: "mlen", arg: 5, scope: !803, file: !25, line: 374, type: !15)
!813 = !DILocalVariable(name: "csk", arg: 6, scope: !803, file: !25, line: 375, type: !49)
!814 = !DILocalVariable(name: "ret", scope: !803, file: !25, line: 376, type: !45)
!815 = !DILocalVariable(name: "tenc", scope: !803, file: !25, line: 377, type: !816)
!816 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 312, elements: !817)
!817 = !{!818}
!818 = !DISubrange(count: 39)
!819 = !DILocation(line: 377, column: 17, scope: !803)
!820 = !DILocalVariable(name: "t", scope: !803, file: !25, line: 377, type: !821)
!821 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 624, elements: !822)
!822 = !{!823}
!823 = !DISubrange(count: 78)
!824 = !DILocation(line: 377, column: 36, scope: !803)
!825 = !DILocalVariable(name: "y", scope: !803, file: !25, line: 378, type: !821)
!826 = !DILocation(line: 378, column: 17, scope: !803)
!827 = !DILocalVariable(name: "salt", scope: !803, file: !25, line: 379, type: !828)
!828 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 192, elements: !73)
!829 = !DILocation(line: 379, column: 17, scope: !803)
!830 = !DILocalVariable(name: "V", scope: !803, file: !25, line: 380, type: !831)
!831 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3440, elements: !832)
!832 = !{!833}
!833 = !DISubrange(count: 430)
!834 = !DILocation(line: 380, column: 17, scope: !803)
!835 = !DILocalVariable(name: "Vdec", scope: !803, file: !25, line: 381, type: !836)
!836 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6240, elements: !837)
!837 = !{!838}
!838 = !DISubrange(count: 780)
!839 = !DILocation(line: 381, column: 7, scope: !803)
!840 = !DILocalVariable(name: "A", scope: !803, file: !25, line: 382, type: !841)
!841 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 51840, elements: !842)
!842 = !{!843}
!843 = !DISubrange(count: 6480)
!844 = !DILocation(line: 382, column: 17, scope: !803)
!845 = !DILocalVariable(name: "x", scope: !803, file: !25, line: 384, type: !846)
!846 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6880, elements: !847)
!847 = !{!848}
!848 = !DISubrange(count: 860)
!849 = !DILocation(line: 384, column: 17, scope: !803)
!850 = !DILocalVariable(name: "r", scope: !803, file: !25, line: 385, type: !851)
!851 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 648, elements: !852)
!852 = !{!853}
!853 = !DISubrange(count: 81)
!854 = !DILocation(line: 385, column: 17, scope: !803)
!855 = !DILocalVariable(name: "s", scope: !803, file: !25, line: 386, type: !846)
!856 = !DILocation(line: 386, column: 17, scope: !803)
!857 = !DILocalVariable(name: "sk", scope: !803, file: !25, line: 388, type: !185, align: 256)
!858 = !DILocation(line: 388, column: 20, scope: !803)
!859 = !DILocalVariable(name: "Ox", scope: !803, file: !25, line: 389, type: !821)
!860 = !DILocation(line: 389, column: 17, scope: !803)
!861 = !DILocalVariable(name: "tmp", scope: !803, file: !25, line: 390, type: !851)
!862 = !DILocation(line: 390, column: 17, scope: !803)
!863 = !DILocalVariable(name: "param_m", scope: !803, file: !25, line: 394, type: !343)
!864 = !DILocalVariable(name: "param_n", scope: !803, file: !25, line: 395, type: !343)
!865 = !DILocalVariable(name: "param_o", scope: !803, file: !25, line: 396, type: !343)
!866 = !DILocalVariable(name: "param_k", scope: !803, file: !25, line: 397, type: !343)
!867 = !DILocalVariable(name: "param_v", scope: !803, file: !25, line: 398, type: !343)
!868 = !DILocalVariable(name: "param_m_bytes", scope: !803, file: !25, line: 399, type: !343)
!869 = !DILocalVariable(name: "param_v_bytes", scope: !803, file: !25, line: 400, type: !343)
!870 = !DILocalVariable(name: "param_r_bytes", scope: !803, file: !25, line: 401, type: !343)
!871 = !DILocalVariable(name: "param_sig_bytes", scope: !803, file: !25, line: 402, type: !343)
!872 = !DILocalVariable(name: "param_A_cols", scope: !803, file: !25, line: 403, type: !343)
!873 = !DILocalVariable(name: "param_digest_bytes", scope: !803, file: !25, line: 404, type: !343)
!874 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !803, file: !25, line: 405, type: !343)
!875 = !DILocalVariable(name: "param_salt_bytes", scope: !803, file: !25, line: 406, type: !343)
!876 = !DILocation(line: 408, column: 9, scope: !803)
!877 = !DILocalVariable(name: "seed_sk", scope: !803, file: !25, line: 387, type: !49)
!878 = !DILocation(line: 416, column: 3, scope: !803)
!879 = !DILocalVariable(name: "P1", scope: !803, file: !25, line: 418, type: !5)
!880 = !DILocalVariable(name: "L", scope: !803, file: !25, line: 419, type: !5)
!881 = !DILocalVariable(name: "Mtmp", scope: !803, file: !25, line: 420, type: !882)
!882 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 25600, elements: !883)
!883 = !{!884}
!884 = !DISubrange(count: 400)
!885 = !DILocation(line: 420, column: 12, scope: !803)
!886 = !DILocation(line: 435, column: 23, scope: !887)
!887 = distinct !DILexicalBlock(scope: !803, file: !25, line: 435, column: 7)
!888 = !DILocation(line: 435, column: 7, scope: !887)
!889 = !DILocation(line: 442, column: 35, scope: !803)
!890 = !DILocation(line: 442, column: 3, scope: !803)
!891 = !DILocation(line: 444, column: 3, scope: !803)
!892 = !DILocation(line: 452, column: 14, scope: !803)
!893 = !DILocation(line: 452, column: 3, scope: !803)
!894 = !DILocation(line: 453, column: 57, scope: !803)
!895 = !DILocalVariable(name: "ctrbyte", scope: !803, file: !25, line: 391, type: !18)
!896 = !DILocation(line: 455, column: 3, scope: !803)
!897 = !DILocation(line: 457, column: 3, scope: !803)
!898 = !DILocation(line: 460, column: 12, scope: !803)
!899 = !DILocation(line: 462, column: 3, scope: !803)
!900 = !DILocalVariable(name: "i", scope: !901, file: !25, line: 466, type: !45)
!901 = distinct !DILexicalBlock(scope: !803, file: !25, line: 466, column: 3)
!902 = !DILocation(line: 0, scope: !901)
!903 = !DILocation(line: 466, column: 8, scope: !901)
!904 = !DILocation(line: 466, scope: !901)
!905 = !DILocation(line: 466, column: 21, scope: !906)
!906 = distinct !DILexicalBlock(scope: !901, file: !25, line: 466, column: 3)
!907 = !DILocation(line: 466, column: 3, scope: !901)
!908 = !DILocation(line: 467, column: 18, scope: !909)
!909 = distinct !DILexicalBlock(scope: !906, file: !25, line: 466, column: 42)
!910 = !DILocation(line: 467, column: 14, scope: !909)
!911 = !DILocation(line: 467, column: 44, scope: !909)
!912 = !DILocation(line: 467, column: 40, scope: !909)
!913 = !DILocation(line: 467, column: 5, scope: !909)
!914 = !DILocation(line: 466, column: 37, scope: !906)
!915 = !DILocation(line: 466, column: 3, scope: !906)
!916 = distinct !{!916, !907, !917, !244}
!917 = !DILocation(line: 468, column: 3, scope: !901)
!918 = !DILocation(line: 419, column: 20, scope: !803)
!919 = !DILocation(line: 470, column: 3, scope: !803)
!920 = !DILocation(line: 472, column: 3, scope: !803)
!921 = !DILocation(line: 473, column: 3, scope: !803)
!922 = !DILocalVariable(name: "i", scope: !923, file: !25, line: 475, type: !45)
!923 = distinct !DILexicalBlock(scope: !803, file: !25, line: 475, column: 3)
!924 = !DILocation(line: 0, scope: !923)
!925 = !DILocation(line: 475, column: 8, scope: !923)
!926 = !DILocation(line: 475, scope: !923)
!927 = !DILocation(line: 475, column: 21, scope: !928)
!928 = distinct !DILexicalBlock(scope: !923, file: !25, line: 475, column: 3)
!929 = !DILocation(line: 475, column: 3, scope: !923)
!930 = !DILocation(line: 476, column: 15, scope: !931)
!931 = distinct !DILexicalBlock(scope: !928, file: !25, line: 475, column: 37)
!932 = !DILocation(line: 476, column: 41, scope: !931)
!933 = !DILocation(line: 476, column: 5, scope: !931)
!934 = !DILocation(line: 476, column: 46, scope: !931)
!935 = !DILocation(line: 475, column: 33, scope: !928)
!936 = !DILocation(line: 475, column: 3, scope: !928)
!937 = distinct !{!937, !929, !938, !244}
!938 = !DILocation(line: 477, column: 3, scope: !923)
!939 = !DILocation(line: 479, column: 12, scope: !803)
!940 = !DILocation(line: 479, column: 3, scope: !803)
!941 = !DILocation(line: 481, column: 7, scope: !942)
!942 = distinct !DILexicalBlock(scope: !803, file: !25, line: 481, column: 7)
!943 = !DILocation(line: 484, column: 5, scope: !944)
!944 = distinct !DILexicalBlock(scope: !942, file: !25, line: 483, column: 10)
!945 = !DILocation(line: 485, column: 5, scope: !944)
!946 = !DILocalVariable(name: "i", scope: !947, file: !25, line: 489, type: !45)
!947 = distinct !DILexicalBlock(scope: !803, file: !25, line: 489, column: 3)
!948 = !DILocation(line: 0, scope: !947)
!949 = !DILocation(line: 489, column: 8, scope: !947)
!950 = !DILocation(line: 489, scope: !947)
!951 = !DILocation(line: 489, column: 21, scope: !952)
!952 = distinct !DILexicalBlock(scope: !947, file: !25, line: 489, column: 3)
!953 = !DILocation(line: 489, column: 3, scope: !947)
!954 = !DILocation(line: 490, column: 19, scope: !955)
!955 = distinct !DILexicalBlock(scope: !952, file: !25, line: 489, column: 42)
!956 = !DILocation(line: 490, column: 15, scope: !955)
!957 = !DILocalVariable(name: "vi", scope: !803, file: !25, line: 392, type: !18)
!958 = !DILocation(line: 491, column: 13, scope: !955)
!959 = !DILocation(line: 491, column: 29, scope: !955)
!960 = !DILocation(line: 491, column: 25, scope: !955)
!961 = !DILocation(line: 491, column: 5, scope: !955)
!962 = !DILocation(line: 492, column: 27, scope: !955)
!963 = !DILocation(line: 492, column: 23, scope: !955)
!964 = !DILocation(line: 492, column: 5, scope: !955)
!965 = !DILocation(line: 493, column: 18, scope: !955)
!966 = !DILocation(line: 493, column: 14, scope: !955)
!967 = !DILocation(line: 493, column: 28, scope: !955)
!968 = !DILocation(line: 493, column: 57, scope: !955)
!969 = !DILocation(line: 493, column: 53, scope: !955)
!970 = !DILocation(line: 493, column: 5, scope: !955)
!971 = !DILocation(line: 489, column: 37, scope: !952)
!972 = !DILocation(line: 489, column: 3, scope: !952)
!973 = distinct !{!973, !953, !974, !244}
!974 = !DILocation(line: 494, column: 3, scope: !947)
!975 = !DILocation(line: 495, column: 3, scope: !803)
!976 = !DILocation(line: 497, column: 32, scope: !803)
!977 = !DILocation(line: 497, column: 3, scope: !803)
!978 = !DILocation(line: 498, column: 11, scope: !803)
!979 = !DILabel(scope: !803, name: "err", file: !25, line: 500)
!980 = !DILocation(line: 500, column: 1, scope: !803)
!981 = !DILocation(line: 501, column: 3, scope: !803)
!982 = !DILocation(line: 502, column: 3, scope: !803)
!983 = !DILocation(line: 503, column: 3, scope: !803)
!984 = !DILocation(line: 504, column: 3, scope: !803)
!985 = !DILocation(line: 505, column: 21, scope: !803)
!986 = !DILocation(line: 505, column: 3, scope: !803)
!987 = !DILocation(line: 506, column: 3, scope: !803)
!988 = !DILocation(line: 507, column: 3, scope: !803)
!989 = !DILocation(line: 508, column: 3, scope: !803)
!990 = !DILocation(line: 509, column: 3, scope: !803)
!991 = !DILocation(line: 512, column: 3, scope: !803)
!992 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !425, file: !425, line: 251, type: !993, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!993 = !DISubroutineType(types: !994)
!994 = !{null, !278, !49, !428, !428, !5, !5}
!995 = !DILocalVariable(name: "p", arg: 1, scope: !992, file: !425, line: 251, type: !278)
!996 = !DILocation(line: 0, scope: !992)
!997 = !DILocalVariable(name: "Vdec", arg: 2, scope: !992, file: !425, line: 251, type: !49)
!998 = !DILocalVariable(name: "L", arg: 3, scope: !992, file: !425, line: 251, type: !428)
!999 = !DILocalVariable(name: "P1", arg: 4, scope: !992, file: !425, line: 251, type: !428)
!1000 = !DILocalVariable(name: "VL", arg: 5, scope: !992, file: !425, line: 251, type: !5)
!1001 = !DILocalVariable(name: "VP1V", arg: 6, scope: !992, file: !425, line: 251, type: !5)
!1002 = !DILocalVariable(name: "param_k", scope: !992, file: !425, line: 253, type: !343)
!1003 = !DILocalVariable(name: "param_v", scope: !992, file: !425, line: 254, type: !343)
!1004 = !DILocalVariable(name: "param_o", scope: !992, file: !425, line: 255, type: !343)
!1005 = !DILocation(line: 258, column: 5, scope: !992)
!1006 = !DILocalVariable(name: "Pv", scope: !992, file: !425, line: 261, type: !1007)
!1007 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 249600, elements: !1008)
!1008 = !{!1009}
!1009 = !DISubrange(count: 3900)
!1010 = !DILocation(line: 261, column: 14, scope: !992)
!1011 = !DILocation(line: 262, column: 5, scope: !992)
!1012 = !DILocation(line: 263, column: 5, scope: !992)
!1013 = !DILocation(line: 265, column: 1, scope: !992)
!1014 = distinct !DISubprogram(name: "compute_rhs", scope: !25, file: !25, line: 46, type: !1015, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{null, !278, !5, !49, !18}
!1017 = !DILocalVariable(name: "p", arg: 1, scope: !1014, file: !25, line: 46, type: !278)
!1018 = !DILocation(line: 0, scope: !1014)
!1019 = !DILocalVariable(name: "vPv", arg: 2, scope: !1014, file: !25, line: 46, type: !5)
!1020 = !DILocalVariable(name: "t", arg: 3, scope: !1014, file: !25, line: 47, type: !49)
!1021 = !DILocalVariable(name: "y", arg: 4, scope: !1014, file: !25, line: 47, type: !18)
!1022 = !DILocalVariable(name: "top_pos", scope: !1014, file: !25, line: 52, type: !1023)
!1023 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!1024 = !DILocalVariable(name: "m_vec_limbs", scope: !1014, file: !25, line: 53, type: !1023)
!1025 = !DILocalVariable(name: "mask", scope: !1026, file: !25, line: 57, type: !6)
!1026 = distinct !DILexicalBlock(scope: !1027, file: !25, line: 56, column: 29)
!1027 = distinct !DILexicalBlock(scope: !1014, file: !25, line: 56, column: 7)
!1028 = !DILocation(line: 0, scope: !1026)
!1029 = !DILocalVariable(name: "i", scope: !1030, file: !25, line: 60, type: !45)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !25, line: 60, column: 5)
!1031 = !DILocation(line: 0, scope: !1030)
!1032 = !DILocation(line: 60, column: 10, scope: !1030)
!1033 = !DILocation(line: 60, scope: !1030)
!1034 = !DILocation(line: 60, column: 23, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1030, file: !25, line: 60, column: 5)
!1036 = !DILocation(line: 60, column: 5, scope: !1030)
!1037 = !DILocation(line: 61, column: 7, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1035, file: !25, line: 60, column: 55)
!1039 = !DILocation(line: 61, column: 46, scope: !1038)
!1040 = !DILocation(line: 60, column: 51, scope: !1035)
!1041 = !DILocation(line: 60, column: 5, scope: !1035)
!1042 = distinct !{!1042, !1036, !1043, !244}
!1043 = !DILocation(line: 62, column: 5, scope: !1030)
!1044 = !DILocalVariable(name: "temp", scope: !1014, file: !25, line: 65, type: !681)
!1045 = !DILocation(line: 65, column: 12, scope: !1014)
!1046 = !DILocalVariable(name: "temp_bytes", scope: !1014, file: !25, line: 66, type: !18)
!1047 = !DILocalVariable(name: "i", scope: !1048, file: !25, line: 67, type: !45)
!1048 = distinct !DILexicalBlock(scope: !1014, file: !25, line: 67, column: 3)
!1049 = !DILocation(line: 0, scope: !1048)
!1050 = !DILocation(line: 67, column: 8, scope: !1048)
!1051 = !DILocation(line: 67, scope: !1048)
!1052 = !DILocation(line: 67, column: 34, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1048, file: !25, line: 67, column: 3)
!1054 = !DILocation(line: 67, column: 3, scope: !1048)
!1055 = !DILocation(line: 68, column: 5, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1057, file: !25, line: 68, column: 5)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !25, line: 67, column: 45)
!1058 = !DILocation(line: 104, column: 3, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1014, file: !25, line: 104, column: 3)
!1060 = !DILocation(line: 68, scope: !1056)
!1061 = !DILocalVariable(name: "j", scope: !1056, file: !25, line: 68, type: !45)
!1062 = !DILocation(line: 0, scope: !1056)
!1063 = !DILocation(line: 68, column: 23, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1056, file: !25, line: 68, column: 5)
!1065 = !DILocation(line: 70, column: 28, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1064, file: !25, line: 68, column: 42)
!1067 = !DILocation(line: 70, column: 50, scope: !1066)
!1068 = !DILocation(line: 70, column: 62, scope: !1066)
!1069 = !DILocalVariable(name: "top", scope: !1066, file: !25, line: 70, type: !14)
!1070 = !DILocation(line: 0, scope: !1066)
!1071 = !DILocation(line: 71, column: 7, scope: !1066)
!1072 = !DILocation(line: 71, column: 29, scope: !1066)
!1073 = !DILocalVariable(name: "k", scope: !1074, file: !25, line: 72, type: !45)
!1074 = distinct !DILexicalBlock(scope: !1066, file: !25, line: 72, column: 7)
!1075 = !DILocation(line: 0, scope: !1074)
!1076 = !DILocation(line: 72, column: 12, scope: !1074)
!1077 = !DILocation(line: 72, scope: !1074)
!1078 = !DILocation(line: 72, column: 39, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1074, file: !25, line: 72, column: 7)
!1080 = !DILocation(line: 72, column: 7, scope: !1074)
!1081 = !DILocation(line: 77, column: 7, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1066, file: !25, line: 77, column: 7)
!1083 = !DILocation(line: 73, column: 24, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1079, file: !25, line: 72, column: 50)
!1085 = !DILocation(line: 73, column: 32, scope: !1084)
!1086 = !DILocation(line: 73, column: 16, scope: !1084)
!1087 = !DILocation(line: 73, column: 9, scope: !1084)
!1088 = !DILocation(line: 73, column: 21, scope: !1084)
!1089 = !DILocation(line: 74, column: 9, scope: !1084)
!1090 = !DILocation(line: 74, column: 17, scope: !1084)
!1091 = !DILocation(line: 72, column: 46, scope: !1079)
!1092 = !DILocation(line: 72, column: 7, scope: !1079)
!1093 = distinct !{!1093, !1080, !1094, !244}
!1094 = !DILocation(line: 75, column: 7, scope: !1074)
!1095 = !DILocation(line: 77, scope: !1082)
!1096 = !DILocalVariable(name: "jj", scope: !1082, file: !25, line: 77, type: !45)
!1097 = !DILocation(line: 0, scope: !1082)
!1098 = !DILocation(line: 77, column: 27, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1082, file: !25, line: 77, column: 7)
!1100 = !DILocation(line: 96, column: 7, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1066, file: !25, line: 96, column: 7)
!1102 = !DILocation(line: 78, column: 16, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1104, file: !25, line: 78, column: 13)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !25, line: 77, column: 47)
!1105 = !DILocation(line: 78, column: 20, scope: !1103)
!1106 = !DILocation(line: 83, column: 44, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1103, file: !25, line: 78, column: 26)
!1108 = !DILocation(line: 83, column: 33, scope: !1107)
!1109 = !DILocation(line: 83, column: 25, scope: !1107)
!1110 = !DILocation(line: 83, column: 11, scope: !1107)
!1111 = !DILocation(line: 83, column: 30, scope: !1107)
!1112 = !DILocation(line: 85, column: 9, scope: !1107)
!1113 = !DILocation(line: 90, column: 44, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1103, file: !25, line: 85, column: 16)
!1115 = !DILocation(line: 90, column: 33, scope: !1114)
!1116 = !DILocation(line: 90, column: 65, scope: !1114)
!1117 = !DILocation(line: 90, column: 25, scope: !1114)
!1118 = !DILocation(line: 90, column: 11, scope: !1114)
!1119 = !DILocation(line: 90, column: 30, scope: !1114)
!1120 = !DILocation(line: 77, column: 43, scope: !1099)
!1121 = !DILocation(line: 77, column: 7, scope: !1099)
!1122 = distinct !{!1122, !1081, !1123, !244}
!1123 = !DILocation(line: 93, column: 7, scope: !1082)
!1124 = !DILocation(line: 96, scope: !1101)
!1125 = !DILocalVariable(name: "k", scope: !1101, file: !25, line: 96, type: !15)
!1126 = !DILocation(line: 0, scope: !1101)
!1127 = !DILocation(line: 96, column: 28, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1101, file: !25, line: 96, column: 7)
!1129 = !DILocation(line: 97, column: 27, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1128, file: !25, line: 96, column: 48)
!1131 = !DILocation(line: 97, column: 40, scope: !1130)
!1132 = !DILocation(line: 97, column: 20, scope: !1130)
!1133 = !DILocation(line: 98, column: 24, scope: !1130)
!1134 = !DILocation(line: 98, column: 39, scope: !1130)
!1135 = !DILocation(line: 98, column: 52, scope: !1130)
!1136 = !DILocation(line: 98, column: 32, scope: !1130)
!1137 = !DILocation(line: 98, column: 30, scope: !1130)
!1138 = !DILocation(line: 97, column: 64, scope: !1130)
!1139 = !DILocation(line: 97, column: 9, scope: !1130)
!1140 = !DILocation(line: 97, column: 17, scope: !1130)
!1141 = !DILocation(line: 96, column: 44, scope: !1128)
!1142 = !DILocation(line: 96, column: 7, scope: !1128)
!1143 = distinct !{!1143, !1100, !1144, !244}
!1144 = !DILocation(line: 99, column: 7, scope: !1101)
!1145 = !DILocation(line: 68, column: 38, scope: !1064)
!1146 = !DILocation(line: 68, column: 5, scope: !1064)
!1147 = distinct !{!1147, !1055, !1148, !244}
!1148 = !DILocation(line: 100, column: 5, scope: !1056)
!1149 = !DILocation(line: 67, column: 41, scope: !1053)
!1150 = !DILocation(line: 67, column: 3, scope: !1053)
!1151 = distinct !{!1151, !1054, !1152, !244}
!1152 = !DILocation(line: 101, column: 3, scope: !1048)
!1153 = !DILocation(line: 104, scope: !1059)
!1154 = !DILocalVariable(name: "i", scope: !1059, file: !25, line: 104, type: !45)
!1155 = !DILocation(line: 0, scope: !1059)
!1156 = !DILocation(line: 104, column: 21, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1059, file: !25, line: 104, column: 3)
!1158 = !DILocation(line: 110, column: 12, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1157, file: !25, line: 104, column: 43)
!1160 = !DILocation(line: 110, column: 33, scope: !1159)
!1161 = !DILocation(line: 110, column: 20, scope: !1159)
!1162 = !DILocation(line: 110, column: 38, scope: !1159)
!1163 = !DILocation(line: 110, column: 17, scope: !1159)
!1164 = !DILocation(line: 110, column: 5, scope: !1159)
!1165 = !DILocation(line: 110, column: 10, scope: !1159)
!1166 = !DILocation(line: 111, column: 20, scope: !1159)
!1167 = !DILocation(line: 111, column: 16, scope: !1159)
!1168 = !DILocation(line: 111, column: 41, scope: !1159)
!1169 = !DILocation(line: 111, column: 28, scope: !1159)
!1170 = !DILocation(line: 111, column: 46, scope: !1159)
!1171 = !DILocation(line: 111, column: 25, scope: !1159)
!1172 = !DILocation(line: 111, column: 9, scope: !1159)
!1173 = !DILocation(line: 111, column: 5, scope: !1159)
!1174 = !DILocation(line: 111, column: 14, scope: !1159)
!1175 = !DILocation(line: 104, column: 37, scope: !1157)
!1176 = !DILocation(line: 104, column: 3, scope: !1157)
!1177 = distinct !{!1177, !1058, !1178, !244}
!1178 = !DILocation(line: 113, column: 3, scope: !1059)
!1179 = !DILocation(line: 115, column: 1, scope: !1014)
!1180 = distinct !DISubprogram(name: "compute_A", scope: !25, file: !25, line: 156, type: !1181, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{null, !278, !5, !18}
!1183 = !DILocalVariable(name: "p", arg: 1, scope: !1180, file: !25, line: 156, type: !278)
!1184 = !DILocation(line: 0, scope: !1180)
!1185 = !DILocalVariable(name: "VtL", arg: 2, scope: !1180, file: !25, line: 156, type: !5)
!1186 = !DILocalVariable(name: "A_out", arg: 3, scope: !1180, file: !25, line: 157, type: !18)
!1187 = !DILocalVariable(name: "bits_to_shift", scope: !1180, file: !25, line: 162, type: !45)
!1188 = !DILocalVariable(name: "words_to_shift", scope: !1180, file: !25, line: 163, type: !45)
!1189 = !DILocalVariable(name: "m_vec_limbs", scope: !1180, file: !25, line: 164, type: !343)
!1190 = !DILocalVariable(name: "A", scope: !1180, file: !25, line: 165, type: !1191)
!1191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 51200, elements: !1192)
!1192 = !{!1193}
!1193 = !DISubrange(count: 800)
!1194 = !DILocation(line: 165, column: 12, scope: !1180)
!1195 = !DILocalVariable(name: "A_width", scope: !1180, file: !25, line: 166, type: !15)
!1196 = !DILocalVariable(name: "mask", scope: !1197, file: !25, line: 171, type: !6)
!1197 = distinct !DILexicalBlock(scope: !1198, file: !25, line: 170, column: 29)
!1198 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 170, column: 7)
!1199 = !DILocation(line: 0, scope: !1197)
!1200 = !DILocalVariable(name: "i", scope: !1201, file: !25, line: 174, type: !45)
!1201 = distinct !DILexicalBlock(scope: !1197, file: !25, line: 174, column: 5)
!1202 = !DILocation(line: 0, scope: !1201)
!1203 = !DILocation(line: 174, column: 10, scope: !1201)
!1204 = !DILocation(line: 174, scope: !1201)
!1205 = !DILocation(line: 174, column: 23, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1201, file: !25, line: 174, column: 5)
!1207 = !DILocation(line: 174, column: 5, scope: !1201)
!1208 = !DILocation(line: 179, column: 3, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 179, column: 3)
!1210 = !DILocation(line: 175, column: 7, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1206, file: !25, line: 174, column: 55)
!1212 = !DILocation(line: 175, column: 46, scope: !1211)
!1213 = !DILocation(line: 174, column: 51, scope: !1206)
!1214 = !DILocation(line: 174, column: 5, scope: !1206)
!1215 = distinct !{!1215, !1207, !1216, !244}
!1216 = !DILocation(line: 176, column: 5, scope: !1201)
!1217 = !DILocation(line: 179, scope: !1209)
!1218 = !DILocation(line: 163, column: 7, scope: !1180)
!1219 = !DILocation(line: 162, column: 7, scope: !1180)
!1220 = !DILocalVariable(name: "i", scope: !1209, file: !25, line: 179, type: !45)
!1221 = !DILocation(line: 0, scope: !1209)
!1222 = !DILocation(line: 179, column: 21, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1209, file: !25, line: 179, column: 3)
!1224 = !DILocation(line: 180, column: 5, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1226, file: !25, line: 180, column: 5)
!1226 = distinct !DILexicalBlock(scope: !1223, file: !25, line: 179, column: 45)
!1227 = !DILocation(line: 216, column: 3, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 216, column: 3)
!1229 = !DILocation(line: 180, scope: !1225)
!1230 = !DILocalVariable(name: "j", scope: !1225, file: !25, line: 180, type: !45)
!1231 = !DILocation(line: 0, scope: !1225)
!1232 = !DILocation(line: 180, column: 36, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1225, file: !25, line: 180, column: 5)
!1234 = !DILocation(line: 182, column: 16, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1233, file: !25, line: 180, column: 47)
!1236 = !DILocalVariable(name: "Mj", scope: !1180, file: !25, line: 167, type: !428)
!1237 = !DILocalVariable(name: "c", scope: !1238, file: !25, line: 183, type: !45)
!1238 = distinct !DILexicalBlock(scope: !1235, file: !25, line: 183, column: 7)
!1239 = !DILocation(line: 0, scope: !1238)
!1240 = !DILocation(line: 183, column: 12, scope: !1238)
!1241 = !DILocation(line: 183, scope: !1238)
!1242 = !DILocation(line: 183, column: 25, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1238, file: !25, line: 183, column: 7)
!1244 = !DILocation(line: 183, column: 7, scope: !1238)
!1245 = !DILocation(line: 184, column: 9, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1247, file: !25, line: 184, column: 9)
!1247 = distinct !DILexicalBlock(scope: !1243, file: !25, line: 183, column: 44)
!1248 = !DILocation(line: 184, scope: !1246)
!1249 = !DILocalVariable(name: "k", scope: !1246, file: !25, line: 184, type: !45)
!1250 = !DILocation(line: 0, scope: !1246)
!1251 = !DILocation(line: 184, column: 27, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1246, file: !25, line: 184, column: 9)
!1253 = !DILocation(line: 186, column: 15, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1252, file: !25, line: 184, column: 47)
!1255 = !DILocation(line: 186, column: 39, scope: !1254)
!1256 = !DILocation(line: 185, column: 24, scope: !1254)
!1257 = !DILocation(line: 185, column: 28, scope: !1254)
!1258 = !DILocation(line: 185, column: 37, scope: !1254)
!1259 = !DILocation(line: 185, column: 55, scope: !1254)
!1260 = !DILocation(line: 185, column: 32, scope: !1254)
!1261 = !DILocation(line: 185, column: 11, scope: !1254)
!1262 = !DILocation(line: 185, column: 66, scope: !1254)
!1263 = !DILocation(line: 187, column: 29, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1254, file: !25, line: 187, column: 15)
!1265 = !DILocation(line: 189, column: 17, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1264, file: !25, line: 187, column: 34)
!1267 = !DILocation(line: 189, column: 48, scope: !1266)
!1268 = !DILocation(line: 189, column: 41, scope: !1266)
!1269 = !DILocation(line: 188, column: 26, scope: !1266)
!1270 = !DILocation(line: 188, column: 30, scope: !1266)
!1271 = !DILocation(line: 188, column: 39, scope: !1266)
!1272 = !DILocation(line: 188, column: 61, scope: !1266)
!1273 = !DILocation(line: 188, column: 34, scope: !1266)
!1274 = !DILocation(line: 188, column: 13, scope: !1266)
!1275 = !DILocation(line: 188, column: 72, scope: !1266)
!1276 = !DILocation(line: 190, column: 11, scope: !1266)
!1277 = !DILocation(line: 184, column: 43, scope: !1252)
!1278 = !DILocation(line: 184, column: 9, scope: !1252)
!1279 = distinct !{!1279, !1245, !1280, !244}
!1280 = !DILocation(line: 191, column: 9, scope: !1246)
!1281 = !DILocation(line: 183, column: 40, scope: !1243)
!1282 = !DILocation(line: 183, column: 7, scope: !1243)
!1283 = distinct !{!1283, !1244, !1284, !244}
!1284 = !DILocation(line: 192, column: 7, scope: !1238)
!1285 = !DILocation(line: 194, column: 13, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1235, file: !25, line: 194, column: 11)
!1287 = !DILocation(line: 195, column: 18, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1286, file: !25, line: 194, column: 19)
!1289 = !DILocalVariable(name: "Mi", scope: !1180, file: !25, line: 167, type: !428)
!1290 = !DILocalVariable(name: "c", scope: !1291, file: !25, line: 196, type: !45)
!1291 = distinct !DILexicalBlock(scope: !1288, file: !25, line: 196, column: 9)
!1292 = !DILocation(line: 0, scope: !1291)
!1293 = !DILocation(line: 196, column: 14, scope: !1291)
!1294 = !DILocation(line: 196, scope: !1291)
!1295 = !DILocation(line: 196, column: 27, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1291, file: !25, line: 196, column: 9)
!1297 = !DILocation(line: 196, column: 9, scope: !1291)
!1298 = !DILocation(line: 197, column: 11, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1300, file: !25, line: 197, column: 11)
!1300 = distinct !DILexicalBlock(scope: !1296, file: !25, line: 196, column: 46)
!1301 = !DILocation(line: 197, scope: !1299)
!1302 = !DILocalVariable(name: "k", scope: !1299, file: !25, line: 197, type: !45)
!1303 = !DILocation(line: 0, scope: !1299)
!1304 = !DILocation(line: 197, column: 29, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1299, file: !25, line: 197, column: 11)
!1306 = !DILocation(line: 199, column: 17, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1305, file: !25, line: 197, column: 49)
!1308 = !DILocation(line: 199, column: 41, scope: !1307)
!1309 = !DILocation(line: 198, column: 26, scope: !1307)
!1310 = !DILocation(line: 198, column: 30, scope: !1307)
!1311 = !DILocation(line: 198, column: 39, scope: !1307)
!1312 = !DILocation(line: 198, column: 57, scope: !1307)
!1313 = !DILocation(line: 198, column: 34, scope: !1307)
!1314 = !DILocation(line: 198, column: 13, scope: !1307)
!1315 = !DILocation(line: 198, column: 68, scope: !1307)
!1316 = !DILocation(line: 200, column: 31, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1307, file: !25, line: 200, column: 17)
!1318 = !DILocation(line: 202, column: 19, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1317, file: !25, line: 200, column: 36)
!1320 = !DILocation(line: 202, column: 50, scope: !1319)
!1321 = !DILocation(line: 202, column: 43, scope: !1319)
!1322 = !DILocation(line: 201, column: 28, scope: !1319)
!1323 = !DILocation(line: 201, column: 32, scope: !1319)
!1324 = !DILocation(line: 201, column: 41, scope: !1319)
!1325 = !DILocation(line: 201, column: 63, scope: !1319)
!1326 = !DILocation(line: 201, column: 36, scope: !1319)
!1327 = !DILocation(line: 201, column: 15, scope: !1319)
!1328 = !DILocation(line: 201, column: 74, scope: !1319)
!1329 = !DILocation(line: 203, column: 13, scope: !1319)
!1330 = !DILocation(line: 197, column: 45, scope: !1305)
!1331 = !DILocation(line: 197, column: 11, scope: !1305)
!1332 = distinct !{!1332, !1298, !1333, !244}
!1333 = !DILocation(line: 204, column: 11, scope: !1299)
!1334 = !DILocation(line: 196, column: 42, scope: !1296)
!1335 = !DILocation(line: 196, column: 9, scope: !1296)
!1336 = distinct !{!1336, !1297, !1337, !244}
!1337 = !DILocation(line: 205, column: 9, scope: !1291)
!1338 = !DILocation(line: 208, column: 21, scope: !1235)
!1339 = !DILocation(line: 209, column: 25, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1235, file: !25, line: 209, column: 11)
!1341 = !DILocation(line: 180, column: 42, scope: !1233)
!1342 = !DILocation(line: 180, column: 5, scope: !1233)
!1343 = distinct !{!1343, !1224, !1344, !244}
!1344 = !DILocation(line: 213, column: 5, scope: !1225)
!1345 = !DILocation(line: 179, column: 40, scope: !1223)
!1346 = !DILocation(line: 179, column: 3, scope: !1223)
!1347 = distinct !{!1347, !1208, !1348, !244}
!1348 = !DILocation(line: 214, column: 3, scope: !1209)
!1349 = !DILocation(line: 0, scope: !1228)
!1350 = !DILocalVariable(name: "c", scope: !1228, file: !25, line: 216, type: !15)
!1351 = !DILocation(line: 217, column: 10, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1228, file: !25, line: 216, column: 3)
!1353 = !DILocation(line: 220, column: 31, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1352, file: !25, line: 219, column: 17)
!1355 = !DILocation(line: 220, column: 5, scope: !1354)
!1356 = !DILocation(line: 219, column: 10, scope: !1352)
!1357 = !DILocation(line: 216, column: 3, scope: !1352)
!1358 = distinct !{!1358, !1227, !1359, !244}
!1359 = !DILocation(line: 221, column: 3, scope: !1228)
!1360 = !DILocalVariable(name: "tab", scope: !1180, file: !25, line: 223, type: !116)
!1361 = !DILocation(line: 223, column: 17, scope: !1180)
!1362 = !DILocalVariable(name: "i", scope: !1363, file: !25, line: 224, type: !15)
!1363 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 224, column: 3)
!1364 = !DILocation(line: 0, scope: !1363)
!1365 = !DILocation(line: 224, column: 8, scope: !1363)
!1366 = !DILocation(line: 224, scope: !1363)
!1367 = !DILocation(line: 224, column: 24, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !25, line: 224, column: 3)
!1369 = !DILocation(line: 224, column: 3, scope: !1363)
!1370 = !DILocation(line: 233, column: 3, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 233, column: 3)
!1372 = !DILocation(line: 225, column: 24, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1368, file: !25, line: 224, column: 43)
!1374 = !DILocation(line: 225, column: 18, scope: !1373)
!1375 = !DILocation(line: 225, column: 11, scope: !1373)
!1376 = !DILocation(line: 225, column: 5, scope: !1373)
!1377 = !DILocation(line: 225, column: 16, scope: !1373)
!1378 = !DILocation(line: 226, column: 22, scope: !1373)
!1379 = !DILocation(line: 226, column: 11, scope: !1373)
!1380 = !DILocation(line: 226, column: 15, scope: !1373)
!1381 = !DILocation(line: 226, column: 5, scope: !1373)
!1382 = !DILocation(line: 226, column: 20, scope: !1373)
!1383 = !DILocation(line: 227, column: 28, scope: !1373)
!1384 = !DILocation(line: 227, column: 22, scope: !1373)
!1385 = !DILocation(line: 227, column: 11, scope: !1373)
!1386 = !DILocation(line: 227, column: 15, scope: !1373)
!1387 = !DILocation(line: 227, column: 5, scope: !1373)
!1388 = !DILocation(line: 227, column: 20, scope: !1373)
!1389 = !DILocation(line: 228, column: 28, scope: !1373)
!1390 = !DILocation(line: 228, column: 22, scope: !1373)
!1391 = !DILocation(line: 228, column: 11, scope: !1373)
!1392 = !DILocation(line: 228, column: 15, scope: !1373)
!1393 = !DILocation(line: 228, column: 5, scope: !1373)
!1394 = !DILocation(line: 228, column: 20, scope: !1373)
!1395 = !DILocation(line: 224, column: 39, scope: !1368)
!1396 = !DILocation(line: 224, column: 3, scope: !1368)
!1397 = distinct !{!1397, !1369, !1398, !244}
!1398 = !DILocation(line: 229, column: 3, scope: !1363)
!1399 = !DILocation(line: 233, scope: !1371)
!1400 = !DILocalVariable(name: "c", scope: !1371, file: !25, line: 233, type: !15)
!1401 = !DILocation(line: 0, scope: !1371)
!1402 = !DILocation(line: 233, column: 24, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1371, file: !25, line: 233, column: 3)
!1404 = !DILocation(line: 234, column: 5, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1406, file: !25, line: 234, column: 5)
!1406 = distinct !DILexicalBlock(scope: !1403, file: !25, line: 233, column: 44)
!1407 = !DILocation(line: 256, column: 3, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1180, file: !25, line: 256, column: 3)
!1409 = !DILocation(line: 0, scope: !1405)
!1410 = !DILocalVariable(name: "r", scope: !1405, file: !25, line: 234, type: !45)
!1411 = !DILocation(line: 234, column: 32, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1405, file: !25, line: 234, column: 5)
!1413 = !DILocation(line: 236, column: 23, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1412, file: !25, line: 235, column: 15)
!1415 = !DILocation(line: 236, column: 29, scope: !1414)
!1416 = !DILocation(line: 236, column: 39, scope: !1414)
!1417 = !DILocation(line: 236, column: 48, scope: !1414)
!1418 = !DILocation(line: 236, column: 43, scope: !1414)
!1419 = !DILocalVariable(name: "pos", scope: !1414, file: !25, line: 236, type: !15)
!1420 = !DILocation(line: 0, scope: !1414)
!1421 = !DILocation(line: 237, column: 21, scope: !1414)
!1422 = !DILocation(line: 237, column: 28, scope: !1414)
!1423 = !DILocalVariable(name: "t0", scope: !1414, file: !25, line: 237, type: !6)
!1424 = !DILocation(line: 238, column: 29, scope: !1414)
!1425 = !DILocation(line: 238, column: 35, scope: !1414)
!1426 = !DILocalVariable(name: "t1", scope: !1414, file: !25, line: 238, type: !6)
!1427 = !DILocation(line: 239, column: 29, scope: !1414)
!1428 = !DILocation(line: 239, column: 35, scope: !1414)
!1429 = !DILocalVariable(name: "t2", scope: !1414, file: !25, line: 239, type: !6)
!1430 = !DILocation(line: 240, column: 22, scope: !1414)
!1431 = !DILocation(line: 240, column: 29, scope: !1414)
!1432 = !DILocation(line: 240, column: 35, scope: !1414)
!1433 = !DILocalVariable(name: "t3", scope: !1414, file: !25, line: 240, type: !6)
!1434 = !DILocalVariable(name: "t", scope: !1435, file: !25, line: 241, type: !15)
!1435 = distinct !DILexicalBlock(scope: !1414, file: !25, line: 241, column: 7)
!1436 = !DILocation(line: 0, scope: !1435)
!1437 = !DILocation(line: 241, column: 12, scope: !1435)
!1438 = !DILocation(line: 241, scope: !1435)
!1439 = !DILocation(line: 241, column: 28, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1435, file: !25, line: 241, column: 7)
!1441 = !DILocation(line: 241, column: 7, scope: !1435)
!1442 = !DILocation(line: 244, column: 24, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1440, file: !25, line: 241, column: 47)
!1444 = !DILocation(line: 244, column: 18, scope: !1443)
!1445 = !DILocation(line: 244, column: 16, scope: !1443)
!1446 = !DILocation(line: 244, column: 46, scope: !1443)
!1447 = !DILocation(line: 244, column: 50, scope: !1443)
!1448 = !DILocation(line: 244, column: 40, scope: !1443)
!1449 = !DILocation(line: 244, column: 38, scope: !1443)
!1450 = !DILocation(line: 244, column: 33, scope: !1443)
!1451 = !DILocation(line: 244, column: 68, scope: !1443)
!1452 = !DILocation(line: 244, column: 72, scope: !1443)
!1453 = !DILocation(line: 244, column: 62, scope: !1443)
!1454 = !DILocation(line: 244, column: 60, scope: !1443)
!1455 = !DILocation(line: 244, column: 55, scope: !1443)
!1456 = !DILocation(line: 245, column: 24, scope: !1443)
!1457 = !DILocation(line: 245, column: 28, scope: !1443)
!1458 = !DILocation(line: 245, column: 18, scope: !1443)
!1459 = !DILocation(line: 245, column: 16, scope: !1443)
!1460 = !DILocation(line: 244, column: 77, scope: !1443)
!1461 = !DILocation(line: 242, column: 15, scope: !1443)
!1462 = !DILocation(line: 242, column: 19, scope: !1443)
!1463 = !DILocation(line: 242, column: 33, scope: !1443)
!1464 = !DILocation(line: 242, column: 39, scope: !1443)
!1465 = !DILocation(line: 242, column: 49, scope: !1443)
!1466 = !DILocation(line: 243, column: 15, scope: !1443)
!1467 = !DILocation(line: 243, column: 19, scope: !1443)
!1468 = !DILocation(line: 243, column: 33, scope: !1443)
!1469 = !DILocation(line: 242, column: 53, scope: !1443)
!1470 = !DILocation(line: 242, column: 9, scope: !1443)
!1471 = !DILocation(line: 243, column: 40, scope: !1443)
!1472 = !DILocation(line: 241, column: 43, scope: !1440)
!1473 = !DILocation(line: 241, column: 7, scope: !1440)
!1474 = distinct !{!1474, !1441, !1475, !244}
!1475 = !DILocation(line: 246, column: 7, scope: !1435)
!1476 = !DILocation(line: 235, column: 11, scope: !1412)
!1477 = !DILocation(line: 234, column: 5, scope: !1412)
!1478 = distinct !{!1478, !1404, !1479, !244}
!1479 = !DILocation(line: 247, column: 5, scope: !1405)
!1480 = !DILocation(line: 233, column: 37, scope: !1403)
!1481 = !DILocation(line: 233, column: 3, scope: !1403)
!1482 = distinct !{!1482, !1370, !1483, !244}
!1483 = !DILocation(line: 248, column: 3, scope: !1371)
!1484 = !DILocation(line: 256, scope: !1408)
!1485 = !DILocalVariable(name: "r", scope: !1408, file: !25, line: 256, type: !45)
!1486 = !DILocation(line: 0, scope: !1408)
!1487 = !DILocation(line: 256, column: 21, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1408, file: !25, line: 256, column: 3)
!1489 = !DILocation(line: 257, column: 5, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1491, file: !25, line: 257, column: 5)
!1491 = distinct !DILexicalBlock(scope: !1488, file: !25, line: 256, column: 44)
!1492 = !DILocation(line: 257, scope: !1490)
!1493 = !DILocalVariable(name: "c", scope: !1490, file: !25, line: 257, type: !45)
!1494 = !DILocation(line: 0, scope: !1490)
!1495 = !DILocation(line: 257, column: 23, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1490, file: !25, line: 257, column: 5)
!1497 = !DILocation(line: 258, column: 7, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1499, file: !25, line: 258, column: 7)
!1499 = distinct !DILexicalBlock(scope: !1496, file: !25, line: 257, column: 55)
!1500 = !DILocation(line: 258, scope: !1498)
!1501 = !DILocalVariable(name: "i", scope: !1498, file: !25, line: 258, type: !45)
!1502 = !DILocation(line: 0, scope: !1498)
!1503 = !DILocation(line: 258, column: 29, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1498, file: !25, line: 258, column: 7)
!1505 = !DILocation(line: 259, column: 48, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1504, file: !25, line: 258, column: 48)
!1507 = !DILocation(line: 259, column: 53, scope: !1506)
!1508 = !DILocation(line: 259, column: 57, scope: !1506)
!1509 = !DILocation(line: 259, column: 34, scope: !1506)
!1510 = !DILocation(line: 260, column: 45, scope: !1506)
!1511 = !DILocation(line: 260, column: 40, scope: !1506)
!1512 = !DILocation(line: 260, column: 22, scope: !1506)
!1513 = !DILocation(line: 260, column: 50, scope: !1506)
!1514 = !DILocation(line: 261, column: 16, scope: !1506)
!1515 = !DILocation(line: 259, column: 9, scope: !1506)
!1516 = !DILocation(line: 258, column: 44, scope: !1504)
!1517 = !DILocation(line: 258, column: 7, scope: !1504)
!1518 = distinct !{!1518, !1497, !1519, !244}
!1519 = !DILocation(line: 262, column: 7, scope: !1498)
!1520 = !DILocation(line: 257, column: 48, scope: !1496)
!1521 = !DILocation(line: 257, column: 5, scope: !1496)
!1522 = distinct !{!1522, !1489, !1523, !244}
!1523 = !DILocation(line: 263, column: 5, scope: !1490)
!1524 = !DILocation(line: 256, column: 37, scope: !1488)
!1525 = !DILocation(line: 256, column: 3, scope: !1488)
!1526 = distinct !{!1526, !1407, !1527, !244}
!1527 = !DILocation(line: 264, column: 3, scope: !1408)
!1528 = !DILocation(line: 266, column: 1, scope: !1180)
!1529 = distinct !DISubprogram(name: "mat_mul", scope: !595, file: !595, line: 82, type: !1530, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1530 = !DISubroutineType(types: !1531)
!1531 = !{null, !49, !49, !18, !45, !45, !45}
!1532 = !DILocalVariable(name: "a", arg: 1, scope: !1529, file: !595, line: 82, type: !49)
!1533 = !DILocation(line: 0, scope: !1529)
!1534 = !DILocalVariable(name: "b", arg: 2, scope: !1529, file: !595, line: 82, type: !49)
!1535 = !DILocalVariable(name: "c", arg: 3, scope: !1529, file: !595, line: 83, type: !18)
!1536 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1529, file: !595, line: 83, type: !45)
!1537 = !DILocalVariable(name: "row_a", arg: 5, scope: !1529, file: !595, line: 83, type: !45)
!1538 = !DILocalVariable(name: "col_b", arg: 6, scope: !1529, file: !595, line: 83, type: !45)
!1539 = !DILocalVariable(name: "i", scope: !1540, file: !595, line: 84, type: !45)
!1540 = distinct !DILexicalBlock(scope: !1529, file: !595, line: 84, column: 5)
!1541 = !DILocation(line: 0, scope: !1540)
!1542 = !DILocation(line: 84, column: 10, scope: !1540)
!1543 = !DILocation(line: 84, scope: !1540)
!1544 = !DILocation(line: 84, column: 23, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1540, file: !595, line: 84, column: 5)
!1546 = !DILocation(line: 84, column: 5, scope: !1540)
!1547 = !DILocation(line: 85, column: 9, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1549, file: !595, line: 85, column: 9)
!1549 = distinct !DILexicalBlock(scope: !1545, file: !595, line: 84, column: 53)
!1550 = !DILocation(line: 85, scope: !1548)
!1551 = !DILocalVariable(name: "j", scope: !1548, file: !595, line: 85, type: !45)
!1552 = !DILocation(line: 0, scope: !1548)
!1553 = !DILocation(line: 86, column: 18, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1555, file: !595, line: 85, column: 46)
!1555 = distinct !DILexicalBlock(scope: !1548, file: !595, line: 85, column: 9)
!1556 = !DILocation(line: 86, column: 16, scope: !1554)
!1557 = !DILocation(line: 85, column: 41, scope: !1555)
!1558 = !DILocation(line: 85, column: 9, scope: !1555)
!1559 = distinct !{!1559, !1547, !1560, !244}
!1560 = !DILocation(line: 87, column: 9, scope: !1548)
!1561 = !DILocation(line: 84, column: 32, scope: !1545)
!1562 = !DILocation(line: 84, column: 39, scope: !1545)
!1563 = !DILocation(line: 84, column: 5, scope: !1545)
!1564 = distinct !{!1564, !1546, !1565, !244}
!1565 = !DILocation(line: 88, column: 5, scope: !1540)
!1566 = !DILocation(line: 91, column: 1, scope: !1529)
!1567 = distinct !DISubprogram(name: "mat_add", scope: !595, file: !595, line: 93, type: !1568, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1568 = !DISubroutineType(types: !1569)
!1569 = !{null, !49, !49, !18, !45, !45}
!1570 = !DILocalVariable(name: "a", arg: 1, scope: !1567, file: !595, line: 93, type: !49)
!1571 = !DILocation(line: 0, scope: !1567)
!1572 = !DILocalVariable(name: "b", arg: 2, scope: !1567, file: !595, line: 93, type: !49)
!1573 = !DILocalVariable(name: "c", arg: 3, scope: !1567, file: !595, line: 94, type: !18)
!1574 = !DILocalVariable(name: "m", arg: 4, scope: !1567, file: !595, line: 94, type: !45)
!1575 = !DILocalVariable(name: "n", arg: 5, scope: !1567, file: !595, line: 94, type: !45)
!1576 = !DILocalVariable(name: "i", scope: !1577, file: !595, line: 95, type: !45)
!1577 = distinct !DILexicalBlock(scope: !1567, file: !595, line: 95, column: 5)
!1578 = !DILocation(line: 0, scope: !1577)
!1579 = !DILocation(line: 95, column: 10, scope: !1577)
!1580 = !DILocation(line: 95, scope: !1577)
!1581 = !DILocation(line: 95, column: 23, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1577, file: !595, line: 95, column: 5)
!1583 = !DILocation(line: 95, column: 5, scope: !1577)
!1584 = !DILocalVariable(name: "j", scope: !1585, file: !595, line: 96, type: !45)
!1585 = distinct !DILexicalBlock(scope: !1586, file: !595, line: 96, column: 9)
!1586 = distinct !DILexicalBlock(scope: !1582, file: !595, line: 95, column: 33)
!1587 = !DILocation(line: 0, scope: !1585)
!1588 = !DILocation(line: 97, column: 42, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1590, file: !595, line: 96, column: 37)
!1590 = distinct !DILexicalBlock(scope: !1585, file: !595, line: 96, column: 9)
!1591 = !DILocation(line: 97, column: 38, scope: !1589)
!1592 = !DILocation(line: 97, column: 60, scope: !1589)
!1593 = !DILocation(line: 97, column: 56, scope: !1589)
!1594 = !DILocation(line: 97, column: 32, scope: !1589)
!1595 = !DILocation(line: 97, column: 17, scope: !1589)
!1596 = !DILocation(line: 97, column: 30, scope: !1589)
!1597 = !DILocation(line: 95, column: 28, scope: !1582)
!1598 = !DILocation(line: 95, column: 5, scope: !1582)
!1599 = distinct !{!1599, !1583, !1600, !244}
!1600 = !DILocation(line: 99, column: 5, scope: !1577)
!1601 = !DILocation(line: 102, column: 1, scope: !1567)
!1602 = distinct !DISubprogram(name: "encode", scope: !25, file: !25, line: 34, type: !379, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1603 = !DILocalVariable(name: "m", arg: 1, scope: !1602, file: !25, line: 34, type: !49)
!1604 = !DILocation(line: 0, scope: !1602)
!1605 = !DILocalVariable(name: "menc", arg: 2, scope: !1602, file: !25, line: 34, type: !18)
!1606 = !DILocalVariable(name: "mlen", arg: 3, scope: !1602, file: !25, line: 34, type: !45)
!1607 = !DILocalVariable(name: "i", scope: !1602, file: !25, line: 35, type: !45)
!1608 = !DILocation(line: 36, column: 8, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1602, file: !25, line: 36, column: 3)
!1610 = !DILocation(line: 36, scope: !1609)
!1611 = !DILocation(line: 36, column: 17, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1609, file: !25, line: 36, column: 3)
!1613 = !DILocation(line: 36, column: 3, scope: !1609)
!1614 = !DILocation(line: 37, column: 16, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1612, file: !25, line: 36, column: 42)
!1616 = !DILocation(line: 37, column: 27, scope: !1615)
!1617 = !DILocation(line: 37, column: 23, scope: !1615)
!1618 = !DILocation(line: 37, column: 32, scope: !1615)
!1619 = !DILocation(line: 37, column: 20, scope: !1615)
!1620 = !DILocation(line: 37, column: 5, scope: !1615)
!1621 = !DILocation(line: 37, column: 13, scope: !1615)
!1622 = !DILocation(line: 36, column: 29, scope: !1612)
!1623 = !DILocation(line: 36, column: 36, scope: !1612)
!1624 = !DILocation(line: 36, column: 3, scope: !1612)
!1625 = distinct !{!1625, !1613, !1626, !244}
!1626 = !DILocation(line: 38, column: 3, scope: !1609)
!1627 = !DILocation(line: 44, column: 1, scope: !1602)
!1628 = distinct !DISubprogram(name: "add_f", scope: !595, file: !595, line: 44, type: !1629, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1629 = !DISubroutineType(types: !1630)
!1630 = !{!14, !14, !14}
!1631 = !DILocalVariable(name: "a", arg: 1, scope: !1628, file: !595, line: 44, type: !14)
!1632 = !DILocation(line: 0, scope: !1628)
!1633 = !DILocalVariable(name: "b", arg: 2, scope: !1628, file: !595, line: 44, type: !14)
!1634 = !DILocation(line: 45, column: 14, scope: !1628)
!1635 = !DILocation(line: 45, column: 5, scope: !1628)
!1636 = distinct !DISubprogram(name: "lincomb", scope: !595, file: !595, line: 71, type: !1637, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1637 = !DISubroutineType(types: !1638)
!1638 = !{!14, !49, !49, !45, !45}
!1639 = !DILocalVariable(name: "a", arg: 1, scope: !1636, file: !595, line: 71, type: !49)
!1640 = !DILocation(line: 0, scope: !1636)
!1641 = !DILocalVariable(name: "b", arg: 2, scope: !1636, file: !595, line: 72, type: !49)
!1642 = !DILocalVariable(name: "n", arg: 3, scope: !1636, file: !595, line: 72, type: !45)
!1643 = !DILocalVariable(name: "m", arg: 4, scope: !1636, file: !595, line: 72, type: !45)
!1644 = !DILocalVariable(name: "ret", scope: !1636, file: !595, line: 73, type: !14)
!1645 = !DILocalVariable(name: "i", scope: !1646, file: !595, line: 74, type: !45)
!1646 = distinct !DILexicalBlock(scope: !1636, file: !595, line: 74, column: 5)
!1647 = !DILocation(line: 0, scope: !1646)
!1648 = !DILocation(line: 74, column: 10, scope: !1646)
!1649 = !DILocation(line: 74, scope: !1646)
!1650 = !DILocation(line: 74, column: 23, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1646, file: !595, line: 74, column: 5)
!1652 = !DILocation(line: 74, column: 5, scope: !1646)
!1653 = !DILocation(line: 75, column: 27, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1651, file: !595, line: 74, column: 41)
!1655 = !DILocation(line: 75, column: 33, scope: !1654)
!1656 = !DILocation(line: 75, column: 21, scope: !1654)
!1657 = !DILocation(line: 75, column: 15, scope: !1654)
!1658 = !DILocation(line: 74, column: 28, scope: !1651)
!1659 = !DILocation(line: 74, column: 35, scope: !1651)
!1660 = !DILocation(line: 74, column: 5, scope: !1651)
!1661 = distinct !{!1661, !1652, !1662, !244}
!1662 = !DILocation(line: 76, column: 5, scope: !1646)
!1663 = !DILocation(line: 79, column: 5, scope: !1636)
!1664 = distinct !DISubprogram(name: "mul_f", scope: !595, file: !595, line: 10, type: !1629, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1665 = !DILocalVariable(name: "a", arg: 1, scope: !1664, file: !595, line: 10, type: !14)
!1666 = !DILocation(line: 0, scope: !1664)
!1667 = !DILocalVariable(name: "b", arg: 2, scope: !1664, file: !595, line: 10, type: !14)
!1668 = !DILocation(line: 15, column: 10, scope: !1664)
!1669 = !DILocation(line: 15, column: 7, scope: !1664)
!1670 = !DILocation(line: 18, column: 17, scope: !1664)
!1671 = !DILocalVariable(name: "p", scope: !1664, file: !595, line: 12, type: !14)
!1672 = !DILocation(line: 19, column: 13, scope: !1664)
!1673 = !DILocation(line: 19, column: 17, scope: !1664)
!1674 = !DILocation(line: 19, column: 7, scope: !1664)
!1675 = !DILocation(line: 20, column: 13, scope: !1664)
!1676 = !DILocation(line: 20, column: 17, scope: !1664)
!1677 = !DILocation(line: 20, column: 7, scope: !1664)
!1678 = !DILocation(line: 21, column: 13, scope: !1664)
!1679 = !DILocation(line: 21, column: 17, scope: !1664)
!1680 = !DILocation(line: 21, column: 7, scope: !1664)
!1681 = !DILocalVariable(name: "top_p", scope: !1664, file: !595, line: 24, type: !14)
!1682 = !DILocation(line: 25, column: 37, scope: !1664)
!1683 = !DILocation(line: 25, column: 52, scope: !1664)
!1684 = !DILocation(line: 25, column: 43, scope: !1664)
!1685 = !DILocation(line: 25, column: 59, scope: !1664)
!1686 = !DILocalVariable(name: "out", scope: !1664, file: !595, line: 25, type: !14)
!1687 = !DILocation(line: 26, column: 5, scope: !1664)
!1688 = !DILocalVariable(name: "M", arg: 1, scope: !24, file: !25, line: 117, type: !5)
!1689 = !DILocation(line: 0, scope: !24)
!1690 = !DILocalVariable(name: "i", scope: !1691, file: !25, line: 123, type: !15)
!1691 = distinct !DILexicalBlock(scope: !24, file: !25, line: 123, column: 3)
!1692 = !DILocation(line: 0, scope: !1691)
!1693 = !DILocation(line: 123, column: 8, scope: !1691)
!1694 = !DILocation(line: 123, scope: !1691)
!1695 = !DILocation(line: 123, column: 24, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !25, line: 123, column: 3)
!1697 = !DILocation(line: 123, column: 3, scope: !1691)
!1698 = !DILocation(line: 129, column: 3, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !24, file: !25, line: 129, column: 3)
!1700 = !DILocation(line: 124, column: 20, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1696, file: !25, line: 123, column: 38)
!1702 = !DILocation(line: 124, column: 25, scope: !1701)
!1703 = !DILocation(line: 124, column: 37, scope: !1701)
!1704 = !DILocation(line: 124, column: 33, scope: !1701)
!1705 = !DILocation(line: 124, column: 31, scope: !1701)
!1706 = !DILocation(line: 124, column: 43, scope: !1701)
!1707 = !DILocalVariable(name: "t", scope: !1701, file: !25, line: 124, type: !6)
!1708 = !DILocation(line: 0, scope: !1701)
!1709 = !DILocation(line: 125, column: 15, scope: !1701)
!1710 = !DILocation(line: 125, column: 5, scope: !1701)
!1711 = !DILocation(line: 125, column: 10, scope: !1701)
!1712 = !DILocation(line: 126, column: 9, scope: !1701)
!1713 = !DILocation(line: 126, column: 5, scope: !1701)
!1714 = !DILocation(line: 126, column: 14, scope: !1701)
!1715 = !DILocation(line: 123, column: 32, scope: !1696)
!1716 = !DILocation(line: 123, column: 3, scope: !1696)
!1717 = distinct !{!1717, !1697, !1718, !244}
!1718 = !DILocation(line: 127, column: 3, scope: !1691)
!1719 = !DILocation(line: 129, scope: !1699)
!1720 = !DILocalVariable(name: "i", scope: !1699, file: !25, line: 129, type: !15)
!1721 = !DILocation(line: 0, scope: !1699)
!1722 = !DILocation(line: 129, column: 24, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1699, file: !25, line: 129, column: 3)
!1724 = !DILocation(line: 138, column: 3, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !24, file: !25, line: 138, column: 3)
!1726 = !DILocation(line: 130, column: 21, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1723, file: !25, line: 129, column: 38)
!1728 = !DILocation(line: 130, column: 26, scope: !1727)
!1729 = !DILocation(line: 130, column: 38, scope: !1727)
!1730 = !DILocation(line: 130, column: 34, scope: !1727)
!1731 = !DILocation(line: 130, column: 32, scope: !1727)
!1732 = !DILocation(line: 130, column: 44, scope: !1727)
!1733 = !DILocalVariable(name: "t0", scope: !1727, file: !25, line: 130, type: !6)
!1734 = !DILocation(line: 0, scope: !1727)
!1735 = !DILocation(line: 131, column: 25, scope: !1727)
!1736 = !DILocation(line: 131, column: 21, scope: !1727)
!1737 = !DILocation(line: 131, column: 30, scope: !1727)
!1738 = !DILocation(line: 131, column: 42, scope: !1727)
!1739 = !DILocation(line: 131, column: 38, scope: !1727)
!1740 = !DILocation(line: 131, column: 36, scope: !1727)
!1741 = !DILocation(line: 131, column: 48, scope: !1727)
!1742 = !DILocalVariable(name: "t1", scope: !1727, file: !25, line: 131, type: !6)
!1743 = !DILocation(line: 132, column: 17, scope: !1727)
!1744 = !DILocation(line: 132, column: 5, scope: !1727)
!1745 = !DILocation(line: 132, column: 10, scope: !1727)
!1746 = !DILocation(line: 133, column: 21, scope: !1727)
!1747 = !DILocation(line: 133, column: 9, scope: !1727)
!1748 = !DILocation(line: 133, column: 5, scope: !1727)
!1749 = !DILocation(line: 133, column: 14, scope: !1727)
!1750 = !DILocation(line: 134, column: 9, scope: !1727)
!1751 = !DILocation(line: 134, column: 5, scope: !1727)
!1752 = !DILocation(line: 134, column: 14, scope: !1727)
!1753 = !DILocation(line: 135, column: 9, scope: !1727)
!1754 = !DILocation(line: 135, column: 5, scope: !1727)
!1755 = !DILocation(line: 135, column: 14, scope: !1727)
!1756 = !DILocation(line: 129, column: 32, scope: !1723)
!1757 = !DILocation(line: 129, column: 3, scope: !1723)
!1758 = distinct !{!1758, !1698, !1759, !244}
!1759 = !DILocation(line: 136, column: 3, scope: !1699)
!1760 = !DILocation(line: 138, scope: !1725)
!1761 = !DILocalVariable(name: "i", scope: !1725, file: !25, line: 138, type: !15)
!1762 = !DILocation(line: 0, scope: !1725)
!1763 = !DILocation(line: 138, column: 24, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1725, file: !25, line: 138, column: 3)
!1765 = !DILocation(line: 148, column: 3, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !24, file: !25, line: 148, column: 3)
!1767 = !DILocation(line: 139, column: 21, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1764, file: !25, line: 138, column: 34)
!1769 = !DILocation(line: 139, column: 26, scope: !1768)
!1770 = !DILocation(line: 139, column: 39, scope: !1768)
!1771 = !DILocation(line: 139, column: 35, scope: !1768)
!1772 = !DILocation(line: 139, column: 33, scope: !1768)
!1773 = !DILocation(line: 139, column: 45, scope: !1768)
!1774 = !DILocalVariable(name: "t0", scope: !1768, file: !25, line: 139, type: !6)
!1775 = !DILocation(line: 0, scope: !1768)
!1776 = !DILocation(line: 140, column: 25, scope: !1768)
!1777 = !DILocation(line: 140, column: 21, scope: !1768)
!1778 = !DILocation(line: 140, column: 30, scope: !1768)
!1779 = !DILocation(line: 140, column: 43, scope: !1768)
!1780 = !DILocation(line: 140, column: 39, scope: !1768)
!1781 = !DILocation(line: 140, column: 37, scope: !1768)
!1782 = !DILocation(line: 140, column: 50, scope: !1768)
!1783 = !DILocalVariable(name: "t1", scope: !1768, file: !25, line: 140, type: !6)
!1784 = !DILocation(line: 142, column: 16, scope: !1768)
!1785 = !DILocation(line: 142, column: 5, scope: !1768)
!1786 = !DILocation(line: 142, column: 10, scope: !1768)
!1787 = !DILocation(line: 143, column: 20, scope: !1768)
!1788 = !DILocation(line: 143, column: 9, scope: !1768)
!1789 = !DILocation(line: 143, column: 5, scope: !1768)
!1790 = !DILocation(line: 143, column: 14, scope: !1768)
!1791 = !DILocation(line: 144, column: 9, scope: !1768)
!1792 = !DILocation(line: 144, column: 5, scope: !1768)
!1793 = !DILocation(line: 144, column: 14, scope: !1768)
!1794 = !DILocation(line: 145, column: 9, scope: !1768)
!1795 = !DILocation(line: 145, column: 5, scope: !1768)
!1796 = !DILocation(line: 145, column: 15, scope: !1768)
!1797 = !DILocation(line: 138, column: 30, scope: !1764)
!1798 = !DILocation(line: 138, column: 3, scope: !1764)
!1799 = distinct !{!1799, !1724, !1800, !244}
!1800 = !DILocation(line: 146, column: 3, scope: !1725)
!1801 = !DILocation(line: 148, scope: !1766)
!1802 = !DILocalVariable(name: "i", scope: !1766, file: !25, line: 148, type: !15)
!1803 = !DILocation(line: 0, scope: !1766)
!1804 = !DILocation(line: 148, column: 24, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1766, file: !25, line: 148, column: 3)
!1806 = !DILocation(line: 149, column: 20, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1805, file: !25, line: 148, column: 34)
!1808 = !DILocation(line: 149, column: 25, scope: !1807)
!1809 = !DILocation(line: 149, column: 38, scope: !1807)
!1810 = !DILocation(line: 149, column: 34, scope: !1807)
!1811 = !DILocation(line: 149, column: 44, scope: !1807)
!1812 = !DILocalVariable(name: "t", scope: !1807, file: !25, line: 149, type: !6)
!1813 = !DILocation(line: 0, scope: !1807)
!1814 = !DILocation(line: 150, column: 15, scope: !1807)
!1815 = !DILocation(line: 150, column: 5, scope: !1807)
!1816 = !DILocation(line: 150, column: 10, scope: !1807)
!1817 = !DILocation(line: 151, column: 9, scope: !1807)
!1818 = !DILocation(line: 151, column: 5, scope: !1807)
!1819 = !DILocation(line: 151, column: 14, scope: !1807)
!1820 = !DILocation(line: 148, column: 30, scope: !1805)
!1821 = !DILocation(line: 148, column: 3, scope: !1805)
!1822 = distinct !{!1822, !1765, !1823, !244}
!1823 = !DILocation(line: 152, column: 3, scope: !1766)
!1824 = !DILocation(line: 153, column: 1, scope: !24)
!1825 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !425, file: !425, line: 63, type: !481, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1826 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1825, file: !425, line: 63, type: !343)
!1827 = !DILocation(line: 0, scope: !1825)
!1828 = !DILocalVariable(name: "mat", arg: 2, scope: !1825, file: !425, line: 63, type: !49)
!1829 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1825, file: !425, line: 63, type: !428)
!1830 = !DILocalVariable(name: "acc", arg: 4, scope: !1825, file: !425, line: 63, type: !5)
!1831 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1825, file: !425, line: 64, type: !343)
!1832 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1825, file: !425, line: 64, type: !343)
!1833 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1825, file: !425, line: 64, type: !343)
!1834 = !DILocalVariable(name: "r", scope: !1835, file: !425, line: 66, type: !45)
!1835 = distinct !DILexicalBlock(scope: !1825, file: !425, line: 66, column: 5)
!1836 = !DILocation(line: 0, scope: !1835)
!1837 = !DILocation(line: 66, column: 10, scope: !1835)
!1838 = !DILocation(line: 66, scope: !1835)
!1839 = !DILocation(line: 66, column: 23, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1835, file: !425, line: 66, column: 5)
!1841 = !DILocation(line: 66, column: 5, scope: !1835)
!1842 = !DILocation(line: 67, column: 9, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1844, file: !425, line: 67, column: 9)
!1844 = distinct !DILexicalBlock(scope: !1840, file: !425, line: 66, column: 40)
!1845 = !DILocation(line: 67, scope: !1843)
!1846 = !DILocalVariable(name: "c", scope: !1843, file: !425, line: 67, type: !45)
!1847 = !DILocation(line: 0, scope: !1843)
!1848 = !DILocation(line: 67, column: 27, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1843, file: !425, line: 67, column: 9)
!1850 = !DILocation(line: 68, column: 13, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1852, file: !425, line: 68, column: 13)
!1852 = distinct !DILexicalBlock(scope: !1849, file: !425, line: 67, column: 44)
!1853 = !DILocation(line: 68, scope: !1851)
!1854 = !DILocalVariable(name: "k", scope: !1851, file: !425, line: 68, type: !45)
!1855 = !DILocation(line: 0, scope: !1851)
!1856 = !DILocation(line: 68, column: 31, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1851, file: !425, line: 68, column: 13)
!1858 = !DILocation(line: 69, column: 70, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1857, file: !425, line: 68, column: 54)
!1860 = !DILocation(line: 69, column: 84, scope: !1859)
!1861 = !DILocation(line: 69, column: 51, scope: !1859)
!1862 = !DILocation(line: 69, column: 96, scope: !1859)
!1863 = !DILocation(line: 69, column: 90, scope: !1859)
!1864 = !DILocation(line: 69, column: 136, scope: !1859)
!1865 = !DILocation(line: 69, column: 150, scope: !1859)
!1866 = !DILocation(line: 69, column: 117, scope: !1859)
!1867 = !DILocation(line: 69, column: 17, scope: !1859)
!1868 = !DILocation(line: 68, column: 48, scope: !1857)
!1869 = !DILocation(line: 68, column: 13, scope: !1857)
!1870 = distinct !{!1870, !1850, !1871, !244}
!1871 = !DILocation(line: 70, column: 13, scope: !1851)
!1872 = !DILocation(line: 67, column: 40, scope: !1849)
!1873 = !DILocation(line: 67, column: 9, scope: !1849)
!1874 = distinct !{!1874, !1842, !1875, !244}
!1875 = !DILocation(line: 71, column: 9, scope: !1843)
!1876 = !DILocation(line: 66, column: 36, scope: !1840)
!1877 = !DILocation(line: 66, column: 5, scope: !1840)
!1878 = distinct !{!1878, !1841, !1879, !244}
!1879 = !DILocation(line: 72, column: 5, scope: !1835)
!1880 = !DILocation(line: 73, column: 1, scope: !1825)
!1881 = distinct !DISubprogram(name: "P1_times_Vt", scope: !425, file: !425, line: 86, type: !471, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1882 = !DILocalVariable(name: "p", arg: 1, scope: !1881, file: !425, line: 86, type: !278)
!1883 = !DILocation(line: 0, scope: !1881)
!1884 = !DILocalVariable(name: "P1", arg: 2, scope: !1881, file: !425, line: 86, type: !428)
!1885 = !DILocalVariable(name: "V", arg: 3, scope: !1881, file: !425, line: 86, type: !49)
!1886 = !DILocalVariable(name: "acc", arg: 4, scope: !1881, file: !425, line: 86, type: !5)
!1887 = !DILocation(line: 90, column: 5, scope: !1881)
!1888 = !DILocation(line: 92, column: 1, scope: !1881)
!1889 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !425, file: !425, line: 32, type: !611, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1890 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1889, file: !425, line: 32, type: !343)
!1891 = !DILocation(line: 0, scope: !1889)
!1892 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1889, file: !425, line: 32, type: !428)
!1893 = !DILocalVariable(name: "mat", arg: 3, scope: !1889, file: !425, line: 32, type: !49)
!1894 = !DILocalVariable(name: "acc", arg: 4, scope: !1889, file: !425, line: 32, type: !5)
!1895 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1889, file: !425, line: 33, type: !343)
!1896 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1889, file: !425, line: 33, type: !343)
!1897 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1889, file: !425, line: 33, type: !343)
!1898 = !DILocalVariable(name: "triangular", arg: 8, scope: !1889, file: !425, line: 33, type: !343)
!1899 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1889, file: !425, line: 34, type: !45)
!1900 = !DILocalVariable(name: "r", scope: !1901, file: !425, line: 35, type: !45)
!1901 = distinct !DILexicalBlock(scope: !1889, file: !425, line: 35, column: 5)
!1902 = !DILocation(line: 0, scope: !1901)
!1903 = !DILocation(line: 35, column: 10, scope: !1901)
!1904 = !DILocation(line: 34, column: 9, scope: !1889)
!1905 = !DILocation(line: 35, scope: !1901)
!1906 = !DILocation(line: 35, column: 23, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1901, file: !425, line: 35, column: 5)
!1908 = !DILocation(line: 35, column: 5, scope: !1901)
!1909 = !DILocation(line: 36, column: 9, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1911, file: !425, line: 36, column: 9)
!1911 = distinct !DILexicalBlock(scope: !1907, file: !425, line: 35, column: 43)
!1912 = !DILocation(line: 36, scope: !1910)
!1913 = !DILocalVariable(name: "c", scope: !1910, file: !425, line: 36, type: !45)
!1914 = !DILocation(line: 0, scope: !1910)
!1915 = !DILocation(line: 36, column: 40, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1910, file: !425, line: 36, column: 9)
!1917 = !DILocation(line: 37, column: 13, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1919, file: !425, line: 37, column: 13)
!1919 = distinct !DILexicalBlock(scope: !1916, file: !425, line: 36, column: 60)
!1920 = !DILocation(line: 37, scope: !1918)
!1921 = !DILocalVariable(name: "k", scope: !1918, file: !425, line: 37, type: !45)
!1922 = !DILocation(line: 0, scope: !1918)
!1923 = !DILocation(line: 37, column: 31, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1918, file: !425, line: 37, column: 13)
!1925 = !DILocation(line: 38, column: 51, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1924, file: !425, line: 37, column: 51)
!1927 = !DILocation(line: 38, column: 94, scope: !1926)
!1928 = !DILocation(line: 38, column: 88, scope: !1926)
!1929 = !DILocation(line: 38, column: 137, scope: !1926)
!1930 = !DILocation(line: 38, column: 148, scope: !1926)
!1931 = !DILocation(line: 38, column: 118, scope: !1926)
!1932 = !DILocation(line: 38, column: 17, scope: !1926)
!1933 = !DILocation(line: 37, column: 45, scope: !1924)
!1934 = !DILocation(line: 37, column: 13, scope: !1924)
!1935 = distinct !{!1935, !1917, !1936, !244}
!1936 = !DILocation(line: 39, column: 13, scope: !1918)
!1937 = !DILocation(line: 40, column: 33, scope: !1919)
!1938 = !DILocation(line: 36, column: 56, scope: !1916)
!1939 = !DILocation(line: 36, column: 9, scope: !1916)
!1940 = distinct !{!1940, !1909, !1941, !244}
!1941 = !DILocation(line: 41, column: 9, scope: !1910)
!1942 = !DILocation(line: 35, column: 39, scope: !1907)
!1943 = !DILocation(line: 35, column: 5, scope: !1907)
!1944 = distinct !{!1944, !1908, !1945, !244}
!1945 = !DILocation(line: 42, column: 5, scope: !1901)
!1946 = !DILocation(line: 43, column: 1, scope: !1889)
!1947 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign", scope: !25, file: !25, line: 515, type: !804, scopeLine: 516, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1948 = !DILocalVariable(name: "p", arg: 1, scope: !1947, file: !25, line: 515, type: !278)
!1949 = !DILocation(line: 0, scope: !1947)
!1950 = !DILocalVariable(name: "sm", arg: 2, scope: !1947, file: !25, line: 515, type: !18)
!1951 = !DILocalVariable(name: "smlen", arg: 3, scope: !1947, file: !25, line: 515, type: !806)
!1952 = !DILocalVariable(name: "m", arg: 4, scope: !1947, file: !25, line: 516, type: !49)
!1953 = !DILocalVariable(name: "mlen", arg: 5, scope: !1947, file: !25, line: 516, type: !15)
!1954 = !DILocalVariable(name: "csk", arg: 6, scope: !1947, file: !25, line: 516, type: !49)
!1955 = !DILocalVariable(name: "ret", scope: !1947, file: !25, line: 517, type: !45)
!1956 = !DILocalVariable(name: "param_sig_bytes", scope: !1947, file: !25, line: 518, type: !343)
!1957 = !DILocation(line: 520, column: 14, scope: !1947)
!1958 = !DILocation(line: 520, column: 3, scope: !1947)
!1959 = !DILocation(line: 521, column: 48, scope: !1947)
!1960 = !DILocalVariable(name: "siglen", scope: !1947, file: !25, line: 519, type: !15)
!1961 = !DILocation(line: 521, column: 9, scope: !1947)
!1962 = !DILocation(line: 522, column: 22, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1947, file: !25, line: 522, column: 7)
!1964 = !DILocation(line: 523, column: 19, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1963, file: !25, line: 522, column: 60)
!1966 = !DILocation(line: 523, column: 26, scope: !1965)
!1967 = !DILocation(line: 523, column: 5, scope: !1965)
!1968 = !DILocation(line: 524, column: 5, scope: !1965)
!1969 = !DILocation(line: 527, column: 12, scope: !1947)
!1970 = !DILocation(line: 527, column: 19, scope: !1947)
!1971 = !DILocation(line: 527, column: 10, scope: !1947)
!1972 = !DILocation(line: 527, column: 3, scope: !1947)
!1973 = !DILabel(scope: !1947, name: "err", file: !25, line: 528)
!1974 = !DILocation(line: 528, column: 1, scope: !1947)
!1975 = !DILocation(line: 529, column: 3, scope: !1947)
!1976 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_open", scope: !25, file: !25, line: 532, type: !804, scopeLine: 533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!1977 = !DILocalVariable(name: "p", arg: 1, scope: !1976, file: !25, line: 532, type: !278)
!1978 = !DILocation(line: 0, scope: !1976)
!1979 = !DILocalVariable(name: "m", arg: 2, scope: !1976, file: !25, line: 532, type: !18)
!1980 = !DILocalVariable(name: "mlen", arg: 3, scope: !1976, file: !25, line: 532, type: !806)
!1981 = !DILocalVariable(name: "sm", arg: 4, scope: !1976, file: !25, line: 533, type: !49)
!1982 = !DILocalVariable(name: "smlen", arg: 5, scope: !1976, file: !25, line: 533, type: !15)
!1983 = !DILocalVariable(name: "pk", arg: 6, scope: !1976, file: !25, line: 533, type: !49)
!1984 = !DILocalVariable(name: "param_sig_bytes", scope: !1976, file: !25, line: 534, type: !343)
!1985 = !DILocation(line: 535, column: 13, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1976, file: !25, line: 535, column: 7)
!1987 = !DILocation(line: 539, column: 25, scope: !1976)
!1988 = !DILocation(line: 539, column: 50, scope: !1976)
!1989 = !DILocation(line: 539, column: 7, scope: !1976)
!1990 = !DILocalVariable(name: "result", scope: !1976, file: !25, line: 538, type: !45)
!1991 = !DILocation(line: 541, column: 14, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1976, file: !25, line: 541, column: 7)
!1993 = !DILocation(line: 542, column: 19, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1992, file: !25, line: 541, column: 26)
!1995 = !DILocation(line: 542, column: 11, scope: !1994)
!1996 = !DILocation(line: 543, column: 19, scope: !1994)
!1997 = !DILocation(line: 543, column: 5, scope: !1994)
!1998 = !DILocation(line: 544, column: 3, scope: !1994)
!1999 = !DILocation(line: 547, column: 1, scope: !1976)
!2000 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_verify", scope: !25, file: !25, line: 631, type: !2001, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2001 = !DISubroutineType(types: !2002)
!2002 = !{!45, !278, !49, !15, !49, !49}
!2003 = !DILocalVariable(name: "p", arg: 1, scope: !2000, file: !25, line: 631, type: !278)
!2004 = !DILocation(line: 0, scope: !2000)
!2005 = !DILocalVariable(name: "m", arg: 2, scope: !2000, file: !25, line: 631, type: !49)
!2006 = !DILocalVariable(name: "mlen", arg: 3, scope: !2000, file: !25, line: 631, type: !15)
!2007 = !DILocalVariable(name: "sig", arg: 4, scope: !2000, file: !25, line: 632, type: !49)
!2008 = !DILocalVariable(name: "cpk", arg: 5, scope: !2000, file: !25, line: 632, type: !49)
!2009 = !DILocalVariable(name: "tEnc", scope: !2000, file: !25, line: 633, type: !816)
!2010 = !DILocation(line: 633, column: 17, scope: !2000)
!2011 = !DILocalVariable(name: "t", scope: !2000, file: !25, line: 634, type: !821)
!2012 = !DILocation(line: 634, column: 17, scope: !2000)
!2013 = !DILocalVariable(name: "y", scope: !2000, file: !25, line: 635, type: !2014)
!2014 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 1248, elements: !2015)
!2015 = !{!2016}
!2016 = !DISubrange(count: 156)
!2017 = !DILocation(line: 635, column: 17, scope: !2000)
!2018 = !DILocalVariable(name: "s", scope: !2000, file: !25, line: 636, type: !846)
!2019 = !DILocation(line: 636, column: 17, scope: !2000)
!2020 = !DILocalVariable(name: "pk", scope: !2000, file: !25, line: 637, type: !180)
!2021 = !DILocation(line: 637, column: 12, scope: !2000)
!2022 = !DILocalVariable(name: "tmp", scope: !2000, file: !25, line: 638, type: !2023)
!2023 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 448, elements: !2024)
!2024 = !{!2025}
!2025 = !DISubrange(count: 56)
!2026 = !DILocation(line: 638, column: 17, scope: !2000)
!2027 = !DILocalVariable(name: "param_m", scope: !2000, file: !25, line: 640, type: !343)
!2028 = !DILocalVariable(name: "param_n", scope: !2000, file: !25, line: 641, type: !343)
!2029 = !DILocalVariable(name: "param_k", scope: !2000, file: !25, line: 642, type: !343)
!2030 = !DILocalVariable(name: "param_m_bytes", scope: !2000, file: !25, line: 643, type: !343)
!2031 = !DILocalVariable(name: "param_sig_bytes", scope: !2000, file: !25, line: 644, type: !343)
!2032 = !DILocalVariable(name: "param_digest_bytes", scope: !2000, file: !25, line: 645, type: !343)
!2033 = !DILocalVariable(name: "param_salt_bytes", scope: !2000, file: !25, line: 646, type: !343)
!2034 = !DILocation(line: 648, column: 13, scope: !2000)
!2035 = !DILocalVariable(name: "ret", scope: !2000, file: !25, line: 648, type: !45)
!2036 = !DILocalVariable(name: "P1", scope: !2000, file: !25, line: 653, type: !5)
!2037 = !DILocation(line: 654, column: 21, scope: !2000)
!2038 = !DILocalVariable(name: "P2", scope: !2000, file: !25, line: 654, type: !5)
!2039 = !DILocation(line: 655, column: 21, scope: !2000)
!2040 = !DILocalVariable(name: "P3", scope: !2000, file: !25, line: 655, type: !5)
!2041 = !DILocation(line: 670, column: 3, scope: !2000)
!2042 = !DILocation(line: 673, column: 14, scope: !2000)
!2043 = !DILocation(line: 673, column: 58, scope: !2000)
!2044 = !DILocation(line: 673, column: 3, scope: !2000)
!2045 = !DILocation(line: 675, column: 3, scope: !2000)
!2046 = !DILocation(line: 676, column: 3, scope: !2000)
!2047 = !DILocation(line: 679, column: 3, scope: !2000)
!2048 = !DILocation(line: 681, column: 3, scope: !2000)
!2049 = !DILocation(line: 683, column: 7, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2000, file: !25, line: 683, column: 7)
!2051 = !DILocation(line: 683, column: 29, scope: !2050)
!2052 = !DILocation(line: 687, column: 1, scope: !2000)
!2053 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_pk", scope: !25, file: !25, line: 620, type: !705, scopeLine: 621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2054 = !DILocalVariable(name: "p", arg: 1, scope: !2053, file: !25, line: 620, type: !278)
!2055 = !DILocation(line: 0, scope: !2053)
!2056 = !DILocalVariable(name: "cpk", arg: 2, scope: !2053, file: !25, line: 620, type: !49)
!2057 = !DILocalVariable(name: "pk", arg: 3, scope: !2053, file: !25, line: 621, type: !5)
!2058 = !DILocation(line: 622, column: 3, scope: !2053)
!2059 = !DILocation(line: 624, column: 21, scope: !2053)
!2060 = !DILocation(line: 625, column: 40, scope: !2053)
!2061 = !DILocation(line: 624, column: 3, scope: !2053)
!2062 = !DILocation(line: 628, column: 3, scope: !2053)
!2063 = distinct !DISubprogram(name: "eval_public_map", scope: !25, file: !25, line: 300, type: !2064, scopeLine: 302, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2064 = !DISubroutineType(types: !2065)
!2065 = !{null, !278, !49, !428, !428, !428, !18}
!2066 = !DILocalVariable(name: "p", arg: 1, scope: !2063, file: !25, line: 300, type: !278)
!2067 = !DILocation(line: 0, scope: !2063)
!2068 = !DILocalVariable(name: "s", arg: 2, scope: !2063, file: !25, line: 300, type: !49)
!2069 = !DILocalVariable(name: "P1", arg: 3, scope: !2063, file: !25, line: 301, type: !428)
!2070 = !DILocalVariable(name: "P2", arg: 4, scope: !2063, file: !25, line: 301, type: !428)
!2071 = !DILocalVariable(name: "P3", arg: 5, scope: !2063, file: !25, line: 302, type: !428)
!2072 = !DILocalVariable(name: "eval", arg: 6, scope: !2063, file: !25, line: 302, type: !18)
!2073 = !DILocalVariable(name: "SPS", scope: !2063, file: !25, line: 303, type: !2074)
!2074 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32000, elements: !2075)
!2075 = !{!2076}
!2076 = !DISubrange(count: 500)
!2077 = !DILocation(line: 303, column: 12, scope: !2063)
!2078 = !DILocation(line: 305, column: 3, scope: !2063)
!2079 = !DILocalVariable(name: "zero", scope: !2063, file: !25, line: 306, type: !821)
!2080 = !DILocation(line: 306, column: 17, scope: !2063)
!2081 = !DILocation(line: 307, column: 3, scope: !2063)
!2082 = !DILocation(line: 308, column: 1, scope: !2063)
!2083 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !425, file: !425, line: 287, type: !2084, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2084 = !DISubroutineType(types: !2085)
!2085 = !{null, !278, !428, !428, !428, !49, !5}
!2086 = !DILocalVariable(name: "p", arg: 1, scope: !2083, file: !425, line: 287, type: !278)
!2087 = !DILocation(line: 0, scope: !2083)
!2088 = !DILocalVariable(name: "P1", arg: 2, scope: !2083, file: !425, line: 287, type: !428)
!2089 = !DILocalVariable(name: "P2", arg: 3, scope: !2083, file: !425, line: 287, type: !428)
!2090 = !DILocalVariable(name: "P3", arg: 4, scope: !2083, file: !425, line: 287, type: !428)
!2091 = !DILocalVariable(name: "s", arg: 5, scope: !2083, file: !425, line: 287, type: !49)
!2092 = !DILocalVariable(name: "SPS", arg: 6, scope: !2083, file: !425, line: 288, type: !5)
!2093 = !DILocalVariable(name: "PS", scope: !2083, file: !425, line: 296, type: !2094)
!2094 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 275200, elements: !2095)
!2095 = !{!2096}
!2096 = !DISubrange(count: 4300)
!2097 = !DILocation(line: 296, column: 14, scope: !2083)
!2098 = !DILocation(line: 297, column: 5, scope: !2083)
!2099 = !DILocation(line: 300, column: 5, scope: !2083)
!2100 = !DILocation(line: 302, column: 1, scope: !2083)
!2101 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !425, file: !425, line: 156, type: !2102, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2102 = !DISubroutineType(types: !2103)
!2103 = !{null, !428, !428, !428, !49, !343, !343, !343, !343, !5}
!2104 = !DILocalVariable(name: "P1", arg: 1, scope: !2101, file: !425, line: 156, type: !428)
!2105 = !DILocation(line: 0, scope: !2101)
!2106 = !DILocalVariable(name: "P2", arg: 2, scope: !2101, file: !425, line: 156, type: !428)
!2107 = !DILocalVariable(name: "P3", arg: 3, scope: !2101, file: !425, line: 156, type: !428)
!2108 = !DILocalVariable(name: "S", arg: 4, scope: !2101, file: !425, line: 156, type: !49)
!2109 = !DILocalVariable(name: "m", arg: 5, scope: !2101, file: !425, line: 157, type: !343)
!2110 = !DILocalVariable(name: "v", arg: 6, scope: !2101, file: !425, line: 157, type: !343)
!2111 = !DILocalVariable(name: "o", arg: 7, scope: !2101, file: !425, line: 157, type: !343)
!2112 = !DILocalVariable(name: "k", arg: 8, scope: !2101, file: !425, line: 157, type: !343)
!2113 = !DILocalVariable(name: "PS", arg: 9, scope: !2101, file: !425, line: 157, type: !5)
!2114 = !DILocalVariable(name: "n", scope: !2101, file: !425, line: 159, type: !343)
!2115 = !DILocalVariable(name: "m_vec_limbs", scope: !2101, file: !425, line: 160, type: !343)
!2116 = !DILocalVariable(name: "accumulator", scope: !2101, file: !425, line: 162, type: !2117)
!2117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 4403200, elements: !2118)
!2118 = !{!2119}
!2119 = !DISubrange(count: 68800)
!2120 = !DILocation(line: 162, column: 14, scope: !2101)
!2121 = !DILocalVariable(name: "P1_used", scope: !2101, file: !425, line: 163, type: !45)
!2122 = !DILocalVariable(name: "row", scope: !2123, file: !425, line: 164, type: !45)
!2123 = distinct !DILexicalBlock(scope: !2101, file: !425, line: 164, column: 5)
!2124 = !DILocation(line: 0, scope: !2123)
!2125 = !DILocation(line: 164, column: 10, scope: !2123)
!2126 = !DILocation(line: 163, column: 9, scope: !2101)
!2127 = !DILocation(line: 164, scope: !2123)
!2128 = !DILocation(line: 164, column: 27, scope: !2129)
!2129 = distinct !DILexicalBlock(scope: !2123, file: !425, line: 164, column: 5)
!2130 = !DILocation(line: 164, column: 5, scope: !2123)
!2131 = !DILocation(line: 165, column: 9, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2133, file: !425, line: 165, column: 9)
!2133 = distinct !DILexicalBlock(scope: !2129, file: !425, line: 164, column: 39)
!2134 = !DILocation(line: 180, column: 5, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2101, file: !425, line: 180, column: 5)
!2136 = !DILocation(line: 165, scope: !2132)
!2137 = !DILocalVariable(name: "j", scope: !2132, file: !425, line: 165, type: !45)
!2138 = !DILocation(line: 0, scope: !2132)
!2139 = !DILocation(line: 165, column: 29, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2132, file: !425, line: 165, column: 9)
!2141 = !DILocation(line: 172, column: 9, scope: !2142)
!2142 = distinct !DILexicalBlock(scope: !2133, file: !425, line: 172, column: 9)
!2143 = !DILocation(line: 166, column: 13, scope: !2144)
!2144 = distinct !DILexicalBlock(scope: !2145, file: !425, line: 166, column: 13)
!2145 = distinct !DILexicalBlock(scope: !2140, file: !425, line: 165, column: 39)
!2146 = !DILocation(line: 166, scope: !2144)
!2147 = !DILocalVariable(name: "col", scope: !2144, file: !425, line: 166, type: !45)
!2148 = !DILocation(line: 0, scope: !2144)
!2149 = !DILocation(line: 166, column: 35, scope: !2150)
!2150 = distinct !DILexicalBlock(scope: !2144, file: !425, line: 166, column: 13)
!2151 = !DILocation(line: 167, column: 43, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2150, file: !425, line: 166, column: 47)
!2153 = !DILocation(line: 167, column: 91, scope: !2152)
!2154 = !DILocation(line: 167, column: 95, scope: !2152)
!2155 = !DILocation(line: 167, column: 102, scope: !2152)
!2156 = !DILocation(line: 167, column: 115, scope: !2152)
!2157 = !DILocation(line: 167, column: 109, scope: !2152)
!2158 = !DILocation(line: 167, column: 107, scope: !2152)
!2159 = !DILocation(line: 167, column: 82, scope: !2152)
!2160 = !DILocation(line: 167, column: 17, scope: !2152)
!2161 = !DILocation(line: 166, column: 43, scope: !2150)
!2162 = !DILocation(line: 166, column: 13, scope: !2150)
!2163 = distinct !{!2163, !2143, !2164, !244}
!2164 = !DILocation(line: 168, column: 13, scope: !2144)
!2165 = !DILocation(line: 169, column: 21, scope: !2145)
!2166 = !DILocation(line: 165, column: 35, scope: !2140)
!2167 = !DILocation(line: 165, column: 9, scope: !2140)
!2168 = distinct !{!2168, !2131, !2169, !244}
!2169 = !DILocation(line: 170, column: 9, scope: !2132)
!2170 = !DILocation(line: 172, scope: !2142)
!2171 = !DILocalVariable(name: "j", scope: !2142, file: !425, line: 172, type: !45)
!2172 = !DILocation(line: 0, scope: !2142)
!2173 = !DILocation(line: 172, column: 27, scope: !2174)
!2174 = distinct !DILexicalBlock(scope: !2142, file: !425, line: 172, column: 9)
!2175 = !DILocation(line: 173, column: 13, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2177, file: !425, line: 173, column: 13)
!2177 = distinct !DILexicalBlock(scope: !2174, file: !425, line: 172, column: 37)
!2178 = !DILocation(line: 173, scope: !2176)
!2179 = !DILocalVariable(name: "col", scope: !2176, file: !425, line: 173, type: !45)
!2180 = !DILocation(line: 0, scope: !2176)
!2181 = !DILocation(line: 173, column: 35, scope: !2182)
!2182 = distinct !DILexicalBlock(scope: !2176, file: !425, line: 173, column: 13)
!2183 = !DILocation(line: 174, column: 50, scope: !2184)
!2184 = distinct !DILexicalBlock(scope: !2182, file: !425, line: 173, column: 47)
!2185 = !DILocation(line: 174, column: 54, scope: !2184)
!2186 = !DILocation(line: 174, column: 43, scope: !2184)
!2187 = !DILocation(line: 174, column: 93, scope: !2184)
!2188 = !DILocation(line: 174, column: 97, scope: !2184)
!2189 = !DILocation(line: 174, column: 104, scope: !2184)
!2190 = !DILocation(line: 174, column: 118, scope: !2184)
!2191 = !DILocation(line: 174, column: 111, scope: !2184)
!2192 = !DILocation(line: 174, column: 109, scope: !2184)
!2193 = !DILocation(line: 174, column: 84, scope: !2184)
!2194 = !DILocation(line: 174, column: 17, scope: !2184)
!2195 = !DILocation(line: 173, column: 43, scope: !2182)
!2196 = !DILocation(line: 173, column: 13, scope: !2182)
!2197 = distinct !{!2197, !2175, !2198, !244}
!2198 = !DILocation(line: 175, column: 13, scope: !2176)
!2199 = !DILocation(line: 172, column: 33, scope: !2174)
!2200 = !DILocation(line: 172, column: 9, scope: !2174)
!2201 = distinct !{!2201, !2141, !2202, !244}
!2202 = !DILocation(line: 176, column: 9, scope: !2142)
!2203 = !DILocation(line: 164, column: 35, scope: !2129)
!2204 = !DILocation(line: 164, column: 5, scope: !2129)
!2205 = distinct !{!2205, !2130, !2206, !244}
!2206 = !DILocation(line: 177, column: 5, scope: !2123)
!2207 = !DILocation(line: 179, column: 9, scope: !2101)
!2208 = !DILocation(line: 180, scope: !2135)
!2209 = !DILocalVariable(name: "row", scope: !2135, file: !425, line: 180, type: !45)
!2210 = !DILocation(line: 0, scope: !2135)
!2211 = !DILocalVariable(name: "P3_used", scope: !2101, file: !425, line: 179, type: !45)
!2212 = !DILocation(line: 180, column: 27, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2135, file: !425, line: 180, column: 5)
!2214 = !DILocation(line: 181, column: 9, scope: !2215)
!2215 = distinct !DILexicalBlock(scope: !2216, file: !425, line: 181, column: 9)
!2216 = distinct !DILexicalBlock(scope: !2213, file: !425, line: 180, column: 39)
!2217 = !DILocation(line: 191, column: 5, scope: !2101)
!2218 = !DILocation(line: 181, scope: !2215)
!2219 = !DILocalVariable(name: "j", scope: !2215, file: !425, line: 181, type: !45)
!2220 = !DILocation(line: 0, scope: !2215)
!2221 = !DILocation(line: 181, column: 29, scope: !2222)
!2222 = distinct !DILexicalBlock(scope: !2215, file: !425, line: 181, column: 9)
!2223 = !DILocation(line: 182, column: 13, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2225, file: !425, line: 182, column: 13)
!2225 = distinct !DILexicalBlock(scope: !2222, file: !425, line: 181, column: 39)
!2226 = !DILocation(line: 182, scope: !2224)
!2227 = !DILocalVariable(name: "col", scope: !2224, file: !425, line: 182, type: !45)
!2228 = !DILocation(line: 0, scope: !2224)
!2229 = !DILocation(line: 182, column: 35, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2224, file: !425, line: 182, column: 13)
!2231 = !DILocation(line: 183, column: 43, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2230, file: !425, line: 182, column: 47)
!2233 = !DILocation(line: 183, column: 89, scope: !2232)
!2234 = !DILocation(line: 183, column: 93, scope: !2232)
!2235 = !DILocation(line: 183, column: 100, scope: !2232)
!2236 = !DILocation(line: 183, column: 113, scope: !2232)
!2237 = !DILocation(line: 183, column: 107, scope: !2232)
!2238 = !DILocation(line: 183, column: 105, scope: !2232)
!2239 = !DILocation(line: 183, column: 80, scope: !2232)
!2240 = !DILocation(line: 183, column: 17, scope: !2232)
!2241 = !DILocation(line: 182, column: 43, scope: !2230)
!2242 = !DILocation(line: 182, column: 13, scope: !2230)
!2243 = distinct !{!2243, !2223, !2244, !244}
!2244 = !DILocation(line: 184, column: 13, scope: !2224)
!2245 = !DILocation(line: 185, column: 21, scope: !2225)
!2246 = !DILocation(line: 181, column: 35, scope: !2222)
!2247 = !DILocation(line: 181, column: 9, scope: !2222)
!2248 = distinct !{!2248, !2214, !2249, !244}
!2249 = !DILocation(line: 186, column: 9, scope: !2215)
!2250 = !DILocation(line: 180, column: 35, scope: !2213)
!2251 = !DILocation(line: 180, column: 5, scope: !2213)
!2252 = distinct !{!2252, !2134, !2253, !244}
!2253 = !DILocation(line: 187, column: 5, scope: !2135)
!2254 = !DILocalVariable(name: "i", scope: !2101, file: !425, line: 190, type: !45)
!2255 = !DILocation(line: 191, column: 14, scope: !2101)
!2256 = !DILocation(line: 192, column: 54, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2101, file: !425, line: 191, column: 23)
!2258 = !DILocation(line: 192, column: 81, scope: !2257)
!2259 = !DILocation(line: 192, column: 9, scope: !2257)
!2260 = !DILocation(line: 193, column: 10, scope: !2257)
!2261 = distinct !{!2261, !2217, !2262, !244}
!2262 = !DILocation(line: 194, column: 5, scope: !2101)
!2263 = !DILocation(line: 196, column: 1, scope: !2101)
!2264 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !425, file: !425, line: 200, type: !2265, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2265 = !DISubroutineType(types: !2266)
!2266 = !{null, !428, !49, !45, !45, !45, !5}
!2267 = !DILocalVariable(name: "PS", arg: 1, scope: !2264, file: !425, line: 200, type: !428)
!2268 = !DILocation(line: 0, scope: !2264)
!2269 = !DILocalVariable(name: "S", arg: 2, scope: !2264, file: !425, line: 200, type: !49)
!2270 = !DILocalVariable(name: "m", arg: 3, scope: !2264, file: !425, line: 200, type: !45)
!2271 = !DILocalVariable(name: "k", arg: 4, scope: !2264, file: !425, line: 200, type: !45)
!2272 = !DILocalVariable(name: "n", arg: 5, scope: !2264, file: !425, line: 200, type: !45)
!2273 = !DILocalVariable(name: "SPS", arg: 6, scope: !2264, file: !425, line: 200, type: !5)
!2274 = !DILocalVariable(name: "accumulator", scope: !2264, file: !425, line: 201, type: !2275)
!2275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512000, elements: !2276)
!2276 = !{!2277}
!2277 = !DISubrange(count: 8000)
!2278 = !DILocation(line: 201, column: 14, scope: !2264)
!2279 = !DILocalVariable(name: "m_vec_limbs", scope: !2264, file: !425, line: 202, type: !343)
!2280 = !DILocalVariable(name: "row", scope: !2281, file: !425, line: 203, type: !45)
!2281 = distinct !DILexicalBlock(scope: !2264, file: !425, line: 203, column: 5)
!2282 = !DILocation(line: 0, scope: !2281)
!2283 = !DILocation(line: 203, column: 10, scope: !2281)
!2284 = !DILocation(line: 203, scope: !2281)
!2285 = !DILocation(line: 203, column: 27, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2281, file: !425, line: 203, column: 5)
!2287 = !DILocation(line: 203, column: 5, scope: !2281)
!2288 = !DILocation(line: 204, column: 9, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2290, file: !425, line: 204, column: 9)
!2290 = distinct !DILexicalBlock(scope: !2286, file: !425, line: 203, column: 39)
!2291 = !DILocation(line: 213, column: 5, scope: !2264)
!2292 = !DILocation(line: 204, scope: !2289)
!2293 = !DILocalVariable(name: "j", scope: !2289, file: !425, line: 204, type: !45)
!2294 = !DILocation(line: 0, scope: !2289)
!2295 = !DILocation(line: 204, column: 27, scope: !2296)
!2296 = distinct !DILexicalBlock(scope: !2289, file: !425, line: 204, column: 9)
!2297 = !DILocation(line: 205, column: 13, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2299, file: !425, line: 205, column: 13)
!2299 = distinct !DILexicalBlock(scope: !2296, file: !425, line: 204, column: 37)
!2300 = !DILocation(line: 205, scope: !2298)
!2301 = !DILocalVariable(name: "col", scope: !2298, file: !425, line: 205, type: !45)
!2302 = !DILocation(line: 0, scope: !2298)
!2303 = !DILocation(line: 205, column: 35, scope: !2304)
!2304 = distinct !DILexicalBlock(scope: !2298, file: !425, line: 205, column: 13)
!2305 = !DILocation(line: 206, column: 52, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2304, file: !425, line: 205, column: 50)
!2307 = !DILocation(line: 206, column: 56, scope: !2306)
!2308 = !DILocation(line: 206, column: 47, scope: !2306)
!2309 = !DILocation(line: 206, column: 99, scope: !2306)
!2310 = !DILocation(line: 206, column: 103, scope: !2306)
!2311 = !DILocation(line: 206, column: 110, scope: !2306)
!2312 = !DILocation(line: 206, column: 123, scope: !2306)
!2313 = !DILocation(line: 206, column: 117, scope: !2306)
!2314 = !DILocation(line: 206, column: 115, scope: !2306)
!2315 = !DILocation(line: 206, column: 90, scope: !2306)
!2316 = !DILocation(line: 206, column: 21, scope: !2306)
!2317 = !DILocation(line: 205, column: 44, scope: !2304)
!2318 = !DILocation(line: 205, column: 13, scope: !2304)
!2319 = distinct !{!2319, !2297, !2320, !244}
!2320 = !DILocation(line: 207, column: 13, scope: !2298)
!2321 = !DILocation(line: 204, column: 33, scope: !2296)
!2322 = !DILocation(line: 204, column: 9, scope: !2296)
!2323 = distinct !{!2323, !2288, !2324, !244}
!2324 = !DILocation(line: 208, column: 9, scope: !2289)
!2325 = !DILocation(line: 203, column: 35, scope: !2286)
!2326 = !DILocation(line: 203, column: 5, scope: !2286)
!2327 = distinct !{!2327, !2287, !2328, !244}
!2328 = !DILocation(line: 209, column: 5, scope: !2281)
!2329 = !DILocalVariable(name: "i", scope: !2264, file: !425, line: 212, type: !45)
!2330 = !DILocation(line: 213, column: 14, scope: !2264)
!2331 = !DILocation(line: 214, column: 54, scope: !2332)
!2332 = distinct !DILexicalBlock(scope: !2264, file: !425, line: 213, column: 21)
!2333 = !DILocation(line: 214, column: 82, scope: !2332)
!2334 = !DILocation(line: 214, column: 9, scope: !2332)
!2335 = !DILocation(line: 215, column: 10, scope: !2332)
!2336 = distinct !{!2336, !2291, !2337, !244}
!2337 = !DILocation(line: 216, column: 5, scope: !2264)
!2338 = !DILocation(line: 217, column: 1, scope: !2264)
!2339 = distinct !DISubprogram(name: "m_vec_add", scope: !539, file: !539, line: 22, type: !2340, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2340 = !DISubroutineType(types: !2341)
!2341 = !{null, !45, !428, !5}
!2342 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2339, file: !539, line: 22, type: !45)
!2343 = !DILocation(line: 0, scope: !2339)
!2344 = !DILocalVariable(name: "in", arg: 2, scope: !2339, file: !539, line: 22, type: !428)
!2345 = !DILocalVariable(name: "acc", arg: 3, scope: !2339, file: !539, line: 22, type: !5)
!2346 = !DILocalVariable(name: "i", scope: !2347, file: !539, line: 24, type: !15)
!2347 = distinct !DILexicalBlock(scope: !2339, file: !539, line: 24, column: 5)
!2348 = !DILocation(line: 0, scope: !2347)
!2349 = !DILocation(line: 24, column: 10, scope: !2347)
!2350 = !DILocation(line: 24, scope: !2347)
!2351 = !DILocation(line: 24, column: 26, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2347, file: !539, line: 24, column: 5)
!2353 = !DILocation(line: 24, column: 5, scope: !2347)
!2354 = !DILocation(line: 26, column: 19, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2352, file: !539, line: 25, column: 5)
!2356 = !DILocation(line: 26, column: 9, scope: !2355)
!2357 = !DILocation(line: 26, column: 16, scope: !2355)
!2358 = !DILocation(line: 24, column: 46, scope: !2352)
!2359 = !DILocation(line: 24, column: 5, scope: !2352)
!2360 = distinct !{!2360, !2353, !2361, !244}
!2361 = !DILocation(line: 27, column: 5, scope: !2347)
!2362 = !DILocation(line: 28, column: 1, scope: !2339)
!2363 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !539, file: !539, line: 67, type: !2364, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2364 = !DISubroutineType(types: !2365)
!2365 = !{null, !45, !5, !5}
!2366 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2363, file: !539, line: 67, type: !45)
!2367 = !DILocation(line: 0, scope: !2363)
!2368 = !DILocalVariable(name: "bins", arg: 2, scope: !2363, file: !539, line: 67, type: !5)
!2369 = !DILocalVariable(name: "out", arg: 3, scope: !2363, file: !539, line: 67, type: !5)
!2370 = !DILocation(line: 68, column: 44, scope: !2363)
!2371 = !DILocation(line: 68, column: 73, scope: !2363)
!2372 = !DILocation(line: 68, column: 5, scope: !2363)
!2373 = !DILocation(line: 69, column: 40, scope: !2363)
!2374 = !DILocation(line: 69, column: 69, scope: !2363)
!2375 = !DILocation(line: 69, column: 5, scope: !2363)
!2376 = !DILocation(line: 70, column: 44, scope: !2363)
!2377 = !DILocation(line: 70, column: 74, scope: !2363)
!2378 = !DILocation(line: 70, column: 5, scope: !2363)
!2379 = !DILocation(line: 71, column: 40, scope: !2363)
!2380 = !DILocation(line: 71, column: 69, scope: !2363)
!2381 = !DILocation(line: 71, column: 5, scope: !2363)
!2382 = !DILocation(line: 72, column: 44, scope: !2363)
!2383 = !DILocation(line: 72, column: 73, scope: !2363)
!2384 = !DILocation(line: 72, column: 5, scope: !2363)
!2385 = !DILocation(line: 73, column: 40, scope: !2363)
!2386 = !DILocation(line: 73, column: 69, scope: !2363)
!2387 = !DILocation(line: 73, column: 5, scope: !2363)
!2388 = !DILocation(line: 74, column: 44, scope: !2363)
!2389 = !DILocation(line: 74, column: 74, scope: !2363)
!2390 = !DILocation(line: 74, column: 5, scope: !2363)
!2391 = !DILocation(line: 75, column: 40, scope: !2363)
!2392 = !DILocation(line: 75, column: 69, scope: !2363)
!2393 = !DILocation(line: 75, column: 5, scope: !2363)
!2394 = !DILocation(line: 76, column: 44, scope: !2363)
!2395 = !DILocation(line: 76, column: 74, scope: !2363)
!2396 = !DILocation(line: 76, column: 5, scope: !2363)
!2397 = !DILocation(line: 77, column: 40, scope: !2363)
!2398 = !DILocation(line: 77, column: 69, scope: !2363)
!2399 = !DILocation(line: 77, column: 5, scope: !2363)
!2400 = !DILocation(line: 78, column: 44, scope: !2363)
!2401 = !DILocation(line: 78, column: 74, scope: !2363)
!2402 = !DILocation(line: 78, column: 5, scope: !2363)
!2403 = !DILocation(line: 79, column: 40, scope: !2363)
!2404 = !DILocation(line: 79, column: 69, scope: !2363)
!2405 = !DILocation(line: 79, column: 5, scope: !2363)
!2406 = !DILocation(line: 80, column: 44, scope: !2363)
!2407 = !DILocation(line: 80, column: 74, scope: !2363)
!2408 = !DILocation(line: 80, column: 5, scope: !2363)
!2409 = !DILocation(line: 81, column: 40, scope: !2363)
!2410 = !DILocation(line: 81, column: 69, scope: !2363)
!2411 = !DILocation(line: 81, column: 5, scope: !2363)
!2412 = !DILocation(line: 82, column: 35, scope: !2363)
!2413 = !DILocation(line: 82, column: 5, scope: !2363)
!2414 = !DILocation(line: 83, column: 1, scope: !2363)
!2415 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !539, file: !539, line: 57, type: !2340, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2416 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2415, file: !539, line: 57, type: !45)
!2417 = !DILocation(line: 0, scope: !2415)
!2418 = !DILocalVariable(name: "in", arg: 2, scope: !2415, file: !539, line: 57, type: !428)
!2419 = !DILocalVariable(name: "acc", arg: 3, scope: !2415, file: !539, line: 57, type: !5)
!2420 = !DILocalVariable(name: "mask_lsb", scope: !2415, file: !539, line: 59, type: !6)
!2421 = !DILocalVariable(name: "i", scope: !2422, file: !539, line: 60, type: !45)
!2422 = distinct !DILexicalBlock(scope: !2415, file: !539, line: 60, column: 5)
!2423 = !DILocation(line: 0, scope: !2422)
!2424 = !DILocation(line: 60, column: 9, scope: !2422)
!2425 = !DILocation(line: 60, scope: !2422)
!2426 = !DILocation(line: 60, column: 20, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2422, file: !539, line: 60, column: 5)
!2428 = !DILocation(line: 60, column: 5, scope: !2422)
!2429 = !DILocation(line: 61, column: 22, scope: !2430)
!2430 = distinct !DILexicalBlock(scope: !2427, file: !539, line: 60, column: 43)
!2431 = !DILocation(line: 61, column: 28, scope: !2430)
!2432 = !DILocalVariable(name: "t", scope: !2430, file: !539, line: 61, type: !6)
!2433 = !DILocation(line: 0, scope: !2430)
!2434 = !DILocation(line: 62, column: 32, scope: !2430)
!2435 = !DILocation(line: 62, column: 43, scope: !2430)
!2436 = !DILocation(line: 62, column: 38, scope: !2430)
!2437 = !DILocation(line: 62, column: 9, scope: !2430)
!2438 = !DILocation(line: 62, column: 16, scope: !2430)
!2439 = !DILocation(line: 60, column: 40, scope: !2427)
!2440 = !DILocation(line: 60, column: 5, scope: !2427)
!2441 = distinct !{!2441, !2428, !2442, !244}
!2442 = !DILocation(line: 63, column: 5, scope: !2422)
!2443 = !DILocation(line: 64, column: 1, scope: !2415)
!2444 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !539, file: !539, line: 47, type: !2340, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2445 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2444, file: !539, line: 47, type: !45)
!2446 = !DILocation(line: 0, scope: !2444)
!2447 = !DILocalVariable(name: "in", arg: 2, scope: !2444, file: !539, line: 47, type: !428)
!2448 = !DILocalVariable(name: "acc", arg: 3, scope: !2444, file: !539, line: 47, type: !5)
!2449 = !DILocalVariable(name: "mask_msb", scope: !2444, file: !539, line: 49, type: !6)
!2450 = !DILocalVariable(name: "i", scope: !2451, file: !539, line: 50, type: !45)
!2451 = distinct !DILexicalBlock(scope: !2444, file: !539, line: 50, column: 5)
!2452 = !DILocation(line: 0, scope: !2451)
!2453 = !DILocation(line: 50, column: 9, scope: !2451)
!2454 = !DILocation(line: 50, scope: !2451)
!2455 = !DILocation(line: 50, column: 20, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2451, file: !539, line: 50, column: 5)
!2457 = !DILocation(line: 50, column: 5, scope: !2451)
!2458 = !DILocation(line: 51, column: 22, scope: !2459)
!2459 = distinct !DILexicalBlock(scope: !2456, file: !539, line: 50, column: 43)
!2460 = !DILocalVariable(name: "t", scope: !2459, file: !539, line: 51, type: !6)
!2461 = !DILocation(line: 0, scope: !2459)
!2462 = !DILocation(line: 52, column: 32, scope: !2459)
!2463 = !DILocation(line: 52, column: 44, scope: !2459)
!2464 = !DILocation(line: 52, column: 50, scope: !2459)
!2465 = !DILocation(line: 52, column: 38, scope: !2459)
!2466 = !DILocation(line: 52, column: 9, scope: !2459)
!2467 = !DILocation(line: 52, column: 16, scope: !2459)
!2468 = !DILocation(line: 50, column: 40, scope: !2456)
!2469 = !DILocation(line: 50, column: 5, scope: !2456)
!2470 = distinct !{!2470, !2457, !2471, !244}
!2471 = !DILocation(line: 53, column: 5, scope: !2451)
!2472 = !DILocation(line: 54, column: 1, scope: !2444)
!2473 = distinct !DISubprogram(name: "m_vec_copy", scope: !539, file: !539, line: 13, type: !2340, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!2474 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2473, file: !539, line: 13, type: !45)
!2475 = !DILocation(line: 0, scope: !2473)
!2476 = !DILocalVariable(name: "in", arg: 2, scope: !2473, file: !539, line: 13, type: !428)
!2477 = !DILocalVariable(name: "out", arg: 3, scope: !2473, file: !539, line: 13, type: !5)
!2478 = !DILocalVariable(name: "i", scope: !2479, file: !539, line: 15, type: !15)
!2479 = distinct !DILexicalBlock(scope: !2473, file: !539, line: 15, column: 5)
!2480 = !DILocation(line: 0, scope: !2479)
!2481 = !DILocation(line: 15, column: 10, scope: !2479)
!2482 = !DILocation(line: 15, scope: !2479)
!2483 = !DILocation(line: 15, column: 26, scope: !2484)
!2484 = distinct !DILexicalBlock(scope: !2479, file: !539, line: 15, column: 5)
!2485 = !DILocation(line: 15, column: 5, scope: !2479)
!2486 = !DILocation(line: 17, column: 18, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2484, file: !539, line: 16, column: 5)
!2488 = !DILocation(line: 17, column: 9, scope: !2487)
!2489 = !DILocation(line: 17, column: 16, scope: !2487)
!2490 = !DILocation(line: 15, column: 46, scope: !2484)
!2491 = !DILocation(line: 15, column: 5, scope: !2484)
!2492 = distinct !{!2492, !2485, !2493, !244}
!2493 = !DILocation(line: 18, column: 5, scope: !2479)
!2494 = !DILocation(line: 19, column: 1, scope: !2473)
!2495 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_m_upper", scope: !58, file: !58, line: 14, type: !2496, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2496 = !DISubroutineType(types: !2497)
!2497 = !{null, !2498, !428, !5, !45}
!2498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2499, size: 32)
!2499 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2500)
!2500 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !36, line: 289, baseType: !2501)
!2501 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !36, line: 265, size: 736, elements: !2502)
!2502 = !{!2503, !2504, !2505, !2506, !2507, !2508, !2509, !2510, !2511, !2512, !2513, !2514, !2515, !2516, !2517, !2518, !2519, !2520, !2521, !2522, !2523, !2524, !2525}
!2503 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !2501, file: !36, line: 266, baseType: !45, size: 32)
!2504 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2501, file: !36, line: 267, baseType: !45, size: 32, offset: 32)
!2505 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !2501, file: !36, line: 268, baseType: !45, size: 32, offset: 64)
!2506 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !2501, file: !36, line: 269, baseType: !45, size: 32, offset: 96)
!2507 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !2501, file: !36, line: 270, baseType: !45, size: 32, offset: 128)
!2508 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !2501, file: !36, line: 271, baseType: !49, size: 32, offset: 160)
!2509 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !2501, file: !36, line: 272, baseType: !45, size: 32, offset: 192)
!2510 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !2501, file: !36, line: 273, baseType: !45, size: 32, offset: 224)
!2511 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !2501, file: !36, line: 274, baseType: !45, size: 32, offset: 256)
!2512 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !2501, file: !36, line: 275, baseType: !45, size: 32, offset: 288)
!2513 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !2501, file: !36, line: 276, baseType: !45, size: 32, offset: 320)
!2514 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !2501, file: !36, line: 277, baseType: !45, size: 32, offset: 352)
!2515 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !2501, file: !36, line: 278, baseType: !45, size: 32, offset: 384)
!2516 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !2501, file: !36, line: 279, baseType: !45, size: 32, offset: 416)
!2517 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !2501, file: !36, line: 280, baseType: !45, size: 32, offset: 448)
!2518 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !2501, file: !36, line: 281, baseType: !45, size: 32, offset: 480)
!2519 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !2501, file: !36, line: 282, baseType: !45, size: 32, offset: 512)
!2520 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !2501, file: !36, line: 283, baseType: !45, size: 32, offset: 544)
!2521 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !2501, file: !36, line: 284, baseType: !45, size: 32, offset: 576)
!2522 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !2501, file: !36, line: 285, baseType: !45, size: 32, offset: 608)
!2523 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !2501, file: !36, line: 286, baseType: !45, size: 32, offset: 640)
!2524 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !2501, file: !36, line: 287, baseType: !45, size: 32, offset: 672)
!2525 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2501, file: !36, line: 288, baseType: !165, size: 32, offset: 704)
!2526 = !DILocalVariable(name: "p", arg: 1, scope: !2495, file: !58, line: 14, type: !2498)
!2527 = !DILocation(line: 0, scope: !2495)
!2528 = !DILocalVariable(name: "in", arg: 2, scope: !2495, file: !58, line: 14, type: !428)
!2529 = !DILocalVariable(name: "out", arg: 3, scope: !2495, file: !58, line: 14, type: !5)
!2530 = !DILocalVariable(name: "size", arg: 4, scope: !2495, file: !58, line: 14, type: !45)
!2531 = !DILocalVariable(name: "m_vec_limbs", scope: !2495, file: !58, line: 19, type: !343)
!2532 = !DILocalVariable(name: "m_vecs_stored", scope: !2495, file: !58, line: 20, type: !45)
!2533 = !DILocalVariable(name: "r", scope: !2534, file: !58, line: 21, type: !45)
!2534 = distinct !DILexicalBlock(scope: !2495, file: !58, line: 21, column: 5)
!2535 = !DILocation(line: 0, scope: !2534)
!2536 = !DILocation(line: 21, column: 10, scope: !2534)
!2537 = !DILocation(line: 20, column: 9, scope: !2495)
!2538 = !DILocation(line: 21, scope: !2534)
!2539 = !DILocation(line: 21, column: 23, scope: !2540)
!2540 = distinct !DILexicalBlock(scope: !2534, file: !58, line: 21, column: 5)
!2541 = !DILocation(line: 21, column: 5, scope: !2534)
!2542 = !DILocation(line: 22, column: 9, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2544, file: !58, line: 22, column: 9)
!2544 = distinct !DILexicalBlock(scope: !2540, file: !58, line: 21, column: 36)
!2545 = !DILocation(line: 22, scope: !2543)
!2546 = !DILocalVariable(name: "c", scope: !2543, file: !58, line: 22, type: !45)
!2547 = !DILocation(line: 0, scope: !2543)
!2548 = !DILocation(line: 22, column: 27, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2543, file: !58, line: 22, column: 9)
!2550 = !DILocation(line: 23, column: 59, scope: !2551)
!2551 = distinct !DILexicalBlock(scope: !2549, file: !58, line: 22, column: 40)
!2552 = !DILocation(line: 23, column: 66, scope: !2551)
!2553 = !DILocation(line: 23, column: 40, scope: !2551)
!2554 = !DILocation(line: 23, column: 76, scope: !2551)
!2555 = !DILocation(line: 23, column: 13, scope: !2551)
!2556 = !DILocation(line: 24, column: 19, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2551, file: !58, line: 24, column: 17)
!2558 = !DILocation(line: 25, column: 62, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2557, file: !58, line: 24, column: 25)
!2560 = !DILocation(line: 25, column: 69, scope: !2559)
!2561 = !DILocation(line: 25, column: 43, scope: !2559)
!2562 = !DILocation(line: 25, column: 79, scope: !2559)
!2563 = !DILocation(line: 25, column: 17, scope: !2559)
!2564 = !DILocation(line: 26, column: 13, scope: !2559)
!2565 = !DILocation(line: 27, column: 27, scope: !2551)
!2566 = !DILocation(line: 22, column: 36, scope: !2549)
!2567 = !DILocation(line: 22, column: 9, scope: !2549)
!2568 = distinct !{!2568, !2542, !2569, !244}
!2569 = !DILocation(line: 28, column: 9, scope: !2543)
!2570 = !DILocation(line: 21, column: 32, scope: !2540)
!2571 = !DILocation(line: 21, column: 5, scope: !2540)
!2572 = distinct !{!2572, !2541, !2573, !244}
!2573 = !DILocation(line: 29, column: 5, scope: !2534)
!2574 = !DILocation(line: 30, column: 1, scope: !2495)
!2575 = distinct !DISubprogram(name: "m_vec_copy", scope: !539, file: !539, line: 13, type: !2340, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2576 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2575, file: !539, line: 13, type: !45)
!2577 = !DILocation(line: 0, scope: !2575)
!2578 = !DILocalVariable(name: "in", arg: 2, scope: !2575, file: !539, line: 13, type: !428)
!2579 = !DILocalVariable(name: "out", arg: 3, scope: !2575, file: !539, line: 13, type: !5)
!2580 = !DILocalVariable(name: "i", scope: !2581, file: !539, line: 15, type: !15)
!2581 = distinct !DILexicalBlock(scope: !2575, file: !539, line: 15, column: 5)
!2582 = !DILocation(line: 0, scope: !2581)
!2583 = !DILocation(line: 15, column: 10, scope: !2581)
!2584 = !DILocation(line: 15, scope: !2581)
!2585 = !DILocation(line: 15, column: 26, scope: !2586)
!2586 = distinct !DILexicalBlock(scope: !2581, file: !539, line: 15, column: 5)
!2587 = !DILocation(line: 15, column: 5, scope: !2581)
!2588 = !DILocation(line: 17, column: 18, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2586, file: !539, line: 16, column: 5)
!2590 = !DILocation(line: 17, column: 9, scope: !2589)
!2591 = !DILocation(line: 17, column: 16, scope: !2589)
!2592 = !DILocation(line: 15, column: 46, scope: !2586)
!2593 = !DILocation(line: 15, column: 5, scope: !2586)
!2594 = distinct !{!2594, !2587, !2595, !244}
!2595 = !DILocation(line: 18, column: 5, scope: !2581)
!2596 = !DILocation(line: 19, column: 1, scope: !2575)
!2597 = distinct !DISubprogram(name: "m_vec_add", scope: !539, file: !539, line: 22, type: !2340, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2598 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2597, file: !539, line: 22, type: !45)
!2599 = !DILocation(line: 0, scope: !2597)
!2600 = !DILocalVariable(name: "in", arg: 2, scope: !2597, file: !539, line: 22, type: !428)
!2601 = !DILocalVariable(name: "acc", arg: 3, scope: !2597, file: !539, line: 22, type: !5)
!2602 = !DILocalVariable(name: "i", scope: !2603, file: !539, line: 24, type: !15)
!2603 = distinct !DILexicalBlock(scope: !2597, file: !539, line: 24, column: 5)
!2604 = !DILocation(line: 0, scope: !2603)
!2605 = !DILocation(line: 24, column: 10, scope: !2603)
!2606 = !DILocation(line: 24, scope: !2603)
!2607 = !DILocation(line: 24, column: 26, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2603, file: !539, line: 24, column: 5)
!2609 = !DILocation(line: 24, column: 5, scope: !2603)
!2610 = !DILocation(line: 26, column: 19, scope: !2611)
!2611 = distinct !DILexicalBlock(scope: !2608, file: !539, line: 25, column: 5)
!2612 = !DILocation(line: 26, column: 9, scope: !2611)
!2613 = !DILocation(line: 26, column: 16, scope: !2611)
!2614 = !DILocation(line: 24, column: 46, scope: !2608)
!2615 = !DILocation(line: 24, column: 5, scope: !2608)
!2616 = distinct !{!2616, !2609, !2617, !244}
!2617 = !DILocation(line: 27, column: 5, scope: !2603)
!2618 = !DILocation(line: 28, column: 1, scope: !2597)
!2619 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_sample_solution", scope: !58, file: !58, line: 40, type: !2620, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2620 = !DISubroutineType(types: !2621)
!2621 = !{!45, !2498, !18, !49, !49, !18, !45, !45, !45, !45}
!2622 = !DILocalVariable(name: "p", arg: 1, scope: !2619, file: !58, line: 40, type: !2498)
!2623 = !DILocation(line: 0, scope: !2619)
!2624 = !DILocalVariable(name: "A", arg: 2, scope: !2619, file: !58, line: 40, type: !18)
!2625 = !DILocalVariable(name: "y", arg: 3, scope: !2619, file: !58, line: 41, type: !49)
!2626 = !DILocalVariable(name: "r", arg: 4, scope: !2619, file: !58, line: 41, type: !49)
!2627 = !DILocalVariable(name: "x", arg: 5, scope: !2619, file: !58, line: 42, type: !18)
!2628 = !DILocalVariable(name: "k", arg: 6, scope: !2619, file: !58, line: 42, type: !45)
!2629 = !DILocalVariable(name: "o", arg: 7, scope: !2619, file: !58, line: 42, type: !45)
!2630 = !DILocalVariable(name: "m", arg: 8, scope: !2619, file: !58, line: 42, type: !45)
!2631 = !DILocalVariable(name: "A_cols", arg: 9, scope: !2619, file: !58, line: 42, type: !45)
!2632 = !DILocalVariable(name: "i", scope: !2633, file: !58, line: 51, type: !45)
!2633 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 51, column: 5)
!2634 = !DILocation(line: 0, scope: !2633)
!2635 = !DILocation(line: 51, column: 10, scope: !2633)
!2636 = !DILocation(line: 51, scope: !2633)
!2637 = !DILocation(line: 51, column: 23, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2633, file: !58, line: 51, column: 5)
!2639 = !DILocation(line: 51, column: 5, scope: !2633)
!2640 = !DILocation(line: 57, column: 5, scope: !2641)
!2641 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 57, column: 5)
!2642 = !DILocation(line: 52, column: 16, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2638, file: !58, line: 51, column: 37)
!2644 = !DILocation(line: 52, column: 9, scope: !2643)
!2645 = !DILocation(line: 52, column: 14, scope: !2643)
!2646 = !DILocation(line: 51, column: 33, scope: !2638)
!2647 = !DILocation(line: 51, column: 5, scope: !2638)
!2648 = distinct !{!2648, !2639, !2649, !244}
!2649 = !DILocation(line: 53, column: 5, scope: !2633)
!2650 = !DILocation(line: 57, scope: !2641)
!2651 = !DILocalVariable(name: "i", scope: !2641, file: !58, line: 57, type: !45)
!2652 = !DILocation(line: 0, scope: !2641)
!2653 = !DILocation(line: 57, column: 23, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2641, file: !58, line: 57, column: 5)
!2655 = !DILocation(line: 58, column: 13, scope: !2656)
!2656 = distinct !DILexicalBlock(scope: !2654, file: !58, line: 57, column: 33)
!2657 = !DILocation(line: 58, column: 26, scope: !2656)
!2658 = !DILocation(line: 58, column: 30, scope: !2656)
!2659 = !DILocation(line: 58, column: 21, scope: !2656)
!2660 = !DILocation(line: 58, column: 9, scope: !2656)
!2661 = !DILocation(line: 58, column: 36, scope: !2656)
!2662 = !DILocation(line: 57, column: 29, scope: !2654)
!2663 = !DILocation(line: 57, column: 5, scope: !2654)
!2664 = distinct !{!2664, !2640, !2665, !244}
!2665 = !DILocation(line: 59, column: 5, scope: !2641)
!2666 = !DILocation(line: 60, column: 25, scope: !2619)
!2667 = !DILocation(line: 60, column: 29, scope: !2619)
!2668 = !DILocation(line: 60, column: 5, scope: !2619)
!2669 = !DILocalVariable(name: "i", scope: !2670, file: !58, line: 63, type: !45)
!2670 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 63, column: 5)
!2671 = !DILocation(line: 0, scope: !2670)
!2672 = !DILocation(line: 63, column: 10, scope: !2670)
!2673 = !DILocation(line: 63, scope: !2670)
!2674 = !DILocation(line: 63, column: 23, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2670, file: !58, line: 63, column: 5)
!2676 = !DILocation(line: 63, column: 5, scope: !2670)
!2677 = !DILocation(line: 64, column: 44, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2675, file: !58, line: 63, column: 33)
!2679 = !DILocation(line: 64, column: 50, scope: !2678)
!2680 = !DILocation(line: 64, column: 38, scope: !2678)
!2681 = !DILocation(line: 64, column: 13, scope: !2678)
!2682 = !DILocation(line: 64, column: 26, scope: !2678)
!2683 = !DILocation(line: 64, column: 30, scope: !2678)
!2684 = !DILocation(line: 64, column: 21, scope: !2678)
!2685 = !DILocation(line: 64, column: 9, scope: !2678)
!2686 = !DILocation(line: 64, column: 36, scope: !2678)
!2687 = !DILocation(line: 63, column: 29, scope: !2675)
!2688 = !DILocation(line: 63, column: 5, scope: !2675)
!2689 = distinct !{!2689, !2676, !2690, !244}
!2690 = !DILocation(line: 65, column: 5, scope: !2670)
!2691 = !DILocation(line: 67, column: 16, scope: !2619)
!2692 = !DILocation(line: 67, column: 20, scope: !2619)
!2693 = !DILocation(line: 67, column: 5, scope: !2619)
!2694 = !DILocalVariable(name: "full_rank", scope: !2619, file: !58, line: 70, type: !14)
!2695 = !DILocalVariable(name: "i", scope: !2696, file: !58, line: 71, type: !45)
!2696 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 71, column: 5)
!2697 = !DILocation(line: 0, scope: !2696)
!2698 = !DILocation(line: 71, column: 10, scope: !2696)
!2699 = !DILocation(line: 71, scope: !2696)
!2700 = !DILocation(line: 71, column: 23, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2696, file: !58, line: 71, column: 5)
!2702 = !DILocation(line: 71, column: 5, scope: !2696)
!2703 = !DILocation(line: 72, column: 27, scope: !2704)
!2704 = distinct !DILexicalBlock(scope: !2701, file: !58, line: 71, column: 42)
!2705 = !DILocation(line: 72, column: 32, scope: !2704)
!2706 = !DILocation(line: 72, column: 22, scope: !2704)
!2707 = !DILocation(line: 72, column: 19, scope: !2704)
!2708 = !DILocation(line: 71, column: 38, scope: !2701)
!2709 = !DILocation(line: 71, column: 5, scope: !2701)
!2710 = distinct !{!2710, !2702, !2711, !244}
!2711 = !DILocation(line: 73, column: 5, scope: !2696)
!2712 = !DILocation(line: 80, column: 19, scope: !2713)
!2713 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 80, column: 9)
!2714 = !DILocation(line: 88, column: 5, scope: !2715)
!2715 = distinct !DILexicalBlock(scope: !2619, file: !58, line: 88, column: 5)
!2716 = distinct !{!2716, !2714, !2717, !244}
!2717 = !DILocation(line: 122, column: 5, scope: !2715)
!2718 = !DILocation(line: 88, scope: !2715)
!2719 = !DILocalVariable(name: "row", scope: !2715, file: !58, line: 88, type: !45)
!2720 = !DILocation(line: 0, scope: !2715)
!2721 = !DILocation(line: 88, column: 31, scope: !2722)
!2722 = distinct !DILexicalBlock(scope: !2715, file: !58, line: 88, column: 5)
!2723 = !DILocalVariable(name: "finished", scope: !2619, file: !58, line: 46, type: !14)
!2724 = !DILocation(line: 90, column: 27, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2722, file: !58, line: 88, column: 44)
!2726 = !DILocalVariable(name: "col_upper_bound", scope: !2619, file: !58, line: 47, type: !45)
!2727 = !DILocalVariable(name: "col", scope: !2728, file: !58, line: 93, type: !45)
!2728 = distinct !DILexicalBlock(scope: !2725, file: !58, line: 93, column: 9)
!2729 = !DILocation(line: 0, scope: !2728)
!2730 = !DILocation(line: 93, column: 14, scope: !2728)
!2731 = !DILocation(line: 0, scope: !2725)
!2732 = !DILocation(line: 93, scope: !2728)
!2733 = !DILocation(line: 93, column: 33, scope: !2734)
!2734 = distinct !DILexicalBlock(scope: !2728, file: !58, line: 93, column: 9)
!2735 = !DILocation(line: 93, column: 9, scope: !2728)
!2736 = !DILocation(line: 97, column: 50, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2734, file: !58, line: 93, column: 60)
!2738 = !DILocation(line: 97, column: 44, scope: !2737)
!2739 = !DILocation(line: 97, column: 30, scope: !2737)
!2740 = !DILocation(line: 97, column: 73, scope: !2737)
!2741 = !DILocalVariable(name: "correct_column", scope: !2619, file: !58, line: 48, type: !14)
!2742 = !DILocation(line: 99, column: 63, scope: !2737)
!2743 = !DILocation(line: 99, column: 48, scope: !2737)
!2744 = !DILocation(line: 99, column: 46, scope: !2737)
!2745 = !DILocalVariable(name: "u", scope: !2737, file: !58, line: 99, type: !14)
!2746 = !DILocation(line: 0, scope: !2737)
!2747 = !DILocation(line: 100, column: 13, scope: !2737)
!2748 = !DILocation(line: 100, column: 20, scope: !2737)
!2749 = !DILocalVariable(name: "i", scope: !2750, file: !58, line: 102, type: !45)
!2750 = distinct !DILexicalBlock(scope: !2737, file: !58, line: 102, column: 13)
!2751 = !DILocation(line: 0, scope: !2750)
!2752 = !DILocation(line: 102, column: 18, scope: !2750)
!2753 = !DILocation(line: 102, scope: !2750)
!2754 = !DILocation(line: 102, column: 31, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2750, file: !58, line: 102, column: 13)
!2756 = !DILocation(line: 102, column: 13, scope: !2750)
!2757 = !DILocation(line: 103, column: 53, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2755, file: !58, line: 102, column: 46)
!2759 = !DILocation(line: 103, column: 45, scope: !2758)
!2760 = !DILocation(line: 103, column: 34, scope: !2758)
!2761 = !DILocation(line: 103, column: 95, scope: !2758)
!2762 = !DILocation(line: 103, column: 99, scope: !2758)
!2763 = !DILocation(line: 103, column: 91, scope: !2758)
!2764 = !DILocation(line: 103, column: 80, scope: !2758)
!2765 = !DILocation(line: 103, column: 115, scope: !2758)
!2766 = !DILocation(line: 103, column: 76, scope: !2758)
!2767 = !DILocation(line: 104, column: 49, scope: !2758)
!2768 = !DILocation(line: 104, column: 53, scope: !2758)
!2769 = !DILocation(line: 104, column: 45, scope: !2758)
!2770 = !DILocation(line: 104, column: 34, scope: !2758)
!2771 = !DILocation(line: 104, column: 69, scope: !2758)
!2772 = !DILocation(line: 104, column: 30, scope: !2758)
!2773 = !DILocation(line: 104, column: 95, scope: !2758)
!2774 = !DILocation(line: 104, column: 99, scope: !2758)
!2775 = !DILocation(line: 104, column: 91, scope: !2758)
!2776 = !DILocation(line: 104, column: 80, scope: !2758)
!2777 = !DILocation(line: 104, column: 115, scope: !2758)
!2778 = !DILocation(line: 104, column: 76, scope: !2758)
!2779 = !DILocation(line: 105, column: 49, scope: !2758)
!2780 = !DILocation(line: 105, column: 53, scope: !2758)
!2781 = !DILocation(line: 105, column: 45, scope: !2758)
!2782 = !DILocation(line: 105, column: 34, scope: !2758)
!2783 = !DILocation(line: 105, column: 69, scope: !2758)
!2784 = !DILocation(line: 105, column: 30, scope: !2758)
!2785 = !DILocation(line: 105, column: 95, scope: !2758)
!2786 = !DILocation(line: 105, column: 99, scope: !2758)
!2787 = !DILocation(line: 105, column: 91, scope: !2758)
!2788 = !DILocation(line: 105, column: 80, scope: !2758)
!2789 = !DILocation(line: 105, column: 115, scope: !2758)
!2790 = !DILocation(line: 105, column: 76, scope: !2758)
!2791 = !DILocation(line: 106, column: 49, scope: !2758)
!2792 = !DILocation(line: 106, column: 53, scope: !2758)
!2793 = !DILocation(line: 106, column: 45, scope: !2758)
!2794 = !DILocation(line: 106, column: 34, scope: !2758)
!2795 = !DILocation(line: 106, column: 69, scope: !2758)
!2796 = !DILocation(line: 106, column: 30, scope: !2758)
!2797 = !DILocation(line: 106, column: 95, scope: !2758)
!2798 = !DILocation(line: 106, column: 99, scope: !2758)
!2799 = !DILocation(line: 106, column: 91, scope: !2758)
!2800 = !DILocation(line: 106, column: 80, scope: !2758)
!2801 = !DILocation(line: 106, column: 115, scope: !2758)
!2802 = !DILocation(line: 106, column: 76, scope: !2758)
!2803 = !DILocalVariable(name: "tmp", scope: !2758, file: !58, line: 103, type: !6)
!2804 = !DILocation(line: 0, scope: !2758)
!2805 = !DILocation(line: 108, column: 23, scope: !2758)
!2806 = !DILocation(line: 110, column: 34, scope: !2758)
!2807 = !DILocation(line: 110, column: 17, scope: !2758)
!2808 = !DILocation(line: 110, column: 48, scope: !2758)
!2809 = !DILocation(line: 111, column: 56, scope: !2758)
!2810 = !DILocation(line: 111, column: 34, scope: !2758)
!2811 = !DILocation(line: 111, column: 17, scope: !2758)
!2812 = !DILocation(line: 111, column: 48, scope: !2758)
!2813 = !DILocation(line: 112, column: 56, scope: !2758)
!2814 = !DILocation(line: 112, column: 34, scope: !2758)
!2815 = !DILocation(line: 112, column: 17, scope: !2758)
!2816 = !DILocation(line: 112, column: 48, scope: !2758)
!2817 = !DILocation(line: 113, column: 56, scope: !2758)
!2818 = !DILocation(line: 113, column: 34, scope: !2758)
!2819 = !DILocation(line: 113, column: 17, scope: !2758)
!2820 = !DILocation(line: 113, column: 48, scope: !2758)
!2821 = !DILocation(line: 114, column: 56, scope: !2758)
!2822 = !DILocation(line: 114, column: 34, scope: !2758)
!2823 = !DILocation(line: 114, column: 17, scope: !2758)
!2824 = !DILocation(line: 114, column: 48, scope: !2758)
!2825 = !DILocation(line: 115, column: 56, scope: !2758)
!2826 = !DILocation(line: 115, column: 34, scope: !2758)
!2827 = !DILocation(line: 115, column: 17, scope: !2758)
!2828 = !DILocation(line: 115, column: 48, scope: !2758)
!2829 = !DILocation(line: 116, column: 56, scope: !2758)
!2830 = !DILocation(line: 116, column: 34, scope: !2758)
!2831 = !DILocation(line: 116, column: 17, scope: !2758)
!2832 = !DILocation(line: 116, column: 48, scope: !2758)
!2833 = !DILocation(line: 117, column: 56, scope: !2758)
!2834 = !DILocation(line: 117, column: 34, scope: !2758)
!2835 = !DILocation(line: 117, column: 17, scope: !2758)
!2836 = !DILocation(line: 117, column: 48, scope: !2758)
!2837 = !DILocation(line: 102, column: 40, scope: !2755)
!2838 = !DILocation(line: 102, column: 13, scope: !2755)
!2839 = distinct !{!2839, !2756, !2840, !244}
!2840 = !DILocation(line: 118, column: 13, scope: !2750)
!2841 = !DILocation(line: 120, column: 33, scope: !2737)
!2842 = !DILocation(line: 93, column: 56, scope: !2734)
!2843 = !DILocation(line: 93, column: 9, scope: !2734)
!2844 = distinct !{!2844, !2735, !2845, !244}
!2845 = !DILocation(line: 121, column: 9, scope: !2728)
!2846 = !DILocation(line: 124, column: 1, scope: !2619)
!2847 = distinct !DISubprogram(name: "mat_mul", scope: !595, file: !595, line: 82, type: !1530, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2848 = !DILocalVariable(name: "a", arg: 1, scope: !2847, file: !595, line: 82, type: !49)
!2849 = !DILocation(line: 0, scope: !2847)
!2850 = !DILocalVariable(name: "b", arg: 2, scope: !2847, file: !595, line: 82, type: !49)
!2851 = !DILocalVariable(name: "c", arg: 3, scope: !2847, file: !595, line: 83, type: !18)
!2852 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2847, file: !595, line: 83, type: !45)
!2853 = !DILocalVariable(name: "row_a", arg: 5, scope: !2847, file: !595, line: 83, type: !45)
!2854 = !DILocalVariable(name: "col_b", arg: 6, scope: !2847, file: !595, line: 83, type: !45)
!2855 = !DILocalVariable(name: "i", scope: !2856, file: !595, line: 84, type: !45)
!2856 = distinct !DILexicalBlock(scope: !2847, file: !595, line: 84, column: 5)
!2857 = !DILocation(line: 0, scope: !2856)
!2858 = !DILocation(line: 84, column: 10, scope: !2856)
!2859 = !DILocation(line: 84, scope: !2856)
!2860 = !DILocation(line: 84, column: 23, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2856, file: !595, line: 84, column: 5)
!2862 = !DILocation(line: 84, column: 5, scope: !2856)
!2863 = !DILocation(line: 85, column: 9, scope: !2864)
!2864 = distinct !DILexicalBlock(scope: !2865, file: !595, line: 85, column: 9)
!2865 = distinct !DILexicalBlock(scope: !2861, file: !595, line: 84, column: 53)
!2866 = !DILocation(line: 85, scope: !2864)
!2867 = !DILocalVariable(name: "j", scope: !2864, file: !595, line: 85, type: !45)
!2868 = !DILocation(line: 0, scope: !2864)
!2869 = !DILocation(line: 86, column: 18, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2871, file: !595, line: 85, column: 46)
!2871 = distinct !DILexicalBlock(scope: !2864, file: !595, line: 85, column: 9)
!2872 = !DILocation(line: 86, column: 16, scope: !2870)
!2873 = !DILocation(line: 85, column: 41, scope: !2871)
!2874 = !DILocation(line: 85, column: 9, scope: !2871)
!2875 = distinct !{!2875, !2863, !2876, !244}
!2876 = !DILocation(line: 87, column: 9, scope: !2864)
!2877 = !DILocation(line: 84, column: 32, scope: !2861)
!2878 = !DILocation(line: 84, column: 39, scope: !2861)
!2879 = !DILocation(line: 84, column: 5, scope: !2861)
!2880 = distinct !{!2880, !2862, !2881, !244}
!2881 = !DILocation(line: 88, column: 5, scope: !2856)
!2882 = !DILocation(line: 91, column: 1, scope: !2847)
!2883 = distinct !DISubprogram(name: "sub_f", scope: !595, file: !595, line: 49, type: !1629, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2884 = !DILocalVariable(name: "a", arg: 1, scope: !2883, file: !595, line: 49, type: !14)
!2885 = !DILocation(line: 0, scope: !2883)
!2886 = !DILocalVariable(name: "b", arg: 2, scope: !2883, file: !595, line: 49, type: !14)
!2887 = !DILocation(line: 50, column: 14, scope: !2883)
!2888 = !DILocation(line: 50, column: 5, scope: !2883)
!2889 = distinct !DISubprogram(name: "EF", scope: !2890, file: !2890, line: 60, type: !2891, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!2890 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2891 = !DISubroutineType(types: !2892)
!2892 = !{null, !18, !45, !45}
!2893 = !DILocalVariable(name: "A", arg: 1, scope: !2889, file: !2890, line: 60, type: !18)
!2894 = !DILocation(line: 0, scope: !2889)
!2895 = !DILocalVariable(name: "nrows", arg: 2, scope: !2889, file: !2890, line: 60, type: !45)
!2896 = !DILocalVariable(name: "ncols", arg: 3, scope: !2889, file: !2890, line: 60, type: !45)
!2897 = !DILocalVariable(name: "_pivot_row", scope: !2889, file: !2890, line: 62, type: !2898, align: 256)
!2898 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 384, elements: !2899)
!2899 = !{!2900}
!2900 = !DISubrange(count: 6)
!2901 = !DILocation(line: 62, column: 27, scope: !2889)
!2902 = !DILocalVariable(name: "_pivot_row2", scope: !2889, file: !2890, line: 63, type: !2898, align: 256)
!2903 = !DILocation(line: 63, column: 27, scope: !2889)
!2904 = !DILocalVariable(name: "packed_A", scope: !2889, file: !2890, line: 64, type: !2905, align: 256)
!2905 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 29952, elements: !2906)
!2906 = !{!2907}
!2907 = !DISubrange(count: 468)
!2908 = !DILocation(line: 64, column: 27, scope: !2889)
!2909 = !DILocation(line: 66, column: 26, scope: !2889)
!2910 = !DILocation(line: 66, column: 32, scope: !2889)
!2911 = !DILocalVariable(name: "row_len", scope: !2889, file: !2890, line: 66, type: !45)
!2912 = !DILocalVariable(name: "i", scope: !2913, file: !2890, line: 69, type: !45)
!2913 = distinct !DILexicalBlock(scope: !2889, file: !2890, line: 69, column: 5)
!2914 = !DILocation(line: 0, scope: !2913)
!2915 = !DILocation(line: 69, column: 10, scope: !2913)
!2916 = !DILocation(line: 69, scope: !2913)
!2917 = !DILocation(line: 69, column: 23, scope: !2918)
!2918 = distinct !DILexicalBlock(scope: !2913, file: !2890, line: 69, column: 5)
!2919 = !DILocation(line: 69, column: 5, scope: !2913)
!2920 = !DILocation(line: 77, column: 5, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2889, file: !2890, line: 77, column: 5)
!2922 = !DILocation(line: 70, column: 29, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2918, file: !2890, line: 69, column: 37)
!2924 = !DILocation(line: 70, column: 25, scope: !2923)
!2925 = !DILocation(line: 70, column: 51, scope: !2923)
!2926 = !DILocation(line: 70, column: 47, scope: !2923)
!2927 = !DILocation(line: 70, column: 9, scope: !2923)
!2928 = !DILocation(line: 69, column: 33, scope: !2918)
!2929 = !DILocation(line: 69, column: 5, scope: !2918)
!2930 = distinct !{!2930, !2919, !2931, !244}
!2931 = !DILocation(line: 71, column: 5, scope: !2913)
!2932 = !DILocation(line: 77, scope: !2921)
!2933 = !DILocalVariable(name: "pivot_row", scope: !2889, file: !2890, line: 76, type: !45)
!2934 = !DILocalVariable(name: "pivot_col", scope: !2921, file: !2890, line: 77, type: !45)
!2935 = !DILocation(line: 0, scope: !2921)
!2936 = !DILocation(line: 77, column: 39, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2921, file: !2890, line: 77, column: 5)
!2938 = !DILocation(line: 138, column: 5, scope: !2939)
!2939 = distinct !DILexicalBlock(scope: !2889, file: !2890, line: 138, column: 5)
!2940 = !DILocation(line: 79, column: 37, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2937, file: !2890, line: 77, column: 61)
!2942 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !2941, file: !2890, line: 79, type: !45)
!2943 = !DILocation(line: 0, scope: !2941)
!2944 = !DILocation(line: 80, column: 37, scope: !2941)
!2945 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !2941, file: !2890, line: 80, type: !45)
!2946 = !DILocalVariable(name: "i", scope: !2947, file: !2890, line: 85, type: !45)
!2947 = distinct !DILexicalBlock(scope: !2941, file: !2890, line: 85, column: 9)
!2948 = !DILocation(line: 0, scope: !2947)
!2949 = !DILocation(line: 85, column: 14, scope: !2947)
!2950 = !DILocation(line: 85, scope: !2947)
!2951 = !DILocation(line: 85, column: 27, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2947, file: !2890, line: 85, column: 9)
!2953 = !DILocation(line: 85, column: 9, scope: !2947)
!2954 = !DILocation(line: 93, column: 9, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2941, file: !2890, line: 93, column: 9)
!2956 = !DILocation(line: 86, column: 13, scope: !2957)
!2957 = distinct !DILexicalBlock(scope: !2952, file: !2890, line: 85, column: 43)
!2958 = !DILocation(line: 86, column: 27, scope: !2957)
!2959 = !DILocation(line: 87, column: 13, scope: !2957)
!2960 = !DILocation(line: 87, column: 28, scope: !2957)
!2961 = !DILocation(line: 85, column: 39, scope: !2952)
!2962 = !DILocation(line: 85, column: 9, scope: !2952)
!2963 = distinct !{!2963, !2953, !2964, !244}
!2964 = !DILocation(line: 88, column: 9, scope: !2947)
!2965 = !DILocation(line: 0, scope: !2955)
!2966 = !DILocalVariable(name: "row", scope: !2955, file: !2890, line: 93, type: !45)
!2967 = !DILocalVariable(name: "pivot", scope: !2941, file: !2890, line: 91, type: !14)
!2968 = !DILocalVariable(name: "pivot_is_zero", scope: !2941, file: !2890, line: 92, type: !6)
!2969 = !DILocation(line: 94, column: 24, scope: !2970)
!2970 = distinct !DILexicalBlock(scope: !2955, file: !2890, line: 93, column: 9)
!2971 = !DILocation(line: 94, column: 21, scope: !2970)
!2972 = !DILocation(line: 96, column: 38, scope: !2973)
!2973 = distinct !DILexicalBlock(scope: !2970, file: !2890, line: 94, column: 80)
!2974 = !DILocation(line: 96, column: 37, scope: !2973)
!2975 = !DILocalVariable(name: "is_pivot_row", scope: !2973, file: !2890, line: 96, type: !6)
!2976 = !DILocation(line: 0, scope: !2973)
!2977 = !DILocation(line: 97, column: 40, scope: !2973)
!2978 = !DILocalVariable(name: "below_pivot_row", scope: !2973, file: !2890, line: 97, type: !6)
!2979 = !DILocalVariable(name: "j", scope: !2980, file: !2890, line: 99, type: !45)
!2980 = distinct !DILexicalBlock(scope: !2973, file: !2890, line: 99, column: 13)
!2981 = !DILocation(line: 0, scope: !2980)
!2982 = !DILocation(line: 99, column: 18, scope: !2980)
!2983 = !DILocation(line: 99, scope: !2980)
!2984 = !DILocation(line: 99, column: 31, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2980, file: !2890, line: 99, column: 13)
!2986 = !DILocation(line: 99, column: 13, scope: !2980)
!2987 = !DILocation(line: 100, column: 67, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2985, file: !2890, line: 99, column: 47)
!2989 = !DILocation(line: 100, column: 48, scope: !2988)
!2990 = !DILocation(line: 101, column: 47, scope: !2988)
!2991 = !DILocation(line: 101, column: 57, scope: !2988)
!2992 = !DILocation(line: 101, column: 34, scope: !2988)
!2993 = !DILocation(line: 100, column: 85, scope: !2988)
!2994 = !DILocation(line: 100, column: 17, scope: !2988)
!2995 = !DILocation(line: 100, column: 31, scope: !2988)
!2996 = !DILocation(line: 99, column: 43, scope: !2985)
!2997 = !DILocation(line: 99, column: 13, scope: !2985)
!2998 = distinct !{!2998, !2986, !2999, !244}
!2999 = !DILocation(line: 102, column: 13, scope: !2980)
!3000 = !DILocation(line: 103, column: 21, scope: !2973)
!3001 = !DILocation(line: 104, column: 44, scope: !2973)
!3002 = !DILocation(line: 104, column: 30, scope: !2973)
!3003 = !DILocation(line: 104, column: 29, scope: !2973)
!3004 = !DILocation(line: 94, column: 76, scope: !2970)
!3005 = !DILocation(line: 93, column: 9, scope: !2970)
!3006 = distinct !{!3006, !2954, !3007, !244}
!3007 = !DILocation(line: 105, column: 9, scope: !2955)
!3008 = !DILocation(line: 108, column: 19, scope: !2941)
!3009 = !DILocalVariable(name: "inverse", scope: !2889, file: !2890, line: 75, type: !14)
!3010 = !DILocation(line: 109, column: 9, scope: !2941)
!3011 = !DILocalVariable(name: "row", scope: !3012, file: !2890, line: 113, type: !45)
!3012 = distinct !DILexicalBlock(scope: !2941, file: !2890, line: 113, column: 9)
!3013 = !DILocation(line: 0, scope: !3012)
!3014 = !DILocation(line: 113, column: 14, scope: !3012)
!3015 = !DILocation(line: 113, scope: !3012)
!3016 = !DILocation(line: 113, column: 51, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !3012, file: !2890, line: 113, column: 9)
!3018 = !DILocation(line: 113, column: 9, scope: !3012)
!3019 = !DILocation(line: 124, column: 9, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !2941, file: !2890, line: 124, column: 9)
!3021 = !DILocation(line: 114, column: 33, scope: !3022)
!3022 = distinct !DILexicalBlock(scope: !3017, file: !2890, line: 113, column: 84)
!3023 = !DILocation(line: 114, column: 63, scope: !3022)
!3024 = !DILocalVariable(name: "do_copy", scope: !3022, file: !2890, line: 114, type: !6)
!3025 = !DILocation(line: 0, scope: !3022)
!3026 = !DILocalVariable(name: "do_not_copy", scope: !3022, file: !2890, line: 115, type: !6)
!3027 = !DILocalVariable(name: "col", scope: !3028, file: !2890, line: 116, type: !45)
!3028 = distinct !DILexicalBlock(scope: !3022, file: !2890, line: 116, column: 13)
!3029 = !DILocation(line: 0, scope: !3028)
!3030 = !DILocation(line: 116, column: 18, scope: !3028)
!3031 = !DILocation(line: 116, scope: !3028)
!3032 = !DILocation(line: 116, column: 35, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3028, file: !2890, line: 116, column: 13)
!3034 = !DILocation(line: 116, column: 13, scope: !3028)
!3035 = !DILocation(line: 118, column: 49, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !3033, file: !2890, line: 116, column: 53)
!3037 = !DILocation(line: 118, column: 59, scope: !3036)
!3038 = !DILocation(line: 118, column: 36, scope: !3036)
!3039 = !DILocation(line: 118, column: 34, scope: !3036)
!3040 = !DILocation(line: 119, column: 32, scope: !3036)
!3041 = !DILocation(line: 119, column: 30, scope: !3036)
!3042 = !DILocation(line: 118, column: 67, scope: !3036)
!3043 = !DILocation(line: 117, column: 30, scope: !3036)
!3044 = !DILocation(line: 117, column: 40, scope: !3036)
!3045 = !DILocation(line: 117, column: 17, scope: !3036)
!3046 = !DILocation(line: 117, column: 47, scope: !3036)
!3047 = !DILocation(line: 116, column: 49, scope: !3033)
!3048 = !DILocation(line: 116, column: 13, scope: !3033)
!3049 = distinct !{!3049, !3034, !3050, !244}
!3050 = !DILocation(line: 120, column: 13, scope: !3028)
!3051 = !DILocation(line: 113, column: 80, scope: !3017)
!3052 = !DILocation(line: 113, column: 9, scope: !3017)
!3053 = distinct !{!3053, !3018, !3054, !244}
!3054 = !DILocation(line: 121, column: 9, scope: !3012)
!3055 = !DILocation(line: 124, scope: !3020)
!3056 = !DILocalVariable(name: "row", scope: !3020, file: !2890, line: 124, type: !45)
!3057 = !DILocation(line: 0, scope: !3020)
!3058 = !DILocation(line: 124, column: 51, scope: !3059)
!3059 = distinct !DILexicalBlock(scope: !3020, file: !2890, line: 124, column: 9)
!3060 = !DILocation(line: 125, column: 46, scope: !3061)
!3061 = distinct !DILexicalBlock(scope: !3059, file: !2890, line: 124, column: 67)
!3062 = !DILocalVariable(name: "below_pivot", scope: !3061, file: !2890, line: 125, type: !14)
!3063 = !DILocation(line: 0, scope: !3061)
!3064 = !DILocation(line: 126, column: 74, scope: !3061)
!3065 = !DILocation(line: 126, column: 68, scope: !3061)
!3066 = !DILocation(line: 126, column: 41, scope: !3061)
!3067 = !DILocalVariable(name: "elt_to_elim", scope: !3061, file: !2890, line: 126, type: !14)
!3068 = !DILocation(line: 128, column: 63, scope: !3061)
!3069 = !DILocation(line: 129, column: 52, scope: !3061)
!3070 = !DILocation(line: 129, column: 46, scope: !3061)
!3071 = !DILocation(line: 128, column: 13, scope: !3061)
!3072 = !DILocation(line: 124, column: 63, scope: !3059)
!3073 = !DILocation(line: 124, column: 9, scope: !3059)
!3074 = distinct !{!3074, !3019, !3075, !244}
!3075 = !DILocation(line: 130, column: 9, scope: !3020)
!3076 = !DILocation(line: 132, column: 19, scope: !2941)
!3077 = !DILocation(line: 77, column: 57, scope: !2937)
!3078 = !DILocation(line: 77, column: 5, scope: !2937)
!3079 = distinct !{!3079, !2920, !3080, !244}
!3080 = !DILocation(line: 133, column: 5, scope: !2921)
!3081 = !DILocation(line: 138, scope: !2939)
!3082 = !DILocalVariable(name: "i", scope: !2939, file: !2890, line: 138, type: !45)
!3083 = !DILocation(line: 0, scope: !2939)
!3084 = !DILocation(line: 138, column: 23, scope: !3085)
!3085 = distinct !DILexicalBlock(scope: !2939, file: !2890, line: 138, column: 5)
!3086 = !DILocation(line: 139, column: 47, scope: !3087)
!3087 = distinct !DILexicalBlock(scope: !3085, file: !2890, line: 138, column: 37)
!3088 = !DILocation(line: 139, column: 43, scope: !3087)
!3089 = !DILocation(line: 139, column: 9, scope: !3087)
!3090 = !DILocalVariable(name: "j", scope: !3091, file: !2890, line: 140, type: !45)
!3091 = distinct !DILexicalBlock(scope: !3087, file: !2890, line: 140, column: 9)
!3092 = !DILocation(line: 0, scope: !3091)
!3093 = !DILocation(line: 140, column: 14, scope: !3091)
!3094 = !DILocation(line: 140, scope: !3091)
!3095 = !DILocation(line: 140, column: 27, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3091, file: !2890, line: 140, column: 9)
!3097 = !DILocation(line: 140, column: 9, scope: !3091)
!3098 = !DILocation(line: 141, column: 32, scope: !3099)
!3099 = distinct !DILexicalBlock(scope: !3096, file: !2890, line: 140, column: 41)
!3100 = !DILocation(line: 141, column: 17, scope: !3099)
!3101 = !DILocation(line: 141, column: 13, scope: !3099)
!3102 = !DILocation(line: 141, column: 30, scope: !3099)
!3103 = !DILocation(line: 140, column: 37, scope: !3096)
!3104 = !DILocation(line: 140, column: 9, scope: !3096)
!3105 = distinct !{!3105, !3097, !3106, !244}
!3106 = !DILocation(line: 142, column: 9, scope: !3091)
!3107 = !DILocation(line: 138, column: 33, scope: !3085)
!3108 = !DILocation(line: 138, column: 5, scope: !3085)
!3109 = distinct !{!3109, !2938, !3110, !244}
!3110 = !DILocation(line: 143, column: 5, scope: !2939)
!3111 = !DILocation(line: 145, column: 5, scope: !2889)
!3112 = !DILocation(line: 146, column: 5, scope: !2889)
!3113 = !DILocation(line: 147, column: 5, scope: !2889)
!3114 = !DILocation(line: 148, column: 5, scope: !2889)
!3115 = !DILocation(line: 149, column: 1, scope: !2889)
!3116 = distinct !DISubprogram(name: "ct_compare_8", scope: !3117, file: !3117, line: 51, type: !1629, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3117 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3118 = !DILocalVariable(name: "a", arg: 1, scope: !3116, file: !3117, line: 51, type: !14)
!3119 = !DILocation(line: 0, scope: !3116)
!3120 = !DILocalVariable(name: "b", arg: 2, scope: !3116, file: !3117, line: 51, type: !14)
!3121 = !DILocation(line: 52, column: 42, scope: !3116)
!3122 = !DILocation(line: 52, column: 13, scope: !3116)
!3123 = !DILocation(line: 52, column: 71, scope: !3116)
!3124 = !DILocation(line: 52, column: 69, scope: !3116)
!3125 = !DILocation(line: 52, column: 5, scope: !3116)
!3126 = distinct !DISubprogram(name: "mul_fx8", scope: !595, file: !595, line: 29, type: !3127, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3127 = !DISubroutineType(types: !3128)
!3128 = !{!6, !14, !6}
!3129 = !DILocalVariable(name: "a", arg: 1, scope: !3126, file: !595, line: 29, type: !14)
!3130 = !DILocation(line: 0, scope: !3126)
!3131 = !DILocalVariable(name: "b", arg: 2, scope: !3126, file: !595, line: 29, type: !6)
!3132 = !DILocation(line: 32, column: 13, scope: !3126)
!3133 = !DILocation(line: 32, column: 10, scope: !3126)
!3134 = !DILocation(line: 32, column: 17, scope: !3126)
!3135 = !DILocalVariable(name: "p", scope: !3126, file: !595, line: 31, type: !6)
!3136 = !DILocation(line: 33, column: 13, scope: !3126)
!3137 = !DILocation(line: 33, column: 10, scope: !3126)
!3138 = !DILocation(line: 33, column: 17, scope: !3126)
!3139 = !DILocation(line: 33, column: 7, scope: !3126)
!3140 = !DILocation(line: 34, column: 13, scope: !3126)
!3141 = !DILocation(line: 34, column: 10, scope: !3126)
!3142 = !DILocation(line: 34, column: 17, scope: !3126)
!3143 = !DILocation(line: 34, column: 7, scope: !3126)
!3144 = !DILocation(line: 35, column: 13, scope: !3126)
!3145 = !DILocation(line: 35, column: 10, scope: !3126)
!3146 = !DILocation(line: 35, column: 17, scope: !3126)
!3147 = !DILocation(line: 35, column: 7, scope: !3126)
!3148 = !DILocalVariable(name: "top_p", scope: !3126, file: !595, line: 38, type: !6)
!3149 = !DILocation(line: 39, column: 32, scope: !3126)
!3150 = !DILocation(line: 39, column: 47, scope: !3126)
!3151 = !DILocation(line: 39, column: 38, scope: !3126)
!3152 = !DILocation(line: 39, column: 54, scope: !3126)
!3153 = !DILocalVariable(name: "out", scope: !3126, file: !595, line: 39, type: !6)
!3154 = !DILocation(line: 40, column: 5, scope: !3126)
!3155 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !2890, file: !2890, line: 24, type: !3156, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3156 = !DISubroutineType(types: !3157)
!3157 = !{null, !49, !5, !45}
!3158 = !DILocalVariable(name: "in", arg: 1, scope: !3155, file: !2890, line: 24, type: !49)
!3159 = !DILocation(line: 0, scope: !3155)
!3160 = !DILocalVariable(name: "out", arg: 2, scope: !3155, file: !2890, line: 24, type: !5)
!3161 = !DILocalVariable(name: "ncols", arg: 3, scope: !3155, file: !2890, line: 24, type: !45)
!3162 = !DILocalVariable(name: "out8", scope: !3155, file: !2890, line: 26, type: !18)
!3163 = !DILocalVariable(name: "i", scope: !3155, file: !2890, line: 25, type: !45)
!3164 = !DILocation(line: 27, column: 9, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3155, file: !2890, line: 27, column: 5)
!3166 = !DILocation(line: 27, scope: !3165)
!3167 = !DILocation(line: 27, column: 17, scope: !3168)
!3168 = distinct !DILexicalBlock(scope: !3165, file: !2890, line: 27, column: 5)
!3169 = !DILocation(line: 27, column: 20, scope: !3168)
!3170 = !DILocation(line: 27, column: 5, scope: !3165)
!3171 = !DILocation(line: 31, column: 23, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3168, file: !2890, line: 27, column: 36)
!3173 = !DILocation(line: 31, column: 44, scope: !3172)
!3174 = !DILocation(line: 31, column: 40, scope: !3172)
!3175 = !DILocation(line: 31, column: 48, scope: !3172)
!3176 = !DILocation(line: 31, column: 37, scope: !3172)
!3177 = !DILocation(line: 31, column: 15, scope: !3172)
!3178 = !DILocation(line: 31, column: 9, scope: !3172)
!3179 = !DILocation(line: 31, column: 20, scope: !3172)
!3180 = !DILocation(line: 27, column: 31, scope: !3168)
!3181 = !DILocation(line: 27, column: 5, scope: !3168)
!3182 = distinct !{!3182, !3170, !3183, !244}
!3183 = !DILocation(line: 33, column: 5, scope: !3165)
!3184 = !DILocation(line: 34, column: 19, scope: !3185)
!3185 = distinct !DILexicalBlock(scope: !3155, file: !2890, line: 34, column: 9)
!3186 = !DILocation(line: 38, column: 23, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3185, file: !2890, line: 34, column: 24)
!3188 = !DILocation(line: 38, column: 15, scope: !3187)
!3189 = !DILocation(line: 38, column: 9, scope: !3187)
!3190 = !DILocation(line: 38, column: 20, scope: !3187)
!3191 = !DILocation(line: 40, column: 5, scope: !3187)
!3192 = !DILocation(line: 41, column: 1, scope: !3155)
!3193 = distinct !DISubprogram(name: "ct_compare_64", scope: !3117, file: !3117, line: 46, type: !3194, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3194 = !DISubroutineType(types: !3195)
!3195 = !{!6, !45, !45}
!3196 = !DILocalVariable(name: "a", arg: 1, scope: !3193, file: !3117, line: 46, type: !45)
!3197 = !DILocation(line: 0, scope: !3193)
!3198 = !DILocalVariable(name: "b", arg: 2, scope: !3193, file: !3117, line: 46, type: !45)
!3199 = !DILocation(line: 47, column: 38, scope: !3193)
!3200 = !DILocation(line: 47, column: 44, scope: !3193)
!3201 = !DILocation(line: 47, column: 73, scope: !3193)
!3202 = !DILocation(line: 47, column: 71, scope: !3193)
!3203 = !DILocation(line: 47, column: 5, scope: !3193)
!3204 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3117, file: !3117, line: 35, type: !3194, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3205 = !DILocalVariable(name: "a", arg: 1, scope: !3204, file: !3117, line: 35, type: !45)
!3206 = !DILocation(line: 0, scope: !3204)
!3207 = !DILocalVariable(name: "b", arg: 2, scope: !3204, file: !3117, line: 35, type: !45)
!3208 = !DILocalVariable(name: "diff", scope: !3204, file: !3117, line: 36, type: !46)
!3209 = !DILocation(line: 37, column: 30, scope: !3204)
!3210 = !DILocation(line: 37, column: 59, scope: !3204)
!3211 = !DILocation(line: 37, column: 57, scope: !3204)
!3212 = !DILocation(line: 37, column: 5, scope: !3204)
!3213 = distinct !DISubprogram(name: "m_extract_element", scope: !2890, file: !2890, line: 16, type: !3214, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3214 = !DISubroutineType(types: !3215)
!3215 = !{!14, !428, !45}
!3216 = !DILocalVariable(name: "in", arg: 1, scope: !3213, file: !2890, line: 16, type: !428)
!3217 = !DILocation(line: 0, scope: !3213)
!3218 = !DILocalVariable(name: "index", arg: 2, scope: !3213, file: !2890, line: 16, type: !45)
!3219 = !DILocation(line: 17, column: 27, scope: !3213)
!3220 = !DILocalVariable(name: "leg", scope: !3213, file: !2890, line: 17, type: !343)
!3221 = !DILocation(line: 18, column: 30, scope: !3213)
!3222 = !DILocalVariable(name: "offset", scope: !3213, file: !2890, line: 18, type: !343)
!3223 = !DILocation(line: 20, column: 13, scope: !3213)
!3224 = !DILocation(line: 20, column: 31, scope: !3213)
!3225 = !DILocation(line: 20, column: 21, scope: !3213)
!3226 = !DILocation(line: 20, column: 12, scope: !3213)
!3227 = !DILocation(line: 20, column: 5, scope: !3213)
!3228 = distinct !DISubprogram(name: "inverse_f", scope: !595, file: !595, line: 58, type: !3229, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3229 = !DISubroutineType(types: !3230)
!3230 = !{!14, !14}
!3231 = !DILocalVariable(name: "a", arg: 1, scope: !3228, file: !595, line: 58, type: !14)
!3232 = !DILocation(line: 0, scope: !3228)
!3233 = !DILocation(line: 62, column: 24, scope: !3228)
!3234 = !DILocalVariable(name: "a2", scope: !3228, file: !595, line: 62, type: !14)
!3235 = !DILocation(line: 63, column: 24, scope: !3228)
!3236 = !DILocalVariable(name: "a4", scope: !3228, file: !595, line: 63, type: !14)
!3237 = !DILocation(line: 64, column: 24, scope: !3228)
!3238 = !DILocalVariable(name: "a8", scope: !3228, file: !595, line: 64, type: !14)
!3239 = !DILocation(line: 65, column: 24, scope: !3228)
!3240 = !DILocalVariable(name: "a6", scope: !3228, file: !595, line: 65, type: !14)
!3241 = !DILocation(line: 66, column: 25, scope: !3228)
!3242 = !DILocalVariable(name: "a14", scope: !3228, file: !595, line: 66, type: !14)
!3243 = !DILocation(line: 68, column: 5, scope: !3228)
!3244 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3117, file: !3117, line: 94, type: !3245, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3245 = !DISubroutineType(types: !3246)
!3246 = !{null, !343, !428, !14, !5}
!3247 = !DILocalVariable(name: "legs", arg: 1, scope: !3244, file: !3117, line: 94, type: !343)
!3248 = !DILocation(line: 0, scope: !3244)
!3249 = !DILocalVariable(name: "in", arg: 2, scope: !3244, file: !3117, line: 94, type: !428)
!3250 = !DILocalVariable(name: "a", arg: 3, scope: !3244, file: !3117, line: 94, type: !14)
!3251 = !DILocalVariable(name: "acc", arg: 4, scope: !3244, file: !3117, line: 94, type: !5)
!3252 = !DILocation(line: 95, column: 20, scope: !3244)
!3253 = !DILocalVariable(name: "tab", scope: !3244, file: !3117, line: 95, type: !19)
!3254 = !DILocalVariable(name: "lsb_ask", scope: !3244, file: !3117, line: 97, type: !6)
!3255 = !DILocalVariable(name: "i", scope: !3256, file: !3117, line: 99, type: !45)
!3256 = distinct !DILexicalBlock(scope: !3244, file: !3117, line: 99, column: 5)
!3257 = !DILocation(line: 0, scope: !3256)
!3258 = !DILocation(line: 99, column: 9, scope: !3256)
!3259 = !DILocation(line: 99, scope: !3256)
!3260 = !DILocation(line: 99, column: 20, scope: !3261)
!3261 = distinct !DILexicalBlock(scope: !3256, file: !3117, line: 99, column: 5)
!3262 = !DILocation(line: 99, column: 5, scope: !3256)
!3263 = !DILocation(line: 100, column: 21, scope: !3264)
!3264 = distinct !DILexicalBlock(scope: !3261, file: !3117, line: 99, column: 32)
!3265 = !DILocation(line: 100, column: 33, scope: !3264)
!3266 = !DILocation(line: 100, column: 51, scope: !3264)
!3267 = !DILocation(line: 100, column: 46, scope: !3264)
!3268 = !DILocation(line: 100, column: 44, scope: !3264)
!3269 = !DILocation(line: 101, column: 27, scope: !3264)
!3270 = !DILocation(line: 101, column: 33, scope: !3264)
!3271 = !DILocation(line: 101, column: 52, scope: !3264)
!3272 = !DILocation(line: 101, column: 59, scope: !3264)
!3273 = !DILocation(line: 101, column: 46, scope: !3264)
!3274 = !DILocation(line: 101, column: 44, scope: !3264)
!3275 = !DILocation(line: 101, column: 17, scope: !3264)
!3276 = !DILocation(line: 102, column: 21, scope: !3264)
!3277 = !DILocation(line: 102, column: 27, scope: !3264)
!3278 = !DILocation(line: 102, column: 33, scope: !3264)
!3279 = !DILocation(line: 102, column: 52, scope: !3264)
!3280 = !DILocation(line: 102, column: 59, scope: !3264)
!3281 = !DILocation(line: 102, column: 46, scope: !3264)
!3282 = !DILocation(line: 102, column: 44, scope: !3264)
!3283 = !DILocation(line: 102, column: 17, scope: !3264)
!3284 = !DILocation(line: 103, column: 21, scope: !3264)
!3285 = !DILocation(line: 103, column: 27, scope: !3264)
!3286 = !DILocation(line: 103, column: 33, scope: !3264)
!3287 = !DILocation(line: 103, column: 52, scope: !3264)
!3288 = !DILocation(line: 103, column: 59, scope: !3264)
!3289 = !DILocation(line: 103, column: 46, scope: !3264)
!3290 = !DILocation(line: 103, column: 44, scope: !3264)
!3291 = !DILocation(line: 103, column: 17, scope: !3264)
!3292 = !DILocation(line: 100, column: 9, scope: !3264)
!3293 = !DILocation(line: 100, column: 16, scope: !3264)
!3294 = !DILocation(line: 99, column: 29, scope: !3261)
!3295 = !DILocation(line: 99, column: 5, scope: !3261)
!3296 = distinct !{!3296, !3262, !3297, !244}
!3297 = !DILocation(line: 104, column: 5, scope: !3256)
!3298 = !DILocation(line: 105, column: 1, scope: !3244)
!3299 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !2890, file: !2890, line: 44, type: !3300, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3300 = !DISubroutineType(types: !3301)
!3301 = !{null, !45, !428, !18}
!3302 = !DILocalVariable(name: "legs", arg: 1, scope: !3299, file: !2890, line: 44, type: !45)
!3303 = !DILocation(line: 0, scope: !3299)
!3304 = !DILocalVariable(name: "in", arg: 2, scope: !3299, file: !2890, line: 44, type: !428)
!3305 = !DILocalVariable(name: "out", arg: 3, scope: !3299, file: !2890, line: 44, type: !18)
!3306 = !DILocalVariable(name: "in8", scope: !3299, file: !2890, line: 45, type: !49)
!3307 = !DILocalVariable(name: "i", scope: !3308, file: !2890, line: 46, type: !45)
!3308 = distinct !DILexicalBlock(scope: !3299, file: !2890, line: 46, column: 5)
!3309 = !DILocation(line: 0, scope: !3308)
!3310 = !DILocation(line: 46, column: 9, scope: !3308)
!3311 = !DILocation(line: 46, scope: !3308)
!3312 = !DILocation(line: 46, column: 29, scope: !3313)
!3313 = distinct !DILexicalBlock(scope: !3308, file: !2890, line: 46, column: 5)
!3314 = !DILocation(line: 46, column: 22, scope: !3313)
!3315 = !DILocation(line: 46, column: 5, scope: !3308)
!3316 = !DILocation(line: 51, column: 26, scope: !3317)
!3317 = distinct !DILexicalBlock(scope: !3313, file: !2890, line: 46, column: 42)
!3318 = !DILocation(line: 51, column: 21, scope: !3317)
!3319 = !DILocation(line: 51, column: 31, scope: !3317)
!3320 = !DILocation(line: 51, column: 9, scope: !3317)
!3321 = !DILocation(line: 51, column: 18, scope: !3317)
!3322 = !DILocation(line: 52, column: 26, scope: !3317)
!3323 = !DILocation(line: 52, column: 21, scope: !3317)
!3324 = !DILocation(line: 52, column: 30, scope: !3317)
!3325 = !DILocation(line: 52, column: 14, scope: !3317)
!3326 = !DILocation(line: 52, column: 9, scope: !3317)
!3327 = !DILocation(line: 52, column: 18, scope: !3317)
!3328 = !DILocation(line: 46, column: 37, scope: !3313)
!3329 = !DILocation(line: 46, column: 5, scope: !3313)
!3330 = distinct !{!3330, !3315, !3331, !244}
!3331 = !DILocation(line: 54, column: 5, scope: !3308)
!3332 = !DILocation(line: 55, column: 1, scope: !3299)
!3333 = distinct !DISubprogram(name: "mul_table", scope: !595, file: !595, line: 136, type: !596, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3334 = !DILocalVariable(name: "b", arg: 1, scope: !3333, file: !595, line: 136, type: !12)
!3335 = !DILocation(line: 0, scope: !3333)
!3336 = !DILocation(line: 137, column: 19, scope: !3333)
!3337 = !DILocation(line: 137, column: 33, scope: !3333)
!3338 = !DILocalVariable(name: "x", scope: !3333, file: !595, line: 137, type: !19)
!3339 = !DILocalVariable(name: "high_nibble_mask", scope: !3333, file: !595, line: 139, type: !19)
!3340 = !DILocation(line: 141, column: 28, scope: !3333)
!3341 = !DILocalVariable(name: "high_half", scope: !3333, file: !595, line: 141, type: !19)
!3342 = !DILocation(line: 142, column: 28, scope: !3333)
!3343 = !DILocation(line: 142, column: 47, scope: !3333)
!3344 = !DILocation(line: 142, column: 34, scope: !3333)
!3345 = !DILocation(line: 142, column: 5, scope: !3333)
!3346 = distinct !DISubprogram(name: "mul_f", scope: !595, file: !595, line: 10, type: !1629, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3347 = !DILocalVariable(name: "a", arg: 1, scope: !3346, file: !595, line: 10, type: !14)
!3348 = !DILocation(line: 0, scope: !3346)
!3349 = !DILocalVariable(name: "b", arg: 2, scope: !3346, file: !595, line: 10, type: !14)
!3350 = !DILocation(line: 15, column: 10, scope: !3346)
!3351 = !DILocation(line: 15, column: 7, scope: !3346)
!3352 = !DILocation(line: 18, column: 17, scope: !3346)
!3353 = !DILocalVariable(name: "p", scope: !3346, file: !595, line: 12, type: !14)
!3354 = !DILocation(line: 19, column: 13, scope: !3346)
!3355 = !DILocation(line: 19, column: 17, scope: !3346)
!3356 = !DILocation(line: 19, column: 7, scope: !3346)
!3357 = !DILocation(line: 20, column: 13, scope: !3346)
!3358 = !DILocation(line: 20, column: 17, scope: !3346)
!3359 = !DILocation(line: 20, column: 7, scope: !3346)
!3360 = !DILocation(line: 21, column: 13, scope: !3346)
!3361 = !DILocation(line: 21, column: 17, scope: !3346)
!3362 = !DILocation(line: 21, column: 7, scope: !3346)
!3363 = !DILocalVariable(name: "top_p", scope: !3346, file: !595, line: 24, type: !14)
!3364 = !DILocation(line: 25, column: 37, scope: !3346)
!3365 = !DILocation(line: 25, column: 52, scope: !3346)
!3366 = !DILocation(line: 25, column: 43, scope: !3346)
!3367 = !DILocation(line: 25, column: 59, scope: !3346)
!3368 = !DILocalVariable(name: "out", scope: !3346, file: !595, line: 25, type: !14)
!3369 = !DILocation(line: 26, column: 5, scope: !3346)
!3370 = distinct !DISubprogram(name: "lincomb", scope: !595, file: !595, line: 71, type: !1637, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3371 = !DILocalVariable(name: "a", arg: 1, scope: !3370, file: !595, line: 71, type: !49)
!3372 = !DILocation(line: 0, scope: !3370)
!3373 = !DILocalVariable(name: "b", arg: 2, scope: !3370, file: !595, line: 72, type: !49)
!3374 = !DILocalVariable(name: "n", arg: 3, scope: !3370, file: !595, line: 72, type: !45)
!3375 = !DILocalVariable(name: "m", arg: 4, scope: !3370, file: !595, line: 72, type: !45)
!3376 = !DILocalVariable(name: "ret", scope: !3370, file: !595, line: 73, type: !14)
!3377 = !DILocalVariable(name: "i", scope: !3378, file: !595, line: 74, type: !45)
!3378 = distinct !DILexicalBlock(scope: !3370, file: !595, line: 74, column: 5)
!3379 = !DILocation(line: 0, scope: !3378)
!3380 = !DILocation(line: 74, column: 10, scope: !3378)
!3381 = !DILocation(line: 74, scope: !3378)
!3382 = !DILocation(line: 74, column: 23, scope: !3383)
!3383 = distinct !DILexicalBlock(scope: !3378, file: !595, line: 74, column: 5)
!3384 = !DILocation(line: 74, column: 5, scope: !3378)
!3385 = !DILocation(line: 75, column: 27, scope: !3386)
!3386 = distinct !DILexicalBlock(scope: !3383, file: !595, line: 74, column: 41)
!3387 = !DILocation(line: 75, column: 33, scope: !3386)
!3388 = !DILocation(line: 75, column: 21, scope: !3386)
!3389 = !DILocation(line: 75, column: 15, scope: !3386)
!3390 = !DILocation(line: 74, column: 28, scope: !3383)
!3391 = !DILocation(line: 74, column: 35, scope: !3383)
!3392 = !DILocation(line: 74, column: 5, scope: !3383)
!3393 = distinct !{!3393, !3384, !3394, !244}
!3394 = !DILocation(line: 76, column: 5, scope: !3378)
!3395 = !DILocation(line: 79, column: 5, scope: !3370)
!3396 = distinct !DISubprogram(name: "add_f", scope: !595, file: !595, line: 44, type: !1629, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !28)
!3397 = !DILocalVariable(name: "a", arg: 1, scope: !3396, file: !595, line: 44, type: !14)
!3398 = !DILocation(line: 0, scope: !3396)
!3399 = !DILocalVariable(name: "b", arg: 2, scope: !3396, file: !595, line: 44, type: !14)
!3400 = !DILocation(line: 45, column: 14, scope: !3396)
!3401 = !DILocation(line: 45, column: 5, scope: !3396)
!3402 = distinct !DISubprogram(name: "shake128_inc_init", scope: !71, file: !71, line: 688, type: !3403, scopeLine: 688, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3403 = !DISubroutineType(types: !3404)
!3404 = !{null, !3405}
!3405 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3406, size: 32)
!3406 = !DIDerivedType(tag: DW_TAG_typedef, name: "shake128incctx", file: !71, line: 31, baseType: !3407)
!3407 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 29, size: 32, elements: !3408)
!3408 = !{!3409}
!3409 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !3407, file: !71, line: 30, baseType: !5, size: 32)
!3410 = !DILocalVariable(name: "state", arg: 1, scope: !3402, file: !71, line: 688, type: !3405)
!3411 = !DILocation(line: 0, scope: !3402)
!3412 = !DILocation(line: 689, column: 18, scope: !3402)
!3413 = !DILocation(line: 689, column: 16, scope: !3402)
!3414 = !DILocation(line: 690, column: 20, scope: !3415)
!3415 = distinct !DILexicalBlock(scope: !3402, file: !71, line: 690, column: 9)
!3416 = !DILocation(line: 691, column: 9, scope: !3417)
!3417 = distinct !DILexicalBlock(scope: !3415, file: !71, line: 690, column: 29)
!3418 = !DILocation(line: 692, column: 5, scope: !3417)
!3419 = !DILocation(line: 693, column: 28, scope: !3402)
!3420 = !DILocation(line: 693, column: 5, scope: !3402)
!3421 = !DILocation(line: 694, column: 1, scope: !3402)
!3422 = distinct !DISubprogram(name: "keccak_inc_init", scope: !71, file: !71, line: 580, type: !26, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3423 = !DILocalVariable(name: "s_inc", arg: 1, scope: !3422, file: !71, line: 580, type: !5)
!3424 = !DILocation(line: 0, scope: !3422)
!3425 = !DILocalVariable(name: "i", scope: !3422, file: !71, line: 581, type: !15)
!3426 = !DILocation(line: 583, column: 10, scope: !3427)
!3427 = distinct !DILexicalBlock(scope: !3422, file: !71, line: 583, column: 5)
!3428 = !DILocation(line: 583, scope: !3427)
!3429 = !DILocation(line: 583, column: 19, scope: !3430)
!3430 = distinct !DILexicalBlock(scope: !3427, file: !71, line: 583, column: 5)
!3431 = !DILocation(line: 583, column: 5, scope: !3427)
!3432 = !DILocation(line: 584, column: 9, scope: !3433)
!3433 = distinct !DILexicalBlock(scope: !3430, file: !71, line: 583, column: 30)
!3434 = !DILocation(line: 584, column: 18, scope: !3433)
!3435 = !DILocation(line: 583, column: 25, scope: !3430)
!3436 = !DILocation(line: 583, column: 5, scope: !3430)
!3437 = distinct !{!3437, !3431, !3438, !244}
!3438 = !DILocation(line: 585, column: 5, scope: !3427)
!3439 = !DILocation(line: 586, column: 5, scope: !3422)
!3440 = !DILocation(line: 586, column: 15, scope: !3422)
!3441 = !DILocation(line: 587, column: 1, scope: !3422)
!3442 = distinct !DISubprogram(name: "shake128_inc_absorb", scope: !71, file: !71, line: 696, type: !3443, scopeLine: 696, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3443 = !DISubroutineType(types: !3444)
!3444 = !{null, !3405, !257, !15}
!3445 = !DILocalVariable(name: "state", arg: 1, scope: !3442, file: !71, line: 696, type: !3405)
!3446 = !DILocation(line: 0, scope: !3442)
!3447 = !DILocalVariable(name: "input", arg: 2, scope: !3442, file: !71, line: 696, type: !257)
!3448 = !DILocalVariable(name: "inlen", arg: 3, scope: !3442, file: !71, line: 696, type: !15)
!3449 = !DILocation(line: 697, column: 30, scope: !3442)
!3450 = !DILocation(line: 697, column: 5, scope: !3442)
!3451 = !DILocation(line: 698, column: 1, scope: !3442)
!3452 = distinct !DISubprogram(name: "keccak_inc_absorb", scope: !71, file: !71, line: 603, type: !3453, scopeLine: 604, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3453 = !DISubroutineType(types: !3454)
!3454 = !{null, !5, !19, !257, !15}
!3455 = !DILocalVariable(name: "s_inc", arg: 1, scope: !3452, file: !71, line: 603, type: !5)
!3456 = !DILocation(line: 0, scope: !3452)
!3457 = !DILocalVariable(name: "r", arg: 2, scope: !3452, file: !71, line: 603, type: !19)
!3458 = !DILocalVariable(name: "m", arg: 3, scope: !3452, file: !71, line: 603, type: !257)
!3459 = !DILocalVariable(name: "mlen", arg: 4, scope: !3452, file: !71, line: 604, type: !15)
!3460 = !DILocation(line: 608, column: 5, scope: !3452)
!3461 = !DILocation(line: 608, column: 12, scope: !3452)
!3462 = !DILocation(line: 608, column: 19, scope: !3452)
!3463 = !DILocation(line: 608, column: 17, scope: !3452)
!3464 = !DILocation(line: 608, column: 32, scope: !3452)
!3465 = !DILocation(line: 608, column: 29, scope: !3452)
!3466 = !DILocation(line: 609, column: 9, scope: !3467)
!3467 = distinct !DILexicalBlock(scope: !3468, file: !71, line: 609, column: 9)
!3468 = distinct !DILexicalBlock(scope: !3452, file: !71, line: 608, column: 35)
!3469 = !DILocation(line: 621, column: 5, scope: !3470)
!3470 = distinct !DILexicalBlock(scope: !3452, file: !71, line: 621, column: 5)
!3471 = !DILocation(line: 609, scope: !3467)
!3472 = !DILocalVariable(name: "i", scope: !3452, file: !71, line: 605, type: !15)
!3473 = !DILocation(line: 609, column: 39, scope: !3474)
!3474 = distinct !DILexicalBlock(scope: !3467, file: !71, line: 609, column: 9)
!3475 = !DILocation(line: 609, column: 29, scope: !3474)
!3476 = !DILocation(line: 609, column: 27, scope: !3474)
!3477 = !DILocation(line: 609, column: 23, scope: !3474)
!3478 = !DILocation(line: 612, column: 54, scope: !3479)
!3479 = distinct !DILexicalBlock(scope: !3474, file: !71, line: 609, column: 55)
!3480 = !DILocation(line: 612, column: 44, scope: !3479)
!3481 = !DILocation(line: 612, column: 69, scope: !3479)
!3482 = !DILocation(line: 612, column: 81, scope: !3479)
!3483 = !DILocation(line: 612, column: 79, scope: !3479)
!3484 = !DILocation(line: 612, column: 65, scope: !3479)
!3485 = !DILocation(line: 612, column: 59, scope: !3479)
!3486 = !DILocation(line: 612, column: 20, scope: !3479)
!3487 = !DILocation(line: 612, column: 32, scope: !3479)
!3488 = !DILocation(line: 612, column: 30, scope: !3479)
!3489 = !DILocation(line: 612, column: 35, scope: !3479)
!3490 = !DILocation(line: 612, column: 13, scope: !3479)
!3491 = !DILocation(line: 612, column: 41, scope: !3479)
!3492 = !DILocation(line: 609, column: 51, scope: !3474)
!3493 = !DILocation(line: 609, column: 9, scope: !3474)
!3494 = distinct !{!3494, !3466, !3495, !244}
!3495 = !DILocation(line: 613, column: 9, scope: !3467)
!3496 = !DILocation(line: 614, column: 30, scope: !3468)
!3497 = !DILocation(line: 614, column: 17, scope: !3468)
!3498 = !DILocation(line: 614, column: 14, scope: !3468)
!3499 = !DILocation(line: 615, column: 11, scope: !3468)
!3500 = !DILocation(line: 616, column: 9, scope: !3468)
!3501 = !DILocation(line: 616, column: 19, scope: !3468)
!3502 = !DILocation(line: 618, column: 9, scope: !3468)
!3503 = distinct !{!3503, !3460, !3504, !244}
!3504 = !DILocation(line: 619, column: 5, scope: !3452)
!3505 = !DILocation(line: 621, scope: !3470)
!3506 = !DILocation(line: 621, column: 19, scope: !3507)
!3507 = distinct !DILexicalBlock(scope: !3470, file: !71, line: 621, column: 5)
!3508 = !DILocation(line: 622, column: 50, scope: !3509)
!3509 = distinct !DILexicalBlock(scope: !3507, file: !71, line: 621, column: 32)
!3510 = !DILocation(line: 622, column: 40, scope: !3509)
!3511 = !DILocation(line: 622, column: 65, scope: !3509)
!3512 = !DILocation(line: 622, column: 77, scope: !3509)
!3513 = !DILocation(line: 622, column: 75, scope: !3509)
!3514 = !DILocation(line: 622, column: 61, scope: !3509)
!3515 = !DILocation(line: 622, column: 55, scope: !3509)
!3516 = !DILocation(line: 622, column: 16, scope: !3509)
!3517 = !DILocation(line: 622, column: 28, scope: !3509)
!3518 = !DILocation(line: 622, column: 26, scope: !3509)
!3519 = !DILocation(line: 622, column: 31, scope: !3509)
!3520 = !DILocation(line: 622, column: 9, scope: !3509)
!3521 = !DILocation(line: 622, column: 37, scope: !3509)
!3522 = !DILocation(line: 621, column: 28, scope: !3507)
!3523 = !DILocation(line: 621, column: 5, scope: !3507)
!3524 = distinct !{!3524, !3469, !3525, !244}
!3525 = !DILocation(line: 623, column: 5, scope: !3470)
!3526 = !DILocation(line: 624, column: 18, scope: !3452)
!3527 = !DILocation(line: 624, column: 5, scope: !3452)
!3528 = !DILocation(line: 624, column: 15, scope: !3452)
!3529 = !DILocation(line: 625, column: 1, scope: !3452)
!3530 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !71, file: !71, line: 236, type: !26, scopeLine: 236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3531 = !DILocalVariable(name: "state", arg: 1, scope: !3530, file: !71, line: 236, type: !5)
!3532 = !DILocation(line: 0, scope: !3530)
!3533 = !DILocation(line: 253, column: 11, scope: !3530)
!3534 = !DILocalVariable(name: "Aba", scope: !3530, file: !71, line: 239, type: !6)
!3535 = !DILocation(line: 254, column: 11, scope: !3530)
!3536 = !DILocalVariable(name: "Abe", scope: !3530, file: !71, line: 239, type: !6)
!3537 = !DILocation(line: 255, column: 11, scope: !3530)
!3538 = !DILocalVariable(name: "Abi", scope: !3530, file: !71, line: 239, type: !6)
!3539 = !DILocation(line: 256, column: 11, scope: !3530)
!3540 = !DILocalVariable(name: "Abo", scope: !3530, file: !71, line: 239, type: !6)
!3541 = !DILocation(line: 257, column: 11, scope: !3530)
!3542 = !DILocalVariable(name: "Abu", scope: !3530, file: !71, line: 239, type: !6)
!3543 = !DILocation(line: 258, column: 11, scope: !3530)
!3544 = !DILocalVariable(name: "Aga", scope: !3530, file: !71, line: 240, type: !6)
!3545 = !DILocation(line: 259, column: 11, scope: !3530)
!3546 = !DILocalVariable(name: "Age", scope: !3530, file: !71, line: 240, type: !6)
!3547 = !DILocation(line: 260, column: 11, scope: !3530)
!3548 = !DILocalVariable(name: "Agi", scope: !3530, file: !71, line: 240, type: !6)
!3549 = !DILocation(line: 261, column: 11, scope: !3530)
!3550 = !DILocalVariable(name: "Ago", scope: !3530, file: !71, line: 240, type: !6)
!3551 = !DILocation(line: 262, column: 11, scope: !3530)
!3552 = !DILocalVariable(name: "Agu", scope: !3530, file: !71, line: 240, type: !6)
!3553 = !DILocation(line: 263, column: 11, scope: !3530)
!3554 = !DILocalVariable(name: "Aka", scope: !3530, file: !71, line: 241, type: !6)
!3555 = !DILocation(line: 264, column: 11, scope: !3530)
!3556 = !DILocalVariable(name: "Ake", scope: !3530, file: !71, line: 241, type: !6)
!3557 = !DILocation(line: 265, column: 11, scope: !3530)
!3558 = !DILocalVariable(name: "Aki", scope: !3530, file: !71, line: 241, type: !6)
!3559 = !DILocation(line: 266, column: 11, scope: !3530)
!3560 = !DILocalVariable(name: "Ako", scope: !3530, file: !71, line: 241, type: !6)
!3561 = !DILocation(line: 267, column: 11, scope: !3530)
!3562 = !DILocalVariable(name: "Aku", scope: !3530, file: !71, line: 241, type: !6)
!3563 = !DILocation(line: 268, column: 11, scope: !3530)
!3564 = !DILocalVariable(name: "Ama", scope: !3530, file: !71, line: 242, type: !6)
!3565 = !DILocation(line: 269, column: 11, scope: !3530)
!3566 = !DILocalVariable(name: "Ame", scope: !3530, file: !71, line: 242, type: !6)
!3567 = !DILocation(line: 270, column: 11, scope: !3530)
!3568 = !DILocalVariable(name: "Ami", scope: !3530, file: !71, line: 242, type: !6)
!3569 = !DILocation(line: 271, column: 11, scope: !3530)
!3570 = !DILocalVariable(name: "Amo", scope: !3530, file: !71, line: 242, type: !6)
!3571 = !DILocation(line: 272, column: 11, scope: !3530)
!3572 = !DILocalVariable(name: "Amu", scope: !3530, file: !71, line: 242, type: !6)
!3573 = !DILocation(line: 273, column: 11, scope: !3530)
!3574 = !DILocalVariable(name: "Asa", scope: !3530, file: !71, line: 243, type: !6)
!3575 = !DILocation(line: 274, column: 11, scope: !3530)
!3576 = !DILocalVariable(name: "Ase", scope: !3530, file: !71, line: 243, type: !6)
!3577 = !DILocation(line: 275, column: 11, scope: !3530)
!3578 = !DILocalVariable(name: "Asi", scope: !3530, file: !71, line: 243, type: !6)
!3579 = !DILocation(line: 276, column: 11, scope: !3530)
!3580 = !DILocalVariable(name: "Aso", scope: !3530, file: !71, line: 243, type: !6)
!3581 = !DILocation(line: 277, column: 11, scope: !3530)
!3582 = !DILocalVariable(name: "Asu", scope: !3530, file: !71, line: 243, type: !6)
!3583 = !DILocalVariable(name: "round", scope: !3530, file: !71, line: 237, type: !45)
!3584 = !DILocation(line: 279, column: 10, scope: !3585)
!3585 = distinct !DILexicalBlock(scope: !3530, file: !71, line: 279, column: 5)
!3586 = !DILocation(line: 279, scope: !3585)
!3587 = !DILocation(line: 279, column: 27, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3585, file: !71, line: 279, column: 5)
!3589 = !DILocation(line: 279, column: 5, scope: !3585)
!3590 = !DILocalVariable(name: "BCa", scope: !3530, file: !71, line: 244, type: !6)
!3591 = !DILocalVariable(name: "BCe", scope: !3530, file: !71, line: 244, type: !6)
!3592 = !DILocalVariable(name: "BCi", scope: !3530, file: !71, line: 244, type: !6)
!3593 = !DILocalVariable(name: "BCo", scope: !3530, file: !71, line: 244, type: !6)
!3594 = !DILocalVariable(name: "BCu", scope: !3530, file: !71, line: 244, type: !6)
!3595 = !DILocalVariable(name: "Da", scope: !3530, file: !71, line: 245, type: !6)
!3596 = !DILocalVariable(name: "De", scope: !3530, file: !71, line: 245, type: !6)
!3597 = !DILocalVariable(name: "Di", scope: !3530, file: !71, line: 245, type: !6)
!3598 = !DILocalVariable(name: "Do", scope: !3530, file: !71, line: 245, type: !6)
!3599 = !DILocalVariable(name: "Du", scope: !3530, file: !71, line: 245, type: !6)
!3600 = !DILocalVariable(name: "Eba", scope: !3530, file: !71, line: 246, type: !6)
!3601 = !DILocalVariable(name: "Ebe", scope: !3530, file: !71, line: 246, type: !6)
!3602 = !DILocalVariable(name: "Ebi", scope: !3530, file: !71, line: 246, type: !6)
!3603 = !DILocalVariable(name: "Ebo", scope: !3530, file: !71, line: 246, type: !6)
!3604 = !DILocalVariable(name: "Ebu", scope: !3530, file: !71, line: 246, type: !6)
!3605 = !DILocalVariable(name: "Ega", scope: !3530, file: !71, line: 247, type: !6)
!3606 = !DILocalVariable(name: "Ege", scope: !3530, file: !71, line: 247, type: !6)
!3607 = !DILocalVariable(name: "Egi", scope: !3530, file: !71, line: 247, type: !6)
!3608 = !DILocalVariable(name: "Ego", scope: !3530, file: !71, line: 247, type: !6)
!3609 = !DILocalVariable(name: "Egu", scope: !3530, file: !71, line: 247, type: !6)
!3610 = !DILocalVariable(name: "Eka", scope: !3530, file: !71, line: 248, type: !6)
!3611 = !DILocalVariable(name: "Eke", scope: !3530, file: !71, line: 248, type: !6)
!3612 = !DILocalVariable(name: "Eki", scope: !3530, file: !71, line: 248, type: !6)
!3613 = !DILocalVariable(name: "Eko", scope: !3530, file: !71, line: 248, type: !6)
!3614 = !DILocalVariable(name: "Eku", scope: !3530, file: !71, line: 248, type: !6)
!3615 = !DILocalVariable(name: "Ema", scope: !3530, file: !71, line: 249, type: !6)
!3616 = !DILocalVariable(name: "Eme", scope: !3530, file: !71, line: 249, type: !6)
!3617 = !DILocalVariable(name: "Emi", scope: !3530, file: !71, line: 249, type: !6)
!3618 = !DILocalVariable(name: "Emo", scope: !3530, file: !71, line: 249, type: !6)
!3619 = !DILocalVariable(name: "Emu", scope: !3530, file: !71, line: 249, type: !6)
!3620 = !DILocalVariable(name: "Esa", scope: !3530, file: !71, line: 250, type: !6)
!3621 = !DILocalVariable(name: "Ese", scope: !3530, file: !71, line: 250, type: !6)
!3622 = !DILocalVariable(name: "Esi", scope: !3530, file: !71, line: 250, type: !6)
!3623 = !DILocalVariable(name: "Eso", scope: !3530, file: !71, line: 250, type: !6)
!3624 = !DILocalVariable(name: "Esu", scope: !3530, file: !71, line: 250, type: !6)
!3625 = !DILocation(line: 283, column: 19, scope: !3626)
!3626 = distinct !DILexicalBlock(scope: !3588, file: !71, line: 279, column: 50)
!3627 = !DILocation(line: 283, column: 25, scope: !3626)
!3628 = !DILocation(line: 283, column: 31, scope: !3626)
!3629 = !DILocation(line: 283, column: 37, scope: !3626)
!3630 = !DILocation(line: 285, column: 19, scope: !3626)
!3631 = !DILocation(line: 285, column: 25, scope: !3626)
!3632 = !DILocation(line: 285, column: 31, scope: !3626)
!3633 = !DILocation(line: 285, column: 37, scope: !3626)
!3634 = !DILocation(line: 291, column: 20, scope: !3626)
!3635 = !DILocation(line: 291, column: 18, scope: !3626)
!3636 = !DILocation(line: 361, column: 13, scope: !3626)
!3637 = !DILocation(line: 362, column: 15, scope: !3626)
!3638 = !DILocation(line: 282, column: 19, scope: !3626)
!3639 = !DILocation(line: 282, column: 25, scope: !3626)
!3640 = !DILocation(line: 282, column: 31, scope: !3626)
!3641 = !DILocation(line: 282, column: 37, scope: !3626)
!3642 = !DILocation(line: 288, column: 20, scope: !3626)
!3643 = !DILocation(line: 288, column: 18, scope: !3626)
!3644 = !DILocation(line: 365, column: 13, scope: !3626)
!3645 = !DILocation(line: 366, column: 15, scope: !3626)
!3646 = !DILocation(line: 284, column: 19, scope: !3626)
!3647 = !DILocation(line: 284, column: 25, scope: !3626)
!3648 = !DILocation(line: 284, column: 31, scope: !3626)
!3649 = !DILocation(line: 284, column: 37, scope: !3626)
!3650 = !DILocation(line: 281, column: 19, scope: !3626)
!3651 = !DILocation(line: 281, column: 25, scope: !3626)
!3652 = !DILocation(line: 281, column: 31, scope: !3626)
!3653 = !DILocation(line: 281, column: 37, scope: !3626)
!3654 = !DILocation(line: 292, column: 20, scope: !3626)
!3655 = !DILocation(line: 292, column: 18, scope: !3626)
!3656 = !DILocation(line: 363, column: 13, scope: !3626)
!3657 = !DILocation(line: 364, column: 15, scope: !3626)
!3658 = !DILocation(line: 370, column: 23, scope: !3626)
!3659 = !DILocation(line: 370, column: 29, scope: !3626)
!3660 = !DILocation(line: 370, column: 19, scope: !3626)
!3661 = !DILocation(line: 290, column: 20, scope: !3626)
!3662 = !DILocation(line: 290, column: 18, scope: !3626)
!3663 = !DILocation(line: 298, column: 13, scope: !3626)
!3664 = !DILocation(line: 299, column: 15, scope: !3626)
!3665 = !DILocation(line: 289, column: 20, scope: !3626)
!3666 = !DILocation(line: 289, column: 18, scope: !3626)
!3667 = !DILocation(line: 296, column: 13, scope: !3626)
!3668 = !DILocation(line: 297, column: 15, scope: !3626)
!3669 = !DILocation(line: 304, column: 23, scope: !3626)
!3670 = !DILocation(line: 304, column: 29, scope: !3626)
!3671 = !DILocation(line: 305, column: 16, scope: !3626)
!3672 = !DILocation(line: 305, column: 13, scope: !3626)
!3673 = !DILocation(line: 294, column: 13, scope: !3626)
!3674 = !DILocation(line: 311, column: 13, scope: !3626)
!3675 = !DILocation(line: 312, column: 15, scope: !3626)
!3676 = !DILocation(line: 315, column: 13, scope: !3626)
!3677 = !DILocation(line: 316, column: 15, scope: !3626)
!3678 = !DILocation(line: 313, column: 13, scope: !3626)
!3679 = !DILocation(line: 314, column: 15, scope: !3626)
!3680 = !DILocation(line: 321, column: 23, scope: !3626)
!3681 = !DILocation(line: 321, column: 29, scope: !3626)
!3682 = !DILocation(line: 321, column: 19, scope: !3626)
!3683 = !DILocation(line: 376, column: 19, scope: !3626)
!3684 = !DILocation(line: 327, column: 13, scope: !3626)
!3685 = !DILocation(line: 328, column: 15, scope: !3626)
!3686 = !DILocation(line: 331, column: 13, scope: !3626)
!3687 = !DILocation(line: 332, column: 15, scope: !3626)
!3688 = !DILocation(line: 329, column: 13, scope: !3626)
!3689 = !DILocation(line: 330, column: 15, scope: !3626)
!3690 = !DILocation(line: 337, column: 23, scope: !3626)
!3691 = !DILocation(line: 337, column: 29, scope: !3626)
!3692 = !DILocation(line: 337, column: 19, scope: !3626)
!3693 = !DILocation(line: 376, column: 25, scope: !3626)
!3694 = !DILocation(line: 343, column: 13, scope: !3626)
!3695 = !DILocation(line: 344, column: 15, scope: !3626)
!3696 = !DILocation(line: 347, column: 13, scope: !3626)
!3697 = !DILocation(line: 348, column: 15, scope: !3626)
!3698 = !DILocation(line: 345, column: 13, scope: !3626)
!3699 = !DILocation(line: 346, column: 15, scope: !3626)
!3700 = !DILocation(line: 353, column: 23, scope: !3626)
!3701 = !DILocation(line: 353, column: 29, scope: !3626)
!3702 = !DILocation(line: 353, column: 19, scope: !3626)
!3703 = !DILocation(line: 376, column: 31, scope: !3626)
!3704 = !DILocation(line: 359, column: 13, scope: !3626)
!3705 = !DILocation(line: 360, column: 15, scope: !3626)
!3706 = !DILocation(line: 369, column: 23, scope: !3626)
!3707 = !DILocation(line: 369, column: 29, scope: !3626)
!3708 = !DILocation(line: 369, column: 19, scope: !3626)
!3709 = !DILocation(line: 376, column: 37, scope: !3626)
!3710 = !DILocation(line: 302, column: 13, scope: !3626)
!3711 = !DILocation(line: 303, column: 15, scope: !3626)
!3712 = !DILocation(line: 300, column: 13, scope: !3626)
!3713 = !DILocation(line: 301, column: 15, scope: !3626)
!3714 = !DILocation(line: 307, column: 23, scope: !3626)
!3715 = !DILocation(line: 307, column: 29, scope: !3626)
!3716 = !DILocation(line: 307, column: 19, scope: !3626)
!3717 = !DILocation(line: 319, column: 13, scope: !3626)
!3718 = !DILocation(line: 320, column: 15, scope: !3626)
!3719 = !DILocation(line: 317, column: 13, scope: !3626)
!3720 = !DILocation(line: 318, column: 15, scope: !3626)
!3721 = !DILocation(line: 323, column: 23, scope: !3626)
!3722 = !DILocation(line: 323, column: 29, scope: !3626)
!3723 = !DILocation(line: 323, column: 19, scope: !3626)
!3724 = !DILocation(line: 378, column: 19, scope: !3626)
!3725 = !DILocation(line: 335, column: 13, scope: !3626)
!3726 = !DILocation(line: 336, column: 15, scope: !3626)
!3727 = !DILocation(line: 333, column: 13, scope: !3626)
!3728 = !DILocation(line: 334, column: 15, scope: !3626)
!3729 = !DILocation(line: 339, column: 23, scope: !3626)
!3730 = !DILocation(line: 339, column: 29, scope: !3626)
!3731 = !DILocation(line: 339, column: 19, scope: !3626)
!3732 = !DILocation(line: 378, column: 25, scope: !3626)
!3733 = !DILocation(line: 351, column: 13, scope: !3626)
!3734 = !DILocation(line: 352, column: 15, scope: !3626)
!3735 = !DILocation(line: 349, column: 13, scope: !3626)
!3736 = !DILocation(line: 350, column: 15, scope: !3626)
!3737 = !DILocation(line: 355, column: 23, scope: !3626)
!3738 = !DILocation(line: 355, column: 29, scope: !3626)
!3739 = !DILocation(line: 355, column: 19, scope: !3626)
!3740 = !DILocation(line: 378, column: 31, scope: !3626)
!3741 = !DILocation(line: 367, column: 13, scope: !3626)
!3742 = !DILocation(line: 368, column: 15, scope: !3626)
!3743 = !DILocation(line: 371, column: 23, scope: !3626)
!3744 = !DILocation(line: 371, column: 29, scope: !3626)
!3745 = !DILocation(line: 371, column: 19, scope: !3626)
!3746 = !DILocation(line: 378, column: 37, scope: !3626)
!3747 = !DILocation(line: 384, column: 20, scope: !3626)
!3748 = !DILocation(line: 384, column: 18, scope: !3626)
!3749 = !DILocation(line: 462, column: 13, scope: !3626)
!3750 = !DILocation(line: 463, column: 15, scope: !3626)
!3751 = !DILocation(line: 324, column: 23, scope: !3626)
!3752 = !DILocation(line: 324, column: 29, scope: !3626)
!3753 = !DILocation(line: 324, column: 19, scope: !3626)
!3754 = !DILocation(line: 309, column: 23, scope: !3626)
!3755 = !DILocation(line: 309, column: 29, scope: !3626)
!3756 = !DILocation(line: 309, column: 19, scope: !3626)
!3757 = !DILocation(line: 325, column: 23, scope: !3626)
!3758 = !DILocation(line: 325, column: 29, scope: !3626)
!3759 = !DILocation(line: 325, column: 19, scope: !3626)
!3760 = !DILocation(line: 380, column: 19, scope: !3626)
!3761 = !DILocation(line: 341, column: 23, scope: !3626)
!3762 = !DILocation(line: 341, column: 29, scope: !3626)
!3763 = !DILocation(line: 341, column: 19, scope: !3626)
!3764 = !DILocation(line: 380, column: 25, scope: !3626)
!3765 = !DILocation(line: 357, column: 23, scope: !3626)
!3766 = !DILocation(line: 357, column: 29, scope: !3626)
!3767 = !DILocation(line: 357, column: 19, scope: !3626)
!3768 = !DILocation(line: 380, column: 31, scope: !3626)
!3769 = !DILocation(line: 373, column: 23, scope: !3626)
!3770 = !DILocation(line: 373, column: 29, scope: !3626)
!3771 = !DILocation(line: 373, column: 19, scope: !3626)
!3772 = !DILocation(line: 380, column: 37, scope: !3626)
!3773 = !DILocation(line: 386, column: 20, scope: !3626)
!3774 = !DILocation(line: 386, column: 18, scope: !3626)
!3775 = !DILocation(line: 456, column: 13, scope: !3626)
!3776 = !DILocation(line: 457, column: 15, scope: !3626)
!3777 = !DILocation(line: 306, column: 23, scope: !3626)
!3778 = !DILocation(line: 306, column: 29, scope: !3626)
!3779 = !DILocation(line: 306, column: 19, scope: !3626)
!3780 = !DILocation(line: 322, column: 23, scope: !3626)
!3781 = !DILocation(line: 322, column: 29, scope: !3626)
!3782 = !DILocation(line: 322, column: 19, scope: !3626)
!3783 = !DILocation(line: 377, column: 19, scope: !3626)
!3784 = !DILocation(line: 338, column: 23, scope: !3626)
!3785 = !DILocation(line: 338, column: 29, scope: !3626)
!3786 = !DILocation(line: 338, column: 19, scope: !3626)
!3787 = !DILocation(line: 377, column: 25, scope: !3626)
!3788 = !DILocation(line: 354, column: 23, scope: !3626)
!3789 = !DILocation(line: 354, column: 29, scope: !3626)
!3790 = !DILocation(line: 354, column: 19, scope: !3626)
!3791 = !DILocation(line: 377, column: 31, scope: !3626)
!3792 = !DILocation(line: 377, column: 37, scope: !3626)
!3793 = !DILocation(line: 308, column: 23, scope: !3626)
!3794 = !DILocation(line: 308, column: 29, scope: !3626)
!3795 = !DILocation(line: 308, column: 19, scope: !3626)
!3796 = !DILocation(line: 379, column: 19, scope: !3626)
!3797 = !DILocation(line: 340, column: 23, scope: !3626)
!3798 = !DILocation(line: 340, column: 29, scope: !3626)
!3799 = !DILocation(line: 340, column: 19, scope: !3626)
!3800 = !DILocation(line: 379, column: 25, scope: !3626)
!3801 = !DILocation(line: 356, column: 23, scope: !3626)
!3802 = !DILocation(line: 356, column: 29, scope: !3626)
!3803 = !DILocation(line: 356, column: 19, scope: !3626)
!3804 = !DILocation(line: 379, column: 31, scope: !3626)
!3805 = !DILocation(line: 372, column: 23, scope: !3626)
!3806 = !DILocation(line: 372, column: 29, scope: !3626)
!3807 = !DILocation(line: 372, column: 19, scope: !3626)
!3808 = !DILocation(line: 379, column: 37, scope: !3626)
!3809 = !DILocation(line: 385, column: 20, scope: !3626)
!3810 = !DILocation(line: 385, column: 18, scope: !3626)
!3811 = !DILocation(line: 454, column: 13, scope: !3626)
!3812 = !DILocation(line: 455, column: 15, scope: !3626)
!3813 = !DILocation(line: 468, column: 23, scope: !3626)
!3814 = !DILocation(line: 468, column: 29, scope: !3626)
!3815 = !DILocation(line: 468, column: 19, scope: !3626)
!3816 = !DILocation(line: 383, column: 20, scope: !3626)
!3817 = !DILocation(line: 383, column: 18, scope: !3626)
!3818 = !DILocation(line: 460, column: 13, scope: !3626)
!3819 = !DILocation(line: 461, column: 15, scope: !3626)
!3820 = !DILocation(line: 467, column: 23, scope: !3626)
!3821 = !DILocation(line: 467, column: 29, scope: !3626)
!3822 = !DILocation(line: 467, column: 19, scope: !3626)
!3823 = !DILocation(line: 387, column: 20, scope: !3626)
!3824 = !DILocation(line: 387, column: 18, scope: !3626)
!3825 = !DILocation(line: 458, column: 13, scope: !3626)
!3826 = !DILocation(line: 459, column: 15, scope: !3626)
!3827 = !DILocation(line: 466, column: 23, scope: !3626)
!3828 = !DILocation(line: 466, column: 29, scope: !3626)
!3829 = !DILocation(line: 466, column: 19, scope: !3626)
!3830 = !DILocation(line: 465, column: 23, scope: !3626)
!3831 = !DILocation(line: 465, column: 29, scope: !3626)
!3832 = !DILocation(line: 465, column: 19, scope: !3626)
!3833 = !DILocation(line: 464, column: 23, scope: !3626)
!3834 = !DILocation(line: 464, column: 29, scope: !3626)
!3835 = !DILocation(line: 464, column: 19, scope: !3626)
!3836 = !DILocation(line: 446, column: 13, scope: !3626)
!3837 = !DILocation(line: 447, column: 15, scope: !3626)
!3838 = !DILocation(line: 440, column: 13, scope: !3626)
!3839 = !DILocation(line: 441, column: 15, scope: !3626)
!3840 = !DILocation(line: 438, column: 13, scope: !3626)
!3841 = !DILocation(line: 439, column: 15, scope: !3626)
!3842 = !DILocation(line: 452, column: 23, scope: !3626)
!3843 = !DILocation(line: 452, column: 29, scope: !3626)
!3844 = !DILocation(line: 452, column: 19, scope: !3626)
!3845 = !DILocation(line: 444, column: 13, scope: !3626)
!3846 = !DILocation(line: 445, column: 15, scope: !3626)
!3847 = !DILocation(line: 451, column: 23, scope: !3626)
!3848 = !DILocation(line: 451, column: 29, scope: !3626)
!3849 = !DILocation(line: 451, column: 19, scope: !3626)
!3850 = !DILocation(line: 442, column: 13, scope: !3626)
!3851 = !DILocation(line: 443, column: 15, scope: !3626)
!3852 = !DILocation(line: 450, column: 23, scope: !3626)
!3853 = !DILocation(line: 450, column: 29, scope: !3626)
!3854 = !DILocation(line: 450, column: 19, scope: !3626)
!3855 = !DILocation(line: 449, column: 23, scope: !3626)
!3856 = !DILocation(line: 449, column: 29, scope: !3626)
!3857 = !DILocation(line: 449, column: 19, scope: !3626)
!3858 = !DILocation(line: 448, column: 23, scope: !3626)
!3859 = !DILocation(line: 448, column: 29, scope: !3626)
!3860 = !DILocation(line: 448, column: 19, scope: !3626)
!3861 = !DILocation(line: 430, column: 13, scope: !3626)
!3862 = !DILocation(line: 431, column: 15, scope: !3626)
!3863 = !DILocation(line: 424, column: 13, scope: !3626)
!3864 = !DILocation(line: 425, column: 15, scope: !3626)
!3865 = !DILocation(line: 422, column: 13, scope: !3626)
!3866 = !DILocation(line: 423, column: 15, scope: !3626)
!3867 = !DILocation(line: 436, column: 23, scope: !3626)
!3868 = !DILocation(line: 436, column: 29, scope: !3626)
!3869 = !DILocation(line: 436, column: 19, scope: !3626)
!3870 = !DILocation(line: 428, column: 13, scope: !3626)
!3871 = !DILocation(line: 429, column: 15, scope: !3626)
!3872 = !DILocation(line: 435, column: 23, scope: !3626)
!3873 = !DILocation(line: 435, column: 29, scope: !3626)
!3874 = !DILocation(line: 435, column: 19, scope: !3626)
!3875 = !DILocation(line: 426, column: 13, scope: !3626)
!3876 = !DILocation(line: 427, column: 15, scope: !3626)
!3877 = !DILocation(line: 434, column: 23, scope: !3626)
!3878 = !DILocation(line: 434, column: 29, scope: !3626)
!3879 = !DILocation(line: 434, column: 19, scope: !3626)
!3880 = !DILocation(line: 433, column: 23, scope: !3626)
!3881 = !DILocation(line: 433, column: 29, scope: !3626)
!3882 = !DILocation(line: 433, column: 19, scope: !3626)
!3883 = !DILocation(line: 432, column: 23, scope: !3626)
!3884 = !DILocation(line: 432, column: 29, scope: !3626)
!3885 = !DILocation(line: 432, column: 19, scope: !3626)
!3886 = !DILocation(line: 414, column: 13, scope: !3626)
!3887 = !DILocation(line: 415, column: 15, scope: !3626)
!3888 = !DILocation(line: 408, column: 13, scope: !3626)
!3889 = !DILocation(line: 409, column: 15, scope: !3626)
!3890 = !DILocation(line: 406, column: 13, scope: !3626)
!3891 = !DILocation(line: 407, column: 15, scope: !3626)
!3892 = !DILocation(line: 420, column: 23, scope: !3626)
!3893 = !DILocation(line: 420, column: 29, scope: !3626)
!3894 = !DILocation(line: 420, column: 19, scope: !3626)
!3895 = !DILocation(line: 412, column: 13, scope: !3626)
!3896 = !DILocation(line: 413, column: 15, scope: !3626)
!3897 = !DILocation(line: 419, column: 23, scope: !3626)
!3898 = !DILocation(line: 419, column: 29, scope: !3626)
!3899 = !DILocation(line: 419, column: 19, scope: !3626)
!3900 = !DILocation(line: 410, column: 13, scope: !3626)
!3901 = !DILocation(line: 411, column: 15, scope: !3626)
!3902 = !DILocation(line: 418, column: 23, scope: !3626)
!3903 = !DILocation(line: 418, column: 29, scope: !3626)
!3904 = !DILocation(line: 418, column: 19, scope: !3626)
!3905 = !DILocation(line: 417, column: 23, scope: !3626)
!3906 = !DILocation(line: 417, column: 29, scope: !3626)
!3907 = !DILocation(line: 417, column: 19, scope: !3626)
!3908 = !DILocation(line: 416, column: 23, scope: !3626)
!3909 = !DILocation(line: 416, column: 29, scope: !3626)
!3910 = !DILocation(line: 416, column: 19, scope: !3626)
!3911 = !DILocation(line: 397, column: 13, scope: !3626)
!3912 = !DILocation(line: 398, column: 15, scope: !3626)
!3913 = !DILocation(line: 391, column: 13, scope: !3626)
!3914 = !DILocation(line: 392, column: 15, scope: !3626)
!3915 = !DILocation(line: 389, column: 13, scope: !3626)
!3916 = !DILocation(line: 404, column: 23, scope: !3626)
!3917 = !DILocation(line: 404, column: 29, scope: !3626)
!3918 = !DILocation(line: 404, column: 19, scope: !3626)
!3919 = !DILocation(line: 395, column: 13, scope: !3626)
!3920 = !DILocation(line: 396, column: 15, scope: !3626)
!3921 = !DILocation(line: 403, column: 23, scope: !3626)
!3922 = !DILocation(line: 403, column: 29, scope: !3626)
!3923 = !DILocation(line: 403, column: 19, scope: !3626)
!3924 = !DILocation(line: 393, column: 13, scope: !3626)
!3925 = !DILocation(line: 394, column: 15, scope: !3626)
!3926 = !DILocation(line: 402, column: 23, scope: !3626)
!3927 = !DILocation(line: 402, column: 29, scope: !3626)
!3928 = !DILocation(line: 402, column: 19, scope: !3626)
!3929 = !DILocation(line: 401, column: 23, scope: !3626)
!3930 = !DILocation(line: 401, column: 29, scope: !3626)
!3931 = !DILocation(line: 401, column: 19, scope: !3626)
!3932 = !DILocation(line: 400, column: 45, scope: !3626)
!3933 = !DILocation(line: 400, column: 16, scope: !3626)
!3934 = !DILocation(line: 399, column: 23, scope: !3626)
!3935 = !DILocation(line: 399, column: 29, scope: !3626)
!3936 = !DILocation(line: 400, column: 13, scope: !3626)
!3937 = !DILocation(line: 279, column: 44, scope: !3588)
!3938 = !DILocation(line: 279, column: 5, scope: !3588)
!3939 = distinct !{!3939, !3589, !3940, !244}
!3940 = !DILocation(line: 469, column: 5, scope: !3585)
!3941 = !DILocation(line: 472, column: 14, scope: !3530)
!3942 = !DILocation(line: 473, column: 5, scope: !3530)
!3943 = !DILocation(line: 473, column: 14, scope: !3530)
!3944 = !DILocation(line: 474, column: 5, scope: !3530)
!3945 = !DILocation(line: 474, column: 14, scope: !3530)
!3946 = !DILocation(line: 475, column: 5, scope: !3530)
!3947 = !DILocation(line: 475, column: 14, scope: !3530)
!3948 = !DILocation(line: 476, column: 5, scope: !3530)
!3949 = !DILocation(line: 476, column: 14, scope: !3530)
!3950 = !DILocation(line: 477, column: 5, scope: !3530)
!3951 = !DILocation(line: 477, column: 14, scope: !3530)
!3952 = !DILocation(line: 478, column: 5, scope: !3530)
!3953 = !DILocation(line: 478, column: 14, scope: !3530)
!3954 = !DILocation(line: 479, column: 5, scope: !3530)
!3955 = !DILocation(line: 479, column: 14, scope: !3530)
!3956 = !DILocation(line: 480, column: 5, scope: !3530)
!3957 = !DILocation(line: 480, column: 14, scope: !3530)
!3958 = !DILocation(line: 481, column: 5, scope: !3530)
!3959 = !DILocation(line: 481, column: 14, scope: !3530)
!3960 = !DILocation(line: 482, column: 5, scope: !3530)
!3961 = !DILocation(line: 482, column: 15, scope: !3530)
!3962 = !DILocation(line: 483, column: 5, scope: !3530)
!3963 = !DILocation(line: 483, column: 15, scope: !3530)
!3964 = !DILocation(line: 484, column: 5, scope: !3530)
!3965 = !DILocation(line: 484, column: 15, scope: !3530)
!3966 = !DILocation(line: 485, column: 5, scope: !3530)
!3967 = !DILocation(line: 485, column: 15, scope: !3530)
!3968 = !DILocation(line: 486, column: 5, scope: !3530)
!3969 = !DILocation(line: 486, column: 15, scope: !3530)
!3970 = !DILocation(line: 487, column: 5, scope: !3530)
!3971 = !DILocation(line: 487, column: 15, scope: !3530)
!3972 = !DILocation(line: 488, column: 5, scope: !3530)
!3973 = !DILocation(line: 488, column: 15, scope: !3530)
!3974 = !DILocation(line: 489, column: 5, scope: !3530)
!3975 = !DILocation(line: 489, column: 15, scope: !3530)
!3976 = !DILocation(line: 490, column: 5, scope: !3530)
!3977 = !DILocation(line: 490, column: 15, scope: !3530)
!3978 = !DILocation(line: 491, column: 5, scope: !3530)
!3979 = !DILocation(line: 491, column: 15, scope: !3530)
!3980 = !DILocation(line: 492, column: 5, scope: !3530)
!3981 = !DILocation(line: 492, column: 15, scope: !3530)
!3982 = !DILocation(line: 493, column: 5, scope: !3530)
!3983 = !DILocation(line: 493, column: 15, scope: !3530)
!3984 = !DILocation(line: 494, column: 5, scope: !3530)
!3985 = !DILocation(line: 494, column: 15, scope: !3530)
!3986 = !DILocation(line: 495, column: 5, scope: !3530)
!3987 = !DILocation(line: 495, column: 15, scope: !3530)
!3988 = !DILocation(line: 496, column: 5, scope: !3530)
!3989 = !DILocation(line: 496, column: 15, scope: !3530)
!3990 = !DILocation(line: 497, column: 1, scope: !3530)
!3991 = distinct !DISubprogram(name: "shake128_inc_finalize", scope: !71, file: !71, line: 700, type: !3403, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3992 = !DILocalVariable(name: "state", arg: 1, scope: !3991, file: !71, line: 700, type: !3405)
!3993 = !DILocation(line: 0, scope: !3991)
!3994 = !DILocation(line: 701, column: 32, scope: !3991)
!3995 = !DILocation(line: 701, column: 5, scope: !3991)
!3996 = !DILocation(line: 702, column: 1, scope: !3991)
!3997 = distinct !DISubprogram(name: "keccak_inc_finalize", scope: !71, file: !71, line: 640, type: !3998, scopeLine: 640, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!3998 = !DISubroutineType(types: !3999)
!3999 = !{null, !5, !19, !12}
!4000 = !DILocalVariable(name: "s_inc", arg: 1, scope: !3997, file: !71, line: 640, type: !5)
!4001 = !DILocation(line: 0, scope: !3997)
!4002 = !DILocalVariable(name: "r", arg: 2, scope: !3997, file: !71, line: 640, type: !19)
!4003 = !DILocalVariable(name: "p", arg: 3, scope: !3997, file: !71, line: 640, type: !12)
!4004 = !DILocation(line: 643, column: 30, scope: !3997)
!4005 = !DILocation(line: 643, column: 51, scope: !3997)
!4006 = !DILocation(line: 643, column: 48, scope: !3997)
!4007 = !DILocation(line: 643, column: 42, scope: !3997)
!4008 = !DILocation(line: 643, column: 21, scope: !3997)
!4009 = !DILocation(line: 643, column: 5, scope: !3997)
!4010 = !DILocation(line: 643, column: 27, scope: !3997)
!4011 = !DILocation(line: 644, column: 48, scope: !3997)
!4012 = !DILocation(line: 644, column: 42, scope: !3997)
!4013 = !DILocation(line: 644, column: 14, scope: !3997)
!4014 = !DILocation(line: 644, column: 19, scope: !3997)
!4015 = !DILocation(line: 644, column: 5, scope: !3997)
!4016 = !DILocation(line: 644, column: 25, scope: !3997)
!4017 = !DILocation(line: 645, column: 5, scope: !3997)
!4018 = !DILocation(line: 645, column: 15, scope: !3997)
!4019 = !DILocation(line: 646, column: 1, scope: !3997)
!4020 = distinct !DISubprogram(name: "shake128_inc_squeeze", scope: !71, file: !71, line: 704, type: !4021, scopeLine: 704, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4021 = !DISubroutineType(types: !4022)
!4022 = !{null, !11, !15, !3405}
!4023 = !DILocalVariable(name: "output", arg: 1, scope: !4020, file: !71, line: 704, type: !11)
!4024 = !DILocation(line: 0, scope: !4020)
!4025 = !DILocalVariable(name: "outlen", arg: 2, scope: !4020, file: !71, line: 704, type: !15)
!4026 = !DILocalVariable(name: "state", arg: 3, scope: !4020, file: !71, line: 704, type: !3405)
!4027 = !DILocation(line: 705, column: 47, scope: !4020)
!4028 = !DILocation(line: 705, column: 5, scope: !4020)
!4029 = !DILocation(line: 706, column: 1, scope: !4020)
!4030 = distinct !DISubprogram(name: "keccak_inc_squeeze", scope: !71, file: !71, line: 661, type: !4031, scopeLine: 662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4031 = !DISubroutineType(types: !4032)
!4032 = !{null, !11, !15, !5, !19}
!4033 = !DILocalVariable(name: "h", arg: 1, scope: !4030, file: !71, line: 661, type: !11)
!4034 = !DILocation(line: 0, scope: !4030)
!4035 = !DILocalVariable(name: "outlen", arg: 2, scope: !4030, file: !71, line: 661, type: !15)
!4036 = !DILocalVariable(name: "s_inc", arg: 3, scope: !4030, file: !71, line: 662, type: !5)
!4037 = !DILocalVariable(name: "r", arg: 4, scope: !4030, file: !71, line: 662, type: !19)
!4038 = !DILocalVariable(name: "i", scope: !4030, file: !71, line: 663, type: !15)
!4039 = !DILocation(line: 666, column: 10, scope: !4040)
!4040 = distinct !DILexicalBlock(scope: !4030, file: !71, line: 666, column: 5)
!4041 = !DILocation(line: 666, scope: !4040)
!4042 = !DILocation(line: 666, column: 19, scope: !4043)
!4043 = distinct !DILexicalBlock(scope: !4040, file: !71, line: 666, column: 5)
!4044 = !DILocation(line: 666, column: 28, scope: !4043)
!4045 = !DILocation(line: 666, column: 31, scope: !4043)
!4046 = !DILocation(line: 666, column: 35, scope: !4043)
!4047 = !DILocation(line: 666, column: 33, scope: !4043)
!4048 = !DILocation(line: 666, column: 5, scope: !4040)
!4049 = !DILocation(line: 669, column: 33, scope: !4050)
!4050 = distinct !DILexicalBlock(scope: !4043, file: !71, line: 666, column: 51)
!4051 = !DILocation(line: 669, column: 37, scope: !4050)
!4052 = !DILocation(line: 669, column: 35, scope: !4050)
!4053 = !DILocation(line: 669, column: 49, scope: !4050)
!4054 = !DILocation(line: 669, column: 47, scope: !4050)
!4055 = !DILocation(line: 669, column: 52, scope: !4050)
!4056 = !DILocation(line: 669, column: 26, scope: !4050)
!4057 = !DILocation(line: 669, column: 68, scope: !4050)
!4058 = !DILocation(line: 669, column: 72, scope: !4050)
!4059 = !DILocation(line: 669, column: 70, scope: !4050)
!4060 = !DILocation(line: 669, column: 84, scope: !4050)
!4061 = !DILocation(line: 669, column: 82, scope: !4050)
!4062 = !DILocation(line: 669, column: 64, scope: !4050)
!4063 = !DILocation(line: 669, column: 58, scope: !4050)
!4064 = !DILocation(line: 669, column: 16, scope: !4050)
!4065 = !DILocation(line: 669, column: 9, scope: !4050)
!4066 = !DILocation(line: 669, column: 14, scope: !4050)
!4067 = !DILocation(line: 666, column: 47, scope: !4043)
!4068 = !DILocation(line: 666, column: 5, scope: !4043)
!4069 = distinct !{!4069, !4048, !4070, !244}
!4070 = !DILocation(line: 670, column: 5, scope: !4040)
!4071 = !DILocation(line: 671, column: 7, scope: !4030)
!4072 = !DILocation(line: 672, column: 12, scope: !4030)
!4073 = !DILocation(line: 673, column: 18, scope: !4030)
!4074 = !DILocation(line: 673, column: 5, scope: !4030)
!4075 = !DILocation(line: 673, column: 15, scope: !4030)
!4076 = !DILocation(line: 676, column: 5, scope: !4030)
!4077 = !DILocation(line: 676, column: 19, scope: !4030)
!4078 = !DILocation(line: 677, column: 9, scope: !4079)
!4079 = distinct !DILexicalBlock(scope: !4030, file: !71, line: 676, column: 24)
!4080 = !DILocation(line: 679, column: 14, scope: !4081)
!4081 = distinct !DILexicalBlock(scope: !4079, file: !71, line: 679, column: 9)
!4082 = !DILocation(line: 679, scope: !4081)
!4083 = !DILocation(line: 679, column: 32, scope: !4084)
!4084 = distinct !DILexicalBlock(scope: !4081, file: !71, line: 679, column: 9)
!4085 = !DILocation(line: 679, column: 9, scope: !4081)
!4086 = !DILocation(line: 680, column: 38, scope: !4087)
!4087 = distinct !DILexicalBlock(scope: !4084, file: !71, line: 679, column: 47)
!4088 = !DILocation(line: 680, column: 30, scope: !4087)
!4089 = !DILocation(line: 680, column: 50, scope: !4087)
!4090 = !DILocation(line: 680, column: 44, scope: !4087)
!4091 = !DILocation(line: 680, column: 20, scope: !4087)
!4092 = !DILocation(line: 680, column: 13, scope: !4087)
!4093 = !DILocation(line: 680, column: 18, scope: !4087)
!4094 = !DILocation(line: 679, column: 43, scope: !4084)
!4095 = !DILocation(line: 679, column: 9, scope: !4084)
!4096 = distinct !{!4096, !4085, !4097, !244}
!4097 = !DILocation(line: 681, column: 9, scope: !4081)
!4098 = !DILocation(line: 682, column: 11, scope: !4079)
!4099 = !DILocation(line: 683, column: 16, scope: !4079)
!4100 = !DILocation(line: 684, column: 23, scope: !4079)
!4101 = !DILocation(line: 684, column: 21, scope: !4079)
!4102 = !DILocation(line: 684, column: 9, scope: !4079)
!4103 = !DILocation(line: 684, column: 19, scope: !4079)
!4104 = distinct !{!4104, !4076, !4105, !244}
!4105 = !DILocation(line: 685, column: 5, scope: !4030)
!4106 = !DILocation(line: 686, column: 1, scope: !4030)
!4107 = distinct !DISubprogram(name: "shake128_inc_ctx_clone", scope: !71, file: !71, line: 708, type: !4108, scopeLine: 708, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4108 = !DISubroutineType(types: !4109)
!4109 = !{null, !3405, !4110}
!4110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4111, size: 32)
!4111 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3406)
!4112 = !DILocalVariable(name: "dest", arg: 1, scope: !4107, file: !71, line: 708, type: !3405)
!4113 = !DILocation(line: 0, scope: !4107)
!4114 = !DILocalVariable(name: "src", arg: 2, scope: !4107, file: !71, line: 708, type: !4110)
!4115 = !DILocation(line: 709, column: 17, scope: !4107)
!4116 = !DILocation(line: 709, column: 15, scope: !4107)
!4117 = !DILocation(line: 710, column: 19, scope: !4118)
!4118 = distinct !DILexicalBlock(scope: !4107, file: !71, line: 710, column: 9)
!4119 = !DILocation(line: 711, column: 9, scope: !4120)
!4120 = distinct !DILexicalBlock(scope: !4118, file: !71, line: 710, column: 28)
!4121 = !DILocation(line: 712, column: 5, scope: !4120)
!4122 = !DILocation(line: 713, column: 18, scope: !4107)
!4123 = !DILocation(line: 713, column: 28, scope: !4107)
!4124 = !DILocation(line: 713, column: 5, scope: !4107)
!4125 = !DILocation(line: 714, column: 1, scope: !4107)
!4126 = distinct !DISubprogram(name: "shake128_inc_ctx_release", scope: !71, file: !71, line: 716, type: !3403, scopeLine: 716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4127 = !DILocalVariable(name: "state", arg: 1, scope: !4126, file: !71, line: 716, type: !3405)
!4128 = !DILocation(line: 0, scope: !4126)
!4129 = !DILocation(line: 717, column: 17, scope: !4126)
!4130 = !DILocation(line: 717, column: 5, scope: !4126)
!4131 = !DILocation(line: 718, column: 1, scope: !4126)
!4132 = distinct !DISubprogram(name: "shake256_inc_init", scope: !71, file: !71, line: 720, type: !4133, scopeLine: 720, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4133 = !DISubroutineType(types: !4134)
!4134 = !{null, !4135}
!4135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4136, size: 32)
!4136 = !DIDerivedType(tag: DW_TAG_typedef, name: "shake256incctx", file: !71, line: 41, baseType: !4137)
!4137 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 39, size: 32, elements: !4138)
!4138 = !{!4139}
!4139 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4137, file: !71, line: 40, baseType: !5, size: 32)
!4140 = !DILocalVariable(name: "state", arg: 1, scope: !4132, file: !71, line: 720, type: !4135)
!4141 = !DILocation(line: 0, scope: !4132)
!4142 = !DILocation(line: 721, column: 18, scope: !4132)
!4143 = !DILocation(line: 721, column: 16, scope: !4132)
!4144 = !DILocation(line: 722, column: 20, scope: !4145)
!4145 = distinct !DILexicalBlock(scope: !4132, file: !71, line: 722, column: 9)
!4146 = !DILocation(line: 723, column: 9, scope: !4147)
!4147 = distinct !DILexicalBlock(scope: !4145, file: !71, line: 722, column: 29)
!4148 = !DILocation(line: 724, column: 5, scope: !4147)
!4149 = !DILocation(line: 725, column: 28, scope: !4132)
!4150 = !DILocation(line: 725, column: 5, scope: !4132)
!4151 = !DILocation(line: 726, column: 1, scope: !4132)
!4152 = distinct !DISubprogram(name: "shake256_inc_absorb", scope: !71, file: !71, line: 728, type: !4153, scopeLine: 728, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4153 = !DISubroutineType(types: !4154)
!4154 = !{null, !4135, !257, !15}
!4155 = !DILocalVariable(name: "state", arg: 1, scope: !4152, file: !71, line: 728, type: !4135)
!4156 = !DILocation(line: 0, scope: !4152)
!4157 = !DILocalVariable(name: "input", arg: 2, scope: !4152, file: !71, line: 728, type: !257)
!4158 = !DILocalVariable(name: "inlen", arg: 3, scope: !4152, file: !71, line: 728, type: !15)
!4159 = !DILocation(line: 729, column: 30, scope: !4152)
!4160 = !DILocation(line: 729, column: 5, scope: !4152)
!4161 = !DILocation(line: 730, column: 1, scope: !4152)
!4162 = distinct !DISubprogram(name: "shake256_inc_finalize", scope: !71, file: !71, line: 732, type: !4133, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4163 = !DILocalVariable(name: "state", arg: 1, scope: !4162, file: !71, line: 732, type: !4135)
!4164 = !DILocation(line: 0, scope: !4162)
!4165 = !DILocation(line: 733, column: 32, scope: !4162)
!4166 = !DILocation(line: 733, column: 5, scope: !4162)
!4167 = !DILocation(line: 734, column: 1, scope: !4162)
!4168 = distinct !DISubprogram(name: "shake256_inc_squeeze", scope: !71, file: !71, line: 736, type: !4169, scopeLine: 736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4169 = !DISubroutineType(types: !4170)
!4170 = !{null, !11, !15, !4135}
!4171 = !DILocalVariable(name: "output", arg: 1, scope: !4168, file: !71, line: 736, type: !11)
!4172 = !DILocation(line: 0, scope: !4168)
!4173 = !DILocalVariable(name: "outlen", arg: 2, scope: !4168, file: !71, line: 736, type: !15)
!4174 = !DILocalVariable(name: "state", arg: 3, scope: !4168, file: !71, line: 736, type: !4135)
!4175 = !DILocation(line: 737, column: 47, scope: !4168)
!4176 = !DILocation(line: 737, column: 5, scope: !4168)
!4177 = !DILocation(line: 738, column: 1, scope: !4168)
!4178 = distinct !DISubprogram(name: "shake256_inc_ctx_clone", scope: !71, file: !71, line: 740, type: !4179, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4179 = !DISubroutineType(types: !4180)
!4180 = !{null, !4135, !4181}
!4181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4182, size: 32)
!4182 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4136)
!4183 = !DILocalVariable(name: "dest", arg: 1, scope: !4178, file: !71, line: 740, type: !4135)
!4184 = !DILocation(line: 0, scope: !4178)
!4185 = !DILocalVariable(name: "src", arg: 2, scope: !4178, file: !71, line: 740, type: !4181)
!4186 = !DILocation(line: 741, column: 17, scope: !4178)
!4187 = !DILocation(line: 741, column: 15, scope: !4178)
!4188 = !DILocation(line: 742, column: 19, scope: !4189)
!4189 = distinct !DILexicalBlock(scope: !4178, file: !71, line: 742, column: 9)
!4190 = !DILocation(line: 743, column: 9, scope: !4191)
!4191 = distinct !DILexicalBlock(scope: !4189, file: !71, line: 742, column: 28)
!4192 = !DILocation(line: 744, column: 5, scope: !4191)
!4193 = !DILocation(line: 745, column: 18, scope: !4178)
!4194 = !DILocation(line: 745, column: 28, scope: !4178)
!4195 = !DILocation(line: 745, column: 5, scope: !4178)
!4196 = !DILocation(line: 746, column: 1, scope: !4178)
!4197 = distinct !DISubprogram(name: "shake256_inc_ctx_release", scope: !71, file: !71, line: 748, type: !4133, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4198 = !DILocalVariable(name: "state", arg: 1, scope: !4197, file: !71, line: 748, type: !4135)
!4199 = !DILocation(line: 0, scope: !4197)
!4200 = !DILocation(line: 749, column: 17, scope: !4197)
!4201 = !DILocation(line: 749, column: 5, scope: !4197)
!4202 = !DILocation(line: 750, column: 1, scope: !4197)
!4203 = distinct !DISubprogram(name: "shake128_absorb", scope: !71, file: !71, line: 764, type: !4204, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4204 = !DISubroutineType(types: !4205)
!4205 = !{null, !4206, !257, !15}
!4206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4207, size: 32)
!4207 = !DIDerivedType(tag: DW_TAG_typedef, name: "shake128ctx", file: !71, line: 36, baseType: !4208)
!4208 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 34, size: 32, elements: !4209)
!4209 = !{!4210}
!4210 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4208, file: !71, line: 35, baseType: !5, size: 32)
!4211 = !DILocalVariable(name: "state", arg: 1, scope: !4203, file: !71, line: 764, type: !4206)
!4212 = !DILocation(line: 0, scope: !4203)
!4213 = !DILocalVariable(name: "input", arg: 2, scope: !4203, file: !71, line: 764, type: !257)
!4214 = !DILocalVariable(name: "inlen", arg: 3, scope: !4203, file: !71, line: 764, type: !15)
!4215 = !DILocation(line: 765, column: 18, scope: !4203)
!4216 = !DILocation(line: 765, column: 16, scope: !4203)
!4217 = !DILocation(line: 766, column: 20, scope: !4218)
!4218 = distinct !DILexicalBlock(scope: !4203, file: !71, line: 766, column: 9)
!4219 = !DILocation(line: 767, column: 9, scope: !4220)
!4220 = distinct !DILexicalBlock(scope: !4218, file: !71, line: 766, column: 29)
!4221 = !DILocation(line: 768, column: 5, scope: !4220)
!4222 = !DILocation(line: 769, column: 26, scope: !4203)
!4223 = !DILocation(line: 769, column: 5, scope: !4203)
!4224 = !DILocation(line: 770, column: 1, scope: !4203)
!4225 = distinct !DISubprogram(name: "keccak_absorb", scope: !71, file: !71, line: 512, type: !4226, scopeLine: 513, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4226 = !DISubroutineType(types: !4227)
!4227 = !{null, !5, !19, !257, !15, !12}
!4228 = !DILocalVariable(name: "s", arg: 1, scope: !4225, file: !71, line: 512, type: !5)
!4229 = !DILocation(line: 0, scope: !4225)
!4230 = !DILocalVariable(name: "r", arg: 2, scope: !4225, file: !71, line: 512, type: !19)
!4231 = !DILocalVariable(name: "m", arg: 3, scope: !4225, file: !71, line: 512, type: !257)
!4232 = !DILocalVariable(name: "mlen", arg: 4, scope: !4225, file: !71, line: 513, type: !15)
!4233 = !DILocalVariable(name: "p", arg: 5, scope: !4225, file: !71, line: 513, type: !12)
!4234 = !DILocalVariable(name: "t", scope: !4225, file: !71, line: 515, type: !4235)
!4235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !4236)
!4236 = !{!4237}
!4237 = !DISubrange(count: 200)
!4238 = !DILocation(line: 515, column: 13, scope: !4225)
!4239 = !DILocalVariable(name: "i", scope: !4225, file: !71, line: 514, type: !15)
!4240 = !DILocation(line: 518, column: 10, scope: !4241)
!4241 = distinct !DILexicalBlock(scope: !4225, file: !71, line: 518, column: 5)
!4242 = !DILocation(line: 518, scope: !4241)
!4243 = !DILocation(line: 518, column: 19, scope: !4244)
!4244 = distinct !DILexicalBlock(scope: !4241, file: !71, line: 518, column: 5)
!4245 = !DILocation(line: 518, column: 5, scope: !4241)
!4246 = !DILocation(line: 522, column: 5, scope: !4225)
!4247 = !DILocation(line: 519, column: 9, scope: !4248)
!4248 = distinct !DILexicalBlock(scope: !4244, file: !71, line: 518, column: 30)
!4249 = !DILocation(line: 519, column: 14, scope: !4248)
!4250 = !DILocation(line: 518, column: 25, scope: !4244)
!4251 = !DILocation(line: 518, column: 5, scope: !4244)
!4252 = distinct !{!4252, !4245, !4253, !244}
!4253 = !DILocation(line: 520, column: 5, scope: !4241)
!4254 = !DILocation(line: 522, column: 17, scope: !4225)
!4255 = !DILocation(line: 523, column: 9, scope: !4256)
!4256 = distinct !DILexicalBlock(scope: !4257, file: !71, line: 523, column: 9)
!4257 = distinct !DILexicalBlock(scope: !4225, file: !71, line: 522, column: 23)
!4258 = !DILocation(line: 532, column: 5, scope: !4259)
!4259 = distinct !DILexicalBlock(scope: !4225, file: !71, line: 532, column: 5)
!4260 = !DILocation(line: 523, scope: !4256)
!4261 = !DILocation(line: 523, column: 23, scope: !4262)
!4262 = distinct !DILexicalBlock(scope: !4256, file: !71, line: 523, column: 9)
!4263 = !DILocation(line: 524, column: 34, scope: !4264)
!4264 = distinct !DILexicalBlock(scope: !4262, file: !71, line: 523, column: 37)
!4265 = !DILocation(line: 524, column: 30, scope: !4264)
!4266 = !DILocation(line: 524, column: 21, scope: !4264)
!4267 = !DILocation(line: 524, column: 13, scope: !4264)
!4268 = !DILocation(line: 524, column: 18, scope: !4264)
!4269 = !DILocation(line: 523, column: 32, scope: !4262)
!4270 = !DILocation(line: 523, column: 9, scope: !4262)
!4271 = distinct !{!4271, !4255, !4272, !244}
!4272 = !DILocation(line: 525, column: 9, scope: !4256)
!4273 = !DILocation(line: 527, column: 9, scope: !4257)
!4274 = !DILocation(line: 528, column: 14, scope: !4257)
!4275 = !DILocation(line: 529, column: 11, scope: !4257)
!4276 = distinct !{!4276, !4246, !4277, !244}
!4277 = !DILocation(line: 530, column: 5, scope: !4225)
!4278 = !DILocation(line: 532, scope: !4259)
!4279 = !DILocation(line: 532, column: 19, scope: !4280)
!4280 = distinct !DILexicalBlock(scope: !4259, file: !71, line: 532, column: 5)
!4281 = !DILocation(line: 535, column: 5, scope: !4282)
!4282 = distinct !DILexicalBlock(scope: !4225, file: !71, line: 535, column: 5)
!4283 = !DILocation(line: 533, column: 9, scope: !4284)
!4284 = distinct !DILexicalBlock(scope: !4280, file: !71, line: 532, column: 29)
!4285 = !DILocation(line: 533, column: 14, scope: !4284)
!4286 = !DILocation(line: 532, column: 24, scope: !4280)
!4287 = !DILocation(line: 532, column: 5, scope: !4280)
!4288 = distinct !{!4288, !4258, !4289, !244}
!4289 = !DILocation(line: 534, column: 5, scope: !4259)
!4290 = !DILocation(line: 535, scope: !4282)
!4291 = !DILocation(line: 535, column: 19, scope: !4292)
!4292 = distinct !DILexicalBlock(scope: !4282, file: !71, line: 535, column: 5)
!4293 = !DILocation(line: 536, column: 16, scope: !4294)
!4294 = distinct !DILexicalBlock(scope: !4292, file: !71, line: 535, column: 32)
!4295 = !DILocation(line: 536, column: 9, scope: !4294)
!4296 = !DILocation(line: 536, column: 14, scope: !4294)
!4297 = !DILocation(line: 535, column: 27, scope: !4292)
!4298 = !DILocation(line: 535, column: 5, scope: !4292)
!4299 = distinct !{!4299, !4281, !4300, !244}
!4300 = !DILocation(line: 537, column: 5, scope: !4282)
!4301 = !DILocation(line: 538, column: 5, scope: !4225)
!4302 = !DILocation(line: 538, column: 10, scope: !4225)
!4303 = !DILocation(line: 539, column: 9, scope: !4225)
!4304 = !DILocation(line: 539, column: 5, scope: !4225)
!4305 = !DILocation(line: 539, column: 14, scope: !4225)
!4306 = !DILocation(line: 540, column: 10, scope: !4307)
!4307 = distinct !DILexicalBlock(scope: !4225, file: !71, line: 540, column: 5)
!4308 = !DILocation(line: 540, scope: !4307)
!4309 = !DILocation(line: 540, column: 19, scope: !4310)
!4310 = distinct !DILexicalBlock(scope: !4307, file: !71, line: 540, column: 5)
!4311 = !DILocation(line: 540, column: 5, scope: !4307)
!4312 = !DILocation(line: 541, column: 30, scope: !4313)
!4313 = distinct !DILexicalBlock(scope: !4310, file: !71, line: 540, column: 33)
!4314 = !DILocation(line: 541, column: 26, scope: !4313)
!4315 = !DILocation(line: 541, column: 17, scope: !4313)
!4316 = !DILocation(line: 541, column: 9, scope: !4313)
!4317 = !DILocation(line: 541, column: 14, scope: !4313)
!4318 = !DILocation(line: 540, column: 28, scope: !4310)
!4319 = !DILocation(line: 540, column: 5, scope: !4310)
!4320 = distinct !{!4320, !4311, !4321, !244}
!4321 = !DILocation(line: 542, column: 5, scope: !4307)
!4322 = !DILocation(line: 543, column: 1, scope: !4225)
!4323 = distinct !DISubprogram(name: "load64", scope: !71, file: !71, line: 190, type: !4324, scopeLine: 190, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4324 = !DISubroutineType(types: !4325)
!4325 = !{!6, !257}
!4326 = !DILocalVariable(name: "x", arg: 1, scope: !4323, file: !71, line: 190, type: !257)
!4327 = !DILocation(line: 0, scope: !4323)
!4328 = !DILocalVariable(name: "r", scope: !4323, file: !71, line: 191, type: !6)
!4329 = !DILocalVariable(name: "i", scope: !4330, file: !71, line: 192, type: !15)
!4330 = distinct !DILexicalBlock(scope: !4323, file: !71, line: 192, column: 5)
!4331 = !DILocation(line: 0, scope: !4330)
!4332 = !DILocation(line: 192, column: 10, scope: !4330)
!4333 = !DILocation(line: 192, scope: !4330)
!4334 = !DILocation(line: 192, column: 26, scope: !4335)
!4335 = distinct !DILexicalBlock(scope: !4330, file: !71, line: 192, column: 5)
!4336 = !DILocation(line: 192, column: 5, scope: !4330)
!4337 = !DILocation(line: 193, column: 24, scope: !4338)
!4338 = distinct !DILexicalBlock(scope: !4335, file: !71, line: 192, column: 36)
!4339 = !DILocation(line: 193, column: 14, scope: !4338)
!4340 = !DILocation(line: 193, column: 34, scope: !4338)
!4341 = !DILocation(line: 193, column: 29, scope: !4338)
!4342 = !DILocation(line: 193, column: 11, scope: !4338)
!4343 = !DILocation(line: 192, column: 31, scope: !4335)
!4344 = !DILocation(line: 192, column: 5, scope: !4335)
!4345 = distinct !{!4345, !4336, !4346, !244}
!4346 = !DILocation(line: 194, column: 5, scope: !4330)
!4347 = !DILocation(line: 196, column: 5, scope: !4323)
!4348 = distinct !DISubprogram(name: "shake128_squeezeblocks", scope: !71, file: !71, line: 784, type: !4349, scopeLine: 784, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4349 = !DISubroutineType(types: !4350)
!4350 = !{null, !11, !15, !4206}
!4351 = !DILocalVariable(name: "output", arg: 1, scope: !4348, file: !71, line: 784, type: !11)
!4352 = !DILocation(line: 0, scope: !4348)
!4353 = !DILocalVariable(name: "nblocks", arg: 2, scope: !4348, file: !71, line: 784, type: !15)
!4354 = !DILocalVariable(name: "state", arg: 3, scope: !4348, file: !71, line: 784, type: !4206)
!4355 = !DILocation(line: 785, column: 50, scope: !4348)
!4356 = !DILocation(line: 785, column: 5, scope: !4348)
!4357 = !DILocation(line: 786, column: 1, scope: !4348)
!4358 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !71, file: !71, line: 558, type: !4031, scopeLine: 559, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4359 = !DILocalVariable(name: "h", arg: 1, scope: !4358, file: !71, line: 558, type: !11)
!4360 = !DILocation(line: 0, scope: !4358)
!4361 = !DILocalVariable(name: "nblocks", arg: 2, scope: !4358, file: !71, line: 558, type: !15)
!4362 = !DILocalVariable(name: "s", arg: 3, scope: !4358, file: !71, line: 559, type: !5)
!4363 = !DILocalVariable(name: "r", arg: 4, scope: !4358, file: !71, line: 559, type: !19)
!4364 = !DILocation(line: 560, column: 5, scope: !4358)
!4365 = !DILocation(line: 560, column: 20, scope: !4358)
!4366 = !DILocation(line: 561, column: 9, scope: !4367)
!4367 = distinct !DILexicalBlock(scope: !4358, file: !71, line: 560, column: 25)
!4368 = !DILocalVariable(name: "i", scope: !4369, file: !71, line: 562, type: !15)
!4369 = distinct !DILexicalBlock(scope: !4367, file: !71, line: 562, column: 9)
!4370 = !DILocation(line: 0, scope: !4369)
!4371 = !DILocation(line: 562, column: 14, scope: !4369)
!4372 = !DILocation(line: 562, scope: !4369)
!4373 = !DILocation(line: 562, column: 30, scope: !4374)
!4374 = distinct !DILexicalBlock(scope: !4369, file: !71, line: 562, column: 9)
!4375 = !DILocation(line: 562, column: 9, scope: !4369)
!4376 = !DILocation(line: 563, column: 27, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4374, file: !71, line: 562, column: 47)
!4378 = !DILocation(line: 563, column: 23, scope: !4377)
!4379 = !DILocation(line: 563, column: 32, scope: !4377)
!4380 = !DILocation(line: 563, column: 13, scope: !4377)
!4381 = !DILocation(line: 562, column: 43, scope: !4374)
!4382 = !DILocation(line: 562, column: 9, scope: !4374)
!4383 = distinct !{!4383, !4375, !4384, !244}
!4384 = !DILocation(line: 564, column: 9, scope: !4369)
!4385 = !DILocation(line: 565, column: 11, scope: !4367)
!4386 = !DILocation(line: 566, column: 16, scope: !4367)
!4387 = distinct !{!4387, !4364, !4388, !244}
!4388 = !DILocation(line: 567, column: 5, scope: !4358)
!4389 = !DILocation(line: 568, column: 1, scope: !4358)
!4390 = distinct !DISubprogram(name: "store64", scope: !71, file: !71, line: 207, type: !4391, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4391 = !DISubroutineType(types: !4392)
!4392 = !{null, !11, !6}
!4393 = !DILocalVariable(name: "x", arg: 1, scope: !4390, file: !71, line: 207, type: !11)
!4394 = !DILocation(line: 0, scope: !4390)
!4395 = !DILocalVariable(name: "u", arg: 2, scope: !4390, file: !71, line: 207, type: !6)
!4396 = !DILocalVariable(name: "i", scope: !4397, file: !71, line: 208, type: !15)
!4397 = distinct !DILexicalBlock(scope: !4390, file: !71, line: 208, column: 5)
!4398 = !DILocation(line: 0, scope: !4397)
!4399 = !DILocation(line: 208, column: 10, scope: !4397)
!4400 = !DILocation(line: 208, scope: !4397)
!4401 = !DILocation(line: 208, column: 26, scope: !4402)
!4402 = distinct !DILexicalBlock(scope: !4397, file: !71, line: 208, column: 5)
!4403 = !DILocation(line: 208, column: 5, scope: !4397)
!4404 = !DILocation(line: 209, column: 34, scope: !4405)
!4405 = distinct !DILexicalBlock(scope: !4402, file: !71, line: 208, column: 36)
!4406 = !DILocation(line: 209, column: 29, scope: !4405)
!4407 = !DILocation(line: 209, column: 16, scope: !4405)
!4408 = !DILocation(line: 209, column: 9, scope: !4405)
!4409 = !DILocation(line: 209, column: 14, scope: !4405)
!4410 = !DILocation(line: 208, column: 31, scope: !4402)
!4411 = !DILocation(line: 208, column: 5, scope: !4402)
!4412 = distinct !{!4412, !4403, !4413, !244}
!4413 = !DILocation(line: 210, column: 5, scope: !4397)
!4414 = !DILocation(line: 211, column: 1, scope: !4390)
!4415 = distinct !DISubprogram(name: "shake128_ctx_clone", scope: !71, file: !71, line: 788, type: !4416, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4416 = !DISubroutineType(types: !4417)
!4417 = !{null, !4206, !4418}
!4418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4419, size: 32)
!4419 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4207)
!4420 = !DILocalVariable(name: "dest", arg: 1, scope: !4415, file: !71, line: 788, type: !4206)
!4421 = !DILocation(line: 0, scope: !4415)
!4422 = !DILocalVariable(name: "src", arg: 2, scope: !4415, file: !71, line: 788, type: !4418)
!4423 = !DILocation(line: 789, column: 17, scope: !4415)
!4424 = !DILocation(line: 789, column: 15, scope: !4415)
!4425 = !DILocation(line: 790, column: 19, scope: !4426)
!4426 = distinct !DILexicalBlock(scope: !4415, file: !71, line: 790, column: 9)
!4427 = !DILocation(line: 791, column: 9, scope: !4428)
!4428 = distinct !DILexicalBlock(scope: !4426, file: !71, line: 790, column: 28)
!4429 = !DILocation(line: 792, column: 5, scope: !4428)
!4430 = !DILocation(line: 793, column: 18, scope: !4415)
!4431 = !DILocation(line: 793, column: 28, scope: !4415)
!4432 = !DILocation(line: 793, column: 5, scope: !4415)
!4433 = !DILocation(line: 794, column: 1, scope: !4415)
!4434 = distinct !DISubprogram(name: "shake128_ctx_release", scope: !71, file: !71, line: 797, type: !4435, scopeLine: 797, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4435 = !DISubroutineType(types: !4436)
!4436 = !{null, !4206}
!4437 = !DILocalVariable(name: "state", arg: 1, scope: !4434, file: !71, line: 797, type: !4206)
!4438 = !DILocation(line: 0, scope: !4434)
!4439 = !DILocation(line: 798, column: 17, scope: !4434)
!4440 = !DILocation(line: 798, column: 5, scope: !4434)
!4441 = !DILocation(line: 799, column: 1, scope: !4434)
!4442 = distinct !DISubprogram(name: "shake256_absorb", scope: !71, file: !71, line: 812, type: !4443, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4443 = !DISubroutineType(types: !4444)
!4444 = !{null, !4445, !257, !15}
!4445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4446, size: 32)
!4446 = !DIDerivedType(tag: DW_TAG_typedef, name: "shake256ctx", file: !71, line: 46, baseType: !4447)
!4447 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 44, size: 32, elements: !4448)
!4448 = !{!4449}
!4449 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4447, file: !71, line: 45, baseType: !5, size: 32)
!4450 = !DILocalVariable(name: "state", arg: 1, scope: !4442, file: !71, line: 812, type: !4445)
!4451 = !DILocation(line: 0, scope: !4442)
!4452 = !DILocalVariable(name: "input", arg: 2, scope: !4442, file: !71, line: 812, type: !257)
!4453 = !DILocalVariable(name: "inlen", arg: 3, scope: !4442, file: !71, line: 812, type: !15)
!4454 = !DILocation(line: 813, column: 18, scope: !4442)
!4455 = !DILocation(line: 813, column: 16, scope: !4442)
!4456 = !DILocation(line: 814, column: 20, scope: !4457)
!4457 = distinct !DILexicalBlock(scope: !4442, file: !71, line: 814, column: 9)
!4458 = !DILocation(line: 815, column: 9, scope: !4459)
!4459 = distinct !DILexicalBlock(scope: !4457, file: !71, line: 814, column: 29)
!4460 = !DILocation(line: 816, column: 5, scope: !4459)
!4461 = !DILocation(line: 817, column: 26, scope: !4442)
!4462 = !DILocation(line: 817, column: 5, scope: !4442)
!4463 = !DILocation(line: 818, column: 1, scope: !4442)
!4464 = distinct !DISubprogram(name: "shake256_squeezeblocks", scope: !71, file: !71, line: 832, type: !4465, scopeLine: 832, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4465 = !DISubroutineType(types: !4466)
!4466 = !{null, !11, !15, !4445}
!4467 = !DILocalVariable(name: "output", arg: 1, scope: !4464, file: !71, line: 832, type: !11)
!4468 = !DILocation(line: 0, scope: !4464)
!4469 = !DILocalVariable(name: "nblocks", arg: 2, scope: !4464, file: !71, line: 832, type: !15)
!4470 = !DILocalVariable(name: "state", arg: 3, scope: !4464, file: !71, line: 832, type: !4445)
!4471 = !DILocation(line: 833, column: 50, scope: !4464)
!4472 = !DILocation(line: 833, column: 5, scope: !4464)
!4473 = !DILocation(line: 834, column: 1, scope: !4464)
!4474 = distinct !DISubprogram(name: "shake256_ctx_clone", scope: !71, file: !71, line: 836, type: !4475, scopeLine: 836, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4475 = !DISubroutineType(types: !4476)
!4476 = !{null, !4445, !4477}
!4477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4478, size: 32)
!4478 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4446)
!4479 = !DILocalVariable(name: "dest", arg: 1, scope: !4474, file: !71, line: 836, type: !4445)
!4480 = !DILocation(line: 0, scope: !4474)
!4481 = !DILocalVariable(name: "src", arg: 2, scope: !4474, file: !71, line: 836, type: !4477)
!4482 = !DILocation(line: 837, column: 17, scope: !4474)
!4483 = !DILocation(line: 837, column: 15, scope: !4474)
!4484 = !DILocation(line: 838, column: 19, scope: !4485)
!4485 = distinct !DILexicalBlock(scope: !4474, file: !71, line: 838, column: 9)
!4486 = !DILocation(line: 839, column: 9, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4485, file: !71, line: 838, column: 28)
!4488 = !DILocation(line: 840, column: 5, scope: !4487)
!4489 = !DILocation(line: 841, column: 18, scope: !4474)
!4490 = !DILocation(line: 841, column: 28, scope: !4474)
!4491 = !DILocation(line: 841, column: 5, scope: !4474)
!4492 = !DILocation(line: 842, column: 1, scope: !4474)
!4493 = distinct !DISubprogram(name: "shake256_ctx_release", scope: !71, file: !71, line: 845, type: !4494, scopeLine: 845, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4494 = !DISubroutineType(types: !4495)
!4495 = !{null, !4445}
!4496 = !DILocalVariable(name: "state", arg: 1, scope: !4493, file: !71, line: 845, type: !4445)
!4497 = !DILocation(line: 0, scope: !4493)
!4498 = !DILocation(line: 846, column: 17, scope: !4493)
!4499 = !DILocation(line: 846, column: 5, scope: !4493)
!4500 = !DILocation(line: 847, column: 1, scope: !4493)
!4501 = distinct !DISubprogram(name: "shake128", scope: !71, file: !71, line: 859, type: !4502, scopeLine: 860, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4502 = !DISubroutineType(types: !4503)
!4503 = !{null, !11, !15, !257, !15}
!4504 = !DILocalVariable(name: "output", arg: 1, scope: !4501, file: !71, line: 859, type: !11)
!4505 = !DILocation(line: 0, scope: !4501)
!4506 = !DILocalVariable(name: "outlen", arg: 2, scope: !4501, file: !71, line: 859, type: !15)
!4507 = !DILocalVariable(name: "input", arg: 3, scope: !4501, file: !71, line: 860, type: !257)
!4508 = !DILocalVariable(name: "inlen", arg: 4, scope: !4501, file: !71, line: 860, type: !15)
!4509 = !DILocation(line: 861, column: 29, scope: !4501)
!4510 = !DILocalVariable(name: "nblocks", scope: !4501, file: !71, line: 861, type: !15)
!4511 = !DILocalVariable(name: "t", scope: !4501, file: !71, line: 862, type: !4512)
!4512 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1344, elements: !4513)
!4513 = !{!4514}
!4514 = !DISubrange(count: 168)
!4515 = !DILocation(line: 862, column: 13, scope: !4501)
!4516 = !DILocalVariable(name: "s", scope: !4501, file: !71, line: 863, type: !4207)
!4517 = !DILocation(line: 863, column: 17, scope: !4501)
!4518 = !DILocation(line: 865, column: 5, scope: !4501)
!4519 = !DILocation(line: 866, column: 5, scope: !4501)
!4520 = !DILocation(line: 868, column: 23, scope: !4501)
!4521 = !DILocation(line: 868, column: 12, scope: !4501)
!4522 = !DILocation(line: 869, column: 23, scope: !4501)
!4523 = !DILocation(line: 869, column: 12, scope: !4501)
!4524 = !DILocation(line: 871, column: 9, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4501, file: !71, line: 871, column: 9)
!4526 = !DILocation(line: 872, column: 9, scope: !4527)
!4527 = distinct !DILexicalBlock(scope: !4525, file: !71, line: 871, column: 17)
!4528 = !DILocalVariable(name: "i", scope: !4529, file: !71, line: 873, type: !15)
!4529 = distinct !DILexicalBlock(scope: !4527, file: !71, line: 873, column: 9)
!4530 = !DILocation(line: 0, scope: !4529)
!4531 = !DILocation(line: 873, column: 14, scope: !4529)
!4532 = !DILocation(line: 873, scope: !4529)
!4533 = !DILocation(line: 873, column: 30, scope: !4534)
!4534 = distinct !DILexicalBlock(scope: !4529, file: !71, line: 873, column: 9)
!4535 = !DILocation(line: 873, column: 9, scope: !4529)
!4536 = !DILocation(line: 874, column: 25, scope: !4537)
!4537 = distinct !DILexicalBlock(scope: !4534, file: !71, line: 873, column: 45)
!4538 = !DILocation(line: 874, column: 13, scope: !4537)
!4539 = !DILocation(line: 874, column: 23, scope: !4537)
!4540 = !DILocation(line: 873, column: 40, scope: !4534)
!4541 = !DILocation(line: 873, column: 9, scope: !4534)
!4542 = distinct !{!4542, !4535, !4543, !244}
!4543 = !DILocation(line: 875, column: 9, scope: !4529)
!4544 = !DILocation(line: 877, column: 5, scope: !4501)
!4545 = !DILocation(line: 878, column: 1, scope: !4501)
!4546 = distinct !DISubprogram(name: "shake256", scope: !71, file: !71, line: 890, type: !4502, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4547 = !DILocalVariable(name: "output", arg: 1, scope: !4546, file: !71, line: 890, type: !11)
!4548 = !DILocation(line: 0, scope: !4546)
!4549 = !DILocalVariable(name: "outlen", arg: 2, scope: !4546, file: !71, line: 890, type: !15)
!4550 = !DILocalVariable(name: "input", arg: 3, scope: !4546, file: !71, line: 891, type: !257)
!4551 = !DILocalVariable(name: "inlen", arg: 4, scope: !4546, file: !71, line: 891, type: !15)
!4552 = !DILocation(line: 892, column: 29, scope: !4546)
!4553 = !DILocalVariable(name: "nblocks", scope: !4546, file: !71, line: 892, type: !15)
!4554 = !DILocalVariable(name: "t", scope: !4546, file: !71, line: 893, type: !4555)
!4555 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1088, elements: !4556)
!4556 = !{!4557}
!4557 = !DISubrange(count: 136)
!4558 = !DILocation(line: 893, column: 13, scope: !4546)
!4559 = !DILocalVariable(name: "s", scope: !4546, file: !71, line: 894, type: !4446)
!4560 = !DILocation(line: 894, column: 17, scope: !4546)
!4561 = !DILocation(line: 896, column: 5, scope: !4546)
!4562 = !DILocation(line: 897, column: 5, scope: !4546)
!4563 = !DILocation(line: 899, column: 23, scope: !4546)
!4564 = !DILocation(line: 899, column: 12, scope: !4546)
!4565 = !DILocation(line: 900, column: 23, scope: !4546)
!4566 = !DILocation(line: 900, column: 12, scope: !4546)
!4567 = !DILocation(line: 902, column: 9, scope: !4568)
!4568 = distinct !DILexicalBlock(scope: !4546, file: !71, line: 902, column: 9)
!4569 = !DILocation(line: 903, column: 9, scope: !4570)
!4570 = distinct !DILexicalBlock(scope: !4568, file: !71, line: 902, column: 17)
!4571 = !DILocalVariable(name: "i", scope: !4572, file: !71, line: 904, type: !15)
!4572 = distinct !DILexicalBlock(scope: !4570, file: !71, line: 904, column: 9)
!4573 = !DILocation(line: 0, scope: !4572)
!4574 = !DILocation(line: 904, column: 14, scope: !4572)
!4575 = !DILocation(line: 904, scope: !4572)
!4576 = !DILocation(line: 904, column: 30, scope: !4577)
!4577 = distinct !DILexicalBlock(scope: !4572, file: !71, line: 904, column: 9)
!4578 = !DILocation(line: 904, column: 9, scope: !4572)
!4579 = !DILocation(line: 905, column: 25, scope: !4580)
!4580 = distinct !DILexicalBlock(scope: !4577, file: !71, line: 904, column: 45)
!4581 = !DILocation(line: 905, column: 13, scope: !4580)
!4582 = !DILocation(line: 905, column: 23, scope: !4580)
!4583 = !DILocation(line: 904, column: 40, scope: !4577)
!4584 = !DILocation(line: 904, column: 9, scope: !4577)
!4585 = distinct !{!4585, !4578, !4586, !244}
!4586 = !DILocation(line: 906, column: 9, scope: !4572)
!4587 = !DILocation(line: 908, column: 5, scope: !4546)
!4588 = !DILocation(line: 909, column: 1, scope: !4546)
!4589 = distinct !DISubprogram(name: "sha3_256_inc_init", scope: !71, file: !71, line: 911, type: !4590, scopeLine: 911, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4590 = !DISubroutineType(types: !4591)
!4591 = !{null, !4592}
!4592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4593, size: 32)
!4593 = !DIDerivedType(tag: DW_TAG_typedef, name: "sha3_256incctx", file: !71, line: 51, baseType: !4594)
!4594 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 49, size: 32, elements: !4595)
!4595 = !{!4596}
!4596 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4594, file: !71, line: 50, baseType: !5, size: 32)
!4597 = !DILocalVariable(name: "state", arg: 1, scope: !4589, file: !71, line: 911, type: !4592)
!4598 = !DILocation(line: 0, scope: !4589)
!4599 = !DILocation(line: 912, column: 18, scope: !4589)
!4600 = !DILocation(line: 912, column: 16, scope: !4589)
!4601 = !DILocation(line: 913, column: 20, scope: !4602)
!4602 = distinct !DILexicalBlock(scope: !4589, file: !71, line: 913, column: 9)
!4603 = !DILocation(line: 914, column: 9, scope: !4604)
!4604 = distinct !DILexicalBlock(scope: !4602, file: !71, line: 913, column: 29)
!4605 = !DILocation(line: 915, column: 5, scope: !4604)
!4606 = !DILocation(line: 916, column: 28, scope: !4589)
!4607 = !DILocation(line: 916, column: 5, scope: !4589)
!4608 = !DILocation(line: 917, column: 1, scope: !4589)
!4609 = distinct !DISubprogram(name: "sha3_256_inc_ctx_clone", scope: !71, file: !71, line: 919, type: !4610, scopeLine: 919, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4610 = !DISubroutineType(types: !4611)
!4611 = !{null, !4592, !4612}
!4612 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4613, size: 32)
!4613 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4593)
!4614 = !DILocalVariable(name: "dest", arg: 1, scope: !4609, file: !71, line: 919, type: !4592)
!4615 = !DILocation(line: 0, scope: !4609)
!4616 = !DILocalVariable(name: "src", arg: 2, scope: !4609, file: !71, line: 919, type: !4612)
!4617 = !DILocation(line: 920, column: 17, scope: !4609)
!4618 = !DILocation(line: 920, column: 15, scope: !4609)
!4619 = !DILocation(line: 921, column: 19, scope: !4620)
!4620 = distinct !DILexicalBlock(scope: !4609, file: !71, line: 921, column: 9)
!4621 = !DILocation(line: 922, column: 9, scope: !4622)
!4622 = distinct !DILexicalBlock(scope: !4620, file: !71, line: 921, column: 28)
!4623 = !DILocation(line: 923, column: 5, scope: !4622)
!4624 = !DILocation(line: 924, column: 18, scope: !4609)
!4625 = !DILocation(line: 924, column: 28, scope: !4609)
!4626 = !DILocation(line: 924, column: 5, scope: !4609)
!4627 = !DILocation(line: 925, column: 1, scope: !4609)
!4628 = distinct !DISubprogram(name: "sha3_256_inc_ctx_release", scope: !71, file: !71, line: 927, type: !4590, scopeLine: 927, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4629 = !DILocalVariable(name: "state", arg: 1, scope: !4628, file: !71, line: 927, type: !4592)
!4630 = !DILocation(line: 0, scope: !4628)
!4631 = !DILocation(line: 928, column: 17, scope: !4628)
!4632 = !DILocation(line: 928, column: 5, scope: !4628)
!4633 = !DILocation(line: 929, column: 1, scope: !4628)
!4634 = distinct !DISubprogram(name: "sha3_256_inc_absorb", scope: !71, file: !71, line: 931, type: !4635, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4635 = !DISubroutineType(types: !4636)
!4636 = !{null, !4592, !257, !15}
!4637 = !DILocalVariable(name: "state", arg: 1, scope: !4634, file: !71, line: 931, type: !4592)
!4638 = !DILocation(line: 0, scope: !4634)
!4639 = !DILocalVariable(name: "input", arg: 2, scope: !4634, file: !71, line: 931, type: !257)
!4640 = !DILocalVariable(name: "inlen", arg: 3, scope: !4634, file: !71, line: 931, type: !15)
!4641 = !DILocation(line: 932, column: 30, scope: !4634)
!4642 = !DILocation(line: 932, column: 5, scope: !4634)
!4643 = !DILocation(line: 933, column: 1, scope: !4634)
!4644 = distinct !DISubprogram(name: "sha3_256_inc_finalize", scope: !71, file: !71, line: 935, type: !4645, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4645 = !DISubroutineType(types: !4646)
!4646 = !{null, !11, !4592}
!4647 = !DILocalVariable(name: "output", arg: 1, scope: !4644, file: !71, line: 935, type: !11)
!4648 = !DILocation(line: 0, scope: !4644)
!4649 = !DILocalVariable(name: "state", arg: 2, scope: !4644, file: !71, line: 935, type: !4592)
!4650 = !DILocalVariable(name: "t", scope: !4644, file: !71, line: 936, type: !4555)
!4651 = !DILocation(line: 936, column: 13, scope: !4644)
!4652 = !DILocation(line: 937, column: 32, scope: !4644)
!4653 = !DILocation(line: 937, column: 5, scope: !4644)
!4654 = !DILocation(line: 939, column: 39, scope: !4644)
!4655 = !DILocation(line: 939, column: 5, scope: !4644)
!4656 = !DILocation(line: 941, column: 5, scope: !4644)
!4657 = !DILocalVariable(name: "i", scope: !4658, file: !71, line: 943, type: !15)
!4658 = distinct !DILexicalBlock(scope: !4644, file: !71, line: 943, column: 5)
!4659 = !DILocation(line: 0, scope: !4658)
!4660 = !DILocation(line: 943, column: 10, scope: !4658)
!4661 = !DILocation(line: 943, scope: !4658)
!4662 = !DILocation(line: 943, column: 26, scope: !4663)
!4663 = distinct !DILexicalBlock(scope: !4658, file: !71, line: 943, column: 5)
!4664 = !DILocation(line: 943, column: 5, scope: !4658)
!4665 = !DILocation(line: 944, column: 21, scope: !4666)
!4666 = distinct !DILexicalBlock(scope: !4663, file: !71, line: 943, column: 37)
!4667 = !DILocation(line: 944, column: 9, scope: !4666)
!4668 = !DILocation(line: 944, column: 19, scope: !4666)
!4669 = !DILocation(line: 943, column: 33, scope: !4663)
!4670 = !DILocation(line: 943, column: 5, scope: !4663)
!4671 = distinct !{!4671, !4664, !4672, !244}
!4672 = !DILocation(line: 945, column: 5, scope: !4658)
!4673 = !DILocation(line: 946, column: 1, scope: !4644)
!4674 = distinct !DISubprogram(name: "sha3_256", scope: !71, file: !71, line: 957, type: !4675, scopeLine: 957, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4675 = !DISubroutineType(types: !4676)
!4676 = !{null, !11, !257, !15}
!4677 = !DILocalVariable(name: "output", arg: 1, scope: !4674, file: !71, line: 957, type: !11)
!4678 = !DILocation(line: 0, scope: !4674)
!4679 = !DILocalVariable(name: "input", arg: 2, scope: !4674, file: !71, line: 957, type: !257)
!4680 = !DILocalVariable(name: "inlen", arg: 3, scope: !4674, file: !71, line: 957, type: !15)
!4681 = !DILocalVariable(name: "s", scope: !4674, file: !71, line: 958, type: !4682)
!4682 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !4683)
!4683 = !{!4684}
!4684 = !DISubrange(count: 25)
!4685 = !DILocation(line: 958, column: 14, scope: !4674)
!4686 = !DILocalVariable(name: "t", scope: !4674, file: !71, line: 959, type: !4555)
!4687 = !DILocation(line: 959, column: 13, scope: !4674)
!4688 = !DILocation(line: 962, column: 5, scope: !4674)
!4689 = !DILocation(line: 965, column: 5, scope: !4674)
!4690 = !DILocalVariable(name: "i", scope: !4691, file: !71, line: 967, type: !15)
!4691 = distinct !DILexicalBlock(scope: !4674, file: !71, line: 967, column: 5)
!4692 = !DILocation(line: 0, scope: !4691)
!4693 = !DILocation(line: 967, column: 10, scope: !4691)
!4694 = !DILocation(line: 967, scope: !4691)
!4695 = !DILocation(line: 967, column: 26, scope: !4696)
!4696 = distinct !DILexicalBlock(scope: !4691, file: !71, line: 967, column: 5)
!4697 = !DILocation(line: 967, column: 5, scope: !4691)
!4698 = !DILocation(line: 968, column: 21, scope: !4699)
!4699 = distinct !DILexicalBlock(scope: !4696, file: !71, line: 967, column: 37)
!4700 = !DILocation(line: 968, column: 9, scope: !4699)
!4701 = !DILocation(line: 968, column: 19, scope: !4699)
!4702 = !DILocation(line: 967, column: 33, scope: !4696)
!4703 = !DILocation(line: 967, column: 5, scope: !4696)
!4704 = distinct !{!4704, !4697, !4705, !244}
!4705 = !DILocation(line: 969, column: 5, scope: !4691)
!4706 = !DILocation(line: 970, column: 1, scope: !4674)
!4707 = distinct !DISubprogram(name: "sha3_384_inc_init", scope: !71, file: !71, line: 972, type: !4708, scopeLine: 972, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4708 = !DISubroutineType(types: !4709)
!4709 = !{null, !4710}
!4710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4711, size: 32)
!4711 = !DIDerivedType(tag: DW_TAG_typedef, name: "sha3_384incctx", file: !71, line: 56, baseType: !4712)
!4712 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 54, size: 32, elements: !4713)
!4713 = !{!4714}
!4714 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4712, file: !71, line: 55, baseType: !5, size: 32)
!4715 = !DILocalVariable(name: "state", arg: 1, scope: !4707, file: !71, line: 972, type: !4710)
!4716 = !DILocation(line: 0, scope: !4707)
!4717 = !DILocation(line: 973, column: 18, scope: !4707)
!4718 = !DILocation(line: 973, column: 16, scope: !4707)
!4719 = !DILocation(line: 974, column: 20, scope: !4720)
!4720 = distinct !DILexicalBlock(scope: !4707, file: !71, line: 974, column: 9)
!4721 = !DILocation(line: 975, column: 9, scope: !4722)
!4722 = distinct !DILexicalBlock(scope: !4720, file: !71, line: 974, column: 29)
!4723 = !DILocation(line: 976, column: 5, scope: !4722)
!4724 = !DILocation(line: 977, column: 28, scope: !4707)
!4725 = !DILocation(line: 977, column: 5, scope: !4707)
!4726 = !DILocation(line: 978, column: 1, scope: !4707)
!4727 = distinct !DISubprogram(name: "sha3_384_inc_ctx_clone", scope: !71, file: !71, line: 980, type: !4728, scopeLine: 980, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4728 = !DISubroutineType(types: !4729)
!4729 = !{null, !4710, !4730}
!4730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4731, size: 32)
!4731 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4711)
!4732 = !DILocalVariable(name: "dest", arg: 1, scope: !4727, file: !71, line: 980, type: !4710)
!4733 = !DILocation(line: 0, scope: !4727)
!4734 = !DILocalVariable(name: "src", arg: 2, scope: !4727, file: !71, line: 980, type: !4730)
!4735 = !DILocation(line: 981, column: 17, scope: !4727)
!4736 = !DILocation(line: 981, column: 15, scope: !4727)
!4737 = !DILocation(line: 982, column: 19, scope: !4738)
!4738 = distinct !DILexicalBlock(scope: !4727, file: !71, line: 982, column: 9)
!4739 = !DILocation(line: 983, column: 9, scope: !4740)
!4740 = distinct !DILexicalBlock(scope: !4738, file: !71, line: 982, column: 28)
!4741 = !DILocation(line: 984, column: 5, scope: !4740)
!4742 = !DILocation(line: 985, column: 18, scope: !4727)
!4743 = !DILocation(line: 985, column: 28, scope: !4727)
!4744 = !DILocation(line: 985, column: 5, scope: !4727)
!4745 = !DILocation(line: 986, column: 1, scope: !4727)
!4746 = distinct !DISubprogram(name: "sha3_384_inc_absorb", scope: !71, file: !71, line: 988, type: !4747, scopeLine: 988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4747 = !DISubroutineType(types: !4748)
!4748 = !{null, !4710, !257, !15}
!4749 = !DILocalVariable(name: "state", arg: 1, scope: !4746, file: !71, line: 988, type: !4710)
!4750 = !DILocation(line: 0, scope: !4746)
!4751 = !DILocalVariable(name: "input", arg: 2, scope: !4746, file: !71, line: 988, type: !257)
!4752 = !DILocalVariable(name: "inlen", arg: 3, scope: !4746, file: !71, line: 988, type: !15)
!4753 = !DILocation(line: 989, column: 30, scope: !4746)
!4754 = !DILocation(line: 989, column: 5, scope: !4746)
!4755 = !DILocation(line: 990, column: 1, scope: !4746)
!4756 = distinct !DISubprogram(name: "sha3_384_inc_ctx_release", scope: !71, file: !71, line: 992, type: !4708, scopeLine: 992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4757 = !DILocalVariable(name: "state", arg: 1, scope: !4756, file: !71, line: 992, type: !4710)
!4758 = !DILocation(line: 0, scope: !4756)
!4759 = !DILocation(line: 993, column: 17, scope: !4756)
!4760 = !DILocation(line: 993, column: 5, scope: !4756)
!4761 = !DILocation(line: 994, column: 1, scope: !4756)
!4762 = distinct !DISubprogram(name: "sha3_384_inc_finalize", scope: !71, file: !71, line: 996, type: !4763, scopeLine: 996, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4763 = !DISubroutineType(types: !4764)
!4764 = !{null, !11, !4710}
!4765 = !DILocalVariable(name: "output", arg: 1, scope: !4762, file: !71, line: 996, type: !11)
!4766 = !DILocation(line: 0, scope: !4762)
!4767 = !DILocalVariable(name: "state", arg: 2, scope: !4762, file: !71, line: 996, type: !4710)
!4768 = !DILocalVariable(name: "t", scope: !4762, file: !71, line: 997, type: !4769)
!4769 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 832, elements: !4770)
!4770 = !{!4771}
!4771 = !DISubrange(count: 104)
!4772 = !DILocation(line: 997, column: 13, scope: !4762)
!4773 = !DILocation(line: 998, column: 32, scope: !4762)
!4774 = !DILocation(line: 998, column: 5, scope: !4762)
!4775 = !DILocation(line: 1000, column: 39, scope: !4762)
!4776 = !DILocation(line: 1000, column: 5, scope: !4762)
!4777 = !DILocation(line: 1002, column: 5, scope: !4762)
!4778 = !DILocalVariable(name: "i", scope: !4779, file: !71, line: 1004, type: !15)
!4779 = distinct !DILexicalBlock(scope: !4762, file: !71, line: 1004, column: 5)
!4780 = !DILocation(line: 0, scope: !4779)
!4781 = !DILocation(line: 1004, column: 10, scope: !4779)
!4782 = !DILocation(line: 1004, scope: !4779)
!4783 = !DILocation(line: 1004, column: 26, scope: !4784)
!4784 = distinct !DILexicalBlock(scope: !4779, file: !71, line: 1004, column: 5)
!4785 = !DILocation(line: 1004, column: 5, scope: !4779)
!4786 = !DILocation(line: 1005, column: 21, scope: !4787)
!4787 = distinct !DILexicalBlock(scope: !4784, file: !71, line: 1004, column: 37)
!4788 = !DILocation(line: 1005, column: 9, scope: !4787)
!4789 = !DILocation(line: 1005, column: 19, scope: !4787)
!4790 = !DILocation(line: 1004, column: 33, scope: !4784)
!4791 = !DILocation(line: 1004, column: 5, scope: !4784)
!4792 = distinct !{!4792, !4785, !4793, !244}
!4793 = !DILocation(line: 1006, column: 5, scope: !4779)
!4794 = !DILocation(line: 1007, column: 1, scope: !4762)
!4795 = distinct !DISubprogram(name: "sha3_384", scope: !71, file: !71, line: 1018, type: !4675, scopeLine: 1018, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4796 = !DILocalVariable(name: "output", arg: 1, scope: !4795, file: !71, line: 1018, type: !11)
!4797 = !DILocation(line: 0, scope: !4795)
!4798 = !DILocalVariable(name: "input", arg: 2, scope: !4795, file: !71, line: 1018, type: !257)
!4799 = !DILocalVariable(name: "inlen", arg: 3, scope: !4795, file: !71, line: 1018, type: !15)
!4800 = !DILocalVariable(name: "s", scope: !4795, file: !71, line: 1019, type: !4682)
!4801 = !DILocation(line: 1019, column: 14, scope: !4795)
!4802 = !DILocalVariable(name: "t", scope: !4795, file: !71, line: 1020, type: !4769)
!4803 = !DILocation(line: 1020, column: 13, scope: !4795)
!4804 = !DILocation(line: 1023, column: 5, scope: !4795)
!4805 = !DILocation(line: 1026, column: 5, scope: !4795)
!4806 = !DILocalVariable(name: "i", scope: !4807, file: !71, line: 1028, type: !15)
!4807 = distinct !DILexicalBlock(scope: !4795, file: !71, line: 1028, column: 5)
!4808 = !DILocation(line: 0, scope: !4807)
!4809 = !DILocation(line: 1028, column: 10, scope: !4807)
!4810 = !DILocation(line: 1028, scope: !4807)
!4811 = !DILocation(line: 1028, column: 26, scope: !4812)
!4812 = distinct !DILexicalBlock(scope: !4807, file: !71, line: 1028, column: 5)
!4813 = !DILocation(line: 1028, column: 5, scope: !4807)
!4814 = !DILocation(line: 1029, column: 21, scope: !4815)
!4815 = distinct !DILexicalBlock(scope: !4812, file: !71, line: 1028, column: 37)
!4816 = !DILocation(line: 1029, column: 9, scope: !4815)
!4817 = !DILocation(line: 1029, column: 19, scope: !4815)
!4818 = !DILocation(line: 1028, column: 33, scope: !4812)
!4819 = !DILocation(line: 1028, column: 5, scope: !4812)
!4820 = distinct !{!4820, !4813, !4821, !244}
!4821 = !DILocation(line: 1030, column: 5, scope: !4807)
!4822 = !DILocation(line: 1031, column: 1, scope: !4795)
!4823 = distinct !DISubprogram(name: "sha3_512_inc_init", scope: !71, file: !71, line: 1033, type: !4824, scopeLine: 1033, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4824 = !DISubroutineType(types: !4825)
!4825 = !{null, !4826}
!4826 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4827, size: 32)
!4827 = !DIDerivedType(tag: DW_TAG_typedef, name: "sha3_512incctx", file: !71, line: 61, baseType: !4828)
!4828 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !71, line: 59, size: 32, elements: !4829)
!4829 = !{!4830}
!4830 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !4828, file: !71, line: 60, baseType: !5, size: 32)
!4831 = !DILocalVariable(name: "state", arg: 1, scope: !4823, file: !71, line: 1033, type: !4826)
!4832 = !DILocation(line: 0, scope: !4823)
!4833 = !DILocation(line: 1034, column: 18, scope: !4823)
!4834 = !DILocation(line: 1034, column: 16, scope: !4823)
!4835 = !DILocation(line: 1035, column: 20, scope: !4836)
!4836 = distinct !DILexicalBlock(scope: !4823, file: !71, line: 1035, column: 9)
!4837 = !DILocation(line: 1036, column: 9, scope: !4838)
!4838 = distinct !DILexicalBlock(scope: !4836, file: !71, line: 1035, column: 29)
!4839 = !DILocation(line: 1037, column: 5, scope: !4838)
!4840 = !DILocation(line: 1038, column: 28, scope: !4823)
!4841 = !DILocation(line: 1038, column: 5, scope: !4823)
!4842 = !DILocation(line: 1039, column: 1, scope: !4823)
!4843 = distinct !DISubprogram(name: "sha3_512_inc_ctx_clone", scope: !71, file: !71, line: 1041, type: !4844, scopeLine: 1041, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4844 = !DISubroutineType(types: !4845)
!4845 = !{null, !4826, !4846}
!4846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4847, size: 32)
!4847 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4827)
!4848 = !DILocalVariable(name: "dest", arg: 1, scope: !4843, file: !71, line: 1041, type: !4826)
!4849 = !DILocation(line: 0, scope: !4843)
!4850 = !DILocalVariable(name: "src", arg: 2, scope: !4843, file: !71, line: 1041, type: !4846)
!4851 = !DILocation(line: 1042, column: 17, scope: !4843)
!4852 = !DILocation(line: 1042, column: 15, scope: !4843)
!4853 = !DILocation(line: 1043, column: 19, scope: !4854)
!4854 = distinct !DILexicalBlock(scope: !4843, file: !71, line: 1043, column: 9)
!4855 = !DILocation(line: 1044, column: 9, scope: !4856)
!4856 = distinct !DILexicalBlock(scope: !4854, file: !71, line: 1043, column: 28)
!4857 = !DILocation(line: 1045, column: 5, scope: !4856)
!4858 = !DILocation(line: 1046, column: 18, scope: !4843)
!4859 = !DILocation(line: 1046, column: 28, scope: !4843)
!4860 = !DILocation(line: 1046, column: 5, scope: !4843)
!4861 = !DILocation(line: 1047, column: 1, scope: !4843)
!4862 = distinct !DISubprogram(name: "sha3_512_inc_absorb", scope: !71, file: !71, line: 1049, type: !4863, scopeLine: 1049, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4863 = !DISubroutineType(types: !4864)
!4864 = !{null, !4826, !257, !15}
!4865 = !DILocalVariable(name: "state", arg: 1, scope: !4862, file: !71, line: 1049, type: !4826)
!4866 = !DILocation(line: 0, scope: !4862)
!4867 = !DILocalVariable(name: "input", arg: 2, scope: !4862, file: !71, line: 1049, type: !257)
!4868 = !DILocalVariable(name: "inlen", arg: 3, scope: !4862, file: !71, line: 1049, type: !15)
!4869 = !DILocation(line: 1050, column: 30, scope: !4862)
!4870 = !DILocation(line: 1050, column: 5, scope: !4862)
!4871 = !DILocation(line: 1051, column: 1, scope: !4862)
!4872 = distinct !DISubprogram(name: "sha3_512_inc_ctx_release", scope: !71, file: !71, line: 1053, type: !4824, scopeLine: 1053, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4873 = !DILocalVariable(name: "state", arg: 1, scope: !4872, file: !71, line: 1053, type: !4826)
!4874 = !DILocation(line: 0, scope: !4872)
!4875 = !DILocation(line: 1054, column: 17, scope: !4872)
!4876 = !DILocation(line: 1054, column: 5, scope: !4872)
!4877 = !DILocation(line: 1055, column: 1, scope: !4872)
!4878 = distinct !DISubprogram(name: "sha3_512_inc_finalize", scope: !71, file: !71, line: 1057, type: !4879, scopeLine: 1057, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4879 = !DISubroutineType(types: !4880)
!4880 = !{null, !11, !4826}
!4881 = !DILocalVariable(name: "output", arg: 1, scope: !4878, file: !71, line: 1057, type: !11)
!4882 = !DILocation(line: 0, scope: !4878)
!4883 = !DILocalVariable(name: "state", arg: 2, scope: !4878, file: !71, line: 1057, type: !4826)
!4884 = !DILocalVariable(name: "t", scope: !4878, file: !71, line: 1058, type: !4885)
!4885 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 576, elements: !4886)
!4886 = !{!4887}
!4887 = !DISubrange(count: 72)
!4888 = !DILocation(line: 1058, column: 13, scope: !4878)
!4889 = !DILocation(line: 1059, column: 32, scope: !4878)
!4890 = !DILocation(line: 1059, column: 5, scope: !4878)
!4891 = !DILocation(line: 1061, column: 39, scope: !4878)
!4892 = !DILocation(line: 1061, column: 5, scope: !4878)
!4893 = !DILocation(line: 1063, column: 5, scope: !4878)
!4894 = !DILocalVariable(name: "i", scope: !4895, file: !71, line: 1065, type: !15)
!4895 = distinct !DILexicalBlock(scope: !4878, file: !71, line: 1065, column: 5)
!4896 = !DILocation(line: 0, scope: !4895)
!4897 = !DILocation(line: 1065, column: 10, scope: !4895)
!4898 = !DILocation(line: 1065, scope: !4895)
!4899 = !DILocation(line: 1065, column: 26, scope: !4900)
!4900 = distinct !DILexicalBlock(scope: !4895, file: !71, line: 1065, column: 5)
!4901 = !DILocation(line: 1065, column: 5, scope: !4895)
!4902 = !DILocation(line: 1066, column: 21, scope: !4903)
!4903 = distinct !DILexicalBlock(scope: !4900, file: !71, line: 1065, column: 37)
!4904 = !DILocation(line: 1066, column: 9, scope: !4903)
!4905 = !DILocation(line: 1066, column: 19, scope: !4903)
!4906 = !DILocation(line: 1065, column: 33, scope: !4900)
!4907 = !DILocation(line: 1065, column: 5, scope: !4900)
!4908 = distinct !{!4908, !4901, !4909, !244}
!4909 = !DILocation(line: 1067, column: 5, scope: !4895)
!4910 = !DILocation(line: 1068, column: 1, scope: !4878)
!4911 = distinct !DISubprogram(name: "sha3_512", scope: !71, file: !71, line: 1079, type: !4675, scopeLine: 1079, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !28)
!4912 = !DILocalVariable(name: "output", arg: 1, scope: !4911, file: !71, line: 1079, type: !11)
!4913 = !DILocation(line: 0, scope: !4911)
!4914 = !DILocalVariable(name: "input", arg: 2, scope: !4911, file: !71, line: 1079, type: !257)
!4915 = !DILocalVariable(name: "inlen", arg: 3, scope: !4911, file: !71, line: 1079, type: !15)
!4916 = !DILocalVariable(name: "s", scope: !4911, file: !71, line: 1080, type: !4682)
!4917 = !DILocation(line: 1080, column: 14, scope: !4911)
!4918 = !DILocalVariable(name: "t", scope: !4911, file: !71, line: 1081, type: !4885)
!4919 = !DILocation(line: 1081, column: 13, scope: !4911)
!4920 = !DILocation(line: 1084, column: 5, scope: !4911)
!4921 = !DILocation(line: 1087, column: 5, scope: !4911)
!4922 = !DILocalVariable(name: "i", scope: !4923, file: !71, line: 1089, type: !15)
!4923 = distinct !DILexicalBlock(scope: !4911, file: !71, line: 1089, column: 5)
!4924 = !DILocation(line: 0, scope: !4923)
!4925 = !DILocation(line: 1089, column: 10, scope: !4923)
!4926 = !DILocation(line: 1089, scope: !4923)
!4927 = !DILocation(line: 1089, column: 26, scope: !4928)
!4928 = distinct !DILexicalBlock(scope: !4923, file: !71, line: 1089, column: 5)
!4929 = !DILocation(line: 1089, column: 5, scope: !4923)
!4930 = !DILocation(line: 1090, column: 21, scope: !4931)
!4931 = distinct !DILexicalBlock(scope: !4928, file: !71, line: 1089, column: 37)
!4932 = !DILocation(line: 1090, column: 9, scope: !4931)
!4933 = !DILocation(line: 1090, column: 19, scope: !4931)
!4934 = !DILocation(line: 1089, column: 33, scope: !4928)
!4935 = !DILocation(line: 1089, column: 5, scope: !4928)
!4936 = distinct !{!4936, !4929, !4937, !244}
!4937 = !DILocation(line: 1091, column: 5, scope: !4923)
!4938 = !DILocation(line: 1092, column: 1, scope: !4911)
!4939 = distinct !DISubprogram(name: "aes128_ecb_keyexp", scope: !80, file: !80, line: 635, type: !4940, scopeLine: 635, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!4940 = !DISubroutineType(types: !4941)
!4941 = !{null, !4942, !49}
!4942 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4943, size: 32)
!4943 = !DIDerivedType(tag: DW_TAG_typedef, name: "aes128ctx", file: !80, line: 46, baseType: !4944)
!4944 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !80, line: 44, size: 32, elements: !4945)
!4945 = !{!4946}
!4946 = !DIDerivedType(tag: DW_TAG_member, name: "sk_exp", scope: !4944, file: !80, line: 45, baseType: !5, size: 32)
!4947 = !DILocalVariable(name: "r", arg: 1, scope: !4939, file: !80, line: 635, type: !4942)
!4948 = !DILocation(line: 0, scope: !4939)
!4949 = !DILocalVariable(name: "key", arg: 2, scope: !4939, file: !80, line: 635, type: !49)
!4950 = !DILocalVariable(name: "skey", scope: !4939, file: !80, line: 636, type: !4951)
!4951 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1408, elements: !4952)
!4952 = !{!4953}
!4953 = !DISubrange(count: 22)
!4954 = !DILocation(line: 636, column: 14, scope: !4939)
!4955 = !DILocation(line: 638, column: 17, scope: !4939)
!4956 = !DILocation(line: 638, column: 15, scope: !4939)
!4957 = !DILocation(line: 639, column: 19, scope: !4958)
!4958 = distinct !DILexicalBlock(scope: !4939, file: !80, line: 639, column: 9)
!4959 = !DILocation(line: 640, column: 9, scope: !4960)
!4960 = distinct !DILexicalBlock(scope: !4958, file: !80, line: 639, column: 28)
!4961 = !DILocation(line: 641, column: 5, scope: !4960)
!4962 = !DILocation(line: 643, column: 5, scope: !4939)
!4963 = !DILocation(line: 644, column: 32, scope: !4939)
!4964 = !DILocation(line: 644, column: 5, scope: !4939)
!4965 = !DILocation(line: 645, column: 1, scope: !4939)
!4966 = distinct !DISubprogram(name: "br_aes_ct64_keysched", scope: !80, file: !80, line: 403, type: !4967, scopeLine: 403, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!4967 = !DISubroutineType(types: !4968)
!4968 = !{null, !5, !49, !17}
!4969 = !DILocalVariable(name: "comp_skey", arg: 1, scope: !4966, file: !80, line: 403, type: !5)
!4970 = !DILocation(line: 0, scope: !4966)
!4971 = !DILocalVariable(name: "key", arg: 2, scope: !4966, file: !80, line: 403, type: !49)
!4972 = !DILocalVariable(name: "key_len", arg: 3, scope: !4966, file: !80, line: 403, type: !17)
!4973 = !DILocalVariable(name: "skey", scope: !4966, file: !80, line: 406, type: !4974)
!4974 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 1920, elements: !4975)
!4975 = !{!4976}
!4976 = !DISubrange(count: 60)
!4977 = !DILocation(line: 406, column: 14, scope: !4966)
!4978 = !DILocation(line: 410, column: 26, scope: !4966)
!4979 = !DILocalVariable(name: "nrounds", scope: !4966, file: !80, line: 407, type: !17)
!4980 = !DILocation(line: 409, column: 19, scope: !4966)
!4981 = !DILocalVariable(name: "nk", scope: !4966, file: !80, line: 404, type: !17)
!4982 = !DILocalVariable(name: "nkf", scope: !4966, file: !80, line: 404, type: !17)
!4983 = !DILocation(line: 411, column: 37, scope: !4966)
!4984 = !DILocation(line: 411, column: 5, scope: !4966)
!4985 = !DILocation(line: 412, column: 25, scope: !4966)
!4986 = !DILocation(line: 412, column: 31, scope: !4966)
!4987 = !DILocation(line: 412, column: 11, scope: !4966)
!4988 = !DILocalVariable(name: "tmp", scope: !4966, file: !80, line: 405, type: !19)
!4989 = !DILocalVariable(name: "i", scope: !4966, file: !80, line: 404, type: !17)
!4990 = !DILocalVariable(name: "j", scope: !4966, file: !80, line: 404, type: !17)
!4991 = !DILocalVariable(name: "k", scope: !4966, file: !80, line: 404, type: !17)
!4992 = !DILocation(line: 413, column: 10, scope: !4993)
!4993 = distinct !DILexicalBlock(scope: !4966, file: !80, line: 413, column: 5)
!4994 = !DILocation(line: 413, scope: !4993)
!4995 = !DILocation(line: 0, scope: !4993)
!4996 = !DILocation(line: 413, column: 34, scope: !4997)
!4997 = distinct !DILexicalBlock(scope: !4993, file: !80, line: 413, column: 5)
!4998 = !DILocation(line: 413, column: 5, scope: !4993)
!4999 = !DILocation(line: 428, column: 5, scope: !5000)
!5000 = distinct !DILexicalBlock(scope: !4966, file: !80, line: 428, column: 5)
!5001 = !DILocation(line: 414, column: 15, scope: !5002)
!5002 = distinct !DILexicalBlock(scope: !5003, file: !80, line: 414, column: 13)
!5003 = distinct !DILexicalBlock(scope: !4997, file: !80, line: 413, column: 47)
!5004 = !DILocation(line: 415, column: 31, scope: !5005)
!5005 = distinct !DILexicalBlock(scope: !5002, file: !80, line: 414, column: 21)
!5006 = !DILocation(line: 416, column: 19, scope: !5005)
!5007 = !DILocation(line: 416, column: 35, scope: !5005)
!5008 = !DILocation(line: 416, column: 33, scope: !5005)
!5009 = !DILocation(line: 417, column: 9, scope: !5005)
!5010 = !DILocation(line: 417, column: 23, scope: !5011)
!5011 = distinct !DILexicalBlock(scope: !5002, file: !80, line: 417, column: 20)
!5012 = !DILocation(line: 417, column: 27, scope: !5011)
!5013 = !DILocation(line: 418, column: 19, scope: !5014)
!5014 = distinct !DILexicalBlock(scope: !5011, file: !80, line: 417, column: 38)
!5015 = !DILocation(line: 419, column: 9, scope: !5014)
!5016 = !DILocation(line: 0, scope: !5002)
!5017 = !DILocation(line: 420, column: 23, scope: !5003)
!5018 = !DILocation(line: 420, column: 16, scope: !5003)
!5019 = !DILocation(line: 420, column: 13, scope: !5003)
!5020 = !DILocation(line: 421, column: 9, scope: !5003)
!5021 = !DILocation(line: 421, column: 17, scope: !5003)
!5022 = !DILocation(line: 422, column: 13, scope: !5023)
!5023 = distinct !DILexicalBlock(scope: !5003, file: !80, line: 422, column: 13)
!5024 = !DILocation(line: 422, column: 18, scope: !5023)
!5025 = !DILocation(line: 413, column: 43, scope: !4997)
!5026 = !DILocation(line: 413, column: 5, scope: !4997)
!5027 = distinct !{!5027, !4998, !5028, !244}
!5028 = !DILocation(line: 426, column: 5, scope: !4993)
!5029 = !DILocation(line: 428, scope: !5000)
!5030 = !DILocation(line: 428, column: 26, scope: !5031)
!5031 = distinct !DILexicalBlock(scope: !5000, file: !80, line: 428, column: 5)
!5032 = !DILocalVariable(name: "q", scope: !5033, file: !80, line: 429, type: !5034)
!5033 = distinct !DILexicalBlock(scope: !5031, file: !80, line: 428, column: 49)
!5034 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !5035)
!5035 = !{!5036}
!5036 = !DISubrange(count: 8)
!5037 = !DILocation(line: 429, column: 18, scope: !5033)
!5038 = !DILocation(line: 431, column: 43, scope: !5033)
!5039 = !DILocation(line: 431, column: 54, scope: !5033)
!5040 = !DILocation(line: 431, column: 9, scope: !5033)
!5041 = !DILocation(line: 432, column: 16, scope: !5033)
!5042 = !DILocation(line: 432, column: 9, scope: !5033)
!5043 = !DILocation(line: 432, column: 14, scope: !5033)
!5044 = !DILocation(line: 433, column: 9, scope: !5033)
!5045 = !DILocation(line: 433, column: 14, scope: !5033)
!5046 = !DILocation(line: 434, column: 9, scope: !5033)
!5047 = !DILocation(line: 434, column: 14, scope: !5033)
!5048 = !DILocation(line: 435, column: 16, scope: !5033)
!5049 = !DILocation(line: 435, column: 9, scope: !5033)
!5050 = !DILocation(line: 435, column: 14, scope: !5033)
!5051 = !DILocation(line: 436, column: 9, scope: !5033)
!5052 = !DILocation(line: 436, column: 14, scope: !5033)
!5053 = !DILocation(line: 437, column: 9, scope: !5033)
!5054 = !DILocation(line: 437, column: 14, scope: !5033)
!5055 = !DILocation(line: 438, column: 9, scope: !5033)
!5056 = !DILocation(line: 440, column: 14, scope: !5033)
!5057 = !DILocation(line: 440, column: 19, scope: !5033)
!5058 = !DILocation(line: 441, column: 16, scope: !5033)
!5059 = !DILocation(line: 441, column: 21, scope: !5033)
!5060 = !DILocation(line: 441, column: 13, scope: !5033)
!5061 = !DILocation(line: 442, column: 16, scope: !5033)
!5062 = !DILocation(line: 442, column: 21, scope: !5033)
!5063 = !DILocation(line: 442, column: 13, scope: !5033)
!5064 = !DILocation(line: 443, column: 16, scope: !5033)
!5065 = !DILocation(line: 443, column: 21, scope: !5033)
!5066 = !DILocation(line: 443, column: 13, scope: !5033)
!5067 = !DILocation(line: 439, column: 9, scope: !5033)
!5068 = !DILocation(line: 439, column: 26, scope: !5033)
!5069 = !DILocation(line: 445, column: 14, scope: !5033)
!5070 = !DILocation(line: 445, column: 19, scope: !5033)
!5071 = !DILocation(line: 446, column: 16, scope: !5033)
!5072 = !DILocation(line: 446, column: 21, scope: !5033)
!5073 = !DILocation(line: 446, column: 13, scope: !5033)
!5074 = !DILocation(line: 447, column: 16, scope: !5033)
!5075 = !DILocation(line: 447, column: 21, scope: !5033)
!5076 = !DILocation(line: 447, column: 13, scope: !5033)
!5077 = !DILocation(line: 448, column: 16, scope: !5033)
!5078 = !DILocation(line: 448, column: 21, scope: !5033)
!5079 = !DILocation(line: 448, column: 13, scope: !5033)
!5080 = !DILocation(line: 444, column: 21, scope: !5033)
!5081 = !DILocation(line: 444, column: 9, scope: !5033)
!5082 = !DILocation(line: 444, column: 26, scope: !5033)
!5083 = !DILocation(line: 428, column: 35, scope: !5031)
!5084 = !DILocation(line: 428, column: 43, scope: !5031)
!5085 = !DILocation(line: 428, column: 5, scope: !5031)
!5086 = distinct !{!5086, !4999, !5087, !244}
!5087 = !DILocation(line: 449, column: 5, scope: !5000)
!5088 = !DILocation(line: 450, column: 1, scope: !4966)
!5089 = distinct !DISubprogram(name: "br_aes_ct64_skey_expand", scope: !80, file: !80, line: 452, type: !5090, scopeLine: 452, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5090 = !DISubroutineType(types: !5091)
!5091 = !{null, !5, !428, !17}
!5092 = !DILocalVariable(name: "skey", arg: 1, scope: !5089, file: !80, line: 452, type: !5)
!5093 = !DILocation(line: 0, scope: !5089)
!5094 = !DILocalVariable(name: "comp_skey", arg: 2, scope: !5089, file: !80, line: 452, type: !428)
!5095 = !DILocalVariable(name: "nrounds", arg: 3, scope: !5089, file: !80, line: 452, type: !17)
!5096 = !DILocation(line: 455, column: 23, scope: !5089)
!5097 = !DILocalVariable(name: "n", scope: !5089, file: !80, line: 453, type: !17)
!5098 = !DILocalVariable(name: "u", scope: !5089, file: !80, line: 453, type: !17)
!5099 = !DILocalVariable(name: "v", scope: !5089, file: !80, line: 453, type: !17)
!5100 = !DILocation(line: 456, column: 10, scope: !5101)
!5101 = distinct !DILexicalBlock(scope: !5089, file: !80, line: 456, column: 5)
!5102 = !DILocation(line: 456, scope: !5101)
!5103 = !DILocation(line: 456, column: 26, scope: !5104)
!5104 = distinct !DILexicalBlock(scope: !5101, file: !80, line: 456, column: 5)
!5105 = !DILocation(line: 456, column: 5, scope: !5101)
!5106 = !DILocation(line: 459, column: 29, scope: !5107)
!5107 = distinct !DILexicalBlock(scope: !5104, file: !80, line: 456, column: 45)
!5108 = !DILocalVariable(name: "x3", scope: !5107, file: !80, line: 457, type: !6)
!5109 = !DILocation(line: 0, scope: !5107)
!5110 = !DILocalVariable(name: "x2", scope: !5107, file: !80, line: 457, type: !6)
!5111 = !DILocalVariable(name: "x1", scope: !5107, file: !80, line: 457, type: !6)
!5112 = !DILocalVariable(name: "x0", scope: !5107, file: !80, line: 457, type: !6)
!5113 = !DILocation(line: 460, column: 12, scope: !5107)
!5114 = !DILocation(line: 464, column: 12, scope: !5107)
!5115 = !DILocation(line: 465, column: 12, scope: !5107)
!5116 = !DILocation(line: 466, column: 12, scope: !5107)
!5117 = !DILocation(line: 467, column: 33, scope: !5107)
!5118 = !DILocation(line: 467, column: 9, scope: !5107)
!5119 = !DILocation(line: 467, column: 21, scope: !5107)
!5120 = !DILocation(line: 468, column: 33, scope: !5107)
!5121 = !DILocation(line: 468, column: 16, scope: !5107)
!5122 = !DILocation(line: 468, column: 9, scope: !5107)
!5123 = !DILocation(line: 468, column: 21, scope: !5107)
!5124 = !DILocation(line: 469, column: 33, scope: !5107)
!5125 = !DILocation(line: 469, column: 16, scope: !5107)
!5126 = !DILocation(line: 469, column: 9, scope: !5107)
!5127 = !DILocation(line: 469, column: 21, scope: !5107)
!5128 = !DILocation(line: 470, column: 33, scope: !5107)
!5129 = !DILocation(line: 470, column: 16, scope: !5107)
!5130 = !DILocation(line: 470, column: 9, scope: !5107)
!5131 = !DILocation(line: 470, column: 21, scope: !5107)
!5132 = !DILocation(line: 456, column: 33, scope: !5104)
!5133 = !DILocation(line: 456, column: 39, scope: !5104)
!5134 = !DILocation(line: 456, column: 5, scope: !5104)
!5135 = distinct !{!5135, !5105, !5136, !244}
!5136 = !DILocation(line: 471, column: 5, scope: !5101)
!5137 = !DILocation(line: 472, column: 1, scope: !5089)
!5138 = distinct !DISubprogram(name: "br_range_dec32le", scope: !80, file: !80, line: 104, type: !5139, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5139 = !DISubroutineType(types: !5140)
!5140 = !{null, !5141, !15, !49}
!5141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 32)
!5142 = !DILocalVariable(name: "v", arg: 1, scope: !5138, file: !80, line: 104, type: !5141)
!5143 = !DILocation(line: 0, scope: !5138)
!5144 = !DILocalVariable(name: "num", arg: 2, scope: !5138, file: !80, line: 104, type: !15)
!5145 = !DILocalVariable(name: "src", arg: 3, scope: !5138, file: !80, line: 104, type: !49)
!5146 = !DILocation(line: 105, column: 5, scope: !5138)
!5147 = !DILocation(line: 105, column: 18, scope: !5138)
!5148 = !DILocation(line: 105, column: 15, scope: !5138)
!5149 = !DILocation(line: 106, column: 17, scope: !5150)
!5150 = distinct !DILexicalBlock(scope: !5138, file: !80, line: 105, column: 23)
!5151 = !DILocation(line: 106, column: 12, scope: !5150)
!5152 = !DILocation(line: 106, column: 15, scope: !5150)
!5153 = !DILocation(line: 107, column: 13, scope: !5150)
!5154 = distinct !{!5154, !5146, !5155, !244}
!5155 = !DILocation(line: 108, column: 5, scope: !5138)
!5156 = !DILocation(line: 109, column: 1, scope: !5138)
!5157 = distinct !DISubprogram(name: "sub_word", scope: !80, file: !80, line: 392, type: !5158, scopeLine: 392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5158 = !DISubroutineType(types: !5159)
!5159 = !{!19, !19}
!5160 = !DILocalVariable(name: "x", arg: 1, scope: !5157, file: !80, line: 392, type: !19)
!5161 = !DILocation(line: 0, scope: !5157)
!5162 = !DILocalVariable(name: "q", scope: !5157, file: !80, line: 393, type: !5034)
!5163 = !DILocation(line: 393, column: 14, scope: !5157)
!5164 = !DILocation(line: 395, column: 5, scope: !5157)
!5165 = !DILocation(line: 396, column: 12, scope: !5157)
!5166 = !DILocation(line: 396, column: 10, scope: !5157)
!5167 = !DILocation(line: 397, column: 5, scope: !5157)
!5168 = !DILocation(line: 398, column: 5, scope: !5157)
!5169 = !DILocation(line: 399, column: 5, scope: !5157)
!5170 = !DILocation(line: 400, column: 22, scope: !5157)
!5171 = !DILocation(line: 400, column: 12, scope: !5157)
!5172 = !DILocation(line: 400, column: 5, scope: !5157)
!5173 = distinct !DISubprogram(name: "br_aes_ct64_interleave_in", scope: !80, file: !80, line: 339, type: !5174, scopeLine: 339, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5174 = !DISubroutineType(types: !5175)
!5175 = !{null, !5, !5, !5176}
!5176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5177, size: 32)
!5177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!5178 = !DILocalVariable(name: "q0", arg: 1, scope: !5173, file: !80, line: 339, type: !5)
!5179 = !DILocation(line: 0, scope: !5173)
!5180 = !DILocalVariable(name: "q1", arg: 2, scope: !5173, file: !80, line: 339, type: !5)
!5181 = !DILocalVariable(name: "w", arg: 3, scope: !5173, file: !80, line: 339, type: !5176)
!5182 = !DILocation(line: 342, column: 10, scope: !5173)
!5183 = !DILocalVariable(name: "x0", scope: !5173, file: !80, line: 340, type: !6)
!5184 = !DILocation(line: 343, column: 10, scope: !5173)
!5185 = !DILocalVariable(name: "x1", scope: !5173, file: !80, line: 340, type: !6)
!5186 = !DILocation(line: 344, column: 10, scope: !5173)
!5187 = !DILocalVariable(name: "x2", scope: !5173, file: !80, line: 340, type: !6)
!5188 = !DILocation(line: 345, column: 10, scope: !5173)
!5189 = !DILocalVariable(name: "x3", scope: !5173, file: !80, line: 340, type: !6)
!5190 = !DILocation(line: 346, column: 15, scope: !5173)
!5191 = !DILocation(line: 346, column: 8, scope: !5173)
!5192 = !DILocation(line: 347, column: 15, scope: !5173)
!5193 = !DILocation(line: 347, column: 8, scope: !5173)
!5194 = !DILocation(line: 348, column: 15, scope: !5173)
!5195 = !DILocation(line: 348, column: 8, scope: !5173)
!5196 = !DILocation(line: 349, column: 15, scope: !5173)
!5197 = !DILocation(line: 349, column: 8, scope: !5173)
!5198 = !DILocation(line: 350, column: 8, scope: !5173)
!5199 = !DILocation(line: 351, column: 8, scope: !5173)
!5200 = !DILocation(line: 352, column: 8, scope: !5173)
!5201 = !DILocation(line: 353, column: 8, scope: !5173)
!5202 = !DILocation(line: 354, column: 15, scope: !5173)
!5203 = !DILocation(line: 354, column: 8, scope: !5173)
!5204 = !DILocation(line: 355, column: 15, scope: !5173)
!5205 = !DILocation(line: 355, column: 8, scope: !5173)
!5206 = !DILocation(line: 358, column: 8, scope: !5173)
!5207 = !DILocation(line: 359, column: 8, scope: !5173)
!5208 = !DILocation(line: 362, column: 20, scope: !5173)
!5209 = !DILocation(line: 362, column: 14, scope: !5173)
!5210 = !DILocation(line: 362, column: 9, scope: !5173)
!5211 = !DILocation(line: 363, column: 20, scope: !5173)
!5212 = !DILocation(line: 363, column: 14, scope: !5173)
!5213 = !DILocation(line: 363, column: 9, scope: !5173)
!5214 = !DILocation(line: 364, column: 1, scope: !5173)
!5215 = distinct !DISubprogram(name: "br_aes_ct64_ortho", scope: !80, file: !80, line: 309, type: !26, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5216 = !DILocalVariable(name: "q", arg: 1, scope: !5215, file: !80, line: 309, type: !5)
!5217 = !DILocation(line: 0, scope: !5215)
!5218 = !DILocation(line: 322, column: 5, scope: !5219)
!5219 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 322, column: 5)
!5220 = !DILocalVariable(name: "a", scope: !5219, file: !80, line: 322, type: !6)
!5221 = !DILocation(line: 0, scope: !5219)
!5222 = !DILocalVariable(name: "b", scope: !5219, file: !80, line: 322, type: !6)
!5223 = !DILocation(line: 323, column: 5, scope: !5224)
!5224 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 323, column: 5)
!5225 = !DILocalVariable(name: "a", scope: !5224, file: !80, line: 323, type: !6)
!5226 = !DILocation(line: 0, scope: !5224)
!5227 = !DILocalVariable(name: "b", scope: !5224, file: !80, line: 323, type: !6)
!5228 = !DILocation(line: 324, column: 5, scope: !5229)
!5229 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 324, column: 5)
!5230 = !DILocalVariable(name: "a", scope: !5229, file: !80, line: 324, type: !6)
!5231 = !DILocation(line: 0, scope: !5229)
!5232 = !DILocalVariable(name: "b", scope: !5229, file: !80, line: 324, type: !6)
!5233 = !DILocation(line: 325, column: 5, scope: !5234)
!5234 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 325, column: 5)
!5235 = !DILocalVariable(name: "a", scope: !5234, file: !80, line: 325, type: !6)
!5236 = !DILocation(line: 0, scope: !5234)
!5237 = !DILocalVariable(name: "b", scope: !5234, file: !80, line: 325, type: !6)
!5238 = !DILocation(line: 327, column: 5, scope: !5239)
!5239 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 327, column: 5)
!5240 = !DILocalVariable(name: "a", scope: !5239, file: !80, line: 327, type: !6)
!5241 = !DILocation(line: 0, scope: !5239)
!5242 = !DILocalVariable(name: "b", scope: !5239, file: !80, line: 327, type: !6)
!5243 = !DILocation(line: 328, column: 5, scope: !5244)
!5244 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 328, column: 5)
!5245 = !DILocalVariable(name: "a", scope: !5244, file: !80, line: 328, type: !6)
!5246 = !DILocation(line: 0, scope: !5244)
!5247 = !DILocalVariable(name: "b", scope: !5244, file: !80, line: 328, type: !6)
!5248 = !DILocation(line: 329, column: 5, scope: !5249)
!5249 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 329, column: 5)
!5250 = !DILocalVariable(name: "a", scope: !5249, file: !80, line: 329, type: !6)
!5251 = !DILocation(line: 0, scope: !5249)
!5252 = !DILocalVariable(name: "b", scope: !5249, file: !80, line: 329, type: !6)
!5253 = !DILocation(line: 330, column: 5, scope: !5254)
!5254 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 330, column: 5)
!5255 = !DILocalVariable(name: "a", scope: !5254, file: !80, line: 330, type: !6)
!5256 = !DILocation(line: 0, scope: !5254)
!5257 = !DILocalVariable(name: "b", scope: !5254, file: !80, line: 330, type: !6)
!5258 = !DILocation(line: 332, column: 5, scope: !5259)
!5259 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 332, column: 5)
!5260 = !DILocalVariable(name: "a", scope: !5259, file: !80, line: 332, type: !6)
!5261 = !DILocation(line: 0, scope: !5259)
!5262 = !DILocalVariable(name: "b", scope: !5259, file: !80, line: 332, type: !6)
!5263 = !DILocation(line: 333, column: 5, scope: !5264)
!5264 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 333, column: 5)
!5265 = !DILocalVariable(name: "a", scope: !5264, file: !80, line: 333, type: !6)
!5266 = !DILocation(line: 0, scope: !5264)
!5267 = !DILocalVariable(name: "b", scope: !5264, file: !80, line: 333, type: !6)
!5268 = !DILocation(line: 334, column: 5, scope: !5269)
!5269 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 334, column: 5)
!5270 = !DILocalVariable(name: "a", scope: !5269, file: !80, line: 334, type: !6)
!5271 = !DILocation(line: 0, scope: !5269)
!5272 = !DILocalVariable(name: "b", scope: !5269, file: !80, line: 334, type: !6)
!5273 = !DILocation(line: 335, column: 5, scope: !5274)
!5274 = distinct !DILexicalBlock(scope: !5215, file: !80, line: 335, column: 5)
!5275 = !DILocalVariable(name: "a", scope: !5274, file: !80, line: 335, type: !6)
!5276 = !DILocation(line: 0, scope: !5274)
!5277 = !DILocalVariable(name: "b", scope: !5274, file: !80, line: 335, type: !6)
!5278 = !DILocation(line: 336, column: 1, scope: !5215)
!5279 = distinct !DISubprogram(name: "br_aes_ct64_bitslice_Sbox", scope: !80, file: !80, line: 135, type: !26, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5280 = !DILocalVariable(name: "q", arg: 1, scope: !5279, file: !80, line: 135, type: !5)
!5281 = !DILocation(line: 0, scope: !5279)
!5282 = !DILocation(line: 161, column: 10, scope: !5279)
!5283 = !DILocalVariable(name: "x0", scope: !5279, file: !80, line: 146, type: !6)
!5284 = !DILocation(line: 162, column: 10, scope: !5279)
!5285 = !DILocalVariable(name: "x1", scope: !5279, file: !80, line: 146, type: !6)
!5286 = !DILocation(line: 163, column: 10, scope: !5279)
!5287 = !DILocalVariable(name: "x2", scope: !5279, file: !80, line: 146, type: !6)
!5288 = !DILocation(line: 164, column: 10, scope: !5279)
!5289 = !DILocalVariable(name: "x3", scope: !5279, file: !80, line: 146, type: !6)
!5290 = !DILocation(line: 165, column: 10, scope: !5279)
!5291 = !DILocalVariable(name: "x4", scope: !5279, file: !80, line: 146, type: !6)
!5292 = !DILocation(line: 166, column: 10, scope: !5279)
!5293 = !DILocalVariable(name: "x5", scope: !5279, file: !80, line: 146, type: !6)
!5294 = !DILocation(line: 167, column: 10, scope: !5279)
!5295 = !DILocalVariable(name: "x6", scope: !5279, file: !80, line: 146, type: !6)
!5296 = !DILocation(line: 168, column: 10, scope: !5279)
!5297 = !DILocalVariable(name: "x7", scope: !5279, file: !80, line: 146, type: !6)
!5298 = !DILocation(line: 173, column: 14, scope: !5279)
!5299 = !DILocalVariable(name: "y14", scope: !5279, file: !80, line: 148, type: !6)
!5300 = !DILocation(line: 174, column: 14, scope: !5279)
!5301 = !DILocalVariable(name: "y13", scope: !5279, file: !80, line: 148, type: !6)
!5302 = !DILocation(line: 175, column: 13, scope: !5279)
!5303 = !DILocalVariable(name: "y9", scope: !5279, file: !80, line: 147, type: !6)
!5304 = !DILocation(line: 176, column: 13, scope: !5279)
!5305 = !DILocalVariable(name: "y8", scope: !5279, file: !80, line: 147, type: !6)
!5306 = !DILocation(line: 177, column: 13, scope: !5279)
!5307 = !DILocalVariable(name: "t0", scope: !5279, file: !80, line: 152, type: !6)
!5308 = !DILocation(line: 178, column: 13, scope: !5279)
!5309 = !DILocalVariable(name: "y1", scope: !5279, file: !80, line: 147, type: !6)
!5310 = !DILocation(line: 179, column: 13, scope: !5279)
!5311 = !DILocalVariable(name: "y4", scope: !5279, file: !80, line: 147, type: !6)
!5312 = !DILocation(line: 180, column: 15, scope: !5279)
!5313 = !DILocalVariable(name: "y12", scope: !5279, file: !80, line: 148, type: !6)
!5314 = !DILocation(line: 181, column: 13, scope: !5279)
!5315 = !DILocalVariable(name: "y2", scope: !5279, file: !80, line: 147, type: !6)
!5316 = !DILocation(line: 182, column: 13, scope: !5279)
!5317 = !DILocalVariable(name: "y5", scope: !5279, file: !80, line: 147, type: !6)
!5318 = !DILocation(line: 183, column: 13, scope: !5279)
!5319 = !DILocalVariable(name: "y3", scope: !5279, file: !80, line: 147, type: !6)
!5320 = !DILocation(line: 184, column: 13, scope: !5279)
!5321 = !DILocalVariable(name: "t1", scope: !5279, file: !80, line: 152, type: !6)
!5322 = !DILocation(line: 185, column: 14, scope: !5279)
!5323 = !DILocalVariable(name: "y15", scope: !5279, file: !80, line: 148, type: !6)
!5324 = !DILocation(line: 186, column: 14, scope: !5279)
!5325 = !DILocalVariable(name: "y20", scope: !5279, file: !80, line: 149, type: !6)
!5326 = !DILocation(line: 187, column: 14, scope: !5279)
!5327 = !DILocalVariable(name: "y6", scope: !5279, file: !80, line: 147, type: !6)
!5328 = !DILocation(line: 188, column: 15, scope: !5279)
!5329 = !DILocalVariable(name: "y10", scope: !5279, file: !80, line: 148, type: !6)
!5330 = !DILocation(line: 189, column: 15, scope: !5279)
!5331 = !DILocalVariable(name: "y11", scope: !5279, file: !80, line: 148, type: !6)
!5332 = !DILocation(line: 190, column: 13, scope: !5279)
!5333 = !DILocalVariable(name: "y7", scope: !5279, file: !80, line: 147, type: !6)
!5334 = !DILocation(line: 191, column: 15, scope: !5279)
!5335 = !DILocalVariable(name: "y17", scope: !5279, file: !80, line: 148, type: !6)
!5336 = !DILocalVariable(name: "y19", scope: !5279, file: !80, line: 148, type: !6)
!5337 = !DILocation(line: 193, column: 14, scope: !5279)
!5338 = !DILocalVariable(name: "y16", scope: !5279, file: !80, line: 148, type: !6)
!5339 = !DILocalVariable(name: "y21", scope: !5279, file: !80, line: 149, type: !6)
!5340 = !DILocalVariable(name: "y18", scope: !5279, file: !80, line: 148, type: !6)
!5341 = !DILocation(line: 200, column: 14, scope: !5279)
!5342 = !DILocalVariable(name: "t2", scope: !5279, file: !80, line: 152, type: !6)
!5343 = !DILocation(line: 201, column: 13, scope: !5279)
!5344 = !DILocalVariable(name: "t3", scope: !5279, file: !80, line: 152, type: !6)
!5345 = !DILocation(line: 202, column: 13, scope: !5279)
!5346 = !DILocalVariable(name: "t4", scope: !5279, file: !80, line: 152, type: !6)
!5347 = !DILocation(line: 203, column: 13, scope: !5279)
!5348 = !DILocalVariable(name: "t5", scope: !5279, file: !80, line: 152, type: !6)
!5349 = !DILocalVariable(name: "t6", scope: !5279, file: !80, line: 152, type: !6)
!5350 = !DILocation(line: 205, column: 14, scope: !5279)
!5351 = !DILocalVariable(name: "t7", scope: !5279, file: !80, line: 152, type: !6)
!5352 = !DILocation(line: 206, column: 13, scope: !5279)
!5353 = !DILocalVariable(name: "t8", scope: !5279, file: !80, line: 152, type: !6)
!5354 = !DILocalVariable(name: "t9", scope: !5279, file: !80, line: 152, type: !6)
!5355 = !DILocation(line: 208, column: 14, scope: !5279)
!5356 = !DILocalVariable(name: "t10", scope: !5279, file: !80, line: 153, type: !6)
!5357 = !DILocalVariable(name: "t11", scope: !5279, file: !80, line: 153, type: !6)
!5358 = !DILocation(line: 210, column: 14, scope: !5279)
!5359 = !DILocalVariable(name: "t12", scope: !5279, file: !80, line: 153, type: !6)
!5360 = !DILocation(line: 211, column: 15, scope: !5279)
!5361 = !DILocalVariable(name: "t13", scope: !5279, file: !80, line: 153, type: !6)
!5362 = !DILocation(line: 212, column: 15, scope: !5279)
!5363 = !DILocalVariable(name: "t14", scope: !5279, file: !80, line: 153, type: !6)
!5364 = !DILocation(line: 213, column: 14, scope: !5279)
!5365 = !DILocalVariable(name: "t15", scope: !5279, file: !80, line: 153, type: !6)
!5366 = !DILocation(line: 214, column: 15, scope: !5279)
!5367 = !DILocalVariable(name: "t16", scope: !5279, file: !80, line: 153, type: !6)
!5368 = !DILocation(line: 215, column: 14, scope: !5279)
!5369 = !DILocalVariable(name: "t17", scope: !5279, file: !80, line: 153, type: !6)
!5370 = !DILocalVariable(name: "t18", scope: !5279, file: !80, line: 153, type: !6)
!5371 = !DILocalVariable(name: "t19", scope: !5279, file: !80, line: 153, type: !6)
!5372 = !DILocalVariable(name: "t20", scope: !5279, file: !80, line: 154, type: !6)
!5373 = !DILocation(line: 219, column: 15, scope: !5279)
!5374 = !DILocalVariable(name: "t21", scope: !5279, file: !80, line: 154, type: !6)
!5375 = !DILocation(line: 220, column: 15, scope: !5279)
!5376 = !DILocalVariable(name: "t22", scope: !5279, file: !80, line: 154, type: !6)
!5377 = !DILocation(line: 221, column: 15, scope: !5279)
!5378 = !DILocalVariable(name: "t23", scope: !5279, file: !80, line: 154, type: !6)
!5379 = !DILocation(line: 222, column: 15, scope: !5279)
!5380 = !DILocalVariable(name: "t24", scope: !5279, file: !80, line: 154, type: !6)
!5381 = !DILocation(line: 224, column: 15, scope: !5279)
!5382 = !DILocalVariable(name: "t25", scope: !5279, file: !80, line: 154, type: !6)
!5383 = !DILocation(line: 225, column: 15, scope: !5279)
!5384 = !DILocalVariable(name: "t26", scope: !5279, file: !80, line: 154, type: !6)
!5385 = !DILocation(line: 226, column: 15, scope: !5279)
!5386 = !DILocalVariable(name: "t27", scope: !5279, file: !80, line: 154, type: !6)
!5387 = !DILocation(line: 227, column: 15, scope: !5279)
!5388 = !DILocalVariable(name: "t28", scope: !5279, file: !80, line: 154, type: !6)
!5389 = !DILocation(line: 228, column: 15, scope: !5279)
!5390 = !DILocalVariable(name: "t29", scope: !5279, file: !80, line: 154, type: !6)
!5391 = !DILocation(line: 229, column: 15, scope: !5279)
!5392 = !DILocalVariable(name: "t30", scope: !5279, file: !80, line: 155, type: !6)
!5393 = !DILocation(line: 230, column: 15, scope: !5279)
!5394 = !DILocalVariable(name: "t31", scope: !5279, file: !80, line: 155, type: !6)
!5395 = !DILocation(line: 231, column: 15, scope: !5279)
!5396 = !DILocalVariable(name: "t32", scope: !5279, file: !80, line: 155, type: !6)
!5397 = !DILocation(line: 232, column: 15, scope: !5279)
!5398 = !DILocalVariable(name: "t33", scope: !5279, file: !80, line: 155, type: !6)
!5399 = !DILocation(line: 233, column: 15, scope: !5279)
!5400 = !DILocalVariable(name: "t34", scope: !5279, file: !80, line: 155, type: !6)
!5401 = !DILocation(line: 234, column: 15, scope: !5279)
!5402 = !DILocalVariable(name: "t35", scope: !5279, file: !80, line: 155, type: !6)
!5403 = !DILocation(line: 235, column: 15, scope: !5279)
!5404 = !DILocalVariable(name: "t36", scope: !5279, file: !80, line: 155, type: !6)
!5405 = !DILocation(line: 236, column: 15, scope: !5279)
!5406 = !DILocalVariable(name: "t37", scope: !5279, file: !80, line: 155, type: !6)
!5407 = !DILocation(line: 237, column: 15, scope: !5279)
!5408 = !DILocalVariable(name: "t38", scope: !5279, file: !80, line: 155, type: !6)
!5409 = !DILocation(line: 238, column: 15, scope: !5279)
!5410 = !DILocalVariable(name: "t39", scope: !5279, file: !80, line: 155, type: !6)
!5411 = !DILocation(line: 239, column: 15, scope: !5279)
!5412 = !DILocalVariable(name: "t40", scope: !5279, file: !80, line: 156, type: !6)
!5413 = !DILocation(line: 241, column: 15, scope: !5279)
!5414 = !DILocalVariable(name: "t41", scope: !5279, file: !80, line: 156, type: !6)
!5415 = !DILocation(line: 242, column: 15, scope: !5279)
!5416 = !DILocalVariable(name: "t42", scope: !5279, file: !80, line: 156, type: !6)
!5417 = !DILocation(line: 243, column: 15, scope: !5279)
!5418 = !DILocalVariable(name: "t43", scope: !5279, file: !80, line: 156, type: !6)
!5419 = !DILocation(line: 244, column: 15, scope: !5279)
!5420 = !DILocalVariable(name: "t44", scope: !5279, file: !80, line: 156, type: !6)
!5421 = !DILocation(line: 245, column: 15, scope: !5279)
!5422 = !DILocalVariable(name: "t45", scope: !5279, file: !80, line: 156, type: !6)
!5423 = !DILocation(line: 246, column: 14, scope: !5279)
!5424 = !DILocalVariable(name: "z0", scope: !5279, file: !80, line: 150, type: !6)
!5425 = !DILocation(line: 247, column: 14, scope: !5279)
!5426 = !DILocalVariable(name: "z1", scope: !5279, file: !80, line: 150, type: !6)
!5427 = !DILocation(line: 248, column: 14, scope: !5279)
!5428 = !DILocalVariable(name: "z2", scope: !5279, file: !80, line: 150, type: !6)
!5429 = !DILocation(line: 249, column: 14, scope: !5279)
!5430 = !DILocalVariable(name: "z3", scope: !5279, file: !80, line: 150, type: !6)
!5431 = !DILocation(line: 250, column: 14, scope: !5279)
!5432 = !DILocalVariable(name: "z4", scope: !5279, file: !80, line: 150, type: !6)
!5433 = !DILocation(line: 251, column: 14, scope: !5279)
!5434 = !DILocalVariable(name: "z5", scope: !5279, file: !80, line: 150, type: !6)
!5435 = !DILocation(line: 252, column: 14, scope: !5279)
!5436 = !DILocalVariable(name: "z6", scope: !5279, file: !80, line: 150, type: !6)
!5437 = !DILocation(line: 253, column: 14, scope: !5279)
!5438 = !DILocalVariable(name: "z7", scope: !5279, file: !80, line: 150, type: !6)
!5439 = !DILocation(line: 254, column: 14, scope: !5279)
!5440 = !DILocalVariable(name: "z8", scope: !5279, file: !80, line: 150, type: !6)
!5441 = !DILocation(line: 255, column: 14, scope: !5279)
!5442 = !DILocalVariable(name: "z9", scope: !5279, file: !80, line: 150, type: !6)
!5443 = !DILocation(line: 256, column: 15, scope: !5279)
!5444 = !DILocalVariable(name: "z10", scope: !5279, file: !80, line: 151, type: !6)
!5445 = !DILocation(line: 257, column: 15, scope: !5279)
!5446 = !DILocalVariable(name: "z11", scope: !5279, file: !80, line: 151, type: !6)
!5447 = !DILocation(line: 258, column: 15, scope: !5279)
!5448 = !DILocalVariable(name: "z12", scope: !5279, file: !80, line: 151, type: !6)
!5449 = !DILocation(line: 259, column: 15, scope: !5279)
!5450 = !DILocalVariable(name: "z13", scope: !5279, file: !80, line: 151, type: !6)
!5451 = !DILocation(line: 260, column: 15, scope: !5279)
!5452 = !DILocalVariable(name: "z14", scope: !5279, file: !80, line: 151, type: !6)
!5453 = !DILocation(line: 261, column: 15, scope: !5279)
!5454 = !DILocalVariable(name: "z15", scope: !5279, file: !80, line: 151, type: !6)
!5455 = !DILocation(line: 262, column: 15, scope: !5279)
!5456 = !DILocalVariable(name: "z16", scope: !5279, file: !80, line: 151, type: !6)
!5457 = !DILocation(line: 263, column: 15, scope: !5279)
!5458 = !DILocalVariable(name: "z17", scope: !5279, file: !80, line: 151, type: !6)
!5459 = !DILocation(line: 268, column: 15, scope: !5279)
!5460 = !DILocalVariable(name: "t46", scope: !5279, file: !80, line: 156, type: !6)
!5461 = !DILocation(line: 269, column: 15, scope: !5279)
!5462 = !DILocalVariable(name: "t47", scope: !5279, file: !80, line: 156, type: !6)
!5463 = !DILocation(line: 270, column: 14, scope: !5279)
!5464 = !DILocalVariable(name: "t48", scope: !5279, file: !80, line: 156, type: !6)
!5465 = !DILocation(line: 271, column: 14, scope: !5279)
!5466 = !DILocalVariable(name: "t49", scope: !5279, file: !80, line: 156, type: !6)
!5467 = !DILocation(line: 272, column: 14, scope: !5279)
!5468 = !DILocalVariable(name: "t50", scope: !5279, file: !80, line: 157, type: !6)
!5469 = !DILocation(line: 273, column: 14, scope: !5279)
!5470 = !DILocalVariable(name: "t51", scope: !5279, file: !80, line: 157, type: !6)
!5471 = !DILocation(line: 274, column: 14, scope: !5279)
!5472 = !DILocalVariable(name: "t52", scope: !5279, file: !80, line: 157, type: !6)
!5473 = !DILocation(line: 275, column: 14, scope: !5279)
!5474 = !DILocalVariable(name: "t53", scope: !5279, file: !80, line: 157, type: !6)
!5475 = !DILocation(line: 276, column: 14, scope: !5279)
!5476 = !DILocalVariable(name: "t54", scope: !5279, file: !80, line: 157, type: !6)
!5477 = !DILocation(line: 277, column: 15, scope: !5279)
!5478 = !DILocalVariable(name: "t55", scope: !5279, file: !80, line: 157, type: !6)
!5479 = !DILocation(line: 278, column: 15, scope: !5279)
!5480 = !DILocalVariable(name: "t56", scope: !5279, file: !80, line: 157, type: !6)
!5481 = !DILocation(line: 279, column: 15, scope: !5279)
!5482 = !DILocalVariable(name: "t57", scope: !5279, file: !80, line: 157, type: !6)
!5483 = !DILocation(line: 280, column: 14, scope: !5279)
!5484 = !DILocalVariable(name: "t58", scope: !5279, file: !80, line: 157, type: !6)
!5485 = !DILocation(line: 281, column: 14, scope: !5279)
!5486 = !DILocalVariable(name: "t59", scope: !5279, file: !80, line: 157, type: !6)
!5487 = !DILocation(line: 282, column: 15, scope: !5279)
!5488 = !DILocalVariable(name: "t60", scope: !5279, file: !80, line: 158, type: !6)
!5489 = !DILocation(line: 283, column: 15, scope: !5279)
!5490 = !DILocalVariable(name: "t61", scope: !5279, file: !80, line: 158, type: !6)
!5491 = !DILocation(line: 284, column: 15, scope: !5279)
!5492 = !DILocalVariable(name: "t62", scope: !5279, file: !80, line: 158, type: !6)
!5493 = !DILocation(line: 285, column: 15, scope: !5279)
!5494 = !DILocalVariable(name: "t63", scope: !5279, file: !80, line: 158, type: !6)
!5495 = !DILocation(line: 286, column: 14, scope: !5279)
!5496 = !DILocalVariable(name: "t64", scope: !5279, file: !80, line: 158, type: !6)
!5497 = !DILocation(line: 287, column: 15, scope: !5279)
!5498 = !DILocalVariable(name: "t65", scope: !5279, file: !80, line: 158, type: !6)
!5499 = !DILocation(line: 288, column: 14, scope: !5279)
!5500 = !DILocalVariable(name: "t66", scope: !5279, file: !80, line: 158, type: !6)
!5501 = !DILocation(line: 289, column: 14, scope: !5279)
!5502 = !DILocalVariable(name: "s0", scope: !5279, file: !80, line: 159, type: !6)
!5503 = !DILocation(line: 290, column: 14, scope: !5279)
!5504 = !DILocalVariable(name: "s6", scope: !5279, file: !80, line: 159, type: !6)
!5505 = !DILocation(line: 291, column: 14, scope: !5279)
!5506 = !DILocalVariable(name: "s7", scope: !5279, file: !80, line: 159, type: !6)
!5507 = !DILocalVariable(name: "t67", scope: !5279, file: !80, line: 158, type: !6)
!5508 = !DILocation(line: 293, column: 14, scope: !5279)
!5509 = !DILocalVariable(name: "s3", scope: !5279, file: !80, line: 159, type: !6)
!5510 = !DILocation(line: 294, column: 14, scope: !5279)
!5511 = !DILocalVariable(name: "s4", scope: !5279, file: !80, line: 159, type: !6)
!5512 = !DILocation(line: 295, column: 14, scope: !5279)
!5513 = !DILocalVariable(name: "s5", scope: !5279, file: !80, line: 159, type: !6)
!5514 = !DILocation(line: 296, column: 14, scope: !5279)
!5515 = !DILocalVariable(name: "s1", scope: !5279, file: !80, line: 159, type: !6)
!5516 = !DILocation(line: 297, column: 14, scope: !5279)
!5517 = !DILocalVariable(name: "s2", scope: !5279, file: !80, line: 159, type: !6)
!5518 = !DILocation(line: 299, column: 5, scope: !5279)
!5519 = !DILocation(line: 299, column: 10, scope: !5279)
!5520 = !DILocation(line: 300, column: 5, scope: !5279)
!5521 = !DILocation(line: 300, column: 10, scope: !5279)
!5522 = !DILocation(line: 301, column: 5, scope: !5279)
!5523 = !DILocation(line: 301, column: 10, scope: !5279)
!5524 = !DILocation(line: 302, column: 5, scope: !5279)
!5525 = !DILocation(line: 302, column: 10, scope: !5279)
!5526 = !DILocation(line: 303, column: 5, scope: !5279)
!5527 = !DILocation(line: 303, column: 10, scope: !5279)
!5528 = !DILocation(line: 304, column: 5, scope: !5279)
!5529 = !DILocation(line: 304, column: 10, scope: !5279)
!5530 = !DILocation(line: 305, column: 5, scope: !5279)
!5531 = !DILocation(line: 305, column: 10, scope: !5279)
!5532 = !DILocation(line: 306, column: 10, scope: !5279)
!5533 = !DILocation(line: 307, column: 1, scope: !5279)
!5534 = distinct !DISubprogram(name: "br_dec32le", scope: !80, file: !80, line: 96, type: !5535, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5535 = !DISubroutineType(types: !5536)
!5536 = !{!19, !49}
!5537 = !DILocalVariable(name: "src", arg: 1, scope: !5534, file: !80, line: 96, type: !49)
!5538 = !DILocation(line: 0, scope: !5534)
!5539 = !DILocation(line: 97, column: 22, scope: !5534)
!5540 = !DILocation(line: 97, column: 12, scope: !5534)
!5541 = !DILocation(line: 98, column: 25, scope: !5534)
!5542 = !DILocation(line: 98, column: 15, scope: !5534)
!5543 = !DILocation(line: 98, column: 32, scope: !5534)
!5544 = !DILocation(line: 98, column: 12, scope: !5534)
!5545 = !DILocation(line: 99, column: 25, scope: !5534)
!5546 = !DILocation(line: 99, column: 15, scope: !5534)
!5547 = !DILocation(line: 99, column: 32, scope: !5534)
!5548 = !DILocation(line: 99, column: 12, scope: !5534)
!5549 = !DILocation(line: 100, column: 25, scope: !5534)
!5550 = !DILocation(line: 100, column: 15, scope: !5534)
!5551 = !DILocation(line: 100, column: 32, scope: !5534)
!5552 = !DILocation(line: 100, column: 12, scope: !5534)
!5553 = !DILocation(line: 97, column: 5, scope: !5534)
!5554 = distinct !DISubprogram(name: "aes128_ctr_keyexp", scope: !80, file: !80, line: 647, type: !4940, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5555 = !DILocalVariable(name: "r", arg: 1, scope: !5554, file: !80, line: 647, type: !4942)
!5556 = !DILocation(line: 0, scope: !5554)
!5557 = !DILocalVariable(name: "key", arg: 2, scope: !5554, file: !80, line: 647, type: !49)
!5558 = !DILocation(line: 648, column: 5, scope: !5554)
!5559 = !DILocation(line: 649, column: 1, scope: !5554)
!5560 = distinct !DISubprogram(name: "aes192_ecb_keyexp", scope: !80, file: !80, line: 652, type: !5561, scopeLine: 652, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5561 = !DISubroutineType(types: !5562)
!5562 = !{null, !5563, !49}
!5563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5564, size: 32)
!5564 = !DIDerivedType(tag: DW_TAG_typedef, name: "aes192ctx", file: !80, line: 51, baseType: !5565)
!5565 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !80, line: 49, size: 32, elements: !5566)
!5566 = !{!5567}
!5567 = !DIDerivedType(tag: DW_TAG_member, name: "sk_exp", scope: !5565, file: !80, line: 50, baseType: !5, size: 32)
!5568 = !DILocalVariable(name: "r", arg: 1, scope: !5560, file: !80, line: 652, type: !5563)
!5569 = !DILocation(line: 0, scope: !5560)
!5570 = !DILocalVariable(name: "key", arg: 2, scope: !5560, file: !80, line: 652, type: !49)
!5571 = !DILocalVariable(name: "skey", scope: !5560, file: !80, line: 653, type: !5572)
!5572 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1664, elements: !5573)
!5573 = !{!5574}
!5574 = !DISubrange(count: 26)
!5575 = !DILocation(line: 653, column: 14, scope: !5560)
!5576 = !DILocation(line: 654, column: 17, scope: !5560)
!5577 = !DILocation(line: 654, column: 15, scope: !5560)
!5578 = !DILocation(line: 655, column: 19, scope: !5579)
!5579 = distinct !DILexicalBlock(scope: !5560, file: !80, line: 655, column: 9)
!5580 = !DILocation(line: 656, column: 9, scope: !5581)
!5581 = distinct !DILexicalBlock(scope: !5579, file: !80, line: 655, column: 28)
!5582 = !DILocation(line: 657, column: 5, scope: !5581)
!5583 = !DILocation(line: 659, column: 5, scope: !5560)
!5584 = !DILocation(line: 660, column: 32, scope: !5560)
!5585 = !DILocation(line: 660, column: 5, scope: !5560)
!5586 = !DILocation(line: 661, column: 1, scope: !5560)
!5587 = distinct !DISubprogram(name: "aes192_ctr_keyexp", scope: !80, file: !80, line: 664, type: !5561, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5588 = !DILocalVariable(name: "r", arg: 1, scope: !5587, file: !80, line: 664, type: !5563)
!5589 = !DILocation(line: 0, scope: !5587)
!5590 = !DILocalVariable(name: "key", arg: 2, scope: !5587, file: !80, line: 664, type: !49)
!5591 = !DILocation(line: 665, column: 5, scope: !5587)
!5592 = !DILocation(line: 666, column: 1, scope: !5587)
!5593 = distinct !DISubprogram(name: "aes256_ecb_keyexp", scope: !80, file: !80, line: 669, type: !5594, scopeLine: 669, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5594 = !DISubroutineType(types: !5595)
!5595 = !{null, !5596, !49}
!5596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5597, size: 32)
!5597 = !DIDerivedType(tag: DW_TAG_typedef, name: "aes256ctx", file: !80, line: 56, baseType: !5598)
!5598 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !80, line: 54, size: 32, elements: !5599)
!5599 = !{!5600}
!5600 = !DIDerivedType(tag: DW_TAG_member, name: "sk_exp", scope: !5598, file: !80, line: 55, baseType: !5, size: 32)
!5601 = !DILocalVariable(name: "r", arg: 1, scope: !5593, file: !80, line: 669, type: !5596)
!5602 = !DILocation(line: 0, scope: !5593)
!5603 = !DILocalVariable(name: "key", arg: 2, scope: !5593, file: !80, line: 669, type: !49)
!5604 = !DILocalVariable(name: "skey", scope: !5593, file: !80, line: 670, type: !5605)
!5605 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1920, elements: !5606)
!5606 = !{!5607}
!5607 = !DISubrange(count: 30)
!5608 = !DILocation(line: 670, column: 14, scope: !5593)
!5609 = !DILocation(line: 671, column: 17, scope: !5593)
!5610 = !DILocation(line: 671, column: 15, scope: !5593)
!5611 = !DILocation(line: 672, column: 19, scope: !5612)
!5612 = distinct !DILexicalBlock(scope: !5593, file: !80, line: 672, column: 9)
!5613 = !DILocation(line: 673, column: 9, scope: !5614)
!5614 = distinct !DILexicalBlock(scope: !5612, file: !80, line: 672, column: 28)
!5615 = !DILocation(line: 674, column: 5, scope: !5614)
!5616 = !DILocation(line: 676, column: 5, scope: !5593)
!5617 = !DILocation(line: 677, column: 32, scope: !5593)
!5618 = !DILocation(line: 677, column: 5, scope: !5593)
!5619 = !DILocation(line: 678, column: 1, scope: !5593)
!5620 = distinct !DISubprogram(name: "aes256_ctr_keyexp", scope: !80, file: !80, line: 681, type: !5594, scopeLine: 681, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5621 = !DILocalVariable(name: "r", arg: 1, scope: !5620, file: !80, line: 681, type: !5596)
!5622 = !DILocation(line: 0, scope: !5620)
!5623 = !DILocalVariable(name: "key", arg: 2, scope: !5620, file: !80, line: 681, type: !49)
!5624 = !DILocation(line: 682, column: 5, scope: !5620)
!5625 = !DILocation(line: 683, column: 1, scope: !5620)
!5626 = distinct !DISubprogram(name: "aes128_ecb", scope: !80, file: !80, line: 686, type: !5627, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5627 = !DISubroutineType(types: !5628)
!5628 = !{null, !18, !49, !15, !5629}
!5629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5630, size: 32)
!5630 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4943)
!5631 = !DILocalVariable(name: "out", arg: 1, scope: !5626, file: !80, line: 686, type: !18)
!5632 = !DILocation(line: 0, scope: !5626)
!5633 = !DILocalVariable(name: "in", arg: 2, scope: !5626, file: !80, line: 686, type: !49)
!5634 = !DILocalVariable(name: "nblocks", arg: 3, scope: !5626, file: !80, line: 686, type: !15)
!5635 = !DILocalVariable(name: "ctx", arg: 4, scope: !5626, file: !80, line: 686, type: !5629)
!5636 = !DILocation(line: 687, column: 36, scope: !5626)
!5637 = !DILocation(line: 687, column: 5, scope: !5626)
!5638 = !DILocation(line: 688, column: 1, scope: !5626)
!5639 = distinct !DISubprogram(name: "aes_ecb", scope: !80, file: !80, line: 587, type: !5640, scopeLine: 587, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5640 = !DISubroutineType(types: !5641)
!5641 = !{null, !18, !49, !15, !428, !17}
!5642 = !DILocalVariable(name: "out", arg: 1, scope: !5639, file: !80, line: 587, type: !18)
!5643 = !DILocation(line: 0, scope: !5639)
!5644 = !DILocalVariable(name: "in", arg: 2, scope: !5639, file: !80, line: 587, type: !49)
!5645 = !DILocalVariable(name: "nblocks", arg: 3, scope: !5639, file: !80, line: 587, type: !15)
!5646 = !DILocalVariable(name: "rkeys", arg: 4, scope: !5639, file: !80, line: 587, type: !428)
!5647 = !DILocalVariable(name: "nrounds", arg: 5, scope: !5639, file: !80, line: 587, type: !17)
!5648 = !DILocalVariable(name: "blocks", scope: !5639, file: !80, line: 588, type: !5649)
!5649 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 512, elements: !117)
!5650 = !DILocation(line: 588, column: 14, scope: !5639)
!5651 = !DILocalVariable(name: "t", scope: !5639, file: !80, line: 589, type: !5652)
!5652 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 512, elements: !5653)
!5653 = !{!5654}
!5654 = !DISubrange(count: 64)
!5655 = !DILocation(line: 589, column: 19, scope: !5639)
!5656 = !DILocation(line: 591, column: 5, scope: !5639)
!5657 = !DILocation(line: 591, column: 20, scope: !5639)
!5658 = !DILocation(line: 592, column: 9, scope: !5659)
!5659 = distinct !DILexicalBlock(scope: !5639, file: !80, line: 591, column: 26)
!5660 = !DILocation(line: 593, column: 9, scope: !5659)
!5661 = !DILocation(line: 594, column: 17, scope: !5659)
!5662 = !DILocation(line: 595, column: 12, scope: !5659)
!5663 = !DILocation(line: 596, column: 13, scope: !5659)
!5664 = distinct !{!5664, !5656, !5665, !244}
!5665 = !DILocation(line: 597, column: 5, scope: !5639)
!5666 = !DILocation(line: 599, column: 9, scope: !5667)
!5667 = distinct !DILexicalBlock(scope: !5639, file: !80, line: 599, column: 9)
!5668 = !DILocation(line: 600, column: 42, scope: !5669)
!5669 = distinct !DILexicalBlock(scope: !5667, file: !80, line: 599, column: 18)
!5670 = !DILocation(line: 600, column: 9, scope: !5669)
!5671 = !DILocation(line: 601, column: 9, scope: !5669)
!5672 = !DILocation(line: 602, column: 32, scope: !5669)
!5673 = !DILocation(line: 602, column: 9, scope: !5669)
!5674 = !DILocation(line: 603, column: 5, scope: !5669)
!5675 = !DILocation(line: 604, column: 1, scope: !5639)
!5676 = distinct !DISubprogram(name: "aes_ecb4x", scope: !80, file: !80, line: 545, type: !5677, scopeLine: 545, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5677 = !DISubroutineType(types: !5678)
!5678 = !{null, !18, !5176, !428, !17}
!5679 = !DILocalVariable(name: "out", arg: 1, scope: !5676, file: !80, line: 545, type: !18)
!5680 = !DILocation(line: 0, scope: !5676)
!5681 = !DILocalVariable(name: "ivw", arg: 2, scope: !5676, file: !80, line: 545, type: !5176)
!5682 = !DILocalVariable(name: "sk_exp", arg: 3, scope: !5676, file: !80, line: 545, type: !428)
!5683 = !DILocalVariable(name: "nrounds", arg: 4, scope: !5676, file: !80, line: 545, type: !17)
!5684 = !DILocalVariable(name: "w", scope: !5676, file: !80, line: 546, type: !5649)
!5685 = !DILocation(line: 546, column: 14, scope: !5676)
!5686 = !DILocalVariable(name: "q", scope: !5676, file: !80, line: 547, type: !5034)
!5687 = !DILocation(line: 547, column: 14, scope: !5676)
!5688 = !DILocation(line: 550, column: 5, scope: !5676)
!5689 = !DILocalVariable(name: "i", scope: !5676, file: !80, line: 548, type: !17)
!5690 = !DILocation(line: 551, column: 10, scope: !5691)
!5691 = distinct !DILexicalBlock(scope: !5676, file: !80, line: 551, column: 5)
!5692 = !DILocation(line: 551, scope: !5691)
!5693 = !DILocation(line: 551, column: 19, scope: !5694)
!5694 = distinct !DILexicalBlock(scope: !5691, file: !80, line: 551, column: 5)
!5695 = !DILocation(line: 551, column: 5, scope: !5691)
!5696 = !DILocation(line: 552, column: 36, scope: !5697)
!5697 = distinct !DILexicalBlock(scope: !5694, file: !80, line: 551, column: 29)
!5698 = !DILocation(line: 552, column: 47, scope: !5697)
!5699 = !DILocation(line: 552, column: 43, scope: !5697)
!5700 = !DILocation(line: 552, column: 55, scope: !5697)
!5701 = !DILocation(line: 552, column: 9, scope: !5697)
!5702 = !DILocation(line: 551, column: 25, scope: !5694)
!5703 = !DILocation(line: 551, column: 5, scope: !5694)
!5704 = distinct !{!5704, !5695, !5705, !244}
!5705 = !DILocation(line: 553, column: 5, scope: !5691)
!5706 = !DILocation(line: 554, column: 5, scope: !5676)
!5707 = !DILocation(line: 557, column: 5, scope: !5676)
!5708 = !DILocation(line: 558, column: 10, scope: !5709)
!5709 = distinct !DILexicalBlock(scope: !5676, file: !80, line: 558, column: 5)
!5710 = !DILocation(line: 558, scope: !5709)
!5711 = !DILocation(line: 558, column: 19, scope: !5712)
!5712 = distinct !DILexicalBlock(scope: !5709, file: !80, line: 558, column: 5)
!5713 = !DILocation(line: 558, column: 5, scope: !5709)
!5714 = !DILocation(line: 559, column: 9, scope: !5715)
!5715 = distinct !DILexicalBlock(scope: !5712, file: !80, line: 558, column: 35)
!5716 = !DILocation(line: 560, column: 9, scope: !5715)
!5717 = !DILocation(line: 561, column: 9, scope: !5715)
!5718 = !DILocation(line: 562, column: 33, scope: !5715)
!5719 = !DILocation(line: 562, column: 9, scope: !5715)
!5720 = !DILocation(line: 558, column: 31, scope: !5712)
!5721 = !DILocation(line: 558, column: 5, scope: !5712)
!5722 = distinct !{!5722, !5713, !5723, !244}
!5723 = !DILocation(line: 563, column: 5, scope: !5709)
!5724 = !DILocation(line: 564, column: 5, scope: !5676)
!5725 = !DILocation(line: 565, column: 5, scope: !5676)
!5726 = !DILocation(line: 566, column: 29, scope: !5676)
!5727 = !DILocation(line: 566, column: 5, scope: !5676)
!5728 = !DILocation(line: 568, column: 5, scope: !5676)
!5729 = !DILocation(line: 569, column: 10, scope: !5730)
!5730 = distinct !DILexicalBlock(scope: !5676, file: !80, line: 569, column: 5)
!5731 = !DILocation(line: 569, scope: !5730)
!5732 = !DILocation(line: 569, column: 19, scope: !5733)
!5733 = distinct !DILexicalBlock(scope: !5730, file: !80, line: 569, column: 5)
!5734 = !DILocation(line: 569, column: 5, scope: !5730)
!5735 = !DILocation(line: 570, column: 38, scope: !5736)
!5736 = distinct !DILexicalBlock(scope: !5733, file: !80, line: 569, column: 30)
!5737 = !DILocation(line: 570, column: 50, scope: !5736)
!5738 = !DILocation(line: 570, column: 60, scope: !5736)
!5739 = !DILocation(line: 570, column: 56, scope: !5736)
!5740 = !DILocation(line: 570, column: 9, scope: !5736)
!5741 = !DILocation(line: 569, column: 26, scope: !5733)
!5742 = !DILocation(line: 569, column: 5, scope: !5733)
!5743 = distinct !{!5743, !5734, !5744, !244}
!5744 = !DILocation(line: 571, column: 5, scope: !5730)
!5745 = !DILocation(line: 572, column: 5, scope: !5676)
!5746 = !DILocation(line: 573, column: 1, scope: !5676)
!5747 = distinct !DISubprogram(name: "add_round_key", scope: !80, file: !80, line: 475, type: !5748, scopeLine: 475, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5748 = !DISubroutineType(types: !5749)
!5749 = !{null, !5, !428}
!5750 = !DILocalVariable(name: "q", arg: 1, scope: !5747, file: !80, line: 475, type: !5)
!5751 = !DILocation(line: 0, scope: !5747)
!5752 = !DILocalVariable(name: "sk", arg: 2, scope: !5747, file: !80, line: 475, type: !428)
!5753 = !DILocation(line: 476, column: 13, scope: !5747)
!5754 = !DILocation(line: 476, column: 10, scope: !5747)
!5755 = !DILocation(line: 477, column: 13, scope: !5747)
!5756 = !DILocation(line: 477, column: 5, scope: !5747)
!5757 = !DILocation(line: 477, column: 10, scope: !5747)
!5758 = !DILocation(line: 478, column: 13, scope: !5747)
!5759 = !DILocation(line: 478, column: 5, scope: !5747)
!5760 = !DILocation(line: 478, column: 10, scope: !5747)
!5761 = !DILocation(line: 479, column: 13, scope: !5747)
!5762 = !DILocation(line: 479, column: 5, scope: !5747)
!5763 = !DILocation(line: 479, column: 10, scope: !5747)
!5764 = !DILocation(line: 480, column: 13, scope: !5747)
!5765 = !DILocation(line: 480, column: 5, scope: !5747)
!5766 = !DILocation(line: 480, column: 10, scope: !5747)
!5767 = !DILocation(line: 481, column: 13, scope: !5747)
!5768 = !DILocation(line: 481, column: 5, scope: !5747)
!5769 = !DILocation(line: 481, column: 10, scope: !5747)
!5770 = !DILocation(line: 482, column: 13, scope: !5747)
!5771 = !DILocation(line: 482, column: 5, scope: !5747)
!5772 = !DILocation(line: 482, column: 10, scope: !5747)
!5773 = !DILocation(line: 483, column: 13, scope: !5747)
!5774 = !DILocation(line: 483, column: 5, scope: !5747)
!5775 = !DILocation(line: 483, column: 10, scope: !5747)
!5776 = !DILocation(line: 484, column: 1, scope: !5747)
!5777 = distinct !DISubprogram(name: "shift_rows", scope: !80, file: !80, line: 486, type: !26, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5778 = !DILocalVariable(name: "q", arg: 1, scope: !5777, file: !80, line: 486, type: !5)
!5779 = !DILocation(line: 0, scope: !5777)
!5780 = !DILocalVariable(name: "i", scope: !5777, file: !80, line: 487, type: !45)
!5781 = !DILocation(line: 489, column: 10, scope: !5782)
!5782 = distinct !DILexicalBlock(scope: !5777, file: !80, line: 489, column: 5)
!5783 = !DILocation(line: 489, scope: !5782)
!5784 = !DILocation(line: 489, column: 19, scope: !5785)
!5785 = distinct !DILexicalBlock(scope: !5782, file: !80, line: 489, column: 5)
!5786 = !DILocation(line: 489, column: 5, scope: !5782)
!5787 = !DILocation(line: 492, column: 13, scope: !5788)
!5788 = distinct !DILexicalBlock(scope: !5785, file: !80, line: 489, column: 30)
!5789 = !DILocalVariable(name: "x", scope: !5788, file: !80, line: 490, type: !6)
!5790 = !DILocation(line: 0, scope: !5788)
!5791 = !DILocation(line: 493, column: 19, scope: !5788)
!5792 = !DILocation(line: 494, column: 54, scope: !5788)
!5793 = !DILocation(line: 494, column: 16, scope: !5788)
!5794 = !DILocation(line: 495, column: 54, scope: !5788)
!5795 = !DILocation(line: 495, column: 16, scope: !5788)
!5796 = !DILocation(line: 496, column: 54, scope: !5788)
!5797 = !DILocation(line: 496, column: 16, scope: !5788)
!5798 = !DILocation(line: 497, column: 54, scope: !5788)
!5799 = !DILocation(line: 497, column: 16, scope: !5788)
!5800 = !DILocation(line: 498, column: 54, scope: !5788)
!5801 = !DILocation(line: 498, column: 16, scope: !5788)
!5802 = !DILocation(line: 499, column: 54, scope: !5788)
!5803 = !DILocation(line: 499, column: 16, scope: !5788)
!5804 = !DILocation(line: 493, column: 9, scope: !5788)
!5805 = !DILocation(line: 493, column: 14, scope: !5788)
!5806 = !DILocation(line: 489, column: 26, scope: !5785)
!5807 = !DILocation(line: 489, column: 5, scope: !5785)
!5808 = distinct !{!5808, !5786, !5809, !244}
!5809 = !DILocation(line: 500, column: 5, scope: !5782)
!5810 = !DILocation(line: 501, column: 1, scope: !5777)
!5811 = distinct !DISubprogram(name: "mix_columns", scope: !80, file: !80, line: 507, type: !26, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5812 = !DILocalVariable(name: "q", arg: 1, scope: !5811, file: !80, line: 507, type: !5)
!5813 = !DILocation(line: 0, scope: !5811)
!5814 = !DILocation(line: 511, column: 10, scope: !5811)
!5815 = !DILocalVariable(name: "q0", scope: !5811, file: !80, line: 508, type: !6)
!5816 = !DILocation(line: 512, column: 10, scope: !5811)
!5817 = !DILocalVariable(name: "q1", scope: !5811, file: !80, line: 508, type: !6)
!5818 = !DILocation(line: 513, column: 10, scope: !5811)
!5819 = !DILocalVariable(name: "q2", scope: !5811, file: !80, line: 508, type: !6)
!5820 = !DILocation(line: 514, column: 10, scope: !5811)
!5821 = !DILocalVariable(name: "q3", scope: !5811, file: !80, line: 508, type: !6)
!5822 = !DILocation(line: 515, column: 10, scope: !5811)
!5823 = !DILocalVariable(name: "q4", scope: !5811, file: !80, line: 508, type: !6)
!5824 = !DILocation(line: 516, column: 10, scope: !5811)
!5825 = !DILocalVariable(name: "q5", scope: !5811, file: !80, line: 508, type: !6)
!5826 = !DILocation(line: 517, column: 10, scope: !5811)
!5827 = !DILocalVariable(name: "q6", scope: !5811, file: !80, line: 508, type: !6)
!5828 = !DILocation(line: 518, column: 10, scope: !5811)
!5829 = !DILocalVariable(name: "q7", scope: !5811, file: !80, line: 508, type: !6)
!5830 = !DILocation(line: 519, column: 21, scope: !5811)
!5831 = !DILocalVariable(name: "r0", scope: !5811, file: !80, line: 509, type: !6)
!5832 = !DILocation(line: 520, column: 21, scope: !5811)
!5833 = !DILocalVariable(name: "r1", scope: !5811, file: !80, line: 509, type: !6)
!5834 = !DILocation(line: 521, column: 21, scope: !5811)
!5835 = !DILocalVariable(name: "r2", scope: !5811, file: !80, line: 509, type: !6)
!5836 = !DILocation(line: 522, column: 21, scope: !5811)
!5837 = !DILocalVariable(name: "r3", scope: !5811, file: !80, line: 509, type: !6)
!5838 = !DILocation(line: 523, column: 21, scope: !5811)
!5839 = !DILocalVariable(name: "r4", scope: !5811, file: !80, line: 509, type: !6)
!5840 = !DILocation(line: 524, column: 21, scope: !5811)
!5841 = !DILocalVariable(name: "r5", scope: !5811, file: !80, line: 509, type: !6)
!5842 = !DILocation(line: 525, column: 21, scope: !5811)
!5843 = !DILocalVariable(name: "r6", scope: !5811, file: !80, line: 509, type: !6)
!5844 = !DILocation(line: 526, column: 21, scope: !5811)
!5845 = !DILocalVariable(name: "r7", scope: !5811, file: !80, line: 509, type: !6)
!5846 = !DILocation(line: 528, column: 37, scope: !5811)
!5847 = !DILocation(line: 528, column: 27, scope: !5811)
!5848 = !DILocation(line: 528, column: 25, scope: !5811)
!5849 = !DILocation(line: 528, column: 10, scope: !5811)
!5850 = !DILocation(line: 529, column: 47, scope: !5811)
!5851 = !DILocation(line: 529, column: 37, scope: !5811)
!5852 = !DILocation(line: 529, column: 35, scope: !5811)
!5853 = !DILocation(line: 529, column: 5, scope: !5811)
!5854 = !DILocation(line: 529, column: 10, scope: !5811)
!5855 = !DILocation(line: 530, column: 37, scope: !5811)
!5856 = !DILocation(line: 530, column: 27, scope: !5811)
!5857 = !DILocation(line: 530, column: 25, scope: !5811)
!5858 = !DILocation(line: 530, column: 5, scope: !5811)
!5859 = !DILocation(line: 530, column: 10, scope: !5811)
!5860 = !DILocation(line: 531, column: 47, scope: !5811)
!5861 = !DILocation(line: 531, column: 37, scope: !5811)
!5862 = !DILocation(line: 531, column: 35, scope: !5811)
!5863 = !DILocation(line: 531, column: 5, scope: !5811)
!5864 = !DILocation(line: 531, column: 10, scope: !5811)
!5865 = !DILocation(line: 532, column: 47, scope: !5811)
!5866 = !DILocation(line: 532, column: 37, scope: !5811)
!5867 = !DILocation(line: 532, column: 35, scope: !5811)
!5868 = !DILocation(line: 532, column: 5, scope: !5811)
!5869 = !DILocation(line: 532, column: 10, scope: !5811)
!5870 = !DILocation(line: 533, column: 37, scope: !5811)
!5871 = !DILocation(line: 533, column: 27, scope: !5811)
!5872 = !DILocation(line: 533, column: 25, scope: !5811)
!5873 = !DILocation(line: 533, column: 5, scope: !5811)
!5874 = !DILocation(line: 533, column: 10, scope: !5811)
!5875 = !DILocation(line: 534, column: 37, scope: !5811)
!5876 = !DILocation(line: 534, column: 27, scope: !5811)
!5877 = !DILocation(line: 534, column: 25, scope: !5811)
!5878 = !DILocation(line: 534, column: 5, scope: !5811)
!5879 = !DILocation(line: 534, column: 10, scope: !5811)
!5880 = !DILocation(line: 535, column: 37, scope: !5811)
!5881 = !DILocation(line: 535, column: 27, scope: !5811)
!5882 = !DILocation(line: 535, column: 25, scope: !5811)
!5883 = !DILocation(line: 535, column: 5, scope: !5811)
!5884 = !DILocation(line: 535, column: 10, scope: !5811)
!5885 = !DILocation(line: 536, column: 1, scope: !5811)
!5886 = distinct !DISubprogram(name: "br_aes_ct64_interleave_out", scope: !80, file: !80, line: 367, type: !5887, scopeLine: 367, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5887 = !DISubroutineType(types: !5888)
!5888 = !{null, !5141, !6, !6}
!5889 = !DILocalVariable(name: "w", arg: 1, scope: !5886, file: !80, line: 367, type: !5141)
!5890 = !DILocation(line: 0, scope: !5886)
!5891 = !DILocalVariable(name: "q0", arg: 2, scope: !5886, file: !80, line: 367, type: !6)
!5892 = !DILocalVariable(name: "q1", arg: 3, scope: !5886, file: !80, line: 367, type: !6)
!5893 = !DILocation(line: 370, column: 13, scope: !5886)
!5894 = !DILocalVariable(name: "x0", scope: !5886, file: !80, line: 368, type: !6)
!5895 = !DILocation(line: 371, column: 13, scope: !5886)
!5896 = !DILocalVariable(name: "x1", scope: !5886, file: !80, line: 368, type: !6)
!5897 = !DILocation(line: 372, column: 14, scope: !5886)
!5898 = !DILocation(line: 372, column: 20, scope: !5886)
!5899 = !DILocalVariable(name: "x2", scope: !5886, file: !80, line: 368, type: !6)
!5900 = !DILocation(line: 373, column: 14, scope: !5886)
!5901 = !DILocation(line: 373, column: 20, scope: !5886)
!5902 = !DILocalVariable(name: "x3", scope: !5886, file: !80, line: 368, type: !6)
!5903 = !DILocation(line: 374, column: 15, scope: !5886)
!5904 = !DILocation(line: 374, column: 8, scope: !5886)
!5905 = !DILocation(line: 375, column: 15, scope: !5886)
!5906 = !DILocation(line: 375, column: 8, scope: !5886)
!5907 = !DILocation(line: 376, column: 8, scope: !5886)
!5908 = !DILocation(line: 377, column: 8, scope: !5886)
!5909 = !DILocation(line: 378, column: 8, scope: !5886)
!5910 = !DILocation(line: 379, column: 8, scope: !5886)
!5911 = !DILocation(line: 382, column: 41, scope: !5886)
!5912 = !DILocation(line: 382, column: 25, scope: !5886)
!5913 = !DILocation(line: 382, column: 10, scope: !5886)
!5914 = !DILocation(line: 383, column: 41, scope: !5886)
!5915 = !DILocation(line: 383, column: 25, scope: !5886)
!5916 = !DILocation(line: 383, column: 5, scope: !5886)
!5917 = !DILocation(line: 383, column: 10, scope: !5886)
!5918 = !DILocation(line: 384, column: 41, scope: !5886)
!5919 = !DILocation(line: 384, column: 25, scope: !5886)
!5920 = !DILocation(line: 384, column: 5, scope: !5886)
!5921 = !DILocation(line: 384, column: 10, scope: !5886)
!5922 = !DILocation(line: 385, column: 41, scope: !5886)
!5923 = !DILocation(line: 385, column: 25, scope: !5886)
!5924 = !DILocation(line: 385, column: 5, scope: !5886)
!5925 = !DILocation(line: 385, column: 10, scope: !5886)
!5926 = !DILocation(line: 386, column: 1, scope: !5886)
!5927 = distinct !DISubprogram(name: "br_range_enc32le", scope: !80, file: !80, line: 127, type: !5928, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5928 = !DISubroutineType(types: !5929)
!5929 = !{null, !18, !5176, !15}
!5930 = !DILocalVariable(name: "dst", arg: 1, scope: !5927, file: !80, line: 127, type: !18)
!5931 = !DILocation(line: 0, scope: !5927)
!5932 = !DILocalVariable(name: "v", arg: 2, scope: !5927, file: !80, line: 127, type: !5176)
!5933 = !DILocalVariable(name: "num", arg: 3, scope: !5927, file: !80, line: 127, type: !15)
!5934 = !DILocation(line: 128, column: 5, scope: !5927)
!5935 = !DILocation(line: 128, column: 18, scope: !5927)
!5936 = !DILocation(line: 128, column: 15, scope: !5927)
!5937 = !DILocation(line: 129, column: 28, scope: !5938)
!5938 = distinct !DILexicalBlock(scope: !5927, file: !80, line: 128, column: 23)
!5939 = !DILocation(line: 129, column: 25, scope: !5938)
!5940 = !DILocation(line: 129, column: 9, scope: !5938)
!5941 = !DILocation(line: 130, column: 13, scope: !5938)
!5942 = distinct !{!5942, !5934, !5943, !244}
!5943 = !DILocation(line: 131, column: 5, scope: !5927)
!5944 = !DILocation(line: 132, column: 1, scope: !5927)
!5945 = distinct !DISubprogram(name: "br_enc32le", scope: !80, file: !80, line: 119, type: !5946, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5946 = !DISubroutineType(types: !5947)
!5947 = !{null, !18, !19}
!5948 = !DILocalVariable(name: "dst", arg: 1, scope: !5945, file: !80, line: 119, type: !18)
!5949 = !DILocation(line: 0, scope: !5945)
!5950 = !DILocalVariable(name: "x", arg: 2, scope: !5945, file: !80, line: 119, type: !19)
!5951 = !DILocation(line: 120, column: 14, scope: !5945)
!5952 = !DILocation(line: 120, column: 12, scope: !5945)
!5953 = !DILocation(line: 121, column: 32, scope: !5945)
!5954 = !DILocation(line: 121, column: 14, scope: !5945)
!5955 = !DILocation(line: 121, column: 5, scope: !5945)
!5956 = !DILocation(line: 121, column: 12, scope: !5945)
!5957 = !DILocation(line: 122, column: 32, scope: !5945)
!5958 = !DILocation(line: 122, column: 14, scope: !5945)
!5959 = !DILocation(line: 122, column: 5, scope: !5945)
!5960 = !DILocation(line: 122, column: 12, scope: !5945)
!5961 = !DILocation(line: 123, column: 32, scope: !5945)
!5962 = !DILocation(line: 123, column: 14, scope: !5945)
!5963 = !DILocation(line: 123, column: 5, scope: !5945)
!5964 = !DILocation(line: 123, column: 12, scope: !5945)
!5965 = !DILocation(line: 124, column: 1, scope: !5945)
!5966 = distinct !DISubprogram(name: "rotr32", scope: !80, file: !80, line: 503, type: !5967, scopeLine: 503, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5967 = !DISubroutineType(types: !5968)
!5968 = !{!6, !6}
!5969 = !DILocalVariable(name: "x", arg: 1, scope: !5966, file: !80, line: 503, type: !6)
!5970 = !DILocation(line: 0, scope: !5966)
!5971 = !DILocation(line: 504, column: 22, scope: !5966)
!5972 = !DILocation(line: 504, column: 5, scope: !5966)
!5973 = distinct !DISubprogram(name: "aes128_ctr", scope: !80, file: !80, line: 690, type: !5974, scopeLine: 690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5974 = !DISubroutineType(types: !5975)
!5975 = !{null, !18, !15, !49, !5629}
!5976 = !DILocalVariable(name: "out", arg: 1, scope: !5973, file: !80, line: 690, type: !18)
!5977 = !DILocation(line: 0, scope: !5973)
!5978 = !DILocalVariable(name: "outlen", arg: 2, scope: !5973, file: !80, line: 690, type: !15)
!5979 = !DILocalVariable(name: "iv", arg: 3, scope: !5973, file: !80, line: 690, type: !49)
!5980 = !DILocalVariable(name: "ctx", arg: 4, scope: !5973, file: !80, line: 690, type: !5629)
!5981 = !DILocation(line: 691, column: 35, scope: !5973)
!5982 = !DILocation(line: 691, column: 5, scope: !5973)
!5983 = !DILocation(line: 692, column: 1, scope: !5973)
!5984 = distinct !DISubprogram(name: "aes_ctr", scope: !80, file: !80, line: 607, type: !5985, scopeLine: 607, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!5985 = !DISubroutineType(types: !5986)
!5986 = !{null, !18, !15, !49, !428, !17}
!5987 = !DILocalVariable(name: "out", arg: 1, scope: !5984, file: !80, line: 607, type: !18)
!5988 = !DILocation(line: 0, scope: !5984)
!5989 = !DILocalVariable(name: "outlen", arg: 2, scope: !5984, file: !80, line: 607, type: !15)
!5990 = !DILocalVariable(name: "iv", arg: 3, scope: !5984, file: !80, line: 607, type: !49)
!5991 = !DILocalVariable(name: "rkeys", arg: 4, scope: !5984, file: !80, line: 607, type: !428)
!5992 = !DILocalVariable(name: "nrounds", arg: 5, scope: !5984, file: !80, line: 607, type: !17)
!5993 = !DILocalVariable(name: "ivw", scope: !5984, file: !80, line: 608, type: !5649)
!5994 = !DILocation(line: 608, column: 14, scope: !5984)
!5995 = !DILocalVariable(name: "cc", scope: !5984, file: !80, line: 610, type: !19)
!5996 = !DILocation(line: 612, column: 5, scope: !5984)
!5997 = !DILocation(line: 613, column: 16, scope: !5984)
!5998 = !DILocation(line: 613, column: 5, scope: !5984)
!5999 = !DILocation(line: 614, column: 16, scope: !5984)
!6000 = !DILocation(line: 614, column: 5, scope: !5984)
!6001 = !DILocation(line: 615, column: 16, scope: !5984)
!6002 = !DILocation(line: 615, column: 5, scope: !5984)
!6003 = !DILocation(line: 616, column: 15, scope: !5984)
!6004 = !DILocation(line: 616, column: 5, scope: !5984)
!6005 = !DILocation(line: 616, column: 13, scope: !5984)
!6006 = !DILocation(line: 617, column: 15, scope: !5984)
!6007 = !DILocation(line: 617, column: 5, scope: !5984)
!6008 = !DILocation(line: 617, column: 13, scope: !5984)
!6009 = !DILocation(line: 618, column: 15, scope: !5984)
!6010 = !DILocation(line: 618, column: 5, scope: !5984)
!6011 = !DILocation(line: 618, column: 13, scope: !5984)
!6012 = !DILocation(line: 619, column: 15, scope: !5984)
!6013 = !DILocation(line: 619, column: 5, scope: !5984)
!6014 = !DILocation(line: 619, column: 13, scope: !5984)
!6015 = !DILocation(line: 621, column: 5, scope: !5984)
!6016 = !DILocation(line: 621, column: 19, scope: !5984)
!6017 = !DILocation(line: 622, column: 9, scope: !6018)
!6018 = distinct !DILexicalBlock(scope: !5984, file: !80, line: 621, column: 25)
!6019 = !DILocation(line: 623, column: 13, scope: !6018)
!6020 = !DILocation(line: 624, column: 16, scope: !6018)
!6021 = distinct !{!6021, !6015, !6022, !244}
!6022 = !DILocation(line: 625, column: 5, scope: !5984)
!6023 = !DILocation(line: 626, column: 16, scope: !6024)
!6024 = distinct !DILexicalBlock(scope: !5984, file: !80, line: 626, column: 9)
!6025 = !DILocalVariable(name: "tmp", scope: !6026, file: !80, line: 627, type: !5652)
!6026 = distinct !DILexicalBlock(scope: !6024, file: !80, line: 626, column: 21)
!6027 = !DILocation(line: 627, column: 23, scope: !6026)
!6028 = !DILocation(line: 628, column: 9, scope: !6026)
!6029 = !DILocalVariable(name: "i", scope: !5984, file: !80, line: 609, type: !15)
!6030 = !DILocation(line: 629, column: 14, scope: !6031)
!6031 = distinct !DILexicalBlock(scope: !6026, file: !80, line: 629, column: 9)
!6032 = !DILocation(line: 629, scope: !6031)
!6033 = !DILocation(line: 629, column: 23, scope: !6034)
!6034 = distinct !DILexicalBlock(scope: !6031, file: !80, line: 629, column: 9)
!6035 = !DILocation(line: 629, column: 9, scope: !6031)
!6036 = !DILocation(line: 630, column: 22, scope: !6037)
!6037 = distinct !DILexicalBlock(scope: !6034, file: !80, line: 629, column: 38)
!6038 = !DILocation(line: 630, column: 13, scope: !6037)
!6039 = !DILocation(line: 630, column: 20, scope: !6037)
!6040 = !DILocation(line: 629, column: 34, scope: !6034)
!6041 = !DILocation(line: 629, column: 9, scope: !6034)
!6042 = distinct !{!6042, !6035, !6043, !244}
!6043 = !DILocation(line: 631, column: 9, scope: !6031)
!6044 = !DILocation(line: 633, column: 1, scope: !5984)
!6045 = distinct !DISubprogram(name: "br_swap32", scope: !80, file: !80, line: 112, type: !5158, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6046 = !DILocalVariable(name: "x", arg: 1, scope: !6045, file: !80, line: 112, type: !19)
!6047 = !DILocation(line: 0, scope: !6045)
!6048 = !DILocation(line: 115, column: 22, scope: !6045)
!6049 = !DILocation(line: 115, column: 5, scope: !6045)
!6050 = distinct !DISubprogram(name: "aes_ctr4x", scope: !80, file: !80, line: 576, type: !6051, scopeLine: 576, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6051 = !DISubroutineType(types: !6052)
!6052 = !{null, !18, !5141, !428, !17}
!6053 = !DILocalVariable(name: "out", arg: 1, scope: !6050, file: !80, line: 576, type: !18)
!6054 = !DILocation(line: 0, scope: !6050)
!6055 = !DILocalVariable(name: "ivw", arg: 2, scope: !6050, file: !80, line: 576, type: !5141)
!6056 = !DILocalVariable(name: "sk_exp", arg: 3, scope: !6050, file: !80, line: 576, type: !428)
!6057 = !DILocalVariable(name: "nrounds", arg: 4, scope: !6050, file: !80, line: 576, type: !17)
!6058 = !DILocation(line: 577, column: 5, scope: !6050)
!6059 = !DILocation(line: 580, column: 17, scope: !6050)
!6060 = !DILocation(line: 580, column: 5, scope: !6050)
!6061 = !DILocation(line: 581, column: 17, scope: !6050)
!6062 = !DILocation(line: 581, column: 5, scope: !6050)
!6063 = !DILocation(line: 582, column: 17, scope: !6050)
!6064 = !DILocation(line: 582, column: 5, scope: !6050)
!6065 = !DILocation(line: 583, column: 17, scope: !6050)
!6066 = !DILocation(line: 583, column: 5, scope: !6050)
!6067 = !DILocation(line: 584, column: 1, scope: !6050)
!6068 = distinct !DISubprogram(name: "inc4_be", scope: !80, file: !80, line: 539, type: !6069, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6069 = !DISubroutineType(types: !6070)
!6070 = !{null, !5141}
!6071 = !DILocalVariable(name: "x", arg: 1, scope: !6068, file: !80, line: 539, type: !5141)
!6072 = !DILocation(line: 0, scope: !6068)
!6073 = !DILocation(line: 540, column: 28, scope: !6068)
!6074 = !DILocation(line: 540, column: 18, scope: !6068)
!6075 = !DILocation(line: 540, column: 32, scope: !6068)
!6076 = !DILocalVariable(name: "t", scope: !6068, file: !80, line: 540, type: !19)
!6077 = !DILocation(line: 541, column: 10, scope: !6068)
!6078 = !DILocation(line: 541, column: 8, scope: !6068)
!6079 = !DILocation(line: 542, column: 1, scope: !6068)
!6080 = distinct !DISubprogram(name: "aes192_ecb", scope: !80, file: !80, line: 694, type: !6081, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6081 = !DISubroutineType(types: !6082)
!6082 = !{null, !18, !49, !15, !6083}
!6083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6084, size: 32)
!6084 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5564)
!6085 = !DILocalVariable(name: "out", arg: 1, scope: !6080, file: !80, line: 694, type: !18)
!6086 = !DILocation(line: 0, scope: !6080)
!6087 = !DILocalVariable(name: "in", arg: 2, scope: !6080, file: !80, line: 694, type: !49)
!6088 = !DILocalVariable(name: "nblocks", arg: 3, scope: !6080, file: !80, line: 694, type: !15)
!6089 = !DILocalVariable(name: "ctx", arg: 4, scope: !6080, file: !80, line: 694, type: !6083)
!6090 = !DILocation(line: 695, column: 36, scope: !6080)
!6091 = !DILocation(line: 695, column: 5, scope: !6080)
!6092 = !DILocation(line: 696, column: 1, scope: !6080)
!6093 = distinct !DISubprogram(name: "aes192_ctr", scope: !80, file: !80, line: 698, type: !6094, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6094 = !DISubroutineType(types: !6095)
!6095 = !{null, !18, !15, !49, !6083}
!6096 = !DILocalVariable(name: "out", arg: 1, scope: !6093, file: !80, line: 698, type: !18)
!6097 = !DILocation(line: 0, scope: !6093)
!6098 = !DILocalVariable(name: "outlen", arg: 2, scope: !6093, file: !80, line: 698, type: !15)
!6099 = !DILocalVariable(name: "iv", arg: 3, scope: !6093, file: !80, line: 698, type: !49)
!6100 = !DILocalVariable(name: "ctx", arg: 4, scope: !6093, file: !80, line: 698, type: !6083)
!6101 = !DILocation(line: 699, column: 35, scope: !6093)
!6102 = !DILocation(line: 699, column: 5, scope: !6093)
!6103 = !DILocation(line: 700, column: 1, scope: !6093)
!6104 = distinct !DISubprogram(name: "aes256_ecb", scope: !80, file: !80, line: 702, type: !6105, scopeLine: 702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6105 = !DISubroutineType(types: !6106)
!6106 = !{null, !18, !49, !15, !6107}
!6107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6108, size: 32)
!6108 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5597)
!6109 = !DILocalVariable(name: "out", arg: 1, scope: !6104, file: !80, line: 702, type: !18)
!6110 = !DILocation(line: 0, scope: !6104)
!6111 = !DILocalVariable(name: "in", arg: 2, scope: !6104, file: !80, line: 702, type: !49)
!6112 = !DILocalVariable(name: "nblocks", arg: 3, scope: !6104, file: !80, line: 702, type: !15)
!6113 = !DILocalVariable(name: "ctx", arg: 4, scope: !6104, file: !80, line: 702, type: !6107)
!6114 = !DILocation(line: 703, column: 36, scope: !6104)
!6115 = !DILocation(line: 703, column: 5, scope: !6104)
!6116 = !DILocation(line: 704, column: 1, scope: !6104)
!6117 = distinct !DISubprogram(name: "aes256_ctr", scope: !80, file: !80, line: 706, type: !6118, scopeLine: 706, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6118 = !DISubroutineType(types: !6119)
!6119 = !{null, !18, !15, !49, !6107}
!6120 = !DILocalVariable(name: "out", arg: 1, scope: !6117, file: !80, line: 706, type: !18)
!6121 = !DILocation(line: 0, scope: !6117)
!6122 = !DILocalVariable(name: "outlen", arg: 2, scope: !6117, file: !80, line: 706, type: !15)
!6123 = !DILocalVariable(name: "iv", arg: 3, scope: !6117, file: !80, line: 706, type: !49)
!6124 = !DILocalVariable(name: "ctx", arg: 4, scope: !6117, file: !80, line: 706, type: !6107)
!6125 = !DILocation(line: 707, column: 35, scope: !6117)
!6126 = !DILocation(line: 707, column: 5, scope: !6117)
!6127 = !DILocation(line: 708, column: 1, scope: !6117)
!6128 = distinct !DISubprogram(name: "aes128_ctx_release", scope: !80, file: !80, line: 710, type: !6129, scopeLine: 710, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6129 = !DISubroutineType(types: !6130)
!6130 = !{null, !4942}
!6131 = !DILocalVariable(name: "r", arg: 1, scope: !6128, file: !80, line: 710, type: !4942)
!6132 = !DILocation(line: 0, scope: !6128)
!6133 = !DILocation(line: 711, column: 13, scope: !6128)
!6134 = !DILocation(line: 711, column: 5, scope: !6128)
!6135 = !DILocation(line: 712, column: 1, scope: !6128)
!6136 = distinct !DISubprogram(name: "aes192_ctx_release", scope: !80, file: !80, line: 714, type: !6137, scopeLine: 714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6137 = !DISubroutineType(types: !6138)
!6138 = !{null, !5563}
!6139 = !DILocalVariable(name: "r", arg: 1, scope: !6136, file: !80, line: 714, type: !5563)
!6140 = !DILocation(line: 0, scope: !6136)
!6141 = !DILocation(line: 715, column: 13, scope: !6136)
!6142 = !DILocation(line: 715, column: 5, scope: !6136)
!6143 = !DILocation(line: 716, column: 1, scope: !6136)
!6144 = distinct !DISubprogram(name: "aes256_ctx_release", scope: !80, file: !80, line: 718, type: !6145, scopeLine: 718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6145 = !DISubroutineType(types: !6146)
!6146 = !{null, !5596}
!6147 = !DILocalVariable(name: "r", arg: 1, scope: !6144, file: !80, line: 718, type: !5596)
!6148 = !DILocation(line: 0, scope: !6144)
!6149 = !DILocation(line: 719, column: 13, scope: !6144)
!6150 = !DILocation(line: 719, column: 5, scope: !6144)
!6151 = !DILocation(line: 720, column: 1, scope: !6144)
!6152 = distinct !DISubprogram(name: "AES_128_CTR", scope: !80, file: !80, line: 722, type: !6153, scopeLine: 723, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6153 = !DISubroutineType(types: !6154)
!6154 = !{!45, !18, !15, !49, !15}
!6155 = !DILocalVariable(name: "output", arg: 1, scope: !6152, file: !80, line: 722, type: !18)
!6156 = !DILocation(line: 0, scope: !6152)
!6157 = !DILocalVariable(name: "outputByteLen", arg: 2, scope: !6152, file: !80, line: 722, type: !15)
!6158 = !DILocalVariable(name: "input", arg: 3, scope: !6152, file: !80, line: 723, type: !49)
!6159 = !DILocalVariable(name: "inputByteLen", arg: 4, scope: !6152, file: !80, line: 723, type: !15)
!6160 = !DILocalVariable(name: "ctx", scope: !6152, file: !80, line: 724, type: !4943)
!6161 = !DILocation(line: 724, column: 15, scope: !6152)
!6162 = !DILocalVariable(name: "iv", scope: !6152, file: !80, line: 725, type: !116)
!6163 = !DILocation(line: 725, column: 19, scope: !6152)
!6164 = !DILocation(line: 727, column: 5, scope: !6152)
!6165 = !DILocation(line: 728, column: 5, scope: !6152)
!6166 = !DILocation(line: 729, column: 5, scope: !6152)
!6167 = !DILocation(line: 731, column: 5, scope: !6152)
!6168 = distinct !DISubprogram(name: "AES_256_ECB", scope: !80, file: !80, line: 734, type: !6169, scopeLine: 734, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !77, retainedNodes: !28)
!6169 = !DISubroutineType(types: !6170)
!6170 = !{null, !257, !49, !18}
!6171 = !DILocalVariable(name: "input", arg: 1, scope: !6168, file: !80, line: 734, type: !257)
!6172 = !DILocation(line: 0, scope: !6168)
!6173 = !DILocalVariable(name: "key", arg: 2, scope: !6168, file: !80, line: 734, type: !49)
!6174 = !DILocalVariable(name: "output", arg: 3, scope: !6168, file: !80, line: 734, type: !18)
!6175 = !DILocalVariable(name: "ctx", scope: !6168, file: !80, line: 735, type: !5597)
!6176 = !DILocation(line: 735, column: 15, scope: !6168)
!6177 = !DILocation(line: 737, column: 5, scope: !6168)
!6178 = !DILocation(line: 738, column: 5, scope: !6168)
!6179 = !DILocation(line: 739, column: 5, scope: !6168)
!6180 = !DILocation(line: 740, column: 1, scope: !6168)
!6181 = !DILocalVariable(name: "mem", arg: 1, scope: !86, file: !87, line: 7, type: !69)
!6182 = !DILocation(line: 0, scope: !86)
!6183 = !DILocalVariable(name: "size", arg: 2, scope: !86, file: !87, line: 7, type: !15)
!6184 = !DILocation(line: 8, column: 9, scope: !6185)
!6185 = distinct !DILexicalBlock(scope: !86, file: !87, line: 8, column: 9)
!6186 = !DILocation(line: 11, column: 9, scope: !6187)
!6187 = distinct !DILexicalBlock(scope: !6185, file: !87, line: 8, column: 14)
!6188 = !DILocation(line: 12, column: 9, scope: !6187)
!6189 = !DILocation(line: 13, column: 5, scope: !6187)
!6190 = !DILocation(line: 14, column: 1, scope: !86)
!6191 = !DILocalVariable(name: "mem", arg: 1, scope: !94, file: !87, line: 15, type: !69)
!6192 = !DILocation(line: 0, scope: !94)
!6193 = !DILocalVariable(name: "size", arg: 2, scope: !94, file: !87, line: 15, type: !15)
!6194 = !DILocation(line: 18, column: 5, scope: !94)
!6195 = !DILocation(line: 19, column: 1, scope: !94)
!6196 = distinct !DISubprogram(name: "AES256_CTR_DRBG_Update", scope: !107, file: !107, line: 101, type: !6197, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6197 = !DISubroutineType(types: !6198)
!6198 = !{null, !18, !18, !18}
!6199 = !DILocalVariable(name: "provided_data", arg: 1, scope: !6196, file: !107, line: 101, type: !18)
!6200 = !DILocation(line: 0, scope: !6196)
!6201 = !DILocalVariable(name: "Key", arg: 2, scope: !6196, file: !107, line: 102, type: !18)
!6202 = !DILocalVariable(name: "V", arg: 3, scope: !6196, file: !107, line: 103, type: !18)
!6203 = !DILocalVariable(name: "temp", scope: !6196, file: !107, line: 104, type: !6204)
!6204 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 384, elements: !6205)
!6205 = !{!6206}
!6206 = !DISubrange(count: 48)
!6207 = !DILocation(line: 104, column: 21, scope: !6196)
!6208 = !DILocalVariable(name: "i", scope: !6209, file: !107, line: 106, type: !45)
!6209 = distinct !DILexicalBlock(scope: !6196, file: !107, line: 106, column: 5)
!6210 = !DILocation(line: 0, scope: !6209)
!6211 = !DILocation(line: 106, column: 10, scope: !6209)
!6212 = !DILocation(line: 106, scope: !6209)
!6213 = !DILocation(line: 106, column: 23, scope: !6214)
!6214 = distinct !DILexicalBlock(scope: !6209, file: !107, line: 106, column: 5)
!6215 = !DILocation(line: 106, column: 5, scope: !6209)
!6216 = !DILocation(line: 108, column: 9, scope: !6217)
!6217 = distinct !DILexicalBlock(scope: !6218, file: !107, line: 108, column: 9)
!6218 = distinct !DILexicalBlock(scope: !6214, file: !107, line: 106, column: 33)
!6219 = !DILocation(line: 108, scope: !6217)
!6220 = !DILocalVariable(name: "j", scope: !6217, file: !107, line: 108, type: !45)
!6221 = !DILocation(line: 0, scope: !6217)
!6222 = !DILocation(line: 108, column: 28, scope: !6223)
!6223 = distinct !DILexicalBlock(scope: !6217, file: !107, line: 108, column: 9)
!6224 = !DILocation(line: 109, column: 18, scope: !6225)
!6225 = distinct !DILexicalBlock(scope: !6226, file: !107, line: 109, column: 18)
!6226 = distinct !DILexicalBlock(scope: !6223, file: !107, line: 108, column: 39)
!6227 = !DILocation(line: 109, column: 23, scope: !6225)
!6228 = !DILocation(line: 110, column: 17, scope: !6229)
!6229 = distinct !DILexicalBlock(scope: !6225, file: !107, line: 109, column: 33)
!6230 = !DILocation(line: 110, column: 22, scope: !6229)
!6231 = !DILocation(line: 108, column: 35, scope: !6223)
!6232 = !DILocation(line: 108, column: 9, scope: !6223)
!6233 = distinct !{!6233, !6216, !6234, !244}
!6234 = !DILocation(line: 115, column: 9, scope: !6217)
!6235 = !DILocation(line: 112, column: 17, scope: !6236)
!6236 = distinct !DILexicalBlock(scope: !6225, file: !107, line: 111, column: 20)
!6237 = !DILocation(line: 112, column: 21, scope: !6236)
!6238 = !DILocation(line: 113, column: 17, scope: !6236)
!6239 = !DILocation(line: 117, column: 38, scope: !6218)
!6240 = !DILocation(line: 117, column: 33, scope: !6218)
!6241 = !DILocation(line: 117, column: 9, scope: !6218)
!6242 = !DILocation(line: 106, column: 29, scope: !6214)
!6243 = !DILocation(line: 106, column: 5, scope: !6214)
!6244 = distinct !{!6244, !6215, !6245, !244}
!6245 = !DILocation(line: 118, column: 5, scope: !6209)
!6246 = !DILocation(line: 119, column: 24, scope: !6247)
!6247 = distinct !DILexicalBlock(scope: !6196, file: !107, line: 119, column: 10)
!6248 = !DILocation(line: 120, column: 9, scope: !6249)
!6249 = distinct !DILexicalBlock(scope: !6247, file: !107, line: 120, column: 9)
!6250 = !DILocation(line: 120, scope: !6249)
!6251 = !DILocalVariable(name: "i", scope: !6249, file: !107, line: 120, type: !45)
!6252 = !DILocation(line: 0, scope: !6249)
!6253 = !DILocation(line: 120, column: 27, scope: !6254)
!6254 = distinct !DILexicalBlock(scope: !6249, file: !107, line: 120, column: 9)
!6255 = !DILocation(line: 121, column: 24, scope: !6256)
!6256 = distinct !DILexicalBlock(scope: !6254, file: !107, line: 120, column: 38)
!6257 = !DILocation(line: 121, column: 13, scope: !6256)
!6258 = !DILocation(line: 121, column: 21, scope: !6256)
!6259 = !DILocation(line: 120, column: 34, scope: !6254)
!6260 = !DILocation(line: 120, column: 9, scope: !6254)
!6261 = distinct !{!6261, !6248, !6262, !244}
!6262 = !DILocation(line: 122, column: 9, scope: !6249)
!6263 = !DILocation(line: 123, column: 5, scope: !6196)
!6264 = !DILocation(line: 124, column: 20, scope: !6196)
!6265 = !DILocation(line: 124, column: 5, scope: !6196)
!6266 = !DILocation(line: 125, column: 1, scope: !6196)
!6267 = distinct !DISubprogram(name: "AES256_ECB", scope: !107, file: !107, line: 24, type: !6197, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6268 = !DILocalVariable(name: "key", arg: 1, scope: !6267, file: !107, line: 24, type: !18)
!6269 = !DILocation(line: 0, scope: !6267)
!6270 = !DILocalVariable(name: "ctr", arg: 2, scope: !6267, file: !107, line: 24, type: !18)
!6271 = !DILocalVariable(name: "buffer", arg: 3, scope: !6267, file: !107, line: 24, type: !18)
!6272 = !DILocation(line: 25, column: 5, scope: !6267)
!6273 = !DILocation(line: 26, column: 1, scope: !6267)
!6274 = distinct !DISubprogram(name: "randombytes", scope: !107, file: !107, line: 127, type: !6275, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6275 = !DISubroutineType(types: !6276)
!6276 = !{!45, !18, !15}
!6277 = !DILocalVariable(name: "random_array", arg: 1, scope: !6274, file: !107, line: 127, type: !18)
!6278 = !DILocation(line: 0, scope: !6274)
!6279 = !DILocalVariable(name: "nbytes", arg: 2, scope: !6274, file: !107, line: 127, type: !15)
!6280 = !DILocation(line: 128, column: 15, scope: !6274)
!6281 = !DILocalVariable(name: "ret", scope: !6274, file: !107, line: 128, type: !45)
!6282 = !DILocation(line: 132, column: 5, scope: !6274)
!6283 = distinct !DISubprogram(name: "randombytes_nist", scope: !107, file: !107, line: 69, type: !6275, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6284 = !DILocalVariable(name: "x", arg: 1, scope: !6283, file: !107, line: 69, type: !18)
!6285 = !DILocation(line: 0, scope: !6283)
!6286 = !DILocalVariable(name: "xlen", arg: 2, scope: !6283, file: !107, line: 69, type: !15)
!6287 = !DILocalVariable(name: "block", scope: !6283, file: !107, line: 70, type: !116)
!6288 = !DILocation(line: 70, column: 21, scope: !6283)
!6289 = !DILocalVariable(name: "i", scope: !6283, file: !107, line: 71, type: !15)
!6290 = !DILocation(line: 73, column: 5, scope: !6283)
!6291 = !DILocation(line: 73, column: 18, scope: !6283)
!6292 = !DILocation(line: 75, column: 9, scope: !6293)
!6293 = distinct !DILexicalBlock(scope: !6294, file: !107, line: 75, column: 9)
!6294 = distinct !DILexicalBlock(scope: !6283, file: !107, line: 73, column: 24)
!6295 = !DILocation(line: 75, scope: !6293)
!6296 = !DILocalVariable(name: "j", scope: !6293, file: !107, line: 75, type: !45)
!6297 = !DILocation(line: 0, scope: !6293)
!6298 = !DILocation(line: 75, column: 28, scope: !6299)
!6299 = distinct !DILexicalBlock(scope: !6293, file: !107, line: 75, column: 9)
!6300 = !DILocation(line: 76, column: 18, scope: !6301)
!6301 = distinct !DILexicalBlock(scope: !6302, file: !107, line: 76, column: 18)
!6302 = distinct !DILexicalBlock(scope: !6299, file: !107, line: 75, column: 39)
!6303 = !DILocation(line: 76, column: 32, scope: !6301)
!6304 = !DILocation(line: 77, column: 17, scope: !6305)
!6305 = distinct !DILexicalBlock(scope: !6301, file: !107, line: 76, column: 42)
!6306 = !DILocation(line: 77, column: 31, scope: !6305)
!6307 = !DILocation(line: 75, column: 35, scope: !6299)
!6308 = !DILocation(line: 75, column: 9, scope: !6299)
!6309 = distinct !{!6309, !6292, !6310, !244}
!6310 = !DILocation(line: 82, column: 9, scope: !6293)
!6311 = !DILocation(line: 79, column: 17, scope: !6312)
!6312 = distinct !DILexicalBlock(scope: !6301, file: !107, line: 78, column: 20)
!6313 = !DILocation(line: 79, column: 30, scope: !6312)
!6314 = !DILocation(line: 80, column: 17, scope: !6312)
!6315 = !DILocation(line: 83, column: 9, scope: !6294)
!6316 = !DILocation(line: 84, column: 19, scope: !6317)
!6317 = distinct !DILexicalBlock(scope: !6294, file: !107, line: 84, column: 14)
!6318 = !DILocation(line: 85, column: 22, scope: !6319)
!6319 = distinct !DILexicalBlock(scope: !6317, file: !107, line: 84, column: 26)
!6320 = !DILocation(line: 85, column: 13, scope: !6319)
!6321 = !DILocation(line: 86, column: 15, scope: !6319)
!6322 = !DILocation(line: 87, column: 18, scope: !6319)
!6323 = !DILocation(line: 88, column: 9, scope: !6319)
!6324 = !DILocation(line: 89, column: 22, scope: !6325)
!6325 = distinct !DILexicalBlock(scope: !6317, file: !107, line: 88, column: 16)
!6326 = !DILocation(line: 89, column: 13, scope: !6325)
!6327 = !DILocation(line: 90, column: 15, scope: !6325)
!6328 = !DILocation(line: 0, scope: !6317)
!6329 = distinct !{!6329, !6290, !6330, !244}
!6330 = !DILocation(line: 93, column: 5, scope: !6283)
!6331 = !DILocation(line: 94, column: 5, scope: !6283)
!6332 = !DILocation(line: 95, column: 28, scope: !6283)
!6333 = !DILocation(line: 97, column: 5, scope: !6283)
!6334 = distinct !DISubprogram(name: "randombytes_init", scope: !107, file: !107, line: 136, type: !6335, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6335 = !DISubroutineType(types: !6336)
!6336 = !{null, !18, !18, !45}
!6337 = !DILocalVariable(name: "entropy_input", arg: 1, scope: !6334, file: !107, line: 136, type: !18)
!6338 = !DILocation(line: 0, scope: !6334)
!6339 = !DILocalVariable(name: "personalization_string", arg: 2, scope: !6334, file: !107, line: 137, type: !18)
!6340 = !DILocalVariable(name: "security_strength", arg: 3, scope: !6334, file: !107, line: 138, type: !45)
!6341 = !DILocation(line: 139, column: 12, scope: !6334)
!6342 = !DILocation(line: 139, column: 5, scope: !6334)
!6343 = distinct !DISubprogram(name: "randombytes_init_nist", scope: !107, file: !107, line: 51, type: !6335, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !104, retainedNodes: !28)
!6344 = !DILocalVariable(name: "entropy_input", arg: 1, scope: !6343, file: !107, line: 51, type: !18)
!6345 = !DILocation(line: 0, scope: !6343)
!6346 = !DILocalVariable(name: "personalization_string", arg: 2, scope: !6343, file: !107, line: 52, type: !18)
!6347 = !DILocalVariable(name: "security_strength", arg: 3, scope: !6343, file: !107, line: 53, type: !45)
!6348 = !DILocalVariable(name: "seed_material", scope: !6343, file: !107, line: 54, type: !6204)
!6349 = !DILocation(line: 54, column: 21, scope: !6343)
!6350 = !DILocation(line: 57, column: 5, scope: !6343)
!6351 = !DILocation(line: 58, column: 9, scope: !6352)
!6352 = distinct !DILexicalBlock(scope: !6343, file: !107, line: 58, column: 9)
!6353 = !DILocation(line: 59, column: 9, scope: !6354)
!6354 = distinct !DILexicalBlock(scope: !6352, file: !107, line: 59, column: 9)
!6355 = !DILocation(line: 59, scope: !6354)
!6356 = !DILocalVariable(name: "i", scope: !6354, file: !107, line: 59, type: !45)
!6357 = !DILocation(line: 0, scope: !6354)
!6358 = !DILocation(line: 59, column: 27, scope: !6359)
!6359 = distinct !DILexicalBlock(scope: !6354, file: !107, line: 59, column: 9)
!6360 = !DILocation(line: 60, column: 33, scope: !6361)
!6361 = distinct !DILexicalBlock(scope: !6359, file: !107, line: 59, column: 38)
!6362 = !DILocation(line: 60, column: 13, scope: !6361)
!6363 = !DILocation(line: 60, column: 30, scope: !6361)
!6364 = !DILocation(line: 59, column: 34, scope: !6359)
!6365 = !DILocation(line: 59, column: 9, scope: !6359)
!6366 = distinct !{!6366, !6353, !6367, !244}
!6367 = !DILocation(line: 61, column: 9, scope: !6354)
!6368 = !DILocation(line: 62, column: 5, scope: !6343)
!6369 = !DILocation(line: 63, column: 5, scope: !6343)
!6370 = !DILocation(line: 64, column: 5, scope: !6343)
!6371 = !DILocation(line: 65, column: 29, scope: !6343)
!6372 = !DILocation(line: 66, column: 1, scope: !6343)
