#!/bin/bash

TAG="ssh-server:latest"
NAME="ssh_server"
USERNAME="user"
PASSWORD='Pa$$w0rd123!'

echo " [+] Building docker image"
docker build -t $TAG .

echo " [+] Running container"
docker run -d --name $NAME $TAG

echo " [+] Connecting to container via SSH"
sudo apt install sshpass
IP=$(docker inspect -f "{{ .NetworkSettings.Networks.bridge.IPAddress }}" ssh_server)
sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $USERNAME@$IP 'hostname' 

echo " [+] Clean-up"
docker rm --force ssh_server
