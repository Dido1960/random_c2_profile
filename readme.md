# Random C2 Profile Generator


## 改进
- 参考https://github.com/threatexpress/random_c2_profile
- 适配云函数CDN上线，动态生成profile
- 适配linux CrossC2，自定义协议上线云函数（生成.c文件）


```
===================================================================
 ___              _              ___ ___   ___          __ _ _     
| _ \__ _ _ _  __| |___ _ __    / __|_  ) | _ \_ _ ___ / _(_) |___ 
|   / _` | ' \/ _` / _ \ '  \  | (__ / /  |  _/ '_/ _ \  _| | / -_)
|_|_\__,_|_||_\__,_\___/_|_|_|  \___/___| |_| |_| \___/_| |_|_\___|
Cobalt Strike random C2 Profile generator
Joe Vest (@joevest) - 2021
===================================================================
使用方式:
    #普通
    python3 random_c2profile.py
    #支持云函数（非linux云函数无需设置域名）
    python3 random_c2profile.py yun
    #支持腾讯云函数（linux云函数上线需要设置域名）
    python3 random_c2profile.py tenyun 域名
    #支持cdn
    python3 random_c2profile.py cdn 域名
    #支持亚马逊云函数（linux云函数上线需要设置域名）
    python3 random_c2profile.py awsyun 域名 stage名称
===================================================================

[*] Generating Cobalt Strike 4.5 c2 profile...
[*] Done. Don't forget to validate with c2lint. 
[*] Profile saved to output/normal_PDKLOIPI.profile
```
