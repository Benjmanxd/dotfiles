### ENVIRONMENT VARIABLE ###
set fish_greeting
set SHELL /bin/fish
set TERM "xterm-256color"
set VISUAL nvim
set EDITOR nvim
set PATH "/home/benjmanxd/.local/bin:/usr/local/go/bin:/home/benjmanxd/.cargo/bin:/usr/share/dotnet:/home/benjmanxd/Documents/scripts:/home/benjmanxd/.vscode/extensions/redhat.java-1.16.0-linux-x64/jre/17.0.6-linux-x86_64/bin:$PATH"
#set FZF_DEFAULT_OPTS "--height 50% --layout reverse --info inline --preview 'bat --style=numbers --color=always --line-range :500 {}'"
set LANG en_US.UTF-8
set GO111MODULE on
set -Ux GTK_IM_MODULE fcitx
set -Ux QT_IM_MODULE fcitx
set -Ux SDL_IM_MODULE fcitx
set -Ux XMODIFIERS @im=fcitx
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set PASSWORD_STORE_ENABLE_EXTENSIONS true
set PASSWORD_STORE_GENERATED_LENGTH 15
set -Ux HDMI0_BRIGHTNESS $(xrandr --verbose | grep -A 5 HDMI-0 | grep Brightness | cut -f2 -d ' ')
set -Ux DP5_BRIGHTNESS $(xrandr --verbose | grep -A 5 DP-5 | grep Brightness | cut -f2 -d ' ')
set -Ux NEWS_API_KEY 74f07f93e315468298aaf2ee1b3c26e8
set -U XDG_CONFIG_HOME $HOME
set -Ux SSL_CERT_DIR "/etc/ssl/certs"
#set -x MANPAGER "nvim -c 'set ft=man' -"


### ALIAS ###
alias ..="cd .."
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ls="exa -al --color=always --group-directories-first"
alias l="ls"
alias du="ncdu"
alias top="htop"
#alias grep="rg"
#alias cat='bat'
#alias ps='procs'
alias bc='eva'
alias vim="nvim"
alias fetch="git fetch"
alias commit="git commit -m"
alias clone="git clone"
alias addall="git add ."
#alias status="git status"
alias branch="git branch"
alias checkout="git checkout"
alias push="git push origin"
alias pull="git pull origin"
alias fzf-color="fzf --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
alias pacsyu='sudo pacman -Syu'
alias pacsyyu='sudo pacman -Syyu'
alias chrome='google-chrome-stable'
alias notion='notion-app-enhanced'
alias telegram='telegram-desktop'
alias signal='signal-desktop'
alias whatsapp='whatsapp-for-linux'
alias picomdef='picom --backend  glx --experimental-backends &'
#alias 'nordvpn login'='nordvpn login --legacy'
#alias tmux='TERM=screen-256color-bce tmux'
alias logout='openbox --exit'
alias open='thunar'
alias mysql='sudo mysql -u benjmanxd -p'


### FUNCTION ###
# function to set mode
function fish_user_key_bindings
    fish_default_key_bindings
    #fish_vi_key_bindings
end

# Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
        commandline -t $history[1]; commandline -f repaint
        case "*"
        commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
        commandline -t ""
        commandline -f history-token-search-backward
        case "*"
        commandline -i '$'
    end
end

## color theme
#set -U fish_color_normal normal
#set -U fish_color_command b294bb
#set -U fish_color_quote b5bd68
#set -U fish_color_redirection 8abeb7
#set -U fish_color_end b294bb
#set -U fish_color_error cc6666
#set -U fish_color_param 81a2be
#set -U fish_color_comment f0c674
#set -U fish_color_match --background=brblue
#set -U fish_color_selection white --bold --background=brblack
#set -U fish_color_search_match bryellow --background=brblack
#set -U fish_color_history_current --bold
#set -U fish_color_operator 00a6b2
#set -U fish_color_escape 00a6b2
#set -U fish_color_cwd green
#set -U fish_color_cwd_root red
#set -U fish_color_valid_path --underline
#set -U fish_color_autosuggestion 969896
#set -U fish_color_user brgreen
#set -U fish_color_host normal
#set -U fish_color_cancel --reverse
#set -U fish_pager_color_prefix normal --bold --underline
#set -U fish_pager_color_progress brwhite --background=cyan
#set -U fish_pager_color_completion normal
#set -U fish_pager_color_description B3A06D
#set -U fish_pager_color_selected_background --background=brblack
#set -U fish_pager_color_secondary_completion
#set -U fish_pager_color_selected_description
#set -U fish_color_host_remote
#set -U fish_pager_color_selected_completion
#set -U fish_color_keyword
#set -U fish_pager_color_selected_prefix
#set -U fish_color_option
#set -U fish_pager_color_secondary_description
#set -U fish_pager_color_secondary_prefix
#set -U fish_pager_color_secondary_background
#set -U fish_pager_color_background

# key-binding
# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end
bind \cd exit
bind \ca beginning-of-buffer
bind \ce end-of-buffer


# commands
#clear
neofetch
starship init fish | source
zoxide init fish | source

if status is-interactive
    and not set -q TMUX
    exec tmux new-session -A -s main
end
