#!/usr/bin/env bash

#!/usr/bin/bash

check_g(){
  if [[ -n $(command -v gau) ]]; then
    echo -e "${VERDE}Gau instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(gau --version)"
  else
    echo -e "${VERMELHO}Gau não encontrado!${FIM}"
  fi
}

check_o(){
  if [[ -n $(command -v gospider) ]]; then
    echo -e "${VERDE}Gospider instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(gospider --version | head -n 1)"
  else
    echo -e "${VERMELHO}Gospider não encontrado!${FIM}"
  fi
}

check_f(){
  if [[ -n $(command -v findomain-linux) ]]; then
    echo -e "${VERDE}Findomain instalado!${FIM}"
    echo -e "${VERDE}Versão:${FIM} $(findomain-linux --version)"
  else
    echo -e "${VERMELHO}Findomain não encontrado!${FIM}"
  fi
}

if [[ -z "$@" ]] || [[ "$@" == "-h" ]]; then
  echo -e "Uso: $0 <URL sem http> [F] ou [O] ou [G]"
  echo -e "F  :: Findomain\nO  :: Gospider\nG  :: Gau"
else
  echo -e "Executando comandos, aguarde por favor!\n\
  Isso pode levar alguns minutos!"
  ARQ=$(mkdir -p reconlogs/)
  if [ ! -d "$ARQ" ]; then
    echo "Arquivo existe"
  fi
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  if [[ "${*: -1}" == "G" ]]; then
    check_g
    gau_(){
      # Pega os .JS e joga num arquivo indicando os que estão ativos
      gau -subs "$1" | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> reconlogs/"$1"-js.txt ; cat reconlogs/"$1"-js.txt | anti-burl | awk '{print $4}' | sort -u >> reconlogs/"$1"-ativos.txt
      if [ -d "$ARQ" ]; then
        echo "Movendo logs pro reconlogs/"
      fi
    }
    gau_
    exit 0
  elif [ "${*: -1}" '==' "O" ]; then # *: -1 == último caractere
    check_o
    gospider_(){
      # Listagem de subdomínios usando anubis
      gospider -q -s "https://$1" | awk NF | anew >> reconlogs/"$1"-spider-subs.txt
      if [ -d "$ARQ" ]; then
        echo "Movendo logs pro reconlogs/"
      fi
    }
    exit 0
  elif [ "${*: -1}" '==' "F" ]; then
    check_f
    find_(){
      # Listagem de subdomínios usando findomain-linux
      findomain-linux --quiet --target http[s]?://$1 | anew >> reconlogs/"$1"-findomain-subs.txt #https://"$1" >> reconlogs/"$1"-findomain-subs.txt
      if [ -d "$ARQ" ]; then
        echo "Movendo logs pro reconlogs/"
      fi
    }
    find_
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
