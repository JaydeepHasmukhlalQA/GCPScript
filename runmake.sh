#!/bin/bash

CYAN="\e[36m"
GREEN="\e[32m"
NONE="\e[39m"

echo -e "${CYAN}What would you like to to? (install/destroy)${NONE}"
read userinput

case $userinput in
	"install")  make poolapi-apply
				make poolui-apply
				;;

	"destroy")  make poolapi-destroy
				make poolui-destroy
				;;
esac