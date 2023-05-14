export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"

export HISTSIZE=99999999
export HISTFILESIZE=${HISTSIZE}

# export EDITOR="nvim"

if [ -n "$NVIM" ]; then
    export VISUAL="nvr"
    export EDITOR="nvr"
    #export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    #export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="/opt/homebrew/bin/neovide -- --listen /tmp/nvimsocket"
    export EDITOR="nvim"
fi
#. "$HOME/.cargo/env"
