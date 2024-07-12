/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

import { IjkPlayer } from './IjkPlayer';
import { PlayerInterface } from './playerInterface';
import { PlayerListener } from './PlayerListener';
import { VideoSource } from './VideoSource';

export class VideoPlayer implements PlayerInterface {
  private static instance: VideoPlayer;
  private player: PlayerInterface;

  private constructor() {
    this.player = new IjkPlayer();
  }

  public static getInstance() {
    if (!VideoPlayer.instance) {
      VideoPlayer.instance = new VideoPlayer();
    }
    return VideoPlayer.instance;
  }

  init() {

  }

  setVideoSource(video: VideoSource): PlayerInterface {
    return this.player.setVideoSource(video);
  }

  setContext(context: object): PlayerInterface {
    return this.player.setContext(context);
  }

  play() {
    this.player.play();
  }

  pause() {
    this.player.pause();
  }

  stop() {
    this.player.stop();
  }

  seekTo(position: number) {
    this.player.seekTo(position);
  }

  release() {
    this.player.release();
  }

  setListener(listener: PlayerListener): PlayerInterface {
    return this.player.setListener(listener);
  }

  getDuration(): number {
    return this.player.getDuration();
  }

  getCurrentPosition(): number {
    return this.player.getCurrentPosition();
  }

  isPlaying(): boolean {
    return this.player.isPlaying();
  }
}