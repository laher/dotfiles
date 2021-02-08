let g:fuzzymenu_vim_config='~/.vimrc.d/fzm.vim'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp'} }

""" mappings created by fuzzymenu.vim
nmap <leader>ser :Buffers<CR>
set nowildmenu
let g:fuzzymenu_vim_config_auto_write=1

"nmap <leader>i :LspHover<CR>
let colorscheme='kalisi'
set norelativenumber
set nosmartcase
let background='light'
let shiftwidth='2'

" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fuzzymenu_width_adjust=-70
nmap <leader>f :FzmOp =<CR>
