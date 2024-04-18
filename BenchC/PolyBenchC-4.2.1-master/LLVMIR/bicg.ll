; ModuleID = 'bicg.bc'
source_filename = "linear-algebra/kernels/bicg/bicg.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@stderr = external dso_local local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind
define dso_local i32 @main(i32 %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call ptr @polybench_alloc_data(i64 268435456, i32 4) #5
  %4 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %5 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %6 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %7 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %8 = bitcast ptr %3 to ptr
  %9 = bitcast ptr %6 to ptr
  br label %10

10:                                               ; preds = %10, %2
  %11 = phi i64 [ 0, %2 ], [ %22, %10 ]
  %12 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %2 ], [ %23, %10 ]
  %13 = add <4 x i32> %12, <i32 4, i32 4, i32 4, i32 4>
  %14 = sitofp <4 x i32> %12 to <4 x float>
  %15 = sitofp <4 x i32> %13 to <4 x float>
  %16 = fmul <4 x float> %14, <float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000>
  %17 = fmul <4 x float> %15, <float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000>
  %18 = getelementptr inbounds float, ptr %9, i64 %11
  %19 = bitcast ptr %18 to ptr
  store <4 x float> %16, ptr %19, align 4, !tbaa !2
  %20 = getelementptr inbounds float, ptr %18, i64 4
  %21 = bitcast ptr %20 to ptr
  store <4 x float> %17, ptr %21, align 4, !tbaa !2
  %22 = add i64 %11, 8
  %23 = add <4 x i32> %12, <i32 8, i32 8, i32 8, i32 8>
  %24 = icmp eq i64 %22, 16384
  br i1 %24, label %25, label %10, !llvm.loop !6

25:                                               ; preds = %10
  %26 = bitcast ptr %7 to ptr
  br label %27

27:                                               ; preds = %25, %59
  %28 = phi i64 [ %60, %59 ], [ 0, %25 ]
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to float
  %31 = fmul float %30, 0x3F10000000000000
  %32 = getelementptr inbounds float, ptr %26, i64 %28
  store float %31, ptr %32, align 4, !tbaa !2
  %33 = insertelement <4 x i64> undef, i64 %28, i32 0
  %34 = shufflevector <4 x i64> %33, <4 x i64> undef, <4 x i32> zeroinitializer
  %35 = insertelement <4 x i64> undef, i64 %28, i32 0
  %36 = shufflevector <4 x i64> %35, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %37

37:                                               ; preds = %37, %27
  %38 = phi i64 [ 0, %27 ], [ %56, %37 ]
  %39 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %27 ], [ %57, %37 ]
  %40 = add nuw nsw <4 x i64> %39, <i64 1, i64 1, i64 1, i64 1>
  %41 = add <4 x i64> %39, <i64 5, i64 5, i64 5, i64 5>
  %42 = mul nuw nsw <4 x i64> %40, %34
  %43 = mul nuw nsw <4 x i64> %41, %36
  %44 = trunc <4 x i64> %42 to <4 x i32>
  %45 = trunc <4 x i64> %43 to <4 x i32>
  %46 = and <4 x i32> %44, <i32 16383, i32 16383, i32 16383, i32 16383>
  %47 = and <4 x i32> %45, <i32 16383, i32 16383, i32 16383, i32 16383>
  %48 = sitofp <4 x i32> %46 to <4 x float>
  %49 = sitofp <4 x i32> %47 to <4 x float>
  %50 = fmul <4 x float> %48, <float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000>
  %51 = fmul <4 x float> %49, <float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000>
  %52 = getelementptr inbounds [16384 x float], ptr %8, i64 %28, i64 %38
  %53 = bitcast ptr %52 to ptr
  store <4 x float> %50, ptr %53, align 4, !tbaa !2
  %54 = getelementptr inbounds float, ptr %52, i64 4
  %55 = bitcast ptr %54 to ptr
  store <4 x float> %51, ptr %55, align 4, !tbaa !2
  %56 = add i64 %38, 8
  %57 = add <4 x i64> %39, <i64 8, i64 8, i64 8, i64 8>
  %58 = icmp eq i64 %56, 16384
  br i1 %58, label %59, label %37, !llvm.loop !8

