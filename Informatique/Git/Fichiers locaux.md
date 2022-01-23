
- Supprimer tous les changements : `git reset HEAD .`
- Supprimer tous les changements : `git checkout -- .`
- Faire revenir dans la staged area le dernier commit : `git reset --soft HEAD^`
- Faire sortir de la staged area `git restore --staged -- .`
- Supprimer les fichiers et dossiers non suivis par GIT `git clean -fd` ajouter l'argument -X pour inclure les fichiers ignorés