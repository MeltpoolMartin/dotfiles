#!/bin/bash

setup_fd() {
    command -v fd >/dev/null 2>&1
    if [[ $? -ne "0" ]]; then
        # create symlink https://github.com/sharkdp/fd#on-ubuntu
        mkdir -p ~/.local/bin
        ln -s $(which fdfind) ~/.local/bin/fd
    fi
}

# Install custom find tool fd
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
    sudo apt update \
    && sudo apt install fd-find
    setup_fd
elif [[ "$OSTYPE" = "darwin"* ]]; then
    brew install fd
    setup_fd
else
    echo "Unsuported OS: ${OSTYPE} - use find instead"
fi