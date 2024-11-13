package ijkplayer4cj

public interface OnBufferingUpdateListener {
    func onBufferingUpdate(percent: Int32): Unit
}

public interface OnCompletionListener {
    func onCompletion(): Unit
}

public interface OnErrorListener {
    func onError(what: Int64, extra: Int64): Unit
}

public interface OnInfoListener {
    func onInfo(what: Int64, extra: Int64): Unit
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
    func onVideoSizeChanged(width: Int32, height: Int32, sar_num: Int32, sar_den: Int32): Unit
}

