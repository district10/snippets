cat.pl a.txt
a.txt

    b.txt
    
        a.txt
        
            @include <-=b.txt=
        
        a.end
    
    b.end

a.end
cat.pl c.txt
c.txt

da.txt

e.txt

    nothing here in e.txt

e.end

da.end

c.end
