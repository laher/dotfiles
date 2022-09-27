export RED='\033[0;31m'
export CYAN='\033[0;36m'
export GREEN='\033[0;32m'
export NOCOL='\033[0m'
function gall {
  find . -maxdepth 2 -name .git -type d -execdir bash -c "echo -en \"${CYAN}./\" && realpath --relative-to='$(pwd)' . && echo -en \"${NOCOL}\" && git $*" \;
}

function gallb {
  find . -maxdepth 2 -name .git -type d -execdir bash -c "echo -en \"${NOCOL}./\" && realpath --relative-to='$(pwd)' . && echo -en \"${GREEN} * \" && git branch --show-current" \;
}
function galls {
  gall status -s
}
function gallfall {
	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && git fetch --all" \;
}

# for sanity checking gall
function eall {
	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && echo $*" \;
}

alias gfa='git fetch --all'


function git_current_branch() {
      git branch --no-color | grep -E '^\*' | awk '{print $2}' \
        || echo "default_value"
      # or
      # git symbolic-ref --short -q HEAD || echo "default_value";
}
alias gpsu='git push --set-upstream origin $(git_current_branch)'
alias gpsu2='git push --set-upstream origin $(git symbolic-ref --short -q HEAD)'

function gr {
  git rev-parse --show-toplevel
}

alias gupp='git pull && git push'
alias gbsd="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"
function gbrll {
	git branch --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)'| head
}

function gbrl {
	local ref branch
	ref=$(git branch --sort='-committerdate:iso8601' --format='%(refname)'| fzf) && \
		branch=${ref#"refs/heads/"} && \
		git checkout $branch
}

function gbrr {
	local ref branch
	ref=$(git branch -r --sort='-committerdate:iso8601' --format='%(refname)'| fzf) && \
		branch=${ref#"refs/remotes/origin/"} && \
		git checkout $branch
}

function gbrrl {
	git branch -r --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)'| head
}

function gtp {
	git tag "$1"
	git push origin "$1"
}

git config --global core.excludesfile ~/.gitignore_global

function glcf {
	pushd "$1"
	git rev-parse --verify HEAD
	popd
}

function gf {
	pushd "$1"
	git "${@:2}"
	popd
}

function cdg {
	cd "$(git rev-parse --show-toplevel)"
}

lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
