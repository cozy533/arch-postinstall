## Arch Linux Post-Installation Script

A bash script to simplify setting up a minimal Arch Linux installation, with GNOME as the desktop environment.
Installs desired packages from the official repositories, the AUR, and the Chaotic AUR. Will prompt for sudo password when installing packages through paru.

## Features
- Installs base packages, drivers, and utilities
- Configures paru (AUR helper)
- Sets up system services (gdm, firewalld, systemd-resolved)

### Usage

1. Clone the repositry <br>
`git clone https://github.com/cozy533/arch-postinstall`

2. Run the script as root <br>
`cd arch-postinstall && sudo ./setup.sh`
