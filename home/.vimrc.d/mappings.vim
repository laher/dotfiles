" Leader
let mapleader=" "
nmap  ;; :echom "use the space, man"<CR>
let maplocalleader=","

nnoremap <Leader>. :TagbarToggle<CR>

" deletes into an empty buffer
nnoremap <Leader>d "_d

" fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>v :Vista<CR>
nnoremap <Leader>s :split term://less +F /tmp/vim-lsp.log<CR><Esc>

nmap <Leader><Leader> <Plug>Fzm
vmap <Leader><Leader> <Plug>FzmVisual
"nnoremap <Leader>fn <c-r>=expand("%:t")<cr>

"nmap <Leader>a <Plug>Fzm
" git fzf
nnoremap <Leader>gw :GGrep <c-r><c-w><CR>
nnoremap <Leader>GW :GGrep! <c-r><c-w><CR>
nnoremap <Leader>gg :GGrep<CR>
nnoremap <Leader>GG :GGrep!<CR>
nnoremap <Leader>gc :Commits<CR>
nnoremap <Leader>GC :Commits!<CR>
nnoremap <Leader>gb :BCommits<CR>
nnoremap <Leader>GB :BCommits!<CR>
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :GFiles!<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>GF :GFiles!<CR>

" git other
nmap <Leader>gl :Glog<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
vmap <Leader>gx :Gbrowse<CR>
vmap <Leader>GX :Gbrowse!<CR>
nmap <Leader>gx :Gbrowse<CR>
nmap <Leader>GX :Gbrowse!<CR>
nmap <Leader>gp :Gblame<CR>
nmap <Leader>GP :Gblame!<CR>

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <Leader>l :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <Leader>gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> <Leader>gr :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>

nmap <Leader>u :bun<CR>

imap fj <Esc>
imap jf <Esc>

"sudo write current buffer:
command! Sw w !sudo tee % > /dev/null

nmap ga <Plug>(place-insert)


"let g:UltiSnipsExpandTrigger="<Leader>'"
"let g:UltiSnipsJumpForwardTrigger="<Leader>'"
"let g:UltiSnipsJumpBackwardTrigger="<Leader>\""
"let g:UltiSnipsListSnippets="<Leader>;"

" expert mode
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" jump to next/prev vim-go error:
" nnoremap <C-j> :cn<CR>
" nnoremap <C-k> :cp<CR>

"au FileType dotoo inoremap <CR> <CR><C-R>=expand("%:t:r")
" au FileType dotoo nnoremap t ji<CR>*
" au FileType dotoo iabbrev ** • 
"
" disabled this line because it broke popups. Also I have no idea what it did
"nmap <CR> o<Esc>

au FileType rust nnoremap <LocalLeader>rf :%!rustfmt<CR>
au FileType rust nnoremap <LocalLeader>rr :CargoRun<CR>


"au FileType markdown nnoremap <LocalLeader>m :call TodoMoveToHeading()<CR>

" good-paste
" avoids 'delete replaces default buffer' because 0 buffer contains 'last yank'
nnoremap <Leader>p "0p  

" my functions
"nnoremap <Leader>[ :call TodoPrompt()<CR>
"nnoremap <Leader>] :call TodoSplit()<CR>
nnoremap <Leader>% :<C-u>call <SID>copy_path()<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" `c;w` for changing next CamelCaseHump 
nmap <Leader>ccw <Plug>CamelCaseMotion_w
nmap <Leader>ccb <Plug>CamelCaseMotion_b
nmap <Leader>ccE <Plug>CamelCaseMotion_e
nmap <Leader>ccge <Plug>CamelCaseMotion_ge

" delete all other lines. TODO protect against last line
nmap <Leader>0 kd1Go<Esc>dG

" replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"nnoremap <Leader><Leader> :call fzm#Run()<CR>
"nnoremap <Leader>m :call fzm#Run()<CR>

" for getting used to the switch
"nmap <Leader>3 kdggjdG

" function! CaseIns()
"   set ignorecase
" endfunction

" function! CaseSens()
"   set noignorecase
" endfunction

" call fzm#fzm#add_item('todo', funcref('TodoPrompt'))
" call fzm#fzm#add_item('todo-split', funcref('TodoSplit'))
" call fzm#fzm#add_item('case-sensitive', funcref('CaseSens'))
" call fzm#fzm#add_item('case-insensitive', funcref('CaseIns'))
" nnoremap <silent> <Leader>; :call fzm#fzm#run()<cr>
