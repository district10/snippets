简要介绍一下 pandoc 的一些常用设置。

### Notes on pandoc arguments/options

#### option: `--ascii`

加了后所有字符都用 HTML Entity 来表示，所以整个文件是只有 ascii 字符的。

解决了【如果你的 html 页面没有设定字符编码，可能会显示乱码】的问题，
但对 SEO 不友好，因为有些爬虫不会解析这些 hex 字符。

-   源码：

    ```md
    %include <-=res/simplest.md=
    ```

-   without `--ascii`

    ```html
    %include <-=dst/1.test-ascii-off.html=
    ```

-   with `--ascii`

    ```html
    %include <-=dst/1.test-ascii-on.html=
    ```

#### plugin: `+east_asian_line_breaks`

-   源码：

    ```md
    %include <-=res/east_asian_line_breaks.md=
    ```

-   无此 plugin

    ```html
    %include <-=dst/2.test-east_asian_line_breaks-off.html=
    ```

-   有此 plugin

    ```html
    %include <-=dst/2.test-east_asian_line_breaks-on.html=
    ```
