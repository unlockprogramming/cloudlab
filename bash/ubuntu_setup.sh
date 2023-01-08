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
  wget \
  make

### python setup ------------------------------------------------------
sudo apt install -y python3-pip python3-dev

### BEGIN: common setup ------------------------------------------------------

### virtualenv setup ------------------------------------------------------
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
virtualenv --version

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

### END: common setup ------------------------------------------------------

### terraform setup ------------------------------------------------------
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform version

### jq setup ------------------------------------------------------
sudo apt-get install jq -y
jq --version

### nfs setup ------------------------------------------------------
sudo apt install nfs-common nfs-kernel-server -y

### go setup ------------------------------------------------------
curl -L https://dl.google.com/go/go1.18.9.linux-amd64.tar.gz >/tmp/go1.18.9.linux-amd64.tar.gz
tar -xf /tmp/go1.18.9.linux-amd64.tar.gz -C $HOME
echo -e "export GOROOT=\"\$HOME/go\"" | tee -a ~/.bashrc
echo -e "export PATH=\"\$HOME/go:\$PATH\"" | tee -a ~/.bashrc
go version

### docker setup ------------------------------------------------------
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker "$USER"
