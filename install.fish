set dotfile_dir ~/.config/dotfiles
set script (status -f)

function check_dotfiles
  echo Checking dotfiles repo...
  if [ -d $dotfile_dir ]
    cd $dotfile_dir
    and git pull origin master
  else
    git clone https://github.com/codeindulgence/dotfiles.git $dotfile_dir
  end
end

function check_programs
  set -l error 0

  cd $dotfile_dir/config

  for program in *
    echo -n Checking for $program:\ 

    if type $program > /dev/null 2>&1
      echo Ok!
    else
      echo No $program! No $program!
      set error 1
    end
  end

  return $error
end

function symlink_programs
  set -l config_path (dirname (readlink -f $script))/config
  #set -l config_path "$path/config"

  for program in *
    set -l program_path ~/.config/$program
    echo -n Symlink $program:\ 

    if not [ (readlink -f $program_path) = (readlink -f $config_path/$program) ]
      echo -n Backing up $program config.\ 
      mv ~/.config/$program{,.bak}
    end
    ln -sf $config_path/$program ~/.config/
    and echo Ok!
  end
end

check_dotfiles
and check_programs
and symlink_programs

echo (set_color green) "Cool, we're done. You can run `fish` or set it as your default with `chsh -s ...`. Enjoy!"
