
#jhipster #docker-compose #microservice #jdl 

[art med](https://medium.com/jhipster/create-full-microservice-stack-using-jhipster-domain-language-under-30-minutes-ecc6e7fc3f77)

[dev](https://dzone.com/articles/build-secure-microservices-with-jhipster-docker-an)


# Générer plusieurs projets

Dans le JDL, il faut configurer plusieurs applications, comme précisé dans la [documentation](https://www.jhipster.tech/jdl/applications).

Les options renseignées correspondent à celles trouvées dans les .yo-rc.json (utile de s'inspirer de ceux générés par des projets simples).
Après l'import, il faut builder les images pour la prod :
`WARNING! Docker Compose configuration generated, but no Jib cache found
If you forgot to generate the Docker image for this application, please run:
To generate the missing Docker image(s), please run:
  ./mvnw -ntp -Pprod verify jib:dockerBuild in /home/syncrase/Development/sources/gestion-potager/allInOne2/gateway
  ./mvnw -ntp -Pprod verify jib:dockerBuild in /home/syncrase/Development/sources/gestion-potager/allInOne2/microservice`
  
Depuis le répertoire docker-compose lancer toutes les images
`sudo docker-compose up -d`
Une fois les commande lancées, accéder aux logs
`sudo docker-compose logs -f`

Pour éteindre tous les clusters 
`sudo docker stop $(sudo docker ps -a -q)`

Les différentes applications sont accessibles aux urls suivantes :


- [Application](http://localhost:8080)
- [Microservice](http://localhost:8081)
- [JHipster Registry](http://localhost:8761)
- [JHipster Console](http://localhost:5601) Kibana
- [Zipkin](http://localhost:9411)
- [Keycloak server](http://localhost:9080)
- [Keycloak auth](http://keycloak:9080/auth/)
logstash API 9600


# Problèmes
## Problème de génération d'image


et en essayant d'exécuter les commandes de Jib j'ai l'erreur suivante
`ERROR in ch.qos.logback.core.rolling.RollingFileAppender[FILE] - openFile(/tmp/spring.log,true) call failed. java.io.FileNotFoundException: /tmp/spring.log (Permission non accordée)`

Dans les logs juste au dessus de la 1ière erreur on vois l'import de base.xml qui déclare spring.log
En le supprimant on obtient l'erreur suivante
`Could not find an appender named [CONSOLE]. Did you define it below instead of above in the configuration file?`

Récupération de la config minimale depuis le [repo](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-project/spring-boot/src/main/resources/org/springframework/boot/logging/logback) de manière à implémenter un CONSOLE appender dans le logback-spring.xml

A propos de base.xml, il apparaît à deux endroits, dont la configuration logback des tests.
`grep --exclude-dir={target,node_modules} -rnw './' -e 'base.xml'`

Comme dans le fichier base.xml apparaît cette property :
`<property name="LOG_FILE" value="${LOG_FILE:-${LOG_PATH:-${LOG_TEMP:-${java.io.tmpdir:-/tmp}}/}spring.log}"/>`

Solution :
il faut initialiser l'une des variables.
Par exemple,
`<property name="LOG_TEMP" value="./logs"/>`

## Problème de lancement du tout
Après la commande de lancement de docker-compose
`docker-compose up -d`

Tout se lance comme il faut mais le gateway crache car il ne trouve pas le registre.
Qui lui-même a crashé car il n'a pas trouvé le keycloak car il n'avais pas encore fini de s'initialiser.

Solution : définir les dépendances dans `docker-compose.yml`
