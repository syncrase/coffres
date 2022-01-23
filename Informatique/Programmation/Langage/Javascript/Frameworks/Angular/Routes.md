---
aliases: route
---

[[Lazy loading]] ou [[Eager loading]]


The `forRoot()` method takes care of the _global_ injector configuration for the Router. The `forChild()` method has no injector configuration. It uses directives such as [RouterOutlet](https://angular.io/api/router/RouterOutlet) and [RouterLink](https://angular.io/api/router/RouterLink). [source](https://angular.io/guide/lazy-loading-ngmodules#forroot-and-forchild)

Chaque route permet d'accéder à une ressource.
Plusieurs moyen pour accéder à une ressource :
- Utiliser le [[Selector|sélecteur html]]
- Utiliser le [[Router outlet]]

Les routes sont définies dans un tableau dont chaque éléments suit la syntaxe suivante [doc angular](https://angular.io/api/router/Route)

```
interface Route {
  path?: string
  pathMatch?: string
  matcher?: UrlMatcher
  component?: Type<any>
  redirectTo?: string
  outlet?: string
  canActivate?: any[]
  canActivateChild?: any[]
  canDeactivate?: any[]
  canLoad?: any[]
  data?: Data
  resolve?: ResolveData
  children?: Routes
  loadChildren?: LoadChildren
  runGuardsAndResolvers?: RunGuardsAndResolvers
}
```

Description des champs :
- **path** : (Incompatible avec un matcher) Path to  match
- **pathMatch** : (Incompatible avec un matcher) Deux valeurs possibles:
	-  'prefix' (by default)
	-  or 'full'
- **matcher** : voir [UrlMatcher](https://angular.io/api/router/UrlMatcher)
- **component** : Composant à instancier quand le path match
- **redirectTo** : redirection quand le math match
- **outlet** : nom du router outlet où le composant doit être placé
- **canActivate** : tableau de jetins d'injection de dépendance qui recherche les [CanActivate](https://angular.io/api/router/CanActivate)(). Détermine si l'utilisateur est autorisé à activer la route
- **canActivateChild** : tableau de jetins d'injection de dépendance qui recherche les [CanActivateChild](https://angular.io/api/router/CanActivateChild)(). Détermine si l'utilisateur est autorisé à activer la route d'un child
- **canDeactivate** : tableau de jetons d'injection de dépendance qui recherche les [CanDeactivate](https://angular.io/api/router/CanDeactivate)(). Détermine si l'utilisateur est autorisé à désactiver la route
- **canLoad** : tableau de jetons d'injection de dépendance qui recherche les [CanLoad](https://angular.io/api/router/CanLoad)(). Détermine si l'utilisateur est autorisé à charger la route
- **[data](https://angular.io/api/router/Data)** : données additionelles fourni au composant via [ActivatedRoute](https://angular.io/api/router/ActivatedRoute)
- **resolve** : map de jetons d'injection de dépendance qui recherche les data resolvers. Continue le routing quand le resolver à terminer. cf. [Resolve](https://angular.io/api/router/Resolve) et [ResolveData](https://angular.io/api/router/ResolveData)
- **children** : tableau de routes enfants imbriquées
- **loadChildren** : Objet qui spécifie les routes lazy-loadé cf [LoadChildren](https://angular.io/api/router/LoadChildren)
- **runGuardsAndResolvers** : cf. [RunGuardsAndResolvers](https://angular.io/api/router/RunGuardsAndResolvers) Deux valeurs possibles :
	-  `paramsOrQueryParamsChange` (by default) : exécuté quand les paramètres de requête changent
	-  or `always` : Exécuté à chaque fois. Par défaut, seulement quand la matrtice des éléments change.


Exemple d'un composant
```
{
	path: 'ngvdom',
	component: NgvdomComponent,// S'affiche toujours
	children: [
		{
			path: 'child-a', // child route path
			component: NgvdomComponent,
		},
		{
			path: 'child-b',
			component: OrdersComponent,
		},
	],
	canLoad: [CanLoadImplService],
	canActivate: [CanActivateImplService],
	canDeactivate: [IsNotDirtyGuard]
	resolve: {
		bkluh: ResolveImplService
	},
	outlet: 'aux',
	data: { preload: true },
},
```

Exemple d'un module lazy loadé
```
{
	path: 'ngvdom',
	loadChildren: () => import('./customers/customers.module').then(m => m.CustomersModule),
},
```

TODO Child routes dans module lazy loadés ???

Le path correspont à l'url du navigateur