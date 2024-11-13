/**
 * Created on 2024/11/7
 */
package ijkplayer4cj

var g_global: ?JSObject = None
var g_context: ?JSContext = None
var g_thisArg: ?JSValue = None

public class XComponent <: ViewBase {
    let xComponent: JSObject
    let context: JSContext

    static init() {
        JSModule.registerModule(
            {
                ctx, export =>
                g_context = ctx
                export
            }
        )
    }

    public XComponent(xcompId: String, nodeType: String, libraryname: String) {
        AppLog.info("XComponent init")
        this.context = g_context.getOrThrow()
        let global = this.context.global
        this.xComponent = global["XComponent"].asObject(context)
        let create = xComponent["create"].asFunction(context)
        let obj = context.object()
        obj.setProperty("id", context.string(xcompId).toJSValue())
        obj.setProperty("type", context.string(nodeType).toJSValue())
        obj.setProperty("libraryname", context.string(libraryname).toJSValue())
        AppLog.info("XComponent init before call create")
        create.call(obj.toJSValue())
        AppLog.info("XComponent init after call create")
        AppLog.info("XComponent init finish")
    }

    public func onLoad(callbackFunc: () -> Unit): This {
        let onloadWrap = {
            ctx: JSContext, callinfo: JSCallInfo =>
            if (callinfo.count <= 0) {
                AppLog.info("onLoad event null")
                return ctx.undefined().toJSValue()
            }
//            let ret = callinfo[0].asObject().callMethod("_get_ijkplayer_ptr")
//            let ptr = ret.toNumber()
//            AppLog.info("ret is ${ptr}")
            //方法的空实现
            let listenerCallbackFunc = {ctx:JSContext,callinfo:JSCallInfo =>
                    AppLog.info("_setMessageListener callback")
                    return ctx.undefined().toJSValue()
                }
            let ret2 = callinfo[0].asObject().callMethod("_setMessageListener",context.function(listenerCallbackFunc).toJSValue())
            let ptr2 = ret2.toNumber()
            AppLog.info("ret2 is ${ptr2}")
            callbackFunc()
            return ctx.undefined().toJSValue()
        }
        xComponent.callMethod("onLoad", context.function(onloadWrap).toJSValue())
        this
    }
}
