
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
entry.split:
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

if.end.i:                                         ; preds = %entry.split
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

_ZNK2cl4sycl6detail18RoundedRangeKernelINS0_4itemILi2ELb1EEELi2EZZ4mainENKUlRNS0_7handlerEE_clES6_EUlNS0_2idILi2EEEE_EclES4_.exit: ; preds = %for.cond.i.i, %entry.split
  call void @__itt_offload_wi_finish_wrapper()
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: norecurse
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_(i64 noundef %_arg_N, float addrspace(1)* noundef align 4 %_arg_C, float addrspace(1)* noundef align 4 %_arg_A, i64 noundef %_arg_K, float addrspace(1)* noundef align 4 %_arg_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !25 !sycl_kernel_omit_args !26 {
entry.split:
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

for.cond.i:                                       ; preds = %for.body.i, %entry.split
  %j.0.i = phi i64 [ 0, %entry.split ], [ %inc.i, %for.body.i ]
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
; ModuleID = '/tmp/gemm-sycl1-d641cb.cpp'
source_filename = "/tmp/gemm-sycl1-d641cb.cpp"
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
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_gemm_sycl1_d641cb.cpp, i8* null }]

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

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind uwtable
define dso_local void @_Z11naiveMatmulPfS_S_mmm(float* nocapture noundef %C, float* nocapture noundef readonly %A, float* nocapture noundef readonly %B, i64 noundef %M, i64 noundef %N, i64 noundef %K) local_unnamed_addr #6 {
polly.split_new_and_old:
  %Packed_B = alloca [256 x [512 x [8 x float]]], align 64
  %Packed_A = alloca [24 x [512 x [4 x float]]], align 64
  %0 = icmp sge i64 %N, %K
  %1 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %K, i64 -1)
  %.obit = extractvalue { i64, i1 } %1, 1
  %.res = extractvalue { i64, i1 } %1, 0
  %polly.access.mul.B = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %N)
  %polly.access.mul.B.obit = extractvalue { i64, i1 } %polly.access.mul.B, 1
  %polly.overflow.state67 = or i1 %.obit, %polly.access.mul.B.obit
  %polly.access.mul.B.res = extractvalue { i64, i1 } %polly.access.mul.B, 0
  %polly.access.add.B = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.B.res, i64 %K)
  %polly.access.add.B.obit = extractvalue { i64, i1 } %polly.access.add.B, 1
  %polly.overflow.state68 = or i1 %polly.overflow.state67, %polly.access.add.B.obit
  %polly.access.add.B.res = extractvalue { i64, i1 } %polly.access.add.B, 0
  %polly.access.B = getelementptr float, float* %B, i64 %polly.access.add.B.res
  %2 = icmp ule float* %polly.access.B, %C
  %3 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %M, i64 -1)
  %.obit71 = extractvalue { i64, i1 } %3, 1
  %polly.overflow.state72 = or i1 %.obit71, %polly.overflow.state68
  %.res73 = extractvalue { i64, i1 } %3, 0
  %polly.access.mul.C74 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res73, i64 %N)
  %polly.access.mul.C.obit75 = extractvalue { i64, i1 } %polly.access.mul.C74, 1
  %polly.overflow.state76 = or i1 %polly.access.mul.C.obit75, %polly.overflow.state72
  %polly.access.mul.C.res77 = extractvalue { i64, i1 } %polly.access.mul.C74, 0
  %polly.access.add.C78 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.C.res77, i64 %K)
  %polly.access.add.C.obit79 = extractvalue { i64, i1 } %polly.access.add.C78, 1
  %polly.overflow.state80 = or i1 %polly.access.add.C.obit79, %polly.overflow.state76
  %polly.access.add.C.res81 = extractvalue { i64, i1 } %polly.access.add.C78, 0
  %polly.access.C82 = getelementptr float, float* %C, i64 %polly.access.add.C.res81
  %4 = icmp ule float* %polly.access.C82, %B
  %5 = or i1 %4, %2
  %6 = and i1 %0, %5
  %polly.access.mul.A = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res73, i64 %K)
  %polly.access.mul.A.obit = extractvalue { i64, i1 } %polly.access.mul.A, 1
  %polly.overflow.state95 = or i1 %polly.access.mul.A.obit, %polly.overflow.state80
  %polly.access.mul.A.res = extractvalue { i64, i1 } %polly.access.mul.A, 0
  %polly.access.add.A = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.A.res, i64 %K)
  %polly.access.add.A.obit = extractvalue { i64, i1 } %polly.access.add.A, 1
  %polly.overflow.state96 = or i1 %polly.access.add.A.obit, %polly.overflow.state95
  %polly.access.add.A.res = extractvalue { i64, i1 } %polly.access.add.A, 0
  %polly.access.A = getelementptr float, float* %A, i64 %polly.access.add.A.res
  %7 = icmp ule float* %polly.access.A, %C
  %8 = icmp ule float* %polly.access.C82, %A
  %9 = or i1 %7, %8
  %10 = and i1 %9, %6
  %polly.rtc.overflown = xor i1 %polly.overflow.state96, true
  %polly.rtc.result = and i1 %10, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.cond, label %entry.split

entry.split:                                      ; preds = %polly.split_new_and_old
  %cmp51.not = icmp eq i64 %M, 0
  %cmp348.not = icmp eq i64 %K, 0
  %or.cond = or i1 %cmp51.not, %cmp348.not
  br i1 %or.cond, label %for.cond.cleanup, label %for.cond1.preheader.us.preheader

for.cond1.preheader.us.preheader:                 ; preds = %entry.split
  %min.iters.check = icmp ult i64 %K, 8
  %n.vec = and i64 %K, -8
  %cmp.n = icmp eq i64 %n.vec, %K
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.cond.cleanup4_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.cond.cleanup4_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %11 = mul i64 %indvars.iv60, %N
  %scevgep = getelementptr float, float* %C, i64 %11
  %12 = add i64 %11, %K
  %scevgep3781 = getelementptr float, float* %C, i64 %12
  %13 = mul i64 %indvars.iv60, %K
  %14 = add i64 %13, 1
  %mul.us = mul i64 %indvars.iv60, %K
  %mul20.us = mul i64 %indvars.iv60, %N
  br label %for.cond6.preheader.us

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body10.us ], [ %indvars.iv.ph, %for.body10.us.preheader ]
  %15 = load float, float* %arrayidx.us, align 4, !tbaa !8
  %add16.us = add i64 %indvars.iv, %mul14.us
  %arrayidx17.us = getelementptr inbounds float, float* %B, i64 %add16.us
  %16 = load float, float* %arrayidx17.us, align 4, !tbaa !8
  %add22.us = add i64 %indvars.iv, %mul20.us
  %arrayidx23.us = getelementptr inbounds float, float* %C, i64 %add22.us
  %17 = load float, float* %arrayidx23.us, align 4, !tbaa !8
  %18 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %17)
  store float %18, float* %arrayidx23.us, align 4, !tbaa !8
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
  %19 = mul i64 %indvars.iv56, %N
  %20 = add i64 %19, %K
  %scevgep3789 = getelementptr float, float* %B, i64 %20
  %scevgep3787 = getelementptr float, float* %B, i64 %19
  %21 = add i64 %14, %indvars.iv56
  %scevgep3785 = getelementptr float, float* %A, i64 %21
  %22 = add i64 %13, %indvars.iv56
  %scevgep3783 = getelementptr float, float* %A, i64 %22
  %bound0 = icmp ult float* %scevgep, %scevgep3785
  %bound1 = icmp ult float* %scevgep3783, %scevgep3781
  %found.conflict = and i1 %bound0, %bound1
  %bound03791 = icmp ult float* %scevgep, %scevgep3789
  %bound13792 = icmp ult float* %scevgep3787, %scevgep3781
  %found.conflict3793 = and i1 %bound03791, %bound13792
  %conflict.rdx = or i1 %found.conflict, %found.conflict3793
  br i1 %conflict.rdx, label %for.body10.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %23 = load float, float* %arrayidx.us, align 4, !tbaa !8, !alias.scope !25
  %broadcast.splatinsert = insertelement <4 x float> poison, float %23, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert3797 = insertelement <4 x float> poison, float %23, i64 0
  %broadcast.splat3798 = shufflevector <4 x float> %broadcast.splatinsert3797, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %24 = add i64 %index, %mul14.us
  %25 = getelementptr inbounds float, float* %B, i64 %24
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %26, align 4, !tbaa !8, !alias.scope !28
  %27 = getelementptr inbounds float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load3794 = load <4 x float>, <4 x float>* %28, align 4, !tbaa !8, !alias.scope !28
  %29 = add i64 %index, %mul20.us
  %30 = getelementptr inbounds float, float* %C, i64 %29
  %31 = bitcast float* %30 to <4 x float>*
  %wide.load3795 = load <4 x float>, <4 x float>* %31, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %32 = getelementptr inbounds float, float* %30, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  %wide.load3796 = load <4 x float>, <4 x float>* %33, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %34 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load3795)
  %35 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat3798, <4 x float> %wide.load3794, <4 x float> %wide.load3796)
  %36 = bitcast float* %30 to <4 x float>*
  store <4 x float> %34, <4 x float>* %36, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %37 = bitcast float* %32 to <4 x float>*
  store <4 x float> %35, <4 x float>* %37, align 4, !tbaa !8, !alias.scope !30, !noalias !32
  %index.next = add nuw i64 %index, 8
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !33

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

for.cond.cleanup:                                 ; preds = %for.cond1.for.cond.cleanup4_crit_edge.us, %polly.loop_exit129, %polly.cond, %entry.split
  ret void

polly.cond:                                       ; preds = %polly.split_new_and_old
  %39 = icmp sgt i64 %M, 0
  %polly.loop_guard = icmp sgt i64 %K, 0
  %or.cond3771 = and i1 %39, %polly.loop_guard
  br i1 %or.cond3771, label %polly.loop_preheader128.preheader, label %for.cond.cleanup

polly.loop_preheader128.preheader:                ; preds = %polly.cond
  %polly.fdiv_q.shr = ashr i64 %.res, 11
  %pexp.p_div_q3545 = lshr i64 %.res, 9
  %40 = add nsw i64 %M, -1
  %pexp.fdiv_q.43765 = udiv i64 %40, 96
  %pexp.pdiv_r1713 = and i64 %K, 7
  %41 = icmp ne i64 %pexp.pdiv_r1713, 0
  %pexp.p_div_q1903612 = lshr i64 %K, 3
  %pexp.p_div_q1993613 = lshr i64 %M, 2
  %pexp.pdiv_r792 = and i64 %M, 3
  %42 = icmp ne i64 %pexp.pdiv_r792, 0
  %pexp.pdiv_r1229 = and i64 %40, 3
  %43 = sub nsw i64 %M, %pexp.pdiv_r1229
  %44 = add nsw i64 %43, -1
  %pexp.p_div_q12323614 = lshr i64 %40, 2
  %45 = mul i64 %44, %N
  %46 = icmp ugt i64 %pexp.pdiv_r792, 1
  %47 = mul i64 %43, %N
  %48 = add nuw nsw i64 %M, 1
  %49 = and i64 %48, 3
  %50 = icmp eq i64 %49, 0
  %51 = add nsw i64 %M, -3
  %pexp.div = ashr exact i64 %51, 2
  %52 = mul i64 %40, %N
  %pexp.pdiv_r2857 = and i64 %.res, 7
  %53 = sub nsw i64 %K, %pexp.pdiv_r2857
  %54 = add nsw i64 %53, -1
  %pexp.p_div_q28673547 = lshr i64 %.res, 3
  %55 = icmp ugt i64 %pexp.pdiv_r1713, 1
  %56 = add nsw i64 %K, -2
  %pexp.p_div_q28923565 = lshr i64 %56, 3
  %.not3566 = icmp eq i64 %pexp.pdiv_r1713, 2
  %57 = add nsw i64 %K, -3
  %pexp.p_div_q29173567 = lshr i64 %57, 3
  %58 = icmp ugt i64 %pexp.pdiv_r1713, 3
  %.not3568 = icmp eq i64 %pexp.pdiv_r1713, 4
  %59 = icmp ugt i64 %pexp.pdiv_r1713, 5
  %60 = add nuw nsw i64 %K, 1
  %61 = and i64 %60, 7
  %62 = icmp eq i64 %61, 0
  %63 = add nsw i64 %K, -7
  %pexp.div3016 = ashr exact i64 %63, 3
  %64 = add i64 %52, 1
  %smax3737 = call i64 @llvm.smax.i64(i64 %polly.fdiv_q.shr, i64 0)
  br label %polly.loop_preheader128

polly.loop_exit129:                               ; preds = %polly.loop_exit158.loopexit.us
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next3715 = add nsw i64 %indvars.iv3714, -256
  %indvars.iv.next3728 = add nsw i64 %indvars.iv3727, -256
  %exitcond3738.not = icmp eq i64 %polly.indvar, %smax3737
  br i1 %exitcond3738.not, label %for.cond.cleanup, label %polly.loop_preheader128

polly.loop_preheader128:                          ; preds = %polly.loop_preheader128.preheader, %polly.loop_exit129
  %indvars.iv3727 = phi i64 [ %pexp.p_div_q28673547, %polly.loop_preheader128.preheader ], [ %indvars.iv.next3728, %polly.loop_exit129 ]
  %indvars.iv3714 = phi i64 [ %pexp.p_div_q1903612, %polly.loop_preheader128.preheader ], [ %indvars.iv.next3715, %polly.loop_exit129 ]
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader128.preheader ], [ %polly.indvar_next, %polly.loop_exit129 ]
  %65 = shl nuw i64 %polly.indvar, 11
  %66 = or i64 %65, 2047
  %smin3811 = call i64 @llvm.smin.i64(i64 %66, i64 %.res)
  %smax = call i64 @llvm.smax.i64(i64 %smin3811, i64 %65)
  %67 = mul nsw i64 %polly.indvar, -2048
  %68 = or i64 %67, 1
  %69 = add i64 %smax, %68
  %smin3729 = call i64 @llvm.smin.i64(i64 %indvars.iv3727, i64 255)
  %smin3716 = call i64 @llvm.smin.i64(i64 %indvars.iv3714, i64 256)
  %70 = call i64 @llvm.smax.i64(i64 %smin3716, i64 1)
  %71 = shl nsw i64 %polly.indvar, 11
  %72 = or i64 %71, 2047
  %73 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %72)
  %polly.loop_guard145.not = icmp sgt i64 %71, %73
  %polly.loop_guard145.not.fr = freeze i1 %polly.loop_guard145.not
  %74 = mul nsw i64 %polly.indvar, -256
  %75 = or i64 %71, 7
  %76 = icmp sge i64 %75, %K
  %77 = icmp sge i64 %72, %K
  %78 = and i1 %41, %77
  %79 = add nsw i64 %74, %pexp.p_div_q1903612
  %polly.loop_guard195 = icmp slt i64 %79, 1
  %80 = add nsw i64 %74, %pexp.p_div_q28673547
  %polly.access.mul.Packed_B2868 = shl nsw i64 %80, 9
  %81 = add nsw i64 %74, %pexp.p_div_q28923565
  %polly.access.mul.Packed_B2893 = shl nsw i64 %81, 9
  %82 = add nsw i64 %74, %pexp.p_div_q29173567
  %polly.access.mul.Packed_B2918 = shl nsw i64 %82, 9
  %83 = add nsw i64 %74, %pexp.div3016
  %polly.access.mul.Packed_B3017 = shl nsw i64 %83, 9
  %84 = tail call i64 @llvm.smin.i64(i64 %80, i64 255)
  %polly.loop_guard2328 = icmp sgt i64 %84, -1
  %85 = or i64 %71, 2
  %.not3592 = icmp sgt i64 %85, %K
  %86 = or i64 %71, 1
  %87 = or i64 %71, 3
  %.not3608 = icmp sgt i64 %87, %K
  %88 = or i64 %71, 4
  %.not3609 = icmp sgt i64 %88, %K
  %89 = or i64 %71, 5
  %.not3610 = icmp sgt i64 %89, %K
  %90 = or i64 %71, 6
  %.not3611 = icmp sgt i64 %90, %K
  %91 = icmp eq i64 %75, %K
  %min.iters.check3814 = icmp ult i64 %69, 2
  %n.vec3817 = and i64 %69, -2
  %ind.end3819 = add i64 %71, %n.vec3817
  %cmp.n3820 = icmp eq i64 %69, %n.vec3817
  br label %polly.loop_if133.us

polly.loop_if133.us:                              ; preds = %polly.loop_preheader128, %polly.loop_exit158.loopexit.us
  %indvars.iv3702 = phi i64 [ %.res, %polly.loop_preheader128 ], [ %indvars.iv.next3703, %polly.loop_exit158.loopexit.us ]
  %indvars.iv3692 = phi i64 [ 511, %polly.loop_preheader128 ], [ %indvars.iv.next3693, %polly.loop_exit158.loopexit.us ]
  %polly.indvar130.us = phi i64 [ 0, %polly.loop_preheader128 ], [ %polly.indvar_next131.us, %polly.loop_exit158.loopexit.us ]
  %smin = call i64 @llvm.smin.i64(i64 %indvars.iv3692, i64 %.res)
  %92 = mul nsw i64 %polly.indvar130.us, -512
  %93 = or i64 %92, 1
  %94 = add i64 %smin, %93
  %smin3731 = call i64 @llvm.smin.i64(i64 %indvars.iv3702, i64 511)
  %smin3696 = call i64 @llvm.smin.i64(i64 %indvars.iv3692, i64 %.res)
  %95 = shl nsw i64 %polly.indvar130.us, 9
  %96 = or i64 %95, 511
  %97 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %96)
  %polly.loop_guard137.not.us = icmp sgt i64 %95, %97
  br i1 %polly.loop_guard137.not.us, label %polly.loop_if155.us, label %polly.loop_if141.preheader.us

polly.loop_if141.us3626:                          ; preds = %polly.loop_if141.preheader.us, %polly.loop_exit144.loopexit.us
  %polly.indvar138.us3627 = phi i64 [ %polly.indvar_next139.us3653, %polly.loop_exit144.loopexit.us ], [ %95, %polly.loop_if141.preheader.us ]
  %polly.access.mul.B149.us = mul nsw i64 %polly.indvar138.us3627, %N
  br i1 %min.iters.check3814, label %polly.loop_header142.us.preheader, label %vector.body3821

vector.body3821:                                  ; preds = %polly.loop_if141.us3626, %vector.body3821
  %index3822 = phi i64 [ %index.next3826, %vector.body3821 ], [ 0, %polly.loop_if141.us3626 ]
  %offset.idx3823 = add i64 %71, %index3822
  %induction3825 = or i64 %offset.idx3823, 1
  %98 = add nsw i64 %offset.idx3823, %polly.access.mul.B149.us
  %99 = add nsw i64 %induction3825, %polly.access.mul.B149.us
  %100 = getelementptr float, float* %B, i64 %98
  %101 = getelementptr float, float* %B, i64 %99
  %102 = load float, float* %100, align 4, !alias.scope !36, !noalias !39
  %103 = load float, float* %101, align 4, !alias.scope !36, !noalias !39
  %104 = lshr i64 %offset.idx3823, 3
  %105 = lshr i64 %offset.idx3823, 3
  %106 = add i64 %289, %104
  %107 = add i64 %289, %105
  %108 = shl i64 %106, 9
  %109 = shl i64 %107, 9
  %110 = add i64 %108, %polly.indvar138.us3627
  %111 = add i64 %109, %polly.indvar138.us3627
  %112 = shl nsw i64 %110, 3
  %113 = shl nsw i64 %111, 3
  %114 = and i64 %offset.idx3823, 6
  %115 = and i64 %induction3825, 7
  %116 = or i64 %112, %114
  %117 = or i64 %113, %115
  %118 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %116
  %119 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %117
  store float %102, float* %118, align 8, !alias.scope !44, !noalias !45
  store float %103, float* %119, align 4, !alias.scope !44, !noalias !45
  %index.next3826 = add nuw i64 %index3822, 2
  %120 = icmp eq i64 %index.next3826, %n.vec3817
  br i1 %120, label %middle.block3812, label %vector.body3821, !llvm.loop !46

middle.block3812:                                 ; preds = %vector.body3821
  br i1 %cmp.n3820, label %polly.loop_exit144.loopexit.us, label %polly.loop_header142.us.preheader

polly.loop_header142.us.preheader:                ; preds = %polly.loop_if141.us3626, %middle.block3812
  %polly.indvar146.us.ph = phi i64 [ %71, %polly.loop_if141.us3626 ], [ %ind.end3819, %middle.block3812 ]
  br label %polly.loop_header142.us

polly.loop_header142.us:                          ; preds = %polly.loop_header142.us.preheader, %polly.loop_header142.us
  %polly.indvar146.us = phi i64 [ %polly.indvar_next147.us, %polly.loop_header142.us ], [ %polly.indvar146.us.ph, %polly.loop_header142.us.preheader ]
  %polly.access.add.B150.us = add nsw i64 %polly.indvar146.us, %polly.access.mul.B149.us
  %polly.access.B151.us = getelementptr float, float* %B, i64 %polly.access.add.B150.us
  %polly.access.B151.load.us = load float, float* %polly.access.B151.us, align 4, !alias.scope !36, !noalias !39
  %pexp.p_div_q1523618.us = lshr i64 %polly.indvar146.us, 3
  %reass.add.us = add i64 %289, %pexp.p_div_q1523618.us
  %reass.mul.us = shl i64 %reass.add.us, 9
  %polly.access.add.Packed_B.us = add i64 %reass.mul.us, %polly.indvar138.us3627
  %polly.access.mul.Packed_B153.us = shl nsw i64 %polly.access.add.Packed_B.us, 3
  %pexp.pdiv_r.us = and i64 %polly.indvar146.us, 7
  %polly.access.add.Packed_B154.us = or i64 %polly.access.mul.Packed_B153.us, %pexp.pdiv_r.us
  %polly.access.Packed_B.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B154.us
  store float %polly.access.B151.load.us, float* %polly.access.Packed_B.us, align 4, !alias.scope !44, !noalias !45
  %polly.indvar_next147.us = add nuw nsw i64 %polly.indvar146.us, 1
  %polly.loop_cond148.not.not.us = icmp slt i64 %polly.indvar146.us, %73
  br i1 %polly.loop_cond148.not.not.us, label %polly.loop_header142.us, label %polly.loop_exit144.loopexit.us, !llvm.loop !47

polly.loop_if155.us:                              ; preds = %polly.loop_exit144.loopexit.us, %polly.loop_if141.preheader.us, %polly.loop_if133.us
  %121 = xor i64 %95, -1
  %122 = add i64 %121, %K
  %123 = tail call i64 @llvm.smin.i64(i64 %122, i64 511)
  %polly.loop_guard212.us = icmp sgt i64 %123, -1
  %min.iters.check3801 = icmp ult i64 %94, 2
  %n.vec3804 = and i64 %94, -2
  %ind.end = add i64 %95, %n.vec3804
  %cmp.n3806 = icmp eq i64 %94, %n.vec3804
  %polly.loop_guard212.us.not3773 = xor i1 %polly.loop_guard212.us, true
  %polly.loop_guard212.us.not = xor i1 %polly.loop_guard212.us, true
  br label %polly.loop_if163.us

polly.loop_if163.us:                              ; preds = %polly.loop_if155.us, %polly.merge1710.us
  %indvars.iv3721 = phi i64 [ %pexp.p_div_q12323614, %polly.loop_if155.us ], [ %indvars.iv.next3722, %polly.merge1710.us ]
  %indvars.iv3706 = phi i64 [ %pexp.p_div_q1993613, %polly.loop_if155.us ], [ %indvars.iv.next3707, %polly.merge1710.us ]
  %indvars.iv3698 = phi i64 [ 95, %polly.loop_if155.us ], [ %indvars.iv.next3699, %polly.merge1710.us ]
  %polly.indvar160.us = phi i64 [ 0, %polly.loop_if155.us ], [ %polly.indvar_next161.us, %polly.merge1710.us ]
  %smin3733 = call i64 @llvm.smin.i64(i64 %indvars.iv3721, i64 23)
  %smin3708 = call i64 @llvm.smin.i64(i64 %indvars.iv3706, i64 24)
  %124 = call i64 @llvm.smax.i64(i64 %smin3708, i64 1)
  %smin3700 = call i64 @llvm.smin.i64(i64 %indvars.iv3698, i64 %40)
  %125 = mul nuw nsw i64 %polly.indvar160.us, 96
  %126 = add nuw nsw i64 %125, 95
  %127 = tail call i64 @llvm.smin.i64(i64 %40, i64 %126)
  %polly.loop_guard167.not.us = icmp sgt i64 %125, %127
  br i1 %polly.loop_guard167.not.us, label %polly.cond186.us, label %polly.loop_if171.preheader.us

polly.loop_if171.us3628:                          ; preds = %polly.loop_if171.preheader.us, %polly.loop_exit174.loopexit.us
  %polly.indvar168.us3629 = phi i64 [ %polly.indvar_next169.us3647, %polly.loop_exit174.loopexit.us ], [ %125, %polly.loop_if171.preheader.us ]
  %polly.access.mul.A179.us = mul nsw i64 %polly.indvar168.us3629, %K
  %pexp.p_div_q1823617.us = lshr i64 %polly.indvar168.us3629, 2
  %reass.add3620.us = add i64 %288, %pexp.p_div_q1823617.us
  %reass.mul3621.us = shl i64 %reass.add3620.us, 9
  %pexp.pdiv_r184.us = and i64 %polly.indvar168.us3629, 3
  br i1 %min.iters.check3801, label %polly.loop_header172.us.preheader, label %vector.body3807

vector.body3807:                                  ; preds = %polly.loop_if171.us3628, %vector.body3807
  %index3808 = phi i64 [ %index.next3810, %vector.body3807 ], [ 0, %polly.loop_if171.us3628 ]
  %offset.idx = add i64 %95, %index3808
  %induction3809 = or i64 %offset.idx, 1
  %128 = add nsw i64 %offset.idx, %polly.access.mul.A179.us
  %129 = add nsw i64 %induction3809, %polly.access.mul.A179.us
  %130 = getelementptr float, float* %A, i64 %128
  %131 = getelementptr float, float* %A, i64 %129
  %132 = load float, float* %130, align 4, !alias.scope !48, !noalias !49
  %133 = load float, float* %131, align 4, !alias.scope !48, !noalias !49
  %134 = add i64 %offset.idx, %reass.mul3621.us
  %135 = add i64 %induction3809, %reass.mul3621.us
  %136 = shl nsw i64 %134, 2
  %137 = shl nsw i64 %135, 2
  %138 = or i64 %136, %pexp.pdiv_r184.us
  %139 = or i64 %137, %pexp.pdiv_r184.us
  %140 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %138
  %141 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %139
  store float %132, float* %140, align 4, !alias.scope !50, !noalias !51
  store float %133, float* %141, align 4, !alias.scope !50, !noalias !51
  %index.next3810 = add nuw i64 %index3808, 2
  %142 = icmp eq i64 %index.next3810, %n.vec3804
  br i1 %142, label %middle.block3799, label %vector.body3807, !llvm.loop !52

middle.block3799:                                 ; preds = %vector.body3807
  br i1 %cmp.n3806, label %polly.loop_exit174.loopexit.us, label %polly.loop_header172.us.preheader

polly.loop_header172.us.preheader:                ; preds = %polly.loop_if171.us3628, %middle.block3799
  %polly.indvar176.us.ph = phi i64 [ %95, %polly.loop_if171.us3628 ], [ %ind.end, %middle.block3799 ]
  br label %polly.loop_header172.us

polly.loop_header172.us:                          ; preds = %polly.loop_header172.us.preheader, %polly.loop_header172.us
  %polly.indvar176.us = phi i64 [ %polly.indvar_next177.us, %polly.loop_header172.us ], [ %polly.indvar176.us.ph, %polly.loop_header172.us.preheader ]
  %polly.access.add.A180.us = add nsw i64 %polly.indvar176.us, %polly.access.mul.A179.us
  %polly.access.A181.us = getelementptr float, float* %A, i64 %polly.access.add.A180.us
  %polly.access.A181.load.us = load float, float* %polly.access.A181.us, align 4, !alias.scope !48, !noalias !49
  %polly.access.add.Packed_A.us = add i64 %polly.indvar176.us, %reass.mul3621.us
  %polly.access.mul.Packed_A183.us = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.add.Packed_A185.us = or i64 %polly.access.mul.Packed_A183.us, %pexp.pdiv_r184.us
  %polly.access.Packed_A.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A185.us
  store float %polly.access.A181.load.us, float* %polly.access.Packed_A.us, align 4, !alias.scope !50, !noalias !51
  %polly.indvar_next177.us = add nuw i64 %polly.indvar176.us, 1
  %exitcond3697.not = icmp eq i64 %polly.indvar176.us, %smin3696
  br i1 %exitcond3697.not, label %polly.loop_exit174.loopexit.us, label %polly.loop_header172.us, !llvm.loop !53

polly.cond186.us:                                 ; preds = %polly.loop_exit174.loopexit.us, %polly.loop_if171.preheader.us, %polly.loop_if163.us
  %143 = or i64 %125, 4
  %.not.us = icmp sgt i64 %143, %M
  %brmerge = select i1 %.not.us, i1 true, i1 %polly.loop_guard195
  br i1 %brmerge, label %polly.cond1709.us, label %polly.loop_if200.preheader.us

polly.loop_if200.us:                              ; preds = %polly.loop_if200.preheader.us, %polly.merge789.us
  %polly.indvar196.us = phi i64 [ %polly.indvar_next197.us, %polly.merge789.us ], [ 0, %polly.loop_if200.preheader.us ]
  br i1 %polly.loop_guard204.us, label %polly.loop_if208.preheader.us, label %polly.cond788.us

polly.cond788.us:                                 ; preds = %polly.loop_exit211.loopexit.us.us, %polly.loop_if208.preheader.us, %polly.loop_if200.us
  br i1 %280, label %polly.cond793.us, label %polly.merge789.us

polly.cond793.us:                                 ; preds = %polly.cond788.us
  br i1 %273, label %polly.loop_if797.us, label %polly.loop_if1221.us

polly.loop_if1221.us:                             ; preds = %polly.cond793.us
  br i1 %polly.loop_guard212.us, label %polly.cond1389.preheader.us, label %polly.merge789.us

polly.cond1389.us:                                ; preds = %polly.cond1389.preheader.us, %polly.merge1390.us
  %polly.indvar1226.us = phi i64 [ %polly.indvar_next1227.us, %polly.merge1390.us ], [ 0, %polly.cond1389.preheader.us ]
  %polly.access.add.Packed_A1234.us = add nsw i64 %polly.indvar1226.us, %polly.access.mul.Packed_A1233.us
  %polly.access.mul.Packed_A1235.us = shl nsw i64 %polly.access.add.Packed_A1234.us, 2
  %polly.access.Packed_A1237.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1235.us
  %_p_scalar_1238.us = load float, float* %polly.access.Packed_A1237.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_B1241.us = add nuw nsw i64 %polly.indvar1226.us, %polly.access.mul.Packed_B1240.us
  %polly.access.mul.Packed_B1242.us = shl nsw i64 %polly.access.add.Packed_B1241.us, 3
  %polly.access.Packed_B1244.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1242.us
  %144 = bitcast float* %polly.access.Packed_B1244.us to <4 x float>*
  %145 = load <4 x float>, <4 x float>* %144, align 32, !alias.scope !44, !noalias !45
  %146 = load <4 x float>, <4 x float>* %242, align 4, !alias.scope !54, !noalias !55
  %147 = insertelement <4 x float> poison, float %_p_scalar_1238.us, i64 0
  %shuffle3834 = shufflevector <4 x float> %147, <4 x float> poison, <4 x i32> zeroinitializer
  %148 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3834, <4 x float> %145, <4 x float> %146)
  store <4 x float> %148, <4 x float>* %243, align 4, !alias.scope !54, !noalias !55
  %polly.access.add.Packed_B1323.us = or i64 %polly.access.mul.Packed_B1242.us, 4
  %polly.access.Packed_B1324.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1323.us
  %149 = bitcast float* %polly.access.Packed_B1324.us to <2 x float>*
  %150 = load <2 x float>, <2 x float>* %149, align 16, !alias.scope !44, !noalias !45
  %polly.access.add.Packed_B1363.us = or i64 %polly.access.mul.Packed_B1242.us, 6
  %polly.access.Packed_B1364.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1363.us
  %151 = bitcast float* %polly.access.Packed_B1364.us to <2 x float>*
  %152 = load <2 x float>, <2 x float>* %151, align 8, !alias.scope !44, !noalias !45
  %153 = load <4 x float>, <4 x float>* %244, align 4, !alias.scope !54, !noalias !55
  %154 = shufflevector <2 x float> %150, <2 x float> %152, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %155 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3834, <4 x float> %154, <4 x float> %153)
  store <4 x float> %155, <4 x float>* %245, align 4, !alias.scope !54, !noalias !55
  br i1 %46, label %polly.cond1554.us, label %polly.merge1390.us

polly.cond1554.us:                                ; preds = %polly.cond1389.us
  %polly.access.add.Packed_A1401.us = or i64 %polly.access.mul.Packed_A1235.us, 1
  %polly.access.Packed_A1402.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1401.us
  %_p_scalar_1403.us = load float, float* %polly.access.Packed_A1402.us, align 4, !alias.scope !50, !noalias !51
  %156 = load <4 x float>, <4 x float>* %246, align 4, !alias.scope !54, !noalias !55
  %157 = insertelement <4 x float> poison, float %_p_scalar_1403.us, i64 0
  %shuffle3832 = shufflevector <4 x float> %157, <4 x float> poison, <4 x i32> zeroinitializer
  %158 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3832, <4 x float> %145, <4 x float> %156)
  store <4 x float> %158, <4 x float>* %247, align 4, !alias.scope !54, !noalias !55
  %159 = load <4 x float>, <4 x float>* %248, align 4, !alias.scope !54, !noalias !55
  %160 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3832, <4 x float> %154, <4 x float> %159)
  store <4 x float> %160, <4 x float>* %249, align 4, !alias.scope !54, !noalias !55
  br i1 %50, label %polly.stmt.for.body10.us1690.us, label %polly.merge1390.us

polly.stmt.for.body10.us1690.us:                  ; preds = %polly.cond1554.us
  %polly.access.add.Packed_A1561.us = add nsw i64 %polly.indvar1226.us, %polly.access.mul.Packed_A1560.us
  %polly.access.mul.Packed_A1562.us = shl nsw i64 %polly.access.add.Packed_A1561.us, 2
  %polly.access.add.Packed_A1563.us = or i64 %polly.access.mul.Packed_A1562.us, 2
  %polly.access.Packed_A1564.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1563.us
  %_p_scalar_1565.us = load float, float* %polly.access.Packed_A1564.us, align 8, !alias.scope !50, !noalias !51
  %161 = load <4 x float>, <4 x float>* %250, align 4, !alias.scope !54, !noalias !55
  %162 = insertelement <4 x float> poison, float %_p_scalar_1565.us, i64 0
  %shuffle3831 = shufflevector <4 x float> %162, <4 x float> poison, <4 x i32> zeroinitializer
  %163 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3831, <4 x float> %145, <4 x float> %161)
  store <4 x float> %163, <4 x float>* %251, align 4, !alias.scope !54, !noalias !55
  %164 = load <2 x float>, <2 x float>* %252, align 4, !alias.scope !54, !noalias !55
  %165 = insertelement <2 x float> poison, float %_p_scalar_1565.us, i64 0
  %166 = shufflevector <2 x float> %165, <2 x float> poison, <2 x i32> zeroinitializer
  %167 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %166, <2 x float> %150, <2 x float> %164)
  store <2 x float> %167, <2 x float>* %253, align 4, !alias.scope !54, !noalias !55
  %168 = load <2 x float>, <2 x float>* %254, align 4, !alias.scope !54, !noalias !55
  %169 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %166, <2 x float> %152, <2 x float> %168)
  store <2 x float> %169, <2 x float>* %255, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge1390.us

polly.merge1390.us:                               ; preds = %polly.stmt.for.body10.us1690.us, %polly.cond1554.us, %polly.cond1389.us
  %polly.indvar_next1227.us = add nuw nsw i64 %polly.indvar1226.us, 1
  %exitcond3711.not = icmp eq i64 %polly.indvar1226.us, %smin3731
  br i1 %exitcond3711.not, label %polly.merge789.us, label %polly.cond1389.us, !llvm.loop !56

polly.loop_if797.us:                              ; preds = %polly.cond793.us
  br i1 %polly.loop_guard212.us, label %polly.cond941.preheader.us, label %polly.merge789.us

polly.cond941.us:                                 ; preds = %polly.cond941.preheader.us, %polly.merge942.us
  %polly.indvar802.us = phi i64 [ %polly.indvar_next803.us, %polly.merge942.us ], [ 0, %polly.cond941.preheader.us ]
  %polly.access.add.Packed_A807.us = shl i64 %polly.indvar802.us, 2
  %polly.access.mul.Packed_A808.us = add nuw nsw i64 %polly.access.add.Packed_A807.us, 2048
  %polly.access.Packed_A810.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A808.us
  %_p_scalar_811.us = load float, float* %polly.access.Packed_A810.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_B814.us = add nuw nsw i64 %polly.indvar802.us, %polly.access.mul.Packed_B813.us
  %polly.access.mul.Packed_B815.us = shl nsw i64 %polly.access.add.Packed_B814.us, 3
  %polly.access.Packed_B817.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B815.us
  %170 = bitcast float* %polly.access.Packed_B817.us to <4 x float>*
  %171 = load <4 x float>, <4 x float>* %170, align 32, !alias.scope !44, !noalias !45
  %172 = load <4 x float>, <4 x float>* %217, align 4, !alias.scope !54, !noalias !55
  %173 = insertelement <4 x float> poison, float %_p_scalar_811.us, i64 0
  %shuffle3829 = shufflevector <4 x float> %173, <4 x float> poison, <4 x i32> zeroinitializer
  %174 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3829, <4 x float> %171, <4 x float> %172)
  store <4 x float> %174, <4 x float>* %218, align 4, !alias.scope !54, !noalias !55
  %polly.access.add.Packed_B884.us = or i64 %polly.access.mul.Packed_B815.us, 4
  %polly.access.Packed_B885.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B884.us
  %175 = bitcast float* %polly.access.Packed_B885.us to <2 x float>*
  %176 = load <2 x float>, <2 x float>* %175, align 16, !alias.scope !44, !noalias !45
  %polly.access.add.Packed_B918.us = or i64 %polly.access.mul.Packed_B815.us, 6
  %polly.access.Packed_B919.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B918.us
  %177 = bitcast float* %polly.access.Packed_B919.us to <2 x float>*
  %178 = load <2 x float>, <2 x float>* %177, align 8, !alias.scope !44, !noalias !45
  %179 = load <4 x float>, <4 x float>* %219, align 4, !alias.scope !54, !noalias !55
  %180 = shufflevector <2 x float> %176, <2 x float> %178, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %181 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3829, <4 x float> %180, <4 x float> %179)
  store <4 x float> %181, <4 x float>* %220, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3616.us, label %polly.merge942.us, label %polly.cond1081.us

polly.cond1081.us:                                ; preds = %polly.cond941.us
  %polly.access.add.Packed_A949.us = add nuw nsw i64 %polly.access.add.Packed_A807.us, 2049
  %polly.access.Packed_A950.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A949.us
  %_p_scalar_951.us = load float, float* %polly.access.Packed_A950.us, align 4, !alias.scope !50, !noalias !51
  %182 = load <4 x float>, <4 x float>* %221, align 4, !alias.scope !54, !noalias !55
  %183 = insertelement <4 x float> poison, float %_p_scalar_951.us, i64 0
  %shuffle3827 = shufflevector <4 x float> %183, <4 x float> poison, <4 x i32> zeroinitializer
  %184 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3827, <4 x float> %171, <4 x float> %182)
  store <4 x float> %184, <4 x float>* %222, align 4, !alias.scope !54, !noalias !55
  %185 = load <4 x float>, <4 x float>* %223, align 4, !alias.scope !54, !noalias !55
  %186 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3827, <4 x float> %180, <4 x float> %185)
  store <4 x float> %186, <4 x float>* %224, align 4, !alias.scope !54, !noalias !55
  br i1 %286, label %polly.stmt.for.body10.us1204.us, label %polly.merge942.us

polly.stmt.for.body10.us1204.us:                  ; preds = %polly.cond1081.us
  %polly.access.add.Packed_A1089.us = add nuw nsw i64 %polly.access.add.Packed_A807.us, 2050
  %polly.access.Packed_A1090.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1089.us
  %_p_scalar_1091.us = load float, float* %polly.access.Packed_A1090.us, align 8, !alias.scope !50, !noalias !51
  %187 = load <4 x float>, <4 x float>* %225, align 4, !alias.scope !54, !noalias !55
  %188 = insertelement <4 x float> poison, float %_p_scalar_1091.us, i64 0
  %shuffle = shufflevector <4 x float> %188, <4 x float> poison, <4 x i32> zeroinitializer
  %189 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle, <4 x float> %171, <4 x float> %187)
  store <4 x float> %189, <4 x float>* %226, align 4, !alias.scope !54, !noalias !55
  %190 = load <2 x float>, <2 x float>* %227, align 4, !alias.scope !54, !noalias !55
  %191 = insertelement <2 x float> poison, float %_p_scalar_1091.us, i64 0
  %192 = shufflevector <2 x float> %191, <2 x float> poison, <2 x i32> zeroinitializer
  %193 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %192, <2 x float> %176, <2 x float> %190)
  store <2 x float> %193, <2 x float>* %228, align 4, !alias.scope !54, !noalias !55
  %194 = load <2 x float>, <2 x float>* %229, align 4, !alias.scope !54, !noalias !55
  %195 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %192, <2 x float> %178, <2 x float> %194)
  store <2 x float> %195, <2 x float>* %230, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge942.us

polly.merge942.us:                                ; preds = %polly.stmt.for.body10.us1204.us, %polly.cond1081.us, %polly.cond941.us
  %polly.indvar_next803.us = add nuw nsw i64 %polly.indvar802.us, 1
  %exitcond3713.not = icmp eq i64 %polly.indvar802.us, %smin3731
  br i1 %exitcond3713.not, label %polly.merge789.us, label %polly.cond941.us, !llvm.loop !58

polly.merge789.us:                                ; preds = %polly.merge1390.us, %polly.merge942.us, %polly.loop_if797.us, %polly.loop_if1221.us, %polly.cond788.us
  %polly.indvar_next197.us = add nuw nsw i64 %polly.indvar196.us, 1
  %exitcond3718.not = icmp eq i64 %polly.indvar_next197.us, %70
  br i1 %exitcond3718.not, label %polly.cond1709.us, label %polly.loop_if200.us

polly.cond1709.us:                                ; preds = %polly.merge789.us, %polly.cond186.us
  %196 = or i64 %125, 3
  %197 = icmp sge i64 %196, %M
  %198 = or i1 %76, %197
  %199 = or i1 %78, %198
  br i1 %199, label %polly.cond1714.us, label %polly.merge1710.us

polly.cond1714.us:                                ; preds = %polly.cond1709.us
  br i1 %76, label %polly.loop_if1719.us, label %polly.cond2319.us

polly.cond2319.us:                                ; preds = %polly.cond1714.us
  br i1 %197, label %polly.loop_if2324.us, label %polly.loop_if2841.us

polly.loop_if2841.us:                             ; preds = %polly.cond2319.us
  %200 = mul nsw i64 %polly.indvar160.us, -24
  %201 = add nsw i64 %200, %pexp.p_div_q12323614
  %202 = tail call i64 @llvm.smin.i64(i64 %201, i64 23)
  %polly.loop_guard2845.us = icmp slt i64 %202, 0
  %brmerge3774 = select i1 %polly.loop_guard2845.us, i1 true, i1 %polly.loop_guard212.us.not3773
  br i1 %brmerge3774, label %polly.merge1710.us, label %polly.loop_if2849.us.us

polly.loop_if2324.us:                             ; preds = %polly.cond2319.us
  br i1 %polly.loop_guard2328, label %polly.loop_if2332.preheader.us, label %polly.merge1710.us

polly.loop_if1719.us:                             ; preds = %polly.cond1714.us
  %203 = mul nsw i64 %polly.indvar160.us, -24
  %204 = add nsw i64 %203, %pexp.p_div_q12323614
  %205 = tail call i64 @llvm.smin.i64(i64 %204, i64 23)
  %polly.loop_guard1723.us = icmp slt i64 %205, 0
  %brmerge3772 = select i1 %polly.loop_guard1723.us, i1 true, i1 %polly.loop_guard212.us.not
  br i1 %brmerge3772, label %polly.merge1710.us, label %polly.loop_if1727.us.us

polly.merge1710.us:                               ; preds = %polly.loop_exit2852.loopexit.us.us, %polly.loop_exit2335.loopexit.us.us, %polly.loop_exit1730.loopexit.us.us, %polly.loop_if2841.us, %polly.loop_if1719.us, %polly.loop_if2332.preheader.us, %polly.loop_if2324.us, %polly.cond1709.us
  %polly.indvar_next161.us = add nuw nsw i64 %polly.indvar160.us, 1
  %indvars.iv.next3699 = add nuw i64 %indvars.iv3698, 96
  %indvars.iv.next3707 = add nsw i64 %indvars.iv3706, -24
  %indvars.iv.next3722 = add nsw i64 %indvars.iv3721, -24
  %exitcond3735.not = icmp eq i64 %polly.indvar160.us, %pexp.fdiv_q.43765
  br i1 %exitcond3735.not, label %polly.loop_exit158.loopexit.us, label %polly.loop_if163.us

polly.cond941.preheader.us:                       ; preds = %polly.loop_if797.us
  %206 = shl nsw i64 %polly.indvar196.us, 3
  %207 = add nuw nsw i64 %206, %71
  %polly.access.mul.Packed_B813.us = shl nsw i64 %polly.indvar196.us, 9
  %208 = add i64 %207, %283
  %scevgep819.us = getelementptr float, float* %C, i64 %208
  %209 = or i64 %207, 4
  %210 = add i64 %209, %283
  %scevgep887.us = getelementptr float, float* %C, i64 %210
  %211 = or i64 %207, 6
  %212 = add i64 %207, %285
  %scevgep959.us = getelementptr float, float* %C, i64 %212
  %213 = add i64 %209, %285
  %scevgep1027.us = getelementptr float, float* %C, i64 %213
  %214 = add i64 %207, %52
  %scevgep1099.us = getelementptr float, float* %C, i64 %214
  %215 = add i64 %209, %52
  %scevgep1167.us = getelementptr float, float* %C, i64 %215
  %216 = add i64 %211, %52
  %scevgep1201.us = getelementptr float, float* %C, i64 %216
  %217 = bitcast float* %scevgep819.us to <4 x float>*
  %218 = bitcast float* %scevgep819.us to <4 x float>*
  %219 = bitcast float* %scevgep887.us to <4 x float>*
  %220 = bitcast float* %scevgep887.us to <4 x float>*
  %221 = bitcast float* %scevgep959.us to <4 x float>*
  %222 = bitcast float* %scevgep959.us to <4 x float>*
  %223 = bitcast float* %scevgep1027.us to <4 x float>*
  %224 = bitcast float* %scevgep1027.us to <4 x float>*
  %225 = bitcast float* %scevgep1099.us to <4 x float>*
  %226 = bitcast float* %scevgep1099.us to <4 x float>*
  %227 = bitcast float* %scevgep1167.us to <2 x float>*
  %228 = bitcast float* %scevgep1167.us to <2 x float>*
  %229 = bitcast float* %scevgep1201.us to <2 x float>*
  %230 = bitcast float* %scevgep1201.us to <2 x float>*
  br label %polly.cond941.us

polly.cond1389.preheader.us:                      ; preds = %polly.loop_if1221.us
  %231 = shl nsw i64 %polly.indvar196.us, 3
  %232 = add nuw nsw i64 %231, %71
  %polly.access.mul.Packed_B1240.us = shl nsw i64 %polly.indvar196.us, 9
  %233 = add i64 %232, %45
  %scevgep1246.us = getelementptr float, float* %C, i64 %233
  %234 = or i64 %232, 4
  %235 = add i64 %234, %45
  %scevgep1326.us = getelementptr float, float* %C, i64 %235
  %236 = or i64 %232, 6
  %237 = add i64 %232, %47
  %scevgep1411.us = getelementptr float, float* %C, i64 %237
  %238 = add i64 %234, %47
  %scevgep1491.us = getelementptr float, float* %C, i64 %238
  %239 = add i64 %232, %52
  %scevgep1573.us = getelementptr float, float* %C, i64 %239
  %240 = add i64 %234, %52
  %scevgep1649.us = getelementptr float, float* %C, i64 %240
  %241 = add i64 %236, %52
  %scevgep1687.us = getelementptr float, float* %C, i64 %241
  %242 = bitcast float* %scevgep1246.us to <4 x float>*
  %243 = bitcast float* %scevgep1246.us to <4 x float>*
  %244 = bitcast float* %scevgep1326.us to <4 x float>*
  %245 = bitcast float* %scevgep1326.us to <4 x float>*
  %246 = bitcast float* %scevgep1411.us to <4 x float>*
  %247 = bitcast float* %scevgep1411.us to <4 x float>*
  %248 = bitcast float* %scevgep1491.us to <4 x float>*
  %249 = bitcast float* %scevgep1491.us to <4 x float>*
  %250 = bitcast float* %scevgep1573.us to <4 x float>*
  %251 = bitcast float* %scevgep1573.us to <4 x float>*
  %252 = bitcast float* %scevgep1649.us to <2 x float>*
  %253 = bitcast float* %scevgep1649.us to <2 x float>*
  %254 = bitcast float* %scevgep1687.us to <2 x float>*
  %255 = bitcast float* %scevgep1687.us to <2 x float>*
  br label %polly.cond1389.us

polly.loop_if208.preheader.us:                    ; preds = %polly.loop_if200.us
  %256 = shl nsw i64 %polly.indvar196.us, 3
  %257 = add nuw nsw i64 %256, %71
  %polly.access.mul.Packed_B223.us = shl nsw i64 %polly.indvar196.us, 9
  %258 = or i64 %257, 2
  %259 = or i64 %257, 4
  %260 = or i64 %257, 6
  br i1 %polly.loop_guard212.us, label %polly.loop_if208.us.us, label %polly.cond788.us

polly.loop_exit174.loopexit.us:                   ; preds = %polly.loop_header172.us, %middle.block3799
  %polly.indvar_next169.us3647 = add nuw i64 %polly.indvar168.us3629, 1
  %exitcond3701.not = icmp eq i64 %polly.indvar168.us3629, %smin3700
  br i1 %exitcond3701.not, label %polly.cond186.us, label %polly.loop_if171.us3628

polly.loop_if2332.preheader.us:                   ; preds = %polly.loop_if2324.us
  %261 = mul i64 %125, %N
  %262 = or i64 %125, 2
  %.not3572.us = icmp sgt i64 %262, %M
  %263 = or i64 %261, 1
  %264 = or i64 %125, 1
  %265 = mul i64 %264, %N
  %266 = add i64 %265, 1
  %267 = icmp eq i64 %196, %M
  br i1 %polly.loop_guard212.us, label %polly.loop_if2332.us.us, label %polly.merge1710.us

polly.loop_if200.preheader.us:                    ; preds = %polly.cond186.us
  %268 = mul nsw i64 %polly.indvar160.us, -24
  %269 = add nsw i64 %268, %pexp.p_div_q1993613
  %polly.loop_guard204.us = icmp sgt i64 %269, 0
  %270 = or i64 %125, 5
  %271 = icmp sle i64 %270, %M
  %272 = or i64 %125, 7
  %273 = icmp sge i64 %272, %M
  %274 = and i1 %271, %273
  %275 = or i64 %125, 8
  %276 = icmp sle i64 %275, %M
  %277 = icmp sge i64 %126, %M
  %278 = and i1 %276, %277
  %279 = and i1 %42, %278
  %280 = or i1 %274, %279
  %281 = add nsw i64 %268, %pexp.p_div_q12323614
  %polly.access.mul.Packed_A1233.us = shl nsw i64 %281, 9
  %282 = add nsw i64 %268, %pexp.div
  %polly.access.mul.Packed_A1560.us = shl nsw i64 %282, 9
  %283 = mul i64 %143, %N
  %284 = or i64 %125, 6
  %.not3616.us = icmp sgt i64 %284, %M
  %285 = mul i64 %270, %N
  %286 = icmp eq i64 %272, %M
  br label %polly.loop_if200.us

polly.loop_if171.preheader.us:                    ; preds = %polly.loop_if163.us
  %287 = mul i64 %polly.indvar160.us, 36028797018963944
  %288 = sub i64 %287, %polly.indvar130.us
  br i1 %polly.loop_guard137.not.us, label %polly.cond186.us, label %polly.loop_if171.us3628

polly.loop_exit144.loopexit.us:                   ; preds = %polly.loop_header142.us, %middle.block3812
  %polly.indvar_next139.us3653 = add nuw i64 %polly.indvar138.us3627, 1
  %exitcond3695.not = icmp eq i64 %polly.indvar138.us3627, %smin3696
  br i1 %exitcond3695.not, label %polly.loop_if155.us, label %polly.loop_if141.us3626

polly.loop_exit158.loopexit.us:                   ; preds = %polly.merge1710.us
  %polly.indvar_next131.us = add nuw nsw i64 %polly.indvar130.us, 1
  %indvars.iv.next3693 = add nuw i64 %indvars.iv3692, 512
  %indvars.iv.next3703 = add i64 %indvars.iv3702, -512
  %exitcond3736.not = icmp eq i64 %polly.indvar130.us, %pexp.p_div_q3545
  br i1 %exitcond3736.not, label %polly.loop_exit129, label %polly.loop_if133.us

polly.loop_if141.preheader.us:                    ; preds = %polly.loop_if133.us
  %289 = sub nsw i64 %74, %polly.indvar130.us
  br i1 %polly.loop_guard145.not.fr, label %polly.loop_if155.us, label %polly.loop_if141.us3626

polly.loop_if208.us.us:                           ; preds = %polly.loop_if208.preheader.us, %polly.loop_exit211.loopexit.us.us
  %polly.indvar205.us.us = phi i64 [ %polly.indvar_next206.us.us, %polly.loop_exit211.loopexit.us.us ], [ 0, %polly.loop_if208.preheader.us ]
  %290 = shl nsw i64 %polly.indvar205.us.us, 2
  %291 = add nuw nsw i64 %290, %125
  %polly.access.mul.Packed_A217.us.us = shl nsw i64 %polly.indvar205.us.us, 9
  %292 = mul i64 %291, %N
  %293 = add i64 %292, %257
  %scevgep.us.us = getelementptr float, float* %C, i64 %293
  %294 = add i64 %292, %259
  %scevgep299.us.us = getelementptr float, float* %C, i64 %294
  %295 = or i64 %291, 1
  %296 = mul i64 %295, %N
  %297 = add i64 %296, %257
  %scevgep371.us.us = getelementptr float, float* %C, i64 %297
  %298 = add i64 %296, %259
  %scevgep443.us.us = getelementptr float, float* %C, i64 %298
  %299 = or i64 %291, 2
  %300 = mul i64 %299, %N
  %301 = add i64 %300, %257
  %scevgep515.us.us = getelementptr float, float* %C, i64 %301
  %302 = add i64 %300, %259
  %scevgep587.us.us = getelementptr float, float* %C, i64 %302
  %303 = or i64 %291, 3
  %304 = mul i64 %303, %N
  %305 = add i64 %304, %257
  %scevgep659.us.us = getelementptr float, float* %C, i64 %305
  %306 = add i64 %304, %258
  %scevgep695.us.us = getelementptr float, float* %C, i64 %306
  %307 = add i64 %304, %259
  %scevgep731.us.us = getelementptr float, float* %C, i64 %307
  %308 = add i64 %304, %260
  %scevgep767.us.us = getelementptr float, float* %C, i64 %308
  %309 = bitcast float* %scevgep659.us.us to <2 x float>*
  %310 = bitcast float* %scevgep659.us.us to <2 x float>*
  %311 = bitcast float* %scevgep.us.us to <4 x float>*
  %312 = bitcast float* %scevgep.us.us to <4 x float>*
  %313 = bitcast float* %scevgep695.us.us to <2 x float>*
  %314 = bitcast float* %scevgep695.us.us to <2 x float>*
  %315 = bitcast float* %scevgep731.us.us to <2 x float>*
  %316 = bitcast float* %scevgep731.us.us to <2 x float>*
  %317 = bitcast float* %scevgep299.us.us to <4 x float>*
  %318 = bitcast float* %scevgep299.us.us to <4 x float>*
  %319 = bitcast float* %scevgep371.us.us to <4 x float>*
  %320 = bitcast float* %scevgep371.us.us to <4 x float>*
  %321 = bitcast float* %scevgep443.us.us to <4 x float>*
  %322 = bitcast float* %scevgep443.us.us to <4 x float>*
  %323 = bitcast float* %scevgep515.us.us to <4 x float>*
  %324 = bitcast float* %scevgep515.us.us to <4 x float>*
  %325 = bitcast float* %scevgep587.us.us to <4 x float>*
  %326 = bitcast float* %scevgep587.us.us to <4 x float>*
  %327 = bitcast float* %scevgep767.us.us to <2 x float>*
  %328 = bitcast float* %scevgep767.us.us to <2 x float>*
  br label %polly.stmt.for.body10.us770.us.us

polly.stmt.for.body10.us770.us.us:                ; preds = %polly.stmt.for.body10.us770.us.us, %polly.loop_if208.us.us
  %polly.indvar213.us.us = phi i64 [ %polly.indvar_next214.us.us, %polly.stmt.for.body10.us770.us.us ], [ 0, %polly.loop_if208.us.us ]
  %polly.access.add.Packed_A218.us.us = add nuw nsw i64 %polly.indvar213.us.us, %polly.access.mul.Packed_A217.us.us
  %polly.access.mul.Packed_A219.us.us = shl nsw i64 %polly.access.add.Packed_A218.us.us, 2
  %polly.access.Packed_A221.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A219.us.us
  %_p_scalar_.us.us = load float, float* %polly.access.Packed_A221.us.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_B224.us.us = add nuw nsw i64 %polly.indvar213.us.us, %polly.access.mul.Packed_B223.us
  %polly.access.mul.Packed_B225.us.us = shl nsw i64 %polly.access.add.Packed_B224.us.us, 3
  %polly.access.Packed_B227.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B225.us.us
  %polly.access.add.Packed_B260.us.us = or i64 %polly.access.mul.Packed_B225.us.us, 2
  %polly.access.Packed_B261.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B260.us.us
  %polly.access.add.Packed_B296.us.us = or i64 %polly.access.mul.Packed_B225.us.us, 4
  %polly.access.Packed_B297.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B296.us.us
  %polly.access.add.Packed_B332.us.us = or i64 %polly.access.mul.Packed_B225.us.us, 6
  %polly.access.Packed_B333.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B332.us.us
  %polly.access.add.Packed_A361.us.us = or i64 %polly.access.mul.Packed_A219.us.us, 1
  %polly.access.Packed_A362.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A361.us.us
  %_p_scalar_363.us.us = load float, float* %polly.access.Packed_A362.us.us, align 4, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_A505.us.us = or i64 %polly.access.mul.Packed_A219.us.us, 2
  %polly.access.Packed_A506.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A505.us.us
  %polly.access.add.Packed_A649.us.us = or i64 %polly.access.mul.Packed_A219.us.us, 3
  %polly.access.Packed_A650.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A649.us.us
  %329 = bitcast float* %polly.access.Packed_B227.us.us to <2 x float>*
  %330 = load <2 x float>, <2 x float>* %329, align 32, !alias.scope !44, !noalias !45
  %331 = bitcast float* %polly.access.Packed_B261.us.us to <2 x float>*
  %332 = load <2 x float>, <2 x float>* %331, align 8, !alias.scope !44, !noalias !45
  %333 = load <4 x float>, <4 x float>* %311, align 4, !alias.scope !54, !noalias !55
  %334 = insertelement <4 x float> poison, float %_p_scalar_.us.us, i64 0
  %shuffle3840 = shufflevector <4 x float> %334, <4 x float> poison, <4 x i32> zeroinitializer
  %335 = shufflevector <2 x float> %330, <2 x float> %332, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %336 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3840, <4 x float> %335, <4 x float> %333)
  %337 = bitcast float* %polly.access.Packed_B297.us.us to <2 x float>*
  %338 = load <2 x float>, <2 x float>* %337, align 16, !alias.scope !44, !noalias !45
  %339 = bitcast float* %polly.access.Packed_B333.us.us to <2 x float>*
  %340 = load <2 x float>, <2 x float>* %339, align 8, !alias.scope !44, !noalias !45
  %341 = load <4 x float>, <4 x float>* %317, align 4, !alias.scope !54, !noalias !55
  store <4 x float> %336, <4 x float>* %312, align 4, !alias.scope !54, !noalias !55
  %342 = shufflevector <2 x float> %338, <2 x float> %340, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %343 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3840, <4 x float> %342, <4 x float> %341)
  store <4 x float> %343, <4 x float>* %318, align 4, !alias.scope !54, !noalias !55
  %344 = load <4 x float>, <4 x float>* %319, align 4, !alias.scope !54, !noalias !55
  %345 = insertelement <4 x float> poison, float %_p_scalar_363.us.us, i64 0
  %shuffle3838 = shufflevector <4 x float> %345, <4 x float> poison, <4 x i32> zeroinitializer
  %346 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3838, <4 x float> %335, <4 x float> %344)
  store <4 x float> %346, <4 x float>* %320, align 4, !alias.scope !54, !noalias !55
  %347 = load <4 x float>, <4 x float>* %321, align 4, !alias.scope !54, !noalias !55
  %348 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3838, <4 x float> %342, <4 x float> %347)
  store <4 x float> %348, <4 x float>* %322, align 4, !alias.scope !54, !noalias !55
  %_p_scalar_507.us.us = load float, float* %polly.access.Packed_A506.us.us, align 8, !alias.scope !50, !noalias !51
  %349 = load <4 x float>, <4 x float>* %323, align 4, !alias.scope !54, !noalias !55
  %350 = insertelement <4 x float> poison, float %_p_scalar_507.us.us, i64 0
  %shuffle3836 = shufflevector <4 x float> %350, <4 x float> poison, <4 x i32> zeroinitializer
  %351 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3836, <4 x float> %335, <4 x float> %349)
  store <4 x float> %351, <4 x float>* %324, align 4, !alias.scope !54, !noalias !55
  %352 = load <4 x float>, <4 x float>* %325, align 4, !alias.scope !54, !noalias !55
  %353 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %shuffle3836, <4 x float> %342, <4 x float> %352)
  store <4 x float> %353, <4 x float>* %326, align 4, !alias.scope !54, !noalias !55
  %_p_scalar_651.us.us = load float, float* %polly.access.Packed_A650.us.us, align 4, !alias.scope !50, !noalias !51
  %354 = load <2 x float>, <2 x float>* %309, align 4, !alias.scope !54, !noalias !55
  %355 = insertelement <2 x float> poison, float %_p_scalar_651.us.us, i64 0
  %356 = shufflevector <2 x float> %355, <2 x float> poison, <2 x i32> zeroinitializer
  %357 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %330, <2 x float> %354)
  store <2 x float> %357, <2 x float>* %310, align 4, !alias.scope !54, !noalias !55
  %358 = load <2 x float>, <2 x float>* %313, align 4, !alias.scope !54, !noalias !55
  %359 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %332, <2 x float> %358)
  store <2 x float> %359, <2 x float>* %314, align 4, !alias.scope !54, !noalias !55
  %360 = load <2 x float>, <2 x float>* %315, align 4, !alias.scope !54, !noalias !55
  %361 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %338, <2 x float> %360)
  store <2 x float> %361, <2 x float>* %316, align 4, !alias.scope !54, !noalias !55
  %362 = load <2 x float>, <2 x float>* %327, align 4, !alias.scope !54, !noalias !55
  %363 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %340, <2 x float> %362)
  store <2 x float> %363, <2 x float>* %328, align 4, !alias.scope !54, !noalias !55
  %polly.indvar_next214.us.us = add nuw nsw i64 %polly.indvar213.us.us, 1
  %exitcond3705.not = icmp eq i64 %polly.indvar213.us.us, %smin3731
  br i1 %exitcond3705.not, label %polly.loop_exit211.loopexit.us.us, label %polly.stmt.for.body10.us770.us.us, !llvm.loop !59

polly.loop_exit211.loopexit.us.us:                ; preds = %polly.stmt.for.body10.us770.us.us
  %polly.indvar_next206.us.us = add nuw nsw i64 %polly.indvar205.us.us, 1
  %exitcond3709.not = icmp eq i64 %polly.indvar_next206.us.us, %124
  br i1 %exitcond3709.not, label %polly.cond788.us, label %polly.loop_if208.us.us

polly.loop_if2849.us.us:                          ; preds = %polly.loop_if2841.us, %polly.loop_exit2852.loopexit.us.us
  %polly.indvar2846.us.us = phi i64 [ %polly.indvar_next2847.us.us, %polly.loop_exit2852.loopexit.us.us ], [ 0, %polly.loop_if2841.us ]
  %364 = shl nsw i64 %polly.indvar2846.us.us, 2
  %365 = add nuw nsw i64 %364, %125
  %polly.access.mul.Packed_A2860.us.us = shl nsw i64 %polly.indvar2846.us.us, 9
  %366 = mul i64 %365, %N
  %367 = add i64 %366, %54
  %scevgep2874.us.us = getelementptr float, float* %C, i64 %367
  %368 = or i64 %365, 2
  %.not3548.us.us = icmp sgt i64 %368, %M
  %369 = add i64 %366, %53
  %scevgep2899.us.us = getelementptr float, float* %C, i64 %369
  %370 = add i64 %369, 1
  %scevgep2924.us.us = getelementptr float, float* %C, i64 %370
  %371 = add i64 %369, 2
  %scevgep2949.us.us = getelementptr float, float* %C, i64 %371
  %372 = add i64 %369, 3
  %scevgep2974.us.us = getelementptr float, float* %C, i64 %372
  %373 = add i64 %369, 4
  %scevgep2999.us.us = getelementptr float, float* %C, i64 %373
  %374 = add i64 %366, %.res
  %scevgep3023.us.us = getelementptr float, float* %C, i64 %374
  %375 = or i64 %365, 1
  %376 = mul i64 %375, %N
  %377 = add i64 %376, %54
  %scevgep3047.us.us = getelementptr float, float* %C, i64 %377
  %378 = add i64 %376, %53
  %scevgep3072.us.us = getelementptr float, float* %C, i64 %378
  %379 = add i64 %378, 1
  %scevgep3097.us.us = getelementptr float, float* %C, i64 %379
  %380 = add i64 %378, 2
  %scevgep3122.us.us = getelementptr float, float* %C, i64 %380
  %381 = add i64 %378, 3
  %scevgep3147.us.us = getelementptr float, float* %C, i64 %381
  %382 = add i64 %378, 4
  %scevgep3172.us.us = getelementptr float, float* %C, i64 %382
  %383 = add i64 %376, %.res
  %scevgep3196.us.us = getelementptr float, float* %C, i64 %383
  %384 = or i64 %365, 3
  %.not3549.us.us = icmp sgt i64 %384, %M
  %385 = mul i64 %368, %N
  %386 = add i64 %385, %54
  %scevgep3220.us.us = getelementptr float, float* %C, i64 %386
  %387 = add i64 %385, %53
  %scevgep3245.us.us = getelementptr float, float* %C, i64 %387
  %388 = add i64 %387, 1
  %scevgep3270.us.us = getelementptr float, float* %C, i64 %388
  %389 = add i64 %387, 2
  %scevgep3295.us.us = getelementptr float, float* %C, i64 %389
  %390 = add i64 %387, 3
  %scevgep3320.us.us = getelementptr float, float* %C, i64 %390
  %391 = add i64 %387, 4
  %scevgep3345.us.us = getelementptr float, float* %C, i64 %391
  %392 = add i64 %385, %.res
  %scevgep3369.us.us = getelementptr float, float* %C, i64 %392
  %393 = add nuw nsw i64 %365, 4
  %.not3550.us.us = icmp sgt i64 %393, %M
  %394 = mul i64 %384, %N
  %395 = add i64 %394, %54
  %scevgep3393.us.us = getelementptr float, float* %C, i64 %395
  %396 = add i64 %394, %53
  %scevgep3418.us.us = getelementptr float, float* %C, i64 %396
  %397 = add i64 %396, 1
  %scevgep3443.us.us = getelementptr float, float* %C, i64 %397
  %398 = add i64 %396, 2
  %scevgep3468.us.us = getelementptr float, float* %C, i64 %398
  %399 = add i64 %396, 3
  %scevgep3493.us.us = getelementptr float, float* %C, i64 %399
  %400 = add i64 %396, 4
  %scevgep3518.us.us = getelementptr float, float* %C, i64 %400
  %401 = add i64 %394, %.res
  %scevgep3542.us.us = getelementptr float, float* %C, i64 %401
  br label %polly.cond2877.us.us

polly.cond2877.us.us:                             ; preds = %polly.merge3027.us.us, %polly.loop_if2849.us.us
  %polly.indvar2854.us.us = phi i64 [ %polly.indvar_next2855.us.us, %polly.merge3027.us.us ], [ 0, %polly.loop_if2849.us.us ]
  %polly.access.add.Packed_A2861.us.us = add nuw nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_A2860.us.us
  %polly.access.mul.Packed_A2862.us.us = shl nsw i64 %polly.access.add.Packed_A2861.us.us, 2
  %polly.access.Packed_A2864.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2862.us.us
  %_p_scalar_2865.us.us = load float, float* %polly.access.Packed_A2864.us.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_B2869.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2868
  %polly.access.mul.Packed_B2870.us.us = shl nsw i64 %polly.access.add.Packed_B2869.us.us, 3
  %polly.access.Packed_B2872.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2870.us.us
  %_p_scalar_2873.us.us = load float, float* %polly.access.Packed_B2872.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_2875.us.us = load float, float* %scevgep2874.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2876.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2873.us.us, float %_p_scalar_2875.us.us)
  store float %p_2876.us.us, float* %scevgep2874.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %55, label %polly.cond2902.us.us, label %polly.cond3026.us.us.thread

polly.cond2902.us.us:                             ; preds = %polly.cond2877.us.us
  %polly.access.add.Packed_B2894.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2893
  %polly.access.mul.Packed_B2895.us.us = shl nsw i64 %polly.access.add.Packed_B2894.us.us, 3
  %polly.access.add.Packed_B2896.us.us = or i64 %polly.access.mul.Packed_B2895.us.us, 1
  %polly.access.Packed_B2897.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2896.us.us
  %_p_scalar_2898.us.us = load float, float* %polly.access.Packed_B2897.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2900.us.us = load float, float* %scevgep2899.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2901.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2898.us.us, float %_p_scalar_2900.us.us)
  store float %p_2901.us.us, float* %scevgep2899.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3566, label %polly.cond3026.us.us, label %polly.cond2927.us.us

polly.cond2927.us.us:                             ; preds = %polly.cond2902.us.us
  %polly.access.add.Packed_B2919.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2918
  %polly.access.mul.Packed_B2920.us.us = shl nsw i64 %polly.access.add.Packed_B2919.us.us, 3
  %polly.access.add.Packed_B2921.us.us = or i64 %polly.access.mul.Packed_B2920.us.us, 2
  %polly.access.Packed_B2922.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2921.us.us
  %_p_scalar_2923.us.us = load float, float* %polly.access.Packed_B2922.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2925.us.us = load float, float* %scevgep2924.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2926.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2923.us.us, float %_p_scalar_2925.us.us)
  store float %p_2926.us.us, float* %scevgep2924.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %58, label %polly.cond2952.us.us, label %polly.cond3026.us.us

polly.cond2952.us.us:                             ; preds = %polly.cond2927.us.us
  %polly.access.add.Packed_B2946.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 3
  %polly.access.Packed_B2947.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2946.us.us
  %_p_scalar_2948.us.us = load float, float* %polly.access.Packed_B2947.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2950.us.us = load float, float* %scevgep2949.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2951.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2948.us.us, float %_p_scalar_2950.us.us)
  store float %p_2951.us.us, float* %scevgep2949.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3568, label %polly.cond3026.us.us, label %polly.cond2977.us.us

polly.cond2977.us.us:                             ; preds = %polly.cond2952.us.us
  %polly.access.add.Packed_B2971.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 4
  %polly.access.Packed_B2972.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2971.us.us
  %_p_scalar_2973.us.us = load float, float* %polly.access.Packed_B2972.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2975.us.us = load float, float* %scevgep2974.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2976.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2973.us.us, float %_p_scalar_2975.us.us)
  store float %p_2976.us.us, float* %scevgep2974.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %59, label %polly.cond3002.us.us, label %polly.cond3026.us.us

polly.cond3002.us.us:                             ; preds = %polly.cond2977.us.us
  %polly.access.add.Packed_B2996.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 5
  %polly.access.Packed_B2997.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2996.us.us
  %_p_scalar_2998.us.us = load float, float* %polly.access.Packed_B2997.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3000.us.us = load float, float* %scevgep2999.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3001.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_2998.us.us, float %_p_scalar_3000.us.us)
  store float %p_3001.us.us, float* %scevgep2999.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %62, label %polly.stmt.for.body10.us3007.us.us, label %polly.cond3026.us.us

polly.stmt.for.body10.us3007.us.us:               ; preds = %polly.cond3002.us.us
  %polly.access.add.Packed_B3018.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B3017
  %polly.access.mul.Packed_B3019.us.us = shl nsw i64 %polly.access.add.Packed_B3018.us.us, 3
  %polly.access.add.Packed_B3020.us.us = or i64 %polly.access.mul.Packed_B3019.us.us, 6
  %polly.access.Packed_B3021.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3020.us.us
  %_p_scalar_3022.us.us = load float, float* %polly.access.Packed_B3021.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3024.us.us = load float, float* %scevgep3023.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3025.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2865.us.us, float %_p_scalar_3022.us.us, float %_p_scalar_3024.us.us)
  store float %p_3025.us.us, float* %scevgep3023.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond3026.us.us

polly.cond3026.us.us:                             ; preds = %polly.stmt.for.body10.us3007.us.us, %polly.cond3002.us.us, %polly.cond2977.us.us, %polly.cond2952.us.us, %polly.cond2927.us.us, %polly.cond2902.us.us
  br i1 %.not3548.us.us, label %polly.merge3027.us.us, label %polly.cond3050.us.us

polly.cond3026.us.us.thread:                      ; preds = %polly.cond2877.us.us
  br i1 %.not3548.us.us, label %polly.merge3027.us.us, label %polly.cond3050.us.us.thread

polly.cond3050.us.us.thread:                      ; preds = %polly.cond3026.us.us.thread
  %polly.access.add.Packed_A3036.us.us3740 = or i64 %polly.access.mul.Packed_A2862.us.us, 1
  %polly.access.Packed_A3037.us.us3741 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3036.us.us3740
  %_p_scalar_3038.us.us3742 = load float, float* %polly.access.Packed_A3037.us.us3741, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_3048.us.us3743 = load float, float* %scevgep3047.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3049.us.us3744 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us3742, float %_p_scalar_2873.us.us, float %_p_scalar_3048.us.us3743)
  store float %p_3049.us.us3744, float* %scevgep3047.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond3199.us.us

polly.cond3050.us.us:                             ; preds = %polly.cond3026.us.us
  %polly.access.add.Packed_A3036.us.us = or i64 %polly.access.mul.Packed_A2862.us.us, 1
  %polly.access.Packed_A3037.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3036.us.us
  %_p_scalar_3038.us.us = load float, float* %polly.access.Packed_A3037.us.us, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_3048.us.us = load float, float* %scevgep3047.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3049.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_2873.us.us, float %_p_scalar_3048.us.us)
  store float %p_3049.us.us, float* %scevgep3047.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %55, label %polly.cond3075.us.us, label %polly.cond3199.us.us

polly.cond3075.us.us:                             ; preds = %polly.cond3050.us.us
  %polly.access.add.Packed_B3067.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2893
  %polly.access.mul.Packed_B3068.us.us = shl nsw i64 %polly.access.add.Packed_B3067.us.us, 3
  %polly.access.add.Packed_B3069.us.us = or i64 %polly.access.mul.Packed_B3068.us.us, 1
  %polly.access.Packed_B3070.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3069.us.us
  %_p_scalar_3071.us.us = load float, float* %polly.access.Packed_B3070.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3073.us.us = load float, float* %scevgep3072.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3074.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3071.us.us, float %_p_scalar_3073.us.us)
  store float %p_3074.us.us, float* %scevgep3072.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3566, label %polly.cond3199.us.us, label %polly.cond3100.us.us

polly.cond3100.us.us:                             ; preds = %polly.cond3075.us.us
  %polly.access.add.Packed_B3092.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2918
  %polly.access.mul.Packed_B3093.us.us = shl nsw i64 %polly.access.add.Packed_B3092.us.us, 3
  %polly.access.add.Packed_B3094.us.us = or i64 %polly.access.mul.Packed_B3093.us.us, 2
  %polly.access.Packed_B3095.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3094.us.us
  %_p_scalar_3096.us.us = load float, float* %polly.access.Packed_B3095.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3098.us.us = load float, float* %scevgep3097.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3099.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3096.us.us, float %_p_scalar_3098.us.us)
  store float %p_3099.us.us, float* %scevgep3097.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %58, label %polly.cond3125.us.us, label %polly.cond3199.us.us

polly.cond3125.us.us:                             ; preds = %polly.cond3100.us.us
  %polly.access.add.Packed_B3119.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 3
  %polly.access.Packed_B3120.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3119.us.us
  %_p_scalar_3121.us.us = load float, float* %polly.access.Packed_B3120.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3123.us.us = load float, float* %scevgep3122.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3124.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3121.us.us, float %_p_scalar_3123.us.us)
  store float %p_3124.us.us, float* %scevgep3122.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3568, label %polly.cond3199.us.us, label %polly.cond3150.us.us

polly.cond3150.us.us:                             ; preds = %polly.cond3125.us.us
  %polly.access.add.Packed_B3144.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 4
  %polly.access.Packed_B3145.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3144.us.us
  %_p_scalar_3146.us.us = load float, float* %polly.access.Packed_B3145.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3148.us.us = load float, float* %scevgep3147.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3149.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3146.us.us, float %_p_scalar_3148.us.us)
  store float %p_3149.us.us, float* %scevgep3147.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %59, label %polly.cond3175.us.us, label %polly.cond3199.us.us

polly.cond3175.us.us:                             ; preds = %polly.cond3150.us.us
  %polly.access.add.Packed_B3169.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 5
  %polly.access.Packed_B3170.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3169.us.us
  %_p_scalar_3171.us.us = load float, float* %polly.access.Packed_B3170.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3173.us.us = load float, float* %scevgep3172.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3174.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3171.us.us, float %_p_scalar_3173.us.us)
  store float %p_3174.us.us, float* %scevgep3172.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %62, label %polly.stmt.for.body10.us3180.us.us, label %polly.cond3199.us.us

polly.stmt.for.body10.us3180.us.us:               ; preds = %polly.cond3175.us.us
  %polly.access.add.Packed_B3191.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B3017
  %polly.access.mul.Packed_B3192.us.us = shl nsw i64 %polly.access.add.Packed_B3191.us.us, 3
  %polly.access.add.Packed_B3193.us.us = or i64 %polly.access.mul.Packed_B3192.us.us, 6
  %polly.access.Packed_B3194.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3193.us.us
  %_p_scalar_3195.us.us = load float, float* %polly.access.Packed_B3194.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3197.us.us = load float, float* %scevgep3196.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3198.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3038.us.us, float %_p_scalar_3195.us.us, float %_p_scalar_3197.us.us)
  store float %p_3198.us.us, float* %scevgep3196.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond3199.us.us

polly.cond3199.us.us:                             ; preds = %polly.cond3050.us.us.thread, %polly.stmt.for.body10.us3180.us.us, %polly.cond3175.us.us, %polly.cond3150.us.us, %polly.cond3125.us.us, %polly.cond3100.us.us, %polly.cond3075.us.us, %polly.cond3050.us.us
  br i1 %.not3549.us.us, label %polly.merge3027.us.us, label %polly.cond3223.us.us

polly.cond3223.us.us:                             ; preds = %polly.cond3199.us.us
  %polly.access.add.Packed_A3209.us.us = or i64 %polly.access.mul.Packed_A2862.us.us, 2
  %polly.access.Packed_A3210.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3209.us.us
  %_p_scalar_3211.us.us = load float, float* %polly.access.Packed_A3210.us.us, align 8, !alias.scope !50, !noalias !51
  %_p_scalar_3221.us.us = load float, float* %scevgep3220.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3222.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_2873.us.us, float %_p_scalar_3221.us.us)
  store float %p_3222.us.us, float* %scevgep3220.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %55, label %polly.cond3248.us.us, label %polly.cond3372.us.us.thread

polly.cond3248.us.us:                             ; preds = %polly.cond3223.us.us
  %polly.access.add.Packed_B3240.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2893
  %polly.access.mul.Packed_B3241.us.us = shl nsw i64 %polly.access.add.Packed_B3240.us.us, 3
  %polly.access.add.Packed_B3242.us.us = or i64 %polly.access.mul.Packed_B3241.us.us, 1
  %polly.access.Packed_B3243.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3242.us.us
  %_p_scalar_3244.us.us = load float, float* %polly.access.Packed_B3243.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3246.us.us = load float, float* %scevgep3245.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3247.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3244.us.us, float %_p_scalar_3246.us.us)
  store float %p_3247.us.us, float* %scevgep3245.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3566, label %polly.cond3372.us.us, label %polly.cond3273.us.us

polly.cond3273.us.us:                             ; preds = %polly.cond3248.us.us
  %polly.access.add.Packed_B3265.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2918
  %polly.access.mul.Packed_B3266.us.us = shl nsw i64 %polly.access.add.Packed_B3265.us.us, 3
  %polly.access.add.Packed_B3267.us.us = or i64 %polly.access.mul.Packed_B3266.us.us, 2
  %polly.access.Packed_B3268.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3267.us.us
  %_p_scalar_3269.us.us = load float, float* %polly.access.Packed_B3268.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3271.us.us = load float, float* %scevgep3270.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3272.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3269.us.us, float %_p_scalar_3271.us.us)
  store float %p_3272.us.us, float* %scevgep3270.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %58, label %polly.cond3298.us.us, label %polly.cond3372.us.us

polly.cond3298.us.us:                             ; preds = %polly.cond3273.us.us
  %polly.access.add.Packed_B3292.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 3
  %polly.access.Packed_B3293.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3292.us.us
  %_p_scalar_3294.us.us = load float, float* %polly.access.Packed_B3293.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3296.us.us = load float, float* %scevgep3295.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3297.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3294.us.us, float %_p_scalar_3296.us.us)
  store float %p_3297.us.us, float* %scevgep3295.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3568, label %polly.cond3372.us.us, label %polly.cond3323.us.us

polly.cond3323.us.us:                             ; preds = %polly.cond3298.us.us
  %polly.access.add.Packed_B3317.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 4
  %polly.access.Packed_B3318.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3317.us.us
  %_p_scalar_3319.us.us = load float, float* %polly.access.Packed_B3318.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3321.us.us = load float, float* %scevgep3320.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3322.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3319.us.us, float %_p_scalar_3321.us.us)
  store float %p_3322.us.us, float* %scevgep3320.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %59, label %polly.cond3348.us.us, label %polly.cond3372.us.us

polly.cond3348.us.us:                             ; preds = %polly.cond3323.us.us
  %polly.access.add.Packed_B3342.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 5
  %polly.access.Packed_B3343.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3342.us.us
  %_p_scalar_3344.us.us = load float, float* %polly.access.Packed_B3343.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3346.us.us = load float, float* %scevgep3345.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3347.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3344.us.us, float %_p_scalar_3346.us.us)
  store float %p_3347.us.us, float* %scevgep3345.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %62, label %polly.stmt.for.body10.us3353.us.us, label %polly.cond3372.us.us

polly.stmt.for.body10.us3353.us.us:               ; preds = %polly.cond3348.us.us
  %polly.access.add.Packed_B3364.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B3017
  %polly.access.mul.Packed_B3365.us.us = shl nsw i64 %polly.access.add.Packed_B3364.us.us, 3
  %polly.access.add.Packed_B3366.us.us = or i64 %polly.access.mul.Packed_B3365.us.us, 6
  %polly.access.Packed_B3367.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3366.us.us
  %_p_scalar_3368.us.us = load float, float* %polly.access.Packed_B3367.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3370.us.us = load float, float* %scevgep3369.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3371.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3211.us.us, float %_p_scalar_3368.us.us, float %_p_scalar_3370.us.us)
  store float %p_3371.us.us, float* %scevgep3369.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond3372.us.us

polly.cond3372.us.us:                             ; preds = %polly.stmt.for.body10.us3353.us.us, %polly.cond3348.us.us, %polly.cond3323.us.us, %polly.cond3298.us.us, %polly.cond3273.us.us, %polly.cond3248.us.us
  br i1 %.not3550.us.us, label %polly.merge3027.us.us, label %polly.cond3396.us.us

polly.cond3372.us.us.thread:                      ; preds = %polly.cond3223.us.us
  br i1 %.not3550.us.us, label %polly.merge3027.us.us, label %polly.cond3396.us.us.thread

polly.cond3396.us.us.thread:                      ; preds = %polly.cond3372.us.us.thread
  %polly.access.add.Packed_A3382.us.us3745 = or i64 %polly.access.mul.Packed_A2862.us.us, 3
  %polly.access.Packed_A3383.us.us3746 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3382.us.us3745
  %_p_scalar_3384.us.us3747 = load float, float* %polly.access.Packed_A3383.us.us3746, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_3394.us.us3748 = load float, float* %scevgep3393.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3395.us.us3749 = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us3747, float %_p_scalar_2873.us.us, float %_p_scalar_3394.us.us3748)
  store float %p_3395.us.us3749, float* %scevgep3393.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge3027.us.us

polly.cond3396.us.us:                             ; preds = %polly.cond3372.us.us
  %polly.access.add.Packed_A3382.us.us = or i64 %polly.access.mul.Packed_A2862.us.us, 3
  %polly.access.Packed_A3383.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3382.us.us
  %_p_scalar_3384.us.us = load float, float* %polly.access.Packed_A3383.us.us, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_3394.us.us = load float, float* %scevgep3393.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3395.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_2873.us.us, float %_p_scalar_3394.us.us)
  store float %p_3395.us.us, float* %scevgep3393.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %55, label %polly.cond3421.us.us, label %polly.merge3027.us.us

polly.cond3421.us.us:                             ; preds = %polly.cond3396.us.us
  %polly.access.add.Packed_B3413.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2893
  %polly.access.mul.Packed_B3414.us.us = shl nsw i64 %polly.access.add.Packed_B3413.us.us, 3
  %polly.access.add.Packed_B3415.us.us = or i64 %polly.access.mul.Packed_B3414.us.us, 1
  %polly.access.Packed_B3416.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3415.us.us
  %_p_scalar_3417.us.us = load float, float* %polly.access.Packed_B3416.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3419.us.us = load float, float* %scevgep3418.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3420.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3417.us.us, float %_p_scalar_3419.us.us)
  store float %p_3420.us.us, float* %scevgep3418.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3566, label %polly.merge3027.us.us, label %polly.cond3446.us.us

polly.cond3446.us.us:                             ; preds = %polly.cond3421.us.us
  %polly.access.add.Packed_B3438.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B2918
  %polly.access.mul.Packed_B3439.us.us = shl nsw i64 %polly.access.add.Packed_B3438.us.us, 3
  %polly.access.add.Packed_B3440.us.us = or i64 %polly.access.mul.Packed_B3439.us.us, 2
  %polly.access.Packed_B3441.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3440.us.us
  %_p_scalar_3442.us.us = load float, float* %polly.access.Packed_B3441.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3444.us.us = load float, float* %scevgep3443.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3445.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3442.us.us, float %_p_scalar_3444.us.us)
  store float %p_3445.us.us, float* %scevgep3443.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %58, label %polly.cond3471.us.us, label %polly.merge3027.us.us

polly.cond3471.us.us:                             ; preds = %polly.cond3446.us.us
  %polly.access.add.Packed_B3465.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 3
  %polly.access.Packed_B3466.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3465.us.us
  %_p_scalar_3467.us.us = load float, float* %polly.access.Packed_B3466.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3469.us.us = load float, float* %scevgep3468.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3470.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3467.us.us, float %_p_scalar_3469.us.us)
  store float %p_3470.us.us, float* %scevgep3468.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3568, label %polly.merge3027.us.us, label %polly.cond3496.us.us

polly.cond3496.us.us:                             ; preds = %polly.cond3471.us.us
  %polly.access.add.Packed_B3490.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 4
  %polly.access.Packed_B3491.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3490.us.us
  %_p_scalar_3492.us.us = load float, float* %polly.access.Packed_B3491.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_3494.us.us = load float, float* %scevgep3493.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3495.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3492.us.us, float %_p_scalar_3494.us.us)
  store float %p_3495.us.us, float* %scevgep3493.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %59, label %polly.cond3521.us.us, label %polly.merge3027.us.us

polly.cond3521.us.us:                             ; preds = %polly.cond3496.us.us
  %polly.access.add.Packed_B3515.us.us = or i64 %polly.access.mul.Packed_B2870.us.us, 5
  %polly.access.Packed_B3516.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3515.us.us
  %_p_scalar_3517.us.us = load float, float* %polly.access.Packed_B3516.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_3519.us.us = load float, float* %scevgep3518.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3520.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3517.us.us, float %_p_scalar_3519.us.us)
  store float %p_3520.us.us, float* %scevgep3518.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %62, label %polly.stmt.for.body10.us3526.us.us, label %polly.merge3027.us.us

polly.stmt.for.body10.us3526.us.us:               ; preds = %polly.cond3521.us.us
  %polly.access.add.Packed_B3537.us.us = add nsw i64 %polly.indvar2854.us.us, %polly.access.mul.Packed_B3017
  %polly.access.mul.Packed_B3538.us.us = shl nsw i64 %polly.access.add.Packed_B3537.us.us, 3
  %polly.access.add.Packed_B3539.us.us = or i64 %polly.access.mul.Packed_B3538.us.us, 6
  %polly.access.Packed_B3540.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3539.us.us
  %_p_scalar_3541.us.us = load float, float* %polly.access.Packed_B3540.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_3543.us.us = load float, float* %scevgep3542.us.us, align 4, !alias.scope !54, !noalias !55
  %p_3544.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_3384.us.us, float %_p_scalar_3541.us.us, float %_p_scalar_3543.us.us)
  store float %p_3544.us.us, float* %scevgep3542.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge3027.us.us

polly.merge3027.us.us:                            ; preds = %polly.cond3396.us.us.thread, %polly.cond3372.us.us.thread, %polly.cond3026.us.us.thread, %polly.stmt.for.body10.us3526.us.us, %polly.cond3521.us.us, %polly.cond3496.us.us, %polly.cond3471.us.us, %polly.cond3446.us.us, %polly.cond3421.us.us, %polly.cond3396.us.us, %polly.cond3372.us.us, %polly.cond3199.us.us, %polly.cond3026.us.us
  %polly.indvar_next2855.us.us = add nuw nsw i64 %polly.indvar2854.us.us, 1
  %exitcond3720.not = icmp eq i64 %polly.indvar2854.us.us, %smin3731
  br i1 %exitcond3720.not, label %polly.loop_exit2852.loopexit.us.us, label %polly.cond2877.us.us, !llvm.loop !60

polly.loop_exit2852.loopexit.us.us:               ; preds = %polly.merge3027.us.us
  %polly.indvar_next2847.us.us = add nuw nsw i64 %polly.indvar2846.us.us, 1
  %exitcond3724.not = icmp eq i64 %polly.indvar2846.us.us, %smin3733
  br i1 %exitcond3724.not, label %polly.merge1710.us, label %polly.loop_if2849.us.us

polly.loop_if2332.us.us:                          ; preds = %polly.loop_if2332.preheader.us, %polly.loop_exit2335.loopexit.us.us
  %polly.indvar2329.us.us = phi i64 [ %polly.indvar_next2330.us.us, %polly.loop_exit2335.loopexit.us.us ], [ 0, %polly.loop_if2332.preheader.us ]
  %402 = shl nsw i64 %polly.indvar2329.us.us, 3
  %403 = add nuw nsw i64 %402, %71
  %polly.access.mul.Packed_B2348.us.us = shl nsw i64 %polly.indvar2329.us.us, 9
  %404 = add i64 %403, %261
  %scevgep2354.us.us = getelementptr float, float* %C, i64 %404
  %405 = or i64 %403, 2
  %.not3571.us.us = icmp sgt i64 %405, %K
  %406 = add i64 %263, %403
  %scevgep2375.us.us = getelementptr float, float* %C, i64 %406
  %407 = or i64 %403, 3
  %.not3585.us.us = icmp sgt i64 %407, %K
  %408 = add i64 %405, %261
  %scevgep2396.us.us = getelementptr float, float* %C, i64 %408
  %409 = or i64 %403, 4
  %.not3586.us.us = icmp sgt i64 %409, %K
  %410 = add i64 %407, %261
  %scevgep2417.us.us = getelementptr float, float* %C, i64 %410
  %411 = or i64 %403, 5
  %.not3587.us.us = icmp sgt i64 %411, %K
  %412 = add i64 %409, %261
  %scevgep2438.us.us = getelementptr float, float* %C, i64 %412
  %413 = or i64 %403, 6
  %.not3588.us.us = icmp sgt i64 %413, %K
  %414 = add i64 %411, %261
  %scevgep2459.us.us = getelementptr float, float* %C, i64 %414
  %415 = or i64 %403, 7
  %.not3589.us.us = icmp sgt i64 %415, %K
  %416 = add i64 %413, %261
  %scevgep2480.us.us = getelementptr float, float* %C, i64 %416
  %417 = add nuw nsw i64 %403, 8
  %.not3590.us.us = icmp sgt i64 %417, %K
  %418 = add i64 %415, %261
  %scevgep2501.us.us = getelementptr float, float* %C, i64 %418
  %419 = add i64 %403, %265
  %scevgep2522.us.us = getelementptr float, float* %C, i64 %419
  %420 = add i64 %266, %403
  %scevgep2543.us.us = getelementptr float, float* %C, i64 %420
  %421 = add i64 %405, %265
  %scevgep2564.us.us = getelementptr float, float* %C, i64 %421
  %422 = add i64 %407, %265
  %scevgep2585.us.us = getelementptr float, float* %C, i64 %422
  %423 = add i64 %409, %265
  %scevgep2606.us.us = getelementptr float, float* %C, i64 %423
  %424 = add i64 %411, %265
  %scevgep2627.us.us = getelementptr float, float* %C, i64 %424
  %425 = add i64 %413, %265
  %scevgep2648.us.us = getelementptr float, float* %C, i64 %425
  %426 = add i64 %415, %265
  %scevgep2669.us.us = getelementptr float, float* %C, i64 %426
  %427 = add i64 %403, %52
  %scevgep2690.us.us = getelementptr float, float* %C, i64 %427
  %428 = add i64 %64, %403
  %scevgep2711.us.us = getelementptr float, float* %C, i64 %428
  %429 = add i64 %405, %52
  %scevgep2732.us.us = getelementptr float, float* %C, i64 %429
  %430 = add i64 %407, %52
  %scevgep2753.us.us = getelementptr float, float* %C, i64 %430
  %431 = add i64 %409, %52
  %scevgep2774.us.us = getelementptr float, float* %C, i64 %431
  %432 = add i64 %411, %52
  %scevgep2795.us.us = getelementptr float, float* %C, i64 %432
  %433 = add i64 %413, %52
  %scevgep2816.us.us = getelementptr float, float* %C, i64 %433
  %434 = add i64 %415, %52
  %scevgep2837.us.us = getelementptr float, float* %C, i64 %434
  br label %polly.cond2357.us.us

polly.cond2357.us.us:                             ; preds = %polly.merge2505.us.us, %polly.loop_if2332.us.us
  %polly.indvar2337.us.us = phi i64 [ %polly.indvar_next2338.us.us, %polly.merge2505.us.us ], [ 0, %polly.loop_if2332.us.us ]
  %polly.access.mul.Packed_A2343.us.us = shl nsw i64 %polly.indvar2337.us.us, 2
  %polly.access.Packed_A2345.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2343.us.us
  %_p_scalar_2346.us.us = load float, float* %polly.access.Packed_A2345.us.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.add.Packed_B2349.us.us = add nuw nsw i64 %polly.indvar2337.us.us, %polly.access.mul.Packed_B2348.us.us
  %polly.access.mul.Packed_B2350.us.us = shl nsw i64 %polly.access.add.Packed_B2349.us.us, 3
  %polly.access.Packed_B2352.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2350.us.us
  %_p_scalar_2353.us.us = load float, float* %polly.access.Packed_B2352.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_2355.us.us = load float, float* %scevgep2354.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2356.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2353.us.us, float %_p_scalar_2355.us.us)
  store float %p_2356.us.us, float* %scevgep2354.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3571.us.us, label %polly.cond2504.us.us.thread, label %polly.cond2378.us.us

polly.cond2378.us.us:                             ; preds = %polly.cond2357.us.us
  %polly.access.add.Packed_B2372.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 1
  %polly.access.Packed_B2373.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2372.us.us
  %_p_scalar_2374.us.us = load float, float* %polly.access.Packed_B2373.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2376.us.us = load float, float* %scevgep2375.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2377.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2374.us.us, float %_p_scalar_2376.us.us)
  store float %p_2377.us.us, float* %scevgep2375.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3585.us.us, label %polly.cond2504.us.us, label %polly.cond2399.us.us

polly.cond2399.us.us:                             ; preds = %polly.cond2378.us.us
  %polly.access.add.Packed_B2393.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 2
  %polly.access.Packed_B2394.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2393.us.us
  %_p_scalar_2395.us.us = load float, float* %polly.access.Packed_B2394.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2397.us.us = load float, float* %scevgep2396.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2398.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2395.us.us, float %_p_scalar_2397.us.us)
  store float %p_2398.us.us, float* %scevgep2396.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3586.us.us, label %polly.cond2504.us.us, label %polly.cond2420.us.us

polly.cond2420.us.us:                             ; preds = %polly.cond2399.us.us
  %polly.access.add.Packed_B2414.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 3
  %polly.access.Packed_B2415.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2414.us.us
  %_p_scalar_2416.us.us = load float, float* %polly.access.Packed_B2415.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2418.us.us = load float, float* %scevgep2417.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2419.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2416.us.us, float %_p_scalar_2418.us.us)
  store float %p_2419.us.us, float* %scevgep2417.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3587.us.us, label %polly.cond2504.us.us, label %polly.cond2441.us.us

polly.cond2441.us.us:                             ; preds = %polly.cond2420.us.us
  %polly.access.add.Packed_B2435.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 4
  %polly.access.Packed_B2436.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2435.us.us
  %_p_scalar_2437.us.us = load float, float* %polly.access.Packed_B2436.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2439.us.us = load float, float* %scevgep2438.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2440.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2437.us.us, float %_p_scalar_2439.us.us)
  store float %p_2440.us.us, float* %scevgep2438.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3588.us.us, label %polly.cond2504.us.us, label %polly.cond2462.us.us

polly.cond2462.us.us:                             ; preds = %polly.cond2441.us.us
  %polly.access.add.Packed_B2456.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 5
  %polly.access.Packed_B2457.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2456.us.us
  %_p_scalar_2458.us.us = load float, float* %polly.access.Packed_B2457.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2460.us.us = load float, float* %scevgep2459.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2461.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2458.us.us, float %_p_scalar_2460.us.us)
  store float %p_2461.us.us, float* %scevgep2459.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3589.us.us, label %polly.cond2504.us.us, label %polly.cond2483.us.us

polly.cond2483.us.us:                             ; preds = %polly.cond2462.us.us
  %polly.access.add.Packed_B2477.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 6
  %polly.access.Packed_B2478.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2477.us.us
  %_p_scalar_2479.us.us = load float, float* %polly.access.Packed_B2478.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2481.us.us = load float, float* %scevgep2480.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2482.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2479.us.us, float %_p_scalar_2481.us.us)
  store float %p_2482.us.us, float* %scevgep2480.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3590.us.us, label %polly.cond2504.us.us, label %polly.stmt.for.body10.us2487.us.us

polly.stmt.for.body10.us2487.us.us:               ; preds = %polly.cond2483.us.us
  %polly.access.add.Packed_B2498.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 7
  %polly.access.Packed_B2499.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2498.us.us
  %_p_scalar_2500.us.us = load float, float* %polly.access.Packed_B2499.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2502.us.us = load float, float* %scevgep2501.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2503.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2346.us.us, float %_p_scalar_2500.us.us, float %_p_scalar_2502.us.us)
  store float %p_2503.us.us, float* %scevgep2501.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond2504.us.us

polly.cond2504.us.us:                             ; preds = %polly.stmt.for.body10.us2487.us.us, %polly.cond2483.us.us, %polly.cond2462.us.us, %polly.cond2441.us.us, %polly.cond2420.us.us, %polly.cond2399.us.us, %polly.cond2378.us.us
  br i1 %.not3572.us, label %polly.merge2505.us.us, label %polly.cond2525.us.us

polly.cond2504.us.us.thread:                      ; preds = %polly.cond2357.us.us
  br i1 %.not3572.us, label %polly.merge2505.us.us, label %polly.cond2525.us.us.thread

polly.cond2525.us.us.thread:                      ; preds = %polly.cond2504.us.us.thread
  %polly.access.add.Packed_A2512.us.us3750 = or i64 %polly.access.mul.Packed_A2343.us.us, 1
  %polly.access.Packed_A2513.us.us3751 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2512.us.us3750
  %_p_scalar_2514.us.us3752 = load float, float* %polly.access.Packed_A2513.us.us3751, align 4, !alias.scope !50, !noalias !51
  br label %polly.cond2672.us.us.sink.split

polly.cond2525.us.us:                             ; preds = %polly.cond2504.us.us
  %polly.access.add.Packed_A2512.us.us = or i64 %polly.access.mul.Packed_A2343.us.us, 1
  %polly.access.Packed_A2513.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2512.us.us
  %_p_scalar_2514.us.us = load float, float* %polly.access.Packed_A2513.us.us, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_2523.us.us = load float, float* %scevgep2522.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2524.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2353.us.us, float %_p_scalar_2523.us.us)
  store float %p_2524.us.us, float* %scevgep2522.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3571.us.us, label %polly.cond2672.us.us, label %polly.cond2546.us.us

polly.cond2546.us.us:                             ; preds = %polly.cond2525.us.us
  %polly.access.add.Packed_B2540.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 1
  %polly.access.Packed_B2541.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2540.us.us
  %_p_scalar_2542.us.us = load float, float* %polly.access.Packed_B2541.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2544.us.us = load float, float* %scevgep2543.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2545.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2542.us.us, float %_p_scalar_2544.us.us)
  store float %p_2545.us.us, float* %scevgep2543.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3585.us.us, label %polly.cond2672.us.us, label %polly.cond2567.us.us

polly.cond2567.us.us:                             ; preds = %polly.cond2546.us.us
  %polly.access.add.Packed_B2561.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 2
  %polly.access.Packed_B2562.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2561.us.us
  %_p_scalar_2563.us.us = load float, float* %polly.access.Packed_B2562.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2565.us.us = load float, float* %scevgep2564.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2566.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2563.us.us, float %_p_scalar_2565.us.us)
  store float %p_2566.us.us, float* %scevgep2564.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3586.us.us, label %polly.cond2672.us.us, label %polly.cond2588.us.us

polly.cond2588.us.us:                             ; preds = %polly.cond2567.us.us
  %polly.access.add.Packed_B2582.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 3
  %polly.access.Packed_B2583.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2582.us.us
  %_p_scalar_2584.us.us = load float, float* %polly.access.Packed_B2583.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2586.us.us = load float, float* %scevgep2585.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2587.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2584.us.us, float %_p_scalar_2586.us.us)
  store float %p_2587.us.us, float* %scevgep2585.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3587.us.us, label %polly.cond2672.us.us, label %polly.cond2609.us.us

polly.cond2609.us.us:                             ; preds = %polly.cond2588.us.us
  %polly.access.add.Packed_B2603.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 4
  %polly.access.Packed_B2604.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2603.us.us
  %_p_scalar_2605.us.us = load float, float* %polly.access.Packed_B2604.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2607.us.us = load float, float* %scevgep2606.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2608.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2605.us.us, float %_p_scalar_2607.us.us)
  store float %p_2608.us.us, float* %scevgep2606.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3588.us.us, label %polly.cond2672.us.us, label %polly.cond2630.us.us

polly.cond2630.us.us:                             ; preds = %polly.cond2609.us.us
  %polly.access.add.Packed_B2624.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 5
  %polly.access.Packed_B2625.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2624.us.us
  %_p_scalar_2626.us.us = load float, float* %polly.access.Packed_B2625.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2628.us.us = load float, float* %scevgep2627.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2629.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2626.us.us, float %_p_scalar_2628.us.us)
  store float %p_2629.us.us, float* %scevgep2627.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3589.us.us, label %polly.cond2672.us.us, label %polly.cond2651.us.us

polly.cond2651.us.us:                             ; preds = %polly.cond2630.us.us
  %polly.access.add.Packed_B2645.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 6
  %polly.access.Packed_B2646.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2645.us.us
  %_p_scalar_2647.us.us = load float, float* %polly.access.Packed_B2646.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2649.us.us = load float, float* %scevgep2648.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2650.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us, float %_p_scalar_2647.us.us, float %_p_scalar_2649.us.us)
  store float %p_2650.us.us, float* %scevgep2648.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3590.us.us, label %polly.cond2672.us.us, label %polly.stmt.for.body10.us2655.us.us

polly.stmt.for.body10.us2655.us.us:               ; preds = %polly.cond2651.us.us
  %polly.access.add.Packed_B2666.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 7
  %polly.access.Packed_B2667.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2666.us.us
  %_p_scalar_2668.us.us = load float, float* %polly.access.Packed_B2667.us.us, align 4, !alias.scope !44, !noalias !45
  br label %polly.cond2672.us.us.sink.split

polly.cond2672.us.us.sink.split:                  ; preds = %polly.stmt.for.body10.us2655.us.us, %polly.cond2525.us.us.thread
  %scevgep2522.us.us.sink3775 = phi float* [ %scevgep2522.us.us, %polly.cond2525.us.us.thread ], [ %scevgep2669.us.us, %polly.stmt.for.body10.us2655.us.us ]
  %_p_scalar_2353.us.us.sink = phi float [ %_p_scalar_2353.us.us, %polly.cond2525.us.us.thread ], [ %_p_scalar_2668.us.us, %polly.stmt.for.body10.us2655.us.us ]
  %_p_scalar_2514.us.us3752.sink = phi float [ %_p_scalar_2514.us.us3752, %polly.cond2525.us.us.thread ], [ %_p_scalar_2514.us.us, %polly.stmt.for.body10.us2655.us.us ]
  %_p_scalar_2523.us.us3753 = load float, float* %scevgep2522.us.us.sink3775, align 4, !alias.scope !54, !noalias !55
  %p_2524.us.us3754 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2514.us.us3752.sink, float %_p_scalar_2353.us.us.sink, float %_p_scalar_2523.us.us3753)
  store float %p_2524.us.us3754, float* %scevgep2522.us.us.sink3775, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond2672.us.us

polly.cond2672.us.us:                             ; preds = %polly.cond2672.us.us.sink.split, %polly.cond2651.us.us, %polly.cond2630.us.us, %polly.cond2609.us.us, %polly.cond2588.us.us, %polly.cond2567.us.us, %polly.cond2546.us.us, %polly.cond2525.us.us
  br i1 %267, label %polly.cond2693.us.us, label %polly.merge2505.us.us

polly.cond2693.us.us:                             ; preds = %polly.cond2672.us.us
  %polly.access.add.Packed_A2680.us.us = or i64 %polly.access.mul.Packed_A2343.us.us, 2
  %polly.access.Packed_A2681.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2680.us.us
  %_p_scalar_2682.us.us = load float, float* %polly.access.Packed_A2681.us.us, align 8, !alias.scope !50, !noalias !51
  %_p_scalar_2691.us.us = load float, float* %scevgep2690.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2692.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2353.us.us, float %_p_scalar_2691.us.us)
  store float %p_2692.us.us, float* %scevgep2690.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3571.us.us, label %polly.merge2505.us.us, label %polly.cond2714.us.us

polly.cond2714.us.us:                             ; preds = %polly.cond2693.us.us
  %polly.access.add.Packed_B2708.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 1
  %polly.access.Packed_B2709.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2708.us.us
  %_p_scalar_2710.us.us = load float, float* %polly.access.Packed_B2709.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2712.us.us = load float, float* %scevgep2711.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2713.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2710.us.us, float %_p_scalar_2712.us.us)
  store float %p_2713.us.us, float* %scevgep2711.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3585.us.us, label %polly.merge2505.us.us, label %polly.cond2735.us.us

polly.cond2735.us.us:                             ; preds = %polly.cond2714.us.us
  %polly.access.add.Packed_B2729.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 2
  %polly.access.Packed_B2730.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2729.us.us
  %_p_scalar_2731.us.us = load float, float* %polly.access.Packed_B2730.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2733.us.us = load float, float* %scevgep2732.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2734.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2731.us.us, float %_p_scalar_2733.us.us)
  store float %p_2734.us.us, float* %scevgep2732.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3586.us.us, label %polly.merge2505.us.us, label %polly.cond2756.us.us

polly.cond2756.us.us:                             ; preds = %polly.cond2735.us.us
  %polly.access.add.Packed_B2750.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 3
  %polly.access.Packed_B2751.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2750.us.us
  %_p_scalar_2752.us.us = load float, float* %polly.access.Packed_B2751.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2754.us.us = load float, float* %scevgep2753.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2755.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2752.us.us, float %_p_scalar_2754.us.us)
  store float %p_2755.us.us, float* %scevgep2753.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3587.us.us, label %polly.merge2505.us.us, label %polly.cond2777.us.us

polly.cond2777.us.us:                             ; preds = %polly.cond2756.us.us
  %polly.access.add.Packed_B2771.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 4
  %polly.access.Packed_B2772.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2771.us.us
  %_p_scalar_2773.us.us = load float, float* %polly.access.Packed_B2772.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2775.us.us = load float, float* %scevgep2774.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2776.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2773.us.us, float %_p_scalar_2775.us.us)
  store float %p_2776.us.us, float* %scevgep2774.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3588.us.us, label %polly.merge2505.us.us, label %polly.cond2798.us.us

polly.cond2798.us.us:                             ; preds = %polly.cond2777.us.us
  %polly.access.add.Packed_B2792.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 5
  %polly.access.Packed_B2793.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2792.us.us
  %_p_scalar_2794.us.us = load float, float* %polly.access.Packed_B2793.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2796.us.us = load float, float* %scevgep2795.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2797.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2794.us.us, float %_p_scalar_2796.us.us)
  store float %p_2797.us.us, float* %scevgep2795.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3589.us.us, label %polly.merge2505.us.us, label %polly.cond2819.us.us

polly.cond2819.us.us:                             ; preds = %polly.cond2798.us.us
  %polly.access.add.Packed_B2813.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 6
  %polly.access.Packed_B2814.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2813.us.us
  %_p_scalar_2815.us.us = load float, float* %polly.access.Packed_B2814.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2817.us.us = load float, float* %scevgep2816.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2818.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2815.us.us, float %_p_scalar_2817.us.us)
  store float %p_2818.us.us, float* %scevgep2816.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3590.us.us, label %polly.merge2505.us.us, label %polly.stmt.for.body10.us2823.us.us

polly.stmt.for.body10.us2823.us.us:               ; preds = %polly.cond2819.us.us
  %polly.access.add.Packed_B2834.us.us = or i64 %polly.access.mul.Packed_B2350.us.us, 7
  %polly.access.Packed_B2835.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2834.us.us
  %_p_scalar_2836.us.us = load float, float* %polly.access.Packed_B2835.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2838.us.us = load float, float* %scevgep2837.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2839.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2682.us.us, float %_p_scalar_2836.us.us, float %_p_scalar_2838.us.us)
  store float %p_2839.us.us, float* %scevgep2837.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge2505.us.us

polly.merge2505.us.us:                            ; preds = %polly.cond2504.us.us.thread, %polly.stmt.for.body10.us2823.us.us, %polly.cond2819.us.us, %polly.cond2798.us.us, %polly.cond2777.us.us, %polly.cond2756.us.us, %polly.cond2735.us.us, %polly.cond2714.us.us, %polly.cond2693.us.us, %polly.cond2672.us.us, %polly.cond2504.us.us
  %polly.indvar_next2338.us.us = add nuw nsw i64 %polly.indvar2337.us.us, 1
  %exitcond3726.not = icmp eq i64 %polly.indvar2337.us.us, %smin3731
  br i1 %exitcond3726.not, label %polly.loop_exit2335.loopexit.us.us, label %polly.cond2357.us.us, !llvm.loop !61

polly.loop_exit2335.loopexit.us.us:               ; preds = %polly.merge2505.us.us
  %polly.indvar_next2330.us.us = add nuw nsw i64 %polly.indvar2329.us.us, 1
  %exitcond3730.not = icmp eq i64 %polly.indvar2329.us.us, %smin3729
  br i1 %exitcond3730.not, label %polly.merge1710.us, label %polly.loop_if2332.us.us

polly.loop_if1727.us.us:                          ; preds = %polly.loop_if1719.us, %polly.loop_exit1730.loopexit.us.us
  %polly.indvar1724.us.us = phi i64 [ %polly.indvar_next1725.us.us, %polly.loop_exit1730.loopexit.us.us ], [ 0, %polly.loop_if1719.us ]
  %435 = shl nsw i64 %polly.indvar1724.us.us, 2
  %436 = add nuw nsw i64 %435, %125
  %polly.access.mul.Packed_A1737.us.us = shl nsw i64 %polly.indvar1724.us.us, 9
  %437 = mul i64 %436, %N
  %438 = add i64 %437, %71
  %scevgep1749.us.us = getelementptr float, float* %C, i64 %438
  %439 = or i64 %436, 2
  %.not3593.us.us = icmp sgt i64 %439, %M
  %440 = add i64 %86, %437
  %scevgep1770.us.us = getelementptr float, float* %C, i64 %440
  %441 = add i64 %437, %85
  %scevgep1791.us.us = getelementptr float, float* %C, i64 %441
  %442 = add i64 %437, %87
  %scevgep1812.us.us = getelementptr float, float* %C, i64 %442
  %443 = add i64 %437, %88
  %scevgep1833.us.us = getelementptr float, float* %C, i64 %443
  %444 = add i64 %437, %89
  %scevgep1854.us.us = getelementptr float, float* %C, i64 %444
  %445 = add i64 %437, %.res
  %scevgep1875.us.us = getelementptr float, float* %C, i64 %445
  %446 = or i64 %436, 1
  %447 = mul i64 %446, %N
  %448 = add i64 %447, %71
  %scevgep1896.us.us = getelementptr float, float* %C, i64 %448
  %449 = add i64 %86, %447
  %scevgep1917.us.us = getelementptr float, float* %C, i64 %449
  %450 = add i64 %447, %85
  %scevgep1938.us.us = getelementptr float, float* %C, i64 %450
  %451 = add i64 %447, %87
  %scevgep1959.us.us = getelementptr float, float* %C, i64 %451
  %452 = add i64 %447, %88
  %scevgep1980.us.us = getelementptr float, float* %C, i64 %452
  %453 = add i64 %447, %89
  %scevgep2001.us.us = getelementptr float, float* %C, i64 %453
  %454 = add i64 %447, %.res
  %scevgep2022.us.us = getelementptr float, float* %C, i64 %454
  %455 = or i64 %436, 3
  %.not3594.us.us = icmp sgt i64 %455, %M
  %456 = mul i64 %439, %N
  %457 = add i64 %456, %71
  %scevgep2043.us.us = getelementptr float, float* %C, i64 %457
  %458 = add i64 %86, %456
  %scevgep2064.us.us = getelementptr float, float* %C, i64 %458
  %459 = add i64 %456, %85
  %scevgep2085.us.us = getelementptr float, float* %C, i64 %459
  %460 = add i64 %456, %87
  %scevgep2106.us.us = getelementptr float, float* %C, i64 %460
  %461 = add i64 %456, %88
  %scevgep2127.us.us = getelementptr float, float* %C, i64 %461
  %462 = add i64 %456, %89
  %scevgep2148.us.us = getelementptr float, float* %C, i64 %462
  %463 = add i64 %456, %.res
  %scevgep2169.us.us = getelementptr float, float* %C, i64 %463
  %464 = add nuw nsw i64 %436, 4
  %.not3595.us.us = icmp sgt i64 %464, %M
  %465 = mul i64 %455, %N
  %466 = add i64 %465, %71
  %scevgep2190.us.us = getelementptr float, float* %C, i64 %466
  %467 = add i64 %86, %465
  %scevgep2211.us.us = getelementptr float, float* %C, i64 %467
  %468 = add i64 %465, %85
  %scevgep2232.us.us = getelementptr float, float* %C, i64 %468
  %469 = add i64 %465, %87
  %scevgep2253.us.us = getelementptr float, float* %C, i64 %469
  %470 = add i64 %465, %88
  %scevgep2274.us.us = getelementptr float, float* %C, i64 %470
  %471 = add i64 %465, %89
  %scevgep2295.us.us = getelementptr float, float* %C, i64 %471
  %472 = add i64 %465, %.res
  %scevgep2316.us.us = getelementptr float, float* %C, i64 %472
  br label %polly.cond1752.us.us

polly.cond1752.us.us:                             ; preds = %polly.merge1879.us.us, %polly.loop_if1727.us.us
  %polly.indvar1732.us.us = phi i64 [ %polly.indvar_next1733.us.us, %polly.merge1879.us.us ], [ 0, %polly.loop_if1727.us.us ]
  %polly.access.add.Packed_A1738.us.us = add nuw nsw i64 %polly.indvar1732.us.us, %polly.access.mul.Packed_A1737.us.us
  %polly.access.mul.Packed_A1739.us.us = shl nsw i64 %polly.access.add.Packed_A1738.us.us, 2
  %polly.access.Packed_A1741.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1739.us.us
  %_p_scalar_1742.us.us = load float, float* %polly.access.Packed_A1741.us.us, align 16, !alias.scope !50, !noalias !51
  %polly.access.mul.Packed_B1745.us.us = shl nsw i64 %polly.indvar1732.us.us, 3
  %polly.access.Packed_B1747.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1745.us.us
  %_p_scalar_1748.us.us = load float, float* %polly.access.Packed_B1747.us.us, align 32, !alias.scope !44, !noalias !45
  %_p_scalar_1750.us.us = load float, float* %scevgep1749.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1751.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1748.us.us, float %_p_scalar_1750.us.us)
  store float %p_1751.us.us, float* %scevgep1749.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3592, label %polly.cond1878.us.us.thread, label %polly.cond1773.us.us

polly.cond1773.us.us:                             ; preds = %polly.cond1752.us.us
  %polly.access.add.Packed_B1767.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 1
  %polly.access.Packed_B1768.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1767.us.us
  %_p_scalar_1769.us.us = load float, float* %polly.access.Packed_B1768.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1771.us.us = load float, float* %scevgep1770.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1772.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1769.us.us, float %_p_scalar_1771.us.us)
  store float %p_1772.us.us, float* %scevgep1770.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3608, label %polly.cond1878.us.us, label %polly.cond1794.us.us

polly.cond1794.us.us:                             ; preds = %polly.cond1773.us.us
  %polly.access.add.Packed_B1788.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 2
  %polly.access.Packed_B1789.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1788.us.us
  %_p_scalar_1790.us.us = load float, float* %polly.access.Packed_B1789.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1792.us.us = load float, float* %scevgep1791.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1793.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1790.us.us, float %_p_scalar_1792.us.us)
  store float %p_1793.us.us, float* %scevgep1791.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3609, label %polly.cond1878.us.us, label %polly.cond1815.us.us

polly.cond1815.us.us:                             ; preds = %polly.cond1794.us.us
  %polly.access.add.Packed_B1809.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 3
  %polly.access.Packed_B1810.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1809.us.us
  %_p_scalar_1811.us.us = load float, float* %polly.access.Packed_B1810.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1813.us.us = load float, float* %scevgep1812.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1814.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1811.us.us, float %_p_scalar_1813.us.us)
  store float %p_1814.us.us, float* %scevgep1812.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3610, label %polly.cond1878.us.us, label %polly.cond1836.us.us

polly.cond1836.us.us:                             ; preds = %polly.cond1815.us.us
  %polly.access.add.Packed_B1830.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 4
  %polly.access.Packed_B1831.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1830.us.us
  %_p_scalar_1832.us.us = load float, float* %polly.access.Packed_B1831.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_1834.us.us = load float, float* %scevgep1833.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1835.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1832.us.us, float %_p_scalar_1834.us.us)
  store float %p_1835.us.us, float* %scevgep1833.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3611, label %polly.cond1878.us.us, label %polly.cond1857.us.us

polly.cond1857.us.us:                             ; preds = %polly.cond1836.us.us
  %polly.access.add.Packed_B1851.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 5
  %polly.access.Packed_B1852.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1851.us.us
  %_p_scalar_1853.us.us = load float, float* %polly.access.Packed_B1852.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1855.us.us = load float, float* %scevgep1854.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1856.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1853.us.us, float %_p_scalar_1855.us.us)
  store float %p_1856.us.us, float* %scevgep1854.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %91, label %polly.stmt.for.body10.us1861.us.us, label %polly.cond1878.us.us

polly.stmt.for.body10.us1861.us.us:               ; preds = %polly.cond1857.us.us
  %polly.access.add.Packed_B1872.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 6
  %polly.access.Packed_B1873.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1872.us.us
  %_p_scalar_1874.us.us = load float, float* %polly.access.Packed_B1873.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1876.us.us = load float, float* %scevgep1875.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1877.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1742.us.us, float %_p_scalar_1874.us.us, float %_p_scalar_1876.us.us)
  store float %p_1877.us.us, float* %scevgep1875.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond1878.us.us

polly.cond1878.us.us:                             ; preds = %polly.stmt.for.body10.us1861.us.us, %polly.cond1857.us.us, %polly.cond1836.us.us, %polly.cond1815.us.us, %polly.cond1794.us.us, %polly.cond1773.us.us
  br i1 %.not3593.us.us, label %polly.merge1879.us.us, label %polly.cond1899.us.us

polly.cond1878.us.us.thread:                      ; preds = %polly.cond1752.us.us
  br i1 %.not3593.us.us, label %polly.merge1879.us.us, label %polly.cond1899.us.us.thread

polly.cond1899.us.us.thread:                      ; preds = %polly.cond1878.us.us.thread
  %polly.access.add.Packed_A1887.us.us3755 = or i64 %polly.access.mul.Packed_A1739.us.us, 1
  %polly.access.Packed_A1888.us.us3756 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1887.us.us3755
  %_p_scalar_1889.us.us3757 = load float, float* %polly.access.Packed_A1888.us.us3756, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_1897.us.us3758 = load float, float* %scevgep1896.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1898.us.us3759 = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us3757, float %_p_scalar_1748.us.us, float %_p_scalar_1897.us.us3758)
  store float %p_1898.us.us3759, float* %scevgep1896.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond2025.us.us

polly.cond1899.us.us:                             ; preds = %polly.cond1878.us.us
  %polly.access.add.Packed_A1887.us.us = or i64 %polly.access.mul.Packed_A1739.us.us, 1
  %polly.access.Packed_A1888.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1887.us.us
  %_p_scalar_1889.us.us = load float, float* %polly.access.Packed_A1888.us.us, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_1897.us.us = load float, float* %scevgep1896.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1898.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_1748.us.us, float %_p_scalar_1897.us.us)
  store float %p_1898.us.us, float* %scevgep1896.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3592, label %polly.cond2025.us.us, label %polly.cond1920.us.us

polly.cond1920.us.us:                             ; preds = %polly.cond1899.us.us
  %polly.access.add.Packed_B1914.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 1
  %polly.access.Packed_B1915.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1914.us.us
  %_p_scalar_1916.us.us = load float, float* %polly.access.Packed_B1915.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1918.us.us = load float, float* %scevgep1917.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1919.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_1916.us.us, float %_p_scalar_1918.us.us)
  store float %p_1919.us.us, float* %scevgep1917.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3608, label %polly.cond2025.us.us, label %polly.cond1941.us.us

polly.cond1941.us.us:                             ; preds = %polly.cond1920.us.us
  %polly.access.add.Packed_B1935.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 2
  %polly.access.Packed_B1936.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1935.us.us
  %_p_scalar_1937.us.us = load float, float* %polly.access.Packed_B1936.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_1939.us.us = load float, float* %scevgep1938.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1940.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_1937.us.us, float %_p_scalar_1939.us.us)
  store float %p_1940.us.us, float* %scevgep1938.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3609, label %polly.cond2025.us.us, label %polly.cond1962.us.us

polly.cond1962.us.us:                             ; preds = %polly.cond1941.us.us
  %polly.access.add.Packed_B1956.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 3
  %polly.access.Packed_B1957.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1956.us.us
  %_p_scalar_1958.us.us = load float, float* %polly.access.Packed_B1957.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_1960.us.us = load float, float* %scevgep1959.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1961.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_1958.us.us, float %_p_scalar_1960.us.us)
  store float %p_1961.us.us, float* %scevgep1959.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3610, label %polly.cond2025.us.us, label %polly.cond1983.us.us

polly.cond1983.us.us:                             ; preds = %polly.cond1962.us.us
  %polly.access.add.Packed_B1977.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 4
  %polly.access.Packed_B1978.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1977.us.us
  %_p_scalar_1979.us.us = load float, float* %polly.access.Packed_B1978.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_1981.us.us = load float, float* %scevgep1980.us.us, align 4, !alias.scope !54, !noalias !55
  %p_1982.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_1979.us.us, float %_p_scalar_1981.us.us)
  store float %p_1982.us.us, float* %scevgep1980.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3611, label %polly.cond2025.us.us, label %polly.cond2004.us.us

polly.cond2004.us.us:                             ; preds = %polly.cond1983.us.us
  %polly.access.add.Packed_B1998.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 5
  %polly.access.Packed_B1999.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1998.us.us
  %_p_scalar_2000.us.us = load float, float* %polly.access.Packed_B1999.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2002.us.us = load float, float* %scevgep2001.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2003.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_2000.us.us, float %_p_scalar_2002.us.us)
  store float %p_2003.us.us, float* %scevgep2001.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %91, label %polly.stmt.for.body10.us2008.us.us, label %polly.cond2025.us.us

polly.stmt.for.body10.us2008.us.us:               ; preds = %polly.cond2004.us.us
  %polly.access.add.Packed_B2019.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 6
  %polly.access.Packed_B2020.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2019.us.us
  %_p_scalar_2021.us.us = load float, float* %polly.access.Packed_B2020.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2023.us.us = load float, float* %scevgep2022.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2024.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_1889.us.us, float %_p_scalar_2021.us.us, float %_p_scalar_2023.us.us)
  store float %p_2024.us.us, float* %scevgep2022.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond2025.us.us

polly.cond2025.us.us:                             ; preds = %polly.cond1899.us.us.thread, %polly.stmt.for.body10.us2008.us.us, %polly.cond2004.us.us, %polly.cond1983.us.us, %polly.cond1962.us.us, %polly.cond1941.us.us, %polly.cond1920.us.us, %polly.cond1899.us.us
  br i1 %.not3594.us.us, label %polly.merge1879.us.us, label %polly.cond2046.us.us

polly.cond2046.us.us:                             ; preds = %polly.cond2025.us.us
  %polly.access.add.Packed_A2034.us.us = or i64 %polly.access.mul.Packed_A1739.us.us, 2
  %polly.access.Packed_A2035.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2034.us.us
  %_p_scalar_2036.us.us = load float, float* %polly.access.Packed_A2035.us.us, align 8, !alias.scope !50, !noalias !51
  %_p_scalar_2044.us.us = load float, float* %scevgep2043.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2045.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_1748.us.us, float %_p_scalar_2044.us.us)
  store float %p_2045.us.us, float* %scevgep2043.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3592, label %polly.cond2172.us.us.thread, label %polly.cond2067.us.us

polly.cond2067.us.us:                             ; preds = %polly.cond2046.us.us
  %polly.access.add.Packed_B2061.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 1
  %polly.access.Packed_B2062.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2061.us.us
  %_p_scalar_2063.us.us = load float, float* %polly.access.Packed_B2062.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2065.us.us = load float, float* %scevgep2064.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2066.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2063.us.us, float %_p_scalar_2065.us.us)
  store float %p_2066.us.us, float* %scevgep2064.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3608, label %polly.cond2172.us.us, label %polly.cond2088.us.us

polly.cond2088.us.us:                             ; preds = %polly.cond2067.us.us
  %polly.access.add.Packed_B2082.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 2
  %polly.access.Packed_B2083.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2082.us.us
  %_p_scalar_2084.us.us = load float, float* %polly.access.Packed_B2083.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2086.us.us = load float, float* %scevgep2085.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2087.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2084.us.us, float %_p_scalar_2086.us.us)
  store float %p_2087.us.us, float* %scevgep2085.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3609, label %polly.cond2172.us.us, label %polly.cond2109.us.us

polly.cond2109.us.us:                             ; preds = %polly.cond2088.us.us
  %polly.access.add.Packed_B2103.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 3
  %polly.access.Packed_B2104.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2103.us.us
  %_p_scalar_2105.us.us = load float, float* %polly.access.Packed_B2104.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2107.us.us = load float, float* %scevgep2106.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2108.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2105.us.us, float %_p_scalar_2107.us.us)
  store float %p_2108.us.us, float* %scevgep2106.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3610, label %polly.cond2172.us.us, label %polly.cond2130.us.us

polly.cond2130.us.us:                             ; preds = %polly.cond2109.us.us
  %polly.access.add.Packed_B2124.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 4
  %polly.access.Packed_B2125.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2124.us.us
  %_p_scalar_2126.us.us = load float, float* %polly.access.Packed_B2125.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2128.us.us = load float, float* %scevgep2127.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2129.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2126.us.us, float %_p_scalar_2128.us.us)
  store float %p_2129.us.us, float* %scevgep2127.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3611, label %polly.cond2172.us.us, label %polly.cond2151.us.us

polly.cond2151.us.us:                             ; preds = %polly.cond2130.us.us
  %polly.access.add.Packed_B2145.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 5
  %polly.access.Packed_B2146.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2145.us.us
  %_p_scalar_2147.us.us = load float, float* %polly.access.Packed_B2146.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2149.us.us = load float, float* %scevgep2148.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2150.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2147.us.us, float %_p_scalar_2149.us.us)
  store float %p_2150.us.us, float* %scevgep2148.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %91, label %polly.stmt.for.body10.us2155.us.us, label %polly.cond2172.us.us

polly.stmt.for.body10.us2155.us.us:               ; preds = %polly.cond2151.us.us
  %polly.access.add.Packed_B2166.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 6
  %polly.access.Packed_B2167.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2166.us.us
  %_p_scalar_2168.us.us = load float, float* %polly.access.Packed_B2167.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2170.us.us = load float, float* %scevgep2169.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2171.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2036.us.us, float %_p_scalar_2168.us.us, float %_p_scalar_2170.us.us)
  store float %p_2171.us.us, float* %scevgep2169.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.cond2172.us.us

polly.cond2172.us.us:                             ; preds = %polly.stmt.for.body10.us2155.us.us, %polly.cond2151.us.us, %polly.cond2130.us.us, %polly.cond2109.us.us, %polly.cond2088.us.us, %polly.cond2067.us.us
  br i1 %.not3595.us.us, label %polly.merge1879.us.us, label %polly.cond2193.us.us

polly.cond2172.us.us.thread:                      ; preds = %polly.cond2046.us.us
  br i1 %.not3595.us.us, label %polly.merge1879.us.us, label %polly.cond2193.us.us.thread

polly.cond2193.us.us.thread:                      ; preds = %polly.cond2172.us.us.thread
  %polly.access.add.Packed_A2181.us.us3760 = or i64 %polly.access.mul.Packed_A1739.us.us, 3
  %polly.access.Packed_A2182.us.us3761 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2181.us.us3760
  %_p_scalar_2183.us.us3762 = load float, float* %polly.access.Packed_A2182.us.us3761, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_2191.us.us3763 = load float, float* %scevgep2190.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2192.us.us3764 = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us3762, float %_p_scalar_1748.us.us, float %_p_scalar_2191.us.us3763)
  store float %p_2192.us.us3764, float* %scevgep2190.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge1879.us.us

polly.cond2193.us.us:                             ; preds = %polly.cond2172.us.us
  %polly.access.add.Packed_A2181.us.us = or i64 %polly.access.mul.Packed_A1739.us.us, 3
  %polly.access.Packed_A2182.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2181.us.us
  %_p_scalar_2183.us.us = load float, float* %polly.access.Packed_A2182.us.us, align 4, !alias.scope !50, !noalias !51
  %_p_scalar_2191.us.us = load float, float* %scevgep2190.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2192.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_1748.us.us, float %_p_scalar_2191.us.us)
  store float %p_2192.us.us, float* %scevgep2190.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3592, label %polly.merge1879.us.us, label %polly.cond2214.us.us

polly.cond2214.us.us:                             ; preds = %polly.cond2193.us.us
  %polly.access.add.Packed_B2208.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 1
  %polly.access.Packed_B2209.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2208.us.us
  %_p_scalar_2210.us.us = load float, float* %polly.access.Packed_B2209.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2212.us.us = load float, float* %scevgep2211.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2213.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2210.us.us, float %_p_scalar_2212.us.us)
  store float %p_2213.us.us, float* %scevgep2211.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3608, label %polly.merge1879.us.us, label %polly.cond2235.us.us

polly.cond2235.us.us:                             ; preds = %polly.cond2214.us.us
  %polly.access.add.Packed_B2229.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 2
  %polly.access.Packed_B2230.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2229.us.us
  %_p_scalar_2231.us.us = load float, float* %polly.access.Packed_B2230.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2233.us.us = load float, float* %scevgep2232.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2234.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2231.us.us, float %_p_scalar_2233.us.us)
  store float %p_2234.us.us, float* %scevgep2232.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3609, label %polly.merge1879.us.us, label %polly.cond2256.us.us

polly.cond2256.us.us:                             ; preds = %polly.cond2235.us.us
  %polly.access.add.Packed_B2250.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 3
  %polly.access.Packed_B2251.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2250.us.us
  %_p_scalar_2252.us.us = load float, float* %polly.access.Packed_B2251.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2254.us.us = load float, float* %scevgep2253.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2255.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2252.us.us, float %_p_scalar_2254.us.us)
  store float %p_2255.us.us, float* %scevgep2253.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3610, label %polly.merge1879.us.us, label %polly.cond2277.us.us

polly.cond2277.us.us:                             ; preds = %polly.cond2256.us.us
  %polly.access.add.Packed_B2271.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 4
  %polly.access.Packed_B2272.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2271.us.us
  %_p_scalar_2273.us.us = load float, float* %polly.access.Packed_B2272.us.us, align 16, !alias.scope !44, !noalias !45
  %_p_scalar_2275.us.us = load float, float* %scevgep2274.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2276.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2273.us.us, float %_p_scalar_2275.us.us)
  store float %p_2276.us.us, float* %scevgep2274.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %.not3611, label %polly.merge1879.us.us, label %polly.cond2298.us.us

polly.cond2298.us.us:                             ; preds = %polly.cond2277.us.us
  %polly.access.add.Packed_B2292.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 5
  %polly.access.Packed_B2293.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2292.us.us
  %_p_scalar_2294.us.us = load float, float* %polly.access.Packed_B2293.us.us, align 4, !alias.scope !44, !noalias !45
  %_p_scalar_2296.us.us = load float, float* %scevgep2295.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2297.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2294.us.us, float %_p_scalar_2296.us.us)
  store float %p_2297.us.us, float* %scevgep2295.us.us, align 4, !alias.scope !54, !noalias !55
  br i1 %91, label %polly.stmt.for.body10.us2302.us.us, label %polly.merge1879.us.us

polly.stmt.for.body10.us2302.us.us:               ; preds = %polly.cond2298.us.us
  %polly.access.add.Packed_B2313.us.us = or i64 %polly.access.mul.Packed_B1745.us.us, 6
  %polly.access.Packed_B2314.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2313.us.us
  %_p_scalar_2315.us.us = load float, float* %polly.access.Packed_B2314.us.us, align 8, !alias.scope !44, !noalias !45
  %_p_scalar_2317.us.us = load float, float* %scevgep2316.us.us, align 4, !alias.scope !54, !noalias !55
  %p_2318.us.us = tail call float @llvm.fmuladd.f32(float %_p_scalar_2183.us.us, float %_p_scalar_2315.us.us, float %_p_scalar_2317.us.us)
  store float %p_2318.us.us, float* %scevgep2316.us.us, align 4, !alias.scope !54, !noalias !55
  br label %polly.merge1879.us.us

polly.merge1879.us.us:                            ; preds = %polly.cond2193.us.us.thread, %polly.cond2172.us.us.thread, %polly.cond1878.us.us.thread, %polly.stmt.for.body10.us2302.us.us, %polly.cond2298.us.us, %polly.cond2277.us.us, %polly.cond2256.us.us, %polly.cond2235.us.us, %polly.cond2214.us.us, %polly.cond2193.us.us, %polly.cond2172.us.us, %polly.cond2025.us.us, %polly.cond1878.us.us
  %polly.indvar_next1733.us.us = add nuw nsw i64 %polly.indvar1732.us.us, 1
  %exitcond3732.not = icmp eq i64 %polly.indvar1732.us.us, %smin3731
  br i1 %exitcond3732.not, label %polly.loop_exit1730.loopexit.us.us, label %polly.cond1752.us.us, !llvm.loop !62

polly.loop_exit1730.loopexit.us.us:               ; preds = %polly.merge1879.us.us
  %polly.indvar_next1725.us.us = add nuw nsw i64 %polly.indvar1724.us.us, 1
  %exitcond3734.not = icmp eq i64 %polly.indvar1724.us.us, %smin3733
  br i1 %exitcond3734.not, label %polly.merge1710.us, label %polly.loop_if1727.us.us
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind readonly willreturn uwtable
define dso_local noundef i1 @_Z6verifyPfS_mm(float* nocapture noundef readonly %C, float* nocapture noundef readonly %_C, i64 noundef %M, i64 noundef %N) local_unnamed_addr #7 {
entry.split:
  %mul = mul i64 %N, %M
  %cmp7.not = icmp eq i64 %mul, 0
  br i1 %cmp7.not, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry.split
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
  br i1 %exitcond.not, label %cleanup.loopexit, label %for.body, !llvm.loop !63

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds float, float* %C, i64 %inc
  %4 = load float, float* %arrayidx, align 4, !tbaa !8
  %arrayidx1 = getelementptr inbounds float, float* %_C, i64 %inc
  %5 = load float, float* %arrayidx1, align 4, !tbaa !8
  %sub = fsub float %4, %5
  %6 = tail call float @llvm.fabs.f32(float %sub)
  %7 = fpext float %6 to double
  %cmp2 = fcmp ogt double %7, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2, label %cleanup.loopexit, label %for.cond, !llvm.loop !63

cleanup.loopexit:                                 ; preds = %for.cond, %for.body
  %cmp.le = icmp uge i64 %inc, %mul
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %for.body.preheader, %entry.split
  %cmp.lcssa = phi i1 [ true, %entry.split ], [ false, %for.body.preheader ], [ %cmp.le, %cleanup.loopexit ]
  ret i1 %cmp.lcssa
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #8 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry.split:
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
  %Packed_B = alloca [256 x [512 x [8 x float]]], align 64
  %Packed_A = alloca [24 x [512 x [4 x float]]], align 64
  %0 = bitcast i64* %M to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #30
  %1 = bitcast i64* %N to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #30
  %2 = bitcast i64* %K to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #30
  %cmp.not = icmp eq i32 %argc, 4
  br i1 %cmp.not, label %if.else, label %if.then

if.then:                                          ; preds = %entry.split
  %3 = load i8*, i8** %argv, align 8, !tbaa !64
  %call = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef %3)
  %call1 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  %call.i = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call1)
  tail call void @exit(i32 noundef 1) #31
  unreachable

if.else:                                          ; preds = %entry.split
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 1
  %4 = load i8*, i8** %arrayidx3, align 8, !tbaa !64
  %call4 = tail call i64 @strtol(i8* nocapture noundef %4, i8** noundef null, i32 noundef 10) #30
  store i64 %call4, i64* %M, align 8, !tbaa !66
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 2
  %5 = load i8*, i8** %arrayidx5, align 8, !tbaa !64
  %call6 = tail call i64 @strtol(i8* nocapture noundef %5, i8** noundef null, i32 noundef 10) #30
  store i64 %call6, i64* %N, align 8, !tbaa !66
  %arrayidx7 = getelementptr inbounds i8*, i8** %argv, i64 3
  %6 = load i8*, i8** %arrayidx7, align 8, !tbaa !64
  %call8 = tail call i64 @strtol(i8* nocapture noundef %6, i8** noundef null, i32 noundef 10) #30
  store i64 %call8, i64* %K, align 8, !tbaa !66
  %7 = bitcast %"class.cl::sycl::queue"* %q to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #30
  %8 = bitcast %"class.cl::sycl::property_list"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %8) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %8, i8 0, i64 32, i1 false)
  invoke void @_ZN2cl4sycl5queueC2ERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.else
  %_M_start.i.i = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %9 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i, align 8, !tbaa !68
  %_M_finish.i.i = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %10 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i, align 8, !tbaa !70
  %cmp.not3.i.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %9, %10
  br i1 %cmp.not3.i.i.i.i.i, label %invoke.cont.i.i, label %for.body.i.i.i.i.i

for.body.i.i.i.i.i:                               ; preds = %invoke.cont, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i
  %__first.addr.04.i.i.i.i.i = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i ], [ %9, %invoke.cont ]
  %_M_pi.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i:                          ; preds = %for.body.i.i.i.i.i
  %_M_use_count.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i

if.else.i.i.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i.i

invoke.cont.i.i.i.i.i.i.i.i.i:                    ; preds = %if.else.i.i.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i.i.i.i.i.i.i ], [ %13, %if.else.i.i.i.i.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i:                        ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i, label %if.else.i11.i.i.i.i.i.i.i.i.i

if.then.i9.i.i.i.i.i.i.i.i.i:                     ; preds = %if.then.i.i.i.i.i.i.i.i.i
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i

if.else.i11.i.i.i.i.i.i.i.i.i:                    ; preds = %if.then.i.i.i.i.i.i.i.i.i
  %17 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i

invoke.cont2.i.i.i.i.i.i.i.i.i:                   ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i, %if.then.i9.i.i.i.i.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i.i.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i.i.i.i.i.i.i ], [ %17, %if.else.i11.i.i.i.i.i.i.i.i.i ]
  %cmp4.i.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i, label %if.then5.i.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

if.then5.i.i.i.i.i.i.i.i.i:                       ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i
  %vtable6.i.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i: ; preds = %if.then5.i.i.i.i.i.i.i.i.i, %invoke.cont2.i.i.i.i.i.i.i.i.i, %invoke.cont.i.i.i.i.i.i.i.i.i, %for.body.i.i.i.i.i
  %incdec.ptr.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i, i64 1
  %cmp.not.i.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i, %10
  br i1 %cmp.not.i.i.i.i.i, label %invoke.cont.loopexit.i.i, label %for.body.i.i.i.i.i, !llvm.loop !77

invoke.cont.loopexit.i.i:                         ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i
  %.pre.i.i = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i, align 8, !tbaa !68
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
  %22 = load i64, i64* %M, align 8, !tbaa !66
  %23 = load i64, i64* %K, align 8, !tbaa !66
  %24 = bitcast %"class.cl::sycl::property_list"* %ref.tmp9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %24) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %24, i8 0, i64 32, i1 false)
  %mul = mul i64 %23, %22
  %MFileName.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i, align 8, !tbaa !78, !alias.scope !80
  %MFunctionName.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i, align 8, !tbaa !83, !alias.scope !80
  %MLineNo.i.i = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp, i64 0, i32 2
  %25 = bitcast i64* %MLineNo.i.i to <2 x i64>*
  store <2 x i64> <i64 64, i64 12>, <2 x i64>* %25, align 8, !tbaa !66, !alias.scope !80
  %call14 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp9, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp)
          to label %invoke.cont13 unwind label %lpad12

invoke.cont13:                                    ; preds = %invoke.cont11
  %_M_start.i.i143 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %26 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i143, align 8, !tbaa !68
  %_M_finish.i.i144 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %27 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i144, align 8, !tbaa !70
  %cmp.not3.i.i.i.i.i145 = icmp eq %"class.std::shared_ptr.0"* %26, %27
  br i1 %cmp.not3.i.i.i.i.i145, label %invoke.cont.i.i177, label %for.body.i.i.i.i.i149

for.body.i.i.i.i.i149:                            ; preds = %invoke.cont13, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173
  %__first.addr.04.i.i.i.i.i146 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i171, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173 ], [ %26, %invoke.cont13 ]
  %_M_pi.i.i.i.i.i.i.i.i147 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i146, i64 0, i32 0, i32 1, i32 0
  %28 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i147, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i.i148 = icmp eq %"class.std::_Sp_counted_base"* %28, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i148, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173, label %if.then.i.i.i.i.i.i.i.i151

if.then.i.i.i.i.i.i.i.i151:                       ; preds = %for.body.i.i.i.i.i149
  %_M_use_count.i.i.i.i.i.i.i.i.i150 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %28, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i152, label %if.else.i.i.i.i.i.i.i.i.i.i154

if.then.i.i.i.i.i.i.i.i.i.i152:                   ; preds = %if.then.i.i.i.i.i.i.i.i151
  %29 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i157

if.else.i.i.i.i.i.i.i.i.i.i154:                   ; preds = %if.then.i.i.i.i.i.i.i.i151
  %30 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i.i153 = add nsw i32 %30, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i153, i32* %_M_use_count.i.i.i.i.i.i.i.i.i150, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i.i157

invoke.cont.i.i.i.i.i.i.i.i.i157:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i154, %if.then.i.i.i.i.i.i.i.i.i.i152
  %retval.0.i.i.i.i.i.i.i.i.i.i155 = phi i32 [ %29, %if.then.i.i.i.i.i.i.i.i.i.i152 ], [ %30, %if.else.i.i.i.i.i.i.i.i.i.i154 ]
  %cmp.i.i.i.i.i.i.i.i.i156 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i155, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i156, label %if.then.i.i.i.i.i.i.i.i.i161, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

if.then.i.i.i.i.i.i.i.i.i161:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i157
  %31 = bitcast %"class.std::_Sp_counted_base"* %28 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i158 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %31, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i.i159 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i158, i64 2
  %32 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i159, align 8
  call void %32(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %28) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i160 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %28, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i162, label %if.else.i11.i.i.i.i.i.i.i.i.i164

if.then.i9.i.i.i.i.i.i.i.i.i162:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i161
  %33 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i167

if.else.i11.i.i.i.i.i.i.i.i.i164:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i161
  %34 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i.i163 = add nsw i32 %34, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i163, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i160, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i167

invoke.cont2.i.i.i.i.i.i.i.i.i167:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i164, %if.then.i9.i.i.i.i.i.i.i.i.i162
  %retval.0.i12.i.i.i.i.i.i.i.i.i165 = phi i32 [ %33, %if.then.i9.i.i.i.i.i.i.i.i.i162 ], [ %34, %if.else.i11.i.i.i.i.i.i.i.i.i164 ]
  %cmp4.i.i.i.i.i.i.i.i.i166 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i165, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i166, label %if.then5.i.i.i.i.i.i.i.i.i170, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

if.then5.i.i.i.i.i.i.i.i.i170:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i167
  %vtable6.i.i.i.i.i.i.i.i.i168 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %31, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i.i169 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i168, i64 3
  %35 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i169, align 8
  call void %35(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %28) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173: ; preds = %if.then5.i.i.i.i.i.i.i.i.i170, %invoke.cont2.i.i.i.i.i.i.i.i.i167, %invoke.cont.i.i.i.i.i.i.i.i.i157, %for.body.i.i.i.i.i149
  %incdec.ptr.i.i.i.i.i171 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i146, i64 1
  %cmp.not.i.i.i.i.i172 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i171, %27
  br i1 %cmp.not.i.i.i.i.i172, label %invoke.cont.loopexit.i.i175, label %for.body.i.i.i.i.i149, !llvm.loop !77

invoke.cont.loopexit.i.i175:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i173
  %.pre.i.i174 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i143, align 8, !tbaa !68
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
  store float* %call14, float** %A, align 8, !tbaa !64
  %38 = bitcast float** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #30
  %39 = load i64, i64* %K, align 8, !tbaa !66
  %40 = load i64, i64* %N, align 8, !tbaa !66
  %41 = bitcast %"class.cl::sycl::property_list"* %ref.tmp16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %41) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %41, i8 0, i64 32, i1 false)
  %mul15 = mul i64 %40, %39
  %MFileName.i.i180 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i180, align 8, !tbaa !78, !alias.scope !84
  %MFunctionName.i.i181 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i181, align 8, !tbaa !83, !alias.scope !84
  %MLineNo.i.i182 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp19, i64 0, i32 2
  %42 = bitcast i64* %MLineNo.i.i182 to <2 x i64>*
  store <2 x i64> <i64 65, i64 12>, <2 x i64>* %42, align 8, !tbaa !66, !alias.scope !84
  %call22 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul15, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp16, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp19)
          to label %invoke.cont21 unwind label %lpad20

invoke.cont21:                                    ; preds = %invoke.cont18
  %_M_start.i.i184 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %43 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i184, align 8, !tbaa !68
  %_M_finish.i.i185 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %44 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i185, align 8, !tbaa !70
  %cmp.not3.i.i.i.i.i186 = icmp eq %"class.std::shared_ptr.0"* %43, %44
  br i1 %cmp.not3.i.i.i.i.i186, label %invoke.cont.i.i218, label %for.body.i.i.i.i.i190

for.body.i.i.i.i.i190:                            ; preds = %invoke.cont21, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214
  %__first.addr.04.i.i.i.i.i187 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i212, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214 ], [ %43, %invoke.cont21 ]
  %_M_pi.i.i.i.i.i.i.i.i188 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i187, i64 0, i32 0, i32 1, i32 0
  %45 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i188, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i.i189 = icmp eq %"class.std::_Sp_counted_base"* %45, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i189, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214, label %if.then.i.i.i.i.i.i.i.i192

if.then.i.i.i.i.i.i.i.i192:                       ; preds = %for.body.i.i.i.i.i190
  %_M_use_count.i.i.i.i.i.i.i.i.i191 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %45, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i193, label %if.else.i.i.i.i.i.i.i.i.i.i195

if.then.i.i.i.i.i.i.i.i.i.i193:                   ; preds = %if.then.i.i.i.i.i.i.i.i192
  %46 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i198

if.else.i.i.i.i.i.i.i.i.i.i195:                   ; preds = %if.then.i.i.i.i.i.i.i.i192
  %47 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i.i194 = add nsw i32 %47, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i194, i32* %_M_use_count.i.i.i.i.i.i.i.i.i191, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i.i198

invoke.cont.i.i.i.i.i.i.i.i.i198:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i195, %if.then.i.i.i.i.i.i.i.i.i.i193
  %retval.0.i.i.i.i.i.i.i.i.i.i196 = phi i32 [ %46, %if.then.i.i.i.i.i.i.i.i.i.i193 ], [ %47, %if.else.i.i.i.i.i.i.i.i.i.i195 ]
  %cmp.i.i.i.i.i.i.i.i.i197 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i196, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i197, label %if.then.i.i.i.i.i.i.i.i.i202, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

if.then.i.i.i.i.i.i.i.i.i202:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i198
  %48 = bitcast %"class.std::_Sp_counted_base"* %45 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i199 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %48, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i.i200 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i199, i64 2
  %49 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i200, align 8
  call void %49(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %45) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i201 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %45, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i203, label %if.else.i11.i.i.i.i.i.i.i.i.i205

if.then.i9.i.i.i.i.i.i.i.i.i203:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i202
  %50 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i208

if.else.i11.i.i.i.i.i.i.i.i.i205:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i202
  %51 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i.i204 = add nsw i32 %51, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i204, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i201, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i208

invoke.cont2.i.i.i.i.i.i.i.i.i208:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i205, %if.then.i9.i.i.i.i.i.i.i.i.i203
  %retval.0.i12.i.i.i.i.i.i.i.i.i206 = phi i32 [ %50, %if.then.i9.i.i.i.i.i.i.i.i.i203 ], [ %51, %if.else.i11.i.i.i.i.i.i.i.i.i205 ]
  %cmp4.i.i.i.i.i.i.i.i.i207 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i206, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i207, label %if.then5.i.i.i.i.i.i.i.i.i211, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

if.then5.i.i.i.i.i.i.i.i.i211:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i208
  %vtable6.i.i.i.i.i.i.i.i.i209 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %48, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i.i210 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i209, i64 3
  %52 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i210, align 8
  call void %52(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %45) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214: ; preds = %if.then5.i.i.i.i.i.i.i.i.i211, %invoke.cont2.i.i.i.i.i.i.i.i.i208, %invoke.cont.i.i.i.i.i.i.i.i.i198, %for.body.i.i.i.i.i190
  %incdec.ptr.i.i.i.i.i212 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i187, i64 1
  %cmp.not.i.i.i.i.i213 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i212, %44
  br i1 %cmp.not.i.i.i.i.i213, label %invoke.cont.loopexit.i.i216, label %for.body.i.i.i.i.i190, !llvm.loop !77

invoke.cont.loopexit.i.i216:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i214
  %.pre.i.i215 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i184, align 8, !tbaa !68
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
  store float* %call22, float** %B, align 8, !tbaa !64
  %55 = bitcast float** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %55) #30
  %56 = load i64, i64* %M, align 8, !tbaa !66
  %57 = load i64, i64* %N, align 8, !tbaa !66
  %58 = bitcast %"class.cl::sycl::property_list"* %ref.tmp26 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %58) #30
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %58, i8 0, i64 32, i1 false)
  %mul25 = mul i64 %57, %56
  %MFileName.i.i221 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i221, align 8, !tbaa !78, !alias.scope !87
  %MFunctionName.i.i222 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i222, align 8, !tbaa !83, !alias.scope !87
  %MLineNo.i.i223 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %agg.tmp29, i64 0, i32 2
  %59 = bitcast i64* %MLineNo.i.i223 to <2 x i64>*
  store <2 x i64> <i64 66, i64 12>, <2 x i64>* %59, align 8, !tbaa !66, !alias.scope !87
  %call32 = invoke noundef float* @_ZN2cl4sycl13malloc_sharedIfEEPT_mRKNS0_5queueERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef %mul25, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %ref.tmp26, %"struct.cl::sycl::detail::code_location"* noundef nonnull %agg.tmp29)
          to label %invoke.cont31 unwind label %lpad30

invoke.cont31:                                    ; preds = %invoke.cont28
  %_M_start.i.i225 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %60 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i225, align 8, !tbaa !68
  %_M_finish.i.i226 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %61 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i226, align 8, !tbaa !70
  %cmp.not3.i.i.i.i.i227 = icmp eq %"class.std::shared_ptr.0"* %60, %61
  br i1 %cmp.not3.i.i.i.i.i227, label %invoke.cont.i.i259, label %for.body.i.i.i.i.i231

for.body.i.i.i.i.i231:                            ; preds = %invoke.cont31, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255
  %__first.addr.04.i.i.i.i.i228 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i253, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255 ], [ %60, %invoke.cont31 ]
  %_M_pi.i.i.i.i.i.i.i.i229 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i228, i64 0, i32 0, i32 1, i32 0
  %62 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i229, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i.i230 = icmp eq %"class.std::_Sp_counted_base"* %62, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i230, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255, label %if.then.i.i.i.i.i.i.i.i233

if.then.i.i.i.i.i.i.i.i233:                       ; preds = %for.body.i.i.i.i.i231
  %_M_use_count.i.i.i.i.i.i.i.i.i232 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %62, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i234, label %if.else.i.i.i.i.i.i.i.i.i.i236

if.then.i.i.i.i.i.i.i.i.i.i234:                   ; preds = %if.then.i.i.i.i.i.i.i.i233
  %63 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i239

if.else.i.i.i.i.i.i.i.i.i.i236:                   ; preds = %if.then.i.i.i.i.i.i.i.i233
  %64 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i.i235 = add nsw i32 %64, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i235, i32* %_M_use_count.i.i.i.i.i.i.i.i.i232, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i.i239

invoke.cont.i.i.i.i.i.i.i.i.i239:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i236, %if.then.i.i.i.i.i.i.i.i.i.i234
  %retval.0.i.i.i.i.i.i.i.i.i.i237 = phi i32 [ %63, %if.then.i.i.i.i.i.i.i.i.i.i234 ], [ %64, %if.else.i.i.i.i.i.i.i.i.i.i236 ]
  %cmp.i.i.i.i.i.i.i.i.i238 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i237, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i238, label %if.then.i.i.i.i.i.i.i.i.i243, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

if.then.i.i.i.i.i.i.i.i.i243:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i239
  %65 = bitcast %"class.std::_Sp_counted_base"* %62 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i240 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %65, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i.i241 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i240, i64 2
  %66 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i241, align 8
  call void %66(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %62) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i242 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %62, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i244, label %if.else.i11.i.i.i.i.i.i.i.i.i246

if.then.i9.i.i.i.i.i.i.i.i.i244:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i243
  %67 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i249

if.else.i11.i.i.i.i.i.i.i.i.i246:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i243
  %68 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i.i245 = add nsw i32 %68, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i245, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i242, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i249

invoke.cont2.i.i.i.i.i.i.i.i.i249:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i246, %if.then.i9.i.i.i.i.i.i.i.i.i244
  %retval.0.i12.i.i.i.i.i.i.i.i.i247 = phi i32 [ %67, %if.then.i9.i.i.i.i.i.i.i.i.i244 ], [ %68, %if.else.i11.i.i.i.i.i.i.i.i.i246 ]
  %cmp4.i.i.i.i.i.i.i.i.i248 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i247, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i248, label %if.then5.i.i.i.i.i.i.i.i.i252, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

if.then5.i.i.i.i.i.i.i.i.i252:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i249
  %vtable6.i.i.i.i.i.i.i.i.i250 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %65, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i.i251 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i250, i64 3
  %69 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i251, align 8
  call void %69(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %62) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255: ; preds = %if.then5.i.i.i.i.i.i.i.i.i252, %invoke.cont2.i.i.i.i.i.i.i.i.i249, %invoke.cont.i.i.i.i.i.i.i.i.i239, %for.body.i.i.i.i.i231
  %incdec.ptr.i.i.i.i.i253 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i228, i64 1
  %cmp.not.i.i.i.i.i254 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i253, %61
  br i1 %cmp.not.i.i.i.i.i254, label %invoke.cont.loopexit.i.i257, label %for.body.i.i.i.i.i231, !llvm.loop !77

invoke.cont.loopexit.i.i257:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i255
  %.pre.i.i256 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i225, align 8, !tbaa !68
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
  store float* %call32, float** %C, align 8, !tbaa !64
  %72 = load i64, i64* %M, align 8, !tbaa !66
  %73 = load i64, i64* %N, align 8, !tbaa !66
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
  %78 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %78, null
  br i1 %cmp.not.i.i.i.i, label %invoke.cont41, label %if.then.i.i.i.i266

if.then.i.i.i.i266:                               ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %78, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i266
  %79 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i

if.else.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i266
  %80 = load i32, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i = add nsw i32 %80, -1
  store i32 %add.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i

invoke.cont.i.i.i.i.i:                            ; preds = %if.else.i.i.i.i.i.i, %if.then.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i = phi i32 [ %79, %if.then.i.i.i.i.i.i ], [ %80, %if.else.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i, label %if.then.i.i.i.i.i, label %invoke.cont41

if.then.i.i.i.i.i:                                ; preds = %invoke.cont.i.i.i.i.i
  %81 = bitcast %"class.std::_Sp_counted_base"* %78 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %81, align 8, !tbaa !75
  %vfn.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i, i64 2
  %82 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i, align 8
  call void %82(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %78) #30
  %_M_weak_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %78, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i, label %if.else.i11.i.i.i.i.i

if.then.i9.i.i.i.i.i:                             ; preds = %if.then.i.i.i.i.i
  %83 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i

if.else.i11.i.i.i.i.i:                            ; preds = %if.then.i.i.i.i.i
  %84 = load i32, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i = add nsw i32 %84, -1
  store i32 %add.i.i10.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i

invoke.cont2.i.i.i.i.i:                           ; preds = %if.else.i11.i.i.i.i.i, %if.then.i9.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i = phi i32 [ %83, %if.then.i9.i.i.i.i.i ], [ %84, %if.else.i11.i.i.i.i.i ]
  %cmp4.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i, label %if.then5.i.i.i.i.i, label %invoke.cont41

if.then5.i.i.i.i.i:                               ; preds = %invoke.cont2.i.i.i.i.i
  %vtable6.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %81, align 8, !tbaa !75
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
  %88 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i267, align 8, !tbaa !68
  %_M_finish.i.i268 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp36, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %89 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i.i268, align 8, !tbaa !70
  %cmp.not3.i.i.i.i.i269 = icmp eq %"class.std::shared_ptr.0"* %88, %89
  br i1 %cmp.not3.i.i.i.i.i269, label %invoke.cont.i.i301, label %for.body.i.i.i.i.i273

for.body.i.i.i.i.i273:                            ; preds = %invoke.cont41, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297
  %__first.addr.04.i.i.i.i.i270 = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i.i295, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297 ], [ %88, %invoke.cont41 ]
  %_M_pi.i.i.i.i.i.i.i.i271 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i270, i64 0, i32 0, i32 1, i32 0
  %90 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i.i271, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i.i272 = icmp eq %"class.std::_Sp_counted_base"* %90, null
  br i1 %cmp.not.i.i.i.i.i.i.i.i272, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297, label %if.then.i.i.i.i.i.i.i.i275

if.then.i.i.i.i.i.i.i.i275:                       ; preds = %for.body.i.i.i.i.i273
  %_M_use_count.i.i.i.i.i.i.i.i.i274 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %90, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i.i276, label %if.else.i.i.i.i.i.i.i.i.i.i278

if.then.i.i.i.i.i.i.i.i.i.i276:                   ; preds = %if.then.i.i.i.i.i.i.i.i275
  %91 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i.i281

if.else.i.i.i.i.i.i.i.i.i.i278:                   ; preds = %if.then.i.i.i.i.i.i.i.i275
  %92 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i.i277 = add nsw i32 %92, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i.i277, i32* %_M_use_count.i.i.i.i.i.i.i.i.i274, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i.i281

invoke.cont.i.i.i.i.i.i.i.i.i281:                 ; preds = %if.else.i.i.i.i.i.i.i.i.i.i278, %if.then.i.i.i.i.i.i.i.i.i.i276
  %retval.0.i.i.i.i.i.i.i.i.i.i279 = phi i32 [ %91, %if.then.i.i.i.i.i.i.i.i.i.i276 ], [ %92, %if.else.i.i.i.i.i.i.i.i.i.i278 ]
  %cmp.i.i.i.i.i.i.i.i.i280 = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i.i279, 1
  br i1 %cmp.i.i.i.i.i.i.i.i.i280, label %if.then.i.i.i.i.i.i.i.i.i285, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

if.then.i.i.i.i.i.i.i.i.i285:                     ; preds = %invoke.cont.i.i.i.i.i.i.i.i.i281
  %93 = bitcast %"class.std::_Sp_counted_base"* %90 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i.i282 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %93, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i.i283 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i.i282, i64 2
  %94 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i.i283, align 8
  call void %94(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %90) #30
  %_M_weak_count.i.i.i.i.i.i.i.i.i284 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %90, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i.i286, label %if.else.i11.i.i.i.i.i.i.i.i.i288

if.then.i9.i.i.i.i.i.i.i.i.i286:                  ; preds = %if.then.i.i.i.i.i.i.i.i.i285
  %95 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i291

if.else.i11.i.i.i.i.i.i.i.i.i288:                 ; preds = %if.then.i.i.i.i.i.i.i.i.i285
  %96 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i.i287 = add nsw i32 %96, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i.i287, i32* %_M_weak_count.i.i.i.i.i.i.i.i.i284, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i.i291

invoke.cont2.i.i.i.i.i.i.i.i.i291:                ; preds = %if.else.i11.i.i.i.i.i.i.i.i.i288, %if.then.i9.i.i.i.i.i.i.i.i.i286
  %retval.0.i12.i.i.i.i.i.i.i.i.i289 = phi i32 [ %95, %if.then.i9.i.i.i.i.i.i.i.i.i286 ], [ %96, %if.else.i11.i.i.i.i.i.i.i.i.i288 ]
  %cmp4.i.i.i.i.i.i.i.i.i290 = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i.i289, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i.i290, label %if.then5.i.i.i.i.i.i.i.i.i294, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

if.then5.i.i.i.i.i.i.i.i.i294:                    ; preds = %invoke.cont2.i.i.i.i.i.i.i.i.i291
  %vtable6.i.i.i.i.i.i.i.i.i292 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %93, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i.i293 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i.i292, i64 3
  %97 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i.i293, align 8
  call void %97(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %90) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297: ; preds = %if.then5.i.i.i.i.i.i.i.i.i294, %invoke.cont2.i.i.i.i.i.i.i.i.i291, %invoke.cont.i.i.i.i.i.i.i.i.i281, %for.body.i.i.i.i.i273
  %incdec.ptr.i.i.i.i.i295 = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i.i270, i64 1
  %cmp.not.i.i.i.i.i296 = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i.i295, %89
  br i1 %cmp.not.i.i.i.i.i296, label %invoke.cont.loopexit.i.i299, label %for.body.i.i.i.i.i273, !llvm.loop !77

invoke.cont.loopexit.i.i299:                      ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i.i297
  %.pre.i.i298 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i.i267, align 8, !tbaa !68
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
  %100 = load float*, float** %A, align 8, !tbaa !64
  %101 = load float*, float** %B, align 8, !tbaa !64
  %102 = load float*, float** %C, align 8, !tbaa !64
  %103 = load i64, i64* %M, align 8, !tbaa !66
  %104 = load i64, i64* %K, align 8, !tbaa !66
  %105 = load i64, i64* %N, align 8, !tbaa !66
  %cmp94.not.i = icmp eq i64 %103, 0
  br i1 %cmp94.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.lr.ph.i

for.cond1.preheader.lr.ph.i:                      ; preds = %_ZN2cl4sycl6detail16PropertyListBaseD2Ev.exit303
  %cmp292.not.i = icmp eq i64 %104, 0
  %conv6.i = uitofp i64 %103 to float
  br i1 %cmp292.not.i, label %for.cond41.preheader.lr.ph.i, label %for.cond1.preheader.us.i.preheader

for.cond1.preheader.us.i.preheader:               ; preds = %for.cond1.preheader.lr.ph.i
  %min.iters.check = icmp ult i64 %104, 8
  %n.vec = and i64 %104, -8
  %broadcast.splatinsert4396 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat4397 = shufflevector <4 x float> %broadcast.splatinsert4396, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4398 = insertelement <4 x float> poison, float %conv6.i, i64 0
  %broadcast.splat4399 = shufflevector <4 x float> %broadcast.splatinsert4398, <4 x float> poison, <4 x i32> zeroinitializer
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
  %broadcast.splatinsert4394 = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat4395 = shufflevector <4 x float> %broadcast.splatinsert4394, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %106 = uitofp <4 x i64> %vec.ind to <4 x float>
  %107 = uitofp <4 x i64> %step.add to <4 x float>
  %108 = fmul <4 x float> %broadcast.splat, %106
  %109 = fmul <4 x float> %broadcast.splat4395, %107
  %110 = fdiv <4 x float> %108, %broadcast.splat4397
  %111 = fdiv <4 x float> %109, %broadcast.splat4399
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
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !90

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
  br i1 %exitcond.not.i, label %for.cond1.for.cond.cleanup3_crit_edge.us.i, label %for.body4.us.i, !llvm.loop !91

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
  %min.iters.check4402 = icmp ult i64 %105, 8
  %n.vec4405 = and i64 %105, -8
  %broadcast.splatinsert4418 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat4419 = shufflevector <4 x float> %broadcast.splatinsert4418, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4420 = insertelement <4 x float> poison, float %conv24.i, i64 0
  %broadcast.splat4421 = shufflevector <4 x float> %broadcast.splatinsert4420, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n4407 = icmp eq i64 %105, %n.vec4405
  br label %for.cond17.preheader.us.i

for.cond17.preheader.us.i:                        ; preds = %for.cond17.preheader.us.i.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i
  %i11.099.us.i = phi i64 [ %inc33.us.i, %for.cond17.for.cond.cleanup19_crit_edge.us.i ], [ 0, %for.cond17.preheader.us.i.preheader ]
  %conv21.us.i = uitofp i64 %i11.099.us.i to float
  %mul26.us.i = mul i64 %i11.099.us.i, %105
  br i1 %min.iters.check4402, label %for.body20.us.i.preheader, label %vector.ph4403

vector.ph4403:                                    ; preds = %for.cond17.preheader.us.i
  %broadcast.splatinsert4414 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat4415 = shufflevector <4 x float> %broadcast.splatinsert4414, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4416 = insertelement <4 x float> poison, float %conv21.us.i, i64 0
  %broadcast.splat4417 = shufflevector <4 x float> %broadcast.splatinsert4416, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4408

vector.body4408:                                  ; preds = %vector.body4408, %vector.ph4403
  %index4409 = phi i64 [ 0, %vector.ph4403 ], [ %index.next4422, %vector.body4408 ]
  %vec.ind4410 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph4403 ], [ %vec.ind.next4413, %vector.body4408 ]
  %step.add4411 = add <4 x i64> %vec.ind4410, <i64 4, i64 4, i64 4, i64 4>
  %118 = uitofp <4 x i64> %vec.ind4410 to <4 x float>
  %119 = uitofp <4 x i64> %step.add4411 to <4 x float>
  %120 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4415, <4 x float> %118, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %121 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4417, <4 x float> %119, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %122 = fdiv <4 x float> %120, %broadcast.splat4419
  %123 = fdiv <4 x float> %121, %broadcast.splat4421
  %124 = add i64 %index4409, %mul26.us.i
  %125 = getelementptr inbounds float, float* %101, i64 %124
  %126 = bitcast float* %125 to <4 x float>*
  store <4 x float> %122, <4 x float>* %126, align 4, !tbaa !8
  %127 = getelementptr inbounds float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  store <4 x float> %123, <4 x float>* %128, align 4, !tbaa !8
  %index.next4422 = add nuw i64 %index4409, 8
  %vec.ind.next4413 = add <4 x i64> %vec.ind4410, <i64 8, i64 8, i64 8, i64 8>
  %129 = icmp eq i64 %index.next4422, %n.vec4405
  br i1 %129, label %middle.block4400, label %vector.body4408, !llvm.loop !92

middle.block4400:                                 ; preds = %vector.body4408
  br i1 %cmp.n4407, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i.preheader

for.body20.us.i.preheader:                        ; preds = %for.cond17.preheader.us.i, %middle.block4400
  %j16.097.us.i.ph = phi i64 [ 0, %for.cond17.preheader.us.i ], [ %n.vec4405, %middle.block4400 ]
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
  br i1 %exitcond108.not.i, label %for.cond17.for.cond.cleanup19_crit_edge.us.i, label %for.body20.us.i, !llvm.loop !93

for.cond17.for.cond.cleanup19_crit_edge.us.i:     ; preds = %for.body20.us.i, %middle.block4400
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
  %min.iters.check4425 = icmp ult i64 %105, 8
  %n.vec4428 = and i64 %105, -8
  %broadcast.splatinsert4441 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat4442 = shufflevector <4 x float> %broadcast.splatinsert4441, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4443 = insertelement <4 x float> poison, float %conv48.i, i64 0
  %broadcast.splat4444 = shufflevector <4 x float> %broadcast.splatinsert4443, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n4430 = icmp eq i64 %105, %n.vec4428
  br label %for.cond41.preheader.us.i

for.cond41.preheader.us.i:                        ; preds = %for.cond41.preheader.us.i.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i
  %i35.0103.us.i = phi i64 [ %inc57.us.i, %for.cond41.for.cond.cleanup43_crit_edge.us.i ], [ 0, %for.cond41.preheader.us.i.preheader ]
  %conv45.us.i = uitofp i64 %i35.0103.us.i to float
  %mul50.us.i = mul i64 %i35.0103.us.i, %105
  br i1 %min.iters.check4425, label %for.body44.us.i.preheader, label %vector.ph4426

vector.ph4426:                                    ; preds = %for.cond41.preheader.us.i
  %broadcast.splatinsert4437 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat4438 = shufflevector <4 x float> %broadcast.splatinsert4437, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4439 = insertelement <4 x float> poison, float %conv45.us.i, i64 0
  %broadcast.splat4440 = shufflevector <4 x float> %broadcast.splatinsert4439, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4431

vector.body4431:                                  ; preds = %vector.body4431, %vector.ph4426
  %index4432 = phi i64 [ 0, %vector.ph4426 ], [ %index.next4445, %vector.body4431 ]
  %vec.ind4433 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph4426 ], [ %vec.ind.next4436, %vector.body4431 ]
  %step.add4434 = add <4 x i64> %vec.ind4433, <i64 4, i64 4, i64 4, i64 4>
  %131 = uitofp <4 x i64> %vec.ind4433 to <4 x float>
  %132 = uitofp <4 x i64> %step.add4434 to <4 x float>
  %133 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4438, <4 x float> %131, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %134 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4440, <4 x float> %132, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %135 = fdiv <4 x float> %133, %broadcast.splat4442
  %136 = fdiv <4 x float> %134, %broadcast.splat4444
  %137 = add i64 %index4432, %mul50.us.i
  %138 = getelementptr inbounds float, float* %102, i64 %137
  %139 = bitcast float* %138 to <4 x float>*
  store <4 x float> %135, <4 x float>* %139, align 4, !tbaa !8
  %140 = getelementptr inbounds float, float* %138, i64 4
  %141 = bitcast float* %140 to <4 x float>*
  store <4 x float> %136, <4 x float>* %141, align 4, !tbaa !8
  %index.next4445 = add nuw i64 %index4432, 8
  %vec.ind.next4436 = add <4 x i64> %vec.ind4433, <i64 8, i64 8, i64 8, i64 8>
  %142 = icmp eq i64 %index.next4445, %n.vec4428
  br i1 %142, label %middle.block4423, label %vector.body4431, !llvm.loop !94

middle.block4423:                                 ; preds = %vector.body4431
  br i1 %cmp.n4430, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i.preheader

for.body44.us.i.preheader:                        ; preds = %for.cond41.preheader.us.i, %middle.block4423
  %j40.0101.us.i.ph = phi i64 [ 0, %for.cond41.preheader.us.i ], [ %n.vec4428, %middle.block4423 ]
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
  br i1 %exitcond110.not.i, label %for.cond41.for.cond.cleanup43_crit_edge.us.i, label %for.body44.us.i, !llvm.loop !95

for.cond41.for.cond.cleanup43_crit_edge.us.i:     ; preds = %for.body44.us.i, %middle.block4423
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
  %min.iters.check4448 = icmp ult i64 %104, 8
  %n.vec4451 = and i64 %104, -8
  %broadcast.splatinsert4464 = insertelement <4 x float> poison, float %conv6.i306, i64 0
  %broadcast.splat4465 = shufflevector <4 x float> %broadcast.splatinsert4464, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4466 = insertelement <4 x float> poison, float %conv6.i306, i64 0
  %broadcast.splat4467 = shufflevector <4 x float> %broadcast.splatinsert4466, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n4453 = icmp eq i64 %104, %n.vec4451
  br label %for.cond1.preheader.us.i311

for.cond1.preheader.us.i311:                      ; preds = %for.cond1.preheader.us.i311.preheader, %for.cond1.for.cond.cleanup3_crit_edge.us.i323
  %i.095.us.i308 = phi i64 [ %inc9.us.i321, %for.cond1.for.cond.cleanup3_crit_edge.us.i323 ], [ 0, %for.cond1.preheader.us.i311.preheader ]
  %conv.us.i309 = uitofp i64 %i.095.us.i308 to float
  %mul7.us.i310 = mul i64 %i.095.us.i308, %104
  br i1 %min.iters.check4448, label %for.body4.us.i320.preheader, label %vector.ph4449

vector.ph4449:                                    ; preds = %for.cond1.preheader.us.i311
  %broadcast.splatinsert4460 = insertelement <4 x float> poison, float %conv.us.i309, i64 0
  %broadcast.splat4461 = shufflevector <4 x float> %broadcast.splatinsert4460, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4462 = insertelement <4 x float> poison, float %conv.us.i309, i64 0
  %broadcast.splat4463 = shufflevector <4 x float> %broadcast.splatinsert4462, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4454

vector.body4454:                                  ; preds = %vector.body4454, %vector.ph4449
  %index4455 = phi i64 [ 0, %vector.ph4449 ], [ %index.next4468, %vector.body4454 ]
  %vec.ind4456 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph4449 ], [ %vec.ind.next4459, %vector.body4454 ]
  %step.add4457 = add <4 x i64> %vec.ind4456, <i64 4, i64 4, i64 4, i64 4>
  %144 = uitofp <4 x i64> %vec.ind4456 to <4 x float>
  %145 = uitofp <4 x i64> %step.add4457 to <4 x float>
  %146 = fmul <4 x float> %broadcast.splat4461, %144
  %147 = fmul <4 x float> %broadcast.splat4463, %145
  %148 = fdiv <4 x float> %146, %broadcast.splat4465
  %149 = fdiv <4 x float> %147, %broadcast.splat4467
  %150 = add i64 %index4455, %mul7.us.i310
  %151 = getelementptr inbounds float, float* %100, i64 %150
  %152 = bitcast float* %151 to <4 x float>*
  store <4 x float> %148, <4 x float>* %152, align 4, !tbaa !8
  %153 = getelementptr inbounds float, float* %151, i64 4
  %154 = bitcast float* %153 to <4 x float>*
  store <4 x float> %149, <4 x float>* %154, align 4, !tbaa !8
  %index.next4468 = add nuw i64 %index4455, 8
  %vec.ind.next4459 = add <4 x i64> %vec.ind4456, <i64 8, i64 8, i64 8, i64 8>
  %155 = icmp eq i64 %index.next4468, %n.vec4451
  br i1 %155, label %middle.block4446, label %vector.body4454, !llvm.loop !96

middle.block4446:                                 ; preds = %vector.body4454
  br i1 %cmp.n4453, label %for.cond1.for.cond.cleanup3_crit_edge.us.i323, label %for.body4.us.i320.preheader

for.body4.us.i320.preheader:                      ; preds = %for.cond1.preheader.us.i311, %middle.block4446
  %j.093.us.i312.ph = phi i64 [ 0, %for.cond1.preheader.us.i311 ], [ %n.vec4451, %middle.block4446 ]
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
  br i1 %exitcond.not.i319, label %for.cond1.for.cond.cleanup3_crit_edge.us.i323, label %for.body4.us.i320, !llvm.loop !97

for.cond1.for.cond.cleanup3_crit_edge.us.i323:    ; preds = %for.body4.us.i320, %middle.block4446
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
  %min.iters.check4471 = icmp ult i64 %105, 8
  %n.vec4474 = and i64 %105, -8
  %broadcast.splatinsert4487 = insertelement <4 x float> poison, float %conv24.i327, i64 0
  %broadcast.splat4488 = shufflevector <4 x float> %broadcast.splatinsert4487, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4489 = insertelement <4 x float> poison, float %conv24.i327, i64 0
  %broadcast.splat4490 = shufflevector <4 x float> %broadcast.splatinsert4489, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n4476 = icmp eq i64 %105, %n.vec4474
  br label %for.cond17.preheader.us.i332

for.cond17.preheader.us.i332:                     ; preds = %for.cond17.preheader.us.i332.preheader, %for.cond17.for.cond.cleanup19_crit_edge.us.i343
  %i11.099.us.i329 = phi i64 [ %inc33.us.i341, %for.cond17.for.cond.cleanup19_crit_edge.us.i343 ], [ 0, %for.cond17.preheader.us.i332.preheader ]
  %conv21.us.i330 = uitofp i64 %i11.099.us.i329 to float
  %mul26.us.i331 = mul i64 %i11.099.us.i329, %105
  br i1 %min.iters.check4471, label %for.body20.us.i340.preheader, label %vector.ph4472

vector.ph4472:                                    ; preds = %for.cond17.preheader.us.i332
  %broadcast.splatinsert4483 = insertelement <4 x float> poison, float %conv21.us.i330, i64 0
  %broadcast.splat4484 = shufflevector <4 x float> %broadcast.splatinsert4483, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4485 = insertelement <4 x float> poison, float %conv21.us.i330, i64 0
  %broadcast.splat4486 = shufflevector <4 x float> %broadcast.splatinsert4485, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4477

vector.body4477:                                  ; preds = %vector.body4477, %vector.ph4472
  %index4478 = phi i64 [ 0, %vector.ph4472 ], [ %index.next4491, %vector.body4477 ]
  %vec.ind4479 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph4472 ], [ %vec.ind.next4482, %vector.body4477 ]
  %step.add4480 = add <4 x i64> %vec.ind4479, <i64 4, i64 4, i64 4, i64 4>
  %156 = uitofp <4 x i64> %vec.ind4479 to <4 x float>
  %157 = uitofp <4 x i64> %step.add4480 to <4 x float>
  %158 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4484, <4 x float> %156, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %159 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4486, <4 x float> %157, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>)
  %160 = fdiv <4 x float> %158, %broadcast.splat4488
  %161 = fdiv <4 x float> %159, %broadcast.splat4490
  %162 = add i64 %index4478, %mul26.us.i331
  %163 = getelementptr inbounds float, float* %101, i64 %162
  %164 = bitcast float* %163 to <4 x float>*
  store <4 x float> %160, <4 x float>* %164, align 4, !tbaa !8
  %165 = getelementptr inbounds float, float* %163, i64 4
  %166 = bitcast float* %165 to <4 x float>*
  store <4 x float> %161, <4 x float>* %166, align 4, !tbaa !8
  %index.next4491 = add nuw i64 %index4478, 8
  %vec.ind.next4482 = add <4 x i64> %vec.ind4479, <i64 8, i64 8, i64 8, i64 8>
  %167 = icmp eq i64 %index.next4491, %n.vec4474
  br i1 %167, label %middle.block4469, label %vector.body4477, !llvm.loop !98

middle.block4469:                                 ; preds = %vector.body4477
  br i1 %cmp.n4476, label %for.cond17.for.cond.cleanup19_crit_edge.us.i343, label %for.body20.us.i340.preheader

for.body20.us.i340.preheader:                     ; preds = %for.cond17.preheader.us.i332, %middle.block4469
  %j16.097.us.i333.ph = phi i64 [ 0, %for.cond17.preheader.us.i332 ], [ %n.vec4474, %middle.block4469 ]
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
  br i1 %exitcond108.not.i339, label %for.cond17.for.cond.cleanup19_crit_edge.us.i343, label %for.body20.us.i340, !llvm.loop !99

for.cond17.for.cond.cleanup19_crit_edge.us.i343:  ; preds = %for.body20.us.i340, %middle.block4469
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
  %min.iters.check4494 = icmp ult i64 %105, 8
  %n.vec4497 = and i64 %105, -8
  %broadcast.splatinsert4510 = insertelement <4 x float> poison, float %conv48.i346.pre-phi, i64 0
  %broadcast.splat4511 = shufflevector <4 x float> %broadcast.splatinsert4510, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4512 = insertelement <4 x float> poison, float %conv48.i346.pre-phi, i64 0
  %broadcast.splat4513 = shufflevector <4 x float> %broadcast.splatinsert4512, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n4499 = icmp eq i64 %105, %n.vec4497
  br label %for.cond41.preheader.us.i351

for.cond41.preheader.us.i351:                     ; preds = %for.cond41.preheader.us.i351.preheader, %for.cond41.for.cond.cleanup43_crit_edge.us.i362
  %i35.0103.us.i348 = phi i64 [ %inc57.us.i360, %for.cond41.for.cond.cleanup43_crit_edge.us.i362 ], [ 0, %for.cond41.preheader.us.i351.preheader ]
  %conv45.us.i349 = uitofp i64 %i35.0103.us.i348 to float
  %mul50.us.i350 = mul i64 %i35.0103.us.i348, %105
  br i1 %min.iters.check4494, label %for.body44.us.i359.preheader, label %vector.ph4495

vector.ph4495:                                    ; preds = %for.cond41.preheader.us.i351
  %broadcast.splatinsert4506 = insertelement <4 x float> poison, float %conv45.us.i349, i64 0
  %broadcast.splat4507 = shufflevector <4 x float> %broadcast.splatinsert4506, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4508 = insertelement <4 x float> poison, float %conv45.us.i349, i64 0
  %broadcast.splat4509 = shufflevector <4 x float> %broadcast.splatinsert4508, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4500

vector.body4500:                                  ; preds = %vector.body4500, %vector.ph4495
  %index4501 = phi i64 [ 0, %vector.ph4495 ], [ %index.next4514, %vector.body4500 ]
  %vec.ind4502 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph4495 ], [ %vec.ind.next4505, %vector.body4500 ]
  %step.add4503 = add <4 x i64> %vec.ind4502, <i64 4, i64 4, i64 4, i64 4>
  %169 = uitofp <4 x i64> %vec.ind4502 to <4 x float>
  %170 = uitofp <4 x i64> %step.add4503 to <4 x float>
  %171 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4507, <4 x float> %169, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %172 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4509, <4 x float> %170, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>)
  %173 = fdiv <4 x float> %171, %broadcast.splat4511
  %174 = fdiv <4 x float> %172, %broadcast.splat4513
  %175 = add i64 %index4501, %mul50.us.i350
  %176 = getelementptr inbounds float, float* %87, i64 %175
  %177 = bitcast float* %176 to <4 x float>*
  store <4 x float> %173, <4 x float>* %177, align 4, !tbaa !8
  %178 = getelementptr inbounds float, float* %176, i64 4
  %179 = bitcast float* %178 to <4 x float>*
  store <4 x float> %174, <4 x float>* %179, align 4, !tbaa !8
  %index.next4514 = add nuw i64 %index4501, 8
  %vec.ind.next4505 = add <4 x i64> %vec.ind4502, <i64 8, i64 8, i64 8, i64 8>
  %180 = icmp eq i64 %index.next4514, %n.vec4497
  br i1 %180, label %middle.block4492, label %vector.body4500, !llvm.loop !100

middle.block4492:                                 ; preds = %vector.body4500
  br i1 %cmp.n4499, label %for.cond41.for.cond.cleanup43_crit_edge.us.i362, label %for.body44.us.i359.preheader

for.body44.us.i359.preheader:                     ; preds = %for.cond41.preheader.us.i351, %middle.block4492
  %j40.0101.us.i352.ph = phi i64 [ 0, %for.cond41.preheader.us.i351 ], [ %n.vec4497, %middle.block4492 ]
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
  br i1 %exitcond110.not.i358, label %for.cond41.for.cond.cleanup43_crit_edge.us.i362, label %for.body44.us.i359, !llvm.loop !101

for.cond41.for.cond.cleanup43_crit_edge.us.i362:  ; preds = %for.body44.us.i359, %middle.block4492
  %inc57.us.i360 = add nuw i64 %i35.0103.us.i348, 1
  %exitcond111.not.i361 = icmp eq i64 %inc57.us.i360, %103
  br i1 %exitcond111.not.i361, label %_Z10initMatrixPfS_S_mmm.exit363, label %for.cond41.preheader.us.i351, !llvm.loop !23

_Z10initMatrixPfS_S_mmm.exit363:                  ; preds = %for.cond41.for.cond.cleanup43_crit_edge.us.i362, %for.cond36.preheader.i344, %for.cond41.preheader.lr.ph.i347
  %call45 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #30
  %182 = bitcast %"struct.cl::sycl::detail::code_location"* %ref.tmp54 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %182) #30
  %MFileName.i.i364 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i364, align 8, !tbaa !78, !alias.scope !102
  %MFunctionName.i.i365 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i365, align 8, !tbaa !83, !alias.scope !102
  %MLineNo.i.i366 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp54, i64 0, i32 2
  %183 = bitcast i64* %MLineNo.i.i366 to <2 x i64>*
  store <2 x i64> <i64 74, i64 3>, <2 x i64>* %183, align 8, !tbaa !66, !alias.scope !102
  %184 = bitcast %"class.std::function.18"* %agg.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %184)
  %185 = bitcast %"class.cl::sycl::event"* %Event.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %185) #30, !noalias !105
  %_M_manager.i.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 1
  %call.i.i4.i.i393 = invoke noalias noundef nonnull dereferenceable(48) i8* @_Znwm(i64 noundef 48) #32
          to label %call.i.i4.i.i.noexc unwind label %lpad55

call.i.i4.i.i.noexc:                              ; preds = %_Z10initMatrixPfS_S_mmm.exit363
  %agg.tmp47.sroa.0.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %call.i.i4.i.i393 to i64**
  store i64* %M, i64** %agg.tmp47.sroa.0.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !105
  %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 8
  %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_idx to i64**
  store i64* %K, i64** %agg.tmp47.sroa.2.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !105
  %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 16
  %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_idx to i64**
  store i64* %N, i64** %agg.tmp47.sroa.3.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !105
  %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 24
  %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %C, float*** %agg.tmp47.sroa.4.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !105
  %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 32
  %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %A, float*** %agg.tmp47.sroa.5.0.call.i.i4.i.i393.sroa_cast, align 16, !noalias !105
  %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_idx = getelementptr inbounds i8, i8* %call.i.i4.i.i393, i64 40
  %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_cast = bitcast i8* %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_idx to float***
  store float** %B, float*** %agg.tmp47.sroa.6.0.call.i.i4.i.i393.sroa_cast, align 8, !noalias !105
  %186 = bitcast %"class.std::function.18"* %agg.tmp.i to i8**
  store i8* %call.i.i4.i.i393, i8** %186, align 8, !tbaa !64, !noalias !105
  %_M_invoker.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 1
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::handler"*)* @_ZNSt17_Function_handlerIFvRN2cl4sycl7handlerEEZ4mainEUlS3_E_E9_M_invokeERKSt9_Any_dataS3_, void (%"union.std::_Any_data"*, %"class.cl::sycl::handler"*)** %_M_invoker.i.i, align 8, !tbaa !108, !noalias !105
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* @_ZNSt14_Function_base13_Base_managerIZ4mainEUlRN2cl4sycl7handlerEE_E10_M_managerERSt9_Any_dataRKS7_St18_Manager_operation, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !110, !noalias !105
  invoke void @_ZN2cl4sycl5queue11submit_implESt8functionIFvRNS0_7handlerEEERKNS0_6detail13code_locationE(%"class.cl::sycl::event"* nonnull sret(%"class.cl::sycl::event") align 8 %Event.i, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.std::function.18"* noundef nonnull %agg.tmp.i, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32) %ref.tmp54)
          to label %invoke.cont.i368 unwind label %lpad.i392, !noalias !105

invoke.cont.i368:                                 ; preds = %call.i.i4.i.i.noexc
  %187 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !110, !noalias !105
  %tobool.not.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %187, null
  br i1 %tobool.not.i.i, label %_ZNSt14_Function_baseD2Ev.exit.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %invoke.cont.i368
  %_M_functor.i.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 0
  %call.i.i = invoke noundef i1 %187(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit.i unwind label %terminate.lpad.i.i, !noalias !105

terminate.lpad.i.i:                               ; preds = %if.then.i.i
  %188 = landingpad { i8*, i32 }
          catch i8* null
  %189 = extractvalue { i8*, i32 } %188, 0
  call void @__clang_call_terminate(i8* %189) #31, !noalias !105
  unreachable

_ZNSt14_Function_baseD2Ev.exit.i:                 ; preds = %if.then.i.i, %invoke.cont.i368
  invoke void @_ZN2cl4sycl5queue17discard_or_returnERKNS0_5eventE(%"class.cl::sycl::event"* nonnull sret(%"class.cl::sycl::event") align 8 %agg.tmp.ensured, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16) %Event.i)
          to label %invoke.cont4.i unwind label %lpad3.i

invoke.cont4.i:                                   ; preds = %_ZNSt14_Function_baseD2Ev.exit.i
  %_M_pi.i.i.i.i369 = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %Event.i, i64 0, i32 0, i32 0, i32 1, i32 0
  %190 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i369, align 8, !tbaa !71, !noalias !105
  %cmp.not.i.i.i.i370 = icmp eq %"class.std::_Sp_counted_base"* %190, null
  br i1 %cmp.not.i.i.i.i370, label %invoke.cont56, label %if.then.i.i.i.i372

if.then.i.i.i.i372:                               ; preds = %invoke.cont4.i
  %_M_use_count.i.i.i.i.i371 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %190, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i373, label %if.else.i.i.i.i.i.i375

if.then.i.i.i.i.i.i373:                           ; preds = %if.then.i.i.i.i372
  %191 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i371, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i378

if.else.i.i.i.i.i.i375:                           ; preds = %if.then.i.i.i.i372
  %192 = load i32, i32* %_M_use_count.i.i.i.i.i371, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i374 = add nsw i32 %192, -1
  store i32 %add.i.i.i.i.i.i.i374, i32* %_M_use_count.i.i.i.i.i371, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i378

invoke.cont.i.i.i.i.i378:                         ; preds = %if.else.i.i.i.i.i.i375, %if.then.i.i.i.i.i.i373
  %retval.0.i.i.i.i.i.i376 = phi i32 [ %191, %if.then.i.i.i.i.i.i373 ], [ %192, %if.else.i.i.i.i.i.i375 ]
  %cmp.i.i.i.i.i377 = icmp eq i32 %retval.0.i.i.i.i.i.i376, 1
  br i1 %cmp.i.i.i.i.i377, label %if.then.i.i.i.i.i382, label %invoke.cont56

if.then.i.i.i.i.i382:                             ; preds = %invoke.cont.i.i.i.i.i378
  %193 = bitcast %"class.std::_Sp_counted_base"* %190 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i379 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %193, align 8, !tbaa !75
  %vfn.i.i.i.i.i380 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i379, i64 2
  %194 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i380, align 8
  call void %194(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %190) #30
  %_M_weak_count.i.i.i.i.i381 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %190, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i383, label %if.else.i11.i.i.i.i.i385

if.then.i9.i.i.i.i.i383:                          ; preds = %if.then.i.i.i.i.i382
  %195 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i381, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i388

if.else.i11.i.i.i.i.i385:                         ; preds = %if.then.i.i.i.i.i382
  %196 = load i32, i32* %_M_weak_count.i.i.i.i.i381, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i384 = add nsw i32 %196, -1
  store i32 %add.i.i10.i.i.i.i.i384, i32* %_M_weak_count.i.i.i.i.i381, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i388

invoke.cont2.i.i.i.i.i388:                        ; preds = %if.else.i11.i.i.i.i.i385, %if.then.i9.i.i.i.i.i383
  %retval.0.i12.i.i.i.i.i386 = phi i32 [ %195, %if.then.i9.i.i.i.i.i383 ], [ %196, %if.else.i11.i.i.i.i.i385 ]
  %cmp4.i.i.i.i.i387 = icmp eq i32 %retval.0.i12.i.i.i.i.i386, 1
  br i1 %cmp4.i.i.i.i.i387, label %if.then5.i.i.i.i.i391, label %invoke.cont56

if.then5.i.i.i.i.i391:                            ; preds = %invoke.cont2.i.i.i.i.i388
  %vtable6.i.i.i.i.i389 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %193, align 8, !tbaa !75
  %vfn7.i.i.i.i.i390 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i389, i64 3
  %197 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i390, align 8
  call void %197(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %190) #30
  br label %invoke.cont56

lpad.i392:                                        ; preds = %call.i.i4.i.i.noexc
  %198 = landingpad { i8*, i32 }
          cleanup
  %199 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i, align 8, !tbaa !110, !noalias !105
  %tobool.not.i8.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %199, null
  br i1 %tobool.not.i8.i, label %ehcleanup.i, label %if.then.i11.i

if.then.i11.i:                                    ; preds = %lpad.i392
  %_M_functor.i9.i = getelementptr inbounds %"class.std::function.18", %"class.std::function.18"* %agg.tmp.i, i64 0, i32 0, i32 0
  %call.i10.i = invoke noundef i1 %199(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i9.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i9.i, i32 noundef 3)
          to label %ehcleanup.i unwind label %terminate.lpad.i12.i, !noalias !105

terminate.lpad.i12.i:                             ; preds = %if.then.i11.i
  %200 = landingpad { i8*, i32 }
          catch i8* null
  %201 = extractvalue { i8*, i32 } %200, 0
  call void @__clang_call_terminate(i8* %201) #31, !noalias !105
  unreachable

lpad3.i:                                          ; preds = %_ZNSt14_Function_baseD2Ev.exit.i
  %202 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl5eventD2Ev(%"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16) %Event.i) #30
  br label %ehcleanup.i

ehcleanup.i:                                      ; preds = %lpad3.i, %if.then.i11.i, %lpad.i392
  %.pn.i = phi { i8*, i32 } [ %202, %lpad3.i ], [ %198, %lpad.i392 ], [ %198, %if.then.i11.i ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %185) #30, !noalias !105
  br label %lpad55.body

invoke.cont56:                                    ; preds = %if.then5.i.i.i.i.i391, %invoke.cont2.i.i.i.i.i388, %invoke.cont.i.i.i.i.i378, %invoke.cont4.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %185) #30, !noalias !105
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %184)
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %agg.tmp.ensured, i64 0, i32 0, i32 0, i32 1, i32 0
  %203 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %203, null
  br i1 %cmp.not.i.i.i, label %invoke.cont66, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont56
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %203, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i395, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i395:                             ; preds = %if.then.i.i.i
  %204 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %205 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %205, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i395
  %retval.0.i.i.i.i.i = phi i32 [ %204, %if.then.i.i.i.i.i395 ], [ %205, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i396, label %invoke.cont66

if.then.i.i.i.i396:                               ; preds = %invoke.cont.i.i.i.i
  %206 = bitcast %"class.std::_Sp_counted_base"* %203 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %206, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %207 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %207(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %203) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %203, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i396
  %208 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i396
  %209 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %209, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %208, %if.then.i9.i.i.i.i ], [ %209, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %invoke.cont66

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %206, align 8, !tbaa !75
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
  %211 = load i64, i64* %M, align 8, !tbaa !66
  %mul68 = shl i64 %211, 1
  %212 = load i64, i64* %N, align 8, !tbaa !66
  %mul69 = mul i64 %mul68, %212
  %213 = load i64, i64* %K, align 8, !tbaa !66
  %mul70 = mul i64 %mul69, %213
  %conv = uitofp i64 %mul70 to double
  %mul71 = fmul double %conv, 1.000000e-09
  %div = fdiv double %mul71, %div.i.i.i
  %214 = bitcast %"struct.cl::sycl::detail::code_location"* %ref.tmp75 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %214) #30
  %MFileName.i.i398 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8** %MFileName.i.i398, align 8, !tbaa !78, !alias.scope !112
  %MFunctionName.i.i399 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8** %MFunctionName.i.i399, align 8, !tbaa !83, !alias.scope !112
  %MLineNo.i.i400 = getelementptr inbounds %"struct.cl::sycl::detail::code_location", %"struct.cl::sycl::detail::code_location"* %ref.tmp75, i64 0, i32 2
  %215 = bitcast i64* %MLineNo.i.i400 to <2 x i64>*
  store <2 x i64> <i64 86, i64 3>, <2 x i64>* %215, align 8, !tbaa !66, !alias.scope !112
  invoke void @_ZN2cl4sycl5queue10wait_proxyERKNS0_6detail13code_locationE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32) %ref.tmp75)
          to label %invoke.cont77 unwind label %lpad76

invoke.cont77:                                    ; preds = %invoke.cont66
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %214) #30
  %216 = load float*, float** %A, align 8, !tbaa !64
  %217 = load float*, float** %B, align 8, !tbaa !64
  %218 = load i64, i64* %M, align 8, !tbaa !66
  %219 = load i64, i64* %N, align 8, !tbaa !66
  %220 = load i64, i64* %K, align 8, !tbaa !66
  %cmp51.not.i = icmp eq i64 %218, 0
  %cmp348.not.i = icmp eq i64 %220, 0
  %or.cond.i = or i1 %cmp51.not.i, %cmp348.not.i
  br i1 %or.cond.i, label %_Z11naiveMatmulPfS_S_mmm.exit, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %invoke.cont77
  %221 = icmp sge i64 %219, %220
  %222 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %220, i64 -1)
  %.obit = extractvalue { i64, i1 } %222, 1
  %.res = extractvalue { i64, i1 } %222, 0
  %polly.access.mul. = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %219)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state510 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %220)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.overflow.state511 = or i1 %polly.overflow.state510, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr float, float* %217, i64 %polly.access.add..res
  %223 = icmp ule float* %polly.access., %87
  %224 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %218, i64 -1)
  %.obit515 = extractvalue { i64, i1 } %224, 1
  %polly.overflow.state516 = or i1 %.obit515, %polly.overflow.state511
  %.res517 = extractvalue { i64, i1 } %224, 0
  %polly.access.mul.call.i2.i518 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res517, i64 %219)
  %polly.access.mul.call.i2.i.obit519 = extractvalue { i64, i1 } %polly.access.mul.call.i2.i518, 1
  %polly.overflow.state520 = or i1 %polly.access.mul.call.i2.i.obit519, %polly.overflow.state516
  %polly.access.mul.call.i2.i.res521 = extractvalue { i64, i1 } %polly.access.mul.call.i2.i518, 0
  %polly.access.add.call.i2.i522 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call.i2.i.res521, i64 %220)
  %polly.access.add.call.i2.i.obit523 = extractvalue { i64, i1 } %polly.access.add.call.i2.i522, 1
  %polly.overflow.state524 = or i1 %polly.access.add.call.i2.i.obit523, %polly.overflow.state520
  %polly.access.add.call.i2.i.res525 = extractvalue { i64, i1 } %polly.access.add.call.i2.i522, 0
  %polly.access.call.i2.i526 = getelementptr float, float* %87, i64 %polly.access.add.call.i2.i.res525
  %225 = icmp ule float* %polly.access.call.i2.i526, %217
  %226 = or i1 %225, %223
  %227 = and i1 %221, %226
  %polly.access.mul.539 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res517, i64 %220)
  %polly.access.mul..obit540 = extractvalue { i64, i1 } %polly.access.mul.539, 1
  %polly.overflow.state541 = or i1 %polly.access.mul..obit540, %polly.overflow.state524
  %polly.access.mul..res542 = extractvalue { i64, i1 } %polly.access.mul.539, 0
  %polly.access.add.543 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res542, i64 %220)
  %polly.access.add..obit544 = extractvalue { i64, i1 } %polly.access.add.543, 1
  %polly.overflow.state545 = or i1 %polly.access.add..obit544, %polly.overflow.state541
  %polly.access.add..res546 = extractvalue { i64, i1 } %polly.access.add.543, 0
  %polly.access.547 = getelementptr float, float* %216, i64 %polly.access.add..res546
  %228 = icmp ule float* %polly.access.547, %87
  %229 = icmp ule float* %polly.access.call.i2.i526, %216
  %230 = or i1 %228, %229
  %231 = and i1 %230, %227
  %polly.rtc.overflown = xor i1 %polly.overflow.state545, true
  %polly.rtc.result = and i1 %231, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.cond, label %for.cond1.preheader.us.i404.preheader

for.cond1.preheader.us.i404.preheader:            ; preds = %polly.split_new_and_old
  %232 = shl i64 %219, 2
  %233 = shl i64 %220, 2
  %min.iters.check4529 = icmp ult i64 %220, 8
  %n.vec4532 = and i64 %220, -8
  %cmp.n4534 = icmp eq i64 %220, %n.vec4532
  br label %for.cond1.preheader.us.i404

for.cond1.preheader.us.i404:                      ; preds = %for.cond1.preheader.us.i404.preheader, %for.cond1.for.cond.cleanup4_crit_edge.us.i
  %indvars.iv60.i = phi i64 [ %indvars.iv.next61.i, %for.cond1.for.cond.cleanup4_crit_edge.us.i ], [ 0, %for.cond1.preheader.us.i404.preheader ]
  %234 = mul i64 %232, %indvars.iv60.i
  %scevgep = getelementptr i8, i8* %call.i2.i, i64 %234
  %235 = add i64 %233, %234
  %scevgep4515 = getelementptr i8, i8* %call.i2.i, i64 %235
  %236 = mul i64 %220, %indvars.iv60.i
  %237 = add i64 %236, 1
  %mul.us.i403 = mul i64 %indvars.iv60.i, %220
  %mul20.us.i = mul i64 %indvars.iv60.i, %219
  br label %for.cond6.preheader.us.i

for.body10.us.i:                                  ; preds = %for.body10.us.i.preheader, %for.body10.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body10.us.i ], [ %indvars.iv.i.ph, %for.body10.us.i.preheader ]
  %238 = load float, float* %arrayidx.us.i407, align 4, !tbaa !8
  %add16.us.i = add i64 %indvars.iv.i, %mul14.us.i
  %arrayidx17.us.i = getelementptr inbounds float, float* %217, i64 %add16.us.i
  %239 = load float, float* %arrayidx17.us.i, align 4, !tbaa !8
  %add22.us.i = add i64 %indvars.iv.i, %mul20.us.i
  %arrayidx23.us.i = getelementptr inbounds float, float* %87, i64 %add22.us.i
  %240 = load float, float* %arrayidx23.us.i, align 4, !tbaa !8
  %241 = call float @llvm.fmuladd.f32(float %238, float %239, float %240) #30
  store float %241, float* %arrayidx23.us.i, align 4, !tbaa !8
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i405 = icmp eq i64 %indvars.iv.next.i, %220
  br i1 %exitcond.not.i405, label %for.cond6.for.cond.cleanup9_crit_edge.us.i, label %for.body10.us.i, !llvm.loop !115

for.cond6.preheader.us.i:                         ; preds = %for.cond6.for.cond.cleanup9_crit_edge.us.i, %for.cond1.preheader.us.i404
  %indvars.iv56.i = phi i64 [ 0, %for.cond1.preheader.us.i404 ], [ %indvars.iv.next57.i, %for.cond6.for.cond.cleanup9_crit_edge.us.i ]
  %add.us.i406 = add i64 %indvars.iv56.i, %mul.us.i403
  %arrayidx.us.i407 = getelementptr inbounds float, float* %216, i64 %add.us.i406
  %mul14.us.i = mul i64 %indvars.iv56.i, %219
  br i1 %min.iters.check4529, label %for.body10.us.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond6.preheader.us.i
  %242 = mul i64 %219, %indvars.iv56.i
  %243 = add i64 %220, %242
  %scevgep4522 = getelementptr float, float* %217, i64 %243
  %scevgep45224523 = bitcast float* %scevgep4522 to i8*
  %scevgep4520 = getelementptr float, float* %217, i64 %242
  %scevgep45204521 = bitcast float* %scevgep4520 to i8*
  %244 = add i64 %237, %indvars.iv56.i
  %scevgep4518 = getelementptr float, float* %216, i64 %244
  %scevgep45184519 = bitcast float* %scevgep4518 to i8*
  %245 = add i64 %236, %indvars.iv56.i
  %scevgep4516 = getelementptr float, float* %216, i64 %245
  %scevgep45164517 = bitcast float* %scevgep4516 to i8*
  %bound0 = icmp ult i8* %scevgep, %scevgep45184519
  %bound1 = icmp ugt i8* %scevgep4515, %scevgep45164517
  %found.conflict = and i1 %bound0, %bound1
  %bound04524 = icmp ult i8* %scevgep, %scevgep45224523
  %bound14525 = icmp ugt i8* %scevgep4515, %scevgep45204521
  %found.conflict4526 = and i1 %bound04524, %bound14525
  %conflict.rdx = or i1 %found.conflict, %found.conflict4526
  br i1 %conflict.rdx, label %for.body10.us.i.preheader, label %vector.ph4530

vector.ph4530:                                    ; preds = %vector.memcheck
  %246 = load float, float* %arrayidx.us.i407, align 4, !tbaa !8, !alias.scope !116
  %broadcast.splatinsert4540 = insertelement <4 x float> poison, float %246, i64 0
  %broadcast.splat4541 = shufflevector <4 x float> %broadcast.splatinsert4540, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert4542 = insertelement <4 x float> poison, float %246, i64 0
  %broadcast.splat4543 = shufflevector <4 x float> %broadcast.splatinsert4542, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body4535

vector.body4535:                                  ; preds = %vector.body4535, %vector.ph4530
  %index4536 = phi i64 [ 0, %vector.ph4530 ], [ %index.next4544, %vector.body4535 ]
  %247 = add i64 %index4536, %mul14.us.i
  %248 = getelementptr inbounds float, float* %217, i64 %247
  %249 = bitcast float* %248 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %249, align 4, !tbaa !8, !alias.scope !119
  %250 = getelementptr inbounds float, float* %248, i64 4
  %251 = bitcast float* %250 to <4 x float>*
  %wide.load4537 = load <4 x float>, <4 x float>* %251, align 4, !tbaa !8, !alias.scope !119
  %252 = add i64 %index4536, %mul20.us.i
  %253 = getelementptr inbounds float, float* %87, i64 %252
  %254 = bitcast float* %253 to <4 x float>*
  %wide.load4538 = load <4 x float>, <4 x float>* %254, align 4, !tbaa !8, !alias.scope !121, !noalias !123
  %255 = getelementptr inbounds float, float* %253, i64 4
  %256 = bitcast float* %255 to <4 x float>*
  %wide.load4539 = load <4 x float>, <4 x float>* %256, align 4, !tbaa !8, !alias.scope !121, !noalias !123
  %257 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4541, <4 x float> %wide.load, <4 x float> %wide.load4538)
  %258 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat4543, <4 x float> %wide.load4537, <4 x float> %wide.load4539)
  %259 = bitcast float* %253 to <4 x float>*
  store <4 x float> %257, <4 x float>* %259, align 4, !tbaa !8, !alias.scope !121, !noalias !123
  %260 = bitcast float* %255 to <4 x float>*
  store <4 x float> %258, <4 x float>* %260, align 4, !tbaa !8, !alias.scope !121, !noalias !123
  %index.next4544 = add nuw i64 %index4536, 8
  %261 = icmp eq i64 %index.next4544, %n.vec4532
  br i1 %261, label %middle.block4527, label %vector.body4535, !llvm.loop !124

middle.block4527:                                 ; preds = %vector.body4535
  br i1 %cmp.n4534, label %for.cond6.for.cond.cleanup9_crit_edge.us.i, label %for.body10.us.i.preheader

for.body10.us.i.preheader:                        ; preds = %vector.memcheck, %for.cond6.preheader.us.i, %middle.block4527
  %indvars.iv.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond6.preheader.us.i ], [ %n.vec4532, %middle.block4527 ]
  br label %for.body10.us.i

for.cond6.for.cond.cleanup9_crit_edge.us.i:       ; preds = %for.body10.us.i, %middle.block4527
  %indvars.iv.next57.i = add nuw nsw i64 %indvars.iv56.i, 1
  %exitcond59.not.i = icmp eq i64 %indvars.iv.next57.i, %220
  br i1 %exitcond59.not.i, label %for.cond1.for.cond.cleanup4_crit_edge.us.i, label %for.cond6.preheader.us.i, !llvm.loop !34

for.cond1.for.cond.cleanup4_crit_edge.us.i:       ; preds = %for.cond6.for.cond.cleanup9_crit_edge.us.i
  %indvars.iv.next61.i = add nuw nsw i64 %indvars.iv60.i, 1
  %exitcond63.not.i = icmp eq i64 %indvars.iv.next61.i, %218
  br i1 %exitcond63.not.i, label %_Z11naiveMatmulPfS_S_mmm.exit, label %for.cond1.preheader.us.i404, !llvm.loop !35

_Z11naiveMatmulPfS_S_mmm.exit:                    ; preds = %for.cond1.for.cond.cleanup4_crit_edge.us.i, %polly.loop_exit582, %polly.cond, %invoke.cont77
  %262 = load float*, float** %C, align 8, !tbaa !64
  %mul.i = mul i64 %219, %218
  %cmp7.not.i = icmp eq i64 %mul.i, 0
  br i1 %cmp7.not.i, label %if.end85, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %_Z11naiveMatmulPfS_S_mmm.exit
  %263 = load float, float* %262, align 4, !tbaa !8
  %264 = load float, float* %87, align 4, !tbaa !8
  %sub.i506 = fsub float %263, %264
  %265 = call float @llvm.fabs.f32(float %sub.i506) #30
  %266 = fpext float %265 to double
  %cmp2.i507 = fcmp ogt double %266, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2.i507, label %if.then80, label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %i.08.i508 = phi i64 [ %inc.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  %inc.i = add nuw i64 %i.08.i508, 1
  %exitcond.not.i408 = icmp eq i64 %inc.i, %mul.i
  br i1 %exitcond.not.i408, label %if.end85, label %for.body.i, !llvm.loop !63

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds float, float* %262, i64 %inc.i
  %267 = load float, float* %arrayidx.i, align 4, !tbaa !8
  %arrayidx1.i = getelementptr inbounds float, float* %87, i64 %inc.i
  %268 = load float, float* %arrayidx1.i, align 4, !tbaa !8
  %sub.i = fsub float %267, %268
  %269 = call float @llvm.fabs.f32(float %sub.i) #30
  %270 = fpext float %269 to double
  %cmp2.i = fcmp ogt double %270, 0x3EB0C6F7A0B5ED8D
  br i1 %cmp2.i, label %_Z6verifyPfS_mm.exit, label %for.cond.i, !llvm.loop !63

_Z6verifyPfS_mm.exit:                             ; preds = %for.body.i
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
  %271 = landingpad { i8*, i32 }
          cleanup
  %272 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %272) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #30
  br label %ehcleanup113

lpad12:                                           ; preds = %invoke.cont11
  %273 = landingpad { i8*, i32 }
          cleanup
  %274 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp9, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %274) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %24) #30
  br label %ehcleanup111

lpad20:                                           ; preds = %invoke.cont18
  %275 = landingpad { i8*, i32 }
          cleanup
  %276 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp16, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %276) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %41) #30
  br label %ehcleanup110

lpad30:                                           ; preds = %invoke.cont28
  %277 = landingpad { i8*, i32 }
          cleanup
  %278 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp26, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %278) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %58) #30
  br label %ehcleanup109

lpad40:                                           ; preds = %invoke.cont38
  %279 = landingpad { i8*, i32 }
          cleanup
  br label %lpad40.body

lpad40.body:                                      ; preds = %lpad.i, %lpad40
  %eh.lpad-body = phi { i8*, i32 } [ %279, %lpad40 ], [ %86, %lpad.i ]
  %280 = getelementptr inbounds %"class.cl::sycl::property_list", %"class.cl::sycl::property_list"* %ref.tmp36, i64 0, i32 0
  call void @_ZN2cl4sycl6detail16PropertyListBaseD2Ev(%"class.cl::sycl::detail::PropertyListBase"* noundef nonnull align 8 dereferenceable(32) %280) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %74) #30
  br label %ehcleanup109

lpad55:                                           ; preds = %_Z10initMatrixPfS_S_mmm.exit363
  %281 = landingpad { i8*, i32 }
          cleanup
  br label %lpad55.body

lpad55.body:                                      ; preds = %ehcleanup.i, %lpad55
  %eh.lpad-body394 = phi { i8*, i32 } [ %281, %lpad55 ], [ %.pn.i, %ehcleanup.i ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %182) #30
  br label %ehcleanup109

lpad72:                                           ; preds = %if.then.i.i.i472.invoke, %call1.i.noexc488, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483, %.noexc485, %if.end.i.i.i480, %call1.i.noexc, %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i, %.noexc462, %if.end.i.i.i, %invoke.cont98, %invoke.cont96, %invoke.cont94, %invoke.cont90, %invoke.cont86, %if.end85, %invoke.cont81, %if.then80
  %282 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup109

lpad76:                                           ; preds = %invoke.cont66
  %283 = landingpad { i8*, i32 }
          cleanup
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %214) #30
  br label %ehcleanup109

if.end85:                                         ; preds = %for.cond.i, %_Z11naiveMatmulPfS_S_mmm.exit, %_Z6verifyPfS_mm.exit
  %call1.i413 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i64 noundef 10)
          to label %invoke.cont86 unwind label %lpad72

invoke.cont86:                                    ; preds = %if.end85
  %call.i416417 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %div.i.i.i)
          to label %invoke.cont90 unwind label %lpad72

invoke.cont90:                                    ; preds = %invoke.cont86
  %call1.i419 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %call.i416417, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i64 noundef 2)
          to label %invoke.cont92 unwind label %lpad72

invoke.cont92:                                    ; preds = %invoke.cont90
  %284 = bitcast %"class.std::basic_ostream"* %call.i416417 to i8**
  %vtable.i = load i8*, i8** %284, align 8, !tbaa !75
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %285 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %285, align 8
  %286 = bitcast %"class.std::basic_ostream"* %call.i416417 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %286, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 240
  %287 = bitcast i8* %_M_ctype.i.i to %"class.std::ctype"**
  %288 = load %"class.std::ctype"*, %"class.std::ctype"** %287, align 8, !tbaa !125
  %tobool.not.i.i.i = icmp eq %"class.std::ctype"* %288, null
  br i1 %tobool.not.i.i.i, label %if.then.i.i.i472.invoke, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %invoke.cont92
  %_M_widen_ok.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %288, i64 0, i32 8
  %289 = load i8, i8* %_M_widen_ok.i.i.i, align 8, !tbaa !128
  %tobool.not.i3.i.i = icmp eq i8 %289, 0
  br i1 %tobool.not.i3.i.i, label %if.end.i.i.i, label %if.then.i4.i.i

if.then.i4.i.i:                                   ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %arrayidx.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %288, i64 0, i32 9, i64 10
  %290 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !130
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i

if.end.i.i.i:                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %288)
          to label %.noexc462 unwind label %lpad72

.noexc462:                                        ; preds = %if.end.i.i.i
  %291 = bitcast %"class.std::ctype"* %288 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %291, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i, i64 6
  %292 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i.i.i463 = invoke noundef i8 %292(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %288, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i unwind label %lpad72

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i: ; preds = %.noexc462, %if.then.i4.i.i
  %retval.0.i.i.i = phi i8 [ %290, %if.then.i4.i.i ], [ %call.i.i.i463, %.noexc462 ]
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
  %293 = bitcast %"class.std::basic_ostream"* %call.i427428 to i8**
  %vtable.i466 = load i8*, i8** %293, align 8, !tbaa !75
  %vbase.offset.ptr.i467 = getelementptr i8, i8* %vtable.i466, i64 -24
  %294 = bitcast i8* %vbase.offset.ptr.i467 to i64*
  %vbase.offset.i468 = load i64, i64* %294, align 8
  %295 = bitcast %"class.std::basic_ostream"* %call.i427428 to i8*
  %add.ptr.i469 = getelementptr inbounds i8, i8* %295, i64 %vbase.offset.i468
  %_M_ctype.i.i470 = getelementptr inbounds i8, i8* %add.ptr.i469, i64 240
  %296 = bitcast i8* %_M_ctype.i.i470 to %"class.std::ctype"**
  %297 = load %"class.std::ctype"*, %"class.std::ctype"** %296, align 8, !tbaa !125
  %tobool.not.i.i.i471 = icmp eq %"class.std::ctype"* %297, null
  br i1 %tobool.not.i.i.i471, label %if.then.i.i.i472.invoke, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475

if.then.i.i.i472.invoke:                          ; preds = %invoke.cont100, %invoke.cont92
  invoke void @_ZSt16__throw_bad_castv() #33
          to label %if.then.i.i.i472.cont unwind label %lpad72

if.then.i.i.i472.cont:                            ; preds = %if.then.i.i.i472.invoke
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475: ; preds = %invoke.cont100
  %_M_widen_ok.i.i.i473 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %297, i64 0, i32 8
  %298 = load i8, i8* %_M_widen_ok.i.i.i473, align 8, !tbaa !128
  %tobool.not.i3.i.i474 = icmp eq i8 %298, 0
  br i1 %tobool.not.i3.i.i474, label %if.end.i.i.i480, label %if.then.i4.i.i477

if.then.i4.i.i477:                                ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475
  %arrayidx.i.i.i476 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %297, i64 0, i32 9, i64 10
  %299 = load i8, i8* %arrayidx.i.i.i476, align 1, !tbaa !130
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483

if.end.i.i.i480:                                  ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i475
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %297)
          to label %.noexc485 unwind label %lpad72

.noexc485:                                        ; preds = %if.end.i.i.i480
  %300 = bitcast %"class.std::ctype"* %297 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i478 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %300, align 8, !tbaa !75
  %vfn.i.i.i479 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i478, i64 6
  %301 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i479, align 8
  %call.i.i.i487 = invoke noundef i8 %301(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %297, i8 noundef 10)
          to label %_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483 unwind label %lpad72

_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc.exit.i483: ; preds = %.noexc485, %if.then.i4.i.i477
  %retval.0.i.i.i481 = phi i8 [ %299, %if.then.i4.i.i477 ], [ %call.i.i.i487, %.noexc485 ]
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
  %302 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i436, align 8, !tbaa !71
  %cmp.not.i.i.i437 = icmp eq %"class.std::_Sp_counted_base"* %302, null
  br i1 %cmp.not.i.i.i437, label %_ZN2cl4sycl5queueD2Ev.exit, label %if.then.i.i.i439

if.then.i.i.i439:                                 ; preds = %invoke.cont102
  %_M_use_count.i.i.i.i438 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %302, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i440, label %if.else.i.i.i.i.i442

if.then.i.i.i.i.i440:                             ; preds = %if.then.i.i.i439
  %303 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i438, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i445

if.else.i.i.i.i.i442:                             ; preds = %if.then.i.i.i439
  %304 = load i32, i32* %_M_use_count.i.i.i.i438, align 8, !tbaa !73
  %add.i.i.i.i.i.i441 = add nsw i32 %304, -1
  store i32 %add.i.i.i.i.i.i441, i32* %_M_use_count.i.i.i.i438, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i445

invoke.cont.i.i.i.i445:                           ; preds = %if.else.i.i.i.i.i442, %if.then.i.i.i.i.i440
  %retval.0.i.i.i.i.i443 = phi i32 [ %303, %if.then.i.i.i.i.i440 ], [ %304, %if.else.i.i.i.i.i442 ]
  %cmp.i.i.i.i444 = icmp eq i32 %retval.0.i.i.i.i.i443, 1
  br i1 %cmp.i.i.i.i444, label %if.then.i.i.i.i449, label %_ZN2cl4sycl5queueD2Ev.exit

if.then.i.i.i.i449:                               ; preds = %invoke.cont.i.i.i.i445
  %305 = bitcast %"class.std::_Sp_counted_base"* %302 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i446 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %305, align 8, !tbaa !75
  %vfn.i.i.i.i447 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i446, i64 2
  %306 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i447, align 8
  call void %306(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %302) #30
  %_M_weak_count.i.i.i.i448 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %302, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i450, label %if.else.i11.i.i.i.i452

if.then.i9.i.i.i.i450:                            ; preds = %if.then.i.i.i.i449
  %307 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i448, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i455

if.else.i11.i.i.i.i452:                           ; preds = %if.then.i.i.i.i449
  %308 = load i32, i32* %_M_weak_count.i.i.i.i448, align 4, !tbaa !73
  %add.i.i10.i.i.i.i451 = add nsw i32 %308, -1
  store i32 %add.i.i10.i.i.i.i451, i32* %_M_weak_count.i.i.i.i448, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i455

invoke.cont2.i.i.i.i455:                          ; preds = %if.else.i11.i.i.i.i452, %if.then.i9.i.i.i.i450
  %retval.0.i12.i.i.i.i453 = phi i32 [ %307, %if.then.i9.i.i.i.i450 ], [ %308, %if.else.i11.i.i.i.i452 ]
  %cmp4.i.i.i.i454 = icmp eq i32 %retval.0.i12.i.i.i.i453, 1
  br i1 %cmp4.i.i.i.i454, label %if.then5.i.i.i.i458, label %_ZN2cl4sycl5queueD2Ev.exit

if.then5.i.i.i.i458:                              ; preds = %invoke.cont2.i.i.i.i455
  %vtable6.i.i.i.i456 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %305, align 8, !tbaa !75
  %vfn7.i.i.i.i457 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i456, i64 3
  %309 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i457, align 8
  call void %309(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %302) #30
  br label %_ZN2cl4sycl5queueD2Ev.exit

_ZN2cl4sycl5queueD2Ev.exit:                       ; preds = %invoke.cont102, %invoke.cont.i.i.i.i445, %invoke.cont2.i.i.i.i455, %if.then5.i.i.i.i458
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  ret i32 0

ehcleanup109:                                     ; preds = %lpad55.body, %lpad72, %lpad76, %lpad40.body, %lpad30
  %.pn134.pn.pn.pn.pn = phi { i8*, i32 } [ %277, %lpad30 ], [ %eh.lpad-body, %lpad40.body ], [ %eh.lpad-body394, %lpad55.body ], [ %282, %lpad72 ], [ %283, %lpad76 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %55) #30
  br label %ehcleanup110

ehcleanup110:                                     ; preds = %ehcleanup109, %lpad20
  %.pn134.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn, %ehcleanup109 ], [ %275, %lpad20 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #30
  br label %ehcleanup111

ehcleanup111:                                     ; preds = %ehcleanup110, %lpad12
  %.pn134.pn.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn.pn, %ehcleanup110 ], [ %273, %lpad12 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #30
  call void @_ZN2cl4sycl5queueD2Ev(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %q) #30
  br label %ehcleanup113

ehcleanup113:                                     ; preds = %ehcleanup111, %lpad
  %.pn134.pn.pn.pn.pn.pn.pn.pn = phi { i8*, i32 } [ %.pn134.pn.pn.pn.pn.pn.pn, %ehcleanup111 ], [ %271, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #30
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #30
  resume { i8*, i32 } %.pn134.pn.pn.pn.pn.pn.pn.pn

polly.cond:                                       ; preds = %polly.split_new_and_old
  %310 = icmp sgt i64 %218, 0
  %polly.loop_guard = icmp sgt i64 %220, 0
  %or.cond = select i1 %310, i1 %polly.loop_guard, i1 false
  br i1 %or.cond, label %polly.loop_preheader, label %_Z11naiveMatmulPfS_S_mmm.exit

polly.loop_exit582:                               ; preds = %polly.loop_if608, %polly.loop_exit611.loopexit.us, %polly.loop_preheader581.split
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next4326 = add nsw i64 %indvars.iv4325, -256
  %indvars.iv.next4339 = add nsw i64 %indvars.iv4338, -256
  %exitcond4349.not = icmp eq i64 %polly.indvar, %smax4348
  br i1 %exitcond4349.not, label %_Z11naiveMatmulPfS_S_mmm.exit, label %polly.loop_preheader581

polly.loop_preheader:                             ; preds = %polly.cond
  %polly.fdiv_q.shr = ashr i64 %.res, 11
  %311 = shl i64 %219, 2
  %pexp.p_div_q4158 = lshr i64 %.res, 9
  %pexp.fdiv_q.4 = sdiv i64 %.res517, 96
  %polly.loop_guard612 = icmp sgt i64 %.res517, -96
  %pexp.pdiv_r2246 = and i64 %220, 7
  %312 = icmp ne i64 %pexp.pdiv_r2246, 0
  %pexp.p_div_q6434225 = lshr i64 %220, 3
  %pexp.p_div_q6524226 = lshr i64 %218, 2
  %pexp.pdiv_r1277 = and i64 %218, 3
  %313 = icmp ne i64 %pexp.pdiv_r1277, 0
  %pexp.pdiv_r1738 = and i64 %.res517, 3
  %314 = sub nsw i64 %218, %pexp.pdiv_r1738
  %315 = add nsw i64 %314, -1
  %pexp.p_div_q17414227 = lshr i64 %.res517, 2
  %316 = mul i64 %315, %311
  %317 = icmp ugt i64 %pexp.pdiv_r1277, 1
  %318 = mul i64 %314, %311
  %319 = add nuw nsw i64 %218, 1
  %320 = and i64 %319, 3
  %321 = icmp eq i64 %320, 0
  %322 = add nsw i64 %218, -3
  %pexp.div = ashr exact i64 %322, 2
  %323 = mul i64 %311, %.res517
  %pexp.pdiv_r3442 = and i64 %.res, 7
  %324 = sub nsw i64 %220, %pexp.pdiv_r3442
  %pexp.p_div_q34524160 = lshr i64 %.res, 3
  %325 = shl i64 %324, 2
  %326 = add i64 %325, -4
  %327 = icmp ugt i64 %pexp.pdiv_r2246, 1
  %328 = add nsw i64 %220, -2
  %pexp.p_div_q34784178 = lshr i64 %328, 3
  %.not4179 = icmp eq i64 %pexp.pdiv_r2246, 2
  %329 = add nsw i64 %220, -3
  %pexp.p_div_q35044180 = lshr i64 %329, 3
  %330 = add i64 %325, 4
  %331 = icmp ugt i64 %pexp.pdiv_r2246, 3
  %332 = add i64 %325, 8
  %.not4181 = icmp eq i64 %pexp.pdiv_r2246, 4
  %333 = add i64 %325, 12
  %334 = icmp ugt i64 %pexp.pdiv_r2246, 5
  %335 = add i64 %325, 16
  %336 = add nuw nsw i64 %220, 1
  %337 = and i64 %336, 7
  %338 = icmp eq i64 %337, 0
  %339 = add nsw i64 %220, -7
  %pexp.div3607 = ashr exact i64 %339, 3
  %340 = shl i64 %.res, 2
  %341 = add i64 %323, 4
  %smax4348 = call i64 @llvm.smax.i64(i64 %polly.fdiv_q.shr, i64 0)
  br label %polly.loop_preheader581

polly.loop_preheader581:                          ; preds = %polly.loop_preheader, %polly.loop_exit582
  %indvars.iv4338 = phi i64 [ %pexp.p_div_q34524160, %polly.loop_preheader ], [ %indvars.iv.next4339, %polly.loop_exit582 ]
  %indvars.iv4325 = phi i64 [ %pexp.p_div_q6434225, %polly.loop_preheader ], [ %indvars.iv.next4326, %polly.loop_exit582 ]
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit582 ]
  %342 = shl nuw i64 %polly.indvar, 11
  %343 = or i64 %342, 2047
  %smin4574 = call i64 @llvm.smin.i64(i64 %343, i64 %.res)
  %smax4575 = call i64 @llvm.smax.i64(i64 %smin4574, i64 %342)
  %344 = mul nsw i64 %polly.indvar, -2048
  %345 = or i64 %344, 1
  %346 = add i64 %smax4575, %345
  %347 = shl nuw i64 %polly.indvar, 11
  %348 = or i64 %347, 2047
  %smin4558 = call i64 @llvm.smin.i64(i64 %348, i64 %.res)
  %smax = call i64 @llvm.smax.i64(i64 %smin4558, i64 %347)
  %349 = mul nsw i64 %polly.indvar, -2048
  %350 = or i64 %349, 1
  %351 = add i64 %smax, %350
  %smin4340 = call i64 @llvm.smin.i64(i64 %indvars.iv4338, i64 255)
  %smin4327 = call i64 @llvm.smin.i64(i64 %indvars.iv4325, i64 256)
  %352 = call i64 @llvm.smax.i64(i64 %smin4327, i64 1)
  %353 = shl nsw i64 %polly.indvar, 11
  %354 = or i64 %353, 2047
  %355 = call i64 @llvm.smin.i64(i64 %.res, i64 %354)
  %polly.loop_guard598.not = icmp sgt i64 %353, %355
  %polly.loop_guard598.not.fr = freeze i1 %polly.loop_guard598.not
  %356 = mul nsw i64 %polly.indvar, -256
  %357 = or i64 %353, 7
  %358 = icmp sge i64 %357, %220
  %359 = icmp sge i64 %354, %220
  %360 = and i1 %312, %359
  %361 = add nsw i64 %356, %pexp.p_div_q6434225
  %polly.loop_guard648 = icmp slt i64 %361, 1
  %362 = add nsw i64 %356, %pexp.p_div_q34524160
  %polly.access.mul.Packed_B3453 = shl nsw i64 %362, 9
  %363 = add nsw i64 %356, %pexp.p_div_q34784178
  %polly.access.mul.Packed_B3479 = shl nsw i64 %363, 9
  %364 = add nsw i64 %356, %pexp.p_div_q35044180
  %polly.access.mul.Packed_B3505 = shl nsw i64 %364, 9
  %365 = add nsw i64 %356, %pexp.div3607
  %polly.access.mul.Packed_B3608 = shl nsw i64 %365, 9
  %366 = call i64 @llvm.smin.i64(i64 %362, i64 255)
  %polly.loop_guard2889 = icmp sgt i64 %366, -1
  %367 = shl i64 %polly.indvar, 13
  %368 = or i64 %353, 2
  %.not4205 = icmp slt i64 %220, %368
  %369 = or i64 %367, 4
  %370 = or i64 %353, 3
  %.not4221 = icmp slt i64 %220, %370
  %371 = shl i64 %368, 2
  %372 = or i64 %353, 4
  %.not4222 = icmp slt i64 %220, %372
  %373 = shl i64 %370, 2
  %374 = or i64 %353, 5
  %.not4223 = icmp slt i64 %220, %374
  %375 = shl i64 %372, 2
  %376 = or i64 %353, 6
  %.not4224 = icmp slt i64 %220, %376
  %377 = shl i64 %374, 2
  %378 = icmp eq i64 %357, %220
  br i1 %polly.loop_guard612, label %polly.loop_if586.us.preheader, label %polly.loop_preheader581.split

polly.loop_if586.us.preheader:                    ; preds = %polly.loop_preheader581
  %min.iters.check4561 = icmp ult i64 %351, 2
  %n.vec4564 = and i64 %351, -2
  %ind.end4566 = add i64 %353, %n.vec4564
  %cmp.n4567 = icmp eq i64 %351, %n.vec4564
  br label %polly.loop_if586.us

polly.loop_if586.us:                              ; preds = %polly.loop_if586.us.preheader, %polly.loop_exit611.loopexit.us
  %indvars.iv4313 = phi i64 [ %indvars.iv.next4314, %polly.loop_exit611.loopexit.us ], [ %.res, %polly.loop_if586.us.preheader ]
  %indvars.iv4303 = phi i64 [ %indvars.iv.next4304, %polly.loop_exit611.loopexit.us ], [ 511, %polly.loop_if586.us.preheader ]
  %polly.indvar583.us = phi i64 [ %polly.indvar_next584.us, %polly.loop_exit611.loopexit.us ], [ 0, %polly.loop_if586.us.preheader ]
  %smin4545 = call i64 @llvm.smin.i64(i64 %indvars.iv4303, i64 %.res)
  %379 = mul nsw i64 %polly.indvar583.us, -512
  %380 = or i64 %379, 1
  %381 = add i64 %smin4545, %380
  %smin4342 = call i64 @llvm.smin.i64(i64 %indvars.iv4313, i64 511)
  %smin4307 = call i64 @llvm.smin.i64(i64 %indvars.iv4303, i64 %.res)
  %382 = shl nsw i64 %polly.indvar583.us, 9
  %383 = or i64 %382, 511
  %384 = call i64 @llvm.smin.i64(i64 %.res, i64 %383)
  %polly.loop_guard590.not.us = icmp sgt i64 %382, %384
  br i1 %polly.loop_guard590.not.us, label %polly.loop_if608.us, label %polly.loop_if594.preheader.us

polly.loop_if594.us4239:                          ; preds = %polly.loop_if594.preheader.us, %polly.loop_exit597.loopexit.us
  %polly.indvar591.us4240 = phi i64 [ %polly.indvar_next592.us4266, %polly.loop_exit597.loopexit.us ], [ %382, %polly.loop_if594.preheader.us ]
  %polly.access.mul.602.us = mul nsw i64 %polly.indvar591.us4240, %219
  br i1 %min.iters.check4561, label %polly.loop_header595.us.preheader, label %vector.body4568

vector.body4568:                                  ; preds = %polly.loop_if594.us4239, %vector.body4568
  %index4569 = phi i64 [ %index.next4573, %vector.body4568 ], [ 0, %polly.loop_if594.us4239 ]
  %offset.idx4570 = add i64 %353, %index4569
  %induction4572 = or i64 %offset.idx4570, 1
  %385 = add nsw i64 %offset.idx4570, %polly.access.mul.602.us
  %386 = add nsw i64 %induction4572, %polly.access.mul.602.us
  %387 = getelementptr float, float* %217, i64 %385
  %388 = getelementptr float, float* %217, i64 %386
  %389 = load float, float* %387, align 4, !alias.scope !131, !noalias !134
  %390 = load float, float* %388, align 4, !alias.scope !131, !noalias !134
  %391 = lshr i64 %offset.idx4570, 3
  %392 = lshr i64 %offset.idx4570, 3
  %393 = add i64 %547, %391
  %394 = add i64 %547, %392
  %395 = shl i64 %393, 9
  %396 = shl i64 %394, 9
  %397 = add i64 %395, %polly.indvar591.us4240
  %398 = add i64 %396, %polly.indvar591.us4240
  %399 = shl nsw i64 %397, 3
  %400 = shl nsw i64 %398, 3
  %401 = and i64 %offset.idx4570, 6
  %402 = and i64 %induction4572, 7
  %403 = or i64 %399, %401
  %404 = or i64 %400, %402
  %405 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %403
  %406 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %404
  store float %389, float* %405, align 8, !alias.scope !139, !noalias !140
  store float %390, float* %406, align 4, !alias.scope !139, !noalias !140
  %index.next4573 = add nuw i64 %index4569, 2
  %407 = icmp eq i64 %index.next4573, %n.vec4564
  br i1 %407, label %middle.block4559, label %vector.body4568, !llvm.loop !141

middle.block4559:                                 ; preds = %vector.body4568
  br i1 %cmp.n4567, label %polly.loop_exit597.loopexit.us, label %polly.loop_header595.us.preheader

polly.loop_header595.us.preheader:                ; preds = %polly.loop_if594.us4239, %middle.block4559
  %polly.indvar599.us.ph = phi i64 [ %353, %polly.loop_if594.us4239 ], [ %ind.end4566, %middle.block4559 ]
  br label %polly.loop_header595.us

polly.loop_header595.us:                          ; preds = %polly.loop_header595.us.preheader, %polly.loop_header595.us
  %polly.indvar599.us = phi i64 [ %polly.indvar_next600.us, %polly.loop_header595.us ], [ %polly.indvar599.us.ph, %polly.loop_header595.us.preheader ]
  %polly.access.add.603.us = add nsw i64 %polly.indvar599.us, %polly.access.mul.602.us
  %polly.access.604.us = getelementptr float, float* %217, i64 %polly.access.add.603.us
  %polly.access.604.load.us = load float, float* %polly.access.604.us, align 4, !alias.scope !131, !noalias !134
  %pexp.p_div_q6054231.us = lshr i64 %polly.indvar599.us, 3
  %reass.add.us = add i64 %547, %pexp.p_div_q6054231.us
  %reass.mul.us = shl i64 %reass.add.us, 9
  %polly.access.add.Packed_B.us = add i64 %reass.mul.us, %polly.indvar591.us4240
  %polly.access.mul.Packed_B606.us = shl nsw i64 %polly.access.add.Packed_B.us, 3
  %pexp.pdiv_r.us = and i64 %polly.indvar599.us, 7
  %polly.access.add.Packed_B607.us = or i64 %polly.access.mul.Packed_B606.us, %pexp.pdiv_r.us
  %polly.access.Packed_B.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B607.us
  store float %polly.access.604.load.us, float* %polly.access.Packed_B.us, align 4, !alias.scope !139, !noalias !140
  %polly.indvar_next600.us = add nuw nsw i64 %polly.indvar599.us, 1
  %polly.loop_cond601.not.not.us = icmp slt i64 %polly.indvar599.us, %355
  br i1 %polly.loop_cond601.not.not.us, label %polly.loop_header595.us, label %polly.loop_exit597.loopexit.us, !llvm.loop !142

polly.loop_if608.us:                              ; preds = %polly.loop_exit597.loopexit.us, %polly.loop_if594.preheader.us, %polly.loop_if586.us
  %408 = xor i64 %382, -1
  %409 = add i64 %220, %408
  %410 = call i64 @llvm.smin.i64(i64 %409, i64 511)
  %polly.loop_guard665.us = icmp sgt i64 %410, -1
  %min.iters.check4548 = icmp ult i64 %381, 2
  %n.vec4551 = and i64 %381, -2
  %ind.end = add i64 %382, %n.vec4551
  %cmp.n4553 = icmp eq i64 %381, %n.vec4551
  %polly.loop_guard665.us.not4384 = xor i1 %polly.loop_guard665.us, true
  %polly.loop_guard665.us.not = xor i1 %polly.loop_guard665.us, true
  br label %polly.loop_if616.us

polly.loop_if616.us:                              ; preds = %polly.loop_if608.us, %polly.merge2243.us
  %indvars.iv4332 = phi i64 [ %pexp.p_div_q17414227, %polly.loop_if608.us ], [ %indvars.iv.next4333, %polly.merge2243.us ]
  %indvars.iv4317 = phi i64 [ %pexp.p_div_q6524226, %polly.loop_if608.us ], [ %indvars.iv.next4318, %polly.merge2243.us ]
  %indvars.iv4309 = phi i64 [ 95, %polly.loop_if608.us ], [ %indvars.iv.next4310, %polly.merge2243.us ]
  %polly.indvar613.us = phi i64 [ 0, %polly.loop_if608.us ], [ %polly.indvar_next614.us, %polly.merge2243.us ]
  %smin4344 = call i64 @llvm.smin.i64(i64 %indvars.iv4332, i64 23)
  %smin4319 = call i64 @llvm.smin.i64(i64 %indvars.iv4317, i64 24)
  %411 = call i64 @llvm.smax.i64(i64 %smin4319, i64 1)
  %smin4311 = call i64 @llvm.smin.i64(i64 %indvars.iv4309, i64 %.res517)
  %412 = mul nuw nsw i64 %polly.indvar613.us, 96
  %413 = add nuw nsw i64 %412, 95
  %414 = call i64 @llvm.smin.i64(i64 %.res517, i64 %413)
  %polly.loop_guard620.not.us = icmp sgt i64 %412, %414
  br i1 %polly.loop_guard620.not.us, label %polly.cond639.us, label %polly.loop_if624.preheader.us

polly.loop_if624.us4241:                          ; preds = %polly.loop_if624.preheader.us, %polly.loop_exit627.loopexit.us
  %polly.indvar621.us4242 = phi i64 [ %polly.indvar_next622.us4260, %polly.loop_exit627.loopexit.us ], [ %412, %polly.loop_if624.preheader.us ]
  %polly.access.mul.632.us = mul nsw i64 %polly.indvar621.us4242, %220
  %pexp.p_div_q6354230.us = lshr i64 %polly.indvar621.us4242, 2
  %reass.add4233.us = add i64 %546, %pexp.p_div_q6354230.us
  %reass.mul4234.us = shl i64 %reass.add4233.us, 9
  %pexp.pdiv_r637.us = and i64 %polly.indvar621.us4242, 3
  br i1 %min.iters.check4548, label %polly.loop_header625.us.preheader, label %vector.body4554

vector.body4554:                                  ; preds = %polly.loop_if624.us4241, %vector.body4554
  %index4555 = phi i64 [ %index.next4557, %vector.body4554 ], [ 0, %polly.loop_if624.us4241 ]
  %offset.idx = add i64 %382, %index4555
  %induction4556 = or i64 %offset.idx, 1
  %415 = add nsw i64 %offset.idx, %polly.access.mul.632.us
  %416 = add nsw i64 %induction4556, %polly.access.mul.632.us
  %417 = getelementptr float, float* %216, i64 %415
  %418 = getelementptr float, float* %216, i64 %416
  %419 = load float, float* %417, align 4, !alias.scope !143, !noalias !144
  %420 = load float, float* %418, align 4, !alias.scope !143, !noalias !144
  %421 = add i64 %offset.idx, %reass.mul4234.us
  %422 = add i64 %induction4556, %reass.mul4234.us
  %423 = shl nsw i64 %421, 2
  %424 = shl nsw i64 %422, 2
  %425 = or i64 %423, %pexp.pdiv_r637.us
  %426 = or i64 %424, %pexp.pdiv_r637.us
  %427 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %425
  %428 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %426
  store float %419, float* %427, align 4, !alias.scope !145, !noalias !146
  store float %420, float* %428, align 4, !alias.scope !145, !noalias !146
  %index.next4557 = add nuw i64 %index4555, 2
  %429 = icmp eq i64 %index.next4557, %n.vec4551
  br i1 %429, label %middle.block4546, label %vector.body4554, !llvm.loop !147

middle.block4546:                                 ; preds = %vector.body4554
  br i1 %cmp.n4553, label %polly.loop_exit627.loopexit.us, label %polly.loop_header625.us.preheader

polly.loop_header625.us.preheader:                ; preds = %polly.loop_if624.us4241, %middle.block4546
  %polly.indvar629.us.ph = phi i64 [ %382, %polly.loop_if624.us4241 ], [ %ind.end, %middle.block4546 ]
  br label %polly.loop_header625.us

polly.loop_header625.us:                          ; preds = %polly.loop_header625.us.preheader, %polly.loop_header625.us
  %polly.indvar629.us = phi i64 [ %polly.indvar_next630.us, %polly.loop_header625.us ], [ %polly.indvar629.us.ph, %polly.loop_header625.us.preheader ]
  %polly.access.add.633.us = add nsw i64 %polly.indvar629.us, %polly.access.mul.632.us
  %polly.access.634.us = getelementptr float, float* %216, i64 %polly.access.add.633.us
  %polly.access.634.load.us = load float, float* %polly.access.634.us, align 4, !alias.scope !143, !noalias !144
  %polly.access.add.Packed_A.us = add i64 %polly.indvar629.us, %reass.mul4234.us
  %polly.access.mul.Packed_A636.us = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.add.Packed_A638.us = or i64 %polly.access.mul.Packed_A636.us, %pexp.pdiv_r637.us
  %polly.access.Packed_A.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A638.us
  store float %polly.access.634.load.us, float* %polly.access.Packed_A.us, align 4, !alias.scope !145, !noalias !146
  %polly.indvar_next630.us = add nuw i64 %polly.indvar629.us, 1
  %exitcond4308.not = icmp eq i64 %polly.indvar629.us, %smin4307
  br i1 %exitcond4308.not, label %polly.loop_exit627.loopexit.us, label %polly.loop_header625.us, !llvm.loop !148

polly.cond639.us:                                 ; preds = %polly.loop_exit627.loopexit.us, %polly.loop_if624.preheader.us, %polly.loop_if616.us
  %430 = or i64 %412, 4
  %.not.us = icmp slt i64 %218, %430
  %brmerge = select i1 %.not.us, i1 true, i1 %polly.loop_guard648
  br i1 %brmerge, label %polly.cond2242.us, label %polly.loop_if653.preheader.us

polly.loop_if653.us:                              ; preds = %polly.loop_if653.preheader.us, %polly.merge1274.us
  %polly.indvar649.us = phi i64 [ %polly.indvar_next650.us, %polly.merge1274.us ], [ 0, %polly.loop_if653.preheader.us ]
  br i1 %polly.loop_guard657.us, label %polly.loop_if661.preheader.us, label %polly.cond1273.us

polly.cond1273.us:                                ; preds = %polly.loop_exit664.loopexit.us.us, %polly.loop_if661.preheader.us, %polly.loop_if653.us
  br i1 %538, label %polly.cond1278.us, label %polly.merge1274.us

polly.cond1278.us:                                ; preds = %polly.cond1273.us
  br i1 %531, label %polly.loop_if1282.us, label %polly.loop_if1730.us

polly.loop_if1730.us:                             ; preds = %polly.cond1278.us
  br i1 %polly.loop_guard665.us, label %polly.cond1906.preheader.us, label %polly.merge1274.us

polly.cond1906.us:                                ; preds = %polly.cond1906.preheader.us, %polly.merge1907.us
  %polly.indvar1735.us = phi i64 [ %polly.indvar_next1736.us, %polly.merge1907.us ], [ 0, %polly.cond1906.preheader.us ]
  %polly.access.add.Packed_A1743.us = add nsw i64 %polly.indvar1735.us, %polly.access.mul.Packed_A1742.us
  %polly.access.mul.Packed_A1744.us = shl nsw i64 %polly.access.add.Packed_A1743.us, 2
  %polly.access.Packed_A1746.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1744.us
  %_p_scalar_1747.us = load float, float* %polly.access.Packed_A1746.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.add.Packed_B1750.us = add nuw nsw i64 %polly.indvar1735.us, %polly.access.mul.Packed_B1749.us
  %polly.access.mul.Packed_B1751.us = shl nsw i64 %polly.access.add.Packed_B1750.us, 3
  %polly.access.Packed_B1753.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1751.us
  %_p_scalar_1754.us = load float, float* %polly.access.Packed_B1753.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_1757.us = load float, float* %scevgep17551756.us, align 4, !alias.scope !149, !noalias !150
  %p_1758.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1754.us, float %_p_scalar_1757.us) #30
  store float %p_1758.us, float* %scevgep17551756.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1773.us = or i64 %polly.access.mul.Packed_B1751.us, 1
  %polly.access.Packed_B1774.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1773.us
  %_p_scalar_1775.us = load float, float* %polly.access.Packed_B1774.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1778.us = load float, float* %scevgep17761777.us, align 4, !alias.scope !149, !noalias !150
  %p_1779.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1775.us, float %_p_scalar_1778.us) #30
  store float %p_1779.us, float* %scevgep17761777.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1794.us = or i64 %polly.access.mul.Packed_B1751.us, 2
  %polly.access.Packed_B1795.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1794.us
  %_p_scalar_1796.us = load float, float* %polly.access.Packed_B1795.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_1799.us = load float, float* %scevgep17971798.us, align 4, !alias.scope !149, !noalias !150
  %p_1800.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1796.us, float %_p_scalar_1799.us) #30
  store float %p_1800.us, float* %scevgep17971798.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1815.us = or i64 %polly.access.mul.Packed_B1751.us, 3
  %polly.access.Packed_B1816.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1815.us
  %_p_scalar_1817.us = load float, float* %polly.access.Packed_B1816.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1820.us = load float, float* %scevgep18181819.us, align 4, !alias.scope !149, !noalias !150
  %p_1821.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1817.us, float %_p_scalar_1820.us) #30
  store float %p_1821.us, float* %scevgep18181819.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1836.us = or i64 %polly.access.mul.Packed_B1751.us, 4
  %polly.access.Packed_B1837.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1836.us
  %_p_scalar_1838.us = load float, float* %polly.access.Packed_B1837.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_1841.us = load float, float* %scevgep18391840.us, align 4, !alias.scope !149, !noalias !150
  %p_1842.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1838.us, float %_p_scalar_1841.us) #30
  store float %p_1842.us, float* %scevgep18391840.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1857.us = or i64 %polly.access.mul.Packed_B1751.us, 5
  %polly.access.Packed_B1858.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1857.us
  %_p_scalar_1859.us = load float, float* %polly.access.Packed_B1858.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1862.us = load float, float* %scevgep18601861.us, align 4, !alias.scope !149, !noalias !150
  %p_1863.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1859.us, float %_p_scalar_1862.us) #30
  store float %p_1863.us, float* %scevgep18601861.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1878.us = or i64 %polly.access.mul.Packed_B1751.us, 6
  %polly.access.Packed_B1879.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1878.us
  %_p_scalar_1880.us = load float, float* %polly.access.Packed_B1879.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_1883.us = load float, float* %scevgep18811882.us, align 4, !alias.scope !149, !noalias !150
  %p_1884.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1880.us, float %_p_scalar_1883.us) #30
  store float %p_1884.us, float* %scevgep18811882.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1899.us = or i64 %polly.access.mul.Packed_B1751.us, 7
  %polly.access.Packed_B1900.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1899.us
  %_p_scalar_1901.us = load float, float* %polly.access.Packed_B1900.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1904.us = load float, float* %scevgep19021903.us, align 4, !alias.scope !149, !noalias !150
  %p_1905.us = call float @llvm.fmuladd.f32(float %_p_scalar_1747.us, float %_p_scalar_1901.us, float %_p_scalar_1904.us) #30
  store float %p_1905.us, float* %scevgep19021903.us, align 4, !alias.scope !149, !noalias !150
  br i1 %317, label %polly.cond2079.us, label %polly.merge1907.us

polly.cond2079.us:                                ; preds = %polly.cond1906.us
  %polly.access.add.Packed_A1918.us = or i64 %polly.access.mul.Packed_A1744.us, 1
  %polly.access.Packed_A1919.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1918.us
  %_p_scalar_1920.us = load float, float* %polly.access.Packed_A1919.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_1930.us = load float, float* %scevgep19281929.us, align 4, !alias.scope !149, !noalias !150
  %p_1931.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1754.us, float %_p_scalar_1930.us) #30
  store float %p_1931.us, float* %scevgep19281929.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1951.us = load float, float* %scevgep19491950.us, align 4, !alias.scope !149, !noalias !150
  %p_1952.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1775.us, float %_p_scalar_1951.us) #30
  store float %p_1952.us, float* %scevgep19491950.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1972.us = load float, float* %scevgep19701971.us, align 4, !alias.scope !149, !noalias !150
  %p_1973.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1796.us, float %_p_scalar_1972.us) #30
  store float %p_1973.us, float* %scevgep19701971.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1993.us = load float, float* %scevgep19911992.us, align 4, !alias.scope !149, !noalias !150
  %p_1994.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1817.us, float %_p_scalar_1993.us) #30
  store float %p_1994.us, float* %scevgep19911992.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2014.us = load float, float* %scevgep20122013.us, align 4, !alias.scope !149, !noalias !150
  %p_2015.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1838.us, float %_p_scalar_2014.us) #30
  store float %p_2015.us, float* %scevgep20122013.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2035.us = load float, float* %scevgep20332034.us, align 4, !alias.scope !149, !noalias !150
  %p_2036.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1859.us, float %_p_scalar_2035.us) #30
  store float %p_2036.us, float* %scevgep20332034.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2056.us = load float, float* %scevgep20542055.us, align 4, !alias.scope !149, !noalias !150
  %p_2057.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1880.us, float %_p_scalar_2056.us) #30
  store float %p_2057.us, float* %scevgep20542055.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2077.us = load float, float* %scevgep20752076.us, align 4, !alias.scope !149, !noalias !150
  %p_2078.us = call float @llvm.fmuladd.f32(float %_p_scalar_1920.us, float %_p_scalar_1901.us, float %_p_scalar_2077.us) #30
  store float %p_2078.us, float* %scevgep20752076.us, align 4, !alias.scope !149, !noalias !150
  br i1 %321, label %polly.stmt.for.body10.us.i2222.us, label %polly.merge1907.us

polly.stmt.for.body10.us.i2222.us:                ; preds = %polly.cond2079.us
  %polly.access.add.Packed_A2086.us = add nsw i64 %polly.indvar1735.us, %polly.access.mul.Packed_A2085.us
  %polly.access.mul.Packed_A2087.us = shl nsw i64 %polly.access.add.Packed_A2086.us, 2
  %polly.access.add.Packed_A2088.us = or i64 %polly.access.mul.Packed_A2087.us, 2
  %polly.access.Packed_A2089.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2088.us
  %_p_scalar_2090.us = load float, float* %polly.access.Packed_A2089.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_2100.us = load float, float* %scevgep20982099.us, align 4, !alias.scope !149, !noalias !150
  %p_2101.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1754.us, float %_p_scalar_2100.us) #30
  store float %p_2101.us, float* %scevgep20982099.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2120.us = load float, float* %scevgep21182119.us, align 4, !alias.scope !149, !noalias !150
  %p_2121.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1775.us, float %_p_scalar_2120.us) #30
  store float %p_2121.us, float* %scevgep21182119.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2140.us = load float, float* %scevgep21382139.us, align 4, !alias.scope !149, !noalias !150
  %p_2141.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1796.us, float %_p_scalar_2140.us) #30
  store float %p_2141.us, float* %scevgep21382139.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2160.us = load float, float* %scevgep21582159.us, align 4, !alias.scope !149, !noalias !150
  %p_2161.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1817.us, float %_p_scalar_2160.us) #30
  store float %p_2161.us, float* %scevgep21582159.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2180.us = load float, float* %scevgep21782179.us, align 4, !alias.scope !149, !noalias !150
  %p_2181.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1838.us, float %_p_scalar_2180.us) #30
  store float %p_2181.us, float* %scevgep21782179.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2200.us = load float, float* %scevgep21982199.us, align 4, !alias.scope !149, !noalias !150
  %p_2201.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1859.us, float %_p_scalar_2200.us) #30
  store float %p_2201.us, float* %scevgep21982199.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2220.us = load float, float* %scevgep22182219.us, align 4, !alias.scope !149, !noalias !150
  %p_2221.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1880.us, float %_p_scalar_2220.us) #30
  store float %p_2221.us, float* %scevgep22182219.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_2240.us = load float, float* %scevgep22382239.us, align 4, !alias.scope !149, !noalias !150
  %p_2241.us = call float @llvm.fmuladd.f32(float %_p_scalar_2090.us, float %_p_scalar_1901.us, float %_p_scalar_2240.us) #30
  store float %p_2241.us, float* %scevgep22382239.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge1907.us

polly.merge1907.us:                               ; preds = %polly.stmt.for.body10.us.i2222.us, %polly.cond2079.us, %polly.cond1906.us
  %polly.indvar_next1736.us = add nuw nsw i64 %polly.indvar1735.us, 1
  %exitcond4322.not = icmp eq i64 %polly.indvar1735.us, %smin4342
  br i1 %exitcond4322.not, label %polly.merge1274.us, label %polly.cond1906.us, !llvm.loop !151

polly.loop_if1282.us:                             ; preds = %polly.cond1278.us
  br i1 %polly.loop_guard665.us, label %polly.cond1434.preheader.us, label %polly.merge1274.us

polly.cond1434.us:                                ; preds = %polly.cond1434.preheader.us, %polly.merge1435.us
  %polly.indvar1287.us = phi i64 [ %polly.indvar_next1288.us, %polly.merge1435.us ], [ 0, %polly.cond1434.preheader.us ]
  %polly.access.add.Packed_A1292.us = shl i64 %polly.indvar1287.us, 2
  %polly.access.mul.Packed_A1293.us = add nuw nsw i64 %polly.access.add.Packed_A1292.us, 2048
  %polly.access.Packed_A1295.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A1293.us
  %_p_scalar_1296.us = load float, float* %polly.access.Packed_A1295.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.add.Packed_B1299.us = add nuw nsw i64 %polly.indvar1287.us, %polly.access.mul.Packed_B1298.us
  %polly.access.mul.Packed_B1300.us = shl nsw i64 %polly.access.add.Packed_B1299.us, 3
  %polly.access.Packed_B1302.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B1300.us
  %_p_scalar_1303.us = load float, float* %polly.access.Packed_B1302.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_1306.us = load float, float* %scevgep13041305.us, align 4, !alias.scope !149, !noalias !150
  %p_1307.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1303.us, float %_p_scalar_1306.us) #30
  store float %p_1307.us, float* %scevgep13041305.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1319.us = or i64 %polly.access.mul.Packed_B1300.us, 1
  %polly.access.Packed_B1320.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1319.us
  %_p_scalar_1321.us = load float, float* %polly.access.Packed_B1320.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1324.us = load float, float* %scevgep13221323.us, align 4, !alias.scope !149, !noalias !150
  %p_1325.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1321.us, float %_p_scalar_1324.us) #30
  store float %p_1325.us, float* %scevgep13221323.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1337.us = or i64 %polly.access.mul.Packed_B1300.us, 2
  %polly.access.Packed_B1338.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1337.us
  %_p_scalar_1339.us = load float, float* %polly.access.Packed_B1338.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_1342.us = load float, float* %scevgep13401341.us, align 4, !alias.scope !149, !noalias !150
  %p_1343.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1339.us, float %_p_scalar_1342.us) #30
  store float %p_1343.us, float* %scevgep13401341.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1355.us = or i64 %polly.access.mul.Packed_B1300.us, 3
  %polly.access.Packed_B1356.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1355.us
  %_p_scalar_1357.us = load float, float* %polly.access.Packed_B1356.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1360.us = load float, float* %scevgep13581359.us, align 4, !alias.scope !149, !noalias !150
  %p_1361.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1357.us, float %_p_scalar_1360.us) #30
  store float %p_1361.us, float* %scevgep13581359.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1373.us = or i64 %polly.access.mul.Packed_B1300.us, 4
  %polly.access.Packed_B1374.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1373.us
  %_p_scalar_1375.us = load float, float* %polly.access.Packed_B1374.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_1378.us = load float, float* %scevgep13761377.us, align 4, !alias.scope !149, !noalias !150
  %p_1379.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1375.us, float %_p_scalar_1378.us) #30
  store float %p_1379.us, float* %scevgep13761377.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1391.us = or i64 %polly.access.mul.Packed_B1300.us, 5
  %polly.access.Packed_B1392.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1391.us
  %_p_scalar_1393.us = load float, float* %polly.access.Packed_B1392.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1396.us = load float, float* %scevgep13941395.us, align 4, !alias.scope !149, !noalias !150
  %p_1397.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1393.us, float %_p_scalar_1396.us) #30
  store float %p_1397.us, float* %scevgep13941395.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1409.us = or i64 %polly.access.mul.Packed_B1300.us, 6
  %polly.access.Packed_B1410.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1409.us
  %_p_scalar_1411.us = load float, float* %polly.access.Packed_B1410.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_1414.us = load float, float* %scevgep14121413.us, align 4, !alias.scope !149, !noalias !150
  %p_1415.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1411.us, float %_p_scalar_1414.us) #30
  store float %p_1415.us, float* %scevgep14121413.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B1427.us = or i64 %polly.access.mul.Packed_B1300.us, 7
  %polly.access.Packed_B1428.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1427.us
  %_p_scalar_1429.us = load float, float* %polly.access.Packed_B1428.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_1432.us = load float, float* %scevgep14301431.us, align 4, !alias.scope !149, !noalias !150
  %p_1433.us = call float @llvm.fmuladd.f32(float %_p_scalar_1296.us, float %_p_scalar_1429.us, float %_p_scalar_1432.us) #30
  store float %p_1433.us, float* %scevgep14301431.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4229.us, label %polly.merge1435.us, label %polly.cond1582.us

polly.cond1582.us:                                ; preds = %polly.cond1434.us
  %polly.access.add.Packed_A1442.us = add nuw nsw i64 %polly.access.add.Packed_A1292.us, 2049
  %polly.access.Packed_A1443.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1442.us
  %_p_scalar_1444.us = load float, float* %polly.access.Packed_A1443.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_1454.us = load float, float* %scevgep14521453.us, align 4, !alias.scope !149, !noalias !150
  %p_1455.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1303.us, float %_p_scalar_1454.us) #30
  store float %p_1455.us, float* %scevgep14521453.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1472.us = load float, float* %scevgep14701471.us, align 4, !alias.scope !149, !noalias !150
  %p_1473.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1321.us, float %_p_scalar_1472.us) #30
  store float %p_1473.us, float* %scevgep14701471.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1490.us = load float, float* %scevgep14881489.us, align 4, !alias.scope !149, !noalias !150
  %p_1491.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1339.us, float %_p_scalar_1490.us) #30
  store float %p_1491.us, float* %scevgep14881489.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1508.us = load float, float* %scevgep15061507.us, align 4, !alias.scope !149, !noalias !150
  %p_1509.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1357.us, float %_p_scalar_1508.us) #30
  store float %p_1509.us, float* %scevgep15061507.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1526.us = load float, float* %scevgep15241525.us, align 4, !alias.scope !149, !noalias !150
  %p_1527.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1375.us, float %_p_scalar_1526.us) #30
  store float %p_1527.us, float* %scevgep15241525.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1544.us = load float, float* %scevgep15421543.us, align 4, !alias.scope !149, !noalias !150
  %p_1545.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1393.us, float %_p_scalar_1544.us) #30
  store float %p_1545.us, float* %scevgep15421543.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1562.us = load float, float* %scevgep15601561.us, align 4, !alias.scope !149, !noalias !150
  %p_1563.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1411.us, float %_p_scalar_1562.us) #30
  store float %p_1563.us, float* %scevgep15601561.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1580.us = load float, float* %scevgep15781579.us, align 4, !alias.scope !149, !noalias !150
  %p_1581.us = call float @llvm.fmuladd.f32(float %_p_scalar_1444.us, float %_p_scalar_1429.us, float %_p_scalar_1580.us) #30
  store float %p_1581.us, float* %scevgep15781579.us, align 4, !alias.scope !149, !noalias !150
  br i1 %544, label %polly.stmt.for.body10.us.i1712.us, label %polly.merge1435.us

polly.stmt.for.body10.us.i1712.us:                ; preds = %polly.cond1582.us
  %polly.access.add.Packed_A1590.us = add nuw nsw i64 %polly.access.add.Packed_A1292.us, 2050
  %polly.access.Packed_A1591.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1590.us
  %_p_scalar_1592.us = load float, float* %polly.access.Packed_A1591.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_1602.us = load float, float* %scevgep16001601.us, align 4, !alias.scope !149, !noalias !150
  %p_1603.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1303.us, float %_p_scalar_1602.us) #30
  store float %p_1603.us, float* %scevgep16001601.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1620.us = load float, float* %scevgep16181619.us, align 4, !alias.scope !149, !noalias !150
  %p_1621.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1321.us, float %_p_scalar_1620.us) #30
  store float %p_1621.us, float* %scevgep16181619.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1638.us = load float, float* %scevgep16361637.us, align 4, !alias.scope !149, !noalias !150
  %p_1639.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1339.us, float %_p_scalar_1638.us) #30
  store float %p_1639.us, float* %scevgep16361637.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1656.us = load float, float* %scevgep16541655.us, align 4, !alias.scope !149, !noalias !150
  %p_1657.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1357.us, float %_p_scalar_1656.us) #30
  store float %p_1657.us, float* %scevgep16541655.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1674.us = load float, float* %scevgep16721673.us, align 4, !alias.scope !149, !noalias !150
  %p_1675.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1375.us, float %_p_scalar_1674.us) #30
  store float %p_1675.us, float* %scevgep16721673.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1692.us = load float, float* %scevgep16901691.us, align 4, !alias.scope !149, !noalias !150
  %p_1693.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1393.us, float %_p_scalar_1692.us) #30
  store float %p_1693.us, float* %scevgep16901691.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1710.us = load float, float* %scevgep17081709.us, align 4, !alias.scope !149, !noalias !150
  %p_1711.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1411.us, float %_p_scalar_1710.us) #30
  store float %p_1711.us, float* %scevgep17081709.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1728.us = load float, float* %scevgep17261727.us, align 4, !alias.scope !149, !noalias !150
  %p_1729.us = call float @llvm.fmuladd.f32(float %_p_scalar_1592.us, float %_p_scalar_1429.us, float %_p_scalar_1728.us) #30
  store float %p_1729.us, float* %scevgep17261727.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge1435.us

polly.merge1435.us:                               ; preds = %polly.stmt.for.body10.us.i1712.us, %polly.cond1582.us, %polly.cond1434.us
  %polly.indvar_next1288.us = add nuw nsw i64 %polly.indvar1287.us, 1
  %exitcond4324.not = icmp eq i64 %polly.indvar1287.us, %smin4342
  br i1 %exitcond4324.not, label %polly.merge1274.us, label %polly.cond1434.us, !llvm.loop !152

polly.merge1274.us:                               ; preds = %polly.merge1907.us, %polly.merge1435.us, %polly.loop_if1282.us, %polly.loop_if1730.us, %polly.cond1273.us
  %polly.indvar_next650.us = add nuw nsw i64 %polly.indvar649.us, 1
  %exitcond4329.not = icmp eq i64 %polly.indvar_next650.us, %352
  br i1 %exitcond4329.not, label %polly.cond2242.us, label %polly.loop_if653.us

polly.cond2242.us:                                ; preds = %polly.merge1274.us, %polly.cond639.us
  %431 = or i64 %412, 3
  %432 = icmp sge i64 %431, %218
  %433 = or i1 %358, %432
  %434 = or i1 %360, %433
  br i1 %434, label %polly.cond2247.us, label %polly.merge2243.us

polly.cond2247.us:                                ; preds = %polly.cond2242.us
  br i1 %358, label %polly.loop_if2252.us, label %polly.cond2880.us

polly.cond2880.us:                                ; preds = %polly.cond2247.us
  br i1 %432, label %polly.loop_if2885.us, label %polly.loop_if3426.us

polly.loop_if3426.us:                             ; preds = %polly.cond2880.us
  %435 = mul nsw i64 %polly.indvar613.us, -24
  %436 = add nsw i64 %435, %pexp.p_div_q17414227
  %437 = call i64 @llvm.smin.i64(i64 %436, i64 23)
  %polly.loop_guard3430.us = icmp slt i64 %437, 0
  %brmerge4385 = select i1 %polly.loop_guard3430.us, i1 true, i1 %polly.loop_guard665.us.not4384
  br i1 %brmerge4385, label %polly.merge2243.us, label %polly.loop_if3434.us.us

polly.loop_if2885.us:                             ; preds = %polly.cond2880.us
  br i1 %polly.loop_guard2889, label %polly.loop_if2893.preheader.us, label %polly.merge2243.us

polly.loop_if2252.us:                             ; preds = %polly.cond2247.us
  %438 = mul nsw i64 %polly.indvar613.us, -24
  %439 = add nsw i64 %438, %pexp.p_div_q17414227
  %440 = call i64 @llvm.smin.i64(i64 %439, i64 23)
  %polly.loop_guard2256.us = icmp slt i64 %440, 0
  %brmerge4383 = select i1 %polly.loop_guard2256.us, i1 true, i1 %polly.loop_guard665.us.not
  br i1 %brmerge4383, label %polly.merge2243.us, label %polly.loop_if2260.us.us

polly.merge2243.us:                               ; preds = %polly.loop_exit3437.loopexit.us.us, %polly.loop_exit2896.loopexit.us.us, %polly.loop_exit2263.loopexit.us.us, %polly.loop_if3426.us, %polly.loop_if2252.us, %polly.loop_if2893.preheader.us, %polly.loop_if2885.us, %polly.cond2242.us
  %polly.indvar_next614.us = add nuw nsw i64 %polly.indvar613.us, 1
  %indvars.iv.next4310 = add nuw i64 %indvars.iv4309, 96
  %indvars.iv.next4318 = add nsw i64 %indvars.iv4317, -24
  %indvars.iv.next4333 = add nsw i64 %indvars.iv4332, -24
  %exitcond4346.not = icmp eq i64 %polly.indvar613.us, %pexp.fdiv_q.4
  br i1 %exitcond4346.not, label %polly.loop_exit611.loopexit.us, label %polly.loop_if616.us

polly.cond1434.preheader.us:                      ; preds = %polly.loop_if1282.us
  %441 = shl nsw i64 %polly.indvar649.us, 3
  %442 = add nuw nsw i64 %441, %353
  %polly.access.mul.Packed_B1298.us = shl nsw i64 %polly.indvar649.us, 9
  %443 = shl i64 %442, 2
  %444 = add i64 %443, %541
  %scevgep1304.us = getelementptr i8, i8* %call.i2.i, i64 %444
  %scevgep13041305.us = bitcast i8* %scevgep1304.us to float*
  %445 = or i64 %443, 4
  %446 = add i64 %445, %541
  %scevgep1322.us = getelementptr i8, i8* %call.i2.i, i64 %446
  %scevgep13221323.us = bitcast i8* %scevgep1322.us to float*
  %447 = or i64 %443, 8
  %448 = add i64 %447, %541
  %scevgep1340.us = getelementptr i8, i8* %call.i2.i, i64 %448
  %scevgep13401341.us = bitcast i8* %scevgep1340.us to float*
  %449 = or i64 %443, 12
  %450 = add i64 %449, %541
  %scevgep1358.us = getelementptr i8, i8* %call.i2.i, i64 %450
  %scevgep13581359.us = bitcast i8* %scevgep1358.us to float*
  %451 = or i64 %443, 16
  %452 = add i64 %451, %541
  %scevgep1376.us = getelementptr i8, i8* %call.i2.i, i64 %452
  %scevgep13761377.us = bitcast i8* %scevgep1376.us to float*
  %453 = or i64 %443, 20
  %454 = add i64 %453, %541
  %scevgep1394.us = getelementptr i8, i8* %call.i2.i, i64 %454
  %scevgep13941395.us = bitcast i8* %scevgep1394.us to float*
  %455 = or i64 %443, 24
  %456 = add i64 %455, %541
  %scevgep1412.us = getelementptr i8, i8* %call.i2.i, i64 %456
  %scevgep14121413.us = bitcast i8* %scevgep1412.us to float*
  %457 = or i64 %443, 28
  %458 = add i64 %457, %541
  %scevgep1430.us = getelementptr i8, i8* %call.i2.i, i64 %458
  %scevgep14301431.us = bitcast i8* %scevgep1430.us to float*
  %459 = add i64 %443, %543
  %scevgep1452.us = getelementptr i8, i8* %call.i2.i, i64 %459
  %scevgep14521453.us = bitcast i8* %scevgep1452.us to float*
  %460 = add i64 %445, %543
  %scevgep1470.us = getelementptr i8, i8* %call.i2.i, i64 %460
  %scevgep14701471.us = bitcast i8* %scevgep1470.us to float*
  %461 = add i64 %447, %543
  %scevgep1488.us = getelementptr i8, i8* %call.i2.i, i64 %461
  %scevgep14881489.us = bitcast i8* %scevgep1488.us to float*
  %462 = add i64 %449, %543
  %scevgep1506.us = getelementptr i8, i8* %call.i2.i, i64 %462
  %scevgep15061507.us = bitcast i8* %scevgep1506.us to float*
  %463 = add i64 %451, %543
  %scevgep1524.us = getelementptr i8, i8* %call.i2.i, i64 %463
  %scevgep15241525.us = bitcast i8* %scevgep1524.us to float*
  %464 = add i64 %453, %543
  %scevgep1542.us = getelementptr i8, i8* %call.i2.i, i64 %464
  %scevgep15421543.us = bitcast i8* %scevgep1542.us to float*
  %465 = add i64 %455, %543
  %scevgep1560.us = getelementptr i8, i8* %call.i2.i, i64 %465
  %scevgep15601561.us = bitcast i8* %scevgep1560.us to float*
  %466 = add i64 %457, %543
  %scevgep1578.us = getelementptr i8, i8* %call.i2.i, i64 %466
  %scevgep15781579.us = bitcast i8* %scevgep1578.us to float*
  %467 = add i64 %443, %323
  %scevgep1600.us = getelementptr i8, i8* %call.i2.i, i64 %467
  %scevgep16001601.us = bitcast i8* %scevgep1600.us to float*
  %468 = add i64 %445, %323
  %scevgep1618.us = getelementptr i8, i8* %call.i2.i, i64 %468
  %scevgep16181619.us = bitcast i8* %scevgep1618.us to float*
  %469 = add i64 %447, %323
  %scevgep1636.us = getelementptr i8, i8* %call.i2.i, i64 %469
  %scevgep16361637.us = bitcast i8* %scevgep1636.us to float*
  %470 = add i64 %449, %323
  %scevgep1654.us = getelementptr i8, i8* %call.i2.i, i64 %470
  %scevgep16541655.us = bitcast i8* %scevgep1654.us to float*
  %471 = add i64 %451, %323
  %scevgep1672.us = getelementptr i8, i8* %call.i2.i, i64 %471
  %scevgep16721673.us = bitcast i8* %scevgep1672.us to float*
  %472 = add i64 %453, %323
  %scevgep1690.us = getelementptr i8, i8* %call.i2.i, i64 %472
  %scevgep16901691.us = bitcast i8* %scevgep1690.us to float*
  %473 = add i64 %455, %323
  %scevgep1708.us = getelementptr i8, i8* %call.i2.i, i64 %473
  %scevgep17081709.us = bitcast i8* %scevgep1708.us to float*
  %474 = add i64 %457, %323
  %scevgep1726.us = getelementptr i8, i8* %call.i2.i, i64 %474
  %scevgep17261727.us = bitcast i8* %scevgep1726.us to float*
  br label %polly.cond1434.us

polly.cond1906.preheader.us:                      ; preds = %polly.loop_if1730.us
  %475 = shl nsw i64 %polly.indvar649.us, 3
  %476 = add nuw nsw i64 %475, %353
  %polly.access.mul.Packed_B1749.us = shl nsw i64 %polly.indvar649.us, 9
  %477 = shl i64 %476, 2
  %478 = add i64 %477, %316
  %scevgep1755.us = getelementptr i8, i8* %call.i2.i, i64 %478
  %scevgep17551756.us = bitcast i8* %scevgep1755.us to float*
  %479 = or i64 %477, 4
  %480 = add i64 %479, %316
  %scevgep1776.us = getelementptr i8, i8* %call.i2.i, i64 %480
  %scevgep17761777.us = bitcast i8* %scevgep1776.us to float*
  %481 = or i64 %477, 8
  %482 = add i64 %481, %316
  %scevgep1797.us = getelementptr i8, i8* %call.i2.i, i64 %482
  %scevgep17971798.us = bitcast i8* %scevgep1797.us to float*
  %483 = or i64 %477, 12
  %484 = add i64 %483, %316
  %scevgep1818.us = getelementptr i8, i8* %call.i2.i, i64 %484
  %scevgep18181819.us = bitcast i8* %scevgep1818.us to float*
  %485 = or i64 %477, 16
  %486 = add i64 %485, %316
  %scevgep1839.us = getelementptr i8, i8* %call.i2.i, i64 %486
  %scevgep18391840.us = bitcast i8* %scevgep1839.us to float*
  %487 = or i64 %477, 20
  %488 = add i64 %487, %316
  %scevgep1860.us = getelementptr i8, i8* %call.i2.i, i64 %488
  %scevgep18601861.us = bitcast i8* %scevgep1860.us to float*
  %489 = or i64 %477, 24
  %490 = add i64 %489, %316
  %scevgep1881.us = getelementptr i8, i8* %call.i2.i, i64 %490
  %scevgep18811882.us = bitcast i8* %scevgep1881.us to float*
  %491 = or i64 %477, 28
  %492 = add i64 %491, %316
  %scevgep1902.us = getelementptr i8, i8* %call.i2.i, i64 %492
  %scevgep19021903.us = bitcast i8* %scevgep1902.us to float*
  %493 = add i64 %477, %318
  %scevgep1928.us = getelementptr i8, i8* %call.i2.i, i64 %493
  %scevgep19281929.us = bitcast i8* %scevgep1928.us to float*
  %494 = add i64 %479, %318
  %scevgep1949.us = getelementptr i8, i8* %call.i2.i, i64 %494
  %scevgep19491950.us = bitcast i8* %scevgep1949.us to float*
  %495 = add i64 %481, %318
  %scevgep1970.us = getelementptr i8, i8* %call.i2.i, i64 %495
  %scevgep19701971.us = bitcast i8* %scevgep1970.us to float*
  %496 = add i64 %483, %318
  %scevgep1991.us = getelementptr i8, i8* %call.i2.i, i64 %496
  %scevgep19911992.us = bitcast i8* %scevgep1991.us to float*
  %497 = add i64 %485, %318
  %scevgep2012.us = getelementptr i8, i8* %call.i2.i, i64 %497
  %scevgep20122013.us = bitcast i8* %scevgep2012.us to float*
  %498 = add i64 %487, %318
  %scevgep2033.us = getelementptr i8, i8* %call.i2.i, i64 %498
  %scevgep20332034.us = bitcast i8* %scevgep2033.us to float*
  %499 = add i64 %489, %318
  %scevgep2054.us = getelementptr i8, i8* %call.i2.i, i64 %499
  %scevgep20542055.us = bitcast i8* %scevgep2054.us to float*
  %500 = add i64 %491, %318
  %scevgep2075.us = getelementptr i8, i8* %call.i2.i, i64 %500
  %scevgep20752076.us = bitcast i8* %scevgep2075.us to float*
  %501 = add i64 %477, %323
  %scevgep2098.us = getelementptr i8, i8* %call.i2.i, i64 %501
  %scevgep20982099.us = bitcast i8* %scevgep2098.us to float*
  %502 = add i64 %479, %323
  %scevgep2118.us = getelementptr i8, i8* %call.i2.i, i64 %502
  %scevgep21182119.us = bitcast i8* %scevgep2118.us to float*
  %503 = add i64 %481, %323
  %scevgep2138.us = getelementptr i8, i8* %call.i2.i, i64 %503
  %scevgep21382139.us = bitcast i8* %scevgep2138.us to float*
  %504 = add i64 %483, %323
  %scevgep2158.us = getelementptr i8, i8* %call.i2.i, i64 %504
  %scevgep21582159.us = bitcast i8* %scevgep2158.us to float*
  %505 = add i64 %485, %323
  %scevgep2178.us = getelementptr i8, i8* %call.i2.i, i64 %505
  %scevgep21782179.us = bitcast i8* %scevgep2178.us to float*
  %506 = add i64 %487, %323
  %scevgep2198.us = getelementptr i8, i8* %call.i2.i, i64 %506
  %scevgep21982199.us = bitcast i8* %scevgep2198.us to float*
  %507 = add i64 %489, %323
  %scevgep2218.us = getelementptr i8, i8* %call.i2.i, i64 %507
  %scevgep22182219.us = bitcast i8* %scevgep2218.us to float*
  %508 = add i64 %491, %323
  %scevgep2238.us = getelementptr i8, i8* %call.i2.i, i64 %508
  %scevgep22382239.us = bitcast i8* %scevgep2238.us to float*
  br label %polly.cond1906.us

polly.loop_if661.preheader.us:                    ; preds = %polly.loop_if653.us
  %509 = shl nsw i64 %polly.indvar649.us, 3
  %510 = add nuw nsw i64 %509, %353
  %polly.access.mul.Packed_B676.us = shl nsw i64 %polly.indvar649.us, 9
  %511 = shl i64 %510, 2
  %512 = or i64 %511, 4
  %513 = or i64 %511, 8
  %514 = or i64 %511, 12
  %515 = or i64 %511, 16
  %516 = or i64 %511, 20
  %517 = or i64 %511, 24
  %518 = or i64 %511, 28
  br i1 %polly.loop_guard665.us, label %polly.loop_if661.us.us, label %polly.cond1273.us

polly.loop_exit627.loopexit.us:                   ; preds = %polly.loop_header625.us, %middle.block4546
  %polly.indvar_next622.us4260 = add nuw i64 %polly.indvar621.us4242, 1
  %exitcond4312.not = icmp eq i64 %polly.indvar621.us4242, %smin4311
  br i1 %exitcond4312.not, label %polly.cond639.us, label %polly.loop_if624.us4241

polly.loop_if2893.preheader.us:                   ; preds = %polly.loop_if2885.us
  %519 = mul i64 %412, %311
  %520 = or i64 %412, 2
  %.not4185.us = icmp slt i64 %218, %520
  %521 = or i64 %519, 4
  %522 = or i64 %412, 1
  %523 = mul i64 %522, %311
  %524 = add i64 %523, 4
  %525 = icmp eq i64 %431, %218
  br i1 %polly.loop_guard665.us, label %polly.loop_if2893.us.us, label %polly.merge2243.us

polly.loop_if653.preheader.us:                    ; preds = %polly.cond639.us
  %526 = mul nsw i64 %polly.indvar613.us, -24
  %527 = add nsw i64 %526, %pexp.p_div_q6524226
  %polly.loop_guard657.us = icmp sgt i64 %527, 0
  %528 = or i64 %412, 5
  %529 = icmp sge i64 %218, %528
  %530 = or i64 %412, 7
  %531 = icmp sge i64 %530, %218
  %532 = and i1 %529, %531
  %533 = or i64 %412, 8
  %534 = icmp sge i64 %218, %533
  %535 = icmp sge i64 %413, %218
  %536 = and i1 %534, %535
  %537 = and i1 %313, %536
  %538 = or i1 %532, %537
  %539 = add nsw i64 %526, %pexp.p_div_q17414227
  %polly.access.mul.Packed_A1742.us = shl nsw i64 %539, 9
  %540 = add nsw i64 %526, %pexp.div
  %polly.access.mul.Packed_A2085.us = shl nsw i64 %540, 9
  %541 = mul i64 %430, %311
  %542 = or i64 %412, 6
  %.not4229.us = icmp slt i64 %218, %542
  %543 = mul i64 %528, %311
  %544 = icmp eq i64 %530, %218
  br label %polly.loop_if653.us

polly.loop_if624.preheader.us:                    ; preds = %polly.loop_if616.us
  %545 = mul i64 %polly.indvar613.us, 36028797018963944
  %546 = sub i64 %545, %polly.indvar583.us
  br i1 %polly.loop_guard590.not.us, label %polly.cond639.us, label %polly.loop_if624.us4241

polly.loop_exit597.loopexit.us:                   ; preds = %polly.loop_header595.us, %middle.block4559
  %polly.indvar_next592.us4266 = add nuw i64 %polly.indvar591.us4240, 1
  %exitcond4306.not = icmp eq i64 %polly.indvar591.us4240, %smin4307
  br i1 %exitcond4306.not, label %polly.loop_if608.us, label %polly.loop_if594.us4239

polly.loop_exit611.loopexit.us:                   ; preds = %polly.merge2243.us
  %polly.indvar_next584.us = add nuw nsw i64 %polly.indvar583.us, 1
  %indvars.iv.next4304 = add nuw i64 %indvars.iv4303, 512
  %indvars.iv.next4314 = add i64 %indvars.iv4313, -512
  %exitcond4347.not = icmp eq i64 %polly.indvar583.us, %pexp.p_div_q4158
  br i1 %exitcond4347.not, label %polly.loop_exit582, label %polly.loop_if586.us

polly.loop_if594.preheader.us:                    ; preds = %polly.loop_if586.us
  %547 = sub nsw i64 %356, %polly.indvar583.us
  br i1 %polly.loop_guard598.not.fr, label %polly.loop_if608.us, label %polly.loop_if594.us4239

polly.loop_if661.us.us:                           ; preds = %polly.loop_if661.preheader.us, %polly.loop_exit664.loopexit.us.us
  %polly.indvar658.us.us = phi i64 [ %polly.indvar_next659.us.us, %polly.loop_exit664.loopexit.us.us ], [ 0, %polly.loop_if661.preheader.us ]
  %548 = shl nsw i64 %polly.indvar658.us.us, 2
  %549 = add nuw nsw i64 %548, %412
  %polly.access.mul.Packed_A670.us.us = shl nsw i64 %polly.indvar658.us.us, 9
  %550 = mul i64 %549, %311
  %551 = add i64 %550, %511
  %scevgep.us.us = getelementptr i8, i8* %call.i2.i, i64 %551
  %scevgep682.us.us = bitcast i8* %scevgep.us.us to float*
  %552 = add i64 %550, %512
  %scevgep699.us.us = getelementptr i8, i8* %call.i2.i, i64 %552
  %scevgep699700.us.us = bitcast i8* %scevgep699.us.us to float*
  %553 = add i64 %550, %513
  %scevgep718.us.us = getelementptr i8, i8* %call.i2.i, i64 %553
  %scevgep718719.us.us = bitcast i8* %scevgep718.us.us to float*
  %554 = add i64 %550, %514
  %scevgep737.us.us = getelementptr i8, i8* %call.i2.i, i64 %554
  %scevgep737738.us.us = bitcast i8* %scevgep737.us.us to float*
  %555 = add i64 %550, %515
  %scevgep756.us.us = getelementptr i8, i8* %call.i2.i, i64 %555
  %scevgep756757.us.us = bitcast i8* %scevgep756.us.us to float*
  %556 = add i64 %550, %516
  %scevgep775.us.us = getelementptr i8, i8* %call.i2.i, i64 %556
  %scevgep775776.us.us = bitcast i8* %scevgep775.us.us to float*
  %557 = add i64 %550, %517
  %scevgep794.us.us = getelementptr i8, i8* %call.i2.i, i64 %557
  %scevgep794795.us.us = bitcast i8* %scevgep794.us.us to float*
  %558 = add i64 %550, %518
  %scevgep813.us.us = getelementptr i8, i8* %call.i2.i, i64 %558
  %scevgep813814.us.us = bitcast i8* %scevgep813.us.us to float*
  %559 = or i64 %549, 1
  %560 = mul i64 %559, %311
  %561 = add i64 %560, %511
  %scevgep832.us.us = getelementptr i8, i8* %call.i2.i, i64 %561
  %scevgep832833.us.us = bitcast i8* %scevgep832.us.us to float*
  %562 = add i64 %560, %512
  %scevgep851.us.us = getelementptr i8, i8* %call.i2.i, i64 %562
  %scevgep851852.us.us = bitcast i8* %scevgep851.us.us to float*
  %563 = add i64 %560, %513
  %scevgep870.us.us = getelementptr i8, i8* %call.i2.i, i64 %563
  %scevgep870871.us.us = bitcast i8* %scevgep870.us.us to float*
  %564 = add i64 %560, %514
  %scevgep889.us.us = getelementptr i8, i8* %call.i2.i, i64 %564
  %scevgep889890.us.us = bitcast i8* %scevgep889.us.us to float*
  %565 = add i64 %560, %515
  %scevgep908.us.us = getelementptr i8, i8* %call.i2.i, i64 %565
  %scevgep908909.us.us = bitcast i8* %scevgep908.us.us to float*
  %566 = add i64 %560, %516
  %scevgep927.us.us = getelementptr i8, i8* %call.i2.i, i64 %566
  %scevgep927928.us.us = bitcast i8* %scevgep927.us.us to float*
  %567 = add i64 %560, %517
  %scevgep946.us.us = getelementptr i8, i8* %call.i2.i, i64 %567
  %scevgep946947.us.us = bitcast i8* %scevgep946.us.us to float*
  %568 = add i64 %560, %518
  %scevgep965.us.us = getelementptr i8, i8* %call.i2.i, i64 %568
  %scevgep965966.us.us = bitcast i8* %scevgep965.us.us to float*
  %569 = or i64 %549, 2
  %570 = mul i64 %569, %311
  %571 = add i64 %570, %511
  %scevgep984.us.us = getelementptr i8, i8* %call.i2.i, i64 %571
  %scevgep984985.us.us = bitcast i8* %scevgep984.us.us to float*
  %572 = add i64 %570, %512
  %scevgep1003.us.us = getelementptr i8, i8* %call.i2.i, i64 %572
  %scevgep10031004.us.us = bitcast i8* %scevgep1003.us.us to float*
  %573 = add i64 %570, %513
  %scevgep1022.us.us = getelementptr i8, i8* %call.i2.i, i64 %573
  %scevgep10221023.us.us = bitcast i8* %scevgep1022.us.us to float*
  %574 = add i64 %570, %514
  %scevgep1041.us.us = getelementptr i8, i8* %call.i2.i, i64 %574
  %scevgep10411042.us.us = bitcast i8* %scevgep1041.us.us to float*
  %575 = add i64 %570, %515
  %scevgep1060.us.us = getelementptr i8, i8* %call.i2.i, i64 %575
  %scevgep10601061.us.us = bitcast i8* %scevgep1060.us.us to float*
  %576 = add i64 %570, %516
  %scevgep1079.us.us = getelementptr i8, i8* %call.i2.i, i64 %576
  %scevgep10791080.us.us = bitcast i8* %scevgep1079.us.us to float*
  %577 = add i64 %570, %517
  %scevgep1098.us.us = getelementptr i8, i8* %call.i2.i, i64 %577
  %scevgep10981099.us.us = bitcast i8* %scevgep1098.us.us to float*
  %578 = add i64 %570, %518
  %scevgep1117.us.us = getelementptr i8, i8* %call.i2.i, i64 %578
  %scevgep11171118.us.us = bitcast i8* %scevgep1117.us.us to float*
  %579 = or i64 %549, 3
  %580 = mul i64 %579, %311
  %581 = add i64 %580, %511
  %scevgep1136.us.us = getelementptr i8, i8* %call.i2.i, i64 %581
  %scevgep11361137.us.us = bitcast i8* %scevgep1136.us.us to float*
  %582 = add i64 %580, %512
  %scevgep1155.us.us = getelementptr i8, i8* %call.i2.i, i64 %582
  %scevgep11551156.us.us = bitcast i8* %scevgep1155.us.us to float*
  %583 = add i64 %580, %513
  %scevgep1174.us.us = getelementptr i8, i8* %call.i2.i, i64 %583
  %scevgep11741175.us.us = bitcast i8* %scevgep1174.us.us to float*
  %584 = add i64 %580, %514
  %scevgep1193.us.us = getelementptr i8, i8* %call.i2.i, i64 %584
  %scevgep11931194.us.us = bitcast i8* %scevgep1193.us.us to float*
  %585 = add i64 %580, %515
  %scevgep1212.us.us = getelementptr i8, i8* %call.i2.i, i64 %585
  %scevgep12121213.us.us = bitcast i8* %scevgep1212.us.us to float*
  %586 = add i64 %580, %516
  %scevgep1231.us.us = getelementptr i8, i8* %call.i2.i, i64 %586
  %scevgep12311232.us.us = bitcast i8* %scevgep1231.us.us to float*
  %587 = add i64 %580, %517
  %scevgep1250.us.us = getelementptr i8, i8* %call.i2.i, i64 %587
  %scevgep12501251.us.us = bitcast i8* %scevgep1250.us.us to float*
  %588 = add i64 %580, %518
  %scevgep1269.us.us = getelementptr i8, i8* %call.i2.i, i64 %588
  %scevgep12691270.us.us = bitcast i8* %scevgep1269.us.us to float*
  br label %polly.stmt.for.body10.us.i1254.us.us

polly.stmt.for.body10.us.i1254.us.us:             ; preds = %polly.stmt.for.body10.us.i1254.us.us, %polly.loop_if661.us.us
  %polly.indvar666.us.us = phi i64 [ %polly.indvar_next667.us.us, %polly.stmt.for.body10.us.i1254.us.us ], [ 0, %polly.loop_if661.us.us ]
  %polly.access.add.Packed_A671.us.us = add nuw nsw i64 %polly.indvar666.us.us, %polly.access.mul.Packed_A670.us.us
  %polly.access.mul.Packed_A672.us.us = shl nsw i64 %polly.access.add.Packed_A671.us.us, 2
  %polly.access.Packed_A674.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A672.us.us
  %_p_scalar_.us.us = load float, float* %polly.access.Packed_A674.us.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.add.Packed_B677.us.us = add nuw nsw i64 %polly.indvar666.us.us, %polly.access.mul.Packed_B676.us
  %polly.access.mul.Packed_B678.us.us = shl nsw i64 %polly.access.add.Packed_B677.us.us, 3
  %polly.access.Packed_B680.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B678.us.us
  %_p_scalar_681.us.us = load float, float* %polly.access.Packed_B680.us.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_683.us.us = load float, float* %scevgep682.us.us, align 4, !alias.scope !149, !noalias !150
  %p_.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_681.us.us, float %_p_scalar_683.us.us) #30
  store float %p_.us.us, float* %scevgep682.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B696.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 1
  %polly.access.Packed_B697.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B696.us.us
  %_p_scalar_698.us.us = load float, float* %polly.access.Packed_B697.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_701.us.us = load float, float* %scevgep699700.us.us, align 4, !alias.scope !149, !noalias !150
  %p_702.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_698.us.us, float %_p_scalar_701.us.us) #30
  store float %p_702.us.us, float* %scevgep699700.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B715.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 2
  %polly.access.Packed_B716.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B715.us.us
  %_p_scalar_717.us.us = load float, float* %polly.access.Packed_B716.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_720.us.us = load float, float* %scevgep718719.us.us, align 4, !alias.scope !149, !noalias !150
  %p_721.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_717.us.us, float %_p_scalar_720.us.us) #30
  store float %p_721.us.us, float* %scevgep718719.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B734.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 3
  %polly.access.Packed_B735.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B734.us.us
  %_p_scalar_736.us.us = load float, float* %polly.access.Packed_B735.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_739.us.us = load float, float* %scevgep737738.us.us, align 4, !alias.scope !149, !noalias !150
  %p_740.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_736.us.us, float %_p_scalar_739.us.us) #30
  store float %p_740.us.us, float* %scevgep737738.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B753.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 4
  %polly.access.Packed_B754.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B753.us.us
  %_p_scalar_755.us.us = load float, float* %polly.access.Packed_B754.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_758.us.us = load float, float* %scevgep756757.us.us, align 4, !alias.scope !149, !noalias !150
  %p_759.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_755.us.us, float %_p_scalar_758.us.us) #30
  store float %p_759.us.us, float* %scevgep756757.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B772.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 5
  %polly.access.Packed_B773.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B772.us.us
  %_p_scalar_774.us.us = load float, float* %polly.access.Packed_B773.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_777.us.us = load float, float* %scevgep775776.us.us, align 4, !alias.scope !149, !noalias !150
  %p_778.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_774.us.us, float %_p_scalar_777.us.us) #30
  store float %p_778.us.us, float* %scevgep775776.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B791.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 6
  %polly.access.Packed_B792.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B791.us.us
  %_p_scalar_793.us.us = load float, float* %polly.access.Packed_B792.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_796.us.us = load float, float* %scevgep794795.us.us, align 4, !alias.scope !149, !noalias !150
  %p_797.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_793.us.us, float %_p_scalar_796.us.us) #30
  store float %p_797.us.us, float* %scevgep794795.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_B810.us.us = or i64 %polly.access.mul.Packed_B678.us.us, 7
  %polly.access.Packed_B811.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B810.us.us
  %_p_scalar_812.us.us = load float, float* %polly.access.Packed_B811.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_815.us.us = load float, float* %scevgep813814.us.us, align 4, !alias.scope !149, !noalias !150
  %p_816.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_.us.us, float %_p_scalar_812.us.us, float %_p_scalar_815.us.us) #30
  store float %p_816.us.us, float* %scevgep813814.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_A822.us.us = or i64 %polly.access.mul.Packed_A672.us.us, 1
  %polly.access.Packed_A823.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A822.us.us
  %_p_scalar_824.us.us = load float, float* %polly.access.Packed_A823.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_834.us.us = load float, float* %scevgep832833.us.us, align 4, !alias.scope !149, !noalias !150
  %p_835.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_681.us.us, float %_p_scalar_834.us.us) #30
  store float %p_835.us.us, float* %scevgep832833.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_853.us.us = load float, float* %scevgep851852.us.us, align 4, !alias.scope !149, !noalias !150
  %p_854.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_698.us.us, float %_p_scalar_853.us.us) #30
  store float %p_854.us.us, float* %scevgep851852.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_872.us.us = load float, float* %scevgep870871.us.us, align 4, !alias.scope !149, !noalias !150
  %p_873.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_717.us.us, float %_p_scalar_872.us.us) #30
  store float %p_873.us.us, float* %scevgep870871.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_891.us.us = load float, float* %scevgep889890.us.us, align 4, !alias.scope !149, !noalias !150
  %p_892.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_736.us.us, float %_p_scalar_891.us.us) #30
  store float %p_892.us.us, float* %scevgep889890.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_910.us.us = load float, float* %scevgep908909.us.us, align 4, !alias.scope !149, !noalias !150
  %p_911.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_755.us.us, float %_p_scalar_910.us.us) #30
  store float %p_911.us.us, float* %scevgep908909.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_929.us.us = load float, float* %scevgep927928.us.us, align 4, !alias.scope !149, !noalias !150
  %p_930.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_774.us.us, float %_p_scalar_929.us.us) #30
  store float %p_930.us.us, float* %scevgep927928.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_948.us.us = load float, float* %scevgep946947.us.us, align 4, !alias.scope !149, !noalias !150
  %p_949.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_793.us.us, float %_p_scalar_948.us.us) #30
  store float %p_949.us.us, float* %scevgep946947.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_967.us.us = load float, float* %scevgep965966.us.us, align 4, !alias.scope !149, !noalias !150
  %p_968.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_824.us.us, float %_p_scalar_812.us.us, float %_p_scalar_967.us.us) #30
  store float %p_968.us.us, float* %scevgep965966.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_A974.us.us = or i64 %polly.access.mul.Packed_A672.us.us, 2
  %polly.access.Packed_A975.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A974.us.us
  %_p_scalar_976.us.us = load float, float* %polly.access.Packed_A975.us.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_986.us.us = load float, float* %scevgep984985.us.us, align 4, !alias.scope !149, !noalias !150
  %p_987.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_681.us.us, float %_p_scalar_986.us.us) #30
  store float %p_987.us.us, float* %scevgep984985.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1005.us.us = load float, float* %scevgep10031004.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1006.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_698.us.us, float %_p_scalar_1005.us.us) #30
  store float %p_1006.us.us, float* %scevgep10031004.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1024.us.us = load float, float* %scevgep10221023.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1025.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_717.us.us, float %_p_scalar_1024.us.us) #30
  store float %p_1025.us.us, float* %scevgep10221023.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1043.us.us = load float, float* %scevgep10411042.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1044.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_736.us.us, float %_p_scalar_1043.us.us) #30
  store float %p_1044.us.us, float* %scevgep10411042.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1062.us.us = load float, float* %scevgep10601061.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1063.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_755.us.us, float %_p_scalar_1062.us.us) #30
  store float %p_1063.us.us, float* %scevgep10601061.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1081.us.us = load float, float* %scevgep10791080.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1082.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_774.us.us, float %_p_scalar_1081.us.us) #30
  store float %p_1082.us.us, float* %scevgep10791080.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1100.us.us = load float, float* %scevgep10981099.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1101.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_793.us.us, float %_p_scalar_1100.us.us) #30
  store float %p_1101.us.us, float* %scevgep10981099.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1119.us.us = load float, float* %scevgep11171118.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1120.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_976.us.us, float %_p_scalar_812.us.us, float %_p_scalar_1119.us.us) #30
  store float %p_1120.us.us, float* %scevgep11171118.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.access.add.Packed_A1126.us.us = or i64 %polly.access.mul.Packed_A672.us.us, 3
  %polly.access.Packed_A1127.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A1126.us.us
  %_p_scalar_1128.us.us = load float, float* %polly.access.Packed_A1127.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_1138.us.us = load float, float* %scevgep11361137.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1139.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_681.us.us, float %_p_scalar_1138.us.us) #30
  store float %p_1139.us.us, float* %scevgep11361137.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1157.us.us = load float, float* %scevgep11551156.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1158.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_698.us.us, float %_p_scalar_1157.us.us) #30
  store float %p_1158.us.us, float* %scevgep11551156.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1176.us.us = load float, float* %scevgep11741175.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1177.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_717.us.us, float %_p_scalar_1176.us.us) #30
  store float %p_1177.us.us, float* %scevgep11741175.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1195.us.us = load float, float* %scevgep11931194.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1196.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_736.us.us, float %_p_scalar_1195.us.us) #30
  store float %p_1196.us.us, float* %scevgep11931194.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1214.us.us = load float, float* %scevgep12121213.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1215.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_755.us.us, float %_p_scalar_1214.us.us) #30
  store float %p_1215.us.us, float* %scevgep12121213.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1233.us.us = load float, float* %scevgep12311232.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1234.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_774.us.us, float %_p_scalar_1233.us.us) #30
  store float %p_1234.us.us, float* %scevgep12311232.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1252.us.us = load float, float* %scevgep12501251.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1253.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_793.us.us, float %_p_scalar_1252.us.us) #30
  store float %p_1253.us.us, float* %scevgep12501251.us.us, align 4, !alias.scope !149, !noalias !150
  %_p_scalar_1271.us.us = load float, float* %scevgep12691270.us.us, align 4, !alias.scope !149, !noalias !150
  %p_1272.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_1128.us.us, float %_p_scalar_812.us.us, float %_p_scalar_1271.us.us) #30
  store float %p_1272.us.us, float* %scevgep12691270.us.us, align 4, !alias.scope !149, !noalias !150
  %polly.indvar_next667.us.us = add nuw nsw i64 %polly.indvar666.us.us, 1
  %exitcond4316.not = icmp eq i64 %polly.indvar666.us.us, %smin4342
  br i1 %exitcond4316.not, label %polly.loop_exit664.loopexit.us.us, label %polly.stmt.for.body10.us.i1254.us.us, !llvm.loop !153

polly.loop_exit664.loopexit.us.us:                ; preds = %polly.stmt.for.body10.us.i1254.us.us
  %polly.indvar_next659.us.us = add nuw nsw i64 %polly.indvar658.us.us, 1
  %exitcond4320.not = icmp eq i64 %polly.indvar_next659.us.us, %411
  br i1 %exitcond4320.not, label %polly.cond1273.us, label %polly.loop_if661.us.us

polly.loop_if3434.us.us:                          ; preds = %polly.loop_if3426.us, %polly.loop_exit3437.loopexit.us.us
  %polly.indvar3431.us.us = phi i64 [ %polly.indvar_next3432.us.us, %polly.loop_exit3437.loopexit.us.us ], [ 0, %polly.loop_if3426.us ]
  %589 = shl nsw i64 %polly.indvar3431.us.us, 2
  %590 = add nuw nsw i64 %589, %412
  %polly.access.mul.Packed_A3445.us.us = shl nsw i64 %polly.indvar3431.us.us, 9
  %591 = mul i64 %590, %311
  %592 = add i64 %591, %326
  %scevgep3459.us.us = getelementptr i8, i8* %call.i2.i, i64 %592
  %scevgep34593460.us.us = bitcast i8* %scevgep3459.us.us to float*
  %593 = or i64 %590, 2
  %.not4161.us.us = icmp slt i64 %218, %593
  %594 = add i64 %591, %325
  %scevgep3485.us.us = getelementptr i8, i8* %call.i2.i, i64 %594
  %scevgep34853486.us.us = bitcast i8* %scevgep3485.us.us to float*
  %595 = add i64 %330, %591
  %scevgep3511.us.us = getelementptr i8, i8* %call.i2.i, i64 %595
  %scevgep35113512.us.us = bitcast i8* %scevgep3511.us.us to float*
  %596 = add i64 %332, %591
  %scevgep3537.us.us = getelementptr i8, i8* %call.i2.i, i64 %596
  %scevgep35373538.us.us = bitcast i8* %scevgep3537.us.us to float*
  %597 = add i64 %333, %591
  %scevgep3563.us.us = getelementptr i8, i8* %call.i2.i, i64 %597
  %scevgep35633564.us.us = bitcast i8* %scevgep3563.us.us to float*
  %598 = add i64 %335, %591
  %scevgep3589.us.us = getelementptr i8, i8* %call.i2.i, i64 %598
  %scevgep35893590.us.us = bitcast i8* %scevgep3589.us.us to float*
  %599 = add i64 %591, %340
  %scevgep3614.us.us = getelementptr i8, i8* %call.i2.i, i64 %599
  %scevgep36143615.us.us = bitcast i8* %scevgep3614.us.us to float*
  %600 = or i64 %590, 1
  %601 = mul i64 %600, %311
  %602 = add i64 %601, %326
  %scevgep3639.us.us = getelementptr i8, i8* %call.i2.i, i64 %602
  %scevgep36393640.us.us = bitcast i8* %scevgep3639.us.us to float*
  %603 = add i64 %601, %325
  %scevgep3665.us.us = getelementptr i8, i8* %call.i2.i, i64 %603
  %scevgep36653666.us.us = bitcast i8* %scevgep3665.us.us to float*
  %604 = add i64 %330, %601
  %scevgep3691.us.us = getelementptr i8, i8* %call.i2.i, i64 %604
  %scevgep36913692.us.us = bitcast i8* %scevgep3691.us.us to float*
  %605 = add i64 %332, %601
  %scevgep3717.us.us = getelementptr i8, i8* %call.i2.i, i64 %605
  %scevgep37173718.us.us = bitcast i8* %scevgep3717.us.us to float*
  %606 = add i64 %333, %601
  %scevgep3743.us.us = getelementptr i8, i8* %call.i2.i, i64 %606
  %scevgep37433744.us.us = bitcast i8* %scevgep3743.us.us to float*
  %607 = add i64 %335, %601
  %scevgep3769.us.us = getelementptr i8, i8* %call.i2.i, i64 %607
  %scevgep37693770.us.us = bitcast i8* %scevgep3769.us.us to float*
  %608 = add i64 %601, %340
  %scevgep3794.us.us = getelementptr i8, i8* %call.i2.i, i64 %608
  %scevgep37943795.us.us = bitcast i8* %scevgep3794.us.us to float*
  %609 = or i64 %590, 3
  %.not4162.us.us = icmp slt i64 %218, %609
  %610 = mul i64 %593, %311
  %611 = add i64 %610, %326
  %scevgep3819.us.us = getelementptr i8, i8* %call.i2.i, i64 %611
  %scevgep38193820.us.us = bitcast i8* %scevgep3819.us.us to float*
  %612 = add i64 %610, %325
  %scevgep3845.us.us = getelementptr i8, i8* %call.i2.i, i64 %612
  %scevgep38453846.us.us = bitcast i8* %scevgep3845.us.us to float*
  %613 = add i64 %330, %610
  %scevgep3871.us.us = getelementptr i8, i8* %call.i2.i, i64 %613
  %scevgep38713872.us.us = bitcast i8* %scevgep3871.us.us to float*
  %614 = add i64 %332, %610
  %scevgep3897.us.us = getelementptr i8, i8* %call.i2.i, i64 %614
  %scevgep38973898.us.us = bitcast i8* %scevgep3897.us.us to float*
  %615 = add i64 %333, %610
  %scevgep3923.us.us = getelementptr i8, i8* %call.i2.i, i64 %615
  %scevgep39233924.us.us = bitcast i8* %scevgep3923.us.us to float*
  %616 = add i64 %335, %610
  %scevgep3949.us.us = getelementptr i8, i8* %call.i2.i, i64 %616
  %scevgep39493950.us.us = bitcast i8* %scevgep3949.us.us to float*
  %617 = add i64 %610, %340
  %scevgep3974.us.us = getelementptr i8, i8* %call.i2.i, i64 %617
  %scevgep39743975.us.us = bitcast i8* %scevgep3974.us.us to float*
  %618 = add nuw nsw i64 %590, 4
  %.not4163.us.us = icmp slt i64 %218, %618
  %619 = mul i64 %609, %311
  %620 = add i64 %619, %326
  %scevgep3999.us.us = getelementptr i8, i8* %call.i2.i, i64 %620
  %scevgep39994000.us.us = bitcast i8* %scevgep3999.us.us to float*
  %621 = add i64 %619, %325
  %scevgep4025.us.us = getelementptr i8, i8* %call.i2.i, i64 %621
  %scevgep40254026.us.us = bitcast i8* %scevgep4025.us.us to float*
  %622 = add i64 %330, %619
  %scevgep4051.us.us = getelementptr i8, i8* %call.i2.i, i64 %622
  %scevgep40514052.us.us = bitcast i8* %scevgep4051.us.us to float*
  %623 = add i64 %332, %619
  %scevgep4077.us.us = getelementptr i8, i8* %call.i2.i, i64 %623
  %scevgep40774078.us.us = bitcast i8* %scevgep4077.us.us to float*
  %624 = add i64 %333, %619
  %scevgep4103.us.us = getelementptr i8, i8* %call.i2.i, i64 %624
  %scevgep41034104.us.us = bitcast i8* %scevgep4103.us.us to float*
  %625 = add i64 %335, %619
  %scevgep4129.us.us = getelementptr i8, i8* %call.i2.i, i64 %625
  %scevgep41294130.us.us = bitcast i8* %scevgep4129.us.us to float*
  %626 = add i64 %619, %340
  %scevgep4154.us.us = getelementptr i8, i8* %call.i2.i, i64 %626
  %scevgep41544155.us.us = bitcast i8* %scevgep4154.us.us to float*
  br label %polly.cond3463.us.us

polly.cond3463.us.us:                             ; preds = %polly.merge3619.us.us, %polly.loop_if3434.us.us
  %polly.indvar3439.us.us = phi i64 [ %polly.indvar_next3440.us.us, %polly.merge3619.us.us ], [ 0, %polly.loop_if3434.us.us ]
  %polly.access.add.Packed_A3446.us.us = add nuw nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_A3445.us.us
  %polly.access.mul.Packed_A3447.us.us = shl nsw i64 %polly.access.add.Packed_A3446.us.us, 2
  %polly.access.Packed_A3449.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A3447.us.us
  %_p_scalar_3450.us.us = load float, float* %polly.access.Packed_A3449.us.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.add.Packed_B3454.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3453
  %polly.access.mul.Packed_B3455.us.us = shl nsw i64 %polly.access.add.Packed_B3454.us.us, 3
  %polly.access.Packed_B3457.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B3455.us.us
  %_p_scalar_3458.us.us = load float, float* %polly.access.Packed_B3457.us.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_3461.us.us = load float, float* %scevgep34593460.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3462.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3458.us.us, float %_p_scalar_3461.us.us) #30
  store float %p_3462.us.us, float* %scevgep34593460.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %327, label %polly.cond3489.us.us, label %polly.cond3618.us.us.thread

polly.cond3489.us.us:                             ; preds = %polly.cond3463.us.us
  %polly.access.add.Packed_B3480.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3479
  %polly.access.mul.Packed_B3481.us.us = shl nsw i64 %polly.access.add.Packed_B3480.us.us, 3
  %polly.access.add.Packed_B3482.us.us = or i64 %polly.access.mul.Packed_B3481.us.us, 1
  %polly.access.Packed_B3483.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3482.us.us
  %_p_scalar_3484.us.us = load float, float* %polly.access.Packed_B3483.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3487.us.us = load float, float* %scevgep34853486.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3488.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3484.us.us, float %_p_scalar_3487.us.us) #30
  store float %p_3488.us.us, float* %scevgep34853486.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4179, label %polly.cond3618.us.us, label %polly.cond3515.us.us

polly.cond3515.us.us:                             ; preds = %polly.cond3489.us.us
  %polly.access.add.Packed_B3506.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3505
  %polly.access.mul.Packed_B3507.us.us = shl nsw i64 %polly.access.add.Packed_B3506.us.us, 3
  %polly.access.add.Packed_B3508.us.us = or i64 %polly.access.mul.Packed_B3507.us.us, 2
  %polly.access.Packed_B3509.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3508.us.us
  %_p_scalar_3510.us.us = load float, float* %polly.access.Packed_B3509.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3513.us.us = load float, float* %scevgep35113512.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3514.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3510.us.us, float %_p_scalar_3513.us.us) #30
  store float %p_3514.us.us, float* %scevgep35113512.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %331, label %polly.cond3541.us.us, label %polly.cond3618.us.us

polly.cond3541.us.us:                             ; preds = %polly.cond3515.us.us
  %polly.access.add.Packed_B3534.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 3
  %polly.access.Packed_B3535.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3534.us.us
  %_p_scalar_3536.us.us = load float, float* %polly.access.Packed_B3535.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3539.us.us = load float, float* %scevgep35373538.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3540.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3536.us.us, float %_p_scalar_3539.us.us) #30
  store float %p_3540.us.us, float* %scevgep35373538.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4181, label %polly.cond3618.us.us, label %polly.cond3567.us.us

polly.cond3567.us.us:                             ; preds = %polly.cond3541.us.us
  %polly.access.add.Packed_B3560.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 4
  %polly.access.Packed_B3561.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3560.us.us
  %_p_scalar_3562.us.us = load float, float* %polly.access.Packed_B3561.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3565.us.us = load float, float* %scevgep35633564.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3566.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3562.us.us, float %_p_scalar_3565.us.us) #30
  store float %p_3566.us.us, float* %scevgep35633564.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %334, label %polly.cond3593.us.us, label %polly.cond3618.us.us

polly.cond3593.us.us:                             ; preds = %polly.cond3567.us.us
  %polly.access.add.Packed_B3586.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 5
  %polly.access.Packed_B3587.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3586.us.us
  %_p_scalar_3588.us.us = load float, float* %polly.access.Packed_B3587.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3591.us.us = load float, float* %scevgep35893590.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3592.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3588.us.us, float %_p_scalar_3591.us.us) #30
  store float %p_3592.us.us, float* %scevgep35893590.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %338, label %polly.stmt.for.body10.us.i3598.us.us, label %polly.cond3618.us.us

polly.stmt.for.body10.us.i3598.us.us:             ; preds = %polly.cond3593.us.us
  %polly.access.add.Packed_B3609.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3608
  %polly.access.mul.Packed_B3610.us.us = shl nsw i64 %polly.access.add.Packed_B3609.us.us, 3
  %polly.access.add.Packed_B3611.us.us = or i64 %polly.access.mul.Packed_B3610.us.us, 6
  %polly.access.Packed_B3612.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3611.us.us
  %_p_scalar_3613.us.us = load float, float* %polly.access.Packed_B3612.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3616.us.us = load float, float* %scevgep36143615.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3617.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3450.us.us, float %_p_scalar_3613.us.us, float %_p_scalar_3616.us.us) #30
  store float %p_3617.us.us, float* %scevgep36143615.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3618.us.us

polly.cond3618.us.us:                             ; preds = %polly.stmt.for.body10.us.i3598.us.us, %polly.cond3593.us.us, %polly.cond3567.us.us, %polly.cond3541.us.us, %polly.cond3515.us.us, %polly.cond3489.us.us
  br i1 %.not4161.us.us, label %polly.merge3619.us.us, label %polly.cond3643.us.us

polly.cond3618.us.us.thread:                      ; preds = %polly.cond3463.us.us
  br i1 %.not4161.us.us, label %polly.merge3619.us.us, label %polly.cond3643.us.us.thread

polly.cond3643.us.us.thread:                      ; preds = %polly.cond3618.us.us.thread
  %polly.access.add.Packed_A3628.us.us4352 = or i64 %polly.access.mul.Packed_A3447.us.us, 1
  %polly.access.Packed_A3629.us.us4353 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3628.us.us4352
  %_p_scalar_3630.us.us4354 = load float, float* %polly.access.Packed_A3629.us.us4353, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_3641.us.us4355 = load float, float* %scevgep36393640.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3642.us.us4356 = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us4354, float %_p_scalar_3458.us.us, float %_p_scalar_3641.us.us4355) #30
  store float %p_3642.us.us4356, float* %scevgep36393640.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3798.us.us

polly.cond3643.us.us:                             ; preds = %polly.cond3618.us.us
  %polly.access.add.Packed_A3628.us.us = or i64 %polly.access.mul.Packed_A3447.us.us, 1
  %polly.access.Packed_A3629.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3628.us.us
  %_p_scalar_3630.us.us = load float, float* %polly.access.Packed_A3629.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_3641.us.us = load float, float* %scevgep36393640.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3642.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3458.us.us, float %_p_scalar_3641.us.us) #30
  store float %p_3642.us.us, float* %scevgep36393640.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %327, label %polly.cond3669.us.us, label %polly.cond3798.us.us

polly.cond3669.us.us:                             ; preds = %polly.cond3643.us.us
  %polly.access.add.Packed_B3660.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3479
  %polly.access.mul.Packed_B3661.us.us = shl nsw i64 %polly.access.add.Packed_B3660.us.us, 3
  %polly.access.add.Packed_B3662.us.us = or i64 %polly.access.mul.Packed_B3661.us.us, 1
  %polly.access.Packed_B3663.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3662.us.us
  %_p_scalar_3664.us.us = load float, float* %polly.access.Packed_B3663.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3667.us.us = load float, float* %scevgep36653666.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3668.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3664.us.us, float %_p_scalar_3667.us.us) #30
  store float %p_3668.us.us, float* %scevgep36653666.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4179, label %polly.cond3798.us.us, label %polly.cond3695.us.us

polly.cond3695.us.us:                             ; preds = %polly.cond3669.us.us
  %polly.access.add.Packed_B3686.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3505
  %polly.access.mul.Packed_B3687.us.us = shl nsw i64 %polly.access.add.Packed_B3686.us.us, 3
  %polly.access.add.Packed_B3688.us.us = or i64 %polly.access.mul.Packed_B3687.us.us, 2
  %polly.access.Packed_B3689.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3688.us.us
  %_p_scalar_3690.us.us = load float, float* %polly.access.Packed_B3689.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3693.us.us = load float, float* %scevgep36913692.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3694.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3690.us.us, float %_p_scalar_3693.us.us) #30
  store float %p_3694.us.us, float* %scevgep36913692.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %331, label %polly.cond3721.us.us, label %polly.cond3798.us.us

polly.cond3721.us.us:                             ; preds = %polly.cond3695.us.us
  %polly.access.add.Packed_B3714.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 3
  %polly.access.Packed_B3715.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3714.us.us
  %_p_scalar_3716.us.us = load float, float* %polly.access.Packed_B3715.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3719.us.us = load float, float* %scevgep37173718.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3720.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3716.us.us, float %_p_scalar_3719.us.us) #30
  store float %p_3720.us.us, float* %scevgep37173718.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4181, label %polly.cond3798.us.us, label %polly.cond3747.us.us

polly.cond3747.us.us:                             ; preds = %polly.cond3721.us.us
  %polly.access.add.Packed_B3740.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 4
  %polly.access.Packed_B3741.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3740.us.us
  %_p_scalar_3742.us.us = load float, float* %polly.access.Packed_B3741.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3745.us.us = load float, float* %scevgep37433744.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3746.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3742.us.us, float %_p_scalar_3745.us.us) #30
  store float %p_3746.us.us, float* %scevgep37433744.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %334, label %polly.cond3773.us.us, label %polly.cond3798.us.us

polly.cond3773.us.us:                             ; preds = %polly.cond3747.us.us
  %polly.access.add.Packed_B3766.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 5
  %polly.access.Packed_B3767.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3766.us.us
  %_p_scalar_3768.us.us = load float, float* %polly.access.Packed_B3767.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3771.us.us = load float, float* %scevgep37693770.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3772.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3768.us.us, float %_p_scalar_3771.us.us) #30
  store float %p_3772.us.us, float* %scevgep37693770.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %338, label %polly.stmt.for.body10.us.i3778.us.us, label %polly.cond3798.us.us

polly.stmt.for.body10.us.i3778.us.us:             ; preds = %polly.cond3773.us.us
  %polly.access.add.Packed_B3789.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3608
  %polly.access.mul.Packed_B3790.us.us = shl nsw i64 %polly.access.add.Packed_B3789.us.us, 3
  %polly.access.add.Packed_B3791.us.us = or i64 %polly.access.mul.Packed_B3790.us.us, 6
  %polly.access.Packed_B3792.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3791.us.us
  %_p_scalar_3793.us.us = load float, float* %polly.access.Packed_B3792.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3796.us.us = load float, float* %scevgep37943795.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3797.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3630.us.us, float %_p_scalar_3793.us.us, float %_p_scalar_3796.us.us) #30
  store float %p_3797.us.us, float* %scevgep37943795.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3798.us.us

polly.cond3798.us.us:                             ; preds = %polly.cond3643.us.us.thread, %polly.stmt.for.body10.us.i3778.us.us, %polly.cond3773.us.us, %polly.cond3747.us.us, %polly.cond3721.us.us, %polly.cond3695.us.us, %polly.cond3669.us.us, %polly.cond3643.us.us
  br i1 %.not4162.us.us, label %polly.merge3619.us.us, label %polly.cond3823.us.us

polly.cond3823.us.us:                             ; preds = %polly.cond3798.us.us
  %polly.access.add.Packed_A3808.us.us = or i64 %polly.access.mul.Packed_A3447.us.us, 2
  %polly.access.Packed_A3809.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3808.us.us
  %_p_scalar_3810.us.us = load float, float* %polly.access.Packed_A3809.us.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_3821.us.us = load float, float* %scevgep38193820.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3822.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3458.us.us, float %_p_scalar_3821.us.us) #30
  store float %p_3822.us.us, float* %scevgep38193820.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %327, label %polly.cond3849.us.us, label %polly.cond3978.us.us.thread

polly.cond3849.us.us:                             ; preds = %polly.cond3823.us.us
  %polly.access.add.Packed_B3840.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3479
  %polly.access.mul.Packed_B3841.us.us = shl nsw i64 %polly.access.add.Packed_B3840.us.us, 3
  %polly.access.add.Packed_B3842.us.us = or i64 %polly.access.mul.Packed_B3841.us.us, 1
  %polly.access.Packed_B3843.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3842.us.us
  %_p_scalar_3844.us.us = load float, float* %polly.access.Packed_B3843.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3847.us.us = load float, float* %scevgep38453846.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3848.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3844.us.us, float %_p_scalar_3847.us.us) #30
  store float %p_3848.us.us, float* %scevgep38453846.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4179, label %polly.cond3978.us.us, label %polly.cond3875.us.us

polly.cond3875.us.us:                             ; preds = %polly.cond3849.us.us
  %polly.access.add.Packed_B3866.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3505
  %polly.access.mul.Packed_B3867.us.us = shl nsw i64 %polly.access.add.Packed_B3866.us.us, 3
  %polly.access.add.Packed_B3868.us.us = or i64 %polly.access.mul.Packed_B3867.us.us, 2
  %polly.access.Packed_B3869.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3868.us.us
  %_p_scalar_3870.us.us = load float, float* %polly.access.Packed_B3869.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3873.us.us = load float, float* %scevgep38713872.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3874.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3870.us.us, float %_p_scalar_3873.us.us) #30
  store float %p_3874.us.us, float* %scevgep38713872.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %331, label %polly.cond3901.us.us, label %polly.cond3978.us.us

polly.cond3901.us.us:                             ; preds = %polly.cond3875.us.us
  %polly.access.add.Packed_B3894.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 3
  %polly.access.Packed_B3895.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3894.us.us
  %_p_scalar_3896.us.us = load float, float* %polly.access.Packed_B3895.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3899.us.us = load float, float* %scevgep38973898.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3900.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3896.us.us, float %_p_scalar_3899.us.us) #30
  store float %p_3900.us.us, float* %scevgep38973898.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4181, label %polly.cond3978.us.us, label %polly.cond3927.us.us

polly.cond3927.us.us:                             ; preds = %polly.cond3901.us.us
  %polly.access.add.Packed_B3920.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 4
  %polly.access.Packed_B3921.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3920.us.us
  %_p_scalar_3922.us.us = load float, float* %polly.access.Packed_B3921.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3925.us.us = load float, float* %scevgep39233924.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3926.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3922.us.us, float %_p_scalar_3925.us.us) #30
  store float %p_3926.us.us, float* %scevgep39233924.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %334, label %polly.cond3953.us.us, label %polly.cond3978.us.us

polly.cond3953.us.us:                             ; preds = %polly.cond3927.us.us
  %polly.access.add.Packed_B3946.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 5
  %polly.access.Packed_B3947.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3946.us.us
  %_p_scalar_3948.us.us = load float, float* %polly.access.Packed_B3947.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3951.us.us = load float, float* %scevgep39493950.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3952.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3948.us.us, float %_p_scalar_3951.us.us) #30
  store float %p_3952.us.us, float* %scevgep39493950.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %338, label %polly.stmt.for.body10.us.i3958.us.us, label %polly.cond3978.us.us

polly.stmt.for.body10.us.i3958.us.us:             ; preds = %polly.cond3953.us.us
  %polly.access.add.Packed_B3969.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3608
  %polly.access.mul.Packed_B3970.us.us = shl nsw i64 %polly.access.add.Packed_B3969.us.us, 3
  %polly.access.add.Packed_B3971.us.us = or i64 %polly.access.mul.Packed_B3970.us.us, 6
  %polly.access.Packed_B3972.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3971.us.us
  %_p_scalar_3973.us.us = load float, float* %polly.access.Packed_B3972.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3976.us.us = load float, float* %scevgep39743975.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3977.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3810.us.us, float %_p_scalar_3973.us.us, float %_p_scalar_3976.us.us) #30
  store float %p_3977.us.us, float* %scevgep39743975.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3978.us.us

polly.cond3978.us.us:                             ; preds = %polly.stmt.for.body10.us.i3958.us.us, %polly.cond3953.us.us, %polly.cond3927.us.us, %polly.cond3901.us.us, %polly.cond3875.us.us, %polly.cond3849.us.us
  br i1 %.not4163.us.us, label %polly.merge3619.us.us, label %polly.cond4003.us.us

polly.cond3978.us.us.thread:                      ; preds = %polly.cond3823.us.us
  br i1 %.not4163.us.us, label %polly.merge3619.us.us, label %polly.cond4003.us.us.thread

polly.cond4003.us.us.thread:                      ; preds = %polly.cond3978.us.us.thread
  %polly.access.add.Packed_A3988.us.us4357 = or i64 %polly.access.mul.Packed_A3447.us.us, 3
  %polly.access.Packed_A3989.us.us4358 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3988.us.us4357
  %_p_scalar_3990.us.us4359 = load float, float* %polly.access.Packed_A3989.us.us4358, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_4001.us.us4360 = load float, float* %scevgep39994000.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4002.us.us4361 = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us4359, float %_p_scalar_3458.us.us, float %_p_scalar_4001.us.us4360) #30
  store float %p_4002.us.us4361, float* %scevgep39994000.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge3619.us.us

polly.cond4003.us.us:                             ; preds = %polly.cond3978.us.us
  %polly.access.add.Packed_A3988.us.us = or i64 %polly.access.mul.Packed_A3447.us.us, 3
  %polly.access.Packed_A3989.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3988.us.us
  %_p_scalar_3990.us.us = load float, float* %polly.access.Packed_A3989.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_4001.us.us = load float, float* %scevgep39994000.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4002.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_3458.us.us, float %_p_scalar_4001.us.us) #30
  store float %p_4002.us.us, float* %scevgep39994000.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %327, label %polly.cond4029.us.us, label %polly.merge3619.us.us

polly.cond4029.us.us:                             ; preds = %polly.cond4003.us.us
  %polly.access.add.Packed_B4020.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3479
  %polly.access.mul.Packed_B4021.us.us = shl nsw i64 %polly.access.add.Packed_B4020.us.us, 3
  %polly.access.add.Packed_B4022.us.us = or i64 %polly.access.mul.Packed_B4021.us.us, 1
  %polly.access.Packed_B4023.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4022.us.us
  %_p_scalar_4024.us.us = load float, float* %polly.access.Packed_B4023.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_4027.us.us = load float, float* %scevgep40254026.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4028.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4024.us.us, float %_p_scalar_4027.us.us) #30
  store float %p_4028.us.us, float* %scevgep40254026.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4179, label %polly.merge3619.us.us, label %polly.cond4055.us.us

polly.cond4055.us.us:                             ; preds = %polly.cond4029.us.us
  %polly.access.add.Packed_B4046.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3505
  %polly.access.mul.Packed_B4047.us.us = shl nsw i64 %polly.access.add.Packed_B4046.us.us, 3
  %polly.access.add.Packed_B4048.us.us = or i64 %polly.access.mul.Packed_B4047.us.us, 2
  %polly.access.Packed_B4049.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4048.us.us
  %_p_scalar_4050.us.us = load float, float* %polly.access.Packed_B4049.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_4053.us.us = load float, float* %scevgep40514052.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4054.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4050.us.us, float %_p_scalar_4053.us.us) #30
  store float %p_4054.us.us, float* %scevgep40514052.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %331, label %polly.cond4081.us.us, label %polly.merge3619.us.us

polly.cond4081.us.us:                             ; preds = %polly.cond4055.us.us
  %polly.access.add.Packed_B4074.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 3
  %polly.access.Packed_B4075.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4074.us.us
  %_p_scalar_4076.us.us = load float, float* %polly.access.Packed_B4075.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_4079.us.us = load float, float* %scevgep40774078.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4080.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4076.us.us, float %_p_scalar_4079.us.us) #30
  store float %p_4080.us.us, float* %scevgep40774078.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4181, label %polly.merge3619.us.us, label %polly.cond4107.us.us

polly.cond4107.us.us:                             ; preds = %polly.cond4081.us.us
  %polly.access.add.Packed_B4100.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 4
  %polly.access.Packed_B4101.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4100.us.us
  %_p_scalar_4102.us.us = load float, float* %polly.access.Packed_B4101.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_4105.us.us = load float, float* %scevgep41034104.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4106.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4102.us.us, float %_p_scalar_4105.us.us) #30
  store float %p_4106.us.us, float* %scevgep41034104.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %334, label %polly.cond4133.us.us, label %polly.merge3619.us.us

polly.cond4133.us.us:                             ; preds = %polly.cond4107.us.us
  %polly.access.add.Packed_B4126.us.us = or i64 %polly.access.mul.Packed_B3455.us.us, 5
  %polly.access.Packed_B4127.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4126.us.us
  %_p_scalar_4128.us.us = load float, float* %polly.access.Packed_B4127.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_4131.us.us = load float, float* %scevgep41294130.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4132.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4128.us.us, float %_p_scalar_4131.us.us) #30
  store float %p_4132.us.us, float* %scevgep41294130.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %338, label %polly.stmt.for.body10.us.i4138.us.us, label %polly.merge3619.us.us

polly.stmt.for.body10.us.i4138.us.us:             ; preds = %polly.cond4133.us.us
  %polly.access.add.Packed_B4149.us.us = add nsw i64 %polly.indvar3439.us.us, %polly.access.mul.Packed_B3608
  %polly.access.mul.Packed_B4150.us.us = shl nsw i64 %polly.access.add.Packed_B4149.us.us, 3
  %polly.access.add.Packed_B4151.us.us = or i64 %polly.access.mul.Packed_B4150.us.us, 6
  %polly.access.Packed_B4152.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B4151.us.us
  %_p_scalar_4153.us.us = load float, float* %polly.access.Packed_B4152.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_4156.us.us = load float, float* %scevgep41544155.us.us, align 4, !alias.scope !149, !noalias !150
  %p_4157.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3990.us.us, float %_p_scalar_4153.us.us, float %_p_scalar_4156.us.us) #30
  store float %p_4157.us.us, float* %scevgep41544155.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge3619.us.us

polly.merge3619.us.us:                            ; preds = %polly.cond4003.us.us.thread, %polly.cond3978.us.us.thread, %polly.cond3618.us.us.thread, %polly.stmt.for.body10.us.i4138.us.us, %polly.cond4133.us.us, %polly.cond4107.us.us, %polly.cond4081.us.us, %polly.cond4055.us.us, %polly.cond4029.us.us, %polly.cond4003.us.us, %polly.cond3978.us.us, %polly.cond3798.us.us, %polly.cond3618.us.us
  %polly.indvar_next3440.us.us = add nuw nsw i64 %polly.indvar3439.us.us, 1
  %exitcond4331.not = icmp eq i64 %polly.indvar3439.us.us, %smin4342
  br i1 %exitcond4331.not, label %polly.loop_exit3437.loopexit.us.us, label %polly.cond3463.us.us, !llvm.loop !154

polly.loop_exit3437.loopexit.us.us:               ; preds = %polly.merge3619.us.us
  %polly.indvar_next3432.us.us = add nuw nsw i64 %polly.indvar3431.us.us, 1
  %exitcond4335.not = icmp eq i64 %polly.indvar3431.us.us, %smin4344
  br i1 %exitcond4335.not, label %polly.merge2243.us, label %polly.loop_if3434.us.us

polly.loop_if2893.us.us:                          ; preds = %polly.loop_if2893.preheader.us, %polly.loop_exit2896.loopexit.us.us
  %polly.indvar2890.us.us = phi i64 [ %polly.indvar_next2891.us.us, %polly.loop_exit2896.loopexit.us.us ], [ 0, %polly.loop_if2893.preheader.us ]
  %627 = shl nsw i64 %polly.indvar2890.us.us, 3
  %628 = add nuw nsw i64 %627, %353
  %polly.access.mul.Packed_B2909.us.us = shl nsw i64 %polly.indvar2890.us.us, 9
  %629 = shl i64 %628, 2
  %630 = add i64 %629, %519
  %scevgep2915.us.us = getelementptr i8, i8* %call.i2.i, i64 %630
  %scevgep29152916.us.us = bitcast i8* %scevgep2915.us.us to float*
  %631 = or i64 %628, 2
  %.not4184.us.us = icmp slt i64 %220, %631
  %632 = add i64 %521, %629
  %scevgep2937.us.us = getelementptr i8, i8* %call.i2.i, i64 %632
  %scevgep29372938.us.us = bitcast i8* %scevgep2937.us.us to float*
  %633 = or i64 %628, 3
  %.not4198.us.us = icmp slt i64 %220, %633
  %634 = shl i64 %631, 2
  %635 = add i64 %634, %519
  %scevgep2959.us.us = getelementptr i8, i8* %call.i2.i, i64 %635
  %scevgep29592960.us.us = bitcast i8* %scevgep2959.us.us to float*
  %636 = or i64 %628, 4
  %.not4199.us.us = icmp slt i64 %220, %636
  %637 = shl i64 %633, 2
  %638 = add i64 %637, %519
  %scevgep2981.us.us = getelementptr i8, i8* %call.i2.i, i64 %638
  %scevgep29812982.us.us = bitcast i8* %scevgep2981.us.us to float*
  %639 = or i64 %628, 5
  %.not4200.us.us = icmp slt i64 %220, %639
  %640 = shl i64 %636, 2
  %641 = add i64 %640, %519
  %scevgep3003.us.us = getelementptr i8, i8* %call.i2.i, i64 %641
  %scevgep30033004.us.us = bitcast i8* %scevgep3003.us.us to float*
  %642 = or i64 %628, 6
  %.not4201.us.us = icmp slt i64 %220, %642
  %643 = shl i64 %639, 2
  %644 = add i64 %643, %519
  %scevgep3025.us.us = getelementptr i8, i8* %call.i2.i, i64 %644
  %scevgep30253026.us.us = bitcast i8* %scevgep3025.us.us to float*
  %645 = or i64 %628, 7
  %.not4202.us.us = icmp slt i64 %220, %645
  %646 = shl i64 %642, 2
  %647 = add i64 %646, %519
  %scevgep3047.us.us = getelementptr i8, i8* %call.i2.i, i64 %647
  %scevgep30473048.us.us = bitcast i8* %scevgep3047.us.us to float*
  %648 = add nuw nsw i64 %628, 8
  %.not4203.us.us = icmp slt i64 %220, %648
  %649 = shl i64 %645, 2
  %650 = add i64 %649, %519
  %scevgep3069.us.us = getelementptr i8, i8* %call.i2.i, i64 %650
  %scevgep30693070.us.us = bitcast i8* %scevgep3069.us.us to float*
  %651 = add i64 %629, %523
  %scevgep3091.us.us = getelementptr i8, i8* %call.i2.i, i64 %651
  %scevgep30913092.us.us = bitcast i8* %scevgep3091.us.us to float*
  %652 = add i64 %524, %629
  %scevgep3113.us.us = getelementptr i8, i8* %call.i2.i, i64 %652
  %scevgep31133114.us.us = bitcast i8* %scevgep3113.us.us to float*
  %653 = add i64 %634, %523
  %scevgep3135.us.us = getelementptr i8, i8* %call.i2.i, i64 %653
  %scevgep31353136.us.us = bitcast i8* %scevgep3135.us.us to float*
  %654 = add i64 %637, %523
  %scevgep3157.us.us = getelementptr i8, i8* %call.i2.i, i64 %654
  %scevgep31573158.us.us = bitcast i8* %scevgep3157.us.us to float*
  %655 = add i64 %640, %523
  %scevgep3179.us.us = getelementptr i8, i8* %call.i2.i, i64 %655
  %scevgep31793180.us.us = bitcast i8* %scevgep3179.us.us to float*
  %656 = add i64 %643, %523
  %scevgep3201.us.us = getelementptr i8, i8* %call.i2.i, i64 %656
  %scevgep32013202.us.us = bitcast i8* %scevgep3201.us.us to float*
  %657 = add i64 %646, %523
  %scevgep3223.us.us = getelementptr i8, i8* %call.i2.i, i64 %657
  %scevgep32233224.us.us = bitcast i8* %scevgep3223.us.us to float*
  %658 = add i64 %649, %523
  %scevgep3245.us.us = getelementptr i8, i8* %call.i2.i, i64 %658
  %scevgep32453246.us.us = bitcast i8* %scevgep3245.us.us to float*
  %659 = add i64 %629, %323
  %scevgep3267.us.us = getelementptr i8, i8* %call.i2.i, i64 %659
  %scevgep32673268.us.us = bitcast i8* %scevgep3267.us.us to float*
  %660 = add i64 %341, %629
  %scevgep3289.us.us = getelementptr i8, i8* %call.i2.i, i64 %660
  %scevgep32893290.us.us = bitcast i8* %scevgep3289.us.us to float*
  %661 = add i64 %634, %323
  %scevgep3311.us.us = getelementptr i8, i8* %call.i2.i, i64 %661
  %scevgep33113312.us.us = bitcast i8* %scevgep3311.us.us to float*
  %662 = add i64 %637, %323
  %scevgep3333.us.us = getelementptr i8, i8* %call.i2.i, i64 %662
  %scevgep33333334.us.us = bitcast i8* %scevgep3333.us.us to float*
  %663 = add i64 %640, %323
  %scevgep3355.us.us = getelementptr i8, i8* %call.i2.i, i64 %663
  %scevgep33553356.us.us = bitcast i8* %scevgep3355.us.us to float*
  %664 = add i64 %643, %323
  %scevgep3377.us.us = getelementptr i8, i8* %call.i2.i, i64 %664
  %scevgep33773378.us.us = bitcast i8* %scevgep3377.us.us to float*
  %665 = add i64 %646, %323
  %scevgep3399.us.us = getelementptr i8, i8* %call.i2.i, i64 %665
  %scevgep33993400.us.us = bitcast i8* %scevgep3399.us.us to float*
  %666 = add i64 %649, %323
  %scevgep3421.us.us = getelementptr i8, i8* %call.i2.i, i64 %666
  %scevgep34213422.us.us = bitcast i8* %scevgep3421.us.us to float*
  br label %polly.cond2919.us.us

polly.cond2919.us.us:                             ; preds = %polly.merge3074.us.us, %polly.loop_if2893.us.us
  %polly.indvar2898.us.us = phi i64 [ %polly.indvar_next2899.us.us, %polly.merge3074.us.us ], [ 0, %polly.loop_if2893.us.us ]
  %polly.access.mul.Packed_A2904.us.us = shl nsw i64 %polly.indvar2898.us.us, 2
  %polly.access.Packed_A2906.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2904.us.us
  %_p_scalar_2907.us.us = load float, float* %polly.access.Packed_A2906.us.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.add.Packed_B2910.us.us = add nuw nsw i64 %polly.indvar2898.us.us, %polly.access.mul.Packed_B2909.us.us
  %polly.access.mul.Packed_B2911.us.us = shl nsw i64 %polly.access.add.Packed_B2910.us.us, 3
  %polly.access.Packed_B2913.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2911.us.us
  %_p_scalar_2914.us.us = load float, float* %polly.access.Packed_B2913.us.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_2917.us.us = load float, float* %scevgep29152916.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2918.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_2914.us.us, float %_p_scalar_2917.us.us) #30
  store float %p_2918.us.us, float* %scevgep29152916.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4184.us.us, label %polly.cond3073.us.us.thread, label %polly.cond2941.us.us

polly.cond2941.us.us:                             ; preds = %polly.cond2919.us.us
  %polly.access.add.Packed_B2934.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 1
  %polly.access.Packed_B2935.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2934.us.us
  %_p_scalar_2936.us.us = load float, float* %polly.access.Packed_B2935.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2939.us.us = load float, float* %scevgep29372938.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2940.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_2936.us.us, float %_p_scalar_2939.us.us) #30
  store float %p_2940.us.us, float* %scevgep29372938.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4198.us.us, label %polly.cond3073.us.us, label %polly.cond2963.us.us

polly.cond2963.us.us:                             ; preds = %polly.cond2941.us.us
  %polly.access.add.Packed_B2956.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 2
  %polly.access.Packed_B2957.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2956.us.us
  %_p_scalar_2958.us.us = load float, float* %polly.access.Packed_B2957.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2961.us.us = load float, float* %scevgep29592960.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2962.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_2958.us.us, float %_p_scalar_2961.us.us) #30
  store float %p_2962.us.us, float* %scevgep29592960.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4199.us.us, label %polly.cond3073.us.us, label %polly.cond2985.us.us

polly.cond2985.us.us:                             ; preds = %polly.cond2963.us.us
  %polly.access.add.Packed_B2978.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 3
  %polly.access.Packed_B2979.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2978.us.us
  %_p_scalar_2980.us.us = load float, float* %polly.access.Packed_B2979.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2983.us.us = load float, float* %scevgep29812982.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2984.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_2980.us.us, float %_p_scalar_2983.us.us) #30
  store float %p_2984.us.us, float* %scevgep29812982.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4200.us.us, label %polly.cond3073.us.us, label %polly.cond3007.us.us

polly.cond3007.us.us:                             ; preds = %polly.cond2985.us.us
  %polly.access.add.Packed_B3000.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 4
  %polly.access.Packed_B3001.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3000.us.us
  %_p_scalar_3002.us.us = load float, float* %polly.access.Packed_B3001.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3005.us.us = load float, float* %scevgep30033004.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3006.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_3002.us.us, float %_p_scalar_3005.us.us) #30
  store float %p_3006.us.us, float* %scevgep30033004.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4201.us.us, label %polly.cond3073.us.us, label %polly.cond3029.us.us

polly.cond3029.us.us:                             ; preds = %polly.cond3007.us.us
  %polly.access.add.Packed_B3022.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 5
  %polly.access.Packed_B3023.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3022.us.us
  %_p_scalar_3024.us.us = load float, float* %polly.access.Packed_B3023.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3027.us.us = load float, float* %scevgep30253026.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3028.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_3024.us.us, float %_p_scalar_3027.us.us) #30
  store float %p_3028.us.us, float* %scevgep30253026.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4202.us.us, label %polly.cond3073.us.us, label %polly.cond3051.us.us

polly.cond3051.us.us:                             ; preds = %polly.cond3029.us.us
  %polly.access.add.Packed_B3044.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 6
  %polly.access.Packed_B3045.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3044.us.us
  %_p_scalar_3046.us.us = load float, float* %polly.access.Packed_B3045.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3049.us.us = load float, float* %scevgep30473048.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3050.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_3046.us.us, float %_p_scalar_3049.us.us) #30
  store float %p_3050.us.us, float* %scevgep30473048.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4203.us.us, label %polly.cond3073.us.us, label %polly.stmt.for.body10.us.i3055.us.us

polly.stmt.for.body10.us.i3055.us.us:             ; preds = %polly.cond3051.us.us
  %polly.access.add.Packed_B3066.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 7
  %polly.access.Packed_B3067.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3066.us.us
  %_p_scalar_3068.us.us = load float, float* %polly.access.Packed_B3067.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3071.us.us = load float, float* %scevgep30693070.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3072.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2907.us.us, float %_p_scalar_3068.us.us, float %_p_scalar_3071.us.us) #30
  store float %p_3072.us.us, float* %scevgep30693070.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3073.us.us

polly.cond3073.us.us:                             ; preds = %polly.stmt.for.body10.us.i3055.us.us, %polly.cond3051.us.us, %polly.cond3029.us.us, %polly.cond3007.us.us, %polly.cond2985.us.us, %polly.cond2963.us.us, %polly.cond2941.us.us
  br i1 %.not4185.us, label %polly.merge3074.us.us, label %polly.cond3095.us.us

polly.cond3073.us.us.thread:                      ; preds = %polly.cond2919.us.us
  br i1 %.not4185.us, label %polly.merge3074.us.us, label %polly.cond3095.us.us.thread

polly.cond3095.us.us.thread:                      ; preds = %polly.cond3073.us.us.thread
  %polly.access.add.Packed_A3081.us.us4362 = or i64 %polly.access.mul.Packed_A2904.us.us, 1
  %polly.access.Packed_A3082.us.us4363 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3081.us.us4362
  %_p_scalar_3083.us.us4364 = load float, float* %polly.access.Packed_A3082.us.us4363, align 4, !alias.scope !145, !noalias !146
  br label %polly.cond3249.us.us.sink.split

polly.cond3095.us.us:                             ; preds = %polly.cond3073.us.us
  %polly.access.add.Packed_A3081.us.us = or i64 %polly.access.mul.Packed_A2904.us.us, 1
  %polly.access.Packed_A3082.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3081.us.us
  %_p_scalar_3083.us.us = load float, float* %polly.access.Packed_A3082.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_3093.us.us = load float, float* %scevgep30913092.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3094.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_2914.us.us, float %_p_scalar_3093.us.us) #30
  store float %p_3094.us.us, float* %scevgep30913092.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4184.us.us, label %polly.cond3249.us.us, label %polly.cond3117.us.us

polly.cond3117.us.us:                             ; preds = %polly.cond3095.us.us
  %polly.access.add.Packed_B3110.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 1
  %polly.access.Packed_B3111.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3110.us.us
  %_p_scalar_3112.us.us = load float, float* %polly.access.Packed_B3111.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3115.us.us = load float, float* %scevgep31133114.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3116.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3112.us.us, float %_p_scalar_3115.us.us) #30
  store float %p_3116.us.us, float* %scevgep31133114.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4198.us.us, label %polly.cond3249.us.us, label %polly.cond3139.us.us

polly.cond3139.us.us:                             ; preds = %polly.cond3117.us.us
  %polly.access.add.Packed_B3132.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 2
  %polly.access.Packed_B3133.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3132.us.us
  %_p_scalar_3134.us.us = load float, float* %polly.access.Packed_B3133.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3137.us.us = load float, float* %scevgep31353136.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3138.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3134.us.us, float %_p_scalar_3137.us.us) #30
  store float %p_3138.us.us, float* %scevgep31353136.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4199.us.us, label %polly.cond3249.us.us, label %polly.cond3161.us.us

polly.cond3161.us.us:                             ; preds = %polly.cond3139.us.us
  %polly.access.add.Packed_B3154.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 3
  %polly.access.Packed_B3155.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3154.us.us
  %_p_scalar_3156.us.us = load float, float* %polly.access.Packed_B3155.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3159.us.us = load float, float* %scevgep31573158.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3160.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3156.us.us, float %_p_scalar_3159.us.us) #30
  store float %p_3160.us.us, float* %scevgep31573158.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4200.us.us, label %polly.cond3249.us.us, label %polly.cond3183.us.us

polly.cond3183.us.us:                             ; preds = %polly.cond3161.us.us
  %polly.access.add.Packed_B3176.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 4
  %polly.access.Packed_B3177.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3176.us.us
  %_p_scalar_3178.us.us = load float, float* %polly.access.Packed_B3177.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3181.us.us = load float, float* %scevgep31793180.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3182.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3178.us.us, float %_p_scalar_3181.us.us) #30
  store float %p_3182.us.us, float* %scevgep31793180.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4201.us.us, label %polly.cond3249.us.us, label %polly.cond3205.us.us

polly.cond3205.us.us:                             ; preds = %polly.cond3183.us.us
  %polly.access.add.Packed_B3198.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 5
  %polly.access.Packed_B3199.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3198.us.us
  %_p_scalar_3200.us.us = load float, float* %polly.access.Packed_B3199.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3203.us.us = load float, float* %scevgep32013202.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3204.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3200.us.us, float %_p_scalar_3203.us.us) #30
  store float %p_3204.us.us, float* %scevgep32013202.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4202.us.us, label %polly.cond3249.us.us, label %polly.cond3227.us.us

polly.cond3227.us.us:                             ; preds = %polly.cond3205.us.us
  %polly.access.add.Packed_B3220.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 6
  %polly.access.Packed_B3221.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3220.us.us
  %_p_scalar_3222.us.us = load float, float* %polly.access.Packed_B3221.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3225.us.us = load float, float* %scevgep32233224.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3226.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us, float %_p_scalar_3222.us.us, float %_p_scalar_3225.us.us) #30
  store float %p_3226.us.us, float* %scevgep32233224.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4203.us.us, label %polly.cond3249.us.us, label %polly.stmt.for.body10.us.i3231.us.us

polly.stmt.for.body10.us.i3231.us.us:             ; preds = %polly.cond3227.us.us
  %polly.access.add.Packed_B3242.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 7
  %polly.access.Packed_B3243.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3242.us.us
  %_p_scalar_3244.us.us = load float, float* %polly.access.Packed_B3243.us.us, align 4, !alias.scope !139, !noalias !140
  br label %polly.cond3249.us.us.sink.split

polly.cond3249.us.us.sink.split:                  ; preds = %polly.stmt.for.body10.us.i3231.us.us, %polly.cond3095.us.us.thread
  %scevgep30913092.us.us.sink4386 = phi float* [ %scevgep30913092.us.us, %polly.cond3095.us.us.thread ], [ %scevgep32453246.us.us, %polly.stmt.for.body10.us.i3231.us.us ]
  %_p_scalar_2914.us.us.sink = phi float [ %_p_scalar_2914.us.us, %polly.cond3095.us.us.thread ], [ %_p_scalar_3244.us.us, %polly.stmt.for.body10.us.i3231.us.us ]
  %_p_scalar_3083.us.us4364.sink = phi float [ %_p_scalar_3083.us.us4364, %polly.cond3095.us.us.thread ], [ %_p_scalar_3083.us.us, %polly.stmt.for.body10.us.i3231.us.us ]
  %_p_scalar_3093.us.us4365 = load float, float* %scevgep30913092.us.us.sink4386, align 4, !alias.scope !149, !noalias !150
  %p_3094.us.us4366 = call float @llvm.fmuladd.f32(float %_p_scalar_3083.us.us4364.sink, float %_p_scalar_2914.us.us.sink, float %_p_scalar_3093.us.us4365) #30
  store float %p_3094.us.us4366, float* %scevgep30913092.us.us.sink4386, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond3249.us.us

polly.cond3249.us.us:                             ; preds = %polly.cond3249.us.us.sink.split, %polly.cond3227.us.us, %polly.cond3205.us.us, %polly.cond3183.us.us, %polly.cond3161.us.us, %polly.cond3139.us.us, %polly.cond3117.us.us, %polly.cond3095.us.us
  br i1 %525, label %polly.cond3271.us.us, label %polly.merge3074.us.us

polly.cond3271.us.us:                             ; preds = %polly.cond3249.us.us
  %polly.access.add.Packed_A3257.us.us = or i64 %polly.access.mul.Packed_A2904.us.us, 2
  %polly.access.Packed_A3258.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A3257.us.us
  %_p_scalar_3259.us.us = load float, float* %polly.access.Packed_A3258.us.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_3269.us.us = load float, float* %scevgep32673268.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3270.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_2914.us.us, float %_p_scalar_3269.us.us) #30
  store float %p_3270.us.us, float* %scevgep32673268.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4184.us.us, label %polly.merge3074.us.us, label %polly.cond3293.us.us

polly.cond3293.us.us:                             ; preds = %polly.cond3271.us.us
  %polly.access.add.Packed_B3286.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 1
  %polly.access.Packed_B3287.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3286.us.us
  %_p_scalar_3288.us.us = load float, float* %polly.access.Packed_B3287.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3291.us.us = load float, float* %scevgep32893290.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3292.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3288.us.us, float %_p_scalar_3291.us.us) #30
  store float %p_3292.us.us, float* %scevgep32893290.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4198.us.us, label %polly.merge3074.us.us, label %polly.cond3315.us.us

polly.cond3315.us.us:                             ; preds = %polly.cond3293.us.us
  %polly.access.add.Packed_B3308.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 2
  %polly.access.Packed_B3309.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3308.us.us
  %_p_scalar_3310.us.us = load float, float* %polly.access.Packed_B3309.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3313.us.us = load float, float* %scevgep33113312.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3314.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3310.us.us, float %_p_scalar_3313.us.us) #30
  store float %p_3314.us.us, float* %scevgep33113312.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4199.us.us, label %polly.merge3074.us.us, label %polly.cond3337.us.us

polly.cond3337.us.us:                             ; preds = %polly.cond3315.us.us
  %polly.access.add.Packed_B3330.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 3
  %polly.access.Packed_B3331.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3330.us.us
  %_p_scalar_3332.us.us = load float, float* %polly.access.Packed_B3331.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3335.us.us = load float, float* %scevgep33333334.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3336.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3332.us.us, float %_p_scalar_3335.us.us) #30
  store float %p_3336.us.us, float* %scevgep33333334.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4200.us.us, label %polly.merge3074.us.us, label %polly.cond3359.us.us

polly.cond3359.us.us:                             ; preds = %polly.cond3337.us.us
  %polly.access.add.Packed_B3352.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 4
  %polly.access.Packed_B3353.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3352.us.us
  %_p_scalar_3354.us.us = load float, float* %polly.access.Packed_B3353.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_3357.us.us = load float, float* %scevgep33553356.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3358.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3354.us.us, float %_p_scalar_3357.us.us) #30
  store float %p_3358.us.us, float* %scevgep33553356.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4201.us.us, label %polly.merge3074.us.us, label %polly.cond3381.us.us

polly.cond3381.us.us:                             ; preds = %polly.cond3359.us.us
  %polly.access.add.Packed_B3374.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 5
  %polly.access.Packed_B3375.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3374.us.us
  %_p_scalar_3376.us.us = load float, float* %polly.access.Packed_B3375.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3379.us.us = load float, float* %scevgep33773378.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3380.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3376.us.us, float %_p_scalar_3379.us.us) #30
  store float %p_3380.us.us, float* %scevgep33773378.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4202.us.us, label %polly.merge3074.us.us, label %polly.cond3403.us.us

polly.cond3403.us.us:                             ; preds = %polly.cond3381.us.us
  %polly.access.add.Packed_B3396.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 6
  %polly.access.Packed_B3397.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3396.us.us
  %_p_scalar_3398.us.us = load float, float* %polly.access.Packed_B3397.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_3401.us.us = load float, float* %scevgep33993400.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3402.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3398.us.us, float %_p_scalar_3401.us.us) #30
  store float %p_3402.us.us, float* %scevgep33993400.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4203.us.us, label %polly.merge3074.us.us, label %polly.stmt.for.body10.us.i3407.us.us

polly.stmt.for.body10.us.i3407.us.us:             ; preds = %polly.cond3403.us.us
  %polly.access.add.Packed_B3418.us.us = or i64 %polly.access.mul.Packed_B2911.us.us, 7
  %polly.access.Packed_B3419.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B3418.us.us
  %_p_scalar_3420.us.us = load float, float* %polly.access.Packed_B3419.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_3423.us.us = load float, float* %scevgep34213422.us.us, align 4, !alias.scope !149, !noalias !150
  %p_3424.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_3259.us.us, float %_p_scalar_3420.us.us, float %_p_scalar_3423.us.us) #30
  store float %p_3424.us.us, float* %scevgep34213422.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge3074.us.us

polly.merge3074.us.us:                            ; preds = %polly.cond3073.us.us.thread, %polly.stmt.for.body10.us.i3407.us.us, %polly.cond3403.us.us, %polly.cond3381.us.us, %polly.cond3359.us.us, %polly.cond3337.us.us, %polly.cond3315.us.us, %polly.cond3293.us.us, %polly.cond3271.us.us, %polly.cond3249.us.us, %polly.cond3073.us.us
  %polly.indvar_next2899.us.us = add nuw nsw i64 %polly.indvar2898.us.us, 1
  %exitcond4337.not = icmp eq i64 %polly.indvar2898.us.us, %smin4342
  br i1 %exitcond4337.not, label %polly.loop_exit2896.loopexit.us.us, label %polly.cond2919.us.us, !llvm.loop !155

polly.loop_exit2896.loopexit.us.us:               ; preds = %polly.merge3074.us.us
  %polly.indvar_next2891.us.us = add nuw nsw i64 %polly.indvar2890.us.us, 1
  %exitcond4341.not = icmp eq i64 %polly.indvar2890.us.us, %smin4340
  br i1 %exitcond4341.not, label %polly.merge2243.us, label %polly.loop_if2893.us.us

polly.loop_if2260.us.us:                          ; preds = %polly.loop_if2252.us, %polly.loop_exit2263.loopexit.us.us
  %polly.indvar2257.us.us = phi i64 [ %polly.indvar_next2258.us.us, %polly.loop_exit2263.loopexit.us.us ], [ 0, %polly.loop_if2252.us ]
  %667 = shl nsw i64 %polly.indvar2257.us.us, 2
  %668 = add nuw nsw i64 %667, %412
  %polly.access.mul.Packed_A2270.us.us = shl nsw i64 %polly.indvar2257.us.us, 9
  %669 = mul i64 %668, %311
  %670 = add i64 %669, %367
  %scevgep2282.us.us = getelementptr i8, i8* %call.i2.i, i64 %670
  %scevgep22822283.us.us = bitcast i8* %scevgep2282.us.us to float*
  %671 = or i64 %668, 2
  %.not4206.us.us = icmp slt i64 %218, %671
  %672 = add i64 %369, %669
  %scevgep2304.us.us = getelementptr i8, i8* %call.i2.i, i64 %672
  %scevgep23042305.us.us = bitcast i8* %scevgep2304.us.us to float*
  %673 = add i64 %669, %371
  %scevgep2326.us.us = getelementptr i8, i8* %call.i2.i, i64 %673
  %scevgep23262327.us.us = bitcast i8* %scevgep2326.us.us to float*
  %674 = add i64 %669, %373
  %scevgep2348.us.us = getelementptr i8, i8* %call.i2.i, i64 %674
  %scevgep23482349.us.us = bitcast i8* %scevgep2348.us.us to float*
  %675 = add i64 %669, %375
  %scevgep2370.us.us = getelementptr i8, i8* %call.i2.i, i64 %675
  %scevgep23702371.us.us = bitcast i8* %scevgep2370.us.us to float*
  %676 = add i64 %669, %377
  %scevgep2392.us.us = getelementptr i8, i8* %call.i2.i, i64 %676
  %scevgep23922393.us.us = bitcast i8* %scevgep2392.us.us to float*
  %677 = add i64 %669, %340
  %scevgep2414.us.us = getelementptr i8, i8* %call.i2.i, i64 %677
  %scevgep24142415.us.us = bitcast i8* %scevgep2414.us.us to float*
  %678 = or i64 %668, 1
  %679 = mul i64 %678, %311
  %680 = add i64 %679, %367
  %scevgep2436.us.us = getelementptr i8, i8* %call.i2.i, i64 %680
  %scevgep24362437.us.us = bitcast i8* %scevgep2436.us.us to float*
  %681 = add i64 %369, %679
  %scevgep2458.us.us = getelementptr i8, i8* %call.i2.i, i64 %681
  %scevgep24582459.us.us = bitcast i8* %scevgep2458.us.us to float*
  %682 = add i64 %679, %371
  %scevgep2480.us.us = getelementptr i8, i8* %call.i2.i, i64 %682
  %scevgep24802481.us.us = bitcast i8* %scevgep2480.us.us to float*
  %683 = add i64 %679, %373
  %scevgep2502.us.us = getelementptr i8, i8* %call.i2.i, i64 %683
  %scevgep25022503.us.us = bitcast i8* %scevgep2502.us.us to float*
  %684 = add i64 %679, %375
  %scevgep2524.us.us = getelementptr i8, i8* %call.i2.i, i64 %684
  %scevgep25242525.us.us = bitcast i8* %scevgep2524.us.us to float*
  %685 = add i64 %679, %377
  %scevgep2546.us.us = getelementptr i8, i8* %call.i2.i, i64 %685
  %scevgep25462547.us.us = bitcast i8* %scevgep2546.us.us to float*
  %686 = add i64 %679, %340
  %scevgep2568.us.us = getelementptr i8, i8* %call.i2.i, i64 %686
  %scevgep25682569.us.us = bitcast i8* %scevgep2568.us.us to float*
  %687 = or i64 %668, 3
  %.not4207.us.us = icmp slt i64 %218, %687
  %688 = mul i64 %671, %311
  %689 = add i64 %688, %367
  %scevgep2590.us.us = getelementptr i8, i8* %call.i2.i, i64 %689
  %scevgep25902591.us.us = bitcast i8* %scevgep2590.us.us to float*
  %690 = add i64 %369, %688
  %scevgep2612.us.us = getelementptr i8, i8* %call.i2.i, i64 %690
  %scevgep26122613.us.us = bitcast i8* %scevgep2612.us.us to float*
  %691 = add i64 %688, %371
  %scevgep2634.us.us = getelementptr i8, i8* %call.i2.i, i64 %691
  %scevgep26342635.us.us = bitcast i8* %scevgep2634.us.us to float*
  %692 = add i64 %688, %373
  %scevgep2656.us.us = getelementptr i8, i8* %call.i2.i, i64 %692
  %scevgep26562657.us.us = bitcast i8* %scevgep2656.us.us to float*
  %693 = add i64 %688, %375
  %scevgep2678.us.us = getelementptr i8, i8* %call.i2.i, i64 %693
  %scevgep26782679.us.us = bitcast i8* %scevgep2678.us.us to float*
  %694 = add i64 %688, %377
  %scevgep2700.us.us = getelementptr i8, i8* %call.i2.i, i64 %694
  %scevgep27002701.us.us = bitcast i8* %scevgep2700.us.us to float*
  %695 = add i64 %688, %340
  %scevgep2722.us.us = getelementptr i8, i8* %call.i2.i, i64 %695
  %scevgep27222723.us.us = bitcast i8* %scevgep2722.us.us to float*
  %696 = add nuw nsw i64 %668, 4
  %.not4208.us.us = icmp slt i64 %218, %696
  %697 = mul i64 %687, %311
  %698 = add i64 %697, %367
  %scevgep2744.us.us = getelementptr i8, i8* %call.i2.i, i64 %698
  %scevgep27442745.us.us = bitcast i8* %scevgep2744.us.us to float*
  %699 = add i64 %369, %697
  %scevgep2766.us.us = getelementptr i8, i8* %call.i2.i, i64 %699
  %scevgep27662767.us.us = bitcast i8* %scevgep2766.us.us to float*
  %700 = add i64 %697, %371
  %scevgep2788.us.us = getelementptr i8, i8* %call.i2.i, i64 %700
  %scevgep27882789.us.us = bitcast i8* %scevgep2788.us.us to float*
  %701 = add i64 %697, %373
  %scevgep2810.us.us = getelementptr i8, i8* %call.i2.i, i64 %701
  %scevgep28102811.us.us = bitcast i8* %scevgep2810.us.us to float*
  %702 = add i64 %697, %375
  %scevgep2832.us.us = getelementptr i8, i8* %call.i2.i, i64 %702
  %scevgep28322833.us.us = bitcast i8* %scevgep2832.us.us to float*
  %703 = add i64 %697, %377
  %scevgep2854.us.us = getelementptr i8, i8* %call.i2.i, i64 %703
  %scevgep28542855.us.us = bitcast i8* %scevgep2854.us.us to float*
  %704 = add i64 %697, %340
  %scevgep2876.us.us = getelementptr i8, i8* %call.i2.i, i64 %704
  %scevgep28762877.us.us = bitcast i8* %scevgep2876.us.us to float*
  br label %polly.cond2286.us.us

polly.cond2286.us.us:                             ; preds = %polly.merge2419.us.us, %polly.loop_if2260.us.us
  %polly.indvar2265.us.us = phi i64 [ %polly.indvar_next2266.us.us, %polly.merge2419.us.us ], [ 0, %polly.loop_if2260.us.us ]
  %polly.access.add.Packed_A2271.us.us = add nuw nsw i64 %polly.indvar2265.us.us, %polly.access.mul.Packed_A2270.us.us
  %polly.access.mul.Packed_A2272.us.us = shl nsw i64 %polly.access.add.Packed_A2271.us.us, 2
  %polly.access.Packed_A2274.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A2272.us.us
  %_p_scalar_2275.us.us = load float, float* %polly.access.Packed_A2274.us.us, align 16, !alias.scope !145, !noalias !146
  %polly.access.mul.Packed_B2278.us.us = shl nsw i64 %polly.indvar2265.us.us, 3
  %polly.access.Packed_B2280.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B2278.us.us
  %_p_scalar_2281.us.us = load float, float* %polly.access.Packed_B2280.us.us, align 32, !alias.scope !139, !noalias !140
  %_p_scalar_2284.us.us = load float, float* %scevgep22822283.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2285.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2281.us.us, float %_p_scalar_2284.us.us) #30
  store float %p_2285.us.us, float* %scevgep22822283.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4205, label %polly.cond2418.us.us.thread, label %polly.cond2308.us.us

polly.cond2308.us.us:                             ; preds = %polly.cond2286.us.us
  %polly.access.add.Packed_B2301.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 1
  %polly.access.Packed_B2302.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2301.us.us
  %_p_scalar_2303.us.us = load float, float* %polly.access.Packed_B2302.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2306.us.us = load float, float* %scevgep23042305.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2307.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2303.us.us, float %_p_scalar_2306.us.us) #30
  store float %p_2307.us.us, float* %scevgep23042305.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4221, label %polly.cond2418.us.us, label %polly.cond2330.us.us

polly.cond2330.us.us:                             ; preds = %polly.cond2308.us.us
  %polly.access.add.Packed_B2323.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 2
  %polly.access.Packed_B2324.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2323.us.us
  %_p_scalar_2325.us.us = load float, float* %polly.access.Packed_B2324.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2328.us.us = load float, float* %scevgep23262327.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2329.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2325.us.us, float %_p_scalar_2328.us.us) #30
  store float %p_2329.us.us, float* %scevgep23262327.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4222, label %polly.cond2418.us.us, label %polly.cond2352.us.us

polly.cond2352.us.us:                             ; preds = %polly.cond2330.us.us
  %polly.access.add.Packed_B2345.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 3
  %polly.access.Packed_B2346.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2345.us.us
  %_p_scalar_2347.us.us = load float, float* %polly.access.Packed_B2346.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2350.us.us = load float, float* %scevgep23482349.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2351.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2347.us.us, float %_p_scalar_2350.us.us) #30
  store float %p_2351.us.us, float* %scevgep23482349.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4223, label %polly.cond2418.us.us, label %polly.cond2374.us.us

polly.cond2374.us.us:                             ; preds = %polly.cond2352.us.us
  %polly.access.add.Packed_B2367.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 4
  %polly.access.Packed_B2368.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2367.us.us
  %_p_scalar_2369.us.us = load float, float* %polly.access.Packed_B2368.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_2372.us.us = load float, float* %scevgep23702371.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2373.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2369.us.us, float %_p_scalar_2372.us.us) #30
  store float %p_2373.us.us, float* %scevgep23702371.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4224, label %polly.cond2418.us.us, label %polly.cond2396.us.us

polly.cond2396.us.us:                             ; preds = %polly.cond2374.us.us
  %polly.access.add.Packed_B2389.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 5
  %polly.access.Packed_B2390.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2389.us.us
  %_p_scalar_2391.us.us = load float, float* %polly.access.Packed_B2390.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2394.us.us = load float, float* %scevgep23922393.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2395.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2391.us.us, float %_p_scalar_2394.us.us) #30
  store float %p_2395.us.us, float* %scevgep23922393.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %378, label %polly.stmt.for.body10.us.i2400.us.us, label %polly.cond2418.us.us

polly.stmt.for.body10.us.i2400.us.us:             ; preds = %polly.cond2396.us.us
  %polly.access.add.Packed_B2411.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 6
  %polly.access.Packed_B2412.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2411.us.us
  %_p_scalar_2413.us.us = load float, float* %polly.access.Packed_B2412.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2416.us.us = load float, float* %scevgep24142415.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2417.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2275.us.us, float %_p_scalar_2413.us.us, float %_p_scalar_2416.us.us) #30
  store float %p_2417.us.us, float* %scevgep24142415.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond2418.us.us

polly.cond2418.us.us:                             ; preds = %polly.stmt.for.body10.us.i2400.us.us, %polly.cond2396.us.us, %polly.cond2374.us.us, %polly.cond2352.us.us, %polly.cond2330.us.us, %polly.cond2308.us.us
  br i1 %.not4206.us.us, label %polly.merge2419.us.us, label %polly.cond2440.us.us

polly.cond2418.us.us.thread:                      ; preds = %polly.cond2286.us.us
  br i1 %.not4206.us.us, label %polly.merge2419.us.us, label %polly.cond2440.us.us.thread

polly.cond2440.us.us.thread:                      ; preds = %polly.cond2418.us.us.thread
  %polly.access.add.Packed_A2427.us.us4367 = or i64 %polly.access.mul.Packed_A2272.us.us, 1
  %polly.access.Packed_A2428.us.us4368 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2427.us.us4367
  %_p_scalar_2429.us.us4369 = load float, float* %polly.access.Packed_A2428.us.us4368, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_2438.us.us4370 = load float, float* %scevgep24362437.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2439.us.us4371 = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us4369, float %_p_scalar_2281.us.us, float %_p_scalar_2438.us.us4370) #30
  store float %p_2439.us.us4371, float* %scevgep24362437.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond2572.us.us

polly.cond2440.us.us:                             ; preds = %polly.cond2418.us.us
  %polly.access.add.Packed_A2427.us.us = or i64 %polly.access.mul.Packed_A2272.us.us, 1
  %polly.access.Packed_A2428.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2427.us.us
  %_p_scalar_2429.us.us = load float, float* %polly.access.Packed_A2428.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_2438.us.us = load float, float* %scevgep24362437.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2439.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2281.us.us, float %_p_scalar_2438.us.us) #30
  store float %p_2439.us.us, float* %scevgep24362437.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4205, label %polly.cond2572.us.us, label %polly.cond2462.us.us

polly.cond2462.us.us:                             ; preds = %polly.cond2440.us.us
  %polly.access.add.Packed_B2455.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 1
  %polly.access.Packed_B2456.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2455.us.us
  %_p_scalar_2457.us.us = load float, float* %polly.access.Packed_B2456.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2460.us.us = load float, float* %scevgep24582459.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2461.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2457.us.us, float %_p_scalar_2460.us.us) #30
  store float %p_2461.us.us, float* %scevgep24582459.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4221, label %polly.cond2572.us.us, label %polly.cond2484.us.us

polly.cond2484.us.us:                             ; preds = %polly.cond2462.us.us
  %polly.access.add.Packed_B2477.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 2
  %polly.access.Packed_B2478.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2477.us.us
  %_p_scalar_2479.us.us = load float, float* %polly.access.Packed_B2478.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2482.us.us = load float, float* %scevgep24802481.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2483.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2479.us.us, float %_p_scalar_2482.us.us) #30
  store float %p_2483.us.us, float* %scevgep24802481.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4222, label %polly.cond2572.us.us, label %polly.cond2506.us.us

polly.cond2506.us.us:                             ; preds = %polly.cond2484.us.us
  %polly.access.add.Packed_B2499.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 3
  %polly.access.Packed_B2500.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2499.us.us
  %_p_scalar_2501.us.us = load float, float* %polly.access.Packed_B2500.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2504.us.us = load float, float* %scevgep25022503.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2505.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2501.us.us, float %_p_scalar_2504.us.us) #30
  store float %p_2505.us.us, float* %scevgep25022503.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4223, label %polly.cond2572.us.us, label %polly.cond2528.us.us

polly.cond2528.us.us:                             ; preds = %polly.cond2506.us.us
  %polly.access.add.Packed_B2521.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 4
  %polly.access.Packed_B2522.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2521.us.us
  %_p_scalar_2523.us.us = load float, float* %polly.access.Packed_B2522.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_2526.us.us = load float, float* %scevgep25242525.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2527.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2523.us.us, float %_p_scalar_2526.us.us) #30
  store float %p_2527.us.us, float* %scevgep25242525.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4224, label %polly.cond2572.us.us, label %polly.cond2550.us.us

polly.cond2550.us.us:                             ; preds = %polly.cond2528.us.us
  %polly.access.add.Packed_B2543.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 5
  %polly.access.Packed_B2544.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2543.us.us
  %_p_scalar_2545.us.us = load float, float* %polly.access.Packed_B2544.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2548.us.us = load float, float* %scevgep25462547.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2549.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2545.us.us, float %_p_scalar_2548.us.us) #30
  store float %p_2549.us.us, float* %scevgep25462547.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %378, label %polly.stmt.for.body10.us.i2554.us.us, label %polly.cond2572.us.us

polly.stmt.for.body10.us.i2554.us.us:             ; preds = %polly.cond2550.us.us
  %polly.access.add.Packed_B2565.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 6
  %polly.access.Packed_B2566.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2565.us.us
  %_p_scalar_2567.us.us = load float, float* %polly.access.Packed_B2566.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2570.us.us = load float, float* %scevgep25682569.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2571.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2429.us.us, float %_p_scalar_2567.us.us, float %_p_scalar_2570.us.us) #30
  store float %p_2571.us.us, float* %scevgep25682569.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond2572.us.us

polly.cond2572.us.us:                             ; preds = %polly.cond2440.us.us.thread, %polly.stmt.for.body10.us.i2554.us.us, %polly.cond2550.us.us, %polly.cond2528.us.us, %polly.cond2506.us.us, %polly.cond2484.us.us, %polly.cond2462.us.us, %polly.cond2440.us.us
  br i1 %.not4207.us.us, label %polly.merge2419.us.us, label %polly.cond2594.us.us

polly.cond2594.us.us:                             ; preds = %polly.cond2572.us.us
  %polly.access.add.Packed_A2581.us.us = or i64 %polly.access.mul.Packed_A2272.us.us, 2
  %polly.access.Packed_A2582.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2581.us.us
  %_p_scalar_2583.us.us = load float, float* %polly.access.Packed_A2582.us.us, align 8, !alias.scope !145, !noalias !146
  %_p_scalar_2592.us.us = load float, float* %scevgep25902591.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2593.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2281.us.us, float %_p_scalar_2592.us.us) #30
  store float %p_2593.us.us, float* %scevgep25902591.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4205, label %polly.cond2726.us.us.thread, label %polly.cond2616.us.us

polly.cond2616.us.us:                             ; preds = %polly.cond2594.us.us
  %polly.access.add.Packed_B2609.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 1
  %polly.access.Packed_B2610.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2609.us.us
  %_p_scalar_2611.us.us = load float, float* %polly.access.Packed_B2610.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2614.us.us = load float, float* %scevgep26122613.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2615.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2611.us.us, float %_p_scalar_2614.us.us) #30
  store float %p_2615.us.us, float* %scevgep26122613.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4221, label %polly.cond2726.us.us, label %polly.cond2638.us.us

polly.cond2638.us.us:                             ; preds = %polly.cond2616.us.us
  %polly.access.add.Packed_B2631.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 2
  %polly.access.Packed_B2632.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2631.us.us
  %_p_scalar_2633.us.us = load float, float* %polly.access.Packed_B2632.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2636.us.us = load float, float* %scevgep26342635.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2637.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2633.us.us, float %_p_scalar_2636.us.us) #30
  store float %p_2637.us.us, float* %scevgep26342635.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4222, label %polly.cond2726.us.us, label %polly.cond2660.us.us

polly.cond2660.us.us:                             ; preds = %polly.cond2638.us.us
  %polly.access.add.Packed_B2653.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 3
  %polly.access.Packed_B2654.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2653.us.us
  %_p_scalar_2655.us.us = load float, float* %polly.access.Packed_B2654.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2658.us.us = load float, float* %scevgep26562657.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2659.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2655.us.us, float %_p_scalar_2658.us.us) #30
  store float %p_2659.us.us, float* %scevgep26562657.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4223, label %polly.cond2726.us.us, label %polly.cond2682.us.us

polly.cond2682.us.us:                             ; preds = %polly.cond2660.us.us
  %polly.access.add.Packed_B2675.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 4
  %polly.access.Packed_B2676.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2675.us.us
  %_p_scalar_2677.us.us = load float, float* %polly.access.Packed_B2676.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_2680.us.us = load float, float* %scevgep26782679.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2681.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2677.us.us, float %_p_scalar_2680.us.us) #30
  store float %p_2681.us.us, float* %scevgep26782679.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4224, label %polly.cond2726.us.us, label %polly.cond2704.us.us

polly.cond2704.us.us:                             ; preds = %polly.cond2682.us.us
  %polly.access.add.Packed_B2697.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 5
  %polly.access.Packed_B2698.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2697.us.us
  %_p_scalar_2699.us.us = load float, float* %polly.access.Packed_B2698.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2702.us.us = load float, float* %scevgep27002701.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2703.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2699.us.us, float %_p_scalar_2702.us.us) #30
  store float %p_2703.us.us, float* %scevgep27002701.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %378, label %polly.stmt.for.body10.us.i2708.us.us, label %polly.cond2726.us.us

polly.stmt.for.body10.us.i2708.us.us:             ; preds = %polly.cond2704.us.us
  %polly.access.add.Packed_B2719.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 6
  %polly.access.Packed_B2720.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2719.us.us
  %_p_scalar_2721.us.us = load float, float* %polly.access.Packed_B2720.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2724.us.us = load float, float* %scevgep27222723.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2725.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2583.us.us, float %_p_scalar_2721.us.us, float %_p_scalar_2724.us.us) #30
  store float %p_2725.us.us, float* %scevgep27222723.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.cond2726.us.us

polly.cond2726.us.us:                             ; preds = %polly.stmt.for.body10.us.i2708.us.us, %polly.cond2704.us.us, %polly.cond2682.us.us, %polly.cond2660.us.us, %polly.cond2638.us.us, %polly.cond2616.us.us
  br i1 %.not4208.us.us, label %polly.merge2419.us.us, label %polly.cond2748.us.us

polly.cond2726.us.us.thread:                      ; preds = %polly.cond2594.us.us
  br i1 %.not4208.us.us, label %polly.merge2419.us.us, label %polly.cond2748.us.us.thread

polly.cond2748.us.us.thread:                      ; preds = %polly.cond2726.us.us.thread
  %polly.access.add.Packed_A2735.us.us4372 = or i64 %polly.access.mul.Packed_A2272.us.us, 3
  %polly.access.Packed_A2736.us.us4373 = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2735.us.us4372
  %_p_scalar_2737.us.us4374 = load float, float* %polly.access.Packed_A2736.us.us4373, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_2746.us.us4375 = load float, float* %scevgep27442745.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2747.us.us4376 = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us4374, float %_p_scalar_2281.us.us, float %_p_scalar_2746.us.us4375) #30
  store float %p_2747.us.us4376, float* %scevgep27442745.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge2419.us.us

polly.cond2748.us.us:                             ; preds = %polly.cond2726.us.us
  %polly.access.add.Packed_A2735.us.us = or i64 %polly.access.mul.Packed_A2272.us.us, 3
  %polly.access.Packed_A2736.us.us = getelementptr [24 x [512 x [4 x float]]], [24 x [512 x [4 x float]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A2735.us.us
  %_p_scalar_2737.us.us = load float, float* %polly.access.Packed_A2736.us.us, align 4, !alias.scope !145, !noalias !146
  %_p_scalar_2746.us.us = load float, float* %scevgep27442745.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2747.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2281.us.us, float %_p_scalar_2746.us.us) #30
  store float %p_2747.us.us, float* %scevgep27442745.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4205, label %polly.merge2419.us.us, label %polly.cond2770.us.us

polly.cond2770.us.us:                             ; preds = %polly.cond2748.us.us
  %polly.access.add.Packed_B2763.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 1
  %polly.access.Packed_B2764.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2763.us.us
  %_p_scalar_2765.us.us = load float, float* %polly.access.Packed_B2764.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2768.us.us = load float, float* %scevgep27662767.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2769.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2765.us.us, float %_p_scalar_2768.us.us) #30
  store float %p_2769.us.us, float* %scevgep27662767.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4221, label %polly.merge2419.us.us, label %polly.cond2792.us.us

polly.cond2792.us.us:                             ; preds = %polly.cond2770.us.us
  %polly.access.add.Packed_B2785.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 2
  %polly.access.Packed_B2786.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2785.us.us
  %_p_scalar_2787.us.us = load float, float* %polly.access.Packed_B2786.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2790.us.us = load float, float* %scevgep27882789.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2791.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2787.us.us, float %_p_scalar_2790.us.us) #30
  store float %p_2791.us.us, float* %scevgep27882789.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4222, label %polly.merge2419.us.us, label %polly.cond2814.us.us

polly.cond2814.us.us:                             ; preds = %polly.cond2792.us.us
  %polly.access.add.Packed_B2807.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 3
  %polly.access.Packed_B2808.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2807.us.us
  %_p_scalar_2809.us.us = load float, float* %polly.access.Packed_B2808.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2812.us.us = load float, float* %scevgep28102811.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2813.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2809.us.us, float %_p_scalar_2812.us.us) #30
  store float %p_2813.us.us, float* %scevgep28102811.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4223, label %polly.merge2419.us.us, label %polly.cond2836.us.us

polly.cond2836.us.us:                             ; preds = %polly.cond2814.us.us
  %polly.access.add.Packed_B2829.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 4
  %polly.access.Packed_B2830.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2829.us.us
  %_p_scalar_2831.us.us = load float, float* %polly.access.Packed_B2830.us.us, align 16, !alias.scope !139, !noalias !140
  %_p_scalar_2834.us.us = load float, float* %scevgep28322833.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2835.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2831.us.us, float %_p_scalar_2834.us.us) #30
  store float %p_2835.us.us, float* %scevgep28322833.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %.not4224, label %polly.merge2419.us.us, label %polly.cond2858.us.us

polly.cond2858.us.us:                             ; preds = %polly.cond2836.us.us
  %polly.access.add.Packed_B2851.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 5
  %polly.access.Packed_B2852.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2851.us.us
  %_p_scalar_2853.us.us = load float, float* %polly.access.Packed_B2852.us.us, align 4, !alias.scope !139, !noalias !140
  %_p_scalar_2856.us.us = load float, float* %scevgep28542855.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2857.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2853.us.us, float %_p_scalar_2856.us.us) #30
  store float %p_2857.us.us, float* %scevgep28542855.us.us, align 4, !alias.scope !149, !noalias !150
  br i1 %378, label %polly.stmt.for.body10.us.i2862.us.us, label %polly.merge2419.us.us

polly.stmt.for.body10.us.i2862.us.us:             ; preds = %polly.cond2858.us.us
  %polly.access.add.Packed_B2873.us.us = or i64 %polly.access.mul.Packed_B2278.us.us, 6
  %polly.access.Packed_B2874.us.us = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B2873.us.us
  %_p_scalar_2875.us.us = load float, float* %polly.access.Packed_B2874.us.us, align 8, !alias.scope !139, !noalias !140
  %_p_scalar_2878.us.us = load float, float* %scevgep28762877.us.us, align 4, !alias.scope !149, !noalias !150
  %p_2879.us.us = call float @llvm.fmuladd.f32(float %_p_scalar_2737.us.us, float %_p_scalar_2875.us.us, float %_p_scalar_2878.us.us) #30
  store float %p_2879.us.us, float* %scevgep28762877.us.us, align 4, !alias.scope !149, !noalias !150
  br label %polly.merge2419.us.us

polly.merge2419.us.us:                            ; preds = %polly.cond2748.us.us.thread, %polly.cond2726.us.us.thread, %polly.cond2418.us.us.thread, %polly.stmt.for.body10.us.i2862.us.us, %polly.cond2858.us.us, %polly.cond2836.us.us, %polly.cond2814.us.us, %polly.cond2792.us.us, %polly.cond2770.us.us, %polly.cond2748.us.us, %polly.cond2726.us.us, %polly.cond2572.us.us, %polly.cond2418.us.us
  %polly.indvar_next2266.us.us = add nuw nsw i64 %polly.indvar2265.us.us, 1
  %exitcond4343.not = icmp eq i64 %polly.indvar2265.us.us, %smin4342
  br i1 %exitcond4343.not, label %polly.loop_exit2263.loopexit.us.us, label %polly.cond2286.us.us, !llvm.loop !156

polly.loop_exit2263.loopexit.us.us:               ; preds = %polly.merge2419.us.us
  %polly.indvar_next2258.us.us = add nuw nsw i64 %polly.indvar2257.us.us, 1
  %exitcond4345.not = icmp eq i64 %polly.indvar2257.us.us, %smin4344
  br i1 %exitcond4345.not, label %polly.merge2243.us, label %polly.loop_if2260.us.us

polly.loop_preheader581.split:                    ; preds = %polly.loop_preheader581
  br i1 %polly.loop_guard598.not.fr, label %polly.loop_exit582, label %polly.loop_if586.preheader

polly.loop_if586.preheader:                       ; preds = %polly.loop_preheader581.split
  %min.iters.check4578 = icmp ult i64 %346, 2
  %n.vec4581 = and i64 %346, -2
  %ind.end4583 = add i64 %353, %n.vec4581
  %cmp.n4584 = icmp eq i64 %346, %n.vec4581
  br label %polly.loop_if586

polly.loop_if586:                                 ; preds = %polly.loop_if586.preheader, %polly.loop_if608
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_if608 ], [ 511, %polly.loop_if586.preheader ]
  %polly.indvar583 = phi i64 [ %polly.indvar_next584, %polly.loop_if608 ], [ 0, %polly.loop_if586.preheader ]
  %smin = call i64 @llvm.smin.i64(i64 %indvars.iv, i64 %.res)
  %705 = shl nsw i64 %polly.indvar583, 9
  %706 = or i64 %705, 511
  %707 = call i64 @llvm.smin.i64(i64 %.res, i64 %706)
  %polly.loop_guard590.not = icmp sgt i64 %705, %707
  br i1 %polly.loop_guard590.not, label %polly.loop_if608, label %polly.loop_if594.preheader

polly.loop_if594.preheader:                       ; preds = %polly.loop_if586
  %708 = sub nsw i64 %356, %polly.indvar583
  br label %polly.loop_if594

polly.loop_exit597.loopexit:                      ; preds = %polly.loop_header595, %middle.block4576
  %polly.indvar_next592 = add nuw i64 %polly.indvar591, 1
  %exitcond.not = icmp eq i64 %polly.indvar591, %smin
  br i1 %exitcond.not, label %polly.loop_if608, label %polly.loop_if594

polly.loop_if594:                                 ; preds = %polly.loop_if594.preheader, %polly.loop_exit597.loopexit
  %polly.indvar591 = phi i64 [ %polly.indvar_next592, %polly.loop_exit597.loopexit ], [ %705, %polly.loop_if594.preheader ]
  %polly.access.mul.602 = mul nsw i64 %polly.indvar591, %219
  br i1 %min.iters.check4578, label %polly.loop_header595.preheader, label %vector.body4585

vector.body4585:                                  ; preds = %polly.loop_if594, %vector.body4585
  %index4586 = phi i64 [ %index.next4590, %vector.body4585 ], [ 0, %polly.loop_if594 ]
  %offset.idx4587 = add i64 %353, %index4586
  %induction4589 = or i64 %offset.idx4587, 1
  %709 = add nsw i64 %offset.idx4587, %polly.access.mul.602
  %710 = add nsw i64 %induction4589, %polly.access.mul.602
  %711 = getelementptr float, float* %217, i64 %709
  %712 = getelementptr float, float* %217, i64 %710
  %713 = load float, float* %711, align 4, !alias.scope !131, !noalias !134
  %714 = load float, float* %712, align 4, !alias.scope !131, !noalias !134
  %715 = lshr i64 %offset.idx4587, 3
  %716 = lshr i64 %offset.idx4587, 3
  %717 = add i64 %708, %715
  %718 = add i64 %708, %716
  %719 = shl i64 %717, 9
  %720 = shl i64 %718, 9
  %721 = add i64 %719, %polly.indvar591
  %722 = add i64 %720, %polly.indvar591
  %723 = shl nsw i64 %721, 3
  %724 = shl nsw i64 %722, 3
  %725 = and i64 %offset.idx4587, 6
  %726 = and i64 %induction4589, 7
  %727 = or i64 %723, %725
  %728 = or i64 %724, %726
  %729 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %727
  %730 = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %728
  store float %713, float* %729, align 8, !alias.scope !139, !noalias !140
  store float %714, float* %730, align 4, !alias.scope !139, !noalias !140
  %index.next4590 = add nuw i64 %index4586, 2
  %731 = icmp eq i64 %index.next4590, %n.vec4581
  br i1 %731, label %middle.block4576, label %vector.body4585, !llvm.loop !157

middle.block4576:                                 ; preds = %vector.body4585
  br i1 %cmp.n4584, label %polly.loop_exit597.loopexit, label %polly.loop_header595.preheader

polly.loop_header595.preheader:                   ; preds = %polly.loop_if594, %middle.block4576
  %polly.indvar599.ph = phi i64 [ %353, %polly.loop_if594 ], [ %ind.end4583, %middle.block4576 ]
  br label %polly.loop_header595

polly.loop_header595:                             ; preds = %polly.loop_header595.preheader, %polly.loop_header595
  %polly.indvar599 = phi i64 [ %polly.indvar_next600, %polly.loop_header595 ], [ %polly.indvar599.ph, %polly.loop_header595.preheader ]
  %polly.access.add.603 = add nsw i64 %polly.indvar599, %polly.access.mul.602
  %polly.access.604 = getelementptr float, float* %217, i64 %polly.access.add.603
  %polly.access.604.load = load float, float* %polly.access.604, align 4, !alias.scope !131, !noalias !134
  %pexp.p_div_q6054231 = lshr i64 %polly.indvar599, 3
  %reass.add = add i64 %708, %pexp.p_div_q6054231
  %reass.mul = shl i64 %reass.add, 9
  %polly.access.add.Packed_B = add i64 %reass.mul, %polly.indvar591
  %polly.access.mul.Packed_B606 = shl nsw i64 %polly.access.add.Packed_B, 3
  %pexp.pdiv_r = and i64 %polly.indvar599, 7
  %polly.access.add.Packed_B607 = or i64 %polly.access.mul.Packed_B606, %pexp.pdiv_r
  %polly.access.Packed_B = getelementptr [256 x [512 x [8 x float]]], [256 x [512 x [8 x float]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B607
  store float %polly.access.604.load, float* %polly.access.Packed_B, align 4, !alias.scope !139, !noalias !140
  %polly.indvar_next600 = add nuw nsw i64 %polly.indvar599, 1
  %polly.loop_cond601.not.not = icmp slt i64 %polly.indvar599, %355
  br i1 %polly.loop_cond601.not.not, label %polly.loop_header595, label %polly.loop_exit597.loopexit, !llvm.loop !158

polly.loop_if608:                                 ; preds = %polly.loop_exit597.loopexit, %polly.loop_if586
  %polly.indvar_next584 = add nuw nsw i64 %polly.indvar583, 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 512
  %exitcond4302.not = icmp eq i64 %polly.indvar583, %pexp.p_div_q4158
  br i1 %exitcond4302.not, label %polly.loop_exit582, label %polly.loop_if586
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
entry.split:
  %ref.tmp.i = alloca %"class.cl::sycl::device", align 8
  %ref.tmp = alloca %"class.cl::sycl::default_selector", align 8
  %ref.tmp2 = alloca %"class.std::function", align 8
  %0 = bitcast %"class.cl::sycl::default_selector"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.cl::sycl::default_selector", %"class.cl::sycl::default_selector"* %ref.tmp, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl16default_selectorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !75
  %2 = getelementptr inbounds %"class.cl::sycl::default_selector", %"class.cl::sycl::default_selector"* %ref.tmp, i64 0, i32 0
  %3 = bitcast %"class.std::function"* %ref.tmp2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %3) #30
  %_M_manager.i.i = getelementptr inbounds %"class.std::function", %"class.std::function"* %ref.tmp2, i64 0, i32 0, i32 1
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !110
  %4 = bitcast %"class.cl::sycl::device"* %ref.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #30
  %5 = load void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)*, void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl16default_selectorE, i64 0, inrange i32 0, i64 4) to void (%"class.cl::sycl::device"*, %"class.cl::sycl::device_selector"*)**), align 8
  call void %5(%"class.cl::sycl::device"* nonnull sret(%"class.cl::sycl::device") align 8 %ref.tmp.i, %"class.cl::sycl::device_selector"* noundef nonnull align 8 dereferenceable(8) %2)
  invoke void @_ZN2cl4sycl5queueC2ERKNS0_6deviceERKSt8functionIFvNS0_14exception_listEEERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %this, %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i, %"class.std::function"* noundef nonnull align 8 dereferenceable(32) %ref.tmp2, %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32) %PropList)
          to label %invoke.cont.i unwind label %lpad.body

invoke.cont.i:                                    ; preds = %entry.split
  %_M_pi.i.i.i.i = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %ref.tmp.i, i64 0, i32 0, i32 0, i32 1, i32 0
  %6 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %6, null
  br i1 %cmp.not.i.i.i.i, label %invoke.cont, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %6, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i

if.else.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i

invoke.cont.i.i.i.i.i:                            ; preds = %if.else.i.i.i.i.i.i, %if.then.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i = phi i32 [ %7, %if.then.i.i.i.i.i.i ], [ %8, %if.else.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i, label %if.then.i.i.i.i.i, label %invoke.cont

if.then.i.i.i.i.i:                                ; preds = %invoke.cont.i.i.i.i.i
  %9 = bitcast %"class.std::_Sp_counted_base"* %6 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %9, align 8, !tbaa !75
  %vfn.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i, i64 2
  %10 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i, align 8
  call void %10(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %6) #30
  %_M_weak_count.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %6, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i, label %if.else.i11.i.i.i.i.i

if.then.i9.i.i.i.i.i:                             ; preds = %if.then.i.i.i.i.i
  %11 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i

if.else.i11.i.i.i.i.i:                            ; preds = %if.then.i.i.i.i.i
  %12 = load i32, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i = add nsw i32 %12, -1
  store i32 %add.i.i10.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i

invoke.cont2.i.i.i.i.i:                           ; preds = %if.else.i11.i.i.i.i.i, %if.then.i9.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i = phi i32 [ %11, %if.then.i9.i.i.i.i.i ], [ %12, %if.else.i11.i.i.i.i.i ]
  %cmp4.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i, label %if.then5.i.i.i.i.i, label %invoke.cont

if.then5.i.i.i.i.i:                               ; preds = %invoke.cont2.i.i.i.i.i
  %vtable6.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %9, align 8, !tbaa !75
  %vfn7.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i, i64 3
  %13 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i, align 8
  call void %13(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %6) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.then5.i.i.i.i.i, %invoke.cont2.i.i.i.i.i, %invoke.cont.i.i.i.i.i, %invoke.cont.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #30
  %14 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !110
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

lpad.body:                                        ; preds = %entry.split
  %17 = landingpad { i8*, i32 }
          cleanup
  call void @_ZN2cl4sycl6deviceD2Ev(%"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %ref.tmp.i) #30
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #30
  %.pre = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !110
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
entry.split:
  %_M_start.i = getelementptr inbounds %"class.cl::sycl::detail::PropertyListBase", %"class.cl::sycl::detail::PropertyListBase"* %this, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0
  %0 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i, align 8, !tbaa !68
  %_M_finish.i = getelementptr inbounds %"class.cl::sycl::detail::PropertyListBase", %"class.cl::sycl::detail::PropertyListBase"* %this, i64 0, i32 1, i32 0, i32 0, i32 0, i32 1
  %1 = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_finish.i, align 8, !tbaa !70
  %cmp.not3.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %0, %1
  br i1 %cmp.not3.i.i.i.i, label %invoke.cont.i, label %for.body.i.i.i.i

for.body.i.i.i.i:                                 ; preds = %entry.split, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i
  %__first.addr.04.i.i.i.i = phi %"class.std::shared_ptr.0"* [ %incdec.ptr.i.i.i.i, %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i ], [ %0, %entry.split ]
  %_M_pi.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i.i.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i.i.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i, label %if.then.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i:                            ; preds = %for.body.i.i.i.i
  %_M_use_count.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i.i.i.i

if.then.i.i.i.i.i.i.i.i.i:                        ; preds = %if.then.i.i.i.i.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i.i.i.i.i

if.else.i.i.i.i.i.i.i.i.i:                        ; preds = %if.then.i.i.i.i.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i.i.i.i.i

invoke.cont.i.i.i.i.i.i.i.i:                      ; preds = %if.else.i.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i.i.i.i.i ]
  %cmp.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i.i.i.i.i, label %if.then.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont.i.i.i.i.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i.i.i.i.i, align 8
  tail call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i.i.i.i.i, label %if.else.i11.i.i.i.i.i.i.i.i

if.then.i9.i.i.i.i.i.i.i.i:                       ; preds = %if.then.i.i.i.i.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i.i.i.i.i

if.else.i11.i.i.i.i.i.i.i.i:                      ; preds = %if.then.i.i.i.i.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i.i.i.i.i, i32* %_M_weak_count.i.i.i.i.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i.i.i.i.i

invoke.cont2.i.i.i.i.i.i.i.i:                     ; preds = %if.else.i11.i.i.i.i.i.i.i.i, %if.then.i9.i.i.i.i.i.i.i.i
  %retval.0.i12.i.i.i.i.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i.i.i.i.i ]
  %cmp4.i.i.i.i.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i.i.i.i.i, label %if.then5.i.i.i.i.i.i.i.i, label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

if.then5.i.i.i.i.i.i.i.i:                         ; preds = %invoke.cont2.i.i.i.i.i.i.i.i
  %vtable6.i.i.i.i.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn7.i.i.i.i.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i.i.i.i.i, align 8
  tail call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i

_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i: ; preds = %if.then5.i.i.i.i.i.i.i.i, %invoke.cont2.i.i.i.i.i.i.i.i, %invoke.cont.i.i.i.i.i.i.i.i, %for.body.i.i.i.i
  %incdec.ptr.i.i.i.i = getelementptr inbounds %"class.std::shared_ptr.0", %"class.std::shared_ptr.0"* %__first.addr.04.i.i.i.i, i64 1
  %cmp.not.i.i.i.i = icmp eq %"class.std::shared_ptr.0"* %incdec.ptr.i.i.i.i, %1
  br i1 %cmp.not.i.i.i.i, label %invoke.cont.loopexit.i, label %for.body.i.i.i.i, !llvm.loop !77

invoke.cont.loopexit.i:                           ; preds = %_ZSt8_DestroyISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEEEvPT_.exit.i.i.i.i
  %.pre.i = load %"class.std::shared_ptr.0"*, %"class.std::shared_ptr.0"** %_M_start.i, align 8, !tbaa !68
  br label %invoke.cont.i

invoke.cont.i:                                    ; preds = %invoke.cont.loopexit.i, %entry.split
  %10 = phi %"class.std::shared_ptr.0"* [ %.pre.i, %invoke.cont.loopexit.i ], [ %0, %entry.split ]
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
entry.split:
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

invoke.cont:                                      ; preds = %entry.split
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
  %4 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %4, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont3
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %4, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %5, %if.then.i.i.i.i.i ], [ %6, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %7 = bitcast %"class.std::_Sp_counted_base"* %4 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %7, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %4) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %4, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %9 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %10 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %10, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %9, %if.then.i9.i.i.i.i ], [ %10, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl7contextD2Ev.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %7, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %11 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %11(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %4) #30
  br label %_ZN2cl4sycl7contextD2Ev.exit

_ZN2cl4sycl7contextD2Ev.exit:                     ; preds = %invoke.cont3, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #30
  %_M_pi.i.i.i10 = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %ref.tmp, i64 0, i32 0, i32 0, i32 1, i32 0
  %12 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i10, align 8, !tbaa !71
  %cmp.not.i.i.i11 = icmp eq %"class.std::_Sp_counted_base"* %12, null
  br i1 %cmp.not.i.i.i11, label %_ZN2cl4sycl6deviceD2Ev.exit, label %if.then.i.i.i13

if.then.i.i.i13:                                  ; preds = %_ZN2cl4sycl7contextD2Ev.exit
  %_M_use_count.i.i.i.i12 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i14, label %if.else.i.i.i.i.i16

if.then.i.i.i.i.i14:                              ; preds = %if.then.i.i.i13
  %13 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i12, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i19

if.else.i.i.i.i.i16:                              ; preds = %if.then.i.i.i13
  %14 = load i32, i32* %_M_use_count.i.i.i.i12, align 8, !tbaa !73
  %add.i.i.i.i.i.i15 = add nsw i32 %14, -1
  store i32 %add.i.i.i.i.i.i15, i32* %_M_use_count.i.i.i.i12, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i19

invoke.cont.i.i.i.i19:                            ; preds = %if.else.i.i.i.i.i16, %if.then.i.i.i.i.i14
  %retval.0.i.i.i.i.i17 = phi i32 [ %13, %if.then.i.i.i.i.i14 ], [ %14, %if.else.i.i.i.i.i16 ]
  %cmp.i.i.i.i18 = icmp eq i32 %retval.0.i.i.i.i.i17, 1
  br i1 %cmp.i.i.i.i18, label %if.then.i.i.i.i23, label %_ZN2cl4sycl6deviceD2Ev.exit

if.then.i.i.i.i23:                                ; preds = %invoke.cont.i.i.i.i19
  %15 = bitcast %"class.std::_Sp_counted_base"* %12 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i20 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !75
  %vfn.i.i.i.i21 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i20, i64 2
  %16 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i21, align 8
  call void %16(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  %_M_weak_count.i.i.i.i22 = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i24, label %if.else.i11.i.i.i.i26

if.then.i9.i.i.i.i24:                             ; preds = %if.then.i.i.i.i23
  %17 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i22, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i29

if.else.i11.i.i.i.i26:                            ; preds = %if.then.i.i.i.i23
  %18 = load i32, i32* %_M_weak_count.i.i.i.i22, align 4, !tbaa !73
  %add.i.i10.i.i.i.i25 = add nsw i32 %18, -1
  store i32 %add.i.i10.i.i.i.i25, i32* %_M_weak_count.i.i.i.i22, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i29

invoke.cont2.i.i.i.i29:                           ; preds = %if.else.i11.i.i.i.i26, %if.then.i9.i.i.i.i24
  %retval.0.i12.i.i.i.i27 = phi i32 [ %17, %if.then.i9.i.i.i.i24 ], [ %18, %if.else.i11.i.i.i.i26 ]
  %cmp4.i.i.i.i28 = icmp eq i32 %retval.0.i12.i.i.i.i27, 1
  br i1 %cmp4.i.i.i.i28, label %if.then5.i.i.i.i32, label %_ZN2cl4sycl6deviceD2Ev.exit

if.then5.i.i.i.i32:                               ; preds = %invoke.cont2.i.i.i.i29
  %vtable6.i.i.i.i30 = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !75
  %vfn7.i.i.i.i31 = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i30, i64 3
  %19 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i31, align 8
  call void %19(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  br label %_ZN2cl4sycl6deviceD2Ev.exit

_ZN2cl4sycl6deviceD2Ev.exit:                      ; preds = %_ZN2cl4sycl7contextD2Ev.exit, %invoke.cont.i.i.i.i19, %invoke.cont2.i.i.i.i29, %if.then5.i.i.i.i32
  %20 = bitcast i8* %call.i9 to float*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #30
  ret float* %20

lpad:                                             ; preds = %entry.split
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
entry.split:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::event", %"class.cl::sycl::event"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail10event_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl5queueD2Ev(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::queue", %"class.cl::sycl::queue"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail10queue_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #14

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #15 comdat {
.split:
  %1 = tail call i8* @__cxa_begin_catch(i8* %0) #30
  tail call void @_ZSt9terminatev() #31
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare dso_local void @_ZSt9terminatev() local_unnamed_addr

declare dso_local void @_ZN2cl4sycl5queueC2ERKNS0_6deviceERKSt8functionIFvNS0_14exception_listEEERKNS0_13property_listE(%"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16), %"class.std::function"* noundef nonnull align 8 dereferenceable(32), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32)) unnamed_addr #0

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6deviceD2Ev(%"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::device", %"class.cl::sycl::device"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail11device_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
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
entry.split:
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::context", %"class.cl::sycl::context"* %this, i64 0, i32 0, i32 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %1, %if.then.i.i.i.i ], [ %2, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %6 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %5, %if.then.i9.i.i.i ], [ %6, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl6detail12context_implELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  ret void
}

declare dso_local noundef i8* @_ZN2cl4sycl20aligned_alloc_sharedEmmRKNS0_6deviceERKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef, i64 noundef, %"class.cl::sycl::device"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32), %"struct.cl::sycl::detail::code_location"* noundef) local_unnamed_addr #0

declare dso_local noundef i8* @_ZN2cl4sycl18aligned_alloc_hostEmmRKNS0_7contextERKNS0_13property_listENS0_6detail13code_locationE(i64 noundef, i64 noundef, %"class.cl::sycl::context"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::property_list"* noundef nonnull align 8 dereferenceable(32), %"struct.cl::sycl::detail::code_location"* noundef) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl5queue11submit_implESt8functionIFvRNS0_7handlerEEERKNS0_6detail13code_locationE(%"class.cl::sycl::event"* sret(%"class.cl::sycl::event") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.std::function.18"* noundef, %"struct.cl::sycl::detail::code_location"* noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl5queue17discard_or_returnERKNS0_5eventE(%"class.cl::sycl::event"* sret(%"class.cl::sycl::event") align 8, %"class.cl::sycl::queue"* noundef nonnull align 8 dereferenceable(16), %"class.cl::sycl::event"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_ZNSt17_Function_handlerIFvRN2cl4sycl7handlerEEZ4mainEUlS3_E_E9_M_invokeERKSt9_Any_dataS3_(%"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__functor, %"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args) #12 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
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
  %__functor.val = load %class.anon*, %class.anon** %0, align 8, !tbaa !64
  %M.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 0
  %1 = load i64*, i64** %M.i, align 8, !tbaa !159
  %2 = load i64, i64* %1, align 8, !tbaa !66
  %K.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 1
  %3 = load i64*, i64** %K.i, align 8, !tbaa !161
  %4 = load i64, i64* %3, align 8, !tbaa !66
  %N2.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 2
  %5 = load i64*, i64** %N2.i, align 8, !tbaa !162
  %6 = load i64, i64* %5, align 8, !tbaa !66
  %C3.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 3
  %7 = load float**, float*** %C3.i, align 8, !tbaa !163
  %8 = load float*, float** %7, align 8, !tbaa !64
  %A4.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 4
  %9 = load float**, float*** %A4.i, align 8, !tbaa !164
  %10 = load float*, float** %9, align 8, !tbaa !64
  %B7.i = getelementptr inbounds %class.anon, %class.anon* %__functor.val, i64 0, i32 5
  %11 = load float**, float*** %B7.i, align 8, !tbaa !165
  %12 = load float*, float** %11, align 8, !tbaa !64
  %13 = bitcast <2 x i64>* %NumWorkItems.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13)
  %NumWorkItems.coerce.fca.0.gep.i.i.i = getelementptr inbounds <2 x i64>, <2 x i64>* %NumWorkItems.i.i.i, i64 0, i64 0
  store i64 %2, i64* %NumWorkItems.coerce.fca.0.gep.i.i.i, align 16
  %14 = getelementptr inbounds <2 x i64>, <2 x i64>* %NumWorkItems.i.i.i, i64 0, i64 1
  store i64 %4, i64* %14, align 8
  %MCGType.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 12
  %15 = load i32, i32* %MCGType.i.i.i.i.i, align 8, !tbaa !166
  %conv.i.i.i.i.i = and i32 %15, 255
  %cmp.not.i.i.i.i = icmp eq i32 %conv.i.i.i.i.i, 0
  br i1 %cmp.not.i.i.i.i, label %_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry.split
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

_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i: ; preds = %entry.split
  %18 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %18) #30
  %19 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 2
  %20 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i to %union.anon**
  store %union.anon* %19, %union.anon** %20, align 8, !tbaa !196
  %21 = bitcast %union.anon* %19 to i8*
  %22 = bitcast i64* %__dnew.i.i.i.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #30
  store i64 62, i64* %__dnew.i.i.i.i.i.i.i, align 8, !tbaa !66
  %call5.i.i.i10.i99.i.i.i = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i.i.i.i, i64 noundef 0)
          to label %call5.i.i.i10.i.noexc.i.i.i unwind label %lpad.i.i.i

call5.i.i.i10.i.noexc.i.i.i:                      ; preds = %_ZN2cl4sycl7handler22throwIfActionIsCreatedEv.exit.i.i.i
  %_M_p.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i99.i.i.i, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !197
  %23 = load i64, i64* %__dnew.i.i.i.i.i.i.i, align 8, !tbaa !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(62) %call5.i.i.i10.i99.i.i.i, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0), i64 62, i1 false) #30
  %_M_string_length.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i.i.i, i64 0, i32 1
  %24 = insertelement <2 x i64> poison, i64 %23, i64 0
  %25 = shufflevector <2 x i64> %24, <2 x i64> poison, <2 x i32> zeroinitializer
  %26 = bitcast i64* %_M_string_length.i.i.i.i.i.i.i.i.i to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %26, align 8, !tbaa !130
  %arrayidx.i.i.i.i.i.i.i.i = getelementptr inbounds i8, i8* %call5.i.i.i10.i99.i.i.i, i64 %23
  store i8 0, i8* %arrayidx.i.i.i.i.i.i.i.i, align 1, !tbaa !130
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #30
  invoke void @_ZN2cl4sycl7handler22verifyUsedKernelBundleERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i.i.i)
          to label %invoke.cont5.i.i.i unwind label %lpad4.i.i.i

invoke.cont5.i.i.i:                               ; preds = %call5.i.i.i10.i.noexc.i.i.i
  %27 = load i8*, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !197
  %cmp.i.i.i.i.i.i = icmp eq i8* %27, %21
  br i1 %cmp.i.i.i.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i, label %if.then.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %invoke.cont5.i.i.i
  call void @_ZdlPv(i8* noundef %27) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i: ; preds = %if.then.i.i.i.i.i, %invoke.cont5.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %18) #30
  %28 = bitcast i64* %MinFactorX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28) #30
  store i64 16, i64* %MinFactorX.i.i.i, align 8, !tbaa !66
  %29 = bitcast i64* %GoodFactorX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29) #30
  store i64 32, i64* %GoodFactorX.i.i.i, align 8, !tbaa !66
  %30 = bitcast i64* %MinRangeX.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30) #30
  store i64 1024, i64* %MinRangeX.i.i.i, align 8, !tbaa !66
  call void @_ZN2cl4sycl7handler24GetRangeRoundingSettingsERmS2_S2_(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, i64* noundef nonnull align 8 dereferenceable(8) %MinFactorX.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %GoodFactorX.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %MinRangeX.i.i.i)
  %31 = bitcast %"class.std::__cxx11::basic_string"* %KName.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %31) #30
  %32 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 2
  %33 = bitcast %"class.std::__cxx11::basic_string"* %KName.i.i.i to %union.anon**
  store %union.anon* %32, %union.anon** %33, align 8, !tbaa !196
  %34 = bitcast %union.anon* %32 to i8*
  %35 = bitcast i64* %__dnew.i.i.i.i101.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %35) #30
  store i64 59, i64* %__dnew.i.i.i.i101.i.i.i, align 8, !tbaa !66
  %call5.i.i.i10.i114.i.i.i = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %KName.i.i.i, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i101.i.i.i, i64 noundef 0)
          to label %call5.i.i.i10.i.noexc113.i.i.i unwind label %lpad10.i.i.i

call5.i.i.i10.i.noexc113.i.i.i:                   ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i.i.i
  %_M_p.i.i.i.i.i104.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i114.i.i.i, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !197
  %36 = load i64, i64* %__dnew.i.i.i.i101.i.i.i, align 8, !tbaa !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(59) %call5.i.i.i10.i114.i.i.i, i8* noundef nonnull align 1 dereferenceable(59) getelementptr inbounds ([60 x i8], [60 x i8]* @_ZTSPZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_EUlNS0_2idILi2EEEE_, i64 0, i64 0), i64 59, i1 false) #30
  %_M_string_length.i.i.i.i.i.i111.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %KName.i.i.i, i64 0, i32 1
  %37 = insertelement <2 x i64> poison, i64 %36, i64 0
  %38 = shufflevector <2 x i64> %37, <2 x i64> poison, <2 x i32> zeroinitializer
  %39 = bitcast i64* %_M_string_length.i.i.i.i.i.i111.i.i.i to <2 x i64>*
  store <2 x i64> %38, <2 x i64>* %39, align 8, !tbaa !130
  %arrayidx.i.i.i.i.i112.i.i.i = getelementptr inbounds i8, i8* %call5.i.i.i10.i114.i.i.i, i64 %36
  store i8 0, i8* %arrayidx.i.i.i.i.i112.i.i.i, align 1, !tbaa !130
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
  %42 = load i8*, i8** %_M_p.i.i.i.i.i.i.i.i, align 8, !tbaa !197
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
  store <2 x i64> %45, <2 x i64>* %46, align 8, !tbaa !66
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
  store i64 1, i64* %arrayidx.i.i.i143.i.i.i, align 8, !tbaa !66
  %arrayidx.i19.i.i144.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 1, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i19.i.i144.i.i.i, align 8, !tbaa !66
  %arrayidx.i26.i.i145.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 2, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i26.i.i145.i.i.i, align 8, !tbaa !66
  %arrayidx.i33.i.i146.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 9, i32 3, i32 0, i32 0, i64 2
  %50 = bitcast i64* %arrayidx.i33.i.i146.i.i.i to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %50, align 8, !tbaa !66
  %call.i.i.i195.i.i.i = invoke noalias noundef nonnull dereferenceable(40) i8* @_Znwm(i64 noundef 40) #32
          to label %call.i.i.i.noexc194.i.i.i unwind label %lpad14.i.i.i

call.i.i.i.noexc194.i.i.i:                        ; preds = %invoke.cont69.i.i.i
  %51 = bitcast i8* %call.i.i.i195.i.i.i to %"class.cl::sycl::detail::HostKernel"*
  %52 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %52, align 8, !tbaa !75
  %_M_manager.i.i.i20.i.i.i150.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1, i32 0, i32 1
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !110
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
  store i8* %call.i.i7778.i.i.i152.i.i.i, i8** %53, align 8, !tbaa !64
  %_M_invoker4.i.i.i.i.i154.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1, i32 1
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* @_ZNSt17_Function_handlerIFvRKN2cl4sycl7nd_itemILi2EEEEZNS1_7handler15ResetHostKernelIZZ4mainENKUlRS7_E_clES9_EUlNS1_2idILi2EEEE_NS1_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSE_IXT1_ELb1EEEEE5valueEPT_E4typeERKSJ_E20NormalizedKernelTypeE9_M_invokeERKSt9_Any_dataS5_, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker4.i.i.i.i.i154.i.i.i, align 8, !tbaa !198
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* @_ZNSt14_Function_base13_Base_managerIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS3_E_clES5_EUlNS2_2idILi2EEEE_NS2_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSA_IXT1_ELb1EEEEE5valueEPT_E4typeERKSF_E20NormalizedKernelTypeE10_M_managerERSt9_Any_dataRKSN_St18_Manager_operation, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !110
  %54 = getelementptr %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 0
  %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 17, i32 0, i32 0, i32 0, i32 0, i32 0
  %55 = load %"class.cl::sycl::detail::HostKernelBase"*, %"class.cl::sycl::detail::HostKernelBase"** %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i, align 8, !tbaa !64
  store %"class.cl::sycl::detail::HostKernelBase"* %54, %"class.cl::sycl::detail::HostKernelBase"** %_M_head_impl.i.i.i.i.i.i.i.i.i155.i.i.i, align 8, !tbaa !64
  %cmp.not.i.i.i.i156.i.i.i = icmp eq %"class.cl::sycl::detail::HostKernelBase"* %55, null
  br i1 %cmp.not.i.i.i.i156.i.i.i, label %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i, label %_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i

_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.thread.i.i.i159.i.i.i: ; preds = %_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i
  %MKernel69.i.i.i158.i.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %51, i64 0, i32 1
  br label %if.then.i.i.i29.i.i.i168.i.i.i

_ZNSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE5resetEPS3_.exit.i.i.i165.i.i.i: ; preds = %_ZNSt14_Function_baseD2Ev.exit.i.i.i157.i.i.i
  %56 = bitcast %"class.cl::sycl::detail::HostKernelBase"* %55 to void (%"class.cl::sycl::detail::HostKernelBase"*)***
  %vtable.i.i.i.i.i160.i.i.i = load void (%"class.cl::sycl::detail::HostKernelBase"*)**, void (%"class.cl::sycl::detail::HostKernelBase"*)*** %56, align 8, !tbaa !75
  %vfn.i.i.i.i.i161.i.i.i = getelementptr inbounds void (%"class.cl::sycl::detail::HostKernelBase"*)*, void (%"class.cl::sycl::detail::HostKernelBase"*)** %vtable.i.i.i.i.i160.i.i.i, i64 3
  %57 = load void (%"class.cl::sycl::detail::HostKernelBase"*)*, void (%"class.cl::sycl::detail::HostKernelBase"*)** %vfn.i.i.i.i.i161.i.i.i, align 8
  call void %57(%"class.cl::sycl::detail::HostKernelBase"* noundef nonnull align 8 dereferenceable(8) %55) #30
  %.pre.i.i.i162.i.i.i = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !110
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
  %61 = load %"class.std::type_info"*, %"class.std::type_info"** %60, align 8, !tbaa !64
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
  %64 = load i8*, i8** %__name2.i.i.i.i.i.i173.i.i.i, align 8, !tbaa !200
  %cmp.i.i.i.i.i.i174.i.i.i = icmp eq i8* %64, getelementptr inbounds ([202 x i8], [202 x i8]* @_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType, i64 0, i64 0)
  br i1 %cmp.i.i.i.i.i.i174.i.i.i, label %land.lhs.true.i.i.i.i.i180.i.i.i, label %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i

_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i:  ; preds = %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i
  %call.i7.i.i.i.i.i176.i.i.i = call i32 @strcmp(i8* noundef nonnull dereferenceable(202) getelementptr inbounds ([202 x i8], [202 x i8]* @_ZTSZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType, i64 0, i64 0), i8* noundef nonnull dereferenceable(1) %64) #30
  %cmp7.i.i.i.i.i.i177.i.i.i = icmp eq i32 %call.i7.i.i.i.i.i176.i.i.i, 0
  br i1 %cmp7.i.i.i.i.i.i177.i.i.i, label %land.lhs.true.i.i.i.i.i180.i.i.i, label %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i

land.lhs.true.i.i.i.i.i180.i.i.i:                 ; preds = %_ZNKSt9type_infoeqERKS_.exit.i.i.i.i.i178.i.i.i, %_ZNKSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE11target_typeEv.exit.i.i.i.i.i175.i.i.i
  %65 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i20.i.i.i150.i.i.i, align 8, !tbaa !110
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
  %68 = load i8*, i8** %67, align 8, !tbaa !64
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
  %73 = load %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"** %_M_start.i.i187.i.i.i, align 8, !tbaa !202
  %_M_finish.i.i.i188.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 6, i32 0, i32 0, i32 0, i32 1
  %74 = load %"class.cl::sycl::detail::ArgDesc"*, %"class.cl::sycl::detail::ArgDesc"** %_M_finish.i.i.i188.i.i.i, align 8, !tbaa !204
  %75 = icmp eq %"class.cl::sycl::detail::ArgDesc"* %74, %73
  br i1 %75, label %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i, label %invoke.cont.i.i.i189.i.i.i

invoke.cont.i.i.i189.i.i.i:                       ; preds = %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i
  store %"class.cl::sycl::detail::ArgDesc"* %73, %"class.cl::sycl::detail::ArgDesc"** %_M_finish.i.i.i188.i.i.i, align 8, !tbaa !204
  br label %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i

_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i: ; preds = %invoke.cont.i.i.i189.i.i.i, %_ZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_.exit.i.i.i.i
  invoke void @_ZN2cl4sycl7handler28extractArgsAndReqsFromLambdaEPcmPKNS0_6detail19kernel_param_desc_tEb(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560) %__args, i8* noundef %72, i64 noundef 5, %"struct.cl::sycl::detail::kernel_param_desc_t"* noundef nonnull getelementptr inbounds ([12 x %"struct.cl::sycl::detail::kernel_param_desc_t"], [12 x %"struct.cl::sycl::detail::kernel_param_desc_t"]* @_ZN2cl4sycl6detailL17kernel_signaturesE, i64 0, i64 6), i1 noundef false)
          to label %.noexc197.i.i.i unwind label %lpad14.i.i.i

.noexc197.i.i.i:                                  ; preds = %_ZNSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE5clearEv.exit.i193.i.i.i
  %MKernelName.i190.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 10
  %_M_string_length.i.i.i.i191.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 10, i32 1
  %76 = load i64, i64* %_M_string_length.i.i.i.i191.i.i.i, align 8, !tbaa !205
  %call3.i.i.i199.i.i.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %MKernelName.i190.i.i.i, i64 noundef 0, i64 noundef %76, i8* noundef getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0), i64 noundef 62)
          to label %call3.i.i.i.noexc198.i.i.i unwind label %lpad14.i.i.i

call3.i.i.i.noexc198.i.i.i:                       ; preds = %.noexc197.i.i.i
  %call8.i200.i.i.i = invoke noundef i64 @_ZN2cl4sycl6detail6OSUtil17getOSModuleHandleEPKv(i8* noundef getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0))
          to label %if.end73.i.i.i unwind label %lpad14.i.i.i

if.end73.i.i.i:                                   ; preds = %call3.i.i.i.noexc198.i.i.i
  %MOSModuleHandle.i192.i.i.i = getelementptr inbounds %"class.cl::sycl::handler", %"class.cl::sycl::handler"* %__args, i64 0, i32 19
  store i64 %call8.i200.i.i.i, i64* %MOSModuleHandle.i192.i.i.i, align 8, !tbaa !206
  store i32 16777217, i32* %MCGType.i.i.i.i.i, align 8, !tbaa !166
  %77 = load i8*, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !197
  %cmp.i.i.i204.i.i.i = icmp eq i8* %77, %34
  br i1 %cmp.i.i.i204.i.i.i, label %_ZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_.exit, label %if.then.i.i205.i.i.i

if.then.i.i205.i.i.i:                             ; preds = %if.end73.i.i.i
  call void @_ZdlPv(i8* noundef %77) #30
  br label %_ZZ4mainENKUlRN2cl4sycl7handlerEE_clES2_.exit

ehcleanup74.i.i.i:                                ; preds = %delete.notnull.i.i87.i.i.i186.i.i.i, %lpad14.i.i.i
  %.pn93.i.i.i = phi { i8*, i32 } [ %44, %lpad14.i.i.i ], [ %71, %delete.notnull.i.i87.i.i.i186.i.i.i ]
  %78 = load i8*, i8** %_M_p.i.i.i.i.i104.i.i.i, align 8, !tbaa !197
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
entry.split:
  switch i32 %__op, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry.split
  %0 = bitcast %"union.std::_Any_data"* %__dest to %"class.std::type_info"**
  store %"class.std::type_info"* bitcast ({ i8*, i8* }* @_ZTIZ4mainEUlRN2cl4sycl7handlerEE_ to %"class.std::type_info"*), %"class.std::type_info"** %0, align 8, !tbaa !64
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry.split
  %1 = bitcast %"union.std::_Any_data"* %__source to %class.anon**
  %__source.val = load %class.anon*, %class.anon** %1, align 8, !tbaa !64
  %2 = bitcast %"union.std::_Any_data"* %__dest to %class.anon**
  store %class.anon* %__source.val, %class.anon** %2, align 8, !tbaa !64
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry.split
  %3 = bitcast %"union.std::_Any_data"* %__source to i8**
  %__source.val12 = load i8*, i8** %3, align 8
  %call.i = tail call noalias noundef nonnull dereferenceable(48) i8* @_Znwm(i64 noundef 48) #32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(48) %call.i, i8* noundef nonnull align 8 dereferenceable(48) %__source.val12, i64 48, i1 false), !tbaa.struct !207
  %4 = bitcast %"union.std::_Any_data"* %__dest to i8**
  store i8* %call.i, i8** %4, align 8, !tbaa !64
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry.split
  %5 = bitcast %"union.std::_Any_data"* %__dest to %class.anon**
  %__dest.val = load %class.anon*, %class.anon** %5, align 8, !tbaa !64
  %isnull.i = icmp eq %class.anon* %__dest.val, null
  br i1 %isnull.i, label %sw.epilog, label %delete.notnull.i

delete.notnull.i:                                 ; preds = %sw.bb5
  %6 = bitcast %class.anon* %__dest.val to i8*
  tail call void @_ZdlPv(i8* noundef %6) #34
  br label %sw.epilog

sw.epilog:                                        ; preds = %delete.notnull.i, %sw.bb5, %entry.split, %sw.bb4, %sw.bb1, %sw.bb
  ret i1 false
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znwm(i64 noundef) local_unnamed_addr #21

declare dso_local void @_ZN2cl4sycl7handler22verifyUsedKernelBundleERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #0

declare dso_local void @_ZN2cl4sycl7handler24GetRangeRoundingSettingsERmS2_S2_(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560), i64* noundef nonnull align 8 dereferenceable(8), i64* noundef nonnull align 8 dereferenceable(8), i64* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef i1 @_ZN2cl4sycl7handler20DisableRangeRoundingEv(%"class.cl::sycl::handler"* noundef nonnull align 8 dereferenceable(560)) local_unnamed_addr #0

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail15checkValueRangeILi2ENS0_5rangeILi2EEEEENSt9enable_ifIXoosr3std7is_sameIT0_NS3_IXT_EEEEE5valuesr3std7is_sameIS6_NS0_2idIXT_EEEEE5valueEvE4typeERKS6_(%"class.cl::sycl::range.118"* noundef nonnull align 8 dereferenceable(16) %V) local_unnamed_addr #20 comdat personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %V, i64 0, i32 0, i32 0, i64 0
  %0 = load i64, i64* %arrayidx.i, align 8, !tbaa !66
  %cmp.i = icmp ugt i64 %0, 2147483647
  br i1 %cmp.i, label %if.then.i, label %for.cond

for.cond:                                         ; preds = %entry.split
  %arrayidx.i.1 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %V, i64 0, i32 0, i32 0, i64 1
  %1 = load i64, i64* %arrayidx.i.1, align 8, !tbaa !66
  %cmp.i.1 = icmp ugt i64 %1, 2147483647
  br i1 %cmp.i.1, label %if.then.i, label %for.cond2

if.then.i:                                        ; preds = %for.cond, %entry.split
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
entry.split:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !196
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry.split
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry.split
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !130
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !130
  store i8 %7, i8* %6, align 1, !tbaa !130
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !205
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !130
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
  %12 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %12, null
  br i1 %cmp.not.i.i.i, label %invoke.cont4, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %13 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %14 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %13, %if.then.i.i.i.i.i ], [ %14, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i10, label %invoke.cont4

if.then.i.i.i.i10:                                ; preds = %invoke.cont.i.i.i.i
  %15 = bitcast %"class.std::_Sp_counted_base"* %12 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %16 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %16(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %12, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i10
  %17 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i10
  %18 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %18, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %17, %if.then.i9.i.i.i.i ], [ %18, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %invoke.cont4

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %15, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %19 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %19(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %12) #30
  br label %invoke.cont4

lpad.i:                                           ; preds = %invoke.cont
  %20 = landingpad { i8*, i32 }
          cleanup
  %21 = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0
  call void @_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev(%"class.std::__shared_ptr.121"* noundef nonnull align 8 dereferenceable(16) %21) #30
  %22 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
  %cmp.i.i.i14 = icmp eq i8* %22, %3
  br i1 %cmp.i.i.i14, label %ehcleanup, label %if.then.i.i15

invoke.cont4:                                     ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %invoke.cont.i
  %23 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl13runtime_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %23, align 8, !tbaa !75
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %10)
  %24 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_pi.i.i = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i, label %if.else.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %if.then.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i
  %retval.0.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i ], [ %3, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i:                                    ; preds = %invoke.cont.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i ], [ %7, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  %_M_p.i.i.i.i = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i, align 8, !tbaa !197
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
entry.split:
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
  %0 = load %"class.cl::sycl::context"*, %"class.cl::sycl::context"** %_M_ptr2.i.i, align 8, !tbaa !208
  store %"class.cl::sycl::context"* %0, %"class.cl::sycl::context"** %_M_ptr.i.i, align 8, !tbaa !208
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2, i64 0, i32 0, i32 1, i32 0
  %_M_pi2.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %Context, i64 0, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi2.i.i.i, align 8, !tbaa !71
  store %"class.std::_Sp_counted_base"* %1, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry.split
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 1 acq_rel, align 4
  br label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %3, 1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit

_ZNSt10shared_ptrIN2cl4sycl7contextEEC2ERKS3_.exit: ; preds = %entry.split, %if.then.i.i.i.i.i, %if.else.i.i.i.i.i
  %4 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #30
  %5 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #30
  tail call void @llvm.experimental.noalias.scope.decl(metadata !210)
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2
  %7 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp3 to %union.anon**
  store %union.anon* %6, %union.anon** %7, align 8, !tbaa !196, !alias.scope !210
  %_M_p.i12.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %Msg, i64 0, i32 0, i32 0
  %8 = load i8*, i8** %_M_p.i12.i.i, align 8, !tbaa !197, !noalias !210
  %_M_string_length.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %Msg, i64 0, i32 1
  %9 = load i64, i64* %_M_string_length.i.i.i, align 8, !tbaa !205, !noalias !210
  %10 = bitcast i64* %__dnew.i.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #30, !noalias !210
  store i64 %9, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !66, !noalias !210
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
  store i8* %call5.i.i.i14.i.i23, i8** %_M_p.i.i.i.i.i.i, align 8, !tbaa !197, !alias.scope !210
  %12 = load i64, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !66, !noalias !210
  %_M_allocated_capacity.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2, i32 0
  store i64 %12, i64* %_M_allocated_capacity.i.i.i.i.i.i, align 8, !tbaa !130, !alias.scope !210
  br label %if.end6.i.i.i.i.i

if.end6.i.i.i.i.i:                                ; preds = %call5.i.i.i14.i.i.noexc, %if.end.if.end6_crit_edge.i.i.i.i.i
  %13 = phi i8* [ %11, %if.end.if.end6_crit_edge.i.i.i.i.i ], [ %call5.i.i.i14.i.i23, %call5.i.i.i14.i.i.noexc ]
  switch i64 %9, label %if.end.i.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i.i
    i64 0, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i
  ]

if.then.i.i.i.i.i.i.i:                            ; preds = %if.end6.i.i.i.i.i
  %14 = load i8, i8* %8, align 1, !tbaa !130
  store i8 %14, i8* %13, align 1, !tbaa !130
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i

if.end.i.i.i.i.i.i.i.i:                           ; preds = %if.end6.i.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %13, i8* align 1 %8, i64 %9, i1 false) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit.i: ; preds = %if.end.i.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i.i, %if.end6.i.i.i.i.i
  %_M_p.i13.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 0, i32 0
  %15 = load i64, i64* %__dnew.i.i.i.i.i, align 8, !tbaa !66, !noalias !210
  %_M_string_length.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 1
  store i64 %15, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !205, !alias.scope !210
  %16 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !197, !alias.scope !210
  %arrayidx.i.i.i.i.i.i = getelementptr inbounds i8, i8* %16, i64 %15
  store i8 0, i8* %arrayidx.i.i.i.i.i.i, align 1, !tbaa !130
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #30, !noalias !210
  %17 = load i64, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !205, !alias.scope !210
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
  %19 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !197, !alias.scope !210
  %arraydecay.i.i.i.i.i = bitcast %union.anon* %6 to i8*
  %cmp.i.i.i.i = icmp eq i8* %19, %arraydecay.i.i.i.i.i
  br i1 %cmp.i.i.i.i, label %ehcleanup13, label %if.then.i.i3.i

if.then.i.i3.i:                                   ; preds = %lpad.i
  call void @_ZdlPv(i8* noundef %19) #30
  br label %ehcleanup13

invoke.cont:                                      ; preds = %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc.exit.i.i
  %20 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %20) #30
  call void @llvm.experimental.noalias.scope.decl(metadata !213)
  %21 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %21) #30, !noalias !213
  %22 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp1.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %22) #30, !noalias !213
  %23 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %23) #30, !noalias !213
  invoke void (%"class.std::__cxx11::basic_string"*, i32 (i8*, i64, i8*, %"struct.std::__va_list"*)*, i64, i8*, ...) @_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_St9__va_listEmSB_z(%"class.std::__cxx11::basic_string"* nonnull sret(%"class.std::__cxx11::basic_string") align 8 %ref.tmp2.i, i32 (i8*, i64, i8*, %"struct.std::__va_list"*)* noundef nonnull @vsnprintf, i64 noundef 16, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i64 0, i64 0), i32 noundef %CLErr)
          to label %.noexc unwind label %lpad5

.noexc:                                           ; preds = %invoke.cont
  call void @llvm.experimental.noalias.scope.decl(metadata !216)
  %_M_string_length.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 1
  %24 = load i64, i64* %_M_string_length.i.i.i.i.i, align 8, !tbaa !205, !noalias !219
  %25 = and i64 %24, -2
  %cmp.i.i.i.i24 = icmp eq i64 %25, 4611686018427387902
  br i1 %cmp.i.i.i.i24, label %if.then.i.i.i.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i

if.then.i.i.i.i:                                  ; preds = %.noexc
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc.i25 unwind label %lpad.i29, !noalias !213

.noexc.i25:                                       ; preds = %if.then.i.i.i.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i: ; preds = %.noexc
  %call2.i.i16.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp2.i, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i64 0, i64 0), i64 noundef 2)
          to label %call2.i.i.noexc.i unwind label %lpad.i29, !noalias !213

call2.i.i.noexc.i:                                ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i.i
  %26 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 2
  %27 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp1.i to %union.anon**
  store %union.anon* %26, %union.anon** %27, align 8, !tbaa !196, !alias.scope !216, !noalias !213
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 0, i32 0
  %28 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197, !noalias !213
  %29 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 2
  %arraydecay.i.i.i.i.i26 = bitcast %union.anon* %29 to i8*
  %cmp.i.i1.i.i = icmp eq i8* %28, %arraydecay.i.i.i.i.i26
  br i1 %cmp.i.i1.i.i, label %if.then.i.i.i27, label %if.else.i.i.i

if.then.i.i.i27:                                  ; preds = %call2.i.i.noexc.i
  %arraydecay.i.i.i.i = bitcast %union.anon* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i.i, i8* noundef nonnull align 8 dereferenceable(16) %28, i64 16, i1 false) #30, !noalias !213
  br label %invoke.cont.i

if.else.i.i.i:                                    ; preds = %call2.i.i.noexc.i
  %_M_p.i29.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  store i8* %28, i8** %_M_p.i29.i.i.i, align 8, !tbaa !197, !alias.scope !216, !noalias !213
  %_M_allocated_capacity.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 2, i32 0
  %30 = load i64, i64* %_M_allocated_capacity.i.i.i, align 8, !tbaa !130, !noalias !213
  %_M_allocated_capacity.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 2, i32 0
  store i64 %30, i64* %_M_allocated_capacity.i.i.i.i, align 8, !tbaa !130, !alias.scope !216, !noalias !213
  br label %invoke.cont.i

invoke.cont.i:                                    ; preds = %if.else.i.i.i, %if.then.i.i.i27
  %_M_string_length.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i16.i, i64 0, i32 1
  %31 = load i64, i64* %_M_string_length.i.i.i.i, align 8, !tbaa !205, !noalias !213
  %_M_string_length.i30.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 1
  store i64 %31, i64* %_M_string_length.i30.i.i.i, align 8, !tbaa !205, !alias.scope !216, !noalias !213
  %32 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i16.i to %union.anon**
  store %union.anon* %29, %union.anon** %32, align 8, !tbaa !197, !noalias !213
  store i64 0, i64* %_M_string_length.i.i.i.i, align 8, !tbaa !205, !noalias !213
  store i8 0, i8* %arraydecay.i.i.i.i.i26, align 8, !tbaa !130, !noalias !213
  %call.i = invoke noundef i8* @_ZN2cl4sycl6detail18stringifyErrorCodeEi(i32 noundef %CLErr)
          to label %invoke.cont4.i unwind label %lpad3.i, !noalias !213

invoke.cont4.i:                                   ; preds = %invoke.cont.i
  call void @llvm.experimental.noalias.scope.decl(metadata !220)
  %call2.i.i.i17.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %call.i) #30, !noalias !223
  %33 = load i64, i64* %_M_string_length.i30.i.i.i, align 8, !tbaa !205, !noalias !223
  %sub3.i.i.i19.i = sub i64 4611686018427387903, %33
  %cmp.i.i.i20.i = icmp ult i64 %sub3.i.i.i19.i, %call2.i.i.i17.i
  br i1 %cmp.i.i.i20.i, label %if.then.i.i.i21.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i

if.then.i.i.i21.i:                                ; preds = %invoke.cont4.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc34.i unwind label %lpad3.i, !noalias !213

.noexc34.i:                                       ; preds = %if.then.i.i.i21.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i: ; preds = %invoke.cont4.i
  %call2.i.i36.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp1.i, i8* noundef %call.i, i64 noundef %call2.i.i.i17.i)
          to label %call2.i.i.noexc35.i unwind label %lpad3.i, !noalias !213

call2.i.i.noexc35.i:                              ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i25.i
  %34 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 2
  %35 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp.i to %union.anon**
  store %union.anon* %34, %union.anon** %35, align 8, !tbaa !196, !alias.scope !220, !noalias !213
  %_M_p.i.i.i.i22.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 0, i32 0
  %36 = load i8*, i8** %_M_p.i.i.i.i22.i, align 8, !tbaa !197, !noalias !213
  %37 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 2
  %arraydecay.i.i.i.i23.i = bitcast %union.anon* %37 to i8*
  %cmp.i.i1.i24.i = icmp eq i8* %36, %arraydecay.i.i.i.i23.i
  br i1 %cmp.i.i1.i24.i, label %if.then.i.i27.i, label %if.else.i.i31.i

if.then.i.i27.i:                                  ; preds = %call2.i.i.noexc35.i
  %arraydecay.i.i.i26.i = bitcast %union.anon* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %arraydecay.i.i.i26.i, i8* noundef nonnull align 8 dereferenceable(16) %36, i64 16, i1 false) #30, !noalias !213
  br label %invoke.cont5.i

if.else.i.i31.i:                                  ; preds = %call2.i.i.noexc35.i
  %_M_p.i29.i.i28.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 0, i32 0
  store i8* %36, i8** %_M_p.i29.i.i28.i, align 8, !tbaa !197, !alias.scope !220, !noalias !213
  %_M_allocated_capacity.i.i29.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 2, i32 0
  %38 = load i64, i64* %_M_allocated_capacity.i.i29.i, align 8, !tbaa !130, !noalias !213
  %_M_allocated_capacity.i.i.i30.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 2, i32 0
  store i64 %38, i64* %_M_allocated_capacity.i.i.i30.i, align 8, !tbaa !130, !alias.scope !220, !noalias !213
  br label %invoke.cont5.i

invoke.cont5.i:                                   ; preds = %if.else.i.i31.i, %if.then.i.i27.i
  %_M_string_length.i.i.i32.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i36.i, i64 0, i32 1
  %39 = load i64, i64* %_M_string_length.i.i.i32.i, align 8, !tbaa !205, !noalias !213
  %_M_string_length.i30.i.i33.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 1
  store i64 %39, i64* %_M_string_length.i30.i.i33.i, align 8, !tbaa !205, !alias.scope !220, !noalias !213
  %40 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i36.i to %union.anon**
  store %union.anon* %37, %union.anon** %40, align 8, !tbaa !197, !noalias !213
  store i64 0, i64* %_M_string_length.i.i.i32.i, align 8, !tbaa !205, !noalias !213
  store i8 0, i8* %arraydecay.i.i.i.i23.i, align 8, !tbaa !130, !noalias !213
  call void @llvm.experimental.noalias.scope.decl(metadata !224)
  %41 = load i64, i64* %_M_string_length.i30.i.i33.i, align 8, !tbaa !205, !noalias !227
  %cmp.i.i.i41.i = icmp eq i64 %41, 4611686018427387903
  br i1 %cmp.i.i.i41.i, label %if.then.i.i.i42.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i

if.then.i.i.i42.i:                                ; preds = %invoke.cont5.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.15, i64 0, i64 0)) #33
          to label %.noexc55.i unwind label %lpad6.i, !noalias !213

.noexc55.i:                                       ; preds = %if.then.i.i.i42.i
  unreachable

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i: ; preds = %invoke.cont5.i
  %call2.i.i57.i = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp.i, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0), i64 noundef 1)
          to label %call2.i.i.noexc56.i unwind label %lpad6.i, !noalias !213

call2.i.i.noexc56.i:                              ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc.exit.i46.i
  %42 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2
  %43 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp4 to %union.anon**
  store %union.anon* %42, %union.anon** %43, align 8, !tbaa !196, !alias.scope !227
  %_M_p.i.i.i.i43.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 0, i32 0
  %44 = load i8*, i8** %_M_p.i.i.i.i43.i, align 8, !tbaa !197
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
  store i8* %44, i8** %_M_p.i29.i.i49.i, align 8, !tbaa !197, !alias.scope !227
  %_M_allocated_capacity.i.i50.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 2, i32 0
  %46 = load i64, i64* %_M_allocated_capacity.i.i50.i, align 8, !tbaa !130
  %_M_allocated_capacity.i.i.i51.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2, i32 0
  store i64 %46, i64* %_M_allocated_capacity.i.i.i51.i, align 8, !tbaa !130, !alias.scope !227
  br label %invoke.cont7.i

invoke.cont7.i:                                   ; preds = %if.else.i.i52.i, %if.then.i.i48.i
  %_M_string_length.i.i.i53.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %call2.i.i57.i, i64 0, i32 1
  %47 = load i64, i64* %_M_string_length.i.i.i53.i, align 8, !tbaa !205
  %_M_string_length.i30.i.i54.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 1
  store i64 %47, i64* %_M_string_length.i30.i.i54.i, align 8, !tbaa !205, !alias.scope !227
  %48 = bitcast %"class.std::__cxx11::basic_string"* %call2.i.i57.i to %union.anon**
  store %union.anon* %45, %union.anon** %48, align 8, !tbaa !197
  store i64 0, i64* %_M_string_length.i.i.i53.i, align 8, !tbaa !205
  store i8 0, i8* %arraydecay.i.i.i.i44.i, align 8, !tbaa !130
  %_M_p.i.i.i.i59.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp.i, i64 0, i32 0, i32 0
  %49 = load i8*, i8** %_M_p.i.i.i.i59.i, align 8, !tbaa !197, !noalias !213
  %arraydecay.i.i.i.i60.i = bitcast %union.anon* %34 to i8*
  %cmp.i.i.i61.i = icmp eq i8* %49, %arraydecay.i.i.i.i60.i
  br i1 %cmp.i.i.i61.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28, label %if.then.i.i62.i

if.then.i.i62.i:                                  ; preds = %invoke.cont7.i
  call void @_ZdlPv(i8* noundef %49) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28: ; preds = %if.then.i.i62.i, %invoke.cont7.i
  %_M_p.i.i.i.i63.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  %50 = load i8*, i8** %_M_p.i.i.i.i63.i, align 8, !tbaa !197, !noalias !213
  %arraydecay.i.i.i.i64.i = bitcast %union.anon* %26 to i8*
  %cmp.i.i.i65.i = icmp eq i8* %50, %arraydecay.i.i.i.i64.i
  br i1 %cmp.i.i.i65.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i, label %if.then.i.i66.i

if.then.i.i66.i:                                  ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28
  call void @_ZdlPv(i8* noundef %50) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i: ; preds = %if.then.i.i66.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i28
  %_M_p.i.i.i.i68.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i.i68.i, align 8, !tbaa !197, !noalias !213
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
  %56 = load i8*, i8** %_M_p.i.i.i.i73.i, align 8, !tbaa !197, !noalias !213
  %arraydecay.i.i.i.i74.i = bitcast %union.anon* %34 to i8*
  %cmp.i.i.i75.i = icmp eq i8* %56, %arraydecay.i.i.i.i74.i
  br i1 %cmp.i.i.i75.i, label %ehcleanup.i, label %if.then.i.i76.i

if.then.i.i76.i:                                  ; preds = %lpad6.i
  call void @_ZdlPv(i8* noundef %56) #30, !noalias !213
  br label %ehcleanup.i

ehcleanup.i:                                      ; preds = %if.then.i.i76.i, %lpad6.i, %lpad3.i
  %.pn.i = phi { i8*, i32 } [ %54, %lpad3.i ], [ %55, %lpad6.i ], [ %55, %if.then.i.i76.i ]
  %_M_p.i.i.i.i78.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp1.i, i64 0, i32 0, i32 0
  %57 = load i8*, i8** %_M_p.i.i.i.i78.i, align 8, !tbaa !197, !noalias !213
  %arraydecay.i.i.i.i79.i = bitcast %union.anon* %26 to i8*
  %cmp.i.i.i80.i = icmp eq i8* %57, %arraydecay.i.i.i.i79.i
  br i1 %cmp.i.i.i80.i, label %ehcleanup8.i, label %if.then.i.i81.i

if.then.i.i81.i:                                  ; preds = %ehcleanup.i
  call void @_ZdlPv(i8* noundef %57) #30, !noalias !213
  br label %ehcleanup8.i

ehcleanup8.i:                                     ; preds = %if.then.i.i81.i, %ehcleanup.i, %lpad.i29
  %.pn.pn.i = phi { i8*, i32 } [ %53, %lpad.i29 ], [ %.pn.i, %ehcleanup.i ], [ %.pn.i, %if.then.i.i81.i ]
  %_M_p.i.i.i.i83.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 0, i32 0
  %58 = load i8*, i8** %_M_p.i.i.i.i83.i, align 8, !tbaa !197, !noalias !213
  %59 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp2.i, i64 0, i32 2
  %arraydecay.i.i.i.i84.i = bitcast %union.anon* %59 to i8*
  %cmp.i.i.i85.i = icmp eq i8* %58, %arraydecay.i.i.i.i84.i
  br i1 %cmp.i.i.i85.i, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i, label %if.then.i.i86.i

if.then.i.i86.i:                                  ; preds = %ehcleanup8.i
  call void @_ZdlPv(i8* noundef %58) #30, !noalias !213
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i: ; preds = %if.then.i.i86.i, %ehcleanup8.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %23) #30, !noalias !213
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %22) #30, !noalias !213
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %21) #30, !noalias !213
  br label %ehcleanup11

invoke.cont6:                                     ; preds = %if.then.i.i71.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit67.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %23) #30, !noalias !213
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %22) #30, !noalias !213
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %21) #30, !noalias !213
  call void @llvm.experimental.noalias.scope.decl(metadata !228)
  %60 = load i64, i64* %_M_string_length.i.i.i.i.i.i.i, align 8, !tbaa !205, !noalias !228
  %61 = load i64, i64* %_M_string_length.i30.i.i54.i, align 8, !tbaa !205, !noalias !228
  %add.i = add i64 %61, %60
  %62 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !197, !noalias !228
  %arraydecay.i.i.i.i31 = bitcast %union.anon* %6 to i8*
  %cmp.i.i.i32 = icmp eq i8* %62, %arraydecay.i.i.i.i31
  %_M_allocated_capacity.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp3, i64 0, i32 2, i32 0
  %63 = load i64, i64* %_M_allocated_capacity.i.i, align 8, !noalias !228
  %cond.i.i = select i1 %cmp.i.i.i32, i64 15, i64 %63
  %cmp.i = icmp ugt i64 %add.i, %cond.i.i
  %_M_p.i.i.i16.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 0, i32 0
  %64 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !197, !noalias !228
  br i1 %cmp.i, label %land.rhs.i, label %cond.false.i

land.rhs.i:                                       ; preds = %invoke.cont6
  %arraydecay.i.i.i17.i = bitcast %union.anon* %42 to i8*
  %cmp.i.i18.i = icmp eq i8* %64, %arraydecay.i.i.i17.i
  %_M_allocated_capacity.i19.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp4, i64 0, i32 2, i32 0
  %65 = load i64, i64* %_M_allocated_capacity.i19.i, align 8, !noalias !228
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
  store %union.anon* %66, %union.anon** %67, align 8, !tbaa !196, !alias.scope !228
  %_M_p.i.i.i23.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 0, i32 0
  %68 = load i8*, i8** %_M_p.i.i.i23.i, align 8, !tbaa !197
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
  store i8* %68, i8** %_M_p.i29.i.i, align 8, !tbaa !197, !alias.scope !228
  %_M_allocated_capacity.i26.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 2, i32 0
  %70 = load i64, i64* %_M_allocated_capacity.i26.i, align 8, !tbaa !130
  %_M_allocated_capacity.i.i.i33 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %70, i64* %_M_allocated_capacity.i.i.i33, align 8, !tbaa !130, !alias.scope !228
  br label %invoke.cont8

invoke.cont8:                                     ; preds = %if.else.i.i, %if.then.i.i
  %_M_string_length.i.i27.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %cond-lvalue.i, i64 0, i32 1
  %71 = load i64, i64* %_M_string_length.i.i27.i, align 8, !tbaa !205
  %_M_string_length.i30.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %71, i64* %_M_string_length.i30.i.i, align 8, !tbaa !205, !alias.scope !228
  %72 = bitcast %"class.std::__cxx11::basic_string"* %cond-lvalue.i to %union.anon**
  store %union.anon* %69, %union.anon** %72, align 8, !tbaa !197
  store i64 0, i64* %_M_string_length.i.i27.i, align 8, !tbaa !205
  store i8 0, i8* %arraydecay.i.i.i24.i, align 8, !tbaa !130
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeSt10shared_ptrINS0_7contextEERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %this, [2 x i64] %ec.coerce, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp)
          to label %invoke.cont10 unwind label %lpad9

invoke.cont10:                                    ; preds = %invoke.cont8
  %_M_p.i.i.i.i36 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %73 = load i8*, i8** %_M_p.i.i.i.i36, align 8, !tbaa !197
  %arraydecay.i.i.i.i37 = bitcast %union.anon* %66 to i8*
  %cmp.i.i.i38 = icmp eq i8* %73, %arraydecay.i.i.i.i37
  br i1 %cmp.i.i.i38, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %if.then.i.i39

if.then.i.i39:                                    ; preds = %invoke.cont10
  call void @_ZdlPv(i8* noundef %73) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %invoke.cont10, %if.then.i.i39
  %74 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !197
  %arraydecay.i.i.i.i42 = bitcast %union.anon* %42 to i8*
  %cmp.i.i.i43 = icmp eq i8* %74, %arraydecay.i.i.i.i42
  br i1 %cmp.i.i.i43, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, label %if.then.i.i44

if.then.i.i44:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  call void @_ZdlPv(i8* noundef %74) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %if.then.i.i44
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %20) #30
  %75 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !197
  %cmp.i.i.i49 = icmp eq i8* %75, %arraydecay.i.i.i.i31
  br i1 %cmp.i.i.i49, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52, label %if.then.i.i50

if.then.i.i50:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46
  call void @_ZdlPv(i8* noundef %75) #30
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, %if.then.i.i50
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #30
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #30
  %76 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %76, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i53

if.then.i.i53:                                    ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %76, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i54, label %if.else.i.i.i.i

if.then.i.i.i.i54:                                ; preds = %if.then.i.i53
  %77 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i53
  %78 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %78, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i54
  %retval.0.i.i.i.i = phi i32 [ %77, %if.then.i.i.i.i54 ], [ %78, %if.else.i.i.i.i ]
  %cmp.i.i.i55 = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i55, label %if.then.i.i.i56, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i56:                                  ; preds = %invoke.cont.i.i.i
  %79 = bitcast %"class.std::_Sp_counted_base"* %76 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %79, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %80 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %80(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %76) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %76, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i56
  %81 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i56
  %82 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %82, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %81, %if.then.i9.i.i.i ], [ %82, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %79, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %83 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %83(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %76) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit52, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  %MCLErr = getelementptr inbounds %"class.cl::sycl::exception", %"class.cl::sycl::exception"* %this, i64 0, i32 2
  store i32 %CLErr, i32* %MCLErr, align 8, !tbaa !231
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
  %88 = load i8*, i8** %_M_p.i.i.i.i57, align 8, !tbaa !197
  %arraydecay.i.i.i.i58 = bitcast %union.anon* %66 to i8*
  %cmp.i.i.i59 = icmp eq i8* %88, %arraydecay.i.i.i.i58
  br i1 %cmp.i.i.i59, label %ehcleanup, label %if.then.i.i60

if.then.i.i60:                                    ; preds = %lpad9
  call void @_ZdlPv(i8* noundef %88) #30
  br label %ehcleanup

ehcleanup:                                        ; preds = %if.then.i.i60, %lpad9, %lpad7
  %.pn = phi { i8*, i32 } [ %86, %lpad7 ], [ %87, %lpad9 ], [ %87, %if.then.i.i60 ]
  %89 = load i8*, i8** %_M_p.i.i.i16.i, align 8, !tbaa !197
  %arraydecay.i.i.i.i64 = bitcast %union.anon* %42 to i8*
  %cmp.i.i.i65 = icmp eq i8* %89, %arraydecay.i.i.i.i64
  br i1 %cmp.i.i.i65, label %ehcleanup11, label %if.then.i.i66

if.then.i.i66:                                    ; preds = %ehcleanup
  call void @_ZdlPv(i8* noundef %89) #30
  br label %ehcleanup11

ehcleanup11:                                      ; preds = %if.then.i.i66, %ehcleanup, %lpad5, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i
  %.pn.pn = phi { i8*, i32 } [ %85, %lpad5 ], [ %.pn.pn.i, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit87.i ], [ %.pn, %ehcleanup ], [ %.pn, %if.then.i.i66 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %20) #30
  %90 = load i8*, i8** %_M_p.i13.i.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %_M_pi.i = getelementptr inbounds %"class.std::__shared_ptr.121", %"class.std::__shared_ptr.121"* %this, i64 0, i32 1, i32 0
  %0 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i, align 8, !tbaa !71
  %cmp.not.i = icmp eq %"class.std::_Sp_counted_base"* %0, null
  br i1 %cmp.not.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i

if.then.i:                                        ; preds = %entry.split
  %_M_use_count.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i
  %1 = atomicrmw volatile add i32* %_M_use_count.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i
  %2 = load i32, i32* %_M_use_count.i.i, align 8, !tbaa !73
  %add.i.i.i.i = add nsw i32 %2, -1
  store i32 %add.i.i.i.i, i32* %_M_use_count.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %1, %if.then.i.i.i ], [ %2, %if.else.i.i.i ]
  %cmp.i.i = icmp eq i32 %retval.0.i.i.i, 1
  br i1 %cmp.i.i, label %if.then.i.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i:                                      ; preds = %invoke.cont.i.i
  %3 = bitcast %"class.std::_Sp_counted_base"* %0 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i, i64 2
  %4 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i, align 8
  tail call void %4(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  %_M_weak_count.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %0, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i, label %if.else.i11.i.i

if.then.i9.i.i:                                   ; preds = %if.then.i.i
  %5 = atomicrmw volatile add i32* %_M_weak_count.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i

if.else.i11.i.i:                                  ; preds = %if.then.i.i
  %6 = load i32, i32* %_M_weak_count.i.i, align 4, !tbaa !73
  %add.i.i10.i.i = add nsw i32 %6, -1
  store i32 %add.i.i10.i.i, i32* %_M_weak_count.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i

invoke.cont2.i.i:                                 ; preds = %if.else.i11.i.i, %if.then.i9.i.i
  %retval.0.i12.i.i = phi i32 [ %5, %if.then.i9.i.i ], [ %6, %if.else.i11.i.i ]
  %cmp4.i.i = icmp eq i32 %retval.0.i12.i.i, 1
  br i1 %cmp4.i.i, label %if.then5.i.i, label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i:                                     ; preds = %invoke.cont2.i.i
  %vtable6.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %3, align 8, !tbaa !75
  %vfn7.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i, i64 3
  %7 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i, align 8
  tail call void %7(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %0) #30
  br label %_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %entry.split, %invoke.cont.i.i, %invoke.cont2.i.i, %if.then5.i.i
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl13runtime_errorD0Ev(%"class.cl::sycl::runtime_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry.split
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry.split
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::runtime_error", %"class.cl::sycl::runtime_error"* %this, i64 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %__dnew.i.i.i.i = alloca i64, align 8
  %__args = alloca %"struct.std::__va_list", align 8
  %agg.tmp = alloca %"struct.std::__va_list", align 8
  %0 = alloca i8, i64 %__n, align 16
  %1 = bitcast %"struct.std::__va_list"* %__args to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #30
  call void @llvm.va_start(i8* nonnull %1)
  %2 = bitcast %"struct.std::__va_list"* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %2, i8* noundef nonnull align 8 dereferenceable(32) %1, i64 32, i1 false), !tbaa.struct !234
  %call = call noundef i32 %__convf(i8* noundef nonnull %0, i64 noundef %__n, i8* noundef %__fmt, %"struct.std::__va_list"* noundef nonnull %agg.tmp)
  call void @llvm.va_end(i8* nonnull %1)
  %idx.ext = sext i32 %call to i64
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %4 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %3, %union.anon** %4, align 8, !tbaa !196
  %5 = bitcast %union.anon* %3 to i8*
  %6 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #30
  store i64 %idx.ext, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %cmp3.i.i.i.i = icmp ugt i32 %call, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %entry.split
  %call5.i.i.i3.i11 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %agg.result, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i3.i11, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
  %7 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 0
  store i64 %7, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !130
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %entry.split
  %8 = phi i8* [ %call5.i.i.i3.i11, %if.then4.i.i.i.i ], [ %5, %entry.split ]
  switch i64 %idx.ext, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %9 = load i8, i8* %0, align 16, !tbaa !130
  store i8 %9, i8* %8, align 1, !tbaa !130
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* nonnull align 16 %0, i64 %idx.ext, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  %10 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 %10, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !205
  %11 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %11, i64 %10
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !130
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
entry.split:
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !196
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry.split
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry.split
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !130
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !130
  store i8 %7, i8* %6, align 1, !tbaa !130
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !205
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !130
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #30
  invoke void @_ZN2cl4sycl23invalid_parameter_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i32 noundef %Err)
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont
  %10 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
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
  %12 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %call = tail call [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef 6) #30
  %0 = bitcast %"class.std::shared_ptr.120"* %agg.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0)
  %1 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false) #30
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %call, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %entry.split
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

lpad.i:                                           ; preds = %entry.split
  %10 = landingpad { i8*, i32 }
          cleanup
  %_M_pi.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %lpad.i
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i2, label %if.else.i.i.i.i

if.then.i.i.i.i2:                                 ; preds = %if.then.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i2
  %retval.0.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i2 ], [ %13, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i3, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i3:                                   ; preds = %invoke.cont.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i3
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i3
  %17 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i ], [ %17, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %lpad.i, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  resume { i8*, i32 } %10

_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit: ; preds = %invoke.cont.i, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  %19 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0)
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl23invalid_parameter_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %19, align 8, !tbaa !75
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl23invalid_parameter_errorD0Ev(%"class.cl::sycl::invalid_parameter_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry.split
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry.split
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::invalid_parameter_error", %"class.cl::sycl::invalid_parameter_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %AdjustedRange = alloca %"class.cl::sycl::detail::NDRDescT", align 8
  %agg.tmp = alloca %"class.cl::sycl::nd_range", align 8
  %0 = bitcast %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* nonnull %0) #30
  %1 = bitcast %"class.cl::sycl::detail::NDRDescT"* %NDRDesc to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(104) %0, i8* noundef nonnull align 8 dereferenceable(104) %1, i64 104, i1 false)
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 0
  %2 = load i64, i64* %arrayidx.i, align 8, !tbaa !66
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry.split
  %arrayidx.i31 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 3, i32 0, i32 0, i64 0
  %3 = load i64, i64* %arrayidx.i31, align 8, !tbaa !66
  %cmp3.not = icmp eq i64 %3, 0
  br i1 %cmp3.not, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %Dims = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 4
  %4 = load i64, i64* %Dims, align 8, !tbaa !235
  %conv = trunc i64 %4 to i32
  %arrayidx.1.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 3, i32 0, i32 0, i64 1
  %agg.tmp4.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %3, i64* %agg.tmp4.sroa.0.0..sroa_idx, align 8
  %agg.tmp4.sroa.2.0..sroa_idx38 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %agg.tmp, i64 0, i32 0, i32 0, i32 0, i64 1
  %5 = bitcast i64* %arrayidx.1.i to <2 x i64>*
  %6 = load <2 x i64>, <2 x i64>* %5, align 8, !tbaa !66, !noalias !236
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

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry.split
  %arrayidx.i33 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 1, i32 0, i32 0, i64 0
  %10 = load i64, i64* %arrayidx.i33, align 8, !tbaa !66
  %cmp8 = icmp eq i64 %10, 0
  br i1 %cmp8, label %for.cond.preheader, label %if.end15

for.cond.preheader:                               ; preds = %if.end
  %Dims10 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 4
  %11 = load i64, i64* %Dims10, align 8, !tbaa !235
  %cmp1147.not = icmp eq i64 %11, 0
  br i1 %cmp1147.not, label %if.end15, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  store i64 1, i64* %arrayidx.i33, align 8, !tbaa !66
  %cmp11.not = icmp eq i64 %11, 1
  br i1 %cmp11.not, label %if.end15, label %for.body.1, !llvm.loop !239

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
  store i64 1, i64* %arrayidx.i34.1, align 8, !tbaa !66
  %cmp11.1 = icmp ugt i64 %11, 2
  br i1 %cmp11.1, label %for.body.2, label %if.end15, !llvm.loop !239

for.body.2:                                       ; preds = %for.body.1
  %arrayidx.i34.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %AdjustedRange, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 1, i64* %arrayidx.i34.2, align 8, !tbaa !66
  %cmp11.2.not = icmp eq i64 %11, 3
  br i1 %cmp11.2.not, label %if.end15, label %if.then.i.i, !llvm.loop !239

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
entry.split:
  %MKernel = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1
  %0 = bitcast %"class.std::function.123"* %MKernel to i8*
  ret i8* %0
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this) unnamed_addr #22 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_manager.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 1
  %1 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i, align 8, !tbaa !110
  %tobool.not.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %1, null
  br i1 %tobool.not.i, label %_ZNSt14_Function_baseD2Ev.exit, label %if.then.i

if.then.i:                                        ; preds = %entry.split
  %_M_functor.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 0
  %call.i = invoke noundef i1 %1(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i, i32 noundef 3)
          to label %_ZNSt14_Function_baseD2Ev.exit unwind label %terminate.lpad.i

terminate.lpad.i:                                 ; preds = %if.then.i
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  tail call void @__clang_call_terminate(i8* %3) #31
  unreachable

_ZNSt14_Function_baseD2Ev.exit:                   ; preds = %entry.split, %if.then.i
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED0Ev(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this) unnamed_addr #22 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_manager.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 1
  %1 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i, align 8, !tbaa !110
  %tobool.not.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %1, null
  br i1 %tobool.not.i.i, label %_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry.split
  %_M_functor.i.i = getelementptr inbounds %"class.cl::sycl::detail::HostKernel", %"class.cl::sycl::detail::HostKernel"* %this, i64 0, i32 1, i32 0, i32 0
  %call.i.i = invoke noundef i1 %1(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i, i32 noundef 3)
          to label %_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit unwind label %terminate.lpad.i.i

terminate.lpad.i.i:                               ; preds = %if.then.i.i
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  tail call void @__clang_call_terminate(i8* %3) #31
  unreachable

_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EED2Ev.exit: ; preds = %entry.split, %if.then.i.i
  %4 = bitcast %"class.cl::sycl::detail::HostKernel"* %this to i8*
  tail call void @_ZdlPv(i8* noundef nonnull %4) #34
  ret void
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail8NDRDescT3setEiNS0_8nd_rangeILi3EEE(%"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %this, i32 noundef %Dims_, %"class.cl::sycl::nd_range"* noundef %ExecutionRange) local_unnamed_addr #20 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %cmp63 = icmp sgt i32 %Dims_, 0
  br i1 %cmp63, label %for.body.lr.ph, label %for.body.lr.ph.i

for.body.lr.ph:                                   ; preds = %entry.split
  %ref.tmp.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 0, i32 0, i32 0, i64 0
  %ref.tmp.sroa.0.0.copyload = load i64, i64* %ref.tmp.sroa.0.0..sroa_idx, align 8
  %ref.tmp.sroa.14.0..sroa_idx177 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 0, i32 0, i32 0, i64 2
  %arrayidx.i26 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %ref.tmp.sroa.0.0.copyload, i64* %arrayidx.i26, align 8, !tbaa !66
  %ref.tmp3.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 1, i32 0, i32 0, i64 0
  %ref.tmp3.sroa.0.0.copyload = load i64, i64* %ref.tmp3.sroa.0.0..sroa_idx, align 8
  %ref.tmp3.sroa.14.0..sroa_idx136 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 1, i32 0, i32 0, i64 2
  %arrayidx.i40 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 %ref.tmp3.sroa.0.0.copyload, i64* %arrayidx.i40, align 8, !tbaa !66
  %ref.tmp6.sroa.0.0..sroa_idx = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 2, i32 0, i32 0, i64 0
  %ref.tmp6.sroa.0.0.copyload = load i64, i64* %ref.tmp6.sroa.0.0..sroa_idx, align 8
  %ref.tmp6.sroa.14.0..sroa_idx95 = getelementptr inbounds %"class.cl::sycl::nd_range", %"class.cl::sycl::nd_range"* %ExecutionRange, i64 0, i32 2, i32 0, i32 0, i64 2
  %arrayidx.i54 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 0
  store i64 %ref.tmp6.sroa.0.0.copyload, i64* %arrayidx.i54, align 8, !tbaa !66
  %arrayidx.i61 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 0
  store i64 0, i64* %arrayidx.i61, align 8, !tbaa !66
  %exitcond66.not = icmp eq i32 %Dims_, 1
  br i1 %exitcond66.not, label %for.body.lr.ph.i, label %for.body.1, !llvm.loop !240

for.body.lr.ph.i:                                 ; preds = %for.body.lr.ph, %for.body.1, %entry.split
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
  store i64 1, i64* %arrayidx.i.i, align 8, !tbaa !66
  %3 = load i64, i64* %arrayidx.i13.i, align 8, !tbaa !66
  %tobool.not.i = icmp ne i64 %3, 0
  %conv.i = zext i1 %tobool.not.i to i64
  %arrayidx.i19.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 %indvars.iv.i
  store i64 %conv.i, i64* %arrayidx.i19.i, align 8, !tbaa !66
  %arrayidx.i26.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 %indvars.iv.i
  store i64 0, i64* %arrayidx.i26.i, align 8, !tbaa !66
  %arrayidx.i33.i = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 %indvars.iv.i
  store i64 0, i64* %arrayidx.i33.i, align 8, !tbaa !66
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %cmp.not.i = icmp eq i64 %indvars.iv.i, 2
  br i1 %cmp.not.i, label %_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit, label %for.body.i, !llvm.loop !241

_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit: ; preds = %_ZN2cl4sycl6detail5arrayILi3EEixEi.exit34.i, %for.body.2
  %conv = sext i32 %Dims_ to i64
  %Dims = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 4
  store i64 %conv, i64* %Dims, align 8, !tbaa !235
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
  store i64 %ref.tmp.sroa.13.0.copyload166, i64* %arrayidx.i26.1, align 8, !tbaa !66
  %ref.tmp3.sroa.13.0.copyload125 = load i64, i64* %ref.tmp3.sroa.13.0..sroa_idx122, align 8
  %arrayidx.i40.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 1
  store i64 %ref.tmp3.sroa.13.0.copyload125, i64* %arrayidx.i40.1, align 8, !tbaa !66
  %ref.tmp6.sroa.13.0.copyload84 = load i64, i64* %ref.tmp6.sroa.13.0..sroa_idx81, align 8
  %arrayidx.i54.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 1
  store i64 %ref.tmp6.sroa.13.0.copyload84, i64* %arrayidx.i54.1, align 8, !tbaa !66
  %arrayidx.i61.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 1
  store i64 0, i64* %arrayidx.i61.1, align 8, !tbaa !66
  %exitcond66.1.not = icmp eq i32 %Dims_, 2
  br i1 %exitcond66.1.not, label %for.body.lr.ph.i, label %for.body.2, !llvm.loop !240

for.body.2:                                       ; preds = %for.body.1
  %ref.tmp.sroa.14.0.copyload184 = load i64, i64* %ref.tmp.sroa.14.0..sroa_idx177, align 8
  %arrayidx.i26.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 0, i32 0, i32 0, i64 2
  store i64 %ref.tmp.sroa.14.0.copyload184, i64* %arrayidx.i26.2, align 8, !tbaa !66
  %ref.tmp3.sroa.14.0.copyload143 = load i64, i64* %ref.tmp3.sroa.14.0..sroa_idx136, align 8
  %arrayidx.i40.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 %ref.tmp3.sroa.14.0.copyload143, i64* %arrayidx.i40.2, align 8, !tbaa !66
  %ref.tmp6.sroa.14.0.copyload102 = load i64, i64* %ref.tmp6.sroa.14.0..sroa_idx95, align 8
  %arrayidx.i54.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 2, i32 0, i32 0, i64 2
  store i64 %ref.tmp6.sroa.14.0.copyload102, i64* %arrayidx.i54.2, align 8, !tbaa !66
  %arrayidx.i61.2 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %this, i64 0, i32 3, i32 0, i32 0, i64 2
  store i64 0, i64* %arrayidx.i61.2, align 8, !tbaa !66
  %exitcond66.2.not = icmp eq i32 %Dims_, 3
  br i1 %exitcond66.2.not, label %_ZN2cl4sycl6detail8NDRDescT18setNDRangeLeftoverEi.exit, label %if.then.i.i, !llvm.loop !240
}

declare dso_local void @_ZN2cl4sycl6detail17HostProfilingInfo5startEv(%"class.cl::sycl::detail::HostProfilingInfo"* noundef nonnull align 8 dereferenceable(16)) local_unnamed_addr #0

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTE(%"class.cl::sycl::detail::HostKernel"* noundef nonnull align 8 dereferenceable(40) %this, %"class.cl::sycl::detail::NDRDescT"* noundef nonnull align 8 dereferenceable(104) %NDRDesc) local_unnamed_addr #12 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry.split:
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
  %1 = load i64, i64* %arrayidx.i, align 8, !tbaa !66
  %cmp4 = icmp eq i64 %1, 0
  br i1 %cmp4, label %if.then, label %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81

_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81:       ; preds = %entry.split
  %arrayidx.i73 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 0
  %2 = load i64, i64* %arrayidx.i73, align 8, !tbaa !66
  %.frozen = freeze i64 %2
  %.frozen159 = freeze i64 %1
  %div = udiv i64 %.frozen, %.frozen159
  %3 = mul i64 %div, %.frozen159
  %rem.decomposed = sub i64 %.frozen, %3
  %cmp8.not = icmp eq i64 %rem.decomposed, 0
  br i1 %cmp8.not, label %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit, label %if.then

if.then:                                          ; preds = %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1, %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit, %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81, %entry.split
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
  store i64 %div, i64* %call.fca.0.gep, align 8, !tbaa !66
  %arrayidx.i.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 1, i32 0, i32 0, i64 1
  %6 = load i64, i64* %arrayidx.i.1, align 8, !tbaa !66
  %cmp4.1 = icmp eq i64 %6, 0
  br i1 %cmp4.1, label %if.then, label %_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1

_ZNK2cl4sycl6detail5arrayILi3EEixEi.exit81.1:     ; preds = %_ZN2cl4sycl6detail5arrayILi2EEixEi.exit
  %arrayidx.i73.1 = getelementptr inbounds %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 0, i32 0, i32 0, i64 1
  %7 = load i64, i64* %arrayidx.i73.1, align 8, !tbaa !66
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
  store i64 %div.1, i64* %call.fca.1.gep, align 8, !tbaa !66
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %LocalSize14153) #30
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %GlobalSize18156) #30
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %GlobalOffset151) #30
  %scevgep = getelementptr %"class.cl::sycl::detail::NDRDescT", %"class.cl::sycl::detail::NDRDescT"* %NDRDesc, i64 0, i32 2, i32 0, i32 0, i64 0
  %scevgep152 = bitcast i64* %scevgep to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %GlobalOffset151, i8* noundef nonnull align 8 dereferenceable(16) %scevgep152, i64 16, i1 false), !tbaa !66
  %scevgep154155 = bitcast i64* %arrayidx.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %LocalSize14153, i8* noundef nonnull align 8 dereferenceable(16) %scevgep154155, i64 16, i1 false), !tbaa !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %GlobalSize18156, i8* noundef nonnull align 8 dereferenceable(16) %NDRDesc157, i64 16, i1 false), !tbaa !66
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
  store %"class.cl::sycl::range.118"* %GlobalSize18, %"class.cl::sycl::range.118"** %agg.tmp.sroa.0.0..sroa_idx, align 8, !tbaa.struct !242
  %agg.tmp.sroa.2.0..sroa_idx144 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 1
  store %"class.cl::sycl::range.118"* %LocalSize14, %"class.cl::sycl::range.118"** %agg.tmp.sroa.2.0..sroa_idx144, align 8, !tbaa.struct !243
  %agg.tmp.sroa.3.0..sroa_idx145 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 2
  store %"class.cl::sycl::range.118"* %GroupSize, %"class.cl::sycl::range.118"** %agg.tmp.sroa.3.0..sroa_idx145, align 8, !tbaa.struct !244
  %agg.tmp.sroa.4.0..sroa_idx146 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 3
  store %"class.cl::sycl::id.126"* %GlobalOffset, %"class.cl::sycl::id.126"** %agg.tmp.sroa.4.0..sroa_idx146, align 8, !tbaa.struct !245
  %agg.tmp.sroa.5.0..sroa_idx147 = getelementptr inbounds %class.anon.129, %class.anon.129* %agg.tmp.i, i64 0, i32 4
  store %"class.cl::sycl::detail::HostKernel"* %this, %"class.cl::sycl::detail::HostKernel"** %agg.tmp.sroa.5.0..sroa_idx147, align 8, !tbaa.struct !246
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
entry.split:
  %__dnew.i.i.i.i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %0 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #30
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %ref.tmp to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !196
  %tobool.not.i = icmp eq i8* %Msg, null
  br i1 %tobool.not.i, label %if.then.i.i.i.i, label %if.end.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %entry.split
  call void @_ZSt19__throw_logic_errorPKc(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i64 0, i64 0)) #33
  unreachable

if.end.i.i.i.i:                                   ; preds = %entry.split
  %3 = bitcast %union.anon* %1 to i8*
  %call2.i.i = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %Msg) #30
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #30
  store i64 %call2.i.i, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %cmp3.i.i.i.i = icmp ugt i64 %call2.i.i, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i10.i9 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i64* noundef nonnull align 8 dereferenceable(8) %__dnew.i.i.i.i, i64 noundef 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i10.i9, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 2, i32 0
  store i64 %5, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !130
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.i.i.i.i
  %6 = phi i8* [ %call5.i.i.i10.i9, %if.then4.i.i.i.i ], [ %3, %if.end.i.i.i.i ]
  switch i64 %call2.i.i, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %invoke.cont
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %7 = load i8, i8* %Msg, align 1, !tbaa !130
  store i8 %7, i8* %6, align 1, !tbaa !130
  br label %invoke.cont

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* nonnull align 1 %Msg, i64 %call2.i.i, i1 false) #30
  br label %invoke.cont

invoke.cont:                                      ; preds = %if.end.i.i.i.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end6.i.i.i.i
  %_M_p.i13.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %8 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !66
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %ref.tmp, i64 0, i32 1
  store i64 %8, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !205
  %9 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %9, i64 %8
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !130
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #30
  invoke void @_ZN2cl4sycl14nd_range_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %ref.tmp, i32 noundef %Err)
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont
  %10 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
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
  %12 = load i8*, i8** %_M_p.i13.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %agg.tmp2.i = alloca %"class.std::shared_ptr.120", align 8
  %call = tail call [2 x i64] @_ZN2cl4sycl15make_error_codeENS0_4errcE(i32 noundef 4) #30
  %0 = bitcast %"class.std::shared_ptr.120"* %agg.tmp2.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0)
  %1 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false) #30
  invoke void @_ZN2cl4sycl9exceptionC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiSt10shared_ptrINS0_7contextEE(%"class.cl::sycl::exception"* noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %call, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %Msg, i32 noundef %Err, %"class.std::shared_ptr.120"* noundef nonnull %agg.tmp2.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %entry.split
  %_M_pi.i.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %2 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %2, null
  br i1 %cmp.not.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %invoke.cont.i
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %4 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %4, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %3, %if.then.i.i.i.i.i ], [ %4, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %5 = bitcast %"class.std::_Sp_counted_base"* %2 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %6 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  call void %6(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %2, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %7 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %8 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %8, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %7, %if.then.i9.i.i.i.i ], [ %8, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %5, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %9 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  call void %9(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %2) #30
  br label %_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit

lpad.i:                                           ; preds = %entry.split
  %10 = landingpad { i8*, i32 }
          cleanup
  %_M_pi.i.i = getelementptr inbounds %"class.std::shared_ptr.120", %"class.std::shared_ptr.120"* %agg.tmp2.i, i64 0, i32 0, i32 1, i32 0
  %11 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i, align 8, !tbaa !71
  %cmp.not.i.i = icmp eq %"class.std::_Sp_counted_base"* %11, null
  br i1 %cmp.not.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %lpad.i
  %_M_use_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i2, label %if.else.i.i.i.i

if.then.i.i.i.i2:                                 ; preds = %if.then.i.i
  %12 = atomicrmw volatile add i32* %_M_use_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i

if.else.i.i.i.i:                                  ; preds = %if.then.i.i
  %13 = load i32, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i = add nsw i32 %13, -1
  store i32 %add.i.i.i.i.i, i32* %_M_use_count.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.else.i.i.i.i, %if.then.i.i.i.i2
  %retval.0.i.i.i.i = phi i32 [ %12, %if.then.i.i.i.i2 ], [ %13, %if.else.i.i.i.i ]
  %cmp.i.i.i = icmp eq i32 %retval.0.i.i.i.i, 1
  br i1 %cmp.i.i.i, label %if.then.i.i.i3, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then.i.i.i3:                                   ; preds = %invoke.cont.i.i.i
  %14 = bitcast %"class.std::_Sp_counted_base"* %11 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i, i64 2
  %15 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i, align 8
  call void %15(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  %_M_weak_count.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %11, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i, label %if.else.i11.i.i.i

if.then.i9.i.i.i:                                 ; preds = %if.then.i.i.i3
  %16 = atomicrmw volatile add i32* %_M_weak_count.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i

if.else.i11.i.i.i:                                ; preds = %if.then.i.i.i3
  %17 = load i32, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i = add nsw i32 %17, -1
  store i32 %add.i.i10.i.i.i, i32* %_M_weak_count.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i

invoke.cont2.i.i.i:                               ; preds = %if.else.i11.i.i.i, %if.then.i9.i.i.i
  %retval.0.i12.i.i.i = phi i32 [ %16, %if.then.i9.i.i.i ], [ %17, %if.else.i11.i.i.i ]
  %cmp4.i.i.i = icmp eq i32 %retval.0.i12.i.i.i, 1
  br i1 %cmp4.i.i.i, label %if.then5.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

if.then5.i.i.i:                                   ; preds = %invoke.cont2.i.i.i
  %vtable6.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %14, align 8, !tbaa !75
  %vfn7.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i, i64 3
  %18 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i, align 8
  call void %18(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %11) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit: ; preds = %lpad.i, %invoke.cont.i.i.i, %invoke.cont2.i.i.i, %if.then5.i.i.i
  resume { i8*, i32 } %10

_ZN2cl4sycl13runtime_errorC2ESt10error_codeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi.exit: ; preds = %invoke.cont.i, %invoke.cont.i.i.i.i, %invoke.cont2.i.i.i.i, %if.then5.i.i.i.i
  %19 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0)
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl14nd_range_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %19, align 8, !tbaa !75
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN2cl4sycl14nd_range_errorD0Ev(%"class.cl::sycl::nd_range_error"* noundef nonnull align 8 dereferenceable(64) %this) unnamed_addr #13 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  %0 = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2cl4sycl9exceptionE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !75
  %_M_pi.i.i.i = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 3, i32 0, i32 1, i32 0
  %1 = load %"class.std::_Sp_counted_base"*, %"class.std::_Sp_counted_base"** %_M_pi.i.i.i, align 8, !tbaa !71
  %cmp.not.i.i.i = icmp eq %"class.std::_Sp_counted_base"* %1, null
  br i1 %cmp.not.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %entry.split
  %_M_use_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 1
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i, label %if.else.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %2 = atomicrmw volatile add i32* %_M_use_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont.i.i.i.i

if.else.i.i.i.i.i:                                ; preds = %if.then.i.i.i
  %3 = load i32, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  %add.i.i.i.i.i.i = add nsw i32 %3, -1
  store i32 %add.i.i.i.i.i.i, i32* %_M_use_count.i.i.i.i, align 8, !tbaa !73
  br label %invoke.cont.i.i.i.i

invoke.cont.i.i.i.i:                              ; preds = %if.else.i.i.i.i.i, %if.then.i.i.i.i.i
  %retval.0.i.i.i.i.i = phi i32 [ %2, %if.then.i.i.i.i.i ], [ %3, %if.else.i.i.i.i.i ]
  %cmp.i.i.i.i = icmp eq i32 %retval.0.i.i.i.i.i, 1
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then.i.i.i.i:                                  ; preds = %invoke.cont.i.i.i.i
  %4 = bitcast %"class.std::_Sp_counted_base"* %1 to void (%"class.std::_Sp_counted_base"*)***
  %vtable.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable.i.i.i.i, i64 2
  %5 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn.i.i.i.i, align 8
  tail call void %5(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  %_M_weak_count.i.i.i.i = getelementptr inbounds %"class.std::_Sp_counted_base", %"class.std::_Sp_counted_base"* %1, i64 0, i32 2
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i9.i.i.i.i, label %if.else.i11.i.i.i.i

if.then.i9.i.i.i.i:                               ; preds = %if.then.i.i.i.i
  %6 = atomicrmw volatile add i32* %_M_weak_count.i.i.i.i, i32 -1 acq_rel, align 4
  br label %invoke.cont2.i.i.i.i

if.else.i11.i.i.i.i:                              ; preds = %if.then.i.i.i.i
  %7 = load i32, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  %add.i.i10.i.i.i.i = add nsw i32 %7, -1
  store i32 %add.i.i10.i.i.i.i, i32* %_M_weak_count.i.i.i.i, align 4, !tbaa !73
  br label %invoke.cont2.i.i.i.i

invoke.cont2.i.i.i.i:                             ; preds = %if.else.i11.i.i.i.i, %if.then.i9.i.i.i.i
  %retval.0.i12.i.i.i.i = phi i32 [ %6, %if.then.i9.i.i.i.i ], [ %7, %if.else.i11.i.i.i.i ]
  %cmp4.i.i.i.i = icmp eq i32 %retval.0.i12.i.i.i.i, 1
  br i1 %cmp4.i.i.i.i, label %if.then5.i.i.i.i, label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

if.then5.i.i.i.i:                                 ; preds = %invoke.cont2.i.i.i.i
  %vtable6.i.i.i.i = load void (%"class.std::_Sp_counted_base"*)**, void (%"class.std::_Sp_counted_base"*)*** %4, align 8, !tbaa !75
  %vfn7.i.i.i.i = getelementptr inbounds void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vtable6.i.i.i.i, i64 3
  %8 = load void (%"class.std::_Sp_counted_base"*)*, void (%"class.std::_Sp_counted_base"*)** %vfn7.i.i.i.i, align 8
  tail call void %8(%"class.std::_Sp_counted_base"* noundef nonnull align 8 dereferenceable(16) %1) #30
  br label %_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i

_ZNSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EED2Ev.exit.i: ; preds = %if.then5.i.i.i.i, %invoke.cont2.i.i.i.i, %invoke.cont.i.i.i.i, %entry.split
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.cl::sycl::nd_range_error", %"class.cl::sycl::nd_range_error"* %this, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !197
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
entry.split:
  %LocalItem.sroa.0.i.sroa.0.i = alloca [2 x i64], align 8
  %NDItem.sroa.0.i.i = alloca [2 x i64], align 8
  %NDItem.sroa.7.i.i = alloca [2 x i64], align 8
  %agg.tmp.i.i19 = alloca %"class.std::function.123", align 8
  %agg.tmp16.i.i = alloca %"class.cl::sycl::nd_item", align 8
  %Group.i.sroa.0 = alloca { %"class.cl::sycl::range.118", %"class.cl::sycl::range.118" }, align 8
  %arrayidx.i = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %LowerBound, i64 0, i32 0, i32 0, i64 0
  %0 = load i64, i64* %arrayidx.i, align 8, !tbaa !66
  %arrayidx.i14 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %Index, i64 0, i32 0, i32 0, i64 0
  %arrayidx.i16 = getelementptr inbounds %"class.cl::sycl::range.118", %"class.cl::sycl::range.118"* %UpperBound, i64 0, i32 0, i32 0, i64 0
  store i64 %0, i64* %arrayidx.i14, align 8, !tbaa !66
  %1 = load i64, i64* %arrayidx.i16, align 8, !tbaa !66
  %cmp133 = icmp ult i64 %0, %1
  br i1 %cmp133, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
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
  %agg.tmp.sroa.0.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.0.0..sroa_idx, align 8, !tbaa.struct !242
  %agg.tmp.sroa.2.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.2.0..sroa_idx27, align 8, !tbaa.struct !243
  %agg.tmp.sroa.3.0.copyload = load %"class.cl::sycl::range.118"*, %"class.cl::sycl::range.118"** %agg.tmp.sroa.3.0..sroa_idx28, align 8, !tbaa.struct !244
  %agg.tmp.sroa.4.0.copyload = load %"class.cl::sycl::id.126"*, %"class.cl::sycl::id.126"** %agg.tmp.sroa.4.0..sroa_idx29, align 8, !tbaa.struct !245
  %agg.tmp.sroa.5.0.copyload = load %"class.cl::sycl::detail::HostKernel"*, %"class.cl::sycl::detail::HostKernel"** %agg.tmp.sroa.5.0..sroa_idx30, align 8, !tbaa.struct !246
  %5 = load i64, i64* %arrayidx.i.i, align 8, !tbaa !66
  store i64 %5, i64* %arrayidx.i13.i, align 8, !tbaa !66
  %6 = load i64, i64* %arrayidx.i15.i, align 8, !tbaa !66
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
  %retval.sroa.0.0.copyload.i.i = load i64, i64* %arrayidx.i14, align 8, !tbaa !66
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %Group.i.sroa.0.0..sroa_cast)
  %agg.tmp.sroa.0.0.copyload.i.i = load i64, i64* %agg.tmp.sroa.0.0..sroa_idx.i.i, align 8, !noalias !247
  %agg.tmp.sroa.2.0.copyload.i.i = load i64, i64* %agg.tmp.sroa.2.0..sroa_idx2.i.i, align 8, !noalias !247
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast60, i64 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast62, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast, i64 16, i1 false)
  %7 = load i64, i64* %retval.sroa.0.0..sroa_idx.i.i.i.i, align 8, !tbaa !66, !noalias !247
  %8 = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !66, !noalias !247
  %.frozen = freeze i64 %7
  %.frozen166 = freeze i64 %8
  %div.i.i.i.i = udiv i64 %.frozen, %.frozen166
  %9 = mul i64 %div.i.i.i.i, %.frozen166
  %rem.i.i.i.i.decomposed = sub i64 %.frozen, %9
  %10 = load i64, i64* %retval.sroa.3.0..sroa_idx16.i.i.i.i, align 8, !tbaa !66, !noalias !247
  %11 = load i64, i64* %arrayidx3.1.i.i.i.i, align 8, !tbaa !66, !noalias !247
  %.frozen167 = freeze i64 %10
  %.frozen168 = freeze i64 %11
  %div.1.i.i.i.i = udiv i64 %.frozen167, %.frozen168
  %12 = mul i64 %div.1.i.i.i.i, %.frozen168
  %rem.1.i.i.i.i.decomposed = sub i64 %.frozen167, %12
  %mul.1.i.i.i.i = mul i64 %rem.1.i.i.i.i.decomposed, %rem.i.i.i.i.decomposed
  %cmp.i.i.i = icmp eq i64 %mul.1.i.i.i.i, 0
  br i1 %cmp.i.i.i, label %cond.end.i.i.i, label %cond.false.i.i.i

cond.false.i.i.i:                                 ; preds = %for.body.i
  call void @__assert_fail(i8* noundef getelementptr inbounds ([65 x i8], [65 x i8]* @.str.25, i64 0, i64 0), i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @.str.26, i64 0, i64 0), i32 noundef 526, i8* noundef getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN2cl4sycl5groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE, i64 0, i64 0)) #31, !noalias !247
  unreachable

cond.end.i.i.i:                                   ; preds = %for.body.i
  %sub.i.i.i.i = sub i64 %div.i.i.i.i, %agg.tmp.sroa.0.0.copyload.i.i
  %sub.1.i.i.i.i = sub i64 %div.1.i.i.i.i, %agg.tmp.sroa.2.0.copyload.i.i
  %mul.1.i40.i.i.i = mul i64 %sub.1.i.i.i.i, %sub.i.i.i.i
  %cmp15.i.i.i = icmp eq i64 %mul.1.i40.i.i.i, 0
  br i1 %cmp15.i.i.i, label %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit, label %cond.false19.i.i.i

cond.false19.i.i.i:                               ; preds = %cond.end.i.i.i
  call void @__assert_fail(i8* noundef getelementptr inbounds ([83 x i8], [83 x i8]* @.str.28, i64 0, i64 0), i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @.str.26, i64 0, i64 0), i32 noundef 528, i8* noundef getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN2cl4sycl5groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE, i64 0, i64 0)) #31, !noalias !247
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
  %retval.sroa.0.0.copyload.i.i20.i = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !66
  %mul.i.i.i = mul i64 %retval.sroa.0.0.copyload.i.i20.i, %retval.sroa.0.0.copyload.i.i
  %mul.1.i.i.i = mul i64 %retval.sroa.3.0.copyload.i.i.i, %storemerge19.i
  %add.i.i.i = add i64 %mul.i.i.i, %Index.i.i.sroa.0.2
  %add.1.i.i.i = add i64 %mul.1.i.i.i, %Index.i.i.sroa.7.2
  %16 = load i64, i64* %arrayidx3.i28.i.i, align 8, !tbaa !66
  %add.i29.i.i = add i64 %add.i.i.i, %16
  %17 = load i64, i64* %arrayidx3.1.i31.i.i, align 8, !tbaa !66
  %add.1.i32.i.i = add i64 %add.1.i.i.i, %17
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %LocalItem.sroa.0.i.sroa.0.0..sroa_cast47.i, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.16..sroa_cast, i64 16, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.0.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast138.i.i, i8* noundef nonnull align 8 dereferenceable(16) %Group.i.sroa.0.0..sroa_cast60, i64 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %NDItem.sroa.7.0.NDItem.0.NDItem.0.NDItem.0..sroa_cast133.i.i, i8* noundef nonnull align 8 dereferenceable(16) %GlobalItem.sroa.0.sroa.7.32.GlobalItem.sroa.0.32..sroa_cast.sroa_cast.i.i, i64 16, i1 false)
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* null, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !110
  %18 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i.i, align 8, !tbaa !110
  %tobool.not.i.i.not.i.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %18, null
  br i1 %tobool.not.i.i.not.i.i.i, label %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i
  %call3.i.i.i = invoke noundef i1 %18(%"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor.i.i.i, %"union.std::_Any_data"* noundef nonnull align 8 dereferenceable(16) %_M_functor2.i.i.i, i32 noundef 2)
          to label %invoke.cont.i.i.i unwind label %lpad.i.i.i

invoke.cont.i.i.i:                                ; preds = %if.then.i.i.i
  %19 = load void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)*, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker.i.i.i, align 8, !tbaa !198
  store void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)* %19, void (%"union.std::_Any_data"*, %"class.cl::sycl::nd_item"*)** %_M_invoker4.i.i.i, align 8, !tbaa !198
  %20 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i.i, align 8, !tbaa !110
  store i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %20, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !110
  %phi.cmp.i.i = icmp eq i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)* %20, null
  br label %_ZNSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEEC2ERKS7_.exit.i.i

lpad.i.i.i:                                       ; preds = %if.then.i.i.i
  %21 = landingpad { i8*, i32 }
          cleanup
  %22 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !110
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
  %27 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !110
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
  %30 = load i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)*, i1 (%"union.std::_Any_data"*, %"union.std::_Any_data"*, i32)** %_M_manager.i.i.i.i, align 8, !tbaa !110
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
  %33 = load i64, i64* %arrayidx3.1.i.i.i.i, align 8, !tbaa !66
  %cmp.i.i = icmp ult i64 %add.i.i, %33
  br i1 %cmp.i.i, label %for.body.i.i, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit, !llvm.loop !250

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit: ; preds = %_ZZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_ENKUlSM_E_clESM_.exit.i
  %.pre = load i64, i64* %arrayidx3.i.i.i.i, align 8, !tbaa !66
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit, %for.body.i24
  %34 = phi i64 [ %.pre, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ %14, %for.body.i24 ]
  %retval.sroa.3.0.copyload.i.i.i146 = phi i64 [ %33, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ %retval.sroa.3.0.copyload.i.i.i145, %for.body.i24 ]
  %35 = phi i64 [ %33, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i.loopexit ], [ 0, %for.body.i24 ]
  %add.i25 = add nuw i64 %Index.i.i.sroa.0.2, 1
  %cmp.i26 = icmp ult i64 %add.i25, %34
  br i1 %cmp.i26, label %for.body.i24, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134, !llvm.loop !251

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.i
  %.pre148 = load i64, i64* %arrayidx.i13.i, align 8, !tbaa !66
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit
  %36 = phi i64 [ %.pre148, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit.loopexit134 ], [ %storemerge19.i, %_ZZN2cl4sycl6detail10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES5_Li2EE9runOnHostIS5_EENSt9enable_ifIXsr3std7is_sameIT_S5_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESM_.exit ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %Group.i.sroa.0.0..sroa_cast)
  %37 = load i64, i64* %arrayidx.i16.i, align 8, !tbaa !66
  %add.i = add i64 %37, %36
  store i64 %add.i, i64* %arrayidx.i13.i, align 8, !tbaa !66
  %38 = load i64, i64* %arrayidx.i15.i, align 8, !tbaa !66
  %cmp.i = icmp ult i64 %add.i, %38
  br i1 %cmp.i, label %for.body.i, label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit, !llvm.loop !253

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi1ENS0_5rangeEZZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEENKUlRKNS0_2idILi2EEEE_clESO_EUlSO_E_S3_EC2ERKNS3_ILi2EEESU_SU_SQ_RSS_.exit
  %.pre149 = load i64, i64* %arrayidx.i14, align 8, !tbaa !66
  br label %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit

_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit: ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit, %for.body
  %39 = phi i64 [ %.pre149, %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit.loopexit ], [ %4, %for.body ]
  %40 = load i64, i64* %arrayidx.i17, align 8, !tbaa !66
  %add = add i64 %40, %39
  store i64 %add, i64* %arrayidx.i14, align 8, !tbaa !66
  %41 = load i64, i64* %arrayidx.i16, align 8, !tbaa !66
  %cmp = icmp ult i64 %add, %41
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !254

for.end:                                          ; preds = %_ZN2cl4sycl6detail17NDLoopIterateImplILi2ELi0ENS0_5rangeEZNS1_10HostKernelISt8functionIFvRKNS0_7nd_itemILi2EEEEES7_Li2EE9runOnHostIS7_EENSt9enable_ifIXsr3std7is_sameIT_S7_EE5valueEvE4typeERKNS1_8NDRDescTEEUlRKNS0_2idILi2EEEE_S3_EC2ERKNS3_ILi2EEEST_ST_SP_RSR_.exit, %entry.split
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
entry.split:
  %0 = bitcast %"union.std::_Any_data"* %__functor to %struct.NormalizedKernelType.137**
  %__functor.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %0, align 8, !tbaa !64
  %retval.sroa.0.0..sroa_idx.i.i15.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %__args, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %retval.sroa.0.0.copyload.i.i16.i = load i64, i64* %retval.sroa.0.0..sroa_idx.i.i15.i, align 8
  %retval.sroa.2.0..sroa_idx3.i.i17.i = getelementptr inbounds %"class.cl::sycl::nd_item", %"class.cl::sycl::nd_item"* %__args, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %retval.sroa.2.0.copyload.i.i18.i = load i64, i64* %retval.sroa.2.0..sroa_idx3.i.i17.i, align 8
  %agg.tmp.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 0
  %agg.tmp.sroa.0.0.copyload.i = load i64, i64* %agg.tmp.sroa.0.0..sroa_idx.i, align 8, !tbaa.struct !255
  %agg.tmp.sroa.2.0..sroa_idx31.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 1
  %agg.tmp.sroa.2.0.copyload.i = load float*, float** %agg.tmp.sroa.2.0..sroa_idx31.i, align 8, !tbaa.struct !256
  %agg.tmp.sroa.2.0.copyload.i2 = bitcast float* %agg.tmp.sroa.2.0.copyload.i to i8*
  %agg.tmp.sroa.3.0..sroa_idx32.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 2
  %agg.tmp.sroa.3.0.copyload.i = load float*, float** %agg.tmp.sroa.3.0..sroa_idx32.i, align 8, !tbaa.struct !257
  %agg.tmp.sroa.4.0..sroa_idx33.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 3
  %agg.tmp.sroa.4.0.copyload.i = load i64, i64* %agg.tmp.sroa.4.0..sroa_idx33.i, align 8, !tbaa.struct !258
  %agg.tmp.sroa.5.0..sroa_idx34.i = getelementptr inbounds %struct.NormalizedKernelType.137, %struct.NormalizedKernelType.137* %__functor.val, i64 0, i32 0, i32 4
  %agg.tmp.sroa.5.0.copyload.i = load float*, float** %agg.tmp.sroa.5.0..sroa_idx34.i, align 8, !tbaa.struct !246
  %agg.tmp.sroa.5.0.copyload.i8 = bitcast float* %agg.tmp.sroa.5.0.copyload.i to i8*
  %cmp.i.i.i.i = icmp ult i64 %retval.sroa.0.0.copyload.i.i16.i, 2147483648
  tail call void @llvm.assume(i1 %cmp.i.i.i.i) #30
  %cmp.i5.i.i.i = icmp ult i64 %retval.sroa.2.0.copyload.i.i18.i, 2147483648
  tail call void @llvm.assume(i1 %cmp.i5.i.i.i) #30
  %cmp22.not.i.i.i = icmp eq i64 %agg.tmp.sroa.0.0.copyload.i, 0
  br i1 %cmp22.not.i.i.i, label %_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit, label %for.body.lr.ph.i.i.i

for.body.lr.ph.i.i.i:                             ; preds = %entry.split
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
  %9 = load float, float* %arrayidx.i.i.i, align 4, !tbaa !8, !alias.scope !259
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
  %wide.load = load <4 x float>, <4 x float>* %12, align 4, !tbaa !8, !alias.scope !262
  %13 = getelementptr inbounds float, float* %11, i64 4
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load13 = load <4 x float>, <4 x float>* %14, align 4, !tbaa !8, !alias.scope !262
  %15 = add i64 %index, %mul10.i.i.i
  %16 = getelementptr inbounds float, float* %agg.tmp.sroa.2.0.copyload.i, i64 %15
  %17 = bitcast float* %16 to <4 x float>*
  %wide.load14 = load <4 x float>, <4 x float>* %17, align 4, !tbaa !8, !alias.scope !264, !noalias !266
  %18 = getelementptr inbounds float, float* %16, i64 4
  %19 = bitcast float* %18 to <4 x float>*
  %wide.load15 = load <4 x float>, <4 x float>* %19, align 4, !tbaa !8, !alias.scope !264, !noalias !266
  %20 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.load14)
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat17, <4 x float> %wide.load13, <4 x float> %wide.load15)
  %22 = bitcast float* %16 to <4 x float>*
  store <4 x float> %20, <4 x float>* %22, align 4, !tbaa !8, !alias.scope !264, !noalias !266
  %23 = bitcast float* %18 to <4 x float>*
  store <4 x float> %21, <4 x float>* %23, align 4, !tbaa !8, !alias.scope !264, !noalias !266
  %index.next = add nuw i64 %index, 8
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !267

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
  br i1 %exitcond.not.i.i.i, label %_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit, label %for.body.i.i.i, !llvm.loop !268

_ZZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_EN20NormalizedKernelTypeclERKNS0_7nd_itemILi2EEE.exit: ; preds = %for.body.i.i.i, %middle.block, %entry.split
  ret void
}

; Function Attrs: mustprogress uwtable
define internal noundef i1 @_ZNSt14_Function_base13_Base_managerIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS3_E_clES5_EUlNS2_2idILi2EEEE_NS2_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NSA_IXT1_ELb1EEEEE5valueEPT_E4typeERKSF_E20NormalizedKernelTypeE10_M_managerERSt9_Any_dataRKSN_St18_Manager_operation(%"union.std::_Any_data"* nocapture noundef nonnull align 8 dereferenceable(16) %__dest, %"union.std::_Any_data"* nocapture noundef nonnull readonly align 8 dereferenceable(16) %__source, i32 noundef %__op) #20 align 2 personality i32 (...)* @__gxx_personality_v0 {
entry.split:
  switch i32 %__op, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry.split
  %0 = bitcast %"union.std::_Any_data"* %__dest to %"class.std::type_info"**
  store %"class.std::type_info"* bitcast ({ i8*, i8* }* @_ZTIZN2cl4sycl7handler15ResetHostKernelIZZ4mainENKUlRS1_E_clES3_EUlNS0_2idILi2EEEE_NS0_4itemILi2ELb1EEELi2EEENSt9enable_ifIXsr3std7is_sameIT0_NS8_IXT1_ELb1EEEEE5valueEPT_E4typeERKSD_E20NormalizedKernelType to %"class.std::type_info"*), %"class.std::type_info"** %0, align 8, !tbaa !64
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry.split
  %1 = bitcast %"union.std::_Any_data"* %__source to %struct.NormalizedKernelType.137**
  %__source.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %1, align 8, !tbaa !64
  %2 = bitcast %"union.std::_Any_data"* %__dest to %struct.NormalizedKernelType.137**
  store %struct.NormalizedKernelType.137* %__source.val, %struct.NormalizedKernelType.137** %2, align 8, !tbaa !64
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry.split
  %3 = bitcast %"union.std::_Any_data"* %__source to i8**
  %__source.val12 = load i8*, i8** %3, align 8
  %call.i = tail call noalias noundef nonnull dereferenceable(40) i8* @_Znwm(i64 noundef 40) #32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %call.i, i8* noundef nonnull align 8 dereferenceable(40) %__source.val12, i64 40, i1 false), !tbaa.struct !255
  %4 = bitcast %"union.std::_Any_data"* %__dest to i8**
  store i8* %call.i, i8** %4, align 8, !tbaa !64
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry.split
  %5 = bitcast %"union.std::_Any_data"* %__dest to %struct.NormalizedKernelType.137**
  %__dest.val = load %struct.NormalizedKernelType.137*, %struct.NormalizedKernelType.137** %5, align 8, !tbaa !64
  %isnull.i = icmp eq %struct.NormalizedKernelType.137* %__dest.val, null
  br i1 %isnull.i, label %sw.epilog, label %delete.notnull.i

delete.notnull.i:                                 ; preds = %sw.bb5
  %6 = bitcast %struct.NormalizedKernelType.137* %__dest.val to i8*
  tail call void @_ZdlPv(i8* noundef %6) #34
  br label %sw.epilog

sw.epilog:                                        ; preds = %delete.notnull.i, %sw.bb5, %entry.split, %sw.bb4, %sw.bb1, %sw.bb
  ret i1 false
}

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), double noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_gemm_sycl1_d641cb.cpp() #12 section ".text.startup" {
entry.split:
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #28

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #28

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #28

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smax.i64(i64, i64) #28

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #28

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #2 = { nofree nounwind }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind writeonly uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #4 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly mustprogress nofree nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #7 = { argmemonly mustprogress nofree nosync nounwind readonly willreturn uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #8 = { norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
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
!48 = !{!40}
!49 = !{!37, !41, !42, !43}
!50 = !{!43}
!51 = !{!40, !37, !41, !42}
!52 = distinct !{!52, !14}
!53 = distinct !{!53, !14}
!54 = !{!41}
!55 = !{!40, !37, !42, !43}
!56 = distinct !{!56, !57}
!57 = !{!"llvm.loop.vectorize.enable", i1 false}
!58 = distinct !{!58, !57}
!59 = distinct !{!59, !57}
!60 = distinct !{!60, !57}
!61 = distinct !{!61, !57}
!62 = distinct !{!62, !57}
!63 = distinct !{!63, !13}
!64 = !{!65, !65, i64 0}
!65 = !{!"any pointer", !10, i64 0}
!66 = !{!67, !67, i64 0}
!67 = !{!"long", !10, i64 0}
!68 = !{!69, !65, i64 0}
!69 = !{!"_ZTSNSt12_Vector_baseISt10shared_ptrIN2cl4sycl6detail20PropertyWithDataBaseEESaIS5_EE17_Vector_impl_dataE", !65, i64 0, !65, i64 8, !65, i64 16}
!70 = !{!69, !65, i64 8}
!71 = !{!72, !65, i64 0}
!72 = !{!"_ZTSSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE", !65, i64 0}
!73 = !{!74, !74, i64 0}
!74 = !{!"int", !10, i64 0}
!75 = !{!76, !76, i64 0}
!76 = !{!"vtable pointer", !11, i64 0}
!77 = distinct !{!77, !13}
!78 = !{!79, !65, i64 0}
!79 = !{!"_ZTSN2cl4sycl6detail13code_locationE", !65, i64 0, !65, i64 8, !67, i64 16, !67, i64 24}
!80 = !{!81}
!81 = distinct !{!81, !82, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!82 = distinct !{!82, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!83 = !{!79, !65, i64 8}
!84 = !{!85}
!85 = distinct !{!85, !86, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!86 = distinct !{!86, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!87 = !{!88}
!88 = distinct !{!88, !89, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!89 = distinct !{!89, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!90 = distinct !{!90, !13, !14}
!91 = distinct !{!91, !13, !16, !14}
!92 = distinct !{!92, !13, !14}
!93 = distinct !{!93, !13, !16, !14}
!94 = distinct !{!94, !13, !14}
!95 = distinct !{!95, !13, !16, !14}
!96 = distinct !{!96, !13, !14}
!97 = distinct !{!97, !13, !16, !14}
!98 = distinct !{!98, !13, !14}
!99 = distinct !{!99, !13, !16, !14}
!100 = distinct !{!100, !13, !14}
!101 = distinct !{!101, !13, !16, !14}
!102 = !{!103}
!103 = distinct !{!103, !104, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!104 = distinct !{!104, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!105 = !{!106}
!106 = distinct !{!106, !107, !"_ZN2cl4sycl5queue6submitIZ4mainEUlRNS0_7handlerEE_EENS0_5eventET_RKNS0_6detail13code_locationE: %agg.result"}
!107 = distinct !{!107, !"_ZN2cl4sycl5queue6submitIZ4mainEUlRNS0_7handlerEE_EENS0_5eventET_RKNS0_6detail13code_locationE"}
!108 = !{!109, !65, i64 24}
!109 = !{!"_ZTSSt8functionIFvRN2cl4sycl7handlerEEE", !65, i64 24}
!110 = !{!111, !65, i64 16}
!111 = !{!"_ZTSSt14_Function_base", !10, i64 0, !65, i64 16}
!112 = !{!113}
!113 = distinct !{!113, !114, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm: %agg.result"}
!114 = distinct !{!114, !"_ZN2cl4sycl6detail13code_location7currentEPKcS4_mm"}
!115 = distinct !{!115, !13, !14}
!116 = !{!117}
!117 = distinct !{!117, !118}
!118 = distinct !{!118, !"LVerDomain"}
!119 = !{!120}
!120 = distinct !{!120, !118}
!121 = !{!122}
!122 = distinct !{!122, !118}
!123 = !{!117, !120}
!124 = distinct !{!124, !13, !14}
!125 = !{!126, !65, i64 240}
!126 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !65, i64 216, !10, i64 224, !127, i64 225, !65, i64 232, !65, i64 240, !65, i64 248, !65, i64 256}
!127 = !{!"bool", !10, i64 0}
!128 = !{!129, !10, i64 56}
!129 = !{!"_ZTSSt5ctypeIcE", !65, i64 16, !127, i64 24, !65, i64 32, !65, i64 40, !65, i64 48, !10, i64 56, !10, i64 57, !10, i64 313, !10, i64 569}
!130 = !{!10, !10, i64 0}
!131 = !{!132}
!132 = distinct !{!132, !133, !"polly.alias.scope.MemRef1"}
!133 = distinct !{!133, !"polly.alias.scope.domain"}
!134 = !{!135, !136, !137, !138}
!135 = distinct !{!135, !133, !"polly.alias.scope.MemRef0"}
!136 = distinct !{!136, !133, !"polly.alias.scope.MemRef2"}
!137 = distinct !{!137, !133, !"polly.alias.scope.Packed_B"}
!138 = distinct !{!138, !133, !"polly.alias.scope.Packed_A"}
!139 = !{!137}
!140 = !{!135, !132, !136, !138}
!141 = distinct !{!141, !14}
!142 = distinct !{!142, !14}
!143 = !{!135}
!144 = !{!132, !136, !137, !138}
!145 = !{!138}
!146 = !{!135, !132, !136, !137}
!147 = distinct !{!147, !14}
!148 = distinct !{!148, !14}
!149 = !{!136}
!150 = !{!135, !132, !137, !138}
!151 = distinct !{!151, !57}
!152 = distinct !{!152, !57}
!153 = distinct !{!153, !57}
!154 = distinct !{!154, !57}
!155 = distinct !{!155, !57}
!156 = distinct !{!156, !57}
!157 = distinct !{!157, !14}
!158 = distinct !{!158, !14}
!159 = !{!160, !65, i64 0}
!160 = !{!"_ZTSZ4mainEUlRN2cl4sycl7handlerEE_", !65, i64 0, !65, i64 8, !65, i64 16, !65, i64 24, !65, i64 32, !65, i64 40}
!161 = !{!160, !65, i64 8}
!162 = !{!160, !65, i64 16}
!163 = !{!160, !65, i64 24}
!164 = !{!160, !65, i64 32}
!165 = !{!160, !65, i64 40}
!166 = !{!167, !182, i64 360}
!167 = !{!"_ZTSN2cl4sycl7handlerE", !168, i64 0, !169, i64 16, !170, i64 40, !171, i64 64, !172, i64 88, !173, i64 112, !174, i64 136, !174, i64 160, !175, i64 184, !176, i64 208, !179, i64 312, !181, i64 344, !182, i64 360, !65, i64 368, !65, i64 376, !67, i64 384, !183, i64 392, !184, i64 416, !187, i64 424, !67, i64 432, !190, i64 440, !193, i64 448, !193, i64 472, !127, i64 496, !79, i64 504, !127, i64 536, !194, i64 544}
!168 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail10queue_implEE"}
!169 = !{!"_ZTSSt6vectorIS_IcSaIcEESaIS1_EE"}
!170 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail16AccessorImplHostEESaIS5_EE"}
!171 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail21LocalAccessorImplHostEESaIS5_EE"}
!172 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail11stream_implEESaIS5_EE"}
!173 = !{!"_ZTSSt6vectorISt10shared_ptrIKvESaIS2_EE"}
!174 = !{!"_ZTSSt6vectorIN2cl4sycl6detail7ArgDescESaIS3_EE"}
!175 = !{!"_ZTSSt6vectorIPN2cl4sycl6detail16AccessorImplHostESaIS4_EE"}
!176 = !{!"_ZTSN2cl4sycl6detail8NDRDescTE", !177, i64 0, !177, i64 24, !178, i64 48, !177, i64 72, !67, i64 96}
!177 = !{!"_ZTSN2cl4sycl5rangeILi3EEE"}
!178 = !{!"_ZTSN2cl4sycl2idILi3EEE"}
!179 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !180, i64 0, !67, i64 8, !10, i64 16}
!180 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !65, i64 0}
!181 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail11kernel_implEE"}
!182 = !{!"_ZTSN2cl4sycl6detail2CG6CGTYPEE", !10, i64 0}
!183 = !{!"_ZTSSt6vectorIcSaIcEE"}
!184 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE", !185, i64 0}
!185 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EE", !186, i64 0}
!186 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail14HostKernelBaseESt14default_deleteIS3_EEE"}
!187 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EE", !188, i64 0}
!188 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EE", !189, i64 0}
!189 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail8HostTaskESt14default_deleteIS3_EEE"}
!190 = !{!"_ZTSSt10unique_ptrIN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EE", !191, i64 0}
!191 = !{!"_ZTSSt15__uniq_ptr_implIN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EE", !192, i64 0}
!192 = !{!"_ZTSSt5tupleIJPN2cl4sycl6detail11InteropTaskESt14default_deleteIS3_EEE"}
!193 = !{!"_ZTSSt6vectorISt10shared_ptrIN2cl4sycl6detail10event_implEESaIS5_EE"}
!194 = !{!"_ZTSN2cl4sycl5eventE", !195, i64 0}
!195 = !{!"_ZTSSt10shared_ptrIN2cl4sycl6detail10event_implEE"}
!196 = !{!180, !65, i64 0}
!197 = !{!179, !65, i64 0}
!198 = !{!199, !65, i64 24}
!199 = !{!"_ZTSSt8functionIFvRKN2cl4sycl7nd_itemILi2EEEEE", !65, i64 24}
!200 = !{!201, !65, i64 8}
!201 = !{!"_ZTSSt9type_info", !65, i64 8}
!202 = !{!203, !65, i64 0}
!203 = !{!"_ZTSNSt12_Vector_baseIN2cl4sycl6detail7ArgDescESaIS3_EE17_Vector_impl_dataE", !65, i64 0, !65, i64 8, !65, i64 16}
!204 = !{!203, !65, i64 8}
!205 = !{!179, !67, i64 8}
!206 = !{!167, !67, i64 432}
!207 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 8, !64, i64 32, i64 8, !64, i64 40, i64 8, !64}
!208 = !{!209, !65, i64 0}
!209 = !{!"_ZTSSt12__shared_ptrIN2cl4sycl7contextELN9__gnu_cxx12_Lock_policyE2EE", !65, i64 0, !72, i64 8}
!210 = !{!211}
!211 = distinct !{!211, !212, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!212 = distinct !{!212, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!213 = !{!214}
!214 = distinct !{!214, !215, !"_ZN2cl4sycl6detailL12codeToStringB5cxx11Ei: %agg.result"}
!215 = distinct !{!215, !"_ZN2cl4sycl6detailL12codeToStringB5cxx11Ei"}
!216 = !{!217}
!217 = distinct !{!217, !218, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!218 = distinct !{!218, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!219 = !{!217, !214}
!220 = !{!221}
!221 = distinct !{!221, !222, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!222 = distinct !{!222, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!223 = !{!221, !214}
!224 = !{!225}
!225 = distinct !{!225, !226, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: %agg.result"}
!226 = distinct !{!226, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!227 = !{!225, !214}
!228 = !{!229}
!229 = distinct !{!229, !230, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_: %agg.result"}
!230 = distinct !{!230, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_"}
!231 = !{!232, !74, i64 40}
!232 = !{!"_ZTSN2cl4sycl9exceptionE", !179, i64 8, !74, i64 40, !233, i64 48}
!233 = !{!"_ZTSSt10shared_ptrIN2cl4sycl7contextEE"}
!234 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 4, !73, i64 28, i64 4, !73}
!235 = !{!176, !67, i64 96}
!236 = !{!237}
!237 = distinct !{!237, !238, !"_ZN2cl4syclmlERKNS0_5rangeILi3EEES4_: %agg.result"}
!238 = distinct !{!238, !"_ZN2cl4syclmlERKNS0_5rangeILi3EEES4_"}
!239 = distinct !{!239, !13}
!240 = distinct !{!240, !13}
!241 = distinct !{!241, !13}
!242 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 8, !64, i64 32, i64 8, !64}
!243 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 8, !64}
!244 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64}
!245 = !{i64 0, i64 8, !64, i64 8, i64 8, !64}
!246 = !{i64 0, i64 8, !64}
!247 = !{!248}
!248 = distinct !{!248, !249, !"_ZN2cl4sycl6detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE: %agg.result"}
!249 = distinct !{!249, !"_ZN2cl4sycl6detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE"}
!250 = distinct !{!250, !13}
!251 = distinct !{!251, !13, !252}
!252 = !{!"llvm.loop.unswitch.partial.disable"}
!253 = distinct !{!253, !13}
!254 = distinct !{!254, !13}
!255 = !{i64 0, i64 8, !66, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 8, !66, i64 32, i64 8, !64}
!256 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !66, i64 24, i64 8, !64}
!257 = !{i64 0, i64 8, !64, i64 8, i64 8, !66, i64 16, i64 8, !64}
!258 = !{i64 0, i64 8, !66, i64 8, i64 8, !64}
!259 = !{!260}
!260 = distinct !{!260, !261}
!261 = distinct !{!261, !"LVerDomain"}
!262 = !{!263}
!263 = distinct !{!263, !261}
!264 = !{!265}
!265 = distinct !{!265, !261}
!266 = !{!260, !263}
!267 = distinct !{!267, !13, !14}
!268 = distinct !{!268, !13, !14}

; __CLANG_OFFLOAD_BUNDLE____END__ host-aarch64-unknown-linux-gnu
