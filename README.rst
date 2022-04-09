********************
 My public PGP keys
********************

Summary
=======

If a key is revoked (removed from this GitHub account), it will have a retired date.

Keys will be listed in order of descending importance (frequency of use).
Retired keys will be moved to the bottom.

+-----------+----------------------------------------------+-------------+-------------+-------------------------------------------------------------+
| protocol  | key_id                                       | created     | retired     | name (comment) <email>                                      |
+===========+==============================================+=============+=============+=============================================================+
| ed25519   | 2BF79569526D9761EE581A79 / BFAB77B2CB228DC5  | 2022-04-09  |             | Shane J (coffeelake) <nutratracker@protonmail.com>          |
+-----------+----------------------------------------------+-------------+-------------+-------------------------------------------------------------+
| ed25519   | 5400C3E119A160130B0143B3 / C0EC6A6F154821E6  | 2020-02-10  | 2022-04-09  | Shane J (coffeelake) <mathmuncher11@gmail.com>              |
+-----------+----------------------------------------------+-------------+-------------+-------------------------------------------------------------+

Importing
=========

Import my public keys to your keyring:

.. code-block:: bash

    git clone git@github.com:gamesguru/pgp.git
    ./pgp/import.sh
    rm -rf pgp

You may also wish to import the public GitHub webflow-key used to sign web commits:

.. code-block:: bash

    curl https://github.com/web-flow.gpg | gpg --import --armor
    gpg --sign-key 4AEE18F83AFDEB23


Verifying
=========

My commit signatures to nutratech and any public repos can then be verified.

Keys may be retired at any time, if lost or compromised.

.. code-block:: bash

    git config --global alias.lgb "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches"
    git --no-pager lgb --stat --show-signature
