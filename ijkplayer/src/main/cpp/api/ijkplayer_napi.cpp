/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

#include "ijkplayer_api.h"
#include "third_party/yuv/include/libyuv/basic_types.h"

const int32_t STR_DEFAULT_SIZE = 2048;
const int32_t INDEX_0 = 0;
const int32_t INDEX_1 = 1;
const int32_t INDEX_2 = 2;
const int32_t INDEX_3 = 3;
const int32_t PARAM_COUNT_1 = 1;
const int32_t PARAM_COUNT_2 = 2;
const int32_t PARAM_COUNT_3 = 3;
const int32_t PARAM_COUNT_4 = 4;

IJKPlayerNapiProxy *IJKPlayerApi::ijkPlayerNapiProxy_;
OH_NativeXComponent_Callback IJKPlayerApi::callback_;
std::unordered_map<std::string, IJKPlayerApi *> IJKPlayerApi::ijkPlayerNapi_;
napi_env envMessage_;
napi_ref callBackRefMessage_;
std::string xcomponentId_;
bool destroyResource;

struct CallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    int what = 0;
    int arg1 = 0;
    int arg2 = 0;
    char *obj;
};

void messageCallBack(int what, int arg1, int arg2, char *obj) {
    LOGI("napi-->messageCallBack");
    struct CallbackContext *context = new CallbackContext();
    context->env = envMessage_;
    uv_loop_s *loopMessage = nullptr;
    napi_get_uv_event_loop(context->env, &loopMessage);
    if (loopMessage == nullptr) {
        LOGI("napi-->loopMessage null");
        return;
    }
    uv_work_t *work = new (std::nothrow) uv_work_t;
    if (work == nullptr) {
        LOGI("napi-->work null");
        return;
    }
    context->what = what;
    context->arg1 = arg1;
    context->arg2 = arg2;
    context->obj = obj;
    context->callbackRef = callBackRefMessage_;
    work->data = (void *)context;
    uv_queue_work(
        loopMessage, work, [](uv_work_t *work) {},
        [](uv_work_t *work, int status) {
            LOGI("napi-->uv_queue_work");
            CallbackContext *context = static_cast<CallbackContext *>(work->data);
            napi_value callback = nullptr;
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            napi_value what_;
            napi_value arg1_;
            napi_value arg2_;
            napi_value obj_;
            napi_create_string_utf8(context->env, (char *)((std::to_string(context->what)).c_str()), NAPI_AUTO_LENGTH, &what_);
            napi_create_string_utf8(context->env, (char *)((std::to_string(context->arg1)).c_str()), NAPI_AUTO_LENGTH, &arg1_);
            napi_create_string_utf8(context->env, (char *)((std::to_string(context->arg2)).c_str()), NAPI_AUTO_LENGTH, &arg2_);
            napi_value ret = 0;
            if (context->obj) {
                napi_create_string_utf8(context->env, context->obj, NAPI_AUTO_LENGTH, &obj_);
                napi_value argv_4[] = {what_, arg1_, arg2_, obj_};
                napi_call_function(context->env, nullptr, callback, PARAM_COUNT_4, argv_4, &ret);
            } else {
                napi_value argv_3[] = {what_, arg1_, arg2_};
                napi_call_function(context->env, nullptr, callback, PARAM_COUNT_3, argv_3, &ret);
            }
            if (work != nullptr) {
                delete work;
            }
            delete context;
            LOGI("napi-->uv_queue_work end");
        });
}

void post_event(void *weak_this, int what, int arg1, int arg2, char *obj) {
    LOGI("napi-->post_event-->what:%d", what);
    messageCallBack(what, arg1, arg2, obj);
}

void setEnvMessage(const napi_env &env) {
    envMessage_ = env;
}

void setCallBackRefMessage(const napi_ref &callbackRef) {
    callBackRefMessage_ = callbackRef;
}

void setXComponentId(std::string &id) {
    xcomponentId_ = id;
}

