#!/bin/bash -x

cd "$(dirname "$0")"
cd ..  # Lives in /scripts

dirs=$@
keys=$(find $dirs -name *.asc)

# Import keys
for key in ${keys[@]}; do
    gpg --import --armor --yes $key
done
