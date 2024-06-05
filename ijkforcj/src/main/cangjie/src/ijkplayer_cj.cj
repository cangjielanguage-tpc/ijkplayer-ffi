package ijkplayer4cj

/** 
 * Open log
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjNativeOpenlog(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_nativeOpenlog(id)
        LibC.free(id)
    }  
}

/** 
 * Set video source
 *
 * params xcomponentId - Component ID value
 * params url - Video address
 * return Unit
 */
public func cjSetDataSource(xcomponentId: String,  url: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let path: CString = LibC.mallocCString(url)
        ijk_setDataSource(id, path)
        LibC.free(id)
        LibC.free(path)
    }
}

/** 
 * Set video playback parameters
 *
 * params xcomponentId - Component ID value
 * params category - OPT_CATEGORY_FORMAT、OPT_CATEGORY_CODEC、OPT_CATEGORY_SWS、OPT_CATEGORY_PLAYER
 * params name - parameter,See example
 * params value - See example
 * return Unit
 */
public func cjSetOption(xcomponentId: String, category: String, name: String, value: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ccategory: CString = LibC.mallocCString(category)
        let cname: CString = LibC.mallocCString(name)
        let cvalue: CString = LibC.mallocCString(value)
        ijk_setOption(id, ccategory, cname, cvalue)
        LibC.free(id)
        LibC.free(ccategory)
        LibC.free(cname)
        LibC.free(cvalue)
    }
}

/** 
 * Set video playback parameters
 *
 * params xcomponentId - Component ID value
 * params category - OPT_CATEGORY_FORMAT、OPT_CATEGORY_CODEC、OPT_CATEGORY_SWS、OPT_CATEGORY_PLAYER
 * params name - parameter,See example
 * params value - See example
 * return Unit
 */
public func cjSetOptionLong(xcomponentId: String, category: String, name: String, value: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ccategory: CString = LibC.mallocCString(category)
        let cname: CString = LibC.mallocCString(name)
        let cvalue: CString = LibC.mallocCString(value)
        ijk_setOptionLong(id, ccategory, cname, cvalue)
        LibC.free(id)
        LibC.free(ccategory)
        LibC.free(cname)
        LibC.free(cvalue)
    }
}

/** 
 * Prepare to play
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjPrepareAsync(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_prepareAsync(id)
        LibC.free(id)
    }  
}

/** 
 * Start playing
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjStart(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_start(id)
        LibC.free(id)
    }
}

/** 
 * Stop playing
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjStop(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_stop(id)
        LibC.free(id)
    }
}

/** 
 * Pause playing
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjPause(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_pause(id)
        LibC.free(id)
    }
}

/** 
 * Reset playing
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjReset(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_reset(id)
        LibC.free(id)
    }
}

/** 
 * Release
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjRelease(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_release(id)
        LibC.free(id)
    }
}

/** 
 * Fast forward and backward
 *
 * params xcomponentId - Component ID value
 * params msec - "(0 - getDuration)"
 * return Unit
 */
public func cjSeekTo(xcomponentId: String, msec: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cmsec: CString = LibC.mallocCString(msec)
        ijk_seekTo(id, cmsec)
        LibC.free(id)
        LibC.free(cmsec)
    }
}

/** 
 * Determine if it is in playback status
 *
 * params xcomponentId - Component ID value
 * return Bool - true/false
 */
public func cjIsPlaying(xcomponentId: String): Bool {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Bool = ijk_isPlaying(id)
        LibC.free(id)
        return ret
    }
}

/** 
 * Obtain the total duration of the video
 *
 * params xcomponentId - Component ID value
 * return Int32
 */
public func cjGetDuration(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getDuration(id)
        LibC.free(id)
        return ret
    }
}

/** 
 * Get the current location for video playback
 *
 * params xcomponentId - Component ID value
 * return Int32
 */
public func cjGetCurrentPosition(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getCurrentPosition(id)
        LibC.free(id)
        return ret
    }
}

/** 
 * Get audio session ID
 *
 * params xcomponentId - Component ID value
 * return Int32
 */
public func cjGetAudioSessionId(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getAudioSessionId(id)
        LibC.free(id)
        return ret
    }
}

/** 
 * Set video properties
 *
 * params xcomponentId - Component ID value
 * params ids - attribute
 * params value - Attribute value
 * return Unit
 */
public func cjSetPropertyFloat(xcomponentId: String, ids: String, value: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cids: CString = LibC.mallocCString(ids)
        let cvalue: CString = LibC.mallocCString(value)
        ijk_setPropertyFloat(id, cids, cvalue)
        LibC.free(id)
        LibC.free(cids)
        LibC.free(cvalue)
    }
}

/** 
 * Get video properties
 *
 * params xcomponentId - Component ID value
 * params ids - attribute
 * params defaultValue - Default attribute values
 * return Float32
 */
