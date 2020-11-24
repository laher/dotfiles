set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.vimrc.experiment")) " try
  source ~/.vimrc.experiment
elseif filereadable(expand("~/.vimrc.d/plugins.vim")) " Usual
  source ~/.vimrc.d/plugins.vim
  source ~/.vimrc.d/syntax.vim
  source ~/.vimrc.d/settings.vim
  source ~/.vimrc.d/filetypes.vim
  source ~/.vimrc.d/functions.vim
  source ~/.vimrc.d/abbreviations.vim
  source ~/.vimrc.d/mappings.vim
  source ~/.vimrc.d/go.vim
  source ~/.vimrc.d/js.vim
  source ~/.vimrc.d/lsp.vim
  source ~/.vimrc.d/textobjects.vim
  source ~/.vimrc.d/fzm.vim
endif


if filereadable(expand("~/.vimrc.local")) " Local overrides ...
  source ~/.vimrc.local
endif

"let types ='js,json'
"execute 'aucmd Filetype '.types.' '.' BufWritePre echo "hi"'
