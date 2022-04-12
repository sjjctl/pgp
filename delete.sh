#!/bin/bash

cd $(dirname $0)

# find all key files
keys=$(find "work" "personal" "retired" -name *.asc)

# Delete keys
for key in ${keys[@]}; do
    key=$(basename "$key")
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --batch --delete-keys --yes ${key%.*}"
    gpg --batch --delete-keys --yes "${key%.*}"
done
