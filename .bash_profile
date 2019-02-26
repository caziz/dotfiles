for file in ~/.{bash_aliases,bash_prompt,macos}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
# Change meta key to option key in XQuartz, launches XQuartz
# xmodmap ~/.xmodmap 2> /dev/null

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# OPAM (OCaml) configuration
# . /Users/christopheraziz/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Add Racket (Scheme) to path
# PATH="/Applications/Racket v6.12/bin:${PATH}"
# export PATH

# Add Python 3.6 to path
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
# export PATH

# Add Sumblime to path
# PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:${PATH}"
# export PATH
# export EDITOR='subl -w'