/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
package ijkplayer4cj

/** 
 * Open log
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func nativeOpenlog(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeOpenlog(id)
    return context.null().toJSValue()
}

/** 
 * Set video source
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setDataSource(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let url: String = arg1.toString(context)
    cjSetDataSource(id, url)
    return context.null().toJSValue()
}

/** 
 * Set video playback parameters
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setOption(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let arg3: JSValue = callInfo[3]
    let id: String = arg0.toString(context)
    let category: String = arg1.toString(context)
    let name: String = arg2.toString(context)
    let value: String = arg3.toString(context)
    cjSetOption(id, category, name, value)
    return context.null().toJSValue()
}

/** 
 * Set video playback parameters
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setOptionLong(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let arg3: JSValue = callInfo[3]
    let id: String = arg0.toString(context)
    let category: String = arg1.toString(context)
    let name: String = arg2.toString(context)
    let value: String = arg3.toString(context)
    cjSetOptionLong(id, category, name, value)
    return context.null().toJSValue()
}

/** 
 * Prepare to play
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func prepareAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPrepareAsync(id)
    return context.null().toJSValue()
}

/** 
 * Start playing
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func start(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStart(id)
    return context.null().toJSValue()
}

/** 
 * Stop playing
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func stop(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStop(id)
    return context.null().toJSValue()
}

/** 
 * Pause playing
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func pause(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPause(id)
    return context.null().toJSValue()
}

/** 
 * Reset playing
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func reset(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjReset(id)
    return context.null().toJSValue()
}

/** 
 * Release
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func release(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjRelease(id)
    return context.null().toJSValue()
}

/** 
 * Fast forward and backward
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func seekTo(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let msec: String = arg1.toString(context)
    cjSeekTo(id, msec)
    return context.null().toJSValue()
}

/** 
 * Determine if it is in playback status
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func isPlaying(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Bool = cjIsPlaying(id)
    return context.boolean(ret).toJSValue()
}

/** 
 * Obtain the total duration of the vide
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getDuration(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Int32 = cjGetDuration(id)
    return context.number(Float64(ret)).toJSValue()
}

/** 
 * Get the current location for video playback
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getCurrentPosition(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let res:Int32 = cjGetCurrentPosition(id)
    return context.number(Float64(res)).toJSValue()
}

/** 
 * Get audio session ID
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getAudioSessionId(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let res: Int32 = cjGetAudioSessionId(id)
    return context.number(Float64(res)).toJSValue()
}

/** 
 * Set video properties
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setPropertyFloat(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let value: String = arg2.toString(context)
    cjSetPropertyFloat(id,ids,value)
    return context.null().toJSValue()
}

/** 
 * Get video properties
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getPropertyFloat(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let defaultValue: String = arg2.toString(context)
    let res: Float32 = cjGetPropertyFloat(id, ids, defaultValue)
    return context.number(Float64(res)).toJSValue()
}

/** 
 * Set video properties
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setPropertyLong(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let value: String = arg2.toString(context)
    cjSetPropertyLong(id, ids, value)
    return context.null().toJSValue()
}

/** 
 * Get video properties
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getPropertyLong(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let ids: String = arg1.toString(context)
    let defaultValue: String = arg2.toString(context)
    let res: Int64 = cjGetPropertyLong(id, ids, defaultValue)
    return context.number(Float64(res)).toJSValue()
}

/** 
 * Set up sound channels
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setVolume(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let leftVolume: String = arg1.toString(context)
    let rightVolume: String = arg2.toString(context)
    cjSetVolume(id, leftVolume, rightVolume)
    return context.null().toJSValue()
}

/** 
 * Set video loop
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setLoopCount(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let loopCount: String = arg1.toString(context)
    cjSetLoopCount(id, loopCount)
    return context.null().toJSValue()
}

/** 
 * Get video loop count
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getLoopCount(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let loopcount:Int32 = cjGetLoopCount(id)
    return context.number(Float64(loopcount)).toJSValue()
}

/** 
 * Select media stream
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func setStreamSelected(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let arg2: JSValue = callInfo[2]
    let id: String = arg0.toString(context)
    let stream: String = arg1.toString(context)
    let selected: String = arg2.toString(context)
    cjSetStreamSelected(id, stream, selected)
    return context.null().toJSValue()
}

/** 
 * Obtain video decoding
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getVideoCodecInfo(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let info: String = cjGetVideoCodecInfo(id)
    return context.string(info).toJSValue()
}

/** 
 * Obtain audio decoding
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getAudioCodecInfo(context: JSContext, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let info: String = cjGetAudioCodecInfo(id)
    return context.string(info).toJSValue()
}

/** 
 * Obtaining media information
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func getMediaMeta(context: JSContext,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let info: String = cjGetMediaMeta(id)
    return context.string(info).toJSValue()
}

/** 
 * initial configuration
 *
 * params context - JS/cangjie Interoperability Runtime Object
 * params callInfo - JS/cangjie Interop Call Parameter Information Object
 * return JSValue - JS/cangjie interoperability return value
 */
func native_setup(context: JSContext,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeSetup(id)
    return context.null().toJSValue()
}


func setIjkplayerPtr(context: JSContext,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let a1: String = arg0.toString(context)
    let a2: String = arg1.toString(context)
    cjSetIjkplayerPtr(a1, a2)
    return context.null().toJSValue()
}


func setMessagePostEvent(context: JSContext,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let a1: String = arg0.toString(context)
    let a2: String = arg1.toString(context)
    cjSetMessagePostEventPtr(a1, a2)
    return context.null().toJSValue()
}

