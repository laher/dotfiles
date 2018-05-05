
autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala Shortcut EnType nnoremap <localleader>t :EnType<CR>
au FileType scala Shortcut EnDocBrowse nnoremap <localleader>d :EnDocBrowse<CR>

