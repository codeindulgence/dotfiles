dotfile_dir=~/.config/dotfiles

function check_dotfiles() {
  /bin/echo Checking dotfiles repo...
  if [ -d $dotfile_dir ]; then
    cd $dotfile_dir &&
    git pull origin master
  else
    git clone https://github.com/codeindulgence/dotfiles.git $dotfile_dir
  fi
}

function check_programs() {
  local error=0

  cd $dotfile_dir/config

  for program in *; do
    /bin/echo -n Checking for $program:\ 

    if type $program > /dev/null 2>&1 ; then
      /bin/echo Ok!
    else
      /bin/echo No $program! No $program!
      error=1
    fi
  done

  return $error
}

function symlink_programs() {
  local path=$(dirname $(readlink -f $0))

  for program in *; do
    /bin/echo -n Symlink $program:\ 
    if [ -d ~/.config/$program ]; then
      /bin/echo -n Backing up $program config.\ 
      mv ~/.config/$program{,.bak}
    fi
    ln -sf $path/$program ~/.config/ &&
    /bin/echo Ok!
  done
}

check_dotfiles &&
check_programs &&
symlink_programs
