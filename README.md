# Docker Ubuntu + ASDF + Ruby + Nodejs + Sqlite + Rails

#### [Acessar Documentação Docker](https://docs.docker.com/reference/)

### Baixar imagem Ubuntu do DockerHub (Lts)
`docker pull ubuntu:20.04`

### Criar uma imagem personalizada do Ubuntu com o ASDF

#### Criar diretorio
- Criar arquivo Dockerfile, digite `code Dockerfile` (para VS Code)

- Utilize o codigo do arquivo [Dockerfile](https://github.com/hencan/docker-rails/blob/main/Dockerfile) neste repositório.

Salve o Dockerfile

#### [Criar a imagem no Docker](https://docs.docker.com/engine/reference/commandline/build/)

`docker build -t hencan/ubuntu-image:20.04 .`
#### Nota: o ponto no final irá procurar o arquivo Dockerfile

Imagem criada!

Verifique a imagem criada
`docker images`
ou
`docker image ls`

#### [Carregando um container](https://docs.docker.com/engine/reference/commandline/run/)

`docker run -it hencan/ubuntu:20.04 --name railsbot-container /bin/bash`
#Nota: o parametro final /bin/bash permite que seja passado comandos para o container.

Pronto. Seu container esta rodando.

Verifique os containers:
`docker ps` ou  `docker container list`

#### Instalando o [asdf-vm (Version Manager)](https://asdf-vm.com/#/)

Clonando repositório ASDF

`git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0` (verifique o branch considerado LTS)

Registrando o ASDF
- `echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc`
- `echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc`

Verifique o ASDF
`asdf --version`

Adicionando [Plugin Ruby](https://asdf-vm.com/#/plugins-all)

`asdf plugin list all`
#Nota: Irá baixar a lista de plugins disponveis.

Adicionando o [Ruby](https://github.com/asdf-vm/asdf-ruby)
`asdf plugin add ruby`

Verificando a instalação do Plugin
`asdf plugin list ruby`
#Nota: Deverá aparecer o ruby.

Instalando o package Ruby 3.0.0
`asdf install ruby 3.0.0`

Durante a instalação foi informado que faltava as dependencias abaixo, favor verificar:
`apt-get install -y libssl-dev libreadline-dev zlib1g-dev`


Instalando o package Ruby
- `asdf install ruby 3.0.0`
- `asdf install ruby 2.7.2`
- `asdf install ruby 2.6.0`

Defina a versãp 3.0.0 como global
`asdf global ruby 3.0.0`

Escolha uma pasta e defina a versão 2.6.0 como local
cd "pasta_projeto"
`asdf local ruby 2.6.0`


#### Adicione o [Plugin Nodejs](https://github.com/asdf-vm/asdf-nodejs)

`asdf plugin add nodejs`

Para instalação dos pacotes é necessário importar chaves, visite [aqui](https://github.com/asdf-vm/asdf-nodejs) e execute os comandos.
- `bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'`
- `bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'`

Agora será possivel instalar os pacotes Nodejs
`asdf install nodejs 14.15.4` (esta é a atual LTS)

Defina como versão global
`asdf global nodejs 14.15.4`

#### Adicione o Plugin SQLite
`asdf plugin add sqlite`

Instalação dos pacotes sqlite
`asdf install sqlite 3.34.1` (ultima versão é a única funcionando)

Atenção: Talvez seja necessário instalar o pacote abaixo.
`apt-get install libsqlite3-dev`








