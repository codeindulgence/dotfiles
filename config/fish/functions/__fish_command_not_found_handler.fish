function __fish_command_not_found_handler --on-event fish_command_not_found
	# Attempt to run as a git command, capture output with errors
  set -l git_attempt (git $argv 2>&1)

  # If it's not a git command, use default error
  echo $git_attempt | grep -q "not a git command"
  and __fish_default_command_not_found_handler $argv[1]

  # Otherwise show the git command output
  or for line in $git_attempt;
    echo $line
  end
end
