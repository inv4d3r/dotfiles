# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.config/nvim/pack/minpac/start/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.config/nvim/pack/minpac/start/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.config/nvim/pack/minpac/start/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.config/nvim/pack/minpac/start/fzf/shell/key-bindings.zsh"

