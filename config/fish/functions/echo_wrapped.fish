function echo_wrapped
  echo -n -s (set_color normal) [ (set_color $argv[2]) $argv[1] (set_color normal) ]
end
