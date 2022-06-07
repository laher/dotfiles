export HISTCONTROL=ignoredups
export HISTSIZE=10000
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# function cdup {
#   c=$(pwd)
#   d=$1
#   found=0

#   while [ $(basename .) != $d  && $(pwd) != '/' ]; do
#     cd ..
#     if [ $(basename .) == $d ]; then
#       found=1
#     fi
#   done
#   if [ $found == 0 ]; then
#      cd $c
#   fi
# }

function cdup()
{
    if [[ -z "$1" ]]; then
        cd ..
    else
        local -a cdpathtemp
        local integer depth=${#PWD//[^\/]/}
        for (( i = 1; i <= depth; i++ )); do
            cdpathtemp+=(${(l:(($i * 3 - 1))::../::..:)})
        done
        cdpath=($cdpathtemp) cd $1
    fi
    return $?
}

function cddn()
{
    find . -name "$1" cd
}

function set-title(){
  TITLE="\[\e]2;$*\a\]"
  echo -e ${TITLE}
}

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line
