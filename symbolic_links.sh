#!/bin/bash

# List of symbolic links to be added to /home/user/
SYMBOLIC_LINKS=("Images" "Music" "Documents" "Videos" "Downloads" "Pictures")

function remove_existing_links {
	LINK_OR_DIR="$1"
	if [ -d "$LINK_OR_DIR" ]; then 
		if [ -L "$LINK_OR_DIR" ]; then
	    # It is a symlink!
	    # Symbolic link specific commands go here.
	    rm "$LINK_OR_DIR"
	else
	    # It's a directory!
	    # Directory command goes here.
	    rmdir "$LINK_OR_DIR"
		fi
	fi
} 

function main {
	for i in "${SYMBOLIC_LINKS[@]}"
	do
		remove_existing_links "~/$i"
		ln -s "/media/$USER/MAIN/$i" ~/"$i" 
	done

}

main
