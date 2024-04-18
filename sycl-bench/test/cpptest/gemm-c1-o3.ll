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
entry:
  %cmp94.not = icmp eq i64 %NI, 0
  br i1 %cmp94.not, label %for.cond12.preheader, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
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

for.cond12.preheader:                             ; preds = %for.cond1.for.cond.cleanup3_crit_edge.us, %entry
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
entry:
  %cmp38.not = icmp eq i64 %M, 0
  %cmp236.not = icmp eq i64 %K, 0
  %or.cond = or i1 %cmp38.not, %cmp236.not
  %cmp634.not = icmp eq i64 %N, 0
  %or.cond50 = or i1 %or.cond, %cmp634.not
  br i1 %or.cond50, label %for.cond.cleanup, label %for.cond1.preheader.us.us.preheader

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %min.iters.check = icmp ult i64 %N, 8
  %n.vec = and i64 %N, -8
  %cmp.n = icmp eq i64 %n.vec, %N
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us
  %i.039.us.us = phi i64 [ %inc20.us.us, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us ], [ 0, %for.cond1.preheader.us.us.preheader ]
  %0 = mul i64 %i.039.us.us, %ldc
  %scevgep = getelementptr float, float* %C, i64 %0
  %1 = add i64 %0, %N
  %scevgep52 = getelementptr float, float* %C, i64 %1
  %2 = mul i64 %i.039.us.us, %lda
  %3 = add i64 %2, 1
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
  %4 = mul i64 %k.037.us.us.us, %ldb
  %5 = add i64 %4, %N
  %scevgep60 = getelementptr float, float* %B, i64 %5
  %scevgep58 = getelementptr float, float* %B, i64 %4
  %6 = add i64 %3, %k.037.us.us.us
  %scevgep56 = getelementptr float, float* %A, i64 %6
  %7 = add i64 %2, %k.037.us.us.us
  %scevgep54 = getelementptr float, float* %A, i64 %7
  %bound0 = icmp ult float* %scevgep, %scevgep56
  %bound1 = icmp ult float* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult float* %scevgep, %scevgep60
  %bound163 = icmp ult float* %scevgep58, %scevgep52
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  br i1 %conflict.rdx, label %for.body8.us.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %8 = load float, float* %arrayidx.us.us.us, align 4, !tbaa !8, !alias.scope !24
  %broadcast.splatinsert = insertelement <4 x float> poison, float %8, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <4 x float> poison, float %8, i64 0
  %broadcast.splat69 = shufflevector <4 x float> %broadcast.splatinsert68, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %9 = add i64 %index, %mul9.us.us.us
  %10 = getelementptr inbounds float, float* %B, i64 %9
  %11 = bitcast float* %10 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %11, align 4, !tbaa !8, !alias.scope !27
  %12 = getelementptr inbounds float, float* %10, i64 4
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load65 = load <4 x float>, <4 x float>* %13, align 4, !tbaa !8, !alias.scope !27
  %14 = add i64 %index, %mul13.us.us
  %15 = getelementptr inbounds float, float* %C, i64 %14
  %16 = bitcast float* %15 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %16, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %17 = getelementptr inbounds float, float* %15, i64 4
  %18 = bitcast float* %17 to <4 x float>*
  %wide.load67 = load <4 x float>, <4 x float>* %18, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %19 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load66)
  %20 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat69, <4 x float> %wide.load65, <4 x float> %wide.load67)
  %21 = bitcast float* %15 to <4 x float>*
  store <4 x float> %19, <4 x float>* %21, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %22 = bitcast float* %17 to <4 x float>*
  store <4 x float> %20, <4 x float>* %22, align 4, !tbaa !8, !alias.scope !29, !noalias !31
  %index.next = add nuw i64 %index, 8
  %23 = icmp eq i64 %index.next, %n.vec
  br i1 %23, label %middle.block, label %vector.body, !llvm.loop !32

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us, label %for.body8.us.us.us.preheader

