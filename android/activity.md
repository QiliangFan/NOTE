# 1. Activity的四种状态:

1. 运行状态



2. 暂停状态



3. 停止状态



4. 销毁状态

# 2. Activity的声明周期:

1. onCreate
2. onStart
3. onResume
4. onPause
5. onStop
6. onDestroy
7. onRestart

# 3. LogCat

~~~properties
Log.i("....")  // 在logcat中看输出
~~~

# 4. 创建,启动和关闭Activity

#### 1.创建Activity:

1. 创建继承自Activity的Activity
2. 重写需要的回调方法
3. 设置需要显示的视图: setContentView

#### 2.配置Activity:

~~~xml
<!-- 在manifests中配置activity-->
<!--在application标签中配置Activity子标签-->
<!--配置类名, 要加包名-->
<activity android:name=".MyActivity"    
				android:label="...">
</activity>
~~~

#### 3.启动和关闭Activity:

~~~properties
1. 作为入口Activity
<activity android:name=".MyActivity"    
				android:label="...">
				<intent-filter>  # activity 通过intent表达自己的意图 
					<action android:name="android.intent.action.MAIN"/>
					<category android:name="android.intent.category.LAUNCHER"/>
				</intent-filter>
</activity>
~~~

~~~properties
2. startActity()
# 在其他activity中打开activity, 例如通过按钮跳转
public void Onclick(View view){
	Intent intent = new Intent(MainActivity.this, MyActivity.class); //第一个参数是上下文对象, 第二个参数是要启动的activity类
    startActivity(intent);
}
~~~

~~~properties
3. 关闭Activity()
public void OnClick(View view){
	finish();// 会返回调用它的activiy中, 若为主activity, 则退出app
}
~~~

#### 4. 刷新当前Activity:

~~~java
onCreate(null);
~~~

可以在onResume中加这一行, 每次恢复界面时都会刷新

# 5. 多个Activity的使用:

#### 1. 使用Bundle在activity之间交换数据:

~~~properties
在一个activity中启动另一个activity时, 必须要借助intent.
通过intent传递Bundle(存储键值对), 传递数据
~~~

~~~properties
1. 数据-> Bundle
putXXX()

2. Bundle -> Intent
putExtras()
~~~

~~~java
Intent intent = new Intent(MainActivity.this, MyActivity.class);
Bundle bundle = new Bundle();
bundle.putCharSequence("name", name);
intent.putExtras(bundle);
startActivity(intent);
##################################################################
 # MyActivity onCreate
  Intent intent = getIntent();
Bundle bundle = intent.getExtras();
String name = bundle.getString("name");
~~~

# 6. 调用另一个activity并返回结果:

~~~http
publci void startActivityForResult(Intent intent, int requestCode)
~~~

~~~properties
# 调用:
Intent intent = new Intent(MainActivity.this, MyActivity.class);
startActivityForResult(intent, 0x11);

# 返回:
Intent intent = getIntent();
Bundle bundle = new Bundle();
bundle.putInt("id", id);
intent.putExtras(bundle);
setResult(0x11, intent);  // 与请求码一致即可
finish();  //关闭activity

# 获取, 在 onActivityResult中
protected void onActivityResult(int requestCode, int resultCode, Intent data){
	super.onActivityResult(requestCode, resultCode, data);
	// 对请求码和返回码进行判断
	Bundle bundle = data.getExtras();
	// 获取数据
}

~~~