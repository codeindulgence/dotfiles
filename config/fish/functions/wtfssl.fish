# Defined in /var/folders/lj/8_scdnrj3gb_hgmzd2tp_c7m0000gn/T//fish.wPxCRn/wtfssl.fish @ line 1
function wtfssl
	echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 | openssl x509 -inform pem -noout -text
end
