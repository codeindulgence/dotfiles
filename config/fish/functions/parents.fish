function parents
  set -l parents (string split / $PWD)
  set -l idx -2
  set -l parent (string join / $parents[1..$idx])
  while ! contains "$parent" "$HOME" ""
    set parent (string join / $parents[1..$idx])
    set idx (math $idx - 1)
    echo $parent
  end
end
