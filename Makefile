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

.PHONY: list
list:	## List the keys in thise repository
	gpg --list-key --keyid-format LONG $(shell find keys/ -name *.asc -printf "%f\n"| cut -d"." -f1)


.PHONY: install
install:	## Import my signing keys
	./scripts/import.sh keys/sign keys/retired

.PHONY: crypt
crypt:	## Import my encryption keys
	./scripts/import.sh keys/encrypt

.PHONY: uninstall
uninstall:	## Remove signing keys
	./scripts/delete.sh keys/sign keys/retired

.PHONY: rmcrypt
rmcrypt:	## Remove encryption keys
	./scripts/delete.sh keys/encrypt


.PHONY: sign
sign:	## Locally sign my keys
	./scripts/sign.sh keys/sign keys/encrypt keys/retired


.PHONY: test
test:	## Do a self test using git log --show-signature
	git log --branches --graph --abbrev-commit --show-signature
