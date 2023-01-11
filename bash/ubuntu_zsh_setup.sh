#!/bin/sh

set -e

mkdir -p /tmp/tools
cd /tmp/tools

if ! [ -x "$(command -v zsh)" ]; then

## curl & zsh ------------------------------------------------------

sudo apt-get install -y curl zsh git

## zsh ------------------------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi

