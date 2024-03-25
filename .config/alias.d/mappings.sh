

tms() {
  # Sessionize a directory or re-attach to existing one in selected paths
  if [ $# -eq 1 ]; then
    selected=$1
  else
    selected=$(find ~/projects/personal ~/projects/greeneye ~/projects/oss -mindepth 1 -maxdepth 1 -type d | \
      fzf --preview "ls --color=always {}")
  fi

  if [ -z "$selected" ]; then
    return 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [ -z "$TMUX" ] && [ -z "$tmux_running" ]; then
    tmux new-session -s $selected_name -c $selected
    return 0
  fi

  if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  if [ -z "${TMUX}" ]; then
    tmux attach -d -t $selected_name
  else
    tmux switch-client -t $selected_name
  fi
}
bindkey -s "^S" "tms^M"

