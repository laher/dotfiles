#!/usr/bin/zsh
PATH="$PATH:$HOME/go/bin"

function cover {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}

function cover-html {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
