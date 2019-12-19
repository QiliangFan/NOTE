# 1. Django起步

~~~shell
django-admin #直接打，会给子指令的提示
django-admin   help    <command>  #给出相关指令的帮助
django-admin  startproject <projectname>   <directory>    #目录可用 .  表示当前目录，如果缺省，则名字为项目名
~~~



~~~python
#  __init__.py    =>   标识当前目录为django项目
#  settings.py  =>  全局配置文件
#   urls.py   =>   路由映射
#  wsgi.py   =>   完成wsgi规范的实现
~~~

~~~python
#settings.py
#中间有些url，点击可打开文档
# __file__  ： 表示当前文件
# os.path.dirname: 获取当前文件或 文件夹所在的文件夹路径
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# INSTALLED_APSS 即django项目中的应用，也即中间件，或叫拦截器
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'djangoweb.apps.DjangowebConfig',
]

#ROOT_URLCONF  根URL配置，所有url配置都从它开始（动态加载包）
ROOT_URLCONF = 'Django1.urls'

#TEMPLATES  前端模板的配置：（其中DIRS是主要配置项）
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# 数据库配置，注意安装mysql驱动，mysqlclient！
#windows  下由于编译环境的问题，安装mysqlclient可能会失败，即使装了相应编译环境仍可能失败
# 去网上找mysqlclient 相应的编译版本
# pip3 insatll  *.whl
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME':'django1',
        'USER':'root',
        'PASSWORD':'fanqiliang',
        'HOST':'127.0.0.1',
        'PORT':'3306'
    }
}
~~~

~~~shell
python3  manage.py   startapp   #创建一个app
#  __init__.py 空的
# admin.py  后台管理
#  app.py  
#  models.py   建立模块
#  tests.py   测试用
#  views.py  视图函数
#  migrations  该文件夹用来生成数据库表和更新数据库。
# 为了使用迁移功能，必须在settings.py 中配置app
# 其实一个app就是一个包
~~~

~~~python
#  django 中模型的字段类型，需要查手册
#当需要迁移时， 使用以下指令
python3 manage.py  makemigrations  # 提示 应用程序自己在app中建了一张表
python3 manage.py migrate
#settings.py  中配置的每个app 都会在迁移时在数据库中创建一个表
~~~

~~~python
# 后台管理 =>  创建超级管理员
python3  manage.py  createsuperuser  

# 本地化：  setttings.py 
LANGUAGE_CODE = 'zh-Hans'  # s 表示simple，简体
TIME_ZONE = 'Asia/Shanghai'
# 对于应用程序 和  mysql 时区不匹配造成的时间记录错误，可去查询相应方案。

# 输入  ip：端口/admin 进入管理员界面， 随后输入自己的管理员账号密码

# 注册应用模块
admin.site.register(User)  # 就可以通过这个Admin 修改表中数据

# 只是说明一下有这功能，愿不愿意用。。。
~~~



~~~python
#URL 映射  =>    urls.py   建立路由
from django.conf.urls import url  #请求路径字符串为正则表达式
from django.urls  import path   # 请求路径字符串为普通字符串
urlpatterns  = [
    url(r'^index$',view.index)
]
# 注意，在浏览器中，通过debug模式，可以看到，浏览器会在url后面自动加‘/’，从而会有个301跳转

#在某个py中，如view.py中，包装这些处理请求的汉书
def  func(request):     #参数必须为request才能处理请求
    pass 

# 1 如果返回HttpResponse ， 其参数为字符串，是最终显示在页面的内容。
from django.http import  HttpResponse  ,JsonResponse
def index(request):
    # return HttpResponse("Hello!")
    # return  JsonResponse(dict_obj)    第一个参数为一个dict类型的对象
~~~

~~~python
# 视图渲染  ——  返回HttpResponse 的简便写法
from django.shortcuts import render
def index(request):
    # return HttpResponse("hello")
    # return JsonResponse({"liang":"lovasxj"})
    return render(request,"index.html")
# 如果在render中传入context，context中有相应模板的值，就能对相应的模板进行渲染

def index(request):
    # return HttpResponse("hello")
    # return JsonResponse({"liang":"lovasxj"})
    context = {'test':"liangliang"}
    return render(request,"index.html",context)
~~~

# 2. DTL语法

~~~dtd
#! 变量：{{...}}
	1. 对于{{foo.bar}} , 以如下方式解释
		a. 将foo当作字典，将bar当作key
		b. 将foo当作对象，将bar当作属性值。
		c. 将foo当作列表，并使用数字下标取值  foo[bar]
