if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    end
  end

  set -g pure_right_prompt (echo_wrapped $tmux_session_name blue)

  # Set colourscheme
  set BASE16_THEME materia
  eval sh '"'(realpath ~/.base16_theme)'"'

  source ~/.config/fish/variables.fish
end
