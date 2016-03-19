if not set -q TMUX
  tmux -f ~/.config/tmux/tmux.conf new -s Main
end

source /usr/local/share/chruby/chruby.fish

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