如果变量未能找到，填入空字符串。

！注意：在模板变量中调用方法，不能带有参数，自然也不能传递参数
{{my_dict.keys}}
！dtl中绝对不可能有括号！
~~~

~~~dtd
#！逻辑
{%if  condition %}
	...
{% elif  condition  %}
	...
{% else %}
	...
{%  endif  %}
# end  \  or   \   not


~~~

~~~dtd
# !  循环, 在dtl中不支持用[] 取列表，所有的都用   .   来取
{%  for item in  list%}
	...
{% endfor %}

{% for k,v  in  dict.items%}
	...
{% endfor %}

{% for  item   in   list  reversed %}   #反向迭代
	...
{% endfor %}

{% for item in list %}
	...
{% empty %}  # 当列表为空时，执行下面的语句
	...
{% endfor  %}

# for 标签内的模板变量：
{{ forloop.counter }}  表示当前循环次数，从1开始
{{ forloop.counter0 }}  从0开始
{{ forloop.revcounter }}   包括当前元素，剩余的元素个数
{{ forloop.revcounter0 }}  不包括当前元素，剩余的元素个数
{{  forloop.first  }}   布尔值，第一次循环时为True
{{  forloop.last}}  布尔值，循环到最后一次时为False
{{  forloop.parentloop }}  获取到父循环的for循环模板变量
~~~



~~~dtd
# 注释
{#...#}     单行注释
{% comment %}
	...
{% endcomment %}   多行注释
~~~

## * 过滤器（管道流）

语法： {{变量 | 过滤器}}

~~~python
{{ name|lower  }}  小写
{{  list|first|upper }}  第一个元素大写
{{ bio| truncatewords:"30" }}  截取显示变量bio的前30个词  (注意 truncatechars和truncatewords的区别！)
{{ my_list | join: "," }}  将my_list中所有元素用，连接    #双引号单引号无所谓
~~~

模板中有什么用法，现场查询即可！

# 3. 多级路由

~~~python
# 主项目的urls.py 
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from .view import index


urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^index$',index),
    url(r'^$',index),
    url(r'^user',include('djangoweb.urls')),    #url映射中最后的斜杠加不加都会忽略的
]
~~~

~~~python
# app： djangoweb下创立的urls.py
from django.conf.urls import url
from .views import reg

urlpatterns = [
    url(r'^/reg$', reg),    # 多级路由中 url前面必须加  /
]
~~~

# 4. CSRF（Cross-Site  Request  Forgery 跨站请求伪造）

一般而言，我们通过nignix反响代理分发请求，django后台不会接受到csrf，故可在settings.py 中关闭csrf 的  middleware。 同时如果开启middlerware，也不利用postman进行测试接口。

# 5. HttpRequest 

~~~python
request.GET   #  获取请求中个体以get方式传送的数据
request.POST  #  获取请求中个体以post方式提交的表单
request.body   #  获取请求中以任意请求提交的其他格式的数据（如json）

当请求错误时，可以这样：
	return  HttpResponseBadRequest()  # 这样状态码是400
	return HttpResponseNotFound()   # 状态码404  
#更多 从 django.http  中找
~~~

# 6. 处理JSON ： simplejson

simplejson可以有效处理编码问题

# 7. ORM操作：

~~~python
# 获取管理器（先创建model  实体类如 User）
mgr  =  User.objects

# 增删查改
usr  =  mgr.filter(email=email)
mgr.save(usr)
。。。  # 需要时查询即可

#  小提示：
resultQuery.query  打印可以输出查询的sql语句

# 在filter 等查询操作中，使用如下语法实现逻辑比较
<字段>__<比较关键词> =  <要比较的值>
#比较关键词：
  exact 
  contains  (类似like)
 startswith
   endswith    #  注意：上面这些前面加i 如iexact 表示忽略大小写

isnull  
isnotnull    # filter(title_isnull=False)

gt  、  gte
lt 、 lte

# filter(fk__in = [1, 10 ,20])
in

# pubdate__year = 2000
year 、 month 、 day、week_day   、hour、minute、second 
~~~

~~~python
# Q对象
from django.db.models   import Q
User.objects.filter(Q(fk__lt= 6))   #不如直接fk=6
User.objects.filter(fk__lt=6).filter(gk__lt=10)   #与
User.objects.filter(Q(fk__lt=6)  &  Q(gk__lt=10))    #与
User.objects.filter(Q(fk__lt=6)  |   Q(gk__lt=10))     # 或
User.objects.filter(~Q(fk__lt=6))    #非
~~~



