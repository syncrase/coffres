#jhipster #docker-compose

[Doc docker compose](https://docs.docker.com/compose/)
[Doc docker compose dans jhipster](https://www.jhipster.tech/docker-compose/)

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