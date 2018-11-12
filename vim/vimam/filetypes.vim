
"autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 noexpandtab
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" dotoo
au BufRead,BufNewFile *.org		set filetype=dotoo
"" autocmd BufWritePost *.org execute '!emacs ' + expand(<afile>) + '--batch -f org-html-export-to-html -kill'
autocmd BufWritePost *.org silent! !emacs <afile> --batch -f org-html-export-to-html -kill 2> /dev/null
let g:dotoo#capture#refile="~/o/refile.org"
let g:dotoo#agenda#files=["~/o/*.org","~/o/b/*.org","~/o/y/*.org","~/o/r/*.org"]

" smoosh
au BufRead,BufNewFile *.smoosh set filetype=smoosh
au BufRead,BufNewFile *.smoosh set syntax=smoosh
autocmd FileType smoosh setlocal commentstring="# %s"
autocmd FileType smoosh setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType dot autocmd BufWritePre <buffer> :GraphvizCompile

