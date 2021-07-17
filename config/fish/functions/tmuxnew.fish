function tmuxnew
  argparse 'd/debug' 'r/reset' -- $argv

  if set -q _flag_reset
    set -eU tmux_history
    echo History reset
    return
  end

  if not set -q tmux_history
    tmux command-prompt -p 'New:' "new-window -n '%%'"
    return
  end

  set -l opts '-T "#[align=centre]New Window" -x 0 -y W'
  set -l command 'tmux display-menu ' $opts

  for i in (seq (count $tmux_history))
    set -l name $tmux_history[$i]
    set command $command "'$name'" $i "'new-window -n \'$name\''"
  end

  set command $command "''" "'[New]'" n
  set command $command "'command-prompt -p \'New:\' \'new-window -n \"%%\"\''"

  set -q _flag_debug
  and echo $command
  or eval $command
end
