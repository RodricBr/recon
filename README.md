# recon
[ ! ] gau ta com problema não executa, sem output nos arquivos .txt <br>
[V] gospider funcionando lindamente <br>
[V] findomain funcionando lindamente <br> <br>

```markdown
### Para fazer:
findomain: dentro do .txt --> URL: url -- Status Code: curl --write-out '%{http_code}' --silent --output /dev/null "$1"
                                                       curl -IL --silent example.com | grep HTTP**
Depois jogar todas as respostas em um .txt organizado e no talo, ex:

URL: site.com CODE: 200
.JS:
site.com/js
site.com/1337.js

###########################

URL: fake.com CODE: 302
.JS:
fake.com/.js
fake.com/hax.js
URL: fake.com CODE: 200
fake.com/pwned.js
fake.com/blaaah.js
```

shell script recon for bug bounty; <br>
getjs <br>
gau <br>
https://jldc.me/anubis/subdomains/$1 <br>
httpx <br>
