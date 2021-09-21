#!/usr/bin/bash

if [[ -z "$@" ]]; then
  echo -e "Uso: $0 <URL>"
else
  # Pega os .JS e joga num arquivo indicando os que estão ativos
  gau -subs $1 | grep -iE '\.js'| grep -iEv '(\.jsp|\.json)' >> js.txt ; cat js.txt | anti-burl | awk '{print $4}' | sort -u >> $1.Alive.txt

  # Listagem de subdomínios usando anubis
  curl -s https://jldc.me/anubis/subdomains/$1 | httpx -title -tech-detect -status-code >> $1.Subdomains.txt
fi
