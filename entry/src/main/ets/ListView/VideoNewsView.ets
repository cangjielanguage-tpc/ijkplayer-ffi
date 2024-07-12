/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

import router from '@ohos.router';
import { CommonVideoView } from './CommonVideoView';
import { VideoSource } from './VideoSource';

@Preview
@Component
export default struct VideoNewsView {
  private title: string = "";
  private radio: number =  1.77;
  private testUrl = "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8";

  build() {
    Column() {
      CommonVideoView({
        videoSource: new VideoSource(this.testUrl, '')
      }).width('100%').aspectRatio(this.radio)
        .borderRadius(10)
    }.width('100%').height('40%').padding({ 'right': 14, 'left': 14 })
  }
}