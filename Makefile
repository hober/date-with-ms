BINARY=date-with-ms.exe
OBJFILE=date-with-ms.obj
DELETE=del
COPY=copy
bindir=$(USERPROFILE)\amd64-windows_nt\bin\

all: $(BINARY)

clean:
	$(DELETE) $(BINARY) $(OBJFILE)

.c.exe:
	$(CC) $<

install: $(bindir)\$(BINARY)

$(bindir)\$(BINARY): $(BINARY)
	$(COPY) $(BINARY) $(bindir)
