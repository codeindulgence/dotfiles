set EDITOR nvim

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Colours
set fish_color_autosuggestion 969896
set fish_color_command b294bb
set fish_color_comment f0c674
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end b294bb
set fish_color_error cc6666
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host "-0 cyan"
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 81a2be
set fish_color_quote b5bd68
set fish_color_redirection 8abeb7
set fish_color_search_match --background=purple
set fish_color_status red
set fish_color_user "-o green"
set fish_color_valid_path --underline

set fish_pager_color_completion normal
set fish_pager_color_description "555 yellow"
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

# Bindings
set fish_key_bindings fish_default_key_bindings

# Abbreviations
set fish_user_abbreviations \
  "r ranger" \
  "g git" \
  "be bundle exec" \
  "mk mkdir" \
  "v nvim" \
  "rmd rm -rf" \
  "t tig --all" \
  "s git status -bsu" \
  "tailf tail -f" \
  "\x2e cd -" \
  "edit vim" \
  "gl git log --oneline --decorate --color --graph" \
  "gdi git diff"
