if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux -f ~/.config/tmux/tmux.conf new-session -A -s main -n Home
    end
  else
    source ("/usr/local/bin/starship" init fish --print-full-init | psub)
    set -l window_name (tmux display -p '#{window_name}')

    # Bindings
    set fish_key_bindings fish_default_key_bindings

    # Biome
    set -g _biome_mask_char ''

    # Set tab width
    tabs -2

    if ! contains "$window_name" Home New fish
      type -q $window_name
      and exec $window_name
      or z $window_name >/dev/null
    end
  end
end
