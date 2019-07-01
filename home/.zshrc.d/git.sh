
function gsa {
	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && git status" \;
}

alias gupp='git pull && git push'
alias gbsd="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"

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
