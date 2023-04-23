SHELL=/bin/bash
.DEFAULT_GOAL := _help


.PHONY: _help
_help:	## Comments like this, a tab character with two pound signs "<TAB>##" will show up unless you IGNORE_ME
ifeq ($(OS),Windows_NT)
	@echo This Makefile _help command does not support Windows right now!
	@echo   you can look at the Makefile, to see what it does
else
	@grep -h "##" $(MAKEFILE_LIST) | grep -v IGNORE_ME | sed -e 's/##//' | column -t -s $$'\t'
endif


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# List
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: list
list:	## List the keys in this repository
	gpg --list-key --keyid-format LONG $(shell find keys/ -name *.asc -printf "%f\n"| cut -d"." -f1)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Install, sign, & remove
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: install
install:	## Import my signing keys
	./scripts/import.sh \
	    keys/sign/personal \
	    keys/sign/work \
	    keys/retired

.PHONY: crypt
crypt:	## Import my encryption keys
	./scripts/import.sh keys/encrypt


.PHONY: sign
sign:	## Locally sign my keys
	./scripts/sign.sh keys/sign keys/encrypt keys/retired


.PHONY: uninstall
uninstall:	## Remove signing keys
	./scripts/delete.sh keys/sign keys/retired

.PHONY: rmcrypt
rmcrypt:	## Remove encryption keys
	./scripts/delete.sh keys/encrypt


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Test and extras
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: test
test:	## Do a self test using git log --show-signature
	git log --branches --graph --abbrev-commit --show-signature


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##	------------------------------------------------------
##	Edit specific commands (export, import, delete), e.g.
##	KEY=3A6DD722E62891D0 make export
##	------------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
KEY ?=

GPG_PUB_DIR ?= ~/Documents/pub
GPG_SEC_DIR ?= ~/Documents/sec
GPG_PUB_KEY ?= $(shell find $(GPG_PUB_DIR) -name $(KEY).asc)
GPG_SEC_KEY ?= $(shell find $(GPG_SEC_DIR) -name $(KEY).asc)

.PHONY: export
export:	## Export an updated public/secret key pair
	# Clean up
	rm -rf tmp/*.asc
	# Check KEY is set
	test -n "${KEY}"
	# Check ${KEY} is found in "${GPG_PUB_DIR}" and "${GPG_SEC_DIR}"
	test -n "${GPG_PUB_KEY}"
	test -n "${GPG_SEC_KEY}"
	# Check we have the SECRET key
	gpg --list-secret-keys --keyid-format=long ${KEY}
	# Export ${KEY} (PUBLIC & SECRET KEYS)
	gpg --emit-version -a --export ${KEY} >${GPG_PUB_KEY}
	gpg --emit-version -a --export-secret-keys ${KEY} >tmp/${KEY}.asc
	# Secret key is done in separate step, (wrong password otherwise overwrites with empty secret key file)
	mv tmp/${KEY}.asc ${GPG_SEC_KEY}

.PHONY: import
import:	## Import a secret key (to edit the signatures/retire)
	# Check KEY is set
	test -n "${KEY}"
	# Check ${KEY} was found in ${GPG_SEC_DIR}
	test -n "${GPG_SEC_KEY}"
	# Import ${KEY} (SECRET KEY)
	gpg --import ${GPG_SEC_KEY}

.PHONY: delete
delete:	## Delete a retired secret key (after editing & exporting)
	# Check KEY is set
	test -n "${KEY}"
	# Delete ${KEY} (SECRET KEY)
	gpg --delete-secret-and-public-keys ${KEY}
