# 1. view:视图

1. View类位于android.view包中, View的子类一般位于android.widget包中

2. View类的常用属性:

~~~properties
android:id="@+id/user"  # 定义id时 @+id/... 是固定写法
android:background="@mipmap/bg"  // 设置背景为图片
android:background="#ffffff"
android:padding="16dp"   # 内边距
android:padding="@dimen/activity_margin"
android:paddingLeft 
android:paddingRight
android:paddingTop
android:paddingBottom
android:paddingStart
android:paddingEnd
~~~

~~~properties
资源引用时变量的使用:
1. res下mipmap中图片: @mipmap/<imgname>
2. values 中:
	以strings.xml为例:
	<resources>
		<string name="app_name">Happy_name</string>
	</resources>
等价于在res下穿件了一个string文件夹, 里面有个文件叫app_name
@string/app_name
如果app_name里面还有东西, @string/app_name.someth 来引用!
~~~

# 2. viewgroup(容器)

控制view如何摆放, 容纳其他组件, 是个抽象类, 常用其子类布局管理器

### 依赖两个重要的内部类:

~~~properties
# ViewGroup.LayoutParams
android:layout_width
android:layout_height
# 这两个属性提供了三个常量
1. FILL_PARENT: 长度与父容器一致
2. MATCH_PARENT: 长度与父容器一致
3. WRAP_CONTENT: 长度与自身一致
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
 当然也可以用dp
~~~

~~~properties
# ViewGroup.MarginLayoutParams
android:layout_marginTop
android:layout_marginBottom
android:layout_marginLeft   /  android:layout_marginStart (API17 以上才有)
android:layout_marginRight  /  android:layout_marginEnd  (同上)
~~~

# 3. 控制UI界面:

~~~properties
1. 使用XML布局文件控制UI界面 (推荐)
2. 在JAVA代码中控制UI界面
3. 使用XML和java代码控制UI界面
4. 开发自定义的View
~~~

### 1. 使用XML布局文件控制UI界面:

~~~properties
1. 在Android应用的res/layout目录下编写XML布局文件(布局文件名必须符合java标识符命名规则)
2. 在activity中使用java代码显示XML文件中的内容:
	setContentView(R.layout.activity_main);
~~~

### 2. 在java代码控制UI界面:

~~~properties
1. 创建布局管理器
2. 创建组件
3. 设置几何属性和外观
~~~

### 3.java和xml混合控制



### 4.自定义View组件