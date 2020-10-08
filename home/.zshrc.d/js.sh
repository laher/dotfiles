npm_global=~/.npm-global
export NODE_PATH="$npm_global/lib/node_modules${NODE_PATH:+:}$NODE_PATH"
PATH="$npm_global/bin:$PATH"
export MANPATH="$npm_global/share/man:$(unset MANPATH; manpath)"
