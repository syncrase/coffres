	
#note #editeur-de-texte #markdown

[obsidian-api](https://github.com/obsidianmd/obsidian-api)

| description   | mardown     |
| ------------- | ----------- |
|               |             |
|       insérer un pdf        |     `![[My File.pdf#page=number]]`        |
| afficher une page | `![Titre](path)` |
| afficher une page | `![[Titre]]` |
| lier une page | `[Titre](path)` |
| lier une page | `[[Titre]]` |

# Embarquer un média

Vidéo dans une iFrame
#todo formatter ifram, je la veut plus large
```html
<iframe src="https://www.youtube.com" width:650></iframe>
```
<iframe src="https://www.youtube.com" width:650></iframe>


#toc

[How to Boost your Productivity for Scientific Research | by Leonardo Castorina | Medium | Medium](https://medium.com/@universvm/how-to-boost-your-productivity-for-scientific-research-using-obsidian-fe85c98c63c8)

# Prise de notes

- Une note peut rediriger vers une autre : link & backlink
- metadata en debut de note contenu entre les balises `---`
- code blocks nommé entre les triple \`\`\`\<nom\>\\n code\`\`\`
- Formattage en section avec les callout


# CSS
activer l'option dans la partie apparence
ajouter le css dans le fichier `.obsidian\snippets\customTags.css`

```CSS
.tag {
    /*changed var to hex color */
    background-color: #000;
    /* border: none; */
    /* border: solid; */
    /* SY added border width to make it smaller */
    border-width:1px;
    /* color: #ff0000; */
    /* font-size: 11px; */
    font-size: 12px;
    /* padding: 1px 8px; */
    padding: 1px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin: 0px 0px;
    cursor: pointer;
    /* border-radius: 14px; */
    border-radius: 8px;
}
.tag:hover {
    color: white;
    /* changed color of hover over tag */
    /* background-color: var(--text-accent-hover); */
    /* background-color: #faf2d6; */
    background-color: #1C1C1C;
}
```

---
# Plugin

## Ajout d'un plugin derrière un proxy
il faut configurer [[Git]] pour qu'il passe par le proxy (ici, Fiddler)
`$ git config --global http.proxy http://localhost:8888`


## Dataview

[[Query example]]

[Data Annotation - Dataview (blacksmithgu.github.io)](https://blacksmithgu.github.io/obsidian-dataview/data-annotation/)

[GitHub - blacksmithgu/obsidian-dataview: A high-performance data index and query language over Markdown files, for https://obsidian.md/.](https://github.com/blacksmithgu/obsidian-dataview)
Permet de requêter les notes pour générer du contenu dynamique.
Très utile mais demande une bonne maitrise du SQL et d javascript

# advanced tables
Permet d'afficher des tables
Utile et ne demande aucune compétence

# calendar
Utile pour crére une note quotidienne ou en rechercher une.

# cMenu
Bar de menu pour insérer un style
Pas très utile

# Power Search
recherche des notes et tags lors de la saisie
Très utile et ne demande aucune compétence

# Tag & Word cloud
Juste pour afficher un nuage de mots
Pas très utile

# Templater
Permet de définir des templates pour ajouter du contenu à un notes ou créer une note.
Très utile mais demande une certaine maitrise



---

# Améliorer l'utilisation d'Obsidian
- N'utiliser que des tags simples + maj des toc
	- Quand utiliser des tag simples et quand utiliser des tags complexes?
	- Quand utiliser un lien plutôt qu'un tag?
- https://johackim.com/obsidian (mermaid)
- https://github.com/wanadev/obsidian-http-request
- script pour renommer un tag ?




