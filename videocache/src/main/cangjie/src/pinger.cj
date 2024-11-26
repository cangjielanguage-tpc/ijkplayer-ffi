/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package videocache

func pingCallable(pingUrl: String) {
    var pingResult: Bool = false
    let source = HttpUrlSource(pingUrl)
    try {
        //AppLog.error("testhhs 28")
        Hilog.error(0x0000,"testhhs","28")
        let expectedResponse = VideoCacheConstant.PING_RESPONSE
        //AppLog.error("testhhs 29")
        Hilog.error(0x0000,"testhhs","29")
        source.setDataListener(TempPingDataBackListener(pingResult))
        //AppLog.error("testhhs 46")
        Hilog.error(0x0000,"testhhs","46")
        source.open(0)
    } catch (e: Exception) {
        AppLog.error("Error reading ping response,reason is " + e.message)
        pingResult = false
    } finally {
        //AppLog.error("testhhs 73 close()")
        Hilog.error(0x0000,"testhhs","73 close()")
        source.close()
    }
}

public class Pinger {
    private var host: String
    private var port: UInt16

    init(host: String, port: UInt16) {
        this.host = host
        this.port = port
    }

    //要在lambda表达式里面赋值
    var pingData: Bool = false

    func ping(maxAttempts: Int64, startTimeout: Int64): Bool {

        //AppLog.error("testhhs 18")
        Hilog.error(0x0000,"testhhs","18")
        if (maxAttempts < 1) {
            throw IllegalArgumentException("Illegal Argument")
        }

        if (startTimeout <= 0) {
            throw IllegalArgumentException("Illegal Argument")
        }
        //AppLog.error("testhhs 19")
        Hilog.error(0x0000,"testhhs","19")
        var timeout = startTimeout
        var attempts = 0
        while (attempts < maxAttempts) {
            try {
                let syncCount = SyncCounter(1)
                //AppLog.error("testhhs 20")
                 Hilog.error(0x0000,"testhhs","20")
                let event: InnerEvent = InnerEvent(VideoCacheConstant.PING_EVENT_ID)
                Emitter.on(
                    event,
                    EventCallback(
                        "PING_EVENT_ID",
                        {
                            data: EventData =>
                            let dataMap: HashMap<String, EventDataType> = data.data
                            let fileEventDataType: Option<EventDataType> = dataMap.get("content")
                            if(let Some(i) <- fileEventDataType){
                                Hilog.error(0x0000,"testhhs","26")
                                match (i) {
                                    case BOOL(v3) => pingData = v3; syncCount.dec()
                                    case _ => ()
                                }
                            }else{
                                Hilog.error(0x0000,"testhhs","27")
                                pingData = false
                                syncCount.dec()
                            }
                        }
                    )
                )
                let url = getPingUrl()
                //AppLog.error("testhhs 21")
                Hilog.error(0x0000,"testhhs","21")
                //let runningTask: taskpool.Task = new taskpool.Task(pingCallable, url)
                //taskpool.execute(runningTask,taskpool.Priority.HIGH)
                spawn {
                	pingCallable(url)
                }
                //AppLog.error("testhhs 22")
                Hilog.error(0x0000,"testhhs","22")
                let closeTaskEvent: InnerEvent = InnerEvent(VideoCacheConstant.SHUT_DOWN_TASKPOOL)
                Emitter.on(
                    closeTaskEvent,
                    EventCallback(
                        "SHUT_DOWN_TASKPOOL",
                        {
                            data: EventData => try {
                                //              if (runningTask) {
                                //                taskpool.cancel(runningTask)
                                //              }
                                Emitter.off(VideoCacheConstant.PING_EVENT_ID)
                                Emitter.off(VideoCacheConstant.SHUT_DOWN_TASKPOOL)
                            } catch (e: Exception) {
                            }
                        }
                    )
                )
                syncCount.waitUntilZero(timeout:Duration.second * 6)
                //到上面为止停止
                if (pingData) {
                    //AppLog.error("testhhs 23")
                    Hilog.error(0x0000,"testhhs","23")
                    break
                }
            } catch (e: Exception) {
                AppLog.warn(
                    "Error pinging server (attempt: " + attempts.toString() + ", timeout: " + timeout.toString() + "). "
                )
                AppLog.error("Error pinging server due to unexpected error,reason is " + e.message)
            }
            attempts++
            timeout *= 2
        }
        if (pingData) {
            //AppLog.error("testhhs 24")
            Hilog.error(0x0000,"testhhs","24")
            return pingData
        } else {
            //AppLog.error("testhhs 25")
            Hilog.error(0x0000,"testhhs","25")
            let proxy = getDefaultProxies()
            let error = "Error pinging server (attempts: ${attempts}, max timeout: ${timeout / 2})"
            AppLog.error( "testhhs "+ error + ProxyCacheException(error).toString())
            return false
        }
    }

    func isPingRequest(request: String): Bool {
        return VideoCacheConstant.PING_REQUEST == request
    }

    func responseToPing(socket: TcpSocket): Unit {
        //AppLog.error("testhhs 64 responseToPing")
        Hilog.error(0x0000,"testhhs","64 responseToPing")
        socket.write("HTTP/1.1 200 OK\n\n".toArray())
        socket.write(VideoCacheConstant.PING_RESPONSE.toArray())
        //socket.write("HTTP/1.1 200 OK\r\n\r\nbody size: 6\r\n".toArray())
        return
    }

    private func getDefaultProxies(): HttpProxy {
        try {
            let result = getDefaultHttpProxy()
            return result
        } catch (e: Exception) {
            throw ProxyCacheException(e.message)
        }
    }

    private func getPingUrl(): String {
        return "http://${this.host}:${this.port}/${VideoCacheConstant.PING_REQUEST}"
    }
}
