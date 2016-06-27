if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux -f ~/.config/tmux/tmux.conf new -s Main
    end
  end

  eval sh ~/.config/fish/base16-ocean.dark.sh
  source ~/.config/fish/variables.fish
  set chruby /usr/local/share/chruby/chruby.fish
  if [ -f $chruby ];
  source $chruby
  end
  loadenv
end

