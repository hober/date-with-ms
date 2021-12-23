BINARY=date-with-ms
OBJFILE=
DELETE=rm -f
COPY=cp

MACHTYPE = $(shell uname -m | tr '[:upper:]' '[:lower:]')
OSTYPE = $(shell uname -s | tr '[:upper:]' '[:lower:]')

prefix ?= ~/$(MACHTYPE)-$(OSTYPE)
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin
srcdir = .

INSTALL = install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

all: $(BINARY)

$(BINARY): date-with-ms.c
	$(CC) $< -o $@

install: all installdirs
	$(INSTALL_PROGRAM) $(BINARY) $(DESTDIR)$(bindir)/$(BINARY)

installdirs:
	mkdir -p $(DESTDIR)$(bindir)

uninstall:
	rm $(DESTDIR)$(bindir)/$(BINARY)

clean:
	$(DELETE) $(BINARY) $(OBJFILE) *~

.PHONY: all clean install installdirs
