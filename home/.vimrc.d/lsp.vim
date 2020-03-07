" Language server
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gh :sp<CR>:LspDefinition<CR>
nnoremap <silent> gv :vs<CR>:LspDefinition<CR>
nnoremap <silent> gp :LspPeekDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> <F2> :LspRename<CR>
let g:lsp_highlight_references_enabled = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" let g:vim_lsp_java = {
"   \ 'eclipse_jdtls' : {
"     \ 'repository': expand('~/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
"     \ 'config': 'config_mac',
"     \ 'workspace': expand('$WORKSPACE'),
"   \ },
" \ }

let g:vista_default_executive = 'vim_lsp'
" if executable('java') && filereadable(expand('~/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar'))
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'eclipse.jdt.ls',
"         \ 'cmd': {server_info->[
"         \     'java',
"         \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
"         \     '-Dosgi.bundles.defaultStartLevel=4',
"         \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
"         \     '-Dlog.level=ALL',
"         \     '-noverify',
"         \     '-Dfile.encoding=UTF-8',
"         \     '-Xmx1G',
"         \     '-jar',
"         \     expand('~/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar'),
"         \     '-configuration',
"         \     expand('~/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac'),
"         \     '-data',
"         \     getcwd()
"         \ ]},
"         \ 'whitelist': ['java'],
"         \ })
" endif

" LanguageClient-neovim settings
" let g:LanguageClient_rootMarkers = {
"         \ 'go': ['.git', 'go.mod'],
"         \ }
" " \ 'javascript': ['flow', 'lsp'],
" "    \ 'css': ['css-languageserver', '--stdio'],
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['typescript-language-server', '--stdio'],
"     \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
"     \ 'typescript': ['typescript-language-server', '--stdio'],
"     \ 'json': ['json-languageserver', '--stdio'],
"     \ 'sh': ['bash-language-server', 'start'],
"     \ 'yaml': ['yaml-language-server'],
"     \ 'python': ['pyls'],
"     \ 'go': ['gopls'],
"     \ 'scala': ['metals-vim'],
"     \ 'php': ['intelephense', '--stdio'],
"     \ }
