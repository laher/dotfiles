zmodload zsh/datetime

function preexec() {
  __TIMER=$EPOCHREALTIME
}

function powerline_precmd() {
  local __ERRCODE=$?
  local __DURATION=0

  if [ -n $__TIMER ]; then
    local __ERT=$EPOCHREALTIME
    __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
  fi
  PS1="$(${HOME}/go/bin/powerline-go -shell-var ENV_NAME -duration $__DURATION -error $__ERRCODE -theme gruvbox -git-mode simple -hostname-only-if-ssh -modules "venv,host,ssh,cwd,perms,git,hg,exit,root,duration,shell-var")"
  unset __TIMER
    #  -jobs ${${(%):%j}:-0}
    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "${HOME}/go/bin/powerline-go" ]; then
    install_powerline_precmd
fi
