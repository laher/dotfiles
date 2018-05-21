
" Syntax for js etc
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

"autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" dotoo
au BufRead,BufNewFile *.org		set filetype=dotoo
let g:dotoo#capture#refile="~/o/refile.org"
let g:dotoo#agenda#files=["~/o/*.org","~/o/b/*.org","~/o/y/*.org","~/o/r/*.org"]

" smoosh
au BufRead,BufNewFile *.smoosh set filetype=smoosh
au BufRead,BufNewFile *.smoosh set syntax=smoosh
autocmd FileType smoosh setlocal commentstring="# %s"
autocmd FileType smoosh setlocal shiftwidth=2 tabstop=2 expandtab
