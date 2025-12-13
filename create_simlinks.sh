
dotfiles_home=~/hyprland-dotfiles-al/home


# Desktop
ln -sT "$dotfiles_home"/.config/hypr ~/.config/hypr
ln -sT "$dotfiles_home"/.config/waybar ~/.config/waybar


# Terminal
ln -sT "$dotfiles_home"/.config/alacritty ~/.config/alacritty
ln -sT "$dotfiles_home"/.config/bash ~/.config/bash
ln -sT "$dotfiles_home"/.config/zsh ~/.config/zsh
ln -sT "$dotfiles_home"/.config/shell.env ~/.config/shell.env
ln -sT "$dotfiles_home"/.config/starship ~/.config/starship



# Low risk
ln -sT "$dotfiles_home"/.config/fastfetch ~/.config/fastfetch
