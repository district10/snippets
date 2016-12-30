.PHONY:

all: README.md
clean:
	rm -f README.md

README.md:
	rm -f README.md

	@echo -e "\n\ncat.pl a.txt # TEST LOOP (a<-b, b<-a)"	>> README.md
	perl ../bin/cat.pl a.txt								>> README.md

	@echo -e "\n\ncat.pl c.txt # TEST MULTIPLE INCLUSIONS"	>> README.md
	perl ../bin/cat.pl c.txt								>> README.md

	@echo -e "\n\ncat.pl f.txt # TEST EXPAND/NOT"			>> README.md
	perl ../bin/cat.pl f.txt								>> README.md

	@echo -e "\n\ncat.pl g.txt # SELF INCLUSION"			>> README.md
	perl ../bin/cat.pl g.txt								>> README.md
