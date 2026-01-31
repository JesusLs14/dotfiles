#!/bin/bash
set -e

echo " Instalando dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"

# Crear carpetas base
mkdir -p "$HOME/.config"

# Función para crear symlinks seguros
link() {
  local src=$1
  local dest=$2

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo " $dest ya existe, se omite"
  else
    ln -s "$src" "$dest"
    echo " $dest → $src"
  fi
}

# i3
link "$DOTFILES_DIR/config/i3" "$HOME/.config/i3"

# polybar
link "$DOTFILES_DIR/config/polybar" "$HOME/.config/polybar"

# bash
link "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

# profile
link "$DOTFILES_DIR/profile" "$HOME/.profile"

echo " Dotfiles instalados correctamente"
echo "  Reinicia sesión o recarga i3 (Mod+Shift+R)"
