/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package videocache

public class TempPingDataBackListener <: DataBackListener {
    let expectedResponse = VideoCacheConstant.PING_RESPONSE
    var pingResult: Bool

    init(pingResult: Bool) {
        this.pingResult = pingResult
    }

    public override func onDataEnd() {
    }

    public override func onDataStart() {
    }

    public override func onDataReceive(data: Array<UInt8>) {
        //AppLog.error("testhhs 34")
        Hilog.error(0x0000,"testhhs","34")
        if (data.size > 0) {
            //AppLog.error("testhhs 30")
            Hilog.error(0x0000,"testhhs","30")
            let response: String = String.fromUtf8(data)
            //AppLog.error("testhhs 31")
            Hilog.error(0x0000,"testhhs","31")
            AppLog.info("Ping response: `" + response + "`, pinged? " + pingResult.toString())
            pingResult = expectedResponse == response
            //AppLog.error("testhhs 32")
            Hilog.error(0x0000,"testhhs","32")
            let p = HashMap<String, EventDataType>()
            p.put("content", BOOL(pingResult))
            p.put("id", INT64(Int64(VideoCacheConstant.PING_EVENT_ID)))
            let eventData: EventData = EventData(p)
            let event: InnerEvent = InnerEvent(VideoCacheConstant.PING_EVENT_ID, priority: EventPriority.IMMEDIATE)
            //AppLog.error("testhhs 33")
            Hilog.error(0x0000,"testhhs","33")
            Emitter.emit(event, data: eventData)
        }
    }

    public override func onDataProgress(progress: DataReceiveProgressInfo) {
    }
}
