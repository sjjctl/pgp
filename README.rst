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

    git clone git@github.com:sjjctl/pgp.git
    ./pgp/import.sh
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

    git config --global alias.lgb "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches"
    git --no-pager lgb --stat --show-signature
