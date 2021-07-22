function tmuxnew
  argparse 'd/debug' -- $argv

  set -l current (tmux list-windows -F '#{window_name}')
  set -l hist (z -l | awk '{print $2}' | head -n 15 | xargs -n 1 basename)
  set -l opts '-T "#[align=centre]New Window" -x 0 -y W'
  set -l command 'tmux display-menu ' $opts

  for i in (seq (count $hist))
    set -l name $hist[$i]
    set -l idx (contains -i $name $current)
    if [ -z "$idx" ]
      set command $command "'$name'" $i "'new-window -n \'$name\''"
    else
      set command $command "'$name'" $i "'select-window -t $idx'"
    end
  end

  set command $command "''" "'[New]'" n
  set command $command "'command-prompt -p \'New:\' \'new-window -n \"%%\"\''"

  set -q _flag_debug
  and echo $command
  or eval $command
end
