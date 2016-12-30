.PHONY: clean

all: README.md
clean:
	rm -f README.md

README.md: ../bin/cat.pl
	rm -f README.md

	@echo -e "cat.pl a.txt # TEST LOOP (a<-b, b<-a)\n"          >> README.md
	perl ../bin/cat.pl a.txt                                    >> README.md

	@echo -e "\n\ncat.pl c.txt # TEST MULTIPLE INCLUSIONS\n"    >> README.md
	perl ../bin/cat.pl c.txt                                    >> README.md

	@echo -e "\n\ncat.pl f.txt # TEST EXPAND/NOT\n"             >> README.md
	perl ../bin/cat.pl f.txt                                    >> README.md

	@echo -e "\n\ncat.pl g.txt # SELF INCLUSION\n"              >> README.md
	perl ../bin/cat.pl g.txt                                    >> README.md

	@echo -e "\n\ncat.pl h.txt # NO SUCH FILE\n"                >> README.md
	perl ../bin/cat.pl h.txt                                    >> README.md

	@echo -e "\n\ncat.pl i.txt # VERBATIM\n"                    >> README.md
	perl ../bin/cat.pl i.txt                                    >> README.md

	@echo -e "\n\ncat.pl j.txt # ABSOLUTE PATH\n"               >> README.md
	perl ../bin/cat.pl j.txt                                    >> README.md
