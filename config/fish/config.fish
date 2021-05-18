if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux -f ~/.config/tmux/tmux.conf new-session -A -s main
    else
      set -g pure_right_prompt (echo_wrapped REMOTE red)
    end
  else
    set -g pure_right_prompt (echo_wrapped $tmux_session_name blue)
  end

  # Set tab width
  tabs -2

  # Set colourscheme
  if [ -r ~/.base16_theme ]
    eval sh '"'(realpath ~/.base16_theme)'"'
  end

  source ~/.config/fish/variables.fish

  function _dev_env --on-event fish_prompt
    # Load Ruby envs/versions
    if type -q rbenv
      if test -r .ruby-version
        if test (type -t rbenv) != 'function'
          source (rbenv init - | psub)
        end
      end
    end

    # Load Scala env
    if type -q scalaenv
      if test -r .scala-version
        if test (type -t scalaenv) != 'function'
          source (scalaenv init - | psub)
        end
      end
    end

    # Load Python envs/versions
    if type -q pyenv
      if test -r .python-version
        if test (type -t pyenv) != 'function'
          pyenv init - | source
        end

        if type -q _pyenv_virtualenv_hook
          pyenv virtualenv-init - | source
        end
      end
    end
  end

  type -q biome; and biome enter .

end
