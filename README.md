# dotfiles

## System details
- operating system:   NixOS 24.11
- display renderer:   xorg / x11
- display manager:    NOPE!!
- window manager:     openbox
- terminal emulator:  alacritty
- file manager:       thunar
- editor:             nvim
- compositor:         picom
- web browser:        brave
- shell:              zsh

## Installation details

symlink:
```zsh
ln $PWD/starship/starship.toml $HOME/.config/starship.toml    # starship
ln $PWD/tmux/tmux.conf $HOME/.tmux.conf                       # tmux
ln $PWD/fonts/fonts.conf $HOME/.fonts.conf                    # fonts
ln $PWD/picom/picom.conf $HOME/.config/picom.conf             # picom
ln $PWD/zsh/.zshrc $HOME/.zshrc                               # zsh
ln -s $PWD/nvim $HOME/.config/nvim                            # nvim
ln -s $PWD/alacritty $HOME/.config/alacritty                  # alacritty
ln -s $PWD/dunst $HOME/.config/dunst                          # dunst
ln -s $PWD/assets $HOME/.config/assets                        # assets
ln -s $PWD/nixos /etc/nixos                                   # nixos
```

nvim:
```
wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage   # install binary
./nvim.appimage --appimage-extract                                              # if system don't have FUSE
```
- setup ChatGPT for nvim later: https://github.com/jackMort/ChatGPT.nvim

tmux:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
prefix + I to install tpm plugins
```

starship:
```
curl -sS https://starship.rs/install.sh | sh
```

fonts:
```
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip && aunpack JetBrainsMono.zip && rm JetBrainsMono.zip && cd -
```

password-store:
```
gpg --output pass-public.pgp --armor --export Benjmanxd
gpg --output pass-private.pgp --armor --export-secret-key Benjmanxd
sudo dnf install pass pinentry
git clone git@github.com:Benjmanxd/password-store.git ~/.password-store
gpg --batch --import pass-private.pgp pass-public.pgp
pkill gpg-agent
gpg-agent --pinentry-program=/usr/bin/pinentry --daemon
```
