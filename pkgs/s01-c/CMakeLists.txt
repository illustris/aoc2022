project(s01-c)
add_executable(s01-c main.c)
install(PROGRAMS ${CMAKE_BINARY_DIR}/s01-c DESTINATION bin)
