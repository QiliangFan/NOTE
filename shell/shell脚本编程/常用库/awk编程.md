~~~properties
进行awk编程时, 先输入awk指令, 然后输入带单引号的模式或动作, 最后输入文件名, 若未指定输入文件, 则使用键盘进行标准输入(stdin);
awk将以输入数据按行依次处理, 每一行通过"空格"或"Tab"隔开, 分隔为以$1开始的各个字段变量. $0就是这一行的值
~~~





#### 1. 模式匹配:

~~~shell
awk '亮' 1.txt # 输出包含'亮'字段的所有行
~~~



#### 2. 执行动作:

~~~shell
awk '{print $1, $2}' 1.txt  # 依次输出所有行第1和第2个字段的值, 逗号分隔参数,最后输出以空格分隔
~~~



#### 3. 输出:
~~~shell
$1 "is my name"  # 会自动拼接
awk '{print "today is " $1 " nextday is " $2 }'  # 合法的
# 即, 使用",", 输出时以空格分隔
# 不使用",", 则进行拼接
~~~

1. print
2. printf

~~~shell
awk '{printf "The name is %-20s Number is %4d\n", $1" "$2, $3}'  1.txt
~~~



#### 4. 从文件读取awk指令:

~~~shell
awk -f awkcommand.txt   1.txt
~~~

~~~properties
# 这是awkcommand.txt的内容
print $1, $2
~~~



#### 5. 记录和字段

~~~shell
print $0 # 该动作输出整行
print	# 该动作也默认输出整行
print NR # 输出该记录行号(记录的次序)
print NF # 输出该记录字段数
~~~



#### 6. 字段分隔符:

~~~shell
# 指定新的分隔符, 默认为空格或Tab
awk -F: '{print $0}' 1.txt
awk -F'[ :\t]' '{print $0}' 1.txt
~~~



#### 7. 模式

~~~shell
awk '$0 ~ /h l/{print $1}' # 检验某一行, 是否含有(~) "h l", /../表示正则表达式, 为真则执行动作
awk '$0 !~ /h l/{print $1}'  # 不匹配则为真
awk '$3 > 100{print $1}' # 检验某一行第3个字段是否大于100, 真则执行动作
~~~

~~~properties
# 对于正则表达式, awk除了支持标准的正则外, 还能使用POSIX字符类
[:alnum:] # 由字母数字组成的字符串
[:alpha:]	# 字母字符
[:blank:]	#空格, tab
[:cntrl:] # control字符
[:digit:] # 数字
[:graph:] #非空白字符
[:lower:] # 小写字母
[:space:] #空白字符
[:xdigit:] # 十六进制中的数字, 0-f 0-F
~~~



#### 8. 注释:

~~~properties
# 注释由#开头
~~~



#### 9. 重定向(文件名必须使用双引号)

~~~shell
awk -F: '$4 > 100{print $0 > "my_file"}' 1.txt
~~~



#### 10. 管道(下一管道的命令整体必须用双引号)

~~~shell
awk '{print $1 | "sort -r"}' 1.txt # 注意, awk程序如果要使用管道, 必须关闭awk之前使用的管道
awk '{print $1 | "sort -r"} END{close("sort -r")}' 1.txt
~~~



#### 11. if-else(和c语言一样)

~~~c
if(..){
    
}else{
    
}
~~~



#### 12. 循环:

~~~properties
while 和for 和c语言一样没有do-while,  awk中支持for-each: for(i in array_name){ ...}
~~~

~~~shell
# 数组
awk '{name[NR]=$1}END{for(i in name){print name[i]}}' 1.txt
# 注意shell中的foreach, 得到的都是索引!!!!!
~~~



#### 13. 逻辑控制:

~~~properties
if($1<1){
next 
}
# next作用是直接调到下一行进行读取, 重新执行脚本
~~~

~~~properties
# exit 可以退出awk, 但是不会略过END语句
exit(0);
~~~

