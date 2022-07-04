function powerline_precmd() {
  PS1="$($(go env GOPATH)/bin/powerline-go -error $? -theme gruvbox -jobs ${${(%):%j}:-0})"
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

if [ "$TERM" != "linux" ] && [ -f "$(go env GOPATH)/bin/powerline-go" ]; then
    install_powerline_precmd
fi
