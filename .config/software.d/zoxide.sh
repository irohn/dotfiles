# Evaluate and setup zoxide (cd replacement)
command -v zoxide > /dev/null 2>&1 && \
  eval "$(zoxide init --cmd cd zsh)"

