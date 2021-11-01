
[Cassandra avec Docker](https://hub.docker.com/_/cassandra)

Démarrer un nouveau cluster Cassandra `$ docker run --name some-cassandra --network some-network -d cassandra:tag` [[Docker#^9da9a6]] ^51a9d5
- some-cassandra : nom du container
- tag : numéro de version
- some-network : l'un des network disponible (`$ sudo docker network ls`)
Exemple : `$ sudo docker run --name cassandraSyncrase --network bridge -d cassandra:4.0`

(
Démarrer un nouveau container à partir de l'original et y exécuter cqlsh `$ docker run -it --network bridge --rm cassandra cqlsh cassandraSyncrase`
)