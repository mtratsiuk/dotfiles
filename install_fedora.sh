#!/usr/bin/env bash

# NVidia https://rpmfusion.org/Howto/NVIDIA
# Docker https://docs.docker.com/engine/install/fedora/ https://docs.docker.com/engine/install/linux-postinstall/
# nvm https://github.com/nvm-sh/nvm#install--update-script

sudo dnf install -y \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
	fedora-workstation-repositories

sudo dnf config-manager --set-enabled google-chrome
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf copr enable -y dawid/better_fonts

sudo dnf check-update

sudo dnf install -y \
	google-chrome-stable \
	gnome-tweak-tool \
	stow \
	code \
	flatpak \
	fontconfig-enhanced-defaults fontconfig-font-replacements

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
	com.slack.Slack \
	com.skype.Client
