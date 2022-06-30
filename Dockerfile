FROM ubuntu:latest

LABEL name="SSH Server Linux Container"
LABEL description="This container is a Linux container designed to run a SSH server."
LABEL maintainer="Peco602 <giovanni1.pecoraro@protonmail.com>"

RUN apt update && \
    apt install openssh-server sudo -y && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 user && \ 
    usermod -aG sudo user && \
    service ssh start && \
    echo 'user:Pa$$w0rd123!' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]