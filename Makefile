PREFIX=/usr
MANDIR=$(PREFIX)/share/man
BINDIR=$(PREFIX)/bin

all:
	@echo "Run 'make install' for installation."
	@echo "Run 'make uninstall' for uninstallation."

install:
	install -Dm755 create_dhcp $(DESTDIR)$(BINDIR)/create_dhcp
	install -Dm644 create_dhcp.conf $(DESTDIR)/etc/create_dhcp.conf
	[ ! -d /lib/systemd/system ] || install -Dm644 create_dhcp.service $(DESTDIR)$(PREFIX)/lib/systemd/system/create_dhcp.service
	install -Dm644 bash_completion $(DESTDIR)$(PREFIX)/share/bash-completion/completions/create_dhcp
	install -Dm644 README.md $(DESTDIR)$(PREFIX)/share/doc/create_dhcp/README.md

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/create_dhcp
	rm -f $(DESTDIR)/etc/create_dhcp.conf
	[ ! -f /lib/systemd/system/create_dhcp.service ] || rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system/create_dhcp.service
	rm -f $(DESTDIR)$(PREFIX)/share/bash-completion/completions/create_dhcp
	rm -f $(DESTDIR)$(PREFIX)/share/doc/create_dhcp/README.md
