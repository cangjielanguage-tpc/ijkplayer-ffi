package ijkplayer4cj.napi



foreign {
    func ijkmp_global_init(): Unit
    // IjkMediaPlayer *ijkmp_android_create(int(*msg_loop)(void*));
    func ijkmp_android_create(cb: CFunc<(CPointer<UInt64>)->Int32>): UIntNative
}