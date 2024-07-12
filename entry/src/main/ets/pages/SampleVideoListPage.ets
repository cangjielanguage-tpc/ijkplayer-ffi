/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */


import router from '@ohos.router';
import VideoNewsView from '../ListView/VideoNewsView';

@Entry
@Component
struct SampleVideoListPage {
  private performanceFuncs: Array<string> = [
    'reset',
    'setDebug',
    'native_setup',
    'setDataSource',
    'setDataSourceHeader'
  ]

  build() {

    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text("ijkplayer播放器示例")
          .fontSize(26)
          .fontColor(Color.White)
          .margin(10)
          .fontWeight(FontWeight.Bold)
      }.height(100).width('100%').backgroundColor(Color.Black)

      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text("测试地址:http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .margin(10)
            .onClick(() => {
              router.pushUrl({ url: "pages/IjkVideoPlayerPage", params: {
                videoUrl: "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"
              } });
            })
        }
      }
      Column() {
        ForEach(this.performanceFuncs, (func: string) => {
          Row() {
            Text("性能测试-"+func)
              .fontSize(20)
              .fontWeight(FontWeight.Bolder)
              .onClick(() => {
                router.pushUrl({
                  url: "pages/Performance",
                  params: {
                    videoUrl: "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8",
                    funcName: func,
                    titleName: "性能测试-"+func
                  }
                });
              })
              .width('80%')
              .height(60)
              .backgroundColor('#3366a0')
              .borderRadius(15)
              .fontSize(16)
              .padding(20)
              .textAlign(TextAlign.Start)
              .margin({ top: 10 })
          }
        })
      }
    }

  }
}