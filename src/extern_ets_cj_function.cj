package ijkplayer4cj
from ohos import napi.*


func nativeOpenlog(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeOpenlog(id)
    return context.undefined()
}

func setDataSource(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let url: String = arg1.toString(context)
    cjSetDataSource(id, LibC.mallocCString(url))
    return context.undefined()
}

func setOption(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let arg3: JSValue = callInfo[3]
    let id: String = arg0.toString(context)
    let category: String = arg1.toString(context)
    let name: String = arg2.toString(context)
    let value: String = arg3.toString(context)
    cjSetOption(id, category, name, value)
    return context.undefined()
}

func setOptionLong(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let arg3: JSValue = callInfo[3]
    let id: String = arg0.toString(context)
    let category: String = arg1.toString(context)
    let name: String = arg2.toString(context)
    let value: String = arg3.toString(context)
    cjSetOptionLong(id, category, name, value)
    return context.undefined()
}

func prepareAsync(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPrepareAsync(id)
    return context.undefined()
}

func start(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStart(id)
    return context.undefined()
}

func stop(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStop(id)
    return context.undefined()
}

func pause(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPause(id)
    return context.undefined()
}

func reset(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjReset(id)
    return context.undefined()
}

func release(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjRelease(id)
    return context.undefined()
}

func seekTo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let msec: String = arg1.toString(context)
    cjSeekTo(id, LibC.mallocCString(msec))
    return context.undefined()
}

func isPlaying(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Bool = cjIsPlaying(id)
    return context.boolean(ret)
}

func getDuration(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Int32 = cjGetDuration(id)
    return context.number(Float64(ret))
}

func getCurrentPosition(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var res:Int32 = cjGetCurrentPosition(id)
    return context.number(Float64(res))
}

func getAudioSessionId(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var res: Int32 = res = cjGetAudioSessionId(id)
    return context.number(Float64(res))
}

func setPropertyFloat(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let value: String = arg2.toString(context)
    cjSetPropertyFloat(id,ids,value)
    return context.undefined()
}

func getPropertyFloat(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let defaultValue: String = arg2.toString(context)
    var res: Float32 = cjGetPropertyFloat(id, ids, defaultValue)
    return context.number(Float64(res))
}

 func setPropertyLong(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let value: String = arg2.toString(context)
    cjSetPropertyLong(id, ids, value)
    return context.undefined()
}

 func getPropertyLong(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let defaultValue: String = arg2.toString(context)
    var res: Int64 = cjGetPropertyLong(id, ids, defaultValue)
    return context.number(Float64(res))
 }


func setVolume(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let leftVolume: String = arg1.toString(context)
    let rightVolume: String = arg2.toString(context)
    cjSetVolume(id, leftVolume, rightVolume)
    return context.undefined()
}

func setLoopCount(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let loopCount: String = arg1.toString(context)
    cjSetLoopCount(id, loopCount)
    return context.undefined()
}

func getLoopCount(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var loopcount:Int32 = cjGetLoopCount(id)
    return context.number(Float64(loopcount))
}

func setStreamSelected(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let stream: String = arg1.toString(context)
    let selected: String = arg2.toString(context)
    cjSetStreamSelected(id, stream, selected)
    return context.undefined()
}

func getVideoCodecInfo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetVideoCodecInfo(id)
    return context.string(info).value
}

func getAudioCodecInfo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetAudioCodecInfo(id)
    return context.string(info).value
}

func getMediaMeta(context: JSRuntime,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetMediaMeta(id)
    return context.string(info).value
}

func native_setup(context: JSRuntime,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeSetup(id)
    return context.undefined()
}
