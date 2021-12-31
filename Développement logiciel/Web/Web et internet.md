
# Web et internet
Internet (inter network) est  un réseau de réseaux public ou privé. C'est un réseau physique composé de câbles, d'antennes, etc..

Le web utilise internet pour faire circuler de l'information. Ce sont les données disponibles sur l'internet
[portail wiki de l'internet](https://fr.wikipedia.org/wiki/Portail:Internet)

# Accessibilité du web
## Indexation
Toutes les données disponibles ne sont pas forcément directement accessibles. 
D'abord le site web doit respecter certaines normes
Puis avoir été indexé (par un robot d'exploration).
Puis celui-ci doit être référencé et son contenu doit être indexé par le robot d'indexation (qui suit uniquement les hyperliens)

L'accessibilité d'un site web dépend de l'indexation de son contenu par les robots d'indexations des moteurs de recherche.
Comme les robots ne peuvent pas indexer tout le web, seulement une partie est indexée et apparaît dans les résultats de recherche. Le restant n'est pas disponible.

## Non indexation
De plus, les webmasters peuvent choisir de ne permettre l'indexation que sur une partie du site web (robot.txt), voire interdire toute indexation.

Principales raison de non indexation par Google :
- contenu non lié (sans back links)
- conteun de script
- format non indexable
- contenu trop volumineux
- contenu privé
- contenu à accès limité
- internet des objets
- contenu dynamique
- contenu sous un nom de domaine non standard
	
## Résumé de l'indexation
Ainsi nous avons donc
- Le **web indexable**
  -  Le **web indexé**, aussi nommé open web ou world wide web, web visible
  - Le **web non-indexé**, ou web opaque et aussi deep web
- Le **web non indexable**, deep web ou ressource profonde ou web invisible ou web caché ou web profond
	- web privé (robot.txt)
	- contenu hors normes
	- web propriétaire (avec authentification)
	- pages dont l'accès nécessite re remplir un formulaire (banque de données)
	- IoT (réseau des objets connectés) cf. [Shodan](https://www.shodan.io/)
	- Page générée dynamiquement
	- Nom de domaine non standard. Avec une résolution DNS non standard. Racine non enregistrée à l'[ICANN](https://www.icann.org/resources/pages/beginners-guides-2012-03-06-en) par exemple '.onion' -> dark web


# Deep web
Le deep web est formé par l'ensemble du web qui n'est pas indexé
```
deep web = web indexable non indexé + web non indexable
```
Toutes les ressources du dep web sont les ressources profondes.

Référence : 
https://ressources.labomedia.org/Deep_web_-_dark_web_-_web_profond

## Dark web
Les sites du dark web portent une racine non référencées par l'icann pour échapper à tout référencement. Ainsi l'url ne peut être résolue que par un serveur DNS spécifique.
L'exemple le plus connu est la racine .onion dont la résolution ne peut se faire que via le [[darknet]] 'Tor', permettant ainsi d'accéder à une sous partie du [[deep web]] appelée le [[dark web]]