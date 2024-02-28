curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
##  install a new version of Node.js and migrate npm packages from a previous version
## nvm install --reinstall-packages-from=node --latest-npm node
nvm install --latest-npm node