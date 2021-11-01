
Les life cycle hook permettent de contrôler un composant dans toutes les étapes de son cycle de vie.

 [Angular glossary](https://angular.io/guide/glossary#lifecycle-hook)
 [Angular doc](https://angular.io/guide/lifecycle-hooks)
 
Les hooks sont les suivants :
-   `ngOnChanges`: When an [input](https://angular.io/guide/glossary#input)/[output](https://angular.io/guide/glossary#output) binding value changes.
-   `ngOnInit`: After the first `ngOnChanges`.
-   `ngDoCheck`: Developer's custom change detection.
-   `ngAfterContentInit`: After component content initialized.
-   `ngAfterContentChecked`: After every check of component content.
-   `ngAfterViewInit`: After a component's views are initialized.
-   `ngAfterViewChecked`: After every check of a component's views.
-   `ngOnDestroy`: Just before the directive is destroyed.