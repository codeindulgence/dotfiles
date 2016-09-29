function f
  if [ (count $argv) -gt 1 ]
    find $argv[2] -iname "*$argv[1]*"
  else
    find -iname "*$argv[1]*"
  end
end
