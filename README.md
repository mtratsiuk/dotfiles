# Installation

```sh
pacman -S --needed git stow
cd ~
git clone git@github.com:mtratsiuk/dotfiles.git
```

# Usage

```sh
cd ~/dotfiles

stow git # link git configs
stow vscode # link vscode settings

./dotfiles load # additional installations (vscode extensions)
./dotfiles dump # update extensions file
```
