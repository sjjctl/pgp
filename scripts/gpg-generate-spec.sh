#!/bin/bash

# set -x

# while [[ ! ("$(grep 'rsa4096/0BE' output.log)" || true) ]]; do
# 	# ./gpg-generate-rsa4096-encryption.sh | tee output.log;
# 	./gpg-generate-ed-sce-keypair.sh;
# done

while true; do
	KEY_OUTPUT=$(./gpg-generate-ed-sce-keypair.sh)
	sleep 0.1

	KEY_FLAG_1="$(echo "$KEY_OUTPUT" | grep 'ed25519/[A-Z]')"
	KEY_FLAG_2="$(echo "$KEY_OUTPUT" | grep '^      [A-Z]\{1\}[A-Z,0-9]\{39\}$')"
	KEY_FLAG_3="$(echo "$KEY_OUTPUT" | grep 'cv25519/[A-Z]')"

	set -x
	test "$KEY_FLAG_1" && test "$KEY_FLAG_2" && test "$KEY_FLAG_3" &&
		echo "Matched spec! DONE!" &&
		break
	set +x

	# if [[  "$KEY_FLAG_1" && "$KEY_FLAG_2" && "$KEY_FLAG_3" ]]; then
	# 	echo "Matched spec! DONE!"
	# 	break
	# fi
done
