function tmuxpasskey
  set -l mode $argv[1]

  if [ "$mode" = "on" ]
    tmux set-environment -g tmuxpasskey on
  else if [ "$mode" = "off" ]
    tmux set-environment -ug tmuxpasskey
  else if [ "$mode" = "off!" ]
    tmux set-environment -g tmuxpasskey off
  else if [ "$mode" = "dont" ]
    tmux set-environment -g tmuxpasskey off
    $argv[2..]
    tmux set-environment -ug tmuxpasskey
  else if [ "$mode" = "do" ]
    tmux set-environment -g tmuxpasskey on
    $argv[2..]
    tmux set-environment -ug tmuxpasskey
  else
    set -l pass (tmux showenv -g tmuxpasskey 2>/dev/null)

    if [ "$pass" = "tmuxpasskey=on" ]
      true
    else if [ "$pass" = "tmuxpasskey=off" ]
      false
    else
      tmux display -p '#{pane_current_command}' \
        | grep -iqE '(^|\/)g?(view|n?vim?x?)?(diff)?(fzf)?$'
    end
  end
end
