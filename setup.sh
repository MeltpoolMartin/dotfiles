#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "##################################################"
echo "Setup dotfiles"
echo "##################################################"

echo "Install oh-my-zsh plugins"
[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting" ] && git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
echo "##################################################"
echo ""

echo "Install Tmux plugins"
[ ! -d "$HOME/.tmux/plugins/tpm" ] && git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "##################################################"
echo ""

echo "Install FZF"
if [ ! -d "$HOME/.fzf" ];then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-update-rc
    ./fzf/install-fzf.sh
fi
echo "##################################################"
echo ""

echo "##################################################"
echo "Update dotfiles symlinks"
[ -f "$HOME/.zshrc" ] && rm ~/.zshrc && echo "Removed ~/.zshrc"
[ -f "$HOME/.zprofile" ] && rm ~/.zprofile && echo "Removed ~/.zprofile"
[ -f "$HOME/.p10k.zsh" ] && rm ~/.p10k.zsh && echo "Removed ~/.p10k.zsh"
[ -f "$HOME/.tmux.conf" ] && rm ~/.tmux.conf && echo "Removed ~/.tmux.conf"
"${SCRIPT_DIR}"/install
echo "##################################################"
echo "Setup complete"

exit 0
