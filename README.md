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
echo "source ${TOOLING_BASE_DIR}/zsh/environment.sh" >> $HOME/.zshrc
```
