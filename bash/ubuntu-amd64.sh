#!/bin/bash

set -e

mkdir -p /tmp/tools
cd /tmp/tools

### zsh plugins ------------------------------------------------------

rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#sed -i 's/_THEME=\"robbyrussell\"/_THEME=\"passion\"/g' ~/.zshrc
sed -i 's/plugins=(/plugins=(zsh-autosuggestions kubectl /g' ~/.zshrc
echo -e "export PATH=\"\$HOME/.local/bin:\$HOME/bin:/usr/local/bin:\$PATH\"" | tee -a ~/.zshrc

source ~/.zshrc

### apt packages ------------------------------------------------------
sudo apt update && sudo apt -y upgrade && sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y \
  mercurial \
  make \
  binutils \
  bison \
  gcc \
  build-essential \
  ca-certificates \
  curl \
  git \
  uidmap \
  unzip \
  zip \
  wget \
  make

### python setup ------------------------------------------------------
sudo apt install -y python3-pip python3-dev

### virtualenv setup ------------------------------------------------------
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
virtualenv --version

### pyenv setup ------------------------------------------------------
rm -rf ~/.pyenv
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# source ~/.zshrc
# pyenv --version

### sdkman setup ------------------------------------------------------
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
# source ~/.zshrc
# sdk version

### aws setup ------------------------------------------------------
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -qq awscliv2.zip
sudo ./aws/install --update
rm -rf ./awscli-bundle ./aws
rm -rf awscliv2.zip
aws --version

### aws-iam-authenticator setup ------------------------------------------------------
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/
aws-iam-authenticator version

### kubectl setup ------------------------------------------------------
curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/
kubectl version --client

### k9s setup ------------------------------------------------------
curl -L https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz >k9s_Linux_x86_64.tar.gz
tar -xvf k9s_Linux_x86_64.tar.gz
chmod +x k9s
sudo mv ./k9s /usr/local/bin/
rm -rf k9s_Linux_x86_64.tar.gz LICENSE README.md
k9s version

### helm setup ------------------------------------------------------
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash -s -- -v v3.8.2
helm version

### mc client setup ------------------------------------------------------
curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o mc
chmod +x mc
sudo mv ./mc /usr/local/bin/
mc ls

### terraform setup ------------------------------------------------------
curl "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip" -o "terraform_1.3.7_linux_amd64.zip"
unzip -qq terraform_1.3.7_linux_amd64.zip
chmod +x terraform
sudo mv ./terraform /usr/local/bin/
terraform version

### jq setup ------------------------------------------------------
sudo apt-get install jq -y
jq --version

### yq setup ------------------------------------------------------
sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
sudo chmod a+x /usr/local/bin/yq
yq --version

### nvm setup ------------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

### nfs setup ------------------------------------------------------
sudo apt install nfs-common nfs-kernel-server -y

### go setup ------------------------------------------------------
rm -rf $HOME/go
curl -L https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz >/tmp/go1.19.4.linux-amd64.tar.gz
tar -xf /tmp/go1.19.4.linux-amd64.tar.gz -C $HOME
echo -e "export GOROOT=\"\$HOME/go\"" | tee -a ~/.zshrc
echo -e "export PATH=\"\$HOME/go/bin:\$PATH\"" | tee -a ~/.zshrc
# source ~/.zshrc
# go version

### tilt setup ------------------------------------------------------
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
tilt version

### ctop setup ------------------------------------------------------
sudo wget -qO /usr/local/bin/ctop https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64
sudo chmod a+x /usr/local/bin/ctop

### docker setup ------------------------------------------------------
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sudo sh ./get-docker.sh
sudo groupadd docker || true
sudo usermod -aG docker $USER

echo "Rebooting System..."
sudo reboot
