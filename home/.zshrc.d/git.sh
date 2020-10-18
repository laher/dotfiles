
function gsa {
	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && git status -s" \;
}

alias gupp='git pull && git push'
alias gbsd="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"
alias gpsu='git push --set-upstream origin $(git_current_branch)'
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
	branch=$(git branch -r --sort='-committerdate:iso8601' --format='%(refname)'| fzf) && \
		branch=${ref#"refs/heads/"} && \
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
