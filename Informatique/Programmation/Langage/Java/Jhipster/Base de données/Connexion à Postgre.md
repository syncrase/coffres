
# Se connecter à une base de données
Dans le JDL, choisir une base de dev autre que H2 (postgre)
Au lancement de l'application, l'erreur est le suivante :
`Liquibase could not start correctly, your database is NOT ready: Le serveur a demandé une authentification par mots de passe, mais aucun mot de passe n'a été fourni.`

Plusieurs solutions :
- Héberger la base PostgreSQL en local et créer l'utilisateur `microservice` ayant accès à la base (cf. application-dev.yml)
- Exécuter le container contenant postgreSQL `$ sudo docker-compose -f microservice/src/main/docker/postgresql.yml up`


## Postgre dans un container

Erreur possible de démarrage, si d'après les logs le port est déjà en cours d'utilisation 
Vérifier quelle application exactement 
```
sudo lsof -i:5432
```
normalement postgre, il faut l'eteindre cf. [[postgreSQL#Installation de postgreSQL#Pour éteindre et allumer postgre]]

Maintenant il est possible de monter postgre dans le container

Exécuter des commandes dans le container
```
sudo docker container ps
sudo docker exec -it CONTAINER-ID bash
```

Problème pas possible d'utiliser la commande psql ni avec l'utilisateur root ni avec l'utilisateur postgres 
```
su - postgres
```


ECHEC pas de moyen trouvé pour utiliser postgre dans le container

## Postgre en local
1. si Postgre est éteint, l'allumer