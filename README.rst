********************
 My public PGP keys
********************

Summary
=======

If a key is revoked (removed from this GitHub account), it will have a retired date.

Keys will be listed in order of descending importance (frequency of use).
Retired keys will be moved to the bottom.

See ``./summary_of_keys.csv`` for detail on all keys and retire dates.

NOTE: You may be prompted to sign with an existing key.

If you don't have one, create one with ``gpg2 --expert --full-gen-key``.

In the  ``scripts/`` folder, you can also use ``gpg-generate-rsa4096-encryption.sh``, or  ``gpg-generate-ed25519-signing.sh``.

Save your main key as ultimately trusted (5) with ``gpg2 --edit-key <key_id>``, ``trust``, ``5``, ``save``.

Importing
=========

You may wish to first import the public GitHub webflow-key used to sign web commits:

.. code-block:: bash

    curl https://github.com/web-flow.gpg | gpg --import
    gpg --lsign-key 4AEE18F83AFDEB23

Import my **signing keys** to your keyring, and sign them as trusted:

.. code-block:: bash

    make
    make list
    make sign

Or import from GitHub:

.. code-block:: bash

    curl https://github.com/sjjctl.gpg | gpg --import
    curl https://github.com/gamesguru.gpg | gpg --import

They can be removed just as easily:

.. code-block:: bash

    make uninstall

You can also add my **encryption** keys:

.. code-block:: bash

    make crypt
    make rmcrypt  # to remove

Verifying
=========

My commit signatures can then be verified (``git show --show-signature``, ``git log --show-signature``, etc).

Keys may be retired at any time, if lost or compromised.

::

    make test

Deleting
========

Public keys can be easily removed from your keyring:

.. code-block:: bash

    make uninstall
    make rmcrypt
