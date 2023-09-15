function ssh
  set -l ssh (which ssh)
  if test -f .ssh
    echo Using .ssh file
    $ssh -F .ssh $argv
  else
    $ssh $argv
  end
end
