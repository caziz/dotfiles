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
green='\[\e[0;32m\]'
blue='\[\e[0;34m\]'
red='\[\e[0;35m\]'
git='$(__git_ps1)'
clear='\[\e[0m\]'
prompt="[${green}\u ${blue}\w${red}${git}${clear}]"
export PS1="$prompt\$ "
export PS2="$prompt  "
unset green blue red git clear prompt

# OPAM (OCaml) configuration
. /Users/christopheraziz/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Add Racket (Scheme) to path
PATH="/Applications/Racket v6.12/bin:${PATH}"
export PATH

# Add Python 3.6 to path
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Add Sumblime to path
# PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:${PATH}"
# export PATH
# export EDITOR='subl -w'