#!/bin/bash
echo "  ⌹  "
echo "title:"
read title
if [[ $title != *.txt ]]; then
	title="${title}.txt"
fi
touch "$title"
vim "$title"
