Tooling
===
My personal tooling repository. To be documented still...

In a nutshell it's a build-up ontop of existing oh-my-zsh stuff.

### Prerequisites
Install [zsh](https://github.com/ohmyzsh/ohmyzsh) and optionally configured as listed below
(Optional) Install [the-ultimate-vimrc](https://github.com/amix/vimrc)

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

# This is to make npm install global packages in the directory below
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

ln -sf ${TOOLING_BASE_DIR}/zsh/zprofile ~/.zprofile
ln -sf ${TOOLING_BASE_DIR}/tmux/tmux.conf ~/.tmux.conf
```

### Vim
Follow instructions of at https://github.com/amix/vimrc

And execut the following commands
```

git clone git@github.com:ycm-core/YouCompleteMe.git ~/.vim_runtime/my_plugins/
git clone git@github.com:hashivim/vim-terraform.git ~/.vim_runtime/my_plugins/

ln -sf ${TOOLING_BASE_DIR}/vim/vimrc ~/.vim_runtime/my_configs.vim

mkdir -p ~/.vim_runtime/my_plugins
curl -fLo ~/.vim_runtime/my_plugins/vim-plug/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

### Language servers

```
npm i -g bash-language-server

brew install hashicorp/tap/terraform-ls

ln -sf ${TOOLING_BASE_DIR}/vim/coc-settings.json ~/.vim/coc-settings.json
```

#### Hacks
Custom hack to make `terraform fmt` work
```
cat <<EOF > ~/.vim_runtime/my_plugins/vim-terraform/ftplugin/terraform.vim
if !exists('g:terraform_binary_path')
  let g:terraform_binary_path='terraform'
endif

if !executable(g:terraform_binary_path)
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

command! -nargs=+ -complete=custom,terraform#commands -buffer Terraform
  \ execute '!'.g:terraform_binary_path.' '.<q-args>.' -no-color'

augroup vim.terraform.fmt
  autocmd!
  autocmd BufWritePre *.tf call terraform#fmt()
  autocmd BufWritePre *.tfvars call terraform#fmt()
augroup END
EOF
```

### Usage

```
.
????????? atom                      # here i store my atom called scripts. Bit too revealing to put it in a repo
????????? bin
??????? ????????? argo                  # argo CLI wrapper
??????? ????????? flux                  # flux CLI wrapper
??????? ????????? helm                  # helm CLI wrapper
??????? ????????? kseal                 # kubeseal CLI wrapper
??????? ????????? ktop                  # kubectl top improved with waiters, via metric-server
??????? ????????? kubectl               # kubectl CLI wrapper
????????? zsh
    ????????? aliasses
    ??????? ????????? argo.sh           # argo      CLI aliasses that i found usefull over time
    ??????? ????????? flux.sh           # flux      CLI aliasses that i found usefull over time
    ??????? ????????? kubernetes.sh     # kubectl   CLI aliasses that i found usefull over time (next to those from zsh plugin)
    ??????? ????????? kustomize.sh      # kustomize CLI aliasses that i found usefull over time
    ??????? ????????? terraform.sh      # terraform CLI aliasses that i found usefull over time
    ????????? environment
    ????????? environment.sh
    ????????? functions
    ??????? ????????? globalias.sh      # Expansion of aliasses, usefull while pair-programming or demoing stuff
    ??????? ????????? kubernetes.sh     # CLI wrapper functions to switch contexts / namespaces
    ????????? hooks
    ??????? ????????? _hooks.zsh        # ZSH directory hook loaded.
    ????????? zsh.sh
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

This way i can use multiple GCP configurations without actively need to switch them.

**NOTE**

The CLI wrappers still stupport the `--namespace` as far as the original command allows this.

```
kubectl apply -f deployment.yaml --namespace foobar
flux reconcile kustomization foobar --namespace baz
```

#### Customizing tmux statup windows
Create a file like shown below, and modify it as you'd like. The `tux` function will take care of the rest
```bash
cat <<EOF > ${TOOLING_BASE_DIR}/tmux/myconfig/test.tmux
#! /bin/bash
tmux new-window -t $session:1 -n 'My test window'
```
