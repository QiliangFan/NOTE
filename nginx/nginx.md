# 1. 基本操作

~~~properties
一旦nginx启动了, 可以使用以下指令来执行可执行文件
nginx -s <signal>
[signal有以下四个]
stop:fast shutdown
quit:graceful shutdown
reload:reloading the configuration file
reopen: reopening the log files
~~~

# 2. Serving static content

### server

~~~properties
[listen]
用来表示server监听的端口, 从而让Nginx决定服务使用哪个server
[location]
:root
request中的uri会被拼接到root指示的路径之后, 来获取得到本地的本地文件. 
优先匹配the longest prefix 的url路径
:proxy_pass
proxy_pass 后接:protocol, name, port
~~~

~~~nginx
server{
    listen 200;
    root /data/up ; # 当location 未提供root, 使用这个root
    location / {
        root /data/www ;  # /data/www/*
    }
    location /images/ {		# with a longer prefix!
        root /data ;   # /data/images/*
    }
    location /proxy/ {
        proxy_pass http://localhost:8000 ;
    }
    
    # 精确匹配 =
    # 前缀匹配 ^~（立刻停止后续的正则搜索）
    # 按文件中顺序的正则匹配 ~或~*
    # 匹配不带任何修饰的前缀匹配。
    location ~ \.(gif|jpg|png)$ {	# regular expression with ~; 
        root /data/imgas ;
    }
}
~~~



# 3. 路由跳转\路由重写

~~~properties
rewrite <regrex> <替换后的内容> [flag];
rewrite ^/(.*)	http://www.czlun.com/$1
# $1是括号匹配的内容
~~~

