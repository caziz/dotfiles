# deter
alias deter='ssh la136ah@users.deterlab.net'
alias d='deter'
alias s='d'
alias tunnel='ssh la136ah@users.deterlab.net -L 8118:server.la136ah-forensics.UCLA136.isi.deterlab.net:80'

# aliases
alias ea='open ~/.bash_aliases'
alias rl='source ~/.bash_aliases'

# file system etc
alias ls='ls -G'
alias mkdir='mkdir -pv'
alias o='open .'
alias cdd='cd ~/Developer'
alias cddt='cd ~/Desktop'
cs() { cd "$HOME/Developer/UCLA-CS-$1"; }
go() { cd "$1" && ls; }
mcd()  { if [ "$#" -ne 1 ]; then echo "usage: mcd directory"; else mkdir "$1"; cd "$1"; fi;}
# alias subl=sublime
alias code='open $@ -a "Visual Studio Code"'
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

# seasnet
alias seasnet='ssh aziz@lnxsrv09.seas.ucla.edu'
alias sn='seasnet'
alias sshfs='/usr/local/bin/sshfs aziz@lnxsrv09.seas.ucla.edu: ~/seasnet/ -o volname=SEASNET'
alias fuse_setup='mkdir ~/seasnet/; sshfs; open ~/SEASNET'
alias fuse='fuse_setup; while [ $? -ne 0 ]; do ufuse; sleep 1; fuse_setup; open ~/SEASNET; done'
alias ufuse='umount ~/seasnet/; rmdir ~/seasnet'

alias df_sshfs='/usr/local/bin/sshfs la136ah@users.deterlab.net: ~/Desktop/deter-sshfs -o volname=DETER-SSHFS'
alias df_setup='mkdir ~/Desktop/deter-sshfs; df_sshfs; open ~/Desktop/DETER-SSHFS'
alias df='df_setup;while [ $? -ne 0 ]; do df_unmount; sleep 1; fuse_setup; open ~/SEASNET; done'
alias df_unmount='umount ~/deter-sshfs/; rmdir ~/deter-sshfs'
# git
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

# macOS
alias spacer='defaults write com.apple.dock persistent-apps -array-add "{'tile-type'='spacer-tile';}"; killall Dock'
alias sct='defaults write com.apple.screencapture type'
alias lwt='sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText'
alias cpu='sysctl -n machdep.cpu.brand_string'
alias ikr='defaults write -g InitialKeyRepeat -int 15' # normal minimum is 15 (225 ms)
alias kr='defaults write -g KeyRepeat -int 1' # normal minimum is 2 (30 ms)

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
