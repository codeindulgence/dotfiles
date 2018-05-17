function loadenv
  if [ -r .env ]
    if [ (gsha1sum .env) != "$env_hash" ]
      unloadenv
      # Get the list of vars we're about to load
      set -g env_vars (sed -n 's/^export \([A-z0-9_-]*\)=.*/\1/p' .env)

      # Save the old values if they exist
      for var in $env_vars
        set -g env_vars_old $env_vars_old "$$var"
      end

      # Now load .env
      source .env
      echo Loaded Environment:
      set_color green
      sed -n 's/^export/ /p' .env \
        | sed 's/\(.*\(KEY\|PASS\|SECRET\).*\)=\(...\).*\(...\)/\1=\3********\4/I'
      set_color normal
      and set -g env_loaded (basename $PWD)
      and set -g env_hash (gsha1sum .env)
    end
  end
end
