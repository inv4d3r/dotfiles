#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# aliases
alias ls='ls --color=auto'
# alias vim=nvim

# exports
export THEME=badwolf
#export THEME=default
#export THEME=dracula
#export THEME=gruvbox
#export THEME=nord

export VIMRC=~/.vimrc
export NVIMRC=~/.config/nvim/init.vim

case "$THEME" in
    default) PS1="\[\033[35m\]\u \[\033[39m\]at \[\033[36m\]\h\
 \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    badwolf) PS1="\[\033[38m\]\u \[\033[37m\]at \[\033[31m\]\h\
 \[\033[33m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    dracula) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[36m\]\h\
 \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    gruvbox) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[36m\]\h\
 \[\033[33m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    nord) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[36m\]\h\
 \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    -*) usage "bad argument $THEME";;
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
