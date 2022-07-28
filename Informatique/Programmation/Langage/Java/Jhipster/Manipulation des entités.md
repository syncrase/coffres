#jhipster 


# Les entités ne sont pas crées en BDD

Solution bourrin, 
- régénérer un projet from scratch sur la même base
- copier le folder liquibase
- et l'exécuter.

Threads à checker au cas où
https://stackoverflow.com/questions/53077597/after-creating-new-entity-in-jhipster-its-not-creating-table-in-existing-databa

sinon il y à la commande : `jhipster --force --with-entities`
https://github.com/jhipster/generator-jhipster/issues/3533
