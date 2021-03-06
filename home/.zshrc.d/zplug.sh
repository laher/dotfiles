if [[ -f ~/.zplug/init.zsh ]]; then
	source ~/.zplug/init.zsh
fi
# Zplug plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

#zplug "modules/tmux",       from:prezto
#zplug "modules/history",    from:prezto
#zplug "modules/utility",    from:prezto
#zplug "modules/ruby",       from:prezto
zplug "modules/ssh",        from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto

# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
zmodload zsh/terminfo
#bindkey "$terminfo[cuu1]" history-substring-search-up
#bindkey "$terminfo[cud1]" history-substring-search-down


zplug "eendroroy/alien"
#zplug "jackharrisonsherlock/common"

export ZSH_THEME="alien"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*linux*amd64*"

# fuzzy filtering
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"

# Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh
# zplug "plugins/dotenv",  from:oh-my-zsh

zplug 'wfxr/formarks'
# zplug 'wfxr/forgit' # fzf things for git-add and git-diff

# zplug "ezh/fzf-ls"
zplug 'fdw/ranger-autojump'
zplug load

# fzf
source ~/.zplug/repos/junegunn/fzf/shell/key-bindings.zsh
source ~/.zplug/repos/junegunn/fzf/shell/completion.zsh
