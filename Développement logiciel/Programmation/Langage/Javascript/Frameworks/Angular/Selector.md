---
aliases: sélecteur html, sélecteurs, selector
---

Le sélecteur html d'un composant se déclare dans l'annotation @Component


```  

@Component({
	selector: 'app-selector',
	templateUrl: './my-content.component.html',
	styleUrls: ['./my-content.component.css']
})
export class MyContentComponent implements OnInit {
(...)
```

Le composant à besoin d'être exporté pour que le sélecteur soit rendu visible à l'extérieur du module

```  
@NgModule({
	declarations: [MyContentComponent],
	imports: [
		CommonModule,
		MyRoutingModule
	],
	exports: [MyContentComponent]
})

export class MyModule {
(...)
```


Ce module doit être importé pour être utilisé dans un autre module.
A cet endroit il est possible d'[[Service provider#^82860f|injecter un provider]]

```
  
@NgModule({
	declarations: [
		AppComponent,
		(...)
	],
	imports: [
		MyModule.forRoot({ somethingsConfig: 'specific value' }),
		(...)
	],
	providers: [
		(...)
	],
	bootstrap: [AppComponent]
})
export class AppModule {
(...)

```

Dans AppComponent, il deviens possible d'utiliser le sélecteur

``` 
<app-orders></app-orders>
```

Cette utilisation des composants permet l'utilisation des Input/Output, du [[data binding]], du [[Banana in the box]], des [[Directives]], pour gérer les [[informations entre composants]]

``` 

@Output event1: EventEmitter\<any\>;

@Input entry2: any;

@Input entry1: any;
@Output entry1Change: EventEmitter\<any\>;


``` 


``` 
<app-orders [entry2]="'objet envoyé au composant'" (event1)="gestionDeLEventReçu($event)" [(entry1)]="bindedData"></app-orders>
```