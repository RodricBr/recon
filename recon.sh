#!/usr/bin/bash

if [[ -z "$@" ]]; then
  echo -e "Uso: $0 <URL sem http>"
else
  echo -e "Executando comandos, aguarde por favor!\n\
  Isso pode levar alguns minutos!"
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  gau -subs $1 | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> js.txt ; cat $1.js.txt | anti-burl | awk '{print $4}' | sort -u >> $1.Ativos.txt

  # Listagem de subdomínios usando anubis
  gospider -s "https://$1" >> $1.Subdomains.txt
  exit 0
fi
################

import os
import sys
import traceback
import time


path = os.getenv("HOME")
print(path)
if not os.geteuid() == 0:
    sys.exit("""\033[1;91m\n[!] Need to be root my friend. ¯\_(ツ)_/¯\n\033[1;m""")

exitmsg = "\nShutting Down o/\n"
 #  cmd_target = os.popen("bash -c 'finalrecon --sub
def start():
    print("[0] Processing...")
    print("ReconTracer Started!")
    print("""\033[31m
    __________                         ___________                                 
\______   \ ____   ____  ____   ___\__    ___/___________    ____  ___________ 
 |       _// __ \_/ ___\/  _ \ /    \|    |  \_  __ \__  \ _/ ___\/ __ \_  __ \
 |    |   \  ___/\  \__(  <_> )   |  \    |   |  | \// __ \\  \__\  ___/|  | \/
 |____|_  /\___  >\___  >____/|___|  /____|   |__|  (____  /\___  >___  >__|   
        \/     \/     \/           \/                    \/     \/    \/   
    """)
    print("Made by --> Ferreira\n")
    print("Github --> https://github.com/ferreiraklet")
    print("[0] - ReconTracer is a tool that automates subdomain finding using diferents tools")
    print("type -h for help!")

def full_reconize():
    if sys.argv[1] == None:
        print(f"YOu need to pass a url {exitmsg}, type -h for help!")

    if sys.argv[1] == "-h":
        print("To use ReconTracer, just type recontracer + domain\n The files are saved in /home/user/recontracer/recontracer.txt")
        sys.exit()

    if sys.argv[1].endswith('/') == True:
        print("Especify without / in the end!")
        print(exitmsg)
        sys.exit()

    if sys.argv[1].startswith(("http", "https")) == False:
        sys.exit(f"Missing http or https protocol! \033[31m{exitmsg}")
    else:
        try:
            print("Starting Recon...")
            for file in os.listdir(f"{path}/desktop"):
                if file == "recontracerscans":
                    continue
                else:
                    os.mkdir("recontracerscans")
            #finalreconn = os.popen("python3 finalrecon.py " + sys.argv[1] + "--sub ").read()
            finalrecon_input = str(input("Please, put your finalrecon directory here without /finalrecon.py --> example: /home/finalrecon"))
            finalrecon = os.popen(f"python3 {finalrecon_input}/finalrecon.py " + sys.argv[1] + "--sub ").read()
            f = open(r'{path}/desktop/recontracerscans/recon.txt','w')
            f.write(finalrecon)
            f.close()
            print("First Recon Saved with sucess!")
            print("------------------------------------")
            print("[0] -> Starting Another recon!...")
            print("""__xxxxxxxxxxxxxxxx___.
                        _gxXXXXXXXXXXXXXXXXXXXXXXXX!x_
                   __x!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!x_
                ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx_
              ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!_
            _!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
          gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXs
        ,!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
       g!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
      iXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
     ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
     !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXi
  dXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   XXXXXXXXXXXXXXXXXXXf~~~VXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvvvvXXXXXXXXXXXXXX!
   !XXXXXXXXXXXXXXXf`       'XXXXXXXXXXXXXXXXXXXXXf`          '~XXXXXXXXXXP
    vXXXXXXXXXXXX!            !XXXXXXXXXXXXXXXXXX!              !XXXXXXXXX
     XXXXXXXXXXv`              'VXXXXXXXXXXXXXXX                !XXXXXXXX!
     !XXXXXXXXX.                 YXXXXXXXXXXXXX!                XXXXXXXXX
      XXXXXXXXX!                 ,XXXXXXXXXXXXXX                VXXXXXXX!
      'XXXXXXXX!                ,!XXXX ~~XXXXXXX               iXXXXXX~
       'XXXXXXXX               ,XXXXXX   XXXXXXXX!             xXXXXXX!
        !XXXXXXX!xxxxxxs______xXXXXXXX   'YXXXXXX!          ,xXXXXXXXX
         YXXXXXXXXXXXXXXXXXXXXXXXXXXX`    VXXXXXXX!s. __gxx!XXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXX!      'XXXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXXXP        'YXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXX!     i    !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXX!     XX   !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXx_   iXX_,_dXXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
           ~vXvvvvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                    'VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvv~
                      'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~
                  _    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                 -XX!  !XXXXXXX~XXXXXXXXXXXXXXXXXXXXXX~   Xxi
                  YXX  '~ XXXXX XXXXXXXXXXXXXXXXXXXX`     iXX`
                  !XX!    !XXX` XXXXXXXXXXXXXXXXXXXX      !XX
                  !XXX    '~Vf  YXXXXXXXXXXXXXP YXXX     !XXX
                  !XXX  ,_      !XXP YXXXfXXXX!  XXX     XXXV
                  !XXX !XX           'XXP 'YXX!       ,.!XXX!
                  !XXXi!XP  XX.                  ,_  !XXXXXX!
                  iXXXx X!  XX! !Xx.  ,.     xs.,XXi !XXXXXXf
                   XXXXXXXXXXXXXXXXX! _!XXx  dXXXXXXX.iXXXXXX
                   VXXXXXXXXXXXXXXXXXXXXXXXxxXXXXXXXXXXXXXXX!
                   YXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXV
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                       VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                         VXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                          ~vXXXXXXXXXXXXXXXXXXXXXXXf`
                              ~vXXXXXXXXXXXXXXXXv~
                                 '~VvXXXXXXXV~~
                                    ~~""")
            assetfinder = os.popen("assetfinder " + sys.argv[1]).read()
            with open(r'{path}/desktop/recontracerscans/recon.txt','a') as f:  
                f.write(assetfinder)
            findomain = os.popen("findomain-linux -q -t " + sys.argv[1]).read()
            with open(r'{path}/desktop/recontracerscans/recon.txt','a') as f:  
                f.write(findomain)
            subfinder = os.popen("subfinder -silent -d " + sys.argv[1]).read()
            with open(r'{path}/desktop/recontracerscans/recon.txt','a') as f:  
                f.write(subfinder)
            cat()
        except KeyboardInterrupt:
            print(exitmsg)
            sys.exit()
        except:
            print("Command not found! Make sure you downloaded with go get -u!")
            sys.exit()
def cat():
    print("[] --> Organizing things...")
    assetfinder = os.popen(f"cat {path}/desktop/recontracerscans/scans.txt | anew scans.txt")

if __name__ == '__main__':
    start()
    full_reconize()
