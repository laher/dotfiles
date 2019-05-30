call plug#begin('~/.vim/plugged')

Plug 'https://github.com/Shougo/denite.nvim' " I think this is a dependency for something. Can't remember but leaving it near the top

" Git support
Plug 'https://github.com/tpope/vim-fugitive' " The git things
Plug 'https://github.com/tpope/vim-rhubarb' " :Gbrowse, hub
Plug 'https://github.com/airblade/vim-gitgutter' " +/-/~ signs in the gutter
Plug 'https://github.com/gregsexton/gitv', {'on': ['Gitv']} " :Gitv is a bit like tig
Plug 'https://github.com/jreybert/vimagit' " Magit in vim
Plug 'https://github.com/junkblocker/patchreview-vim' " Dependency for vim-codereview
Plug 'https://github.com/codegram/vim-codereview' " Use :CodeReview https://github.com/myorganization/myrepo/pulls/1328
Plug 'https://github.com/idanarye/vim-merginal' " view/switch branches with :Merginal

Plug 'https://github.com/will133/vim-dirdiff' " :DirDiff

Plug 'https://github.com/junegunn/vim-peekaboo' " show buffers while yanking

" Plug 'https://github.com/gioele/vim-autoswap' " deal with swap files

""" Completion
Plug 'https://github.com/Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }

""" Go
Plug 'https://github.com/fatih/vim-go', { 'for': 'go', 'tag': '*' } " , 'do': ':GoUpdateBinaries' }
"Plug 'https://github.com/godoctor/godoctor.vim', { 'for': 'go' }
"Plug 'https://github.com/buoto/gotests-vim', { 'for': 'go' }
"Plug 'https://github.com/zchee/deoplete-go', { 'for': 'go', 'build': {'unix': 'make'} }
"Plug 'https://github.com/laher/regopher.vim', { 'for': 'go' }

"Plug 'https://github.com/nsf/gocode', {'rtp': 'nvim/'}

""" related to go but not specific
Plug 'https://github.com/FooSoft/vim-argwrap' " :ArgWrap wraps a paremeter list accross multiple lines
Plug 'https://github.com/majutsushi/tagbar' " 'Outline' of current file
Plug 'https://github.com/lvht/tagbar-markdown', { 'for': 'markdown' }
" Plug 'https://github.com/w0rp/ale' "syntax & linting

Plug 'https://github.com/autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
""" Other languages
"Plug 'https://github.com/sheerun/vim-polyglot'
"Plug 'https://github.com/rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'https://github.com/ambv/black', { 'for': 'python' }
Plug 'https://github.com/fisadev/vim-isort', { 'for': 'python' }
Plug 'https://github.com/rstacruz/sparkup', {'rtp': 'vim/'}  """ condensed html. type `div<C-E>` to get `<div></div>`
Plug 'https://github.com/othree/xml.vim' """ xml and html

" Plug 'https://github.com/ternjs/tern_for_vim', { 'for': 'javascript' }
" Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'https://github.com/prettier/vim-prettier', { 'for': ['javascript','html','css'] }
" Plug 'https://github.com/carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'npm install -g tern' }

" disabled vim-flow because quickfix keeps opening empty
" Plug 'https://github.com/flowtype/vim-flow', { 'for': 'javascript' }

"Plug 'https://github.com/wokalski/autocomplete-flow'
"Plug 'https://github.com/steelsojka/deoplete-flow'
"Plug 'https://github.com/carlitux/deoplete-flow'


Plug 'https://github.com/markbiek/phpLint.vim', { 'for': 'php' }
Plug 'https://github.com/gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'https://github.com/mzlogin/vim-markdown-toc', { 'for': 'markdown' }
"Plug 'https://github.com/JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
"Plug 'https://github.com/suan/vim-instant-markdown'
Plug 'https://github.com/jkramer/vim-checkbox', { 'for': 'markdown' }

""" OMG Scala
Plug 'https://github.com/derekwyatt/vim-scala', { 'for': 'scala' }

Plug 'https://github.com/wannesm/wmgraphviz.vim', { 'for': 'dot' }
Plug 'https://github.com/kyuhi/vim-emoji-complete'
Plug 'https://github.com/christianrondeau/vim-base64'

""" tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator'
" Plug 'https://github.com/benmills/vimux'
" Plug 'https://github.com/benmills/vimux-golang'
Plug 'https://github.com/christoomey/vim-tmux-runner'

