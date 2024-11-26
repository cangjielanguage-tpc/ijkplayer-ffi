/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ijkplayer4cj

public enum InterruptHintType {
    | INTERRUPT_HINT_NONE
    | INTERRUPT_HINT_RESUME
    | INTERRUPT_HINT_PAUSE
    | INTERRUPT_HINT_STOP
    | INTERRUPT_HINT_DUCK
    | INTERRUPT_HINT_UNDUCK

    static func GetType(result: Int32): InterruptHintType {
        match (result) {
            case 0 => return InterruptHintType.INTERRUPT_HINT_NONE
            case 1 => return InterruptHintType.INTERRUPT_HINT_RESUME
            case 2 => return InterruptHintType.INTERRUPT_HINT_PAUSE
            case 3 => return InterruptHintType.INTERRUPT_HINT_STOP
            case 4 => return InterruptHintType.INTERRUPT_HINT_DUCK
            case 5 => return InterruptHintType.INTERRUPT_HINT_UNDUCK
            case _ => return InterruptHintType.INTERRUPT_HINT_NONE
        }
    }
}

public enum InterruptForceType {
    | INTERRUPT_FORCE
    | INTERRUPT_SHARE

    static func GetType(result: Int32): InterruptForceType {
        match (result) {
            case 0 => return InterruptForceType.INTERRUPT_FORCE
            case 1 => return InterruptForceType.INTERRUPT_SHARE
            case _ => return InterruptForceType.INTERRUPT_FORCE
        }
    }
}

public class InterruptEvent {
    var forceType: InterruptForceType
    var hintType: InterruptHintType

    public init(forceType: InterruptForceType, hintType: InterruptHintType) {
        this.forceType = forceType
        this.hintType = hintType
    }
}

public interface Callback<T> {
    public func callback(data: T): Unit
}

public class MediaInfoType {
    var audioDecoder: String = ""
    var videoDecoder: String = ""
    var meta: String = ""

    public init(audioDecoder: String, videoDecoder: String, meta: String) {
        this.audioDecoder = audioDecoder
        this.videoDecoder = videoDecoder
        this.meta = meta
    }
}

class GlobalListener {
    public static let map: ConcurrentHashMap<Int32, IjkMediaPlayer> = ConcurrentHashMap<Int32, IjkMediaPlayer>()
    public static var currentID: AtomicInt32 = AtomicInt32(0)

    public static func getCurrentId(): Int32 {
        return currentID.fetchAdd(1)
    }
}

public class IjkMediaPlayer {
    let ID: Int32 = GlobalListener.getCurrentId()
    //单例
    private static var instance: Option<IjkMediaPlayer> = None
    //option选项的key
    public static let OPT_CATEGORY_FORMAT: String = "1"
    public static let OPT_CATEGORY_CODEC: String = "2"
    public static let OPT_CATEGORY_SWS: String = "3"
    public static let OPT_CATEGORY_PLAYER: String = "4"
    //视频宽高
    private var mVideoWidth: Int32 = 0
    private var mVideoHeight: Int32 = 0
    private var mVideoSarNum: Int32 = 0
    private var mVideoSarDen: Int32 = 0

    //视频尺寸发生变化监听
    private var mOnVideoSizeChangedListener: Option<(width: Int32, height: Int32, sar_num: Int32, sar_den: Int32)-> Unit> = None
    //视频准备播放监听
    private var mOnPreparedListener: Option<()-> Unit> = None
    //视频播放结束监听
    private var mOnCompletionListener: Option<()-> Unit> = None
    //缓冲update监听
    private var mOnBufferingUpdateListener: Option<(percent: Int32) -> Unit> = None
    //发生错误监听
    private var mOnErrorListener: Option<(what: Int64, extra: Int64) -> Unit> = None
    //信息监听
    private var mOnInfoListener: Option<(what: Int64, extra: Int64) -> Unit> = None
    //进度条滑动监听
    private var mOnSeekCompleteListener: Option<() -> Unit> = None
    //时间监听
    private var mOnTimedTextListener: Option<(text: String) -> Unit> = None

    private var id: String = ''
    private var callback: Option<Callback<InterruptEvent>> = None

    //构造函数
    public init(id: String) {
        this.id = id
    }

