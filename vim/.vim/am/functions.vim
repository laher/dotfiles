
" macro over range https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" try a thing
function! s:inp()
  "let target = input('Enter target')
  execute ":put x"
  ".target
  " confirm(""[,choices[,default[,type]]])
endfunction
nnoremap <Leader>, :<C-u>call <SID>inp()<CR>

function! Todo()
  vsplit ~/o/inbox.md
  execute 1
  "let curline = getline('.')
  call inputsave()
  let name = input('Enter todo: ')
  call inputrestore()
  "call setline('.', curline . ' ' . name)
  execute insert name
endfunction

nnoremap <Leader>; :<C-u>call Todo()<CR>

" copy current file's path to clipboard
function! s:copy_path()
  let @+ = expand('%:p')
endfunction 
nnoremap <Leader>% :<C-u>call <SID>copy_path()<CR>

" https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9
" Workspace Setup
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    if numcol == 3
        e term://zsh
        file Shell\ Two
        vnew
    endif
    vsp term://top
    file Context
    sp term://zsh
    file Shell\ One
    wincmd k
    resize 4
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()
