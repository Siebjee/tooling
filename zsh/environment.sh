#!/usr/bin/env bash
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

source ${HOME}/.siebjee_tooling

# Set default directory paths
export TOOLING_BIN_DIR="${TOOLING_BASE_DIR}/bin"
export TOOLING_ZSH_DIR="${TOOLING_BASE_DIR}/zsh"
export KUBECONFORM_DIR="${TOOLING_BASE_DIR}/.kubeconform"

export YAMLLINT_CONFIG_FILE="${TOOLING_BASE_DIR}/.yamllint"

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

# add flux autocomplete
if command flux --version > /dev/null 2>&1; then
  . <(flux completion zsh 2>/dev/null)
fi

# add pyenv autocomplete
if command pyenv --version > /dev/null 2>&1; then
  export PYTHON_CONFIGURE_OPTS="--enable-framework"
  eval "$(pyenv init -)"
fi

# add argo autocomplete
if command argo --version > /dev/null 2>&1; then
  . <(argo completion zsh 2>/dev/null)
fi

# add helm autocomplete
if command helm --version > /dev/null 2>&1; then
  . <(helm completion zsh 2>/dev/null)
fi

if test -d ~/.nvm; then
  export NVM_DIR="$HOME/.nvm"
  if [[ ${PATH} != *".npm-global/bin"* ]]; then
    export PATH="~/.npm-global/bin:${PATH}"
  fi
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# only add $TOOLING_BIN_DIR to path if it's not there.
if [[ ${PATH} != *"${TOOLING_BIN_DIR}"* ]]; then
  export PATH="${TOOLING_BIN_DIR}:${PATH}"
else
  # this makes sure that ${TOOLING_BIN_DIR} is early in the path
  export PATH="${TOOLING_BIN_DIR}:${PATH/${TOOLING_BIN_DIR}:/}"
fi

unset LS_COLORS

if command chromium --version > /dev/null 2>&1; then
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
  export PUPPETEER_EXECUTABLE_PATH=$(which chromium)
fi

## make pastes fast again
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# vim: shiftwidth=2 tabstop=2
