#!/usr/bin/env bash
alias t="terraform"
alias tv="terraform validate"
alias ts="terraform state"
alias ta="terraform apply"
alias tp="terraform plan"
alias tpd="terraform plan -destroy"

alias tfmt="terraform fmt"

alias tsw="tfswitch"

function tws {
  local workspace=$1

  case $workspace in
    \w+ )
      terraform workspace select $workspace
      return $?
      ;;
    * )
      terraform workspace list
      return $?
      ;;
  esac
}
