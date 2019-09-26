if type -q lsd
  function l
    lsd -l --date relative --blocks permission,user,size,date,name --group-dirs first $argv
  end
end
