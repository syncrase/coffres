---
aliases : AE, réseau diabolo, autoencoder
---

Typologie resserrée en son centre
Adapté à la réduction de dimension ([[Unsupervised learning]])
Utlisé dans de l'apprentissage supervisé, cela s'appel le [[Deep learning]]


étape péliminaire du traitement de données : [[extraction de caractéristique]]

Se décompose en deux parties :
- l'encodeur : grande dimension vers petite dimencion
- le décodeur : petite dimension vers grande dimension

On apelle la partie centrale le _code_

Apprentissage
se fait par rétropropagation du gradient. La cible est l'entrée elle-même

# Les deux types 

## under-complete
unités centrale en plus petits nombre

Apprentissage
amélioré en rajoutant des perturbations à l'entré (comme du bruit ou des transformations), ie faire de la régulation

## over-complete 
unités centrales en plus grand nombre (projection dans une plus grande dimension des SVM)

Pour éviter des couches ou l'information est iso (coadaption) l'un des neurones de la couche intermédiaire esrt déconnecté.
