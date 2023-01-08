#!/bin/bash

set -e

mkdir -p /tmp/tools
cd /tmp/tools

# curl & zsh ------------------------------------------------------

```bash
sudo apt install curl zsh git -y
```

## zsh ------------------------------------------------------
sh -c "$(echo y | curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
