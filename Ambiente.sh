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

# Verificando se o docker compose está instalado
docker-compose version
if [ $? -eq 0 ]
    then
        echo "Docker Compose está instalado"
    else
        echo "Docker Compose não está instalado"
        echo "Gostaria de instalar? s/n"
        read get
    if [ "$get" == "s" ]
        then
            sudo apt update && sudo apt upgrade –y
            sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
    fi
fi

# Clonando banco de dados
git clone https://github.com/Insight-Trip/MySQL.git
rm ./MySQL/README.md

sudo docker-compose up

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
"  > .env
