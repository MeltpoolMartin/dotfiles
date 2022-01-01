#!/usr/bin/env bash
# Customized settings for fzf

# Rebind change dir widget to ctrl + f
bindkey "\C-f" fzf-cd-widget

export PATH="$HOME/.local/bin:$PATH"

setup_fd() {
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}' \
      --bind shift-up:preview-page-up,shift-down:preview-page-down"

    export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
    export FZF_ALT_C_OPTS="--preview 'tree -CL 2 {}'"
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

# -----------------------------------------------------------------------------
# git scripts with FZF
# -----------------------------------------------------------------------------
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

# git files
_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' \
    --bind shift-up:preview-page-up,shift-down:preview-page-down |
  cut -c4- | sed 's/.* -> //'
}

# git branches
_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# git tags
_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
}

# git hashes
_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

# git remotes
_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r h s
unset -f bind-git-helper

# -----------------------------------------------------------------------------
# general scripts with FZF
# -----------------------------------------------------------------------------
