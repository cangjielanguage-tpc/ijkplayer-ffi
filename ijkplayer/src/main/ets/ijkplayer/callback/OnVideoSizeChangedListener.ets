/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */


export interface OnVideoSizeChangedListener {
  onVideoSizeChanged:(width: number, height: number, sar_num: number, sar_den: number)=>void
}