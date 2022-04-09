#!/bin/bash

cd $(dirname $0)

if [ -z "$1" ]; then
    :
    # No subdirectory passed in
else
    printf "\\n\e[1;31m%s\e[0m\\n" "cd $1"
    cd $1
fi

# Build string list
keys=$(ls *.pgp)
for key in ${keys[@]}; do
    # Delete key
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --batch --delete-keys --yes ${key%.*}"
    gpg --batch --delete-keys --yes "${key%.*}"
done
