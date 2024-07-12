/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
package ijkplayer4cj

from ohos import ark_interop.JSNull
from ohos import ark_interop.JSModule
from ohos import ark_interop.JSContext
from ohos import ark_interop.JSCallInfo
from ohos import ark_interop.JSValue
from cj_res_ijkforcj import cj_res_ijkforcj.app

let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports =>
        exports["nativeOpenlog"] = runtime.function(nativeOpenlog).toJSValue()
        exports["setDataSource"] = runtime.function(setDataSource).toJSValue()
        exports["setOption"] = runtime.function(setOption).toJSValue()
        exports["setOptionLong"] = runtime.function(setOptionLong).toJSValue()
        exports["prepareAsync"] = runtime.function(prepareAsync).toJSValue()
        exports["start"] = runtime.function(start).toJSValue()
        exports["stop"] = runtime.function(stop).toJSValue()
        exports["pause"] = runtime.function(pause).toJSValue()
        exports["reset"] = runtime.function(reset).toJSValue()
        exports["release"] = runtime.function(release).toJSValue()
        exports["seekTo"] = runtime.function(seekTo).toJSValue()
        exports["isPlaying"] = runtime.function(isPlaying).toJSValue()
        exports["getDuration"] = runtime.function(getDuration).toJSValue()
        exports["getCurrentPosition"] = runtime.function(getCurrentPosition).toJSValue()
        exports["getAudioSessionId"] = runtime.function(getAudioSessionId).toJSValue()
        exports["setPropertyFloat"] = runtime.function(setPropertyFloat).toJSValue()
        exports["getPropertyFloat"] = runtime.function(getPropertyFloat).toJSValue()
        exports["setPropertyLong"] = runtime.function(setPropertyLong).toJSValue()
        exports["getPropertyLong"] = runtime.function(getPropertyLong).toJSValue()
        exports["setVolume"] = runtime.function(setVolume).toJSValue()
        exports["setLoopCount"] = runtime.function(setLoopCount).toJSValue()
        exports["getLoopCount"] = runtime.function(getLoopCount).toJSValue()
        exports["setStreamSelected"] = runtime.function(setStreamSelected).toJSValue()
        exports["getVideoCodecInfo"] = runtime.function(getVideoCodecInfo).toJSValue()
        exports["getAudioCodecInfo"] = runtime.function(getAudioCodecInfo).toJSValue()
        exports["getMediaMeta"] = runtime.function(getMediaMeta).toJSValue()
        exports["native_setup"] = runtime.function(native_setup).toJSValue()
        exports["setIjkplayerPtr"] = runtime.function(setIjkplayerPtr).toJSValue()
        exports["setMessagePostEvent"] = runtime.function(setMessagePostEvent).toJSValue()
}
