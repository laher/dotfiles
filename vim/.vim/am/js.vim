
au FileType js Shortcut Ref nmap <LocalLeader>r :ALEGoToReferences<CR>
au FileType js Shortcut Def nmap <LocalLeader>f :ALEGoToDefinition<CR>

" Syntax for js etc
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
augroup yellowui
  au! BufWritePre ~/**/yellow-ui/**/*.js :Prettier
augroup END
