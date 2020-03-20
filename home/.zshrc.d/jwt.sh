#!/bin/zsh

function jwt-decode() {
  #sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode 
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
  #| jq
}

#JWT=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ
#jwt-decode $JWT
