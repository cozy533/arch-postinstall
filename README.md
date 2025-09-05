## Arch Linux Post-Installation Script

A bash script to simplify setting up a minimal Arch Linux installation, with GNOME as the desktop environment.
Installs desired packages from the official repositories, the AUR, and the Chaotic AUR. Will prompt for sudo password when installing packages through paru.

## Features
- Installs AMD open-source GPU drivers and various utilities
- Configures paru (AUR helper)
- Sets up system services (gdm, firewalld, systemd-resolved)

### Usage

1. Clone the repositry <br>
`git clone https://github.com/cozy533/arch-postinstall`

2. Run the script as root <br>
`cd arch-postinstall && sudo ./setup.sh`

⚠️ Note: These scripts are tailored to my personal Linux setup. Please modify the desired packages if you intend to use it.
