
function gsa {
	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && git status -s" \;
}

alias gupp='git pull && git push'
alias gbsd="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"
alias gpsu='git push --set-upstream origin $(git_current_branch)'
function gbrl {
	git branch --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)'| head
}

function gbrr {
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
