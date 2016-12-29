---
title: Code Snippets of TZX
---

# Snippets

## Pandoc

## Pandoc Usages

-   `--ascii`

    :   源码：

        ```md
        这是一个 Markdown 文档。你通过可以**加粗**，*斜体*来调整格式。
        ```

        without `--ascii`

        ```html
        <p>这是一个 Markdown 文档。你通过可以<strong>加粗</strong>，<em>斜体</em>来调整格式。</p>
        ```

        （这对 SEO 不友好，因为有些爬虫不会解析这些 hex 字符。）

        with `--ascii` on

        ```html
        <p>&#36825;&#26159;&#19968;&#20010; Markdown &#25991;&#26723;&#12290;&#20320;&#36890;&#36807;&#21487;&#20197;<strong>&#21152;&#31895;</strong>&#65292;<em>&#26012;&#20307;</em>&#26469;&#35843;&#25972;&#26684;&#24335;&#12290;</p>
        ```

        （如果你的 html 页面没有设定字符编码，可能会显示乱码。）