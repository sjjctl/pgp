.DEFAULT_GOAL := install

install:
	@echo ""; ./script/import.sh work personal retired

uninstall:
	@echo ""; ./scripts/delete.sh work personal retired

list:
	gpg --list-key --keyid-format LONG shane.jaroch@centurylink.com shane.jaroch@lumen.com sjjctl@protonmail.com sjj.lumen@gmail.com mathmuncher11@gmail.com nutratracker@protonmail.com nutratracker@gmail.com

crypt:
	@echo ""; ./scripts/import.sh shared/encrypt

rmcrypt:
	@echo ""; ./scripts/delete.sh shared/encrypt


test:
	clear
	git --no-pager log --branches --graph --abbrev-commit --show-signature

# sign:
# 	- @echo ""; ./sign.sh
