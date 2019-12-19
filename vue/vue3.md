# 认识组件：

1. 全局组件 
2. 局部组件

# 1. 定义全局组件：

~~~javascript
Vue.component('helloWorld',{
    template:`  (这不是引号)
	<div>
		<span>hello  world!</span>
	</div>
`
})
//注意，组件名字可为驼峰或-连接： helloWorld   或  hello-world
// 在html页面中使用时都是<hello-world></hello-world>  因为html元素不允许出现大写字符，都会变为小写
~~~

组件的数据：

~~~javascript
Vue.component('helloWorld',{
    data(){
        return {
            msg：'hello world',
        }
    },w
    template:`
	<div>
		<span>hello!</span>
	</div>
`
})
//组件中的数据不再是对象，而需要通过函数返回一个对象
//因为组件在页面中可能被反复使用，避免数据之间的污染，每个组件都要生成新的数据
//在Vue对象中能写的，在component中基本也能写，只是data因为复用的原因需要通过函数返回而不同
// 事实上，在component中也不对对象类型的data进行解析
// methods   watch  computed 都能写！
~~~

# 2.定义局部组件

写在组件内部：(但注意名字是components，多了个s)

~~~javascript
const vm = new Vue({
    el:"#app",
    data:{
        
    },
    components:{
        'hello':{
            template:`...`
        }
    }
})
~~~

# 3. 组件数据传递和数据校验

~~~javascript
const vm = new Vue({
    el:"#app",
    data:{
        title:'helo！',
        content:'emmmmm,this  is content!',
    },
    components:{
        'hello':{
            template:`...`
        },
        myContent:{
            //props:[ 'title','content' ],   //注册要使用的属性，否则即使传入了，component也不认得
            props:{
                title:{
                    type:string,
                    default:  '这是默认值',// 当未传入值时，使用默认值
                },
                content:{
                    type:number,
                    required：true，   //要求该属性必须传入
                    validator (value){
                		if(...)  return true;
            			else  return false;
           			 }   //对属性值进行校验，会抛出警告
                },
            },   //不仅注册属性，而且还对组件的类型等进行要求，这些要求只会抛出警告，并不会报错和影响渲染
            template:`
				<div>
					<h4>{{  title  }}</h4>
					<p>{{ content  }}</p>
				</div>
			`
        }
    }
})
~~~

~~~html
<div  id="app">
    <my-content  :title='title'   :content="content"></my-content>
</div>
~~~

打包数据进行传递：

~~~html
<div  id="app">
    <my-content   v-bind="obj"></my-content>   //直接将对象打包传入，对象中的数据就是组件需要的数据
</div>
<script>
	new Vue({
        el:"#app",
        data:{
        		obj:{
                    title:"....",
                    content:"....."
                }
    }
    })
</script>

~~~

~~~http
通常不推荐在组件内修改传入的属性的值， 这会对原数据造成影响。
解决办法：
1.  组件内部定义data函数，返回数据对象，注意数据对象中属性名字不要与传入的属性重复，这样可以避免对元数据造成影响。而data函数中属性的值，直接从props中取。
2. 对于要传入组件内的数据，我们将其定义为computed，这样就不会互相干扰
~~~

# 4. 子组件向父组件传送信息

当使用上述方法将父组件传入子组件的数据被解耦后，我们有时也希望子组件能够对副组件的数据有一定的影响。

~~~html
<div  id="app">
    <my-content   v-bind="obj"   @add="handlAdd"></my-content>
</div>
<script>
	vm = new Vue({
        el:"#app",
        data:{.},
        components:{
            myContent:{
                ...
                methods:{
                    handleClick(){
                        this.otitle = 'aaa';
                        this.$emit('add');   //发送一个事件，这个事件的名字取作add
                        //$emit 函数第一个参数是事件名称，此后的参数都是这个事件接受函数的参数
                    }
                }
            }，
            methods:{
            handleAdd(){
        		this.title='aaaa',
        	....// 父组件通过监听子组件发送的事件，进行相应操作
    }
        }
        }
    })
</script>
//  注意， 父子组件数据的解耦不是必须的，有时这种耦合也是有用的！
~~~

