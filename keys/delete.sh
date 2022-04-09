#!/bin/bash

cd $(dirname $0)
cd keys

# Build string list
keys=("C0EC6A6F154821E6" "BFAB77B2CB228DC5")
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
