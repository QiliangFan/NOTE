# 1.Essentials
```tex
\documentclass[a4paper, 12pt]{article}
\begin{document}

\end{document}

\documentclass[UTF8]{ctexart} #中文排版的文章
```
```
1. The [\documentclass] command must appear at the start of every LATEX document.
2. The [article] document class is suitable for shorter documents.(Other document classes include report,proc,book, slides.
3. [a4paper]和[12pt]设定了纸张大小和字体大小 
```

```tex
\title{my title}
\author{my name}
\date{\today}
\maketitle
```
```
\maketitle命令用于创建标题,必须先指定标题是什么
如果没有指定date, 默认使用今天;author是可选的
```

```tex
# 这些都是 article 中的
\section{...}
\subsection{...}
\subsubsection{...}
\paragraph{...}
\subparagraph{...}	# 一般情况下默认为段落
```

```tex
\label{labelname}
\ref{labelname}			# 获取section num of the label
\pageref{labelname} 	# 获取page num of the label
```
```tex
\tableofcontents  # 显示目录,通常在title page之后
\pagenumberring{numstyle}   # 使用不同数字字体来标志页数
# 每次使用不同numstyle都会重新开始计算页数
\newpage  # 用于划分出新的一页
```