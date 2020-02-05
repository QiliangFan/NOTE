### 1. 进度条: ProgressBar

~~~properties
# 默认圆形的
style="...."     # 没有android: 前缀!

# style 属性值
# 主题属性:
?android:attr/progressBarStyleHorizontal
?android:attr/progressBarStyleSmall
?android:attr/progressBarStyleLarge

# 样式资源
@android:stlyle/Widget.ProgressBar.Horizontal
@android:style/Widget.ProgressBar.Large
@android:style/WIdget.ProgressBar.Small
~~~

~~~properties
android:max="100"  // 100% 
android:progress="42"   //当前进度
~~~

~~~java
//进度监听
progressBar = (ProgressBar) findViewById(R.id.progressbar);
mHandler = new Handler(){
    @override
    public void handleMessage(Message msg){
        ...
    }
}
new Thread(new Runnable(){
    @override
    public void run(){
        whlie(ture){
            mProgress = doWork();
            if(mProgress < 100){
                m.what = 0x111;
                mHandler.sendMessage(m);
            }else{
                m.what = 0x110;
                ...
            }
        }
    }
})
~~~

### 2.拖动条:SeekBar

~~~http
进度条的子类
~~~

~~~properties
android:thumb="..."   # 拖动条圆点的样式
~~~

~~~properties
sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
		...  //三个方法
})
~~~

### 3. 星级评分条: RatingBar

~~~properties
android:numStar="6"   // 显示不下不会显示出来
android:rating="2"	// 当前的点亮星星
android:stepSize="1"   // 1颗颗的选, 默认0.5
android:isIndicator="true"  // 不可改变值
~~~

~~~java
rb.getRating();
~~~

### 4. 图像视图:ImageView

~~~properties
android:src="..."
android:scaleType=""    // 显示图片时的缩放类型

# 设置最大宽度高度, , 也可以用于使得图片和ImageView同等大小
android:adjustViewBounds="true"
android:maxWidth="..."
android:maxHeight="..."
~~~





