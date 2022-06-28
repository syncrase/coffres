
#note #editeur-de-texte #markdown

[obsidian-api](https://github.com/obsidianmd/obsidian-api)

# Formattage du contenu d'une note

- Une note peut rediriger vers une autre : link & backlink
- metadata en debut de note contenu entre les balises `---`
- code blocks nommé entre les triple \`\`\`\<nom\>\\n code\`\`\`
- Formattage en section avec les callout



## CSS
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


# Les liens entre les notes
| description       | mardown                        |
| ----------------- | ------------------------------ |
| lier une note     | `[[my note]]`                  |
|                   | `[Titre](path)`                |
| afficher une note | `![Titre](path)`               |
|                   | `![[Titre]]`                   |

# Ajouter du contenu externe
| description       | markdown                       |
| ----------------- | ------------------------------ |
| insérer un pdf    | `![[My File.pdf#page=number]]` |
| insérer une image | `![[image/path]]`              |
|                   | drag & drop                    |
| afficher une vidéo | cf. [[Obsidian#Embarquer un média]] |

## Embarquer un média

Vidéo dans une iFrame
#todo formatter ifram, je la veut plus large
```html
<iframe src="https://www.youtube.com" width:650></iframe>
```
<iframe src="https://www.youtube.com" width:650></iframe>


#toc

[How to Boost your Productivity for Scientific Research | by Leonardo Castorina | Medium | Medium](https://medium.com/@universvm/how-to-boost-your-productivity-for-scientific-research-using-obsidian-fe85c98c63c8)


---
# Plugin
## Développement
https://marcus.se.net/obsidian-plugin-docs/
https://github.com/obsidianmd/obsidian-sample-plugin



## Ajout d'un plugin derrière un proxy
il faut configurer [[Git]] pour qu'il passe par le proxy (ici, Fiddler)
`$ git config --global http.proxy http://localhost:8888`


## Dataview

[[Query example]]

[Data Annotation - Dataview (blacksmithgu.github.io)](https://blacksmithgu.github.io/obsidian-dataview/data-annotation/)

[GitHub - blacksmithgu/obsidian-dataview: A high-performance data index and query language over Markdown files, for https://obsidian.md/.](https://github.com/blacksmithgu/obsidian-dataview)
Permet de requêter les notes pour générer du contenu dynamique.
Très utile mais demande une bonne maitrise du SQL et d javascript

code reuse (require(...))
https://forum.obsidian.md/t/dataviewjs-code-reuse-common-place-for-scripts/18611/5


## advanced tables
Permet d'afficher des tables
Utile et ne demande aucune compétence

## calendar
Utile pour crére une note quotidienne ou en rechercher une.

## cMenu
Bar de menu pour insérer un style
Pas très utile

## Power Search
recherche des notes et tags lors de la saisie
Très utile et ne demande aucune compétence

## Tag & Word cloud
Juste pour afficher un nuage de mots
Pas très utile

## Templater
Permet de définir des templates pour ajouter du contenu à un notes ou créer une note.
Très utile mais demande une certaine maitrise

## Jira
https://github.com/marc0l92/obsidian-jira-issue

## Omnisearch
https://github.com/scambier/obsidian-omnisearch

## Timeline
https://github.com/Darakah/obsidian-timelines

## Livre
https://github.com/MichaBrugger/booksidian_plugin

## UML
https://github.com/joethei/obsidian-plantuml


## Tag
https://github.com/pjeby/tag-wrangler

## Tags folder
https://github.com/vrtmrz/obsidian-tagfolder


## Tabs
https://github.com/gitobsidiantutorial/obsidian-tabs

## Note as a mindmap
https://github.com/MarkMindCkm/obsidian-enhancing-mindmap

## diagram draw.io
https://github.com/zapthedingbat/drawio-obsidian

## Livre Zotero
https://github.com/mgmeyers/obsidian-zotero-integration
## Livre Calibre
https://github.com/caronchen/obsidian-calibre-plugin

## Timeline
https://github.com/George-debug/obsidian-timeline

# Recherche
https://github.com/ryanjamurphy/vantage-obsidian

# Neo4J Graph and query
https://github.com/HEmile/obsidian-neo4j-graph-view


---

# Améliorer l'utilisation d'Obsidian
- N'utiliser que des tags simples + maj des toc
	- Quand utiliser des tag simples et quand utiliser des tags complexes?
	- Quand utiliser un lien plutôt qu'un tag?
- https://johackim.com/obsidian (mermaid)
- https://github.com/wanadev/obsidian-http-request
- script pour renommer un tag ?




