# Set ZSH directory env var
export ZSH=$HOME/.oh-my-zsh

# Oh-My-Zsh plugins
plugins=(git vi-mode kubectl)

# Source oh-my-zsh.sh
[ -f "$ZSH"/oh-my-zsh.sh ] && \
  source "$ZSH"/oh-my-zsh.sh

