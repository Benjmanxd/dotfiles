bindkey -s '^e' 'vim $(fzf)\n'

eval "$(starship init zsh)"

source $HOME/.config/scripts/pass.zsh-completion
source $HOME/.config/scripts/tmux.completion
source $HOME/.config/scripts/git-completion.bash
