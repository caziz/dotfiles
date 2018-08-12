#!/bin/sh

FILES=`git ls-tree -r master --name-only`

for file in $FILES; do
	ln -s `pwd`/"$file" ~/"$file"
done