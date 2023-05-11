# dotfiles
display renderer: xorg / x11
display manager: lightdm
window manager: awesomewm
packages:
1. sudo dnf update --security
2. sudo dnf update
3. sudo dnf install @base-x @Fonts awesome lightdm slick-greeter neovim python3-neovim alacritty picom rofi polybar thunar feh wget git neofetch
4. sudo systemctl enable lightdm
5. sudo systemctl set-default graphical.target
6. sudo dnf groupinstall "Development Tools" "Development Libraries" / sudo dnf install make automake gcc gcc-c++ kernel-devel

symlink:
ln -s $PWD/nvim ~/.config/nvim                              # nvim
ln $PWD/bash/.bashrc ~/.bashrc                              # bash
ln $PWD/starship/starship.toml ~/.config/starship.toml      # starship

tmux:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
prefix + I to install tpm plugins

starship:
curl -sS https://starship.rs/install.sh | sh
