# 1. 双向绑定（视图与数据相互影响）

~~~html
<div id="app">
    <input type='text' :value="myText"  @input="handleInput">
    <span>{{ myText }}</span>
</div>
<!--如果不绑定事件，input与 myText绑定后，input怎么修改都不会影响vue对象中myText的值，只是一次绑定-->
<!--通过事件触发，实时修改vue对象中myText中的值，就可以实现数据双向绑定-->
然而这样也并不优美
~~~

~~~html
<div  id="app">
    <input  type="text" v-model="myText">
    <span>{{  myText }}</span>
</div>
<!--通过vue的语法糖  v-model ， 免去了自己写动态更新，从而实现了动态绑定-->
~~~

注意，双向绑定可以用在  input  textarea  checkbox 等中，其中效果略有差别，原理是一样的。

其中checkbox会构成数组， checkbox 如果只有一个，且值为ture/false时，点击会切换bool值(checkbox的value默认为true/false)

如果radio 和  checkbox 有多个，绑定的model的值 为组件value的值

对于select：

~~~html
<!--单选，是个字符串-->
<select  name="..."   id="..."  v-model="selected">
    <option value=""  disabled>清选择</option>
    <option  value="...">...</option>
    <option  value="...">...</option>
</select>

<!--按住ctrl可以多选，是个列表-->
<select name="...."  id = '...'  v-model="selectedlist"  multiple>
    <option value=""  disabled>清选择</option>
    <option  value="...">...</option>
    <option  value="...">...</option>
</select>
~~~



# 2.  计算属性和侦听器（代码复用以及数据关联）

！！！函数方法：

~~~html
<div id="app">
    {{ desc()  }}
</div>
<script>
    const  vm= new Vue({
        el:"#app",
        data:{
            name:"liangliang",
            age:18,
        },
        methods:{
            desc(){
                return "name: ${this.name}  ---  age::${this.age}";
            }
        }
    })
</script>
这样的缺陷在于，只要对应的vue对象的任何数据被修改了，页面都会重新渲染，函数都会被调用，这样效率必然低下。
~~~

！！！监听器（监听数据是否改变）

~~~javascript
const  vm = new Vue({
    el:"#app",
    data:{
        name:"lianglaing"
        looks:"??"
    },
    watch:{
        name(){
            //想要监听哪一个变量，就用对应的名字在watch中写一个监听器。
            // 函数体中写要进行处理操作
            this.looks=`${this.name}->${this.look}`  //随后looks可以跟随name动态变化
        }    
    }
}) //然而这样效率仍不是特别高
~~~

!!!!  计算属性  computed

~~~javascript
const  vm = new Vue({
    el:"#app",
    data:{
        name:"lianglaing"
        //looks:"??"
    },
    computed:{
        looks(){
            return `${this.name}->??`;   //相当于在data中创建了一个looks数据，且与name是动态关联的。可以直接引用looks！
        }   //只有当函数体中的数据被修改了才会调用该函数
    }
})
~~~

~~~http
查找顺序：
data
methods
computed
~~~

~~~http
注意，在使用字符串拼接时：
 return `${this.name}->??`;   
 那个不是引号，是esc的那个！这样才能使用${this.var}  来取值
~~~

