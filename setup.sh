#!/bin/bash

### Ensure Xcode/CLT is up to date
softwareupdate --all --install --force
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install

### Install/upgrade Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update && brew upgrade
brew doctor

### zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sed -i -e 's/robbyrussell/agnoster/g' "$HOME/.zshrc"
brew install git

### software
brew install iterm2
brew install --cask visual-studio-code
brew install --cask the-unarchiver

### iterm customisation
git clone https://github.com/powerline/fonts.git --depth=1; cd fonts; ./install.sh; cd ..; rm -rf fonts
curl https://raw.githubusercontent.com/grrywlsn/setup/master/com.googlecode.iterm2.plist -o ~/Library/Preferences/com.googlecode.iterm2.plist --create-dirs

### brew packages
brew install asciinema
brew install bat
brew install coreutils
brew install httpie
brew install jq
brew install libpq
brew install svn
brew install telnet
brew install yamllint
brew cask install authy

### zsh plugins
# kube-aliases
git clone git@github.com:Dbz/kube-aliases.git ~/.oh-my-zsh/custom/plugins/kube-aliases
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

grep -qxF 'plugins+=(kube-aliases)' "$HOME/.zshrc" || echo 'plugins+=(kube-aliases)' >> "$HOME/.zshrc"
grep -qxF 'plugins+=(zsh-autosuggestions)' "$HOME/.zshrc" || echo 'plugins+=(zsh-autosuggestions)' >> "$HOME/.zshrc"
grep -qxF 'plugins+=(zsh-syntax-highlighting)' "$HOME/.zshrc" || echo 'plugins+=(zsh-syntax-highlighting)' >> "$HOME/.zshrc"
grep -qxF 'plugins+=(aws)' "$HOME/.zshrc" || echo 'plugins+=(aws)' >> "$HOME/.zshrc"
grep -qxF 'plugins+=(kubectl)' "$HOME/.zshrc" || echo 'plugins+=(kubectl)' >> "$HOME/.zshrc"
grep -qxF 'plugins+=(zsh-terraform)' "$HOME/.zshrc" || echo 'plugins+=(zsh-terraform)' >> "$HOME/.zshrc"

### kubernetes
brew install kubectl
brew install kubectx
brew install helm
brew install stern

### aws
brew install awscli
brew install aws-iam-authenticator
#brew install remind101/formulae/assume-role
#brew tap wallix/awless
#brew install awless
#brew install warrensbox/tap/tfswitch
#brew install terragrunt
#brew install fluxctl
#brew install istioctl


### aliases
grep -qxF 'alias tf="terraform"' "$HOME/.zshrc" || echo 'alias tf="terraform"' >> "$HOME/.zshrc"

brew cleanup
source ~/.zshrc
