outputs := README.md index.md

all: $(outputs)
clean:
	rm -f $(outputs)

index.md: README.md
%.md: %.txt
	perl ../bin/cat.pl $< | perl ../bin/fold.pl > $@
