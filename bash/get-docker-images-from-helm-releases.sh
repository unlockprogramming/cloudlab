#!/bin/bash

set -e

helm plugin install https://github.com/nikhilsbhat/helm-images || true

get_helm_charts_images() {

  for row in $(helm list --all-namespaces -o json | jq -r '.[] | .name + ";" + .namespace + ";" + .chart'); do
    release_name=$(echo "$row" | awk -F';' '{print $1}')
    namespace=$(echo "$row" | awk -F';' '{print $2}')
    chart=$(echo "$row" | awk -F';' '{print $3}')
    echo ""
    echo "-------------------------------------------------------------------------------------"
    echo "release => $chart | $release_name | $namespace"
    echo "-------------------------------------------------------------------------------------"
    helm images get "$release_name" -n "$namespace" --from-release | sort | uniq
  done

}

get_helm_charts_images "helm list --all-namespaces -o json"
get_helm_charts_images "helm list --all-namespaces --pending -o json"
