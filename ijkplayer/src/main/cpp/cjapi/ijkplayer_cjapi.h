/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 * Description: Ijkplayer for Cangjie API
 * Author: lwx1039820
 * Create: 2023-10-1
 * Notes: 2023-10-1 Create
 */

#ifndef ijkplayer_ijkplayer_cjapi_H
#define ijkplayer_ijkplayer_cjapi_H
#include "../api/ijkplayer_api.h"
#ifdef __cplusplus
extern "C" {
#endif

void ijk_nativeOpenlog(char *xcomponentId);
void ijk_setDataSource(char *xcomponentId, char *url);
void ijk_setOption(char *xcomponentId, char *category, char *name, char *value);
void ijk_setOptionLong(char *xcomponentId, char *category, char *name, char *value);
void ijk_prepareAsync(char *xcomponentId);
void ijk_start(char *xcomponentId);
void ijk_stop(char *xcomponentId);
void ijk_pause(char *xcomponentId);
void ijk_reset(char *xcomponentId);
void ijk_release(char *xcomponentId);
void ijk_seekTo(char *xcomponentId, char *msec);
bool ijk_isPlaying(char *xcomponentId);
int ijk_getDuration(char *xcomponentId);
int ijk_getCurrentPosition(char *xcomponentId);
int ijk_getAudioSessionId(char *xcomponentId);
void ijk_setPropertyFloat(char *xcomponentId, char *ids, char *value);
float ijk_getPropertyFloat(char *xcomponentId, char *ids, char *default_value);
void ijk_setPropertyLong(char *xcomponentId, char *property, char *value);
long long ijk_getPropertyLong(char *xcomponentId, char *property, char *value);
void ijk_setVolume(char *xcomponentId, char *leftVolume, char *rightVolume);
void ijk_setLoopCount(char *xcomponentId, char *loopCount);
int ijk_getLoopCount(char *xcomponentId);
void ijk_setStreamSelected(char *xcomponentId, char *stream, char *select);
char *ijk_getVideoCodecInfo(char *xcomponentId);
char *ijk_getAudioCodecInfo(char *xcomponentId);
char *ijk_getMediaMeta(char *xcomponentId);
void ijk_native_setup(char *xcomponentId);

#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */
#endif /* ijkplayer_ijkplayer_cjapi.h_H */
