#!/usr/bin/zsh

alias er='systemctl restart --user emacs'
alias estop='systemctl stop --user emacs'
alias estart='systemctl start --user emacs'

function e {
  #emacsclient --create-frame -n ${@}
  emacsclient -c -F "'(fullscreen . maximized)" -n ${@}
}

function et {
  emacsclient -t ${@}
}


function eo {
    #emacsclient --create-frame -n ${@}
  args=()
  init=0
  for a in ${@}; do
      if [ init == 1 ]; then
          args+=("-f")
          args+=("split-window-horizontally")
      fi
      args+=($a)
      init=1
  done
  emacs ${args}
}

function org-export-html {
  emacs ${@} --batch -f org-html-export-to-html -kill
}
