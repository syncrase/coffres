

# Remplacement par REGEX

exemple
Find `^\s*debutSemisPleineTerre: ([0-9]{0, 2}),\n\s*finSemisPleineTerre: ([0-9]{0, 2}),\n\s*debutSemisSousAbris: ([0-9]{0, 2}),\n\s*finSemisSousAbris: ([0-9]{0, 2})$`
Replace `cycleDeVie: {semis:{semisPleineTerre:{debut:{numero:$1}, fin:{numero:$2}}, semisSousAbris:{debut:{numero:$3}, fin:{numero:$4}}}}`


# Raccourcis

multilines edition : select lines and Cmd + Maj + L