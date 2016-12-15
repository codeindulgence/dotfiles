function cdgem
  cd (string replace -r '/lib$' '' (dirname (gem which $argv[1])))
end
