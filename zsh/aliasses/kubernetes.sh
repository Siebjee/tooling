#!/usr/bin/env bash

alias ktest='kubeconform --exit-on-error --ignore-missing-schemas -kubernetes-version ${KUBECTL_VERSION} -verbose -summary -'
alias kg="kubectl get"
alias kd="kubectl describe"
alias kgn="kubectl config get-contexts | grep \"^\*\" | awk '{print \$NF}'"
alias kfd="# kubectl delete --force --grace-period 0"

# Kubectl logs follow
alias klf="kubectl logs --tail=-1 --timestamps -f"
alias kl5mf="kubectl logs --since 5m --timestamps -f"
alias kl30mf="kubectl logs --since 30m --timestamps -f"
alias kl1hf="kubectl logs --since 1h --timestamps -f"

# Kubectl logs
alias kl="kubectl logs --tail=-1 --timestamps"
alias kl5m="kubectl logs --since 5m --timestamps"
alias kl30m="kubectl logs --since 30m --timestamps"
alias kl1h="kubectl logs --since 1h --timestamps"

# Pods
alias kgpra="kubectl get pods --all-namespaces | awk '\$5>0'"
alias kgpr="kubectl get pods | awk '\$5>0'"
alias kgls="kubectl get pods -o=jsonpath='{range .items[*].status.containerStatuses[*]}{.name}{\"\t\"}{.lastState.reason}{.lastState.terminated.reason}{\" \"}{.lastState.terminated.finishedAt}{\"\n\"}'"

# Kubectl apply
alias ka="kubectl apply"
alias kad="kubectl apply --dry-run=client"
alias kadc="kubectl apply --dry-run=client"
alias kads="kubectl apply --dry-run=server"
alias kv="kubectl apply --validate=true --dry-run=true -f"

# Generate yaml
alias kgy="kubectl --dry-run=client -o yaml"

# HPA
alias kghpa="kubectl get hpa"
alias kdhpa="kubectl describe hpa"

# Rollout
alias krrd="kubectl --field-manager=flux-client-side-apply rollout restart deployment"
alias krrds="kubectl --field-manager=flux-client-side-apply rollout restart daemonset"
alias krrs="kubectl --field-manager=flux-client-side-apply rollout restart statefulset"

alias kgpi="kubectl get pods -o=jsonpath='{range .items[*]}{range .spec.containers[*]}{.name}{\"\t\"}{.image}{\"\n\"}'"
alias kgw="kubectl get --watch"

# Kustomize
alias kgk="kubectl get kustomizations"
alias kgkw="kubectl get kustomizations -w"
alias kgkf="KNS=flux-system kubectl get kustomizations"
alias kgkfw="KNS=flux-system kubectl get kustomizations -w"

alias kdk="kubectl describe kustomizations"
alias kdkw="kubectl describe kustomizations -w"
alias kdkf="KNS=flux-system kubectl describe kustomization"

# Flux
alias kgit="KNS=flux-system kubectl get gitrepository"
alias kgimgp="KNS=flux-system kubectl get imagepolicies"
alias kgimgr="KNS=flux-system kubectl get imagerepository"

alias kdgit="KNS=flux-system kubectl describe gitrepository"
alias kdimgp="KNS=flux-system kubectl describe imagepolicies"
alias kdimgr="KNS=flux-system kubectl describe imagerepository"

alias kghr="kubectl get hr"
alias kdhr="kubectl describe hr"

# Argo
alias kdwf="kubectl describe workflow"
alias kdwft="kubectl describe workflowtemplate"
alias kdcwft="kubectl describe clusterworkflowtemplate"

alias kgwf="kubectl get workflow"
alias kgwft="kubectl get workflowtemplate"
alias kgcwft="kubectl get clusterworkflowtemplate"

alias kges="kubectl get eventsource"
alias kdes="kubectl describe eventsource"

# tail ingress
alias klnginx="KNS=ingress-nginx kubectl logs --tail=-1 --timestamps -l app.kubernetes.io/name=ingress-nginx"
alias klnginxf="KNS=ingress-nginx kubectl logs --tail=-1 --timestamps -f -l app.kubernetes.io/name=ingress-nginx"

# Simple debug pod
alias kruntest="kubectl run test --image=debian:bullseye-slim -ti -- /bin/bash"

# Stern
alias stern="stern --timestamps --timezone utc"

# Delete failed pods
alias kdpf="kubectl delete pods --field-selector=status.phase=Failed"