for.body8.us.us.us.preheader:                     ; preds = %vector.memcheck, %for.cond5.preheader.us.us.us, %middle.block
  %j.035.us.us.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond5.preheader.us.us.us ], [ %n.vec, %middle.block ]
  br label %for.body8.us.us.us

for.body8.us.us.us:                               ; preds = %for.body8.us.us.us.preheader, %for.body8.us.us.us
  %j.035.us.us.us = phi i64 [ %inc.us.us.us, %for.body8.us.us.us ], [ %j.035.us.us.us.ph, %for.body8.us.us.us.preheader ]
  %24 = load float, float* %arrayidx.us.us.us, align 4, !tbaa !8
  %add10.us.us.us = add i64 %j.035.us.us.us, %mul9.us.us.us
  %arrayidx11.us.us.us = getelementptr inbounds float, float* %B, i64 %add10.us.us.us
  %25 = load float, float* %arrayidx11.us.us.us, align 4, !tbaa !8
  %add14.us.us.us = add i64 %j.035.us.us.us, %mul13.us.us
  %arrayidx15.us.us.us = getelementptr inbounds float, float* %C, i64 %add14.us.us.us
  %26 = load float, float* %arrayidx15.us.us.us, align 4, !tbaa !8
  %27 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %26)
  store float %27, float* %arrayidx15.us.us.us, align 4, !tbaa !8
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

for.cond.cleanup:                                 ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, %entry
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %cmp.not = icmp eq i32 %argc, 4
  br i1 %cmp.not, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0))
  tail call void @exit(i32 noundef 1) #16
  unreachable

if.else:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8, !tbaa !36
  %call1 = tail call i64 @strtol(i8* nocapture noundef %0, i8** noundef null, i32 noundef 10) #17
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2
  %1 = load i8*, i8** %arrayidx2, align 8, !tbaa !36
  %call3 = tail call i64 @strtol(i8* nocapture noundef %1, i8** noundef null, i32 noundef 10) #17
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 3
  %2 = load i8*, i8** %arrayidx4, align 8, !tbaa !36
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
  %broadcast.splatinsert263 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat264 = shufflevector <4 x float> %broadcast.splatinsert263, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert265 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat266 = shufflevector <4 x float> %broadcast.splatinsert265, <4 x float> poison, <4 x i32> zeroinitializer
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
  %broadcast.splatinsert261 = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat262 = shufflevector <4 x float> %broadcast.splatinsert261, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %6 = uitofp <4 x i64> %vec.ind to <4 x float>
  %7 = uitofp <4 x i64> %step.add to <4 x float>
  %8 = fmul <4 x float> %broadcast.splat, %6
  %9 = fmul <4 x float> %broadcast.splat262, %7
  %10 = fdiv <4 x float> %8, %broadcast.splat264
  %11 = fdiv <4 x float> %9, %broadcast.splat266
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
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !38

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
  br i1 %exitcond.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.us.i, label %for.body4.us.i, !llvm.loop !39

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
  %min.iters.check269 = icmp ult i64 %call3, 8
  %n.vec272 = and i64 %call3, -8
  %broadcast.splatinsert285 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat286 = shufflevector <4 x float> %broadcast.splatinsert285, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert287 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat288 = shufflevector <4 x float> %broadcast.splatinsert287, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n274 = icmp eq i64 %call3, %n.vec272
  br label %for.cond17.preheader.us.i

for.cond17.preheader.us.i:                        ; preds = %for.cond17.preheader.us.i.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i
  %i11.099.us.i = phi i64 [ %inc33.us.i, %for.cond17.for.cond.cleanup19_crit_edge.us.i ], [ 0, %for.cond17.preheader.us.i.preheader ]
  %conv21.us.i = uitofp i64 %i11.099.us.i to float
  %mul26.us.i = mul i64 %i11.099.us.i, %call3
  br i1 %min.iters.check269, label %for.body20.us.i.preheader, label %vector.ph270

