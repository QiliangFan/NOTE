# 脚手架工具：

1. 需要node.js 作为环境支撑

~~~shell
npm  uninstall vue-cli   -g   //卸载旧版本
npm    install  -g   @vue/cli   安装脚手架，生成项目
npm    install   -g    @vue/cli-service-global  快速原型开发，编译.vue文件, 用于编译单个文件，比上面的轻量
~~~

~~~vue
<template>
	<div>
        i  am  a  template
    </div>
</template>

<script>
	export  default{
        data(){
            return {
				msg:'....'	
            }
        }
    }
</script>
<style>
    div{
        background-color:red;
    }
</style>
~~~

