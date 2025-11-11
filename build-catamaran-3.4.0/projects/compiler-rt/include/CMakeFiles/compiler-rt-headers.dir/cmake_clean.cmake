file(REMOVE_RECURSE
  "../../../lib/clang/3.4/include/sanitizer/asan_interface.h"
  "../../../lib/clang/3.4/include/sanitizer/common_interface_defs.h"
  "../../../lib/clang/3.4/include/sanitizer/dfsan_interface.h"
  "../../../lib/clang/3.4/include/sanitizer/linux_syscall_hooks.h"
  "../../../lib/clang/3.4/include/sanitizer/lsan_interface.h"
  "../../../lib/clang/3.4/include/sanitizer/msan_interface.h"
  "CMakeFiles/compiler-rt-headers"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/compiler-rt-headers.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
