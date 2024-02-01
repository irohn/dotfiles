# ~/.zshrc


# Set ZSH directory env var
export ZSH=$HOME/.oh-my-zsh

# Source custom environment variables
[ -d "$HOME"/.config/environment ] && for file in /Users/ori/.config/environment/*; do source $file; done

# Oh-My-Zsh plugins
plugins=(git)

# Source oh-my-zsh.sh
[ -f "$ZSH"/oh-my-zsh ] && source "$ZSH"/oh-my-zsh.sh

# Source all files in alias.d
[ -d "$HOME"/.config/alias.d ] && for file in /Users/ori/.config/alias.d/*; do source $file; done   

# Add local bin directory to PATH
[ -d "$HOME"/.local/bin ] && export PATH="$HOME"/.local/bin:"$PATH" 

# Evaluate starship prompt
command -v starship > /dev/null 2>&1 && eval "$(starship init zsh)"

