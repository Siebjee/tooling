#!/usr/bin/env bash

source ${HOME}/.siebjee_tooling

# Set default directory paths
export TOOLING_BIN_DIR="${TOOLING_BASE_DIR}/bin"
export TOOLING_ZSH_DIR="${TOOLING_BASE_DIR}/zsh"

export GPG_TTY=`tty`

source ${TOOLING_ZSH_DIR}/zsh.sh

alias _env_reload="source ${TOOLING_BASE_DIR}/zsh/environment.sh"

# Load additional aliasses
for file in $(find ${TOOLING_ZSH_DIR}/aliasses -type f); do
  source ${file}
done

# Tooling functions. Most of these go in hand with $TOOLING_BIN_DIR
# Load additional functions
for file in $(find ${TOOLING_ZSH_DIR}/functions -maxdepth 1 -type f); do
  source ${file}
done

# Load additional environment variable files
for file in $(find ${TOOLING_ZSH_DIR}/environment -type f \( -iname "*.zsh" -o -iname "*.sh" \)); do
  source ${file}
done

# initialize directory based hooks:
source "${TOOLING_ZSH_DIR}/hooks/_hooks.zsh"

# only add $TOOLING_BIN_DIR to path if it's not there.
if [[ ${PATH} != *"${TOOLING_BIN_DIR}"* ]]; then
  export PATH="${TOOLING_BIN_DIR}:${PATH}"
fi

# Enable docker & kubectl autocomplete
for plugin in ${plugins}; do
  if [ "${plugin}" = "docker" ]; then
    ## Docker autocomplete
    fpath+=($ZSH/plugins/docker)
  fi
  if [ "${plugin}" = "kubectl" ]; then
    ## kubectl autocomplete
    fpath+=($ZSH/plugins/kubectl)
  fi
done
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# add flux autocomplete
if command flux --version > /dev/null 2>&1; then
  . <(flux completion zsh 2>/dev/null)
fi

# add flux autocomplete
if command pyenv --version > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## make pastes fast again
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
