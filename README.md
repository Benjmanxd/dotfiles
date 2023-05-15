# dotfiles
display renderer: xorg / x11
display manager: lightdm
window manager: awesomewm
packages:
1. sudo dnf update --security
2. sudo dnf update
3. sudo dnf install @base-x @Fonts awesome lightdm slick-greeter neovim python3-neovim alacritty picom rofi polybar thunar feh wget git git-gui neofetch fzf bat atool htop npm zathura
4. sudo systemctl enable lightdm
5. sudo systemctl set-default graphical.target
6. sudo dnf groupinstall "Development Tools" "Development Libraries" / sudo dnf install make automake gcc gcc-c++ kernel-devel

symlink:
ln $PWD/bash/bashrc $HOME/.bashrc                               # bash
ln $PWD/starship/starship.toml $HOME/.config/starship.toml      # starship
ln $PWD/tmux/tmux.conf $HOME/.tmux.conf                         # tmux
ln $PWD/fonts/fonts.conf $HOME/.fonts.conf                      # fonts
ln $PWD/picom/picom.conf $HOME/.config/picom.conf               # picom
ln -s $PWD/nvim $HOME/.config/nvim                              # nvim
ln -s $PWD/fish $HOME/.config/fish                              # fish
ln -s $PWD/dunst $HOME/.config/dunst                            # dunst
ln -s $PWD/scripts $HOME/.config/scripts                        # scripts
ln -s $PWD/awesome $HOME/.config/awesome

nvim:
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
setup ChatGPT for nvim later: https://github.com/jackMort/ChatGPT.nvim

tmux:
sudo dnf install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
prefix + I to install tpm plugins
todo: transparent tmux status bar

starship:
curl -sS https://starship.rs/install.sh | sh

fonts:
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip && aunpack JetBrainsMono.zip && rm JetBrainsMono.zip && cd -

password-store:
gpg --output pass-public.pgp --armor --export Benjmanxd
gpg --output pass-private.pgp --armor --export-secret-key Benjmanxd
sudo dnf install pass pinentry
git clone git@github.com:Benjmanxd/password-store.git ~/.password-store
gpg --batch --import pass-private.pgp pass-public.pgp
pkill gpg-agent
gpg-agent --pinentry-program=/usr/bin/pinentry --daemon

i3lock-color (todo):
sudo dnf install -y autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh
./install-i3lock-color.sh

music player (todo):
sudo dnf install mopidy-spotify
refer to: https://blog.deepjyoti30.dev/using-spotify-with-ncmpcpp-mopidy-linux
