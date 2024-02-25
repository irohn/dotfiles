
# [E]dit [G]it [S]tatus
egs() {
  ${EDITOR:-vi} $(git status --porcelain | fzf --preview-window right --preview 'bat --plain --color=always {2}' | sed s/^...//)
}

