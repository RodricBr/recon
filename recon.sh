#!/usr/bin/bash

if [[ -z "$@" ]] || [[ "$@" == "-h" ]]; then
  echo -e "Uso: $0 <URL sem http> [F] ou [O] ou [G]"
  echo -e "F  :: Findomain\nO  :: Gospider\nG  :: Gau"
else
  #if [[ -n $(command -v gau -h) ]]; then
  #    echo -e "${VERDE}Gau instalado!${FIM}"
  #    echo -e "${VERDE}Versão:${FIM} $(gau --version)"
  #    exit 0
  #else
  #    echo -e "${VERMELHO}Gau não encontrado!${FIM}"
  #    exit 1
  #fi
  echo -e "Executando comandos, aguarde por favor!\n\
  Isso pode levar alguns minutos!"
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  if [[ "${*: -1}" == "G" ]]; then
    # Pega os .JS e joga num arquivo indicando os que estão ativos
    gau -subs "$1" | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> "$1"-js.txt ; cat "$1"-js.txt | anti-burl | awk '{print $4}' | sort -u >> "$1"-ativos.txt
    exit 0
  elif [ "${*: -1}" '==' "O" ]; then # *: -1 == último caractere
    # Listagem de subdomínios usando anubis
    gospider -q -s "https://$1" | awk NF >> "$1"-spider-subs.txt
    exit 0
  elif [ "${*: -1}" '==' "F" ]; then
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

#
