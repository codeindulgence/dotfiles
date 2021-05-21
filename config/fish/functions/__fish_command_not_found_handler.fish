function __fish_command_not_found_handler --on-event fish_command_not_found
  z $argv > /dev/null
  and pwd
  or __fish_default_command_not_found_handler $argv[1]
end
