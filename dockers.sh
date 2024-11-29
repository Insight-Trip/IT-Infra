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

# Clonando repositório do banco
git clone https://github.com/Insight-Trip/MySQL.git
mv MySQL Banco

#  Criando imagens personalizadas do mysql e da aplicação node e rodando-as
sudo docker build -t minha-imagem-banco -f ./Banco/Dockerfile .
sudo docker build -t minha-imagem-node -f ./Site/Dockerfile .

sudo docker run --name meu-banco -d -p 3306:3306 -e 'MYSQL_ROOT_PASSWORD=123' minha-imagem-banco
sudo docker run --name meu-node -d -p 3333:3333 minha-imagem-node

# Solicitando chaves de acesso
read -sp "Digite sua AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -sp "Digite sua AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
read -sp "Digite sua AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN

# Exportando as variáveis para váriaveis de sessão
export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN"

echo "
AWS_ACCESS_KEY_ID=\"$AWS_ACCESS_KEY_ID\"
AWS_SECRET_ACCESS_KEY=\"$AWS_SECRET_ACCESS_KEY\"
AWS_SESSION_TOKEN=\"$AWS_SESSION_TOKEN\"
NOME_BUCKET=\"bucket-insight-trip\"
DB_HOST="it-app-db-1"
DB_PORT=3306
DB_NAME=\"InsightTrip\"
DB_USER=\"root\"
DB_PASSWORD=123
"  > Java/.env
