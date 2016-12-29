## Pandoc Usages

-   `--ascii`

    :   源码：

        ```md
        @include <-=res/simplest.md=
        ```

        without `--ascii`

        ```html
        @include <-=dst/1.test-ascii-off.html=
        ```

        （这对 SEO 不友好，因为有些爬虫不会解析这些 hex 字符。）

        with `--ascii` on

        ```html
        @include <-=dst/1.test-ascii-on.html=
        ```

        （如果你的 html 页面没有设定字符编码，可能会显示乱码。）
