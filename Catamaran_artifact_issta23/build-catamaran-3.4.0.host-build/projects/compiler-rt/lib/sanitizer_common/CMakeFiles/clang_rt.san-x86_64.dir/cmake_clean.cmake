file(REMOVE_RECURSE
  "../../../../lib/clang/3.4/lib/linux/libclang_rt.san-x86_64.a"
  "../../../../lib/clang/3.4/lib/linux/libclang_rt.san-x86_64.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/clang_rt.san-x86_64.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
