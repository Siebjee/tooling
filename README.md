Tooling
===
My personal tooling repository. To be documented still...

In a nutshell it's a build-up ontop of existing oh-my-zsh stuff.

### Prerequisites
Install [zsh](https://github.com/ohmyzsh/ohmyzsh) and optionally configured as listed below

#### zsh config
* theme
  * [powerlevel10k/powerlevel10k](https://github.com/romkatv/powerlevel10k)
* plugins:
  * terraform
  * docker
  * docker-compose
  * zsh-autosuggestions
  * git
  * tmux
  * virtualenv
  * kubectl
  * aws

### Installation
To install this framework
```
git clone git@github.com:Siebjee/tooling.git

cd tooling

cat <<EOF > ${HOME}/.siebjee_tooling
export TOOLING_BASE_DIR="$(pwd)"
EOF

source ${HOME}/.siebjee_tooling
cat <<EOF >> ${HOME}/.zshrc
source ${HOME}/.siebjee_tooling
source ${TOOLING_BASE_DIR}/zsh/environment.sh
EOF
```

### Usage

```
.
├── atom                      # here i store my atom called scripts. Bit too revealing to put it in a repo
├── bin
│   ├── argo                  # argo CLI wrapper
│   ├── flux                  # flux CLI wrapper
│   ├── helm                  # helm CLI wrapper
│   ├── kseal                 # kubeseal CLI wrapper
│   ├── ktop                  # kubectl top improved with waiters, via metric-server
│   └── kubectl               # kubectl CLI wrapper
└── zsh
    ├── aliasses
    │   ├── argo.sh           # argo      CLI aliasses that i found usefull over time
    │   ├── flux.sh           # flux      CLI aliasses that i found usefull over time
    │   ├── kubernetes.sh     # kubectl   CLI aliasses that i found usefull over time (next to those from zsh plugin)
    │   ├── kustomize.sh      # kustomize CLI aliasses that i found usefull over time
    │   └── terraform.sh      # terraform CLI aliasses that i found usefull over time
    ├── environment
    ├── environment.sh
    ├── functions
    │   ├── globalias.sh      # Expansion of aliasses, usefull while pair-programming or demoing stuff
    │   └── kubernetes.sh     # CLI wrapper functions to switch contexts / namespaces
    ├── hooks
    │   ├── _hooks.zsh        # ZSH directory hook loaded.
    └── zsh.sh
```

The CLI wrappers have a additional feature, allowing you to make them a bit more flexible to your liking.  
Add a file at `${TOOLING_ZSH_DIR}/bin/.additional_wrapper_conditions` and check below how I use it.

```
#!/usr/bin/env bash

case ${context} in
  "gke_my-project"*"my-cluster" )
     CLOUDSDK_ACTIVE_CONFIG_NAME="default"
  ;;
  "gke_my-other-project"* )
    CLOUDSDK_ACTIVE_CONFIG_NAME="my-other-config"
  ;;
esac
```

This way i can use multiple GCP configurations without activly need to switch them.
