#!/usr/bin/bash

if [[ -z "$@" ]]; then
  echo -e "Uso: $0 <URL sem http>"
else
  echo -e "Executando comandos, aguarde por favor!\n\
  Isso pode levar alguns minutos!"
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  gau -subs $1 | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> js.txt ; cat js.txt | anti-burl | awk '{print $4}' | sort -u >> Ativos.txt

  # Listagem de subdomínios usando anubis
  gospider -q -s "https://$1" >> Subdomains.txt
  exit 0
fi

######

import os
import sys
import traceback
import time


path = os.getenv("HOME")
#print(path)
#if not os.geteuid() == 0:
    #sys.exit("""\033[1;91m\n[!] Need to be root my friend. ¯\_(ツ)_/¯\n\033[1;m""")

exitmsg = "\nShutting Down o/\n"
 #  cmd_target = os.popen("bash -c 'finalrecon --sub
def start():
    print("[0] Processing...")
    print("ReconTracer Started!")
    print("""\033[31m
    ____                      ______                         
   / __ \___  _________  ____/_  __/________ _________  _____
  / /_/ / _ \/ ___/ __ \/ __ \/ / / ___/ __ `/ ___/ _ \/ ___/
 / _, _/  __/ /__/ /_/ / / / / / / /  / /_/ / /__/  __/ /    
/_/ |_|\___/\___/\____/_/ /_/_/ /_/   \__,_/\___/\___/_/  

    """)
    print("Made by --> Ferreira\n")
    print("Github --> https://github.com/ferreiraklet")
    print("[0] - ReconTracer is a tool that automates subdomain finding using diferents tools")
    print("type -h for help!")

def full_reconize():
    #if not
    exitmsg = "\nShutting Down o/\n"
    if len(sys.argv) <= 1:
        print(f"\nUsage: You need to pass a url {exitmsg}")
        sys.exit()

    if sys.argv[1].startswith("-h") == True:
        print("To use ReconTracer just type recontracer + domain, The files are saved in /home/user/recontracer/recontracer.txt")
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
            finalrecon_input = str(input("Please, put your finalrecon directory here without /finalrecon.py --> example: /home/finalrecon:"))
            if os.path.exists(f"{path}/Desktop/recontracerscans"):
                print("[0] - Patching up things...")
            else:
                os.popen(f"cd {path}/Desktop && mkdir recontracerscans")
            finalrecon = os.popen(f"python3 {finalrecon_input.strip()}/finalrecon.py " + sys.argv[1] + " --sub").read().replace("[32m","").replace("[33m","").replace("[36m","").replace("[32m[+]","").replace("","").replace("[+]","").replace("[+]", "")
            #finalrecon = os.popen(f"python3 {finalrecon_input}/finalrecon.py " + sys.argv[1] + " --sub").read()
            f = open(f'{path}/Desktop/recontracerscans/recon.txt','w+')
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

            assetfinder_scan()

            findomain_scan()

            subfinder_scan()


            #cat()
        except KeyboardInterrupt:
            print(exitmsg)
            sys.exit()
        except:
            print("Something went wrong! Probably a command was not found! Make sure you downloaded with go get -u! Also check if anew is working well!")
            sys.exit()
    
def assetfinder_scan():
    pathi = os.getenv("HOME")
    assetfinder = os.popen("assetfinder " + sys.argv[1]).read()
    print(assetfinder)
    with open(f'{pathi}/Desktop/recontracerscans/recon.txt','a') as f:  
        f.write(assetfinder)

def findomain_scan():
    """pathi = os.getenv("HOME")
    findomain = os.popen("findomain -t " + sys.argv[1]) + " -q".read()
    with open(r'{pathi}/Desktop/recontracerscans/recon.txt','a') as f:  
        f.write(findomain)"""
    try:
        findomain = os.popen("findomain-linux -q -t " + sys.argv[1]).read()
        with open(r'{pathi}/Desktop/recontracerscans/recon.txt','a') as f:  
            f.write(findomain)
    except:
        pathi = os.getenv("HOME")
    findomain = os.popen("findomain -t " + sys.argv[1]) + " -q".read()
    with open(r'{pathi}/Desktop/recontracerscans/recon.txt','a') as f:  
        f.write(findomain)

def subfinder_scan():
    if sys.argv[1].startswith("https://") == True:
        subfinder = os.popen("subfinder -silent -d " + sys.argv[1].replace("https://", "")).read()
        with open(f'{path}/Desktop/recontracerscans/recon.txt','a') as f:  
            f.write(subfinder)
    elif sys.argv[1].startswith("http://") == True:
        subfinder = os.popen("subfinder -silent -d " + sys.argv[1].replace("http://", "")).read()
        with open(f'{path}/Desktop/recontracerscans/recon.txt','a') as f:  
            f.write(subfinder)


def cat():
    print("[] --> Organizing things...")
    os.popen(f"cat {path}/Desktop/recontracerscans/scans.txt | anew scans.txt")

def exiting():
    print(exitmsg + " Exiting... Thank You!")

if __name__ == '__main__':
    start()
    full_reconize()

