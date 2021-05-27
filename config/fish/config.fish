if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux -f ~/.config/tmux/tmux.conf new-session -A -s main -n Home
    end
  end

  source ("/usr/local/bin/starship" init fish --print-full-init | psub)

  set EDITOR nvim
  set -x ANSIBLE_NOCOWS 1

  if set -q TMUX
    set -l window_name (tmux display -p '#{window_name}')
    if [ "$window_name" != "Home" ]
      z $window_name >/dev/null
    end
  end

  # Bindings
  set fish_key_bindings fish_default_key_bindings

  # Biome
  set -g _biome_mask_char ''

  # Set tab width
  tabs -2
end
