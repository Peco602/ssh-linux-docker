#!/bin/bash

docker login -u peco602
docker tag ssh-server:latest peco602/ssh-linux-docker:latest
docker push peco602/ssh-linux-docker:latest