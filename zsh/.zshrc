# just includes ...
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [[ -d ~/.zshrc.d ]]; then
	for f in ~/.zshrc.d/*(N); do
		source $f
	done
fi

if [ -d ~/.zshrc.movio.d ]; then
    for f in ~/.zshrc.movio.d/*(N); do
	source $f
    done
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.aliases.local ]; then
    source ~/.aliases.local
fi

#alias gt='go test'

#autoload -U +X bashcompinit && bashcompinit

#complete -C /home/am/go/bin/kubelete kt

#complete -C /home/am/go/bin/kubelete ks3

#autoload -U +X bashcompinit && bashcompinit

#complete -C "/home/am/go/bin/kuplete" s3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ -f /home/am/.travis/travis.sh ] && source /home/am/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
