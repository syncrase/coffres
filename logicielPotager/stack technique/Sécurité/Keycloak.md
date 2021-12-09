

pour activer le keycloak dans l'architecture microservice il faut mettre authenticationType = oauth2

[Documentation](https://www.keycloak.org/)
[Documentation authorization](https://www.keycloak.org/docs/4.8/authorization_services/)

[Exemple simple d'une appli Jhipster avec keycloak](https://medium.com/thinkspecial/keycloak-postgres-docker-compose-jhipster-c365331858f)



# Problème de connexion
## 1ère occurence
- pas possible de se connecter au registre
- le gateway ne trouve pas le realm. L'adresse ressemble à 
http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/auth
?response_type=code
&client_id=web_app
&scope=openid%20address%20email%20jhipster%20microprofile-jwt%20offline_access%20phone%20profile%20roles%20web-origins
&state=FDPIAY6DLeVyahlyYpjSjejoKQVxnmIQcIqlywRRO3s%3D
&redirect_uri=http://172.19.0.4:8080/login/oauth2/code/oidc&nonce=MQ5c6YWWKGiVVSVpN2LYHBAE4NIqvILAwF5m9Vd1UQ8


Test de lancement -> Lors du lancement sans docker compose -> les app bloquent au lancement de jhipster

SOLUTION : il faut ajouter la ligne `127.0.0.1 keycloak` au fichier `/etc/hosts`


 => A voir pour corriger le problème
- Lancer tous les containers séparément comme précisé dans la [doc](https://www.jhipster.tech/docker-compose/)
- Comparer les docker files des différents projets
- Exécuter un `jhipster docker-compose` sur mes 2 projets déjà existants
	- Pas de problème avec les fichiers de log
	- Même fix sur les dépendances dans le docker-compose.yml
	- Le problème de connexion au realm est le même
- Voir la [doc](https://bpmlabs.github.io/security/) de la sécurisation de Jhipster
- Tester cette [config](https://blog.codecentric.de/en/2020/05/kick-start-your-microservice-project-with-jhipster/) et voir ce que ça donne

## 2ième occurence
Tous les projet se lancent correctement avec docker-compose.
Sur le gateway, lors de la tentative d'authentification :
- page d'erreur keycloak
- les logs donnent `WARN  [org.keycloak.events] (default task-9) type=LOGIN_ERROR, realmId=jhipster, clientId=web_app, userId=null, ipAddress=172.19.0.1, error=invalid_redirect_uri, redirect_uri=http://172.19.0.4:8080/login/oauth2/code/oidc`

L'url de la page d'erreur est la suivante :
`http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/auth
?response_type=code
&client_id=web_app
&scope=openid%20address%20email%20jhipster%20microprofile-jwt%20offline_access%20phone%20profile%20roles%20web-origins
&state=FDPIAY6DLeVyahlyYpjSjejoKQVxnmIQcIqlywRRO3s%3D
&redirect_uri=http://172.19.0.4:8080/login/oauth2/code/oidc&nonce=MQ5c6YWWKGiVVSVpN2LYHBAE4NIqvILAwF5m9Vd1UQ8`

Quand on va voir du côté de la config keycloak "Clients > web_app", dans le champs "valid redirect URIs" j'ai ajouté
`http://172.19.0.4:8080/login/oauth2/code/*`

Le problème se reproduit lors de la déconnexion, l'url est la suivante : http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/logout?redirect_uri=http://172.19.0.4:8080/ et le log est le suivant  `WARN  [org.keycloak.events] (default task-27) type=LOGOUT_ERROR, realmId=jhipster, clientId=null, userId=null, ipAddress=172.19.0.1, error=invalid_redirect_uri, redirect_uri=http://172.19.0.4:8080/`
je modifie donc la ligne à 
`http://172.19.0.4:8080/*`

Problème résolu

# Impossible de se connecter au registre

Après avoir saisi les credentials admin/admin, la navigation reste bloqué sur l'url
`http://keycloak:9080/auth/realms/jhipster/login-actions/authenticate?client_id=jhipster-registry&tab_id=7ZOGQPkTYpc`