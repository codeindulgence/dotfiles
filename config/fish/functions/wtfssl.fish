function wtfssl
  echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 | openssl x509 -inform pem -noout -text
end
