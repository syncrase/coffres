
Pour générer un [[NgModule]]
```
ng generate module shared --route shared --module app.module
```

Ajoute une route en lazy loading

Les erreurs possibles :
- `Couldn't find a route declaration in /src/app/app.module.ts.`  ->  le fichier de routing est dans le même fichier que le app.module et que les routes sont bien spécifiées avec forRoot()
