
---
aliases: lazy-loading, lazy loaded, lazy loadé
---

https://www.ganatan.com/tutorials/lazy-loading-avec-angular

Une route en lazy loading utilise loadChildren à la place de component

La syntaxe utilise la méthode import intégrée au navigateur

# Pas de singleton

^900401

Dans le cas du module lazy loadé, tous les services injectés sont spécifiquement instancié => 
- Aucun service ne peut-être récupérer de la racine.
- Aucun état ne peut être partagé directement par un module lazy loadé

