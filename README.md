![Test](https://github.com/Peco602/ssh-linux-docker/actions/workflows/test.yml/badge.svg)

# SSH Server Linux Docker image

Run a SSH Server in a Linux container.

*Why?*

You might want to have an integration test environment to try it out.

## Build the image

```bash
docker build -t ssh-server:latest .
```

## Run the container

```bash
docker run -d --name ssh_server ssh-server:latest
```

or, if you want to expose the SSH port:

```bash
docker run -d --name ssh_server -p 2022:22 ssh-server:latest
```

## Connect to the container via SSH

```bash
IP=$(docker inspect -f "{{ .NetworkSettings.Networks.bridge.IPAddress }}" ssh_server)
ssh user@$IP
```

The container SSH password is `Pa$$w0rd123!`.

## Stop the container

```bash
docker rm --force ssh_server
```

## DockerHub

- [peco602/ssh-linux-docker](https://hub.docker.com/r/peco602/ssh-linux-docker)
