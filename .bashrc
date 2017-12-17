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
export VIMRC=~/.vimrc
export NVIMRC=~/.config/nvim/init.vim

case "$THEME" in
    badwolf) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[33m\]\h\
 \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    dracula) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[36m\]\h\
 \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    gruvbox) PS1="\[\033[35m\]\u \[\033[37m\]at \[\033[36m\]\h\
 \[\033[33m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ ";;
    -*) usage "bad argument $THEME";;
    *) break;;
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