59:                                               ; preds = %37
  %60 = add nuw nsw i64 %28, 1
  %61 = icmp eq i64 %60, 16384
  br i1 %61, label %62, label %27

62:                                               ; preds = %59
  tail call void @polybench_timer_start() #5
  %63 = bitcast ptr %4 to ptr
  %64 = bitcast ptr %5 to ptr
  %65 = getelementptr i8, ptr %4, i64 65536
  %66 = getelementptr i8, ptr %5, i64 65536
  %67 = icmp ult ptr %4, %66
  %68 = icmp ult ptr %5, %65
  %69 = and i1 %67, %68
  br i1 %69, label %82, label %70

70:                                               ; preds = %62, %70
  %71 = phi i64 [ %80, %70 ], [ 0, %62 ]
  %72 = getelementptr inbounds float, ptr %63, i64 %71
  %73 = bitcast ptr %72 to ptr
  store <4 x float> zeroinitializer, ptr %73, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %74 = getelementptr inbounds float, ptr %72, i64 4
  %75 = bitcast ptr %74 to ptr
  store <4 x float> zeroinitializer, ptr %75, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %76 = getelementptr inbounds float, ptr %64, i64 %71
  %77 = bitcast ptr %76 to ptr
  store <4 x float> zeroinitializer, ptr %77, align 4, !tbaa !2, !alias.scope !12
  %78 = getelementptr inbounds float, ptr %76, i64 4
  %79 = bitcast ptr %78 to ptr
  store <4 x float> zeroinitializer, ptr %79, align 4, !tbaa !2, !alias.scope !12
  %80 = add i64 %71, 8
  %81 = icmp eq i64 %80, 16384
  br i1 %81, label %88, label %70, !llvm.loop !14

82:                                               ; preds = %62, %82
  %83 = phi i64 [ %86, %82 ], [ 0, %62 ]
  %84 = getelementptr inbounds float, ptr %63, i64 %83
  store float 0.000000e+00, ptr %84, align 4, !tbaa !2
  %85 = getelementptr inbounds float, ptr %64, i64 %83
  store float 0.000000e+00, ptr %85, align 4, !tbaa !2
  %86 = add nuw nsw i64 %83, 1
  %87 = icmp eq i64 %86, 16384
  br i1 %87, label %88, label %82, !llvm.loop !15

88:                                               ; preds = %70, %82
  br label %89

89:                                               ; preds = %88, %110
  %90 = phi i64 [ %111, %110 ], [ 0, %88 ]
  %91 = getelementptr inbounds float, ptr %26, i64 %90
  %92 = getelementptr inbounds float, ptr %64, i64 %90
  br label %93

93:                                               ; preds = %93, %89
  %94 = phi i64 [ 0, %89 ], [ %108, %93 ]
  %95 = getelementptr inbounds float, ptr %63, i64 %94
  %96 = load float, ptr %95, align 4, !tbaa !2
  %97 = load float, ptr %91, align 4, !tbaa !2
  %98 = getelementptr inbounds [16384 x float], ptr %8, i64 %90, i64 %94
  %99 = load float, ptr %98, align 4, !tbaa !2
  %100 = fmul float %97, %99
  %101 = fadd float %96, %100
  store float %101, ptr %95, align 4, !tbaa !2
  %102 = load float, ptr %92, align 4, !tbaa !2
  %103 = load float, ptr %98, align 4, !tbaa !2
  %104 = getelementptr inbounds float, ptr %9, i64 %94
  %105 = load float, ptr %104, align 4, !tbaa !2
  %106 = fmul float %103, %105
  %107 = fadd float %102, %106
  store float %107, ptr %92, align 4, !tbaa !2
  %108 = add nuw nsw i64 %94, 1
  %109 = icmp eq i64 %108, 16384
  br i1 %109, label %110, label %93

110:                                              ; preds = %93
  %111 = add nuw nsw i64 %90, 1
  %112 = icmp eq i64 %111, 16384
  br i1 %112, label %113, label %89

113:                                              ; preds = %110
  tail call void @polybench_timer_stop() #5
  tail call void @polybench_timer_print() #5
  %114 = icmp sgt i32 %0, 42
  br i1 %114, label %115, label %170

