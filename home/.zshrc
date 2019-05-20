source ~/.zshrc.includes
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt correct
export SAVEHIST=100000

setopt no_beep
setopt interactive_comments
setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

setopt hup
setopt long_list_jobs
setopt notify

fpath=($fpath "/home/am/.zsh.completions")
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain' '--ignore-submodules=dirty')
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "%{$fg[yellow]%}…%{$reset_color%}"
  else
    echo ""
  fi
}

function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}g%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local prompt_jobs="%(1j.%{$fg[yellow]%}%j%{$reset_color%}%{$fg[red]%}z%{$reset_color%} .)"
local prompt_host="%{$fg[cyan]%}%m%{$reset_color%}"
local prompt_root="%(!.%{$fg_bold[red]%}#.%{$fg[green]%}→)%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..=)%{$reset_color%}"

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000 #Number of history entries to save to disk

export ALIEN_THEME="green"
export USE_NERD_FONT=1
export ALIEN_SECTION_PATH_COMPONENTS=2

export ALIEN_SECTIONS_LEFT=(
  exit
  user
  path
  vcs_branch:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)

