gists_in := $(wildcard src/*.txt)
gists := $(gists_in:%.txt=%.md)

all: $(gists) README.md
clean:
	rm -f $(gists) README.md
README.md: $(wildcard src/*.md src/*.txt)
%.md: %.txt
	perl ../bin/cat.pl $< | perl ../bin/fold.pl > $@
