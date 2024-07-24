# ijkplayer4cj 库

### 介绍

ijkplayer4cj 是仓颉环境下可用的一款基于 FFmpeg 的视频播放器。


## 1 UI 视频播放基本功能

前置条件：NA 

场景：

1. 支持视频播放、暂停、停止、重置、释放、快进、后退、屏幕常亮、循环播放、设置音量

约束：
依赖：

性能：支持版本几何性能持平

可靠性：NA

### 1.1 视频播放基本功能

#### 1.1.1 主要接口

```ets
export class IjkMediaPlayer {
    public static OPT_CATEGORY_FORMAT: string = "1"
    public static OPT_CATEGORY_CODEC: string = "2"
    public static OPT_CATEGORY_SWS: string = "3"
    public static OPT_CATEGORY_PLAYER: string = "4"

    /** 
     * 获取 IjkMediaPlayer 实例
     */
    public static getInstance()

    /** 
     * 设置 XComponent 回调的 context
     *
     * 参数 id - 组件 id 值
     * 参数 context - XComponent 回调的 context
     */
    setContext(id: string, context: object)

    /** 
     * 设置 debug 模式
     *
     * 参数 open - 是否打开 debug 模式,默认为false,不是debug模式
     */
    setDebug(open: boolean)

    /** 
     * 初始化配置
     */
    native_setup()

    /** 
     * 设置视频源
     *
     * 参数 url - 视频地址
     */
    setDataSource(url: string)

    /** 
     * 设置视频源 http 请求头
     *
     * 参数 headers - 请求头
     */
    setDataSourceHeader(headers: Map<string, string>)

    /** 
     * 设置视频播放参数
     *
     * 参数 category - OPT_CATEGORY_FORMAT、OPT_CATEGORY_CODEC、OPT_CATEGORY_SWS、OPT_CATEGORY_PLAYER
     * 参数 key - 比如 "max-buffer-size"(预读数据的缓冲区大小的key) , 比如 "min-frames"(停止预读的最小帧数的key)
     * 参数 value - 比如 "102400"(预读数据的缓冲区大小的value) , 比如 "100"(停止预读的最小帧数的value)
     */
    setOption(category: string, key: string, value: string)

    /** 
     * 设置屏幕常亮
     *
     * 参数 on - 是否保持常亮,默认为true,保持常亮
     */
    setScreenOnWhilePlaying(on: boolean)

    /** 
     * video 尺寸改变监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnVideoSizeChangedListener(listener: OnVideoSizeChangedListener)

    /** 
     * 视频准备监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnPreparedListener(listener: OnPreparedListener)

    /** 
     * 视频准备完成监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnCompletionListener(listener: OnCompletionListener)

    /** 
     * 信息监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnInfoListener(listener: OnInfoListener)

    /** 
     * 错误信息监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnErrorListener(listener: OnErrorListener)

    /** 
     * 缓存更新监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnBufferingUpdateListener(listener: OnBufferingUpdateListener)

    /** 
     * 跳转完成监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnSeekCompleteListener(listener: OnSeekCompleteListener)

    /** 
     * 视频超时监听事件
     *
     * 参数 listener - 监听事件
     */
    setOnTimedTextListener(listener: OnTimedTextListener)

    /** 
     * 设置信息监听
     */
    setMessageListener()

    /** 
     * 准备播放
     */
    prepareAsync()

    /** 
     * 开始播放
     */
    start()

    /** 
     * 停止
     */
    stop()

    /** 
     * 暂停
     */
    pause()

    /** 
     * 重置
     */
    reset()

    /** 
     * 释放
     */
    release()

    /** 
     * 跳到指定时间节点的视频处
     *
     * 参数 msec - 视频时间节点，范围（"0" ~ "getDuration()"）
     */
    seekTo(msec: string)

    /** 
     * 倍数播放
     *
     * 参数 speed - 倍数 常规参数（"0.25"、"0.5"、"0.75"、"1"、"1.5"、"2"、"4"）数字后面加f也可，比如0.5f
     */
    setSpeed(speed: string)

    /** 
     * 获取倍数
     *
     * 返回值 number - 倍数
     */
    getSpeed(): number

    /** 
     * 判断是否是播放状态
     *
     * 返回值 boolean - 是否
     */
    isPlaying(): boolean

    /** 
     * 获取 video 的宽
     *
     * 返回值 number - 宽
     */
    getVideoWidth(): number

    /** 
     * 获取 video 的高
     *
     * 返回值 number - 高
     */
    getVideoHeight(): number

    /** 
     * 获取视频高度
     *
     * 返回值 number - 高
     */
    getVideoSarNum(): number

    /** 
     * 获取视频高度
     *
     * 返回值 number - 高
     */
    getVideoSarDen(): number

    /** 
     * 获取视频总时长
     *
     * 返回值 number - 时长
     */
    getDuration(): number

    /** 
     * 获取视频播放当前位置
     *
     * 返回值 number - 视频播放当前位置
     */
    getCurrentPosition(): number

    /** 
     * 获取音频sessionID
     *
     * 返回值 number - 音频sessionID
     */
    getAudioSessionId(): number

    /** 
     * 设置音量
     *
     * 参数 leftVolume - 左声道音量（"0" ~ "1"）正常可按0.1幅度增长
     * 参数 rightVolume - 右声道音量（"0" ~ "1"）正常可按0.1幅度增长
     */
    setVolume(leftVolume: string, rightVolume: string)

    /** 
     * 设置循环播放
     *
     * 参数 looping - 是否循环播放,true循环播放，false不循环播放
     */
    setLoopCount(looping: boolean)

    /** 
     * 是否循环播放
     *
     * 返回值 boolean - 是否循环播放,默认为false
     */
    isLooping(): boolean

    /** 
     * 选择轨道（需要在视频播放之前选择有效）
     *
     * 参数 track - "0" - 视频轨道
     *              "1" - 音频轨道
     *              "3" - 字幕
     */
    selectTrack(track: string)

    /** 
     * 删除选择的轨道（需要在视频播放之前选择有效）
     *
     * 参数 track - "0" - 视频轨道
     *              "1" - 音频轨道
     *              "3" - 字幕
     */
    deselectTrack(track: string)

    /** 
     * 获取视频解码
     *
     * 返回值 number - 码值
     */
    getVideoDecoder(): number

    /** 
     * 统计每秒渲染帧数，即播放帧率
     *
     * 返回值 number 
     */
    getVideoOutputFramesPerSecond(): number

    /** 
     * 统计每秒解码帧数，即解码帧率
     *
     * 返回值 number 
     */
    getVideoDecodeFramesPerSecond(): number

    /** 
     * 获取当前视频缓冲时长
     *
     * 返回值 number 
     */
    getVideoCachedDuration(): number

    /** 
     * 获取当前音频缓冲时长
     *
     * 返回值 number 
     */
    getAudioCachedDuration(): number

    /** 
     * 获取当前视频缓冲字节
     *
     * 返回值 number 
     */
    getVideoCachedBytes(): number

    /** 
     * 获取当前音频缓冲字节
     *
     * 返回值 number 
     */
    getAudioCachedBytes(): number

    /** 
     * 获取当前视频缓存数据包
     *
     * 返回值 number 
     */
    getVideoCachedPackets(): number

    /** 
     * 获取当前音频缓存数据包
     *
     * 返回值 number 
     */
    getAudioCachedPackets(): number

    /** 
     * 向后获取异步统计Buf
     *
     * 返回值 number 
     */
    getAsyncStatisticBufBackwards(): number

    /** 
     * 向前获取异步统计 Buf
     *
     * 返回值 number 
     */
    getAsyncStatisticBufForwards(): number

    /** 
     * 获取异步统计 Buf 容量
     *
     * 返回值 number 
     */
    getAsyncStatisticBufCapacity(): number

    /** 
     * 获取流量统计字节计数
     *
     * 返回值 number 
     */
    getTrafficStatisticByteCount(): number

    /** 
     * 获取缓存统计物理位置
     *
     * 返回值 number 
     */
    getCacheStatisticPhysicalPos(): number

    /** 
     * 获取缓存统计文件
     *
     * 返回值 number 
     */
    getCacheStatisticFileForwards(): number

    /** 
     * 获取缓存统计文件位置
     *
     * 返回值 number 
     */
    getCacheStatisticFilePos(): number

    /** 
     * 获取缓存统计计数字节
     *
     * 返回值 number 
     */
    getCacheStatisticCountBytes(): number

    /** 
     * 获取文件大小
     *
     * 返回值 number 
     */
    getFileSize(): number

    /** 
     * 获取码率
     *
     * 返回值 number 
     */
    getBitRate(): number

    /** 
     * 获取 tcp 速率
     *
     * 返回值 number 
     */
    getTcpSpeed(): number

    /** 
     * 获取丢弃帧速率
     *
     * 返回值 number 
     */
    getDropFrameRate(): number

    /** 
     * 设置缓存共享
     *
     * 参数 share - "0" - 不设置缓存共享
     *              "1" - 设置缓存共享
     */
    setCacheShare(share: string)

    /** 
     * 获取媒体信息
     *
     * 返回值 object 
     */
    getMediaInfo(): object

}
```

