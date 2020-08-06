# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,bash_aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

ssh-add -A &> /dev/null

