set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git support
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'fatih/vim-go'
Plugin 'godoctor/godoctor.vim'
"Plugin 'molok/vim-smartusline'

"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bling/vim-airline'
" Plugin 'Shougo/vimproc.vim'
"Plugin 'majutsushi/tagbar'

"Plugin 'itchyny/lightline.vim'
"Plugin 'ap/vim-buftabline'
"Plugin 'Valloric/MatchTagAlways'
"
Plugin 'mhinz/vim-startify'

"Plugin 'tpope/vim-repeat'
"Plugin 'svermeulen/vim-easyclip'
"Plugin 'vim-scripts/renamer.vim'

Bundle 'https://github.com/freeo/vim-kalisi'
Bundle 'https://github.com/altercation/vim-colors-solarized'


if !has('nvim')
	Plugin 'Shougo/neocomplete.vim'
endif
if has('nvim')
	Plugin 'Shougo/deoplete.nvim'
	Plugin 'zchee/deoplete-go', {'build': {'unix': 'make'}}
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
            \ map(split(system('fortune | cowsay -f tux'), '\n'), '"   ". v:val')

if !has('nvim')
	let g:ycm_complete_in_strings = 1
	let g:ycm_allow_changing_updatetime = 1000
	let g:ycm_auto_trigger = 1
endif

if has('nvim')
	let g:deoplete#enable_at_startup = 1
	"let g:deoplete#disable_auto_complete = 1
	"inoremap <silent><expr> <C-Tab>
	"\ pumvisible() ? "\<C-n>" :
	"\ deoplete#mappings#manual_complete()
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

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
