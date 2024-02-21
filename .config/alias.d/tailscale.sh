# ~/.config/alias.d/tailscale.sh


clusters_dir="$HOME/greeneye/rt-versions/clusters"

list_clusters() {
    local file_path sprayer_group boom_location cluster_name
    for file_path in $(find "$clusters_dir" -type f -name "cluster-vars-cm.yaml"); do
        sprayer_group=$(awk '/SPRAYER_GROUP:/ {print $2}' "$file_path" | tr -d '\r')
        boom_location=$(awk '/BOOM_LOCATION:/ {print $2}' "$file_path" | tr -d '\r')
        cluster_name=$(awk '/CLUSTER_NAME:/ {print $2}' "$file_path" | tr -d '\r')
        printf "%s %s-%s\n" "$cluster_name" "$sprayer_group" "$boom_location"
    done
}

tssh() {
    matches=$(list_clusters | grep "$1")
    cluster=$(printf $matches | fzf --select-1 | cut -d' ' -f1)
    target_host=$(tailscale status | awk '!/k3s-/ {print $2}' | grep -m 1 "$cluster")
    [ ! -z $cluster ] && [ ! -z $target_host ] && \
      printf "Connecting to %s\n" "$cluster" && \
      ssh -i ~/.ssh/greenboard.uu -o StrictHostKeyChecking=no green@"$target_host"
}

tkx () {
    local matches=$(list_clusters | grep "$1")
    local cluster=$(printf $matches | fzf --select-1 | cut -d' ' -f1)
    local target_ctx=$(tailscale status | grep -v "offline" | awk '/k3s-/ {print $2}' | grep "$cluster" | fzf --select-1)
    [ ! -z $cluster ] && [ ! -z $target_ctx ] && tailscale configure kubeconfig "$target_ctx"
}