std::string IJKPlayerApi::getXComponentId(napi_env env, napi_callback_info info) {
    LOGI("napi-->IJKPlayerApi::getInstance_()->getXComponentId");
    if (destroyResource && !xcomponentId_.empty()) {
        return xcomponentId_;
    }
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    LOGI("napi-->IJKPlayerApi::getInstance_()->getXComponentId id:%s", (char *)id.c_str());
    return id;
}

napi_value IJKPlayerApi::setMessageListener(napi_env env, napi_callback_info info) {
    LOGI("napi-->msg----setMessageListener");
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    napi_value width;
    napi_value height;
    napi_value result = 0;
    napi_value callback = args[0];
    napi_ref callBackRefMessage_;
    napi_create_reference(env, callback, 1, &callBackRefMessage_);
    setCallBackRefMessage(callBackRefMessage_);
    setEnvMessage(env);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->message_loop_callback(post_event);
    void (*pe)(void *weak_this, int what, int arg1, int arg2, char *obj) = post_event;
    return NapiUtil::SetNapiCallInt64(env, (int64_t)pe);
}

napi_value IJKPlayerApi::native_setup(napi_env env, napi_callback_info info) {
    LOGI("napi-->native_setup");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    LOGI("napi-->native_setup id->%s", (char *)xcomponentId.c_str());
    setXComponentId(xcomponentId);
    OH_NativeXComponent *xcomponent = IJKPlayerApi::getInstance(xcomponentId)->getXComponent(xcomponentId);
    void *nativeWindow = IJKPlayerApi::getInstance(xcomponentId)->getNativeWindow(xcomponentId);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_native_setup(xcomponent, nativeWindow);
    return nullptr;
}

napi_value IJKPlayerApi::get_ijkplayer_ptr(napi_env env, napi_callback_info info) {
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    return NapiUtil::SetNapiCallInt64(env, (int64_t)IJKPlayerApi::getInstance(xcomponentId));
}

napi_value IJKPlayerApi::setDataSource(napi_env env, napi_callback_info info) {
    LOGI("napi-->setDataSource");
    size_t argc = PARAM_COUNT_1;
    napi_value args[PARAM_COUNT_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string url;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, url);
    LOGI("napi-->setDataSource-->url:%s", (char *)url.c_str());
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    LOGI("napi-->setDataSource end id->%s", (char *)xcomponentId.c_str());
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_setDataSource((char *)url.c_str());
    return nullptr;
}

napi_value IJKPlayerApi::setOption(napi_env env, napi_callback_info info) {
    LOGI("napi-->setOption");
    size_t argc = PARAM_COUNT_3;
    napi_value args[PARAM_COUNT_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string category;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, category);
    std::string key;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, key);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_2], STR_DEFAULT_SIZE, value);
    LOGI("napi-->setOption-->category:%d,key:%s,value:%s", NapiUtil::StringToInt(category), (char *)key.c_str(), (char *)value.c_str());
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_setOption(NapiUtil::StringToInt(category), (char *)key.c_str(), (char *)value.c_str());
    return nullptr;
}

napi_value IJKPlayerApi::setOptionLong(napi_env env, napi_callback_info info) {
    LOGI("napi-->setOptionLong");
    size_t argc = PARAM_COUNT_3;
    napi_value args[PARAM_COUNT_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string category;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, category);
    std::string key;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, key);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_2], STR_DEFAULT_SIZE, value);
    LOGI("napi-->setOptionLong-->category:%d,key:%s,value:%s", NapiUtil::StringToInt(category), (char *)key.c_str(), (char *)value.c_str());
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_setOptionLong(NapiUtil::StringToInt(category), (char *)key.c_str(), NapiUtil::StringToInt(value));
    return nullptr;
}

napi_value IJKPlayerApi::setVolume(napi_env env, napi_callback_info info) {
    LOGI("napi-->setVolume");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string leftVolume;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, leftVolume);
    std::string rightVolume;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, rightVolume);
    LOGI("napi-->setVolume-->leftVolume:%s,rightVolume:%s", (char *)leftVolume.c_str(), (char *)rightVolume.c_str());
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_setVolume(NapiUtil::StringToFloat(leftVolume), NapiUtil::StringToFloat(rightVolume));
    return nullptr;
}

