#!/usr/bin/env bash
# Author: Hsuan

image_name="hsuan.cloud/hsuan/sentinel-dashboard"
image_tag="1.7.2"

action=${1-}

function build() {
    echo -e "\033[42;37mBuild Image: ${image_name}:${image_tag} Start\033[0m"
    docker build -t ${image_name}:${image_tag} .
    echo -e "\033[42;37mBuild Image: ${image_name}:${image_tag} End\033[0m"
}

function push() {
    echo -e "\033[42;37mPush Image: ${image_name}:${image_tag} Start\033[0m"
    docker push ${image_name}:${image_tag}
    echo -e "\033[42;37mPush Image: ${image_name}:${image_tag} End\033[0m"
}

function main() {
  case "${action}" in
  build)
    build
    ;;
  push)
    push
    ;;
  *)
    build
    push
    ;;
  esac
}

main "$@"
