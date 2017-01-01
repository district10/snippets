### Notes on pandoc arguments/options

-   option: `--ascii` -<

    :   加了后所有字符都用 HTML Entity 来表示，所以整个文件是只有 ascii 字符的。

        解决了【如果你的 html 页面没有设定字符编码，可能会显示乱码】的问题，
        但对 SEO 不友好，因为有些爬虫不会解析这些 hex 字符。

        -   源码 +<

            :   ```md
                %include <-=res/simplest.txt=
                ```

        -   without `--ascii` +<

            :   ```html
                %include <-=dst/1.test-ascii-off.html=
                ```

        -   with `--ascii` +<

            :   ```html
                %include <-=dst/1.test-ascii-on.html=
                ```

        Notes：如果你的文档里有非 utf-8 字符，导致 pandoc 无法转换，可以用
        `iconv` 预先做转化，这是我之前评论过的一个 [Issue](https://github.com/jgm/pandoc/issues/1417)：

        I have bad bytes often too. It takes time to find where they are, but
        if you don't care about these bytes, just use `iconv` to strip all
        invalid char sequence:

        ```bash
        $ iconv -f utf-8 -t utf-8 -c input.md | pandoc -o output.html
        ```

        - `-f` is the source format
        - `-t` the target format
        - `-c` skips any invalid sequence

        See [linux - How to remove non UTF-8 characters from text file - Stack Overflow](http://stackoverflow.com/questions/12999651/how-to-remove-non-utf-8-characters-from-text-file).

        You can then `diff` to see where the bad bytes are:

        ```bash
        $ git diff --no-index --color-words <(iconv -f utf-8 -t utf-8 -c input.md) input.md
        ```

-   plugin: `+east_asian_line_breaks` -<

    :   中文和西文字符之间行合并的时候要加空格，但是中文之间是不加的。

        -   源码 -<

            :   ```md
                %include <-=res/east_asian_line_breaks.txt=
                ```

        -   无此 plugin -<

            :   ```html
                %include <-=dst/2.test-east_asian_line_breaks-off.html=
                ```

        -   有此 plugin -<

            :   ```html
                %include <-=dst/2.test-east_asian_line_breaks-on.html=
                ```
