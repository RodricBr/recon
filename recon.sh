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
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  if [[ "${*: -1}" == "G" ]]; then
    check_g
    # Pega os .JS e joga num arquivo indicando os que estão ativos
    gau -subs "$1" | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> "$1"-js.txt ; cat "$1"-js.txt | anti-burl | awk '{print $4}' | sort -u >> "$1"-ativos.txt
    exit 0
  elif [ "${*: -1}" '==' "O" ]; then # *: -1 == último caractere
    check_o
    # Listagem de subdomínios usando anubis
    gospider -q -s "https://$1" | awk NF >> "$1"-spider-subs.txt
    exit 0
  elif [ "${*: -1}" '==' "F" ]; then
    check_f
    # Listagem de subdomínios usando findomain-linux
    findomain-linux --quiet --target https://"$1" >> "$1"-findomain-subs.txt
    exit 0
  fi

  #if [[ "$?" == 0 ]]; then
  #  echo "sucesso"
  #else
  #  echo "falhou"
  #fi
  exit 0
fi
