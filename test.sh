#!/bin/bash

while [ -n "$1" ]
	do
		case "$1" in
			lock) if [ -n "$2" ]; then 
					lualatex -shell-escape -jobname=$2 ./lock.tex
				fi;;
			block) if [ -n "$2" ]; then 
					lualatex -shell-escape -jobname=$2 ./block.tex
				fi;
				shift;					
				break;
		esac
	shift
done
