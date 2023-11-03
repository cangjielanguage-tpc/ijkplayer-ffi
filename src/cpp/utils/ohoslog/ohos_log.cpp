/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "ohos_log.h"
#include <stdio.h>
#include <stdarg.h>

bool OHOS_LOG_ON = false;//log开关、默认关
void __ohos_log_print(enum ijkplayerLogLevel level, const char* tag, const char* fmt, ...)
{
    if (!OHOS_LOG_ON) {
        return;
    }
    char buf[OHOS_LOG_BUF_SIZE] = { 0 };
    va_list arg;
    va_start(arg, fmt);
    vsnprintf(buf, OHOS_LOG_BUF_SIZE, fmt, arg);

    switch(level) {
        case IL_INFO:
            sprintf(NULL, "%s %s", tag, buf);
            break;
        case IL_DEBUG:
            sprintf(NULL, "%s %s", tag, buf);
             break;
        case IL_WARN:
            sprintf(NULL, "%s %s", tag, buf);
             break;
        case IL_ERROR:
            sprintf(NULL, "%s %s", tag, buf);
            break;
        case IL_FATAL:
            sprintf(NULL, "%s %s", tag, buf);
             break;
        default:
            sprintf(NULL, "%s %s", tag, buf);
             break;
    }
    va_end(arg);
}

void __ohos_log_print_debug(enum ijkplayerLogLevel level, const char* tag, const char* file, int line, const char* fmt, ...)
{
    if (!OHOS_LOG_ON) {
        return;
    }
    char buf[OHOS_LOG_BUF_SIZE] = { 0 };
    va_list arg;
    va_start(arg, fmt);
    vsnprintf(buf, OHOS_LOG_BUF_SIZE, fmt, arg);

    switch(level) {
        case IL_INFO:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
            break;
        case IL_DEBUG:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
             break;
        case IL_WARN:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
             break;
        case IL_ERROR:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
            break;
        case IL_FATAL:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
             break;
        default:
            sprintf(NULL, "%s %ss:%sd:%ss", tag, file, line, buf);
             break;
    }
    va_end(arg);
}
