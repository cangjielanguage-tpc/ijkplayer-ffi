/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { OnPreparedListener } from "../ijkplayer/callback/OnPreparedListener";
import { OnCompletionListener } from "../ijkplayer/callback/OnCompletionListener";
import { OnVideoSizeChangedListener } from "../ijkplayer/callback/OnVideoSizeChangedListener";
import { OnBufferingUpdateListener } from "../ijkplayer/callback/OnBufferingUpdateListener";
import { OnErrorListener } from "../ijkplayer/callback/OnErrorListener";
import { OnInfoListener } from "../ijkplayer/callback/OnInfoListener";
import { OnSeekCompleteListener } from "../ijkplayer/callback/OnSeekCompleteListener";
import { OnTimedTextListener } from "../ijkplayer/callback/OnTimedTextListener";
import { MessageType } from '../ijkplayer/common/MessageType';
import { PropertiesType } from '../ijkplayer/common/PropertiesType';
import { LogUtils } from "../ijkplayer/utils/LogUtils";
import window from '@ohos.window';
import { IjkPlayerNapi } from "./utils/IjkPlayerNapi";

declare function requireCJ(libName: string, isCJ?: boolean, withChannel?: boolean, fastMode?: boolean): any

const cjLib: {
    setDataSource(id: string, url: string): void;
    nativeOpenlog(id: string): void;
    setOption(id: string, category:string,key:string,value:string): void;
    setOptionLong(id: string, category:string,key:string,value:string): void;
    prepareAsync(id: string): void;
    start(id: string): void;
    stop(id: string): void;
    pause(id: string): void;
    reset(id: string): void;
    release(id: string): void;
    seekTo(id: string, msec:string): void;
    isPlaying(id: string): boolean;
    getDuration(id: string): number;
    // setMessageListener(messageCallBack:Function);
    getCurrentPosition(id: string): number;
    getAudioSessionId(id: string): number;
    setPropertyFloat(id: string, property: string, value: string): void;
    getPropertyFloat(id: string, property: string, value: string): number;
    setPropertyLong(id: string, property: string, value: string): void;
    getPropertyLong(id: string, property: string, value: string): number;
    setVolume(id: string, leftVolume: string, rightVolume: string): void;
    setLoopCount(id: string, loopCount: string): void;
    getLoopCount(id: string): number;
    setStreamSelected(id: string, stream: string, select: string): void;
    getVideoCodecInfo(id: string): string;
    getAudioCodecInfo(id: string): string;
    getMediaMeta(id: string): string;
    native_setup(id: string): void;
} = requireCJ("libijkplayer4cj_ijkplayer4cj.so", true)

export class IjkMediaPlayer {
  private static instance: IjkMediaPlayer;

  private constructor() {
  };

  public static getInstance() {
    if (!IjkMediaPlayer.instance) {
      IjkMediaPlayer.instance = new IjkMediaPlayer();
    }
    return IjkMediaPlayer.instance;
  }

  public static OPT_CATEGORY_FORMAT: string = "1";
  public static OPT_CATEGORY_CODEC: string = "2";
  public static OPT_CATEGORY_SWS: string = "3";
  public static OPT_CATEGORY_PLAYER: string = "4";
  private mVideoWidth: number = 0;
  private mVideoHeight: number = 0;
  private mVideoSarNum: number = 0;
  private mVideoSarDen: number = 0;
  private mOnVideoSizeChangedListener: OnVideoSizeChangedListener | null = null;
  private mOnPreparedListener: OnPreparedListener | null = null;
  private mOnCompletionListener: OnCompletionListener | null = null;
  private mOnBufferingUpdateListener: OnBufferingUpdateListener | null = null;
  private mOnErrorListener: OnErrorListener | null = null;
  private mOnInfoListener: OnInfoListener | null = null;
  private mOnSeekCompleteListener: OnSeekCompleteListener | null = null;
  private mOnTimedTextListener: OnTimedTextListener | null = null;
  private ijkplayer_napi: IjkPlayerNapi | null = null;
  private xComponentId: string = "";
  setContext(id: string, context: object) {
    this.ijkplayer_napi = context as IjkPlayerNapi;
    this.xComponentId = id;
  }

  setDebug(open: boolean) {
    LogUtils.getInstance().setLogSwitch(open);
    if (open && !!this.ijkplayer_napi) {
        cjLib.nativeOpenlog(this.xComponentId);
    }
  }

