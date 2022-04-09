#!/bin/bash

cd $(dirname $0)
cd keys

# Build string list
keys=("D18E60568103C1CC" "497716DED33B4FE8")
keys_str=""
for key in ${keys[@]}; do
    keys_str="${keys_str} $key.pgp"
done
# Remove leading whitespace
keys_str=$(echo $keys_str|xargs)

# Import keys
printf "\\n\e[1;31m%s\e[0m\\n" "gpg --import --armor $keys_str"
gpg --import --armor $keys_str

# Sign with your existing trusted key
for key in ${keys[@]}; do
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --sign-key $key"
    gpg --sign-key $key
done
