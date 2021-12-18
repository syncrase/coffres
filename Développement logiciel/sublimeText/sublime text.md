

# Remplacement par REGEX

exemple
Find `^\s*debutSemisPleineTerre: ([0-9]{0, 2}),\n\s*finSemisPleineTerre: ([0-9]{0, 2}),\n\s*debutSemisSousAbris: ([0-9]{0, 2}),\n\s*finSemisSousAbris: ([0-9]{0, 2})$`
Replace `cycleDeVie: {semis:{semisPleineTerre:{debut:{numero:$1}, fin:{numero:$2}}, semisSousAbris:{debut:{numero:$3}, fin:{numero:$4}}}}`

## Find
- début de ligne `^`
- fin de ligne `$`
- matcher une suite de caractères `[a-z]`
- matcher des caractères distincts `[a\( ;]` (match 'a', '(', ' ' et ';' ( est un carctères spécial il faut le escape)
- récupérer une valeur `(matching_regex)`
- 0 à n  occurences `*`
- 1 à n occurences `+`
- plus de a occurences `{a,}`
- moins de a occurences `{,a}`
- de a à b occurences `{a,b}`

## Replace
- la replacer en remplacement `$n` n est un entier
- uppercase le remplacement `\Uwil_be_uppercase\E`

# Raccourcis

multilines edition : select lines and Cmd + Maj + L