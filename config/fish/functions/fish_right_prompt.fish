function fish_right_prompt
  printf '%s' (__fish_git_prompt)

  if set -q RUBY_VERSION
    echo_wrapped $RUBY_VERSION red
  end

  if [ "$CMD_DURATION" -gt 0 ]
    set -l ms (numfmt --grouping $CMD_DURATION)
    echo_wrapped {$ms}ms magenta
  end

  if [ -r .env ]
    echo_wrapped ENV red
  end

  echo_wrapped (prompt_pwd) green
end
