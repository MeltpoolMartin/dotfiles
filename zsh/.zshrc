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
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="agnoster"

# if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
#     [ -f ~/.config/shell/powerlevel2k.zsh ] && source ~/.config/shell/powerlevel2k.zsh
# fi

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh

# Common aliases
# [ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh
