gists_in := $(wildcard gists/*.txt)
gists := $(gists_in:%.txt=%.md)
outputs := gists.md lang.md

all: $(gists) $(outputs)
clean:
	rm -f $(gists) $(outputs)
gists.md: $(wildcard gists/*.md gists/*.txt)
%.md: %.txt
	perl ../bin/cat.pl $< | perl ../bin/fold.pl > $@
