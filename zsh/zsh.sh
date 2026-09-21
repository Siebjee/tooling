#!/usr/bin/env bash

# This will ignore the aliasses under commands ls and l
if command rg --version > /dev/null 2>&1; then
    GLOBALIAS_FILTER_VALUES=(ls l vim)
    alias grep="rg"
    alias _grep="/usr/bin/grep"
else
    GLOBALIAS_FILTER_VALUES=(ls l grep vim)
fi

# This will expand aliasses
GLOBALIAS_EXPAND_ALIAS=true

# This will not expand words, therefor also not your variables :)
GLOBALIAS_EXPAND_WORD=false

function prompt_my_context() {
  if [[ -n $SSH_CONNECTION ]]; then
    local bg=$POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND
    local fg=$POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND
  elif [[ $EUID -eq 0 ]]; then
    local bg=$POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND
    local fg=$POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND
  else
    return
  fi
  local h=${(%):-%m}
  p10k segment -t "$USER@${h%%-*}" -f "$fg" -b "$bg" \
    -r -i 'POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER'
}
