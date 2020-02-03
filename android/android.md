# 1. 项目结构:

~~~properties
1.  manifests 配置文件夹
	AndroidManifest.xml: 配置项目中应用的activity
2. java 源码
3. res 资源和布局文件
	drawable: 位图文件, xml资源文件, 9-Patch文件
	layout: 存储布局文件
	mipmap: 由多个子目录组成, 保存不同分辨率对应的图标文件
	values: 保存字符串资源, 尺寸变量资源, 颜色资源
~~~

~~~properties
# 入口 activity的配置:
<activity android:name=".MainACtivity">
	<intent-filter>
		<action android:name = "android.intent.action.MAIN"/>
		
		<category android:name="android.intent.category.LAUNCHER"/>
	</intent-filter>
</activity>
~~~

~~~properties
R文件 是安卓开发中特殊文件, 可以对资源文件进行索引
~~~

~~~properties
向mipmap中加入图片:
1. 9-patch图片和Shape资源文件只能放在drawable目录中
2. 需要适应屏幕分辨率的图片推荐放在mipmap中,提高显示性能, 占用内存少
~~~

