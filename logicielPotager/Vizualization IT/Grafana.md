
- surveillance, l'analyse et la visualisation des métriques IT
- génère ses graphiques et tableaux de bord à partir de bases de données de séries temporelles


https://www.journaldunet.fr/web-tech/guide-de-l-entreprise-digitale/1443882-grafana-gratuit-la-data-visualisation-du-monitoring-it-open-sourc130921/

**Grafana ** - visualiseur de données. Il peut lire au moins les données de [prometheus](https://prometheus.io/) , [graphite](https://graphiteapp.org/) et [elastics](https://www.elastic.co/) . Son objectif principal est de visualiser des choses dans des tableaux de bord définis par l'utilisateur et de corréler des choses provenant éventuellement de diverses sources. Vous pouvez par exemple voir la charge du processeur (les données de la série de temps flottant de prometheus par exemple) avec Nice [annotations](http://docs.grafana.org/reference/annotations/) faisant référence à un événement spécial dans le fichier journal (chargé à partir des élastiques bien sûr)