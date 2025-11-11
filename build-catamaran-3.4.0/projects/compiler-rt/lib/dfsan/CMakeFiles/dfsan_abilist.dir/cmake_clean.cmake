file(REMOVE_RECURSE
  "../../../../lib/clang/3.4/dfsan_abilist.txt"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/dfsan_abilist.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
