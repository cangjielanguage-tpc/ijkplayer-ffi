package ijkplayer4cj.napi




public class IJKPlayerNapiProxy {

    var IJKMP_GLOABL_INIT: Bool = false
    var GLOBAL_NATIVE_WINDOW: ?Object = None
    var postEvent: ?(weak: Object, what: Int32, arg1: Int32, arg2: Int32, obj: ?String)->Unit = None
    public IJKPlayerNapiProxy(var id : String) {}

    public func message_loop_callback(postEvent: (weak: Object, what: Int32, arg1: Int32, arg2: Int32, obj: ?String) -> Unit) {
        this.postEvent = postEvent
    }

    public func IjkMediaPlayer_native_setup(weak_this: Object, native_window: Object) {
        if (!IJKMP_GLOABL_INIT) {
            unsafe {ijkmp_global_init()};  // TODO　ffi 
        }

        // IJKMP_GLOABL_INIT=true
        // GLOBAL_NATIVE_WINDOW = native_window
        // IjkMediaPlayer *mp = ijkmp_android_create(message_loop);
        // IJKPlayerNapiProxy::set_media_player(mp);
        // ijkmp_android_set_surface(mp, native_window);
        // ijkmp_set_weak_thiz(mp, weak_this);
        // ijkmp_set_inject_opaque(mp, ijkmp_get_weak_thiz(mp));
        // ijkmp_set_ijkio_inject_opaque(mp, ijkmp_get_weak_thiz(mp));
        return 
    }

    // void IjkMediaPlayer_native_setup(void *weak_this, void *native_window);
    // void IjkMediaPlayer_setDataSource(char *url);
    // void IjkMediaPlayer_setOption(int category, char *name, char *value);
    // void IjkMediaPlayer_setOptionLong(int category, char *name, int64_t value);
    // void IjkMediaPlayer_prepareAsync();
    // void IjkMediaPlayer_start();
    // void IjkMediaPlayer_stop();
    // void IjkMediaPlayer_pause();
    // void IjkMediaPlayer_seekTo(int64_t msec);
    // bool IjkMediaPlayer_isPlaying();
    // int IjkMediaPlayer_getCurrentPosition();
    // int IjkMediaPlayer_getDuration();
    // void IjkMediaPlayer_release();
    // void IjkMediaPlayer_reset();
    // void IjkMediaPlayer_setVolume(float leftVolume, float rightVolume);
    // void IjkMediaPlayer_native_setLogLevel(int32_t level);
    // void ijkMediaPlayer_setPropertyFloat(int id, float value);
    // float ijkMediaPlayer_getPropertyFloat(int id, float default_value);
    // void ijkMediaPlayer_setPropertyLong(int id, long value);
    // long ijkMediaPlayer_getPropertyLong(int id, long default_value);
    // int IjkMediaPlayer_getAudioSessionId();
    // void IjkMediaPlayer_setLoopCount(int loop_count);
    // int IjkMediaPlayer_getLoopCount();
    // char *IjkMediaPlayer_getVideoCodecInfo();
    // char *IjkMediaPlayer_getAudioCodecInfo();
    // void ijkMediaPlayer_setStreamSelected(int stream, bool selected);
    // HashMap IjkMediaPlayer_getMediaMeta();
    // void IjkMediaPlayer_native_openlog();
    // IjkMediaPlayer *set_media_player(IjkMediaPlayer *mp);
    // IjkMediaPlayer *get_media_player();

}