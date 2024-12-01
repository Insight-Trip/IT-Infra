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
            sudo apt update && sudo apt upgrade -y
            sudo apt install docker.io -y
    fi
fi

echo "
NOME_BUCKET=\"bucket-insight-trip\"
DB_HOST="it-app-db-1"
DB_PORT=3306
DB_NAME=\"InsightTrip\"
DB_USER=\"root\"
DB_PASSWORD=123
"  > Java/.env

# Clonando repositório do banco
git clone https://github.com/Insight-Trip/MySQL.git
mv MySQL Banco

#  Criando imagens personalizadas do mysql e da aplicação node e rodando-as
sudo docker build -t minha-imagem-banco -f ./Banco/Dockerfile .
sudo docker build -t minha-imagem-site -f ./Site/Dockerfile .
sudo docker build -t minha-imagem-java -f ./Java/Dockerfile .

sudo docker run --name meu-banco -d -p 3306:3306 -e 'MYSQL_ROOT_PASSWORD=123' minha-imagem-banco
sudo docker run --name meu-site -d -p 3333:3333 minha-imagem-site
sudo docker run --name meu-java -d minha-imagem-java