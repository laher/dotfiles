
" au BufRead,BufNewFile plugins.vim set filetype=vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/denite.nvim' " I think this is a dependency for something. Can't remember but leaving it near the top

""" navigation and fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 
Plug 'junegunn/fzf.vim' " Find within files
Plug 'ryanoasis/vim-devicons' " icons for NERDTree etc
Plug 'haya14busa/incsearch.vim' " incrementally show search results

" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'tpope/vim-rhubarb' " :Gbrowse, hub
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter
Plug 'gregsexton/gitv', {'on': ['Gitv']} " :Gitv is a bit like tig
"Plug 'jreybert/vimagit' " Magit in vim
"Plug 'google/vim-maktaba' " Dependency for google/vim-codereview
"Plug 'google/vim-codereview' " Use :CodeReview github.com/org/repo
"Plug 'idanarye/vim-merginal' " view/switch branches with :Merginal

"Plug 'will133/vim-dirdiff' " :DirDiff

Plug 'junegunn/vim-peekaboo' " show buffers while yanking

"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'mattn/vim-goimports'
"Plug 'mattn/vim-gorename'
"Plug 'mattn/vim-goaddtags'
" Plug 'mattn/vim-gorun'
" Plug 'mattn/vim-goimpl'
"Plug 'mattn/vim-gosrc'
"Plug 'mattn/go-errcheck-vim'
"Plug 'laher/gokeyify.vim'

"Plug 'laher/today.vim'
"Plug 'laher/gothx.vim'
"Plug 'laher/fzm.vim'

""" lsp 
Plug 'FooSoft/vim-argwrap' " :ArgWrap wraps a paremeter list accross multiple lines
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'liuchengxu/vista.vim'

"Plug 'jaxbot/semantic-highlight.vim'
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

""" Other languages
Plug 'fisadev/vim-isort', { 'for': 'python' }
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}  """ condensed html. type `div<C-E>` to get `<div></div>`
"Plug 'othree/xml.vim' """ xml and html. type `<LocalLeader>c` to change a tag-name

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'prettier/vim-prettier', {
 \ 'do': 'yarn install',
 \ 'for': ['javascript','html','css','typescript','json'] }

Plug 'markbiek/phpLint.vim', { 'for': 'php' }
"Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
"Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
"Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }

"Plug 'wannesm/wmgraphviz.vim', { 'for': 'dot' }
"Plug 'christianrondeau/vim-base64'

""" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

""" tpope
Plug 'tpope/vim-speeddating'       " Increment dates
Plug 'tpope/vim-repeat'            " `.` to repeat non-native things
Plug 'tpope/vim-abolish'           " :Subvert/child{,ren}/adult{,s}/g, 
Plug 'tpope/vim-obsession'         " Continuously save buffer state
Plug 'tpope/vim-tbone'             " :Tmux support - :Twrite,:Tyank,:Tput
Plug 'tpope/vim-sleuth'            " tab/space indentation detection per-file
Plug 'tpope/vim-unimpaired'        " pairs of mappings like [q ]q for quickfix pref/next
Plug 'tpope/vim-eunuch'            " Unix sugar - :SudoWrite, :Chmod, :Rename, :Delete ...

""" text objects
Plug 'wellle/targets.vim' " pairs,separators. args `aa`. anyblock: `inb` anyquote: `inq` 
Plug 'tpope/vim-jdaddy' " JSON: j
" Plug 'kana/vim-textobj-user' " see dates/times in ./textobjects.vim
" Plug 'kana/vim-textobj-entire' " whole buffer: e
" Plug 'glts/vim-textobj-comment' " comments: c
Plug 'michaeljsmith/vim-indent-object' " indentation: i / I
Plug 'bkad/CamelCaseMotion' " CamelCase: <leader>w . e.g. `c2<leader>w`
Plug 'tpope/vim-surround' " Operate on surrounding parens/quotes: `s`. e.g. `cs'<p>`

Plug 'christoomey/vim-titlecase' " `gt`: motion for title-case
Plug 'tpope/vim-commentary'        " `gcc` Comment out lines. Also `gc` for motion target

""" editing
"Plug 'joereynolds/place.vim' " insertions with ga (doesn't move the cursor. e.g. `ga$;` to add a semicolon)
"Plug 'jeetsukumaran/vim-indentwise' " [-,[+,[= and ]-,]+,]=
"Plug 'AndrewRadev/splitjoin.vim' " gS and gJ to split/join one-liners
"Plug 'vim-scripts/repeatable-motions.vim' " repeatable motions
"Plug 'rhysd/clever-f.vim'

""" Appearance and layout
Plug 'freeo/vim-kalisi' " theme
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized' " theme
if exists('g:started_by_firenvim')
  """ no status bars
else
  Plug 'itchyny/lightline.vim' " status across bottom
  Plug 'ryanoasis/vim-devicons' " use in lightline 
  Plug 'mgee/lightline-bufferline' " For tabs on top
  Plug 'flrnprz/plastic.vim' " lightline theme
  Plug 'laher/vim-buftabline' " tabs across top
endif
"Plug 'twitvim/twitvim.git'

""" gifs 
"Plug 'mattn/webapi-vim'
"Plug 'cirla/vim-giphy'

" All of your Plugs must be added before the following line
call plug#end()

""" open Plug lines in browser
function! s:plug_gx()
  if getline('.') =~ '^Plug\s'
      let cfile = expand('<cfile>')
      if cfile !~ 'github\.com' && !filereadable(cfile)
          call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
                      \ 'https://github.com/'.cfile)), netrw#CheckIfRemote())
         return
      endif
  endif 

  call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
              \ '<cfile>')), netrw#CheckIfRemote())
endfunction

augroup PlugGx
  autocmd!
  autocmd FileType vim nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
  autocmd FileType vim nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

""" open vim imports in browser
" function! s:go_gx()
"   echo "hi"
"   if getline('.') =~ '^import "' 
"       let pkg = substitute(getline('.'), '\vimport "(.*)"', '\1', '')
"       call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
"         \ 'https://pkg.go.dev/'.pkg)), netrw#CheckIfRemote())
"       return
"   endif 
"   if getline('.') =~ '\v^\s+".*"\s*$'
"       let pkg = substitute(getline('.'), '\v\s+"(.*)"', '\1', '')
"       call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
"         \ 'https://pkg.go.dev/'.pkg)), netrw#CheckIfRemote())
"       return
"   endif

"   """ usual behaviour for gx
"   call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
"            \ '<cfile>')), netrw#CheckIfRemote())
" endfunction

" augroup GoGx

"   autocmd!
"   autocmd FileType go nnoremap <buffer> <silent> gx :call gothx#gx#Gogx()<cr>
"   autocmd FileType go inoremap <buffer> <silent> gx :call gothx#gx#Gogx()<cr>
" augroup END

set runtimepath^=~/go/src/github.com/laher/gothx.vim
set runtimepath^=~/go/src/github.com/laher/today.vim
set runtimepath^=~/go/src/github.com/laher/fzm.vim
