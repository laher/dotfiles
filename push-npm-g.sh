npm list -g --depth 0 --parseable|sed 's/node_modules\//`/'|grep '`'|cut -d'`' -f 2|tee packages/npm-g-packages.txt
