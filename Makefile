DESTDIR ?=
BINDIR ?= /usr/local/bin
SYSTEMDUNITDIR ?= /usr/local/lib/systemd/system

all:
	@ echo "Use: make install, make uninstall"

install:
	install -d $(DESTDIR)$(BINDIR)

	install -m0755 mglru-thrashing-prevention_value $(DESTDIR)$(BINDIR)/mglru-thrashing-prevention_value

	-install -d $(DESTDIR)$(SYSTEMDUNITDIR)
	-install -m0644 mglru-thrashing-prevention.service $(DESTDIR)$(SYSTEMDUNITDIR)/mglru-thrashing-prevention.service
	-chcon -t systemd_unit_file_t $(DESTDIR)$(SYSTEMDUNITDIR)/mglru-thrashing-prevention.service
	# Very nice!

uninstall:
	-systemctl disable mglru-thrashing-prevention.service || :
	
	rm -fv $(DESTDIR)$(BINDIR)/mglru-thrashing-prevention_value

	-rm -fv $(DESTDIR)$(SYSTEMDUNITDIR)/mglru-thrashing-prevention.service

	-systemctl daemon-reload
