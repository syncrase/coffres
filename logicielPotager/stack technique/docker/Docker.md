
#docker 

# Installation de Docker 
`$ sudo apt  install docker`
`$ sudo apt  install docker-compose`

Démarrer un nouveau cluster : `$ docker run --name some-name --network some-network -d image:tag` ^9da9a6

Démarrer un cluster existant : `$ docker start -a some-name --network some-network -d image:tag`

# Docker dans Ubuntu
## À propos du processus
`$ ls -l /var/run/ | grep docker`
`drwx------  8 root              root       180 févr. 14 15:56 docker`
`-rw-r--r--  1 root              root         4 févr. 13 23:50 docker.pid`
`srw-rw----  1 root              docker       0 févr. 13 23:49 docker.sock`

`$ ps aux | grep docker`
`root        1208  0.0  0.5 1981652 91256 ?       Ssl  févr.13   0:41 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock`

## À propos de l'installation
- `$ sudo docker info`
- `$ sudo docker version`
- `$ docker --version`

# Utilisation des objets Docker

^4715b4

[image et container](https://phoenixnap.com/kb/docker-image-vs-container)
[suppression des objects docker](https://phoenixnap.com/kb/remove-docker-images-containers-networks-volumes)
[Images vs containers](https://stackoverflow.com/questions/23735149/what-is-the-difference-between-a-docker-image-and-a-container)
[Images vs containers](https://www.whitesourcesoftware.com/free-developer-tools/blog/docker-images-vs-docker-containers/)
[Images vs containers](https://www.baeldung.com/ops/docker-images-vs-containers)


## Les réseaux
- `$ sudo docker network ls` : liste les réseaux
- `$ sudo docker network inspect <network ID>` : inspecte un réseau

## Les containers
### Lister
- `sudo docker container ps` : liste les containers en cours d'exécution
- `sudo docker ps` : liste les containers en cours d'exécution
- `sudo docker ps --all` : liste les tous les containers

### Inspecter
- `sudo docker container inspect <container ID>` : inspecte un container
- `docker container stats`
- `docker container stats $(docker container ps --format={{.Names}})`

### Arrêter
- `sudo docker container stop <container_id>`
- `sudo docker stop CONTAINER-ID`: arrêter un container
- `sudo docker stop $(sudo docker ps -a -q)` Pour arrêter tous les containers en cours d'exécution

### Supprimer

^97151e

- `$ sudo docker rm CONTAINER-ID`: suppression d'un container
- `docker container stop $(docker container ls -q) && docker container rm $(docker container ls -aq)` : pour arrêter et supprimer tous les containers
- `docker container rm $(docker container ls -aq)` : pour supprimer tous les containers arrêtés

### Commander
- `$ docker exec -it CONTAINER-ID bash` : Exécuter une commande à l'intérieur du container

## Les images
- `sudo docker image ls` : liste les images


## Les volumes
[Qu'est-ce qu'un volume](https://blog.container-solutions.com/understanding-volumes-docker)
[volumes doc](https://docs.docker.com/storage/volumes/)

- `sudo docker image ls` : liste les images
- `sudo docker volume rm $(sudo docker volume ls -q)` supprime les volumes


# Docker dans vscode
TODO utiliser l'extension vscode 'Docker Extension'