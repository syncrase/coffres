
Le template est principalement écrit en HTML. Mais on y trouve aussi
- des [[Selector|sélecteurs]] qui intègre un composant
- des [[éléments]]
- des [[interpolations]] qui sont compilés par typescript `{{ code interpolé }}`

```
<div 
	attr="chaineStatic" 
	[attr]="compilé"
	attr="{{ compilé }}" 
>
</div>
```