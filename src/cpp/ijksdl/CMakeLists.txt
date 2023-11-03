cmake_minimum_required(VERSION 3.4.1)
project(ijkplayer4cj)
add_compile_options(-fPIC)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -Wno-int-conversion")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -Wno-int-conversion")

add_definitions(-DOHOS_PLATFORM)

add_library(ijksdl  SHARED    ijksdl_aout.c
                              ijksdl_audio.c
                              ijksdl_egl.c
                              ijksdl_error.c
                              ijksdl_mutex.c
                              ijksdl_stdinc.c
                              ijksdl_thread.c
                              ijksdl_timer.c
                              ijksdl_vout.c
                              ijksdl_extra_log.c
                              video/gles2/color.c
                              video/gles2/common.c
                              video/gles2/renderer.c
                              video/gles2/renderer_rgb.c
                              video/gles2/renderer_yuv420p.c
                              video/gles2/renderer_yuv444p10le.c
                              video/gles2/shader.c
                              video/gles2/fsh/rgb.fsh.c
                              video/gles2/fsh/yuv420p.fsh.c
                              video/gles2/fsh/yuv444p10le.fsh.c
                              video/gles2/vsh/mvp.vsh.c
                              video/ijksdl_vout_android_nativewindow.c
                              video/ijksdl_vout_android_surface.c
                              ffmpeg/ijksdl_vout_overlay_ffmpeg.c
                              ffmpeg/abi_all/image_convert.c
                              audio/ijksdl_aout_android_opensles.c
                              dummy/ijksdl_vout_dummy.c
                              {CMAKE_CURRENT_SOURCE_DIR}/../../utils/ohoslog/ohos_log.cpp
                               )

# add_library(yuv SHARED IMPORTED)
# set_target_properties(yuv PROPERTIES IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/../../../lib/libyuv.so)

# add_library(ijkffmpeg SHARED IMPORTED)
# set_target_properties(ijkffmpeg PROPERTIES IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/../../../lib/libffmpeg.so)

#add_library(ijkOpenSLES SHARED IMPORTED)
#set_target_properties(ijkOpenSLES PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../../../../libs/${OHOS_ARCH}/libijkOpenSLES.so)


include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/ffmpeg/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/yuv/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/soundtouch/include)

target_link_libraries(ijksdl ${CMAKE_SOURCE_DIR}/lib/libffmpeg.so)
target_link_libraries(ijksdl ${CMAKE_SOURCE_DIR}/lib/libyuv.so)
target_link_libraries(ijksdl EGL)
target_link_libraries(ijksdl GLESv2)
target_link_libraries(ijksdl ${CMAKE_SOURCE_DIR}/lib/libijkplayer4cj_ffi.so)
# target_link_libraries(ijksdl hilog_ndk.z)
# target_link_libraries(ijksdl OpenSLES)