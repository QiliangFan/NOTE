#### 网页整体变灰色
某些节日中可以发现网页整体变灰,可以发现如下:
(注意, webkit内核, moz内核前缀)
```css
html.gray{
	-webkit-filter:grayscale(100%); /*Chrome,Safari, Opera*/
	filter:grayscale(100%); /* 100是灰度最高 */
}
```
参考:
https://www.runoob.com/cssref/css3-pr-filter.html