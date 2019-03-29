#!/bin/bash

echo install LSP servers
npm i -g flow-language-server
npm i -g yaml-language-server
npm i -g vscode-json-languageservice
npm i -g bash-language-server 
npm i -g markdown-language-server
npm i -g vscode-html-languageserver-bin
npm i -g vscode-css-languageserver-bin
pip3 install python-language-server
curl -L -o ~/bin/coursier https://git.io/coursier
chmod +x ~/bin/coursier
coursier bootstrap \
  --java-opt -XX:+UseG1GC \
  --java-opt -XX:+UseStringDeduplication  \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=vim-lsc \
  org.scalameta:metals_2.12:0.4.4 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o ~/bin/metals-vim -f

# conflicts with vim-go
# go get -u -v github.com/sourcegraph/go-langserver
