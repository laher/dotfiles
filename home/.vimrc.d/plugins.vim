
" au BufRead,BufNewFile plugins.vim set filetype=vim-plug
call plug#begin('~/.vim/plugged')

""" navigation and fuzzy
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Find within files
"let g:fzf_command_prefix = 'Fzf'

command! -bang -nargs=* Agv call fzf#vim#ag(<q-args>, '--ignore=vendor', <bang>0)

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
Plug 'tommcdo/vim-fubitive'


Plug 'tpope/vim-dadbod'

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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
let g:completion_timer_cycle = 100 "default value is 80
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
imap <silent> <c-p> <Plug>(completion_trigger)


"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

""" Specific language support
Plug 'udalov/kotlin-vim'
Plug 'dmix/elvish.vim', { 'on_ft': ['elvish']}
"Plug 'mattn/vim-goimports', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
  "let g:go_gopls_enabled=0
  let g:go_def_mapping_enabled=0
  let g:go_doc_keywordprg_enabled=0
  let g:go_fmt_autosave=1
  let g:go_fmt_command = "goimports"
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', {
 \ 'do': 'npm install',
 \ 'for': ['javascript','html','css','typescript','json'] }

Plug 'eslint/eslint'
Plug 'ruanyl/vim-fixmyjs'
Plug 'mogelbrod/vim-jsonpath'
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
Plug 'tpope/vim-dispatch'          " dispatch Make in the background
Plug 'tpope/vim-projectionist'     " set up VA (alternate) and make tasks
  autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \    '*.go':      { 'alternate': '{}_test.go' },
  \    '*_test.go': { 'alternate': '{}.go' },
  \    '*.cpp':     { 'alternate': '{}.h' },
  \    '*.h':       { 'alternate': '{}.cpp' },
  \    '*.js':      { 'alternate': '{}.spec.js' },
  \    '*.ts':      { 'alternate': '{}.spec.ts' },
  \    '*.spec.js': { 'alternate': '{}.js' },
  \    '*.spec.ts': { 'alternate': '{}.ts' }
  \ })
nmap <silent><leader>aa :A<CR>
nmap <silent><leader>av :AV<CR>

""" text objects
Plug 'FooSoft/vim-argwrap' " :ArgWrap wraps a paremeter list accross multiple lines
Plug 'wellle/targets.vim' " pairs,separators. args `aa`. anyblock: `inb` anyquote: `inq` 
Plug 'tpope/vim-jdaddy' " JSON: j
Plug 'michaeljsmith/vim-indent-object' " indentation: i / I
Plug 'bkad/CamelCaseMotion' " CamelCase: <leader>w . e.g. `c2<leader>w`
Plug 'tpope/vim-surround' " Operate on surrounding parens/quotes: `s`. e.g. `cs'<p>`
Plug 'christoomey/vim-titlecase' " `gt`: motion for title-case
Plug 'tpope/vim-commentary'        " `gcc` Comment out lines. Also `gc` for motion target

Plug 'AndrewRadev/tagalong.vim'

""" editing
"Plug 'joereynolds/place.vim' " insertions with ga (doesn't move the cursor. e.g. `ga$;` to add a semicolon)
"Plug 'jeetsukumaran/vim-indentwise' " [-,[+,[= and ]-,]+,]=
"Plug 'AndrewRadev/splitjoin.vim' " gS and gJ to split/join one-liners
"Plug 'vim-scripts/repeatable-motions.vim' " repeatable motions
"Plug 'rhysd/clever-f.vim'

""" Appearance and layout
Plug 'freeo/vim-kalisi' " theme
Plug 'flazz/vim-colorschemes' " themes
Plug 'Pocco81/Catppuccino.nvim' " theme
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

set runtimepath^=~/d/laher/gothx.vim
"set runtimepath^=~/go/src/github.com/laher/today.vim
set runtimepath^=~/d/laher/fuzzymenu.vim
set runtimepath^=~/d/laher/showy
set runtimepath^=~/.vimrc.d/
