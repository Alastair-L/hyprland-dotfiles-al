#!/usr/bin/env bash

dotfiles_home="$HOME/hyprland-dotfiles-al/home"

all_configs=(
  bat
  bash
  doom
  dunst
  fastfetch
  ghostty
  git
  helix
  hypr
  hyprpanel
  kanata
  kitty
  mpv
  nvim
  playerctl
  posting
  qBittorrent
  qutebrowser
  rofi
  screenshots
  scripts
  tmux
  waybar
  waypaper
  yazi
  zathura
  zed
  zsh

  mimeapps.list
)


current_configs=(
  hypr
  rofi
  scripts
  waybar
  qutebrowser
  zsh

  fastfetch

  dunst

  scripts
  git
  mimeapps.list
)

# mapfile -t delete_configs < <(
#   comm -23 <(echo "${all_configs[@]}" | tr ' ' '\n' | sort) \
#            <(echo "${current_configs[@]}" | tr ' ' '\n' | sort)
# )


#######################################
# 1. Clear out configs iff they are symlinks
#######################################
for cfg in "${all_configs[@]}"; do
  target="$XDG_CONFIG_HOME/$cfg"

  if [[ -L "$target" ]]; then
    echo "Removing symlink: $target"
    rm "$target"
  fi
done

#######################################
# 2. Recreate symlinks from dotfiles
#######################################
for cfg in "${current_configs[@]}"; do
  src="$dotfiles_home/.config/$cfg"
  dst="$XDG_CONFIG_HOME/$cfg"

  if [[ ! -e "$src" ]]; then
    echo "Warning: source does not exist, skipping: $src"
    continue
  fi
  
  echo "Linking: $dst → $src"
  ln -sT "$src" "$dst"
done

ln -sT "$XDG_CONFIG_HOME/zsh/.zshrc" "$HOME/.zshrc"