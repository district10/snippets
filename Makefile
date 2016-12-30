.PHONY: pandoc html test

outputs := tutorial_cat.pl_.md

all: pandoc html test $(outputs)
clean:
	rm README.md
	make -C html -f build.mk clean
	make -C test -f build.mk clean
	make -C pandoc -f build.mk clean

pandoc:
	make -C pandoc -f build.mk
html:	
	make -C html -f build.mk
test:	
	make -C test -f build.mk
gh:
	git add -A; git commit -m "`date`"; git push

%.md: %.txt
	perl bin/cat.pl $< > $@
