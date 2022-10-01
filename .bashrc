if [ -r /proc/meminfo ]; then
   echo -e "\033[36m"
   grep -E 'Mem|Cac|Swa' /proc/meminfo
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


# $1 must be glob pattern like
# /path/to/*/bin
function register_glob_path() {
   for p in $(ls -d $1) ; do
      PATH=${PATH}:$p
   done
}

default=$PATH
PATH=${HOME}/bin                  # replace / patch
PATH=${PATH}:${PREFIX}/local/bin  # local
PATH=${PATH}:$default             # default/main
PATH=${PATH}:${PREFIX}/opt        # optional
register_glob_path ${PREFIX}/opt/*/bin




#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/data/data/com.termux/files/home/.sdkman"
[[ -s "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh" ]] && source "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh"


# [ set defaut editor ]
EDITOR=${HOME}/bin/termux-file-editor
test -f $EDITOR && export EDITOR

