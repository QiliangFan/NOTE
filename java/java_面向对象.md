# 1. 构造函数:

~~~java
public class Double{
    Double x, y;
    public Double(Double x, Double){  // 构造函数
        this.x = x;
        this.y = y;
    }
}
/*
* 通过new关键字调用
*构造器虽然有返回值但是不能定义返回值类型
*如果没有定义构造器, 编译器会自动添加一个午餐构造器
*构造器的方法名必须和类名一致
*/
~~~



# 2. 垃圾回收机制(Garbage Collection):

~~~properties
1. 引用计数 (循环引用问题)
2. 引用可达 
3. 分代垃圾回收机制(新生代, 年老代, 持久代)
~~~



#  3. this的本质



# 4. static 关键字:



# 5. 参数传递机制: "值传递"

~~~properties
1. 基本数据类型参数传递: 值拷贝一份穿进去

2. 引用数据类型参数传递: 地址拷贝一份传进去
~~~



# 6. 包机制 和 import:

~~~properties
1. 一般文件首行写 package <package name>

2. 不同包下的类需要通过 import导入, 或者写全限定类名

3. import java.lang.*;  // 导入 lang下所有的类, 不包括包
// 会降低编译速度, 不降低运行速度
// 重名时, 精确指定的导入优先于通过*导入的

4. import static java.lang.Math.*;  // 导入类下静态属性
~~~



# 7. 继承 和 instanceof

~~~properties
CLASS1 instanceof CLASS2
~~~



# 8. JavaBean: Getter 和 Setter



# 9. 多态(polymorphism)

~~~properties
1. 多态的三个必要条件: 继承, 方法重写, 父类引用指向子类对象
2. 多态是指方法的多态!! 和属性无关  : 这一点
~~~

~~~java
public class Constructor extends Child{
	int a=2;
	void print() {
		System.out.println("Constructor");
	}
	
	public static void main(String[] args) {
		Child child = new Constructor();
		System.out.println(child.a);
		child.print();
	}
}

class Child{
	int a = 1;
	
	void print() {
		System.out.println("Child");
	}
}
/*
* 1
* Constructor
*/
~~~



# 10. final

~~~properties
1. 修饰变量
2. 修饰方法
3. 修饰类
~~~



# 11. 数组

~~~properties
1.静态初始化:
int[] a = {1, 2, 3};

2.动态初始化
int[] a = new int[2];
a[0] = 1;

3. 默认初始化:
int[] a= new int[2]; //数组元素自动初始化为0
~~~



# 12. foreach

~~~java
for(String s: s_list){
    
}
~~~



# 13.抽象类:

~~~java
abstract class test{
    void print();  //抽象类的方法可以不需要实现
    // 包含抽象方法的类是抽象类
    
    void say(){  //抽象类中可以有普通方法
        system.out.println("??");
    }
}
~~~



# 14. 接口:

~~~java
interface test{
    void func1();  //接口中方法不能有实现, 为抽象函数.
    
    default void func2(){  // default 关键字, 可以为接口中的函数提供方法默认实现
        
    }
}
~~~



# 15. 内部类:

### 1. 非静态内部类:(必须寄存在一个外部类对象中)



### 2.静态内部类



### 3. 匿名内部类:!!!!!

~~~java
new 父类/接口/抽象类 (){
    //类的实现
}
/*
*创建类对应的实现/子类
* 
!!! 闭包  =====================
~~~

