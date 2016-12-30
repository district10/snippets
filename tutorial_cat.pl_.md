比如有以下文件：

[`test/a.txt`](test/a.txt)

    a.txt
    
        a <- b
    
        @include <-=b.txt=
    
    a.end

[`test/b.txt`](test/b.txt)

    b.txt
    
        b <- a
    
        @include <-=a.txt=
    
    b.end

[`test/c.txt`](test/c.txt)

    c.txt
    
        c <- da
    
        @include <-=d/da.txt=
    
    c.end

[`test/d/da.txt`](test/d/da.txt)

    da.txt
    
        da <- e
    
        @include <-=../e.txt=
    
        da <- a
    
        @include <-=../a.txt=
    
    da.end

[`test/e.txt`](test/e.txt)

    e.txt
    
    (nothing here in e.txt)
    
    e.end

[`test/f.txt`](test/f.txt)

    f.txt
    
        f <- a (expand)
    
        @include <-=a.txt=
    
        f <- a (not expand)
    
        %include <-=a.txt=
    
    f.end

[`test/g.txt`](test/g.txt)

    g.txt
    
        g <- g (expand, won't work)
    
        @include <-=g.txt=
    
        g <- g (not expand)
    
        %include <-=g.txt=
    
    g.end

通过 Makefile（[`test/build.mk`](test/build.mk)]）：

```makefile
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
```

生成的 [`test/README.md`](test/README.md) 为：

    cat.pl a.txt # TEST LOOP (a<-b, b<-a)
    
    a.txt
    
        a <- b
    
        b.txt
        
            b <- a
        
            a.txt
            
                a <- b
            
                @include <-=b.txt=
            
            a.end
        
        b.end
    
    a.end
    
    
    cat.pl c.txt # TEST MULTIPLE INCLUSIONS
    
    c.txt
    
        c <- da
    
        da.txt
        
            da <- e
        
            e.txt
            
            (nothing here in e.txt)
            
            e.end
        
            da <- a
        
            a.txt
            
                a <- b
            
                b.txt
                
                    b <- a
                
                    a.txt
                    
                        a <- b
                    
                        @include <-=b.txt=
                    
                    a.end
                
                b.end
            
            a.end
        
        da.end
    
    c.end
    
    
    cat.pl f.txt # TEST EXPAND/NOT
    
    f.txt
    
        f <- a (expand)
    
        a.txt
        
            a <- b
        
            b.txt
            
                b <- a
            
                a.txt
                
                    a <- b
                
                    @include <-=b.txt=
                
                a.end
            
            b.end
        
        a.end
    
        f <- a (not expand)
    
        a.txt
        
            a <- b
        
            @include <-=b.txt=
        
        a.end
    
    f.end
    
    
    cat.pl g.txt # SELF INCLUSION
    
    g.txt
    
        g <- g (expand, won't work)
    
        g.txt
        
            g <- g (expand, won't work)
        
            @include <-=g.txt=
        
            g <- g (not expand)
        
            %include <-=g.txt=
        
        g.end
    
        g <- g (not expand)
    
        g.txt
        
            g <- g (expand, won't work)
        
            @include <-=g.txt=
        
            g <- g (not expand)
        
            %include <-=g.txt=
        
        g.end
    
    g.end
    
    
    cat.pl h.txt # NO SUCH FILE
    
    h.txt
    
        h <- y (no such file to %)
    
        Error openning file: [./y.txt.]
    
        h <- z (no such file to @)
    
        Error openning file: [z.txt.]
    
    h.end
    
    
    cat.pl i.txt # VERBATIM
    
    i.txt
    
        reveal with @@include/%%include (verbatim)
    
        %include <-=a.txt=
    
        @include <-=a.txt=
    
    i.end