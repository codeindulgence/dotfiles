function devenv --on-event fish_prompt
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
      set -gx PYENV_VERSION (cat .python-version)
      if test (type -t pyenv) != 'function'
        pyenv init --path | source
        pyenv init - | source
      end
      if not type -q _pyenv_virtualenv_hook
        pyenv virtualenv-init - | source
      end
    end
  end

end
