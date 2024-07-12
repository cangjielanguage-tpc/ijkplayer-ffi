/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */


export class LogUtils {
  private  mLogOpen: boolean= false;
  private TAG: string= "ijkplayer:js";
  private static instance: LogUtils;
  private constructor() {
  };

  public static getInstance() {
    if (!LogUtils.instance) {
      LogUtils.instance = new LogUtils();
    }
    return LogUtils.instance;
  }

  setLogSwitch(logOpen: boolean) {
    this.mLogOpen = logOpen;
  }

  LOGI(info: string) {
    if (this.mLogOpen) {
      console.info(this.TAG + "-->"+ info);
    }
  }
}