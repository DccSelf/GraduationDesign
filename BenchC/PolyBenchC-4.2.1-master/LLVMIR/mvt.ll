; ModuleID = 'mvt.bc'
source_filename = "linear-algebra/kernels/mvt/mvt.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@stderr = external dso_local local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind
define dso_local i32 @main(i32 %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call ptr @polybench_alloc_data(i64 268435456, i32 4) #5
  %4 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %5 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %6 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %7 = tail call ptr @polybench_alloc_data(i64 16384, i32 4) #5
  %8 = bitcast ptr %4 to ptr
  %9 = bitcast ptr %5 to ptr
  %10 = bitcast ptr %6 to ptr
  %11 = bitcast ptr %7 to ptr
  %12 = bitcast ptr %3 to ptr
  br label %13

13:                                               ; preds = %35, %2
  %14 = phi i64 [ 0, %2 ], [ %36, %35 ]
  %15 = getelementptr inbounds float, ptr %8, i64 %14
  store float 0.000000e+00, ptr %15, align 4, !tbaa !2
  %16 = getelementptr inbounds float, ptr %9, i64 %14
  store float 0.000000e+00, ptr %16, align 4, !tbaa !2
  %17 = getelementptr inbounds float, ptr %10, i64 %14
  store float 1.000000e+00, ptr %17, align 4, !tbaa !2
  %18 = getelementptr inbounds float, ptr %11, i64 %14
  store float 1.000000e+00, ptr %18, align 4, !tbaa !2
  %19 = insertelement <4 x i64> undef, i64 %14, i32 0
  %20 = shufflevector <4 x i64> %19, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %21

21:                                               ; preds = %21, %13
  %22 = phi i64 [ 0, %13 ], [ %32, %21 ]
  %23 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %13 ], [ %33, %21 ]
  %24 = add nuw nsw <4 x i64> %23, %20
  %25 = trunc <4 x i64> %24 to <4 x i32>
  %26 = sitofp <4 x i32> %25 to <4 x double>
  %27 = fadd <4 x double> %26, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %28 = fptrunc <4 x double> %27 to <4 x float>
  %29 = fmul <4 x float> %28, <float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000, float 0x3F10000000000000>
  %30 = getelementptr inbounds [16384 x float], ptr %12, i64 %14, i64 %22
  %31 = bitcast ptr %30 to ptr
  store <4 x float> %29, ptr %31, align 4, !tbaa !2
  %32 = add i64 %22, 4
  %33 = add <4 x i64> %23, <i64 4, i64 4, i64 4, i64 4>
  %34 = icmp eq i64 %32, 16384
  br i1 %34, label %35, label %21, !llvm.loop !6

35:                                               ; preds = %21
  %36 = add nuw nsw i64 %14, 1
  %37 = icmp eq i64 %36, 16384
  br i1 %37, label %38, label %13

38:                                               ; preds = %35
  tail call void @polybench_timer_start() #5
  br label %39

39:                                               ; preds = %54, %38
  %40 = phi i64 [ 0, %38 ], [ %55, %54 ]
  %41 = getelementptr inbounds float, ptr %8, i64 %40
  %42 = load float, ptr %41, align 4, !tbaa !2
  br label %43

43:                                               ; preds = %43, %39
  %44 = phi float [ %42, %39 ], [ %51, %43 ]
  %45 = phi i64 [ 0, %39 ], [ %52, %43 ]
  %46 = getelementptr inbounds [16384 x float], ptr %12, i64 %40, i64 %45
  %47 = load float, ptr %46, align 4, !tbaa !2
  %48 = getelementptr inbounds float, ptr %10, i64 %45
  %49 = load float, ptr %48, align 4, !tbaa !2
  %50 = fmul float %47, %49
  %51 = fadd float %44, %50
  store float %51, ptr %41, align 4, !tbaa !2
  %52 = add nuw nsw i64 %45, 1
  %53 = icmp eq i64 %52, 16384
  br i1 %53, label %54, label %43

54:                                               ; preds = %43
  %55 = add nuw nsw i64 %40, 1
  %56 = icmp eq i64 %55, 16384
  br i1 %56, label %57, label %39

57:                                               ; preds = %54, %72
  %58 = phi i64 [ %73, %72 ], [ 0, %54 ]
  %59 = getelementptr inbounds float, ptr %9, i64 %58
  %60 = load float, ptr %59, align 4, !tbaa !2
  br label %61

