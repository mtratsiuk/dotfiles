#!/usr/bin/env bash

# NVidia https://rpmfusion.org/Howto/NVIDIA
# Docker https://docs.docker.com/engine/install/fedora/ https://docs.docker.com/engine/install/linux-postinstall/

# sudo dnf install -y \
# 	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
# 	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
# 	fedora-workstation-repositories

# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

sudo dnf copr enable atim/lazygit -y
sudo dnf check-update

sudo dnf install -y \
	google-chrome-stable \
	gnome-tweaks \
	gnome-extensions-app \
	gnome-terminal \
	stow \
	code \
	tmux \
	lazygit \
	flatpak \
	helix

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
	com.slack.Slack \
	org.telegram.desktop

# Install nvm https://github.com/nvm-sh/nvm#install--update-script
cd ~
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
. nvm.sh
nvm install --lts

# Install golang https://go.dev/dl/
GO_DL_VER="1.24.1" && \
GO_DL_TAR_NAME="go${GO_DL_VER}.linux-amd64.tar.gz" && \
GO_DL_DIR="/tmp/__go_dl" && \
	sudo rm -rf /usr/local/go && \
	mkdir -p $GO_DL_DIR && \
	wget -P $GO_DL_DIR "https://go.dev/dl/${GO_DL_TAR_NAME}" && \
	rm -rf /usr/local/go && \
	sudo tar -C /usr/local -xzf "${GO_DL_DIR}/${GO_DL_TAR_NAME}" && \
	rm -rf $GO_DL_DIR

# reset gnome navigation
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []

# gnome fractional scaling
# gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
# to revert:
# gsettings set org.gnome.mutter experimental-features "[]"
