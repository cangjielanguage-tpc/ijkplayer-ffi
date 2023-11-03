cmake_minimum_required(VERSION 3.4.1)
project(ijkplayer4cj)
add_compile_options(-fPIC)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -Wno-int-conversion")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -Wno-int-conversion")

# add_definitions(-DOHOS_PLATFORM)

add_library(ijkplayer  SHARED
                               ff_cmdutils.c
                               ff_ffplay.c
                               ff_ffpipeline.c
                               ff_ffpipenode.c
                               ijkmeta.c
                               ijkplayer.c
                               ijkplayer_android.c
                               pipeline/ffpipenode_ffplay_vdec.c
                               pipeline/ffpipeline_android.c
                               ijkavformat/allformats.c
                               ijkavformat/ijklivehook.c
                               ijkavformat/ijkio.c
                               ijkavformat/ijkiomanager.c
                               ijkavformat/ijkiocache.c
                               ijkavformat/ijkioffio.c
                                ijkavformat/ijkioprotocol.c
                                ijkavformat/ijkioapplication.c
                                ijkavformat/ijkiourlhook.c
                                ijkavformat/ijkasync.c
                                ijkavformat/ijkurlhook.c
                                ijkavformat/ijklongurl.c
                                ijkavformat/ijksegment.c
                                ijkavutil/ijkdict.c
                                ijkavutil/ijkutils.c
                                ijkavutil/ijkthreadpool.c
                                 ijkavutil/ijktree.c
                                 ijkavutil/ijkfifo.c
                                 ijkavutil/ijkstl.cpp
                                  )

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/ffmpeg/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/yuv/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/soundtouch/include)



target_link_libraries(ijkplayer ${CMAKE_SOURCE_DIR}/lib/libijksdl.so)
target_link_libraries(ijkplayer ${CMAKE_SOURCE_DIR}/lib/libffmpeg.so)
target_link_libraries(ijkplayer EGL)
target_link_libraries(ijkplayer GLESv2)
# target_link_libraries(ijkplayer hilog_ndk.z)
target_link_libraries(ijkplayer ${CMAKE_SOURCE_DIR}/lib/libsoundtouch.so)