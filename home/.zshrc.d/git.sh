export RED='\033[0;31m'
export CYAN='\033[0;36m'
export GREEN='\033[0;32m'
export NOCOL='\033[0m'

function gcd {

  if [ $# -eq 0 ]
  then
    dest=$(gall list| fzf)
  else
    dest=$(gall list| fzf -1 -q $1)
  fi
  if [ "$dest" != "" ]
  then
    cd "$dest"
  fi
}

function glg {
  if [ $# -eq 0 ]
  then
    cd $(gall list| fzf) && lg
  else
    cd $(gall list| fzf -1 -q $1) && lg
  fi

}
# use `gall` now
# function gallf {
#   find . -maxdepth 2 -name .git -type d -execdir bash -c "echo -en \"${CYAN}./\" && realpath --relative-to='$(pwd)' . && echo -en \"${NOCOL}\" && git $*" \;
# }

# function gallb {
#   find . -maxdepth 2 -name .git -type d -execdir bash -c "echo -en \"${NOCOL}./\" && realpath --relative-to='$(pwd)' . && echo -en \"${GREEN} * \" && git branch --show-current" \;
# }
# function galls {
#   gall status -s
# }
# function gallfall {
# 	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && git fetch --all" \;
# }

# # for sanity checking gall
# function eall {
# 	find . -maxdepth 2 -name .git -type d -execdir bash -c "pwd && echo $*" \;
# }

alias gfo='git fetch origin'
alias gfa='git fetch --all'


function git_current_branch() {
      #git branch --no-color | grep -E '^\*' | awk '{print $2}' \
      #  || echo "default_value"
      git branch --show-current
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
function cb {
  gbrl
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

# last commit
alias glc='git rev-parse --verify HEAD'
# last commit for
function glcf {
	pushd "$1"
	git rev-parse --verify HEAD
	popd
}

# git for
function gf {
	pushd "$1"
	git "${@:2}"
	popd
}

# cd to the git root
function cdg {
	cd "$(git rev-parse --show-toplevel)"
}

function squash {
  git reset $(git merge-base origin/main $(git rev-parse --abbrev-ref HEAD))
}

function squashbranch {
  git reset $(git merge-base "$1" $(git rev-parse --abbrev-ref HEAD))
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

function gp {
  cb="$(git branch --show-current)"
case ${cb} in
  main | master | production | development)
    echo "nope. not push onto ${cb} branch"
    ;;
  *)
    git push
    ;;
esac
}


function forcepush {
  cb="$(git branch --show-current)"
case ${cb} in
  main | master | production | development)
    echo "nope. not forcing push onto ${cb} branch"
    return 1
    ;;

  "")
    echo "not on a branch"
    return 1
    ;;

  *)
    git push --force-with-lease
    ;;

esac
}

alias pullreq='hub pull-request -b main -m'
alias tag='git describe --tags --abbrev=0'
alias tagdiff='git diff --exit-code `git describe --tags --abbrev=0`'
alias branch-diff='git log --graph --abbrev-commit --date=relative'
alias glogmain='git log --graph --abbrev-commit --date=relative HEAD ^main'

alias g='git '
alias gs='git status '
# alias gp='git push' this is now a function
alias gl='git pull'
alias gc='git commit'
alias gcs='git commit -S'
alias gco='git checkout'
alias contributors='git shortlog -s -n'
alias gsh='git stash --include-untracked'
alias grb='git rebase --interactive'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
# alias grbm='git rebase --interactive origin/main'

function grbm {
  git fetch --all && git rebase --interactive origin/main
}

function grbb {
  git fetch --all && git rebase --interactive "$1"
}

alias yoink='git fetch --all && git rebase --interactive origin/main'
# alias yeet='git push --force-with-lease'
# see function
# alias forcepush='git push --force-with-lease'


alias ga='git add '
alias gd='git diff'
alias gdno='git diff --name-only'
alias gdnom='git diff --name-only origin/main'

alias gsb='git switch'
alias gnb='git switch -c'

# pull request
g-pr() {
  to_branch=$1
  if [ -z $to_branch ]; then
    to_branch="main"
  fi

  # try the upstream branch if possible, otherwise origin will do
  upstream=$(git config --get remote.upstream.url)
  origin=$(git config --get remote.origin.url)
  if [ -z $upstream ]; then
    upstream=$origin
  fi

  to_user=$(echo $upstream | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  from_user=$(echo $origin | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  repo=$(basename `git rev-parse --show-toplevel`)
  from_branch=$(git rev-parse --abbrev-ref HEAD)
  open "https://github.com/$to_user/$repo/pull/new/$to_user:$to_branch...$from_user:$from_branch"
}
