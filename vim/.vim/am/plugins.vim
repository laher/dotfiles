call plug#begin('~/.vim/plugged')

" Git support
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'Shougo/denite.nvim'
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'
Plug 'ryanoasis/vim-devicons'

Plug 'will133/vim-dirdiff'

""" show buffers
Plug 'junegunn/vim-peekaboo'

""" deal with swap files
Plug 'gioele/vim-autoswap'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plug 'L9'


""" insertions with ga (non-cursor)
Plug 'joereynolds/place.vim'

""" Go
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'godoctor/godoctor.vim'
Plug 'nsf/gocode', {'rtp': 'nvim/'}
Plug 'buoto/gotests-vim'

""" related to go but not specific
Plug 'FooSoft/vim-argwrap' " Wrap a paremeter list accross multiple lines
Plug 'majutsushi/tagbar' " 'Outline' of current file
Plug 'w0rp/ale' "syntax & linting
"Plug 'scrooloose/syntastic'

""" Other languages
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}  """ condensed html
Plug 'burnettk/vim-angular'
Plug 'ternjs/tern_for_vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'markbiek/phpLint.vim'
Plug 'gabrielelana/vim-markdown'
""" OMG Scala
Plug 'derekwyatt/vim-scala'
Plug 'wannesm/wmgraphviz.vim'

Plug 'kyuhi/vim-emoji-complete'
Plug 'christianrondeau/vim-base64'

""" org-mode-ish
"" Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-dotoo'
"Plug 'mattn/calendar-vim'

""" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'


""" tpope
Plug 'tpope/vim-surround'          " Operate on surrounding 
Plug 'tpope/vim-speeddating'       " Increment dates
Plug 'tpope/vim-repeat'            " Repeat plugins
Plug 'tpope/vim-commentary'        " Comment out blocks
Plug 'tpope/vim-abolish'           " Flexible search
Plug 'tpope/vim-jdaddy'            " JSON text object
Plug 'tpope/vim-obsession'         " Continuously save buffer state
Plug 'tpope/vim-tbone'

""" navigation and fuzzy
Plug 'ctrlpvim/ctrlp.vim' " Find files faster by name
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Find within files
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pelodelfuego/vim-swoop' " replace across files typa thing
" Plug 'vim-ctrlspace/vim-ctrlspace' "not really using this megabeast
Plug 'sunaku/vim-shortcut' "searchable key mappings

""" text objects and editing
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'bkad/CamelCaseMotion'
Plug 'glts/vim-textobj-comment'
"Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-indentwise'

""" Appearance and layout
Plug 'ap/vim-buftabline' " tabs across top
Plug 'freeo/vim-kalisi' " theme
Plug 'altercation/vim-colors-solarized' " theme
Plug 'itchyny/lightline.vim' " status across bottom
Plug 'fxn/vim-monochrome' " theme
Plug 'kcsongor/vim-monochrome-light' " theme
Plug 'itchyny/vim-cursorword' " underline word under cursor

" Rest console
Plug 'diepm/vim-rest-console'

" calendar
Plug 'itchyny/calendar.vim'

" typing
Plug 'thanthese/Tortoise-Typing'

""" Completion
if !has('nvim')
	"Plug 'Shougo/neocomplete.vim'
	Plug 'maralla/completor.vim' " Ugh not working for go. Disabling at startup for now and switching back to nvim

	Plug 'ensime/ensime-vim'
endif
if has('nvim')
	Plug 'jodosha/vim-godebug'
	Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
	Plug 'carlitux/deoplete-ternjs'
	Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

	"gonvim
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'dzhou121/gonvim-fuzzy' 


	Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
endif

""" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'osyo-manga/vim-over' " show preview of commands

" All of your Plugs must be added before the following line
call plug#end()

" Start NERDTree when no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w



let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir='mysnippets'
"let g:UltiSnipsSnippetDirectories=['~/.vimsnippets']
"
"
"

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" ctrlp
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
           
let g:over_enable_cmd_window = 1 " vim-over
let g:over_enable_auto_nohlsearch = 1

let g:used_javascript_libs = 'angularjs,angularui'
"
let g:argwrap_tail_comma = 1

