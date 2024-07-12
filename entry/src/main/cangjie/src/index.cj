/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

from ohos import ark_interop.JSModule
from ohos import ark_interop.JSContext
from ohos import ark_interop.JSCallInfo
from ohos import ark_interop.JSValue
from cj_res_entry import cj_res_entry.app

func testCJ(runtime: JSContext, callInfo: JSCallInfo): JSValue {
    let value = callInfo[0].toString(runtime)
    let result = "Hello ${value}"
    runtime.string(result).toJSValue()
}

let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports => exports["testCJ"] = runtime.function(testCJ).toJSValue()
}
