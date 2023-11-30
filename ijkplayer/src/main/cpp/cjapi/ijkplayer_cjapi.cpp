/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License") {}
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "../api/ijkplayer_api.h"
#include "ijkplayer_cjapi.h"

void cj_nativeOpenlog(char *xcomponentId) 
{
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_native_openlog(); 
}

void cj_setDataSource(char *xcomponentId, char *url) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_setDataSource(url);
}

void cj_setOption(char *xcomponentId, char *category, char *name, char *value) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_setOption(NapiUtil::StringToInt(category), name, value);
}

void cj_setOptionLong(char *xcomponentId, char *category, char *name, char *value) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setOptionLong(NapiUtil::StringToInt(category), name,
                                                            NapiUtil::StringToInt(value));
}

void cj_prepareAsync(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_prepareAsync();
}

void cj_start(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_start();
}

void cj_stop(char *xcomponentId) 
{  
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_stop();
}

void cj_pause(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_pause();
}

void cj_reset(char *xcomponentId) 
{  
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_reset();
}

void cj_release(char *xcomponentId) 
{  
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_release();
}

void cj_seekTo(char *xcomponentId, char *msec) 
{  
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_seekTo(NapiUtil::StringToInt(msec));
}

bool cj_isPlaying(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    return IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_isPlaying();
}

int cj_getDuration(char *xcomponentId) 
{  
    std::string str = xcomponentId;
    return IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getDuration();
}

int cj_getCurrentPosition(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    return IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getCurrentPosition();
}

int cj_getAudioSessionId(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    return IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioSessionId();
}

void cj_setPropertyFloat(char *xcomponentId, char * ids, char * value) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->ijkMediaPlayer_setPropertyFloat(NapiUtil::StringToInt(ids),
                                                               NapiUtil::StringToFloat(value));
}

float cj_getPropertyFloat(char *xcomponentId, char * ids, char * default_value) 
{ 
    std::string str = xcomponentId;
    float result = IJKPlayerApi::getInstance(str)
                       ->ijkPlayerNapiProxy_->ijkMediaPlayer_getPropertyFloat(NapiUtil::StringToInt(ids),
                                                                              NapiUtil::StringToFloat(default_value));
    return result;
}

void cj_setPropertyLong(char *xcomponentId, char *property, char *value) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->ijkMediaPlayer_setPropertyLong(NapiUtil::StringToInt(property), NapiUtil::StringToLong(value));
}

long long cj_getPropertyLong(char *xcomponentId, char *property, char *value) 
{
    std::string str = xcomponentId;
    long long result = (long long)IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->ijkMediaPlayer_getPropertyLong(
        NapiUtil::StringToInt(property), NapiUtil::StringToLong(value));
    return result;
}

void cj_setVolume(char *xcomponentId, char *leftVolume, char *rightVolume) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setVolume(NapiUtil::StringToFloat(leftVolume),
                                                        NapiUtil::StringToFloat(rightVolume));
}

void cj_setLoopCount(char *xcomponentId, char *loopCount) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setLoopCount(NapiUtil::StringToInt(loopCount));
}

int cj_getLoopCount(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    return IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getLoopCount();
}

void cj_setStreamSelected(char *xcomponentId, char *stream, char *select) 
{ 
    std::string str = xcomponentId;
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->ijkMediaPlayer_setStreamSelected(NapiUtil::StringToInt(stream),
                                                                NapiUtil::StringToBool(select));
}

char * cj_getVideoCodecInfo(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    char *result = IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getVideoCodecInfo();
    return result;
}

char *cj_getAudioCodecInfo(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    char *result = IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioCodecInfo();
    return result;
}

char *cj_getMediaMeta(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    HashMap map = IJKPlayerApi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getMediaMeta();
    HashMapIterator iterator = hashmap_iterator(map);
    std::string result = "";
    while (hashmap_hasNext(iterator)) { 
        iterator = hashmap_next(iterator);
        LOGI("napi-->getMediaMeta { key: %s, value: %s, hashcode: %d }\n", (STRING)iterator->entry->key,
             (STRING)iterator->entry->value, iterator->hashCode);
        result.append("key:");
        result.append((STRING)iterator->entry->key);
        result.append(",");
        result.append("value:");
        result.append((STRING)iterator->entry->value);
        result.append(";");
    }
    hashmap_delete(map);
    return (char *)(result.c_str());
}

void cj_native_setup(char *xcomponentId) 
{ 
    std::string str = xcomponentId;
    OH_NativeXComponent *xcomponent = IJKPlayerApi::getInstance(str)->getXComponent(str);
    void *nativeWindow = IJKPlayerApi::getInstance(str)->getNativeWindow(str);
    IJKPlayerApi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_native_setup(xcomponent, nativeWindow);
}

