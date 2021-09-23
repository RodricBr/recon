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
