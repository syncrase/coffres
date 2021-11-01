---
aliases: provider
---
#service #provider

[Documentation angular](https://angular.io/guide/providers)
https://medium.com/@kahlil/lazy-loading-and-global-services-in-angular-2-modulewithproviders-fa3b8cf60881

# Injecter un [[Service provider|provider]]

^82860f

- Ajouter un [[Service provider|provider]] permet de modifier le comportement d'un [[service]]
- 

Fourniture du provider dans les imports du module parent.
Noter que l'ajout d'un provider n'est possible que lorsque le module est [[Eagerly loaded]]

```
@NgModule({
	imports: [
		(...),
		ModuleWithProvider.forRoot({myParam: 'paramValue'}),
		AppRoutingModule
		],
	declarations: [AppComponent],
	bootstrap: [AppComponent]
})
export class AppModule { }
```


Dans le module qui accepte un provider.

```  
@NgModule({
	imports: [ CommonModule ],
	declarations: [ GreetingComponent ],
	exports: [ GreetingComponent ]
})
export class GreetingModule {

	constructor(@Optional() @SkipSelf() parentModule?: GreetingModule) {
		if (parentModule) {
			throw new Error(
			'GreetingModule is already loaded. Import it in the AppModule only');
		}
	}
  
	static forRoot(config: UserServiceConfig): ModuleWithProviders<GreetingModule> {
		return {
			ngModule: GreetingModule,
			providers: [{provide: MyConfigObject, useValue: customConfig }]
		};
	}
}
```

Le service qui est providé.
Quand il est injecté dans un composant, la configuration injecté dans les imports du module est utilisée dans le constructeur.
La configuration
```
export class MyConfigObject {
	somethingsConfig = '';
}
```

Le service configurable
```
let nextId = 1;

@Injectable({
	providedIn: 'root'
})
export class ConfigService {

	id = nextId++;  

	constructor(@Optional() config?: MyConfigObject) {
		if (config) { this._somethingsConfig = config.somethingsConfig; }
	}

	get somethingsConfig() {
		// Demo: add a suffix if this service has been created more than once
		const suffix = this.id > 1 ? ` times ${this.id}` : '';
		return this._somethingsConfig + suffix;
	}

	private _somethingsConfig = 'Sherlock Holmes';
}
```

Injection dans le composant, soit le service par défaut soit le service personnalisé, en fonction de comment le module à été importé

```
export class MyComponent {

	title = 'NgModules';
	somethingsConfig = '';
  
	constructor(configService: ConfigService) {
		this.somethingsConfig = configService.somethingsConfig;
	}
}
```

Et dans le template
```
<p *ngIf="user">
	<i>Welcome, {{user}}</i>
<p>
```
