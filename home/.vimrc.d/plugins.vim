
" au BufRead,BufNewFile plugins.vim set filetype=vim-plug
call plug#begin('~/.vim/plugged')

""" navigation and fuzzy
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Find within files
"let g:fzf_command_prefix = 'Fzf'
Plug 'ryanoasis/vim-devicons' " icons for NERDTree etc
Plug 'haya14busa/incsearch.vim' " incrementally show search results

Plug 'junegunn/vader.vim' " testing framework 


" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'tpope/vim-rhubarb' " :Gbrowse, hub
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter
Plug 'gregsexton/gitv', {'on': ['Gitv']} " :Gitv is a bit like tig
Plug 'junegunn/vim-peekaboo' " show buffers while yanking
Plug 'shumphrey/fugitive-gitlab.vim'

""" lsp 
Plug 'SirVer/ultisnips'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'liuchengxu/vista.vim'
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'


" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Specific language support
"Plug 'mattn/vim-goimports', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
  let g:go_gopls_enabled=0
  let g:go_def_mapping_enabled=0
  let g:go_doc_keywordprg_enabled=0
  let g:go_fmt_autosave=1
  let g:go_fmt_command = "goimports"
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', {
 \ 'do': 'yarn install',
 \ 'for': ['javascript','html','css','typescript','json'] }

Plug 'eslint/eslint'
Plug 'ruanyl/vim-fixmyjs'

Plug 'markbiek/phpLint.vim', { 'for': 'php' }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
Plug 'junegunn/vim-xmark', { 'do': 'make' }
"Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
"Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
"Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }

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
Plug 'FooSoft/vim-argwrap' " :ArgWrap wraps a paremeter list accross multiple lines
Plug 'wellle/targets.vim' " pairs,separators. args `aa`. anyblock: `inb` anyquote: `inq` 
Plug 'tpope/vim-jdaddy' " JSON: j
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
Plug 'itchyny/lightline.vim' " status across bottom
Plug 'ryanoasis/vim-devicons' " use in lightline 
Plug 'mgee/lightline-bufferline' " For tabs on top
Plug 'flrnprz/plastic.vim' " lightline theme
Plug 'laher/vim-buftabline' " tabs across top
" All of your Plugs must be added before the following line
call plug#end()

""" open Plug lines in browser
function! s:plug_gx()
  if getline('.') =~ '^"\?Plug\s'
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

set runtimepath^=~/d/ext/gothx.vim
"set runtimepath^=~/go/src/github.com/laher/today.vim
set runtimepath^=~/d/ext/fuzzymenu.vim
