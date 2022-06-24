/**
 * Ceci est un template
 */

const targetTagName = input.tagName;


// Retourne 1 si la première note a été créée avant la suivante
const isBefore = (note1, note2) =>
    (new Date(note1.cday.toISO()) < new Date(note2.cday.toISO())) ? 1 : -1;

let noteList = dv.pages(targetTagName);
noteList = noteList.sort((current, next) => isBefore);
noteList = noteList.map(note => [note.file.link, note.file.cday]);
//dv.el('div', noteList);

dv.table(
    ["Page", "Date création"],
    noteList
)



