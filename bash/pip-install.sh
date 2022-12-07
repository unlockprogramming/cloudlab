#!/bin/bash

set -e

pip_install_config="pip_install.json"

exec_pip_install() {
  for row in $(jq -c '.dependencies | map(.) | .[]' "$pip_install_config"); do
    _jq() {
      echo "${row}" | jq -r "${1}"
    }
    requirements_txt=$(_jq '.')
    printf "\n-------\n"
    echo "requirements_txt = $requirements_txt"
    pip install --no-cache-dir -r "$requirements_txt"
    printf "\n-------\n"
  done

  for row in $(jq -c '.packages | map(.) | .[]' "$pip_install_config"); do
    _jq() {
      echo "${row}" | jq -r "${1}"
    }
    package_base_path=$(_jq '.')
    printf "\n-------\n"
    echo "package_base_path = $package_base_path"
    pip install --editable "$package_base_path"
    printf "\n-------\n"
  done
}

if [ ! -f "$pip_install_config" ]; then
  echo "Missing file: $pip_install_config"
  cat <<EOT >>"$pip_install_config"
{
  "dependencies": [
    "xyz/requirements.txt"
  ],
  "packages": [
    "xyz/abc"
  ]
}
EOT
  echo "Config file generated: $pip_install_config"
  echo "Fix config file: $pip_install_config"
  echo "Retry: curl https://raw.githubusercontent.com/unlockprogramming/cloudlab/main/bash/pip-install.sh | bash"
else
  exec_pip_install
fi
