function c3pw
	echo Updating infrastructure
  cd ~/code/C3/infrastructure/
  git pull origin master
  vim passwords.gpg
end
