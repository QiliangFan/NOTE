# 1. DDMS工具的使用:

#### 1. 打开DDMS:

~~~properties
1. 在android studio中打开:  android device monitor (现在已经不行了, 只能从sdk中打开)
2. 在sdk中打开  <sdk>/tools/monitor
~~~

#### 2. 日志查询



#### 3. 内存监测

~~~http
内存泄漏: 主动GC时, 如果应用的总内存使用大小不变小, 则很可能存在内存泄露
~~~



#### 4. 文件管理器:

~~~properties
可以方便的在模拟器(或真机)中移动文件(pull /  push)
~~~



#### 5. 模拟器控制:

~~~properties
:向模拟器拨打电话
:向模拟器发送短信
~~~



# 2. 输出日志信息:

~~~properties
Log类: android.util.Log
~~~

~~~java
// 提供的方法:
v();  //冗余日志, 黑色
d();  // 调试日志, 蓝色
i();	// 说明性日志, 绿色
w();	// 警告日志, 橙色
e();	// 错误日志, 红色
// 第一个参数是tag: 主要用于标识来源, String
// 第二个参数是具体描述: 相关的具体信息, String
~~~