vector.ph270:                                     ; preds = %for.cond17.preheader.us.i
  %broadcast.splatinsert281 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat282 = shufflevector <4 x float> %broadcast.splatinsert281, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert283 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat284 = shufflevector <4 x float> %broadcast.splatinsert283, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body275

vector.body275:                                   ; preds = %vector.body275, %vector.ph270
  %index276 = phi i64 [ 0, %vector.ph270 ], [ %index.next289, %vector.body275 ]
  %vec.ind277 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph270 ], [ %vec.ind.next280, %vector.body275 ]
  %step.add278 = add <4 x i64> %vec.ind277, <i64 4, i64 4, i64 4, i64 4>
  %18 = uitofp <4 x i64> %vec.ind277 to <4 x float>
  %19 = uitofp <4 x i64> %step.add278 to <4 x float>
  %20 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat282, <4 x float> %18, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat284, <4 x float> %19, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %22 = fdiv <4 x float> %20, %broadcast.splat286
  %23 = fdiv <4 x float> %21, %broadcast.splat288
  %24 = add i64 %index276, %mul26.us.i
  %25 = getelementptr inbounds float, float* %B.sroa.0.0, i64 %24
  %26 = bitcast float* %25 to <4 x float>*
  store <4 x float> %22, <4 x float>* %26, align 4, !tbaa !8
  %27 = getelementptr inbounds float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  store <4 x float> %23, <4 x float>* %28, align 4, !tbaa !8
  %index.next289 = add nuw i64 %index276, 8
  %vec.ind.next280 = add <4 x i64> %vec.ind277, <i64 8, i64 8, i64 8, i64 8>
  %29 = icmp eq i64 %index.next289, %n.vec272
  br i1 %29, label %middle.block267, label %vector.body275, !llvm.loop !40

middle.block267:                                  ; preds = %vector.body275
  br i1 %cmp.n274, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i.preheader

for.body20.us.i.preheader:                        ; preds = %for.cond17.preheader.us.i, %middle.block267
  %j16.097.us.i.ph = phi i64 [ 0, %for.cond17.preheader.us.i ], [ %n.vec272, %middle.block267 ]
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
  br i1 %exitcond108.not.i, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i, !llvm.loop !41

for.cond17.for.cond.cleanup19_crit_edge.us.i:     ; preds = %for.body20.us.i, %middle.block267
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
  %min.iters.check292 = icmp ult i64 %call3, 8
  %n.vec295 = and i64 %call3, -8
  %broadcast.splatinsert308 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat309 = shufflevector <4 x float> %broadcast.splatinsert308, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert310 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat311 = shufflevector <4 x float> %broadcast.splatinsert310, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n297 = icmp eq i64 %call3, %n.vec295
  br label %for.cond41.preheader.us.i

for.cond41.preheader.us.i:                        ; preds = %for.cond41.preheader.us.i.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i
  %i35.0103.us.i = phi i64 [ %inc57.us.i, %for.cond41.for.cond.cleanup43_crit_edge.us.i ], [ 0, %for.cond41.preheader.us.i.preheader ]
  %conv45.us.i = uitofp i64 %i35.0103.us.i to float
  %mul50.us.i = mul i64 %i35.0103.us.i, %call3
  br i1 %min.iters.check292, label %for.body44.us.i.preheader, label %vector.ph293

vector.ph293:                                     ; preds = %for.cond41.preheader.us.i
  %broadcast.splatinsert304 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat305 = shufflevector <4 x float> %broadcast.splatinsert304, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert306 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat307 = shufflevector <4 x float> %broadcast.splatinsert306, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body298

