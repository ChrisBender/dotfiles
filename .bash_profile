for file in ~/.{bash_prompt,bash_aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add ~/bin, python3.7, and brew sbin to PATH.
export PATH="$HOME/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

ssh-add -A &> /dev/null

