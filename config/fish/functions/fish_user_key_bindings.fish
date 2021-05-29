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
  set -l hist_file ~/.local/share/fzf-history/recent

  begin
    parents
    z -l | awk "{print \$2}" | grep -v "^$PWD\$"
  end | fzf --height 40% $FZF_REVERSE_OPTS --history=$hist_file | read -l result

  if [ -n "$result" ]
    commandline "cd $result"
    commandline -f execute
  end

  commandline -f repaint
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
