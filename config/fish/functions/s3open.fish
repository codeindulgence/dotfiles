# Defined in /var/folders/gg/7kd96zf934bbjgd1v7tq4hzc0000gn/T//fish.c68Kqs/s3open.fish @ line 1
function s3open --argument uri
	aws s3 cp $uri - | vim -
end
