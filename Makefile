.PHONY: pandoc html

bin := bin/cat.pl bin/md2html.jar

all: $(bin) README.md pandoc html publish
clean:
	rm -f publish README.md
	make -C html -f build.mk clean
	make -C pandoc -f build.mk clean
pandoc:
	make -C pandoc -f build.mk
html:	
	make -C html -f build.mk
publish: Makefile $(wildcard html/* html/*/*) bin/md2html.jar
	java -jar bin/md2html.jar -i html -o publish -f
%.md: %.txt
	perl bin/cat.pl $< > $@
bin/cat.pl: ../cat/bin/cat.pl
	@mkdir -p $(@D)
	cp $< $@ || wget https://raw.githubusercontent.com/district10/cat/master/bin/cat.pl -O $@
bin/md2html.jar: ../md2html/target/md2html.jar
	@mkdir -p $(@D)
	cp $< $@ || wget http://whudoc.qiniudn.com/java/md2html/md2html.jar -O $@
	rm -rf publish
gh:
	git add -A; git commit -m "`date`"; git push
