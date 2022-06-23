#tagTest


https://obsidian-snippets.pages.dev/
https://github.com/search?q=obsidian
https://github.com/kmaasrud/awesome-obsidian

code base
https://github.com/obsidianmd/obsidian-api


Dataview snippets
https://forum.obsidian.md/t/dataviewjs-snippet-showcase/17847
https://forum.obsidian.md/t/dataview-plugin-snippet-showcase/13673

# Essai 1: html basics
https://github.com/ryanjamurphy/vantage-obsidian/blob/master/main.ts
https://github.com/blacksmithgu/obsidian-dataview/discussions/701


à voir 
https://github.com/samlewis0602/obsidian-custom-js
https://forum.obsidian.md/t/dataviewjs-code-reuse-common-place-for-scripts/18611

```dataviewjs
let tags = dv.current().file.etags;  
dv.el('div', tags);  
  
let root = this.container.createEl('div');  
  
let inputContainer = root.createEl('div');  
  
function ajouteUnChampDeSaisie() {  
    inputContainer.createEl('input', {'type': 'text'});  
}  
  
ajouteUnChampDeSaisie();  
  
let boutonDAjout = root.createEl('button', {'type': 'button'});  
boutonDAjout.append('Ajout tag');  
boutonDAjout.addEventListener('click', _ => ajouteUnChampDeSaisie());  
  
let boutonDeValidation = root.createEl('button', {'type': 'button'});  
boutonDeValidation.append('Valider');  
  
function getAllInputContentAsArray() {  
    let inputBoxes = inputContainer.querySelectorAll('input');  
    let tags = [];  
    inputBoxes.forEach((inputBox) => {  
        tags.push(inputBox.value);  
    });  
    return tags;  
}  
  
function getAllNotesByTagIntersection(tags) {  
    const request = '#' + tags.join(' and #');  
    return dv.pages(request);  
}  
  
boutonDeValidation.addEventListener('click', _ => {  
    const tags = getAllInputContentAsArray();  
    const notes = getAllNotesByTagIntersection(tags);  
    notes.forEach(note => {  
        dv.el('div', note.file.name);  
    })  
});
```
