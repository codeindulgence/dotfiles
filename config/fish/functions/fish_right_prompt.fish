function fish_right_prompt
  printf '%s' (__fish_git_prompt)

  # Ruby Version
  if set -q RUBY_VERSION
    echo_wrapped $RUBY_VERSION red
  end

  # Command Duration
  if [ "$CMD_DURATION" -gt 0 ]
    set -l ms (numfmt --grouping $CMD_DURATION)
    echo_wrapped {$ms}ms magenta
  end

  # Local .env file
  if set -q env_loaded
    echo_wrapped "ENV:$env_loaded" red
  end

  # PWD
  echo_wrapped (prompt_pwd) green
end
