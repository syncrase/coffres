

# Remplacement par REGEX
https://regexone.com/lesson/wildcards_dot?

Pour essayer ses regex
https://regexr.com/


exemple
Find `^\s*debutSemisPleineTerre: ([0-9]{0, 2}),\n\s*finSemisPleineTerre: ([0-9]{0, 2}),\n\s*debutSemisSousAbris: ([0-9]{0, 2}),\n\s*finSemisSousAbris: ([0-9]{0, 2})$`
Replace `cycleDeVie: {semis:{semisPleineTerre:{debut:{numero:$1}, fin:{numero:$2}}, semisSousAbris:{debut:{numero:$3}, fin:{numero:$4}}}}`

## Find
- début de ligne `^`
- fin de ligne `$`
- capturer un groupe `(matching_regex)`
- exclure des valeurs `[^]` Toutes les valeurs exception faite de celles suivants l'accent circonflexe

Matcher les caractères
- Les set de caractères
	- matcher une suite de caractères `[a-z]`
	- matcher des caractères distincts `[a\( ;]` (match 'a', '(', ' ' et ';' ( est un carctères spécial il faut le escape)
- Match un chiffre `\d` (correspond à `[0-9]`)
- Match un espace `\s`
- Match ce qui n'est pas un espace `\S`
- Match une tabulation `\t`
- Match un saut de ligne `\n`
- Match une suite alphanumérique `\w`
- Inverser une expression [negative lookahead](https://stackoverflow.com/questions/977251/regular-expressions-and-negating-a-whole-character-group) `^(?!.*ab).*$`

Les occurences
- 0 à 1  occurences `?` (caractère optionnel)
- 0 à n  occurences `*`
- 1 à n occurences `+`
- a occurences `{a}`
- plus de a occurences `{a,}`
- moins de a occurences `{,a}`
- de a à b occurences `{a,b}`

Les caractères à escape
- {}
- []
- .
- *
- ?
- +
- /
- \


## Replace
- replacer la valeur récupérée en remplacement `$n` (n est un entier)
- uppercase le remplacement `\U xxx \E`

# Raccourcis

multilines edition : select lines and Cmd + Maj + L