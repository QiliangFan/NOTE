# 1. 注释:

~~~properties
1:行注释: //
2:多行注释: /*  */
3:文档注释: /**  */  , javadoc 元素: @param, @author
~~~

# 2. 标识符:

~~~shell
1. 以_ $ 字母 开头
2. 类名是大驼峰
3. 其他标识符是小驼峰
~~~

# 3. 变量类型:

~~~properties
1: 基本类型  引用类型
! 基本数据类型
! byte short int long float double char boolean
! 注意 自动装包 与 自动解包
! 注意 [-128, 127] 之间的Integer 对象是单例的
2:基本类型变量声明时是否有值 与 其在类中还是方法中有关.
{
	局部变量必须初始化!
	类中的变量会自动初始化(填 0)
}
3:引用类型声明时必定是没有值的(null)

~~~



# 4. 变量的分类:

~~~properties
1:局部变量
 必须初始化
~~~

~~~properties
2: 成员变量(实例变量, member variable)
~~~

~~~properties
3: 静态变量(类变量, static variable)
~~~

~~~properties
4: 常量(Constant): 一旦初始化后就不能再改变其值  <= 但声明与初始化可以分离
: 常量命名规范: MAX_VALUE
final String a;   // 符号常量(通过final 定义)
!! 常量替换: 编译时可以确定值的变量和 符号常量 编译时会进行常量替换(   所有引用该变量处!!  ) => 项目应当整体编译
String ab = "a" + "b"; // ab其实是一个常量
String ab2 = a + b; // 如果a 和 b是final类型则 ab2也是常量, 否则ab2为普通变量

! 整型常量默认为 int
! 浮点数常量默认为 double

字符常量 是 Unicode编码(2个字节)
~~~





# 5. 类加载和类的初始化顺序:

~~~properties
类加载: 当类第一次被初始化时, jvm中会生成class的描述元信息
1: 创建类的实例时
2: 访问类\接口的静态变量
3: 调用类的静态方法
4: 反射(Class.forName("com.lyj.load"))
5: 初始化一个类的子类
6: JVM启动时标明的类, 即与java文件名相同的类
~~~

~~~properties
类初始化顺序: (变量初始化与语句块)
: 父类静态变量初始化
: 父类静态static语句块
: 子类静态变量初始化
: 子类static语句块
: 父类普通成员初始化
: 父类初始化语句块
: 父类构造函数
: 子类普通成员初始化
: 子类初始化语句块
: 子类构造函数
~~~

~~~http
注意:
static语句块必须在静态变量定义之后, 否则会找不到变量定义.
初始化语句块和普通成员初始化的执行顺序和声明顺序有关, 
==> 
{
	a =1 
}
int a=2;
//这样找得到定义, a的值先为1, 再为2
~~~



# 6. 数值比较

(千万不要用浮点数来比较)

~~~properties
java.math 下有两个有用的包: BigDecimal BigInteger
~~~

~~~java
BigDecimal bd1 = BigDecimal.valueOf(0.2);
BigDecimal bd2 = BigDecimal.valueOf(0.22);
bd1.equals(bd2);
bd2.subtract(bd2);
~~~



# 7. 字符串连接符:

~~~properties
4 + "3" // 43
"3" + "3" // 33
//加号两边只要有一个字符串, 加号就变为字符串连接符, 两边的值被装包为String
// js 中会进行自动类型转化
~~~



# 8. 自动类型转化:

<font color="red">基本原则: 范围小的类型可以自动转化为范围大的类型</font>

byte -> short -> int -> long -> float -> double

char -> int



<font color="red">byte short int之间: 只要转化前后没有丢失信息, 可以进行任意的转化!!!</font>

注意: boolean不能自动转为其他类型



# 9. 使用Scanner获取键盘输入:

~~~java
import java.util.Scanner;

public class Test{
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        String line = scanner.nextLine();
        int age = scanner.nextInt();
        scanner.hasNext()
    }
}
~~~



# 10. 带标签的break 和 continue:

goto 是java中的保留字