public func cjGetPropertyFloat(xcomponentId: String, ids: String, defaultValue: String): Float32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cids: CString = LibC.mallocCString(ids)
        let cvalue: CString = LibC.mallocCString(defaultValue)
        let ret: Float32 = ijk_getPropertyFloat(id, cids, cvalue)
        LibC.free(id)
        LibC.free(cids)
        LibC.free(cvalue)
        return ret
    }
}

/** 
 * Set video properties
 *
 * params xcomponentId - Component ID value
 * params property - attribute
 * params value - Attribute value
 * return Unit
 */
public func cjSetPropertyLong(xcomponentId: String, property: String, value: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cproperty: CString = LibC.mallocCString(property)
        let cvalue: CString = LibC.mallocCString(value)
        ijk_setPropertyLong(id, cproperty, cvalue)
        LibC.free(id)
        LibC.free(cproperty)
        LibC.free(cvalue)
    }
}

/** 
 * Get video properties
 *
 * params xcomponentId - Component ID value
 * params property - attribute
 * params value - Default attribute values
 * return Int64
 */
public func cjGetPropertyLong(xcomponentId: String, property: String, value: String): Int64 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cproperty: CString = LibC.mallocCString(property)
        let cvalue: CString = LibC.mallocCString(value)
        let ret: Int64 = ijk_getPropertyLong(id, cproperty, cvalue)
        LibC.free(id)
        LibC.free(cproperty)
        LibC.free(cvalue)
        return ret
    }
}

/** 
 * Set up sound channels
 *
 * params xcomponentId - Component ID value
 * params leftVolume - Left vocal tract
 * params rightVolume - Right vocal tract
 * return Unit
 */
public func cjSetVolume(xcomponentId: String, leftVolume: String, rightVolume: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let left: CString = LibC.mallocCString(leftVolume)
        let right: CString = LibC.mallocCString(rightVolume)
        ijk_setVolume(id, left, right)
        LibC.free(id)
        LibC.free(left)
        LibC.free(right)
    }
}

/** 
 * Set video loop
 *
 * params xcomponentId - Component ID value
 * params loopCount - Number of cycles
 * return Unit
 */
public func cjSetLoopCount(xcomponentId: String, loopCount: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let count: CString = LibC.mallocCString(loopCount)
        ijk_setLoopCount(id, count)
        LibC.free(id)
        LibC.free(count)
    }
}

/** 
 * Get video loop count
 *
 * params xcomponentId - Component ID value
 * return Int32
 */
public func cjGetLoopCount(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getLoopCount(id)
        LibC.free(id)
        return ret
    }
}

/** 
 * Select media stream
 *
 * params xcomponentId - Component ID value
 * params stream - 0 - video
 *                 1 - audio
 *                 3 - subtitle
 * params select - "true" or "false"
 * return Int32
 */
public func cjSetStreamSelected(xcomponentId: String, stream: String, select: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cstream: CString = LibC.mallocCString(stream)
        let cselect: CString = LibC.mallocCString(select)
        ijk_setStreamSelected(id, cstream, cselect)
        LibC.free(id)
        LibC.free(cstream)
        LibC.free(cselect)
    }
}

/** 
 * Obtain video decoding
 *
 * params xcomponentId - Component ID value
 * return String
 */
public func cjGetVideoCodecInfo(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let retC: CString = ijk_getVideoCodecInfo(id)
        let ret = retC.toString()
        LibC.free(id)
        LibC.free(retC)
        return ret
    }
}

/** 
 * Obtain audio decoding
 *
 * params xcomponentId - Component ID value
 * return String
 */
public func cjGetAudioCodecInfo(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let retC: CString = ijk_getAudioCodecInfo(id)
        let ret = retC.toString()
        LibC.free(id)
        LibC.free(retC)
        return ret
    }
}

/** 
 * Obtaining media information
 *
 * params xcomponentId - Component ID value
 * return String
 */
public func cjGetMediaMeta(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let retC: CString = ijk_getMediaMeta(id)
        let ret = retC.toString()
//        LibC.free(id)
//        LibC.free(retC)
        return ret
    }
}

/** 
 * initial configuration
 *
 * params xcomponentId - Component ID value
 * return Unit
 */
public func cjNativeSetup(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_native_setup(id)
        LibC.free(id)
    }
}


public func cjSetIjkplayerPtr(a1: String, a2: String): Unit {
    unsafe {
        let xnw: CString = LibC.mallocCString(a1)
        let ptr: CString = LibC.mallocCString(a2)
        ijk_setIjkplayerPtr(xnw, ptr)
        LibC.free(xnw)
        LibC.free(ptr)
    }
}


public func cjSetMessagePostEventPtr(a1: String, a2: String): Unit {
    unsafe {
        let xnw: CString = LibC.mallocCString(a1)
        let ptr: CString = LibC.mallocCString(a2)
        ijk_setMessagePostEventPtr(xnw, ptr)
        LibC.free(xnw)
        LibC.free(ptr)
    }
}