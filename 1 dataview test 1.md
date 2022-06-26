#tagTest 


Fonctionnalités :
- [x] ajouter les conditions AND & NOT
- [x] le tag ajouté est supprimé du champ de saisie
- [x]  pouvoir supprimer les tags ajoutés
- [x] refactorer les fonction d'ajout des input
- [x] BUG lors d'un deuxième clic sur valider
- [ ]  les résultats successifs sont ajoutés dans la même div (voir dans le template)
- [x] afficher tous les tags associés ainsi que le nombre d'occurence (Grâce à un bouton Vérifier)


```dataviewjs
/**  
 * Ceci est un script dataviewjs * */let root = this.container.createEl('div');  
  
let inputContainer = root.createEl('div');  
let tagsContainer = root.createEl('div');  
let andList = [];  
let andTagsContainer = tagsContainer.createEl('div');  
let notList = [];  
let notTagsContainer = tagsContainer.createEl('div');  
let generatedRequestContainer = tagsContainer.createEl('div');  
  
function afficheLaListe(tagsContainer, valeurs) {  
    tagsContainer.innerHTML = '';  
    valeurs.forEach(tag => {  
        let theTag = tagsContainer.createEl('em', {'text': tag + ' '});  
        theTag.addEventListener('click', () => {  
            valeurs.splice(valeurs.indexOf(tag), 1);  
            afficheLaListe(tagsContainer, valeurs);  
        });  
    });  
}  
  
function ajouteUnChampDeSaisie(label, id, valeurs, notTagsContainer) {  
    let theLabel = inputContainer.createEl('label', {'for': id});  
    theLabel.append(label);  
    let theInput = inputContainer.createEl('input', {'type': 'text', 'id': id, 'name': id});  
    theInput.addEventListener('keypress', function (keypressed) {  
        if (keypressed.code === 'Enter') {  
            // Ajout d'un tag à la liste des tags à exclure  
            valeurs.push(theInput.value);  
            theInput.value = '';  
            // Affichage de la liste des tags  
            afficheLaListe(notTagsContainer, valeurs);  
        }  
    });  
}  
  
ajouteUnChampDeSaisie('Inclure', 'and', andList, andTagsContainer);  
ajouteUnChampDeSaisie('Exclure', 'not', notList, notTagsContainer);  
  
let boutonDeValidation = root.createEl('button', {'type': 'button'});  
boutonDeValidation.append('Valider');  
boutonDeValidation.addEventListener('click', _ => {  
    const request = getRequest();  
    generatedRequestContainer.innerHTML = 'La requête est : ' + request;  
    dv.view('/Templates/NotesList', {tagName: request});  
});  
  
let boutonDeVerification = root.createEl('button', {'type': 'button'});  
boutonDeVerification.append('Vérifier');  
boutonDeVerification.addEventListener('click', _ => {  
    const request = getRequest();  
    generatedRequestContainer.innerHTML = 'La requête est : ' + request;  
    // Récupère tous les tags concernés  
    let tagsMap = new Map();  
    let noteList = dv.pages(request);  
    noteList.forEach(note => {  
        note.file.etags.forEach(tag => {  
            if (tagsMap.get(tag) == null) {  
                tagsMap.set(tag, 1);  
            } else {  
                tagsMap.set(tag, tagsMap.get(tag) + 1);  
            }  
        });  
    });  
    dv.el('div', tagsMap.size);  
    for (let key of tagsMap.keys()) {  
        dv.el('em', key + ' : ' + tagsMap.get(key));  
        dv.el('br');  
    }  
  
});  
  
function getRequest() {  
    let formattedAndList = andList.map(e => '#' + e);  
    let formattedNotList = notList.map(e => '-#' + e);  
    return formattedAndList.concat(formattedNotList).join(' and ');  
  
}
```
