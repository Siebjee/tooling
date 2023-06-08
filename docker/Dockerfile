FROM ubuntu:23.10

# Hack as brew is not installable on arm linux
# And I want this to be a minimal toolbox that works on all arch's
ENV HOMEBREW_PREFIX=/usr/local

ENV POWERLEVEL9K_INSTANT_PROMPT=quiet
ENV TERM=xterm-256color

# hadolint ignore=DL3009,DL3008,DL3015,DL4006
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl gpg lsb-release

# hadolint ignore=DL3009,DL3008,DL3015,DL4006,DL3047
RUN apt-get update && apt-get install -y \
    locales git bash zsh ripgrep jq tmux vim whois nodejs netcat-openbsd && \
    locale-gen en_US.UTF-8

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN chown :ubuntu /usr/local/bin && chmod g+rwx /usr/local/bin

# hadolint ignore=DL3059
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /opt/powerlevel10k

WORKDIR /home/ubuntu
USER ubuntu

RUN mkdir -p /home/ubuntu/projects /home/ubuntu/.vim && \
    git clone https://github.com/Siebjee/tooling.git projects/tooling && \
    git clone https://github.com/Siebjee/vimrc.git /home/ubuntu/.vim_runtime && \
    ~/.vim_runtime/install_awesome_vimrc.sh && \
    mkdir -p ~/.vim_runtime/my_plugins && \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim_runtime/my_plugins/vim-terraform

WORKDIR /home/ubuntu

# hadolint ignore=DL3059,DL4006
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ENV TOOLING_BASE_DIR="/home/ubuntu/projects/tooling" \
    KUBECTL_VERSION="1.23.1"

RUN export TOOLING_BASE_DIR="/home/ubuntu/projects/tooling" > .siebjee_tooling
RUN ln -sf ${TOOLING_BASE_DIR}/zsh/zshrc ~/.zshrc && \
    ln -sf ${TOOLING_BASE_DIR}/zsh/zprofile ~/.zprofile && \
    ln -sf ${TOOLING_BASE_DIR}/zsh/p10k.zsh ~/.p10k.zsh && \
    ln -sf ${TOOLING_BASE_DIR}/tmux/tmux.conf ~/.tmux.conf && \
    ln -sf ${TOOLING_BASE_DIR}/vim/vimrc ~/.vim_runtime/my_configs.vim && \
    ln -sf ${TOOLING_BASE_DIR}/vim/coc-settings.json ~/.vim/coc-settings.json && \
    touch  ${TOOLING_BASE_DIR}/bin/.additional_wrapper_conditions && \
    echo -e "context=docker-desktop\nnamespace=default" > .kube_config && \
    echo POWERLEVEL9K_INSTANT_PROMPT=quiet >> ~/.zprofile && \
    echo POWERLEVEL9K_INSTANT_PROMPT=quiet >> ~/.zshrc

# Install additional tooling
RUN mkdir -p /tmp/install
WORKDIR /tmp/install

ENV VERSION_STERN=1.25.0
RUN curl --silent -L -o stern.tar.gz "https://github.com/stern/stern/releases/download/v${VERSION_STERN}/stern_${VERSION_STERN}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m | sed 's/aarch64/arm64/').tar.gz" && tar zxvf stern.tar.gz && install -o ubuntu -g ubuntu -m 0755 stern /usr/local/bin/stern

ENV VERSION_KUBECONFORM=0.6.1
RUN curl --silent -L -o kubeconform.tar.gz "https://github.com/yannh/kubeconform/releases/download/v${VERSION_KUBECONFORM}/kubeconform-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m | sed 's/aarch64/arm64/').tar.gz" && tar zxvf kubeconform.tar.gz && install -o ubuntu -g ubuntu -m 0755 kubeconform /usr/local/bin/kubeconform

ENV VERSION_ARGO=3.4.7
RUN curl --silent -L -o argo.gz "https://github.com/argoproj/argo-workflows/releases/download/v${VERSION_ARGO}/argo-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m | sed 's/aarch64/arm64/').gz" && gunzip -f argo.gz && install argo -o ubuntu -g ubuntu -m 0755 /usr/local/bin/argo

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && install -o ubuntu -g ubuntu -m 0755 kustomize /usr/local/bin/kustomize

WORKDIR /home/ubuntu
CMD ["zsh"]
