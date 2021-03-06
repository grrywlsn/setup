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
brew cask install iterm2
brew cask install visual-studio-code
brew cask install the-unarchiver

### iterm customisation
git clone https://github.com/powerline/fonts.git --depth=1; cd fonts; ./install.sh; cd ..; rm -rf fonts
curl https://raw.githubusercontent.com/grrywlsn/setup/master/com.googlecode.iterm2.plist -o ~/Library/Preferences/com.googlecode.iterm2.plist --create-dirs

### brew packages
brew install coreutils
brew install svn
brew install asciinema
brew install httpie
brew install jq
brew install libpq
brew install telnet
brew install yamllint
brew cask install authy

### zsh plugins
# kube-aliases
#git clone git@github.com:Dbz/kube-aliases.git ~/.oh-my-zsh/custom/plugins/kube-aliases
grep -qxF 'plugins+=(kube-aliases)' "$HOME/.zshrc" || echo 'plugins+=(kube-aliases)' >> "$HOME/.zshrc"

### kubernetes
brew install kubectl
brew install kubectx
brew install kubeseal
brew install helm
brew install stern

### aws
brew install awscli
brew install aws-iam-authenticator
brew install remind101/formulae/assume-role
brew tap wallix/awless
brew install awless
brew install warrensbox/tap/tfswitch
brew install terragrunt
brew install fluxctl
brew install istioctl

### Go environment
grep -qxF 'export GOPATH="${HOME}/.go"' "$HOME/.zshrc" || echo 'export GOPATH="${HOME}/.go"' >> "$HOME/.zshrc"
grep -qxF 'export GOROOT="$(brew --prefix golang)/libexec"' "$HOME/.zshrc" || echo 'export GOROOT="$(brew --prefix golang)/libexec"' >> "$HOME/.zshrc"
grep -qxF 'export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"' "$HOME/.zshrc" || echo 'export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"' >> "$HOME/.zshrc"
source ~/.zshrc
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

### Go
brew install go
go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint

### aliases
grep -qxF 'alias tf="terraform"' $HOME/.zshrc || echo 'alias tf="terraform"' >> $HOME/.zshrc

brew cleanup
source ~/.zshrc