## 2. UI 视频播放示例

前置条件：NA 

场景：

1. 支持视频播放、暂停、停止、重置、释放、快进、后退、屏幕常亮、循环播放、设置音量

约束：
依赖：

性能：支持版本几何性能持平

可靠性：NA

### 1.1 UI 视频播放demo

```ets
let mIjkMediaPlayer = IjkMediaPlayer.getInstance();
// 设置XComponent回调的context
mIjkMediaPlayer.setContext(this.mContext);
// 设置debug模式
mIjkMediaPlayer.setDebug(true);
// 初始化配置
mIjkMediaPlayer.native_setup();
// 设置视频源
mIjkMediaPlayer.setDataSource(url); 
// 设置视频源http请求头
let headers =  new Map([
    ["user_agent", "Mozilla/5.0 BiliDroid/7.30.0 (xxxxxxx@xxxxxxx.com)"],
    ["referer", "https://xxxxxx.com"]
]);
mIjkMediaPlayer.setDataSourceHeader(headers);
// 使用精确寻帧 例如，拖动播放后，会寻找最近的关键帧进行播放，很有可能关键帧的位置不是拖动后的位置，而是较前的位置.可以设置这个参数来解决问题
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "enable-accurate-seek", "1");
// 预读数据的缓冲区大小
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "max-buffer-size", "102400");
// 停止预读的最小帧数
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "min-frames", "100");
// 启动预加载
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "start-on-prepared", "1");
// 设置无缓冲，这是播放器的缓冲区，有数据就播放
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "packet-buffering", "0");
// 跳帧处理,放CPU处理较慢时，进行跳帧处理，保证播放流程，画面和声音同步
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "framedrop", "5");
// 最大缓冲cache是3s， 有时候网络波动，会突然在短时间内收到好几秒的数据
// 因此需要播放器丢包，才不会累积延时
// 这个和第三个参数packet-buffering无关。
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "max_cached_duration", "3000");
// 无限制收流
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "infbuf", "1");
// 屏幕常亮
mIjkMediaPlayer.setScreenOnWhilePlaying(true);
// 设置超时
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "timeout", "10000000");
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "connect_timeout", "10000000");
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "listen_timeout", "10000000");
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "addrinfo_timeout", "10000000");
mIjkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "dns_cache_timeout", "10000000");

let mOnVideoSizeChangedListener: OnVideoSizeChangedListener = {
    onVideoSizeChanged(width: number, height: number, sar_num: number, sar_den: number) {
    that.aspRatio = width / height;
    LogUtils.getInstance()
        .LOGI("setOnVideoSizeChangedListener-->go:" + width + "," + height + "," + sar_num + "," + sar_den)
    that.hideLoadIng();
    }
}
mIjkMediaPlayer.setOnVideoSizeChangedListener(mOnVideoSizeChangedListener);
let mOnPreparedListener: OnPreparedListener = {
    onPrepared() {
    LogUtils.getInstance().LOGI("setOnPreparedListener-->go");
    }
}
mIjkMediaPlayer.setOnPreparedListener(mOnPreparedListener);

let mOnCompletionListener: OnCompletionListener = {
    onCompletion() {
    LogUtils.getInstance().LOGI("OnCompletionListener-->go")
    that.currentTime = that.stringForTime(mIjkMediaPlayer.getDuration());
    that.progressValue = PROGRESS_MAX_VALUE;
    that.stop();
    }
}
mIjkMediaPlayer.setOnCompletionListener(mOnCompletionListener);

let mOnBufferingUpdateListener: OnBufferingUpdateListener = {
    onBufferingUpdate(percent: number) {
    LogUtils.getInstance().LOGI("OnBufferingUpdateListener-->go:" + percent)
    }
}
mIjkMediaPlayer.setOnBufferingUpdateListener(mOnBufferingUpdateListener);

let mOnSeekCompleteListener: OnSeekCompleteListener = {
    onSeekComplete() {
    LogUtils.getInstance().LOGI("OnSeekCompleteListener-->go")
    that.startPlayOrResumePlay();
    }
}
mIjkMediaPlayer.setOnSeekCompleteListener(mOnSeekCompleteListener);

let mOnInfoListener: OnInfoListener = {
    onInfo(what: number, extra: number) {
    LogUtils.getInstance().LOGI("OnInfoListener-->go:" + what + "===" + extra)
    }
}
mIjkMediaPlayer.setOnInfoListener(mOnInfoListener);

let mOnErrorListener: OnErrorListener = {
    onError(what: number, extra: number) {
    LogUtils.getInstance().LOGI("OnErrorListener-->go:" + what + "===" + extra)
    that.hideLoadIng();
    prompt.showToast({
        message:"亲，视频播放异常，系统开小差咯"
    });
    }
}
mIjkMediaPlayer.setOnErrorListener(mOnErrorListener);

mIjkMediaPlayer.setMessageListener();

mIjkMediaPlayer.prepareAsync();

mIjkMediaPlayer.start();

```