    public static func getInstance(): IjkMediaPlayer {
        if (instance.isNone()) {
            IjkMediaPlayer.instance = IjkMediaPlayer("")
        }
        return IjkMediaPlayer.instance.getOrThrow()
    }

    public func setContext(id: String): Unit {
        this.id = id
    }

    public func setDebug(open: Bool): Unit {
        LogUtils.getInstance().setLogSwitch(open)
        if (open) {
            cjNativeOpenlog(this.id)
        }
    }

    public func setDataSource(url: String): Unit {
        cjSetDataSource(this.id, url)
    }

    public func setDataSourceHeader(headers: HashMap<String, String>): Unit {
        var builder: StringBuilder = StringBuilder()
        for ((key, value) in headers) {
            builder.append(key.trimAscii())
            builder.append(":")
            builder.append(value.trimAscii())
            builder.append("\r\n")
        }
        cjSetOption(this.id, IjkMediaPlayer.OPT_CATEGORY_FORMAT, "headers", builder.toString())
        cjSetOption(this.id, IjkMediaPlayer.OPT_CATEGORY_FORMAT, "protocol_whitelist",
            "async,cache,crypto,file,http,https,ijkhttphook,ijkinject,ijklivehook,ijklongurl,ijksegment,ijktcphook,pipe,rtp,tcp,tls,udp,ijkurlhook,data"
        )
    }

    public func setOption(category: String, key: String, value: String): Unit {
        cjSetOption(this.id, category, key, value)
    }

    public func setOptionLong(category: String, key: String, value: String): Unit {
        cjSetOptionLong(this.id, category, key, value)
    }

    public func prepareAsync(): Unit {
        cjPrepareAsync(this.id)
    }

    public func start(): Unit {
        cjStart(this.id)
    }

    public func stop(): Unit {
        cjStop(this.id)
    }

    public func pause(): Unit {
        cjPause(this.id)
    }

    public func reset(): Unit {
        cjReset(this.id)
    }

    public func release(): Unit {
        cjRelease(this.id)
        GlobalListener.map.remove(this.ID)
    }

    public func seekTo(msec: String): Unit {
        cjSeekTo(this.id, msec)
    }

    func setScreenOnWhilePlaying(on: Bool, context: AbilityContext): Unit {
        let win: Window = getLastWindow(getStageContext(context))
        win.setWindowKeepScreenOn(on)
    }

    public func setSpeed(speed: String): Unit {
        cjSetPropertyFloat(this.id, PropertiesType.FFP_PROP_FLOAT_PLAYBACK_RATE, speed)
    }

    public func getSpeed(): Float32 {
        return cjGetPropertyFloat(this.id, PropertiesType.FFP_PROP_FLOAT_PLAYBACK_RATE, "0")
    }

    public func isPlaying(): Bool {
        return cjIsPlaying(this.id)
    }

    func on(callback: Callback<InterruptEvent>): Unit {
        this.callback = callback
    }

    func off(): Unit {
        this.callback = None
    }

    public func setOnVideoSizeChangedListener(listener: (width: Int32, height: Int32, sar_num: Int32, sar_den: Int32)-> Unit): Unit {
        this.mOnVideoSizeChangedListener = listener
    }

    public func setOnPreparedListener(listener: ()-> Unit): Unit {
        this.mOnPreparedListener = listener
    }

    public func setOnCompletionListener(listener: ()-> Unit): Unit {
        this.mOnCompletionListener = listener
    }

    public func setOnInfoListener(listener: (what: Int64, extra: Int64) -> Unit): Unit {
        this.mOnInfoListener = listener
    }

    public func setOnErrorListener(listener: (what: Int64, extra: Int64) -> Unit): Unit {
        this.mOnErrorListener = listener
    }

    public func setOnBufferingUpdateListener(listener: (percent: Int32) -> Unit): Unit {
        this.mOnBufferingUpdateListener = listener
    }

    public func setOnSeekCompleteListener(listener: () -> Unit): Unit {
        this.mOnSeekCompleteListener = listener
    }

    public func setOnTimedTextListener(listener: (text: String) -> Unit): Unit {
        this.mOnTimedTextListener = listener
    }

