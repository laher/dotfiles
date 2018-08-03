set hidden " required by CtrlSpace
if isdirectory('/dev/shm')
	set directory=/dev/shm " in-memory swap files (more risky but nothing sticks around)
endif

filetype plugin indent on    " required
set t_Co=256 " Ignored by nvim

" set list " show whitespace chars
" set listchars is useful in combination with :set list (showing whitespace chars)
set listchars=eol:↲,tab:»\ ,trail:~,extends:⟩,precedes:⟨,space:·
set showbreak=↪
" hi NonText ctermfg=16 guifg=#4a4a59
" hi SpecialKey ctermfg=16 guifg=#4a4a59

set whichwrap+=<,>,h,l,[,] " right-arrow goes to next line
set autochdir " change dir to current file's dir
set autowrite " useful for :bufdo
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8

syntax on

set wildmenu                       
set wildmode=list:longest,full 

set mouse=a
set mousemodel=extend

if exists('g:gui_oni')
    filetype off                  " required
    set noswapfile
endif

if exists('g:gui_oni')
"   set smartcase
"   set noshowmode
"   set noruler
"    set laststatus=0
"    set noshowcmd
endif

if !has('nvim')
	set term=xterm-256color
endif

let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if (pumvisible())
        return deoplete#close_popup()
    else
        return "\<CR>"
    endif
endfunction

"" autocmd BufWritePost *.org execute '!emacs ' + expand(<afile>) + '--batch -f org-html-export-to-html -kill'
autocmd BufWritePost *.org silent! !emacs <afile> --batch -f org-html-export-to-html -kill 2> /dev/null

if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	"let &t_AB="\e[48;5;%dm"
	"let &t_AF="\e[38;5;%dm""	
	" This is for vim-tmux-navigator in OSX
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ ExtraLight:h18
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
set guifont=GoMono\ Nerd\ Font\ Book:h18
"set completeopt-=preview


if !has('nvim')
	" old completion stuff
	"let g:ycm_complete_in_strings = 1
	"let g:ycm_allow_changing_updatetime = 1000
	"let g:ycm_auto_trigger = 1
	"let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
	"let g:completor_auto_trigger = 1
	"let g:completor_min_chars = 2	
	inoremap _expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
	let g:completor_auto_trigger = 0
        let g:completor_gocode_binary = "$HOME/go/bin/gocode"
endif

set number
set hlsearch
set incsearch
"set gdefault " treat :s// as :s//g (and vice versa)
"set smartcase " treat all-lower as case-insensitive while searching
set title

"set clipboard^=unnamed
set clipboard+=unnamedplus

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir -p ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

set backspace=indent,eol,start

" restore cursor _except_ for commit messages
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

let g:place_single_character_mode = 0
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" ^set autowrite
