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

    # Import keys
    for key in ${keys[@]}; do
        printf "\\n\e[1;31m%s\e[0m\\n" "gpg --import --armor --yes $key"
        gpg --import --armor --yes $key
    done

    ## Sign with your existing trusted key
    #for key in ${keys[@]}; do
    #    fingerprints=$(gpg --fingerprint --with-colons "${key%.*}" | awk -F: '$1 == "fpr" {print $10;}')
    #    IFS=' ' read -r -a fingerprint <<< "$fingerprints"
    #    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --quick-sign-key --yes $fingerprint || :"
    #    gpg --quick-lsign-key --yes $fingerprint || :
    #done
done
