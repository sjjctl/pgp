#!/bin/bash

# Change to script's directory
cd "$(dirname "$0")"

function check_matchnumber() {

	if [ "$#" -gt $1 ]; then

		for a in "$@"; do
			test "$a" || return
		done

		echo "Matched spec! DONE!"
		exit
	fi
}

while true; do
	KEY_OUTPUT=$(./gpg-generate-ed-sce-keypair.sh)
	sleep 0.1

	# SPEC: All three (fpr, key_id, and subkey_id) start with a given letter, i.e., B
	# L=C
	# MATCH_1="$(echo "$KEY_OUTPUT" | grep "ed25519/$L" | awk '{print $2}')"
	# MATCH_2="$(echo "$KEY_OUTPUT" | grep "^      $L[A-Z,0-9]\{39\}$" | cut -c 7-16)"
	# MATCH_3="$(echo "$KEY_OUTPUT" | grep "cv25519/$L" | awk '{print $2}')"
	# set -x
	# check_matchnumber 3 "$MATCH_1" "$MATCH_2" "$MATCH_3"
	# set +x
	# -- END SPEC --

	# SPEC: All three start with at least four numbers
	# -- END SPEC --

	# SPEC: Only one key (fpr + id) to compare
	L=B
	MATCH_1="$(echo "$KEY_OUTPUT" | grep "ed25519/$L" | awk '{print $2}')"
	MATCH_2="$(echo "$KEY_OUTPUT" | grep "^      $L[A-Z,0-9]\{39\}$" | cut -c 7-16)"
	set -x
	check_matchnumber 2 "$MATCH_1" "$MATCH_2"
	set +x
	# -- END SPEC --

done

# OLD
# while [[ ! ("$(grep 'rsa4096/0BE' output.log)" || true) ]]; do
# 	# ./gpg-generate-rsa4096-encryption.sh | tee output.log;
# 	./gpg-generate-ed-sce-keypair.sh;
# done
