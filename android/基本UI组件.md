~~~properties
1. 文本类组件
2. 按钮类组件
3. 日期时间类组件
~~~

# 1. 文本框组件:

#### 1. TextView:

~~~properties
android:layout_width="wrap_content"
android:layout_height="wrap_content"
android:text="blabla"
android:textSize="25sp"   //sp 是推荐的设置字号的单位
android:textColor="#ffffff"
andrroid:singleLine="true"  //设置后溢出的字会用省略号代替
android:maxWidth="160dp"  //文本自动换行
android:background=...		//设置文本框背景
~~~

#### 2. EditText:

~~~properties
android:layout_width="wrap_content"
android:layout_height="wrap_content"
android:hint="提示文字"
android:inputType="textPassword"  // 还有date, number类型等等

android:drawableLeft="@mipmap/mr"  // 编辑框左边的图片
android:drawableStart   // 新的推荐使用
android:drawableBottom
android:drawableEnd
android:drawableRight
android:drawableTop

android:drawablePadding			// 用 dp, 图片和编辑框的间距

android:lines="5"   //超过这个行数, 将进行滚动, 是最多显示的行数
~~~

~~~properties
# 获取文本内容:
EditText et = (EditText)findViewById(R.id.myet);
String content = et.getText();
~~~

# 2. 按钮类组件:

####  1.Button(TextView的子类)

~~~properties
android:text=".."
...
~~~

~~~properties
# 设置事件监听器:
Button btn = (Button)findViewById(R.id.btnid);

# 1. 匿名内部类方式:
btn.setOnClickListener(new View.onClickListener(){
	
	@override
	public void onClick(VIew v){
		Toast.makeText(MainActivity.this, "单击了按钮", Toast.LENGTH_SHORT).show(); // 弹出消息提示框
	}
})

# 2. 通过onclick属性:
public void myClick(View view){  // 在activity中编写
		// do something
}
...

andoird:onClick="myClick"
~~~

#### 2. ImageButton

~~~properties
android:src="..."
android:background=""  // 默认背景是灰色
~~~

#### 3.RadioButton:

~~~properties
android:text=""   //单选按钮旁边的说明文字
android:checked="true"  // 选中状态
~~~

~~~properties
# 单选按钮成组:
<RadioGroup>
	<RadioButton>
	...
	</RadioButton>
	...
</RadioGroup>
~~~

~~~properties
# 获取单选按钮组的值
1. 改变值时获取:
RadioGroup rg = (RadioGroup)findViewById(R.id.rg);
rg.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener(){
	@override
	public void onCheckedChanged(RadioGroup group, int checkId){
		RadioButton r = (RadioButton)findViewById(checkId);
		r.getText();   // 选中的单选按钮的值
		Toast.makeText(MainActivity.this, "改变了", Toast.LENGTH_SHORT).show();
	}
})
2. 提交表单时获取:
Button btn = (Button)findViewById(R.id.btn);
btn.setOnClickListener(new View.OnClickListener(){
	@override
	public void onClick(View v){
		for(int i =0; i <rg.getChildCount(); i++){  //注意rg要定义为全局变量,或者是final局部变量!
			RadioButton rb = (RadioButton)rg.getChildAt(i);
			if( rb.isChecked() ){
				....
			}
		}
	}
})
~~~

#### 4. CheckBox

~~~properties
android:text="..."
android:checked="true"
~~~

~~~properties
# 复选框组
<CheckBox>
...
</CheckBox>
<CheckBox>
...
</CheckBox>
~~~

~~~properties
# 获取复选框组的值, 需要为每一个复选框添加一个事件监听器
1. 事件监听器:
cb.setCheckedChangeListener(new CompoundButton.OnCheckedChangeListener(){
	@override
	public void onCheckedChanged(CompoundButton buttonView, boolean isChecked){
		if(cb.isChecked()){
			cb.getText();
		}
	}
})

~~~

# 3. 日期事件类

#### 1. DatePicker

~~~properties
datePicker.init(year, month, day, new DatePicker.OnDateChangedListener(){
	@override
	public void onDateChanged(DatePicker view, int year, int month, int dayOfmonth){   // 监听器
		MainActivity.this.year=year;  //这样就可以将值获取到了!
	}
})
~~~

#### 2.TimePicker

~~~properties
# 默认12进制
tp.setIs24Hour(true);
~~~

#### 3. Chronometer