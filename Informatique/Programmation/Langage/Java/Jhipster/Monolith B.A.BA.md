
```bash
# Génération du projet
mkdir monolith
cd monolith
jhipster# Répondre aux questions
npm install# A cause de l'erreur rimraf

# Import du JDL
jhipster jdl ../meta-plants/JDLs/monolith.jdl

# Lancer le registre
./Development/sources/jhipster-registry/mvnw

# Créer l'utilisateur et la basesudo -i -u postgres
psql
CREATE USER monolith;
ALTER ROLE monolith WITH createdb;
ALTER ROLE monolith WITH PASSWORD 'monolith';
CREATE DATABASE monolith;

# Renseigner datasource.password dans application-dev.yml

# Exécution du projet
./mvnw
```


# Erreur rencontrées
## Erreur 1
`Could not locate PropertySource: I/O error on GET request for "http://localhost:8761/config/monolith/dev/main": Connexion refusée (Connection refused); nested exception is java.net.ConnectException: Connexion refusée (Connection refused)`
lancer le registre

## Erreur 2
`org.postgresql.util.PSQLException: The server requested password-based authentication, but no password was provided by plugin null`

Dans application-dev.yml, il faut renseigner le champ datasource.password

