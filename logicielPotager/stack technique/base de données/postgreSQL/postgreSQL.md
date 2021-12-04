

# Installation de postgreSQL
`$ sudo apt install postgresql`

Ci-dessous les info importantes des logs d'installation:
- Ajout de l'utilisateur postgres au groupe ssl-cert
- Creating config file /etc/postgresql-common/createcluster.conf with new version
- Creating new PostgreSQL cluster 12/main ...
- /usr/lib/postgresql/12/bin/initdb -D /var/lib/postgresql/12/main --auth-local peer --auth-host md5
- The files belonging to this database system will be owned by user "postgres".
- This user must also own the server process.
- Success. You can now start the database server using:
- pg_ctlcluster 12 main start
- Ver Cluster Port Status Owner    Data directory              Log file
- 12  main    5432 down   postgres /var/lib/postgresql/12/main /var/log/postgresql/postgresql-12-main.log

[Ou utiliser le .deb](https://www.postgresql.org/download/linux/ubuntu/)

## Pour éteindre et allumer postgre:
- sudo service postgresql stop
- sudo service postgresql start




# L'invite de commande PSQL
[doc ubuntu postgre](https://doc.ubuntu-fr.org/postgresql)
[Doc postgre 12](https://www.postgresql.org/docs/12/index.html)

- `$ sudo -i -u postgres` : Se connecte avec l'utilisateur postgres
- `$ psql` : connexion au serveur de base de données PostgreSQL

Exemple de commandes internes à PostgreSQL :
 - \h pour l'aide-mémoire des commandes SQL
 - \\? pour l'aide-mémoire des commandes psql
 - \\g ou point-virgule en fin d'instruction pour exécuter la requête
 - \\q pour quitter
 - \\c pour changer de base de données

## Utilisateurs
 - `postgres=# CREATE USER <nom_utilisateur>;` : Pour créer un user sans aucun droit
 - `\du` pour afficher les rôles
 - `ALTER ROLE <nom_utilisateur> WITH CREATEDB;` : Pour ajouter le droit de création de DB
 - `ALTER USER <nom_utilisateur> WITH PASSWORD '<password>';`
 - `CREATE DATABASE <db_name>`

# Commandes PostgreSQL
- `psql -l` : Liste des bases de données
- `pg_lsclusters` : Liste des clusters
- `pg_dropcluster`
- `pg_createcluster`
- `pg_ctlcluster <Cluster Version> <Cluster name> start`
- `psql <db_name>`

# Manipulation des cluster
## Arrêt d'un cluster
`pg_ctlcluster 12 main stop` propose de plutôt lancer la commande suivante `sudo systemctl stop postgresql@12-main`
(Warning: stopping the cluster using pg_ctlcluster will mark the systemd unit as failed. Consider using systemctl:)