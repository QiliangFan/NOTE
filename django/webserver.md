# 1. Installation

~~~shell
pip install gunicorn # python3
# 通过pip安装可以免去, 那个3的问题
~~~

~~~shell
# It is recommended that you use system packages to install Gunicorm except maybe when you want to use different versions of Gunicorn with virtualenv
sudo apt install gunicorn
sudo apt install gunicorn3 # python3
~~~



### Async Workers:

~~~shell
pip install greenlet	# required for both
pip install eventlet	# for eventlet workers
pip install gunicorn[evevtlet]	# or, using extra
pip install gevent	# for gevent workers
pip install gunicorn[gevent]	# or, using extra
~~~





# 2. Run

~~~shell
gunicorn3 -b 0.0.0.0:8000 <pro_name>.wsgi:application
~~~



# 3. configuration

~~~properties
配置有文件指定和命令行指定两种方式;
这里使用配置文件方式
~~~

~~~properties
[configuration file]
1. 配置文件必须有一个合法的 python文件后缀, .py
2.  配置文件没有什么语法, 里面定义的变量会作为命令行参数传递给gunicorn
~~~

~~~properties
# !/usr/bin/python3
import multiprocessing

bind = "0.0.0.0:8000"
workers = multiprocessing.cpu_count()*2 + 1
errorlog = "<path>"
accesslog = "<path>"
loglevel = "debug"
~~~

~~~properties
gunicorn3 -config <file> ...
gunicorn3 -c <file> ...
# <file>的格式可以是: PATH , file:PATH, python:MODULE_NAME
~~~



# 4. security

~~~properties
Gunicorn 提供了在服务器启动\请求到达前后的一系列动作, 用于提供自行log
~~~

