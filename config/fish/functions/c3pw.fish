function c3pw
  echo Updating infrastructure
  cd ~/code/work/infrastructure/
  git pull origin master
  vim passwords.gpg
end
