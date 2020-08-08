for file in ~/.{bash_prompt,bash_aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
# Setting PATH for Python 3.7
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

ssh-add -A &> /dev/null

