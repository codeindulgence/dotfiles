function mux
  set -l count 1

  set -l cmd $argv[1]

  set -l vars (string split , $argv[2])

  set -l sfx ""

  if [ (count $argv) -gt 2 ]
    set sfx $argv[3]
  end

  tmux new-window

  for var in $vars
    tmux send-keys -t $count "export MUXV=\"$var\""
    tmux send-keys -t $count "$cmd $var $sfx # Enter to run"
    if [ $count -lt (count $vars) ]
      if [ (math $count%2) -eq 0 ]
        set ori "-h"
      else
        set ori "-v"
      end
      tmux split $ori
    end
    set count (math $count + 1)
  end

  tmux select-layout tiled
  tmux set-window-option synchronize-panes on
end
