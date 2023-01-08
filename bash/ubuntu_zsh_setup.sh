#!/bin/bash

set -e

mkdir -p /tmp/tools
cd /tmp/tools

## curl & zsh ------------------------------------------------------

sudo apt-get install -y curl zsh git

## zsh ------------------------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
