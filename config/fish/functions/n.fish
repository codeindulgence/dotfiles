# Defined in /var/folders/qw/z_sz70pn7kj8s54z9l5848xm0000gn/T//fish.urthXV/n.fish @ line 2
function n
	set filename .notes.md
  set pathname ./$filename
  if [ (count $argv) -gt 0 -a "$argv[1]" = "init" ]
    if [ ! -f $filename ]
      set name (basename (realpath .) | sed 's/^\(.\)/\u\1/' )
      set heading "$name Notes"
      echo $heading > $filename
      echo $heading | sed 's/./=/g' >> $filename
    else
      echo Notes already initialised
    end
  else
    while [ ! -f $pathname ]
      if [ (realpath $pathname) = "/$filename" ]
        echo Notes not found
        break
      end
      set pathname "../$pathname"
    end
    if [ -f "$pathname" ]
      set date (date +%Y-%m-%d)
      # echo grep $date $pathname
      if [ ! (grep $date $pathname) ]
        # echo add date
        echo -e "\n$date" >> $pathname
        echo -e "==========\n\n" >> $pathname
      end
      nvim +normal\ G $pathname
    end
  end
end
