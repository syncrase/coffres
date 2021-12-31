Ceci est la première version de la mise en place des projets.
Jhipster permet de mettre en place tous les projets d'un seul coup grâce au JDL

# Mise en place des projets

Clonage du registre
`$ git clone https://github.com/jhipster/jhipster-registry.git jhipster-registry`
`$ ./mvnw`

Génération du gateway avec [[OAuth2]] et [[postgreSQL]]
Génération du microservice avec [[OAuth2]] et [[postgreSQL]]

Pour le OAuth2 il faut lancer le [keycloak](https://www.jhipster.tech/security/#-oauth2-and-openid-connect) depuis le gateway
`$ sudo docker-compose -f src/main/docker/keycloak.yml up`

Puis, exécuter le registre, microservice et le gateway via la commande `./mvnw`

# Création des entités avec [[JDL]]

Utilisation de [JDL Studio](https://start.jhipster.tech/jdl-studio/)



# Problèmes

## Unable to refresh token
Reproduction :
Après rechargement de la page
Problème lié à l'utilisation de OAuth2


# Chargement d'un SQL au lancement de l'application

Plutôt que d'utiliser le faker on peut [insérer des données à partir d'un SQL](https://medium.com/agency04/creating-spring-petclinic-app-with-jhipster-bd8e4366b789).
Il supprimer faker de la config (application-dev.yml), créer un fichier contenant le SQL de remplissage de la base et renseigner ce fichier dans le master.xml.
J'ai aussi supprimé le répertoire target/ et ai exécuté la commande liquibase:update.