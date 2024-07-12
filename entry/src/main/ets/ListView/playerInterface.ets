/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

import { PlayerListener } from './PlayerListener';
import { VideoSource } from './VideoSource';

export interface PlayerInterface {
  init(): void;

  setVideoSource(video: VideoSource): PlayerInterface;

  setContext(context: object): PlayerInterface;

  play(): void;

  pause(): void;

  stop(): void;

  seekTo(position: number): void;

  release(): void;

  setListener(listener: PlayerListener): PlayerInterface;

  getDuration(): number;

  getCurrentPosition(): number;

  isPlaying(): boolean;
}