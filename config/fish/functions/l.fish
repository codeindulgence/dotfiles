# Defined in /var/folders/gg/7kd96zf934bbjgd1v7tq4hzc0000gn/T//fish.iiZ8Hm/l.fish @ line 2
function l
    lsd -lA --date relative --blocks permission,user,size,date,name --group-dirs first $argv
end
