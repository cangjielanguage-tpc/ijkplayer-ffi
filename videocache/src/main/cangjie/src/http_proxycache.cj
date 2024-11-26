/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package videocache

public class HttpProxyCache <: ProxyCache {
    private var NO_CACHE_BARRIER: Float64 = 0.2
    //protected var source: ?HttpUrlSource  = None
    //protected var cache: ?FileCache = None
    private var listener: ?CacheListener = None
    var receiveSize: Int64 = 0
    private var offset: Int64 = 0
    private var serverConnect: ?TcpSocket = None

    init(source: HttpUrlSource, cache: FileCache) {
        super(source, cache)
        //this.source = source
        //this.cache = cache
        this.receiveSize = 0
    }

    public override func shutdown(): Unit {
        try {
            Hilog.error(0x0000, "testhhs", "132 this.stopped = true")
            this.stopped = true
            super.shutdown()
            if (let Some(i) <- this.serverConnect) {
                i.close()
            }
        } catch (e: Exception) {
        }
        return
    }

    public func registerCacheListener(cacheListener: ?CacheListener): Unit {
        this.listener = cacheListener
    }

    public func processRequest(request: GetRequest, serverConnect: TcpSocket): Unit {
        if (let Some(i) <- this.serverConnect) {
            if (i != serverConnect) {
                i.close()
                this.serverConnect = serverConnect
            }
        }
        let responseHeaders = this.newResponseHeaders(request)
        Hilog.error(0x0000, "testhhs", "84 " + responseHeaders)
        serverConnect.write(responseHeaders.toArray())
        this.offset = request.rangeOffset
        Hilog.error(0x0000, "testhhs", "85 " + this.offset.toString())
        this.stopped = false
        if (let Some(i) <- this.cache) {
            if (let Some(j) <- this.source) {
                let available = i.available()
                Hilog.error(0x0000, "testhhs", "86 " + available.toString())
                let length = j.length()
                Hilog.error(0x0000, "testhhs", "87 " + length.toString())
                if (length > 0) {
                    let percent = Float64(Float64(available) * 100.0 / Float64(length))
                    Hilog.error(0x0000, "testhhs", "88 " + percent.toString())
                    this.onCachePercentsAvailableChanged(Int64(percent))
                }
            }
        }
        if (this.isUseCache(request)) {
            this.responseWithCache(this.offset, serverConnect)
        } else {
            this.responseWithoutCache(this.offset, serverConnect)
        }
        return
    }

    //仔细调试
    private func responseWithCache(offset: Int64, serverConnect: TcpSocket): Unit {
        //let buff = ByteArrayStream(ProxyCacheUtils.DEFAULT_BUFFER_SIZE)
        let buff = Array<UInt8>(ProxyCacheUtils.DEFAULT_BUFFER_SIZE, {i: Int64 => return 0})
        var tempoffset = offset
        while (true) {
            let readBytes = this.read(buff, tempoffset, ProxyCacheUtils.DEFAULT_BUFFER_SIZE)
            if (readBytes == -1) {
                Hilog.error(0x0000, 'testTagDownload', '本地播放发送结束了')
                Hilog.error(0x0000, "testhhs", "123 readBytes end break")
                break
            }
            try {
                let trueBuff = buff.slice(0, readBytes)
                if (this.stopped) {
                    Hilog.error(0x0000, "testhhs", "122 stopped break")
                    break
                }
                Hilog.error(0x0000, 'testTagDownload', '本地播放')
                Hilog.error(0x0000, "cccccc", trueBuff.toString()+"----")
                //Hilog.error(0x0000, 'ccccccc', "length=${readBytes}-------------------------------------------------------------------------")
                serverConnect.write(trueBuff)
            } catch (e: Exception) {
                break
            }
            tempoffset += readBytes
        }
        return
    }

    private func responseWithoutCache(offset: Int64, serverConnect: TcpSocket): Unit {
        let sourceTemp = this.source.getOrThrow {=> NoneValueException("source is null")}
        if (let Some(j) <- sourceTemp as HttpUrlSource) {
            let newSourceNoCache = HttpUrlSource(j)
            try {
                newSourceNoCache.setDataListener(TempDataBackListener(j, this, offset, serverConnect))
                newSourceNoCache.open(offset)
            } catch (e: Exception) {
                newSourceNoCache.close()
                throw e
            }
        }
    }