napi_value IJKPlayerApi::prepareAsync(napi_env env, napi_callback_info info) {
    LOGI("napi-->prepareAsync");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_prepareAsync();
    return nullptr;
}

napi_value IJKPlayerApi::start(napi_env env, napi_callback_info info) {
    LOGI("napi-->start");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_start();
    return nullptr;
}

napi_value IJKPlayerApi::stop(napi_env env, napi_callback_info info) {
    LOGI("napi-->stop");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_stop();
    return nullptr;
}

napi_value IJKPlayerApi::pause(napi_env env, napi_callback_info info) {
    LOGI("napi-->pause");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_pause();
    return nullptr;
}

napi_value IJKPlayerApi::reset(napi_env env, napi_callback_info info) {
    LOGI("napi-->reset");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_reset();
    return nullptr;
}

napi_value IJKPlayerApi::release(napi_env env, napi_callback_info info) {
    LOGI("napi-->release");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_release();
    return nullptr;
}

napi_value IJKPlayerApi::getDuration(napi_env env, napi_callback_info info) {
    LOGI("napi-->getDuration");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    int duration = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getDuration();
    return NapiUtil::SetNapiCallInt32(env, duration);
}

napi_value IJKPlayerApi::getCurrentPosition(napi_env env, napi_callback_info info) {
    LOGI("napi-->getCurrentPosition");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    int currentPosition = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getCurrentPosition();
    return NapiUtil::SetNapiCallInt32(env, currentPosition);
}

napi_value IJKPlayerApi::seekTo(napi_env env, napi_callback_info info) {
    LOGI("napi-->seekTo");
    size_t argc = PARAM_COUNT_1;
    napi_value args[PARAM_COUNT_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string msec;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, msec);
    LOGI("napi-->seekTo-->msec:%d", NapiUtil::StringToInt(msec));
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_seekTo(NapiUtil::StringToInt(msec));
    return nullptr;
}

napi_value IJKPlayerApi::isPlaying(napi_env env, napi_callback_info info) {
    LOGI("napi-->isPlaying");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    return NapiUtil::SetNapiCallBool(env, IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_isPlaying());
}

napi_value IJKPlayerApi::setPropertyFloat(napi_env env, napi_callback_info info) {
    LOGI("napi-->setPropertyFloat");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string id;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, id);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, value);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->ijkMediaPlayer_setPropertyFloat(NapiUtil::StringToInt(id), NapiUtil::StringToFloat(value));
    return nullptr;
}

napi_value IJKPlayerApi::getPropertyFloat(napi_env env, napi_callback_info info) {
    LOGI("napi-->getPropertyFloat");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string id;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, id);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, value);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    float result = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->ijkMediaPlayer_getPropertyFloat(NapiUtil::StringToInt(id), NapiUtil::StringToFloat(value));
    napi_value napi_result;
    napi_create_string_utf8(env, (char *)((std::to_string(result)).c_str()), NAPI_AUTO_LENGTH, &napi_result);
    return napi_result;
}

napi_value IJKPlayerApi::setPropertyLong(napi_env env, napi_callback_info info) {
    LOGI("napi-->setPropertyLong");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string id;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, id);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, value);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->ijkMediaPlayer_setPropertyLong(NapiUtil::StringToInt(id), NapiUtil::StringToLong(value));
    return nullptr;
}

napi_value IJKPlayerApi::getPropertyLong(napi_env env, napi_callback_info info) {
    LOGI("napi-->getPropertyLong");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string id;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, id);
    std::string value;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, value);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    long result = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->ijkMediaPlayer_getPropertyLong(NapiUtil::StringToInt(id), NapiUtil::StringToLong(value));
    napi_value napi_result;
    napi_create_string_utf8(env, (char *)((std::to_string(result)).c_str()), NAPI_AUTO_LENGTH, &napi_result);
    return napi_result;
}

napi_value IJKPlayerApi::getAudioSessionId(napi_env env, napi_callback_info info) {
    LOGI("napi-->getAudioSessionId");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    int getAudioSessionId = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioSessionId();
    return NapiUtil::SetNapiCallInt32(env, getAudioSessionId);
}

