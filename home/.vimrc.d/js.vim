
au FileType js nmap <LocalLeader>r :ALEGoToReferences<CR>
au FileType js nmap <LocalLeader>f :FlowJumpToDef<CR>

" Syntax for js etc
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
augroup yellowui
  au! BufWritePost ~/d/**/*.ts :Fixmyjs
  au! BufWritePost ~/d/**/*.js :Fixmyjs
  au! BufWritePost ~/d/**/*.vue :Fixmyjs
  "au! BufWritePre ~/**/*.js :PrettierAsync
  "au! BufWritePre ~/**/*.css :PrettierAsync
augroup END

" au! BufWritePre ~/workspace/**.json :%!jq .

" Use tern_for_vim.
let g:tern#command = ["/usr/bin/tern"]
let g:tern#arguments = ["--persistent"]

" let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
" let g:deoplete#sources#ternjs#timeout = 1
let g:neosnippet#enable_completed_snippet = 1


