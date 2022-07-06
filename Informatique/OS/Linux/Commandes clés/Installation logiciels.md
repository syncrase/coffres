
Pour savoir où est enregistré un logiciel
```bash
ls -la `which obsidian` | grep obsidian
```


# .deb
`sudo dpkg -i <deb_name>.deb`

n.b. désinstaller avec apt

# Snap


# .pkg

# Apt

# AppImage
installation du paquet appimagelauncher. [releases](https://github.com/TheAssassin/AppImageLauncher/releases)
```bash
sudo dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
```


# Ajouter un launcher

Il faut ajouter un fichier myApp.desktop dans le répertoire `/usr/share/applications/`

Contenu du fichier (exemple avec Obsidian)
```
[Desktop Entry]
Name=Obsidian
Exec=/opt/Obsidian/obsidian %U
Terminal=false
Type=Application
Icon=obsidian
StartupWMClass=obsidian
Comment=Obsidian
MimeType=x-scheme-handler/obsidian;
Categories=Office;
```