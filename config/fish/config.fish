if not set -q TMUX
  if not set -q SSH_CLIENT
    tmux -f ~/.config/tmux/tmux.conf new -s Main
  end
end


if status --is-interactive
  eval sh ~/.config/fish/dark.sh
end
source ~/.config/fish/variables.fish
source /usr/local/share/chruby/chruby.fish
