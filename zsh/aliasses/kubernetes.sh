#!/usr/bin/env bash
alias ka="kubectl apply"

alias kg="kubectl get"
alias kd="kubectl describe"
alias kv="kubectl apply --validate=true --dry-run=true -f"
alias kgn="kubectl config get-contexts | grep \"^\*\" | awk '{print \$NF}'"
alias kfd="kubectl delete --force --grace-period 0"
alias kl="kubectl logs --tail=-1 --timestamps"
alias klf="kubectl logs --tail=-1 --timestamps -f"
alias kghr="kubectl get hr"
alias kdhr="kubectl describe hr"
alias kgpra="kubectl get pods --all-namespaces | awk '\$5>0'"
alias kgpr="kubectl get pods | awk '\$5>0'"
alias kgls="kubectl get pods -o=jsonpath='{range .items[*].status.containerStatuses[*]}{.name}{\"\t\"}{.lastState.reason}{.lastState.terminated.reason}{\" \"}{.lastState.terminated.finishedAt}{\"\n\"}'"
alias kad="kubectl apply --dry-run=client"
alias kadc="kubectl apply --dry-run=client"
alias kads="kubectl apply --dry-run=server"
alias krrd="kubectl rollout restart deployment"

alias kgpi="kubectl get pods -o=jsonpath='{range .items[*]}{range .spec.containers[*]}{.name}{\"\t\"}{.image}{\"\n\"}'"
alias kgw="kubectl get --watch"

alias kgk="kubectl get kustomizations"
alias kgkw="kubectl get kustomizations -w"
alias kgkf="kubectl get kustomizations --namespace flux-system"
alias kgkfw="kubectl get kustomizations --namespace flux-system -w"

alias kruntest="kubectl run test --image=debian:bullseye-slim -ti -- /bin/bash"
