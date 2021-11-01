
[doc](https://angular.io/guide/lazy-loading-ngmodules#preloading)

https://angular.io/guide/router-tutorial-toh#preloading-background-loading-of-feature-areas


Cette fonctionnalité s'active au moment de l'import de la route `forRoot()`
Fonctionne avec [[CanLoad]] [[Guard]]

Tous les modules en [[Lazy loading|lazy-loading]] sont préchargés :
- Les contructeurs du module et des routes sont invoqués 
- si aucun canLoad n'est implémenté
- ...

