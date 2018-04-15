
" Leader
let mapleader=";"
let maplocalleader=","

" shortcut plugin needs to be included for some reason. Weird!
source ~/.vim/plugged/vim-shortcut/plugin/shortcut.vim

if exists('g:loaded_shortcut')
  Shortcut show shortcut menu and run chosen shortcut noremap <silent> <Leader><Leader> :Shortcuts<Return>
"  Shortcut fallback to shortcut menu on partial entry noremap <silent> <Leader> :Shortcuts<Return>
"  Shortcut fallback to shortcut menu on partial entry noremap <silent> <LocalLeader> :Shortcuts<Return>
endif

Shortcut CtrlP nnoremap <Leader>p :CtrlP<CR>
Shortcut CtrlPBuffer nnoremap <Leader>ob :CtrlPBuffer
Shortcut CtrlSpace nnoremap <Leader><Space> :CtrlSpace<CR>
Shortcut TagbarToggle nnoremap <Leader>. :TagbarToggle<CR>
nnoremap <Leader>d "_d
Shortcut Find in project nnoremap <Leader>e :Ag <c-r><c-w><CR>
Shortcut NERDTreeToggle nnoremap <Leader>T :NERDTreeToggle<CR>
Shortcut NERDTreeFind nnoremap <Leader>t :NERDTreeFind<CR>

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

Shortcut Filename inoremap <Leader>fn <c-r>=expand("%:t")<cr>

Shortcut swoop 
 \ nmap <Leader>l :call Swoop()<CR>
Shortcut swoop selection 
 \ vmap <Leader>l :call SwoopSelection()<CR>
Shortcut swoop multi
 \ nmap <Leader>ml :call SwoopMulti()<CR>
Shortcut swoop multi selection 
 \ vmap <Leader>ml :call SwoopMultiSelection()<CR>


imap jk <Esc>


nnoremap <silent> <leader>tt :TagbarToggle<CR>

"sudo write current buffer:
command Sw w !sudo tee % > /dev/null

nmap ga <Plug>(place-insert)


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
au FileType dotoo Shortcut new headline nnoremap <LocalLeader>b i*<Space>
