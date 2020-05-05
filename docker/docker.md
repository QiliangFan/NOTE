# 1. install

~~~properties
sudo apt install docker docker.io containerd 
~~~



# 2. image

~~~shell
# 查看镜像
docker image ls

#拉取镜像
docker image pull alpine:latest # latest 为标签
docker image pull myname/demo:v2 # 从账户myname下拉取名为demo的镜像仓库

# 删除悬虚(dangling)镜像(没有标签的镜像, 列表中展示为 <none>:<none>)
docker image prune
docker image pune -a # 删除悬虚镜像和所有未被容器使用的镜像

# 搜索镜像
docker search <string> # 默认返回25行
docker search <string> -limit 40	# 最多100行

# 删除镜像
docker image rm <img_id>

# 上传镜像
sudo docker push myname/imagename
~~~

~~~properties
docker 镜像存储在镜像仓库服务中, 默认为Docker Hub
~~~



# 3. container

~~~shell
# 创建容器
docker [container] run -it <image>  --name <container_name> # -it 参数将当前终端连接到容器的shell终端之上
docker run -p 80:8000 -v /root:/run <image> # 将容器80端口映射到本机8000, 将容器/root挂载上本机/run
# 停止容器
docker [container] stop <contariner_name>

# 启动容器
docker [container] start <container_name>

# 删除容器
docker [container] rm <container_name>

# 查看容器运行状态
docker ps
~~~



# 4. Dockerfile

~~~shell
docker [image] build -t name/ubuntu:v1  . # 使用当前目录的Dockerfile, 并添加标签
docker build github.com/creack/docker # 使用url 表示的dockerfile
docker buiild -f /path/Dockerfile # 手动指定dockerfile路径
~~~

~~~dockerfile
# dockerfile 语法
FROM <基础镜像> # 如python:3, ubuntu, mysql:8.0

RUN <linux command> # 用于在镜像中执行指令, docker build时执行
# 每一个run都会生成一层, 为了减小容器应当尽可能少用run, 多用&&

COPY [--chown=<user>:<group>] <源路径>	<目标路径>  # 目标路径可以不存在, 会自动创建
# ADD与copy类似, 但如果复制的是压缩包, 除了复制, 还会打包

CMD <linux command> # 与run类似, 但是只在docker run时运行

ENV <key> <value>
ENV <k1>=<v1> <k2>=<v2>

WORKDIR <路径> # 指定工作目录, 由WORKDIR指定的工作目录, 在镜像的每一层都存在.(这个目录必须存在)
~~~



# 5. Docker Compose

#### 安装

~~~properties
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o 
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
~~~

#### 创建镜像(略过)



#### 创建docker-compose.yml

~~~yaml
# yaml 语法基础
1. 用缩进表示对象从属关系
2. "-"表示数组, 缩进量相同, 数组元素若是对象(数组), 可以再缩进一次
~~~

~~~yaml
#docker-compose.yml
version: '3'
services:
	web:
		build:	.
		command: python3 runserver 8000	# 容器启动时的默认命令
		ports:
			-	"5000:5000"
	redis:
		image: "redis:alpine"
	liang:
		build:
			context: ./dir
			dockerfile: Dockerfile
			target: prod		# production
			labels:	# image labels
				- "liang"
		dependes_on:	# 服务之间的而依赖关系
			-web
			
	db:
        image: mysql:latest
        volumes:
          - "./.mysql-data/db:/var/lib/mysql"
        restart: always
        ports:
          - 3306:3306
        environment:
          MYSQL_ROOT_PASSWORD: rootpw
          MYSQL_DATABASE: cabin
          MYSQL_USER: cabin
          MYSQL_PASSWORD: cabinpw
~~~

~~~properties
以上创建了两个服务, web服务从当前目录构建镜像, 然后绑定端口
redis服务使用公共镜像
~~~

#### 运行应用:

~~~properties
docker-compose build
docker-compose up
docker-compose up -d #后台执行
docker-compose exec web python3 manage.py migrate	# 等价于 docker exec
docker-compose stop
~~~

