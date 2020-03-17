call plug#begin('~/.vim/plugged')

Plug 'https://github.com/Shougo/denite.nvim' " I think this is a dependency for something. Can't remember but leaving it near the top

" Git support
Plug 'https://github.com/tpope/vim-fugitive' " The git things
Plug 'https://github.com/tpope/vim-rhubarb' " :Gbrowse, hub
Plug 'https://github.com/airblade/vim-gitgutter' " +/-/~ signs in the gutter
Plug 'https://github.com/gregsexton/gitv', {'on': ['Gitv']} " :Gitv is a bit like tig
Plug 'https://github.com/jreybert/vimagit' " Magit in vim
" Plug 'https://github.com/junkblocker/patchreview-vim' " Dependency for vim-codereview
" Plug 'https://github.com/codegram/vim-codereview' " Use :CodeReview https://github.com/myorganization/myrepo/pulls/1328
Plug 'https://github.com/google/vim-maktaba' " Dependency for google/vim-codereview
Plug 'https://github.com/google/vim-codereview' " Use :CodeReview github.com/org/repo
Plug 'https://github.com/idanarye/vim-merginal' " view/switch branches with :Merginal

Plug 'https://github.com/will133/vim-dirdiff' " :DirDiff

Plug 'https://github.com/junegunn/vim-peekaboo' " show buffers while yanking

Plug 'https://github.com/glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

""" Completion => 
if has('nvim')
  Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'https://github.com/Shougo/deoplete.nvim'
  Plug 'https://github.com/roxma/nvim-yarp'
  Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif
""" Go

if !has('nvim')
"  Plug 'https://github.com/myitcv/govim', { 'for': 'go', 'tag': '*' }
endif
if has('nvim')
"    Plug 'https://github.com/fatih/vim-go', { 'for': 'go', 'tag': 'v*', 'do': ':GoUpdateBinaries' }
endif

Plug 'https://github.com/mattn/vim-goimports'
Plug 'https://github.com/mattn/vim-gorename'
Plug 'https://github.com/mattn/vim-goaddtags'
Plug 'https://github.com/mattn/vim-gorun'
Plug 'https://github.com/mattn/vim-goimports'
Plug 'https://github.com/mattn/vim-goimpl'
Plug 'https://github.com/mattn/vim-gosrc'
Plug 'https://github.com/mattn/go-errcheck-vim'
"Plug 'https://github.com/laher/gokeyify.vim'
Plug 'https://github.com/laher/gothx.vim'

Plug 'https://github.com/corylanou/vim-present' " syntax for .slide files
""" related to go but not specific
Plug 'https://github.com/FooSoft/vim-argwrap' " :ArgWrap wraps a paremeter list accross multiple lines
" Plug 'https://github.com/majutsushi/tagbar' " 'Outline' of current file
" Plug 'https://github.com/lvht/tagbar-markdown', { 'for': 'markdown' }

" Plug 'https://github.com/autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

Plug 'https://github.com/prabirshrestha/async.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/mattn/vim-lsp-settings'
Plug 'https://github.com/liuchengxu/vista.vim'
"Plug 'lgranie/vim-lsp-java'


Plug 'jaxbot/semantic-highlight.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
""" Other languages
Plug 'https://github.com/fisadev/vim-isort', { 'for': 'python' }
Plug 'https://github.com/rstacruz/sparkup', {'rtp': 'vim/'}  """ condensed html. type `div<C-E>` to get `<div></div>`
Plug 'https://github.com/othree/xml.vim' """ xml and html. type `<LocalLeader>c` to change a tag-name

Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/peitalin/vim-jsx-typescript'

Plug 'https://github.com/prettier/vim-prettier', {
 \ 'do': 'yarn install',
 \ 'for': ['javascript','html','css','typescript','json'] }

Plug 'https://github.com/markbiek/phpLint.vim', { 'for': 'php' }
Plug 'https://github.com/gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'https://github.com/mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'https://github.com/jkramer/vim-checkbox', { 'for': 'markdown' }

Plug 'https://github.com/wannesm/wmgraphviz.vim', { 'for': 'dot' }
Plug 'https://github.com/christianrondeau/vim-base64'

""" tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator'
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
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 
Plug 'https://github.com/junegunn/fzf.vim' " Find within files
Plug 'https://github.com/ryanoasis/vim-devicons' " icons for NERDTree etc
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
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
Plug 'https://github.com/rhysd/clever-f.vim'

""" Appearance and layout
"Plug 'https://github.com/itchyny/vim-cursorword' " underline word under cursor
Plug 'https://github.com/freeo/vim-kalisi' " theme
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/altercation/vim-colors-solarized' " theme
if exists('g:started_by_firenvim')
  """ no status bars
else
  Plug 'https://github.com/itchyny/lightline.vim' " status across bottom
  Plug 'ryanoasis/vim-devicons' " use in lightline 
  Plug 'mgee/lightline-bufferline' " For tabs on top
  Plug 'https://github.com/flrnprz/plastic.vim' " lightline theme
  Plug 'https://github.com/laher/vim-buftabline' " tabs across top
endif
Plug 'https://github.com/twitvim/twitvim.git'

""" gifs 
Plug 'https://github.com/mattn/webapi-vim'
Plug 'https://github.com/cirla/vim-giphy'

" All of your Plugs must be added before the following line
call plug#end()
