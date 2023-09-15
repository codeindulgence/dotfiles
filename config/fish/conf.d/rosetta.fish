if test (arch) = "i386"
  set HOMEBREW_PREFIX /usr/local
  set -x PYENV_ROOT ~/.pyenv-intel
else
  set HOMEBREW_PREFIX /opt/homebrew
  set -x PYENV_ROOT ~/.pyenv
end

# Add the Homebrew prefix to $PATH. -m flag ensures it's at the beginning
# of the path since the path might already be in $PATH (just not at the start)
fish_add_path -m --path $HOMEBREW_PREFIX/bin

alias intel 'exec arch -x86_64 /usr/local/bin/fish'
alias arm 'exec arch -arm64 /opt/homebrew/bin/fish'
