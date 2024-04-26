

# [[ neovim - text editor ]]
command -v nvim > /dev/null 2>&1 && \
  alias vim='nvim' && \
  alias vi='nvim'

# [[ bat - cat alternative ]]
command -v bat > /dev/null 2>&1 && \
  alias cat='bat'

# [[ eza - a modern ls alternative ]]
command -v eza > /dev/null 2>&1 && \
  alias ls='eza' && \
  alias ll='eza -lAh' && \
  alias la='eza -laa' && \
  alias l='eza -l' && \
  alias lt='eza --almost-all --tree --color=auto --icons=auto --git-ignore --smart-group --mounts --level=5'

