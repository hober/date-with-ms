BINARY=date-with-ms
MACHTYPE = $(shell uname -m | tr '[:upper:]' '[:lower:]')
OSTYPE = $(shell uname -s | tr '[:upper:]' '[:lower:]')
PREFIX ?= ~/$(MACHTYPE)-$(OSTYPE)
EXEC_PREFIX ?= $(PREFIX)
BINDIR ?= $(EXEC_PREFIX)/bin

$(BINARY): date-with-ms.c
	$(CC) $< -o $@

install: $(BINARY)
	@mkdir -p $(BINDIR)
	cp $< $(BINDIR)

clean:
	rm -f $(BINARY) *~

.PHONY: clean install