    private func isUseCache(request: GetRequest): Bool {
        let sourceTemp = this.source.getOrThrow {=> NoneValueException("source is null")}
        let cacheTemp = this.cache.getOrThrow {=> NoneValueException("cache is null")}
        let sourceLength = sourceTemp.length()
        Hilog.error(0x0000, "testhhs", "89 " + sourceLength.toString())
        let sourceLengthKnown = sourceLength > 0
        Hilog.error(0x0000, "testhhs", "90 " + sourceLengthKnown.toString())
        let cacheAvailable = cacheTemp.available()
        Hilog.error(0x0000, "testhhs", "91 " + cacheAvailable.toString())
        Hilog.error(0x0000, "dddddddd", (Float64(request.rangeOffset) <= Float64(cacheAvailable) +
            Float64(sourceLength) * this.NO_CACHE_BARRIER).toString())
        let result = !sourceLengthKnown || !request.partial || Float64(request.rangeOffset) <= Float64(cacheAvailable) +
            Float64(sourceLength) * this.NO_CACHE_BARRIER
        return result
    }

    private func newResponseHeaders(request: GetRequest): String {
        let sourceTemp = this.source.getOrThrow {=> NoneValueException("source is null")}
        let cacheTemp = this.cache.getOrThrow {=> NoneValueException("cache is null")}
        var mime = ""
        if (let Some(i) <- sourceTemp as HttpUrlSource) {
            mime = i.getMime()
        }
        Hilog.error(0x0000, "testhhs", "104 " + mime.toString())
        var mimeKnown = false
        if (mime.size > 0) {
            mimeKnown = true
        }
        Hilog.error(0x0000, "testhhs", "105 " + mimeKnown.toString())
        var length: Int64 = 0
        if (cacheTemp.isCompleted()) {
            length = cacheTemp.available()
        } else {
            length = sourceTemp.length()
        }
        Hilog.error(0x0000, "testhhs", "106 " + length.toString())

        let lengthKnown = length >= 0
        Hilog.error(0x0000, "testhhs", "107 " + lengthKnown.toString())
        var contentLength: Int64 = 0
        if (request.partial) {
            contentLength = length - request.rangeOffset
        } else {
            contentLength = length
        }
        Hilog.error(0x0000, "testhhs", "108 " + contentLength.toString())
        let addRange = lengthKnown && request.partial
        Hilog.error(0x0000, "testhhs", "109 " + addRange.toString())
        var lengthStr: String = ""
        if (lengthKnown) {
            lengthStr = "Content-Length: ${contentLength}${"\n"} "
        } else {
            lengthStr = ""
        }
        Hilog.error(0x0000, "testhhs", "110 " + lengthStr.toString())

        var rangeStr: String = ""
        if (addRange) {
            rangeStr = "Content-Range: bytes ${request.rangeOffset}-${length - 1}/${length}${"\n"}"
        } else {
            rangeStr = ""
        }
        Hilog.error(0x0000, "testhhs", "111 " + rangeStr.toString())

        var mimeStr: String = ""
        if (mimeKnown) {
            mimeStr = "Content-Type: ${mime}${"\n"}"
        } else {
            mimeStr = ""
        }
        Hilog.error(0x0000, "testhhs", "112 " + mimeStr.toString())
        let str1 = "HTTP/1.1 206 PARTIAL CONTENT${"\n"}${"Accept-Ranges: bytes\n"}${lengthStr}${rangeStr}${mimeStr}${"\n"}"
        let str2 = "HTTP/1.1 200 OK${"\n"}${"Accept-Ranges: bytes\n"}${lengthStr}${rangeStr}${mimeStr}${"\n"}"
        Hilog.error(0x0000, "testhhs", "111 " + str1.toString())

        if (request.partial) {
            return str1
        } else {
            return str2
        }
    }

    protected override func onCachePercentsAvailableChanged(percents: Int64): Unit {
        match ((this.listener, this.cache, this.source)) {
            case (Some(listener), Some(cache: FileCache), Some(source: HttpUrlSource)) => listener.onCacheAvailable(
                cache.trueFilePath, source.getUrl(), percents)
            case _ => ()
        }
    }
}
