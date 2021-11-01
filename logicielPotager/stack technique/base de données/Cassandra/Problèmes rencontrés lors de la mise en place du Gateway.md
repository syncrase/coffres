
# Mise en place du Gateway (Tâtonnements)
Génération de l'application gateway avec les informations suivantes :
- Sécurité : JWT ([OAuth n'est pas encore compatible avec Cassandra](https://www.jhipster.tech/using-cassandra/))
- BDD : Cassandra


## Problème de génération du gateway jhipster à cause de la version de npm 
message = "Fix the upstream dependency conflict"

=> installer la version LTS de NPM [[NPM#Désintallation installation de NPM]]


## Maven BUILD FAILURE
Il faut installer [[Cassandra#Installation]]

## Maven BUILD FAILURE 
message ="Keyspace 'gestionpotagergateway' does not exist"

Il faut créer un keyspace [[Cassandra#Keyspace]]

## Application run failed 
message ="Request execution error. endpoint=DefaultEndpoint{ serviceUrl='http://admin:admin@localhost:8761/eureka/}"

Il faut lancer le registre

## Application run failed
message = "Table or materialized view user does not exist in keyspace "gestionpotagergateway""

Cette erreur signifie que la table user devrait exister.
Le script de création du keyspace ainsi que les changelog de création de toutes les table initiales sont dans "src/main/resources/config/cql/".

[Using Cassandra](https://www.jhipster.tech/using-cassandra/)

Deux solution sont possibles :
- Utiliser docker
- Configurer l'OS local

Utilisation de docker :
- Extinction de Cassandra en local `$ sudo systemctl stop cassandra`
- [[Docker#Installation de Docker]]
- [[Cassandra avec Docker#^51a9d5]] Créer un cluster contenant Cassandra ?? TODO
- Démarrer le cluster Cassandra avec docker-compose `$ sudo docker-compose -f src/main/docker/cassandra.yml up`
