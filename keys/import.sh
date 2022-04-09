#!/bin/bash

cd $(dirname $0)

if [ -z "$1" ]; then
    :
    # No subdirectory passed in
else
    printf "\\n\e[1;31m%s\e[0m\\n" "cd $1"
    cd $1
fi

# TODO: for loop to recurse into each `<dir>/` and `<dir>/retire/` ?

# Exit if cwd has no *.pgp files
keys=$(ls *.pgp)
if [ -z "$keys" ]; then
    exit
fi

# Build string list
keys_str=""
for key in ${keys[@]}; do
    keys_str="${keys_str} $key"
done
# Remove leading whitespace
keys_str=$(echo $keys_str|xargs)

# Import keys
printf "\\n\e[1;31m%s\e[0m\\n" "gpg --import --armor --yes $keys_str"
gpg --import --armor --yes $keys_str

# Sign with your existing trusted key
for key in ${keys[@]}; do
    fingerprints=$(gpg --fingerprint --with-colons "${key%.*}" | awk -F: '$1 == "fpr" {print $10;}')
    IFS=' ' read -r -a fingerprint <<< "$fingerprints"
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --quick-sign-key --yes $fingerprint"
    gpg --quick-sign-key --yes $fingerprint
done
