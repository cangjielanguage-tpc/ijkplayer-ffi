/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

import { PlayerInterface } from './playerInterface';
import { PlayerListener } from './PlayerListener';
import { VideoSource } from './VideoSource';

export abstract class BasePlayer implements PlayerInterface {
  protected videoSource: VideoSource | null = null;
  protected playListener: PlayerListener | null = null;
  protected context: Context | null = null;
  protected needInit: boolean = false;

  init() {

  }

  setVideoSource(video: VideoSource): PlayerInterface {
    if (video != this.videoSource) {
      this.needInit = true;
    }
    this.videoSource = video;
    return this;
  }

  setContext(context: Context): PlayerInterface {
    if (context != this.context) {
      this.needInit = true;
    }
    this.context = context;
    return this;
  }

  play() {
  }

  pause() {
  }

  stop() {
  }

  seekTo(position: number) {
  }

  release() {
  }

  setListener(listener: PlayerListener): PlayerInterface {
    this.playListener = listener;
    return this;
  }

  getDuration(): number {
    return 0;
  }

  getCurrentPosition(): number {
    return 0;
  }

  isPlaying(): boolean {
    return false;
  }
}