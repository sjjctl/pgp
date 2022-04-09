********************
 My public PGP keys
********************

Summary
=======

If a key is revoked (removed from this GitHub account), it will have a retired date.

Keys will be listed in order of descending importance (frequency of use).
Retired keys will be moved to the bottom.

See ``./summary_of_keys.csv`` for detail on all keys and retire dates.

Importing
=========

Import my public keys to your keyring, and verify the list against my emails.

NOTE: You may be prompted to sign with an existing key.

.. code-block:: bash

    make install
    make list

You may also wish to import the public GitHub webflow-key used to sign web commits:

.. code-block:: bash

    curl https://github.com/web-flow.gpg | gpg --import
    gpg --sign-key 4AEE18F83AFDEB23


Verifying
=========

My commit signatures can then be verified.

Keys may be retired at any time, if lost or compromised.

.. code-block:: bash

    make test

Deleting
========

Public keys can be easily removed from your keyring:

.. code-block:: bash

    make uninstall
