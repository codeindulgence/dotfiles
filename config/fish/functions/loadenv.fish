function loadenv
  if [ -r .env ]
    echo Loaded Environment:
    sed 's/^export/ /' .env
    source .env
  end
end
