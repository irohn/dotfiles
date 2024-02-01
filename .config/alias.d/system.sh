
# change directory to selected path
cdf() {
    local paths
    if [ "$#" -gt 0 ]; then
        paths=${@}
        selection=$(find $(for path in $paths; do printf "$path "; done) -mindepth 1 -maxdepth 1 -type d | fzf --preview 'ls {}')
    else
        selection=$(find ~/repos ~/greeneye -mindepth 1 -maxdepth 1 -type d | fzf --preview 'ls {}')
    fi
    cd $selection
}

command -v bat > /dev/null 2>&1 && alias cat='bat -Pp'
