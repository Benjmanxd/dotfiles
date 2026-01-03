{ config, lib, pkgs, ... } :
{
  imports = [
    ./modules/spicetify.nix
  ];

  home.stateVersion = "25.05";
  home.username = "benjmanxd";
  home.homeDirectory = "/home/benjmanxd";
  home.keyboard.layout = lib.mkForce "us";
  home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # terminal
    alacritty
    zsh
    git
    neovim
    tmux
    tree
    tldr
    atool
    bat
    fzf
    htop
    btop
    neofetch
    wmctrl
    xdotool
    ripgrep
    killall
    pass
    rofi-pass
    gnupg
    pinentry-gtk2
    playerctl
    xdo
    xsettingsd
    brightnessctl
    stalonetray
    ffmpeg
    unzip
    coreutils-full
    pciutils
    cava
    sxhkd
    xclip
    ncdu
    starship
    lsof
    strace
    ltrace
    luajitPackages.luarocks

    # programming
    gnumake
    cmake
    nodejs
    tree-sitter
    gcc
    clang-tools
    rustc
    cargo
    go
    perf-tools
    conda

    # application
    polkit
    openbox
    openbox-menu
    picom
    rofi
    polybar
    feh
    dunst
    slack
    discord
    brave
    gimp
    zathura
    xfce.thunar
    zscroll
    betterlockscreen
    telegram-desktop
    whatsapp-for-linux
    signal-desktop
    notion-app-enhanced
    vlc
    gpick
    flameshot
    anydesk
    wineWowPackages.stable
    qalculate-qt

    # virtualization
    virt-manager
    qemu_full
    libvirt
    # vagrant
    podman
    podman-compose

    # fonts
    jetbrains-mono
    cascadia-code
    nerd-fonts.fira-code
    source-han-sans
    source-han-serif
    source-han-mono

    # audio
    pavucontrol
    jack2
    qjackctl
    jack_capture
    pulseaudio

    # others
    xorg.xbacklight
    ksuperkey

    # python
    (python311.withPackages (ppkgs: [
      ppkgs.pip
      ppkgs.numpy
      ppkgs.pytest
    ]))
  ];

  programs.git = {
    enable = true;
    userName = "Benjmanxd";
    userEmail = "benjaminchoi00@gmail.com";
  };

  programs.zsh = {
    enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;
    initContent = "
# source ~/.config/assets/theme/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents \"\${pkgs.stdenv.cc}/nix-support/dynamic-linker\"; in NIX_LD')
export HOME_CONF=/etc/nixos/
export PATH=\"$HOME/dotfiles/assets/bin/helpers:$HOME/bin/:$PATH\"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
neofetch
    ";
    shellAliases = {
      ll = "ls -l";
      update-packages = "cd $HOME_CONF && sudo nix-channel --update && sudo nixos-rebuild switch --upgrade --flake .#Main && cd -";
      update-full-system = "cd $HOME_CONF && sudo nixos-rebuild switch --recreate-lock-file --flake .#Main && cd -";
      update-config = "cd $HOME_CONF && sudo nixos-rebuild switch --flake .#Main && cd -";
      gen-del = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d";
      gen-list = "nix profile history --profile /nix/var/nix/profiles/system";
      cache-del = "nix-collect-garbage -d";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "pass" "man" "fzf" "vagrant" "tmux" "vi-mode" ]; #podman
    };
  };
  programs.starship.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-mozc
      fcitx5-hangul
      fcitx5-m17n
      fcitx5-gtk
      fcitx5-chinese-addons
      fcitx5-table-extra
      fcitx5-chewing
    ];
  };
  fonts.fontconfig.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
