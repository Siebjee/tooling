#!/usr/bin/env bash

function kubeconform_update {
    mkdir -p ${KUBECONFORM_DIR}

    echo "Cloning / Updating default kubernetes json schemas"
    git clone https://github.com/yannh/kubernetes-json-schema.git ${KUBECONFORM_DIR}/default || \
    ( cd ${KUBECONFORM_DIR}/default && git pull )

    echo "Cloning / Updating extra kubernetes json schemas"
    git clone https://github.com/datreeio/CRDs-catalog.git ${KUBECONFORM_DIR}/extras || \
    ( cd ${KUBECONFORM_DIR}/extras && git pull )
}
