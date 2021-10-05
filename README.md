# recon
[V] gau funcionando lindamente <br>
[V] gospider funcionando lindamente <br>
[V] findomain funcionando lindamente <br> <br>

```markdown
### Para fazer:
findomain: dentro do .txt --> URL: url -- Status Code: curl --write-out '%{http_code}' --silent --output /dev/null "$1"
                                                       curl -IL --silent example.com | grep HTTP**
[V] Feito, deixar mais apresentável e checar se o curl pega todos os sites e retorna o status code ou apenas o argumento do $1
o código ta uma bagunça, talvez usar regex pra organizar a criação de diretórios, dar uma arrumada

###########################

Depois jogar todas as respostas em um .txt organizado e bonito, ex[ideia]:

URL: site.com
CODE: 200
.JS
  site.com/js
  site.com/1337.js

###########################

URL: fake.com
CODE: 302
.JS
  fake.com/.js
  fake.com/hax.js
URL: fake.com
CODE: 200
.JSON
  fake.com/pwned.json
  fake.com/blaaah.json
```

shell script recon for bug bounty; <br>
getjs <br>
gau <br>
https://jldc.me/anubis/subdomains/$1 <br>
httpx <br>
