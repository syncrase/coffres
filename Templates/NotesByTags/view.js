
const targetTagName = input.tagName;
let map = new Map();

/*
* Construction de la map associant à chaque sous tag toutes les notes taggées
* Format retourné : Map<tag: String, notes: file[]>
*/
for (let group of dv.pages(targetTagName)) {
	let targetedTagsList = [...new Set(
		group.file.etags.filter(t => t.contains(targetTagName.substring(1)))
	)];

	// Pour chacun des tags contenus dans le ticket
	for(let tag of targetedTagsList) {
		if(map.get(tag) == null) {
			map.set(tag, [group.file])
		} else {
			map.get(tag).push(group.file);
		}
		
	}
}

// Retourne 1 si la première note a été créée avant la suivante
const isBefore = (note1, note2) => 
		(new Date(note1.cday.toISO()) < new Date(note2.cday.toISO())) ? 1 : -1;

// Retourne la note qui a été créée le plus récemment
const getLatestNote = (files) => files.sort((f1, f2) => isBefore(f1, f2))[0];

/*
* Je garde la dernière note modifiée pour chaque tag et les compare pour ordonner les tags
* Arguments : current, next
*/
const sortByLastestCreationDate = (a,b) => isBefore(
	getLatestNote(a[1]),
	getLatestNote(b[1])
);

// Retourne une liste (lignes) de tableau contenant les valeurs (colonnes) à mettre dans la table
const getRowsFromNotes = (files) => {
	let rows = [];
	files.forEach(file => {
		rows.push([file.link, file.cday])
	});
	return rows;
};

const getUpperCased = (tag) => {
	tag = tag.substring(targetTagName.length + 1);
	return tagWithHeadingUpperCase = tag.charAt(0).toUpperCase() + tag.substring(1);
};


const tagsTriesParDateDeCreationDesNotes = new Map([...map.entries()].sort((current, next) => sortByLastestCreationDate(current, next)));

for(const [tag, fileListe] of tagsTriesParDateDeCreationDesNotes) {
	dv.header(3, getUpperCased(tag));  
	
	dv.table(
		["Page", "Date création"], 
		getRowsFromNotes(fileListe)
	)
	dv.el('hr', '');
	dv.el('br', '');
	
}


