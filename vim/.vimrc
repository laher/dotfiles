set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.vim/am/plugins.vim")) " New
  source ~/.vim/am/plugins.vim
  source ~/.vim/am/syntax.vim
  source ~/.vim/am/settings.vim
  source ~/.vim/am/filetypes.vim
  source ~/.vim/am/functions.vim
  source ~/.vim/am/abbreviations.vim
  source ~/.vim/am/mappings.vim
  source ~/.vim/am/go.vim
  source ~/.vim/am/scala.vim
elseif filereadable(expand("~/.vimrc.plug")) " Deprecated
  source ~/.vimrc.plug
endif


if filereadable(expand("~/.vimrc.local")) " Local overrides ...
  source ~/.vimrc.local
endif






