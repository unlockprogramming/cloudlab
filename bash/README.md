
## Ubuntu
* Ubuntu `zsh`

```sh
sudo apt-get install curl -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/unlockprogramming/cloudlab/main/bash/ubuntu_zsh.sh)"
```

* Ubuntu `Arm64`

```zsh
curl https://raw.githubusercontent.com/unlockprogramming/cloudlab/main/bash/ubuntu-arm64.sh | zsh
```

* Ubuntu `Amd64`

```zsh
curl https://raw.githubusercontent.com/unlockprogramming/cloudlab/main/bash/ubuntu-amd64.sh | zsh
```

* Verifiying tools

```zsh
aws --version && \
go version && \
pyenv --version && \
nvm ls && \
sdk version
```
