#jhipster #docker-compose

[Doc docker compose](https://docs.docker.com/compose/)
[Doc docker compose dans jhipster](https://www.jhipster.tech/docker-compose/)

# Installation et réinstallation
https://docs.docker.com/compose/install/


# Les commandes essentielles
 - `$ sudo docker-compose [-f compose_file.yml] up` : Exécuter un compose file
 - `sudo docker-compose logs -f` : afficher les logs du docker-compose en cours
 - `docker-compose -f src/main/docker/app.yml stop`


# Mise à jour des images
Contexte : j'ai deux projets différents dont les sous-projets portent les mêmes noms. Quand je lance le dernier projet, je vois le résultat du premier projet (qui ne contient pas toutes mes modifications).

## Tentative 1 :
Suppression des containers [[Docker#^97151e]]
Relance le docker-compose `sudo docker-compose up -d && sudo docker-compose logs -f`
problème de lancement du microservice et du gateway
```
Could not locate PropertySource and the fail fast property is set, failing
(...)
I/O error on GET request for "http://jhipster-registry:8761/config/gateway/prod/master": jhipster-registry; nested exception is java.net.UnknownHostException: jhipster-registry
```
Solution : dans le docker-compose.yml il faut rajouter la dépendance du registre au keycloak
```
  jhipster-registry:
    extends:
      file: jhipster-registry.yml
    depends_on:
      - keycloak
```

arrêt suppression des containers et recréation du tout
`sudo docker container stop $(sudo docker container ls -q) && sudo docker container rm $(sudo docker container ls -aq) && sudo docker-compose up`

C'est toujours l'ancien code !!!

Les containers sont issues des images donc suppression des images
```
sudo docker container stop $(sudo docker container ls -q)
sudo docker container rm $(sudo docker container ls -aq) 
sudo docker rmi $(sudo docker images -q)
```
Et suppression des volumes
Montage du docker-compose
`ERROR: The image for the service you're trying to recreate has been removed. If you continue, volume data could be lost. Consider backing up your data before continuing.`
Rebuild des images avec Jib
`sudo ./mvnw package -Pprod verify jib:dockerBuild`
Si erreur à cause du fichier /tmp/spring.log cf. [[multi-application#Problème de génération d'image]]
==> Toutes les images nécessaires sont téléchargées

# Version

Spécifier la nouvelle version dans le docker-compose.yml : version: '3.8'
Erreur à l'exécution de la commande : `sudo docker-compose up -d`

`ERROR: Version in "./docker-compose.yml" is unsupported. You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the 'services' key, or omit the 'version' key and place your service definitions at the root of the file to use version 1.
For more on the Compose file format versions, see https://docs.docker.com/compose/compose-file/
`

Solution 
```shell
// First, remove the old version:

//STEP- 1
// If installed via apt-get
sudo apt-get remove docker-compose
// If installed via curl
sudo rm /usr/local/bin/docker-compose
//If installed via pip
pip uninstall docker-compose

// STEP-2 GET LATEST VERSION
// curl + grep
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')

// FINAL_STEP Install and make it executeable
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION

// for docker-compose 3.9 
// https://docs.docker.com/compose/compose-file/compose-file-v3/#resources
```