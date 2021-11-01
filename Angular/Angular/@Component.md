---
aliases: component
---

L'annotation du composant suit la syntaxe suivante 

```
@Component({
	selector: 'app-orders',
	templateUrl: './orders.component.html',
	styleUrls: ['./orders.component.css']
	providers: [ComponentScopeService]
})
```

- Le [[Selector]] permet d'ajouter le contenu du composant via le template d'un autre composant
- templateUrl doit contenir soit le lien du html soit directement le html.
- StyleUrls doit contenir les styles propres à ce composant
- providers permet de restreindre l'utilisation d'un service à un seul composant

