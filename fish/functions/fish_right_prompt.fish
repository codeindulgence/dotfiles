function fish_right_prompt
  printf '%s' (__fish_git_prompt)

  echo_wrapped (prompt_pwd) green

  if set -q RUBY_VERSION
    echo_wrapped $RUBY_VERSION red
  end

  if set -q CMD_DURATION
    set -l ms (numfmt --grouping $CMD_DURATION)
    echo_wrapped {$ms}ms magenta
  end
end
