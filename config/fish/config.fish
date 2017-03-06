if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    end
  end

  # Set colourscheme
  if set -q _colorscheme
    eval sh $_colorscheme
  end

  source ~/.config/fish/variables.fish
  set chruby /usr/local/share/chruby/chruby.fish
  if [ -f $chruby ];
  source $chruby
  end
  loadenv
  chruby-auto
end

