#jhipster 

[Documentation](https://www.jhipster.tech/jdl/)

A partir d'un JDL, le ou les projets sont générés avec cette commance
`jhipster jdl my_file.jdl`

Pour générer le JDL à partir d'un projet existant 
`jhipster export-jdl my_file.jdl`

# Problème en ajoutant l'option 'filter *' 

Symptôme : Les classes <Entity_> n'existent pas.

## Tâtonnement
D'après la [documentation](https://docs.jboss.org/hibernate/orm/current/topical/html_single/metamodelgen/MetamodelGenerator.html#_eclipse), il faut configurer Eclipse : (!! NE PAS FAIRE COMME CA)

 - Ajouter le répertoire racine de l'application ![[Capture d’écran de 2021-03-03 10-01-48.png]]

- Ajouter les jars modelgenerator et jpa et (parceque JDK11) jaxb-api et jaxb-runtime ![[Capture d’écran de 2021-03-03 10-04-50.png]]

Après apply and close, les classes sont générées dans le package contenant les entités.
Un nouveau problème arrive dans les tests, des mapperImpl doivent être instanciés mais ce classes n'existent pas. Utiliser plutôt la syntaxe suivante : 
`entityMapper = Mappers.getMapper(EntityMapper.class);`


## Solution
Il faut installer le plugin 'm2e-apt' qui prend en charge automatiquement la config des java annotations processing ainsi que MapStruct Eclipse Plugin.

# Regénérer le projet

Le problème vient du fait que le modèles dans le package domain ne sont pas régénérés

1 - suppression des projets avec yo-rc, .jhipster, etc.
2 - jhipster jdl my_jdl.jdl
3 - ./mvnw -ntp -Pprod verify jib:dockerBuild dans les répertoire des projets
après avoir régénéré l'application il faut cherry pick les commit de correction

# app.yml doesn't exist

# Génération de plusieurs microservices

Quand les options microservice sont positionnées dans l'application,  `microservice <entities> with <microserviceName>`
doivent être dans le même ordre que la déclaration des applications microservices qui suivent.

# Le JDL ne fonctionne pas sur un projet existant

## 1er cas
`Error running generator app: TypeError: Cannot read properties of undefined (reading 'clientFramework')`

Supprimer les répertoires .jhipster et .yo et relancer la commande
`sudo rm -rf */.yo*`
`sudo rm -rf */.jhipster`

## 2ième cas
`ERROR! Cannot read property 'clientFramework' of undefined`

`ERROR! Error executing app --reproducible --no-force --with-entities --no-dry-run --no-whitespace --no-bail --no-install-path --no-skip-regenerate --no-skip-yo-resolve --from-jdl --no-skip-cache --no-skip-install --no-force-install --no-ask-answered --no-defaults --no-skip-git`

Les projets générés contiennent les bonnes entités dans le back mais aucun front n'est généré

Solution : Vérifier les entiés dans l'option microservice


# Existing yo-rc.json ?
Message au début de la génération du projet
`This is an existing project, using the configuration from your .yo-rc.json file to re-generate the project...`

Arrive normalement quand un .yo-rc.json existe dans le /home directory
Cette erreur est reproduite même avoir supprimer l'ensemble des yo-rc.json du système et même en lancant la génération depuis un container

# sh: 1: rimraf: not found
Il faut lancer `npm install`  dans le projet front pour régler le problème