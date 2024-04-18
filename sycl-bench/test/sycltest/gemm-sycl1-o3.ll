
; __CLANG_OFFLOAD_BUNDLE____START__ sycl-spir64-unknown-unknown
; ModuleID = 'gemm-sycl1.cpp'
source_filename = "gemm-sycl1.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64"
target triple = "spir64-unknown-unknown"

%"class.cl::sycl::range" = type { %"class.cl::sycl::detail::array" }
%"class.cl::sycl::detail::array" = type { [2 x i64] }
%struct.__wrapper_class = type { float addrspace(1)* }
%struct.__wrapper_class.0 = type { float addrspace(1)* }
%struct.__wrapper_class.1 = type { float addrspace(1)* }

$_ZTSN2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EE = comdat any

$_ZTSZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_ = comdat any

@__spirv_BuiltInGlobalInvocationId = external dso_local local_unnamed_addr addrspace(1) constant <3 x i64>, align 32

; Function Attrs: norecurse
define weak_odr dso_local spir_kernel void @_ZTSN2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EE(%"class.cl::sycl::range"* noundef byval(%"class.cl::sycl::range") align 8 %_arg_NumWorkItems, i64 noundef %_arg_N, %struct.__wrapper_class* noundef byval(%struct.__wrapper_class) align 8 %_arg_C, %struct.__wrapper_class.0* noundef byval(%struct.__wrapper_class.0) align 8 %_arg_A, i64 noundef %_arg_K, %struct.__wrapper_class.1* noundef byval(%struct.__wrapper_class.1) align 8 %_arg_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !5 !sycl_kernel_omit_args !6 {
entry:
  call void @__itt_offload_wi_start_wrapper()
  %_arg_C.ascast = addrspacecast %struct.__wrapper_class* %_arg_C to %struct.__wrapper_class addrspace(4)*
  %_arg_A.ascast = addrspacecast %struct.__wrapper_class.0* %_arg_A to %struct.__wrapper_class.0 addrspace(4)*
  %_arg_B.ascast = addrspacecast %struct.__wrapper_class.1* %_arg_B to %struct.__wrapper_class.1 addrspace(4)*
  %0 = getelementptr inbounds %"class.cl::sycl::range", %"class.cl::sycl::range"* %_arg_NumWorkItems, i64 0, i32 0, i32 0, i64 0
  %RoundedRangeKernel.sroa.0.0..sroa_cast8 = addrspacecast i64* %0 to i64 addrspace(4)*
  %RoundedRangeKernel.sroa.0.0.copyload9 = load i64, i64 addrspace(4)* %RoundedRangeKernel.sroa.0.0..sroa_cast8, align 8
  %1 = getelementptr inbounds %struct.__wrapper_class, %struct.__wrapper_class addrspace(4)* %_arg_C.ascast, i64 0, i32 0
  %2 = load float addrspace(1)*, float addrspace(1)* addrspace(4)* %1, align 8, !tbaa !7
  %3 = getelementptr inbounds %struct.__wrapper_class.0, %struct.__wrapper_class.0 addrspace(4)* %_arg_A.ascast, i64 0, i32 0
  %4 = load float addrspace(1)*, float addrspace(1)* addrspace(4)* %3, align 8, !tbaa !7
  %5 = getelementptr inbounds %struct.__wrapper_class.1, %struct.__wrapper_class.1 addrspace(4)* %_arg_B.ascast, i64 0, i32 0
  %6 = load float addrspace(1)*, float addrspace(1)* addrspace(4)* %5, align 8, !tbaa !7
  %7 = load <3 x i64>, <3 x i64> addrspace(4)* addrspacecast (<3 x i64> addrspace(1)* @__spirv_BuiltInGlobalInvocationId to <3 x i64> addrspace(4)*), align 32, !noalias !12
  %8 = extractelement <3 x i64> %7, i64 1
  %cmp.i.i = icmp ult i64 %8, 2147483648
  tail call void @llvm.assume(i1 %cmp.i.i) #3
  %cmp.not.i = icmp ult i64 %8, %RoundedRangeKernel.sroa.0.0.copyload9
  br i1 %cmp.not.i, label %if.end.i, label %_ZNK2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EclES4_.exit

if.end.i:                                         ; preds = %entry
  %9 = extractelement <3 x i64> %7, i64 0
  %cmp.i5.i.i = icmp ult i64 %9, 2147483648
  tail call void @llvm.assume(i1 %cmp.i5.i.i) #3
  %mul4.i.i = mul i64 %9, %_arg_N
  %mul9.i.i = mul i64 %8, %_arg_N
  %mul.i.i = mul i64 %8, %_arg_K
  %add.i.i = add i64 %mul.i.i, %9
  %arrayidx.i9.i26 = getelementptr inbounds float, float addrspace(1)* %4, i64 %add.i.i
  %arrayidx.i9.i = addrspacecast float addrspace(1)* %arrayidx.i9.i26 to float addrspace(4)*
  br label %for.cond.i.i

for.cond.i.i:                                     ; preds = %for.body.i.i, %if.end.i
  %j.0.i.i = phi i64 [ 0, %if.end.i ], [ %inc.i.i, %for.body.i.i ]
  %cmp.i8.i = icmp ult i64 %j.0.i.i, %_arg_N
  br i1 %cmp.i8.i, label %for.body.i.i, label %_ZNK2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EclES4_.exit

for.body.i.i:                                     ; preds = %for.cond.i.i
  %10 = load float, float addrspace(4)* %arrayidx.i9.i, align 4, !tbaa !21
  %add5.i.i = add i64 %mul4.i.i, %j.0.i.i
  %arrayidx6.i.i27 = getelementptr inbounds float, float addrspace(1)* %6, i64 %add5.i.i
  %arrayidx6.i.i = addrspacecast float addrspace(1)* %arrayidx6.i.i27 to float addrspace(4)*
  %11 = load float, float addrspace(4)* %arrayidx6.i.i, align 4, !tbaa !21
  %add10.i.i = add i64 %mul9.i.i, %j.0.i.i
  %arrayidx11.i.i28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %add10.i.i
  %arrayidx11.i.i = addrspacecast float addrspace(1)* %arrayidx11.i.i28 to float addrspace(4)*
  %12 = load float, float addrspace(4)* %arrayidx11.i.i, align 4, !tbaa !21
  %13 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %12) #3
  store float %13, float addrspace(4)* %arrayidx11.i.i, align 4, !tbaa !21
  %inc.i.i = add nuw i64 %j.0.i.i, 1
  br label %for.cond.i.i, !llvm.loop !23

_ZNK2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EclES4_.exit: ; preds = %for.cond.i.i, %entry
  call void @__itt_offload_wi_finish_wrapper()
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: norecurse
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_(i64 noundef %_arg_N, float addrspace(1)* noundef align 4 %_arg_C, float addrspace(1)* noundef align 4 %_arg_A, i64 noundef %_arg_K, float addrspace(1)* noundef align 4 %_arg_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !25 !sycl_kernel_omit_args !26 {
entry:
  call void @__itt_offload_wi_start_wrapper()
  %0 = load <3 x i64>, <3 x i64> addrspace(4)* addrspacecast (<3 x i64> addrspace(1)* @__spirv_BuiltInGlobalInvocationId to <3 x i64> addrspace(4)*), align 32, !noalias !27
  %1 = extractelement <3 x i64> %0, i64 1
  %2 = extractelement <3 x i64> %0, i64 0
  %cmp.i.i = icmp ult i64 %1, 2147483648
  tail call void @llvm.assume(i1 %cmp.i.i)
  %cmp.i5.i = icmp ult i64 %2, 2147483648
  tail call void @llvm.assume(i1 %cmp.i5.i)
  %mul4.i = mul i64 %2, %_arg_N
  %mul9.i = mul i64 %1, %_arg_N
  %mul.i = mul i64 %1, %_arg_K
  %add.i = add i64 %mul.i, %2
  %arrayidx.i16 = getelementptr inbounds float, float addrspace(1)* %_arg_A, i64 %add.i
  %arrayidx.i = addrspacecast float addrspace(1)* %arrayidx.i16 to float addrspace(4)*
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %j.0.i = phi i64 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %cmp.i = icmp ult i64 %j.0.i, %_arg_N
  br i1 %cmp.i, label %for.body.i, label %_ZZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_ENKUlNS0_2idILi2EEEE_clES5_.exit

for.body.i:                                       ; preds = %for.cond.i
  %3 = load float, float addrspace(4)* %arrayidx.i, align 4, !tbaa !21
  %add5.i = add i64 %mul4.i, %j.0.i
  %arrayidx6.i17 = getelementptr inbounds float, float addrspace(1)* %_arg_B, i64 %add5.i
  %arrayidx6.i = addrspacecast float addrspace(1)* %arrayidx6.i17 to float addrspace(4)*
  %4 = load float, float addrspace(4)* %arrayidx6.i, align 4, !tbaa !21
  %add10.i = add i64 %mul9.i, %j.0.i
  %arrayidx11.i18 = getelementptr inbounds float, float addrspace(1)* %_arg_C, i64 %add10.i
  %arrayidx11.i = addrspacecast float addrspace(1)* %arrayidx11.i18 to float addrspace(4)*
  %5 = load float, float addrspace(4)* %arrayidx11.i, align 4, !tbaa !21
  %6 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %5) #3
  store float %6, float addrspace(4)* %arrayidx11.i, align 4, !tbaa !21
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond.i, !llvm.loop !23

_ZZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_ENKUlNS0_2idILi2EEEE_clES5_.exit: ; preds = %for.cond.i
  call void @__itt_offload_wi_finish_wrapper()
  ret void
}

declare dso_local spir_func i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(i8 addrspace(2)*, ...)

declare void @__itt_offload_wi_start_wrapper()

declare void @__itt_offload_wi_finish_wrapper()

attributes #0 = { norecurse "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="gemm-sycl1.cpp" "uniform-work-group-size"="true" }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.spir.version = !{!2}
!spirv.Source = !{!3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{i32 1, i32 2}
!3 = !{i32 4, i32 100000}
!4 = !{!"clang version 15.0.0"}
!5 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!6 = !{i1 false, i1 false, i1 false, i1 false, i1 false, i1 false}
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS15__wrapper_class", !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!13, !15, !17, !19}
!13 = distinct !{!13, !14, !"_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEE8initSizeEv: %agg.result"}
!14 = distinct !{!14, !"_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEE8initSizeEv"}
!15 = distinct !{!15, !16, !"_ZN7__spirvL22initGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEEET0_v: %agg.result"}
!16 = distinct !{!16, !"_ZN7__spirvL22initGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEEET0_v"}
!17 = distinct !{!17, !18, !"_ZN2cl4sycl6detail7Builder7getItemILi2ELb1EEENSt9enable_ifIXT0_EKNS0_4itemIXT_EXT0_EEEE4typeEv: %agg.result"}
!18 = distinct !{!18, !"_ZN2cl4sycl6detail7Builder7getItemILi2ELb1EEENSt9enable_ifIXT0_EKNS0_4itemIXT_EXT0_EEEE4typeEv"}
!19 = distinct !{!19, !20, !"_ZN2cl4sycl6detail7Builder10getElementILi2ELb1EEEDTcl7getItemIXT_EXT0_EEEEPNS0_4itemIXT_EXT0_EEE: %agg.result"}
!20 = distinct !{!20, !"_ZN2cl4sycl6detail7Builder10getElementILi2ELb1EEEDTcl7getItemIXT_EXT0_EEEEPNS0_4itemIXT_EXT0_EEE"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !10, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!26 = !{i1 false, i1 false, i1 false, i1 false, i1 false}
!27 = !{!28, !30, !32, !34}
!28 = distinct !{!28, !29, !"_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEE8initSizeEv: %agg.result"}
!29 = distinct !{!29, !"_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEE8initSizeEv"}
!30 = distinct !{!30, !31, !"_ZN7__spirvL22initGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEEET0_v: %agg.result"}
!31 = distinct !{!31, !"_ZN7__spirvL22initGlobalInvocationIdILi2EN2cl4sycl2idILi2EEEEET0_v"}
!32 = distinct !{!32, !33, !"_ZN2cl4sycl6detail7Builder7getItemILi2ELb1EEENSt9enable_ifIXT0_EKNS0_4itemIXT_EXT0_EEEE4typeEv: %agg.result"}
!33 = distinct !{!33, !"_ZN2cl4sycl6detail7Builder7getItemILi2ELb1EEENSt9enable_ifIXT0_EKNS0_4itemIXT_EXT0_EEEE4typeEv"}
!34 = distinct !{!34, !35, !"_ZN2cl4sycl6detail7Builder10getElementILi2ELb1EEEDTcl7getItemIXT_EXT0_EEEEPNS0_4itemIXT_EXT0_EEE: %agg.result"}
!35 = distinct !{!35, !"_ZN2cl4sycl6detail7Builder10getElementILi2ELb1EEEDTcl7getItemIXT_EXT0_EEEEPNS0_4itemIXT_EXT0_EEE"}

; __CLANG_OFFLOAD_BUNDLE____END__ sycl-spir64-unknown-unknown

; __CLANG_OFFLOAD_BUNDLE____START__ host-aarch64-unknown-linux-gnu
; ModuleID = '/tmp/gemm-sycl1-89ae99.cpp'
source_filename = "/tmp/gemm-sycl1-89ae99.cpp"
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
%"struct.cl::sycl::detail::kernel_param_desc_t" = type { i32, i32, i32 }
%"class.cl::sycl::event" = type { %"class.std::shared_ptr.3" }
%"class.std::shared_ptr.3" = type { %"class.std::__shared_ptr.4" }
%"class.std::__shared_ptr.4" = type { %"class.cl::sycl::detail::event_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::event_impl" = type opaque
%"class.std::__shared_count" = type { %"class.std::_Sp_counted_base"* }
%"class.std::_Sp_counted_base" = type { i32 (...)**, i32, i32 }
%"class.std::function.18" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*, %"class.cl::sycl::handler"*)* }
%"class.std::_Function_base" = type { %"union.std::_Any_data", i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* }
%"union.std::_Any_data" = type { %"union.std::_Nocopy_types" }
%"union.std::_Nocopy_types" = type { { i64, i64 } }
%"class.cl::sycl::handler" = type { %"class.std::shared_ptr", %"class.std::vector.21", %"class.std::vector.31", %"class.std::vector.42", %"class.std::vector.50", %"class.std::vector.58", %"class.std::vector.66", %"class.std::vector.66", %"class.std::vector.71", %"class.cl::sycl::detail::NDRDescT", %"class.std::__cxx11::basic_string", %"class.std::shared_ptr.76", i32, i8*, i8*, i64, %"class.std::vector.26", %"class.std::unique_ptr", %"class.std::unique_ptr.81", i64, %"class.std::unique_ptr.100", %"class.std::vector.112", %"class.std::vector.112", i8, %"struct.cl::sycl::detail::code_location", i8, %"class.cl::sycl::event" }
%"class.std::shared_ptr" = type { %"class.std::__shared_ptr" }
%"class.std::__shared_ptr" = type { %"class.cl::sycl::detail::queue_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::queue_impl" = type opaque
%"class.std::vector.21" = type { %"struct.std::_Vector_base.22" }
%"struct.std::_Vector_base.22" = type { %"struct.std::_Vector_base<std::vector<char>, std::allocator<std::vector<char>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::vector<char>, std::allocator<std::vector<char>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::vector<char>, std::allocator<std::vector<char>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::vector<char>, std::allocator<std::vector<char>>>::_Vector_impl_data" = type { %"class.std::vector.26"*, %"class.std::vector.26"*, %"class.std::vector.26"* }
%"class.std::vector.31" = type { %"struct.std::_Vector_base.32" }
%"struct.std::_Vector_base.32" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::AccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::AccessorImplHost>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::AccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::AccessorImplHost>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::AccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::AccessorImplHost>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::AccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::AccessorImplHost>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.36"*, %"class.std::shared_ptr.36"*, %"class.std::shared_ptr.36"* }
%"class.std::shared_ptr.36" = type { %"class.std::__shared_ptr.37" }
%"class.std::__shared_ptr.37" = type { %"class.cl::sycl::detail::AccessorImplHost"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::AccessorImplHost" = type <{ %"class.cl::sycl::id", %"class.cl::sycl::range", %"class.cl::sycl::range", i32, [4 x i8], %"class.cl::sycl::detail::SYCLMemObjI"*, i32, i32, i32, i8, [3 x i8], i8*, %"class.cl::sycl::detail::Command"*, i8, i8, [6 x i8] }>
%"class.cl::sycl::id" = type { %"class.cl::sycl::detail::array" }
%"class.cl::sycl::detail::array" = type { [3 x i64] }
%"class.cl::sycl::range" = type { %"class.cl::sycl::detail::array" }
%"class.cl::sycl::detail::SYCLMemObjI" = type { i32 (...)**, %"class.std::shared_ptr.39" }
%"class.std::shared_ptr.39" = type { %"class.std::__shared_ptr.40" }
%"class.std::__shared_ptr.40" = type { %"struct.cl::sycl::detail::MemObjRecord"*, %"class.std::__shared_count" }
%"struct.cl::sycl::detail::MemObjRecord" = type opaque
%"class.cl::sycl::detail::Command" = type opaque
%"class.std::vector.42" = type { %"struct.std::_Vector_base.43" }
%"struct.std::_Vector_base.43" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>, std::allocator<std::shared_ptr<cl::sycl::detail::LocalAccessorImplHost>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.47"*, %"class.std::shared_ptr.47"*, %"class.std::shared_ptr.47"* }
%"class.std::shared_ptr.47" = type { %"class.std::__shared_ptr.48" }
%"class.std::__shared_ptr.48" = type { %"class.cl::sycl::detail::LocalAccessorImplHost"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::LocalAccessorImplHost" = type { %"class.cl::sycl::range", i32, i32, %"class.std::vector.26" }
%"class.std::vector.50" = type { %"struct.std::_Vector_base.51" }
%"struct.std::_Vector_base.51" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::stream_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::stream_impl>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::stream_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::stream_impl>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::stream_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::stream_impl>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::stream_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::stream_impl>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.55"*, %"class.std::shared_ptr.55"*, %"class.std::shared_ptr.55"* }
%"class.std::shared_ptr.55" = type { %"class.std::__shared_ptr.56" }
%"class.std::__shared_ptr.56" = type { %"class.cl::sycl::detail::stream_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::stream_impl" = type opaque
%"class.std::vector.58" = type { %"struct.std::_Vector_base.59" }
%"struct.std::_Vector_base.59" = type { %"struct.std::_Vector_base<std::shared_ptr<const void>, std::allocator<std::shared_ptr<const void>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<const void>, std::allocator<std::shared_ptr<const void>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<const void>, std::allocator<std::shared_ptr<const void>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<const void>, std::allocator<std::shared_ptr<const void>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.63"*, %"class.std::shared_ptr.63"*, %"class.std::shared_ptr.63"* }
%"class.std::shared_ptr.63" = type { %"class.std::__shared_ptr.64" }
%"class.std::__shared_ptr.64" = type { i8*, %"class.std::__shared_count" }
%"class.std::vector.66" = type { %"struct.std::_Vector_base.67" }
%"struct.std::_Vector_base.67" = type { %"struct.std::_Vector_base<cl::sycl::detail::ArgDesc, std::allocator<cl::sycl::detail::ArgDesc>>::_Vector_impl" }
%"struct.std::_Vector_base<cl::sycl::detail::ArgDesc, std::allocator<cl::sycl::detail::ArgDesc>>::_Vector_impl" = type { %"struct.std::_Vector_base<cl::sycl::detail::ArgDesc, std::allocator<cl::sycl::detail::ArgDesc>>::_Vector_impl_data" }
%"struct.std::_Vector_base<cl::sycl::detail::ArgDesc, std::allocator<cl::sycl::detail::ArgDesc>>::_Vector_impl_data" = type { %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"* }
%"class.cl::sycl::detail::ArgDesc" = type { i32, i8*, i32, i32 }
%"class.std::vector.71" = type { %"struct.std::_Vector_base.72" }
%"struct.std::_Vector_base.72" = type { %"struct.std::_Vector_base<cl::sycl::detail::AccessorImplHost *, std::allocator<cl::sycl::detail::AccessorImplHost *>>::_Vector_impl" }
%"struct.std::_Vector_base<cl::sycl::detail::AccessorImplHost *, std::allocator<cl::sycl::detail::AccessorImplHost *>>::_Vector_impl" = type { %"struct.std::_Vector_base<cl::sycl::detail::AccessorImplHost *, std::allocator<cl::sycl::detail::AccessorImplHost *>>::_Vector_impl_data" }
%"struct.std::_Vector_base<cl::sycl::detail::AccessorImplHost *, std::allocator<cl::sycl::detail::AccessorImplHost *>>::_Vector_impl_data" = type { %"class.cl::sycl::detail::AccessorImplHost"**, %"class.cl::sycl::detail::AccessorImplHost"**, %"class.cl::sycl::detail::AccessorImplHost"** }
%"class.cl::sycl::detail::NDRDescT" = type { %"class.cl::sycl::range", %"class.cl::sycl::range", %"class.cl::sycl::id", %"class.cl::sycl::range", i64 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%"class.std::shared_ptr.76" = type { %"class.std::__shared_ptr.77" }
%"class.std::__shared_ptr.77" = type { %"class.cl::sycl::detail::kernel_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::kernel_impl" = type opaque
%"class.std::vector.26" = type { %"struct.std::_Vector_base.27" }
%"struct.std::_Vector_base.27" = type { %"struct.std::_Vector_base<char, std::allocator<char>>::_Vector_impl" }
%"struct.std::_Vector_base<char, std::allocator<char>>::_Vector_impl" = type { %"struct.std::_Vector_base<char, std::allocator<char>>::_Vector_impl_data" }
%"struct.std::_Vector_base<char, std::allocator<char>>::_Vector_impl_data" = type { i8*, i8*, i8* }
%"class.std::unique_ptr" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.80" }
%"struct.std::_Head_base.80" = type { %"class.cl::sycl::detail::HostKernelBase"* }
%"class.cl::sycl::detail::HostKernelBase" = type { i32 (...)** }
%"class.std::unique_ptr.81" = type { %"class.std::__uniq_ptr_impl.82" }
%"class.std::__uniq_ptr_impl.82" = type { %"class.std::tuple.83" }
%"class.std::tuple.83" = type { %"struct.std::_Tuple_impl.84" }
%"struct.std::_Tuple_impl.84" = type { %"struct.std::_Head_base.89" }
%"struct.std::_Head_base.89" = type { %"class.cl::sycl::detail::HostTask"* }
%"class.cl::sycl::detail::HostTask" = type { %"class.std::function.90", %"class.std::function.92" }
%"class.std::function.90" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*)* }
%"class.std::function.92" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*, %"class.cl::sycl::interop_handle"*)* }
%"class.cl::sycl::interop_handle" = type { %"class.std::shared_ptr", %"class.std::shared_ptr.12", %"class.std::shared_ptr.15", %"class.std::vector.95" }
%"class.std::shared_ptr.12" = type { %"class.std::__shared_ptr.13" }
%"class.std::__shared_ptr.13" = type { %"class.cl::sycl::detail::device_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::device_impl" = type opaque
%"class.std::shared_ptr.15" = type { %"class.std::__shared_ptr.16" }
%"class.std::__shared_ptr.16" = type { %"class.cl::sycl::detail::context_impl"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::context_impl" = type opaque
%"class.std::vector.95" = type { %"struct.std::_Vector_base.96" }
%"struct.std::_Vector_base.96" = type { %"struct.std::_Vector_base<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>, std::allocator<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>, std::allocator<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>, std::allocator<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>, std::allocator<std::pair<cl::sycl::detail::AccessorImplHost *, _pi_mem *>>>::_Vector_impl_data" = type { %"struct.std::pair"*, %"struct.std::pair"*, %"struct.std::pair"* }
%"struct.std::pair" = type { %"class.cl::sycl::detail::AccessorImplHost"*, %struct._pi_mem* }
%struct._pi_mem = type opaque
%"class.std::unique_ptr.100" = type { %"class.std::__uniq_ptr_impl.101" }
%"class.std::__uniq_ptr_impl.101" = type { %"class.std::tuple.102" }
%"class.std::tuple.102" = type { %"struct.std::_Tuple_impl.103" }
%"struct.std::_Tuple_impl.103" = type { %"struct.std::_Head_base.108" }
%"struct.std::_Head_base.108" = type { %"class.cl::sycl::detail::InteropTask"* }
%"class.cl::sycl::detail::InteropTask" = type { %"class.std::function.109" }
%"class.std::function.109" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*, %"class.cl::sycl::interop_handler"*)* }
%"class.cl::sycl::interop_handler" = type { %"class.std::shared_ptr", %"class.std::vector.95" }
%"class.std::vector.112" = type { %"struct.std::_Vector_base.113" }
%"struct.std::_Vector_base.113" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::event_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::event_impl>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::event_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::event_impl>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::event_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::event_impl>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::event_impl>, std::allocator<std::shared_ptr<cl::sycl::detail::event_impl>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.3"*, %"class.std::shared_ptr.3"*, %"class.std::shared_ptr.3"* }
%"struct.cl::sycl::detail::code_location" = type { i8*, i8*, i64, i64 }
%"class.cl::sycl::context" = type { %"class.std::shared_ptr.15" }
%"class.cl::sycl::queue" = type { %"class.std::shared_ptr" }
%"class.cl::sycl::property_list" = type { %"class.cl::sycl::detail::PropertyListBase" }
%"class.cl::sycl::detail::PropertyListBase" = type { %"class.std::bitset", %"class.std::vector" }
%"class.std::bitset" = type { %"struct.std::_Base_bitset" }
%"struct.std::_Base_bitset" = type { i64 }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>, std::allocator<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>, std::allocator<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>, std::allocator<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>, std::allocator<std::shared_ptr<cl::sycl::detail::PropertyWithDataBase>>>::_Vector_impl_data" = type { %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"* }
%"class.std::shared_ptr.0" = type { %"class.std::__shared_ptr.1" }
%"class.std::__shared_ptr.1" = type { %"class.cl::sycl::detail::PropertyWithDataBase"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::PropertyWithDataBase" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.cl::sycl::device" = type { %"class.std::shared_ptr.12" }
%"class.cl::sycl::default_selector" = type { %"class.cl::sycl::device_selector" }
%"class.cl::sycl::device_selector" = type { i32 (...)** }
%"class.std::function" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*, %"class.cl::sycl::exception_list"*)* }
%"class.cl::sycl::exception_list" = type { %"class.std::vector.7" }
%"class.std::vector.7" = type { %"struct.std::_Vector_base.8" }
%"struct.std::_Vector_base.8" = type { %"struct.std::_Vector_base<std::__exception_ptr::exception_ptr, std::allocator<std::__exception_ptr::exception_ptr>>::_Vector_impl" }
%"struct.std::_Vector_base<std::__exception_ptr::exception_ptr, std::allocator<std::__exception_ptr::exception_ptr>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::__exception_ptr::exception_ptr, std::allocator<std::__exception_ptr::exception_ptr>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::__exception_ptr::exception_ptr, std::allocator<std::__exception_ptr::exception_ptr>>::_Vector_impl_data" = type { %"class.std::__exception_ptr::exception_ptr"*, %"class.std::__exception_ptr::exception_ptr"*, %"class.std::__exception_ptr::exception_ptr"* }
%"class.std::__exception_ptr::exception_ptr" = type { i8* }
%"class.cl::sycl::range.118" = type { %"class.cl::sycl::detail::array.119" }
%"class.cl::sycl::detail::array.119" = type { [2 x i64] }
%class.anon = type { i64*, i64*, i64*, float**, float**, float** }
%"class.cl::sycl::runtime_error" = type { %"class.cl::sycl::exception" }
%"class.cl::sycl::exception" = type { %"class.std::exception", %"class.std::__cxx11::basic_string", i32, %"class.std::shared_ptr.120" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::shared_ptr.120" = type { %"class.std::__shared_ptr.121" }
%"class.std::__shared_ptr.121" = type { %"class.cl::sycl::context"*, %"class.std::__shared_count" }
%"class.cl::sycl::detail::HostKernel" = type { %"class.cl::sycl::detail::HostKernelBase", %"class.std::function.123" }
%"class.std::function.123" = type { %"class.std::_Function_base", void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* }
%"class.cl::sycl::nd_item" = type { %"class.cl::sycl::item", %"class.cl::sycl::item.127", %"class.cl::sycl::group" }
%"class.cl::sycl::item" = type { %"struct.cl::sycl::detail::ItemBase" }
%"struct.cl::sycl::detail::ItemBase" = type { %"class.cl::sycl::range.118", %"class.cl::sycl::id.126", %"class.cl::sycl::id.126" }
%"class.cl::sycl::id.126" = type { %"class.cl::sycl::detail::array.119" }
%"class.cl::sycl::item.127" = type { %"struct.cl::sycl::detail::ItemBase.128" }
%"struct.cl::sycl::detail::ItemBase.128" = type { %"class.cl::sycl::range.118", %"class.cl::sycl::id.126" }
%"class.cl::sycl::group" = type { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118", %"class.cl::sycl::range.118", %"class.cl::sycl::id.126" }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"struct.std::__va_list" = type { i8*, i8*, i8*, i32, i32 }
%"class.cl::sycl::invalid_parameter_error" = type { %"class.cl::sycl::runtime_error" }
%"class.cl::sycl::detail::HostProfilingInfo" = type { i64, i64 }
%"class.cl::sycl::nd_range" = type { %"class.cl::sycl::range", %"class.cl::sycl::range", %"class.cl::sycl::id" }
%"struct.cl::sycl::detail::NDLoopIterateImpl" = type { i8 }
%class.anon.129 = type { %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"*, %"class.cl::sycl::id.126"*, %"class.cl::sycl::detail::HostKernel"* }
%"class.cl::sycl::nd_range_error" = type { %"class.cl::sycl::runtime_error" }
%struct.NormalizedKernelType.137 = type { %class.anon.117 }
%class.anon.117 = type { i64, float*, float*, i64, float* }

$_ZN2cl4sycl5queueC2ERKNS0_13property_listE = comdat any

$_ZN2cl4sycl6detail16PropertyListBaseD2Ev = comdat any

$_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE = comdat any

$_ZN2cl4sycl5eventD2Ev = comdat any

$_ZN2cl4sycl5queueD2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZN2cl4sycl6deviceD2Ev = comdat any

$_ZN2cl4sycl7contextD2Ev = comdat any

$_ZN2cl4sycl6detail15checkValueRangeILi2ENS0_5rangeILi2EEEEENSt9enable_ifIXoosr3std7is_sameIT0_NS3_IXT_EEEEE5valuesr3std7is_sameIS6_NS0_2idIXT_EEEEE5valueEvE4typeERKS6_ = comdat any

$_ZN2cl4sycl13runtime_errorC2EPKci = comdat any

$_ZN2cl4sycl9exceptionD2Ev = comdat any

$_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE = comdat any

$_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev = comdat any

$_ZN2cl4sycl13runtime_errorD0Ev = comdat any

$_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_St9__va_listEmSB_z = comdat any

$_ZN2cl4sycl23invalid_parameter_errorC2EPKci = comdat any

$_ZN2cl4sycl23invalid_parameter_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi = comdat any

$_ZN2cl4sycl23invalid_parameter_errorD0Ev = comdat any

$_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE4callERKNS1_8NDRDescTEPNS1_17HostProfilingInfoE = comdat any

$_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE6getPtrEv = comdat any

$_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev = comdat any

$_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED0Ev = comdat any

$_ZN2cl4sycl6detail8NDRDescT3setEiNS0_8nd_rangeILi3EEE = comdat any

$_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTE = comdat any

$_ZN2cl4sycl14nd_range_errorC2EPKci = comdat any

$_ZN2cl4sycl14nd_range_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi = comdat any

$_ZN2cl4sycl14nd_range_errorD0Ev = comdat any

$_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_ = comdat any

$_ZTSN2cl4sycl13runtime_errorE = comdat any

$_ZTIN2cl4sycl13runtime_errorE = comdat any

$_ZTVN2cl4sycl13runtime_errorE = comdat any

$_ZTSN2cl4sycl23invalid_parameter_errorE = comdat any

$_ZTIN2cl4sycl23invalid_parameter_errorE = comdat any

$_ZTVN2cl4sycl23invalid_parameter_errorE = comdat any

$_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = comdat any

$_ZTSN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = comdat any

$_ZTSN2cl4sycl6detail14HostKernelBaseE = comdat any

$_ZTIN2cl4sycl6detail14HostKernelBaseE = comdat any

$_ZTIN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = comdat any

$_ZTSN2cl4sycl14nd_range_errorE = comdat any

$_ZTIN2cl4sycl14nd_range_errorE = comdat any

$_ZTVN2cl4sycl14nd_range_errorE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [9 x i8] c" M, N, K\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"gemm-sycl1.cpp\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Invalid result\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.4 = private unnamed_addr constant [11 x i8] c"run-time: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c" s\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"Performance: \00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c" GFlops\00", align 1
@_ZTVN2cl4sycl16default_selectorE = external dso_local unnamed_addr constant { [6 x i8*] }, align 8
@_ZTSPZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_ = internal unnamed_addr constant [60 x i8] c"PZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_\00", align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external dso_local global i8*
@.str.10 = private unnamed_addr constant [131 x i8] c"Attempt to set multiple actions for the command group. Command group must consist of a single kernel or explicit memory operation.\00", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external dso_local global i8*
@_ZTSN2cl4sycl13runtime_errorE = linkonce_odr dso_local constant [26 x i8] c"N2cl4sycl13runtime_errorE\00", comdat, align 1
@_ZTIN2cl4sycl9exceptionE = external dso_local constant i8*
@_ZTIN2cl4sycl13runtime_errorE = linkonce_odr dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN2cl4sycl13runtime_errorE, i32 0, i32 0), i8* bitcast (i8** @_ZTIN2cl4sycl9exceptionE to i8*) }, comdat, align 8
@_ZTVN2cl4sycl13runtime_errorE = linkonce_odr dso_local unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*), i8* bitcast (void (%"class.cl::sycl::runtime_error"*)* @_ZN2cl4sycl13runtime_errorD0Ev to i8*), i8* bitcast (i8* (%"class.cl::sycl::exception"*)* @_ZNK2cl4sycl9exception4whatEv to i8*)] }, comdat, align 8
@.str.11 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.14 = private unnamed_addr constant [42 x i8] c"basic_string::_M_construct null not valid\00", align 1
@.str.15 = private unnamed_addr constant [21 x i8] c"basic_string::append\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@_ZTVN2cl4sycl9exceptionE = external dso_local unnamed_addr constant { [5 x i8*] }, align 8
@.str.19 = private unnamed_addr constant [63 x i8] c"_ZTSZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_\00", align 1
@.str.21 = private unnamed_addr constant [19 x i8] c"Index out of range\00", align 1
@_ZTSN2cl4sycl23invalid_parameter_errorE = linkonce_odr dso_local constant [36 x i8] c"N2cl4sycl23invalid_parameter_errorE\00", comdat, align 1
@_ZTIN2cl4sycl23invalid_parameter_errorE = linkonce_odr dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @_ZTSN2cl4sycl23invalid_parameter_errorE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*) }, comdat, align 8
@_ZTVN2cl4sycl23invalid_parameter_errorE = linkonce_odr dso_local unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl23invalid_parameter_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*), i8* bitcast (void (%"class.cl::sycl::invalid_parameter_error"*)* @_ZN2cl4sycl23invalid_parameter_errorD0Ev to i8*), i8* bitcast (i8* (%"class.cl::sycl::exception"*)* @_ZNK2cl4sycl9exception4whatEv to i8*)] }, comdat, align 8
@.str.22 = private unnamed_addr constant [104 x i8] c"Provided range is out of integer limits. Pass `-fno-sycl-id-queries-fit-in-int' to disable range check.\00", align 1
@_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = linkonce_odr dso_local unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE to i8*), i8* bitcast (void (%"class.cl::sycl::detail::HostKernel"*, %"class.cl::sycl::detail::NDRDescT"*, %"class.cl::sycl::detail::HostProfilingInfo"*)* @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE4callERKNS1_8NDRDescTEPNS1_17HostProfilingInfoE to i8*), i8* bitcast (i8* (%"class.cl::sycl::detail::HostKernel"*)* @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE6getPtrEv to i8*), i8* bitcast (void (%"class.cl::sycl::detail::HostKernel"*)* @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev to i8*), i8* bitcast (void (%"class.cl::sycl::detail::HostKernel"*)* @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED0Ev to i8*)] }, comdat, align 8
@_ZTSN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = linkonce_odr dso_local constant [76 x i8] c"N2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE\00", comdat, align 1
@_ZTSN2cl4sycl6detail14HostKernelBaseE = linkonce_odr dso_local constant [34 x i8] c"N2cl4sycl6detail14HostKernelBaseE\00", comdat, align 1
@_ZTIN2cl4sycl6detail14HostKernelBaseE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSN2cl4sycl6detail14HostKernelBaseE, i32 0, i32 0) }, comdat, align 8
@_ZTIN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE = linkonce_odr dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([76 x i8], [76 x i8]* @_ZTSN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN2cl4sycl6detail14HostKernelBaseE to i8*) }, comdat, align 8
@.str.23 = private unnamed_addr constant [35 x i8] c"Invalid local size for global size\00", align 1
@_ZTSN2cl4sycl14nd_range_errorE = linkonce_odr dso_local constant [27 x i8] c"N2cl4sycl14nd_range_errorE\00", comdat, align 1
@_ZTIN2cl4sycl14nd_range_errorE = linkonce_odr dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @_ZTSN2cl4sycl14nd_range_errorE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*) }, comdat, align 8
@_ZTVN2cl4sycl14nd_range_errorE = linkonce_odr dso_local unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl14nd_range_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*), i8* bitcast (void (%"class.cl::sycl::nd_range_error"*)* @_ZN2cl4sycl14nd_range_errorD0Ev to i8*), i8* bitcast (i8* (%"class.cl::sycl::exception"*)* @_ZNK2cl4sycl9exception4whatEv to i8*)] }, comdat, align 8
@.str.25 = private unnamed_addr constant [65 x i8] c"((G % L).size() == 0) && \22global range is not multiple of local\22\00", align 1
@.str.26 = private unnamed_addr constant [96 x i8] c"/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/bin/../include/sycl/CL/sycl/group.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN2cl4sycl5groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE = private unnamed_addr constant [142 x i8] c"sycl::group<2>::group(const range<Dimensions> &, const range<Dimensions> &, const range<Dimensions>, const id<Dimensions> &) [Dimensions = 2]\00", align 1
@.str.28 = private unnamed_addr constant [83 x i8] c"(((G / L) - GroupRange).size() == 0) && \22inconsistent group constructor arguments\22\00", align 1
@_ZTIv = external dso_local local_unnamed_addr constant i8*
@_ZN2cl4sycl6detailL17kernel_signaturesE = internal constant [12 x %"struct.cl::sycl::detail::kernel_param_desc_t"] [%"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 16, i32 0 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 16 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 24 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 32 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 40 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 48 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 0 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 3, i32 8, i32 8 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 3, i32 8, i32 16 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 1, i32 8, i32 24 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 3, i32 8, i32 32 }, %"struct.cl::sycl::detail::kernel_param_desc_t" { i32 15, i32 -987654321, i32 -987654321 }], align 4
@_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType = internal constant [202 x i8] c"ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType\00", align 1
@_ZTIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType = internal constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([202 x i8], [202 x i8]* @_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType, i32 0, i32 0) }, align 8
@_ZTSZ4mainEUlRN2cl4sycl7handlerEE_ = internal constant [31 x i8] c"Z4mainEUlRN2cl4sycl7handlerEE_\00", align 1
@_ZTIZ4mainEUlRN2cl4sycl7handlerEE_ = internal constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @_ZTSZ4mainEUlRN2cl4sycl7handlerEE_, i32 0, i32 0) }, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_gemm_sycl1_89ae99.cpp, i8* null }]

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

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind uwtable
define dso_local void @_Z11naiveMatmulPfS_S_mmm(float* nocapture noundef %C, float* nocapture noundef readonly %A, float* nocapture noundef readonly %B, i64 noundef %M, i64 noundef %N, i64 noundef %K) local_unnamed_addr #6 {
entry:
  %cmp51.not = icmp eq i64 %M, 0
  %cmp348.not = icmp eq i64 %K, 0
  %or.cond = or i1 %cmp51.not, %cmp348.not
  br i1 %or.cond, label %for.cond.cleanup, label %for.cond1.preheader.us.preheader

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %min.iters.check = icmp ult i64 %K, 8
  %n.vec = and i64 %K, -8
  %cmp.n = icmp eq i64 %n.vec, %K
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.cond.cleanup4_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.cond.cleanup4_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = mul i64 %indvars.iv60, %N
  %scevgep = getelementptr float, float* %C, i64 %0
  %1 = add i64 %0, %K
  %scevgep68 = getelementptr float, float* %C, i64 %1
  %2 = mul i64 %indvars.iv60, %K
  %3 = add i64 %2, 1
  %mul.us = mul i64 %indvars.iv60, %K
  %mul20.us = mul i64 %indvars.iv60, %N
  br label %for.cond6.preheader.us

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body10.us ], [ %indvars.iv.ph, %for.body10.us.preheader ]
  %4 = load float, float* %arrayidx.us, align 4, !tbaa !8
  %add16.us = add i64 %indvars.iv, %mul14.us
  %arrayidx17.us = getelementptr inbounds float, float* %B, i64 %add16.us
  %5 = load float, float* %arrayidx17.us, align 4, !tbaa !8
  %add22.us = add i64 %indvars.iv, %mul20.us
  %arrayidx23.us = getelementptr inbounds float, float* %C, i64 %add22.us
  %6 = load float, float* %arrayidx23.us, align 4, !tbaa !8
  %7 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %6)
  store float %7, float* %arrayidx23.us, align 4, !tbaa !8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %K
  br i1 %exitcond.not, label %for.cond6.for.cond.cleanup9_crit_edge.us, label %for.body10.us, !llvm.loop !24

for.cond6.preheader.us:                           ; preds = %for.cond1.preheader.us, %for.cond6.for.cond.cleanup9_crit_edge.us
  %indvars.iv56 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next57, %for.cond6.for.cond.cleanup9_crit_edge.us ]
  %add.us = add i64 %indvars.iv56, %mul.us
  %arrayidx.us = getelementptr inbounds float, float* %A, i64 %add.us
  %mul14.us = mul i64 %indvars.iv56, %N
  br i1 %min.iters.check, label %for.body10.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond6.preheader.us
  %8 = mul i64 %indvars.iv56, %N
  %9 = add i64 %8, %K
  %scevgep76 = getelementptr float, float* %B, i64 %9
  %scevgep74 = getelementptr float, float* %B, i64 %8
  %10 = add i64 %3, %indvars.iv56
  %scevgep72 = getelementptr float, float* %A, i64 %10
  %11 = add i64 %2, %indvars.iv56
  %scevgep70 = getelementptr float, float* %A, i64 %11
  %bound0 = icmp ult float* %scevgep, %scevgep72
  %bound1 = icmp ult float* %scevgep70, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound078 = icmp ult float* %scevgep, %scevgep76
  %bound179 = icmp ult float* %scevgep74, %scevgep68
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx = or i1 %found.conflict, %found.conflict80
  br i1 %conflict.rdx, label %for.body10.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %12 = load float, float* %arrayidx.us, align 4, !tbaa !8, !alias.scope !25
  %broadcast.splatinsert = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert84 = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat85 = shufflevector <4 x float> %broadcast.splatinsert84, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %13 = add i64 %index, %mul14.us
  %14 = getelementptr inbounds float, float* %B, i64 %13
  %15 = bitcast float* %14 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %15, align 4, !tbaa !8, !alias.scope !28
  %16 = getelementptr inbounds float, float* %14, i64 4
  %17 = bitcast float* %16 to <4 x float>*
  %wide.load81 = load <4 x float>, <4 x float>* %17, align 4, !tbaa !8, !alias.scope !28
  %18 = add i64 %index, %mul20.us
  %19 = getelementptr inbounds float, float* %C, i64 %18
  %20 = bitcast float* %19 to <4 x float>*
  %wide.load82 = load <4 x float>, <4 x float>* %20, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %21 = getelementptr inbounds float, float* %19, i64 4
  %22 = bitcast float* %21 to <4 x float>*
  %wide.load83 = load <4 x float>, <4 x float>* %22, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %23 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load82)
  %24 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat85, <4 x float> %wide.load81, <4 x float> %wide.load83)
  %25 = bitcast float* %19 to <4 x float>*
  store <4 x float> %23, <4 x float>* %25, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %26 = bitcast float* %21 to <4 x float>*
  store <4 x float> %24, <4 x float>* %26, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %index.next = add nuw i64 %index, 8
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !33

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond6.for.cond.cleanup9_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %vector.memcheck, %for.cond6.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond6.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body10.us

for.cond6.for.cond.cleanup9_crit_edge.us:         ; preds = %for.body10.us, %middle.block
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59.not = icmp eq i64 %indvars.iv.next57, %K
  br i1 %exitcond59.not, label %for.cond1.for.cond.cleanup4_crit_edge.us, label %for.cond6.preheader.us, !llvm.loop !34

for.cond1.for.cond.cleanup4_crit_edge.us:         ; preds = %for.cond6.for.cond.cleanup9_crit_edge.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63.not = icmp eq i64 %indvars.iv.next61, %M
  br i1 %exitcond63.not, label %for.cond.cleanup, label %for.cond1.preheader.us, !llvm.loop !35

for.cond.cleanup:                                 ; preds = %for.cond1.for.cond.cleanup4_crit_edge.us, %entry
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind readonly willreturn uwtable
define dso_local noundef i1 @_Z6verifyPfS_mm(float* nocapture noundef readonly %C, float* nocapture noundef readonly %_C, i64 noundef %M, i64 noundef %N) local_unnamed_addr #7 {
entry:
  %mul = mul i64 %N, %M
  %cmp7.not = icmp eq i64 %mul, 0
  br i1 %cmp7.not, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = load float, float* %C, align 4, !tbaa !8
  %1 = load float, float* %_C, align 4, !tbaa !8
  %sub11 = fsub float %0, %1
  %2 = tail call float @llvm.fabs.f32(float %sub11)
  %3 = fpext float %2 to double
  %cmp212 = fcmp ogt double %3, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp212, label %cleanup, label %for.cond

for.cond:                                         ; preds = %for.body.preheader, %for.body
  %i.0813 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %inc = add nuw i64 %i.0813, 1
  %exitcond.not = icmp eq i64 %inc, %mul
  br i1 %exitcond.not, label %cleanup.loopexit, label %for.body, !llvm.loop !36

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds float, float* %C, i64 %inc
  %4 = load float, float* %arrayidx, align 4, !tbaa !8
  %arrayidx1 = getelementptr inbounds float, float* %_C, i64 %inc
  %5 = load float, float* %arrayidx1, align 4, !tbaa !8
  %sub = fsub float %4, %5
  %6 = tail call float @llvm.fabs.f32(float %sub)
  %7 = fpext float %6 to double
  %cmp2 = fcmp ogt double %7, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2, label %cleanup.loopexit, label %for.cond, !llvm.loop !36

cleanup.loopexit:                                 ; preds = %for.cond, %for.body
  %cmp.le = icmp uge i64 %inc, %mul
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %for.body.preheader, %entry
  %cmp.lcssa = phi i1 [ true, %entry ], [ false, %for.body.preheader ], [ %cmp.le, %cleanup.loopexit ]
  ret i1 %cmp.lcssa
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #8 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %Event.i = alloca %"class.cl::sycl::event", align 8
  %agg.tmp.i = alloca %"class.std::function.18", align 8
  %agg.tmp.i.i = alloca %"struct.cl::sycl::detail::code_location", align 8
  %ref.tmp.i = alloca %"class.cl::sycl::context", align 8
  %M = alloca i64, align 8
  %N = alloca i64, align 8
  %K = alloca i64, align 8
  %q = alloca %"class.cl::sycl::queue", align 8
  %ref.tmp = alloca %"class.cl::sycl::property_list", align 8
  %A = alloca float*, align 8
  %ref.tmp9 = alloca %"class.cl::sycl::property_list", align 8
  %agg.tmp = alloca %"struct.cl::sycl::detail::code_location", align 8
  %B = alloca float*, align 8
  %ref.tmp16 = alloca %"class.cl::sycl::property_list", align 8
  %agg.tmp19 = alloca %"struct.cl::sycl::detail::code_location", align 8
  %C = alloca float*, align 8
  %ref.tmp26 = alloca %"class.cl::sycl::property_list", align 8
  %agg.tmp29 = alloca %"struct.cl::sycl::detail::code_location", align 8
  %ref.tmp36 = alloca %"class.cl::sycl::property_list", align 8
  %agg.tmp.ensured = alloca %"class.cl::sycl::event", align 8
  %ref.tmp54 = alloca %"struct.cl::sycl::detail::code_location", align 8
  %ref.tmp75 = alloca %"struct.cl::sycl::detail::code_location", align 8
  %0 = bitcast i64* %M to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #30
  %1 = bitcast i64* %N to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #30
  %2 = bitcast i64* %K to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #30
  %cmp.not = icmp eq i32 %argc, 4
  br i1 %cmp.not, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %argv, align 8, !tbaa !37
  %call = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef %3)
  %call1 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  %call.i = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1)
  tail call void @exit(i32 noundef 1) #31
  unreachable

if.else:                                          ; preds = %entry
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 1
  %4 = load i8*, i8** %arrayidx3, align 8, !tbaa !37
  %call4 = tail call i64 @strtol(i8* nocapture noundef %4, i8** noundef null, i32 noundef 10) #30
  store i64 %call4, i64* %M, align 8, !tbaa !39
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 2
  %5 = load i8*, i8** %arrayidx5, align 8, !tbaa !37
  %call6 = tail call i64 @strtol(i8* nocapture noundef %5, i8** noundef null, i32 noundef 10) #30
  store i64 %call6, i64* %N, align 8, !tbaa !39
  %arrayidx7 = getelementptr inbounds i8*, i8** %argv, i64 3
  %6 = load i8*, i8** %arrayidx7, align 8, !tbaa !37
  %call8 = tail call i64 @strtol(i8* nocapture noundef %6, i8** noundef null, i32 noundef 10) #30
  store i64 %call8, i64* %K, align 8, !tbaa !39
  %7 = bitcast %"class.cl::sycl::queue"* %q to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #30
  %8 = bitcast %"class.cl::sycl::property_list"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %8) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %8, i8 0, i64 32, i1 false)
  invoke void @_ZN2cl4sycl5queueC2ERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.else
  %_M_start.i.i = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %9 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i, align 8, !tbaa !41
  %_M_finish.i.i = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %10 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i, align 8, !tbaa !43
  %cmp.not3.i.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %9, %10
  br i1 %cmp.not3.i.i.i.i.i, label %invoke.cont.i.i, label %for.body.i.i.i.i.i

for.body.i.i.i.i.i:                               ; preds = %invoke.cont, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i
  %__first.addr.04.i.i.i.i.i = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i ], [ %9, %invoke.cont ]
  %_M_pi.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i:                          ; preds = %for.body.i.i.i.i.i
  %_M_use_count.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i

if.else.i.i.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i.i

invoke.cont.i.i.i.i.i.i.i.i.i:                    ; preds = %if.else.i.i.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i.i.i.i.i.i.i ], [ %13, %if.else.i.i.i.i.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i:                        ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i, label %if.else.i11.i.i.i.i.i.i.i.i.i

if.then.i9.i.i.i.i.i.i.i.i.i:                     ; preds = %if.then.i.i.i.i.i.i.i.i.i
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i

if.else.i11.i.i.i.i.i.i.i.i.i:                    ; preds = %if.then.i.i.i.i.i.i.i.i.i
  %17 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i

invoke.cont2.i.i.i.i.i.i.i.i.i:                   ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i, %if.then.i9.i.i.i.i.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i.i.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i.i.i.i.i.i.i ], [ %17, %if.else.i11.i.i.i.i.i.i.i.i.i ]
  %cmp4.i.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i, label %if.then5.i.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

if.then5.i.i.i.i.i.i.i.i.i:                       ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i
  %vtable6.i.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i: ; preds = %if.then5.i.i.i.i.i.i.i.i.i, %invoke.cont2.i.i.i.i.i.i.i.i.i, %invoke.cont.i.i.i.i.i.i.i.i.i, %for.body.i.i.i.i.i
  %incdec.ptr.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i, i64 1
  %cmp.not.i.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i, %10
  br i1 %cmp.not.i.i.i.i.i, label %invoke.cont.loopexit.i.i, label %for.body.i.i.i.i.i, !llvm.loop !50

invoke.cont.loopexit.i.i:                         ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i
  %.pre.i.i = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i, align 8, !tbaa !41
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %invoke.cont.loopexit.i.i, %invoke.cont
  %19 = phi %"class.std::shared_ptr.0"* [ %.pre.i.i, %invoke.cont.loopexit.i.i ], [ %9, %invoke.cont ]
  %tobool.not.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %19, null
  br i1 %tobool.not.i.i.i.i, label %invoke.cont11, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i
  %20 = bitcast %"class.std::shared_ptr.0"* %19 to i8*
  call void @_ZdlPv(i8* noundef nonnull %20) #30
  br label %invoke.cont11

invoke.cont11:                                    ; preds = %if.then.i.i.i.i, %invoke.cont.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #30
  %21 = bitcast float** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #30
  %22 = load i64, i64* %M, align 8, !tbaa !39
  %23 = load i64, i64* %K, align 8, !tbaa !39
  %24 = bitcast %"class.cl::sycl::property_list"* %ref.tmp9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %24) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %24, i8 0, i64 32, i1 false)
  %mul = mul i64 %23, %22
  %MFileName.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i, align 8, !tbaa !51, !alias.scope !53
  %MFunctionName.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i, align 8, !tbaa !56, !alias.scope !53
  %MLineNo.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 2
  %25 = bitcast i64* %MLineNo.i.i to <2 x i64>*
  store <2 x i64> <i64 64, i64 12>, <2 x i64>* %25, align 8, !tbaa !39, !alias.scope !53
  %call14 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp9, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp)
          to label %invoke.cont13 unwind label %lpad12

invoke.cont13:                                    ; preds = %invoke.cont11
  %_M_start.i.i143 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %26 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i143, align 8, !tbaa !41
  %_M_finish.i.i144 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %27 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i144, align 8, !tbaa !43
  %cmp.not3.i.i.i.i.i145 = icmp eq %"class.std::shared_ptr.0"* %26, %27
  br i1 %cmp.not3.i.i.i.i.i145, label %invoke.cont.i.i177, label %for.body.i.i.i.i.i149

for.body.i.i.i.i.i149:                            ; preds = %invoke.cont13, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173
  %__first.addr.04.i.i.i.i.i146 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i171, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173 ], [ %26, %invoke.cont13 ]
  %_M_pi.i.i.i.i.i.i.i.i147 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i146, i64 0, i32 0, i32 1, i32 0
  %28 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i147, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i.i148 = icmp eq %"class.std::_Sp_counted_base"* %28, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i148, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173, label %if.then.i.i.i.i.i.i.i.i151

if.then.i.i.i.i.i.i.i.i151:                       ; preds = %for.body.i.i.i.i.i149
  %_M_use_count.i.i.i.i.i.i.i.i.i150 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %28, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i152, label %if.else.i.i.i.i.i.i.i.i.i.i154

if.then.i.i.i.i.i.i.i.i.i.i152:                   ; preds = %if.then.i.i.i.i.i.i.i.i151
  %29 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i157

if.else.i.i.i.i.i.i.i.i.i.i154:                   ; preds = %if.then.i.i.i.i.i.i.i.i151
  %30 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i.i153 = add nsw i32 %30, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i153, i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i.i157

invoke.cont.i.i.i.i.i.i.i.i.i157:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i154, %if.then.i.i.i.i.i.i.i.i.i.i152
  %retval.0.i.i.i.i.i.i.i.i.i.i155 = phi i32 [ %29, %if.then.i.i.i.i.i.i.i.i.i.i152 ], [ %30, %if.else.i.i.i.i.i.i.i.i.i.i154 ]
  %cmp.i.i.i.i.i.i.i.i.i156 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i155, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i156, label %if.then.i.i.i.i.i.i.i.i.i161, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

if.then.i.i.i.i.i.i.i.i.i161:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i157
  %31 = bitcast %"class.std::_Sp_counted_base"* %28 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i158 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %31, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i.i159 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i158, i64 2
  %32 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i159, align 8
  call void %32(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %28) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i160 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %28, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i162, label %if.else.i11.i.i.i.i.i.i.i.i.i164

if.then.i9.i.i.i.i.i.i.i.i.i162:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i161
  %33 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i167

if.else.i11.i.i.i.i.i.i.i.i.i164:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i161
  %34 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i.i163 = add nsw i32 %34, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i163, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i167

invoke.cont2.i.i.i.i.i.i.i.i.i167:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i164, %if.then.i9.i.i.i.i.i.i.i.i.i162
  %retval.0.i12.i.i.i.i.i.i.i.i.i165 = phi i32 [ %33, %if.then.i9.i.i.i.i.i.i.i.i.i162 ], [ %34, %if.else.i11.i.i.i.i.i.i.i.i.i164 ]
  %cmp4.i.i.i.i.i.i.i.i.i166 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i165, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i166, label %if.then5.i.i.i.i.i.i.i.i.i170, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

if.then5.i.i.i.i.i.i.i.i.i170:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i167
  %vtable6.i.i.i.i.i.i.i.i.i168 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %31, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i.i169 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i168, i64 3
  %35 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i169, align 8
  call void %35(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %28) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173: ; preds = %if.then5.i.i.i.i.i.i.i.i.i170, %invoke.cont2.i.i.i.i.i.i.i.i.i167, %invoke.cont.i.i.i.i.i.i.i.i.i157, %for.body.i.i.i.i.i149
  %incdec.ptr.i.i.i.i.i171 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i146, i64 1
  %cmp.not.i.i.i.i.i172 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i171, %27
  br i1 %cmp.not.i.i.i.i.i172, label %invoke.cont.loopexit.i.i175, label %for.body.i.i.i.i.i149, !llvm.loop !50

invoke.cont.loopexit.i.i175:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173
  %.pre.i.i174 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i143, align 8, !tbaa !41
  br label %invoke.cont.i.i177

invoke.cont.i.i177:                               ; preds = %invoke.cont.loopexit.i.i175, %invoke.cont13
  %36 = phi %"class.std::shared_ptr.0"* [ %.pre.i.i174, %invoke.cont.loopexit.i.i175 ], [ %26, %invoke.cont13 ]
  %tobool.not.i.i.i.i176 = icmp eq %"class.std::shared_ptr.0"* %36, null
  br i1 %tobool.not.i.i.i.i176, label %invoke.cont18, label %if.then.i.i.i.i178

if.then.i.i.i.i178:                               ; preds = %invoke.cont.i.i177
  %37 = bitcast %"class.std::shared_ptr.0"* %36 to i8*
  call void @_ZdlPv(i8* noundef nonnull %37) #30
  br label %invoke.cont18

invoke.cont18:                                    ; preds = %if.then.i.i.i.i178, %invoke.cont.i.i177
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %24) #30
  store float* %call14, float** %A, align 8, !tbaa !37
  %38 = bitcast float** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #30
  %39 = load i64, i64* %K, align 8, !tbaa !39
  %40 = load i64, i64* %N, align 8, !tbaa !39
  %41 = bitcast %"class.cl::sycl::property_list"* %ref.tmp16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %41) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %41, i8 0, i64 32, i1 false)
  %mul15 = mul i64 %40, %39
  %MFileName.i.i180 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i180, align 8, !tbaa !51, !alias.scope !57
  %MFunctionName.i.i181 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i181, align 8, !tbaa !56, !alias.scope !57
  %MLineNo.i.i182 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 2
  %42 = bitcast i64* %MLineNo.i.i182 to <2 x i64>*
  store <2 x i64> <i64 65, i64 12>, <2 x i64>* %42, align 8, !tbaa !39, !alias.scope !57
  %call22 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul15, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp16, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp19)
          to label %invoke.cont21 unwind label %lpad20

invoke.cont21:                                    ; preds = %invoke.cont18
  %_M_start.i.i184 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %43 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i184, align 8, !tbaa !41
  %_M_finish.i.i185 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %44 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i185, align 8, !tbaa !43
  %cmp.not3.i.i.i.i.i186 = icmp eq %"class.std::shared_ptr.0"* %43, %44
  br i1 %cmp.not3.i.i.i.i.i186, label %invoke.cont.i.i218, label %for.body.i.i.i.i.i190

for.body.i.i.i.i.i190:                            ; preds = %invoke.cont21, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214
  %__first.addr.04.i.i.i.i.i187 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i212, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214 ], [ %43, %invoke.cont21 ]
  %_M_pi.i.i.i.i.i.i.i.i188 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i187, i64 0, i32 0, i32 1, i32 0
  %45 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i188, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i.i189 = icmp eq %"class.std::_Sp_counted_base"* %45, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i189, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214, label %if.then.i.i.i.i.i.i.i.i192

if.then.i.i.i.i.i.i.i.i192:                       ; preds = %for.body.i.i.i.i.i190
  %_M_use_count.i.i.i.i.i.i.i.i.i191 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %45, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i193, label %if.else.i.i.i.i.i.i.i.i.i.i195

if.then.i.i.i.i.i.i.i.i.i.i193:                   ; preds = %if.then.i.i.i.i.i.i.i.i192
  %46 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i198

if.else.i.i.i.i.i.i.i.i.i.i195:                   ; preds = %if.then.i.i.i.i.i.i.i.i192
  %47 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i.i194 = add nsw i32 %47, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i194, i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i.i198

invoke.cont.i.i.i.i.i.i.i.i.i198:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i195, %if.then.i.i.i.i.i.i.i.i.i.i193
  %retval.0.i.i.i.i.i.i.i.i.i.i196 = phi i32 [ %46, %if.then.i.i.i.i.i.i.i.i.i.i193 ], [ %47, %if.else.i.i.i.i.i.i.i.i.i.i195 ]
  %cmp.i.i.i.i.i.i.i.i.i197 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i196, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i197, label %if.then.i.i.i.i.i.i.i.i.i202, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

if.then.i.i.i.i.i.i.i.i.i202:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i198
  %48 = bitcast %"class.std::_Sp_counted_base"* %45 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i199 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %48, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i.i200 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i199, i64 2
  %49 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i200, align 8
  call void %49(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %45) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i201 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %45, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i203, label %if.else.i11.i.i.i.i.i.i.i.i.i205

if.then.i9.i.i.i.i.i.i.i.i.i203:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i202
  %50 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i208

if.else.i11.i.i.i.i.i.i.i.i.i205:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i202
  %51 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i.i204 = add nsw i32 %51, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i204, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i208

invoke.cont2.i.i.i.i.i.i.i.i.i208:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i205, %if.then.i9.i.i.i.i.i.i.i.i.i203
  %retval.0.i12.i.i.i.i.i.i.i.i.i206 = phi i32 [ %50, %if.then.i9.i.i.i.i.i.i.i.i.i203 ], [ %51, %if.else.i11.i.i.i.i.i.i.i.i.i205 ]
  %cmp4.i.i.i.i.i.i.i.i.i207 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i206, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i207, label %if.then5.i.i.i.i.i.i.i.i.i211, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

if.then5.i.i.i.i.i.i.i.i.i211:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i208
  %vtable6.i.i.i.i.i.i.i.i.i209 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %48, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i.i210 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i209, i64 3
  %52 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i210, align 8
  call void %52(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %45) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214: ; preds = %if.then5.i.i.i.i.i.i.i.i.i211, %invoke.cont2.i.i.i.i.i.i.i.i.i208, %invoke.cont.i.i.i.i.i.i.i.i.i198, %for.body.i.i.i.i.i190
  %incdec.ptr.i.i.i.i.i212 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i187, i64 1
  %cmp.not.i.i.i.i.i213 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i212, %44
  br i1 %cmp.not.i.i.i.i.i213, label %invoke.cont.loopexit.i.i216, label %for.body.i.i.i.i.i190, !llvm.loop !50

invoke.cont.loopexit.i.i216:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214
  %.pre.i.i215 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i184, align 8, !tbaa !41
  br label %invoke.cont.i.i218

invoke.cont.i.i218:                               ; preds = %invoke.cont.loopexit.i.i216, %invoke.cont21
  %53 = phi %"class.std::shared_ptr.0"* [ %.pre.i.i215, %invoke.cont.loopexit.i.i216 ], [ %43, %invoke.cont21 ]
  %tobool.not.i.i.i.i217 = icmp eq %"class.std::shared_ptr.0"* %53, null
  br i1 %tobool.not.i.i.i.i217, label %invoke.cont28, label %if.then.i.i.i.i219

if.then.i.i.i.i219:                               ; preds = %invoke.cont.i.i218
  %54 = bitcast %"class.std::shared_ptr.0"* %53 to i8*
  call void @_ZdlPv(i8* noundef nonnull %54) #30
  br label %invoke.cont28

invoke.cont28:                                    ; preds = %if.then.i.i.i.i219, %invoke.cont.i.i218
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %41) #30
  store float* %call22, float** %B, align 8, !tbaa !37
  %55 = bitcast float** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %55) #30
  %56 = load i64, i64* %M, align 8, !tbaa !39
  %57 = load i64, i64* %N, align 8, !tbaa !39
  %58 = bitcast %"class.cl::sycl::property_list"* %ref.tmp26 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %58) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %58, i8 0, i64 32, i1 false)
  %mul25 = mul i64 %57, %56
  %MFileName.i.i221 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i221, align 8, !tbaa !51, !alias.scope !60
  %MFunctionName.i.i222 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i222, align 8, !tbaa !56, !alias.scope !60
  %MLineNo.i.i223 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 2
  %59 = bitcast i64* %MLineNo.i.i223 to <2 x i64>*
  store <2 x i64> <i64 66, i64 12>, <2 x i64>* %59, align 8, !tbaa !39, !alias.scope !60
  %call32 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul25, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp26, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp29)
          to label %invoke.cont31 unwind label %lpad30

invoke.cont31:                                    ; preds = %invoke.cont28
  %_M_start.i.i225 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %60 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i225, align 8, !tbaa !41
  %_M_finish.i.i226 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %61 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i226, align 8, !tbaa !43
  %cmp.not3.i.i.i.i.i227 = icmp eq %"class.std::shared_ptr.0"* %60, %61
  br i1 %cmp.not3.i.i.i.i.i227, label %invoke.cont.i.i259, label %for.body.i.i.i.i.i231

for.body.i.i.i.i.i231:                            ; preds = %invoke.cont31, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255
  %__first.addr.04.i.i.i.i.i228 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i253, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255 ], [ %60, %invoke.cont31 ]
  %_M_pi.i.i.i.i.i.i.i.i229 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i228, i64 0, i32 0, i32 1, i32 0
  %62 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i229, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i.i230 = icmp eq %"class.std::_Sp_counted_base"* %62, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i230, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255, label %if.then.i.i.i.i.i.i.i.i233

if.then.i.i.i.i.i.i.i.i233:                       ; preds = %for.body.i.i.i.i.i231
  %_M_use_count.i.i.i.i.i.i.i.i.i232 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %62, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i234, label %if.else.i.i.i.i.i.i.i.i.i.i236

if.then.i.i.i.i.i.i.i.i.i.i234:                   ; preds = %if.then.i.i.i.i.i.i.i.i233
  %63 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i239

if.else.i.i.i.i.i.i.i.i.i.i236:                   ; preds = %if.then.i.i.i.i.i.i.i.i233
  %64 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i.i235 = add nsw i32 %64, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i235, i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i.i239

invoke.cont.i.i.i.i.i.i.i.i.i239:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i236, %if.then.i.i.i.i.i.i.i.i.i.i234
  %retval.0.i.i.i.i.i.i.i.i.i.i237 = phi i32 [ %63, %if.then.i.i.i.i.i.i.i.i.i.i234 ], [ %64, %if.else.i.i.i.i.i.i.i.i.i.i236 ]
  %cmp.i.i.i.i.i.i.i.i.i238 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i237, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i238, label %if.then.i.i.i.i.i.i.i.i.i243, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

if.then.i.i.i.i.i.i.i.i.i243:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i239
  %65 = bitcast %"class.std::_Sp_counted_base"* %62 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i240 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %65, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i.i241 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i240, i64 2
  %66 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i241, align 8
  call void %66(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %62) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i242 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %62, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i244, label %if.else.i11.i.i.i.i.i.i.i.i.i246

if.then.i9.i.i.i.i.i.i.i.i.i244:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i243
  %67 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i249

if.else.i11.i.i.i.i.i.i.i.i.i246:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i243
  %68 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i.i245 = add nsw i32 %68, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i245, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i249

invoke.cont2.i.i.i.i.i.i.i.i.i249:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i246, %if.then.i9.i.i.i.i.i.i.i.i.i244
  %retval.0.i12.i.i.i.i.i.i.i.i.i247 = phi i32 [ %67, %if.then.i9.i.i.i.i.i.i.i.i.i244 ], [ %68, %if.else.i11.i.i.i.i.i.i.i.i.i246 ]
  %cmp4.i.i.i.i.i.i.i.i.i248 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i247, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i248, label %if.then5.i.i.i.i.i.i.i.i.i252, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

if.then5.i.i.i.i.i.i.i.i.i252:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i249
  %vtable6.i.i.i.i.i.i.i.i.i250 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %65, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i.i251 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i250, i64 3
  %69 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i251, align 8
  call void %69(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %62) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255: ; preds = %if.then5.i.i.i.i.i.i.i.i.i252, %invoke.cont2.i.i.i.i.i.i.i.i.i249, %invoke.cont.i.i.i.i.i.i.i.i.i239, %for.body.i.i.i.i.i231
  %incdec.ptr.i.i.i.i.i253 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i228, i64 1
  %cmp.not.i.i.i.i.i254 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i253, %61
  br i1 %cmp.not.i.i.i.i.i254, label %invoke.cont.loopexit.i.i257, label %for.body.i.i.i.i.i231, !llvm.loop !50

invoke.cont.loopexit.i.i257:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255
  %.pre.i.i256 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i225, align 8, !tbaa !41
  br label %invoke.cont.i.i259

invoke.cont.i.i259:                               ; preds = %invoke.cont.loopexit.i.i257, %invoke.cont31
  %70 = phi %"class.std::shared_ptr.0"* [ %.pre.i.i256, %invoke.cont.loopexit.i.i257 ], [ %60, %invoke.cont31 ]
  %tobool.not.i.i.i.i258 = icmp eq %"class.std::shared_ptr.0"* %70, null
  br i1 %tobool.not.i.i.i.i258, label %invoke.cont38, label %if.then.i.i.i.i260

if.then.i.i.i.i260:                               ; preds = %invoke.cont.i.i259
  %71 = bitcast %"class.std::shared_ptr.0"* %70 to i8*
  call void @_ZdlPv(i8* noundef nonnull %71) #30
  br label %invoke.cont38

invoke.cont38:                                    ; preds = %if.then.i.i.i.i260, %invoke.cont.i.i259
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %58) #30
  store float* %call32, float** %C, align 8, !tbaa !37
  %72 = load i64, i64* %M, align 8, !tbaa !39
  %73 = load i64, i64* %N, align 8, !tbaa !39
  %74 = bitcast %"class.cl::sycl::property_list"* %ref.tmp36 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %74) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %74, i8 0, i64 32, i1 false)
  %75 = bitcast %"class.cl::sycl::context"* %ref.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %75) #30
  invoke void @_ZNK2cl4sycl5queue11get_contextEv(%"class.cl::sycl::context"* nonnull sret(%"class.cl::sycl::context") align 8 %ref.tmp.i, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q)
          to label %.noexc unwind label %lpad40

.noexc:                                           ; preds = %invoke.cont38
  %76 = bitcast %"struct.cl::sycl::detail::code_location"* %agg.tmp.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %76)
  %mul35 = shl i64 %72, 2
  %mul.i.i = mul i64 %mul35, %73
  %agg.tmp39.sroa.0.0..sroa_idx = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp.i.i, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %agg.tmp39.sroa.0.0..sroa_idx, align 8
  %agg.tmp39.sroa.2.0..sroa_idx501 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp.i.i, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %agg.tmp39.sroa.2.0..sroa_idx501, align 8
  %agg.tmp39.sroa.3.0..sroa_idx502 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp.i.i, i64 0, i32 2
  %77 = bitcast i64* %agg.tmp39.sroa.3.0..sroa_idx502 to <2 x i64>*
  store <2 x i64> <i64 67, i64 13>, <2 x i64>* %77, align 8
  %call.i2.i = invoke noundef i8* @_ZN2cl4sycl18aligned_alloc_hostEmmRKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef 4, i64 noundef %mul.i.i, %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp36, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp.i.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %.noexc
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %76)
  %_M_pi.i.i.i.i = getelementptr inbounds %"class.cl::sycl::context", %"class.cl::sycl::context"* %ref.tmp.i, i64 0, i32 0, i32 0, i32 1, i32 0
  %78 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %78, null
  br i1 %cmp.not.i.i.i.i, label %invoke.cont41, label %if.then.i.i.i.i266

if.then.i.i.i.i266:                               ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %78, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i266
  %79 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i

if.else.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i266
  %80 = load i32, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i = add nsw i32 %80, -1
  store i32 %add.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i

invoke.cont.i.i.i.i.i:                            ; preds = %if.else.i.i.i.i.i.i, %if.then.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i = phi i32 [ %79, %if.then.i.i.i.i.i.i ], [ %80, %if.else.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i, label %if.then.i.i.i.i.i, label %invoke.cont41

if.then.i.i.i.i.i:                                ; preds = %invoke.cont.i.i.i.i.i
  %81 = bitcast %"class.std::_Sp_counted_base"* %78 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %81, align 8, !tbaa !48
  %vfn.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i, i64 2
  %82 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i, align 8
  call void %82(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %78) #30
  %_M_weak_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %78, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i, label %if.else.i11.i.i.i.i.i

if.then.i9.i.i.i.i.i:                             ; preds = %if.then.i.i.i.i.i
  %83 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i

if.else.i11.i.i.i.i.i:                            ; preds = %if.then.i.i.i.i.i
  %84 = load i32, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i = add nsw i32 %84, -1
  store i32 %add.i.i10.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i

invoke.cont2.i.i.i.i.i:                           ; preds = %if.else.i11.i.i.i.i.i, %if.then.i9.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i = phi i32 [ %83, %if.then.i9.i.i.i.i.i ], [ %84, %if.else.i11.i.i.i.i.i ]
  %cmp4.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i, label %if.then5.i.i.i.i.i, label %invoke.cont41

if.then5.i.i.i.i.i:                               ; preds = %invoke.cont2.i.i.i.i.i
  %vtable6.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %81, align 8, !tbaa !48
  %vfn7.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i, i64 3
  %85 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i, align 8
  call void %85(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %78) #30
  br label %invoke.cont41

lpad.i:                                           ; preds = %.noexc
  %86 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl7contextD2Ev(%"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %75) #30
  br label %lpad40.body

invoke.cont41:                                    ; preds = %if.then5.i.i.i.i.i, %invoke.cont2.i.i.i.i.i, %invoke.cont.i.i.i.i.i, %invoke.cont.i
  %87 = bitcast i8* %call.i2.i to float*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %75) #30
  %_M_start.i.i267 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp36, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %88 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i267, align 8, !tbaa !41
  %_M_finish.i.i268 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp36, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %89 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i268, align 8, !tbaa !43
  %cmp.not3.i.i.i.i.i269 = icmp eq %"class.std::shared_ptr.0"* %88, %89
  br i1 %cmp.not3.i.i.i.i.i269, label %invoke.cont.i.i301, label %for.body.i.i.i.i.i273

for.body.i.i.i.i.i273:                            ; preds = %invoke.cont41, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297
  %__first.addr.04.i.i.i.i.i270 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i295, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297 ], [ %88, %invoke.cont41 ]
  %_M_pi.i.i.i.i.i.i.i.i271 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i270, i64 0, i32 0, i32 1, i32 0
  %90 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i271, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i.i272 = icmp eq %"class.std::_Sp_counted_base"* %90, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i272, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297, label %if.then.i.i.i.i.i.i.i.i275

if.then.i.i.i.i.i.i.i.i275:                       ; preds = %for.body.i.i.i.i.i273
  %_M_use_count.i.i.i.i.i.i.i.i.i274 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %90, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i276, label %if.else.i.i.i.i.i.i.i.i.i.i278

if.then.i.i.i.i.i.i.i.i.i.i276:                   ; preds = %if.then.i.i.i.i.i.i.i.i275
  %91 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i281

if.else.i.i.i.i.i.i.i.i.i.i278:                   ; preds = %if.then.i.i.i.i.i.i.i.i275
  %92 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i.i277 = add nsw i32 %92, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i277, i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i.i281

invoke.cont.i.i.i.i.i.i.i.i.i281:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i278, %if.then.i.i.i.i.i.i.i.i.i.i276
  %retval.0.i.i.i.i.i.i.i.i.i.i279 = phi i32 [ %91, %if.then.i.i.i.i.i.i.i.i.i.i276 ], [ %92, %if.else.i.i.i.i.i.i.i.i.i.i278 ]
  %cmp.i.i.i.i.i.i.i.i.i280 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i279, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i280, label %if.then.i.i.i.i.i.i.i.i.i285, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

if.then.i.i.i.i.i.i.i.i.i285:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i281
  %93 = bitcast %"class.std::_Sp_counted_base"* %90 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i282 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %93, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i.i283 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i282, i64 2
  %94 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i283, align 8
  call void %94(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %90) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i284 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %90, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i286, label %if.else.i11.i.i.i.i.i.i.i.i.i288

if.then.i9.i.i.i.i.i.i.i.i.i286:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i285
  %95 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i291

if.else.i11.i.i.i.i.i.i.i.i.i288:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i285
  %96 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i.i287 = add nsw i32 %96, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i287, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i291

invoke.cont2.i.i.i.i.i.i.i.i.i291:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i288, %if.then.i9.i.i.i.i.i.i.i.i.i286
  %retval.0.i12.i.i.i.i.i.i.i.i.i289 = phi i32 [ %95, %if.then.i9.i.i.i.i.i.i.i.i.i286 ], [ %96, %if.else.i11.i.i.i.i.i.i.i.i.i288 ]
  %cmp4.i.i.i.i.i.i.i.i.i290 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i289, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i290, label %if.then5.i.i.i.i.i.i.i.i.i294, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

if.then5.i.i.i.i.i.i.i.i.i294:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i291
  %vtable6.i.i.i.i.i.i.i.i.i292 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %93, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i.i293 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i292, i64 3
  %97 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i293, align 8
  call void %97(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %90) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297: ; preds = %if.then5.i.i.i.i.i.i.i.i.i294, %invoke.cont2.i.i.i.i.i.i.i.i.i291, %invoke.cont.i.i.i.i.i.i.i.i.i281, %for.body.i.i.i.i.i273
  %incdec.ptr.i.i.i.i.i295 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i270, i64 1
  %cmp.not.i.i.i.i.i296 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i295, %89
  br i1 %cmp.not.i.i.i.i.i296, label %invoke.cont.loopexit.i.i299, label %for.body.i.i.i.i.i273, !llvm.loop !50

invoke.cont.loopexit.i.i299:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297
  %.pre.i.i298 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i267, align 8, !tbaa !41
  br label %invoke.cont.i.i301

invoke.cont.i.i301:                               ; preds = %invoke.cont.loopexit.i.i299, %invoke.cont41
  %98 = phi %"class.std::shared_ptr.0"* [ %.pre.i.i298, %invoke.cont.loopexit.i.i299 ], [ %88, %invoke.cont41 ]
  %tobool.not.i.i.i.i300 = icmp eq %"class.std::shared_ptr.0"* %98, null
  br i1 %tobool.not.i.i.i.i300, label %_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303, label %if.then.i.i.i.i302

if.then.i.i.i.i302:                               ; preds = %invoke.cont.i.i301
  %99 = bitcast %"class.std::shared_ptr.0"* %98 to i8*
  call void @_ZdlPv(i8* noundef nonnull %99) #30
  br label %_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303

_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303: ; preds = %invoke.cont.i.i301, %if.then.i.i.i.i302
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %74) #30
  %100 = load float*, float** %A, align 8, !tbaa !37
  %101 = load float*, float** %B, align 8, !tbaa !37
  %102 = load float*, float** %C, align 8, !tbaa !37
  %103 = load i64, i64* %M, align 8, !tbaa !39
  %104 = load i64, i64* %K, align 8, !tbaa !39
  %105 = load i64, i64* %N, align 8, !tbaa !39
  %cmp94.not.i = icmp eq i64 %103, 0
  br i1 %cmp94.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.lr.ph.i

for.cond1.preheader.lr.ph.i:                      ; preds = %_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303
  %cmp292.not.i = icmp eq i64 %104, 0
  %conv6.i = uitofp i64 %103 to float
  br i1 %cmp292.not.i, label %for.cond41.preheader.lr.ph.i, label %for.cond1.preheader.us.i.preheader

for.cond1.preheader.us.i.preheader:               ; preds = %for.cond1.preheader.lr.ph.i
  %min.iters.check = icmp ult i64 %104, 8
  %n.vec = and i64 %104, -8
  %broadcast.splatinsert513 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat514 = shufflevector <4 x float> %broadcast.splatinsert513, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert515 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat516 = shufflevector <4 x float> %broadcast.splatinsert515, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %104, %n.vec
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.preheader.us.i.preheader, %for.cond1.for.cond.cleanup3_crit_edge.us.i
  %i.095.us.i = phi i64 [ %inc9.us.i, %for.cond1.for.cond.cleanup3_crit_edge.us.i ], [ 0, %for.cond1.preheader.us.i.preheader ]
  %conv.us.i = uitofp i64 %i.095.us.i to float
  %mul7.us.i = mul i64 %i.095.us.i, %104
  br i1 %min.iters.check, label %for.body4.us.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert511 = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat512 = shufflevector <4 x float> %broadcast.splatinsert511, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %106 = uitofp <4 x i64> %vec.ind to <4 x float>
  %107 = uitofp <4 x i64> %step.add to <4 x float>
  %108 = fmul <4 x float> %broadcast.splat, %106
  %109 = fmul <4 x float> %broadcast.splat512, %107
  %110 = fdiv <4 x float> %108, %broadcast.splat514
  %111 = fdiv <4 x float> %109, %broadcast.splat516
  %112 = add i64 %index, %mul7.us.i
  %113 = getelementptr inbounds float, float* %100, i64 %112
  %114 = bitcast float* %113 to <4 x float>*
  store <4 x float> %110, <4 x float>* %114, align 4, !tbaa !8
  %115 = getelementptr inbounds float, float* %113, i64 4
  %116 = bitcast float* %115 to <4 x float>*
  store <4 x float> %111, <4 x float>* %116, align 4, !tbaa !8
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !63

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
  %arrayidx.us.i = getelementptr inbounds float, float* %100, i64 %add.us.i
  store float %div.us.i, float* %arrayidx.us.i, align 4, !tbaa !8
  %inc.us.i = add nuw i64 %j.093.us.i, 1
  %exitcond.not.i = icmp eq i64 %inc.us.i, %104
  br i1 %exitcond.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.us.i, label %for.body4.us.i, !llvm.loop !64

for.cond1.for.cond.cleanup3_crit_edge.us.i:       ; preds = %for.body4.us.i, %middle.block
  %inc9.us.i = add nuw i64 %i.095.us.i, 1
  %exitcond107.not.i = icmp eq i64 %inc9.us.i, %103
  br i1 %exitcond107.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.us.i, !llvm.loop !17

for.cond12.preheader.i:                           ; preds = %for.cond1.for.cond.cleanup3_crit_edge.us.i, %_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303
  %cmp1398.not.i = icmp eq i64 %104, 0
  br i1 %cmp1398.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.lr.ph.i

for.cond17.preheader.lr.ph.i:                     ; preds = %for.cond12.preheader.i
  %cmp1896.not.i = icmp eq i64 %105, 0
  %conv24.i = uitofp i64 %105 to float
  br i1 %cmp1896.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.us.i.preheader

for.cond17.preheader.us.i.preheader:              ; preds = %for.cond17.preheader.lr.ph.i
  %min.iters.check519 = icmp ult i64 %105, 8
  %n.vec522 = and i64 %105, -8
  %broadcast.splatinsert535 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat536 = shufflevector <4 x float> %broadcast.splatinsert535, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert537 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat538 = shufflevector <4 x float> %broadcast.splatinsert537, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n524 = icmp eq i64 %105, %n.vec522
  br label %for.cond17.preheader.us.i

for.cond17.preheader.us.i:                        ; preds = %for.cond17.preheader.us.i.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i
  %i11.099.us.i = phi i64 [ %inc33.us.i, %for.cond17.for.cond.cleanup19_crit_edge.us.i ], [ 0, %for.cond17.preheader.us.i.preheader ]
  %conv21.us.i = uitofp i64 %i11.099.us.i to float
  %mul26.us.i = mul i64 %i11.099.us.i, %105
  br i1 %min.iters.check519, label %for.body20.us.i.preheader, label %vector.ph520

vector.ph520:                                     ; preds = %for.cond17.preheader.us.i
  %broadcast.splatinsert531 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat532 = shufflevector <4 x float> %broadcast.splatinsert531, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert533 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat534 = shufflevector <4 x float> %broadcast.splatinsert533, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body525

vector.body525:                                   ; preds = %vector.body525, %vector.ph520
  %index526 = phi i64 [ 0, %vector.ph520 ], [ %index.next539, %vector.body525 ]
  %vec.ind527 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph520 ], [ %vec.ind.next530, %vector.body525 ]
  %step.add528 = add <4 x i64> %vec.ind527, <i64 4, i64 4, i64 4, i64 4>
  %118 = uitofp <4 x i64> %vec.ind527 to <4 x float>
  %119 = uitofp <4 x i64> %step.add528 to <4 x float>
  %120 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat532, <4 x float> %118, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %121 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat534, <4 x float> %119, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %122 = fdiv <4 x float> %120, %broadcast.splat536
  %123 = fdiv <4 x float> %121, %broadcast.splat538
  %124 = add i64 %index526, %mul26.us.i
  %125 = getelementptr inbounds float, float* %101, i64 %124
  %126 = bitcast float* %125 to <4 x float>*
  store <4 x float> %122, <4 x float>* %126, align 4, !tbaa !8
  %127 = getelementptr inbounds float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  store <4 x float> %123, <4 x float>* %128, align 4, !tbaa !8
  %index.next539 = add nuw i64 %index526, 8
  %vec.ind.next530 = add <4 x i64> %vec.ind527, <i64 8, i64 8, i64 8, i64 8>
  %129 = icmp eq i64 %index.next539, %n.vec522
  br i1 %129, label %middle.block517, label %vector.body525, !llvm.loop !65

middle.block517:                                  ; preds = %vector.body525
  br i1 %cmp.n524, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i.preheader

for.body20.us.i.preheader:                        ; preds = %for.cond17.preheader.us.i, %middle.block517
  %j16.097.us.i.ph = phi i64 [ 0, %for.cond17.preheader.us.i ], [ %n.vec522, %middle.block517 ]
  br label %for.body20.us.i

for.body20.us.i:                                  ; preds = %for.body20.us.i.preheader, %for.body20.us.i
  %j16.097.us.i = phi i64 [ %inc30.us.i, %for.body20.us.i ], [ %j16.097.us.i.ph, %for.body20.us.i.preheader ]
  %conv22.us.i = uitofp i64 %j16.097.us.i to float
  %130 = call float @llvm.fmuladd.f32(float %conv21.us.i, float %conv22.us.i, float 1.000000e+00) #30
  %div25.us.i = fdiv float %130, %conv24.i
  %add27.us.i = add i64 %j16.097.us.i, %mul26.us.i
  %arrayidx28.us.i = getelementptr inbounds float, float* %101, i64 %add27.us.i
  store float %div25.us.i, float* %arrayidx28.us.i, align 4, !tbaa !8
  %inc30.us.i = add nuw i64 %j16.097.us.i, 1
  %exitcond108.not.i = icmp eq i64 %inc30.us.i, %105
  br i1 %exitcond108.not.i, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i, !llvm.loop !66

for.cond17.for.cond.cleanup19_crit_edge.us.i:     ; preds = %for.body20.us.i, %middle.block517
  %inc33.us.i = add nuw i64 %i11.099.us.i, 1
  %exitcond109.not.i = icmp eq i64 %inc33.us.i, %104
  br i1 %exitcond109.not.i, label %for.cond36.preheader.i, label %for.cond17.preheader.us.i, !llvm.loop !20

for.cond36.preheader.i:                           ; preds = %for.cond17.for.cond.cleanup19_crit_edge.us.i, %for.cond17.preheader.lr.ph.i, %for.cond12.preheader.i
  br i1 %cmp94.not.i, label %for.cond12.preheader.i325, label %for.cond41.preheader.lr.ph.i

for.cond41.preheader.lr.ph.i:                     ; preds = %for.cond36.preheader.i, %for.cond1.preheader.lr.ph.i
  %cmp42100.not.i = icmp eq i64 %105, 0
  %conv48.i = uitofp i64 %105 to float
  br i1 %cmp42100.not.i, label %for.cond1.preheader.lr.ph.i307, label %for.cond41.preheader.us.i.preheader

for.cond41.preheader.us.i.preheader:              ; preds = %for.cond41.preheader.lr.ph.i
  %min.iters.check542 = icmp ult i64 %105, 8
  %n.vec545 = and i64 %105, -8
  %broadcast.splatinsert558 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat559 = shufflevector <4 x float> %broadcast.splatinsert558, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert560 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat561 = shufflevector <4 x float> %broadcast.splatinsert560, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n547 = icmp eq i64 %105, %n.vec545
  br label %for.cond41.preheader.us.i

for.cond41.preheader.us.i:                        ; preds = %for.cond41.preheader.us.i.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i
  %i35.0103.us.i = phi i64 [ %inc57.us.i, %for.cond41.for.cond.cleanup43_crit_edge.us.i ], [ 0, %for.cond41.preheader.us.i.preheader ]
  %conv45.us.i = uitofp i64 %i35.0103.us.i to float
  %mul50.us.i = mul i64 %i35.0103.us.i, %105
  br i1 %min.iters.check542, label %for.body44.us.i.preheader, label %vector.ph543

vector.ph543:                                     ; preds = %for.cond41.preheader.us.i
  %broadcast.splatinsert554 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat555 = shufflevector <4 x float> %broadcast.splatinsert554, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert556 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat557 = shufflevector <4 x float> %broadcast.splatinsert556, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body548

vector.body548:                                   ; preds = %vector.body548, %vector.ph543
  %index549 = phi i64 [ 0, %vector.ph543 ], [ %index.next562, %vector.body548 ]
  %vec.ind550 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph543 ], [ %vec.ind.next553, %vector.body548 ]
  %step.add551 = add <4 x i64> %vec.ind550, <i64 4, i64 4, i64 4, i64 4>
  %131 = uitofp <4 x i64> %vec.ind550 to <4 x float>
  %132 = uitofp <4 x i64> %step.add551 to <4 x float>
  %133 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat555, <4 x float> %131, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %134 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat557, <4 x float> %132, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %135 = fdiv <4 x float> %133, %broadcast.splat559
  %136 = fdiv <4 x float> %134, %broadcast.splat561
  %137 = add i64 %index549, %mul50.us.i
  %138 = getelementptr inbounds float, float* %102, i64 %137
  %139 = bitcast float* %138 to <4 x float>*
  store <4 x float> %135, <4 x float>* %139, align 4, !tbaa !8
  %140 = getelementptr inbounds float, float* %138, i64 4
  %141 = bitcast float* %140 to <4 x float>*
  store <4 x float> %136, <4 x float>* %141, align 4, !tbaa !8
  %index.next562 = add nuw i64 %index549, 8
  %vec.ind.next553 = add <4 x i64> %vec.ind550, <i64 8, i64 8, i64 8, i64 8>
  %142 = icmp eq i64 %index.next562, %n.vec545
  br i1 %142, label %middle.block540, label %vector.body548, !llvm.loop !67

middle.block540:                                  ; preds = %vector.body548
  br i1 %cmp.n547, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i.preheader

for.body44.us.i.preheader:                        ; preds = %for.cond41.preheader.us.i, %middle.block540
  %j40.0101.us.i.ph = phi i64 [ 0, %for.cond41.preheader.us.i ], [ %n.vec545, %middle.block540 ]
  br label %for.body44.us.i

for.body44.us.i:                                  ; preds = %for.body44.us.i.preheader, %for.body44.us.i
  %j40.0101.us.i = phi i64 [ %inc54.us.i, %for.body44.us.i ], [ %j40.0101.us.i.ph, %for.body44.us.i.preheader ]
  %conv46.us.i = uitofp i64 %j40.0101.us.i to float
  %143 = call float @llvm.fmuladd.f32(float %conv45.us.i, float %conv46.us.i, float 2.000000e+00) #30
  %div49.us.i = fdiv float %143, %conv48.i
  %add51.us.i = add i64 %j40.0101.us.i, %mul50.us.i
  %arrayidx52.us.i = getelementptr inbounds float, float* %102, i64 %add51.us.i
  store float %div49.us.i, float* %arrayidx52.us.i, align 4, !tbaa !8
  %inc54.us.i = add nuw i64 %j40.0101.us.i, 1
  %exitcond110.not.i = icmp eq i64 %inc54.us.i, %105
  br i1 %exitcond110.not.i, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i, !llvm.loop !68

for.cond41.for.cond.cleanup43_crit_edge.us.i:     ; preds = %for.body44.us.i, %middle.block540
  %inc57.us.i = add nuw i64 %i35.0103.us.i, 1
  %exitcond111.not.i = icmp eq i64 %inc57.us.i, %103
  br i1 %exitcond111.not.i, label %_Z10initMatrixPfS_S_mmm.exit, label %for.cond41.preheader.us.i, !llvm.loop !23

_Z10initMatrixPfS_S_mmm.exit:                     ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us.i
  br i1 %cmp94.not.i, label %for.cond12.preheader.i325, label %for.cond1.preheader.lr.ph.i307

for.cond1.preheader.lr.ph.i307:                   ; preds = %for.cond41.preheader.lr.ph.i, %_Z10initMatrixPfS_S_mmm.exit
  %cmp292.not.i305 = icmp eq i64 %104, 0
  %conv6.i306 = uitofp i64 %103 to float
  br i1 %cmp292.not.i305, label %for.cond41.preheader.lr.ph.i347, label %for.cond1.preheader.us.i311.preheader

for.cond1.preheader.us.i311.preheader:            ; preds = %for.cond1.preheader.lr.ph.i307
  %min.iters.check565 = icmp ult i64 %104, 8
  %n.vec568 = and i64 %104, -8
  %broadcast.splatinsert581 = insertelement <4 x float> poison, float %conv6.i306, i64 0
  %broadcast.splat582 = shufflevector <4 x float> %broadcast.splatinsert581, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert583 = insertelement <4 x float> poison, float %conv6.i306, i64 0
  %broadcast.splat584 = shufflevector <4 x float> %broadcast.splatinsert583, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n570 = icmp eq i64 %104, %n.vec568
  br label %for.cond1.preheader.us.i311

for.cond1.preheader.us.i311:                      ; preds = %for.cond1.preheader.us.i311.preheader, %for.cond1.for.cond.cleanup3_crit_edge.us.i323
  %i.095.us.i308 = phi i64 [ %inc9.us.i321, %for.cond1.for.cond.cleanup3_crit_edge.us.i323 ], [ 0, %for.cond1.preheader.us.i311.preheader ]
  %conv.us.i309 = uitofp i64 %i.095.us.i308 to float
  %mul7.us.i310 = mul i64 %i.095.us.i308, %104
  br i1 %min.iters.check565, label %for.body4.us.i320.preheader, label %vector.ph566

vector.ph566:                                     ; preds = %for.cond1.preheader.us.i311
  %broadcast.splatinsert577 = insertelement <4 x float> poison, float %conv.us.i309, i64 0
  %broadcast.splat578 = shufflevector <4 x float> %broadcast.splatinsert577, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert579 = insertelement <4 x float> poison, float %conv.us.i309, i64 0
  %broadcast.splat580 = shufflevector <4 x float> %broadcast.splatinsert579, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body571

vector.body571:                                   ; preds = %vector.body571, %vector.ph566
  %index572 = phi i64 [ 0, %vector.ph566 ], [ %index.next585, %vector.body571 ]
  %vec.ind573 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph566 ], [ %vec.ind.next576, %vector.body571 ]
  %step.add574 = add <4 x i64> %vec.ind573, <i64 4, i64 4, i64 4, i64 4>
  %144 = uitofp <4 x i64> %vec.ind573 to <4 x float>
  %145 = uitofp <4 x i64> %step.add574 to <4 x float>
  %146 = fmul <4 x float> %broadcast.splat578, %144
  %147 = fmul <4 x float> %broadcast.splat580, %145
  %148 = fdiv <4 x float> %146, %broadcast.splat582
  %149 = fdiv <4 x float> %147, %broadcast.splat584
  %150 = add i64 %index572, %mul7.us.i310
  %151 = getelementptr inbounds float, float* %100, i64 %150
  %152 = bitcast float* %151 to <4 x float>*
  store <4 x float> %148, <4 x float>* %152, align 4, !tbaa !8
  %153 = getelementptr inbounds float, float* %151, i64 4
  %154 = bitcast float* %153 to <4 x float>*
  store <4 x float> %149, <4 x float>* %154, align 4, !tbaa !8
  %index.next585 = add nuw i64 %index572, 8
  %vec.ind.next576 = add <4 x i64> %vec.ind573, <i64 8, i64 8, i64 8, i64 8>
  %155 = icmp eq i64 %index.next585, %n.vec568
  br i1 %155, label %middle.block563, label %vector.body571, !llvm.loop !69

middle.block563:                                  ; preds = %vector.body571
  br i1 %cmp.n570, label %for.cond1.for.cond.cleanup3_crit_edge.us.i323, label %for.body4.us.i320.preheader

for.body4.us.i320.preheader:                      ; preds = %for.cond1.preheader.us.i311, %middle.block563
  %j.093.us.i312.ph = phi i64 [ 0, %for.cond1.preheader.us.i311 ], [ %n.vec568, %middle.block563 ]
  br label %for.body4.us.i320

for.body4.us.i320:                                ; preds = %for.body4.us.i320.preheader, %for.body4.us.i320
  %j.093.us.i312 = phi i64 [ %inc.us.i318, %for.body4.us.i320 ], [ %j.093.us.i312.ph, %for.body4.us.i320.preheader ]
  %conv5.us.i313 = uitofp i64 %j.093.us.i312 to float
  %mul.us.i314 = fmul float %conv.us.i309, %conv5.us.i313
  %div.us.i315 = fdiv float %mul.us.i314, %conv6.i306
  %add.us.i316 = add i64 %j.093.us.i312, %mul7.us.i310
  %arrayidx.us.i317 = getelementptr inbounds float, float* %100, i64 %add.us.i316
  store float %div.us.i315, float* %arrayidx.us.i317, align 4, !tbaa !8
  %inc.us.i318 = add nuw i64 %j.093.us.i312, 1
  %exitcond.not.i319 = icmp eq i64 %inc.us.i318, %104
  br i1 %exitcond.not.i319, label %for.cond1.for.cond.cleanup3_crit_edge.us.i323, label %for.body4.us.i320, !llvm.loop !70

for.cond1.for.cond.cleanup3_crit_edge.us.i323:    ; preds = %for.body4.us.i320, %middle.block563
  %inc9.us.i321 = add nuw i64 %i.095.us.i308, 1
  %exitcond107.not.i322 = icmp eq i64 %inc9.us.i321, %103
  br i1 %exitcond107.not.i322, label %for.cond12.preheader.i325, label %for.cond1.preheader.us.i311, !llvm.loop !17

for.cond12.preheader.i325:                        ; preds = %for.cond1.for.cond.cleanup3_crit_edge.us.i323, %for.cond36.preheader.i, %_Z10initMatrixPfS_S_mmm.exit
  %cmp1398.not.i324 = icmp eq i64 %104, 0
  br i1 %cmp1398.not.i324, label %for.cond36.preheader.i344, label %for.cond17.preheader.lr.ph.i328

for.cond17.preheader.lr.ph.i328:                  ; preds = %for.cond12.preheader.i325
  %cmp1896.not.i326 = icmp eq i64 %105, 0
  %conv24.i327 = uitofp i64 %105 to float
  br i1 %cmp1896.not.i326, label %for.cond36.preheader.i344, label %for.cond17.preheader.us.i332.preheader

for.cond17.preheader.us.i332.preheader:           ; preds = %for.cond17.preheader.lr.ph.i328
  %min.iters.check588 = icmp ult i64 %105, 8
  %n.vec591 = and i64 %105, -8
  %broadcast.splatinsert604 = insertelement <4 x float> poison, float %conv24.i327, i64 0
  %broadcast.splat605 = shufflevector <4 x float> %broadcast.splatinsert604, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert606 = insertelement <4 x float> poison, float %conv24.i327, i64 0
  %broadcast.splat607 = shufflevector <4 x float> %broadcast.splatinsert606, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n593 = icmp eq i64 %105, %n.vec591
  br label %for.cond17.preheader.us.i332

for.cond17.preheader.us.i332:                     ; preds = %for.cond17.preheader.us.i332.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i343
  %i11.099.us.i329 = phi i64 [ %inc33.us.i341, %for.cond17.for.cond.cleanup19_crit_edge.us.i343 ], [ 0, %for.cond17.preheader.us.i332.preheader ]
  %conv21.us.i330 = uitofp i64 %i11.099.us.i329 to float
  %mul26.us.i331 = mul i64 %i11.099.us.i329, %105
  br i1 %min.iters.check588, label %for.body20.us.i340.preheader, label %vector.ph589

vector.ph589:                                     ; preds = %for.cond17.preheader.us.i332
  %broadcast.splatinsert600 = insertelement <4 x float> poison, float %conv21.us.i330, i64 0
  %broadcast.splat601 = shufflevector <4 x float> %broadcast.splatinsert600, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert602 = insertelement <4 x float> poison, float %conv21.us.i330, i64 0
  %broadcast.splat603 = shufflevector <4 x float> %broadcast.splatinsert602, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body594

vector.body594:                                   ; preds = %vector.body594, %vector.ph589
  %index595 = phi i64 [ 0, %vector.ph589 ], [ %index.next608, %vector.body594 ]
  %vec.ind596 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph589 ], [ %vec.ind.next599, %vector.body594 ]
  %step.add597 = add <4 x i64> %vec.ind596, <i64 4, i64 4, i64 4, i64 4>
  %156 = uitofp <4 x i64> %vec.ind596 to <4 x float>
  %157 = uitofp <4 x i64> %step.add597 to <4 x float>
  %158 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat601, <4 x float> %156, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %159 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat603, <4 x float> %157, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %160 = fdiv <4 x float> %158, %broadcast.splat605
  %161 = fdiv <4 x float> %159, %broadcast.splat607
  %162 = add i64 %index595, %mul26.us.i331
  %163 = getelementptr inbounds float, float* %101, i64 %162
  %164 = bitcast float* %163 to <4 x float>*
  store <4 x float> %160, <4 x float>* %164, align 4, !tbaa !8
  %165 = getelementptr inbounds float, float* %163, i64 4
  %166 = bitcast float* %165 to <4 x float>*
  store <4 x float> %161, <4 x float>* %166, align 4, !tbaa !8
  %index.next608 = add nuw i64 %index595, 8
  %vec.ind.next599 = add <4 x i64> %vec.ind596, <i64 8, i64 8, i64 8, i64 8>
  %167 = icmp eq i64 %index.next608, %n.vec591
  br i1 %167, label %middle.block586, label %vector.body594, !llvm.loop !71

middle.block586:                                  ; preds = %vector.body594
  br i1 %cmp.n593, label %for.cond17.for.cond.cleanup19_crit_edge.us.i343, label %for.body20.us.i340.preheader

for.body20.us.i340.preheader:                     ; preds = %for.cond17.preheader.us.i332, %middle.block586
  %j16.097.us.i333.ph = phi i64 [ 0, %for.cond17.preheader.us.i332 ], [ %n.vec591, %middle.block586 ]
  br label %for.body20.us.i340

for.body20.us.i340:                               ; preds = %for.body20.us.i340.preheader, %for.body20.us.i340
  %j16.097.us.i333 = phi i64 [ %inc30.us.i338, %for.body20.us.i340 ], [ %j16.097.us.i333.ph, %for.body20.us.i340.preheader ]
  %conv22.us.i334 = uitofp i64 %j16.097.us.i333 to float
  %168 = call float @llvm.fmuladd.f32(float %conv21.us.i330, float %conv22.us.i334, float 1.000000e+00) #30
  %div25.us.i335 = fdiv float %168, %conv24.i327
  %add27.us.i336 = add i64 %j16.097.us.i333, %mul26.us.i331
  %arrayidx28.us.i337 = getelementptr inbounds float, float* %101, i64 %add27.us.i336
  store float %div25.us.i335, float* %arrayidx28.us.i337, align 4, !tbaa !8
  %inc30.us.i338 = add nuw i64 %j16.097.us.i333, 1
  %exitcond108.not.i339 = icmp eq i64 %inc30.us.i338, %105
  br i1 %exitcond108.not.i339, label %for.cond17.for.cond.cleanup19_crit_edge.us.i343, label %for.body20.us.i340, !llvm.loop !72

for.cond17.for.cond.cleanup19_crit_edge.us.i343:  ; preds = %for.body20.us.i340, %middle.block586
  %inc33.us.i341 = add nuw i64 %i11.099.us.i329, 1
  %exitcond109.not.i342 = icmp eq i64 %inc33.us.i341, %104
  br i1 %exitcond109.not.i342, label %for.cond36.preheader.i344, label %for.cond17.preheader.us.i332, !llvm.loop !20

for.cond36.preheader.i344:                        ; preds = %for.cond17.for.cond.cleanup19_crit_edge.us.i343, %for.cond17.preheader.lr.ph.i328, %for.cond12.preheader.i325
  br i1 %cmp94.not.i, label %_Z10initMatrixPfS_S_mmm.exit363, label %for.cond36.preheader.i344.for.cond41.preheader.lr.ph.i347_crit_edge

for.cond36.preheader.i344.for.cond41.preheader.lr.ph.i347_crit_edge: ; preds = %for.cond36.preheader.i344
  %.pre = uitofp i64 %105 to float
  br label %for.cond41.preheader.lr.ph.i347

for.cond41.preheader.lr.ph.i347:                  ; preds = %for.cond36.preheader.i344.for.cond41.preheader.lr.ph.i347_crit_edge, %for.cond1.preheader.lr.ph.i307
  %conv48.i346.pre-phi = phi float [ %.pre, %for.cond36.preheader.i344.for.cond41.preheader.lr.ph.i347_crit_edge ], [ %conv48.i, %for.cond1.preheader.lr.ph.i307 ]
  %cmp42100.not.i345 = icmp eq i64 %105, 0
  br i1 %cmp42100.not.i345, label %_Z10initMatrixPfS_S_mmm.exit363, label %for.cond41.preheader.us.i351.preheader

for.cond41.preheader.us.i351.preheader:           ; preds = %for.cond41.preheader.lr.ph.i347
  %min.iters.check611 = icmp ult i64 %105, 8
  %n.vec614 = and i64 %105, -8
  %broadcast.splatinsert627 = insertelement <4 x float> poison, float %conv48.i346.pre-phi, i64 0
  %broadcast.splat628 = shufflevector <4 x float> %broadcast.splatinsert627, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert629 = insertelement <4 x float> poison, float %conv48.i346.pre-phi, i64 0
  %broadcast.splat630 = shufflevector <4 x float> %broadcast.splatinsert629, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n616 = icmp eq i64 %105, %n.vec614
  br label %for.cond41.preheader.us.i351

for.cond41.preheader.us.i351:                     ; preds = %for.cond41.preheader.us.i351.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i362
  %i35.0103.us.i348 = phi i64 [ %inc57.us.i360, %for.cond41.for.cond.cleanup43_crit_edge.us.i362 ], [ 0, %for.cond41.preheader.us.i351.preheader ]
  %conv45.us.i349 = uitofp i64 %i35.0103.us.i348 to float
  %mul50.us.i350 = mul i64 %i35.0103.us.i348, %105
  br i1 %min.iters.check611, label %for.body44.us.i359.preheader, label %vector.ph612

vector.ph612:                                     ; preds = %for.cond41.preheader.us.i351
  %broadcast.splatinsert623 = insertelement <4 x float> poison, float %conv45.us.i349, i64 0
  %broadcast.splat624 = shufflevector <4 x float> %broadcast.splatinsert623, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert625 = insertelement <4 x float> poison, float %conv45.us.i349, i64 0
  %broadcast.splat626 = shufflevector <4 x float> %broadcast.splatinsert625, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body617

vector.body617:                                   ; preds = %vector.body617, %vector.ph612
  %index618 = phi i64 [ 0, %vector.ph612 ], [ %index.next631, %vector.body617 ]
  %vec.ind619 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph612 ], [ %vec.ind.next622, %vector.body617 ]
  %step.add620 = add <4 x i64> %vec.ind619, <i64 4, i64 4, i64 4, i64 4>
  %169 = uitofp <4 x i64> %vec.ind619 to <4 x float>
  %170 = uitofp <4 x i64> %step.add620 to <4 x float>
  %171 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat624, <4 x float> %169, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %172 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat626, <4 x float> %170, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %173 = fdiv <4 x float> %171, %broadcast.splat628
  %174 = fdiv <4 x float> %172, %broadcast.splat630
  %175 = add i64 %index618, %mul50.us.i350
  %176 = getelementptr inbounds float, float* %87, i64 %175
  %177 = bitcast float* %176 to <4 x float>*
  store <4 x float> %173, <4 x float>* %177, align 4, !tbaa !8
  %178 = getelementptr inbounds float, float* %176, i64 4
  %179 = bitcast float* %178 to <4 x float>*
  store <4 x float> %174, <4 x float>* %179, align 4, !tbaa !8
  %index.next631 = add nuw i64 %index618, 8
  %vec.ind.next622 = add <4 x i64> %vec.ind619, <i64 8, i64 8, i64 8, i64 8>
  %180 = icmp eq i64 %index.next631, %n.vec614
  br i1 %180, label %middle.block609, label %vector.body617, !llvm.loop !73

middle.block609:                                  ; preds = %vector.body617
  br i1 %cmp.n616, label %for.cond41.for.cond.cleanup43_crit_edge.us.i362, label %for.body44.us.i359.preheader

for.body44.us.i359.preheader:                     ; preds = %for.cond41.preheader.us.i351, %middle.block609
  %j40.0101.us.i352.ph = phi i64 [ 0, %for.cond41.preheader.us.i351 ], [ %n.vec614, %middle.block609 ]
  br label %for.body44.us.i359

for.body44.us.i359:                               ; preds = %for.body44.us.i359.preheader, %for.body44.us.i359
  %j40.0101.us.i352 = phi i64 [ %inc54.us.i357, %for.body44.us.i359 ], [ %j40.0101.us.i352.ph, %for.body44.us.i359.preheader ]
  %conv46.us.i353 = uitofp i64 %j40.0101.us.i352 to float
  %181 = call float @llvm.fmuladd.f32(float %conv45.us.i349, float %conv46.us.i353, float 2.000000e+00) #30
  %div49.us.i354 = fdiv float %181, %conv48.i346.pre-phi
  %add51.us.i355 = add i64 %j40.0101.us.i352, %mul50.us.i350
  %arrayidx52.us.i356 = getelementptr inbounds float, float* %87, i64 %add51.us.i355
  store float %div49.us.i354, float* %arrayidx52.us.i356, align 4, !tbaa !8
  %inc54.us.i357 = add nuw i64 %j40.0101.us.i352, 1
  %exitcond110.not.i358 = icmp eq i64 %inc54.us.i357, %105
  br i1 %exitcond110.not.i358, label %for.cond41.for.cond.cleanup43_crit_edge.us.i362, label %for.body44.us.i359, !llvm.loop !74

for.cond41.for.cond.cleanup43_crit_edge.us.i362:  ; preds = %for.body44.us.i359, %middle.block609
  %inc57.us.i360 = add nuw i64 %i35.0103.us.i348, 1
  %exitcond111.not.i361 = icmp eq i64 %inc57.us.i360, %103
  br i1 %exitcond111.not.i361, label %_Z10initMatrixPfS_S_mmm.exit363, label %for.cond41.preheader.us.i351, !llvm.loop !23

_Z10initMatrixPfS_S_mmm.exit363:                  ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us.i362, %for.cond36.preheader.i344, %for.cond41.preheader.lr.ph.i347
  %call45 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #30
  %182 = bitcast %"struct.cl::sycl::detail::code_location"* %ref.tmp54 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %182) #30
  %MFileName.i.i364 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i364, align 8, !tbaa !51, !alias.scope !75
  %MFunctionName.i.i365 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i365, align 8, !tbaa !56, !alias.scope !75
  %MLineNo.i.i366 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 2
  %183 = bitcast i64* %MLineNo.i.i366 to <2 x i64>*
  store <2 x i64> <i64 74, i64 3>, <2 x i64>* %183, align 8, !tbaa !39, !alias.scope !75
  %184 = bitcast %"class.std::function.18"* %agg.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %184)
  %185 = bitcast %"class.cl::sycl::event"* %Event.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %185) #30, !noalias !78
  %_M_manager.i.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 1
  %call.i.i4.i.i393 = invoke noalias noundef nonnull dereferenceable(48) i8* @_Znwm(i64 noundef 48) #32
          to label %call.i.i4.i.i.noexc unwind label %lpad55

call.i.i4.i.i.noexc:                              ; preds = %_Z10initMatrixPfS_S_mmm.exit363
  %agg.tmp47.sroa.0.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %call.i.i4.i.i393 to i64**
  store i64* %M, i64** %agg.tmp47.sroa.0.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !78
  %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 8
  %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_idx to i64**
  store i64* %K, i64** %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !78
  %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 16
  %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_idx to i64**
  store i64* %N, i64** %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !78
  %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 24
  %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %C, float*** %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !78
  %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 32
  %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %A, float*** %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !78
  %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 40
  %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %B, float*** %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !78
  %186 = bitcast %"class.std::function.18"* %agg.tmp.i to i8**
  store i8* %call.i.i4.i.i393, i8** %186, align 8, !tbaa !37, !noalias !78
  %_M_invoker.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 1
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::handler"*)* @_ZNSt17_Function_handlerIFvRN2cl4sycl7handlerEEZ4mainEUlS3_E_E9_M_invokeERKSt9_Any_dataS3_, void (%"union.std::_Any_data"*, %"class.cl::sycl::handler"*)** %_M_invoker.i.i, align 8, !tbaa !81, !noalias !78
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* @_ZNSt14_Function_base13_Base_managerIZ4mainEUlRN2cl4sycl7handlerEE_E10_M_managerERSt9_Any_dataRKS7_St18_Manager_operation, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !83, !noalias !78
  invoke void @_ZN2cl4sycl5queue11submit_implESt8functionIFvRNS0_7handlerEEERKNS0_6detail13code_locationE(%"class.cl::sycl::event"* nonnull sret(%"class.cl::sycl::event") align 8 %Event.i, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.std::function.18"* noundef nonnull %agg.tmp.i, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32) %ref.tmp54)
          to label %invoke.cont.i368 unwind label %lpad.i392, !noalias !78

invoke.cont.i368:                                 ; preds = %call.i.i4.i.i.noexc
  %187 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !83, !noalias !78
  %tobool.not.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %187, null
  br i1 %tobool.not.i.i, label %_ZNSt14_Function_baseD2Ev.exit.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %invoke.cont.i368
  %_M_functor.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 0
  %call.i.i = invoke noundef i1 %187(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit.i unwind label %terminate.lpad.i.i, !noalias !78

terminate.lpad.i.i:                               ; preds = %if.then.i.i
  %188 = landingpad { i8*, i32 }
          catch i8* null
  %189 = extractvalue { i8*, i32 } %188, 0
  call void @__clang_call_terminate(i8* %189) #31, !noalias !78
  unreachable

_ZNSt14_Function_baseD2Ev.exit.i:                 ; preds = %if.then.i.i, %invoke.cont.i368
  invoke void @_ZN2cl4sycl5queue17discard_or_returnERKNS0_5eventE(%"class.cl::sycl::event"* nonnull sret(%"class.cl::sycl::event") align 8 %agg.tmp.ensured, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16) %Event.i)
          to label %invoke.cont4.i unwind label %lpad3.i

invoke.cont4.i:                                   ; preds = %_ZNSt14_Function_baseD2Ev.exit.i
  %_M_pi.i.i.i.i369 = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %Event.i, i64 0, i32 0, i32 0, i32 1, i32 0
  %190 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i369, align 8, !tbaa !44, !noalias !78
  %cmp.not.i.i.i.i370 = icmp eq %"class.std::_Sp_counted_base"* %190, null
  br i1 %cmp.not.i.i.i.i370, label %invoke.cont56, label %if.then.i.i.i.i372

if.then.i.i.i.i372:                               ; preds = %invoke.cont4.i
  %_M_use_count.i.i.i.i.i371 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %190, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i373, label %if.else.i.i.i.i.i.i375

if.then.i.i.i.i.i.i373:                           ; preds = %if.then.i.i.i.i372
  %191 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i371, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i378

if.else.i.i.i.i.i.i375:                           ; preds = %if.then.i.i.i.i372
  %192 = load i32, i32* %_M_use_count.i.i.i.i.i371, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i374 = add nsw i32 %192, -1
  store i32 %add.i.i.i.i.i.i.i374, i32* %_M_use_count.i.i.i.i.i371, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i378

invoke.cont.i.i.i.i.i378:                         ; preds = %if.else.i.i.i.i.i.i375, %if.then.i.i.i.i.i.i373
  %retval.0.i.i.i.i.i.i376 = phi i32 [ %191, %if.then.i.i.i.i.i.i373 ], [ %192, %if.else.i.i.i.i.i.i375 ]
  %cmp.i.i.i.i.i377 = icmp eq i32 %retval.0.i.i.i.i.i.i376, 1
  br i1 %cmp.i.i.i.i.i377, label %if.then.i.i.i.i.i382, label %invoke.cont56

if.then.i.i.i.i.i382:                             ; preds = %invoke.cont.i.i.i.i.i378
  %193 = bitcast %"class.std::_Sp_counted_base"* %190 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i379 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %193, align 8, !tbaa !48
  %vfn.i.i.i.i.i380 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i379, i64 2
  %194 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i380, align 8
  call void %194(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %190) #30
  %_M_weak_count.i.i.i.i.i381 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %190, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i383, label %if.else.i11.i.i.i.i.i385

if.then.i9.i.i.i.i.i383:                          ; preds = %if.then.i.i.i.i.i382
  %195 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i381, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i388

if.else.i11.i.i.i.i.i385:                         ; preds = %if.then.i.i.i.i.i382
  %196 = load i32, i32* %_M_weak_count.i.i.i.i.i381, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i384 = add nsw i32 %196, -1
  store i32 %add.i.i10.i.i.i.i.i384, i32* %_M_weak_count.i.i.i.i.i381, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i388

invoke.cont2.i.i.i.i.i388:                        ; preds = %if.else.i11.i.i.i.i.i385, %if.then.i9.i.i.i.i.i383
  %retval.0.i12.i.i.i.i.i386 = phi i32 [ %195, %if.then.i9.i.i.i.i.i383 ], [ %196, %if.else.i11.i.i.i.i.i385 ]
  %cmp4.i.i.i.i.i387 = icmp eq i32 %retval.0.i12.i.i.i.i.i386, 1
  br i1 %cmp4.i.i.i.i.i387, label %if.then5.i.i.i.i.i391, label %invoke.cont56

if.then5.i.i.i.i.i391:                            ; preds = %invoke.cont2.i.i.i.i.i388
  %vtable6.i.i.i.i.i389 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %193, align 8, !tbaa !48
  %vfn7.i.i.i.i.i390 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i389, i64 3
  %197 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i390, align 8
  call void %197(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %190) #30
  br label %invoke.cont56

lpad.i392:                                        ; preds = %call.i.i4.i.i.noexc
  %198 = landingpad { i8*, i32 }
          cleanup
  %199 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !83, !noalias !78
  %tobool.not.i8.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %199, null
  br i1 %tobool.not.i8.i, label %ehcleanup.i, label %if.then.i11.i

if.then.i11.i:                                    ; preds = %lpad.i392
  %_M_functor.i9.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 0
  %call.i10.i = invoke noundef i1 %199(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i9.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i9.i, i32 noundef 3)
          to label %ehcleanup.i unwind label %terminate.lpad.i12.i, !noalias !78

terminate.lpad.i12.i:                             ; preds = %if.then.i11.i
  %200 = landingpad { i8*, i32 }
          catch i8* null
  %201 = extractvalue { i8*, i32 } %200, 0
  call void @__clang_call_terminate(i8* %201) #31, !noalias !78
  unreachable

lpad3.i:                                          ; preds = %_ZNSt14_Function_baseD2Ev.exit.i
  %202 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl5eventD2Ev(%"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16) %Event.i) #30
  br label %ehcleanup.i

ehcleanup.i:                                      ; preds = %lpad3.i, %if.then.i11.i, %lpad.i392
  %.pn.i = phi { i8*, i32 } [ %202, %lpad3.i ], [ %198, %lpad.i392 ], [ %198, %if.then.i11.i ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %185) #30, !noalias !78
  br label %lpad55.body

invoke.cont56:                                    ; preds = %if.then5.i.i.i.i.i391, %invoke.cont2.i.i.i.i.i388, %invoke.cont.i.i.i.i.i378, %invoke.cont4.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %185) #30, !noalias !78
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %184)
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %agg.tmp.ensured, i64 0, i32 0, i32 0, i32 1, i32 0
  %203 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %203, null
  br i1 %cmp.not.i.i.i, label %invoke.cont66, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont56
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %203, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i395, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i395:                             ; preds = %if.then.i.i.i
  %204 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %205 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %205, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i395
  %retval.0.i.i.i.i.i = phi i32 [ %204, %if.then.i.i.i.i.i395 ], [ %205, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i396, label %invoke.cont66

if.then.i.i.i.i396:                               ; preds = %invoke.cont.i.i.i.i
  %206 = bitcast %"class.std::_Sp_counted_base"* %203 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %206, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %207 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %207(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %203) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %203, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i396
  %208 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i396
  %209 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %209, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %208, %if.then.i9.i.i.i.i ], [ %209, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %invoke.cont66

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %206, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %210 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %210(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %203) #30
  br label %invoke.cont66

invoke.cont66:                                    ; preds = %invoke.cont56, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %182) #30
  %call58 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #30
  %sub.i.i = sub nsw i64 %call58, %call45
  %conv.i.i.i = sitofp i64 %sub.i.i to double
  %div.i.i.i = fdiv double %conv.i.i.i, 1.000000e+09
  %211 = load i64, i64* %M, align 8, !tbaa !39
  %mul68 = shl i64 %211, 1
  %212 = load i64, i64* %N, align 8, !tbaa !39
  %mul69 = mul i64 %mul68, %212
  %213 = load i64, i64* %K, align 8, !tbaa !39
  %mul70 = mul i64 %mul69, %213
  %conv = uitofp i64 %mul70 to double
  %mul71 = fmul double %conv, 1.000000e-09
  %div = fdiv double %mul71, %div.i.i.i
  %214 = bitcast %"struct.cl::sycl::detail::code_location"* %ref.tmp75 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %214) #30
  %MFileName.i.i398 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i398, align 8, !tbaa !51, !alias.scope !85
  %MFunctionName.i.i399 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i399, align 8, !tbaa !56, !alias.scope !85
  %MLineNo.i.i400 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 2
  %215 = bitcast i64* %MLineNo.i.i400 to <2 x i64>*
  store <2 x i64> <i64 86, i64 3>, <2 x i64>* %215, align 8, !tbaa !39, !alias.scope !85
  invoke void @_ZN2cl4sycl5queue10wait_proxyERKNS0_6detail13code_locationE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32) %ref.tmp75)
          to label %invoke.cont77 unwind label %lpad76

invoke.cont77:                                    ; preds = %invoke.cont66
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %214) #30
  %216 = load float*, float** %A, align 8, !tbaa !37
  %217 = load float*, float** %B, align 8, !tbaa !37
  %218 = load i64, i64* %M, align 8, !tbaa !39
  %219 = load i64, i64* %N, align 8, !tbaa !39
  %220 = load i64, i64* %K, align 8, !tbaa !39
  %cmp51.not.i = icmp eq i64 %218, 0
  %cmp348.not.i = icmp eq i64 %220, 0
  %or.cond.i = or i1 %cmp51.not.i, %cmp348.not.i
  br i1 %or.cond.i, label %_Z11naiveMatmulPfS_S_mmm.exit, label %for.cond1.preheader.us.i404.preheader

for.cond1.preheader.us.i404.preheader:            ; preds = %invoke.cont77
  %221 = shl i64 %219, 2
  %222 = shl i64 %220, 2
  %min.iters.check646 = icmp ult i64 %220, 8
  %n.vec649 = and i64 %220, -8
  %cmp.n651 = icmp eq i64 %220, %n.vec649
  br label %for.cond1.preheader.us.i404

for.cond1.preheader.us.i404:                      ; preds = %for.cond1.preheader.us.i404.preheader, %for.cond1.for.cond.cleanup4_crit_edge.us.i
  %indvars.iv60.i = phi i64 [ %indvars.iv.next61.i, %for.cond1.for.cond.cleanup4_crit_edge.us.i ], [ 0, %for.cond1.preheader.us.i404.preheader ]
  %223 = mul i64 %221, %indvars.iv60.i
  %scevgep = getelementptr i8, i8* %call.i2.i, i64 %223
  %224 = add i64 %222, %223
  %scevgep632 = getelementptr i8, i8* %call.i2.i, i64 %224
  %225 = mul i64 %220, %indvars.iv60.i
  %226 = add i64 %225, 1
  %mul.us.i403 = mul i64 %indvars.iv60.i, %220
  %mul20.us.i = mul i64 %indvars.iv60.i, %219
  br label %for.cond6.preheader.us.i

for.body10.us.i:                                  ; preds = %for.body10.us.i.preheader, %for.body10.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body10.us.i ], [ %indvars.iv.i.ph, %for.body10.us.i.preheader ]
  %227 = load float, float* %arrayidx.us.i407, align 4, !tbaa !8
  %add16.us.i = add i64 %indvars.iv.i, %mul14.us.i
  %arrayidx17.us.i = getelementptr inbounds float, float* %217, i64 %add16.us.i
  %228 = load float, float* %arrayidx17.us.i, align 4, !tbaa !8
  %add22.us.i = add i64 %indvars.iv.i, %mul20.us.i
  %arrayidx23.us.i = getelementptr inbounds float, float* %87, i64 %add22.us.i
  %229 = load float, float* %arrayidx23.us.i, align 4, !tbaa !8
  %230 = call float @llvm.fmuladd.f32(float %227, float %228, float %229) #30
  store float %230, float* %arrayidx23.us.i, align 4, !tbaa !8
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i405 = icmp eq i64 %indvars.iv.next.i, %220
  br i1 %exitcond.not.i405, label %for.cond6.for.cond.cleanup9_crit_edge.us.i, label %for.body10.us.i, !llvm.loop !88

for.cond6.preheader.us.i:                         ; preds = %for.cond6.for.cond.cleanup9_crit_edge.us.i, %for.cond1.preheader.us.i404
  %indvars.iv56.i = phi i64 [ 0, %for.cond1.preheader.us.i404 ], [ %indvars.iv.next57.i, %for.cond6.for.cond.cleanup9_crit_edge.us.i ]
  %add.us.i406 = add i64 %indvars.iv56.i, %mul.us.i403
  %arrayidx.us.i407 = getelementptr inbounds float, float* %216, i64 %add.us.i406
  %mul14.us.i = mul i64 %indvars.iv56.i, %219
  br i1 %min.iters.check646, label %for.body10.us.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond6.preheader.us.i
  %231 = mul i64 %219, %indvars.iv56.i
  %232 = add i64 %220, %231
  %scevgep639 = getelementptr float, float* %217, i64 %232
  %scevgep639640 = bitcast float* %scevgep639 to i8*
  %scevgep637 = getelementptr float, float* %217, i64 %231
  %scevgep637638 = bitcast float* %scevgep637 to i8*
  %233 = add i64 %226, %indvars.iv56.i
  %scevgep635 = getelementptr float, float* %216, i64 %233
  %scevgep635636 = bitcast float* %scevgep635 to i8*
  %234 = add i64 %225, %indvars.iv56.i
  %scevgep633 = getelementptr float, float* %216, i64 %234
  %scevgep633634 = bitcast float* %scevgep633 to i8*
  %bound0 = icmp ult i8* %scevgep, %scevgep635636
  %bound1 = icmp ugt i8* %scevgep632, %scevgep633634
  %found.conflict = and i1 %bound0, %bound1
  %bound0641 = icmp ult i8* %scevgep, %scevgep639640
  %bound1642 = icmp ugt i8* %scevgep632, %scevgep637638
  %found.conflict643 = and i1 %bound0641, %bound1642
  %conflict.rdx = or i1 %found.conflict, %found.conflict643
  br i1 %conflict.rdx, label %for.body10.us.i.preheader, label %vector.ph647

vector.ph647:                                     ; preds = %vector.memcheck
  %235 = load float, float* %arrayidx.us.i407, align 4, !tbaa !8, !alias.scope !89
  %broadcast.splatinsert657 = insertelement <4 x float> poison, float %235, i64 0
  %broadcast.splat658 = shufflevector <4 x float> %broadcast.splatinsert657, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert659 = insertelement <4 x float> poison, float %235, i64 0
  %broadcast.splat660 = shufflevector <4 x float> %broadcast.splatinsert659, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body652

vector.body652:                                   ; preds = %vector.body652, %vector.ph647
  %index653 = phi i64 [ 0, %vector.ph647 ], [ %index.next661, %vector.body652 ]
  %236 = add i64 %index653, %mul14.us.i
  %237 = getelementptr inbounds float, float* %217, i64 %236
  %238 = bitcast float* %237 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %238, align 4, !tbaa !8, !alias.scope !92
  %239 = getelementptr inbounds float, float* %237, i64 4
  %240 = bitcast float* %239 to <4 x float>*
  %wide.load654 = load <4 x float>, <4 x float>* %240, align 4, !tbaa !8, !alias.scope !92
  %241 = add i64 %index653, %mul20.us.i
  %242 = getelementptr inbounds float, float* %87, i64 %241
  %243 = bitcast float* %242 to <4 x float>*
  %wide.load655 = load <4 x float>, <4 x float>* %243, align 4, !tbaa !8, !alias.scope !94, !noalias !96
  %244 = getelementptr inbounds float, float* %242, i64 4
  %245 = bitcast float* %244 to <4 x float>*
  %wide.load656 = load <4 x float>, <4 x float>* %245, align 4, !tbaa !8, !alias.scope !94, !noalias !96
  %246 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat658, <4 x float> %wide.load, <4 x float> %wide.load655)
  %247 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat660, <4 x float> %wide.load654, <4 x float> %wide.load656)
  %248 = bitcast float* %242 to <4 x float>*
  store <4 x float> %246, <4 x float>* %248, align 4, !tbaa !8, !alias.scope !94, !noalias !96
  %249 = bitcast float* %244 to <4 x float>*
  store <4 x float> %247, <4 x float>* %249, align 4, !tbaa !8, !alias.scope !94, !noalias !96
  %index.next661 = add nuw i64 %index653, 8
  %250 = icmp eq i64 %index.next661, %n.vec649
  br i1 %250, label %middle.block644, label %vector.body652, !llvm.loop !97

middle.block644:                                  ; preds = %vector.body652
  br i1 %cmp.n651, label %for.cond6.for.cond.cleanup9_crit_edge.us.i, label %for.body10.us.i.preheader

for.body10.us.i.preheader:                        ; preds = %vector.memcheck, %for.cond6.preheader.us.i, %middle.block644
  %indvars.iv.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond6.preheader.us.i ], [ %n.vec649, %middle.block644 ]
  br label %for.body10.us.i

for.cond6.for.cond.cleanup9_crit_edge.us.i:       ; preds = %for.body10.us.i, %middle.block644
  %indvars.iv.next57.i = add nuw nsw i64 %indvars.iv56.i, 1
  %exitcond59.not.i = icmp eq i64 %indvars.iv.next57.i, %220
  br i1 %exitcond59.not.i, label %for.cond1.for.cond.cleanup4_crit_edge.us.i, label %for.cond6.preheader.us.i, !llvm.loop !34

for.cond1.for.cond.cleanup4_crit_edge.us.i:       ; preds = %for.cond6.for.cond.cleanup9_crit_edge.us.i
  %indvars.iv.next61.i = add nuw nsw i64 %indvars.iv60.i, 1
  %exitcond63.not.i = icmp eq i64 %indvars.iv.next61.i, %218
  br i1 %exitcond63.not.i, label %_Z11naiveMatmulPfS_S_mmm.exit, label %for.cond1.preheader.us.i404, !llvm.loop !35

_Z11naiveMatmulPfS_S_mmm.exit:                    ; preds = %for.cond1.for.cond.cleanup4_crit_edge.us.i, %invoke.cont77
  %251 = load float*, float** %C, align 8, !tbaa !37
  %mul.i = mul i64 %219, %218
  %cmp7.not.i = icmp eq i64 %mul.i, 0
  br i1 %cmp7.not.i, label %if.end85, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %_Z11naiveMatmulPfS_S_mmm.exit
  %252 = load float, float* %251, align 4, !tbaa !8
  %253 = load float, float* %87, align 4, !tbaa !8
  %sub.i506 = fsub float %252, %253
  %254 = call float @llvm.fabs.f32(float %sub.i506) #30
  %255 = fpext float %254 to double
  %cmp2.i507 = fcmp ogt double %255, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2.i507, label %if.then80, label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %i.08.i508 = phi i64 [ %inc.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  %inc.i = add nuw i64 %i.08.i508, 1
  %exitcond.not.i408 = icmp eq i64 %inc.i, %mul.i
  br i1 %exitcond.not.i408, label %_Z6verifyPfS_mm.exit, label %for.body.i, !llvm.loop !36

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds float, float* %251, i64 %inc.i
  %256 = load float, float* %arrayidx.i, align 4, !tbaa !8
  %arrayidx1.i = getelementptr inbounds float, float* %87, i64 %inc.i
  %257 = load float, float* %arrayidx1.i, align 4, !tbaa !8
  %sub.i = fsub float %256, %257
  %258 = call float @llvm.fabs.f32(float %sub.i) #30
  %259 = fpext float %258 to double
  %cmp2.i = fcmp ogt double %259, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2.i, label %_Z6verifyPfS_mm.exit, label %for.cond.i, !llvm.loop !36

_Z6verifyPfS_mm.exit:                             ; preds = %for.body.i, %for.cond.i
  %cmp.i.le = icmp ult i64 %inc.i, %mul.i
  br i1 %cmp.i.le, label %if.then80, label %if.end85

if.then80:                                        ; preds = %for.body.i.preheader, %_Z6verifyPfS_mm.exit
  %call1.i409 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 noundef 14)
          to label %invoke.cont81 unwind label %lpad72

invoke.cont81:                                    ; preds = %if.then80
  %call.i410411 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr)
          to label %invoke.cont83 unwind label %lpad72

invoke.cont83:                                    ; preds = %invoke.cont81
  call void @exit(i32 noundef 1) #31
  unreachable

lpad:                                             ; preds = %if.else
  %260 = landingpad { i8*, i32 }
          cleanup
  %261 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %261) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #30
  br label %ehcleanup113

lpad12:                                           ; preds = %invoke.cont11
  %262 = landingpad { i8*, i32 }
          cleanup
  %263 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %263) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %24) #30
  br label %ehcleanup111

lpad20:                                           ; preds = %invoke.cont18
  %264 = landingpad { i8*, i32 }
          cleanup
  %265 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %265) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %41) #30
  br label %ehcleanup110

lpad30:                                           ; preds = %invoke.cont28
  %266 = landingpad { i8*, i32 }
          cleanup
  %267 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %267) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %58) #30
  br label %ehcleanup109

lpad40:                                           ; preds = %invoke.cont38
  %268 = landingpad { i8*, i32 }
          cleanup
  br label %lpad40.body

lpad40.body:                                      ; preds = %lpad.i, %lpad40
  %eh.lpad-body = phi { i8*, i32 } [ %268, %lpad40 ], [ %86, %lpad.i ]
  %269 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp36, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %269) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %74) #30
  br label %ehcleanup109

lpad55:                                           ; preds = %_Z10initMatrixPfS_S_mmm.exit363
  %270 = landingpad { i8*, i32 }
          cleanup
  br label %lpad55.body

lpad55.body:                                      ; preds = %ehcleanup.i, %lpad55
  %eh.lpad-body394 = phi { i8*, i32 } [ %270, %lpad55 ], [ %.pn.i, %ehcleanup.i ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %182) #30
  br label %ehcleanup109

lpad72:                                           ; preds = %if.then.i.i.i472.invoke, %call1.i.noexc488, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483, %.noexc485, %if.end.i.i.i480, %call1.i.noexc, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i, %.noexc462, %if.end.i.i.i, %invoke.cont98, %invoke.cont96, %invoke.cont94, %invoke.cont90, %invoke.cont86, %if.end85, %invoke.cont81, %if.then80
  %271 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup109

lpad76:                                           ; preds = %invoke.cont66
  %272 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %214) #30
  br label %ehcleanup109

if.end85:                                         ; preds = %_Z11naiveMatmulPfS_S_mmm.exit, %_Z6verifyPfS_mm.exit
  %call1.i413 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i64 noundef 10)
          to label %invoke.cont86 unwind label %lpad72

invoke.cont86:                                    ; preds = %if.end85
  %call.i416417 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div.i.i.i)
          to label %invoke.cont90 unwind label %lpad72

invoke.cont90:                                    ; preds = %invoke.cont86
  %call1.i419 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i416417, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i64 noundef 2)
          to label %invoke.cont92 unwind label %lpad72

invoke.cont92:                                    ; preds = %invoke.cont90
  %273 = bitcast %"class.std::basic_ostream"* %call.i416417 to i8**
  %vtable.i = load i8*, i8** %273, align 8, !tbaa !48
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %274 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %274, align 8
  %275 = bitcast %"class.std::basic_ostream"* %call.i416417 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %275, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 240
  %276 = bitcast i8* %_M_ctype.i.i to %"class.std::ctype"**
  %277 = load %"class.std::ctype"*, %"class.std::ctype"** %276, align 8, !tbaa !98
  %tobool.not.i.i.i = icmp eq %"class.std::ctype"* %277, null
  br i1 %tobool.not.i.i.i, label %if.then.i.i.i472.invoke, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %invoke.cont92
  %_M_widen_ok.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %277, i64 0, i32 8
  %278 = load i8, i8* %_M_widen_ok.i.i.i, align 8, !tbaa !101
  %tobool.not.i3.i.i = icmp eq i8 %278, 0
  br i1 %tobool.not.i3.i.i, label %if.end.i.i.i, label %if.then.i4.i.i

if.then.i4.i.i:                                   ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %arrayidx.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %277, i64 0, i32 9, i64 10
  %279 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !103
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i

if.end.i.i.i:                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %277)
          to label %.noexc462 unwind label %lpad72

.noexc462:                                        ; preds = %if.end.i.i.i
  %280 = bitcast %"class.std::ctype"* %277 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %280, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i, i64 6
  %281 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i.i.i463 = invoke noundef i8 %281(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %277, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i unwind label %lpad72

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i: ; preds = %.noexc462, %if.then.i4.i.i
  %retval.0.i.i.i = phi i8 [ %279, %if.then.i4.i.i ], [ %call.i.i.i463, %.noexc462 ]
  %call1.i464 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i416417, i8 noundef %retval.0.i.i.i)
          to label %call1.i.noexc unwind label %lpad72

call1.i.noexc:                                    ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i
  %call.i.i460465 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i464)
          to label %invoke.cont94 unwind label %lpad72

invoke.cont94:                                    ; preds = %call1.i.noexc
  %call1.i425 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i64 noundef 13)
          to label %invoke.cont96 unwind label %lpad72

invoke.cont96:                                    ; preds = %invoke.cont94
  %call.i427428 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div)
          to label %invoke.cont98 unwind label %lpad72

invoke.cont98:                                    ; preds = %invoke.cont96
  %call1.i431 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i427428, i8* noundef nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i64 noundef 7)
          to label %invoke.cont100 unwind label %lpad72

invoke.cont100:                                   ; preds = %invoke.cont98
  %282 = bitcast %"class.std::basic_ostream"* %call.i427428 to i8**
  %vtable.i466 = load i8*, i8** %282, align 8, !tbaa !48
  %vbase.offset.ptr.i467 = getelementptr i8, i8* %vtable.i466, i64 -24
  %283 = bitcast i8* %vbase.offset.ptr.i467 to i64*
  %vbase.offset.i468 = load i64, i64* %283, align 8
  %284 = bitcast %"class.std::basic_ostream"* %call.i427428 to i8*
  %add.ptr.i469 = getelementptr inbounds i8, i8* %284, i64 %vbase.offset.i468
  %_M_ctype.i.i470 = getelementptr inbounds i8, i8* %add.ptr.i469, i64 240
  %285 = bitcast i8* %_M_ctype.i.i470 to %"class.std::ctype"**
  %286 = load %"class.std::ctype"*, %"class.std::ctype"** %285, align 8, !tbaa !98
  %tobool.not.i.i.i471 = icmp eq %"class.std::ctype"* %286, null
  br i1 %tobool.not.i.i.i471, label %if.then.i.i.i472.invoke, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475

if.then.i.i.i472.invoke:                          ; preds = %invoke.cont100, %invoke.cont92
  invoke void @_ZSt16__throw_bad_castv() #33
          to label %if.then.i.i.i472.cont unwind label %lpad72

if.then.i.i.i472.cont:                            ; preds = %if.then.i.i.i472.invoke
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475: ; preds = %invoke.cont100
  %_M_widen_ok.i.i.i473 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %286, i64 0, i32 8
  %287 = load i8, i8* %_M_widen_ok.i.i.i473, align 8, !tbaa !101
  %tobool.not.i3.i.i474 = icmp eq i8 %287, 0
  br i1 %tobool.not.i3.i.i474, label %if.end.i.i.i480, label %if.then.i4.i.i477

if.then.i4.i.i477:                                ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475
  %arrayidx.i.i.i476 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %286, i64 0, i32 9, i64 10
  %288 = load i8, i8* %arrayidx.i.i.i476, align 1, !tbaa !103
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483

if.end.i.i.i480:                                  ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %286)
          to label %.noexc485 unwind label %lpad72

.noexc485:                                        ; preds = %if.end.i.i.i480
  %289 = bitcast %"class.std::ctype"* %286 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i478 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %289, align 8, !tbaa !48
  %vfn.i.i.i479 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i478, i64 6
  %290 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i479, align 8
  %call.i.i.i487 = invoke noundef i8 %290(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %286, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483 unwind label %lpad72

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483: ; preds = %.noexc485, %if.then.i4.i.i477
  %retval.0.i.i.i481 = phi i8 [ %288, %if.then.i4.i.i477 ], [ %call.i.i.i487, %.noexc485 ]
  %call1.i489 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i427428, i8 noundef %retval.0.i.i.i481)
          to label %call1.i.noexc488 unwind label %lpad72

call1.i.noexc488:                                 ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483
  %call.i.i482490 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1.i489)
          to label %invoke.cont102 unwind label %lpad72

invoke.cont102:                                   ; preds = %call1.i.noexc488
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %55) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #30
  %_M_pi.i.i.i436 = getelementptr inbounds %"class.cl::sycl::queue", %"class.cl::sycl::queue"* %q, i64 0, i32 0, i32 0, i32 1, i32 0
  %291 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i436, align 8, !tbaa !44
  %cmp.not.i.i.i437 = icmp eq %"class.std::_Sp_counted_base"* %291, null
  br i1 %cmp.not.i.i.i437, label %_ZN2cl4sycl5queueD2Ev.exit, label %if.then.i.i.i439

if.then.i.i.i439:                                 ; preds = %invoke.cont102
  %_M_use_count.i.i.i.i438 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %291, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i440, label %if.else.i.i.i.i.i442

if.then.i.i.i.i.i440:                             ; preds = %if.then.i.i.i439
  %292 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i438, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i445

if.else.i.i.i.i.i442:                             ; preds = %if.then.i.i.i439
  %293 = load i32, i32* %_M_use_count.i.i.i.i438, align 8, !tbaa !46
  %add.i.i.i.i.i.i441 = add nsw i32 %293, -1
  store i32 %add.i.i.i.i.i.i441, i32* %_M_use_count.i.i.i.i438, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i445

invoke.cont.i.i.i.i445:                           ; preds = %if.else.i.i.i.i.i442, %if.then.i.i.i.i.i440
  %retval.0.i.i.i.i.i443 = phi i32 [ %292, %if.then.i.i.i.i.i440 ], [ %293, %if.else.i.i.i.i.i442 ]
  %cmp.i.i.i.i444 = icmp eq i32 %retval.0.i.i.i.i.i443, 1
  br i1 %cmp.i.i.i.i444, label %if.then.i.i.i.i449, label %_ZN2cl4sycl5queueD2Ev.exit

if.then.i.i.i.i449:                               ; preds = %invoke.cont.i.i.i.i445
  %294 = bitcast %"class.std::_Sp_counted_base"* %291 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i446 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %294, align 8, !tbaa !48
  %vfn.i.i.i.i447 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i446, i64 2
  %295 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i447, align 8
  call void %295(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %291) #30
  %_M_weak_count.i.i.i.i448 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %291, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i450, label %if.else.i11.i.i.i.i452

if.then.i9.i.i.i.i450:                            ; preds = %if.then.i.i.i.i449
  %296 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i448, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i455

if.else.i11.i.i.i.i452:                           ; preds = %if.then.i.i.i.i449
  %297 = load i32, i32* %_M_weak_count.i.i.i.i448, align 4, !tbaa !46
  %add.i.i10.i.i.i.i451 = add nsw i32 %297, -1
  store i32 %add.i.i10.i.i.i.i451, i32* %_M_weak_count.i.i.i.i448, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i455

invoke.cont2.i.i.i.i455:                          ; preds = %if.else.i11.i.i.i.i452, %if.then.i9.i.i.i.i450
  %retval.0.i12.i.i.i.i453 = phi i32 [ %296, %if.then.i9.i.i.i.i450 ], [ %297, %if.else.i11.i.i.i.i452 ]
  %cmp4.i.i.i.i454 = icmp eq i32 %retval.0.i12.i.i.i.i453, 1
  br i1 %cmp4.i.i.i.i454, label %if.then5.i.i.i.i458, label %_ZN2cl4sycl5queueD2Ev.exit

if.then5.i.i.i.i458:                              ; preds = %invoke.cont2.i.i.i.i455
  %vtable6.i.i.i.i456 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %294, align 8, !tbaa !48
  %vfn7.i.i.i.i457 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i456, i64 3
  %298 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i457, align 8
  call void %298(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %291) #30
  br label %_ZN2cl4sycl5queueD2Ev.exit

_ZN2cl4sycl5queueD2Ev.exit:                       ; preds = %invoke.cont102, %invoke.cont.i.i.i.i445, %invoke.cont2.i.i.i.i455, %if.then5.i.i.i.i458
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  ret i32 0

ehcleanup109:                                     ; preds = %lpad55.body, %lpad72, %lpad76, %lpad40.body, %lpad30
  %.pn134.pn.pn.pn.pn = phi { i8*, i32 } [ %266, %lpad30 ], [ %eh.lpad-body, %lpad40.body ], [ %eh.lpad-body394, %lpad55.body ], [ %271, %lpad72 ], [ %272, %lpad76 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %55) #30
  br label %ehcleanup110

ehcleanup110:                                     ; preds = %ehcleanup109, %lpad20
  %.pn134.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn, %ehcleanup109 ], [ %264, %lpad20 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #30
  br label %ehcleanup111

ehcleanup111:                                     ; preds = %ehcleanup110, %lpad12
  %.pn134.pn.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn.pn, %ehcleanup110 ], [ %262, %lpad12 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #30
  call void @_ZN2cl4sycl5queueD2Ev(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q) #30
  br label %ehcleanup113

ehcleanup113:                                     ; preds = %ehcleanup111, %lpad
  %.pn134.pn.pn.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn.pn.pn, %ehcleanup111 ], [ %260, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  resume { i8*, i32 } %.pn134.pn.pn.pn.pn.pn.pn.pn
}

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef) local_unnamed_addr #9

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #9

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #11

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl5queueC2ERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %this, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %PropList) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i = alloca %"class.cl::sycl::device", align 8
  %ref.tmp = alloca %"class.cl::sycl::default_selector", align 8
  %ref.tmp2 = alloca %"class.std::function", align 8
  %0 = bitcast %"class.cl::sycl::default_selector"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.cl::sycl::default_selector", %"class.cl::sycl::default_selector"* %ref.tmp, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl16default_selectorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !48
  %2 = getelementptr inbounds %"class.cl::sycl::default_selector", %"class.cl::sycl::default_selector"* %ref.tmp, i64 0, i32 0
  %3 = bitcast %"class.std::function"* %ref.tmp2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %3) #30
  %_M_manager.i.i = getelementptr inbounds %"class.std::function", %"class.std::function"* %ref.tmp2, i64 0, i32 0, i32 1
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !83
  %4 = bitcast %"class.cl::sycl::device"* %ref.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #30
  %5 = load void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)*, void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl16default_selectorE, i64 0, inrange i32 0, i64 4) to void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)**), align 8
  call void %5(%"class.cl::sycl::device"* nonnull sret(%"class.cl::sycl::device") align 8 %ref.tmp.i, %"class.cl::sycl::device_selector"* noundef nonnull align 8 dereferenceable(8) %2)
  invoke void @_ZN2cl4sycl5queueC2ERKNS0_6deviceERKSt8functionIFvNS0_14exception_listEEERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %this, %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i, %"class.std::function"* noundef nonnull align 8 dereferenceable(32) %ref.tmp2, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %PropList)
          to label %invoke.cont.i unwind label %lpad.body

invoke.cont.i:                                    ; preds = %entry
  %_M_pi.i.i.i.i = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %ref.tmp.i, i64 0, i32 0, i32 0, i32 1, i32 0
  %6 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %6, null
  br i1 %cmp.not.i.i.i.i, label %invoke.cont, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %6, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i

if.else.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i

invoke.cont.i.i.i.i.i:                            ; preds = %if.else.i.i.i.i.i.i, %if.then.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i = phi i32 [ %7, %if.then.i.i.i.i.i.i ], [ %8, %if.else.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i, label %if.then.i.i.i.i.i, label %invoke.cont

if.then.i.i.i.i.i:                                ; preds = %invoke.cont.i.i.i.i.i
  %9 = bitcast %"class.std::_Sp_counted_base"* %6 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %9, align 8, !tbaa !48
  %vfn.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i, i64 2
  %10 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i, align 8
  call void %10(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %6) #30
  %_M_weak_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %6, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i, label %if.else.i11.i.i.i.i.i

if.then.i9.i.i.i.i.i:                             ; preds = %if.then.i.i.i.i.i
  %11 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i

if.else.i11.i.i.i.i.i:                            ; preds = %if.then.i.i.i.i.i
  %12 = load i32, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i = add nsw i32 %12, -1
  store i32 %add.i.i10.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i

invoke.cont2.i.i.i.i.i:                           ; preds = %if.else.i11.i.i.i.i.i, %if.then.i9.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i = phi i32 [ %11, %if.then.i9.i.i.i.i.i ], [ %12, %if.else.i11.i.i.i.i.i ]
  %cmp4.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i, label %if.then5.i.i.i.i.i, label %invoke.cont

if.then5.i.i.i.i.i:                               ; preds = %invoke.cont2.i.i.i.i.i
  %vtable6.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %9, align 8, !tbaa !48
  %vfn7.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i, i64 3
  %13 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i, align 8
  call void %13(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %6) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.then5.i.i.i.i.i, %invoke.cont2.i.i.i.i.i, %invoke.cont.i.i.i.i.i, %invoke.cont.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #30
  %14 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !83
  %tobool.not.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %14, null
  br i1 %tobool.not.i, label %_ZNSt14_Function_baseD2Ev.exit, label %if.then.i

if.then.i:                                        ; preds = %invoke.cont
  %_M_functor.i = getelementptr inbounds %"class.std::function", %"class.std::function"* %ref.tmp2, i64 0, i32 0, i32 0
  %call.i = invoke noundef i1 %14(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit unwind label %terminate.lpad.i

terminate.lpad.i:                                 ; preds = %if.then.i
  %15 = landingpad { i8*, i32 }
          catch i8* null
  %16 = extractvalue { i8*, i32 } %15, 0
  call void @__clang_call_terminate(i8* %16) #31
  unreachable

_ZNSt14_Function_baseD2Ev.exit:                   ; preds = %invoke.cont, %if.then.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %3) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  ret void

lpad.body:                                        ; preds = %entry
  %17 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl6deviceD2Ev(%"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #30
  %.pre = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !83
  %tobool.not.i5 = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %.pre, null
  br i1 %tobool.not.i5, label %_ZNSt14_Function_baseD2Ev.exit10, label %if.then.i8

if.then.i8:                                       ; preds = %lpad.body
  %_M_functor.i6 = getelementptr inbounds %"class.std::function", %"class.std::function"* %ref.tmp2, i64 0, i32 0, i32 0
  %call.i7 = invoke noundef i1 %.pre(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i6, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i6, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit10 unwind label %terminate.lpad.i9

terminate.lpad.i9:                                ; preds = %if.then.i8
  %18 = landingpad { i8*, i32 }
          catch i8* null
  %19 = extractvalue { i8*, i32 } %18, 0
  call void @__clang_call_terminate(i8* %19) #31
  unreachable

_ZNSt14_Function_baseD2Ev.exit10:                 ; preds = %lpad.body, %if.then.i8
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %3) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  resume { i8*, i32 } %17
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_start.i = getelementptr inbounds %"class.cl::sycl::detail::PropertyListBase", %"class.cl::sycl::detail::PropertyListBase"* %this, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %0 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i, align 8, !tbaa !41
  %_M_finish.i = getelementptr inbounds %"class.cl::sycl::detail::PropertyListBase", %"class.cl::sycl::detail::PropertyListBase"* %this, i64 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %1 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i, align 8, !tbaa !43
  %cmp.not3.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %0, %1
  br i1 %cmp.not3.i.i.i.i, label %invoke.cont.i, label %for.body.i.i.i.i

for.body.i.i.i.i:                                 ; preds = %entry, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i
  %__first.addr.04.i.i.i.i = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i ], [ %0, %entry ]
  %_M_pi.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i, label %if.then.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i:                            ; preds = %for.body.i.i.i.i
  %_M_use_count.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i:                        ; preds = %if.then.i.i.i.i.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i

if.else.i.i.i.i.i.i.i.i.i:                        ; preds = %if.then.i.i.i.i.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i.i.i.i.i

invoke.cont.i.i.i.i.i.i.i.i:                      ; preds = %if.else.i.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont.i.i.i.i.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i, align 8
  tail call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i, label %if.else.i11.i.i.i.i.i.i.i.i

if.then.i9.i.i.i.i.i.i.i.i:                       ; preds = %if.then.i.i.i.i.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i

if.else.i11.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i.i.i.i.i

invoke.cont2.i.i.i.i.i.i.i.i:                     ; preds = %if.else.i11.i.i.i.i.i.i.i.i, %if.then.i9.i.i.i.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i.i.i.i.i ]
  %cmp4.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i, label %if.then5.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

if.then5.i.i.i.i.i.i.i.i:                         ; preds = %invoke.cont2.i.i.i.i.i.i.i.i
  %vtable6.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn7.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i, align 8
  tail call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i: ; preds = %if.then5.i.i.i.i.i.i.i.i, %invoke.cont2.i.i.i.i.i.i.i.i, %invoke.cont.i.i.i.i.i.i.i.i, %for.body.i.i.i.i
  %incdec.ptr.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i, i64 1
  %cmp.not.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i, %1
  br i1 %cmp.not.i.i.i.i, label %invoke.cont.loopexit.i, label %for.body.i.i.i.i, !llvm.loop !50

invoke.cont.loopexit.i:                           ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i
  %.pre.i = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i, align 8, !tbaa !41
  br label %invoke.cont.i

invoke.cont.i:                                    ; preds = %invoke.cont.loopexit.i, %entry
  %10 = phi %"class.std::shared_ptr.0"* [ %.pre.i, %invoke.cont.loopexit.i ], [ %0, %entry ]
  %tobool.not.i.i.i = icmp eq %"class.std::shared_ptr.0"* %10, null
  br i1 %tobool.not.i.i.i, label %_ZNSt6vectorISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEESaIS5_EED2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %11 = bitcast %"class.std::shared_ptr.0"* %10 to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %11) #30
  br label %_ZNSt6vectorISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEESaIS5_EED2Ev.exit

_ZNSt6vectorISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEESaIS5_EED2Ev.exit: ; preds = %invoke.cont.i, %if.then.i.i.i
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dso_local noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %Count, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %Q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %PropList, %"struct.cl::sycl::detail::code_location"* noundef %CodeLoc) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %agg.tmp.i = alloca %"struct.cl::sycl::detail::code_location", align 8
  %ref.tmp = alloca %"class.cl::sycl::device", align 8
  %ref.tmp1 = alloca %"class.cl::sycl::context", align 8
  %0 = bitcast %"class.cl::sycl::device"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #30
  call void @_ZNK2cl4sycl5queue10get_deviceEv(%"class.cl::sycl::device"* nonnull sret(%"class.cl::sycl::device") align 8 %ref.tmp, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %Q)
  %1 = bitcast %"class.cl::sycl::context"* %ref.tmp1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #30
  invoke void @_ZNK2cl4sycl5queue11get_contextEv(%"class.cl::sycl::context"* nonnull sret(%"class.cl::sycl::context") align 8 %ref.tmp1, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %Q)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %2 = bitcast %"struct.cl::sycl::detail::code_location"* %CodeLoc to i8*
  %3 = bitcast %"struct.cl::sycl::detail::code_location"* %agg.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %3)
  %mul.i = shl i64 %Count, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %3, i8* noundef nonnull align 8 dereferenceable(32) %2, i64 32, i1 false)
  %call.i9 = invoke noundef i8* @_ZN2cl4sycl20aligned_alloc_sharedEmmRKNS0_6deviceERKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef 4, i64 noundef %mul.i, %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp, %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16) %ref.tmp1, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %PropList, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp.i)
          to label %invoke.cont3 unwind label %lpad2

invoke.cont3:                                     ; preds = %invoke.cont
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %3)
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::context", %"class.cl::sycl::context"* %ref.tmp1, i64 0, i32 0, i32 0, i32 1, i32 0
  %4 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %4, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont3
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %4, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %5, %if.then.i.i.i.i.i ], [ %6, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %7 = bitcast %"class.std::_Sp_counted_base"* %4 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %7, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %4) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %4, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %9 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %10 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %10, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %9, %if.then.i9.i.i.i.i ], [ %10, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %7, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %11 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %11(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %4) #30
  br label %_ZN2cl4sycl7contextD2Ev.exit

_ZN2cl4sycl7contextD2Ev.exit:                     ; preds = %invoke.cont3, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #30
  %_M_pi.i.i.i10 = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %ref.tmp, i64 0, i32 0, i32 0, i32 1, i32 0
  %12 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i10, align 8, !tbaa !44
  %cmp.not.i.i.i11 = icmp eq %"class.std::_Sp_counted_base"* %12, null
  br i1 %cmp.not.i.i.i11, label %_ZN2cl4sycl6deviceD2Ev.exit, label %if.then.i.i.i13

if.then.i.i.i13:                                  ; preds = %_ZN2cl4sycl7contextD2Ev.exit
  %_M_use_count.i.i.i.i12 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i14, label %if.else.i.i.i.i.i16

if.then.i.i.i.i.i14:                              ; preds = %if.then.i.i.i13
  %13 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i12, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i19

if.else.i.i.i.i.i16:                              ; preds = %if.then.i.i.i13
  %14 = load i32, i32* %_M_use_count.i.i.i.i12, align 8, !tbaa !46
  %add.i.i.i.i.i.i15 = add nsw i32 %14, -1
  store i32 %add.i.i.i.i.i.i15, i32* %_M_use_count.i.i.i.i12, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i19

invoke.cont.i.i.i.i19:                            ; preds = %if.else.i.i.i.i.i16, %if.then.i.i.i.i.i14
  %retval.0.i.i.i.i.i17 = phi i32 [ %13, %if.then.i.i.i.i.i14 ], [ %14, %if.else.i.i.i.i.i16 ]
  %cmp.i.i.i.i18 = icmp eq i32 %retval.0.i.i.i.i.i17, 1
  br i1 %cmp.i.i.i.i18, label %if.then.i.i.i.i23, label %_ZN2cl4sycl6deviceD2Ev.exit

if.then.i.i.i.i23:                                ; preds = %invoke.cont.i.i.i.i19
  %15 = bitcast %"class.std::_Sp_counted_base"* %12 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i20 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !48
  %vfn.i.i.i.i21 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i20, i64 2
  %16 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i21, align 8
  call void %16(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  %_M_weak_count.i.i.i.i22 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i24, label %if.else.i11.i.i.i.i26

if.then.i9.i.i.i.i24:                             ; preds = %if.then.i.i.i.i23
  %17 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i22, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i29

if.else.i11.i.i.i.i26:                            ; preds = %if.then.i.i.i.i23
  %18 = load i32, i32* %_M_weak_count.i.i.i.i22, align 4, !tbaa !46
  %add.i.i10.i.i.i.i25 = add nsw i32 %18, -1
  store i32 %add.i.i10.i.i.i.i25, i32* %_M_weak_count.i.i.i.i22, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i29

invoke.cont2.i.i.i.i29:                           ; preds = %if.else.i11.i.i.i.i26, %if.then.i9.i.i.i.i24
  %retval.0.i12.i.i.i.i27 = phi i32 [ %17, %if.then.i9.i.i.i.i24 ], [ %18, %if.else.i11.i.i.i.i26 ]
  %cmp4.i.i.i.i28 = icmp eq i32 %retval.0.i12.i.i.i.i27, 1
  br i1 %cmp4.i.i.i.i28, label %if.then5.i.i.i.i32, label %_ZN2cl4sycl6deviceD2Ev.exit

if.then5.i.i.i.i32:                               ; preds = %invoke.cont2.i.i.i.i29
  %vtable6.i.i.i.i30 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !48
  %vfn7.i.i.i.i31 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i30, i64 3
  %19 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i31, align 8
  call void %19(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  br label %_ZN2cl4sycl6deviceD2Ev.exit

_ZN2cl4sycl6deviceD2Ev.exit:                      ; preds = %_ZN2cl4sycl7contextD2Ev.exit, %invoke.cont.i.i.i.i19, %invoke.cont2.i.i.i.i29, %if.then5.i.i.i.i32
  %20 = bitcast i8* %call.i9 to float*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #30
  ret float* %20

lpad:                                             ; preds = %entry
  %21 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad2:                                            ; preds = %invoke.cont
  %22 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl7contextD2Ev(%"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16) %ref.tmp1) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad2, %lpad
  %.pn = phi { i8*, i32 } [ %22, %lpad2 ], [ %21, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #30
  call void @_ZN2cl4sycl6deviceD2Ev(%"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #30
  resume { i8*, i32 } %.pn
}

; Function Attrs: nounwind
declare dso_local i64 @_ZNSt6chrono3_V212system_clock3nowEv() local_unnamed_addr #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl5eventD2Ev(%"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl5queueD2Ev(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::queue", %"class.cl::sycl::queue"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #14

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #15 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #30
  tail call void @_ZSt9terminatev() #31
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare dso_local void @_ZSt9terminatev() local_unnamed_addr

declare dso_local void @_ZN2cl4sycl5queueC2ERKNS0_6deviceERKSt8functionIFvNS0_14exception_listEEERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16), %"class.std::function"* noundef nonnull align 8 dereferenceable(32), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32)) unnamed_addr #0

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6deviceD2Ev(%"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

; Function Attrs: nounwind
declare extern_weak dso_local noundef i32 @__pthread_key_create(i32* noundef, void (i8*)* noundef) #1

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8* noundef) local_unnamed_addr #16

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #17

declare dso_local void @_ZN2cl4sycl5queue10wait_proxyERKNS0_6detail13code_locationE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8* nocapture noundef) local_unnamed_addr #18

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #19

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare dso_local void @_ZNK2cl4sycl5queue10get_deviceEv(%"class.cl::sycl::device"* sret(%"class.cl::sycl::device") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

declare dso_local void @_ZNK2cl4sycl5queue11get_contextEv(%"class.cl::sycl::context"* sret(%"class.cl::sycl::context") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl7contextD2Ev(%"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::context", %"class.cl::sycl::context"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

declare dso_local noundef i8* @_ZN2cl4sycl20aligned_alloc_sharedEmmRKNS0_6deviceERKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef, i64 noundef, %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32), %"struct.cl::sycl::detail::code_location"* noundef) local_unnamed_addr #0

declare dso_local noundef i8* @_ZN2cl4sycl18aligned_alloc_hostEmmRKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef, i64 noundef, %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32), %"struct.cl::sycl::detail::code_location"* noundef) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl5queue11submit_implESt8functionIFvRNS0_7handlerEEERKNS0_6detail13code_locationE(%"class.cl::sycl::event"* sret(%"class.cl::sycl::event") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.std::function.18"* noundef, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl5queue17discard_or_returnERKNS0_5eventE(%"class.cl::sycl::event"* sret(%"class.cl::sycl::event") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_ZNSt17_Function_handlerIFvRN2cl4sycl7handlerEEZ4mainEUlS3_E_E9_M_invokeERKSt9_Any_dataS3_(%"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__functor, %"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args) #12 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %__typeinfo_result.i.i.i.i.i.i148.i.i.i = alloca %"union.std::_Any_data", align 8
  %__ptr.i.i.i.i.i149.i.i.i = alloca %"union.std::_Any_data", align 8
  %__dnew.i.i.i.i101.i.i.i = alloca i64, align 8
  %__dnew.i.i.i.i.i.i.i = alloca i64, align 8
  %NumWorkItems.i.i.i = alloca <2 x i64>, align 16
  %tmpcast = bitcast <2 x i64>* %NumWorkItems.i.i.i to %"class.cl::sycl::range.118"*
  %ref.tmp.i.i.i = alloca %"class.std::__cxx11::basic_string", align 8
  %MinFactorX.i.i.i = alloca i64, align 8
  %GoodFactorX.i.i.i = alloca i64, align 8
  %MinRangeX.i.i.i = alloca i64, align 8
  %KName.i.i.i = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"union.std::_Any_data"* %__functor to %class.anon**
  %__functor.val = load %class.anon*, %class.anon** %0, align 8, !tbaa !37
  %M.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 0
  %1 = load i64*, i64** %M.i, align 8, !tbaa !104
  %2 = load i64, i64* %1, align 8, !tbaa !39
  %K.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 1
  %3 = load i64*, i64** %K.i, align 8, !tbaa !106
  %4 = load i64, i64* %3, align 8, !tbaa !39
  %N2.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 2
  %5 = load i64*, i64** %N2.i, align 8, !tbaa !107
  %6 = load i64, i64* %5, align 8, !tbaa !39
  %C3.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 3
  %7 = load float**, float*** %C3.i, align 8, !tbaa !108
  %8 = load float*, float** %7, align 8, !tbaa !37
  %A4.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 4
  %9 = load float**, float*** %A4.i, align 8, !tbaa !109
  %10 = load float*, float** %9, align 8, !tbaa !37
  %B7.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 5
  %11 = load float**, float*** %B7.i, align 8, !tbaa !110
  %12 = load float*, float** %11, align 8, !tbaa !37
  %13 = bitcast <2 x i64>* %NumWorkItems.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13)
  %NumWorkItems.coerce.fca.0.gep.i.i.i = getelementptr inbounds <2 x i64>, <2 x i64>* %NumWorkItems.i.i.i, i64 0, i64 0
  store i64 %2, i64* %NumWorkItems.coerce.fca.0.gep.i.i.i, align 16
  %14 = getelementptr inbounds <2 x i64>, <2 x i64>* %NumWorkItems.i.i.i, i64 0, i64 1
  store i64 %4, i64* %14, align 8
  %MCGType.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 12
  %15 = load i32, i32* %MCGType.i.i.i.i.i, align 8, !tbaa !111
  %conv.i.i.i.i.i = and i32 %15, 255
  %cmp.not.i.i.i.i = icmp eq i32 %conv.i.i.i.i.i, 0
  br i1 %cmp.not.i.i.i.i, label %_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry
  %exception.i.i.i.i = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %16 = bitcast i8* %exception.i.i.i.i to %"class.cl::sycl::runtime_error"*
  invoke void @_ZN2cl4sycl13runtime_errorC2EPKci(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %16, i8* noundef getelementptr inbounds ([131 x i8], [131 x i8]* @.str.10, i64 0, i64 0), i32 noundef -59)
          to label %invoke.cont.i.i.i.i unwind label %lpad.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  tail call void @__cxa_throw(i8* %exception.i.i.i.i, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

common.resume.i.i.i:                              ; preds = %ehcleanup76.i.i.i, %ehcleanup.i.i.i, %lpad.i.i.i.i
  %common.resume.op.i.i.i = phi { i8*, i32 } [ %17, %lpad.i.i.i.i ], [ %.pn93.pn.i.i.i, %ehcleanup76.i.i.i ], [ %.pn.i.i.i, %ehcleanup.i.i.i ]
  resume { i8*, i32 } %common.resume.op.i.i.i

lpad.i.i.i.i:                                     ; preds = %if.then.i.i.i.i
  %17 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %exception.i.i.i.i) #30
  br label %common.resume.i.i.i

_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i: ; preds = %entry
  %18 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %18) #30
  %19 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 2
  %20 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i to %union.anon**
  store %union.anon* %19, %union.anon** %20, align 8, !tbaa !141
  %21 = bitcast %union.anon* %19 to i8*
  %22 = bitcast i64* %__dnew.i.i.i.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #30
  store i64 62, i64* %__dnew.i.i.i.i.i.i.i, align 8, !tbaa !39
  %call5.i.i.i10.i99.i.i.i = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i.i.i.i, i64 noundef 0)
          to label %call5.i.i.i10.i.noexc.i.i.i unwind label %lpad.i.i.i

call5.i.i.i10.i.noexc.i.i.i:                      ; preds = %_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i
  %_M_p.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i99.i.i.i, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !142
  %23 = load i64, i64* %__dnew.i.i.i.i.i.i.i, align 8, !tbaa !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(62) %call5.i.i.i10.i99.i.i.i, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0), i64 62, i1 false) #30
  %_M_string_length.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 1
  %24 = insertelement <2 x i64> poison, i64 %23, i64 0
  %25 = shufflevector <2 x i64> %24, <2 x i64> poison, <2 x i32> zeroinitializer
  %26 = bitcast i64* %_M_string_length.i.i.i.i.i.i.i.i.i to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %26, align 8, !tbaa !103
  %arrayidx.i.i.i.i.i.i.i.i = getelementptr inbounds i8, i8* %call5.i.i.i10.i99.i.i.i, i64 %23
  store i8 0, i8* %arrayidx.i.i.i.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #30
  invoke void @_ZN2cl4sycl7handler22verifyUsedKernelBundleERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i.i.i)
          to label %invoke.cont5.i.i.i unwind label %lpad4.i.i.i

invoke.cont5.i.i.i:                               ; preds = %call5.i.i.i10.i.noexc.i.i.i
  %27 = load i8*, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i.i.i.i = icmp eq i8* %27, %21
  br i1 %cmp.i.i.i.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i, label %if.then.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %invoke.cont5.i.i.i
  call void @_ZdlPv(i8* noundef %27) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i: ; preds = %if.then.i.i.i.i.i, %invoke.cont5.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %18) #30
  %28 = bitcast i64* %MinFactorX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28) #30
  store i64 16, i64* %MinFactorX.i.i.i, align 8, !tbaa !39
  %29 = bitcast i64* %GoodFactorX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29) #30
  store i64 32, i64* %GoodFactorX.i.i.i, align 8, !tbaa !39
  %30 = bitcast i64* %MinRangeX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30) #30
  store i64 1024, i64* %MinRangeX.i.i.i, align 8, !tbaa !39
  call void @_ZN2cl4sycl7handler24GetRangeRoundingSettingsERmS2_S2_(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, i64* noundef nonnull align 8 dereferenceable(8) %MinFactorX.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %GoodFactorX.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %MinRangeX.i.i.i)
  %31 = bitcast %"class.std::__cxx11::basic_string"* %KName.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %31) #30
  %32 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 2
  %33 = bitcast %"class.std::__cxx11::basic_string"* %KName.i.i.i to %union.anon**
  store %union.anon* %32, %union.anon** %33, align 8, !tbaa !141
  %34 = bitcast %union.anon* %32 to i8*
  %35 = bitcast i64* %__dnew.i.i.i.i101.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %35) #30
  store i64 59, i64* %__dnew.i.i.i.i101.i.i.i, align 8, !tbaa !39
  %call5.i.i.i10.i114.i.i.i = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %KName.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i101.i.i.i, i64 noundef 0)
          to label %call5.i.i.i10.i.noexc113.i.i.i unwind label %lpad10.i.i.i

call5.i.i.i10.i.noexc113.i.i.i:                   ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i
  %_M_p.i.i.i.i.i104.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i114.i.i.i, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !142
  %36 = load i64, i64* %__dnew.i.i.i.i101.i.i.i, align 8, !tbaa !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(59) %call5.i.i.i10.i114.i.i.i, i8* noundef nonnull align 1 dereferenceable(59) getelementptr inbounds ([60 x i8], [60 x i8]* @_ZTSPZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_, i64 0, i64 0), i64 59, i1 false) #30
  %_M_string_length.i.i.i.i.i.i111.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 1
  %37 = insertelement <2 x i64> poison, i64 %36, i64 0
  %38 = shufflevector <2 x i64> %37, <2 x i64> poison, <2 x i32> zeroinitializer
  %39 = bitcast i64* %_M_string_length.i.i.i.i.i.i111.i.i.i to <2 x i64>*
  store <2 x i64> %38, <2 x i64>* %39, align 8, !tbaa !103
  %arrayidx.i.i.i.i.i112.i.i.i = getelementptr inbounds i8, i8* %call5.i.i.i10.i114.i.i.i, i64 %36
  store i8 0, i8* %arrayidx.i.i.i.i.i112.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %35) #30
  %call16.i.i.i = invoke noundef i1 @_ZN2cl4sycl7handler20DisableRangeRoundingEv(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args)
          to label %invoke.cont63.i.i.i unwind label %lpad14.i.i.i

lpad.i.i.i:                                       ; preds = %_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i
  %40 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup.i.i.i

lpad4.i.i.i:                                      ; preds = %call5.i.i.i10.i.noexc.i.i.i
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = load i8*, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i130.i.i.i = icmp eq i8* %42, %21
  br i1 %cmp.i.i.i130.i.i.i, label %ehcleanup.i.i.i, label %if.then.i.i131.i.i.i

if.then.i.i131.i.i.i:                             ; preds = %lpad4.i.i.i
  call void @_ZdlPv(i8* noundef %42) #30
  br label %ehcleanup.i.i.i

ehcleanup.i.i.i:                                  ; preds = %if.then.i.i131.i.i.i, %lpad4.i.i.i, %lpad.i.i.i
  %.pn.i.i.i = phi { i8*, i32 } [ %40, %lpad.i.i.i ], [ %41, %lpad4.i.i.i ], [ %41, %if.then.i.i131.i.i.i ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %18) #30
  br label %common.resume.i.i.i

lpad10.i.i.i:                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i
  %43 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup76.i.i.i

lpad14.i.i.i:                                     ; preds = %call3.i.i.i.noexc198.i.i.i, %.noexc197.i.i.i, %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i, %invoke.cont69.i.i.i, %invoke.cont63.i.i.i, %call5.i.i.i10.i.noexc113.i.i.i
  %44 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup74.i.i.i

invoke.cont63.i.i.i:                              ; preds = %call5.i.i.i10.i.noexc113.i.i.i
  invoke void @_ZN2cl4sycl6detail15checkValueRangeILi2ENS0_5rangeILi2EEEEENSt9enable_ifIXoosr3std7is_sameIT0_NS3_IXT_EEEEE5valuesr3std7is_sameIS6_NS0_2idIXT_EEEEE5valueEvE4typeERKS6_(%"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %tmpcast)
          to label %invoke.cont69.i.i.i unwind label %lpad14.i.i.i

invoke.cont69.i.i.i:                              ; preds = %invoke.cont63.i.i.i
  %NumWorkItems.sroa.0.0.this45.sroa_idx.i138.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 0, i32 0, i32 0, i64 0
  %45 = load <2 x i64>, <2 x i64>* %NumWorkItems.i.i.i, align 16
  %46 = bitcast i64* %NumWorkItems.sroa.0.0.this45.sroa_idx.i138.i.i.i to <2 x i64>*
  store <2 x i64> %45, <2 x i64>* %46, align 8, !tbaa !39
  %arrayidx.i25.i140.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 1, i32 0, i32 0, i64 0
  %arrayidx.i32.i141.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 2, i32 0, i32 0, i64 0
  %arrayidx.i39.i142.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 3, i32 0, i32 0, i64 0
  %arrayidx.i.i.i143.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 0, i32 0, i32 0, i64 2
  %47 = bitcast i64* %arrayidx.i25.i140.i.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %47, i8 0, i64 16, i1 false)
  %48 = bitcast i64* %arrayidx.i32.i141.i.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %48, i8 0, i64 16, i1 false)
  %49 = bitcast i64* %arrayidx.i39.i142.i.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %49, i8 0, i64 16, i1 false)
  store i64 1, i64* %arrayidx.i.i.i143.i.i.i, align 8, !tbaa !39
  %arrayidx.i19.i.i144.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 1, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i19.i.i144.i.i.i, align 8, !tbaa !39
  %arrayidx.i26.i.i145.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 2, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i26.i.i145.i.i.i, align 8, !tbaa !39
  %arrayidx.i33.i.i146.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 3, i32 0, i32 0, i64 2
  %50 = bitcast i64* %arrayidx.i33.i.i146.i.i.i to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %50, align 8, !tbaa !39
  %call.i.i.i195.i.i.i = invoke noalias noundef nonnull dereferenceable(40) i8* @_Znwm(i64 noundef 40) #32
          to label %call.i.i.i.noexc194.i.i.i unwind label %lpad14.i.i.i

call.i.i.i.noexc194.i.i.i:                        ; preds = %invoke.cont69.i.i.i
  %51 = bitcast i8* %call.i.i.i195.i.i.i to %"class.cl::sycl::detail::HostKernel"*
  %52 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %52, align 8, !tbaa !48
  %_M_manager.i.i.i20.i.i.i150.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1, i32 0, i32 1
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !83
  %_M_functor.i.i.i.i.i151.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1, i32 0, i32 0
  %call.i.i7778.i.i.i152.i.i.i = invoke noalias noundef nonnull dereferenceable(40) i8* @_Znwm(i64 noundef 40) #32
          to label %_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i unwind label %delete.notnull.i.i87.i.i.i186.i.i.i

_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i:    ; preds = %call.i.i.i.noexc194.i.i.i
  %agg.tmp3.i.sroa.0.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i = bitcast i8* %call.i.i7778.i.i.i152.i.i.i to i64*
  store i64 %6, i64* %agg.tmp3.i.sroa.0.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i, align 16
  %agg.tmp3.i.sroa.4.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i = getelementptr inbounds i8, i8* %call.i.i7778.i.i.i152.i.i.i, i64 8
  %agg.tmp3.i.sroa.4.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i = bitcast i8* %agg.tmp3.i.sroa.4.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i to float**
  store float* %8, float** %agg.tmp3.i.sroa.4.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i, align 8
  %agg.tmp3.i.sroa.5.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i = getelementptr inbounds i8, i8* %call.i.i7778.i.i.i152.i.i.i, i64 16
  %agg.tmp3.i.sroa.5.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i = bitcast i8* %agg.tmp3.i.sroa.5.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i to float**
  store float* %10, float** %agg.tmp3.i.sroa.5.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i, align 16
  %agg.tmp3.i.sroa.6.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i = getelementptr inbounds i8, i8* %call.i.i7778.i.i.i152.i.i.i, i64 24
  %agg.tmp3.i.sroa.6.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i = bitcast i8* %agg.tmp3.i.sroa.6.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i to i64*
  store i64 %4, i64* %agg.tmp3.i.sroa.6.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i, align 8
  %agg.tmp3.i.sroa.7.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i = getelementptr inbounds i8, i8* %call.i.i7778.i.i.i152.i.i.i, i64 32
  %agg.tmp3.i.sroa.7.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i = bitcast i8* %agg.tmp3.i.sroa.7.0.call.i.i7778.i.i.i152.i.i.sroa_idx.i to float**
  store float* %12, float** %agg.tmp3.i.sroa.7.0.call.i.i7778.i.i.i152.i.i.sroa_cast.i, align 16
  %53 = bitcast %"union.std::_Any_data"* %_M_functor.i.i.i.i.i151.i.i.i to i8**
  store i8* %call.i.i7778.i.i.i152.i.i.i, i8** %53, align 8, !tbaa !37
  %_M_invoker4.i.i.i.i.i154.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1, i32 1
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* @_ZNSt17_Function_handlerIFvRKN2cl4sycl7nd_itemILi2EEEEZNS1_7handler15ResetHostKernelIZZ4mainENKUlRS7_E_clES9_EUlNS1_2idILi2EEEE_NS1_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSE_IXT1_ELb1EEEEE5valueEPT_E4typeERKSJ_E20NormalizedKernelTypeE9_M_invokeERKSt9_Any_dataS5_, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker4.i.i.i.i.i154.i.i.i, align 8, !tbaa !143
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* @_ZNSt14_Function_base13_Base_managerIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS3_E_clES5_EUlNS2_2idILi2EEEE_NS2_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSA_IXT1_ELb1EEEEE5valueEPT_E4typeERKSF_E20NormalizedKernelTypeE10_M_managerERSt9_Any_dataRKSN_St18_Manager_operation, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !83
  %54 = getelementptr %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 0
  %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0
  %55 = load %"class.cl::sycl::detail::HostKernelBase"*, %"class.cl::sycl::detail::HostKernelBase"** %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i, align 8, !tbaa !37
  store %"class.cl::sycl::detail::HostKernelBase"* %54, %"class.cl::sycl::detail::HostKernelBase"** %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i, align 8, !tbaa !37
  %cmp.not.i.i.i.i156.i.i.i = icmp eq %"class.cl::sycl::detail::HostKernelBase"* %55, null
  br i1 %cmp.not.i.i.i.i156.i.i.i, label %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i, label %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i

_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i: ; preds = %_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i
  %MKernel69.i.i.i158.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1
  br label %if.then.i.i.i29.i.i.i168.i.i.i

_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i: ; preds = %_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i
  %56 = bitcast %"class.cl::sycl::detail::HostKernelBase"* %55 to void (%"class.cl::sycl::detail::HostKernelBase"*)***
  %vtable.i.i.i.i.i160.i.i.i = load void (%"class.cl::sycl::detail::HostKernelBase"*)**, void (%"class.cl::sycl::detail::HostKernelBase"*)*** %56, align 8, !tbaa !48
  %vfn.i.i.i.i.i161.i.i.i = getelementptr inbounds void (%"class.cl::sycl::detail::HostKernelBase"*)*, void (%"class.cl::sycl::detail::HostKernelBase"*)** %vtable.i.i.i.i.i160.i.i.i, i64 3
  %57 = load void (%"class.cl::sycl::detail::HostKernelBase"*)*, void (%"class.cl::sycl::detail::HostKernelBase"*)** %vfn.i.i.i.i.i161.i.i.i, align 8
  call void %57(%"class.cl::sycl::detail::HostKernelBase"* noundef nonnull align 8 dereferenceable(8) %55) #30
  %.pre.i.i.i162.i.i.i = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !83
  %MKernel.i.i.i163.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1
  %tobool.not.i.i.i27.i.i.i164.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %.pre.i.i.i162.i.i.i, null
  br i1 %tobool.not.i.i.i27.i.i.i164.i.i.i, label %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i, label %if.then.i.i.i29.i.i.i168.i.i.i

if.then.i.i.i29.i.i.i168.i.i.i:                   ; preds = %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i
  %MKernel71.i.i.i166.i.i.i = phi %"class.std::function.123"* [ %MKernel69.i.i.i158.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i ], [ %MKernel.i.i.i163.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i ]
  %58 = phi i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* [ @_ZNSt14_Function_base13_Base_managerIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS3_E_clES5_EUlNS2_2idILi2EEEE_NS2_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSA_IXT1_ELb1EEEEE5valueEPT_E4typeERKSF_E20NormalizedKernelTypeE10_M_managerERSt9_Any_dataRKSN_St18_Manager_operation, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i ], [ %.pre.i.i.i162.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i ]
  %59 = bitcast %"union.std::_Any_data"* %__typeinfo_result.i.i.i.i.i.i148.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %59) #30
  %call.i.i.i28.i.i.i167.i.i.i = invoke noundef i1 %58(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %__typeinfo_result.i.i.i.i.i.i148.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i.i.i151.i.i.i, i32 noundef 0)
          to label %invoke.cont.i.i.i.i.i.i169.i.i.i unwind label %terminate.lpad.i.i.i30.i.i.i170.i.i.i

invoke.cont.i.i.i.i.i.i169.i.i.i:                 ; preds = %if.then.i.i.i29.i.i.i168.i.i.i
  %60 = bitcast %"union.std::_Any_data"* %__typeinfo_result.i.i.i.i.i.i148.i.i.i to %"class.std::type_info"**
  %61 = load %"class.std::type_info"*, %"class.std::type_info"** %60, align 8, !tbaa !37
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %59) #30
  br label %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i

terminate.lpad.i.i.i30.i.i.i170.i.i.i:            ; preds = %if.then.i.i.i29.i.i.i168.i.i.i
  %62 = landingpad { i8*, i32 }
          catch i8* null
  %63 = extractvalue { i8*, i32 } %62, 0
  call void @__clang_call_terminate(i8* %63) #31
  unreachable

_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i: ; preds = %invoke.cont.i.i.i.i.i.i169.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i
  %MKernel72.i.i.i171.i.i.i = phi %"class.std::function.123"* [ %MKernel71.i.i.i166.i.i.i, %invoke.cont.i.i.i.i.i.i169.i.i.i ], [ %MKernel.i.i.i163.i.i.i, %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i ]
  %retval.0.i.i.i.i.i.i172.i.i.i = phi %"class.std::type_info"* [ %61, %invoke.cont.i.i.i.i.i.i169.i.i.i ], [ bitcast (i8** @_ZTIv to %"class.std::type_info"*), %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i ]
  %__name2.i.i.i.i.i.i173.i.i.i = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %retval.0.i.i.i.i.i.i172.i.i.i, i64 0, i32 1
  %64 = load i8*, i8** %__name2.i.i.i.i.i.i173.i.i.i, align 8, !tbaa !145
  %cmp.i.i.i.i.i.i174.i.i.i = icmp eq i8* %64, getelementptr inbounds ([202 x i8], [202 x i8]* @_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType, i64 0, i64 0)
  br i1 %cmp.i.i.i.i.i.i174.i.i.i, label %land.lhs.true.i.i.i.i.i180.i.i.i, label %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i

_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i:  ; preds = %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i
  %call.i7.i.i.i.i.i176.i.i.i = call i32 @strcmp(i8* noundef nonnull dereferenceable(202) getelementptr inbounds ([202 x i8], [202 x i8]* @_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType, i64 0, i64 0), i8* noundef nonnull dereferenceable(1) %64) #30
  %cmp7.i.i.i.i.i.i177.i.i.i = icmp eq i32 %call.i7.i.i.i.i.i176.i.i.i, 0
  br i1 %cmp7.i.i.i.i.i.i177.i.i.i, label %land.lhs.true.i.i.i.i.i180.i.i.i, label %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i

land.lhs.true.i.i.i.i.i180.i.i.i:                 ; preds = %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i, %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i
  %65 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !83
  %tobool.not.i.i31.i.i.i179.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %65, null
  br i1 %tobool.not.i.i31.i.i.i179.i.i.i, label %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i, label %if.then.i.i33.i.i.i183.i.i.i

if.then.i.i33.i.i.i183.i.i.i:                     ; preds = %land.lhs.true.i.i.i.i.i180.i.i.i
  %66 = bitcast %"union.std::_Any_data"* %__ptr.i.i.i.i.i149.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %66) #30
  %_M_functor.i.i32.i.i.i181.i.i.i = getelementptr inbounds %"class.std::function.123", %"class.std::function.123"* %MKernel72.i.i.i171.i.i.i, i64 0, i32 0, i32 0
  %call4.i.i.i.i.i182.i.i.i = invoke noundef i1 %65(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %__ptr.i.i.i.i.i149.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i32.i.i.i181.i.i.i, i32 noundef 1)
          to label %invoke.cont.i.i34.i.i.i184.i.i.i unwind label %terminate.lpad.i.i35.i.i.i185.i.i.i

invoke.cont.i.i34.i.i.i184.i.i.i:                 ; preds = %if.then.i.i33.i.i.i183.i.i.i
  %67 = bitcast %"union.std::_Any_data"* %__ptr.i.i.i.i.i149.i.i.i to i8**
  %68 = load i8*, i8** %67, align 8, !tbaa !37
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %66) #30
  br label %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i

terminate.lpad.i.i35.i.i.i185.i.i.i:              ; preds = %if.then.i.i33.i.i.i183.i.i.i
  %69 = landingpad { i8*, i32 }
          catch i8* null
  %70 = extractvalue { i8*, i32 } %69, 0
  call void @__clang_call_terminate(i8* %70) #31
  unreachable

delete.notnull.i.i87.i.i.i186.i.i.i:              ; preds = %call.i.i.i.noexc194.i.i.i
  %71 = landingpad { i8*, i32 }
          cleanup
  call void @_ZdlPv(i8* noundef nonnull %call.i.i.i195.i.i.i) #34
  br label %ehcleanup74.i.i.i

_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i: ; preds = %invoke.cont.i.i34.i.i.i184.i.i.i, %land.lhs.true.i.i.i.i.i180.i.i.i, %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i
  %72 = phi i8* [ %68, %invoke.cont.i.i34.i.i.i184.i.i.i ], [ null, %land.lhs.true.i.i.i.i.i180.i.i.i ], [ null, %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i ]
  %_M_start.i.i187.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 6, i32 0, i32 0, i32 0, i32 0
  %73 = load %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"** %_M_start.i.i187.i.i.i, align 8, !tbaa !147
  %_M_finish.i.i.i188.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 6, i32 0, i32 0, i32 0, i32 1
  %74 = load %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"** %_M_finish.i.i.i188.i.i.i, align 8, !tbaa !149
  %75 = icmp eq %"class.cl::sycl::detail::ArgDesc"* %74, %73
  br i1 %75, label %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i, label %invoke.cont.i.i.i189.i.i.i

invoke.cont.i.i.i189.i.i.i:                       ; preds = %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i
  store %"class.cl::sycl::detail::ArgDesc"* %73, %"class.cl::sycl::detail::ArgDesc"** %_M_finish.i.i.i188.i.i.i, align 8, !tbaa !149
  br label %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i

_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i: ; preds = %invoke.cont.i.i.i189.i.i.i, %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i
  invoke void @_ZN2cl4sycl7handler28extractArgsAndReqsFromLambdaEPcmPKNS0_6detail19kernel_param_desc_tEb(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, i8* noundef %72, i64 noundef 5, %"struct.cl::sycl::detail::kernel_param_desc_t"* noundef nonnull getelementptr inbounds ([12 x %"struct.cl::sycl::detail::kernel_param_desc_t"], [12 x %"struct.cl::sycl::detail::kernel_param_desc_t"]* @_ZN2cl4sycl6detailL17kernel_signaturesE, i64 0, i64 6), i1 noundef false)
          to label %.noexc197.i.i.i unwind label %lpad14.i.i.i

.noexc197.i.i.i:                                  ; preds = %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i
  %MKernelName.i190.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 10
  %_M_string_length.i.i.i.i191.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 10, i32 1
  %76 = load i64, i64* %_M_string_length.i.i.i.i191.i.i.i, align 8, !tbaa !150
  %call3.i.i.i199.i.i.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %MKernelName.i190.i.i.i, i64 noundef 0, i64 noundef %76, i8* noundef getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0), i64 noundef 62)
          to label %call3.i.i.i.noexc198.i.i.i unwind label %lpad14.i.i.i

call3.i.i.i.noexc198.i.i.i:                       ; preds = %.noexc197.i.i.i
  %call8.i200.i.i.i = invoke noundef i64 @_ZN2cl4sycl6detail6OSUtil17getOSModuleHandleEPKv(i8* noundef getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0))
          to label %if.end73.i.i.i unwind label %lpad14.i.i.i

if.end73.i.i.i:                                   ; preds = %call3.i.i.i.noexc198.i.i.i
  %MOSModuleHandle.i192.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 19
  store i64 %call8.i200.i.i.i, i64* %MOSModuleHandle.i192.i.i.i, align 8, !tbaa !151
  store i32 16777217, i32* %MCGType.i.i.i.i.i, align 8, !tbaa !111
  %77 = load i8*, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i204.i.i.i = icmp eq i8* %77, %34
  br i1 %cmp.i.i.i204.i.i.i, label %_ZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_.exit, label %if.then.i.i205.i.i.i

if.then.i.i205.i.i.i:                             ; preds = %if.end73.i.i.i
  call void @_ZdlPv(i8* noundef %77) #30
  br label %_ZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_.exit

ehcleanup74.i.i.i:                                ; preds = %delete.notnull.i.i87.i.i.i186.i.i.i, %lpad14.i.i.i
  %.pn93.i.i.i = phi { i8*, i32 } [ %44, %lpad14.i.i.i ], [ %71, %delete.notnull.i.i87.i.i.i186.i.i.i ]
  %78 = load i8*, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i210.i.i.i = icmp eq i8* %78, %34
  br i1 %cmp.i.i.i210.i.i.i, label %ehcleanup76.i.i.i, label %if.then.i.i211.i.i.i

if.then.i.i211.i.i.i:                             ; preds = %ehcleanup74.i.i.i
  call void @_ZdlPv(i8* noundef %78) #30
  br label %ehcleanup76.i.i.i

ehcleanup76.i.i.i:                                ; preds = %if.then.i.i211.i.i.i, %ehcleanup74.i.i.i, %lpad10.i.i.i
  %.pn93.pn.i.i.i = phi { i8*, i32 } [ %43, %lpad10.i.i.i ], [ %.pn93.i.i.i, %ehcleanup74.i.i.i ], [ %.pn93.i.i.i, %if.then.i.i211.i.i.i ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %31) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28) #30
  br label %common.resume.i.i.i

_ZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_.exit:    ; preds = %if.end73.i.i.i, %if.then.i.i205.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %31) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13)
  ret void
}

; Function Attrs: mustprogress uwtable
define internal noundef i1 @_ZNSt14_Function_base13_Base_managerIZ4mainEUlRN2cl4sycl7handlerEE_E10_M_managerERSt9_Any_dataRKS7_St18_Manager_operation(%"union.std::_Any_data"* nocapture noundef nonnull align 8 dereferenceable(16) %__dest, %"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__source, i32 noundef %__op) #20 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  switch i32 %__op, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  %0 = bitcast %"union.std::_Any_data"* %__dest to %"class.std::type_info"**
  store %"class.std::type_info"* bitcast ({ i8*, i8* }* @_ZTIZ4mainEUlRN2cl4sycl7handlerEE_ to %"class.std::type_info"*), %"class.std::type_info"** %0, align 8, !tbaa !37
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %1 = bitcast %"union.std::_Any_data"* %__source to %class.anon**
  %__source.val = load %class.anon*, %class.anon** %1, align 8, !tbaa !37
  %2 = bitcast %"union.std::_Any_data"* %__dest to %class.anon**
  store %class.anon* %__source.val, %class.anon** %2, align 8, !tbaa !37
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %3 = bitcast %"union.std::_Any_data"* %__source to i8**
  %__source.val12 = load i8*, i8** %3, align 8
  %call.i = tail call noalias noundef nonnull dereferenceable(48) i8* @_Znwm(i64 noundef 48) #32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(48) %call.i, i8* noundef nonnull align 8 dereferenceable(48) %__source.val12, i64 48, i1 false), !tbaa.struct !152
  %4 = bitcast %"union.std::_Any_data"* %__dest to i8**
  store i8* %call.i, i8** %4, align 8, !tbaa !37
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %5 = bitcast %"union.std::_Any_data"* %__dest to %class.anon**
  %__dest.val = load %class.anon*, %class.anon** %5, align 8, !tbaa !37
  %isnull.i = icmp eq %class.anon* %__dest.val, null
  br i1 %isnull.i, label %sw.epilog, label %delete.notnull.i

delete.notnull.i:                                 ; preds = %sw.bb5
  %6 = bitcast %class.anon* %__dest.val to i8*
  tail call void @_ZdlPv(i8* noundef %6) #34
  br label %sw.epilog

sw.epilog:                                        ; preds = %delete.notnull.i, %sw.bb5, %entry, %sw.bb4, %sw.bb1, %sw.bb
  ret i1 false
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znwm(i64 noundef) local_unnamed_addr #21

declare dso_local void @_ZN2cl4sycl7handler22verifyUsedKernelBundleERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl7handler24GetRangeRoundingSettingsERmS2_S2_(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560), i64* noundef nonnull align 8 dereferenceable(8), i64* noundef nonnull align 8 dereferenceable(8), i64* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef i1 @_ZN2cl4sycl7handler20DisableRangeRoundingEv(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560)) local_unnamed_addr #0

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail15checkValueRangeILi2ENS0_5rangeILi2EEEEENSt9enable_ifIXoosr3std7is_sameIT0_NS3_IXT_EEEEE5valuesr3std7is_sameIS6_NS0_2idIXT_EEEEE5valueEvE4typeERKS6_(%"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %V) local_unnamed_addr #20 comdat personality i32 (...)* @__gxx_personality_v0 {
entry:
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %V, i64 0, i32 0, i32 0, i64 0
  %0 = load i64, i64* %arrayidx.i, align 8, !tbaa !39
  %cmp.i = icmp ugt i64 %0, 2147483647
  br i1 %cmp.i, label %if.then.i, label %for.cond

for.cond:                                         ; preds = %entry
  %arrayidx.i.1 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %V, i64 0, i32 0, i32 0, i64 1
  %1 = load i64, i64* %arrayidx.i.1, align 8, !tbaa !39
  %cmp.i.1 = icmp ugt i64 %1, 2147483647
  br i1 %cmp.i.1, label %if.then.i, label %for.cond2

if.then.i:                                        ; preds = %for.cond, %entry
  %exception.i = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %2 = bitcast i8* %exception.i to %"class.cl::sycl::runtime_error"*
  invoke void @_ZN2cl4sycl13runtime_errorC2EPKci(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %2, i8* noundef getelementptr inbounds ([104 x i8], [104 x i8]* @.str.22, i64 0, i64 0), i32 noundef -30)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %if.then.i
  tail call void @__cxa_throw(i8* %exception.i, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

common.resume:                                    ; preds = %lpad.i31, %lpad.i
  %exception.i28.sink = phi i8* [ %exception.i28, %lpad.i31 ], [ %exception.i, %lpad.i ]
  %common.resume.op = phi { i8*, i32 } [ %5, %lpad.i31 ], [ %3, %lpad.i ]
  tail call void @__cxa_free_exception(i8* %exception.i28.sink) #30
  resume { i8*, i32 } %common.resume.op

lpad.i:                                           ; preds = %if.then.i
  %3 = landingpad { i8*, i32 }
          cleanup
  br label %common.resume

for.cond2:                                        ; preds = %for.cond
  %mul.1 = mul nuw nsw i64 %1, %0
  %cmp.i27.1 = icmp ugt i64 %mul.1, 2147483647
  br i1 %cmp.i27.1, label %if.then.i29, label %for.cond2.1

for.cond2.1:                                      ; preds = %for.cond2
  ret void

if.then.i29:                                      ; preds = %for.cond2
  %exception.i28 = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %4 = bitcast i8* %exception.i28 to %"class.cl::sycl::runtime_error"*
  invoke void @_ZN2cl4sycl13runtime_errorC2EPKci(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %4, i8* noundef getelementptr inbounds ([104 x i8], [104 x i8]* @.str.22, i64 0, i64 0), i32 noundef -30)
          to label %invoke.cont.i30 unwind label %lpad.i31

invoke.cont.i30:                                  ; preds = %if.then.i29
  tail call void @__cxa_throw(i8* %exception.i28, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl13runtime_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

lpad.i31:                                         ; preds = %if.then.i29
  %5 = landingpad { i8*, i32 }
          cleanup
  br label %common.resume
}

declare dso_local i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl13runtime_errorC2EPKci(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %this, i8* noundef %Msg, i32 noundef %Err) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !141
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !103
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !103
  store i8 %7, i8* %6, align 1, !tbaa !103
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !150
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #30
  %10 = bitcast %"class.std::shared_ptr.120"* %agg.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %10)
  %11 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0
  %call.i = call [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef 1) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %10, i8 0, i64 16, i1 false) #30
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %11, [2 x i64] %call.i, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i32 noundef %Err, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %invoke.cont
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %12 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %12, null
  br i1 %cmp.not.i.i.i, label %invoke.cont4, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %13 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %14 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %13, %if.then.i.i.i.i.i ], [ %14, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i10, label %invoke.cont4

if.then.i.i.i.i10:                                ; preds = %invoke.cont.i.i.i.i
  %15 = bitcast %"class.std::_Sp_counted_base"* %12 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %16 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %16(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i10
  %17 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i10
  %18 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %18, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %17, %if.then.i9.i.i.i.i ], [ %18, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %invoke.cont4

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %19 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %19(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  br label %invoke.cont4

lpad.i:                                           ; preds = %invoke.cont
  %20 = landingpad { i8*, i32 }
          cleanup
  %21 = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0
  call void @_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev(%"class.std::__shared_ptr.121"* noundef nonnull align 8 dereferenceable(16) %21) #30
  %22 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i14 = icmp eq i8* %22, %3
  br i1 %cmp.i.i.i14, label %ehcleanup, label %if.then.i.i15

invoke.cont4:                                     ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %invoke.cont.i
  %23 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl13runtime_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %23, align 8, !tbaa !48
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %10)
  %24 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i = icmp eq i8* %24, %3
  br i1 %cmp.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %invoke.cont4
  call void @_ZdlPv(i8* noundef %24) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %invoke.cont4, %if.then.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  ret void

if.then.i.i15:                                    ; preds = %lpad.i
  call void @_ZdlPv(i8* noundef %22) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %if.then.i.i15, %lpad.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  resume { i8*, i32 } %20
}

declare dso_local void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl9exceptionD2Ev(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i ], [ %3, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i ], [ %7, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  %_M_p.i.i.i.i = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i, align 8, !tbaa !142
  %10 = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 1, i32 2
  %arraydecay.i.i.i.i = bitcast %union.anon* %10 to i8*
  %cmp.i.i.i2 = icmp eq i8* %9, %arraydecay.i.i.i.i
  br i1 %cmp.i.i.i2, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i3

if.then.i.i3:                                     ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit
  tail call void @_ZdlPv(i8* noundef %9) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, %if.then.i.i3
  %11 = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* noundef nonnull align 8 dereferenceable(8) %11) #30
  ret void
}

declare dso_local void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

; Function Attrs: nounwind
declare dso_local [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef) local_unnamed_addr #1

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %this, [2 x i64] %ec.coerce, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %CLErr, %"class.std::shared_ptr.120"* noundef %Context) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp1.i = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp2.i = alloca %"class.std::__cxx11::basic_string", align 8
  %__dnew.i.i.i.i.i = alloca i64, align 8
  %agg.tmp2 = alloca %"class.std::shared_ptr.120", align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp3 = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp4 = alloca %"class.std::__cxx11::basic_string", align 8
  %_M_ptr.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2, i64 0, i32 0, i32 0
  %_M_ptr2.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %Context, i64 0, i32 0, i32 0
  %0 = load %"class.cl::sycl::context"*, %"class.cl::sycl::context"** %_M_ptr2.i.i, align 8, !tbaa !153
  store %"class.cl::sycl::context"* %0, %"class.cl::sycl::context"** %_M_ptr.i.i, align 8, !tbaa !153
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2, i64 0, i32 0, i32 1, i32 0
  %_M_pi2.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %Context, i64 0, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi2.i.i.i, align 8, !tbaa !44
  store %"class.std::_Sp_counted_base"* %1, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 1 acq_rel, align 4
  br label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %3, 1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit

_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit: ; preds = %entry, %if.then.i.i.i.i.i, %if.else.i.i.i.i.i
  %4 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #30
  %5 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #30
  tail call void @llvm.experimental.noalias.scope.decl(metadata !155)
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2
  %7 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp3 to %union.anon**
  store %union.anon* %6, %union.anon** %7, align 8, !tbaa !141, !alias.scope !155
  %_M_p.i12.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %Msg, i64 0, i32 0, i32 0
  %8 = load i8*, i8** %_M_p.i12.i.i, align 8, !tbaa !142, !noalias !155
  %_M_string_length.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %Msg, i64 0, i32 1
  %9 = load i64, i64* %_M_string_length.i.i.i, align 8, !tbaa !150, !noalias !155
  %10 = bitcast i64* %__dnew.i.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #30, !noalias !155
  store i64 %9, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !39, !noalias !155
  %cmp3.i.i.i.i.i = icmp ugt i64 %9, 15
  br i1 %cmp3.i.i.i.i.i, label %if.then4.i.i.i.i.i, label %if.end.if.end6_crit_edge.i.i.i.i.i

if.end.if.end6_crit_edge.i.i.i.i.i:               ; preds = %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit
  %11 = bitcast %union.anon* %6 to i8*
  br label %if.end6.i.i.i.i.i

if.then4.i.i.i.i.i:                               ; preds = %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit
  %call5.i.i.i14.i.i23 = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp3, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i.i, i64 noundef 0)
          to label %call5.i.i.i14.i.i.noexc unwind label %lpad

call5.i.i.i14.i.i.noexc:                          ; preds = %if.then4.i.i.i.i.i
  %_M_p.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i14.i.i23, i8** %_M_p.i.i.i.i.i.i, align 8, !tbaa !142, !alias.scope !155
  %12 = load i64, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !39, !noalias !155
  %_M_allocated_capacity.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2, i32 0
  store i64 %12, i64* %_M_allocated_capacity.i.i.i.i.i.i, align 8, !tbaa !103, !alias.scope !155
  br label %if.end6.i.i.i.i.i

if.end6.i.i.i.i.i:                                ; preds = %call5.i.i.i14.i.i.noexc, %if.end.if.end6_crit_edge.i.i.i.i.i
  %13 = phi i8* [ %11, %if.end.if.end6_crit_edge.i.i.i.i.i ], [ %call5.i.i.i14.i.i23, %call5.i.i.i14.i.i.noexc ]
  switch i64 %9, label %if.end.i.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i.i
    i64 0, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i
  ]

if.then.i.i.i.i.i.i.i:                            ; preds = %if.end6.i.i.i.i.i
  %14 = load i8, i8* %8, align 1, !tbaa !103
  store i8 %14, i8* %13, align 1, !tbaa !103
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i

if.end.i.i.i.i.i.i.i.i:                           ; preds = %if.end6.i.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %13, i8* align 1 %8, i64 %9, i1 false) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i: ; preds = %if.end.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i, %if.end6.i.i.i.i.i
  %_M_p.i13.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 0, i32 0
  %15 = load i64, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !39, !noalias !155
  %_M_string_length.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 1
  store i64 %15, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !150, !alias.scope !155
  %16 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !142, !alias.scope !155
  %arrayidx.i.i.i.i.i.i = getelementptr inbounds i8, i8* %16, i64 %15
  store i8 0, i8* %arrayidx.i.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #30, !noalias !155
  %17 = load i64, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !150, !alias.scope !155
  %cmp.i.i.i = icmp eq i64 %17, 4611686018427387903
  br i1 %cmp.i.i.i, label %if.then.i.i.i22, label %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc.exit.i.i

if.then.i.i.i22:                                  ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc.i unwind label %lpad.i

.noexc.i:                                         ; preds = %if.then.i.i.i22
  unreachable

_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc.exit.i.i: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i
  %call2.i2.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp3, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0), i64 noundef 1)
          to label %invoke.cont unwind label %lpad.i

lpad.i:                                           ; preds = %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc.exit.i.i, %if.then.i.i.i22
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !142, !alias.scope !155
  %arraydecay.i.i.i.i.i = bitcast %union.anon* %6 to i8*
  %cmp.i.i.i.i = icmp eq i8* %19, %arraydecay.i.i.i.i.i
  br i1 %cmp.i.i.i.i, label %ehcleanup13, label %if.then.i.i3.i

if.then.i.i3.i:                                   ; preds = %lpad.i
  call void @_ZdlPv(i8* noundef %19) #30
  br label %ehcleanup13

invoke.cont:                                      ; preds = %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc.exit.i.i
  %20 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %20) #30
  call void @llvm.experimental.noalias.scope.decl(metadata !158)
  %21 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %21) #30, !noalias !158
  %22 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp1.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %22) #30, !noalias !158
  %23 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %23) #30, !noalias !158
  invoke void (%"class.std::__cxx11::basic_string"*, i32 (i8*, i64, i8*, %"struct.std::__va_list"*)*, i64, i8*, ...) @_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_St9__va_listEmSB_z(%"class.std::__cxx11::basic_string"* nonnull sret(%"class.std::__cxx11::basic_string") align 8 %ref.tmp2.i, i32 (i8*, i64, i8*, %"struct.std::__va_list"*)* noundef nonnull @vsnprintf, i64 noundef 16, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i64 0, i64 0), i32 noundef %CLErr)
          to label %.noexc unwind label %lpad5

.noexc:                                           ; preds = %invoke.cont
  call void @llvm.experimental.noalias.scope.decl(metadata !161)
  %_M_string_length.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 1
  %24 = load i64, i64* %_M_string_length.i.i.i.i.i, align 8, !tbaa !150, !noalias !164
  %25 = and i64 %24, -2
  %cmp.i.i.i.i24 = icmp eq i64 %25, 4611686018427387902
  br i1 %cmp.i.i.i.i24, label %if.then.i.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i

if.then.i.i.i.i:                                  ; preds = %.noexc
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc.i25 unwind label %lpad.i29, !noalias !158

.noexc.i25:                                       ; preds = %if.then.i.i.i.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i: ; preds = %.noexc
  %call2.i.i16.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp2.i, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i64 0, i64 0), i64 noundef 2)
          to label %call2.i.i.noexc.i unwind label %lpad.i29, !noalias !158

call2.i.i.noexc.i:                                ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i
  %26 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 2
  %27 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp1.i to %union.anon**
  store %union.anon* %26, %union.anon** %27, align 8, !tbaa !141, !alias.scope !161, !noalias !158
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 0, i32 0
  %28 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142, !noalias !158
  %29 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 2
  %arraydecay.i.i.i.i.i26 = bitcast %union.anon* %29 to i8*
  %cmp.i.i1.i.i = icmp eq i8* %28, %arraydecay.i.i.i.i.i26
  br i1 %cmp.i.i1.i.i, label %if.then.i.i.i27, label %if.else.i.i.i

if.then.i.i.i27:                                  ; preds = %call2.i.i.noexc.i
  %arraydecay.i.i.i.i = bitcast %union.anon* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i.i, i8* noundef nonnull align 8 dereferenceable(16) %28, i64 16, i1 false) #30, !noalias !158
  br label %invoke.cont.i

if.else.i.i.i:                                    ; preds = %call2.i.i.noexc.i
  %_M_p.i29.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  store i8* %28, i8** %_M_p.i29.i.i.i, align 8, !tbaa !142, !alias.scope !161, !noalias !158
  %_M_allocated_capacity.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 2, i32 0
  %30 = load i64, i64* %_M_allocated_capacity.i.i.i, align 8, !tbaa !103, !noalias !158
  %_M_allocated_capacity.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 2, i32 0
  store i64 %30, i64* %_M_allocated_capacity.i.i.i.i, align 8, !tbaa !103, !alias.scope !161, !noalias !158
  br label %invoke.cont.i

invoke.cont.i:                                    ; preds = %if.else.i.i.i, %if.then.i.i.i27
  %_M_string_length.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 1
  %31 = load i64, i64* %_M_string_length.i.i.i.i, align 8, !tbaa !150, !noalias !158
  %_M_string_length.i30.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 1
  store i64 %31, i64* %_M_string_length.i30.i.i.i, align 8, !tbaa !150, !alias.scope !161, !noalias !158
  %32 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i16.i to %union.anon**
  store %union.anon* %29, %union.anon** %32, align 8, !tbaa !142, !noalias !158
  store i64 0, i64* %_M_string_length.i.i.i.i, align 8, !tbaa !150, !noalias !158
  store i8 0, i8* %arraydecay.i.i.i.i.i26, align 8, !tbaa !103, !noalias !158
  %call.i = invoke noundef i8* @_ZN2cl4sycl6detail18stringifyErrorCodeEi(i32 noundef %CLErr)
          to label %invoke.cont4.i unwind label %lpad3.i, !noalias !158

invoke.cont4.i:                                   ; preds = %invoke.cont.i
  call void @llvm.experimental.noalias.scope.decl(metadata !165)
  %call2.i.i.i17.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %call.i) #30, !noalias !168
  %33 = load i64, i64* %_M_string_length.i30.i.i.i, align 8, !tbaa !150, !noalias !168
  %sub3.i.i.i19.i = sub i64 4611686018427387903, %33
  %cmp.i.i.i20.i = icmp ult i64 %sub3.i.i.i19.i, %call2.i.i.i17.i
  br i1 %cmp.i.i.i20.i, label %if.then.i.i.i21.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i

if.then.i.i.i21.i:                                ; preds = %invoke.cont4.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc34.i unwind label %lpad3.i, !noalias !158

.noexc34.i:                                       ; preds = %if.then.i.i.i21.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i: ; preds = %invoke.cont4.i
  %call2.i.i36.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp1.i, i8* noundef %call.i, i64 noundef %call2.i.i.i17.i)
          to label %call2.i.i.noexc35.i unwind label %lpad3.i, !noalias !158

call2.i.i.noexc35.i:                              ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i
  %34 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 2
  %35 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i to %union.anon**
  store %union.anon* %34, %union.anon** %35, align 8, !tbaa !141, !alias.scope !165, !noalias !158
  %_M_p.i.i.i.i22.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 0, i32 0
  %36 = load i8*, i8** %_M_p.i.i.i.i22.i, align 8, !tbaa !142, !noalias !158
  %37 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 2
  %arraydecay.i.i.i.i23.i = bitcast %union.anon* %37 to i8*
  %cmp.i.i1.i24.i = icmp eq i8* %36, %arraydecay.i.i.i.i23.i
  br i1 %cmp.i.i1.i24.i, label %if.then.i.i27.i, label %if.else.i.i31.i

if.then.i.i27.i:                                  ; preds = %call2.i.i.noexc35.i
  %arraydecay.i.i.i26.i = bitcast %union.anon* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i26.i, i8* noundef nonnull align 8 dereferenceable(16) %36, i64 16, i1 false) #30, !noalias !158
  br label %invoke.cont5.i

if.else.i.i31.i:                                  ; preds = %call2.i.i.noexc35.i
  %_M_p.i29.i.i28.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 0, i32 0
  store i8* %36, i8** %_M_p.i29.i.i28.i, align 8, !tbaa !142, !alias.scope !165, !noalias !158
  %_M_allocated_capacity.i.i29.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 2, i32 0
  %38 = load i64, i64* %_M_allocated_capacity.i.i29.i, align 8, !tbaa !103, !noalias !158
  %_M_allocated_capacity.i.i.i30.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 2, i32 0
  store i64 %38, i64* %_M_allocated_capacity.i.i.i30.i, align 8, !tbaa !103, !alias.scope !165, !noalias !158
  br label %invoke.cont5.i

invoke.cont5.i:                                   ; preds = %if.else.i.i31.i, %if.then.i.i27.i
  %_M_string_length.i.i.i32.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 1
  %39 = load i64, i64* %_M_string_length.i.i.i32.i, align 8, !tbaa !150, !noalias !158
  %_M_string_length.i30.i.i33.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 1
  store i64 %39, i64* %_M_string_length.i30.i.i33.i, align 8, !tbaa !150, !alias.scope !165, !noalias !158
  %40 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i36.i to %union.anon**
  store %union.anon* %37, %union.anon** %40, align 8, !tbaa !142, !noalias !158
  store i64 0, i64* %_M_string_length.i.i.i32.i, align 8, !tbaa !150, !noalias !158
  store i8 0, i8* %arraydecay.i.i.i.i23.i, align 8, !tbaa !103, !noalias !158
  call void @llvm.experimental.noalias.scope.decl(metadata !169)
  %41 = load i64, i64* %_M_string_length.i30.i.i33.i, align 8, !tbaa !150, !noalias !172
  %cmp.i.i.i41.i = icmp eq i64 %41, 4611686018427387903
  br i1 %cmp.i.i.i41.i, label %if.then.i.i.i42.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i

if.then.i.i.i42.i:                                ; preds = %invoke.cont5.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc55.i unwind label %lpad6.i, !noalias !158

.noexc55.i:                                       ; preds = %if.then.i.i.i42.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i: ; preds = %invoke.cont5.i
  %call2.i.i57.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0), i64 noundef 1)
          to label %call2.i.i.noexc56.i unwind label %lpad6.i, !noalias !158

call2.i.i.noexc56.i:                              ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i
  %42 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2
  %43 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp4 to %union.anon**
  store %union.anon* %42, %union.anon** %43, align 8, !tbaa !141, !alias.scope !172
  %_M_p.i.i.i.i43.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 0, i32 0
  %44 = load i8*, i8** %_M_p.i.i.i.i43.i, align 8, !tbaa !142
  %45 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 2
  %arraydecay.i.i.i.i44.i = bitcast %union.anon* %45 to i8*
  %cmp.i.i1.i45.i = icmp eq i8* %44, %arraydecay.i.i.i.i44.i
  br i1 %cmp.i.i1.i45.i, label %if.then.i.i48.i, label %if.else.i.i52.i

if.then.i.i48.i:                                  ; preds = %call2.i.i.noexc56.i
  %arraydecay.i.i.i47.i = bitcast %union.anon* %42 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i47.i, i8* noundef nonnull align 8 dereferenceable(16) %44, i64 16, i1 false) #30
  br label %invoke.cont7.i

if.else.i.i52.i:                                  ; preds = %call2.i.i.noexc56.i
  %_M_p.i29.i.i49.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 0, i32 0
  store i8* %44, i8** %_M_p.i29.i.i49.i, align 8, !tbaa !142, !alias.scope !172
  %_M_allocated_capacity.i.i50.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 2, i32 0
  %46 = load i64, i64* %_M_allocated_capacity.i.i50.i, align 8, !tbaa !103
  %_M_allocated_capacity.i.i.i51.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2, i32 0
  store i64 %46, i64* %_M_allocated_capacity.i.i.i51.i, align 8, !tbaa !103, !alias.scope !172
  br label %invoke.cont7.i

invoke.cont7.i:                                   ; preds = %if.else.i.i52.i, %if.then.i.i48.i
  %_M_string_length.i.i.i53.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 1
  %47 = load i64, i64* %_M_string_length.i.i.i53.i, align 8, !tbaa !150
  %_M_string_length.i30.i.i54.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 1
  store i64 %47, i64* %_M_string_length.i30.i.i54.i, align 8, !tbaa !150, !alias.scope !172
  %48 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i57.i to %union.anon**
  store %union.anon* %45, %union.anon** %48, align 8, !tbaa !142
  store i64 0, i64* %_M_string_length.i.i.i53.i, align 8, !tbaa !150
  store i8 0, i8* %arraydecay.i.i.i.i44.i, align 8, !tbaa !103
  %_M_p.i.i.i.i59.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 0, i32 0
  %49 = load i8*, i8** %_M_p.i.i.i.i59.i, align 8, !tbaa !142, !noalias !158
  %arraydecay.i.i.i.i60.i = bitcast %union.anon* %34 to i8*
  %cmp.i.i.i61.i = icmp eq i8* %49, %arraydecay.i.i.i.i60.i
  br i1 %cmp.i.i.i61.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28, label %if.then.i.i62.i

if.then.i.i62.i:                                  ; preds = %invoke.cont7.i
  call void @_ZdlPv(i8* noundef %49) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28: ; preds = %if.then.i.i62.i, %invoke.cont7.i
  %_M_p.i.i.i.i63.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  %50 = load i8*, i8** %_M_p.i.i.i.i63.i, align 8, !tbaa !142, !noalias !158
  %arraydecay.i.i.i.i64.i = bitcast %union.anon* %26 to i8*
  %cmp.i.i.i65.i = icmp eq i8* %50, %arraydecay.i.i.i.i64.i
  br i1 %cmp.i.i.i65.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i, label %if.then.i.i66.i

if.then.i.i66.i:                                  ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28
  call void @_ZdlPv(i8* noundef %50) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i: ; preds = %if.then.i.i66.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28
  %_M_p.i.i.i.i68.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i.i68.i, align 8, !tbaa !142, !noalias !158
  %52 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 2
  %arraydecay.i.i.i.i69.i = bitcast %union.anon* %52 to i8*
  %cmp.i.i.i70.i = icmp eq i8* %51, %arraydecay.i.i.i.i69.i
  br i1 %cmp.i.i.i70.i, label %invoke.cont6, label %if.then.i.i71.i

if.then.i.i71.i:                                  ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i
  call void @_ZdlPv(i8* noundef %51) #30
  br label %invoke.cont6

lpad.i29:                                         ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i, %if.then.i.i.i.i
  %53 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup8.i

lpad3.i:                                          ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i, %if.then.i.i.i21.i, %invoke.cont.i
  %54 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup.i

lpad6.i:                                          ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i, %if.then.i.i.i42.i
  %55 = landingpad { i8*, i32 }
          cleanup
  %_M_p.i.i.i.i73.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 0, i32 0
  %56 = load i8*, i8** %_M_p.i.i.i.i73.i, align 8, !tbaa !142, !noalias !158
  %arraydecay.i.i.i.i74.i = bitcast %union.anon* %34 to i8*
  %cmp.i.i.i75.i = icmp eq i8* %56, %arraydecay.i.i.i.i74.i
  br i1 %cmp.i.i.i75.i, label %ehcleanup.i, label %if.then.i.i76.i

if.then.i.i76.i:                                  ; preds = %lpad6.i
  call void @_ZdlPv(i8* noundef %56) #30, !noalias !158
  br label %ehcleanup.i

ehcleanup.i:                                      ; preds = %if.then.i.i76.i, %lpad6.i, %lpad3.i
  %.pn.i = phi { i8*, i32 } [ %54, %lpad3.i ], [ %55, %lpad6.i ], [ %55, %if.then.i.i76.i ]
  %_M_p.i.i.i.i78.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  %57 = load i8*, i8** %_M_p.i.i.i.i78.i, align 8, !tbaa !142, !noalias !158
  %arraydecay.i.i.i.i79.i = bitcast %union.anon* %26 to i8*
  %cmp.i.i.i80.i = icmp eq i8* %57, %arraydecay.i.i.i.i79.i
  br i1 %cmp.i.i.i80.i, label %ehcleanup8.i, label %if.then.i.i81.i

if.then.i.i81.i:                                  ; preds = %ehcleanup.i
  call void @_ZdlPv(i8* noundef %57) #30, !noalias !158
  br label %ehcleanup8.i

ehcleanup8.i:                                     ; preds = %if.then.i.i81.i, %ehcleanup.i, %lpad.i29
  %.pn.pn.i = phi { i8*, i32 } [ %53, %lpad.i29 ], [ %.pn.i, %ehcleanup.i ], [ %.pn.i, %if.then.i.i81.i ]
  %_M_p.i.i.i.i83.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 0, i32 0
  %58 = load i8*, i8** %_M_p.i.i.i.i83.i, align 8, !tbaa !142, !noalias !158
  %59 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 2
  %arraydecay.i.i.i.i84.i = bitcast %union.anon* %59 to i8*
  %cmp.i.i.i85.i = icmp eq i8* %58, %arraydecay.i.i.i.i84.i
  br i1 %cmp.i.i.i85.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i, label %if.then.i.i86.i

if.then.i.i86.i:                                  ; preds = %ehcleanup8.i
  call void @_ZdlPv(i8* noundef %58) #30, !noalias !158
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i: ; preds = %if.then.i.i86.i, %ehcleanup8.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %23) #30, !noalias !158
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %22) #30, !noalias !158
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %21) #30, !noalias !158
  br label %ehcleanup11

invoke.cont6:                                     ; preds = %if.then.i.i71.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %23) #30, !noalias !158
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %22) #30, !noalias !158
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %21) #30, !noalias !158
  call void @llvm.experimental.noalias.scope.decl(metadata !173)
  %60 = load i64, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !150, !noalias !173
  %61 = load i64, i64* %_M_string_length.i30.i.i54.i, align 8, !tbaa !150, !noalias !173
  %add.i = add i64 %61, %60
  %62 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !142, !noalias !173
  %arraydecay.i.i.i.i31 = bitcast %union.anon* %6 to i8*
  %cmp.i.i.i32 = icmp eq i8* %62, %arraydecay.i.i.i.i31
  %_M_allocated_capacity.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2, i32 0
  %63 = load i64, i64* %_M_allocated_capacity.i.i, align 8, !noalias !173
  %cond.i.i = select i1 %cmp.i.i.i32, i64 15, i64 %63
  %cmp.i = icmp ugt i64 %add.i, %cond.i.i
  %_M_p.i.i.i16.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 0, i32 0
  %64 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !142, !noalias !173
  br i1 %cmp.i, label %land.rhs.i, label %cond.false.i

land.rhs.i:                                       ; preds = %invoke.cont6
  %arraydecay.i.i.i17.i = bitcast %union.anon* %42 to i8*
  %cmp.i.i18.i = icmp eq i8* %64, %arraydecay.i.i.i17.i
  %_M_allocated_capacity.i19.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2, i32 0
  %65 = load i64, i64* %_M_allocated_capacity.i19.i, align 8, !noalias !173
  %cond.i20.i = select i1 %cmp.i.i18.i, i64 15, i64 %65
  %cmp4.not.i = icmp ugt i64 %add.i, %cond.i20.i
  br i1 %cmp4.not.i, label %cond.false.i, label %cond.true.i

cond.true.i:                                      ; preds = %land.rhs.i
  %call3.i.i.i34 = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp4, i64 noundef 0, i64 noundef 0, i8* noundef %62, i64 noundef %60)
          to label %cond.end.i unwind label %lpad7

cond.false.i:                                     ; preds = %land.rhs.i, %invoke.cont6
  %call3.i.i35 = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp3, i8* noundef %64, i64 noundef %61)
          to label %cond.end.i unwind label %lpad7

cond.end.i:                                       ; preds = %cond.false.i, %cond.true.i
  %cond-lvalue.i = phi %"class.std::__cxx11::basic_string"* [ %call3.i.i.i34, %cond.true.i ], [ %call3.i.i35, %cond.false.i ]
  %66 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %67 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %66, %union.anon** %67, align 8, !tbaa !141, !alias.scope !173
  %_M_p.i.i.i23.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 0, i32 0
  %68 = load i8*, i8** %_M_p.i.i.i23.i, align 8, !tbaa !142
  %69 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 2
  %arraydecay.i.i.i24.i = bitcast %union.anon* %69 to i8*
  %cmp.i.i25.i = icmp eq i8* %68, %arraydecay.i.i.i24.i
  br i1 %cmp.i.i25.i, label %if.then.i.i, label %if.else.i.i

if.then.i.i:                                      ; preds = %cond.end.i
  %arraydecay.i.i.i = bitcast %union.anon* %66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i, i8* noundef nonnull align 8 dereferenceable(16) %68, i64 16, i1 false) #30
  br label %invoke.cont8

if.else.i.i:                                      ; preds = %cond.end.i
  %_M_p.i29.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %68, i8** %_M_p.i29.i.i, align 8, !tbaa !142, !alias.scope !173
  %_M_allocated_capacity.i26.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 2, i32 0
  %70 = load i64, i64* %_M_allocated_capacity.i26.i, align 8, !tbaa !103
  %_M_allocated_capacity.i.i.i33 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %70, i64* %_M_allocated_capacity.i.i.i33, align 8, !tbaa !103, !alias.scope !173
  br label %invoke.cont8

invoke.cont8:                                     ; preds = %if.else.i.i, %if.then.i.i
  %_M_string_length.i.i27.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 1
  %71 = load i64, i64* %_M_string_length.i.i27.i, align 8, !tbaa !150
  %_M_string_length.i30.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %71, i64* %_M_string_length.i30.i.i, align 8, !tbaa !150, !alias.scope !173
  %72 = bitcast %"class.std::__cxx11::basic_string"* %cond-lvalue.i to %union.anon**
  store %union.anon* %69, %union.anon** %72, align 8, !tbaa !142
  store i64 0, i64* %_M_string_length.i.i27.i, align 8, !tbaa !150
  store i8 0, i8* %arraydecay.i.i.i24.i, align 8, !tbaa !103
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeSt10shared_ptrINS0_7contextEERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %this, [2 x i64] %ec.coerce, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp)
          to label %invoke.cont10 unwind label %lpad9

invoke.cont10:                                    ; preds = %invoke.cont8
  %_M_p.i.i.i.i36 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %73 = load i8*, i8** %_M_p.i.i.i.i36, align 8, !tbaa !142
  %arraydecay.i.i.i.i37 = bitcast %union.anon* %66 to i8*
  %cmp.i.i.i38 = icmp eq i8* %73, %arraydecay.i.i.i.i37
  br i1 %cmp.i.i.i38, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i39

if.then.i.i39:                                    ; preds = %invoke.cont10
  call void @_ZdlPv(i8* noundef %73) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %invoke.cont10, %if.then.i.i39
  %74 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !142
  %arraydecay.i.i.i.i42 = bitcast %union.anon* %42 to i8*
  %cmp.i.i.i43 = icmp eq i8* %74, %arraydecay.i.i.i.i42
  br i1 %cmp.i.i.i43, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, label %if.then.i.i44

if.then.i.i44:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  call void @_ZdlPv(i8* noundef %74) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %if.then.i.i44
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %20) #30
  %75 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i49 = icmp eq i8* %75, %arraydecay.i.i.i.i31
  br i1 %cmp.i.i.i49, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52, label %if.then.i.i50

if.then.i.i50:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46
  call void @_ZdlPv(i8* noundef %75) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, %if.then.i.i50
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #30
  %76 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %76, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i53

if.then.i.i53:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %76, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i54, label %if.else.i.i.i.i

if.then.i.i.i.i54:                                ; preds = %if.then.i.i53
  %77 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i53
  %78 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %78, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i54
  %retval.0.i.i.i.i = phi i32 [ %77, %if.then.i.i.i.i54 ], [ %78, %if.else.i.i.i.i ]
  %cmp.i.i.i55 = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i55, label %if.then.i.i.i56, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i56:                                  ; preds = %invoke.cont.i.i.i
  %79 = bitcast %"class.std::_Sp_counted_base"* %76 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %79, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %80 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %80(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %76) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %76, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i56
  %81 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i56
  %82 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %82, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %81, %if.then.i9.i.i.i ], [ %82, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %79, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %83 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %83(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %76) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  %MCLErr = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 2
  store i32 %CLErr, i32* %MCLErr, align 8, !tbaa !176
  ret void

lpad:                                             ; preds = %if.then4.i.i.i.i.i
  %84 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup13

lpad5:                                            ; preds = %invoke.cont
  %85 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup11

lpad7:                                            ; preds = %cond.false.i, %cond.true.i
  %86 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad9:                                            ; preds = %invoke.cont8
  %87 = landingpad { i8*, i32 }
          cleanup
  %_M_p.i.i.i.i57 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %88 = load i8*, i8** %_M_p.i.i.i.i57, align 8, !tbaa !142
  %arraydecay.i.i.i.i58 = bitcast %union.anon* %66 to i8*
  %cmp.i.i.i59 = icmp eq i8* %88, %arraydecay.i.i.i.i58
  br i1 %cmp.i.i.i59, label %ehcleanup, label %if.then.i.i60

if.then.i.i60:                                    ; preds = %lpad9
  call void @_ZdlPv(i8* noundef %88) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %if.then.i.i60, %lpad9, %lpad7
  %.pn = phi { i8*, i32 } [ %86, %lpad7 ], [ %87, %lpad9 ], [ %87, %if.then.i.i60 ]
  %89 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !142
  %arraydecay.i.i.i.i64 = bitcast %union.anon* %42 to i8*
  %cmp.i.i.i65 = icmp eq i8* %89, %arraydecay.i.i.i.i64
  br i1 %cmp.i.i.i65, label %ehcleanup11, label %if.then.i.i66

if.then.i.i66:                                    ; preds = %ehcleanup
  call void @_ZdlPv(i8* noundef %89) #30
  br label %ehcleanup11

ehcleanup11:                                      ; preds = %if.then.i.i66, %ehcleanup, %lpad5, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i
  %.pn.pn = phi { i8*, i32 } [ %85, %lpad5 ], [ %.pn.pn.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i ], [ %.pn, %ehcleanup ], [ %.pn, %if.then.i.i66 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %20) #30
  %90 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !142
  %arraydecay.i.i.i.i70 = bitcast %union.anon* %6 to i8*
  %cmp.i.i.i71 = icmp eq i8* %90, %arraydecay.i.i.i.i70
  br i1 %cmp.i.i.i71, label %ehcleanup13, label %if.then.i.i72

if.then.i.i72:                                    ; preds = %ehcleanup11
  call void @_ZdlPv(i8* noundef %90) #30
  br label %ehcleanup13

ehcleanup13:                                      ; preds = %if.then.i.i72, %ehcleanup11, %lpad, %if.then.i.i3.i, %lpad.i
  %.pn.pn.pn = phi { i8*, i32 } [ %84, %lpad ], [ %18, %if.then.i.i3.i ], [ %18, %lpad.i ], [ %.pn.pn, %ehcleanup11 ], [ %.pn.pn, %if.then.i.i72 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #30
  %91 = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2, i64 0, i32 0
  call void @_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev(%"class.std::__shared_ptr.121"* noundef nonnull align 8 dereferenceable(16) %91) #30
  resume { i8*, i32 } %.pn.pn.pn
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev(%"class.std::__shared_ptr.121"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #22 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %_M_pi.i = getelementptr inbounds %"class.std::__shared_ptr.121", %"class.std::__shared_ptr.121"* %this, i64 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i, align 8, !tbaa !44
  %cmp.not.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %_M_use_count.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i
  %2 = load i32, i32* %_M_use_count.i.i, align 8, !tbaa !46
  %add.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i, i32* %_M_use_count.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %1, %if.then.i.i.i ], [ %2, %if.else.i.i.i ]
  %cmp.i.i = icmp eq i32 %retval.0.i.i.i, 1
  br i1 %cmp.i.i, label %if.then.i.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i:                                      ; preds = %invoke.cont.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i, label %if.else.i11.i.i

if.then.i9.i.i:                                   ; preds = %if.then.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i

if.else.i11.i.i:                                  ; preds = %if.then.i.i
  %6 = load i32, i32* %_M_weak_count.i.i, align 4, !tbaa !46
  %add.i.i10.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i, i32* %_M_weak_count.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i

invoke.cont2.i.i:                                 ; preds = %if.else.i11.i.i, %if.then.i9.i.i
  %retval.0.i12.i.i = phi i32 [ %5, %if.then.i9.i.i ], [ %6, %if.else.i11.i.i ]
  %cmp4.i.i = icmp eq i32 %retval.0.i12.i.i, 1
  br i1 %cmp4.i.i, label %if.then5.i.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i:                                     ; preds = %invoke.cont2.i.i
  %vtable6.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !48
  %vfn7.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry, %invoke.cont.i.i, %invoke.cont2.i.i, %if.then5.i.i
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl13runtime_errorD0Ev(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %10 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 1, i32 2
  %arraydecay.i.i.i.i.i = bitcast %union.anon* %10 to i8*
  %cmp.i.i.i2.i = icmp eq i8* %9, %arraydecay.i.i.i.i.i
  br i1 %cmp.i.i.i2.i, label %_ZN2cl4sycl9exceptionD2Ev.exit, label %if.then.i.i3.i

if.then.i.i3.i:                                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i
  tail call void @_ZdlPv(i8* noundef %9) #30
  br label %_ZN2cl4sycl9exceptionD2Ev.exit

_ZN2cl4sycl9exceptionD2Ev.exit:                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, %if.then.i.i3.i
  %11 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* noundef nonnull align 8 dereferenceable(8) %11) #30
  %12 = bitcast %"class.cl::sycl::runtime_error"* %this to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %12) #34
  ret void
}

; Function Attrs: nounwind
declare dso_local noundef i8* @_ZNK2cl4sycl9exception4whatEv(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

declare dso_local void @_ZN2cl4sycl9exceptionC2ESt10error_codeSt10shared_ptrINS0_7contextEERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64), [2 x i64], %"class.std::shared_ptr.120"* noundef, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32)) unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i64 noundef, i64 noundef, i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i8* noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt19__throw_logic_errorPKc(i8* noundef) local_unnamed_addr #19

declare dso_local noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i64* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_length_errorPKc(i8* noundef) local_unnamed_addr #19

declare dso_local noundef i8* @_ZN2cl4sycl6detail18stringifyErrorCodeEi(i32 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_St9__va_listEmSB_z(%"class.std::__cxx11::basic_string"* noalias sret(%"class.std::__cxx11::basic_string") align 8 %agg.result, i32 (i8*, i64, i8*, %"struct.std::__va_list"*)* noundef %__convf, i64 noundef %__n, i8* noundef %__fmt, ...) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__dnew.i.i.i.i = alloca i64, align 8
  %__args = alloca %"struct.std::__va_list", align 8
  %agg.tmp = alloca %"struct.std::__va_list", align 8
  %0 = alloca i8, i64 %__n, align 16
  %1 = bitcast %"struct.std::__va_list"* %__args to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #30
  call void @llvm.va_start(i8* nonnull %1)
  %2 = bitcast %"struct.std::__va_list"* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %2, i8* noundef nonnull align 8 dereferenceable(32) %1, i64 32, i1 false), !tbaa.struct !179
  %call = call noundef i32 %__convf(i8* noundef nonnull %0, i64 noundef %__n, i8* noundef %__fmt, %"struct.std::__va_list"* noundef nonnull %agg.tmp)
  call void @llvm.va_end(i8* nonnull %1)
  %idx.ext = sext i32 %call to i64
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %4 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %3, %union.anon** %4, align 8, !tbaa !141
  %5 = bitcast %union.anon* %3 to i8*
  %6 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #30
  store i64 %idx.ext, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %cmp3.i.i.i.i = icmp ugt i32 %call, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %entry
  %call5.i.i.i3.i11 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %agg.result, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i3.i11, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %7 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 0
  store i64 %7, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !103
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %entry
  %8 = phi i8* [ %call5.i.i.i3.i11, %if.then4.i.i.i.i ], [ %5, %entry ]
  switch i64 %idx.ext, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %9 = load i8, i8* %0, align 16, !tbaa !103
  store i8 %9, i8* %8, align 1, !tbaa !103
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* nonnull align 16 %0, i64 %idx.ext, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  %10 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 %10, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !150
  %11 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %11, i64 %10
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #30
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @vsnprintf(i8* nocapture noundef, i64 noundef, i8* nocapture noundef readonly, %"struct.std::__va_list"* noundef) #23

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #24

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #24

; Function Attrs: nounwind
declare dso_local void @_ZNSt9exceptionD2Ev(%"class.std::exception"* noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl23invalid_parameter_errorC2EPKci(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this, i8* noundef %Msg, i32 noundef %Err) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !141
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !103
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !103
  store i8 %7, i8* %6, align 1, !tbaa !103
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !150
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #30
  invoke void @_ZN2cl4sycl23invalid_parameter_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i32 noundef %Err)
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont
  %10 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i = icmp eq i8* %10, %3
  br i1 %cmp.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %invoke.cont4
  call void @_ZdlPv(i8* noundef %10) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %invoke.cont4, %if.then.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  ret void

lpad3:                                            ; preds = %invoke.cont
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i12 = icmp eq i8* %12, %3
  br i1 %cmp.i.i.i12, label %ehcleanup, label %if.then.i.i13

if.then.i.i13:                                    ; preds = %lpad3
  call void @_ZdlPv(i8* noundef %12) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %if.then.i.i13, %lpad3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  resume { i8*, i32 } %11
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl23invalid_parameter_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err) unnamed_addr #12 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %call = tail call [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef 6) #30
  %0 = bitcast %"class.std::shared_ptr.120"* %agg.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0)
  %1 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false) #30
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %call, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %entry
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

lpad.i:                                           ; preds = %entry
  %10 = landingpad { i8*, i32 }
          cleanup
  %_M_pi.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %lpad.i
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i2, label %if.else.i.i.i.i

if.then.i.i.i.i2:                                 ; preds = %if.then.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i2
  %retval.0.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i2 ], [ %13, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i3, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i3:                                   ; preds = %invoke.cont.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i3
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i3
  %17 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i ], [ %17, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %lpad.i, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  resume { i8*, i32 } %10

_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit: ; preds = %invoke.cont.i, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  %19 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0)
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl23invalid_parameter_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %19, align 8, !tbaa !48
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl23invalid_parameter_errorD0Ev(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %10 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 2
  %arraydecay.i.i.i.i.i = bitcast %union.anon* %10 to i8*
  %cmp.i.i.i2.i = icmp eq i8* %9, %arraydecay.i.i.i.i.i
  br i1 %cmp.i.i.i2.i, label %_ZN2cl4sycl9exceptionD2Ev.exit, label %if.then.i.i3.i

if.then.i.i3.i:                                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i
  tail call void @_ZdlPv(i8* noundef %9) #30
  br label %_ZN2cl4sycl9exceptionD2Ev.exit

_ZN2cl4sycl9exceptionD2Ev.exit:                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, %if.then.i.i3.i
  %11 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* noundef nonnull align 8 dereferenceable(8) %11) #30
  %12 = bitcast %"class.cl::sycl::invalid_parameter_error"* %this to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %12) #34
  ret void
}

declare dso_local void @_ZN2cl4sycl7handler28extractArgsAndReqsFromLambdaEPcmPKNS0_6detail19kernel_param_desc_tEb(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560), i8* noundef, i64 noundef, %"struct.cl::sycl::detail::kernel_param_desc_t"* noundef, i1 noundef) local_unnamed_addr #0

declare dso_local noundef i64 @_ZN2cl4sycl6detail6OSUtil17getOSModuleHandleEPKv(i8* noundef) local_unnamed_addr #0

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #25

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE4callERKNS1_8NDRDescTEPNS1_17HostProfilingInfoE(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this, %"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %NDRDesc, %"class.cl::sycl::detail::HostProfilingInfo"* noundef %HPI) unnamed_addr #12 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %AdjustedRange = alloca %"class.cl::sycl::detail::NDRDescT", align 8
  %agg.tmp = alloca %"class.cl::sycl::nd_range", align 8
  %0 = bitcast %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* nonnull %0) #30
  %1 = bitcast %"class.cl::sycl::detail::NDRDescT"* %NDRDesc to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(104) %0, i8* noundef nonnull align 8 dereferenceable(104) %1, i64 104, i1 false)
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 0
  %2 = load i64, i64* %arrayidx.i, align 8, !tbaa !39
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %arrayidx.i31 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 3, i32 0, i32 0, i64 0
  %3 = load i64, i64* %arrayidx.i31, align 8, !tbaa !39
  %cmp3.not = icmp eq i64 %3, 0
  br i1 %cmp3.not, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %Dims = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 4
  %4 = load i64, i64* %Dims, align 8, !tbaa !180
  %conv = trunc i64 %4 to i32
  %arrayidx.1.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 3, i32 0, i32 0, i64 1
  %agg.tmp4.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %3, i64* %agg.tmp4.sroa.0.0..sroa_idx, align 8
  %agg.tmp4.sroa.2.0..sroa_idx38 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 0, i32 0, i32 0, i64 1
  %5 = bitcast i64* %arrayidx.1.i to <2 x i64>*
  %6 = load <2 x i64>, <2 x i64>* %5, align 8, !tbaa !39, !noalias !181
  %7 = bitcast i64* %agg.tmp4.sroa.2.0..sroa_idx38 to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %7, align 8
  %agg.tmp6.sroa.0.sroa.0.0.agg.tmp6.sroa.0.0..sroa_cast36.sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 1, i32 0, i32 0, i64 0
  %8 = bitcast i64* %agg.tmp6.sroa.0.sroa.0.0.agg.tmp6.sroa.0.0..sroa_cast36.sroa_idx to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %8, align 8
  %agg.tmp6.sroa.0.sroa.3.0.agg.tmp6.sroa.0.0..sroa_cast36.sroa_idx46 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 1, i64* %agg.tmp6.sroa.0.sroa.3.0.agg.tmp6.sroa.0.0..sroa_cast36.sroa_idx46, align 8
  %offset.i = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 2
  %9 = bitcast %"class.cl::sycl::id"* %offset.i to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %9, i8 0, i64 24, i1 false)
  call void @_ZN2cl4sycl6detail8NDRDescT3setEiNS0_8nd_rangeILi3EEE(%"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %AdjustedRange, i32 noundef %conv, %"class.cl::sycl::nd_range"* noundef nonnull %agg.tmp)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %arrayidx.i33 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 1, i32 0, i32 0, i64 0
  %10 = load i64, i64* %arrayidx.i33, align 8, !tbaa !39
  %cmp8 = icmp eq i64 %10, 0
  br i1 %cmp8, label %for.cond.preheader, label %if.end15

for.cond.preheader:                               ; preds = %if.end
  %Dims10 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 4
  %11 = load i64, i64* %Dims10, align 8, !tbaa !180
  %cmp1147.not = icmp eq i64 %11, 0
  br i1 %cmp1147.not, label %if.end15, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  store i64 1, i64* %arrayidx.i33, align 8, !tbaa !39
  %cmp11.not = icmp eq i64 %11, 1
  br i1 %cmp11.not, label %if.end15, label %for.body.1, !llvm.loop !184

if.then.i.i:                                      ; preds = %for.body.2
  %exception.i.i = call i8* @__cxa_allocate_exception(i64 64) #30
  %12 = bitcast i8* %exception.i.i to %"class.cl::sycl::invalid_parameter_error"*
  invoke void @_ZN2cl4sycl23invalid_parameter_errorC2EPKci(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %12, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i64 0, i64 0), i32 noundef -30)
          to label %invoke.cont.i.i unwind label %lpad.i.i

invoke.cont.i.i:                                  ; preds = %if.then.i.i
  call void @__cxa_throw(i8* %exception.i.i, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl23invalid_parameter_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

lpad.i.i:                                         ; preds = %if.then.i.i
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %exception.i.i) #30
  resume { i8*, i32 } %13

for.body.1:                                       ; preds = %for.body.preheader
  %arrayidx.i34.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 1, i32 0, i32 0, i64 1
  store i64 1, i64* %arrayidx.i34.1, align 8, !tbaa !39
  %cmp11.1 = icmp ugt i64 %11, 2
  br i1 %cmp11.1, label %for.body.2, label %if.end15, !llvm.loop !184

for.body.2:                                       ; preds = %for.body.1
  %arrayidx.i34.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 1, i64* %arrayidx.i34.2, align 8, !tbaa !39
  %cmp11.2.not = icmp eq i64 %11, 3
  br i1 %cmp11.2.not, label %if.end15, label %if.then.i.i, !llvm.loop !184

if.end15:                                         ; preds = %for.body.preheader, %for.body.1, %for.body.2, %for.cond.preheader, %if.end
  %tobool.not = icmp eq %"class.cl::sycl::detail::HostProfilingInfo"* %HPI, null
  br i1 %tobool.not, label %if.end20.critedge, label %if.then16

if.then16:                                        ; preds = %if.end15
  call void @_ZN2cl4sycl6detail17HostProfilingInfo5startEv(%"class.cl::sycl::detail::HostProfilingInfo"* noundef nonnull align 8 dereferenceable(16) %HPI)
  call void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTE(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this, %"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %AdjustedRange)
  call void @_ZN2cl4sycl6detail17HostProfilingInfo3endEv(%"class.cl::sycl::detail::HostProfilingInfo"* noundef nonnull align 8 dereferenceable(16) %HPI)
  br label %if.end20

if.end20.critedge:                                ; preds = %if.end15
  call void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTE(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this, %"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %AdjustedRange)
  br label %if.end20

if.end20:                                         ; preds = %if.end20.critedge, %if.then16
  call void @llvm.lifetime.end.p0i8(i64 104, i8* nonnull %0) #30
  ret void
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef i8* @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE6getPtrEv(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this) unnamed_addr #26 comdat align 2 {
entry:
  %MKernel = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1
  %0 = bitcast %"class.std::function.123"* %MKernel to i8*
  ret i8* %0
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this) unnamed_addr #22 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_manager.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 1
  %1 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i, align 8, !tbaa !83
  %tobool.not.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %1, null
  br i1 %tobool.not.i, label %_ZNSt14_Function_baseD2Ev.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %_M_functor.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 0
  %call.i = invoke noundef i1 %1(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit unwind label %terminate.lpad.i

terminate.lpad.i:                                 ; preds = %if.then.i
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  tail call void @__clang_call_terminate(i8* %3) #31
  unreachable

_ZNSt14_Function_baseD2Ev.exit:                   ; preds = %entry, %if.then.i
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED0Ev(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this) unnamed_addr #22 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_manager.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 1
  %1 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !83
  %tobool.not.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %1, null
  br i1 %tobool.not.i.i, label %_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %_M_functor.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 0
  %call.i.i = invoke noundef i1 %1(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, i32 noundef 3)
          to label %_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit unwind label %terminate.lpad.i.i

terminate.lpad.i.i:                               ; preds = %if.then.i.i
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  tail call void @__clang_call_terminate(i8* %3) #31
  unreachable

_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit: ; preds = %entry, %if.then.i.i
  %4 = bitcast %"class.cl::sycl::detail::HostKernel"* %this to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %4) #34
  ret void
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail8NDRDescT3setEiNS0_8nd_rangeILi3EEE(%"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %this, i32 noundef %Dims_, %"class.cl::sycl::nd_range"* noundef %ExecutionRange) local_unnamed_addr #20 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %cmp63 = icmp sgt i32 %Dims_, 0
  br i1 %cmp63, label %for.body.lr.ph, label %for.body.lr.ph.i

for.body.lr.ph:                                   ; preds = %entry
  %ref.tmp.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 0, i32 0, i32 0, i64 0
  %ref.tmp.sroa.0.0.copyload = load i64, i64* %ref.tmp.sroa.0.0..sroa_idx, align 8
  %ref.tmp.sroa.14.0..sroa_idx177 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 0, i32 0, i32 0, i64 2
  %arrayidx.i26 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %ref.tmp.sroa.0.0.copyload, i64* %arrayidx.i26, align 8, !tbaa !39
  %ref.tmp3.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 1, i32 0, i32 0, i64 0
  %ref.tmp3.sroa.0.0.copyload = load i64, i64* %ref.tmp3.sroa.0.0..sroa_idx, align 8
  %ref.tmp3.sroa.14.0..sroa_idx136 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 1, i32 0, i32 0, i64 2
  %arrayidx.i40 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 %ref.tmp3.sroa.0.0.copyload, i64* %arrayidx.i40, align 8, !tbaa !39
  %ref.tmp6.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 2, i32 0, i32 0, i64 0
  %ref.tmp6.sroa.0.0.copyload = load i64, i64* %ref.tmp6.sroa.0.0..sroa_idx, align 8
  %ref.tmp6.sroa.14.0..sroa_idx95 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 2, i32 0, i32 0, i64 2
  %arrayidx.i54 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 0
  store i64 %ref.tmp6.sroa.0.0.copyload, i64* %arrayidx.i54, align 8, !tbaa !39
  %arrayidx.i61 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 0
  store i64 0, i64* %arrayidx.i61, align 8, !tbaa !39
  %exitcond66.not = icmp eq i32 %Dims_, 1
  br i1 %exitcond66.not, label %for.body.lr.ph.i, label %for.body.1, !llvm.loop !185

for.body.lr.ph.i:                                 ; preds = %for.body.lr.ph, %for.body.1, %entry
  %arrayidx.i13.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 0
  %0 = zext i32 %Dims_ to i64
  %umax.i = tail call i32 @llvm.umax.i32(i32 %Dims_, i32 3)
  %wide.trip.count.i = zext i32 %umax.i to i64
  br label %for.body.i

for.body.i:                                       ; preds = %_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ %0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i ]
  %exitcond.i = icmp eq i64 %indvars.iv.i, %wide.trip.count.i
  br i1 %exitcond.i, label %if.then.i.i.i, label %_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i

if.then.i.i.i:                                    ; preds = %for.body.i
  %exception.i.i.i = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %1 = bitcast i8* %exception.i.i.i to %"class.cl::sycl::invalid_parameter_error"*
  invoke void @_ZN2cl4sycl23invalid_parameter_errorC2EPKci(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %1, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i64 0, i64 0), i32 noundef -30)
          to label %invoke.cont.i.i.i unwind label %lpad.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.then.i.i.i
  tail call void @__cxa_throw(i8* %exception.i.i.i, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl23invalid_parameter_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

common.resume:                                    ; preds = %lpad.i.i, %lpad.i.i.i
  %exception.i.i.sink = phi i8* [ %exception.i.i, %lpad.i.i ], [ %exception.i.i.i, %lpad.i.i.i ]
  %common.resume.op = phi { i8*, i32 } [ %5, %lpad.i.i ], [ %2, %lpad.i.i.i ]
  tail call void @__cxa_free_exception(i8* %exception.i.i.sink) #30
  resume { i8*, i32 } %common.resume.op

lpad.i.i.i:                                       ; preds = %if.then.i.i.i
  %2 = landingpad { i8*, i32 }
          cleanup
  br label %common.resume

_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i:      ; preds = %for.body.i
  %arrayidx.i.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 %indvars.iv.i
  store i64 1, i64* %arrayidx.i.i, align 8, !tbaa !39
  %3 = load i64, i64* %arrayidx.i13.i, align 8, !tbaa !39
  %tobool.not.i = icmp ne i64 %3, 0
  %conv.i = zext i1 %tobool.not.i to i64
  %arrayidx.i19.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 %indvars.iv.i
  store i64 %conv.i, i64* %arrayidx.i19.i, align 8, !tbaa !39
  %arrayidx.i26.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 %indvars.iv.i
  store i64 0, i64* %arrayidx.i26.i, align 8, !tbaa !39
  %arrayidx.i33.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 %indvars.iv.i
  store i64 0, i64* %arrayidx.i33.i, align 8, !tbaa !39
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %cmp.not.i = icmp eq i64 %indvars.iv.i, 2
  br i1 %cmp.not.i, label %_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit, label %for.body.i, !llvm.loop !186

_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit: ; preds = %_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i, %for.body.2
  %conv = sext i32 %Dims_ to i64
  %Dims = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 4
  store i64 %conv, i64* %Dims, align 8, !tbaa !180
  ret void

if.then.i.i:                                      ; preds = %for.body.2
  %exception.i.i = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %4 = bitcast i8* %exception.i.i to %"class.cl::sycl::invalid_parameter_error"*
  invoke void @_ZN2cl4sycl23invalid_parameter_errorC2EPKci(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %4, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i64 0, i64 0), i32 noundef -30)
          to label %invoke.cont.i.i unwind label %lpad.i.i

invoke.cont.i.i:                                  ; preds = %if.then.i.i
  tail call void @__cxa_throw(i8* %exception.i.i, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl23invalid_parameter_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

lpad.i.i:                                         ; preds = %if.then.i.i
  %5 = landingpad { i8*, i32 }
          cleanup
  br label %common.resume

for.body.1:                                       ; preds = %for.body.lr.ph
  %ref.tmp6.sroa.13.0..sroa_idx81 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 2, i32 0, i32 0, i64 1
  %ref.tmp3.sroa.13.0..sroa_idx122 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 1, i32 0, i32 0, i64 1
  %ref.tmp.sroa.13.0..sroa_idx163 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 0, i32 0, i32 0, i64 1
  %ref.tmp.sroa.13.0.copyload166 = load i64, i64* %ref.tmp.sroa.13.0..sroa_idx163, align 8
  %arrayidx.i26.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 1
  store i64 %ref.tmp.sroa.13.0.copyload166, i64* %arrayidx.i26.1, align 8, !tbaa !39
  %ref.tmp3.sroa.13.0.copyload125 = load i64, i64* %ref.tmp3.sroa.13.0..sroa_idx122, align 8
  %arrayidx.i40.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 1
  store i64 %ref.tmp3.sroa.13.0.copyload125, i64* %arrayidx.i40.1, align 8, !tbaa !39
  %ref.tmp6.sroa.13.0.copyload84 = load i64, i64* %ref.tmp6.sroa.13.0..sroa_idx81, align 8
  %arrayidx.i54.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 1
  store i64 %ref.tmp6.sroa.13.0.copyload84, i64* %arrayidx.i54.1, align 8, !tbaa !39
  %arrayidx.i61.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 1
  store i64 0, i64* %arrayidx.i61.1, align 8, !tbaa !39
  %exitcond66.1.not = icmp eq i32 %Dims_, 2
  br i1 %exitcond66.1.not, label %for.body.lr.ph.i, label %for.body.2, !llvm.loop !185

for.body.2:                                       ; preds = %for.body.1
  %ref.tmp.sroa.14.0.copyload184 = load i64, i64* %ref.tmp.sroa.14.0..sroa_idx177, align 8
  %arrayidx.i26.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 2
  store i64 %ref.tmp.sroa.14.0.copyload184, i64* %arrayidx.i26.2, align 8, !tbaa !39
  %ref.tmp3.sroa.14.0.copyload143 = load i64, i64* %ref.tmp3.sroa.14.0..sroa_idx136, align 8
  %arrayidx.i40.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 %ref.tmp3.sroa.14.0.copyload143, i64* %arrayidx.i40.2, align 8, !tbaa !39
  %ref.tmp6.sroa.14.0.copyload102 = load i64, i64* %ref.tmp6.sroa.14.0..sroa_idx95, align 8
  %arrayidx.i54.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 2
  store i64 %ref.tmp6.sroa.14.0.copyload102, i64* %arrayidx.i54.2, align 8, !tbaa !39
  %arrayidx.i61.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i61.2, align 8, !tbaa !39
  %exitcond66.2.not = icmp eq i32 %Dims_, 3
  br i1 %exitcond66.2.not, label %_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit, label %if.then.i.i, !llvm.loop !185
}

declare dso_local void @_ZN2cl4sycl6detail17HostProfilingInfo5startEv(%"class.cl::sycl::detail::HostProfilingInfo"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTE(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this, %"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %NDRDesc) local_unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %LowerBound.i = alloca %"class.cl::sycl::range.118", align 8
  %Stride.i = alloca <2 x i64>, align 16
  %Index.i = alloca %"class.cl::sycl::range.118", align 8
  %agg.tmp.ensured.i = alloca %"struct.cl::sycl::detail::NDLoopIterateImpl", align 1
  %agg.tmp.i = alloca %class.anon.129, align 8
  %GroupSize = alloca %"class.cl::sycl::range.118", align 8
  %LocalSize14 = alloca %"class.cl::sycl::range.118", align 8
  %GlobalSize18 = alloca %"class.cl::sycl::range.118", align 8
  %GlobalOffset = alloca %"class.cl::sycl::id.126", align 8
  %0 = bitcast %"class.cl::sycl::range.118"* %GroupSize to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #30
  %call.fca.0.gep = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %GroupSize, i64 0, i32 0, i32 0, i64 0
  %arrayidx.i = getelementptr %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 1, i32 0, i32 0, i64 0
  %1 = load i64, i64* %arrayidx.i, align 8, !tbaa !39
  %cmp4 = icmp eq i64 %1, 0
  br i1 %cmp4, label %if.then, label %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81

_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81:       ; preds = %entry
  %arrayidx.i73 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 0
  %2 = load i64, i64* %arrayidx.i73, align 8, !tbaa !39
  %.frozen = freeze i64 %2
  %.frozen159 = freeze i64 %1
  %div = udiv i64 %.frozen, %.frozen159
  %3 = mul i64 %div, %.frozen159
  %rem.decomposed = sub i64 %.frozen, %3
  %cmp8.not = icmp eq i64 %rem.decomposed, 0
  br i1 %cmp8.not, label %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit, label %if.then

if.then:                                          ; preds = %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1, %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit, %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81, %entry
  %exception = tail call i8* @__cxa_allocate_exception(i64 64) #30
  %4 = bitcast i8* %exception to %"class.cl::sycl::nd_range_error"*
  invoke void @_ZN2cl4sycl14nd_range_errorC2EPKci(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %4, i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.23, i64 0, i64 0), i32 noundef -54)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  tail call void @__cxa_throw(i8* %exception, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN2cl4sycl14nd_range_errorE to i8*), i8* bitcast (void (%"class.cl::sycl::exception"*)* @_ZN2cl4sycl9exceptionD2Ev to i8*)) #33
  unreachable

lpad:                                             ; preds = %if.then
  %5 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %exception) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #30
  resume { i8*, i32 } %5

_ZN2cl4sycl6detail5arrayILi2EEixEi.exit:          ; preds = %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81
  store i64 %div, i64* %call.fca.0.gep, align 8, !tbaa !39
  %arrayidx.i.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 1, i32 0, i32 0, i64 1
  %6 = load i64, i64* %arrayidx.i.1, align 8, !tbaa !39
  %cmp4.1 = icmp eq i64 %6, 0
  br i1 %cmp4.1, label %if.then, label %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1

_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1:     ; preds = %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit
  %arrayidx.i73.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 1
  %7 = load i64, i64* %arrayidx.i73.1, align 8, !tbaa !39
  %.frozen160 = freeze i64 %7
  %.frozen161 = freeze i64 %6
  %div.1 = udiv i64 %.frozen160, %.frozen161
  %8 = mul i64 %div.1, %.frozen161
  %rem.1.decomposed = sub i64 %.frozen160, %8
  %cmp8.not.1 = icmp eq i64 %rem.1.decomposed, 0
  br i1 %cmp8.not.1, label %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit.1, label %if.then

_ZN2cl4sycl6detail5arrayILi2EEixEi.exit.1:        ; preds = %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1
  %tmpcast = bitcast <2 x i64>* %Stride.i to %"class.cl::sycl::range.118"*
  %call.fca.1.gep = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %GroupSize, i64 0, i32 0, i32 0, i64 1
  %GlobalOffset151 = bitcast %"class.cl::sycl::id.126"* %GlobalOffset to i8*
  %GlobalSize18156 = bitcast %"class.cl::sycl::range.118"* %GlobalSize18 to i8*
  %LocalSize14153 = bitcast %"class.cl::sycl::range.118"* %LocalSize14 to i8*
  %NDRDesc157 = bitcast %"class.cl::sycl::detail::NDRDescT"* %NDRDesc to i8*
  store i64 %div.1, i64* %call.fca.1.gep, align 8, !tbaa !39
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %LocalSize14153) #30
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %GlobalSize18156) #30
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %GlobalOffset151) #30
  %scevgep = getelementptr %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 2, i32 0, i32 0, i64 0
  %scevgep152 = bitcast i64* %scevgep to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %GlobalOffset151, i8* noundef nonnull align 8 dereferenceable(16) %scevgep152, i64 16, i1 false), !tbaa !39
  %scevgep154155 = bitcast i64* %arrayidx.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %LocalSize14153, i8* noundef nonnull align 8 dereferenceable(16) %scevgep154155, i64 16, i1 false), !tbaa !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %GlobalSize18156, i8* noundef nonnull align 8 dereferenceable(16) %NDRDesc157, i64 16, i1 false), !tbaa !39
  %9 = getelementptr inbounds %"struct.cl::sycl::detail::NDLoopIterateImpl", %"struct.cl::sycl::detail::NDLoopIterateImpl"* %agg.tmp.ensured.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %9)
  %10 = bitcast %class.anon.129* %agg.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %10)
  %11 = bitcast %"class.cl::sycl::range.118"* %LowerBound.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %11) #30
  %12 = bitcast <2 x i64>* %Stride.i to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %12) #30
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %Stride.i, align 16
  %13 = bitcast %"class.cl::sycl::range.118"* %Index.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %13, i8 0, i64 16, i1 false)
  %agg.tmp.sroa.0.0..sroa_idx = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 0
  store %"class.cl::sycl::range.118"* %GlobalSize18, %"class.cl::sycl::range.118"** %agg.tmp.sroa.0.0..sroa_idx, align 8, !tbaa.struct !187
  %agg.tmp.sroa.2.0..sroa_idx144 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 1
  store %"class.cl::sycl::range.118"* %LocalSize14, %"class.cl::sycl::range.118"** %agg.tmp.sroa.2.0..sroa_idx144, align 8, !tbaa.struct !188
  %agg.tmp.sroa.3.0..sroa_idx145 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 2
  store %"class.cl::sycl::range.118"* %GroupSize, %"class.cl::sycl::range.118"** %agg.tmp.sroa.3.0..sroa_idx145, align 8, !tbaa.struct !189
  %agg.tmp.sroa.4.0..sroa_idx146 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 3
  store %"class.cl::sycl::id.126"* %GlobalOffset, %"class.cl::sycl::id.126"** %agg.tmp.sroa.4.0..sroa_idx146, align 8, !tbaa.struct !190
  %agg.tmp.sroa.5.0..sroa_idx147 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 4
  store %"class.cl::sycl::detail::HostKernel"* %this, %"class.cl::sycl::detail::HostKernel"** %agg.tmp.sroa.5.0..sroa_idx147, align 8, !tbaa.struct !191
  call void @_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_(%"struct.cl::sycl::detail::NDLoopIterateImpl"* noundef nonnull align 1 dereferenceable(1) %agg.tmp.ensured.i, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %LowerBound.i, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %tmpcast, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %GroupSize, %class.anon.129* noundef nonnull %agg.tmp.i, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %Index.i)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %11) #30
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %9)
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %10)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %GlobalOffset151) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %GlobalSize18156) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %LocalSize14153) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #30
  ret void
}

declare dso_local void @_ZN2cl4sycl6detail17HostProfilingInfo3endEv(%"class.cl::sycl::detail::HostProfilingInfo"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl14nd_range_errorC2EPKci(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this, i8* noundef %Msg, i32 noundef %Err) unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !141
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !103
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !103
  store i8 %7, i8* %6, align 1, !tbaa !103
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !39
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !150
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #30
  invoke void @_ZN2cl4sycl14nd_range_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i32 noundef %Err)
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont
  %10 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i = icmp eq i8* %10, %3
  br i1 %cmp.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %invoke.cont4
  call void @_ZdlPv(i8* noundef %10) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %invoke.cont4, %if.then.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  ret void

lpad3:                                            ; preds = %invoke.cont
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !142
  %cmp.i.i.i12 = icmp eq i8* %12, %3
  br i1 %cmp.i.i.i12, label %ehcleanup, label %if.then.i.i13

if.then.i.i13:                                    ; preds = %lpad3
  call void @_ZdlPv(i8* noundef %12) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %if.then.i.i13, %lpad3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #30
  resume { i8*, i32 } %11
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl14nd_range_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err) unnamed_addr #12 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %call = tail call [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef 4) #30
  %0 = bitcast %"class.std::shared_ptr.120"* %agg.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0)
  %1 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false) #30
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %call, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %entry
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

lpad.i:                                           ; preds = %entry
  %10 = landingpad { i8*, i32 }
          cleanup
  %_M_pi.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !44
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %lpad.i
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i2, label %if.else.i.i.i.i

if.then.i.i.i.i2:                                 ; preds = %if.then.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i2
  %retval.0.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i2 ], [ %13, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i3, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i3:                                   ; preds = %invoke.cont.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i3
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i3
  %17 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i ], [ %17, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !48
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %lpad.i, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  resume { i8*, i32 } %10

_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit: ; preds = %invoke.cont.i, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  %19 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0)
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl14nd_range_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %19, align 8, !tbaa !48
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl14nd_range_errorD0Ev(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !48
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !44
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !46
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !46
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !48
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !142
  %10 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 2
  %arraydecay.i.i.i.i.i = bitcast %union.anon* %10 to i8*
  %cmp.i.i.i2.i = icmp eq i8* %9, %arraydecay.i.i.i.i.i
  br i1 %cmp.i.i.i2.i, label %_ZN2cl4sycl9exceptionD2Ev.exit, label %if.then.i.i3.i

if.then.i.i3.i:                                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i
  tail call void @_ZdlPv(i8* noundef %9) #30
  br label %_ZN2cl4sycl9exceptionD2Ev.exit

_ZN2cl4sycl9exceptionD2Ev.exit:                   ; preds = %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, %if.then.i.i3.i
  %11 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* noundef nonnull align 8 dereferenceable(8) %11) #30
  %12 = bitcast %"class.cl::sycl::nd_range_error"* %this to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %12) #34
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_(%"struct.cl::sycl::detail::NDLoopIterateImpl"* noundef nonnull align 1 dereferenceable(1) %this, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %LowerBound, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %Stride, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %UpperBound, %class.anon.129* noundef %f, %"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %Index) unnamed_addr #12 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %LocalItem.sroa.0.i.sroa.0.i = alloca [2 x i64], align 8
  %NDItem.sroa.0.i.i = alloca [2 x i64], align 8
  %NDItem.sroa.7.i.i = alloca [2 x i64], align 8
  %agg.tmp.i.i19 = alloca %"class.std::function.123", align 8
  %agg.tmp16.i.i = alloca %"class.cl::sycl::nd_item", align 8
  %Group.i.sroa.0 = alloca { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118" }, align 8
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %LowerBound, i64 0, i32 0, i32 0, i64 0
  %0 = load i64, i64* %arrayidx.i, align 8, !tbaa !39
  %arrayidx.i14 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %Index, i64 0, i32 0, i32 0, i64 0
  %arrayidx.i16 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %UpperBound, i64 0, i32 0, i32 0, i64 0
  store i64 %0, i64* %arrayidx.i14, align 8, !tbaa !39
  %1 = load i64, i64* %arrayidx.i16, align 8, !tbaa !39
  %cmp133 = icmp ult i64 %0, %1
  br i1 %cmp133, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %agg.tmp.sroa.0.0..sroa_idx = getelementptr inbounds %class.anon.129, %class.anon.129* %f, i64 0, i32 0
  %agg.tmp.sroa.2.0..sroa_idx27 = getelementptr inbounds %class.anon.129, %class.anon.129* %f, i64 0, i32 1
  %agg.tmp.sroa.3.0..sroa_idx28 = getelementptr inbounds %class.anon.129, %class.anon.129* %f, i64 0, i32 2
  %agg.tmp.sroa.4.0..sroa_idx29 = getelementptr inbounds %class.anon.129, %class.anon.129* %f, i64 0, i32 3
  %agg.tmp.sroa.5.0..sroa_idx30 = getelementptr inbounds %class.anon.129, %class.anon.129* %f, i64 0, i32 4
  %arrayidx.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %LowerBound, i64 0, i32 0, i32 0, i64 1
  %arrayidx.i13.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %Index, i64 0, i32 0, i32 0, i64 1
  %arrayidx.i15.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %UpperBound, i64 0, i32 0, i32 0, i64 1
  %arrayidx.i16.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %Stride, i64 0, i32 0, i32 0, i64 1
  %Group.i.sroa.0.0..sroa_cast = bitcast { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118" }* %Group.i.sroa.0 to i8*
  %Group.i.sroa.0.16..sroa_idx = getelementptr inbounds { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118" }, { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118" }* %Group.i.sroa.0, i64 0, i32 1
  %Group.i.sroa.0.16..sroa_cast62 = bitcast %"class.cl::sycl::range.118"* %Group.i.sroa.0.16..sroa_idx to i8*
  %2 = bitcast %"class.std::function.123"* %agg.tmp.i.i19 to i8*
  %3 = bitcast %"class.cl::sycl::nd_item"* %agg.tmp16.i.i to i8*
  %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i = bitcast [2 x i64]* %LocalItem.sroa.0.i.sroa.0.i to i8*
  %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i = bitcast [2 x i64]* %NDItem.sroa.0.i.i to i8*
  %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i = bitcast [2 x i64]* %NDItem.sroa.7.i.i to i8*
  %_M_manager.i.i.i.i = getelementptr inbounds %"class.std::function.123", %"class.std::function.123"* %agg.tmp.i.i19, i64 0, i32 0, i32 1
  %_M_functor.i.i.i = getelementptr inbounds %"class.std::function.123", %"class.std::function.123"* %agg.tmp.i.i19, i64 0, i32 0, i32 0
  %_M_invoker4.i.i.i = getelementptr inbounds %"class.std::function.123", %"class.std::function.123"* %agg.tmp.i.i19, i64 0, i32 1
  %NDItem.sroa.5.0..sroa_idx109.i.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %NDItem.sroa.6.0..sroa_idx112.i.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %NDItem.sroa.7.0..sroa_idx.i.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 0, i32 0, i32 2
  %NDItem.sroa.7.0..sroa_cast.i.i = bitcast %"class.cl::sycl::id.126"* %NDItem.sroa.7.0..sroa_idx.i.i to i8*
  %LocalItem.sroa.0.i.sroa.0.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 1
  %LocalItem.sroa.0.i.sroa.0.0.NDItem.sroa.8.0..sroa_cast.i.sroa_cast.i = bitcast %"class.cl::sycl::item.127"* %LocalItem.sroa.0.i.sroa.0.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx.i to i8*
  %LocalItem.sroa.0.i.sroa.5.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx41.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 1, i32 0, i32 1, i32 0, i32 0, i64 0
  %LocalItem.sroa.0.i.sroa.6.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx44.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 1, i32 0, i32 1, i32 0, i32 0, i64 1
  %NDItem.sroa.9.i.i.sroa.0.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 2
  %NDItem.sroa.9.i.i.sroa.0.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast = bitcast %"class.cl::sycl::group"* %NDItem.sroa.9.i.i.sroa.0.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx to i8*
  %NDItem.sroa.9.i.i.sroa.5.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx77 = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 2, i32 2, i32 0, i32 0, i64 0
  %NDItem.sroa.9.i.i.sroa.6.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx80 = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 2, i32 2, i32 0, i32 0, i64 1
  %NDItem.sroa.9.i.i.sroa.7.sroa.0.0.NDItem.sroa.9.i.i.sroa.7.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast.sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 2, i32 3, i32 0, i32 0, i64 0
  %NDItem.sroa.9.i.i.sroa.7.sroa.5.0.NDItem.sroa.9.i.i.sroa.7.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast.sroa_idx101 = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %agg.tmp16.i.i, i64 0, i32 2, i32 3, i32 0, i32 0, i64 1
  %arrayidx.i17 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %Stride, i64 0, i32 0, i32 0, i64 0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit
  %4 = phi i64 [ %0, %for.body.lr.ph ], [ %add, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit ]
  %agg.tmp.sroa.0.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.0.0..sroa_idx, align 8, !tbaa.struct !187
  %agg.tmp.sroa.2.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.2.0..sroa_idx27, align 8, !tbaa.struct !188
  %agg.tmp.sroa.3.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.3.0..sroa_idx28, align 8, !tbaa.struct !189
  %agg.tmp.sroa.4.0.copyload = load %"class.cl::sycl::id.126"*, %"class.cl::sycl::id.126"** %agg.tmp.sroa.4.0..sroa_idx29, align 8, !tbaa.struct !190
  %agg.tmp.sroa.5.0.copyload = load %"class.cl::sycl::detail::HostKernel"*, %"class.cl::sycl::detail::HostKernel"** %agg.tmp.sroa.5.0..sroa_idx30, align 8, !tbaa.struct !191
  %5 = load i64, i64* %arrayidx.i.i, align 8, !tbaa !39
  store i64 %5, i64* %arrayidx.i13.i, align 8, !tbaa !39
  %6 = load i64, i64* %arrayidx.i15.i, align 8, !tbaa !39
  %cmp18.i = icmp ult i64 %5, %6
  br i1 %cmp18.i, label %for.body.lr.ph.i, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit

for.body.lr.ph.i:                                 ; preds = %for.body
  %agg.tmp.sroa.0.0..sroa_idx.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.3.0.copyload, i64 0, i32 0, i32 0, i64 0
  %agg.tmp.sroa.2.0..sroa_idx2.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.3.0.copyload, i64 0, i32 0, i32 0, i64 1
  %Group.i.sroa.0.0..sroa_cast60 = bitcast %"class.cl::sycl::range.118"* %agg.tmp.sroa.0.0.copyload to i8*
  %Group.i.sroa.0.16..sroa_cast = bitcast %"class.cl::sycl::range.118"* %agg.tmp.sroa.2.0.copyload to i8*
  %retval.sroa.0.0..sroa_idx.i.i.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.0.0.copyload, i64 0, i32 0, i32 0, i64 0
  %retval.sroa.3.0..sroa_idx16.i.i.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.0.0.copyload, i64 0, i32 0, i32 0, i64 1
  %arrayidx3.i.i.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.2.0.copyload, i64 0, i32 0, i32 0, i64 0
  %arrayidx3.1.i.i.i.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %agg.tmp.sroa.2.0.copyload, i64 0, i32 0, i32 0, i64 1
  %arrayidx3.i28.i.i = getelementptr inbounds %"class.cl::sycl::id.126", %"class.cl::sycl::id.126"* %agg.tmp.sroa.4.0.copyload, i64 0, i32 0, i32 0, i64 0
  %arrayidx3.1.i31.i.i = getelementptr inbounds %"class.cl::sycl::id.126", %"class.cl::sycl::id.126"* %agg.tmp.sroa.4.0.copyload, i64 0, i32 0, i32 0, i64 1
  %GlobalItem.sroa.0.sroa.7.32.GlobalItem.sroa.0.32..sroa_cast.sroa_cast.i.i = bitcast %"class.cl::sycl::id.126"* %agg.tmp.sroa.4.0.copyload to i8*
  %_M_manager.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %agg.tmp.sroa.5.0.copyload, i64 0, i32 1, i32 0, i32 1
  %_M_functor2.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %agg.tmp.sroa.5.0.copyload, i64 0, i32 1, i32 0, i32 0
  %_M_invoker.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %agg.tmp.sroa.5.0.copyload, i64 0, i32 1, i32 1
  br label %for.body.i

for.body.i:                                       ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit, %for.body.lr.ph.i
  %storemerge19.i = phi i64 [ %5, %for.body.lr.ph.i ], [ %add.i, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit ]
  %retval.sroa.0.0.copyload.i.i = load i64, i64* %arrayidx.i14, align 8, !tbaa !39
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %Group.i.sroa.0.0..sroa_cast)
  %agg.tmp.sroa.0.0.copyload.i.i = load i64, i64* %agg.tmp.sroa.0.0..sroa_idx.i.i, align 8, !noalias !192
  %agg.tmp.sroa.2.0.copyload.i.i = load i64, i64* %agg.tmp.sroa.2.0..sroa_idx2.i.i, align 8, !noalias !192
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast60, i64 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast62, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast, i64 16, i1 false)
  %7 = load i64, i64* %retval.sroa.0.0..sroa_idx.i.i.i.i, align 8, !tbaa !39, !noalias !192
  %8 = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !39, !noalias !192
  %.frozen = freeze i64 %7
  %.frozen150 = freeze i64 %8
  %div.i.i.i.i = udiv i64 %.frozen, %.frozen150
  %9 = mul i64 %div.i.i.i.i, %.frozen150
  %rem.i.i.i.i.decomposed = sub i64 %.frozen, %9
  %10 = load i64, i64* %retval.sroa.3.0..sroa_idx16.i.i.i.i, align 8, !tbaa !39, !noalias !192
  %11 = load i64, i64* %arrayidx3.1.i.i.i.i, align 8, !tbaa !39, !noalias !192
  %.frozen151 = freeze i64 %10
  %.frozen152 = freeze i64 %11
  %div.1.i.i.i.i = udiv i64 %.frozen151, %.frozen152
  %12 = mul i64 %div.1.i.i.i.i, %.frozen152
  %rem.1.i.i.i.i.decomposed = sub i64 %.frozen151, %12
  %mul.1.i.i.i.i = mul i64 %rem.1.i.i.i.i.decomposed, %rem.i.i.i.i.decomposed
  %cmp.i.i.i = icmp eq i64 %mul.1.i.i.i.i, 0
  br i1 %cmp.i.i.i, label %cond.end.i.i.i, label %cond.false.i.i.i

cond.false.i.i.i:                                 ; preds = %for.body.i
  call void @__assert_fail(i8* noundef getelementptr inbounds ([65 x i8], [65 x i8]* @.str.25, i64 0, i64 0), i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @.str.26, i64 0, i64 0), i32 noundef 526, i8* noundef getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN2cl4sycl5groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE, i64 0, i64 0)) #31, !noalias !192
  unreachable

cond.end.i.i.i:                                   ; preds = %for.body.i
  %sub.i.i.i.i = sub i64 %div.i.i.i.i, %agg.tmp.sroa.0.0.copyload.i.i
  %sub.1.i.i.i.i = sub i64 %div.1.i.i.i.i, %agg.tmp.sroa.2.0.copyload.i.i
  %mul.1.i40.i.i.i = mul i64 %sub.1.i.i.i.i, %sub.i.i.i.i
  %cmp15.i.i.i = icmp eq i64 %mul.1.i40.i.i.i, 0
  br i1 %cmp15.i.i.i, label %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit, label %cond.false19.i.i.i

cond.false19.i.i.i:                               ; preds = %cond.end.i.i.i
  call void @__assert_fail(i8* noundef getelementptr inbounds ([83 x i8], [83 x i8]* @.str.28, i64 0, i64 0), i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @.str.26, i64 0, i64 0), i32 noundef 528, i8* noundef getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN2cl4sycl5groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE, i64 0, i64 0)) #31, !noalias !192
  unreachable

_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit: ; preds = %cond.end.i.i.i
  %cmp79.i.not = icmp eq i64 %8, 0
  %13 = icmp eq i64 %11, 0
  %or.cond = select i1 %cmp79.i.not, i1 true, i1 %13
  br i1 %or.cond, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit, label %for.body.i24

for.body.i24:                                     ; preds = %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i
  %14 = phi i64 [ %34, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i ], [ %8, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  %retval.sroa.3.0.copyload.i.i.i145 = phi i64 [ %retval.sroa.3.0.copyload.i.i.i146, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i ], [ %11, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  %15 = phi i64 [ %35, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i ], [ 1, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  %Index.i.i.sroa.0.2 = phi i64 [ %add.i25, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i ], [ 0, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  %cmp18.i.i.not = icmp eq i64 %15, 0
  br i1 %cmp18.i.i.not, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i, label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i24, %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i
  %retval.sroa.3.0.copyload.i.i.i = phi i64 [ %33, %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i ], [ %retval.sroa.3.0.copyload.i.i.i145, %for.body.i24 ]
  %Index.i.i.sroa.7.2 = phi i64 [ %add.i.i, %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i ], [ 0, %for.body.i24 ]
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %2)
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %3)
  %retval.sroa.0.0.copyload.i.i20.i = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !39
  %mul.i.i.i = mul i64 %retval.sroa.0.0.copyload.i.i20.i, %retval.sroa.0.0.copyload.i.i
  %mul.1.i.i.i = mul i64 %retval.sroa.3.0.copyload.i.i.i, %storemerge19.i
  %add.i.i.i = add i64 %mul.i.i.i, %Index.i.i.sroa.0.2
  %add.1.i.i.i = add i64 %mul.1.i.i.i, %Index.i.i.sroa.7.2
  %16 = load i64, i64* %arrayidx3.i28.i.i, align 8, !tbaa !39
  %add.i29.i.i = add i64 %add.i.i.i, %16
  %17 = load i64, i64* %arrayidx3.1.i31.i.i, align 8, !tbaa !39
  %add.1.i32.i.i = add i64 %add.1.i.i.i, %17
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast, i64 16, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast60, i64 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i, i8* noundef nonnull align 8 dereferenceable(16) %GlobalItem.sroa.0.sroa.7.32.GlobalItem.sroa.0.32..sroa_cast.sroa_cast.i.i, i64 16, i1 false)
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !83
  %18 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i.i, align 8, !tbaa !83
  %tobool.not.i.i.not.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %18, null
  br i1 %tobool.not.i.i.not.i.i.i, label %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i
  %call3.i.i.i = invoke noundef i1 %18(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor2.i.i.i, i32 noundef 2)
          to label %invoke.cont.i.i.i unwind label %lpad.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.then.i.i.i
  %19 = load void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)*, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker.i.i.i, align 8, !tbaa !143
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* %19, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker4.i.i.i, align 8, !tbaa !143
  %20 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i.i, align 8, !tbaa !83
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %20, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !83
  %phi.cmp.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %20, null
  br label %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i

lpad.i.i.i:                                       ; preds = %if.then.i.i.i
  %21 = landingpad { i8*, i32 }
          cleanup
  %22 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !83
  %tobool.not.i.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %22, null
  br i1 %tobool.not.i.i.i.i, label %common.resume.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %lpad.i.i.i
  %call.i.i.i.i = invoke noundef i1 %22(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, i32 noundef 3)
          to label %common.resume.i.i unwind label %terminate.lpad.i.i.i.i

terminate.lpad.i.i.i.i:                           ; preds = %if.then.i.i.i.i
  %23 = landingpad { i8*, i32 }
          catch i8* null
  %24 = extractvalue { i8*, i32 } %23, 0
  call void @__clang_call_terminate(i8* %24) #31
  unreachable

common.resume.i.i:                                ; preds = %_ZNSt14_Function_baseD2Ev.exit47.i.i, %if.then.i.i.i.i, %lpad.i.i.i
  %common.resume.op.i.i = phi { i8*, i32 } [ %lpad.phi.i, %_ZNSt14_Function_baseD2Ev.exit47.i.i ], [ %21, %if.then.i.i.i.i ], [ %21, %lpad.i.i.i ]
  resume { i8*, i32 } %common.resume.op.i.i

_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i: ; preds = %invoke.cont.i.i.i, %for.body.i.i
  %25 = phi void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* [ undef, %for.body.i.i ], [ %19, %invoke.cont.i.i.i ]
  %26 = phi i1 [ true, %for.body.i.i ], [ %phi.cmp.i.i, %invoke.cont.i.i.i ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %3, i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i, i64 16, i1 false)
  store i64 %add.i29.i.i, i64* %NDItem.sroa.5.0..sroa_idx109.i.i, align 8
  store i64 %add.1.i32.i.i, i64* %NDItem.sroa.6.0..sroa_idx112.i.i, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.7.0..sroa_cast.i.i, i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i, i64 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %LocalItem.sroa.0.i.sroa.0.0.NDItem.sroa.8.0..sroa_cast.i.sroa_cast.i, i8* noundef nonnull align 8 dereferenceable(16) %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i, i64 16, i1 false)
  store i64 %Index.i.i.sroa.0.2, i64* %LocalItem.sroa.0.i.sroa.5.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx41.i, align 8
  store i64 %Index.i.i.sroa.7.2, i64* %LocalItem.sroa.0.i.sroa.6.0.NDItem.sroa.8.0..sroa_cast.i.sroa_idx44.i, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %NDItem.sroa.9.i.i.sroa.0.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast, i8* noundef nonnull align 8 dereferenceable(32) %Group.i.sroa.0.0..sroa_cast, i64 32, i1 false)
  store i64 %agg.tmp.sroa.0.0.copyload.i.i, i64* %NDItem.sroa.9.i.i.sroa.5.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx77, align 8
  store i64 %agg.tmp.sroa.2.0.copyload.i.i, i64* %NDItem.sroa.9.i.i.sroa.6.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_idx80, align 8
  store i64 %retval.sroa.0.0.copyload.i.i, i64* %NDItem.sroa.9.i.i.sroa.7.sroa.0.0.NDItem.sroa.9.i.i.sroa.7.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast.sroa_idx, align 8
  store i64 %storemerge19.i, i64* %NDItem.sroa.9.i.i.sroa.7.sroa.5.0.NDItem.sroa.9.i.i.sroa.7.0.NDItem.sroa.9.0..sroa_cast.i.i.sroa_cast.sroa_idx101, align 8
  br i1 %26, label %if.then.i.i37.i.i, label %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEclES5_.exit.i.i.i

if.then.i.i37.i.i:                                ; preds = %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i
  invoke void @_ZSt25__throw_bad_function_callv() #33
          to label %.noexc.i.i unwind label %lpad.i.loopexit.split-lp.i

.noexc.i.i:                                       ; preds = %if.then.i.i37.i.i
  unreachable

_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEclES5_.exit.i.i.i: ; preds = %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i
  invoke void %25(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"class.cl::sycl::nd_item"* noundef nonnull align 8 dereferenceable(144) %agg.tmp16.i.i)
          to label %invoke.cont.i.i unwind label %lpad.i.loopexit.i

invoke.cont.i.i:                                  ; preds = %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEclES5_.exit.i.i.i
  %27 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !83
  %tobool.not.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %27, null
  br i1 %tobool.not.i.i.i, label %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i, label %if.then.i40.i.i

if.then.i40.i.i:                                  ; preds = %invoke.cont.i.i
  %call.i.i.i = invoke noundef i1 %27(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, i32 noundef 3)
          to label %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i unwind label %terminate.lpad.i.i.i

terminate.lpad.i.i.i:                             ; preds = %if.then.i40.i.i
  %28 = landingpad { i8*, i32 }
          catch i8* null
  %29 = extractvalue { i8*, i32 } %28, 0
  call void @__clang_call_terminate(i8* %29) #31
  unreachable

lpad.i.loopexit.i:                                ; preds = %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEclES5_.exit.i.i.i
  %lpad.loopexit.i = landingpad { i8*, i32 }
          cleanup
  br label %lpad.i.i

lpad.i.loopexit.split-lp.i:                       ; preds = %if.then.i.i37.i.i
  %lpad.loopexit.split-lp.i = landingpad { i8*, i32 }
          cleanup
  br label %lpad.i.i

lpad.i.i:                                         ; preds = %lpad.i.loopexit.split-lp.i, %lpad.i.loopexit.i
  %lpad.phi.i = phi { i8*, i32 } [ %lpad.loopexit.i, %lpad.i.loopexit.i ], [ %lpad.loopexit.split-lp.i, %lpad.i.loopexit.split-lp.i ]
  %30 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !83
  %tobool.not.i42.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %30, null
  br i1 %tobool.not.i42.i.i, label %_ZNSt14_Function_baseD2Ev.exit47.i.i, label %if.then.i45.i.i

if.then.i45.i.i:                                  ; preds = %lpad.i.i
  %call.i44.i.i = invoke noundef i1 %30(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit47.i.i unwind label %terminate.lpad.i46.i.i

terminate.lpad.i46.i.i:                           ; preds = %if.then.i45.i.i
  %31 = landingpad { i8*, i32 }
          catch i8* null
  %32 = extractvalue { i8*, i32 } %31, 0
  call void @__clang_call_terminate(i8* %32) #31
  unreachable

_ZNSt14_Function_baseD2Ev.exit47.i.i:             ; preds = %if.then.i45.i.i, %lpad.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i)
  br label %common.resume.i.i

_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i: ; preds = %if.then.i40.i.i, %invoke.cont.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %2)
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %3)
  %add.i.i = add nuw i64 %Index.i.i.sroa.7.2, 1
  %33 = load i64, i64* %arrayidx3.1.i.i.i.i, align 8, !tbaa !39
  %cmp.i.i = icmp ult i64 %add.i.i, %33
  br i1 %cmp.i.i, label %for.body.i.i, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit, !llvm.loop !195

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit: ; preds = %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i
  %.pre = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !39
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit, %for.body.i24
  %34 = phi i64 [ %.pre, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ %14, %for.body.i24 ]
  %retval.sroa.3.0.copyload.i.i.i146 = phi i64 [ %33, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ %retval.sroa.3.0.copyload.i.i.i145, %for.body.i24 ]
  %35 = phi i64 [ %33, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ 0, %for.body.i24 ]
  %add.i25 = add nuw i64 %Index.i.i.sroa.0.2, 1
  %cmp.i26 = icmp ult i64 %add.i25, %34
  br i1 %cmp.i26, label %for.body.i24, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134, !llvm.loop !196

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i
  %.pre148 = load i64, i64* %arrayidx.i13.i, align 8, !tbaa !39
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit
  %36 = phi i64 [ %.pre148, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134 ], [ %storemerge19.i, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %Group.i.sroa.0.0..sroa_cast)
  %37 = load i64, i64* %arrayidx.i16.i, align 8, !tbaa !39
  %add.i = add i64 %36, %37
  store i64 %add.i, i64* %arrayidx.i13.i, align 8, !tbaa !39
  %38 = load i64, i64* %arrayidx.i15.i, align 8, !tbaa !39
  %cmp.i = icmp ult i64 %add.i, %38
  br i1 %cmp.i, label %for.body.i, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit, !llvm.loop !198

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit
  %.pre149 = load i64, i64* %arrayidx.i14, align 8, !tbaa !39
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit, %for.body
  %39 = phi i64 [ %.pre149, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit ], [ %4, %for.body ]
  %40 = load i64, i64* %arrayidx.i17, align 8, !tbaa !39
  %add = add i64 %39, %40
  store i64 %add, i64* %arrayidx.i14, align 8, !tbaa !39
  %41 = load i64, i64* %arrayidx.i16, align 8, !tbaa !39
  %cmp = icmp ult i64 %add, %41
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !199

for.end:                                          ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit, %entry
  ret void
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #10

; Function Attrs: noreturn
declare dso_local void @_ZSt25__throw_bad_function_callv() local_unnamed_addr #19

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @strcmp(i8* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #18

; Function Attrs: nofree nosync nounwind uwtable
define internal void @_ZNSt17_Function_handlerIFvRKN2cl4sycl7nd_itemILi2EEEEZNS1_7handler15ResetHostKernelIZZ4mainENKUlRS7_E_clES9_EUlNS1_2idILi2EEEE_NS1_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSE_IXT1_ELb1EEEEE5valueEPT_E4typeERKSJ_E20NormalizedKernelTypeE9_M_invokeERKSt9_Any_dataS5_(%"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__functor, %"class.cl::sycl::nd_item"* nocapture noundef nonnull readonly align 8 dereferenceable(144) %__args) #27 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %0 = bitcast %"union.std::_Any_data"* %__functor to %struct.NormalizedKernelType.137**
  %__functor.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %0, align 8, !tbaa !37
  %retval.sroa.0.0..sroa_idx.i.i15.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %__args, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %retval.sroa.0.0.copyload.i.i16.i = load i64, i64* %retval.sroa.0.0..sroa_idx.i.i15.i, align 8
  %retval.sroa.2.0..sroa_idx3.i.i17.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %__args, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %retval.sroa.2.0.copyload.i.i18.i = load i64, i64* %retval.sroa.2.0..sroa_idx3.i.i17.i, align 8
  %agg.tmp.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 0
  %agg.tmp.sroa.0.0.copyload.i = load i64, i64* %agg.tmp.sroa.0.0..sroa_idx.i, align 8, !tbaa.struct !200
  %agg.tmp.sroa.2.0..sroa_idx31.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 1
  %agg.tmp.sroa.2.0.copyload.i = load float*, float** %agg.tmp.sroa.2.0..sroa_idx31.i, align 8, !tbaa.struct !201
  %agg.tmp.sroa.2.0.copyload.i2 = bitcast float* %agg.tmp.sroa.2.0.copyload.i to i8*
  %agg.tmp.sroa.3.0..sroa_idx32.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 2
  %agg.tmp.sroa.3.0.copyload.i = load float*, float** %agg.tmp.sroa.3.0..sroa_idx32.i, align 8, !tbaa.struct !202
  %agg.tmp.sroa.4.0..sroa_idx33.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 3
  %agg.tmp.sroa.4.0.copyload.i = load i64, i64* %agg.tmp.sroa.4.0..sroa_idx33.i, align 8, !tbaa.struct !203
  %agg.tmp.sroa.5.0..sroa_idx34.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 4
  %agg.tmp.sroa.5.0.copyload.i = load float*, float** %agg.tmp.sroa.5.0..sroa_idx34.i, align 8, !tbaa.struct !191
  %agg.tmp.sroa.5.0.copyload.i8 = bitcast float* %agg.tmp.sroa.5.0.copyload.i to i8*
  %cmp.i.i.i.i = icmp ult i64 %retval.sroa.0.0.copyload.i.i16.i, 2147483648
  tail call void @llvm.assume(i1 %cmp.i.i.i.i) #30
  %cmp.i5.i.i.i = icmp ult i64 %retval.sroa.2.0.copyload.i.i18.i, 2147483648
  tail call void @llvm.assume(i1 %cmp.i5.i.i.i) #30
  %cmp22.not.i.i.i = icmp eq i64 %agg.tmp.sroa.0.0.copyload.i, 0
  br i1 %cmp22.not.i.i.i, label %_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit, label %for.body.lr.ph.i.i.i

for.body.lr.ph.i.i.i:                             ; preds = %entry
  %mul.i.i.i = mul i64 %agg.tmp.sroa.4.0.copyload.i, %retval.sroa.0.0.copyload.i.i16.i
  %add.i.i.i = add i64 %mul.i.i.i, %retval.sroa.2.0.copyload.i.i18.i
  %arrayidx.i.i.i = getelementptr inbounds float, float* %agg.tmp.sroa.3.0.copyload.i, i64 %add.i.i.i
  %mul5.i.i.i = mul i64 %agg.tmp.sroa.0.0.copyload.i, %retval.sroa.2.0.copyload.i.i18.i
  %mul10.i.i.i = mul i64 %agg.tmp.sroa.0.0.copyload.i, %retval.sroa.0.0.copyload.i.i16.i
  %min.iters.check = icmp ult i64 %agg.tmp.sroa.0.0.copyload.i, 8
  br i1 %min.iters.check, label %for.body.i.i.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph.i.i.i
  %arrayidx.i.i.i3 = bitcast float* %arrayidx.i.i.i to i8*
  %scevgep = getelementptr float, float* %agg.tmp.sroa.2.0.copyload.i, i64 %mul10.i.i.i
  %scevgep1 = bitcast float* %scevgep to i8*
  %1 = shl nuw nsw i64 %retval.sroa.0.0.copyload.i.i16.i, 2
  %2 = add nuw nsw i64 %1, 4
  %3 = mul i64 %agg.tmp.sroa.0.0.copyload.i, %2
  %uglygep = getelementptr i8, i8* %agg.tmp.sroa.2.0.copyload.i2, i64 %3
  %4 = add i64 %retval.sroa.2.0.copyload.i.i18.i, %mul.i.i.i
  %5 = add i64 %4, 1
  %scevgep4 = getelementptr float, float* %agg.tmp.sroa.3.0.copyload.i, i64 %5
  %scevgep6 = getelementptr float, float* %agg.tmp.sroa.5.0.copyload.i, i64 %mul5.i.i.i
  %scevgep67 = bitcast float* %scevgep6 to i8*
  %6 = shl nuw nsw i64 %retval.sroa.2.0.copyload.i.i18.i, 2
  %7 = add nuw nsw i64 %6, 4
  %8 = mul i64 %agg.tmp.sroa.0.0.copyload.i, %7
  %uglygep9 = getelementptr i8, i8* %agg.tmp.sroa.5.0.copyload.i8, i64 %8
  %bound0 = icmp ult float* %scevgep, %scevgep4
  %bound1 = icmp ugt i8* %uglygep, %arrayidx.i.i.i3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ugt i8* %uglygep9, %scevgep1
  %bound111 = icmp ugt i8* %uglygep, %scevgep67
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.body.i.i.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %agg.tmp.sroa.0.0.copyload.i, -8
  %9 = load float, float* %arrayidx.i.i.i, align 4, !tbaa !8, !alias.scope !204
  %broadcast.splatinsert = insertelement <4 x float> poison, float %9, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert16 = insertelement <4 x float> poison, float %9, i64 0
  %broadcast.splat17 = shufflevector <4 x float> %broadcast.splatinsert16, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %10 = add i64 %index, %mul5.i.i.i
  %11 = getelementptr inbounds float, float* %agg.tmp.sroa.5.0.copyload.i, i64 %10
  %12 = bitcast float* %11 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %12, align 4, !tbaa !8, !alias.scope !207
  %13 = getelementptr inbounds float, float* %11, i64 4
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load13 = load <4 x float>, <4 x float>* %14, align 4, !tbaa !8, !alias.scope !207
  %15 = add i64 %index, %mul10.i.i.i
  %16 = getelementptr inbounds float, float* %agg.tmp.sroa.2.0.copyload.i, i64 %15
  %17 = bitcast float* %16 to <4 x float>*
  %wide.load14 = load <4 x float>, <4 x float>* %17, align 4, !tbaa !8, !alias.scope !209, !noalias !211
  %18 = getelementptr inbounds float, float* %16, i64 4
  %19 = bitcast float* %18 to <4 x float>*
  %wide.load15 = load <4 x float>, <4 x float>* %19, align 4, !tbaa !8, !alias.scope !209, !noalias !211
  %20 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load14)
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat17, <4 x float> %wide.load13, <4 x float> %wide.load15)
  %22 = bitcast float* %16 to <4 x float>*
  store <4 x float> %20, <4 x float>* %22, align 4, !tbaa !8, !alias.scope !209, !noalias !211
  %23 = bitcast float* %18 to <4 x float>*
  store <4 x float> %21, <4 x float>* %23, align 4, !tbaa !8, !alias.scope !209, !noalias !211
  %index.next = add nuw i64 %index, 8
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !212

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %agg.tmp.sroa.0.0.copyload.i, %n.vec
  br i1 %cmp.n, label %_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit, label %for.body.i.i.i.preheader

for.body.i.i.i.preheader:                         ; preds = %vector.memcheck, %for.body.lr.ph.i.i.i, %middle.block
  %j.023.i.i.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.lr.ph.i.i.i ], [ %n.vec, %middle.block ]
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %for.body.i.i.i.preheader, %for.body.i.i.i
  %j.023.i.i.i = phi i64 [ %inc.i.i.i, %for.body.i.i.i ], [ %j.023.i.i.i.ph, %for.body.i.i.i.preheader ]
  %25 = load float, float* %arrayidx.i.i.i, align 4, !tbaa !8
  %add6.i.i.i = add i64 %j.023.i.i.i, %mul5.i.i.i
  %arrayidx7.i.i.i = getelementptr inbounds float, float* %agg.tmp.sroa.5.0.copyload.i, i64 %add6.i.i.i
  %26 = load float, float* %arrayidx7.i.i.i, align 4, !tbaa !8
  %add11.i.i.i = add i64 %j.023.i.i.i, %mul10.i.i.i
  %arrayidx12.i.i.i = getelementptr inbounds float, float* %agg.tmp.sroa.2.0.copyload.i, i64 %add11.i.i.i
  %27 = load float, float* %arrayidx12.i.i.i, align 4, !tbaa !8
  %28 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %27) #30
  store float %28, float* %arrayidx12.i.i.i, align 4, !tbaa !8
  %inc.i.i.i = add nuw i64 %j.023.i.i.i, 1
  %exitcond.not.i.i.i = icmp eq i64 %inc.i.i.i, %agg.tmp.sroa.0.0.copyload.i
  br i1 %exitcond.not.i.i.i, label %_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit, label %for.body.i.i.i, !llvm.loop !213

_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit: ; preds = %for.body.i.i.i, %middle.block, %entry
  ret void
}

; Function Attrs: mustprogress uwtable
define internal noundef i1 @_ZNSt14_Function_base13_Base_managerIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS3_E_clES5_EUlNS2_2idILi2EEEE_NS2_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSA_IXT1_ELb1EEEEE5valueEPT_E4typeERKSF_E20NormalizedKernelTypeE10_M_managerERSt9_Any_dataRKSN_St18_Manager_operation(%"union.std::_Any_data"* nocapture noundef nonnull align 8 dereferenceable(16) %__dest, %"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__source, i32 noundef %__op) #20 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry:
  switch i32 %__op, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  %0 = bitcast %"union.std::_Any_data"* %__dest to %"class.std::type_info"**
  store %"class.std::type_info"* bitcast ({ i8*, i8* }* @_ZTIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType to %"class.std::type_info"*), %"class.std::type_info"** %0, align 8, !tbaa !37
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %1 = bitcast %"union.std::_Any_data"* %__source to %struct.NormalizedKernelType.137**
  %__source.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %1, align 8, !tbaa !37
  %2 = bitcast %"union.std::_Any_data"* %__dest to %struct.NormalizedKernelType.137**
  store %struct.NormalizedKernelType.137* %__source.val, %struct.NormalizedKernelType.137** %2, align 8, !tbaa !37
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %3 = bitcast %"union.std::_Any_data"* %__source to i8**
  %__source.val12 = load i8*, i8** %3, align 8
  %call.i = tail call noalias noundef nonnull dereferenceable(40) i8* @_Znwm(i64 noundef 40) #32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %call.i, i8* noundef nonnull align 8 dereferenceable(40) %__source.val12, i64 40, i1 false), !tbaa.struct !200
  %4 = bitcast %"union.std::_Any_data"* %__dest to i8**
  store i8* %call.i, i8** %4, align 8, !tbaa !37
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %5 = bitcast %"union.std::_Any_data"* %__dest to %struct.NormalizedKernelType.137**
  %__dest.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %5, align 8, !tbaa !37
  %isnull.i = icmp eq %struct.NormalizedKernelType.137* %__dest.val, null
  br i1 %isnull.i, label %sw.epilog, label %delete.notnull.i

delete.notnull.i:                                 ; preds = %sw.bb5
  %6 = bitcast %struct.NormalizedKernelType.137* %__dest.val to i8*
  tail call void @_ZdlPv(i8* noundef %6) #34
  br label %sw.epilog

sw.epilog:                                        ; preds = %delete.notnull.i, %sw.bb5, %entry, %sw.bb4, %sw.bb1, %sw.bb
  ret i1 false
}

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), double noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_gemm_sycl1_89ae99.cpp() #12 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #30
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #28

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #29

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #28

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #28

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #2 = { nofree nounwind }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind writeonly uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #4 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly mustprogress nofree nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #7 = { argmemonly mustprogress nofree nosync nounwind readonly willreturn uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #8 = { norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #9 = { inlinehint mustprogress uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #10 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #11 = { mustprogress nofree nounwind willreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #12 = { uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #13 = { inlinehint nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #14 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #15 = { noinline noreturn nounwind }
attributes #16 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #17 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #18 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #19 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #20 = { mustprogress uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #21 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #22 = { nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #23 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #24 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #25 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #26 = { mustprogress nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #27 = { nofree nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #28 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #29 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #30 = { nounwind }
attributes #31 = { noreturn nounwind }
attributes #32 = { builtin allocsize(0) }
attributes #33 = { noreturn }
attributes #34 = { builtin nounwind }

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
!24 = distinct !{!24, !13, !14}
!25 = !{!26}
!26 = distinct !{!26, !27}
!27 = distinct !{!27, !"LVerDomain"}
!28 = !{!29}
!29 = distinct !{!29, !27}
!30 = !{!31}
!31 = distinct !{!31, !27}
!32 = !{!26, !29}
!33 = distinct !{!33, !13, !14}
!34 = distinct !{!34, !13}
!35 = distinct !{!35, !13}
!36 = distinct !{!36, !13}
!37 = !{!38, !38, i64 0}
!38 = !{!"any pointer", !10, i64 0}
!39 = !{!40, !40, i64 0}
!40 = !{!"long", !10, i64 0}
!41 = !{!42, !38, i64 0}
!42 = !{!"_ZTSNSt12_Vector_baseISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEESaIS5_EE17_Vector_impl_dataE", !38, i64 0, !38, i64 8, !38, i64 16}
!43 = !{!42, !38, i64 8}
!44 = !{!45, !38, i64 0}
!45 = !{!"_ZTSSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE", !38, i64 0}
!46 = !{!47, !47, i64 0}
!47 = !{!"int", !10, i64 0}
!48 = !{!49, !49, i64 0}
!49 = !{!"vtable pointer", !11, i64 0}
!50 = distinct !{!50, !13}
!51 = !{!52, !38, i64 0}
!52 = !{!"_ZTSN2cl4sycl6detail13code_locationE", !38, i64 0, !38, i64 8, !40, i64 16, !40, i64 24}
!53 = !{!54}
!54 = distinct !{!54, !55, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!55 = distinct !{!55, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!56 = !{!52, !38, i64 8}
!57 = !{!58}
!58 = distinct !{!58, !59, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!59 = distinct !{!59, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!60 = !{!61}
!61 = distinct !{!61, !62, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!62 = distinct !{!62, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!63 = distinct !{!63, !13, !14}
!64 = distinct !{!64, !13, !16, !14}
!65 = distinct !{!65, !13, !14}
!66 = distinct !{!66, !13, !16, !14}
!67 = distinct !{!67, !13, !14}
!68 = distinct !{!68, !13, !16, !14}
!69 = distinct !{!69, !13, !14}
!70 = distinct !{!70, !13, !16, !14}
!71 = distinct !{!71, !13, !14}
!72 = distinct !{!72, !13, !16, !14}
!73 = distinct !{!73, !13, !14}
!74 = distinct !{!74, !13, !16, !14}
!75 = !{!76}
!76 = distinct !{!76, !77, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!77 = distinct !{!77, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!78 = !{!79}
!79 = distinct !{!79, !80, !"_ZN2cl4sycl5queue6submitIZ4mainEUlRNS0_7handlerEE_EENS0_5eventET_RKNS0_6detail13code_locationE: %agg.result"}
!80 = distinct !{!80, !"_ZN2cl4sycl5queue6submitIZ4mainEUlRNS0_7handlerEE_EENS0_5eventET_RKNS0_6detail13code_locationE"}
!81 = !{!82, !38, i64 24}
!82 = !{!"_ZTSSt8functionIFvRN2cl4sycl7handlerEEE", !38, i64 24}
!83 = !{!84, !38, i64 16}
!84 = !{!"_ZTSSt14_Function_base", !10, i64 0, !38, i64 16}
!85 = !{!86}
!86 = distinct !{!86, !87, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!87 = distinct !{!87, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!88 = distinct !{!88, !13, !14}
!89 = !{!90}
!90 = distinct !{!90, !91}
!91 = distinct !{!91, !"LVerDomain"}
!92 = !{!93}
!93 = distinct !{!93, !91}
!94 = !{!95}
!95 = distinct !{!95, !91}
!96 = !{!90, !93}
!97 = distinct !{!97, !13, !14}
!98 = !{!99, !38, i64 240}
!99 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !38, i64 216, !10, i64 224, !100, i64 225, !38, i64 232, !38, i64 240, !38, i64 248, !38, i64 256}
!100 = !{!"bool", !10, i64 0}
!101 = !{!102, !10, i64 56}
!102 = !{!"_ZTSSt5ctypeIcE", !38, i64 16, !100, i64 24, !38, i64 32, !38, i64 40, !38, i64 48, !10, i64 56, !10, i64 57, !10, i64 313, !10, i64 569}
!103 = !{!10, !10, i64 0}
!104 = !{!105, !38, i64 0}
!105 = !{!"_ZTSZ4mainEUlRN2cl4sycl7handlerEE_", !38, i64 0, !38, i64 8, !38, i64 16, !38, i64 24, !38, i64 32, !38, i64 40}
!106 = !{!105, !38, i64 8}
!107 = !{!105, !38, i64 16}
!108 = !{!105, !38, i64 24}
!109 = !{!105, !38, i64 32}
!110 = !{!105, !38, i64 40}
!111 = !{!112, !127, i64 360}
!112 = !{!"_ZTSN2cl4sycl7handlerE", !113, i64 0, !114, i64 16, !115, i64 40, !116, i64 64, !117, i64 88, !118, i64 112, !119, i64 136, !119, i64 160, !120, i64 184, !121, i64 208, !124, i64 312, !126, i64 344, !127, i64 360, !38, i64 368, !38, i64 376, !40, i64 384, !128, i64 392, !129, i64 416, !132, i64 424, !40, i64 432, !135, i64 440, !138, i64 448, !138, i64 472, !100, i64 496, !52, i64 504, !100, i64 536, !139, i64 544}
!113 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail10queue_implEE"}
!114 = !{!"_ZTSSt6vectorIS_IcSaIcEESaIS1_EE"}
!115 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail16AccessorImplHostEESaIS5_EE"}
!116 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail21LocalAccessorImplHostEESaIS5_EE"}
!117 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail11stream_implEESaIS5_EE"}
!118 = !{!"_ZTSSt6vectorISt10shared_ptrIKvESaIS2_EE"}
!119 = !{!"_ZTSSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE"}
!120 = !{!"_ZTSSt6vectorIPN2cl4sycl6detail16AccessorImplHostESaIS4_EE"}
!121 = !{!"_ZTSN2cl4sycl6detail8NDRDescTE", !122, i64 0, !122, i64 24, !123, i64 48, !122, i64 72, !40, i64 96}
!122 = !{!"_ZTSN2cl4sycl5rangeILi3EEE"}
!123 = !{!"_ZTSN2cl4sycl2idILi3EEE"}
!124 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !125, i64 0, !40, i64 8, !10, i64 16}
!125 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !38, i64 0}
!126 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail11kernel_implEE"}
!127 = !{!"_ZTSN2cl4sycl6detail2CG6CGTYPEE", !10, i64 0}
!128 = !{!"_ZTSSt6vectorIcSaIcEE"}
!129 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE", !130, i64 0}
!130 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE", !131, i64 0}
!131 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EEE"}
!132 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EE", !133, i64 0}
!133 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EE", !134, i64 0}
!134 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EEE"}
!135 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EE", !136, i64 0}
!136 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EE", !137, i64 0}
!137 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EEE"}
!138 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail10event_implEESaIS5_EE"}
!139 = !{!"_ZTSN2cl4sycl5eventE", !140, i64 0}
!140 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail10event_implEE"}
!141 = !{!125, !38, i64 0}
!142 = !{!124, !38, i64 0}
!143 = !{!144, !38, i64 24}
!144 = !{!"_ZTSSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE", !38, i64 24}
!145 = !{!146, !38, i64 8}
!146 = !{!"_ZTSSt9type_info", !38, i64 8}
!147 = !{!148, !38, i64 0}
!148 = !{!"_ZTSNSt12_Vector_baseIN2cl4sycl6detail7ArgDescESaIS3_EE17_Vector_impl_dataE", !38, i64 0, !38, i64 8, !38, i64 16}
!149 = !{!148, !38, i64 8}
!150 = !{!124, !40, i64 8}
!151 = !{!112, !40, i64 432}
!152 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !37, i64 24, i64 8, !37, i64 32, i64 8, !37, i64 40, i64 8, !37}
!153 = !{!154, !38, i64 0}
!154 = !{!"_ZTSSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EE", !38, i64 0, !45, i64 8}
!155 = !{!156}
!156 = distinct !{!156, !157, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!157 = distinct !{!157, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!158 = !{!159}
!159 = distinct !{!159, !160, !"_ZN2cl4sycl6detailL12codeToStringB5cxx11Ei: %agg.result"}
!160 = distinct !{!160, !"_ZN2cl4sycl6detailL12codeToStringB5cxx11Ei"}
!161 = !{!162}
!162 = distinct !{!162, !163, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!163 = distinct !{!163, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!164 = !{!162, !159}
!165 = !{!166}
!166 = distinct !{!166, !167, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!167 = distinct !{!167, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!168 = !{!166, !159}
!169 = !{!170}
!170 = distinct !{!170, !171, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!171 = distinct !{!171, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!172 = !{!170, !159}
!173 = !{!174}
!174 = distinct !{!174, !175, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_: %agg.result"}
!175 = distinct !{!175, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_"}
!176 = !{!177, !47, i64 40}
!177 = !{!"_ZTSN2cl4sycl9exceptionE", !124, i64 8, !47, i64 40, !178, i64 48}
!178 = !{!"_ZTSSt10shared_ptrIN2cl4sycl7contextEE"}
!179 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !37, i64 24, i64 4, !46, i64 28, i64 4, !46}
!180 = !{!121, !40, i64 96}
!181 = !{!182}
!182 = distinct !{!182, !183, !"_ZN2cl4syclmlERKNS0_5rangeILi3EEES4_: %agg.result"}
!183 = distinct !{!183, !"_ZN2cl4syclmlERKNS0_5rangeILi3EEES4_"}
!184 = distinct !{!184, !13}
!185 = distinct !{!185, !13}
!186 = distinct !{!186, !13}
!187 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !37, i64 24, i64 8, !37, i64 32, i64 8, !37}
!188 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !37, i64 24, i64 8, !37}
!189 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !37}
!190 = !{i64 0, i64 8, !37, i64 8, i64 8, !37}
!191 = !{i64 0, i64 8, !37}
!192 = !{!193}
!193 = distinct !{!193, !194, !"_ZN2cl4sycl6detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE: %agg.result"}
!194 = distinct !{!194, !"_ZN2cl4sycl6detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE"}
!195 = distinct !{!195, !13}
!196 = distinct !{!196, !13, !197}
!197 = !{!"llvm.loop.unswitch.partial.disable"}
!198 = distinct !{!198, !13}
!199 = distinct !{!199, !13}
!200 = !{i64 0, i64 8, !39, i64 8, i64 8, !37, i64 16, i64 8, !37, i64 24, i64 8, !39, i64 32, i64 8, !37}
!201 = !{i64 0, i64 8, !37, i64 8, i64 8, !37, i64 16, i64 8, !39, i64 24, i64 8, !37}
!202 = !{i64 0, i64 8, !37, i64 8, i64 8, !39, i64 16, i64 8, !37}
!203 = !{i64 0, i64 8, !39, i64 8, i64 8, !37}
!204 = !{!205}
!205 = distinct !{!205, !206}
!206 = distinct !{!206, !"LVerDomain"}
!207 = !{!208}
!208 = distinct !{!208, !206}
!209 = !{!210}
!210 = distinct !{!210, !206}
!211 = !{!205, !208}
!212 = distinct !{!212, !13, !14}
!213 = distinct !{!213, !13, !14}

; __CLANG_OFFLOAD_BUNDLE____END__ host-aarch64-unknown-linux-gnu
