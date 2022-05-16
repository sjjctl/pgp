********************
 My public PGP keys
********************

Summary
-------

If a key is revoked (removed from this GitHub account),
it will have a retired date.

Keys appear in order of descending importance (frequency of use).
Retired keys will be moved to the bottom.

See ``./summary_of_keys.csv`` for detail on all keys and retire dates.

NOTE: You may be prompted to sign with an existing key.

If you don't have one, create one with ``gpg2 --expert --full-gen-key``.

In the  ``scripts/`` folder, you can also use
``gpg-generate-rsa4096-encryption.sh`` or
``gpg-generate-ed25519-signing.sh``.

Save your main key as ultimately trusted (5) with
``gpg2 --edit-key <key_id>``, ``trust``, ``5``, ``save``.

Importing
=========

You may wish to first import the public GitHub webflow-key
used to sign web commits:

.. code-block:: bash

    curl https://github.com/web-flow.gpg | gpg --import
    gpg --lsign-key 4AEE18F83AFDEB23

Import my **signing keys** to your keyring, and sign them as trusted:

.. code-block:: bash

    make
    make list
    make sign

Or import from GitHub.

.. code-block:: bash

    curl https://github.com/sjjctl.gpg | gpg --import
    curl https://github.com/gamesguru.gpg | gpg --import

They can be removed just as easily.

.. code-block:: bash

    make uninstall

You can also add my **encryption** keys.

.. code-block:: bash

    make crypt
    make rmcrypt  # to remove

Verifying
=========

My commit signatures can then be verified
(``git show --show-signature``, ``git log --show-signature``, etc).

Keys may be retired at any time, if lost or compromised.

::

    make test

Deleting
========

Public keys can be easily removed from your keyring.

.. code-block:: bash

    make uninstall
    make rmcrypt

Generating Your own PGP keys
----------------------------

I like to start my work keys with a number, and my personal keys
with a letter.  Automating the generation process can help take
the labor out of ensuring such a standard.

Uncomment the ``%no-protection`` line for faster key generation.

Here are shell scripts for creating signing keys.

.. code-block:: shell

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


And for encryption keys.

.. code-block:: shell

    #!/bin/bash

    cat <<EOT >batch-cmds
    %echo Generating an RSA encryption key
    # %no-protection
    Key-Type: RSA
    Key-Length: 4096
    Key-Usage: encrypt
    Name-Real: ???
    Name-Comment: encryption key - ??? [???]
    Name-Email: ???
    Expire-Date: 0
    Passphrase: ???
    %pubring rsa.pub
    # %secring foo.sec  # no-op as of v2.1
    # Do a commit here, so that we can later print "done" :-)
    %commit
    %echo done
    EOT

    gpg --batch --gen-key batch-cmds
    gpg --keyid-format long rsa.pub
