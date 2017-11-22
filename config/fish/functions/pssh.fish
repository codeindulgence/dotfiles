# Defined in /var/folders/lj/8_scdnrj3gb_hgmzd2tp_c7m0000gn/T//fish.WBJY3j/pssh.fish @ line 2
function pssh
	if test (count $argv) -gt 2
    set opts $argv[3]
  end
  set -l proxy_host $argv[1]
  ssh -o ProxyCommand="ssh $proxy_host -W %h:%p" $opts $argv[2]
end
