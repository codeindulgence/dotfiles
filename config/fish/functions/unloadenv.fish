function unloadenv
  if not set -q env_loaded
    return
  end

  echo Unloading:
  for i in (seq (count $env_vars))
    if [ -n $env_vars_old[$i] ]
      echo (set_color yellow) \~ $env_vars[$i]: $env_vars_old[$i]
      set -g $env_vars[$i] $env_vars_old[$i]
    else
      echo (set_color red) - $env_vars[$i]
      set -e $env_vars[$i]
    end
  end
  set -e env_vars
  set -e env_vars_old
  set -e env_loaded
  set -e env_hash
  set_color normal
end
