
- [Site officiel](https://cassandra.apache.org/)

Plusieurs commandes sont nécessaires dès le début
- [nodetool](https://cassandra.apache.org/doc/latest/tools/nodetool/nodetool.html) : pour obtenir des info sur Cassandra et effectuer des modifications de config
- [cqlsh](https://cassandra.apache.org/doc/latest/cql/index.html#cql) : ie Cassandra Query Language SHell, pour communiquer avec cassandra


# Installation
[Installation de Cassandra](https://phoenixnap.com/kb/install-cassandra-on-ubuntu)



Vérifier l’installation (affiche les clusters) `$ nodetool status`

Vérifier le status de l’installation `$ sudo systemctl status cassandra`
Vérifier le status du service Cassandra `sudo service cassandra status`. Cette commande exécute le script /etc/init.d/cassandra avec la commande status (cf. `$ man service`)
lancer le shell CQL `$ cqlsh`
`Connected to Test Cluster at 127.0.0.1:9042.
[cqlsh 5.0.1 | Cassandra 4.0 | CQL spec 3.4.5 | Native protocol v4]`




# Cassandra dans Ubuntu

Fichiers associés à Cassandra

- /etc/cassandra/cassandra.yaml : Fichier de configuration
- /bin/cassandra-stress
- /etc/init.d/cassandra : script d'accès au status

CASSANDRA_HOME=/usr/share/cassandra


  

# Les mots-clés & concepts principaux

## Cluster
Collection of nodes. This helps to made all nodes are under same page.

## Node
Nothing but a Cassandra instance running in different machines.

## Keyspace
Its a container for your data.
Un seul keyspace par node.
[Création d'un keyspace](https://docs.datastax.com/en/cql-oss/3.3/cql/cql_reference/cqlCreateKeyspace.html)
`CREATE KEYSPACE GestionPotagerGateway
  WITH REPLICATION = { 
   'class' : 'SimpleStrategy', 
   'replication_factor' : 1 
  };`
  
  Liste des keyspaces disponibles
  - `DESCRIBE keyspaces`
  - `SELECT * FROM system_schema.keyspaces;`
  

# Lectures
- [Article de Julien Dubois](https://blog.ippon.tech/using-cassandra-jhipster/)
	- Les insertions sont très peu coûteuses, souvent utile de créer des tables d'index
- [à lire, les fondements de Cassandra](https://dzone.com/articles/introduction-apache-cassandras)
- wxc