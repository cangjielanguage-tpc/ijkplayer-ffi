/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

import { PlayerListener } from './PlayerListener'
import { VideoPlayer } from './VideoPlayer'
import { VideoSource } from './VideoSource'

class PlayerListenerClass implements PlayerListener{
  onPlay() {
  }

  onStop() {
  }

  onPause() {
  }

  onError() {
  }

  onUpdate(current: number, duration: number) {
  }

  onComplete() {
  }
}
@Component
export struct CommonVideoView {
  private videoSource: VideoSource | null = null;
  private pic = $r('app.media.icon');
  private xComponentContext: object | null = null;
  private player: VideoPlayer = VideoPlayer.getInstance();
  private isInit: boolean = false;
  private xComponentId = "xid" + Math.random();
  @State isPlaying: boolean = false;

  build() {
    Stack() {
      XComponent({
        id: this.xComponentId,
        type: 'surface',
        libraryname: 'ijkplayer_napi'
      })
        .onLoad((context) => {
          if(context){
            this.xComponentContext = context;
          }
        })
        .onDestroy(() => {

        })
        .width('100%')
        .height('100%')
        .onClick(() => {
          this.stop();
        })
      Image(this.pic)
        .width('100%')
        .height('100%')
        .visibility(this.isPlaying ? Visibility.None : Visibility.Visible)
        .onClick(() => {
          this.play();
        })
      Image($r('app.media.icon_replay'))
        .width(45).height(45)
        .visibility(this.isPlaying ? Visibility.None : Visibility.Visible)
        .onClick(() => {
          this.play();
        })
    }.width('100%').height('100%')
  }

  initPlayer() {
    this.player = VideoPlayer.getInstance()
    let listener = new PlayerListenerClass();
    this.player.setContext(this.xComponentContext!)
      .setVideoSource(this.videoSource!)
      .setListener(listener);
  }

  play() {
    if (!this.isInit || this.player == null) {
      this.isInit = true;
      this.initPlayer();
    }
    this.isPlaying = true;
    this.player.play();
  }

  stop() {
    if (this.player != null) {
      this.player.pause();
    }
    this.isPlaying = false;
  }
}