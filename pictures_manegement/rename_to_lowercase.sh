#!/bin/bash

PICTURES="/media/$USER/MAIN/Pictures"

find "$PICTURES" -type f -exec rename -f 'y/A-Z/a-z/' '{}' \;

