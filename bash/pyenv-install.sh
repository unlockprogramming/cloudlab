#!/bin/bash

required_version=$1
requirements_txt=${2:-requirements.txt}
if [ -z "$required_version" ]
  then
    echo "No 1st argument as required_version"
    echo "Usage: curl https://raw.githubusercontent.com/unlockprogramming/cloudlab/main/bash/pyenv-install.sh | bash -s -- 3.7.12"
    exit 1
fi

pyenv_sh_rc_shell() {
  rm -rf .pyenvshrc
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >>.pyenvshrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>.pyenvshrc
  echo 'eval "$(pyenv init -)"' >>.pyenvshrc  
}

pyenv_required_version() {
    pyenv local "$required_version"
    pyenv local "$required_version"
}

pip_venv() {
  python -m pip install --user virtualenv
  python -m pip install --upgrade pip

  virtualenv .venv
  source .venv/bin/activate
}

pyenv_sh_rc_shell

source .pyenvshrc
if ! [ -x "$(command -v pyenv)" ]; then
  echo 'Error: pyenv is not installed.' >&2
  echo "source .pyenvshrc"
  curl https://pyenv.run | bash
fi
source .pyenvshrc

pyenv_required_version
pip_venv
pip install -r $requirements_txt
