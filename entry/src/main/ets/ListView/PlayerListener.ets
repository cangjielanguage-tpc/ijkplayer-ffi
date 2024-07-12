/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

export interface PlayerListener {
  onPlay(): void;

  onStop(): void;

  onPause(): void;

  onError(): void;

  onUpdate(current: number, duration: number): void;

  onComplete(): void;
}