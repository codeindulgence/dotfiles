function fish_prompt --description 'Write out the prompt'
  # Just calculate this once, to save a few cycles when displaying the prompt
  if not set -q __hostname
    set -g __hostname (hostname|cut -d . -f 1)
  end

  set -l color_cwd

  switch $USER
  case root toor
    if set -q fish_color_cwd_root
      set color_cwd $fish_color_cwd_root
    else
      set color_cwd $fish_color_cwd
    end
    set suffix '#'
  case nick
    set suffix 'λ'
  case '*'
    set color_cwd $fish_color_cwd
    set suffix '>'
  end

  # Check for TMUX session name
  if set -q TMUX
    echo_wrapped (tmux display-message -p '#S') purple
  end

  # Check for SSH session
  if set -q SSH_CLIENT
    echo_wrapped Remote red
  end

  # Supress username if it equals default_user
  if [ $USER != "$default_user" ]
    echo -n -s $USER@
  end

  # Put it all together and what have you got?
  echo -n -s $__hostname (set_color red) :: (set_color blue) "$suffix " (set_color normal)
end
