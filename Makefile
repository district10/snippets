.PHONY: pandoc html

all: pandoc html

pandoc:
	make -C pandoc -f build.mk
html:	
	make -C html -f build.mk
