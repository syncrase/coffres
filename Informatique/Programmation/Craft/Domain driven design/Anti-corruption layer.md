---
aliases:ACL
---

#ddd #software-development

Utiliser lors d'appel à des API externes, quand on n'est pas sur les mêmes domaines.

Permet d'isoler deux domaines.

Le principe est d'utiliser des interfaces (utilisant le UL) qui sont implémentées par des adapters (utilisant le language des autres domains)

Ceci est la base de l'architecture hexagonale.

Le code métier n'importe pas de classe de la [[Infrastructure layer|couche infra]]

On utilise ce pattern quand le code change souvent ou quand on s'interface avec le legacy.


Par exemple, un ORM est un ACL entre le code et la BDD.