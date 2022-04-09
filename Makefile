.DEFAULT_GOAL := init

install:
	@echo ""; ./keys/import.sh personal/
	@echo ""; ./keys/import.sh personal/retired/
	@echo ""; ./keys/import.sh shared/
	@echo ""; ./keys/import.sh shared/retired/
	@echo ""; ./keys/import.sh work/
	@echo ""; ./keys/import.sh work/retired/

uninstall:
	- @echo ""; ./keys/delete.sh personal/
	- @echo ""; ./keys/delete.sh personal/retired/
	- @echo ""; ./keys/delete.sh shared/
	- @echo ""; ./keys/delete.sh shared/retired/
	- @echo ""; ./keys/delete.sh work/
	- @echo ""; ./keys/delete.sh work/retired/

list:
	gpg --list-key shane.jaroch@centurylink.com sjjctl@protonmail.com mathmuncher11@gmail.com nutratracker@protonmail.com

test:
	git --no-pager lgb --show-signature

