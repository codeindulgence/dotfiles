function fish_user_key_bindings
  bind \ek history-token-search-backward
  bind \ej history-token-search-forward
  bind \cx\ce edit_command_buffer
  bind \cw backward-kill-word
end

if type -q fzf_key_bindings
  fzf_key_bindings
end
