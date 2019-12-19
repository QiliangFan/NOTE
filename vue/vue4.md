# 组件引用-ref

~~~html
<style>
    .square-box{
        ...
    }
</style>
<div  id="app">
    <square-change></square-change>
</div>
<script>
	const vm = new Vue({
        el:"#app",
        data:{
            
        },
        components:{
            squareChange:{
                data(){
                    ...
                },
                template:`
					<div>
							<button  v-for="color in colors"  :key='color'  
												:style="{background:color}"   @click='handleClick(color)'
												:data-color="color">{{color}} </button>
							<div  class="square-box"></div>
					</div>
					`,
                    methods:{
                        handleClick(mcolor){
									...	
                        	}
                    }
            }
        }
    });
</script>
~~~

~~~http
注意，在html中，标签属性可以自定义，data-xxxx，所有这些属性都会被保存在dataset中：
function  handleClick(e){   //当事件没有传入参数时，第一个就是事件本身
		const   color = e.target.dataset.color;   //从img的data-color中取值
		//注意html网页中不存在大写，全部都会转化为小写
}
~~~

为了更好的引用元素，vue中引入了  ref   ：

~~~html
<div   class="square-box"   ref='squareBox'>
     ....
</div>
~~~

~~~javascript
const  squareBox = this.$refs.squareBox;    //vue对象的$refs 中有所有vue对象内部的ref
~~~

~~~http
不仅html元素可以设置引用，而且组件也可以设置引用。
vue  中ref必须唯一，如果设置了多次，只有最后设置的ref有效
然而，如果使用vue的  v-for 循环生成对象时指定相同ref，则该ref指代的内容是数组！
！！！！坑
~~~

