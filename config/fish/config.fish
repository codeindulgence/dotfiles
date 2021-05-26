if status --is-interactive
  if not set -q TMUX
    if not set -q SSH_CLIENT
      tmux -f ~/.config/tmux/tmux.conf new-session -A -s main -n Home
    end
  end

  source ("/usr/local/bin/starship" init fish --print-full-init | psub)

  set EDITOR nvim
  set -x ANSIBLE_NOCOWS 1

  # FZF Options
  set -x FZF_DEFAULT_COMMAND 'fd --no-ignore-vcs -t f'
  set -x FZF_ALT_C_COMMAND 'fd --no-ignore -t d . $dir'
  set -x FZF_CTRL_T_COMMAND 'fd --no-ignore -t d -t f . $dir'
  set -x FZF_DEFAULT_OPTS '--prompt "❯ " '\
    '--pointer "❯ " '\
    '--bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" '\
    '--bind "ctrl-e:preview-down,ctrl-y:preview-up" '\
    '--bind "ctrl-/:toggle-preview" '\
    '--preview "bat --color always --decorations never {}" '\
    '--preview-window up,50%,border-horizontal,hidden'\
    '--color pointer:5,info:8,spinner:8,header:8'\
    '--color prompt:2,marker:3,border:17,fg:17,fg+:4,bg+:#2e3440,hl:6,hl+:6'

  # Bindings
  set fish_key_bindings fish_default_key_bindings

  # Biome
  set -g _biome_mask_char ''

  # Set tab width
  tabs -2
end
