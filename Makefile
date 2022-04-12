.DEFAULT_GOAL := install

install:
	@echo ""; ./import.sh

uninstall:
	@echo ""; ./delete.sh

list:
	gpg --list-key --keyid-format LONG shane.jaroch@centurylink.com shane.jaroch@lumen.com sjjctl@protonmail.com sjj.lumen@gmail.com mathmuncher11@gmail.com nutratracker@protonmail.com nutratracker@gmail.com

test:
	clear
	git --no-pager log --branches --graph --abbrev-commit --show-signature

# sign:
# 	- @echo ""; ./sign.sh
