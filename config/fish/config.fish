if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    end
  end

  # Set colourscheme
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"

  source ~/.config/fish/variables.fish
end
