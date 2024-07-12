/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

export declare class IjkPlayerNapi {
    // _nativeOpenlog();
    // _setDataSource(url:string);
    // _setOption(category:string,key:string,value:string);
    // _setOptionLong(category:string,key:string,value:string);
    // _prepareAsync();
    // _start();
    // _stop();
    // _pause();
    // _reset();
    // _release();
    // _seekTo(msec:string);
    // _isPlaying();
    // _getDuration();
    _setMessageListener(messageCallBack:Function): number;
    // _getCurrentPosition();
    // _getAudioSessionId();
    // _setPropertyFloat(property: string, value: string);
    // _getPropertyFloat(property: string, value: string);
    // _setPropertyLong(property: string, value: string);
    // _getPropertyLong(property: string, value: string);
    // _setVolume(leftVolume: string, rightVolume: string);
    // _setLoopCount(loopCount: string);
    // _getLoopCount();
    // _setStreamSelected(stream: string, select: string);
    // _getVideoCodecInfo();
    // _getAudioCodecInfo();
    // _getMediaMeta();
    // _native_setup();
    _get_ijkplayer_ptr():number;
}