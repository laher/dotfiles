
" Leader
let mapleader=";"
let maplocalleader=","

" shortcut plugin needs to be included for some reason. Weird!

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>ob :CtrlPBuffer
nnoremap <Leader><Space> :CtrlSpace<CR>
nnoremap <Leader>. :TagbarToggle<CR>

" deletes into an empty buffer
nnoremap <Leader>d "_d

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

nnoremap <Leader>e :GGrep <c-r><c-w><CR>
nnoremap <Leader>T :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFind<CR>
nnoremap <Leader>t :NERDTreeFind<CR>

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
nmap <Leader>gbr :Gbrowse<CR>
nmap <Leader>gbl :Gblame<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>l :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <Leader>gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>

nmap <Leader>u :bun<CR>

imap jk <Esc>
imap kj <Esc>

"sudo write current buffer:
command Sw w !sudo tee % > /dev/null

nmap ga <Plug>(place-insert)


let g:UltiSnipsExpandTrigger="<Leader>'"
let g:UltiSnipsJumpForwardTrigger="<Leader>'"
let g:UltiSnipsJumpBackwardTrigger="<Leader>\""

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

" delete all other lines. TODO protect against last line
nmap <Leader>0 kd1Go<Esc>dG

"nmap <Leader>3 kdggjdG
