#!/bin/bash

cd $(dirname $0)
cd keys

# Build string list
keys=("6DE67F6BAF8E633F" "497716DED33B4FE8")
# retired_keys=("D18E60568103C1CC")  # nested in `keys/retired/` folder.. requires special loop
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
