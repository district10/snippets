outputs := README.md index.md

all: $(outputs)
clean:
	rm -f $(outputs)

index.md: README.md
%.md: %.txt
	perl ../bin/cat.pl $< | perl ../bin/fold.pl > $@
README.md: ../src/gists.txt ../src/lang.txt
../src/*.txt:
	make -C ../src -f build.mk
