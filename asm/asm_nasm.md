# 1. 基本要素:

1. 当调用一个系统调用后, 内核将会立即挂起当前程序.同时会调用相应driver(驱动硬件的'driver')去完成相应的系统调用.

2. 当调用系统调用时:

~~~properties
EAX: load the function number(operation code)(如1: sys_exit, 4:sys_write)
EBX ECX EDX 将会被当作参数传递进去
~~~

3. 变量段, 程序段

~~~assembly
SECTION .data  ;定义变量
; here is your variable

SECTION .text  ; all the code to be executed
global _start  ;to denote the programs entry point

_start:
	mov edx, 13
	; here is your code
	
	int 80h ; 系统中断
~~~

4. subroutines:

~~~properties
call: 调用子程序
ret: 从子程序返回
# 不用jmp的原因?    =>  stack, labels for returning are no more needed

call: 当'call'一个子程序时, 该子程序的地址被压入栈中
ret: 'ret'将会将子程序的地址从栈中弹出, 并返回之前代码处
~~~

5. passing arguments:

~~~properties
// 按照栈自顶向下的顺序
函数地址
参数1
...
参数n
参数个数
...
~~~

6. .bss section:

~~~properties
# section .BSS stands for Block Started by Symbol
# that is used to reserve space in memory for uninitialised variables
SECTION .bss
varName1:	RESB	1	;reserve space for 1 byte
varName2:	RESW	1	;reserve space for 1 word
varName3:	RESD	1	;reserve space for 1 double word
varName4:	RESQ	1	;reserve space for 1 double precision float(quad word)
varName5:	REST 	1	;reserve space for 1 extended precision float
~~~

7. 输入:

~~~assembly
EAX: sys_read->3
EDX: the maximum length (in bytes) of the space in memory
ECX: the address(var_name) of our variable created in the .bss section 
EBX: the file descriptor read from: STDIN-0
~~~

8. namespace: 

~~~assembly
# 每个local label 隶属于最近一个声明的global label
# 通过 g_label.l_label 引用
# 内部通过 .l_label 引用
~~~

