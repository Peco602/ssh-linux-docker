#!/bin/bash

echo " [+] Logging into Docker Hub"
docker login -u peco602

echo " [+] Tagging image"
docker tag ssh-server:latest peco602/ssh-linux-docker:latest

echo " [+] Pushing to Docker Hub"
docker push peco602/ssh-linux-docker:latest