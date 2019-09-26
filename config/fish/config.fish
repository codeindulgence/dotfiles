if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    end
  else
    set -g pure_right_prompt (echo_wrapped $tmux_session_name blue)
  end

  # Set colourscheme
  if [ -r ~/.base16_theme ]
    set BASE16_THEME materia
    eval sh '"'(realpath ~/.base16_theme)'"'
  end

  source ~/.config/fish/variables.fish
end
