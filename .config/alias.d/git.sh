
alias gs='git status -s'

gdf() {
    git diff --color=always $(git diff --color=always --names-only | fzf --preview 'git diff --color=always {-1}')
}
