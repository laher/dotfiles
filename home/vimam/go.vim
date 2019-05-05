
" Go stuff
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"

let g:go_auto_type_info = 0
let g:go_updatetime = 2000
let g:go_info_mode = 'gocode'
let g:go_auto_sameids = 1 

" remove gd mappings
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'

let g:ale_go_langserver_executable = 'gopls'

" vim-go
augroup vg
"au FileType go nmap <LocalLeader>b :GoBuild<CR>
" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go Shortcut GoCallers nmap <LocalLeader>c :GoCallers<CR>
au FileType go Shortcut GoCallees nmap <LocalLeader>ce :GoCallees<CR>
au FileType go Shortcut GoCoverageToggle nmap <LocalLeader>? :GoCoverageToggle<CR>
au FileType go Shortcut GoDefPop nmap <LocalLeader>D :GoDefPop<CR>
au FileType go Shortcut GoImplements nmap <LocalLeader>v :GoImplements<CR>
au FileType go Shortcut GoImports nmap <LocalLeader>I :GoImports<CR>
au FileType go Shortcut GoInstall nmap <LocalLeader>i :GoInstall<CR>
au FileType go Shortcut GoPlay nmap <LocalLeader>y :GoPlay<CR>
au FileType go Shortcut GoDocBrowser nmap <LocalLeader>' :GoDocBrowser<CR>
au FileType go Shortcut GoToggleBreakpoint nmap <LocalLeader>b :GoToggleBreakpoint<CR>
au FileType go Shortcut GoDebug nmap <LocalLeader>db :GoDebug<CR>
au FileType go Shortcut GoRefactor nmap <LocalLeader>e :Refactor extract
au FileType go Shortcut Go run tab nmap <LocalLeader>st <Plug>(go-run-tab)
au FileType go Shortcut go run split nmap <LocalLeader>sp <Plug>(go-run-split)
au FileType go Shortcut go run vertical nmap <LocalLeader>vs <Plug>(go-run-vertical)
au FileType go Shortcut GoAlternate nmap <LocalLeader>. :GoAlternate<CR>
au FileType go Shortcut GoTestFunc nmap <LocalLeader>T :GoTestFunc
au FileType go Shortcut GoTest nmap <LocalLeader>t :GoTest
au FileType go Shortcut GoReferrers nmap <LocalLeader>r :GoReferrers<CR>
" au FileType go Shortcut GoReferrers nmap gr :GoReferrers<CR>
au FileType go Shortcut GoChannelPeers nmap <LocalLeader>p :GoChannelPeers<CR>
au FileType go Shortcut GoDef nmap <LocalLeader>f :GoDef<CR>
au FileType go Shortcut GoInfo nmap <LocalLeader>k :GoInfo<CR>
au FileType go Shortcut GoIfErr nnoremap <LocalLeader>e :GoIfErr<CR>

augroup END