vector.body298:                                   ; preds = %vector.body298, %vector.ph293
  %index299 = phi i64 [ 0, %vector.ph293 ], [ %index.next312, %vector.body298 ]
  %vec.ind300 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph293 ], [ %vec.ind.next303, %vector.body298 ]
  %step.add301 = add <4 x i64> %vec.ind300, <i64 4, i64 4, i64 4, i64 4>
  %31 = uitofp <4 x i64> %vec.ind300 to <4 x float>
  %32 = uitofp <4 x i64> %step.add301 to <4 x float>
  %33 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat305, <4 x float> %31, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %34 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat307, <4 x float> %32, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %35 = fdiv <4 x float> %33, %broadcast.splat309
  %36 = fdiv <4 x float> %34, %broadcast.splat311
  %37 = add i64 %index299, %mul50.us.i
  %38 = getelementptr inbounds float, float* %C.sroa.0.0, i64 %37
  %39 = bitcast float* %38 to <4 x float>*
  store <4 x float> %35, <4 x float>* %39, align 4, !tbaa !8
  %40 = getelementptr inbounds float, float* %38, i64 4
  %41 = bitcast float* %40 to <4 x float>*
  store <4 x float> %36, <4 x float>* %41, align 4, !tbaa !8
  %index.next312 = add nuw i64 %index299, 8
  %vec.ind.next303 = add <4 x i64> %vec.ind300, <i64 8, i64 8, i64 8, i64 8>
  %42 = icmp eq i64 %index.next312, %n.vec295
  br i1 %42, label %middle.block290, label %vector.body298, !llvm.loop !42

middle.block290:                                  ; preds = %vector.body298
  br i1 %cmp.n297, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i.preheader

for.body44.us.i.preheader:                        ; preds = %for.cond41.preheader.us.i, %middle.block290
  %j40.0101.us.i.ph = phi i64 [ 0, %for.cond41.preheader.us.i ], [ %n.vec295, %middle.block290 ]
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
  br i1 %exitcond110.not.i, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i, !llvm.loop !43

for.cond41.for.cond.cleanup43_crit_edge.us.i:     ; preds = %for.body44.us.i, %middle.block290
  %inc57.us.i = add nuw i64 %i35.0103.us.i, 1
  %exitcond111.not.i = icmp eq i64 %inc57.us.i, %call1
  br i1 %exitcond111.not.i, label %_Z10initMatrixPfS_S_mmm.exit, label %for.cond41.preheader.us.i, !llvm.loop !23

_Z10initMatrixPfS_S_mmm.exit:                     ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us.i, %for.cond36.preheader.i, %for.cond41.preheader.lr.ph.i
  %call17 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17
  %cmp236.not.i = icmp eq i64 %call5, 0
  %or.cond.i = or i1 %cmp94.not.i, %cmp236.not.i
  %cmp634.not.i = icmp eq i64 %call3, 0
  %or.cond50.i = or i1 %cmp634.not.i, %or.cond.i
  br i1 %or.cond50.i, label %invoke.cont30, label %for.cond1.preheader.us.us.i.preheader

for.cond1.preheader.us.us.i.preheader:            ; preds = %_Z10initMatrixPfS_S_mmm.exit
  %min.iters.check315 = icmp ult i64 %call3, 8
  %n.vec318 = and i64 %call3, -8
  %cmp.n320 = icmp eq i64 %call3, %n.vec318
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
  %44 = load float, float* %arrayidx.us.us.us.i, align 4, !tbaa !8
  br i1 %min.iters.check315, label %for.body8.us.us.us.i.preheader, label %vector.ph316

vector.ph316:                                     ; preds = %for.cond5.preheader.us.us.us.i
  %broadcast.splatinsert326 = insertelement <4 x float> poison, float %44, i64 0
  %broadcast.splat327 = shufflevector <4 x float> %broadcast.splatinsert326, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert328 = insertelement <4 x float> poison, float %44, i64 0
  %broadcast.splat329 = shufflevector <4 x float> %broadcast.splatinsert328, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body321

