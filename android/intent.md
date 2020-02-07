# 1. intent:

~~~properties
Activity, Service和Broadcast Reciver之间通信的桥梁: intent
~~~

~~~properties
例如, 页面跳转时:
从一个Activity跳转到另一个Activity中:
1. 源Activity创建一个Intent
2. 源Activity调用startActivity
3. 源Activity传入Intent
4. 从Manifest文件中, 找到目标Activity
5. 目标Activity根据Intent的描述, 执行相应操作
~~~

~~~properties
例如: 启动Service
:发送广播
~~~

# 2. Intent对象的属性:

~~~properties
Componect name
Action
Data
Catagory
Extras
Flags
~~~

#### 1. Component name

~~~properties
setComponent(ComponentNameObj)
~~~

~~~java
ComponentName cn = new ComponentName("com.liang", "com.liang.MyActivity");
intent.setComponent(cn);
startActivity(intent);     //这样不用加目标Activity的类
~~~

#### 2. Action 和 Data

~~~properties
1. Action 属性
2. Data 属性: 不同action, data格式不同
~~~

~~~properties
eg:
ACTION_EDIT  -> content://com.android.contacts/contacts/1
ACTION_CALL -> tel:10086
ACTION_VIEW -> http://www.mingribook.com
~~~

~~~properties
1. 使用Intent实现拨打电话和发送短信:
~~~

~~~java
public void onClick(View v){
    Intent intent = new Intent();
    ImageButton imageBtn = (ImageButton)v;
    switch(imageBtn.getId()){
        case R.id.imageBtn_phone:
            intent.setAction(intent.ACTION_DIAL);
            intent.setData(Uri.parse("tel:04318497981"));
            startActivity(intent);
            break;
        case R.id.imageBtn_sms:
            intent.setAction(intent.ACTION_SENDTO);
            intent.setData(Uri.parse("smsto:04318497981"));
            intent.putExtras("sms_body", "Welcome");   //设置短信默认内容
            startActivity(intent);
            break;
    }
}
~~~

#### 3. Action 和 Category:

~~~properties
1. Action属性
2. Category 属性: 对执行动作的类别进行描述 
~~~

~~~http
用于调用android其他组件或执行其他行为
~~~

~~~java
// 关闭谷歌地图, 返回系统桌面
public void onClick(View v){
    Intent intent = new Intent();
    intent.setAction(intent.ACTION_MAIN);   //没有输入也没有输出的Activity
    // ACTION_MAIN 含义到底是什么? 
    intent.addCategory(intent.CATEGORY_HOME);   // activity的作用是返回主页
    startActivity(intent);
}
~~~

#### 4. Extras:

~~~properties
主要用于向inten中附加信息, 一般为键值对形式, 主要用于activity之间的数据交换
~~~

~~~http
putExtras()
getExtras()
// bundle对象
~~~

#### 5. Flags:

~~~http
指示app以什么方式启动另一个activity,
指示activity启动后如何处理
~~~

~~~java
// 启动一个activity
public void onClick(View v){
    Intent intent = new Intent();
	intent.setFlags(intent.FLAG_ACTIVITY_NO_HISTORY);  // 不保存在栈中, 用户离开后不在栈中保留
    startActivity(intent);
}
~~~

# 3. Intent种类:

#### 1. 显式Intent:

~~~java
Intent intent = new Intent(Context packageContext, Class<?> cls); //上下文对象,  目标activity类
// MainActivity.this,   DetailActivity.class
~~~



#### 2. 隐式Intent:

~~~properties
不直接指定activity, 由设置action, category, data等来启动activity的过程
~~~



# 4. Intent过滤器:

~~~properties
跳转activity时, 不直接指定, 而是通过过滤器过滤隐式intent, 能通过过滤器的组件, 则成为目标组件
~~~

~~~xml
<intent-filter>
	<action></action>
    <category></category>
	<data></data>
</intent-filter>
~~~

~~~http
以上过滤器支持了组件可以相应的动作, 或以哪种方式相应请求, 或者接收的数据
过滤器支持的操作, 一旦遇到隐式intent, 同时过滤器可以通过, 就能跳转到该activity
~~~

