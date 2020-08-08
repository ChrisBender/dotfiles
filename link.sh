fnames=(
    ".bash_aliases"
    ".bash_profile"
    ".bash_prompt"
    ".tmux.conf"
    ".vimrc"
)
dotfiles=$(dirname $(realpath $0))
for fname in "${fnames[@]}"; do
    if [ -f ~/$fname ]; then
        mv ~/$fname ~/$fname.old
    fi
    echo "source $dotfiles/$fname" > ~/$fname
done
