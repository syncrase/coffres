# Exécution du projet via docker-compose

Pour exécuter le projet et toutes ses dépendances :
`sudo docker-compose -f app.yml up -d`

## Erreur 1 
Cette erreur signifie que l'image n'existe pas :
```
repository does not exist or may require 'docker login'
```
Utiliser jib pour créer l'image
`sudo ./mvnw package -Pprod verify jib:dockerBuild`