#!/usr/bin/env bash
function kinst {
  local version=${1/v/}
  local binary="/usr/local/bin/kubectl@${version}"

  if [ ! -f "${binary}" ]; then
    echo "Downloading kubectl@${version}"
    curl -L --silent "https://dl.k8s.io/release/v${version}/bin/darwin/amd64/kubectl" --output ${binary}
    chmod +x ${binary}
  else
    echo "kubectl@${version} already installed"
  fi
}

function getLocalKubeConfig {
  cwd=$(pwd)
  until test -f .kube_config || [ "$(pwd)" = "/" ]; do
    cd ..
  done
  if test -f .kube_config; then
    localKubeConfig="$(pwd)/.kube_config"
  fi
  cd ${cwd}
}

function kgc {
  local localKubeConfig=".kube_config"
  getLocalKubeConfig
  source ${localKubeConfig}

  if [ ! -z ${KCTX} ]; then context=${KCTX}; fi
  if [ ! -z ${KNS} ]; then namespace=${KNS}; fi

  echo "Context: ${context}/${namespace}"
}

function _kgc {
  kubectl config get-contexts |awk '/^[*]/{print $3}'
}

function _kwc {
  local context
  local namespace
  local localKubeConfig=".kube_config"
  getLocalKubeConfig
  source ${localKubeConfig}

  if [ ! -z ${KCTX} ]; then context=${KCTX}; fi
  if [ ! -z ${KNS} ]; then namespace=${KNS}; fi

  echo "context=${context}" > .kube_config
  echo "namespace=${namespace}" >> .kube_config
}

function _ksc_completions {
  local localKubeConfig=".kube_config"
  getLocalKubeConfig
  COMPREPLY=($(compgen -W "$(kubectl config view -o=jsonpath='{.contexts[*].name}' 2>/dev/null)" -- "${COMP_WORDS[1]}"))
}

function _ksn_completions {
  local localKubeConfig=".kube_config"
  getLocalKubeConfig
  COMPREPLY=($(compgen -W "$(kubectl get namespaces -o=jsonpath='{.items[*].metadata.name}' 2>/dev/null)" -- "${COMP_WORDS[1]}"))
}

function _kcc {
  unset KNS
  unset KCTX
}

function _ksn {
  local new_ns=$1
  export KNS=${new_ns}
}

function _ksc {
  local new_ctx=$1
  export KCTX=${new_ctx}
}

function kgt {
  local user=$1
  echo "Bearer $(kubectl get secret $(kubectl get sa ${user} -o=jsonpath='{.secrets[0].name}') -o=jsonpath='{.data.token}' | base64 --decode)"
}

complete -F _ksn_completions ksn
complete -F _ksc_completions ksc
complete -F _ksn_completions _ksn
complete -F _ksc_completions _ksc

alias ksc="_ksc"
alias ksn="_ksn"

## Command functions
