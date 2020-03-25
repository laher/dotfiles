" Leader
let mapleader=";"
let maplocalleader=","

nnoremap <Leader>. :TagbarToggle<CR>

" deletes into an empty buffer
nnoremap <Leader>d "_d

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

nnoremap <Leader>e :GGrep <c-r><c-w><CR>
nnoremap <Leader>g :GGrep<CR>
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>v :Vista<CR>
nnoremap <Leader>T :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFind<CR>
nnoremap <Leader>t :NERDTreeFind<CR>

nnoremap <Leader>l :split term://less +F /tmp/vim-lsp.log<CR><Esc>

func IsNERDTreeOpen()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunc

func NERDToggleOrFind()
	if IsNERDTreeOpen()
		:NERDTreeToggle<CR>
	else 
		:NERDTreeFind<CR>
	endif
endfunc

inoremap <Leader>fn <c-r>=expand("%:t")<cr>

nmap <Leader>gl :Glog<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
vmap <Leader>x :Gbrowse<CR>
nmap <Leader>x :Gbrowse<CR>
nmap <Leader>gbl :Gblame<CR>

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

imap jk <Esc>
imap kj <Esc>

"sudo write current buffer:
command Sw w !sudo tee % > /dev/null

nmap ga <Plug>(place-insert)


let g:UltiSnipsExpandTrigger="<Leader>'"
let g:UltiSnipsJumpForwardTrigger="<Leader>'"
let g:UltiSnipsJumpBackwardTrigger="<Leader>\""
let g:UltiSnipsListSnippets="<Leader>;"

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


au FileType markdown nmap <LocalLeader>t i## <C-R>=strftime("%Y-%m-%d")<CR><CR> * 
au FileType markdown nnoremap <LocalLeader>m :call TodoMoveToHeading()<CR>

" avoids 'delete replaces default buffer' because 0 buffer contains 'last yank'
nnoremap <Leader>p "0p  

" my functions
nnoremap <Leader>[ :call TodoPrompt()<CR>
nnoremap <Leader>] :call TodoSplit()<CR>
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
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"nmap <Leader>3 kdggjdG

let s:menu_structure = { 'go': ['go-run', 'go-install'], 'any': ['case-insensitive', 'case-sensitive'] }
let s:menu_mappings = { 'go-run': 'gothx#run#Run','go-install': 'gothx#install#Install' , 'case-insensitive': 's:case_ins', 'case-sensitive': 's:case_sens' }

function! s:case_ins()
  set ignorecase
endfunction

function! s:case_sens()
  set noignorecase
endfunction

function! s:menu_sink(arg)
 " call function(a:arg)()
 call function(s:menu_mappings[a:arg])()
endfunction

function! s:menu_source()
  let extension = expand("%:e")
  let ret = s:menu_structure['any']
  let others = get(s:menu_structure, extension, [])
  ret += others
  return ret
endfunction

" nnoremap <silent> <Leader>; :call fzf#run({'source': ['gothx#run#Run', 'gothx#install#Install'],
nnoremap <silent> <Leader>; :call fzf#run({'source': <sid>menu_source(),
            \ 'sink': function('<sid>menu_sink'), 'left': '25%'})<cr>
