function yaml2json
  cat | ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load($stdin.read))'
end
