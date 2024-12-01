read "Digite o usuário do DockerHub: " USER

sudo docker tag minha-imagem-banco $USER/it_bd:v1
sudo docker tag minha-imagem-site $USER/it_site:v1
sudo docker tag minha-imagem-java $USER/it_java:v1

sudo docker push $USER/it_bd:v1 $USER/it_site:v1 $USER/it_java:v1