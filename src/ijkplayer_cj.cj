package ijkplayer4cj

public func cjNativeOpenlog(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_nativeOpenlog(id)
        LibC.free(id)
    }  
}
public func cjSetDataSource(xcomponentId: String,  url: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let path: CString = LibC.mallocCString(url)
        ijk_setDataSource(id, path)
        LibC.free(id)
        LibC.free(path)
    }
}
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
public func cjPrepareAsync(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_prepareAsync(id)
        LibC.free(id)
    }  
}
public func cjStart(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_start(id)
        LibC.free(id)
    }
}
public func cjStop(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_stop(id)
        LibC.free(id)
    }
}
public func cjPause(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_stop(id)
        LibC.free(id)
    }
}
public func cjReset(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_reset(id)
        LibC.free(id)
    }
}
public func cjRelease(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_release(id)
        LibC.free(id)
    }
}
public func cjSeekTo(xcomponentId: String, msec: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let cmsec: CString = LibC.mallocCString(msec)
        ijk_seekTo(id, cmsec)
        LibC.free(id)
        LibC.free(cmsec)
    }
}
public func cjIsPlaying(xcomponentId: String): Bool {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Bool = ijk_isPlaying(id)
        LibC.free(id)
        return ret
    }
}
public func cjGetDuration(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getDuration(id)
        LibC.free(id)
        return ret
    }
}
public func cjGetCurrentPosition(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getCurrentPosition(id)
        LibC.free(id)
        return ret
    }
}
public func cjGetAudioSessionId(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getAudioSessionId(id)
        LibC.free(id)
        return ret
    }
}
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
public func cjSetLoopCount(xcomponentId: String, loopCount: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let count: CString = LibC.mallocCString(loopCount)
        ijk_setLoopCount(id, count)
        LibC.free(id)
        LibC.free(count)
    }
}
public func cjGetLoopCount(xcomponentId: String): Int32 {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: Int32 = ijk_getLoopCount(id)
        LibC.free(id)
        return ret
    }
}
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
public func cjGetVideoCodecInfo(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: CString = ijk_getVideoCodecInfo(id)
        LibC.free(id)
        return ret.toString()
    }
}
public func cjGetAudioCodecInfo(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: CString = ijk_getAudioCodecInfo(id)
        LibC.free(id)
        return ret.toString()
    }
}
public func cjGetMediaMeta(xcomponentId: String): String {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        let ret: CString = ijk_getMediaMeta(id)
        LibC.free(id)
        return ret.toString()
    }
}
public func cjNativeSetup(xcomponentId: String): Unit {
    unsafe {
        let id: CString = LibC.mallocCString(xcomponentId)
        ijk_native_setup(id)
        LibC.free(id)
    }
}