function cd --description 'Change directory'
  # Skip history in subshells
  if status --is-command-substitution
    builtin cd $argv
    return $status
  end

  # Avoid set completions
  set -l previous $PWD

  if test $argv[1] = - ^/dev/null
    if test "$__fish_cd_direction" = next ^/dev/null
      nextd
    else
      prevd
    end
    loadenv
    return $status
  end

  builtin cd $argv[1]

  # Directory history tracking

  # If pwd is in the list somewhere, remove it
  if contains "$PWD" $dirhist
    set -e dirhist[(contains -i $PWD $dirhist)]
  end

  set -U dirhist (command pwd) $dirhist
  if [ (count $dirhist) -gt 10 ]
    set -U dirhist $dirhist[1..10]
  end

  set -l cd_status $status

  if test $cd_status = 0 -a "$PWD" != "$previous"
    set -g dirprev $dirprev $previous
    set -e dirnext
    set -g __fish_cd_direction prev
  end

  loadenv
  chruby-auto

  return $cd_status
end
