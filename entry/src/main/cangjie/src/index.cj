/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package entry

import ohos.ark_interop.JSModule
import ohos.ark_interop.JSContext
import ohos.ark_interop.JSCallInfo
import ohos.ark_interop.JSValue
import cj_res_entry.app

func testCJ(runtime: JSContext, callInfo: JSCallInfo): JSValue {
    let value = callInfo[0].toString(runtime)
    let result = "Hello ${value}"
    runtime.string(result).toJSValue()
}

let EXPORT_MODULE = JSModule.registerModule {
    runtime, exports => exports["testCJ"] = runtime.function(testCJ).toJSValue()
}
