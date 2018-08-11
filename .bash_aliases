alias ea='open ~/.bash_aliases'
alias rl='source ~/.bashrc'
alias ls='ls -G'
alias mkdir='mkdir -pv'
mcd()  { mkdir "$1"; cd "$1";}
mk() { touch "$1"; echo "$2" >> "$1"; chmod +x "$1"; open -t "$1";}
mksh() { mk "$1" '#!/bin/sh';}
mkpy() { mk "$1" '#!/bin/python';}
alias cdd='cd ~/Developer'
alias cddt='cd ~/Desktop'
alias cdbm='cd ~/Developer/Bruin-Meet'
alias cdsl='cd ~/Developer/Bruin-Meet/swift-love/swift-love'
alias o='open .'
# alias subl=sublime
alias vsc='open $@ -a "Visual Studio Code"'
alias vscode='vsc'
# esc x tetris

# apple preferences
alias spacer='defaults write com.apple.dock persistent-apps -array-add "{'tile-type'='spacer-tile';}"; killall Dock'
alias sct='defaults write com.apple.screencapture type'
alias lwt='sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText'

# seasnet
alias seasnet='ssh aziz@lnxsrv09.seas.ucla.edu'
alias sn='seasnet'
alias sshfs='/usr/local/bin/sshfs aziz@lnxsrv09.seas.ucla.edu: ~/seasnet/ -o volname=SEASNET'
alias fuse_setup='mkdir ~/seasnet/; sshfs; open ~/SEASNET'
alias fuse='fuse_setup; while [ $? -ne 0 ]; do ufuse; sleep 1; fuse_setup; open ~/SEASNET; done'
alias ufuse='umount ~/seasnet/; rmdir ~/seasnet'

# cd to git repo, go back with cd -
cdg() {
	TEMP_PWD=`pwd`
	while ! [ -d .git ]; do
		cd ..
	done
	OLDPWD=$TEMP_PWD
}

alias ikr='defaults write -g InitialKeyRepeat -int 15' # normal minimum is 15 (225 ms)
alias kr='defaults write -g KeyRepeat -int 1' # normal minimum is 2 (30 ms)