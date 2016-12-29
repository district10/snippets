.PHONY: cat

cat:
	@rm -f README.md
	@echo cat.pl a.txt			>> README.md
	perl ../bin/cat.pl a.txt	>> README.md

	@echo cat.pl c.txt			>> README.md
	perl ../bin/cat.pl c.txt	>> README.md

