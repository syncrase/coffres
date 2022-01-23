[Les idées fallacieuses](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing)

A la différence du monolith, les composants ne s'appelent pas par des méthodes dans un seul processus (fortement couplé) mais via des communication réseau asynchrone dans un [environnement distribué](https://fr.wikipedia.org/wiki/Architecture_distribu%C3%A9e) (plusieurs processus, voire plusieurs hôtes).

# Des terminaisons intelligentes et des canaux stupide
C'est un principe de conception qui favorise les mécanismes de communications simples, testé dans la durée et asynchrone aux dépends d'une platforme d'intégration complexe

[ref](https://simplicable.com/new/smart-endpoints-and-dumb-pipes)

# Types de communication

Le premier axe définit si le protocole est synchrone ou asynchrone :

-   Protocole synchrone. [[HTTP]] est un protocole synchrone. Le client envoie une requête et attend une réponse du service. Cela est indépendant de l’exécution du code client, qui peut être synchrone (le thread est bloqué) ou asynchrone (le thread n’est pas bloqué, et la réponse atteint finalement un rappel). Le point important ici est que le protocole ([[HTTP]]/[[HTTPS]]) est synchrone et que le code client peut continuer sa tâche seulement quand il reçoit la réponse du serveur [[HTTP]].
    
-   Protocole asynchrone. D’autres protocoles, comme [[AMQP]] (un protocole pris en charge par de nombreux systèmes d’exploitation et environnements cloud), utilisent des messages asynchrones. Le code client ou l’expéditeur du message n’attend généralement pas de réponse. Il envoie simplement le message comme lors de l’envoi d’un message à une file d’attente [[RabbitMQ]] ou à tout autre service [[broker de messages]].

Le deuxième axe définit si la communication a un ou plusieurs destinataires :

-   Destinataire unique. Chaque demande doit être traitée par exactement un récepteur ou un service. Le [modèle Commande](https://en.wikipedia.org/wiki/Command_pattern) est un exemple de cette communication.
    
-   Plusieurs destinataires. Chaque demande peut être traitée par zéro à plusieurs destinataires. Ce type de communication doit être asynchrone. Le mécanisme de [publication/abonnement](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) utilisé dans des modèles comme [Event-driven architecture](https://microservices.io/patterns/data/event-driven-architecture.html) en est un exemple. Il s’appuie sur une interface de bus d’événements ou un répartiteur de messages durant la propagation des mises à jour des données entre plusieurs microservices via des événements. Il est généralement implémenté via un bus de service ou un artefact similaire, par exemple [Azure Service Bus](https://azure.microsoft.com/services/service-bus/), à l’aide des [rubriques et abonnements](https://docs.microsoft.com/fr-fr/azure/service-bus-messaging/service-bus-dotnet-how-to-use-topics-subscriptions).

## L’intégration de microservices asynchrones implique l’autonomie des microservices

Le point important lors de la création d’une application basée sur des microservices est la façon dont vous intégrez vos microservices => ne pas créer de dépendances synchrones entre vos microservices.
Moins il existe de communications entre les microservices, mieux c’est. 
Quand les microservices doivent être intégrés, la règle essentielle ici est que la communication entre les microservices doit être asynchrone.

Si possible, ne dépendez jamais d’une communication synchrone (requête/réponse) entre plusieurs microservices.
Le microservice est d’être autonome et disponible pour le consommateur client, même si les autres services qui font partie de l’application de bout en bout sont indisponibles ou défectueux. Si deux microservices doivent communiquer, larchitecture n'est pas résilientes.

Si votre microservice doit déclencher une action supplémentaire dans un autre microservice, effectuez l’opération de façon asynchrone (en utilisant une messagerie asynchrone ou des événements d’intégration, des files d’attente, etc.).

Si votre microservice initial a besoin de données détenues à l’origine par d’autres microservices, ne vous fiez pas à l’utilisation de requêtes synchrones pour ces données. À la place, répliquez ou propagez ces données (seulement les attributs nécessaires) dans la base de données du service initial en utilisant une cohérence à terme (généralement à l’aide d’événements d’intégration, comme cela est expliqué dans les prochaines sections). La duplication de certaines données sur plusieurs microservices n’est pas une conception incorrecte, en revanche, lorsque vous procédez ainsi, vous pouvez convertir les données dans la langue ou les termes de ce domaine ou de ce contexte limité


Références :
- [Doc microsoft](https://docs.microsoft.com/fr-fr/dotnet/architecture/microservices/architect-microservice-container-applications/communication-in-microservice-architecture)