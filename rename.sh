#! /bin/bash

SUFFIX=$1
if [ -z "$1" ]; then
    echo "Usage: rename.sh <suffix>"
    exit 1
elif [ -n "$2" ]; then
    echo "Unknown argument: $2"
    echo "Usage: rename.sh <suffix>"
    exit 1
fi
for FILE in *; do
    if [ "$FILE" != "rename.sh" ] && [ -f "$FILE" ]; then
        if [[ "$FILE" == *.* ]]; then
            FILENAME="${FILE%.*}"
            EXTENSION=".${FILE##*.}"
        else
            FILENAME="$FILE"
            EXTENSION=""
        fi
            mv "$FILE" "${FILENAME}${SUFFIX}${EXTENSION}"
    fi
done
