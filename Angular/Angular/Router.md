
---
aliases: router
---
#angular #router #route

Débugger le router 
https://blogs.infinitesquare.com/posts/web/angular-debugger-le-router-comme-un-pro

```
imports: [
	RouterModule.forRoot(routes,
	{
	enableTracing: true, // <-- debugging purposes only
	}
)]
```

Il y a deux contexte d'utilisation du router :
- dans le [[template]]
- dans le [[@Component]]

Le routeur permet aussi de faire transiter des [[informations entre composants]]
# Cycle de vie des routes

[[Resolver]]

# Dans le template

  
```
<a routerLink="/route/contents" routerLinkActive="active">link0</a>
<a [routerLink]="['/route/contents', 2]">link 1</a>
```


# Dans le composant

  
```
this.router.navigate(['../', { id: heroId, foo: 'foo' }], { relativeTo: this.route });

this.router.navigate(['/heroes', { id: heroId, foo: 'foo' }]); // se récupère avec route.paramMap
```