#!/usr/bin/env bash
set -euo pipefail

DOTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing Gruvbox GNOME dotfiles from $DOTS"

# --- Dependencies ---
echo "==> Installing dependencies..."
sudo pacman -S --noconfirm --needed sassc gtk-engine-murrine gnome-themes-extra git fish fastfetch alacritty starship

# --- Directories ---
mkdir -p ~/.config ~/.themes ~/.local/share/gnome-shell/extensions ~/.local/share/backgrounds ~/.local/share/fonts

# --- Symlinks ---
echo "==> Creating symlinks..."

symlink() {
    local src="$1" dst="$2"
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        mv "$dst" "${dst}.bak"
        echo "  Backed up existing $dst -> ${dst}.bak"
    fi
    ln -s "$src" "$dst"
    echo "  $dst -> $src"
}

# GNOME
symlink "$DOTS/config/gtk-3.0"                  ~/.config/gtk-3.0
symlink "$DOTS/config/gtk-4.0"                  ~/.config/gtk-4.0
symlink "$DOTS/extensions"                       ~/.local/share/gnome-shell/extensions
symlink "$DOTS/themes/Gruvbox-Dark"             ~/.themes/Gruvbox-Dark
symlink "$DOTS/backgrounds"                      ~/.local/share/backgrounds
symlink "$DOTS/fonts"                            ~/.local/share/fonts

# Terminals & shell
symlink "$DOTS/config/fish"                     ~/.config/fish
symlink "$DOTS/config/ghostty"                  ~/.config/ghostty
symlink "$DOTS/config/fastfetch"                ~/.config/fastfetch
symlink "$DOTS/config/alacritty"                ~/.config/alacritty
symlink "$DOTS/config/starship.toml"            ~/.config/starship.toml

# --- dconf settings ---
echo "==> Applying dconf settings..."
dconf load / < "$DOTS/dconf/gnome-settings.dconf"

echo ""
echo "Done. Log out and back in for all changes to take effect."
