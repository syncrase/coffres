

Pour voir la définitions des raccourcis Ctrl + Alt + S > Keymap


Raccourcis Intellij IDEA

supprimer la ligne sélectionnée
fermer un onglet
comment : uncomment
auto import
extract method
generate getter stter constructor
type hierarchy
call hierarchy



**************************************************************************************
tips
**************************************************************************************

Alt + Entrée pour vérifier une regex


# Find

-	All     : Maj, Maj
-	Classes : Ctrl + N : Project files (is modifiable)
-	Files : Ctrl + Maj + N : 
-	Symbols : Ctrl + Alt + Maj + N : Find method or global variable
-	Actions : Ctrl + Maj + A (p.e. Delete line, Move line down, move line up, ...)
-	Find in files: Ctrl + Maj + F

# Navigation

-	To switch between opened files and tool windows, use the Switcher Ctrl+Tab. For navigation, press and hold Ctrl (on Windows and Linux) / ⌘ (on macOS) and use the Up and Down arrow keys or Tab and Shift+Tab, and Alt.
		Press Delete or BackSpace to close an editor tab or hide a tool window.
-	F2 or Maj+F2 : next or previous error or warning
-	Ctrl + F1 : error description
-	Find usage : Press Alt+Maj+7 to quickly locate all occurrences of code referencing the symbol at the caret, no matter if the symbol is a part of a class, method, field, parameter, or another statement.
- Ctrl + G : Go to line

# Génération de boilerplates
-	You can generate boilerplate code such as getters and setters and implement interface methods using code completion.
		Just start typing the would-be name of a method, for example, gn to generate getName() or ct to implement compareTo().
-	Ctrl + Maj + Suppr : pour unwrap
-	Ctrl + Alt + T : surround ne fonctionne pas car raccourci ubuntu....	


# Code assistance
-	Ctrl + Alt + O : organize import
-	Alt + Entrée : show context action
-	Right click : localo history
-	Ctrl + Q (View | Quick Documentation),
-	Ctrl + Maj + I : Show implementation in a popup
-	Ctrl + P (View | Parameter Info),
-	Ctrl + B (Navigate | Declaration)
-	(expr). : postfix complétion	
-	Completion with TAB : replace instead of insert

# Affichage
-	collapse : Ctrl (+ Maj )+ -/+ Utiliser Maj pour tout collapser
-	Ctrl + Maj + F7 : highlight all occurences

# Edit
## Auto-complétion
-	Complete statement and format : Ctrl + Maj + Entrée (met un point virgule, des accolades, ... et positionne le curseur)
-	Ctrl + Space : autocomplétion
-	Ctrl + Maj + Space : type-matching completion

## Sélection
-	Ctrl + W pour sélectionner un scope de plus en plus large
-	Ctrl + Maj + W pour sélectionner de moins en moins
-	Alt + J select symbol and next occurences (+ Maj for go back)
-	Ctrl + Alt + Maj + J Select all occurences
-	Alt + Maj : multi curseur


## Formatting
-	Ctrl + Alt + L : format whole or selected
-	Ctrl + Alt + Maj + L : Show format settings

## Modification du texte
-	Replace all in current file : Ctrl + R
-	Replace in all files : Ctrl + Maj + R
-	Ligne de commentaire : Ctrl + / (pavé numérique)
-	Block de commentaire : Ctrl + Maj + / (pavé numérique)
-	Dupliquer ligne : Ctrl + D
-	Ctrl + Maj + Up/Down : déplacer une un ligne ou une méthode


# Refactoring
-	Maj + F6 : rename field
-	Ctrl + Alt + V : extract variable
-	Ctrl + Alt + N : remove single usage variable
-	Ctrl + Alt + C : extract constant
-	Ctrl + Alt + Maj + T : list of refactorings



# Code investiguation
-	Press Ctrl + Alt + Maj + U to open a UML class diagram in a new editor tab.

# Interférences avec Ubuntu
Les raccourcis ci-dessous interfèrent avec ceux de Ubuntu :
- Ctrl + Alt + T : Open a terminal in Ubuntu and Surround in IntelliJ IDEA

Le problème se règle simplement en modifiant les raccourcis de l'un ou l'autre. 
- [[Configuration système#Les raccourcis|Modifier les raccourcis Ubuntu]]