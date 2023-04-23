#!/bin/bash -e

cd "$(dirname "$0")"
cd .. # Lives in /scripts

dirs=$@

# Loop over each directory
for dir in ${dirs}; do
	echo $dir
	# Find keys in that directory
	keys=$(find $dir -name *.asc)
	# Import keys
	gpg --import --armor --yes $keys
done