    public func setMessageListener(): Unit {
        LogUtils.getInstance().LOGI("setMessageListener start")
        GlobalListener.map[ID] = this
        let messageCallBack: CFunc<(Int32, Int32, Int32, CString, Int32) -> Unit> = {
            what, arg1, arg2, obj, id =>
            LogUtils.getInstance().LOGI("setMessageListener callback what:${what}, arg1:${arg1},arg2:${arg2},obj:${id}")
            let that: IjkMediaPlayer = GlobalListener.map[id]
            let onVideoSizeChangedListener = that.mOnVideoSizeChangedListener
            let onPreparedListener = that.mOnPreparedListener
            let onCompletionListener = that.mOnCompletionListener
            let onBufferingUpdateListener = that.mOnBufferingUpdateListener
            let onErrorListener = that.mOnErrorListener
            let onInfoListener = that.mOnInfoListener
            let onSeekCompleteListener = that.mOnSeekCompleteListener
            let onTimedTextListener = that.mOnTimedTextListener
            if (what == MessageType.MEDIA_PREPARED) {
                if (let Some(v) <- onPreparedListener) {
                    v()
                }
            }
            if (what == MessageType.MEDIA_SET_VIDEO_SAR) {
                that.mVideoSarNum = arg1
                that.mVideoSarDen = arg2
            }
            if (what == MessageType.MEDIA_SET_VIDEO_SIZE) {
                if (let Some(v) <- onVideoSizeChangedListener) {
                    v(arg1, arg2, that.mVideoSarNum, that.mVideoSarDen)
                    if (arg1 != 0 && arg2 != 0) {
                        that.mVideoWidth = arg1
                        that.mVideoHeight = arg2
                    }
                }
            }
            if (what == MessageType.MEDIA_PLAYBACK_COMPLETE) {
                if (let Some(v) <- onCompletionListener) {
                    v()
                }
            }
            if (let Some(v) <- onBufferingUpdateListener) {
                if ((what == MessageType.MEDIA_BUFFERING_UPDATE) || (what == MessageType.MEDIA_BUFFERING_UPDATE)) {
                    var bufferPosition = arg1
                    if (bufferPosition < 0) {
                        bufferPosition = 0
                    }
                    var percent: Int32 = 0
                    var duration = cjGetDuration(that.id)
                    if (duration > 0) {
                        percent = bufferPosition * 100 / duration
                    }
                    if (percent >= 100) {
                        percent = 100
                    }
                    v(percent)
                }
            }
            if (what == MessageType.MEDIA_ERROR) {
                if (let Some(v) <- onErrorListener) {
                    v(Int64(arg1), Int64(arg2))
                }
            }
            if (what == MessageType.MEDIA_INFO) {
                if (let Some(v) <- onInfoListener) {
                    v(Int64(arg1), Int64(arg2))
                }
            }
            if (what == MessageType.MEDIA_SEEK_COMPLETE) {
                if (let Some(v) <- onSeekCompleteListener) {
                    v()
                }
            }
            if (what == MessageType.MEDIA_TIMED_TEXT) {
                if (let Some(v) <- onTimedTextListener) {
                     v(obj.toString())
                }
            }
            if (what == MessageType.MEDIA_AUDIO_INTERRUPT) {
                if (let Some(v) <- onCompletionListener) {
                    if (that.callback.isSome()) {
                        let event: InterruptEvent = InterruptEvent(InterruptForceType.GetType(arg1),
                            InterruptHintType.GetType(arg2))
                        that.callback?.callback(event)
                    }
                }
            }
        }
        cjSetMessageListener(this.id, ID, messageCallBack)
    }

    public func getVideoWidth(): Int64 {
        return Int64(this.mVideoWidth)
    }

    public func getVideoHeight(): Int64 {
        return Int64(this.mVideoHeight)
    }

    public func getVideoSarNum(): Int64 {
        return Int64(this.mVideoSarNum)
    }

    public func getVideoSarDen(): Int64 {
        return Int64(this.mVideoSarDen)
    }

    public func getDuration(): Int32 {
        return cjGetDuration(this.id)
    }

    public func getCurrentPosition(): Int32 {
        return cjGetCurrentPosition(this.id)
    }

    public func getAudioSessionId(): Int32 {
        return cjGetAudioSessionId(this.id)
    }

    private func _setPropertyFloat(property: String, value: String): Unit {
        cjSetPropertyFloat(this.id, property, value)
    }

    private func _getPropertyFloat(property: String, value: String): Float32 {
        return cjGetPropertyFloat(this.id, property, value)
    }

