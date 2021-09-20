#!/usr/bin/env bash

TOOLING_BASE_DIR="${HOME}/projects/personal/tooling"
TOOLING_BIN_DIR="${HOME}/projects/personal/tooling/bin"
TOOLING_ZSH_DIR="${HOME}/projects/personal/tooling/zsh"

alias _env_reload="source ${TOOLING_BASE_DIR}/zsh/environment.sh"

# Load additional aliasses
for file in $(find ${TOOLING_ZSH_DIR}/aliasses -type f); do
  echo source ${file}
done

# Tooling functions. Most of these go in hand with $TOOLING_BIN_DIR
source ${TOOLING_ZSH_DIR}/functions/kubernetes.sh

# initialize directory based hooks:
source "${TOOLING_ZSH_DIR}/hooks/_hook.zsh"

export PATH="${PATH}:${TOOLING_BIN_DIR}"
