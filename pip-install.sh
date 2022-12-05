#!/bin/bash

set -e

#
#{
#  "dependencies": [
#    "xyz/requirements.txt"
#  ],
#  "packages": [
#    "xyz/abc"
#  ]
#}

for row in $(jq -c '.dependencies | map(.) | .[]' pip_install.json); do
  _jq() {
    echo "${row}" | jq -r "${1}"
  }
  requirements_txt=$(_jq '.')
  printf "\n-------\n"
  echo "requirements_txt = $requirements_txt"
  pip install --no-cache-dir -r "$requirements_txt"
  printf "\n-------\n"
done

for row in $(jq -c '.packages | map(.) | .[]' pip_install.json); do
  _jq() {
    echo "${row}" | jq -r "${1}"
  }
  package_base_path=$(_jq '.')
  printf "\n-------\n"
  echo "package_base_path = $package_base_path"
  pip install --editable "$package_base_path"
  printf "\n-------\n"
done
