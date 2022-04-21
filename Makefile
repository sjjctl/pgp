.DEFAULT_GOAL := install

install:
	./scripts/import.sh keys/sign keys/retired

uninstall:
	./scripts/delete.sh keys/sign keys/retired

list:
	gpg --list-key --keyid-format LONG $(shell find keys/ -name *.asc -printf "%f\n"| cut -d"." -f1)

crypt:
	./scripts/import.sh keys/encrypt

rmcrypt:
	./scripts/delete.sh keys/encrypt


sign:
	./scripts/sign.sh keys/sign keys/encrypt keys/retired


test:
	git log --branches --graph --abbrev-commit --show-signature
