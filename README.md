# snippets
Code fragments

`bin` 下面的 [`cat.pl`](bin/cat.pl) 就像 `cat` 这个指令一样，
它可以连接（合并）多个文件，但 `cat` 是横向地合并，`cat.pl` 是
纵向地合并。

使用方法为：

    // 递归地引入其它文件：(mnemonics/巧记法: `@` 象形为递归)

    @include <-=relative-path=

    // 原样地引入其它文件：(mnemonics: `%` **p**ercent/百分号 ---> **p**reserve/保留)

    %include <-=relative-path=

使用实例见 [`tutorial_cat.pl_.md`](tutorial_cat.pl_.md)
