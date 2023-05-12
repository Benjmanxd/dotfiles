# dotfiles
display renderer: xorg / x11
display manager: lightdm
window manager: awesomewm
packages:
1. sudo dnf update --security
2. sudo dnf update
3. sudo dnf install @base-x @Fonts awesome lightdm slick-greeter neovim python3-neovim alacritty picom rofi polybar thunar feh wget git neofetch fzf bat atool
4. sudo systemctl enable lightdm
5. sudo systemctl set-default graphical.target
6. sudo dnf groupinstall "Development Tools" "Development Libraries" / sudo dnf install make automake gcc gcc-c++ kernel-devel

symlink:
ln $PWD/bash/bashrc ~/.bashrc                               # bash
ln $PWD/starship/starship.toml ~/.config/starship.toml      # starship
ln $PWD/tmux/tmux.conf ~/.tmux.conf                         # tmux
ln $PWD/fonts/fonts.conf ~/.fonts.conf                      # fonts
ln $PWD/picom/picom.conf ~/.config/picom.conf               # picom
ln -s $PWD/nvim ~/.config/nvim                              # nvim
ln -s $PWD/fish ~/.config/fish                              # fish
ln -s $PWD/dunst ~/.config/dunst                            # dunst
ln -s $PWD/scripts ~/.config/scripts                        # scripts

tmux:
sudo dnf install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
prefix + I to install tpm plugins

starship:
curl -sS https://starship.rs/install.sh | sh

fonts:
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip && aunpack JetBrainsMono.zip && rm JetBrainsMono.zip && cd -

password-store:
sudo dnf install pass pinentry
git clone git@github.com:Benjmanxd/password-store.git ~/.password-store
gpg --batch --import private.pgp public.pgp
pkill gpg-agent
gpg-agent --pinentry-program=/usr/bin/pinentry --daemon
