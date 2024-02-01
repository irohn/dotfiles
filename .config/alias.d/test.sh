router_api_call() {
    # GET request to router-manager
    local pod_ip="$(kubectl get pod -n green-utils -o json | jq -r --arg pod_name "router-manager" '[.items[] | select(.metadata.name | test($pod_name)).status | .podIP ][0]')"
    local request_url="http://$pod_ip:8000/${1:-}"
    curl $request_url
}

router_get_hosts() {
    # GET all hosts from router
    router_api_call "router/dhcp/get_all_hosts"
}

router_init() {
    # Initialize NEW router (DANGEROUS)
    printf "This will initialize the router and will work only if the router is in factory state.\n"
    if read -q "choice?Continue? (y/N): "; then
        echo "\nResetting router..."
        router_api_call "router/init"
    else
        echo "\nAborting operation..."
    fi
}