  setDataSource(url: string) {
    if (!!this.ijkplayer_napi)
        cjLib.setDataSource(this.xComponentId, url);
  }

  setDataSourceHeader(headers: Map<string, string>) {
    if (headers) {
      let builder: string = '';
      headers.forEach((value, key) => {
        let param = key.trim() + ":";
        if (value)
          param += value.trim();
        param += "\r\n";
        builder += param;
      });
      if (!!this.ijkplayer_napi) {
          cjLib.setOption(this.xComponentId, IjkMediaPlayer.OPT_CATEGORY_FORMAT, "headers", builder);
          cjLib.setOption(this.xComponentId, IjkMediaPlayer.OPT_CATEGORY_FORMAT, "protocol_whitelist", "async,cache,crypto,file,http,https,ijkhttphook,ijkinject,ijklivehook,ijklongurl,ijksegment,ijktcphook,pipe,rtp,tcp,tls,udp,ijkurlhook,data");
      }
    }
  }

  setOption(category: string, key: string, value: string) {
    if (!!this.ijkplayer_napi)
        cjLib.setOption(this.xComponentId, category, key, value);
  }

  setOptionLong(category: string, key: string, value: string) {
    if (!!this.ijkplayer_napi)
        cjLib.setOptionLong(this.xComponentId, category, key, value);
  }

  prepareAsync() {
    if (!!this.ijkplayer_napi)
        cjLib.prepareAsync(this.xComponentId);
  }

  start() {
    if (!!this.ijkplayer_napi)
        cjLib.start(this.xComponentId);
  }

  stop() {
    if (!!this.ijkplayer_napi)
        cjLib.stop(this.xComponentId);
  }

  pause() {
    if (!!this.ijkplayer_napi)
      cjLib.pause(this.xComponentId);
  }

  reset() {
    if (!!this.ijkplayer_napi)
      cjLib.reset(this.xComponentId);
  }

  release() {
    if (!!this.ijkplayer_napi)
      cjLib.release(this.xComponentId);
  }

  seekTo(msec: string) {
    if (!!this.ijkplayer_napi)
      cjLib.seekTo(this.xComponentId, msec);
  }

  setScreenOnWhilePlaying(on: boolean) {
    window.getTopWindow(getContext(this), (err, data) => {
      data.setKeepScreenOn(on);
    });
  }

  setSpeed(speed: string) {
    this._setPropertyFloat(PropertiesType.FFP_PROP_FLOAT_PLAYBACK_RATE, speed);
  }

  getSpeed(): number {
    return this._getPropertyFloat(PropertiesType.FFP_PROP_FLOAT_PLAYBACK_RATE, "0");
  }

  isPlaying(): boolean {
    if (!!this.ijkplayer_napi)
      return cjLib.isPlaying(this.xComponentId);
    else {
      return false
    }
  }

  setOnVideoSizeChangedListener(listener: OnVideoSizeChangedListener) {
    this.mOnVideoSizeChangedListener = listener;
  }

  setOnPreparedListener(listener: OnPreparedListener) {
    this.mOnPreparedListener = listener;
  }

  setOnCompletionListener(listener: OnCompletionListener) {
    this.mOnCompletionListener = listener;
  }

  setOnInfoListener(listener: OnInfoListener) {
    this.mOnInfoListener = listener;
  }

  setOnErrorListener(listener: OnErrorListener) {
    this.mOnErrorListener = listener;
  }

  setOnBufferingUpdateListener(listener: OnBufferingUpdateListener) {
    this.mOnBufferingUpdateListener = listener;
  }

  setOnSeekCompleteListener(listener: OnSeekCompleteListener) {
    this.mOnSeekCompleteListener = listener;
  }

  setOnTimedTextListener(listener: OnTimedTextListener) {
    this.mOnTimedTextListener = listener;
  }

