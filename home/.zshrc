#source "$HOME/.slimzsh/slim.zsh"

if [ -d ~/.zshenv ]; then
    source ~/.zshenv
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [[ -d ~/.zshrc.d ]]; then
    source ~/.zshrc.d/nvim.sh
    source ~/.zshrc.d/brew.sh
    source ~/.zshrc.d/docker.sh
    source ~/.zshrc.d/fzf.sh
    source ~/.zshrc.d/git.sh
    source ~/.zshrc.d/go.sh
    source ~/.zshrc.d/powerline.sh
    source ~/.zshrc.d/shell.sh
    source ~/.zshrc.d/zplug.sh
 	# for f in ~/.zshrc.d/*.sh(N); do # (N) is the NULL_GLOB option. Don't error if empty
 	# 	source $f
 	# done
 fi

if [ -d ~/.zshrc.private.d ]; then
    for f in ~/.zshrc.private.d/*(N); do
	source $f
    done
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.aliases.local ]; then
    source ~/.aliases.local
fi

#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

