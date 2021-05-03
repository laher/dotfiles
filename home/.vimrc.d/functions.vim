
" macro over range https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! FileOffset()
    return line2byte(line('.')) + col('.') - 1
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

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" copy current file's path to clipboard
function! s:copy_path()
  let @+ = expand('%:p')
endfunction 


function! CommandWindow(choice_command, vim_command)
  try
    let output = system(a:choice_command . ' | fzy')
  catch /Vim:Interrupt/
    echo 'interrupted'
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0
    if !empty(output)
      execute a:vim_command . ' ' . trim(output)
    else
      echom 'no output'
    endif
  else
    echom 'fzy error'. v:shell_error
  endif
endfunction
command! -nargs=0 CoachF call CommandWindow('find . -type f', 'vs')
command! -nargs=0 Coach call CommandWindow('ls', 'vs')
