
"colorscheme solarized
colorscheme kalisi
let g:monochrome_italic_comments = 1

"colorscheme monochrome-light
set background=light

"autocmd ColorScheme * hi Comment gui=italic cterm=italic
"autocmd ColorScheme * hi LineNr guifg=#737373 ctermfg=249
"autocmd ColorScheme * hi MatchParen cterm=none ctermbg=none ctermfg=blue
"autocmd ColorScheme * hi String guifg=#2020F0 ctermfg=blue
"autocmd ColorScheme * hi Search guifg=White ctermfg=15 guibg=#2020F0 ctermbg=blue
"autocmd ColorScheme * hi Pmenu guifg=Black ctermfg=16 guibg=#2020F0 ctermbg=blue
"autocmd ColorScheme * hi PmenuSel guifg=#2020F0 ctermfg=blue guibg=Black ctermbg=16
"
" show syntax highlighting
map <M-i> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" fiddle with org mode syntax
autocmd BufEnter *.org syntax match stars /^\*\+ .*/
highlight stars ctermfg=red guifg=#ff0000 cterm=bold


"au InsertEnter * hi Normal ctermbg=230 guibg=#eeeeee
"au InsertLeave * hi Normal ctermbg=white guibg=#ffffff
"autocmd InsertEnter * highlight StatusLine guifg=white guibg=cyan ctermfg=white ctermbg=cyan
"autocmd InsertEnter * highlight LineNr guifg=white guibg=cyan ctermfg=white ctermbg=cyan
"autocmd InsertLeave * highlight StatusLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
"autocmd InsertLeave * highlight LineNr guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
"" Status stuff
""set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


"set cursorline
