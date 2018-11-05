set EDITOR nvim
set -x ANSIBLE_NOCOWS 1

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
set fish_color_comment aaaaaa
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
set fish_color_search_match --background=ccc
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
abbr . cd -
abbr ... cd ../..
abbr .... cd ../../..
abbr ..... cd ../../../..
abbr ...... cd ../../../../..
abbr ....... cd ../../../../..
abbr 1 cd .
abbr 10 cd \$dirhist[10]
abbr 2 cd \$dirhist[2]
abbr 3 cd \$dirhist[3]
abbr 4 cd \$dirhist[4]
abbr 5 cd \$dirhist[5]
abbr 6 cd \$dirhist[6]
abbr 7 cd \$dirhist[7]
abbr 8 cd \$dirhist[8]
abbr 9 cd \$dirhist[9]
abbr a tmux a
abbr be bundle exec
abbr ch git check
abbr d dirhist
abbr edit vim
abbr g git
abbr gdi git diff
abbr gl git log --oneline --decorate --color --graph
abbr mk mkdir -p
abbr prb git prb
abbr pw pwgen -Bys 24 1
abbr r ranger
abbr rm trash
abbr rmd rm -rf
abbr s git status -bsu
abbr t tig --all
abbr tailf tail -f
abbr v nvim
