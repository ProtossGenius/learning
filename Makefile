##Tail
debug:

qrun:

test:

install: #rely
	smdcatalog
clean:

rely: # if smdcatalog not exist.
	go install github.com/ProtossGenius/smntools/cmd/smdcatalog@latest
