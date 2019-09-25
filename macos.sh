# Setup some folders
mkdir -p ~/code/{work,projects,community,hello,courses}
mkdir -p ~/.config

git clone https://github.com/codeindulgence/dotfiles.git ~/code/projects/dotfiles
ln -s ~/code/projects/dotfiles ~/.config/dotfiles

xcode-select --install

github_raw="https://raw.githubusercontent.com"
homebrew_url="$github_raw/Homebrew/install/master/install"
/usr/bin/ruby -e "$(curl -fsSL $homebrew_url)"

brew bundle --file=~/code/projects/dotfiles/Brewfile
