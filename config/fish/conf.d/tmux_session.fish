if set -q TMUX
  set -g tmux_session_name (tmux display-message -p '#S')
end
