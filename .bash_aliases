#!/usr/bin/env bash

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # macOS `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias ll="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# chrisliambender.com alias
CLBUSER='s78lmtj8916t'
alias chrisliambender='ssh $CLBUSER@chrisliambender.com'
alias scpclb='scp -r /Users/chris/Desktop/website/* $CLBUSER@chrisliambender.com:/home/$CLBUSER/public_html'

# ssh process alias
alias pssh='ps aux | grep ssh'

# atlas alias and ssh pipe
# alias atlas='ssh chris@atlas.ist.berkeley.edu'

atlasport='ssh -N -f -L localhost:8888:localhost:8890 chris@atlas.ist.berkeley.edu'
alias jupyteratlas='pid=`pssh | grep "$atlasport" | grep -v grep | head -n 1 | cut -d " " -f 2- | xargs | cut -d " " -f -1`; if [ $pid ]; then kill $pid; eval $atlasport; echo "Killed ssh pipe and restarted."; else eval $atlasport; echo "Created a ssh pipe to atlas."; fi; echo "localhost:8888 is now mapped to atlas:8890."'

# pinwheel alias
# alias pinwheel='ssh chris@pinwheel10.d2.comp.nus.edu.sg'

# short aliases
alias e='exit'
alias d='cd ~/Desktop'

# function to port-forward to atlas
function port(){
    default_1="8888"
    default_2="8891"
    ssh -N -f -L localhost:${1:-$default_1}:localhost:${2:-$default_2} chris@atlas.ist.berkeley.edu;
}

# always X-forward
alias ssh='ssh -X'

alias pip='pip3'
alias python='python3'

# alias for nvidia-smi on all sunblaze servers
alias nvidia-smi-all='tmux-cssh atlas pinwheel{1,2,3,4,5,7,8,9}'

