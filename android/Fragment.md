# 1. Fragment的生命周期



# 2. 创建Fragment

~~~ java
public class ListFragment extends Fragment{
    
    public View onCreateView(...){
        View view = inflater.inflate(R.layout.fragment_list, container, false);
        return view;
    }
}
~~~



# 3. 在activity中添加Fragment

~~~xml
<!--在布局管理器中添加-->
<fragment
          ...
          android:name="com.ming.ListFragment"
          android:layout_weight="1">
	
</fragment>
<fragment
          ...
          android:name="com.ming.TFragment"
          android:layout_weight="1">
	
</fragment>
~~~

~~~java
// 在Activity运行时添加:
DetailFragment df = new DetailFragment();
FragmentTransaction ft = getFragmentManager().beginTransaction();
ft.add(anroid.R.id.content, df);  //第一个参数是添加到的目标中
ft.commit();
~~~

# 4. 实现微信的Tab切换

~~~properties
ft.replace(R.id.myfragment, f);  //替换fragment
~~~

