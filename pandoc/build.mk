outputs := \
	dst/1.test-ascii-off.html \
	dst/1.test-ascii-on.html \
	dst/2.test-east_asian_line_breaks-off.html \
	dst/2.test-east_asian_line_breaks-on.html \

all: $(outputs) README.md
clean:
	rm -f $(outputs) README.md

dst/1.test-ascii-off.html: res/simplest.md
	pandoc $< -o $@
dst/1.test-ascii-on.html: res/simplest.md
	pandoc --ascii $< -o $@
dst/2.test-east_asian_line_breaks-off.html: res/east_asian_line_breaks.md
	pandoc -f markdown $< -o $@
dst/2.test-east_asian_line_breaks-on.html: res/east_asian_line_breaks.md
	pandoc -f markdown+east_asian_line_breaks $< -o $@

README.md: README.txt $(wildcard res/* src/*)
	perl ../bin/cat.pl $< > $@
