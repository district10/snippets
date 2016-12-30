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

    Error openning file: [./y.txt].

    h <- z (no such file to @)

    Error openning file: [./z.txt].

h.end


cat.pl i.txt # VERBATIM

i.txt

    reveal with @@include/%%include (verbatim)

    %include <-=a.txt=

    @include <-=a.txt=

i.end


cat.pl j.txt # ABSOLUTE PATH

j.txt

    C:\Windows\System32\winrm.cmd (works on windows)

    @echo off
    IF EXIST %SystemRoot%\system32\cscript.exe (
        @cscript //nologo "%~dpn0.vbs" %*
    ) ELSE (
        echo.
        echo WinRM command line is not available on this system.
        exit /B 1
    )
    

    C:/Windows/System32/winrm.cmd (works on windows)

    @echo off
    IF EXIST %SystemRoot%\system32\cscript.exe (
        @cscript //nologo "%~dpn0.vbs" %*
    ) ELSE (
        echo.
        echo WinRM command line is not available on this system.
        exit /B 1
    )
    

    C:\\Windows\\System32\\winrm.cmd (works on windows)

    @echo off
    IF EXIST %SystemRoot%\system32\cscript.exe (
        @cscript //nologo "%~dpn0.vbs" %*
    ) ELSE (
        echo.
        echo WinRM command line is not available on this system.
        exit /B 1
    )
    

    Error openning file: [/etc/issue].

j.end
