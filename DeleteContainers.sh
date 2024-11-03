#!/bin/bash

sudo docker container stop meu-banco meu-node
sudo docker container rm meu-banco meu-node
sudo docker rmi minha-imagem-banco minha-imagem-node node mysql