napi_value IJKPlayerApi::setLoopCount(napi_env env, napi_callback_info info) {
    LOGI("napi-->setLoopCount");
    size_t argc = PARAM_COUNT_1;
    napi_value args[PARAM_COUNT_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string loop_count;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, loop_count);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_setLoopCount(NapiUtil::StringToInt(loop_count));
    return nullptr;
}

napi_value IJKPlayerApi::getLoopCount(napi_env env, napi_callback_info info) {
    LOGI("napi-->getLoopCount");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    int loop_count = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getLoopCount();
    return NapiUtil::SetNapiCallInt32(env, loop_count);
}

napi_value IJKPlayerApi::getVideoCodecInfo(napi_env env, napi_callback_info info) {
    LOGI("napi-->getVideoCodecInfo");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    char *result = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getVideoCodecInfo();
    LOGI("napi-->getVideoCodecInfo result:%s", result);
    napi_value napi_result;
    napi_create_string_utf8(env, result, NAPI_AUTO_LENGTH, &napi_result);
    return napi_result;
}

napi_value IJKPlayerApi::getAudioCodecInfo(napi_env env, napi_callback_info info) {
    LOGI("napi-->getAudioCodecInfo");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    char *result = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getAudioCodecInfo();
    napi_value napi_result;
    napi_create_string_utf8(env, result, NAPI_AUTO_LENGTH, &napi_result);
    return napi_result;
}

napi_value IJKPlayerApi::setStreamSelected(napi_env env, napi_callback_info info) {
    LOGI("napi-->setStreamSelected");
    size_t argc = PARAM_COUNT_2;
    napi_value args[PARAM_COUNT_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string stream;
    NapiUtil::JsValueToString(env, args[INDEX_0], STR_DEFAULT_SIZE, stream);
    std::string select;
    NapiUtil::JsValueToString(env, args[INDEX_1], STR_DEFAULT_SIZE, select);
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->ijkMediaPlayer_setStreamSelected(NapiUtil::StringToInt(stream), NapiUtil::StringToBool(select));
    return nullptr;
}

napi_value IJKPlayerApi::getMediaMeta(napi_env env, napi_callback_info info) {
    LOGI("napi-->getMediaMeta");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    HashMap map = IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_getMediaMeta();
    HashMapIterator iterator = hashmap_iterator(map);
    std::string result = "";
    while (hashmap_hasNext(iterator)) {
        iterator = hashmap_next(iterator);
        LOGI("napi-->getMediaMeta { key: %s, value: %s, hashcode: %d }\n",
             (STRING)iterator->entry->key, (STRING)iterator->entry->value, iterator->hashCode);
        result.append("key:");
        result.append((STRING)iterator->entry->key);
        result.append(",");
        result.append("value:");
        result.append((STRING)iterator->entry->value);
        result.append(";");
    }
    hashmap_delete(map);
    napi_value napi_result;
    napi_create_string_utf8(env, (char *)(result.c_str()), NAPI_AUTO_LENGTH, &napi_result);
    return napi_result;
}

napi_value IJKPlayerApi::nativeOpenlog(napi_env env, napi_callback_info info) {
    LOGI("napi-->nativeOpenlog");
    std::string xcomponentId = IJKPlayerApi::getXComponentId(env, info);
    IJKPlayerApi::getInstance(xcomponentId)->ijkPlayerNapiProxy_->IjkMediaPlayer_native_openlog();
    return nullptr;
}

/////////////////////////////XComponent////////////////////////////////

void IJKPlayerApi::setXComponentAndNativeWindow(std::string &id, OH_NativeXComponent *component, void *window) {
    LOGI("napi-->IJKPlayerApi::SetXComponentAndNativeWindow");
    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        nativeXComponentMap_[id] = component;
    } else {
        if (nativeXComponentMap_[id] != component) {
            nativeXComponentMap_[id] = component;
        }
    }
    if (nativeWindowMap_.find(id) == nativeWindowMap_.end()) {
        nativeWindowMap_[id] = window;
    } else {
        if (nativeWindowMap_[id] != window) {
            nativeWindowMap_[id] = window;
        }
    }
}

