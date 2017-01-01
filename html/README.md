---
title: Code Snippets of TZX
---

# Snippets

1.  Pandoc `@`{.fold}

    :   简要介绍一下 pandoc 的一些常用设置。

        ### Notes on pandoc arguments/options
        
        -   option: `--ascii` `@`{.fold}
        
            :   加了后所有字符都用 HTML Entity 来表示，所以整个文件是只有 ascii 字符的。
        
                解决了【如果你的 html 页面没有设定字符编码，可能会显示乱码】的问题，
                但对 SEO 不友好，因为有些爬虫不会解析这些 hex 字符。
        
                -   源码 `@`{.foldable}
        
                    :   ```md
                        这是一个 Markdown 文档。你通过可以**加粗**，*斜体*来调整格式。
                        ```
        
                -   without `--ascii` `@`{.foldable}
        
                    :   ```html
                        <p>这是一个 Markdown 文档。你通过可以<strong>加粗</strong>，<em>斜体</em>来调整格式。</p>
                        ```
        
                -   with `--ascii` `@`{.foldable}
        
                    :   ```html
                        <p>&#36825;&#26159;&#19968;&#20010; Markdown &#25991;&#26723;&#12290;&#20320;&#36890;&#36807;&#21487;&#20197;<strong>&#21152;&#31895;</strong>&#65292;<em>&#26012;&#20307;</em>&#26469;&#35843;&#25972;&#26684;&#24335;&#12290;</p>
                        ```
        
        -   plugin: `+east_asian_line_breaks` `@`{.fold}
        
            :   中文和西文字符之间行合并的时候要加空格，但是中文之间是不加的。
        
                -   源码 `@`{.fold}
        
                    :   ```md
                        我能吞下玻璃而不伤身体。
                        
                        我能吞下玻璃
                        而不伤身体。
                        ```
        
                    -   无此 plugin `@`{.fold}
        
                        :   ```html
                            <p>我能吞下玻璃而不伤身体。</p>
                            <p>我能吞下玻璃 而不伤身体。</p>
                            ```
        
                    -   有此 plugin `@`{.fold}
        
                        :   ```html
                            <p>我能吞下玻璃而不伤身体。</p>
                            <p>我能吞下玻璃而不伤身体。</p>
                            ```
