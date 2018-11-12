
" macro over range https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! Todo()
  vsplit ~/o/inbox.md
  "let curline = getline('.')
  call inputsave()
  let name = input('Enter todo: ')
  call inputrestore()
  "call setline('.', curline . ' ' . name)
  call append(1, ' - ' . name)
  execute 2
endfunction

" copy current file's path to clipboard
function! s:copy_path()
  let @+ = expand('%:p')
endfunction 

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
