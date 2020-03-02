if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    else
      set -g pure_right_prompt (echo_wrapped REMOTE red)
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

  # Load Ruby envs/versions
  type -q rbenv; and source (rbenv init -|psub)
  # Load Scala env
  type -q scalaenv; and source (scalaenv init -|psub)
  # Load Python envs/versions
  if type -q pyenv
    pyenv init - | source
    pyenv virtualenv-init - | source
  end

  type -q biome; and biome enter .
end
