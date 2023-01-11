
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

## SSH Setup

```
ssh-keygen -q -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
```
 - Note: Add this public key to your IAM user > Security Credential > Upload SSH Key
 - Add ssh config for codecommit
 
`vi ~/.ssh/config`

```
Host git-codecommit.*.amazonaws.com
  User <IAM_SSH_KEY_ID>
  IdentityFile ~/.ssh/gitops
```

```
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent)" && ssh-add ~/.ssh/id_rsa
```
