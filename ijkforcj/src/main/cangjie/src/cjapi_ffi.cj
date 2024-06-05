package ijkplayer4cj

/*
 * Cangjie calls the c interface of ijkplayer
*/
foreign {
    func ijk_nativeOpenlog(xcomponentId: CString): Unit
    func ijk_setDataSource(xcomponentId: CString,  url: CString): Unit
    func ijk_setOption(xcomponentId: CString, category: CString, name: CString, value: CString): Unit
    func ijk_setOptionLong(xcomponentId: CString, category: CString, name: CString, value: CString): Unit
    func ijk_prepareAsync(xcomponentId: CString): Unit
    func ijk_start(xcomponentId: CString): Unit
    func ijk_stop(xcomponentId: CString): Unit
    func ijk_pause(xcomponentId: CString): Unit
    func ijk_reset(xcomponentId: CString): Unit
    func ijk_release(xcomponentId: CString): Unit
    func ijk_seekTo(xcomponentId: CString, msec: CString): Unit
    func ijk_isPlaying(xcomponentId: CString): Bool
    func ijk_getDuration(xcomponentId: CString): Int32
    func ijk_getCurrentPosition(xcomponentId: CString): Int32
    func ijk_getAudioSessionId(xcomponentId: CString): Int32
    func ijk_setPropertyFloat(xcomponentId: CString, ids: CString, value: CString): Unit
    func ijk_getPropertyFloat(xcomponentId: CString, ids: CString, default_value: CString): Float32
    func ijk_setPropertyLong(xcomponentId: CString, property: CString, value: CString): Unit
    func ijk_getPropertyLong(xcomponentId: CString, property: CString, value: CString): Int64
    func ijk_setVolume(xcomponentId: CString, leftVolume: CString, rightVolume: CString): Unit
    func ijk_setLoopCount(xcomponentId: CString, loopCount: CString): Unit
    func ijk_getLoopCount(xcomponentId: CString): Int32
    func ijk_setStreamSelected(xcomponentId: CString, stream: CString, select: CString): Unit
    func ijk_getVideoCodecInfo(xcomponentId: CString): CString
    func ijk_getAudioCodecInfo(xcomponentId: CString): CString
    func ijk_getMediaMeta(xcomponentId: CString): CString
    func ijk_native_setup(xcomponentId: CString): Unit
    func ijk_setIjkplayerPtr(xcomponentId: CString, ptr: CString): Unit
    func ijk_setMessagePostEventPtr(xcomponentId: CString, ptr: CString): Unit
}
