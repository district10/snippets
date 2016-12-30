

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
