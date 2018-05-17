function json2yaml
  cat | ruby -ryaml -rjson -e 'puts YAML.dump(JSON.load($stdin.read))'
end
