outputs := \
	dst/1.test-ascii-on.html \
	dst/1.test-ascii-off.html \

all: $(outputs) README.md

dst/1.test-ascii-off.html: res/simplest.md
	pandoc $< -o $@
dst/1.test-ascii-on.html: res/simplest.md
	pandoc --ascii $< -o $@

README.md: README.txt $(wildcard res/* src/*)
	perl ../bin/cat.pl $< > $@