vector.body321:                                   ; preds = %vector.body321, %vector.ph316
  %index322 = phi i64 [ 0, %vector.ph316 ], [ %index.next330, %vector.body321 ]
  %45 = add i64 %index322, %mul9.us.us.us.i
  %46 = getelementptr inbounds float, float* %B.sroa.0.0, i64 %45
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %47, align 4, !tbaa !8
  %48 = getelementptr inbounds float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load323 = load <4 x float>, <4 x float>* %49, align 4, !tbaa !8
  %50 = add i64 %index322, %mul13.us.us.i
  %51 = getelementptr inbounds float, float* %C.sroa.0.0, i64 %50
  %52 = bitcast float* %51 to <4 x float>*
  %wide.load324 = load <4 x float>, <4 x float>* %52, align 4, !tbaa !8
  %53 = getelementptr inbounds float, float* %51, i64 4
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load325 = load <4 x float>, <4 x float>* %54, align 4, !tbaa !8
  %55 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat327, <4 x float> %wide.load, <4 x float> %wide.load324)
  %56 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat329, <4 x float> %wide.load323, <4 x float> %wide.load325)
  %57 = bitcast float* %51 to <4 x float>*
  store <4 x float> %55, <4 x float>* %57, align 4, !tbaa !8
  %58 = bitcast float* %53 to <4 x float>*
  store <4 x float> %56, <4 x float>* %58, align 4, !tbaa !8
  %index.next330 = add nuw i64 %index322, 8
  %59 = icmp eq i64 %index.next330, %n.vec318
  br i1 %59, label %middle.block313, label %vector.body321, !llvm.loop !44

middle.block313:                                  ; preds = %vector.body321
  br i1 %cmp.n320, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i, label %for.body8.us.us.us.i.preheader

for.body8.us.us.us.i.preheader:                   ; preds = %for.cond5.preheader.us.us.us.i, %middle.block313
  %j.035.us.us.us.i.ph = phi i64 [ 0, %for.cond5.preheader.us.us.us.i ], [ %n.vec318, %middle.block313 ]
  br label %for.body8.us.us.us.i

for.body8.us.us.us.i:                             ; preds = %for.body8.us.us.us.i.preheader, %for.body8.us.us.us.i
  %j.035.us.us.us.i = phi i64 [ %inc.us.us.us.i, %for.body8.us.us.us.i ], [ %j.035.us.us.us.i.ph, %for.body8.us.us.us.i.preheader ]
  %add10.us.us.us.i = add i64 %j.035.us.us.us.i, %mul9.us.us.us.i
  %arrayidx11.us.us.us.i = getelementptr inbounds float, float* %B.sroa.0.0, i64 %add10.us.us.us.i
  %60 = load float, float* %arrayidx11.us.us.us.i, align 4, !tbaa !8
  %add14.us.us.us.i = add i64 %j.035.us.us.us.i, %mul13.us.us.i
  %arrayidx15.us.us.us.i = getelementptr inbounds float, float* %C.sroa.0.0, i64 %add14.us.us.us.i
  %61 = load float, float* %arrayidx15.us.us.us.i, align 4, !tbaa !8
  %62 = tail call float @llvm.fmuladd.f32(float %44, float %60, float %61) #17
  store float %62, float* %arrayidx15.us.us.us.i, align 4, !tbaa !8
  %inc.us.us.us.i = add nuw i64 %j.035.us.us.us.i, 1
  %exitcond.not.i130 = icmp eq i64 %inc.us.us.us.i, %call3
  br i1 %exitcond.not.i130, label %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i, label %for.body8.us.us.us.i, !llvm.loop !45

for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i: ; preds = %for.body8.us.us.us.i, %middle.block313
  %inc17.us.us.us.i = add nuw i64 %k.037.us.us.us.i, 1
  %exitcond48.not.i = icmp eq i64 %inc17.us.us.us.i, %call5
  br i1 %exitcond48.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i, label %for.cond5.preheader.us.us.us.i, !llvm.loop !34

for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i: ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.us.us.i
  %inc20.us.us.i = add nuw i64 %i.039.us.us.i, 1
  %exitcond49.not.i = icmp eq i64 %inc20.us.us.i, %call1
  br i1 %exitcond49.not.i, label %invoke.cont30, label %for.cond1.preheader.us.us.i, !llvm.loop !35

