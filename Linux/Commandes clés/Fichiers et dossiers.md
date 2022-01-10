# Rechercher des fichiers
Pour rechercher tous les fichiers qui contiennent une certaine chaine de caractères
`grep --exclude-dir={target,node_modules} -rnw './' -e 'base.xml'`

Rechercher tous les fichiers avec un certain nom
`find ./ -iname .yo-rc.json`
ou les dossiers 
`find ./ -name .jhipster -type d`

Utiliser le bash globstar pour trouver le répertoire bin/
```
bash-4.3$ shopt -s globstar
bash-4.3$ for f in ./**/* ; do [ -d "$f" ] && [[ "${f##*/}" =~ ^bin$ ]] && echo "$f" ; done
```
et piper la sortie pour les supprimer `sudo rm $(find ./ -iname .yo-rc.json)`


https://vitux.com/how-to-find-files-on-the-ubuntu-command-line/

https://linuxconfig.org/how-to-explicitly-exclude-directory-from-find-command-s-search
https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/



# Déplacer le contenu

Référence : https://unix.stackexchange.com/questions/127712/merging-folders-with-mv


`mv` cannot merge or overwrite directories, it will fail with the message _"mv: cannot move 'a' to 'b': Directory not empty"_, even when you're using the `--force` option.

---

You can work around this using other tools (like `rsync`, `find`, or even `cp`), but you need to carefully consider the implications:

-   `rsync` can merge the contents of one directory into another (ideally with the `--remove-source-files`1 option to safely delete only those source files that were transferred successfully, and with the usual permission/ownership/time preservation option `-a` if you wish)  
    … **but** this is a full copy operation, and can therefore be very disk-intensive.
-   **Currently preferred option:** You can combine `rsync`'s `--link-dest=DIR` option (to create hardlinks instead of copying file contents, where possible) and `--remove-source-files` to get a semantic very similar to a regular `mv`.  
    For this, `--link-dest` needs to be given an absolute path to the _source_ directory (or a relative path from the _destination_ to the _source_).  
    … **but** this is using `--link-dest` in an unintended way (which may or may not cause complications), requires knowing (or determining) the absolute path to the source (as an argument to `--link-dest`), and again leaves an empty directory structure to be cleaned up as per 1.
-   [You can use `find`](https://unix.stackexchange.com/a/155633/28235) to sequentially recreate the source directory structure at the target, then individually move the actual files  
    … **but** this has to recurse through the source multiple times and can encounter race conditions (new directories being created at the source during the multi-step process)
-   [`cp` can create hard links](https://unix.stackexchange.com/a/172402/28235) (simply put, additional pointers to the same existing file), which creates a result very similar to a merging `mv` (and is very IO-efficient since only pointers are created and no actual data has to be copied)  
    … **but** this again suffers from a possible race condition (new files at the source being deleted even though they weren't copied in the previous step)

Which of these workarounds (if any) is appropriate will very much depend on your specific use case.  
As always, think before you execute any of these commands, and have backups.


I'd recommend these four steps:

```
cd ${SOURCE}; 
find . -type d -exec mkdir -p ${DEST}/\{} \; 
find . -type f -exec mv \{} ${DEST}/\{} \; 
find . -type d -empty -delete
```

or better yet, here's a script that implements semantics similar to `mv`:

```
#!/bin/bash

DEST="${@:${#@}}"
ABS_DEST="$(cd "$(dirname "$DEST")"; pwd)/$(basename "$DEST")"

for SRC in "${@:1:$((${#@} -1))}"; do   (
    cd "$SRC";
    find . -type d -exec mkdir -p "${ABS_DEST}"/\{} \;
    find . -type f -exec mv \{} "${ABS_DEST}"/\{} \;
    find . -type d -empty -delete
) done
```

The quotes around the SRC and DEST variables will preserve whitespace in path names.

## Use 'mv' with 'find'. _You can do this in one pass._

```bash
cd "$SRC"
find -type d -exec mkdir -vp "$DST"/{} \; -or -exec mv -nv {} "$DST"/{} \;
```

… where `$SRC` and `$DST` are the source and destination directories, respectively.

---

### Explanation

-   `-type d` tests if the item is a directory. If it is a directory, we proceed to the next action or test: `-exec …`.
-   In `-exec … {} \;`, the `{}` is replaced with the path to the current item, relative to the current working directory. The `\;` indicates the end of this `-exec …` command.
-   In `mkdir -pv …`, `-pv` is equivalent to `-p -v`. The `-p` means to create all intermediate directories, as needed, and not raise an error if the directory already exists. The `-v` means `--verbose` and just tells it to print a message for each directory created, so you can see what it is doing. `"$DST"/{}` will be expanded to the destination directory, including all needed quotes.
-   The `-or` is the interesting part, which allows us to do this in one pass. With the `find` command, every test (e.g., `-type d`) or action (e.g., `-exec …`) result in a status of true or false, depending on if the test passed or action succeeded. Tests and actions can be connected using `-and`, `-or`, `-not`, `-true`, `-false`, and `\( … \)`. _When you add multiple tests and/or actions without an explicit boolean operator, they are implicitly AND'd together._ Thus, the above command is equivalent to this: `find \( -type d -and -exec mkdir -vp "$DST"/{} \; \) -or -exec mv -nv {} "$DST"/{} \;`. Thus, if `-type d` passes, then it goes on to the next action (`-exec …`). If not, then that first branch of the `-or` is false, and it goes to the second branch, which covers anything that is not a directory (e.g., files).
-   In `mv -nv {} "$DST"/{}`, `-nv` is equivalent to `-n -v`. The `-n` tells it to _not_ overwrite any files in the destination directory.. The `-v` tells it to report a message for every file moved, so you can see what it is doing.
-   Directories will be created before their files are moved. `find` uses _breadth-first_ traversal by default.
-   The `{}` does NOT need to be enclosed in quotes, even if the item it stands for includes spaces.
-   Empty directories at the source will remain.

### Example

If you wanted to copy /usr/local into /usr, you could enter it like this.

```bash
cd /usr/local
find -type d -exec mkdir -vp ../{} \; -or -exec mv -nv {} ../{} \;
```

It would result in commands like this:

```
mkdir -pv .././bin
mv -nv ./bin/pip .././bin/pip
mv -nv ./bin/pip3 .././bin/pip3
mv -nv ./bin/python3 .././bin/python3
mv -nv ./bin/python3 .././bin/python3
mv -nv ./bin/xxhsum .././bin/xxhsum
mkdir -pv .././etc
mkdir -pv .././include
mv -nv ./include/xxh3.h .././include/xxh3.h
mv -nv ./include/xxhash.h .././include/xxhash.h
```

… and so on

### How to preview

To see what commands will be run, add `echo` before each command, right after the `-exec`, like this:

```bash
cd "$SRC"
find -type d -exec echo mkdir -vp "$DST"/{} \; -or -exec echo mv -nv {} "$DST"/{} \;
```

# Supprimer des fichiers

sudo rm -rf !("full_apllication.cronquist.jdl") .*


# Conversion image pdf

Convertir une image vers pdf `img2pdf <input_file> -o <output_pdf>`
avec le logiciel [img2pdf](https://techpiezo.com/linux/convert-png-jpeg-to-pdf-in-ubuntu/) `sudo apt install img2pdf`

Réduire la taille du pdf 
```shell
ps2pdf -dPDFSETTINGS=/ebook input.pdf output.pdf
```