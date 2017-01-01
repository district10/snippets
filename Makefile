.PHONY: pandoc gists index

bin := bin/cat.pl bin/md2html.jar

all: $(bin) README.md pandoc gists index publish
clean:
	rm -rf publish README.md
	make -C index -f build.mk clean
	make -C gists -f build.mk clean
	make -C pandoc -f build.mk clean
pandoc:
	make -C pandoc -f build.mk
index:
	make -C index -f build.mk
gists:	
	make -C gists -f build.mk
publish: Makefile $(wildcard index/* index/*/*) bin/md2html.jar
	java -jar bin/md2html.jar -i index -o publish
%.md: %.txt
	perl bin/cat.pl $< > $@
bin/cat.pl: 
	@mkdir -p $(@D)
	cp ../cat/bin/cat.pl $@ || wget https://raw.githubusercontent.com/district10/cat/master/bin/cat.pl -O $@
bin/md2html.jar: 
	@mkdir -p $(@D)
	cp ../md2html/target/md2html.jar $@ || wget http://whudoc.qiniudn.com/java/md2html/md2html.jar -O $@
	rm -rf publish
gh:
	git add -A; git commit -m "`date`"; git push
