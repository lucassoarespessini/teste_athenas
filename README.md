# Teste Athenas
> Participando do desafio em criar um programa automatizado que entre na pagina: https://developer.athenas.online/table.html, capturando os dados da tabela e retorne um json.  A tecnologia utilizada foi shell script.


O código foi escrito em Shell Script está presente no arquivo ./script/script.sh. Há duas formas de executar esse script:

## Caso Esteja Utilizando um Sistema Operacional Linux:

Executa o comando abaixo, no diretório raiz:

```sh
bash /script/script.sh
```

Logo irá gerar o arquivo ./script/output.json, onde está as informações da tabela:


## Utilizando Docker

Para esse caso tem que ter o Docker instalado. Depois de ter instalado o Docker, executa os seguintes comandos no diretório raiz:

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

_For more examples and usage, please refer to the [Wiki][wiki]._

## Development setup

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
npm test
```

## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * CHANGE: Remove `setDefaultXYZ()`
    * ADD: Add `init()`
* 0.1.1
    * FIX: Crash when calling `baz()` (Thanks @GenerousContributorName!)
* 0.1.0
    * The first proper release
    * CHANGE: Rename `foo()` to `bar()`
* 0.0.1
    * Work in progress

## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
