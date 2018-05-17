function dotfile-update
  echo Updating dotfiles...
  cd ~/.config/dotfiles/
  git pull origin master
end
