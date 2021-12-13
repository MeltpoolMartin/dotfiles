#!/usr/bin/env bash

setup_fd() {
    if command -v fd >/dev/null 2>&1; then
        # create symlink https://github.com/sharkdp/fd#on-ubuntu
        mkdir -p ~/.local/bin
        ln -s "$(command -v fdfind)" ~/.local/bin/fd
    fi
}

# Install custom find tool fd
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
    sudo apt update \
    && sudo apt install -y fd-find tree
    setup_fd
elif [[ "$OSTYPE" = "darwin"* ]]; then
    brew install fd tree
    setup_fd
else
    echo "Unsuported OS: ${OSTYPE} - use find instead"
fi
