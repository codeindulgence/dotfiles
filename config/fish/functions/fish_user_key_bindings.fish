function fish_user_key_bindings
  bind \ek history-token-search-backward
  bind \ej history-token-search-forward
  bind \cx\ce edit_command_buffer
  bind \cw backward-kill-word
end

if type -q fzf_key_bindings
  fzf_key_bindings
end

function fzf-recent-widget
  set -l command 'z -l | awk "{print \$2}" | grep -v "^$PWD\$"'
  set -l hist_file ~/.local/share/fzf-history/recent
  set -l fzf_cmd 'fzf --height 40% --reverse --history='$hist_file
  eval "$command | $fzf_cmd | read -l result"

  if [ -n "$result" ]
    cd $result
    commandline -f repaint
  end
end

bind -k backspace \
  'test (commandline) = ""; \
    and tmuxpasskey do fzf-recent-widget; \
    or commandline -f backward-delete-char'
bind \ct 'tmuxpasskey do fzf-file-widget'
bind \cr 'tmuxpasskey do fzf-history-widget'
bind \ec 'tmuxpasskey do fzf-cd-widget'
bind \t 'test (commandline) = ""; \
  and tmuxpasskey do fzf-cd-widget; \
  or commandline -f complete'
