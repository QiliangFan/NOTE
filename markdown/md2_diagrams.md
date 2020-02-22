# 1. 时序图(语言: sequence)

#### 1. title: 表示序列图中的标题

#### 2. participant: 表示序列图中的对象

#### 3. note表示序列图中部分说明.

~~~properties
note left of: ...		# 左居中
note right of:...		# 右居中
note over:...			# 覆盖在当前对象的上方
~~~

#### 4. 箭头:

~~~properties
-> : 实线实箭头
_>: 虚线实箭头
->>: 实线虚箭头
_>>: 虚线虚箭头
~~~

#### 5. 换行: \n



# 2. 流程图(语言: flow)

#### 1. start, end: 流程图的开始与结束

#### 2. operation: 流程图中的处理块

#### 3. subroutine: 流程图中的子程序块

#### 4. condition: 表示流程图中的条件判断

#### 5. inputoutput: 流程图的输入输出

#### 6. right, left: 表示该流程图中当前模块下一箭头的指向(默认箭头指向下方)

#### 7. yes, no: 表示该流程图中条件判断的分支(默认yes向下, no向右, 可以和right同用)



```flow
sta=>start: 开始
e=>end: 结束
op=>operation: 操作（处理块）
sub=>subroutine: 子程序
cond=>condition: 是或者不是（条件判断）?
cond2=>condition: 第二个判断（条件判断）?
io=>inputoutput: 输出

sta->op->cond
cond(yes)->e
cond(no)->cond2
cond2(yes,right)->sub(right)->op
cond2(no)->io(left)->e
```
