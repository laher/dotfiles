
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

let g:go_template_autocreate = 1
" remove gd mappings
let g:go_def_mapping_enabled = 0
"let g:go_def_mode='gopls'

"augroup goimports_autoformat
autocmd BufWritePre *.go LspDocumentFormatSync
"autocmd BufWritePre *.go LspCodeAction source.organizeImports
"augroup END

" vim-go
augroup vg
"au FileType go nmap <LocalLeader>b :GoBuild<CR>
" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <LocalLeader>c :GoCallers<CR>
au FileType go nmap <LocalLeader>ce :GoCallees<CR>
au FileType go nmap <LocalLeader>? :GoCoverageToggle<CR>
au FileType go nmap <LocalLeader>D :GoDefPop<CR>
au FileType go nmap <LocalLeader>v :GoImplements<CR>
"au FileType go nmap <LocalLeader>i :GoImports<CR>
au FileType go nmap <LocalLeader>I :ThxInstall<CR>
au FileType go nmap <LocalLeader>y :ThxPlay<CR>
au FileType go nmap <LocalLeader>' :GoDocBrowser<CR>
au FileType go nmap <LocalLeader>b :GoToggleBreakpoint<CR>
au FileType go nmap <LocalLeader>db :GoDebug<CR>
au FileType go nmap <LocalLeader>re :Refactor extract
au FileType go nmap <LocalLeader>st <Plug>(go-run-tab)
au FileType go nmap <LocalLeader>sp <Plug>(go-run-split)
au FileType go nmap <LocalLeader>vs <Plug>(go-run-vertical)
au FileType go nmap <LocalLeader>. :GoAlternate<CR>
au FileType go nmap <LocalLeader>T :GoTestFunc
au FileType go nmap <LocalLeader>t :GoTest
au FileType go nmap <LocalLeader>r :GoReferrers<CR>
" au FileType go  nmap gr :GoReferrers<CR>
au FileType go nmap <LocalLeader>p :GoChannelPeers<CR>
au FileType go nmap <LocalLeader>d :GoDef<CR>
au FileType go nmap <LocalLeader>k :GoInfo<CR>
au FileType go nnoremap <LocalLeader>e :GoIfErr<CR>
augroup END

au FileType go nmap <LocalLeader>i :LspCodeActionSync source.organizeImports<CR>

if !has('nvim')
        " govim
        set signcolumn=number
endif
