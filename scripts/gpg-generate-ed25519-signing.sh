#!/bin/bash

cat <<EOT >batch-cmds
%echo Generating an ed25519 signing key
# %no-protection
Key-Type: EDDSA
Key-Curve: ed25519
Key-Usage: sign
Name-Real: ???
Name-Comment: signing key - ??? [???]
Name-Email: ???
Expire-Date: 0
Passphrase: ???
%pubring ed25519.pub
# %secring foo.sec  # no-op as of v2.1
# Do a commit here, so that we can later print "done" :-)
%commit
%echo done
EOT

gpg --batch --gen-key batch-cmds
gpg --keyid-format long ed25519.pub