## 3 其他接口

### 2.1 LogUtils


```ets
export class LogUtils {
    /** 
     * 获取日志实例
     *
     * 返回值 number 
     */
    public static getInstance()

    /** 
     * 设置日志开关
     *
     * 参数 logOpen - 日志是否打开,默认为false不打开 
     */
    setLogSwitch(logOpen: boolean)

    /** 
     * 日志
     *
     * 参数 info - 日志信息
     */
    LOGI(info: string)
}
```

### 2.2 仓颉与c 互操作接口

```cangjie

/** 
 * 打开日志
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjNativeOpenlog(xcomponentId: String): Unit

/** 
 * 设置数据源
 *
 * 参数 xcomponentId - 组件 id
 * 参数 url - 视频地址
 * 返回值 Unit 
 */
public func cjSetDataSource(xcomponentId: String,  url: String): Unit

/** 
 * 设置参数选项
 *
 * 参数 xcomponentId - 组件 id
 * 参数 category - 类别
 * 参数 name - 参数名称
 * 参数 value - 值
 * 返回值 Unit 
 */
public func cjSetOption(xcomponentId: String, category: String, name: String, value: String): Unit

/** 
 * 设置参数选项
 *
 * 参数 xcomponentId - 组件 id
 * 参数 category - 类别
 * 参数 name - 参数名称
 * 参数 value - 值
 * 返回值 Unit 
 */
public func cjSetOptionLong(xcomponentId: String, category: String, name: String, value: String): Unit

/** 
 * 准备播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjPrepareAsync(xcomponentId: String): Unit

/** 
 * 开始播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjStart(xcomponentId: String): Unit

/** 
 * 停止播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjStop(xcomponentId: String): Unit

/** 
 * 暂停播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjPause(xcomponentId: String): Unit

/** 
 * 重置播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjReset(xcomponentId: String): Unit

/** 
 * 释放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjRelease(xcomponentId: String): Unit

/** 
 * 跳转
 *
 * 参数 xcomponentId - 组件 id
 * 参数 msec - 跳转到指定为止 ms
 * 返回值 Unit 
 */
public func cjSeekTo(xcomponentId: String, msec: String): Unit

/** 
 * 判断是否播放
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjIsPlaying(xcomponentId: String): Bool

/** 
 * 获取视频总时长
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Int32 
 */
public func cjGetDuration(xcomponentId: String): Int32

/** 
 * 获取视频播放当前位置
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Int32 
 */
public func cjGetCurrentPosition(xcomponentId: String): Int32

/** 
 * 	获取音频sessionID
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Int32 
 */
public func cjGetAudioSessionId(xcomponentId: String): Int32

/** 
 * 设置视频属性
 *
 * 参数 xcomponentId - 组件 id
 * 参数 ids - 属性
 * 参数 value - 属性值
 * 返回值 Unit 
 */
public func cjSetPropertyFloat(xcomponentId: String, ids: String, value: String): Unit

/** 
 * 获取视频属性
 *
 * 参数 xcomponentId - 组件 id
 * 参数 ids - 属性
 * 参数 value - 属性值
 * 返回值 Float32 
 */
public func cjGetPropertyFloat(xcomponentId: String, ids: String, defaultValue: String): Float32

/** 
 * 设置视频属性
 *
 * 参数 xcomponentId - 组件 id
 * 参数 property - 属性
 * 参数 value - 属性值
 * 返回值 Unit 
 */
public func cjSetPropertyLong(xcomponentId: String, property: String, value: String): Unit

/** 
 * 获取视频属性
 *
 * 参数 xcomponentId - 组件 id
 * 参数 property - 属性
 * 参数 value - 属性值
 * 返回值 Int64 
 */
public func cjGetPropertyLong(xcomponentId: String, property: String, value: String): Int64 

/** 
 * 设置音量
 *
 * 参数 xcomponentId - 组件 id
 * 参数 leftVolume - 左音量
 * 参数 rightVolume - 右音量
 * 返回值 Unit 
 */
public func cjSetVolume(xcomponentId: String, leftVolume: String, rightVolume: String): Unit

/** 
 * 设置视频循环
 *
 * 参数 xcomponentId - 组件 id
 * 参数 loopCount - 循环次数
 * 返回值 Unit 
 */
public func cjSetLoopCount(xcomponentId: String, loopCount: String): Unit

/** 
 * 获取视频循环次数
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Int32 
 */
public func cjGetLoopCount(xcomponentId: String): Int32

/** 
 * 设置视频流选择
 *
 * 参数 xcomponentId - 组件 id
 * 参数 stream - 视频流
 * 参数 select 
 * 返回值 Unit 
 */
public func cjSetStreamSelected(xcomponentId: String, stream: String, select: String): Unit

/** 
 * 获取视频解码
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 String 
 */
public func cjGetVideoCodecInfo(xcomponentId: String): String

/** 
 * 获取音频解码
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 String 
 */
public func cjGetAudioCodecInfo(xcomponentId: String): String

/** 
 * 获取媒体信息
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 String 
 */
public func cjGetMediaMeta(xcomponentId: String): String

/** 
 * 初始化配置
 *
 * 参数 xcomponentId - 组件 id
 * 返回值 Unit 
 */
public func cjNativeSetup(xcomponentId: String): Unit
```