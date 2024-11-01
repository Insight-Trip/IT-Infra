#!/bin/bash

# Verificando se o docker está instalado
docker --version
if [ $? -eq 0 ]
    then
        echo "Docker está instalado"
    else
        echo "Docker não está instalado"
        echo "Gostaria de instalar? s/n"
        read get
    if [ "$get" == "s" ]
        then
            sudo apt install docker.io -y
    fi
fi

# Clonando banco de dados
mkdir MySQL
cd MySQL
git pull https://github.com/Insight-Trip/MySQL.git
rm README.md
cd ..

#  Criando imagens personalizadas do mysql e da aplicação node e rodando-as
sudo docker build -t minha-imagem-banco -f ./Docker/Dockerfile-mysql .
sudo docker run -d --name meu-banco -p 3306:3306 minha-imagem-banco

sudo docker build -t minha-imagem-node -f ./Docker/Dockerfile-node .
sudo docker run -d --name meu-node -p 3333:3333 minha-imagem-node

# Solicitando chaves de acesso
read -p "Digite sua AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -p "Digite sua AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
read -p "Digite sua AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN

# Exportando as variáveis para váriaveis de sessão
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
