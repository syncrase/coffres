
#ddd #software-development 

Le DDD est une stratégie de conception
Le DDD se situe à l'intersection entre l'expertise technique et fonctionnel.

Le DDD se met en place via une [[Strategic design|stratégie]] puis une [[Tactical design|tactique]]

On travaille beaucoup avec la notion d'event.

Le code du domaine ne doit pas être pollué par des notions de persistences.


## Lisibilité
Quand le DDD est bien appliqué -> il suffit de lire le code (et d'exécuter les tests) pour comprendre le domaine.


# Quand appliquer le DDD ?
- Quand l'application touche au [[Core domain]]
- Le DDD s'applique plus naturellement avec des languages haut niveau. Attention, ils amènent à faire de la sur-abstraction
- S'applique sur le [[Core domain]], sinon ne devrait pas s'appliquer, car coûte trop cher
- Microservice => DDD, sinon beaucoup de chance de se planter

Ne doit être mis partout

# Comment appliquer le DDD ?
Les [[Implémentations]] du DDD vont varier en fonction du contexte

# Réduire le couplage au détriment de la duplication

DRY  == coupling
Certains codes doivent être dupliqués car ils n'appartiennent pas au même domaine et sont appelé à évoluer différemment.
Ce qui implique de la redondance dans la donnée.
Microservice => potentiellement de la réplication mais plas de couplage.
 
 # Les limites
 Les aggregates peuvent être très gros et posent des problèmes lorsque l'on souhaite les persister.
 
 
 # Références DDD
 
 [thinkb4coding](https://thinkbeforecoding.com/category/Domain-Driven-Design)