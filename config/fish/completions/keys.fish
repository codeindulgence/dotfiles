# GLOBAL OPTIONS:
#    --log-level value  log level (debug, info, warn, err) (default: "warn")
#    --app value        app name (default: "Keys")
#    --help, -h         show help
#    --version, -v      print the version

set -l cmds admin auth unlock config db decrypt encrypt export generate import
set -a cmds key keyring list lock log pull push publish rand remove restart
set -a cmds sigchain sign start stop uninstall user verify wormhole help h

set -l admin_cmds sign-url
set -l db_cmds collections documents
set -l user_cmds find search setup sign add

function __fish_at_subcommand
  if [ (commandline -poc)[-1] = "$argv" ]
    return 0
  end
  return 1
end

# function __fish_has_subcommand_at -a subcmd pos
#     set -l cmds (commandline -poc)
#     set -e cmds[1]
#     if [ (commandline -poc)[-1] = "$argv" ]
#       return 0
#     end
#     return 1
# end

function __fish_keys_list
  set -l uids
  set -l kids
  set -l all

  for key in (keys list)
    set -l key (string split -n " " $key)
    set -l kid $key[1]
    set -l uid $key[2]
    set -a kids $kid
    if [ -n "$uid" ];
      set -a uids $uid
    end
  end
  set all $uids $kids
  for key in $all
    echo $key
  end
end

complete -c keys -f
complete -c keys -n "not __fish_seen_subcommand_from $cmds" -a "$cmds"
complete -c keys -n "__fish_at_subcommand admin" -a "$admin_cmds"
complete -c keys -n "__fish_at_subcommand db"    -a "$db_cmds"
complete -c keys -n "__fish_at_subcommand user"  -a "$user_cmds"

complete -c keys -n "__fish_at_subcommand sign-url" -a "--signer --method --url"
complete -c keys -n "__fish_at_subcommand key" -a "(__fish_keys_list)"
