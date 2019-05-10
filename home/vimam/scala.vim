
" autocmd BufWritePost *.scala silent :EnTypeCheck
"au FileType scala nnoremap <localleader>t :EnType<CR>
" au FileType scala nnoremap <localleader>d :EnDocBrowse<CR>
" necessary for EnDocBrowse
let $BROWSER = '/usr/bin/firefox %s'