invoke.cont30:                                    ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us.i, %_Z10initMatrixPfS_S_mmm.exit
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
  %63 = bitcast %"class.std::basic_ostream"* %call.i133 to i8**
  %vtable.i = load i8*, i8** %63, align 8, !tbaa !46
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %64 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %64, align 8
  %65 = bitcast %"class.std::basic_ostream"* %call.i133 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %65, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 240
  %66 = bitcast i8* %_M_ctype.i.i to %"class.std::ctype"**
  %67 = load %"class.std::ctype"*, %"class.std::ctype"** %66, align 8, !tbaa !48
  %tobool.not.i.i.i166 = icmp eq %"class.std::ctype"* %67, null
  br i1 %tobool.not.i.i.i166, label %if.then.i.i.i167, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

if.then.i.i.i167:                                 ; preds = %invoke.cont36
  invoke void @_ZSt16__throw_bad_castv() #18
          to label %.noexc169 unwind label %lpad31

.noexc169:                                        ; preds = %if.then.i.i.i167
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %invoke.cont36
  %_M_widen_ok.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %67, i64 0, i32 8
  %68 = load i8, i8* %_M_widen_ok.i.i.i, align 8, !tbaa !51
  %tobool.not.i3.i.i = icmp eq i8 %68, 0
  br i1 %tobool.not.i3.i.i, label %if.end.i.i.i, label %if.then.i4.i.i

if.then.i4.i.i:                                   ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %arrayidx.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %67, i64 0, i32 9, i64 10
  %69 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !53
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i

if.end.i.i.i:                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %67)
          to label %.noexc170 unwind label %lpad31

.noexc170:                                        ; preds = %if.end.i.i.i
  %70 = bitcast %"class.std::ctype"* %67 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %70, align 8, !tbaa !46
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i, i64 6
  %71 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i.i.i171 = invoke noundef i8 %71(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %67, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i unwind label %lpad31

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i: ; preds = %.noexc170, %if.then.i4.i.i
  %retval.0.i.i.i = phi i8 [ %69, %if.then.i4.i.i ], [ %call.i.i.i171, %.noexc170 ]
  %call1.i172 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i133, i8 noundef %retval.0.i.i.i)
          to label %call1.i.noexc unwind label %lpad31

call1.i.noexc:                                    ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i
  %call.i.i168173 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i172)
          to label %invoke.cont38 unwind label %lpad31

invoke.cont38:                                    ; preds = %call1.i.noexc
  %call1.i137 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i64 noundef 13)
          to label %invoke.cont47 unwind label %lpad44

invoke.cont47:                                    ; preds = %invoke.cont38
  %mul41 = shl i64 %mul6, 1
  %mul42 = mul i64 %mul41, %call1
  %conv = uitofp i64 %mul42 to double
  %mul43 = fmul double %conv, 1.000000e-09
  %div = fdiv double %mul43, %div.i.i.i
  %call.i139 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div)
          to label %invoke.cont49 unwind label %lpad44

invoke.cont49:                                    ; preds = %invoke.cont47
  %call1.i142 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i139, i8* noundef nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i64 noundef 7)
          to label %invoke.cont51 unwind label %lpad44

invoke.cont51:                                    ; preds = %invoke.cont49
  %72 = bitcast %"class.std::basic_ostream"* %call.i139 to i8**
  %vtable.i174 = load i8*, i8** %72, align 8, !tbaa !46
  %vbase.offset.ptr.i175 = getelementptr i8, i8* %vtable.i174, i64 -24
  %73 = bitcast i8* %vbase.offset.ptr.i175 to i64*
  %vbase.offset.i176 = load i64, i64* %73, align 8
  %74 = bitcast %"class.std::basic_ostream"* %call.i139 to i8*
  %add.ptr.i177 = getelementptr inbounds i8, i8* %74, i64 %vbase.offset.i176
  %_M_ctype.i.i178 = getelementptr inbounds i8, i8* %add.ptr.i177, i64 240
  %75 = bitcast i8* %_M_ctype.i.i178 to %"class.std::ctype"**
  %76 = load %"class.std::ctype"*, %"class.std::ctype"** %75, align 8, !tbaa !48
  %tobool.not.i.i.i179 = icmp eq %"class.std::ctype"* %76, null
  br i1 %tobool.not.i.i.i179, label %if.then.i.i.i180, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183

