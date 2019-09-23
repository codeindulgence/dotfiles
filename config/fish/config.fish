if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux attach; or tmux -f ~/.config/tmux/tmux.conf new-session -s Main
    end
  end

  # Set colourscheme
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"

  source ~/.config/fish/variables.fish
  set chruby /usr/local/share/chruby/chruby.fish
  if [ -f $chruby ];
    source $chruby
  end
  loadenv
  chruby-auto
end

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/nick/.config/yarn/global/node_modules/tabtab/.completions/sls.fish ]; and . /Users/nick/.config/yarn/global/node_modules/tabtab/.completions/sls.fish

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/nick/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/nick/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish
