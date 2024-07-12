/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

export class VideoSource {
  public videoUrl: string;
  public videoPic: string;

  constructor(url: string, pic: string) {
    this.videoUrl = url;
    this.videoPic = pic;
  }
}