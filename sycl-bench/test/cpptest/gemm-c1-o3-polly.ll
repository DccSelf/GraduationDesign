; ModuleID = 'gemm-c1.cpp'
source_filename = "gemm-c1.cpp"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [20 x i8] c"./a.out <M> <N> <K>\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [11 x i8] c"run-time: \00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Performance: \00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c" GFlops\00", align 1
@.str.4 = private unnamed_addr constant [49 x i8] c"cannot create std::vector larger than max_size()\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_gemm_c1.cpp, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind writeonly uwtable
define dso_local void @_Z10initMatrixPfS_S_mmm(float* nocapture noundef writeonly %A, float* nocapture noundef writeonly %B, float* nocapture noundef writeonly %C, i64 noundef %NI, i64 noundef %NK, i64 noundef %NJ) local_unnamed_addr #3 {
entry.split:
  %cmp94.not = icmp eq i64 %NI, 0
  br i1 %cmp94.not, label %for.cond12.preheader, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  %cmp292.not = icmp eq i64 %NK, 0
  %conv6 = uitofp i64 %NI to float
  br i1 %cmp292.not, label %for.cond41.preheader.lr.ph, label %for.cond1.preheader.us.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %min.iters.check = icmp ult i64 %NK, 8
  %n.vec = and i64 %NK, -8
  %broadcast.splatinsert116 = insertelement <4 x float> poison, float %conv6, i64 0
  %broadcast.splat117 = shufflevector <4 x float> %broadcast.splatinsert116, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert118 = insertelement <4 x float> poison, float %conv6, i64 0
  %broadcast.splat119 = shufflevector <4 x float> %broadcast.splatinsert118, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %NK
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.cond.cleanup3_crit_edge.us
  %i.095.us = phi i64 [ %inc9.us, %for.cond1.for.cond.cleanup3_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %conv.us = uitofp i64 %i.095.us to float
  %mul7.us = mul i64 %i.095.us, %NK
  br i1 %min.iters.check, label %for.body4.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert114 = insertelement <4 x float> poison, float %conv.us, i64 0
  %broadcast.splat115 = shufflevector <4 x float> %broadcast.splatinsert114, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %0 = uitofp <4 x i64> %vec.ind to <4 x float>
  %1 = uitofp <4 x i64> %step.add to <4 x float>
  %2 = fmul <4 x float> %broadcast.splat, %0
  %3 = fmul <4 x float> %broadcast.splat115, %1
  %4 = fdiv <4 x float> %2, %broadcast.splat117
  %5 = fdiv <4 x float> %3, %broadcast.splat119
  %6 = add i64 %index, %mul7.us
  %7 = getelementptr inbounds float, float* %A, i64 %6
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %4, <4 x float>* %8, align 4, !tbaa !8
  %9 = getelementptr inbounds float, float* %7, i64 4
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %5, <4 x float>* %10, align 4, !tbaa !8
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.cond.cleanup3_crit_edge.us, label %for.body4.us.preheader

for.body4.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %j.093.us.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %for.body4.us
  %j.093.us = phi i64 [ %inc.us, %for.body4.us ], [ %j.093.us.ph, %for.body4.us.preheader ]
  %conv5.us = uitofp i64 %j.093.us to float
  %mul.us = fmul float %conv.us, %conv5.us
  %div.us = fdiv float %mul.us, %conv6
  %add.us = add i64 %j.093.us, %mul7.us
  %arrayidx.us = getelementptr inbounds float, float* %A, i64 %add.us
  store float %div.us, float* %arrayidx.us, align 4, !tbaa !8
  %inc.us = add nuw i64 %j.093.us, 1
  %exitcond.not = icmp eq i64 %inc.us, %NK
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge.us, label %for.body4.us, !llvm.loop !15

for.cond1.for.cond.cleanup3_crit_edge.us:         ; preds = %for.body4.us, %middle.block
  %inc9.us = add nuw i64 %i.095.us, 1
  %exitcond107.not = icmp eq i64 %inc9.us, %NI
  br i1 %exitcond107.not, label %for.cond12.preheader, label %for.cond1.preheader.us, !llvm.loop !17

for.cond12.preheader:                             ; preds = %for.cond1.for.cond.cleanup3_crit_edge.us, %entry.split
  %cmp1398.not = icmp eq i64 %NK, 0
  br i1 %cmp1398.not, label %for.cond36.preheader, label %for.cond17.preheader.lr.ph

for.cond17.preheader.lr.ph:                       ; preds = %for.cond12.preheader
  %cmp1896.not = icmp eq i64 %NJ, 0
  %conv24 = uitofp i64 %NJ to float
  br i1 %cmp1896.not, label %for.cond36.preheader, label %for.cond17.preheader.us.preheader

for.cond17.preheader.us.preheader:                ; preds = %for.cond17.preheader.lr.ph
  %min.iters.check122 = icmp ult i64 %NJ, 8
  %n.vec125 = and i64 %NJ, -8
  %broadcast.splatinsert138 = insertelement <4 x float> poison, float %conv24, i64 0
  %broadcast.splat139 = shufflevector <4 x float> %broadcast.splatinsert138, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert140 = insertelement <4 x float> poison, float %conv24, i64 0
  %broadcast.splat141 = shufflevector <4 x float> %broadcast.splatinsert140, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n127 = icmp eq i64 %n.vec125, %NJ
  br label %for.cond17.preheader.us

for.cond17.preheader.us:                          ; preds = %for.cond17.preheader.us.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us
  %i11.099.us = phi i64 [ %inc33.us, %for.cond17.for.cond.cleanup19_crit_edge.us ], [ 0, %for.cond17.preheader.us.preheader ]
  %conv21.us = uitofp i64 %i11.099.us to float
  %mul26.us = mul i64 %i11.099.us, %NJ
  br i1 %min.iters.check122, label %for.body20.us.preheader, label %vector.ph123

vector.ph123:                                     ; preds = %for.cond17.preheader.us
  %broadcast.splatinsert134 = insertelement <4 x float> poison, float %conv21.us, i64 0
  %broadcast.splat135 = shufflevector <4 x float> %broadcast.splatinsert134, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <4 x float> poison, float %conv21.us, i64 0
  %broadcast.splat137 = shufflevector <4 x float> %broadcast.splatinsert136, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body128

vector.body128:                                   ; preds = %vector.body128, %vector.ph123
  %index129 = phi i64 [ 0, %vector.ph123 ], [ %index.next142, %vector.body128 ]
  %vec.ind130 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph123 ], [ %vec.ind.next133, %vector.body128 ]
  %step.add131 = add <4 x i64> %vec.ind130, <i64 4, i64 4, i64 4, i64 4>
  %12 = uitofp <4 x i64> %vec.ind130 to <4 x float>
  %13 = uitofp <4 x i64> %step.add131 to <4 x float>
  %14 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat135, <4 x float> %12, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %15 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat137, <4 x float> %13, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %16 = fdiv <4 x float> %14, %broadcast.splat139
  %17 = fdiv <4 x float> %15, %broadcast.splat141
  %18 = add i64 %index129, %mul26.us
  %19 = getelementptr inbounds float, float* %B, i64 %18
  %20 = bitcast float* %19 to <4 x float>*
  store <4 x float> %16, <4 x float>* %20, align 4, !tbaa !8
  %21 = getelementptr inbounds float, float* %19, i64 4
  %22 = bitcast float* %21 to <4 x float>*
  store <4 x float> %17, <4 x float>* %22, align 4, !tbaa !8
  %index.next142 = add nuw i64 %index129, 8
  %vec.ind.next133 = add <4 x i64> %vec.ind130, <i64 8, i64 8, i64 8, i64 8>
  %23 = icmp eq i64 %index.next142, %n.vec125
  br i1 %23, label %middle.block120, label %vector.body128, !llvm.loop !18

middle.block120:                                  ; preds = %vector.body128
  br i1 %cmp.n127, label %for.cond17.for.cond.cleanup19_crit_edge.us, label %for.body20.us.preheader

for.body20.us.preheader:                          ; preds = %for.cond17.preheader.us, %middle.block120
  %j16.097.us.ph = phi i64 [ 0, %for.cond17.preheader.us ], [ %n.vec125, %middle.block120 ]
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.body20.us.preheader, %for.body20.us
  %j16.097.us = phi i64 [ %inc30.us, %for.body20.us ], [ %j16.097.us.ph, %for.body20.us.preheader ]
  %conv22.us = uitofp i64 %j16.097.us to float
  %24 = tail call float @llvm.fmuladd.f32(float %conv21.us, float %conv22.us, float 1.000000e+00)
  %div25.us = fdiv float %24, %conv24
  %add27.us = add i64 %j16.097.us, %mul26.us
  %arrayidx28.us = getelementptr inbounds float, float* %B, i64 %add27.us
  store float %div25.us, float* %arrayidx28.us, align 4, !tbaa !8
  %inc30.us = add nuw i64 %j16.097.us, 1
  %exitcond108.not = icmp eq i64 %inc30.us, %NJ
  br i1 %exitcond108.not, label %for.cond17.for.cond.cleanup19_crit_edge.us, label %for.body20.us, !llvm.loop !19

for.cond17.for.cond.cleanup19_crit_edge.us:       ; preds = %for.body20.us, %middle.block120
  %inc33.us = add nuw i64 %i11.099.us, 1
  %exitcond109.not = icmp eq i64 %inc33.us, %NK
  br i1 %exitcond109.not, label %for.cond36.preheader, label %for.cond17.preheader.us, !llvm.loop !20

for.cond36.preheader:                             ; preds = %for.cond17.for.cond.cleanup19_crit_edge.us, %for.cond17.preheader.lr.ph, %for.cond12.preheader
  br i1 %cmp94.not, label %for.cond.cleanup38, label %for.cond41.preheader.lr.ph

for.cond41.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond36.preheader
  %cmp42100.not = icmp eq i64 %NJ, 0
  %conv48 = uitofp i64 %NJ to float
  br i1 %cmp42100.not, label %for.cond.cleanup38, label %for.cond41.preheader.us.preheader

for.cond41.preheader.us.preheader:                ; preds = %for.cond41.preheader.lr.ph
  %min.iters.check145 = icmp ult i64 %NJ, 8
  %n.vec148 = and i64 %NJ, -8
  %broadcast.splatinsert161 = insertelement <4 x float> poison, float %conv48, i64 0
  %broadcast.splat162 = shufflevector <4 x float> %broadcast.splatinsert161, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert163 = insertelement <4 x float> poison, float %conv48, i64 0
  %broadcast.splat164 = shufflevector <4 x float> %broadcast.splatinsert163, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n150 = icmp eq i64 %n.vec148, %NJ
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.preheader.us.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us
  %i35.0103.us = phi i64 [ %inc57.us, %for.cond41.for.cond.cleanup43_crit_edge.us ], [ 0, %for.cond41.preheader.us.preheader ]
  %conv45.us = uitofp i64 %i35.0103.us to float
  %mul50.us = mul i64 %i35.0103.us, %NJ
  br i1 %min.iters.check145, label %for.body44.us.preheader, label %vector.ph146

vector.ph146:                                     ; preds = %for.cond41.preheader.us
  %broadcast.splatinsert157 = insertelement <4 x float> poison, float %conv45.us, i64 0
  %broadcast.splat158 = shufflevector <4 x float> %broadcast.splatinsert157, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert159 = insertelement <4 x float> poison, float %conv45.us, i64 0
  %broadcast.splat160 = shufflevector <4 x float> %broadcast.splatinsert159, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body151

vector.body151:                                   ; preds = %vector.body151, %vector.ph146
  %index152 = phi i64 [ 0, %vector.ph146 ], [ %index.next165, %vector.body151 ]
  %vec.ind153 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph146 ], [ %vec.ind.next156, %vector.body151 ]
  %step.add154 = add <4 x i64> %vec.ind153, <i64 4, i64 4, i64 4, i64 4>
  %25 = uitofp <4 x i64> %vec.ind153 to <4 x float>
  %26 = uitofp <4 x i64> %step.add154 to <4 x float>
  %27 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat158, <4 x float> %25, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %28 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat160, <4 x float> %26, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %29 = fdiv <4 x float> %27, %broadcast.splat162
  %30 = fdiv <4 x float> %28, %broadcast.splat164
  %31 = add i64 %index152, %mul50.us
  %32 = getelementptr inbounds float, float* %C, i64 %31
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %29, <4 x float>* %33, align 4, !tbaa !8
  %34 = getelementptr inbounds float, float* %32, i64 4
  %35 = bitcast float* %34 to <4 x float>*
  store <4 x float> %30, <4 x float>* %35, align 4, !tbaa !8
  %index.next165 = add nuw i64 %index152, 8
  %vec.ind.next156 = add <4 x i64> %vec.ind153, <i64 8, i64 8, i64 8, i64 8>
  %36 = icmp eq i64 %index.next165, %n.vec148
  br i1 %36, label %middle.block143, label %vector.body151, !llvm.loop !21

middle.block143:                                  ; preds = %vector.body151
  br i1 %cmp.n150, label %for.cond41.for.cond.cleanup43_crit_edge.us, label %for.body44.us.preheader

for.body44.us.preheader:                          ; preds = %for.cond41.preheader.us, %middle.block143
  %j40.0101.us.ph = phi i64 [ 0, %for.cond41.preheader.us ], [ %n.vec148, %middle.block143 ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us.preheader, %for.body44.us
  %j40.0101.us = phi i64 [ %inc54.us, %for.body44.us ], [ %j40.0101.us.ph, %for.body44.us.preheader ]
  %conv46.us = uitofp i64 %j40.0101.us to float
  %37 = tail call float @llvm.fmuladd.f32(float %conv45.us, float %conv46.us, float 2.000000e+00)
  %div49.us = fdiv float %37, %conv48
  %add51.us = add i64 %j40.0101.us, %mul50.us
  %arrayidx52.us = getelementptr inbounds float, float* %C, i64 %add51.us
  store float %div49.us, float* %arrayidx52.us, align 4, !tbaa !8
  %inc54.us = add nuw i64 %j40.0101.us, 1
  %exitcond110.not = icmp eq i64 %inc54.us, %NJ
  br i1 %exitcond110.not, label %for.cond41.for.cond.cleanup43_crit_edge.us, label %for.body44.us, !llvm.loop !22

for.cond41.for.cond.cleanup43_crit_edge.us:       ; preds = %for.body44.us, %middle.block143
  %inc57.us = add nuw i64 %i35.0103.us, 1
  %exitcond111.not = icmp eq i64 %inc57.us, %NI
  br i1 %exitcond111.not, label %for.cond.cleanup38, label %for.cond41.preheader.us, !llvm.loop !23

for.cond.cleanup38:                               ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us, %for.cond41.preheader.lr.ph, %for.cond36.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind uwtable
define dso_local void @_Z6matmulPfS_S_mmmmmm(float* nocapture noundef %C, float* nocapture noundef readonly %A, float* nocapture noundef readonly %B, i64 noundef %M, i64 noundef %N, i64 noundef %K, i64 noundef %lda, i64 noundef %ldb, i64 noundef %ldc) local_unnamed_addr #5 {
polly.split_new_and_old:
  %Packed_B = alloca [256 x [512 x [8 x float]]], align 64
  %Packed_A = alloca [24 x [512 x [4 x float]]], align 64
  %0 = icmp sge i64 %lda, %K
  %1 = icmp sge i64 %ldb, %N
  %2 = and i1 %0, %1
  %3 = icmp sge i64 %ldc, %N
  %4 = and i1 %2, %3
  %5 = icmp slt i64 %M, 0
  %6 = icmp slt i64 %K, 0
  %7 = and i64 %K, %M
  %8 = icmp slt i64 %7, 0
  %9 = icmp slt i64 %N, 0
  %10 = and i64 %7, %N
  %11 = icmp slt i64 %10, 0
  %12 = icmp sgt i64 %N, 0
  %13 = and i1 %12, %8
  %14 = or i1 %11, %13
  %15 = icmp sgt i64 %K, 0
  %16 = and i1 %5, %15
  %17 = icmp ne i64 %N, 0
  %18 = icmp sgt i64 %M, 0
  %19 = and i1 %18, %6
  %20 = or i1 %16, %19
  %21 = and i1 %17, %20
  %22 = or i1 %21, %14
  %23 = and i1 %18, %15
  %24 = and i1 %9, %23
  %25 = or i1 %24, %22
  %26 = xor i1 %25, true
  %27 = and i1 %4, %26
  %28 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %K, i64 -1)
  %.obit = extractvalue { i64, i1 } %28, 1
  %.res = extractvalue { i64, i1 } %28, 0
  %polly.access.mul.B = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %ldb)
  %polly.access.mul.B.obit = extractvalue { i64, i1 } %polly.access.mul.B, 1
  %polly.overflow.state51 = or i1 %.obit, %polly.access.mul.B.obit
  %polly.access.mul.B.res = extractvalue { i64, i1 } %polly.access.mul.B, 0
  %polly.access.add.B = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.B.res, i64 %N)
  %polly.access.add.B.obit = extractvalue { i64, i1 } %polly.access.add.B, 1
  %polly.overflow.state52 = or i1 %polly.overflow.state51, %polly.access.add.B.obit
  %polly.access.add.B.res = extractvalue { i64, i1 } %polly.access.add.B, 0
  %polly.access.B = getelementptr float, float* %B, i64 %polly.access.add.B.res
  %29 = icmp ule float* %polly.access.B, %C
  %30 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %M, i64 -1)
  %.obit55 = extractvalue { i64, i1 } %30, 1
  %polly.overflow.state56 = or i1 %.obit55, %polly.overflow.state52
  %.res57 = extractvalue { i64, i1 } %30, 0
  %polly.access.mul.C58 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res57, i64 %ldc)
  %polly.access.mul.C.obit59 = extractvalue { i64, i1 } %polly.access.mul.C58, 1
  %polly.overflow.state60 = or i1 %polly.access.mul.C.obit59, %polly.overflow.state56
  %polly.access.mul.C.res61 = extractvalue { i64, i1 } %polly.access.mul.C58, 0
  %polly.access.add.C62 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.C.res61, i64 %N)
  %polly.access.add.C.obit63 = extractvalue { i64, i1 } %polly.access.add.C62, 1
  %polly.overflow.state64 = or i1 %polly.access.add.C.obit63, %polly.overflow.state60
  %polly.access.add.C.res65 = extractvalue { i64, i1 } %polly.access.add.C62, 0
  %polly.access.C66 = getelementptr float, float* %C, i64 %polly.access.add.C.res65
  %31 = icmp ule float* %polly.access.C66, %B
  %32 = or i1 %29, %31
  %33 = and i1 %27, %32
  %polly.access.mul.A = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res57, i64 %lda)
  %polly.access.mul.A.obit = extractvalue { i64, i1 } %polly.access.mul.A, 1
  %polly.overflow.state79 = or i1 %polly.access.mul.A.obit, %polly.overflow.state64
  %polly.access.mul.A.res = extractvalue { i64, i1 } %polly.access.mul.A, 0
  %polly.access.add.A = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.A.res, i64 %K)
  %polly.access.add.A.obit = extractvalue { i64, i1 } %polly.access.add.A, 1
  %polly.overflow.state80 = or i1 %polly.access.add.A.obit, %polly.overflow.state79
  %polly.access.add.A.res = extractvalue { i64, i1 } %polly.access.add.A, 0
  %polly.access.A = getelementptr float, float* %A, i64 %polly.access.add.A.res
  %34 = icmp ule float* %polly.access.A, %C
  %35 = icmp ule float* %polly.access.C66, %A
  %36 = or i1 %34, %35
  %37 = and i1 %36, %33
  %polly.rtc.overflown = xor i1 %polly.overflow.state80, true
  %polly.rtc.result = and i1 %37, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.cond, label %entry.split

entry.split:                                      ; preds = %polly.split_new_and_old
  %cmp38.not = icmp eq i64 %M, 0
  %cmp236.not = icmp eq i64 %K, 0
  %or.cond = or i1 %cmp38.not, %cmp236.not
  %cmp634.not = icmp eq i64 %N, 0
  %or.cond50 = or i1 %cmp634.not, %or.cond
  br i1 %or.cond50, label %for.cond.cleanup, label %for.cond1.preheader.us.us.preheader

for.cond1.preheader.us.us.preheader:              ; preds = %entry.split
  %min.iters.check = icmp ult i64 %N, 8
  %n.vec = and i64 %N, -8
  %cmp.n = icmp eq i64 %n.vec, %N
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us
  %i.039.us.us = phi i64 [ %inc20.us.us, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us ], [ 0, %for.cond1.preheader.us.us.preheader ]
  %38 = mul i64 %i.039.us.us, %ldc
  %scevgep = getelementptr float, float* %C, i64 %38
  %39 = add i64 %38, %N
  %scevgep3796 = getelementptr float, float* %C, i64 %39
  %40 = mul i64 %i.039.us.us, %lda
  %41 = add i64 %40, 1
  %mul.us.us = mul i64 %i.039.us.us, %lda
  %mul13.us.us = mul i64 %i.039.us.us, %ldc
  br label %for.cond5.preheader.us.us.us

for.cond5.preheader.us.us.us:                     ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %k.037.us.us.us = phi i64 [ 0, %for.cond1.preheader.us.us ], [ %inc17.us.us.us, %for.cond5.for.cond.cleanup7_crit_edge.us.us.us ]
  %add.us.us.us = add i64 %k.037.us.us.us, %mul.us.us
  %arrayidx.us.us.us = getelementptr inbounds float, float* %A, i64 %add.us.us.us
  %mul9.us.us.us = mul i64 %k.037.us.us.us, %ldb
  br i1 %min.iters.check, label %for.body8.us.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond5.preheader.us.us.us
  %42 = mul i64 %k.037.us.us.us, %ldb
  %43 = add i64 %42, %N
  %scevgep3804 = getelementptr float, float* %B, i64 %43
  %scevgep3802 = getelementptr float, float* %B, i64 %42
  %44 = add i64 %41, %k.037.us.us.us
  %scevgep3800 = getelementptr float, float* %A, i64 %44
  %45 = add i64 %40, %k.037.us.us.us
  %scevgep3798 = getelementptr float, float* %A, i64 %45
  %bound0 = icmp ult float* %scevgep, %scevgep3800
  %bound1 = icmp ult float* %scevgep3798, %scevgep3796
  %found.conflict = and i1 %bound0, %bound1
  %bound03806 = icmp ult float* %scevgep, %scevgep3804
  %bound13807 = icmp ult float* %scevgep3802, %scevgep3796
  %found.conflict3808 = and i1 %bound03806, %bound13807
  %conflict.rdx = or i1 %found.conflict, %found.conflict3808
  br i1 %conflict.rdx, label %for.body8.us.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %46 = load float, float* %arrayidx.us.us.us, align 4, !tbaa !8, !alias.scope !24
  %broadcast.splatinsert = insertelement <4 x float> poison, float %46, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3812 = insertelement <4 x float> poison, float %46, i64 0
  %broadcast.splat3813 = shufflevector <4 x float> %broadcast.splatinsert3812, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %47 = add i64 %index, %mul9.us.us.us
  %48 = getelementptr inbounds float, float* %B, i64 %47
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %49, align 4, !tbaa !8, !alias.scope !27
  %50 = getelementptr inbounds float, float* %48, i64 4
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load3809 = load <4 x float>, <4 x float>* %51, align 4, !tbaa !8, !alias.scope !27
  %52 = add i64 %index, %mul13.us.us
  %53 = getelementptr inbounds float, float* %C, i64 %52
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load3810 = load <4 x float>, <4 x float>* %54, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %55 = getelementptr inbounds float, float* %53, i64 4
  %56 = bitcast float* %55 to <4 x float>*
  %wide.load3811 = load <4 x float>, <4 x float>* %56, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %57 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load3810)
  %58 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3813, <4 x float> %wide.load3809, <4 x float> %wide.load3811)
  %59 = bitcast float* %53 to <4 x float>*
  store <4 x float> %57, <4 x float>* %59, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %60 = bitcast float* %55 to <4 x float>*
  store <4 x float> %58, <4 x float>* %60, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %index.next = add nuw i64 %index, 8
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !32

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us, label %for.body8.us.us.us.preheader

for.body8.us.us.us.preheader:                     ; preds = %vector.memcheck, %for.cond5.preheader.us.us.us, %middle.block
  %j.035.us.us.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond5.preheader.us.us.us ], [ %n.vec, %middle.block ]
  br label %for.body8.us.us.us

for.body8.us.us.us:                               ; preds = %for.body8.us.us.us.preheader, %for.body8.us.us.us
  %j.035.us.us.us = phi i64 [ %inc.us.us.us, %for.body8.us.us.us ], [ %j.035.us.us.us.ph, %for.body8.us.us.us.preheader ]
  %62 = load float, float* %arrayidx.us.us.us, align 4, !tbaa !8
  %add10.us.us.us = add i64 %j.035.us.us.us, %mul9.us.us.us
  %arrayidx11.us.us.us = getelementptr inbounds float, float* %B, i64 %add10.us.us.us
  %63 = load float, float* %arrayidx11.us.us.us, align 4, !tbaa !8
  %add14.us.us.us = add i64 %j.035.us.us.us, %mul13.us.us
  %arrayidx15.us.us.us = getelementptr inbounds float, float* %C, i64 %add14.us.us.us
  %64 = load float, float* %arrayidx15.us.us.us, align 4, !tbaa !8
  %65 = tail call float @llvm.fmuladd.f32(float %62, float %63, float %64)
  store float %65, float* %arrayidx15.us.us.us, align 4, !tbaa !8
  %inc.us.us.us = add nuw i64 %j.035.us.us.us, 1
  %exitcond.not = icmp eq i64 %inc.us.us.us, %N
  br i1 %exitcond.not, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us, label %for.body8.us.us.us, !llvm.loop !33

for.cond5.for.cond.cleanup7_crit_edge.us.us.us:   ; preds = %for.body8.us.us.us, %middle.block
  %inc17.us.us.us = add nuw i64 %k.037.us.us.us, 1
  %exitcond48.not = icmp eq i64 %inc17.us.us.us, %K
  br i1 %exitcond48.not, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, label %for.cond5.preheader.us.us.us, !llvm.loop !34

for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us: ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.us.us
  %inc20.us.us = add nuw i64 %i.039.us.us, 1
  %exitcond49.not = icmp eq i64 %inc20.us.us, %M
  br i1 %exitcond49.not, label %for.cond.cleanup, label %for.cond1.preheader.us.us, !llvm.loop !35

for.cond.cleanup:                                 ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, %polly.loop_exit115.loopexit.us, %polly.loop_if112.preheader, %polly.cond, %polly.loop_if, %entry.split
  ret void

polly.cond:                                       ; preds = %polly.split_new_and_old
  br i1 %18, label %polly.loop_if, label %for.cond.cleanup

polly.loop_if:                                    ; preds = %polly.cond
  %66 = add i64 %N, -1
  %polly.fdiv_q.shr = ashr i64 %66, 11
  br i1 %12, label %polly.loop_if112.preheader, label %for.cond.cleanup

polly.loop_if112.preheader:                       ; preds = %polly.loop_if
  %polly.loop_guard145 = icmp sgt i64 %.res57, -96
  %pexp.pdiv_r1699 = and i64 %N, 7
  %67 = icmp ne i64 %pexp.pdiv_r1699, 0
  %pexp.p_div_q1763597 = lshr i64 %N, 3
  %pexp.p_div_q1853598 = lshr i64 %M, 2
  %pexp.pdiv_r778 = and i64 %M, 3
  %68 = icmp ne i64 %pexp.pdiv_r778, 0
  %pexp.pdiv_r1215 = and i64 %.res57, 3
  %69 = sub nsw i64 %M, %pexp.pdiv_r1215
  %70 = add nsw i64 %69, -1
  %pexp.p_div_q12183599 = lshr i64 %.res57, 2
  %71 = mul i64 %70, %ldc
  %72 = icmp ugt i64 %pexp.pdiv_r778, 1
  %73 = mul i64 %69, %ldc
  %74 = add nuw nsw i64 %M, 1
  %75 = and i64 %74, 3
  %76 = icmp eq i64 %75, 0
  %77 = add nsw i64 %M, -3
  %pexp.div = ashr exact i64 %77, 2
  %78 = mul i64 %.res57, %ldc
  %pexp.pdiv_r2843 = and i64 %66, 7
  %79 = sub nsw i64 %N, %pexp.pdiv_r2843
  %80 = add nsw i64 %79, -1
  %pexp.p_div_q28533532 = lshr i64 %66, 3
  %81 = icmp ugt i64 %pexp.pdiv_r1699, 1
  %82 = add nsw i64 %N, -2
  %pexp.p_div_q28783550 = lshr i64 %82, 3
  %.not3551 = icmp eq i64 %pexp.pdiv_r1699, 2
  %83 = add nsw i64 %N, -3
  %pexp.p_div_q29033552 = lshr i64 %83, 3
  %84 = icmp ugt i64 %pexp.pdiv_r1699, 3
  %.not3553 = icmp eq i64 %pexp.pdiv_r1699, 4
  %85 = icmp ugt i64 %pexp.pdiv_r1699, 5
  %86 = add nuw nsw i64 %N, 1
  %87 = and i64 %86, 7
  %88 = icmp eq i64 %87, 0
  %89 = add nsw i64 %N, -7
  %pexp.div3002 = ashr exact i64 %89, 3
  %90 = add i64 %78, 1
  br i1 %15, label %polly.loop_if112.us.preheader, label %for.cond.cleanup

polly.loop_if112.us.preheader:                    ; preds = %polly.loop_if112.preheader
  %pexp.fdiv_q.4 = sdiv i64 %.res57, 96
  %polly.fdiv_q.shr111 = ashr i64 %.res, 9
  %smax = call i64 @llvm.smax.i64(i64 %polly.fdiv_q.shr111, i64 0)
  %smax3753 = call i64 @llvm.smax.i64(i64 %polly.fdiv_q.shr, i64 0)
  br label %polly.loop_if112.us

polly.loop_if112.us:                              ; preds = %polly.loop_if112.us.preheader, %polly.loop_exit115.loopexit.us
  %indvars.iv3742 = phi i64 [ %pexp.p_div_q28533532, %polly.loop_if112.us.preheader ], [ %indvars.iv.next3743, %polly.loop_exit115.loopexit.us ]
  %indvars.iv3729 = phi i64 [ %pexp.p_div_q1763597, %polly.loop_if112.us.preheader ], [ %indvars.iv.next3730, %polly.loop_exit115.loopexit.us ]
  %polly.indvar.us = phi i64 [ 0, %polly.loop_if112.us.preheader ], [ %polly.indvar_next.us, %polly.loop_exit115.loopexit.us ]
  %91 = shl nuw i64 %polly.indvar.us, 11
  %92 = or i64 %91, 2047
  %smin3844 = call i64 @llvm.smin.i64(i64 %92, i64 %66)
  %smax3845 = call i64 @llvm.smax.i64(i64 %smin3844, i64 %91)
  %93 = mul nsw i64 %polly.indvar.us, -2048
  %94 = or i64 %93, 1
  %95 = add i64 %smax3845, %94
  %96 = shl nuw i64 %polly.indvar.us, 11
  %97 = or i64 %96, 2047
  %smin3827 = call i64 @llvm.smin.i64(i64 %97, i64 %66)
  %smax3828 = call i64 @llvm.smax.i64(i64 %smin3827, i64 %96)
  %98 = mul nsw i64 %polly.indvar.us, -2048
  %99 = or i64 %98, 1
  %100 = add i64 %smax3828, %99
  %smin3744 = call i64 @llvm.smin.i64(i64 %indvars.iv3742, i64 255)
  %smin3731 = call i64 @llvm.smin.i64(i64 %indvars.iv3729, i64 256)
  %101 = call i64 @llvm.smax.i64(i64 %smin3731, i64 1)
  %102 = shl nsw i64 %polly.indvar.us, 11
  %103 = or i64 %102, 2047
  %104 = tail call i64 @llvm.smin.i64(i64 %66, i64 %103)
  %polly.loop_guard132.not.us = icmp sgt i64 %102, %104
  %polly.loop_guard132.not.fr.us = freeze i1 %polly.loop_guard132.not.us
  %105 = mul nsw i64 %polly.indvar.us, -256
  %106 = or i64 %102, 7
  %107 = icmp sge i64 %106, %N
  %108 = icmp sge i64 %103, %N
  %109 = and i1 %67, %108
  %110 = add nsw i64 %105, %pexp.p_div_q1763597
  %polly.loop_guard181.us = icmp slt i64 %110, 1
  %111 = add nsw i64 %105, %pexp.p_div_q28533532
  %polly.access.mul.Packed_B2854.us = shl nsw i64 %111, 9
  %112 = add nsw i64 %105, %pexp.p_div_q28783550
  %polly.access.mul.Packed_B2879.us = shl nsw i64 %112, 9
  %113 = add nsw i64 %105, %pexp.p_div_q29033552
  %polly.access.mul.Packed_B2904.us = shl nsw i64 %113, 9
  %114 = add nsw i64 %105, %pexp.div3002
  %polly.access.mul.Packed_B3003.us = shl nsw i64 %114, 9
  %115 = tail call i64 @llvm.smin.i64(i64 %111, i64 255)
  %polly.loop_guard2314.us = icmp sgt i64 %115, -1
  %116 = or i64 %102, 2
  %.not3577.us = icmp sgt i64 %116, %N
  %117 = or i64 %102, 1
  %118 = or i64 %102, 3
  %.not3593.us = icmp sgt i64 %118, %N
  %119 = or i64 %102, 4
  %.not3594.us = icmp sgt i64 %119, %N
  %120 = or i64 %102, 5
  %.not3595.us = icmp sgt i64 %120, %N
  %121 = or i64 %102, 6
  %.not3596.us = icmp sgt i64 %121, %N
  %122 = icmp eq i64 %106, %N
  br i1 %polly.loop_guard145, label %polly.loop_if120.us.us.preheader, label %polly.loop_if120.preheader.split.us3688

polly.loop_if120.us.us.preheader:                 ; preds = %polly.loop_if112.us
  %min.iters.check3831 = icmp ult i64 %100, 2
  %n.vec3834 = and i64 %100, -2
  %ind.end3836 = add i64 %102, %n.vec3834
  %cmp.n3837 = icmp eq i64 %100, %n.vec3834
  br label %polly.loop_if120.us.us

polly.loop_if120.us3662:                          ; preds = %polly.loop_if120.us3662.preheader, %polly.loop_if141.us3681
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_if141.us3681 ], [ 511, %polly.loop_if120.us3662.preheader ]
  %polly.indvar117.us3663 = phi i64 [ %polly.indvar_next118.us3682, %polly.loop_if141.us3681 ], [ 0, %polly.loop_if120.us3662.preheader ]
  %smin = call i64 @llvm.smin.i64(i64 %indvars.iv, i64 %.res)
  %123 = shl nsw i64 %polly.indvar117.us3663, 9
  %124 = or i64 %123, 511
  %125 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %124)
  %polly.loop_guard124.not.us3664 = icmp sgt i64 %123, %125
  br i1 %polly.loop_guard124.not.us3664, label %polly.loop_if141.us3681, label %polly.loop_if128.preheader.us3685

polly.loop_if128.us:                              ; preds = %polly.loop_if128.preheader.us3685, %polly.loop_exit131.loopexit.us3684
  %polly.indvar125.us = phi i64 [ %polly.indvar_next126.us, %polly.loop_exit131.loopexit.us3684 ], [ %123, %polly.loop_if128.preheader.us3685 ]
  %polly.access.mul.B136.us3665 = mul nsw i64 %polly.indvar125.us, %ldb
  br i1 %min.iters.check3848, label %polly.loop_header129.us3666.preheader, label %vector.body3855

vector.body3855:                                  ; preds = %polly.loop_if128.us, %vector.body3855
  %index3856 = phi i64 [ %index.next3860, %vector.body3855 ], [ 0, %polly.loop_if128.us ]
  %offset.idx3857 = add i64 %102, %index3856
  %induction3859 = or i64 %offset.idx3857, 1
  %126 = add nsw i64 %offset.idx3857, %polly.access.mul.B136.us3665
  %127 = add nsw i64 %induction3859, %polly.access.mul.B136.us3665
  %128 = getelementptr float, float* %B, i64 %126
  %129 = getelementptr float, float* %B, i64 %127
  %130 = load float, float* %128, align 4, !alias.scope !36, !noalias !39
  %131 = load float, float* %129, align 4, !alias.scope !36, !noalias !39
  %132 = lshr i64 %offset.idx3857, 3
  %133 = lshr i64 %offset.idx3857, 3
  %134 = add i64 %149, %132
  %135 = add i64 %149, %133
  %136 = shl i64 %134, 9
  %137 = shl i64 %135, 9
  %138 = add i64 %136, %polly.indvar125.us
  %139 = add i64 %137, %polly.indvar125.us
  %140 = shl nsw i64 %138, 3
  %141 = shl nsw i64 %139, 3
  %142 = and i64 %offset.idx3857, 6
  %143 = and i64 %induction3859, 7
  %144 = or i64 %140, %142
  %145 = or i64 %141, %143
  %146 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %144
  %147 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %145
  store float %130, float* %146, align 8, !alias.scope !44, !noalias !45
  store float %131, float* %147, align 4, !alias.scope !44, !noalias !45
  %index.next3860 = add nuw i64 %index3856, 2
  %148 = icmp eq i64 %index.next3860, %n.vec3851
  br i1 %148, label %middle.block3846, label %vector.body3855, !llvm.loop !46

middle.block3846:                                 ; preds = %vector.body3855
  br i1 %cmp.n3854, label %polly.loop_exit131.loopexit.us3684, label %polly.loop_header129.us3666.preheader

polly.loop_header129.us3666.preheader:            ; preds = %polly.loop_if128.us, %middle.block3846
  %polly.indvar133.us3667.ph = phi i64 [ %102, %polly.loop_if128.us ], [ %ind.end3853, %middle.block3846 ]
  br label %polly.loop_header129.us3666

polly.loop_header129.us3666:                      ; preds = %polly.loop_header129.us3666.preheader, %polly.loop_header129.us3666
  %polly.indvar133.us3667 = phi i64 [ %polly.indvar_next134.us3679, %polly.loop_header129.us3666 ], [ %polly.indvar133.us3667.ph, %polly.loop_header129.us3666.preheader ]
  %polly.access.add.B137.us3668 = add nsw i64 %polly.indvar133.us3667, %polly.access.mul.B136.us3665
  %polly.access.B138.us3669 = getelementptr float, float* %B, i64 %polly.access.add.B137.us3668
  %polly.access.B138.load.us3670 = load float, float* %polly.access.B138.us3669, align 4, !alias.scope !36, !noalias !39
  %pexp.p_div_q3603.us3671 = lshr i64 %polly.indvar133.us3667, 3
  %reass.add.us3672 = add i64 %149, %pexp.p_div_q3603.us3671
  %reass.mul.us3673 = shl i64 %reass.add.us3672, 9
  %polly.access.add.Packed_B.us3674 = add i64 %reass.mul.us3673, %polly.indvar125.us
  %polly.access.mul.Packed_B139.us3675 = shl nsw i64 %polly.access.add.Packed_B.us3674, 3
  %pexp.pdiv_r.us3676 = and i64 %polly.indvar133.us3667, 7
  %polly.access.add.Packed_B140.us3677 = or i64 %polly.access.mul.Packed_B139.us3675, %pexp.pdiv_r.us3676
  %polly.access.Packed_B.us3678 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B140.us3677
  store float %polly.access.B138.load.us3670, float* %polly.access.Packed_B.us3678, align 4, !alias.scope !44, !noalias !45
  %polly.indvar_next134.us3679 = add nuw nsw i64 %polly.indvar133.us3667, 1
  %polly.loop_cond135.not.not.us3680 = icmp slt i64 %polly.indvar133.us3667, %104
  br i1 %polly.loop_cond135.not.not.us3680, label %polly.loop_header129.us3666, label %polly.loop_exit131.loopexit.us3684, !llvm.loop !47

polly.loop_if141.us3681:                          ; preds = %polly.loop_exit131.loopexit.us3684, %polly.loop_if120.us3662
  %polly.indvar_next118.us3682 = add nuw nsw i64 %polly.indvar117.us3663, 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 512
  %exitcond3705.not = icmp eq i64 %polly.indvar117.us3663, %smax
  br i1 %exitcond3705.not, label %polly.loop_exit115.loopexit.us, label %polly.loop_if120.us3662

polly.loop_exit131.loopexit.us3684:               ; preds = %polly.loop_header129.us3666, %middle.block3846
  %polly.indvar_next126.us = add nuw i64 %polly.indvar125.us, 1
  %exitcond.not3755 = icmp eq i64 %polly.indvar125.us, %smin
  br i1 %exitcond.not3755, label %polly.loop_if141.us3681, label %polly.loop_if128.us

polly.loop_if128.preheader.us3685:                ; preds = %polly.loop_if120.us3662
  %149 = sub nsw i64 %105, %polly.indvar117.us3663
  br label %polly.loop_if128.us

polly.loop_if120.preheader.split.us3688:          ; preds = %polly.loop_if112.us
  br i1 %polly.loop_guard132.not.fr.us, label %polly.loop_exit115.loopexit.us, label %polly.loop_if120.us3662.preheader

polly.loop_if120.us3662.preheader:                ; preds = %polly.loop_if120.preheader.split.us3688
  %min.iters.check3848 = icmp ult i64 %95, 2
  %n.vec3851 = and i64 %95, -2
  %ind.end3853 = add i64 %102, %n.vec3851
  %cmp.n3854 = icmp eq i64 %95, %n.vec3851
  br label %polly.loop_if120.us3662

polly.loop_exit115.loopexit.us:                   ; preds = %polly.loop_if141.us3681, %polly.loop_exit144.loopexit.us.us, %polly.loop_if120.preheader.split.us3688
  %polly.indvar_next.us = add nuw nsw i64 %polly.indvar.us, 1
  %indvars.iv.next3730 = add nsw i64 %indvars.iv3729, -256
  %indvars.iv.next3743 = add nsw i64 %indvars.iv3742, -256
  %exitcond3754.not = icmp eq i64 %polly.indvar.us, %smax3753
  br i1 %exitcond3754.not, label %for.cond.cleanup, label %polly.loop_if112.us

polly.loop_if120.us.us:                           ; preds = %polly.loop_if120.us.us.preheader, %polly.loop_exit144.loopexit.us.us
  %indvars.iv3716 = phi i64 [ %indvars.iv.next3717, %polly.loop_exit144.loopexit.us.us ], [ %.res, %polly.loop_if120.us.us.preheader ]
  %indvars.iv3706 = phi i64 [ %indvars.iv.next3707, %polly.loop_exit144.loopexit.us.us ], [ 511, %polly.loop_if120.us.us.preheader ]
  %polly.indvar117.us.us = phi i64 [ %polly.indvar_next118.us.us, %polly.loop_exit144.loopexit.us.us ], [ 0, %polly.loop_if120.us.us.preheader ]
  %smin3814 = call i64 @llvm.smin.i64(i64 %indvars.iv3706, i64 %.res)
  %150 = mul nsw i64 %polly.indvar117.us.us, -512
  %151 = or i64 %150, 1
  %152 = add i64 %smin3814, %151
  %smin3746 = call i64 @llvm.smin.i64(i64 %indvars.iv3716, i64 511)
  %smin3710 = call i64 @llvm.smin.i64(i64 %indvars.iv3706, i64 %.res)
  %153 = shl nsw i64 %polly.indvar117.us.us, 9
  %154 = or i64 %153, 511
  %155 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %154)
  %polly.loop_guard124.not.us.us = icmp sgt i64 %153, %155
  br i1 %polly.loop_guard124.not.us.us, label %polly.loop_if141.us.us, label %polly.loop_if128.preheader.us.us

polly.loop_if128.us3611.us:                       ; preds = %polly.loop_if128.preheader.us.us, %polly.loop_exit131.loopexit.us.us
  %polly.indvar125.us3612.us = phi i64 [ %polly.indvar_next126.us3638.us, %polly.loop_exit131.loopexit.us.us ], [ %153, %polly.loop_if128.preheader.us.us ]
  %polly.access.mul.B136.us.us = mul nsw i64 %polly.indvar125.us3612.us, %ldb
  br i1 %min.iters.check3831, label %polly.loop_header129.us.us.preheader, label %vector.body3838

vector.body3838:                                  ; preds = %polly.loop_if128.us3611.us, %vector.body3838
  %index3839 = phi i64 [ %index.next3843, %vector.body3838 ], [ 0, %polly.loop_if128.us3611.us ]
  %offset.idx3840 = add i64 %102, %index3839
  %induction3842 = or i64 %offset.idx3840, 1
  %156 = add nsw i64 %offset.idx3840, %polly.access.mul.B136.us.us
  %157 = add nsw i64 %induction3842, %polly.access.mul.B136.us.us
  %158 = getelementptr float, float* %B, i64 %156
  %159 = getelementptr float, float* %B, i64 %157
  %160 = load float, float* %158, align 4, !alias.scope !36, !noalias !39
  %161 = load float, float* %159, align 4, !alias.scope !36, !noalias !39
  %162 = lshr i64 %offset.idx3840, 3
  %163 = lshr i64 %offset.idx3840, 3
  %164 = add i64 %347, %162
  %165 = add i64 %347, %163
  %166 = shl i64 %164, 9
  %167 = shl i64 %165, 9
  %168 = add i64 %166, %polly.indvar125.us3612.us
  %169 = add i64 %167, %polly.indvar125.us3612.us
  %170 = shl nsw i64 %168, 3
  %171 = shl nsw i64 %169, 3
  %172 = and i64 %offset.idx3840, 6
  %173 = and i64 %induction3842, 7
  %174 = or i64 %170, %172
  %175 = or i64 %171, %173
  %176 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %174
  %177 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %175
  store float %160, float* %176, align 8, !alias.scope !44, !noalias !45
  store float %161, float* %177, align 4, !alias.scope !44, !noalias !45
  %index.next3843 = add nuw i64 %index3839, 2
  %178 = icmp eq i64 %index.next3843, %n.vec3834
  br i1 %178, label %middle.block3829, label %vector.body3838, !llvm.loop !48

middle.block3829:                                 ; preds = %vector.body3838
  br i1 %cmp.n3837, label %polly.loop_exit131.loopexit.us.us, label %polly.loop_header129.us.us.preheader

polly.loop_header129.us.us.preheader:             ; preds = %polly.loop_if128.us3611.us, %middle.block3829
  %polly.indvar133.us.us.ph = phi i64 [ %102, %polly.loop_if128.us3611.us ], [ %ind.end3836, %middle.block3829 ]
  br label %polly.loop_header129.us.us

polly.loop_header129.us.us:                       ; preds = %polly.loop_header129.us.us.preheader, %polly.loop_header129.us.us
  %polly.indvar133.us.us = phi i64 [ %polly.indvar_next134.us.us, %polly.loop_header129.us.us ], [ %polly.indvar133.us.us.ph, %polly.loop_header129.us.us.preheader ]
  %polly.access.add.B137.us.us = add nsw i64 %polly.indvar133.us.us, %polly.access.mul.B136.us.us
  %polly.access.B138.us.us = getelementptr float, float* %B, i64 %polly.access.add.B137.us.us
  %polly.access.B138.load.us.us = load float, float* %polly.access.B138.us.us, align 4, !alias.scope !36, !noalias !39
  %pexp.p_div_q3603.us.us = lshr i64 %polly.indvar133.us.us, 3
  %reass.add.us.us = add i64 %347, %pexp.p_div_q3603.us.us
  %reass.mul.us.us = shl i64 %reass.add.us.us, 9
  %polly.access.add.Packed_B.us.us = add i64 %reass.mul.us.us, %polly.indvar125.us3612.us
  %polly.access.mul.Packed_B139.us.us = shl nsw i64 %polly.access.add.Packed_B.us.us, 3
  %pexp.pdiv_r.us.us = and i64 %polly.indvar133.us.us, 7
  %polly.access.add.Packed_B140.us.us = or i64 %polly.access.mul.Packed_B139.us.us, %pexp.pdiv_r.us.us
  %polly.access.Packed_B.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B140.us.us
  store float %polly.access.B138.load.us.us, float* %polly.access.Packed_B.us.us, align 4, !alias.scope !44, !noalias !45
  %polly.indvar_next134.us.us = add nuw nsw i64 %polly.indvar133.us.us, 1
  %polly.loop_cond135.not.not.us.us = icmp slt i64 %polly.indvar133.us.us, %104
  br i1 %polly.loop_cond135.not.not.us.us, label %polly.loop_header129.us.us, label %polly.loop_exit131.loopexit.us.us, !llvm.loop !49

polly.loop_if141.us.us:                           ; preds = %polly.loop_exit131.loopexit.us.us, %polly.loop_if128.preheader.us.us, %polly.loop_if120.us.us
  %179 = xor i64 %153, -1
  %180 = add i64 %179, %K
  %181 = tail call i64 @llvm.smin.i64(i64 %180, i64 511)
  %polly.loop_guard198.us.us = icmp sgt i64 %181, -1
  %min.iters.check3817 = icmp ult i64 %152, 2
  %n.vec3820 = and i64 %152, -2
  %ind.end = add i64 %153, %n.vec3820
  %cmp.n3822 = icmp eq i64 %152, %n.vec3820
  %polly.loop_guard198.us.us.not3787 = xor i1 %polly.loop_guard198.us.us, true
  %polly.loop_guard198.us.us.not = xor i1 %polly.loop_guard198.us.us, true
  br label %polly.loop_if149.us.us

polly.loop_if149.us.us:                           ; preds = %polly.merge1696.us.us, %polly.loop_if141.us.us
  %indvars.iv3736 = phi i64 [ %indvars.iv.next3737, %polly.merge1696.us.us ], [ %pexp.p_div_q12183599, %polly.loop_if141.us.us ]
  %indvars.iv3720 = phi i64 [ %indvars.iv.next3721, %polly.merge1696.us.us ], [ %pexp.p_div_q1853598, %polly.loop_if141.us.us ]
  %indvars.iv3712 = phi i64 [ %indvars.iv.next3713, %polly.merge1696.us.us ], [ 95, %polly.loop_if141.us.us ]
  %polly.indvar146.us.us = phi i64 [ %polly.indvar_next147.us.us, %polly.merge1696.us.us ], [ 0, %polly.loop_if141.us.us ]
  %smin3748 = call i64 @llvm.smin.i64(i64 %indvars.iv3736, i64 23)
  %smin3722 = call i64 @llvm.smin.i64(i64 %indvars.iv3720, i64 24)
  %182 = call i64 @llvm.smax.i64(i64 %smin3722, i64 1)
  %smin3714 = call i64 @llvm.smin.i64(i64 %indvars.iv3712, i64 %.res57)
  %183 = mul nuw nsw i64 %polly.indvar146.us.us, 96
  %184 = add nuw nsw i64 %183, 95
  %185 = tail call i64 @llvm.smin.i64(i64 %.res57, i64 %184)
  %polly.loop_guard153.not.us.us = icmp sgt i64 %183, %185
  br i1 %polly.loop_guard153.not.us.us, label %polly.cond172.us.us, label %polly.loop_if157.preheader.us.us

polly.loop_if157.us3613.us:                       ; preds = %polly.loop_if157.preheader.us.us, %polly.loop_exit160.loopexit.us.us
  %polly.indvar154.us3614.us = phi i64 [ %polly.indvar_next155.us3632.us, %polly.loop_exit160.loopexit.us.us ], [ %183, %polly.loop_if157.preheader.us.us ]
  %polly.access.mul.A165.us.us = mul nsw i64 %polly.indvar154.us3614.us, %lda
  %pexp.p_div_q1683602.us.us = lshr i64 %polly.indvar154.us3614.us, 2
  %reass.add3605.us.us = add i64 %346, %pexp.p_div_q1683602.us.us
  %reass.mul3606.us.us = shl i64 %reass.add3605.us.us, 9
  %pexp.pdiv_r170.us.us = and i64 %polly.indvar154.us3614.us, 3
  br i1 %min.iters.check3817, label %polly.loop_header158.us.us.preheader, label %vector.body3823

vector.body3823:                                  ; preds = %polly.loop_if157.us3613.us, %vector.body3823
  %index3824 = phi i64 [ %index.next3826, %vector.body3823 ], [ 0, %polly.loop_if157.us3613.us ]
  %offset.idx = add i64 %153, %index3824
  %induction3825 = or i64 %offset.idx, 1
  %186 = add nsw i64 %offset.idx, %polly.access.mul.A165.us.us
  %187 = add nsw i64 %induction3825, %polly.access.mul.A165.us.us
  %188 = getelementptr float, float* %A, i64 %186
  %189 = getelementptr float, float* %A, i64 %187
  %190 = load float, float* %188, align 4, !alias.scope !50, !noalias !51
  %191 = load float, float* %189, align 4, !alias.scope !50, !noalias !51
  %192 = add i64 %offset.idx, %reass.mul3606.us.us
  %193 = add i64 %induction3825, %reass.mul3606.us.us
  %194 = shl nsw i64 %192, 2
  %195 = shl nsw i64 %193, 2
  %196 = or i64 %194, %pexp.pdiv_r170.us.us
  %197 = or i64 %195, %pexp.pdiv_r170.us.us
  %198 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %196
  %199 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %197
  store float %190, float* %198, align 4, !alias.scope !52, !noalias !53
  store float %191, float* %199, align 4, !alias.scope !52, !noalias !53
  %index.next3826 = add nuw i64 %index3824, 2
  %200 = icmp eq i64 %index.next3826, %n.vec3820
  br i1 %200, label %middle.block3815, label %vector.body3823, !llvm.loop !54

middle.block3815:                                 ; preds = %vector.body3823
  br i1 %cmp.n3822, label %polly.loop_exit160.loopexit.us.us, label %polly.loop_header158.us.us.preheader

polly.loop_header158.us.us.preheader:             ; preds = %polly.loop_if157.us3613.us, %middle.block3815
  %polly.indvar162.us.us.ph = phi i64 [ %153, %polly.loop_if157.us3613.us ], [ %ind.end, %middle.block3815 ]
  br label %polly.loop_header158.us.us

polly.loop_header158.us.us:                       ; preds = %polly.loop_header158.us.us.preheader, %polly.loop_header158.us.us
  %polly.indvar162.us.us = phi i64 [ %polly.indvar_next163.us.us, %polly.loop_header158.us.us ], [ %polly.indvar162.us.us.ph, %polly.loop_header158.us.us.preheader ]
  %polly.access.add.A166.us.us = add nsw i64 %polly.indvar162.us.us, %polly.access.mul.A165.us.us
  %polly.access.A167.us.us = getelementptr float, float* %A, i64 %polly.access.add.A166.us.us
  %polly.access.A167.load.us.us = load float, float* %polly.access.A167.us.us, align 4, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_A.us.us = add i64 %polly.indvar162.us.us, %reass.mul3606.us.us
  %polly.access.mul.Packed_A169.us.us = shl nsw i64 %polly.access.add.Packed_A.us.us, 2
  %polly.access.add.Packed_A171.us.us = or i64 %polly.access.mul.Packed_A169.us.us, %pexp.pdiv_r170.us.us
  %polly.access.Packed_A.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A171.us.us
  store float %polly.access.A167.load.us.us, float* %polly.access.Packed_A.us.us, align 4, !alias.scope !52, !noalias !53
  %polly.indvar_next163.us.us = add nuw i64 %polly.indvar162.us.us, 1
  %exitcond3711.not = icmp eq i64 %polly.indvar162.us.us, %smin3710
  br i1 %exitcond3711.not, label %polly.loop_exit160.loopexit.us.us, label %polly.loop_header158.us.us, !llvm.loop !55

polly.cond172.us.us:                              ; preds = %polly.loop_exit160.loopexit.us.us, %polly.loop_if157.preheader.us.us, %polly.loop_if149.us.us
  %201 = or i64 %183, 4
  %.not.us.us = icmp sgt i64 %201, %M
  %brmerge = select i1 %.not.us.us, i1 true, i1 %polly.loop_guard181.us
  br i1 %brmerge, label %polly.cond1695.us.us, label %polly.loop_if186.preheader.us.us

polly.loop_if186.us.us:                           ; preds = %polly.loop_if186.preheader.us.us, %polly.merge775.us.us
  %polly.indvar182.us.us = phi i64 [ %polly.indvar_next183.us.us, %polly.merge775.us.us ], [ 0, %polly.loop_if186.preheader.us.us ]
  br i1 %polly.loop_guard190.us.us, label %polly.loop_if194.preheader.us.us, label %polly.cond774.us.us

polly.cond774.us.us:                              ; preds = %polly.loop_exit197.loopexit.us.us.us, %polly.loop_if194.preheader.us.us, %polly.loop_if186.us.us
  br i1 %338, label %polly.cond779.us.us, label %polly.merge775.us.us

polly.cond779.us.us:                              ; preds = %polly.cond774.us.us
  br i1 %331, label %polly.loop_if783.us.us, label %polly.loop_if1207.us.us

polly.loop_if1207.us.us:                          ; preds = %polly.cond779.us.us
  br i1 %polly.loop_guard198.us.us, label %polly.cond1375.preheader.us.us, label %polly.merge775.us.us

polly.cond1375.us.us:                             ; preds = %polly.cond1375.preheader.us.us, %polly.merge1376.us.us
  %polly.indvar1212.us.us = phi i64 [ %polly.indvar_next1213.us.us, %polly.merge1376.us.us ], [ 0, %polly.cond1375.preheader.us.us ]
  %polly.access.add.Packed_A1220.us.us = add nsw i64 %polly.indvar1212.us.us, %polly.access.mul.Packed_A1219.us.us
  %polly.access.mul.Packed_A1221.us.us = shl nsw i64 %polly.access.add.Packed_A1220.us.us, 2
  %polly.access.Packed_A1223.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1221.us.us
  %_p_scalar_1224.us.us = load float, float* %polly.access.Packed_A1223.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_B1227.us.us = add nuw nsw i64 %polly.indvar1212.us.us, %polly.access.mul.Packed_B1226.us.us
  %polly.access.mul.Packed_B1228.us.us = shl nsw i64 %polly.access.add.Packed_B1227.us.us, 3
  %polly.access.Packed_B1230.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1228.us.us
  %202 = bitcast float* %polly.access.Packed_B1230.us.us to <4 x float>*
  %203 = load <4 x float>, <4 x float>* %202, align 32, !alias.scope !44, !noalias !45
  %204 = load <4 x float>, <4 x float>* %300, align 4, !alias.scope !56, !noalias !57
  %205 = insertelement <4 x float> poison, float %_p_scalar_1224.us.us, i64 0
  %shuffle3868 = shufflevector <4 x float> %205, <4 x float> poison, <4 x i32> zeroinitializer
  %206 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3868, <4 x float> %203, <4 x float> %204)
  store <4 x float> %206, <4 x float>* %301, align 4, !alias.scope !56, !noalias !57
  %polly.access.add.Packed_B1309.us.us = or i64 %polly.access.mul.Packed_B1228.us.us, 4
  %polly.access.Packed_B1310.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1309.us.us
  %207 = bitcast float* %polly.access.Packed_B1310.us.us to <2 x float>*
  %208 = load <2 x float>, <2 x float>* %207, align 16, !alias.scope !44, !noalias !45
  %polly.access.add.Packed_B1349.us.us = or i64 %polly.access.mul.Packed_B1228.us.us, 6
  %polly.access.Packed_B1350.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1349.us.us
  %209 = bitcast float* %polly.access.Packed_B1350.us.us to <2 x float>*
  %210 = load <2 x float>, <2 x float>* %209, align 8, !alias.scope !44, !noalias !45
  %211 = load <4 x float>, <4 x float>* %302, align 4, !alias.scope !56, !noalias !57
  %212 = shufflevector <2 x float> %208, <2 x float> %210, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %213 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3868, <4 x float> %212, <4 x float> %211)
  store <4 x float> %213, <4 x float>* %303, align 4, !alias.scope !56, !noalias !57
  br i1 %72, label %polly.cond1540.us.us, label %polly.merge1376.us.us

polly.cond1540.us.us:                             ; preds = %polly.cond1375.us.us
  %polly.access.add.Packed_A1387.us.us = or i64 %polly.access.mul.Packed_A1221.us.us, 1
  %polly.access.Packed_A1388.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1387.us.us
  %_p_scalar_1389.us.us = load float, float* %polly.access.Packed_A1388.us.us, align 4, !alias.scope !52, !noalias !53
  %214 = load <4 x float>, <4 x float>* %304, align 4, !alias.scope !56, !noalias !57
  %215 = insertelement <4 x float> poison, float %_p_scalar_1389.us.us, i64 0
  %shuffle3866 = shufflevector <4 x float> %215, <4 x float> poison, <4 x i32> zeroinitializer
  %216 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3866, <4 x float> %203, <4 x float> %214)
  store <4 x float> %216, <4 x float>* %305, align 4, !alias.scope !56, !noalias !57
  %217 = load <4 x float>, <4 x float>* %306, align 4, !alias.scope !56, !noalias !57
  %218 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3866, <4 x float> %212, <4 x float> %217)
  store <4 x float> %218, <4 x float>* %307, align 4, !alias.scope !56, !noalias !57
  br i1 %76, label %polly.stmt.for.body8.us.us.us1676.us.us, label %polly.merge1376.us.us

polly.stmt.for.body8.us.us.us1676.us.us:          ; preds = %polly.cond1540.us.us
  %polly.access.add.Packed_A1547.us.us = add nsw i64 %polly.indvar1212.us.us, %polly.access.mul.Packed_A1546.us.us
  %polly.access.mul.Packed_A1548.us.us = shl nsw i64 %polly.access.add.Packed_A1547.us.us, 2
  %polly.access.add.Packed_A1549.us.us = or i64 %polly.access.mul.Packed_A1548.us.us, 2
  %polly.access.Packed_A1550.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1549.us.us
  %_p_scalar_1551.us.us = load float, float* %polly.access.Packed_A1550.us.us, align 8, !alias.scope !52, !noalias !53
  %219 = load <4 x float>, <4 x float>* %308, align 4, !alias.scope !56, !noalias !57
  %220 = insertelement <4 x float> poison, float %_p_scalar_1551.us.us, i64 0
  %shuffle3865 = shufflevector <4 x float> %220, <4 x float> poison, <4 x i32> zeroinitializer
  %221 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3865, <4 x float> %203, <4 x float> %219)
  store <4 x float> %221, <4 x float>* %309, align 4, !alias.scope !56, !noalias !57
  %222 = load <2 x float>, <2 x float>* %310, align 4, !alias.scope !56, !noalias !57
  %223 = insertelement <2 x float> poison, float %_p_scalar_1551.us.us, i64 0
  %224 = shufflevector <2 x float> %223, <2 x float> poison, <2 x i32> zeroinitializer
  %225 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %224, <2 x float> %208, <2 x float> %222)
  store <2 x float> %225, <2 x float>* %311, align 4, !alias.scope !56, !noalias !57
  %226 = load <2 x float>, <2 x float>* %312, align 4, !alias.scope !56, !noalias !57
  %227 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %224, <2 x float> %210, <2 x float> %226)
  store <2 x float> %227, <2 x float>* %313, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge1376.us.us

polly.merge1376.us.us:                            ; preds = %polly.stmt.for.body8.us.us.us1676.us.us, %polly.cond1540.us.us, %polly.cond1375.us.us
  %polly.indvar_next1213.us.us = add nuw nsw i64 %polly.indvar1212.us.us, 1
  %exitcond3726.not = icmp eq i64 %polly.indvar1212.us.us, %smin3746
  br i1 %exitcond3726.not, label %polly.merge775.us.us, label %polly.cond1375.us.us, !llvm.loop !58

polly.loop_if783.us.us:                           ; preds = %polly.cond779.us.us
  br i1 %polly.loop_guard198.us.us, label %polly.cond927.preheader.us.us, label %polly.merge775.us.us

polly.cond927.us.us:                              ; preds = %polly.cond927.preheader.us.us, %polly.merge928.us.us
  %polly.indvar788.us.us = phi i64 [ %polly.indvar_next789.us.us, %polly.merge928.us.us ], [ 0, %polly.cond927.preheader.us.us ]
  %polly.access.add.Packed_A793.us.us = shl i64 %polly.indvar788.us.us, 2
  %polly.access.mul.Packed_A794.us.us = add nuw nsw i64 %polly.access.add.Packed_A793.us.us, 2048
  %polly.access.Packed_A796.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A794.us.us
  %_p_scalar_797.us.us = load float, float* %polly.access.Packed_A796.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_B800.us.us = add nuw nsw i64 %polly.indvar788.us.us, %polly.access.mul.Packed_B799.us.us
  %polly.access.mul.Packed_B801.us.us = shl nsw i64 %polly.access.add.Packed_B800.us.us, 3
  %polly.access.Packed_B803.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B801.us.us
  %228 = bitcast float* %polly.access.Packed_B803.us.us to <4 x float>*
  %229 = load <4 x float>, <4 x float>* %228, align 32, !alias.scope !44, !noalias !45
  %230 = load <4 x float>, <4 x float>* %275, align 4, !alias.scope !56, !noalias !57
  %231 = insertelement <4 x float> poison, float %_p_scalar_797.us.us, i64 0
  %shuffle3863 = shufflevector <4 x float> %231, <4 x float> poison, <4 x i32> zeroinitializer
  %232 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3863, <4 x float> %229, <4 x float> %230)
  store <4 x float> %232, <4 x float>* %276, align 4, !alias.scope !56, !noalias !57
  %polly.access.add.Packed_B870.us.us = or i64 %polly.access.mul.Packed_B801.us.us, 4
  %polly.access.Packed_B871.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B870.us.us
  %233 = bitcast float* %polly.access.Packed_B871.us.us to <2 x float>*
  %234 = load <2 x float>, <2 x float>* %233, align 16, !alias.scope !44, !noalias !45
  %polly.access.add.Packed_B904.us.us = or i64 %polly.access.mul.Packed_B801.us.us, 6
  %polly.access.Packed_B905.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B904.us.us
  %235 = bitcast float* %polly.access.Packed_B905.us.us to <2 x float>*
  %236 = load <2 x float>, <2 x float>* %235, align 8, !alias.scope !44, !noalias !45
  %237 = load <4 x float>, <4 x float>* %277, align 4, !alias.scope !56, !noalias !57
  %238 = shufflevector <2 x float> %234, <2 x float> %236, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %239 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3863, <4 x float> %238, <4 x float> %237)
  store <4 x float> %239, <4 x float>* %278, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3601.us.us, label %polly.merge928.us.us, label %polly.cond1067.us.us

polly.cond1067.us.us:                             ; preds = %polly.cond927.us.us
  %polly.access.add.Packed_A935.us.us = add nuw nsw i64 %polly.access.add.Packed_A793.us.us, 2049
  %polly.access.Packed_A936.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A935.us.us
  %_p_scalar_937.us.us = load float, float* %polly.access.Packed_A936.us.us, align 4, !alias.scope !52, !noalias !53
  %240 = load <4 x float>, <4 x float>* %279, align 4, !alias.scope !56, !noalias !57
  %241 = insertelement <4 x float> poison, float %_p_scalar_937.us.us, i64 0
  %shuffle3861 = shufflevector <4 x float> %241, <4 x float> poison, <4 x i32> zeroinitializer
  %242 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3861, <4 x float> %229, <4 x float> %240)
  store <4 x float> %242, <4 x float>* %280, align 4, !alias.scope !56, !noalias !57
  %243 = load <4 x float>, <4 x float>* %281, align 4, !alias.scope !56, !noalias !57
  %244 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3861, <4 x float> %238, <4 x float> %243)
  store <4 x float> %244, <4 x float>* %282, align 4, !alias.scope !56, !noalias !57
  br i1 %344, label %polly.stmt.for.body8.us.us.us1190.us.us, label %polly.merge928.us.us

polly.stmt.for.body8.us.us.us1190.us.us:          ; preds = %polly.cond1067.us.us
  %polly.access.add.Packed_A1075.us.us = add nuw nsw i64 %polly.access.add.Packed_A793.us.us, 2050
  %polly.access.Packed_A1076.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1075.us.us
  %_p_scalar_1077.us.us = load float, float* %polly.access.Packed_A1076.us.us, align 8, !alias.scope !52, !noalias !53
  %245 = load <4 x float>, <4 x float>* %283, align 4, !alias.scope !56, !noalias !57
  %246 = insertelement <4 x float> poison, float %_p_scalar_1077.us.us, i64 0
  %shuffle = shufflevector <4 x float> %246, <4 x float> poison, <4 x i32> zeroinitializer
  %247 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle, <4 x float> %229, <4 x float> %245)
  store <4 x float> %247, <4 x float>* %284, align 4, !alias.scope !56, !noalias !57
  %248 = load <2 x float>, <2 x float>* %285, align 4, !alias.scope !56, !noalias !57
  %249 = insertelement <2 x float> poison, float %_p_scalar_1077.us.us, i64 0
  %250 = shufflevector <2 x float> %249, <2 x float> poison, <2 x i32> zeroinitializer
  %251 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %250, <2 x float> %234, <2 x float> %248)
  store <2 x float> %251, <2 x float>* %286, align 4, !alias.scope !56, !noalias !57
  %252 = load <2 x float>, <2 x float>* %287, align 4, !alias.scope !56, !noalias !57
  %253 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %250, <2 x float> %236, <2 x float> %252)
  store <2 x float> %253, <2 x float>* %288, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge928.us.us

polly.merge928.us.us:                             ; preds = %polly.stmt.for.body8.us.us.us1190.us.us, %polly.cond1067.us.us, %polly.cond927.us.us
  %polly.indvar_next789.us.us = add nuw nsw i64 %polly.indvar788.us.us, 1
  %exitcond3728.not = icmp eq i64 %polly.indvar788.us.us, %smin3746
  br i1 %exitcond3728.not, label %polly.merge775.us.us, label %polly.cond927.us.us, !llvm.loop !60

polly.merge775.us.us:                             ; preds = %polly.merge1376.us.us, %polly.merge928.us.us, %polly.loop_if783.us.us, %polly.loop_if1207.us.us, %polly.cond774.us.us
  %polly.indvar_next183.us.us = add nuw nsw i64 %polly.indvar182.us.us, 1
  %exitcond3733.not = icmp eq i64 %polly.indvar_next183.us.us, %101
  br i1 %exitcond3733.not, label %polly.cond1695.us.us, label %polly.loop_if186.us.us

polly.cond1695.us.us:                             ; preds = %polly.merge775.us.us, %polly.cond172.us.us
  %254 = or i64 %183, 3
  %255 = icmp sge i64 %254, %M
  %256 = or i1 %107, %255
  %257 = or i1 %109, %256
  br i1 %257, label %polly.cond1700.us.us, label %polly.merge1696.us.us

polly.cond1700.us.us:                             ; preds = %polly.cond1695.us.us
  br i1 %107, label %polly.loop_if1705.us.us, label %polly.cond2305.us.us

polly.cond2305.us.us:                             ; preds = %polly.cond1700.us.us
  br i1 %255, label %polly.loop_if2310.us.us, label %polly.loop_if2827.us.us

polly.loop_if2827.us.us:                          ; preds = %polly.cond2305.us.us
  %258 = mul nsw i64 %polly.indvar146.us.us, -24
  %259 = add nsw i64 %258, %pexp.p_div_q12183599
  %260 = tail call i64 @llvm.smin.i64(i64 %259, i64 23)
  %polly.loop_guard2831.us.us = icmp slt i64 %260, 0
  %brmerge3788 = select i1 %polly.loop_guard2831.us.us, i1 true, i1 %polly.loop_guard198.us.us.not3787
  br i1 %brmerge3788, label %polly.merge1696.us.us, label %polly.loop_if2835.us.us.us

polly.loop_if2310.us.us:                          ; preds = %polly.cond2305.us.us
  br i1 %polly.loop_guard2314.us, label %polly.loop_if2318.preheader.us.us, label %polly.merge1696.us.us

polly.loop_if1705.us.us:                          ; preds = %polly.cond1700.us.us
  %261 = mul nsw i64 %polly.indvar146.us.us, -24
  %262 = add nsw i64 %261, %pexp.p_div_q12183599
  %263 = tail call i64 @llvm.smin.i64(i64 %262, i64 23)
  %polly.loop_guard1709.us.us = icmp slt i64 %263, 0
  %brmerge3786 = select i1 %polly.loop_guard1709.us.us, i1 true, i1 %polly.loop_guard198.us.us.not
  br i1 %brmerge3786, label %polly.merge1696.us.us, label %polly.loop_if1713.us.us.us

polly.merge1696.us.us:                            ; preds = %polly.loop_exit2838.loopexit.us.us.us, %polly.loop_exit2321.loopexit.us.us.us, %polly.loop_exit1716.loopexit.us.us.us, %polly.loop_if2827.us.us, %polly.loop_if1705.us.us, %polly.loop_if2318.preheader.us.us, %polly.loop_if2310.us.us, %polly.cond1695.us.us
  %polly.indvar_next147.us.us = add nuw nsw i64 %polly.indvar146.us.us, 1
  %indvars.iv.next3713 = add nuw i64 %indvars.iv3712, 96
  %indvars.iv.next3721 = add nsw i64 %indvars.iv3720, -24
  %indvars.iv.next3737 = add nsw i64 %indvars.iv3736, -24
  %exitcond3750.not = icmp eq i64 %polly.indvar146.us.us, %pexp.fdiv_q.4
  br i1 %exitcond3750.not, label %polly.loop_exit144.loopexit.us.us, label %polly.loop_if149.us.us

polly.cond927.preheader.us.us:                    ; preds = %polly.loop_if783.us.us
  %264 = shl nsw i64 %polly.indvar182.us.us, 3
  %265 = add nuw nsw i64 %264, %102
  %polly.access.mul.Packed_B799.us.us = shl nsw i64 %polly.indvar182.us.us, 9
  %266 = add i64 %265, %341
  %scevgep805.us.us = getelementptr float, float* %C, i64 %266
  %267 = or i64 %265, 4
  %268 = add i64 %267, %341
  %scevgep873.us.us = getelementptr float, float* %C, i64 %268
  %269 = or i64 %265, 6
  %270 = add i64 %265, %343
  %scevgep945.us.us = getelementptr float, float* %C, i64 %270
  %271 = add i64 %267, %343
  %scevgep1013.us.us = getelementptr float, float* %C, i64 %271
  %272 = add i64 %265, %78
  %scevgep1085.us.us = getelementptr float, float* %C, i64 %272
  %273 = add i64 %267, %78
  %scevgep1153.us.us = getelementptr float, float* %C, i64 %273
  %274 = add i64 %269, %78
  %scevgep1187.us.us = getelementptr float, float* %C, i64 %274
  %275 = bitcast float* %scevgep805.us.us to <4 x float>*
  %276 = bitcast float* %scevgep805.us.us to <4 x float>*
  %277 = bitcast float* %scevgep873.us.us to <4 x float>*
  %278 = bitcast float* %scevgep873.us.us to <4 x float>*
  %279 = bitcast float* %scevgep945.us.us to <4 x float>*
  %280 = bitcast float* %scevgep945.us.us to <4 x float>*
  %281 = bitcast float* %scevgep1013.us.us to <4 x float>*
  %282 = bitcast float* %scevgep1013.us.us to <4 x float>*
  %283 = bitcast float* %scevgep1085.us.us to <4 x float>*
  %284 = bitcast float* %scevgep1085.us.us to <4 x float>*
  %285 = bitcast float* %scevgep1153.us.us to <2 x float>*
  %286 = bitcast float* %scevgep1153.us.us to <2 x float>*
  %287 = bitcast float* %scevgep1187.us.us to <2 x float>*
  %288 = bitcast float* %scevgep1187.us.us to <2 x float>*
  br label %polly.cond927.us.us

polly.cond1375.preheader.us.us:                   ; preds = %polly.loop_if1207.us.us
  %289 = shl nsw i64 %polly.indvar182.us.us, 3
  %290 = add nuw nsw i64 %289, %102
  %polly.access.mul.Packed_B1226.us.us = shl nsw i64 %polly.indvar182.us.us, 9
  %291 = add i64 %290, %71
  %scevgep1232.us.us = getelementptr float, float* %C, i64 %291
  %292 = or i64 %290, 4
  %293 = add i64 %292, %71
  %scevgep1312.us.us = getelementptr float, float* %C, i64 %293
  %294 = or i64 %290, 6
  %295 = add i64 %290, %73
  %scevgep1397.us.us = getelementptr float, float* %C, i64 %295
  %296 = add i64 %292, %73
  %scevgep1477.us.us = getelementptr float, float* %C, i64 %296
  %297 = add i64 %290, %78
  %scevgep1559.us.us = getelementptr float, float* %C, i64 %297
  %298 = add i64 %292, %78
  %scevgep1635.us.us = getelementptr float, float* %C, i64 %298
  %299 = add i64 %294, %78
  %scevgep1673.us.us = getelementptr float, float* %C, i64 %299
  %300 = bitcast float* %scevgep1232.us.us to <4 x float>*
  %301 = bitcast float* %scevgep1232.us.us to <4 x float>*
  %302 = bitcast float* %scevgep1312.us.us to <4 x float>*
  %303 = bitcast float* %scevgep1312.us.us to <4 x float>*
  %304 = bitcast float* %scevgep1397.us.us to <4 x float>*
  %305 = bitcast float* %scevgep1397.us.us to <4 x float>*
  %306 = bitcast float* %scevgep1477.us.us to <4 x float>*
  %307 = bitcast float* %scevgep1477.us.us to <4 x float>*
  %308 = bitcast float* %scevgep1559.us.us to <4 x float>*
  %309 = bitcast float* %scevgep1559.us.us to <4 x float>*
  %310 = bitcast float* %scevgep1635.us.us to <2 x float>*
  %311 = bitcast float* %scevgep1635.us.us to <2 x float>*
  %312 = bitcast float* %scevgep1673.us.us to <2 x float>*
  %313 = bitcast float* %scevgep1673.us.us to <2 x float>*
  br label %polly.cond1375.us.us

polly.loop_if194.preheader.us.us:                 ; preds = %polly.loop_if186.us.us
  %314 = shl nsw i64 %polly.indvar182.us.us, 3
  %315 = add nuw nsw i64 %314, %102
  %polly.access.mul.Packed_B209.us.us = shl nsw i64 %polly.indvar182.us.us, 9
  %316 = or i64 %315, 2
  %317 = or i64 %315, 4
  %318 = or i64 %315, 6
  br i1 %polly.loop_guard198.us.us, label %polly.loop_if194.us.us.us, label %polly.cond774.us.us

polly.loop_exit160.loopexit.us.us:                ; preds = %polly.loop_header158.us.us, %middle.block3815
  %polly.indvar_next155.us3632.us = add nuw i64 %polly.indvar154.us3614.us, 1
  %exitcond3715.not = icmp eq i64 %polly.indvar154.us3614.us, %smin3714
  br i1 %exitcond3715.not, label %polly.cond172.us.us, label %polly.loop_if157.us3613.us

polly.loop_if2318.preheader.us.us:                ; preds = %polly.loop_if2310.us.us
  %319 = mul i64 %183, %ldc
  %320 = or i64 %183, 2
  %.not3557.us.us = icmp sgt i64 %320, %M
  %321 = or i64 %319, 1
  %322 = or i64 %183, 1
  %323 = mul i64 %322, %ldc
  %324 = add i64 %323, 1
  %325 = icmp eq i64 %254, %M
  br i1 %polly.loop_guard198.us.us, label %polly.loop_if2318.us.us.us, label %polly.merge1696.us.us

polly.loop_if186.preheader.us.us:                 ; preds = %polly.cond172.us.us
  %326 = mul nsw i64 %polly.indvar146.us.us, -24
  %327 = add nsw i64 %326, %pexp.p_div_q1853598
  %polly.loop_guard190.us.us = icmp sgt i64 %327, 0
  %328 = or i64 %183, 5
  %329 = icmp sle i64 %328, %M
  %330 = or i64 %183, 7
  %331 = icmp sge i64 %330, %M
  %332 = and i1 %329, %331
  %333 = or i64 %183, 8
  %334 = icmp sle i64 %333, %M
  %335 = icmp sge i64 %184, %M
  %336 = and i1 %334, %335
  %337 = and i1 %68, %336
  %338 = or i1 %332, %337
  %339 = add nsw i64 %326, %pexp.p_div_q12183599
  %polly.access.mul.Packed_A1219.us.us = shl nsw i64 %339, 9
  %340 = add nsw i64 %326, %pexp.div
  %polly.access.mul.Packed_A1546.us.us = shl nsw i64 %340, 9
  %341 = mul i64 %201, %ldc
  %342 = or i64 %183, 6
  %.not3601.us.us = icmp sgt i64 %342, %M
  %343 = mul i64 %328, %ldc
  %344 = icmp eq i64 %330, %M
  br label %polly.loop_if186.us.us

polly.loop_if157.preheader.us.us:                 ; preds = %polly.loop_if149.us.us
  %345 = mul i64 %polly.indvar146.us.us, 36028797018963944
  %346 = sub i64 %345, %polly.indvar117.us.us
  br i1 %polly.loop_guard124.not.us.us, label %polly.cond172.us.us, label %polly.loop_if157.us3613.us

polly.loop_exit131.loopexit.us.us:                ; preds = %polly.loop_header129.us.us, %middle.block3829
  %polly.indvar_next126.us3638.us = add nuw i64 %polly.indvar125.us3612.us, 1
  %exitcond3709.not = icmp eq i64 %polly.indvar125.us3612.us, %smin3710
  br i1 %exitcond3709.not, label %polly.loop_if141.us.us, label %polly.loop_if128.us3611.us

polly.loop_exit144.loopexit.us.us:                ; preds = %polly.merge1696.us.us
  %polly.indvar_next118.us.us = add nuw nsw i64 %polly.indvar117.us.us, 1
  %indvars.iv.next3707 = add nuw i64 %indvars.iv3706, 512
  %indvars.iv.next3717 = add i64 %indvars.iv3716, -512
  %exitcond3752.not = icmp eq i64 %polly.indvar117.us.us, %smax
  br i1 %exitcond3752.not, label %polly.loop_exit115.loopexit.us, label %polly.loop_if120.us.us

polly.loop_if128.preheader.us.us:                 ; preds = %polly.loop_if120.us.us
  %347 = sub nsw i64 %105, %polly.indvar117.us.us
  br i1 %polly.loop_guard132.not.fr.us, label %polly.loop_if141.us.us, label %polly.loop_if128.us3611.us

polly.loop_if194.us.us.us:                        ; preds = %polly.loop_if194.preheader.us.us, %polly.loop_exit197.loopexit.us.us.us
  %polly.indvar191.us.us.us = phi i64 [ %polly.indvar_next192.us.us.us, %polly.loop_exit197.loopexit.us.us.us ], [ 0, %polly.loop_if194.preheader.us.us ]
  %348 = shl nsw i64 %polly.indvar191.us.us.us, 2
  %349 = add nuw nsw i64 %348, %183
  %polly.access.mul.Packed_A203.us.us.us = shl nsw i64 %polly.indvar191.us.us.us, 9
  %350 = mul i64 %349, %ldc
  %351 = add i64 %350, %315
  %scevgep.us.us.us = getelementptr float, float* %C, i64 %351
  %352 = add i64 %350, %317
  %scevgep285.us.us.us = getelementptr float, float* %C, i64 %352
  %353 = or i64 %349, 1
  %354 = mul i64 %353, %ldc
  %355 = add i64 %354, %315
  %scevgep357.us.us.us = getelementptr float, float* %C, i64 %355
  %356 = add i64 %354, %317
  %scevgep429.us.us.us = getelementptr float, float* %C, i64 %356
  %357 = or i64 %349, 2
  %358 = mul i64 %357, %ldc
  %359 = add i64 %358, %315
  %scevgep501.us.us.us = getelementptr float, float* %C, i64 %359
  %360 = add i64 %358, %317
  %scevgep573.us.us.us = getelementptr float, float* %C, i64 %360
  %361 = or i64 %349, 3
  %362 = mul i64 %361, %ldc
  %363 = add i64 %362, %315
  %scevgep645.us.us.us = getelementptr float, float* %C, i64 %363
  %364 = add i64 %362, %316
  %scevgep681.us.us.us = getelementptr float, float* %C, i64 %364
  %365 = add i64 %362, %317
  %scevgep717.us.us.us = getelementptr float, float* %C, i64 %365
  %366 = add i64 %362, %318
  %scevgep753.us.us.us = getelementptr float, float* %C, i64 %366
  %367 = bitcast float* %scevgep645.us.us.us to <2 x float>*
  %368 = bitcast float* %scevgep645.us.us.us to <2 x float>*
  %369 = bitcast float* %scevgep.us.us.us to <4 x float>*
  %370 = bitcast float* %scevgep.us.us.us to <4 x float>*
  %371 = bitcast float* %scevgep681.us.us.us to <2 x float>*
  %372 = bitcast float* %scevgep681.us.us.us to <2 x float>*
  %373 = bitcast float* %scevgep717.us.us.us to <2 x float>*
  %374 = bitcast float* %scevgep717.us.us.us to <2 x float>*
  %375 = bitcast float* %scevgep285.us.us.us to <4 x float>*
  %376 = bitcast float* %scevgep285.us.us.us to <4 x float>*
  %377 = bitcast float* %scevgep357.us.us.us to <4 x float>*
  %378 = bitcast float* %scevgep357.us.us.us to <4 x float>*
  %379 = bitcast float* %scevgep429.us.us.us to <4 x float>*
  %380 = bitcast float* %scevgep429.us.us.us to <4 x float>*
  %381 = bitcast float* %scevgep501.us.us.us to <4 x float>*
  %382 = bitcast float* %scevgep501.us.us.us to <4 x float>*
  %383 = bitcast float* %scevgep573.us.us.us to <4 x float>*
  %384 = bitcast float* %scevgep573.us.us.us to <4 x float>*
  %385 = bitcast float* %scevgep753.us.us.us to <2 x float>*
  %386 = bitcast float* %scevgep753.us.us.us to <2 x float>*
  br label %polly.stmt.for.body8.us.us.us756.us.us.us

polly.stmt.for.body8.us.us.us756.us.us.us:        ; preds = %polly.stmt.for.body8.us.us.us756.us.us.us, %polly.loop_if194.us.us.us
  %polly.indvar199.us.us.us = phi i64 [ %polly.indvar_next200.us.us.us, %polly.stmt.for.body8.us.us.us756.us.us.us ], [ 0, %polly.loop_if194.us.us.us ]
  %polly.access.add.Packed_A204.us.us.us = add nuw nsw i64 %polly.indvar199.us.us.us, %polly.access.mul.Packed_A203.us.us.us
  %polly.access.mul.Packed_A205.us.us.us = shl nsw i64 %polly.access.add.Packed_A204.us.us.us, 2
  %polly.access.Packed_A207.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A205.us.us.us
  %_p_scalar_.us.us.us = load float, float* %polly.access.Packed_A207.us.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_B210.us.us.us = add nuw nsw i64 %polly.indvar199.us.us.us, %polly.access.mul.Packed_B209.us.us
  %polly.access.mul.Packed_B211.us.us.us = shl nsw i64 %polly.access.add.Packed_B210.us.us.us, 3
  %polly.access.Packed_B213.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B211.us.us.us
  %polly.access.add.Packed_B246.us.us.us = or i64 %polly.access.mul.Packed_B211.us.us.us, 2
  %polly.access.Packed_B247.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B246.us.us.us
  %polly.access.add.Packed_B282.us.us.us = or i64 %polly.access.mul.Packed_B211.us.us.us, 4
  %polly.access.Packed_B283.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B282.us.us.us
  %polly.access.add.Packed_B318.us.us.us = or i64 %polly.access.mul.Packed_B211.us.us.us, 6
  %polly.access.Packed_B319.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B318.us.us.us
  %polly.access.add.Packed_A347.us.us.us = or i64 %polly.access.mul.Packed_A205.us.us.us, 1
  %polly.access.Packed_A348.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A347.us.us.us
  %_p_scalar_349.us.us.us = load float, float* %polly.access.Packed_A348.us.us.us, align 4, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_A491.us.us.us = or i64 %polly.access.mul.Packed_A205.us.us.us, 2
  %polly.access.Packed_A492.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A491.us.us.us
  %polly.access.add.Packed_A635.us.us.us = or i64 %polly.access.mul.Packed_A205.us.us.us, 3
  %polly.access.Packed_A636.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A635.us.us.us
  %387 = bitcast float* %polly.access.Packed_B213.us.us.us to <2 x float>*
  %388 = load <2 x float>, <2 x float>* %387, align 32, !alias.scope !44, !noalias !45
  %389 = bitcast float* %polly.access.Packed_B247.us.us.us to <2 x float>*
  %390 = load <2 x float>, <2 x float>* %389, align 8, !alias.scope !44, !noalias !45
  %391 = load <4 x float>, <4 x float>* %369, align 4, !alias.scope !56, !noalias !57
  %392 = insertelement <4 x float> poison, float %_p_scalar_.us.us.us, i64 0
  %shuffle3874 = shufflevector <4 x float> %392, <4 x float> poison, <4 x i32> zeroinitializer
  %393 = shufflevector <2 x float> %388, <2 x float> %390, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %394 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3874, <4 x float> %393, <4 x float> %391)
  %395 = bitcast float* %polly.access.Packed_B283.us.us.us to <2 x float>*
  %396 = load <2 x float>, <2 x float>* %395, align 16, !alias.scope !44, !noalias !45
  %397 = bitcast float* %polly.access.Packed_B319.us.us.us to <2 x float>*
  %398 = load <2 x float>, <2 x float>* %397, align 8, !alias.scope !44, !noalias !45
  %399 = load <4 x float>, <4 x float>* %375, align 4, !alias.scope !56, !noalias !57
  store <4 x float> %394, <4 x float>* %370, align 4, !alias.scope !56, !noalias !57
  %400 = shufflevector <2 x float> %396, <2 x float> %398, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %401 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3874, <4 x float> %400, <4 x float> %399)
  store <4 x float> %401, <4 x float>* %376, align 4, !alias.scope !56, !noalias !57
  %402 = load <4 x float>, <4 x float>* %377, align 4, !alias.scope !56, !noalias !57
  %403 = insertelement <4 x float> poison, float %_p_scalar_349.us.us.us, i64 0
  %shuffle3872 = shufflevector <4 x float> %403, <4 x float> poison, <4 x i32> zeroinitializer
  %404 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3872, <4 x float> %393, <4 x float> %402)
  store <4 x float> %404, <4 x float>* %378, align 4, !alias.scope !56, !noalias !57
  %405 = load <4 x float>, <4 x float>* %379, align 4, !alias.scope !56, !noalias !57
  %406 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3872, <4 x float> %400, <4 x float> %405)
  store <4 x float> %406, <4 x float>* %380, align 4, !alias.scope !56, !noalias !57
  %_p_scalar_493.us.us.us = load float, float* %polly.access.Packed_A492.us.us.us, align 8, !alias.scope !52, !noalias !53
  %407 = load <4 x float>, <4 x float>* %381, align 4, !alias.scope !56, !noalias !57
  %408 = insertelement <4 x float> poison, float %_p_scalar_493.us.us.us, i64 0
  %shuffle3870 = shufflevector <4 x float> %408, <4 x float> poison, <4 x i32> zeroinitializer
  %409 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3870, <4 x float> %393, <4 x float> %407)
  store <4 x float> %409, <4 x float>* %382, align 4, !alias.scope !56, !noalias !57
  %410 = load <4 x float>, <4 x float>* %383, align 4, !alias.scope !56, !noalias !57
  %411 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3870, <4 x float> %400, <4 x float> %410)
  store <4 x float> %411, <4 x float>* %384, align 4, !alias.scope !56, !noalias !57
  %_p_scalar_637.us.us.us = load float, float* %polly.access.Packed_A636.us.us.us, align 4, !alias.scope !52, !noalias !53
  %412 = load <2 x float>, <2 x float>* %367, align 4, !alias.scope !56, !noalias !57
  %413 = insertelement <2 x float> poison, float %_p_scalar_637.us.us.us, i64 0
  %414 = shufflevector <2 x float> %413, <2 x float> poison, <2 x i32> zeroinitializer
  %415 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %414, <2 x float> %388, <2 x float> %412)
  store <2 x float> %415, <2 x float>* %368, align 4, !alias.scope !56, !noalias !57
  %416 = load <2 x float>, <2 x float>* %371, align 4, !alias.scope !56, !noalias !57
  %417 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %414, <2 x float> %390, <2 x float> %416)
  store <2 x float> %417, <2 x float>* %372, align 4, !alias.scope !56, !noalias !57
  %418 = load <2 x float>, <2 x float>* %373, align 4, !alias.scope !56, !noalias !57
  %419 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %414, <2 x float> %396, <2 x float> %418)
  store <2 x float> %419, <2 x float>* %374, align 4, !alias.scope !56, !noalias !57
  %420 = load <2 x float>, <2 x float>* %385, align 4, !alias.scope !56, !noalias !57
  %421 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %414, <2 x float> %398, <2 x float> %420)
  store <2 x float> %421, <2 x float>* %386, align 4, !alias.scope !56, !noalias !57
  %polly.indvar_next200.us.us.us = add nuw nsw i64 %polly.indvar199.us.us.us, 1
  %exitcond3719.not = icmp eq i64 %polly.indvar199.us.us.us, %smin3746
  br i1 %exitcond3719.not, label %polly.loop_exit197.loopexit.us.us.us, label %polly.stmt.for.body8.us.us.us756.us.us.us, !llvm.loop !61

polly.loop_exit197.loopexit.us.us.us:             ; preds = %polly.stmt.for.body8.us.us.us756.us.us.us
  %polly.indvar_next192.us.us.us = add nuw nsw i64 %polly.indvar191.us.us.us, 1
  %exitcond3724.not = icmp eq i64 %polly.indvar_next192.us.us.us, %182
  br i1 %exitcond3724.not, label %polly.cond774.us.us, label %polly.loop_if194.us.us.us

polly.loop_if2835.us.us.us:                       ; preds = %polly.loop_if2827.us.us, %polly.loop_exit2838.loopexit.us.us.us
  %polly.indvar2832.us.us.us = phi i64 [ %polly.indvar_next2833.us.us.us, %polly.loop_exit2838.loopexit.us.us.us ], [ 0, %polly.loop_if2827.us.us ]
  %422 = shl nsw i64 %polly.indvar2832.us.us.us, 2
  %423 = add nuw nsw i64 %422, %183
  %polly.access.mul.Packed_A2846.us.us.us = shl nsw i64 %polly.indvar2832.us.us.us, 9
  %424 = mul i64 %423, %ldc
  %425 = add i64 %424, %80
  %scevgep2860.us.us.us = getelementptr float, float* %C, i64 %425
  %426 = or i64 %423, 2
  %.not3533.us.us.us = icmp sgt i64 %426, %M
  %427 = add i64 %424, %79
  %scevgep2885.us.us.us = getelementptr float, float* %C, i64 %427
  %428 = add i64 %427, 1
  %scevgep2910.us.us.us = getelementptr float, float* %C, i64 %428
  %429 = add i64 %427, 2
  %scevgep2935.us.us.us = getelementptr float, float* %C, i64 %429
  %430 = add i64 %427, 3
  %scevgep2960.us.us.us = getelementptr float, float* %C, i64 %430
  %431 = add i64 %427, 4
  %scevgep2985.us.us.us = getelementptr float, float* %C, i64 %431
  %432 = add i64 %424, %66
  %scevgep3009.us.us.us = getelementptr float, float* %C, i64 %432
  %433 = or i64 %423, 1
  %434 = mul i64 %433, %ldc
  %435 = add i64 %434, %80
  %scevgep3033.us.us.us = getelementptr float, float* %C, i64 %435
  %436 = add i64 %434, %79
  %scevgep3058.us.us.us = getelementptr float, float* %C, i64 %436
  %437 = add i64 %436, 1
  %scevgep3083.us.us.us = getelementptr float, float* %C, i64 %437
  %438 = add i64 %436, 2
  %scevgep3108.us.us.us = getelementptr float, float* %C, i64 %438
  %439 = add i64 %436, 3
  %scevgep3133.us.us.us = getelementptr float, float* %C, i64 %439
  %440 = add i64 %436, 4
  %scevgep3158.us.us.us = getelementptr float, float* %C, i64 %440
  %441 = add i64 %434, %66
  %scevgep3182.us.us.us = getelementptr float, float* %C, i64 %441
  %442 = or i64 %423, 3
  %.not3534.us.us.us = icmp sgt i64 %442, %M
  %443 = mul i64 %426, %ldc
  %444 = add i64 %443, %80
  %scevgep3206.us.us.us = getelementptr float, float* %C, i64 %444
  %445 = add i64 %443, %79
  %scevgep3231.us.us.us = getelementptr float, float* %C, i64 %445
  %446 = add i64 %445, 1
  %scevgep3256.us.us.us = getelementptr float, float* %C, i64 %446
  %447 = add i64 %445, 2
  %scevgep3281.us.us.us = getelementptr float, float* %C, i64 %447
  %448 = add i64 %445, 3
  %scevgep3306.us.us.us = getelementptr float, float* %C, i64 %448
  %449 = add i64 %445, 4
  %scevgep3331.us.us.us = getelementptr float, float* %C, i64 %449
  %450 = add i64 %443, %66
  %scevgep3355.us.us.us = getelementptr float, float* %C, i64 %450
  %451 = add nuw nsw i64 %423, 4
  %.not3535.us.us.us = icmp sgt i64 %451, %M
  %452 = mul i64 %442, %ldc
  %453 = add i64 %452, %80
  %scevgep3379.us.us.us = getelementptr float, float* %C, i64 %453
  %454 = add i64 %452, %79
  %scevgep3404.us.us.us = getelementptr float, float* %C, i64 %454
  %455 = add i64 %454, 1
  %scevgep3429.us.us.us = getelementptr float, float* %C, i64 %455
  %456 = add i64 %454, 2
  %scevgep3454.us.us.us = getelementptr float, float* %C, i64 %456
  %457 = add i64 %454, 3
  %scevgep3479.us.us.us = getelementptr float, float* %C, i64 %457
  %458 = add i64 %454, 4
  %scevgep3504.us.us.us = getelementptr float, float* %C, i64 %458
  %459 = add i64 %452, %66
  %scevgep3528.us.us.us = getelementptr float, float* %C, i64 %459
  br label %polly.cond2863.us.us.us

polly.cond2863.us.us.us:                          ; preds = %polly.merge3013.us.us.us, %polly.loop_if2835.us.us.us
  %polly.indvar2840.us.us.us = phi i64 [ %polly.indvar_next2841.us.us.us, %polly.merge3013.us.us.us ], [ 0, %polly.loop_if2835.us.us.us ]
  %polly.access.add.Packed_A2847.us.us.us = add nuw nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_A2846.us.us.us
  %polly.access.mul.Packed_A2848.us.us.us = shl nsw i64 %polly.access.add.Packed_A2847.us.us.us, 2
  %polly.access.Packed_A2850.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2848.us.us.us
  %_p_scalar_2851.us.us.us = load float, float* %polly.access.Packed_A2850.us.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_B2855.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2854.us
  %polly.access.mul.Packed_B2856.us.us.us = shl nsw i64 %polly.access.add.Packed_B2855.us.us.us, 3
  %polly.access.Packed_B2858.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2856.us.us.us
  %_p_scalar_2859.us.us.us = load float, float* %polly.access.Packed_B2858.us.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_2861.us.us.us = load float, float* %scevgep2860.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2862.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2859.us.us.us, float %_p_scalar_2861.us.us.us)
  store float %p_2862.us.us.us, float* %scevgep2860.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %81, label %polly.cond2888.us.us.us, label %polly.cond3012.us.us.us.thread

polly.cond2888.us.us.us:                          ; preds = %polly.cond2863.us.us.us
  %polly.access.add.Packed_B2880.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2879.us
  %polly.access.mul.Packed_B2881.us.us.us = shl nsw i64 %polly.access.add.Packed_B2880.us.us.us, 3
  %polly.access.add.Packed_B2882.us.us.us = or i64 %polly.access.mul.Packed_B2881.us.us.us, 1
  %polly.access.Packed_B2883.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2882.us.us.us
  %_p_scalar_2884.us.us.us = load float, float* %polly.access.Packed_B2883.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2886.us.us.us = load float, float* %scevgep2885.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2887.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2884.us.us.us, float %_p_scalar_2886.us.us.us)
  store float %p_2887.us.us.us, float* %scevgep2885.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3551, label %polly.cond3012.us.us.us, label %polly.cond2913.us.us.us

polly.cond2913.us.us.us:                          ; preds = %polly.cond2888.us.us.us
  %polly.access.add.Packed_B2905.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2904.us
  %polly.access.mul.Packed_B2906.us.us.us = shl nsw i64 %polly.access.add.Packed_B2905.us.us.us, 3
  %polly.access.add.Packed_B2907.us.us.us = or i64 %polly.access.mul.Packed_B2906.us.us.us, 2
  %polly.access.Packed_B2908.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2907.us.us.us
  %_p_scalar_2909.us.us.us = load float, float* %polly.access.Packed_B2908.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2911.us.us.us = load float, float* %scevgep2910.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2912.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2909.us.us.us, float %_p_scalar_2911.us.us.us)
  store float %p_2912.us.us.us, float* %scevgep2910.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %84, label %polly.cond2938.us.us.us, label %polly.cond3012.us.us.us

polly.cond2938.us.us.us:                          ; preds = %polly.cond2913.us.us.us
  %polly.access.add.Packed_B2932.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 3
  %polly.access.Packed_B2933.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2932.us.us.us
  %_p_scalar_2934.us.us.us = load float, float* %polly.access.Packed_B2933.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2936.us.us.us = load float, float* %scevgep2935.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2937.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2934.us.us.us, float %_p_scalar_2936.us.us.us)
  store float %p_2937.us.us.us, float* %scevgep2935.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3553, label %polly.cond3012.us.us.us, label %polly.cond2963.us.us.us

polly.cond2963.us.us.us:                          ; preds = %polly.cond2938.us.us.us
  %polly.access.add.Packed_B2957.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 4
  %polly.access.Packed_B2958.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2957.us.us.us
  %_p_scalar_2959.us.us.us = load float, float* %polly.access.Packed_B2958.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2961.us.us.us = load float, float* %scevgep2960.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2962.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2959.us.us.us, float %_p_scalar_2961.us.us.us)
  store float %p_2962.us.us.us, float* %scevgep2960.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %85, label %polly.cond2988.us.us.us, label %polly.cond3012.us.us.us

polly.cond2988.us.us.us:                          ; preds = %polly.cond2963.us.us.us
  %polly.access.add.Packed_B2982.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 5
  %polly.access.Packed_B2983.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2982.us.us.us
  %_p_scalar_2984.us.us.us = load float, float* %polly.access.Packed_B2983.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2986.us.us.us = load float, float* %scevgep2985.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2987.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_2984.us.us.us, float %_p_scalar_2986.us.us.us)
  store float %p_2987.us.us.us, float* %scevgep2985.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %88, label %polly.stmt.for.body8.us.us.us2993.us.us.us, label %polly.cond3012.us.us.us

polly.stmt.for.body8.us.us.us2993.us.us.us:       ; preds = %polly.cond2988.us.us.us
  %polly.access.add.Packed_B3004.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B3003.us
  %polly.access.mul.Packed_B3005.us.us.us = shl nsw i64 %polly.access.add.Packed_B3004.us.us.us, 3
  %polly.access.add.Packed_B3006.us.us.us = or i64 %polly.access.mul.Packed_B3005.us.us.us, 6
  %polly.access.Packed_B3007.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3006.us.us.us
  %_p_scalar_3008.us.us.us = load float, float* %polly.access.Packed_B3007.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3010.us.us.us = load float, float* %scevgep3009.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3011.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2851.us.us.us, float %_p_scalar_3008.us.us.us, float %_p_scalar_3010.us.us.us)
  store float %p_3011.us.us.us, float* %scevgep3009.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond3012.us.us.us

polly.cond3012.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us2993.us.us.us, %polly.cond2988.us.us.us, %polly.cond2963.us.us.us, %polly.cond2938.us.us.us, %polly.cond2913.us.us.us, %polly.cond2888.us.us.us
  br i1 %.not3533.us.us.us, label %polly.merge3013.us.us.us, label %polly.cond3036.us.us.us

polly.cond3012.us.us.us.thread:                   ; preds = %polly.cond2863.us.us.us
  br i1 %.not3533.us.us.us, label %polly.merge3013.us.us.us, label %polly.cond3036.us.us.us.thread

polly.cond3036.us.us.us.thread:                   ; preds = %polly.cond3012.us.us.us.thread
  %polly.access.add.Packed_A3022.us.us.us3756 = or i64 %polly.access.mul.Packed_A2848.us.us.us, 1
  %polly.access.Packed_A3023.us.us.us3757 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3022.us.us.us3756
  %_p_scalar_3024.us.us.us3758 = load float, float* %polly.access.Packed_A3023.us.us.us3757, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_3034.us.us.us3759 = load float, float* %scevgep3033.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3035.us.us.us3760 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us3758, float %_p_scalar_2859.us.us.us, float %_p_scalar_3034.us.us.us3759)
  store float %p_3035.us.us.us3760, float* %scevgep3033.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond3185.us.us.us

polly.cond3036.us.us.us:                          ; preds = %polly.cond3012.us.us.us
  %polly.access.add.Packed_A3022.us.us.us = or i64 %polly.access.mul.Packed_A2848.us.us.us, 1
  %polly.access.Packed_A3023.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3022.us.us.us
  %_p_scalar_3024.us.us.us = load float, float* %polly.access.Packed_A3023.us.us.us, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_3034.us.us.us = load float, float* %scevgep3033.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3035.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_2859.us.us.us, float %_p_scalar_3034.us.us.us)
  store float %p_3035.us.us.us, float* %scevgep3033.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %81, label %polly.cond3061.us.us.us, label %polly.cond3185.us.us.us

polly.cond3061.us.us.us:                          ; preds = %polly.cond3036.us.us.us
  %polly.access.add.Packed_B3053.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2879.us
  %polly.access.mul.Packed_B3054.us.us.us = shl nsw i64 %polly.access.add.Packed_B3053.us.us.us, 3
  %polly.access.add.Packed_B3055.us.us.us = or i64 %polly.access.mul.Packed_B3054.us.us.us, 1
  %polly.access.Packed_B3056.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3055.us.us.us
  %_p_scalar_3057.us.us.us = load float, float* %polly.access.Packed_B3056.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3059.us.us.us = load float, float* %scevgep3058.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3060.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3057.us.us.us, float %_p_scalar_3059.us.us.us)
  store float %p_3060.us.us.us, float* %scevgep3058.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3551, label %polly.cond3185.us.us.us, label %polly.cond3086.us.us.us

polly.cond3086.us.us.us:                          ; preds = %polly.cond3061.us.us.us
  %polly.access.add.Packed_B3078.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2904.us
  %polly.access.mul.Packed_B3079.us.us.us = shl nsw i64 %polly.access.add.Packed_B3078.us.us.us, 3
  %polly.access.add.Packed_B3080.us.us.us = or i64 %polly.access.mul.Packed_B3079.us.us.us, 2
  %polly.access.Packed_B3081.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3080.us.us.us
  %_p_scalar_3082.us.us.us = load float, float* %polly.access.Packed_B3081.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3084.us.us.us = load float, float* %scevgep3083.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3085.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3082.us.us.us, float %_p_scalar_3084.us.us.us)
  store float %p_3085.us.us.us, float* %scevgep3083.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %84, label %polly.cond3111.us.us.us, label %polly.cond3185.us.us.us

polly.cond3111.us.us.us:                          ; preds = %polly.cond3086.us.us.us
  %polly.access.add.Packed_B3105.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 3
  %polly.access.Packed_B3106.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3105.us.us.us
  %_p_scalar_3107.us.us.us = load float, float* %polly.access.Packed_B3106.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3109.us.us.us = load float, float* %scevgep3108.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3110.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3107.us.us.us, float %_p_scalar_3109.us.us.us)
  store float %p_3110.us.us.us, float* %scevgep3108.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3553, label %polly.cond3185.us.us.us, label %polly.cond3136.us.us.us

polly.cond3136.us.us.us:                          ; preds = %polly.cond3111.us.us.us
  %polly.access.add.Packed_B3130.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 4
  %polly.access.Packed_B3131.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3130.us.us.us
  %_p_scalar_3132.us.us.us = load float, float* %polly.access.Packed_B3131.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3134.us.us.us = load float, float* %scevgep3133.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3135.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3132.us.us.us, float %_p_scalar_3134.us.us.us)
  store float %p_3135.us.us.us, float* %scevgep3133.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %85, label %polly.cond3161.us.us.us, label %polly.cond3185.us.us.us

polly.cond3161.us.us.us:                          ; preds = %polly.cond3136.us.us.us
  %polly.access.add.Packed_B3155.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 5
  %polly.access.Packed_B3156.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3155.us.us.us
  %_p_scalar_3157.us.us.us = load float, float* %polly.access.Packed_B3156.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3159.us.us.us = load float, float* %scevgep3158.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3160.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3157.us.us.us, float %_p_scalar_3159.us.us.us)
  store float %p_3160.us.us.us, float* %scevgep3158.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %88, label %polly.stmt.for.body8.us.us.us3166.us.us.us, label %polly.cond3185.us.us.us

polly.stmt.for.body8.us.us.us3166.us.us.us:       ; preds = %polly.cond3161.us.us.us
  %polly.access.add.Packed_B3177.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B3003.us
  %polly.access.mul.Packed_B3178.us.us.us = shl nsw i64 %polly.access.add.Packed_B3177.us.us.us, 3
  %polly.access.add.Packed_B3179.us.us.us = or i64 %polly.access.mul.Packed_B3178.us.us.us, 6
  %polly.access.Packed_B3180.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3179.us.us.us
  %_p_scalar_3181.us.us.us = load float, float* %polly.access.Packed_B3180.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3183.us.us.us = load float, float* %scevgep3182.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3184.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3024.us.us.us, float %_p_scalar_3181.us.us.us, float %_p_scalar_3183.us.us.us)
  store float %p_3184.us.us.us, float* %scevgep3182.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond3185.us.us.us

polly.cond3185.us.us.us:                          ; preds = %polly.cond3036.us.us.us.thread, %polly.stmt.for.body8.us.us.us3166.us.us.us, %polly.cond3161.us.us.us, %polly.cond3136.us.us.us, %polly.cond3111.us.us.us, %polly.cond3086.us.us.us, %polly.cond3061.us.us.us, %polly.cond3036.us.us.us
  br i1 %.not3534.us.us.us, label %polly.merge3013.us.us.us, label %polly.cond3209.us.us.us

polly.cond3209.us.us.us:                          ; preds = %polly.cond3185.us.us.us
  %polly.access.add.Packed_A3195.us.us.us = or i64 %polly.access.mul.Packed_A2848.us.us.us, 2
  %polly.access.Packed_A3196.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3195.us.us.us
  %_p_scalar_3197.us.us.us = load float, float* %polly.access.Packed_A3196.us.us.us, align 8, !alias.scope !52, !noalias !53
  %_p_scalar_3207.us.us.us = load float, float* %scevgep3206.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3208.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_2859.us.us.us, float %_p_scalar_3207.us.us.us)
  store float %p_3208.us.us.us, float* %scevgep3206.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %81, label %polly.cond3234.us.us.us, label %polly.cond3358.us.us.us.thread

polly.cond3234.us.us.us:                          ; preds = %polly.cond3209.us.us.us
  %polly.access.add.Packed_B3226.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2879.us
  %polly.access.mul.Packed_B3227.us.us.us = shl nsw i64 %polly.access.add.Packed_B3226.us.us.us, 3
  %polly.access.add.Packed_B3228.us.us.us = or i64 %polly.access.mul.Packed_B3227.us.us.us, 1
  %polly.access.Packed_B3229.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3228.us.us.us
  %_p_scalar_3230.us.us.us = load float, float* %polly.access.Packed_B3229.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3232.us.us.us = load float, float* %scevgep3231.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3233.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3230.us.us.us, float %_p_scalar_3232.us.us.us)
  store float %p_3233.us.us.us, float* %scevgep3231.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3551, label %polly.cond3358.us.us.us, label %polly.cond3259.us.us.us

polly.cond3259.us.us.us:                          ; preds = %polly.cond3234.us.us.us
  %polly.access.add.Packed_B3251.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2904.us
  %polly.access.mul.Packed_B3252.us.us.us = shl nsw i64 %polly.access.add.Packed_B3251.us.us.us, 3
  %polly.access.add.Packed_B3253.us.us.us = or i64 %polly.access.mul.Packed_B3252.us.us.us, 2
  %polly.access.Packed_B3254.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3253.us.us.us
  %_p_scalar_3255.us.us.us = load float, float* %polly.access.Packed_B3254.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3257.us.us.us = load float, float* %scevgep3256.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3258.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3255.us.us.us, float %_p_scalar_3257.us.us.us)
  store float %p_3258.us.us.us, float* %scevgep3256.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %84, label %polly.cond3284.us.us.us, label %polly.cond3358.us.us.us

polly.cond3284.us.us.us:                          ; preds = %polly.cond3259.us.us.us
  %polly.access.add.Packed_B3278.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 3
  %polly.access.Packed_B3279.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3278.us.us.us
  %_p_scalar_3280.us.us.us = load float, float* %polly.access.Packed_B3279.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3282.us.us.us = load float, float* %scevgep3281.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3283.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3280.us.us.us, float %_p_scalar_3282.us.us.us)
  store float %p_3283.us.us.us, float* %scevgep3281.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3553, label %polly.cond3358.us.us.us, label %polly.cond3309.us.us.us

polly.cond3309.us.us.us:                          ; preds = %polly.cond3284.us.us.us
  %polly.access.add.Packed_B3303.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 4
  %polly.access.Packed_B3304.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3303.us.us.us
  %_p_scalar_3305.us.us.us = load float, float* %polly.access.Packed_B3304.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3307.us.us.us = load float, float* %scevgep3306.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3308.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3305.us.us.us, float %_p_scalar_3307.us.us.us)
  store float %p_3308.us.us.us, float* %scevgep3306.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %85, label %polly.cond3334.us.us.us, label %polly.cond3358.us.us.us

polly.cond3334.us.us.us:                          ; preds = %polly.cond3309.us.us.us
  %polly.access.add.Packed_B3328.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 5
  %polly.access.Packed_B3329.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3328.us.us.us
  %_p_scalar_3330.us.us.us = load float, float* %polly.access.Packed_B3329.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3332.us.us.us = load float, float* %scevgep3331.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3333.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3330.us.us.us, float %_p_scalar_3332.us.us.us)
  store float %p_3333.us.us.us, float* %scevgep3331.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %88, label %polly.stmt.for.body8.us.us.us3339.us.us.us, label %polly.cond3358.us.us.us

polly.stmt.for.body8.us.us.us3339.us.us.us:       ; preds = %polly.cond3334.us.us.us
  %polly.access.add.Packed_B3350.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B3003.us
  %polly.access.mul.Packed_B3351.us.us.us = shl nsw i64 %polly.access.add.Packed_B3350.us.us.us, 3
  %polly.access.add.Packed_B3352.us.us.us = or i64 %polly.access.mul.Packed_B3351.us.us.us, 6
  %polly.access.Packed_B3353.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3352.us.us.us
  %_p_scalar_3354.us.us.us = load float, float* %polly.access.Packed_B3353.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3356.us.us.us = load float, float* %scevgep3355.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3357.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3197.us.us.us, float %_p_scalar_3354.us.us.us, float %_p_scalar_3356.us.us.us)
  store float %p_3357.us.us.us, float* %scevgep3355.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond3358.us.us.us

polly.cond3358.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us3339.us.us.us, %polly.cond3334.us.us.us, %polly.cond3309.us.us.us, %polly.cond3284.us.us.us, %polly.cond3259.us.us.us, %polly.cond3234.us.us.us
  br i1 %.not3535.us.us.us, label %polly.merge3013.us.us.us, label %polly.cond3382.us.us.us

polly.cond3358.us.us.us.thread:                   ; preds = %polly.cond3209.us.us.us
  br i1 %.not3535.us.us.us, label %polly.merge3013.us.us.us, label %polly.cond3382.us.us.us.thread

polly.cond3382.us.us.us.thread:                   ; preds = %polly.cond3358.us.us.us.thread
  %polly.access.add.Packed_A3368.us.us.us3761 = or i64 %polly.access.mul.Packed_A2848.us.us.us, 3
  %polly.access.Packed_A3369.us.us.us3762 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3368.us.us.us3761
  %_p_scalar_3370.us.us.us3763 = load float, float* %polly.access.Packed_A3369.us.us.us3762, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_3380.us.us.us3764 = load float, float* %scevgep3379.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3381.us.us.us3765 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us3763, float %_p_scalar_2859.us.us.us, float %_p_scalar_3380.us.us.us3764)
  store float %p_3381.us.us.us3765, float* %scevgep3379.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge3013.us.us.us

polly.cond3382.us.us.us:                          ; preds = %polly.cond3358.us.us.us
  %polly.access.add.Packed_A3368.us.us.us = or i64 %polly.access.mul.Packed_A2848.us.us.us, 3
  %polly.access.Packed_A3369.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3368.us.us.us
  %_p_scalar_3370.us.us.us = load float, float* %polly.access.Packed_A3369.us.us.us, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_3380.us.us.us = load float, float* %scevgep3379.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3381.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_2859.us.us.us, float %_p_scalar_3380.us.us.us)
  store float %p_3381.us.us.us, float* %scevgep3379.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %81, label %polly.cond3407.us.us.us, label %polly.merge3013.us.us.us

polly.cond3407.us.us.us:                          ; preds = %polly.cond3382.us.us.us
  %polly.access.add.Packed_B3399.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2879.us
  %polly.access.mul.Packed_B3400.us.us.us = shl nsw i64 %polly.access.add.Packed_B3399.us.us.us, 3
  %polly.access.add.Packed_B3401.us.us.us = or i64 %polly.access.mul.Packed_B3400.us.us.us, 1
  %polly.access.Packed_B3402.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3401.us.us.us
  %_p_scalar_3403.us.us.us = load float, float* %polly.access.Packed_B3402.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3405.us.us.us = load float, float* %scevgep3404.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3406.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3403.us.us.us, float %_p_scalar_3405.us.us.us)
  store float %p_3406.us.us.us, float* %scevgep3404.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3551, label %polly.merge3013.us.us.us, label %polly.cond3432.us.us.us

polly.cond3432.us.us.us:                          ; preds = %polly.cond3407.us.us.us
  %polly.access.add.Packed_B3424.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B2904.us
  %polly.access.mul.Packed_B3425.us.us.us = shl nsw i64 %polly.access.add.Packed_B3424.us.us.us, 3
  %polly.access.add.Packed_B3426.us.us.us = or i64 %polly.access.mul.Packed_B3425.us.us.us, 2
  %polly.access.Packed_B3427.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3426.us.us.us
  %_p_scalar_3428.us.us.us = load float, float* %polly.access.Packed_B3427.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3430.us.us.us = load float, float* %scevgep3429.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3431.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3428.us.us.us, float %_p_scalar_3430.us.us.us)
  store float %p_3431.us.us.us, float* %scevgep3429.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %84, label %polly.cond3457.us.us.us, label %polly.merge3013.us.us.us

polly.cond3457.us.us.us:                          ; preds = %polly.cond3432.us.us.us
  %polly.access.add.Packed_B3451.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 3
  %polly.access.Packed_B3452.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3451.us.us.us
  %_p_scalar_3453.us.us.us = load float, float* %polly.access.Packed_B3452.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3455.us.us.us = load float, float* %scevgep3454.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3456.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3453.us.us.us, float %_p_scalar_3455.us.us.us)
  store float %p_3456.us.us.us, float* %scevgep3454.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3553, label %polly.merge3013.us.us.us, label %polly.cond3482.us.us.us

polly.cond3482.us.us.us:                          ; preds = %polly.cond3457.us.us.us
  %polly.access.add.Packed_B3476.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 4
  %polly.access.Packed_B3477.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3476.us.us.us
  %_p_scalar_3478.us.us.us = load float, float* %polly.access.Packed_B3477.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3480.us.us.us = load float, float* %scevgep3479.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3481.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3478.us.us.us, float %_p_scalar_3480.us.us.us)
  store float %p_3481.us.us.us, float* %scevgep3479.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %85, label %polly.cond3507.us.us.us, label %polly.merge3013.us.us.us

polly.cond3507.us.us.us:                          ; preds = %polly.cond3482.us.us.us
  %polly.access.add.Packed_B3501.us.us.us = or i64 %polly.access.mul.Packed_B2856.us.us.us, 5
  %polly.access.Packed_B3502.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3501.us.us.us
  %_p_scalar_3503.us.us.us = load float, float* %polly.access.Packed_B3502.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3505.us.us.us = load float, float* %scevgep3504.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3506.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3503.us.us.us, float %_p_scalar_3505.us.us.us)
  store float %p_3506.us.us.us, float* %scevgep3504.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %88, label %polly.stmt.for.body8.us.us.us3512.us.us.us, label %polly.merge3013.us.us.us

polly.stmt.for.body8.us.us.us3512.us.us.us:       ; preds = %polly.cond3507.us.us.us
  %polly.access.add.Packed_B3523.us.us.us = add nsw i64 %polly.indvar2840.us.us.us, %polly.access.mul.Packed_B3003.us
  %polly.access.mul.Packed_B3524.us.us.us = shl nsw i64 %polly.access.add.Packed_B3523.us.us.us, 3
  %polly.access.add.Packed_B3525.us.us.us = or i64 %polly.access.mul.Packed_B3524.us.us.us, 6
  %polly.access.Packed_B3526.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3525.us.us.us
  %_p_scalar_3527.us.us.us = load float, float* %polly.access.Packed_B3526.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3529.us.us.us = load float, float* %scevgep3528.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_3530.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3370.us.us.us, float %_p_scalar_3527.us.us.us, float %_p_scalar_3529.us.us.us)
  store float %p_3530.us.us.us, float* %scevgep3528.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge3013.us.us.us

polly.merge3013.us.us.us:                         ; preds = %polly.cond3382.us.us.us.thread, %polly.cond3358.us.us.us.thread, %polly.cond3012.us.us.us.thread, %polly.stmt.for.body8.us.us.us3512.us.us.us, %polly.cond3507.us.us.us, %polly.cond3482.us.us.us, %polly.cond3457.us.us.us, %polly.cond3432.us.us.us, %polly.cond3407.us.us.us, %polly.cond3382.us.us.us, %polly.cond3358.us.us.us, %polly.cond3185.us.us.us, %polly.cond3012.us.us.us
  %polly.indvar_next2841.us.us.us = add nuw nsw i64 %polly.indvar2840.us.us.us, 1
  %exitcond3735.not = icmp eq i64 %polly.indvar2840.us.us.us, %smin3746
  br i1 %exitcond3735.not, label %polly.loop_exit2838.loopexit.us.us.us, label %polly.cond2863.us.us.us, !llvm.loop !62

polly.loop_exit2838.loopexit.us.us.us:            ; preds = %polly.merge3013.us.us.us
  %polly.indvar_next2833.us.us.us = add nuw nsw i64 %polly.indvar2832.us.us.us, 1
  %exitcond3739.not = icmp eq i64 %polly.indvar2832.us.us.us, %smin3748
  br i1 %exitcond3739.not, label %polly.merge1696.us.us, label %polly.loop_if2835.us.us.us

polly.loop_if2318.us.us.us:                       ; preds = %polly.loop_if2318.preheader.us.us, %polly.loop_exit2321.loopexit.us.us.us
  %polly.indvar2315.us.us.us = phi i64 [ %polly.indvar_next2316.us.us.us, %polly.loop_exit2321.loopexit.us.us.us ], [ 0, %polly.loop_if2318.preheader.us.us ]
  %460 = shl nsw i64 %polly.indvar2315.us.us.us, 3
  %461 = add nuw nsw i64 %460, %102
  %polly.access.mul.Packed_B2334.us.us.us = shl nsw i64 %polly.indvar2315.us.us.us, 9
  %462 = add i64 %461, %319
  %scevgep2340.us.us.us = getelementptr float, float* %C, i64 %462
  %463 = or i64 %461, 2
  %.not3556.us.us.us = icmp sgt i64 %463, %N
  %464 = add i64 %321, %461
  %scevgep2361.us.us.us = getelementptr float, float* %C, i64 %464
  %465 = or i64 %461, 3
  %.not3570.us.us.us = icmp sgt i64 %465, %N
  %466 = add i64 %463, %319
  %scevgep2382.us.us.us = getelementptr float, float* %C, i64 %466
  %467 = or i64 %461, 4
  %.not3571.us.us.us = icmp sgt i64 %467, %N
  %468 = add i64 %465, %319
  %scevgep2403.us.us.us = getelementptr float, float* %C, i64 %468
  %469 = or i64 %461, 5
  %.not3572.us.us.us = icmp sgt i64 %469, %N
  %470 = add i64 %467, %319
  %scevgep2424.us.us.us = getelementptr float, float* %C, i64 %470
  %471 = or i64 %461, 6
  %.not3573.us.us.us = icmp sgt i64 %471, %N
  %472 = add i64 %469, %319
  %scevgep2445.us.us.us = getelementptr float, float* %C, i64 %472
  %473 = or i64 %461, 7
  %.not3574.us.us.us = icmp sgt i64 %473, %N
  %474 = add i64 %471, %319
  %scevgep2466.us.us.us = getelementptr float, float* %C, i64 %474
  %475 = add nuw nsw i64 %461, 8
  %.not3575.us.us.us = icmp sgt i64 %475, %N
  %476 = add i64 %473, %319
  %scevgep2487.us.us.us = getelementptr float, float* %C, i64 %476
  %477 = add i64 %461, %323
  %scevgep2508.us.us.us = getelementptr float, float* %C, i64 %477
  %478 = add i64 %324, %461
  %scevgep2529.us.us.us = getelementptr float, float* %C, i64 %478
  %479 = add i64 %463, %323
  %scevgep2550.us.us.us = getelementptr float, float* %C, i64 %479
  %480 = add i64 %465, %323
  %scevgep2571.us.us.us = getelementptr float, float* %C, i64 %480
  %481 = add i64 %467, %323
  %scevgep2592.us.us.us = getelementptr float, float* %C, i64 %481
  %482 = add i64 %469, %323
  %scevgep2613.us.us.us = getelementptr float, float* %C, i64 %482
  %483 = add i64 %471, %323
  %scevgep2634.us.us.us = getelementptr float, float* %C, i64 %483
  %484 = add i64 %473, %323
  %scevgep2655.us.us.us = getelementptr float, float* %C, i64 %484
  %485 = add i64 %461, %78
  %scevgep2676.us.us.us = getelementptr float, float* %C, i64 %485
  %486 = add i64 %90, %461
  %scevgep2697.us.us.us = getelementptr float, float* %C, i64 %486
  %487 = add i64 %463, %78
  %scevgep2718.us.us.us = getelementptr float, float* %C, i64 %487
  %488 = add i64 %465, %78
  %scevgep2739.us.us.us = getelementptr float, float* %C, i64 %488
  %489 = add i64 %467, %78
  %scevgep2760.us.us.us = getelementptr float, float* %C, i64 %489
  %490 = add i64 %469, %78
  %scevgep2781.us.us.us = getelementptr float, float* %C, i64 %490
  %491 = add i64 %471, %78
  %scevgep2802.us.us.us = getelementptr float, float* %C, i64 %491
  %492 = add i64 %473, %78
  %scevgep2823.us.us.us = getelementptr float, float* %C, i64 %492
  br label %polly.cond2343.us.us.us

polly.cond2343.us.us.us:                          ; preds = %polly.merge2491.us.us.us, %polly.loop_if2318.us.us.us
  %polly.indvar2323.us.us.us = phi i64 [ %polly.indvar_next2324.us.us.us, %polly.merge2491.us.us.us ], [ 0, %polly.loop_if2318.us.us.us ]
  %polly.access.mul.Packed_A2329.us.us.us = shl nsw i64 %polly.indvar2323.us.us.us, 2
  %polly.access.Packed_A2331.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2329.us.us.us
  %_p_scalar_2332.us.us.us = load float, float* %polly.access.Packed_A2331.us.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.add.Packed_B2335.us.us.us = add nuw nsw i64 %polly.indvar2323.us.us.us, %polly.access.mul.Packed_B2334.us.us.us
  %polly.access.mul.Packed_B2336.us.us.us = shl nsw i64 %polly.access.add.Packed_B2335.us.us.us, 3
  %polly.access.Packed_B2338.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2336.us.us.us
  %_p_scalar_2339.us.us.us = load float, float* %polly.access.Packed_B2338.us.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_2341.us.us.us = load float, float* %scevgep2340.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2342.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2339.us.us.us, float %_p_scalar_2341.us.us.us)
  store float %p_2342.us.us.us, float* %scevgep2340.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3556.us.us.us, label %polly.cond2490.us.us.us.thread, label %polly.cond2364.us.us.us

polly.cond2364.us.us.us:                          ; preds = %polly.cond2343.us.us.us
  %polly.access.add.Packed_B2358.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 1
  %polly.access.Packed_B2359.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2358.us.us.us
  %_p_scalar_2360.us.us.us = load float, float* %polly.access.Packed_B2359.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2362.us.us.us = load float, float* %scevgep2361.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2363.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2360.us.us.us, float %_p_scalar_2362.us.us.us)
  store float %p_2363.us.us.us, float* %scevgep2361.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3570.us.us.us, label %polly.cond2490.us.us.us, label %polly.cond2385.us.us.us

polly.cond2385.us.us.us:                          ; preds = %polly.cond2364.us.us.us
  %polly.access.add.Packed_B2379.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 2
  %polly.access.Packed_B2380.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2379.us.us.us
  %_p_scalar_2381.us.us.us = load float, float* %polly.access.Packed_B2380.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2383.us.us.us = load float, float* %scevgep2382.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2384.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2381.us.us.us, float %_p_scalar_2383.us.us.us)
  store float %p_2384.us.us.us, float* %scevgep2382.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3571.us.us.us, label %polly.cond2490.us.us.us, label %polly.cond2406.us.us.us

polly.cond2406.us.us.us:                          ; preds = %polly.cond2385.us.us.us
  %polly.access.add.Packed_B2400.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 3
  %polly.access.Packed_B2401.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2400.us.us.us
  %_p_scalar_2402.us.us.us = load float, float* %polly.access.Packed_B2401.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2404.us.us.us = load float, float* %scevgep2403.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2405.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2402.us.us.us, float %_p_scalar_2404.us.us.us)
  store float %p_2405.us.us.us, float* %scevgep2403.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3572.us.us.us, label %polly.cond2490.us.us.us, label %polly.cond2427.us.us.us

polly.cond2427.us.us.us:                          ; preds = %polly.cond2406.us.us.us
  %polly.access.add.Packed_B2421.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 4
  %polly.access.Packed_B2422.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2421.us.us.us
  %_p_scalar_2423.us.us.us = load float, float* %polly.access.Packed_B2422.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2425.us.us.us = load float, float* %scevgep2424.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2426.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2423.us.us.us, float %_p_scalar_2425.us.us.us)
  store float %p_2426.us.us.us, float* %scevgep2424.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3573.us.us.us, label %polly.cond2490.us.us.us, label %polly.cond2448.us.us.us

polly.cond2448.us.us.us:                          ; preds = %polly.cond2427.us.us.us
  %polly.access.add.Packed_B2442.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 5
  %polly.access.Packed_B2443.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2442.us.us.us
  %_p_scalar_2444.us.us.us = load float, float* %polly.access.Packed_B2443.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2446.us.us.us = load float, float* %scevgep2445.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2447.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2444.us.us.us, float %_p_scalar_2446.us.us.us)
  store float %p_2447.us.us.us, float* %scevgep2445.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3574.us.us.us, label %polly.cond2490.us.us.us, label %polly.cond2469.us.us.us

polly.cond2469.us.us.us:                          ; preds = %polly.cond2448.us.us.us
  %polly.access.add.Packed_B2463.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 6
  %polly.access.Packed_B2464.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2463.us.us.us
  %_p_scalar_2465.us.us.us = load float, float* %polly.access.Packed_B2464.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2467.us.us.us = load float, float* %scevgep2466.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2468.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2465.us.us.us, float %_p_scalar_2467.us.us.us)
  store float %p_2468.us.us.us, float* %scevgep2466.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3575.us.us.us, label %polly.cond2490.us.us.us, label %polly.stmt.for.body8.us.us.us2473.us.us.us

polly.stmt.for.body8.us.us.us2473.us.us.us:       ; preds = %polly.cond2469.us.us.us
  %polly.access.add.Packed_B2484.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 7
  %polly.access.Packed_B2485.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2484.us.us.us
  %_p_scalar_2486.us.us.us = load float, float* %polly.access.Packed_B2485.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2488.us.us.us = load float, float* %scevgep2487.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2489.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2332.us.us.us, float %_p_scalar_2486.us.us.us, float %_p_scalar_2488.us.us.us)
  store float %p_2489.us.us.us, float* %scevgep2487.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond2490.us.us.us

polly.cond2490.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us2473.us.us.us, %polly.cond2469.us.us.us, %polly.cond2448.us.us.us, %polly.cond2427.us.us.us, %polly.cond2406.us.us.us, %polly.cond2385.us.us.us, %polly.cond2364.us.us.us
  br i1 %.not3557.us.us, label %polly.merge2491.us.us.us, label %polly.cond2511.us.us.us

polly.cond2490.us.us.us.thread:                   ; preds = %polly.cond2343.us.us.us
  br i1 %.not3557.us.us, label %polly.merge2491.us.us.us, label %polly.cond2511.us.us.us.thread

polly.cond2511.us.us.us.thread:                   ; preds = %polly.cond2490.us.us.us.thread
  %polly.access.add.Packed_A2498.us.us.us3766 = or i64 %polly.access.mul.Packed_A2329.us.us.us, 1
  %polly.access.Packed_A2499.us.us.us3767 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2498.us.us.us3766
  %_p_scalar_2500.us.us.us3768 = load float, float* %polly.access.Packed_A2499.us.us.us3767, align 4, !alias.scope !52, !noalias !53
  br label %polly.cond2658.us.us.us.sink.split

polly.cond2511.us.us.us:                          ; preds = %polly.cond2490.us.us.us
  %polly.access.add.Packed_A2498.us.us.us = or i64 %polly.access.mul.Packed_A2329.us.us.us, 1
  %polly.access.Packed_A2499.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2498.us.us.us
  %_p_scalar_2500.us.us.us = load float, float* %polly.access.Packed_A2499.us.us.us, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_2509.us.us.us = load float, float* %scevgep2508.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2510.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2339.us.us.us, float %_p_scalar_2509.us.us.us)
  store float %p_2510.us.us.us, float* %scevgep2508.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3556.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2532.us.us.us

polly.cond2532.us.us.us:                          ; preds = %polly.cond2511.us.us.us
  %polly.access.add.Packed_B2526.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 1
  %polly.access.Packed_B2527.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2526.us.us.us
  %_p_scalar_2528.us.us.us = load float, float* %polly.access.Packed_B2527.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2530.us.us.us = load float, float* %scevgep2529.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2531.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2528.us.us.us, float %_p_scalar_2530.us.us.us)
  store float %p_2531.us.us.us, float* %scevgep2529.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3570.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2553.us.us.us

polly.cond2553.us.us.us:                          ; preds = %polly.cond2532.us.us.us
  %polly.access.add.Packed_B2547.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 2
  %polly.access.Packed_B2548.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2547.us.us.us
  %_p_scalar_2549.us.us.us = load float, float* %polly.access.Packed_B2548.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2551.us.us.us = load float, float* %scevgep2550.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2552.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2549.us.us.us, float %_p_scalar_2551.us.us.us)
  store float %p_2552.us.us.us, float* %scevgep2550.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3571.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2574.us.us.us

polly.cond2574.us.us.us:                          ; preds = %polly.cond2553.us.us.us
  %polly.access.add.Packed_B2568.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 3
  %polly.access.Packed_B2569.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2568.us.us.us
  %_p_scalar_2570.us.us.us = load float, float* %polly.access.Packed_B2569.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2572.us.us.us = load float, float* %scevgep2571.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2573.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2570.us.us.us, float %_p_scalar_2572.us.us.us)
  store float %p_2573.us.us.us, float* %scevgep2571.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3572.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2595.us.us.us

polly.cond2595.us.us.us:                          ; preds = %polly.cond2574.us.us.us
  %polly.access.add.Packed_B2589.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 4
  %polly.access.Packed_B2590.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2589.us.us.us
  %_p_scalar_2591.us.us.us = load float, float* %polly.access.Packed_B2590.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2593.us.us.us = load float, float* %scevgep2592.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2594.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2591.us.us.us, float %_p_scalar_2593.us.us.us)
  store float %p_2594.us.us.us, float* %scevgep2592.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3573.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2616.us.us.us

polly.cond2616.us.us.us:                          ; preds = %polly.cond2595.us.us.us
  %polly.access.add.Packed_B2610.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 5
  %polly.access.Packed_B2611.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2610.us.us.us
  %_p_scalar_2612.us.us.us = load float, float* %polly.access.Packed_B2611.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2614.us.us.us = load float, float* %scevgep2613.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2615.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2612.us.us.us, float %_p_scalar_2614.us.us.us)
  store float %p_2615.us.us.us, float* %scevgep2613.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3574.us.us.us, label %polly.cond2658.us.us.us, label %polly.cond2637.us.us.us

polly.cond2637.us.us.us:                          ; preds = %polly.cond2616.us.us.us
  %polly.access.add.Packed_B2631.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 6
  %polly.access.Packed_B2632.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2631.us.us.us
  %_p_scalar_2633.us.us.us = load float, float* %polly.access.Packed_B2632.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2635.us.us.us = load float, float* %scevgep2634.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2636.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us, float %_p_scalar_2633.us.us.us, float %_p_scalar_2635.us.us.us)
  store float %p_2636.us.us.us, float* %scevgep2634.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3575.us.us.us, label %polly.cond2658.us.us.us, label %polly.stmt.for.body8.us.us.us2641.us.us.us

polly.stmt.for.body8.us.us.us2641.us.us.us:       ; preds = %polly.cond2637.us.us.us
  %polly.access.add.Packed_B2652.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 7
  %polly.access.Packed_B2653.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2652.us.us.us
  %_p_scalar_2654.us.us.us = load float, float* %polly.access.Packed_B2653.us.us.us, align 4, !alias.scope !44, !noalias !45
  br label %polly.cond2658.us.us.us.sink.split

polly.cond2658.us.us.us.sink.split:               ; preds = %polly.stmt.for.body8.us.us.us2641.us.us.us, %polly.cond2511.us.us.us.thread
  %scevgep2508.us.us.us.sink3789 = phi float* [ %scevgep2508.us.us.us, %polly.cond2511.us.us.us.thread ], [ %scevgep2655.us.us.us, %polly.stmt.for.body8.us.us.us2641.us.us.us ]
  %_p_scalar_2339.us.us.us.sink = phi float [ %_p_scalar_2339.us.us.us, %polly.cond2511.us.us.us.thread ], [ %_p_scalar_2654.us.us.us, %polly.stmt.for.body8.us.us.us2641.us.us.us ]
  %_p_scalar_2500.us.us.us3768.sink = phi float [ %_p_scalar_2500.us.us.us3768, %polly.cond2511.us.us.us.thread ], [ %_p_scalar_2500.us.us.us, %polly.stmt.for.body8.us.us.us2641.us.us.us ]
  %_p_scalar_2509.us.us.us3769 = load float, float* %scevgep2508.us.us.us.sink3789, align 4, !alias.scope !56, !noalias !57
  %p_2510.us.us.us3770 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2500.us.us.us3768.sink, float %_p_scalar_2339.us.us.us.sink, float %_p_scalar_2509.us.us.us3769)
  store float %p_2510.us.us.us3770, float* %scevgep2508.us.us.us.sink3789, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond2658.us.us.us

polly.cond2658.us.us.us:                          ; preds = %polly.cond2658.us.us.us.sink.split, %polly.cond2637.us.us.us, %polly.cond2616.us.us.us, %polly.cond2595.us.us.us, %polly.cond2574.us.us.us, %polly.cond2553.us.us.us, %polly.cond2532.us.us.us, %polly.cond2511.us.us.us
  br i1 %325, label %polly.cond2679.us.us.us, label %polly.merge2491.us.us.us

polly.cond2679.us.us.us:                          ; preds = %polly.cond2658.us.us.us
  %polly.access.add.Packed_A2666.us.us.us = or i64 %polly.access.mul.Packed_A2329.us.us.us, 2
  %polly.access.Packed_A2667.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2666.us.us.us
  %_p_scalar_2668.us.us.us = load float, float* %polly.access.Packed_A2667.us.us.us, align 8, !alias.scope !52, !noalias !53
  %_p_scalar_2677.us.us.us = load float, float* %scevgep2676.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2678.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2339.us.us.us, float %_p_scalar_2677.us.us.us)
  store float %p_2678.us.us.us, float* %scevgep2676.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3556.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2700.us.us.us

polly.cond2700.us.us.us:                          ; preds = %polly.cond2679.us.us.us
  %polly.access.add.Packed_B2694.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 1
  %polly.access.Packed_B2695.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2694.us.us.us
  %_p_scalar_2696.us.us.us = load float, float* %polly.access.Packed_B2695.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2698.us.us.us = load float, float* %scevgep2697.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2699.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2696.us.us.us, float %_p_scalar_2698.us.us.us)
  store float %p_2699.us.us.us, float* %scevgep2697.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3570.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2721.us.us.us

polly.cond2721.us.us.us:                          ; preds = %polly.cond2700.us.us.us
  %polly.access.add.Packed_B2715.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 2
  %polly.access.Packed_B2716.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2715.us.us.us
  %_p_scalar_2717.us.us.us = load float, float* %polly.access.Packed_B2716.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2719.us.us.us = load float, float* %scevgep2718.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2720.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2717.us.us.us, float %_p_scalar_2719.us.us.us)
  store float %p_2720.us.us.us, float* %scevgep2718.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3571.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2742.us.us.us

polly.cond2742.us.us.us:                          ; preds = %polly.cond2721.us.us.us
  %polly.access.add.Packed_B2736.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 3
  %polly.access.Packed_B2737.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2736.us.us.us
  %_p_scalar_2738.us.us.us = load float, float* %polly.access.Packed_B2737.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2740.us.us.us = load float, float* %scevgep2739.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2741.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2738.us.us.us, float %_p_scalar_2740.us.us.us)
  store float %p_2741.us.us.us, float* %scevgep2739.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3572.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2763.us.us.us

polly.cond2763.us.us.us:                          ; preds = %polly.cond2742.us.us.us
  %polly.access.add.Packed_B2757.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 4
  %polly.access.Packed_B2758.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2757.us.us.us
  %_p_scalar_2759.us.us.us = load float, float* %polly.access.Packed_B2758.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2761.us.us.us = load float, float* %scevgep2760.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2762.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2759.us.us.us, float %_p_scalar_2761.us.us.us)
  store float %p_2762.us.us.us, float* %scevgep2760.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3573.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2784.us.us.us

polly.cond2784.us.us.us:                          ; preds = %polly.cond2763.us.us.us
  %polly.access.add.Packed_B2778.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 5
  %polly.access.Packed_B2779.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2778.us.us.us
  %_p_scalar_2780.us.us.us = load float, float* %polly.access.Packed_B2779.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2782.us.us.us = load float, float* %scevgep2781.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2783.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2780.us.us.us, float %_p_scalar_2782.us.us.us)
  store float %p_2783.us.us.us, float* %scevgep2781.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3574.us.us.us, label %polly.merge2491.us.us.us, label %polly.cond2805.us.us.us

polly.cond2805.us.us.us:                          ; preds = %polly.cond2784.us.us.us
  %polly.access.add.Packed_B2799.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 6
  %polly.access.Packed_B2800.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2799.us.us.us
  %_p_scalar_2801.us.us.us = load float, float* %polly.access.Packed_B2800.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2803.us.us.us = load float, float* %scevgep2802.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2804.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2801.us.us.us, float %_p_scalar_2803.us.us.us)
  store float %p_2804.us.us.us, float* %scevgep2802.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3575.us.us.us, label %polly.merge2491.us.us.us, label %polly.stmt.for.body8.us.us.us2809.us.us.us

polly.stmt.for.body8.us.us.us2809.us.us.us:       ; preds = %polly.cond2805.us.us.us
  %polly.access.add.Packed_B2820.us.us.us = or i64 %polly.access.mul.Packed_B2336.us.us.us, 7
  %polly.access.Packed_B2821.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2820.us.us.us
  %_p_scalar_2822.us.us.us = load float, float* %polly.access.Packed_B2821.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2824.us.us.us = load float, float* %scevgep2823.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2825.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2668.us.us.us, float %_p_scalar_2822.us.us.us, float %_p_scalar_2824.us.us.us)
  store float %p_2825.us.us.us, float* %scevgep2823.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge2491.us.us.us

polly.merge2491.us.us.us:                         ; preds = %polly.cond2490.us.us.us.thread, %polly.stmt.for.body8.us.us.us2809.us.us.us, %polly.cond2805.us.us.us, %polly.cond2784.us.us.us, %polly.cond2763.us.us.us, %polly.cond2742.us.us.us, %polly.cond2721.us.us.us, %polly.cond2700.us.us.us, %polly.cond2679.us.us.us, %polly.cond2658.us.us.us, %polly.cond2490.us.us.us
  %polly.indvar_next2324.us.us.us = add nuw nsw i64 %polly.indvar2323.us.us.us, 1
  %exitcond3741.not = icmp eq i64 %polly.indvar2323.us.us.us, %smin3746
  br i1 %exitcond3741.not, label %polly.loop_exit2321.loopexit.us.us.us, label %polly.cond2343.us.us.us, !llvm.loop !63

polly.loop_exit2321.loopexit.us.us.us:            ; preds = %polly.merge2491.us.us.us
  %polly.indvar_next2316.us.us.us = add nuw nsw i64 %polly.indvar2315.us.us.us, 1
  %exitcond3745.not = icmp eq i64 %polly.indvar2315.us.us.us, %smin3744
  br i1 %exitcond3745.not, label %polly.merge1696.us.us, label %polly.loop_if2318.us.us.us

polly.loop_if1713.us.us.us:                       ; preds = %polly.loop_if1705.us.us, %polly.loop_exit1716.loopexit.us.us.us
  %polly.indvar1710.us.us.us = phi i64 [ %polly.indvar_next1711.us.us.us, %polly.loop_exit1716.loopexit.us.us.us ], [ 0, %polly.loop_if1705.us.us ]
  %493 = shl nsw i64 %polly.indvar1710.us.us.us, 2
  %494 = add nuw nsw i64 %493, %183
  %polly.access.mul.Packed_A1723.us.us.us = shl nsw i64 %polly.indvar1710.us.us.us, 9
  %495 = mul i64 %494, %ldc
  %496 = add i64 %495, %102
  %scevgep1735.us.us.us = getelementptr float, float* %C, i64 %496
  %497 = or i64 %494, 2
  %.not3578.us.us.us = icmp sgt i64 %497, %M
  %498 = add i64 %117, %495
  %scevgep1756.us.us.us = getelementptr float, float* %C, i64 %498
  %499 = add i64 %495, %116
  %scevgep1777.us.us.us = getelementptr float, float* %C, i64 %499
  %500 = add i64 %495, %118
  %scevgep1798.us.us.us = getelementptr float, float* %C, i64 %500
  %501 = add i64 %495, %119
  %scevgep1819.us.us.us = getelementptr float, float* %C, i64 %501
  %502 = add i64 %495, %120
  %scevgep1840.us.us.us = getelementptr float, float* %C, i64 %502
  %503 = add i64 %495, %66
  %scevgep1861.us.us.us = getelementptr float, float* %C, i64 %503
  %504 = or i64 %494, 1
  %505 = mul i64 %504, %ldc
  %506 = add i64 %505, %102
  %scevgep1882.us.us.us = getelementptr float, float* %C, i64 %506
  %507 = add i64 %117, %505
  %scevgep1903.us.us.us = getelementptr float, float* %C, i64 %507
  %508 = add i64 %505, %116
  %scevgep1924.us.us.us = getelementptr float, float* %C, i64 %508
  %509 = add i64 %505, %118
  %scevgep1945.us.us.us = getelementptr float, float* %C, i64 %509
  %510 = add i64 %505, %119
  %scevgep1966.us.us.us = getelementptr float, float* %C, i64 %510
  %511 = add i64 %505, %120
  %scevgep1987.us.us.us = getelementptr float, float* %C, i64 %511
  %512 = add i64 %505, %66
  %scevgep2008.us.us.us = getelementptr float, float* %C, i64 %512
  %513 = or i64 %494, 3
  %.not3579.us.us.us = icmp sgt i64 %513, %M
  %514 = mul i64 %497, %ldc
  %515 = add i64 %514, %102
  %scevgep2029.us.us.us = getelementptr float, float* %C, i64 %515
  %516 = add i64 %117, %514
  %scevgep2050.us.us.us = getelementptr float, float* %C, i64 %516
  %517 = add i64 %514, %116
  %scevgep2071.us.us.us = getelementptr float, float* %C, i64 %517
  %518 = add i64 %514, %118
  %scevgep2092.us.us.us = getelementptr float, float* %C, i64 %518
  %519 = add i64 %514, %119
  %scevgep2113.us.us.us = getelementptr float, float* %C, i64 %519
  %520 = add i64 %514, %120
  %scevgep2134.us.us.us = getelementptr float, float* %C, i64 %520
  %521 = add i64 %514, %66
  %scevgep2155.us.us.us = getelementptr float, float* %C, i64 %521
  %522 = add nuw nsw i64 %494, 4
  %.not3580.us.us.us = icmp sgt i64 %522, %M
  %523 = mul i64 %513, %ldc
  %524 = add i64 %523, %102
  %scevgep2176.us.us.us = getelementptr float, float* %C, i64 %524
  %525 = add i64 %117, %523
  %scevgep2197.us.us.us = getelementptr float, float* %C, i64 %525
  %526 = add i64 %523, %116
  %scevgep2218.us.us.us = getelementptr float, float* %C, i64 %526
  %527 = add i64 %523, %118
  %scevgep2239.us.us.us = getelementptr float, float* %C, i64 %527
  %528 = add i64 %523, %119
  %scevgep2260.us.us.us = getelementptr float, float* %C, i64 %528
  %529 = add i64 %523, %120
  %scevgep2281.us.us.us = getelementptr float, float* %C, i64 %529
  %530 = add i64 %523, %66
  %scevgep2302.us.us.us = getelementptr float, float* %C, i64 %530
  br label %polly.cond1738.us.us.us

polly.cond1738.us.us.us:                          ; preds = %polly.merge1865.us.us.us, %polly.loop_if1713.us.us.us
  %polly.indvar1718.us.us.us = phi i64 [ %polly.indvar_next1719.us.us.us, %polly.merge1865.us.us.us ], [ 0, %polly.loop_if1713.us.us.us ]
  %polly.access.add.Packed_A1724.us.us.us = add nuw nsw i64 %polly.indvar1718.us.us.us, %polly.access.mul.Packed_A1723.us.us.us
  %polly.access.mul.Packed_A1725.us.us.us = shl nsw i64 %polly.access.add.Packed_A1724.us.us.us, 2
  %polly.access.Packed_A1727.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1725.us.us.us
  %_p_scalar_1728.us.us.us = load float, float* %polly.access.Packed_A1727.us.us.us, align 16, !alias.scope !52, !noalias !53
  %polly.access.mul.Packed_B1731.us.us.us = shl nsw i64 %polly.indvar1718.us.us.us, 3
  %polly.access.Packed_B1733.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1731.us.us.us
  %_p_scalar_1734.us.us.us = load float, float* %polly.access.Packed_B1733.us.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_1736.us.us.us = load float, float* %scevgep1735.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1737.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1734.us.us.us, float %_p_scalar_1736.us.us.us)
  store float %p_1737.us.us.us, float* %scevgep1735.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3577.us, label %polly.cond1864.us.us.us.thread, label %polly.cond1759.us.us.us

polly.cond1759.us.us.us:                          ; preds = %polly.cond1738.us.us.us
  %polly.access.add.Packed_B1753.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 1
  %polly.access.Packed_B1754.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1753.us.us.us
  %_p_scalar_1755.us.us.us = load float, float* %polly.access.Packed_B1754.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1757.us.us.us = load float, float* %scevgep1756.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1758.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1755.us.us.us, float %_p_scalar_1757.us.us.us)
  store float %p_1758.us.us.us, float* %scevgep1756.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3593.us, label %polly.cond1864.us.us.us, label %polly.cond1780.us.us.us

polly.cond1780.us.us.us:                          ; preds = %polly.cond1759.us.us.us
  %polly.access.add.Packed_B1774.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 2
  %polly.access.Packed_B1775.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1774.us.us.us
  %_p_scalar_1776.us.us.us = load float, float* %polly.access.Packed_B1775.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1778.us.us.us = load float, float* %scevgep1777.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1779.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1776.us.us.us, float %_p_scalar_1778.us.us.us)
  store float %p_1779.us.us.us, float* %scevgep1777.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3594.us, label %polly.cond1864.us.us.us, label %polly.cond1801.us.us.us

polly.cond1801.us.us.us:                          ; preds = %polly.cond1780.us.us.us
  %polly.access.add.Packed_B1795.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 3
  %polly.access.Packed_B1796.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1795.us.us.us
  %_p_scalar_1797.us.us.us = load float, float* %polly.access.Packed_B1796.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1799.us.us.us = load float, float* %scevgep1798.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1800.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1797.us.us.us, float %_p_scalar_1799.us.us.us)
  store float %p_1800.us.us.us, float* %scevgep1798.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3595.us, label %polly.cond1864.us.us.us, label %polly.cond1822.us.us.us

polly.cond1822.us.us.us:                          ; preds = %polly.cond1801.us.us.us
  %polly.access.add.Packed_B1816.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 4
  %polly.access.Packed_B1817.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1816.us.us.us
  %_p_scalar_1818.us.us.us = load float, float* %polly.access.Packed_B1817.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_1820.us.us.us = load float, float* %scevgep1819.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1821.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1818.us.us.us, float %_p_scalar_1820.us.us.us)
  store float %p_1821.us.us.us, float* %scevgep1819.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3596.us, label %polly.cond1864.us.us.us, label %polly.cond1843.us.us.us

polly.cond1843.us.us.us:                          ; preds = %polly.cond1822.us.us.us
  %polly.access.add.Packed_B1837.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 5
  %polly.access.Packed_B1838.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1837.us.us.us
  %_p_scalar_1839.us.us.us = load float, float* %polly.access.Packed_B1838.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1841.us.us.us = load float, float* %scevgep1840.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1842.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1839.us.us.us, float %_p_scalar_1841.us.us.us)
  store float %p_1842.us.us.us, float* %scevgep1840.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %122, label %polly.stmt.for.body8.us.us.us1847.us.us.us, label %polly.cond1864.us.us.us

polly.stmt.for.body8.us.us.us1847.us.us.us:       ; preds = %polly.cond1843.us.us.us
  %polly.access.add.Packed_B1858.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 6
  %polly.access.Packed_B1859.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1858.us.us.us
  %_p_scalar_1860.us.us.us = load float, float* %polly.access.Packed_B1859.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1862.us.us.us = load float, float* %scevgep1861.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1863.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1728.us.us.us, float %_p_scalar_1860.us.us.us, float %_p_scalar_1862.us.us.us)
  store float %p_1863.us.us.us, float* %scevgep1861.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond1864.us.us.us

polly.cond1864.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us1847.us.us.us, %polly.cond1843.us.us.us, %polly.cond1822.us.us.us, %polly.cond1801.us.us.us, %polly.cond1780.us.us.us, %polly.cond1759.us.us.us
  br i1 %.not3578.us.us.us, label %polly.merge1865.us.us.us, label %polly.cond1885.us.us.us

polly.cond1864.us.us.us.thread:                   ; preds = %polly.cond1738.us.us.us
  br i1 %.not3578.us.us.us, label %polly.merge1865.us.us.us, label %polly.cond1885.us.us.us.thread

polly.cond1885.us.us.us.thread:                   ; preds = %polly.cond1864.us.us.us.thread
  %polly.access.add.Packed_A1873.us.us.us3771 = or i64 %polly.access.mul.Packed_A1725.us.us.us, 1
  %polly.access.Packed_A1874.us.us.us3772 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1873.us.us.us3771
  %_p_scalar_1875.us.us.us3773 = load float, float* %polly.access.Packed_A1874.us.us.us3772, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_1883.us.us.us3774 = load float, float* %scevgep1882.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1884.us.us.us3775 = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us3773, float %_p_scalar_1734.us.us.us, float %_p_scalar_1883.us.us.us3774)
  store float %p_1884.us.us.us3775, float* %scevgep1882.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond2011.us.us.us

polly.cond1885.us.us.us:                          ; preds = %polly.cond1864.us.us.us
  %polly.access.add.Packed_A1873.us.us.us = or i64 %polly.access.mul.Packed_A1725.us.us.us, 1
  %polly.access.Packed_A1874.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1873.us.us.us
  %_p_scalar_1875.us.us.us = load float, float* %polly.access.Packed_A1874.us.us.us, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_1883.us.us.us = load float, float* %scevgep1882.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1884.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1734.us.us.us, float %_p_scalar_1883.us.us.us)
  store float %p_1884.us.us.us, float* %scevgep1882.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3577.us, label %polly.cond2011.us.us.us, label %polly.cond1906.us.us.us

polly.cond1906.us.us.us:                          ; preds = %polly.cond1885.us.us.us
  %polly.access.add.Packed_B1900.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 1
  %polly.access.Packed_B1901.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1900.us.us.us
  %_p_scalar_1902.us.us.us = load float, float* %polly.access.Packed_B1901.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1904.us.us.us = load float, float* %scevgep1903.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1905.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1902.us.us.us, float %_p_scalar_1904.us.us.us)
  store float %p_1905.us.us.us, float* %scevgep1903.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3593.us, label %polly.cond2011.us.us.us, label %polly.cond1927.us.us.us

polly.cond1927.us.us.us:                          ; preds = %polly.cond1906.us.us.us
  %polly.access.add.Packed_B1921.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 2
  %polly.access.Packed_B1922.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1921.us.us.us
  %_p_scalar_1923.us.us.us = load float, float* %polly.access.Packed_B1922.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1925.us.us.us = load float, float* %scevgep1924.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1926.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1923.us.us.us, float %_p_scalar_1925.us.us.us)
  store float %p_1926.us.us.us, float* %scevgep1924.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3594.us, label %polly.cond2011.us.us.us, label %polly.cond1948.us.us.us

polly.cond1948.us.us.us:                          ; preds = %polly.cond1927.us.us.us
  %polly.access.add.Packed_B1942.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 3
  %polly.access.Packed_B1943.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1942.us.us.us
  %_p_scalar_1944.us.us.us = load float, float* %polly.access.Packed_B1943.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1946.us.us.us = load float, float* %scevgep1945.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1947.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1944.us.us.us, float %_p_scalar_1946.us.us.us)
  store float %p_1947.us.us.us, float* %scevgep1945.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3595.us, label %polly.cond2011.us.us.us, label %polly.cond1969.us.us.us

polly.cond1969.us.us.us:                          ; preds = %polly.cond1948.us.us.us
  %polly.access.add.Packed_B1963.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 4
  %polly.access.Packed_B1964.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1963.us.us.us
  %_p_scalar_1965.us.us.us = load float, float* %polly.access.Packed_B1964.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_1967.us.us.us = load float, float* %scevgep1966.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1968.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1965.us.us.us, float %_p_scalar_1967.us.us.us)
  store float %p_1968.us.us.us, float* %scevgep1966.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3596.us, label %polly.cond2011.us.us.us, label %polly.cond1990.us.us.us

polly.cond1990.us.us.us:                          ; preds = %polly.cond1969.us.us.us
  %polly.access.add.Packed_B1984.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 5
  %polly.access.Packed_B1985.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1984.us.us.us
  %_p_scalar_1986.us.us.us = load float, float* %polly.access.Packed_B1985.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1988.us.us.us = load float, float* %scevgep1987.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_1989.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_1986.us.us.us, float %_p_scalar_1988.us.us.us)
  store float %p_1989.us.us.us, float* %scevgep1987.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %122, label %polly.stmt.for.body8.us.us.us1994.us.us.us, label %polly.cond2011.us.us.us

polly.stmt.for.body8.us.us.us1994.us.us.us:       ; preds = %polly.cond1990.us.us.us
  %polly.access.add.Packed_B2005.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 6
  %polly.access.Packed_B2006.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2005.us.us.us
  %_p_scalar_2007.us.us.us = load float, float* %polly.access.Packed_B2006.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2009.us.us.us = load float, float* %scevgep2008.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2010.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1875.us.us.us, float %_p_scalar_2007.us.us.us, float %_p_scalar_2009.us.us.us)
  store float %p_2010.us.us.us, float* %scevgep2008.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond2011.us.us.us

polly.cond2011.us.us.us:                          ; preds = %polly.cond1885.us.us.us.thread, %polly.stmt.for.body8.us.us.us1994.us.us.us, %polly.cond1990.us.us.us, %polly.cond1969.us.us.us, %polly.cond1948.us.us.us, %polly.cond1927.us.us.us, %polly.cond1906.us.us.us, %polly.cond1885.us.us.us
  br i1 %.not3579.us.us.us, label %polly.merge1865.us.us.us, label %polly.cond2032.us.us.us

polly.cond2032.us.us.us:                          ; preds = %polly.cond2011.us.us.us
  %polly.access.add.Packed_A2020.us.us.us = or i64 %polly.access.mul.Packed_A1725.us.us.us, 2
  %polly.access.Packed_A2021.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2020.us.us.us
  %_p_scalar_2022.us.us.us = load float, float* %polly.access.Packed_A2021.us.us.us, align 8, !alias.scope !52, !noalias !53
  %_p_scalar_2030.us.us.us = load float, float* %scevgep2029.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2031.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_1734.us.us.us, float %_p_scalar_2030.us.us.us)
  store float %p_2031.us.us.us, float* %scevgep2029.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3577.us, label %polly.cond2158.us.us.us.thread, label %polly.cond2053.us.us.us

polly.cond2053.us.us.us:                          ; preds = %polly.cond2032.us.us.us
  %polly.access.add.Packed_B2047.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 1
  %polly.access.Packed_B2048.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2047.us.us.us
  %_p_scalar_2049.us.us.us = load float, float* %polly.access.Packed_B2048.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2051.us.us.us = load float, float* %scevgep2050.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2052.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2049.us.us.us, float %_p_scalar_2051.us.us.us)
  store float %p_2052.us.us.us, float* %scevgep2050.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3593.us, label %polly.cond2158.us.us.us, label %polly.cond2074.us.us.us

polly.cond2074.us.us.us:                          ; preds = %polly.cond2053.us.us.us
  %polly.access.add.Packed_B2068.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 2
  %polly.access.Packed_B2069.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2068.us.us.us
  %_p_scalar_2070.us.us.us = load float, float* %polly.access.Packed_B2069.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2072.us.us.us = load float, float* %scevgep2071.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2073.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2070.us.us.us, float %_p_scalar_2072.us.us.us)
  store float %p_2073.us.us.us, float* %scevgep2071.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3594.us, label %polly.cond2158.us.us.us, label %polly.cond2095.us.us.us

polly.cond2095.us.us.us:                          ; preds = %polly.cond2074.us.us.us
  %polly.access.add.Packed_B2089.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 3
  %polly.access.Packed_B2090.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2089.us.us.us
  %_p_scalar_2091.us.us.us = load float, float* %polly.access.Packed_B2090.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2093.us.us.us = load float, float* %scevgep2092.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2094.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2091.us.us.us, float %_p_scalar_2093.us.us.us)
  store float %p_2094.us.us.us, float* %scevgep2092.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3595.us, label %polly.cond2158.us.us.us, label %polly.cond2116.us.us.us

polly.cond2116.us.us.us:                          ; preds = %polly.cond2095.us.us.us
  %polly.access.add.Packed_B2110.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 4
  %polly.access.Packed_B2111.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2110.us.us.us
  %_p_scalar_2112.us.us.us = load float, float* %polly.access.Packed_B2111.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2114.us.us.us = load float, float* %scevgep2113.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2115.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2112.us.us.us, float %_p_scalar_2114.us.us.us)
  store float %p_2115.us.us.us, float* %scevgep2113.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3596.us, label %polly.cond2158.us.us.us, label %polly.cond2137.us.us.us

polly.cond2137.us.us.us:                          ; preds = %polly.cond2116.us.us.us
  %polly.access.add.Packed_B2131.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 5
  %polly.access.Packed_B2132.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2131.us.us.us
  %_p_scalar_2133.us.us.us = load float, float* %polly.access.Packed_B2132.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2135.us.us.us = load float, float* %scevgep2134.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2136.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2133.us.us.us, float %_p_scalar_2135.us.us.us)
  store float %p_2136.us.us.us, float* %scevgep2134.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %122, label %polly.stmt.for.body8.us.us.us2141.us.us.us, label %polly.cond2158.us.us.us

polly.stmt.for.body8.us.us.us2141.us.us.us:       ; preds = %polly.cond2137.us.us.us
  %polly.access.add.Packed_B2152.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 6
  %polly.access.Packed_B2153.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2152.us.us.us
  %_p_scalar_2154.us.us.us = load float, float* %polly.access.Packed_B2153.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2156.us.us.us = load float, float* %scevgep2155.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2157.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2022.us.us.us, float %_p_scalar_2154.us.us.us, float %_p_scalar_2156.us.us.us)
  store float %p_2157.us.us.us, float* %scevgep2155.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.cond2158.us.us.us

polly.cond2158.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us2141.us.us.us, %polly.cond2137.us.us.us, %polly.cond2116.us.us.us, %polly.cond2095.us.us.us, %polly.cond2074.us.us.us, %polly.cond2053.us.us.us
  br i1 %.not3580.us.us.us, label %polly.merge1865.us.us.us, label %polly.cond2179.us.us.us

polly.cond2158.us.us.us.thread:                   ; preds = %polly.cond2032.us.us.us
  br i1 %.not3580.us.us.us, label %polly.merge1865.us.us.us, label %polly.cond2179.us.us.us.thread

polly.cond2179.us.us.us.thread:                   ; preds = %polly.cond2158.us.us.us.thread
  %polly.access.add.Packed_A2167.us.us.us3776 = or i64 %polly.access.mul.Packed_A1725.us.us.us, 3
  %polly.access.Packed_A2168.us.us.us3777 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2167.us.us.us3776
  %_p_scalar_2169.us.us.us3778 = load float, float* %polly.access.Packed_A2168.us.us.us3777, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_2177.us.us.us3779 = load float, float* %scevgep2176.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2178.us.us.us3780 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us3778, float %_p_scalar_1734.us.us.us, float %_p_scalar_2177.us.us.us3779)
  store float %p_2178.us.us.us3780, float* %scevgep2176.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge1865.us.us.us

polly.cond2179.us.us.us:                          ; preds = %polly.cond2158.us.us.us
  %polly.access.add.Packed_A2167.us.us.us = or i64 %polly.access.mul.Packed_A1725.us.us.us, 3
  %polly.access.Packed_A2168.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2167.us.us.us
  %_p_scalar_2169.us.us.us = load float, float* %polly.access.Packed_A2168.us.us.us, align 4, !alias.scope !52, !noalias !53
  %_p_scalar_2177.us.us.us = load float, float* %scevgep2176.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2178.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_1734.us.us.us, float %_p_scalar_2177.us.us.us)
  store float %p_2178.us.us.us, float* %scevgep2176.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3577.us, label %polly.merge1865.us.us.us, label %polly.cond2200.us.us.us

polly.cond2200.us.us.us:                          ; preds = %polly.cond2179.us.us.us
  %polly.access.add.Packed_B2194.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 1
  %polly.access.Packed_B2195.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2194.us.us.us
  %_p_scalar_2196.us.us.us = load float, float* %polly.access.Packed_B2195.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2198.us.us.us = load float, float* %scevgep2197.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2199.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2196.us.us.us, float %_p_scalar_2198.us.us.us)
  store float %p_2199.us.us.us, float* %scevgep2197.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3593.us, label %polly.merge1865.us.us.us, label %polly.cond2221.us.us.us

polly.cond2221.us.us.us:                          ; preds = %polly.cond2200.us.us.us
  %polly.access.add.Packed_B2215.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 2
  %polly.access.Packed_B2216.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2215.us.us.us
  %_p_scalar_2217.us.us.us = load float, float* %polly.access.Packed_B2216.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2219.us.us.us = load float, float* %scevgep2218.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2220.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2217.us.us.us, float %_p_scalar_2219.us.us.us)
  store float %p_2220.us.us.us, float* %scevgep2218.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3594.us, label %polly.merge1865.us.us.us, label %polly.cond2242.us.us.us

polly.cond2242.us.us.us:                          ; preds = %polly.cond2221.us.us.us
  %polly.access.add.Packed_B2236.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 3
  %polly.access.Packed_B2237.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2236.us.us.us
  %_p_scalar_2238.us.us.us = load float, float* %polly.access.Packed_B2237.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2240.us.us.us = load float, float* %scevgep2239.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2241.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2238.us.us.us, float %_p_scalar_2240.us.us.us)
  store float %p_2241.us.us.us, float* %scevgep2239.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3595.us, label %polly.merge1865.us.us.us, label %polly.cond2263.us.us.us

polly.cond2263.us.us.us:                          ; preds = %polly.cond2242.us.us.us
  %polly.access.add.Packed_B2257.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 4
  %polly.access.Packed_B2258.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2257.us.us.us
  %_p_scalar_2259.us.us.us = load float, float* %polly.access.Packed_B2258.us.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2261.us.us.us = load float, float* %scevgep2260.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2262.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2259.us.us.us, float %_p_scalar_2261.us.us.us)
  store float %p_2262.us.us.us, float* %scevgep2260.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %.not3596.us, label %polly.merge1865.us.us.us, label %polly.cond2284.us.us.us

polly.cond2284.us.us.us:                          ; preds = %polly.cond2263.us.us.us
  %polly.access.add.Packed_B2278.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 5
  %polly.access.Packed_B2279.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2278.us.us.us
  %_p_scalar_2280.us.us.us = load float, float* %polly.access.Packed_B2279.us.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2282.us.us.us = load float, float* %scevgep2281.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2283.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2280.us.us.us, float %_p_scalar_2282.us.us.us)
  store float %p_2283.us.us.us, float* %scevgep2281.us.us.us, align 4, !alias.scope !56, !noalias !57
  br i1 %122, label %polly.stmt.for.body8.us.us.us2288.us.us.us, label %polly.merge1865.us.us.us

polly.stmt.for.body8.us.us.us2288.us.us.us:       ; preds = %polly.cond2284.us.us.us
  %polly.access.add.Packed_B2299.us.us.us = or i64 %polly.access.mul.Packed_B1731.us.us.us, 6
  %polly.access.Packed_B2300.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2299.us.us.us
  %_p_scalar_2301.us.us.us = load float, float* %polly.access.Packed_B2300.us.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2303.us.us.us = load float, float* %scevgep2302.us.us.us, align 4, !alias.scope !56, !noalias !57
  %p_2304.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2169.us.us.us, float %_p_scalar_2301.us.us.us, float %_p_scalar_2303.us.us.us)
  store float %p_2304.us.us.us, float* %scevgep2302.us.us.us, align 4, !alias.scope !56, !noalias !57
  br label %polly.merge1865.us.us.us

polly.merge1865.us.us.us:                         ; preds = %polly.cond2179.us.us.us.thread, %polly.cond2158.us.us.us.thread, %polly.cond1864.us.us.us.thread, %polly.stmt.for.body8.us.us.us2288.us.us.us, %polly.cond2284.us.us.us, %polly.cond2263.us.us.us, %polly.cond2242.us.us.us, %polly.cond2221.us.us.us, %polly.cond2200.us.us.us, %polly.cond2179.us.us.us, %polly.cond2158.us.us.us, %polly.cond2011.us.us.us, %polly.cond1864.us.us.us
  %polly.indvar_next1719.us.us.us = add nuw nsw i64 %polly.indvar1718.us.us.us, 1
  %exitcond3747.not = icmp eq i64 %polly.indvar1718.us.us.us, %smin3746
  br i1 %exitcond3747.not, label %polly.loop_exit1716.loopexit.us.us.us, label %polly.cond1738.us.us.us, !llvm.loop !64

polly.loop_exit1716.loopexit.us.us.us:            ; preds = %polly.merge1865.us.us.us
  %polly.indvar_next1711.us.us.us = add nuw nsw i64 %polly.indvar1710.us.us.us, 1
  %exitcond3749.not = icmp eq i64 %polly.indvar1710.us.us.us, %smin3748
  br i1 %exitcond3749.not, label %polly.merge1696.us.us, label %polly.loop_if1713.us.us.us
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry.split:
  %Packed_B = alloca [256 x [512 x [8 x float]]], align 64
  %Packed_A = alloca [24 x [512 x [4 x float]]], align 64
  %cmp.not = icmp eq i32 %argc, 4
  br i1 %cmp.not, label %if.else, label %if.then

if.then:                                          ; preds = %entry.split
  %call = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0))
  tail call void @exit(i32 noundef 1) #16
  unreachable

if.else:                                          ; preds = %entry.split
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8, !tbaa !65
  %call1 = tail call i64 @strtol(i8* nocapture noundef %0, i8** noundef null, i32 noundef 10) #17
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2
  %1 = load i8*, i8** %arrayidx2, align 8, !tbaa !65
  %call3 = tail call i64 @strtol(i8* nocapture noundef %1, i8** noundef null, i32 noundef 10) #17
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 3
  %2 = load i8*, i8** %arrayidx4, align 8, !tbaa !65
  %call5 = tail call i64 @strtol(i8* nocapture noundef %2, i8** noundef null, i32 noundef 10) #17
  %mul = mul i64 %call5, %call1
  %cmp.i.i = icmp ugt i64 %mul, 2305843009213693951
  br i1 %cmp.i.i, label %if.then.i.i, label %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i

if.then.i.i:                                      ; preds = %if.else
  tail call void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.4, i64 0, i64 0)) #18
  unreachable

_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i: ; preds = %if.else
  %cmp.not.i.i.i.i = icmp eq i64 %mul, 0
  br i1 %cmp.not.i.i.i.i, label %invoke.cont, label %for.body.i.i.preheader.i.i.i.i.i

for.body.i.i.preheader.i.i.i.i.i:                 ; preds = %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i
  %mul.i.i.i.i.i.i = shl nuw nsw i64 %mul, 2
  %call2.i.i.i.i3.i.i96 = tail call noalias noundef nonnull i8* @_Znwm(i64 noundef %mul.i.i.i.i.i.i) #19
  %3 = bitcast i8* %call2.i.i.i.i3.i.i96 to float*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %call2.i.i.i.i3.i.i96, i8 0, i64 %mul.i.i.i.i.i.i, i1 false), !tbaa !8
  br label %invoke.cont

invoke.cont:                                      ; preds = %for.body.i.i.preheader.i.i.i.i.i, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i
  %A.sroa.0.0 = phi float* [ %3, %for.body.i.i.preheader.i.i.i.i.i ], [ null, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i ]
  %mul6 = mul i64 %call5, %call3
  %cmp.i.i97 = icmp ugt i64 %mul6, 2305843009213693951
  br i1 %cmp.i.i97, label %if.then.i.i98, label %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i100

if.then.i.i98:                                    ; preds = %invoke.cont
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.4, i64 0, i64 0)) #18
          to label %.noexc107 unwind label %lpad8

.noexc107:                                        ; preds = %if.then.i.i98
  unreachable

_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i100: ; preds = %invoke.cont
  %cmp.not.i.i.i.i99 = icmp eq i64 %mul6, 0
  br i1 %cmp.not.i.i.i.i99, label %invoke.cont9, label %for.body.i.i.preheader.i.i.i.i.i104

for.body.i.i.preheader.i.i.i.i.i104:              ; preds = %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i100
  %mul.i.i.i.i.i.i102 = shl nuw nsw i64 %mul6, 2
  %call2.i.i.i.i3.i.i109 = invoke noalias noundef nonnull i8* @_Znwm(i64 noundef %mul.i.i.i.i.i.i102) #19
          to label %call2.i.i.i.i3.i.i.noexc108 unwind label %lpad8

call2.i.i.i.i3.i.i.noexc108:                      ; preds = %for.body.i.i.preheader.i.i.i.i.i104
  %4 = bitcast i8* %call2.i.i.i.i3.i.i109 to float*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %call2.i.i.i.i3.i.i109, i8 0, i64 %mul.i.i.i.i.i.i102, i1 false), !tbaa !8
  br label %invoke.cont9

invoke.cont9:                                     ; preds = %call2.i.i.i.i3.i.i.noexc108, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i100
  %B.sroa.0.0 = phi float* [ %4, %call2.i.i.i.i3.i.i.noexc108 ], [ null, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i100 ]
  %mul10 = mul i64 %call3, %call1
  %cmp.i.i111 = icmp ugt i64 %mul10, 2305843009213693951
  br i1 %cmp.i.i111, label %if.then.i.i112, label %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i114

if.then.i.i112:                                   ; preds = %invoke.cont9
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.4, i64 0, i64 0)) #18
          to label %.noexc121 unwind label %lpad12

.noexc121:                                        ; preds = %if.then.i.i112
  unreachable

_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i114: ; preds = %invoke.cont9
  %cmp.not.i.i.i.i113 = icmp eq i64 %mul10, 0
  br i1 %cmp.not.i.i.i.i113, label %invoke.cont13, label %for.body.i.i.preheader.i.i.i.i.i118

for.body.i.i.preheader.i.i.i.i.i118:              ; preds = %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i114
  %mul.i.i.i.i.i.i116 = shl nuw nsw i64 %mul10, 2
  %call2.i.i.i.i3.i.i123 = invoke noalias noundef nonnull i8* @_Znwm(i64 noundef %mul.i.i.i.i.i.i116) #19
          to label %call2.i.i.i.i3.i.i.noexc122 unwind label %lpad12

call2.i.i.i.i3.i.i.noexc122:                      ; preds = %for.body.i.i.preheader.i.i.i.i.i118
  %5 = bitcast i8* %call2.i.i.i.i3.i.i123 to float*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %call2.i.i.i.i3.i.i123, i8 0, i64 %mul.i.i.i.i.i.i116, i1 false), !tbaa !8
  br label %invoke.cont13

invoke.cont13:                                    ; preds = %call2.i.i.i.i3.i.i.noexc122, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i114
  %C.sroa.0.0 = phi float* [ %5, %call2.i.i.i.i3.i.i.noexc122 ], [ null, %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i114 ]
  %cmp94.not.i = icmp eq i64 %call1, 0
  br i1 %cmp94.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.lr.ph.i

for.cond1.preheader.lr.ph.i:                      ; preds = %invoke.cont13
  %cmp292.not.i = icmp eq i64 %call5, 0
  %conv6.i = uitofp i64 %call1 to float
  br i1 %cmp292.not.i, label %for.cond41.preheader.lr.ph.i, label %for.cond1.preheader.us.i.preheader

for.cond1.preheader.us.i.preheader:               ; preds = %for.cond1.preheader.lr.ph.i
  %min.iters.check = icmp ult i64 %call5, 8
  %n.vec = and i64 %call5, -8
  %broadcast.splatinsert3932 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat3933 = shufflevector <4 x float> %broadcast.splatinsert3932, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3934 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat3935 = shufflevector <4 x float> %broadcast.splatinsert3934, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %call5, %n.vec
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.preheader.us.i.preheader, %for.cond1.for.cond.cleanup3_crit_edge.us.i
  %i.095.us.i = phi i64 [ %inc9.us.i, %for.cond1.for.cond.cleanup3_crit_edge.us.i ], [ 0, %for.cond1.preheader.us.i.preheader ]
  %conv.us.i = uitofp i64 %i.095.us.i to float
  %mul7.us.i = mul i64 %i.095.us.i, %call5
  br i1 %min.iters.check, label %for.body4.us.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3930 = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat3931 = shufflevector <4 x float> %broadcast.splatinsert3930, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %6 = uitofp <4 x i64> %vec.ind to <4 x float>
  %7 = uitofp <4 x i64> %step.add to <4 x float>
  %8 = fmul <4 x float> %broadcast.splat, %6
  %9 = fmul <4 x float> %broadcast.splat3931, %7
  %10 = fdiv <4 x float> %8, %broadcast.splat3933
  %11 = fdiv <4 x float> %9, %broadcast.splat3935
  %12 = add i64 %index, %mul7.us.i
  %13 = getelementptr inbounds float, float* %A.sroa.0.0, i64 %12
  %14 = bitcast float* %13 to <4 x float>*
  store <4 x float> %10, <4 x float>* %14, align 4, !tbaa !8
  %15 = getelementptr inbounds float, float* %13, i64 4
  %16 = bitcast float* %15 to <4 x float>*
  store <4 x float> %11, <4 x float>* %16, align 4, !tbaa !8
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !67

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.cond.cleanup3_crit_edge.us.i, label %for.body4.us.i.preheader

for.body4.us.i.preheader:                         ; preds = %for.cond1.preheader.us.i, %middle.block
  %j.093.us.i.ph = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %n.vec, %middle.block ]
  br label %for.body4.us.i

for.body4.us.i:                                   ; preds = %for.body4.us.i.preheader, %for.body4.us.i
  %j.093.us.i = phi i64 [ %inc.us.i, %for.body4.us.i ], [ %j.093.us.i.ph, %for.body4.us.i.preheader ]
  %conv5.us.i = uitofp i64 %j.093.us.i to float
  %mul.us.i = fmul float %conv.us.i, %conv5.us.i
  %div.us.i = fdiv float %mul.us.i, %conv6.i
  %add.us.i = add i64 %j.093.us.i, %mul7.us.i
  %arrayidx.us.i = getelementptr inbounds float, float* %A.sroa.0.0, i64 %add.us.i
  store float %div.us.i, float* %arrayidx.us.i, align 4, !tbaa !8
  %inc.us.i = add nuw i64 %j.093.us.i, 1
  %exitcond.not.i = icmp eq i64 %inc.us.i, %call5
  br i1 %exitcond.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.us.i, label %for.body4.us.i, !llvm.loop !68

for.cond1.for.cond.cleanup3_crit_edge.us.i:       ; preds = %for.body4.us.i, %middle.block
  %inc9.us.i = add nuw i64 %i.095.us.i, 1
  %exitcond107.not.i = icmp eq i64 %inc9.us.i, %call1
  br i1 %exitcond107.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.us.i, !llvm.loop !17

for.cond12.preheader.i:                           ; preds = %for.cond1.for.cond.cleanup3_crit_edge.us.i, %invoke.cont13
  %cmp1398.not.i = icmp eq i64 %call5, 0
  br i1 %cmp1398.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.lr.ph.i

for.cond17.preheader.lr.ph.i:                     ; preds = %for.cond12.preheader.i
  %cmp1896.not.i = icmp eq i64 %call3, 0
  %conv24.i = uitofp i64 %call3 to float
  br i1 %cmp1896.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.us.i.preheader

for.cond17.preheader.us.i.preheader:              ; preds = %for.cond17.preheader.lr.ph.i
  %min.iters.check3938 = icmp ult i64 %call3, 8
  %n.vec3941 = and i64 %call3, -8
  %broadcast.splatinsert3954 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat3955 = shufflevector <4 x float> %broadcast.splatinsert3954, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3956 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat3957 = shufflevector <4 x float> %broadcast.splatinsert3956, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n3943 = icmp eq i64 %call3, %n.vec3941
  br label %for.cond17.preheader.us.i

for.cond17.preheader.us.i:                        ; preds = %for.cond17.preheader.us.i.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i
  %i11.099.us.i = phi i64 [ %inc33.us.i, %for.cond17.for.cond.cleanup19_crit_edge.us.i ], [ 0, %for.cond17.preheader.us.i.preheader ]
  %conv21.us.i = uitofp i64 %i11.099.us.i to float
  %mul26.us.i = mul i64 %i11.099.us.i, %call3
  br i1 %min.iters.check3938, label %for.body20.us.i.preheader, label %vector.ph3939

vector.ph3939:                                    ; preds = %for.cond17.preheader.us.i
  %broadcast.splatinsert3950 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat3951 = shufflevector <4 x float> %broadcast.splatinsert3950, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3952 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat3953 = shufflevector <4 x float> %broadcast.splatinsert3952, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body3944

vector.body3944:                                  ; preds = %vector.body3944, %vector.ph3939
  %index3945 = phi i64 [ 0, %vector.ph3939 ], [ %index.next3958, %vector.body3944 ]
  %vec.ind3946 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph3939 ], [ %vec.ind.next3949, %vector.body3944 ]
  %step.add3947 = add <4 x i64> %vec.ind3946, <i64 4, i64 4, i64 4, i64 4>
  %18 = uitofp <4 x i64> %vec.ind3946 to <4 x float>
  %19 = uitofp <4 x i64> %step.add3947 to <4 x float>
  %20 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3951, <4 x float> %18, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3953, <4 x float> %19, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %22 = fdiv <4 x float> %20, %broadcast.splat3955
  %23 = fdiv <4 x float> %21, %broadcast.splat3957
  %24 = add i64 %index3945, %mul26.us.i
  %25 = getelementptr inbounds float, float* %B.sroa.0.0, i64 %24
  %26 = bitcast float* %25 to <4 x float>*
  store <4 x float> %22, <4 x float>* %26, align 4, !tbaa !8
  %27 = getelementptr inbounds float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  store <4 x float> %23, <4 x float>* %28, align 4, !tbaa !8
  %index.next3958 = add nuw i64 %index3945, 8
  %vec.ind.next3949 = add <4 x i64> %vec.ind3946, <i64 8, i64 8, i64 8, i64 8>
  %29 = icmp eq i64 %index.next3958, %n.vec3941
  br i1 %29, label %middle.block3936, label %vector.body3944, !llvm.loop !69

middle.block3936:                                 ; preds = %vector.body3944
  br i1 %cmp.n3943, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i.preheader

for.body20.us.i.preheader:                        ; preds = %for.cond17.preheader.us.i, %middle.block3936
  %j16.097.us.i.ph = phi i64 [ 0, %for.cond17.preheader.us.i ], [ %n.vec3941, %middle.block3936 ]
  br label %for.body20.us.i

for.body20.us.i:                                  ; preds = %for.body20.us.i.preheader, %for.body20.us.i
  %j16.097.us.i = phi i64 [ %inc30.us.i, %for.body20.us.i ], [ %j16.097.us.i.ph, %for.body20.us.i.preheader ]
  %conv22.us.i = uitofp i64 %j16.097.us.i to float
  %30 = tail call float @llvm.fmuladd.f32(float %conv21.us.i, float %conv22.us.i, float 1.000000e+00) #17
  %div25.us.i = fdiv float %30, %conv24.i
  %add27.us.i = add i64 %j16.097.us.i, %mul26.us.i
  %arrayidx28.us.i = getelementptr inbounds float, float* %B.sroa.0.0, i64 %add27.us.i
  store float %div25.us.i, float* %arrayidx28.us.i, align 4, !tbaa !8
  %inc30.us.i = add nuw i64 %j16.097.us.i, 1
  %exitcond108.not.i = icmp eq i64 %inc30.us.i, %call3
  br i1 %exitcond108.not.i, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i, !llvm.loop !70

for.cond17.for.cond.cleanup19_crit_edge.us.i:     ; preds = %for.body20.us.i, %middle.block3936
  %inc33.us.i = add nuw i64 %i11.099.us.i, 1
  %exitcond109.not.i = icmp eq i64 %inc33.us.i, %call5
  br i1 %exitcond109.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.us.i, !llvm.loop !20

for.cond36.preheader.i:                           ; preds = %for.cond17.for.cond.cleanup19_crit_edge.us.i, %for.cond17.preheader.lr.ph.i, %for.cond12.preheader.i
  br i1 %cmp94.not.i, label %_Z10initMatrixPfS_S_mmm.exit, label %for.cond41.preheader.lr.ph.i

for.cond41.preheader.lr.ph.i:                     ; preds = %for.cond36.preheader.i, %for.cond1.preheader.lr.ph.i
  %cmp42100.not.i = icmp eq i64 %call3, 0
  %conv48.i = uitofp i64 %call3 to float
  br i1 %cmp42100.not.i, label %_Z10initMatrixPfS_S_mmm.exit, label %for.cond41.preheader.us.i.preheader

for.cond41.preheader.us.i.preheader:              ; preds = %for.cond41.preheader.lr.ph.i
  %min.iters.check3961 = icmp ult i64 %call3, 8
  %n.vec3964 = and i64 %call3, -8
  %broadcast.splatinsert3977 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat3978 = shufflevector <4 x float> %broadcast.splatinsert3977, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3979 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat3980 = shufflevector <4 x float> %broadcast.splatinsert3979, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n3966 = icmp eq i64 %call3, %n.vec3964
  br label %for.cond41.preheader.us.i

for.cond41.preheader.us.i:                        ; preds = %for.cond41.preheader.us.i.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i
  %i35.0103.us.i = phi i64 [ %inc57.us.i, %for.cond41.for.cond.cleanup43_crit_edge.us.i ], [ 0, %for.cond41.preheader.us.i.preheader ]
  %conv45.us.i = uitofp i64 %i35.0103.us.i to float
  %mul50.us.i = mul i64 %i35.0103.us.i, %call3
  br i1 %min.iters.check3961, label %for.body44.us.i.preheader, label %vector.ph3962

vector.ph3962:                                    ; preds = %for.cond41.preheader.us.i
  %broadcast.splatinsert3973 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat3974 = shufflevector <4 x float> %broadcast.splatinsert3973, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3975 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat3976 = shufflevector <4 x float> %broadcast.splatinsert3975, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body3967

vector.body3967:                                  ; preds = %vector.body3967, %vector.ph3962
  %index3968 = phi i64 [ 0, %vector.ph3962 ], [ %index.next3981, %vector.body3967 ]
  %vec.ind3969 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph3962 ], [ %vec.ind.next3972, %vector.body3967 ]
  %step.add3970 = add <4 x i64> %vec.ind3969, <i64 4, i64 4, i64 4, i64 4>
  %31 = uitofp <4 x i64> %vec.ind3969 to <4 x float>
  %32 = uitofp <4 x i64> %step.add3970 to <4 x float>
  %33 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3974, <4 x float> %31, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %34 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3976, <4 x float> %32, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %35 = fdiv <4 x float> %33, %broadcast.splat3978
  %36 = fdiv <4 x float> %34, %broadcast.splat3980
  %37 = add i64 %index3968, %mul50.us.i
  %38 = getelementptr inbounds float, float* %C.sroa.0.0, i64 %37
  %39 = bitcast float* %38 to <4 x float>*
  store <4 x float> %35, <4 x float>* %39, align 4, !tbaa !8
  %40 = getelementptr inbounds float, float* %38, i64 4
  %41 = bitcast float* %40 to <4 x float>*
  store <4 x float> %36, <4 x float>* %41, align 4, !tbaa !8
  %index.next3981 = add nuw i64 %index3968, 8
  %vec.ind.next3972 = add <4 x i64> %vec.ind3969, <i64 8, i64 8, i64 8, i64 8>
  %42 = icmp eq i64 %index.next3981, %n.vec3964
  br i1 %42, label %middle.block3959, label %vector.body3967, !llvm.loop !71

middle.block3959:                                 ; preds = %vector.body3967
  br i1 %cmp.n3966, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i.preheader

for.body44.us.i.preheader:                        ; preds = %for.cond41.preheader.us.i, %middle.block3959
  %j40.0101.us.i.ph = phi i64 [ 0, %for.cond41.preheader.us.i ], [ %n.vec3964, %middle.block3959 ]
  br label %for.body44.us.i

for.body44.us.i:                                  ; preds = %for.body44.us.i.preheader, %for.body44.us.i
  %j40.0101.us.i = phi i64 [ %inc54.us.i, %for.body44.us.i ], [ %j40.0101.us.i.ph, %for.body44.us.i.preheader ]
  %conv46.us.i = uitofp i64 %j40.0101.us.i to float
  %43 = tail call float @llvm.fmuladd.f32(float %conv45.us.i, float %conv46.us.i, float 2.000000e+00) #17
  %div49.us.i = fdiv float %43, %conv48.i
  %add51.us.i = add i64 %j40.0101.us.i, %mul50.us.i
  %arrayidx52.us.i = getelementptr inbounds float, float* %C.sroa.0.0, i64 %add51.us.i
  store float %div49.us.i, float* %arrayidx52.us.i, align 4, !tbaa !8
  %inc54.us.i = add nuw i64 %j40.0101.us.i, 1
  %exitcond110.not.i = icmp eq i64 %inc54.us.i, %call3
  br i1 %exitcond110.not.i, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i, !llvm.loop !72

for.cond41.for.cond.cleanup43_crit_edge.us.i:     ; preds = %for.body44.us.i, %middle.block3959
  %inc57.us.i = add nuw i64 %i35.0103.us.i, 1
  %exitcond111.not.i = icmp eq i64 %inc57.us.i, %call1
  br i1 %exitcond111.not.i, label %_Z10initMatrixPfS_S_mmm.exit, label %for.cond41.preheader.us.i, !llvm.loop !23

_Z10initMatrixPfS_S_mmm.exit:                     ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us.i, %for.cond36.preheader.i, %for.cond41.preheader.lr.ph.i
  %call17 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17
  %cmp236.not.i = icmp eq i64 %call5, 0
  %or.cond.i = or i1 %cmp94.not.i, %cmp236.not.i
  %cmp634.not.i = icmp eq i64 %call3, 0
  %or.cond50.i = or i1 %cmp634.not.i, %or.cond.i
  br i1 %or.cond50.i, label %invoke.cont30, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %_Z10initMatrixPfS_S_mmm.exit
  %44 = icmp slt i64 %call1, 1
  %45 = icmp slt i64 %call5, 1
  %46 = or i1 %44, %45
  %47 = icmp slt i64 %call3, 1
  %48 = or i1 %47, %46
  br i1 %48, label %for.cond1.preheader.us.us.i.preheader, label %polly.loop_if

for.cond1.preheader.us.us.i.preheader:            ; preds = %polly.split_new_and_old
  %min.iters.check4012 = icmp ult i64 %call3, 8
  %n.vec4015 = and i64 %call3, -8
  %cmp.n4017 = icmp eq i64 %call3, %n.vec4015
  br label %for.cond1.preheader.us.us.i

for.cond1.preheader.us.us.i:                      ; preds = %for.cond1.preheader.us.us.i.preheader, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i
  %i.039.us.us.i = phi i64 [ %inc20.us.us.i, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i ], [ 0, %for.cond1.preheader.us.us.i.preheader ]
  %mul.us.us.i = mul i64 %i.039.us.us.i, %call5
  %mul13.us.us.i = mul i64 %i.039.us.us.i, %call3
  br label %for.cond5.preheader.us.us.us.i

for.cond5.preheader.us.us.us.i:                   ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i, %for.cond1.preheader.us.us.i
  %k.037.us.us.us.i = phi i64 [ 0, %for.cond1.preheader.us.us.i ], [ %inc17.us.us.us.i, %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i ]
  %add.us.us.us.i = add i64 %k.037.us.us.us.i, %mul.us.us.i
  %arrayidx.us.us.us.i = getelementptr inbounds float, float* %A.sroa.0.0, i64 %add.us.us.us.i
  %mul9.us.us.us.i = mul i64 %k.037.us.us.us.i, %call3
  %49 = load float, float* %arrayidx.us.us.us.i, align 4, !tbaa !8
  br i1 %min.iters.check4012, label %for.body8.us.us.us.i.preheader, label %vector.ph4013

vector.ph4013:                                    ; preds = %for.cond5.preheader.us.us.us.i
  %broadcast.splatinsert4023 = insertelement <4 x float> poison, float %49, i64 0
  %broadcast.splat4024 = shufflevector <4 x float> %broadcast.splatinsert4023, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4025 = insertelement <4 x float> poison, float %49, i64 0
  %broadcast.splat4026 = shufflevector <4 x float> %broadcast.splatinsert4025, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4018

vector.body4018:                                  ; preds = %vector.body4018, %vector.ph4013
  %index4019 = phi i64 [ 0, %vector.ph4013 ], [ %index.next4027, %vector.body4018 ]
  %50 = add i64 %index4019, %mul9.us.us.us.i
  %51 = getelementptr inbounds float, float* %B.sroa.0.0, i64 %50
  %52 = bitcast float* %51 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %52, align 4, !tbaa !8
  %53 = getelementptr inbounds float, float* %51, i64 4
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load4020 = load <4 x float>, <4 x float>* %54, align 4, !tbaa !8
  %55 = add i64 %index4019, %mul13.us.us.i
  %56 = getelementptr inbounds float, float* %C.sroa.0.0, i64 %55
  %57 = bitcast float* %56 to <4 x float>*
  %wide.load4021 = load <4 x float>, <4 x float>* %57, align 4, !tbaa !8
  %58 = getelementptr inbounds float, float* %56, i64 4
  %59 = bitcast float* %58 to <4 x float>*
  %wide.load4022 = load <4 x float>, <4 x float>* %59, align 4, !tbaa !8
  %60 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4024, <4 x float> %wide.load, <4 x float> %wide.load4021)
  %61 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4026, <4 x float> %wide.load4020, <4 x float> %wide.load4022)
  %62 = bitcast float* %56 to <4 x float>*
  store <4 x float> %60, <4 x float>* %62, align 4, !tbaa !8
  %63 = bitcast float* %58 to <4 x float>*
  store <4 x float> %61, <4 x float>* %63, align 4, !tbaa !8
  %index.next4027 = add nuw i64 %index4019, 8
  %64 = icmp eq i64 %index.next4027, %n.vec4015
  br i1 %64, label %middle.block4010, label %vector.body4018, !llvm.loop !73

middle.block4010:                                 ; preds = %vector.body4018
  br i1 %cmp.n4017, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i, label %for.body8.us.us.us.i.preheader

for.body8.us.us.us.i.preheader:                   ; preds = %for.cond5.preheader.us.us.us.i, %middle.block4010
  %j.035.us.us.us.i.ph = phi i64 [ 0, %for.cond5.preheader.us.us.us.i ], [ %n.vec4015, %middle.block4010 ]
  br label %for.body8.us.us.us.i

for.body8.us.us.us.i:                             ; preds = %for.body8.us.us.us.i.preheader, %for.body8.us.us.us.i
  %j.035.us.us.us.i = phi i64 [ %inc.us.us.us.i, %for.body8.us.us.us.i ], [ %j.035.us.us.us.i.ph, %for.body8.us.us.us.i.preheader ]
  %add10.us.us.us.i = add i64 %j.035.us.us.us.i, %mul9.us.us.us.i
  %arrayidx11.us.us.us.i = getelementptr inbounds float, float* %B.sroa.0.0, i64 %add10.us.us.us.i
  %65 = load float, float* %arrayidx11.us.us.us.i, align 4, !tbaa !8
  %add14.us.us.us.i = add i64 %j.035.us.us.us.i, %mul13.us.us.i
  %arrayidx15.us.us.us.i = getelementptr inbounds float, float* %C.sroa.0.0, i64 %add14.us.us.us.i
  %66 = load float, float* %arrayidx15.us.us.us.i, align 4, !tbaa !8
  %67 = tail call float @llvm.fmuladd.f32(float %49, float %65, float %66) #17
  store float %67, float* %arrayidx15.us.us.us.i, align 4, !tbaa !8
  %inc.us.us.us.i = add nuw i64 %j.035.us.us.us.i, 1
  %exitcond.not.i130 = icmp eq i64 %inc.us.us.us.i, %call3
  br i1 %exitcond.not.i130, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i, label %for.body8.us.us.us.i, !llvm.loop !74

for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i: ; preds = %for.body8.us.us.us.i, %middle.block4010
  %inc17.us.us.us.i = add nuw i64 %k.037.us.us.us.i, 1
  %exitcond48.not.i = icmp eq i64 %inc17.us.us.us.i, %call5
  br i1 %exitcond48.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i, label %for.cond5.preheader.us.us.us.i, !llvm.loop !34

for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i: ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i
  %inc20.us.us.i = add nuw i64 %i.039.us.us.i, 1
  %exitcond49.not.i = icmp eq i64 %inc20.us.us.i, %call1
  br i1 %exitcond49.not.i, label %invoke.cont30, label %for.cond1.preheader.us.us.i, !llvm.loop !35

invoke.cont30:                                    ; preds = %polly.loop_exit264.loopexit.us, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i, %_Z10initMatrixPfS_S_mmm.exit
  %call22 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17
  %sub.i.i = sub nsw i64 %call22, %call17
  %conv.i.i.i = sitofp i64 %sub.i.i to double
  %div.i.i.i = fdiv double %conv.i.i.i, 1.000000e+09
  %call1.i131 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i64 noundef 10)
          to label %invoke.cont32 unwind label %lpad31

invoke.cont32:                                    ; preds = %invoke.cont30
  %call.i133 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div.i.i.i)
          to label %invoke.cont36 unwind label %lpad31

invoke.cont36:                                    ; preds = %invoke.cont32
  %68 = bitcast %"class.std::basic_ostream"* %call.i133 to i8**
  %vtable.i = load i8*, i8** %68, align 8, !tbaa !75
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %69 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %69, align 8
  %70 = bitcast %"class.std::basic_ostream"* %call.i133 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %70, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 240
  %71 = bitcast i8* %_M_ctype.i.i to %"class.std::ctype"**
  %72 = load %"class.std::ctype"*, %"class.std::ctype"** %71, align 8, !tbaa !77
  %tobool.not.i.i.i166 = icmp eq %"class.std::ctype"* %72, null
  br i1 %tobool.not.i.i.i166, label %if.then.i.i.i167, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

if.then.i.i.i167:                                 ; preds = %invoke.cont36
  invoke void @_ZSt16__throw_bad_castv() #18
          to label %.noexc169 unwind label %lpad31

.noexc169:                                        ; preds = %if.then.i.i.i167
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %invoke.cont36
  %_M_widen_ok.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %72, i64 0, i32 8
  %73 = load i8, i8* %_M_widen_ok.i.i.i, align 8, !tbaa !80
  %tobool.not.i3.i.i = icmp eq i8 %73, 0
  br i1 %tobool.not.i3.i.i, label %if.end.i.i.i, label %if.then.i4.i.i

if.then.i4.i.i:                                   ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %arrayidx.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %72, i64 0, i32 9, i64 10
  %74 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !82
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i

if.end.i.i.i:                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %72)
          to label %.noexc170 unwind label %lpad31

.noexc170:                                        ; preds = %if.end.i.i.i
  %75 = bitcast %"class.std::ctype"* %72 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %75, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i, i64 6
  %76 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i.i.i171 = invoke noundef i8 %76(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %72, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i unwind label %lpad31

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i: ; preds = %.noexc170, %if.then.i4.i.i
  %retval.0.i.i.i = phi i8 [ %74, %if.then.i4.i.i ], [ %call.i.i.i171, %.noexc170 ]
  %call1.i172 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i133, i8 noundef %retval.0.i.i.i)
          to label %call1.i.noexc unwind label %lpad31

call1.i.noexc:                                    ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i
  %call.i.i168173 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i172)
          to label %invoke.cont38 unwind label %lpad31

invoke.cont38:                                    ; preds = %call1.i.noexc
  %call1.i137 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i64 noundef 13)
          to label %invoke.cont47 unwind label %lpad44

invoke.cont47:                                    ; preds = %invoke.cont38
  %mul41 = shl i64 %call1, 1
  %mul42 = mul i64 %mul41, %mul6
  %conv = uitofp i64 %mul42 to double
  %mul43 = fmul double %conv, 1.000000e-09
  %div = fdiv double %mul43, %div.i.i.i
  %call.i139 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div)
          to label %invoke.cont49 unwind label %lpad44

invoke.cont49:                                    ; preds = %invoke.cont47
  %call1.i142 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i139, i8* noundef nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i64 noundef 7)
          to label %invoke.cont51 unwind label %lpad44

invoke.cont51:                                    ; preds = %invoke.cont49
  %77 = bitcast %"class.std::basic_ostream"* %call.i139 to i8**
  %vtable.i174 = load i8*, i8** %77, align 8, !tbaa !75
  %vbase.offset.ptr.i175 = getelementptr i8, i8* %vtable.i174, i64 -24
  %78 = bitcast i8* %vbase.offset.ptr.i175 to i64*
  %vbase.offset.i176 = load i64, i64* %78, align 8
  %79 = bitcast %"class.std::basic_ostream"* %call.i139 to i8*
  %add.ptr.i177 = getelementptr inbounds i8, i8* %79, i64 %vbase.offset.i176
  %_M_ctype.i.i178 = getelementptr inbounds i8, i8* %add.ptr.i177, i64 240
  %80 = bitcast i8* %_M_ctype.i.i178 to %"class.std::ctype"**
  %81 = load %"class.std::ctype"*, %"class.std::ctype"** %80, align 8, !tbaa !77
  %tobool.not.i.i.i179 = icmp eq %"class.std::ctype"* %81, null
  br i1 %tobool.not.i.i.i179, label %if.then.i.i.i180, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183

if.then.i.i.i180:                                 ; preds = %invoke.cont51
  invoke void @_ZSt16__throw_bad_castv() #18
          to label %.noexc192 unwind label %lpad44

.noexc192:                                        ; preds = %if.then.i.i.i180
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183: ; preds = %invoke.cont51
  %_M_widen_ok.i.i.i181 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 8
  %82 = load i8, i8* %_M_widen_ok.i.i.i181, align 8, !tbaa !80
  %tobool.not.i3.i.i182 = icmp eq i8 %82, 0
  br i1 %tobool.not.i3.i.i182, label %if.end.i.i.i188, label %if.then.i4.i.i185

if.then.i4.i.i185:                                ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183
  %arrayidx.i.i.i184 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 9, i64 10
  %83 = load i8, i8* %arrayidx.i.i.i184, align 1, !tbaa !82
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191

if.end.i.i.i188:                                  ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %81)
          to label %.noexc193 unwind label %lpad44

.noexc193:                                        ; preds = %if.end.i.i.i188
  %84 = bitcast %"class.std::ctype"* %81 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i186 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %84, align 8, !tbaa !75
  %vfn.i.i.i187 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i186, i64 6
  %85 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i187, align 8
  %call.i.i.i195 = invoke noundef i8 %85(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %81, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191 unwind label %lpad44

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191: ; preds = %.noexc193, %if.then.i4.i.i185
  %retval.0.i.i.i189 = phi i8 [ %83, %if.then.i4.i.i185 ], [ %call.i.i.i195, %.noexc193 ]
  %call1.i197 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i139, i8 noundef %retval.0.i.i.i189)
          to label %call1.i.noexc196 unwind label %lpad44

call1.i.noexc196:                                 ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191
  %call.i.i190198 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i197)
          to label %invoke.cont53 unwind label %lpad44

invoke.cont53:                                    ; preds = %call1.i.noexc196
  %tobool.not.i.i.i = icmp eq float* %C.sroa.0.0, null
  br i1 %tobool.not.i.i.i, label %_ZNSt6vectorIfSaIfEED2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont53
  %86 = bitcast float* %C.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %86) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit

_ZNSt6vectorIfSaIfEED2Ev.exit:                    ; preds = %invoke.cont53, %if.then.i.i.i
  %tobool.not.i.i.i147 = icmp eq float* %B.sroa.0.0, null
  br i1 %tobool.not.i.i.i147, label %_ZNSt6vectorIfSaIfEED2Ev.exit149, label %if.then.i.i.i148

if.then.i.i.i148:                                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit
  %87 = bitcast float* %B.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %87) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit149

_ZNSt6vectorIfSaIfEED2Ev.exit149:                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit, %if.then.i.i.i148
  %tobool.not.i.i.i151 = icmp eq float* %A.sroa.0.0, null
  br i1 %tobool.not.i.i.i151, label %_ZNSt6vectorIfSaIfEED2Ev.exit153, label %if.then.i.i.i152

if.then.i.i.i152:                                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit149
  %88 = bitcast float* %A.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %88) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit153

_ZNSt6vectorIfSaIfEED2Ev.exit153:                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit149, %if.then.i.i.i152
  ret i32 0

lpad8:                                            ; preds = %for.body.i.i.preheader.i.i.i.i.i104, %if.then.i.i98
  %89 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup60

lpad12:                                           ; preds = %for.body.i.i.preheader.i.i.i.i.i118, %if.then.i.i112
  %90 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup58

lpad31:                                           ; preds = %call1.i.noexc, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i, %.noexc170, %if.end.i.i.i, %if.then.i.i.i167, %invoke.cont32, %invoke.cont30
  %91 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad44:                                           ; preds = %call1.i.noexc196, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191, %.noexc193, %if.end.i.i.i188, %if.then.i.i.i180, %invoke.cont49, %invoke.cont47, %invoke.cont38
  %92 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad44, %lpad31
  %.pn = phi { i8*, i32 } [ %92, %lpad44 ], [ %91, %lpad31 ]
  %tobool.not.i.i.i155 = icmp eq float* %C.sroa.0.0, null
  br i1 %tobool.not.i.i.i155, label %ehcleanup58, label %if.then.i.i.i156

if.then.i.i.i156:                                 ; preds = %ehcleanup
  %93 = bitcast float* %C.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %93) #17
  br label %ehcleanup58

ehcleanup58:                                      ; preds = %if.then.i.i.i156, %ehcleanup, %lpad12
  %.pn.pn = phi { i8*, i32 } [ %90, %lpad12 ], [ %.pn, %ehcleanup ], [ %.pn, %if.then.i.i.i156 ]
  %tobool.not.i.i.i159 = icmp eq float* %B.sroa.0.0, null
  br i1 %tobool.not.i.i.i159, label %ehcleanup60, label %if.then.i.i.i160

if.then.i.i.i160:                                 ; preds = %ehcleanup58
  %94 = bitcast float* %B.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %94) #17
  br label %ehcleanup60

ehcleanup60:                                      ; preds = %if.then.i.i.i160, %ehcleanup58, %lpad8
  %.pn.pn.pn = phi { i8*, i32 } [ %89, %lpad8 ], [ %.pn.pn, %ehcleanup58 ], [ %.pn.pn, %if.then.i.i.i160 ]
  %tobool.not.i.i.i163 = icmp eq float* %A.sroa.0.0, null
  br i1 %tobool.not.i.i.i163, label %ehcleanup62, label %if.then.i.i.i164

if.then.i.i.i164:                                 ; preds = %ehcleanup60
  %95 = bitcast float* %A.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %95) #17
  br label %ehcleanup62

ehcleanup62:                                      ; preds = %if.then.i.i.i164, %ehcleanup60
  resume { i8*, i32 } %.pn.pn.pn

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %96 = add i64 %call3, -1
  %polly.fdiv_q.shr = lshr i64 %96, 11
  %97 = add i64 %call5, -1
  %polly.fdiv_q.shr260 = lshr i64 %97, 9
  %98 = add nsw i64 %call1, -1
  %pexp.fdiv_q.43916 = udiv i64 %98, 96
  %pexp.pdiv_r1842 = and i64 %call3, 7
  %99 = icmp ne i64 %pexp.pdiv_r1842, 0
  %pexp.p_div_q3193740 = lshr i64 %call3, 3
  %pexp.p_div_q3283741 = lshr i64 %call1, 2
  %pexp.pdiv_r921 = and i64 %call1, 3
  %100 = icmp ne i64 %pexp.pdiv_r921, 0
  %pexp.pdiv_r1358 = and i64 %98, 3
  %101 = sub nsw i64 %call1, %pexp.pdiv_r1358
  %102 = add nsw i64 %101, -1
  %pexp.p_div_q13613742 = lshr i64 %98, 2
  %103 = mul i64 %102, %call3
  %104 = icmp ugt i64 %pexp.pdiv_r921, 1
  %105 = mul i64 %101, %call3
  %106 = add nuw nsw i64 %call1, 1
  %107 = and i64 %106, 3
  %108 = icmp eq i64 %107, 0
  %109 = add nsw i64 %call1, -3
  %pexp.div = ashr exact i64 %109, 2
  %110 = mul i64 %call3, %98
  %pexp.pdiv_r2986 = and i64 %96, 7
  %111 = sub nsw i64 %call3, %pexp.pdiv_r2986
  %112 = add nsw i64 %111, -1
  %pexp.p_div_q29963675 = lshr i64 %96, 3
  %113 = icmp ugt i64 %pexp.pdiv_r1842, 1
  %114 = add nsw i64 %call3, -2
  %pexp.p_div_q30213693 = lshr i64 %114, 3
  %.not3694 = icmp eq i64 %pexp.pdiv_r1842, 2
  %115 = add nsw i64 %call3, -3
  %pexp.p_div_q30463695 = lshr i64 %115, 3
  %116 = icmp ugt i64 %pexp.pdiv_r1842, 3
  %.not3696 = icmp eq i64 %pexp.pdiv_r1842, 4
  %117 = icmp ugt i64 %pexp.pdiv_r1842, 5
  %118 = add nuw nsw i64 %call3, 1
  %119 = and i64 %118, 7
  %120 = icmp eq i64 %119, 0
  %121 = add nsw i64 %call3, -7
  %pexp.div3145 = ashr exact i64 %121, 3
  %122 = add i64 %110, 1
  br label %polly.loop_if269.us.us.preheader

polly.loop_if269.us.us.preheader:                 ; preds = %polly.loop_if, %polly.loop_exit264.loopexit.us
  %indvars.iv3877 = phi i64 [ %indvars.iv.next3878, %polly.loop_exit264.loopexit.us ], [ %pexp.p_div_q29963675, %polly.loop_if ]
  %indvars.iv3864 = phi i64 [ %indvars.iv.next3865, %polly.loop_exit264.loopexit.us ], [ %pexp.p_div_q3193740, %polly.loop_if ]
  %polly.indvar.us = phi i64 [ %polly.indvar_next.us, %polly.loop_exit264.loopexit.us ], [ 0, %polly.loop_if ]
  %123 = shl nuw i64 %polly.indvar.us, 11
  %124 = or i64 %123, 2047
  %smin3994 = call i64 @llvm.smin.i64(i64 %124, i64 %96)
  %smax = call i64 @llvm.smax.i64(i64 %smin3994, i64 %123)
  %125 = mul nsw i64 %polly.indvar.us, -2048
  %126 = or i64 %125, 1
  %127 = add i64 %smax, %126
  %smin3879 = call i64 @llvm.smin.i64(i64 %indvars.iv3877, i64 255)
  %smin3866 = call i64 @llvm.smin.i64(i64 %indvars.iv3864, i64 256)
  %128 = call i64 @llvm.smax.i64(i64 %smin3866, i64 1)
  %129 = shl nsw i64 %polly.indvar.us, 11
  %130 = or i64 %129, 2047
  %131 = tail call i64 @llvm.smin.i64(i64 %96, i64 %130)
  %polly.loop_guard281.not.us = icmp sgt i64 %129, %131
  %polly.loop_guard281.not.fr.us = freeze i1 %polly.loop_guard281.not.us
  %132 = mul i64 %polly.indvar.us, 36028797018963712
  %133 = or i64 %129, 7
  %134 = icmp sge i64 %133, %call3
  %135 = icmp sge i64 %130, %call3
  %136 = and i1 %99, %135
  %137 = mul nsw i64 %polly.indvar.us, -256
  %138 = add nsw i64 %137, %pexp.p_div_q3193740
  %polly.loop_guard324.us = icmp slt i64 %138, 1
  %139 = add nsw i64 %137, %pexp.p_div_q29963675
  %polly.access.mul.Packed_B2997.us = shl nsw i64 %139, 9
  %140 = add nsw i64 %137, %pexp.p_div_q30213693
  %polly.access.mul.Packed_B3022.us = shl nsw i64 %140, 9
  %141 = add nsw i64 %137, %pexp.p_div_q30463695
  %polly.access.mul.Packed_B3047.us = shl nsw i64 %141, 9
  %142 = add nsw i64 %137, %pexp.div3145
  %polly.access.mul.Packed_B3146.us = shl nsw i64 %142, 9
  %143 = tail call i64 @llvm.smin.i64(i64 %139, i64 255)
  %polly.loop_guard2457.us = icmp sgt i64 %143, -1
  %144 = or i64 %129, 2
  %.not3720.us = icmp slt i64 %call3, %144
  %145 = or i64 %129, 1
  %146 = or i64 %129, 3
  %.not3736.us = icmp slt i64 %call3, %146
  %147 = or i64 %129, 4
  %.not3737.us = icmp slt i64 %call3, %147
  %148 = or i64 %129, 5
  %.not3738.us = icmp slt i64 %call3, %148
  %149 = or i64 %129, 6
  %.not3739.us = icmp slt i64 %call3, %149
  %150 = icmp eq i64 %133, %call3
  %min.iters.check3997 = icmp ult i64 %127, 2
  %n.vec4000 = and i64 %127, -2
  %ind.end4002 = add i64 %129, %n.vec4000
  %cmp.n4003 = icmp eq i64 %127, %n.vec4000
  br label %polly.loop_if269.us.us

polly.loop_exit264.loopexit.us:                   ; preds = %polly.loop_exit290.loopexit.us.us
  %polly.indvar_next.us = add nuw nsw i64 %polly.indvar.us, 1
  %indvars.iv.next3865 = add nsw i64 %indvars.iv3864, -256
  %indvars.iv.next3878 = add nsw i64 %indvars.iv3877, -256
  %exitcond3890.not = icmp eq i64 %polly.indvar.us, %polly.fdiv_q.shr
  br i1 %exitcond3890.not, label %invoke.cont30, label %polly.loop_if269.us.us.preheader

polly.loop_if269.us.us:                           ; preds = %polly.loop_if269.us.us.preheader, %polly.loop_exit290.loopexit.us.us
  %indvars.iv3852 = phi i64 [ %97, %polly.loop_if269.us.us.preheader ], [ %indvars.iv.next3853, %polly.loop_exit290.loopexit.us.us ]
  %indvars.iv = phi i64 [ 511, %polly.loop_if269.us.us.preheader ], [ %indvars.iv.next, %polly.loop_exit290.loopexit.us.us ]
  %polly.indvar266.us.us = phi i64 [ 0, %polly.loop_if269.us.us.preheader ], [ %polly.indvar_next267.us.us, %polly.loop_exit290.loopexit.us.us ]
  %smin = call i64 @llvm.smin.i64(i64 %indvars.iv, i64 %97)
  %151 = mul nsw i64 %polly.indvar266.us.us, -512
  %152 = or i64 %151, 1
  %153 = add i64 %smin, %152
  %smin3881 = call i64 @llvm.smin.i64(i64 %indvars.iv3852, i64 511)
  %smin3846 = call i64 @llvm.smin.i64(i64 %indvars.iv, i64 %97)
  %154 = shl nsw i64 %polly.indvar266.us.us, 9
  %155 = or i64 %154, 511
  %156 = tail call i64 @llvm.smin.i64(i64 %97, i64 %155)
  %polly.loop_guard273.not.us.us = icmp sgt i64 %154, %156
  br i1 %polly.loop_guard273.not.us.us, label %polly.loop_if287.us.us, label %polly.loop_if277.preheader.us.us

polly.loop_if277.us3754.us:                       ; preds = %polly.loop_if277.preheader.us.us, %polly.loop_exit280.loopexit.us.us
  %polly.indvar274.us3755.us = phi i64 [ %polly.indvar_next275.us3781.us, %polly.loop_exit280.loopexit.us.us ], [ %154, %polly.loop_if277.preheader.us.us ]
  %polly.access.mul.B.sroa.0.0.us.us = mul nsw i64 %polly.indvar274.us3755.us, %call3
  br i1 %min.iters.check3997, label %polly.loop_header278.us.us.preheader, label %vector.body4004

vector.body4004:                                  ; preds = %polly.loop_if277.us3754.us, %vector.body4004
  %index4005 = phi i64 [ %index.next4009, %vector.body4004 ], [ 0, %polly.loop_if277.us3754.us ]
  %offset.idx4006 = add i64 %129, %index4005
  %induction4008 = or i64 %offset.idx4006, 1
  %157 = add nsw i64 %offset.idx4006, %polly.access.mul.B.sroa.0.0.us.us
  %158 = add nsw i64 %induction4008, %polly.access.mul.B.sroa.0.0.us.us
  %159 = getelementptr float, float* %B.sroa.0.0, i64 %157
  %160 = getelementptr float, float* %B.sroa.0.0, i64 %158
  %161 = load float, float* %159, align 4, !alias.scope !83, !noalias !86
  %162 = load float, float* %160, align 4, !alias.scope !83, !noalias !86
  %163 = lshr i64 %offset.idx4006, 3
  %164 = lshr i64 %offset.idx4006, 3
  %165 = add i64 %348, %163
  %166 = add i64 %348, %164
  %167 = shl i64 %165, 9
  %168 = shl i64 %166, 9
  %169 = add i64 %167, %polly.indvar274.us3755.us
  %170 = add i64 %168, %polly.indvar274.us3755.us
  %171 = shl nsw i64 %169, 3
  %172 = shl nsw i64 %170, 3
  %173 = and i64 %offset.idx4006, 6
  %174 = and i64 %induction4008, 7
  %175 = or i64 %171, %173
  %176 = or i64 %172, %174
  %177 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %175
  %178 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %176
  store float %161, float* %177, align 8, !alias.scope !91, !noalias !92
  store float %162, float* %178, align 4, !alias.scope !91, !noalias !92
  %index.next4009 = add nuw i64 %index4005, 2
  %179 = icmp eq i64 %index.next4009, %n.vec4000
  br i1 %179, label %middle.block3995, label %vector.body4004, !llvm.loop !93

middle.block3995:                                 ; preds = %vector.body4004
  br i1 %cmp.n4003, label %polly.loop_exit280.loopexit.us.us, label %polly.loop_header278.us.us.preheader

polly.loop_header278.us.us.preheader:             ; preds = %polly.loop_if277.us3754.us, %middle.block3995
  %polly.indvar282.us.us.ph = phi i64 [ %129, %polly.loop_if277.us3754.us ], [ %ind.end4002, %middle.block3995 ]
  br label %polly.loop_header278.us.us

polly.loop_header278.us.us:                       ; preds = %polly.loop_header278.us.us.preheader, %polly.loop_header278.us.us
  %polly.indvar282.us.us = phi i64 [ %polly.indvar_next283.us.us, %polly.loop_header278.us.us ], [ %polly.indvar282.us.us.ph, %polly.loop_header278.us.us.preheader ]
  %polly.access.add.B.sroa.0.0.us.us = add nsw i64 %polly.indvar282.us.us, %polly.access.mul.B.sroa.0.0.us.us
  %polly.access.B.sroa.0.0.us.us = getelementptr float, float* %B.sroa.0.0, i64 %polly.access.add.B.sroa.0.0.us.us
  %polly.access.B.sroa.0.0.load.us.us = load float, float* %polly.access.B.sroa.0.0.us.us, align 4, !alias.scope !83, !noalias !86
  %pexp.p_div_q3746.us.us = lshr i64 %polly.indvar282.us.us, 3
  %reass.add.us.us = add i64 %348, %pexp.p_div_q3746.us.us
  %reass.mul.us.us = shl i64 %reass.add.us.us, 9
  %polly.access.add.Packed_B.us.us = add i64 %reass.mul.us.us, %polly.indvar274.us3755.us
  %polly.access.mul.Packed_B285.us.us = shl nsw i64 %polly.access.add.Packed_B.us.us, 3
  %pexp.pdiv_r.us.us = and i64 %polly.indvar282.us.us, 7
  %polly.access.add.Packed_B286.us.us = or i64 %polly.access.mul.Packed_B285.us.us, %pexp.pdiv_r.us.us
  %polly.access.Packed_B.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B286.us.us
  store float %polly.access.B.sroa.0.0.load.us.us, float* %polly.access.Packed_B.us.us, align 4, !alias.scope !91, !noalias !92
  %polly.indvar_next283.us.us = add nuw nsw i64 %polly.indvar282.us.us, 1
  %polly.loop_cond284.not.not.us.us = icmp slt i64 %polly.indvar282.us.us, %131
  br i1 %polly.loop_cond284.not.not.us.us, label %polly.loop_header278.us.us, label %polly.loop_exit280.loopexit.us.us, !llvm.loop !94

polly.loop_if287.us.us:                           ; preds = %polly.loop_exit280.loopexit.us.us, %polly.loop_if277.preheader.us.us, %polly.loop_if269.us.us
  %180 = xor i64 %154, -1
  %181 = add i64 %call5, %180
  %182 = tail call i64 @llvm.smin.i64(i64 %181, i64 511)
  %polly.loop_guard341.us.us = icmp sgt i64 %182, -1
  %min.iters.check3984 = icmp ult i64 %153, 2
  %n.vec3987 = and i64 %153, -2
  %ind.end = add i64 %154, %n.vec3987
  %cmp.n3989 = icmp eq i64 %153, %n.vec3987
  %polly.loop_guard341.us.us.not3922 = xor i1 %polly.loop_guard341.us.us, true
  %polly.loop_guard341.us.us.not = xor i1 %polly.loop_guard341.us.us, true
  br label %polly.loop_if295.us.us

polly.loop_if295.us.us:                           ; preds = %polly.merge1839.us.us, %polly.loop_if287.us.us
  %indvars.iv3871 = phi i64 [ %indvars.iv.next3872, %polly.merge1839.us.us ], [ %pexp.p_div_q13613742, %polly.loop_if287.us.us ]
  %indvars.iv3856 = phi i64 [ %indvars.iv.next3857, %polly.merge1839.us.us ], [ %pexp.p_div_q3283741, %polly.loop_if287.us.us ]
  %indvars.iv3848 = phi i64 [ %indvars.iv.next3849, %polly.merge1839.us.us ], [ 95, %polly.loop_if287.us.us ]
  %polly.indvar292.us.us = phi i64 [ %polly.indvar_next293.us.us, %polly.merge1839.us.us ], [ 0, %polly.loop_if287.us.us ]
  %smin3883 = call i64 @llvm.smin.i64(i64 %indvars.iv3871, i64 23)
  %smin3858 = call i64 @llvm.smin.i64(i64 %indvars.iv3856, i64 24)
  %183 = call i64 @llvm.smax.i64(i64 %smin3858, i64 1)
  %smin3850 = call i64 @llvm.smin.i64(i64 %indvars.iv3848, i64 %98)
  %184 = mul nuw nsw i64 %polly.indvar292.us.us, 96
  %185 = add nuw nsw i64 %184, 95
  %186 = tail call i64 @llvm.smin.i64(i64 %98, i64 %185)
  %polly.loop_guard299.not.us.us = icmp sgt i64 %184, %186
  br i1 %polly.loop_guard299.not.us.us, label %polly.cond315.us.us, label %polly.loop_if303.preheader.us.us

polly.loop_if303.us3756.us:                       ; preds = %polly.loop_if303.preheader.us.us, %polly.loop_exit306.loopexit.us.us
  %polly.indvar300.us3757.us = phi i64 [ %polly.indvar_next301.us3775.us, %polly.loop_exit306.loopexit.us.us ], [ %184, %polly.loop_if303.preheader.us.us ]
  %polly.access.mul.A.sroa.0.0.us.us = mul nsw i64 %polly.indvar300.us3757.us, %call5
  %pexp.p_div_q3113745.us.us = lshr i64 %polly.indvar300.us3757.us, 2
  %reass.add3748.us.us = add i64 %347, %pexp.p_div_q3113745.us.us
  %reass.mul3749.us.us = shl i64 %reass.add3748.us.us, 9
  %pexp.pdiv_r313.us.us = and i64 %polly.indvar300.us3757.us, 3
  br i1 %min.iters.check3984, label %polly.loop_header304.us.us.preheader, label %vector.body3990

vector.body3990:                                  ; preds = %polly.loop_if303.us3756.us, %vector.body3990
  %index3991 = phi i64 [ %index.next3993, %vector.body3990 ], [ 0, %polly.loop_if303.us3756.us ]
  %offset.idx = add i64 %154, %index3991
  %induction3992 = or i64 %offset.idx, 1
  %187 = add nsw i64 %offset.idx, %polly.access.mul.A.sroa.0.0.us.us
  %188 = add nsw i64 %induction3992, %polly.access.mul.A.sroa.0.0.us.us
  %189 = getelementptr float, float* %A.sroa.0.0, i64 %187
  %190 = getelementptr float, float* %A.sroa.0.0, i64 %188
  %191 = load float, float* %189, align 4, !alias.scope !95, !noalias !96
  %192 = load float, float* %190, align 4, !alias.scope !95, !noalias !96
  %193 = add i64 %offset.idx, %reass.mul3749.us.us
  %194 = add i64 %induction3992, %reass.mul3749.us.us
  %195 = shl nsw i64 %193, 2
  %196 = shl nsw i64 %194, 2
  %197 = or i64 %195, %pexp.pdiv_r313.us.us
  %198 = or i64 %196, %pexp.pdiv_r313.us.us
  %199 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %197
  %200 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %198
  store float %191, float* %199, align 4, !alias.scope !97, !noalias !98
  store float %192, float* %200, align 4, !alias.scope !97, !noalias !98
  %index.next3993 = add nuw i64 %index3991, 2
  %201 = icmp eq i64 %index.next3993, %n.vec3987
  br i1 %201, label %middle.block3982, label %vector.body3990, !llvm.loop !99

middle.block3982:                                 ; preds = %vector.body3990
  br i1 %cmp.n3989, label %polly.loop_exit306.loopexit.us.us, label %polly.loop_header304.us.us.preheader

polly.loop_header304.us.us.preheader:             ; preds = %polly.loop_if303.us3756.us, %middle.block3982
  %polly.indvar308.us.us.ph = phi i64 [ %154, %polly.loop_if303.us3756.us ], [ %ind.end, %middle.block3982 ]
  br label %polly.loop_header304.us.us

polly.loop_header304.us.us:                       ; preds = %polly.loop_header304.us.us.preheader, %polly.loop_header304.us.us
  %polly.indvar308.us.us = phi i64 [ %polly.indvar_next309.us.us, %polly.loop_header304.us.us ], [ %polly.indvar308.us.us.ph, %polly.loop_header304.us.us.preheader ]
  %polly.access.add.A.sroa.0.0.us.us = add nsw i64 %polly.indvar308.us.us, %polly.access.mul.A.sroa.0.0.us.us
  %polly.access.A.sroa.0.0.us.us = getelementptr float, float* %A.sroa.0.0, i64 %polly.access.add.A.sroa.0.0.us.us
  %polly.access.A.sroa.0.0.load.us.us = load float, float* %polly.access.A.sroa.0.0.us.us, align 4, !alias.scope !95, !noalias !96
  %polly.access.add.Packed_A.us.us = add i64 %polly.indvar308.us.us, %reass.mul3749.us.us
  %polly.access.mul.Packed_A312.us.us = shl nsw i64 %polly.access.add.Packed_A.us.us, 2
  %polly.access.add.Packed_A314.us.us = or i64 %polly.access.mul.Packed_A312.us.us, %pexp.pdiv_r313.us.us
  %polly.access.Packed_A.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A314.us.us
  store float %polly.access.A.sroa.0.0.load.us.us, float* %polly.access.Packed_A.us.us, align 4, !alias.scope !97, !noalias !98
  %polly.indvar_next309.us.us = add nuw i64 %polly.indvar308.us.us, 1
  %exitcond3847.not = icmp eq i64 %polly.indvar308.us.us, %smin3846
  br i1 %exitcond3847.not, label %polly.loop_exit306.loopexit.us.us, label %polly.loop_header304.us.us, !llvm.loop !100

polly.cond315.us.us:                              ; preds = %polly.loop_exit306.loopexit.us.us, %polly.loop_if303.preheader.us.us, %polly.loop_if295.us.us
  %202 = or i64 %184, 4
  %.not.us.us = icmp slt i64 %call1, %202
  %brmerge = select i1 %.not.us.us, i1 true, i1 %polly.loop_guard324.us
  br i1 %brmerge, label %polly.cond1838.us.us, label %polly.loop_if329.preheader.us.us

polly.loop_if329.us.us:                           ; preds = %polly.loop_if329.preheader.us.us, %polly.merge918.us.us
  %polly.indvar325.us.us = phi i64 [ %polly.indvar_next326.us.us, %polly.merge918.us.us ], [ 0, %polly.loop_if329.preheader.us.us ]
  br i1 %polly.loop_guard333.us.us, label %polly.loop_if337.preheader.us.us, label %polly.cond917.us.us

polly.cond917.us.us:                              ; preds = %polly.loop_exit340.loopexit.us.us.us, %polly.loop_if337.preheader.us.us, %polly.loop_if329.us.us
  br i1 %339, label %polly.cond922.us.us, label %polly.merge918.us.us

polly.cond922.us.us:                              ; preds = %polly.cond917.us.us
  br i1 %332, label %polly.loop_if926.us.us, label %polly.loop_if1350.us.us

polly.loop_if1350.us.us:                          ; preds = %polly.cond922.us.us
  br i1 %polly.loop_guard341.us.us, label %polly.cond1518.preheader.us.us, label %polly.merge918.us.us

polly.cond1518.us.us:                             ; preds = %polly.cond1518.preheader.us.us, %polly.merge1519.us.us
  %polly.indvar1355.us.us = phi i64 [ %polly.indvar_next1356.us.us, %polly.merge1519.us.us ], [ 0, %polly.cond1518.preheader.us.us ]
  %polly.access.add.Packed_A1363.us.us = add nsw i64 %polly.indvar1355.us.us, %polly.access.mul.Packed_A1362.us.us
  %polly.access.mul.Packed_A1364.us.us = shl nsw i64 %polly.access.add.Packed_A1363.us.us, 2
  %polly.access.Packed_A1366.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1364.us.us
  %_p_scalar_1367.us.us = load float, float* %polly.access.Packed_A1366.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_B1370.us.us = add nuw nsw i64 %polly.indvar1355.us.us, %polly.access.mul.Packed_B1369.us.us
  %polly.access.mul.Packed_B1371.us.us = shl nsw i64 %polly.access.add.Packed_B1370.us.us, 3
  %polly.access.Packed_B1373.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1371.us.us
  %203 = bitcast float* %polly.access.Packed_B1373.us.us to <4 x float>*
  %204 = load <4 x float>, <4 x float>* %203, align 32, !alias.scope !91, !noalias !92
  %205 = load <4 x float>, <4 x float>* %301, align 4, !alias.scope !101, !noalias !102
  %206 = insertelement <4 x float> poison, float %_p_scalar_1367.us.us, i64 0
  %shuffle4035 = shufflevector <4 x float> %206, <4 x float> poison, <4 x i32> zeroinitializer
  %207 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4035, <4 x float> %204, <4 x float> %205)
  store <4 x float> %207, <4 x float>* %302, align 4, !alias.scope !101, !noalias !102
  %polly.access.add.Packed_B1452.us.us = or i64 %polly.access.mul.Packed_B1371.us.us, 4
  %polly.access.Packed_B1453.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1452.us.us
  %208 = bitcast float* %polly.access.Packed_B1453.us.us to <2 x float>*
  %209 = load <2 x float>, <2 x float>* %208, align 16, !alias.scope !91, !noalias !92
  %polly.access.add.Packed_B1492.us.us = or i64 %polly.access.mul.Packed_B1371.us.us, 6
  %polly.access.Packed_B1493.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1492.us.us
  %210 = bitcast float* %polly.access.Packed_B1493.us.us to <2 x float>*
  %211 = load <2 x float>, <2 x float>* %210, align 8, !alias.scope !91, !noalias !92
  %212 = load <4 x float>, <4 x float>* %303, align 4, !alias.scope !101, !noalias !102
  %213 = shufflevector <2 x float> %209, <2 x float> %211, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %214 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4035, <4 x float> %213, <4 x float> %212)
  store <4 x float> %214, <4 x float>* %304, align 4, !alias.scope !101, !noalias !102
  br i1 %104, label %polly.cond1683.us.us, label %polly.merge1519.us.us

polly.cond1683.us.us:                             ; preds = %polly.cond1518.us.us
  %polly.access.add.Packed_A1530.us.us = or i64 %polly.access.mul.Packed_A1364.us.us, 1
  %polly.access.Packed_A1531.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1530.us.us
  %_p_scalar_1532.us.us = load float, float* %polly.access.Packed_A1531.us.us, align 4, !alias.scope !97, !noalias !98
  %215 = load <4 x float>, <4 x float>* %305, align 4, !alias.scope !101, !noalias !102
  %216 = insertelement <4 x float> poison, float %_p_scalar_1532.us.us, i64 0
  %shuffle4033 = shufflevector <4 x float> %216, <4 x float> poison, <4 x i32> zeroinitializer
  %217 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4033, <4 x float> %204, <4 x float> %215)
  store <4 x float> %217, <4 x float>* %306, align 4, !alias.scope !101, !noalias !102
  %218 = load <4 x float>, <4 x float>* %307, align 4, !alias.scope !101, !noalias !102
  %219 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4033, <4 x float> %213, <4 x float> %218)
  store <4 x float> %219, <4 x float>* %308, align 4, !alias.scope !101, !noalias !102
  br i1 %108, label %polly.stmt.for.body8.us.us.us.i1819.us.us, label %polly.merge1519.us.us

polly.stmt.for.body8.us.us.us.i1819.us.us:        ; preds = %polly.cond1683.us.us
  %polly.access.add.Packed_A1690.us.us = add nsw i64 %polly.indvar1355.us.us, %polly.access.mul.Packed_A1689.us.us
  %polly.access.mul.Packed_A1691.us.us = shl nsw i64 %polly.access.add.Packed_A1690.us.us, 2
  %polly.access.add.Packed_A1692.us.us = or i64 %polly.access.mul.Packed_A1691.us.us, 2
  %polly.access.Packed_A1693.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1692.us.us
  %_p_scalar_1694.us.us = load float, float* %polly.access.Packed_A1693.us.us, align 8, !alias.scope !97, !noalias !98
  %220 = load <4 x float>, <4 x float>* %309, align 4, !alias.scope !101, !noalias !102
  %221 = insertelement <4 x float> poison, float %_p_scalar_1694.us.us, i64 0
  %shuffle4032 = shufflevector <4 x float> %221, <4 x float> poison, <4 x i32> zeroinitializer
  %222 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4032, <4 x float> %204, <4 x float> %220)
  store <4 x float> %222, <4 x float>* %310, align 4, !alias.scope !101, !noalias !102
  %223 = load <2 x float>, <2 x float>* %311, align 4, !alias.scope !101, !noalias !102
  %224 = insertelement <2 x float> poison, float %_p_scalar_1694.us.us, i64 0
  %225 = shufflevector <2 x float> %224, <2 x float> poison, <2 x i32> zeroinitializer
  %226 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %225, <2 x float> %209, <2 x float> %223)
  store <2 x float> %226, <2 x float>* %312, align 4, !alias.scope !101, !noalias !102
  %227 = load <2 x float>, <2 x float>* %313, align 4, !alias.scope !101, !noalias !102
  %228 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %225, <2 x float> %211, <2 x float> %227)
  store <2 x float> %228, <2 x float>* %314, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge1519.us.us

polly.merge1519.us.us:                            ; preds = %polly.stmt.for.body8.us.us.us.i1819.us.us, %polly.cond1683.us.us, %polly.cond1518.us.us
  %polly.indvar_next1356.us.us = add nuw nsw i64 %polly.indvar1355.us.us, 1
  %exitcond3861.not = icmp eq i64 %polly.indvar1355.us.us, %smin3881
  br i1 %exitcond3861.not, label %polly.merge918.us.us, label %polly.cond1518.us.us, !llvm.loop !103

polly.loop_if926.us.us:                           ; preds = %polly.cond922.us.us
  br i1 %polly.loop_guard341.us.us, label %polly.cond1070.preheader.us.us, label %polly.merge918.us.us

polly.cond1070.us.us:                             ; preds = %polly.cond1070.preheader.us.us, %polly.merge1071.us.us
  %polly.indvar931.us.us = phi i64 [ %polly.indvar_next932.us.us, %polly.merge1071.us.us ], [ 0, %polly.cond1070.preheader.us.us ]
  %polly.access.add.Packed_A936.us.us = shl i64 %polly.indvar931.us.us, 2
  %polly.access.mul.Packed_A937.us.us = add nuw nsw i64 %polly.access.add.Packed_A936.us.us, 2048
  %polly.access.Packed_A939.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A937.us.us
  %_p_scalar_940.us.us = load float, float* %polly.access.Packed_A939.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_B943.us.us = add nuw nsw i64 %polly.indvar931.us.us, %polly.access.mul.Packed_B942.us.us
  %polly.access.mul.Packed_B944.us.us = shl nsw i64 %polly.access.add.Packed_B943.us.us, 3
  %polly.access.Packed_B946.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B944.us.us
  %229 = bitcast float* %polly.access.Packed_B946.us.us to <4 x float>*
  %230 = load <4 x float>, <4 x float>* %229, align 32, !alias.scope !91, !noalias !92
  %231 = load <4 x float>, <4 x float>* %276, align 4, !alias.scope !101, !noalias !102
  %232 = insertelement <4 x float> poison, float %_p_scalar_940.us.us, i64 0
  %shuffle4030 = shufflevector <4 x float> %232, <4 x float> poison, <4 x i32> zeroinitializer
  %233 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4030, <4 x float> %230, <4 x float> %231)
  store <4 x float> %233, <4 x float>* %277, align 4, !alias.scope !101, !noalias !102
  %polly.access.add.Packed_B1013.us.us = or i64 %polly.access.mul.Packed_B944.us.us, 4
  %polly.access.Packed_B1014.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1013.us.us
  %234 = bitcast float* %polly.access.Packed_B1014.us.us to <2 x float>*
  %235 = load <2 x float>, <2 x float>* %234, align 16, !alias.scope !91, !noalias !92
  %polly.access.add.Packed_B1047.us.us = or i64 %polly.access.mul.Packed_B944.us.us, 6
  %polly.access.Packed_B1048.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1047.us.us
  %236 = bitcast float* %polly.access.Packed_B1048.us.us to <2 x float>*
  %237 = load <2 x float>, <2 x float>* %236, align 8, !alias.scope !91, !noalias !92
  %238 = load <4 x float>, <4 x float>* %278, align 4, !alias.scope !101, !noalias !102
  %239 = shufflevector <2 x float> %235, <2 x float> %237, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %240 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4030, <4 x float> %239, <4 x float> %238)
  store <4 x float> %240, <4 x float>* %279, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3744.us.us, label %polly.merge1071.us.us, label %polly.cond1210.us.us

polly.cond1210.us.us:                             ; preds = %polly.cond1070.us.us
  %polly.access.add.Packed_A1078.us.us = add nuw nsw i64 %polly.access.add.Packed_A936.us.us, 2049
  %polly.access.Packed_A1079.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1078.us.us
  %_p_scalar_1080.us.us = load float, float* %polly.access.Packed_A1079.us.us, align 4, !alias.scope !97, !noalias !98
  %241 = load <4 x float>, <4 x float>* %280, align 4, !alias.scope !101, !noalias !102
  %242 = insertelement <4 x float> poison, float %_p_scalar_1080.us.us, i64 0
  %shuffle4028 = shufflevector <4 x float> %242, <4 x float> poison, <4 x i32> zeroinitializer
  %243 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4028, <4 x float> %230, <4 x float> %241)
  store <4 x float> %243, <4 x float>* %281, align 4, !alias.scope !101, !noalias !102
  %244 = load <4 x float>, <4 x float>* %282, align 4, !alias.scope !101, !noalias !102
  %245 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4028, <4 x float> %239, <4 x float> %244)
  store <4 x float> %245, <4 x float>* %283, align 4, !alias.scope !101, !noalias !102
  br i1 %345, label %polly.stmt.for.body8.us.us.us.i1333.us.us, label %polly.merge1071.us.us

polly.stmt.for.body8.us.us.us.i1333.us.us:        ; preds = %polly.cond1210.us.us
  %polly.access.add.Packed_A1218.us.us = add nuw nsw i64 %polly.access.add.Packed_A936.us.us, 2050
  %polly.access.Packed_A1219.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1218.us.us
  %_p_scalar_1220.us.us = load float, float* %polly.access.Packed_A1219.us.us, align 8, !alias.scope !97, !noalias !98
  %246 = load <4 x float>, <4 x float>* %284, align 4, !alias.scope !101, !noalias !102
  %247 = insertelement <4 x float> poison, float %_p_scalar_1220.us.us, i64 0
  %shuffle = shufflevector <4 x float> %247, <4 x float> poison, <4 x i32> zeroinitializer
  %248 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle, <4 x float> %230, <4 x float> %246)
  store <4 x float> %248, <4 x float>* %285, align 4, !alias.scope !101, !noalias !102
  %249 = load <2 x float>, <2 x float>* %286, align 4, !alias.scope !101, !noalias !102
  %250 = insertelement <2 x float> poison, float %_p_scalar_1220.us.us, i64 0
  %251 = shufflevector <2 x float> %250, <2 x float> poison, <2 x i32> zeroinitializer
  %252 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %251, <2 x float> %235, <2 x float> %249)
  store <2 x float> %252, <2 x float>* %287, align 4, !alias.scope !101, !noalias !102
  %253 = load <2 x float>, <2 x float>* %288, align 4, !alias.scope !101, !noalias !102
  %254 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %251, <2 x float> %237, <2 x float> %253)
  store <2 x float> %254, <2 x float>* %289, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge1071.us.us

polly.merge1071.us.us:                            ; preds = %polly.stmt.for.body8.us.us.us.i1333.us.us, %polly.cond1210.us.us, %polly.cond1070.us.us
  %polly.indvar_next932.us.us = add nuw nsw i64 %polly.indvar931.us.us, 1
  %exitcond3863.not = icmp eq i64 %polly.indvar931.us.us, %smin3881
  br i1 %exitcond3863.not, label %polly.merge918.us.us, label %polly.cond1070.us.us, !llvm.loop !104

polly.merge918.us.us:                             ; preds = %polly.merge1519.us.us, %polly.merge1071.us.us, %polly.loop_if926.us.us, %polly.loop_if1350.us.us, %polly.cond917.us.us
  %polly.indvar_next326.us.us = add nuw nsw i64 %polly.indvar325.us.us, 1
  %exitcond3868.not = icmp eq i64 %polly.indvar_next326.us.us, %128
  br i1 %exitcond3868.not, label %polly.cond1838.us.us, label %polly.loop_if329.us.us

polly.cond1838.us.us:                             ; preds = %polly.merge918.us.us, %polly.cond315.us.us
  %255 = or i64 %184, 3
  %256 = icmp sge i64 %255, %call1
  %257 = or i1 %134, %256
  %258 = or i1 %136, %257
  br i1 %258, label %polly.cond1843.us.us, label %polly.merge1839.us.us

polly.cond1843.us.us:                             ; preds = %polly.cond1838.us.us
  br i1 %134, label %polly.loop_if1848.us.us, label %polly.cond2448.us.us

polly.cond2448.us.us:                             ; preds = %polly.cond1843.us.us
  br i1 %256, label %polly.loop_if2453.us.us, label %polly.loop_if2970.us.us

polly.loop_if2970.us.us:                          ; preds = %polly.cond2448.us.us
  %259 = mul nsw i64 %polly.indvar292.us.us, -24
  %260 = add nsw i64 %259, %pexp.p_div_q13613742
  %261 = tail call i64 @llvm.smin.i64(i64 %260, i64 23)
  %polly.loop_guard2974.us.us = icmp slt i64 %261, 0
  %brmerge3923 = select i1 %polly.loop_guard2974.us.us, i1 true, i1 %polly.loop_guard341.us.us.not3922
  br i1 %brmerge3923, label %polly.merge1839.us.us, label %polly.loop_if2978.us.us.us

polly.loop_if2453.us.us:                          ; preds = %polly.cond2448.us.us
  br i1 %polly.loop_guard2457.us, label %polly.loop_if2461.preheader.us.us, label %polly.merge1839.us.us

polly.loop_if1848.us.us:                          ; preds = %polly.cond1843.us.us
  %262 = mul nsw i64 %polly.indvar292.us.us, -24
  %263 = add nsw i64 %262, %pexp.p_div_q13613742
  %264 = tail call i64 @llvm.smin.i64(i64 %263, i64 23)
  %polly.loop_guard1852.us.us = icmp slt i64 %264, 0
  %brmerge3921 = select i1 %polly.loop_guard1852.us.us, i1 true, i1 %polly.loop_guard341.us.us.not
  br i1 %brmerge3921, label %polly.merge1839.us.us, label %polly.loop_if1856.us.us.us

polly.merge1839.us.us:                            ; preds = %polly.loop_exit2981.loopexit.us.us.us, %polly.loop_exit2464.loopexit.us.us.us, %polly.loop_exit1859.loopexit.us.us.us, %polly.loop_if2970.us.us, %polly.loop_if1848.us.us, %polly.loop_if2461.preheader.us.us, %polly.loop_if2453.us.us, %polly.cond1838.us.us
  %polly.indvar_next293.us.us = add nuw nsw i64 %polly.indvar292.us.us, 1
  %indvars.iv.next3849 = add nuw i64 %indvars.iv3848, 96
  %indvars.iv.next3857 = add nsw i64 %indvars.iv3856, -24
  %indvars.iv.next3872 = add nsw i64 %indvars.iv3871, -24
  %exitcond3886.not = icmp eq i64 %polly.indvar292.us.us, %pexp.fdiv_q.43916
  br i1 %exitcond3886.not, label %polly.loop_exit290.loopexit.us.us, label %polly.loop_if295.us.us

polly.cond1070.preheader.us.us:                   ; preds = %polly.loop_if926.us.us
  %265 = shl nsw i64 %polly.indvar325.us.us, 3
  %266 = add nuw nsw i64 %265, %129
  %polly.access.mul.Packed_B942.us.us = shl nsw i64 %polly.indvar325.us.us, 9
  %267 = add i64 %266, %342
  %scevgep948.us.us = getelementptr float, float* %C.sroa.0.0, i64 %267
  %268 = or i64 %266, 4
  %269 = add i64 %268, %342
  %scevgep1016.us.us = getelementptr float, float* %C.sroa.0.0, i64 %269
  %270 = or i64 %266, 6
  %271 = add i64 %266, %344
  %scevgep1088.us.us = getelementptr float, float* %C.sroa.0.0, i64 %271
  %272 = add i64 %268, %344
  %scevgep1156.us.us = getelementptr float, float* %C.sroa.0.0, i64 %272
  %273 = add i64 %266, %110
  %scevgep1228.us.us = getelementptr float, float* %C.sroa.0.0, i64 %273
  %274 = add i64 %268, %110
  %scevgep1296.us.us = getelementptr float, float* %C.sroa.0.0, i64 %274
  %275 = add i64 %270, %110
  %scevgep1330.us.us = getelementptr float, float* %C.sroa.0.0, i64 %275
  %276 = bitcast float* %scevgep948.us.us to <4 x float>*
  %277 = bitcast float* %scevgep948.us.us to <4 x float>*
  %278 = bitcast float* %scevgep1016.us.us to <4 x float>*
  %279 = bitcast float* %scevgep1016.us.us to <4 x float>*
  %280 = bitcast float* %scevgep1088.us.us to <4 x float>*
  %281 = bitcast float* %scevgep1088.us.us to <4 x float>*
  %282 = bitcast float* %scevgep1156.us.us to <4 x float>*
  %283 = bitcast float* %scevgep1156.us.us to <4 x float>*
  %284 = bitcast float* %scevgep1228.us.us to <4 x float>*
  %285 = bitcast float* %scevgep1228.us.us to <4 x float>*
  %286 = bitcast float* %scevgep1296.us.us to <2 x float>*
  %287 = bitcast float* %scevgep1296.us.us to <2 x float>*
  %288 = bitcast float* %scevgep1330.us.us to <2 x float>*
  %289 = bitcast float* %scevgep1330.us.us to <2 x float>*
  br label %polly.cond1070.us.us

polly.cond1518.preheader.us.us:                   ; preds = %polly.loop_if1350.us.us
  %290 = shl nsw i64 %polly.indvar325.us.us, 3
  %291 = add nuw nsw i64 %290, %129
  %polly.access.mul.Packed_B1369.us.us = shl nsw i64 %polly.indvar325.us.us, 9
  %292 = add i64 %291, %103
  %scevgep1375.us.us = getelementptr float, float* %C.sroa.0.0, i64 %292
  %293 = or i64 %291, 4
  %294 = add i64 %293, %103
  %scevgep1455.us.us = getelementptr float, float* %C.sroa.0.0, i64 %294
  %295 = or i64 %291, 6
  %296 = add i64 %291, %105
  %scevgep1540.us.us = getelementptr float, float* %C.sroa.0.0, i64 %296
  %297 = add i64 %293, %105
  %scevgep1620.us.us = getelementptr float, float* %C.sroa.0.0, i64 %297
  %298 = add i64 %291, %110
  %scevgep1702.us.us = getelementptr float, float* %C.sroa.0.0, i64 %298
  %299 = add i64 %293, %110
  %scevgep1778.us.us = getelementptr float, float* %C.sroa.0.0, i64 %299
  %300 = add i64 %295, %110
  %scevgep1816.us.us = getelementptr float, float* %C.sroa.0.0, i64 %300
  %301 = bitcast float* %scevgep1375.us.us to <4 x float>*
  %302 = bitcast float* %scevgep1375.us.us to <4 x float>*
  %303 = bitcast float* %scevgep1455.us.us to <4 x float>*
  %304 = bitcast float* %scevgep1455.us.us to <4 x float>*
  %305 = bitcast float* %scevgep1540.us.us to <4 x float>*
  %306 = bitcast float* %scevgep1540.us.us to <4 x float>*
  %307 = bitcast float* %scevgep1620.us.us to <4 x float>*
  %308 = bitcast float* %scevgep1620.us.us to <4 x float>*
  %309 = bitcast float* %scevgep1702.us.us to <4 x float>*
  %310 = bitcast float* %scevgep1702.us.us to <4 x float>*
  %311 = bitcast float* %scevgep1778.us.us to <2 x float>*
  %312 = bitcast float* %scevgep1778.us.us to <2 x float>*
  %313 = bitcast float* %scevgep1816.us.us to <2 x float>*
  %314 = bitcast float* %scevgep1816.us.us to <2 x float>*
  br label %polly.cond1518.us.us

polly.loop_if337.preheader.us.us:                 ; preds = %polly.loop_if329.us.us
  %315 = shl nsw i64 %polly.indvar325.us.us, 3
  %316 = add nuw nsw i64 %315, %129
  %polly.access.mul.Packed_B352.us.us = shl nsw i64 %polly.indvar325.us.us, 9
  %317 = or i64 %316, 2
  %318 = or i64 %316, 4
  %319 = or i64 %316, 6
  br i1 %polly.loop_guard341.us.us, label %polly.loop_if337.us.us.us, label %polly.cond917.us.us

polly.loop_exit306.loopexit.us.us:                ; preds = %polly.loop_header304.us.us, %middle.block3982
  %polly.indvar_next301.us3775.us = add nuw i64 %polly.indvar300.us3757.us, 1
  %exitcond3851.not = icmp eq i64 %polly.indvar300.us3757.us, %smin3850
  br i1 %exitcond3851.not, label %polly.cond315.us.us, label %polly.loop_if303.us3756.us

polly.loop_if2461.preheader.us.us:                ; preds = %polly.loop_if2453.us.us
  %320 = mul i64 %184, %call3
  %321 = or i64 %184, 2
  %.not3700.us.us = icmp slt i64 %call1, %321
  %322 = or i64 %320, 1
  %323 = or i64 %184, 1
  %324 = mul i64 %323, %call3
  %325 = add i64 %324, 1
  %326 = icmp eq i64 %255, %call1
  br i1 %polly.loop_guard341.us.us, label %polly.loop_if2461.us.us.us, label %polly.merge1839.us.us

polly.loop_if329.preheader.us.us:                 ; preds = %polly.cond315.us.us
  %327 = mul nsw i64 %polly.indvar292.us.us, -24
  %328 = add nsw i64 %327, %pexp.p_div_q3283741
  %polly.loop_guard333.us.us = icmp sgt i64 %328, 0
  %329 = or i64 %184, 5
  %330 = icmp sge i64 %call1, %329
  %331 = or i64 %184, 7
  %332 = icmp sge i64 %331, %call1
  %333 = and i1 %330, %332
  %334 = or i64 %184, 8
  %335 = icmp sge i64 %call1, %334
  %336 = icmp sge i64 %185, %call1
  %337 = and i1 %335, %336
  %338 = and i1 %100, %337
  %339 = or i1 %333, %338
  %340 = add nsw i64 %327, %pexp.p_div_q13613742
  %polly.access.mul.Packed_A1362.us.us = shl nsw i64 %340, 9
  %341 = add nsw i64 %327, %pexp.div
  %polly.access.mul.Packed_A1689.us.us = shl nsw i64 %341, 9
  %342 = mul i64 %202, %call3
  %343 = or i64 %184, 6
  %.not3744.us.us = icmp slt i64 %call1, %343
  %344 = mul i64 %329, %call3
  %345 = icmp eq i64 %331, %call1
  br label %polly.loop_if329.us.us

polly.loop_if303.preheader.us.us:                 ; preds = %polly.loop_if295.us.us
  %346 = mul i64 %polly.indvar292.us.us, 36028797018963944
  %347 = sub i64 %346, %polly.indvar266.us.us
  br i1 %polly.loop_guard273.not.us.us, label %polly.cond315.us.us, label %polly.loop_if303.us3756.us

polly.loop_exit280.loopexit.us.us:                ; preds = %polly.loop_header278.us.us, %middle.block3995
  %polly.indvar_next275.us3781.us = add nuw i64 %polly.indvar274.us3755.us, 1
  %exitcond.not = icmp eq i64 %polly.indvar274.us3755.us, %smin3846
  br i1 %exitcond.not, label %polly.loop_if287.us.us, label %polly.loop_if277.us3754.us

polly.loop_exit290.loopexit.us.us:                ; preds = %polly.merge1839.us.us
  %polly.indvar_next267.us.us = add nuw nsw i64 %polly.indvar266.us.us, 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 512
  %indvars.iv.next3853 = add i64 %indvars.iv3852, -512
  %exitcond3888.not = icmp eq i64 %polly.indvar266.us.us, %polly.fdiv_q.shr260
  br i1 %exitcond3888.not, label %polly.loop_exit264.loopexit.us, label %polly.loop_if269.us.us

polly.loop_if277.preheader.us.us:                 ; preds = %polly.loop_if269.us.us
  %348 = sub i64 %132, %polly.indvar266.us.us
  br i1 %polly.loop_guard281.not.fr.us, label %polly.loop_if287.us.us, label %polly.loop_if277.us3754.us

polly.loop_if337.us.us.us:                        ; preds = %polly.loop_if337.preheader.us.us, %polly.loop_exit340.loopexit.us.us.us
  %polly.indvar334.us.us.us = phi i64 [ %polly.indvar_next335.us.us.us, %polly.loop_exit340.loopexit.us.us.us ], [ 0, %polly.loop_if337.preheader.us.us ]
  %349 = shl nsw i64 %polly.indvar334.us.us.us, 2
  %350 = add nuw nsw i64 %349, %184
  %polly.access.mul.Packed_A346.us.us.us = shl nsw i64 %polly.indvar334.us.us.us, 9
  %351 = mul i64 %350, %call3
  %352 = add i64 %351, %316
  %scevgep.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %352
  %353 = add i64 %351, %318
  %scevgep428.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %353
  %354 = or i64 %350, 1
  %355 = mul i64 %354, %call3
  %356 = add i64 %355, %316
  %scevgep500.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %356
  %357 = add i64 %355, %318
  %scevgep572.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %357
  %358 = or i64 %350, 2
  %359 = mul i64 %358, %call3
  %360 = add i64 %359, %316
  %scevgep644.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %360
  %361 = add i64 %359, %318
  %scevgep716.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %361
  %362 = or i64 %350, 3
  %363 = mul i64 %362, %call3
  %364 = add i64 %363, %316
  %scevgep788.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %364
  %365 = add i64 %363, %317
  %scevgep824.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %365
  %366 = add i64 %363, %318
  %scevgep860.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %366
  %367 = add i64 %363, %319
  %scevgep896.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %367
  %368 = bitcast float* %scevgep788.us.us.us to <2 x float>*
  %369 = bitcast float* %scevgep788.us.us.us to <2 x float>*
  %370 = bitcast float* %scevgep.us.us.us to <4 x float>*
  %371 = bitcast float* %scevgep.us.us.us to <4 x float>*
  %372 = bitcast float* %scevgep824.us.us.us to <2 x float>*
  %373 = bitcast float* %scevgep824.us.us.us to <2 x float>*
  %374 = bitcast float* %scevgep860.us.us.us to <2 x float>*
  %375 = bitcast float* %scevgep860.us.us.us to <2 x float>*
  %376 = bitcast float* %scevgep428.us.us.us to <4 x float>*
  %377 = bitcast float* %scevgep428.us.us.us to <4 x float>*
  %378 = bitcast float* %scevgep500.us.us.us to <4 x float>*
  %379 = bitcast float* %scevgep500.us.us.us to <4 x float>*
  %380 = bitcast float* %scevgep572.us.us.us to <4 x float>*
  %381 = bitcast float* %scevgep572.us.us.us to <4 x float>*
  %382 = bitcast float* %scevgep644.us.us.us to <4 x float>*
  %383 = bitcast float* %scevgep644.us.us.us to <4 x float>*
  %384 = bitcast float* %scevgep716.us.us.us to <4 x float>*
  %385 = bitcast float* %scevgep716.us.us.us to <4 x float>*
  %386 = bitcast float* %scevgep896.us.us.us to <2 x float>*
  %387 = bitcast float* %scevgep896.us.us.us to <2 x float>*
  br label %polly.stmt.for.body8.us.us.us.i899.us.us.us

polly.stmt.for.body8.us.us.us.i899.us.us.us:      ; preds = %polly.stmt.for.body8.us.us.us.i899.us.us.us, %polly.loop_if337.us.us.us
  %polly.indvar342.us.us.us = phi i64 [ %polly.indvar_next343.us.us.us, %polly.stmt.for.body8.us.us.us.i899.us.us.us ], [ 0, %polly.loop_if337.us.us.us ]
  %polly.access.add.Packed_A347.us.us.us = add nuw nsw i64 %polly.indvar342.us.us.us, %polly.access.mul.Packed_A346.us.us.us
  %polly.access.mul.Packed_A348.us.us.us = shl nsw i64 %polly.access.add.Packed_A347.us.us.us, 2
  %polly.access.Packed_A350.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A348.us.us.us
  %_p_scalar_.us.us.us = load float, float* %polly.access.Packed_A350.us.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_B353.us.us.us = add nuw nsw i64 %polly.indvar342.us.us.us, %polly.access.mul.Packed_B352.us.us
  %polly.access.mul.Packed_B354.us.us.us = shl nsw i64 %polly.access.add.Packed_B353.us.us.us, 3
  %polly.access.Packed_B356.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B354.us.us.us
  %polly.access.add.Packed_B389.us.us.us = or i64 %polly.access.mul.Packed_B354.us.us.us, 2
  %polly.access.Packed_B390.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B389.us.us.us
  %polly.access.add.Packed_B425.us.us.us = or i64 %polly.access.mul.Packed_B354.us.us.us, 4
  %polly.access.Packed_B426.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B425.us.us.us
  %polly.access.add.Packed_B461.us.us.us = or i64 %polly.access.mul.Packed_B354.us.us.us, 6
  %polly.access.Packed_B462.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B461.us.us.us
  %polly.access.add.Packed_A490.us.us.us = or i64 %polly.access.mul.Packed_A348.us.us.us, 1
  %polly.access.Packed_A491.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A490.us.us.us
  %_p_scalar_492.us.us.us = load float, float* %polly.access.Packed_A491.us.us.us, align 4, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_A634.us.us.us = or i64 %polly.access.mul.Packed_A348.us.us.us, 2
  %polly.access.Packed_A635.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A634.us.us.us
  %polly.access.add.Packed_A778.us.us.us = or i64 %polly.access.mul.Packed_A348.us.us.us, 3
  %polly.access.Packed_A779.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A778.us.us.us
  %388 = bitcast float* %polly.access.Packed_B356.us.us.us to <2 x float>*
  %389 = load <2 x float>, <2 x float>* %388, align 32, !alias.scope !91, !noalias !92
  %390 = bitcast float* %polly.access.Packed_B390.us.us.us to <2 x float>*
  %391 = load <2 x float>, <2 x float>* %390, align 8, !alias.scope !91, !noalias !92
  %392 = load <4 x float>, <4 x float>* %370, align 4, !alias.scope !101, !noalias !102
  %393 = insertelement <4 x float> poison, float %_p_scalar_.us.us.us, i64 0
  %shuffle4041 = shufflevector <4 x float> %393, <4 x float> poison, <4 x i32> zeroinitializer
  %394 = shufflevector <2 x float> %389, <2 x float> %391, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %395 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4041, <4 x float> %394, <4 x float> %392)
  %396 = bitcast float* %polly.access.Packed_B426.us.us.us to <2 x float>*
  %397 = load <2 x float>, <2 x float>* %396, align 16, !alias.scope !91, !noalias !92
  %398 = bitcast float* %polly.access.Packed_B462.us.us.us to <2 x float>*
  %399 = load <2 x float>, <2 x float>* %398, align 8, !alias.scope !91, !noalias !92
  %400 = load <4 x float>, <4 x float>* %376, align 4, !alias.scope !101, !noalias !102
  store <4 x float> %395, <4 x float>* %371, align 4, !alias.scope !101, !noalias !102
  %401 = shufflevector <2 x float> %397, <2 x float> %399, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %402 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4041, <4 x float> %401, <4 x float> %400)
  store <4 x float> %402, <4 x float>* %377, align 4, !alias.scope !101, !noalias !102
  %403 = load <4 x float>, <4 x float>* %378, align 4, !alias.scope !101, !noalias !102
  %404 = insertelement <4 x float> poison, float %_p_scalar_492.us.us.us, i64 0
  %shuffle4039 = shufflevector <4 x float> %404, <4 x float> poison, <4 x i32> zeroinitializer
  %405 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4039, <4 x float> %394, <4 x float> %403)
  store <4 x float> %405, <4 x float>* %379, align 4, !alias.scope !101, !noalias !102
  %406 = load <4 x float>, <4 x float>* %380, align 4, !alias.scope !101, !noalias !102
  %407 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4039, <4 x float> %401, <4 x float> %406)
  store <4 x float> %407, <4 x float>* %381, align 4, !alias.scope !101, !noalias !102
  %_p_scalar_636.us.us.us = load float, float* %polly.access.Packed_A635.us.us.us, align 8, !alias.scope !97, !noalias !98
  %408 = load <4 x float>, <4 x float>* %382, align 4, !alias.scope !101, !noalias !102
  %409 = insertelement <4 x float> poison, float %_p_scalar_636.us.us.us, i64 0
  %shuffle4037 = shufflevector <4 x float> %409, <4 x float> poison, <4 x i32> zeroinitializer
  %410 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4037, <4 x float> %394, <4 x float> %408)
  store <4 x float> %410, <4 x float>* %383, align 4, !alias.scope !101, !noalias !102
  %411 = load <4 x float>, <4 x float>* %384, align 4, !alias.scope !101, !noalias !102
  %412 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle4037, <4 x float> %401, <4 x float> %411)
  store <4 x float> %412, <4 x float>* %385, align 4, !alias.scope !101, !noalias !102
  %_p_scalar_780.us.us.us = load float, float* %polly.access.Packed_A779.us.us.us, align 4, !alias.scope !97, !noalias !98
  %413 = load <2 x float>, <2 x float>* %368, align 4, !alias.scope !101, !noalias !102
  %414 = insertelement <2 x float> poison, float %_p_scalar_780.us.us.us, i64 0
  %415 = shufflevector <2 x float> %414, <2 x float> poison, <2 x i32> zeroinitializer
  %416 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %415, <2 x float> %389, <2 x float> %413)
  store <2 x float> %416, <2 x float>* %369, align 4, !alias.scope !101, !noalias !102
  %417 = load <2 x float>, <2 x float>* %372, align 4, !alias.scope !101, !noalias !102
  %418 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %415, <2 x float> %391, <2 x float> %417)
  store <2 x float> %418, <2 x float>* %373, align 4, !alias.scope !101, !noalias !102
  %419 = load <2 x float>, <2 x float>* %374, align 4, !alias.scope !101, !noalias !102
  %420 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %415, <2 x float> %397, <2 x float> %419)
  store <2 x float> %420, <2 x float>* %375, align 4, !alias.scope !101, !noalias !102
  %421 = load <2 x float>, <2 x float>* %386, align 4, !alias.scope !101, !noalias !102
  %422 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %415, <2 x float> %399, <2 x float> %421)
  store <2 x float> %422, <2 x float>* %387, align 4, !alias.scope !101, !noalias !102
  %polly.indvar_next343.us.us.us = add nuw nsw i64 %polly.indvar342.us.us.us, 1
  %exitcond3855.not = icmp eq i64 %polly.indvar342.us.us.us, %smin3881
  br i1 %exitcond3855.not, label %polly.loop_exit340.loopexit.us.us.us, label %polly.stmt.for.body8.us.us.us.i899.us.us.us, !llvm.loop !105

polly.loop_exit340.loopexit.us.us.us:             ; preds = %polly.stmt.for.body8.us.us.us.i899.us.us.us
  %polly.indvar_next335.us.us.us = add nuw nsw i64 %polly.indvar334.us.us.us, 1
  %exitcond3859.not = icmp eq i64 %polly.indvar_next335.us.us.us, %183
  br i1 %exitcond3859.not, label %polly.cond917.us.us, label %polly.loop_if337.us.us.us

polly.loop_if2978.us.us.us:                       ; preds = %polly.loop_if2970.us.us, %polly.loop_exit2981.loopexit.us.us.us
  %polly.indvar2975.us.us.us = phi i64 [ %polly.indvar_next2976.us.us.us, %polly.loop_exit2981.loopexit.us.us.us ], [ 0, %polly.loop_if2970.us.us ]
  %423 = shl nsw i64 %polly.indvar2975.us.us.us, 2
  %424 = add nuw nsw i64 %423, %184
  %polly.access.mul.Packed_A2989.us.us.us = shl nsw i64 %polly.indvar2975.us.us.us, 9
  %425 = mul i64 %424, %call3
  %426 = add i64 %425, %112
  %scevgep3003.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %426
  %427 = or i64 %424, 2
  %.not3676.us.us.us = icmp slt i64 %call1, %427
  %428 = add i64 %425, %111
  %scevgep3028.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %428
  %429 = add i64 %428, 1
  %scevgep3053.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %429
  %430 = add i64 %428, 2
  %scevgep3078.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %430
  %431 = add i64 %428, 3
  %scevgep3103.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %431
  %432 = add i64 %428, 4
  %scevgep3128.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %432
  %433 = add i64 %425, %96
  %scevgep3152.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %433
  %434 = or i64 %424, 1
  %435 = mul i64 %434, %call3
  %436 = add i64 %435, %112
  %scevgep3176.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %436
  %437 = add i64 %435, %111
  %scevgep3201.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %437
  %438 = add i64 %437, 1
  %scevgep3226.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %438
  %439 = add i64 %437, 2
  %scevgep3251.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %439
  %440 = add i64 %437, 3
  %scevgep3276.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %440
  %441 = add i64 %437, 4
  %scevgep3301.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %441
  %442 = add i64 %435, %96
  %scevgep3325.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %442
  %443 = or i64 %424, 3
  %.not3677.us.us.us = icmp slt i64 %call1, %443
  %444 = mul i64 %427, %call3
  %445 = add i64 %444, %112
  %scevgep3349.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %445
  %446 = add i64 %444, %111
  %scevgep3374.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %446
  %447 = add i64 %446, 1
  %scevgep3399.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %447
  %448 = add i64 %446, 2
  %scevgep3424.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %448
  %449 = add i64 %446, 3
  %scevgep3449.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %449
  %450 = add i64 %446, 4
  %scevgep3474.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %450
  %451 = add i64 %444, %96
  %scevgep3498.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %451
  %452 = add nuw nsw i64 %424, 4
  %.not3678.us.us.us = icmp slt i64 %call1, %452
  %453 = mul i64 %443, %call3
  %454 = add i64 %453, %112
  %scevgep3522.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %454
  %455 = add i64 %453, %111
  %scevgep3547.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %455
  %456 = add i64 %455, 1
  %scevgep3572.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %456
  %457 = add i64 %455, 2
  %scevgep3597.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %457
  %458 = add i64 %455, 3
  %scevgep3622.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %458
  %459 = add i64 %455, 4
  %scevgep3647.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %459
  %460 = add i64 %453, %96
  %scevgep3671.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %460
  br label %polly.cond3006.us.us.us

polly.cond3006.us.us.us:                          ; preds = %polly.merge3156.us.us.us, %polly.loop_if2978.us.us.us
  %polly.indvar2983.us.us.us = phi i64 [ %polly.indvar_next2984.us.us.us, %polly.merge3156.us.us.us ], [ 0, %polly.loop_if2978.us.us.us ]
  %polly.access.add.Packed_A2990.us.us.us = add nuw nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_A2989.us.us.us
  %polly.access.mul.Packed_A2991.us.us.us = shl nsw i64 %polly.access.add.Packed_A2990.us.us.us, 2
  %polly.access.Packed_A2993.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2991.us.us.us
  %_p_scalar_2994.us.us.us = load float, float* %polly.access.Packed_A2993.us.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_B2998.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B2997.us
  %polly.access.mul.Packed_B2999.us.us.us = shl nsw i64 %polly.access.add.Packed_B2998.us.us.us, 3
  %polly.access.Packed_B3001.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2999.us.us.us
  %_p_scalar_3002.us.us.us = load float, float* %polly.access.Packed_B3001.us.us.us, align 32, !alias.scope !91, !noalias !92
  %_p_scalar_3004.us.us.us = load float, float* %scevgep3003.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3005.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3002.us.us.us, float %_p_scalar_3004.us.us.us) #17
  store float %p_3005.us.us.us, float* %scevgep3003.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %113, label %polly.cond3031.us.us.us, label %polly.cond3155.us.us.us.thread

polly.cond3031.us.us.us:                          ; preds = %polly.cond3006.us.us.us
  %polly.access.add.Packed_B3023.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3022.us
  %polly.access.mul.Packed_B3024.us.us.us = shl nsw i64 %polly.access.add.Packed_B3023.us.us.us, 3
  %polly.access.add.Packed_B3025.us.us.us = or i64 %polly.access.mul.Packed_B3024.us.us.us, 1
  %polly.access.Packed_B3026.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3025.us.us.us
  %_p_scalar_3027.us.us.us = load float, float* %polly.access.Packed_B3026.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3029.us.us.us = load float, float* %scevgep3028.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3030.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3027.us.us.us, float %_p_scalar_3029.us.us.us) #17
  store float %p_3030.us.us.us, float* %scevgep3028.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3694, label %polly.cond3155.us.us.us, label %polly.cond3056.us.us.us

polly.cond3056.us.us.us:                          ; preds = %polly.cond3031.us.us.us
  %polly.access.add.Packed_B3048.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3047.us
  %polly.access.mul.Packed_B3049.us.us.us = shl nsw i64 %polly.access.add.Packed_B3048.us.us.us, 3
  %polly.access.add.Packed_B3050.us.us.us = or i64 %polly.access.mul.Packed_B3049.us.us.us, 2
  %polly.access.Packed_B3051.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3050.us.us.us
  %_p_scalar_3052.us.us.us = load float, float* %polly.access.Packed_B3051.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3054.us.us.us = load float, float* %scevgep3053.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3055.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3052.us.us.us, float %_p_scalar_3054.us.us.us) #17
  store float %p_3055.us.us.us, float* %scevgep3053.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %116, label %polly.cond3081.us.us.us, label %polly.cond3155.us.us.us

polly.cond3081.us.us.us:                          ; preds = %polly.cond3056.us.us.us
  %polly.access.add.Packed_B3075.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 3
  %polly.access.Packed_B3076.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3075.us.us.us
  %_p_scalar_3077.us.us.us = load float, float* %polly.access.Packed_B3076.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3079.us.us.us = load float, float* %scevgep3078.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3080.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3077.us.us.us, float %_p_scalar_3079.us.us.us) #17
  store float %p_3080.us.us.us, float* %scevgep3078.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3696, label %polly.cond3155.us.us.us, label %polly.cond3106.us.us.us

polly.cond3106.us.us.us:                          ; preds = %polly.cond3081.us.us.us
  %polly.access.add.Packed_B3100.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 4
  %polly.access.Packed_B3101.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3100.us.us.us
  %_p_scalar_3102.us.us.us = load float, float* %polly.access.Packed_B3101.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_3104.us.us.us = load float, float* %scevgep3103.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3105.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3102.us.us.us, float %_p_scalar_3104.us.us.us) #17
  store float %p_3105.us.us.us, float* %scevgep3103.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %117, label %polly.cond3131.us.us.us, label %polly.cond3155.us.us.us

polly.cond3131.us.us.us:                          ; preds = %polly.cond3106.us.us.us
  %polly.access.add.Packed_B3125.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 5
  %polly.access.Packed_B3126.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3125.us.us.us
  %_p_scalar_3127.us.us.us = load float, float* %polly.access.Packed_B3126.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3129.us.us.us = load float, float* %scevgep3128.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3130.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3127.us.us.us, float %_p_scalar_3129.us.us.us) #17
  store float %p_3130.us.us.us, float* %scevgep3128.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %120, label %polly.stmt.for.body8.us.us.us.i3136.us.us.us, label %polly.cond3155.us.us.us

polly.stmt.for.body8.us.us.us.i3136.us.us.us:     ; preds = %polly.cond3131.us.us.us
  %polly.access.add.Packed_B3147.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3146.us
  %polly.access.mul.Packed_B3148.us.us.us = shl nsw i64 %polly.access.add.Packed_B3147.us.us.us, 3
  %polly.access.add.Packed_B3149.us.us.us = or i64 %polly.access.mul.Packed_B3148.us.us.us, 6
  %polly.access.Packed_B3150.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3149.us.us.us
  %_p_scalar_3151.us.us.us = load float, float* %polly.access.Packed_B3150.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3153.us.us.us = load float, float* %scevgep3152.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3154.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2994.us.us.us, float %_p_scalar_3151.us.us.us, float %_p_scalar_3153.us.us.us) #17
  store float %p_3154.us.us.us, float* %scevgep3152.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond3155.us.us.us

polly.cond3155.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us.i3136.us.us.us, %polly.cond3131.us.us.us, %polly.cond3106.us.us.us, %polly.cond3081.us.us.us, %polly.cond3056.us.us.us, %polly.cond3031.us.us.us
  br i1 %.not3676.us.us.us, label %polly.merge3156.us.us.us, label %polly.cond3179.us.us.us

polly.cond3155.us.us.us.thread:                   ; preds = %polly.cond3006.us.us.us
  br i1 %.not3676.us.us.us, label %polly.merge3156.us.us.us, label %polly.cond3179.us.us.us.thread

polly.cond3179.us.us.us.thread:                   ; preds = %polly.cond3155.us.us.us.thread
  %polly.access.add.Packed_A3165.us.us.us3891 = or i64 %polly.access.mul.Packed_A2991.us.us.us, 1
  %polly.access.Packed_A3166.us.us.us3892 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3165.us.us.us3891
  %_p_scalar_3167.us.us.us3893 = load float, float* %polly.access.Packed_A3166.us.us.us3892, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_3177.us.us.us3894 = load float, float* %scevgep3176.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3178.us.us.us3895 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us3893, float %_p_scalar_3002.us.us.us, float %_p_scalar_3177.us.us.us3894) #17
  store float %p_3178.us.us.us3895, float* %scevgep3176.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond3328.us.us.us

polly.cond3179.us.us.us:                          ; preds = %polly.cond3155.us.us.us
  %polly.access.add.Packed_A3165.us.us.us = or i64 %polly.access.mul.Packed_A2991.us.us.us, 1
  %polly.access.Packed_A3166.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3165.us.us.us
  %_p_scalar_3167.us.us.us = load float, float* %polly.access.Packed_A3166.us.us.us, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_3177.us.us.us = load float, float* %scevgep3176.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3178.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3002.us.us.us, float %_p_scalar_3177.us.us.us) #17
  store float %p_3178.us.us.us, float* %scevgep3176.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %113, label %polly.cond3204.us.us.us, label %polly.cond3328.us.us.us

polly.cond3204.us.us.us:                          ; preds = %polly.cond3179.us.us.us
  %polly.access.add.Packed_B3196.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3022.us
  %polly.access.mul.Packed_B3197.us.us.us = shl nsw i64 %polly.access.add.Packed_B3196.us.us.us, 3
  %polly.access.add.Packed_B3198.us.us.us = or i64 %polly.access.mul.Packed_B3197.us.us.us, 1
  %polly.access.Packed_B3199.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3198.us.us.us
  %_p_scalar_3200.us.us.us = load float, float* %polly.access.Packed_B3199.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3202.us.us.us = load float, float* %scevgep3201.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3203.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3200.us.us.us, float %_p_scalar_3202.us.us.us) #17
  store float %p_3203.us.us.us, float* %scevgep3201.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3694, label %polly.cond3328.us.us.us, label %polly.cond3229.us.us.us

polly.cond3229.us.us.us:                          ; preds = %polly.cond3204.us.us.us
  %polly.access.add.Packed_B3221.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3047.us
  %polly.access.mul.Packed_B3222.us.us.us = shl nsw i64 %polly.access.add.Packed_B3221.us.us.us, 3
  %polly.access.add.Packed_B3223.us.us.us = or i64 %polly.access.mul.Packed_B3222.us.us.us, 2
  %polly.access.Packed_B3224.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3223.us.us.us
  %_p_scalar_3225.us.us.us = load float, float* %polly.access.Packed_B3224.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3227.us.us.us = load float, float* %scevgep3226.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3228.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3225.us.us.us, float %_p_scalar_3227.us.us.us) #17
  store float %p_3228.us.us.us, float* %scevgep3226.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %116, label %polly.cond3254.us.us.us, label %polly.cond3328.us.us.us

polly.cond3254.us.us.us:                          ; preds = %polly.cond3229.us.us.us
  %polly.access.add.Packed_B3248.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 3
  %polly.access.Packed_B3249.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3248.us.us.us
  %_p_scalar_3250.us.us.us = load float, float* %polly.access.Packed_B3249.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3252.us.us.us = load float, float* %scevgep3251.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3253.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3250.us.us.us, float %_p_scalar_3252.us.us.us) #17
  store float %p_3253.us.us.us, float* %scevgep3251.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3696, label %polly.cond3328.us.us.us, label %polly.cond3279.us.us.us

polly.cond3279.us.us.us:                          ; preds = %polly.cond3254.us.us.us
  %polly.access.add.Packed_B3273.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 4
  %polly.access.Packed_B3274.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3273.us.us.us
  %_p_scalar_3275.us.us.us = load float, float* %polly.access.Packed_B3274.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_3277.us.us.us = load float, float* %scevgep3276.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3278.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3275.us.us.us, float %_p_scalar_3277.us.us.us) #17
  store float %p_3278.us.us.us, float* %scevgep3276.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %117, label %polly.cond3304.us.us.us, label %polly.cond3328.us.us.us

polly.cond3304.us.us.us:                          ; preds = %polly.cond3279.us.us.us
  %polly.access.add.Packed_B3298.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 5
  %polly.access.Packed_B3299.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3298.us.us.us
  %_p_scalar_3300.us.us.us = load float, float* %polly.access.Packed_B3299.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3302.us.us.us = load float, float* %scevgep3301.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3303.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3300.us.us.us, float %_p_scalar_3302.us.us.us) #17
  store float %p_3303.us.us.us, float* %scevgep3301.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %120, label %polly.stmt.for.body8.us.us.us.i3309.us.us.us, label %polly.cond3328.us.us.us

polly.stmt.for.body8.us.us.us.i3309.us.us.us:     ; preds = %polly.cond3304.us.us.us
  %polly.access.add.Packed_B3320.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3146.us
  %polly.access.mul.Packed_B3321.us.us.us = shl nsw i64 %polly.access.add.Packed_B3320.us.us.us, 3
  %polly.access.add.Packed_B3322.us.us.us = or i64 %polly.access.mul.Packed_B3321.us.us.us, 6
  %polly.access.Packed_B3323.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3322.us.us.us
  %_p_scalar_3324.us.us.us = load float, float* %polly.access.Packed_B3323.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3326.us.us.us = load float, float* %scevgep3325.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3327.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3167.us.us.us, float %_p_scalar_3324.us.us.us, float %_p_scalar_3326.us.us.us) #17
  store float %p_3327.us.us.us, float* %scevgep3325.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond3328.us.us.us

polly.cond3328.us.us.us:                          ; preds = %polly.cond3179.us.us.us.thread, %polly.stmt.for.body8.us.us.us.i3309.us.us.us, %polly.cond3304.us.us.us, %polly.cond3279.us.us.us, %polly.cond3254.us.us.us, %polly.cond3229.us.us.us, %polly.cond3204.us.us.us, %polly.cond3179.us.us.us
  br i1 %.not3677.us.us.us, label %polly.merge3156.us.us.us, label %polly.cond3352.us.us.us

polly.cond3352.us.us.us:                          ; preds = %polly.cond3328.us.us.us
  %polly.access.add.Packed_A3338.us.us.us = or i64 %polly.access.mul.Packed_A2991.us.us.us, 2
  %polly.access.Packed_A3339.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3338.us.us.us
  %_p_scalar_3340.us.us.us = load float, float* %polly.access.Packed_A3339.us.us.us, align 8, !alias.scope !97, !noalias !98
  %_p_scalar_3350.us.us.us = load float, float* %scevgep3349.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3351.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3002.us.us.us, float %_p_scalar_3350.us.us.us) #17
  store float %p_3351.us.us.us, float* %scevgep3349.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %113, label %polly.cond3377.us.us.us, label %polly.cond3501.us.us.us.thread

polly.cond3377.us.us.us:                          ; preds = %polly.cond3352.us.us.us
  %polly.access.add.Packed_B3369.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3022.us
  %polly.access.mul.Packed_B3370.us.us.us = shl nsw i64 %polly.access.add.Packed_B3369.us.us.us, 3
  %polly.access.add.Packed_B3371.us.us.us = or i64 %polly.access.mul.Packed_B3370.us.us.us, 1
  %polly.access.Packed_B3372.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3371.us.us.us
  %_p_scalar_3373.us.us.us = load float, float* %polly.access.Packed_B3372.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3375.us.us.us = load float, float* %scevgep3374.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3376.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3373.us.us.us, float %_p_scalar_3375.us.us.us) #17
  store float %p_3376.us.us.us, float* %scevgep3374.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3694, label %polly.cond3501.us.us.us, label %polly.cond3402.us.us.us

polly.cond3402.us.us.us:                          ; preds = %polly.cond3377.us.us.us
  %polly.access.add.Packed_B3394.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3047.us
  %polly.access.mul.Packed_B3395.us.us.us = shl nsw i64 %polly.access.add.Packed_B3394.us.us.us, 3
  %polly.access.add.Packed_B3396.us.us.us = or i64 %polly.access.mul.Packed_B3395.us.us.us, 2
  %polly.access.Packed_B3397.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3396.us.us.us
  %_p_scalar_3398.us.us.us = load float, float* %polly.access.Packed_B3397.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3400.us.us.us = load float, float* %scevgep3399.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3401.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3398.us.us.us, float %_p_scalar_3400.us.us.us) #17
  store float %p_3401.us.us.us, float* %scevgep3399.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %116, label %polly.cond3427.us.us.us, label %polly.cond3501.us.us.us

polly.cond3427.us.us.us:                          ; preds = %polly.cond3402.us.us.us
  %polly.access.add.Packed_B3421.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 3
  %polly.access.Packed_B3422.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3421.us.us.us
  %_p_scalar_3423.us.us.us = load float, float* %polly.access.Packed_B3422.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3425.us.us.us = load float, float* %scevgep3424.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3426.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3423.us.us.us, float %_p_scalar_3425.us.us.us) #17
  store float %p_3426.us.us.us, float* %scevgep3424.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3696, label %polly.cond3501.us.us.us, label %polly.cond3452.us.us.us

polly.cond3452.us.us.us:                          ; preds = %polly.cond3427.us.us.us
  %polly.access.add.Packed_B3446.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 4
  %polly.access.Packed_B3447.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3446.us.us.us
  %_p_scalar_3448.us.us.us = load float, float* %polly.access.Packed_B3447.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_3450.us.us.us = load float, float* %scevgep3449.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3451.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3448.us.us.us, float %_p_scalar_3450.us.us.us) #17
  store float %p_3451.us.us.us, float* %scevgep3449.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %117, label %polly.cond3477.us.us.us, label %polly.cond3501.us.us.us

polly.cond3477.us.us.us:                          ; preds = %polly.cond3452.us.us.us
  %polly.access.add.Packed_B3471.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 5
  %polly.access.Packed_B3472.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3471.us.us.us
  %_p_scalar_3473.us.us.us = load float, float* %polly.access.Packed_B3472.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3475.us.us.us = load float, float* %scevgep3474.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3476.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3473.us.us.us, float %_p_scalar_3475.us.us.us) #17
  store float %p_3476.us.us.us, float* %scevgep3474.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %120, label %polly.stmt.for.body8.us.us.us.i3482.us.us.us, label %polly.cond3501.us.us.us

polly.stmt.for.body8.us.us.us.i3482.us.us.us:     ; preds = %polly.cond3477.us.us.us
  %polly.access.add.Packed_B3493.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3146.us
  %polly.access.mul.Packed_B3494.us.us.us = shl nsw i64 %polly.access.add.Packed_B3493.us.us.us, 3
  %polly.access.add.Packed_B3495.us.us.us = or i64 %polly.access.mul.Packed_B3494.us.us.us, 6
  %polly.access.Packed_B3496.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3495.us.us.us
  %_p_scalar_3497.us.us.us = load float, float* %polly.access.Packed_B3496.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3499.us.us.us = load float, float* %scevgep3498.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3500.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3340.us.us.us, float %_p_scalar_3497.us.us.us, float %_p_scalar_3499.us.us.us) #17
  store float %p_3500.us.us.us, float* %scevgep3498.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond3501.us.us.us

polly.cond3501.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us.i3482.us.us.us, %polly.cond3477.us.us.us, %polly.cond3452.us.us.us, %polly.cond3427.us.us.us, %polly.cond3402.us.us.us, %polly.cond3377.us.us.us
  br i1 %.not3678.us.us.us, label %polly.merge3156.us.us.us, label %polly.cond3525.us.us.us

polly.cond3501.us.us.us.thread:                   ; preds = %polly.cond3352.us.us.us
  br i1 %.not3678.us.us.us, label %polly.merge3156.us.us.us, label %polly.cond3525.us.us.us.thread

polly.cond3525.us.us.us.thread:                   ; preds = %polly.cond3501.us.us.us.thread
  %polly.access.add.Packed_A3511.us.us.us3896 = or i64 %polly.access.mul.Packed_A2991.us.us.us, 3
  %polly.access.Packed_A3512.us.us.us3897 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3511.us.us.us3896
  %_p_scalar_3513.us.us.us3898 = load float, float* %polly.access.Packed_A3512.us.us.us3897, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_3523.us.us.us3899 = load float, float* %scevgep3522.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3524.us.us.us3900 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us3898, float %_p_scalar_3002.us.us.us, float %_p_scalar_3523.us.us.us3899) #17
  store float %p_3524.us.us.us3900, float* %scevgep3522.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge3156.us.us.us

polly.cond3525.us.us.us:                          ; preds = %polly.cond3501.us.us.us
  %polly.access.add.Packed_A3511.us.us.us = or i64 %polly.access.mul.Packed_A2991.us.us.us, 3
  %polly.access.Packed_A3512.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3511.us.us.us
  %_p_scalar_3513.us.us.us = load float, float* %polly.access.Packed_A3512.us.us.us, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_3523.us.us.us = load float, float* %scevgep3522.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3524.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3002.us.us.us, float %_p_scalar_3523.us.us.us) #17
  store float %p_3524.us.us.us, float* %scevgep3522.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %113, label %polly.cond3550.us.us.us, label %polly.merge3156.us.us.us

polly.cond3550.us.us.us:                          ; preds = %polly.cond3525.us.us.us
  %polly.access.add.Packed_B3542.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3022.us
  %polly.access.mul.Packed_B3543.us.us.us = shl nsw i64 %polly.access.add.Packed_B3542.us.us.us, 3
  %polly.access.add.Packed_B3544.us.us.us = or i64 %polly.access.mul.Packed_B3543.us.us.us, 1
  %polly.access.Packed_B3545.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3544.us.us.us
  %_p_scalar_3546.us.us.us = load float, float* %polly.access.Packed_B3545.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3548.us.us.us = load float, float* %scevgep3547.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3549.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3546.us.us.us, float %_p_scalar_3548.us.us.us) #17
  store float %p_3549.us.us.us, float* %scevgep3547.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3694, label %polly.merge3156.us.us.us, label %polly.cond3575.us.us.us

polly.cond3575.us.us.us:                          ; preds = %polly.cond3550.us.us.us
  %polly.access.add.Packed_B3567.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3047.us
  %polly.access.mul.Packed_B3568.us.us.us = shl nsw i64 %polly.access.add.Packed_B3567.us.us.us, 3
  %polly.access.add.Packed_B3569.us.us.us = or i64 %polly.access.mul.Packed_B3568.us.us.us, 2
  %polly.access.Packed_B3570.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3569.us.us.us
  %_p_scalar_3571.us.us.us = load float, float* %polly.access.Packed_B3570.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3573.us.us.us = load float, float* %scevgep3572.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3574.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3571.us.us.us, float %_p_scalar_3573.us.us.us) #17
  store float %p_3574.us.us.us, float* %scevgep3572.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %116, label %polly.cond3600.us.us.us, label %polly.merge3156.us.us.us

polly.cond3600.us.us.us:                          ; preds = %polly.cond3575.us.us.us
  %polly.access.add.Packed_B3594.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 3
  %polly.access.Packed_B3595.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3594.us.us.us
  %_p_scalar_3596.us.us.us = load float, float* %polly.access.Packed_B3595.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3598.us.us.us = load float, float* %scevgep3597.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3599.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3596.us.us.us, float %_p_scalar_3598.us.us.us) #17
  store float %p_3599.us.us.us, float* %scevgep3597.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3696, label %polly.merge3156.us.us.us, label %polly.cond3625.us.us.us

polly.cond3625.us.us.us:                          ; preds = %polly.cond3600.us.us.us
  %polly.access.add.Packed_B3619.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 4
  %polly.access.Packed_B3620.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3619.us.us.us
  %_p_scalar_3621.us.us.us = load float, float* %polly.access.Packed_B3620.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_3623.us.us.us = load float, float* %scevgep3622.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3624.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3621.us.us.us, float %_p_scalar_3623.us.us.us) #17
  store float %p_3624.us.us.us, float* %scevgep3622.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %117, label %polly.cond3650.us.us.us, label %polly.merge3156.us.us.us

polly.cond3650.us.us.us:                          ; preds = %polly.cond3625.us.us.us
  %polly.access.add.Packed_B3644.us.us.us = or i64 %polly.access.mul.Packed_B2999.us.us.us, 5
  %polly.access.Packed_B3645.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3644.us.us.us
  %_p_scalar_3646.us.us.us = load float, float* %polly.access.Packed_B3645.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_3648.us.us.us = load float, float* %scevgep3647.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3649.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3646.us.us.us, float %_p_scalar_3648.us.us.us) #17
  store float %p_3649.us.us.us, float* %scevgep3647.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %120, label %polly.stmt.for.body8.us.us.us.i3655.us.us.us, label %polly.merge3156.us.us.us

polly.stmt.for.body8.us.us.us.i3655.us.us.us:     ; preds = %polly.cond3650.us.us.us
  %polly.access.add.Packed_B3666.us.us.us = add nsw i64 %polly.indvar2983.us.us.us, %polly.access.mul.Packed_B3146.us
  %polly.access.mul.Packed_B3667.us.us.us = shl nsw i64 %polly.access.add.Packed_B3666.us.us.us, 3
  %polly.access.add.Packed_B3668.us.us.us = or i64 %polly.access.mul.Packed_B3667.us.us.us, 6
  %polly.access.Packed_B3669.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3668.us.us.us
  %_p_scalar_3670.us.us.us = load float, float* %polly.access.Packed_B3669.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_3672.us.us.us = load float, float* %scevgep3671.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_3673.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3513.us.us.us, float %_p_scalar_3670.us.us.us, float %_p_scalar_3672.us.us.us) #17
  store float %p_3673.us.us.us, float* %scevgep3671.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge3156.us.us.us

polly.merge3156.us.us.us:                         ; preds = %polly.cond3525.us.us.us.thread, %polly.cond3501.us.us.us.thread, %polly.cond3155.us.us.us.thread, %polly.stmt.for.body8.us.us.us.i3655.us.us.us, %polly.cond3650.us.us.us, %polly.cond3625.us.us.us, %polly.cond3600.us.us.us, %polly.cond3575.us.us.us, %polly.cond3550.us.us.us, %polly.cond3525.us.us.us, %polly.cond3501.us.us.us, %polly.cond3328.us.us.us, %polly.cond3155.us.us.us
  %polly.indvar_next2984.us.us.us = add nuw nsw i64 %polly.indvar2983.us.us.us, 1
  %exitcond3870.not = icmp eq i64 %polly.indvar2983.us.us.us, %smin3881
  br i1 %exitcond3870.not, label %polly.loop_exit2981.loopexit.us.us.us, label %polly.cond3006.us.us.us, !llvm.loop !106

polly.loop_exit2981.loopexit.us.us.us:            ; preds = %polly.merge3156.us.us.us
  %polly.indvar_next2976.us.us.us = add nuw nsw i64 %polly.indvar2975.us.us.us, 1
  %exitcond3874.not = icmp eq i64 %polly.indvar2975.us.us.us, %smin3883
  br i1 %exitcond3874.not, label %polly.merge1839.us.us, label %polly.loop_if2978.us.us.us

polly.loop_if2461.us.us.us:                       ; preds = %polly.loop_if2461.preheader.us.us, %polly.loop_exit2464.loopexit.us.us.us
  %polly.indvar2458.us.us.us = phi i64 [ %polly.indvar_next2459.us.us.us, %polly.loop_exit2464.loopexit.us.us.us ], [ 0, %polly.loop_if2461.preheader.us.us ]
  %461 = shl nsw i64 %polly.indvar2458.us.us.us, 3
  %462 = add nuw nsw i64 %461, %129
  %polly.access.mul.Packed_B2477.us.us.us = shl nsw i64 %polly.indvar2458.us.us.us, 9
  %463 = add i64 %462, %320
  %scevgep2483.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %463
  %464 = or i64 %462, 2
  %.not3699.us.us.us = icmp slt i64 %call3, %464
  %465 = add i64 %322, %462
  %scevgep2504.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %465
  %466 = or i64 %462, 3
  %.not3713.us.us.us = icmp slt i64 %call3, %466
  %467 = add i64 %464, %320
  %scevgep2525.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %467
  %468 = or i64 %462, 4
  %.not3714.us.us.us = icmp slt i64 %call3, %468
  %469 = add i64 %466, %320
  %scevgep2546.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %469
  %470 = or i64 %462, 5
  %.not3715.us.us.us = icmp slt i64 %call3, %470
  %471 = add i64 %468, %320
  %scevgep2567.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %471
  %472 = or i64 %462, 6
  %.not3716.us.us.us = icmp slt i64 %call3, %472
  %473 = add i64 %470, %320
  %scevgep2588.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %473
  %474 = or i64 %462, 7
  %.not3717.us.us.us = icmp slt i64 %call3, %474
  %475 = add i64 %472, %320
  %scevgep2609.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %475
  %476 = add nuw nsw i64 %462, 8
  %.not3718.us.us.us = icmp slt i64 %call3, %476
  %477 = add i64 %474, %320
  %scevgep2630.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %477
  %478 = add i64 %462, %324
  %scevgep2651.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %478
  %479 = add i64 %325, %462
  %scevgep2672.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %479
  %480 = add i64 %464, %324
  %scevgep2693.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %480
  %481 = add i64 %466, %324
  %scevgep2714.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %481
  %482 = add i64 %468, %324
  %scevgep2735.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %482
  %483 = add i64 %470, %324
  %scevgep2756.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %483
  %484 = add i64 %472, %324
  %scevgep2777.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %484
  %485 = add i64 %474, %324
  %scevgep2798.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %485
  %486 = add i64 %462, %110
  %scevgep2819.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %486
  %487 = add i64 %122, %462
  %scevgep2840.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %487
  %488 = add i64 %464, %110
  %scevgep2861.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %488
  %489 = add i64 %466, %110
  %scevgep2882.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %489
  %490 = add i64 %468, %110
  %scevgep2903.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %490
  %491 = add i64 %470, %110
  %scevgep2924.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %491
  %492 = add i64 %472, %110
  %scevgep2945.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %492
  %493 = add i64 %474, %110
  %scevgep2966.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %493
  br label %polly.cond2486.us.us.us

polly.cond2486.us.us.us:                          ; preds = %polly.merge2634.us.us.us, %polly.loop_if2461.us.us.us
  %polly.indvar2466.us.us.us = phi i64 [ %polly.indvar_next2467.us.us.us, %polly.merge2634.us.us.us ], [ 0, %polly.loop_if2461.us.us.us ]
  %polly.access.mul.Packed_A2472.us.us.us = shl nsw i64 %polly.indvar2466.us.us.us, 2
  %polly.access.Packed_A2474.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2472.us.us.us
  %_p_scalar_2475.us.us.us = load float, float* %polly.access.Packed_A2474.us.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.add.Packed_B2478.us.us.us = add nuw nsw i64 %polly.indvar2466.us.us.us, %polly.access.mul.Packed_B2477.us.us.us
  %polly.access.mul.Packed_B2479.us.us.us = shl nsw i64 %polly.access.add.Packed_B2478.us.us.us, 3
  %polly.access.Packed_B2481.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2479.us.us.us
  %_p_scalar_2482.us.us.us = load float, float* %polly.access.Packed_B2481.us.us.us, align 32, !alias.scope !91, !noalias !92
  %_p_scalar_2484.us.us.us = load float, float* %scevgep2483.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2485.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2482.us.us.us, float %_p_scalar_2484.us.us.us) #17
  store float %p_2485.us.us.us, float* %scevgep2483.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3699.us.us.us, label %polly.cond2633.us.us.us.thread, label %polly.cond2507.us.us.us

polly.cond2507.us.us.us:                          ; preds = %polly.cond2486.us.us.us
  %polly.access.add.Packed_B2501.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 1
  %polly.access.Packed_B2502.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2501.us.us.us
  %_p_scalar_2503.us.us.us = load float, float* %polly.access.Packed_B2502.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2505.us.us.us = load float, float* %scevgep2504.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2506.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2503.us.us.us, float %_p_scalar_2505.us.us.us) #17
  store float %p_2506.us.us.us, float* %scevgep2504.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3713.us.us.us, label %polly.cond2633.us.us.us, label %polly.cond2528.us.us.us

polly.cond2528.us.us.us:                          ; preds = %polly.cond2507.us.us.us
  %polly.access.add.Packed_B2522.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 2
  %polly.access.Packed_B2523.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2522.us.us.us
  %_p_scalar_2524.us.us.us = load float, float* %polly.access.Packed_B2523.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2526.us.us.us = load float, float* %scevgep2525.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2527.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2524.us.us.us, float %_p_scalar_2526.us.us.us) #17
  store float %p_2527.us.us.us, float* %scevgep2525.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3714.us.us.us, label %polly.cond2633.us.us.us, label %polly.cond2549.us.us.us

polly.cond2549.us.us.us:                          ; preds = %polly.cond2528.us.us.us
  %polly.access.add.Packed_B2543.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 3
  %polly.access.Packed_B2544.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2543.us.us.us
  %_p_scalar_2545.us.us.us = load float, float* %polly.access.Packed_B2544.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2547.us.us.us = load float, float* %scevgep2546.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2548.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2545.us.us.us, float %_p_scalar_2547.us.us.us) #17
  store float %p_2548.us.us.us, float* %scevgep2546.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3715.us.us.us, label %polly.cond2633.us.us.us, label %polly.cond2570.us.us.us

polly.cond2570.us.us.us:                          ; preds = %polly.cond2549.us.us.us
  %polly.access.add.Packed_B2564.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 4
  %polly.access.Packed_B2565.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2564.us.us.us
  %_p_scalar_2566.us.us.us = load float, float* %polly.access.Packed_B2565.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2568.us.us.us = load float, float* %scevgep2567.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2569.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2566.us.us.us, float %_p_scalar_2568.us.us.us) #17
  store float %p_2569.us.us.us, float* %scevgep2567.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3716.us.us.us, label %polly.cond2633.us.us.us, label %polly.cond2591.us.us.us

polly.cond2591.us.us.us:                          ; preds = %polly.cond2570.us.us.us
  %polly.access.add.Packed_B2585.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 5
  %polly.access.Packed_B2586.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2585.us.us.us
  %_p_scalar_2587.us.us.us = load float, float* %polly.access.Packed_B2586.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2589.us.us.us = load float, float* %scevgep2588.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2590.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2587.us.us.us, float %_p_scalar_2589.us.us.us) #17
  store float %p_2590.us.us.us, float* %scevgep2588.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3717.us.us.us, label %polly.cond2633.us.us.us, label %polly.cond2612.us.us.us

polly.cond2612.us.us.us:                          ; preds = %polly.cond2591.us.us.us
  %polly.access.add.Packed_B2606.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 6
  %polly.access.Packed_B2607.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2606.us.us.us
  %_p_scalar_2608.us.us.us = load float, float* %polly.access.Packed_B2607.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2610.us.us.us = load float, float* %scevgep2609.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2611.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2608.us.us.us, float %_p_scalar_2610.us.us.us) #17
  store float %p_2611.us.us.us, float* %scevgep2609.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3718.us.us.us, label %polly.cond2633.us.us.us, label %polly.stmt.for.body8.us.us.us.i2616.us.us.us

polly.stmt.for.body8.us.us.us.i2616.us.us.us:     ; preds = %polly.cond2612.us.us.us
  %polly.access.add.Packed_B2627.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 7
  %polly.access.Packed_B2628.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2627.us.us.us
  %_p_scalar_2629.us.us.us = load float, float* %polly.access.Packed_B2628.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2631.us.us.us = load float, float* %scevgep2630.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2632.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2475.us.us.us, float %_p_scalar_2629.us.us.us, float %_p_scalar_2631.us.us.us) #17
  store float %p_2632.us.us.us, float* %scevgep2630.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2633.us.us.us

polly.cond2633.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us.i2616.us.us.us, %polly.cond2612.us.us.us, %polly.cond2591.us.us.us, %polly.cond2570.us.us.us, %polly.cond2549.us.us.us, %polly.cond2528.us.us.us, %polly.cond2507.us.us.us
  br i1 %.not3700.us.us, label %polly.merge2634.us.us.us, label %polly.cond2654.us.us.us

polly.cond2633.us.us.us.thread:                   ; preds = %polly.cond2486.us.us.us
  br i1 %.not3700.us.us, label %polly.merge2634.us.us.us, label %polly.cond2654.us.us.us.thread

polly.cond2654.us.us.us.thread:                   ; preds = %polly.cond2633.us.us.us.thread
  %polly.access.add.Packed_A2641.us.us.us3901 = or i64 %polly.access.mul.Packed_A2472.us.us.us, 1
  %polly.access.Packed_A2642.us.us.us3902 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2641.us.us.us3901
  %_p_scalar_2643.us.us.us3903 = load float, float* %polly.access.Packed_A2642.us.us.us3902, align 4, !alias.scope !97, !noalias !98
  br label %polly.cond2801.us.us.us.sink.split

polly.cond2654.us.us.us:                          ; preds = %polly.cond2633.us.us.us
  %polly.access.add.Packed_A2641.us.us.us = or i64 %polly.access.mul.Packed_A2472.us.us.us, 1
  %polly.access.Packed_A2642.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2641.us.us.us
  %_p_scalar_2643.us.us.us = load float, float* %polly.access.Packed_A2642.us.us.us, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_2652.us.us.us = load float, float* %scevgep2651.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2653.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2482.us.us.us, float %_p_scalar_2652.us.us.us) #17
  store float %p_2653.us.us.us, float* %scevgep2651.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3699.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2675.us.us.us

polly.cond2675.us.us.us:                          ; preds = %polly.cond2654.us.us.us
  %polly.access.add.Packed_B2669.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 1
  %polly.access.Packed_B2670.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2669.us.us.us
  %_p_scalar_2671.us.us.us = load float, float* %polly.access.Packed_B2670.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2673.us.us.us = load float, float* %scevgep2672.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2674.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2671.us.us.us, float %_p_scalar_2673.us.us.us) #17
  store float %p_2674.us.us.us, float* %scevgep2672.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3713.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2696.us.us.us

polly.cond2696.us.us.us:                          ; preds = %polly.cond2675.us.us.us
  %polly.access.add.Packed_B2690.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 2
  %polly.access.Packed_B2691.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2690.us.us.us
  %_p_scalar_2692.us.us.us = load float, float* %polly.access.Packed_B2691.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2694.us.us.us = load float, float* %scevgep2693.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2695.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2692.us.us.us, float %_p_scalar_2694.us.us.us) #17
  store float %p_2695.us.us.us, float* %scevgep2693.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3714.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2717.us.us.us

polly.cond2717.us.us.us:                          ; preds = %polly.cond2696.us.us.us
  %polly.access.add.Packed_B2711.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 3
  %polly.access.Packed_B2712.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2711.us.us.us
  %_p_scalar_2713.us.us.us = load float, float* %polly.access.Packed_B2712.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2715.us.us.us = load float, float* %scevgep2714.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2716.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2713.us.us.us, float %_p_scalar_2715.us.us.us) #17
  store float %p_2716.us.us.us, float* %scevgep2714.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3715.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2738.us.us.us

polly.cond2738.us.us.us:                          ; preds = %polly.cond2717.us.us.us
  %polly.access.add.Packed_B2732.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 4
  %polly.access.Packed_B2733.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2732.us.us.us
  %_p_scalar_2734.us.us.us = load float, float* %polly.access.Packed_B2733.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2736.us.us.us = load float, float* %scevgep2735.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2737.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2734.us.us.us, float %_p_scalar_2736.us.us.us) #17
  store float %p_2737.us.us.us, float* %scevgep2735.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3716.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2759.us.us.us

polly.cond2759.us.us.us:                          ; preds = %polly.cond2738.us.us.us
  %polly.access.add.Packed_B2753.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 5
  %polly.access.Packed_B2754.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2753.us.us.us
  %_p_scalar_2755.us.us.us = load float, float* %polly.access.Packed_B2754.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2757.us.us.us = load float, float* %scevgep2756.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2758.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2755.us.us.us, float %_p_scalar_2757.us.us.us) #17
  store float %p_2758.us.us.us, float* %scevgep2756.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3717.us.us.us, label %polly.cond2801.us.us.us, label %polly.cond2780.us.us.us

polly.cond2780.us.us.us:                          ; preds = %polly.cond2759.us.us.us
  %polly.access.add.Packed_B2774.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 6
  %polly.access.Packed_B2775.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2774.us.us.us
  %_p_scalar_2776.us.us.us = load float, float* %polly.access.Packed_B2775.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2778.us.us.us = load float, float* %scevgep2777.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2779.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us, float %_p_scalar_2776.us.us.us, float %_p_scalar_2778.us.us.us) #17
  store float %p_2779.us.us.us, float* %scevgep2777.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3718.us.us.us, label %polly.cond2801.us.us.us, label %polly.stmt.for.body8.us.us.us.i2784.us.us.us

polly.stmt.for.body8.us.us.us.i2784.us.us.us:     ; preds = %polly.cond2780.us.us.us
  %polly.access.add.Packed_B2795.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 7
  %polly.access.Packed_B2796.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2795.us.us.us
  %_p_scalar_2797.us.us.us = load float, float* %polly.access.Packed_B2796.us.us.us, align 4, !alias.scope !91, !noalias !92
  br label %polly.cond2801.us.us.us.sink.split

polly.cond2801.us.us.us.sink.split:               ; preds = %polly.stmt.for.body8.us.us.us.i2784.us.us.us, %polly.cond2654.us.us.us.thread
  %scevgep2651.us.us.us.sink3924 = phi float* [ %scevgep2651.us.us.us, %polly.cond2654.us.us.us.thread ], [ %scevgep2798.us.us.us, %polly.stmt.for.body8.us.us.us.i2784.us.us.us ]
  %_p_scalar_2482.us.us.us.sink = phi float [ %_p_scalar_2482.us.us.us, %polly.cond2654.us.us.us.thread ], [ %_p_scalar_2797.us.us.us, %polly.stmt.for.body8.us.us.us.i2784.us.us.us ]
  %_p_scalar_2643.us.us.us3903.sink = phi float [ %_p_scalar_2643.us.us.us3903, %polly.cond2654.us.us.us.thread ], [ %_p_scalar_2643.us.us.us, %polly.stmt.for.body8.us.us.us.i2784.us.us.us ]
  %_p_scalar_2652.us.us.us3904 = load float, float* %scevgep2651.us.us.us.sink3924, align 4, !alias.scope !101, !noalias !102
  %p_2653.us.us.us3905 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2643.us.us.us3903.sink, float %_p_scalar_2482.us.us.us.sink, float %_p_scalar_2652.us.us.us3904) #17
  store float %p_2653.us.us.us3905, float* %scevgep2651.us.us.us.sink3924, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2801.us.us.us

polly.cond2801.us.us.us:                          ; preds = %polly.cond2801.us.us.us.sink.split, %polly.cond2780.us.us.us, %polly.cond2759.us.us.us, %polly.cond2738.us.us.us, %polly.cond2717.us.us.us, %polly.cond2696.us.us.us, %polly.cond2675.us.us.us, %polly.cond2654.us.us.us
  br i1 %326, label %polly.cond2822.us.us.us, label %polly.merge2634.us.us.us

polly.cond2822.us.us.us:                          ; preds = %polly.cond2801.us.us.us
  %polly.access.add.Packed_A2809.us.us.us = or i64 %polly.access.mul.Packed_A2472.us.us.us, 2
  %polly.access.Packed_A2810.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2809.us.us.us
  %_p_scalar_2811.us.us.us = load float, float* %polly.access.Packed_A2810.us.us.us, align 8, !alias.scope !97, !noalias !98
  %_p_scalar_2820.us.us.us = load float, float* %scevgep2819.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2821.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2482.us.us.us, float %_p_scalar_2820.us.us.us) #17
  store float %p_2821.us.us.us, float* %scevgep2819.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3699.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2843.us.us.us

polly.cond2843.us.us.us:                          ; preds = %polly.cond2822.us.us.us
  %polly.access.add.Packed_B2837.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 1
  %polly.access.Packed_B2838.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2837.us.us.us
  %_p_scalar_2839.us.us.us = load float, float* %polly.access.Packed_B2838.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2841.us.us.us = load float, float* %scevgep2840.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2842.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2839.us.us.us, float %_p_scalar_2841.us.us.us) #17
  store float %p_2842.us.us.us, float* %scevgep2840.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3713.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2864.us.us.us

polly.cond2864.us.us.us:                          ; preds = %polly.cond2843.us.us.us
  %polly.access.add.Packed_B2858.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 2
  %polly.access.Packed_B2859.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2858.us.us.us
  %_p_scalar_2860.us.us.us = load float, float* %polly.access.Packed_B2859.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2862.us.us.us = load float, float* %scevgep2861.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2863.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2860.us.us.us, float %_p_scalar_2862.us.us.us) #17
  store float %p_2863.us.us.us, float* %scevgep2861.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3714.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2885.us.us.us

polly.cond2885.us.us.us:                          ; preds = %polly.cond2864.us.us.us
  %polly.access.add.Packed_B2879.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 3
  %polly.access.Packed_B2880.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2879.us.us.us
  %_p_scalar_2881.us.us.us = load float, float* %polly.access.Packed_B2880.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2883.us.us.us = load float, float* %scevgep2882.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2884.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2881.us.us.us, float %_p_scalar_2883.us.us.us) #17
  store float %p_2884.us.us.us, float* %scevgep2882.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3715.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2906.us.us.us

polly.cond2906.us.us.us:                          ; preds = %polly.cond2885.us.us.us
  %polly.access.add.Packed_B2900.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 4
  %polly.access.Packed_B2901.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2900.us.us.us
  %_p_scalar_2902.us.us.us = load float, float* %polly.access.Packed_B2901.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2904.us.us.us = load float, float* %scevgep2903.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2905.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2902.us.us.us, float %_p_scalar_2904.us.us.us) #17
  store float %p_2905.us.us.us, float* %scevgep2903.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3716.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2927.us.us.us

polly.cond2927.us.us.us:                          ; preds = %polly.cond2906.us.us.us
  %polly.access.add.Packed_B2921.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 5
  %polly.access.Packed_B2922.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2921.us.us.us
  %_p_scalar_2923.us.us.us = load float, float* %polly.access.Packed_B2922.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2925.us.us.us = load float, float* %scevgep2924.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2926.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2923.us.us.us, float %_p_scalar_2925.us.us.us) #17
  store float %p_2926.us.us.us, float* %scevgep2924.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3717.us.us.us, label %polly.merge2634.us.us.us, label %polly.cond2948.us.us.us

polly.cond2948.us.us.us:                          ; preds = %polly.cond2927.us.us.us
  %polly.access.add.Packed_B2942.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 6
  %polly.access.Packed_B2943.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2942.us.us.us
  %_p_scalar_2944.us.us.us = load float, float* %polly.access.Packed_B2943.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2946.us.us.us = load float, float* %scevgep2945.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2947.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2944.us.us.us, float %_p_scalar_2946.us.us.us) #17
  store float %p_2947.us.us.us, float* %scevgep2945.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3718.us.us.us, label %polly.merge2634.us.us.us, label %polly.stmt.for.body8.us.us.us.i2952.us.us.us

polly.stmt.for.body8.us.us.us.i2952.us.us.us:     ; preds = %polly.cond2948.us.us.us
  %polly.access.add.Packed_B2963.us.us.us = or i64 %polly.access.mul.Packed_B2479.us.us.us, 7
  %polly.access.Packed_B2964.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2963.us.us.us
  %_p_scalar_2965.us.us.us = load float, float* %polly.access.Packed_B2964.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2967.us.us.us = load float, float* %scevgep2966.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2968.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2811.us.us.us, float %_p_scalar_2965.us.us.us, float %_p_scalar_2967.us.us.us) #17
  store float %p_2968.us.us.us, float* %scevgep2966.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge2634.us.us.us

polly.merge2634.us.us.us:                         ; preds = %polly.cond2633.us.us.us.thread, %polly.stmt.for.body8.us.us.us.i2952.us.us.us, %polly.cond2948.us.us.us, %polly.cond2927.us.us.us, %polly.cond2906.us.us.us, %polly.cond2885.us.us.us, %polly.cond2864.us.us.us, %polly.cond2843.us.us.us, %polly.cond2822.us.us.us, %polly.cond2801.us.us.us, %polly.cond2633.us.us.us
  %polly.indvar_next2467.us.us.us = add nuw nsw i64 %polly.indvar2466.us.us.us, 1
  %exitcond3876.not = icmp eq i64 %polly.indvar2466.us.us.us, %smin3881
  br i1 %exitcond3876.not, label %polly.loop_exit2464.loopexit.us.us.us, label %polly.cond2486.us.us.us, !llvm.loop !107

polly.loop_exit2464.loopexit.us.us.us:            ; preds = %polly.merge2634.us.us.us
  %polly.indvar_next2459.us.us.us = add nuw nsw i64 %polly.indvar2458.us.us.us, 1
  %exitcond3880.not = icmp eq i64 %polly.indvar2458.us.us.us, %smin3879
  br i1 %exitcond3880.not, label %polly.merge1839.us.us, label %polly.loop_if2461.us.us.us

polly.loop_if1856.us.us.us:                       ; preds = %polly.loop_if1848.us.us, %polly.loop_exit1859.loopexit.us.us.us
  %polly.indvar1853.us.us.us = phi i64 [ %polly.indvar_next1854.us.us.us, %polly.loop_exit1859.loopexit.us.us.us ], [ 0, %polly.loop_if1848.us.us ]
  %494 = shl nsw i64 %polly.indvar1853.us.us.us, 2
  %495 = add nuw nsw i64 %494, %184
  %polly.access.mul.Packed_A1866.us.us.us = shl nsw i64 %polly.indvar1853.us.us.us, 9
  %496 = mul i64 %495, %call3
  %497 = add i64 %496, %129
  %scevgep1878.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %497
  %498 = or i64 %495, 2
  %.not3721.us.us.us = icmp slt i64 %call1, %498
  %499 = add i64 %145, %496
  %scevgep1899.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %499
  %500 = add i64 %496, %144
  %scevgep1920.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %500
  %501 = add i64 %496, %146
  %scevgep1941.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %501
  %502 = add i64 %496, %147
  %scevgep1962.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %502
  %503 = add i64 %496, %148
  %scevgep1983.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %503
  %504 = add i64 %496, %96
  %scevgep2004.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %504
  %505 = or i64 %495, 1
  %506 = mul i64 %505, %call3
  %507 = add i64 %506, %129
  %scevgep2025.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %507
  %508 = add i64 %145, %506
  %scevgep2046.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %508
  %509 = add i64 %506, %144
  %scevgep2067.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %509
  %510 = add i64 %506, %146
  %scevgep2088.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %510
  %511 = add i64 %506, %147
  %scevgep2109.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %511
  %512 = add i64 %506, %148
  %scevgep2130.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %512
  %513 = add i64 %506, %96
  %scevgep2151.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %513
  %514 = or i64 %495, 3
  %.not3722.us.us.us = icmp slt i64 %call1, %514
  %515 = mul i64 %498, %call3
  %516 = add i64 %515, %129
  %scevgep2172.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %516
  %517 = add i64 %145, %515
  %scevgep2193.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %517
  %518 = add i64 %515, %144
  %scevgep2214.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %518
  %519 = add i64 %515, %146
  %scevgep2235.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %519
  %520 = add i64 %515, %147
  %scevgep2256.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %520
  %521 = add i64 %515, %148
  %scevgep2277.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %521
  %522 = add i64 %515, %96
  %scevgep2298.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %522
  %523 = add nuw nsw i64 %495, 4
  %.not3723.us.us.us = icmp slt i64 %call1, %523
  %524 = mul i64 %514, %call3
  %525 = add i64 %524, %129
  %scevgep2319.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %525
  %526 = add i64 %145, %524
  %scevgep2340.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %526
  %527 = add i64 %524, %144
  %scevgep2361.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %527
  %528 = add i64 %524, %146
  %scevgep2382.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %528
  %529 = add i64 %524, %147
  %scevgep2403.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %529
  %530 = add i64 %524, %148
  %scevgep2424.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %530
  %531 = add i64 %524, %96
  %scevgep2445.us.us.us = getelementptr float, float* %C.sroa.0.0, i64 %531
  br label %polly.cond1881.us.us.us

polly.cond1881.us.us.us:                          ; preds = %polly.merge2008.us.us.us, %polly.loop_if1856.us.us.us
  %polly.indvar1861.us.us.us = phi i64 [ %polly.indvar_next1862.us.us.us, %polly.merge2008.us.us.us ], [ 0, %polly.loop_if1856.us.us.us ]
  %polly.access.add.Packed_A1867.us.us.us = add nuw nsw i64 %polly.indvar1861.us.us.us, %polly.access.mul.Packed_A1866.us.us.us
  %polly.access.mul.Packed_A1868.us.us.us = shl nsw i64 %polly.access.add.Packed_A1867.us.us.us, 2
  %polly.access.Packed_A1870.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1868.us.us.us
  %_p_scalar_1871.us.us.us = load float, float* %polly.access.Packed_A1870.us.us.us, align 16, !alias.scope !97, !noalias !98
  %polly.access.mul.Packed_B1874.us.us.us = shl nsw i64 %polly.indvar1861.us.us.us, 3
  %polly.access.Packed_B1876.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1874.us.us.us
  %_p_scalar_1877.us.us.us = load float, float* %polly.access.Packed_B1876.us.us.us, align 32, !alias.scope !91, !noalias !92
  %_p_scalar_1879.us.us.us = load float, float* %scevgep1878.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1880.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1877.us.us.us, float %_p_scalar_1879.us.us.us) #17
  store float %p_1880.us.us.us, float* %scevgep1878.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3720.us, label %polly.cond2007.us.us.us.thread, label %polly.cond1902.us.us.us

polly.cond1902.us.us.us:                          ; preds = %polly.cond1881.us.us.us
  %polly.access.add.Packed_B1896.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 1
  %polly.access.Packed_B1897.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1896.us.us.us
  %_p_scalar_1898.us.us.us = load float, float* %polly.access.Packed_B1897.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_1900.us.us.us = load float, float* %scevgep1899.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1901.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1898.us.us.us, float %_p_scalar_1900.us.us.us) #17
  store float %p_1901.us.us.us, float* %scevgep1899.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3736.us, label %polly.cond2007.us.us.us, label %polly.cond1923.us.us.us

polly.cond1923.us.us.us:                          ; preds = %polly.cond1902.us.us.us
  %polly.access.add.Packed_B1917.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 2
  %polly.access.Packed_B1918.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1917.us.us.us
  %_p_scalar_1919.us.us.us = load float, float* %polly.access.Packed_B1918.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_1921.us.us.us = load float, float* %scevgep1920.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1922.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1919.us.us.us, float %_p_scalar_1921.us.us.us) #17
  store float %p_1922.us.us.us, float* %scevgep1920.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3737.us, label %polly.cond2007.us.us.us, label %polly.cond1944.us.us.us

polly.cond1944.us.us.us:                          ; preds = %polly.cond1923.us.us.us
  %polly.access.add.Packed_B1938.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 3
  %polly.access.Packed_B1939.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1938.us.us.us
  %_p_scalar_1940.us.us.us = load float, float* %polly.access.Packed_B1939.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_1942.us.us.us = load float, float* %scevgep1941.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1943.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1940.us.us.us, float %_p_scalar_1942.us.us.us) #17
  store float %p_1943.us.us.us, float* %scevgep1941.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3738.us, label %polly.cond2007.us.us.us, label %polly.cond1965.us.us.us

polly.cond1965.us.us.us:                          ; preds = %polly.cond1944.us.us.us
  %polly.access.add.Packed_B1959.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 4
  %polly.access.Packed_B1960.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1959.us.us.us
  %_p_scalar_1961.us.us.us = load float, float* %polly.access.Packed_B1960.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_1963.us.us.us = load float, float* %scevgep1962.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1964.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1961.us.us.us, float %_p_scalar_1963.us.us.us) #17
  store float %p_1964.us.us.us, float* %scevgep1962.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3739.us, label %polly.cond2007.us.us.us, label %polly.cond1986.us.us.us

polly.cond1986.us.us.us:                          ; preds = %polly.cond1965.us.us.us
  %polly.access.add.Packed_B1980.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 5
  %polly.access.Packed_B1981.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1980.us.us.us
  %_p_scalar_1982.us.us.us = load float, float* %polly.access.Packed_B1981.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_1984.us.us.us = load float, float* %scevgep1983.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_1985.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_1982.us.us.us, float %_p_scalar_1984.us.us.us) #17
  store float %p_1985.us.us.us, float* %scevgep1983.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %150, label %polly.stmt.for.body8.us.us.us.i1990.us.us.us, label %polly.cond2007.us.us.us

polly.stmt.for.body8.us.us.us.i1990.us.us.us:     ; preds = %polly.cond1986.us.us.us
  %polly.access.add.Packed_B2001.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 6
  %polly.access.Packed_B2002.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2001.us.us.us
  %_p_scalar_2003.us.us.us = load float, float* %polly.access.Packed_B2002.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2005.us.us.us = load float, float* %scevgep2004.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2006.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1871.us.us.us, float %_p_scalar_2003.us.us.us, float %_p_scalar_2005.us.us.us) #17
  store float %p_2006.us.us.us, float* %scevgep2004.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2007.us.us.us

polly.cond2007.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us.i1990.us.us.us, %polly.cond1986.us.us.us, %polly.cond1965.us.us.us, %polly.cond1944.us.us.us, %polly.cond1923.us.us.us, %polly.cond1902.us.us.us
  br i1 %.not3721.us.us.us, label %polly.merge2008.us.us.us, label %polly.cond2028.us.us.us

polly.cond2007.us.us.us.thread:                   ; preds = %polly.cond1881.us.us.us
  br i1 %.not3721.us.us.us, label %polly.merge2008.us.us.us, label %polly.cond2028.us.us.us.thread

polly.cond2028.us.us.us.thread:                   ; preds = %polly.cond2007.us.us.us.thread
  %polly.access.add.Packed_A2016.us.us.us3906 = or i64 %polly.access.mul.Packed_A1868.us.us.us, 1
  %polly.access.Packed_A2017.us.us.us3907 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2016.us.us.us3906
  %_p_scalar_2018.us.us.us3908 = load float, float* %polly.access.Packed_A2017.us.us.us3907, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_2026.us.us.us3909 = load float, float* %scevgep2025.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2027.us.us.us3910 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us3908, float %_p_scalar_1877.us.us.us, float %_p_scalar_2026.us.us.us3909) #17
  store float %p_2027.us.us.us3910, float* %scevgep2025.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2154.us.us.us

polly.cond2028.us.us.us:                          ; preds = %polly.cond2007.us.us.us
  %polly.access.add.Packed_A2016.us.us.us = or i64 %polly.access.mul.Packed_A1868.us.us.us, 1
  %polly.access.Packed_A2017.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2016.us.us.us
  %_p_scalar_2018.us.us.us = load float, float* %polly.access.Packed_A2017.us.us.us, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_2026.us.us.us = load float, float* %scevgep2025.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2027.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_1877.us.us.us, float %_p_scalar_2026.us.us.us) #17
  store float %p_2027.us.us.us, float* %scevgep2025.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3720.us, label %polly.cond2154.us.us.us, label %polly.cond2049.us.us.us

polly.cond2049.us.us.us:                          ; preds = %polly.cond2028.us.us.us
  %polly.access.add.Packed_B2043.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 1
  %polly.access.Packed_B2044.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2043.us.us.us
  %_p_scalar_2045.us.us.us = load float, float* %polly.access.Packed_B2044.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2047.us.us.us = load float, float* %scevgep2046.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2048.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2045.us.us.us, float %_p_scalar_2047.us.us.us) #17
  store float %p_2048.us.us.us, float* %scevgep2046.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3736.us, label %polly.cond2154.us.us.us, label %polly.cond2070.us.us.us

polly.cond2070.us.us.us:                          ; preds = %polly.cond2049.us.us.us
  %polly.access.add.Packed_B2064.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 2
  %polly.access.Packed_B2065.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2064.us.us.us
  %_p_scalar_2066.us.us.us = load float, float* %polly.access.Packed_B2065.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2068.us.us.us = load float, float* %scevgep2067.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2069.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2066.us.us.us, float %_p_scalar_2068.us.us.us) #17
  store float %p_2069.us.us.us, float* %scevgep2067.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3737.us, label %polly.cond2154.us.us.us, label %polly.cond2091.us.us.us

polly.cond2091.us.us.us:                          ; preds = %polly.cond2070.us.us.us
  %polly.access.add.Packed_B2085.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 3
  %polly.access.Packed_B2086.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2085.us.us.us
  %_p_scalar_2087.us.us.us = load float, float* %polly.access.Packed_B2086.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2089.us.us.us = load float, float* %scevgep2088.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2090.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2087.us.us.us, float %_p_scalar_2089.us.us.us) #17
  store float %p_2090.us.us.us, float* %scevgep2088.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3738.us, label %polly.cond2154.us.us.us, label %polly.cond2112.us.us.us

polly.cond2112.us.us.us:                          ; preds = %polly.cond2091.us.us.us
  %polly.access.add.Packed_B2106.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 4
  %polly.access.Packed_B2107.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2106.us.us.us
  %_p_scalar_2108.us.us.us = load float, float* %polly.access.Packed_B2107.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2110.us.us.us = load float, float* %scevgep2109.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2111.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2108.us.us.us, float %_p_scalar_2110.us.us.us) #17
  store float %p_2111.us.us.us, float* %scevgep2109.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3739.us, label %polly.cond2154.us.us.us, label %polly.cond2133.us.us.us

polly.cond2133.us.us.us:                          ; preds = %polly.cond2112.us.us.us
  %polly.access.add.Packed_B2127.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 5
  %polly.access.Packed_B2128.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2127.us.us.us
  %_p_scalar_2129.us.us.us = load float, float* %polly.access.Packed_B2128.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2131.us.us.us = load float, float* %scevgep2130.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2132.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2129.us.us.us, float %_p_scalar_2131.us.us.us) #17
  store float %p_2132.us.us.us, float* %scevgep2130.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %150, label %polly.stmt.for.body8.us.us.us.i2137.us.us.us, label %polly.cond2154.us.us.us

polly.stmt.for.body8.us.us.us.i2137.us.us.us:     ; preds = %polly.cond2133.us.us.us
  %polly.access.add.Packed_B2148.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 6
  %polly.access.Packed_B2149.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2148.us.us.us
  %_p_scalar_2150.us.us.us = load float, float* %polly.access.Packed_B2149.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2152.us.us.us = load float, float* %scevgep2151.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2153.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2018.us.us.us, float %_p_scalar_2150.us.us.us, float %_p_scalar_2152.us.us.us) #17
  store float %p_2153.us.us.us, float* %scevgep2151.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2154.us.us.us

polly.cond2154.us.us.us:                          ; preds = %polly.cond2028.us.us.us.thread, %polly.stmt.for.body8.us.us.us.i2137.us.us.us, %polly.cond2133.us.us.us, %polly.cond2112.us.us.us, %polly.cond2091.us.us.us, %polly.cond2070.us.us.us, %polly.cond2049.us.us.us, %polly.cond2028.us.us.us
  br i1 %.not3722.us.us.us, label %polly.merge2008.us.us.us, label %polly.cond2175.us.us.us

polly.cond2175.us.us.us:                          ; preds = %polly.cond2154.us.us.us
  %polly.access.add.Packed_A2163.us.us.us = or i64 %polly.access.mul.Packed_A1868.us.us.us, 2
  %polly.access.Packed_A2164.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2163.us.us.us
  %_p_scalar_2165.us.us.us = load float, float* %polly.access.Packed_A2164.us.us.us, align 8, !alias.scope !97, !noalias !98
  %_p_scalar_2173.us.us.us = load float, float* %scevgep2172.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2174.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_1877.us.us.us, float %_p_scalar_2173.us.us.us) #17
  store float %p_2174.us.us.us, float* %scevgep2172.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3720.us, label %polly.cond2301.us.us.us.thread, label %polly.cond2196.us.us.us

polly.cond2196.us.us.us:                          ; preds = %polly.cond2175.us.us.us
  %polly.access.add.Packed_B2190.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 1
  %polly.access.Packed_B2191.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2190.us.us.us
  %_p_scalar_2192.us.us.us = load float, float* %polly.access.Packed_B2191.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2194.us.us.us = load float, float* %scevgep2193.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2195.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2192.us.us.us, float %_p_scalar_2194.us.us.us) #17
  store float %p_2195.us.us.us, float* %scevgep2193.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3736.us, label %polly.cond2301.us.us.us, label %polly.cond2217.us.us.us

polly.cond2217.us.us.us:                          ; preds = %polly.cond2196.us.us.us
  %polly.access.add.Packed_B2211.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 2
  %polly.access.Packed_B2212.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2211.us.us.us
  %_p_scalar_2213.us.us.us = load float, float* %polly.access.Packed_B2212.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2215.us.us.us = load float, float* %scevgep2214.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2216.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2213.us.us.us, float %_p_scalar_2215.us.us.us) #17
  store float %p_2216.us.us.us, float* %scevgep2214.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3737.us, label %polly.cond2301.us.us.us, label %polly.cond2238.us.us.us

polly.cond2238.us.us.us:                          ; preds = %polly.cond2217.us.us.us
  %polly.access.add.Packed_B2232.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 3
  %polly.access.Packed_B2233.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2232.us.us.us
  %_p_scalar_2234.us.us.us = load float, float* %polly.access.Packed_B2233.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2236.us.us.us = load float, float* %scevgep2235.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2237.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2234.us.us.us, float %_p_scalar_2236.us.us.us) #17
  store float %p_2237.us.us.us, float* %scevgep2235.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3738.us, label %polly.cond2301.us.us.us, label %polly.cond2259.us.us.us

polly.cond2259.us.us.us:                          ; preds = %polly.cond2238.us.us.us
  %polly.access.add.Packed_B2253.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 4
  %polly.access.Packed_B2254.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2253.us.us.us
  %_p_scalar_2255.us.us.us = load float, float* %polly.access.Packed_B2254.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2257.us.us.us = load float, float* %scevgep2256.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2258.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2255.us.us.us, float %_p_scalar_2257.us.us.us) #17
  store float %p_2258.us.us.us, float* %scevgep2256.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3739.us, label %polly.cond2301.us.us.us, label %polly.cond2280.us.us.us

polly.cond2280.us.us.us:                          ; preds = %polly.cond2259.us.us.us
  %polly.access.add.Packed_B2274.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 5
  %polly.access.Packed_B2275.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2274.us.us.us
  %_p_scalar_2276.us.us.us = load float, float* %polly.access.Packed_B2275.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2278.us.us.us = load float, float* %scevgep2277.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2279.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2276.us.us.us, float %_p_scalar_2278.us.us.us) #17
  store float %p_2279.us.us.us, float* %scevgep2277.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %150, label %polly.stmt.for.body8.us.us.us.i2284.us.us.us, label %polly.cond2301.us.us.us

polly.stmt.for.body8.us.us.us.i2284.us.us.us:     ; preds = %polly.cond2280.us.us.us
  %polly.access.add.Packed_B2295.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 6
  %polly.access.Packed_B2296.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2295.us.us.us
  %_p_scalar_2297.us.us.us = load float, float* %polly.access.Packed_B2296.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2299.us.us.us = load float, float* %scevgep2298.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2300.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2165.us.us.us, float %_p_scalar_2297.us.us.us, float %_p_scalar_2299.us.us.us) #17
  store float %p_2300.us.us.us, float* %scevgep2298.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.cond2301.us.us.us

polly.cond2301.us.us.us:                          ; preds = %polly.stmt.for.body8.us.us.us.i2284.us.us.us, %polly.cond2280.us.us.us, %polly.cond2259.us.us.us, %polly.cond2238.us.us.us, %polly.cond2217.us.us.us, %polly.cond2196.us.us.us
  br i1 %.not3723.us.us.us, label %polly.merge2008.us.us.us, label %polly.cond2322.us.us.us

polly.cond2301.us.us.us.thread:                   ; preds = %polly.cond2175.us.us.us
  br i1 %.not3723.us.us.us, label %polly.merge2008.us.us.us, label %polly.cond2322.us.us.us.thread

polly.cond2322.us.us.us.thread:                   ; preds = %polly.cond2301.us.us.us.thread
  %polly.access.add.Packed_A2310.us.us.us3911 = or i64 %polly.access.mul.Packed_A1868.us.us.us, 3
  %polly.access.Packed_A2311.us.us.us3912 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2310.us.us.us3911
  %_p_scalar_2312.us.us.us3913 = load float, float* %polly.access.Packed_A2311.us.us.us3912, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_2320.us.us.us3914 = load float, float* %scevgep2319.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2321.us.us.us3915 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us3913, float %_p_scalar_1877.us.us.us, float %_p_scalar_2320.us.us.us3914) #17
  store float %p_2321.us.us.us3915, float* %scevgep2319.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge2008.us.us.us

polly.cond2322.us.us.us:                          ; preds = %polly.cond2301.us.us.us
  %polly.access.add.Packed_A2310.us.us.us = or i64 %polly.access.mul.Packed_A1868.us.us.us, 3
  %polly.access.Packed_A2311.us.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2310.us.us.us
  %_p_scalar_2312.us.us.us = load float, float* %polly.access.Packed_A2311.us.us.us, align 4, !alias.scope !97, !noalias !98
  %_p_scalar_2320.us.us.us = load float, float* %scevgep2319.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2321.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_1877.us.us.us, float %_p_scalar_2320.us.us.us) #17
  store float %p_2321.us.us.us, float* %scevgep2319.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3720.us, label %polly.merge2008.us.us.us, label %polly.cond2343.us.us.us

polly.cond2343.us.us.us:                          ; preds = %polly.cond2322.us.us.us
  %polly.access.add.Packed_B2337.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 1
  %polly.access.Packed_B2338.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2337.us.us.us
  %_p_scalar_2339.us.us.us = load float, float* %polly.access.Packed_B2338.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2341.us.us.us = load float, float* %scevgep2340.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2342.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2339.us.us.us, float %_p_scalar_2341.us.us.us) #17
  store float %p_2342.us.us.us, float* %scevgep2340.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3736.us, label %polly.merge2008.us.us.us, label %polly.cond2364.us.us.us

polly.cond2364.us.us.us:                          ; preds = %polly.cond2343.us.us.us
  %polly.access.add.Packed_B2358.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 2
  %polly.access.Packed_B2359.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2358.us.us.us
  %_p_scalar_2360.us.us.us = load float, float* %polly.access.Packed_B2359.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2362.us.us.us = load float, float* %scevgep2361.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2363.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2360.us.us.us, float %_p_scalar_2362.us.us.us) #17
  store float %p_2363.us.us.us, float* %scevgep2361.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3737.us, label %polly.merge2008.us.us.us, label %polly.cond2385.us.us.us

polly.cond2385.us.us.us:                          ; preds = %polly.cond2364.us.us.us
  %polly.access.add.Packed_B2379.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 3
  %polly.access.Packed_B2380.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2379.us.us.us
  %_p_scalar_2381.us.us.us = load float, float* %polly.access.Packed_B2380.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2383.us.us.us = load float, float* %scevgep2382.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2384.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2381.us.us.us, float %_p_scalar_2383.us.us.us) #17
  store float %p_2384.us.us.us, float* %scevgep2382.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3738.us, label %polly.merge2008.us.us.us, label %polly.cond2406.us.us.us

polly.cond2406.us.us.us:                          ; preds = %polly.cond2385.us.us.us
  %polly.access.add.Packed_B2400.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 4
  %polly.access.Packed_B2401.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2400.us.us.us
  %_p_scalar_2402.us.us.us = load float, float* %polly.access.Packed_B2401.us.us.us, align 16, !alias.scope !91, !noalias !92
  %_p_scalar_2404.us.us.us = load float, float* %scevgep2403.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2405.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2402.us.us.us, float %_p_scalar_2404.us.us.us) #17
  store float %p_2405.us.us.us, float* %scevgep2403.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %.not3739.us, label %polly.merge2008.us.us.us, label %polly.cond2427.us.us.us

polly.cond2427.us.us.us:                          ; preds = %polly.cond2406.us.us.us
  %polly.access.add.Packed_B2421.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 5
  %polly.access.Packed_B2422.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2421.us.us.us
  %_p_scalar_2423.us.us.us = load float, float* %polly.access.Packed_B2422.us.us.us, align 4, !alias.scope !91, !noalias !92
  %_p_scalar_2425.us.us.us = load float, float* %scevgep2424.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2426.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2423.us.us.us, float %_p_scalar_2425.us.us.us) #17
  store float %p_2426.us.us.us, float* %scevgep2424.us.us.us, align 4, !alias.scope !101, !noalias !102
  br i1 %150, label %polly.stmt.for.body8.us.us.us.i2431.us.us.us, label %polly.merge2008.us.us.us

polly.stmt.for.body8.us.us.us.i2431.us.us.us:     ; preds = %polly.cond2427.us.us.us
  %polly.access.add.Packed_B2442.us.us.us = or i64 %polly.access.mul.Packed_B1874.us.us.us, 6
  %polly.access.Packed_B2443.us.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2442.us.us.us
  %_p_scalar_2444.us.us.us = load float, float* %polly.access.Packed_B2443.us.us.us, align 8, !alias.scope !91, !noalias !92
  %_p_scalar_2446.us.us.us = load float, float* %scevgep2445.us.us.us, align 4, !alias.scope !101, !noalias !102
  %p_2447.us.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2312.us.us.us, float %_p_scalar_2444.us.us.us, float %_p_scalar_2446.us.us.us) #17
  store float %p_2447.us.us.us, float* %scevgep2445.us.us.us, align 4, !alias.scope !101, !noalias !102
  br label %polly.merge2008.us.us.us

polly.merge2008.us.us.us:                         ; preds = %polly.cond2322.us.us.us.thread, %polly.cond2301.us.us.us.thread, %polly.cond2007.us.us.us.thread, %polly.stmt.for.body8.us.us.us.i2431.us.us.us, %polly.cond2427.us.us.us, %polly.cond2406.us.us.us, %polly.cond2385.us.us.us, %polly.cond2364.us.us.us, %polly.cond2343.us.us.us, %polly.cond2322.us.us.us, %polly.cond2301.us.us.us, %polly.cond2154.us.us.us, %polly.cond2007.us.us.us
  %polly.indvar_next1862.us.us.us = add nuw nsw i64 %polly.indvar1861.us.us.us, 1
  %exitcond3882.not = icmp eq i64 %polly.indvar1861.us.us.us, %smin3881
  br i1 %exitcond3882.not, label %polly.loop_exit1859.loopexit.us.us.us, label %polly.cond1881.us.us.us, !llvm.loop !108

polly.loop_exit1859.loopexit.us.us.us:            ; preds = %polly.merge2008.us.us.us
  %polly.indvar_next1854.us.us.us = add nuw nsw i64 %polly.indvar1853.us.us.us, 1
  %exitcond3884.not = icmp eq i64 %polly.indvar1853.us.us.us, %smin3883
  br i1 %exitcond3884.not, label %polly.merge1839.us.us, label %polly.loop_if1856.us.us.us
}

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef) local_unnamed_addr #7

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #9

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare dso_local i64 @_ZNSt6chrono3_V212system_clock3nowEv() local_unnamed_addr #1

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_length_errorPKc(i8* noundef) local_unnamed_addr #10

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znwm(i64 noundef) local_unnamed_addr #11

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8* noundef) local_unnamed_addr #12

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), double noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #10

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_gemm_c1.cpp() #13 section ".text.startup" {
entry.split:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #17
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smax.i64(i64, i64) #15

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #15

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #2 = { nofree nounwind }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind writeonly uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly mustprogress nofree nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #6 = { norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #7 = { inlinehint mustprogress uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #8 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #9 = { mustprogress nofree nounwind willreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #10 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #11 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #12 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #13 = { uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #14 = { argmemonly nofree nounwind willreturn writeonly }
attributes #15 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #16 = { noreturn nounwind }
attributes #17 = { nounwind }
attributes #18 = { noreturn }
attributes #19 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"branch-target-enforcement", i32 0}
!2 = !{i32 8, !"sign-return-address", i32 0}
!3 = !{i32 8, !"sign-return-address-all", i32 0}
!4 = !{i32 8, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 7, !"frame-pointer", i32 1}
!7 = !{!"clang version 15.0.0"}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !13, !16, !14}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !16, !14}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !13, !16, !14}
!23 = distinct !{!23, !13}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28}
!28 = distinct !{!28, !26}
!29 = !{!30}
!30 = distinct !{!30, !26}
!31 = !{!25, !28}
!32 = distinct !{!32, !13, !14}
!33 = distinct !{!33, !13, !14}
!34 = distinct !{!34, !13}
!35 = distinct !{!35, !13}
!36 = !{!37}
!37 = distinct !{!37, !38, !"polly.alias.scope.MemRef1"}
!38 = distinct !{!38, !"polly.alias.scope.domain"}
!39 = !{!40, !41, !42, !43}
!40 = distinct !{!40, !38, !"polly.alias.scope.MemRef0"}
!41 = distinct !{!41, !38, !"polly.alias.scope.MemRef2"}
!42 = distinct !{!42, !38, !"polly.alias.scope.Packed_B"}
!43 = distinct !{!43, !38, !"polly.alias.scope.Packed_A"}
!44 = !{!42}
!45 = !{!40, !37, !41, !43}
!46 = distinct !{!46, !14}
!47 = distinct !{!47, !14}
!48 = distinct !{!48, !14}
!49 = distinct !{!49, !14}
!50 = !{!40}
!51 = !{!37, !41, !42, !43}
!52 = !{!43}
!53 = !{!40, !37, !41, !42}
!54 = distinct !{!54, !14}
!55 = distinct !{!55, !14}
!56 = !{!41}
!57 = !{!40, !37, !42, !43}
!58 = distinct !{!58, !59}
!59 = !{!"llvm.loop.vectorize.enable", i1 false}
!60 = distinct !{!60, !59}
!61 = distinct !{!61, !59}
!62 = distinct !{!62, !59}
!63 = distinct !{!63, !59}
!64 = distinct !{!64, !59}
!65 = !{!66, !66, i64 0}
!66 = !{!"any pointer", !10, i64 0}
!67 = distinct !{!67, !13, !14}
!68 = distinct !{!68, !13, !16, !14}
!69 = distinct !{!69, !13, !14}
!70 = distinct !{!70, !13, !16, !14}
!71 = distinct !{!71, !13, !14}
!72 = distinct !{!72, !13, !16, !14}
!73 = distinct !{!73, !13, !14}
!74 = distinct !{!74, !13, !16, !14}
!75 = !{!76, !76, i64 0}
!76 = !{!"vtable pointer", !11, i64 0}
!77 = !{!78, !66, i64 240}
!78 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !66, i64 216, !10, i64 224, !79, i64 225, !66, i64 232, !66, i64 240, !66, i64 248, !66, i64 256}
!79 = !{!"bool", !10, i64 0}
!80 = !{!81, !10, i64 56}
!81 = !{!"_ZTSSt5ctypeIcE", !66, i64 16, !79, i64 24, !66, i64 32, !66, i64 40, !66, i64 48, !10, i64 56, !10, i64 57, !10, i64 313, !10, i64 569}
!82 = !{!10, !10, i64 0}
!83 = !{!84}
!84 = distinct !{!84, !85, !"polly.alias.scope.MemRef2"}
!85 = distinct !{!85, !"polly.alias.scope.domain"}
!86 = !{!87, !88, !89, !90}
!87 = distinct !{!87, !85, !"polly.alias.scope.MemRef0"}
!88 = distinct !{!88, !85, !"polly.alias.scope.MemRef3"}
!89 = distinct !{!89, !85, !"polly.alias.scope.Packed_B"}
!90 = distinct !{!90, !85, !"polly.alias.scope.Packed_A"}
!91 = !{!89}
!92 = !{!87, !84, !88, !90}
!93 = distinct !{!93, !14}
!94 = distinct !{!94, !14}
!95 = !{!87}
!96 = !{!84, !88, !89, !90}
!97 = !{!90}
!98 = !{!87, !84, !88, !89}
!99 = distinct !{!99, !14}
!100 = distinct !{!100, !14}
!101 = !{!88}
!102 = !{!87, !84, !89, !90}
!103 = distinct !{!103, !59}
!104 = distinct !{!104, !59}
!105 = distinct !{!105, !59}
!106 = distinct !{!106, !59}
!107 = distinct !{!107, !59}
!108 = distinct !{!108, !59}
