Latex概念:
1. 编译器(如Xelatex-支持中文)
2. 宏包/软件包(如xeCJK中文包)
3. 编辑器/IDE(如TexStudio)
4. 发行版(编译器和软件包的集合, 如Text-live, MikTex, Ctex)

```shell
# 安装TexLive套件:
sudo apt install texlive-full

# 安装XeLatex编译引擎:
sudo apt install texlive-xetex

# 安装中文支持包(xeCJK)
sudo apt install texlive-lang-chinese

# 安装IDE
sudo apt install texstudio
```

```tex
\documentclass{article}

\usepackage{xeCJK} # 注意这一行

\begin{document}

hello,你好

\end{document}
```
