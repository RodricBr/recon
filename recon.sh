#!/usr/bin/bash

msg_(){
  echo -e "Executando comandos, aguarde por favor!\n\
  Isso pode levar alguns minutos!\n"
}

check_g(){
  if [[ -n $(command -v gau) ]] || [[ -n $(command -v httpx) ]]; then
    echo -e "${VERDE}Gau e HttpX instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(gau --version)"
  else
    echo -e "${VERMELHO}Gau não encontrado!${FIM}"
  fi
}

check_o(){
  if [[ -n $(command -v gospider) ]]; then
    echo -e "${VERDE}Gospider instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(gospider --version | head -n 1)\n"
  else
    echo -e "${VERMELHO}Gospider não encontrado!${FIM}"
  fi
}

check_f(){
  if [[ -n $(command -v findomain-linux) ]]; then
    echo -e "${VERDE}Findomain instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(findomain-linux --version)\n"
  else
    echo -e "${VERMELHO}Findomain não encontrado!${FIM}"
  fi
}

if [[ -z "$@" ]] || [[ "$@" == "-h" ]]; then
  echo -e "Uso: $0 <URL sem http> [F] ou [O] ou [G]"
  echo -e "F  :: Findomain\nO  :: Gospider\nG  :: Gau"
else
  RESP=$(curl --write-out '%{http_code}' --silent --output /dev/null "$1")
  ARQV=$(mkdir -p reconlogs/)
  DIR_="reconlogs/"
  if [[ ! -e $DIR_ ]]; then
    mkdir $DIR_
  elif [[ ! -d $DIR_ ]]; then
    echo "$DIR_ já existe" 1>&2
  fi
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  if [[ "${*: -1}" == "G" ]]; then
    check_g
    msg_
    # Pega os .JS e joga num arquivo indicando os que estão ativos
    #gau -subs https://"$1" | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> reconlogs/"$1"-js.txt ; cat reconlogs/"$1"-js.txt | httpx -status-code -no-colors | sort -u >> reconlogs/"$1"-ativos.txt # anti-burl | awk...
    gau -subs "$1" >> "$1"-200.txt | curl --write-out '%{http_code}' --silent --output /dev/null "!:2" | sort -u >> reconlogs/"$1"-ativos.txt
    exit 0
  elif [ "${*: -1}" '==' "O" ]; then # *: -1 == último caractere
    check_o
    msg_
    # Listagem de subdomínios usando anubis
    gospider -q -s "https://$1" | awk NF | anew >> reconlogs/"$1"-spider-subs.txt
    exit 0
  elif [ "${*: -1}" '==' "F" ]; then
    check_f
    msg_
    # Listagem de subdomínios usando findomain-linux
    findomain-linux --quiet --target https://"$1" >> reconlogs/"$1"-findomain-subs.txt | anew >> reconlogs/"$1"-findomain-subs.txt  #https://"$1" >> reconlogs/"$1"-findomain-subs.txt
    echo -e "Quantidade de URLs:" $(wc -l reconlogs/"$1"-findomain-subs.txt | awk '{print $1}' )
    exit 0
    #subfinder
  fi

  #if [[ "$?" == 0 ]]; then
  #  echo "sucesso"
  #else
  #  echo "falhou"
  #fi
  exit 0
fi
