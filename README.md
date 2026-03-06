# Gruvbox GNOME Dotfiles

Gruvbox GTK theme setup for GNOME with extensions, backgrounds, and terminal configs.

## Theme Settings
- Color scheme: Hard (default)
- Style: Borderless windows, macOS buttons, floating panel, 2px outline (shell/dash)

## Extensions
- openbar
- vertical-workspaces
- dash2dock-lite
- appindicatorsupport
- clipboard-history
- gTile
- monitor (Astra Monitor)
- gsconnect

---

## Fresh Install

### Step 1 — Clone the repo

```sh
git clone git@github.com:idunkoncode/Gnome-dotfiles.git
cd Gnome-dotfiles
```

### Step 2 — Install all apps

Installs everything: GNOME tools, terminals, browsers, editors, dev tools, media, fonts, and more.

```sh
bash apps-install.sh
```

### Step 3 — Apply dotfiles and symlinks

Symlinks all configs into place and restores GNOME settings via dconf.

```sh
bash install.sh
```

### Step 4 — Log out and back in

Some GTK4 and shell changes need a session restart to fully apply.

---

## What gets symlinked

| Config | Location |
|--------|----------|
| GTK 3 | `~/.config/gtk-3.0` |
| GTK 4 | `~/.config/gtk-4.0` |
| Fish | `~/.config/fish` |
| Nushell | `~/.config/nushell` |
| Ghostty | `~/.config/ghostty` |
| Alacritty | `~/.config/alacritty` |
| Fastfetch | `~/.config/fastfetch` |
| Starship | `~/.config/starship.toml` |
| Extensions | `~/.local/share/gnome-shell/extensions` |
| Backgrounds | `~/.local/share/backgrounds` |
| Fonts | `~/.local/share/fonts` |
| Theme | `~/.themes/Gruvbox-Dark` |

---

## Keeping in sync

After making any config change, commit and push:

```sh
cd /path/to/Gnome-dotfiles
git add -A
git commit -m "your message"
git push github main && git push gitlab main && git push codeberg main
```

---

## Remotes
- GitHub:   https://github.com/idunkoncode/Gnome-dotfiles
- GitLab:   https://gitlab.com/idunkoncode/Gnome-dotfiles
- Codeberg: https://codeberg.org/idunkoncode/Gnome-dotfiles
