function dirhist --description 'Print directory stack'
  echo Directory History:
  for i in (seq (count $dirhist))
    echo $i: $dirhist[$i]
  end
end
