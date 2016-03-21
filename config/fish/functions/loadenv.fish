function loadenv
  if [ -r .env ]
    echo Loaded Environment:
    sed 's/^export/ /' .env
    source .env
    and set -g env_loaded true
  end
end
