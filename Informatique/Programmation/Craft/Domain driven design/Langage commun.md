---
aliases: ubiquitous langage, UL, domain language
---

#ddd #software-development 



Règle le problème de traduction systématique.
Le language se met en place en itérant le [[Knowledge crunching]].

Les [[Modèle mental|modèles mentaux]] sont souvent tacites. Demander des exemples permet de définir les mots du language.

Définir le language uniquement sur le [[Core domain]].


Mise en application :
- Tous les termes métiers (les termes du modèle) se retrouvent dans le code (nom des packages, des classes, des méthodes et des variables)
- Il faut un dictionnaire pour définir le langage
- L'extraction d'un nuage de mots du code -> doit retourner les terme du langage
- Ne pas polluer le code avec des termes techniques 
- [[Object Calisthenics]]
	- Wrapper tous les types (héritage par délégation)
- qsd