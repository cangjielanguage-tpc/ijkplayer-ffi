// DEPENDENCE: 111.mp4
// EXEC: cjc %import-path %L %l %f -g
// EXEC: ./main


from ijkplayer4cj import ijkplayer4cj.napi.*
from std import collection.*


main() {    
    let url: String = "./111.mp4"
    println("------12312366666")
    var mIjkMediaPlayer: IJKPlayerNapiProxy = IJKPlayerNapiProxy("id")
    println("------123123")
    var abc = mIjkMediaPlayer.nativeSetup("123", "123")
    println("----------")
    //  // 设置视频源
    mIjkMediaPlayer.setDataSource(url); 
    // 设置视频源http请求头
    // let headers = HashMap<String, String>(
    //   ("user_agent", "Mozilla/5.0 BiliDroid/7.30.0 (bbcallen@gmail.com)"),
    //   ("referer", "https://www.bilibili.com")
    // );
    //mIjkMediaPlayer.setDataSourceHeader(headers);
    // 使用精确寻帧 例如，拖动播放后，会寻找最近的关键帧进行播放，很有可能关键帧的位置不是拖动后的位置，而是较前的位置.可以设置这个参数来解决问题
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "enable-accurate-seek", "1");
    // 预读数据的缓冲区大小
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "max-buffer-size", "102400");
    // 停止预读的最小帧数
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "min-frames", "100");
    // 启动预加载
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "start-on-prepared", "1");
    // 设置无缓冲，这是播放器的缓冲区，有数据就播放
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "packet-buffering", "0");
    // 跳帧处理,放CPU处理较慢时，进行跳帧处理，保证播放流程，画面和声音同步
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "framedrop", "5");
    // 最大缓冲cache是3s， 有时候网络波动，会突然在短时间内收到好几秒的数据
    // 因此需要播放器丢包，才不会累积延时
    // 这个和第三个参数packet-buffering无关。
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "max_cached_duration", "3000");
    // 无限制收流
    mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_PLAYER, "infbuf", "1");
    // 屏幕常亮
    // mIjkMediaPlayer.setScreenOnWhilePlaying(true);
    // 设置超时
    // mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_FORMAT, "timeout", "10000000");
    // mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_FORMAT, "connect_timeout", "10000000");
    // mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_FORMAT, "listen_timeout", "10000000");
    // mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_FORMAT, "addrinfo_timeout", "10000000");
    // mIjkMediaPlayer.setOption(IJKPlayerNapiProxy.OPT_CATEGORY_FORMAT, "dns_cache_timeout", "10000000");
   
    mIjkMediaPlayer.message_loop_callback_default();
    mIjkMediaPlayer.prepareAsync();

    mIjkMediaPlayer.start();
    println(mIjkMediaPlayer.isPlaying())
    println(mIjkMediaPlayer.getDuration())
    
    return 0
}

