# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appNavestidlo_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appNavestidlo_autogen.dir/ParseCache.txt"
  "appNavestidlo_autogen"
  )
endif()
