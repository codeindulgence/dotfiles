function yaml2json
  cat | ruby -ryaml -rjson -e 'puts JSON.dump(YAML.load($stdin.read))'
end
