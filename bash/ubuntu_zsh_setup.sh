#!/bin/bash

set -e

mkdir -p /tmp/tools
cd /tmp/tools

## curl & zsh ------------------------------------------------------

sudo apt-get install -y curl zsh git

## zsh ------------------------------------------------------
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exit
