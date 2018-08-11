# Create aliases
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

# Change meta key to option key in XQuartz, launches XQuartz
# xmodmap ~/.xmodmap 2> /dev/null

# Enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Fancy Git Stuff
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
# source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u \w$(__git_ps1)]\$ '


# OPAM configuration
. /Users/christopheraziz/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Add racket to path
PATH="/Applications/Racket v6.12/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

