#!/bin/bash 

SOURCE="/media/$USER/MAIN/home/$USER/photos"
PICTURES="/home/$USER/Pictures"

function extract_date_from_exif {
  identify -format %[exif:DateTime] $1 \
    | sed 's/^\([^ ]*\).*/\1/'\
    | sed 's/:/-/g' \
    | \
    ( \
    read folder
    if [ ! -d "$PICTURES/$folder" ]; then
      echo "going to create $PICTURES/$folder"
      mkdir -p "$PICTURES/$folder"
    fi
    #mv "$1" "$PICTURES/$folder/"
    rsync -v --ignore-existing "$1" "$PICTURES/$folder"
    )
}
 
export PICTURES="$PICTURES"
export -f extract_date_from_exif

find "$SOURCE" -iname '*.jpg' -print0 | xargs -0 -n1 -I{} bash -c "extract_date_from_exif {}"