if.then.i.i.i180:                                 ; preds = %invoke.cont51
  invoke void @_ZSt16__throw_bad_castv() #18
          to label %.noexc192 unwind label %lpad44

.noexc192:                                        ; preds = %if.then.i.i.i180
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183: ; preds = %invoke.cont51
  %_M_widen_ok.i.i.i181 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %76, i64 0, i32 8
  %77 = load i8, i8* %_M_widen_ok.i.i.i181, align 8, !tbaa !51
  %tobool.not.i3.i.i182 = icmp eq i8 %77, 0
  br i1 %tobool.not.i3.i.i182, label %if.end.i.i.i188, label %if.then.i4.i.i185

if.then.i4.i.i185:                                ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183
  %arrayidx.i.i.i184 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %76, i64 0, i32 9, i64 10
  %78 = load i8, i8* %arrayidx.i.i.i184, align 1, !tbaa !53
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191

if.end.i.i.i188:                                  ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i183
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %76)
          to label %.noexc193 unwind label %lpad44

.noexc193:                                        ; preds = %if.end.i.i.i188
  %79 = bitcast %"class.std::ctype"* %76 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i186 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %79, align 8, !tbaa !46
  %vfn.i.i.i187 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i186, i64 6
  %80 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i187, align 8
  %call.i.i.i195 = invoke noundef i8 %80(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %76, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191 unwind label %lpad44

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191: ; preds = %.noexc193, %if.then.i4.i.i185
  %retval.0.i.i.i189 = phi i8 [ %78, %if.then.i4.i.i185 ], [ %call.i.i.i195, %.noexc193 ]
  %call1.i197 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i139, i8 noundef %retval.0.i.i.i189)
          to label %call1.i.noexc196 unwind label %lpad44

call1.i.noexc196:                                 ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191
  %call.i.i190198 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i197)
          to label %invoke.cont53 unwind label %lpad44

invoke.cont53:                                    ; preds = %call1.i.noexc196
  %tobool.not.i.i.i = icmp eq float* %C.sroa.0.0, null
  br i1 %tobool.not.i.i.i, label %_ZNSt6vectorIfSaIfEED2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont53
  %81 = bitcast float* %C.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %81) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit

_ZNSt6vectorIfSaIfEED2Ev.exit:                    ; preds = %invoke.cont53, %if.then.i.i.i
  %tobool.not.i.i.i147 = icmp eq float* %B.sroa.0.0, null
  br i1 %tobool.not.i.i.i147, label %_ZNSt6vectorIfSaIfEED2Ev.exit149, label %if.then.i.i.i148

if.then.i.i.i148:                                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit
  %82 = bitcast float* %B.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %82) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit149

_ZNSt6vectorIfSaIfEED2Ev.exit149:                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit, %if.then.i.i.i148
  %tobool.not.i.i.i151 = icmp eq float* %A.sroa.0.0, null
  br i1 %tobool.not.i.i.i151, label %_ZNSt6vectorIfSaIfEED2Ev.exit153, label %if.then.i.i.i152

if.then.i.i.i152:                                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit149
  %83 = bitcast float* %A.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %83) #17
  br label %_ZNSt6vectorIfSaIfEED2Ev.exit153

_ZNSt6vectorIfSaIfEED2Ev.exit153:                 ; preds = %_ZNSt6vectorIfSaIfEED2Ev.exit149, %if.then.i.i.i152
  ret i32 0

