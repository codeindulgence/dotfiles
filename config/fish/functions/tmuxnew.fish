function tmuxnew
  argparse 'd/debug' -- $argv

  set -l hist (z -l | awk '{print $2}' | head -n 15 | xargs -n 1 basename)
  set -l opts '-T "#[align=centre]New Window" -x 0 -y W'
  set -l command 'tmux display-menu ' $opts

  for i in (seq (count $hist))
    set -l name $hist[$i]
    set command $command "'$name'" $i "'new-window -n \'$name\''"
  end

  set command $command "''" "'[New]'" n
  set command $command "'command-prompt -p \'New:\' \'new-window -n \"%%\"\''"

  set -q _flag_debug
  and echo $command
  or eval $command
end
