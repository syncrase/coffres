
#ddd #software-development 

Trad. context fermé

# Problème
Un client est représenté différemment en fonction du domaine :
- support
- facturation
- vente
- marketing
- livraison
- etc.

Un client peut être :
- un client
- un  prospect
- un contact
- un destinataire
- une cible
- un partenaire
- un visiteur
- etc.

# Solution
Parcequ'il n'est pas possible de concilier toutes ces définitions, on utilise la notion de **bounded context** : context dans lequel une définition peut être très précise.
A partir de ce bounded context, on peut définir l'[[Langage commun|ubiquitous langage]].
Il faut façonner les domaines dans lequel l'[[Langage commun|UL]] sera appliqué.

Business domain (perspective) <--> Bounded context

Pour chacun des bounded context, 
- Technologie distinctes
- Optimization des ressources
- Infrastructures distinctes
- Organisation des équipes
- la donnée n'est pas du même type (liste, graph, tree, etc.)



# Heuristique pour déterminer les bounded context

- Regarde les QPI (indicateur éco)
- Peut-on externaliser ?
- Les techno
- Faire du brainstorming pour déterminer les différents "états" que peuvent prendre une entité

Effet (cleanway?) quand il y a deux bounded context qui ne sont pas censés être.

# Context mapping

Notions de downstream (aval) et upstream (amont)
Celui qui est en haut pollue celui qui est en bas. Rien à voir avec le sens de la donnée.

Trois manière:
- code first
- contract first
- API contract


## Conformisme
L'aval s'adapte à l'upstream.

## ACL
Mais on va plutôt utiliser une [[Anti-corruption layer]]


