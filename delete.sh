#!/bin/bash

cd $(dirname $0)

dirs=$(find -type d \( ! -name . ! -name .git \) -not -path "./.git/*")

for dir in ${dirs[@]}; do
    echo $dir

    keys=$(ls $dir/*.asc)
    echo $keys

    # Skip empty directories
    if [ -z "$keys" ]; then
        continue
    fi

    # Delete keys
    for key in ${keys[@]}; do
        key=$(basename "$key")
        printf "\\n\e[1;31m%s\e[0m\\n" "gpg --batch --delete-keys --yes ${key%.*}"
        gpg --batch --delete-keys --yes "${key%.*}"
    done
done
