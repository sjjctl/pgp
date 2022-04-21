.DEFAULT_GOAL := install

install:
	./scripts/import.sh work personal retired

uninstall:
	./scripts/delete.sh work personal retired

list:
	gpg --list-key --keyid-format LONG shane.jaroch@centurylink.com shane.jaroch@lumen.com sjjctl@protonmail.com sjj.lumen@gmail.com mathmuncher11@gmail.com nutratracker@protonmail.com nutratracker@gmail.com bitcommander@zoho.com

crypt:
	./scripts/import.sh encrypt

rmcrypt:
	./scripts/delete.sh encrypt


sign:
	./scripts/sign.sh work personal encrypt retired


test:
	git log --branches --graph --abbrev-commit --show-signature
