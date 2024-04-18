// This is auto-generated SYCL integration header.

#include <CL/sycl/detail/defines_elementary.hpp>
#include <CL/sycl/detail/kernel_desc.hpp>

#ifndef SYCL_LANGUAGE_VERSION
#define SYCL_LANGUAGE_VERSION 202001
#endif //SYCL_LANGUAGE_VERSION

// Forward declarations of templated kernel function types:
template <typename DataT, int Dims> class MicroBenchDRAMKernel;
inline namespace cl { namespace sycl { namespace detail { 
template <typename Name> class __pf_kernel_wrapper;
}}}

__SYCL_INLINE_NAMESPACE(cl) {
namespace sycl {
namespace detail {
// names of all kernels defined in the corresponding source
static constexpr
const char* const kernel_names[] = {
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi1EEEE",
  "_ZTS20MicroBenchDRAMKernelIfLi1EE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi2EEEE",
  "_ZTS20MicroBenchDRAMKernelIfLi2EE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi3EEEE",
  "_ZTS20MicroBenchDRAMKernelIfLi3EE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi1EEEE",
  "_ZTS20MicroBenchDRAMKernelIdLi1EE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi2EEEE",
  "_ZTS20MicroBenchDRAMKernelIdLi2EE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi3EEEE",
  "_ZTS20MicroBenchDRAMKernelIdLi3EE"
};

// array representing signatures of all kernels defined in the
// corresponding source
static constexpr
const kernel_param_desc_t kernel_signatures[] = {
  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi1EEEE
  { kernel_param_kind_t::kind_std_layout, 8, 0 },
  { kernel_param_kind_t::kind_accessor, 4062, 8 },
  { kernel_param_kind_t::kind_accessor, 4062, 40 },

  //--- _ZTS20MicroBenchDRAMKernelIfLi1EE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },
  { kernel_param_kind_t::kind_accessor, 4062, 32 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi2EEEE
  { kernel_param_kind_t::kind_std_layout, 16, 0 },
  { kernel_param_kind_t::kind_accessor, 6110, 16 },
  { kernel_param_kind_t::kind_accessor, 6110, 72 },

  //--- _ZTS20MicroBenchDRAMKernelIfLi2EE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },
  { kernel_param_kind_t::kind_accessor, 6110, 56 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi3EEEE
  { kernel_param_kind_t::kind_std_layout, 24, 0 },
  { kernel_param_kind_t::kind_accessor, 8158, 24 },
  { kernel_param_kind_t::kind_accessor, 8158, 104 },

  //--- _ZTS20MicroBenchDRAMKernelIfLi3EE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },
  { kernel_param_kind_t::kind_accessor, 8158, 80 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi1EEEE
  { kernel_param_kind_t::kind_std_layout, 8, 0 },
  { kernel_param_kind_t::kind_accessor, 4062, 8 },
  { kernel_param_kind_t::kind_accessor, 4062, 40 },

  //--- _ZTS20MicroBenchDRAMKernelIdLi1EE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },
  { kernel_param_kind_t::kind_accessor, 4062, 32 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi2EEEE
  { kernel_param_kind_t::kind_std_layout, 16, 0 },
  { kernel_param_kind_t::kind_accessor, 6110, 16 },
  { kernel_param_kind_t::kind_accessor, 6110, 72 },

  //--- _ZTS20MicroBenchDRAMKernelIdLi2EE
  { kernel_param_kind_t::kind_accessor, 6110, 0 },
  { kernel_param_kind_t::kind_accessor, 6110, 56 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },

  //--- _ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },

  //--- _ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi3EEEE
  { kernel_param_kind_t::kind_std_layout, 24, 0 },
  { kernel_param_kind_t::kind_accessor, 8158, 24 },
  { kernel_param_kind_t::kind_accessor, 8158, 104 },

  //--- _ZTS20MicroBenchDRAMKernelIdLi3EE
  { kernel_param_kind_t::kind_accessor, 8158, 0 },
  { kernel_param_kind_t::kind_accessor, 8158, 80 },

  { kernel_param_kind_t::kind_invalid, -987654321, -987654321 }, 
};

// Specializations of KernelInfo for kernel function types:
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+0];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 1, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 32; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+1];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 1, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 32; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 1>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi1EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+2];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 1>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 72; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<float, 1>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIfLi1EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+5];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<float, 1>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 64; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '2', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+7];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 2, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 56; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '2', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+8];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 2, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 56; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 2>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi2EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+9];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 2>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 128; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<float, 2>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIfLi2EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+12];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<float, 2>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 112; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '3', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+14];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 3, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 80; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '3', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIfLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+15];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<float, 3, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 80; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 3>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIfLi3EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+16];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<float, 3>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 184; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<float, 3>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIfLi3EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+19];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<float, 3>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 160; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+21];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 1, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 32; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+22];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 1, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 32; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 1>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi1EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+23];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 1>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 72; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<double, 1>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIdLi1EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+26];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<double, 1>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 64; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '2', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+28];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 2, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 56; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '2', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi2ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+29];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 2, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 56; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 2>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi2EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+30];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 2>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 128; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<double, 2>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIdLi2EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+33];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<double, 2>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 112; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '3', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+35];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 3, static_cast<::sycl::access::mode>(1024), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 80; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '2', 'c', 'l', '4', 's', 'y', 'c', 'l', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'd', 'L', 'i', '3', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN2cl4sycl8accessorIdLi3ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 1; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+36];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "prefetched_buffer.h";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::InitializationDummyKernel<::sycl::accessor<double, 3, static_cast<::sycl::access::mode>(1027), static_cast<::sycl::access::target>(2014), static_cast<::sycl::access::placeholder>(0), ::sycl::ext::oneapi::accessor_property_list<>>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 6;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 80; }
};
template <> struct KernelInfo<::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 3>>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTSN2cl4sycl6detail19__pf_kernel_wrapperI20MicroBenchDRAMKernelIdLi3EEEE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 3; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+37];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "handler.hpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::sycl::detail::__pf_kernel_wrapper<::MicroBenchDRAMKernel<double, 3>>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 203;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 7;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 184; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<double, 3>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIdLi3EE"; }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getNumParams() { return 2; }
  __SYCL_DLL_LOCAL
  static constexpr const kernel_param_desc_t& getParamDesc(unsigned i) {
    return kernel_signatures[i+40];
  }
  __SYCL_DLL_LOCAL
  static constexpr bool isESIMD() { return 0; }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFileName() {
#ifndef NDEBUG
    return "DRAM.cpp";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr const char* getFunctionName() {
#ifndef NDEBUG
    return "::MicroBenchDRAMKernel<double, 3>";
#else
    return "";
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getLineNumber() {
#ifndef NDEBUG
    return 60;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 72;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long long getKernelSize() { return 160; }
};

} // namespace detail
} // namespace sycl
} // __SYCL_INLINE_NAMESPACE(cl)

