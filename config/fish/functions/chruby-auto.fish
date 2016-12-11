function chruby-auto
  if [ -f .ruby-version ]
    set -l ruby_version (cat .ruby-version)
    string match -q '*'$ruby_version $RUBIES
    and chruby "$ruby_version"
    and echo -n Loaded Ruby: 
    or echo -n Can\'t find Ruby: 
    echo (set_color red) $ruby_version
  end
end
