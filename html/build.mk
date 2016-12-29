all: $(outputs) README.md

README.md: README.txt
	perl ../bin/cat.pl $< > $@
