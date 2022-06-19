
#ddd #software-development #architecture

Que la partie technique ne fuite dans la partie métier.
Domaine au milieu et infra autour.

Avec DI (=> pas de mélange infra et domaine) les tests sont beaucoup plus faciles à implémenter.

Pourquoi hexagonale ? Parcequ'il a deux axes de symétrie (ça aurait pu être losange)
- test vs code prod
- 


Functional core imperative shell -> souvent utilisé quand il n'y a pas beaucoup d'interactions entre infra et métier