#!/usr/bin/zsh
PATH="$PATH:$HOME/go/bin"

function cover {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}