    private func _setPropertyLong(property: String, value: String): Unit {
        cjSetPropertyLong(this.id, property, value)
    }

    private func _getPropertyLong(property: String, value: String): Int64 {
        return cjGetPropertyLong(this.id, property, value)
    }

    public func setVolume(leftVolume: String, rightVolume: String): Unit {
        cjSetVolume(this.id, leftVolume, rightVolume)
    }

    public func setLoopCount(looping: Bool): Unit {
        var loopCount: String = ""
        if (looping) {
            loopCount = "0"
        } else {
            loopCount = "1"
        }
        this.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "loop", loopCount)
        cjSetLoopCount(this.id, loopCount)
    }

    func isLooping(): Bool {
        return cjGetLoopCount(this.id) != 1
    }

    func selectTrack(track: String): Unit {
        cjSetStreamSelected(this.id, track, "true")
    }

    func deselectTrack(track: String): Unit {
        cjSetStreamSelected(this.id, track, "false")
    }

    private func _setStreamSelected(stream: String, select: String): Unit {
        cjSetStreamSelected(this.id, stream, select)
    }

    func getVideoDecoder(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_VIDEO_DECODER,
            PropertiesType.FFP_PROPV_DECODER_UNKNOWN)
    }

    func getVideoOutputFramesPerSecond(): Float32 {
        return cjGetPropertyFloat(this.id, PropertiesType.PROP_FLOAT_VIDEO_OUTPUT_FRAMES_PER_SECOND, "0")
    }

    func getVideoDecodeFramesPerSecond(): Float32 {
        return cjGetPropertyFloat(this.id, PropertiesType.PROP_FLOAT_VIDEO_DECODE_FRAMES_PER_SECOND, "0")
    }

    func getVideoCachedDuration(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_DURATION, "0")
    }

    func getAudioCachedDuration(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_DURATION, "0")
    }

    func getVideoCachedBytes(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_BYTES, "0")
    }

    func getAudioCachedBytes(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_BYTES, "0")
    }

    func getVideoCachedPackets(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_PACKETS, "0")
    }

    func getAudioCachedPackets(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_PACKETS, "0")
    }

    func getAsyncStatisticBufBackwards(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_BACKWARDS, "0")
    }

    func getAsyncStatisticBufForwards(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_FORWARDS, "0")
    }

    func getAsyncStatisticBufCapacity(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_CAPACITY, "0")
    }

    func getTrafficStatisticByteCount(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_TRAFFIC_STATISTIC_BYTE_COUNT, "0")
    }

    func getCacheStatisticPhysicalPos(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_PHYSICAL_POS, "0")
    }

    func getCacheStatisticFileForwards(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_FILE_FORWARDS, "0")
    }

    func getCacheStatisticFilePos(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_FILE_POS, "0")
    }

    func getCacheStatisticCountBytes(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_COUNT_BYTES, "0")
    }

    func getFileSize(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_LOGICAL_FILE_SIZE, "0")
    }

    func getBitRate(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_BIT_RATE, "0")
    }

    func getTcpSpeed(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_TCP_SPEED, "0")
    }

    func getSeekLoadDuration(): Int64 {
        return cjGetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_LATEST_SEEK_LOAD_DURATION, "0")
    }

    func getDropFrameRate(): Float32 {
        return cjGetPropertyFloat(this.id, PropertiesType.FFP_PROP_FLOAT_DROP_FRAME_RATE, "0")
    }

    func setCacheShare(share: String) {
        cjSetPropertyLong(this.id, PropertiesType.FFP_PROP_INT64_SHARE_CACHE_DATA, share)
    }

    private func _getVideoCodecInfo(): String {
        return cjGetVideoCodecInfo(this.id)
    }

    private func _getAudioCodecInfo(): String {
        return cjGetAudioCodecInfo(this.id)
    }

    private func _getMediaMeta(): String {
        return cjGetMediaMeta(this.id)
    }

    func getMediaInfo(): MediaInfoType {
        let mAudioDecoder = cjGetAudioCodecInfo(this.id)
        let mVideoDecoder = cjGetVideoCodecInfo(this.id)
        let mMeta = cjGetMediaMeta(this.id)
        return MediaInfoType(mAudioDecoder, mVideoDecoder, mMeta)
    }

    public func native_setup(): Unit {
        cjNativeSetup(this.id)
    }
}
