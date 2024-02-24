# ~/.zshrc

# Source environment variables
[ -d "$HOME"/.config/env.d ] && \
  for file in "$HOME"/.config/env.d/*; do source $file; done

# Source aliases and functions
[ -d "$HOME"/.config/alias.d ] && \
  for file in "$HOME"/.config/alias.d/*; do source $file; done

[ -d "$HOME"/.config/software.d ] && \
  for file in "$HOME"/.config/software.d/*; do source $file; done

