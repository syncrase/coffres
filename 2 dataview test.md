#tagTest 

état initial: 
- ajout des tags à exclure et à inclure

projet: 
- pouvoir supprimer les tags ajoutés
- les résultats successifs sont ajoutés dans la même div



```dataviewjs
/**  
 * Ceci est un script dataviewjs * */let root = this.container.createEl('div');  
  
let inputContainer = root.createEl('div');  
let tagsContainer = root.createEl('div');  
let andList = [];  
let andTagsContainer = tagsContainer.createEl('div');  
let notList = [];  
let notTagsContainer = tagsContainer.createEl('div');  
  
function ajouteUnChampDeSaisie(id) {  
    let theInput = inputContainer.createEl('input', {'type': 'text', 'id': id});  
    if (id === 'and') {  
        theInput.addEventListener('keypress', function (keypressed) {  
            if (keypressed.code === 'Enter') {  
                // Ajout d'un tag à la liste des tags à inclure  
                andList.push(theInput.value);  
                andTagsContainer.innerHTML = andList.join(', ');  
            }  
        });  
    }  
    if (id === 'not') {  
        theInput.addEventListener('keypress', function (keypressed) {  
            if (keypressed.code === 'Enter') {  
                // Ajout d'un tag à la liste des tags à exclure  
                notList.push(theInput.value);  
                notTagsContainer.innerHTML = notList.join(', ');  
            }  
        });  
    }  
}  
  
ajouteUnChampDeSaisie('and');  
ajouteUnChampDeSaisie('not');  
  
let boutonDeValidation = root.createEl('button', {'type': 'button'});  
boutonDeValidation.append('Valider');  
  
function getRequest() {  
    andList = andList.map(e => '#' + e);  
    notList = notList.map(e => '-#' + e);  
    return andList.concat(notList).join(' and ');  
}  
  
boutonDeValidation.addEventListener('click', _ => {  
    const request = getRequest();  
    dv.view('/Templates/NotesList', {tagName: request});  
});
```
