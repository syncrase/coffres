
Le service est injecté par l'[[Injecteur de service]]

Un service peut être lazy loaded

Souvent, le service est un singleton
```  
@Injectable({
	providedIn: 'root'
})
export class MyService {
```
Par exemple faire transiter des [[informations entre composants]]
Ce n'est pas le cas lors du [[Lazy loading#^900401]]

Lorsque le service doit être disponible uniquement lorsqu'un module à été importé (cette méthode active le [[tree shaking]] si rien ne l'injecte)
```  
@Injectable({
	providedIn: 'MyModule'
})
export class MyService {
```
Il est possible de déclarer cette contrainte dans le module
```
@NgModule({
  providers: [MyService],
})
export class MyModule {
```

Pour un nouveau service à chaque lazy loaded composant

```  
@Injectable({
	providedIn: 'any'
})
export class MyService {
```

Pour limiter l'utilisation d'un service par un Composant spécifique il faut l'ajouter dans l'annotation [[@Component]]