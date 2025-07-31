#!/bin/bash
set -u pipefail

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ "$(uname)" == "Linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi

if [ "$(uname)" == "Darwin" ]; then
    ./.macos
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install pipx
    pipx ensurepath
    sudo pipx ensurepath --global
elif [ "$DISTRO" == 'Ubuntu' ]; then
    sudo apt install net-tools
    sudo apt install dnsutils
    sudo apt install pipx
    pipx ensurepath
    sudo pipx ensurepath --global
fi