lpad8:                                            ; preds = %for.body.i.i.preheader.i.i.i.i.i104, %if.then.i.i98
  %84 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup60

lpad12:                                           ; preds = %for.body.i.i.preheader.i.i.i.i.i118, %if.then.i.i112
  %85 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup58

lpad31:                                           ; preds = %call1.i.noexc, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i, %.noexc170, %if.end.i.i.i, %if.then.i.i.i167, %invoke.cont32, %invoke.cont30
  %86 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad44:                                           ; preds = %call1.i.noexc196, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i191, %.noexc193, %if.end.i.i.i188, %if.then.i.i.i180, %invoke.cont49, %invoke.cont47, %invoke.cont38
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad44, %lpad31
  %.pn = phi { i8*, i32 } [ %87, %lpad44 ], [ %86, %lpad31 ]
  %tobool.not.i.i.i155 = icmp eq float* %C.sroa.0.0, null
  br i1 %tobool.not.i.i.i155, label %ehcleanup58, label %if.then.i.i.i156

if.then.i.i.i156:                                 ; preds = %ehcleanup
  %88 = bitcast float* %C.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %88) #17
  br label %ehcleanup58

ehcleanup58:                                      ; preds = %if.then.i.i.i156, %ehcleanup, %lpad12
  %.pn.pn = phi { i8*, i32 } [ %85, %lpad12 ], [ %.pn, %ehcleanup ], [ %.pn, %if.then.i.i.i156 ]
  %tobool.not.i.i.i159 = icmp eq float* %B.sroa.0.0, null
  br i1 %tobool.not.i.i.i159, label %ehcleanup60, label %if.then.i.i.i160

if.then.i.i.i160:                                 ; preds = %ehcleanup58
  %89 = bitcast float* %B.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %89) #17
  br label %ehcleanup60

ehcleanup60:                                      ; preds = %if.then.i.i.i160, %ehcleanup58, %lpad8
  %.pn.pn.pn = phi { i8*, i32 } [ %84, %lpad8 ], [ %.pn.pn, %ehcleanup58 ], [ %.pn.pn, %if.then.i.i.i160 ]
  %tobool.not.i.i.i163 = icmp eq float* %A.sroa.0.0, null
  br i1 %tobool.not.i.i.i163, label %ehcleanup62, label %if.then.i.i.i164

if.then.i.i.i164:                                 ; preds = %ehcleanup60
  %90 = bitcast float* %A.sroa.0.0 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %90) #17
  br label %ehcleanup62

ehcleanup62:                                      ; preds = %if.then.i.i.i164, %ehcleanup60
  resume { i8*, i32 } %.pn.pn.pn
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
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #17
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #15

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #2 = { nofree nounwind }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind writeonly uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly mustprogress nofree nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #6 = { norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
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
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !10, i64 0}
!38 = distinct !{!38, !13, !14}
!39 = distinct !{!39, !13, !16, !14}
!40 = distinct !{!40, !13, !14}
!41 = distinct !{!41, !13, !16, !14}
!42 = distinct !{!42, !13, !14}
!43 = distinct !{!43, !13, !16, !14}
!44 = distinct !{!44, !13, !14}
!45 = distinct !{!45, !13, !16, !14}
!46 = !{!47, !47, i64 0}
!47 = !{!"vtable pointer", !11, i64 0}
!48 = !{!49, !37, i64 240}
!49 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !37, i64 216, !10, i64 224, !50, i64 225, !37, i64 232, !37, i64 240, !37, i64 248, !37, i64 256}
!50 = !{!"bool", !10, i64 0}
!51 = !{!52, !10, i64 56}
!52 = !{!"_ZTSSt5ctypeIcE", !37, i64 16, !50, i64 24, !37, i64 32, !37, i64 40, !37, i64 48, !10, i64 56, !10, i64 57, !10, i64 313, !10, i64 569}
!53 = !{!10, !10, i64 0}
