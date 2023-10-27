package ijkplayer4cj

foreign {
    // func ijkmp_global_init(): Unit
    // func ijkmp_global_uninit(): Unit
    // func ijkmp_global_set_log_report(use_report: Int32): Unit
    // func ijkmp_global_set_log_level(log_level: Int32): Unit // log_level = AV_LOG_xxx
    // func ijkmp_global_set_inject_callback(cb: CFunc<(CPointer<Unit>, Int32, CPointer<Unit>, UIntNative) -> Int32>): Unit
    func ijkmp_version(): CString // player
    // func SDL_getenv(name: CString): CString // sdl
    // func ijkmp_io_stat_register(cb: CFunc<(CString, Int32, Int32) -> Unit>): Unit
    // func ijkmp_io_stat_complete_register(cb: CFunc<(CString, Int64, Int64, Int64, Int64) -> Unit>): Unit

    // // ref_count is 1 after open mp
    // func ijkmp_create(msg_loop: CFunc<(CPointer<Unit>) -> Int32>): CPointer<UIntNative>
    // func ijkmp_set_inject_opaque(mp: CPointer<UIntNative>, opaque: CPointer<Unit>): CPointer<Unit>
    // func ijkmp_set_ijkio_inject_opaque(mp: CPointer<UIntNative>, opaque: CPointer<Unit>): CPointer<Unit>

    // func ijkmp_set_option(mp: CPointer<UIntNative>, opt_category: Int32, name: CString, value: CString): Unit
    // func ijkmp_set_option_int(mp: CPointer<UIntNative>, opt_category: Int32, name: CString, value: Int64): Unit

    // func ijkmp_get_video_codec_info(mp: CPointer<UIntNative>, codec_info: CPointer<CPointer<UInt8>>): Int32
    // func ijkmp_get_audio_codec_info(mp: CPointer<UIntNative>, codec_info: CPointer<CPointer<UInt8>>): Int32
    // func ijkmp_set_playback_rate(mp: CPointer<UIntNative>, rate: Float32): Unit
    // func ijkmp_set_playback_volume(mp: CPointer<UIntNative>, rate: Float32): Unit

    // func ijkmp_set_stream_selected(mp: CPointer<UIntNative>, stream: Int32, selected: Int32): Int32

    // func ijkmp_get_property_float(mp: CPointer<UIntNative>, id: Int32, default_value: Float32): float32
    // func ijkmp_set_property_float(mp: CPointer<UIntNative>, id: Int32, value: Float32): Unit
    // func ijkmp_get_property_int64(mp: CPointer<UIntNative>, id: Int32, default_value: Int64): Int64
    // func ijkmp_set_property_int64(mp: CPointer<UIntNative>, id: Int32, value: Int64): Unit


    // // must be freed with free()
    // func ijkmp_get_meta_l(mp: CPointer<UIntNative>): CPointer<UIntNative>

    // // preferred to be called explicity, can be called multiple times
    // // NOTE: ijkmp_shutdown may block thread
    // func ijkmp_shutdown(mp: CPointer<UIntNative>): Unit

    // func ijkmp_inc_ref(mp: CPointer<UIntNative>): Unit

    // // call close at last release, also free memory
    // // NOTE: ijkmp_dec_ref may block thread
    // func ijkmp_dec_ref(mp: CPointer<UIntNative>): Unit
    // func ijkmp_dec_ref_p(pmp: CPointer<CPointer<UIntNative>>): Unit

    // func ijkmp_set_data_source(mp: CPointer<UIntNative>, url: CString): Int32
    // func ijkmp_prepare_async(mp: CPointer<UIntNative>): Int32
    // func ijkmp_start(mp: CPointer<UIntNative>): Int32
    // func ijkmp_pause(mp: CPointer<UIntNative>): Int32
    // func ijkmp_stop(mp: CPointer<UIntNative>): Int32
    // func ijkmp_seek_to(mp: CPointer<UIntNative>, msec: Int64): Int32
    // func ijkmp_get_state(mp: CPointer<UIntNative>): Int32
    // func ijkmp_is_playing(mp: CPointer<UIntNative>): Bool
    // func ijkmp_get_current_position(mp: CPointer<UIntNative>): Int64
    // func ijkmp_get_duration(mp: CPointer<UIntNative>): Int64
    // func ijkmp_get_playable_duration(mp: CPointer<UIntNative>): Int64
    // func ijkmp_set_loop(mp: CPointer<UIntNative>, loop: Int32): Unit
    // func ijkmp_get_loop(mp: CPointer<UIntNative>): Int32

    // func ijkmp_get_weak_thiz(mp: CPointer<UIntNative>): CPointer<Unit>
    // func ijkmp_set_weak_thiz(mp: CPointer<UIntNative>, weak_thiz: CPointer<Unit>): CPointer<Unit>

    // /* return < 0 if aborted, 0 if no packet and > 0 if packet.  */
    // /* need to call msg_free_res for freeing the resouce obtained in msg */
    // func ijkmp_get_msg(mp: CPointer<UIntNative>, msg: CPointer<UIntNative>, block: Int32): Int32
    // func ijkmp_set_frame_at_time(mp: CPointer<UIntNative>, path: CString, start_time: Int64, end_time: Int64, num: Int32, definition: Int32): Unit
}