// This is auto-generated SYCL integration header.

// #include <sycl/detail/defines_elementary.hpp>
// #include <sycl/detail/kernel_desc.hpp>
#include <sycl/detail/defines_elementary.hpp>
#include <sycl/detail/kernel_desc.hpp>

#ifndef SYCL_LANGUAGE_VERSION
#define SYCL_LANGUAGE_VERSION 202001
#endif //SYCL_LANGUAGE_VERSION

// Forward declarations of templated kernel function types:
template <typename DataT, int Dims> class MicroBenchDRAMKernel;

namespace sycl {
inline namespace _V1 {
namespace detail {
// names of all kernels defined in the corresponding source
static constexpr
const char* const kernel_names[] = {
  "_ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE",
  "_ZTS20MicroBenchDRAMKernelIfLi1EE"
};

// array representing signatures of all kernels defined in the
// corresponding source
static constexpr
const kernel_param_desc_t kernel_signatures[] = {
  //--- _ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE
  { kernel_param_kind_t::kind_accessor, 4062, 0 },

  //--- _ZTS20MicroBenchDRAMKernelIfLi1EE
  { kernel_param_kind_t::kind_std_layout, 8, 0 },
  { kernel_param_kind_t::kind_accessor, 4062, 8 },
  { kernel_param_kind_t::kind_accessor, 4062, 40 },

  { kernel_param_kind_t::kind_invalid, -987654321, -987654321 }, 
};

// Specializations of KernelInfo for kernel function types:
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '4', 's', 'y', 'c', 'l', '3', '_', 'V', '1', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '4', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1024ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
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
  static constexpr long getKernelSize() { return 32; }
};
template <> struct KernelInfoData<'_', 'Z', 'T', 'S', '2', '5', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'a', 't', 'i', 'o', 'n', 'D', 'u', 'm', 'm', 'y', 'K', 'e', 'r', 'n', 'e', 'l', 'I', 'N', '4', 's', 'y', 'c', 'l', '3', '_', 'V', '1', '8', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', 'I', 'f', 'L', 'i', '1', 'E', 'L', 'N', 'S', '1', '_', '6', 'a', 'c', 'c', 'e', 's', 's', '4', 'm', 'o', 'd', 'e', 'E', '1', '0', '2', '7', 'E', 'L', 'N', 'S', '3', '_', '6', 't', 'a', 'r', 'g', 'e', 't', 'E', '2', '0', '1', '4', 'E', 'L', 'N', 'S', '3', '_', '1', '1', 'p', 'l', 'a', 'c', 'e', 'h', 'o', 'l', 'd', 'e', 'r', 'E', '0', 'E', 'N', 'S', '1', '_', '3', 'e', 'x', 't', '6', 'o', 'n', 'e', 'a', 'p', 'i', '2', '2', 'a', 'c', 'c', 'e', 's', 's', 'o', 'r', '_', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'y', '_', 'l', 'i', 's', 't', 'I', 'J', 'E', 'E', 'E', 'E', 'E', 'E'> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS25InitializationDummyKernelIN4sycl3_V18accessorIfLi1ELNS1_6access4modeE1027ELNS3_6targetE2014ELNS3_11placeholderE0ENS1_3ext6oneapi22accessor_property_listIJEEEEEE"; }
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
  static constexpr long getKernelSize() { return 32; }
};
template <> struct KernelInfo<::MicroBenchDRAMKernel<float, 1>> {
  __SYCL_DLL_LOCAL
  static constexpr const char* getName() { return "_ZTS20MicroBenchDRAMKernelIfLi1EE"; }
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
    return "DRAM-single_task.cpp";
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
    return 73;
#else
    return 0;
#endif
  }
  __SYCL_DLL_LOCAL
  static constexpr unsigned getColumnNumber() {
#ifndef NDEBUG
    return 58;
#else
    return 0;
#endif
  }
  // Returns the size of the kernel object in bytes.
  __SYCL_DLL_LOCAL
  static constexpr long getKernelSize() { return 72; }
};

} // namespace detail
} // namespace _V1
} // namespace sycl

