#!/bin/bash

set -e

helm plugin install https://github.com/nikhilsbhat/helm-images || true

get_helm_charts_images() {

  for row in $($1 | jq -r '.[] | .name + ";" + .namespace + ";" + .chart'); do
    release_name=$(echo "$row" | awk -F';' '{print $1}')
    namespace=$(echo "$row" | awk -F';' '{print $2}')
    helm images get "$release_name" -n "$namespace" --from-release | sort | uniq >>"$log_file"
  done

}

log_file=containers.log
json_file=containers_json.log

rm -rf "$log_file"
rm -rf "$json_file"

get_helm_charts_images "helm list --all-namespaces -o json"
get_helm_charts_images "helm list --all-namespaces --pending -o json"

echo "{" >>"$json_file"
cat "$log_file" | sort | uniq | awk '{ print "\""$1"\"""," }' >>"$json_file"
echo "\"-------\"" >>"$json_file"
echo "}" >>"$json_file"
cat "$json_file"

rm -rf "$log_file"
rm -rf "$json_file"
