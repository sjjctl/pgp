
#!/bin/bash

cd $(dirname $0)

# Build string list
keys=$(ls *.pgp)
keys_str=""
for key in ${keys[@]}; do
    keys_str="${keys_str} ${key%.*}"
done
# Remove leading whitespace
keys_str=$(echo $keys_str|xargs)

# Delete keys
printf "\\n\e[1;31m%s\e[0m\\n" "gpg --delete-keys $keys_str"
gpg --delete-keys $keys_str
