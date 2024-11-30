#!/bin/bash

sudo docker container stop meu-banco meu-site meu-java
sudo docker container rm meu-banco meu-site meu-java
sudo docker rmi minha-imagem-banco minha-imagem-site node mysql eclipse-temurin:21.0.5_11-jre-ubi9-minimal