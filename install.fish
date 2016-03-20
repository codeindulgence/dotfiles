set dotfile_dir ~/.config/dotfiles
set script (status -f)

function ok
  echo -s (set_color green) Ok! (set_color normal)
end

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
    echo -n "Checking for $program: "

    if type $program > /dev/null 2>&1
      ok
    else
      echo No $program! No $program!
      set error 1
    end
  end

  return $error
end

function symlink_programs
  set -l config_path $dotfile_dir/config

  for program_path in $config_path/*
    set -l program (basename $program_path)
    set -l install_path ~/.config/$program
    echo -n "Linking $program: "

    if begin
        [ -d $install_path ];
        and [ (readlink -f $install_path) != (readlink -f $config_path/$program) ]
      end

     echo -n -s (set_color yellow) "Backing up $program config. "
     mv $install_path $install_path.(date +%s).bak
   end

   ln -sf $config_path/$program ~/.config

   ok
 end
 echo
end

check_dotfiles
and check_programs
and symlink_programs

and echo -s (set_color green) "Cool, we're done. You can run `fish` or set it as your default with `chsh -s ...`. Enjoy!"
or echo -s (set_color red) "Something went wrong. Terribly terribly wrong."
