# CS 136 DeterLab
alias s='ssh deter'
alias tunnel='ssh -N tunnel'

# CS 161
alias lisp='clisp -i ~/Desktop/hw*.lsp'

# editing dotfiles
alias ea='open ~/.bash_aliases' # edit aliases
alias ep='open ~/.bash_prompt' # edit prompt
alias rl='source ~/.bash_aliases' # reload aliases

# allow sudo with aliases
alias sudo='sudo '

# viewing files
alias o='open .'
if ls --color > /dev/null 2>&1; then # GNU `ls`
  alias ls="command ls --color"
else # macOS `ls`
  alias ls="command ls -G"
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias wrapon='tput rmam'
alias wrapoff='tput smam'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cdd='cd ~/Developer'
alias cddt='cd ~/Desktop'
alias cddoc='cd ~/Documents'
alias cddl='cd ~/Downloads'
alias cdapp='cd /Applications'
go() { cd "$1" && ls; }
cs() { cd "$HOME/Developer/UCLA-CS-$1"; }

# file creation
alias mkdir='mkdir -pv'
mcd()  { if [ "$#" -ne 1 ]; then echo "usage: mcd directory"; else mkdir "$1"; cd "$1"; fi;}
# emacs: esc x tetris
mk() {
  if [[ "$#" -ne 1 && "$#" -ne 2 ]]; then
    echo "usage: mk file [shebang]"
  else
    touch "$1"
    if [ "$#" -ne 1 ]; then
      echo -en "$2\n$(cat $1)" > "$1"
    fi
    chmod +x "$1"
    open -t "$1"
  fi
}
mksh() { if [ "$#" -ne 1 ]; then echo "usage: mksh file"; else mk "$1" '#!/usr/bin/env bash'; fi; }
mkpy() { if [ "$#" -ne 1 ]; then echo "usage: mkpy file"; else mk "$1" '#!/usr/bin/env python'; fi; }

# hide/show all desktop icons (useful when presenting)
alias hidedt="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdt="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# show path line by line
alias path='echo -e ${PATH//:/\\n}'

# seasnet
# alias seasnet='ssh aziz@lnxsrv09.seas.ucla.edu'
# alias sn='seasnet'
# alias sshfss='/usr/local/bin/sshfs aziz@lnxsrv09.seas.ucla.edu: ~/seasnet/ -o volname=SEASNET'
# alias fuse_setup='mkdir ~/seasnet/; sshfss; open ~/SEASNET'
# alias fuse='fuse_setup; while [ $? -ne 0 ]; do ufuse; sleep 1; fuse_setup; open ~/SEASNET; done'
# alias ufuse='umount ~/seasnet/; rmdir ~/seasnet'

fuse() {
  LOC="$HOME/Desktop"
  DIR="/"
  if [ "$#" -ne 2 ]; then
    NAME="deterlab"
    DEST="la136ah@users.deterlab.net"
  else
    NAME="$1"
    DEST="$2"
  fi
  if [ ! -d "$LOC/$NAME-mountpoint" ]; then
    echo "Making directory: $LOC/$NAME-mountpoint"
    mkdir "$LOC/$NAME-mountpoint"
  fi
  eval "sshfs $DEST:$DIR $LOC/$NAME-mountpoint -o volname=$NAME"
  while [ -d "$LOC/$NAME-mountpoint" ]; do
    sleep 1
    echo "sleepin"
    echo "$LOC/$NAME-mountpoint"
  done
  cd "$LOC/$NAME"
  open "$LOC/$NAME"
}

# git commands
alias g='git'
# cd up to git repo, go back with `cd -`
cdg() {
	TEMP_PWD=`pwd`
	while ! [ -d .git ]; do
		cd ..
	done
	OLDPWD=$TEMP_PWD
}
gh() {
  open `git remote -v |\
    grep fetch |\
    awk '{print $2}' |\
    sed 's/git@/http:\/\//' |\
    sed 's/com:/com\//'` |\
  head -n1
}
ghcl() {
  if [[ "$1" == *"/"* ]]; then
    git clone "https://github.com/$1.git"
  else
    git clone "https://github.com/caziz/$1.git"
  fi
}

# macOS commands
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# macOS config commands
alias sct='defaults write com.apple.screencapture type'
alias lwt='sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText'
alias cpu='sysctl -n machdep.cpu.brand_string'
alias hw='system_profiler SPHardwareDataType'
alias ikr='defaults write -g InitialKeyRepeat -int 15' # normal minimum is 15 (225 ms)
alias kr='defaults write -g KeyRepeat -int 1' # normal minimum is 2 (30 ms)

# print current finder directory
function pfd { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; }
# cd to current finder directory
function cdf { cd "`pfd $@`"; }

# open man page in Preview
function pman { man -t "$1" | open -f -a Preview; }
# open man page in x-man-page
function xman {
  if [ $# -eq 1 ]; then
    open x-man-page://$1;
  elif [ $# -eq 2 ]; then
    open x-man-page://$1/$2;
  fi
}

