<center><h1>传统前段和Vue前端区别</h1></center>

1. 从b/s, 服务端代码混合在页面中; 现在是c/s 前后端分离
2. 从.html到.vue文件

3. 从一个html大节点 到template, script, style三个一级节点
4. 从script scr, link href 引入外部js和css, 到:

~~~vue
<script>
	var util = require('../../common/util.js');
	import * as echarts from '/components/echarts/echarts.simple.min.js';
</script>
<style>
	@import "./common/uni.css"
        <!--全局样式, 在根目录的app.vue里写入, 每个页面都会加载app.vue的样式 -->
</style>
~~~

5. vue支持组件导入, 同时也可以全局导入组件:

~~~vue
// 根目录的 main.js下
import pageHead from './components/page-head.vue'
Vue.component('page-head', pageHead)
~~~

6. css选择器的两个变化 , \* 不支持, body没有了改为page
7. rpx 可以全端支持

8. uni-app的路由都是在page.json中配置的
9. 