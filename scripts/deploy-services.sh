#!/bin/bash
apt-get update -y
echo "Instalando Docker"
curl -fsSL https://get.docker | sh
echo "Instalando o Docker Compose"
apt-get install docker-compose -y
mkdir -p /opt/ci

#Criando docker-compose com PortainerIO, Jenkins e SonatypeNexus3
cat <<EOF >> /opt/ci/docker-compose.yml
version: "3"
networks:
  jenkins:
volumes:
  jenkins-data:
  portainer-data:
services:
  jenkins:
    image: jenkins/jenkins
    container_name: jenkins
    volumes:
      - jenkins-data:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - "8080:8080"
      - "5000:5000"
      - "50000:50000"
    networks:
      - jenkins
    restart: always  
  portainer:
    image: portainer/portainer
    container_name: portainer
    restart: always
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer-data:/data
EOF

docker-compose -f /opt/ci/docker-compose.yml up -d