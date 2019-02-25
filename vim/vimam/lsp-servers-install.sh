#!/bin/bash

echo install LSP servers
yarn global add flow-language-server
npm i -g yaml-language-server
npm i -g vscode-json-languageservice
npm i -g bash-language-server 
npm i -g markdown-language-server
yarn global add vscode-html-languageserver-bin
yarn global add vscode-css-languageserver-bin
pip3 install python-language-server

# conflicts with vim-go
# go get -u -v github.com/sourcegraph/go-langserver
