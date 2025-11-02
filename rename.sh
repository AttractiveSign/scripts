#! /bin/bash

SUFFIX=$1
#Check for missing or unnecessary arguments, print error message and quit if necessary
if [ -z "$1" ]; then
    echo "Usage: rename.sh <suffix>"
    exit 1
elif [ -n "$2" ]; then
    echo "Unknown argument: $2"
    echo "Usage: rename.sh <suffix>"
    exit 1
fi
#Iterate over files in directory
for FILE in *; do
#Check if file, skip over script if present
    if [ "$FILE" != "rename.sh" ] && [ -f "$FILE" ]; then
    #Check if file has extension, separate name and extension if necessary
        if [[ "$FILE" == *.* ]]; then
            FILENAME="${FILE%.*}"
            EXTENSION=".${FILE##*.}"
        #Leave extension empty if file didn't have one
        else
            FILENAME="$FILE"
            EXTENSION=""
        fi
        #Rename file
        mv "$FILE" "${FILENAME}${SUFFIX}${EXTENSION}"
    fi
done