61:                                               ; preds = %61, %57
  %62 = phi float [ %60, %57 ], [ %69, %61 ]
  %63 = phi i64 [ 0, %57 ], [ %70, %61 ]
  %64 = getelementptr inbounds [16384 x float], ptr %12, i64 %63, i64 %58
  %65 = load float, ptr %64, align 4, !tbaa !2
  %66 = getelementptr inbounds float, ptr %11, i64 %63
  %67 = load float, ptr %66, align 4, !tbaa !2
  %68 = fmul float %65, %67
  %69 = fadd float %62, %68
  store float %69, ptr %59, align 4, !tbaa !2
  %70 = add nuw nsw i64 %63, 1
  %71 = icmp eq i64 %70, 16384
  br i1 %71, label %72, label %61

72:                                               ; preds = %61
  %73 = add nuw nsw i64 %58, 1
  %74 = icmp eq i64 %73, 16384
  br i1 %74, label %75, label %57

75:                                               ; preds = %72
  tail call void @polybench_timer_stop() #5
  tail call void @polybench_timer_print() #5
  %76 = icmp sgt i32 %0, 42
  br i1 %76, label %77, label %132

77:                                               ; preds = %75
  %78 = load ptr, ptr %1, align 8, !tbaa !8
  %79 = load i8, ptr %78, align 1
  %80 = icmp eq i8 %79, 0
  br i1 %80, label %81, label %132

81:                                               ; preds = %77
  %82 = load ptr, ptr @stderr, align 8, !tbaa !8
  %83 = tail call i64 @fwrite(ptr @.str.1, i64 22, i64 1, ptr %82) #6
  %84 = load ptr, ptr @stderr, align 8, !tbaa !8
  %85 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %84, ptr @.str.2, ptr @.str.3) #6
  br label %86

86:                                               ; preds = %95, %81
  %87 = phi i64 [ 0, %81 ], [ %101, %95 ]
  %88 = phi i32 [ 0, %81 ], [ %102, %95 ]
  %89 = trunc i32 %88 to i16
  %90 = urem i16 %89, 20
  %91 = icmp eq i16 %90, 0
  br i1 %91, label %92, label %95

92:                                               ; preds = %86
  %93 = load ptr, ptr @stderr, align 8, !tbaa !8
  %94 = tail call i32 @fputc(i32 10, ptr %93) #6
  br label %95

95:                                               ; preds = %92, %86
  %96 = load ptr, ptr @stderr, align 8, !tbaa !8
  %97 = getelementptr inbounds float, ptr %8, i64 %87
  %98 = load float, ptr %97, align 4, !tbaa !2
  %99 = fpext float %98 to double
  %100 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %96, ptr @.str.5, double %99) #6
  %101 = add nuw nsw i64 %87, 1
  %102 = add nuw nsw i32 %88, 1
  %103 = icmp eq i64 %101, 16384
  br i1 %103, label %104, label %86

104:                                              ; preds = %95
  %105 = load ptr, ptr @stderr, align 8, !tbaa !8
  %106 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %105, ptr @.str.6, ptr @.str.3) #6
  %107 = load ptr, ptr @stderr, align 8, !tbaa !8
  %108 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %107, ptr @.str.2, ptr @.str.7) #6
  br label %109

109:                                              ; preds = %118, %104
  %110 = phi i64 [ 0, %104 ], [ %124, %118 ]
  %111 = phi i32 [ 0, %104 ], [ %125, %118 ]
  %112 = trunc i32 %111 to i16
  %113 = urem i16 %112, 20
  %114 = icmp eq i16 %113, 0
  br i1 %114, label %115, label %118

115:                                              ; preds = %109
  %116 = load ptr, ptr @stderr, align 8, !tbaa !8
  %117 = tail call i32 @fputc(i32 10, ptr %116) #6
  br label %118

118:                                              ; preds = %115, %109
  %119 = load ptr, ptr @stderr, align 8, !tbaa !8
  %120 = getelementptr inbounds float, ptr %9, i64 %110
  %121 = load float, ptr %120, align 4, !tbaa !2
  %122 = fpext float %121 to double
  %123 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %119, ptr @.str.5, double %122) #6
  %124 = add nuw nsw i64 %110, 1
  %125 = add nuw nsw i32 %111, 1
  %126 = icmp eq i64 %124, 16384
  br i1 %126, label %127, label %109

127:                                              ; preds = %118
  %128 = load ptr, ptr @stderr, align 8, !tbaa !8
  %129 = tail call i32 (ptr, ptr, ...) @fprintf(ptr %128, ptr @.str.6, ptr @.str.7) #6
  %130 = load ptr, ptr @stderr, align 8, !tbaa !8
  %131 = tail call i64 @fwrite(ptr @.str.8, i64 22, i64 1, ptr %130) #6
  br label %132

132:                                              ; preds = %77, %127, %75
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
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !4, i64 0}
