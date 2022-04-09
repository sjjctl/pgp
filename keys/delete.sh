
#!/bin/bash

cd $(dirname $0)

# Build string list
keys=$(ls *.pgp)
for key in ${keys[@]}; do
    # Delete key
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --delete-keys ${key%.*}"
    gpg --delete-keys "${key%.*}"
done
