---
aliases: perceptron, neurone
---

Définition du perceptron :
Algorithme qui sert à classifer des données dans un problème de complexité linéaire en appljquant une fonction d'activation sur la somme de ses entrées multipliée par leur poids correspondant.

Il y a plusieurs notions autour du neurone : 
- neurone artificiel : ne peut pas résoudre des problèmes simples
- [[Réseau de neurones]] artiificiels
- neurone formel
- neurone en couche (ou [[Perceptron multicouche]]) appris grâce à la méthode de [[Rétropropagation du gradient]]



# Règle d'apprentissage 
Apprends automatiquement les coefficients de poids optimaux.
Le neurone est une fonction mathématique qui multiplie l'entrée par le [[coefficient]], le résultat est transmis à une fonction d'activation.
Lors de l'apprentissage supervisé, le résultat calculé est comparé avec le résultat escompté et l'erreur (le coût) est rétropropagées pour ajuster les coefficients. Autrement dit, une fraction du coût est appliqué sur les entrées
Plus la marge d'erreur, ou coût,  est proche de 0, plus le modèle est précis

# Deux types de perceptron
## A couche unique
Peut apprendre uniquement des fonctions linéaires séparables
## multicouche
Perceptron multicouche
