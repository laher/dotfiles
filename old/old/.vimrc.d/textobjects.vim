

" date `cit` e.g. 2001-01-01
" time `cit` e.g. 10:10:11
 " call textobj#user#plugin('datetime', {
" \   'date': {
" \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
" \     'select': ['ad', 'id'],
" \   },
" \   'time': {
" \     'pattern': '\<\d\d:\d\d:\d\d\>',
" \     'select': ['at', 'it'],
" \   },
" \ })

""" http://springest.io/vim-motions-and-command-language

" `cij` changes inner json
" gqaj pretty-prints around json
" gqaj "pretty prints" (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
" gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
" e.g. {"x": "y"}

" vim-textobj-entire
"    ae targets the entire content of the current buffer.
"    ie is similar to ae, but ie does not include leading and trailing empty lines. ie is handy for some situations. For example,
"        Paste some text into a new buffer (<C-w>n"*P) -- note that the initial empty line is left as the last line.
"        Edit the text (:%s/foo/bar/g etc)
"        Then copy the resulting text to another application ("*yie)
