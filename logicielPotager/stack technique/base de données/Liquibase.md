
[mvn diff](https://docs.liquibase.com/tools-integrations/maven/commands/maven-diff.html)

[documentation](https://www.liquibase.org/)

Les commandes liquibase peuvent être lancée via le plugin maven 
`mvn liquibase:releaseLocks`
Toutes les [commandes disponibles](https://docs.liquibase.com/tools-integrations/maven/commands/home.html) dans la documentation

Utilisation dans [Jhipster]()

# Sequence "SEQUENCE_GENERATOR" not found
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

# Liquibase.exception.LockException
liquibase.exception.LockException: Could not acquire change log lock.  Currently locked by 2a01cb0085b366008ff09a5137257f96.ipv6.abo.wanadoo.fr
L'url porte sur un serveur apache2
En se connectant à la base h2 du microservice et en consultant les info de la table DATABASECHANGELOGLOCK on voit que LOCKED = TRUE
[2 solutions](https://docs.liquibase.com/concepts/basic/databasechangeloglock-table.html) :
- `liquibase releaseLocks` which runs `UPDATE DATABASECHANGELOGLOCK SET LOCKED=0`
- ou lancer la commande directement `UPDATE DATABASECHANGELOGLOCK SET LOCKED=0, LOCKGRANTED=null, LOCKEDBY=null where ID=1;`

Cela résoud le problème temporairement, le lock revient.
Il faut faire un liquibase:diff puis mvnw

# ValidationFailedException
liquibase.exception.ValidationFailedException: Validation Failed:
     1 change sets check sum
          config/liquibase/changelog/00000000000000_initial_schema.xml::00000000000000::jhipster was: 8:b5f99074a2190dfc5b55ab6a5425a676 but is now: 8:b8c27d9dc8db18b5de87cdb8c38a416b
		  
`$ ./mvnw liquibase:clearCheckSums`

# validation failed

`Liquibase could not start correctly, your database is NOT ready: Validation Failed:`
## Solution 1
`mvn liquibase:clearCheckSums`

Dans le cas où 
`Connection could not be created to jdbc:postgresql://localhost:5432/plantsMS`

cette configuration est dans le pom

## Solution 2
`UPDATE databasechangelog SET md5sum = null`