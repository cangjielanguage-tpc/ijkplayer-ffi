package ijkplayer4cj.ijkplayer


public class IjkMediaPlayer {
    public static let OPT_CATEGORY_FORMAT: String = "1";
    public static let OPT_CATEGORY_CODEC: String = "2";
    public static let OPT_CATEGORY_SWS: String = "3";
    public static let OPT_CATEGORY_PLAYER: String = "4";
    private static var instance: IjkMediaPlayer = IjkMediaPlayer()

    private var mVideoWidth: Int64 = 0;
    private var mVideoHeight: Int64 = 0;
    private var mVideoSarNum: Int64 = 0;
    private var mVideoSarDen: Int64 = 0;


    private var mOnVideoSizeChangedListener: ?OnVideoSizeChangedListener = None
    private var mOnPreparedListener: ?OnPreparedListener = None
    private var mOnCompletionListener: ?OnCompletionListener = None
    private var mOnBufferingUpdateListener: ?OnBufferingUpdateListener = None
    private var mOnErrorListener: ?OnErrorListener = None
    private var mOnInfoListener: ?OnInfoListener = None
    private var mOnSeekCompleteListener: ?OnSeekCompleteListener = None
    private var mOnTimedTextListener: ?OnTimedTextListener = None
    // private var ijkplayer_napi: ?IjkPlayerNapi = None

    private init(){}
    public static func getInstance(): IjkMediaPlayer {
        return instance
    }




}