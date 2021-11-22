
[Documentation](https://www.jhipster.tech/jdl/)

A partir d'un JDL, le ou les projets sont générés avec cette commance
`jhipster jdl my_file.jdl`

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
