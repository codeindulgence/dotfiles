dotfile_path=~/code/projects/dotfiles
# Setup some folders
mkdir -p ~/code/{work,projects,community,hello,courses}
mkdir -p ~/.config

if [ ! -d $dotfile_path ]; then
  git clone https://github.com/codeindulgence/dotfiles.git $dotfile_path
fi
ln -sf $dotfile_path ~/.config/dotfiles

which brew > /dev/null || (
  github_raw="https://raw.githubusercontent.com"
  homebrew_url="$github_raw/Homebrew/install/master/install"
  /usr/bin/ruby -e "$(curl -fsSL $homebrew_url)"
)

brew bundle --file=$dotfile_path/Brewfile

fish $dotfile_path/install.fish
