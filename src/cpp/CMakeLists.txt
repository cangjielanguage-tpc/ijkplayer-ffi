cmake_minimum_required(VERSION 3.4.1)
project(ijkplayer4cj C)
add_compile_options(-fPIC)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-int-conversion")

# add_definitions(-DOHOS_PLATFORM)

add_library(ijkplayer4cj_ffi SHARED
            utils/hashmap/data_struct.c
            utils/ffmpeg/custom_ffmpeg_log.c
            )

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/third_party/ffmpeg/include)
add_subdirectory(ijksdl)
add_subdirectory(ijkplayer)

# add_library(ijkffmpeg SHARED IMPORTED )

# set_target_properties(ijkffmpeg
#         PROPERTIES IMPORTED_LOCATION
#         ${CMAKE_SOURCE_DIR}/../../../libs/${OHOS_ARCH}/libijkffmpeg.z.so)

# target_link_libraries(ijkplayer_napi PUBLIC ijkplayer)
# target_link_libraries(ijkplayer_napi PUBLIC ijksdl)
# target_link_libraries(ijkplayer_napi PUBLIC ijkffmpeg)
# target_link_libraries(ijkplayer_napi PUBLIC EGL) # OpenGL ES/EGL
# target_link_libraries(ijkplayer_napi PUBLIC GLESv3) #  OpenGL ES 3.0
# target_link_libraries(ijkplayer_napi PUBLIC hilog_ndk.z)
# target_link_libraries(ijkplayer_napi PUBLIC ace_ndk.z)
# target_link_libraries(ijkplayer_napi PUBLIC ace_napi.z)
# target_link_libraries(ijkplayer_napi PUBLIC uv)
