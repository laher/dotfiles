#!/usr/bin/zsh
PATH="$PATH:$HOME/go/bin"
alias gb='go build'

alias go-lsdep="${HOME}/.zshrc.d/go-lsdep"

function go-cover {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}

function go-cover-html {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

function go-cover-count {
  go test -covermode=count -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

function go-watchtest {
  go test $@
  fswatch -t -o ./ | xargs -n1 -I{} go test $@
}

function go-lintchanges {
  golangci-lint run --new-from-rev origin/main --tests=false
}

function go-lintchanges-withtests {
  golangci-lint run --new-from-rev origin/main
}
