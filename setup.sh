#!/bin/bash

# Check for elevated privileges
if (($EUID != 0)); 
	then echo "Please run script as root user. Exiting."
	exit 1
fi

function configureChaoticAUR {
	echo "Setting up Chaotic AUR..."
	pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
	pacman-key --lsign-key 3056513887B78AEB
	pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
	pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
	echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
}

# List of official and Chaotic-AUR packages
PROGRAMS=(
	"adw-gtk-theme"
	"bottles"
	"blackbox-terminal"
	"dconf-editor"
	"engrampa"
	"ffmpegthumbnailer"
	"firefox"
	"firewalld"
	"foliate"
	"gdm"
	"gimp"
	"gnome-boxes"
	"gnome-control-center"
	"gnome-characters"
	"gnome-disk-utility"
	"gnome-shell"
	"gnome-text-editor"
	"gnome-tweaks"
	"gst-plugins-good"
	"gvfs-mtp"
	"i2c-tools"
	"jamesdsp"
	"keepassxc"
	"lib32-vulkan-radeon"
	"losslesscut-bin"
	"loupe"
	"magic-wormhole"
	"mission-center"
	"mpv"
	"nano"
	"nicotine+"
	"noto-fonts"
	"noto-fonts-cjk"
	"ntfs-3g"
	"obs-studio"
	"openrgb"
	"paru"
	"rsync"
	"streamlink"
	"systemd-resolvconf"
	"syncthing"
	"tealdeer"
	"thunderbird"
	"thunderbird-dark-reader"
	"ttf-twemoji"
	"vesktop"
	"vnote"
	"vulkan-radeon"
	"wine-mono"
	"wireguard-tools"
)

# List of "regular AUR" packages for paru
AUR=(
	"gapless"
	"librewolf-bin"
	"morewaita-icon-theme"
	"nautilus-open-in-blackbox"
)

# Update system
pacman -Syu --noconfirm

# Set up Chaotic AUR
configureChaoticAUR

# Sync Chaotic AUR repository
pacman -Sy --noconfirm

# Install packages from official repos + chaotic AUR repo
pacman -S --needed --noconfirm "${PROGRAMS[@]}"

# Install steam package after pre-specified radeon drivers are installed
pacman -S --needed --noconfirm steam

# Install packages from AUR using sudo
sudo -u $(id -un 1000) paru -S --needed --noconfirm "${AUR[@]}"

# Enable systemd services
systemctl enable gdm
systemctl enable firewalld
systemctl enable systemd-resolved

echo -e "\033[0;33mEverything completed successfully." && echo -e "\033[0;0m"
