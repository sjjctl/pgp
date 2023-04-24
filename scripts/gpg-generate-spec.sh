#!/bin/bash -x

while [ ! "$(grep 'rsa4096/0BE' output.log)" ]; do
	./gpg-generate-rsa4096-encryption.sh | tee output.log;
done