""" tpope
Plug 'https://github.com/tpope/vim-speeddating'       " Increment dates
Plug 'https://github.com/tpope/vim-repeat'            " `.` to repeat non-native things
Plug 'https://github.com/tpope/vim-abolish'           " :Subvert/child{,ren}/adult{,s}/g, 
Plug 'https://github.com/tpope/vim-obsession'         " Continuously save buffer state
Plug 'https://github.com/tpope/vim-tbone'             " :Tmux support - :Twrite,:Tyank,:Tput
Plug 'https://github.com/tpope/vim-sleuth'            " tab/space indentation detection per-file
Plug 'https://github.com/tpope/vim-unimpaired'        " pairs of mappings like [q ]q for quickfix pref/next
Plug 'https://github.com/tpope/vim-eunuch'            " Unix sugar - :SudoWrite, :Chmod, :Rename, :Delete ...

""" navigation and fuzzy
"Plug 'https://github.com/ctrlpvim/ctrlp.vim' " Find files faster by name
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 
Plug 'https://github.com/junegunn/fzf.vim' " Find within files
Plug 'https://github.com/ryanoasis/vim-devicons' " icons for NERDTree etc
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Plug 'https://github.com/vim-ctrlspace/vim-ctrlspace' "not really using this megabeast
" Plug 'https://github.com/sunaku/vim-shortcut' "searchable key mappings
Plug 'https://github.com/haya14busa/incsearch.vim' " incrementally show search results

""" text objects
Plug 'https://github.com/wellle/targets.vim' " pairs,separators. args `aa`. anyblock: `inb` anyquote: `inq` 
Plug 'https://github.com/tpope/vim-jdaddy' " JSON: j
Plug 'https://github.com/kana/vim-textobj-user' " see dates/times in ./textobjects.vim
Plug 'https://github.com/kana/vim-textobj-entire' " whole buffer: e
Plug 'https://github.com/michaeljsmith/vim-indent-object' " indentation: i / I
Plug 'https://github.com/bkad/CamelCaseMotion' " CamelCase: <leader>w . e.g. `c2<leader>w`
Plug 'https://github.com/glts/vim-textobj-comment' " comments: c
Plug 'https://github.com/tpope/vim-surround' " Operate on surrounding parens/quotes: `s`. e.g. `cs'<p>`

Plug 'https://github.com/christoomey/vim-titlecase' " `gt`: motion for title-case
Plug 'https://github.com/tpope/vim-commentary'        " `gcc` Comment out lines. Also `gc` for motion target

""" editing
Plug 'https://github.com/joereynolds/place.vim' " insertions with ga (doesn't move the cursor. e.g. `ga$;` to add a semicolon)
"Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/jeetsukumaran/vim-indentwise' " [-,[+,[= and ]-,]+,]=
Plug 'https://github.com/AndrewRadev/splitjoin.vim' " gS and gJ to split/join one-liners
Plug 'https://github.com/vim-scripts/repeatable-motions.vim' " repeatable motions
"Plug 'https://github.com/svermeulen/vim-cutlass' " override delete operations to not affect current buffer
"Plug 'https://github.com/svermeulen/vim-yoink' " :Yanks shows recent yanks

""" writing
"Plug 'https://github.com/szw/vim-dict' " :Dict not working ... ?

""" Appearance and layout
Plug 'https://github.com/itchyny/vim-cursorword' " underline word under cursor
Plug 'https://github.com/freeo/vim-kalisi' " theme
Plug 'https://github.com/itchyny/lightline.vim' " status across bottom
Plug 'https://github.com/ap/vim-buftabline' " tabs across top

" Plug 'https://github.com/fxn/vim-monochrome' " theme
" Plug 'https://github.com/altercation/vim-colors-solarized' " theme
" Plug 'https://github.com/kcsongor/vim-monochrome-light' " theme

""" Apps
Plug 'https://github.com/diepm/vim-rest-console' " Rest console
" Plug 'https://github.com/thanthese/Tortoise-Typing' " typing
" Plug 'https://github.com/chemzqm/todoapp.vim' " todo
" Plug 'https://github.com/mrtazz/simplenote.vim'
" Plug 'https://github.com/jacobsimpson/nvim-example-python-plugin' " ooh, lets try

Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
" You will also need the following for function argument completion:
" Plug 'https://github.com/Shougo/neosnippet'
" Plug 'https://github.com/Shougo/neosnippet-snippets'

" buggy? jumpy text
" Plug 'https://github.com/osyo-manga/vim-over' " show preview of commands


" All of your Plugs must be added before the following line
call plug#end()

"set runtimepath^=~/d/regopher.vim