OH_NativeXComponent *IJKPlayerApi::getXComponent(std::string &id) {
    LOGI("napi-->IJKPlayerApi::getXComponent");
    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        LOGI("napi-->IJKPlayerApi::getXComponent null");
        return nullptr;
    } else {
        LOGI("napi-->IJKPlayerApi::getXComponent success");
        return nativeXComponentMap_[id];
    }
}

void *IJKPlayerApi::getNativeWindow(std::string &id) {
    LOGI("napi-->IJKPlayerApi::getNativeWindow");
    if (nativeWindowMap_.find(id) == nativeWindowMap_.end()) {
        LOGI("napi-->IJKPlayerApi::getNativeWindow null");
        return nullptr;
    } else {
        LOGI("napi-->IJKPlayerApi::getNativeWindow success");
        return nativeWindowMap_[id];
    }
}

void onSurfaceCreatedCB(OH_NativeXComponent *component, void *window) {
    destroyResource = false;
    LOGI("napi-->OnSurfaceCreatedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    LOGI("napi-->OnSurfaceCreatedCB-->success");
    std::string id(idStr);
    auto IJKPlayerApi = IJKPlayerApi::getInstance(id);
    IJKPlayerApi->onSurfaceCreated(component, window);
    IJKPlayerApi->setXComponentAndNativeWindow(id, component, window);
}

void onSurfaceChangedCB(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->OnSurfaceChangedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto IJKPlayerApi = IJKPlayerApi::getInstance(id);
    IJKPlayerApi->onSurfaceChanged(component, window);
}

void onSurfaceDestroyedCB(OH_NativeXComponent *component, void *window) {
    destroyResource = true;
    LOGI("napi-->OnSurfaceDestroyedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto IJKPlayerApi = IJKPlayerApi::getInstance(id);
    IJKPlayerApi->onSurfaceDestroyed(component, window);
}

void dispatchTouchEventCB(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->DispatchTouchEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto IJKPlayerApi = IJKPlayerApi::getInstance(id);
    IJKPlayerApi->dispatchTouchEvent(component, window);
}

void IJKPlayerApi::onSurfaceCreated(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->OnSurfaceCreated");
    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        LOGI("napi-->OnSurfaceCreated-->success");
    }
}

void IJKPlayerApi::onSurfaceChanged(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->OnSurfaceChanged");
}

void IJKPlayerApi::onSurfaceDestroyed(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->OnSurfaceDestroyed");
}

void IJKPlayerApi::dispatchTouchEvent(OH_NativeXComponent *component, void *window) {
    LOGI("napi-->DispatchTouchEvent");
    int32_t ret = OH_NativeXComponent_GetTouchEvent(component, window, &touchEvent_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        LOGI("napi-->DispatchTouchEvent-->success");
    }
}

IJKPlayerApi::IJKPlayerApi(std::string &id) : id_(id), component_(nullptr) {
    LOGI("IJKPlayerApi::IJKPlayerApi");
    ijkPlayerNapiProxy_ = new IJKPlayerNapiProxy(id);
    auto ijkplayerNapiCallback = IJKPlayerApi::getNXComponentCallback();
    ijkplayerNapiCallback->OnSurfaceCreated = onSurfaceCreatedCB;
    ijkplayerNapiCallback->OnSurfaceChanged = onSurfaceChangedCB;
    ijkplayerNapiCallback->OnSurfaceDestroyed = onSurfaceDestroyedCB;
    ijkplayerNapiCallback->DispatchTouchEvent = dispatchTouchEventCB;
}

IJKPlayerApi *IJKPlayerApi::getInstance(std::string &id) {
    LOGI("napi-->IJKPlayerApi::getInstance");
    if (ijkPlayerNapi_.find(id) == ijkPlayerNapi_.end()) {
        LOGI("napi-->IJKPlayerApi::getInstance create object");
        IJKPlayerApi *instance = new IJKPlayerApi(id);
        ijkPlayerNapi_[id] = instance;
        return instance;
    } else {
        LOGI("napi-->IJKPlayerApi::getInstance return");
        return ijkPlayerNapi_[id];
    }
}

void IJKPlayerApi::setInstance(std::string &id, IJKPlayerApi *ptr){
    ijkPlayerNapi_[id] = ptr;
}

OH_NativeXComponent_Callback *IJKPlayerApi::getNXComponentCallback() {
    LOGI("IJKPlayerApi::getNXComponentCallback");
    return &IJKPlayerApi::callback_;
}

void IJKPlayerApi::setNativeXComponent(OH_NativeXComponent *component) {
    LOGI("IJKPlayerApi::setNativeXComponent");
    component_ = component;
    OH_NativeXComponent_RegisterCallback(component_, &IJKPlayerApi::callback_);
}

napi_value IJKPlayerApi::Export(napi_env env, napi_value exports) {
    LOGI("IJKPlayerApi::Export");
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("_setDataSource", IJKPlayerApi::setDataSource),
        DECLARE_NAPI_FUNCTION("_setOption", IJKPlayerApi::setOption),
        DECLARE_NAPI_FUNCTION("_setOptionLong", IJKPlayerApi::setOptionLong),
        DECLARE_NAPI_FUNCTION("_prepareAsync", IJKPlayerApi::prepareAsync),
        DECLARE_NAPI_FUNCTION("_start", IJKPlayerApi::start),
        DECLARE_NAPI_FUNCTION("_stop", IJKPlayerApi::stop),
        DECLARE_NAPI_FUNCTION("_pause", IJKPlayerApi::pause),
        DECLARE_NAPI_FUNCTION("_reset", IJKPlayerApi::reset),
        DECLARE_NAPI_FUNCTION("_release", IJKPlayerApi::release),
        DECLARE_NAPI_FUNCTION("_seekTo", IJKPlayerApi::seekTo),
        DECLARE_NAPI_FUNCTION("_isPlaying", IJKPlayerApi::isPlaying),
        DECLARE_NAPI_FUNCTION("_setMessageListener", IJKPlayerApi::setMessageListener),
        DECLARE_NAPI_FUNCTION("_getDuration", IJKPlayerApi::getDuration),
        DECLARE_NAPI_FUNCTION("_getCurrentPosition", IJKPlayerApi::getCurrentPosition),
        DECLARE_NAPI_FUNCTION("_setPropertyFloat", IJKPlayerApi::setPropertyFloat),
        DECLARE_NAPI_FUNCTION("_getPropertyFloat", IJKPlayerApi::getPropertyFloat),
        DECLARE_NAPI_FUNCTION("_setPropertyLong", IJKPlayerApi::setPropertyLong),
        DECLARE_NAPI_FUNCTION("_getPropertyLong", IJKPlayerApi::getPropertyLong),
        DECLARE_NAPI_FUNCTION("_getAudioSessionId", IJKPlayerApi::getAudioSessionId),
        DECLARE_NAPI_FUNCTION("_setVolume", IJKPlayerApi::setVolume),
        DECLARE_NAPI_FUNCTION("_setLoopCount", IJKPlayerApi::setLoopCount),
        DECLARE_NAPI_FUNCTION("_getLoopCount", IJKPlayerApi::getLoopCount),
        DECLARE_NAPI_FUNCTION("_getVideoCodecInfo", IJKPlayerApi::getVideoCodecInfo),
        DECLARE_NAPI_FUNCTION("_getAudioCodecInfo", IJKPlayerApi::getAudioCodecInfo),
        DECLARE_NAPI_FUNCTION("_setStreamSelected", IJKPlayerApi::setStreamSelected),
        DECLARE_NAPI_FUNCTION("_getMediaMeta", IJKPlayerApi::getMediaMeta),
        DECLARE_NAPI_FUNCTION("_nativeOpenlog", IJKPlayerApi::nativeOpenlog),
        DECLARE_NAPI_FUNCTION("_native_setup", IJKPlayerApi::native_setup),
        DECLARE_NAPI_FUNCTION("_get_ijkplayer_ptr", IJKPlayerApi::get_ijkplayer_ptr),
    };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc));
    return exports;
}
