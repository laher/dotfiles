export PATH="$PATH:$HOME/.local/bin"
if [ -d $HOME/.pyenv/ ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# mac
if [ -d $HOME/Library/Python/3.7/bin ]; then
  export PATH="$HOME/Library/Python/3.7/bin:$PATH"
fi
