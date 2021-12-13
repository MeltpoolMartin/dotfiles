#!/usr/bin/env zsh
# Customized settings for fzf

# Rebind change dir widget to ctrl + f
bindkey "\C-f" fzf-cd-widget

setup_fd() {
    export PATH="~/.local/bin:$PATH"
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

    export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
}

setup_find() {
    export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"
}

# Set find tool for fzf
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
    setup_fd
elif [[ "$OSTYPE" = "darwin"* ]]; then
    setup_fd
else
    echo "Unsuported OS: ${OSTYPE} - use find instead"
    setup_find
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
