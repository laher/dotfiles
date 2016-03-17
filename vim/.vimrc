set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'fatih/vim-go'
if !has('nvim')
	Plugin 'Shougo/neocomplete.vim'
endif

Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bling/vim-airline'
" Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/vimproc.vim'
"Plugin 'majutsushi/tagbar'

"Plugin 'itchyny/lightline.vim'
"Plugin 'ap/vim-buftabline'
"Plugin 'Valloric/MatchTagAlways'

Bundle 'https://github.com/freeo/vim-kalisi'
Bundle 'https://github.com/altercation/vim-colors-solarized'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
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
	"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"	let &t_AB="\e[48;5;%dm"
"	let &t_AF="\e[38;5;%dm"
endif
set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ ExtraLight:h18
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },      
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#use_vimproc = 1
set completeopt-=preview

let g:ycm_complete_in_strings = 0
let g:ycm_allow_changing_updatetime = 1000
let g:ycm_auto_trigger = 0

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

"hi User1 guifg=#eea040 guibg=#222222
"hi User2 guifg=#dd3333 guibg=#222222
"hi User3 guifg=#ff66ff guibg=#222222
"hi User4 guifg=#a0ee40 guibg=#222222
"hi User5 guifg=#eeee40 guibg=#222222
"
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
"set statusline +=%{fugitive#statusline()}

nnoremap <silent> <leader>tt :TagbarToggle<CR>

:set clipboard^=unnamed

let g:go_term_enabled = 1

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
