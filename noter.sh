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
elif [ $number -eq 1 ]; then
	vim "${fles[@]}"
elif [ $number -gt 1 ]; then
	echo "$fle"
	echo "(o=open, l=link all, c=constellate, q=quit)"
	read action
	if [[ $action == q* ]]; then
		exit 1	
	elif [[ $action == o* ]]; then
		vim "${fles[@]}"
	elif [[ $action == l* ]]; then
		limit="$(($number-1))"
		limit2="$(($number-2))"
		for i in $(seq 0 $limit2); do
			innerlimit="$(($i+1))"
			for x in $(seq $innerlimit $limit); do
				echo -e "\n\n[[${fles[$i]}]]" | sed 's/\.txt//g' >> ${fles[$x]}
				echo -e "\n\n[[${fles[$x]}]]" | sed 's/\.txt//g' >> ${fles[$i]}
			done
		done
	elif [[ $action == c* ]]; then
		echo "0> **new**"
		for i in ${!fles[@]}; do 
			newn="$(($newn+1))"
			echo "${newn}> ${fles[$i]}"
		done
		read sel
		if [[ $sel -eq 0 ]]; then
			. ./newnote.sh
			newfile=$title 
			for f in ${!fles[@]}; do
				echo -e "\n\n[[${fles[$f]}]]" | sed 's/\.txt//g' >> $newfile
				echo -e "\n\n[[$newfile]]" | sed 's/\.txt//g' >> ${fles[$f]}
			done
		
		else
			seladj="$(($sel-1))"
			for f in ${!fles[@]}; do
				if [[ $f  -ne $seladj ]]; then
					echo -e "\n\n[[${fles[$seladj]}]]" | sed 's/\.txt//g' >> ${fles[$f]}
					echo -e "\n\n[[${fles[$f]}]]" | sed 's/\.txt//g' >> ${fles[$seladj]}
				fi
			done
		fi
	fi
fi
