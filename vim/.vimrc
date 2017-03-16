set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Git support
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'L9'

Plug 'osyo-manga/vim-over'

Plug 'scrooloose/syntastic'

" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'godoctor/godoctor.vim'
Plug 'nsf/gocode', {'rtp': 'nvim/'}
"Plug 'molok/vim-smartusline'

"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'bling/vim-airline'
" Plug 'Shougo/vimproc.vim'
Plug 'majutsushi/tagbar'

"Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
"Plug 'Valloric/MatchTagAlways'
"
"Plug 'mhinz/vim-startify'

Plug 'burnettk/vim-angular'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'tpope/vim-jdaddy'

Plug 'SwagKingTenK/VimSearch'

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'

Plug 'FooSoft/vim-argwrap'

"Plug 'tpope/vim-repeat'
"Plug 'svermeulen/vim-easyclip'
"Plug 'vim-scripts/renamer.vim'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

Plug 'freeo/vim-kalisi'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'


if !has('nvim')
	"Plug 'Shougo/neocomplete.vim'
	Plug 'maralla/completor.vim'
endif
if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
endif

" All of your Plugs must be added before the following line
call plug#end()



filetype plugin indent on    " required
"colorscheme solarized
colorscheme kalisi
set background=light

set whichwrap+=<,>,h,l,[,]
set autochdir
set autowrite " useful for :bufdo
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8

syntax on
if !has('nvim')
	set t_Co=256
	set term=xterm-256color
endif
if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"	let &t_AB="\e[48;5;%dm"
"	let &t_AF="\e[38;5;%dm"
endif

set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ ExtraLight:h18
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
"set completeopt-=preview

"needs extra color suport I guess
let g:startify_custom_header =
            \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val')

if !has('nvim')
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

if has('nvim')
	let g:deoplete#enable_at_startup = 1
	"let g:deoplete#disable_auto_complete = 1
	"inoremap <silent><expr> <C-Tab>
	"\ pumvisible() ? "\<C-n>" :
	"\ deoplete#mappings#manual_complete()
	set completeopt-=preview
	
	function! s:fzf_statusline()
	  " Override statusline as you like
	  highlight fzf1 ctermfg=161 ctermbg=251
	  highlight fzf2 ctermfg=23 ctermbg=251
	  highlight fzf3 ctermfg=237 ctermbg=251
	  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
	endfunction

	autocmd! User FzfStatusLine call <SID>fzf_statusline()

	" This is for vim-tmux-navigator in OSX
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

            
set number
set hlsearch

nnoremap <silent> <leader>tt :TagbarToggle<CR>

:set clipboard^=unnamed

let g:go_term_enabled = 1


let g:used_javascript_libs = 'angularjs,angularui'

"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
"
set autowrite
let g:argwrap_tail_comma = 1


autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

"autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


set backspace=indent,eol,start


if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

au InsertEnter * hi Normal ctermbg=230 guibg=#eeeeee
au InsertLeave * hi Normal ctermbg=white guibg=#ffffff

