# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export TERM="xterm-256color"

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# Plugins
plugins=(
    fast-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
)

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
    [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
fi

source $ZSH/oh-my-zsh.sh

# .zprofile for SSH forwarding
[ -f ~/.zprofile ] && source ~/.zprofile

# Common aliases
# [ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh

# Enable fuzzy search and rebind key if it's OSX
# https://stackoverflow.com/a/8597411
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh \
    && [ "$OSTYPE" == "darwin"* ] \
    && bindkey "ç" fzf-cd-widget

# git log --oneline --decorate --graph
# git log --oneline --decorate --graph --all