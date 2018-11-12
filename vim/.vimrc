set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.vimrc.experiment")) " try
  source ~/.vimrc.experiment
elseif filereadable(expand("~/vimam/plugins.vim")) " Usual
  source ~/.vimam/plugins.vim
  source ~/.vimam/syntax.vim
  source ~/.vimam/settings.vim
  source ~/.vimam/filetypes.vim
  source ~/.vimam/functions.vim
  source ~/.vimam/abbreviations.vim
  source ~/.vimam/mappings.vim
  source ~/.vimam/go.vim
  source ~/.vimam/js.vim
  source ~/.vimam/scala.vim
endif


if filereadable(expand("~/.vimrc.local")) " Local overrides ...
  source ~/.vimrc.local
endif






