# 1. VUE起步：

渐近式（随着项目规模的扩大，使用的模块可能有所不同）：

~~~http
申明式渲染  ->  组件系统  ->  客户端路由   ->  大规模状态管理 ->  构建工具
~~~

库（如jquery）将代码集成为一个产品，开发者来实现自己的功能

框架（如vue、react）向用户提供解决方案，开发者必须遵循框架规范

## 1. 插值表达式：{{ <内容>  }}  支持简单表达式和数据绑定

​	let v= new Vue({...})  //  Vue对象中的属性和方法都以$ 开头

~~~js
v.$el   //获取对应的绑定的对象
v.$data   //获取data对象，可以进一步取得数据值，但可以直接通过对象获取data中的数据值
v.$el.innerHTML //获取绑定对象的内部html对象，此处有坑！
~~~

~~~http
修改Vue对象绑定的对象，是通过虚拟dom对象，进行===异步=== 更新的。所以修改数据后立即获取innerHTML可能并不会立即获取最新数据。
如果想要获取修改后的innerHTML，可以这样：
v.$nextTick( ()=>{
	console.log(v.$el.innerHTML);
})    //可以看到异步结束后的结果
~~~

~~~js
v.$mount('#app')   //挂载函数，通过这个函数可以不必在初始化Vue对象时指定el，而通过挂载函数挂载
~~~

## 2. 绑定（v-bind    v-on...)

{绑定之后，src，class，style等属性的值也可以用表达式渲染}

### 1. v-bind :  绑定属性

~~~html
<img v-bind:src='imgUrl'  v-bind:alt='name'   >
<script>
	new Vue({
        el:"...",
        data:{
            name:"...."
            imgUrl:"...."
        }
    })
</script>
~~~

~~~http
v-bind 的简写：     <img :src='imgUrl'  :alt='name'   >
v-bind 可以省略不写
注意，属性绑定只能有一个，但是属性绑定时并不会覆盖原生属性所赋予的值，而是添加。
<img   :src="...."   src='...'> 完全可以
{注意区分 ！}
~~~

~~~html
<!--绑定两个或以上的class-->
<img  :class="[h4class,  h4wclass]">
<!--动态修改属性值，为true时才渲染，注意，连true，false也可以通过绑定来动态修改-->
<img :class="[{h4class:true}，h4wclass]">
<!--使用三元表达式添加属性值-->
<img  :class="[h4Flag? h4class:h4wclass,  Flag?'red' :  '']">
<!--使用逻辑运算动态修改内容-->
<img  :class="[   h4Flag  && 'red']">    当h4Flag 为true时 red  类才会被渲染
<!--动态设置style-->
<!--将样式写为     对象   的形式-->
<img   :style="{width:imgWIdth, border:10px, heith:myHeight}">
<img   :style="[{width:imgWIdth}, imgStyle,  {height:myHeight}]">
~~~

### 2. v-on 绑定事件

需要绑定的事件都在Vue对象的methods 属性中定义

~~~javascript
new Vue({
    methods:{
        handleClick(num){
            ...
        },
           handleOthers(){
               
           } 
    }
})
~~~

~~~html
<button v-on:click="handleClick(num,  $event)">    如果无参数写不写括号都无所谓
    		如果自己指定了参数，就不能再在函数里使用event了，这时要自己传入事件对象，用$event
</button>
~~~

~~~http
v-on 的简写：
<button  @click="handleClick"></button>

创建的方法之所以要放在methods中，是因为这样，定义的方法的this才Vue对象。否则为window
~~~

## 2. 条件、循环渲染：

### 1. v-if 

~~~html
<div  v-if="true">
    <!--if的内容为true时显示-->
</div>
<div  v-if = "canSee"><!--也可以用变量--></div>
<div  v-else-if="canSee2"></div>
<div v-else></div>   <!--注意，if、else-if和else中间不能间隔普通标签！-->
~~~

### 2. <template></template> 标签

~~~html
<!--当需要批量条件渲染时，最好不要 使用html原生dom，开支太大，而是用vue的虚拟组件-->
<template v-if="canSee">
    <span></span>
    <span></span>
</template>
<!--这样操作大量的dom元素时，开销也会部分减小，同时template并不会显示在页面中，因为他并不是html标签。他是一个虚拟的-->
~~~

### 3.  v-show : 控制元素的显示和隐藏（注意与v-if的区别）

~~~html
<span v-show="canSee"></span>
<!--v-show  和  v-if的区别在于，v-show 只是将元素style的display设置为none，而v-if则是将dom元素移除和生成，开销更大-->
<!---由于template标签是虚拟dom，没有style等属性，v-show 对template没有任何作用  -->
~~~

### 4. v-for 循环：

~~~html
<ul>
    <li  v-for = "item   in    arr">{{ item  }}</li>
</ul>
<ul>
    <li v-for="(item,index) in arr">{{item}}+{{index}}</li>
</ul>     
<ul>
    <li v-for="(key,value)  in  obj"></li>
</ul>
 <ul>
     <li v-for="item  in  10"></li>
</ul>
  <ul>
      <li v-for="item  in  'liangliang'"></li>
</ul>
<!--index 从0 开始-->
<!--也可以遍历对象中的属性值，一个参数时只取value-->
<!--可以对数字遍历，是从1到当前数字-->
<!--可以对字符串进行遍历-->
~~~

~~~html
<!--使用key的v-for  , 即给每个迭代的节点取名字-->
<ul>
    <li v-for="item  in  'liangliang'"  :key="item"></li>
</ul>
<!--使用 key设置名字后，vue会根据节点的key判断是否需要做更多操作。提高效率-->
<!--key 值相同的组件会被复用（包括其中的style和alue等属性值），这有时会有用。-->
~~~

~~~http
！！！！坑：
不能通过索引的方式修改数组个数、不能通过更改长度的方式修改数组，
上面这些操作不会使页面重新渲染。
而通过方法来修改时，则可以实现实时渲染，因为有些方法被vue重写了，称为变异方法。
数组变异方法有：
pop |    shift   |   unshift   |   splice  |  sort  |   reverse  | push 
但是支持通过索引，点运算符修改值的渲染++++++
！！！为对象添加属性怎么办？
this.$set(this.obj, 'salary',1000)     // 第一个是要修改的对象，第二个是要添加的属性，第三个是属性的值, 只能在vue对象中使用
this.$delete  则用来删除元素
这个方法还能用来为数组添加元素，只不过多用于对象中
~~~

~~~javascript
// 实现变异函数的简单原理：
const  data ={
    obj:{
        a:1,  b:2
    }
}

Object.defineProperty(data, 'obj',{
    get(){
        console.log("get function");//需要在对象返回值前进行操作，都可重写get方法
        return data.obj;
    },
    set(newValue){
        data.obj=newValue;
    		// 想要对象修改值时做些操作也可以在这里重写set方法
    }
})
// 即通过set，get方法增删对象属性和数组元素时，检测不到的，修改值是可以检测到的。
~~~

~~~javascript
// 再重写变异方法
const oldPushFn = Array.prototype.push;
Array.prototype.push = function(){
    oldPushFn.call(this, ... arguments);
  	//  自己的操作
}

const arrayProtp = Array.prototype;
const arrayMethods = Object.create(arrayProtp);
['shift','unshift','splice','sort','push','pop','reverse'].forEach(method=>{
    arrayMethods[method]=function(){
        arrayProto[method].call(this, ...arguments);  //这里是es6 的语法，使用...将参数作为一个数组，不加是作为一个数组对象
       //自己想要的操作
    }
})
~~~

