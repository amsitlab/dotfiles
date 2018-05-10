
if [ -r /proc/meminfo ]; then
	echo -e "\033[36m"
	egrep 'Mem|Cac|Swa' /proc/meminfo
	echo -e "\033[0m"
fi
INC="${HOME}/.dotfiles/bash-powerline.sh"
test -f "$INC" && \
	source $INC
unset INC
