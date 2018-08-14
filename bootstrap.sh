#!/bin/sh

# use -i for interactive mode and -f to force

FILES=`git ls-tree -r master --name-only`
SCRIPT=`basename "$0"`
INTERACTIVE=false
FORCE=false

while getopts "if" option; do
    case "${option}"
    in
    i) INTERACTIVE=true;;
    f) FORCE=true;;
    esac
done

for file in $FILES; do
    if [[ $file == $SCRIPT ]]; then
        continue
    fi
    if [ $INTERACTIVE = true ] ; then
        if [ -f ~/"$file" ]; then
            echo "~/"$file" already exists."
            echo "Replace it with a link to "$file"? [y/n]"
        else
            echo "~/"$file" does not exist."
            echo "Create link to "$file"? [y/n]"
        fi
        read -p "> " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || continue
    fi
    if [[ $FORCE = true || $INTERACTIVE = true ]]; then
        rm -f ~/"$file"
    fi
    ln -s `pwd`/"$file" ~/"$file"
done
