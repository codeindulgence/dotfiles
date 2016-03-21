if not set -q TMUX
  if not set -q SSH_CLIENT
    tmux -f ~/.config/tmux/tmux.conf new -s Main
  end
end

eval sh ~/.config/fish/base16-ocean.dark.sh
source ~/.config/fish/variables.fish
source /usr/local/share/chruby/chruby.fish
