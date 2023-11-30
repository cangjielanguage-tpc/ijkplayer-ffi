/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http: *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
