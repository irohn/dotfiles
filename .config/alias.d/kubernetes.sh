# ~/.config/alias.d/kubernetes.sh

alias pods="kubectl get pods --all-namespaces"
alias wp="watch -n 0.1 'kubectl get pods --all-namespaces'"

alias fl='flux logs -A'
alias fra='flux reconcile kustomization flux-system --with-source'

router_ssh() {
    kubectl exec -n green-utils deployment/router-manager -it  -- /bin/sh -c "ssh -i \"/keys/private/router_id_rsa\" -o StrictHostKeyChecking=no -o HostKeyAlgorithms=+ssh-rsa -o UserKnownHostsFile=/dev/null -q root@192.168.2.1 \"${*}\""
}
