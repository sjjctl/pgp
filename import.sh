#!/bin/bash

cd $(dirname $0)

# find all key files
keys=$(find "work" "personal" "retired" -name *.asc)

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
