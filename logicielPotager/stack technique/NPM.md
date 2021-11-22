
# Désintallation & installation de NPM
`$ sudo apt autoremove nodejs npm`
`$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash` [install nvm](https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/)
`$ nvm install --lts`

Obtenir toutes les LTS
`nvm ls-remote | grep 'Latest LTS'`

Pour installer une version spécifique de node (LTS compatible avec JHipster)
`$ nvm install v14.18.1`

Problème, la version 16 (currently latest) revient à chaque terminal ouvert

Suppression de nvm puis installation de n

````
sudo npm cache clean -f
sudo npm install -g n
sudo n 14.18.1
````