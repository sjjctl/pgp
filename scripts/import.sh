#!/bin/bash -x

cd $(dirname $0)
cd ..  # Lives in /scripts

dirs=$@
keys=$(find $dirs -name *.asc)

# Import keys
for key in ${keys[@]}; do
    gpg --import --armor --yes $key
done

# # Sign with your existing trusted key
# for key in ${keys[@]}; do
#     key=$(basename "$key")
#     fingerprints=$(gpg --fingerprint --with-colons "${key%.*}" | awk -F: '$1 == "fpr" {print $10;}')
#     IFS=' ' read -r -a fingerprint <<< "$fingerprints"
#     gpg --quick-lsign-key --yes $fingerprint || :
# done
