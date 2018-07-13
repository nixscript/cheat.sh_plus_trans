all:
		@ echo "Nothing to compile. Use: sudo make install, sudo make uninstall"

install:
		install -m0755 ./cheat.sh /usr/bin/cheat.sh

uninstall:
		rm -fv /usr/bin/cheat.sh