  setMessageListener() {
    LogUtils.getInstance().LOGI("setMessageListener start");
    let that = this;
    let that2 = cjLib;
    let onVideoSizeChangedListener = this.mOnVideoSizeChangedListener;
    let onPreparedListener = this.mOnPreparedListener;
    let onCompletionListener = this.mOnCompletionListener;
    let onBufferingUpdateListener = this.mOnBufferingUpdateListener;
    let onErrorListener = this.mOnErrorListener;
    let onInfoListener = this.mOnInfoListener;
    let onSeekCompleteListener = this.mOnSeekCompleteListener;
    let onTimedTextListener = this.mOnTimedTextListener;
    let messageCallBack = (what: number, arg1: number, arg2: number, obj: string) => {
      LogUtils.getInstance()
        .LOGI("setMessageListener callback what:" + what + ", arg1:" + arg1 + ",arg2:" + arg2 + ",obj:" + obj);
      if (what == MessageType.MEDIA_PREPARED) {
        if (onPreparedListener !== null)
          onPreparedListener.onPrepared();
      }
      if (what == MessageType.MEDIA_SET_VIDEO_SAR) {
        if (arg1 != undefined && arg2 != undefined) {
          that.mVideoSarNum = arg1;
          that.mVideoSarDen = arg2;
        }
      }
      if (what == MessageType.MEDIA_SET_VIDEO_SIZE && onVideoSizeChangedListener != null) {
        onVideoSizeChangedListener.onVideoSizeChanged(arg1, arg2, that.mVideoSarNum, that.mVideoSarDen);
        if (arg1 != 0 && arg2 != 0) {
          that.mVideoWidth = arg1;
          that.mVideoHeight = arg2;
        }
      }

      if (what == MessageType.MEDIA_PLAYBACK_COMPLETE && onCompletionListener != null) {
        onCompletionListener.onCompletion();
      }

      if (!!that.ijkplayer_napi && what == MessageType.MEDIA_BUFFERING_UPDATE && onBufferingUpdateListener != null) {
        let bufferPosition = arg1;
        if (bufferPosition < 0) {
          bufferPosition = 0;
        }
        let percent = 0;
        let duration: number = cjLib.getDuration(that.xComponentId);
        if (duration > 0) {
          percent = bufferPosition * 100 / duration;
        }
        if (percent >= 100) {
          percent = 100;
        }
        onBufferingUpdateListener.onBufferingUpdate(percent);
      }

      if (what == MessageType.MEDIA_ERROR && onErrorListener != null) {
        onErrorListener.onError(arg1, arg2);
      }
      if (what == MessageType.MEDIA_INFO && onInfoListener != null) {
        onInfoListener.onInfo(arg1, arg2);
      }
      if (what == MessageType.MEDIA_SEEK_COMPLETE && onSeekCompleteListener != null) {
        onSeekCompleteListener.onSeekComplete();
      }
      if (what == MessageType.MEDIA_TIMED_TEXT && onTimedTextListener != null) {
        onTimedTextListener.onTimedText(obj);
      }
    };
    if (!!this.ijkplayer_napi)
      this.ijkplayer_napi._setMessageListener(messageCallBack);
  }

  getVideoWidth(): number {
    return this.mVideoWidth;
  }

  getVideoHeight(): number {
    return this.mVideoHeight;
  }

  getVideoSarNum(): number {
    return this.mVideoSarNum;
  }

  getVideoSarDen(): number {
    return this.mVideoSarDen;
  }

  getDuration(): number {
    if (!!this.ijkplayer_napi)
      return cjLib.getDuration(this.xComponentId);
    else {
      return 0
    }
  }

  getCurrentPosition(): number {
    if (!!this.ijkplayer_napi)
      return cjLib.getCurrentPosition(this.xComponentId);
    else {
      return 0
    }
  }

  getAudioSessionId(): number {
    if (!!this.ijkplayer_napi)
      return cjLib.getAudioSessionId(this.xComponentId);
    else {
      return 0
    }
  }

  private _setPropertyFloat(property: string, value: string) {
    if (!!this.ijkplayer_napi)
      cjLib.setPropertyFloat(this.xComponentId, property, value);
  }

  private _getPropertyFloat(property: string, value: string): number {
    if (!!this.ijkplayer_napi)
      return cjLib.getPropertyFloat(this.xComponentId, property, value);
    else {
      return 0
    }
  }

  private _setPropertyLong(property: string, value: string) {
    if (!!this.ijkplayer_napi)
      cjLib.setPropertyLong(this.xComponentId, property, value);
  }

  private _getPropertyLong(property: string, value: string): number {
    if (!!this.ijkplayer_napi)
      return cjLib.getPropertyLong(this.xComponentId, property, value);
    else {
      return 0
    }
  }

  setVolume(leftVolume: string, rightVolume: string) {
    if (!!this.ijkplayer_napi)
      cjLib.setVolume(this.xComponentId, leftVolume, rightVolume);
  }

