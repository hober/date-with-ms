BINARY=date-with-ms.exe
OBJFILE=date-with-ms.obj
DELETE=del
COPY=copy
bindir=$(USERPROFILE)\amd64-windows_nt\bin\

all: $(BINARY)

clean:
	$(DELETE) $(BINARY) $(OBJFILE)

ifdef MAKEINFO:
!ifndef MAKEINFO
# nmake-only section

.c.exe:
	$(CC) $<

install: $(bindir)\$(BINARY)

$(bindir)\$(BINARY): $(BINARY)
	$(COPY) $(BINARY) $(bindir)

!else
else
# gmake-only section

BINARY=date-with-ms
OBJFILE=

DELETE=rm

MACHTYPE = $(shell uname -m | tr '[:upper:]' '[:lower:]')
OSTYPE = $(shell uname -s | tr '[:upper:]' '[:lower:]')

prefix ?= ~/$(MACHTYPE)-$(OSTYPE)
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin
srcdir = .

INSTALL = install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

$(BINARY): date-with-ms.c
	$(CC) $< -o $@

install: all installdirs
	$(INSTALL_PROGRAM) $(BINARY) $(DESTDIR)$(bindir)/$(BINARY)

installdirs:
	mkdir -p $(DESTDIR)$(bindir)

uninstall:
	rm $(DESTDIR)$(bindir)/$(BINARY)

clean:
	rm -f $(BINARY) *~

.PHONY: all clean install installdirs

endif
!endif
