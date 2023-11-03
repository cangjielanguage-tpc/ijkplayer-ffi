package ijkplayer4cj.ijkplayer


public interface OnBufferingUpdateListener {
    func onBufferingUpdate(percent: Int64): Unit
}

public interface OnCompletionListener {
    func OnCompletion(): Unit
}

public interface OnErrorListener {
    func OnError(what: Int64, extra: Int64): Unit
}

public interface OnInfoListener {
    func OnInfo(what: Int64, extra: Int64): Unit
}

public interface OnPreparedListener {
    func onPrepared(): Unit
}

public interface OnSeekCompleteListener {
    func onSeekComplete(): Unit
}

public interface OnTimedTextListener {
    func onTimedText(text: String): Unit
}

public interface OnVideoSizeChangedListener {
    func onVideoSizeChanged(width: Int64, height: Int64, sar_num: Int64, sar_den: Int64): Unit
}

