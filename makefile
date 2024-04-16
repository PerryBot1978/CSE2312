all :
	+ fdfind --type directory --exec bash -c "( cd {} ; $(MAKE) -j4 )"

clean :
	+ fdfind --type directory --exec bash -c "( cd {} ; $(MAKE) clean )"

zip :
	@-(cd .. && tar cvzf --exclude="./.*" dtb9096.tgz dtb9096)
	@echo
	tar tvzf ../dtb9096.tgz

