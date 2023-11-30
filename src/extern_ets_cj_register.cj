package ijkplayer4cj

class Main {
    static init() {
        JSModule.registerFunc("nativeOpenlog", { context => 
            context.function(nativeOpenlog)
        })
        JSModule.registerFunc("setDataSource", { context => 
            context.function(setDataSource)
        })
        JSModule.registerFunc("setOption", { context => 
            context.function(setOption)
        })
        JSModule.registerFunc("setOptionLong", { context => 
            context.function(setOptionLong)
        })
        JSModule.registerFunc("prepareAsync", { context => 
            context.function(prepareAsync)
        })
        JSModule.registerFunc("start", { context => 
            context.function(start)
        })
        JSModule.registerFunc("stop", { context => 
            context.function(stop)
        })
        JSModule.registerFunc("pause", { context => 
            context.function(pause)
        })
        JSModule.registerFunc("reset", { context => 
            context.function(reset)
        })
        JSModule.registerFunc("release", { context => 
            context.function(release)
        })
        JSModule.registerFunc("seekTo", { context => 
            context.function(seekTo)
        })
        JSModule.registerFunc("isPlaying", { context => 
            context.function(isPlaying)
        })
        JSModule.registerFunc("getDuration", { context => 
            context.function(getDuration)
        })

        JSModule.registerFunc("getCurrentPosition", { context =>
            context.function(getCurrentPosition)
        })

        JSModule.registerFunc("getAudioSessionId", { context =>
            context.function(getAudioSessionId)
        })

        JSModule.registerFunc("setPropertyFloat", { context =>
            context.function(setPropertyFloat)
        })

        JSModule.registerFunc("getPropertyFloat", { context =>
            context.function(getPropertyFloat)
         })

        JSModule.registerFunc("setPropertyLong", { context =>
            context.function(setPropertyLong)
        })

        JSModule.registerFunc("getPropertyLong", { context =>
            context.function(getPropertyLong)
        })

        JSModule.registerFunc("setVolume", { context =>
            context.function(setVolume)
        })


        JSModule.registerFunc("setLoopCount", { context =>
            context.function(setLoopCount)
        })

        JSModule.registerFunc("getLoopCount", { context =>
            context.function(getLoopCount)
        })

        JSModule.registerFunc("setStreamSelected", { context =>
            context.function(setStreamSelected)
        })

        JSModule.registerFunc("getVideoCodecInfo", { context =>
            context.function(getVideoCodecInfo)
        })

        JSModule.registerFunc("getAudioCodecInfo", { context =>
            context.function(getAudioCodecInfo)
        })

        JSModule.registerFunc("getMediaMeta", { context =>
            context.function(getMediaMeta)
        })

        JSModule.registerFunc("native_setup", { context =>
            context.function(native_setup)
        })
    }
}