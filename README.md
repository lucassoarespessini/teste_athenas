# Teste Athenas
> Participando do desafio em criar um programa automatizado que entre na pagina: https://developer.athenas.online/table.html, capturando os dados da tabela e retorne um json.  A tecnologia utilizada foi shell script. O código foi escrito em Shell Script está presente no arquivo ./script/script.sh. Há duas formas de executar esse script:




## Utilizando um Sistema Operacional Linux:

Executa o comando abaixo no diretório onde está o projeto baixado:

```sh
sudo bash script/script.sh
```

Logo irá gerar o arquivo ./script/output.json, onde está as informações da tabela:


## Utilizando Docker

Para esse caso tem que ter o Docker instalado. Depois de ter instalado o Docker, executa os seguintes comandos no diretório onde está o projeto baixado:

```sh
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker system prune -a
docker-compose ps
docker-compose rm -f
docker-compose down
docker-compose up --force-recreate -d
docker-compose build --no-cache
docker-compose pull
```
Pode-se ver que será printado as informações da tela em formato json.
