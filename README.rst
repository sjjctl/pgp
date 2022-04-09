********************
 My public PGP keys
********************

Summary
=======

If a key is revoked (compromised and removed from my GitHub), it will have a revocation date.

Keys will be listed in order of descending importance (frequency of use).  Revoked keys will be moved to the bottom.

+-----------+----------------------------------------------+-------------+----------+-----------------------------------------------+
| protocol  | key_id                                       | created     | revoked  | name (comment) <email>                        |
+===========+==============================================+=============+==========+===============================================+
| ed25519   | 86A3DCDDD670D24EAFC2FDAB / D18E60568103C1CC  | 2022-04-07  |          | Shane J (coffeelake) <sjjctl@protonmail.com>  |
+-----------+----------------------------------------------+-------------+----------+-----------------------------------------------+

Importing
=========

Import my keys to your public keyring:

.. code-block:: bash

    git clone git@github.com:sjjctl/pgp.git
    cd pgp/keys
    gpg --import --armor D18E60568103C1CC.pgp

    cd ../..
    rm -rf pgp

Verifying
=========

My commits or contributions to any "CenturyLink Cloud" repo can then be verified.

Keys may be revoked at any time, if lost or compromised.

.. code-block:: bash

    git --no-pager log --stat --show-signature
