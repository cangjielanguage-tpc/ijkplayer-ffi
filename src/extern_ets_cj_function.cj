package ijkplayer4cj
from ohos import napi.*

/** 
 * Open log
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func nativeOpenlog(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeOpenlog(id)
    return context.undefined()
}

/** 
 * Set video source
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func setDataSource(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let url: String = arg1.toString(context)
    cjSetDataSource(id, url)
    return context.undefined()
}

/** 
 * Set video playback parameters
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Set video playback parameters
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Prepare to play
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func prepareAsync(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPrepareAsync(id)
    return context.undefined()
}

/** 
 * Start playing
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func start(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStart(id)
    return context.undefined()
}

/** 
 * Stop playing
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func stop(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjStop(id)
    return context.undefined()
}

/** 
 * Pause playing
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func pause(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjPause(id)
    return context.undefined()
}

/** 
 * Reset playing
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func reset(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjReset(id)
    return context.undefined()
}

/** 
 * Release
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func release(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjRelease(id)
    return context.undefined()
}

/** 
 * Fast forward and backward
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func seekTo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let msec: String = arg1.toString(context)
    cjSeekTo(id, msec)
    return context.undefined()
}

/** 
 * Determine if it is in playback status
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func isPlaying(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Bool = cjIsPlaying(id)
    return context.boolean(ret)
}

/** 
 * Obtain the total duration of the vide
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getDuration(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    let ret: Int32 = cjGetDuration(id)
    return context.number(Float64(ret))
}

/** 
 * Get the current location for video playback
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getCurrentPosition(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var res:Int32 = cjGetCurrentPosition(id)
    return context.number(Float64(res))
}

/** 
 * Get audio session ID
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getAudioSessionId(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var res: Int32 = cjGetAudioSessionId(id)
    return context.number(Float64(res))
}

/** 
 * Set video properties
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Get video properties
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Set video properties
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Get video properties
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Set up sound channels
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Set video loop
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func setLoopCount(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let arg1: JSValue = callInfo[1]
    let id: String = arg0.toString(context)
    let loopCount: String = arg1.toString(context)
    cjSetLoopCount(id, loopCount)
    return context.undefined()
}

/** 
 * Get video loop count
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getLoopCount(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var loopcount:Int32 = cjGetLoopCount(id)
    return context.number(Float64(loopcount))
}

/** 
 * Select media stream
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
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

/** 
 * Obtain video decoding
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getVideoCodecInfo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetVideoCodecInfo(id)
    return context.string(info).value
}

/** 
 * Obtain audio decoding
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getAudioCodecInfo(context: JSRuntime, callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetAudioCodecInfo(id)
    return context.string(info).value
}

/** 
 * Obtaining media information
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func getMediaMeta(context: JSRuntime,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    var info: String = cjGetMediaMeta(id)
    return context.string(info).value
}

/** 
 * initial configuration
 *
 * params context - JS/changjie Interoperability Runtime Object
 * params callInfo - JS/changjie Interop Call Parameter Information Object
 * return JSValue - JS/changjie interoperability return value
 */
func native_setup(context: JSRuntime,callInfo: JSCallInfo): JSValue {
    let arg0: JSValue = callInfo[0]
    let id: String = arg0.toString(context)
    cjNativeSetup(id)
    return context.undefined()
}
