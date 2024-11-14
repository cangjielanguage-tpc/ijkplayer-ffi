/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

#include "../napi/ijkplayer_napi.h"
#include "ijkplayer_cjapi.h"

void ijk_nativeOpenlog(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_native_openlog();
}

void ijk_setDataSource(char *xcomponentId, char *url)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_setDataSource(url);
}

void ijk_setOption(char *xcomponentId, char *category, char *name, char *value)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setOption(NapiUtil::StringToInt(category),
                                                        name, value);
}

void ijk_setOptionLong(char *xcomponentId, char *category, char *name, char *value)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setOptionLong(NapiUtil::StringToInt(category), name,
                                                            NapiUtil::StringToInt(value));
}

void ijk_prepareAsync(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_prepareAsync();
}

void ijk_start(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_start();
}

void ijk_stop(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_stop();
}

void ijk_pause(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_pause();
}

void ijk_reset(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_reset();
}

void ijk_release(char *xcomponentId)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_release();
}

void ijk_seekTo(char *xcomponentId, char *msec)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_seekTo(NapiUtil::StringToInt(msec));
}

bool ijk_isPlaying(char *xcomponentId)
{
    std::string str = xcomponentId;
    return IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_isPlaying();
}

int ijk_getDuration(char *xcomponentId)
{
    std::string str = xcomponentId;
    return IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getDuration();
}

int ijk_getCurrentPosition(char *xcomponentId)
{
    std::string str = xcomponentId;
    return IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getCurrentPosition();
}

int ijk_getAudioSessionId(char *xcomponentId)
{
    std::string str = xcomponentId;
    return IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioSessionId();
}

void ijk_setPropertyFloat(char *xcomponentId, char * ids, char * value)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->ijkMediaPlayer_setPropertyFloat(NapiUtil::StringToInt(ids),
                                                               NapiUtil::StringToFloat(value));
}

float ijk_getPropertyFloat(char *xcomponentId, char * ids, char * default_value)
{
    std::string str = xcomponentId;
    float result = IJKPlayerNapi::getInstance(str)
                        ->ijkPlayerNapiProxy_
                        ->ijkMediaPlayer_getPropertyFloat(NapiUtil::StringToInt(ids),
                                                          NapiUtil::StringToFloat(default_value));
    return result;
}

void ijk_setPropertyLong(char *xcomponentId, char *property, char *value)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_
        ->ijkMediaPlayer_setPropertyLong(NapiUtil::StringToInt(property),
                                         NapiUtil::StringToLong(value));
}

long long ijk_getPropertyLong(char *xcomponentId, char *property, char *value)
{
    std::string str = xcomponentId;
    long long result = (long long)IJKPlayerNapi::getInstance(str)
                            ->ijkPlayerNapiProxy_
                            ->ijkMediaPlayer_getPropertyLong(NapiUtil::StringToInt(property),
                                                             NapiUtil::StringToLong(value));
    return result;
}

void ijk_setVolume(char *xcomponentId, char *leftVolume, char *rightVolume)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setVolume(NapiUtil::StringToFloat(leftVolume),
                                                        NapiUtil::StringToFloat(rightVolume));
}

void ijk_setLoopCount(char *xcomponentId, char *loopCount)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_setLoopCount(NapiUtil::StringToInt(loopCount));
}

int ijk_getLoopCount(char *xcomponentId)
{
    std::string str = xcomponentId;
    return IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getLoopCount();
}

void ijk_setStreamSelected(char *xcomponentId, char *stream, char *select)
{
    std::string str = xcomponentId;
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->ijkMediaPlayer_setStreamSelected(NapiUtil::StringToInt(stream),
                                                                NapiUtil::StringToBool(select));
}

char *ijk_getVideoCodecInfo(char *xcomponentId)
{
    std::string str = xcomponentId;
    char *result = IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getVideoCodecInfo();
    return result;
}

char *ijk_getAudioCodecInfo(char *xcomponentId)
{
    std::string str = xcomponentId;
    char *result = IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioCodecInfo();
    return result;
}

char *ijk_getMediaMeta(char *xcomponentId)
{
    std::string str = xcomponentId;
    HashMap map = IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->IjkMediaPlayer_getMediaMeta();
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

void ijk_native_setup(char *xcomponentId)
{
    std::string str = xcomponentId;
    OH_NativeXComponent *xcomponent = IJKPlayerNapi::getInstance(str)->getXComponent(str);
    void *nativeWindow = IJKPlayerNapi::getInstance(str)->getNativeWindow(str);
    IJKPlayerNapi::getInstance(str)
        ->ijkPlayerNapiProxy_->IjkMediaPlayer_native_setup(xcomponent, nativeWindow);
}


long long ijk_getIjkplayerPtr(char *xcomponentId) 
{
    std::string str = xcomponentId;
    return (int64_t)IJKPlayerNapi::getInstance(str);
}



// napi_value IJKPlayerNapi::native_setup(napi_env env, napi_callback_info info) {
//     LOGI("napi-->native_setup");
//     std::string xcomponentId = IJKPlayerNapi::getXComponentId(env, info);
//     LOGI("napi-->native_setup id->%s", (char *)xcomponentId.c_str());
//     setXComponentId(xcomponentId);
//     OH_NativeXComponent *xcomponent = IJKPlayerNapi::getInstance(xcomponentId)->getXComponent(xcomponentId);
//     void *nativeWindow = IJKPlayerNapi::getInstance(xcomponentId)->getNativeWindow(xcomponentId);
//     IJKPlayerNapi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_native_setup(xcomponent, nativeWindow);
//     return nullptr;
// }
//
// napi_value IJKPlayerNapi::get_ijkplayer_ptr(napi_env env, napi_callback_info info) {
//     std::string xcomponentId = IJKPlayerNapi::getXComponentId(env, info);
//     return NapiUtil::SetNapiCallInt64(env, (int64_t)IJKPlayerNapi::getInstance(xcomponentId));
// }










// void ijk_setIjkplayerPtr(char *xcomponentId, char *ids) 
// {
//     std::string str = xcomponentId;
//     LOGI("napi-->ijk_setIjkplayerPtr %s %s", xcomponentId, ids);
//     IJKPlayerNapi::setInstance(str, (IJKPlayerNapi*)NapiUtil::StringToLongLong(ids));
// }

// void ijk_setMessagePostEventPtr(char *xcomponentId, char *ids)
// {
//     std::string str = xcomponentId;
//     IJKPlayerNapi::getInstance(str)->ijkPlayerNapiProxy_->message_loop_callback(
//         (void (*)(void *, int , int , int ,char *))NapiUtil::StringToLongLong(ids)
//     );
// }
