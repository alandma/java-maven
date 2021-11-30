# Java - Maven

Criar projetos em Java com o compilador Maven.

Esse `docker-compose.yml` (que chamarei de **compose**) tem a intuito de com o **app-build** compilar um projeto java (my-app) e com o serviço **app**, executa-la.

## Criando/Adicionando o projeto
Adicione/crie seu projeto na raiz desse repositorio, ficando parecido com algo assim;

```
java-maven
├── backend-build.dev.sh
├── docker-compose.yml
├── Dockerfile.dev
├── Dockerfile.dev.build
├── my-app
└── README.md
```
No `compose` alterar o "my-app" com o nome da pasta, do seu projeto.

## Script
O script `backend-build.dev.sh` é responsavel de executar os comandos para efetuar o build no codigo (mvn install/package) dentro do container, fique a vontade para efetuar as alterações necessarias, para compilar sua app.

# Serviços

## app-build

Para efetuar o build da app execute o comando abaixo e aguarde o build finalizar.

```bash
docker-compose up --build app-build
```

_O container vai "parar" indicando no log o resultado da compilação e ao finalizar o arquivo compilado ficará disponivel no volume `deploy`._

## app

Com o build finalizado esse serviço pode ser executado e utilizará o volume `deploy` criando do passo anterior, para executar a app.

```bash
docker-compose up --build --no-deps app
```
_Altere o parametro `command` no `compose` de acordo com seu projeto._

# Remover containers

Para remover todos os containers do projeto, inclusive volumes e images, execute o comando abaixo.
```bash
docker-compose down -v --rmi local --remove-orphans
```
_Desta forma poderá executar novamente com "tudo limpo"._

#### Referências:

- https://docs.docker.com/compose/compose-file/compose-file-v3/
- https://docs.docker.com/engine/reference/builder/
- https://hub.docker.com/_/maven/
- https://maven.apache.org/ref/current/maven-embedder/cli.html
- https://hub.docker.com/_/openjdk/
- https://docs.docker.com/compose/reference/up/
- https://docs.docker.com/compose/reference/down/
