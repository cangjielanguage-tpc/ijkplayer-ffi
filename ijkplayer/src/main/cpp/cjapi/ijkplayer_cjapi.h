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

void cj_nativeOpenlog(char *xcomponentId);
void cj_setDataSource(char *xcomponentId, char *url);
void cj_setOption(char *xcomponentId, char *category, char *name, char *value);
void cj_setOptionLong(char *xcomponentId, char *category, char *name, char *value);
void cj_prepareAsync(char *xcomponentId);
void cj_start(char *xcomponentId);
void cj_stop(char *xcomponentId);
void cj_pause(char *xcomponentId);
void cj_reset(char *xcomponentId);
void cj_release(char *xcomponentId);
void cj_seekTo(char *xcomponentId, char *msec);
bool cj_isPlaying(char *xcomponentId);
int cj_getDuration(char *xcomponentId);
int cj_getCurrentPosition(char *xcomponentId);
int cj_getAudioSessionId(char *xcomponentId);
void cj_setPropertyFloat(char *xcomponentId, char *ids, char *value);
float cj_getPropertyFloat(char *xcomponentId, char *ids, char *default_value);
void cj_setPropertyLong(char *xcomponentId, char *property, char *value);
long long cj_getPropertyLong(char *xcomponentId, char *property, char *value);
void cj_setVolume(char *xcomponentId, char *leftVolume, char *rightVolume);
void cj_setLoopCount(char *xcomponentId, char *loopCount);
int cj_getLoopCount(char *xcomponentId);
void cj_setStreamSelected(char *xcomponentId, char *stream, char *select);
char *cj_getVideoCodecInfo(char *xcomponentId);
char *cj_getAudioCodecInfo(char *xcomponentId);
char *cj_getMediaMeta(char *xcomponentId);
void cj_native_setup(char *xcomponentId);

#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */
#endif /* ijkplayer_ijkplayer_cjapi.h_H */
