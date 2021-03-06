Regroupe toutes les occurences de TODO

- [x] utiliser des scripts SQL plutôt que les fakes data [[Angular, gateway et registre avec PostgreSQL#Chargement d'un SQL au lancement de l'application]]
- [x] Modifier la copie des pages d'entités pour pouvoir les utiliser plus facilement
	- [x] Affichage des noms plutôt que des ids
- [x] Utiliser docker-compose pour lancer tous les service en mode prod 
- [x] Nettoyage des projets (suppression de l'inutile)
- [x] Régler le problème dû à l'ajout de l'option filter dans le JDL
- [x] Supprimer la base H2 pour le dev et se connecter systématiquement à la base postgre (JDL)
- [x] créer un nouveau microservice pour faire du web crawling (ajout dans le JDL)
- [x] Ajouter un endpoint dans le microservice pour faire du crawling. Ne pas dupliquer les entités dans deux microservices (car les mêmes entités sont utilisées)
- [x] Modification de la base
	- [x] Dans une période, les deux mois sont obligatoires
	- [x] Génération d'une couche de service
- [x] Comment debugger le microservice [[Debugger Jhipster]]
- [x] Etudier la classification et choisir laquelle est la plus pertinente à utiliser en premier lieu. Modifier la strucuture de donnée si nécessaire. Voire créer un nouveau microservice
- [x] Extraire les données complètes et officielles de la classification
- [x] Enregistrer les données de classification en base de données
- [ ] extraire les données des pages de aujardin.info et modifier la structure de données en conséquence
	- [x] Extraire le nom latin
	- [x] rusticité
	- [ ] exposition
	- [x] floraison
	- [x] Extraire les données de la classification
- [ ] Modifier les logos
	- [ ] de chargement de l'app
	- [ ] de l'onglet
- [x] incorporer le tableau des semis
- [ ] Problème de SSH lors de la tentative d'accès aux infos du microservice depuis le registre : localhost 8761/api/ssh/public_key: 404 Not Found (reproduction ?)
- [x] ajouter tous les champs pour une plantes dans le JDL pour générer toutes les applications
- [x] Dans le back j'ai un dossier fake data, je n'en veut pas => régénérer les projets et copier mon crawler pour ne plus avoir les fake data
- [ ] accéder à postgre lorsque toutes les application sont exécutées via compose
- [ ] comment profiter du live reload quand les application sont lancées via compose ?

Etude des microservices
https://docs.microsoft.com/fr-fr/dotnet/architecture/microservices/architect-microservice-container-applications/communication-in-microservice-architecture
https://dapr.io/
https://www.redhat.com/fr/topics/microservices
https://www.redhat.com/fr/topics/microservices/what-are-microservices
https://docs.oracle.com/fr/solutions/learn-architect-microservice/index.html#GUID-BDCEFE30-C883-45D5-B2E6-325C241388A5
https://www.quantmetry.com/blog/service-mesh-architecture-microservices/
https://www.talend.com/fr/resources/guide-microservices/
https://www.lemagit.fr/conseil/Microservices-comprendre-les-modeles-de-decouverte-de-services

API first
https://swagger.io/resources/articles/adopting-an-api-first-approach/
https://www.jhipster.tech/doing-api-first-development/
https://reflectoring.io/spring-boot-openapi/

OpenAPI
https://spec.openapis.org/oas/latest.html
https://www.developpez.com/actu/178434/Comprendre-la-specification-OpenAPI-Swagger-et-apprendre-a-utiliser-Swagger-Editor-par-Hinault-Romaric/

BFF
https://nordicapis.com/building-a-backend-for-frontend-shim-for-your-microservices/
https://en.wikipedia.org/wiki/Shim_(computing)
https://tsh.io/blog/design-patterns-in-microservices-api-gateway-bff-and-more/
https://blog.bitsrc.io/bff-pattern-backend-for-frontend-an-introduction-e4fa965128bf
https://samnewman.io/patterns/architectural/bff/


HTTP Verbs
https://restcookbook.com/HTTP%20Methods/idempotency/
https://developer.mozilla.org/en-US/docs/Glossary/Safe/HTTP

Security
https://oauth.net/2/grant-types/authorization-code/
https://oauthlib.readthedocs.io/en/latest/oauth2/grants/authcode.html