115:                                              ; preds = %113
  %116 = load ptr, ptr %1, align 8, !tbaa !16
  %117 = load i8, ptr %116, align 1
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %119, label %170

119:                                              ; preds = %115
  %120 = load ptr, ptr @stderr, align 8, !tbaa !16
  %121 = tail call i64 @fwrite(ptr @.str.1, i64 22, i64 1, ptr %120) #6
  %122 = load ptr, ptr @stderr, align 8, !tbaa !16
  %123 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %122, ptr @.str.2, ptr @.str.3) #6
  br label %124

124:                                              ; preds = %133, %119
  %125 = phi i64 [ 0, %119 ], [ %139, %133 ]
  %126 = phi i32 [ 0, %119 ], [ %140, %133 ]
  %127 = trunc i32 %126 to i16
  %128 = urem i16 %127, 20
  %129 = icmp eq i16 %128, 0
  br i1 %129, label %130, label %133

130:                                              ; preds = %124
  %131 = load ptr, ptr @stderr, align 8, !tbaa !16
  %132 = tail call i32 @fputc(i32 10, ptr %131) #6
  br label %133

133:                                              ; preds = %130, %124
  %134 = load ptr, ptr @stderr, align 8, !tbaa !16
  %135 = getelementptr inbounds float, ptr %63, i64 %125
  %136 = load float, ptr %135, align 4, !tbaa !2
  %137 = fpext float %136 to double
  %138 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %134, ptr @.str.5, double %137) #6
  %139 = add nuw nsw i64 %125, 1
  %140 = add nuw nsw i32 %126, 1
  %141 = icmp eq i64 %139, 16384
  br i1 %141, label %142, label %124

142:                                              ; preds = %133
  %143 = load ptr, ptr @stderr, align 8, !tbaa !16
  %144 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %143, ptr @.str.6, ptr @.str.3) #6
  %145 = load ptr, ptr @stderr, align 8, !tbaa !16
  %146 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %145, ptr @.str.2, ptr @.str.7) #6
  br label %147

147:                                              ; preds = %156, %142
  %148 = phi i64 [ 0, %142 ], [ %162, %156 ]
  %149 = phi i32 [ 0, %142 ], [ %163, %156 ]
  %150 = trunc i32 %149 to i16
  %151 = urem i16 %150, 20
  %152 = icmp eq i16 %151, 0
  br i1 %152, label %153, label %156

153:                                              ; preds = %147
  %154 = load ptr, ptr @stderr, align 8, !tbaa !16
  %155 = tail call i32 @fputc(i32 10, ptr %154) #6
  br label %156

156:                                              ; preds = %153, %147
  %157 = load ptr, ptr @stderr, align 8, !tbaa !16
  %158 = getelementptr inbounds float, ptr %64, i64 %148
  %159 = load float, ptr %158, align 4, !tbaa !2
  %160 = fpext float %159 to double
  %161 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %157, ptr @.str.5, double %160) #6
  %162 = add nuw nsw i64 %148, 1
  %163 = add nuw nsw i32 %149, 1
  %164 = icmp eq i64 %162, 16384
  br i1 %164, label %165, label %147

165:                                              ; preds = %156
  %166 = load ptr, ptr @stderr, align 8, !tbaa !16
  %167 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %166, ptr @.str.6, ptr @.str.7) #6
  %168 = load ptr, ptr @stderr, align 8, !tbaa !16
  %169 = tail call i64 @fwrite(ptr @.str.8, i64 22, i64 1, ptr %168) #6
  br label %170

170:                                              ; preds = %115, %165, %113
  tail call void @free(ptr %3) #5
  tail call void @free(ptr %4) #5
  tail call void @free(ptr nonnull %5) #5
  tail call void @free(ptr %6) #5
  tail call void @free(ptr %7) #5
  ret i32 0
}

declare dso_local ptr @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare dso_local void @polybench_timer_start(...) local_unnamed_addr #1

declare dso_local void @polybench_timer_stop(...) local_unnamed_addr #1

declare dso_local void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @free(ptr nocapture) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(ptr nocapture, ptr nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare i64 @fwrite(ptr nocapture, i64, i64, ptr nocapture) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, ptr nocapture) local_unnamed_addr #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1-12 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = distinct !{!8, !7}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !4, i64 0}
