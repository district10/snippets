outputs :=

all: $(outputs) README.md
clean:
	rm -f $(outputs) README.md

README.md: README.txt
	perl ../bin/cat.pl $< > $@
