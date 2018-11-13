#!/bin/bash

echo install LSP servers
yarn global add flow-language-server
npm i -g yaml-language-server
npm i -g vscode-json-languageservice
npm i -g bash-language-server 
go get -u -v github.com/sourcegraph/go-langserver
