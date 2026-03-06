#!/usr/bin/env bash
set -euo pipefail

# Full app reinstall script for Gruvbox GNOME setup
# Run with: bash apps-install.sh

echo "==> Installing all apps for Gruvbox GNOME setup..."

# Make sure paru is available
if ! command -v paru &>/dev/null; then
    echo "==> Installing paru (AUR helper)..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si --noconfirm && cd -
fi

install() {
    paru -S --noconfirm --needed "$@"
}

# --- GNOME Desktop ---
echo "==> GNOME desktop..."
install \
    gnome-shell gnome-control-center gnome-tweaks gnome-backgrounds \
    gnome-calculator gnome-console gnome-disk-utility gnome-keyring \
    gnome-nettool gnome-power-manager gnome-usage \
    gdm extension-manager malcontent mousetweaks orca sushi \
    loupe papers simple-scan file-roller

# --- Terminals & Shell ---
echo "==> Terminals and shell..."
install \
    ghostty alacritty fish nushell starship fastfetch \
    cachyos-fish-config cachyos-zsh-config

# --- Browsers ---
echo "==> Browsers..."
install \
    firefox thorium-browser-bin qutebrowser python-adblock

# --- Text Editors ---
echo "==> Editors..."
install \
    neovim micro emacs-wayland gedit \
    tree-sitter-bash tree-sitter-cli

# --- File Management ---
echo "==> File management..."
install \
    thunar yazi zoxide

# --- Development ---
echo "==> Development tools..."
install \
    git nodejs python rust zig zls odin \
    ripgrep bash-language-server

# --- System Tools ---
echo "==> System tools..."
install \
    btop glances duf pv \
    btrfs-assistant btrfs-progs snapper cachyos-snapper-support \
    cachyos-kernel-manager cachyos-packageinstaller \
    cpupower smartmontools reflector rsync \
    profile-sync-daemon plocate pkgfile \
    rebuild-detector pacman-contrib octopi

# --- Media ---
echo "==> Media..."
install \
    vlc vlc-plugins-all showtime \
    ffmpegthumbnailer \
    gst-libav gst-plugins-bad gst-plugins-ugly \
    pavucontrol yt-dlp ytfzf

# --- Productivity ---
echo "==> Productivity..."
install \
    libreoffice-still thunderbird element-desktop meld \
    qbittorrent unrar unzip

# --- Gaming ---
echo "==> Gaming..."
install \
    cachyos-gaming-applications cachyos-gaming-meta winboat

# --- Networking ---
echo "==> Networking..."
install \
    networkmanager networkmanager-openvpn ufw openssh wget \
    bluez bluez-utils

# --- Audio ---
echo "==> Audio..."
install \
    pipewire-alsa pipewire-pulse wireplumber pavucontrol

# --- Fonts ---
echo "==> Nerd fonts..."
install \
    noto-fonts noto-fonts-cjk noto-fonts-emoji \
    ttf-liberation ttf-dejavu ttf-opensans ttf-bitstream-vera \
    ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-hack-nerd \
    ttf-cascadia-code-nerd ttf-cascadia-mono-nerd \
    ttf-meslo-nerd ttf-ubuntu-nerd ttf-ubuntu-mono-nerd \
    ttf-roboto-mono-nerd ttf-sourcecodepro-nerd \
    ttf-inconsolata-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd \
    ttf-ibmplex-mono-nerd ttf-victor-mono-nerd \
    ttf-mononoki-nerd ttf-space-mono-nerd ttf-terminus-nerd \
    ttf-anonymouspro-nerd ttf-cousine-nerd ttf-go-nerd \
    ttf-adwaitamono-nerd ttf-zed-mono-nerd ttf-martian-mono-nerd \
    ttf-lilex-nerd ttf-recursive-nerd ttf-agave-nerd \
    ttf-dejavu-nerd ttf-3270-nerd ttf-0xproto-nerd \
    ttf-arimo-nerd ttf-bigblueterminal-nerd ttf-d2coding-nerd \
    ttf-envycoder-nerd ttf-gohu-nerd ttf-heavydata-nerd \
    ttf-iawriter-nerd ttf-intone-nerd ttf-lekton-nerd \
    ttf-liberation-mono-nerd ttf-monofur-nerd ttf-monoid-nerd \
    ttf-mplus-nerd ttf-noto-nerd ttf-profont-nerd \
    ttf-proggyclean-nerd ttf-sharetech-mono-nerd \
    ttf-tinos-nerd ttf-daddytime-mono-nerd \
    ttf-bitstream-vera-mono-nerd ttf-inconsolata-lgc-nerd \
    ttf-inconsolata-go-nerd ttf-iosevkatermslab-nerd \
    ttf-nerd-fonts-symbols-mono \
    otf-firamono-nerd otf-hasklig-nerd otf-hermit-nerd \
    otf-monaspace-nerd otf-codenewroman-nerd otf-comicshanns-nerd \
    otf-commit-mono-nerd otf-droid-nerd otf-geist-mono-nerd \
    otf-opendyslexic-nerd otf-overpass-nerd otf-aurulent-nerd \
    otf-atkinsonhyperlegiblemono-nerd awesome-terminal-fonts

# --- Theme build deps ---
echo "==> Theme dependencies..."
install sassc gtk-engine-murrine gnome-themes-extra

echo ""
echo "==> All apps installed."
echo "==> Now run ./install.sh to apply dotfiles and symlinks."
