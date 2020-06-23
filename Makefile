BINARY=date-with-ms

$(BINARY): date-with-ms.c
	$(CC) $< -o $@

# $SYSNAME is set in my shell config; it's where I put binaries I've
# built myself.
install: $(BINARY)
	mkdir -p ~/${SYSNAME}/bin
	cp $< ~/${SYSNAME}/bin

clean:
	rm -f $(BINARY) *~

.PHONY: clean install

