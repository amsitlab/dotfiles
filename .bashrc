
if [ -r /proc/meminfo ]; then
	echo -e "\033[36m"
	egrep 'Mem|Cac|Swa' /proc/meminfo
	echo -e "\033[0m"
fi
INC="${HOME}/.dotfiles/bash-powerline.sh"
test -f "$INC" && \
	source $INC
unset INC
test -f ~/.dotfiles/aliases && \
	source ~/.dotfiles/aliases

LAUNCH_APP_FILE=${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher
test -f $LAUNCH_APP_FILE && \
	source $LAUNCH_APP_FILE;


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/data/data/com.termux/files/home/.sdkman"
[[ -s "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh" ]] && source "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh"
