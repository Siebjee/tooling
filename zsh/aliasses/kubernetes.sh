#!/usr/bin/env bash

alias ktest='kubeconform --exit-on-error --ignore-missing-schemas -kubernetes-version ${KUBECTL_VERSION} -verbose -summary -schema-location default -schema-location '"'"'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json'"'"' -'
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
alias krrd="kubectl rollout restart deployment"
alias krrds="kubectl rollout restart daemonset"
alias krrs="kubectl rollout restart statefulset"

alias kgpi="kubectl get pods -o=jsonpath='{range .items[*]}{range .spec.containers[*]}{.name}{\"\t\"}{.image}{\"\n\"}'"
alias kgw="kubectl get --watch"

# Kustomize
alias kgk="kubectl get kustomizations"
alias kgkw="kubectl get kustomizations -w"
alias kgkf="kubectl get kustomizations --namespace flux-system"
alias kgkfw="kubectl get kustomizations --namespace flux-system -w"

# Flux
alias kgit="kubectl get gitrepository --namespace=flux-system"
alias kgimgp="kubectl get imagepolicies --namespace=flux-system"
alias kgimgr="kubectl get imagerepository --namespace=flux-system"

alias kdgit="kubectl describe gitrepository --namespace=flux-system"
alias kdimgp="kubectl describe imagepolicies --namespace=flux-system"
alias kdimgr="kubectl describe imagerepository --namespace=flux-system"

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
