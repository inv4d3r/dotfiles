#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function create_link {
    if [ -z "$1" ]; then
        echo "Error: Source file not specified"
        return 1
    fi

    source_file="$script_dir/$1"
    dest_file="$HOME/$1"
    if [ -e "$dest_file" ]; then
        echo "Warning: File $dest_file already exists. Backing up to $dest_file.bak"
        mv "$dest_file" "$dest_file.bak"
    fi
    ln -sf "$source_file" "$dest_file"
}

dotfiles=(
    ".bash_profile"
    ".bashrc"
    # ".compton.conf"
    ".ctags.d"
    ".fzf.bash"
    ".fzf.zsh"
    ".gdbinit"
    ".gitconfig"
    ".gitignore_global"
    ".ignore"
    ".inputrc"
    ".urlview"
    ".mutt"
    ".muttrc"
    ".mailcap"
    ".profile"
    ".rtorrent.rc"
    ".tmux.conf"
    ".tridactylrc"
    ".vimrc"
    # ".Xdefaults"
    ".xinitrc"
    ".Xresources"
    ".zprofile"
    ".zshrc"
)

for file in "${dotfiles[@]}"; do
    create_link "$file"
done
