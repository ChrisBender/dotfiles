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

# Short aliases
alias e='exit'
alias d='cd ~/Desktop'

# Always X-forward
alias ssh='ssh -X'

# Use python3 always
alias pip='pip3'
alias python='python3'

# nvidia-smi on all sunblaze servers
alias nvidia-smi-all='tmux-cssh atlas pinwheel{1,2,3,4,5,7,8,9}'

# ls after cd
function cdls() {
    cd "$@" && ls
}
alias cd='cdls'

# Rotate Kalshi server
function rotate_kalshi() {
    # Terminate any previous instance
    all_instances=$(
        aws ec2 describe-instances \
            --filters "Name=tag:Name,Values=Kalshi" "Name=instance-state-code,Values=16" \
            | jq .Reservations
    )
    num_all_instances=$(echo $all_instances | jq ". | length")
    if [ $num_all_instances -gt 1 ]; then
        echo "Error: More than one instance was tagged 'Kalshi'."
        return
    elif [ $num_all_instances -eq 0 ]; then
        echo "No 'Kalshi' instance was found."
    else
        instance_to_terminate=$(echo $all_instances | jq -r ".[0].Instances[0].InstanceId")
        echo "Terminating Instance $instance_to_terminate"
        aws ec2 terminate-instances --instance-ids $instance_to_terminate  > /dev/null
    fi
    run_instance=$(
        aws ec2 run-instances \
            --launch-template "LaunchTemplateName=KalshiArb" \
            --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Kalshi}]"
    )
    run_instance_id=$(echo $run_instance | jq -r ".Instances[0].InstanceId")
    echo "New Instance $run_instance_id"
    sleep 3
    run_instance_public_dns=$(
        aws ec2 describe-instances \
            --instance-ids $run_instance_id | \
            jq -r .Reservations[0].Instances[0].PublicDnsName
    )
    echo "New Instance DNS:"
    echo $run_instance_public_dns
}
alias kalshir='rotate_kalshi'

