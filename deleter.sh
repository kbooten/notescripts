#!/bin/bash
selector=${1:-1}
if [[ "$selector" -eq 1 ]]; then
	. ./selector1.sh
elif [[ "$selector" -eq 2 ]]; then
	. ./selector2.sh
fi
set -f
IFS='
'
read -rd '' -a fles <<<"$fle"
number="${#fles[@]}"
if [ $number -eq 0 ]; then
	exit 1	
else
	echo "$fle"
	echo "***delete? (y or n)***"
	read action
	if [[ $action == y* ]]; then
		mv "${fles[@]}" ~/mytrash
		echo "files moved to mytrash"
	else
		echo "nothing deleted"
	fi
fi
