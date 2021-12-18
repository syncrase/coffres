Mise en place d'une architecture microservice angular, spring boot & cassandra.
Pourquoi cassandra ? Parceque les [performances](https://www.datastax.com/products/compare/nosql-performance-benchmarks) sont meilleures.

Source d'inspiration : 
- [article medium](https://medium.com/developers-stacks/microservice-application-with-service-discovery-using-jhipster-8c18c99d6cc5)

# Mise en place du registre :
Il suffit de cloner le registre et de l'exécuter
`$ git clone https://github.com/jhipster/jhipster-registry.git jhipster-registry`
`$ ./mvnw`

# Mise en place du Gateway
[[Problèmes rencontrés lors de la mise en place du Gateway]]
## Pré-requis
npm LTS, docker et docker-compose sont installé

## Création du gateway
- Générer l'application gateway avec JWT, HazelCast et Cassandra : `$ jhipster`
- ~~Depuis la racine du projet gateway, démarrer le cluster Cassandra avec docker-compose (la migration des données se fait automatiquement) : `$ sudo docker-compose -f src/main/docker/cassandra.yml up` => Cassandra est lancée~~
- Dans un autre terminal, exécuter le projet gateway : `$ ./mvnw`

# Mise en place du microservice

- Générer l'application gateway avec JWT, HazelCast et Cassandra : `$ jhipster`

# Génération des entités
- Dans le répertoire du microservice, invoquer la commande `$ jhipster entity <entity>` et répondre aux questions
- Dans le répertoire du gateway, invoquer la même commande en générant l'entité depuis un microservice existant
  ``
- Démarrer le cluster Cassandra `$ sudo docker-compose -f src/main/docker/cassandra.yml up`
- Appliquer l'ajout de l'entité au container en cours d'exécution : `docker-compose -f src/main/docker/cassandra.yml up microservice-cassandra-migration`


# Problème
Pas possible de générer l'entité nouvellement créée (ni sur le microservice ni sur le gateway)
`microservice-cassandra-migration_1  | [Sun Feb 14 22:57:35 UTC 2021]: execute: /cql/changelog/20210214223824_added_entity_Plante.cql`
`microservice-cassandra-migration_1  | /cql/changelog/20210214223824_added_entity_Plante.cql:12:SyntaxException: line 8:4 mismatched input 'desc' expecting ')' (...sesoabde double,    sesoabfi double,    [desc]...)`
`microservice-cassandra-migration_1  | ERROR :
microservice-cassandra-migration_1  |         fail to apply script 20210214223824_added_entity_Plante.cql`
`microservice-cassandra-migration_1  |         stop applying database changes`
Pour lancer le gateway il faut un cassandra avec le keyspace associé et pour le docker il faut un autre cassandra. Problème : je ne peux avoir qu'un seul cassandra (je crois!! Que fait vraiment docker compose en fait ?)

# Principe de fonctionnement d'un gateway associé à un microservice
Pour l'instant je n'en sais rien, le gateway est connecté à une base et le microservice aussi, quelle différence ? Où mettre les bases ?
Pour commencer avec jhipster et docker, le mieux serai de commencer par une stack connue : une base postgreSQL, OAuth2. On verra plus tard pour Cassandra et docker!