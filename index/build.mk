outputs := README.md index.md
deps := \
	lang.md \
	lang.txt \
	../gists/README.txt \
	../gists/README.md \
	../pandoc/README.txt \
	../pandoc/README.md \

all: $(outputs)
clean:
	rm -f $(outputs)

index.md: README.md
%.md: %.txt
	perl ../bin/cat.pl $< | perl ../bin/fold.pl > $@
README.md: $(deps)
../gists/*:
	make -C ../gists -f build.mk
../pandoc/*:
	make -C ../pandoc -f build.mk
