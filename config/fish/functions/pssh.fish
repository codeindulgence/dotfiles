function pssh
  set -l proxy_host $argv[1]
  set -l opts $argv[2..-1]
  ssh -o ProxyCommand="ssh $proxy_host -W %h:%p" $opts
end
