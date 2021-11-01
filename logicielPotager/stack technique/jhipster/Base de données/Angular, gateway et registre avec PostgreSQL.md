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

## Sequence "SEQUENCE_GENERATOR" not found
Après la génération d'une entité, erreur dans le microservice lors de son utilisation dans le front
- J'ai mis des noms différents pour les occurences de "sequenceGenerator" dans une entité et dans le initial schema
- liquibase:diff
- mvnw
- A ce niveau, les entités existantes dans la base h2 (entités jusque là inexistantes)

La solution : Supprimer la base H2 (renommer les fichiers). Une mauvaise manip (laquelle?) a rendu possible ce problème.

Erreur reproduite dans le gateway `UT005023: Exception handling request to /login/oauth2/code/oidc`
- La suppression des fichiers de la base ne change rien
- Après un liquibase:diff + suppression des fichiers de base ça pass
Ligne dans les logs du liquibase:diff : `SELECT SEQUENCE_NAME FROM INFORMATION_SCHEMA.SEQUENCES WHERE SEQUENCE_SCHEMA = 'PUBLIC' AND IS_GENERATED=FALSE`
Vérification à faire : Est-ce que la séquence existe dans la base H2 ?
Si non, supprimer les ficihier de la base, modifier le changeLog initial, liquibase:diff et mvnw

## liquibase.exception.LockException
liquibase.exception.LockException: Could not acquire change log lock.  Currently locked by 2a01cb0085b366008ff09a5137257f96.ipv6.abo.wanadoo.fr
L'url porte sur un serveur apache2
En se connectant à la base h2 du microservice et en consultant les info de la table DATABASECHANGELOGLOCK on voit que LOCKED = TRUE
[2 solutions](https://docs.liquibase.com/concepts/basic/databasechangeloglock-table.html) :
- `liquibase releaseLocks` which runs `UPDATE DATABASECHANGELOGLOCK SET LOCKED=0`
- ou lancer la commande directement `UPDATE DATABASECHANGELOGLOCK SET LOCKED=0, LOCKGRANTED=null, LOCKEDBY=null where ID=1;`

Cela résoud le problème temporairement, le lock revient.
Il faut faire un liquibase:diff puis mvnw

## ValidationFailedException
liquibase.exception.ValidationFailedException: Validation Failed:
     1 change sets check sum
          config/liquibase/changelog/00000000000000_initial_schema.xml::00000000000000::jhipster was: 8:b5f99074a2190dfc5b55ab6a5425a676 but is now: 8:b8c27d9dc8db18b5de87cdb8c38a416b
		  
`$ ./mvnw liquibase:clearCheckSums`

# Chargement d'un SQL au lancement de l'application

Plutôt que d'utiliser le faker on peut [insérer des données à partir d'un SQL](https://medium.com/agency04/creating-spring-petclinic-app-with-jhipster-bd8e4366b789).
Il supprimer faker de la config (application-dev.yml), créer un fichier contenant le SQL de remplissage de la base et renseigner ce fichier dans le master.xml.
J'ai aussi supprimé le répertoire target/ et ai exécuté la commande liquibase:update.