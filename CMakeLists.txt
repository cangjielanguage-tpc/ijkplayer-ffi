cmake_minimum_required(VERSION 3.4.1)
project(ijkplayer4cj C)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
set(CMAKE_C_STANDARD 99)
set(EXEC_A main.out)
set(IJK_PLAYER_INCLUDE include)
set(IJK_PLAYER_SRC src)
add_compile_options(-fPIC)
include_directories(${PROJECT_SOURCE_DIR}/${IJK_PLAYER_INCLUDE})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
add_subdirectory(${IJK_PLAYER_SRC})


