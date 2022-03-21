for file in ~/.{bash_prompt,bash_aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add ~/bin, python3.7, and brew sbin to PATH.
export PATH="$HOME/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/chris/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/chris/solana/bin:$PATH"

. "$HOME/.cargo/env"

ssh-add -A &> /dev/null

