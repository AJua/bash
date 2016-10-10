#!/bin/bash 

find "/media/$USER/disk/" -name '*.JPG' | xargs -n 1 via_path

function via_path {
	DESC="/home/$USER/photos/"

	identify -format %[EXIF:DateTimeOriginal] $1 \
	| cut -d " " -f1 \
	| sed -e 's/:/-/g' \
	| \
	( \
	read folder
	if [ ! -d "$DESC$folder" ]; then
	  mkdir -p "$DESC$folder"
	fi
	rsync -vu --ignore-existing "$1" "$DESC$folder"
	)
}



