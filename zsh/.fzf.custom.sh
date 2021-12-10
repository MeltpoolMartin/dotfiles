# Customized settings for fzf

# Rebind change dir widget to ctrl + f
bindkey "\C-f" fzf-cd-widget

export FZF_CTRL_T_COMMAND="find . -type f"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
