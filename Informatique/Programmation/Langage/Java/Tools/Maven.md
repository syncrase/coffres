---
aliases: package manager
---

- dependency management
- conventions to structure a Java project (["The Maven Way"](https://maven.apache.org/background/philosophy-of-maven.html))


# Les plugins Maven
Utilisation des plugins `mvn <plugin>:<goal>`
Les plugins disponibles sont listé [sur le site](https://maven.apache.org/plugins/index.html)

## Plugin 'versions'
`mvn versions:display-dependency-updates`

## Plugin 'dependency'
Ref. : [Site offciel](https://maven.apache.org/plugins/maven-dependency-plugin/examples/purging-local-repository.html)
`mvn dependency:purge-local-repository`