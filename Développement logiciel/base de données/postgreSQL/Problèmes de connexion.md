
# authentification failed

`FATAL: password authentication failed for user "microservice"`

`Liquibase could not start correctly, your database is NOT ready: FATAL: password authentication failed for user "microservice"`

`Hikari - Exception during pool initialization.`
`HHH000342: Could not obtain connection to query metadata : FATAL: password authentication failed for user "microservice"`

Solution : valider les informations de connexion dans les configuration (dbname, user, password)