  setLoopCount(looping: boolean) {
    let loopCount = looping ? "0" : "1";
    this.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "loop", loopCount);
    if (!!this.ijkplayer_napi)
      cjLib.setLoopCount(this.xComponentId, loopCount);
  }

  isLooping(): boolean {
    let loopCount: number = 0
    if (!!this.ijkplayer_napi)
      loopCount = cjLib.getLoopCount(this.xComponentId);
    return loopCount != 1;
  }

  selectTrack(track: string) {
    if (!!this.ijkplayer_napi)
      this._setStreamSelected(track, "true");
  }

  deselectTrack(track: string) {
    this._setStreamSelected(track, "false");
  }

  private _setStreamSelected(stream: string, select: string) {
    if (!!this.ijkplayer_napi)
      cjLib.setStreamSelected(this.xComponentId, stream, select);
  }

  getVideoDecoder(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_VIDEO_DECODER, PropertiesType.FFP_PROPV_DECODER_UNKNOWN);
  }

  getVideoOutputFramesPerSecond(): number {
    return this._getPropertyFloat(PropertiesType.PROP_FLOAT_VIDEO_OUTPUT_FRAMES_PER_SECOND, "0");
  }

  getVideoDecodeFramesPerSecond(): number {
    return this._getPropertyFloat(PropertiesType.PROP_FLOAT_VIDEO_DECODE_FRAMES_PER_SECOND, "0");
  }

  getVideoCachedDuration(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_DURATION, "0");
  }

  getAudioCachedDuration(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_DURATION, "0");
  }

  getVideoCachedBytes(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_BYTES, "0");
  }

  getAudioCachedBytes(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_BYTES, "0");
  }

  getVideoCachedPackets(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_VIDEO_CACHED_PACKETS, "0");
  }

  getAudioCachedPackets(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_AUDIO_CACHED_PACKETS, "0");
  }

  getAsyncStatisticBufBackwards(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_BACKWARDS, "0");
  }

  getAsyncStatisticBufForwards(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_FORWARDS, "0");
  }

  getAsyncStatisticBufCapacity(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_ASYNC_STATISTIC_BUF_CAPACITY, "0");
  }

  getTrafficStatisticByteCount(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_TRAFFIC_STATISTIC_BYTE_COUNT, "0");
  }

  getCacheStatisticPhysicalPos(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_PHYSICAL_POS, "0");
  }

  getCacheStatisticFileForwards(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_FILE_FORWARDS, "0");
  }

  getCacheStatisticFilePos(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_FILE_POS, "0");
  }

  getCacheStatisticCountBytes(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_CACHE_STATISTIC_COUNT_BYTES, "0");
  }

  getFileSize(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_LOGICAL_FILE_SIZE, "0");
  }

  getBitRate(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_BIT_RATE, "0");
  }

  getTcpSpeed(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_TCP_SPEED, "0");
  }

  getSeekLoadDuration(): number {
    return this._getPropertyLong(PropertiesType.FFP_PROP_INT64_LATEST_SEEK_LOAD_DURATION, "0");
  }

  getDropFrameRate(): number {
    return this._getPropertyFloat(PropertiesType.FFP_PROP_FLOAT_DROP_FRAME_RATE, "0");
  }

  setCacheShare(share: string) {
    this._setPropertyLong(PropertiesType.FFP_PROP_INT64_SHARE_CACHE_DATA, share);
  }

  private _getVideoCodecInfo(): string {
    if (!!this.ijkplayer_napi)
      return cjLib.getVideoCodecInfo(this.xComponentId);
    else {
      return ''
    }
  }

  private _getAudioCodecInfo(): string {
    if (!!this.ijkplayer_napi)
      return cjLib.getAudioCodecInfo(this.xComponentId);
    else {
      return ''
    }
  }

  private _getMediaMeta(): string {
    if (!!this.ijkplayer_napi)
      return cjLib.getMediaMeta(this.xComponentId);
    else {
      return ''
    }
  }

  getMediaInfo(): object {
    interface mediaInfoType {
      audioDecoder: string
      videoDecoder: string
      meta: string
    }

    let mAudioDecoder = this._getAudioCodecInfo();
    let mVideoDecoder = this._getVideoCodecInfo();
    let mMeta = this._getMediaMeta();
    let mediaInfo: mediaInfoType = { audioDecoder: mAudioDecoder, videoDecoder: mVideoDecoder, meta: mMeta };
    return mediaInfo;
  }

  native_setup() {
    if (!!this.ijkplayer_napi)
      cjLib.native_setup(this.xComponentId);
  }
}

