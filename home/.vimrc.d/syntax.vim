
colorscheme kalisi
set background=light

" cursor
set termguicolors
set guicursor=i-ci-ve:block-blinkon1
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" show syntax highlighting
map <M-i> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" fiddle with org mode syntax
autocmd BufEnter *.org syntax match stars /^\*\+ .*/
highlight stars ctermfg=red guifg=#ff0000 cterm=bold
