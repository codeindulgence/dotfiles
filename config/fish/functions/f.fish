function f
  if [ (count $argv) -gt 1 ]
    find $argv[2] -name "*$argv[1]*"
  else
    find -name "*$argv[1]*"
  end
end
