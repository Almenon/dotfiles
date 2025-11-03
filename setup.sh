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

mkdir -p ~/.local/share/Trash

if [ "$(uname)" == "Darwin" ]; then
    ./.macos

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install cheat
    brew install pipx
    pipx ensurepath
    sudo pipx ensurepath

    # for pyenv
    brew install openssl readline sqlite3 xz tcl-tk@8 libb2 zstd zlib pkgconfig
elif [ "$DISTRO" == 'Ubuntu' ]; then
    # if not on linux i prioritize not using brew
    # as I find other tools to be more reliable
    sudo apt install net-tools
    sudo apt install dnsutils
    sudo apt install python-pip
    sudo apt install pipx
    sudo apt install unzip
    sudo apt install zsh
    pipx ensurepath
    sudo pipx ensurepath

    # for pyenv
    sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl git \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi

if ! command -v aws 2>&1 >/dev/null
then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
else
    echo "skipping aws, already installed"
fi

if ! command -v pyenv 2>&1 >/dev/null
then
    curl -fsSL https://pyenv.run | bash
else
    echo "Skipping pyenv, already installed"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"