banner = '''
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
'''

from jinja2 import Template
from core.variables import *
import sys


#get type & host
if len(sys.argv) == 1:
    type = "normal"
else:
    type = sys.argv[1]
    if len(sys.argv) == 3:
        variables['host'] = sys.argv[2]
    if type == "awsyun" and len(sys.argv) == 4:
        variables['stage'] = sys.argv[3]

# Get Cobalt Strike version from variables.py
version = variables['version']


print(banner)
print("[*] Generating Cobalt Strike " + version + " c2 profile...")

sample_name = type + "_" + get_random_string(8)
c2profile_template_file_contents = open("c2profile_template_{}.jinja".format(type),'r').read()
c2profile_template = Template(c2profile_template_file_contents)


# jinja2_variables = variables
variables['sample_name'] = sample_name

random_c2profile = c2profile_template.render(variables)
f = open("output/" + sample_name + '.profile', "a")
f.write(random_c2profile)
f.close()


print("[*] Done. Don't forget to validate with c2lint. ")
print("[*] Profile saved to output/" + sample_name + '.profile')

if type != "normal":
    c2profile_crossC2_template_file_contents = open("c2profile_template_crossC2.jinja",'r').read()
    c2profile_crossC2_template = Template(c2profile_crossC2_template_file_contents)
    crossC2 = c2profile_crossC2_template.render(variables)
    f = open("output/" + sample_name + '.c', "a")
    f.write(crossC2)
    f.close()
    print("[*] Profile saved to output/" + sample_name + '.c')



