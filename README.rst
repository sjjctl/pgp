********************
 My public PGP keys
********************

Summary
=======

If a key is revoked (or removed from my GitHub), it will have a revocation date.

Keys will be listed in order of descending importance (frequency of use).
Revoked keys will be moved to the bottom.

+-----------+----------------------------------------------+-------------+----------+-------------------------------------------------------------+
| protocol  | key_id                                       | created     | revoked  | name (comment) <email>                                      |
+===========+==============================================+=============+==========+=============================================================+
| ed25519   | 86A3DCDDD670D24EAFC2FDAB / D18E60568103C1CC  | 2022-04-07  |          | Shane J (primary personal desktop) <sjjctl@protonmail.com>  |
+-----------+----------------------------------------------+-------------+----------+-------------------------------------------------------------+
| ed25519   | A25B1F113CD2CA87DDECF660 / 497716DED33B4FE8  | 2022-04-09  |          | Shane J (Lumen's provided Mac) <sjjctl@protonmail.com>      |
+-----------+----------------------------------------------+-------------+----------+-------------------------------------------------------------+

Importing
=========

Import my public keys to your keyring:

.. code-block:: bash

    #!/bin/bash

    git clone git@github.com:sjjctl/pgp.git
    cd pgp/keys

    # Build string list
    keys=("D18E60568103C1CC" "497716DED33B4FE8")
    keys_str=""
    for key in ${keys[@]}; do
        keys_str="${keys_str} $key.pgp"
    done
    # Remove leading whitespace
    keys_str=$(echo $keys_str|xargs)

    # Import keys
    printf "\\n\e[1;31m%s\e[0m\\n" "gpg --import --armor $keys_str"
    gpg --import --armor $keys_str

    # Sign with your existing trusted key
    for key in ${keys[@]}; do
        printf "\\n\e[1;31m%s\e[0m\\n" "gpg --sign-key $key"
        gpg --sign-key $key
    done

    cd ../..
    rm -rf pgp

You may also wish to import the public GitHub webflow-key used to sign web commits:

.. code-block:: bash

    curl https://github.com/web-flow.gpg | gpg --import --armor
    gpg --sign-key 4AEE18F83AFDEB23


Verifying
=========

My commit signatures to "CenturyLink Cloud" repos can then be verified.

Keys may be revoked at any time, if lost or compromised.

.. code-block:: bash

    git --no-pager log --stat --show-signature
